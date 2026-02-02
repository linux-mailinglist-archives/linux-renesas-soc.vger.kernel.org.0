Return-Path: <linux-renesas-soc+bounces-27759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDH5Mh9qgGlA7wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 10:10:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C37C9F15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 10:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D3B1300A3B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Feb 2026 09:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B015F3559C4;
	Mon,  2 Feb 2026 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZdehrOoF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011070.outbound.protection.outlook.com [52.101.125.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE434E747;
	Mon,  2 Feb 2026 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023423; cv=fail; b=VcekCdbuWdNtAzZ7nH6F2ot1d3JkUME9GrXus7z3pcesf7D9dKsM/ASuoqk2a7OiqAPcMuo4TZ0vC2FeGZNZEh01axT7rCUeIWpX17esnWq6jNpZn/eUGPGh/5uq2pPicDR2De6oxieHaWV2hRe2ScZSuiQcWNXgkGJbhcZQGaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023423; c=relaxed/simple;
	bh=jYRlH7+7vYRF2/TnF29ldPxCpGvW3am8UefEADsTj+c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CYBg95IDlhY+ZyNuxEg64gBCvt/8ZTx/V3IVjcdhEmKGLLdKxcGQkSUBpTYNT26d3N+QD2HvY/hjXlaF5y0jNbHwkEb4QIurWlNqs3T5mJ9QJw2vO5jtMXDncylMgyDERhOcjHW7Qe2I9uYMdEI3FKBNUWeaoWcg3LepOVQCnTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZdehrOoF; arc=fail smtp.client-ip=52.101.125.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BB8rlaC/MwFGNHtT2KSrTGV4LiuqKuLhmXIYu45NRdljs47CM97u0Rhur9r0shQwibdN9nlkplBlOqao0rqcGO0zYALhKPoIRoRwN/90cvziW0NGx7u2scC1OO9lCqsjtYxcNrtomdvB3cFrUa8uL99OJsenK/tG+5exqGT2szDt6e4ozQBTClRXnCALGo4cmf8tfYjdKWxL+ELutzM6NH0FqdIgtIkx8ISTxn9ThnTHtsNTaT5LSH4FZNsIYuNbU/khHzh2sYoHbsOCbgdXUi1TsoDsoS3TdI6KVDDorP9v6vcU+X9BC2xfUdZtreObPoGaxeTrT1kX5KUrNM23xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYRlH7+7vYRF2/TnF29ldPxCpGvW3am8UefEADsTj+c=;
 b=lr02sPyXawZ/2zEABhLUV71oAn1gW1fleJwHvtfb42wiW6mUVZm/5PXuLWdr1H+TVJLVtuCAAi1JD01BcIOP7QGc8w0YZqg7hnYvKgr4gtHZTd5tVHbp1AsFwX5buK0dkw1/kpoGtECm4hd3HIR96MIgBZeE3kM0cUg3rQvaLAUC8gC7jFZMSItedWqY+h0E89M5KYnyG090fzpYy6PWjFQFT3f8yk5WzpDEt1W/G7SvwB890y30IeKOrfiY3rmeeAyrtng6yW8ZUMHnznlrfM/tOonipFRu5URlH9sp7XytPvfEDoKawil5Xp178N4i/ofk9Y3wwWykO+IS5uuOQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYRlH7+7vYRF2/TnF29ldPxCpGvW3am8UefEADsTj+c=;
 b=ZdehrOoFk0KV67lM2kUhEK8TyuUB4ejacA7lfwLnNohtWH1b2XZiEemhZCqdZJ9jXsSfX/xFbe/YMbVItlRxQTAbiBickin7GMlKk0drUonGT1TxqobBPNTSKP1nqoYwo/NfX/Kj54mEDLFLBQzvNgZcndnCX0t3MUNrtRAPrDM=
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38d::6)
 by TY4P301MB1539.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:298::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 2 Feb
 2026 09:10:14 +0000
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::961:aeb3:eb77:bd7d]) by TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::961:aeb3:eb77:bd7d%4]) with mapi id 15.20.9587.007; Mon, 2 Feb 2026
 09:10:11 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert <geert@linux-m68k.org>
