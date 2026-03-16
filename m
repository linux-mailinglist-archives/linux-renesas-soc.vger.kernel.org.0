Return-Path: <linux-renesas-soc+bounces-29517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNVCLsYquGnhZgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:07:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B733029D106
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8AA08301CA8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E987C329E6C;
	Mon, 16 Mar 2026 16:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWIK2Iyt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D732939C;
	Mon, 16 Mar 2026 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677224; cv=fail; b=Cx6LJvzoEHyXflhOYrzOYuxaEK25lty+0sxMu/+wz2CNMOWtYfmE0MgqEryQnq2G3fgX28vANoO12oZZsYZ2vusUJ2MH3xlYfbImwS9kbSBb6B3lixqw864+702Rh7Gwn817LAB6vk2EQi/R2BMGq2w6R6OKnbiVwBche3J0AhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677224; c=relaxed/simple;
	bh=rQnX8bjKl2D0JalQDdx0AsTGtnHVhFoZwYjfooJFy/E=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DNGRbuXPlrkJsuabo9R8I8PowisjBlWiOJZJDQQg5mVDHWShW3LUkPLYTORlwZXL4ua3WN/K2HpF34+DfkoFkO6XwuyeT4IYkAGb7F9RbSE5csIHL5UuZvsTB6IKLhcDuFjpbr2ksE7iCr2dNPE2VV5nCKXS69eXCdqZCD/OuY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWIK2Iyt; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773677223; x=1805213223;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rQnX8bjKl2D0JalQDdx0AsTGtnHVhFoZwYjfooJFy/E=;
  b=kWIK2Iytxps+czraQkpcykLGa2LcfMCa34LedWxJiFaeVS4KfT9Z/owT
   iAhi4vTD2g5533C0jL3Y0vV/I+cgu2MQ+UgxvlM64RX1QZVbJxb7lCijf
   U86A4jG7cbHlloaM5kijs5FBpHuRhh5SKrgz1Hd1KGUkEhAyaScYBexHN
   sdrUMtiMh8RHnRXnRhMBwa8pGFy+hC0kBcYbR4SqSTQggHQMuiDBuIp16
   ekuMkOABsLtKDzQYashH1gAwM78nGGeno/x2GJws6pXcPVfg1Xnl52mic
   6fcDqQTDIKFES9ZIDw1ziL52kuaZf2vRcvO160TeHRwiGH3SuwDKM/i5M
   w==;
X-CSE-ConnectionGUID: AvRxA9KyQ2iX/xRyRuYH0A==
X-CSE-MsgGUID: mDOfMoDuR/aXD9D2EZrk0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="92081176"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="92081176"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 09:07:01 -0700
X-CSE-ConnectionGUID: CQoclfGaTYGRmUWCCUbM6Q==
X-CSE-MsgGUID: H8G+w+VLRfmAC46Zx6CHVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226957214"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 09:07:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 09:06:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 09:06:59 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 09:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bp4tNU++N+pxFU2he1L5t1MHNml+FzvaAyT3bign2Bhk7MoBOXnciytjjQJWvadbayTqc2iStQoFqf76bR/l5tlzZkxZ5V/YmZEBM2sEXqsjB0WAcpXSLjujoOxBZVoxfysaW9BAqg1HXT13TyDNi4BAeYymxG6zHLXoxJXf0tF6wfbR+7J4QMmZOojLaKnkeKxrihIDUSXYoFw9NUwrKs72/2jM8MKi7HpJUXIro3RTBiG0XiJBT7H9DG43tYcqrenVuYjs99xf0+cyj2zdKWXGaIeUfxR9CjhGrxUbCUhv6EpL5Q1h++wfwpnQj0pjzfBng5EonJ+onH+4FuvCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqCOP2eaOgXQOR+bNJbx5qpGOPvVRCyUV7ISBnp0MUg=;
 b=ncWCiFRoJPpy4bGYK72bqI7t6bysq7kHPAWobMPcJL7fGPaD1QXVwyyaxbhyjeGGUL9Ni+h8sT6YbV30ST0FHIhz4GCVEQNdrs6uXWHUAkdy36NmEVyGQ3qvz1S0fc8PiCHPV7dg3v22DhrIC8g2bVEFrBExreX7m5G0xMi5q0b4S6b2AWyL4n8Pv6638GkPYRdM0Vh79fH4OQQM8h2q/AiFlkH6cPwV6tPRcG3diNgKBkQVToVickEjSvIpps6eL7HfwyUn68lQjrnxHaLz2WcsZp+rn0bRl4DBBrLLNkG18l8LRD0ZsOms+pPivNmkV7XJxMxTkMJyvSv2FtRrQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 16:06:54 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9723.004; Mon, 16 Mar 2026
 16:06:53 +0000
