Return-Path: <linux-renesas-soc+bounces-8889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A29728CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 07:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F20AE1C23E97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 05:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8EC175D5F;
	Tue, 10 Sep 2024 05:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duYAoF8M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A00745F2;
	Tue, 10 Sep 2024 05:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725945215; cv=none; b=BIk2ZhRZ5N0onMpu7iTCnASc56Bq0c3DlWXUgOP+0I+ikhU+aO37pmmpjimltW9ITsaFz3bj0Mqcj76WSBju4XTSz4g5lKW5EkVpqiIT4wpvyQg9S3UVBMlb6hvOVujQEqq2wVlvT5KteHIIkZACTD++Hbu2wM04bZXZtjIEd3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725945215; c=relaxed/simple;
	bh=x8lzG1xg2DPDKAaQNoyJUvlH5EiQ8sXURqDeNwwN7dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZwkhbJx3IDR+q+9f1R47aoEF9x3xa+FyHuJOxFvz7nWiQpWVluGSVXfXslWeMsQa05yYWa6qMeNVxiwovi8pqZ9ujH7/ZOBheqpm76beQAKnaxL8f0/ZTreHNENAY1L8PaG0SjGIrS/BCXDKp3uy9HmWe95JcvQgkXikI+pPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duYAoF8M; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725945214; x=1757481214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x8lzG1xg2DPDKAaQNoyJUvlH5EiQ8sXURqDeNwwN7dM=;
  b=duYAoF8MQ0X9oxHf7gN322wi5IODfUv5xHP1k7aH0fn3YChjeXv3pgY5
   pWsFeixd6hRBI1pmfanwkTSq6+pwPL+TtrxHy+YV0XDxwvYjRro/CyHks
   Gq9SYLCNBcnij8Fg/7kZOvFaW5OPqLG+SKU/v5JPvWN2i8d2iOV3jglS0
   NNY1J+8ewBKy2Swr2Biw66p7dR1ZI2CG+bAPCgp9K+6Fq18cXClfjK2iY
   9vQcJN8RumdfagXh9pxkgf7A62kCg5IGFvtv4n8g8lPlopldpGuBIu3vg
   vm3VBRZPwFuHV49Lj/jHv+zxfbVeAx6j5tqlxxnQpQu+x6/Pcgj63Kafh
   A==;
X-CSE-ConnectionGUID: jBzbH/UfRPaRmOphuyu9kw==
X-CSE-MsgGUID: iRAaWR81RHeRXOjDpu6sYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42187700"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="42187700"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 22:13:33 -0700
X-CSE-ConnectionGUID: U/Q9vasDTWyGZwDUvBIWoQ==
X-CSE-MsgGUID: QML0+yufQ2CNXvcimLQrKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="66530313"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Sep 2024 22:13:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sntBu-000065-2A;
	Tue, 10 Sep 2024 05:13:26 +0000
Date: Tue, 10 Sep 2024 13:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 3/3] hwmon: (isl28022) support shunt voltage for
 ISL28022 power monitor
Message-ID: <202409101229.6mTYs5Rf-lkp@intel.com>
References: <20240906061421.9392-4-Delphine_CC_Chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906061421.9392-4-Delphine_CC_Chiu@wiwynn.com>

Hi Delphine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.11-rc7 next-20240909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/hwmon-isl28022-new-driver-for-ISL28022-power-monitor/20240906-141717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240906061421.9392-4-Delphine_CC_Chiu%40wiwynn.com
patch subject: [PATCH v6 3/3] hwmon: (isl28022) support shunt voltage for ISL28022 power monitor
config: microblaze-randconfig-r073-20240909 (https://download.01.org/0day-ci/archive/20240910/202409101229.6mTYs5Rf-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101229.6mTYs5Rf-lkp@intel.com/

smatch warnings:
drivers/hwmon/isl28022.c:122 isl28022_read() warn: inconsistent indenting

vim +122 drivers/hwmon/isl28022.c

    89	
    90	static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
    91				 u32 attr, int channel, long *val)
    92	{
    93		struct isl28022_data *data = dev_get_drvdata(dev);
    94		unsigned int regval;
    95		int err;
    96		u16 sign_bit;
    97	
    98		switch (type) {
    99		case hwmon_in:
   100			switch (channel) {
   101			case 0:
   102				switch (attr) {
   103				case hwmon_in_input:
   104					err = regmap_read(data->regmap,
   105							  ISL28022_REG_BUS, &regval);
   106					if (err < 0)
   107						return err;
   108					/* driver supports only 60V mode (BRNG 11) */
   109					*val = (long)(((u16)regval) & 0xFFFC);
   110					break;
   111				default:
   112					return -EOPNOTSUPP;
   113				}
   114				break;
   115			case 1:
   116				switch (attr) {
   117				case hwmon_in_input:
   118					err = regmap_read(data->regmap,
   119							  ISL28022_REG_SHUNT, &regval);
   120					if (err < 0)
   121						return err;
 > 122				switch (data->gain) {
   123				case 8:
   124					sign_bit = (regval >> 15) & 0x01;
   125					*val = (long)((((u16)regval) & 0x7FFF) -
   126						   (sign_bit * 32768)) / 100;
   127					break;
   128				case 4:
   129					sign_bit = (regval >> 14) & 0x01;
   130					*val = (long)((((u16)regval) & 0x3FFF) -
   131						   (sign_bit * 16384)) / 100;
   132					break;
   133				case 2:
   134					sign_bit = (regval >> 13) & 0x01;
   135					*val = (long)((((u16)regval) & 0x1FFF) -
   136						   (sign_bit * 8192)) / 100;
   137					break;
   138				case 1:
   139					sign_bit = (regval >> 12) & 0x01;
   140					*val = (long)((((u16)regval) & 0x0FFF) -
   141						   (sign_bit * 4096)) / 100;
   142					break;
   143				}
   144				break;
   145				default:
   146					return -EOPNOTSUPP;
   147				}
   148				break;
   149			default:
   150				return -EOPNOTSUPP;
   151			}
   152			break;
   153		case hwmon_curr:
   154			switch (attr) {
   155			case hwmon_curr_input:
   156				err = regmap_read(data->regmap,
   157						  ISL28022_REG_CURRENT, &regval);
   158				if (err < 0)
   159					return err;
   160				*val = ((long)regval * 1250L * (long)data->gain) /
   161					(long)data->shunt;
   162				break;
   163			default:
   164				return -EOPNOTSUPP;
   165			}
   166			break;
   167		case hwmon_power:
   168			switch (attr) {
   169			case hwmon_power_input:
   170				err = regmap_read(data->regmap,
   171						  ISL28022_REG_POWER, &regval);
   172				if (err < 0)
   173					return err;
   174				*val = ((51200000L * ((long)data->gain)) /
   175					(long)data->shunt) * (long)regval;
   176				break;
   177			default:
   178				return -EOPNOTSUPP;
   179			}
   180			break;
   181		default:
   182			return -EOPNOTSUPP;
   183		}
   184	
   185		return 0;
   186	}
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

