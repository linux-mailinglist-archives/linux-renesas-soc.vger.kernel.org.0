Return-Path: <linux-renesas-soc+bounces-10876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F79E3053
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 01:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DAD216432D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 00:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979787F9;
	Wed,  4 Dec 2024 00:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQRuEbIJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CB22119;
	Wed,  4 Dec 2024 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733271800; cv=fail; b=UtOR7tT6luwXPDNDnh3rjq8XN8qxDuybMphpRWStSWKE4ci2vO13jG+RKHe10r2O5e93LmRqiWGUoUP0Z13aQ2ynSxmHxhtPU7sLFyybPOtHe+u4NR18Os4XihVggnVUGMc6d9vgE/MT1RLdXONKEz4jyVm4Fb1UdUbEtdwrJQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733271800; c=relaxed/simple;
	bh=rtr1cjnnBtMPyhSFFjhWcga1iMB4Ssrj+wn69yr4+FM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iMiU39kIUpJ6pIaVhOxZY28MB71dIAQ5mJX4gVgCowYkW10cy6nOhRkYfl3RPK4Oz2OILVVf3CAKaC6upN2ghrcqIikH3CU9nHblQfb2f2aWbYqFX/n4brGBnnzf37u3J+Ma9EYBhgOCjXv0YRLXBrfV3V4c9uG2kiNIr+G6FKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQRuEbIJ; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733271798; x=1764807798;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rtr1cjnnBtMPyhSFFjhWcga1iMB4Ssrj+wn69yr4+FM=;
  b=MQRuEbIJuj3iOSvV0MzMEowM0FwMZNq2WAy3VghWuVw3cxPWxvPIiZOh
   0/I+/q7TWrtcbUoe2uT6250tjFOnFifVyHL6jUuk1tFJSud1vvXIMjGab
   gOSNPnraLKxp/g4DNXU77h+L4oWMORZJMcjD1Kr2qq/qLjUfu6FHzOE7T
   suLPzsLQdxdN5MyFazVWDhScAcoHVPAfMgLYBjYV3fSGVKQORbvK4lOhP
   DXGUZ303bmpTFElifFUS1aToNz1LqNVH6QAkB4KdFvnL8NXY/klYZTqdc
   oXNrwteVZWJXK6h9jnxNcVwI9vMpAWRWnss5tjdkLn7B95IW76HhXpQJh
   Q==;
X-CSE-ConnectionGUID: /8efCxGuTFiVWI1tOflV4g==
X-CSE-MsgGUID: FsoCEpLhTRqnWjxq6MkMhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33393990"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="33393990"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 16:23:17 -0800
X-CSE-ConnectionGUID: rk/HY7UtQMmoDkCWS3Bodw==
X-CSE-MsgGUID: 9sIsK8wPRcWYPkeKjDUYqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="94050711"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2024 16:23:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 16:23:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 16:23:17 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 16:23:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptOHTjuqF3O8jUHRzS/ND+J/q6XPOS+unWI442cH7tJS0ljgBu45xtVl0jg3svPuR54uMtvd6pb++Gqud6+y9dgypmlY/wKXLk0VbbO2ntHKB8aq3+cwhorWpUcmFKWdqa3h8z+bm16cFwVrbrNG3b8FFUpsUk3UKxcpRuc++GXqWh0Dl1+eDbZB+4dl6NbkFs6SipOTfJtQZZTfF3tKLMP1GwDN69+zDhxAmjcTsGWrRCi8Jggz1te+U7+uWhuKSLl5MLeMMwGBmrdAE6yD8iXI38AftAXZN+d5x7B5Ue0MzaspS7Od7mQub+z3eFTnnWC61+m44ZMXlc+rF5miyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heq4ammthp2qn0EJud8aU5DikA0gGs2+drG8QjrkPKc=;
 b=gyMFhppoWjgTv3BS1zAeRCteEhDsdrh/Mc7gDjQOBjND0zE+7eIs6DrU9kdyx5D4Vg3OFBYFsy64hBJ6EsQmmljl8fll9ApzQWz7/nXxjkzQGrQipVB5zDkVjArtVUuQeDI7/Fr0kM9Y38+xLoZjECEiU34EAcJY8Mu4BQSp0ayUsthDRavDxvXU96+0MRT83jhe4Dp/7I9R47rTvhTwn8hEcLSFAY7f15yXLhV90Chs4nKtdfi+Jyaaf570Eaiz5xFXtG4XDA4BIOGNPQYxOtBAg1HrAEUNx4GAskeZ7GOAQNb3kulBVPzbksVPwwRoaEabOMOsYTc6UMP9vszCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 00:23:14 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 00:23:14 +0000
