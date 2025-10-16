Return-Path: <linux-renesas-soc+bounces-23174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7FABE5039
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 348441A67EFE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 18:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1ED7223DD1;
	Thu, 16 Oct 2025 18:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBz1hxEA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C353346AC;
	Thu, 16 Oct 2025 18:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760638478; cv=fail; b=UFRjADLUJYhNbU2PmciqsAlYIaqXO/Bfn03gzeW0NoQJ9vS/nj7RDVhUxY6z2e+HUQdrJhzMppvcHds5dYUQ3wWW+QY/tH+OEjwr+Zf/cHniL279GOEEhc9vqTqFuP7b7Kmw8oUWwSOxFVW177W65cKqEu+lGoUqACV+C8ArXlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760638478; c=relaxed/simple;
	bh=XSSnPQvf4sp7sPEXZjrOdVM5hw8pkx1757TnfOJh74g=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DBIMci5fQfBCOxOfYrwFykAT+gEBEzt5hIucGkNc+5VM4C1b2M6hxDD1tSegTG7GqPS8uNAFQ0Dpqgrjq4Gxwyv1KIW8xrH7U854HnbnYE+TSh5nZGkL2HU5OPRcKZJnoYwtP3CIzw/cU4SR7OAanhMV45mH2x43lg4/R6fpXVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBz1hxEA; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760638477; x=1792174477;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=XSSnPQvf4sp7sPEXZjrOdVM5hw8pkx1757TnfOJh74g=;
  b=lBz1hxEAkw5EDvMiF56InDYnDoVhcWfWo8G8sDL61zPdRjlknxwYdXUq
   7xnXltB1ekNXKOc83wGGdiQuDHwtyAM/UtyzWamXQeU8W33NaWrvN0qSz
   qjq+4+laxo7sFQoeYG+xIr6eAY508qFEPjtCoZHo0G2gceTTNs47ud+Gn
   PUN8pC/yYtBBXMt1xQgMKYVTQppAX8q9lZsRcuvlZm2YZuReZbLY075Vh
   BQoIZBQ5Y+7gddBUyW9QbqthU3QPKxFHEyeyEnSdjgBc06K9jiGnYnMvs
   SxI64R5nEY4bwGjOYUGlJEcKeOENG7Lyk1HGAX4E/FobukSNzJzhYGQs7
   A==;
X-CSE-ConnectionGUID: RLy04+YmStiuG/l/rc/jFw==
X-CSE-MsgGUID: oY2XK+5bTQaCoy1SrP+n3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62890440"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="62890440"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:14:36 -0700
X-CSE-ConnectionGUID: fgFveGNkSWmqQ32btVbRSQ==
X-CSE-MsgGUID: hSgCKoV7SiGQD8Qbk6B9VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="187799958"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:14:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:14:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:14:35 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:14:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwGKwl5q0cH09n5GoO/KPNnjjdObFIEdKtyThfcDAUvTLuxkvibQXUntllJBxX+QV+p8fT8NtrS7xn8e79y1zdkVs2q0HyhXWTQlCiel27WJRxd8LOXuJ4BFv3kf1ZmkvdRdfNoPyHXvVs6T5+H1LUf29x6+QoXhONP42cr2u/Yjjj0YbKRnHrLA7u3NFBJ8ylheV6auzFaI0hw8YxoSjwJVmPKZEYu5GJODoXF9jn7EI1N0YvDv1cn2/QHpgAay8g8yzNDF2ofGptTXROpmFAHiq822xCGevELuUa3U6jLOKQmT0Ca1nTx/XIyL/YIZuTuHngz+uvad6YIckZjUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSSnPQvf4sp7sPEXZjrOdVM5hw8pkx1757TnfOJh74g=;
 b=wyXmJwrxm+nGHZITh4lwECR88TFxivCyY2lUSMhEBIExdXaKz/vHszW8ACiNUXE526u6aN1KkiRTYN3J3aGS1pyzYOcPECWeC4M6UGk+KpUwCNbu4UhTKY4dQToY78LQpKFxOf5/0akpnRTjFWgQ0hvZPfxS460s8CpX6nQ0rkoI5KjaNJfjGr5V4GE14Hl6/S27wsp5F00+sbCp8Ksv4sCc+bAnzdIu4K5yVfvV7kwZxErsYeqWUIQt0gLhENiy8OOjvFe7tnr4YGEg+sSzalm/PGxhQAmoWnXONPW7dQNIvJWCpNyRssrrXcFRuegef5UYqUQ1wOWGWRqKYwr+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 18:14:32 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 18:14:32 +0000
