Return-Path: <linux-renesas-soc+bounces-14317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A047FA5E605
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 22:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0619E3ABA10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 21:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6F61EF0B2;
	Wed, 12 Mar 2025 20:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emXQE8f4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B0E1EF087;
	Wed, 12 Mar 2025 20:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741813120; cv=fail; b=YkLT3D/pT4DEAR24HTyIFapgGVLHn4luczxlxRKnI+5N5lhFOeAnsZbqpvP2NXt8160I71rkv3VIoJjdjupmX1IxKcRpE8XBfIYMSzKxO8cx28ZUZXFcy3w5yx5u+isSXn7sv2AsdHXjB32XYHwuR9fejWMmAa6p3pXFN03CuVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741813120; c=relaxed/simple;
	bh=N/Z2PLqaitfYimF3B/bOdy5yW13mQYoPuIYEcMudIe4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eWvh61Dnlhi2Gl4IeW9H4DdVS6xteJOGlgyKXgOn0I0aVcQiykc7SQLYECZBgNJqnt94r+J1u0DXo2V6ATdpVdMLsN/zJDwyxG13sftZ0eDZnk8BoOZdJO3OAt3/LpVMhN56gJGjQUyqqJN/KYGWwvExtnu11DpYCu6QueaVACc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emXQE8f4; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741813118; x=1773349118;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N/Z2PLqaitfYimF3B/bOdy5yW13mQYoPuIYEcMudIe4=;
  b=emXQE8f42SgE6HFm3Ec1YxtWBQdv1S0EcWxwGrhexSAdWUbAUR+ZlAch
   COQYWTsKhHoqg8XgZNEOuzHUvN3/U+/x/Ha6D3qjonF3LijlQPJqf758Y
   JsDP5Sl2c+GRPEbBIcjW1K9TjVywapogAoWBceDf/E7NXOMXmFYv1soqU
   ouviLr+KWesvqzAqPN9gsP1W1kGLkB2wzRrGCzWtY8rIlYV1U9R9H/Bw1
   VIcLc4F87kQZI7hVTpTsF3xiZNkZIvIuDc2ubm2PU+7dWVxAAmPb0ENv/
   CVaRFPAxLPyA5Jd67fkFMfchVQOKRBivOTzt01VobYhPK92/nANSUs2a2
   g==;
