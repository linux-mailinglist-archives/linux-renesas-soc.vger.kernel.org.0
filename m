Return-Path: <linux-renesas-soc+bounces-13744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E183CA465D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 17:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0882B17CA40
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 15:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CEE21CFE2;
	Wed, 26 Feb 2025 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Z2nL4ldM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E670F21CA09;
	Wed, 26 Feb 2025 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584968; cv=fail; b=cGubhB0t/deEHSLrliuLBVaoAS40Ly+8xJdruDcdtcgHOtvdM7XvjaU6EoM20cKVfZ47ytLRSBQIW2WW79URaJMqu4oGGVfhDN1zHRVDbidqDry+MjtKMQXrw/KBNczwOUoYYZeotmWzz7byFlGvUm3w7KKBgI+ivYaXM9DVAZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584968; c=relaxed/simple;
	bh=Eepiv8ICOw6VCdIQMx5jDY3juWPDW9ehGyXgu/buhXo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eElNtd8yEHRBQ/7ig/8y2UlxnuSGzzLtZpUINTq5HBD4rE2d/uE4t3H0n3jpdAy/rsYeP7Lm6zfIE9YRq1ilnLd8x8MqBX53EKkRX7peYvByZnlvXsbjdbqV/STNt+sZmOSUkBh/IIFfd/pyM/ypgRaeELhqSoy/TAuk1LvU1to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Z2nL4ldM; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmxyaBLfF+I/WMdDAz+A/QABQGpCENSP6VWEzl+g9LRiMIU96J0xPKEBRh7cJhwyxKYGPlRG+rVUabydkMvynZl2eL3l9IDh13grvlaNOQVACapwNnseHncqcXg4Dner89FsIeGEjqQ95N7JX+m0303ehcUyhjUgw3sJmw8FKle/palWZPEXucOum8mPEv/D9/85B/qy5fNbBU5AHt/I4ybk2GBInVKKxp5uWuSnESF1yMOY4y/AXyMGZwpnjRpH3Xh8Lc9rnwQqC4t9KidnTsDDBOQMZksaNL20KVEp7e3rjH+bKmrJsY2DVCPBgeM4ZQArOHhIVPhMwJoNQHX6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5P07I7qJFOWeNV3FFRAOpZql673rM8Gs4QSN3kq7FI=;
 b=O/YqXQYpcOUJzP4BNP6ma1IJmnqC76eJwCOBqTEMZnVuW74edWgQCiyWnAebmxkb1tV+zq52BCAy2WXgPJl/T3GeFkRJK/3VOr1/zByQFKoru57QFjBipVjVxGzFIu978n7/haZnOxIrTKbRUdt7oTkHN4kfCqgB8IGtvbtTkuYtnj5naOUz8lrLWPuEvwf39IRxT4djFCIzFiSh1SjB3DmmOafI3qquKH+O6eH3ASBfJcxhn9ByDboUQOy04ZfqQwkDXGZK23t+v46r1Z0Md/qxg3tUbWguMJ2AGc3hGzBymJVFdwLHdSjRz1nI2ZAyNQLJNSy/s8A8u2/frpepGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5P07I7qJFOWeNV3FFRAOpZql673rM8Gs4QSN3kq7FI=;
 b=Z2nL4ldMMwgZiY49fq2FVyOdrU6l5YTE7lgf9UgGtx7yfnMw+ecf9WH9aaZuq1ApWq3QeGJ5YpqpCRX1L1KApppwXfGpuFMGlrSSgIC0B5E2wka2yiUrsNWT8sjEZFAvFHVlLJ90D6LX2PNaUxqT7aa6U6HNhFev3/J+TAf/3Ds=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by TYCPR01MB6207.jpnprd01.prod.outlook.com (2603:1096:400:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Wed, 26 Feb
 2025 15:49:23 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:49:23 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "rui.zhang@intel.com"
	<rui.zhang@intel.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "lukasz.luba@arm.com" <lukasz.luba@arm.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>
Subject: RE: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the TSU
 unit
Thread-Topic: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the
 TSU unit
Thread-Index: AQHbg6wEBHvU/a0YLUuj007LSYfAeLNQf50AgAlEdLA=
Date: Wed, 26 Feb 2025 15:49:23 +0000
Message-ID:
 <OSBPR01MB2775633E8B74FF2857302D24FFC22@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
 <20250220152640.49010-4-john.madieu.xa@bp.renesas.com>
 <174007535477.3240838.6529561683095110061.robh@kernel.org>
In-Reply-To: <174007535477.3240838.6529561683095110061.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|TYCPR01MB6207:EE_
x-ms-office365-filtering-correlation-id: f7c2152b-bdfe-49e2-edd7-08dd567d240b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TwOBR55CHx6Y5c0TVGjPq80yeBwRd7bRGBW49tMXkwQkirmiaCFUEvayyESL?=
 =?us-ascii?Q?+HwnUdlLyttJys9jx3k5g+DnXmVEHO316tDJSE0NWPVjlsQRkaCoSuQLsZT2?=
 =?us-ascii?Q?hSRA/ZRUrAMXV7C0hZHGhclCsjZGdYfrZjXemcM8IlxT6Oe6kB9ubuYXqxy+?=
 =?us-ascii?Q?et+rmgtNdkcMbDa6+8ep0Kg2mjSjLHQ/NS//IuNJknm58PrQlZxuNSRt7/ko?=
 =?us-ascii?Q?hAVN4BO4MfUWPkIJ/RJXBycBjQYvG2dL4XOE1zkOjDwAQVJ4eRJMDfCD0VsN?=
 =?us-ascii?Q?pjmNtvV6KiEshqi/la7kv2cj0AAj3RFgBOMkYSSOGmiZRnMVmi281ffjtTJL?=
 =?us-ascii?Q?L2Smo1d8wPD5yRNhNxvHi61cF9AVA6IgJhp9giHmkMOj0VpLG7YSbizufHgJ?=
 =?us-ascii?Q?GK39inD6K6VBA9klCGQRdabRY8tSg9Jhv6umQlbIItUDonxkNkNJIpvHEUNf?=
 =?us-ascii?Q?3zO0Ttcf3AMcquljIjTDFfvkqM26uc5LK/n3+c/MJVx6nan8Buh6AnstQso7?=
 =?us-ascii?Q?7zz8flF1o6lEn9f/rx7h+EQv7IRiAX5W+Yy7OqlveZJqeHfA6jFkIL9Qzz6W?=
 =?us-ascii?Q?uLj4xpvZ082rTsozPzWO5ji7O+uixgLiLnl+J4heEof2i+7zfn2Ricv0qC2a?=
 =?us-ascii?Q?npUWAad6NudiZPVISgUmX/ukx8h09J3q3aFPpNcnhIDvsWu5IMy5hrILRdGZ?=
 =?us-ascii?Q?mWMMW4P38ekQWA2mBnMFIoqnty8hMPlABXs8T6VmqJUluvEIC+k2vkBR7hOX?=
 =?us-ascii?Q?vFmHdGY+kRMWpFzFR4sxfuSZhRIVwtDcyMDnRPWe6AKY6U41dYmEbVA1nkbx?=
 =?us-ascii?Q?Kn4jqfWzASNiTA43TOi4UuRUHSm0ZLRbHvCNboNDFZHRfb6pT6ZIhC9dY7Fo?=
 =?us-ascii?Q?qOIxg6UAnOMizWPFPruoR7NzY42oO/GwJE8goJuqyZiPOZbaG2FFALlM1ZWS?=
 =?us-ascii?Q?TlpciXlgeF2N/PezC/b6X7DSH81xdKo3Mz+ZapWOAZY3S5OtZNvDhfhGStG/?=
 =?us-ascii?Q?OclKzff5BP+LY/Ww4Y+PXJOPsM9HrxGT3+G8CiOL7y1oSS47D4g+D9FJIKmQ?=
 =?us-ascii?Q?errSB7De6Zm54C8EPKMAE5IyFhVDXqSBntQ2b5Jx4IReVdE0GXwY1pmJ0wMp?=
 =?us-ascii?Q?L7ZtPmhF/RKRC/xnOqVlB9C2mKMUnNqJmvLxb61gvTs3wi8Nhr6DN7PmhGON?=
 =?us-ascii?Q?Z3lx0JHpSrughSzHJJ1SR8Nz9kghtB+EgAjMUpcs4y1qJ20qVpDg3weGzft2?=
 =?us-ascii?Q?r7dCa5bQ6stpnjRjnwh44wnF9i31iV3NNDFIu6kMYtWcJco93fNovx/x0GnG?=
 =?us-ascii?Q?1aSThPWusE94fpxWYK85kQF3uFyWdpO5vAQQwM6VTPoc0/wsqFuWHagS8eb+?=
 =?us-ascii?Q?f2JpPw581rMRPkA6CYpHRRRG0od/K9ur99kcbbXha0+A2KL5INZWCBH3Y+Pi?=
 =?us-ascii?Q?aOPSBQAZL9zfhs//43HTUQrAo3VHGrHY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QV/UymXxBWJyk6ozg2rAdozGhX8rYXkq6WI4PC1NUlj/W8MPK9qle7Mt4Q/5?=
 =?us-ascii?Q?xFFQc5t6FlxpNCfaTMMpYqjqHwtAvM2g7EgR8VMJ3GVX66v5eumiIdg+Qxrg?=
 =?us-ascii?Q?13neForyBls7xJnwrxOERyemNY+QS63PkvRZOIrx/abfjAHtiM9ceZjb6E8y?=
 =?us-ascii?Q?Q2NdkSu0WBuYaKNMfTs43oq28PyRALfQyDkEWaZdiYsWib9vecuM9R79W3pu?=
 =?us-ascii?Q?JoorG4Jg6iZGrZhGdfYLrh009JA/NhrV2pxpZ1QS51/6sSpJb1Y1I/9dY2Cf?=
 =?us-ascii?Q?UqPSPcbuXrDL2Aalc/p/TBrVo3mRtPuu2p5dsR5K/1J+e2G9fwQHtM0/B/1M?=
 =?us-ascii?Q?bID6KDbda1I2U75IEPuqViapJ4rUT2HbybnRStwZdIlGoGveSt/hCxCPc/yd?=
 =?us-ascii?Q?mk+cuBedB8/LkuHrAV//YXw9KKb/ntUJM7h2haVJhiAGrb3ie3PmdS+lPQ76?=
 =?us-ascii?Q?g8idYW4n/t9AShSuUw2+ZTpTE0jD0OZBEwuycfNRaLqmnj/OcBEJO3iErsPA?=
 =?us-ascii?Q?m0xeSSHTqDZas20MezjXg+GtD0C+3VYwnRqU4sbli5yaDODPmvkiDUFrCQ6f?=
 =?us-ascii?Q?JvXjeFnE+XZo9tg7xUIVtc4q3+/WHVI7w+aDB39Anss+2oll1Iqsq6f89IUa?=
 =?us-ascii?Q?eJrvCyoGd3Is0VCWVTrIkcW9hZWyD7CgLN5c5++yivlP1C/B06xFVGhGgH/J?=
 =?us-ascii?Q?g8DqRzqTYHEluVqSuO9OUj5XNlTDUek8FBlnp6KxVC9ACltY5Np7NKUlHpT/?=
 =?us-ascii?Q?lj8D3RxvrX5NEajEYRXBDgdjhOk/Mh2dlIuWKIAPONedK9A/m0BOnuMPx892?=
 =?us-ascii?Q?nMyyNfEUh7iwUYJR5zoh/QQCksPkHcPTJGtgGQJqji5Vn1p1t4v/Ut0F4Dh0?=
 =?us-ascii?Q?PCAMws75zP0xee4xJQdau9MZ/eqUSG2WQz0x/wsEysH3Or9m42nMXKidMXDt?=
 =?us-ascii?Q?dAbzjEBBrybXyc8iTPwRp6+k2yjKTkGqTWxD/MD4ovK9FQPWAn4ROFsqA0I0?=
 =?us-ascii?Q?eQ5H5HkP2W2CnfuB2mP488o+DU8xs934oYPaG2mGcu8jTOBmFSG848vg90vc?=
 =?us-ascii?Q?EdmKLTUQjITWtHIsBj87C8wFq9qqesyj68BP+34M4PiH4KemaPsKsWlr6/U9?=
 =?us-ascii?Q?AIkZnS2a4q8b222pL785f9PiEIk7CHNDsm9vJC0ZUwHYrGPPSMBnv2QKyKNs?=
 =?us-ascii?Q?ChW32OIwSEYTXaD/WHpFw7WkCKUczqENH/KIyI+0rm2UXEkYOVT0p0VXSUcs?=
 =?us-ascii?Q?ru03h66vZOXsfCL1w5NoS0N+vug9E28P/hEOK7cy/5PWFK11+MrvwigNZfS+?=
 =?us-ascii?Q?sv3ZmOJVpe4xZ7PsBuiNKyMEOgZ7JyK97PR0YhUEL9hm0sRQgjhr/8Y+krix?=
 =?us-ascii?Q?EKAXngOX/A4gB2OoxZZqNBSKlw+bzUYJpVi3CTgRuc1Jn/nYIMEVkVm+KxgI?=
 =?us-ascii?Q?zOR66v1l3T7rliqnf/lJoTRbGJOtB26Zqe3VDAtEercv0fo5rp7+Zb3nBwPf?=
 =?us-ascii?Q?Fg4YPGMCVpPt5N/1GuDSDgZ1lEK2R4mcPgClFJm8hMtVYDD2vmaKMZK64zA6?=
 =?us-ascii?Q?BGgJ+LuBD6tUXCqdm4UEfhLyDctmD33KGup9f1B54fwGJnrGetDSEk4hzLT7?=
 =?us-ascii?Q?Gw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c2152b-bdfe-49e2-edd7-08dd567d240b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 15:49:23.1636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkwPIaI1S4DFFcWMbURApF8a8z79ezkZX8A6ZoZzuBGFwePrGeWVq/DzpF0lTpR0H3y29g7z9UuULDvqRx0kuHoeZsRZr5wLr+nO9MGDcQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6207

Hi Rob,

Thanks for the review.

> -----Original Message-----
> From: Rob Herring (Arm) <robh@kernel.org>
> Sent: Thursday, February 20, 2025 7:16 PM
> Subject: Re: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document th=
e
> TSU unit
>=20
>=20
> On Thu, 20 Feb 2025 16:26:08 +0100, John Madieu wrote:
> > The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block
> > designed to measure the junction temperature. The device provides
> > real-time temperature measurements for thermal management, utilizing a
> > single dedicated channel (channel 1) for temperature sensing.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >  .../thermal/renesas,r9a09g047-tsu.yaml        | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> >
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
>=20
> doc reference errors (make refcheckdocs):
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade

I'll upgrade my dtschema and double check before pushing in v2.

>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your
> schema.

Cheers,
John.


