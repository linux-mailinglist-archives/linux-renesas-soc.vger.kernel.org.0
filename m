Return-Path: <linux-renesas-soc+bounces-23181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD006BE5082
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0D004857AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 18:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D082264C9;
	Thu, 16 Oct 2025 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yqj7lL4b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB27223DD1;
	Thu, 16 Oct 2025 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760638814; cv=fail; b=bBQryt4OWnpLPRzYpTUgsjJjkES4i9j/hbPW5wqqhLZJGTAqxl00OEdVcT93tCdE850ufqk7O3KcVBuJ4LtNttGH9F8D2mf8972RQSuYF9Xfx8k4VY8aSlfZbuUa9+4w5C0Gv0oM5JgchgBZ4gk+WxPwIo4ZkEiCSjA4ugiX8Ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760638814; c=relaxed/simple;
	bh=5weqk+GAPUT5qXc+Oq88JXIE8LWtHlWsiqc0vo9x7bI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Dmq6IrMpZ+p4gUduNbcsANAwEg/SQrSZcEvtnCK7zQOVq3Lzh6SvoM9oSIvcWVGBGLiZW/8AS7esBcZqS6txnZDY8nUWC32IOpNApfP6gRTukTmUMNNWKfYfCmRu0DBjFd8f1VX2qkt3PJZLd3yGzSSgIYvIw5RcCVRk/fUludI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yqj7lL4b; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760638814; x=1792174814;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=5weqk+GAPUT5qXc+Oq88JXIE8LWtHlWsiqc0vo9x7bI=;
  b=Yqj7lL4bHScpwrUPhgBUeRYUydvaV5RqSRHAzAQ3xLWbMSIaKD4T1EZj
   SNeR3WVQOowo5E8kmX7sODgvxi7SnYOvNVbqxLGRZyHZYw2G5HWS4JO4L
   s3A7pvTeSbN1gterSVzm+E0CE39XfOyXCH5ouGxXlTi6HxYh2+sQe0EWf
   UA2LsFbLlBR8ovkJjd6vVIXjDtrNxD5kqA2Qt/nMxsPoG6StCfK2puVcg
   DLzIzd+yA4E9dIJEn+uS6c4cKcr4ps2nCHFoOpeLsC1WabOsg8gWXiP3E
   P04pDiNPkCt7dOYnZvV5jYosvvEpuuYYuDSIDjUCyf3QxOvX/bCUaYIEB
   w==;
