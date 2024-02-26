Return-Path: <linux-renesas-soc+bounces-3161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3F867062
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 11:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881811F2B1E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 10:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D846C1CF83;
	Mon, 26 Feb 2024 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUto507h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C28B1CFBB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708941239; cv=none; b=oynyzc4pjthYHNLhOLi89K2iaBvei7XOsu15NB6AU18OpnHpPRzz91552zhZRM9nhYCskV37xCLIS24xJsaukbQzy4bXWe97HnLnwbf9wxAliiT9cOlSod1AOQc8xOV4HK76y03bMwwtLwEZp53vXXqdlFiUJi18glhWrDrekjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708941239; c=relaxed/simple;
	bh=fiqM8I9v41XIqOWuLrRnsMlHP9FCD1OGIIa4+BZFye0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HB5akpbJEgF+XJZa8IwhDfWt8ifBBpEE2X1SY0b1g5NBTa6Q2NF3cMzjwNgvN1CUCG4HmF8GQEV3cWqUWT0QRMmiwmw3KVtGy3XH1tvEEhRB0avc4hvR2meCj+Laj5ZUtha+rrT4+4kN5k8EpNqLunkEmiMHAEmxJTtw1dSLEz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUto507h; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708941238; x=1740477238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fiqM8I9v41XIqOWuLrRnsMlHP9FCD1OGIIa4+BZFye0=;
  b=ZUto507h+eytiAcuMiXUWvyN954FfPfhuLgn7sLePugiDqZpxc0/8H6x
   sQEonn4slJDnaaFMUymN9M+0n7gbC2TJ2mAcONQjcaV6dft/huY16dSaG
   JdFY786mrJOntOEgz0aG2/e2ncD7gKgTUZ5VE9OH9+/rPqtLZLUoRjiTS
   CiTUcxvnzT1dLuefEz04FodX2qCUz8afZ5/1yqE//bstYvLhi5tqQatq0
   azWuXJDtOuIpCSr5111uC6cINTNCuNFm/CjwmfYxbuyVqdb0U5OYA6YEl
   +UWWzbGL600j3vqBjWykD2hnrCho/64T2wHVubb/W87C0pDnY66/xbwcW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3361525"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3361525"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 01:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6600868"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2024 01:53:56 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reXgB-000AER-0d;
	Mon, 26 Feb 2024 09:53:51 +0000
Date: Mon, 26 Feb 2024 17:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-debug 9/20]
 drivers/soc/renesas/r8a77960-mstp.c:623:13: warning: no previous prototype
 for 'r8a77960_disable_mstp_clocks'
Message-ID: <202402261759.ntC9YoHP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-debug
head:   5da04202c8b2b842bcf74a93e5232f4133c222fa
commit: e20c342f22e1582477551cf633886afa4bd01abd [9/20] [DEBUG] soc: renesas: r8a77960: MSTP debug handling
config: arm64-randconfig-002-20240221 (https://download.01.org/0day-ci/archive/20240226/202402261759.ntC9YoHP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402261759.ntC9YoHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402261759.ntC9YoHP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/renesas/r8a77960-mstp.c:623:13: warning: no previous prototype for 'r8a77960_disable_mstp_clocks' [-Wmissing-prototypes]
     623 | void __init r8a77960_disable_mstp_clocks(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/r8a77960_disable_mstp_clocks +623 drivers/soc/renesas/r8a77960-mstp.c

   622	
 > 623	void __init r8a77960_disable_mstp_clocks(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

