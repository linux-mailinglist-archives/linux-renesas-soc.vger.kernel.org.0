Return-Path: <linux-renesas-soc+bounces-859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D43AC80B2C1
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Dec 2023 08:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F61EB20B11
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Dec 2023 07:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1228D1FD1;
	Sat,  9 Dec 2023 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axr8GWJr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9D810D9;
	Fri,  8 Dec 2023 23:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702107030; x=1733643030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OLAtMb9Abo7AZs2KlvCLhL0Hv3r1Y8TFLeZE9y8FdXU=;
  b=axr8GWJrOiNKOTb16PZxDKZH46D6aaGEx6WDnsj1m7t6bIO5O2ZG+YVp
   PCoIOj87vvMqmatWFqZvKRb6fjThibew4O7aYzDPK+NpegcQ65cNd9XMh
   Q4Fv5JX144SfcBOUwe2MyVlkSDuGxEse4BQ/pmxhjvT7ioHqlCzMASX3L
   BlIxcUm0oX3E73gSmmdypK1kWYkAf0AC47Ku79Goo6d+OUXSO3W9plQCs
   bNthcFrLRoF7QOZbzPYt46laC3zfbvULZcCiqcwOAJRa6Evwow837sS3F
   l6O8YJvGIg5+pd3NcYxKQDkZXTVA3YywBAyU51eHkuT19SuW5mq2jYXgS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="374662079"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="374662079"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 23:30:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="842870947"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="842870947"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 08 Dec 2023 23:30:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBrn6-000EzN-2j;
	Sat, 09 Dec 2023 07:30:24 +0000
Date: Sat, 9 Dec 2023 15:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] dt-bindings: mfd: dlg,da9063: Convert da9062 to
 json-schema
Message-ID: <202312091536.Lf8kzxoR-lkp@intel.com>
References: <20231202192536.266885-12-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202192536.266885-12-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on robh/for-next rafael-pm/thermal groeck-staging/hwmon-next linus/master v6.7-rc4 next-20231208]
[cannot apply to dtor-input/next dtor-input/for-linus lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindings-watchdog-dlg-da9062-watchdog-Document-DA9063-watchdog/20231203-042557
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20231202192536.266885-12-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v2 11/11] dt-bindings: mfd: dlg,da9063: Convert da9062 to json-schema
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091536.Lf8kzxoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091536.Lf8kzxoR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da9062.txt
>> Warning: Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da9062.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