Message-ID: <6c02d2b0-1d32-4667-88c8-113165e184c0@intel.com>
Date: Tue, 3 Dec 2024 16:23:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] net: renesas: rswitch: fix leaked pointer on error
 path
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
 <20241202134904.3882317-3-nikita.yoush@cogentembedded.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20241202134904.3882317-3-nikita.yoush@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: ce35f384-1c05-4fe2-0dd3-08dd13f9d7be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEhwMElaeVI4QnNCRmxNZlBLQlg5RXVYdXVsYk5ZTDNHTGd3QkpSWjVWZGY5?=
 =?utf-8?B?UW5xM1VucGNWMUdUcTlZcFJMRGgyUldxZUoxWWd6Q2tydTZUQ2V3V3JqUGJZ?=
 =?utf-8?B?R1QwaExRdExNSUdmZGtVQTJMb00zNUF5clhGOTZIOFArZGFtSlh0OVNzbUZM?=
 =?utf-8?B?S1JDaVdnUVFBZERTK1dMUlBNYWxNNVpsY1ZrSkM3dTFvQWY0bTBJZEMxbWpR?=
 =?utf-8?B?dnE5RGFZMitnL2tacjlSZTlTZWhxMGx2ZnJ5Tm9xTzZzWGxQSFR2dnRoeW9U?=
 =?utf-8?B?ZFBGTmVoU1NqalV6UWgxVTlCYjZKSXVGUi9UWTAyLy9UWHdTM1NPdzlKek5h?=
 =?utf-8?B?UXFCWjIrbXlRaUczUjd1ditKa2E1RkNOVExaeTBMeUxaRzlUWE1MVTFEb2tU?=
 =?utf-8?B?L0poQmZYRkIyNEVSQXdGTlJWVTRvR2V1Si9XWTZEV1hKYjA3WVJ2clBVNGhQ?=
 =?utf-8?B?ZHZuUElVbk9ibUNTdXVDenBRenZxTWpJSEVqM0Q0V2dtVUpUSHd4R2hsUFVl?=
 =?utf-8?B?TnJkQW9rOEthVXlCN0RwR2tZWVdUS20vL3lDbldYNlhzaDkyOS83NUVGS0JN?=
 =?utf-8?B?M3VUd2J6VGhmUkY3VDN5MVladUQyalNJWUwvMGtCNE56SFI5NHNEZjkvMmdZ?=
 =?utf-8?B?ZHBSeWh1cDNtenNISmh4enVSc1VjUEdFMUZsWDhhdy9VNi8zc0tvS2RvbHBa?=
 =?utf-8?B?TjBpNzRTendGMzBSdTY3RDdaS0VmR0phMHJlQlFZanErSzE0ZlE4QktHU2JM?=
 =?utf-8?B?WjM4TkpzTTFYdmtCVmxjQkhQRlh6YUlSNlFMWUxuck1GRWpSL3lVME1NWDJ6?=
 =?utf-8?B?TEJqMnB4em1mK1VseUw0YnluTlA5TFpxTVhDNjNhQUxpcm5EQmN6UEE4NTha?=
 =?utf-8?B?MGdwcXlhTnZzMGhaTUVMWStJODF3K1hZSFl2MHlqUWFRTUtuWWhNQ3RMbWt6?=
 =?utf-8?B?RUU3NGlYQisyYWlWbzJTR0w1WUMxMnlMSHlxREhmWGUxSjN0d3dHNFBHNHly?=
 =?utf-8?B?UGgxcEZFSnFydUdPNFFlUE9kSjNQcWljcGZHN21KV1hYdWdDUWV1VXRJYnJM?=
 =?utf-8?B?ajg2ZnRyb1NLSG9aWGxtMXA0dFFUQ1oybnQ5dENzMElPMXppSTMxcW1IdGg5?=
 =?utf-8?B?NkF6UzFpUk8zbnptRzJ5SklTR0lIUUpuaTc0cWJhMXR5aW90QlpFdW5TcDFV?=
 =?utf-8?B?N3NUMzVJZVMxQjFhVHQ5aVEwY0N1MG83djRObnVEa0dvV0NyalB1K0ZSS055?=
 =?utf-8?B?bEFRMmJQUVZJeXltbzl1MUhqK1NvMmtqSkhBRjFWOGlmQzZNWTBuRVBQZEdn?=
 =?utf-8?B?dTkxaVRUWndBOHlRLzE2bkRtUERFWkZjcDNNdzloN3YxUjFWeXNqaGJJcVpF?=
 =?utf-8?B?cytvTWdET3ZIeERmdVMrRjNiTzQ4SDkrUzk2eXNBMmhnUktMS25SSkhaQk9v?=
 =?utf-8?B?TzI4d2MwUG1leHBpVnpVcXZJN3RRUWVUZEQwZ1k4d2dhNWRWclZwS3RhZGFC?=
 =?utf-8?B?Z2JsejlJL0ZvRFVLZDlYaFpudUthdld1SHp1TUpGKzN0SzZpMzhQSUMwSldK?=
 =?utf-8?B?NUMzRkFnbzdmd001d2p3bWprRDQ4TVBmRjhBSEFrSFdHZWdSZG5yb0RuSi9q?=
 =?utf-8?B?eFA5YVh2L3hHVm5TT0xlQXZMRnpMckRXWWplZnlVTHlQWkVqL1pnZ2s0OGRj?=
 =?utf-8?B?ZkFUY3VrMW9TVS9jcVI3RktlV0NRdzFiYysyYlc4V1N2T3JFaHFZbk1kYnk5?=
 =?utf-8?B?WFRZNWhIdlpLNVR1SjFSdWd4YmN0RXVXd1JSOG1ENkM3VHZ4dXZROW4rczhL?=
 =?utf-8?B?Ykg1MW95WjJRaWcxOHFGUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1RYWmJDYVdrczlySk9JL0ZMTTVoeWhnWkVRQVZhWGV0OVd1bElxUUtwbkh1?=
 =?utf-8?B?d1lPSEd2NmNqUHdNYVdZdnQvU0I3QWI0b1BoYXRmN1RJSXBvbEFyTk5DYTNF?=
 =?utf-8?B?RGVVNmlDb0V0R1lxVWRJdS95bGVCdFByQ3liTEIvT3FRa3dFNjlJbzlCa05z?=
 =?utf-8?B?SVBnMUJyWklnZTE2NE54eHVMSnozc1VZZzcrU0xVRnJpM3l6VGZidUtSSkdy?=
 =?utf-8?B?ZEV2UVVvdjBzNEs5b0pkVHhOR29hNjRoQVVFMFBMMkdyVGl0UFJPNytQRThk?=
 =?utf-8?B?YmgxSkJaR3FyOFY3azNMTW1pS1JuRGo4cXFkZG1lYUh0TTAvOGJJQXBIN0ls?=
 =?utf-8?B?NTcwNTBqRzJzZElQVzdtRWRBL3czYXl0bUVrUUhnNk9ES3YyRFFLUWFtZ0VP?=
 =?utf-8?B?Q2VJTXp3WXFkQnNFZXNWYnpidEh5cGpCUmlDRC9ySldpa211MVJTelBDa0R4?=
 =?utf-8?B?dlFsZmlSN2puTGpmcDlGSUx0M2Z4U2ZXdHBZdnNEOEx2c045T2hvTWMzQmRk?=
 =?utf-8?B?NnZnd1RkMnpDejdmcnBFSCt5Q0ZnWFo4TTdSOWV4ckN5clRaT3NEQXdpTk1q?=
 =?utf-8?B?V0E5aWJrNEpNN3hXTk1rd1Vzc2pZS2tBOGo2Nm1YbmwrWVZSd2ZjdjRzcXda?=
 =?utf-8?B?cE0rZHJ6b2J4TFcxUFhxQTBNSGJianQ2ZXNGY3h1SW5sSDRpZU12eFZIRzZ4?=
 =?utf-8?B?LzFZUllmckREMGtwemRwNzkrMWxFcmZLYkVEajNJdHVTYmN0Nk5Kb3ZUamxh?=
 =?utf-8?B?QXdlTjI2Z1RDMGxOS1Y4bGhJdmhlYm5ZVlVMOUxlNG1sQlM4dlhsMVgySWRG?=
 =?utf-8?B?L1d3S1hsOVpjWmhLL2JQcG5WY1d6UWxFNjg0K2pNNVFGeXY0VE1XQkRxZmda?=
 =?utf-8?B?K1MvZEpGbHJRMjR0ZE1CaUc1aWhZK3hyaHBnTzRIaWFVSDBTZnNRMHZpSGtT?=
 =?utf-8?B?dlducC9uQm9oRHcwVnJVMG1uOTE4NFJUVWlxekJMYTFLc0tBVlZUd1RjbjR3?=
 =?utf-8?B?cG45L0xFT3dyQk1CWmw0WmQ1dHc0TmVFQmlnVTBsV3VuTFd5NTNGUCtsYjU0?=
 =?utf-8?B?TENtTkZXNUp0dFl1bVpmRlhuRzhlZ2NOWWp3aVgwMTYyREt5V21DYS9MK2VL?=
 =?utf-8?B?NnNHWHd1S0pISEhyTVBNWnpNbVFXd0FUYXF2eXVmeERUK3BzTHVvUUFxSlJ2?=
 =?utf-8?B?Z29KZWFRRUQrVFJNSFoydjR4MlVJQ2NJN2ZVWkM1UFVNNDlaeGM5RE4wa0Zv?=
 =?utf-8?B?RWRoL0pTQjhDRzQzanAzc25jb2JFUjFZTHd5T0lwTFlOODNxTDkvMUkxa054?=
 =?utf-8?B?WFpDMkd5aUNlWVlSUk1tcnJwdXA5elFpYURRODVnL3V1T0hCS2h0QVFIV2ZQ?=
 =?utf-8?B?czhTa0N3ZHdoSWl6SVRia2I5b2w3NU9BV2RmY0dFZDhYaGxVS3V0ZDcrbjA2?=
 =?utf-8?B?MTlFcGtBTW5KMlBFUU00aEdYZlAxays1SmFkbnlKQ0t1em56aHVqQm9YelpR?=
 =?utf-8?B?R05kQS9rWDAzekNpbjVnQTV6OUVGdmRCZUo1MHIrbkVlKytPQXRyS3JMajBW?=
 =?utf-8?B?WHYxSU9tOGhKdm41MGt3ang0QnQwbWVRNWFGZWN2S2RGTm0wL3dBOFFFbGtU?=
 =?utf-8?B?OEtQaTJISVZ1NGhoWGZPV3JCL0I4NzZQb1VLeXduZ09wZWZGMzRkajdkSWE5?=
 =?utf-8?B?aGgxL21VVjFBWGg5d1hUU0w5NDF1ckVkR2s5d2toM1RZWWk3YVlWZk1TRnVV?=
 =?utf-8?B?TEQxMCs3b0JzbUN3akdFY3NJNURWWDEwYzJFT3ZNNkRyS2JQWU1hUjh3Q3dP?=
 =?utf-8?B?VmRkemZ6UmZHK2NmQmt2M2htMkRxWlNaNGJkNXpXcDRjbWh0RmpkUTl0YUky?=
 =?utf-8?B?OWJOZWl1RVk3UFFjOGJWWGNxRi9Fd1lZdlJrRkY2WnB6V2RtMEhUd2NObHBO?=
 =?utf-8?B?Q1IzSW5MMHZTTWZTUVdMOWhoMTM2V1llSVgwa2FQMkJRaEJtU3ZsVEMxTXV5?=
 =?utf-8?B?eWZNaFJqUGkwR25tVW82cllxSjRpdmpjVGxqa1ZNVmpGanRHMnh1ck4yRmRv?=
 =?utf-8?B?RHgzRVIrQkJsMm1wRE5yRktRRlhXd2JrNTJzQURwZUsyK1F5bEVaRkZyOTVT?=
 =?utf-8?Q?oF3LVu+1bHBCryVIz7MGIgINb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce35f384-1c05-4fe2-0dd3-08dd13f9d7be
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 00:23:14.5212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiVLUlt20E2bg0+vEObSl0EfzsokI8tJycPIgMITYknEDd1vidky7D7okJBQSRUw3oata9trboQrBcwn8046w6rvJxh8P6IUOJNwvTmau2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
X-OriginatorOrg: intel.com



On 12/2/2024 5:49 AM, Nikita Yushchenko wrote:
> If error path is taken while filling descriptor for a frame, skb
> pointer is left in the entry. Later, on the ring entry reuse, the
> same entry could be used as a part of a multi-descriptor frame,
> and skb for that new frame could be stored in a different entry.
> 
> Then, the stale pointer will reach the completion routine, and passed
> to the release operation.
> 
> Fix that by clearing the saved skb pointer at the error path.
> 
> Fixes: d2c96b9d5f83 ("net: rswitch: Add jumbo frames handling for TX")
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 32b32aa7e01f..3ad5858d3cdd 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1703,6 +1703,7 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
>  	return ret;
>  
>  err_unmap:
> +	gq->skbs[(gq->cur + nr_desc - 1) % gq->ring_size] = NULL;
>  	dma_unmap_single(ndev->dev.parent, dma_addr_orig, skb->len, DMA_TO_DEVICE);
>  

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

>  err_kfree:


