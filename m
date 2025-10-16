Return-Path: <linux-renesas-soc+bounces-23179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 016FABE5076
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 302203BDC35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 18:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A61223DD1;
	Thu, 16 Oct 2025 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTNaAz7d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61A7223DC1;
	Thu, 16 Oct 2025 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760638732; cv=fail; b=nBkS+PNznA0FSIvbW3Wrg0coQZxOGcc2wVcTx3oNuTj9vl5T9fKfO06xCMJmUWATOWE7RK0jBc5kVvNzOTboKhhn0pVdfB7bB8lkK3Bl6YziiMKgD9jaV3XSJfZlL1JnP1OWcxJIHM2x+fnhkm9asAd+ASfQoxQhXLK2o8xXkLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760638732; c=relaxed/simple;
	bh=PzFFZIg1brirOaRtdJrHOQ05j6i7ZadYvkbII32Huhw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CTpsTwYUW0G+hm1KrFxpiTInOh+nwY+WeGpHz1fVOHCy/+apatxCRdRGV8nq8Ncrad32GjOA4XlTnSR9j77U2r+ADdLjaMRkCvS4yockR52pNpQwLYYuVPQDa2iC6/yNnulM8ZfZ0qOPOOO0CkWvYHKn9Ks+4jwZTM4czxHrIRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTNaAz7d; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760638730; x=1792174730;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=PzFFZIg1brirOaRtdJrHOQ05j6i7ZadYvkbII32Huhw=;
  b=YTNaAz7dCkJ8RvpOL9JT/KGzUbX4I5UPd3wkwaq0qLDdXoqFtfGvN/z2
   3n+v7OBT5iKI78Is6WpegfleDVYl1b9pV+0ZLOsSRLgaLHGCQbBQGes73
   MtX2TQo2bad0q39e5W+eGnyed+5FYbaz7Rke8ToRvftBZZ9z5sXn4QBId
   YknxlPAcgj4ohL2aSJXVzipKoJXatKZHain4fq2+4sc67g+c9xDUt71Fv
   zq0pcn9fFPxRKsOo4o7tHF855nQ8Jk3heoPIkZ2GtuNuYF9gfJPsD+vuG
   uhUh46b13wXG+6wF7wyGt5MRwCY+vVMWzIJVj7ljDxctsHV8BGrOkvv/D
   A==;
