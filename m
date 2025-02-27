Return-Path: <linux-renesas-soc+bounces-13778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D0A4813E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 15:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5BD01894C94
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 14:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26627231A30;
	Thu, 27 Feb 2025 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlwsU0LP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A15642AA1;
	Thu, 27 Feb 2025 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740665808; cv=none; b=XAzUHLE1VoB1TsY/irVesJu1o5gRLLfInDms19Pl1lbBUqeYgSmnvv9bWbVshg5vL9QauayetomzIan2jwWMfp35yCGcymDcT3m32b4iV38tcKNaU+YFP1wTfOlQRY0v1C8FVQSLNfiO1psIQ4oYV3ezZahUAFqXvDOyL28Uvis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740665808; c=relaxed/simple;
	bh=Zli1w6J+6GpdC1pqueDXgdtrSsQiukUHIGExKKQ9BMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCL5HJHHrnSx9evhlR7vcOP+9QtLDaFA+V1MtPhVIwT73fc/wTFjtVua4lxWFMVoJdD4ghd7ZGVZINvB5gkbBqvGwrn+2kXIP3Dmfw3LDbAkrRRcKz3aVC7PzKeRaj7Lk5qXsAg/O+n/GRIG0CfdOWEuTXsdh3ojJXE+wpKGPg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlwsU0LP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740665806; x=1772201806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zli1w6J+6GpdC1pqueDXgdtrSsQiukUHIGExKKQ9BMg=;
  b=BlwsU0LPGQe4L3pgyVu3MRk848HN/gOavasAYUIxtOVZKjCtf7bqsV83
   lvYvd25GKZQr7o3+eWUGMRvNXO7RCIPlejyqKSJ09rmD6HopDJ+ep6BjP
   McLo4qk6M6z+en7rA66pRaqn9GcY+kCnY+jTVVG6ae0cGUqF1MgJusM35
   2OUiRqrANcH3mFBHJNP9vRo782uknuxmc317fmIHJtUceFj1Yp9Lg7nYk
   v7qmaIS5UswatSe07pGXxAAhGcqW5IVE6hQaznMaVeQqSsgjla7W+ZCrj
   IU3DmR4dzL8/9xw7XLcrhTLv1aRk2EqqA8N/VGWOnPDDrj5E7se7wOw5m
   Q==;
X-CSE-ConnectionGUID: c9EAsjjmRVe54dkdxpL7ug==
X-CSE-MsgGUID: VEKWu1PMQdG9rDbyBUypcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40794896"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="40794896"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:16:46 -0800
X-CSE-ConnectionGUID: /S01jM+pSKi6UbhfsOlUwQ==
X-CSE-MsgGUID: 7e72FeMgSSSMsWC3AOxD6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="121980716"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Feb 2025 06:16:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnegq-000DT6-2r;
	Thu, 27 Feb 2025 14:16:40 +0000
Date: Thu, 27 Feb 2025 22:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 08/13] serial: sh-sci: Introduced function pointers
Message-ID: <202502272135.CkFShaQV-lkp@intel.com>
References: <20250226130935.3029927-9-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226130935.3029927-9-thierry.bultel.yh@bp.renesas.com>

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
patch link:    https://lore.kernel.org/r/20250226130935.3029927-9-thierry.bultel.yh%40bp.renesas.com
patch subject: [PATCH v3 08/13] serial: sh-sci: Introduced function pointers
config: sh-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272135.CkFShaQV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272135.CkFShaQV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272135.CkFShaQV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/sh-sci.c:2918:35: error: 'sci_poll_put_char' undeclared here (not in a function)
    2918 |         .poll_put_char          = sci_poll_put_char,
         |                                   ^~~~~~~~~~~~~~~~~


vim +/sci_poll_put_char +2918 drivers/tty/serial/sh-sci.c

  2911	
  2912	static const struct sci_port_ops sci_port_ops = {
  2913		.read_reg		= sci_serial_in,
  2914		.write_reg		= sci_serial_out,
  2915		.clear_SCxSR		= sci_clear_SCxSR,
  2916		.transmit_chars		= sci_transmit_chars,
  2917		.receive_chars		= sci_receive_chars,
> 2918		.poll_put_char		= sci_poll_put_char,
  2919		.set_rtrg		= scif_set_rtrg,
  2920		.rtrg_enabled		= scif_rtrg_enabled,
  2921		.shutdown_complete	= sci_shutdown_complete,
  2922		.prepare_console_write	= sci_prepare_console_write,
  2923		.console_save		= sci_console_save,
  2924		.console_restore	= sci_console_restore,
  2925		.suspend_regs_size	= sci_suspend_regs_size,
  2926	};
  2927	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

