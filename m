Return-Path: <linux-renesas-soc+bounces-29843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ADYJcZTu2lMigIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 02:39:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED56D2C4922
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 02:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3420B31B1FB5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 01:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276A830E836;
	Thu, 19 Mar 2026 01:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMYN3DIp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E331AABF;
	Thu, 19 Mar 2026 01:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773884115; cv=none; b=sh2c6EFmP5Unudvahsk3vNLWtnlqgAMYcvBSseB4ex/sgMocqja+dMRZgNr0nMarlm0qKTaYYmgIOJwHiRDpBLh3VAqb7kDj09moOYYtXTuayKxPJyXXnkhR/eNljQg6KTyJeZz80ve3RwECuUG6l7M01GhgulfH8ENm+g8VdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773884115; c=relaxed/simple;
	bh=o2JIB0ulYpFLO2G8cREBI30pejf2WQk+5r824J/EsHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8JHewvRSivKW3yJASww8VUu6z+ZqWOyrxgDbtE2G90zXfEG1AML3zKlRVtffwEY+p3K3PiY2Ed4hSGTiH6WtZoo1e3OFSIzLtg6C8NxdbJNvcJcS6ZNuhEuEnjoXYpBqLbwkssx1Cz2o8etnalWq8H5Wdks0b+XfLuw44TzAKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMYN3DIp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773884108; x=1805420108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o2JIB0ulYpFLO2G8cREBI30pejf2WQk+5r824J/EsHk=;
  b=GMYN3DIpoXA/BJQXK6+AvFJyNYwA+v2+ug1QMD1BRBd2Kt4Si5TeUVou
   wJfrsHOVDiO8J4tTpyHh3VQOkWfr9McZYR3Lc5w+ikLD6QRuCZ7BPN+XE
   n/q/ULB//mNzTRCFM9oSnfB+DzBXyQYFgrQjymK9Qrrclhgr5e7uSM/P3
   L6T/oESdbKcGRfW0rGiQl5FVMHLqJYxLP+4XOySNK7pzg5jY6tZoUShru
   WyzVegnNqyg356KqsWt5jKEsKcdDwqiZSKg0NWj8lVXBDFFm2UiQZtG9n
   1mrmTjaHrjVYz92HYrbBiq8yNzqJ4K2snjiVzDnWX9mO6WRmgJrPPiJUX
   w==;
X-CSE-ConnectionGUID: VjVRThggSi2JKRh2ryxKJA==
X-CSE-MsgGUID: 4YBh9j4LToubUijP5ht0Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85654856"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="85654856"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 18:35:07 -0700
X-CSE-ConnectionGUID: GJ3uzMY6RiOAvlWDLhrMfA==
X-CSE-MsgGUID: BeRjQjWMTnWCv8JRw8FEdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="218322706"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Mar 2026 18:35:04 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w32Ht-000000000B3-28tK;
	Thu, 19 Mar 2026 01:35:01 +0000
Date: Thu, 19 Mar 2026 09:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Dege <michael.dege@renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>
Subject: Re: [PATCH net-next 13/13] net: renesas: rswitch: add vlan aware
 switching
Message-ID: <202603190927.5oLw58VC-lkp@intel.com>
References: <20260317-rswitch_add_vlans-v1-13-3a57bfa0f2d1@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-rswitch_add_vlans-v1-13-3a57bfa0f2d1@renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29843-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	NEURAL_HAM(-0.00)[-0.969];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: ED56D2C4922
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Dege/net-renesas-rswitch-improve-port-change-mode-functions/20260318-221709
base:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
patch link:    https://lore.kernel.org/r/20260317-rswitch_add_vlans-v1-13-3a57bfa0f2d1%40renesas.com
patch subject: [PATCH net-next 13/13] net: renesas: rswitch: add vlan aware switching
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260319/202603190927.5oLw58VC-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190927.5oLw58VC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190927.5oLw58VC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/renesas/rswitch_l2.c:268:7: warning: variable 'err' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     268 |         case SWITCHDEV_ATTR_ID_BRIDGE_MC_DISABLED:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/renesas/rswitch_l2.c:275:6: note: uninitialized use occurs here
     275 |         if (err < 0)
         |             ^~~
   drivers/net/ethernet/renesas/rswitch_l2.c:264:7: warning: variable 'err' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     264 |         case SWITCHDEV_ATTR_ID_BRIDGE_VLAN_FILTERING:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/renesas/rswitch_l2.c:275:6: note: uninitialized use occurs here
     275 |         if (err < 0)
         |             ^~~
   drivers/net/ethernet/renesas/rswitch_l2.c:251:9: note: initialize the variable 'err' to silence this warning
     251 |         int err;
         |                ^
         |                 = 0
   2 warnings generated.


vim +/err +268 drivers/net/ethernet/renesas/rswitch_l2.c

   244	
   245	static int rswitch_handle_port_attr_set(struct net_device *ndev,
   246						struct notifier_block *nb,
   247						struct switchdev_notifier_port_attr_info *info)
   248	{
   249		const struct switchdev_attr *attr = info->attr;
   250		struct rswitch_private *priv;
   251		int err;
   252	
   253		priv = container_of(nb, struct rswitch_private, rswitch_switchdev_blocking_nb);
   254	
   255		switch (attr->id) {
   256		case SWITCHDEV_ATTR_ID_PORT_STP_STATE:
   257			err = rswitch_port_update_stp_state(ndev, attr->u.stp_state);
   258	
   259			break;
   260		case SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME:
   261			err = rswitch_update_ageing_time(priv, attr->u.ageing_time);
   262	
   263			break;
   264		case SWITCHDEV_ATTR_ID_BRIDGE_VLAN_FILTERING:
   265			rswitch_update_vlan_filtering(priv, attr->u.vlan_filtering);
   266	
   267			break;
 > 268		case SWITCHDEV_ATTR_ID_BRIDGE_MC_DISABLED:
   269	
   270			break;
   271		default:
   272			return -EOPNOTSUPP;
   273		}
   274	
   275		if (err < 0)
   276			return err;
   277	
   278		info->handled = true;
   279	
   280		return NOTIFY_DONE;
   281	}
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

