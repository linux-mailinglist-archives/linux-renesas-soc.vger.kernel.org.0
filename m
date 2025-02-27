Return-Path: <linux-renesas-soc+bounces-13765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22917A47F2B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 14:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4E41893CC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 13:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E541233153;
	Thu, 27 Feb 2025 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwgaE8Yb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B3232384;
	Thu, 27 Feb 2025 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662733; cv=none; b=Bzmdy6tD+MN9e7S9IUTzAaGifFfKKxPZehX71SOGCydN8lB8VltbkbS1eaCggI1zGRRG7c/danxyxm70ot3rzkqZfLbX0goHSEKKdq0wpkL7cOoyECFA22/OmpbsFmmKaTkTk9V56vXuEKtL/af/r85+BVWqvlNNPqbgTyHxrIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662733; c=relaxed/simple;
	bh=R7HdUcnOTt/2wh73KtqBgEVWzQHX0ZPmSSjMNqsZdCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c86qYukZ2Iwx2AYDqfd9iu0npbfVZQghOgv96YTF9WefciQs/w2OgnHIkcHnjj+KR5WJmbksU8tl0ZWxXS0EShOdvkTM0V9w7Zx2j2c0h0ISAt3jv7rD3TqhDu0MdV/6s+5nmoqk0VrIm3srR7S5rGWpdq0wjA1qMEpjp6ja/z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwgaE8Yb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740662731; x=1772198731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R7HdUcnOTt/2wh73KtqBgEVWzQHX0ZPmSSjMNqsZdCo=;
  b=gwgaE8YbnpiVxbjXkrQ20k1Wt5arYTNZQGBKA3/ZFIz375S6eUxpp//L
   GWUfcHRCPYWWbsjsmvgkA3TQkCneLThZFZnHeGnUyI1zCfmaXeDrc4gWw
   TtDzFwRuLUMgZ5RUKxbyHWOFNjChDOOi6idTPfGCso02NY5qS0dZzVljG
   SEmFdZk+P5V5PCIDP/5G3zdXpG48iTSIRFHfB1IjllKUzPkukmRxN/uLn
   Fmt9Et994bC3pEyUtfzy6LLi+VJyYpLKIXeWTyuybZsZfWg/gZUoRFL1p
   G5vPDEQ6EUUMJDkTfdlaDI6oKqJjtQ7DnwDng4WahsB2j36sJ759LNxkx
   Q==;
X-CSE-ConnectionGUID: 2Ep7p5izQtSUIhjCQscDDQ==
X-CSE-MsgGUID: 6OxoGTnDTfO53saPEy8QGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41399337"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41399337"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 05:25:31 -0800
X-CSE-ConnectionGUID: o9Pt060WT4Oy8oGnVKBMlA==
X-CSE-MsgGUID: 0dzrNjEJSE+sDVwDXV7LVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116894762"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 Feb 2025 05:25:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tndsO-000DP8-0A;
	Thu, 27 Feb 2025 13:24:44 +0000
Date: Thu, 27 Feb 2025 21:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 09/13] serial: sh-sci: Introduced sci_of_data
Message-ID: <202502272137.JyS2vQml-lkp@intel.com>
References: <20250226130935.3029927-10-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226130935.3029927-10-thierry.bultel.yh@bp.renesas.com>

Hi Thierry,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next next-20250227]
[cannot apply to geert-renesas-drivers/renesas-clk tty/tty-linus geert-renesas-devel/next linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Bultel/dt-bindings-clock-Add-cpg-for-the-Renesas-RZ-T2H-SoC/20250226-221033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250226130935.3029927-10-thierry.bultel.yh%40bp.renesas.com
patch subject: [PATCH v3 09/13] serial: sh-sci: Introduced sci_of_data
config: sh-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272137.JyS2vQml-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272137.JyS2vQml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272137.JyS2vQml-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/sh-sci.c: In function 'sci_probe_earlyprintk':
>> drivers/tty/serial/sh-sci.c:3249:31: error: initialization of 'struct sci_port *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    3249 |         struct sci_port *sp = pdev->id;
         |                               ^~~~


vim +3249 drivers/tty/serial/sh-sci.c

  3245	
  3246	static int sci_probe_earlyprintk(struct platform_device *pdev)
  3247	{
  3248		const struct plat_sci_port *cfg = dev_get_platdata(&pdev->dev);
> 3249		struct sci_port *sp = pdev->id;
  3250	
  3251		if (early_serial_console.data)
  3252			return -EEXIST;
  3253	
  3254		early_serial_console.index = pdev->id;
  3255	
  3256		sp->params = sci_probe_regmap(cfg, sp);
  3257		if (!sp->params)
  3258			return -ENODEV;
  3259	
  3260		sci_init_single(pdev, &sci_ports[pdev->id], pdev->id, cfg, true);
  3261	
  3262		if (!strstr(early_serial_buf, "keep"))
  3263			early_serial_console.flags |= CON_BOOT;
  3264	
  3265		register_console(&early_serial_console);
  3266		return 0;
  3267	}
  3268	#endif
  3269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

