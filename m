Return-Path: <linux-renesas-soc+bounces-23178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBC9BE5060
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA0819C5CBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 18:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF134223DD1;
	Thu, 16 Oct 2025 18:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lemcgsFE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D762236F2;
	Thu, 16 Oct 2025 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760638674; cv=fail; b=DOg1x/Cl+hvm4NXNODmT2JEySwKPcsApCIfhnCenjFfmvvxQ90mENoEwukbaZdezuMVuEtHcneTEfbntX+5OZ8Z93ITutHXHVTvaKBiw0O4QQjiZxJtcKq6FbrB1ugidChyC8elnQkf04DCE8W2gazAFbj6jHVHcelX7WMQiSrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760638674; c=relaxed/simple;
	bh=SLEaYA4DLqoIkyN6Ori563NsGAqJhg2VTzThCUseOzo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YzfLzoJAo5nxyhKbxX0QyQQ+lDHBfKVBaf6VHxqle4lvGTL1EuLV2IqEm3Z+FZG0hqQFV5CyMXdXhyP6v/R2jsIkA2UyqfJGDpYM8BQwBXy/kklzahg3PjKK8jG+mROIs3eEutOV5pSvXZvkj4Y9kR5aV14lR3z+tE3rETttcq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lemcgsFE; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760638673; x=1792174673;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=SLEaYA4DLqoIkyN6Ori563NsGAqJhg2VTzThCUseOzo=;
  b=lemcgsFEKJFrAvJDY8/Uu/KhGD/zUCwgV5jM5hRsIvEwdUvTk7o/hV6k
   ZN+y+Er+tLbD6+g4E7Pcx8Yqa7O5wRYo8KdhbE9MoDFPoQosLYTDpAydA
   E0yMFEG3a7xp1EYUPouAZ4DrqRDgg61CqjDv9vqRZDWrIiwi+wFJPpo8H
   iA3AdC9hws323Xm65vnRaysweicH5e97SmDtM93xWulygjJv545JG3/Ai
   unRUfZafCaLvbTNNaLg21VPbHx9YUzIg7Plgq1WIqj0PHVo9ZxfexIexu
   NKUZeHRuvBFgqkxLyGh6ueD3TD7onVH40fhVfpYovL2NZi2UsKw+7Naf5
   A==;
X-CSE-ConnectionGUID: 2GUrH4bcS2qkEcPNYS4ydw==
X-CSE-MsgGUID: 29w7rynSRe+VkgUIp3pV7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73959178"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="73959178"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:17:53 -0700
X-CSE-ConnectionGUID: UzdmTjXKSgu/9+KvahKDiw==
X-CSE-MsgGUID: CCfMiiOiRD2GIuxO2FChiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="219681266"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:17:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:17:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:17:51 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:17:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8t7I8of6RW/VIoWh3WNhNbUL0FjcxjhwNyg2q3OxZyBN0PHjLQZ+uk88DdHeVLujucbsc4Iunsv2hq/AJ0nwtRPjCCq3QNhqD6+oHxhtfRbevQ3wHWHz4+YSum2VtjU1zb4vqBiX4GO+MZdYT8Uf8QBVLD491bJyRceqTtbPZwb44q1btTAtOFOrgtGQk766MRHnJ3y29uSk4dYrm+Be21iLvk3gdr4UwEd2gmsg3E07o0Y5RdGPqrvunhgy8UBRIX+qcrkFvI+NmqgxC0asPfw5mZf4rP+TzQp94iRTdEsf6VN6HajHXutouETmNxGS38fIzK7++GkYVjdcKDFRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLEaYA4DLqoIkyN6Ori563NsGAqJhg2VTzThCUseOzo=;
 b=OC88IgKQEdVHXAPmrObPs+iZ3hasOaw5oloAbFl6++Ih/r4gjHW/IFiP1gkLrEHnVCChYNBISMlyOuMpB4Wxxb2G99TS8xDS8G4joTQXNH2c4uBCjUVbEnXgb3hqr8EqygGFUjdGrWgjwnFLXE88+5ouBDFbxCH7+vj20NNdugrRVKtENkvLn2IiDZSa+VS5dC8c4Hy7EsLhKs6r4WgKsOrZwov3WSttgDX8Klbq64cBiLdJplZo8N9lPw2ssvjl1uwhIUvjsaBN+5DQyyLcMO1hzqxg5djVwjHKDlQaSnP3I989PIP4rv4YVz0i3K5c7OS31XN6kMQerBrgKnEuPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 18:17:48 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 18:17:47 +0000
