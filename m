Return-Path: <linux-renesas-soc+bounces-10877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7B89E305A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 01:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CFEE282DC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 00:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECAB184E;
	Wed,  4 Dec 2024 00:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OF6rsr1d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC57746E;
	Wed,  4 Dec 2024 00:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733271879; cv=fail; b=p5kKSgl0bSaC+rRCr2G7Tf3fizbGru+lQTtT1xfAUHmUJNeti6SNl9EHvzWq1V70SpQvoruEmsh//UHEsmE23kIZbkCQTqRI0PR/lVQEUAv6vVfrTf+9IPRwNKhBKf6y6YY7ZS74NszrHLX5d3vtYAJtGA+tN3Q4ObhdC24yodU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733271879; c=relaxed/simple;
	bh=gAwkSLkeNDdXsQz7owiF3eUHxVR5xDd8mo6U813PMf8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ff2scmAr8qciBpURMoc6SxJMh7hran8LWs8i78ZmkLWMSBlWvHOZLqonC4+8NDU2/T1odVbqUoj2bsNpAPWsoXq3a7qXPLI4AfNTj9Ik0znoh3ThhokAsTytjZCbyiJVCsYO/R66AQIkQN9B9AoFnLCk7TWgCZrSvxXeegrUeAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OF6rsr1d; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733271878; x=1764807878;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gAwkSLkeNDdXsQz7owiF3eUHxVR5xDd8mo6U813PMf8=;
  b=OF6rsr1d4gkqe7VqszO/SwdaWYAH1VyGtSd0unzH6iCAJlGTjcinNmLP
   pGVDgqzpO3LMpQI80Ssu5Bx4ZdCsTCUuwfNljWwUVqIJk3ffW1YmKgBgg
   mILF3eKjxyetNDUU1Go3nnf7G6UVkbq0ThQOuaOJ20yVf9NFxYd+xzeTk
   6fysUUh6OEFc4xv1RanuRssirj7GP8tmeVzWK5hBwovJnmcpoVoJYOPLm
   38DeTVcnidYaNMInGznebUxmW1QXsUl0uGkGYw4tCF76Yth7DB12ouCKl
   9PbUv5gG/XTezopQin2RqvNAIYlrs3a6FBThiHbwP3DKrHpEE+g4PBQVb
   w==;