X-CSE-ConnectionGUID: o9yYCscDSJGmo8WzFBqkQg==
X-CSE-MsgGUID: NyyfD1iSS2StMMnBi2bK1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="74185473"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="74185473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:18:49 -0700
X-CSE-ConnectionGUID: iStrxs9RQkSJ5LRIO9N6vA==
X-CSE-MsgGUID: MpfCzyOnQr2yGooG4IqWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="186914972"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:18:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:18:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:18:48 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:18:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJmR3PuWapjwdRtU5hw8ya6KMgItJAIeqfRF6hM2TpSz/pYc4PcBXbsYSnTPRPvH72SD2q1vcm4Yhz7TyWUDp687WPm5Hci7eJXLUoMyF1k4SRtgAfsqDDyJp/Sx/ma9YZ1iE3U0azmN1rrp0bDSurl3I3kyhV+7WyF4UyBeBlsDYIFqvhGgXxkU4yHSqOVWTGeE+e4hYrh+ERVTYGHRyIriVeA0Exmc0Ejb2fA8CMW7b5kxYNKUs4cuIk+Dn4mr4kyS2V6Q/J7UvZE16XdZp7LNBI8b/5zYTwTBMxHFnaXr6ODgA5jubVdWEXd6/hqxwPH4QIdSll3tpt0qwQKcLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzFFZIg1brirOaRtdJrHOQ05j6i7ZadYvkbII32Huhw=;
 b=RWOAospjGwa7bgRO6yYtLC8v1TLmK9i42BBzfq61LBbD5L0Fu18+jT95DyKNM+IneEyjS9JM6YAXDukn5FgqbB6PVXPA7zLJo3KZJ3JjEBZE67B8qUdTUu6uBl5sgpfSrcKAQo7puLie7jMk87MECDFxzQNU5Bs+wujHbtOLi/rcb0MX4kptDwGD93nw96gUpVydlWZ15fmw1P6XniLJm6Zw3gJt8lDEPtuvV7an/Nh44FsHjiOPY4BgP8DpGVXcaYideotm9a3ZavdiTm5ZKNEhR+OPR07iCb5vO2xBe+Pe1SEqNX5vgSrU0kdQ5JVA0Q+aJbiQVNoXsC0VcDYFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by SA1PR11MB8375.namprd11.prod.outlook.com (2603:10b6:806:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 18:18:45 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 18:18:45 +0000
Message-ID: <e20209b4-72d9-45a1-b40d-7e730484d896@intel.com>
Date: Thu, 16 Oct 2025 11:18:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/6] net: renesas: rswitch: convert to
 ndo_hwtstamp API
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
 <20251016180727.3511399-6-vadim.fedorenko@linux.dev>
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
In-Reply-To: <20251016180727.3511399-6-vadim.fedorenko@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------x8nmMhJsa1Sb3aBG12wbuqVk"
X-ClientProxiedBy: BY5PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:180::46) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|SA1PR11MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 3290a81e-094e-43ca-6e50-08de0ce071ca
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UExWZDRIVERMdGhZQ0hyaGVueTVwMGw5MnFySS9meDlIc2pybnZhcmpBa2pE?=
 =?utf-8?B?ZHc5ZlRsQjh1NkpSMXJoU1VSWXFQRFMrR3pKSEkrSTUyZWJ1Sk9hUUJxUnRE?=
 =?utf-8?B?ejFvK091WGp5b3hNay95WHgwVk52UlA3WFFyTEI5UXZrUnV2akFQOWtnZFZx?=
 =?utf-8?B?NU1ydlc5Y1lFcFIvVCs2U2VnNXBnYmN0Nnc0Ny9Ta3dhQm9YWEh4ZUhubHFs?=
 =?utf-8?B?OHFTbWI1enhlQjI4SlljNGJkaDQ3bDgvMnFpYzlNYnlRYkNrMHBDOTlUeEFL?=
 =?utf-8?B?VFdoeGVWYWh0SzJiNzVLYUlrTGQ4d0hiUk1ZZE1PUEpGQ3dwa2JlYnYySWti?=
 =?utf-8?B?WWJVODZaaXhhYUhjUENpY0gwZkxjMHhROGFFck84YjZuUU16WGUxY1hWV293?=
 =?utf-8?B?L3ZtYkJUQUFoV3ZaU1lhc2ZGVEZPVWs3azhXY2lIbkVrcnpWcEJMaHNtUVI2?=
 =?utf-8?B?Qk9VbU9vOWovS0FLTjhHZjUxMmdnbWkySzZCQ2cwRkxTaHNId042VzFQQmJa?=
 =?utf-8?B?ZUI2ekIvc2JmZ3RJLyt2czRvZFdkRXY5eE0za1U3c3l2WmFVdTFETkV6ODhS?=
 =?utf-8?B?VEVzL29oWk9RTkNBRDZoTkNmVC9uaXdQcTFzdlB3UVAwbzRvOG1GR3V6K00v?=
 =?utf-8?B?WUxCdklWYWlnZjJyb1ZVQzQ0R1cxdlFIK2JRV3dqRGhVU3ZtSERkOFNnUXpi?=
 =?utf-8?B?Z3d5UU1KazdUYkYzMlBCTTB4cGljUmJBZzNmbFl1T2RmRnBpZG82Vkd5cHNu?=
 =?utf-8?B?QXBhckZIYms0cVhGSis0YkEyejZEenE4MW03SW9ENC9uc2M5a2o4ZGg4VUlF?=
 =?utf-8?B?QVN3ZDhsU2lKNmVHZGROTmpUeGFQQWErdHhzSHdUOWlzOUJjUlk3aWthV0V0?=
 =?utf-8?B?RmVPbmhYYVhia3FpUGZ2cDljdmF4TnVkV0RhcWZIMEVwVCtZMVVjUG9kdjNN?=
 =?utf-8?B?RnQzcFlnSzlOQlNQcXFONFZmd2MvTm5JcktjUk9RaFQyd212dmJiYkZLU3pY?=
 =?utf-8?B?c2d6S2YrQ2tZSVArUG9yaUtsV3NxNkhFZ1crY0FkenpVbU9SQmhLb1hTRzVC?=
 =?utf-8?B?V2JlZDE3Z1NvQ0pkMWdwT2lJaysvck5NeHBncnNkdmNDVGNHMU00Qmh3ems2?=
 =?utf-8?B?bTQ1aFpnTEY3NjdMYkt1SDFlVmJuNjlIK3RCeDRwai9LMVBaWjhvbFc3YWZE?=
 =?utf-8?B?bVlDbDBlajVEZmsrdVVVOGMwc3N2bEdFaXA4bHVuaUx2c3A0eUsxT2VrNmh3?=
 =?utf-8?B?N0hCOTRUanZhM1dsVEtFN0phNnpPSDVkMjVER1JJZFhjZ3R2WkxDOSszRFVJ?=
 =?utf-8?B?NXZ5blFCK2JLblM3T0tQa3NQcVN2SjlJY1lVRmt0ZFg5bFlrYmlhQVRZQTlG?=
 =?utf-8?B?VEhSS1NhQVBPWHZLQ3hmOStJTWZXMFR3VDA3ZUFDRGdsQ1BrNnVrVlU5NTI0?=
 =?utf-8?B?K0FXa0tZcHBCS25KbHMwU3lMZ2xGckFzKytZNVRaNndOR29mMHg3VlhlYWpj?=
 =?utf-8?B?UGU4WTNJRVJ4R2hndWVxS0F3ZHVPSTlrUkxDbkJBalhtaGdGbGtEWWF5LytX?=
 =?utf-8?B?bUpSZVV0ZjNMYkRYNGF5VFUraG42VVZMWXFHeG1scmg1VVNPUG5GbDN0WWFI?=
 =?utf-8?B?V1lBczBQNkxHNEpPVkdxbzhzcFRLNmpqY3JOTURMVk8vSjhZbm9kcDhST1Y0?=
 =?utf-8?B?NENGcmNhKzhsZFYwU2dSUFAwMnp6a3hzUERqQ0M1aFVoWU1LZ0pNYU5GV3BQ?=
 =?utf-8?B?QUt1RjRJZy9pemt6OUdXdkNhNWtkTkQrOE05aXdZNzdhcEpaZFNId2oyWXVy?=
 =?utf-8?B?MWJnQ2l6Nk85T1FLL1lxQlFYcUtFQWYweFFFQStyQS9aU0hONzdEdnVpV2Nk?=
 =?utf-8?B?RDYrVXJIUDh3UzZiMDNqYWpMOGtVUkc5cGYyV3FTdUo5d09iWXpxRFZ3YXNh?=
 =?utf-8?B?Uk0rQU0vdEkzMlh5eE9vQU9uZExXT2puQUdzSTQvbnBTc2NLSHJyclA1U0Q3?=
 =?utf-8?Q?nz2HMUmdIRHLiOdpr5CvKEDGkGHtT0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG1GY2lMQjBxTlk0VUlKd0JzRlJWOWpka2diLzZZc3BWRDVpYVRDb0t1emFV?=
 =?utf-8?B?dmV0M3FaMyt5bkh5a2JTVC9LOVRBaE1qREZ1Q0NsaFRRVE1vcDNKUUFpMVk2?=
 =?utf-8?B?S3grYTZ2cTMxQytuV0I5WU0weGFjUSt6eXpLU3pUY3BDM3RVUzFqaEFFNVMx?=
 =?utf-8?B?alNOVStuSjZHY21iOG5tdUMvUlhYb0lPNkk5Q0hyb3J1R2xQb3FCdHhkSDhX?=
 =?utf-8?B?S2NNelgwRFc2R1ZGZ3VKZnZDbHdBVEpQM0RROEloTllIZkVWSE5LQUpFM3cw?=
 =?utf-8?B?K0lPZmI4M2RmVzl1TDJramMvN3Yyd2EyeVkvVG12MFBLVERndkR6TDlhTmts?=
 =?utf-8?B?N09Ob0NudXZOaFFtc1I0cGowWXA5VkdxSjRGLzhhTjdtcXZ2aC9wTWEydVBF?=
 =?utf-8?B?N1gvc3NiclplVFlrQ1phdmxob010dGR1MXZzMnRia2pBUWVjVkp0QXRkbUhl?=
 =?utf-8?B?cEpGT3hYUjdZOUNhYnZGUEN4aDJyS0FFVVBUVk1uZlorMlRBQlVUU240SG5y?=
 =?utf-8?B?dW42cGZhcDZlZVYwTGYrcXFjMTZYbjJSaENnTjBiNUJQczVrSHBDSkt1cHVW?=
 =?utf-8?B?cTY4WjN6QTMrdzhiNkgxdHlNSUkzL003SElBTU9jWXpvS2dFeVY5ZWdyNS9T?=
 =?utf-8?B?amt5N3pCbnJydHkvMEFpRTdaYzNQTzZKN280TVQ1dVl5WjA5THJrdzJ2czZa?=
 =?utf-8?B?S0xJU1pMWVA1WnNQQjE3dE5uNGY1aGwralM4TE83UWlKY3dOZ3NjVFAzdVMy?=
 =?utf-8?B?eFMwWjRkZGVuSkt4dk1BZ1lCMHY2VUdveGkrVkFBUE94Z005bzhvVzRLdUlU?=
 =?utf-8?B?aFZvQUdtUnZsci9MRGVFVDJXdFMwazJHdm9uOWtGOHFYOHRuUU9jbkZmZGRa?=
 =?utf-8?B?MVZia1FNbHFVaE8wWHNFWkhaUnNvdURteEF4b0ovdkU4NUZmazVyejBoMlpK?=
 =?utf-8?B?aDZNL0dNV1AxdEJ1ZlNjSkFHTUcvUGQ2aGhlSEdyTXJZQ3dDUWhUTTZVa1dU?=
 =?utf-8?B?eVVodjk1am1xS25WUzBuVXE0L25ybWgwV01LcG1Yc0ZFTks3dmlWMVNRei9P?=
 =?utf-8?B?a3c5clJWZXVRcXZqekttS2QxdjRYd1FRT0VSeTNndkhpa3prL3UycTZOeWVu?=
 =?utf-8?B?NllaM2FaVXBnYzRZeHV6WU5rOGF6NGEyNjlkMG0zNHZTMDR4N1cveEVVK0o4?=
 =?utf-8?B?c1NyN1hPS25NYXVNK0MxcTNCUWh4dGd0NXp5eENuaWFoZ2tGMy9zaGlkczF1?=
 =?utf-8?B?ak9wVW1PSW9mNTVTWmQxNXNsLzFaSkJkL3dkLy9iMlpkR1F2OTBkWnNxUU5x?=
 =?utf-8?B?TkxlM21zLzdqdkZwTnJ2bEhITXdXZ1cyL1JXd3U2bmtBbURXSFFFZzNUUU5C?=
 =?utf-8?B?TkQ3Q0JSYVNsdjRCdVh1dEQxZ0oyN2ErR25jNXY5RURKQVZtYml0RXZsTWln?=
 =?utf-8?B?SnVuRCt1Wm9yVlhFREZISjI1TU1TUWJHclZuMThqaHBRdzhGbDhKaDlYVGtG?=
 =?utf-8?B?MGRtWmpmUUxVQng3Y2xDaEI1ZlNFc3c1WFlrNEQ5WE9BRlgyZ3Uvd0VwOXA1?=
 =?utf-8?B?Rm5KczN5OXhEM2NOSjN6ZTVaS1ZyNjJRL01qMmpFTDN4TDNLL0VNdExwOEVP?=
 =?utf-8?B?dEZhcXZaZ1lkYXhsUldMTU0rbXMyU25OeW8yNHkvVHd3R253RHF3RXM5OVYr?=
 =?utf-8?B?d1kxMG5uMFR3MlhlclozeWFZYWNYcnArTGNXbzgxaHdjNHdQQ3NzNG1HKzhX?=
 =?utf-8?B?V3g3alMvaiszcWdBM2c3ZFU4bUowSWhtV2ZOaUNZVmk2Q0I3TmFZd1VsZkVy?=
 =?utf-8?B?S0E0UUJ4bnJNeHBkb1NQZTI0VTJHVWN0RUVyeU9VSHVyV2tpWWZyWHZpM2Z4?=
 =?utf-8?B?SUttZ2ZqSFVKMWFzcURoczZuOGhwTkZUTDVBS3d0Y1UrNGtCbVFXWTJvL3M2?=
 =?utf-8?B?bUE3T0RmbTE2MHNDY2FaRWUwMEdTbzZ0VU9QZFVrcCtTSS9yTTNkbVVaVkda?=
 =?utf-8?B?dk9DeVJlODBMMlg3ckpFNGJGQkRoejZlWmJQUXJOemxGc0xTSTBpTkxXbnFI?=
 =?utf-8?B?VGszN0R1SVY4QmxLbmk3Wnh0aDhCRnp0bktxSm80SjUzM2ZEYWFWU2xCWTk2?=
 =?utf-8?B?RTdpVExueWlmNG9FWm52OW1yQll0SW1LZTRFYllXUTJlRjlNV2VwMDlWUjlY?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3290a81e-094e-43ca-6e50-08de0ce071ca
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:18:45.5971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0ByFMpYQttIVPJ7NTsU5Cu18qYlicr3ITN/98YWZ6+nF2TzBgoy1Us2TTNEN5bYs1urRwwu4oZWdamctWqGM2N6W0ZglLxSyJ/5/LvGqqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8375
X-OriginatorOrg: intel.com

