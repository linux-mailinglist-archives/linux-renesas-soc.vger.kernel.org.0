Return-Path: <linux-renesas-soc+bounces-9285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ACC98C3D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 18:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E400B1C23B90
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 16:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AF01CBE8A;
	Tue,  1 Oct 2024 16:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjjHXgQB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8A61B5827;
	Tue,  1 Oct 2024 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727801254; cv=none; b=mtmWZmbha/96AgwB+mcuaEvdossBtl0FJkmigWvFk6fryq2b1YmtVQz7P6tiundZTcYIBwpE+pTalUJZT2WsXFM/XxNWVFm4EP5d687+NI1UTWCWEo/Va0XTzdjzU07XU3Th5O4ZKelQkyc4d1BINjEoNdVdMgjeUCw+i0Axwd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727801254; c=relaxed/simple;
	bh=0GaRAREoBw3Gg86SCt+wqeMEvEPA48fIXoK9+rrfsak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cANLxmk1MLCaJT1j9yrueFrZE/GN+ZOAfQjQbRJ35Ch0CrJCqyanE33rMQUq6riHj7ey9t9AF5wD2r5X8p4ENlNwfFkUke0e2nQlqJ57dCDDeVMy1bmbQI3ZyJcCiNRxdthbrH4Sn6r12S0fdKQUX246rXxXerHWE6ZOkgHC+7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjjHXgQB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727801254; x=1759337254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0GaRAREoBw3Gg86SCt+wqeMEvEPA48fIXoK9+rrfsak=;
  b=KjjHXgQB12EnUCxOU+golO7Pl+a6xqTzYvFfayn88jZNoymmTQv2LHnN
   grcHOE+N0604n3QWlCqgfswVmYhP9SvalB91ZvM+JZDP0KQWugERfMGW4
   Bni08LGGFMFNX7g2kU0vf6LPrzNwTXTCbS/FsvE4AE68fx6xZanX6b1KD
   pME5LwyrWwvMmrsAKNmsrGvPdEX/Q4GSUGTZmcIBFdygdjxVEQPf8iXil
   dJ9wGFBBFRD3RRrqClCILT27fimv72rh/DnrcOzioBv4p9fn40e6JyreX
   yumtXytEZ1iADiGfnolT+ukY5RKeOLRwY34MjiNgP079RVxleTmdP6AUc
   A==;
X-CSE-ConnectionGUID: +iewspnFRVei33JsNdin2A==
X-CSE-MsgGUID: 4mU4jH4iR7ScjR/tt0XyRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="38080984"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="38080984"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 09:47:33 -0700
X-CSE-ConnectionGUID: GNaEC8gyQvysP9vsOCPE5A==
X-CSE-MsgGUID: edqf1jd6RqKpKAIBMPU4fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="74523638"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Oct 2024 09:47:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svg22-000Qvd-24;
	Tue, 01 Oct 2024 16:47:26 +0000
Date: Wed, 2 Oct 2024 00:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Barker <paul@pbarker.dev>, Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH 11/11] net: ravb: Add VLAN checksum support
Message-ID: <202410020057.Z9KJHqVt-lkp@intel.com>
References: <20240930160845.8520-12-paul@pbarker.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930160845.8520-12-paul@pbarker.dev>

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Barker/net-ravb-Factor-out-checksum-offload-enable-bits/20241001-001351
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240930160845.8520-12-paul%40pbarker.dev
patch subject: [net-next PATCH 11/11] net: ravb: Add VLAN checksum support
config: arc-randconfig-r123-20241001 (https://download.01.org/0day-ci/archive/20241002/202410020057.Z9KJHqVt-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241002/202410020057.Z9KJHqVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020057.Z9KJHqVt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/renesas/ravb_main.c:2076:17: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/renesas/ravb_main.c: note: in included file (through include/linux/mutex.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +2076 drivers/net/ethernet/renesas/ravb_main.c

  2063	
  2064	static bool ravb_can_tx_csum_gbeth(struct sk_buff *skb)
  2065	{
  2066		u16 net_protocol = ntohs(skb->protocol);
  2067	
  2068		/* GbEth IP can calculate the checksum if:
  2069		 * - there are zero or one VLAN headers with TPID=0x8100
  2070		 * - the network protocol is IPv4 or IPv6
  2071		 * - the transport protocol is TCP, UDP or ICMP
  2072		 * - the packet is not fragmented
  2073		 */
  2074	
  2075		if (skb_vlan_tag_present(skb) &&
> 2076		    (skb->vlan_proto != ETH_P_8021Q || net_protocol == ETH_P_8021Q))
  2077			return false;
  2078	
  2079		if (net_protocol == ETH_P_8021Q) {
  2080			struct vlan_hdr vhdr, *vh;
  2081	
  2082			vh = skb_header_pointer(skb, ETH_HLEN, sizeof(vhdr), &vhdr);
  2083			if (!vh)
  2084				return false;
  2085	
  2086			net_protocol = ntohs(vh->h_vlan_encapsulated_proto);
  2087		}
  2088	
  2089		switch (net_protocol) {
  2090		case ETH_P_IP:
  2091			switch (ip_hdr(skb)->protocol) {
  2092			case IPPROTO_TCP:
  2093			case IPPROTO_UDP:
  2094			case IPPROTO_ICMP:
  2095				return true;
  2096			}
  2097			break;
  2098	
  2099		case ETH_P_IPV6:
  2100			switch (ipv6_hdr(skb)->nexthdr) {
  2101			case IPPROTO_TCP:
  2102			case IPPROTO_UDP:
  2103			case IPPROTO_ICMPV6:
  2104				return true;
  2105			}
  2106		}
  2107	
  2108		return false;
  2109	}
  2110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

