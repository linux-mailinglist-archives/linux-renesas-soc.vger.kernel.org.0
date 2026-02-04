Return-Path: <linux-renesas-soc+bounces-27872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBALJaYeg2nWhwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:25:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A3E4742
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59B5D300C0CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 10:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E553D9042;
	Wed,  4 Feb 2026 10:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lzy9SsJv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1998F3D9040;
	Wed,  4 Feb 2026 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200739; cv=fail; b=rNtH5WCMJcblfRPG2HEybfF3ku/6fsYPVuN8rGZVYJmzQFydltwBPrQUvyjrefkJEaW65oPf2X1iFpPhz+R5euPzhln4dIFPScK3zIalL07asZkApDz+d7YJ3uwsDxX6rNGyg/+eu/7E/A5HiD2pbEuLsrfHlKwVUHCG7xMaFXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200739; c=relaxed/simple;
	bh=ulxzJPInsuC07PTyks+q/NQB2oNa9W6HmQacKoT6pHc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jYEhYxTwroCpnskSCdlGvHHSsdD8vr/sR2eAyPD3tZsc8zL2VUuac3JVFFIbMXrc7C9pl7uqRj4i2nivB/AH51Z4ts836ZiIT4M9ZnfPJQYNSryxSwREgNtKt7Z7nPq8aR0H2n5w4MF7bVr/SKRj0PCncOwVPaZ5WfbiYkaTrKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lzy9SsJv; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIpM8H4FOUI5J3pg8Kpd5znfvlsG5RdPLGMEuKnWETutp92XKqOewzUKXkEA0+duitayIP6ubhsv9g0OLkiKxvzd7YQiFjYZyn9YYzuDJ/qPtaC4jKrCLVEc8h1ru6DRUtyyqTkiUFW55Lm/MD+8Ql44TCkNzr2+Jeic8njL0mAUmmYk0y9XmRAIxxAaJYvc89nCve3MUi/69+CZlgsxw5vW0PRWoFLtRADehF1r1rZmOlqqfGwqlI+P36a0r/FyMDz7lYGtpgmIRXm2k90LR+UgGnrM3n7LwXUPmRYpk8rRYRjKpgYiWDzJlQ5IHratSr5lCQR2Ps5FJSAURS22iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulxzJPInsuC07PTyks+q/NQB2oNa9W6HmQacKoT6pHc=;
 b=cXRa2c3Lav5hPcZ3kBP0gxDFL7IoQzj/x0DBnIow82XZmuKsh5dTpHV9hPnvSIoLd3iAjxEP1J/BqrNI+LZXnos2sr9QirVcRwzuRdu/BwO2BJenFlWnVl1JQdQ4entKbehHW9T9GBrxHEsIIKpjpuJBb5hS78ipDR9RjANFbr2AncW+nuFygaGgAac58ebwIJHcT2a3pDh4QJMGDBFXOEI/cAc/4eOYN/uuTBSxf4MGeoXsdvbyu9mk0pkWaRQFxTofJ2CuaYrTwlT9cTWsWisTIDH99ePx1HlYm2QBaSRT0oMA8pwvF5iLlqKAtcMCFccElguQx2/Mqx+XxDL06w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulxzJPInsuC07PTyks+q/NQB2oNa9W6HmQacKoT6pHc=;
 b=lzy9SsJv5G1nd0OUduWSAqdqavbGhyKDYRIV6dByi6wN711G6cdFIC4Gi3ZHdWS1iJfQrXwYNVyrxtRq3abV0x/e7n8aVryOekiQXl7CR9NfbBo70hYybVgwIqeTzni/V86xT0PPgOpBS9uWKbzrsfReL8bGrMn2d7CyVT4HMOs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14890.jpnprd01.prod.outlook.com (2603:1096:405:257::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 10:25:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 10:25:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling
 range-aware
Thread-Topic: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling
 range-aware
Thread-Index: AQHclWNsQepXURhRS0aTtfgvJAtpW7VyFyQwgAA9qICAAAEloA==
Date: Wed, 4 Feb 2026 10:25:34 +0000
Message-ID:
 <TY3PR01MB113467F387FE21FE26DEC5C0E8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346474FD45870A1047FB1F98698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tsUeZ6PsVxm3jHgS0X2wKRtuyuUWOfpp1r718mj_ay4w@mail.gmail.com>
In-Reply-To:
 <CA+V-a8tsUeZ6PsVxm3jHgS0X2wKRtuyuUWOfpp1r718mj_ay4w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14890:EE_
x-ms-office365-filtering-correlation-id: ac673f04-2168-4e1e-4056-08de63d7bb4f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z3BKUlNxZ1VwRlFTbDJHM2RCeXBDbEpLZGpCSUJna25zRHdjZVFpUTlGSE9C?=
 =?utf-8?B?dnBZQUc5cXptZ2JuSzcvc0NRMDMwOGgxQjhmem44TXdxOHI4Y2txUGNEU0hT?=
 =?utf-8?B?eGR5Z3E1bXdLVG4vMUNPSkFodzVMcWlWSGo3UHlnSVhCaGdZZllKNEE5YzFO?=
 =?utf-8?B?dWJoNE9YNmF4QVZrOFpHM3dnRmFlS3poTUpCbVRpUmU4NVhCenNyclVyTHVV?=
 =?utf-8?B?d2p3dXlNYW1kVzZYK3VFTlJLdUxYb2RaS2tScTFMUkJMa05nOExWeUF6aTFC?=
 =?utf-8?B?bGxWM2cxZjhtT2diMnJubGtYMFpZQkZmWG1DYURsTGFFWnJEMTIvcjExakpK?=
 =?utf-8?B?SndydEo2VlNmRjA4R1JxTzRYbjRIVEFDM29zeU5LQnNYRTBrVjhPSFdhS1Yz?=
 =?utf-8?B?ZXoyVHdkSGt4ODE2T1lrcXlVRWxlVzhOLzZSeElVRlVwK2dWUjBaNm94QTIw?=
 =?utf-8?B?T0dudkdvQXVDU3lrQzRlTkEvTkFQbG1tR2hUWGRhd0grMHBzS2g2Ry9kSVFK?=
 =?utf-8?B?OERram9mZEZqRnZza1dERyszcmpHV2RTKy83Nk84TXVjVU8vSGdrUUYzUTRw?=
 =?utf-8?B?eVNLUWsrUXhHTTQyOUhpVGJwUDMzU3hQRjVvWjB0L2p4eTc3STdjRW5jdTJB?=
 =?utf-8?B?enJXT1ZPRXltVm5vYTdjeEhiK2cxakFMempBZUNBdEJTdzdMcG9KQlMvZUZD?=
 =?utf-8?B?MHhKOC9GZVZuamREaDRkUURuUy9KYTMvSGptSlJad3crZ2ZxZWpjdkxtYWlK?=
 =?utf-8?B?RXc2aWNYVTlRblpiOHJSZzhKd3Uvb3l4Yk1qZHczL3BiQmlMeGo2cEUyZWE2?=
 =?utf-8?B?MkxmbmxlOE02ZUVJdVBsOURJdVJuV0VjK2RzU0dVUksySVhudGJEZEpRRzBG?=
 =?utf-8?B?RjdLb1Jra0x4Y3hyazd5eWRndjJSLythZ2Y2MEd4dmNyS1BCQllISUpKSkdI?=
 =?utf-8?B?WVd5SG1CSmFuOU1wQVZYaFg4MDc3SlJlSUh2MFovOGZzL2hGVjkva0xvUzBF?=
 =?utf-8?B?ZzdNRXZBUFpMMGN0UHAvWG1lRkpIajF2RzVKTlFaS0RCTWRTb0xUOWtIYmI2?=
 =?utf-8?B?cTRpNnJTM0RVMGhOT09vcnpxeVR5aDdnNUd4a09qNXBTa1NGR2lSaXlHUk5Y?=
 =?utf-8?B?SHJiWXZ4NUtsZFlDYVArMDB1dDlZelhZWFZYM3Vsekl1WkwwK2ZITU05QVJ6?=
 =?utf-8?B?blk5RzJSWExIcXphUld4dnU5YWtiU2xvNndaUnF0MTZuRFRuRUk5MWhveHcz?=
 =?utf-8?B?TXpJdm9WbDd0MnlWVEhyQWFiN0dBY3llcTNVZEJnNUk3OE5HZytmWC9vbXRK?=
 =?utf-8?B?OCtjVm9QNkdaeEM5UVI3VjFoa3V3M2p1Uk5NWE1kN21GVXdpZmc5NlM4eVFQ?=
 =?utf-8?B?VnJjYmZGTjNhU3Rka2RDRS9xUjNTb013Wkl3dzlhYjBocnRpYldQcVZoZlVw?=
 =?utf-8?B?bjBjVGc3bXRCRnRndjhDN1FwbjUxcmhjZ0xrMFJ6eUlkL1JmVXFmc2R0UzRk?=
 =?utf-8?B?U0h1YTVyRFRXRlRCNlN3a3NXaGRiNzRzVFprMlhuNzVoZkE4MjMyUC8rd3hG?=
 =?utf-8?B?OXhZektFRVppbkxQRzREMUErN0pGRXFIeW1KUkdZQTBPOW1ENWo5TWZJV3dl?=
 =?utf-8?B?ZnJXVUVHU0UwNDNyTUxTQys0bjFXcEZ6VUMvRi9vVzlEQzhYM25KaEFLZXRv?=
 =?utf-8?B?UHczTmRFbnlNTjRjYWxFc1gvcEtzNzM4T2VLQ1o5aDJSdEoyMnR3Skw3S0Ew?=
 =?utf-8?B?VHBsN0IwWE03ejl6aW1pYTdPRXV2TFhFSCtuUTRIeHA3VnJ3MW5hcVZHd0xT?=
 =?utf-8?B?OWE3elF6Z2dibVhQOHdUSW9pYXhsMHBIL1BkcTFtQmlIazhlc0JmY0lBMjky?=
 =?utf-8?B?N29hVEMzL1dxZEg3K0JLZ0NmSm1OTnFvc1RkZ08vbTBtRWdLMUdWcmY4djIx?=
 =?utf-8?B?MThWL1E2ajhUS0s0ejNGR2d3YmhFYWs1YXo5UjN3bXUrT2V6c2NUSmJJMjZJ?=
 =?utf-8?B?Y2NqMXFFOHkrRTY0ckE4U3ROUEZwd29mT3NjM3Yycm01dTR6TTNRR2d4eTNT?=
 =?utf-8?B?UE93TmxvSFBiSkticVVTUlM4T25FMXQ5V3lSSGtuTUY1RHBBcXpQaC82eEk3?=
 =?utf-8?B?MTd6WS9vdnNJYnNjaHdwdzFzV3VTMEptQzlEMTVta29YSWhaRndPbmplWWNl?=
 =?utf-8?Q?Uwh9Piz7Z427ke55o+dg18U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXFGam1QMnRQbFZiZEhucE5rT3Z5SWxTNnAvNmNjUWR3YnVjajhYYWRlei9K?=
 =?utf-8?B?MDRvNVF4aGhxeE9sRHN0alg4VTZuSkZ4TDk0TzR1Mjluem5RNy83OTRuSTkv?=
 =?utf-8?B?ekVyMDhLNHhmM3ZWQkdXL0VGLzVsbGlYN3lUc0FCckVJNXBmZ2RPNk5OSjUv?=
 =?utf-8?B?NHFkUkR5TU9NSGkyeFkveXd4QXMxSFUwVVVhUmt4b3p3cEkxSkdDQ2xZVnVp?=
 =?utf-8?B?cnJGTVo5L2VSaUpaNWJwMHVERlNYbGxRYXlYOTZTekt4VitiUGxwZVlGRkxC?=
 =?utf-8?B?T21zZHFGN3J3K3FMUkRhZ1lzZ1FkQllQTVdaUzNoR3JsSG1FWXVaVGcrZDNI?=
 =?utf-8?B?N2NJVHBuWlNYLzBudU5OaHFHSWFXL0tFOXl6RFgzcnBxb3VSZEZoRzZvaG04?=
 =?utf-8?B?QjNqMzM2NGYweWRKekZkdkhNQUNURUJzWHhGYXdJRUkvd2p4a0xmQkdNanh4?=
 =?utf-8?B?OHBjdW5YYUtCOGxTbGNxSEhKQWV3K2Q2bGoyZzFGYTU1aFl2UGZ6ZmhpSFpR?=
 =?utf-8?B?K0R4YWV5eHp1OXVFeFpqQStxTitxd2txSGcxM0ZkMnFrRENTOHo4L29BL0Jl?=
 =?utf-8?B?Q2ErMWVyOU0yTC9EUEJUQjNnN1c4WjhKS0NqSFJBNFRGVFR6VHpmMDRDaEY3?=
 =?utf-8?B?emFGZWhORlBWMEdTanY5dFJkVE1FRlh5Qm1icFpEaEttd3RuSU9adUcyWjZ4?=
 =?utf-8?B?QTZkTzk0eHowWEZmdGRGbTZFTVRuUUJHVHVsbFJhV25JbURzVkI1azE5TldN?=
 =?utf-8?B?T2U5amxVb1Jpd2Y4MlAzMEluNllaUlFGakNETU5MUmFzVDllV2dzZEdTQkFx?=
 =?utf-8?B?RUlvOU02YnRGQktSM2NXK1ZmOG1GL09obFl0OThFUWpUZjJPSEYwZXBPUEJB?=
 =?utf-8?B?QXpvMGtoc0t2aTB4NjhIb0YxL3ovb3hsaHZTcE1EckQrTEE4c256eUVPd0Jm?=
 =?utf-8?B?ZkV3Q29LWmdrUDJGa25pbmNsQ2plZzBqclZ6Y0N0S2hSTTBxRkNWa0swRThB?=
 =?utf-8?B?Ykl4aG9Nb3RSL3o5SzlWZzJITGFWeG9PVUo4enhmNUl0Uno4d1UxOGE4cE4r?=
 =?utf-8?B?QVdFQWFKeFBzOGVzNHA5Q05UcytYTHVIQlVIYkN3VVRPazdkc2pwdFFSUlpU?=
 =?utf-8?B?NlovZzh4TGlnRVZPbTJVTG5HbXcvakE3Z0Q4bUMyRUl6T3pzSyt3VG1CNk5l?=
 =?utf-8?B?WTZjRjVTeHgyR0NabDd4Q2o2akpkeWE3UlE2Vm9JZFdxTE1FalYwakQ0YVgx?=
 =?utf-8?B?N1czcGRuK2l3NFVwbFFxdi9Jang3ZmQxK3NwTUQwSGtkN0dTSTBpYzNrcVd1?=
 =?utf-8?B?QnFMTG1LQTRob0ZBNVhEakQ2dFFUblMzdCtXS0YzWmhaVnVFeWJrbWFjY256?=
 =?utf-8?B?TDMrbnkwSzFWNEd6Umkycmt0WFkrbGN5bUR3VzVYR1lzVlZZM25BdWdXamZw?=
 =?utf-8?B?OGRYcVFRSWRhcExtelBrdzA0QVljcUE2NHpjU2twSFBzQ0tLY2FEekMrcnBO?=
 =?utf-8?B?MWVSekllTVRvZTFTTWtiTGRPSlg0Y3hZbkJsVHhubFJXdVBFZmY2d1h1NTVO?=
 =?utf-8?B?azZYWjNoOUJZNlJXNzhrZWhkd0NWd010VkkxVmNDR1dIOXR4ZHJUVEJpZTdv?=
 =?utf-8?B?eTNCcDdLSktXZWI4dUZoaWR6MEZCVWIzZDZxU1MzN0pyWTFNdXBoei9TdWZZ?=
 =?utf-8?B?Q2RXUCtyZzBOdlhrblNiRTBzQXJwNWVWVGcwNzMwVFl2MzhOamhqeWdlVWZz?=
 =?utf-8?B?RnBDOXQvcmpKWEsxUzk0WTF5SXhrTWN2SjgwK2xqMTd0a0pLaENxcGIyUUk4?=
 =?utf-8?B?bGYzM21YWDhVdEY4UGYxMTVTV3QzL1VacTVSdGFMSFZoVDNvZFd2VEtWR1k3?=
 =?utf-8?B?NkVGMHlQeURuVE9RRkh6dkcwM2pBQXc0RklzSGJKWlVpL3N4djBCSWsrU1Yz?=
 =?utf-8?B?MXhrWXlqaDJOdFNFL2E4Q0c5UExKWGtnYW5HNVUrWnlzNVYxbGFSZDFQRE0v?=
 =?utf-8?B?WWxjeU9qS0t0Ty8zSTVkYy94NzBWcENWRFVnT1hzeXZzY2h2VFZ6RnJuL2NH?=
 =?utf-8?B?M0VIbnNUQ2kyNnpwVkJ4UHlSSUdOcm5KU1RET0hTSXVYeTl6Mko1VzlQTHhx?=
 =?utf-8?B?ZllYYW9RbFgzSVRxWENzdllRTkdvdFB1clNNckhQamNLMkdWMmpwQkFPYzhM?=
 =?utf-8?B?TUhqWDIzbkl4cjhCYzN0emlyVUhPK0tVVGMvbXRzWmdhUjZ1SzB4UUlHUmYw?=
 =?utf-8?B?aUI4SmtEaHh4MkRMaURjVHVJaC9QeTBwbDBrOGJsbUQwZGZsNkF6MWNheVZm?=
 =?utf-8?B?aGxHcmNuVjgybFY5SXArN01jVW55T3hEWHhjeXFCN1lNQW5MUnFmUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ac673f04-2168-4e1e-4056-08de63d7bb4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 10:25:34.4723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNslCCznEb4ygwSpvSDKkiv/KP/3LX+pcxknDB4xNnvFosVMT/MZd+jHpR2ZFWLbmHRAdcmpkJor7UcXMRjTj/iE8mM9bPjpXML8pzEMKfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14890
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27872-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,glider.be:email,pengutronix.de:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 768A3E4742
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiAwNCBGZWJydWFyeSAyMDI2IDEw
OjIwDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBU
aG9tYXMgR2xlaXhuZXIgPHRnbHhAa2VybmVsLm9yZz47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU+OyBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPjsgbWFnbnVzLmRhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7
IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPjsgUHJhYmhh
a2FyIE1haGFkZXYgTGFkDQo+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC82XSBpcnFjaGlwL3JlbmVzYXMtcnp2Mmg6
IE1ha2UgSVJRIHR5cGUgaGFuZGxpbmcgcmFuZ2UtYXdhcmUNCj4gDQo+IEhpIEJpanUsDQo+IA0K
PiBPbiBXZWQsIEZlYiA0LCAyMDI2IGF0IDY6NTLigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgUHJhYmhha2FyLA0KPiA+DQo+ID4g
VGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4gPiBGcm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0K
PiA+ID4gU2VudDogMDMgRmVicnVhcnkgMjAyNiAyMzoxOA0KPiA+ID4gU3ViamVjdDogW1BBVENI
IHYyIDQvNl0gaXJxY2hpcC9yZW5lc2FzLXJ6djJoOiBNYWtlIElSUSB0eXBlDQo+ID4gPiBoYW5k
bGluZyByYW5nZS1hd2FyZQ0KPiA+ID4NCj4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJo
YWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBSZWZpbmUg
SVJRIHR5cGUgaGFuZGxpbmcgdG8gZXhwbGljaXRseSBib3VuZCBJUlEgYW5kIFRJTlQgcmFuZ2Vz
IGFuZA0KPiA+ID4gZGlzcGF0Y2ggYmFzZWQgb24gdGhlIGhhcmR3YXJlIElSUSBudW1iZXIuDQo+
ID4gPg0KPiA+ID4gVGhpcyByZXN0cnVjdHVyZXMgdGhlIGxvZ2ljIHRvIGNsZWFybHkgc2VwYXJh
dGUgTk1JLCBJUlEsIGFuZCBUSU5UDQo+ID4gPiBoYW5kbGluZyBhbmQgZW5zdXJlcyBvdXQtb2Yt
cmFuZ2UgaW50ZXJydXB0cyBhcmUgaWdub3JlZCBzYWZlbHkuIFRoZQ0KPiA+ID4gY2hhbmdlIHBy
ZXBhcmVzIHRoZSBkcml2ZXIgZm9yIGFkZGluZyBDQTU1IGludGVycnVwdHMgaW50byB0aGUgSVJR
IGhpZXJhcmNoeSBkb21haW4gYnkgbWFraW5nIHRoZQ0KPiBpbnRlcnJ1cHQgY2xhc3NpZmljYXRp
b24gZXhwbGljaXQgYW5kIGV4dGVuc2libGUuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTog
TGFkIFByYWJoYWthcg0KPiA+ID4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2Fz
LmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gdjEtPnYyOg0KPiA+ID4gLSBOZXcgcGF0Y2guDQo+ID4g
PiAtLS0NCj4gPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnp2MmguYyB8IDU5DQo+
ID4gPiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA0MCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiA+IGIvZHJpdmVy
cy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiA+IGluZGV4IDRhYTc3MmJhMWExZi4u
NmM3YmJiMDRjNmU0IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5l
c2FzLXJ6djJoLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yenYy
aC5jDQo+ID4gPiBAQCAtMjUsOSArMjUsMTEgQEANCj4gPiA+ICAvKiBEVCAiaW50ZXJydXB0cyIg
aW5kZXhlcyAqLw0KPiA+ID4gICNkZWZpbmUgSUNVX0lSUV9TVEFSVCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMQ0KPiA+ID4gICNkZWZpbmUgSUNVX0lSUV9DT1VOVCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMTYNCj4gPiA+IC0jZGVmaW5lIElDVV9USU5UX1NUQVJUICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChJQ1VfSVJRX1NUQVJUICsgSUNVX0lSUV9DT1VO
VCkNCj4gPiA+ICsjZGVmaW5lIElDVV9JUlFfTEFTVCAgICAgICAgICAgICAgICAgICAgICAgICAo
SUNVX0lSUV9TVEFSVCArIElDVV9JUlFfQ09VTlQgLSAxKQ0KPiA+ID4gKyNkZWZpbmUgSUNVX1RJ
TlRfU1RBUlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKElDVV9JUlFfTEFTVCArIDEp
DQo+ID4gPiAgI2RlZmluZSBJQ1VfVElOVF9DT1VOVCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAzMg0KPiA+ID4gLSNkZWZpbmUgSUNVX05VTV9JUlEgICAgICAgICAgICAgICAgICAgICAg
ICAgIChJQ1VfVElOVF9TVEFSVCArIElDVV9USU5UX0NPVU5UKQ0KPiA+ID4gKyNkZWZpbmUgSUNV
X1RJTlRfTEFTVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKElDVV9USU5UX1NUQVJU
ICsgSUNVX1RJTlRfQ09VTlQgLSAxKQ0KPiA+ID4gKyNkZWZpbmUgSUNVX05VTV9JUlEgICAgICAg
ICAgICAgICAgICAgICAgICAgIChJQ1VfVElOVF9MQVNUICsgMSkNCj4gPiA+DQo+ID4gPiAgLyog
UmVnaXN0ZXJzICovDQo+ID4gPiAgI2RlZmluZSBJQ1VfTlNDTlQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMHgwMA0KPiA+ID4gQEAgLTE3NSwxOCArMTc3LDI3IEBAIHN0YXRpYyB2b2lkIHJ6
djJoX2ljdV9lb2koc3RydWN0IGlycV9kYXRhICpkKQ0KPiA+ID4gICAgICAgdTMyIGJpdDsNCj4g
PiA+DQo+ID4gPiAgICAgICBzY29wZWRfZ3VhcmQocmF3X3NwaW5sb2NrLCAmcHJpdi0+bG9jaykg
ew0KPiA+ID4gLSAgICAgICAgICAgICBpZiAoaHdfaXJxID49IElDVV9USU5UX1NUQVJUKSB7DQo+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgdGludGlycV9uciA9IGh3X2lycSAtIElDVV9USU5U
X1NUQVJUOw0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgIGJpdCA9IEJJVCh0aW50aXJxX25y
KTsNCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICBpZiAoIWlycWRfaXNfbGV2ZWxfdHlwZShk
KSkNCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKGJp
dCwgcHJpdi0+YmFzZSArIHByaXYtPmluZm8tPnRfb2ZmcyArIElDVV9UU0NMUik7DQo+ID4gPiAt
ICAgICAgICAgICAgIH0gZWxzZSBpZiAoaHdfaXJxID49IElDVV9JUlFfU1RBUlQpIHsNCj4gPiA+
ICsgICAgICAgICAgICAgc3dpdGNoIChod19pcnEpIHsNCj4gPiA+ICsgICAgICAgICAgICAgY2Fz
ZSAwOg0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIC8qIENsZWFyIE5NSSAqLw0KPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKElDVV9OU0NMUl9OQ0xSLCBwcml2
LT5iYXNlICsgSUNVX05TQ0xSKTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsN
Cj4gPiA+ICsgICAgICAgICAgICAgY2FzZSBJQ1VfSVJRX1NUQVJUIC4uLiBJQ1VfSVJRX0xBU1Q6
DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgLyogQ2xlYXIgSVJRICovDQo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgdGludGlycV9uciA9IGh3X2lycSAtIElDVV9JUlFfU1RBUlQ7DQo+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgYml0ID0gQklUKHRpbnRpcnFfbnIpOw0KPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgIGlmICghaXJxZF9pc19sZXZlbF90eXBlKGQpKQ0KPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQoYml0LCBwcml2LT5i
YXNlICsgSUNVX0lTQ0xSKTsNCj4gPiA+IC0gICAgICAgICAgICAgfSBlbHNlIHsNCj4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhlZChJQ1VfTlNDTFJfTkNMUiwgcHJpdi0+
YmFzZSArIElDVV9OU0NMUik7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+
ID4gPiArICAgICAgICAgICAgIGNhc2UgSUNVX1RJTlRfU1RBUlQgLi4uIElDVV9USU5UX0xBU1Q6
DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgLyogQ2xlYXIgVElOVCAqLw0KPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHRpbnRpcnFfbnIgPSBod19pcnEgLSBJQ1VfVElOVF9TVEFSVDsN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBiaXQgPSBCSVQodGludGlycV9ucik7DQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgaWYgKCFpcnFkX2lzX2xldmVsX3R5cGUoZCkpDQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhlZChiaXQsIHByaXYt
PmJhc2UgKyBwcml2LT5pbmZvLT50X29mZnMgKyBJQ1VfVFNDTFIpOw0KPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gKyAgICAgICAgICAgICBkZWZhdWx0Og0KPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gICAgICAgICAgICAgICB9DQo+ID4g
PiAgICAgICB9DQo+ID4gPg0KPiA+ID4gQEAgLTIwMCw3ICsyMTEsNyBAQCBzdGF0aWMgdm9pZCBy
enYyaF90aW50X2lycV9lbmRpc2FibGUoc3RydWN0IGlycV9kYXRhICpkLCBib29sIGVuYWJsZSkN
Cj4gPiA+ICAgICAgIHUzMiB0aW50X25yLCB0c3NlbF9uLCBrLCB0c3NyOw0KPiA+ID4gICAgICAg
dTggbnJfdGludDsNCj4gPiA+DQo+ID4gPiAtICAgICBpZiAoaHdfaXJxIDwgSUNVX1RJTlRfU1RB
UlQpDQo+ID4gPiArICAgICBpZiAoaHdfaXJxIDwgSUNVX1RJTlRfU1RBUlQgfHwgaHdfaXJxID4g
SUNVX1RJTlRfTEFTVCkNCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ID4NCj4gPiA+
ICAgICAgIHRpbnRfbnIgPSBod19pcnEgLSBJQ1VfVElOVF9TVEFSVDsgQEAgLTQyMSwxMiArNDMy
LDIyIEBADQo+ID4gPiBzdGF0aWMgaW50IHJ6djJoX2ljdV9zZXRfdHlwZShzdHJ1Y3QgaXJxX2Rh
dGEgKmQsIHVuc2lnbmVkIGludCB0eXBlKQ0KPiA+ID4gICAgICAgdW5zaWduZWQgaW50IGh3X2ly
cSA9IGlycWRfdG9faHdpcnEoZCk7DQo+ID4gPiAgICAgICBpbnQgcmV0Ow0KPiA+ID4NCj4gPiA+
IC0gICAgIGlmIChod19pcnEgPj0gSUNVX1RJTlRfU1RBUlQpDQo+ID4gPiAtICAgICAgICAgICAg
IHJldCA9IHJ6djJoX3RpbnRfc2V0X3R5cGUoZCwgdHlwZSk7DQo+ID4gPiAtICAgICBlbHNlIGlm
IChod19pcnEgPj0gSUNVX0lSUV9TVEFSVCkNCj4gPiA+IC0gICAgICAgICAgICAgcmV0ID0gcnp2
MmhfaXJxX3NldF90eXBlKGQsIHR5cGUpOw0KPiA+ID4gLSAgICAgZWxzZQ0KPiA+ID4gKyAgICAg
c3dpdGNoIChod19pcnEpIHsNCj4gPiA+ICsgICAgIGNhc2UgMDoNCj4gPiA+ICsgICAgICAgICAg
ICAgLyogTk1JICovDQo+ID4gPiAgICAgICAgICAgICAgIHJldCA9IHJ6djJoX25taV9zZXRfdHlw
ZShkLCB0eXBlKTsNCj4gPiA+ICsgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICBjYXNl
IElDVV9JUlFfU1RBUlQgLi4uIElDVV9JUlFfTEFTVDoNCj4gPiA+ICsgICAgICAgICAgICAgLyog
SVJRICovDQo+ID4gPiArICAgICAgICAgICAgIHJldCA9IHJ6djJoX2lycV9zZXRfdHlwZShkLCB0
eXBlKTsNCj4gPiA+ICsgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICBjYXNlIElDVV9U
SU5UX1NUQVJUIC4uLiBJQ1VfVElOVF9MQVNUOg0KPiA+ID4gKyAgICAgICAgICAgICAvKiBUSU5U
ICovDQo+ID4gPiArICAgICAgICAgICAgIHJldCA9IHJ6djJoX3RpbnRfc2V0X3R5cGUoZCwgdHlw
ZSk7DQo+ID4gPiArICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gKyAgICAgZGVmYXVsdDoNCj4g
PiA+ICsgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsNCj4gPiA+ICsgICAgIH0NCj4gPiA+DQo+
ID4gPiAgICAgICBpZiAocmV0KQ0KPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+
ID4gQEAgLTUwNywxMSArNTI4LDExIEBAIHN0YXRpYyBpbnQgcnp2MmhfaWN1X2FsbG9jKHN0cnVj
dCBpcnFfZG9tYWluICpkb21haW4sIHVuc2lnbmVkIGludCB2aXJxLA0KPiB1bnNpZ25lDQo+ID4g
PiAgICAgICAgKiBmd3NwZWMtPnBhcmFtWzBdLg0KPiA+ID4gICAgICAgICogaHdpcnEgaXMgZW1i
ZWRkZWQgaW4gYml0cyAwLTE1Lg0KPiA+ID4gICAgICAgICogVElOVCBpcyBlbWJlZGRlZCBpbiBi
aXRzIDE2LTMxLg0KPiA+ID4gKyAgICAgICogQ2hlY2sgaWYgYml0cyAxNi0zMSBhcmUgc2V0IHRv
IGlkZW50aWZ5IFRJTlQgaW50ZXJydXB0cy4NCj4gPiA+ICAgICAgICAqLw0KPiA+ID4gLSAgICAg
aWYgKGh3aXJxID49IElDVV9USU5UX1NUQVJUKSB7DQo+ID4gPiAtICAgICAgICAgICAgIHRpbnQg
PSBJQ1VfVElOVF9FWFRSQUNUX0dQSU9JTlQoaHdpcnEpOw0KPiA+ID4gKyAgICAgdGludCA9IElD
VV9USU5UX0VYVFJBQ1RfR1BJT0lOVChod2lycSk7DQo+ID4gPiArICAgICBpZiAodGludCkgew0K
PiA+DQo+ID4gSXMgdGludCA9PSAwIGRvZXMgbm90IGhhcHBlbj8/ICBJIG1lYW4gR1BJT2ludCA9
PSAwIGlzIGludmFsaWQ/Pw0KPiA+DQo+IEZvciB0aGUgUDBfMCBjYXNlLCB0aW50ID0gMCBhbmQg
aHdpcnEgPT0gSUNVX1RJTlRfRVhUUkFDVF9IV0lSUShod2lycSkuDQo+IEluIHRoaXMgc2l0dWF0
aW9uLCB3ZSBkbyBub3QgbmVlZCB0byBlbnRlciB0aGUgaWYgY29uZGl0aW9uLg0KDQpZb3UgbWVh
biwgbm8gbmVlZCB0byBkbyB0aGUgYmVsb3djaGVjayBpZiB0aW50ID0wLiBCdXQgZG8gb25seSB0
aGlzIGNoZWNrIGlmIHRpbnQgPiAwLg0KDQppZiAoaHdpcnEgPCBJQ1VfVElOVF9TVEFSVCkNCgly
ZXR1cm4gLUVJTlZBTDsNCkNoZWVycywNCkJpanUNCg==

