Return-Path: <linux-renesas-soc+bounces-26528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C90D0ABF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 15:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C63B30056DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 14:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AAA311957;
	Fri,  9 Jan 2026 14:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgZqYfPf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4F53115B0;
	Fri,  9 Jan 2026 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970218; cv=fail; b=ESOml+/3+G/V6Dyt99jMO05UMvSmfYDFukucTncs3Wz0VfJrYFqpKuJgbBtbthqidwqgXQm1DJYQOcvPrV1Z/QF7BTYnxmIWobf+sfNi5g+cweKTPz/tFx0vu4yySpmm7M4P4Sx6cK5tqHK/4KJCM5jwn+XI/J+AXhukh7bwcuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970218; c=relaxed/simple;
	bh=BAyyTBlWg3zO6IyFWXwng6kQrEYXjRCAk/iE9xun5ig=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QxdP15yfaYq8FGCsmDYb2njDvGcnPtY7oCU0CdwH0dnmURGwz8CoaxTkulrsMjESCB+K7mYn27d/77qFW5+Wi/efUUX2Z/JLfA5mhTDFeJzOKFSS0j1F2iYQ8mNRdLbVPyRapapfUqfFBnXk1z28HUV1VllzhkbWlVdXh3JqeOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgZqYfPf; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767970214; x=1799506214;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BAyyTBlWg3zO6IyFWXwng6kQrEYXjRCAk/iE9xun5ig=;
  b=KgZqYfPfPtjXk6pjpJfloF/VxWE9biypzplA4p+g4KFEnGbh8cZRb6gn
   kp0rF/zJ1ZkF9F+vMio3HytTXzCaOegn9/f7TMkktzLsQSRIb+8dnqTex
   t5kIjA4oho2DFyUVeIPS1/KWMP7wW/dpLmhdAJwG6GnqUgujHN+94R3+3
   VCQXpVrooAB6lozKD5i57UUQNyF+Ef8R6J8W84OyuyETTa8HPiaEewEnk
   WJsrSFDpxZ0LzEokk7CgxfXHKMGfx0yZ2oH96R0O9hyELGOK1ZLBW30h/
   gCOjBt+rwB7etqUbddyaIfZn6cpccozRAc4eORVtHouaKZiwS5jzmkDOy
   Q==;
