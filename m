Return-Path: <linux-renesas-soc+bounces-23540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C05CC03390
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 21:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D3A83B2BDE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 19:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D45234D934;
	Thu, 23 Oct 2025 19:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXAlWtw9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05C1347BC3;
	Thu, 23 Oct 2025 19:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249018; cv=none; b=bmzR8Jk0gQ0yJ7cglNwYNaCP0oHy/W56HaPbx0I+u7d1zW1CLOWLRR8IT9kLVV+4x/GHN7AW8oQf1pAmvovUhU16acgYyGoOY3koHdzd+ZGaaPjWxHNbWsbLvH3c/HlHJHuK93nVhzR2LBexwx8MuvJpUMEP+N81fj9jDo89Dz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249018; c=relaxed/simple;
	bh=4GgD8rXzGcd0V4eTBPz9wgSl28VHshWZ5xyM0DTjwes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Agj28hBn8ZFu7KxSAxtrIFyddWe9ITutUCv+f5Nuy+Fyv1vPxe4y7uqxeI8W1DaRP8s1T2SDf3fVgtmuijebcZgD39yUZiyoAEv23pA3ylRvL65CqtXxgmTkq6V6JVmphM40v9fklRcgI9n8u+YZ1qXXb2YM0a8InxMoK0bvlMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXAlWtw9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761249018; x=1792785018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4GgD8rXzGcd0V4eTBPz9wgSl28VHshWZ5xyM0DTjwes=;
  b=jXAlWtw9O1N/hmdHP+L6wWgUhmkaWFuEuN9Kde5UxKP5wrlD6s3uR42G
   98jGWMvh2440X9mEjqFSfj7JLC8WBg2QX9vMX01fxM1qSGcM+SWD5luCP
   5TWsddfm1QtsA7h/rRDhA9RQY5PMXisDftNsRwwImXGceKQWzRD3KRBSq
   fEJsyDF7xCWjTOMOVnz4POp5+82H0rTwKQcLf0MmpQ8uB1MrlQ7nSyjM2
   xui5XTI4aRXXCATW68mv0Ndy3r9BZuz40O1PXgWsHT2wi7ZkRYr82skeq
   I64mXwT0kiVl09c3lU7edGf4LeUT7xUcuM6sQLJuMK6MWTk6Yweh1dHTm
   Q==;
X-CSE-ConnectionGUID: PVSor8bLSGa/APeyslzlHg==
X-CSE-MsgGUID: KRJa+DPAQwOeYq5yeY3Sag==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73719734"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="73719734"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 12:50:17 -0700
X-CSE-ConnectionGUID: QqnZZascSZOxoU53Pwz9pA==
X-CSE-MsgGUID: utWaX7cHQSidqSJVHTZSqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="183950468"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Oct 2025 12:50:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vC1Jt-000Dp9-2V;
	Thu, 23 Oct 2025 19:50:00 +0000
Date: Fri, 24 Oct 2025 03:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH net-next v4 3/6] ionic: convert to ndo_hwtstamp API
Message-ID: <202510240344.2MuPn70o-lkp@intel.com>
References: <20251022104900.901973-4-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022104900.901973-4-vadim.fedorenko@linux.dev>