X-CSE-ConnectionGUID: 5zsNzU7XT/GNTDWF3WFdig==
X-CSE-MsgGUID: /IWf6r/XT9uKtVYJu/nVSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33262912"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="33262912"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 16:24:37 -0800
X-CSE-ConnectionGUID: 6XgxkuV+Q9SnXuHZOpXffQ==
X-CSE-MsgGUID: 0lbirB25Rh6k5S7wy8PHsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="93258857"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2024 16:24:37 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 16:24:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 16:24:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 16:24:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePhPfTR6PM8U6EgSBO+4YC15vbe6ekkNzBCakMWtFwhrRZYHd/+fBcV7AldDf0l69BUu/OxJVoPaWkKBRhufLk+DUSfsWWq+S92rRDrWSD3VoxuPbT8LynUZCkViVKMcJj5yfegzhiEnQPwRkjS0/rQ31W5vjMtNCmGb0RXKDSmx07Tb6KOjGRuuxUm0rwgw7mBiHNkIV1JnJ1GWD0ogeMwK3zD4KUSUMQik041Gtb73LxoSc7DZqpNTOM+ryf7yvaon/l2szVaUl4+ef6ShGeUpzPmFeYnlipNjAXczjrwHgn/KDCziUD28rYb7qePem1zsdUdUXAhtgBwO6MmOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHDT9BmWCM5O0+KwODhHqe/PkYHDIGB82HANPkxeKC0=;
 b=wnOjSlW1GNzsBc0cn/nSjK3bKFNeIJnOUuh3YWOWf3l+E6nnWOCAfvrlSyt6seg/lj5o+hZv9TArgRpMUaxiIclMitEYOiMv1Bw5Qu8GMggxTlMEkl7xIjedy8/aG8ETcCNJNinGp4Ivpg8XKzmJuLml94aCzspJEjCgVrppjHfgfokZyz8hvBth8QkQgW2JX1zacNqmT1oQ6exOdvqRUv9kSMWl11qkzuqnXn1ehGEzmHytGMfal8grMtUs/m2BAydhtCQKbARCbbcaCUU/kdAe0MyrwHQ8Pj3leM7yPNYkT/kW5IZh3Y1RVMJzdxkRM2x8PLjfGypK89NZJGizjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by SJ0PR11MB4959.namprd11.prod.outlook.com (2603:10b6:a03:2de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 00:24:28 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 00:24:28 +0000
Message-ID: <bedaa242-b9ca-46a1-bc1c-433eb2d7c7ec@intel.com>
Date: Tue, 3 Dec 2024 16:24:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] net: renesas: rswitch: avoid use-after-put for a
 device tree node
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>
References: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
 <20241202134904.3882317-4-nikita.yoush@cogentembedded.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20241202134904.3882317-4-nikita.yoush@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::31) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|SJ0PR11MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd514ef-c5b4-4349-af3f-08dd13fa03ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nko5U0U5ckd0TThZRW5zMTJlcFJ4UHNKTi9FcmphNzhUS0VUQUc3bnNxS05J?=
 =?utf-8?B?QVNUdTdXazFYZnJpRzJsa3JqR05Zd1RqdmJ1Tzdza1U0d0p2YUlLc2hlZWZ2?=
 =?utf-8?B?QWUwOUFwTC81Y3dndjRIZjhaN2NDOUtrWkFUR2ZhRE1Rblh1UzVJSFF0ZGtO?=
 =?utf-8?B?SktRZHlrdzVoT092VzN2OVBpWHNxSGE0TjBhQXVPYVhqWVduYUQ1dk45eTcy?=
 =?utf-8?B?N0pLSDRlY29UU2N2K3F0b2pzdXIxbURFY0hpZ1pJcFlqdit3YkpCaG5zYU4y?=
 =?utf-8?B?ZlBnYkh0SnJVYXpoS0dURE8xcnhBM2w1N0ljQzU0Yk9XNHlJc1pHeW80NkxT?=
 =?utf-8?B?TkNCQWNsQmcyajBtQ1NxdkxsMFlUajRRN3R1Nkl1U1pTRWRWQmxPVUtOR0tp?=
 =?utf-8?B?QnhrR1pILzJCZ0NvYjFmdVR5Q2NxVUltcnk2WWE0VDE4aGVOUzhMYkdhRU1Q?=
 =?utf-8?B?UytsOXowODZ4UUxnUEFUVDZzN1ozU21Lb3ZzWDNQdzlJYnJFZ0hzU1BlMklz?=
 =?utf-8?B?VUZ1QnpkdEtTOWs1dzh3MUhORFF3UStPV2czaTZScE91eE9BVWdsTFdXL2ts?=
 =?utf-8?B?Y3ErNkpDSk5BMGg0TTRWbmRhbWxBbUpkZHhsZFhBcDhKSnc0dVRVVnI3TXp6?=
 =?utf-8?B?VUNOVklYS05zbnY3U0t1QUFpV2dXdUhWekxJMWsyYnRoNm5jVzlNb05VdTdX?=
 =?utf-8?B?VTJCQ041ZkFLWlloRXpoeVpnR2IxQmVoamt6N28xZlpSUmdiNm1zaG5NV05w?=
 =?utf-8?B?c2pSZnQ4TGdiUVJxcmR0a2FzRVk5SHgwUXNLNjBwU0J2T3hXbDQ5MFBsWkFZ?=
 =?utf-8?B?QTFaUVNqcGwvUW94alJ1VGROSlB4ZVJBUkl2R0lFTU0yZS93ZUtjMWxFbVIz?=
 =?utf-8?B?TVBEeG9LbWZsWHFPMkxxV1JsNnpSaWFwMCtRN2NiU2l1YjIxK1B2TlFyMFp0?=
 =?utf-8?B?RFVQQXQ2YXNXeXM4ek9XazFQeTdoRW8vTUdvR0NTeFM3cDZ3S1ZaSHFadTZv?=
 =?utf-8?B?YVJvUXdsUkxzTG1qeFFOT1prYzBLK1hjRWI2L0RPdXFsNWhPcStocThLNkVO?=
 =?utf-8?B?QmFXTFNYVnQ1Tk9xSTRLdXY2M0EwVjB0SzdNZWU2RysyYVJxWjdjeGZkWWQ5?=
 =?utf-8?B?WDVLWFB2dTV4cVVEa2pQZkZsZDZhT29rYzNCNE1majg1MWllaXdjdmNEVUxI?=
 =?utf-8?B?bElwenBmYUdvaGticEFBM0NPaDF1OWg3WlRBMkxDY29CL3A5ZTl0K2JGRmFW?=
 =?utf-8?B?T2dKUW1xMFBHTkRoSjYxcVMxYlNBZzlabUdlL05UbU5jSUFBYm9EeUxoYkZV?=
 =?utf-8?B?aXliU0I5VmdrQkRHbFVnbXJubzlPYTRMUmt1NzJMbC9PTlptU1ZtUms3U1JS?=
 =?utf-8?B?ZjZTRW5JbnZ4S3c5MllmMERDZDVMclJDY1BXaEdwZXQvL1MwdWdGeHBWaGh5?=
 =?utf-8?B?VVdXVFlzZm9WUy8wR0NQWE1rcTgxTTY3d2h1eDRFVXRBQkFvSnQ5S3p0R0Yv?=
 =?utf-8?B?MTFsZHJiUWNERzNyK084c2w0SWtOUzF6SW1QMkRrUFJ4YjJlakFPQWNucHpl?=
 =?utf-8?B?ZmUwVW96alJMenNtNWw5NElqRmhJc3ZJQzJlUU5uWFBaREFYQ3N5bWJldXgy?=
 =?utf-8?B?UmhoS1F0VEV6TzJLQ1M3M0VSellqQmE4S25aNUp0Y0NieUlKNXZjQ3R3Tmwy?=
 =?utf-8?B?WHExb3VuYXMwZDhQQVhCYUJmUEtTakVlRlc0b1pTdG9GMUNQaFc4YS9CT0ly?=
 =?utf-8?B?WnUxZFM1QmxqS3dZZGY4TTMxSXJZV2psUTdWMnpmSUdabjNucXU1THlOUFo1?=
 =?utf-8?B?bW11QmJ3emREalBpVWE0UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1MvbnRUSFpaOVFodU5QRmplK2FFdWhvd1ErR05HS0N4cnNieTFKbkhja0dM?=
 =?utf-8?B?NjMvemRzdTlYMW1Qd1hWMzByTmFCQlFvYTNZVk1NR2FhZ1B1K3RITVJEV0pi?=
 =?utf-8?B?SlpKa2pPNk5ZV2NQOS9BM0xUcVZrdWpQQkxLNGpMNDZadFJJNFVmaWsvakhZ?=
 =?utf-8?B?bmh2dkRuV0pGZjdpTVA0OWwrYnpCUVAxR2JqUmM5U1AyUit4QjFxMzBsYjRY?=
 =?utf-8?B?QkkyN004dEtkRlBZeDUwM2ZZZDc1cjN0MkN3b3FHYUpCUllXNGNZMmxQS0xl?=
 =?utf-8?B?bkpkK3F1UzgxZ2QyUFFmeW1HcUlwR1dWVzBZZzdCSmlLbUNFSnFjOVlQb2E1?=
 =?utf-8?B?a2VvdlhZdUxSQVZQOWZBMUZWMGtxQitKT2M4RGZvQUpNZWptd1dyL2U0SEFy?=
 =?utf-8?B?T0Z1Rk82NVdBZjJGTEpsWVpyK3dsMG9HSzA2TURnL1pjaVRKNmZSVC9HRFRZ?=
 =?utf-8?B?TjRCQWFOZ0NFejNITVZBVzM0OXNlK2pOQk1BazI1dXg5NUx4cDJBUHltYXBN?=
 =?utf-8?B?T0ZVYTFINFhtdURWNUtzdlJKa2FxemZHaTNXeTFDM1pIa25GcHhnMlZEUHNp?=
 =?utf-8?B?Q0RqSEhEZHlYeFpsSElkclF1V1NzRmFQNFg5M3N3VlNHUkhHRkZnZS9zdUpr?=
 =?utf-8?B?N0NYS2hUeUJFSmJ5VHB4UDJnbEdrOHlveWMrckRoZ2RKNUdpQm9NRFhDVnBm?=
 =?utf-8?B?M1J2NUs1U0MwUGpKdE0xU0paUlZlMXFIWmRSRU54aWFFVUxjeXhFVkg0c1Jo?=
 =?utf-8?B?S1Y3a0x0YnRUN3oxZmVSelFPcFQ1eUNydm1HVHJ6T0NDUldwSkxCSHFXZkZY?=
 =?utf-8?B?UWNmakVUSnpDZmVXVVFyVDVpRmJneEU1MnZLUFpmUWxuU0k5V0xHZkNtTGYr?=
 =?utf-8?B?aHRQbHhUcFJVeWFQL3R0WkVpMTI2eW91bjU3UHFUQ0VyS1lUb05ST2Vyb1BQ?=
 =?utf-8?B?VUZEbGprTklZcFF2MEhvVVFzV05NcUV1Vm5zZEJzbkQ1dmtYYkpjditZVnFu?=
 =?utf-8?B?Q0g0M2NOL3g5d1FtUVU0Q3hGek44c2czZzMrTFRISmltMG5WT3k1UFFpbXZx?=
 =?utf-8?B?NklGTzJMa055Y2Q5VDJHbE5OMzRnQm9TNm4zMmovKzNKWjkwS3dkMWo3RDh5?=
 =?utf-8?B?UXVTSzM5QWdGTnZwLzgyemx5TVJKK3FwcEp6R28xZWlIV1g0NXFVTzN6WjVi?=
 =?utf-8?B?RXFBUldiakNNUllVcW5rbWFORFpaQ1VsL0taREhoa0xtWDBKcVpVUnZpVEt5?=
 =?utf-8?B?T2lQSkpsRFFNMU1IK2YvWHJlalBySjZPaXg5c1RwWlVmY05GUWtkS3lyOTh5?=
 =?utf-8?B?a0YrdXplVjZoNHgyWkRwK2xuOU5HVUhUeE43Y1BycC9pMW9sM2NHR3I2VVlv?=
 =?utf-8?B?UFYwNTlEL01zT1VKOFdMdmlaUTdIZ0RWV2lHS0xLdFVBWmpzcnpTQjV0clhl?=
 =?utf-8?B?djBNME5UTjdDT3JKSUJ2cjdLa09xOCt4UHd5MFVEd1pVZzNWL0VSZGEySHNl?=
 =?utf-8?B?NURiOUR6NXJaOU5MVFBuWHZ4TVB1ZHpPeUJhOURMSzAzOXdHRkJrcklLa1Mv?=
 =?utf-8?B?RVRxekxoeUlpM3FWZ0wwUnVQKzlldHJnNWw2bGI3aGRzcnMrMHZPTTE0YVlx?=
 =?utf-8?B?aTNCV1JMWFJIN01xTmorb2pUSzRZKzg2eENKUFJ5V0QxakloZEtrVnNPUVJ3?=
 =?utf-8?B?K1pmWFRXNmZGTkthTkJ3YnJjUjFKSHR3Znh0ZlUwREdRMEdjMnphN1BDWHJ4?=
 =?utf-8?B?SkpLWTJoOXdidFpmeUxSK2hvQVMvVHcxUFlMYm9WcmhmVXY2TGYwdHhJdE45?=
 =?utf-8?B?T2RoNUczMUpnTGx3elNtZi9qTjVNSjJMWS9qQ0FXM1V2V2ZQOWpNTXZqb3pP?=
 =?utf-8?B?Tzh3Sm9sUVNPSFJCZGZoVVlXeUo2VEFzRWt6Tm9pQXpEd2YxNjVMem1FRXJh?=
 =?utf-8?B?UUNTakpac3hRZHN2eVowaVp5RWNzeThnM2RjMnBud0p4ZW93azdoWnR6N3FZ?=
 =?utf-8?B?N1dSUHQvNlhEVjFGQk1pUzZzVEtLV1JhZHZROTNTTEo0VG80bnNaRmY2TWVn?=
 =?utf-8?B?elpBREgvRU9YRFA3RDVzZU0xU0ZkS1RmSEo4U1pMblcrcWJONnNRNERoSmJJ?=
 =?utf-8?B?ZmZFT2hoTEVVM0k2dkJzbGtHYlArK3dzYXM1Q3lTcjF3eVpoWlJvNGM0U0cw?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd514ef-c5b4-4349-af3f-08dd13fa03ff
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 00:24:28.8172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SglnzdlDwUGQgMpFFIyU3SVYTD3zLIMpfSiKVWMFlykvl7Ico6kky5YOQDMtgSvi+QtnrDMuB1AtlTNR4zRrTym0Pfcet/EPcz6EgHBBDNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4959
X-OriginatorOrg: intel.com



