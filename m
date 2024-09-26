Return-Path: <linux-renesas-soc+bounces-9059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B454986A52
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 02:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06EAB1F22EB2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 00:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CFD170828;
	Thu, 26 Sep 2024 00:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="codqAsFA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC6B1D5ADC;
	Thu, 26 Sep 2024 00:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727311853; cv=none; b=YzEB14r8guRbb+QH/5u2Gn+77cPVzsoKlBrUZ82Fo+eMtE/27gqdz0mn4IMKP8IX6jtATJgmKJbxluIf0+NpFbjJq+H0yxDni9Z+Wn3iZyy898PGrjOuHjK3D+QjJqjJw9kbOn2hL4jam0Ei8ccCcOeBojsRYs+VVsWK/gzp9U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727311853; c=relaxed/simple;
	bh=FGhQ/qr3h0kh/2oImWTd5HPE0CXkpLwLKKwCCoWVz1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbBgKVV5HspsJee8BK14dy8rr8Z6VV8suwQkJ8FLigbMy4NPCMzJn6m+YvkLUasoikjCEAp1VPEf4RYtAfPU2ccQks+hwdDVVTzRA+gP5wqPkYULDNfcHg1Gmep3vzYxz8+7Iz+qIzTjnqE7sBFoL513AttOArGCyKA5VU1VK+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=codqAsFA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727311851; x=1758847851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FGhQ/qr3h0kh/2oImWTd5HPE0CXkpLwLKKwCCoWVz1E=;
  b=codqAsFAHUPB8d/rZrdLA88iqfeOxFT7uUKlrAwNBjC9K6SIdKz8v6/w
   MGviQqRu9rZnzXVrpgANHyXK5HONi54I1at3FLtdn1DKkt3TZp6+7TUQa
   PaqItyI7v/eI/YJ8v2iAhvw3LtK2J4F5H08+ferlyUlCLL7nfEB8zSS/U
   COz1NyT6tz6TmN+3ZKhVqmagB8aO1Sp9V3d5SvxOl75gNwIL+8mV4MxmY
   jWtUqVrnY9QwwagoD6PcbYDMYNzGWaMeVxrb1GmmqS9YVQ93B1Fp6Rn/Q
   sCHxS5stR0YKldDUlfZecNDy90YJiAV7b5y7FN2lVsRUIBFapQ/l4o73J
   Q==;
X-CSE-ConnectionGUID: KWhNG+vFQomQs76vkugdWQ==
X-CSE-MsgGUID: dty2q+RURfKFceHujHgbYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26515071"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="26515071"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 17:50:51 -0700
X-CSE-ConnectionGUID: TKCI/WE1Sm23Jm9LJV3Ypw==
X-CSE-MsgGUID: Gu7jXKYrT7uatElDxhJHkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="102716733"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2024 17:50:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stciR-000K5f-2K;
	Thu, 26 Sep 2024 00:50:43 +0000
Date: Thu, 26 Sep 2024 08:50:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>, patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 2/2] hwmon: (isl28022) new driver for ISL28022 power
 monitor
Message-ID: <202409260859.DetsBmBQ-lkp@intel.com>
References: <20240925031131.14645-3-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925031131.14645-3-yikai.tsai.wiwynn@gmail.com>

Hi Yikai,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.11 next-20240925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yikai-Tsai/dt-bindings-hwmon-add-renesas-isl28022/20240925-111332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240925031131.14645-3-yikai.tsai.wiwynn%40gmail.com
patch subject: [PATCH v7 2/2] hwmon: (isl28022) new driver for ISL28022 power monitor
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240926/202409260859.DetsBmBQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409260859.DetsBmBQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260859.DetsBmBQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/isl28022.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/hwmon/isl28022.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/hwmon/isl28022.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/hwmon/isl28022.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/isl28022.c:396:22: error: incompatible pointer to integer conversion passing 'char[48]' to parameter of type 'int' [-Wint-conversion]
     396 |                 dev_err_probe(dev, "renesas,shunt-range-microvolt invalid value %d\n", val);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:278:64: note: passing argument to parameter 'err' here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                ^