Hi Vadim,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/octeontx2-convert-to-ndo_hwtstamp-API/20251022-185103
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251022104900.901973-4-vadim.fedorenko%40linux.dev
patch subject: [PATCH net-next v4 3/6] ionic: convert to ndo_hwtstamp API
config: x86_64-randconfig-001-20251024 (https://download.01.org/0day-ci/archive/20251024/202510240344.2MuPn70o-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240344.2MuPn70o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240344.2MuPn70o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/pensando/ionic/ionic_lif.c:2821:22: error: use of undeclared identifier 'ionic_hwstamp_get'; did you mean 'ionic_lif_hwstamp_get'?
    2821 |         .ndo_hwtstamp_get       = ionic_hwstamp_get,
         |                                   ^~~~~~~~~~~~~~~~~
         |                                   ionic_lif_hwstamp_get
   drivers/net/ethernet/pensando/ionic/ionic_lif.h:384:19: note: 'ionic_lif_hwstamp_get' declared here
     384 | static inline int ionic_lif_hwstamp_get(struct ionic_lif *lif, struct ifreq *ifr)
         |                   ^
>> drivers/net/ethernet/pensando/ionic/ionic_lif.c:2822:22: error: use of undeclared identifier 'ionic_hwstamp_set'; did you mean 'ionic_lif_hwstamp_set'?
    2822 |         .ndo_hwtstamp_set       = ionic_hwstamp_set,
         |                                   ^~~~~~~~~~~~~~~~~
         |                                   ionic_lif_hwstamp_set
   drivers/net/ethernet/pensando/ionic/ionic_lif.h:379:19: note: 'ionic_lif_hwstamp_set' declared here
     379 | static inline int ionic_lif_hwstamp_set(struct ionic_lif *lif, struct ifreq *ifr)
         |                   ^
>> drivers/net/ethernet/pensando/ionic/ionic_lif.c:2821:22: error: incompatible function pointer types initializing 'int (*)(struct net_device *, struct kernel_hwtstamp_config *)' with an expression of type 'int (struct ionic_lif *, struct ifreq *)' [-Wincompatible-function-pointer-types]
    2821 |         .ndo_hwtstamp_get       = ionic_hwstamp_get,
         |                                   ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/pensando/ionic/ionic_lif.c:2822:22: error: incompatible function pointer types initializing 'int (*)(struct net_device *, struct kernel_hwtstamp_config *, struct netlink_ext_ack *)' with an expression of type 'int (struct ionic_lif *, struct ifreq *)' [-Wincompatible-function-pointer-types]
    2822 |         .ndo_hwtstamp_set       = ionic_hwstamp_set,
         |                                   ^~~~~~~~~~~~~~~~~
   4 errors generated.


vim +2821 drivers/net/ethernet/pensando/ionic/ionic_lif.c

  2797	
  2798	static const struct net_device_ops ionic_netdev_ops = {
  2799		.ndo_open               = ionic_open,
  2800		.ndo_stop               = ionic_stop,
  2801		.ndo_start_xmit		= ionic_start_xmit,
  2802		.ndo_bpf		= ionic_xdp,
  2803		.ndo_xdp_xmit		= ionic_xdp_xmit,
  2804		.ndo_get_stats64	= ionic_get_stats64,
  2805		.ndo_set_rx_mode	= ionic_ndo_set_rx_mode,
  2806		.ndo_set_features	= ionic_set_features,
  2807		.ndo_set_mac_address	= ionic_set_mac_address,
  2808		.ndo_validate_addr	= eth_validate_addr,
  2809		.ndo_tx_timeout         = ionic_tx_timeout,
  2810		.ndo_change_mtu         = ionic_change_mtu,
  2811		.ndo_vlan_rx_add_vid    = ionic_vlan_rx_add_vid,
  2812		.ndo_vlan_rx_kill_vid   = ionic_vlan_rx_kill_vid,
  2813		.ndo_set_vf_vlan	= ionic_set_vf_vlan,
  2814		.ndo_set_vf_trust	= ionic_set_vf_trust,
  2815		.ndo_set_vf_mac		= ionic_set_vf_mac,
  2816		.ndo_set_vf_rate	= ionic_set_vf_rate,
  2817		.ndo_set_vf_spoofchk	= ionic_set_vf_spoofchk,
  2818		.ndo_get_vf_config	= ionic_get_vf_config,
  2819		.ndo_set_vf_link_state	= ionic_set_vf_link_state,
  2820		.ndo_get_vf_stats       = ionic_get_vf_stats,
> 2821		.ndo_hwtstamp_get	= ionic_hwstamp_get,
> 2822		.ndo_hwtstamp_set	= ionic_hwstamp_set,
  2823	};
  2824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

