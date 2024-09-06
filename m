Return-Path: <linux-renesas-soc+bounces-8831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 459D596FBAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 20:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEEC41F2B6B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 18:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AEC1D47B9;
	Fri,  6 Sep 2024 18:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iST5gZpV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFFE1D4611;
	Fri,  6 Sep 2024 18:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725649137; cv=none; b=XCsuTD/do6LSSWDYi0QgQvh01JoMJ7JnhVq8RubPB42CQezIuKyO0JDYslJMKzUEXYJaeX6L9UN3p5DEJGeWVcGFBAex2kNhiXi3okX7Zs+e9906fmvK7HIcHHZugiuGvHAaRx0tSFwaYlpM7Hw5MemdLt8LYqULDf0BM0Txb0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725649137; c=relaxed/simple;
	bh=K86qHkz4k9f+n37Ufn7RJNnR1F5LFAqXIee8+QUk3iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUhDn5KBrVFbGfZ7QmiswxJhBHhHfa1Zg4T8QfMYxC7m5PA/m/pLVK6y4oXpAUzjkUywZoFxS1rNOSMWfjKP9rEuITvSfTy4sb/NPynlN9s8HjMoMvqXMjOt+Zu50zTG8YYM60fyZLdTTYeoZHw49rAFFJUToyzKdci9X1CShOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iST5gZpV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725649136; x=1757185136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K86qHkz4k9f+n37Ufn7RJNnR1F5LFAqXIee8+QUk3iU=;
  b=iST5gZpVvY4aMbyazjd+w4Z3MdcYeU1CMTuLv/zi1GvR0In0UtqeWQ34
   Ha4MYbDuGkpbhXCbYHJ5iEG8/gf3f59C1R1KKxnPSHXil5IKpAbY4qCvH
   156Ae4D1Fywy4TzEkCbaXRgPDf5Bc84q+RtpqfeWwQlw5QPGSrjAR1W9y
   PaqMkCYdTygFRkK9geGX+ymk6GpSmCjt+kXWY8dY2SrZUPRLmDT0d2bqf
   uHHUWuboW88Lz82Xrk4NrTd9KQ4bVk/TXnNaHQNGogHHJPeO0pqrVCzZb
   biaro10TibF5JegcACKGDXN5Ve6B8dNPq+j+n2PanoSn5T7PnDMori9bG
   w==;
X-CSE-ConnectionGUID: O1V08nvAS7yqJBn6O2oaIA==
X-CSE-MsgGUID: kAgiw1sxTeSoOSnVwSaocA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="13414537"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="13414537"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 11:58:55 -0700
X-CSE-ConnectionGUID: MW3h8rjTRkeVw3bXotiyPQ==
X-CSE-MsgGUID: cvw9WHRnRJS3VAwyDRmA3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="96820651"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Sep 2024 11:58:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smeAS-000BcF-2B;
	Fri, 06 Sep 2024 18:58:48 +0000
Date: Sat, 7 Sep 2024 02:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 1/3] hwmon: (isl28022) new driver for ISL28022 power
 monitor
Message-ID: <202409070217.1YB4gnfd-lkp@intel.com>
References: <20240906061421.9392-2-Delphine_CC_Chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906061421.9392-2-Delphine_CC_Chiu@wiwynn.com>

Hi Delphine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.11-rc6 next-20240906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/hwmon-isl28022-new-driver-for-ISL28022-power-monitor/20240906-141717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240906061421.9392-2-Delphine_CC_Chiu%40wiwynn.com
patch subject: [PATCH v6 1/3] hwmon: (isl28022) new driver for ISL28022 power monitor
reproduce: (https://download.01.org/0day-ci/archive/20240907/202409070217.1YB4gnfd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070217.1YB4gnfd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

