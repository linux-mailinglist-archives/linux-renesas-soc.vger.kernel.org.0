Return-Path: <linux-renesas-soc+bounces-5991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC36901C37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 09:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE8291F22819
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 07:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77CC55885;
	Mon, 10 Jun 2024 07:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OHeNEc1m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2087.outbound.protection.outlook.com [40.107.114.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F6954650;
	Mon, 10 Jun 2024 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718006356; cv=fail; b=YwtN/RPzJZBW2IdAk/cqRw8Q8DDObm3pOpDhXehPIEjIIeJv0igQBDAFf98UJ6m5KTbxuBp5ZPdGqnV2xEe/3XEe7vs85yLrgJOBTB5n0y0JqPRUI8KcuyXTU2efG0U+iHNamGNyDP3LeFmGSdYDJHgRzrTbQHgjuoPaODfMzRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718006356; c=relaxed/simple;
	bh=gobyGTWozsfWYYoJlTdIdWTT24dPxFz37XI4e9Zjh7U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dpqdDVmFI7jcQOeWCxVQpvdgDxGyLz/3129wBgeyo9pNgUqzXQ5WeinfMbCQoJYi8SpD/Z2H845eRUXA7+Tb+Y/+qfh6/IqXlJIm07BBdxfa0w3bCW9W03/6cvHRHFn+hqZD9DKKYY9n01tArR/PnalwtZ/orQxR2h2iA5XyyVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OHeNEc1m; arc=fail smtp.client-ip=40.107.114.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNRo18un/Td9brh2C8dTq5uK+cKuO8pKbvztUvLTNmIFeGF5vY/JnAcwswoW96LqjY2SA6CO2/gQT7ADDCpyQmH4tkFl6rcOPVxU1EE18cjc9Jd6ta5m0WZE7AyAygXtK0jDe2u4gkknzorbAnUIums04y509J/8/rlvcDcY2hYSsDGfuJ5Kdxzco7EAjNYWKg3v2hUcqYLQI4ykVWguAJctSeBBNgClohtLM+BpJ1x5Y542FQMhFobC7iYj9FXgiN/m2wgZcvjj3J2UuVb2o36XTyqySza9JrEBufbFoGdHQbS8KRkm4pNlGI1OwwhmgY9ph4ZCfIu7H8VMt8omHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gobyGTWozsfWYYoJlTdIdWTT24dPxFz37XI4e9Zjh7U=;
 b=E7YH63emFGVfHOTJxAhqUAmkOg17mA10rUocxtFG3LMD2PKOZwIlqdJ0yKAZKcfm8SPVc9UE5eM81P4KDuQpbfG5O22lKkkNFHsc0wxoNgqtuR58Rf/tbc6ctAV7+OJJfWl4gWPA2VObXnTEbgtlNZ82lCjMZBdp+PgWKP7VK1j4ghiBf4tv+IrDwUbuCqiOaUXCaCSQ3+F0MNoTu/oLMBJgVHiTBdZujWVbowOT5pU0E9srkI3+8Q9nD0AOkHhg7bL8Bn/F5FoLZLk4ZUgpy/B9JK7h6Pw/X2JEz7NXvajOMZapirEc7reHocKn3yevAQQV+urYPPkj+BhbKjdIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gobyGTWozsfWYYoJlTdIdWTT24dPxFz37XI4e9Zjh7U=;
 b=OHeNEc1mSIXfsXK7dFUV+dHVPk5bl6RuvQFbGzKiIvlCkr2H4KXYCu53Pykm6wlKBmTm2/pb/P7nGlqJ2oujCRvUDP/hp726FgGQ4oXHGgPik5aqaTbp4Zzmcxttkt/G3c90oN32q+4BGTDIeGrgK9DPjw0N0ZiZRzV1PnMgRmg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8709.jpnprd01.prod.outlook.com (2603:1096:400:168::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 07:59:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 07:59:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH RFC v2 2/4] regulator: Add Renesas RZ/G2L USB VBUS
 regulator driver
Thread-Topic: [PATCH RFC v2 2/4] regulator: Add Renesas RZ/G2L USB VBUS
 regulator driver
Thread-Index: AQHauM8pbcjZIWPwZUmmO1HOljJI+rG8bckAgAAMeNCAAAj7AIAEIuXw
Date: Mon, 10 Jun 2024 07:59:09 +0000
Message-ID:
 <TY3PR01MB11346F9CA0C3AF0582904058D86C62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
 <20240607113745.73934-3-biju.das.jz@bp.renesas.com>
 <ZmMntvriR32aqI-m@finisterre.sirena.org.uk>
 <TY3PR01MB1134695C9D89C84EABF7B2E2E86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ZmM5tL1SaO-mOEpd@finisterre.sirena.org.uk>
In-Reply-To: <ZmM5tL1SaO-mOEpd@finisterre.sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8709:EE_
x-ms-office365-filtering-correlation-id: f4618244-df9d-44c3-6852-08dc8923354f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EL+YWZKtOrxhTa+UrXTd3e4Nz7GaxQUqmZRZoFsRtyNQQr+aRDo1A0EL6aOe?=
 =?us-ascii?Q?TX9/vqLCtgpKtNCBXUMkMgO+euyOv3UBYH8x62kbgBkzeMObt4dwpg2jFr8r?=
 =?us-ascii?Q?DH7G9XZNQrtg9pkHXltm/WWTppcs/v3iWBjwUqN/UF5xANPT8YvN7GjIS9ad?=
 =?us-ascii?Q?jYoKE7Lpt9Ko3n/qVv2LkD87gM5Eyx2MByGTUpdizcp5RaPOCrcxAmZmBrJj?=
 =?us-ascii?Q?8tYC4mV++7LuGaQArpyV4Q8mJjIxyqNNApxH83Ck8bQT014uyYkGDIrngvKf?=
 =?us-ascii?Q?e7FX9WjqFddsv55grr65ie1jWaW8Q+iOj/qSpunRMaVJ/wyTy++BKGZj0CXb?=
 =?us-ascii?Q?yNyboPDZOWNwMOKb0rQMjnLFyhETpgpa7NVbnEIE9zjncg27x/guvDaTpHWQ?=
 =?us-ascii?Q?3vp4PMLmJhOZMhApuyJtJpWOopKImU8Mk180UD9sWPArl9UxEqA8uleT1F6D?=
 =?us-ascii?Q?4aGkRp9ALKKNnMFfbCOvUdKs6Nhpu8xjclzSbJdypq6+jVqmxm8ksgFXxGi3?=
 =?us-ascii?Q?wB7JoRDDg2zInUaUH2jS8moSPZDKVeRawVOtc6jmfJDkknoplCv6J1jyozx5?=
 =?us-ascii?Q?5MFniWIx9N1C3G0SGdRscWtJnA0dHV/XxqPhllK5Uc/fGKpEQ4bHn3sO41ko?=
 =?us-ascii?Q?+CQpS8zmDjkJ4wbPuv6DEybMI5EktE7QJVG3D6WdXLdKPSY2tOAnbC8Geqx+?=
 =?us-ascii?Q?umgpvL/BBCS6W+1OU3VJRwN0oAdnp/O5dys+X57TAXeTFDWaDtipWvYuGqhg?=
 =?us-ascii?Q?kv+buRxWqArN3mJ+w6OsF02xR5HE1/XP3/yui9PqarVH/R2F3Ct4hzfkbqYT?=
 =?us-ascii?Q?2lWHswDd8a93ldPVuwNPseCK/8meUK75HQ8Eud+ZS+1gi8I20VViT9Qv6S8E?=
 =?us-ascii?Q?rUWDMvLuZBASzykwbG0CCxG3G52gqhaJ9Cirx2sdV+70oo1DKwbLAOPzXdFR?=
 =?us-ascii?Q?JxW8gskTXlXB96iuTghEqsXK0bvqEnpBXxX5+AU2E+BumhsnC7rOC/4kNIKB?=
 =?us-ascii?Q?L9UA1EFv/sqN9hURKtakweCbbZEhwuXf2E6jFYYMhlT4v0kHF0tBUBVkts+A?=
 =?us-ascii?Q?QQZxmsXnrL8LgEXL14kEikfANxmlh9lJfPQWXno8lDZyvSw/8AGqPjJLwLpI?=
 =?us-ascii?Q?4xv+h6iegDIDRdcqpLH+XZ72uCoQOs5Kvu8acJZ3kzmcm8fjRl9bt8fFk0O8?=
 =?us-ascii?Q?Ekgnqbj4aNuSYWxa0IQjI5N2+d9UyGPSa3mpnnWWxYBCg9d95JFv15qg/aOv?=
 =?us-ascii?Q?AGp8Oc5NLDeBC6+SRCMAcOM+mrnQYzbX5MxgmQuYRhYxlNHLpIb52jB2dZgD?=
 =?us-ascii?Q?0HQwUHsg+pTHMp31rdMDd445SjXMTSztpCC0t77eaDUv7WvI4ywzpFdbWw7+?=
 =?us-ascii?Q?+ek4Vu4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Br9mY28rnWiqzqBu9gahyMu3p0RaQ993wbEAIQaU9zTk99UcYHna0JRmnysA?=
 =?us-ascii?Q?UomwlZfHsfvrdT0hHy/xLHTz91PABzOvbDOdhSUvq8UKYEw5r9FQNWeH9O/O?=
 =?us-ascii?Q?YudlzFBF4PRaWN5+B5ty+1KpW16LgVWmWV3ZQd/RnNi/fQdnuDbEuwDBYDkS?=
 =?us-ascii?Q?DgEwrGV3c4UOiO1c2WQYa60p9p49JITILyojWrLo2J7Rnr9Td1rp/8OIQ+J6?=
 =?us-ascii?Q?An7kgoxpAEApNb7gMyT3vSZrDBUBnKlATe7TmfkHAWqGzabDnQRKmn//4rtU?=
 =?us-ascii?Q?Lr5MOKf6Ijjv6E4AU9TXXVseRpzLX0WT8uPEWg0+HyBol/dMmR//t8wrjqCR?=
 =?us-ascii?Q?VQR6ZuxkaJVxC2o3xXcvcwNdt/DZCWf1qU+1hW8Ot5RRqKsF2Wqoy9AhbGnA?=
 =?us-ascii?Q?nrEA6lNRiI3ShVhUig0+g3+6ym6xhYY3jh+6cG08ejlCVu1u8kXvnXeMUQuL?=
 =?us-ascii?Q?na/CmTuFsjk/SdVp1XjOj+K9q9eaWTcAWs+DHPtSU+SEpDQ9RPKqa4GyTliQ?=
 =?us-ascii?Q?H++NRw1fnqxrcwDBPlxIHjIifHkdEUwc/msBlQITubB82rB3kjaYDrAaIC2P?=
 =?us-ascii?Q?vTJZa48LILRrKH604JkTiDP2vPUhXSERieFWM3HeUA5BUXwzHaeKX2CItIqE?=
 =?us-ascii?Q?hyxPBWPP/kFaAJGmIYvTdQTW/3zDS7R3GRWC6TMWpcnqMxYiIUn7a0AcXhwn?=
 =?us-ascii?Q?M5Yo2PARNyqRunwgNWP+ADmRi0dAQ1lCgbIAMavubOk7iWrFD0T9kTluzX5x?=
 =?us-ascii?Q?Pd/KY75wof0vdArYIDa3KDHRotd2m2zisD3iCxdPSsk0RcDsQNNwNICosbyQ?=
 =?us-ascii?Q?eybnxrAvIoQx4Npr602y6gIBAjnIOP0irOFpoy5shzGgZ0SIWrfO829Dsbzq?=
 =?us-ascii?Q?nBFRqRDPFkJp15gjZ4E20lZd6abEQL/xAfPytDWDuxVgjlG6E9F4FpBP21PO?=
 =?us-ascii?Q?jHYOH6GCFjMsClWYoyU6w13VxHNKs0LIG3QVcWLzm5B5/IbEC1aFCWdxfmv/?=
 =?us-ascii?Q?+Iyyjq0W60lbgvKOxeDPmkR+7zKZdX1SSp1J1rFE6CEMQhvQR1aJCV07HJp7?=
 =?us-ascii?Q?URvCmcw3BZjOAgbR3LcF6d/PBDYMeLvdlY1KbKAwWkAZG7SmORVIZxarYglP?=
 =?us-ascii?Q?27SHn75iq5dSh03d/l2dzP6H0ehMqBGi47mRZNpp/2GlhNn+zcqadGugc4d5?=
 =?us-ascii?Q?5DegMmj2qC+fkDeAgOb/HkopSWewjR12eNzhZY77OFrK4S6SXvVAX8rY6CtQ?=
 =?us-ascii?Q?dAc0AYgRteNSaGbgqfGCxE+XIbc2/bZjAXkJsTfoBaFL0fboRfQiCbtpFqfO?=
 =?us-ascii?Q?uz0LFY4xgl399Qu+Z1EnqTfh8eQtp59lwIy0GL6VIWV5aFchLoAsSDVMVcdN?=
 =?us-ascii?Q?lftXRxq6d0F/WaxhkGohUHpsz2wcIDifVd/eFkAIbf1xczRvlJRK6L6OX5SY?=
 =?us-ascii?Q?KAQb3z81H02yrV1S2PYpVNSuup3Jdj9yjxv8H/notShUDA2jjyN7OpLkHNhE?=
 =?us-ascii?Q?QDIpn5NfJc40bS+5UdzAkC1iu3uuTH9KZ5T5nHxu7qlOa0NXHJLOH0V4TtMV?=
 =?us-ascii?Q?2pE9qdhm380PyKc3A6rHhH/+x+f0IlnN8k1ja/P5Drz9biU2QpvLhiAyzrYf?=
 =?us-ascii?Q?ug=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4618244-df9d-44c3-6852-08dc8923354f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 07:59:09.0925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmOY80qhTOQOZwmE47qVjk4Ugg7a/hBeEPziYWCwYIodNwXcxZHGiUOrYU83LWxZD34a6vUmcNfDZWRrYQq5S1qRYFOm00Uj+mu+rHqvwj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8709

Hi Mark Brown,

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, June 7, 2024 5:48 PM
> Subject: Re: [PATCH RFC v2 2/4] regulator: Add Renesas RZ/G2L USB VBUS re=
gulator driver
>=20
> On Fri, Jun 07, 2024 at 04:20:10PM +0000, Biju Das wrote:
>=20
> > Is there any atomic regulator API's I can make use of enabling it??
> > VBUS detection happens in interrupt context.
>=20
> There are no atomic regulator APIs at all at the minute.

I will explore adding atomic regulator API's with my current use case
and later we can expand.

Cheers,
Biju

