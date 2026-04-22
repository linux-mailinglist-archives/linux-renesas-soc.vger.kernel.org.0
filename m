Return-Path: <linux-renesas-soc+bounces-31492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDdzCjWZ6GnVNAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 11:47:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6E144436E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 11:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87BD4303D318
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 09:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452FD3C3448;
	Wed, 22 Apr 2026 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndXRCiFF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE49830EF90;
	Wed, 22 Apr 2026 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850710; cv=none; b=Z0bkn/K2ktEW3a/hWN9lP/OH2xBWSdknWxGV0FTkMUePOcShoM4elTieHq4HvoyzHkX2rD8iqMVbaMAQoBuDr9tJZmwNYrFBJ2igGLRpA+8j5qUSL53VugphwDZO7PPoe9+CkkrS/V8cpPdD+kzFQaDp7RO8hu+5QiwkF455Pcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850710; c=relaxed/simple;
	bh=zaC+o3hHTDa7/hz7nLBobboom0XVJ935Z1rRDvGJyDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSzLLN8qLqALDH+z1y54DspPFJUOV6uR0y39p6oxzTAuX20y3qMuryzAkY4en2XvXR2JjgcYufnIEmpOkPyy1+6KE3a54/VsbKhDhBmiMpwjKR3NieVwob0Q4P3ow8lZoJckscw3CoWR3QvY+SVLu96Ow1pKfgN5SXGgbA5A3wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndXRCiFF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776850708; x=1808386708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zaC+o3hHTDa7/hz7nLBobboom0XVJ935Z1rRDvGJyDE=;
  b=ndXRCiFFqS9fhH4J6d9zNvmmizSg7qL2OivmIlW9AEFvDL2ZTwWH7453
   ckEacYrQEqp8+QZZzj9ndT72eQXS+ysMS7PwJPveSl51Ib/XK+/w+QXBm
   SuozdVQZNfpjYU1iMpag1WTojraV9KzH84VjRt2ua6KRrgMcEpK/C8bsg
   yP5D2lVjODiVl0cBSJ0SvrAWxCFd3feZc1RTfdRo5CGpX09xJNw90I/ux
   icdNvbcGYTU8E4FSKK4uWI0NPSbL/dwqM8lI3s/2/bTwbs99dMatgfcQr
   rF18l5NFVuq3PQ1crwjfNGbP8dSKu5AfG9tEWtVnli1AOF+5Fwso87Anv
   g==;
X-CSE-ConnectionGUID: 3Cpi6Z4zTzCQkrnf9gdSBg==
X-CSE-MsgGUID: 5E+Ao8f7QHKPyYC96VZBcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="65335595"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="65335595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 02:38:27 -0700
X-CSE-ConnectionGUID: CRvZqfYTSRK4FnY9Y9JEpg==
X-CSE-MsgGUID: 4JzoVTKER2SAcm2xuYB1jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="231417451"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Apr 2026 02:38:22 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFU2B-000000000Nx-1ubz;
	Wed, 22 Apr 2026 09:38:15 +0000
Date: Wed, 22 Apr 2026 17:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: Biju <biju.das.au@gmail.com>, Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Add basic resume support
Message-ID: <202604221736.zHLIEw3V-lkp@intel.com>
References: <20260415113954.179006-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415113954.179006-1-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-31492-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,nxp.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,01.org:url,intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7A6E144436E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.0 next-20260421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju/drm-bridge-ite-it6263-Add-basic-resume-support/20260421-073706
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260415113954.179006-1-biju.das.jz%40bp.renesas.com
patch subject: [PATCH] drm/bridge: ite-it6263: Add basic resume support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260422/202604221736.zHLIEw3V-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604221736.zHLIEw3V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604221736.zHLIEw3V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/ite-it6263.c:909:12: warning: 'it6263_resume' defined but not used [-Wunused-function]
     909 | static int it6263_resume(struct device *dev)
         |            ^~~~~~~~~~~~~


vim +/it6263_resume +909 drivers/gpu/drm/bridge/ite-it6263.c

   908	
 > 909	static int it6263_resume(struct device *dev)
   910	{
   911		struct it6263 *it = dev_get_drvdata(dev);
   912		int ret;
   913	
   914		ret = it6263_lvds_set_i2c_addr(it);
   915		if (ret)
   916			return ret;
   917	
   918		it6263_lvds_config(it);
   919	
   920		return 0;
   921	}
   922	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

