Return-Path: <linux-renesas-soc+bounces-23175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EFFBE504F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FFB519A70B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 18:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F95221726;
	Thu, 16 Oct 2025 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDcopXAC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02C1E47C5;
	Thu, 16 Oct 2025 18:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760638595; cv=fail; b=pPOjVmgmtDDz9LlXNyF6I+9TUskoWms65VxX8PYf4J/0ArUUMWT2wEr/EmrcCNt1+qR99IIPhxIKmfObylIIu9lDYjnfU+cNSeGqdp7cVYfAqZQdUEFmxQpdJffeqZuhFVQthBtBTcR9IRjT6WLG6VLKWQV2cE7HV96sE45gT8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760638595; c=relaxed/simple;
	bh=uqwHWZvzGaJDQx5tZpZqYWkHtbesX4qYlqdIGgavzhQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DlFrj1CacutAvNlLx3FsVt1KTci0UcH+wjjc86qY6Y5uQA1amPvv6cLZwsWgM5xaMvz0uUEFYNRU6OmnUnoHRKQfy3f2ojBlgJZV/F8s8cy70RfrFSXnUYaHMS/Lam5Rh+SALkWmmHADEoUBVZhaaRm9pXxOmMRRtJ/1oacWfmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDcopXAC; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760638594; x=1792174594;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=uqwHWZvzGaJDQx5tZpZqYWkHtbesX4qYlqdIGgavzhQ=;
  b=fDcopXACdywOw4jOTo5k9KKZt5bfYLd1F6M8ItyePQyLjnNYlgsy/JtU
   hYd+A+/1wTic9tiRPsYOhPeAWZk+jX1IlUJvk/9G45xIKxjkpTwH3qsO4
   i9zvyrCREI4DxgPl2qIeMPB2NzQXkfbpcKk1/3NT6vbyAa48GM+KS1+E+
   t5Y+eZQDoEAji0un4BgiNFHuORHwhqeBKTt6EVt2NCnCknra8BUr6Ifsl
   DxceKNr6zA/KKCksJ2oAYfb9BZMPgRrAne54+hydLmQ5E3R4NbML0t8o/
   vyqcuAjG7JgIeCzH15HqeEiUpDQUJWdw/6vLwsN5E8xAJuEX6ChXyC4Jg
   w==;
X-CSE-ConnectionGUID: O0491XCyTz+Hr9SSuyvBPg==
X-CSE-MsgGUID: xQNVxegeQ5e9rgXyR/jmYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62054514"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="62054514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:16:32 -0700
X-CSE-ConnectionGUID: ssC1kPd9SzmK8amyViQ7lA==
X-CSE-MsgGUID: aX8vd7EwT8SYjMu6Ktb4Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="asc'?scan'208";a="182504382"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:16:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:16:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:16:31 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkGc0q0MUf4U/PuoznOg2mHO0zf3Q2H7Hd51nHL18e/kSYccBroG+GSe7PoHyI0nA1g0S6+tlIxZdCk1nQrBmIuTBrwbkCXwS3Zz10uQlgEi8CoHGFwS/eDnqw/MqGyjctnS+V7QotgKzHX36xUJhkw/5qgqgv7FYziR7sWMbsncqx0WTKqcI3D3W31B1c4mryEkBe9h/RZBAXWryMUOnrnKuf0XgX+iIr0k4ILFvuAX45h+6A4uZdcqbxV89tVRFc1Jv6eG7bHeeV16euc6kS6At296ewY7aIimZ8lZ5nvOEziMxiuyxh+d86mWR7H+Ysp+titSaGQlzLeZhATarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sABLUAbpiZpLhcPr0NhMlzr8UNYQ8e1UE9bfhJ89Xiw=;
 b=jam3iAAJvIoIlLyuOT4y+pz2jRNrn9aAQQ9OEfxEwMmt/RqJqAXFYmSwH1jZERztz4RPI5mj2WpwDOBKvLQ8WBfS9dSzS8EDR9a2rmhYJ8l7Q9fvqDfa6FSb3jW/6FHNNEH+kTtX2LRkLJfg8l5eK8SKp85y6lokl44JchYdMu678xaZXGIiBNzDX4hSGESNQk235+2u9SpLFqwMo0R2jdeLUqhgGMXs0jYA6bVdhJBDv7I3yIxP36bLOKS98YTqARJwU6mhT2kFZ7dgt2wT7IGV2oRLM6ocD4tF6JlOCeBqm/98kckh58LVaffIBx3jKdnrBvI3VHhF/rfuC5C3Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 18:16:10 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 18:16:09 +0000
