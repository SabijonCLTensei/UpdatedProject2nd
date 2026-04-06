const API_URL = 'http://localhost:5001/api';

export async function login(loginData) {
    const response = await fetch(`${API_URL}/users/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(loginData)
    });
    return await response.json();
}

export async function register(userData) {
    const response = await fetch(`${API_URL}/users/register`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(userData)
    });
    return await response.json();
}

export async function getHistory(user_id) {
    const response = await fetch(`${API_URL}/users/activity/${user_id}`);
    return await response.json();
}

export async function getHelp() {
    const response = await fetch(`${API_URL}/users/help`);
    return await response.json();
}

export async function getAllUsers() {
    const response = await fetch(`${API_URL}/users/all-users`);
    return await response.json();
}

export async function deleteUser(user_id) {
    const response = await fetch(`${API_URL}/users/${user_id}`, {
        method: 'DELETE'
    });
    return await response.json();
}

export async function updateUser(user_id, userData) {
    const response = await fetch(`${API_URL}/users/${user_id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(userData)
    });
    return await response.json();
}

export async function revertPassword(encrypted_pass) {
    const response = await fetch(`${API_URL}/users/revert-password`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ encrypted_pass })
    });
    return await response.json();
}

export async function getNotes(user_id, search = '', searchBy = 'all') {
    const response = await fetch(`${API_URL}/notes?user_id=${user_id}&search=${search}&searchBy=${searchBy}`);
    return await response.json();
}

export async function saveNote(note) {
    const response = await fetch(`${API_URL}/notes`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(note)
    });
    return await response.json();
}

export async function deleteNote(id, user_id) {
    const response = await fetch(`${API_URL}/notes/${id}?user_id=${user_id}`, {
        method: 'DELETE'
    });
    return await response.json();
}

export async function getCategories() {
    const response = await fetch(`${API_URL}/categories`);
    return await response.json();
}

export async function saveCategory(name, user_id) {
    const response = await fetch(`${API_URL}/categories`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name, user_id })
    });
    return await response.json();
}

// Extra Features
export async function addTag(note_id, user_id, tag_name) {
    return await fetch(`${API_URL}/extra/tags`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ note_id, user_id, tag_name })
    }).then(r => r.json());
}

export async function getComments(note_id) {
    return await fetch(`${API_URL}/extra/comments/${note_id}`).then(r => r.json());
}

export async function saveComment(note_id, user_id, content) {
    return await fetch(`${API_URL}/extra/comments`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ note_id, user_id, content })
    }).then(r => r.json());
}

export async function saveReminder(note_id, reminder_time) {
    return await fetch(`${API_URL}/extra/reminders`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ note_id, reminder_time })
    }).then(r => r.json());
}

export async function shareNote(note_id, target_username, permission) {
    return await fetch(`${API_URL}/extra/share`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ note_id, target_username, permission })
    }).then(r => r.json());
}

export async function emailNote(note_id, email) {
    return await fetch(`${API_URL}/extra/email`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ note_id, email })
    }).then(r => r.json());
}

export async function syncGmail(user_id, email) {
    return await fetch(`${API_URL}/extra/sync?user_id=${user_id}&email=${email}`).then(r => r.json());
}
