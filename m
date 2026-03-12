Return-Path: <linux-renesas-soc+bounces-29261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JCo4LX1bsmkJMAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 07:21:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D926D9B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 07:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C98AE3016522
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 06:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329CD34A77D;
	Thu, 12 Mar 2026 06:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nb+16wwm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365023EAB0;
	Thu, 12 Mar 2026 06:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773296497; cv=fail; b=fcWb4zcdXi5zqXrVJIhScy2PkNb2sW+z/gNhBTdxK6I3k0zElTSjjmSsaKvFoj0MxLAdNsn3sYOusJ3gq26joyCHjTPSsM0Sd+iKPVCQop4vOKvT2XkPnyY1PAzdMblya0XMU896lyuXJznsCxdJH+mAy9qxU2PaZpIXO15hSAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773296497; c=relaxed/simple;
	bh=8LBuVpMT4V3BIMi8t96d/Fh0KuswFH5xF7PLJCBERUY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QHWGFDI7DtnZ+nczvDmoO4px8PMwgHzk6xUwEkAZ2q9JdT+O39ShQfbkfOpR7r8kymQgmzbl8fMZ1EqssrBbbWzL9LRwyoKFxkaVtnz+NSX5MUn+u9n++QfWrPAAkQD2kzzUMKknAyVqLVSWstzaKBJQIXltYRTaIO8iGOer+EM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nb+16wwm; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773296496; x=1804832496;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8LBuVpMT4V3BIMi8t96d/Fh0KuswFH5xF7PLJCBERUY=;
  b=nb+16wwmRHmjohijjow/5C8DTUJ8nF+DRh1hI2uueCg3l7N+jiNelks+
   gGg3d/MlLiN2DRPaoQM0ziKibJP0A8LRuw3B3ARLHJXUVxjElnE2On2hA
   qj/0pjB6nABxKrlzcljfsI4tqLLABDYhmXGCL3h4EavYe6wde3iAQw0mK
   RlYgrxR2yhyB2NYelAft5fHS5Les3J9GUmbbInvGWrvs+MHPAbSpPtfLJ
   rIvpzu5IGG2RHFv6UhWxs+CraffpuxFCfiGfIpmirInoqJIkrQVgQRNpT
   gFOs1qg1sV//LxUAjgd2jB4/AhYKqk6Rb+y2WW9YOti+LX+ZkH7tPHGuu
   w==;
X-CSE-ConnectionGUID: eZC+cXViSbOYDiAPc/ocow==
X-CSE-MsgGUID: ADDSGrr0RY2Jw5bx0OZwvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84697760"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="84697760"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 23:21:36 -0700
X-CSE-ConnectionGUID: JKSjqf14RVe2toBBcuCM7w==
X-CSE-MsgGUID: 9sqT3DFnQz2/ZWFIgstHkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="217298690"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 23:21:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 23:21:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 23:21:34 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 23:21:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bycl+f3Df2PPDC9ckjM/qXFVUikLh6AMfbxAIO7sanR2i7a705POHJsLoKLg0O3SnuEq/BXAXqR6q6fJgMj+12OR+Hb1CwKJKyG0em8GvZM159fyWlhx1HzxoT04DIII608eJXbXe0JBUJfBlAun6T3ln83ZWidIexYD7pAcrT+ryxU9MluOkUff81vd2dUxUOaFGhBJF4CTTGWxj/T6k/8WNidhnIejWuFh/WrgGC3f23P4AQ7H84L/Trc4sNKxePDWvZfnjFcphWLvQQDsj3qxEj+pFRKt4K/jkPgQOv1vNHRxD1LsywD0dgaaP8D3pGADguvPwoMCSvjM8EoJxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LBuVpMT4V3BIMi8t96d/Fh0KuswFH5xF7PLJCBERUY=;
 b=Lw4BXGBuI/0SfsAUyvhTA4VYp6xp6ZRjII5KeowyWe7k0+lxX+kOeT6/D+XHyPNAsl2fyXNt3GE5a632sKhUtOHlWMyQn3gcRHQ0wam6a1pMYw/JsWhAOA44ojD9mkr0nygucOR+3wICvhIZiJYlEU/vm074EXCUm/Z2JFDLrb+KhpACwpD5Mh3vgSYP3Eoti9j32qTNN78qQU33FDvlUldZwXPqf/lIx4a1CpTwxDhLKVjk5zQ4or2ISVlzpQSTWX83c0AL++aU/WubkGD26W2mBRukZGee7ohnTgLm4GaVZOJkfODiB74P2IAGCv2T+/5PFA4zhOE6a1iuKlZzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW4PR11MB7031.namprd11.prod.outlook.com
 (2603:10b6:303:22c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 06:21:30 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa%6]) with mapi id 15.20.9678.017; Thu, 12 Mar 2026
 06:21:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
	<freedreno@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "kernel-list@raspberrypi.com"
	<kernel-list@raspberrypi.com>, "amd-gfx@lists.freedesktop.org"
	<amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
