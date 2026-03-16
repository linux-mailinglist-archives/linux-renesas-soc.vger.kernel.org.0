Return-Path: <linux-renesas-soc+bounces-29504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FxzI4EeuGlYZAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:15:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6C29C1AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11199302E87B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D53939EF15;
	Mon, 16 Mar 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fTta+UqW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0934A25BEF8;
	Mon, 16 Mar 2026 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673989; cv=fail; b=TftfyT3D1kqPexFMINpfzFh1mmS7g63J7D0cn/9N/HeyFTKuLlz+6X5GWzoEKFqQ0d8g8roPBuyj6HPK6fGfck8HedzxfQjpcXAuELgGCHkwzK2ihCX82g9HM5yQNHUIS1UhSAEkMcTkRFku+28+InIO6XppLC2vKWIeNhy/Rt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673989; c=relaxed/simple;
	bh=dV7u18JiQtS+dLOxyatekVrX2sofUbDssMfEm3mAoEE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LAhSJ+LCq8z0wFtpXbYTudqvfph9U4YmNz5PMUeHIvdhw98SnMxRVxJuv0r04no6egJh9HnQiDJPbTyb/Zu29mZzpH8g5HBs/NdlfXMh4f75m4+iJUSOyIt+nyB+JIB0DVMJ07nxnd+LmLZQ/URGfHPnfbCzFcKjw8EOhDcXy28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fTta+UqW; arc=fail smtp.client-ip=52.101.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMMFdz84b9Fha1o472vYL/72cnJQzj5mW9FKlu/b1ee6WFs0G06byTJqnj4nt/CgoEkXOnXOWYu4Fzx6QIL5wuLVq1pZE0mWUQHcM+LM5G5QGZpkMt8r03NcEiZfBrNOS6r93KSvtla9LQ6fd9CjDe7kcMXB++RfBobPb+gbCjjFoO5ZlXlcfvwa58SFacLxPzMASBKq5zA6M+XWN9ukcZj7FNXYUFh3B177FmO971gXSY8Z/vW8663UZkm1t9FLGknX0ftrxNMKgWFNjZyzyRCgu6sCUMDkSf4qOLA62GL/82aWlliUhinLD0Us8RxHXUS1MxbQWWxIJtteAJ/LOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dV7u18JiQtS+dLOxyatekVrX2sofUbDssMfEm3mAoEE=;
 b=s+srcg+7GyokdaxOEkiFLfG7SBmrTYDtNGuso2FBIzLyXTxes+fKo3gd8bs/vflkUmw/ISM7ds9n1YPUKuWkWrL1eYY/SAlhsMGWgRLFIpUlHsa95rCRodYtZ2fH3sc0CFLB/HwxuvEowmVgkMOHBxm294gUw1/qN6TZtAUVztUZUh1gl0YavW3NktJtTMlIsDwNc2Vwq9fCPVfpB5EXN8CSlmaejANYm3BkVrAGL607h4XKpBlQLPSxmFJdHvR2sknYWYwYONSK1bM+c4btbJKm/9SYVg4Iv1RKF+gaBsbKRJr3YJ/q1zqm0MQfnu099QHfMP1s7lBiaoJX3PcWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dV7u18JiQtS+dLOxyatekVrX2sofUbDssMfEm3mAoEE=;
 b=fTta+UqWzs2MswAW5q1lfA1Sdh2NtIKeX6XEHm/kC5hLyWNjUCRWMNawfc3YXBO3zLAcg3TIp9i6ufqVbDq2s5kfGcGokOQAZ0ysuRCD9TOExWMGyAjoho+sHOjQnL5SqjEbaB0M0QfUtAl8XzyfqyCpdRqgdSgq1+ILY6BwF3w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB14184.jpnprd01.prod.outlook.com (2603:1096:604:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 15:13:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 15:12:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "marek.vasut@mailbox.org" <marek.vasut@mailbox.org>, geert
	<geert@linux-m68k.org>
CC: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, magnus.damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
Thread-Topic: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
Thread-Index:
 AQHcswgXxNnjGhc1/UeWMH+iCL4MUbWsrS6wgAQyogCAAAJMwIAAOwEAgAAEaOCAACVAAIAAAa2w
Date: Mon, 16 Mar 2026 15:12:47 +0000
Message-ID:
 <TY3PR01MB11346209F10AB210730C794838640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
 <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
 <TY3PR01MB11346B2FDD4E9CD1DC1A1BED18640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <96978561-3733-43db-8698-8988dd0975b7@mailbox.org>
In-Reply-To: <96978561-3733-43db-8698-8988dd0975b7@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB14184:EE_
x-ms-office365-filtering-correlation-id: 194ab2c0-5aea-46a5-aa3e-08de836e7b49
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 rK/1BpIjZNfy8vY5+gKilSaL3J17CQ6mvZnF4i7TtylL6bns17Itcb2jNixi5oX6Y/hNp2Y2ZTw3eKZmCfRXAi0FT/vsJsYJHRRchb4cnTo3A0DQ2jim0kxbv9LYHYdY6QnVUJVRXgSab9tqEezST7WNSKljfv9fOYUg9PsxFodbtNysQRNNtIrr5gzAJd7B/6sy6kyTKV+FDQoHzmqRFGqOtM0PYnvdMubay9XuKsttZRubA5G2+5/RLkfL+94TadsTK/Pt+7FBeGRIUCrfPH33VhnnKJMOZhg264z4I8faujaciRhtk9E7ah1guHN+sx1PnXVTt2rbfG7i0rc5Bf+qW0//zeniocazUJCs10hUIICCVZldeuHTuT3elt1u/jOuKRp/eSzJt4hvy144Y8LBDFdfL7hR5xfp9SkV7ZI0jPExQ8jLg5s9f7smfumqbeupUOT+lqMsWrATX33N45+Go2lgxG78Kh1yN6k99tefhT8FY6ushzHX7LFGPfuUNG7GsP2Fxeh5cyMwj8jMak+nkBcrY5lXRsufTq7W/smxxbdt1bb8vyWxsdg4IWau0NMnZOc0cmhASuVbsUUNgXa3VJkPu+UxpSzHPP8AYO3rrU8bT7+IYuF65vbkEQn7UXBVFuP4qhzYDm1lk4UEKSIr2+ndD6s3npTseEEJwFTAUGehfjeJ5uSV4G4upxnbOBRpPxN6EdPkg8Jj/aevuIsBUpXdBF9+y2Js/80oyB6iJhzihx9+AEy7ybAguE9pBf3/8DaJLxP1jJdFbr3b2KoVmJdH0s6AtNzImspaaJE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlU3S1QzY1kvbnRzcE9sRE9vbFYwU2gvcXlQTTJRKzMxUHJON3RWVXE4YWs2?=
 =?utf-8?B?R3lNbGQxVnB4OWVVY09VZHdFNU5MVmNjK05tMkUxc2NSY2x3bTE4dUkwNnBD?=
 =?utf-8?B?TFliWmFIdUhUUHQwTUszMnd6aGxHVGZCMjVaNWZRUjZsRGt2V0VRV1RlUzZE?=
 =?utf-8?B?M1hlQkhaSE5uSGR6OUhDcmtvTjB0K3M4OCtuR2x3ZUNRKzdsY3U4OUdVb0E5?=
 =?utf-8?B?NGJLQ0xBS0ZxMmVUYjR3UTc2RXhjdElTV3dTeEZwRjJXRXUvYnoxRHhwT1BE?=
 =?utf-8?B?T2hEZ1J2dXF1OE9hcVVPaVR6ZzZueU1xZjZzR0FwTkhzR0lmblFLTldSR212?=
 =?utf-8?B?K1dmS3A1S3pLRi9rcmlZbzRCUVZWdjIrTGl5ZnhhM0FkRlZFbk0wYWRiK0FX?=
 =?utf-8?B?N1Y4Q0NBb2dGN3pGb2NZeVVZMXVNUmxqZVh2dWhoWGJJYVAyT3REUDNKYnQy?=
 =?utf-8?B?RXFGSXM0OHN1d2FsRXlrZDRvNDZmVHQ2a0pMaTJUNGlyam83N3NsMjVBemdD?=
 =?utf-8?B?Q2dvS0JaZ1JoR2V6THNMcWJKRWNpQ0xhOE9UenkvZEtHQ3JYbnJPaWxKL0Zh?=
 =?utf-8?B?bWdTQU9xUHl4RmVtZEo3UFo1Nlg5WGZWeDFGaWMvY3B0L1R0eVVYYmFSRk1y?=
 =?utf-8?B?T3R1c3Jucno3S2hYL01tRG9tZVZReFVhOTR4WVBscVFzS2JNbUZiWXBmemF3?=
 =?utf-8?B?eExNRGh5Vk5rSXdBVzFTd1BqRytGd3FxMzJ0T1dNVzFyeGcvRk9nM085bDI0?=
 =?utf-8?B?d1p2Y0NhTEJQSlZwWWxPWnludmZDdExOY0ttTDNrMDNydmVmY2RWSFNWYXY4?=
 =?utf-8?B?MXdyQzVvdnQwRHRiSERJcWpRdC9rUUxPL1NTRmNuWlZ3SWNHeDZ0MXk4eVd6?=
 =?utf-8?B?WFB0enV1T09uTXkrTHhtY2JMbm5yQzBiaWg5YXhwNHRuazU4emliajk3eS9T?=
 =?utf-8?B?OXNwZWI5RHFOU1pqWFBudDhzUEtzY0JUYUU0YXlmVnR2MmVic0V0QVZGelpq?=
 =?utf-8?B?cGZpWERBWW5uSkV5djUzcElKemNneWJQaTFOOUpra0NQa05uUHlzSnMrYzVa?=
 =?utf-8?B?WFpzZ052ZHlJZmpaOWJWQjQ3dFJCMERvY1RZMXpJQ3ZLWDQ2b2VlakN1UFps?=
 =?utf-8?B?RGFwS0R0L011eDRXMUZwNUtOTlNpcjFsdU91YklSOEdFaHhPVnJyNzBEQ25T?=
 =?utf-8?B?Vlc1c3FpZ1JndzNYZFExU1pHN0FycDhPWFpKY3dFYlRsOHFXc0hKMURMWFMz?=
 =?utf-8?B?VkRGTEhNaUFzOUpLUFI1L09iNktYMlpzNDBaZTdxWkwxY2RrQ3ZpQnZHcUV0?=
 =?utf-8?B?bUtBL3Z6QXNCWTdYOFhQUWZhUWZEWDZVMzZBMktCaDg1NGkwTjkwaFRzNkhw?=
 =?utf-8?B?bzNzbHpjZHNQNHhKRFhJV0ttcno2VlIwNENzbmRKWlNZd3pKRWNsYlRwVGJN?=
 =?utf-8?B?aHVLL0dQSFQvSkZZZmZyYUdUNVRvQnQyN2lnYkVMa1hlbDdoQkR5b2dFK3NJ?=
 =?utf-8?B?di9kWGhXL2paVGVMWkQrQlZFSWRIbFI1SVNrdGJQVEV4RDRvSWcxaTdwNTF4?=
 =?utf-8?B?YnlPT3RqNUZuNGpPWkpjTFNYRjkrUGl6MDg2Mit4YW11QjNSQisvRVZPdndz?=
 =?utf-8?B?M3E2RlViRWdxcnZXc2doMERDSGJsUVJTM3VFbDdQS0VpU1BMUlJOZTdXdFRm?=
 =?utf-8?B?OWRhNUl6UXYrdkt1Q29JTVQ0bE5XRFZrZ1ZVVVdFeEVSbWdpUFoxa0ZQQ09X?=
 =?utf-8?B?NGhCU3BmYmNlVmZqQXhObTVHcTlyN2JNSVE1NENERkk0MzBzTUlWZmxFRERY?=
 =?utf-8?B?Y0JnOEhRLzkxZFNPdmRhMHByY2pCMUxOWFZib3VTb2FkNnN2dHV3QmhNZzF0?=
 =?utf-8?B?eElEY01ZMEV5Ti85Um8xSFg3ZEgxQnhRdDhWcmVONnM3SUFQaFhveVpmenA4?=
 =?utf-8?B?UEFWeFZYTG9Xa2pMa0Y0RkRWb1JPd0pDd3ZJenM3eDJBNGQyZVByVHNNT2lM?=
 =?utf-8?B?Q1NobW11TnRQejhCS0FCZjE3bnJUcElUeGtwNmRQNzNoVnBWY1cyVVlYbW5w?=
 =?utf-8?B?bVREOERuV3RTL3A4QTMxVjBCbG1WdlhFM3pPSnJ3Q0pNcFZieG4rQ083MUdi?=
 =?utf-8?B?a1pmL21MY3pyK1lYRmdEa1BQRDlkZjVGenMwZFlqZ0pxSDdNdkMrcmxrZUli?=
 =?utf-8?B?bzdzNHJXOXRIczNSU0NLa2M1S1lLOUxVa21XYzNPTVZXVm5yWDFNMXI1dzl2?=
 =?utf-8?B?d1c3Y3UvSFVEZjROOGZva05RYzE4QmZBNURCdEpHSlQxRlNYd3dzeGNKQytM?=
 =?utf-8?B?T2NUanhma0ZIVGpEbDhLOVQ2ZlNGRUVGN2UzRTVRbTMrb1haWDFtQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 194ab2c0-5aea-46a5-aa3e-08de836e7b49
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 15:12:47.0780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uh5CIabt4kkSTzhhMKPpENHmYWuJlvI03JJ8WDWyZSX8MvLH+KkGs2aZTeSsI59uXoWfnMmGqJ2YNFnwz3FShz15tHRmVzsjitNslP3IrVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14184
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29504-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[mailbox.org,lists.infradead.org,kernel.org,glider.be,bp.renesas.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 46A6C29C1AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWFyZWssDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsg
VmFzdXQgPG1hcmVrLnZhc3V0QG1haWxib3gub3JnPg0KPiBTZW50OiAxNiBNYXJjaCAyMDI2IDE1
OjA2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC80XSBhcm02NDogZHRzOiByZW5lc2FzOiBGaXgg
UEhZIEMyMiBjb21wYXRpYmxlIHN0cmluZ3MNCj4gT24gMy8xNi8yNiAxOjU4IFBNLCBCaWp1IERh
cyB3cm90ZToNCj4gDQo+IEhlbGxvIEJpanUsDQo+IA0KPiA+Pj4gSXQgZG9lcyBub3QgY292ZXIg
YWxsIHRoZSBTb0NzL2JvYXJkcy4gSWYgTWFyZWsgd2FudCB0byB0YWtlIG92ZXIsDQo+ID4+PiBI
ZSBjYW4gc2VuZCBuZXh0IHZlcnNpb24gY292ZXJpbmcgYWxsIFJlbmVzYXMgYm9hcmRzICsgYmlu
ZGluZyBjaGFuZ2UuDQo+ID4+IElzbid0IHRoaXMgc2VyaWVzIGVmZmVjdGl2ZWx5IGV4YWN0bHkg
dGhhdCA/DQo+ID4NCj4gPiBZb3UgaGF2ZSBjb3ZlcmVkIG9ubHkgOSBTb0NzIFsxXSBXaGVyZWFz
IHRoZSBwYXRjaCBzZXJpZXMgSSBwb3N0ZWQNCj4gPiBjb3ZlcnMNCj4gPiA0MyBTb0NzWzJdLg0K
PiBJIGFsc28gZGlkIG5vdCBtb2RpZnkgYW55IG9mIHRoZSBZQU1MIHNjaGVtYXMsIEkgb25seSBm
aXhlZCB0aGUgZXJyb3JzIHRoYXQgd2VyZSBkZXRlY3RlZCBpbiBuZXh0IGJ5DQo+IHRoZSBleGlz
dGluZyBzY2hlbWFzLiBNYXliZSBmaXhpbmcgb2YgZXJyb3JzIHNob3VsZCBoYXBwZW4gZmlyc3Qs
IGFuZCBhZGp1c3RtZW50IG9mIHNjaGVtYXMgYW5kDQo+IGZ1cnRoZXIgZm9sbG93IHVwIGNsZWFu
IHVwcyBjYW4gaGFwcGVuIHNlY29uZCA/DQoNCkxvb2tzIGdvb2QgdG8gbWUuDQoNCkNoZWVycywN
CkJpanUNCg==

