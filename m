Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B93476365
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 21:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236174AbhLOUgV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 15:36:21 -0500
Received: from mga17.intel.com ([192.55.52.151]:63926 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236158AbhLOUgU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 15:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639600580; x=1671136580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NaX2LedrarFz0khULM+i3GiuzFS47CD+xm6gGAWsNJc=;
  b=S3koJ2gLgmziwP6JHp2J+ejhD7fMVmXyzwybmbKXrTa3QUAMGoWOV+2N
   x7A6Wg+lZ1oB0uU8ICmxN/otT1FHOlTXIkutaYBXwXz5BaXpsoyl22SA4
   YXjPhMGRpN5sqyqd7Lhh3lJX+5fBcSYdIJHHK4HDLtnL4DihUrwxGzDU+
   IRE4OQJePCPtGu8FmLNeaZsA53Dj4Soi14Rp/JfK0swRNy/4JW4ZADG8f
   R4KEBL4w47jvw/Kx3Z1UshAQNhGk1qdRkUqhkyR0yoLmdiux2laRUgyCx
   ytdOLykFLgCuChp7Z943r4B2Pa88EmbXqYH/WMSgXPqwUYUJL9N4Txh/f
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="220012831"
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; 
   d="scan'208";a="220012831"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 12:36:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; 
   d="scan'208";a="662061279"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2021 12:36:17 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxb0a-0002Ic-QY; Wed, 15 Dec 2021 20:36:16 +0000
Date:   Thu, 16 Dec 2021 04:35:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Cc:     kbuild-all@lists.01.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH v4 2/4] mtd: rawnand: rzn1: Add new NAND controller driver
Message-ID: <202112160417.TvfPZeKJ-lkp@intel.com>
References: <20211215154619.166360-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215154619.166360-3-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

I love your patch! Yet something to improve:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on geert-renesas-devel/next mtd/mtd/next mtd/mtd/fixes linus/master v5.16-rc5 next-20211214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miquel-Raynal/Renesas-RZ-N1-NAND-controller-support/20211215-234825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20211216/202112160417.TvfPZeKJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4899a382aebedd2033aba1a8c662767c86c8d74d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miquel-Raynal/Renesas-RZ-N1-NAND-controller-support/20211215-234825
        git checkout 4899a382aebedd2033aba1a8c662767c86c8d74d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=sh SHELL=/bin/bash drivers/mtd/nand/raw/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/nand/raw/rzn1-nand-controller.c:14:
>> drivers/mtd/nand/raw/rzn1-nand-controller.c:1408:25: error: 'nandc_id_table' undeclared here (not in a function); did you mean 'rzn1_nandc_id_table'?
    1408 | MODULE_DEVICE_TABLE(of, nandc_id_table);
         |                         ^~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__nandc_id_table_device_table' aliased to undefined symbol 'nandc_id_table'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/mtd/nand/raw/rzn1-nand-controller.c:1408:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
    1408 | MODULE_DEVICE_TABLE(of, nandc_id_table);
         | ^~~~~~~~~~~~~~~~~~~


vim +1408 drivers/mtd/nand/raw/rzn1-nand-controller.c

  1403	
  1404	static const struct of_device_id rzn1_nandc_id_table[] = {
  1405		{ .compatible = "renesas,rzn1-nand-controller" },
  1406		{} /* sentinel */
  1407	};
> 1408	MODULE_DEVICE_TABLE(of, nandc_id_table);
  1409	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
