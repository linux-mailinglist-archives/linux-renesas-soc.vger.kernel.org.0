Return-Path: <linux-renesas-soc+bounces-27738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Hc9KKFWmfWkqTAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 07:51:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD6C0FF3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 07:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B094300C918
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jan 2026 06:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE1E3126A9;
	Sat, 31 Jan 2026 06:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZ8D6VE6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3921D78C9C;
	Sat, 31 Jan 2026 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769842258; cv=none; b=iZht3nVZaXZf08WXT+d/kdrcMEWCbx8PxgChqKPTjv6ERI1drHwWcbW2fSNIF5X/Pb9gW/JIeyNUjHEATARUr0VVUyWk3ig0xMDgZhFyuyOskpQbddmbouhKCNXY4uaz4yBDWlT2HPpGOT4y4I08Hd/h7lJ8yxX+inUC8JNem4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769842258; c=relaxed/simple;
	bh=fBAoqy2BOeMDuMfjXPn2PSToulwQTPVGqhclRTRnRwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbbRi/QyVpiPBprCq8vgMldkRKyAZwDB3XFyY8BKTw2wuvDO9MkQG95feiU+7liaph6PCqhyKU+ZY9Z7Rnb7WlB7aFfhSB8qIsoP27yIzwvLb5UQwUoFnmuPhHSr7CHU6kp2pI5IFOf9rRCxXOGRAJ9DAqRvf+kBLien4C9oeiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZ8D6VE6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769842256; x=1801378256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fBAoqy2BOeMDuMfjXPn2PSToulwQTPVGqhclRTRnRwI=;
  b=aZ8D6VE69Z8+SufG1Da8u+G505Q/Ti91h9o3rAjx9NhmDLcVXDlZxHwa
   AX+nm4+uTFCrfXjY8tEdnZzDg9fxT3V4hpKYNMWL4HMo+mlCNf8svlpDo
   rg6bJcpUW1pqV7vfDNwOCn+oPkg2R7laftHN5OcpQSrhKzulE5zHYbPsb
   Z6Ra5d+e6XR9VJuCmRxQlkiiy8rJWXX7TwE1vxPDYJvG42iRb0bquqqH1
   9Tr+m10fc3/DE830wM51zHPTxlDm0MN3EVNCPHQjIsreCK1gsKMt7vpdR
   V1qEx2b/u567KL0to4iep4lEz65CCyHY/1Fro4rbcd80NagjYcam3fupn
   A==;
X-CSE-ConnectionGUID: GyA9veWtRiW96qFYx1AwvQ==
X-CSE-MsgGUID: z4vtt/R5TtmdeEe4mybHdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71170920"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="71170920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 22:50:56 -0800
X-CSE-ConnectionGUID: CJE5H3JxTTmGLXbhiDAnAg==
X-CSE-MsgGUID: Zgx5Or/lS+CEZhW6ZlsLpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208153413"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Jan 2026 22:50:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm4oh-00000000djc-1xxu;
	Sat, 31 Jan 2026 06:50:47 +0000
Date: Sat, 31 Jan 2026 14:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	tomm.merciai@gmail.com, geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 01/20] clk: renesas: rzv2h: Add PLLDSI clk mux support
Message-ID: <202601311423.gWtJuxiU-lkp@intel.com>
References: <2cc58beb0c0fd96b07374e1e84e90e860c81fb95.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cc58beb0c0fd96b07374e1e84e90e860c81fb95.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-27738-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: C8AD6C0FF3
X-Rspamd-Action: no action

Hi Tommaso,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260129]
[also build test ERROR on linus/master v6.19-rc7]
[cannot apply to geert-renesas-drivers/renesas-clk drm-misc/drm-misc-next geert-renesas-devel/next v6.19-rc7 v6.19-rc6 v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tommaso-Merciai/clk-renesas-rzv2h-Add-PLLDSI-clk-mux-support/20260131-023642
base:   next-20260129
patch link:    https://lore.kernel.org/r/2cc58beb0c0fd96b07374e1e84e90e860c81fb95.1769797221.git.tommaso.merciai.xr%40bp.renesas.com
patch subject: [PATCH v3 01/20] clk: renesas: rzv2h: Add PLLDSI clk mux support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260131/202601311423.gWtJuxiU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311423.gWtJuxiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311423.gWtJuxiU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/renesas/rzv2h-cpg.c:796:10: error: invalid application of 'typeof' to bit-field
     796 |         width = fls(smux.width) - ffs(smux.width) + 1;
         |                 ^
   arch/riscv/include/asm/bitops.h:154:8: note: expanded from macro 'fls'
     154 |         typeof(x) x_ = (x);                                     \
         |               ^
   1 error generated.


vim +/typeof +796 drivers/clk/renesas/rzv2h-cpg.c

   783	
   784	static struct clk * __init
   785	rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
   786					   struct rzv2h_cpg_priv *priv)
   787	{
   788		struct rzv2h_plldsi_mux_clk *clk_hw_data;
   789		struct clk_init_data init;
   790		struct clk_hw *clk_hw;
   791		struct smuxed smux;
   792		u8 width;
   793		int ret;
   794	
   795		smux = core->cfg.smux;
 > 796		width = fls(smux.width) - ffs(smux.width) + 1;
   797	
   798		if (width + smux.width > 16) {
   799			dev_err(priv->dev, "mux value exceeds LOWORD field\n");
   800			return ERR_PTR(-EINVAL);
   801		}
   802	
   803		clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
   804		if (!clk_hw_data)
   805			return ERR_PTR(-ENOMEM);
   806	
   807		clk_hw_data->priv = priv;
   808	
   809		init.name = core->name;
   810		init.ops = &rzv2h_cpg_plldsi_smux_ops;
   811		init.flags = core->flag;
   812		init.parent_names = core->parent_names;
   813		init.num_parents = core->num_parents;
   814	
   815		clk_hw_data->mux.reg = priv->base + smux.offset;
   816	
   817		clk_hw_data->mux.shift = smux.shift;
   818		clk_hw_data->mux.mask = smux.width;
   819		clk_hw_data->mux.flags = core->mux_flags;
   820		clk_hw_data->mux.lock = &priv->rmw_lock;
   821	
   822		clk_hw = &clk_hw_data->mux.hw;
   823		clk_hw->init = &init;
   824	
   825		ret = devm_clk_hw_register(priv->dev, clk_hw);
   826		if (ret)
   827			return ERR_PTR(ret);
   828	
   829		return clk_hw->clk;
   830	}
   831	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

