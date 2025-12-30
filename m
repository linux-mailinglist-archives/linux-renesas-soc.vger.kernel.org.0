Return-Path: <linux-renesas-soc+bounces-26212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB310CEA4A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 18:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74E3A3021786
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 17:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129F933291A;
	Tue, 30 Dec 2025 17:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7HnRJiJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910ED2D0C9B;
	Tue, 30 Dec 2025 17:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114625; cv=fail; b=gdydwseF8Njjk4Q7HGYRlZ93DAty2EjsAO6KPSyoMYnAQm/Abb+u6o+UOBeAs/uQnuRCrbyHXCBI2+z95UGFCgNJV/t2pctwYysZ7E4tztaBDAdF+As9p3rIxa6ex/Yd7HBCGZz0AAMPLtgT2zsFVjPzX2I/1cIGz1Gt39E2B6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114625; c=relaxed/simple;
	bh=3izSmK9rSVlePenCfKW7IwFSdvCiHZjusOgJ6493XMQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V0PG9r2St0nOUjRzxiv/f+Iytb13VItPt3ETyJxN2ifQJR1o2aQclwMnnb75/lEY+K4joSqi763secfjVdMA8Ls7asGCgBsFPzwRIAFurWXqJk2Qo8//dSg0KFGQ1CLnESZPHYelOT7EAo9UugqrEqh3ilb1ixQkkgHN3a6c5yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7HnRJiJ; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767114623; x=1798650623;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3izSmK9rSVlePenCfKW7IwFSdvCiHZjusOgJ6493XMQ=;
  b=l7HnRJiJX+BqmArvNZPW6FJqvmaOaPiOyQa6SnlW4n5ou6feLK89vApR
   ER7gEDGAVmjJQ3zKD2/K81YLFrY5Dx1DhboMTljuzxoFIrao/Qr1CHlzQ
   0BnHlsP0mpITFyUBsrOXYD+bNHDsGzXcsBjdrgVC/S58RiGg0fDKI/mus
   jJFaGDgL0A5Hlcxp6jTu+NkI3E5sTazoxd8YWsK2uCafpmQ0L2j+/TyR5
   TA4vxaOe3Bu79IAsbJ+ozAOMXuD6V6DNNYnC2pCED7nk83vA8kRtKAXqx
   PAoQ2J7frQb4sovNL0damVi3waTsOot3NycLEjlbiZc1MiIfYx/YauUWn
   Q==;
X-CSE-ConnectionGUID: JgblqRwmT0CUGvojq2hQtA==
X-CSE-MsgGUID: RUD3ki18QaqYFW/QKSmImA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="80153056"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="80153056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 09:10:22 -0800
X-CSE-ConnectionGUID: hNcnwPoBQ6mvRW0a1EQ9AQ==
X-CSE-MsgGUID: lTEl6lcjRYmmIKdEedzWrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="201259892"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 09:10:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 09:10:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 30 Dec 2025 09:10:22 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 09:10:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPpgMGJp1Ywro1ZOypSY/BcYX3nYt+GEkJnZPLz+IGPx7QHezjJ3ABrdJnpmtkrhLdBzJvqu3Sdv7gr2s8NPPJUlG5qsUsNZcGx3Jo5n08MOSDyYvYgWMSTnmEzp7VeOXrEupx07z04Wq42Xgfazr3NmrcUkMWYHDCkqR6+1xCLJ5xXNOgws6XJ/XOLQXK0xdSI+3swqs5xIKpOR1EYZr/5IFFphifLmLaO75XCZyZvkuCsmn+9GsAXthnbO0iAm5l4pGg78dWzI8dqPtMoKTlUGeIoY02cTUI6t6bPf/Fg638Nby+9ZDEK1SxbSNfLUjbqXWV9yJ7UaQrjiK3Vydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ITeX1/ig8nqDgX8zJ6UXqiOuHhFDr5kOvSJDpjBplo=;
 b=TJf37ZoCFzRUiUu2yrel5m7SybTkohIIlk4aj2lp91XLfP/t02kcSd9vZi573G0pF6U1SjtlqJkaiHPjJ8FP+2mqiSUIVNZhODPxv+aWX0P5MzlMtYYgUdnbALD8dBj+6ARlSfMYTS6qdkqgua33BPcK2RX5y6MZ555Qav2ZZe+YledGPvs262c1mEnQAva5Lkzn0gByxr/rCuJVRiBh7XTLQQiS6Edi0iJLQdX2HleMcEFAosEJvRYOTbeuWuIWj/qD1VqV5biSgszBYaeH/ZG+OUhEYof9haqJVUmE0CaY0PVtxXy66OY4ckKRyibPmMJysCRbdLMyl6vc7tKloA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27) by IA1PR11MB7173.namprd11.prod.outlook.com
 (2603:10b6:208:41b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 17:10:20 +0000
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::eed8:bee8:188e:b09c]) by DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::eed8:bee8:188e:b09c%2]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 17:10:19 +0000
Message-ID: <b90f706e-165d-43c3-8dcf-ba8a495fd2f8@intel.com>
Date: Tue, 30 Dec 2025 18:10:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: core: Reinstate pm_runtime_enabled() check in
 phy_pm_runtime_put()
