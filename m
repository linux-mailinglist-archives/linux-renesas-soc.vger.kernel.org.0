Return-Path: <linux-renesas-soc+bounces-23180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 670EEBE507C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE33919C7D1F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 18:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E75225414;
	Thu, 16 Oct 2025 18:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHZZtzja"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B309F2236F2;
	Thu, 16 Oct 2025 18:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760638772; cv=fail; b=cr8zQm68sfPW3nQLITWous/KSgsTQptsJ3sGC+qi9ir7Q6t2WOCFnLU4ojDp9FvSjAX4DGxPp8C6aRrPKZR2Qu/3JwD77d31JX+MOcnKR/w3/RCMNtxy4VKqj/Lo5abve6hceMPvjbj7IFZNJC/L37gYiUDeK6W7091mLykl1pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760638772; c=relaxed/simple;
	bh=KyvobzyAtGhxYdAOOhm+sQy5xEjcz8xED2MVBzIJDzo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R3yG5lac/SkoEKd63LgAkgM99NDR0iIVoNqYrRyXnhz0tl2d3KFDIS/r8mI4Wsmuc4XcLch41ev2Hq8dLVbRpoP/aLCe5b/KKSMe4TfWO1F6D0kK62KXSKuoHvTQT8L3vFwC9d9hcGjHLNX8ZNzXB3/bRk6aCpzHQQO9jwslDlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHZZtzja; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760638771; x=1792174771;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=KyvobzyAtGhxYdAOOhm+sQy5xEjcz8xED2MVBzIJDzo=;
  b=OHZZtzjaaCx/H9SpLQyz1Krd5oqMgLjsjhsFFd++Jz7p0InOhu3suTSR
   4yO2G+3Rn5nSoy5VmUJQePVqSoInWuUCOLJ84WSoKTlgfpLASJUfM05Tp
   MUGjrCbLSx8ypG+pPBfnVFzkxJDq3cg8Rlzh7N/GzfOCKGwNLzEHT4ord
   nHc9oQhQWp5D5UTYTHOOkz4DRV3N8vR3vJ9SoserwUFIvMbFyIRul4Uk/
   KXXG7LBdjKgYqc9J1BVH9RaYfcRxFVJ8lEgY1dDiC+YOvKTKNOV5eTCDp
   Lw9TEKxph+xegzovGKZFyqvCe3bXs9K2Ol1oZewpr/T0DH/4kBFCIctbF
   A==;
