Return-Path: <linux-renesas-soc+bounces-5757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB48D6EB7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2024 09:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 323861F24BCE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2024 07:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4DC17C8B;
	Sat,  1 Jun 2024 07:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="l6oxzkAE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2058.outbound.protection.outlook.com [40.107.114.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5A11CD23;
	Sat,  1 Jun 2024 07:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717227638; cv=fail; b=skwoYrs2bT4KxlIzoZSG1f6cTAjqPh+sOl6Nm0pQeGOdzm/qFtlHpMEBitAO9yJEsOhcMV1Ya0Na1mXVOtMynxaIG77Z77vENrvN3RzezchgDfHSvMUXKH0+E133p3ASx5cLtnrWenqzBagxiNjngOQpXfmNCjiosBfiW28fbUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717227638; c=relaxed/simple;
	bh=VoQHMj2dE+xoGUDG7v7eD3cMC5J3a1EBCBGjFVbxARs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h1anzW7NcuzUas+5wJSadbE6uw7bZHMP7dA2BizN7BakW1ilBZnbYpnG3XwZQdxTSG10FHm/5VXvJDI2tzmJqB4EkzjMb02ydj9YZ1f4vl8yDaS3f4v5L+Sc5YRm0CsYKjrZEq1xGQwc75PDHLRtXUwUor2JQTZ61DjELYyfai8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=l6oxzkAE; arc=fail smtp.client-ip=40.107.114.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdQOv3jEqfZ1oUdX0wqEY3KntzDvlamFnaEv2m2oSySmTjFVuN6xeZxcygWRo9fdseyWqMaIIXWH60vUem/EybnBvfHnCL1ErN4YwWFKb0ljR2xo0CK3MnlnJxtFW3oFCqcX6U3KKoIbL3PueRPErTpCS1WOlW+d6I2PwXYv6dgssv5oxW3P6NQzh0cDH4hFYR0C1dIuAMwpdWSK2ZWr2npbCHRzm8ng4o50JC0kYJU8mI1E90ZcFZCtfvnCOBImIlED1whcF7TxFk8U6mH55m90ZFYotqXqwkWCnddmlR4wCtBplQS+GkG7vI2OghAIMacy6hDuu+zfgErsNCHpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoQHMj2dE+xoGUDG7v7eD3cMC5J3a1EBCBGjFVbxARs=;
 b=PLexLn4pYVHVzA/8xid0RAD094q+qZGbCuW5GRyXW8Z4YJ7Xkz2t00Pj5SsLBLfC5jWsdPGEy/5UutF9nwcvxr1vjKvnERI23DgsTHPhGA7jmHI7E7Qbqfzx6bVuIVZCbWpm97R3Oh2ao+FzRiW58qPsnktt5H8cD2FIQi+Of+84Y0dSZA8sJR4mLougHa6FLAJ/FbJ337Kf9qfwPtwyoFHW5xoehrDxynZ1uKDWmcElAnIJu6mNtncZThtf6F4s1lrtObpW8aqpwK4bgd3wSE7lsyQFqG+0Ti0v1TR18b2QShq4vcH1iOS/iCIAR9WbB6k2qRGB25WOQZxjP3EHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoQHMj2dE+xoGUDG7v7eD3cMC5J3a1EBCBGjFVbxARs=;
 b=l6oxzkAEEnAaUUbE7TAR36sbXIRia7bJOquy7VU/cudm19f43iftEwI+Dds6AGPDZd38h7zto1qm7ttIOGKLMqlt0CIcPX6HCJ8gycS2GU+cQardurnFzmgC7GvYQqZgIX89VODnMPjuDgOHr8AunSFNVq609Jf2knz0wklPv2I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8540.jpnprd01.prod.outlook.com (2603:1096:604:19e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Sat, 1 Jun
 2024 07:40:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7633.017; Sat, 1 Jun 2024
 07:40:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] clk: Add clk_poll_disable_unprepare()