Message-ID: <4ff8af85-85d7-4add-8ce1-2629945e193b@intel.com>
Date: Thu, 16 Oct 2025 11:16:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] mlx4: convert to ndo_hwtstamp API
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
 <20251016180727.3511399-3-vadim.fedorenko@linux.dev>
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
In-Reply-To: <20251016180727.3511399-3-vadim.fedorenko@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------jOUsOj000ZUOvT64Zf0tEbxm"
X-ClientProxiedBy: MW4P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::31) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|DS4PPF07B018B9F:EE_
X-MS-Office365-Filtering-Correlation-Id: 10fc232f-097d-4dc8-a473-08de0ce01460
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZURBMnNKS2tkNHhKT2JtSEFyc29iQVk1VkU4U3pRVEx6TXZzaEhPbnEyU2tR?=
 =?utf-8?B?NzlpTHl2N0dQek1DZzhjWDZKVk9WY1Npakp6UWFkYVZScjhaeVpveEdmTlg1?=
 =?utf-8?B?amVuWFB0anRnYVNPY1RNUUg2NEgrY1BPZlB5ajRTdU9PeXQwVTNZeGc2QkZo?=
 =?utf-8?B?ck5NNDBtS25ZTGFtUmd1dGxVMmNSSXNIdjJjQVppUythbTBsVEU5bTZRQ2s2?=
 =?utf-8?B?cTMyd0V0cHdCN3FNRzJYcWoydzB3c3lidWh0aTkxaGpNZTRDZGlFRUJBbC95?=
 =?utf-8?B?b1RVK2hOVGhRUDAxd29EYWFLaUM3SkQ5UnFJQjdNT0V6amxvOXVtK3hMTHp0?=
 =?utf-8?B?cUFxNFpTbTNaOVdQSmEvS1ZvZFUrSVk3L0dON3VjWWpvTzJIOW9uZCszMGVO?=
 =?utf-8?B?b3VETU1hWDJMU0VEVi9SZWRsWGoyZzFXOGxOOE5LaHVUdSs2TU0zZnM0N3pq?=
 =?utf-8?B?TlExdis2WU95ZmhrWDQ2SnJsN3dwMGtjakx3U2R0NlpHYmFDVGdjZlNPY0FG?=
 =?utf-8?B?cFVHdm1kb2I5YzR1M0hqUHJaQVRHaU5wVnVnNGRvOFBYQUlNWXdIQzhDTVBE?=
 =?utf-8?B?aHI5VXJ0LzZUQlpQYkJxaXp2RzJ2YU5wNDZqSkw3WU0va0g1Q2E4RUJEc1ZC?=
 =?utf-8?B?RCtqNzlhdGRtWURKOXEwYmljOWZ5c0FVS3BKTDhLRUdzMy9tcVFiK3drc3dZ?=
 =?utf-8?B?UC83VkxaV0hyK2xvQWtLNmdVMThKa05PS3h2anNXNWd0RE5PNFdkODlITjJu?=
 =?utf-8?B?SFBCQ2I3RkM5Q0FtRk9aVDNCbUpoTC9KYitHeDJMVW95YzZleVl2R2Z0T24w?=
 =?utf-8?B?UXVvV0JydkprcWdTRWY5SHNKTmRwWjlsS2k1SUY0ZGNBZklMMmRCalRiTDRN?=
 =?utf-8?B?Z3JJV3lRNnV4MkR3bkZydlIxUVUzVis4RW1ucVhIaHA0Ti9FUGJLc0NrK1kv?=
 =?utf-8?B?NE1maEZiQnZFQzlxdlE4alpkamFGY3V3WmxlU1ZWbk9uclErSnZ4cnczb2Mv?=
 =?utf-8?B?Y2dobE9HU3lSZjkvTUZ3Y0d3VWQ4ZGY1YVIzQmxURk85RzJIMnZuU0xDRmVq?=
 =?utf-8?B?a2ppTVVScGF6VGtiK05xZlVrRlF2b3E1ZFpOS2srNG5XTng2bU9PeEFtVGha?=
 =?utf-8?B?dCtaZVA5eFJMTVZUbUt0NFZVZVlpZ2hSNWRmUUNQcDRZMW1mcjFicytrTnlU?=
 =?utf-8?B?RlNxV243QjFyY3BWODZzOUVhdGlrMGJYeU5OLzJzdTBGckhmeEFyU2c0a29X?=
 =?utf-8?B?aU56ajN0ZkNLZWlYbStEeGIyeUM1bitDSUt0eUlTUzJDUldiOGZVamUxYXBU?=
 =?utf-8?B?SjRoOFd4YW01MlFWQW8zZHZQSmY1YWNLT28xV0EycFYrdTdYREplLytrWFpx?=
 =?utf-8?B?aDlmdWE3Qnp2QUt6eU1uWHRlNENzTUdLYXdjKzVOcDdqRlJFblZZbTJPVWlB?=
 =?utf-8?B?ZzdGQ3poWVVuSmFvcTdqcXBhRE1zTjl2QW1WaEhlakFlZU12NnVGRlFCMnEr?=
 =?utf-8?B?d2Y2OHljNTVwWFQ4cUNmbnhWdG9FWEFJWEJjMUtiUWMwUkRnMTBwbGdZQXlv?=
 =?utf-8?B?VmxEQzVMek0za2VpT3dsRE5Mc3lydDZ2N3ViOEJuTDRUa1orOTNPOXlucDM5?=
 =?utf-8?B?bEUwTHlxMjFrTHViRitzZm5RZU9sYTdqOXBmUmd4TE9UbzU2aGdnNXdmN0JQ?=
 =?utf-8?B?eW9yNHFPRTRxYVBOUzAySU56d2xZK0F3ZEQxejZ6dnM5OS9qYjBrZitPTzEw?=
 =?utf-8?B?cW5jOUlucjN5M3d3MW1PaGV1Z1NodkM5dXV0Vkh2UkF3MmhrdGxMVHI1WlYw?=
 =?utf-8?B?dEFZSENycnpYUTF2Z1VNcHBTWUZabGU0cGxld2prSmQzblZkeWRLc1ZWVjd2?=
 =?utf-8?B?WldaMWhJTFRra2hZMk9wVFZNaGs3Z0w5VGRZcGVJR3RWYWZPNGxrY1ptaTRL?=
 =?utf-8?B?bkFPNTZyT2cxaGMxWVNjVXlUejNVV0syVDE0N25DNjgvZHVxMkpuWWdrTERh?=
 =?utf-8?Q?E01igPZWhf0PcwNFJmba8inaigfD3A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXNLRm5CZDNmTFVIaWRFUlNidDRYME5OWGJGd2JYQ09tT3hzWFgyMktPVHl3?=
 =?utf-8?B?KzJMNWpPNVhSdU9wMGtzMjZRTkJ6OUY4QnYrVG5vOFRFYzNmRGs2SWI3ZW5E?=
 =?utf-8?B?SmF5azlZeU1adlFkUzZjbFF2bUZiU3pidzZFbkVjU1hSK05FQzJOLzRkeW5T?=
 =?utf-8?B?TWpZTTA0bVBEZmNHdTZPRlJNeE11ajkzdzcvRE9jTlpPM2ZwMmpKQkxJS2JG?=
 =?utf-8?B?SXFrRnpoNW43enM2SC91UlJGNHNXS3RyU0lyK1NFV3RpZU83UjU0OXd2c1FG?=
 =?utf-8?B?dWZ5a2tkMnkvRWJzVWdUQTNGNTVkVjBHRTM1RGZwTUxRK0NUbVVTeHV3alIz?=
 =?utf-8?B?NmpsVzRzdEpHcDYvajN3NVdVTThEbWpzTmo5QmhNUUxjVXJtc0NPNEwwWUxT?=
 =?utf-8?B?NUtwVXFBdjg1YjFXNWErckdyOWJIZ3RGcmphM2ZaR0xqWCtkVUtNaEYwcXQ4?=
 =?utf-8?B?b1FEdXdZenZrTEpxWWZ1R2dlNE1taThabElxMVlWWEMwMzdSSmdpWUxxU0NV?=
 =?utf-8?B?VmlMRVNLYVR0aTl6YnRMQXFlalF2bC8xTHZSRUxlWEt4aiswZm1ETVRYT01K?=
 =?utf-8?B?T3lyR1ZJOFI0ekdXU1NQWXNZOGh4R3d2RUd4Z0kyVkIvVDNhUlBtVWQycU44?=
 =?utf-8?B?L004blh4aFpzeUUreFRvemd5VHRkdytlVE5LSEFLbXRra0pKM1E2OENpN1RJ?=
 =?utf-8?B?dFZsSUpVZW5iT3lsSCsrWS9oaEpRNE1yd0M1UjlJQ0wrNlU1TGUrMHUyMXRQ?=
 =?utf-8?B?cmhLTW1rS2NjNG80Rzc0WUpEZUNac3JGYUVON1VvOUxxN3JKWHVIc2tRbWVH?=
 =?utf-8?B?NWZXQ3lpK3BFT3pEeW9veU9FN293dXEzMExPTTQ5WmlhNEFFMEw4My9XRENL?=
 =?utf-8?B?ZmdhMm5TUlFtMm9tTHkydzg5dUxIM2hmcHpRSVdQb2dsNzh2NTRGUGhTSGlV?=
 =?utf-8?B?cmtUWjhxc1FJNEZDcjBCNmF3ZGxPN2ZmL2IvWDlpNVRGc01Tc1VCempobjRq?=
 =?utf-8?B?czNiM2c4dHNCYzdNdEJRYUVnRFpEeW04TEpHM1RGNmk0RXRqc3M3MzhpTHYv?=
 =?utf-8?B?TG9UOG5hNmt0a3dmVWpWNFU3elpnOXNuTlA1M0J4NExqSVVhck5CVkQzc3VO?=
 =?utf-8?B?UzBtQjFlSHZmOGRNSW1uSGpoMThaTWc5R1p6NTJ1eUozS2ppcWgxUE1NdGxV?=
 =?utf-8?B?OGcwNmxpQkhYMUEwLzk1MVd4UGI3REhSbXQyTDRXQXM2QWZLZ2NBeDA5eGdq?=
 =?utf-8?B?QlMzRktLWlVRNjFwNWlMaFpwamo1dnhWOHNiaUNuSjREbkZvc2QrNThubGtq?=
 =?utf-8?B?S0JXdm8zamZxVE9aOGhDeHgvWUI4SXc3NXJOOVZER3dmbFhsUjNIR3FTOGZ3?=
 =?utf-8?B?T21GaFZTQzZDd3dNRnpvY0hCK2d5a09STkZaaHRBTmt3OFEzSldERG1ldXB4?=
 =?utf-8?B?Q0s3Zm9KRmkwTXdPYUZiRUtSNmJhN245KzB0cURzajNRK1ZndnlNYWhOT2tq?=
 =?utf-8?B?OG1yYjZOQW1HbUZUYnM2d0JRaHY0QkpYNWxEMGdaUEp1dG9IbnEzcENjanU5?=
 =?utf-8?B?emhqdFFnZHFOYkNmQzZhYmMvcFpLVFNpU0lqN0lpU3RiY2g2V0UrTSt0Q21j?=
 =?utf-8?B?cCtVbC9LKy84bWtIQ0E4b2lrc0pSMEhqbVowN1YxeUxab1RTdEdZSnFoVDZ2?=
 =?utf-8?B?MGFiOFBOUVdMVWdscndHeDdRNTUvdThvMHU2c1g1MGIwSWtDZWI2WlVaMU1K?=
 =?utf-8?B?cUFQNjVNb29OMUxRUGQ4Y2NFQTVaQlR4OWY0c3djWDJ5dDNCWjA4dUJVMlNP?=
 =?utf-8?B?enJqeC9qVTI3SWRzNFAvKzlpZGNsRjhxbFp5eVFWY0VXMCt2M1dhYThWcTR3?=
 =?utf-8?B?YzdrelNkMi8yU2VBSG9hcno5dGxJdWdhZTB0Y25KZkhWcmNkdnFzV3YvVGlm?=
 =?utf-8?B?RWx2TkJpeEJ1UFkwY1JEUUc5OWszMHVaaEhUNVJIb0Q3ZTFPTElLeDM2Q3dk?=
 =?utf-8?B?N29ZdzZKY2ZoRjNHbXQyeURKQjdxRldmUllaTHpHc1kzQ2hVUUw5T0dYeUR6?=
 =?utf-8?B?OUZtbnB2c0dUUkRBRUtPZXQ4ZHhDaHFldS9hTjlsWitOWWc2UnE4STRLcUJC?=
 =?utf-8?B?M1lxa2x0N2VUZXBPL3BFem5ySWRmeEpCSis2NmRnUWF6N0VSdG9OSVZpQ2Ri?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fc232f-097d-4dc8-a473-08de0ce01460
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:16:08.9394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlO0IjpXwMRFgkcJ+pQuiHj4IkeaYTXsSfGwRmS311uRtAj/KXExzjWihwqmv4AtsgM5Cty8a2YirZk1yznSCLKulYookVBrRMGxdigfxAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF07B018B9F
X-OriginatorOrg: intel.com