CC: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
	<arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "harry.wentland@amd.com"
	<harry.wentland@amd.com>, "siqueira@igalia.com" <siqueira@igalia.com>,
	"alexander.deucher@amd.com" <alexander.deucher@amd.com>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"liviu.dudau@arm.com" <liviu.dudau@arm.com>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "robin.clark@oss.qualcomm.com"
	<robin.clark@oss.qualcomm.com>, "abhinav.kumar@linux.dev"
	<abhinav.kumar@linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
	"sean@poorly.run" <sean@poorly.run>, "marijn.suijten@somainline.org"
	<marijn.suijten@somainline.org>, "laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>, "mcanal@igalia.com"
	<mcanal@igalia.com>, "dave.stevenson@raspberrypi.com"
	<dave.stevenson@raspberrypi.com>, "tomi.valkeinen+renesas@ideasonboard.com"
	<tomi.valkeinen+renesas@ideasonboard.com>,
	"kieran.bingham+renesas@ideasonboard.com"
	<kieran.bingham+renesas@ideasonboard.com>
Subject: RE: [PATCH v2 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Topic: [PATCH v2 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Index: AQHcN02vT85paMQB00aFK032WJKPYrTie72AgMjmRjA=
Date: Thu, 12 Mar 2026 06:21:30 +0000
Message-ID: <DM3PPF208195D8D60E5844D898148588465E344A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251007054528.2900905-1-suraj.kandpal@intel.com>
 <20251007054528.2900905-2-suraj.kandpal@intel.com>
 <d6545844-f7f6-4714-927f-cf985dc50a54@bootlin.com>
In-Reply-To: <d6545844-f7f6-4714-927f-cf985dc50a54@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW4PR11MB7031:EE_
x-ms-office365-filtering-correlation-id: a1796b0c-3328-49bb-c5a8-08de7fff9977
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: pckwcjPXKaA+DBRlCHY24njLoVy+UEzmNToBdcmQcPrbapg/xQJEvX2bh2maQyFFPH+GmmUudBGc4YrwFhRxM/VtIkvh7bG0NIQF2szv3i5iOUdRge4bfb4ck+CNs6RiJ8yUnok7+Dzjf1frzZI9tY5XVsZ7EQItCPIh6FouvLXWdwA95q9vffzjqlZ7lo4/3ERtauKjE1fgh6tIaG6DkB2G+erwbLt+zhmbxAU3cefD6EAlJt8priSnJ8sQizs8Sunpczwv6lyKyNdpf2WLHW8zltzTfaDMRhALrpLlOiMCNxz1QRz2YeqxymWgu6E0oYSqtQf3eakq4JSrxtlNAPKAVMRF6z6w21ker0VQKHzImphUafcf3gbW/vt9zLgYlojhnKkoCHVVPBQHKoBaRHxwowXqPjLM3ziNaHOdhQYojUB4qf0WuMHpcJ6WUT2ZnaM3YZlkR2XfBTdUK0ZotP11OlxnD9bS01vjlyxd25dDrTNlZy6CO3YBs0qEUicg0m9F+lBDfdNcvu9vRF98xH/ej5fOcj5YK9epx362mDtxMYCWeEfvOVc0+5wfL0aZOToFA54luzPQNNcVe6sUpenu6rzpt/RobWrbvYt18ivsAWJ1HAL0LFd/cBq0lZ+r4S+ft+0PcFhDIOE9Ev6pjGb+gyBOdsH/jyHiS8AurY5zJQkR7WhpSSziqrcsUv0jM1rKISZLTENECkczdhtSg/Phit6cA35H0Dt8guwC1AwrSNe0Jhk6a2xrIqpPjSEy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF208195D8D.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RE1LTy8wMTRlSkI3VGVUckpvRTB4MWhBQUgvSWRTUGJqZlF1SnhzbTNWMDFm?=
 =?utf-8?B?SHRFdk16Ym16YTJMazU2eVd0Y2NicW0wN2RQNVpwZmw5RWxZUWNpR0pGQnV3?=
 =?utf-8?B?UVFRRUM5VStYT2d3OFczSUV1V1dnRWJ0Z1ZVUzQ4c0RIaVMxbHJjYi9vNWo3?=
 =?utf-8?B?S3JVOERzaUdxT29uYzBFeXhLaExXU0JWNVN5VlV3TnVTRU8ydk5pNDVtdkN2?=
 =?utf-8?B?dlI2djllcnFKME1tOWdtdmRkRm5iNzN1UE1SbE5aNXFrc0QwQ1hqZnM4eWIr?=
 =?utf-8?B?eVFoK0c4ZWF6dmtneWRadTlWQTM3UWZDMjM4aEtXWHQvL3J4UUp1QVFTU2lF?=
 =?utf-8?B?TVdvdUVDVGRzTENDbmlVZ2ZyL3Z2T0R4d2ZiSnl2anp6b3R2akJSUWZZcnE5?=
 =?utf-8?B?MmRZNWNCOElacnFvbXFvMnJZNkdWK3VCKzV6YmNEclZpVnJ1R0hNK0F6RU14?=
 =?utf-8?B?cWF6U0hPT3ZVVko5UnNBTjJvNHhmc281dEdOSFdFQWhwUzZVQjRMUWpjS0RO?=
 =?utf-8?B?TzU1N1Y1K09rVmFldlJaOG8yMjB0c3dTZ29jS1JwaHVuZkp1c29vS2JiV1BP?=
 =?utf-8?B?SUd3OEdVWHY3V2wvRVIwTDFIckZqWlNJcjJORXBEK2FmamZBTVlNcThXRitU?=
 =?utf-8?B?QnpYNXAydG9zNTQvSDFXdWtySm9DcExWdG9lWnN5MmJZcVZwQmpaeEdRUjNS?=
 =?utf-8?B?elNDQ2lIdDZlemhrcnVQam44ZlJjblhhand5d0Z6NFpOUjV3Sk0yZC9Bd2Jo?=
 =?utf-8?B?a0VuVVBvTndubm5xZCtHWUxodnRqWE8vU1YzN2RCWUJFbkdlRjl5TFlla2lT?=
 =?utf-8?B?cFBBQW00THFMOGF3aDdTVmdIc0sxeXo2RTNudzNJTW1tamphb0V2S1Y5RUpp?=
 =?utf-8?B?Snl4L1ZOMDVRZW05M2xjWW5ZUjN0OHNJOXBFdmZsM1UwNTdxOU1jWjd3b3pp?=
 =?utf-8?B?ZDAzOUZ2dmcwWU9UZ0pxRWFHNjFtMHlJOWVZTndWYzNCL0hobTN6Uk1pSEtW?=
 =?utf-8?B?KzlqcHFTVW4yZUg3WU5Nb3o5eDVMTnVFeTdNODl4d3JNNE1UZDBrMmhLR1lX?=
 =?utf-8?B?bnBZUi9rTjNJa2ZBTzZSb1RXTTFTMFFyOEE2VEhGR0szSGxGNkNGZ0xVOUtE?=
 =?utf-8?B?bkNOS0czSVlNRm5NN1p3eGtUTVJRRnpBeUt4Tnl5dmlTZ3hXaXhMc0lFMlJa?=
 =?utf-8?B?R1lHNGtrandCL0NibS95elk4WGZVWU1BNWxKKzljeHRqNlJmcXhqSjBkNnF0?=
 =?utf-8?B?b3ZvVUNDUUpXQmtrKzF0L0xramp5M0pnbXF1VU5BT3V2MGxPNzl5Qm5BMkJt?=
 =?utf-8?B?OEJScGRkNmRHdlBDdHdrc0dYSUNIOW12UXhVakk2TWppUjlLazFHVlVvYnZ2?=
 =?utf-8?B?QWdib2RndjdranFsNjMxQ2lZTko5bkJTb0R5MW81Q3lQT05XY09tSHlvNzZt?=
 =?utf-8?B?dEVqZXVjMlFZWFlqZmx5SFh5TkVjV1Q5TWw5MzZZUnF6NDdjOTJoVDNQRVBZ?=
 =?utf-8?B?bGM1c1ptUG42UFFZSnI1alRFZitRblN1bHRzTlJLbVJ5V3NSMUJ2RDFZbkZz?=
 =?utf-8?B?Zkp2QUMraXhYU3VhRCt3cXorZW11dGYvbEsyeHlxRTZtQmdiSndsT2JmMVVM?=
 =?utf-8?B?TXBobTZFc09pM0tPUWMrbmE3SlAydkEwanFpa3E4aW8ydmc5QzlnbE10MG90?=
 =?utf-8?B?TVFBb2JkNmxUbkpyd0NuY3BhV1haQjdmVXhRdlVMM0lUQWpGZnRCVGdHU0ow?=
 =?utf-8?B?NVBoc0ltVHVUVGhPWHU5blNURXdxdFZud2hSSUYybTR0ZngyNXZCVVFNRWht?=
 =?utf-8?B?cFFSc3h3RTV1dXNrUm1qdXN2NFhMNzI2VUNuc1hKK01mRC9HdS9ra2tOTHVS?=
 =?utf-8?B?RWlEQjc3dCtGbFJNWUIzWS9YUks5UFZrcmVWRUYzcEZBUDY0RStaVlVSTkV4?=
 =?utf-8?B?aGVoUVZjcTJ6TFh3MVpJTkU3UnpkU29Bcm11V0dnMHhQY0hocDZ0ZjY2NTQ1?=
 =?utf-8?B?aXFzQWloVnpJRjlKMzQranMyTFJwbExWeGR5VUFCNUVGSUVvemVIZXBXd2Nx?=
 =?utf-8?B?WFhYcUoxbXN5dFQyODNPdUNYakkxalJKY1hlY2lkK2k0Q0xITS9IMEhKbWk5?=
 =?utf-8?B?Qlo5MWtHNXR2a0l5R0hxdStGOTBwelhac3hIemp5YXJSbVZ5allFWDc0anor?=
 =?utf-8?B?ZjlvVVJsWFYwVkdYbTdmVGRNbzQzTHdCdk52bHlER294OGpEc2tTL0k0TEUr?=
 =?utf-8?B?dzNtdUhTQ0F3Y2pOWXR5Z1MrdHVwekJrR3I3N2JHSzN3N3RKVnY3b1oybW9w?=
 =?utf-8?B?WlNqMURsWm9acEJRbWU3ZE8reCtpS3puZ3k1MlU2QmdLa0xCWTNQQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IVVFCZ3fFLq5jE3dPHAAFOQ6czgLuiQNn7SXXuhpf4pIkvJ9v6k8SgkQxy6KxX0ZSQvMsKiehIsegHEHIjbffO+qmBrMVCeaQPo9no6G+CHzQyxXg2c3cleCDJX+OF6JZeQttmEqfeRDdy6LJKP6BD3AbwWON+OHQ4xutyYKBRnK2uaUr86FtZ5YgomTfF/gG2IbDoRQxO0lT/ouba2CbCvMqJbrx3TGLIm6Sf5D62Gk4PjrgWNdFQo/k/dBTv3nJYd+3ByqTJkB/Yt4Iamg2s9JssRl5xmw/NA4DGS3GVKlJxovycXgP3GejsNiA/ZHoXTTxBDUyM9/1EeZkNl/1w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1796b0c-3328-49bb-c5a8-08de7fff9977
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 06:21:30.0962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a0Tbb4EWscMj1yx4ZBCQRbKeHu4GP4iIhzfaiiX5DS3+ROKcl2mbOVYAx6sJPVLiQWlY46PBZHgFZTh268FlkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7031
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29261-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,linux.intel.com,kernel.org,linux.dev,suse.de,poorly.run,somainline.org,ideasonboard.com,raspberrypi.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suraj.kandpal@intel.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 127D926D9B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiA+IHdpdGggYWRkaXRpb24gb2YgbmV3IGZ1bmN0aW9uIHdoaWNoIHJldHVybnMgdGhlIGRybV9j
b25uZWN0b3Igd2hlbg0KPiA+IGRybV93cml0ZWJhY2tfY29ubmVjdG9yIGlzIHByZXNlbnQuDQo+
ID4gTW9kaWZ5IGRyaXZlcnMgdXNpbmcgdGhlIGRybV93cml0ZWJhY2tfY29ubmVjdG9yIHRvIGFs
bG93IHRoZW0gdG8gdXNlDQo+ID4gdGhpcyBjb25uZWN0b3Igd2l0aG91dCBicmVha2luZyB0aGVt
Lg0KPiA+IFRoZSBkcml2ZXJzIG1vZGlmaWVkIGhlcmUgYXJlIGFtZCwga29tZWRhLCBtYWxpLCB2
YzQsIHZrbXMsIHJjYXJfZHUsDQo+ID4gbXNtDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdXJh
aiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiBWMSAtPiBW
MjogVXNlICZjb25uZWN0b3ItPndyaXRlYmFjaywgbWFrZSBjb21taXQgbWVzc2FnZSBpbXBlcmF0
aXZlDQo+ID4gKERtaXRyeSkNCj4gPiAtLS0NCj4gDQo+IFsuLi5dDQo+IA0KPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL3ZrbXMvdmttc19jb21wb3Nlci5jICAgICAgICAgIHwgIDIgKy0NCj4gPiAgIGRy
aXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmggICAgICAgICAgICAgICB8ICAyICstDQo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3dyaXRlYmFjay5jICAgICAgICAgfCAxMyArKy0t
DQo+IA0KPiBGb3IgdGhlIFZLTVMgcGFydDoNCj4gDQo+IFJldmlld2VkLWJ5OiBMb3VpcyBDaGF1
dmV0IDxsb3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29tPg0KPiANCg0KSGkgTG91aXMsDQpJIGFtIHBs
YW5uaW5nIHRvIHJlZnJlc2ggdGhpcyBzZXJpZXMgY2FuIEkgdGFrZSB0aGlzIFJCIGZvciB0aGUg
d2hvbGUgc2VyaWVzIG9yIGp1c3QgdGhpcyBwYXRjaA0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBh
bA0KDQo+IFRoYW5rcywNCj4gTG91aXMgQ2hhdXZldA0KPiANCj4gLS0NCj4gTG91aXMgQ2hhdXZl
dCwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0
dHBzOi8vYm9vdGxpbi5jb20NCg0K

