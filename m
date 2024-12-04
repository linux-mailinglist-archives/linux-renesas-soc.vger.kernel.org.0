Return-Path: <linux-renesas-soc+bounces-10875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A779E3051
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 01:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 701F7164376
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 00:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A0F10F9;
	Wed,  4 Dec 2024 00:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mu2nC7q2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048D7F9;
	Wed,  4 Dec 2024 00:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733271765; cv=fail; b=j3qjZXer0VSNxM5lI9yea7cbnG15NKCVPRZS19MUz9T6EEOlTf9eiZ2L56PeTfwgaK/VoQq3vSE2mdL5pEJXsQkal71zAvVcM6VVbXl3mzWcNZP9oeJTJPL+gOy13sB8oiWjSxJCtl3C+2Zy9jEEm1oBKWRqB7TYqzojN+/l0Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733271765; c=relaxed/simple;
	bh=zWk/1t+iew+C7v4nb9SofOCevsNA8Fyq1zCrrlJGouA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OPUSfewRacPFNNQWMO5eewEk4oYPAXhUTeJM3VOek8V7kIEehyOW/KXC0CrvsOx+2zYV/a2ClJPxJeZozZ+NMIXaIZ6HAgf0uhxAIEtIzc5HfjTNltKcBLezu2MO5lU/IXBLLnblZwPf7ZJ8P0UDIrIUBSWeYJN+wFjntxKt4n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mu2nC7q2; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733271763; x=1764807763;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zWk/1t+iew+C7v4nb9SofOCevsNA8Fyq1zCrrlJGouA=;
  b=mu2nC7q2uRJ8z0422GO1SHkwibDlWMrTFEIPwU8MTyz5p2qpf6r+wPxm
   /I3TG7zKrOicSJ+bvG/zJLpgo52AM05w7cV0PhKNrNs/OlnpAd/ASKdCy
   qlZGLK8vtO5bld9vmLaH4f0HhhC9he0Y0Ty6XY/GWuRfPEW0N+dRGGkxM
   ZaLLRgilqmTBpgT2klJTw6o62d+uHlN010YYhZkaLDEF5NwcLvk/xP3A2
   f0ZJlEPxU7BrUR+goKSuG6tWhD0UcTMgItKQskrCNUp8ORTh5h9qhSvFv
   mH55tH9uDN90kNzKbU6fZ5voHF5FzP+tXJn/nCdGxKsqmuiLU15vJDrYy
   w==;
X-CSE-ConnectionGUID: 4BxZibKUTlaAZ/0YRkx/og==
X-CSE-MsgGUID: 4otfhzGOQ4OZgP6hdumgCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44128672"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="44128672"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 16:22:42 -0800
X-CSE-ConnectionGUID: GbK5U8HITxKRlDcLNFAI4Q==
X-CSE-MsgGUID: rS53yb8ERKmgMO4/lpXqYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="94424897"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2024 16:22:42 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 16:22:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 16:22:41 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 16:22:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7SQ8bIQ26tIlLAGrFfZoHq4hPBONbR5kaeXK/UrIvVjXo2T/zh+4U1rFYfz0akLA8z6NQtbih+IGDI2Vr8RqxsQWcANxCLEwpnjAJzIEPyxDvq3Jh1pxGgMCqrctYfcWrDT4rplUxBGAtgHt08Wg3XBw2TBTBmaSTLwZKtXyUYUmXs9rFzUEb2y4/MqKyHGLUh8q0AqliJxKjAfj5oPvIJ7yYtRVMPXKYYAHve90ADhUh0JrW5STzWVrbfugK3VVXCMizDlmPpa0zXCmzfqOaEObe2CGEqEHLj5DyupzBmNkBgTgT6TFr5QtxlEdGjszU827qkimeyTaomSN2Hmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mr7ydL6NMJxg/4E9qea8E+VJ+c3vUNf9Ws5UMNnLhA=;
 b=gkYeOJIasEXsTMn2x7kqxH6B8K5BpgnVn+0cMYdWDkfIanD0nA+J4OGK0eEGWzMDxM5dAulynejWl9tc77cbWHkoz8vEh+U7u2Ku0vy9kj5tlA0vhbrFVIjsYU+U4TmJcRSoUJhUeRLnaJMaKV+mjBtk/hS7EEGHcJHKTU4xTI6zLpyOVUQQ3lpntpphCbR+mSWXvXupJYYCzfhhgoRJ8ilZYn6XywFhxWdVqK8BB2C8H70VrTUjD1/4iytgWlhE6jhspVEtO6nELcOVHoxgGqPquE1oxxoqSaGALBbZbd48KBUn367XDFVuExbm2oGWRENPn3NS2xXV4ACzTIp76Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 00:22:39 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 00:22:39 +0000
