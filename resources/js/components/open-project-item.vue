<template>
    <li class="list-group-item">
        <div class="row">
            <div class="col-md-8 d-flex">
                <h5 class="mb-0 align-self-center">{{ project.title }}</h5>
            </div>
            <div class="col-md-4 text-right">
                <a class="btn btn-primary" :href="'/projects/' + project.id + '/show'">View</a>
            </div>
        </div>
    </li>
</template>

<script>
export default {
    props: {
        project: {
            required: true,
            type: Object,
        },
    },
}
</script>