X-CSE-ConnectionGUID: xv2sD82ZQX26D+pn/InFqQ==
X-CSE-MsgGUID: bt1HkRUJTii01/bZeCJDdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30499494"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="30499494"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 13:58:37 -0700
X-CSE-ConnectionGUID: HpVzkzz4RxGiRTRDyHb7Cg==
X-CSE-MsgGUID: NMPRXzL8QRyFDB54vOO0dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="120707515"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 13:58:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 13:58:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 13:58:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 13:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLOnpmBGy9CDoPfQ23hH9gcyrAzcxXxnwkIWc5ida1sZHePLRNFUOk5ZJ4voaSTxyvO6LSO8Dcj24Yyr/2fcQ1vbSYP1jLt/B1FprgxRYfs5j0NK9KtgnIZfJfzKLDrZ5zZ2jEoqAW4ht7uuo4t3INLecSh9Le3YdEqJKX2xVLEfSUGFktRd0TjaoUcSIPT8cYHl+kbtPFh4pmc+AD2qSQiTgNoxRN0cJn3GPWZX06cXtiirTSj2OWgb6Sdtz+uFkpDsc2/4G4hlufjg79/HNCFv2zBzA4A/VNCu0rbU8qwkxEdfkAokAmykvZRw5z2MiKan5gvgK+yd8kWzuxGUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+n42W8DcUzjnKT7qMDAB0EQe5xu7/ZT4DMSkvrk5tE=;
 b=DdtfALf7t2dWKY++Qq9zy93IGu3ZfV3jhZiKLt7+OSvG1g1laDQENi764KgscoCm9vVVExz1BqEo56/iDdde/lNsufkq7BNkBU7OLEeOhdCnoqYbwM9TMUgjCVkUWMnubAITJo1YbVlmqbGL4ccdsCREhugfT39IBE+ns0VMDxVw4MCBwV9BfWCEjY0aWSm+CKZ25IRYN528xlr/ho9Mk9CmDfuXmbjUhOu02CpO7JSn506287FXrIxiHAbOAGH444SSb/Zu5UvywxHlE1y+B7b3yL1saIX/8u6lsszpiiFm/keag2SP4C4Z5cthLQuAarca9yjZfhMGBRLFI0W80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by IA1PR11MB6466.namprd11.prod.outlook.com (2603:10b6:208:3a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 20:58:33 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 20:58:32 +0000
From: "Keller, Jacob E" <jacob.e.keller@intel.com>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
CC: "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw"
	<przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Dumazet, Eric" <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Ruud Bos <kernel.hbk@gmail.com>, "Paul
 Barker" <paul.barker.ct@bp.renesas.com>, =?iso-8859-1?Q?Niklas_S=F6derlund?=
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
Thread-Index: AQHbkgopibe1m/z3qEWw+jQ3SoH5JLNtcp2AgAKMNQA=
Date: Wed, 12 Mar 2025 20:58:32 +0000
Message-ID: <CO1PR11MB5089651D017FB2E6BF8B2F37D6D02@CO1PR11MB5089.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: CO1PR11MB5089:EE_|IA1PR11MB6466:EE_
x-ms-office365-filtering-correlation-id: 8a152e07-92d4-491b-201a-08dd61a8a5fb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?nGTeMJpCUHNCFKDefZGjRxF/ituQIXRaPKJa9/RwpWiBLE+3+WrFSQANL2?=
 =?iso-8859-1?Q?48e/ylR5iaA+xTJn0DIi0k5HnrKr/GAbbpH9ZPaXWNssK6uj6kIMhyBVDg?=
 =?iso-8859-1?Q?OM84Hziffij/pRIymUhZDOopyKzYIw+IdpIXMvAEuPWRrhj9qooCTj58GL?=
 =?iso-8859-1?Q?YzFRHhJ2r091oUvU3AYqR9CdVejAYTTyP6lGOUVlL0o8dAz05PMB6VxfVh?=
 =?iso-8859-1?Q?AY+YbJduWvyFcJKNhE6rUAZU3EGvocgEgfV02u+QnJXYLJlR4PbqZABf32?=
 =?iso-8859-1?Q?xaEQxruWYNvqh8rrS++ho2nZloxAypOsCXZdKtjsuEzmLUp8Z7FKRHmqD7?=
 =?iso-8859-1?Q?9gWXKlPAWeDv6iW0tF5yrtmN7DXhmJMr48Ic8qhmJYgNyKDBLI4WhyFOvs?=
 =?iso-8859-1?Q?6N1HebhWTJuCqwpK2IPlx8c5BarSkpM3ofnHnIh55v3fWuqOsLhUhk6J/y?=
 =?iso-8859-1?Q?d/M4ss8fzTrFghZshm366t5xj/rjSSySAf4RBxwDS50KZYfcfGSLhV+sac?=
 =?iso-8859-1?Q?+Iu+j3EZgeMMVr3D3Zwe64Zy5Z8U0joBhrOdzVyHZa2OtcT74jvWkfvRIK?=
 =?iso-8859-1?Q?PeHT5pyMvLr6LiD0lPRaMA+BNd1Uaav+RsptcAoOQrdSOLabSCmylosFsv?=
 =?iso-8859-1?Q?7F6r20Wffc8MuGpHNk72OucGzfQqWwcAeFntxbVvAc/Os6rIK7PxoZo9EK?=
 =?iso-8859-1?Q?ZSNYMXGdarVz0rM32OMKavHq1OtkLI+9VTJnYfEknOMDjpMzf0LjZ++fTy?=
 =?iso-8859-1?Q?tR1Cx67UoVCDi1z6lIYZcjUD2rIXq/7ZU1g/S7IZikc2b081bb5VFP1S/l?=
 =?iso-8859-1?Q?5NJe5MTuxb8k5szdoTn5G1I9TEeSvGGzAueBITFMMpbI0bvSeTvSfnwgOi?=
 =?iso-8859-1?Q?y6slHeqtkS0E6a+R1BEXnKlUN7jsBTMYRQaHLJ5jxVuLAjIp+aYvQBiwKQ?=
 =?iso-8859-1?Q?Eb9JzaDm9yRvYMIftdoDyTmSyD5hiBp3u6hothXuvxRpLOtBioiL3/h5iC?=
 =?iso-8859-1?Q?Uo18zfxDyC0Z9/blwzZfgxu68Xb6VjazDiD6O/7q9rI58bgDrw8lLuGWdr?=
 =?iso-8859-1?Q?uLmPgaPGQ588im1I4SmUOE1dA+fMpp3hK7FmCKb8ppAQ7Aq5WqTXnRLdn5?=
 =?iso-8859-1?Q?jw745p6qPUbFOYTNIDuqNxgEhP8PnYi3K03rv9VgUGRSBHAfRrLYaNcYEt?=
 =?iso-8859-1?Q?BsqkOt4/bE7rpUcGF4mpERyGd6r6afX3aac4AXC6bb+P0J1fq2yJA5ZQnU?=
 =?iso-8859-1?Q?JD9yp9Clg+kCswlyaAtHzu/dlfsajbcBiaIg60FnDP3bZ2o/Q/ZEoRMk/w?=
 =?iso-8859-1?Q?rLU6FYCpyWW8/mHXGjNOnMrLzL0c/gaWspFCbcnWytgAJdhrPg2QFQDwv4?=
 =?iso-8859-1?Q?bH24vX+CLBn5F8uN+xH+KhDlRvCWDP359h3riDVOxK8w8uuQoYOKwX1VNJ?=
 =?iso-8859-1?Q?ChNpL9kEXBS2BaJAwzX/0OEOsZKUlNnsku1Bmg/wQo67WjPPRWoyLKyBsY?=
 =?iso-8859-1?Q?0SVRKy7wjV3YcGBFfAP/aM?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KHAx9fBtLSk35+jcAq9jFRWTzPeWp6NlpWEIp+gr2OB5LVN32b9XlHQHPT?=
 =?iso-8859-1?Q?dMGqCAcUQIFkLoYKNFwTn/NreCTl5jzepoiTFL83i354EK9q/6GEoxDKFk?=
 =?iso-8859-1?Q?T2oE/5vxmLlYbDfYkY9RXWoDcatPrH3q9mY617hQimA7oihsB14XIZonTt?=
 =?iso-8859-1?Q?DHZ0GL9RwHZ56rsC1dZCX6hQBm/BZ8ukKOmd+R0mS1Qml1M0T15kufmBr+?=
 =?iso-8859-1?Q?6LcvPU885wLPY8aHGywZrN9P9h7roC1nXSqd54XT0l2Bx0SmaDGESDIJ/p?=
 =?iso-8859-1?Q?9y9c4avKLxItRGuVDJRqrBxV0F6IzlKsJfOCZsTmCCPbBeGC/AhfvXupkj?=
 =?iso-8859-1?Q?H7K486Y6noa7wT9DltX7z8b3Mg+gYNk/X8S3SUR2lANiOtfFUF4EujhIxM?=
 =?iso-8859-1?Q?1+xs2wfZbs1+0mEZwn1gwltwwEho+cGMbj8rXM0pTRkYj9P5v1u/PZAsbG?=
 =?iso-8859-1?Q?hPdW9X7OyO0MakigKxyPDjF4xOjT2HHnuWdkPBVibx3OZwFDuh/A9WuWgM?=
 =?iso-8859-1?Q?bciyRFwqNm37jQngzxW9Wsxv03lau5ptTO0JBERwW8X+Q8qmniW1UH3ju/?=
 =?iso-8859-1?Q?zY9hKBTIFf4k93x0Ud9WVXVDHbO3jEe37gIQQX4wvPZGSkHQDeaoPoVYBd?=
 =?iso-8859-1?Q?0fWmOH8IkvskM9nw1dTqjbrpu+nNLvfw5Hq9pnpJZimOEC46whe0beR0QZ?=
 =?iso-8859-1?Q?hyhiqaWbqr75SoZl6srFHD1ougY9zogkcQV5QgSXuD8Lj7ZSkOzhtiw80Y?=
 =?iso-8859-1?Q?YuG2/PAi/UrV9KvNIdPvFcTJAIw02yy3KGFPuD7fPzDFBdocD5s/3rlXPW?=
 =?iso-8859-1?Q?6jLWHPlwhNmXHig0cbqzSfwf8sycV7UffrohMWrgDepF2pOFqAzMAwADYT?=
 =?iso-8859-1?Q?l/riEavYLRBSkXEC8PGOshpwgXvzPkn4lLP8OTV2rvce1FXT2jS/1enTYp?=
 =?iso-8859-1?Q?hau5f29KEsPyQtmRq3vdcvZiig3LCDxiM5M9YjGuJtjG1lyx+uTLuavsaU?=
 =?iso-8859-1?Q?5Qovvd3lGNY1R1YVB3eqzCTZ2GpZ04O8PEan3XTjz43g/EJVPy2vJeBXD2?=
 =?iso-8859-1?Q?eiYCtLtxPKoNKs2MRvCPDVOg9njBrTpQb+IrKrEDAmyXhMSd5MzOzBtdjO?=
 =?iso-8859-1?Q?ErBCBvlIs+llT9jxMNRBs4prsgpSI0I32gzBSbwxqmVTdqZ9fTooLwl2tZ?=
 =?iso-8859-1?Q?/D5QHfEhLAmXrsFolFKF53bmScbkDXI1ZGVPnwByQLfYqBkQwfXXevhhNb?=
 =?iso-8859-1?Q?iIiAUcXkWAQxTzOqKTyULo6/ixKJ/5XSJGzk/l2STrWj+cc/+dhkaq6Fz5?=
 =?iso-8859-1?Q?BvI7z8JOlhXxGX2BVaelZLmjDtz1Pw3Zv/09F3bAQWMl1seGJFyrkafuhE?=
 =?iso-8859-1?Q?dSJkCxq31WWYGoe7f/gsq0bXQ1V62HYxL6D/z/WeE9Jggfcvyge9N6TI86?=
 =?iso-8859-1?Q?Z87a4uek7Jr6MTgixCaD5fWbysrHEqWI5TeNoYrEiJeadyT/JR4w0LeC1N?=
 =?iso-8859-1?Q?lbS+VlFqIJPOo9LT+LRM48l9RLZXjWvDTfHkbdT4NG95nbZZmolCa74Z+5?=
 =?iso-8859-1?Q?azkDzVgFXy2VQP3eWu/JtKqH+h1+kFq6LV/91UiHDhtaLsPoiCG+2+8MsH?=
 =?iso-8859-1?Q?2BDHutPDNDeM5IPZsuEFQzLl8ywVj9ONO+?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a152e07-92d4-491b-201a-08dd61a8a5fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 20:58:32.3040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fvftche5lRGejdfVyFW/A7uHqzcZoI6XYx8LeesFRwUVpAx37BrJKlJdNUAwSMVk0iE2OS+jdpa9BB/+AkarzgjP/f9MFElOKjQiBvWTJRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6466
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
> Sent: Monday, March 10, 2025 11:04 PM
> To: Keller, Jacob E <jacob.e.keller@intel.com>
> Cc: Nguyen, Anthony L <anthony.l.nguyen@intel.com>; Kitszel, Przemyslaw
> <przemyslaw.kitszel@intel.com>; Andrew Lunn <andrew+netdev@lunn.ch>; Davi=
d
> S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jaku=
b
> Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Richard Coch=
ran
> <richardcochran@gmail.com>; Ruud Bos <kernel.hbk@gmail.com>; Paul Barker
> <paul.barker.ct@bp.renesas.com>; Niklas S=F6derlund
> <niklas.soderlund@ragnatech.se>; Bryan Whitehead
> <bryan.whitehead@microchip.com>; UNGLinuxDriver@microchip.com; Raju
> Lakkaraju <Raju.Lakkaraju@microchip.com>; Florian Fainelli
> <florian.fainelli@broadcom.com>; Broadcom internal kernel review list <bc=
m-
> kernel-feedback-list@broadcom.com>; Andrew Lunn <andrew@lunn.ch>; Heiner
> Kallweit <hkallweit1@gmail.com>; Russell King <linux@armlinux.org.uk>; Jo=
nathan
> Lemon <jonathan.lemon@gmail.com>; Lasse Johnsen <l@ssejohnsen.me>; Vadim
> Fedorenko <vadim.fedorenko@linux.dev>; intel-wired-lan@lists.osuosl.org;
> netdev@vger.kernel.org; linux-renesas-soc@vger.kernel.org
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
> f9457055612004c10f74379122063e8136fe7d76..b89ef4538a18d7ca11325ddc
> 15944a878f4d807e 100644
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

This needs a v2 with the flag check modified. Will fix, thanks for spotting=
 it!

>=20
> >
> > --
> > 2.48.1.397.gec9d649cc640

