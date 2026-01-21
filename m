Return-Path: <linux-renesas-soc+bounces-27200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAIaFWrUcGkOaAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 14:28:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 344C45785B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 14:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 769D06A262C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 13:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1185D480DFD;
	Wed, 21 Jan 2026 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SKnXEFAK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6F034D4F5;
	Wed, 21 Jan 2026 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001314; cv=fail; b=B42tWcQ8ycSDkTHiY7Pjvfgy8XQ9xSH3nP9+0ROP9eyenx5du0qTGS0+5IsHXSteCgPfYf+/Mc77Qry2DzJZZFpoVCX9rov+v2TtY+ghPS6xExt9rwNbawMLhxFcjMzTQM60Saa9/9M1aB/g/lAK/O0Ck/WJ15NDOIlfgnHzZLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001314; c=relaxed/simple;
	bh=jxBwqz67+pV5j2dlZ5Duzk/iRXidrHg34S2IL6m+gFo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UcsEY/LFK5dI0lECwFIPEmMKyztat44abyxHt7quaADCPsqNo4gs9hDLoz8GU4RgzjZIcVs9j6R2dE28jkRFsJXpvtI2oEbE2aCGWBK2U6ORFYM0iBxGvdLxEAA8u1y8yLn6ahQrinOK8v6k089223eUoCk+XywxnseRA7f4ddQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SKnXEFAK; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZgR7vdFIVHKZ9qwpk8jOHjJQDLyW9IRfBaselyseAOPSDobdsMFhXZvpz/wBoCI5cKF635sgs/xMObaqiOtpc8JBwtGn2OW00kDQKcmav5DexHDWJt56fVYLRrwlyrcJwrPCD3xNQuBogeR59F3KYjTjzJ96ymg7h9xDHxzMiki7YFrz9lBixB37FkLhYgPelqptSDIDq/CD740PAB81Yzy3whHiZUZDho2wCYTOc/Ku/WBs4s1CF7LI7Mgzlq9htklAGmzRhJvgckeS+zvSfLKHdiH1mkOViaCW8buGlfZWAWdB4hqrwvxkYNA8LqFO/1qnpRAgYecJteo81+7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxBwqz67+pV5j2dlZ5Duzk/iRXidrHg34S2IL6m+gFo=;
 b=Q93wFIrh7qy21wFZrmjZuoIYHn6ZQzZrnC5S3qcYFJNd+SMcNLH2+oVZI/L4gf/FThRJiucU9+4xRMthrdhFfKZ8o1QOr8CuryiiZySDM3zsDODKjb35Txp3U8EY2rSjDtI1sI2bMmsRruE+asKNyPwwCcO0kc912Eg6VIioo94lWMpunO7m5NYqMRPycJdGM21mfkzlmwtt2Iix6F4JhiEy/9xIVTO86MwosWbFWdnMDOE093CVYOE0/GxP83GwnMz0P2dn2BIoTtyNWmZAsgiAifZkYT17r53/RVZ2hq23ELlPX0is7tBnEFI6EflnelksbTLBlZX4KCG01/EyjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxBwqz67+pV5j2dlZ5Duzk/iRXidrHg34S2IL6m+gFo=;
 b=SKnXEFAKzE4ME0k3GzQscmb6fkzogVN4pqEhLBkipRTd5+u/XeST+GQkP2DRur2bbOceDEb/rJmgyRoFcW3JvRnvNLeVqPiiVb/OzuqMl8rNGQmBzUCPVaFjao/+AQvdGNZeJjwH3dGydKRA9Rzv/96MNefawMMQBKF6CmzazkM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB13254.jpnprd01.prod.outlook.com (2603:1096:604:313::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:15:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 13:15:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 09/12] arm64: dts: renesas: Add initial DTSI for RZ/G3L
 SoC
Thread-Topic: [PATCH 09/12] arm64: dts: renesas: Add initial DTSI for RZ/G3L
 SoC
