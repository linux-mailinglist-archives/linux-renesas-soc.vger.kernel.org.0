Return-Path: <linux-renesas-soc+bounces-10879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 223679E306B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 01:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBEA1B25BA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 00:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C112817D2;
	Wed,  4 Dec 2024 00:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSU0ZPWU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE4E624;
	Wed,  4 Dec 2024 00:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733272144; cv=fail; b=bOAiyOukDawiP6a1bimqFJGuQrTz5lyFX/FK22KmfYDY1o20faaH0L3r75yffw60G6dbD8/5kJ32d9+PGoxSCBDIXAjW8xBJ8peU0uQza4Sf6nkk2ojQoJfcb4APMo34p9n+7nnrwz/+ODEBcRaySZ6P0w1tkJ1Uo1H3Mh+ZvME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733272144; c=relaxed/simple;
	bh=PtSZOYQAENy+VCOTLzF+eSsH7n1YyQuVvJssB/wj+Fo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c/irP2mfqHwzqV13NRuB0CEeMuwmSQ/kHbyzse+qqdVQ/fPWnwPIltK1vZCI1XZNKFYul964hkm6ubElHXHEsuezEaKDMZNioYC+H53EuiLeX4ZMK1eAePJIazIQLqrXYW9ot7zRsuVUOWCMtIrTHu9N0SstkgbVGoh6N60WzEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSU0ZPWU; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733272143; x=1764808143;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PtSZOYQAENy+VCOTLzF+eSsH7n1YyQuVvJssB/wj+Fo=;
  b=mSU0ZPWUsvWuOjKfKudQfyht1acqFjMhfuejV1M4GI+SwjpewR8o3b/f
   R5sHGUxaQ5cQIWuN7MRSUxG796ueeeLGme0vYs8vrh5AxiUxDIsBMeNHJ
   pGPwetJ4Xiqy+vfOn67sHQGwompq9eFHwWkurohwLYyJnCtKhgxme+W3C
   k77aai7OARn/olOX6vN3PqEzf5UALTDOuA9hcbTqJ4J2sZ5jWswvidb4s
   9vwuX5R0Ycbe59tM4NmEDJo946lPlPQUOzgZnwo/wOeoPgnzMEnoS2k/F
   J+50I5rPg8O8mWwX5/p/mQ5i5wiDrRL124uQshJpxOz2YHBwF2oYp1Rh/
   w==;
