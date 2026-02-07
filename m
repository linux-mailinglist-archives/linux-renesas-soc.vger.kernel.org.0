Return-Path: <linux-renesas-soc+bounces-28029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7s4GK/Ygh2lrUAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 12:24:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C10105BF9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 12:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B57363004438
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Feb 2026 11:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6309734029C;
	Sat,  7 Feb 2026 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jc9sV+l4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D531A239A;
	Sat,  7 Feb 2026 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770463472; cv=fail; b=QhLVQFUkrF3D87MMdHZvr0pLzGEhWMasha6omnyIc09m+Bu4TzD7zoD7mPuwbAfrn0YDfVqV18IvQUPYiv0U3dIaS5RRujHuxWVYKU3H3YbixVBOqZaeWOgCfUzalhYwXb31rEwUb4Gn/8yWrJaiMiKE9F4G4wAZg+2EbWNcjt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770463472; c=relaxed/simple;
	bh=grOIRAN+XaOe0Vs7iQ55DmnL7KZPhfewJETo73WQvnE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n0L24BA4WlkzsCHl52AFH7PIKicO4BYHzsQaxr1A2YLYytgQsfEnP/S+RzRfy4khmvmSm1QvQuHmXjGbUzobLvqME55QckuzKZNQiSlKYjm3po03BgUmf+zFqM1oqp5tiDRmldtulwsScWmOPJKhwBzzlv7DAGgiHqgbXHgXdqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jc9sV+l4; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFQbkBU25YROMUNMdNgzXLYlSmgvkqiUhB9+0ABuFPRNTBPcwKp0juIM4kxqYhM1MuExmcHg6Z5FJzTlY946wZ+jNKidh+7ZeoUXficsppogF3GSjBZeqFRt5J5WJbvvBx/Iinhg2aCT0UeRapFzCwmyr+b66/6VaZOaB7ZKQlKWuZoCAj+NBTn7jkbe9vuMCBe2IwQ5ON8oOR/jE+uSjUG5svpu339sFVSeVmzaYEoZGW+6V7HNNIsz3ukdGyBynvwJA5DaQp8kE2jUQNGKO8jWCe5XWz8VFx1+N9lDM8z/gfEJQcQVwmP3t5ZakG0MbS1l/9FEd7+75FJlL6oZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grOIRAN+XaOe0Vs7iQ55DmnL7KZPhfewJETo73WQvnE=;
 b=JTWFYe3036eRmo49biELK7ja+2t+DuJiBoW+SJLjk6uVZDRGyKUL6gywhHSOhs6wgyzNUof8oaHb215mW79qNcC/TgBpVI4s2eCzdb4u0NyQABhaV0FDDn5AzmOLQjEkB2ZXdhzdj8byvfrQ8yQEyK+AA5O1RtgayVGhuRVmzMve7HYzHqXojUxf31f1gIAKe5M/ZPcUQJa24DLtSGyrD6meEooFEczAtpz8YCClD6BNo6dTf6CIqUcs7GwpUVGImHYZYe79Zuf2ojQwZKTC5sDhiQsak/91t/isYGbcu+yb6VjguaQEtuqUT4aChBbvZL3zFitjupUiM5Z83/dSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grOIRAN+XaOe0Vs7iQ55DmnL7KZPhfewJETo73WQvnE=;
 b=jc9sV+l46SDa++4+tYd8cqUEOgtlB/OA7LFHTRL/BfZyNImhdJGy4DLL+UUzhAf3fv2cfCphPP6VxDEFlmYIaa78gilsUwPx6gN3HuXaCINWrDV+dE8e5ZdVUH/cp4uiq6MP9GOYA+E/A0USyx43zkfDta7iRB6d6Yn96g0okvM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7189.jpnprd01.prod.outlook.com (2603:1096:604:14d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Sat, 7 Feb
 2026 11:24:28 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9587.016; Sat, 7 Feb 2026
 11:24:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/9] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/G3L SoC
Thread-Topic: [PATCH v3 2/9] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/G3L SoC
Thread-Index: AQHcl1ohDb0DU7qKAU2q87eBRMaF3LV3DE6AgAAMb7A=
Date: Sat, 7 Feb 2026 11:24:27 +0000
Message-ID:
 <TY3PR01MB1134666C58E7057D7118708B68667A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
 <20260206111658.231934-3-biju.das.jz@bp.renesas.com>
 <20260207-archetypal-griffin-of-enthusiasm-ccb47e@quoll>