Thread-Index: AQHcigussp6BaW6sl0KPgSMDNLM2dLVcmRQAgAAAybA=
Date: Wed, 21 Jan 2026 13:15:04 +0000
Message-ID:
 <TY3PR01MB113464D31C247317F76992AEA8696A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-10-biju.das.jz@bp.renesas.com>
 <CAMuHMdVvtDs3xKwMODJ=8gHr4qWt8Lw76WNd-kPyDVNyV3xUEA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVvtDs3xKwMODJ=8gHr4qWt8Lw76WNd-kPyDVNyV3xUEA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB13254:EE_
x-ms-office365-filtering-correlation-id: b8d296b0-27c4-4c71-0e12-08de58ef173a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RWVMN3lDZG5lSzliczI2REtEbG5UTTNIQndrU0RrMEtSY1dIY0R4SHlSWnFv?=
 =?utf-8?B?Y0FvbUJ4K2NYVmdaV2tOU3RrSFBjQ3ZUS3YrdHUvMnZsOUpiVkl2cmREc20w?=
 =?utf-8?B?MDF2SHZLemVxeHVzazlDZ09mclh6VHRFWkdzM1VLL3VIYnZCZXBXYkpjZGR0?=
 =?utf-8?B?NHJGdUZkL1dJcjFKcUpCc1B1bjNIaU1HK0hDU1ZaakVUbVRrZHQvVnBlTGY1?=
 =?utf-8?B?MHp1REpKVkZtSXFZc1dVVGRnMzV3WGxkaENOUVF4TU9OQlpqTURrVjdBcVBZ?=
 =?utf-8?B?VzQxZFNHek1QN3FNY3RuQlRzWHVlVG9rcENBUis3YUJwWmxnRm5xT0R5YXNZ?=
 =?utf-8?B?Q0dVUTgzRkUzOWlFTmhYR3BvMFlrekN5elQ3NjBQWFRza0xzR05heTcvZE1T?=
 =?utf-8?B?NitDMGN3dVRjOWtET202VThMR25jRGwrYmNOd3VuaW50dDNEalBXdmIxRVUr?=
 =?utf-8?B?ZHg2bkV2U01kYlJ6Z3gxUkVobzlyZDFySEdtSkNWUU9WdWVLMUZQMXptanlv?=
 =?utf-8?B?Vno3dHB5WDVkNDNseld0MXVwSWxEVElVRmpCN29kMG41Y09VT2c3d3BRZHds?=
 =?utf-8?B?cFdBdkpvTVMvZnpDMlZFNDJFSThLWlVqOEg5Vlo5anRFNmozeGRnYmF0SHBR?=
 =?utf-8?B?MFFnSk4vcThGZG1sMkp4UnM0NmRRYVVENmFONWNzY1NuTXpuMFRrR1hmcm1S?=
 =?utf-8?B?QitZc1k4NHFoQzM2RnY4ZHBueWFjMW1SaVRsNXJCdXBnRWRwNUVkZ3d4c3F6?=
 =?utf-8?B?clFPN1d6RGdBWGRkNlRZQVBWNmk2Q051bnNYbU1NcG1UQUt6bHZCRWJpdTYx?=
 =?utf-8?B?UExPcHUyWXpQcEZXdW83azNYbE9vNWlOMDhrNmtTcDBwWHVnVGRHMDd6azdS?=
 =?utf-8?B?eUwxZjI0aitHemtFTkNmUThvN0ZFQTlnTnFhbE1OcDl6V3crV1NieWRGWkhx?=
 =?utf-8?B?ci9USDZIeVllWStiUVd2MFFWV0xJbkI0Z05PTjhRWUtIVlRUNk90N21yQ1VE?=
 =?utf-8?B?dnY1bjVtWnJnWkpseTRpb05jdk0vVWllUWZXa3paVUc0NVROSjhqZ09mSE5G?=
 =?utf-8?B?OGNoUW4xczJWd0xpTTJvQVBvK0JXNVpoemxTU2cyTXh1U2Y3NnBldFhuclht?=
 =?utf-8?B?MUR4eDhNQWpJeWhpKy9ZQXp3UVBuam5vWkdQTGtJMm42czlNaDk5dWVqVmN0?=
 =?utf-8?B?bXNsK0hsYXIzR09wYzZXTklNZmg4YXZUbVFERHFCbnhnbW9ucmRYeXYzVWlJ?=
 =?utf-8?B?VHAvWjI3bkowTG41cFRvRk1QMUpEdWRkSEtEQUgwQUpsUndDYjAyRzUrRk9E?=
 =?utf-8?B?TTJEZ081d1VvN0w0UGgzV2FzZWsyWmdPVEhCcSt4VFdWUkU5ZjNSZTN2cmZZ?=
 =?utf-8?B?bjNBRzVNSnpBaFg2UUlKREt0UURsVkFacjE3U3BDNjBlck9HanRLQUc3YUdu?=
 =?utf-8?B?U2lWQzM4aXlyYnljcmtyYms4eTBNSk5OVEVxWTYvUzgyV3hjdms1WTZWYWo2?=
 =?utf-8?B?OGFNcHJBYUhQRHc1TmFYMEg0dVBWNFlDQjBJYk43dC9FZTdoVHRJUjJ2c2t4?=
 =?utf-8?B?NGluTlFlZitHN3FheHlwREgxcVo0cktjV2NVR0ZWSHpYNzJyYmJyYmlUVFAz?=
 =?utf-8?B?eTZ5VlRVV1JwOE43K0UyMG5GdDFsMktKQTROUXhUeTNBMEdvN1FTanE5bEw1?=
 =?utf-8?B?cGp6RnNjWW51RlJMamlWdGx6MWJyYSs3dG1ITE5xdEhPUWl6am1HQjE2UVJD?=
 =?utf-8?B?NlJPUnVKSEEyZnVMOUlmTGpSS0Q5TmpoL3JSTjNPUTMyS3dRTWtMMWpSeEJT?=
 =?utf-8?B?TXBldE5ya2xJSHpIb040bkVyYVc1d0hvcmlXaXRHd3VPV2JUc2U3NG83VTNw?=
 =?utf-8?B?V1MveDJxL3ljR21OZStuK2pUY1FlaG1yZkQ2emxLY3lzcCtRUGg0dmFZeGdm?=
 =?utf-8?B?eTJqLzBZYmE5ZUhQbXVHM3ltUmQrUitzUHpMTXpuRU9VRjdGM2thc3gySkg3?=
 =?utf-8?B?Y3diNlNTNGYvQ05MeUFhK2lXZm0zMzVlbmNyYlEvdFBwWFFhelVnWFlLQlVi?=
 =?utf-8?B?NGU5dGgwL1NnUmxzbjVrMk9nM1Zmc2dLeXl1RzR4YnFIcEl2dStwaEMwMlUv?=
 =?utf-8?B?RU1kWVpNdHpGdVB3RnhPYUprdS9RTTllOXpDclNVWVozY1V4QmQycjZPSU00?=
 =?utf-8?Q?bzEsLZV4fP9SRi3KMe5uxs4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXlMdVJ0Z3E1ZDcybXY2blc5VTBvTnlKRzB3UzhheEZRZHRHZ09RaE1KNGsz?=
 =?utf-8?B?RTdLTC8yOUpuN0J6ZmtIR1pRaStxNHIzVWlKT29KSjlKb2svWWI4dVV4ZEVD?=
 =?utf-8?B?dWFiNDgrb2d5NzRWM2Q2NWI4aDRkZ2RWWnlFK2xxclJVeHVLZ1BXN3A3V2dI?=
 =?utf-8?B?Y2dkdmJkWTY3R1hUM0pwTWRvMkxKVGdKZkVlZUhtazZVMVB0d0xlc05RNE1a?=
 =?utf-8?B?V284eVpUUzlmSFRSVFRFbHpRZk9qbDFONkdIVWJQR1I0bDQyWFB1R1F0N0pN?=
 =?utf-8?B?aWF0RGcySXl4aVdiNWJ0MTBQMmp4RkwxdXkyNFZiMnQ0WTkzZUcyWFFXTmpM?=
 =?utf-8?B?RGp0eUEvZVA2QkNlOXJWTUdxVEVPcjkvWTBnMEU5UWZLSWU2aEY5dnkra2I2?=
 =?utf-8?B?N2l6OWROQTJncE1uOHVMYWgya3JaaDh1Q01FUHJLdlhIeDdBZ2xqS25BQnMz?=
 =?utf-8?B?UlJIWFJjMVM5UWZKckNZM2poaFBUNGhvbGNDbUpsU1h0K3NTd29BVldLTldz?=
 =?utf-8?B?VndLS1gwc2xjcng4bE5NU24wR0NqSXJtNGtKRVJwN1NBZWxDanEvSGg1V3du?=
 =?utf-8?B?UGJJTngzaVhjZGo2QjB2WkxnTVJYWDhUM1I4dnhsUnZRNUNnSkVnallSd3Ja?=
 =?utf-8?B?Umw3ekRvcmpDZ3pHK1o1cWgvMy80K21QTEZRZlEwZ003Qlg4OHBnckZhbUJv?=
 =?utf-8?B?VlNIVUxmci9uK1JCOUR1d3ZESjN5Q3FweFBIalVBS0hXeXNzUWFXZmt2WEN2?=
 =?utf-8?B?dWpINlEvN2w5LzU1eHNRYTVpamNlRzd3K3dLVUFZM0dmRUd1TUV0RVl1alV3?=
 =?utf-8?B?NHNBZEZLbW80eUpWdUVjYTFONDBvQldYWkRLb1RaZmVDVkdRd09aSlVDdHNa?=
 =?utf-8?B?RGJjbHdhOUxoMmNuRlBubnBNNGtRRjIwVWZ4VmNLMm9yY0Z0OE1zZllrcDRX?=
 =?utf-8?B?RGxlSkw2T1pBeGxxTFdGSHBYS29ONlp3aElKZlI2cldrZ3k2dGlZd3lpWFY4?=
 =?utf-8?B?dzZSaGkvZExxMU9vcUVjSzFwV2paUVo2MW8yQUlnVUhaSzlQeGptQTJrVER3?=
 =?utf-8?B?RXFqdmVXVUJDbzlRRFk0cXZFWFpPeFhBU1pmaGcraVVnNGIrME5rd2poNUZQ?=
 =?utf-8?B?RUJjazNPMkprNmJ0OUNCamcxaWl2dEpGRGxSZE1xRW11bWxmSmhXVkViQ0NT?=
 =?utf-8?B?eU80YWNVMjZCSmVPU3JhY3UxZmxkU1QydjhMOC9scWtFOHYwWTlRV3U2NFNB?=
 =?utf-8?B?YkNQSm94V1FKYnhwM043VWxPN0tlRjNhaElvWW5NL1FhMVkxdUFISi9BcmZS?=
 =?utf-8?B?SEFwM0wrU3lLNGlmZ0l3dHExbW9nbHFYbHFseHJQeDJmU2JCc25zRENRVlc2?=
 =?utf-8?B?L1FxZkxwU0M4dFhNWXZQVWcxdU9nQzF3ZHVBSFhPSzdQWHNlWjhQMkh3eGlx?=
 =?utf-8?B?RDdIMWgvSm5BRjBmNVl0QW9kMjZCaWFEMEJCamk5SFdvYW1PM0ZNaGR3UHFt?=
 =?utf-8?B?RmxEaTZITVpGV3ZsM01Kdjl4TklUTCtyY013elR1RE9pUEJqU0QwanV0V05T?=
 =?utf-8?B?RGk1MGMvWkdIbDYwZDRsMDU5TVlHcTl3d0U5SkhHNWhwQzljQTZGcmUyRnFy?=
 =?utf-8?B?Y3h1c3cwMTdBZ2xjenVvVkVUeEFLYTlqd1RoN0QxTzJGWExtK3dXYzFWNXpV?=
 =?utf-8?B?ZGQ3NFUxblFwaXZ4Q2tSY3l5TTVCaW5ZMVAwSjFLekFkaEJpdUNIemp1TWFL?=
 =?utf-8?B?Q29ac1k5TkxhcUI4UTlZQUVxTThzc3I4ZmpTcURZYXNqRlpjNm8zZHF4Nk9R?=
 =?utf-8?B?SnhHUk94R0RUTmM3d2o2bkVJcDcydE9uK0JFSzRORURBRWNIUTRCcVBYOHRU?=
 =?utf-8?B?TkZKckhwQ3VweEc1MG1FaTZEOVcyanYxS1FmU1pPd1NmaVBNTURBaTRVZEZW?=
 =?utf-8?B?aXBxV1c5RzBMa1dXNHp1TzJxMGoyVmJWdElpY1dudVo0MDJyTE5oUHZXZ0t2?=
 =?utf-8?B?V0ZvaG9URE9rQUVTOE1NQzJjTXVWcHFibjFXRDM0QS9CdHdYSEVXWXVGMzY4?=
 =?utf-8?B?aHB1NU9wMlFzVEZjWDBTcFZGWlAyY2dxRmdONXlwYVdpTWFQVmJPNHdGNWd4?=
 =?utf-8?B?RTNiMzVDSk5WT2JIVU4zU2NTeFJqeEx5dVErcFBYK0dwcEYwbFZNNDIzQTFD?=
 =?utf-8?B?dGtXV3BtdU5zbmRNZVJTQnBLaGRkeDFWNGpEblZKck9kaTlOc3V3M2R2YWFF?=
 =?utf-8?B?SHZxcURjZEZUZjdkdHRwN1BWMkd5dnM2czFGQTFiV2ZXNXZORVN4YVAvbERi?=
 =?utf-8?B?YTExTFVZVmlNdVdGd2ExTndSOEdDT3dScmRDbDFJT2ZLYytUMHV3dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d296b0-27c4-4c71-0e12-08de58ef173a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 13:15:04.3235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kjv5epconSBpY14dJNOuyXMP23Vj8AsW3ghwpzibHBOTk28cDd3Is9XfKk1mWUUG9BzF9FVjn6W6vpVFmRzAtdMjkKA4lon/j8UZ0BIIdAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13254