Message-ID: <17bec9e2-5ef6-4c27-8fb2-032e10552235@intel.com>
Date: Thu, 16 Oct 2025 11:17:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/6] net: ravb: convert to ndo_hwtstamp API
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
 <20251016180727.3511399-5-vadim.fedorenko@linux.dev>
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
In-Reply-To: <20251016180727.3511399-5-vadim.fedorenko@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------BwvvfEV5x1RebeQ6rRvPfot0"
X-ClientProxiedBy: MW4P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::18) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|IA1PR11MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: fe302044-4b17-4073-fb9d-08de0ce04f64
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGpISmYveE5zTFFGQ2prcHYvcHZzSzlJRDFpeXFjckJvTDFBSlZtVW9zdHA1?=
 =?utf-8?B?RDd2VmhRdHFtQUNNdmp5bVJaQUhvUzRNVm1MOFFYejJ1VnVFZ2x1SFBGako5?=
 =?utf-8?B?UVF0YUZvQ3lpZThFSC9oUjgyeFBXVUVEd1ZidkIrdEE0Q2xBR25JZ21DVzVU?=
 =?utf-8?B?YTM4WGdGZ3M2V2ZUV2ZKRHFCZVVKZDhwZlphWCtZeTBsa2FLUWUvZW44V0wz?=
 =?utf-8?B?bjdKTFp1M21TV3hKeVkra1RFTExPb1FDOWxGMjN4ZFlBM2lsWWVBbzVSbzk3?=
 =?utf-8?B?cWtKTjlBVXpTczNmOG82SExEVE93TndsNXpUZ2JTelBWRk42czBJNW5uRlg3?=
 =?utf-8?B?TmI5YTBWeUR3Q3JSbmZNYVQraUorakx1Y1k3R3dzUDZwTmQ0SE9QSjBoQ2pv?=
 =?utf-8?B?T0U1YXcvTFNjMTgraUQ0ZkpDeHlnV003NW5CWTM5OEJPRnhFVlJ6Y1VZOHRN?=
 =?utf-8?B?bTZLRHVYOXVVaW9Ya1ZheUJMd3pEYTJ2V0JRV0ZmT3I3MXFQU29lalBWbjE4?=
 =?utf-8?B?dzJjM0J4UTlRemRUQ09POGdEVmJ5Qzd1Tnk4M3ZyczNMZGhDcW94MlFlNkpG?=
 =?utf-8?B?SUJ5OE5WdVcycTJ3dmVsQm05UUdIZFRSRFVnS1hwWG8za0kxUmZZb0JLMzJY?=
 =?utf-8?B?eEErTG5XUEVxLzRCQXUrcDBDVDMwR3A2MkRCYmduWXJrWXlKeW8rMHNVMk10?=
 =?utf-8?B?bTdCbThHQXp5ZW1sWXZsTTFtWkRsVm5tays5WC9LNWVZQ0YzM2F4SDBjemNt?=
 =?utf-8?B?T1RiN2xvK2taWFgzaSt2UzluUllMbDNuVkRKNzFhRG5kMU5CRkFsY0s1WlpY?=
 =?utf-8?B?dEFIZWJvejd4VTB2SXRiTHhQMXRSM0NIOGg3MjBDOEpobkxFYmU5OXhRcUdP?=
 =?utf-8?B?OUNhUGp6R1lXblV4VVB2dC9IelJ5Sll1aEFMWTgrRGpvK2hSYllONE5MTGdP?=
 =?utf-8?B?bC9JOEl0MmxZQTAwMVNldkEvNzhmK0QrREhxaE5hN2dVd3dhS0ZpQU50UElH?=
 =?utf-8?B?ZUVxV2hKMzNRMlJsTTVydktzbHhrL2p1ejNzV2hqekVDSHFwR0toYlZuaGY2?=
 =?utf-8?B?OUlURGNUWmVNRmdSRmxXSlRrNjRzUE8wdUVPQTJkKy9VbGdmQnpXNEVidUtZ?=
 =?utf-8?B?dm56cFJQNkt3TlYwQ3JWRDhUZDNLVVAvWnBGVm9HQ25mWk9pVEJOK0NPcGx0?=
 =?utf-8?B?OEZXQmQ5cGJNc1JjYlVTTzRNa1FMQU1zNm9kTlFJa3RjWWFhd0NBcXhIVFFH?=
 =?utf-8?B?WnlMT1l0cCs4eE1aRjJoY25XQ1ovZitEbTV3Zy8xQkZiOGt1a0FwMmJLdllB?=
 =?utf-8?B?eDFZWDhKR0lpZ0ZsUGU3clBPTllCUyt4RkpUdi83VEttTGo3WnlZWjNoTWN2?=
 =?utf-8?B?VDVEMWpvNnQ0K1dTU0s4cUlReTgxa01VNU9XcUlWbEFGemdML3pzMGhtYmV0?=
 =?utf-8?B?TVN5OVdmN1AyV3BmZ25BK0FtVHltNkowSEV5ZUdubjVINGlweUNjaDUyVDJh?=
 =?utf-8?B?U1NhZ1drVHZ3eXRSWlFDcTN0dVFOcmx5S3hLOFJCckx4Y3BMNWxmSWNOanFu?=
 =?utf-8?B?ZUJsZWN2M2w1QWM2MkFMRUpxUVVqdUFGaE9BMk4yOVdSakNsODFOQW1VTDRa?=
 =?utf-8?B?RE8zeUdxekM3bHNmZnN1SitFRzNrL00zMFRtSWc3MTJuQ2tOa3psa21KenU0?=
 =?utf-8?B?MWVNTGVidkgyNktmWk5uT0pRQVdjci9ZVC9SZWQvNzNZQ1dOOGVmMUxOSEM2?=
 =?utf-8?B?N0RMZ3h3c3cwNENTQ1I4bVV5enh1SHhpZ3BnaDdjT00yYXVNN0lDNVF3d0lq?=
 =?utf-8?B?VE1pSXBXY05obFRQRW4rMXZXY1N1ZWxPdXZ6TkZtamowWnBGbDVrUGtMalQw?=
 =?utf-8?B?VURjb0VVVEI0SEZ2eERpdWZ0ZDJmb1pGeDY1aU9CcWhiN1hoMmlYRWxTdUlo?=
 =?utf-8?B?T0pLZDBOd1pPSmR3Zm02M1RnelpBbWdYaFRvUHB4SVNvMWZ6cE5HSFpyTFpC?=
 =?utf-8?Q?Gozq+RnMfwiWGO9XrEMIvmbdfQ6I6w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmF6YkZRMlFMUU9EZ2x3VlpRanV4MHRZY0h3OU5MaWxIellsVGtFbzRaczll?=
 =?utf-8?B?RjkyYzFhME5qZnp5Q3ZlZWhpWm9xMXhsV2ZxYmhMdUwrSFY0Y1JCdEtIYk1M?=
 =?utf-8?B?eGZVUEJzaXFHMzYzWmc0Yk5vbmtjcC9pelNvcy8xN0JaZm5udHJpOGlvUG5X?=
 =?utf-8?B?NGhaZmppczRVWWdxY2xWSkl3S25idnBMUFRZeGh1bE5MWHNDc2I5cWtqTTVz?=
 =?utf-8?B?RkZDdWdObmNCamc5RUFHck1WdTdqSHltbjRIeFdPOHJUaS9VaklUNWVlbXFL?=
 =?utf-8?B?UnJUb3htbm5tbTJJT2dPUG1jL0hnNW82cStSL1FmNU5pMkoyazlmVVB0SXJ0?=
 =?utf-8?B?a0w1bkg5R3U5WS8xYU1teGl3RGVnYkdpYkQ5Y1hVRzRkS2R2Z1AzZ0dPZ1FN?=
 =?utf-8?B?Y3R6U2NBWFdXZ0xYaVAvMy9MKzRDK25oeVloMlppRlBaWGhrRVNXZG9aZklM?=
 =?utf-8?B?Zy9vUWtTNjdMaEo3VmwxczRnR1dLNmpxemtZS2RTQ1RtMXY4WFA4TERlQjh5?=
 =?utf-8?B?QUVCYkRMOFlTMjY1RkU2VEM0Y2k1UUZDbS8vT1RheE84UURYSnp6QUk5WU5o?=
 =?utf-8?B?RUV5eGJuTUEreGRORDdRUXNQUkFtSU4vVitBMlBObytvWmNZaVljdUZ2bmZI?=
 =?utf-8?B?ZDlTMzErdkRmdnJNb3BnWU14Q1VUK25FencxUzYwTnVubE5aaEh0L2xBVHdJ?=
 =?utf-8?B?QVNjcGRRcThUUlJtengrQnIvRGRPSUdWdVJub0YxcHNGb2F3MHV5VlZvOThj?=
 =?utf-8?B?M1ZkWUlnQ0dLM3dRVTN3YTZ5NitmcHUyM0oxa2w4RnpyUnNqTnBHck1XY1lj?=
 =?utf-8?B?bU8vK2dUejNEaHVxcysvMDJPcENMZGprcWFqeHdrT3lyLytQUjkzenhlNHBS?=
 =?utf-8?B?cmVBM1BGWGJqWXQ1ZmY1dUhSNFNwRmJDVENLaHBMZE9FZGlDLy9vU0lJRlhD?=
 =?utf-8?B?ZVlqM3BWYzZWVGR6ZmNseXdicEpCVWt2MGhpeDNIUEo1TFR2d3BVS1k0MmJC?=
 =?utf-8?B?d1pBeDViNzQ2QXFITUdZZlp0WlNQU2w5V0dDTjNnb2NRcnhObUdtdGd4V09q?=
 =?utf-8?B?MFlyOUEwTzdHT3N5bkJ1SGU3TVZ0TmVERFBkdjJObXpNLzlCMFQ5ZW45empr?=
 =?utf-8?B?c0pPS1V3a3BUZTYyTjdlUm9VV1g3VlZGSUdRRkc3cUJ1R0V6UTd4SE42ZkhV?=
 =?utf-8?B?ekZxOTYwd0ZCV0pxQ0gxYkFlTzBSYkEvdEgyMkZuRUxXcEJJcEtKeSsxcEhF?=
 =?utf-8?B?dUt4NEM2Qi9FTkhhWUZSRWlEWEt1NmtxM0htUEhqZ3R6NVYrYnZDSm1IT29r?=
 =?utf-8?B?SUlpYnlGa0VsLzBoMFhzM3FoR1JVZnRSK1M0cUF6V0d0YkVycEIwMFRrMTZJ?=
 =?utf-8?B?RS9JSWNkVlVzUm9oSlp1TSs0NDVHWGVzY2lNSldCQ2NObVBOcm0wVXVMUXJv?=
 =?utf-8?B?cGt1R083YUl0VmFmeDZ0c3YxWE96VDFqVlhnbWp6cEE4UDJ3SHVLOTY1VUg1?=
 =?utf-8?B?REJjd2o1WFhSaXVSdGtZWlB3N0NjMlgwQmFvVStqd2hIZXNHeTc3V09ZUEMr?=
 =?utf-8?B?R0lJM2M1VE5yV0g1T1F6OExRVTNUK0FGQTlHeFFxK09FMVZUOUlYVjFqUGVU?=
 =?utf-8?B?NnQxS1dDM0FZUDM4QXRrYTBBY1pVcE5WVGJZMWRIVldOTjN6bVVwaEY4L1Ft?=
 =?utf-8?B?b2tIQ3U5Ymg5Vk5hY2haeS9NaTNXdERWVkRmUS9Ea2tlUmlXQ2hxWTJNUytE?=
 =?utf-8?B?dW50RG5rUi8xU05IZXBJUTBwUWd2NUw1NjlvbEtWaUU5SGp1NVhrZEwrZmVE?=
 =?utf-8?B?SnF2MkhmTEM3MkRRaHJ6c2h2bFpxcitXaGVHRDd5UmtnaGFIcDRXc0VKam1G?=
 =?utf-8?B?U0FYVElXS21XR2JkTldVMU5lNnk5Nks2Y1gyTUJGOWlac3YzaXBoR3FPditp?=
 =?utf-8?B?NTNsR0JZNjBuWjJZZllLejNsY0lWN2ZuSlVsQk5TdlZXaCtreFg1ZzNlOExq?=
 =?utf-8?B?RFFBM21STHZTQmYxeEYrWkV2cFNlN3NJNEg4WEtCTTBzVU9aS2dJY3crbU9K?=
 =?utf-8?B?OVU4c2oxZU9CeGRkajNjeGJyL25WNVpWbDNiaVJYMXpWYkE5QXJHR08zRTBE?=
 =?utf-8?B?WjJLWUdSVnl6bGpRRi8zdFNadlQyL21HeCs3cTdLbm91QitZTHJnc0ZPQjlX?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe302044-4b17-4073-fb9d-08de0ce04f64
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:17:47.8551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vWQDrmdrN6DNzDwwTuwr7tUHvBrOwo6doTTnkzsTvJpERPyMaW13tJJeHeuBLdrACUHfTlXefU3ezXoWQ4E5YN9xFvmzXzoukls1TDuWK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
X-OriginatorOrg: intel.com

