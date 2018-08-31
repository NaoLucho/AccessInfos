<?php

namespace BuilderBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
/**
 * Menu
 *
 * @ORM\Table(name="g_listitem")
 * @ORM\Entity(repositoryClass="BuilderBundle\Repository\G_ListItemRepository")
 */
class G_ListItem
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
     * @ORM\Column(name="icon", type="string", length=255 , nullable=true)
     */
    private $icon;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=1024 , nullable=true)
     */
    private $description;

    /**
    * @ORM\ManyToOne(targetEntity="BuilderBundle\Entity\G_ListItem")
    * @ORM\JoinColumn(name="parent_id", referencedColumnName="id", nullable=true)
    */
    protected $parent;

    /**
    * @ORM\ManyToOne(targetEntity="BuilderBundle\Entity\G_List", inversedBy="listItems")
    * @ORM\JoinColumn(name="list_id", referencedColumnName="id", nullable=false)
    */
    protected $list;

    /**
     * @var integer
     *
     * @ORM\Column(name="elem_order", type="integer")
     */
    private $order;

    public function getList()
    {
        return $this->list;
    }
    
    /**
     * @param mixed $list
     *
     * @return $list
     */
    public function setList($list)
    {
        $this->list = $list;

        return $this;
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

    /**
     * Set icon
     *
     * @param string $icon
     *
     * @return G_ListItem
     */
    public function setIcon($icon)
    {
        $this->icon = $icon;

        return $this;
    }

    /**
     * Get icon
     *
     * @return string
     */
    public function getIcon()
    {
        return $this->icon;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return G_ListItem
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set parent
     *
     * @param \BuilderBundle\Entity\G_ListItem $parent
     *
     * @return G_ListItem
     */
    public function setParent(\BuilderBundle\Entity\G_ListItem $parent = null)
    {
        $this->parent = $parent;

        return $this;
    }

    /**
     * Get parent
     *
     * @return \BuilderBundle\Entity\G_ListItem
     */
    public function getParent()
    {
        return $this->parent;
    }


    /**
     * Set order
     *
     * @param string $order
     *
     * @return F_FormField
     */
    public function setOrder($order)
    {
        $this->order = $order;

        return $this;
    }

    /**
     * Get order
     *
     * @return string
     */
    public function getOrder()
    {
        return $this->order;
    }
}
