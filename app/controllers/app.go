package controllers

import (
	"github.com/revel/revel"
	"net/http"
	"encoding/json"
	"fmt"
	"os"
)

type App struct {
	*revel.Controller
}

func (c App) Index() revel.Result {
	return c.Redirect("/pingAll")
}

func (c App) PingAll() revel.Result {
	url := os.Getenv("COMPONENT_STATUS_URL")
	if url == "" {
		url = "http://dummy/pingAll"
	}

	// Make http call to component status
	resp, _ := http.Get(url)
	// render into view
	defer resp.Body.Close()
	var services map[string]bool
	json.NewDecoder(resp.Body).Decode(&services)
	fmt.Println(services)

	return c.Render(services)
}
