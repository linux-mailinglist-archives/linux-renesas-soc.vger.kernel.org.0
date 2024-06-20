Return-Path: <linux-renesas-soc+bounces-6530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3239100C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 11:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC8D31F265FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 09:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F1B1A4F07;
	Thu, 20 Jun 2024 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ASwUo+v3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2087.outbound.protection.outlook.com [40.107.113.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDCD2594;
	Thu, 20 Jun 2024 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876989; cv=fail; b=VWot1ZLiX1BTmPM1S86gA5uZZRjlAEuOzaecmJkPRg8k6pS5FKpBPGH1mZx7zipRjRtfT/kBihJFt8yaXljyJ3oqR1xB1a9F+s6rhA7YwwZW4rOkCswbYXu7AHt1BDN63DqYrXxQAY6kckI8S0d/T7811Ssf3LqS+2DVhr6p42w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876989; c=relaxed/simple;
	bh=CBv+y+GLZkxophCfqkOGjIu+TDNkiWJQ23p4LCG/jq0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j6mJu42iJRNYsBi4EFpPeC9/dvw96xL5mMMnFDgN+TXlMYeneOl2HoxKpkYki9NsMjCPEx831+IV0VChGwMkAiNgprW2rUJ7ENKPS7a9LmLDHRaLzJnAqxMAybs9Z0X9xG9/XzvP4Ql72FVDyMFHkqcVhJ2smMGo1hs2NuqIvtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ASwUo+v3; arc=fail smtp.client-ip=40.107.113.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VI9yeuhkv7edmm0RzbLWPQp+Gh4gV1Sd5wiabB0WwDN9M8poMI86qFEj/nXzWegQoCSLl15iPQmCrIusn6eJPKEFVmzsxWf6A+B3fqWSftu5DsumgVFATivN3d3Gho6Wr7MM/FGrMBuViXiWp1uQcg5txqQv8Ck8CSczNgC+IbpcC9J8mdprZ0G9fz/C/hiMo2GmGh/Mk45lbKi95TwJjs7i6ZlEdJeGWLk+4ozPXB3ZyP2BnODsTPILLvEYxczi8llILxV68RptXF9Ha/SBhOfox4fMvGTvQGN+yNIp7jy9MZhwVbcV1zxJKEHFkfQp9ThD+mcOVNyxNwjTIBwJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBv+y+GLZkxophCfqkOGjIu+TDNkiWJQ23p4LCG/jq0=;
 b=F+EHO7yANEI14A89MqOsPyCn0Hm3XT1j9/r5afu2xGxyApWEKz0qBaFzYe8u7ahQLObvfgXDKzK/HpxwoQvSCT4EiYVqD33oaRNBzeJDV/u0/kPj0slN56wFvp1W8m/uziijsY+EIaVAKPQUM6G53mCP2RyVr014go1/Sw6En784kPeW9KTx3X3zh3bJtxa9hj9xkkQmECpuQWc5/h4m4sTFo50OGZEF/dn0rbNeHCtyuSnRIppBGnfVQ9zpID2OCaWFxtPaXZmxKta44ktamugP2hZa6TDsLkXWPzcmkA6XfF3+nGCjBErqDpV/f9Y2xT3CVtn5ydm7fbPKp6CiFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBv+y+GLZkxophCfqkOGjIu+TDNkiWJQ23p4LCG/jq0=;
 b=ASwUo+v37NB1DHNoPVtzHLEVYPsGdMOeTnsiCXeKkBhsDHGPDkI5ClMJdE7v8yLw2G/cB1EmoZpoc9C5cF3ihPVPq12gzpMjA8J3NLnaZIH8TvWbb7nyPc31UJ2vn5Kb1x65G3rxKpiqrK0KA0U1yLRd+CrOqge4wyQrDt/AZvg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11780.jpnprd01.prod.outlook.com (2603:1096:400:3fa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.34; Thu, 20 Jun
 2024 09:49:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 09:49:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ulf Hansson
	<ulf.hansson@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P)
 SoC
Thread-Topic: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P)
 SoC
