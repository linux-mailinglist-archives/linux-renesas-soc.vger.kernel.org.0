Return-Path: <linux-renesas-soc+bounces-21830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8987CB5506D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 16:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DACA87C0909
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 14:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E94C30F552;
	Fri, 12 Sep 2025 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVQl/o/4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9073093B6;
	Fri, 12 Sep 2025 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686003; cv=fail; b=u2pGUwWZOjGPggXgQSrDdXZZ3blYw27ZhzaiSMh0RFeEn8Lz822U8ut0G4JykvLgkCqCMM/QiELrNaUDbR3TqtKIYbdM4hl/LPH6Yjt8tRc66wY+BISz6Z+DS2Howqds0mRT1l8kLO4RWARDmJdlp8mw3zR6MGAPSLVsetH6tro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686003; c=relaxed/simple;
	bh=pAWBSIbOgzYR+Vf3ZIII4Xd2B7j3WdqdxVYFUQiGUKc=;
	h=Message-ID:Date:Subject:To:References:From:CC:In-Reply-To:
	 Content-Type:MIME-Version; b=d2ksvhLH8G+hkZfB/fFP3w2CjS95j5cVOqIw5xtKixf8Je2mwcTwVC3yhvHV/V35nHYphb3vp2gqMnYOsknhOJWdd4TKtsIHHmgpmdqxXy7ePNq/lzQT50G+1S5q1hBu9AssKZaegI8YGRwf0VTZM3B2rpWYcR31qrOisU3Jw28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVQl/o/4; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757686001; x=1789222001;
  h=message-id:date:subject:to:references:from:cc:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pAWBSIbOgzYR+Vf3ZIII4Xd2B7j3WdqdxVYFUQiGUKc=;
  b=LVQl/o/4UwCeIFPL05mW2V6Fyzc9XpQTsAciojROfz0hk0TYj4MiyuW6
   0CnR575HY4Ngmjml0xpAlNIMdEIaTsQVqUt8ob5uDZTLnl+2tTkmPQF0i
   w+Xseg/Px3mPFHGHk3NRRhhAdj+3+qoUn5hEzmLvK5hLqDephf3YSPC/a
   TeCg08Nd5GGnPv+qMX30l1984dVwIkQTH3cpfb7NX3SoGhoiccXSHzG73
   5p6V41bBxxm2AJHhaBeEwCF3DyJKNjfTSQzEpK73b7tvY3sBYzsvqbf1p
   p3ClgxrrHEAQfbDGqALXxtW7LIFULTqWYAn0NeXAnqaYOscLN3ATz/t/r
   Q==;
X-CSE-ConnectionGUID: vOJZvzTwR32acUSYyVb6hg==
X-CSE-MsgGUID: QHzdf1yZS62DCm2k03Oi/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82618706"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82618706"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 07:06:39 -0700
X-CSE-ConnectionGUID: 0+W8mm1FTKiPyz9AEtBE+w==
X-CSE-MsgGUID: 014cY38mTVyloxH11eS0qQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 07:06:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 07:06:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 07:06:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.71)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 07:06:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGKosOHiITWKZmByMryuuhi2vJ4A9WD9MOrgZpZsjJyfDLHXMR8em6sRK+1zobBqQA0bzRRJlxdGKqyNKyh7O3AAqiUVo15pEhfZ4nSH0lm1vxMKTKMlcQ5yIkmueJDh+t9eA/Ise3Ib7Mf79v1BvbJmdwELXESSsEwtGEBRieUTwUM9i9C3n1MbA5NfOsC9GHa+ZOWO0DVvlDA+qhmiEh94TxhzzoQD/6bPIozYY8eMPX+gkPRkKMTWyJhYxz/qD0EOQwLxrMPRgZNgU2Xpr+lXcMgGImutA/s5JJFbOdPOBe76Z4FXsDTDDQfUOnDmXIdWkRwVpkuYjHG+iukt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xH4BU35zlPVt20Gxjje/g8aSmxqqD77gx33PvxI2N/s=;
 b=ksJlvf67AMDpQetxETAj+zcfr3hoiohiOiA+N+HFhvmaZ5ulMgHj3WG1GqY4FuKRIII05nS0R+H/jWjXozQv3UBQMZ0edUyEkSmlicPsmlx+odqNpJiT455AY/2wcxpw9ash4eOkpHYwE6qzoAxWuITsPtjsRSfH6V4l1UiZlDrFu+XLTfbyrw7cgee7ilcAJ6GxKWQnnr/EtHMZ50xvd3bRRUowFcA4C5l9es7FUfaST9WeFjWsutZnxFJXCr5HpnjyJvqkOvOzz19uMu0RjeFLzNiA0xBwKS4/WtaWKEBZX0SOGzOcTsrf6Ms0L5Yk2fLIbn21Ctwuetib3SBCow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 by CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Fri, 12 Sep
 2025 14:06:37 +0000
