Return-Path: <linux-renesas-soc+bounces-9046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B47F9863A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 17:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A810B36E2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 14:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA8018A6D1;
	Wed, 25 Sep 2024 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KS321w1d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6209176FCF;
	Wed, 25 Sep 2024 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727274332; cv=none; b=Te7g5eXhel7wgM/Ud0HlJJJovqy/fa7soZp5doV1FEpdCXhhiyYLzVZo7MDp0YdeNrgSof47ghTVRszqRaZy+Z5mK4T43A60U76vbFifdIscKmfY4MTm69UZ4fqg1ECMwJpg2ezjk7DYq2u3HjHwIifnT3+ohkeSyKV5DdxycF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727274332; c=relaxed/simple;
	bh=0KrTP0hX+3PRCNf/kikMSMXg0eMbbB55A2pBrDjHw8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GValM7J6t3wz12hZVaDESmfB86KoiryR4EnWEkgV2ktm7CBc0dcy8l6CqqK/Z6yrs8fkeS7qARAP6KmsImMKmgWQUxb3+N/6q2p3EQg/qG8DCHXeYeL3Q1HdvrnToScmpkijYihCErgF/jD1VRd3DvjzzcAaZKgvFlIrNRFlpCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KS321w1d; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727274331; x=1758810331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0KrTP0hX+3PRCNf/kikMSMXg0eMbbB55A2pBrDjHw8k=;
  b=KS321w1d22R84Q+L+EvfhedMaocQD4tFaXrR6vFKKunIRMhPphep8f3P
   xCy+IPo6XF1jQxgvdjdENl63vyiMS0txqAOFHpPP1hk/Mwf1wzDUwWxv3
   RYSGX6G3qqYlQBNzUIRhizLAXznqqq8jNUN5XT/wu5mzRn0DvhZJRcArH
   fVhl/qdE2Xk4QOINUHGd+e+26xmIqhW4EIPP40KgRtTbufPDstQwQXQh1
   2Pyc+PEmGCzlrmlNgPrHDyH497sc1R+Fv79eYZWbjZ2o0rY1KEbxVoTfY
   DBy/bFITrbruuZtXR8qPhnygqJrZRJe4b+1PvKuvkwzYicaXW6LyNdFZD
   A==;
X-CSE-ConnectionGUID: nqsf7Q3ITcCFLo1orpCYXA==
X-CSE-MsgGUID: qYElqjHdTWSZJzbCfG1VjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="30036742"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="30036742"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 07:25:25 -0700
X-CSE-ConnectionGUID: VHKIucy4Q9qg8bWQwRvclA==
X-CSE-MsgGUID: KXuWMDfTQ0KbE/JPST/d0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="95119418"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2024 07:25:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stSxC-000Jb2-0h;
	Wed, 25 Sep 2024 14:25:18 +0000
Date: Wed, 25 Sep 2024 22:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>, patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 2/2] hwmon: (isl28022) new driver for ISL28022 power
 monitor
Message-ID: <202409252223.s09tP6IL-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.11 next-20240925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yikai-Tsai/dt-bindings-hwmon-add-renesas-isl28022/20240925-111332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240925031131.14645-3-yikai.tsai.wiwynn%40gmail.com
patch subject: [PATCH v7 2/2] hwmon: (isl28022) new driver for ISL28022 power monitor
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240925/202409252223.s09tP6IL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409252223.s09tP6IL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409252223.s09tP6IL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/isl28022.c: In function 'isl28022_read_properties':
>> drivers/hwmon/isl28022.c:396:36: warning: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
     396 |                 dev_err_probe(dev, "renesas,shunt-range-microvolt invalid value %d\n", val);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    char *
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/hwmon/isl28022.c:11:
   include/linux/dev_printk.h:278:64: note: expected 'int' but argument is of type 'char *'
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                            ~~~~^~~
>> drivers/hwmon/isl28022.c:396:88: warning: passing argument 3 of 'dev_err_probe' makes pointer from integer without a cast [-Wint-conversion]
     396 |                 dev_err_probe(dev, "renesas,shunt-range-microvolt invalid value %d\n", val);
         |                                                                                        ^~~
         |                                                                                        |
         |                                                                                        u32 {aka unsigned int}
   include/linux/dev_printk.h:278:81: note: expected 'const char *' but argument is of type 'u32' {aka 'unsigned int'}
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                     ~~~~~~~~~~~~^~~
   drivers/hwmon/isl28022.c:406:36: warning: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
     406 |                 dev_err_probe(dev, "renesas,average-samples invalid value %d\n", val);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    char *
   include/linux/dev_printk.h:278:64: note: expected 'int' but argument is of type 'char *'
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                            ~~~~^~~
   drivers/hwmon/isl28022.c:406:82: warning: passing argument 3 of 'dev_err_probe' makes pointer from integer without a cast [-Wint-conversion]
     406 |                 dev_err_probe(dev, "renesas,average-samples invalid value %d\n", val);
         |                                                                                  ^~~
         |                                                                                  |
         |                                                                                  u32 {aka unsigned int}
   include/linux/dev_printk.h:278:81: note: expected 'const char *' but argument is of type 'u32' {aka 'unsigned int'}
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                     ~~~~~~~~~~~~^~~
   drivers/hwmon/isl28022.c:414:28: warning: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
     414 |         dev_err_probe(dev, "renesas,shunt-resistor-microvolt invalid value %d\n", data->shunt);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                            |
         |                            char *
   include/linux/dev_printk.h:278:64: note: expected 'int' but argument is of type 'char *'
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                            ~~~~^~~
   drivers/hwmon/isl28022.c:414:87: warning: passing argument 3 of 'dev_err_probe' makes pointer from integer without a cast [-Wint-conversion]
     414 |         dev_err_probe(dev, "renesas,shunt-resistor-microvolt invalid value %d\n", data->shunt);
         |                                                                                   ~~~~^~~~~~~
         |                                                                                       |
         |                                                                                       u32 {aka unsigned int}
   include/linux/dev_printk.h:278:81: note: expected 'const char *' but argument is of type 'u32' {aka 'unsigned int'}
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                     ~~~~~~~~~~~~^~~


vim +/dev_err_probe +396 drivers/hwmon/isl28022.c

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

