Return-Path: <linux-renesas-soc+bounces-14303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CE0A5D53C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 06:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFDCC169060
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 05:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6D71DB148;
	Wed, 12 Mar 2025 05:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acxeQdZj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C31D3595E;
	Wed, 12 Mar 2025 05:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741755793; cv=fail; b=KhGKRrx1oeqsirzC5SlotbmhRZgcUjXnfmtBmg+XaqH/6wasB7YQucYyfhtliMc/oCM/hayZkBb30D0oK/FQTxvNcC+zJmdXBYiV+MpWInCdwmhicu45LwAiIMNBP4Nec9AYzbT73IpJaEyUTUCwrtzkypS0ByFF8Px4ktVqOH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741755793; c=relaxed/simple;
	bh=hOSST4trSNb229GgN3R5CIuSPp7MHzTbGvfLHC8czKA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j5Q0Lr5nMmtdPEBixtHYFoMV4NvqGcMBqY4lZhN8kt3gbdyBizGwI3F2ztkrtE7dCZBe6EH1DVTLaBwGIzDEOqRGPwin26OkWd8OcD0HMrDtC26HikMLrnf32tktIF9PKTuuM9/uteuMQSlC1VMCwKx0SgQIl0GDcayEizI7GSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acxeQdZj; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741755791; x=1773291791;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hOSST4trSNb229GgN3R5CIuSPp7MHzTbGvfLHC8czKA=;
  b=acxeQdZjtI4FqJFsE2qwoPITWq05a1hBwZJ2tjZrEIVAZPkk18eEHuTo
   jmKvaK6p6d5RG8CVeSlCTkfDLXKAVlVPbVanz1Mge2SAIjtqg9D0UriD1
   111aHnt5hKeCglQ9KK6eK3FymkIRTJ1IUuK9dxeBs1hHhSTbI667nriIO
   4mcIhc+qabyBn+TwzJliRdvmmHMzkekfAHqc2MlwIUgWkWFPl6earHzLk
   eE+Oo22a3fk4Rp1MPJd4nUUIo1wRjJkz4wep8MWuaaUv8LXh9qwuXDRE0
   dtFGbbhuLKiL2TOCc1HQdIgNALBKUYRI7U48eYLvLVbvPvsdBtCqFf/U5
   Q==;
X-CSE-ConnectionGUID: ke2hY4LDQeSeT4R3XB39kg==
X-CSE-MsgGUID: jB1E/xFZSlehk3FY6KEeHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42693530"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="42693530"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 22:03:10 -0700
X-CSE-ConnectionGUID: W7cWuMIiRoi1M6ZFcih/PQ==
X-CSE-MsgGUID: U7gSaUphRiyw7Lo32NBFOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="125585185"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 22:03:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 22:03:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 22:03:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 22:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIAm4daFczI5IvGWv5pGz51pHYyoZEVs76lXW/NVq7K8+XCfs29TkSkTr+4TsdPnVCooqbxT4wQif3YxgOBRg6uWv9IlDOpw6U1TUxLArH2X1kjf8G97mF/ogdabektT0f9RUhhhhY0Cjd7Uhh7W4qu16QN2Phz2Yd4mh7XhZVRaTCmv0zp30ZMXxWjyl4b6uTNDbVtDDUIEn7c/etT6/WcAFWcMFDOJISXdGw5RrUu9Kj9OZHbElA6qkm8Y78IhPmuZnS/WIiZ5O5q7awNmYdXNCqg/bBksyNQqPuo9GB7IcerUEvBz7NeX2+La5AcZGUu0cJC/UOX77EnJy2g8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pbhv5s38rqPVC1XyeQ1WjsHVSKcPBBzgZ60+kPM1hA=;
 b=HGn9DNO3dFIVucC4z6SN635zQSx9LoPEvfSbaAvO+fGFQ1jVa++3VVtGiEl71tMECA7r4atMulODTj/GlS9poDaDCAz3vaYmZ8+geoNYvW542NTvlhW8CrkvDc9x/berGtHF0iHQUCPmKNZqljW0oUlqJkyl3w5nh2tkfQUfiqYlgod7o2aMAZQWphge0AIpwC/VHzP+JFK/CdxnBbhE4sho87wQOaMRMTyBw6JCfasEEJj//1TwU7Q5fjtaw1XyILjVMLWLqRcu/UDMJLYoGeYcSKjN4XfkFPUzoJfsoa3NlJW07trCCggRYPUAC7VD/RwvFt2mdEzKPVxusZhLPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 05:03:06 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 05:03:05 +0000
