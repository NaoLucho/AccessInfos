<?php

namespace BuilderBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
/**
 * Menu
 *
 * @ORM\Table(name="g_list")
 * @ORM\Entity(repositoryClass="BuilderBundle\Repository\G_ListRepository")
 */
class G_List
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
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=255)
     */
    private $title;

    /**
    * @ORM\OneToMany(targetEntity="BuilderBundle\Entity\G_ListItem", mappedBy="list", cascade={"persist"}, orphanRemoval=true)
    * @ORM\OrderBy({"order" = "ASC"})
    */
    protected $listItems;
    
    
    
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


    public function __construct()
    {
        $this->listItems = new ArrayCollection();
    }

    public function getListItems()
    {
        return $this->listItems;
    }

    // /**
    //  * Set list item
    //  *
    //  * @param string $listItems
    //  *
    //  * @return List Item
    //  */
    // public function setListItems($listItems)
    // {
    //     if (count($listItems) > 0) {
    //         foreach ($listItems as $i) {
    //             $this->addLisItem($i);
    //         }
    //     }

    //     return $this;
    // }

    /**
     * Add listItem
     *
     * @param \BuilderBundle\Entity\G_ListItem $listItem
     *
     * @return G_List
     */
    public function addListItem(\BuilderBundle\Entity\G_ListItem $listItems)
    {
        $listItems->setList($this);
        $this->listItems[] = $listItems;

        return $this;
    }

    /**
     * Remove listItem
     *
     * @param \BuilderBundle\Entity\G_ListItem $listItem
     */
    public function removeListItem(\BuilderBundle\Entity\G_ListItem $listItem)
    {
        $this->listItems->removeElement($listItem);
    }

    /**
     * Set title
     *
     * @param string $title
     *
     * @return G_List
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }
}
