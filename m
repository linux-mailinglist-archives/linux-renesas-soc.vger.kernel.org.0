Return-Path: <linux-renesas-soc+bounces-28525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN4fOoWHoWlYuAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 13:01:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBB01B6DE9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 13:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68E3E3039300
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 12:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE203D3D1D;
	Fri, 27 Feb 2026 12:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OMlylFng"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E74279DC3;
	Fri, 27 Feb 2026 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772193660; cv=fail; b=WFAugGJAn1KfQo4lE4rL9jN92Zl5rgSQz/zHne+88x17kTvjEncNkdof91o5aMfaIR/g1obZIjGn+sOdPzAb2wKdgm77Wc+f2KGon2m9YK5nfNc68Uvp0dRUihga0+JN2s6wLEKOmUApPjEtAL9zbyDTibn/kOR2aOETNsgqIA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772193660; c=relaxed/simple;
	bh=ddQYHuzkv1Ww4VgsfKoKCUjxrpHO2lCmSGB48bv9a70=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gi3eod7N7pnH93yiGx1+GlD/2PAkRg91jssm8C1V3+FnZfcHg8Op2WlJlQBRrls2M0g8SZ7RtaqMbGytUZKf6p+fY2WQzTczcxkYRRNF44Bng7O1MbG1L4qkQ2LtaTKPzoLx5ZCLJ7CrrA07L4zmaOkDz1Y0YHmE4pBzoF4yFsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OMlylFng; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYyoT15wOHoXgcT2Z904R52tnHRawivMNu8YpiV91FKrm9DMHgVztN9utlJRHNr/ZHyxXdPpgvZX1l63O2htNJ54/ZbaXvCI5Akeb8vN8WucxZ/hTeLb7GeBvRfNxcymWv21f5yFroHNeUjhNyIlk2zFtLHCLr6jqzTX5g4jWugp7V4SVj7L/vF6COjFbxCsQLCj/f/EFkrlaIVtVsRMk7dja23VR91rErOhzaA3OKBOhYoIYkX3LnwHlpJUYDWfp8br4C08qW3y2xQinRx+ULPqFySbVASgBITdDOFx854Gv6B2nk4xdrTBTimZo+W+9gfnyXWSXMxhmImftJBrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddQYHuzkv1Ww4VgsfKoKCUjxrpHO2lCmSGB48bv9a70=;
 b=YCJ+gie9VaqQ9d1LWePuAmQ8MBgWwYPRrPtvK0qBclz5BjLaLa2+qHZjzF/+4PDdoWv9x79nu5qE07f990xGJA35p/6+VGVU7T7Q36dCwdmV/5RQTmC1uOYSTZps0Bq6c/SzPCTx2nTEih7iug/EJ+W48PoJd7DEM1djJwncepKdOQyNWUTcVIG/AII9YNgr2Zds67+60elvRYP3FaBBjmioLIKKIWVtKpNUB2EQQEn4pvrK9KOM+JRn6V1/5dp5/5abFe4KZrUqc3ILPLkenecr/8iYF/EcrSCeb4LZMaufK+ocn2uqBc99g3QdHlnyomWQ/5HzZrr1SIBF/J/+tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddQYHuzkv1Ww4VgsfKoKCUjxrpHO2lCmSGB48bv9a70=;
 b=OMlylFng8cuLLj+qC9OtMdTtMy3G/M146TiM88ATNVIiJ+u/xK7S0L93O1GEMNEgbBPUDahuToq92hNWtP0ButfnFYH6Z2IfN/k7rmcx78/yVn6mLbJt2mxWAjGXdIwRa7GmNs29IZLajW+M8++tVQtnHw9QW3VwPtx/JKORg/o=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB9410.jpnprd01.prod.outlook.com (2603:1096:604:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 12:00:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 12:00:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Abel Vesa
	<abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
	<krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@kernel.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Cristian
 Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>
Subject: RE: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Thread-Topic: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Thread-Index: AQHcp0w/AFgImz3nkUSRSU+NP4hsMLWWccFg
Date: Fri, 27 Feb 2026 12:00:55 +0000
Message-ID:
 <TY3PR01MB113465A96D1EEBB43C82C12A98673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB9410:EE_
x-ms-office365-filtering-correlation-id: 115050cf-fb02-4ebf-d963-08de75f7dc8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 mhcyalmFQ+4l/Ipd4IwLyigT3KTYkmeCnSPigjAB1wdtx6k1KYgI1Ohy9HUV8iYzuO92uKf7oRkbEC7Zu7y9J1yePr1LvgmCnMrLudcgRK/BcesGwR1G1bgND1of/DAReOhCTYi5//rF1SXXSPpLUwwD/rOu6IrFZCseXOWnjHJ7t0UKaM0wL5kNKaqklpgoto4KwHcHPlO9xQt4OVF2dZ7IxmEnIUGjr2G0/xwP6Um/rd8I9VjCAkovC0FKfqJi8D5r+Ilt8G7BJ2uuzGCkccrEU9jRAafAN0W8SNdRVWNttYVGjsbHTwKFXLL8op0SWx+nv6qcsHACoxHCL8/UTwdDnNRXa+NR+f1p/gI51t/9PEkD1lDAP44Rs65M/Uogyc7rpUl6AdgzCDWhwy3ZKhUaPOGoJpye9X/L7+v3VxJ4qpoaBrOCdxZfRq1dGpCpeA2JnyolavuEHfB6fbB/d9VFE3Xfrmc+/UerClJGW2DKdVX7l/fKtzu+4q3w9mXSxT2ytymYtWyO8Td1tJySQ/JVwjJcXSZitRaQK7fpLQCL+4fPvmVCDtXsq7l2LzcH8/vd8v0v4FINO34pxJXUignu5PPYQ0ZklxgPllz1AF9eaqZ3jpS4WnjerO/2uVKOGw/T+uVlhdmjUu0h2/AdAJzLwAk1CBGdkUcVL2OZlX4KzaKbfw0h0UH6NTIOHdtM9ZxTCfSCVlGzDCN6jniQlxM/WVQncMeq+OvXk0d3eAqIVz1R1sGsTWTp/A0ThRvD3p3eMlKhNypYGs3S54UtJgsVAcphdY/8r2owTyG3Nfk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2NTb0ZSMndRNCswQTBpQ0xUMzdxSXV3R2dhS0t4UWszRnBzbFNZQldBWDE5?=
 =?utf-8?B?a0VFS1E2M1ZFaXRoMTgyczFOWHJnRDNiNzU0YUU1OG5ZV1cyRjZhWDFCZXZl?=
 =?utf-8?B?MGg2RW55VkwxelFMQlNxWXh1TVAzRitTbVVwMUdXMlhQY0FaS3QrMmE2OWVO?=
 =?utf-8?B?V0o2dFdua0hEdXdCMDZLWWFjdFl3ZWFhWXRqU24vSmVoSXZtRUFsWk9zQ2hC?=
 =?utf-8?B?aENuOEljdUxwWEtacTB2SEpTcDZILzVTSUM3MG5NZjB1TkM2TU1yckllN3FR?=
 =?utf-8?B?azZJZU1aUUlUWFNRZTh0WWJoMEttVlR4UWJ5b2dkdE9FY2lsdUFCS0J6ZWF2?=
 =?utf-8?B?cHBFd2VzdXhNeXlqZFVGRTBwektybmlkblZuV2ZqZFRUL204dEFFRjdQODJW?=
 =?utf-8?B?cVdoTEM4TklEOUhDVEtYaWEzWEp3Tm4wcG14WmdPUyt2MmpqTUdDbFBxeXdu?=
 =?utf-8?B?bHZXQU5ZSEZ4cnZpWUU3Vkh2c3NmdURDMmtDVFlSOUNwUVMxaWJWVUJjdlB1?=
 =?utf-8?B?QVRVTGdzSUt3NTQvai9kUzNSVFZ5b0dBbzNlcDRNdjM5Y2tlNEVXZXdmazR5?=
 =?utf-8?B?eW5ocnR6MWtGUTJkbkRvQU8wQ09zazQvMTRYK3FXT2o1Z21MYVNIbjNjQ1ds?=
 =?utf-8?B?cmwzN2NsTXZKNUZEWHVMRGhmUE9YRWJLVW9jMldvRWg4WmRLZGNsbXJEOVR1?=
 =?utf-8?B?UllMNTFkUS9BdThQTWthbmdPWDBlZnFkR2pRcUNUVXlZU3U0WklNTEwzOUhY?=
 =?utf-8?B?akN0RlVVUjZrN09zZURuRkxwS0ZKa3hsc2toK3JFKzkwQ2VXUFlSU1U5M0NV?=
 =?utf-8?B?UWtEaDg3NWJJQ1N6TmFRdGMySU12eUVBdWRZeC9icGhvV25uSEtFb1diMmRV?=
 =?utf-8?B?K0luNzFEeDRLUTgwNTJVZmdUVnFZTVc1UG9GRlFUSzA1MndYNGZOZDd3Q3Rj?=
 =?utf-8?B?Uk92NDNiRllNczVQcXFCTVBpN0hoYXhvTS9oaDk2Y0xaYlVQNmh1Y01CV1pn?=
 =?utf-8?B?blZEQXhoYnFaTFdRNEtUR3plWVI3L0RxWXB3aytLdE1GQWlMeEJJZ3lxMkpK?=
 =?utf-8?B?a09JTHFSc2tLbmtKdE1tcGh4WmlPc2VpRk4vM1VYL2Y2UVhTTkJVT0x6Nkhk?=
 =?utf-8?B?cUJQZEt3OUR3V1dXU0VQenNnWlUyU3lXbDJKZ3JsVVRwcmZLQ2cvcEQ4SFN5?=
 =?utf-8?B?SHdSS3I2T1MyZU80VEZVcks0QnZWNEZxckhuRlM5U2ExcFZEQXJETkwzTGtD?=
 =?utf-8?B?N0ZvTDdLOGJFc3pDcEhRUlRwbkdMdEIzNFFqUDh3Z1JtVTlLY09hSG95QmFC?=
 =?utf-8?B?Q0tMSE83NmNPMzRMN01OTmQ0K29SbVRISVpXWWk3R0NSOUdqZWd1SmxQVWoz?=
 =?utf-8?B?NU83UURQdWl3WjJqMmVmQVBpdGE3b2hTSWJnYjcvL1ozbzJVVDhYTFdRSXBF?=
 =?utf-8?B?enorMXhnOTNhZ0VCRUJNR1RicjQvR0JER2lJYVNJcVlxU29seHkxN0s5Z3RF?=
 =?utf-8?B?T0xxcGdDVHFCUlhadUVzTC8yZW9rcXNEZng4L2N5a0JDSW0vYVB3QTliZCt4?=
 =?utf-8?B?eDVJYXhCd2dCMnVNeFZyejZaWlhaV2FWZm11Q2lxMDFJVEhHdlJ3YjZsbjNK?=
 =?utf-8?B?emZNQWcyaWdVdVozbjFab3hzMEVwT0tGeUJhQjI5Qmx4dXJjMTVtOVRBR25X?=
 =?utf-8?B?eDE5b0ZOVExZVnAzK0tEdlFJZ3VzdjRPRkYzNjV3SVdManMwMlBzZ0xlZHRn?=
 =?utf-8?B?VUJQN0NtVDlPMnpRZXNZSHc5UlVDeEgrd3BrYTRWL2kwQTNON2dCd2IyZ2Y0?=
 =?utf-8?B?WjV5bzU0TThBU0VxcGp3WEtXQ0Y3dWV5bGJSVnZ5dVBhL1pZTDkyVkFaNENt?=
 =?utf-8?B?dmZheE15dUpjSDNBc3dqVU1QbXVyZllyUWZqZjFZWkRNOVV0aVdmMndsdkc4?=
 =?utf-8?B?c0NtYWovdVRpOFRIWHQzVjlVelgrWXV1OFUxSDZFbVNQYVJ2ZmJhWkJlcFRU?=
 =?utf-8?B?dmNQKzFKVExFVGs5MnNFeGdHWjQ5ZjhlQUxSTFg3YkxBUjVHcTZIT01wTUow?=
 =?utf-8?B?ek4vRnVoaFR2MitUcm5sdmREaDc0L2syd3JSemN0b2crckZ4SVlpbVJ6eWwz?=
 =?utf-8?B?UTJJdDBXRmdld0daTmd1T3I1VlEvQXpGek1ENFR1ZDJFOFV6UElXOHdoVWZL?=
 =?utf-8?B?QVpLUEFvUlpiaE5BSWcyZzBLWmp5ZzB5RTR1UHpJUGlYQjRIZzVTU0hUSVdz?=
 =?utf-8?B?Um5FS0Y2M0d0N1JVSzRQWVo5aDNIL2ZLY0JGQkJlNXpneWVaR0NiZUZQMFRK?=
 =?utf-8?B?ZXVZd2kySmdVQ1A5NUQ3YUs1UTN1d1I2cy8relFqekM2WENHSFpMZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 115050cf-fb02-4ebf-d963-08de75f7dc8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 12:00:55.0235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WfdDM4BLj+4fUFstYlF5u2W1TB7VkMajGBHpMguWyH3fs9N9IxfjQDN8KO2GEvunyXvsuvlAr4nwRoa8alBhjcyoU1SeRm44aOHyyBNRcU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9410
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-28525-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RSPAMD_EMAILBL_FAIL(0.00)[bmasney.redhat.com:server fail,kernel.pengutronix.de:server fail,abelvesa.kernel.org:query timed out,linux-clk.vger.kernel.org:query timed out,cw00.choi.samsung.com:query timed out,orsonzhai.gmail.com:query timed out,linux-samsung-soc.vger.kernel.org:query timed out,mturquette.baylibre.com:query timed out,andrea.porta.suse.com:query timed out,frank.li.nxp.com:query timed out,linux-renesas-soc.vger.kernel.org:query timed out,alim.akhtar.samsung.com:query timed out,baolin.wang.linux.alibaba.com:query timed out,imx.lists.linux.dev:query timed out,linux-arm-kernel-bounces.lists.infradead.org:query timed out,tudor.ambarus.linaro.org:query timed out,linux-arm-msm.vger.kernel.org:query timed out,cristian.marussi.arm.com:query timed out,linux-kernel.vger.kernel.org:query timed out,andersson.kernel.org:query timed out,sboyd.kernel.org:query timed out];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ADBB01B6DE9
X-Rspamd-Action: no action

SGkgQnJhaW4sDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogbGludXgtYXJtLWtlcm5lbCA8bGludXgtYXJtLWtlcm5lbC1ib3Vu
Y2VzQGxpc3RzLmluZnJhZGVhZC5vcmc+IE9uIEJlaGFsZiBPZiBCcmlhbiBNYXNuZXkNCj4gU2Vu
dDogMjYgRmVicnVhcnkgMjAyNiAxODoxNw0KPiBTdWJqZWN0OiBbUEFUQ0ggMDEvMTNdIGNsazog
YWRkIG5ldyBmbGFnIENMS19ST1VORElOR19GV19NQU5BR0VEDQo+IA0KPiBUaGVyZSBhcmUgc29t
ZSBjbG9ja3Mgd2hlcmUgdGhlIHJvdW5kaW5nIGlzIG1hbmFnZWQgYnkgdGhlIGhhcmR3YXJlLCBh
bmQgdGhlIGRldGVybWluZV9yYXRlKCkgY2xrIG9wcw0KPiBpcyBqdXN0IGEgbm9vcCB0aGF0IHNp
bXBseSByZXR1cm5zIDAuIEFkZCBhIG5ldyBmbGFnIGZvciB0aGVzZSB0eXBlIG9mIGNsb2Nrcywg
YW5kIHVwZGF0ZSB0aGUgY2xrIGNvcmUNCj4gc28gdGhhdCB0aGUNCj4gZGV0ZXJtaW5lX3JhdGUo
KSBjbGsgb3AgaXMgbm90IHJlcXVpcmVkIHdoZW4gdGhpcyBmbGFnIGlzIHNldC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPg0KPiANCj4gLS0t
DQo+IFRvOiBNaWNoYWVsIFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+DQo+IFRv
OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFRvOiBBYmVsIFZlc2EgPGFiZWx2
ZXNhQGtlcm5lbC5vcmc+DQo+IFRvOiBBbmRyZWEgZGVsbGEgUG9ydGEgPGFuZHJlYS5wb3J0YUBz
dXNlLmNvbT4NCj4gVG86IEJhb2xpbiBXYW5nIDxiYW9saW4ud2FuZ0BsaW51eC5hbGliYWJhLmNv
bT4NCj4gVG86IEJqb3JuIEFuZGVyc3NvbiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+DQo+IFRvOiBD
aGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNvbT4NCj4gVG86IEZyYW5rIExpIDxGcmFu
ay5MaUBueHAuY29tPg0KPiBUbzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT4NCj4gVG86IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4g
VG86IE9yc29uIFpoYWkgPG9yc29uemhhaUBnbWFpbC5jb20+DQo+IFRvOiBTYXNjaGEgSGF1ZXIg
PHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+IFRvOiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xs
YUBrZXJuZWwub3JnPg0KPiBUbzogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1
bmcuY29tPg0KPiBUbzogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPg0K
PiBDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZw0KPiBDYzogQWxpbSBBa2h0YXIgPGFsaW0uYWtodGFyQHNhbXN1bmcuY29tPg0K
PiBDYzogYXJtLXNjbWlAdmdlci5rZXJuZWwub3JnDQo+IENjOiBDaHVueWFuIFpoYW5nIDx6aGFu
Zy5seXJhQGdtYWlsLmNvbT4NCj4gQ2M6IENyaXN0aWFuIE1hcnVzc2kgPGNyaXN0aWFuLm1hcnVz
c2lAYXJtLmNvbT4NCj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4NCj4g
Q2M6IGlteEBsaXN0cy5saW51eC5kZXYNCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZw0KPiBDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxp
bnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGludXgtc2Ftc3VuZy1zb2NA
dmdlci5rZXJuZWwub3JnDQo+IENjOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gQ2M6
IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+IC0tLQ0K
PiAgZHJpdmVycy9jbGsvY2xrLmMgICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysr
Ky0tLQ0KPiAgaW5jbHVkZS9saW51eC9jbGstcHJvdmlkZXIuaCB8ICAyICsrDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvY2xrLmMgYi9kcml2ZXJzL2Nsay9jbGsuYyBpbmRleA0KPiBmZDQx
OGRjOTg4YjFjNjBjNDllM2FjOWMwYzQ0YWExMzJkZDVkYTI4Li4wYTUyMmEwODE3NDExYzdmN2M2
ZTljZmZkNmYwMjRlNjcyYTMzMWE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Nsay9jbGsuYw0K
PiArKysgYi9kcml2ZXJzL2Nsay9jbGsuYw0KPiBAQCAtMTU1Nyw2ICsxNTU3LDIwIEBAIHN0YXRp
YyBpbnQgX19pbml0IGNsa19kaXNhYmxlX3VudXNlZCh2b2lkKSAgfQ0KPiBsYXRlX2luaXRjYWxs
X3N5bmMoY2xrX2Rpc2FibGVfdW51c2VkKTsNCj4gDQo+ICsvKioNCj4gKyAqIGNsa19pc19yb3Vu
ZGluZ19md19tYW5hZ2VkIC0gQ2hlY2sgdG8gc2VlIGlmIGNsayByb3VuZGluZyBpcyBoYW5kbGVk
DQo+ICtieSB0aGUNCj4gKyAqIGZpcm13YXJlLg0KPiArICogQGNvcmU6IHRoZSBjbGsgdG8gY2hl
Y2sNCj4gKyAqDQo+ICsgKiBDbGtzIHRoYXQgaGF2ZSB0aGlzIGZsYWcgZW5hYmxlZCBkbyBub3Qg
bmVlZCB0byBoYXZlIGENCj4gK2RldGVybWluZV9yYXRlKCkgb3ANCj4gKyAqIHNldCwgYW5kIHdp
bGwgYWx3YXlzIHJldHVybiBzdWNjZXNzIGZvciBhbnkgcm91bmRpbmcgb3BlcmF0aW9uIHNpbmNl
DQo+ICt0aGUNCj4gKyAqIGZpcm13YXJlIHdpbGwgZGVhbCB3aXRoIHRoZSByb3VuZGluZy4NCj4g
KyAqLw0KPiArc3RhdGljIGlubGluZSBib29sIGNsa19pc19yb3VuZGluZ19md19tYW5hZ2VkKHN0
cnVjdCBjbGtfY29yZSAqY29yZSkgew0KPiArCXJldHVybiBjb3JlLT5mbGFncyAmIENMS19ST1VO
RElOR19GV19NQU5BR0VEOyB9DQo+ICsNCj4gIHN0YXRpYyBpbnQgY2xrX2NvcmVfZGV0ZXJtaW5l
X3JvdW5kX25vbG9jayhzdHJ1Y3QgY2xrX2NvcmUgKmNvcmUsDQo+ICAJCQkJCSAgIHN0cnVjdCBj
bGtfcmF0ZV9yZXF1ZXN0ICpyZXEpDQo+ICB7DQo+IEBAIC0xNTg5LDYgKzE2MDMsOCBAQCBzdGF0
aWMgaW50IGNsa19jb3JlX2RldGVybWluZV9yb3VuZF9ub2xvY2soc3RydWN0IGNsa19jb3JlICpj
b3JlLA0KPiAgCQlyZXEtPnJhdGUgPSBjb3JlLT5yYXRlOw0KPiAgCX0gZWxzZSBpZiAoY29yZS0+
b3BzLT5kZXRlcm1pbmVfcmF0ZSkgew0KPiAgCQlyZXR1cm4gY29yZS0+b3BzLT5kZXRlcm1pbmVf
cmF0ZShjb3JlLT5odywgcmVxKTsNCj4gKwl9IGVsc2UgaWYgKGNsa19pc19yb3VuZGluZ19md19t
YW5hZ2VkKGNvcmUpKSB7DQo+ICsJCXJldHVybiAwOw0KPiAgCX0gZWxzZSB7DQo+ICAJCXJldHVy
biAtRUlOVkFMOw0KPiAgCX0NCj4gQEAgLTE2NzMsNyArMTY4OSw3IEBAIEVYUE9SVF9TWU1CT0xf
R1BMKGNsa19od19mb3J3YXJkX3JhdGVfcmVxdWVzdCk7DQo+IA0KPiAgc3RhdGljIGJvb2wgY2xr
X2NvcmVfY2FuX3JvdW5kKHN0cnVjdCBjbGtfY29yZSAqIGNvbnN0IGNvcmUpICB7DQo+IC0JcmV0
dXJuIGNvcmUtPm9wcy0+ZGV0ZXJtaW5lX3JhdGU7DQo+ICsJcmV0dXJuIGNvcmUtPm9wcy0+ZGV0
ZXJtaW5lX3JhdGUgfHwgY2xrX2lzX3JvdW5kaW5nX2Z3X21hbmFnZWQoY29yZSk7DQo+ICB9DQo+
IA0KPiAgc3RhdGljIGludCBjbGtfY29yZV9yb3VuZF9yYXRlX25vbG9jayhzdHJ1Y3QgY2xrX2Nv
cmUgKmNvcmUsIEBAIC0zNTI4LDYgKzM1NDQsNyBAQCBzdGF0aWMgY29uc3QNCj4gc3RydWN0IHsN
Cj4gIAlFTlRSWShDTEtfSVNfQ1JJVElDQUwpLA0KPiAgCUVOVFJZKENMS19PUFNfUEFSRU5UX0VO
QUJMRSksDQo+ICAJRU5UUlkoQ0xLX0RVVFlfQ1lDTEVfUEFSRU5UKSwNCj4gKwlFTlRSWShDTEtf
Uk9VTkRJTkdfRldfTUFOQUdFRCksDQo+ICAjdW5kZWYgRU5UUlkNCj4gIH07DQo+IA0KPiBAQCAt
MzkwNiw3ICszOTIzLDcgQEAgc3RhdGljIGludCBfX2Nsa19jb3JlX2luaXQoc3RydWN0IGNsa19j
b3JlICpjb3JlKQ0KPiANCj4gIAkvKiBjaGVjayB0aGF0IGNsa19vcHMgYXJlIHNhbmUuICBTZWUg
RG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2Nsay5yc3QgKi8NCj4gIAlpZiAoY29yZS0+b3BzLT5z
ZXRfcmF0ZSAmJiAhY29yZS0+b3BzLT5kZXRlcm1pbmVfcmF0ZSAmJg0KPiAtCSAgICAgIGNvcmUt
Pm9wcy0+cmVjYWxjX3JhdGUpIHsNCj4gKwkgICAgICBjb3JlLT5vcHMtPnJlY2FsY19yYXRlICYm
ICFjbGtfaXNfcm91bmRpbmdfZndfbWFuYWdlZChjb3JlKSkgew0KPiAgCQlwcl9lcnIoIiVzOiAl
cyBtdXN0IGltcGxlbWVudCAuZGV0ZXJtaW5lX3JhdGUgaW4gYWRkaXRpb24gdG8gLnJlY2FsY19y
YXRlXG4iLA0KPiAgCQkgICAgICAgX19mdW5jX18sIGNvcmUtPm5hbWUpOw0KPiAgCQlyZXQgPSAt
RUlOVkFMOw0KPiBAQCAtMzkyMCw3ICszOTM3LDggQEAgc3RhdGljIGludCBfX2Nsa19jb3JlX2lu
aXQoc3RydWN0IGNsa19jb3JlICpjb3JlKQ0KPiAgCQlnb3RvIG91dDsNCj4gIAl9DQo+IA0KPiAt
CWlmIChjb3JlLT5vcHMtPnNldF9wYXJlbnQgJiYgIWNvcmUtPm9wcy0+ZGV0ZXJtaW5lX3JhdGUp
IHsNCj4gKwlpZiAoY29yZS0+b3BzLT5zZXRfcGFyZW50ICYmICFjb3JlLT5vcHMtPmRldGVybWlu
ZV9yYXRlICYmDQo+ICsJICAgICFjbGtfaXNfcm91bmRpbmdfZndfbWFuYWdlZChjb3JlKSkgew0K
DQo+ICAJCXByX2VycigiJXM6ICVzIG11c3QgaW1wbGVtZW50IC5zZXRfcGFyZW50ICYgLmRldGVy
bWluZV9yYXRlXG4iLA0KPiAgCQkJX19mdW5jX18sIGNvcmUtPm5hbWUpOw0KPiAgCQlyZXQgPSAt
RUlOVkFMOw0KDQoNCkFmdGVyIGFwcGx5aW5nIHBhdGNoIzExLCBJIGdldCBhIG1lc3NhZ2UgYXMg
eW91IHJlbW92ZWQgLmRldGVybWluZV9yYXRlLCBBbHNvIGl0IGJyZWFrcyBkaXNwbGF5Lg0KDQpb
ICAgIDAuMDk2NDE0XSBfX2Nsa19jb3JlX2luaXQ6IC5wbGw1X2ZvdXRwb3N0ZGl2IG11c3QgaW1w
bGVtZW50IC5yb3VuZF9yYXRlIG9yIC5kZXRlcm1pbmVfcmF0ZSBpbiBhZGRpdGlvbiB0byAucmVj
YWxjX3JhdGUNCg0KDQpDaGVlcnMsDQpCaWp1DQo=

