Return-Path: <linux-renesas-soc+bounces-13780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C677A4825C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 16:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAA2518988FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 14:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AAD25F961;
	Thu, 27 Feb 2025 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWA/wIbR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F47125EFB7;
	Thu, 27 Feb 2025 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740668173; cv=none; b=Rfa1qLpIZkFx7f+A2CiWi6y0PUxQV8DbVCcsWnv7d3ep8B6JnlBoCuDguewWJndf94mIq1hfys9HluH0pgbfz01Fe4glavz7H5rVMQ8+kOtR/sn3BpXIMjzcYOo6WqmfJLfDq6Vg2luZHNxHz1t2tqvAlP+1kMKVkq2iMaipHDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740668173; c=relaxed/simple;
	bh=9pifnqqy4pSoozn+ghyHOYktagFezR8KmfqYwHLFwpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnYtgfwsfVB79uR/tT6zl8F8YcLQxHmBN5vAxndUnw/QeE7legP3+Im2pEauPIHyRVVBRGYQmjdmjl0u3RkpCpZ6RhFPXL9PAPQsMnwrxZPddniwidFLZMQOkBTIfaEXE6MxwBD5kMnFuwCx3Ik5VJYJ1z5O16KfRin2xAItG/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWA/wIbR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740668171; x=1772204171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9pifnqqy4pSoozn+ghyHOYktagFezR8KmfqYwHLFwpU=;
  b=UWA/wIbRhOKodLCu61MnZ8ZMPBxhb5fz63i5nLsQrfZ+c9mSPMq9Y3s9
   bfuKhPBd4uXnWicE4KlBGGgj2y++xgl4hPKZ7fbfQ/rH8F+9yYBPNjuT4
   N6FNOvtRejYCm8yAdpXPRhyu2axDLP8xNsoYhqrSsFPvyMjfO23+9uGJ7
   uaKNJVxXaUu8g1f11BTlZuEZ6JTTLTSQq5vs5uu/vL+X1CW5K4wmvcbLC
   a+t6ry6oLe1eifhUZFNS1hmXBOwW4Ephtt+D9F/R9ydPbKqezE9VGS+W3
   SG0v9Qu5qdVUEXaMbNnfu5BvUiEYIJLZGrOBaa5xL4z5jlqDN/cne3p3Q
   Q==;
X-CSE-ConnectionGUID: NBN9dlMaQTuvJD0tMWW4Ig==
X-CSE-MsgGUID: RTp4+IhYTHCI8BvZ2yk1oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41760502"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41760502"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:56:11 -0800
X-CSE-ConnectionGUID: rLfBfA0CQbGjXLAIO8Oe6Q==
X-CSE-MsgGUID: yNl376CETuGLw2RzZA4V/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147963548"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Feb 2025 06:56:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnfJ0-000DWc-2e;
	Thu, 27 Feb 2025 14:56:06 +0000
Date: Thu, 27 Feb 2025 22:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 06/13] clk: renesas: Add support for R9A09G077 SoC
Message-ID: <202502272238.ZwLcNFEr-lkp@intel.com>
References: <20250226130935.3029927-7-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226130935.3029927-7-thierry.bultel.yh@bp.renesas.com>

Hi Thierry,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus geert-renesas-devel/next linus/master v6.14-rc4 next-20250227]
[cannot apply to geert-renesas-drivers/renesas-clk]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Bultel/dt-bindings-clock-Add-cpg-for-the-Renesas-RZ-T2H-SoC/20250226-221033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250226130935.3029927-7-thierry.bultel.yh%40bp.renesas.com
patch subject: [PATCH v3 06/13] clk: renesas: Add support for R9A09G077 SoC
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250227/202502272238.ZwLcNFEr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272238.ZwLcNFEr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272238.ZwLcNFEr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/renesas/r9a09g077-cpg-mssr.c:9:
   drivers/clk/renesas/r9a09g077-cpg-mssr.c: In function 'r9a09g077_cpg_div_clk_register':
>> drivers/clk/renesas/r9a09g077-cpg-mssr.c:72:33: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      72 | #define GET_REG_OFFSET(val)     FIELD_GET(GENMASK(31, 20), val)
         |                                 ^~~~~~~~~
   include/linux/clk-provider.h:869:51: note: in definition of macro 'clk_hw_register_divider_table'
     869 |                                   NULL, (flags), (reg), (shift), (width),     \
         |                                                   ^~~
   drivers/clk/renesas/r9a09g077-cpg-mssr.c:166:63: note: in expansion of macro 'GET_REG_OFFSET'
     166 |                                                        base + GET_REG_OFFSET(core->conf),
         |                                                               ^~~~~~~~~~~~~~


vim +/FIELD_GET +72 drivers/clk/renesas/r9a09g077-cpg-mssr.c

    69	
    70	#define GET_SHIFT(val)		FIELD_GET(GENMASK(19, 12), val)
    71	#define GET_WIDTH(val)		FIELD_GET(GENMASK(11, 8), val)
  > 72	#define GET_REG_OFFSET(val)	FIELD_GET(GENMASK(31, 20), val)
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