--------------jOUsOj000ZUOvT64Zf0tEbxm
Content-Type: multipart/mixed; boundary="------------9wrEkX5eYar2qncVtQd9VGTb";
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
Message-ID: <4ff8af85-85d7-4add-8ce1-2629945e193b@intel.com>
Subject: Re: [PATCH net-next 2/6] mlx4: convert to ndo_hwtstamp API
References: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
 <20251016180727.3511399-3-vadim.fedorenko@linux.dev>
In-Reply-To: <20251016180727.3511399-3-vadim.fedorenko@linux.dev>

--------------9wrEkX5eYar2qncVtQd9VGTb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 10/16/2025 11:07 AM, Vadim Fedorenko wrote:
 > -static int mlx4_en_hwtstamp_get(struct net_device *dev, struct ifreq
*ifr)
> +static int mlx4_en_hwtstamp_get(struct net_device *dev,
> +				struct kernel_hwtstamp_config *config)
>  {
>  	struct mlx4_en_priv *priv =3D netdev_priv(dev);
> =20
> -	return copy_to_user(ifr->ifr_data, &priv->hwtstamp_config,
> -			    sizeof(priv->hwtstamp_config)) ? -EFAULT : 0;
> -}
> -
> -static int mlx4_en_ioctl(struct net_device *dev, struct ifreq *ifr, in=
t cmd)
> -{
> -	switch (cmd) {
> -	case SIOCSHWTSTAMP:
> -		return mlx4_en_hwtstamp_set(dev, ifr);
> -	case SIOCGHWTSTAMP:
> -		return mlx4_en_hwtstamp_get(dev, ifr);
> -	default:
> -		return -EOPNOTSUPP;
> -	}
> +	*config =3D priv->hwtstamp_config;
> +	return 0;
>  }

The diff looked very odd here initially because I was confused why
mlx4_en_ioctl wasn't removed. But its just an artifact of the way diff
algorithm works and not being code-aware.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>


--------------9wrEkX5eYar2qncVtQd9VGTb--

--------------jOUsOj000ZUOvT64Zf0tEbxm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaPE2ZwUDAAAAAAAKCRBqll0+bw8o6Avp
APwPEc1yfUzqHr5NGvB1S8We79KXhczKbnmqMvOVBI/3wQEA0p9kV72chJxPqQ+PQCDEjHgKmxo0
Jl+dhjW+rsfxVAA=
=Ybu+
-----END PGP SIGNATURE-----

--------------jOUsOj000ZUOvT64Zf0tEbxm--

