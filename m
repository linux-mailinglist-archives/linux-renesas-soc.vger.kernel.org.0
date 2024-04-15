Return-Path: <linux-renesas-soc+bounces-4620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC838A4EC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 14:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE4D4B21619
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 12:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299003E48F;
	Mon, 15 Apr 2024 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kvSIaQOY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2047.outbound.protection.outlook.com [40.107.114.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF515657AD;
	Mon, 15 Apr 2024 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713183538; cv=fail; b=ZLOG1cqeGCKadDjCDCU7gX0YOk9YP64G8w8OB4iPaRZvArChx2zOJWXzyNxIqO1bg0FArZg+S6ApWi2K6Eporfk4UAxSrBZvpfkaKwcnQG8fAtlaXjt/48yBMQ+zLb5PbrEM11d2GYe34Y0X4li/RXZy6Tzm4u+UH/Nx/X9VXdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713183538; c=relaxed/simple;
	bh=gWLUOWlVXVfTV3tz/GwEJGZjMCJr3ppGKkWgMuDuHZQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VzgoNM/6xv/BTEK3Cy4arnNeocKKozHASAxYjPZkfWYYdyJjElwmiGNrnhbxiaZGCr3q9OV7h3Qos+4iv4WtoswDy/j5BiHBpUVWfB4cO3v6skLxnFYoYtwdMCP+RLLXD33IlCsQJQNWtJY1YMVhfa5v3zLtpaELbs0pShLEX2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kvSIaQOY; arc=fail smtp.client-ip=40.107.114.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUYCAlUs00iAtSBrv0/GJOYSzUdyPWVu7x7XFpVenNlZ9tGkeK0tLelcFmjKiBgS2Kh4gx1uOnqFR2qo2abUrTXDlLsWIF+uB40Rsm/Ms39xzQXbqnkPERMtJNwSG7VhFrr38DhN8wEm1GYtbpiv2YcUY2HZlKBQB0t4ZhPrzzXaGdsqjIoBfGujq/+z7pK0fDUiWIteUVpmSdm71C4NfxpsAW5jsB+k6bkhiKjc+ZCGwbk/EQE+HtffbxAVRNSQkEoP/EMVIDFkHToO6tqNcnkvvNZp+7IO3QqBcuPc1oCsEY81NQtw0vpf8+cBxN0F3tKL6ezwk1r9794AeaX50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgardweZzDc4K+xMU43pMgfHq0hyEmqKx/dhFFNJXps=;
 b=U8ONO8KC5ABLdozTci6tK2s5CPWpIVUw3wDsJ5bJhZKRO44wCHolIO3w3VFvpRo6MjC6d6jzgyVS/WUH4cGYi1A4IXpT6WGk5Hzej2MOxKzskncK+TrjY4ihSbzesdJDrHUpmza9tx1s8lHU/eCgZe+QiekJ6D5WwUXNPbl+fcif9YSDAnCuMYRBOS3r6/rpuwe35jJidSKwEyb+ZiZtOFOYLb6SFOr8js3wqRoYYe2oPj/9FaIjbfK2ryxg36JW3g9AldLP9DB7EQ40KF+i8XgZbtclvH501AJ4RgRSVhAVI3CzK/WDINLTZ7qXP9jQBRcAaV1BUyxM+SXYTJkggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgardweZzDc4K+xMU43pMgfHq0hyEmqKx/dhFFNJXps=;
 b=kvSIaQOYV5oC6T2aiR2ggDzgz7lVxYA1xoBsJbUROGNy/P+sxem9yGc7Bx8nolmv9hbyxbRQBW62cGmN8k5BOvnAGcp4rQxf/hOmD72CEbfnV8ri9Qn4DCk0FFKrlp+tLCXFnbQFnIhIF21FtfK26UhgX5QDy/sf1Pj1tbxjFIY=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OSZPR01MB8404.jpnprd01.prod.outlook.com (2603:1096:604:18c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 12:18:52 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::fda5:45f9:f1b2:cbce]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::fda5:45f9:f1b2:cbce%3]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 12:18:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: RE: [PATCH RFC 0/3] Support VBUSEN selection control for RZ/G2L
Thread-Topic: [PATCH RFC 0/3] Support VBUSEN selection control for RZ/G2L
Thread-Index: AQHZiaFfkULG6eflqEaqpA3OKcqzp7Ef1iKwgEtzubA=
Date: Mon, 15 Apr 2024 12:18:51 +0000
Message-ID:
 <OSAPR01MB1587FA6A68811C80A574BCBE86092@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20230518155649.516346-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11269EE1F1FF841AFD999C9AE86592@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11269EE1F1FF841AFD999C9AE86592@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OSZPR01MB8404:EE_
