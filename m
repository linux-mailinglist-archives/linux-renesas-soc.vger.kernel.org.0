Return-Path: <linux-renesas-soc+bounces-13836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DA0A4AE0B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Mar 2025 22:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75EFC3B4ADE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Mar 2025 21:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CE2B664;
	Sat,  1 Mar 2025 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5pRQzz+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63837182D7
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Mar 2025 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740865591; cv=none; b=Jjo8YoxkkwXkS5rVO4DT26GMAMhua33fI0ORFLAg/A6/Xq7QNy/oi+gndyGGu5bCGeZVgrwhSHCy2yr+/yrENVwx6B5dpQ0qzirdbV9nDiHhIfX8rABmO4P+HQ6BjfDdsSBecYzmXDGvhb0poHmEYFOTgjvDLW0tESwIr8usndI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740865591; c=relaxed/simple;
	bh=RgENAaaQzSjYluJV2j458ER4MjJTkcFoOP18LUUpMLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAD3lXHoidhaH2orgJ8xyJ719OEBpQ635OkJsQZZGKTk/1PtNg3aUdkP3ujo3WPipPWu6qDOWRESPmSw9p4CPCorf9px74AGRD/Rax2lrgnWSHg++ezwSSm8qe91b6yUBXig7V2QTnohdFZUEJqpZVLM5YLqxcX0Sfnr9bjL8qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5pRQzz+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740865590; x=1772401590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RgENAaaQzSjYluJV2j458ER4MjJTkcFoOP18LUUpMLA=;
  b=k5pRQzz+Lkxk0Ld5L8ndyfm9P43PGokQQ3eY07OyvdgfAiRGJsm9XD9F
   7AOI5MmI4PKTV4UR3UKAO7T5bSifylQ+tXKyMP5lqJsAsLgtA2w9b8RdJ
   9IEvsdLifsKzGU3xzNQ9lBgL7GLJrweu7P7E+SOQbKLpjqtTqj9TkzcMK
   d8OGMCKpXfHELy3RU+mYkH69bGnyJ1p6wJIxMN8AkHUC8mvHIEdbiIQJL
   e9iGnnubinUe882mCrAPsVYaZLKBIR95KuUUHV6Gnk0+Iu4+zZEDtHnzC
   euU17vNsvVX4dmJbFMroW5wtkqzHi+9h8+UWaCv3D02IKlB8ZX2032osQ
   Q==;
X-CSE-ConnectionGUID: heA68SuVTjO6nibZGXAY5Q==
X-CSE-MsgGUID: IIK++4u8RFyUwFbFYYbYzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59316335"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="59316335"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 13:46:29 -0800
X-CSE-ConnectionGUID: SqPsYZo4QTOnH/rIJds/rw==
X-CSE-MsgGUID: TYqwkLJtQou03mQIShDSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="148453165"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2025 13:46:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toUfA-000Gjb-0F;
	Sat, 01 Mar 2025 21:46:24 +0000
Date: Sun, 2 Mar 2025 05:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 7/8] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Message-ID: <202503020521.ZJBds3LY-lkp@intel.com>
References: <20250228160810.171413-8-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228160810.171413-8-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on broonie-spi/for-next krzk-dt/for-next linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindings-memory-Document-RZ-G3E-support/20250301-041012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250228160810.171413-8-biju.das.jz%40bp.renesas.com
patch subject: [PATCH 7/8] memory: renesas-rpc-if: Add RZ/G3E xSPI support
config: sparc64-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020521.ZJBds3LY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020521.ZJBds3LY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020521.ZJBds3LY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/memory/renesas-rpc-if: local symbol 'xspi_dirmap_read' was exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

