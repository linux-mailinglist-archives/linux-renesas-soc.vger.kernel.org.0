Return-Path: <linux-renesas-soc+bounces-756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBCB806672
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 06:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD5961F210A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 05:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DEAF4E9;
	Wed,  6 Dec 2023 05:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXO8iHdR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D58C18F;
	Tue,  5 Dec 2023 21:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701839761; x=1733375761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xBvXuw27v70ZHzPrRfpnV6EbzblfunW0fusug8UBRzo=;
  b=LXO8iHdRiBZC6kcX9NHqqxYpYKo135T8skgwACcN1mq2XDBGVugxIjHz
   F4AMSzL91OQ0DN5mnOvXKeN6p9jtIQM/OW+FQyeYiRDEk+gtjoxw7Is7R
   yxlHf+o4uz4zD2t1IL84kPTIT80wdhqFpdgczealprPayiLbhwDE1LwRF
   7MkgXlbZc8gUxZM7sr4SXJ0Xz2F62mibEBwZViSaFMZ5BhF+UGEJNInHr
   lxAOOGKsk60hBjukUpBblcRa+8EshhLb8YTPEcrScSL0VogM9Rc6TZBf7
   TNDSYpexcwVpydpch8MFZ6ytzm4zZUIrEqKq9/DRXYV9i+hMzyDiEXhAf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="392875997"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="392875997"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 21:16:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="774876339"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="774876339"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2023 21:15:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAkGI-000AJk-2L;
	Wed, 06 Dec 2023 05:15:54 +0000
Date: Wed, 6 Dec 2023 13:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
Message-ID: <202312061323.Zk81yCZU-lkp@intel.com>
References: <20231201110840.37408-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201110840.37408-5-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on lee-mfd/for-mfd-next geert-renesas-devel/next arm64/for-next/core linus/master v6.7-rc4 next-20231205]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/rtc-da9063-Use-device_get_match_data/20231201-231120
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20231201110840.37408-5-biju.das.jz%40bp.renesas.com
patch subject: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061323.Zk81yCZU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061323.Zk81yCZU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/input/da9062-onkey.txt references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da9062.txt
>> Warning: Documentation/devicetree/bindings/thermal/da9062-thermal.txt references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da9062.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

