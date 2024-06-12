Return-Path: <linux-renesas-soc+bounces-6088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2A59047EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 02:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E6351F244D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 00:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F94382;
	Wed, 12 Jun 2024 00:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KeQA40mU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74FD197
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 00:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718151137; cv=none; b=rE0ocqQyzoHnpXpp0iLvPrLLBVnQRjiea9feaF0PO2u6fo5BUd9eBItI5eFmZj4j1iLS0XqQZc7hWjyrPbuKzQE9LVNcY7Q50t+cRsI1733ahhA6Xt8ZWjDVYA6ReWpr642CycwuXlaJaW96j4EEPeJ/Y+Q/zHyzvK1i1SmHCQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718151137; c=relaxed/simple;
	bh=k5wk119QN6Aqg53GY6PX3O4H9QqFPFr5GmPk2r6UVEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cqryDcDSV/fYUO3zbFawgl1YOsVkz2WbRb0jHDgpbjNkoUM0Dslyq6YxvtG/wxNLUrjHFof8DATBi3OrfS9JCw9SGtku8NGiwVFrJ1kI85ggH/xidMplKfbPj9wV8TZikm1yJUfZpzV9ur1vL37D7eVj+df1LWfpzTw/PtXH1Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KeQA40mU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718151136; x=1749687136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k5wk119QN6Aqg53GY6PX3O4H9QqFPFr5GmPk2r6UVEo=;
  b=KeQA40mULSLhpaUTvInqqFbfdoXMHDIUrSBz1hoHJsGk0vyUBUgv1yTa
   esgsatDPcU77rC+7YSqAtXIzEHZUKZalLnf5n1wXFModPkBC7M4hP9DM1
   vzc9GUgoj4xBu8uxEYIW69GrL4kYgsrq1JYNI0+M55Np3+pg/h6mpFp0o
   DVu4j+T332XkBpajS5Gr1yAJDaeU8sfOESU7VUzsuKqWbGSypDKH1de+/
   l+ZtfLfw5xaQFcw7A2kXr0u0bd9dGDV0tusleYdaZl9x0N7nXUfEBkWJT
   g4IjH6qy/8I2DwYwDKmYORR9oI4FOq+cQz7oP/nOZ8a2U/ThWlOXk3tPK
   g==;
X-CSE-ConnectionGUID: yV8RD9h3R2eGNSF5NwQwXQ==
X-CSE-MsgGUID: uvRMnJzVRNWqmxcOe4eV/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37419153"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="37419153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 17:12:15 -0700
X-CSE-ConnectionGUID: UtxlO91vQ4OyEHz1hHJC5A==
X-CSE-MsgGUID: vSbotdkjSm+DkFxPpybgUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="39472804"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2024 17:12:13 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHBb1-00011C-0F;
	Wed, 12 Jun 2024 00:12:11 +0000
Date: Wed, 12 Jun 2024 08:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 12/17]
 drivers/gpio/gpio-sloppy-logic-analyzer.c:316:12: error: incompatible
 function pointer types initializing 'void (*)(struct platform_device *)'
 with an expression of type 'int (struct platform_device *)'
Message-ID: <202406120838.jD62wG3D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   fdbb3ef0d4aadf9a3374c2a892098be89e9a3abb
commit: 7eead7ebd4fa6978d3b020b2615f0680a7e98c5e [12/17] gpio: add sloppy logic analyzer using polling
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240612/202406120838.jD62wG3D-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120838.jD62wG3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120838.jD62wG3D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-sloppy-logic-analyzer.c:316:12: error: incompatible function pointer types initializing 'void (*)(struct platform_device *)' with an expression of type 'int (struct platform_device *)' [-Wincompatible-function-pointer-types]
     316 |         .remove = gpio_la_poll_remove,
         |                   ^~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +316 drivers/gpio/gpio-sloppy-logic-analyzer.c

   313	
   314	static struct platform_driver gpio_la_poll_device_driver = {
   315		.probe = gpio_la_poll_probe,
 > 316		.remove = gpio_la_poll_remove,
   317		.driver = {
   318			.name = GPIO_LA_NAME,
   319			.of_match_table = gpio_la_poll_of_match,
   320		}
   321	};
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