X-CSE-ConnectionGUID: i2Fm92G+R6abKXBfNrvr4A==
X-CSE-MsgGUID: VkSWrVj2R7Cg2p3N3wp6NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73959374"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="73959374"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:20:13 -0700
X-CSE-ConnectionGUID: jfwuIHDxSUuJYlN7VL9rFw==
X-CSE-MsgGUID: oRd4nAoLTAufraJrpmoycA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="219681763"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:20:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:20:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:20:11 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:20:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8mtAHMJ5YbN0hfSelUT1+mwKALb6U7mn9OQsy/plT86dy1uf1fWDrD4yZOKKvP2x0rTKpSK2ctm3NQnfKr3rJPkXuaOv/gs4y5n/hH/pVI38xJD/bRT92xZKsddsNUSldko2HB1OxWEO6N7mso+6lPx+hfl2mjGsqlKetchOV8Yj38uIQFge9LackBsL1NtUmV1psOIJ7kyHpNQaYfygh7wr/xieKxw48/XiRglaq5T7mOvcWuU/7Zq0M9gBCxGIpVONj0ENc8uNx5Zls7+GORpS9EXG3vthVikRo+w5P/nfDc1v3NINltOyHv/kUMBYOrynVFMllp5R4plvBd0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMicJtXaVu1Oxp9xp6+SoJ9z9DLg4L9q0MUiuSCK8LE=;
 b=s+vVvhnHCLcUSRqPWlCEurrAuKkxzjn3PMrRvEuYDwBD/oq6bQsadMdbbDwc42eEq5IBvZposCo99qfl5RAysnFKlLpoyVza6HwygIkSQBFFIt54QqXS34LeDhR0npImdWy5vf6bKi8WccHSLLhMf3bCvY9nVbiz3ZEgu431hv8nYe6BZgtI7xXoETBWRrU0JuPHoRBMnLvwjHUHmOn90OhO0nOrTUr5vB89GghG48GW8Pf25GIxQur+W1tXReGck1ch+xP4dhqeE0cXWmidc9z4o98Ukjruarx8mD5xWNUgFjRTUN+Teznh7GEP83D3AP3q8UZ8gkFvFxcEiMB1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by SA1PR11MB8375.namprd11.prod.outlook.com (2603:10b6:806:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 18:20:08 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 18:20:08 +0000
Message-ID: <c55e030b-e42e-4589-968c-e1cbb8218aca@intel.com>
Date: Thu, 16 Oct 2025 11:20:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/6] convert net drivers to ndo_hwtstamp API part
 2
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
In-Reply-To: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------4ZP4bYemm1yklCpJAJZL8pZR"
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|SA1PR11MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c983e64-6a4a-47ac-b71e-08de0ce0a2f3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlE0RUxjZzZzcmc1M0cxTldNSjBqdzRlTjNxc0MydmhLYW1YeFk2N3hNSUNl?=
 =?utf-8?B?SnJvcEZ5OUJuOStZK1M1UHJXRUI4MEVKOFY2c1RBdzRYVEZDOWJKZE10d3FU?=
 =?utf-8?B?ZVMzdFZLcStvdzNJTnh1TlpqVUlhaFZqWUdwWTJvc01TU0h4QWxqWEt1TVlT?=
 =?utf-8?B?ZElHODZla0l3U0FjTVVJcGVRUVJmeFd3ZUwzLzgvRlg2c3ZPRjJRbzhESVEz?=
 =?utf-8?B?NGZWa1VFQ1JKK3pZK3gvUFN6TjgvOTB5UkV2L0dPaEM0SHJsOS83VDE3TXJS?=
 =?utf-8?B?NlRSL1Z4djMvR0ZxaUdzU3praXAwUG5zNXZTU3VLejJFbVAwSGV2aXJSdWZ2?=
 =?utf-8?B?OVVoSU1yMTdIUmtYbC9sdnA3WEg2ZkFqLzhDNTBrZTRQbzFhdkxkR1JLOTFo?=
 =?utf-8?B?SXlHb28vUGJXMnY0aFlsTXpMUDE5NE1mVkhEVVNYRGoyNE5tbVNOL3VqNm9h?=
 =?utf-8?B?aXNLU1Z5bmZQVVEzdjZXNmJPUW95UGVzMU5lN2wzTEtBd1RMbnBPYWs2aTFX?=
 =?utf-8?B?Szk1RHNKMjdnNDdhc3I4YWhqOEFDaWpHcWVFTzJoWmVKeGxoaXpJdkxLUXpL?=
 =?utf-8?B?YUpQSWVXUkc0c29vOC9rdzJTZUZXNm1QcldlamVOQWY2elBqYTFUVmdLZHBt?=
 =?utf-8?B?b25BNlpZYnRjRktuSUhQdnNxR2ZIT1N2Q0hBMCtDS2ZWVDlHb25NQ1lTN3hP?=
 =?utf-8?B?TG8rYnVpcUhaTU5mWFk4QWpob3hybU4zcXZFL1FVelQ1WU5MOGpnZ01CTHZD?=
 =?utf-8?B?eVZDUnB4MmxwdDdxZkVqa0NZQ0w0b2RZKzE5Z2FGVS9oOHhNK2hPZ3ZCUWZq?=
 =?utf-8?B?SGdnM3kwdUx4MStxR1hVaUJrSTlORGZ4dWdlQlBWUmhZbS9sSkdNdFY4K2ZR?=
 =?utf-8?B?em9xRUNEWjluWjFqYVdyN3BjV2Z5bURPc0ZDd0JJb1p4WFl1cENHWE9ibUNl?=
 =?utf-8?B?NzkrWlMzUDczMjllOEI4bFRjT3BSY3ZjbmE2b0NnWno4WHJhaFpiRnIzeFFy?=
 =?utf-8?B?QTdGb0Mva1NOdi9rZkhaYWk0NEQvdjhGQkt5YkxVMS9hSGJHSSs0NTdBUEF5?=
 =?utf-8?B?T2RWVVFtU2lFN1dQN0syMDlwbzFDcUNhNFptV2Y3ZkozUUdjZ3ZvazFDRDNF?=
 =?utf-8?B?L2trUi9ieFpEZ0hiL3NwRGlWQXgzWEtTRkx3MUd2VitDRW50UGZiNDhNdWND?=
 =?utf-8?B?M1ZLSXgwQThhME1RMC9JbFJWSEE3VUJnQk91dTFDRWZ4QmxsUnNFNmRqWG5v?=
 =?utf-8?B?WHlRelBScExuV0VZYkhsWGhRcmltNWxQTmZEcktOc0xWeDJRcEw4ZTlCRldk?=
 =?utf-8?B?S3hJL0xQUUN3N0tIZHZNSHhaZ3VZVGJ1ZnBrZ2RZWm1kcFVjTWdlOENVZEVL?=
 =?utf-8?B?ZS8xYlRIZ1o1VFd0K3c2bU5QdmV2RytnbldTd2dJL1VlOUlHVTZVOGt5eDhF?=
 =?utf-8?B?ajNFSk9VWm5sNU1OTGlaNEhNVGYvb0ZJSVVOK09XRzhOSVhmZFFSWWd1QnJQ?=
 =?utf-8?B?Yit5c3FrTnZkeXZtcWRybHJCb0lOaWcvdG1INUtqQjRpak1XaUljeG00a05Z?=
 =?utf-8?B?VUtvbnlTa3JaY1ZHOG5Gd0RZeFd1OS92YnF2Tmx6TkcvQ09QdkwwZThCN3RU?=
 =?utf-8?B?MHNTQTBxVUVVS1UxOUc4WHBidHFtS2E5RlVHV05qSGwxazEzMytWOWQrZTlu?=
 =?utf-8?B?cUxMZWpFTXJqR0NFN0Y1NVJqSks2M042cEJBZXNwRVA2SXpOMjQ5blBmZ3Nk?=
 =?utf-8?B?a1pNT01VODRqSEpST3FGR05mYnhvM1FCR093TlBwV2VaT0l3MlZpdWh6SDMz?=
 =?utf-8?B?MzQwVmV2MXcrdk9Jb0ZsVUtJRFZxQ2tXMGd4NG1MZ1BRZHJTZHhpMnRJdHVa?=
 =?utf-8?B?bmYvdFoxWlliZXMxOVU0RTVoUW9OVWpUY1pabFJxUFpBZEwvU0dhRDdZMTcr?=
 =?utf-8?B?ejlIRVJFbDBtUGZKd2U5VFVGNjFvb1FMb1FDclFNWjVSMVFxNWV2ekhxVm1N?=
 =?utf-8?Q?fy5mYw7Yy+bXHDljqMZZbetJlUWi7o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFBaN0RmcnYyZDh3Z2ROd2ZCdTJTRG10VGU3cm8xUXpHZjV6TFRhWWV4YXgz?=
 =?utf-8?B?NGtiMHpQWEtFS2orY2RIaStvbXRmYWFGdkQrZ2VoYXNYSG9RTStlajdRSjMw?=
 =?utf-8?B?VFJEdjBHemRSREN6d0oxKzl5TmNQMEFtN01HRDZYcDA2SEhQcnFXN2pKdFdW?=
 =?utf-8?B?eWJIZDgvM1FKUzRHRWFpSGZiNUllbDYwZFA4T2h0amI0RFZ1VmdHem9Nb0Er?=
 =?utf-8?B?UVlad0FIYTByZ1pIVEJ6cWpaU0JSVjNWQTh5ektKam5lN01FUXFJc2xlaDc4?=
 =?utf-8?B?WlBINmRJMnRLZDUrdGdiM2FtaVpLZVBZS0FCMzdORzQ0bForb1N0dnM0MjNK?=
 =?utf-8?B?OStsVFNuS2xsL01Qc3hUYm5iYmJxNWlIY09HRzlMR25wUkh4VlZSY1pyRUF1?=
 =?utf-8?B?dHB4aFM4SUg0ZU5IMlhNd3FPTmJoLzh2VEo4OHI4eW0yZ09KTFJsR1lSc2Vt?=
 =?utf-8?B?Qkg1UStENVBEcTRBYUw3SXE5R1BTSnF3NTU2Tm8zKzc5ZVRVNWcwdU9lK0Ji?=
 =?utf-8?B?K0t0NHptS3kwejdFMDdwYU9KeHhoK1VZd2Y0TWlpcHRyMTJtQW9oVUJOYWV4?=
 =?utf-8?B?cEdDSkp2S0hlSHl3V1ROd0NSeXd5K201ZzFjNHNaWEVYdnJsREtQcDhRcTBE?=
 =?utf-8?B?dTFqTU9may9CRGR6dkFadVVqSlN6MWRUeHZZdnZWQVozUWRZS3lrNmF0NUd5?=
 =?utf-8?B?aFJYT3RnUEdQQ2ZNdHFFQ01JYnNHQXh2VldBeGFOWW82bXMrMHFtVlJLNWVo?=
 =?utf-8?B?enhOYlVwZEZJN2ZRUUh4ZmtvRE41QXN2aUprRkpWc3RzVFUvdjNocWRYdVhi?=
 =?utf-8?B?MUY2QUM5WXVkLzRKZy9sS25uanljcGcwN2YyQW15cmNNY0tZdzRUUE4yRm1P?=
 =?utf-8?B?QS9xUXkrVy9WUHRzUHdQQm5mNEJyWW9TYnpkeWNMSGZzZUZpdks2cGY0elZl?=
 =?utf-8?B?R3d2aUhtZjhjSnNTNmowR2RQSGxhaEtnMkxhTExDNXAwRmRNZVdoRzNQMXJu?=
 =?utf-8?B?WTBFWE42U0FYVFM0RDlSbjVYOXRmMk5jM2hBYVlJYy9mekNNb3JRRU9USmhT?=
 =?utf-8?B?dXZhZGpkN2d3MHFsSW50RkdCYlRreHhtbW0xa04rVDk5RGJoc1pId2E5Wm1k?=
 =?utf-8?B?ZlFMTlV3UDVnVEVjSXlwMlp2L1VGYTZYbTJoUmQ3anBRT24wRjNwTjlDaVls?=
 =?utf-8?B?VnVCaTlDVTR2a3gxbXZ3SkVvZHRpU1ZpbHRNYXI4Y2pyNTRzS2ZjMmdheVRk?=
 =?utf-8?B?ZkE4ZWR5OENzM1ZDc1FxaDZBb240SzRScHNVUlZFcDdickZZNlRLQkxXdWE3?=
 =?utf-8?B?Z2hzSXRmTFliUG9PcklTZFBnbUJOUWpZU1prT3RkNStNTW9meS9USnF4REpn?=
 =?utf-8?B?RWRpcldWN2RIWFVQaFAzdmY2cGtWZ1FRSGNYZlU5VWtlREQybUs0TUdodXB6?=
 =?utf-8?B?Z1FyQURKMEJnZWR4WmlvUUowbnN4S1lSMVNqSEJjOTFwQmdLZmYvZER4OVNa?=
 =?utf-8?B?TG1DVC9QY0V0MkNBTTI5V2ZSWmRMTE02dHVORjRKejVpc2kyV1huQjZ3c0p3?=
 =?utf-8?B?MWFZcDZkYnYzYytVZUYxRDNBZzJUd3Z4UHRraWZiQTVsakR1RUhMV0J1Qjhi?=
 =?utf-8?B?UHlZZE04RXJFMldQanhYYW50ZEVSMkdDbFAwK1k2dklFKy9XVFZ4MWlPZlh4?=
 =?utf-8?B?OGRvWlFrRW1HWWphc25IVzRNQmYzMER5V09qZDhVeEdoTkEwbURwWmt6QjJy?=
 =?utf-8?B?QkFiZU5hWE42c051T1RSY0ltTHZVNjBHK1FzTzNxL0VUemtkU29PaG51dmla?=
 =?utf-8?B?TUZaOWpIbWxBeFhncGdBYWpTdXliTWRXd1EwMUZrRUR3SEpWUkRwTkFqaE5X?=
 =?utf-8?B?emkvUXM0OE1tY0ZKTzV1YjZLYUwvUUdpa294bmhEZU04RVEwUDVGUU92VWxq?=
 =?utf-8?B?WjQzaGRURzJnNjJHNitSNlRNQ2tGQmJWYlBhVGgrSVFiSFJaTjhnNTRuYTNp?=
 =?utf-8?B?RGRWV1dwM01YQmh5WEFHeU5GUDdhM2tWU3U1T2grVEpBQWJMZi9UZFplWGdy?=
 =?utf-8?B?MWwxZGZMTkw2bGxqSUg1azBSLzdST2VvNmpidHNvcklTaEZtODhST0EzZUlI?=
 =?utf-8?B?dXVIRzA5WXhzcGcvZ2ZHdCtpN1FnbTcrMHp2RUNOSy9mR3B2NEJKQWt5UG9w?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c983e64-6a4a-47ac-b71e-08de0ce0a2f3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:20:08.0693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXGEH2GMCig8XBLWL3xuSekznWxQaHQiVR9vgtFIO48F1E3StU7pHv2EvUppmgIRyg5xKS/bdLg/lUScYkyOK4CvaJNIQ3TMzvQfZSmwUV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8375