X-CSE-ConnectionGUID: zHnWFn1fTSaZLkGF9SkcRw==
X-CSE-MsgGUID: Xx9RQzguQJeAjt+h5Xjhbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62771792"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="asc'?scan'208";a="62771792"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:19:30 -0700
X-CSE-ConnectionGUID: Ud002ZqjS5mvPaPfI6IKmQ==
X-CSE-MsgGUID: 5FchxZBDS2iJyy0MPAll/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="183328071"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:19:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:19:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:19:29 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:19:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7rqkwbvaZ5mojo5xakxm0n35UVml2hJh3/QjMI5S1a12csbSZjRx++QWdTaXSn6gmew31hgLiyYEkajNj8tkziUJz3dfZUxw+u06E0ViJbetgomX1JA3RNhxqpynyLwgpl6cq1JDX5m5QhSgDoLKOqqW7ufuFrFXr2w8lkcY6FCieSG6UYpKGxe3OsMj/iIpkRH6YqML6r/teMprzWxoEtsfCkoGeCKyz4zFOv0jKytAXbhKSI/n8o0fyn8eUsFreGZ5a/BeHyl8+x9I1JHAyrPvwJQ3t0JQcGGqgCXSY1e4imVRtrUhQkBbSRf2b8clP6/+vB+ZNOoA+jr/Ngk4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyvobzyAtGhxYdAOOhm+sQy5xEjcz8xED2MVBzIJDzo=;
 b=QaiRkNME4bOBTuJzHGcG93A+4Wp+7i9D4HsqyL4NUxCKBnGV4rdqyeojzatIOUcHVWo2rzl93j+OMRO11V72Zy2vVfawedB/1BBUG236twypl4bPZ9sTuUa25SSQDynW8syXny0ZgHECKB6pCFM1OI5oIgi2LxZfhNBgfJysE3ubQi2u+rIpBcgljiyzvPJzpaTRa9VMPTio728IX9JPN8eRVbXdhS1cXZv9YH3LiqnLYlUK+xOyGUSa/PJYImydk9LTUJgAEUCwHIB5Lq+e81X58hOeDP0TBqEW+E6CehKemGSrpg6WcTdMbAbC12fE8pbxunSEibsamejtbI+VDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by SA1PR11MB8375.namprd11.prod.outlook.com (2603:10b6:806:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 18:19:26 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 18:19:26 +0000
Message-ID: <c027d75a-8d73-4b09-a78b-477020ab4f14@intel.com>
Date: Thu, 16 Oct 2025 11:19:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 6/6] net: hns3: add hwtstamp_get/hwtstamp_set ops
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
 <20251016180727.3511399-7-vadim.fedorenko@linux.dev>
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
In-Reply-To: <20251016180727.3511399-7-vadim.fedorenko@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------BxJN3CLBJJrzEabBMlPAt7tA"
X-ClientProxiedBy: MW4P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::27) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|SA1PR11MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: af50b769-d6ea-4632-82be-08de0ce089f3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGtxeUs5T0QzVktVT1c4T2JFanVGQkthYnJGZWJRdkxqcW15SUhGVDJqVG5o?=
 =?utf-8?B?RTR1VzQ3cVhwNUp4Y2tieFRQSjZrM0VUdFp1UkxNWis4Uk85YVJMTnhyTGZM?=
 =?utf-8?B?K2RwampCUjIrNnV1SW5UZUNUSURsVFB5Z2tmM2FvSW5DV2lrN0N3RnFaM294?=
 =?utf-8?B?cVpHYlp5QjU4T3JQdElQTGQ5Q2pJdGRFVGx0VE0wc3lkTVliZXFKL2lxdzI2?=
 =?utf-8?B?bHFJZVVydmN5aEMrOHp3aDFoRTJwSXFabCthaFYvZHRPc21UQm1aQThjQnFm?=
 =?utf-8?B?aTd2UXI0Qm5nb3huRGMyZWYrOGlxT2p3R2tnRmtYOFBSOFdyR0w5cGVlRDNn?=
 =?utf-8?B?WkFBWmhFMGVENHh4Mm9oakxDZjV3andRUFN1bEFHWmViWm1xNmtBeldUV3J2?=
 =?utf-8?B?a3pwK1hUTTNZS1VuRDFpbEdGTnowOWkzd2J5MkxFTjFNTHNmbkhzMDNyQXV6?=
 =?utf-8?B?NlpBWk5NVmVMVThkUmZnT1dqam5DeU9KczNtWXhZbVg3VjBXb0x1Y1RWZ3VV?=
 =?utf-8?B?N3lJcXZrcFI2LzBUTjBRb0tCSGkwVHlGM0JrUnZkZTlKREJWMGhJamFjZGdI?=
 =?utf-8?B?RlEyOG5UMkdyTDFKWS84QXhWK0ZNMXd4eEpDVy9BcjNpTmd4ZGt0cC9hNlo3?=
 =?utf-8?B?OFkreno4djJsbjZjWEhaWGlPOGIwcS9uYjFma1ExRDVUNFU5UjZaKzFaK2dS?=
 =?utf-8?B?VUg4V1VrSUZoaXZaTzNyWjg5MCttN1dQbmp4QUl4OExKS2h2QjQ0NW1ZWXRV?=
 =?utf-8?B?U1ZqdHA4dU5OOVMwS3BHQnFJbHBtYWx6UzN1QlpQTE1BWDFNaGZGbXM4T1hy?=
 =?utf-8?B?d2tING14Z2MyWFZxRTFYanJsaHR5NXNIM0pYdktTSjY3Ujd0TVRDbjlSbGVB?=
 =?utf-8?B?UGJ3WDgrZURZbW5OSFg5anFINk44WXhheVlLUVFSMHZzdk9yeld3dzBRMjVL?=
 =?utf-8?B?eTEwWkF5Nk84TnR0RzkzQmRBa2VPNjFwVGpZSWFRMnF3MW5TZmE3ZnBRcENU?=
 =?utf-8?B?b0loOFozYTZ4WG1TNWFIK1UxakxXU1lwaU1qT21kZGN1ck5IZE9uR2ltaFk2?=
 =?utf-8?B?aitrZVUvYmw4bHNTUkdtZHoyKzIzZ0RqMlA3SXExQTc0UEJGdnBOeThVd2tH?=
 =?utf-8?B?dndqRnpXeTFmakN0SWR0aW4xejgzWjVZSHBtSVBQeEhyVFdCUTZ2UEZ3b2l0?=
 =?utf-8?B?a2QwWmxvWTh5K0tiV2NqemRwT25DV3NCTFhIZ3V1S2ZVSXhaL0QxUmw5anor?=
 =?utf-8?B?bHNhNGJmd3JTQXRuYndkUk8va3czVE0vTXVhSXRaWTRTb2VRbUpZMVlTeXo4?=
 =?utf-8?B?RThJMXFTME9ITVFPZHhOUURoQlptTHZPUVlDUlBVQXVvb3VoRXQ1UHpMMnl0?=
 =?utf-8?B?U0FJek5vZSs2KytrY2hCUUZhTFhFM1o1aWZ6S3JRVVlKR0tKSW9NNWd0b0FV?=
 =?utf-8?B?RW03R1VENnNiSy90aERjalBjWjZwTnFNOGVjdUZUbExHbDAwVEdpclhVMWRW?=
 =?utf-8?B?VGZUdkdGaXRhWUNoMkNBZ005MHU4eTNoR2JPbjIzREpaZ2Rpd1h5WUhzc3Jk?=
 =?utf-8?B?eWpzb2dqL0FhSUtlZjFGSUYwQlhrVXN2cmRzU0hHSmpOMi96WTN5NEVDVTVV?=
 =?utf-8?B?RWJBRE5CZDFkMUJLRkY2cTc2SVdFellGZ2FEWFoyVDNHS3Y4SHpSYjI4MUk1?=
 =?utf-8?B?NHQ4YVUyekJHMVROME9mZzZHOHVHdHZZbnFDVnFENVJzL1piQzhyUC9BSk1B?=
 =?utf-8?B?U2dDYU5ZaUFsVjdacW01cmVVdnY5TVVmSGZLMHIrNVorOEFjQkxVRmZHalJy?=
 =?utf-8?B?bk5UQjF5bkVHUHd2cUVMOUMzb0c1djhzT2hsb0N0bDZKUzh3UHdqZmJVeEp3?=
 =?utf-8?B?c3ZYWGtVODdGdTRVZVl3ZjhaeG5VR2g0L0tmZFRhMHUyVnRNUk5iSHFsWi9G?=
 =?utf-8?B?ZGpxVkdrdGxDU0E5RFFHN3VSbFNoTlJrTGxQa1UyUVpTaHVna05NMFd1Y3hV?=
 =?utf-8?Q?h9Oh4A+Y1sop09O3JyuDJr82oxgMEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjRoUkNUVHh4Um9pbVdWTXdXdkRSL2dwWjhvRU5KcnlBQkF5ZU5ZY3VOalRk?=
 =?utf-8?B?NHJIMjk4SVFpWGVuNmVmY215WVU1b0ppZTNyQ2xnenc0TTExTFpkWUVSWXFO?=
 =?utf-8?B?TGtOUXZVS0lXY0d2a3ZZRWE5S01ZUzlkZGJvNUNCTElkNGdyWmFHeTk1aEN6?=
 =?utf-8?B?VnhoZldLeEtFWUllampGVitoWjJQSUNHSG96Y1pjUFlEZU1reUJxYkxaVS9y?=
 =?utf-8?B?Qkxucld1UVR4MGRtemRwRnNXdEZyVHdQbzNzczJZbWtFNE5XUzVoVXJELzhK?=
 =?utf-8?B?eWM4cEorMmhjeCtTL1IzWTI4OCtJd1RxUzM1VHNTNkVxMHFiYXNmSHduQmRm?=
 =?utf-8?B?ZTJzS3N0WUhFelZGWUVIVHV5bysyV2RLTVFsRDhzZFkyMXI0bVk2ZGhlWUM4?=
 =?utf-8?B?TzBtdFNKaGcxUTNwbVNvZzBoaUtZbmRGL0k3VENaWmRCNkZkT0JLcjdaa2pZ?=
 =?utf-8?B?a3BXbEgyTU1DMEl3Z3B1VFNxaVk1MkJPd0ZleFVLN0FVNVhseDlOTU9QdnIz?=
 =?utf-8?B?WTZOTG1Remt2RVBvTEM4N0Zob2RnV2c5UDB5bEpQRWgxRTI3c28rT2wycngr?=
 =?utf-8?B?NVNGZ2ovTDJDZ1ZyWXVQWnlNd2hDQ1ZCV3VSOVVYMFF3WHFVUHBnL0hiOVJa?=
 =?utf-8?B?YmNqbmppQ3g5QnlsQm03V3FleGttZTBJUnBkdzhVZ1gvZEREUldPdUtnMGo5?=
 =?utf-8?B?V2ozR1E2R0dOR1JncTdoMnBSUDIyQ09iVy9JaXhxT05MQURlcWVNWE15YmhS?=
 =?utf-8?B?VCsyYXlueDJ0NEpmTEpJR3NZbmR0UmpjSE5lV1JuWHRPcjhBTFBCWlNKYWYz?=
 =?utf-8?B?dFBUUlNwVWtsaEhlRWRCTEtRVkxZRzFaY1Jad2hOamFwbHVrM3B0YXJoMzla?=
 =?utf-8?B?OC9VemVtb0NCOFdBa0FNdGFYMk43cmdMRVNxRVVkSUdRT1c4aVlLOHBVMUVr?=
 =?utf-8?B?ZHJkNFRwa0RoTHlXQXRPN2NwWWU1T0h0anhvRTBJN08zSDFwNkhscE5Dbkl3?=
 =?utf-8?B?WjhWZFdhYzFKcGhEdU13L285M2RCTkJ6MjJjRE5QU0lCTFQ2V2JiT1pTV0lC?=
 =?utf-8?B?TUUxd2xzL2pmck1rZ3FFZ0JvalNDbjFTc1BsWXF5THhuNWZidGl3UGpvcHd0?=
 =?utf-8?B?OGRabEdnZGFDMG4zc0FuOXVHc2FsU3plTmFUOHVUUS8wV0RXWXNub3pkS09i?=
 =?utf-8?B?cHYxTi9yYm9zTzdMMUpFYnZQM1lONHpSd2tJSUlvSEV0LzdVZlBkbktpbGUw?=
 =?utf-8?B?ZXBscDFKeDNNTVd2RVB1V21uOGJsSjN4L1NnS0VNd21wWVhqUUUyNERlWjZP?=
 =?utf-8?B?R2Vyb2IvZUVCRTNqTytCUGNaR2Z6bUoyaXJpSzJROGJnSTkyUDhNR09kU2FI?=
 =?utf-8?B?dkVNbWF3R3lqbTU3Ykh3ZW1lVGtoYS8zS3Q4eXRVV1VvaVZ6ZGtiNFQvdmZJ?=
 =?utf-8?B?cWlrTUtXZWZnTklNRkhOdmQ5eGJES3BUUEhkbzRQT29KdStDekNua04rMG90?=
 =?utf-8?B?d1o1Y1ZyT1A0cGU5S041Ukk4cmNJd2NCcXQ2S1gzOHVyUHRNZHRkbGZGdHdk?=
 =?utf-8?B?MXZCblArM05LMXVvVDZ2bmFkbEZBNXczTGEzRzQvUWlLTEF2ald4QXhCcTlv?=
 =?utf-8?B?NkNTZVRoNmFsZGRkbktRMEsxWEhnRy9tRmJSUDBLRGNvWW96K1RSTlVadkVh?=
 =?utf-8?B?Vm0zL3VIS0xCWE5oNkJXdDIzc0hGajYrWjNoTU1OdXd0UzVlQ2hQSzlYUzRB?=
 =?utf-8?B?ckl2bnF3TzZtYjVZbGdqQUp3eHNuRHVWbmM4TFRsOTlzRjUxYVZMVVE1TVJr?=
 =?utf-8?B?emN2T1pGWW5vRkZBM2gzWUo3U1JldzNlbnMzTlV1TjFtZFJ1TTkxdUc5cmYr?=
 =?utf-8?B?RnJKcEhJSVZCbnBlOFIyZXh0Q1BRZWtkQkNQYmdSZ0Y2aDhNT1NEUTFSN05x?=
 =?utf-8?B?TjNHUUZzemlMUGkwL013RnhTTnNreDRpYlEra01RUktYelVMb09IWHBzcGZY?=
 =?utf-8?B?VVJacXhRUTBJL0ZYQjhhMDRYMXpFOGp3MXV3ZkhCS0VwRUIzcUdRQks3QWRl?=
 =?utf-8?B?ZktHR2NxTDFEaHg0eWQrWC9ScmppT0NzdWFJRjFTc0RwR05qSUNleHFmR0lp?=
 =?utf-8?B?SmxPSGE0LzJSZGpnRSt5a001RHh0V0Nob3E2M3g4Z1RCRW1YYXB1Q3FNZERU?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af50b769-d6ea-4632-82be-08de0ce089f3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:19:26.1099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nALaLcjFJy9p620l6XfHcmTiRwtyg/Wm8Nr4PybySKqgKj5ppiVXlNhmCYhdjVDU3Ma98J7VOVKDZfD1G5gsW0c7URcHE2adVMwOaa8FcZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8375