Received: from MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6]) by MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6%6]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 14:06:37 +0000
Message-ID: <68e59cc4-e76e-40cc-a53a-4e690ad5eb53@intel.com>
Date: Fri, 12 Sep 2025 16:06:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next] net: ravb: Fix -Wmaybe-uninitialized warning
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
References: <20250912130624.1022028-1-niklas.soderlund+renesas@ragnatech.se>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
CC: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <20250912130624.1022028-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MN6PR11MB8102.namprd11.prod.outlook.com
 (2603:10b6:208:46d::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8102:EE_|CH3PR11MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cdef9d-1b90-41a9-78c3-08ddf205964d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFlKbldsRDFBRVpFVVUxWEUyZUwzV0xSZlNQVU9yLzZpbVNkY0FoakxoUm1m?=
 =?utf-8?B?MUdwTWJKWms5MXNKUi9aTzRROHVNOEgyRzFFMTdTVVVlZXZybjVscGg0R2Jt?=
 =?utf-8?B?eEdCbmJhcXkvekNOVTY3ZVdUZmhUdmVPTlJMcjM1cG1uTWJUWlg0QmxkdnJD?=
 =?utf-8?B?MnJsTDhxV2JyYzYxdkFVckVyUUlRSERXRDB2Z2dkdjRsVTdFTlZlMkFCWlVE?=
 =?utf-8?B?aVFUdkdmSjMxWEFNeENHcW1NSE4zY3EvQ2c2T0dsZWd4TzYvMENEdDBuSjBp?=
 =?utf-8?B?MFRXaVYza2MvVkgyVk4wNXNuRXBjYmlpOE8wL1NzWGpJbjMxY0I3d2VZNm5v?=
 =?utf-8?B?aUhhNVExQWN3OUVkaThKakRwZjk2OXk4NjgwZjRwVlFKcTRGbGhPV3V5cnZu?=
 =?utf-8?B?WG9pSVR1UW91c1gvK2tCcHZlMW9lUWY0K3RNRWFWU2t6VXpFaDFIcWlRdTBt?=
 =?utf-8?B?SVVlZjk3SjlRLys2Tkkra3pyaXd4a25ZdSs1KzNlV045OGk3SktaTWI4b1Jy?=
 =?utf-8?B?M0hBbmhwSm83OVpwMlgyK2M3MFZIaXh1RDNHOWxZMlFKYjVkNno2QmFMVXpL?=
 =?utf-8?B?QXNkalhrQVY5QWs0WmhieDgyMzdHSXcweEJmMElSemxwYnFZanAweFBFWWlO?=
 =?utf-8?B?TVNFRFdnNitNRFFGUzJmVVVueThxYm5RTkE0aTJXazljUW9TekxtSXQ2WmRV?=
 =?utf-8?B?NVk0ZkJmdkFlS09sMTNiblcyV3lMc0lwVTQrZnd6L1NVYkRORUcrNkwwOCsz?=
 =?utf-8?B?L2JzT3JKZFVKWnRWUXZQZ2g4OXNZWG5Ea1FjNHBWZmNoLzQ5QmhZZzFIRDVl?=
 =?utf-8?B?L01nZ2NTQXd6S3VId0pCb2R1dXoxanE3ZVlkNWZKWUdjMXJudzBHclk3eWVx?=
 =?utf-8?B?aVZPbkEvVjRUOUNVOTdUNkdJU2FTVmsvc1hDM0k2RUxDQWVqc295aXJ4K0Ju?=
 =?utf-8?B?MmRFN0VlbWRTMFpZSDQyRnNrT0NwUGh0akp5YThLUWJ0RE5oV0FNKzNrR3R4?=
 =?utf-8?B?cVhYMzQ2Ujc0WHAyc256cjFmMXVCa2RWRGdIcndmQ1VFeFBtelZUalNxSWhy?=
 =?utf-8?B?eUJVUVhSYlhaWndyQXpOQlk4cWovK1BHeW5nSGtYenpLMnZFSTBuOGYzYnZa?=
 =?utf-8?B?NHVvS3J6V2QvcXJnMC9LdW9ybXc0bjNrZ2d2RnNPWVJuY1RzakN5ekdERndU?=
 =?utf-8?B?cmYwNUh3Qks3cnFmc0RzbEUzTGVoTXNUQTJ2aDZlNTd3YzM1emU5eW1CNW1k?=
 =?utf-8?B?b1psY094NmIyQmdmMkhQYUY1REZxU0JCYTh2cGhJT1dvNEFBQ25TdUIrK0R3?=
 =?utf-8?B?OGR6VEpRcHhVQ3BUKy9iaithU1N2SlIvYzdzb2NlUGc1amx0OG82S3gxeXVw?=
 =?utf-8?B?bjhRTjJ3TVRuUytMQlpTWENrMzJkYzlWNHYzM2tlSytmbnArYU55NmdhL0FM?=
 =?utf-8?B?T0dVQXRiOEtvaWkvMTh3VEs1OHZPRzRma296Ymw3WFJiMTBmcDVoRzJXVXlu?=
 =?utf-8?B?Y1dBNkJrcWFudXc2Rk1wY3ZOdzBweW9lREJSMDZlQmQ1cDZrU0EvVU5ldjJr?=
 =?utf-8?B?VlNDc282WGE2RWxtVDdvRjg2azJLdUV2U1hWS1ZXcmRvaDFrM1NycE56OXNC?=
 =?utf-8?B?N1lHaENzYW1FMVNNREdqTDVGY1lZaytPUitvOEhsKzhLeU9oOWJZQ3p3NGVX?=
 =?utf-8?B?K3ZyMit0UHRWMjdYUVNzYWNJOEMwV29jWGtjbHZDeU1aYTdaZ3pKSG96aEVn?=
 =?utf-8?B?OVZyeFFHeUpTR3VSTFpwQUo4aTNpY0hIbkFFT1ppZVBoakErMHQ5VFgwRjln?=
 =?utf-8?B?VmZPMkhDOUpOMFVYN2Q5NSs0YnZidGlFM3V4aE14dVp2OWpCMmZZYnhmd1VD?=
 =?utf-8?B?WVFSV0dVSEh6NlI3TGZmVjdLaU1mS25mTE5wVXQzTlZuSWdEUVVEbjQ0RkxB?=
 =?utf-8?Q?/ns/63bQoUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR11MB8102.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3dLc0NVZHFFY3czVm1iZ0kvNDJmNGlaWnlVNkJPaXk1Wjl3d1BvRDFJajFi?=
 =?utf-8?B?eEdja0owSGM3S1JnaE9GM2MrSUpQSVVxTHNZY1BxK1FOa1JpR3FVcS8ySzV3?=
 =?utf-8?B?TFphOXRTV1E2OThFT296MUUzdjhKN3RhYkczdzFsWXFzWDBVYUp5Z1VrYSs0?=
 =?utf-8?B?RzZIYnRDRWgwTzFoTldkQkFTOUY5U2l0eTJHbnoyTUVlN2lrcGc1YlV3SUUv?=
 =?utf-8?B?RmlGcmJVUjVvL2lTOEJ1WStldWZKODIySWljRzNsSVFQR3J6SHA1L1VGajBi?=
 =?utf-8?B?SWIxbnFRUlV4UnkyUEVBY0xleXhJVUdFQjUyK2RwelRNU0Z0eFZKY1g3VDBy?=
 =?utf-8?B?dHo3N00zNmxTckJIbGNxMEtkY0JWd2V1OGh1YnNVdGcyN0t1bElOSkk0aFNQ?=
 =?utf-8?B?N3JkWmNYZ3ppT1FadHVraENaSmZGMkppNXF5ZlRvS1R3VFBmc2xqZUtlMXFO?=
 =?utf-8?B?WFY0QjRUellsL3Vka0R4Tm5YMGtJbVlJaEZBNnlRdXFFT2d3T3ZpcHNnTXRq?=
 =?utf-8?B?QitIa2F6cENQQ0JuR3R2OUFudHZCS0RwUHFseWxUeEJtMXJYVnFhREd4T0d6?=
 =?utf-8?B?SHRSTFlzaGtiS1UrQ3JFZ1Z0bkc0Ry92SStXQ1ppSUVQQndOU1dtNFQ1VUdT?=
 =?utf-8?B?cElHTWFNa3RmeTdSZGVSSGg4MWRndEZMV2M3bk9sQVFsWExYSC8yR21Dallm?=
 =?utf-8?B?SjR0VEIwZWpxVjNpYkQ1UkkxMWR3RUdtU2tHRFZnUVdoTEMxRjcxaEV4RXE4?=
 =?utf-8?B?ZDJkWGhaMktPVFZqMWd1ckJJUGQrRTAyajJESnBHK2wzUWN3WnNjdHFBSnRa?=
 =?utf-8?B?OCtOeUlaeFlSMWdBRnJoazR4OTFkbURSTnJPcVp6SFhuc3pWOUh2anV0TVdN?=
 =?utf-8?B?MzIyTUpvVGVWQ3hVQ0psb25tWFVLVzFTN0E3UlFHVnBrdTFGenA3eWY3UkFD?=
 =?utf-8?B?WlBkUUM1dys5TXBhM1ZuUjZWMGtUaUxGZ1ZzT0hBMzhQNnZ3YkZZL1JJdkVX?=
 =?utf-8?B?Qkl5NjNnMmF6V1VYS1I5ZkxRcit4a2E0dWFlNzhvaTB6ODM5UDMrUEZRYi9z?=
 =?utf-8?B?SS9TOXBMRUxZb09icHNKdzlXeE1QNlc4Z3dkR3RnQ2huVVd2OGxiYXlUbW5C?=
 =?utf-8?B?SVVJUkhicXNKWjVCZ3NCVUdrdUFqOE9acU13bEJjcU1KK0dwN25XWG9SdnZv?=
 =?utf-8?B?VFBtempYall5Tk1ZTUlmV3N2NGYxeFF0ZDI2cUtOZk5TeVFDZ1Q4YmVqWWdx?=
 =?utf-8?B?azNCaW9Sb1YwTE04QW5nZWtqdDdoOW9xSVZra1lQVlpMdVhENjFNZjFYK3U3?=
 =?utf-8?B?NU1TaVRBN094b2hyZzVoREZHaVVzVkRCWkQ2d2Vjd0J0VitRc0gwQ0xzeUc3?=
 =?utf-8?B?a3c5OURkRlJZRUhucFdZMG53TDFKTjZJeFBVdnJQL3ByOUFlQ1VQNDFsTnVh?=
 =?utf-8?B?NkZRU29PalFKQ2lqb0NFNjl2c1hnQWZwbW5EUWMrK3F0Z3F5TXBlaVBCSEdz?=
 =?utf-8?B?NzhDRkF6aUlraGpraWdGZER2cGh1eHROWisyVm1aZ0RLVjB3YTZqaElEd1R6?=
 =?utf-8?B?NlRzMkttT2xwNkRONlp0OUl3WmxCTWdlYnNESkRuYlRJR0RwNVFCSFR3S0M1?=
 =?utf-8?B?RnAxYURYeG5YK1B4SnpqS1JjY1hsOXgvdFY0dUJQTG8xRCtHT3J1YnZ6TDNj?=
 =?utf-8?B?Q1NXekR6aWd2UkFzYmN6dTZESHZzMjlWV2JXWW91OHpiSXpqLzBXVmM3TDNs?=
 =?utf-8?B?WHg2S0VjeTc3VnU2ZXJKb1U4OW1TaTVMYlZ6bjlhNW96R2VNREVoYy9mQTZy?=
 =?utf-8?B?SWFPbENoQWRNNEx6dDh6YzRXRitmbU9XZTJnY0VoSS90a3c5Y1F2ZkVpdDhw?=
 =?utf-8?B?MitnamFyMFp0RmNUSlJJckNHcnBiUHIyR1BiS0RDb1JGNmtwSHJkb1l2UzJw?=
 =?utf-8?B?Uy8wbVRtY0xJTC83czg3djRRMEdEMTZNSlBhUXhEdlBUV01ZaXgvSnA3bGwx?=
 =?utf-8?B?SVZpV0RZbWpaMzZhelNQV2pPTXQwY2srdnV4MndJYUxjazdtRUw1cWI2bmor?=
 =?utf-8?B?T1VZaHVZMGVMT0Q1VVNTbEJoak9HL2c4eFdwNU9INVJxRCtRNnBlbVBCTnFZ?=
 =?utf-8?B?c0tPRWZ4ZW11T0doTzF2TW82dFNKNm5wZ0lVYXRzQlU2MU5jR3czZmVEdU05?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cdef9d-1b90-41a9-78c3-08ddf205964d
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8102.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:06:36.9578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+i0qWNwNZpCCxKW/nrxH331m/rrKLbhWAgm/3pqfCCzEoIlWbU6LiThCZpkpklXqRh8kK5slejNrL5HgfmR5cxquc1D6OBekyhUkRMa7rM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8187
X-OriginatorOrg: intel.com

On 9/12/25 15:06, Niklas Söderlund wrote:
> Fix a -Wmaybe-uninitialized warning by initializing the variable to
> NULL. The warning is bogus and should not happen, but fixing it allows
> running the check on the driver to catch potential future problems.

Code is indeed a bit complicated state machine, now wonders static
analysis was fooled

> 
>    $ make CFLAGS_ravb_main.o=-Wmaybe-uninitialized
> 
>    In function 'ravb_rx_csum_gbeth',
>        inlined from 'ravb_rx_gbeth' at .../linux/drivers/net/ethernet/renesas/ravb_main.c:923:6:

I see that we reference skb before calling the inlined function, so the
problem (false or not) should really be reported there

>    .../linux/drivers/net/ethernet/renesas/ravb_main.c:765:25: error: 'skb' may be used uninitialized [-Werror=maybe-uninitialized]
>      765 |         if (unlikely(skb->len < csum_len))
>          |                      ~~~^~~~~
>    .../linux/include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>          |                                             ^
>    .../linux/drivers/net/ethernet/renesas/ravb_main.c: In function 'ravb_rx_gbeth':
>    .../linux/drivers/net/ethernet/renesas/ravb_main.c:806:25: note: 'skb' was declared here
>      806 |         struct sk_buff *skb;
>          |                         ^~~
>    cc1: all warnings being treated as errors
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

would be great to supply what was the compiler (incl version)

> ---
>   drivers/net/ethernet/renesas/ravb_main.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 94b6fb94f8f1..9d3bd65b85ff 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -802,7 +802,6 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
>   	const struct ravb_hw_info *info = priv->info;
>   	struct net_device_stats *stats;
>   	struct ravb_rx_desc *desc;
> -	struct sk_buff *skb;
>   	int rx_packets = 0;
>   	u8  desc_status;
>   	u16 desc_len;
> @@ -815,6 +814,8 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
>   	stats = &priv->stats[q];
>   
>   	for (i = 0; i < limit; i++, priv->cur_rx[q]++) {
> +		struct sk_buff *skb = NULL;

this does not break the current correctness, (no matter what is the
order of incoming die_dt's (even if broken/"impossible"), and makes it
a little bit easier for the future analysis, thanks to smaller var scope

I have no idea why "maybe null" is better for static analysis than
"maybe uninitialized", but, as this decreases scope of the variable,
this change could be marked as good anyway, so feel free to add my tag:
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>

perhaps compiler could not assume that priv->rx_1st_skb was 0 initially
(assumed it could be a non-zero garbage)

> +
>   		entry = priv->cur_rx[q] % priv->num_rx_ring[q];
>   		desc = &priv->rx_ring[q].desc[entry];
>   		if (rx_packets == budget || desc->die_dt == DT_FEMPTY)


