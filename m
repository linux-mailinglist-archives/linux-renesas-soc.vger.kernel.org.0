Return-Path: <linux-renesas-soc+bounces-23176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF22BE5054
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FD2E19C5596
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 18:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0540221FB4;
	Thu, 16 Oct 2025 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmQEqD/g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF9821D3EC;
	Thu, 16 Oct 2025 18:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760638638; cv=fail; b=sdXvaeZqkHSRrS8tdQd16AUFvVn3Q26XlzT8+t3X599XuE7N/Y8pmRz27KzTLiozv8EJrg6UJUtYdGoUnutB++Z5whcEM4sirPH31VknbAMpAMVcRTcTHWzp9aHhIVNrZhBH021DLsWX/bg3Jpvv0oU80E1hxtY0ZqRep3+mtbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760638638; c=relaxed/simple;
	bh=m0acabNsJH+7e+anMp8l762RxhVxrVHlsaClaYKFLYg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rBFmpZLPaw8tnI/f/cVhJh8ukLt1yeQW82F/A5777XclByXPnNm898AV8EDIe9Nb3HcA7hdeh9svDCJ/jX/CGQmv5T0bR7vRxTFrGy2XFOSroTqoUpSDBhLe7phPVkRrs0ZAOWba9GX9PFDXwe5yvDO8dAU/8ReXTe3MrxaO2kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmQEqD/g; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760638637; x=1792174637;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=m0acabNsJH+7e+anMp8l762RxhVxrVHlsaClaYKFLYg=;
  b=nmQEqD/gBQi/Hs3mvqCy/hNiE+p68aGUNwafpFfubGyu2r1Xkx4IJQAE
   PDWUbS4YD1dMjztKGXvggQMUmqdPJCBcIFtYZEIISDzy3jUpuMqUorscF
   5BVHdeIt/AP6sgyqRpq13comtKgKfRJoZjvFlvHNMN4Eodo7DFBZKF203
   gIXgQtZN6dhqzqXsM4DgizvBhKOAi+d+2+UiPFQPMVuVIek5xxeuhnMBY
   zIGhl61i71P+0nTBWcnzW9nbHcPqGdMrTcy0DHakez6cY+gMRX6jqCNO8
   tv8G7/ua3sVl4qvhk/Gbm2eABrl+GRfeK+cf14nm8F5eRioCesIYvNx2x
   A==;
X-CSE-ConnectionGUID: hpueT+rwS/6vO3EgEWJMIw==
X-CSE-MsgGUID: wNposuFwSeaHKwaCF34W2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62937767"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="62937767"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:17:16 -0700
X-CSE-ConnectionGUID: I/bg3AjnRsCwB01U5iQ3eg==
X-CSE-MsgGUID: luWPjuoBTYSwkutyu9c6ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="182321112"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:17:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:17:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:17:14 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOfLqlhSaSsFuXKqOu8ut8DafiYN/jvjW5WRq+WPDnjNLGE/vJgqcgAVzyoDdu1Du33SYc1HwITrHj+Bt1fLm3GiU1CPGA4aa9BpOFJ5FxugW3sq51jILxx87GqBmZXd2kZJJiVwVu7qxklY55ohM5HMY2Aa00v1ruRtjNmVELN91sqW2+UAulyQIKKBN1/xb3X1I2uqtq8lX84DBO3EdNFTCIa4QRaTLcb75FkDKYQ1AscIXIXg3K4jm7pRfEpUtOcToaIy6Nm125nVZJQdwd+aSp3jquenjpiwWRtFi46nh05WaD6EiyRwR1VDhjPuvZjy+1w3S2iumtdq0bChEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0acabNsJH+7e+anMp8l762RxhVxrVHlsaClaYKFLYg=;
 b=qON1Iuh6f86TDxh++IoZ6zXdSLB/es90IeWUaz553KgBDNEsD/Hpk9cTSUtfjSE7NToC1mqOU+VZsMa+PKYYPGJS8sF8YaCnghCvaLvuE6FD3FO4gM2TbgupxV5v+B07x+90IIyvhqZMhkksmhUw8lUobEyRCYgaORoyq3Qfb9duLmegEYhIexEeu8J031i9OPIKWFac03ecb8I4jWD16GFQa5iGAfAVusJfHT1Dy8oOmEq/G9mSXeoPe+LKCtYBajzd3POysab6ktohB/Sgv2BM3HFaYXo9i91FvsCK+H3K29ckUDr9E0x0sdhYduGN9KnG3I2uHPFDqnvY++Juuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 18:17:10 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 18:17:10 +0000