To: Geert Uytterhoeven <geert+renesas@glider.be>, Vinod Koul
	<vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
CC: <linux-phy@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <3ca9f8166d21685bfbf97535da30172f74822130.1767107014.git.geert+renesas@glider.be>
Content-Language: en-US
From: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
In-Reply-To: <3ca9f8166d21685bfbf97535da30172f74822130.1767107014.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0138.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::36) To DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF63A6024A9:EE_|IA1PR11MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fef8b1-cfad-45c3-36ef-08de47c64f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmtQekFYVFVkRmlWR0RFUmZsZmUwbGNnMk56WkNQNGxPenEyUm90bFptVUh2?=
 =?utf-8?B?UE9DTnpIZU41VVlGdUhlQnpLMzljUHorNHg1OGFpVU9wdVl4S2RwL1BxM2hw?=
 =?utf-8?B?NTIzd0NVWXlDU2huWHI5b2hOZ2pDQWRROTBLcFZmYzB5MXFVN20yakhXUnU3?=
 =?utf-8?B?T3RFbThvREhvVHltZlJiRHpUVXJOOGZ3bnM4RVVXbTJWM3dPV2xXang2TDVs?=
 =?utf-8?B?ZEgyMitqc092SXAxQnJLZTRDcWVtSXJ6SVVEYlBrLzAvc3pjZHVSY1FZTjFF?=
 =?utf-8?B?UC9VYWZSeWdxdnI3RWdPNno3NW8rN3NydXV2WjZ2VUxLYlhsdEt5VkRyUDRz?=
 =?utf-8?B?bEp5b0JDeE9Pd1ZJdU5qMEdEM3hiRCtFVEFtcFllL1BwN1JDRlpYWmFwcW0x?=
 =?utf-8?B?clhXcmdWdkYvWm1xT0tweEkrYXVqMnlrWW82NWNRN2pWbWFETHk5QUZFb2Nn?=
 =?utf-8?B?c1d3NVVKbUF5dDJybldZYytDOTFPZzhGakhuVVRiTWUxclJ3bGR2ZGM4U09q?=
 =?utf-8?B?ZXpacGwxcnBjZ2ExVzNMM1J1T3BOTGNsR3U3emxZUWxNV3ZUQ1g0ZWZ3M0x4?=
 =?utf-8?B?eks0Z1FtTWpRdkNWYWVLYlk4c2ExRE9hVjVsOU9xQk9zNnQ3Y1VCakllU0M5?=
 =?utf-8?B?SzdVaU1qM3V3MTVMT3hwN09UaDVyV0xHUmVURmc4UENjdXN1d2thaFV1cXFt?=
 =?utf-8?B?bEJRaHZFbDQ3MEN6ZTk5Z0J6RnFjamV5cUVqMDRFeHl2SnMyakNURWFKa2VE?=
 =?utf-8?B?cWo5RnNQcTB5QjZPYVN2akVieWQvdGw3emhiVlpSOFBrUDRRMkltcUdoelpS?=
 =?utf-8?B?dDVxNDIrd3RFWDhPQzFjNzNCQUZONG50WUtTaVNOc1lmN1YvRmZSNVlmeXky?=
 =?utf-8?B?aE4yMDlmZUJCRktDWWVvVlJtUHd1dmFlMDhiVHUvemlSb1BadzJ2Z3JlK0g3?=
 =?utf-8?B?U2MyVlJxTGJCQysvR0ZtWHJ2U0hCbWhWRkZKTU1lNmorSVA2Q05PZC9hbG5Z?=
 =?utf-8?B?dVFGWXVJaDlLQXlpd2VaaWdVZzkvd05SQTFXa1BiMGE2V3BjVFIvNnFjSnFj?=
 =?utf-8?B?aUV1TzlNSGtvb3BlVlBEb3FubWxHbzRwckEzcEV5L24yQjdRWFRvV25rVWF0?=
 =?utf-8?B?OEhkbEc1bW9UNTB0R2tRTm4yVEM5ZEl2RmJ4NUJqcVFHNWhORmg2L1JickVj?=
 =?utf-8?B?L2x4M1ZEVENEd25QbEhWZjUya2lPZDZWcnJMWWlwZ0hMZUx3VWhreUppQ3N1?=
 =?utf-8?B?Q3FEMy9jb21QM0ZoNkpTV1U1V290cTVQVG9uQmh0TE0rQThjamRDbVRmM244?=
 =?utf-8?B?amVxc0JuSGdNOWFEcTY4MHdMUG83Rjhud3dmUmM3ZDZNNkRpSDhnS1lKN1g0?=
 =?utf-8?B?OER3Y1JROVowMnNueXVyZzRYY01rQm9JSU5STkFJa2lwMUd5YVgwNFNSZFpG?=
 =?utf-8?B?dHJpZEZGOVpHTUZkUHFteXRmcnVibXB5SHZtTnRINlpqVVU5Z0EwNmlGTndE?=
 =?utf-8?B?eDdhTnJqckc3bEFSL0dTZDNxeHp4Y0NjdXJydStvSFpXK1A2WlgrL1JPeDBY?=
 =?utf-8?B?RWR0K2NWSEFWazczeFlYQnZCaHVuZzlaQVVWUXU3UXpTb3NSZGwya0tqc0w2?=
 =?utf-8?B?YlFyeGpoRytiSWR0bExvQ0dZSTdSTnVCMXNWSmw3ZC9ZOEhqeWtHZldwYzhJ?=
 =?utf-8?B?Yk0zMyt4cEhNWnNrZStMQzhsTVlCUm8rMFNwUXJjZ0pXQThPSnI4MFRRdWMr?=
 =?utf-8?B?MGxuZlhEVWtuY3JpeEUraDVXVHFOMGR0a3pHbEFXMk1hOG1pUi9BcnUweDJ1?=
 =?utf-8?B?dmpjeXE2cFg4VHBUU2hDaFZIL2ZzK0w4ZEYva2Z1MFNmeTVUdjFaR1dwZURL?=
 =?utf-8?B?YlhISWkxc1VONkJHZlMxVURKTzZtbWlRUHEzcTdPYXI4aEhhVUJxRHYxY2RS?=
 =?utf-8?Q?2/tIwXyrrxGPNTCfxLnYZDUSmLu4NU0+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF63A6024A9.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEhBamJibGlpODBYNTVsR010WjVXR0dJK3hDVXpmY3g1UkxUdHlzMEJLZ3Jv?=
 =?utf-8?B?Q1JjOStkUlUrR1FaQTBuU1JHdW9KNGdoVGQ5SjdZVE5hVk5vekt0OGxseWRS?=
 =?utf-8?B?emt6d0EycXBuV3ZSaUw0UmFxdTk2UzRUeFZGVnBMTDdjRWNEZUNmSks4b0sx?=
 =?utf-8?B?MDNyNm1ZUGVtRzhqenY4VEg1V3ZZb0gvc216VnVaQytaT2w2Z1lSZzZhODls?=
 =?utf-8?B?dXpGckZYYUVabUFseE5vcC9MeVY3bm9sTTV5VmFYejNhVElwWXlFdTBacFBa?=
 =?utf-8?B?SUVEUnlCc2hNU2VDa1dZVXd1ZzRnTHg1UjdUSGxVbzVRQ05BRzB1T0pnZEpU?=
 =?utf-8?B?RjhWSlhCNVZob0J6NEpERHRuMktFMjFtdEs3dW8vM1NtOXBtZTNDNFJMRk94?=
 =?utf-8?B?eG9qdUJYd3gwbXA2dEMvbEpDdkR3NGVHcVBySVFYdmx5cVVMUHJhZ2NnVXZY?=
 =?utf-8?B?U1UzNUhVc21xck94UEFseVZjc214V0FyYnJEWW12VEVVSXhMSG1oYVduei8z?=
 =?utf-8?B?VHJkU0IwNk1WeC9PZ1Jzd3dQZW81VnNicmt6N1BJbTM1all6MWhxbkpLVjNh?=
 =?utf-8?B?R1Q5ZjhhblBHeDNjSnlSNzRNQW0yQTA2bHcrT0c2bDgxYU5nQnhhU1hwU096?=
 =?utf-8?B?bTZnM0F1SHNteGtYZzVVM096QXUwN1gybHpkQW1UR3BnNTR3MHFaWHIxK0g4?=
 =?utf-8?B?YkQ2SFkvVG5qRVpHUVkxY3A5OU5GWWw4V1hJVFU1N1hlZmVpSk5vcWY5MzJt?=
 =?utf-8?B?aHQ1VGFvTW5aNjJ4eTF6aXhvV0piUjEvSEJpcUFsMkcwZzAwNHhoZDF5Sjlx?=
 =?utf-8?B?dzdOVG5PUWM5dGw1elErTXZmcytqeFMweDFlc1ZjWnR4OGQ2NDJ3aHIrWU1K?=
 =?utf-8?B?VVJPTWxQb0cvSGpkTDN6ZzVweDZZWEtYUTQ4RklyWU9wOEhvZkFBYnNrSHE4?=
 =?utf-8?B?STZNbWZIRE1qOGxhNlU3WDRBMlVndWdVNzFmTXVVOXpYSFJ2MTh2U0tON1Vj?=
 =?utf-8?B?L2FQYkpnWllvc1QvYzQvQStlaGFMcFFMMGhjN2VnZTM4elpUaEVhWVN2aisv?=
 =?utf-8?B?aERyUW56NmYvOHBLOGtEbzd5S1IwMVVPUnZmVUEyWWY3bStSNVNaQkhFNytF?=
 =?utf-8?B?WXlWT0JwNWhkRmxMU0tsZUdMQ25BMlFxdGRWZXZ5T2drTGp4SnMrakViZHVn?=
 =?utf-8?B?YmFMVmVPNmxDZEpDNjFPM3ZtRkxyclNsWksxMldmMi9SdmNWNFk5Y0M3N3hv?=
 =?utf-8?B?TCs1UWt5UmdoV3JDdWZjZTA3V2dCb3RBektIYnhKSDM3R1Z0OGExMHhkbDRh?=
 =?utf-8?B?Yk03Mk9Pai8rYmdFU1MrbDNNUG5oNFBYSWU5ek5vbjQ4QWZ4UHVvU1ZCRGRB?=
 =?utf-8?B?VDg1cm91Y1lKRmtoVDZScU9CU0VtbUZhd3NpQmZLNTJ0WmNhTGhrakFiSEZi?=
 =?utf-8?B?K0U4Y3lBSForemFKVXlYazBrMVYzbDY1MFRMZCtmTjBWWFhuR1dMM3duRUUv?=
 =?utf-8?B?UTVrQUZxSXVVZkN6S011SCtXeEFXM3I0MjNQbVc0TzhMenh5SlA4Q1FQN01R?=
 =?utf-8?B?NG9zaDFzS25KN1ZrL21wOFRNSlBqZ2lPQzY4dVNHaHlxWkhrQUgyaWJWS0t4?=
 =?utf-8?B?REhMcngxcFp1cUZVc2dhQXd2bW8wenVSWXBMS3hBME12ZWxzQnlFRFdQV2hm?=
 =?utf-8?B?OWNZeGdDakpuUG05Nm1rRTlXQmR2V2NqNHRnVDRpZFFKWno4UTJvUkN1YWNa?=
 =?utf-8?B?dDVsTTdVTG1WbFdwNVFDenRhNXIwV1NTVDNYMys4VjVTWllJYjExaXhrcHZT?=
 =?utf-8?B?aHlmYVUxK2IwSWZZQm40L1oxc3ZKdWZnZlFxRHFJdVBZQUprS2lwMnp0MXgr?=
 =?utf-8?B?MmJiTGZyRmt1K3Z5bWY2WkI4c09RWHZyMFFIN2JJejVrWHpGN3V3cTdPdVFR?=
 =?utf-8?B?dUh3NkZZS0lyT2lWUFlLSmlIRUV1b3MzQTF4MkFrWVpsQWJRNGQ5d2ZwNG1J?=
 =?utf-8?B?L05xd0tKb0pJOHRlRlZzeHc1RFRJVFE4ZmNvVC9GTlJCczl3QVpYYUI0NUcr?=
 =?utf-8?B?Njc3TW42MWllekFXZFI5MUNMUlZLT1hqODluMDJIV0lvR0w2KzM3dlpwU09x?=
 =?utf-8?B?MW5yWHM3L3ZJWFZnSXlFZno2TFBrQWg0S2M2TTZEYXZzeHMvblM2Z09wYlh4?=
 =?utf-8?B?TksxTUJvNVRjWUZiaTBwUXpGaFBIVUtCRmVqUGpiNmNhdUh5UUZrTVlDakto?=
 =?utf-8?B?VFEwU3U3U3l5aDBnelczSW4vdnpPTlNGZmdYYW5rbjJDVGJ1cm1QUUZaTzk4?=
 =?utf-8?B?VmY5RWJCSlhDa1k1OGFBOXBxOFdnRVp0VUJRRStHd1RJRlNGQlpoNzgra3lI?=
 =?utf-8?Q?WpWgaQRvARxd9758=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fef8b1-cfad-45c3-36ef-08de47c64f8a
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF63A6024A9.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 17:10:19.9055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfYIL5ORUKfyA6oiS0o83v4mxso2Mr++QaHWhRxtemWO08Znfm5nQdqM7QM7joo7efJav/DMlgxK3LtM2daKgydT5aFPNt0y5o/XcDlUNKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7173
X-OriginatorOrg: intel.com


On 12/30/2025 4:04 PM, Geert Uytterhoeven wrote:
> On Koelsch (R-Car M2-W), during boot and s2ram:
>
>      phy phy-e6590100.usb-phy-controller.0: Runtime PM usage count underflow!
>
> While phy_pm_runtime_get{,_sync}() and phy_pm_runtime_put_sync() still
> contain pm_runtime_enabled() checks, the same check in
> phy_pm_runtime_put() was deemed redundant and removed, causing count
> underflows with PHY drivers like drivers/phy/renesas/phy-rcar-gen2.c
> that do not use Runtime PM yet,
>
> Fix this by reinstating the check.
>
> Fixes: caad07ae07e3fb17 ("phy: core: Discard pm_runtime_put() return values")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>


> ---
>   drivers/phy/phy-core.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 160ecb757d1d62a0..e2a2a99d069789c7 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -195,6 +195,9 @@ void phy_pm_runtime_put(struct phy *phy)
>   	if (!phy)
>   		return;
>   
> +	if (!pm_runtime_enabled(&phy->dev))
> +		return;
> +
>   	pm_runtime_put(&phy->dev);
>   }
>   EXPORT_SYMBOL_GPL(phy_pm_runtime_put);

