Return-Path: <linux-renesas-soc+bounces-34009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6a84MQvlL2qfIgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:42:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1860C685C6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:42:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=AE2dAJDO;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9765301C89A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509A43E3C7B;
	Mon, 15 Jun 2026 11:41:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A1D3AFB0B;
	Mon, 15 Jun 2026 11:41:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781523708; cv=fail; b=BAhxXdT/7ORXQLaJMZ5gR/c4fxhuGrw6a82QX6fJkGajUW1MJzvNyvwKYWcj1vzFwvo650+wQkhhCTXbTxb6B3qBzcTbJRjF1ilQXOgklBWHUE28T0rnk0xHSd0DpG/wom6T2UQrRgbmji6HzRqQbfUy5wFXfMWAxAyMV1jR1E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781523708; c=relaxed/simple;
	bh=rYntbbQk7LlFQqSyApVxiMuBAtuIQiZaKDFvId2fIIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jMMe3672x4CsD9cuVvtFBCrkQIwLI3Ib2a6J8Hx1mpQNoYM71MsAllB3oZcynJZAhkmdHa1+Knktiu3Px4manxRdL+S4qQfLwyvHTGcLytW+1caEiJWC7dOEA71GFlP3M1h5qccoz7dSr7t66jI1FIgoIYSwuuXPbq8Hhmgol4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AE2dAJDO; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9mGkk0OgSOO3VtPH8cnmkrlTIRPnBvoiKZLCh/3OMyGkTcM85FrNaF+L8efSiOcDVwd6LuEylcC3aIdN9Vab/Lu1TOpcd+393DgTUPjM6A+yygpnrP6Dn4aw7ide18XG+ux5MPWpB7mJ9mfNWNfRYK73euTPciEJlxA6LIQqFxSpKgoLFApTjxXfHX9XlT8RIa4Vek1F5OM1NSK/4R6KyY/QRgtZdekpy2rAjf+3nLhIL7wdvz0Mp38peQ5H0sRkgMxqSODFLpJwd0uct5TF02wZDS+m/9ofUSGOctDb5C+0vJRsdWiFnsAVRbeGWKvzGwm+bjMSsRVkaJMavwZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYntbbQk7LlFQqSyApVxiMuBAtuIQiZaKDFvId2fIIQ=;
 b=nz6kjws/4IX4BcSbhXwagFltEKbfXZMSLBkV2Kn9mC8aNmcNBcSQ7ImFGQMlhp/Ze2vjtjiS+2sUwbqbvAjXADaN7YojHhUTtpjRddUG2rQGeyR0GlgNvP9I+AzvoRzFgpsUPlL5UF6gLjhcmSeIw5K69MlXWhwRyt2RoNHYH6atPs09az1LXa76zLTK4rzkT8+K83gpwC10pSYteezx/gEL7Ic2lzoImjVR6/jNIvUlEryz2lWiHQ5EtFWybTx3bA5E5mfuDS8Uy3YwVlZW7BmI/bPt6O7V/mnbu3ONqntsjnZXuQFezZJTG4oFKvFaZtd/W+XIpR87ROxDy5kT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYntbbQk7LlFQqSyApVxiMuBAtuIQiZaKDFvId2fIIQ=;
 b=AE2dAJDOIm8qF4np/DUzO1nDcKmi5PzTtOrj/6iA2hSw6nbPKL4ZYXk1i0Dr//70VnlXiG0RZxT1uZ4lr5zkVwFKGTDX2iYBUdcSAcrX+BM9OCqFGZvH2bDhaSkloCvKrjMn1bOvAaM/WMMGqwgEzy2fOGAt+C+HlaovPBhLPp4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY6PR01MB17860.jpnprd01.prod.outlook.com (2603:1096:405:346::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 11:41:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 11:41:41 +0000
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
Thread-Index: AQHc+ngaWA394/baeES91naIfR5habY/YB4AgAAHtfCAAAiJIA==
Date: Mon, 15 Jun 2026 11:41:40 +0000
Message-ID:
 <TY3PR01MB11346698F20EA409B2481D51486E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-10-biju.das.jz@bp.renesas.com>
 <2b794049-0c44-4390-a6cd-e5bde5c5f3ca@tuxon.dev>
 <TY3PR01MB113466284D6307E1967286AC486E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113466284D6307E1967286AC486E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY6PR01MB17860:EE_