Thread-Topic: [PATCH v3 2/3] clk: Add clk_poll_disable_unprepare()
Thread-Index: AQHaeSSsvgiCzcsApEKP+Bm4jHTQr7Fk7WAAgE4MhqA=
Date: Sat, 1 Jun 2024 07:40:29 +0000
Message-ID:
 <TY3PR01MB113468D77B698983F525AA3B386FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
 <20240318110842.41956-3-biju.das.jz@bp.renesas.com>
 <ZhlWErZjizEc5bm5@shell.armlinux.org.uk>
In-Reply-To: <ZhlWErZjizEc5bm5@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8540:EE_
x-ms-office365-filtering-correlation-id: f7638447-de25-4b4f-25ef-08dc820e1c81
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gWnLh5DyrV0gtPSohNRCifotN1vGulb3YsqDGU7FEXqk6r0hDeN0DPW4GL/v?=
 =?us-ascii?Q?EB4He6wG4qLiXP/Y0DlLsjb/dM705S8PJoR6/8PhzUZUxdjTrheX+vzokaH+?=
 =?us-ascii?Q?lT3Goyp1JUtugkA6W7/slnBzTjJX/NSfJBGasysVMCIt/aT/Eh4TLHt378iX?=
 =?us-ascii?Q?esc/nOqQlF/EP9J9ptkSuXfXjo/abfZI1fcPuACRX8MDs3baC+SLpJsFrov0?=
 =?us-ascii?Q?9c11NDa07F1N8We8UoNUveKGqfiQ9VwlNlEdtsqMOtFxgGgkEypHC5fVpnWn?=
 =?us-ascii?Q?zSW75WEnah01BSxYvMWhytnibglpQv3U7oUoBHvxs5kUjJgDiOoI7X4YOfiz?=
 =?us-ascii?Q?RYMj7fO2/rZ31iQmo32LTqZmTqBQYLSrnTRI8MNAOeoC2SClhNwqzOS+uDFf?=
 =?us-ascii?Q?LBW8wxv/3No2yTKP4tuVLY69gv/7sJPcVQukt5qghpaj6ovBJAdhEsBX0nAT?=
 =?us-ascii?Q?6sLpWsO1GvroWnQAYJU0TC+i7aeNK4lg7dW7bUPEdjALdNXPEQBNzmcMBllp?=
 =?us-ascii?Q?eOWyBDie09AY8TRn2nk65AXXIlWK0NZS8VHYs9e7Ewe00SQKxSsVpsJxWpUo?=
 =?us-ascii?Q?jbDhnFskO37fwKl21KQEtSXwpLnM0BGLxUxr9ccvmqa+Cf8N8K/SukWSvYhP?=
 =?us-ascii?Q?wcEJ66ywyENX7mzXnB3w+29N4WCbhEgXxxpQf0GloUfeJTxizTNmKZcPrsiz?=
 =?us-ascii?Q?7nIhU7G3N99aYdx4WoUk4lLUHF+gN+p8hP/pBydJhRgfyoy4exEn8CQnnvs5?=
 =?us-ascii?Q?J9Wa2ECFTG9ZlkRPfZKgnjNm3zWpKxfDXV+Z5RTfd5FAUDeKFUW/Erj4Nsi4?=
 =?us-ascii?Q?hDxBwMbdqS7jKJNv4owUWa0aoKfy5efEY2Bjw1iAR8gb4s7G9PB5MoKfcnw2?=
 =?us-ascii?Q?cgrRtU+yIactaOzCFSmZt7t4LsQwtTeaCkeqdWPW46slu+cUll88n7EoXhaE?=
 =?us-ascii?Q?ZWOHf35tIEGtCbVsI4UEk6ybt6sikXKrYS/FTKaqGQ1KD8TyRO6DDDcCCVI6?=
 =?us-ascii?Q?stZ52wFIrw3ZVWM3qxgqn2x2qiA+sq6TLVA6Q/8nFdXZ7V+bE+4AuQNkwzow?=
 =?us-ascii?Q?jbUwzDACCeeJL7yfeHIJOyfutUCdddWQpUE0KcdTraM062j7h8KCzjlPX/xx?=
 =?us-ascii?Q?nHK6nHHpOVqH55/rL2K470pqSGsjabx3GqQeOVvGoGZWDJ+Fk0ObKiiQo3m4?=
 =?us-ascii?Q?6CysrtCVTDkTqjjWx45OKOOjzMyn9PUUSr8UKTtdCz0pXdKWJ/s7TgTca66U?=
 =?us-ascii?Q?XvbCqxqaCQazER7j08pWmB0JbCmob1k2sfvJ0XRzNt2ENcfhrZHwM2WjrTMy?=
 =?us-ascii?Q?Saq4nbnTQVbnmCAwSSTl6iNkksoUTbofZbKWziHu4KkLNg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gq5AYM646kWuQLxCtga03Ej6N87+rwh/yei21rf8ScFXZ7Tt1wN9vI6F/LTW?=
 =?us-ascii?Q?zz2Xxx8nvy4LxyoYGEJ/3gVTzwjNeqJupxxT7QxLYRKXe3C8bKE3oRiLuiRZ?=
 =?us-ascii?Q?+qOklzWUPj7eArp7NCkMWNXwK2Cdz+J/jsN0Sq7Cve1MLfog26ATJCCPIwY6?=
 =?us-ascii?Q?0+qeMx1TIxvmUCbfO4fWVRQKStDCSsIC/4kxTn4lk0FNBot8Xhcyzi2QOtU8?=
 =?us-ascii?Q?j4i11FQz2EzjFROYurOryaisuY/NreUpM7jU7/7ZIcJEPEWR9JcMZ9YcTFD1?=
 =?us-ascii?Q?JFdbjPW8Vy7r+6F5yNVlSF0N+8/zGFDlDmjM4QbGodLQ/jgy0CB209CFetbv?=
 =?us-ascii?Q?9g4VUBEEQmvv3j+N+6oaUY4hYK4bviaBb9kHvdj9D1Oy6eBisg00UR/g2+M6?=
 =?us-ascii?Q?zxnavJzdE5w+XurOLVOSFFZZMUxmiIDw4RRlhBbrIB8DrhREcCjwexkg0DtT?=
 =?us-ascii?Q?dWKFQw4J94qTDAZW3JeUQZaYb2L3x/kt+PIPbz194Y5k0mV0j2/LtHKlgcRG?=
 =?us-ascii?Q?xouxRRhQ9R6htiiJx/tujT1luMChg75BS7BLp7zF1XU3baHA1+teE7FBtNrl?=
 =?us-ascii?Q?bZO0Fvf8xLoqME2sa50duIt+Xr+SErGIRiFh2emndXoHQvqS6KoWxI09Acq1?=
 =?us-ascii?Q?zHs10sEYyKbrDJLDXYxGVi+fv7u3yPPzu5r8LLov2BjIF5GskQDG0MmONEey?=
 =?us-ascii?Q?tlP7io+NkRD4oXle/bLu1vQCyai4R9z5EwPwkWKhkLIHQc5pDRDUPLeVHH/H?=
 =?us-ascii?Q?6LxLOwH3K9Z5iXvCkHElsfbXYSjwhrD4OEhtEulxWze4R9rblvjzw4a13QLr?=
 =?us-ascii?Q?aX1gNHOiUwCiXxRF5VwhLVEC+5YZw3F1gvRzids1U8C54WEzSoy94rBCPtuY?=
 =?us-ascii?Q?4k+9NkTlf5I5o6GkfAtWx9FeBgMXarjiGf5eg+VphKHXsJnrCCI7EptEC8tN?=
 =?us-ascii?Q?xfhV9gwFFpjaB48Bvz+LMlru2Vbw3vSXE8PbIO01olM/Y9h7WOeUM63wY7ZS?=
 =?us-ascii?Q?OOiKyLi2yV6NuYbnohntE7sRHlebZIAipNR40R0tMHZg6Rci9ylLHnyxhwr4?=
 =?us-ascii?Q?Tocw03K1tdg4Dp9CUepddKG1pPa0YVw8jQZprVqtco+mN+JNzTIALjORcQ+X?=
 =?us-ascii?Q?rSH9L0RhkacHmwM/jW6fSOXKFT3DYf4vi6EGAtDRz9DsAqyOaFd4hKVRgHgt?=
 =?us-ascii?Q?Qu70w1eCwxQYiBl7qDNnENKKD+O17gN2JnzZldOnEqRXu/ZuePmVlSkorANr?=
 =?us-ascii?Q?+H5PzfjMG51KbCcpPPyk8gKSPLKc+cCRMhyaMn6yxh8atQjU1VeHteE812pJ?=
 =?us-ascii?Q?RUWBiXbRlUxCEtCwQwbCdO4eE2jBaNzLAYr4PNq7xUGitIhCgaTAfGZfT0OY?=
 =?us-ascii?Q?RETExCQIdvXNlUYPdk6l9ETpNCAJ9fH2nE/1pC4PNrX52Cijvm8zXFxPsFpg?=
 =?us-ascii?Q?u/i2p20GirKnOQc2Wui2nTX0km9ai5VOQDOkt0syKyKeRzaiW6G1L8H+0Rub?=
 =?us-ascii?Q?k63jms+Ta+ZHHxq6U2s+zYVV7ype6oXjqqpjX3+s4NHjEvLrIS/CoI1+5ukg?=
 =?us-ascii?Q?9zZqdzddhMnU/cNdq1F25cuZXWuZad/276Ow3tsR4FP68AAyQKvgXO6l94z0?=
 =?us-ascii?Q?wQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f7638447-de25-4b4f-25ef-08dc820e1c81
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2024 07:40:29.8918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6k5CekTmLpPl32YRkh2OvTyfosbyIjDQbeBifRbJvKIzpacAMMjKUp2h4enXF0z4Xqms6KcFGkEzIxjoQKuQApjXJyJHqGX5w0AfovzaJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8540