Message-ID: <05940789-1d44-4786-83fd-2b254937aadc@intel.com>
Date: Thu, 16 Oct 2025 11:17:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/6] ionic: convert to ndo_hwtstamp API
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>, Jian Shen
	<shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Jijie Shao
	<shaojijie@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sunil Goutham
	<sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, "Subbaraya
 Sundeep" <sbhatta@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>,
	"Tariq Toukan" <tariqt@nvidia.com>, Brett Creeley <brett.creeley@amd.com>,
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Paul
 Barker" <paul@pbarker.dev>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>
CC: <linux-renesas-soc@vger.kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>, "Vladimir
 Oltean" <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
	<netdev@vger.kernel.org>
References: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
 <20251016180727.3511399-4-vadim.fedorenko@linux.dev>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
Autocrypt: addr=jacob.e.keller@intel.com; keydata=
 xjMEaFx9ShYJKwYBBAHaRw8BAQdAE+TQsi9s60VNWijGeBIKU6hsXLwMt/JY9ni1wnsVd7nN
 J0phY29iIEtlbGxlciA8amFjb2IuZS5rZWxsZXJAaW50ZWwuY29tPsKTBBMWCgA7FiEEIEBU
 qdczkFYq7EMeapZdPm8PKOgFAmhcfUoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AA
 CgkQapZdPm8PKOiZAAEA4UV0uM2PhFAw+tlK81gP+fgRqBVYlhmMyroXadv0lH4BAIf4jLxI
 UPEL4+zzp4ekaw8IyFz+mRMUBaS2l+cpoBUBzjgEaFx9ShIKKwYBBAGXVQEFAQEHQF386lYe
 MPZBiQHGXwjbBWS5OMBems5rgajcBMKc4W4aAwEIB8J4BBgWCgAgFiEEIEBUqdczkFYq7EMe
 apZdPm8PKOgFAmhcfUoCGwwACgkQapZdPm8PKOjbUQD+MsPBANqBUiNt+7w0dC73R6UcQzbg
 cFx4Yvms6cJjeD4BAKf193xbq7W3T7r9BdfTw6HRFYDiHXgkyoc/2Q4/T+8H