--------------x8nmMhJsa1Sb3aBG12wbuqVk
Content-Type: multipart/mixed; boundary="------------sER0wlb0hE30v6CFWdmx2KZt";
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
Message-ID: <e20209b4-72d9-45a1-b40d-7e730484d896@intel.com>
Subject: Re: [PATCH net-next 5/6] net: renesas: rswitch: convert to
 ndo_hwtstamp API
References: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
 <20251016180727.3511399-6-vadim.fedorenko@linux.dev>
In-Reply-To: <20251016180727.3511399-6-vadim.fedorenko@linux.dev>

--------------sER0wlb0hE30v6CFWdmx2KZt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/16/2025 11:07 AM, Vadim Fedorenko wrote:
> Convert driver to use .ndo_hwtstamp_set()/.ndo_hwtstamp_get() callbacks=
=2E
> rswitch_eth_ioctl() becomes phy_do_ioctl_running(), remove it and
> replace .ndo_eth_ioctl callback with phy_do_ioctl_running().
>=20
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

--------------sER0wlb0hE30v6CFWdmx2KZt--

--------------x8nmMhJsa1Sb3aBG12wbuqVk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaPE3AwUDAAAAAAAKCRBqll0+bw8o6AWE
AQDVfojhUyvucrPFj9BYbiThMr6lI/12ZqZ0ShA8OWdX+QD/TPL9IFkYa+4j71y7vf4WT1zMaTOB
5zMzABqYDsruagA=
=iWuV
-----END PGP SIGNATURE-----

--------------x8nmMhJsa1Sb3aBG12wbuqVk--

