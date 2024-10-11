Return-Path: <linux-renesas-soc+bounces-9675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A99999E2A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 09:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3C9F281EEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 07:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AE420A5C1;
	Fri, 11 Oct 2024 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="d4PXk9O4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EAA209F51;
	Fri, 11 Oct 2024 07:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728632616; cv=fail; b=f6OMW635UfxezpwcBv9IIj1RmZOx5S0/lCc50Bx+AxGn8VRstbDFUh53l81i1MHgeshRr1VtqVfvDBwEOwN3BKcL2kIJL6c4KrqXW67uxKT+gizevpOrFK0cCNHkcKZWp+ZkaANaOy04xXW/DslFSPbSf4IHlPmG4yjFvKW3Iv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728632616; c=relaxed/simple;
	bh=N+XmyLbV9ZxTAWXVwAilTaOSt5XrrA+cAsZtk75nOI4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O7fQuUbWOaItoGciH8vShqqUDdgBETofkpPoGIUycNFwUb4CyY7nBo3MKSHJSMVMAOB72RRzqlZ9ZOnmf6xZvOgqOiaVPcwKJ+1SHwjuRk5SDAuhwDiN26f0i75Ag2yffXcq/Qt42i1IB5D8jnXg7BMLQwsMWy5lN7KYufVzYN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=d4PXk9O4; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCwHS2Io1372U8KDMlnFSjWWyMlCVz2Ucr0K2FOHjU9LBW4aTKH08+odt6tDIcksH0lpEi27XRvps2dTW93WAmFLjIdNCsLNER9Ijog/EPIUb1dscrNOqVDqXeb+AipGceyBR1OIlXxb2P2HVsydOoFcvwKwYF9lL7mhfeMe1pcsetW0OLXVpnAKtTv7ZNiJwJEMs1rPw7R7OX8lhcb7gHJbrzIldsojQSUxKABTMCiRUxg2GYGdh6a0ncMLyZc8eME4mwwxc1veNXKm0ljk9LlKInXkInOjHA0CHgK184ozgKN+MjvwnY+e9f0tf3/Q8sLysMed6BB0SP0bc5v/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+XmyLbV9ZxTAWXVwAilTaOSt5XrrA+cAsZtk75nOI4=;
 b=IczQtZ0os2rHbd2OSsd5Z14AyPmIlYy49zVO/+r8zSgtJDMgyRAXjC1SIbwZQ9bEsThiLCYhYAWZjwKfyfvBf5fRpUMdS+ISFzt2Lfsg2O/RzTSSD+8v4VYq+iJuWOOkmPcOVUZzFkkGLaZvLPwDZqvdA7GMjaObnEjN+Bb3vJ1sHT1O2UBcBbl6xD1z2j4yDvEGVwkomKW61wZSID9RiZqt3ru+k+Ewk+zCZ2BQEUtptRQxXqN7I2XpMCsieTr95IsGMHH7XCzQWQDe4WqV64Cv0JhEZkWaEh9EHt6Dpv3Jr2ErKz4mLCgrLxreWjaeBw7Akbkbr+RPX4CAgtmNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+XmyLbV9ZxTAWXVwAilTaOSt5XrrA+cAsZtk75nOI4=;
 b=d4PXk9O4zOHLAIxj11FtVMFChAL51U8VKyvnmPBn7tG63bMXC/EKuLOBjZi+NW5J5vd79/aOQUZG4AOMNuSWEZT6ovt/GkxRauEBKyPZoKR+0+hue5x8mmVNQI3cstWKU9XYglRVNJP+T3dsLSLJ8jVHp2NsksivSNSfbQM0Tz0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8443.jpnprd01.prod.outlook.com (2603:1096:604:196::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 07:43:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 07:43:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Topic: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Index:
 AQHbGaIZmx0KhA/2XUiyPZAzZz+L/7J9FRWwgAAGadCAAC1egIAA3vUAgAACHjCAAAk3AIAC+5uw
Date: Fri, 11 Oct 2024 07:43:26 +0000
Message-ID:
 <TY3PR01MB1134648DE5396A9ED9227BEB186792@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241008164935.335043-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A1726BCE1687C6AFF519867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113469ABB6393E0A6451034A4867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vWpUmq9esgcnjWVcPb-jUaLuKvhJF2VwiWrCx5_nOtww@mail.gmail.com>
 <CAMuHMdULuCWd1V0Az=NWHhSb7voDKbTo9rp3Excntp7qvTbbuQ@mail.gmail.com>
 <TY3PR01MB113460ED98BB6EE2575D0CBC7867F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX8rCM+yG4cwtG9yogwz0xWqD3O0aiXNMwE9Vkcpyhrkw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX8rCM+yG4cwtG9yogwz0xWqD3O0aiXNMwE9Vkcpyhrkw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8443:EE_
x-ms-office365-filtering-correlation-id: da96e3ef-7d50-4bbb-58f3-08dce9c86460
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bWxJZFpEbVNXWmtCWGhPS0tzY1ZhdnhwQTVpUkFIeDBSYjVXWGtrSkV3YkhN?=
 =?utf-8?B?eHdUR2NHZ2JMeE91QUJYUVNvSjJtRkRzNE81Y2dYcTk3dGt1ajBwVmJ3TUdC?=
 =?utf-8?B?ZzEvUXFabFNXalBXVDFnd3Jab0FsOXF4VVRhU3pEVy9McGxRQ05BZk5LeFNI?=
 =?utf-8?B?Z0xsU2hGcm1GakdIYmJzM3Rzc0FiQ3ZxREFib1JjY1VnNE9LeGlTdmhPMjFu?=
 =?utf-8?B?NHB1N1MzczBjSlYvcTRraWlKZCt0TTJoQmJzRjJOOGtKa3luL1BIaTBEMWJl?=
 =?utf-8?B?YlBFUFZQUWVvQU5xVDAyWE4ybjVNRXpWTmwvdFZCYmxqVExqWWYrUzUwOU43?=
 =?utf-8?B?RmxWTy9XYlM5MXQzeWY4Mzc0RWZYQ0FPTi9XVEhjS0E2NzRsNnNQaEVCenNy?=
 =?utf-8?B?Q2oyVWsrVjVNWnJiaVdNVFF3TVNqOWYrNlI2NzA5MXZVVWpRZ28wT1A0RmZH?=
 =?utf-8?B?UDJuTzBpMVlpalhTelp0YVk4K2kvR3lnZjRPblROQUhLU3BSdElSQzNsTWFz?=
 =?utf-8?B?MytuczVmL1VQOXRaMk0ydUxXbzFxd3Jaa09XQ1QybWFmNUk1TkxzSGlIYTUz?=
 =?utf-8?B?K2JtZ0p2STliNmdHbngxTnAzRVloOXBCTG11R3hRN3pEcjNsZnUrbXdGQXhP?=
 =?utf-8?B?cGhrS2crc3k2Ni9hVXg3OGlaaGUrcW9xYmZtNUtmQVN0c1g5K0xTRnJwRGxh?=
 =?utf-8?B?QmdxTFdtM3UwQU1TRVI5ZTRTeWNPMWI0VHgwUURrVDRkTC9PQURTdzJVbE1K?=
 =?utf-8?B?ZkNHSTlYckQyaHg5cWI1RkhWVTc4K21PU1FPcXd3VjgvamVpcHhqd3dvRGRE?=
 =?utf-8?B?emtXb2U3K0h2aUFTYXV4MXVZdzZaMWQ4SVF1cnVrSXU3SzdHVXRaTmZ1a3BW?=
 =?utf-8?B?VzVXa25wSnFCUU4wMGlpZ1lvcHNhSTFwWUpaYmd4T2tpYyttM1F3TjJncVhT?=
 =?utf-8?B?TjBvU0tQbFRjQlNaa3ZIdzJtTHl1czdwZ0dGS0J5endaMGJWME9RcU9aSmxu?=
 =?utf-8?B?S2xXa2NBNlRiaWE1dXU3RWFINUdIMUtDVVhsMHg5NlVZMkNjcDh5aXAzekFz?=
 =?utf-8?B?SDNtRHdZbzE3Szd3VVprSU9GQkh5Sk1QdFIvVmptOHlhQ2VVUHJkb1daZnJU?=
 =?utf-8?B?a09KUTVxQjNUaGR5aHhSbVJlRkZBb09vdjFKNDVESUk5RmNuRlRpanVXTTha?=
 =?utf-8?B?ekxHQ3lHNHpHcHlPR0lzbUlCejVmSzRRTWcvd2U2dkhBRm9pUUVoSytUS0hw?=
 =?utf-8?B?cW9Jd3RiODl5UHV3SHZJcXkzY2FmdVJKakk1RG5zSHZhVVlxRVRQQWJPaXk5?=
 =?utf-8?B?T0JGUjhYY09RcGovemYvbDlIcUJ2QWhlaGtYQ1JhSHJiMmJ1M250ZHBSMDFt?=
 =?utf-8?B?S0VPWFZOd1BLd1cwSzhqd0VHcFc0ZnYwcllpdEJBWUpMN2JpWXRtdndlQ2pm?=
 =?utf-8?B?N1Ntc2ZLL05XUURITW1qVWY0M3pRUVM1dXdKRDducnZKVVI3WUFsYU54SzdH?=
 =?utf-8?B?c21ZSTJJdHpJbHRCVWt5Qm42a29oYldXaXgrc2c5MXBJdk80NDE2UGlTRUdF?=
 =?utf-8?B?OVJKT1dxd0h6RDA0d2xtSmxoZkRsNFJia21YbkVaRHdJaFRJdkNMVHF6MDJY?=
 =?utf-8?B?cmZWeU1kZzJJdTEydHJSdFpxZjRpUHIrSzZzdWhzWWM4WlVwN0M1U0JraVJY?=
 =?utf-8?B?ZytIRGs4Z1IydmZvVEc4bTlwZ1VKTzM1S1FFYUNDeUVRZ3lpZTNMSlhxaWs3?=
 =?utf-8?B?TkxBSTE4WGU1SzUyRGtRc01idHhrNU5uUjVlTkVITnZ6dU44UmFKTlh0MTBn?=
 =?utf-8?B?UWNWL0dieUFmYUU2QXk2UT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajc4VFlXRXZWUGZNTy9iSnd2M3l4NTRtMVZnNXA4VmpCTXVpbjhraGhCUnk5?=
 =?utf-8?B?RXRxTDJZMEZtaWRSakdKMjhPa0h1bUNraHdnZExlajRRUi9vNEdCNG5PWWYz?=
 =?utf-8?B?M1AxNWpSclMxTStNU3d1NmxtbEVYM3BNQ29ZdXVwRTNYVkdxVVVibjF2M0Nl?=
 =?utf-8?B?NG1kemVlc0pka3l6RExPcHAwZGNieldPVkhxcnJTbjg0Ujc1Z2FCK2cwWC8w?=
 =?utf-8?B?aFc3Z0pvdW5xd0QzczBWWGd4bXRURExTM2hGZWtLZ1VxNHA2c3lNSGYxUFMx?=
 =?utf-8?B?M1NvbUR5cDI2Z0F5ak8zZUNhamxETjNQeTRFNm50b3lMS093cWhoRlo3WWsr?=
 =?utf-8?B?cU1LdnRpK1VHNi9aWEs3aHA1NWtQUU4yN1VxcFlOWEFKNkZRRlVNdURjVWhu?=
 =?utf-8?B?VlBvazl5SzE5SFhyTnNDdGRjenJ3Skl2b2l6Q2VTMFNOVVUwMThnUWJTWkR4?=
 =?utf-8?B?ZGh5TUg0akpJcEhpdkRGeFYrRG4vK3J4dDEvYmtBbTJIN3l6a2JTaitIU1pS?=
 =?utf-8?B?RG5EeEhLaWh4WHA2SExhS0dwRlpiWUVVazkyclkvZVpYSGtsVGxmMzErbHkw?=
 =?utf-8?B?aEN3T3FIVHRaUVNkSXIzaVc3dVQrR2tLYW5tNjc5WFlBZWFXVncvdnBYdlUv?=
 =?utf-8?B?bUYzcnVHNHNaT3l4NmQ3QWRiQm02bDdUTHJHaDZKRGpOZklkVXpoMVUrV05o?=
 =?utf-8?B?d0c5Rkg2RGpwZnRucmxkSkszUW1DaHF3bFE0aitXV0F1WWlZajd0MmlWSzJQ?=
 =?utf-8?B?bnlIazlOdDY1N05SVHJWL0R5Z0FGUjQrN0JDMk9pVE1LZmZNUkZhdDBFaDBo?=
 =?utf-8?B?WkF5a2NkeXZnTXFBSExMNmJNZjB2bUE4bkYvb1R6OHNEOGg2MkxwNi9iNFpN?=
 =?utf-8?B?cWhyUlg3bXBQUnluTll1eWo3ZStxeXBVV2VoZTYrbERBVTVxVy85ajdkejln?=
 =?utf-8?B?Z1hiTnh0U2xNanVWem1QSVZJTHNCamFkcUdPY0dITDJLZkFCakhLb2Z5RERm?=
 =?utf-8?B?dVpYWDd2OVZzZVlyWVlPS2liWm44czFzbC9ReFBRUjBRL2I2a0p0M0Nnc0Zm?=
 =?utf-8?B?RVdoTnhlOUgwbFNmUFhWQmpPOElPYjRHRFBYbUczRElkeU9UcndpTFdLaG5M?=
 =?utf-8?B?ZGQyOU13VXAxRkRHcngyM2dHejEreWpDbzJzaTljamxPc09jbWZ4V3Uwc1JB?=
 =?utf-8?B?NTNGSU4vNVQ5M0FGQ3lUTk9vSVhvR3NFakVSSjhCKzVybmxkcFowOFFiOHlQ?=
 =?utf-8?B?em9JTXJXQWhWbmppSXJlOGVlVXpxM1VjUW9OaXZ5U0JaRWJiQ2xKM0tjOXBj?=
 =?utf-8?B?UjdsM09qQldvY1EwWE9QM0h0ZHM3bU5XZzh2SlVEU0ZwYUhNTGdKU29YT1BF?=
 =?utf-8?B?cFRKL2Q3bzR5ZVc5K3pHWFh5clBzVFljMVVEOUxHVy96OGc3cTQybi80bFhV?=
 =?utf-8?B?KzhYUFF6Zk1PN3dGelVPWWVic0RTT21ZajFBUVdtTTgwbE5kbTcydllFVFdw?=
 =?utf-8?B?U3p1bDFCYWZpb3dvakhya3ZnbGRZTzFrakMxcFgzbHlMdTdMQzEyOUlYR3Mv?=
 =?utf-8?B?amRVczV4YWx3M0l6czYzUDViZkJ5cndNWWdiazJHYnVlcjNwMHZSamZHK1lJ?=
 =?utf-8?B?YW9uTjNUYjU4dTB0RlJ2WlRqa2t3SkpNSjhIcG5TWHRHK2FJQkpqSm9wM2hw?=
 =?utf-8?B?R1JydlVINy9GNG9hOWRpMnRSZmVlT1pEYXN6NzZYUU9vb1NGTTFsOGlOalp0?=
 =?utf-8?B?VlN4a2UveWM0aUpOTGVaYnVQc1JVMEY2bXMzeUUzMTBOcEJBM09nSnl2aVgv?=
 =?utf-8?B?YW9HdmVyRXV2S3lDT1k2cS93VjFFTWxoOXJrWlN5ZGcyaWtGaXdtSUhxdFVU?=
 =?utf-8?B?U21iTExYR0RrcDlrWVdBS2RXVkpjbXdVS3dQU2NEQXNHNmMxUUZzaVNyVVlU?=
 =?utf-8?B?NUg1T21vbG44VTdCMzVkdDBzLzYybS9sSVdSSU5SNHU5aHV6RTlNYzYyaTIx?=
 =?utf-8?B?N0pCdDNyejQranAvZEk4bFdTRnRYQisyR1FGU2liaE44MTFCTVdFRWtQOUlH?=
 =?utf-8?B?VCtIZnJ2dS84dWErdHk3eWRLTi9Nc3V5OVBLNEQxZ1hFUHFaem5GOWZtdkU2?=
 =?utf-8?B?ZE4rWEtTT1p6ZllUa1MwTStobzZrRGt1aXdKZzRnVDJQYk9RcC9RVThDVDRX?=
 =?utf-8?B?UUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: da96e3ef-7d50-4bbb-58f3-08dce9c86460
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 07:43:26.6020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJO5g/R5K/mDhmE88WzqxiE90PwWmzL0p4zvCT9+4N4Wyz90FXO7ITAG+By/3UWlNNAnW2ZmzpbBBW4BGjP8xcc9+kSt7RYxbYgODKJZdEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8443

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBP
Y3RvYmVyIDksIDIwMjQgMTE6MDkgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gYXJtNjQ6
IGR0czogcmVuZXNhczogcjlhMDlnMDU3OiBBZGQgT1BQIHRhYmxlDQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gV2VkLCBPY3QgOSwgMjAyNCBhdCAxMTo0MeKAr0FNIEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiBPbiBUdWUsIE9jdCA4LCAyMDI0DQo+ID4gPiBhdCAx
MDoxMOKAr1BNIExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3Jv
dGU6DQo+ID4gPiA+IE9uIFR1ZSwgT2N0IDgsIDIwMjQgYXQgNjozM+KAr1BNIEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiA+IEZyb206IFBy
YWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiA+ID4gPiA+IEZyb206
IExhZCBQcmFiaGFrYXINCj4gPiA+ID4gPiA+ID4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBi
cC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gQWRkIE9QUCB0YWJs
ZSBmb3IgUlovVjJIKFApIFNvQy4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogTGFkIFByYWJoYWthcg0KPiA+ID4gPiA+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYt
bGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4g
djEtPnYyDQo+ID4gPiA+ID4gPiA+IC0gU2V0IG9wcC1taWNyb3ZvbHQgdG8gODAwMDAwIGZvciBm
cmVxdWVuY2llcyBiZWxvdyAxLjFHSHoNCj4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3LmR0c2kgfCA0MQ0KPiA+ID4g
PiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgNDEgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Ny5kdHNpDQo+ID4g
PiA+ID4gPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Ny5kdHNpDQo+
ID4gPiA+ID4gPiA+IGluZGV4IDFhZDVhMWI2OTE3Zi4uNGJiZTc1YjgxZjU0IDEwMDY0NA0KPiA+
ID4gPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3LmR0
c2kNCj4gPiA+ID4gPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5
ZzA1Ny5kdHNpDQo+ID4gPiA+ID4gPiA+IEBAIC0yMCw2ICsyMCwzOSBAQCBhdWRpb19leHRhbF9j
bGs6IGF1ZGlvLWNsayB7DQo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgIGNsb2NrLWZyZXF1ZW5j
eSA9IDwwPjsNCj4gPiA+ID4gPiA+ID4gICAgIH07DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiA+ICsgICAvKg0KPiA+ID4gPiA+ID4gPiArICAgICogVGhlIGRlZmF1bHQgY2x1c3RlciB0YWJs
ZSBpcyBiYXNlZCBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBQTExDQTU1IGNsb2NrDQo+ID4g
PiA+ID4gPiA+ICsgICAgKiBmcmVxdWVuY3kgaXMgc2V0IHRvIDEuN0dIei4gVGhlIFBMTENBNTUg
Y2xvY2sgZnJlcXVlbmN5IGNhbiBiZSBzZXQgdG8NCj4gPiA+ID4gPiA+ID4gKyAgICAqIDEuNy8x
LjYvMS41LzEuMSBHSHogYmFzZWQgb24gdGhlIEJPT1RQTExDQV8wLzEgcGlucyAoYW5kIGFkZGl0
aW9uYWxseSBjYW4gYmUNCj4gPiA+ID4gPiA+ID4gKyAgICAqIGNsb2NrZWQgdG8gMS44R0h6IGFz
IHdlbGwpLiBUaGUgdGFibGUgYmVsb3cgc2hvdWxkIGJlIG92ZXJyaWRkZW4gaW4gdGhlIGJvYXJk
DQo+ID4gPiA+ID4gPiA+ICsgICAgKiBEVFMgYmFzZWQgb24gdGhlIFBMTENBNTUgY2xvY2sgZnJl
cXVlbmN5Lg0KPiA+ID4gPiA+ID4gPiArICAgICovDQo+ID4gPiA+ID4gPiA+ICsgICBjbHVzdGVy
MF9vcHA6IG9wcC10YWJsZS0wIHsNCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJvcGVyYXRpbmctcG9pbnRzLXYyIjsNCj4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4g
PiArICAgICAgICAgICBvcHAtMTcwMDAwMDAwMCB7DQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgb3BwLWh6ID0gL2JpdHMvIDY0IDwxNzAwMDAwMDAwPjsNCj4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICBvcHAtbWljcm92b2x0ID0gPDkwMDAwMD47DQo+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gTm90IHN1cmUgQ0EtNTUgY2FuIGNoYW5nZSB2b2x0YWdlIGZyb20gODAw
bVYgdG8gOTAwbVY/Pw0KPiA+ID4gPiA+ID4gQmFzZWQgb24gUG93ZXIgRG9tYWluIENvbnRyb2ws
IGl0IG5lZWRzIHRvIGJlIGluIEFXTyBtb2RlIGZvciBjaGFuZ2luZyB0aGUgUERfQ0E1NSB2b2x0
YWdlLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFRoZSBtYW51YWwgc2F5cyBPRCB2b2x0YWdl
IGlzIDAuOVYgYW5kIE5EIHZvbHRhZ2UgaXMgMC44Vi4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiBJcyAxLjdHSFogaXMgTkQgb3IgT0Q/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiB7MS43LDEuNiwx
LjUgR0h6fSBpcyBlbmFibGVkIHdoZW4gVkREMDlfQ0E1NSBpcyBhdCAwLjkgViBhbmQgZm9yDQo+
ID4gPiA+ID4gMS4xIEdIeiBpdCBpcyAwLjhWLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gTWF5YmUg
d2hlbiB5b3UgZG8gLzIsIC80LCAvOCB1c2luZyBkaXZpZGVycywgdGhlIHZvbHRhZ2UgbWF5IGJl
DQo+ID4gPiA+ID4gc3RpbGwgdGhlIHNhbWU/Pw0KPiA+ID4gPiA+DQo+ID4gPiA+IEkgdGhpbmsg
eW91IGFyZSByaWdodCB3aGVuIEJPT1RQTExDQVsxOjBdIHBpbnMgYXJlIHNldCB0byAxLjdHSHoN
Cj4gPiA+ID4gdGhlDQo+ID4gPiA+IFZERDA5X0NBNTUgaXMgYXQgMC45IFYsIGZ1cnRoZXIgZGl2
aWRpbmcgdGhlIGNsb2NrIHNob3VsZG50IGFmZmVjdA0KPiA+ID4gPiB0aGUgdm9sdGFnZSBsZXZl
bHMgYXQgdGhlIFBNSUMgb3V0cHV0Lg0KPiA+ID4gPg0KPiA+ID4gPiBHZWVydCwgcGxlYXNlIGxl
dCBtZSBrbm93IGlmIG15IHVuZGVyc3RhbmRpbmcgaXMgaW5jb3JyZWN0Lg0KPiA+ID4NCj4gPiA+
IFRoZSBhY3R1YWwgVkREMDlfQ0E1NSB2b2x0YWdlIGlzIGNvbnRyb2xsZWQgYnkgdGhlIGV4dGVy
bmFsIFBNSUMNCj4gPiA+IChSQUEyMTUzMDApLiAgSXQgaXMgdGhlIHJlc3BvbnNpYmlsaXR5IG9m
IHRoZSBzeXN0ZW0gZGVzaWduZXIgdG8NCj4gPiA+IG1ha2Ugc3VyZSBWREQwOV9DQTU1IGlzIGF0
IDAuOVYgd2hlbiBCT09UUExMQ0FbMTowXSBpcyBzdHJhcHBlZCBmb3IgT0QsIGFzIENQVSBjb3Jl
IGNsb2NrIHJhdGVzDQo+IGhpZ2hlciB0aGFuIDEuMSBHSHogbmVlZCBhIGhpZ2hlciBjb3JlIHZv
bHRhZ2UuDQo+ID4gPiBJIGRvbid0IHRoaW5rIGl0IGh1cnRzIHRvIHN1cHBseSB0aGUgaGlnaGVy
IGNvcmUgdm9sdGFnZSB3aGlsZQ0KPiA+ID4gcnVubmluZyB0aGUgQ1BVIGNvcmUgYXQgbG93IGNv
cmUgZnJlcXVlbmNpZXMsIGV4Y2VwdCBmb3IgZXh0cmEgcG93ZXIgY29uc3VtcHRpb24uDQo+ID4g
Pg0KPiA+ID4gVG8gY29udHJvbCBWREQwOV9DQTU1IGR5bmFtaWNhbGx5LCB0aGUgQ1BVIGNvcmVz
IHNob3VsZCBoYXZlDQo+ID4gPiBjcHUtc3VwcGx5IHByb3BlcnRpZXMgcG9pbnRpbmcgdG8gdGhl
IHJlZ3VsYXRvciBjb250cm9sbGluZyBpdCAocmFhMjE1MzAwKS4NCj4gPg0KPiA+IFRoaXMgbmVl
ZHMgYSBiaWcgd29yayhzZWU6IDQuNS4zLjEuMyBQRF9DQTU1IGFyZWEgdm9sdGFnZSBjaGFuZ2Up
Lg0KPiA+IENBLTU1IG5lZWRzIHRvIHNpZ25hbCBDTS0zMyBzbyB0aGF0IGl0IHN3aXRjaGVzIHRv
IEFXTyBtb2RlKE9ubHkgQ00tMzMNCj4gPiBpcyBhY3RpdmUpIGFuZCBJbiBBV08gbW9kZSwgQ00z
MyBpcyBpbiBjaGFyZ2Ugb2YgY2hhbmdpbmcgQ0E1NSB2b2x0YWdlDQo+ID4gYW5kIHRoZW4gc3dp
dGNoZXMgdG8gQUxMLU9OIG1vZGUNCj4gPg0KPiANCj4gVWdoLCB0aGlzIGlzIGluZGVlZCBtdWNo
IG1vcmUgY29tcGxpY2F0ZWQgdGhhbiBvbiBvdGhlciBTb0NzLg0KPiBTbyBiYXNpY2FsbHkgeW91
IGFyZSBzdHVjayB3aXRoIHRoZSBpbml0aWFsIHZvbHRhZ2Ugc2V0dGluZ3MuDQoNCkZZSSwgSSBn
b3QgY29uZmlybWF0aW9uIHRoYXQgMS43R0h6LDAuOVYgaXMgTm9ybWFsIGRyaXZlIGFuZA0KSXQg
aXMgdGhlIGRlZmF1bHQgZm9yIFJaL1YySCBhbmQgdXBjb21pbmcgUlovRzNFIFNvQ3MuDQoNCkNo
ZWVycywNCkJpanUNCg==