On 12/2/2024 5:49 AM, Nikita Yushchenko wrote:
> The device tree node saved in the rswitch_device structure is used at
> several driver locations. So passing this node to of_node_put() after
> the first use is wrong.
> 
> Move of_node_put() for this node to exit paths.
> 
> Fixes: b46f1e579329 ("net: renesas: rswitch: Simplify struct phy * handling")
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

>  drivers/net/ethernet/renesas/rswitch.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 3ad5858d3cdd..779c05b8e05f 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1891,7 +1891,6 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
>  	rdev->np_port = rswitch_get_port_node(rdev);
>  	rdev->disabled = !rdev->np_port;
>  	err = of_get_ethdev_address(rdev->np_port, ndev);
> -	of_node_put(rdev->np_port);
>  	if (err) {
>  		if (is_valid_ether_addr(rdev->etha->mac_addr))
>  			eth_hw_addr_set(ndev, rdev->etha->mac_addr);
> @@ -1921,6 +1920,7 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
>  
>  out_rxdmac:
>  out_get_params:
> +	of_node_put(rdev->np_port);
>  	netif_napi_del(&rdev->napi);
>  	free_netdev(ndev);
>  
> @@ -1934,6 +1934,7 @@ static void rswitch_device_free(struct rswitch_private *priv, unsigned int index
>  
>  	rswitch_txdmac_free(ndev);
>  	rswitch_rxdmac_free(ndev);
> +	of_node_put(rdev->np_port);
>  	netif_napi_del(&rdev->napi);
>  	free_netdev(ndev);
>  }