x-ms-office365-filtering-correlation-id: 7026be14-2cca-48bf-5d75-08dc5d463645
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bZPmuCaoOoM5rSWg4hFyL9g95GD28EAgeZZuot/TI9op0oHBNHKFmtD9+Bbx2cyFVfV+mBtJxunEgfyYbv6MnqKPHGur/b2kdBB7FMkEwgQ8i0Af7IwJ9yhRH0cVgqY57j3lWNZOom/tLRefovldCg3jVJ1pFOzbW7eDhTdAXUkKBmMEijeLaQ9NGg+Kba56EqE+2V+8LG87u62tLGjj6OO0ZcR7ikqqionPzdNGKavi6uNuhumBexMB0z7w3Tl8gUl4Okrc22FHs7JhPdLckM16/mbA6mr/UY8FHbCAsKzqeeA8oWh1RbRr6ZoYDPD6VstJdeSodHfqRD4DXQQBfRBIJXbx/ogAn4ZwFEiuVtTBP8jBYKlWr5xiwGH1NIR6JiEIpic1CIPRewiLPclHb+cjbUbPAYvRd9EYsofQR6CXPB1kgTOkUMgdkzY7nBy0ZxohFCWhzv2DL9VUZuX/XF52nCVtb+PhPFhN22nBc/RE1V55WYGSFMM5Q6LcqkvfKOShWv86N6wFFknAGpeM9p+InFfByy1t2gMa7GB5Z9b8IdzZUEbYIxj/m2/BzUCHIlWxjabH7v0XxDzr5FN+yOuZKVg1K1m7b+kbali6icEZNTvXNCU42OI6D6SHuxl2Swx0AeJPG85xipZ8xsbAwLBnCx43+O2uday9YqWEf3Eupft0gYCCBCshRZfYuv0E+v1JBf4Fcfr15tIiprQ/JA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?C2FUvwakSW3WYC4WsZKFQzr01TQpunw0G++r2+3ed3gIydl/RUeI1nHm+WJa?=
 =?us-ascii?Q?tj/xGT3BBmkkyfa7bhgoUFYOv03F8lYwZP0QpQE15gRfzyp1dRU9JDNXx6wY?=
 =?us-ascii?Q?Y5cV334MsMNvUf8Ng5VkgQMjtMU7X+tplHxonUr2NksFyoVodEi+97J2MYjm?=
 =?us-ascii?Q?FKkyr08KOMI1XWC5flIL65H7qnXMNmh+TCKy+U63sUMzeMGXCSNxt1DyGf3W?=
 =?us-ascii?Q?rthdgYiD1djzO/NFWCIsci8NZuqRJGPr84KX9Lonasa6CFy8g2GEGCnXRtKu?=
 =?us-ascii?Q?eRgB+etrvMi670ucr+q8UAmbwMvGELrMacZydohb/MODg20986fBeD1jcuiB?=
 =?us-ascii?Q?siy3L3yXVJWlxtKHcURLd/l0UUcrti43tk1ZSmG9Fw+LniDvp7XR9etPAYzY?=
 =?us-ascii?Q?XKnmiicaGznDQBsjgLUkH5tIhiFFCW6u7dRqdut4Tzl5735Oktezrhb8z5D/?=
 =?us-ascii?Q?eIY0OKf2thm8mEXS/rq2/ETERzP2ZmVeaKzsi8Ean+ru1uTkJehJ+Vpe6vo8?=
 =?us-ascii?Q?kEZZCQwrzpVlMf9wughFaucFKowWWzd2Hno5gETg8Ermhba1Vf+FPA8c3qHA?=
 =?us-ascii?Q?lLmAJgz8oBEPrjn6Sm6FQ0r8Dr/4uvijHKP4KMReDo/KtYALP/2jkgy8+EwI?=
 =?us-ascii?Q?89GGmAby/ZqOcKV2dQM8RuMPHGainQpzshmFmF78LiuW0FvNkPpbvfbPUBgF?=
 =?us-ascii?Q?kcuHFueVHmT4MQBOj1AB+2xGAlDAjS4ohgFI7dtQFtbcuD1KfDexO8UWQdVA?=
 =?us-ascii?Q?8RbFazrTGKnGLkrRAMvtnK5OdkHTj7dP1FvqmEyw/e4efaWs3V8K6o7gs69b?=
 =?us-ascii?Q?X42GPaYVzhOO7DBnwonuF6fQTl+ubFyhzQFll+53jmA+8zoeiu1znGYuG1Ws?=
 =?us-ascii?Q?W3CuQDl6FUDLkFH8AnSdz138js1kV4nIc26RKFVKC+LV89EcQMMxvfiQEi6+?=
 =?us-ascii?Q?unAWbbIDBGAmUIpaPv6JEX5VuKcjK7FckZlJ3BNdQLtgdv8w9STeUR66+IOQ?=
 =?us-ascii?Q?wPLEedDa0v0KY8JueFN/76ONjmGLibyF/MFengyEQ7Ae0ENr9dN9JzxmonuG?=
 =?us-ascii?Q?S3m1Rt+f5rMUEUqiwJe6itfEuEjcKt5Y8mPfmXHTlFUfmfTVHy8vjTANEf4P?=
 =?us-ascii?Q?PTnYCXGna3Fgt9dinUNFju8c1AdCLL7zmkxyHAxNMcm2j6A9o8aaMKoxBw5K?=
 =?us-ascii?Q?nb9dQT978toXHnXbGC5/fRr5bu3DiqoKHI2yBbzI/j7+ACvCJnnQSuNpTFjk?=
 =?us-ascii?Q?xvSoL2clM5SjKbl8A/QiCXHafU1YzrP18H4Jsmjr96JBhH/oz442mP0RSstd?=
 =?us-ascii?Q?ZqBL6tZ1vJrK9GkbVrVMG3Umr7uNUNUAQOeMUftnSvL4mY8aJVnTV0wo5zJC?=
 =?us-ascii?Q?AhTHQjU3c6s2lXJsWFT+dvcR6MO+ljXHP0bx77gvJ757xUmN0D0iP/+mw0VX?=
 =?us-ascii?Q?NjiV7asKMqQww/b1yaKRWFuyct/c8yuz8XodzyL8pdV5Ee0t02bzxBOPsZ23?=
 =?us-ascii?Q?XqLNkjAZSHZ1eSz5WErNYg46Uw33qxWw02tULx98XWhYMzyzufUIn3F00h3f?=
 =?us-ascii?Q?TUipwbCDYJKT28IcMpCIvk5UKWQ2cqNiighQKv7ZB5xcFY1l6MAG5SrghRYv?=
 =?us-ascii?Q?XQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7026be14-2cca-48bf-5d75-08dc5d463645
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 12:18:51.8877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81tJmjxzcczf5eLwAocAWCxaL4Ln8xhIlKQvm/Hl5G5LcFhNCTZHMFWFnldpUtubwapN8jheTsltltM5F+An9OgH1JENQynB/QoEOvLzeZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8404

