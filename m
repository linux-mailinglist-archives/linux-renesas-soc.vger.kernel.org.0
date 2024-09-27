Return-Path: <linux-renesas-soc+bounces-9158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 143D4988C4F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Sep 2024 00:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 889F928380B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 22:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9081B1B1510;
	Fri, 27 Sep 2024 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXrxkB0m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0381B1501;
	Fri, 27 Sep 2024 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727474931; cv=none; b=NkSb9ZBNLCoeGAvExaLmuBbOKTjvQ+DReBRXUJWdgdwWLwpHtwiWXLtj4G+dtE9jbGBcXk0YsmBj9RHQv4TXbXO5AQTsCbL/Ig0I7OH8MBy9cXLJK8IfRxHYB51FKNpFuyAptxhgDLcFwpe14COFlpl76Ff/CjLfiniGkr8QGd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727474931; c=relaxed/simple;
	bh=PjwHTGA5BsrsNLC2q0jcT95lWCT2/PR7eV5me+6PLsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkNd/5H9ue/gioTbLBtmSMfhPU94GfgX3RTITZhHzPoS2+SyJe/foNz7QT9q72QBqpLcsp2iISOQsJIBaVU2NOuv6wgiAjI7TdofqQbftvOTdOKylrArpTXTxmiweQJpnVF6wKs58NCuS7UcgdbCBg28XOOAzeeLSJqfVjnyvV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXrxkB0m; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727474929; x=1759010929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PjwHTGA5BsrsNLC2q0jcT95lWCT2/PR7eV5me+6PLsU=;
  b=QXrxkB0mg+jZ4oXci1h0EesfJ6RcL9bMNejXyKXmULlI5dtmtMQJe7is
   Vbftw0yUSM8+jnhHfFATPSh5sh/ymTDjcvES6rPvBjRzku0e1XomN2Glb
   nrvLGfnGJNNww/3EfZVShOsVB32XNDJF7Isf3S89yQsegDR54WzrOel88
   nX1nzx6+1QGGj5hP0TUa4OVMkTNZn1sdrifntZRfYb2vblutoRWUjWWu+
   ktA4gYD1LKzEYBj+CDC0nscWLNiqnV8pZVNzJ5hiaEXDdnKoH/xfzfe8x
   soOvFKmBqSVP9bsrD2f2adDHFuOsqsoHbRRcYFp8IR7e30LUAziDyBMz4
   g==;
X-CSE-ConnectionGUID: 3Yf6mw+1RKmOpRnXA/ekWg==
X-CSE-MsgGUID: 2S9TSvqXR7Sb0/HkJyIJPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30339291"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="30339291"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 15:08:48 -0700
X-CSE-ConnectionGUID: +jdEC4j2SnCYNoASp1qIFQ==
X-CSE-MsgGUID: m2qpjqb4ScKkNMYWZ0WRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72242342"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Sep 2024 15:08:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suJ8k-000Mg7-18;
	Fri, 27 Sep 2024 22:08:42 +0000
Date: Sat, 28 Sep 2024 06:08:36 +0800
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
Message-ID: <202409280806.yxX1K5ey-lkp@intel.com>
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
[also build test WARNING on linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yikai-Tsai/dt-bindings-hwmon-add-renesas-isl28022/20240925-111332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240925031131.14645-3-yikai.tsai.wiwynn%40gmail.com
patch subject: [PATCH v7 2/2] hwmon: (isl28022) new driver for ISL28022 power monitor
config: x86_64-randconfig-121-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280806.yxX1K5ey-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280806.yxX1K5ey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280806.yxX1K5ey-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hwmon/isl28022.c:396:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int err @@     got char * @@
   drivers/hwmon/isl28022.c:396:36: sparse:     expected int err
   drivers/hwmon/isl28022.c:396:36: sparse:     got char *
   drivers/hwmon/isl28022.c:396:88: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected char const *fmt @@     got unsigned int [addressable] [assigned] [usertype] val @@
   drivers/hwmon/isl28022.c:396:88: sparse:     expected char const *fmt
   drivers/hwmon/isl28022.c:396:88: sparse:     got unsigned int [addressable] [assigned] [usertype] val
   drivers/hwmon/isl28022.c:406:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int err @@     got char * @@
   drivers/hwmon/isl28022.c:406:36: sparse:     expected int err
   drivers/hwmon/isl28022.c:406:36: sparse:     got char *
   drivers/hwmon/isl28022.c:406:82: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected char const *fmt @@     got unsigned int [addressable] [assigned] [usertype] val @@
   drivers/hwmon/isl28022.c:406:82: sparse:     expected char const *fmt
   drivers/hwmon/isl28022.c:406:82: sparse:     got unsigned int [addressable] [assigned] [usertype] val
   drivers/hwmon/isl28022.c:414:28: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int err @@     got char * @@
   drivers/hwmon/isl28022.c:414:28: sparse:     expected int err
   drivers/hwmon/isl28022.c:414:28: sparse:     got char *
   drivers/hwmon/isl28022.c:414:87: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected char const *fmt @@     got unsigned int [usertype] shunt @@
   drivers/hwmon/isl28022.c:414:87: sparse:     expected char const *fmt
   drivers/hwmon/isl28022.c:414:87: sparse:     got unsigned int [usertype] shunt
>> drivers/hwmon/isl28022.c:396:36: sparse: sparse: non size-preserving pointer to integer cast
>> drivers/hwmon/isl28022.c:396:88: sparse: sparse: non size-preserving integer to pointer cast
   drivers/hwmon/isl28022.c:406:36: sparse: sparse: non size-preserving pointer to integer cast
   drivers/hwmon/isl28022.c:406:82: sparse: sparse: non size-preserving integer to pointer cast
   drivers/hwmon/isl28022.c:414:28: sparse: sparse: non size-preserving pointer to integer cast
   drivers/hwmon/isl28022.c:414:83: sparse: sparse: non size-preserving integer to pointer cast

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

