Return-Path: <linux-renesas-soc+bounces-33434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Og9qGhX5Hmq3bAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 17:39:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E52762FDD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 17:39:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=VVLCy9gF;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28FA930B3E36
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 15:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832453E022A;
	Tue,  2 Jun 2026 15:01:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA8D38E8A2;
	Tue,  2 Jun 2026 15:01:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412486; cv=fail; b=jrvRkPAlOXoSleYNwlfrrwH13XVmjO7o0UXJQaJ3notaFDw92OGhyySOxLz1teE3XEmLcytzMjHnZz7CXpAenfCdk2UJAItE8n+hF2Mao6AakX/zoKa6jXvIvfnZASs6EJGoVQ3OxcN53eDCxAfKoUN7cuXpGjsU29izKviFRHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412486; c=relaxed/simple;
	bh=/HWzSPoepdPRjczs7S/lcjAcS0z7gHgPdWnoWxaUsb0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SNG//tVm9wvVFJUCWrPySIBtuCBfkVc8yb5RkJtO5CiXeonfu0PsRoT7xPibjMbuh8HrRXukQZR8/h7bP8JFBVr5rfM8XQe+ugIluKYxmeJUmLy7h16bsxerb1nDWqbUnLgehf7TSCYT61TVlvEm9lkRdpDHjMh2SWL4MBunOZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VVLCy9gF; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILOsip1lIpBjEW3BPFT9DUfYw4uoY4bRBCtNpJ24SeXRO1IcbqCyN34KiEX6PobBZcAhKwSYkXobzNO9dCC0ejZ2SSrKXj4KhmVC3paGdfj7ehNjrMRtlPVrti3F2DsQwG/MQ3Y91Wc/7H+DytjAN10IjL7hBjDe2EF5cvnezyKebEwYGFWvXdNezvY+mqkISudzdVPGa7z5Izd4D0fkb0kb3OTXnoPnqGb2A8S89fjQ5H4XHlny1OQpkeQbnXk7Qqv6YK+THdZLcEz8PYUKhZOPDAcfEicotXvHWQAutHqw/r4FNx1dXHde1DkLvbba45b+GHADKM4Ul3hLyO8v/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTvXcLgx3Ark36V2QTS2w0Hp50PYtAlGytxkj+2NGW0=;
 b=gwQneaUOwM5T98ol1KhOslQDkmRTyEztolEq/Rr3uEWGSxW8II89JlqVIYRObBoMoz98fvnQvOOisD2hwI9cb1TwW7/qUIFkQX5HyOR+hROMIBYauTaHHBSLEaKLo9Msb+KGac4ucyj/UHA1yD4tysE1yEIBIJth4TYfn5QRhs8kgtZ/sejqYdWLOoIv+KLiYEKybWcfeAgs3sAGZ4JUy7YoR3YqPXn73ctGN/82WEWV1jG6kEnUVSC2Sfeaf7FcTIxfvHW3wOe26fi1Y+vbNysngFn02LOUAJ+7/u+vlp+cr1n+gt4HxDMyiBmfMNcVD4s7km0WZvqaVPAC/StTYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTvXcLgx3Ark36V2QTS2w0Hp50PYtAlGytxkj+2NGW0=;
 b=VVLCy9gFEF45Is4na9rbfVYGY4gGFiNzOwDWIfRVsgkk5HFC3+dOEYGo3R0O4XvkUlbHLiiPDlB6YnnfF182UWOnCRaye0j3Dw/sjey1Sz/13ZxKQW0claczqyueyRgNA+UQ18BQ5c7YlUU4lSA5ydf7ZsL2Kg0ZUMTc9KfIg6w=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB7264.jpnprd01.prod.outlook.com (2603:1096:604:149::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 15:01:20 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 15:01:19 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 01/18] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Thread-Topic: [PATCH v7 01/18] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Thread-Index: AQHc7DYddwMFGG2riUi+3cPkRSmpfLYrZ0WAgAAAjACAAAAngA==
Date: Tue, 2 Jun 2026 15:01:19 +0000
Message-ID:
 <TY6PR01MB173772D84C91DA67CDD557D66FF122@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
 <20260525110230.4014435-2-john.madieu.xa@bp.renesas.com>
 <20260602145527.GA211368-robh@kernel.org>
 <987befcc-2fd2-4d4f-8293-72df4dbc03f3@sirena.org.uk>