X-Spamd-Result: default: False [2.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27200-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 344C45785B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIxIEphbnVhcnkgMjAyNiAxMzowNQ0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDA5LzEyXSBhcm02NDogZHRzOiByZW5lc2FzOiBBZGQgaW5pdGlhbCBEVFNJIGZvciBSWi9H
M0wgU29DDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCAyMCBKYW4gMjAyNiBhdCAxMzo1
MiwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgdGhlIGluaXRpYWwg
RFRTSSBmb3IgdGhlIFJaL0czTCBTb0MuDQo+ID4gVGhlIGZpbGVzIGluIHRoaXMgY29tbWl0IGhh
dmUgdGhlIGZvbGxvd2luZyBtZWFuaW5nOg0KPiA+ICAgLSByOWEwOGcwNDYuZHRzaTogICAgUlov
RzNMIGZhbWlseSBTb0MgY29tbW9uIHBhcnRzDQo+ID4gICAtIHI5YTA4ZzA0Nmw0OC5kdHNpOiBS
Wi9HM0wgUjBBMDhHMDQ2THs0Niw0OH0gU29DIHNwZWNpZmljIHBhcnRzDQo+ID4NCj4gPiBBZGRl
ZCBwbGFjZSBob2xkZXJzIHRvIHJldXNlIHRoZSBjb2RlIGZvciBSZW5lc2FzIFNNQVJDIElJIGNh
cnJpZXINCj4gPiBib2FyZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4g
DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yOWEwOGcwNDYuZHRzaQ0KPiA+IEBAIC0wLDAgKzEsMjE5IEBADQo+IA0KPiA+ICsgICAgICAg
c29jOiBzb2Mgew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNpbXBsZS1idXMi
Ow0KPiA+ICsgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gPiArICAgICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAgICAgICAgICAgIHJhbmdlczsN
Cj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHNjaWYwOiBzZXJpYWxAMTAwYWMwMDAgew0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxzY2lmLXI5YTA4
ZzA0NiIsICJyZW5lc2FzLHNjaWYtcjlhMDdnMDQ0IjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MCAweDEwMGFjMDAwIDAgMHg0MDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzODYgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDM4OCBJUlFf
VFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPEdJQ19TUEkgMzg5IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSAzODcgSVJRX1RZUEVfTEVWRUxfSElHSD4s
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDM5MCBJ
UlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPEdJQ19TUEkgMzkwIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJlcmkiLCAicnhpIiwgInR4aSIsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImJyaSIsICJkcmkiLCAi
dGVpIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9E
IFI5QTA4RzA0Nl9TQ0lGMF9DTEtfUENLPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBj
bG9jay1uYW1lcyA9ICJmY2siOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRv
bWFpbnMgPSA8JmNwZz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZj
cGcgUjlBMDhHMDQ2X1NDSUYwX1JTVF9TWVNURU1fTj47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiAr
DQo+ID4gKyAgICAgICAgICAgICAgIGkyYzA6IGkyY0AxMDBhZTAwMCB7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDAgMHgxMDBBRTAwMCAwIDB4NDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAvKiBwbGFjZWhvbGRlciAqLw0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiAr
ICAgICAgICAgICAgICAgY2FuZmQ6IGNhbkAxMDBjMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDAgMHgxMDBjMDAwMCAwIDB4MjAwMDA+Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIC8qIHBsYWNlaG9sZGVyICovDQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+
ID4gKw0KPiANCj4gRWFybHkgZmVlZGJhY2s6IGRlcGVuZGluZyBvbiB3aGVuIHRoaXMgZ29lcyB1
cHN0cmVhbSwgd2UgbWF5IG5lZWQgYSBmZXcgbW9yZToNCj4gDQo+ICsgICAgICAgICAgICAgICBv
aGNpMDogdXNiQDExZTEwMDAwIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogcGxhY2Vo
b2xkZXIgKi8NCj4gKyAgICAgICAgICAgICAgIH07DQo+ICsNCj4gKyAgICAgICAgICAgICAgIG9o
Y2kxOiB1c2JAMTFlOTAwMDAgew0KPiArICAgICAgICAgICAgICAgICAgICAgICAvKiBwbGFjZWhv
bGRlciAqLw0KPiArICAgICAgICAgICAgICAgfTsNCj4gKw0KPiArICAgICAgICAgICAgICAgZWhj
aTA6IHVzYkAxMWUxMDEwMCB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qIHBsYWNlaG9s
ZGVyICovDQo+ICsgICAgICAgICAgICAgICB9Ow0KPiArDQo+ICsgICAgICAgICAgICAgICBlaGNp
MTogdXNiQDExZTkwMTAwIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogcGxhY2Vob2xk
ZXIgKi8NCj4gKyAgICAgICAgICAgICAgIH07DQo+ICsNCj4gKyAgICAgICAgICAgICAgIGhzdXNi
OiB1c2JAMTFlMzAwMDAgew0KPiArICAgICAgICAgICAgICAgICAgICAgICAvKiBwbGFjZWhvbGRl
ciAqLw0KPiArICAgICAgICAgICAgICAgfTsNCj4gKw0KPiArICAgICAgICAgICAgICAgcGNpZTog
cGNpZUAxMWU0MDAwMCB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qIHBsYWNlaG9sZGVy
ICovDQo+ICsgICAgICAgICAgICAgICB9Ow0KDQpPSywgSSB3aWxsIGtlZXAgYW4gZXllIG9uIHRo
ZXNlIHBhdGNoIHNlcmllcy4NCg0KQ2hlZXJzLA0KQmlqdQ0K

