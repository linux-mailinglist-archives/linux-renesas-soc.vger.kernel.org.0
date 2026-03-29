Return-Path: <linux-renesas-soc+bounces-30556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBA7ISaOyWm1zAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 22:40:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 031F335406E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 22:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 875473007E3A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 20:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019703603E4;
	Sun, 29 Mar 2026 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0/S4hRI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03B12475CB;
	Sun, 29 Mar 2026 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774816676; cv=none; b=QqfL3xeORSGdI8DKo2XX5FMzOdRD3p3+/3rHKKGXa/w6H29DW+iYnYRyAkMENtMWs++ab3sChfVbzmB9BI9Mh+4UxnOLaQ8j0zCmhs+YrNAyHPZdQAbpKJcLec6iBv8GsqfEl7lxgdfJDb3rDQ371bw/hoRV9ZJANdWWfOL/HmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774816676; c=relaxed/simple;
	bh=aigITbTVLfuJBr/qVXIS60k4FHN1WCz0am2GEPJu+Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdUj75fQ0a/9KwaP2p/f/Md0IclZVNPWkR0IpCrnWzHG3LHcSJC7wEujF1ndwo7Dlii3tER8ihRtotNOxJlezFc29bU2KQmAnkjebRDt/uWwH7zU6xMNK6dome0dK9agsqVs5EOclCkaZgXhhErvjq8s3N9fZ2J48Qxs0P9eiqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0/S4hRI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774816674; x=1806352674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aigITbTVLfuJBr/qVXIS60k4FHN1WCz0am2GEPJu+Fc=;
  b=B0/S4hRIQKcRgxDSjIEb6PqyRQc5oyhoF1EmzWhKN2E+NNt1bzyv0F0y
   UVl6/iLApk6qJwk1r6c8VnT9jsGEEk8h/A4a8lfGqPYQWTBMsamtkO0FA
   4GUXgEImo20WgKjh/G0v6U2h6vUD3DmB2txKpvaITHowPXnWPPK2YB5Eu
   +piTM6zwXp2H3Y4LaQMANdQTdKv5BqUCtdUAHtk2oBGtDg0BL8QDd+40z
   91tKveSjP/QVlc+8uYJ3MGviTdh07AXFPXFydXzQXckpKWonVpjgBE7df
   cNGuyhrZ0SZBhXdb5On29wu18pQiEOJ50lMrVZUWkhQUxSto/24s/SXR/
   w==;
X-CSE-ConnectionGUID: bymfKwgRQlygIsbizChE4A==
X-CSE-MsgGUID: oFEIMaOySc2zSsJdWj3R7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="101270367"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="101270367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 13:37:54 -0700
X-CSE-ConnectionGUID: oaAaCG26SzS+JV5fgg6dBw==
X-CSE-MsgGUID: IHGeZN2OQoyAjWTle4KBOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="225865642"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Mar 2026 13:37:51 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6wtI-0000000009N-1iRH;
	Sun, 29 Mar 2026 20:37:48 +0000
Date: Mon, 30 Mar 2026 04:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Dege <michael.dege@renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>
Subject: Re: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan aware
 switching
Message-ID: <202603300436.ryIgiB0z-lkp@intel.com>
References: <20260327-rswitch_add_vlans-v2-13-d7f4358ca57a@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-rswitch_add_vlans-v2-13-d7f4358ca57a@renesas.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30556-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 031F335406E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Dege/net-renesas-rswitch-improve-port-change-mode-functions/20260329-154812
base:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
patch link:    https://lore.kernel.org/r/20260327-rswitch_add_vlans-v2-13-d7f4358ca57a%40renesas.com
patch subject: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan aware switching
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260330/202603300436.ryIgiB0z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300436.ryIgiB0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300436.ryIgiB0z-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/ethernet/renesas/rswitch_l2.o: in function `rswitch_port_obj_do_add_gwca':
>> drivers/net/ethernet/renesas/rswitch_l2.c:443:(.text+0x11e0): undefined reference to `br_vlan_enabled'
   aarch64-linux-ld: drivers/net/ethernet/renesas/rswitch_l2.o: in function `rswitch_port_obj_do_add':
   drivers/net/ethernet/renesas/rswitch_l2.c:412:(.text+0x135c): undefined reference to `br_vlan_enabled'
>> aarch64-linux-ld: drivers/net/ethernet/renesas/rswitch_l2.c:423:(.text+0x13bc): undefined reference to `br_vlan_enabled'


vim +443 drivers/net/ethernet/renesas/rswitch_l2.c

   402	
   403	static int rswitch_port_obj_do_add(struct net_device *ndev,
   404					   struct switchdev_obj_port_vlan *p_vlan)
   405	{
   406		struct rswitch_device *rdev = netdev_priv(ndev);
   407		struct rswitch_private *priv = rdev->priv;
   408		struct rswitch_etha *etha = rdev->etha;
   409		int err;
   410	
   411		/* Set Rswitch VLAN mode */
   412		iowrite32(br_vlan_enabled(rdev->brdev) ? FIELD_PREP(FWGC_SVM, C_TAG) : 0,
   413			  priv->addr + FWGC);
   414	
   415		err = rswitch_write_vlan_table(priv, p_vlan->vid, etha->index);
   416		if (err < 0)
   417			return err;
   418	
   419		/* If the default vlan for this port has been set, don't overwrite it. */
   420		if (ioread32(etha->addr + EAVCC))
   421			return NOTIFY_DONE;
   422	
 > 423		if (br_vlan_enabled(rdev->brdev))
   424			rswitch_modify(priv->addr, FWPC0(etha->index), 0, FWPC0_VLANSA | FWPC0_VLANRU);
   425	
   426		rswitch_modify(priv->addr, FWPC2(AGENT_INDEX_GWCA),
   427			       FIELD_PREP(FWPC2_LTWFW, BIT(etha->index)),
   428			       0);
   429	
   430		return rswitch_port_set_vlan_tag(etha, p_vlan, false);
   431	}
   432	
   433	static int rswitch_port_obj_do_add_gwca(struct net_device *ndev,
   434						struct rswitch_private *priv,
   435						struct switchdev_obj_port_vlan *p_vlan)
   436	{
   437		int err;
   438	
   439		if (!(p_vlan->flags & BRIDGE_VLAN_INFO_BRENTRY))
   440			return NOTIFY_DONE;
   441	
   442		/* Set Rswitch VLAN mode */
 > 443		iowrite32(br_vlan_enabled(ndev) ? FIELD_PREP(FWGC_SVM, C_TAG) : 0, priv->addr + FWGC);
   444	
   445		err = rswitch_write_vlan_table(priv, p_vlan->vid, AGENT_INDEX_GWCA);
   446		if (err < 0)
   447			return err;
   448	
   449		/* If the default vlan for this port has been set, don't overwrite it. */
   450		if (ioread32(priv->addr + GWVCC))
   451			return NOTIFY_DONE;
   452	
   453		return rswitch_gwca_set_vlan_tag(priv, p_vlan, false);
   454	}
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