In-Reply-To: <987befcc-2fd2-4d4f-8293-72df4dbc03f3@sirena.org.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS3PR01MB7264:EE_
x-ms-office365-filtering-correlation-id: 1e5728df-bf7c-4df7-1816-08dec0b7cdc2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|22082099003|18002099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 GRvKpS4BVEID7n19JFhC6zWfm3oSq0DgvvzJEKpZsXuG+E88yZCm1KG47yIVeqll5CWKGh1Z29IWBgHXajGF4T/xVqKAsdPwePXzVmT6f+7SxieNhyQL/ekSXKgNCDRSOkS8RGbuQVd/XlcIHOzWM/gulNhfMFF7cY7xWeHOv2vMatD8P4mG7Jz9UMdfT+ab1AHirfUSs3svLgJFds2OWOorBzZ/xRTVRfLaa/bChZ8bQsXODhJSUHqz+CHMyN9likMP5xRCHKytJpfTztrVJ6rqKHryxuKzBzS9YOmfHoFHDJQzvGq3faaV7s6ldPtKVzIoQMjVaACdF0JIu1zGBWwPW/c87hIxbxNs7nIT0ZOFdNBDM4XV8qzTCNYxvIJcoNr0S7nM45jk4bVp5C1mzsiQsrLSxreTzD/ogDRoit2zosU3zwgjStEuTZDsqZXTLDlGvj1AbkDeAAIf50/GBdt3jARld401fmpGOqAY518W1323zjZm+KC+E98cNHyEkBro5WWq4+GvKv1BUAiJx6RloOrAprgWWE6WmZzu2vy+fbx8SzBrnV6teAEqaqwNWmoB8ACdW2I8qu8ZarWBPuZq+WrhNjhBcc5oSjnBFA8NKW98Yc8k4Z63nXYEXZyI3lu7kVH8kE8XzlqavT6xrJkMCIbKHYq0BnwQ40YGmADB9tc6vx3NegIBFXnP3THPchZxXXApOhyRl5SuyoSitMTLuV/VU3ZmOOMIwzKk54GfhXmMxxL1Vw772+SKPdIW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ggfsbg4p8WGQF0SQJbpEyAxlH40Py0clxKtw+UXNNkzSbuc2ce5o5zfUv/zG?=
 =?us-ascii?Q?LR26cQeyD9zsU37EeSoIXCthwkiQlhltB0rzQBe7j+CrDgaIs4WO+xPw8hcl?=
 =?us-ascii?Q?HdoflmF9RiJ8q6YYOt9gWwOfoN/VypoJ4+2Ij7GpxzK0ckvOKC2FoeedgLAY?=
 =?us-ascii?Q?yIVh1BkqsZOtlIXnZqSnsLEgBUpkC1x0XguRzzBR3OM1sTJ+7sHBaYmFJJme?=
 =?us-ascii?Q?kfy/+Youzz3f/xHy+JBtYeH0zC7s39qDSDDQ3Ymj/xInEEcR41r52V3BhomN?=
 =?us-ascii?Q?xRoarzVXNtiANUAZEGc5Sbd0GUL86XHqLjrGQX3+LUItn+brDtBugvWuKtnO?=
 =?us-ascii?Q?q9h+4FLxaKO9s2+JoS3YNjpxpd72gdi+U1uB2tnYWuKac+NxJjC20GL+ec61?=
 =?us-ascii?Q?tDq4nWzPVVjRD3SV7DDR9qZMbWa+oZ/0tnSp/pjvRhu9eoQ5gV9QFHwpPeaJ?=
 =?us-ascii?Q?z+E0wn2Gr8B+I1fTibCbncxVbNc9QU4J5hec7M/kSN9huQyuVfGYOgtNlQsj?=
 =?us-ascii?Q?GaH3YmnLlnOffOBE6aBK0vxeTBkvTsu6UKQjkvB6sS+dOWXSAIW1yjmKrsII?=
 =?us-ascii?Q?qCBE6+70KFAqmVDJCeUZxvTejlujs8cmFi0P/aeL10eyovRNpeeBR/26Cov3?=
 =?us-ascii?Q?ICLExcjICGOTJ8NJ2p3diNuT2Q/L5vwHyMISeSyaNo4bEfA9jRabUe/aHmzK?=
 =?us-ascii?Q?6nEbNMc81QKeK+nSgpAjQ/pCgSTa4E/U2xTCMRBfeCxZEvwUNGQoj2kmtFGc?=
 =?us-ascii?Q?tEVM4R/m4zBZzMswO6k6zX35dIxxZbSFsZrTou7gXSOYkkj+xwvhJRcVNH3r?=
 =?us-ascii?Q?ef4i4vOc1guegxWt+9xLKZxpENpvvQMoIssrTJGk0gNMuhyfGeek+tXS4vwy?=
 =?us-ascii?Q?P8JFVzFPshWHcvmYIYOaxVyzh98danjFerYz2pKnCceVYgKxyGwYQk9B73Ak?=
 =?us-ascii?Q?MKwIyEQjpJ5BWMdYdMJws+aj3wP1PDQXdK66RHZ7lR3KTtCFOGQ2jZzOWSIQ?=
 =?us-ascii?Q?rlRenLlJ2PRkCGpcyFAFq17wNeO8HJ3lhjn7j8L7sbnZW3ukS5ZAs5lAyfo7?=
 =?us-ascii?Q?9nudWai1DRuoUeJkwr33MVcb9x4mBrkU2Eou2wZRpwxUE/KDtdtdxIm7u9Jg?=
 =?us-ascii?Q?dmOm4lRJs+uW7oDEQ6KXvxAiZQ/K3mnpd/b+f240kbguDnRvOGoNcDdDTODU?=
 =?us-ascii?Q?JoGSKs54zF1a8bdlpNr+caBt2SlsyDS0IGSgVMHqb/TG8k3ZuBAufromW2Zn?=
 =?us-ascii?Q?AeGE5gsfXuPMSJx6GIfc/5kcUXbTwAUlA/SdWdWVNLbzk7N1YSKC2H5BcQse?=
 =?us-ascii?Q?KWEkRb4bOM1kXj3XzBXqGt4NZ8vFMaCyOxwRyxWYPELT8gvC+mlwYUpy+FmH?=
 =?us-ascii?Q?cKDsIKX+6fQX9sX3z4fJVYRIyhqdnDeDm/oqWcsps2CiEesDvSRQ8ryu395l?=
 =?us-ascii?Q?+PBSItHBFzhX4BN/IQTtLRZ6BgDwOhbT8fAQD/Vqn6Cx5Pb5Y4XUk77dhSB9?=
 =?us-ascii?Q?FYdp/c4KGm5ce9rXDB+q+oZVj2ZtI3IAO3ItpYwN8hV9ip0hlKWhx80IV5xJ?=
 =?us-ascii?Q?dozdJObjIcR8ZrgM761kI7f3ELgllwapPnhMcDfJZzDWnDicDfG9JNFCAy5o?=
 =?us-ascii?Q?l9qfGaMlwX9m8zyP7eEmuP8f4Xmqm/7EAXqeGa3Yuhy/1idG7cuZZlq1yZVY?=
 =?us-ascii?Q?mQnK0G6v0DIpOS7mw4S5Adt9C3Km4aBrqdjYbEAVyk9kKYSPajzTMl08izJp?=
 =?us-ascii?Q?Z1Tjgi5VmHXgAV+v9JJWLgxN1QtlQUs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5728df-bf7c-4df7-1816-08dec0b7cdc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 15:01:19.6580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jy/JJtInkHW0vr8QRnwq+1pjWT//5IPqfVgk+Sh99k2jlZUSBWJOD7pThIuyWvEx4TGVzKSPugnD1cTJDJkkh41J5KMVZnaWvJiUaooAI5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7264
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33434-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:lgirdwood@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:perex@perex.cz,m:tiwai@suse.com,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:claudiu.beznea@tuxon.dev,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,kernel.org,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E52762FDD2

Hi Mark, Rob,

Thanks for the review.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Dienstag, 2. Juni 2026 16:57
> To: Rob Herring <robh@kernel.org>
> Subject: Re: [PATCH v7 01/18] ASoC: dt-bindings: sound: Add DT binding fo=
r
> RZ/G3E sound
>=20
> Please delete unneeded context from mails when replying.  Doing this make=
s
> it much easier to find your reply in the message, helping ensure it won't
> be missed by people scrolling through the irrelevant quoted material.

Noted.

>=20
> John, please send incremental fixes for the issues Rob identified.

Will send it as soon as possible.

Regards,
John