X-CSE-ConnectionGUID: xAflRwGkQyuOsEgMi3DA3w==
X-CSE-MsgGUID: dr/VnwGlRASAefRPDkBhzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33394585"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="33394585"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 16:29:02 -0800
X-CSE-ConnectionGUID: O9TliyYKRX+HyHz59yryhw==
X-CSE-MsgGUID: b0ynweTaR1yKg/2SQNDmcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="98407515"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2024 16:29:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 16:29:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 16:29:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 16:29:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0xxST24OJmPX+YCeq8g9hVAALgfAWaLxdiq4vSP1KqHFXNIi29BIEQif+0ZBH6tTVcOuSkv6fYNZyf4Bcj9Mqp1vLBGlJyVE+FTwGu25n+LzwppHB3FBApjx3w0rXdmZso9kYZfGVJWz3I72rFHVsJDPrI/diGq4mgFaSs6/t6b1VjUif/NDHRR3n+f8tjmCqmEPZoOg3O0GXM1KE3BKPC/ioh+mZyjaRM1ayNcemiitxde0SDRihdbjyAaYifTkC87AxuZjoYrO4V/oo8kQUrwTVDqmfuI0juMiPkiLMHtOmlWm0XAcF6ZeKrF0KPfeb3XI2glE32Qjae17ohcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGI4DIkBORVJ+nfJR3mExFsFiV7WhVuQJ/k4tj+1Td8=;
 b=EUYRb6a/35VDqQV3MtVt+xTHRnMGhAvd5MUaUCas2lDaLedqijbqVhEPn+G1vwtfznNwSdH/KTJfW6GmCNYqqcdT0UphJSt4Ke8S95cZUMmvuXnCLiGYAEIbI4IREaZdqUcThkBWpCHdcnUWAulF2NvS4QzOsnQOcz1PUAuauoiFrUpQ3SmJv6tsbTUBkc6oaqJ5ndVp7bZ2qxuOjXMjjO6xyWkaJPeuRhQt8Fe0KpIXcwopQz69JVBL78kL/YPGSBpbBPaMwC8R1b73WkIQNY5diI/izqZk1n5QtVS4qV1U6iV6J+VR7r1bGjob0vOse1TvyVNbO35k0RtrE0pKSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by SJ0PR11MB4959.namprd11.prod.outlook.com (2603:10b6:a03:2de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 00:28:57 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 00:28:57 +0000
Message-ID: <0f574d7d-b087-41b6-a554-b19c24cff1df@intel.com>
Date: Tue, 3 Dec 2024 16:28:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] net: renesas: rswitch: remove speed from gwca
 structure
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
 <20241202134904.3882317-6-nikita.yoush@cogentembedded.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20241202134904.3882317-6-nikita.yoush@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|SJ0PR11MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: 3935de09-696b-4d2e-94df-08dd13faa447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWZlYmxvVXhmR2ZWdEVzeVE1dzdzTzVJeHg5RjRmQkZJVGJrRDR6b1JleU5m?=
 =?utf-8?B?YUg0TzNBYU9uUUN6TmUxMTE2dENYWHROL0xOL09ncVMxcTVVYkJtSlhzbnBC?=
 =?utf-8?B?MGZXQU4xWEdIcndCVUQvU2Fub0d0VEl3azJWMVJlRnF5UGxJU09PcExObXl2?=
 =?utf-8?B?a1dZSnhFMEx5Y2s4dDBoNXhKeU1TSEprQkh0eXhiYUFxTUFJUVhiMXREdTM2?=
 =?utf-8?B?UWttcUZ6bjMvalRWcGN2Y3pxN2NmbWFEd0dyUHhBUEpYTUZEZWNwd3o2MFlT?=
 =?utf-8?B?ejNraGJ4MVNpb2V5VXA1bXI3N2ZKU3VnbmtLdEk5KzRWbklRSWZaWWh5a1dq?=
 =?utf-8?B?YWdhbkNPM3U5MFl6dzMxQWRGZThjSGIzcUYxSEEvYzlCVDFDL1BBTWhTSFdI?=
 =?utf-8?B?cFMyNFRHUXhmMWM3UTFmem1uc0pzdWVnSnIvS3lTK3pxR0MzbEc0YnIrd1RV?=
 =?utf-8?B?aGdCUElkaENVcllibWVNdkhmc045TDZ0ZGhqRUthakFhVGRPNTdXR1pLeWNv?=
 =?utf-8?B?WW1hZDBuOUQ0SFRzdTJib3Q1T2kvTXlyRkFMYmJxUnVBK1dSQ2F1QnhLSVUy?=
 =?utf-8?B?dmp0bXZMdmxvYlhuRFh1Q0FuYllkM2M3NWRBMnRTNTI1MmNSWkVnNm1XNC9F?=
 =?utf-8?B?NXBhUkdZWWJFUWR6YkJBbmtnZ2dNNm9kcEtTbHNCclhxS0orYnNSWWY2Mlh0?=
 =?utf-8?B?T08vR0Y2cTJTUFBrSVlNUXREWWZOVFZoWVhqZ0svVTRwWmhDdW44T3NhK0hF?=
 =?utf-8?B?MXNmVkl0cE9nM1VRZldjNHVWZTlUR1lTampVcjZUUnRnM3BGUzFHcUpPZVNJ?=
 =?utf-8?B?TGIwVmR6bHpSV09vL3RxeE1pOHdxNTlQWUR3MVlxdkltY1VoWW5uWVpUamRu?=
 =?utf-8?B?UlZFSnVzQ29raFl4MDZ1VEhrZUY3UjhtbnZoOGdaZU1RVDA0VVAxSDJGUjV5?=
 =?utf-8?B?YjQ0b09YcC9abTNiWlk3K1pkVmErMURJaFNOK2lTWFpBZDZPWGJFeGxmY1pK?=
 =?utf-8?B?ejZ0Ky9wWHdtd2tLcDZKNmxrT2FuQlJzSnhyaHA2aDBya1BPYXlZcjY1WEpa?=
 =?utf-8?B?QWhHbHpYcm1VaTFOeHVLUnlVUEJiZHQyb3psT0lYWTAxT1lTamNSdHNpenAr?=
 =?utf-8?B?OC8wKzJQU1l3bWZuVXAycmNZTGUxZkJNcHpvUkovUllzWkhKd2cxUzYxSGs1?=
 =?utf-8?B?Ukc5bElBeVErc0dHSWpZQ2ZmY2Y4QXZrdkhBRng1R3VVaWhpT05KQUFYb0s2?=
 =?utf-8?B?b3BERXByaFpYVm45ZUtLeVQ0YTlEdkJPT3JUN1ZBdWlWdTE3RENYNWlrZ3Fx?=
 =?utf-8?B?c2QxQ2V6S2JVdWVJM1ozYWFKMzlTWjRGczI5ejdhWFJGZFNGVlh4UVlvZnJt?=
 =?utf-8?B?eVZCOVpiVHd5QUp1eHI0cENSRjUzbWl5azR3L25TVnhodXZ4clA2VXo0QzhP?=
 =?utf-8?B?WXZCeHFNWGR3L0FFMTBlbU0xNXMxK3ZDZmlWMHRtQjFNL1NwSW54NXU1TFBy?=
 =?utf-8?B?RHpMdytwaDhjY1JSaDZ4Tmo3RitGS1hXdGUxMjZQSDNWeGRmL0F5WVNlS2lr?=
 =?utf-8?B?VWJpeVNqalFmaWdtWUJueWMwWWNvdHp3SVRkSXJ5NzF0L25aa3ZqcktCOUpt?=
 =?utf-8?B?dlkvMWtTcFBkSmtjaHBUdTMxampFM3VzSUMzeHgwWCtUR3dKVHczOVdGeDky?=
 =?utf-8?B?bE01NDJFTmxQSkNlTDBQSHdUTDZkMkdOUlI2MkFVNUQrS2RqQlZwaW55RjlV?=
 =?utf-8?B?cFNxaG1tRWlDQzNOWWUzekUyUGE1UmJ0UFREWjFTZ0ppbElZN25NNVFaYkQ0?=
 =?utf-8?B?cWh5bWZRb0pjakJLUXIwZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUtkY2dRbklVOWEyMWd5ZUcyVS95cFZ0dlJvd3RSQzN6ZldvZFYvTHRoZzRD?=
 =?utf-8?B?VzRaYlB1eXFrRThHNnY1OXlwRzhxMEQ5Lzl4MUxpbE95cVFhTm16ZTdqUU1J?=
 =?utf-8?B?Tlg5VndaeHFjMThQbEZTU3NtRXgyQ1FsVG1BMnZQbFlucWQyUDRzRnBxejRO?=
 =?utf-8?B?eUhnSkdVa0JkWHRHaW9nL251RFlQZkx2aHVTOEUvanhpN3MvS3ZBbVlZS05H?=
 =?utf-8?B?eWYySzdSWWFSU1FKNWNpaGZjR3dRTlNyQU43N3BTdkN3LzJnWE9rWVVyNHhG?=
 =?utf-8?B?R091SFMyT0wrMnJyZllSNEh2QnBDR1ZWRG0yVmVTbXBwK285bUx4OWNsZ0xI?=
 =?utf-8?B?bXM5elg0dm03UkNVNTB2K3pVQkt6cW5YUkRYajdxZlVsODVlTTFUWkZEQlh0?=
 =?utf-8?B?ZWVGUWw0ajhoVHZrRnZQV0hMdHBIZlpodmcvRUtMQTQxQTR2TWlxRzVwUklE?=
 =?utf-8?B?TnArcXkrY09wd25kM0hoeFNtdUlRbjdkZlJJYXpsamc3bytZTlF1bFkySS9v?=
 =?utf-8?B?ZnVxcFpMWEhPNnB5T0thWFozbW5jVG8wRHlmSThDRmpHVzZhVm5ycVh4WFNW?=
 =?utf-8?B?ck5wbGNYSm9sVlo3Ym5DdkZuVVhHckFyQ3dpWjFyQWw4RGwwK0pFREFmN1JO?=
 =?utf-8?B?alByZC95ekpZZEJTWWxUcG4vb09GZ2h4WkFnMkpJdGRtK2FnSy9hTTJRODRy?=
 =?utf-8?B?Y2drbzB1aGI4WEpyT2NjeFk5eW1WamdmMy9QQlNaSTlnSG93NjRyYTVmeFk0?=
 =?utf-8?B?SEFCbWJzZEtlZW93NVM1TU9IR2h1bkh6K2l5TlZ0emZTckNQVWdDTkpiMHUr?=
 =?utf-8?B?by83VXdFanJNT0F2YjJXRjZ6WUFGV3dRc3BZdEgvRTBNY2NZbVFCVmNzUmF0?=
 =?utf-8?B?OGxuL05pNW9DS0J5VmlRQXlVVmszU2xOMWRWTjJxY2Mrbmp3WERiL21uS0cz?=
 =?utf-8?B?Nk0ybUloMVRFZGc4ajVMaGtGL3QxdXlnbTk0YzlRRjNvWVpsSm5EU21JQVVS?=
 =?utf-8?B?dEFtSHN6UU5WUU5rT1dzWmhvd3dVeStZMTVQVy9lSEFhMkRUVk1GMXh3em9x?=
 =?utf-8?B?aG1sOFRGV29BdGVWYmo5RzBYeS9VTkdwSEk0bGdEd3BETWtZa3RlYy8wU2pC?=
 =?utf-8?B?cXUvM2h5WnZIVFlzMlZEWmFPQnRrWDJjZnhia25WODYxNE55eVMyWGx5Tkpi?=
 =?utf-8?B?cEo4VTlhdG85WVpMMHV2MWtDNUsxQlJiNGttV01TUnF4WFZ4bzV1WVQ2WWM5?=
 =?utf-8?B?U1J0QlpVMkNaZTFoeWxGM1dqbTQ4bjJMS2pvcVV0SGxQSjFQZmd3eXJUZTFK?=
 =?utf-8?B?eXBmVHNtSWl5YWkrd1BkQ293SlEvME5GcjZCQ3FTZUtqR0xzeHZudlR4WWp0?=
 =?utf-8?B?Z2N4QTBGQ1JhVnAvOEhpZDMwNlNrcCtocWZYQUc0cGtnN1pXamQrVmNJa3Rx?=
 =?utf-8?B?RWFzRXF0TGdCbzlhWEJvbVF5V0F2a1Q4TEhMSFZ2MWZEN09ZTUNNUHdGRUI2?=
 =?utf-8?B?MElRTW1uMkpDbzFqWlVjM1RtWmFaZ2s1cm5pREtTbXgybGFKaS9mNnN1NGpt?=
 =?utf-8?B?QUhETFp2bDhmMnJvdkJFV3YvalFZODZzS25KZjFhLzM4QnZMelpNTGNMeHN2?=
 =?utf-8?B?LzNUZDNLVHdWMVIwbUJ3UGZ3WDZNU2twcE5mL09JVGIvcUxTODBaNjNodE9G?=
 =?utf-8?B?THRxSGQyRlY1U1J5VjdWOUQvbHVEbkN4bU1GTlBnY1NNTFZPWEppU2k2QlJk?=
 =?utf-8?B?UStDYVJPdGNuamdXSFMyMU5HR25pLzRrNEVFc2pFRENPMGpLaFVXdkd6cElv?=
 =?utf-8?B?VTV2UktwS2dCZGgxV0tCWVJPcUE2elhxVDFmelhobk9UUXMzRU5FTW1RR2p3?=
 =?utf-8?B?QkRBcFluaTd0RWJUTjVHUWdYeDNTNThSL0xYUnZqNVV6TTNQd3ovY1IvSjNi?=
 =?utf-8?B?TG9RV1E4NUl1WERzUkt3ZC9jOWJ3UXZjVFN6ZlQ1bm9lY1ovdExTd1hEVDRQ?=
 =?utf-8?B?dkpmRkFIR0dUWUlqUFNoRGQ0U2ttMUZod052ckdtYVlkZm5XbkZxOUhmanBG?=
 =?utf-8?B?OHhqcW45dEF2b3I5VzdkRHhNYmlvWkRRWTlnR1k3OG5nRG05aXd6RGdGRSty?=
 =?utf-8?B?dlkyeE9CVFhBbnoremcrUmI4NnlDMnRyRlNEOFNzbEZ3QkNaUVNPM05obVhD?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3935de09-696b-4d2e-94df-08dd13faa447
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 00:28:57.6682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ydj2OruC8u30ZDKlTFBLRCYLMu+tDxmOHgfmXRgchUOFkdohuAntte4NgTyf+JKyNXP3j+1h1RVVADin+cgJbz9dkTGwqSOOHi3s6GlEXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4959
X-OriginatorOrg: intel.com



