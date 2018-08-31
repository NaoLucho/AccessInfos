<?php

namespace BuilderBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Menu_Page
 *
 * @ORM\Table(name="app_menu_page")
 * @ORM\Entity(repositoryClass="BuilderBundle\Repository\Menu_PageRepository")
 */
class Menu_Page
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="BuilderBundle\Entity\Menu", inversedBy="menuPages")
     * @ORM\JoinColumn(name="menu_id", referencedColumnName="id", nullable=false)
     */
    private $menu;

    /**
     * @ORM\ManyToOne(targetEntity="BuilderBundle\Entity\Page")
     * @ORM\JoinColumn(name="page_id", referencedColumnName="id", nullable=false)
     */
    private $page;

    /**
     * @var string
     *
     * @ORM\Column(name="position", type="string", length=255)
     */
    private $position;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set menu
     *
     * @param mixed $menu
     *
     * @return Menu_Page
     */
    public function setMenu($menu)
    {
        $this->menu = $menu;

        return $this;
    }

    /**
     * Get menu
     *
     * @return mixed
     */
    public function getMenu()
    {
        return $this->menu;
    }

    /**
     * @return mixed
     */
    public function getPage()
    {
        return $this->page;
    }

    /**
     * @param mixed $page
     *
     * @return $this
     */
    public function setPage($page)
    {
        $this->page = $page;

        return $this;
    }

    /**
     * Set position
     *
     * @param string $position
     *
     * @return Menu_Position
     */
    public function setPosition($position)
    {
        $this->position = $position;

        return $this;
    }

    /**
     * Get position
     *
     * @return string
     */
    public function getPosition()
    {
        return $this->position;
    }
}

