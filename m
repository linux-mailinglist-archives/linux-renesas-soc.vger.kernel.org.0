Return-Path: <linux-renesas-soc+bounces-14647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF58EA69CF2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 00:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F64F3AAD26
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Mar 2025 23:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2BE222582;
	Wed, 19 Mar 2025 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbBghBtT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D455020C46A;
	Wed, 19 Mar 2025 23:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742428631; cv=fail; b=bt3t1hQ1nFuI0lWfNPQJ32Zf81jn1VenEB2tZ6I1p2uDCiROz5Av84M8ZiE7LVbuVyOw7gMxHYS1uzc+bPBA+ZvYX3ZXxxw8onQMxAT1A6PnZQcbnPymSjvmW+rm08Ogd6zHGvROKn4d6EmiiJ3Z3Aqsvo0MlfFaj29yPZVPIsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742428631; c=relaxed/simple;
	bh=Y7yc8WPfVKdTXwDug81e3BdMXvWVOwh28hiSvS6nB5A=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GpCwd1Ts11z9F8VlBaEzwwqRWV1Q9vkiHleE98UHKRqzvK+sIbby3YU9SFxdi6epFzkyauybR6+7nemj8pceuH3cpiWf/KuZrNEfyqK4w27cV2ZFc6VrNHFzMegiXKJOYm/eEVublYi36LtDbnsKOT7xWN70N2CHn82L+Mxdd1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbBghBtT; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742428629; x=1773964629;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y7yc8WPfVKdTXwDug81e3BdMXvWVOwh28hiSvS6nB5A=;
  b=dbBghBtTbHziUqz20sU72a4foztROHfVrZdCI92VHOiOpUcMtuN+wVW9
   h+QM/5YbH2FM+Dbi1ihRi2+NQ+tErB+5HYv2e8bJR9CUwP/LXEbIOyJOZ
   yoM6HYwukmkqTuhIIjA5FMM/gxwCicKBPXGYGIEkt1n9BhiccXZq0Nq+2
   D/0wm3C2Rkf5Ohk1Xt2ZA9g2XKJ1RLdCefC6VTC0+TwS5xDd1QtIhcbDV
   +AmfjJzXG/C888suKLLyfzfXYjuOrhvxJSi9jn2WamDSbX+vHsuqRYykU
   yoV+ifSgp+IATdTPjSxfWH9/9jLeNDfB/+PaqT6tJLdawKNQiU1JI6zod
   Q==;
X-CSE-ConnectionGUID: crDX8gXATJSQvGJb+PnF2w==
X-CSE-MsgGUID: /FX98hmYRISGkhaOFjPltA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43755478"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="43755478"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 16:57:08 -0700
X-CSE-ConnectionGUID: IQ3UPigWR4CNKIuC7a+jRA==
X-CSE-MsgGUID: NhIIE5LAQ5SFMHEi5D5zgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="123323686"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 16:57:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Mar 2025 16:57:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 16:57:06 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 16:57:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLbe/q391NMAF/VmeFEM1QTBrshWU4OvI8YGP568qsl/rTrXpPNnVj/mvGPHAmCiZ5FJRjcddrxAjUwJH7GYuFveJ90gcd9V2ey7LmkSTC5YMfdbAort1sh/PzPj2Mg0c0Z3x2TPrt5xlW/KuamKM6pnRj6B/y8pmeLZY87ofnSt88d3m50bXWHcDUYnD0n7PnSWOjbe75qMQLbLigCIMsSAMk350c3vTzngYEwZl3ZNU99r99HwNyp38TEsaP9bn7/F68eEdTGNa5fx68x5TQ4Y+Vw9tMU/qE3Z6ncDZk+VKlNZycHqeDamNynXi3eV3w3pqDHEGPQqFPyg5dAjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tnLEoUoL0kmCfG4I8IVTz2bNfFCmMeC1OZsLEm3G7Y=;
 b=T6AYThyWY4fVJMEDyU6X3EhIZAaoKCMQyGpO2xIRrQRCM1S41183qQzs6/okkfC053oDmzmmKV9FQ6JdQPpQQ3oBZmiDh/hbTsCCM6jyLzsq46A5kQ+sanPiGbneVM3pIDei8BCIzHZoHVZWYaDUwUpH3dkmfQUfsziKdldOb2/q6eNvQ7J6xN/y+SWHbycI4Eo4cQOQPsd5E6uq1LexvCz1oi13GxxojnKvFgmZ48BsJlyURpUcymeCS5hoQ+NZDuvyQ8NxLg1sUmgcdtr+bc3pgcwyroWjiGysSFMMwEpj7D/b4M3f4u2TadurhHX//3K/Cz/SXf8hTkaz/6oNmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 23:56:49 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 23:56:49 +0000
