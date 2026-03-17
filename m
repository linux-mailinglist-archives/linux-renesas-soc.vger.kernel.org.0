Return-Path: <linux-renesas-soc+bounces-29668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPUPNEG1uWnJMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:10:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE52B2B2032
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 128EE3013FFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD5A377547;
	Tue, 17 Mar 2026 20:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Bp5RZowc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE68346771;
	Tue, 17 Mar 2026 20:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773778237; cv=fail; b=X+WZnfBj8OhIiwKIftSXSuIiuH9p2A8XG+50UIHC76WzpEsqC/4x0TzLGx5OjLR9LkDbaW/A4ZtvjcmH1JhqTBsV5LjWquiyXQF2n742EgL0IAttYyQ8DHecKaH3XnydW4pjOlAxoEdx/qyKZZhK3rR7BIfIjBoj0T2UwnltAO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773778237; c=relaxed/simple;
	bh=9fzpPHdNAgD8hjtFxhSNHdlJnxLbxIIehuvmiCS5GG0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EZiVqeohQyEBDfnIwV5Rxh0z0Q0esP6PbiDVhLeaks81IEtxaX2TwWM6BgTIM163luoCZYenvG/Io5v56ruj2SGzB8/Z4FJMZwHqnxr5acWoWy0YrJvU7sVhyYngE2RydaOLR9ogU/EvKLD1u5VPxxoOEmiTBDUpaNwLn/UWNQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Bp5RZowc; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VewOUbK+J5ZTzPs5vTkKfLrXll7nDhYrSFqVCvOtGnqz80GsoLRkSP1EcibYvWaBQB5DsKt2JwWxEO+cYf8yK53Od+ayETlZnd25nlGSa4BPr6fQ5Nnfn2IM/mG/tHZ1k6ZsVOr5Sw+i413QLto2E+PDTN9pIxVhULjHJZZnW943XTQDphXCrPj0FiVJ17rKefzKPu7HoG5tW7Rixgd6f5v3YJNEHsB6r9j9/uRLo/O6f8CIh5HeLJj2iYudCnsTTxxb1wgapzE/288vmRamMg8ThOsH7nkMqOrVvZIOXVS+rlqlQ7DtVCmICq+tEuXNq/t8MSLiLXkXLaHeK+uzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fzpPHdNAgD8hjtFxhSNHdlJnxLbxIIehuvmiCS5GG0=;
 b=HfKoNx0qwtrA0+P+zu+fAx9hwbhd0HVHfkTMOwS/y/hl3Ow6wVIbU7MH0O1ZeOUP5yo+B8xTmL5ya/AKL8zEID5RYSQhWtJUoPY0FnTyE3g/dHYd+iXqu+HTKlTDsHa3rzRs3vBk5RHXw7A4Cxqj6ChHAGglL6x3pwD9DWt5UXsgWXpU5OE5ZYP1iVXlt8JUDnAq//XNkbCXfwxAVaKoqwpjaLIEFT8HweL9dn8mwTC/jqyRTRosxIq4ImimYUFZqobXJhwZhEMH1nEYh6PPl52AZMNo7OkOD8Jv4PtGscAPF9uI/Q6jH2u2f0lp+aWu+3Pxn6RFbx+BCpvWgzKQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fzpPHdNAgD8hjtFxhSNHdlJnxLbxIIehuvmiCS5GG0=;
 b=Bp5RZowcB43XNjhPq1eh14SlELltQRTeiZTUf637X4BTHlVt5NB39L38FCgw60Hqu8A3xUDyi+TvcIjy9NwECbEwE0EUbSctQFYg5pvTxbkJBRPUzy5oA7NghJS/t6IIKC+2+p6MvtWQRo5pc5ac++yPdXImZb/YthZqzPQq4u8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYXPR01MB15716.jpnprd01.prod.outlook.com (2603:1096:405:29d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 20:10:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 20:10:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: biju.das.au <biju.das.au@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Chris Brandt
	<Chris.Brandt@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Topic: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Index:
 AQHctgqqun0iZdWPQkGCYHsU3REA1bWy0bQAgAAAR5CAAAU4AIAAAlBAgAAMHwCAAAKV8IAAKhgAgAAL7iCAAAQdgIAAAHBg
Date: Tue, 17 Mar 2026 20:10:31 +0000
Message-ID:
 <TY3PR01MB11346CB2BD3779E8E0D7F67FB8641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
 <20260317123610.329630-3-biju.das.jz@bp.renesas.com>
 <20260317110112.338259354289bb60a57fc259@hugovil.com>
 <TY3PR01MB113462F9E8CEA0506984299768641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260317112052.3dc4b56b42b906381df80e94@hugovil.com>
 <TY3PR01MB1134627E19FCEA40819F8C6578641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260317121232.39b1728e4d53d7243856a403@hugovil.com>
 <TY3PR01MB11346B55F3F5C28FE9E763AF48641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260317145226.b84c29335c5badfdd257d0df@hugovil.com>
 <TY3PR01MB113469B2E916BDD343BD516F78641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260317154951.2670d458fae59adcffa0d497@hugovil.com>
In-Reply-To: <20260317154951.2670d458fae59adcffa0d497@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYXPR01MB15716:EE_
x-ms-office365-filtering-correlation-id: 574ba117-99a0-4507-ad7d-08de84613dd7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 U24NPYMD3JtXMdQteZjlbQMI8L3qhCUnJYaVRcs92p/Nd4plahL9/LKMEQag7SaLPAYjonV4VfhoC4Dv3AAhRCZIbDPlevo6bHhXNCZ2w4JXyGFuUbUfSp1GSgCttNiJgjKpIM/H89nwvgYGsjBHUPVM8mx9NUHyKEHg6CXJvhUePgi3m6T+2ZTuEf6R6UTJ7KLLbSfZK2GkeFP7Omux278p0keWkoRFW8/ELt7ak/FhB8XR4x6eNDMiKP8TJCsFDi89TrSDpoWmF8ac6vOH1e3uzc3cHUrCGXPCsz7p+pMUhgFwTFFjHykv5HOdkwB7wA0qrrgDURuazwazw7sR9Ll6Bva3QTL4ZNiGKKXgIl1obgMEzB3ehTiKS2WEwMhgz/E/H/YdFu1laa+VfHnxTdsaCD7jqpGK8qyr9uClvCwOUTXL3AtbIdHP/eQA0sEHH+poOCEwWm71y/siJ5q7g+dLXrvlUcj9YNG3tvaQHrzaath5rrmzKNptLqKVUXBcV7PFVmdQ2lye5ac58Cp1z7gFOHVzG7JcOe2W0fsnhCNwDjaRESqofrI8j5uEmaU0HzqOSBr2p/QUhVuC+lKh2+0tZz/8P2jcIOPGH/8LEqvAA4URkbUsHtR9fuxeKNMV+MXfPxuipxtryqUvlYYlgkjASgMe0VvyJieDwO2yWBL/rBoh2aitc0dh5dHn/AOgYwK7CjPbrEhV6K4lIZl7psfwBla0p2wrVrYMOB7ZoDIIVpEH+6vcA/u0tudFMEWQFkyYKd5fjcxH+wOUA1XU33v1CrBF10DTNfjz7ZVVMrs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1FEcDRoaHozbjZ6NWxRRklsbW5uL1F5Z3VKaUJudUt4ZW11S3o2cUo4cktB?=
 =?utf-8?B?RVRreVdWQ3NFSFdWL08yR3NGTzhUNFN5RXpCS2V6NE1SaWU4Qkh2R1BENUho?=
 =?utf-8?B?TFJOL1B2a1ZoamgyZEl0Y1d0Z2N5WklCbU5Eb0tQVVdlZWdsNUZYbWpkM2lT?=
 =?utf-8?B?MnRCZXJiN0FZdDJvU1pMMmtUK2xEZDhJME0rcG5hU0JBTGE1Z1k4eWRKSmhK?=
 =?utf-8?B?Nk8xQ01ndjl3RE9URXBld05TYXNzbkp0T0Y5YWVpaEJqU3M0UUF0Z1kyTXJN?=
 =?utf-8?B?N0VDYjRENzU4UWRyTWJFUmZhKzY1b0piNkwrYVViU294ZnJmSFRFdzRxSlc2?=
 =?utf-8?B?ZFdHL05BNllOaTdIN3VPaEtvV3NJYmdGNS84M3VETHFickNST1U1TkpiRDUy?=
 =?utf-8?B?NjJKQ2xSZG1uK1NYMkQrRkc3dkgwcUZGOWlzTTJGUmYzVlc0VGliZWJoU0Yv?=
 =?utf-8?B?N1dwdlVYNlNJUGoxSDhnVTk3cjFhRkFnV0xxS1VPSEhXdWVSNmpWdWhqYTYw?=
 =?utf-8?B?Y2ZuT28yeDBIaHBGaGhOemhKSmVqVERDWkthcVNIRTd1dnQramNPWGRlQ3gr?=
 =?utf-8?B?c1E3bytGZjEvL3R3R3RPQ2dKZFU0eDE1RjdVcm5QNHRsM2xnK3lnVWhzRFdC?=
 =?utf-8?B?OTJIbDUwQjc5Y1pXM0ZaeExlSys0UHJKNWJHdGg4Q01xVmprbzNMV3pBV3VJ?=
 =?utf-8?B?VnpzREMxTThKL1YzVWlnSktEWEFtR0NWdlVuWkx5K0FaQk0zY2VLV1AvUVAz?=
 =?utf-8?B?V01NUmczeTl4Nk5SelI1MVVhMVcxZTBLNjJxU2Noa0FtOXgrTzFpOVpweTZW?=
 =?utf-8?B?NUdHMXo5by91MlZCSmpQdldSTUV1M2ZoMndzeVRjOGJmM2NGNkQ4K3JxN3E0?=
 =?utf-8?B?Ky92UXk3ZDJKMnVEVVhBaUR1cDErR1FzTzUrem1aK1JMVTlnYnFudDM4OWJs?=
 =?utf-8?B?TE9rSm10YkRuUXZNdi9ESVdsRzI0bXEvMEFZTElZZHRnZkZIQVAzVlErK0JF?=
 =?utf-8?B?QUVtOTdRRUxvN1VKTzZQV0YxRitXNUVoSkhTYUR0L1BFNG03OGZaZ0JZTkQ5?=
 =?utf-8?B?ZnowUHlianA2eDBwbGVXVm5LU010WDNodWo1SVdpYVJycW5jcHFwanNOVHpU?=
 =?utf-8?B?ak54QmZ4R3JXS2xKeXQ5UjdET0ZselhBUk1rT2VtRTJEVEt3YWhDUUZIdEx4?=
 =?utf-8?B?OTMrV2FyNTUzS3BQeFZzZlY4emlBTERMQmttQkhrZThXT0RkT2pQR3V1cyts?=
 =?utf-8?B?NDZGanhKZU1OeFB5L1dUT0NlbEJhUVRrQk9RTDZ0T0xsN0JGTHFEK1FKSzFM?=
 =?utf-8?B?OEllMUNSTnBHZWN5K2VtL2ducWdyempkVjBZd3liWlBLOFd6R2ZUQXY3YlNK?=
 =?utf-8?B?b1dRWjlCY0JPaEJyTDFpaUtUY3BUVWZTY2s5UmFjaEFRMVRmelhpclRHZ3JS?=
 =?utf-8?B?QTA3bmg4ZmhNYVNnamxtbTdUREtKYXZkRktPMUZSdHpWOUZOQ3NjUENrQmVm?=
 =?utf-8?B?MWdBTUdQV2tMMFd4WDdJalQ3TUNJQ1ZhUG5ySU1pMzFWK3M4emhnWkphdHp3?=
 =?utf-8?B?T2dFOERuQ0k2TWVjNHVmMlpTc0xzTjQ3UmtWVURBaittblRmZkJWcDBIZ0kr?=
 =?utf-8?B?bnBpdVJ3YmEyVzB0Y2Y2QkhuTTBjMllQY0xOeE83NERGVVdCb1VOOEpaMVla?=
 =?utf-8?B?MElyK0tpa1ExYVFXNnNicWxEQ3U3LzZybFVxRDZDcExFZHM2Qm1Lb055MEVJ?=
 =?utf-8?B?T2NkKzFHaVVVS3JTTnBrTEZQSHRMKzE4cW82ZGlMYU1SRldkdUU3cVB6MzRB?=
 =?utf-8?B?eGdKaW1wQTlrUkFVMmJwMGhZaFA5Z09sdS91bUx5c0lERHJnQkd1amxjTUdF?=
 =?utf-8?B?blB2VVJuMCtaT2daWHRzVVdKRmVwazRLZmhMOGxxYm4xeFVIVWovYXlXOEdj?=
 =?utf-8?B?azdHeVloQ3FXV083VHBaY2RvdVhyUzMvbnd1ZW5TTmN6Ymh4NEtSR0FZSi9I?=
 =?utf-8?B?TzJmWng5aEFqUk8rMjRTME9WU2tCODM3bnRZUmd3UnNNdTFpMm0vUVZxME5K?=
 =?utf-8?B?LzJUU0Z6dGQrUGx3T0pUZHFFT2REdTJSTU1UQ1hOd2JEYlJNWUJHYVo4Uld5?=
 =?utf-8?B?eUtUS0loMFBGU0IweEtBUVRYaWxzR1VxRy9WaW05STZRdnBxNDg4ajVuTVBM?=
 =?utf-8?B?ZFhFZ2Q1RkJuWHlSbFJIZjRMVWlocklFTGs4YjdGRlRVdjNtVHhjMDJJdFVJ?=
 =?utf-8?B?SGhUNGt0VkhIZnkySFdTeHlpNVM2U3JKQ2Y3bVVTTXpsM3BmY2tpRi9ROUo1?=
 =?utf-8?B?SGUxNTJCMjE1UlV4MDBEUkdxa25ReHN0VjJ1QTlhY0tTQUF3Zk9VUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 574ba117-99a0-4507-ad7d-08de84613dd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 20:10:31.7408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSYt8SlRyedgmMzXEfY2/I6r02aXQV2eRe7n+b5XtQUoJeSE8HncrBBsimY7PQuhzVpa4lxb0KrCnMgZ7UG6Rxqazv7tPVUa9QQoU0gwLSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15716
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29668-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: DE52B2B2032
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSHVnbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IEh1Z28gVmlsbGVuZXV2ZQ0KPiBTZW50OiAxNyBNYXJjaCAyMDI2IDE5OjUwDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMi8yXSBkcm06IHJlbmVzYXM6IHJ6ZzJsX21pcGlfZHNpOiBGaXggdGhlIHBv
d2VyLW9uIHNlcXVlbmNlDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCAxNyBNYXIgMjAy
NiAxOTozNzozNSArMDAwMA0KPiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiANCj4gPiBIaSBIdWdvLA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZg0KPiA+ID4gT2YgSHVnbyBWaWxsZW5ldXZlDQo+ID4g
PiBTZW50OiAxNyBNYXJjaCAyMDI2IDE4OjUyDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIv
Ml0gZHJtOiByZW5lc2FzOiByemcybF9taXBpX2RzaTogRml4IHRoZQ0KPiA+ID4gcG93ZXItb24g
c2VxdWVuY2UNCj4gPiA+DQo+ID4gPiBIaSBCaWp1LA0KPiA+ID4NCj4gPiA+IE9uIFR1ZSwgMTcg
TWFyIDIwMjYgMTY6MzY6MDUgKzAwMDANCj4gPiA+IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gPiBIaSBIdWdvLA0KPiA+ID4gPg0KPiA+
ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gRnJvbTogZHJpLWRl
dmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uDQo+ID4gPiA+
ID4gQmVoYWxmIE9mIEh1Z28gVmlsbGVuZXV2ZQ0KPiA+ID4gPiA+IFNlbnQ6IDE3IE1hcmNoIDIw
MjYgMTY6MTMNCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZHJtOiByZW5lc2Fz
OiByemcybF9taXBpX2RzaTogRml4IHRoZQ0KPiA+ID4gPiA+IHBvd2VyLW9uIHNlcXVlbmNlDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBIaSBCaWp1LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gVHVl
LCAxNyBNYXIgMjAyNiAxNTo0NToyOSArMDAwMCBCaWp1IERhcw0KPiA+ID4gPiA+IDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEhpIEh1
Z28sDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+ID4gPiA+ID4gPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24NCj4gPiA+ID4gPiA+ID4gQmVoYWxmIE9mIEh1Z28gVmlsbGVu
ZXV2ZQ0KPiA+ID4gPiA+ID4gPiBTZW50OiAxNyBNYXJjaCAyMDI2IDE1OjIxDQo+ID4gPiA+ID4g
PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkcm06IHJlbmVzYXM6IHJ6ZzJsX21pcGlfZHNp
OiBGaXgNCj4gPiA+ID4gPiA+ID4gdGhlIHBvd2VyLW9uIHNlcXVlbmNlDQo+ID4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiA+IEhpIEJpanUsDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IE9u
IFR1ZSwgMTcgTWFyIDIwMjYgMTU6MTM6MDcgKzAwMDAgQmlqdSBEYXMNCj4gPiA+ID4gPiA+ID4g
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gPiBIaSBIdWdvLA0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gVGhh
bmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gPiA+ID4gPiBGcm9tOiBkcmkt
ZGV2ZWwNCj4gPiA+ID4gPiA+ID4gPiA+IDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+ID4gPiA+ID4gPiA+ID4gSHVnbyBWaWxsZW5ldXZl
DQo+ID4gPiA+ID4gPiA+ID4gPiBTZW50OiAxNyBNYXJjaCAyMDI2IDE1OjAxDQo+ID4gPiA+ID4g
PiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZHJtOiByZW5lc2FzOiByemcybF9taXBp
X2RzaToNCj4gPiA+ID4gPiA+ID4gPiA+IEZpeCB0aGUgcG93ZXItb24gc2VxdWVuY2UNCj4gPiA+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBIaSBCaWp1LA0KPiA+ID4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gPiA+IE9uIFR1ZSwgMTcgTWFyIDIwMjYgMTI6MzY6MDEgKzAwMDAg
QmlqdQ0KPiA+ID4gPiA+ID4gPiA+ID4gPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4NCj4gPiA+ID4g
PiA+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4g
RnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBNb3ZlIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQo
KSBhbmQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gcmVzZXRfY29udHJvbF9hc3NlcnQoKSBmcm9tDQo+
ID4gPiA+ID4gPiA+ID4gPiA+IHJ6ZzJsX21pcGlfZHNpX2RwaHlfaW5pdCgpL3J6ZzJsX21pcGlf
ZHNpX2RwaHlfZXhpdCgpDQo+ID4gPiA+ID4gPiA+ID4gPiA+IHRvDQo+ID4gPiA+ID4gPiA+ID4g
PiA+IGF0b21pY19wcmVfZW5hYmxlKCkgYW5kIGF0b21pY19wb3N0X2Rpc2FibGUoKQ0KPiA+ID4g
PiA+ID4gPiA+ID4gPiByZXNwZWN0aXZlbHksIGFuZCBtb3ZlDQo+ID4gPiA+ID4gPiA+ID4gPiA+
IHJ6ZzJsX21pcGlfZHNpX3NldF9kaXNwbGF5X3RpbWluZygpIGZyb20NCj4gPiA+ID4gPiA+ID4g
PiA+ID4gYXRvbWljX3ByZV9lbmFibGUoKSB0byBhdG9taWNfZW5hYmxlKCksIHRvIGFsaWduIHdp
dGgNCj4gPiA+ID4gPiA+ID4gPiA+ID4gdGhlIHBvd2VyLW9uIHNlcXVlbmNlIGRlc2NyaWJlZCBp
biBGaWd1cmUgMzQuNSBvZg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBzZWN0aW9uDQo+ID4gPiA+ID4g
PiA+ID4gPiA+ICIzNC40LjIuMSBSZXNldCIgb2YgdGhlIFJaL0cyTCBoYXJkd2FyZSBtYW51YWwN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gUmV2LjEuNTAgTWF5IDIwMjUuDQo+ID4gPiA+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+IEFjY29yZGluZyB0byB0aGUgaGFyZHdhcmUgbWFudWFs
LCBMSU5LIHJlZ2lzdGVycyBtdXN0DQo+ID4gPiA+ID4gPiA+ID4gPiA+IGJlIHdyaXR0ZW4gYmVm
b3JlIGRlYXNzZXJ0aW5nIENNTl9SU1RCLCBhbmQgdGhlIDFtcw0KPiA+ID4gPiA+ID4gPiA+ID4g
PiBkZWxheSBpcyByZXRhaW5lZCBpbg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBhdG9taWNfcHJlX2Vu
YWJsZSgpIGFmdGVyIHRoZSBkZWFzc2VydC4NCj4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IFNlZW1zIHRvIG1l
IGxpa2UgdGhpcyBzaG91bGQgYmUgYmFja3BvcnRlZCB0byBzdGFibGUNCj4gPiA+ID4gPiA+ID4g
PiA+IGJyYW5jaGVzIChtaXNzaW5nIEZpeGVzIC8gQ2M6IHN0YWJsZQ0KPiA+ID4gPiA+IHRhZ3Mp
Pw0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gT0ssIHdpbGwgYWRkIGZpeGVzL3N0
YWJsZSB0YWdzLg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAu
Li4vZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMgICAgfCAyNyArKysrKysr
KysrKy0tLS0tLS0tDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gYS9kcml2ZXJzL2dw
dS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9taXBpX2RzaS5jDQo+ID4gPiA+ID4gPiA+ID4gPiA+
IGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfbWlwaV9kc2kuYw0KPiA+ID4g
PiA+ID4gPiA+ID4gPiBpbmRleCBlNTNiNDhlNGRlNTYuLjkwNTNjZTAzN2I3NSAxMDA2NDQNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpn
MmxfbWlwaV9kc2kuYw0KPiA+ID4gPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmVuZXNhcy9yei1kdS9yemcybF9taXBpX2RzaS5jDQo+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC00
ODQsNyArNDg0LDYgQEAgc3RhdGljIGludCByemcybF9taXBpX2RzaV9kcGh5X2luaXQoc3RydWN0
IHJ6ZzJsX21pcGlfZHNpICpkc2ksDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAJdTMyIGRwaHl0aW0x
Ow0KPiA+ID4gPiA+ID4gPiA+ID4gPiAgCXUzMiBkcGh5dGltMjsNCj4gPiA+ID4gPiA+ID4gPiA+
ID4gIAl1MzIgZHBoeXRpbTM7DQo+ID4gPiA+ID4gPiA+ID4gPiA+IC0JaW50IHJldDsNCj4gPiA+
ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gIAkvKiBBbGwgRFNJIGdsb2JhbCBv
cGVyYXRpb24gdGltaW5ncyBhcmUgc2V0IHdpdGggcmVjb21tZW5kZWQgc2V0dGluZyAqLw0KPiA+
ID4gPiA+ID4gPiA+ID4gPiAgCWZvciAoaSA9IDA7IGkgPA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBB
UlJBWV9TSVpFKHJ6ZzJsX21pcGlfZHNpX2dsb2JhbF90aW1pbmdzKTsNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gKytpKSB7IEBADQo+ID4gPiA+ID4gPiA+ID4gPiA+IC01MjQsMTIgKzUyMyw2IEBAIHN0
YXRpYyBpbnQgcnpnMmxfbWlwaV9kc2lfZHBoeV9pbml0KHN0cnVjdCByemcybF9taXBpX2RzaSAq
ZHNpLA0KPiA+ID4gPiA+ID4gPiA+ID4gPiAgCXJ6ZzJsX21pcGlfZHNpX3BoeV93cml0ZShkc2ks
IERTSURQSFlUSU0yLCBkcGh5dGltMik7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAJcnpnMmxfbWlw
aV9kc2lfcGh5X3dyaXRlKGRzaSwgRFNJRFBIWVRJTTMsDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGRw
aHl0aW0zKTsNCj4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gLQlyZXQg
PSByZXNldF9jb250cm9sX2RlYXNzZXJ0KGRzaS0+cnN0Yyk7DQo+ID4gPiA+ID4gPiA+ID4gPiA+
IC0JaWYgKHJldCA8IDApDQo+ID4gPiA+ID4gPiA+ID4gPiA+IC0JCXJldHVybiByZXQ7DQo+ID4g
PiA+ID4gPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiA+ID4gPiA+ID4gLQlmc2xlZXAoMTAwMCk7DQo+
ID4gPiA+ID4gPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiA+ID4gPiA+ID4gIAlyZXR1cm4gMDsNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gIH0NCj4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
PiA+ID4gQEAgLTU0MSw4ICs1MzQsNiBAQCBzdGF0aWMgdm9pZA0KPiA+ID4gPiA+ID4gPiA+ID4g
PiByemcybF9taXBpX2RzaV9kcGh5X2V4aXQoc3RydWN0IHJ6ZzJsX21pcGlfZHNpICpkc2kpDQo+
ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAJZHBoeWN0cmwwICY9IH4o
RFNJRFBIWUNUUkwwX0VOX0xETzEyMDAgfCBEU0lEUEhZQ1RSTDBfRU5fQkdSKTsNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gIAlyemcybF9taXBpX2RzaV9waHlfd3JpdGUoZHNpLCBEU0lEUEhZQ1RSTDAs
DQo+ID4gPiA+ID4gPiA+ID4gPiA+IGRwaHljdHJsMCk7DQo+ID4gPiA+ID4gPiA+ID4gPiA+IC0N
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLQlyZXNldF9jb250cm9sX2Fzc2VydChkc2ktPnJzdGMpOw0K
PiA+ID4gPiA+ID4gPiA+ID4gPiAgfQ0KPiA+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiA+ID4gPiAgc3RhdGljIGludCByemcybF9kcGh5X2NvbmZfY2xrcyhzdHJ1Y3QgcnpnMmxfbWlw
aV9kc2kNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKmRzaSwgdW5zaWduZWQgbG9uZyBtb2RlX2ZyZXEs
IEBAIC0xMDMwLDI0ICsxMDIxLDM3IEBADQo+ID4gPiA+ID4gPiA+ID4gPiA+IHN0YXRpYyB2b2lk
IHJ6ZzJsX21pcGlfZHNpX2F0b21pY19wcmVfZW5hYmxlKHN0cnVjdA0KPiA+ID4gPiA+ID4gPiA+
ID4gZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiA+ID4gPiA+ID4gPiA+ID4gPiAgCWNvbm5lY3RvciA9
IGRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3JfZm9yX2VuY29kZXIoc3RhdGUsIGJyaWRnZS0+
ZW5jb2Rlcik7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAJY3J0YyA9IGRybV9hdG9taWNfZ2V0X25l
d19jb25uZWN0b3Jfc3RhdGUoc3RhdGUsIGNvbm5lY3RvciktPmNydGM7DQo+ID4gPiA+ID4gPiA+
ID4gPiA+ICAJbW9kZSA9ICZkcm1fYXRvbWljX2dldF9uZXdfY3J0Y19zdGF0ZShzdGF0ZSwNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gY3J0YyktPmFkanVzdGVkX21vZGU7DQo+ID4gPiA+ID4gPiA+ID4g
PiA+IC0NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIGlzIG5vdCBy
ZWxhdGVkIHRvIHlvdXIgY29tbWl0IG1lc3NhZ2UgKGNvZGluZyBzdHlsZSBjaGFuZ2UpLg0KPiA+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gQWNrLiBXaWxsIHJlc3RvcmUgaXQuDQo+ID4g
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiA+ID4gPiAgCXJldCA9IHJ6ZzJsX21pcGlfZHNpX3N0YXJ0dXAoZHNpLCBtb2RlKTsN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gIAlpZiAocmV0IDwgMCkNCj4gPiA+ID4gPiA+ID4gPiA+ID4g
IAkJcmV0dXJuOw0KPiA+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiAtCXJ6
ZzJsX21pcGlfZHNpX3NldF9kaXNwbGF5X3RpbWluZyhkc2ksIG1vZGUpOw0KPiA+ID4gPiA+ID4g
PiA+ID4gPiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoZHNpLT5yc3RjKTsNCj4gPiA+
ID4gPiA+ID4gPiA+ID4gKwlpZiAocmV0IDwgMCkNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKwkJcmV0
dXJuOw0KPiA+ID4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsJaWYgKGRz
aS0+cnN0YykNCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIHNlZW1z
IG5ldyBhbmQgbm90IGRvY3VtZW50ZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlPyBJcyB0aGlzIGEg
Zml4Pw0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gUlovVjJIIGRvZXMgbm90IG5l
ZWQgdGhpcyBhcyBpdCB1c2VzIGRpZmZlcmVudCBJUC4NCj4gPiA+ID4gPiA+ID4gPiBQcmV2aW91
c2x5DQo+ID4gPiA+ID4gPiA+ID4gZnNsZWVwKCkgaXMgaW4gUlovRzJMIHNwZWNpZmljIGZ1bmN0
aW9uLiBJIHdpbGwgdXBkYXRlIGNvbW1pdCBkZXNjcmlwdGlvbiBmb3IgdGhpcw0KPiBjaGFuZ2Uu
DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFN1Z2dlc3Rpb246IG1heWJlIG1vdmUgdGhp
cyB0byBhIHNlcGFyYXRlIHBhdGNoLCB0byBmYWNpbGl0YXRlIHJldmlldy91bmRlcnN0YW5kaW5n
Li4uDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhlIG9ubHkgd2F5IGlzIHRvIGludHJvZHVj
ZSBhIG5ldyBjYWxsYmFjayB0byBoYW5kbGUgaXQgZm9yIFJaL0cyTCBTb0MuDQo+ID4gPiA+ID4g
PiBUaGVuIHdlIHdvbid0IGJlIGFibGUgdG8gYXBwbHkgZml4ZXMgdGFnIGFzIGl0IGlzIG5vdCBm
aXhpbmcgYW55dGhpbmcuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJIGFtIG5vdCBzdXJlIHdoYXQg
eW91IG1lYW4gYnkgdGhhdCBjYWxsYmFjaz8gSG93IGEgY2FsbGJhY2sgaXMNCj4gPiA+ID4gPiBu
ZWVkZWQgb25seSBpZiB5b3Ugc3BsaXQgdGhlDQo+ID4gPiBwYXRjaD8NCj4gPiA+ID4NCj4gPiA+
ID4gWW91IGNhbm5vdCBzcGxpdCB0aGUgcGF0Y2guDQo+ID4gPiA+DQo+ID4gPiA+IEJlZm9yZToN
Cj4gPiA+ID4gICBhdG9taWNfcHJlX2VuYWJsZSgpOg0KPiA+ID4gPiAgICAgc3RhcnR1cCgpDQo+
ID4gPiA+ICAgICAgIGRwaHlfaW5pdCgpDQo+ID4gPiA+ICAgICAgICAgd3JpdGUgRFNJRFBIWVRJ
TXggICAgICAgICAoRikgUEhZIHRpbWluZyByZWdzDQo+ID4gPiA+ICAgICAgICAgcmVzZXRfY29u
dHJvbF9kZWFzc2VydCgpICAoRykgZGVhc3NlcnQgQ01OX1JTVEINCj4gPiA+ID4gICAgICAgICB1
ZGVsYXkoMSkgICAgICAgICAgICAgICAgIChIKQ0KPiA+ID4gPiAJICBzZXR0aW5nIGJlbG93IGxp
bmsgcmVnaXN0ZXJzDQo+ID4gPiA+ICAgICAgICAg4oiSIFRYU0VUUg0KPiA+ID4gPiAJICDiiJIg
VUxQU1NFVFINCj4gPiA+ID4gICAgICAgICDiiJIgRFNJU0VUUg0KPiA+ID4gPiAgICAgICAgIOKI
kiBDTFNUUFRTRVRSDQo+ID4gPiA+ICAgICAgICAg4oiSIExQVFJOU1RTRVRSDQo+ID4gPiA+DQo+
ID4gPiA+IEN1cnJlbnQgcGF0Y2g6DQo+ID4gPiA+DQo+ID4gPiA+IGF0b21pY19wcmVfZW5hYmxl
KCk6DQo+ID4gPiA+ICAgICBzdGFydHVwKCkNCj4gPiA+ID4gICAgICAgZHBoeV9pbml0KCkNCj4g
PiA+ID4gICAgICAgICB3cml0ZSBEU0lEUEhZVElNeCAgICAgICAgIChGKSBQSFkgdGltaW5nIHJl
Z3MNCj4gPiA+ID4gCXNldHRpbmcgYmVsb3cgbGluayByZWdpc3RlcnMNCj4gPiA+ID4gICAgICAg
ICDiiJIgVFhTRVRSDQo+ID4gPiA+IAkgIOKIkiBVTFBTU0VUUg0KPiA+ID4gPiAgICAgICAgIOKI
kiBEU0lTRVRSDQo+ID4gPiA+ICAgICAgICAg4oiSIENMU1RQVFNFVFINCj4gPiA+ID4gICAgICAg
ICDiiJIgTFBUUk5TVFNFVFINCj4gPiA+ID4NCj4gPiA+ID4gICAgICAgcmVzZXRfY29udHJvbF9k
ZWFzc2VydCgpICAoRykgZGVhc3NlcnQgQ01OX1JTVEINCj4gPiA+ID4gICAgICAgZnNsZWVwKDEw
MDApICAgICAgICAgICAgICAoSCkNCj4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEluIHRo
aXMgb3JpZ2luYWwgcGF0Y2ggeW91IHRlc3QgZm9yIHRoZSB2YWxpZGl0eSBvZiBkc2ktPnJzdGMg
dG8NCj4gPiA+ID4gPiBkZXRlcm1pbmUgaWYgeW91IGFwcGx5IHRoZSBkZWxheSBvciBub3QuIFNv
IGluIHRoZSBjYXNlIG9mIFJaL1YySCwgSSB1bmRlcnN0YW5kIHRoYXQgaXQgaXMNCj4gTlVMTD8N
Cj4gPiA+ID4NCj4gPiA+ID4gWWVzLCB0aGF0IGlzIGNvcnJlY3QuDQo+ID4gPiA+DQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+IEN1cnJlbnRseSB0aGlzIGlzIG9wdGlvbmFsIHJlc2V0LCBhbmQgaXQg
aXMgbm8tb3AgZm9yIFJaL1YySC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IERvZXMgdGhpcyBtZWFu
cyB0aGF0IHRoZSBjYWxsIHRvIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoZHNpLT5yc3RjKSBzaG91
bGQgbm90IG9jY3VyIGZvcg0KPiBSWi9WMkg/DQo+ID4gPiA+DQo+ID4gPiA+IHJlc2V0X2NvbnRy
b2xfZGVhc3NlcnQoZHNpLT5yc3RjKSB3aWxsIHJldHVybiBpbW1lZGlhdGVseSBhcyBpdCBpcyBu
dWxsLg0KPiA+ID4gPg0KPiA+ID4gPiBvcg0KPiA+ID4gPg0KPiA+ID4gPiBXZSBjb3VsZCBhZGQg
dGhpcyBjaGVjayBpbnN0ZWFkDQo+ID4gPiA+DQo+ID4gPiA+IAlpZiAoZHNpLT5yc3RjKSB7DQo+
ID4gPiA+IAkgICAgcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChkc2ktPnJzdGMpOw0KPiA+
ID4gPiAJICAgIGlmIChyZXQgPCAwKQ0KPiA+ID4gPiAJCXJldHVybjsNCj4gPiA+ID4NCj4gPiA+
ID4gCSAgICBmc2xlZXAoMTAwMCk7DQo+ID4gPiA+IAl9DQo+ID4gPg0KPiA+ID4gWWVzLCBsaWtl
IFRvbW1hc28gc3VnZ2VzdGVkLg0KPiA+ID4NCj4gPiA+IEJ1dCBJIGRvbid0IHNlZSB3aHkgeW91
IGNhbm5vdCBzaW1wbHkgaW1wbGVtZW50IChzcGxpdCkgdGhpcyBjaGFuZ2UNCj4gPiA+IGFzIGEg
c2VwYXJhdGUgY29tbWl0IGp1c3QgYWZ0ZXIgY29tbWl0ICMxLCBvciBhZnRlciBjb21taXQgIzI/
DQo+ID4gPg0KPiA+ID4gVGhpcyBzZWVtcyBsaWtlIGFuIG9wdGltaXphdGlvbiBmb3IgUlovVjJI
LCBzbyBJIHRoaW5rIGl0IGRvZXNudA0KPiA+ID4gcmVhbGx5IG1hdHRlciBpZiBpdCBkb2VzIG5v
dCBnbyB0byBzdGFibGUgYnJhbmNoZXM/DQo+ID4NCj4gPiBQcmV2aW91c2x5IFJaL1YySCBkbyBu
b3QgY2FsbCByZXNldF9jb250cm9sX2RlYXNzZXJ0KGRzaS0+cnN0YykgYXMgaXQNCj4gPiBpcyBj
YWxsZWQgZnJvbSBTb0Mtc3BlY2lmaWMgZnVuY3Rpb24uDQo+IA0KPiBPaywgc28gdGhpcyBjaGFu
Z2UgY291bGQgYmUgc3BsaXQsIGlmIHlvdSB3YW50LCBhcyBjb21taXQgIzMuIFRoaXMgd291bGQg
bWFrZSBjb21taXQgIzIgZWFzaWVyIHRvDQo+IHVuZGVyc3RhbmQgSU1ITy4NCg0KDQphdG9taWNf
cHJlX2VuYWJsZSgpOg0KCXN0YXJ0dXAoKQ0KCQlkcGh5X2luaXQoKSAtPiBTb0Mgc3BlY2lmaWMN
CgkJd3JpdGUgRFNJRFBIWVRJTXggICAgICAgICAoRikgUEhZIHRpbWluZyByZWdzDQoNClRoZSBi
ZWxvdyBjYWxscyBhcmUgaW4gY29tbW9uIHBhdGguIFNvLCBubyB3YXkgeW91IGNhbiBzcGxpdC4N
CglzZXR0aW5nIGJlbG93IGxpbmsgcmVnaXN0ZXJzDQoJCSAgIOKIkiBUWFNFVFINCgkJICAg4oiS
IFVMUFNTRVRSDQoJCSAgIOKIkiBEU0lTRVRSDQoJCSAgIOKIkiBDTFNUUFRTRVRSDQoJCSAgIOKI
kiBMUFRSTlNUU0VUUg0KCXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoKSAgKEcpIGRlYXNzZXJ0IENN
Tl9SU1RCDQoJZnNsZWVwKDEwMDApICAgICAgICAgICAgICAoSCkNCg0KUGF0Y2gjMSAxdXNlYyB0
byAxIG1zZWMNClBhdGNoIzIgTW92ZSByemcybF9taXBpX2RzaV9zZXRfZGlzcGxheV90aW1pbmco
KSB0byByemcybF9taXBpX2RzaV9hdG9taWNfZW5hYmxlKCkNCiAgICAgICAgYWZ0ZXIgc3RhcnRp
bmcgaHMgY2xvY2suICAgICANClBhdGNoIzMgTW92ZSByZXNldCBhc3NlcnQvZGVhc3NlcnQgZnJv
bSByemcybF9taXBpX2RzaV9kcGh5X3tpbml0LCBleGl0fSB0byANCiAgICAgICAgcnpnMmxfbWlw
aV9kc2lfYXRvbWljX3ByZV9lbmFibGUgYW5kIHJ6ZzJsX21pcGlfZHNpX2F0b21pY19wb3N0X2Rp
c2FibGUsDQogICAgICAgIHdpdGggYSBndWFyZCBmb3IgUlovVjJIIGJ5IGNoZWNraW5nIChkc2kt
PnJzdGMpLCBhcyBpdCBpcyBpbiB0aGUgY29tbW9uIHBhdGguDQoJICBMaWtlIHByZXZpb3VzIGNh
c2UgYXNzZXJ0L2RlYXNzZXJ0IHdvbid0IGJlIGNhbGxlZC4NCg0KQXJlIHlvdSBPSz8gICAgIA0K
DQpDaGVlcnMsDQpCaWp1DQoNCg0KDQo=