X-CSE-ConnectionGUID: XtautBs5T1Kt8vUjYy28Pg==
X-CSE-MsgGUID: eeq9v9i3RXavjBDu5fjNoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80718147"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="80718147"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 06:50:11 -0800
X-CSE-ConnectionGUID: PrCNv1bdSuiJyQ/yBA0ePQ==
X-CSE-MsgGUID: LflS+stMS725dI7+1fC4rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="240995766"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 06:50:11 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 06:50:10 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 06:50:10 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 06:50:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyMYIsaw1YNcISDEM4GX0sUzxVNT3TlSJxiNtV2QJXA7zBSEf0nSVjzX3aiUmBaushZrvDWNn4fNlxEOf0inAdE6ARLIT/IqRBgh5lG8lcXFpV3izc2P8vta80km9E9WJW5HT1oU5ZniS45MUHhZNzzZQXjXWMG0NjA+/AozBT5s4DaGYkd9k0wO/+KkeHHxadcLAFUII+rcMVO9zpR14/7AdyktRnw/3n9XbyNeRj1FI9jYNFvZnLao0xIkE9AwPvkhEzZ2OkuJv05hA1DCS5dEo8bDQer/9PNPxn6X+1+pAUQRXODkYRpzgwPbgIFO7rL2hk4PVLanB9NzGWfgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nba0OndqyfjvkNA5aWyIgRab6jf8Fmb7+arUrqqvi5c=;
 b=OqiD4YuBXh5iegma0BxJagipaQn6vWl/ckdM1kWIpTwQHThShX9bmzvgwx6Oh1rm1cxbmzq4PvCNRPgISzzTkRt7IkcjDztSb4OUEFK9JlW99EHmnLMPdHU3xX5Ryt/+a8pZv8Ze5XKNTK9GbFDjyuO/jImbXAnrTFpqHeg2QdqyIWJakFI2HzPYy1EPxw1mfKDAvFGDk11NZpxvRUPAIGDjYWEqk0/8Ou5HDL7BWZGVKVqmhJvhBSq8VgyROzBbb038Y8w/8H7nuf5RiV8FtGH4BEwH0cJPOdpadynZM/GiTyp07UWUug3FsxgRSlUQ2cGqBWoJ5nGldOIwZs12gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA1PR11MB8151.namprd11.prod.outlook.com (2603:10b6:208:44d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 14:50:08 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 14:50:08 +0000
Message-ID: <3d448d3d-ec1c-4be1-ab98-c1e47511f299@intel.com>
Date: Fri, 9 Jan 2026 16:50:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] i3c: renesas: Add suspend/resume support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	<tomm.merciai@gmail.com>
CC: <linux-renesas-soc@vger.kernel.org>, <biju.das.jz@bp.renesas.com>,
	"Wolfram Sang" <wsa+renesas@sang-engineering.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
 <c469ef89e0156d37746a85bfc314232847d1185a.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <c469ef89e0156d37746a85bfc314232847d1185a.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:40::22) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA1PR11MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: c521325d-1b65-4a72-adf8-08de4f8e61d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3k3VWtobmhYbGVGU0gyYW02MWFOZHN5OWxxbnhsY2VKRDl4Z015V3ZTYjZY?=
 =?utf-8?B?V0dnRVFoTGQ2QTUvK0J4SGNzcFIyNEJtOFdjM3ByZE5KZ2xYMTU2Z241eTJT?=
 =?utf-8?B?UUxGTkUxRk1pa3dMbEVieGNRaE1rdXgzaHJFcXRGSXE1RndQVXdxMkxsakd2?=
 =?utf-8?B?MmRhT2RMbVFFdXVPRGlHdDFnRllLZU5RS080T2hFUW5sZzJjdXRDSW5NcjBF?=
 =?utf-8?B?MDFZVkp1NW5xSk9NbjNZem5nYmpubm5lNy9JQ2VpNlF2RFNRbTE4eDM0MG1m?=
 =?utf-8?B?cGhHR05QTWFSTzRKZWIxS2IyUXZ1TTRoOUtoTjJ4WnVneXJIOE54aWt3UGc3?=
 =?utf-8?B?WlA1elZ3MDlOMkJlcmtlamhLdTR2a0swYjljTUtwM0RuSk5EVWpRbUZlTThY?=
 =?utf-8?B?NGFCWkJzSGtIWUd0SW9NWGxmN0hYdzhNK2QzcDRua3U4U2xJNjdrRWIvZzND?=
 =?utf-8?B?eXF5TWpHTUNXdyt5by9pU2JEaVNEMDVHZDJVdEQ2elRLaVlkV1F3cWdCcTRK?=
 =?utf-8?B?L2JodVUzdTI5M1VIdzlHY1VzMWlLRzRjWER4SVJOdEFPblN6b2IvVXE3cTVG?=
 =?utf-8?B?MmxKUHRzaERvWnRzM2lUOXNQZjNXeEZJZDNLRjgrdXdHNnJ1cmw2akI5dmhE?=
 =?utf-8?B?bWJkS2p2eXBEUDdPZlRDLy9wQTRBVENTZi9jYlJaNHQ2TnMwOHRNLzdKOEIz?=
 =?utf-8?B?L29rbW9Wc0dmM3h5aDdoYXI1L1NOd0NEdVdreXZ0dkVaazhBQ3J1bjcxeVg2?=
 =?utf-8?B?NHArQmRBRlhTaDhpWjZ0NEZjQmdPWUczMXN4ejMwOU1EczFJaHdac3NnS0xz?=
 =?utf-8?B?bTZCSk1CMGdQbUE3eEt5SkxMd2IvQkJZSUtvM3A3QTlJL1ZDUDNwZ3dPN0Vk?=
 =?utf-8?B?QkI1MmNRbDhEMjhGdGloM21SNHdOMkdOeHlGM2t1VnpjNllCNUgxeTdRaDBX?=
 =?utf-8?B?MkhVVmNXYXQ4YkhBNmNVQ29wZ0w3cFF1c2pBUzRJUXVBSkJMalNJVFpRUzVu?=
 =?utf-8?B?WGhaNVlGcmI4OGd0T0lSV0IzQTFhaThoSHlRaUVBM0oyeVZXbnREWk91dkRB?=
 =?utf-8?B?TThsdXFQdXp0aTQrY0tPZnVvakd4NkJ4c25Hd3RKeHJLTGNIdGh4a0NsUWRu?=
 =?utf-8?B?U3JkeWhldlEwUkovQ0c3TXRJWk90TkhlRzdzV0tabjZETjl0eXpENGxNYjU1?=
 =?utf-8?B?RmREbHliZzJzTWR6QlZvMlNITmsrUmRpTkRRR1JkODVEZldMQWZaL093dWhK?=
 =?utf-8?B?RXIyc3lRQXRWTkNNK2FNaUk4UXltRW1ER0laWUhLV2N2TzJET2Z4WjhWUlg5?=
 =?utf-8?B?clZUbW5vbVc1Sjd1UWRVRmVjbWVTUi9xSDMvbEVzTHNOSVZ6eGpoZVB1Tk5V?=
 =?utf-8?B?SkwrZmNaUEsyR1BWRmoxaURJRHFEVlJ4MVN3VVVDYjBZUDR6dWkxcTJxdDha?=
 =?utf-8?B?NkNsYm1SWHR6WGlrSmRlR1hCNStvc1l1VkI5ckFoNzgzRSt0QXJvUFlrSDEy?=
 =?utf-8?B?cHJ4UGgrVG1CMGhicFpnQzYxTy9nRVJVUTBhbmVNS0dEbmNlaVBkYkxHc1BH?=
 =?utf-8?B?SHVySkVXV210cFd0YzYrWFpGMDNydjc4OGxvS1FzbkdGdjIrTjNsN0Q1RFJh?=
 =?utf-8?B?TVdySVdyY1M0eWdHNmUwNklsNzRxaDNJNUxrYThTTHVYY0ViOTFZY3ZOV1hF?=
 =?utf-8?B?QzRKTVR0OVZHdk9aTGpPcHFxc2xRRW1EaFErMHorZ3dlRVhnQUhqTzVuNFRO?=
 =?utf-8?B?VUp6UGVOcFdBeXZCUHFYT3dkVVNMT3lGMWZudXdIVWZFcmw4MjhSTnp3WWhK?=
 =?utf-8?B?MzAySU9ZMUh1N0IwU2JpcjBpWWR4WFpXSGZIdGI1RXd5UTUwVm1aaHpwcjRO?=
 =?utf-8?B?UnQweUlKRk5NMENFTWhmZUZsSDVJODczSVFtSHdMSFlKTGEwYXIva3lwKzVy?=
 =?utf-8?Q?Jz45tZWU0Uluicb/JbjMFe8fTDhhyf7o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3NqQTM3S2hHUjVucWlnZ1NOdEMwQnltUWdBY2l0Rkw1RVVUUU5aclh6OHdN?=
 =?utf-8?B?SnBucVZKcGo2akNDOThOYmhoeGdYaWZybUliTUNkYU1oT1g0OVpwdG9vOFlh?=
 =?utf-8?B?WFJ2Z0hEVE44bGw0S2Y2RTZ5QlE4b2pXdzZ6SkJTUCtNb2hQMW1YZ0JwRGN0?=
 =?utf-8?B?ZE1URXM5a2xPZUlwcGo5bnlkVW1tYi8zc3k0RzA3Q2I1QXhLdHNKSE1GSHpv?=
 =?utf-8?B?RHBxRzVxZWR4OHA5cE1UMU1rWGpDOFIzeVRtNnRzT3NyYmF3akRBM284cUJR?=
 =?utf-8?B?Q3JCQXN4Q3JGZzVvWEVTUHdsU2VNTXZIdmVpQnhkSWNuaXlzZlhOTDhRelJv?=
 =?utf-8?B?RG5JalBRQVhrT3ByRWpyRkQ2aUZQSklSQ2F3OEFaZ3NPK0tHWTRwSDIxWHNw?=
 =?utf-8?B?U2x0cWRmL0dSZzd3L3JOQmtsM0Rjd3JpN3RDUGZJUzFUb251RG5Za2RRQlFn?=
 =?utf-8?B?WlVSMzZJNFdIVStDdjRSeFV2RHBDK3IxVTV2SW1QRTZtNEIvUkVLakxUK1lE?=
 =?utf-8?B?V3FFVkU5SUV6dlBwcCsxVnBCZU5qVTk0eDRIVTZNdG9PaGNIeFI0cUpkQ25M?=
 =?utf-8?B?T1dFYnZ0VGlGTFlaNWdDdHM4VDcwUUxEbndvdUtONW45a2tLM3lCTklEa2xt?=
 =?utf-8?B?OFMvMXhzQnlleCtLdnBmVTJpVG9TbExKZ2ZYVGI2ZnplanE5T0ZRY20xbm54?=
 =?utf-8?B?SUxoZ2dsL2xManIwR3RtVnhyQjczM0Rqdk80UXRKemwvcG1mQjBqUlZSTXdk?=
 =?utf-8?B?RU1pSUZweTI1a1NEQlhmbW53L3NwRVpadDlNUTEzVDdISUUrUWMvbnU3bDBJ?=
 =?utf-8?B?NDFWdTFmdVFYOFBGdkhNcjRqRHdvMGRWYjlmSXY3elMzeER6dE5mYUdtczky?=
 =?utf-8?B?NklRdkdNOWFXaXZzcUFSUFQxdkszam9HazNjanNZa2VJTEdYVDNmKzdtaGFP?=
 =?utf-8?B?TmRoV0Q5SG1IN0hGeTZxR0I0am4zRzBDc3Y5WERkaGFRdEp6RFV6UzJUQnlm?=
 =?utf-8?B?VmJwQ0ovVHArNEZza0tzZVM1MjNyWVc5MExIS2VKR2x6ZTJ0elZTMlYza2dV?=
 =?utf-8?B?eFJFc3ZBb2dOZWViMFl0eW9vSnRMS0RxbFdsVG5veStZTzNMcXJ3YnpkeUxJ?=
 =?utf-8?B?YUZHU3dWVFlYZHJCcnEwcFFZZE94YkEvajkrbjh5dzdibkk3R1k4VWUrWEJI?=
 =?utf-8?B?T3hoQXo5azBoQSt6Q0pvNmR0amZLVlR1aGhqcmlzN0FJdHlIQXNwbFlhWGIy?=
 =?utf-8?B?T2tzMzBHMytDc1Zub0swUldBQTk1QnhtdWR0VTh2TTdvelpRRTJPYmk2clNL?=
 =?utf-8?B?T3pySm03RXJ6Sk11ZExHemNhYlJoOW03bEdEZ3loUkhrU1dUTUd0NU4vNEty?=
 =?utf-8?B?bDdRUWdSV2pSbEErb3lLRXZyZFdKSEVBRTdtMW1Ob29UR3lvN2lnZmpDQTRh?=
 =?utf-8?B?aEFxdW5VcHBuR1JUZ01lZHRvaG90UU8zL3E5cXlEYjdwTEFiZXFScDZwRVpu?=
 =?utf-8?B?UmMxNnlPeW9IbVFVUTNCaUZZZDlzYXllZFRUQmg3SDFEQTYzeHdGTSt0Nktq?=
 =?utf-8?B?ODg1OXFmR1lXK1U0YlRWaFRoWTlTNGxFZzZneUxqaDNJT0VlZUdhVVFZelpv?=
 =?utf-8?B?UXJHN0JUanA1d0ErYWh1OHBtVm05ZkpSa05uWmpwWTc0RUNqdG5ZN25HNDJQ?=
 =?utf-8?B?dHpxQUxySVhVYjBIalZSY05vYzF2VW5JWjczTEQrMkNWSXFKR3EvZXRhODly?=
 =?utf-8?B?bE8zcXVOdllpK2RGVjIveFpkaCswMFpaRlVnZldVMTR2QjVmcjlxMSt3NlFr?=
 =?utf-8?B?Y20vZHl3eUZqWTdYRXhoMmFOcW0rSWZDTGwxbmdOaDNJTU5kam1nK1RXb3l2?=
 =?utf-8?B?TE9Jc3pYRkRPWFp1bVpRWis3UUtReDYvbTA3bzFGUzBlTHV6em5EKzlBZ09y?=
 =?utf-8?B?MUJQUWlRblJpZ0VwSXdWQ05JYS9TSU5ackY5SG5UMzhTWTYzUDZOaGVWT3Vn?=
 =?utf-8?B?a1FGeEpJUEZGMWxtc3Q1dHlPRmFPUEJYakpkOGhHWkZVZHVIaE92SVdqcXpI?=
 =?utf-8?B?d3d6S3FGVlBKekFIYVZSdDJDVEppejdaSVBJUDBKd3NqL1M0VS9oVEVuR1N5?=
 =?utf-8?B?STNzLzhubjhrZXJ6aDMwUFVsamF4aVo3QzJuVEtoVWszanlCeVJaUFRvOEU4?=
 =?utf-8?B?djdWaDR3c1FaZEZZSDh1TWVpWFBjYVZjUUpobHplZG5uSFVQaEZETUd0d1h5?=
 =?utf-8?B?NHl4Q256dGxGSjVncXhBbTZGY2NVK1ArVEJRaHFIQk5wT1dGUUZwdUZHSC9x?=
 =?utf-8?B?WENTb2ZIWEZ5d2dtOHdnbElNYXN6cGtIUUlvVHNuMDZXcTE4WjMrdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c521325d-1b65-4a72-adf8-08de4f8e61d8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:50:08.4443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xKbcYHFvvpFPr/wpx+WvgPcX3BdsOAOXI3Z2mKyVuYf3Wg92/sqkdix/1ayCi5yBKyvDTMaFtJpIk93mGgbFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8151
