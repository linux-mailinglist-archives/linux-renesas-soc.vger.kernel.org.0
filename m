Return-Path: <linux-renesas-soc+bounces-16596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1355CAA6848
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 03:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1E8C1BA7E8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 01:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E118613B797;
	Fri,  2 May 2025 01:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmF6rFeK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637011F61C;
	Fri,  2 May 2025 01:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746148525; cv=none; b=Pmtl+SqIFBDZWCCuNtsAxy+Cl2CGwgLAqGj/zMrk6Abnmupq6ud3YEBhQbcPmEkxPlXp6Nnb9PTPXmR9xnY3Zi4ZkwnvDyC/zbhC5X6RPMFBEkmrM0363wYR/LS16kX324OQqbYB7ycdzNlHwBJjsDunZRS00gPpLwWkGH7Zaao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746148525; c=relaxed/simple;
	bh=qThFo2OyaWAGrkhYOPTL+nS7FbwT7IFHPxUakidufl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUZ6A6UllFirtHlMuzbAhoABaNG4qsRpa2jCpPeCcBg+m2fR0fXY54HDeH1fZeOxbj2F4hjf7Ki9GijdSSZgAGHUf2xC06wE/Z+1p/rX1TwwNm9nWig/oAb7yIE9QpKvPGq3Qnd6c0BQ4n2XwCcBqkRzBk8JIqLYFaFNcROM/lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmF6rFeK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746148523; x=1777684523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qThFo2OyaWAGrkhYOPTL+nS7FbwT7IFHPxUakidufl0=;
  b=NmF6rFeKBY9CNjI0Z0NPwzcVlDkpDafQU7rapl/UbzwXcS7yNjCT9tx0
   UWySqAaXwo0JE6a/rftV8Pw+u5j0nYXTZ039gWIK3nhJIVdMssIOzV37K
   3MTdhO7Ozu4kbIDIKS/uPVBpQebi9L4YiP3NcZsWn18HRWZmbTwAA+u87
   ZI3BWzadVWmYKgi03dLGvj6GR+ol1TGI0sorUzG4xhr8XOhpzUS/AI0kx
   p9TcrpdwuU/DDcmMShNdpbfIQhtrSj8Eiv1/gevr2gnHcCYWO68S9JRLO
   feAkS/NAq0EUi051JT9DdkrDRTVSyNy4b9e1NTBzZFp25umYDtDlku5B4
   w==;
X-CSE-ConnectionGUID: iawCWFPsTCGfMhUJIEGryw==
X-CSE-MsgGUID: KEaUkOlhRM2MUMX+THy2iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47971667"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="47971667"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 18:15:22 -0700
X-CSE-ConnectionGUID: ZfraKh0PRFOMDsr38cEUQw==
X-CSE-MsgGUID: kBNYggXVSX2+8kIxNTZoNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="134420606"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 May 2025 18:15:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAezk-0004U1-2q;
	Fri, 02 May 2025 01:15:16 +0000
Date: Fri, 2 May 2025 09:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v8 08/11] serial: sh-sci: Add support for RZ/T2H SCI
Message-ID: <202505020836.WBkjrl7J-lkp@intel.com>
References: <20250429081956.3804621-9-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429081956.3804621-9-thierry.bultel.yh@bp.renesas.com>

Hi Thierry,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next]
[cannot apply to geert-renesas-drivers/renesas-clk tty/tty-linus geert-renesas-devel/next linus/master v6.15-rc4 next-20250501]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Bultel/dt-bindings-soc-Add-Renesas-RZ-T2H-R9A09G077-SoC/20250429-172052
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250429081956.3804621-9-thierry.bultel.yh%40bp.renesas.com
patch subject: [PATCH v8 08/11] serial: sh-sci: Add support for RZ/T2H SCI
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250502/202505020836.WBkjrl7J-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020836.WBkjrl7J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020836.WBkjrl7J-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/tty/serial/rsci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/rsci.o
>> ERROR: modpost: "sci_port_enable" [drivers/tty/serial/rsci.ko] undefined!
>> ERROR: modpost: "sci_port_disable" [drivers/tty/serial/rsci.ko] undefined!
>> ERROR: modpost: "sci_release_port" [drivers/tty/serial/rsci.ko] undefined!
>> ERROR: modpost: "sci_shutdown" [drivers/tty/serial/rsci.ko] undefined!
>> ERROR: modpost: "sci_startup" [drivers/tty/serial/rsci.ko] undefined!
>> ERROR: modpost: "sci_verify_port" [drivers/tty/serial/rsci.ko] undefined!
>> ERROR: modpost: "sci_request_port" [drivers/tty/serial/rsci.ko] undefined!
>> ERROR: modpost: "sci_config_port" [drivers/tty/serial/rsci.ko] undefined!
>> ERROR: modpost: "sci_pm" [drivers/tty/serial/rsci.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

