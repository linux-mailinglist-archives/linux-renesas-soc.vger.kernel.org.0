Return-Path: <linux-renesas-soc+bounces-6087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAE590479D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 01:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B94901C2378F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 23:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424421B28A;
	Tue, 11 Jun 2024 23:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4XHzKb2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2D415530F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2024 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718147956; cv=none; b=p2ctn/MpWhVo9GO/o4E8L+EPBO3sRk+XrB4iGEqUY4p2E2TBNFS9YmNi5sT5yuz860vn0l2z18za5gOt5DVbVUO0IoM8cTPmK0jJiMI9X39fAAEt3o85j4QKCw6XJSC8NUK0UnIrLpsSVL44z2F+tqgECXMhvjV0uw4p7lkqxSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718147956; c=relaxed/simple;
	bh=GkeXF4bgIY/txdx/CgAXI3DSCOfLrfqAJQUk4YZUx7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QtEzdhw7QJ6mnHCLE1TTJgwze7Ld1CExjqwuilH/hprjJcQWRfcxC0EEPENwg11PbTVy//fV/osiSlBlJ3JmKioX7qvZR7NCyIX+Dq/lLIn76kGnDyI/6SUhSbSFZCMTg+lxbnDlZIcTRc3QDq7hLBioy/NTR2pfSY8LmLxKxS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4XHzKb2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718147954; x=1749683954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GkeXF4bgIY/txdx/CgAXI3DSCOfLrfqAJQUk4YZUx7U=;
  b=b4XHzKb2mo/Icsx92d6xeB/6DWEd6p0zaOMA1YHlt0uFr/x64yTiYqMR
   vzjQLTQqzr2B93qxTZ/haMZSxo3uWEAtsYN8QxlQJ/WLqCj+gmC5Axv0G
   dwx449CI/eNlXD/O5Y0F/wfHd5WKbSUbMtF/4FWTyfjxoeLCSYRBvmVVG
   Iykz9hsqeEh+zwwrobGWoNVo3SuUagmDH0CiizpHHB73cZFla9YQ6AAnR
   6CpR1JlBOZAXKADRfZ+Cv3uhF9Ag1tjdXolH5EUbg8sZDuvYINCovh4Yu
   cZfnbTgweXYiQqpyeYvzjwLpWXcpNMQ4HG7cylMI+n/QGFq4fvb0IkjSk
   Q==;
X-CSE-ConnectionGUID: QPJCSXAcSc+0dD3wWroBPA==
X-CSE-MsgGUID: bHGF5XxRRFuXxe2G9TteUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14613023"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="14613023"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 16:18:13 -0700
X-CSE-ConnectionGUID: LJBJiDZjQoC/G1aRRNOTCg==
X-CSE-MsgGUID: 0e4H7yf9S8SbhhGy3LkuMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="39488179"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jun 2024 16:18:11 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHAkj-0000zB-22;
	Tue, 11 Jun 2024 23:18:09 +0000
Date: Wed, 12 Jun 2024 07:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 12/17]
 drivers/gpio/gpio-sloppy-logic-analyzer.c:316:19: error: initialization of
 'void (*)(struct platform_device *)' from incompatible pointer type 'int
 (*)(struct platform_device *)'
Message-ID: <202406120736.5AEAsytB-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240612/202406120736.5AEAsytB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120736.5AEAsytB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120736.5AEAsytB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-sloppy-logic-analyzer.c:316:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
     316 |         .remove = gpio_la_poll_remove,
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sloppy-logic-analyzer.c:316:19: note: (near initialization for 'gpio_la_poll_device_driver.<anonymous>.remove')
   cc1: some warnings being treated as errors


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