Hi All,

What about modelling VBUSEN as a regulator?

USB phy ctrl driver shares the resource to VBUSEN regulator driver
for enable/disable VBUS and PHY driver uses regulator to control the
VBUS??

+ DT as it involves different modelling

Cheers,
Biju

> -----Original Message-----
> From: Biju Das
> Sent: Tuesday, February 27, 2024 12:03 PM
> Subject: RE: [PATCH RFC 0/3] Support VBUSEN selection control for RZ/G2L
>=20
> Hi All,
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Thursday, May 18, 2023 4:57 PM
> > To: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Biju Das <biju.das.jz@bp.renesas.com>; Vinod Koul
> > <vkoul@kernel.org>; Kishon Vijay Abraham I <kishon@kernel.org>;
> > linux-phy@lists.infradead.org; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Fabrizio Castro
> > <fabrizio.castro.jz@renesas.com>; linux-renesas-soc@vger.kernel.org
> > Subject: [PATCH RFC 0/3] Support VBUSEN selection control for RZ/G2L
> >
> > This patch series aims to add support for VBUSEN selection control for
> > RZ/G2L alike SoCs.
> >
> > As per RZ/G2L HW(Rev.1.30 May2023) manual, VBUSEN can be controlled by
> > the Port Power bit of the EHCI/OHCI operational register or by the
> > VBOUT bit of the VBUS Control Register.
> >
> > A reset consumer(phy-rcar-gen3-usb2) needs to find the reset
> > controller device and then call the provider(reset-rzg2l-usbphy-ctrl)
> > to configure it.
> >
> > Please share your thoughts on this patch series.
>=20
> Gentle ping for this RFC series. Is this series is in the right direction=
?
>=20
> Cheers,
> Biju
>=20
> >
> > Biju Das (3):
> >   reset: Add reset_controller_get_dev()
> >   reset: renesas: Add rzg2l_usbphy_ctrl_select_vbus_ctrl()
> >   phy: renesas: phy-rcar-gen3-usb2: Control VBUSEN selection
> >
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c |  9 ++++++++
> >  drivers/reset/core.c                     | 14 ++++++++++++
> >  drivers/reset/reset-rzg2l-usbphy-ctrl.c  | 27 ++++++++++++++++++++++++
> >  include/linux/reset-controller.h         |  9 ++++++++
> >  include/linux/reset/rzg2l-usbphy-ctrl.h  | 16 ++++++++++++++
> >  5 files changed, 75 insertions(+)
> >  create mode 100644 include/linux/reset/rzg2l-usbphy-ctrl.h
> >
> > --
> > 2.25.1