Message-ID: <8f715aa2-05b8-47bb-9417-8a301269ce91@intel.com>
Date: Mon, 16 Mar 2026 17:06:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/29] ASoC: intel: name back to pcm_new()/pcm_free()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
 <87sea0jyr1.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
CC: =?UTF-8?B?TWFydGluIFBvdmnDhcKhZXI=?= <povik+lin@cutebit.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Andrei Simion <andrei.simion@microchip.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Arnaud
 Pouliquen" <arnaud.pouliquen@foss.st.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>, Chunyan Zhang
	<zhang.lyra@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Cyril Chao
	<Cyril.Chao@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>, "Daniel
 Baluta" <daniel.baluta@nxp.com>, Daniel Mack <daniel@zonque.org>, "Fabio
 Estevam" <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <groeck@chromium.org>,
	"Haojian Zhuang" <haojian.zhuang@gmail.com>, Herve Codina
	<herve.codina@bootlin.com>, Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter
	<jonathanh@nvidia.com>, "Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolin Chen
	<nicoleotsuka@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Olivier Moysan
	<olivier.moysan@foss.st.com>, Orson Zhai <orsonzhai@gmail.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Ray Jui <rjui@broadcom.com>, "Robert
 Jarzmik" <robert.jarzmik@free.fr>, Sascha Hauer <s.hauer@pengutronix.de>,
	Scott Branden <sbranden@broadcom.com>, Sheetal <sheetal@nvidia.com>,
	"Shengjiu Wang" <shengjiu.wang@gmail.com>, Srinivas Kandagatla
	<srini@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai
	<tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Tim Bird
	<tim.bird@sony.com>, Tzung-Bi Shih <tzungbi@kernel.org>, Venkata Prasad
 Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, <chrome-platform@lists.linux.dev>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-sound@vger.kernel.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87sea0jyr1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0003.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::6)
 To SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|IA0PR11MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e77b6e-d491-4770-e97f-08de83760a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007|56012099003|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: Sh3xbFwgmzREA9S5h5o1ln0egQp4IIm93sjzq5Sm8tcgYL46SLauyrQwUDVpom4fQUxO2F4MKesgvvJ4IhtMb4k7hz+xTGxDcrHn+E4y4HnWGYGKPcvcB9KwC6NzUuuObMAx9VsRjuEBka/pKOYt0VQIqrTUBAIO02gwYzgkKpzc16YwmvTcmBHtCwgYy1KbkHzXmqjBHxRe5N8o8krHlqxnV4l+WYmhiWeHu2ZM7YZ3bGujvMp0UyzoLwe/I9CAtmev3LUtOkHcCjn02ub8Oh1yeANERDpuYUHM4ftgZrL6bIhsSZcfEUYUbSaibS7Vv1pqprq6pVh9aow3A9DZEMgaIgnEW5J4Kl/NKrzfKZVBtyGh0V/zHp4qbYRIt4wfv9sFpkdCwYBME5Yc+FqO5DcxRd6jXF+hA8cSKzq4xxGx13wuoM27vuAAg+n8HQ4afP/PfFTDy1JW7S8KBCMpc187mO1vvAVFST7R6+SKY8d+Fxky4kWtgb4FUbxfuX43lEISdznqOpeIYJXqgkmvZuDIZdgE7RdMM6TDU0hu6ul8ABlo1r1u650DmDzCSfJOy6yBB45610VMlW9pqhAJy7Ykr6k42mCJZv35ssU5S4VVK5EX18nqlPvw5YMuwkj1kFS9gkWSap6w609AuGRivU1zsBMtwAMtbgh3RVsIXKWBgF0jwKwsfsHT2YPpIQBcCqeXUBPtb42rhtxwfHa3bp+wJbVwTTKgOpm2vQKBX3WHC8bO6hCOQSbZwZ8s8O+p7403kqIo4S+cfBFap0wHx6RhH4JHNIBFDtIVcbd7i/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(56012099003)(18002099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUtQQjl5a3Z4RUxqTCtVRlpnOExBSWtFc3JNN0xPcU5KV2k1V3BNNFJjZ0Vm?=
 =?utf-8?B?cFBOOUpyUFpIdjE0M0srZGsvOHJjYVNwL1o2ZHB0NWNjVFlIUkJQRVFZS3F1?=
 =?utf-8?B?dnIwblRhdExVUDZLYXFsMnAwa2w1U0tBdzhmdFkrSU9LTk5RNkQvMkgvQnNH?=
 =?utf-8?B?S1VnOUtxV3k2a0tROUI2VWNSdjBhVEh0czVPdEd0eVZpVUN4VEJzZVBOSnVQ?=
 =?utf-8?B?bWt0MWE5MUtXVTdVNUlDMFFDcW5jbXkxQW9ORWp5T2lXK1JRUnhPMGVsckQr?=
 =?utf-8?B?WDZoZ1VFWHhDZ1Z2NExubjE3M0hDTFZnOWp5d2tEV0JZTklHL3doQzAzYllS?=
 =?utf-8?B?aGhCbkplZzQzSkZFTWQ5ZHEvUlVpdXdMY1ZJb1J3L0g5V0g2UlhRaDdOTjhI?=
 =?utf-8?B?ekZ3SDZjb1JYS3lGSzViNWVkdVZvWExCTHpMR3FqNjdvL2d4U3pETnVzczdY?=
 =?utf-8?B?Z08xM0FMQ3E3L2JOTEdvOW1BTU5tcFF4WUphM1grUHdrYU90ZDlKd1QyS0Fi?=
 =?utf-8?B?dUdYRVRYT0lFd1N4bzdIVVFTODJlV09mZ3QxSkNvcGo3VkxBN1JOa0QxWnli?=
 =?utf-8?B?NUxLVWlWcEJaYzc5a21JMzMxeFRkWnZuV2lBTlY2WC82R255NHh1UWdJNkpZ?=
 =?utf-8?B?YzkvSGdTMGNXeCs5bmQ3Nk4xWHMzaVhOUXJ2TmEyWlBtQUlNcnVKdHZwd1p1?=
 =?utf-8?B?dXFzOG5tdkdCYzFWTTR5ZVFGSGNUejE0U214aHh2cUFWaFkxMyt4YmRVN1V3?=
 =?utf-8?B?Z2FVSXFkNzBCTWViUlU3S0ZMYkVYRTFXQTlGbUVNeW1uRGtIdkNvTklZcDdt?=
 =?utf-8?B?VzBmUjBMVjlUTk9yQXpYSmpQZUkxMjY5T0Y0MVI3eGZqR1lzL3N4V0p3WE1V?=
 =?utf-8?B?SXpkYTlQdmhYWExXOVV2dHg0WHYyU3Vld0lhRWFPRkJld3BRYkUwYVQ2VTFF?=
 =?utf-8?B?Q0dQZFBZN3ByUEFvZFYxMmtxWGxYalhDaXFJaDlleDY1Vjl4QXY5Q214N1JL?=
 =?utf-8?B?L1c2VVVFZkRhS00zQkJxVmNwYmxkMGRPNXBHYndQcVNRbzN2WjdNYkpYN0VF?=
 =?utf-8?B?UThEb3lUV3ZFK2ZwOGVuMFd1bUpoQlZEQmZCODdhWHZmNkVNaDh5dzUzVkty?=
 =?utf-8?B?MjRvVUpWdGNMM3lsOWU4bURDVkNSa3dDMDJzSFZWd0kwY1p0UjRWNU1qVUYv?=
 =?utf-8?B?UXNaZG5lUjhrYUN6bjBIbzBWNTBCU0tTUGxrZlQ0S1hpV3c0M2djUHZXRDBa?=
 =?utf-8?B?b04xL2libXV6aW4waTlpcjBmZWNxNWxLd0hDVmdRY1FVWWhKMUp3VWNrakJl?=
 =?utf-8?B?RmpsRFhEVkVDWldvczZYajc1M3JsaHFML0JVTEQzb25LVncyRE1zcnZvRk1R?=
 =?utf-8?B?UDJiRno2NU1ORFY3M0owbU1BTmNRK1NIOTgrdmtCa21BVWh3bUhORmlTR3g5?=
 =?utf-8?B?VVZWa3d3SzlWZFRQUTdpWHFsaFlLRDdkUHk1aC8welVKNnF2SVFBVTJSTUxQ?=
 =?utf-8?B?SE54eVIraXozTFJQZkNuYnlCUjEweW1yS0laOEs2OUVSRmRkNkluWlVIYXRo?=
 =?utf-8?B?UFZBRXFhUzRrS3hVNDVkNmsrVXczbnE4QWFwTWcxZ3dJRUlENW5DZEN0VlBt?=
 =?utf-8?B?WTl2TkZweE9ZZk5uVW5kLzRhUjVZUURMTTFCamVQUEJodGZLcFE3UEt0eDFP?=
 =?utf-8?B?QlB5ZjFxQ1dqUjRRWEZVeGJ3Mng5WjdNSit3TXZtMThuQjRMclovVktodkNh?=
 =?utf-8?B?OHlPcDVrTkFqT1FXNjlRMHlnT1I1RWF1WkZtVVY5SHVQdVZ6c3h6Vy9IM2po?=
 =?utf-8?B?M2VETjVsa2ZKbWxYWFBrUWJxMWdBSGUxbUIveGtvYTQwQk1mY0xxaU03MWNa?=
 =?utf-8?B?S1oza0ZRS3pTK2dIbzA0UkNnQWFNRFk4MzM2OXF6cE1uOHV6WTIyM1drMnFz?=
 =?utf-8?B?aGVCTUdka3RMeUtJcDJ2elYvK0MwS1lQRGF6SW0vaEVDTVdZSHd2TkFLdmNi?=
 =?utf-8?B?RW8yT2Vna093cEZXT0JzUkI0RXVCcGFuWnZ6Q1MzODNOL2VXdVFxUDRNeTN6?=
 =?utf-8?B?N0RiWUJhd0dUVzFkZzZQRHQrcXJnSk1OVlFKU1VZc2NTdWxGbHVaekQzQjhK?=
 =?utf-8?B?TXNwL1A1cGMwM04yb254N0tjSnNKejMyS3lGQnJZcnFkT1QyWG43NXF0UGFU?=
 =?utf-8?B?ajVVTFkzbmhURHJRbmdiN1BpdVVQQVRpSmw4bit4QVhUUU1ET2xidlo1SzRp?=
 =?utf-8?B?RzRUTk9qTllKRHNDWWYvNzFURDBVdjFmZmc0eDVHczAxN1Z5TUZGRUZLM2ow?=
 =?utf-8?B?QjJmV1VERklLb0FCaXdyeHlCVzZZOU1oSUprNVp6VFpGalQ1ZHRMdmhIWUx4?=
 =?utf-8?Q?wyroE2H/erYps4gU=3D?=
X-Exchange-RoutingPolicyChecked: iP4wCRIdiD+1I13h7KbnuH4AK8Wtks2vTnb6bSs8dvezuYxkP6QJL42VVmbXjpAcXJuvSQ62RodTpkEIuKJf3RCuGDzl2zRC2IDBdeGblOXp11wtt6ke4FK9zk7yBRP+AYnlHXq2jx1uRQw6n0MVTIrtHsPzprxbBNf6NIwtnBtvipgNTC6G1IkWMHlEFEsjCvXoAFOKnQmb5FJKlUpbbBgNm1XU3xPbVUu0i87Tpu8TRVtIlgvT0MVYNvJl9SoPoYutFQ7BLb9oMRe4Fi+eJ52KvDEqCY+LmR3riwMKhZerMcOk850I33JT7k4HUqrFS4kiMcUALfFgB3dsXaLZ0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e77b6e-d491-4770-e97f-08de83760a4a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:06:53.7361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWpiZRu3iIBbx2TLic26+uRQSv1A1JmgjQ/aMk8jCSBNOtvPfIPQ860EfecUltOTjCStrCwG/pjCgEuHoX0RtkcysHsP50V7bXZjLVQk9Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29517-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[67];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cezary.rojewski@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,lin,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B733029D106
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-16 3:26 AM, Kuninori Morimoto wrote:
> We have been used pcm_new()/pcm_free(), but switched to
> pcm_construct()/pcm_destruct() to use extra parameters [1].
> 
> pcm_new()/free() had been removed [2], but each drivers are still
> using such function naming. Let's name back to pcm_new()/pcm_free()
> again.
> 
> [1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
> [2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
>   sound/soc/intel/avs/pcm.c                    | 8 ++++----
>   sound/soc/intel/catpt/pcm.c                  | 6 +++---
>   sound/soc/intel/keembay/kmb_platform.c       | 2 +-

I'd prefer to have this split into per-driver change.

ASoC: Intel: avs:
ASoC: Intel: catpt:
ASoC: Intel: atom:
ASoC: Intel: keembay:

However, if Mark would rather leave things as is, then I'm not going to 
push for v3.

