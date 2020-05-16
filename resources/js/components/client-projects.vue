<template>
    <form>
        <div class="alert alert-danger" v-if="unknownError">
            Something went wrong!
        </div>
        <div class="form-group">
            <label for="projectTitle">Project Title</label>
            <input
                type="text"
                class="form-control"
                :class="{ 'is-invalid': validationErrors.title }"
                id="projectTitle"
                placeholder="Add title"
                v-model="project.title" />
            <div class="invalid-feedback" v-if="validationErrors.title">
                {{ validationErrors.title[0] }}
            </div>
        </div>
        <div class="form-group">
            <label for="projectDescription">Project Description</label>
            <textarea
                class="form-control"
                :class="{ 'is-invalid': validationErrors.description }"
                id="projectDescription"
                rows="3"
                v-model="project.description"
                placeholder="Add description for your project."
            ></textarea>
            <div class="invalid-feedback" v-if="validationErrors.description">
                {{ validationErrors.description[0] }}
            </div>
        </div>
         <div class="form-group">
            <label for="skills">Skills</label>
            <input
                type="text"
                class="form-control"
                :class="{ 'is-invalid': validationErrors.skills }"
                id="skills"
                placeholder="PHP, JavaScript, HTML"
                v-model="project.skills" />
            <div class="invalid-feedback" v-if="validationErrors.skills">
                {{ validationErrors.skills[0] }}
            </div>
        </div>
        <button class="btn btn-primary" @click.prevent="sendForm">Save Project</button>
    </form>
</template>

<script>
export default {
    props: {
        mode: {
            required: true,
            type: String,
        },
        projectId: {
            required: false,
            type: Number,
        },
    },
    data() {
        return {
            project: {
                title: '',
                description: '',
                skills: '',
            },
            unknownError: false,
            validationErrors: {
                title: '',
                description: '',
                skills: '',
            },
        };
    },
    created() {
        if (this.projectId === 0) {
            return;
        }

        axios.get('/projects/' + this.projectId + '/detail')
            .then(response => {
                this.project.title = response.data.title;
                this.project.description = response.data.description;
                this.project.skills = response.data.skills;
            })
            .catch(error => {
                console.log(error);
            });
    },
    methods: {
        sendForm() {

            let method = 'post';
            let project = this.project;

            if (this.mode === 'update') {
                method = 'put';
                project = {
                    ...this.project,
                    id: this.projectId,
                };
            }

            axios[method]('/projects/' + this.mode, project)
                .then(response => {
                    window.location.href = response.data.redirect;
                })
                .catch(error => {
                    if (error.response.status !== 422) {
                        this.unknownError = true;
                        return;
                    }

                    this.validationErrors = error.response.data.errors;
                });
        },
    },
}
</script>