--------------BwvvfEV5x1RebeQ6rRvPfot0
Content-Type: multipart/mixed; boundary="------------b3WqKm0DH5CjVJnMTqagzskh";
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
Message-ID: <17bec9e2-5ef6-4c27-8fb2-032e10552235@intel.com>
Subject: Re: [PATCH net-next 4/6] net: ravb: convert to ndo_hwtstamp API
References: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
 <20251016180727.3511399-5-vadim.fedorenko@linux.dev>
In-Reply-To: <20251016180727.3511399-5-vadim.fedorenko@linux.dev>

--------------b3WqKm0DH5CjVJnMTqagzskh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/16/2025 11:07 AM, Vadim Fedorenko wrote:
> Convert driver to use .ndo_hwtstamp_set()/.ndo_hwtstamp_get callbacks.
> ravb_do_ioctl() becomes pure phy_do_ioctl_running(), remove it and
> replace in callbacks.
>=20
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

--------------b3WqKm0DH5CjVJnMTqagzskh--

--------------BwvvfEV5x1RebeQ6rRvPfot0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaPE2ygUDAAAAAAAKCRBqll0+bw8o6H1o
AP9EaDns1BTnpttdfAPeUL5S23PUaKHrwNRtcQbN5nqFaQD+Ne/7Ai2RK/a2yV4KwqPmwvr7dL3R
HCTN/JRc+a5ZJQM=
=GRKV
-----END PGP SIGNATURE-----

--------------BwvvfEV5x1RebeQ6rRvPfot0--