From: "Keller, Jacob E" <jacob.e.keller@intel.com>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
CC: "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw"
	<przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran
	<richardcochran@gmail.com>, Ruud Bos <kernel.hbk@gmail.com>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, =?iso-8859-1?Q?Niklas_S=F6derlund?=
	<niklas.soderlund@ragnatech.se>, Bryan Whitehead
	<bryan.whitehead@microchip.com>, "UNGLinuxDriver@microchip.com"
	<UNGLinuxDriver@microchip.com>, Raju Lakkaraju
	<Raju.Lakkaraju@microchip.com>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
	Jonathan Lemon <jonathan.lemon@gmail.com>, "Lasse Johnsen" <l@ssejohnsen.me>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net 1/5] igb: reject invalid external timestamp requests
 for 82580-based HW
Thread-Topic: [PATCH net 1/5] igb: reject invalid external timestamp requests
 for 82580-based HW
Thread-Index: AQHbkgopibe1m/z3qEWw+jQ3SoH5JLNtcp2AgAGBGiA=
Date: Wed, 12 Mar 2025 05:03:05 +0000
Message-ID: <PH0PR11MB5095402B94E269F50A7A8442D6D02@PH0PR11MB5095.namprd11.prod.outlook.com>
References: <20250310-jk-net-fixes-supported-extts-flags-v1-0-854ffb5f3a96@intel.com>
 <20250310-jk-net-fixes-supported-extts-flags-v1-1-854ffb5f3a96@intel.com>
 <Z8/SQRskrrvSofW7@mev-dev.igk.intel.com>