Message-ID: <a163255c-da64-43f9-b99e-719608ac661d@intel.com>
Date: Tue, 3 Dec 2024 16:22:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] net: renesas: rswitch: fix possible early skb release
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
 <20241202134904.3882317-2-nikita.yoush@cogentembedded.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20241202134904.3882317-2-nikita.yoush@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::37) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: df883c6f-cdd6-4ab2-7cae-08dd13f9c296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlA4RGZpMHpFMXR1ejU0eGFwNnhPcUtMZlF6aUhmWW94T0xYRENhdEM0RmYz?=
 =?utf-8?B?LytUWGc1bHArcTYwK3hHcFB6NU53b1NYR0dPK2hRaU1GRmNlQ2h4OEhXNXhl?=
 =?utf-8?B?SFZxdW1Rc0VUOXY3R0d4ajVNMTlPeXczRFErSjEyZ0gzM0lPblc4K3V4c0lt?=
 =?utf-8?B?TDlJN3NsZWxxWDBicWF4am1BbXBsNlZVc3RKbG1OVjFFcHkxNGdaaUlvdXF5?=
 =?utf-8?B?Qi8vV1h5Q0d2d3lUelhsaWNreUhVNCsweDJ1MEFZVklIQXlxVEpHTmpPSUR1?=
 =?utf-8?B?S1ZTbzQ2bmNrb1RldEkrTjVwUmZqYTBscUtHK2k0WG10WEJTOXB6bXJLN2N1?=
 =?utf-8?B?UHlDa1FXczhqZ2NRMkNpZTFPTFdQVmNnVEgyUGxJWHJXRnBIUk1JWEw0NXR6?=
 =?utf-8?B?RmsrQjFpWExnNm5WQnVuajlNc0tDS2JIb1daNmdrckVsaVV1aXUvbklhL1ZB?=
 =?utf-8?B?Q2tIbkJMZ2krL3JnL0hVYXM5YU01T1BZOFQrYnRPVzZCVkQzM2UxK0ZhN2hG?=
 =?utf-8?B?NUlQa1c1dUdPbzlKMmwvMVdTSWJPN2Y0VjFUaE9PWDlWQ3ZqczM2Um5qYVVG?=
 =?utf-8?B?NldockN5TURrUGFBNTN1T0lvV1l4alNMOENSTkZEKzlvbmRsb0pRYlEzbmRR?=
 =?utf-8?B?T09yelVzT0lrUks2cVJocFlYcGV2NlJZT0R1TER2S1g1WUhZeFZETU9VekQx?=
 =?utf-8?B?bis2RnRLcS9DQTVXTnRKWjNUWk41KzZvRlU1ZTNQbVZjVTh4bk1BdEE4ZVpK?=
 =?utf-8?B?UjNLZUl4MGg2ay9zUWNTSUFEWnpSOWY3aExKbGdxYUVmTjBTS2U2ajR4eGpH?=
 =?utf-8?B?em4zSHdBZkh3ZXE5b2h1UHBqR1dRcWpjcnhtWnlsdkJzN0lDUXpFVDcxUzNI?=
 =?utf-8?B?K05tblM3Zm5uei9icHVuZ0hTaDQ5MUxkYkFyUWl2anBWTmw4VXlrRDJiZlc1?=
 =?utf-8?B?SzBMcUx1Y1pidnBLQXJsQVBwRUk3UVRsR0YzT1BYNERkQ09rb01lb2I5eTVP?=
 =?utf-8?B?YXJuQjhRdGlzVHdPNVNCeFpibEIwYWl2aHRSL2ozM01aRzhNdVB1Q1kwVW5G?=
 =?utf-8?B?dE9oMGlVUWE5N1BxQmhRdFQ3bTdwNm5pS1lmLzNkREpLYlVUS1JOdzhIMW9Y?=
 =?utf-8?B?dzczM0t3OWpURmhZUk8vbXZsa2VUNVl0NERkcHRCY2tvWXZzeGJDanNpYzZM?=
 =?utf-8?B?b3BVbmZUUjBJblZFdytJRUpsZDNJeUhTSmhtc1J5SGdSblJBdWg1YXBXS2Js?=
 =?utf-8?B?YkNHUFlXY01XcGloZHhzSHNlR29wTXpGdGhNdTlNYmxHUlFSUFFtVnRHTUY2?=
 =?utf-8?B?YVB4emxFVjdVRk5uamZ3ZEowOVBXMERGV3BmaFlqSTUycVlyMXFHNERoTitW?=
 =?utf-8?B?c1Y4akYvY0kwelI4emprVW5RWkxYdDEzam5ROUlNeURTOGNmeUVCOEd0RGJC?=
 =?utf-8?B?R1U0aWYvL01UOWZ3d2lKT0R6dHJJWnBOLys4RldsVUJYZzdSWnppaU1oampy?=
 =?utf-8?B?NEFPOEhrTGcrMm1QMTNtWitZS2Q1RUhaOVdDWlNrNVlpcWZkWlA3M1FJM25M?=
 =?utf-8?B?eGVLT00yOU1HWEtxUTk4Y25uNmpJcEc5ZHRxUVJYRCt5V25iMHF4Y043N3R3?=
 =?utf-8?B?VkJoZG5ZdnlzSU44c1VOc1NoT200ZkVTV0lKb25OMVB2cVBCU2p2UHRJUW9i?=
 =?utf-8?B?bWJuR0h1M2E1cU90dUZ3ZGtJdFJiRFlVL0c1UTZTSEFRdy9ua3hDM3ExQkhV?=
 =?utf-8?B?cnFlejlQRkhyNUt0SE9ZNHdoeklOaTlYNlZXcnNCYXJGSXl4bVhUVkFROVFE?=
 =?utf-8?B?WVoyUDBEdjJSaE94STBNUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3U0SVpycVhVVDk2eUN4WFdhUTkxNkJOQnNoTmluK0U5US81QmxxYWJWRDZ3?=
 =?utf-8?B?QW4xeDh1bVplVklYQWdFMDZMeTdHQ0N1WldHOTJqNDNOYWlSMFpHVHdMQVBO?=
 =?utf-8?B?ZHRzSUc2MlBVVDFOQXUvL01lbUNDOTRxbTA2SzFSaDhTc2dxa0NYOUFacXZ3?=
 =?utf-8?B?dDJLOVlCT2pKaGxsQlZ2UnpyaTYvV1U1TGMrSVhMWmlYZms2RXF1ZXMxQWFn?=
 =?utf-8?B?emhWRnZ0K251czlMUmJqV0Q4YzJzaG5EelBrZHFUK0VCdjdReWRrbjdIRks0?=
 =?utf-8?B?cFdmRUJHZ28rT1lvTHJ1SWJPM2JQSWRlTmVSS054ZGZJVEJueVhVU0xzekdj?=
 =?utf-8?B?aForRVJRMVpTL05ycTFET2tXbm1hTmNmWjlMaFZKa3pyOGpGWDNyVU8yTXRY?=
 =?utf-8?B?TDcvRVlyZkhGdjVQbTBGL21IZ3lUK05wNjhjSnNBTC9oVHZHKzFxNjlmWmlp?=
 =?utf-8?B?VEl5N05saXU4cWJTVnMyOG9OZVc4WjI3VmVIQ0NlMkp0RjB3eE9wWEM4L3A4?=
 =?utf-8?B?NjNYUDFWdDVvSU5tMElSTXlYWUJrb0RSZnFNZjZaV3NUY3Zza1ptRmUrdTdH?=
 =?utf-8?B?TlJMMUEyQWxoK2x3YkwvMjJtaE92WVp6WTJJaFFHZTlWNk5yd2VkMVNPMnBR?=
 =?utf-8?B?R2E1N1lOVG16UVdudmtDR0VQalk1QWlGcnVsa2JvRlQ4NGdFQUZVcDNDeFpJ?=
 =?utf-8?B?VlpqZ3Jnd3k4a2JOc2dHSCtkUXlZTm10ZUR6dEM3cWZIUlMvSWF2UDViRlR1?=
 =?utf-8?B?aEZxRnN6YzQ3bzE2eW5zVWdUU0xxNFZzUktGc2o5MG5vYVBjZ2JHcjFmUmR6?=
 =?utf-8?B?bVNUWFBuc0tDbmFtSUcyeURPenloRFEwQmJ3U0NMUFFBQ3EvbTlrelBUNmVa?=
 =?utf-8?B?UnVkRFpjdlRkeU05dHBEbkkzSmRiNmJ5QTJYMFJDYnpyUTU2NWpWR1hBelo1?=
 =?utf-8?B?M3BrQUVhWC9OMjRzVmNDTXAxY3NlS2JRWTlOMEwxM2svY2RwZHNQdndDbGV2?=
 =?utf-8?B?RzhWdUlBYjg4OFJRT1dadnBaZndSS09Rd3JrdkVtSU5Oa01yOWV3SDB2Ujln?=
 =?utf-8?B?clRKS0F6WEVOYjlZZFBQZGpsUGlValpjeFhFWWoyUUJVK2VYZlF0UHFiVEFq?=
 =?utf-8?B?VFpYelAzYXdqR2t2a3hoMnMydUlWZzBaRlE3bWhoc1hpa1BXR2N2dE5TK1hE?=
 =?utf-8?B?dElBS1JjTVFFZWVXYUVoS1lsT3RnZGlhYUJpNldhK1kzL3NEOU93QnFwTFp4?=
 =?utf-8?B?anJBS1BzaG85Wkl4Y3NDV2swTFlTVUlLRTRSTkFHZEdTcHhrZ1cwOTl4ZDVL?=
 =?utf-8?B?ZXNjRlhVTFFNQTdIM0ZFaHlCcXFXdU12WmY2R2tTYW1Jb3poaWVuZS9rUDJ5?=
 =?utf-8?B?Tk1MM05PVXZmMmZUUTRxdnV4cnZoU1pzazBVbmxlakVPMmM1Y0NYUlBjMVFN?=
 =?utf-8?B?QmVUK29rWG5VMmZiRkJhSjhqb0RJbVZtYnpEYWl0M2d5VndCWHF0eFhYUEU3?=
 =?utf-8?B?VTBYZWYxNHJVR1hIUm5JMStXK3RXZDNyMjdMb3ZxYnF6K2FVcVFzc2lFcUxD?=
 =?utf-8?B?RkFSYVdUSGFJb1laLzZNaC9YQm1lcXlrRW4vd3NiVllmTlJnRGJXY2FFSkxt?=
 =?utf-8?B?akVwVWRVbGpQazAwZTZlcW02akJ2L3pPaXFqNjE2cFgwTzRqZkFyZ3JjTlhT?=
 =?utf-8?B?L05YQm5tV0R0Nk5mbXpaTW9DbXlsK1hreE9sVlMwczBaQ3RMNFgra3NlNGpW?=
 =?utf-8?B?dXk1ZmQ1SE4wc0tycHRFajlaWU0wK0I1djFUeTZCQ21RWXk4VUxJTk9yOTB6?=
 =?utf-8?B?NDVoRE1aQnB4clVteklmZVRKSU5yWitaOVdRRFVHZTFrM0FuZzhqVFd4OXBF?=
 =?utf-8?B?VUdEWk9YL054cXVxNUlBbCswWkwxeDkwTXZRVnpNT2N1T0VSS2ZRamNVR2tP?=
 =?utf-8?B?Qko3MTZ0dkV1eE5Nd3hkVVNScEx2UFFBS3NYNUgvSU40VVd6bE5ySEN3dEVl?=
 =?utf-8?B?MG94dnRUME9YUTQ5ZWoxQldHNW80dm5yWlBmS0I4eGNlK0EwT3dYQ1kxYURE?=
 =?utf-8?B?VCtYYmF2Qnc4SkRoblMvaFFVeHhnMHRMVjd0d01MbUh6SXFpVU9VUkZBQ1ND?=
 =?utf-8?Q?6P41IUsWv53XS/T8/a/zolMXr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df883c6f-cdd6-4ab2-7cae-08dd13f9c296
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 00:22:38.9963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqrTgL0iOX8JhX4V50taBuvYCmgGx5iLYy2x6/aMZKi3JD+jEnUAdhIxbSBW49JjfE1ZK2t45ie7kD3u5m4FDULHZnRtP5DdmuGCDr6myC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
X-OriginatorOrg: intel.com



