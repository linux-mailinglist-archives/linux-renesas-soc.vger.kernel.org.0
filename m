Return-Path: <linux-renesas-soc+bounces-16830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F11AB0DAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 10:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B178C16F80B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 08:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D162927A90E;
	Fri,  9 May 2025 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsV8c95O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55DA276050;
	Fri,  9 May 2025 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780231; cv=none; b=Ft3mXKSyksQWHAvuocWHd7K1GEpd66ir/SSh0CnOBdzufB2C2PEs95TL8uMVXdOiZoR9dpuOUyCT98ZCDAUYVloN6itcKyR/jpHsysTshwC7vmDis75TSU5nESrs1WNGE20qsFFVAtf1v7aVgsRrATnkzRTPLexYEblN6gruBCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780231; c=relaxed/simple;
	bh=ZBPKwkmHEvvNQajIMTTzmOHRyWDO/JoXKm9KFvP4U1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUo7/n451ex0T/vY5iO2kyD0HBoh50wlL0CBfS4/ipE1pH5wPwiw6fonzfOZdv6zaJ5MOJcgalH05sKlH/aobwBSqfwYMQljyyz7BLtNwfS/Z/WSs4pcXkNrUbdJ6lYlrMWFwJ1raH3AiaIZ5+7MypKA65jn+6tGIYG4nJSCaoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsV8c95O; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746780230; x=1778316230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZBPKwkmHEvvNQajIMTTzmOHRyWDO/JoXKm9KFvP4U1g=;
  b=YsV8c95O3E42WgHv2C8W2eWB4tHBaRk4jCs80Zl7n4dTRqT7NjT42s1c
   RGEW+WtjlPND5UORIpbgfYcfMcfrkA00p9wrcEKwIEV6dzr7fI94GNgNG
   sxRW5D0h7sPpYmcLpWOPnST4/VnZcHwY4+jYtf6PaAaeysC0uHCrrG2na
   le6aVNhlCPCWluoqCLu3/YvdxJVakBBnoqKeoXfhafo6OwpVYDbxBY3fo
   5sntffnCbhM6wHJEN3prU7dKquHlrrTDeoH+7j7e6DN9chllVaB+vyv+L
   G2DkHm+leEX+2WfFqnEJGj6Kl0gsLv1tHU0GHaMJHrDmPk/5tH+S4x01P
   A==;
X-CSE-ConnectionGUID: D4Mfx/DaRoWl5luihL7xWQ==
X-CSE-MsgGUID: wh9PXFr6Sy+GkYl3qEaGmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47706351"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="47706351"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:43:49 -0700
X-CSE-ConnectionGUID: hFz01JFsS8ShUD9WZtMk2A==
X-CSE-MsgGUID: awqki4yeR5CZItdVGjRoqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="137058983"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2025 01:43:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDJKa-000Bpj-0I;
	Fri, 09 May 2025 08:43:44 +0000
Date: Fri, 9 May 2025 16:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
Message-ID: <202505091649.PuAhqb0T-lkp@intel.com>
References: <20250508183109.137721-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508183109.137721-2-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-devel/next]
[also build test ERROR on linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/arm64-dts-renesas-r9a09g047-Add-XSPI-node/20250509-023503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250508183109.137721-2-biju.das.jz%40bp.renesas.com
patch subject: [PATCH 1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
config: arm64-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091649.PuAhqb0T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091649.PuAhqb0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091649.PuAhqb0T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/renesas/r9a09g047.dtsi:293.14-15 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