In-Reply-To: <Z8/SQRskrrvSofW7@mev-dev.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5095:EE_|SN7PR11MB7017:EE_
x-ms-office365-filtering-correlation-id: 3a5619df-0b2b-4e29-75ea-08dd61232cc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?BJboeAkH/lBxokr/UKQRjqPICIVr7oldyQJG10JY3zeQFq1kkmSJzSiMhw?=
 =?iso-8859-1?Q?ang4rW+6VX1mHIsJzl79LqEX15N9+A1MAkjf32CCpA+ILsmBSDwnVYW7EB?=
 =?iso-8859-1?Q?SmB9ghJIl6atqG3CVzm9pYiT4aCfHXKd+rqtXMECeT7l+VHp6GQxwFubuQ?=
 =?iso-8859-1?Q?3Zx3WZYlsW7j/dSk0TuccelUy11LVV2WxbJnVkkunf8a1hHVJ4JVUtP14J?=
 =?iso-8859-1?Q?tW7vtwd6zbby+K0aVIH5vnL8FgaXe8/B1CC/YzLsS0Br7nIaX1SD/2h7oR?=
 =?iso-8859-1?Q?s/RKqY6t09lp2Xf8A+Znui193HjyjAn5zAh8qfGRUaOxtFXF90TC+OzApu?=
 =?iso-8859-1?Q?EifkbRxva5DgW4+AzCJpwTtw/D+n9Rl731CLHmScPIiJzOiIug8SdUChCq?=
 =?iso-8859-1?Q?6JJ0/Y8Gky8tGLvaFQrfdGxzmcxxGKVs7OjEGMWPNpPGSgcNn5a6yX6i/j?=
 =?iso-8859-1?Q?gYbMhZuBI1e3jDNghb4FDuAG5LJVchBUGBCiC3L0Fr1gZ7mYfOhevmvYli?=
 =?iso-8859-1?Q?y1BtjWDkD8pkKbqvizwseJ5um+M7ZAPSeuseirDE8uP437J9m+7ANYAiXG?=
 =?iso-8859-1?Q?MQd1dSrIzmMMFdN+Q6ZSnDujhSMluIbyoDQ4kVcB24aWwjrIuxAhpWLNOW?=
 =?iso-8859-1?Q?V+JZxGV4wLNTA28UYW+twaxGgYXWsgAgg/FHCUcqNZIAmllBSmh5UoPKru?=
 =?iso-8859-1?Q?WAa6YD6qyykjCLhtK0f73lOrQ4KRZawlKSJuY2c9jVqVMF89SxMeq/EHEf?=
 =?iso-8859-1?Q?VyBs2SkRBYBWTpwuNWxk1p2lA2TqcYAt9Q0LNiQgzmrvf1vau+anP0ibWx?=
 =?iso-8859-1?Q?r7COvIouYZLorAh8d62od+gKxn7yJuR+vbbzau9AGCuAOG11flJIMHIOVD?=
 =?iso-8859-1?Q?gCi9ybUArKB/RDJZS/1GyrH4B2RmrVdQgByBpDOoROX3GsEYjdExP0SlOM?=
 =?iso-8859-1?Q?7ZzS6OsVdvFNiJzbnzoExKXTDajNMPgq99+UzXqycHc3A1xC3ZcURVtOMy?=
 =?iso-8859-1?Q?DhfR94JiAbhibr4pbBXER9V60Gqh7vKofWezciWLdVHzBfgU8bW/Fi2jH4?=
 =?iso-8859-1?Q?cdNwFYCaf6frjcAjsVeTtyh6Uu5lJXO7pgoAAVMFBz+yhXhSFOCmU55jUl?=
 =?iso-8859-1?Q?G/YzUhzsjZb/5WcIcQQvckO419Tp61XcfJh9SpFdpAhaWeLQ2GdypoiQnm?=
 =?iso-8859-1?Q?XSWsIbhLFnmg3qhP/8Rtitta/9wwM7kXluHH8rpIDobjhax7kMwe/5f0V9?=
 =?iso-8859-1?Q?lHErCeIVPGuVGZvSBE9vP4e0S2UBaGodQ39J7q3MqhQ/u7b/MXh0pUT1H4?=
 =?iso-8859-1?Q?NZxan20KlmA4xBiIFIIAv0eFBsJYvzLr4AFlSNEeJUJAPdHW4n3evI0iYo?=
 =?iso-8859-1?Q?vVWm8lqV8PAB+jdmTPNS3RGpDy0o2eB2wKmc3RquFE2USWAwEdUwzivSRa?=
 =?iso-8859-1?Q?7qzOTEDjD6dAwsDzxhcqLoG3bewBy5sMwrfURGHSAItjEG63//Zw04zzeC?=
 =?iso-8859-1?Q?UO9dzveerUGiFcqIpHIJVi?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5095.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7akpAoyWCEBYNNvvIBWFz+5UiTSLMzNctFiL9aEG2a3zs9NMg7benDynO2?=
 =?iso-8859-1?Q?2GvemWZiXyBV9P8GFRJAoQy3HgPcbBYU9OgVKYddJ2ArT0r1l7JvyhQinW?=
 =?iso-8859-1?Q?cZu5eOD7IjZ0aWgAlBGt8+HPBR94XBk80dUuJrnZRzZ/4SAjyClNl7BYaD?=
 =?iso-8859-1?Q?GXdf/2p3vq1l1/bDoe96jC4MinDCvrRSaZA9CD+cBjiu3hVHRqyKZ9I+LL?=
 =?iso-8859-1?Q?lSoDvJRiIRASb73Mt/Cbp64GGK7ephR0Zw/9peayv1Zj9otCx8xNp9rs7l?=
 =?iso-8859-1?Q?+AvHq6SVaGVEUyJDGhSpcx0UasqTrJ0fIBoVx2avsEpUH9Gp5QUrGjCVbQ?=
 =?iso-8859-1?Q?uph5xIo1e3Ev2C4EYMn1PTaeeHVr0K4XQiWsxs/aMejUGZK2+xxorprLNp?=
 =?iso-8859-1?Q?ZX4QsuDg+XkNEDczQnJfikTFfMwk1vvbI+XDNzfy/jdYdfc8a+1GkulBcg?=
 =?iso-8859-1?Q?L9EfGJIRBEmViCUnmZq18wcoAlyqmTW+QQbUbvqxLkMijLJhgNgzuZjOHy?=
 =?iso-8859-1?Q?cgl++Y6JXlVGBlBzLsWv6E2vFubF5aHnjl2qJveYxCRtMxiYJ9o6yUsN1i?=
 =?iso-8859-1?Q?iB032QEWD7RPnBAJMjMyRdZRLjhDbaNUjRZEyudP8TjFlxVSolyelveEq3?=
 =?iso-8859-1?Q?SKnZ+GqcP8qZ0vdfcVTDj51muvvc+DKMbZ6ZPcqWwpkdQ3hS6SXZ8P00+N?=
 =?iso-8859-1?Q?DFO5VOZh/ePmDvocL9Tj+kh4zq5YQ2Pti/iNNtxZLRAdIYZthrphX+qhzG?=
 =?iso-8859-1?Q?TnDqxBc56x2OzYf3zIeFLtL17vjeFv1UZ/XlKw2YPDlgAdX0+wef26Hl4V?=
 =?iso-8859-1?Q?eIRg/jBirjGIX+/LBx3TdW/kvFU0KnmMspzi+xLAqEvvfRy4tCLaIYD/lT?=
 =?iso-8859-1?Q?hmJ9HSWfVRFmm/isgxl8v231H1jtWreuELAvByBMU2jGTjF//qyn5oRStC?=
 =?iso-8859-1?Q?ZI6ZrRhdV4gImAn9bjuOXoIWrkQM3uepk3OY9Jertrl9m9N6/w+upZOqwb?=
 =?iso-8859-1?Q?jrwpQEbzuUGqn+Pfa++3K7L3eDKjHD8sIIooztdj56HqyHUuw/piSdQTtA?=
 =?iso-8859-1?Q?lyvNfRBayZyY6k74LmXwZ5/a2yaKpdawFou+WWfXQvvoDlIAerNy/9Mwl9?=
 =?iso-8859-1?Q?x4DvmhBpS10J8HCCY6GnnQLRU3l4/hcjs2/BzmolFLmZieBLfoDYjf0q4P?=
 =?iso-8859-1?Q?yTz7h5+TNY67+msq+CSP8nadeC2wD9OLTJQvn25Q5s3waN+sf/ilmDLLdQ?=
 =?iso-8859-1?Q?t15VaVOJF4NPRKTz/FJYnxyWfCpmgR958i/SUPH3KfUHoyzp+FE254sCGa?=
 =?iso-8859-1?Q?UrNj/+tSzmWJbru3cMxioN0V+T7bYA5fVBVlDH1cY7zcWOOZXOL1Ajdvuc?=
 =?iso-8859-1?Q?ZGSzheprspGyD5B81vTUlbkjOyE50b/rkcggrhhBLOoAfRx7b2cEZTs1PB?=
 =?iso-8859-1?Q?wY9sylvgIv42HT8XsBzb+bLisrlzf4FkX7oOUWwyQ43zKSmk3vrJxZlERN?=
 =?iso-8859-1?Q?8Zgq5fEUWXc89wDUGDzht0zn6P+mdKXWcNMGQsLZkncWT7kkQzQnwrGGmO?=
 =?iso-8859-1?Q?34TXoyMduJIYtcnEPdxkKfzvkHwNo98KTwbH1JpgQTwv0qCWrwVBqqteV4?=
 =?iso-8859-1?Q?xb7Sa6WB6tzVLC3QO8VURk7eHKeHGMlcWv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5619df-0b2b-4e29-75ea-08dd61232cc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 05:03:05.9176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: INvPvspXwSHqIQefa5BLHaKzUKOsH/YiQgSBjMwuc4G1GQVEV4GwTSTuojL2gPWN1gdSxpGHooVBzKTH6pb6+txacoL5Vdr0Bvgphh1ULig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7017
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
> Sent: Monday, March 10, 2025 11:04 PM
> To: Keller, Jacob E <jacob.e.keller@intel.com>
> Cc: Nguyen, Anthony L <anthony.l.nguyen@intel.com>; Kitszel, Przemyslaw
> <przemyslaw.kitszel@intel.com>; Andrew Lunn <andrew+netdev@lunn.ch>; Davi=
d
> S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>;
> Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Richar=
d
> Cochran <richardcochran@gmail.com>; Ruud Bos <kernel.hbk@gmail.com>; Paul
> Barker <paul.barker.ct@bp.renesas.com>; Niklas S=F6derlund
> <niklas.soderlund@ragnatech.se>; Bryan Whitehead
> <bryan.whitehead@microchip.com>; UNGLinuxDriver@microchip.com; Raju
> Lakkaraju <Raju.Lakkaraju@microchip.com>; Florian Fainelli
> <florian.fainelli@broadcom.com>; Broadcom internal kernel review list <bc=
m-
> kernel-feedback-list@broadcom.com>; Andrew Lunn <andrew@lunn.ch>; Heiner
> Kallweit <hkallweit1@gmail.com>; Russell King <linux@armlinux.org.uk>;
> Jonathan Lemon <jonathan.lemon@gmail.com>; Lasse Johnsen
> <l@ssejohnsen.me>; Vadim Fedorenko <vadim.fedorenko@linux.dev>; intel-
> wired-lan@lists.osuosl.org; netdev@vger.kernel.org; linux-renesas-
> soc@vger.kernel.org
> Subject: Re: [PATCH net 1/5] igb: reject invalid external timestamp reque=
sts for
> 82580-based HW
>=20
> On Mon, Mar 10, 2025 at 03:16:36PM -0700, Jacob Keller wrote:
> > The igb_ptp_feature_enable_82580 function correctly checks that unknown
> > flags are not passed to the function. However, it does not actually che=
ck
> > PTP_RISING_EDGE or PTP_FALLING_EDGE when configuring the external
> timestamp
> > function.
> >
> > The data sheet for the 82580 product says:
> >
> >   Upon a change in the input level of one of the SDP pins that was
> >   configured to detect Time stamp events using the TSSDP register, a ti=
me
> >   stamp of the system time is captured into one of the two auxiliary ti=
me
> >   stamp registers (AUXSTMPL/H0 or AUXSTMPL/H1).
> >
> >   For example to define timestamping of events in the AUXSTMPL0 and
> >   AUXSTMPH0 registers, Software should:
> >
> >   1. Set the TSSDP.AUX0_SDP_SEL field to select the SDP pin that detect=
s
> >      the level change and set the TSSDP.AUX0_TS_SDP_EN bit to 1.
> >
> >   2. Set the TSAUXC.EN_TS0 bit to 1 to enable timestamping
> >
> > The same paragraph is in the i350 and i354 data sheets.
> >
> > The wording implies that the time stamps are captured at any level chan=
ge.
> > There does not appear to be any way to only timestamp one edge of the
> > signal.
> >
> > Reject requests which do not set both PTP_RISING_EDGE and
> PTP_FALLING_EDGE
> > when operating under PTP_STRICT_FLAGS mode via PTP_EXTTS_REQUEST2.
> >
> > Fixes: 38970eac41db ("igb: support EXTTS on 82580/i354/i350")
> > Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
> > ---
> >  drivers/net/ethernet/intel/igb/igb_ptp.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/intel/igb/igb_ptp.c
> b/drivers/net/ethernet/intel/igb/igb_ptp.c
> > index
> f9457055612004c10f74379122063e8136fe7d76..b89ef4538a18d7ca11325ddc1594
> 4a878f4d807e 100644
> > --- a/drivers/net/ethernet/intel/igb/igb_ptp.c
> > +++ b/drivers/net/ethernet/intel/igb/igb_ptp.c
> > @@ -509,6 +509,11 @@ static int igb_ptp_feature_enable_82580(struct
> ptp_clock_info *ptp,
> >  					PTP_STRICT_FLAGS))
> >  			return -EOPNOTSUPP;
> >
> > +		/* Both the rising and falling edge are timstamped */
> > +		if (rq->extts.flags & PTP_STRICT_FLAGS &&
> > +		    (rq->extts.flags & PTP_EXTTS_EDGES) !=3D PTP_EXTTS_EDGES)
> > +			return -EOPNOTSUPP;
> > +
> >  		if (on) {
> >  			pin =3D ptp_find_pin(igb->ptp_clock, PTP_PF_EXTTS,
> >  					   rq->extts.index);
>=20
> Thanks for fixing
> Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
>=20
> In igb_ptp_feature_enable_i210() there is the same check for both edges
> but also PTP_ENABLE_FEATURE is tested. There is no need for it here, or
> it is redundant even in i210?
>=20

Hmm. It might be required, because requests to disable the clock won't have=
 PTP_FEATURE_ENABLED set, and might have the edges cleared, which would pre=
vent you from disabling the output..? I'll have to see what the kernel does=
 when it disables the function.

