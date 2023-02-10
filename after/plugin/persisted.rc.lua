local status, persisted = pcall(require, 'persisted')

if (not status) then return end

persisted.setup(
    {
        silent=false,
        use_git_branch=true,
        autoload=true,
        follow_cwd=true,
    }
)
require("telescope").load_extension("persisted") -- To load the telescope extension