In-Reply-To: <20251016180727.3511399-4-vadim.fedorenko@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------3Q9L0M8RaVJJu0K87aiyLJBq"
X-ClientProxiedBy: MW4P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::33) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|DS4PPF07B018B9F:EE_
X-MS-Office365-Filtering-Correlation-Id: 27022881-bed8-450a-b1b3-08de0ce0392a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVVOeVZseDJ1MW1HUmdRYitGcHlGU2VKajhFNG5KdmhscWZ5ejA4eGhCS001?=
 =?utf-8?B?Y1ExRzEwSzRGVWpIOEcxeWw1ZWEzQXkwZlFzOUE4WjJsek4yaGhnSmJvUWJL?=
 =?utf-8?B?cGRzN0RnOVNjTzNMVWpGWTdvcnB0cThIYjhyV1FMcmRWQ2ZVRzhBUEg1ZHpl?=
 =?utf-8?B?ZE9MRjBybjVDbGVhUVpUb3VmNkJ5ODJualFRUG52SFE4U2IwanZ5MzZ0M0hD?=
 =?utf-8?B?ejJrOTNOU0c1OFl4bExrY0VuNUo1TWNHYUlwYWgya0VpVlY3NjVXYjBwd3NO?=
 =?utf-8?B?L1BHdStldDdycStiSlJvaDNDM0g4Tk9GOGhXRU5lVWpFR0U1dzlyM2hGOUZy?=
 =?utf-8?B?VUtVbkZDYWVWVXlMSjdiU20ydzZaei8zTERheXB6WVMwTVJZS05ianQvRXE3?=
 =?utf-8?B?OFFKZHA4RzBJL0VCZEQrN08rWWtpZlVTVWFibTdPc1cyb3JrdXllSVM4MUVs?=
 =?utf-8?B?TTFUZ0tKUnZteTI2QmFNK0RTODNyVDJPMVZtUlhQRUNhZ0ZkdGtLQnlqS1Fp?=
 =?utf-8?B?eHpyYXNQUS9LTjhVejBUb09VWU5ESVdPbWY4ak9LNDd1MURkanFZQmpvbFc3?=
 =?utf-8?B?Q3pnRkZCc3BiUmtiWFZpaHV0K1lnaHRzSklhVlUyQ29QNjNxOWEvc011ckJy?=
 =?utf-8?B?VS9DdWcwQzhCN25WZUQ4ejYxQkxURmVJcWlxQjdGR1ZPUmtpOElBSGhxbmND?=
 =?utf-8?B?L0N4VkZ2MlZueG93Q0hIR0wySHQ2a2lrUlNFUExOVXRLVnVFT1dKU2puUGxM?=
 =?utf-8?B?ZkdwZTVKNWptQ1ZEZFhEWFJ0MEhlUDZiUFAya2VhUHM4MUUwckN3aW5Tcis2?=
 =?utf-8?B?cllmVlg1TEZNbVFmbEQxcnlvYzhqT2NIYldwbk5Lb1prcThubEVFY2lmYS9i?=
 =?utf-8?B?NXJqMVBvZ3phbDJqWjJ6cVAxU1gyQStldzc2NEVLcG1uU1dxL2ROZHhmTTBF?=
 =?utf-8?B?QldSSmh5akh5WHpZVW9MaEZiVVpoN2xXZkpvM2JSMFg1TmE0a3BpY095dlFL?=
 =?utf-8?B?VnVzK2w5cVNRSHlJM3dmOStRTWh4RDc2YlRZUXRna09DZVJHaDlkT2VOMUJL?=
 =?utf-8?B?aE9LNURqL3NwMzRBUzZ5NjhoalVHeTlueGZsTGJ4NnNQNFcveGhIL01Tc3FD?=
 =?utf-8?B?Zkd2cWljUFZ3dVRORFY5N0FSOE1Ld3NKSWxBeXowN2JBQWI4STFsU1dRb2da?=
 =?utf-8?B?UkpPLzVabFR4cTNIZDVwN3hJS1BLL2Z1cE5wMmhjeFhwck1oZ3pKUFhaUXFL?=
 =?utf-8?B?YTFudnN4eWpvUWpyWW5mRnNUSDMrOWxQUEp3UVE3Tm9UcC9GRVlPcXdDb010?=
 =?utf-8?B?Q3Q4R3BKRjFkbXpXNmg0eTBXK1ZuSG1rdzhNSXhvWnpCMFptNERLODY4Z2dh?=
 =?utf-8?B?UWVvMjBWekxEOUROd1hON3hJS0N4dGhzckJGVEVPYktRbEJtVW9lYXF5M0t1?=
 =?utf-8?B?dDFja0xHY3ZvSWRuNGxiMUtDbFpUNWZDTWZ3YUtnWVFHSmRXT09aWHE0ZVBu?=
 =?utf-8?B?ZXBaVlozOEw4QjQ5Z2RDWDk2SFJMTDhjbHk5Y1RHUVZOdzN4SDFxaFFWbTgy?=
 =?utf-8?B?aW9kQzFLLzIxY0RQdVNncWNERjllQjRaczdRaWwzbW1mQ0ZtRlBhZWNuQnlY?=
 =?utf-8?B?aGtCRkZRdkY1dlJLMEs2c1VHNnVzZFdOUVBBeW5FbmpxNGdYanpFeFBjcTRy?=
 =?utf-8?B?L2ZHMU45dUJTaXFpdXppZys2NUgxeFg0cnp3OXRmaGduWnZ3S2o3VFhTU0do?=
 =?utf-8?B?eGIxdG4yeDQ5a2JZSXVTYTk0MG9VNE1ndW1GVU1BNlYwRVNkbjJsUnoxVnpY?=
 =?utf-8?B?NkZ5NHowZ0RLcFRZNEtBL2Ird2lpY3h3Q0VodUN4ayt3V2xqZkI1Y0owUU5i?=
 =?utf-8?B?TjlkNGhSRGtTbGdpc3JIWm5mUU13ZGV1d3ZZcjg5YTJTdExIRHlPR2FTZGJ5?=
 =?utf-8?B?VWRNdnNVTFlYTkJjbi9IeDVJMUN6MXV6QlRFOVluZUFsdGxjdGN5S2hmOS85?=
 =?utf-8?Q?DIlT8mKM3XDxCgNZLqo8ZH/4r0bM3A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUhYaHFPcldvSGw2NWQ4dUlMVy94cjFyYkJqRE9WVGNWRXF2R3RYSWdNdzJ1?=
 =?utf-8?B?cnk3L2pUYmg2akNONmx4RWFsazhiRG45NzJvV0dsNGNsVE4rY0JLVUdEWE14?=
 =?utf-8?B?S3lpeitoUllvT3FZaXZPZ08zT0NOcnpUenVrbjMyMlBaZHdnaXlFaW1Ld3Ir?=
 =?utf-8?B?MFNmSDRkMWRwU1Z5QTYrYnM1akFqQUZKYmRUSis3VDE5NkVPRUp5M2ZZZWlv?=
 =?utf-8?B?WmRvek9lZDRsZDZzSzVvcnEwZHJLdmY4ditySUdzQjJsd1BzSGNzYXJOeGdX?=
 =?utf-8?B?Q1pjM1hRZTJrRCswTjlMTmFkWHJzL3UyNlI2eTFLVEtwR2Z3aERXeko1dWE4?=
 =?utf-8?B?NDI0NFk1Wm1GQ1BheHVtRTRoMnJhQUViSjJQSW5UQ2JnTTh3MExhOENJc0tD?=
 =?utf-8?B?ZThuUTRiRkpUTWMyZHJPb1JaRXgvcW5aWk1LSGhZay9JekZZVUJSaGU2UjlL?=
 =?utf-8?B?dUVHR2NoWVU2QzhsVjdDNllqUjBQNmNVN21nazJlYjNYVWxpY2dwZXNxWG13?=
 =?utf-8?B?RmhrYm92RkN3UzJnRDdaYmswSTlLNmNtelBOOThZWFIzRVA0UW81VVlRdG9u?=
 =?utf-8?B?MXpQTWNmL3BXbWpqM2QvaExBbDlJMmlVZ1UwWm55RVNLVU1NOWxWUFlCdUZq?=
 =?utf-8?B?NzN4MnNHUDBjRFExM0hXRXlWRE1RRTY0R0c4Ry82SHJtbE9PWStCaFVub0hJ?=
 =?utf-8?B?VXdFU2hORUhwRkxTY0p1bEJrWWNDK0xwSXczTENjdW90ZlFXR1gyVTl1TXZp?=
 =?utf-8?B?WHJiaHdtYTJRU2RVZnBveUNxRUZSbTlvOHZ6OU0wWWMwQ0NtZ1RHcGpaZkxs?=
 =?utf-8?B?b0tEWkRMWnplMjdnK1pQM2pjZWlIY3RBb2JSVWdCRHdqS1dqNzlpWk1qTWx4?=
 =?utf-8?B?a3RtY2xMYnVYUjVBU0sxL1JESEo2SUVTWjRnY3NoWUhQNDZPYmZoZDVweExR?=
 =?utf-8?B?ZWlwcmJuOGNueVl0VVJjVGFZc2hLbTJxZVJzK0JCSThTbzNCUDNjUXdyMHFY?=
 =?utf-8?B?ZkRjUjB2dzBTWXZMekswR3FzdlNRbVcyR1VTK2ZJTjVMMW53SCtuUyswbHBk?=
 =?utf-8?B?ZzNpTnc5V1NxTTRaZW1EbzRvS1h6Q3JnaFZ3N2NFZ2xmczZ5QWlmSXYxMktI?=
 =?utf-8?B?NmRnVVd1Yk45eXdPWDJ0akt4ZVhFRFE1YlVPN3B4UnV6MGR1cUlwaXpCYkpV?=
 =?utf-8?B?a2VhU1I1d0NpSWliRkNYcHh3MTlZNE1EZC9waDdMK3NpVWxpT0NqK1lLc3Zo?=
 =?utf-8?B?akoyb3k0cVRQbnYvRDdYR0l0REIvMmRrcndjeGEycVhhVERhVHNRYWFQZnhN?=
 =?utf-8?B?WmlRSEZINXQ0aXAwQ0Q3T1E1UVNRS2Jucit0YkFDajRVNXB4S1kyS0JqeFM2?=
 =?utf-8?B?NGdndEdrNzFaVzhDbjJrOXJSY3pvRlQvY0pHUEZxWjN5QXBSRnVJeUZScDVS?=
 =?utf-8?B?WndSZnlhK0NIL0xERmJRRXlBSWxaOXpZZ2IxQzBkcnJMUmRUaUN4TTMvOUo4?=
 =?utf-8?B?R2hxYlBWdEJsMTZDTzhqQTVjYm1DVllyR3RETElQczNTMHRWOU5CQUxEL1k3?=
 =?utf-8?B?NFpoVmlBUTNOUldUbjJ5dDNyNmxaT1dSS1BuUERXMGk5TnR5a0NES2dzdU5Z?=
 =?utf-8?B?T1pKc2FRVm1Ca0RUbldOR0IvSVBYZEdjOFlhc3VxZWMzblJZb3VXS1pCUGph?=
 =?utf-8?B?MUd2SGprc1hqNStTWGZ0Rmd2VFViaFJFbmZwRzc4RUpydDdLb2dKV1VsYWJr?=
 =?utf-8?B?aUFFN2FkTGVHTjVKZ3NKbXZPVzVyU1ljOTAyUWRjU3p2OG5TK1FkbjJBNUtS?=
 =?utf-8?B?QzlnKzhFRnF5aVp2VVgxTzNUNjRvaFQ1alhkQTVuOVIvbHY4c0lFUlIyOE5z?=
 =?utf-8?B?V0xmUHV0Ukc0dTZaeVZaMGNhUVYzdG4zYkRaTUZPRHQvQ2NFbkorUmFhQnlK?=
 =?utf-8?B?RVFQR1Zma3VPMjBzbG5lb2huaTBpWGlIOHFISHJOQVErVHQwRXBLTGZzV0li?=
 =?utf-8?B?dUZRVTJJSjM0eGtLb2Z5aHFHVWc1TXFmd3htaDkvTFpVVjZ3NkhBNmZtVEE5?=
 =?utf-8?B?Sm04c21WOTRtZW5GODJkc1lveVpVUWlLem1xQ3k2ODNyRHQ2b1d0bXZiK0p3?=
 =?utf-8?B?ZWZ0Y294cjhiZHcvcmZua29qWXQ3cGRYcXcrTXc0bXhKN1B4Y0VybTAwU0Y1?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27022881-bed8-450a-b1b3-08de0ce0392a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:17:10.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXpWwoldwXhHiw7uZNEa7FRJGAOFEUwleKS7hsCxODmXMRFHzIuY/1cLBDkeY0dyQhar1Lwa3Id1lh+kPBY7LDGPlDOWhrrn/FMGU5icfQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF07B018B9F