Message-ID: <4051ae81-8c73-49ef-b882-257750ec8754@intel.com>
Date: Thu, 16 Oct 2025 11:14:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/6] octeontx2: convert to ndo_hwtstamp API
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
 <20251016180727.3511399-2-vadim.fedorenko@linux.dev>
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
In-Reply-To: <20251016180727.3511399-2-vadim.fedorenko@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------8S7IhFii7O1aYl4NAjva0A2t"
X-ClientProxiedBy: MW4PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:303:8d::7) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|MN0PR11MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b749051-2ef3-4642-e15d-08de0cdfdb02
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGRlVkxibHBMR25IaThDaDBXNW5QVXd3UUh0bDRoOVpoZFZ6azl5UVdLbXp2?=
 =?utf-8?B?MnFUS3lRa1pHSWs2d2ZEdFNsalVkUVZGM1pObHNKS2xEV3N6dEQ4WjI4ejBF?=
 =?utf-8?B?dHdpUWNmUjZLWS9kb2tsbDNQckVpQ1RsVmQ3NzZINFNKcHdmRTlSdUV6TGV2?=
 =?utf-8?B?TUVIM1o0M0pqeks3Vyt5bFc1WVZ2VUlMN0pBMGRlUFUwS1lJd1lEczl1Zkly?=
 =?utf-8?B?QUZXazl0bVQ1d2JHUlArbmN1TWJEUjNsSFhVdjR5cnJ3VlBVYVBtQ1YwSjZu?=
 =?utf-8?B?VVRNaG55K3VSY1JjQThiczczU2p0aXVrYnEzQ1ZmUjQxSEdUZThJdUx5RjdD?=
 =?utf-8?B?M29CdS9hdEhZZUdQeS91clQ5RlAzNkt4V29nY24xeEZBZ1V4bktEdjE4T2Jx?=
 =?utf-8?B?MnlrMFRob3ZERzUwVUhaWGFObnVlVHBERnVGWjZ5RHgxWHc2dVB2RjJGaC81?=
 =?utf-8?B?Q1ByMFhQS0F5NEVQVmVweXhQTWVRdnBhd1E3YzVyWWtzVm5SNmtBVW1LeFd3?=
 =?utf-8?B?M0o3bnVIK0pDR1FVcnhCUkdCY1hLUkhvZFNyajhoQk80WG9VODhxdFRuNVBN?=
 =?utf-8?B?SVYyVHJ4QzdpcGhBSnFDSjZhdWtnZG93ODNVbXUzV0FPR3F1d1ZoVTB0eFFH?=
 =?utf-8?B?QzVqRUNEbkdGRmNpZFhvNUoyajdwTDhiNGZCM3pKWXBQMkpvMkNRVEd6RWNh?=
 =?utf-8?B?RFpVaElYMGZxNVVHaWNqelZrOFhCbjc4bC9CalpaN1ovWFVJUDNPQ1NTbGtq?=
 =?utf-8?B?QkZIcU5iWHhuTHNuMlRjckpDZUMyU29JTnZCQ1Z5azh6ZGpVWGpoQk1PaVJX?=
 =?utf-8?B?aU1zR2VXcTlaT09LRnorazFBdmVFcjBCaEd2dW53Y2xhOU84YWFLL1pSWEdV?=
 =?utf-8?B?Z1FFNW8rSEQrOWxtQ1hhQnhSSFI1VVY5ci9FaTl3K0w2bWhEOHpJMU9MSlBE?=
 =?utf-8?B?cHdBSkZwcjhleTBvRGllcTl6OFVCUDI2ZnlrdkI1UVJqR3drTDNGTEpPbWlT?=
 =?utf-8?B?RzdKYTNtbFE5UnpYVmVTK2haV05aYzFuTldpN1FWbUZTRDlWLy9lVlB2cUtT?=
 =?utf-8?B?U25hRm5BNzFPVHZETDZZUjZVOTF2MHJXaU5MUUFkM3cwbS9ZaWYrdi9SNFor?=
 =?utf-8?B?Nmc1aTh2U3phTFBvUG5HSC9jdXRhUFV2R3ZHeStmYXArM1hqbWNhTGNvclZ1?=
 =?utf-8?B?T2UrNVZyRkxaQlE1MGV3Q25GOTFVeXAvU2tic042RVljZDU0NWthbHZSOGRo?=
 =?utf-8?B?OUVhL2w1bmwxdlJyMUhZd1R4ZG1DbGs2WjgxcjRjQmJnWlo3ZXpqNkdjZGxw?=
 =?utf-8?B?YjdCelo0MUo0TFM4aE5rUnhRck82L0JFZVYwQUxzRUNXWU4wLzdUREk4eGZn?=
 =?utf-8?B?QituLzN5N0JqWVZYMzVtVXc0ZUpJYStNWlZGaVM5NGd4V0JPMVNpWHViS2tK?=
 =?utf-8?B?YVFtZ1Y4M3RzaUNzNERpd2lBWDRpZmorR2ovUHZVaVVLUDg2QWszdGl4Z2FI?=
 =?utf-8?B?Y2IvUkt6cnZOa1AxcTYrdWF6ME1UZExkSmhTWUZITHFyaUtPYktmemJhREpm?=
 =?utf-8?B?VVNmOEVxQkVLL2VFZldKbS9waDZFUEwyQ0tUZUhlakRiS2xzUjZuS0hMUDlP?=
 =?utf-8?B?NHl1KzRqUXlMOVBhQm03MFRrdWxiSStUei85WjNlQzZlbUVBTEdGRnlGZEZu?=
 =?utf-8?B?SzlTYzVoYjMwTTN0MTRSUEc4dk0rQUQ2elFLdHpRWXhPbHRxN1YxbFpSV28v?=
 =?utf-8?B?THJ5WGlRNFlCVDE2a3pJTlErMFpjaER6WlUwYys2ZVhJZC9YRlEwZFhmcVBR?=
 =?utf-8?B?Tm1TSlRwb2U2SWhyU2txb0EzMzd0VmRRbktTMVU3UWNSSXF3Tkc4SktxSEto?=
 =?utf-8?B?TkV4M3QxdzhtRXRKRThiVDVvVCtJZWJJdS91M2JjelFRdTFpWFJ1ajNDU1k4?=
 =?utf-8?B?U0cwcmJ6emRQWkZKOGlNSXhzeXozSE5CL0ZuUSszd1ZTb1dMZ3JFWkYyKy8z?=
 =?utf-8?Q?lxl77cAb01Cpw1Sy2z6uA7EKgxYPgk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmVuaUl6bFlDUHhnQ0VLdkoxWTVmU09aa0FQamN6S0lWYjgyS0V3MU5hbXpS?=
 =?utf-8?B?VkorYU1JOUUxU3o2M1pXWjVwRWNFclU4eHk2ejNjK1lSekxsMlpvdi8xbzVX?=
 =?utf-8?B?UFh2eU8rWnJxMHBPQkRFc0NWVG5rbWdETW9TZEhkSGdPQ2laa0hDM1owOGVl?=
 =?utf-8?B?NURGQjBnZUlzN0w2N2ZjZWpTclpCN3F3S01YbUpaSXRKeFBaaERJTFNiWWpj?=
 =?utf-8?B?REVxZXhkQ3F2WTlrbkF0SHdCUHp5ei9NMmJhOEZQdWlqU3FPeEgxYjU4WVBt?=
 =?utf-8?B?dEYvcUFLR3d1OFpMQTdXWHBuL1BPRzhxMXNFK25Pb1JCaFFETGl3c1QyT1Vk?=
 =?utf-8?B?YXVLQis2V1ZsUk9WM1Q1MFhQWDRTNW5uK2dnUHQxOHpDMUVBWUc3UFMwZ3Uv?=
 =?utf-8?B?TURWWnU1VnNhMmhqU2toVWpGVzYwMUFvemY4VmlsUEY1MFVKeE91QWM0ZE42?=
 =?utf-8?B?bEx2RVhnZzMyZnFreGNKUmlsY1Mxcis2SFdmRHBEK3RHcDRmeE5XdFpqNVc2?=
 =?utf-8?B?Tk4rTXVNOFBJbUMwenVOMDlQaENyQW5mb1k0QUI4OVZyeVdJYWREdmV0cHFV?=
 =?utf-8?B?WE40eDFWbURDZzRidkYyaGJmV1p4WjNOSEQ3Um5kb2VGRjBOeFRxTlN3R1J0?=
 =?utf-8?B?bEdJTXREeU1HSG1TWmJCSW5yZk9sRHJVYVI5R1VzMldJRHNEemdSQTB5T3Ri?=
 =?utf-8?B?cGNmaTA4cllwOEtCR245enF4b3R1cDN4aitYUCtRaGFMSldkVlVrMVhMWXZ4?=
 =?utf-8?B?N3NIRUJiRjJrS1V0dWY3dXVkelRlQmwydGNES0ZNTTVvbzBlaS9IbFRqWEFh?=
 =?utf-8?B?QXNydE1tT1hQczgyTzZhQjMzS2JXNkJwaGVQVElWV3lxdGdJNld1YXJneGpN?=
 =?utf-8?B?Y1ZnT05SUjlWU3FUZk9BN0puemRVK3RTZ29PUDhPdnlqeVVzdnFNMS9KaCt6?=
 =?utf-8?B?TEpWNCtxVFo5MElDeFY5L1hIdThZcElYOWVhYlJQZnQ0R2c0QXgyZ0FTOTMr?=
 =?utf-8?B?Z1Z2MnlIUTZaTllhMXlGRVM0d1Vtb052cDlnL3krYWRmZHZ4TXJRUGt3L3lH?=
 =?utf-8?B?NWVWUUNEVVFsVHRHN24wU0FUanZyWE95em5QR3h0NG5PcTZpNDJRb0QzV3Zl?=
 =?utf-8?B?R3hRUTVXeVNmbS9qeDNWT004K1MveWt1Q0I5S0hWWHJQWXR5ZGlscUJQRjhV?=
 =?utf-8?B?SGVDZnhXcHo2WkxTZWd0Z053RGhmdm9idXlQUytaM1hWRWsyK0NvdmJtRDFV?=
 =?utf-8?B?Z0dmYnlVSlR1clNsUXlRN2d4aHU5TkJTVVZhMzdoaVVYTlNnWW8xa0NYd2JR?=
 =?utf-8?B?MWsvRkxrUmFPOVFoOTJOSUlJSmRVekR4RkJLaUd4aUNJRk02VnBrbTZ2VUhN?=
 =?utf-8?B?VE10aGFJano0Y2dzU0ZQY1RpbGdnenlRcXlWSzc5ODQ3T0RMdTNWZnMyOTQx?=
 =?utf-8?B?bFA4dmZjYndwYllHRU5hMEZldDE3R1JEQVNOMTBZYm9kRDhVYlZHLzh0cEEr?=
 =?utf-8?B?VUozVUNaZG05UERrQVptODBDTElYS1dJZXBCd0MwRjNxdkI4K0Zza2JxbC9S?=
 =?utf-8?B?Q0tnTTV2dTRMQmRTQUNQWHlHSEJzbkJCN1dCZWFHblVDdlBPVXZvUFFUMGxh?=
 =?utf-8?B?MWltTVd1cncxTUU5N0lJNU51aHhYVEhQL2R3aXpaL1ptK3pBQkNyWEtibWhk?=
 =?utf-8?B?bEZMd0VDaGx0TER5ZEp0VFl4NVVseUtsQVlsZFpMSjZhRStNMXZ0SldjMmpx?=
 =?utf-8?B?cUtOYXN1dWw3UWNSVVIzRmgwSWtDN214cHZYazFncDlpN3d4QlpCTGE2cVJ2?=
 =?utf-8?B?bU95NmhLdGZVRVc0RkFtbGV2RHAvSkZvUitzaFQvcmZFTGdtT3p1anQyVkEv?=
 =?utf-8?B?MDFJZmNvS3oyVmdCOEpob1hEVVhCMWY0VVdsS2wrbE5uSHlnM1FOVjUveTdC?=
 =?utf-8?B?WFZ6dHdDVmprNmdWOUtUc3BpVmVBZXMzQ0pTSzhKdks3aDZhZUY0WC9HQWps?=
 =?utf-8?B?UzBVUGNWZnVpUEd0SE50S1k1Ukl6VFdFV0wxYmN5R05ZT095QkViMFFGV1M5?=
 =?utf-8?B?N2MxaXFibWNDaFgrWjRNdkpOeXJiTy81c3VweFNxQ1RMZzZXUDFuamk3MWc0?=
 =?utf-8?B?bnd6WVU2M0dZRk5zUzdNMFZFQmNnZng5cnRnbyt1ZlBZWGZBbmw5SHA1RDBm?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b749051-2ef3-4642-e15d-08de0cdfdb02
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:14:32.5827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2voBSKvrkI5vc4HzlPVOotoXVqhfP0wf6N58J7XGBUS0WckNC8i9nLdELBeM4jslhfS64IlnGX0G4K4TlXOkiVM5GIgybAlIK8KuPY80w4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
X-OriginatorOrg: intel.com