CC: magnus.damm <magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
Thread-Topic: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
Thread-Index: AQHcjuBr2aBtSpVCZ0CNQ/H/tjeqdrVqvfTwgAAanACAAA084IAADRyAgAQ1kHA=
Date: Mon, 2 Feb 2026 09:10:11 +0000
Message-ID:
 <TY7P301MB1984DB10EE35F2942898EFB4D39AA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
 <20260120150606.7356-5-ovidiu.panait.rb@renesas.com>
 <CAMuHMdVOCFS-31HA2Uxiu7CSmiOf_XwPk1kijYf_WkD0aJJJMw@mail.gmail.com>
 <TY7P301MB1984CB3A92C79442592B045DD39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
 <CAMuHMdUwsC96cnsZqkV63hnG=C86G5ymScY3qnLR9v830D4m4Q@mail.gmail.com>
 <TY7P301MB1984FB85250A9B18B5F981F5D39FA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
 <CAMuHMdVObafuLMBOt=atHJtBBcZ8s0C21Ep2juRE0XPih+iHBA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVObafuLMBOt=atHJtBBcZ8s0C21Ep2juRE0XPih+iHBA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P301MB1984:EE_|TY4P301MB1539:EE_
x-ms-office365-filtering-correlation-id: 1352e627-38f9-4ee4-ddd3-08de623ade85
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ODZRZTNUN2lyRWwxd2NDSEh3NTYrdUtTdWFlOVdSYUZ5b045NHg3RWphd3M4?=
 =?utf-8?B?NCt6a2w4K2FaUUpCRm1MNk40K1pSQ2tidXAxYnc1UjZSVDRwRTk3SmhWb1Rr?=
 =?utf-8?B?MEt1TUhpS3ZZUWFFZU9yVURDelJVVEc5YzZrOWFLSWVrZW10cFR3TXpUV1VC?=
 =?utf-8?B?RnFMeitUZngzQUxLcHExTkVvSWdBTUIxRFZqRlpyMjVYdHR0R3lWR29KV0xH?=
 =?utf-8?B?V1gxQVpZWG1GOGNjQWhFWWlHLy9rcnUrcGppMFNaeFZmYjZDbHk1MUM1bXNy?=
 =?utf-8?B?UlJYUW5TS3FnU0JzQ2p6a2ZTYWRMdTYrQ2xMdmkxVjgrVGRjK2hIT0FSeThX?=
 =?utf-8?B?RWVZNGpxamZ4K0xRWDAwekwwTkd1R1dIRVYwR1E5dG80eGVyTkQ3bjA3SVJx?=
 =?utf-8?B?d3NVMVZYMUp2U1pKRXBIL2xZUzVmU1FPUXRxQUkycXJ2dnB5YnU4SVorbHVO?=
 =?utf-8?B?eVVqMTZmUnhBWC9MenJJU2VuejdvMjlLNUw5dmpBR0JpMHFvU2NmbEV1eGsz?=
 =?utf-8?B?djVOdVFydG5GTHYvdzR3NmNLNGJ5Z0dvS3NTM0IzaWpQMUU4V09GVG8wUDJG?=
 =?utf-8?B?UXlEVWJlM2JxTHNZYWhFK1oxS1lmZGw1RlU3Y3JDcGMrLzBNY3E2dW8rZEZB?=
 =?utf-8?B?UlQ2bXQ0ZGZXSXZHS1NrSmlteDhFN21raFdFanpxKzRnSDErZzAwNW9mN2Fy?=
 =?utf-8?B?V1MyM2xhajFiUlAwQkQxV3oxVG9RRE5Xd1M3eG5XcTEyS2NLeUVrVTBRa3Nw?=
 =?utf-8?B?L1RxZ0dIY2trZDR2YUk4bndKcnpvY2xtb3JPQkIxaGNXby92Z1pRTzFEdXp0?=
 =?utf-8?B?dWhzSGdNUHd1R2NhYzRzU256bnQrOGlKREdSS3JYWFlFNUJIbVoyR3dSQ05q?=
 =?utf-8?B?TFZrUnYxUzh6SHl0YkZNQzQvSkhpQ1JSUnVrSGVqMVFET3ZVZklySGRZK0xo?=
 =?utf-8?B?UzVyUnNZVE5oNHIzcGVaenhEUXZUZDRXZ0Vkb3BVdXBtVWNGNVROV2xyQndq?=
 =?utf-8?B?MTJUbDFZNmxabUlMZGNiaVM2UnhYcDQ1NjRsT2lZWTNvNjU1Y3E1Sy9qMVN0?=
 =?utf-8?B?emtHekRrT29jVldXMDh0VzZtN255TGFScjUxb3llaXJuUVN2TVhacmVwYWZE?=
 =?utf-8?B?djlCUk8ybXNEL21oNk5VQ24rNW13ZmlLeEZPblRXNGcxWEVqa3kwWFY3ZEU3?=
 =?utf-8?B?eEVwdGFRVGJ3bldjTWxyNVVxUmFLclhGbGF4aWxiM2tENUNGeDQwbE53ZjYz?=
 =?utf-8?B?VFdsMGJUblFvaTYwWk1yMUJxTUdMY1k4bjdiUmRLOTRWODVNYyt2QklFOGdH?=
 =?utf-8?B?OTYvZHFhbWpyL2llbmpJZjNIUjUzWWJsckZvdyt1MWR3OS9reXMzenh4Tkx6?=
 =?utf-8?B?RiszOFlDVUV6b21xUExGZmFHcjNnQVlEem5oUUFkY01ONmFnRU4vRzhRVmx1?=
 =?utf-8?B?bERQalRhZlJSM0QrSU14T2dGTjY2dUxUYUN5MUVDRnRTeS9QTDJxNHYzTElB?=
 =?utf-8?B?YVpMVjRaUVIrSENlNkVRZytsUTY3bVFUZmRvK0VDSzNsY2wxZ1VhL2FQMDhT?=
 =?utf-8?B?Y2ppb0VGRVhGL2grY1JIWWdQOWR4MWtUaUFzT241QnFkU2RMaDFDUW1PMW42?=
 =?utf-8?B?MUhIT2x5RGdTbzdlRFpnVEh4Z3E1NFhYOUVMK1B2OFFzRDYwNHhmQ3ZERjB0?=
 =?utf-8?B?QjcxV0IxajdwT3VuT2RtOHMzdll6SDU4UlRKbitYQXM5Y1VwbHNlVXlqVXJQ?=
 =?utf-8?B?QTRUWkt5QlhRT3J4M0tWNUNid0p4MnE1Yk5lNVNDTDFvcm1LVzRUVVBtTVlS?=
 =?utf-8?B?dGxEQmQrQy9HYkJDdU9YL1ZMRWVrMnUwYTNWa1dQVWkrMnpwOUJFVzBxcFVV?=
 =?utf-8?B?U1RtM2QxRUgzU3g4b1lHbkZnUXE2N0Vyc0dlWGwzOWhQZlloR00rSU4wOVQz?=
 =?utf-8?B?dU5RRC9maHRKcjVWK2J5TnYwblVQR3dXMDZJbjRxS2FXTUE4TVVZcjc3NDhm?=
 =?utf-8?B?ZzgrTWQvNjZTSlNUNTZLM2QxRUZ4cHliU3JuT09NMTFsdFBJR0lGdUZNYksx?=
 =?utf-8?B?K2Z3TE1hRUFEelNjQ0VnMGNZT0FZTkptMyswV3RNeHdKSnZTczN4OW5pWHpz?=
 =?utf-8?B?VDlMOXBiNk1VelR3RTUvSXc5blhqWEgvQ3dPdVM4WjhVN3E4ME5SRjdSQ1JI?=
 =?utf-8?Q?0dW5SaPdqpe3M53IzRrkwaI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0FOWHJETGpDNExMMWdDQ2g4R2lZckpaQXBxeHhCeFoxc3h0MXhHeXR4TXBZ?=
 =?utf-8?B?b2l3Z1dGNlRWN2NIVXBKNzVPZnQva0ZjQWw0Y1ZSblNMNGZrd2p5MHJpN205?=
 =?utf-8?B?YTRNSkNzVzUrZE56T29Td2QwR2JqLzdUeHB0a3NQMDdsT0dXVG4rS3NSeU1T?=
 =?utf-8?B?M2FQU1JIS1FKK1ZCWGhjUHZHMUpLQm5LQ2FvM0c5Tms4eTBLZzhlZFNETUlw?=
 =?utf-8?B?UVc3UERNZ2xBemJQaENJdGtKWmpQVnY5SkVXdXlRSVVHeUk0WkJXT0dYNXk0?=
 =?utf-8?B?clQrM1VVdWxDMmRoMDY0QkZpeXh2UnpvUERYSzQzalF5dDNETklDV295Z0tk?=
 =?utf-8?B?ZnNYZ3pxSCtsejVub2Z5UE1pc2FnU2tRRWZETWtDZXJaUUg3eXF3Q2wxTDIy?=
 =?utf-8?B?Vk9Ocm5GaGhZb2dLMVJ0S1pPMml4ZXU1TkJJbWpndkVXbVV1eDZQWkdqQ3JD?=
 =?utf-8?B?czhOVG9EZ2k5NDhTNGZlK0RMQ1NWbnBqMDhEN0RTR0M3aE5WUHpKSXB0RU9H?=
 =?utf-8?B?QXExTVJ5STh0UVlCeFN1WHlxc1dIY0UwRGFDekhoNlQwYzVSNVdjRjdtY1Bl?=
 =?utf-8?B?S3RmNlpCeUllWlNZemxlblF6bytQNy9oKzdKMXJra3ZWK0ZlK2laY3E0SjJt?=
 =?utf-8?B?WURPWnEyQTlUclpaZTdIK0RQM3hJWnBRVlp3U2t3MEFlYWF6YkJvek9nNndV?=
 =?utf-8?B?SThIUXdVOU52NjQwZDA3dXhYMjBDZ29tT2R1VTBPMEs3VWpESzdXV2hLc096?=
 =?utf-8?B?MkkvTXJXVTFMdzQ4bzRKaDY2SzQzb21YbW1yWVR6V0c0SFNXcWRDVDEwK0Za?=
 =?utf-8?B?YXMrOTMvUlhYWG85SlhmUytRZE03OXk4WnhVaVdvbzFPa1lYZy80N0hicXJv?=
 =?utf-8?B?ZDdNTENpQnJsQktjRk1SYWcwN0pJczVpZ2xkL1ZsRXVZOUwrMlBuV1NGaVVU?=
 =?utf-8?B?aEI2aURyTHlpRDg1ZmxRWk5XSGVaK3M3UTZtRG9ZV1BwMlNDck92cFpSZHly?=
 =?utf-8?B?TGU3Zms5V1MxNmNadTMrUUxIbENNSUxKalVHS3h2cEp0NkRBbmJsWGQyc21S?=
 =?utf-8?B?VlF5b25PNGZSdHRYZldtM01XKzYzOWdkTktEU05aSUpuOTNqSmkzRFIyY3FX?=
 =?utf-8?B?dXRUbDVqbUhMcklzZU5NYUZ6Q2p1VzdXUFhYRGlwZEY1TmVEUTRyTG5mczdo?=
 =?utf-8?B?dUJ4Z0RkZ1hleXA4aGk5b0p1NFNXd1pOeXZid3BjQy9EZ0ZoNmgySjVMeDV3?=
 =?utf-8?B?YnhrTFZyTWZIWWNSQ2VvS0tzL0tkaW1JZ2hzclkvN3ZaNWpQK1hhUXNwaXgv?=
 =?utf-8?B?a0l3UXJnUi94Rjh0c3hSZ2toUExnWll2VHpJM3RnSXdvU1ZyR0VxVDJmbGhE?=
 =?utf-8?B?eWkvQ0RYb1M1eXlQV3phRTBrVy9iNFVCemhHa0tsMlhCQ1I1b0N0aUw3dXR0?=
 =?utf-8?B?SHNDbVMyWWtka25iVEdzZEV0aXoyQms0WEE0WHpWV2YyNFI2QUJFSE81ajcz?=
 =?utf-8?B?VUhydW5XMng1N2pTc2c3ZDdYRXFMZzcwcURpOWRNNzNZNVpObitZSGlBZTRv?=
 =?utf-8?B?NENNQ1lRdEFReG5WSDRZLzREeUlNNURyWisrWlRXZ2VNakJPa2prbTd3VWdE?=
 =?utf-8?B?ckkwQnNSWFZBRmd2V3p2ZjFETXdTUldXYW44MWpzTUEwdWxEMm5hS2dIR3Bp?=
 =?utf-8?B?UVZMNyt6L2pkemlSeW0vS3QwUU5NSGxiRlhpaU9EVnBlbUcyYzFBNXorSTB2?=
 =?utf-8?B?RW02QjNURDgydUcwV3VuMTlnNVV3TjN0NWZSNXA0S1ZXbThwSlJoeEZ4RnZC?=
 =?utf-8?B?c0pzMHhrQmRZTCtYdFZkMDA3MHBnY3RiSXpqZ3BxRktEM3hUa1A0M2ozK2gy?=
 =?utf-8?B?NjdLdVo2TnkxMjhWREtBVWptM0MyQlJBQm9GT1lydklIckEyalFuY2taUmtW?=
 =?utf-8?B?RFNZSUF1eHVRNTNPYjNIdkpJTjVSYkdpR3VBblZ3dEkzaVVTZDlWQWpZenJ5?=
 =?utf-8?B?MXJsTnNEbUFUYkg4Q0hKOHlaZnprRFk2SVpFZWt6SlVTYnpobzQ2eHRjMkpG?=
 =?utf-8?B?UG0wQ3pyMjFqV0ZuOE5GME5JVWNVRHBlTGlXMzZFeFNZSUEvc1l1amhldTU3?=
 =?utf-8?B?WTNkWkJQVG0weUl1TjNjeXV3RmlsRFFUbzNNNUowWVk1a1VkT0hGWDFEUTdp?=
 =?utf-8?B?MTFURlo1T3pjRGV4Qkx0dkYyZXVkMWVQcUJjWVlpM2RNRUtZKzNiMEVsRnhl?=
 =?utf-8?B?aW9yV05qWC9hMVRUUlFESWNGdDdVaFoxQ3VuU2M3eUhIbFFhWEREbCt5V3J0?=
 =?utf-8?B?cktXc1lDaUdPRTY4cG5ZKzRUNkRwODU0cGNSd1E3aE5JL0RYYTBIU2hYYjNV?=
 =?utf-8?Q?frTU8TwYFdBNo8GE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1352e627-38f9-4ee4-ddd3-08de623ade85
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 09:10:11.3786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BkbrAs5vMcThiCkUgeQbZfch6qaiNth2ptsOLgYViKvcijFllwtMJY14XNHB8xBRMbOKvK2X5P7wU+1w9dWam8ZlAWUpst+AIUFPwIkg5o4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P301MB1539
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27759-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.12:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux:email,renesas.com:email,renesas.com:dkim,0.0.0.69:email,m68k.org:url,TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 37C37C9F15
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNCj4gSGkgT3ZpZGl1LA0KPiANCj4gT24gRnJpLCAzMCBKYW4gMjAyNiBhdCAx
NzoyNSwgT3ZpZGl1IFBhbmFpdA0KPiA8b3ZpZGl1LnBhbmFpdC5yYkByZW5lc2FzLmNvbT4gd3Jv
dGU6DQo+ID4gPiBPbiBGcmksIDMwIEphbiAyMDI2IGF0IDE0OjQzLCBPdmlkaXUgUGFuYWl0DQo+
ID4gPiA8b3ZpZGl1LnBhbmFpdC5yYkByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gT24g
VHVlLCAyMCBKYW4gMjAyNiBhdCAxNjowNiwgT3ZpZGl1IFBhbmFpdA0KPiA+ID4gPiA+IDxvdmlk
aXUucGFuYWl0LnJiQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+IEFkZCB2ZXJzYTMg
Y2xvY2sgZ2VuZXJhdG9yIG5vZGUuIEl0IHByb3ZpZGVzIGNsb2NrcyBmb3IgdGhlIFJUQywNCj4g
PiA+IFBDSWUNCj4gPiA+ID4gPiA+IGFuZCBhdWRpbyBkZXZpY2VzLg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE92aWRpdSBQYW5haXQgPG92aWRpdS5wYW5haXQucmJA
cmVuZXNhcy5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gh
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yOWEwOWcwNTdoNDQtcnp2MmgtZXZrLmR0cw0KPiA+ID4gPiA+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1N2g0NC1yenYyaC1ldmsuZHRzDQo+ID4gPiA+ID4g
PiBAQCAtMTA4LDYgKzEwOCwxMiBAQCB2cW1tY19zZGhpMTogcmVndWxhdG9yLXZjY3Etc2RoaTEg
ew0KPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHN0YXRlcyA9IDwzMzAwMDAwIDA+LCA8MTgw
MDAwMCAxPjsNCj4gPiA+ID4gPiA+ICAgICAgICAgfTsNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiArICAgICAgIHgxOiB4MS1jbG9jayB7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgI2Ns
b2NrLWNlbGxzID0gPDA+Ow0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGNsb2NrLWZyZXF1
ZW5jeSA9IDwyNDAwMDAwMD47DQo+ID4gPiA+ID4gPiArICAgICAgIH07DQo+ID4gPiA+ID4gPiAr
DQo+ID4gPiA+ID4gPiAgICAgICAgIC8qIDMyLjc2OGtIeiBjcnlzdGFsICovDQo+ID4gPiA+ID4g
PiAgICAgICAgIHg2OiB4Ni1jbG9jayB7DQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+ID4gPiA+ID4gPiBAQCAtMjc3LDYgKzI4MywyNSBA
QCByYWEyMTUzMDA6IHBtaWNAMTIgew0KPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGNsb2Nr
cyA9IDwmeDY+Ow0KPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInhp
biI7DQo+ID4gPiA+ID4gPiAgICAgICAgIH07DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiAr
ICAgICAgIHZlcnNhMzogY2xvY2stZ2VuZXJhdG9yQDY5IHsNCj4gPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsNWwzNTAyMyI7DQo+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgcmVnID0gPDB4Njk+Ow0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGNs
b2NrcyA9IDwmeDE+Ow0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9
IDwxPjsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBhc3NpZ25lZC1jbG9ja3MgPSA8JnZl
cnNhMyAwPiwNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
JnZlcnNhMyAxPiwNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8JnZlcnNhMyAyPiwNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8JnZlcnNhMyAzPiwNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8JnZlcnNhMyA0PiwNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8JnZlcnNhMyA1PjsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBhc3Np
Z25lZC1jbG9jay1yYXRlcyA9IDwyNDAwMDAwMD4sDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTaG91
bGRuJ3QgKGF0IGxlYXN0KSBxZXh0YWxfY2xrIGFuZA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MjQ1NzYwMDA+LA0KPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDMyNzY4PiwNCj4g
PiA+ID4gPg0KPiA+ID4gPiA+IHJ0eGluX2NsayBiZSBvdmVycmlkZGVuIHRvIHBvaW50IHRvIHRo
ZSBjb3JyZXNwb25kaW5nIHZlcnNhMw0KPiBvdXRwdXRzPw0KPiA+ID4gPiA+IFNhbWUgY29tbWVu
dCBmb3IgW1BBVENIIHYyIDUvNV0uDQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gSSB0cmll
ZCBpbXBsZW1lbnRpbmcgdGhpcyBieSBvdmVycmlkaW5nIHFleHRhbF9jbGsgYW5kIHJ0eGluX2Ns
aw0KPiB3aXRoDQo+ID4gPiA+IGZpeGVkLWZhY3Rvci1jbG9jayBub2RlcyB0aGF0IHJlZmVyZW5j
ZSB0aGUgdmVyc2EzIG91dHB1dHMgYXMNCj4gcGFyZW50czoNCj4gPiA+ID4NCj4gPiA+ID4gLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1N2g0NC1yenYyaC1ldmsuZHRz
DQo+ID4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNTdoNDQt
cnp2MmgtZXZrLmR0cw0KPiA+ID4gPiBAQCAtNTA0LDcgKzUwNCwxMSBAQCBpbyB7DQo+ID4gPiA+
ICB9Ow0KPiA+ID4gPiDCtw0KPiA+ID4gPiAgJnFleHRhbF9jbGsgew0KPiA+ID4gPiAtICAgICAg
IGNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47DQo+ID4gPiA+ICsgICAgICAgY29tcGF0aWJs
ZSA9ICJmaXhlZC1mYWN0b3ItY2xvY2siOw0KPiA+ID4gPiArICAgICAgIGNsb2NrcyA9IDwmdmVy
c2EzIDA+Ow0KPiA+ID4gPiArICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsNCj4gPiA+ID4gKyAg
ICAgICBjbG9jay1tdWx0ID0gPDE+Ow0KPiA+ID4gPiArICAgICAgIGNsb2NrLWRpdiA9IDwxPjsN
Cj4gPiA+ID4gIH07DQo+ID4gPiA+IMK3DQo+ID4gPiA+ICAmcnRjIHsNCj4gPiA+ID4gQEAgLTUx
Miw3ICs1MTYsMTEgQEAgJnJ0YyB7DQo+ID4gPiA+ICB9Ow0KPiA+ID4gPiDCtw0KPiA+ID4gPiAg
JnJ0eGluX2NsayB7DQo+ID4gPiA+IC0gICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDMyNzY4PjsN
Cj4gPiA+ID4gKyAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWZhY3Rvci1jbG9jayI7DQo+ID4g
PiA+ICsgICAgICAgY2xvY2tzID0gPCZ2ZXJzYTMgMj47DQo+ID4gPiA+ICsgICAgICAgI2Nsb2Nr
LWNlbGxzID0gPDA+Ow0KPiA+ID4gPiArICAgICAgIGNsb2NrLW11bHQgPSA8MT47DQo+ID4gPiA+
ICsgICAgICAgY2xvY2stZGl2ID0gPDE+Ow0KPiA+ID4gPiAgfTsNCj4gPiA+ID4NCj4gPiA+ID4g
SG93ZXZlciwgdGhpcyBicmVha3MgdGhlIGJvb3QuIFRoZSBwcm9ibGVtIHNlZW1zIHRvIGJlIHBy
b2JlDQo+ID4gPiA+IG9yZGVyaW5nOg0KPiA+ID4gPiAxLiBmaXhlZC1mYWN0b3ItY2xvY2sgdXNl
cyBDTEtfT0ZfREVDTEFSRSwgc28gaXQgcmVnaXN0ZXJzIHZlcnkNCj4gZWFybHkNCj4gPiA+ID4g
Mi4gQXQgdGhhdCBwb2ludCwgdmVyc2EzIGNsb2NrcyBhcmUgbm90IHlldCBhdmFpbGFibGUgKHNp
bmNlIHZlcnNhMw0KPiBpcw0KPiA+ID4gPiBhbiBJMkMgZGV2aWNlLCBpdCBpcyBwcm9iZWQgbXVj
aCBsYXRlcikNCj4gPiA+ID4gMy4gVGhlIGNsb2NrIGZyYW1ld29yayByZWdpc3RlcnMgdGhlIGZp
eGVkLWZhY3Rvci1jbG9jayB3aXRoIHJhdGUgPQ0KPiAwDQo+ID4gPiA+IDQuIENvbnN1bWVycyAo
UlRDLCB0aW1lcnMsIGV0YykgcHJvYmUgYW5kIHNlZSByYXRlID0gMCwgY2F1c2luZw0KPiBmYWls
dXJlcw0KPiA+ID4gPg0KPiA+ID4gPiBJJ20gYWxzbyBjb25jZXJuZWQgdGhhdCBpZiBxZXh0YWxf
Y2xrICh0aGUgbWFpbiBTb0MgY2xvY2spIGRlcGVuZHMNCj4gb24NCj4gPiA+ID4gdmVyc2EzLCBu
ZWFybHkgZXZlcnl0aGluZyB3b3VsZCBuZWVkIHRvIGRlZmVyIHVudGlsIHRoZSBJMkMNCj4gc3Vi
c3lzdGVtDQo+ID4gPiA+IGFuZCB2ZXJzYTMgZHJpdmVyIGFyZSByZWFkeS4NCj4gPiA+ID4NCj4g
PiA+ID4gQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIGFueSBzdWdnZXN0aW9ucyBvbiBob3cgdG8g
aGFuZGxlIHRoaXM/DQo+ID4gPg0KPiA+ID4gSSBtZWFudCB0byBvdmVycmlkZSB0aGUgcmVmZXJl
bmNlcyB0byBxZXh0YWxfY2xrIGFuZCBydHhpbl9jbGssIGkuZS4NCj4gPiA+DQo+ID4gPiAgICAg
JmNwZyB7DQo+ID4gPiAgICAgICAgICAgICBjbG9ja3MgPSA8JmF1ZGlvX2V4dGFsX2Nsaz4sIDwm
dmVyc2EzIDI+LCA8JnZlcnNhMyAwPjsNCj4gPiA+ICAgICB9Ow0KPiA+ID4NCj4gPiA+IEhvd2V2
ZXIsIHRoYXQgY291bGQgc3RpbGwgZGVsYXkgZXZlcnl0aGluZywgaW4gd2hpY2ggY2FzZSB3ZSBz
aG91bGQNCj4gPiA+IGp1c3QgZG9jdW1lbnQgdGhlIHJvdXRpbmcgaW4gdGhlIERUUyB1c2luZyBj
b21tZW50cy4NCj4gPiA+DQo+ID4gPiBDYW4geW91IHBsZWFzZSBnaXZlIGl0IGEgdHJ5Pw0KPiA+
DQo+ID4gV2l0aCB0aGlzIGNoYW5nZSwgdGhlIGJvYXJkIGRvZXNuJ3QgYm9vdCBhdCBhbGwsIG5v
IG91dHB1dCBvbiB0aGUNCj4gPiBzZXJpYWwgY29uc29sZS4NCj4gPg0KPiA+IEkgdGhpbmsgd2l0
aCB0aGlzIHdlIGFyZSBpbnRyb2R1Y2luZyB0aGUgZm9sbG93aW5nIGNpcmN1bGFyIGNsaw0KPiA+
IGRlcGVuZGVuY3kgY2hhaW46DQo+ID4NCj4gPiAgICAgY3BnIC0+IHZlcnNhMyAtPiBpMmMgLT4g
Y3BnIC0+IC4uLg0KPiANCj4gSSB3YXMgYWxyZWFkeSBhZnJhaWQgc28uLi4NCj4gDQo+IE9LLCB0
aGVuIHBsZWFzZSBqdXN0IGFkZCBjb21tZW50cyBsaWtlOg0KPiANCj4gICAgIEBAIC0yODksOSAr
Mjg5LDkgQEAgdmVyc2EzOiBjbG9jay1nZW5lcmF0b3JANjkgew0KPiAgICAgICAgICAgICAgICAg
ICAgIHJlZyA9IDwweDY5PjsNCj4gICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JngxPjsN
Cj4gICAgICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47DQo+ICAgICAtICAgICAg
ICAgICAgICAgYXNzaWduZWQtY2xvY2tzID0gPCZ2ZXJzYTMgMD4sDQo+ICAgICArICAgICAgICAg
ICAgICAgYXNzaWduZWQtY2xvY2tzID0gPCZ2ZXJzYTMgMD4sICAvKiBxdWV4dGFsICovDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZ2ZXJzYTMgMT4sDQo+ICAgICAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZ2ZXJzYTMgMj4sDQo+ICAgICArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZ2ZXJzYTMgMj4sICAvKiBydHhpbl9jbGsg
Ki8NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlcnNhMyAzPiwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlcnNhMyA0PiwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlcnNhMyA1PjsNCj4gDQo+
IEFueSBvdGhlcnMgbmVlZGVkPw0KPiANCg0KSSB0aGluayBmb3Igbm93IG9ubHkgdGhlc2UgdHdv
IGNsb2NrcywgYXMgd2UgZG9uJ3Qgc3VwcG9ydCBhdWRpbyBvciBQQ0llIHlldC4NCg0KVGhhbmtz
IGZvciB5b3VyIGhlbHAhDQoNCk92aWRpdQ0KDQo+IFRoYW5rcyBmb3IgdGVzdGluZyENCj4gDQo+
IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQN
Cj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4NCj4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UNCj4gdGhhdC4NCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