>> drivers/hwmon/isl28022.c:396:74: error: incompatible integer to pointer conversion passing 'u32' (aka 'unsigned int') to parameter of type 'const char *' [-Wint-conversion]
     396 |                 dev_err_probe(dev, "renesas,shunt-range-microvolt invalid value %d\n", val);
         |                                                                                        ^~~
   include/linux/dev_printk.h:278:81: note: passing argument to parameter 'fmt' here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                                 ^
   drivers/hwmon/isl28022.c:406:22: error: incompatible pointer to integer conversion passing 'char[42]' to parameter of type 'int' [-Wint-conversion]
     406 |                 dev_err_probe(dev, "renesas,average-samples invalid value %d\n", val);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:278:64: note: passing argument to parameter 'err' here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                ^
   drivers/hwmon/isl28022.c:406:68: error: incompatible integer to pointer conversion passing 'u32' (aka 'unsigned int') to parameter of type 'const char *' [-Wint-conversion]
     406 |                 dev_err_probe(dev, "renesas,average-samples invalid value %d\n", val);
         |                                                                                  ^~~
   include/linux/dev_printk.h:278:81: note: passing argument to parameter 'fmt' here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                                 ^
   drivers/hwmon/isl28022.c:414:21: error: incompatible pointer to integer conversion passing 'char[51]' to parameter of type 'int' [-Wint-conversion]
     414 |         dev_err_probe(dev, "renesas,shunt-resistor-microvolt invalid value %d\n", data->shunt);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:278:64: note: passing argument to parameter 'err' here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                ^
   drivers/hwmon/isl28022.c:414:76: error: incompatible integer to pointer conversion passing 'u32' (aka 'unsigned int') to parameter of type 'const char *' [-Wint-conversion]
     414 |         dev_err_probe(dev, "renesas,shunt-resistor-microvolt invalid value %d\n", data->shunt);
         |                                                                                   ^~~~~~~~~~~
   include/linux/dev_printk.h:278:81: note: passing argument to parameter 'fmt' here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                                 ^
   7 warnings and 6 errors generated.


vim +396 drivers/hwmon/isl28022.c

   346	
   347	/*
   348	 * read property values and make consistency checks.
   349	 *
   350	 * following values for shunt range and resistor are allowed:
   351	 *   40 mV -> gain 1, shunt min.  800 micro ohms
   352	 *   80 mV -> gain 2, shunt min. 1600 micro ohms
   353	 *  160 mV -> gain 4, shunt min. 3200 micro ohms
   354	 *  320 mV -> gain 8, shunt min. 6400 micro ohms
   355	 */
   356	static int isl28022_read_properties(struct device *dev, struct isl28022_data *data)
   357	{
   358		u32 val;
   359		int err;
   360	
   361		err = device_property_read_u32(dev, "shunt-resistor-micro-ohms", &val);
   362		if (err == -EINVAL)
   363			val = 10000;
   364		else if (err < 0)
   365			return err;
   366		data->shunt = val;
   367	
   368		err = device_property_read_u32(dev, "renesas,shunt-range-microvolt", &val);
   369		if (err == -EINVAL)
   370			val = 320000;
   371		else if (err < 0)
   372			return err;
   373	
   374		switch (val) {
   375		case 40000:
   376			data->gain = 1;
   377			if (data->shunt < 800)
   378				goto shunt_invalid;
   379			break;
   380		case 80000:
   381			data->gain = 2;
   382			if (data->shunt < 1600)
   383				goto shunt_invalid;
   384			break;
   385		case 160000:
   386			data->gain = 4;
   387			if (data->shunt < 3200)
   388				goto shunt_invalid;
   389			break;
   390		case 320000:
   391			data->gain = 8;
   392			if (data->shunt < 6400)
   393				goto shunt_invalid;
   394			break;
   395		default:
 > 396			dev_err_probe(dev, "renesas,shunt-range-microvolt invalid value %d\n", val);
   397			return -EINVAL;
   398		}
   399	
   400		err = device_property_read_u32(dev, "renesas,average-samples", &val);
   401		if (err == -EINVAL)
   402			val = 1;
   403		else if (err < 0)
   404			return err;
   405		if (val > 128 || hweight32(val) != 1) {
   406			dev_err_probe(dev, "renesas,average-samples invalid value %d\n", val);
   407			return -EINVAL;
   408		}
   409		data->average = val;
   410	
   411		return 0;
   412	
   413	shunt_invalid:
   414		dev_err_probe(dev, "renesas,shunt-resistor-microvolt invalid value %d\n", data->shunt);
   415		return -EINVAL;
   416	}
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

