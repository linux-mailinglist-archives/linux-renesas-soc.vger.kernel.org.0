Return-Path: <linux-renesas-soc+bounces-9635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C84997845
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 00:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF9532845B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 22:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F40F1E284D;
	Wed,  9 Oct 2024 22:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OJpz+qLx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E152E17BB0C;
	Wed,  9 Oct 2024 22:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728511856; cv=fail; b=SwNoyP+eG+QEFZA9niyONEonFkvQF6VspF/7da6Bbztfl1EKGj/toBgFacdA65SXBOJPz1V5MpUt4XUMcz3t8ewd25Kx4Mw0WzGzo/BjiMkae3mt73oNRLnY0NtT3KwrM2pahwDmEOZjW+7Xb4ON+VupgsLOlswBSIDGESoNW0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728511856; c=relaxed/simple;
	bh=/LUSNo6mb3dEdA6X9eMxY5xx+ghl9i3o05UCLjGPBXU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aP8FVI8VV1bidgT3XP1kBgf3zwVodDNl760NkBQcbHn7xTkIvU2IUV4rxSAkIgFn02x3ctFbI8lADCuDIhp/UwJWDWbxLp1pUjRUssTxxQZSbpr4PgZHAc+3IgN2cD+THyW06kz2dDUwqVegHBILF1nQ7GEajg1c0HlnKHXi5L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OJpz+qLx; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOgGA7gZwnScO3a4OmMt82EdapClai4ANwhIu+5CNHz0Fa6bZP82fME1MAVQi6dZocybSgHGSF2aF5nQjFXfOcpk6UQW6VB3y8ny9lKtSFtt0oUJ9YeVq2nb2POy27sdMYwxWsTaQwHbE3ZACHAHbkh1Lb2UtDaHmsTnpdbk7pWxali0YGJ9UtLuGBBIFb8dIFcN99tKmDaMMny994iqoCyE6dET7OSVSkaScEfy1Gx9zaR8N0qfG9y0uwoXMzMvJEuKkjYRInceLEJTyZvbMHeUE002pGEg9hAMeCx4fGv8fi8h14Oqpsq68riK4Fwop5bHB1xKGsh7YmYT16W/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LUSNo6mb3dEdA6X9eMxY5xx+ghl9i3o05UCLjGPBXU=;
 b=wR4lpSwk/liQkXmYsTHgdmLtAwY9/jXP2YdhP1nVHxFqwIMyeEo1HjVfmeS5Iaj5aE6PrJGC+uNDQTmQexygVaogHMXkfI/DwzdQoPCft838DMIOlAyiYRh+bJUnQvTNFd0yBbHw/GJohvAeqC8rd2z/1jNRhr7mdP4FC39UHGLPShyJxYv0dlKn9AdSD6b0qSaHWKEtmvq4Gll1S1mUtjlAHE+CL4KBtoYP1Zm48DSa3lBLCiqRxCD6p5SmtFg1gWSh4hSG6fLus/+ZKnXvwG+QRp/XSFzNdsEhJVngDd/XjfjBUTjDLYsqA45V1rk9pZIuUkPAgO0XFZ7uH8uyYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LUSNo6mb3dEdA6X9eMxY5xx+ghl9i3o05UCLjGPBXU=;
 b=OJpz+qLxKznjrWlI0WWV70cLOD3jF5ChovotZjzhDG9PaRvz/HQg9MQ96qDcNBZEL4Ag7eA8lPQTJagCPl85iNxQsFV4hAeozU688xN0mq9rzWmVZm8g3hsyzV8M9UiHLr8ZugT7DOQQmoLh6qi4091qreVJnh1/9w0e6hIGFtY=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by OS3PR01MB6579.jpnprd01.prod.outlook.com (2603:1096:604:109::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 22:10:50 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%6]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 22:10:50 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Chris Paterson
	<Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 2/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/V2H(P) Interrupt Controller