In-Reply-To: <20260207-archetypal-griffin-of-enthusiasm-ccb47e@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7189:EE_
x-ms-office365-filtering-correlation-id: 09dd5a0f-ee23-4ea1-1666-08de663b74af
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WWVhSjFBdldJQk5oamdHbjdEbWQ1dDBTMU04UHdwVXViaDZEdFk5eUluYU5o?=
 =?utf-8?B?NnQwdG9LZXptOWhUdVZxUC9NV3MyN29UL1hPb09JQ3ZBUWIvaVNidlROaFFk?=
 =?utf-8?B?SkwwSFRER2ZjYlJDNEhjVmpKYjk4RzJVdU9lZGNmOUt0Unpqb09hSkpwblhm?=
 =?utf-8?B?RHRlc2FqTlI5ZXROcWFMTmxzNzF6aHVHQmZ2SHUwcHllbE5KaFIwdTAwYUZq?=
 =?utf-8?B?cGVqd1BLQjFza0xJL3F2bEErWlJ3NXliYlByNm8xMS9waHJlSTFnSmlVOHFj?=
 =?utf-8?B?cVVwcUo2d3hzOXdHK2ZXaU1pVGllNVNjTnNhMFQrZDFaYjJla1VQNlkzWm5j?=
 =?utf-8?B?Z21IQmNmdTVHWElsNDZCc0M0WndqWnJ0aC9oelpDWnR6MTZZVU1GMVVpUE1O?=
 =?utf-8?B?RUJnUm0vV3ljUmQ0TXFGcFlYdHBvVDNVU3drbjRmUnZqTS9LLzlUbzMwOTVW?=
 =?utf-8?B?aUZ0WjlUWUNzTzdxTjlBU3BOU1UzUzRsMWdvSC83R05jcDJDTE81enVLVjQy?=
 =?utf-8?B?Q3lWdnAwellzQmd5cTB6dFQ1Ry9KZDZFZVhaOGh5YkVWSU9CRGdYeDFXLzZU?=
 =?utf-8?B?d3NXZU5NTVJFTTR0RGw4VEwySEhVVk1SSUg2T3pyVDNIeHNaTXF0bDM2d3Ax?=
 =?utf-8?B?UFVTeXRTTEhJTzNZUGJ2L1NNSFNwaW9oRE9tSWdnM2EyNFVKUVY0YmxJUFZ6?=
 =?utf-8?B?d211a2JKQUdzeDZWa3h5S0pJTEZUV3hyRit2bUJwNlYrbjl6VjRJa3RzdGIx?=
 =?utf-8?B?R0FLSGcxMDZFU2JWUG9ad2xleWE0REtGVy8rcE02MkV3ZkREdkdHempPcFFy?=
 =?utf-8?B?K1l5RDlBbklWOVJ1S0J5STdSQXNyUHdqejA3djU0M2xsWTV1T20xMWFRZjY1?=
 =?utf-8?B?QzB5dCtYdnNBRUlHc1gzazludWFOM1F6MTM4QmxQYkR3ekFxK0lLTjdHTUg2?=
 =?utf-8?B?aWhUOHZQNzlJN0JKWWpRZnMvdTlza3ZBancrQzFZamV1SE4wS3FzY3lxUnB6?=
 =?utf-8?B?QWxVR1J2QVR1eW9PMjhjc1dJeDNKRGlHaUFDUjJGVkRoMEpLVCtmTEZQMzRx?=
 =?utf-8?B?ckFubWpueDFnVUk3SFh3UWVqNTkxYlc4dzQ4S2JOZDVRMDRwRkVHdEpvWUto?=
 =?utf-8?B?UjJGdXVMMTkrQjNqZEQ3N2M4ZjB0OEEyTDZLQlNQL3RqQVFrMlV1dHVydlkv?=
 =?utf-8?B?WjRvZ1ZXaWtGNWJMOWpOVjVKUmxjdFBmdE1ValdNQ1B0VXFQWVZtQUNYd3Vw?=
 =?utf-8?B?ZTRtVUMxSzR4N2VST29yeTZvL2tZajRsbXJPK0hnajkvd1VTa3A4NG53Q1RG?=
 =?utf-8?B?WEdYYUZHZ3BrMW0vd1Y2eFhNUjhrV1ZWREYxT0xmWlpYQitlV2cvQ3ZHZTAw?=
 =?utf-8?B?L294azNOQWV4QlczS1dEMWk2UFZJOGViamM0SGh6ejRaWDJzSW41Vytkdldm?=
 =?utf-8?B?cCtCd09DRE9LTDdNVWJIVkFsMmFJbHJ0YUpwaGhBQ0g1SjlxaHJoc1Q0M0pD?=
 =?utf-8?B?aDBVU1dhbFZ2aFl0RU1iSVRYL1ZHU0kvRG1UVnYrVXB1NjlHaDFPY0xpZU81?=
 =?utf-8?B?bGtJSHVsaUhGbnlpOW91WWZTMld5NE91TTU3MVVpdFdTSWtqZVdTcUZNZ3BF?=
 =?utf-8?B?L2ZlamtvVWhNTVp5a3B3YnBwVnI2M00zcVpDSDk1ZDFxLzRxU1djZ1hHYzVR?=
 =?utf-8?B?VHpBK0NpUXVIL1o0dlRaeVJDd25WdzlsZGxudy9UYUdCZUthRUZFNDdUa3RG?=
 =?utf-8?B?QVRNbzVhUDdHeGc5R05WWDVuTldNWUdCTHhFdldnSXJqMStvc1l3dkxkR0lN?=
 =?utf-8?B?TkJMdENzWkE3Y3JTdHFSVmZ0cGg0dHZxd0ozZW5tZTU4WjVDeDBQaHBvM2FI?=
 =?utf-8?B?ZGxPaEV4ekc3UVFHTGY0aHIwSDQ3NEJRQy9mUWR3V3oxTzk5aUhkMFFvRXda?=
 =?utf-8?B?a2hSVGdkMnpldDdubitadXFzNmphbFplRjg5RlVsOG1iTjZwalN3Sno3UDNj?=
 =?utf-8?B?VHBZQ3IzcHkrY2xmYkpROXJEVUliUzc3bGZROHdkOUJiRGh3ekpPN0ZQdEFE?=
 =?utf-8?B?bHQ5OUlERVppM1F1MTdnbTZTL01VZUttaG1aYXZPTGtSRXY5RXZveEFWbHB0?=
 =?utf-8?B?bWNldGtnZWhIdG05M0Y1MmdVUWtBWGQ1cVc5bzNRcWNoSXpycXhzcXJzRkE0?=
 =?utf-8?Q?5kt9/p236X1/qtjMVbKonWE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Slp6cWVZdGNSZFE2bTRWWnpPTThqajVJaEtGUURZVXgxUWVZaFBveUZlSkt0?=
 =?utf-8?B?Y0x6ektJRXhaSHRhOEdMaWZzRmk4ZXBEVzVMSkpKMCs5U1BrMzhTZnVvaVdn?=
 =?utf-8?B?dmlwTXlKbjlDMzBTdVdMWG9IZ0tmeENPQjhRdEl0ZFBIZ1BYZnRVMHA4QjRr?=
 =?utf-8?B?bGpReUV6aExzSEhyNnM5VGo3Yk5XdmpxdDFLcllWTW55OXZQMUJHcGpiZFZa?=
 =?utf-8?B?cGlaWVk5MUIxenVQWkR6N1Y3SGJ5cVlKbXZuU1hHeFMxNTZqQURwY0UrSXZM?=
 =?utf-8?B?NTBBTGpyTTZpOTBZZDlYK3d4ckFqa0VWdlQ4MHM1YmIvS2VNMUVmQXpsR042?=
 =?utf-8?B?bVc2SU42QUNRS2ZCL3Y0NmZuZzhRRjgwYW0rMUNKbVdVVFdwcEZNN3JJK3VB?=
 =?utf-8?B?VjJ3cVlzSU1WK0hvQnJUdlZ6SVZsRFd2VkoxbWNtclRGblhpTGtGNVlURmY3?=
 =?utf-8?B?UVd2aXFXa1JLVUJ4VTNtUTd3WWVmODFSY3h3UjhUTkJNWk4xaEswT0RNWGVX?=
 =?utf-8?B?cXNWR09uTkhiQlF5UkZndXNwakxiS2FGbDlRZGtDeFBhdVpNNmt6S3FpSjhZ?=
 =?utf-8?B?NjAzRnZaSkR1eTlwMVA1OVkxdkw3cFFSdGN6STlxMnNSOWdSWlMzQks4bHZ3?=
 =?utf-8?B?WlVHNUc0WnRKRjBqTThLcmpkempWaEphYlJ0d3BoU2dXdzY1OUpDbmdhSXhV?=
 =?utf-8?B?WGx0eURiZG1HRDZxMjhSTDZNUzR6QVYwOFo5QkR5SDlROGdFaSsyTFhNRnBW?=
 =?utf-8?B?MWZuQ3ZMSHVFbHNuV3JLZnI4TG9Ya3c0Y1pldk9xSXFleUh2VWlwUUFsOUl2?=
 =?utf-8?B?Tm9URWtsMUtncmFyZDZYMVFKU2VYWStuUHhxZ1VSelhObWJmNHRramlRQklH?=
 =?utf-8?B?eVlUdkJUcmNYQUI2K0FXM0xxdm1WanZvWkRHRWN5b25ZMW9FYVBnM29BV1Jk?=
 =?utf-8?B?czhadVBROHQ2Qmg3ZDRJalE3aWdpaUwrUjQ3UGxncXZKZmszeEpCTWd6c0JD?=
 =?utf-8?B?WEpXT1dMU1U2TzZpb0pkWHBsVWUvMXR1YjdvWFNMVXAwSnFtenFmc0Q2b2pa?=
 =?utf-8?B?S1loaE1FUmRDMU1IaXNkc1dZL3NVbzVhTUwyamg0TFM4QW9sOEFPV2c0YkNa?=
 =?utf-8?B?eUFiQVhmakdRRE9KTU8rdStCdFhqdGZtSjJma1grZjBoVDZKQVZPSjlaeWxF?=
 =?utf-8?B?ZHdxS3lQdWkyeEJtN1JGdkV0MGFUM2FUMHFRVGpXRkpPYTBiUmdSY3prKzA4?=
 =?utf-8?B?OWxUVzlmYUxBZFlRM21QZlhwbVMxRXFVd0x5WmVyTm1keEptblFmVlhOcTFj?=
 =?utf-8?B?Qi8yZmNkSXlsNGgwYk1Za2lISS9jbzZVaTlpTzNJeFJWUStLclhRb1NVa3Zn?=
 =?utf-8?B?Z0VPWHZrdXk0YnFkSzdxVlIrUWQ3bE1LV0tBUHlwQ0QxU2hyYjcwaGpXS24r?=
 =?utf-8?B?eFlOS3YrZ3Yzdk0wa2VmcU52bEJoOEN3bWs1bFZaTVh3aGRhL3dHQ3RIN05O?=
 =?utf-8?B?VUV4cHF0enFSZXArM0NaeFlOeTlZTU9XNm1IOEM0TXI2aGN1NUM3YWRkd0pm?=
 =?utf-8?B?b3Y3YU1DQzNTVSs3RWQwOE9Bc1k0WW9TYy8reVhkOUZoeXNJVnlCdUNrUDZI?=
 =?utf-8?B?cDlqc2pLcnR6V01MdkJ4WWs4QW14TWpyN2RzdzRCMmg5REs0Q2hGQlczV1Fv?=
 =?utf-8?B?WE5NcE05Z21peUNBWE5xV0VQRDhFbDV4b3ROcjFMNzRqc25DQVlPeVBlNlZi?=
 =?utf-8?B?WXlMNUpxZG1DcGVSQlFWL3k0MWhvcEJlOU0wakN3ZTBwWmlVNjBJZkZQQ2w4?=
 =?utf-8?B?dXdRQlZNdkRicUxyNzdUR1dJTlE5ektvVnljVW9GMVlzclZyS3dWemxHMGdM?=
 =?utf-8?B?SWhxRHVNZUpvUG90RklsbnQ2MzNGNHBJUmxoUll0OFRwOXl5NElBWnp4V3dp?=
 =?utf-8?B?RFRiWW5wYTJWU3RFYndRQVB1Szl3azgxbjlxUGsyM3p4L2NrelZzNFFiVFdD?=
 =?utf-8?B?RExXSS9wcjhLY1k4MHNKWUJEK0hHT0Y4UHhTUGdBVGRhT0hTMERIM0k4RWpW?=
 =?utf-8?B?SjBEYmJvMlo4SzZWTHRLdDdYaG0rZ203K0FHaVVraEVWZEU5R0krS3JvYWZj?=
 =?utf-8?B?bkpTU2FqYWROaWlpVUFwY2dFMzJrKzFhU0gyRHNwNVMyZm5rR1VqZUhUckZM?=
 =?utf-8?B?Vi9GcXhhNVZjWlVCbFpveGdNZkU4UEZjV1V0MkdhTUhkU001eHprbDBOVTR2?=
 =?utf-8?B?V1pSVlgyZm0vVkp6dFJvV2h3OEdtUFA4eXV1aXM3SHBWeTBTUjF6T2VSTGNy?=
 =?utf-8?B?NFlGckFuSldVTUhyOVFxTWFRWTQ2bVk2THpjb2paRzlocEJoaGQzdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dd5a0f-ee23-4ea1-1666-08de663b74af
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2026 11:24:27.9371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xzUXeEQK+OIi2aDpEG3/f9Wki0/cfOoK/6rqtbzcdEglpqonMEK02GtikS9kSqGyRHlwa6B3OkVFMHzjFiOGTl2pE/8WNHgqX4cCKaRtaLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7189
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28029-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8C10105BF9
X-Rspamd-Action: no action

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAwNyBGZWJydWFyeSAyMDI2IDEwOjM2DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjMgMi85XSBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6
IHJlbmVzYXMscnpnMmwtaXJxYzogRG9jdW1lbnQgUlovRzNMIFNvQw0KPiANCj4gT24gRnJpLCBG
ZWIgMDYsIDIwMjYgYXQgMTE6MTY6NDVBTSArMDAwMCwgQmlqdSB3cm90ZToNCj4gPiBGcm9tOiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBEb2N1bWVudCBS
Wi9HM0wgKFI5QTA4RzA0NikgSVJRQyBiaW5kaW5ncy4gVGhlIElSUUMgYmxvY2sgb24gUlovRzNM
DQo+ID4gU29DIGlzIGFsbW9zdCBpZGVudGljYWwgdG8gb25lIGZvdW5kIG9uIHRoZSBSWi9HM1Mg
U29DIHdpdGggdGhlDQo+ID4gZGlmZmVyZW5jZSBsaWtlIGl0IHN1cHBvcnQgbW9yZSBFeHRlcm5h
bCBJUlFzLCBHUFQgRXJyb3IgSW50ZXJydXB0cw0KPiA+IGFuZCBhbHNvIGhhcyBhZGRpdGlvbmFs
IHJlZ2lzdGVycyBmb3IgR1BUL01UVSBJUlEgc2VsZWN0aW9uLCBzaGFyZWQNCj4gPiBJUlEgc2Vs
ZWN0aW9uIGJldHdlZW4gZXh0ZXJuYWwgSVJRIGFuZCBUSU5ULiBIZW5jZSBuZXcgZ2VuZXJpYw0K
PiA+IGNvbXBhdGlibGUgc3RyaW5nICJyZW5lc2FzLHI5YTA4ZzA0Ni1pcnFjIiBpcyBhZGRlZCBm
b3IgUlovRzNMIFNvQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2Mi0+djM6DQo+ID4gICogRHJvcHBl
ZCBpdGVtcyBhbmQgaW5zdGVhZCB1c2VkIGVudW0gZm9yIHNpbmdsZSBjb21wYXRpYmxlIHZhbHVl
cw0KPiA+ICAqIEFkZCBtaW5JdGVtcyBmb3IgaW50ZXJydXB0cyBhbmQgaW50ZXJydXB0LW5hbWVz
IHByb3BlcnRpZXMgb2YNCj4gPiAgICB0aGUgUlove0cyTCxHMlVMLEZpdmUsVjJMfSBTb0NzDQo+
ID4gICogUmVwbGFjZWQgbWF4SXRlbXMtPm1pbkl0ZW1zIGZvciBpbnRlcnJ1cHRzIGFuZCBpbnRl
cnJ1cHQtbmFtZXMNCj4gPiAgICBwcm9wZXJ0aWVzIG9mIHRoZSBSWi9HM0wgU29DLg0KPiA+IHYx
LT52MjoNCj4gPiAgKiBTaW1wbGlmaWVkIHRoZSBiaW5kaW5nIHVzaW5nIHBhdHRlcm4NCj4gDQo+
IFdoZXJlIGFyZSBsb3JlIGxpbmtzIHRvIHByZXZpb3VzIGRpY3Vzc2lvbnM/IGI0IGFkZHMgdGhl
bSBhdXRvbWF0aWNhbGx5Lg0KDQpIZXJlIGlzIHRoZSBsaW5rIFsxXSBhbmQgWzJdLiBOZXh0IHRp
bWUgSSB3aWxsIGFkZCB0aGUgbG9yZSBsaW5rcy4gU29ycnkgZm9yIG5vdCBhZGRpbmcuDQoNClYy
Og0KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDIwNS1wb2xhci1naWZ0ZWQt
bGlvbmZpc2gtZWY4YThkQHF1b2xsLw0KVjE6DQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjYwMjA0MTQyMzIwLjEwMzE4NC0yLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tLw0K
DQpDaGVlcnMsDQpCaWp1DQo=

