Return-Path: <linux-renesas-soc+bounces-16663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C95AAAA7E4F
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 May 2025 05:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 908A91B656B8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 May 2025 03:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AEA16F0FE;
	Sat,  3 May 2025 03:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJAoAOft"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F6F158858
	for <linux-renesas-soc@vger.kernel.org>; Sat,  3 May 2025 03:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746244388; cv=none; b=mqArNWMEudi6QQMG111gshUr33EUG8DpC8KGB45PDSzDnYP7QEuXSqZmectF91Baei1kXdBjlRosj/7FA8dpZLaeI/zlGm6SG0IRagPYESd7c3Z0WlnAIcbB+mhvVjAtXdVwP3iLO7J3PFo2Iokd2AajyNT60vIsDS/22el8LnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746244388; c=relaxed/simple;
	bh=q2RR8OVcAZJle3hyo8Vnz8ALNHNRu1R3N2HGfJLS1yU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QMV+r6Mb8DJrskWuJIGKynUwgPYvsinH2DrYX/1SPwgZYujKj5SMNczCqgSbe/KkS9x22AIHY1WVEHcBFZy6n9XvhmxAgwCkeoF+IgFv4q1xFIJa1MI0AIYultsFl3FS8SfaETt2GxcY1GLRXYSyhhKgusT1B2Asb0CNstRaF3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJAoAOft; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746244385; x=1777780385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q2RR8OVcAZJle3hyo8Vnz8ALNHNRu1R3N2HGfJLS1yU=;
  b=BJAoAOftbqU15NCgTYgTGOSAqzdm0vGADfuG6SBJMBTaetgZlLiUanfR
   s9KanuT+2acId6OHeoTEEpwTbuHzReL7nNEWPK8bVz6NHCn4MAbZXYIKD
   Igv82BgufaCoJ2qIkllOpJDvOid/GNXC0b9NP6Zqo8CEDEtNnmnriD8GA
   lpBR3rUsGJjweaVfrPfgouXdhk/rQdp9n7EjDnVo4uKysndy6x0vkXOH7
   efBLqg5qOhSr/XXwUcNDA6G6hmJ0Ge9aJknNaidE2JMRtjZe1pXHLkopx
   v70LVY2RpHfOz+JKaiy4HKfen8Q9bK8lX3lbUcEPrqNX0hUqUISGI4JUJ
   A==;
X-CSE-ConnectionGUID: KWG8lniJSKWPBWhImWwW8A==
X-CSE-MsgGUID: 1TDx3zTiQNC3ATlUcf8s9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48070164"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="48070164"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 20:53:05 -0700
X-CSE-ConnectionGUID: HohjOS1XSW2dY4du3rUCiQ==
X-CSE-MsgGUID: LrrspF3XRE+vHRGtBqdsKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="139783391"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 May 2025 20:53:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB3vw-0005BN-1K;
	Sat, 03 May 2025 03:53:00 +0000
Date: Sat, 3 May 2025 11:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/msiof-fifo 23/24]
 sound/soc/renesas/rcar/msiof.c:137:23: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202505031149.KgbAFgWJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/msiof-fifo
head:   7b93d38b35516004a8e0863475297a7b47e7eec1
commit: d8dfe7cdd8980e08b9fae51ff9fcddac20eca22b [23/24] ASoC: renesas: msiof: Convert to <linux/spi/sh_msiof.h>
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250503/202505031149.KgbAFgWJ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031149.KgbAFgWJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505031149.KgbAFgWJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/renesas/rcar/msiof.c: In function 'msiof_hw_start':
>> sound/soc/renesas/rcar/msiof.c:137:23: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     137 |                       FIELD_PREP(SIMDR1_SYNCMD, SIMDR1_SYNCMD_LR) |
         |                       ^~~~~~~~~~


vim +/FIELD_PREP +137 sound/soc/renesas/rcar/msiof.c

   107	
   108	static int msiof_hw_start(struct snd_soc_component *component,
   109				  struct snd_pcm_substream *substream, int cmd)
   110	{
   111		struct msiof_priv *priv = snd_soc_component_get_drvdata(component);
   112		struct snd_pcm_runtime *runtime = substream->runtime;
   113		int is_play = msiof_is_play(substream);
   114		int width = snd_pcm_format_width(runtime->format);
   115		u32 val;
   116	
   117		/*
   118		 * see
   119		 *	[NOTE] on top of this driver
   120		 */
   121		/*
   122		 * see
   123		 *	Datasheet 109.3.6 [Transmit and Receive Procedures]
   124		 *
   125		 *	TX: Fig 109.14	- Fig 109.23
   126		 *	RX: Fig 109.15
   127		 */
   128	
   129		/* reset errors */
   130		priv->err_syc[substream->stream] =
   131		priv->err_ovf[substream->stream] =
   132		priv->err_udf[substream->stream] = 0;
   133	
   134		/* SITMDRx */
   135		if (is_play) {
   136			val = SITMDR1_PCON |
 > 137			      FIELD_PREP(SIMDR1_SYNCMD, SIMDR1_SYNCMD_LR) |
   138			      SIMDR1_SYNCAC | SIMDR1_XXSTP;
   139			if (msiof_flag_has(priv, MSIOF_FLAGS_NEED_DELAY))
   140				val |= FIELD_PREP(SIMDR1_DTDL, 1);
   141	
   142			msiof_write(priv, SITMDR1, val);
   143	
   144			val = FIELD_PREP(SIMDR2_BITLEN1, width - 1);
   145			msiof_write(priv, SITMDR2, val | FIELD_PREP(SIMDR2_GRP, 1));
   146			msiof_write(priv, SITMDR3, val);
   147	
   148		}
   149		/* SIRMDRx */
   150		else {
   151			val = FIELD_PREP(SIMDR1_SYNCMD, SIMDR1_SYNCMD_LR) |
   152			      SIMDR1_SYNCAC;
   153			if (msiof_flag_has(priv, MSIOF_FLAGS_NEED_DELAY))
   154				val |= FIELD_PREP(SIMDR1_DTDL, 1);
   155	
   156			msiof_write(priv, SIRMDR1, val);
   157	
   158			val = FIELD_PREP(SIMDR2_BITLEN1, width - 1);
   159			msiof_write(priv, SIRMDR2, val | FIELD_PREP(SIMDR2_GRP, 1));
   160			msiof_write(priv, SIRMDR3, val);
   161		}
   162	
   163		/* SIIER */
   164		if (is_play)
   165			val = SIIER_TDREQE | SIIER_TDMAE | SISTR_ERR_TX;
   166		else
   167			val = SIIER_RDREQE | SIIER_RDMAE | SISTR_ERR_RX;
   168		msiof_update(priv, SIIER, val, val);
   169	
   170		/* SICTR */
   171		if (is_play)
   172			val = SICTR_TXE | SICTR_TEDG;
   173		else
   174			val = SICTR_RXE | SICTR_REDG;
   175		msiof_update_and_wait(priv, SICTR, val, val, val);
   176	
   177		msiof_status_clear(priv);
   178	
   179		/* Start DMAC */
   180		snd_dmaengine_pcm_trigger(substream, cmd);
   181	
   182		return 0;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