Thread-Index:
 AQHavXKKlbJlYW/ECU6oeegXq/xW5LHLpnmAgAOnaACAAQFLgIAAHfcggAAEooCAAACvcA==
Date: Thu, 20 Jun 2024 09:49:42 +0000
Message-ID:
 <TY3PR01MB1134652A77AFEED63DDEF034886C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <prdvmtsp35yy2naohivbrya3go6vh5ji2cdjoebw3ovditcujo@bhck6tca6mhj>
 <CA+V-a8u6KAFp1pox+emszjCHqvNRYrkOPpsv5XBdkAVJQMxjmA@mail.gmail.com>
 <o7tswznmyk6gxoqfqvbvzxdndvf5ggkyc54nwafypquxjlvdrv@3ncwl5i5wyy3>
 <TY3PR01MB113467E6EF1CFC24154AF73E986C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8s-fCtQ8GKVh_REkPO81v0oCKPGiLJ5aiJOVdVUbvbCzA@mail.gmail.com>
In-Reply-To:
 <CA+V-a8s-fCtQ8GKVh_REkPO81v0oCKPGiLJ5aiJOVdVUbvbCzA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11780:EE_
x-ms-office365-filtering-correlation-id: 4f5bf606-afe0-4eb8-8a5c-08dc910e4f1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|376011|7416011|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?aWo0czc1dnVsMzY2LzVsNVBreEVVZUxXUlBWa0FPaDU4d28veE16OWx2ZEU0?=
 =?utf-8?B?c2cxQk9VSjl2c2hXVFZPcUg4Uy9EVDBqcmVIbkRXcXpjdUZnajBFb1lmNW11?=
 =?utf-8?B?cWtBWTI4OGYxNUZaL05NUGM5cTVUWWJrZWdaNEdoU0sycHNhTE8rY1NiU01v?=
 =?utf-8?B?TWtLMklpUDMwd2c0MUFWa2k5NjFOYTF1RFF4RGxuUUtwVG1ob2ljbWN6T3hI?=
 =?utf-8?B?S2ZVQWc4WG56dHR4R1ExTEhmenpYK2dtbENDTENHNEtxSUR3QU91dzJzM09H?=
 =?utf-8?B?OGsxbkxVVGJaTDE4djE4Z3RNZEJLTzU5WmRXQ2tZNUdpSkZaSUU3RVZBUGZ1?=
 =?utf-8?B?cFB0ZUhMRTNjZjgzRFdrWWovc2VVQlR3WTRNdXNzNXhORlNvMlZFMlhJbUc3?=
 =?utf-8?B?TUd5Y3pSTlZmMHNKVVYyUVltdE1mYlhXTTZvblFYZWtMNHpiMEYwelF4UktF?=
 =?utf-8?B?aEtPQnBrcDFIVUY5VngrdmRsRXpydmk4dFNBUTBBNTBKWkk4U1FSZ0lTMHlw?=
 =?utf-8?B?cEFMbFpZV3pLSTdQRDhrMnpSYU9ZRFRWMkxsczYyN1Y4cldCNnVXMm8xKysw?=
 =?utf-8?B?VWthcFVhc0NCNWpaN0I4bEg3UzFoOHJ1NVBWb2NScGhKeHoxWm92RXhXTXRt?=
 =?utf-8?B?QjVoOFZRbW1WQ1NpTUxaVWZnRG13R21TbjBqZ3l1SHhFdk5rSUtjUmJPdERB?=
 =?utf-8?B?RFlCeHVhVEJVeHF0QVErRGVESDgvNWVoVHlDb1JKemxXdFFwWEMzeTNyWXdT?=
 =?utf-8?B?b1ZGcjRsUGluV29vVTEyeVdsKzhoQmVvWmhGNTIzVU5SZGhGR3FwOERDQzh1?=
 =?utf-8?B?WFZpRWcxY3lsUUFtZXRubGd3ZXI1dWpIcGJvTmY1NmdDU1BPcUU4OG14NUwy?=
 =?utf-8?B?SjJMMjFFZ0RQbUVKeHNBS3I4REdRWkh5UE9mOXYxZ1daZUxjTGdETUcwSTF5?=
 =?utf-8?B?VjN1Z1FNR09CbEVDWS80WkpaalFaRDg4enBoZGcwVzIzTWU5bDNvWm1qL2g4?=
 =?utf-8?B?MUE3WjdqTlBlRjczVGVXcE5uRmovWnhuMEVhNTBBSm9EZlNHajJOaTRLRGRP?=
 =?utf-8?B?RElaQXBWSXhhNmxaY0NmVlBSUFplYzAvQWVBNGdUYkdMZnhDVnM4cWRuOTlt?=
 =?utf-8?B?MFRyamg4WG9jY2gzT3BpdmVxYmhRZjMwQjhiTS80SmRJMTMyRTNCQyswRTl5?=
 =?utf-8?B?Yk1KckN6c05WYkJBcWRRVUpBeHhRM25iSUVYNnFCV3M0dHJHS1JPN1J5bUcy?=
 =?utf-8?B?RG5uR2NqajArUlFEZE4zODZhajV0Q0UzNk43eHJmZndPYWFCS0JuYks2d3dj?=
 =?utf-8?B?bVEySkliQlY4cU9WZXRidzJmODRoRDZ2bjlwaGZ6WUQ4OE5wZWxJcDQ5bnBZ?=
 =?utf-8?B?bDhaOGZiZHdQVmJoZW53aFpyNVE2UWkwTElnclZDckR0aC8yTWNnRzZwN241?=
 =?utf-8?B?UVdodVM1TFJJdi9rZHUvY3VhUFRhU3BVbUloN3J5Y3lDWWd5RWFMcGtFaHlE?=
 =?utf-8?B?SXcwUEFjSXUzWXVjU2lETzNlNERTVGxLbFo3R00rYlVVSndQMklqZlp2U0lO?=
 =?utf-8?B?YUpVZFo2L3YwZHlhalhrOU9IWTNLWlFrZ0xVaGIzdHhMWlRzL3BodG05Nzkr?=
 =?utf-8?B?dEMzd2lPTGIrbkJDZzBURmlWY3BFM1Ryc1pmUGxhakpMKyt6VmI5c05nMG9q?=
 =?utf-8?B?VXQxbksxL2lnVVNnQVhSYmd4WnNQbXFMV1pRN3hLNVc2Z2JOSG5hK2JDdHd5?=
 =?utf-8?Q?Yi7sGW2UNdC6KtNUy1LhOYIq8puP1HswGjJkm8L?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(7416011)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2N1UVhiQjY5VXErQXhQMXJNZ2lLdjBxb0N5WDFBcW9kUFQ0amxnemthbU9R?=
 =?utf-8?B?STBuS090Y1BXSjE3WENNOU5KdWhOd0E4Rmhjdng3THR6LzU5TmZiSUpmMXJk?=
 =?utf-8?B?QmVnTU1KN3I3NGc4TGlaa1BUc3dLMW1hcWo2ZXhVVnBjdXhMRnZ0ZkFyMUEx?=
 =?utf-8?B?MHRiWjJmamdiNWFWV1lHUythbDluZjQ2ZTRYam0yS2FHbWxSTjczUGpGYXY5?=
 =?utf-8?B?dXNjUndaT09FVXgrSEkwVjFya2xRc1NCOUI5MGg0cTRreVhHWk5hVysyeWV5?=
 =?utf-8?B?SlIzS0JuNFJxVlA2aVd0NEkxVDZnR2dvemxYNHFTZ0hlczBWd2NRcFhMSE5U?=
 =?utf-8?B?ZnN2MDFtVHl0OHc0S3BmTDJhVGQ5dTdKU3F1cjFnQnlGYkNKMDFxS1BuM0Jt?=
 =?utf-8?B?VXQxNUNMdk1YcTNHdTRFamFVOStMeTBwalRlUHpUaHhJMUh0K0Z6VEJXbWNO?=
 =?utf-8?B?SStlWXoxbGxLYXhrbElJcVo0UjZaOEt0UDI0amdCR3NUWlhZSGhiTUJvaWZa?=
 =?utf-8?B?Tm0zV1lBOGhmTHAzdWplNG8wVWE1SWtacnJCVXJQZ0YvTTNvR084eGFqdHlz?=
 =?utf-8?B?dmJHTElyNTVaaS85a0Z0NVNjUWhEYkN4cVgza2pqM0N0Rkt5Z2tBZEZnd29N?=
 =?utf-8?B?MkdUbmY3NXBFWmZhdnpaVDZWTmsycmN3Z2dXRHRqZWpzZVk4NVh6WmcxT2xq?=
 =?utf-8?B?dityWWY2VlRsSFhHVlVuRXRxUVEwcVpwaytRckk2SVllZnRnSlUrdE9ORE8z?=
 =?utf-8?B?RnVxVURNcnZnY3B2ME9TSHZ0Zko4U0cvbXhkejlDQ2RadTNGYkFrcVhQUzZh?=
 =?utf-8?B?Y3A3TWRPR3YxT1BreVdRczZBSE5HTFhpT0VVMFA1c3djOHRXVmRqaTM5VDBK?=
 =?utf-8?B?YnZVTDhZMVBWNG9wN0g1U3BzaTVDZGI4UmFnc2hyb0YwazRpY0hOQjBGejJa?=
 =?utf-8?B?eksrWlZlbFRZUjZIbUJOS2N1R1pvaENpdzhrWGtoQ1YxMUVPU2VXc2VIVlI0?=
 =?utf-8?B?bi9yZWhmZGRENDVrWDZYYTRMZSs2UlNtNnVQZGQzdDJZaEVQYVduMU9PbTE4?=
 =?utf-8?B?TlR0OXRoY1JNd00vM25tYUI4SFBHOVZNTmdKWDd3YmVBa1JSRzVuYWFnZnBH?=
 =?utf-8?B?MmZQM2h3eDc1WkRhWFh1TTAxUEtFWWpnMHY5MjUzV3RGWUpMcmhzRFRCZXQ1?=
 =?utf-8?B?OVFWNVRzVytvc0dyTUJsdnlJWUV4VlU0RytIRzRid0xtdjNRcndkcFpESkpq?=
 =?utf-8?B?MWpKVnd2aWkrQ01VamRUZmJCeW9VbnNiOWprYW1ybVBnZy9mcGNDdisvanF3?=
 =?utf-8?B?YnFHS2Z0UlNqN3IvT2wxNGIzQUROUzNKUEZXNnlaMHB2T2d1WjZZdXhDaHk5?=
 =?utf-8?B?SVdrMFJoaWREUzY4bCs4di9tNkNydVRrZXE0dTZzY2dKM3EreTR5dEJzQnhj?=
 =?utf-8?B?YlI3dFg1VUlMVFlqWG5iY29CNVRrVEZ3MzNnOHhUMGdlMUFSZGhta2JycGR4?=
 =?utf-8?B?cnhZT2VjK0xzVzRpS3oxaWVLSnR5eVBYTjNuTGVJQU82WS9zbVhWZGpvbjhz?=
 =?utf-8?B?a3pja1FvNGVCbncvOHdCL1NzVHNOeVlpN2U3R2dWRTBLQUcwODlWN05CUW4v?=
 =?utf-8?B?QjRPZ2FsUEdINVd5SFZkWlZJN0NpQjJPb1MwMysrVE13Sit6TG1mcmMydmsz?=
 =?utf-8?B?aU4rbjhxUGR3T2xVMVRUbWl6dldXemJSTkNSU0pkbWVURTRaZkt4eTVJS3ZR?=
 =?utf-8?B?UVNaSm1QbEt6WUhpdGdwZlBkbU1UV3lNTDJSaXJreHlYSENKQXBMbXhLMkx0?=
 =?utf-8?B?UHNzUmZ4bW9IZjRIOHBzNWt2NXgxd2ZuN1BBSEhBTXorQ0lKK1E3bWxjMVVu?=
 =?utf-8?B?UUllczdNaHQxazA0azhvZklyZ1pQMSswZXczeTF3aXZIWG1DSFZ6NXZ5M2Zx?=
 =?utf-8?B?bmVYOXJjVnRGZm5hZjcyTzBTamN4Z3pEb3FXeHI0dDNDcWYwaHM4dnBtVkRG?=
 =?utf-8?B?R09Udm1EK3pGUHMyRlltM1RHQU9uOENWdmhVcS80bkRBUmo4dFFxT0ZQMmd1?=
 =?utf-8?B?TnR5c3lLdGszZXJqM0k5VFZ4VXF2YUQ0YzBkVEh2K0ZjUmVJbHBDaDF3VVBl?=
 =?utf-8?B?Y2lRbzRzRXZUYmVEUG5mLzd0K0hQdHRNNVI4WTlrOE1SYjFORXNIcUpobmZ1?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5bf606-afe0-4eb8-8a5c-08dc910e4f1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 09:49:42.2521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YciUHkg3jw/dUlNnNTe5KKskqexz+860tqqT0T7biZgFmzIcOhDwlIYP4sDMyn7C9iWp9x4+Grwu9l7VU2g5nt58IoTml86elbN2mcJgGJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11780

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtSRkMgUEFUQ0ggdjIgMy8zXSBtbWM6IHJlbmVzYXNfc2RoaTogQWRkIHN1cHBvcnQgZm9yIFJa
L1YySChQKSBTb0MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIEp1biAyMCwgMjAyNCBh
dCAxMDozMOKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6
DQo+ID4NCj4gPiBIaSBXb2xmcmFtLCBQcmFiaGFrYXIsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNh
bmctZW5naW5lZXJpbmcuY29tPg0KPiA+ID4gU2VudDogVGh1cnNkYXksIEp1bmUgMjAsIDIwMjQg
ODo0MCBBTQ0KPiA+ID4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggdjIgMy8zXSBtbWM6IHJlbmVz
YXNfc2RoaTogQWRkIHN1cHBvcnQgZm9yDQo+ID4gPiBSWi9WMkgoUCkgU29DDQo+ID4gPg0KPiA+
ID4gSGkgUHJhYmhha2FyLA0KPiA+ID4NCj4gPiA+ID4gSSBkaWQgZ2l2ZSBpdCBhIHRyeSB3aXRo
IHBsYXRmb3JtX2RyaXZlcl9wcm9iZSgpIGFuZCBmYWlsZWQuDQo+ID4gPg0KPiA+ID4gT2ssIHRo
YW5rcyBmb3IgdHJ5aW5nIG5vbmV0aGVsZXNzIQ0KPiA+ID4NCj4gPiA+ID4gLSBGaXJzdGx5IEkg
aGFkIHRvIG1vdmUgdGhlIHJlZ3VsYXRvciBub2RlIG91dHNpZGUgdGhlIFNESEkgbm9kZQ0KPiA+
ID4gPiBmb3INCj4gPiA+ID4gcGxhdGZvcm1fZHJpdmVyX3Byb2JlKCkgdG8gc3VjY2VlZCBvciBl
bHNlIGl0IGZhaWxlZCB3aXRoIC1FTk9ERVYNCj4gPiA+ID4gKGF0DQo+ID4gPiA+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9iYXNlL3BsYXRm
bw0KPiA+ID4gPiBybS5jDQo+ID4gPiA+ICNMOTUzKQ0KPiA+ID4NCj4gPiA+IFRoaXMgbWFrZXMg
c2Vuc2UgdG8gbWUgYmVjYXVzZSBpdCBpcyBqdXN0IGEgInJlZ3VsYXIiIHJlZ3VsYXRvci4NCj4g
PiA+DQo+ID4gPiA+IC0gSW4gUmVuZXNhcyBTb0NzIHdlIGhhdmUgbXVsdGlwbGUgaW5zdGFuY2Vz
IG9mIFNESEksIHRoZSBwcm9ibGVtDQo+ID4gPiA+IGJlaW5nIGZvciBlYWNoIGluc3RhbmNlIHdl
IGFyZSBjYWxsaW5nIHBsYXRmb3JtX2RyaXZlcl9wcm9iZSgpLg0KPiA+ID4gPiBXaGljaCBjYXVz
ZXMgYSBwcm9ibGVtIGFzIHRoZSByZWd1bGF0b3Igbm9kZSB3aWxsIHVzZSB0aGUgZmlyc3QgZGV2
aWNlLg0KPiA+ID4NCj4gPiA+IEkgc2VlLi4uIHdlIHdvdWxkIG5lZWQgYSByZWcgcHJvcGVydHkg
dG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIHRoZQ0KPiA+ID4gaW50ZXJuYWwgcmVndWxhdG9ycyBi
dXQgdGhhdCBpcyBhbHJlYWR5IHVzZWQgYnkgdGhlIHBhcmVudCBTREhJIG5vZGUuDQo+ID4gPg0K
PiA+ID4gT2theSwgc28gbGV0J3Mgc2NyYXAgdGhhdCBpZGVhLiBIb3dldmVyLCB3ZSBuZWVkIHRv
IGVuc3VyZSB0aGF0IHdlDQo+ID4gPiBjYW4gc3RpbGwgaGF2ZSBhbiBleHRlcm5hbCByZWd1bGF0
b3IuIFNlZWluZyB0aGUgYmluZGluZ3MsIGl0IGxvb2tzDQo+ID4gPiBsaWtlIHlvdSBlbmFibGUg
dGhlIGludGVybmFsIHJlZ3VsYXRvciB3aXRoIHRoZSAidnFtbWMtIHI5YTA5ZzA1Ny1yZWd1bGF0
b3IiDQo+ID4gPiBwcm9wZXJ0eT8gSSB3b25kZXIgbm93IGlmIHdlIGNhbiBzaW1wbGlmeSB0aGlz
IHRvIGFuDQo+ID4gPiAidXNlLWludGVybmFsLXJlZ3VsYXRvciIgcHJvcGVydHkgYmVjYXVzZSB3
ZSBoYXZlICdjb21wYXRpYmxlJyBhbHJlYWR5IHRvIGRpZmZlcmVudGlhdGU/IE5lZWRzDQo+IGFk
dmljZSBmcm9tIERUIG1haW50YWluZXJzLCBwcm9iYWJseS4NCj4gPg0KPiA+IFdoeSB0aGlzIGNh
bm5vdCBiZSBtb2RlbGxlZCBhcyBhIHJlZ3VsYXIgInJlZ3VsYXRvciIgYXMgYSBjaGlsZCBkZXZp
Y2Ugb2YgU0RISSBkZXZpY2U/DQo+ID4NCj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZG9l
cyBpbXBsZW1lbnQgdGhlIHJlZ3VsYXRvciBhcyBhIGNoaWxkIGRldmljZSBvZiB0aGUgc2RoaSBu
b2RlIFswXQ0KPiBpdHNlbGYuDQo+IA0KPiBXb2xmcmFtIHdhcyBzdWdnZXN0aW5nIHRvIGhhdmUg
dGhlIHJlZ3VsYXRvciBvdXRzaWRlIGFuZCB1c2UgcGxhdGZvcm1fZHJpdmVyX3Byb2JlKCksIHdo
aWNoIGNhdXNlZA0KPiBhbiBpc3N1ZSBhcyBtZW50aW9uZWQgYWJvdmUuDQoNCllvdSwgbWVhbiBz
dGFuZGFsb25lIG5vZGUgd2l0aCBhIGRldmljZSBjb21wYXRpYmxlIGZvciBlYWNoIFNESEkgZGV2
aWNlIG5vZGVzKEFzc3VtaW5nIDMgc2RoaSBkZXZpY2VzKT8NCg0KMyBTREhJIGRldmljZXMgbm9k
ZXMoc3RhbmQgYWxvbmUpICsgMyByZWd1bGF0b3IgZGV2aWNlIG5vZGVzIChzdGFuZCBhbG9uZSkg
Pw0KDQpPcg0KDQozIFNESEkgZGV2aWNlcyBub2RlcyhzdGFuZCBhbG9uZSkgKyAxIHJlZ3VsYXRv
ciBkZXZpY2Ugbm9kZShzdGFuZCBhbG9uZSkNCg0KDQpDaGVlcnMsDQpCaWp1DQo=

