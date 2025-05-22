Return-Path: <linux-renesas-soc+bounces-17367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CA4AC0AA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 13:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 596B27AE54D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 11:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A31D28A1D1;
	Thu, 22 May 2025 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyemD12N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBCF1EEA28;
	Thu, 22 May 2025 11:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747913386; cv=none; b=X3L1/iZcclhFsv32y/KRwK+I7bk2esNGmA53QeaJ/wIESSyH9f3DEVvxg1pmYMlAUoAL4ozb+YJu5yc8HtICLsBzx9C9fQOnkqbiy8el11tSE7fdkMWqXXEPy2YYLd6mkI9vcVGsy1+JdX+REAObbu9+BQVBh/JCGzGAkk9YqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747913386; c=relaxed/simple;
	bh=kA/1F2Zfzqa6vgUg26NcIoNzYwbZOoIGvMHQ8DxxvUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1Ajv6VZge9+43PSm5Wg6VYZKNLyOVOhNfOTBK8lo/x1I6EHHu92DwEPt1GH9RfoJQY9vCUSTfW6wO1cMdJW0dC7iRUVrsLF4ddJWrqFCPalfgwx+7ETB2EIyDgp07lkntokCbDUM9TPE+THhWmo+S48QASXyPVY5HwEIo2AsT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyemD12N; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747913384; x=1779449384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kA/1F2Zfzqa6vgUg26NcIoNzYwbZOoIGvMHQ8DxxvUc=;
  b=FyemD12NUSzddYW6tTb+naE+TY25hTkrRTr6cRjBRoihYCmENYAX3zMp
   KZ3gOjCefPD1htf1sS3NTw28CAOL2+Xv+C+H9B6HcZRZdrWFhfAlObgD0
   sDTUU1gIzD64zUrwhP+4d9sC1404RHH2+ZIwDe1QubV0n2HPB3hz2IJvi
   Xfv2jLPkEJ3xYlfKrZmDTgXWn9IeUFcFwhPHgG7FXLzTCN1FsbHJoOZ9+
   l9bzv3Z+woNzJF2/60oedEhXt0PMzzobgM2SUov+CfvwIeuT39jud/iBi
   sDULRCl39IlIklcS5P4lfBN55TBBNz6XNWwj2yEFOYz7kkf+uXE1VI2F7
   Q==;
X-CSE-ConnectionGUID: DRY1Y9JxTB2WUG3hrWDrxw==
X-CSE-MsgGUID: dJ7Xe5coQ2yOWLhHXKhdEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49051500"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49051500"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 04:29:43 -0700
X-CSE-ConnectionGUID: alwEKqmtQ/S93/wdYInrtQ==
X-CSE-MsgGUID: GuAsb9XpR8mMwN2bOSSLzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="141090681"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 May 2025 04:29:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI47D-000PHI-2i;
	Thu, 22 May 2025 11:29:35 +0000
Date: Thu, 22 May 2025 19:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, vkoul@kernel.org, kishon@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, geert+renesas@glider.be,
	magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com,
	kees@kernel.org, gustavoars@kernel.org, biju.das.jz@bp.renesas.com
Cc: oe-kbuild-all@lists.linux.dev, claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org, john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 08/12] reset: rzg2l-usbphy-ctrl: Add support for USB
 PWRRDY signal
Message-ID: <202505221929.nUHscY04-lkp@intel.com>
References: <20250521140943.3830195-9-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521140943.3830195-9-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250521]
[cannot apply to geert-renesas-devel/next pza/reset/next robh/for-next linus/master pza/imx-drm/next v6.15-rc7 v6.15-rc6 v6.15-rc5 v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/soc-renesas-rz-sysc-Add-syscon-regmap-support/20250521-221703
base:   next-20250521
patch link:    https://lore.kernel.org/r/20250521140943.3830195-9-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH v3 08/12] reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY signal
config: sparc-randconfig-r111-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221929.nUHscY04-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250522/202505221929.nUHscY04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221929.nUHscY04-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rz_sysc_get_signal_map" [drivers/reset/reset-rzg2l-usbphy-ctrl.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