X-OriginatorOrg: intel.com

--------------3Q9L0M8RaVJJu0K87aiyLJBq
Content-Type: multipart/mixed; boundary="------------AqaQXljjqFDpO3PqlA7oTicl";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Jijie Shao <shaojijie@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Tariq Toukan <tariqt@nvidia.com>,
 Brett Creeley <brett.creeley@amd.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org
Message-ID: <05940789-1d44-4786-83fd-2b254937aadc@intel.com>
Subject: Re: [PATCH net-next 3/6] ionic: convert to ndo_hwtstamp API
References: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
 <20251016180727.3511399-4-vadim.fedorenko@linux.dev>
In-Reply-To: <20251016180727.3511399-4-vadim.fedorenko@linux.dev>

--------------AqaQXljjqFDpO3PqlA7oTicl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/16/2025 11:07 AM, Vadim Fedorenko wrote:
> Convert driver to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks=
=2E
> ionic_eth_ioctl() becomes empty, remove it.
>=20
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

--------------AqaQXljjqFDpO3PqlA7oTicl--

--------------3Q9L0M8RaVJJu0K87aiyLJBq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaPE2pQUDAAAAAAAKCRBqll0+bw8o6JAU
AP0ccBfBV1XDWvgwidX+LQK6gb3TB+jd+/mcQ41ugXN4JQEA7yxUde1abaI7CCyyhgW5zKwq8NyD
coU1zpgL1bhcvQc=
=5M5o
-----END PGP SIGNATURE-----

--------------3Q9L0M8RaVJJu0K87aiyLJBq--

