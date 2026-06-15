Return-Path: <linux-renesas-soc+bounces-33999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o2NmDGTSL2odHgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:22:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9739685521
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:22:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=qciiybwe;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 675573008D54
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 10:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDA833A71A;
	Mon, 15 Jun 2026 10:22:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55CD3DB635;
	Mon, 15 Jun 2026 10:22:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781518945; cv=fail; b=maAKAjFlJmBK92eQmKooZa/CVse4ADqh0VNsEeC15k/sfsQvVMnjjP9pt/L1w2k6NElIwnotHisweb6BQ1F70fAsl7oumX1U9p4nWj5ZtCi2i83U9W3b6f1/wt0gRkrMUEzGCrBxszK+s3yqb4rk4YNVLrfjINrwT9bXU+EgkaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781518945; c=relaxed/simple;
	bh=xc1WHRwXE8nDG3P5YX55Cmr7t9sIgtwS2vcpA60bM78=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n5WId/Lj/UFAb29ycCkqXI4+9ks9SenQvr4g6SbjJUj8pfpJa1reDTp8T7KDCU85KgI3vq0r2t+XlOQTl/Hn3Wf6qQIdAniske64mT718WdE+a7V2dsVxwX55UwDZuP7Gg2v8DU9k19YApI7HE0gqPVeKAteliM2Og8GTeh1bA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qciiybwe; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLTWaCZYVAfkFyA9W0PtkwXuw7Yh3m7YUsInbWBAfE4JaT2z2JlDzmBeEt1IQOm7FcZwDuavTtfPzEB5sxtVdWRFUt75uk7iyuVYKdKfsDhdKsgPj4EuZ+ixRz9ifknSeCQzUxPt8YUUOTevNni89Ays0FnjtoS2jZaqH2/rBvs5m0X6oDE7OuvXqbltGvMeh3Gp3yxFvzoqU5dmvheQ9vgSWuPvANKcRaq2B0jJqxfOrtEj57/e7oiAGYeXuj0hBZtyAG7AvWOmQ619vytyqR/+RSafK3mUKsEx7TYfyGX97hLZECpqahzJLn0pDV9LUpcMUt80pSRfNbt7fUdOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xc1WHRwXE8nDG3P5YX55Cmr7t9sIgtwS2vcpA60bM78=;
 b=EwwxTQzb5chA2OeyyPF76wuZtVvMecytJdFAPfc9bpxp9AfnBWlsxM8Ez1+Grj0iSKdIbSh0srXzXz4QcYVpS3XA8X20PB9fWnU90GJzf6Lf/w0yUiRYKMyA+qNjLAKcPM5iVpUwSNgnpwriQyZhsUYCz3a/iBiJ29ot/OJ7uXx7eXzBgUNzGwoQ7rD6UVa+Rj/+ibzjmSNJ7UjHf7TcaY3p0pt8cizCj3vsK358IJ95+Q9ns07A1KBwLa2x8EUfA8TuXWXpdVSTIVqZ79b8pTAhbzGQzAcXTOGeDcJec0vGqvhBiQJgwSLMOWATfdbICWKCEl1ToqFirBo+j5MTtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xc1WHRwXE8nDG3P5YX55Cmr7t9sIgtwS2vcpA60bM78=;
 b=qciiybwemOctxfuf2RH11Vn0+B4+qKx4DdBWOSgXcq5YCBgm215y0+gTtmTPWvuwt2JOXyANx+SwTu4Y+vLg34fLKbg1DN1HJ9an0AjEbxDCS1vp/x5RX/PbuEoMktDYsuMQzk/CtEZZCneLU57YjgWQA3KX/hcjFZcEJeRK69c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7036.jpnprd01.prod.outlook.com (2603:1096:604:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 10:22:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 10:22:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, biju.das.au
	<biju.das.au@gmail.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action
 registration for disabled VBUS regulator
Thread-Topic: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action
 registration for disabled VBUS regulator
Thread-Index: AQHc+ngaWA394/baeES91naIfR5habY/YB4AgAAHtfA=
Date: Mon, 15 Jun 2026 10:22:20 +0000
Message-ID:
 <TY3PR01MB113466284D6307E1967286AC486E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-10-biju.das.jz@bp.renesas.com>
 <2b794049-0c44-4390-a6cd-e5bde5c5f3ca@tuxon.dev>
In-Reply-To: <2b794049-0c44-4390-a6cd-e5bde5c5f3ca@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7036:EE_
x-ms-office365-filtering-correlation-id: 154a8e48-7832-4da4-09fe-08decac7fbf0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|56012099006|11063799006|4143699003|6133799003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 7jLMnFpZdBwZLTDoqsNwp/9s7tpVuL7qfaaHAWLOKmi5lM7WJoXS8oM1YPpzYDLnZOGEGtzsRDjIyYqMz/KhcDZ5OSlYtn9kgdFnubBvUMh4TYyQ+qkohnw9C+1aHihyQ943e8YLEXo9+fkVugXIy2QNTzQAd4b1wGQ/bYMWn9QRNrxXAsV1EqOo0fMsfNTgYh7nFcO4PqhaTvU0tDGiV/3o5cx4gddwoNSl37dOnnMoWZB8SSr2ulYobv6eNTRHbC7wsqDAK03w4YFDddfTCVQOFxG7+iCRnMZKkZu5+nprNY0fLymuJ/mtqpLYNsE8FwoR5K+s+rNtwSscfY7a3J35KjQIyKtBxVjN8h77cp+YBdax1zYK1ibiLRJRr1CU5+W6G8icX6xSQuRYT8hKElVPkjYj9+L64jlmQ+D5dSJwjSxO3HyxoUb89KkQ0ZwvT67sYDNI8Re7UeWnQfLGXMq9R7ZK/OVBidvFD//VaTiOcYXT1XuJY1+OGDnkg86CE8/1AJMvZSGLstNDU+Bj88QfMp0BIXFvT+hKMQEVt1peGaDhH6GrH5UJbVSz2O/vNO94za0Sx7dS54K1/P65Xms3q2ruUF/qmZ/guX3bolyc27SksHrVOlZ76RadDm862e6PGDdhGJHuU30LJ6LbAId7RoC7puxW9U1f6pItyne3WK/HrswUtHn3xhHTRAKVv8W5H+InNq5Qga8Tq8FJnLRIM5utekTTY1+KRZM48TgN2v8n8U5/ytRxltjyTqbz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(6133799003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STRVZC9OK1A3VGsxbk8rM05hUUJDbnBTR3ViMEl0QmRVU1ZqOEx1c0RUZFht?=
 =?utf-8?B?U1diSDgvYjk4eEh1clV4UDlscnh3VHRtdGJJR1lwOWFvNG9MeU1laG1BRHZS?=
 =?utf-8?B?SnZ4WW1yWFhwT1NlZStoV2pkKzhzNXMvTytDR2VTdDlLK3NubzJCRzRHeFlE?=
 =?utf-8?B?dGhrTGE1Y1R3ZXhmUWNZenVSR0ZYZW9PemFqL05SNis4cFVMRExHWms4bGtT?=
 =?utf-8?B?SzBOR1dkeURqRmJqRGo1UVhJenVCcXQ4Z1Q2QzdqdGMyZFlJbWVoa0JvT2NK?=
 =?utf-8?B?c3hHcUdRd1FXTGRmMDdOV3lSdkhPb1pnczJtb3ZtS2xocnMyNEdXdFNNbS9r?=
 =?utf-8?B?TVprbFdLSDJwSHhPYTIrYThNVXBMU2ttNjlmR1BvU0pRY294WUVjSC82cFRi?=
 =?utf-8?B?bVk0Vng0OWdiQ2JqbGVTTndLdHRGWkQ5b0RMb3VWa0NjREJkSmZnZ3BZa2Nx?=
 =?utf-8?B?eGlMNkNWNTNmTEVDL3RqTjlGT3kyL0V1TkRVN3llYnI5U2JXNDNRT0hQUlVq?=
 =?utf-8?B?SGZobTQvcHB1cGJ2d0tBNVhxV3JqNER5c2tSb3AzazB6NXpIRE5XRDM4VkVO?=
 =?utf-8?B?K2tmamJUWlZxa3BCd1lmNjdERzZHYUY5d05aQVh4dHMzNWNKQzgyMnRiZExQ?=
 =?utf-8?B?RlFqbFdUbk10eURTaGNBSlFCQmxSQm03WGtZUDc3UmVYa3prUURib1pORW1B?=
 =?utf-8?B?WVBqZnREQjNQaUVVckdHbHZVdG50akRVZUVzTjFscmN5SXlNY1NaK0hKaXR5?=
 =?utf-8?B?L2FzNEROZHozdnBwdmFJYWF2SGtPdU9PMGhRd0xZUHBnaUt0dFVFaENESlhW?=
 =?utf-8?B?MDlhM0ZScVdidXA1RnYrNUNZWjVPNmpTQnk5YjlncGVMR250V0hCWVd3WE95?=
 =?utf-8?B?ZHFlVTlHZVZLcHlaVnlCVnREaktuaTRvQklXbEdzOXYzejNnQStrVlAzd0tn?=
 =?utf-8?B?S3VoWEVjR1dBbks1RVlDVGtyMmZ6cHN1TkYvZXJQY2krY0taSTlRQUFScDJF?=
 =?utf-8?B?dGt4b2JPYUl6dmsvTDRjbk5QWTczVmhhVlVVNlhxWGkvVG03UytoWEUwb2VC?=
 =?utf-8?B?bkFYNm95MTZzbjdDSGhtSEJpaFBMOFh6UUZLUFhhTHVhZ0p1NWF3ai9MaTFs?=
 =?utf-8?B?VURwd0N6aTQ5WFJGTnU2dGc2Ri9IZjVOUWdBaHVaS0xaMThFMCtlSFFYUWFl?=
 =?utf-8?B?SUZ6YzM3YVpQT0tPVGFTaWpZZnFEalYzNC9UK3VhcEJMczlDcWtUcVRPa2dD?=
 =?utf-8?B?NjVaL0JCdU9uTmFGOW5BUFBJVS9vZ0RhaWQxMkVidXJ0R1ArY3JSS0tlQ01P?=
 =?utf-8?B?SjRwQmVvM0VSS2lkM2lwTkdyQ0lSUU1JZ3EybU1BWXhCVTBxUFNhOXJmano4?=
 =?utf-8?B?ZDM4dUx6djR3ZnJacUpYcjNnaDVKSktML0l5Q0gyeitNR1FhUjhXQTFneWI2?=
 =?utf-8?B?UXhhd3hCNlpKdkVwb0VSVGtQOFA5U3ozeVpaNFgxYjdHL01JbkhrdzlkQk5V?=
 =?utf-8?B?VlV3VGxTakZPYWsramVONGJacit4aVZRQTBBYlFFK0NzRUZVc2RUc25wcDFj?=
 =?utf-8?B?RzR6SXhpVkUxdGRjTlQ0Tzl6d1VjTTdtdyt4SkhGNE5ONGZ5ajVBZHJTNmVC?=
 =?utf-8?B?cTZHRmVobkFsbEVtZjRFRHhPczFUZ1VmWXZsTHBrNEdDV2pZK3RZZ0hmU3Mr?=
 =?utf-8?B?bnpQaGl3cGEzNi95dzJwdzN6STVRZWpBa2ViMG81ME41Y0lFcUkwTTl5ZXBO?=
 =?utf-8?B?US8zYXhYVlEzUVdyWXlHbXJoM1FibHlhL1JVYjlSZGZCQ3lKSU9tQ0ZnYkEr?=
 =?utf-8?B?bGh1U1o2V2FvVTd6dGhvSnFHaFlRUXU0V2phbUhicXB0L2dOOERHNE5XeG1a?=
 =?utf-8?B?YVBzWlVLYm9seVZBRTBQQjVBY2hSN2lNK1ZOcnc0ZURHUkRkMTFvZVhhUE0y?=
 =?utf-8?B?Q093TXdtOHkwV2JtTURITTNzWk9SRmV4c1JITUJuWGFWZkxzZnczeWZnVkJp?=
 =?utf-8?B?KzZSME81VDFDQ09CYXhvL3JYbnJkbVE2alpiMklZcnhLblpLT0NrNFFCR005?=
 =?utf-8?B?YUJpTFk1U3FQVU9BdTEzRndJQTk0ZGRuVGJQcEgvNVBQdWl3OUhMWnBXNyt5?=
 =?utf-8?B?dllqVi84aUtaS0JZdEZlc2pvNjh2bVhuTENTVG1zNWdPOXk5enp0UXJ1bERU?=
 =?utf-8?B?UldUSnY4aFByOEVDMUlkMDR6My9oRHhRVlZ6ejB0Y2pac1J2UFZsai8vK283?=
 =?utf-8?B?QlJxM3c4WUxFZWNvRDRGczNrRmErNnJIakIrSkVZS0g0QUwxMXhuS1dNclox?=
 =?utf-8?B?bEdnMWg3ZmpJeDU3WFhzOUJ5WDVBdWlPeTQvb2JUL0xidE8zaDdTUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 154a8e48-7832-4da4-09fe-08decac7fbf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 10:22:20.7096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHyvA0HkgDuBu+1kcZfvRoB9u8lHrgOm10LVjx8V+yN9OnYu0QWfQt3oxndcKvDGr4heaIOJWquFBxj7pjAEbeXu81jP6UJ7OpJMxoLI1vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7036
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33999-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:biju.das.au@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[tuxon.dev,gmail.com,renesas.com,kernel.org,glider.be];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:from_mime,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9739685521

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAxNSBKdW5lIDIw
MjYgMTA6MzcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwOS8xMV0gcGh5OiByZW5lc2FzOiBwaHkt
cmNhci1nZW4zLXVzYjI6IEZpeCBkZXZtIGFjdGlvbiByZWdpc3RyYXRpb24gZm9yIGRpc2FibGVk
DQo+IFZCVVMgcmVndWxhdG9yDQo+IA0KPiBIaSwgQmlqdSwNCj4gDQo+IE9uIDYvMTIvMjYgMTc6
MzAsIEJpanUgd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+DQo+ID4gZGV2bV9yZWd1bGF0b3JfZ2V0X2V4Y2x1c2l2ZSgpIGluaXRpYWxp
c2VzIHRoZSByZWd1bGF0b3Igd2l0aA0KPiA+IGVuYWJsZV9jb3VudCA9IDEsIHJlcXVpcmluZyB0
aGUgY29uc3VtZXIgdG8gZGlzYWJsZSBpdCBiZWZvcmUgcmVsZWFzZS4NCj4gPg0KPiA+IFByZXZp
b3VzbHksIHRoZSBkZXZtIGRpc2FibGUgYWN0aW9uIHdhcyBvbmx5IHJlZ2lzdGVyZWQgd2hlbiB0
aGUNCj4gPiByZWd1bGF0b3Igd2FzIGV4cGxpY2l0bHkgZW5hYmxlZCwgY2F1c2luZyB0aGUgY2xl
YW51cCBwYXRoIHRvIHNraXANCj4gPiBkZWNyZW1lbnRpbmcgZW5hYmxlX2NvdW50IG9uIGRldmlj
ZSByZW1vdmFsIHdoZW4gdGhlIHJlZ3VsYXRvciB3YXMNCj4gPiBsZWZ0IGRpc2FibGVkLg0KPiA+
DQo+ID4gRml4IHRoaXMgYnkgYWx3YXlzIHJlZ2lzdGVyaW5nIHRoZSBkZXZtIGRpc2FibGUgYWN0
aW9uIHdoZW4gdGhlDQo+ID4gcmVndWxhdG9yIGlzIGVuYWJsZWQgKGNoZWNrZWQgdmlhIHJlZ3Vs
YXRvcl9pc19lbmFibGVkKCkpLCBjb3ZlcmluZw0KPiA+IGJvdGggdGhlIGV4cGxpY2l0bHktZW5h
YmxlZCBjYXNlIGFuZCB0aGUgaW5pdGlhbCBzdGF0ZSBzZXQgYnkNCj4gPiBkZXZtX3JlZ3VsYXRv
cl9nZXRfZXhjbHVzaXZlKCkuDQo+ID4NCj4gPiBUaGlzIGZpeGVzIFdBUk5fT04gZW5hYmxlIGNv
dW50IGR1cmluZyByZWd1bGF0b3IgcmVsZWFzZS4NCj4gPg0KPiA+IEZpeGVzOiAyNDg0MzQwNGVm
ZTQgKCJwaHk6IHJlbmVzYXM6IHBoeS1yY2FyLWdlbjMtdXNiMjogQ29udHJvbCBWQlVTDQo+ID4g
Zm9yIFJaL0cyTCBTb0NzIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGUgYXBwcm9hY2ggaW4gdGhpcyBwYXRjaCBkb24n
dCBzb2x2ZSB0aGUgcHJvYmxlbSwgYXQgbGVhc3Qgb24gUlovRzNTLiBTZWUgWzFdIGZvciBsb2dz
Lg0KPiANCj4gSSBhcHBsaWVkIHRoaXMgcGF0Y2ggb24gbmV4dC0yMDI2MDYxMDoNCj4gDQo+IGdp
dCBsb2cgLS1vbmVsaW5lIC0yDQo+IGFmZTA5ZjExZDU0OSAoSEVBRCkgcGh5OiByZW5lc2FzOiBw
aHktcmNhci1nZW4zLXVzYjI6IEZpeCBkZXZtIGFjdGlvbiByZWdpc3RyYXRpb24gZm9yIGRpc2Fi
bGVkIFZCVVMNCj4gcmVndWxhdG9yDQo+IGFiZTY1MTgzN2NiMyAodGFnOiBuZXh0LTIwMjYwNjEw
LCBsaW51eC1uZXh0L21hc3RlcikgQWRkIGxpbnV4LW5leHQgc3BlY2lmaWMgZmlsZXMgZm9yIDIw
MjYwNjEwDQo+IA0KPiBbMV0NCj4gaHR0cHM6Ly9naXRodWIuY29tL2NsYXVkaXViZXpuZWEvbG9n
cy9ibG9iLzJmMWJhYjIwNDA3ZGZlNjAzMTM4NTgxOWZmZWFiZmM0ZWFjNzcyYmQvbG9ncw0KDQpJ
IGhhdmUgdGVzdGVkIG9ubHkgd2l0aCBSWi9HM0wgaG9zdCBhbmQgSSBkb24ndCBzZWUgdGhlIGlz
c3VlLg0KSG93IGNhbiB0aGUgaXNzdWUgYmUgcmVwcm9kdWNlZD8gSXQgY291bGQgYmUgcmVsYXRl
ZCB0byBSWi9HM1MuDQpJIGhhdmUgZXhlY3V0ZWQgdGhlIGZvbGxvd2luZyB0ZXN0cyBhbmQgZG9u
J3Qgc2VlIGFueSBpc3N1ZS4NCkNhbiB5b3UgcGxlYXNlIHRyeSB0aGUgc2FtZSB0ZXN0cyBvbiBS
Wi9HM1M/DQpJcyB1bmJpbmQvYmluZCBldmVyIHdvcmtlZCBvbiBSWj9HM1MgcHJldmlvdXNseT8N
Cg0KDQpUZXN0MTogSG9zdCB1bmJpbmQvYmluZDoNCmNkIC9zeXMvYnVzL3BsYXRmb3JtL2RyaXZl
cnMvb2hjaS1wbGF0Zm9ybS8NCmVjaG8gMTFlMTAwMDAudXNiID4gdW5iaW5kDQplY2hvIDExZTkw
MDAwLnVzYiA+IHVuYmluZA0KDQpjZCAvc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL2VoY2ktcGxh
dGZvcm0vDQplY2hvIDExZTEwMTAwLnVzYiA+IHVuYmluZA0KZWNobyAxMWU5MDEwMC51c2IgPiB1
bmJpbmQNCg0KY2QgL3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy9vaGNpLXBsYXRmb3JtLw0KZWNo
byAxMWUxMDAwMC51c2IgPiBiaW5kDQplY2hvIDExZTkwMDAwLnVzYiA+IGJpbmQNCg0KY2QgL3N5
cy9idXMvcGxhdGZvcm0vZHJpdmVycy9laGNpLXBsYXRmb3JtLw0KZWNobyAxMWUxMDEwMC51c2Ig
PiBiaW5kDQplY2hvIDExZTkwMTAwLnVzYiA+IGJpbmQNCg0KVGVzdCAyIEZ1bmN0aW9uIHVuYmlu
ZC9iaW5kOg0KY2QgL3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy9yZW5lc2FzX3VzYmhzIA0KZWNo
byAxMWUzMDAwMC51c2IgPiB1bmJpbmQNCmNkIC9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvcmVu
ZXNhc191c2JocyANCmVjaG8gMTFlMzAwMDAudXNiID4gYmluZA0KDQpUZXN0IDM6IFBIWSB1bmJp
bmQvYmluZA0KY2QgL3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy9waHlfcmNhcl9nZW4zX3VzYjIN
CmVjaG8gMTFlMTAyMDAudXNiLXBoeSA+IHVuYmluZA0KZWNobyAxMWU5MDIwMC51c2ItcGh5ID4g
dW5iaW5kDQoNCmNkIC9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvcGh5X3JjYXJfZ2VuM191c2Iy
DQplY2hvIDExZTEwMjAwLnVzYi1waHkgPiBiaW5kDQplY2hvIDExZTkwMjAwLnVzYi1waHkgPiBi
aW5kDQoNClRlc3QgNDogUmVndWxhdG9yIHVuYmluZC9iaW5kDQpjZCAvc3lzL2J1cy9wbGF0Zm9y
bS9kcml2ZXJzL3BoeV9yY2FyX2dlbjNfdXNiMg0KZWNobyAxMWUxMDIwMC51c2ItcGh5ID4gdW5i
aW5kDQplY2hvIDExZTkwMjAwLnVzYi1waHkgPiB1bmJpbmQNCg0KY2QgL3N5cy9idXMvcGxhdGZv
cm0vZHJpdmVycy9yemczbC11c2ItdmJ1cy1yZWd1bGF0b3INCmVjaG8gcnpnM2wtdXNiLXZidXMt
cmVndWxhdG9yID4gdW5iaW5kDQoNCmNkIC9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvcnpnM2wt
dXNiLXZidXMtcmVndWxhdG9yDQplY2hvIHJ6ZzNsLXVzYi12YnVzLXJlZ3VsYXRvciA+IGJpbmQN
CmNkIC9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvcGh5X3JjYXJfZ2VuM191c2IyDQplY2hvIDEx
ZTEwMjAwLnVzYi1waHkgPiBiaW5kDQplY2hvIDExZTkwMjAwLnVzYi1waHkgPiBiaW5kDQoNClRl
c3QgNTogUmVzZXQgdW5iaW5kL2JpbmQNCg0KZWNobyAiIyMjI3VuYmluZCMjIyMjIyMjIg0KY2Qg
L3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy9yemcybF91c2JwaHlfY3RybA0KZWNobyAxMWUwMDAw
MC51c2JwaHktY3RybCA+IHVuYmluZA0KDQplY2hvICIjIyMjYmluZCMjIyMjIyMjIg0KY2QgL3N5
cy9idXMvcGxhdGZvcm0vZHJpdmVycy9yemcybF91c2JwaHlfY3RybA0KZWNobyAxMWUwMDAwMC51
c2JwaHktY3RybCA+IGJpbmQNCg0KDQoNCkNoZWVycywNCkJpanUNCg0K