X-OriginatorOrg: intel.com

--------------BxJN3CLBJJrzEabBMlPAt7tA
Content-Type: multipart/mixed; boundary="------------0lddoaaqkplmlFkbqTru1BVW";
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
Message-ID: <c027d75a-8d73-4b09-a78b-477020ab4f14@intel.com>
Subject: Re: [PATCH net-next 6/6] net: hns3: add hwtstamp_get/hwtstamp_set ops
References: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
 <20251016180727.3511399-7-vadim.fedorenko@linux.dev>
In-Reply-To: <20251016180727.3511399-7-vadim.fedorenko@linux.dev>

--------------0lddoaaqkplmlFkbqTru1BVW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/16/2025 11:07 AM, Vadim Fedorenko wrote:
> And .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks to HNS3 framework=

> to support HW timestamp configuration via netlink and adopt hns3pf to
> use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
>=20
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

--------------0lddoaaqkplmlFkbqTru1BVW--

--------------BxJN3CLBJJrzEabBMlPAt7tA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaPE3LAUDAAAAAAAKCRBqll0+bw8o6O2v
AQCejQ5/uxkBm+e5hbBAl5+8FLE+vgQi+2oznax6vKIpnAD/S/tA80PErzyQAiXCDUHPzZwZj7JZ
HoyXQQ9AGC5cVgw=
=KetK
-----END PGP SIGNATURE-----

--------------BxJN3CLBJJrzEabBMlPAt7tA--