x-ms-office365-filtering-correlation-id: b0dd5db4-3aef-4516-d0ca-08decad3114d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 1gHKH0eNBHpW056lHxe20Sxhx2iauvwTbtTAR+mKRTPXrUxrndNX00RxYHWx0uWr+f3ViLPL7kY8OGGK46wRhsj9jkTZGFVlwuIzXfAgtVd3RRQGDxCQ5HfQ+hYleSqrpyBv4fTxDc+54O2dW0sOU+wtSeBIx4HhMk6rd4Mwfnl9oCcML/z9jqPV2jrVWnIfWKbEA53dz5JWj5vBDw5tkXZOtseYlOMsIKqyLE8SO4x2TRMifccvt3r0NjyHsnVd70lws0cSwzU1hyibfvox9h3GaefwFqv1H1gZ819c3nscPzgw5Mp2z691HOM9x54wKFTzLsKs00pTsMkj6e6KCB0RF0D3LakcecH5w9t7qg2qYchW05ZxseSVNSdDx1RBmT3zMYtVesd9X506vgszOPBymn5jOJYGlzboXjQHNh9BPzDZhlS/BBK1qufAHo6i4U/uEEhYGzVo6ezhU+GMSSxJCxeuhog1ESP6nEiY3r6wo9L4azxl2bvz9hFDn+eOiXXkSl7k1elFBRwUqLB0c7KB2GS606f6xgrccsrMgGf7ITgjWVtQo1BE3XeRKEoXSqpkMgAVzwY3BIFBbELcJf0AyffX0xJMP0MfTn7PUfpv/h+xtWmmIcVS1lHlhrsRE9goQN8S84haNAr4CBtDSosYO/iJYDIiGr/I4KTsBSZk5sMYX5ETULtm6cuPfk876euOe7D8ESF0d9vJDqv0dzSCeR6kx+OT0xTitryjhKW6Mi0CdwJ7PgKU2xd08Zbw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlE3bUFQRk9FT3RPTXMydWNTcGtMTjQ0dlJlT0tIV0twK0xvN2pxdCtXUDNO?=
 =?utf-8?B?dXFJbEs1c1N5SEU4dEllZTdFM3lrSTdYT1RwYm5IMTdhaHp2ZndPL2tvL2k5?=
 =?utf-8?B?VjEyZjlXOFpnOER3YVFmaWhrdklXU1dkVCt4QXZZVTd2VWJ4bml2d1g3MFNo?=
 =?utf-8?B?ci9EMFh2RFZHMGdEekdUMTJESUZTZ28yaUNkOVN1OXZnd1YvTXRyaXZlVTM0?=
 =?utf-8?B?VnRxRG1iSXdhTVkvMmFLTHdIR1RjdnM1MldHR0Y2TXJiS3NHcTNrUUtFNDBq?=
 =?utf-8?B?RzJGOWc0UWZibHRMVDZuNm5CRUFTWHg4d1FDbWlPeTVwQWp0bUZnTFJpaERr?=
 =?utf-8?B?bmxVVFdQMDJwbE1PZ2F4bkd1Yld1ekxMbG0wc3g0U2ZHdlZzU3lNQldpY3h4?=
 =?utf-8?B?eUJYZzZhejY3V0JheGhIeFVGcEpJTHZ0MG4vWUozcDVReXUzWVNZbDlqTllj?=
 =?utf-8?B?K1d5WDBuMFhQKzZDZTNFU1lQL1J1SUVEVTZyUkVrcFBsYnhYejhtUXdPaklv?=
 =?utf-8?B?SEFyZ0dUR2syNUdPODZYOXh4eGdoMzdDVUR1cGxEK1o5by9qcXJ4RlFXZVNp?=
 =?utf-8?B?c1p6bEVqT2oycFdTakdwT1IvV20rbDB1TnFrbnBMcm1rVHlpSU5pKzNxeXVp?=
 =?utf-8?B?bmZucXNMODFaczlOSFc5YmhWZjZiTzRDZXBadUllVEtyMzRzZzJOQklSR2hh?=
 =?utf-8?B?eW1EblR2a3FQKzZ0NnU0ZnhBcGFhSFBKSHV0MXBiU1dZK1FIRlFNV01RalJ4?=
 =?utf-8?B?Zi9JRHhFTklWVmZHNlV5M0FwbkpFUm9hNEFlbVY1dGR3dGVERkpFQWRDQWhr?=
 =?utf-8?B?enBFbHV3a0FiMDNwWjdCbXJyNXhqSGZJYVNRaTZnQm9yVVdidFREM1IrZXAr?=
 =?utf-8?B?TnROT2x6cS9UZjlrd3krNkh1akYzT2x1cFZBOE44R3ZuRm5rZkJWYmFmY1d5?=
 =?utf-8?B?MTJkajZWeWRjeXZEYTlFRVpraCtSdm5HY2R4RkFKb0lrSXE0UnRCK1NYM0pE?=
 =?utf-8?B?YU5ndEZQdDRqY2FwVkNLRVg5TGF3bUVwWkkxMW9uS0lTUmZCbDBQcW8yOXZX?=
 =?utf-8?B?aE1RN1ExbzZJdnYxaGFjUFNaU2FZOGlhNGJ6cjQzSlk5MUg1TFFER296ci9w?=
 =?utf-8?B?VVF4TVhYekRNVDJRS05XSkxublQ4dU1TOXExVVMzWEpQU3lXZDBBQzk1NlRI?=
 =?utf-8?B?dC80aWZWL2JYRnM3Qjl6cmtYUWJhSGZpT1BKZnZMcEJ0bXFad1ZwTFZwY2V3?=
 =?utf-8?B?VDAwaXdaUUhZM1FQcWFBSWQ5Tkc2QWlaalpGZW14V21oQVhGOSt1SFN0cDBL?=
 =?utf-8?B?bGFWTE5memVzVXQ3Zk90SDIwMXFWS1YwdVV3eWtzeGVwY1dhOUZkSUFmVXI3?=
 =?utf-8?B?cTNHS2F4S2JxNnNsZ1ZldGtBd3VBamZYZ1ZMVHlEazNBRWpJUG5qdkRUODR2?=
 =?utf-8?B?UXc4aGNmQ0VVWHFGVHZGd0RLR1Zrd2FkbWQzdFlvTG9QVjFWcnkxR05DMytv?=
 =?utf-8?B?aXhTWjI2elYrM1ZYelhZTFV5SitvQzIySlpPdm9ZNzBMSWhpakR0aXNrZHQr?=
 =?utf-8?B?dzN0MWdKVjdsb08rbi96QVFQTy8xTDJVajJPZ1pRY2JqOEh3QmFqSGpxMy9o?=
 =?utf-8?B?U3EwTFl4SjdpeEF3TEFpWlJOUzVvRVI4eWg1R1c1VjZOTlBqQzZIYmRueERM?=
 =?utf-8?B?TWF1Umw5cjhJOTloS2g5MXhabHI2S29hREc1UTFxN2t0eTQvUmtGOFRWSXE0?=
 =?utf-8?B?MVAvdDVDN0JCejlVK21Pajhmc3lZbmJaQ3RJWXJTNEpkd0xqMkFKUkxyLzNG?=
 =?utf-8?B?NkxtakdHTjBQUVhUclJFS1BFdHBKdkx6WE1XVXNhekoxZ2JnQXB0ZTdUd0Nj?=
 =?utf-8?B?MTRFVEtybkxYRy9Dcy9UdHAxVDJuUW5QRm53MSs0NDdBRUNTNko2b3RGbG1Y?=
 =?utf-8?B?L0gxaEdGdGlCaU4waDgvQ3VDYTNDSFd2bWFsYk12ZWdzQW1rc21LakpUclJ1?=
 =?utf-8?B?dWwrSW1wV0NTZ1ZzbVJKZHhZVE5kWVR4MEhDZVVvTGNscVRZZkY0Qm0wSWNF?=
 =?utf-8?B?Y3dLaDM3VHlnZFd2MjBjV1MvS1J3MFFnU1ltMnZCVk1FMVRmeFhwbEVFOU1y?=
 =?utf-8?B?eUJjcjlFS1MyVEhZb3lrbTg0MDNPOEJHbXJPQnQwK0RWMjZZTVVrODl1ZkRr?=
 =?utf-8?B?VjBzaEtIbmZOOTI2aHdEZ1QwVFZFcTM2YVMwaFNMTzc3TVYwcjV4NjY1UnN4?=
 =?utf-8?B?Z0kvaHVTRWNxNEFHdUQ4SW40YjlydGt2dVJpRStEM1hSaXpuek1WVGZkL0Vj?=
 =?utf-8?B?V0lRZW1iN2ZtRXQ2VHpoaVJMeEtUTG5DUHlNcDlIcHREaExWM0RDQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b0dd5db4-3aef-4516-d0ca-08decad3114d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 11:41:41.0285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 786HxB5CciylvzXkA7igSWFtYP6QgXxnu3HwM40K4JO5aWxP5DosT8m0KheBix3XCI6N3eNc5RSolMLF0IMi/sHTHGu4fwatEpHw0cZJYHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17860
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34009-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,bp.renesas.com:from_mime,tuxon.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1860C685C6E

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaWp1
IERhcw0KPiBTZW50OiAxNSBKdW5lIDIwMjYgMTE6MjINCj4gU3ViamVjdDogUkU6IFtQQVRDSCAw
OS8xMV0gcGh5OiByZW5lc2FzOiBwaHktcmNhci1nZW4zLXVzYjI6IEZpeCBkZXZtIGFjdGlvbiBy
ZWdpc3RyYXRpb24gZm9yIGRpc2FibGVkDQo+IFZCVVMgcmVndWxhdG9yDQo+IA0KPiBIaSBDbGF1
ZGl1LA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IENsYXVk
aXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4gU2VudDogMTUgSnVuZSAy
MDI2IDEwOjM3DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwOS8xMV0gcGh5OiByZW5lc2FzOiBw
aHktcmNhci1nZW4zLXVzYjI6IEZpeCBkZXZtDQo+ID4gYWN0aW9uIHJlZ2lzdHJhdGlvbiBmb3Ig
ZGlzYWJsZWQgVkJVUyByZWd1bGF0b3INCj4gPg0KPiA+IEhpLCBCaWp1LA0KPiA+DQo+ID4gT24g
Ni8xMi8yNiAxNzozMCwgQmlqdSB3cm90ZToNCj4gPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBkZXZtX3JlZ3VsYXRvcl9nZXRfZXhj
bHVzaXZlKCkgaW5pdGlhbGlzZXMgdGhlIHJlZ3VsYXRvciB3aXRoDQo+ID4gPiBlbmFibGVfY291
bnQgPSAxLCByZXF1aXJpbmcgdGhlIGNvbnN1bWVyIHRvIGRpc2FibGUgaXQgYmVmb3JlIHJlbGVh
c2UuDQo+ID4gPg0KPiA+ID4gUHJldmlvdXNseSwgdGhlIGRldm0gZGlzYWJsZSBhY3Rpb24gd2Fz
IG9ubHkgcmVnaXN0ZXJlZCB3aGVuIHRoZQ0KPiA+ID4gcmVndWxhdG9yIHdhcyBleHBsaWNpdGx5
IGVuYWJsZWQsIGNhdXNpbmcgdGhlIGNsZWFudXAgcGF0aCB0byBza2lwDQo+ID4gPiBkZWNyZW1l
bnRpbmcgZW5hYmxlX2NvdW50IG9uIGRldmljZSByZW1vdmFsIHdoZW4gdGhlIHJlZ3VsYXRvciB3
YXMNCj4gPiA+IGxlZnQgZGlzYWJsZWQuDQo+ID4gPg0KPiA+ID4gRml4IHRoaXMgYnkgYWx3YXlz
IHJlZ2lzdGVyaW5nIHRoZSBkZXZtIGRpc2FibGUgYWN0aW9uIHdoZW4gdGhlDQo+ID4gPiByZWd1
bGF0b3IgaXMgZW5hYmxlZCAoY2hlY2tlZCB2aWEgcmVndWxhdG9yX2lzX2VuYWJsZWQoKSksIGNv
dmVyaW5nDQo+ID4gPiBib3RoIHRoZSBleHBsaWNpdGx5LWVuYWJsZWQgY2FzZSBhbmQgdGhlIGlu
aXRpYWwgc3RhdGUgc2V0IGJ5DQo+ID4gPiBkZXZtX3JlZ3VsYXRvcl9nZXRfZXhjbHVzaXZlKCku
DQo+ID4gPg0KPiA+ID4gVGhpcyBmaXhlcyBXQVJOX09OIGVuYWJsZSBjb3VudCBkdXJpbmcgcmVn
dWxhdG9yIHJlbGVhc2UuDQo+ID4gPg0KPiA+ID4gRml4ZXM6IDI0ODQzNDA0ZWZlNCAoInBoeTog
cmVuZXNhczogcGh5LXJjYXItZ2VuMy11c2IyOiBDb250cm9sIFZCVVMNCj4gPiA+IGZvciBSWi9H
MkwgU29DcyIpDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+ID4NCj4gPiBUaGUgYXBwcm9hY2ggaW4gdGhpcyBwYXRjaCBkb24ndCBz
b2x2ZSB0aGUgcHJvYmxlbSwgYXQgbGVhc3Qgb24gUlovRzNTLiBTZWUgWzFdIGZvciBsb2dzLg0K
PiA+DQo+ID4gSSBhcHBsaWVkIHRoaXMgcGF0Y2ggb24gbmV4dC0yMDI2MDYxMDoNCj4gPg0KPiA+
IGdpdCBsb2cgLS1vbmVsaW5lIC0yDQo+ID4gYWZlMDlmMTFkNTQ5IChIRUFEKSBwaHk6IHJlbmVz
YXM6IHBoeS1yY2FyLWdlbjMtdXNiMjogRml4IGRldm0gYWN0aW9uDQo+ID4gcmVnaXN0cmF0aW9u
IGZvciBkaXNhYmxlZCBWQlVTIHJlZ3VsYXRvcg0KPiA+IGFiZTY1MTgzN2NiMyAodGFnOiBuZXh0
LTIwMjYwNjEwLCBsaW51eC1uZXh0L21hc3RlcikgQWRkIGxpbnV4LW5leHQNCj4gPiBzcGVjaWZp
YyBmaWxlcyBmb3IgMjAyNjA2MTANCj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8vZ2l0aHViLmNv
bS9jbGF1ZGl1YmV6bmVhL2xvZ3MvYmxvYi8yZjFiYWIyMDQwN2RmZTYwMzEzODU4MTlmZmUNCj4g
PiBhYmZjNGVhYzc3MmJkL2xvZ3MNCj4gDQo+IEkgaGF2ZSB0ZXN0ZWQgb25seSB3aXRoIFJaL0cz
TCBob3N0IGFuZCBJIGRvbid0IHNlZSB0aGUgaXNzdWUuDQo+IEhvdyBjYW4gdGhlIGlzc3VlIGJl
IHJlcHJvZHVjZWQ/IEl0IGNvdWxkIGJlIHJlbGF0ZWQgdG8gUlovRzNTLg0KPiBJIGhhdmUgZXhl
Y3V0ZWQgdGhlIGZvbGxvd2luZyB0ZXN0cyBhbmQgZG9uJ3Qgc2VlIGFueSBpc3N1ZS4NCj4gQ2Fu
IHlvdSBwbGVhc2UgdHJ5IHRoZSBzYW1lIHRlc3RzIG9uIFJaL0czUz8NCj4gSXMgdW5iaW5kL2Jp
bmQgZXZlciB3b3JrZWQgb24gUlo/RzNTIHByZXZpb3VzbHk/DQoNCkxvb2tzIGxpa2UgeW91ciBp
c3N1ZSBpcyByZWxhdGVkIHRvIFVTQiBmdW5jdGlvbi9nYWRnZXQgZHJpdmVyIHJlbGF0ZWQuDQoN
Ckkgd2FzIHRlc3Rpbmcgd2l0aCBVU0IyLjAgaG9zdCBhbmQgSSBkaWQgbm90IGZhY2UgdGhpcyBp
c3N1ZS4NCg0KQnV0IGFmdGVyIGVuYWJsaW5nIHRoZSBVU0IgZnVuY3Rpb24sIEkgY2FuIHJlcHJv
ZHVjZSB0aGUgaXNzdWUgeW91IG1lbnRpb25lZC4NCg0KUmVhc29uOg0KcmNhcl9nZW4zX3BoeV91
c2IyX3Bvd2VyX29mZigpIGlzIG5vdCBjYWxsZWQgZHVyaW5nIHVzYmhzL2dhZGdldCB1bmJpbmQu
DQoNCllvdSBjYW4gdmVyaWZ5IHJlZ3VsYXRvciBjb3VudCB3aXRoIA0KDQpjYXQgL3N5cy9rZXJu
ZWwvZGVidWcvcmVndWxhdG9yL3JlZ3VsYXRvcl9zdW1tYXJ5DQoNCkNoZWVycywNCkJpanUNCg0K