Message-ID: <f4a88a97-e655-4e39-a8fc-667223e217a3@intel.com>
Date: Wed, 19 Mar 2025 16:56:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/5] net: ptp: fix egregious supported flag checks
To: Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, Ruud Bos <kernel.hbk@gmail.com>, "Paul
 Barker" <paul.barker.ct@bp.renesas.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund@ragnatech.se>, Bryan Whitehead
	<bryan.whitehead@microchip.com>, <UNGLinuxDriver@microchip.com>, "Florian
 Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal kernel review
 list" <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
	Jonathan Lemon <jonathan.lemon@gmail.com>, Lasse Johnsen <l@ssejohnsen.me>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Michal Swiatkowski
	<michal.swiatkowski@linux.intel.com>
CC: <intel-wired-lan@lists.osuosl.org>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>
References: <20250312-jk-net-fixes-supported-extts-flags-v2-0-ea930ba82459@intel.com>
 <4cfeb80e-8799-44dc-9b8b-7b7e0e329541@redhat.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <4cfeb80e-8799-44dc-9b8b-7b7e0e329541@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:303:b9::35) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|CO1PR11MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e02f4cb-d4d5-435d-8fd7-08dd6741b6b7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWR0cFcxS2g1UHgyT0JQU0hjYTBnY2pYUWRVZ0ZnUzB4dVExTU5SUTE1M01V?=
 =?utf-8?B?UmhHU3VoM0xHZEVRQnNpMFhZNk5BeE9GSDJsT2Z3aXhVVkwxb3BQNFhOZXhJ?=
 =?utf-8?B?dG0vTDJ3ZkpENngyYVZNL3kxUms1cUFnKzQ3SWlwZDkxd1BwdFQ1R2QxNmpq?=
 =?utf-8?B?MS9mVHBWOXZLZjJDUDk1YkdxTEhGWTZUZTREYkw0UnUxdk1rOU9JdVNobkxT?=
 =?utf-8?B?bHRNT2tjNXBBZG8rNU1yQ1ptV3g1N1lKT0lDZzRKTmRDa2wzcHdyL0xSbTVs?=
 =?utf-8?B?S0hkM3R6OSt6eTdWME5FR2tUR0tTUnMybWFkQU5JQlpWMFF4MURUelA3S2Jz?=
 =?utf-8?B?NjRaanUwM25TcU5MVUEwNWFXQ2JPSUpjUG5jOXNEOTVhNGRlWWJjWkpYOVFz?=
 =?utf-8?B?bWtFRklxUmR6SkZqZlJLbEpoZHJwRWUyQUR1V1VSZEluZEpldlFuWEVMeHN2?=
 =?utf-8?B?S1o1S203d1dSRFdHOUVkYkFrQlAzUS95aEJKSGFiVVY5WUVGSDU1akIwcTk4?=
 =?utf-8?B?bVN3d0sxYmE3WTNzR2J5ZlNCRU9mUHB1M2ZETkNUV2hpVXorZnNMQ2RTcTZj?=
 =?utf-8?B?R0hHTFFrRnJGb0FQVlhWNFN2b2t4ejFkbi9PcXNCejFTSUNvamR1YWFVMnFx?=
 =?utf-8?B?dml6ZG9ydHo1d3BvS1J1dG1RNG1XTUZscHJKZGFyU09UQXg5WkhJV1lKbjNa?=
 =?utf-8?B?M1hlNEVpZGFjZTlpQVhNaG5LQ3dsOWpuSmZDcGs2THZuQ3FoSmdXZXE3NTNV?=
 =?utf-8?B?WjlVT2Nrc1JkVFhnWFNuZlpqZ2hGWFZFZXBYVXArQlRodmJQOHJyeHpaaE9E?=
 =?utf-8?B?TWQvczBPQk1WWUdHZHRDU1M1ejZ3eE1QTUpnWmthdzJIbUlHVCtoaCsyZzF3?=
 =?utf-8?B?N0pLZ3JNMXo3enBnZXlVK205R0hOTkNmbnF6eGpJY2xSMjRyR0FyeHpzUUZ6?=
 =?utf-8?B?Z2ROeWZ2VUZpQXlabys5NiszTFNQY0I5bE1rWEZjZWpRb05SR0kyVDdUYjZ6?=
 =?utf-8?B?ejBBcTAzcm94Uzh4Mm5BTkxhM1lqaTN5eGZMcE92UWR4WlBZSEV3YzFQaUtK?=
 =?utf-8?B?a0hHdWNYTCt4S1pUd3BjbFVmVXMzWTZtcnlmWmdtNUhTWFdFOW44RHA5MCtn?=
 =?utf-8?B?Q2gycHJ5ZHNtclc1M3g4RnArQUlrTTdTK2xQZGJLNlJhZ1VJQ0kxeFd2d2Zy?=
 =?utf-8?B?aWk5TG9LSXFEdGJwNlVEUHU4QmNzcU1mWHV3UzhVcEMrN0kwQkZoWUt2Y0pJ?=
 =?utf-8?B?eUZ3OFRNU2FjTld4S3Q2YTlMQTRqYzBXMDUwa21WY3FWakhxTGRqNXFOVEM4?=
 =?utf-8?B?Y2tCc0ROczRxUnprMXJEUVVpbXJCY2dSUE1qZ2YwQmx6OEN5cGZCTHpzQjNP?=
 =?utf-8?B?TlZBVExZRVR3MWpvWm10eEhSMkFJYWwvaXlHdkpGakRoMk1YY2JTdWtZYWFF?=
 =?utf-8?B?cHVvQVFHRmRmMDBXOFBSUnFkUTY3WXpvNEdMU3VDcWpRYUZ0bmNhZ3g5bGpQ?=
 =?utf-8?B?RU9DZ29hSUgzSHJXdDJRUGxTUHFWdGZuS0tYMUpxNENHT2hUQnFVVWk2Yzc4?=
 =?utf-8?B?N3U5dUNLTVo5TWVCcUtsc0NqQmlVZDQxL1JDQkhWYmpHbkdoaERDUm5iZTBS?=
 =?utf-8?B?Z3p1aUVsTTgzTXA5VzJtd2tOTUhjMGFsK3lyNFJLeUgwV1FjNmNxTWFmUmVs?=
 =?utf-8?B?eFl1ZHBqbkZ0SDJTbm1ub1Z6U1hRd2Y1QkUwVEg3OWhMWkxHcFJrNVY2dk9w?=
 =?utf-8?B?YXNvWWloVUdZWGJSeFB5NTJaVGtNbU1wbW9iajFWVndtZ1JYNU14M1gwYk1x?=
 =?utf-8?B?MmxGcS9VdUpvbmdKZTE1MS8vcmFVbFJwUHRIdmFEVmkvZjRlQ25lN3FOZ2lo?=
 =?utf-8?B?cTdyOEcyQnZzcHBnQVdOMXJnUDFScWpRK3cxbGc1Qkc0Zk01L2hiMUJlV042?=
 =?utf-8?Q?FXOSH86xzAo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWNFdk92V3pMZWR6aVF0OEJwSXBkaVlheFdlMlU2N2dNZVUrVkx2c3hFRXFG?=
 =?utf-8?B?SjBoZXVaQ3I0bzNMSjhUTys2VTk1NHNNZnIvcy84ZE53QktnUlpKa0w4WExw?=
 =?utf-8?B?a2RxYUticWNiTFFyVXd5TlAwSDhGYUdLWFBzM0hkL2dZZWpnY0I3SDU2cFQ4?=
 =?utf-8?B?QVltSkhROVdKZ251UTFIbUI2SG9TU25TM3BRZXZrTnU4d25ERk5pZzVKcEJN?=
 =?utf-8?B?QWtuNVpPYjh6R01rREpjUEcrQkVXbnZqYkRHdWtwSXc5ZW1vcVJVckZFUmZH?=
 =?utf-8?B?dkZwNnVuMUF3S0EyaUpielVDc3llalJaTFRmeEVQMWdmenJvNjdGZmFDbzJm?=
 =?utf-8?B?cUZ0bFR0YVlNMWNwMWJyOGJ2WFRaZ2RpTFdBaGVydkNtVDNDMURJRkk2YU50?=
 =?utf-8?B?cTBOcXRwTVdhUmw5dC9nWlNuelgwNTVMTy9NWm1OMGxOVGdhd2R6ZU95Uk4w?=
 =?utf-8?B?T0pjbHJlRUphVDMrVFg4ZXc5QUdhOHI5RnFxaUUwTUUybEZqcU5UK1M5WDY5?=
 =?utf-8?B?SU93dHBaMGxUY244UTlRQk0vaDVJc0szVks0OEJrVjFvK0xYcUZxNkR2RWhq?=
 =?utf-8?B?ck1pbUNkcDQzRGk3cysveHlWVGNPOGZTbm82RHNxMTJvbTkzMzhoWXR4TVlS?=
 =?utf-8?B?dXJjSGd3WXAxc2l3S1hQUWhWVUkwTHNhSjhOUHNtVUM2bkVXd2xEVXRaajFy?=
 =?utf-8?B?cjVNT0kvTXRISHhMcGxtODArM2hFaG9uYmRvUnJuMkt0QUQ2NWE2bm5OWTdY?=
 =?utf-8?B?OE1vVCtXU01WMS9vQ2hqc20rSCtxZlVuV1lMNU9LbWg1bGVHWndIdDZEc3Zo?=
 =?utf-8?B?cWw0b0g5VkhHT0gzTTFmbnA1U0pOWEt1ZlpBMEhZL0tGaGMxUEVnSlBoZGh4?=
 =?utf-8?B?TElDWnYxaVd0aGd5RDk0RVVZekxnZENqdTNRWFovaUJvZzZDbXlLalJLVUFo?=
 =?utf-8?B?YjRmT2kwaVZGdmFpUnMwcEhYd3hVSVVNVXZuNnZqQnZROUxmZjRBT3BmOG9n?=
 =?utf-8?B?Q2thQnc2aGtLVVB3MnovZlZNYXNqaHU5OHA4WmVSaS85TGRxMkE5aTgzTGt6?=
 =?utf-8?B?eEhST3BwQ1lOSEFTUXdMd3lJNW5sWmRvMmk2Mi9lS3c4ajZ0dE5TMzhleWVW?=
 =?utf-8?B?ZG1OSHR5ZThqbWIrendoeXVERUFKQzltQ0w4ZnlQdUpPbGUzcW1IdXFWUitu?=
 =?utf-8?B?OUxtek50Wlk5NDNzR1pobTc4cWtUMUgvSzVOdmR6ZTA2MUE0emc1Qm8xRmFH?=
 =?utf-8?B?L3orYUtSdDE5RFBMU2JSajQ3NTUwNWd0SXFJM0dWaGVTREtkMHNuUjc0U0po?=
 =?utf-8?B?eENrclduWWZiTlZTeTBIRE80N0ZwZmpiTHorM3orNHd4M053Mnd3REUvR3hC?=
 =?utf-8?B?bmF5OHZCaFowRzFoaGh3YWpFTEs5VGZKZ1loMklyWG9McmNLZkhLRUhCMFlj?=
 =?utf-8?B?VjZQMTZBRE43bUUxaGxuNGMzaUZMOU56Qm04eVYwMk5VVHlkblpiVGV0ZVJM?=
 =?utf-8?B?YTJJQnJ5SU5EZHJnbGsxd3hnWlJrYnRhNE03NUI5MWlwR3UzUVhJQlVPQjVz?=
 =?utf-8?B?aitOeVoySlVFNHZ5UmhMclZNRFg1MWVkcEdqZkZWcVc5b09sSThDMUszY1Jj?=
 =?utf-8?B?bkQ1ZmVVa0hqYXRld0VLbnV6Q0tUWGpYaFBkbjBnbXBGb3ZyV1ZWb0NvbjFS?=
 =?utf-8?B?bW5iU3psWStBcC84b25JOWhVcFlrU2p5U0J3M2c0M2F4WEU0S3ZzY2tvendp?=
 =?utf-8?B?K3B4MFE4YStjVWorTWJFL1VGaWt6L2thdTUzaWMzRUh2NGo2VnpaUFVRT2xM?=
 =?utf-8?B?ck4rL2VBUmZFeHhoaFVkSDA3Q1NScTZZM2JObFdoNDEyRzR4UVZuRmRabmVn?=
 =?utf-8?B?c2VjYW5LbThPYUc4QXhWU3dsbHEzbGUzVXlxQmwxcXY5cTVSQUMxandOMVR2?=
 =?utf-8?B?K09nM056WE85S0FpYWs1R2JLSm9YYWpvQlNlZDdKOUFwdmIzQzY4TUZWbFhL?=
 =?utf-8?B?cHgyVlJBZHQ2QkZpMVJMTkFwWXc4WThOY3hpV2RtKzdYaFlRU0J1Nk9UWEFT?=
 =?utf-8?B?QzFWOUdDTkFMbGt0ai8va1ZpbHE4R3lkUExtUVVDNXNDbEk5QzM2YUsvSDFI?=
 =?utf-8?B?WGs0MDRIQmJJV1hmRkJrU2hLMTVXcHBqRUF4NU1NZmQvZnZ6c1MxelVkVkFS?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e02f4cb-d4d5-435d-8fd7-08dd6741b6b7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 23:56:49.4994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1TgJxsRshRBZrMdjQKHdicAe5aVCVFK9pd+Hd2wRKBqPCeoXR0tKuwOcDlpTiSyIhAeyPJwe+g97xxEzXosiA8okPO5IRnh4y1cyznnedE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
