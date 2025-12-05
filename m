Return-Path: <linux-renesas-soc+bounces-25589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E88CA6B41
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 09:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BD9735F4576
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 08:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B84B347BB5;
	Fri,  5 Dec 2025 07:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YN4U+8QL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66613446BE;
	Fri,  5 Dec 2025 07:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764920155; cv=none; b=JBKbhknB+GgwWFIzk3Nh5BpTJdvLmWjmoLzToCkhc4I2UwuQpzREo0VzVCjKhz2djpYRadem75A/hPnUXPY4qYu5XROSqbrvinoAlP9W9XuJ2UO/6qJYzlINC4jOWHtweV1tvsUgtLhzpqA9dQG4svxD/8xR9EnRH449Xo9d6cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764920155; c=relaxed/simple;
	bh=B9QRLerKUZuioET/eoNvwh5XUQQ87E4QpHl1AODiIe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zi91plmW9UTdc6GJCBkeiYHmNAjQHikZqGUH366Ru28ffwR2VlG0gsd+70pGNjW5Yoft8e60Z5+yEtoWipKSrlSA/FqNGoTMRsaioypfECgE+ueFWbjvUjNBLloAxBFnhOBwPSWKHIsukChSOforBYQAzqEurxeJpLKgdXZzjVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YN4U+8QL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764920146; x=1796456146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B9QRLerKUZuioET/eoNvwh5XUQQ87E4QpHl1AODiIe0=;
  b=YN4U+8QLrx8LPZzvTXWQP/cQ5hLvS9vuzKzPGGpPsMQgW5SZk1J/vkW0
   //X1Wqv0KsqmgQrH/AecjkSmWzn42KaIdSppXltwr4WANmmBOk4pTnGeN
   D2/jMyRIpkiz8NOmBg3wh6cIs3ne7r7FfdYFaK9JDDgfTHYlayShuabJt
   S0Imp3yUxpoLP2e+x7KUP44EF5YMIgFKx1kH5OCOukWDfLlKB9ah/TcFq
   lertyFsxxjwN46iOPpbQezI3FwwzPYtgAPc2KZVavqp9Rg/WoKUPqmrQX
   mLD6DXPCC/z6vxQ3EQXJz1dkFFZCr7GAnDvOHgBOPrzn0AWgDTU2PAfyR
   g==;
X-CSE-ConnectionGUID: WUfFP73PT7OgAteh0TjPUQ==
X-CSE-MsgGUID: qO9At1EURFiTs0/wL82ExQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="67115979"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="67115979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 23:35:38 -0800
X-CSE-ConnectionGUID: 36lLXBZ8Sle57DGmoYz7cA==
X-CSE-MsgGUID: xBDUVo0SSMaMwUFy8sQe8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="199707840"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Dec 2025 23:35:33 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRQLi-00000000EkP-2ss7;
	Fri, 05 Dec 2025 07:35:30 +0000
Date: Fri, 5 Dec 2025 15:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>,
	prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be
Cc: oe-kbuild-all@lists.linux.dev, biju.das.jz@bp.renesas.com,
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk,
	magnus.damm@gmail.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: add physical port
 identification support
Message-ID: <202512051514.VMlIccSV-lkp@intel.com>
References: <20251204163729.3036329-2-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204163729.3036329-2-john.madieu.xa@bp.renesas.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net/main linus/master v6.18 next-20251204]
[cannot apply to net-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Madieu/dt-bindings-net-renesas-gbeth-Add-port-id-property/20251205-013825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251204163729.3036329-2-john.madieu.xa%40bp.renesas.com
patch subject: [PATCH net-next 1/3] net: stmmac: add physical port identification support
config: parisc-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051514.VMlIccSV-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051514.VMlIccSV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051514.VMlIccSV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/stmicro/stmmac/norm_desc.c:11:
>> include/linux/stmmac.h:273:12: warning: 'struct netdev_phys_item_id' declared inside parameter list will not be visible outside of this definition or declaration
        struct netdev_phys_item_id *ppid);
               ^~~~~~~~~~~~~~~~~~~