--------------8S7IhFii7O1aYl4NAjva0A2t
Content-Type: multipart/mixed; boundary="------------cSb0JmU3effxZxVi421Oqpj0";
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
Message-ID: <4051ae81-8c73-49ef-b882-257750ec8754@intel.com>
Subject: Re: [PATCH net-next 1/6] octeontx2: convert to ndo_hwtstamp API
References: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
 <20251016180727.3511399-2-vadim.fedorenko@linux.dev>
In-Reply-To: <20251016180727.3511399-2-vadim.fedorenko@linux.dev>

--------------cSb0JmU3effxZxVi421Oqpj0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/16/2025 11:07 AM, Vadim Fedorenko wrote:
> Convert driver to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks=
=2E
> otx2_ioctl() becomes empty, remove it.
>=20
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

--------------cSb0JmU3effxZxVi421Oqpj0--

--------------8S7IhFii7O1aYl4NAjva0A2t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaPE2BwUDAAAAAAAKCRBqll0+bw8o6ECk
AQDHCu4ehAzHe6ZRQzpXYZBKWCO+Kacg+omLXmvndaBbJwEAnMgXeEU/0a2LXiQ1/ofBjD0s0flM
JZU3Y0IbhXMixgI=
=au7i
-----END PGP SIGNATURE-----

--------------8S7IhFii7O1aYl4NAjva0A2t--

