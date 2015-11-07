require 'json'

dependencies_file = File.open('dependencies.json', 'r')
all_packages_file = File.open('all_packages.json', 'r')

dependencies = JSON.parse(dependencies_file.read)['dependencies']
ALL_PACKAGES = JSON.parse(all_packages_file.read)

def install_library(library)
	if File.directory?("installed_modules/#{library}")
		puts "#{library} is already installed."
	else
		puts "Installing #{library}."
		if ALL_PACKAGES[library].any?
			puts "In order to install #{library}, we need #{ALL_PACKAGES[library].join(' and ')}."
		end

		ALL_PACKAGES[library].each do |dependency|
			if File.directory?("installed_modules/#{dependency}")
				puts "#{dependency} is already installed."
			else
				install_library(dependency)
			end
		end

		Dir.mkdir("installed_modules/#{library}")
	end
end

dependencies.each { |dependency| install_library(dependency) }
puts "All done."