vim +273 include/linux/stmmac.h

   188	
   189	struct plat_stmmacenet_data {
   190		int bus_id;
   191		int phy_addr;
   192		/* MAC ----- optional PCS ----- SerDes ----- optional PHY ----- Media
   193		 *                                       ^
   194		 *                                  phy_interface
   195		 *
   196		 * The Synopsys dwmac core only covers the MAC and an optional
   197		 * integrated PCS. Where the integrated PCS is used with a SerDes,
   198		 * e.g. for 1000base-X or Cisco SGMII, the connection between the
   199		 * PCS and SerDes will be TBI.
   200		 *
   201		 * Where the Synopsys dwmac core has been instantiated with multiple
   202		 * interface modes, these are selected via core-external configuration
   203		 * which is sampled when the dwmac core is reset. How this is done is
   204		 * platform glue specific, but this defines the interface used from
   205		 * the Synopsys dwmac core to the rest of the SoC.
   206		 *
   207		 * Where PCS other than the optional integrated Synopsys dwmac PCS
   208		 * is used, this counts as "the rest of the SoC" in the above
   209		 * paragraph.
   210		 *
   211		 * phy_interface is the PHY-side interface - the interface used by
   212		 * an attached PHY or SFP etc. This is equivalent to the interface
   213		 * that phylink uses.
   214		 */
   215		phy_interface_t phy_interface;
   216		struct stmmac_mdio_bus_data *mdio_bus_data;
   217		struct device_node *phy_node;
   218		struct fwnode_handle *port_node;
   219		struct device_node *mdio_node;
   220		struct stmmac_dma_cfg *dma_cfg;
   221		struct stmmac_safety_feature_cfg *safety_feat_cfg;
   222		int clk_csr;
   223		int has_gmac;
   224		int enh_desc;
   225		int tx_coe;
   226		int rx_coe;
   227		int bugged_jumbo;
   228		int pmt;
   229		int force_sf_dma_mode;
   230		int force_thresh_dma_mode;
   231		int riwt_off;
   232		int max_speed;
   233		int maxmtu;
   234		int multicast_filter_bins;
   235		int unicast_filter_entries;
   236		int tx_fifo_size;
   237		int rx_fifo_size;
   238		u32 host_dma_width;
   239		u32 rx_queues_to_use;
   240		u32 tx_queues_to_use;
   241		u8 rx_sched_algorithm;
   242		u8 tx_sched_algorithm;
   243		struct stmmac_rxq_cfg rx_queues_cfg[MTL_MAX_RX_QUEUES];
   244		struct stmmac_txq_cfg tx_queues_cfg[MTL_MAX_TX_QUEUES];
   245		void (*get_interfaces)(struct stmmac_priv *priv, void *bsp_priv,
   246				       unsigned long *interfaces);
   247		int (*set_clk_tx_rate)(void *priv, struct clk *clk_tx_i,
   248				       phy_interface_t interface, int speed);
   249		void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
   250		int (*fix_soc_reset)(struct stmmac_priv *priv, void __iomem *ioaddr);
   251		int (*serdes_powerup)(struct net_device *ndev, void *priv);
   252		void (*serdes_powerdown)(struct net_device *ndev, void *priv);
   253		int (*mac_finish)(struct net_device *ndev,
   254				  void *priv,
   255				  unsigned int mode,
   256				  phy_interface_t interface);
   257		void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
   258		int (*init)(struct platform_device *pdev, void *priv);
   259		void (*exit)(struct platform_device *pdev, void *priv);
   260		int (*suspend)(struct device *dev, void *priv);
   261		int (*resume)(struct device *dev, void *priv);
   262		struct mac_device_info *(*setup)(void *priv);
   263		int (*clks_config)(void *priv, bool enabled);
   264		int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
   265				   void *ctx);
   266		void (*dump_debug_regs)(void *priv);
   267		int (*pcs_init)(struct stmmac_priv *priv);
   268		void (*pcs_exit)(struct stmmac_priv *priv);
   269		struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,
   270						  phy_interface_t interface);
   271		/* Physical port identification callbacks (optional, for glue driver override) */
   272		int (*get_phys_port_id)(struct net_device *ndev,
 > 273					struct netdev_phys_item_id *ppid);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