Thread-Topic: [PATCH v2 2/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/V2H(P) Interrupt Controller
Thread-Index: AQHbE0h/KnE6TGHEZUym5qgAVkp7zbJ2aRMAgAieBNA=
Date: Wed, 9 Oct 2024 22:10:50 +0000
Message-ID:
 <TY3PR01MB12089C5DB18DE3865453E3055C27F2@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <20240930145244.356565-1-fabrizio.castro.jz@renesas.com>
 <20240930145244.356565-3-fabrizio.castro.jz@renesas.com>
 <CAMuHMdWp7MyqT4LtNna+kOCpMpXvMKxcFuqsm6vuPgUVuvBGAA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWp7MyqT4LtNna+kOCpMpXvMKxcFuqsm6vuPgUVuvBGAA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|OS3PR01MB6579:EE_
x-ms-office365-filtering-correlation-id: 5dd03a68-40b5-4498-87d7-08dce8af3c11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WWtQckFRU1pTQnl2RHZTblA1SnkvUkxNQzF6ck5EcVkyKzlEWHZjZUF0djZ3?=
 =?utf-8?B?aHVBajVQNFM1TVYzcmcxQUcrem4vU3g2MzJWOTFpdnNDbDBZRFRjcUVaN0p2?=
 =?utf-8?B?K0wvY2MrM3IxUm1NWVp5UERhYUdBa0dWbHdpRzkyRFJORDR5NnJYY2hhZXJ2?=
 =?utf-8?B?bzk5S0FtQ0U5WXZXWE1WSFhheThqa3Y5Mk8rY2wvbWtER0RNTG5BczhaWXRu?=
 =?utf-8?B?akM4QVF5dDluRTBQSzkyYm91TGhaNFRIVXJpQkhLL3BjMTRoZVdtMWhDdHQr?=
 =?utf-8?B?T01RU1U3NG1LRDg0L2kvWnBOKzA0dFZ4aUJLajBEOEF3YUQ2eUFGZmJoUFpD?=
 =?utf-8?B?dEhEeVNNbUpxQktIeHNxVE1zV21DeEFXbFJvNXY2UzMrWkhKTjZ2NFRsSDZX?=
 =?utf-8?B?OE9SMkw2QTJGSjhqdHBLeGlsbU9zbXdBUWtPbTNBckp0alRMT1Y3VlRtNUF3?=
 =?utf-8?B?Tm0rVU8vWFRPTXNJOTVuaS9SaTdrUmNuRW1rU2ZVNGFYWU1BSXRGaW5jU0FN?=
 =?utf-8?B?NTBPK3o2RmZlUjJicDA5NUF3UVJYMkVNZDF1ZFhpMkNFMjFDSVZ2UlR1N0Nh?=
 =?utf-8?B?OG9aQzBweVdpalRjTXVrOWRhM2hSYllrN0RTTG5Sb1puMk9pS1daWXE4ZG1V?=
 =?utf-8?B?UloycWgyWmk5ZlVTVVBPNnhuV1EyT1I1a0FQMXRUb243YWh2aDNEMnNqeWpk?=
 =?utf-8?B?OTczQ3hKV0dHdVl3QnU2cHArU05HNkhTVnFZanVkOUJHSDk0TFgrQjFVL3lp?=
 =?utf-8?B?NVg2Ym52Nnl1MzlsYXpCOFJzZkZ2dmVyTi9TSVcrdGxkeHhvUlVMWHU2eGRI?=
 =?utf-8?B?cU9BVEFnOUk2cXVZR3J3NUo3U3NDN3NONjZobTZ6UUtzMDF6TEdGUCs0T0Vs?=
 =?utf-8?B?ZVowbFZDQjBkV0hUbkVMbjJxSmFRak5ybURuSXdKOVRuRHJCU2p3YlhIUG1Y?=
 =?utf-8?B?ZzBnVDhSazNhS3NrMU5XVzF5azQ5VTcxRzlDem14K3VSdDlJV1VHWDRMNVpH?=
 =?utf-8?B?Q0dVaERlM2VXZVVvNlFlWVVjZmFrRGRrNzhWMGVSemxBTEFtNVcrWFAyTmR4?=
 =?utf-8?B?OHVjUklBL0JmclVpNUdqU3dsdXEvR3JtVzBaZmpGL0FYS2UxbUVhRDZocWEx?=
 =?utf-8?B?c0RrTnpHV21EV0tlNXA4K085dmRRWGN3d1N2SlhJRHl5dTg2RHhPemJaSXFz?=
 =?utf-8?B?RUI5cWVEdEw0K1ZhL0V5MVVaODdiaUdkYmdJMFFCclhOWXdkZFhwMWI2MW1M?=
 =?utf-8?B?T2FCMUhPMXRXcWd3OXE2Y0tOWk56bjgzYWV4Q3huYzhpdTl3bXJUZEVQb0hV?=
 =?utf-8?B?QndjczYrZE05cFJzZ3VhUGdFN1ZnbXRFWHYxNXdyMmtTZUIrN2FwcVVOUWJI?=
 =?utf-8?B?cWE1YUc2OUJ1RHJYSDZiZ0FURzZza3FyVVJDQURySDRhY2xjS3NieE9BOUhq?=
 =?utf-8?B?SCtibkVtZFFrTldaeEJteXk5WlM5eEpabkwxT0J4UFh2RkVXeDBiRzZxNnVu?=
 =?utf-8?B?bXl6QnhKLzh4a1h3MjZxV3E4SlR2ajJHbjhqZE9vWGxhYk1nUkFnSXhKeDMy?=
 =?utf-8?B?QXV2NkZhbFc2Qk4xUFpBcjBzRFZnZGpMbzFJNDJkb2tOZkdPK2pUdXlOV0U4?=
 =?utf-8?B?SXc5a05ETUEwU1FqY3lPLzFiMXBaei84bUp5NnpOVTM5UDZtSUpkTnhhR3dH?=
 =?utf-8?B?c3NUdzBlYkRBZ2FONWJReVM1ejU3NlArTUxKSnVVQ2hmVU1YTmR2NFovMWpK?=
 =?utf-8?B?WWl0eWNIVXhtVXFRQWpyQ2JhUUw0RWtMZEs4a1pjbUh5KzRpMWZLMm8yckJV?=
 =?utf-8?B?OGlHVzFFbVBlWTVSRWZ2QT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Smx0ckpLclI4NGFDM1pvQlM2UmVCNVJDMHUvY1RCOHhGU1lvYVpkd1Z2L0E0?=
 =?utf-8?B?T053VzF4anIwOWc0ZmowOFQyV1JYR0VqbkNMOEdNT1BvNklVRUROby9hMFdO?=
 =?utf-8?B?SVJ1SVJ6YWhEemtBTDNCM296TkxZTk1jdW9iTExxdlRVNnJDMEw4V0hzWVFH?=
 =?utf-8?B?MkNpNHBoajJHcmoyc0gxVURIZnorQTV0emVlaWk3QmQyQkg4cVBZbkJ2UGhL?=
 =?utf-8?B?ZHRwM1k2anJPUnJsS0pIcEZ6OHdISllCS2VudXdiRk5WRUlza0EzejNEODRX?=
 =?utf-8?B?bUNBS2oyNFZmbVJiZ3JqL1JvN2gyQWxyRUJWTTZ5WlVBNi9zTFZWWDkvUEIx?=
 =?utf-8?B?R01pVVVicWZZdVZEQzQ1cUoxaGRRTkNQYlVlUkVDYVFIUDVxeDB0NHZWZDFm?=
 =?utf-8?B?WElSL0xweU9xdEx6RFdrME5XUlBpRFZEZ2FMY3d0NytVc2x0MTB5NXZrSEx6?=
 =?utf-8?B?YUo2ZkFqdG5CZUtrSVB4WUd6SGZZdGxjemphTnhMRElsdzJmdlc2TjlBdVVP?=
 =?utf-8?B?VUU3VHFRZVk3OTIyL2VkdGx2ZS9kN2xhbVNXVGFNSXNHdzhpeGZUVUl2OWl6?=
 =?utf-8?B?OGRmc3RvUHNmYUNpSW1ndzZvTmxiZ1dLTUhsc3Z6WTVzMG55anhTcmxJNGxW?=
 =?utf-8?B?MWpJWmkxb1dCaUxDcUx1Zzdxb2JhbXJVMnZCUjVVd0JVaXdTVTFlNFJaS3NX?=
 =?utf-8?B?OTBhWnhNZ3NlNkE0TkpUaVpvYUNER2tUUk9TTFhTS1JkVWIwbVFPa3l2RGlV?=
 =?utf-8?B?SzhQUlZQMEFRQVFzZXVvZFowUXBleWh3bktOQTdkamRBU0hIaW12ZnRrYytE?=
 =?utf-8?B?TzZuS1BHa09pRXIvTTdFc2M2R2hRVXhQZkF2NFZjM0JRQXVTK3hSMFBFL2l3?=
 =?utf-8?B?K2lpSk5rbzVtb1lncmxsMFVVUDErK1AvVzk4M3IwRzBoVmhGZGZSVVdINWtK?=
 =?utf-8?B?dGxkTTRZN3F1Q1pYZG43R1JCTnk5ZVJIczdSSXhCZDdGLzRobk81NGttOTlQ?=
 =?utf-8?B?MEgyT1Q5WEZMQVZsamRkYUEyRWlXK0lkVStkb2ZzdVRwZWtqdVA0RnhaM3VK?=
 =?utf-8?B?bXN1dGVTVHFOTDZQYWl2UlF1RlhpK2RVMkJEUnJ6L29XRUc0TUkvRVFjTVEr?=
 =?utf-8?B?ZkhXK0FENHlWdkJ6TU8wVjVYeGkydEZ2d0RqVE5EcGJWVEIzMGNDY3ZBMFhn?=
 =?utf-8?B?UEEzVXRiT1l6MEtsc3NKRmdidytaenBudmxFdTc5clUvRlRUeUVzK0haNVg5?=
 =?utf-8?B?SWY5Wm5hbjVkVnZIOHRMQS9IS0hCdnROdjkwRGxTaWY5SzdHREFtT3ZXY3ho?=
 =?utf-8?B?TzN3YkFVbkVNd3IyaFp1VWZYalAyT2VWUkQ5WUx4eGpubE11NHh5d3RoSEZC?=
 =?utf-8?B?NG41MEhoT0RQdmZmQUIzbUJPMnBKUVErK3pGS0NyKzB1dFpBV000NllTWHhk?=
 =?utf-8?B?Q01xdCtUOEpBL2JwYk5EaEdFV1N0NWVJS1ZPeFJwWEw4aVRjZ1ZxblFQUWlt?=
 =?utf-8?B?Tll5Ty96SkZXdlk2QnNYRWxpWi9lZVl4UW1tMVJkYmtrcGZTSGg4MGVpT2ZS?=
 =?utf-8?B?RlpHaE1rSnRVZmo2QnpzdHhOQ3NsaS9qOVlIZkNwWlZtb3kyakNEK3Y5ZGRl?=
 =?utf-8?B?VGZVMzVIVGREbzZObE5melY0VytQYnNwRHZ5VTA1OTI0Z2ZqMCtTNzBFTW13?=
 =?utf-8?B?UGVRT3J4Ti9SSk1ubWlTd0hFL1M2Sjdqb0tPWmdQbW9PcWM4T0Vwa3lWdjI1?=
 =?utf-8?B?VHZqTEVnZlFlUDJkVE9TQm5PT29DdTJ3aFBTakEzQkhxZk1OUmE1NVNXTmdu?=
 =?utf-8?B?MjVMNTJtWElpNUo5M09lQUo0V1VHem1mckxyUm9qa2tmNU9QSC8yUmxRdmp3?=
 =?utf-8?B?R2w5NnhBNkZpUS9TdWhydnRBUGNIL0NjVXVneEUrdi8zZktGZVdHSDJNcWlV?=
 =?utf-8?B?NDJjb2pUWWlabmtIK0xSb0p6WFRBMW5QSExTcUZTbUFESlF6WW4wRURvNXpo?=
 =?utf-8?B?aFRkRmFhVHNBWnQramxvaGhIYlpGZDZyclkvTW9kb3BXRFdRK2ZsemkzWW1B?=
 =?utf-8?B?K3VTbVpQb2RVU2lCQ0V2V2FnMG9kY0NQandlRXVySjI4d3pXa2p4T1BYcUgr?=
 =?utf-8?B?ZjRBaEdKMFZkeTN5VU1nam15TjZBbmMzYWNZTTl6UVBXaFBWbWVoY01FOE53?=
 =?utf-8?B?L0E9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12089.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd03a68-40b5-4498-87d7-08dce8af3c11
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 22:10:50.4423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYKtEoGjFG5n44/SmX/dmcB6c2l9rtIqhjui1OjciUewlnacfmhyLauNe7NZ4vMp2wttSwiYgXdjuBrmVuBZKibRjyw0ajZlHUtFtlMGhBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6579

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiBGcmlkYXksIE9jdG9i
ZXIgNCwgMjAyNCAxMToyNiBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvNV0gZHQtYmlu
ZGluZ3M6IGludGVycnVwdC1jb250cm9sbGVyOiBBZGQgUmVuZXNhcyBSWi9WMkgoUCkgSW50ZXJy
dXB0DQo+IENvbnRyb2xsZXINCj4gDQo+IEhpIEZhYnJpemlvLA0KPiANCj4gT24gTW9uLCBTZXAg
MzAsIDIwMjQgYXQgNDo1M+KAr1BNIEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvLmp6
QHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgRFQgYmluZGluZ3MgZm9yIHRoZSBSZW5lc2Fz
IFJaL1YySChQKSBJbnRlcnJ1cHQgQ29udHJvbGxlci4NCj4gPg0KPiA+IEFsc28gYWRkIG1hY3Jv
cyBmb3IgdGhlIE5NSSBhbmQgSVJRMC0xNSBpbnRlcnJ1cHRzIHdoaWNoIG1hcCB0aGUNCj4gPiBT
UEkwLTE2IGludGVycnVwdHMgb24gdGhlIFJaL1YySChQKSBTb0Mgc28gdGhhdCB0aGV5IGNhbiBi
ZSB1c2VkIGluDQo+ID4gdGhlIGZpcnN0IGNlbGwgb2YgdGhlIGludGVycnVwdCBzcGVjaWZpZXJz
Lg0KPiA+DQo+ID4gRm9yIHRoZSBzZWNvbmQgY2VsbCBvZiB0aGUgaW50ZXJydXB0IHNwZWNpZmll
ciwgc2luY2UgTk1JLCBJUlFuIGFuZA0KPiA+IFRJTlRuIHN1cHBvcnQgZGlmZmVyZW50IHR5cGVz
IG9mIGludGVycnVwdHMgYmV0d2VlbiB0aGVtc2VsdmVzLCBhZGQNCj4gPiBoZWxwZXIgbWFjcm9z
IHRvIG1ha2UgaXQgZWFzaWVyIGZvciB0aGUgdXNlciB0byB3b3JrIG91dCB3aGF0J3MNCj4gPiBh
dmFpbGFibGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJp
emlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MS0+djI6DQo+ID4gKiBS
ZW1vdmVkICd8JyBmcm9tIG1haW4gZGVzY3JpcHRpb24NCj4gPiAqIFJld29ya2VkIG1haW4gZGVz
Y3JpcHRpb24NCj4gPiAqIEZpeGVkIGluZGVudGF0aW9uIG9mICNpbnRlcnJ1cHQtY2VsbHMNCj4g
PiAqIFJld29ya2VkIGRlc2NyaXB0aW9uIG9mICNpbnRlcnJ1cHQtY2VsbHMNCj4gPiAqIERyb3Bw
ZWQgZmlsZSBpbmNsdWRlL2R0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2ljdS1yenYy
aC5oDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvcmVuZXNhcyxyDQo+ID4gKysrIHp2MmgtaWN1LnlhbWwNCj4gDQo+ID4gK3Byb3Bl
cnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0OiByZW5lc2FzLHI5YTA5
ZzA1Ny1pY3UgICAgICAgICAgIyBSWi9WMkgoUCkNCj4gDQo+IFRvbyBtYW55IHNwYWNlcyBiZWZv
cmUgIiMiPw0KDQpJbmRlZWQuIEknbGwgcmVwbGFjZSB3aXRoIDEgc3BhY2UuDQoNCj4gDQo+ID4g
Kw0KPiA+ICsgICcjaW50ZXJydXB0LWNlbGxzJzoNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGUg
Zmlyc3QgY2VsbCBpcyB0aGUgU1BJIG51bWJlciBvZiB0aGUgTk1JIG9yIHRoZQ0KPiA+ICsgICAg
ICBQT1JUX0lSUVswLTE1XSBpbnRlcnJ1cHQsIGFzIHBlciB1c2VyIG1hbnVhbC4gVGhlIHNlY29u
ZCBjZWxsIGlzIHVzZWQgdG8NCj4gPiArICAgICAgc3BlY2lmeSB0aGUgZmxhZy4NCj4gPiArICAg
IGNvbnN0OiAyDQo+ID4gKw0KPiA+ICsgICcjYWRkcmVzcy1jZWxscyc6DQo+ID4gKyAgICBjb25z
dDogMA0KPiA+ICsNCj4gPiArICBpbnRlcnJ1cHQtY29udHJvbGxlcjogdHJ1ZQ0KPiA+ICsNCj4g
PiArICByZWc6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBpbnRlcnJ1cHRz
Og0KPiA+ICsgICAgbWluSXRlbXM6IDU4DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBk
ZXNjcmlwdGlvbjogTk1JIGludGVycnVwdA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBJUlEw
IGludGVycnVwdA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBJUlExIGludGVycnVwdA0KPiA+
ICsgICAgICAtIGRlc2NyaXB0aW9uOiBJUlEyIGludGVycnVwdA0KPiA+ICsgICAgICAtIGRlc2Ny
aXB0aW9uOiBJUlEzIGludGVycnVwdA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBJUlE0IGlu
dGVycnVwdA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBJUlE1IGludGVycnVwdA0KPiA+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBJUlE2IGludGVycnVwdA0KPiA+ICsgICAgICAtIGRlc2NyaXB0
aW9uOiBJUlE3IGludGVycnVwdA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBJUlE4IGludGVy
cnVwdA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBJUlE5IGludGVycnVwdA0KPiA+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBJUlExMCBpbnRlcnJ1cHQNCj4gPiArICAgICAgLSBkZXNjcmlwdGlv
bjogSVJRMTEgaW50ZXJydXB0DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IElSUTEyIGludGVy
cnVwdA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBJUlExMyBpbnRlcnJ1cHQNCj4gPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogSVJRMTQgaW50ZXJydXB0DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRp
b246IElSUTE1IGludGVycnVwdA0KPiANCj4gIlBPUlRfSVJRPG4+IiwgdG8gbWF0Y2ggVGFibGUg
NC42LTIyICgiTGlzdCBvZiBJbnB1dCBFdmVudHMiKSBhbmQgJyNpbnRlcnJ1cHQtY2VsbHMnIGFi
b3ZlLg0KDQpHb29kIHNob3V0Lg0KDQo+IA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBHUElP
IGludGVycnVwdCwgVElOVDANCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1
cHQsIFRJTlQxDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5U
Mg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDMNCj4gPiAr
ICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQ0DQo+ID4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5UNQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0
aW9uOiBHUElPIGludGVycnVwdCwgVElOVDYNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogR1BJ
TyBpbnRlcnJ1cHQsIFRJTlQ3DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJy
dXB0LCBUSU5UOA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElO
VDkNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQxMA0KPiA+
ICsgICAgICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDExDQo+ID4gKyAgICAg
IC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5UMTINCj4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQxMw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBHUElPIGludGVycnVwdCwgVElOVDE0DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8g
aW50ZXJydXB0LCBUSU5UMTUNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1
cHQsIFRJTlQxNg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElO
VDE3DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5UMTgNCj4g
PiArICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQxOQ0KPiA+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDIwDQo+ID4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5UMjENCj4gPiArICAgICAgLSBkZXNjcmlwdGlv
bjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQyMg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBHUElP
IGludGVycnVwdCwgVElOVDIzDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJy
dXB0LCBUSU5UMjQNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJ
TlQyNQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDI2DQo+
ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5UMjcNCj4gPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQyOA0KPiA+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDI5DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRp
b246IEdQSU8gaW50ZXJydXB0LCBUSU5UMzANCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogR1BJ
TyBpbnRlcnJ1cHQsIFRJTlQzMQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBTb2Z0d2FyZSBp
bnRlcnJ1cHQsIElOVEE1NV8wDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IFNvZnR3YXJlIGlu
dGVycnVwdCwgSU5UQTU1XzENCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogU29mdHdhcmUgaW50
ZXJydXB0LCBJTlRBNTVfMg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBTb2Z0d2FyZSBpbnRl
cnJ1cHQsIElOVEE1NV8zDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEVycm9yIGludGVycnVw
dCB0byBDQTU1DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEdUQ0NSQSBjb21wYXJlIG1hdGNo
L2lucHV0IGNhcHR1cmUgKFUwKQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBHVENDUkIgY29t
cGFyZSBtYXRjaC9pbnB1dCBjYXB0dXJlIChVMCkNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjog
R1RDQ1JBIGNvbXBhcmUgbWF0Y2gvaW5wdXQgY2FwdHVyZSAoVTEpDQo+ID4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IEdUQ0NSQiBjb21wYXJlIG1hdGNoL2lucHV0IGNhcHR1cmUgKFUxKQ0KPiA+ICsN
Cj4gPiArICBpbnRlcnJ1cHQtbmFtZXM6DQo+ID4gKyAgICBtaW5JdGVtczogNTgNCj4gPiArICAg
IGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBubWkNCj4gPiArICAgICAgLSBjb25zdDogaXJx
MA0KPiA+ICsgICAgICAtIGNvbnN0OiBpcnExDQo+ID4gKyAgICAgIC0gY29uc3Q6IGlycTINCj4g
PiArICAgICAgLSBjb25zdDogaXJxMw0KPiA+ICsgICAgICAtIGNvbnN0OiBpcnE0DQo+ID4gKyAg
ICAgIC0gY29uc3Q6IGlycTUNCj4gPiArICAgICAgLSBjb25zdDogaXJxNg0KPiA+ICsgICAgICAt
IGNvbnN0OiBpcnE3DQo+ID4gKyAgICAgIC0gY29uc3Q6IGlycTgNCj4gPiArICAgICAgLSBjb25z
dDogaXJxOQ0KPiA+ICsgICAgICAtIGNvbnN0OiBpcnExMA0KPiA+ICsgICAgICAtIGNvbnN0OiBp
cnExMQ0KPiA+ICsgICAgICAtIGNvbnN0OiBpcnExMg0KPiA+ICsgICAgICAtIGNvbnN0OiBpcnEx
Mw0KPiA+ICsgICAgICAtIGNvbnN0OiBpcnExNA0KPiA+ICsgICAgICAtIGNvbnN0OiBpcnExNQ0K
PiANCj4gcG9ydF9pcnE8bj4/DQoNCldpbGwgY2hhbmdlLg0KDQo+IA0KPiBUaGUgcmVzdCBMR1RN
LCBhbHRob3VnaCBJIHRoaW5rIHlvdSBtYXkgd2FudCB0byBhZGQgbW9yZSBpbnRlcnJ1cHRzIGxh
dGVyLCBmb3IgdmFyaW91cyBldmVudHM/IEhvd2V2ZXIsDQo+IGl0J3Mgbm90IHJlYWxseSBjbGVh
ciB0byBtZSB3aGljaCBpbnRlcnJ1cHRzIGdvIHRocm91Z2ggdGhlIElDVSwgYW5kIHdoaWNoIGdv
IGRpcmVjdGx5IHRvIHRoZSBHSUMuDQoNClRoZSBpbnRlcnJ1cHRzIGxpc3RlZCBpbiBoZXJlIGFy
ZSB0aGUgb25lcyBmcm9tIFRhYmxlIDQuNi0yMyB3aGVyZSBJQ1UgaXMgZXhwbGljaXRseSBsaXN0
ZWQgaW4gdGhlICJVbml0Ig0KY29sdW1uLCBvbiB0b3Agb2YgdGhlIGludGVycnVwdHMgY29taW5n
IGZyb20gUEZDLiBXZSdsbCBhZGQgbW9yZSBpbnRlcnJ1cHRzIGlmIG5lZWRlZCBsYXRlciBvbiwg
YmVjYXVzZQ0KYXMgeW91IHNhaWQsIHNvbWUgdGhpbmdzIGFyZSBub3Qgc3VwZXIgY2xlYXIgZnJv
bSB0aGUgbWFudWFsLg0KDQpJJ2xsIHNlbmQgYSBuZXcgdmVyc2lvbiBzb29uLg0KDQpLaW5kIHJl
Z2FyZHMsDQpGYWINCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0K
PiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvDQo+IGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==