X-OriginatorOrg: intel.com

On 07/01/2026 12:33, Tommaso Merciai wrote:
> The Renesas I3C controller does not retain its register state across system
> suspend, requiring the driver to explicitly save and restore hardware
> configuration.
> 
> Add suspend and resume NOIRQ callbacks to handle system sleep transitions.
> 
> During suspend, save the Device Address Table (DAT) entries, assert reset
> lines, and disable all related clocks to allow the controller to enter a
> low-power state.
> 
> On resume, re-enable clocks and reset lines in the proper order. Restore
> the REFCKCTL register, master dynamic address, and all DAT entries, then
> reinitialize the controller.
> 
> Store the REFCLK divider value, and the master dynamic address to restore
> timing and addressing configuration after resume.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v4->v5:
>  - Collected tag.
> 
> v3->v4:
>  - Use clk_bulk_disable/enable() into renesas_i3c_suspend/resume_noirq()
>    instead of clk_bulk_prepare_enable()/clk_bulk_disable_unprepare()
> 
> v2->v3:
>  - Fixed error path into renesas_i3c_resume_noirq() and
>    renesas_i3c_suspend_noirq() function.
>  - Moved up one line sizeof(u32) * i3c->maxdevs into devm_kzalloc() call.
> 
> v1->v2:
>  - Updated commit as v1 has been split into smaller patches.
>  - Use clock bulk API into renesas_i3c_suspend_noirq() and
>    renesas_i3c_resume_noirq().
> 
>  drivers/i3c/master/renesas-i3c.c | 89 ++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 008b6ee60e26..528bccc2c68e 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -256,16 +256,19 @@ struct renesas_i3c {
>  	enum i3c_internal_state internal_state;
>  	u16 maxdevs;
>  	u32 free_pos;
> +	u32 dyn_addr;
>  	u32 i2c_STDBR;
>  	u32 i3c_STDBR;
>  	unsigned long rate;
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
>  	void __iomem *regs;
> +	u32 *DATBASn;
>  	struct clk_bulk_data *clks;
>  	struct reset_control *presetn;
>  	struct reset_control *tresetn;
>  	u8 num_clks;
> +	u8 refclk_div;
>  };
>  
>  struct renesas_i3c_i2c_dev_data {
> @@ -609,6 +612,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  					   EXTBR_EBRHP(pp_high_ticks));
>  
>  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> +	i3c->refclk_div = cks;
>  
>  	/* I3C hw init*/
>  	renesas_i3c_hw_init(i3c);
> @@ -617,6 +621,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	if (ret < 0)
>  		return ret;
>  
> +	i3c->dyn_addr = ret;
>  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
>  
>  	memset(&info, 0, sizeof(info));
> @@ -1363,6 +1368,12 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
>  	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
>  
> +	/* Allocate dynamic Device Address Table backup. */
> +	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
> +				    GFP_KERNEL);
> +	if (!i3c->DATBASn)
> +		return -ENOMEM;
> +
>  	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
>  }
>  
> @@ -1373,6 +1384,83 @@ static void renesas_i3c_remove(struct platform_device *pdev)
>  	i3c_master_unregister(&i3c->base);
>  }
>  
> +static int renesas_i3c_suspend_noirq(struct device *dev)
> +{
> +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	i2c_mark_adapter_suspended(&i3c->base.i2c);
> +
> +	/* Store Device Address Table values. */
> +	for (i = 0; i < i3c->maxdevs; i++)
> +		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
> +
> +	ret = reset_control_assert(i3c->presetn);
> +	if (ret)
> +		goto err_mark_resumed;
> +
> +	ret = reset_control_assert(i3c->tresetn);
> +	if (ret)
> +		goto err_presetn;
> +
> +	clk_bulk_disable(i3c->num_clks, i3c->clks);
> +
> +	return 0;
> +
> +err_presetn:
> +	reset_control_deassert(i3c->presetn);
> +err_mark_resumed:
> +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> +
> +	return ret;
> +}
> +
> +static int renesas_i3c_resume_noirq(struct device *dev)
> +{
> +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	ret = reset_control_deassert(i3c->presetn);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_deassert(i3c->tresetn);
> +	if (ret)
> +		goto err_presetn;
> +
> +	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
> +	if (ret)
> +		goto err_tresetn;
> +
> +	/* Re-store I3C registers value. */
> +	renesas_writel(i3c->regs, REFCKCTL,
> +		       REFCKCTL_IREFCKS(i3c->refclk_div));
> +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> +		       MSDVAD_MDYAD(i3c->dyn_addr));
> +
> +	/* Restore Device Address Table values. */
> +	for (i = 0; i < i3c->maxdevs; i++)
> +		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> +
> +	/* I3C hw init. */
> +	renesas_i3c_hw_init(i3c);
> +
> +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> +
> +	return 0;

Is it assumed I3C target devices do not lose their dynamic addresses
during suspend?

> +
> +err_tresetn:
> +	reset_control_assert(i3c->tresetn);
> +err_presetn:
> +	reset_control_assert(i3c->presetn);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops renesas_i3c_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> +				  renesas_i3c_resume_noirq)
> +};
> +
>  static const struct of_device_id renesas_i3c_of_ids[] = {
>  	{ .compatible = "renesas,r9a08g045-i3c" },
>  	{ .compatible = "renesas,r9a09g047-i3c" },
> @@ -1386,6 +1474,7 @@ static struct platform_driver renesas_i3c = {
>  	.driver = {
>  		.name = "renesas-i3c",
>  		.of_match_table = renesas_i3c_of_ids,
> +		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
>  	},
>  };
>  module_platform_driver(renesas_i3c);