X-OriginatorOrg: intel.com



On 3/19/2025 2:21 PM, Paolo Abeni wrote:
> On 3/12/25 11:15 PM, Jacob Keller wrote:
>> In preparation for adding .supported_extts_flags and
>> .supported_perout_flags to the ptp_clock_info structure, fix a couple of
>> places where drivers get existing flag gets grossly incorrect.
>>
>> The igb driver claims 82580 supports strictly validating PTP_RISING_EDGE
>> and PTP_FALLING_EDGE, but doesn't actually check the flags. Fix the driver
>> to require that the request match both edges, as this is implied by the
>> datasheet description.
>>
>> The renesas driver also claims to support strict flag checking, but does
>> not actually check the flags either. I do not have the data sheet for this
>> device, so I do not know what edge it timestamps. For simplicity, just
>> reject all requests with PTP_STRICT_FLAGS. This essentially prevents the
>> PTP_EXTTS_REQUEST2 ioctl from working. Updating to correctly validate the
>> flags will require someone who has the hardware to confirm the behavior.
>>
>> The lan743x driver supports (and strictly validates) that the request is
>> either PTP_RISING_EDGE or PTP_FALLING_EDGE but not both. However, it does
>> not check the flags are one of the known valid flags. Thus, requests for
>> PTP_EXT_OFF (and any future flag) will be accepted and misinterpreted. Add
>> the appropriate check to reject unsupported PTP_EXT_OFF requests and future
>> proof against new flags.
>>
>> The broadcom PHY driver checks that PTP_PEROUT_PHASE is not set. This
>> appears to be an attempt at rejecting unsupported flags. It is not robust
>> against flag additions such as the PTP_PEROUT_ONE_SHOT, or anything added
>> in the future. Fix this by instead checking against the negation of the
>> supported PTP_PEROUT_DUTY_CYCLE instead.
>>
>> The ptp_ocp driver supports PTP_PEROUT_PHASE and PTP_PEROUT_DUTY_CYCLE, but
>> does not check unsupported flags. Add the appropriate check to ensure
>> PTP_PEROUT_ONE_SHOT and any future flags are rejected as unsupported.
>>
>> These are changes compile-tested, but I do not have hardware to validate the
>> behavior.
>>
>> There are a number of other drivers which enable periodic output or
>> external timestamp requests, but which do not check flags at all. We could
>> go through each of these drivers one-by-one and meticulously add a flag
>> check. Instead, these drivers will be covered only by the upcoming
>> .supported_extts_flags and .supported_perout_flags checks in a net-next
>> series.
>>
>> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
> 
> I admit I'm the most significant source of latency, but this series is
> IMHO a bit risky to land this late in the cycle in the net tree,
> especially considering the lack of H/W testing for the BCM phy.
> 
> What about applying this to net-next instead?
> 
> Thanks,
> 
> Paolo
> 


I am fine with that. I only sent to net originally because I thought
some folks might consider these worthy of backports due to the potential
for user-error. However, given the minimal testing it may make sense to
go ahead with next. Obviously no real users have complained about the
situation, and this is more in preparation to make the kernel more
resilient to such mistakes in the future with the .supported_*_flags
modifications coming next cycle.

Thanks,
Jake

