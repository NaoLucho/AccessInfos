<?php

namespace BuilderBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
/**
 * Menu
 *
 * @ORM\Table(name="app_menu")
 * @ORM\Entity(repositoryClass="BuilderBundle\Repository\MenuRepository")
 */
class Menu
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
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity="BuilderBundle\Entity\Menu_Page", mappedBy="menu", cascade={"persist"}, orphanRemoval=true)
     * @ORM\OrderBy({"position" = "ASC"})
     */
    private $menuPages;
    
    public function __construct()
    {
        $this->menuPages = new ArrayCollection();
    }

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
     * Set name
     *
     * @param string $name
     *
     * @return Menu
     */
    public function setName($name)
    {
        $this->name = $name;
        
        return $this;
    }
    
    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }
    
    public function getMenuPages()
    {
        return $this->menuPages;
    }

    /**
     * Set menu pages
     *
     * @param string $MenuPages
     *
     * @return Menu Page
     */
    public function setMenuPages($menuPages)
    {
        if (count($menuPages) > 0) {
            foreach ($menuPages as $i) {
                $this->addMenuPages($i);
            }
        }

        return $this;
    }

    /**
     * Add menuPages
     *
     * @param \BuilderBundle\Entity\Menu_Page $menuPages
     *
     * @return G_List
     */
    public function addMenuPage(\BuilderBundle\Entity\Menu_Page $menuPages)
    {
        $menuPages->setMenu($this);
        $this->menuPages[] = $menuPages;

        return $this;
    }

    /**
     * Remove menuPages
     *
     * @param \BuilderBundle\Entity\Menu_Page $menuPages
     */
    public function removeMenuPage(\BuilderBundle\Entity\Menu_Page $menuPages)
    {
        $this->menuPages->removeElement($menuPages);
    }
}