X-OriginatorOrg: intel.com

--------------4ZP4bYemm1yklCpJAJZL8pZR
Content-Type: multipart/mixed; boundary="------------sxOSnptBocBO6ofKoyra7NS3";
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
Message-ID: <c55e030b-e42e-4589-968c-e1cbb8218aca@intel.com>
Subject: Re: [PATCH net-next 0/6] convert net drivers to ndo_hwtstamp API part
 2
References: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
In-Reply-To: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>

--------------sxOSnptBocBO6ofKoyra7NS3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/16/2025 11:07 AM, Vadim Fedorenko wrote:
> This is part 2 of patchset to convert drivers which support HW=20
> timestamping to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
> The new API uses netlink to communicate with user-space and have some
> test coverage.
>=20
> Vadim Fedorenko (6):
>   octeontx2: convert to ndo_hwtstamp API
>   mlx4: convert to ndo_hwtstamp API
>   ionic: convert to ndo_hwtstamp API
>   net: ravb: convert to ndo_hwtstamp API
>   net: renesas: rswitch: convert to ndo_hwtstamp API
>   net: hns3: add hwtstamp_get/hwtstamp_set ops
>=20
Thanks for doing this (often under appreciated) skunk work to follow
through on cleanup of the old interface.

Regards,
Jake

--------------sxOSnptBocBO6ofKoyra7NS3--

--------------4ZP4bYemm1yklCpJAJZL8pZR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaPE3VQUDAAAAAAAKCRBqll0+bw8o6LLC
AQDV94+nY6msm3ev6aaMqhKbQ88Hf6rjfppbzMvw3DBfRwEA3wRTu2sCvNoNm/gRJwW3nrcOEXRk
w5Cmkw58TVQRlw4=
=SsHV
-----END PGP SIGNATURE-----

--------------4ZP4bYemm1yklCpJAJZL8pZR--