On 12/2/2024 5:49 AM, Nikita Yushchenko wrote:
> When sending frame split into multiple descriptors, hardware processes
> descriptors one by one, including writing back DT values. The first
> descriptor could be already marked as completed when processing of
> next descriptors for the same frame is still in progress.
> 
> Although only the last descriptor is configured to generate interrupt,
> completion of the first descriptor could be noticed by the driver when
> handling interrupt for the previous frame.
> 
> Currently, driver stores skb in the entry that corresponds to the first
> descriptor. This results into skb could be unmapped and freed when
> hardware did not complete the send yet. This opens a window for
> corrupting the data being sent.
> 
> Fix this by saving skb in the entry that corresponds to the last
> descriptor used to send the frame.
> 
> Fixes: d2c96b9d5f83 ("net: rswitch: Add jumbo frames handling for TX")
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index b80aa27a7214..32b32aa7e01f 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1681,8 +1681,9 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
>  	if (dma_mapping_error(ndev->dev.parent, dma_addr_orig))
>  		goto err_kfree;
>  
> -	gq->skbs[gq->cur] = skb;
> -	gq->unmap_addrs[gq->cur] = dma_addr_orig;
> +	/* Stored the skb at the last descriptor to avoid skb free before hardware completes send */
> +	gq->skbs[(gq->cur + nr_desc - 1) % gq->ring_size] = skb;
> +	gq->unmap_addrs[(gq->cur + nr_desc - 1) % gq->ring_size] = dma_addr_orig;
>  

nr_desc is non-zero, so if nr_desc was 1, then this would point to
gq->cur + 0 mod ring_size, i.e. gq->cur.

I might have possibly computed that separately as a local variable since
this expression is repeated twice, but I don't think thats going to do
too much for readability either way.

Ok

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

>  	/* DT_FSTART should be set at last. So, this is reverse order. */
>  	for (i = nr_desc; i-- > 0; ) {