On 12/2/2024 5:49 AM, Nikita Yushchenko wrote:
> This field is set but never used.
> 
> GWCA is rswitch CPU interface module which connects rswitch to the
> host over AXI bus. Speed of the switch ports is not anyhow related to
> GWCA operation.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---

I tried grepping the code and didn't find any other users either.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

This one also could be a cleanup that goes to next since there doesn't
appear to be any user visible bug.

>  drivers/net/ethernet/renesas/rswitch.c | 3 ---
>  drivers/net/ethernet/renesas/rswitch.h | 1 -
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 5980084d9211..bef344e0b1fd 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1902,9 +1902,6 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
>  	if (err < 0)
>  		goto out_get_params;
>  
> -	if (rdev->priv->gwca.speed < rdev->etha->speed)
> -		rdev->priv->gwca.speed = rdev->etha->speed;
> -
>  	err = rswitch_rxdmac_alloc(ndev);
>  	if (err < 0)
>  		goto out_rxdmac;
> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
> index 72e3ff596d31..303883369b94 100644
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -993,7 +993,6 @@ struct rswitch_gwca {
>  	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
>  	u32 tx_irq_bits[RSWITCH_NUM_IRQ_REGS];
>  	u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
> -	int speed;
>  };
>  
>  #define NUM_QUEUES_PER_NDEV	2