Hi Russell King,

Thanks for the feedback.

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: Friday, April 12, 2024 4:41 PM
> Subject: Re: [PATCH v3 2/3] clk: Add clk_poll_disable_unprepare()
>=20
> On Mon, Mar 18, 2024 at 11:08:41AM +0000, Biju Das wrote:
> > The clk_disable_unprepare() doesn't guarantee that a clock is gated
> > after the execution as it is driver dependent. The Renesas and most of
> > the other platforms don't wait until clock is stopped because of perfor=
mance reason.
>=20
> I'm not sure it's "because of performance reason". It's probably more tha=
t it's not important for
> functionality.

Yes, It is not important for functionality. I mean "performance reason" bec=
ause
the system can enter into suspend state very quickly and thereby saving the=
 power=20
of the whole system during suspend process(as we don't need to poll for tur=
ning
off each clock during suspend as it is not important).

>=20
> > But these platforms wait while turning on the clock.
> >
> > The normal case for shutting down the clock is unbind/close/suspend or
> > error paths in the driver. Not waiting for the shutting down the clock
> > will improve the suspend time.
> >
> > But on RZ/G2L Camera Data Receiving Unit (CRU) IP, initially the vclk
> > is on. Before enabling link reception, we need to wait for vclk to be
> > off and after enabling reception, we need to turn the vlck on. Special
> > cases
>=20
> "vclk" not "vlck".

Will fix this in next version.

>=20
> > like this requires a sync API for clock gating.
>=20
> I suppose this is fine for clocks that only have a single user, but this =
is highly undefined for
> clocks that could be shared between several different users, since it bec=
omes racy whether another
> user of the clock has enabled or disabled this clock.

Agreed.
>=20
> I think this new API needs to spell it that it is not for clocks that are=
 shared.

Will document the new API for exclusive use.

Cheers,
Biju

