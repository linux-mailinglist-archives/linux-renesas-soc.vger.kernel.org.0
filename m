Return-Path: <linux-renesas-soc+bounces-15547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B198A7FC6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 967E87AC0E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 10:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1A526773A;
	Tue,  8 Apr 2025 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ThbX2Bxt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6E2266EFA;
	Tue,  8 Apr 2025 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108819; cv=fail; b=G93+I+PM6JguwGeypY8i0/QD/esK9kwUVYqjyZgg7KNyEfoauicXA3yeTpW2TKMzsRbuMWs1sy23qRltmGzqJK6zCuK0Un8aVj1dTQOlHqMlOn4ZpfGLKaRR0HfLD1ghDa6oqtQ/OG5afUb+2NkeEbDUfBk2wH56j1SOvMHrwLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108819; c=relaxed/simple;
	bh=3PPSI81tJYtYC14x1ZOhKdpci+xlkQ2mCsHPV02GYyE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HQwa/GiXnrU18VZop+dZTcqAzwc+6ozmoko2ktTHY9tPKIkBZoiNniEL0FvOklTq608iO0JQhVYIRxzl3qTrGE2gzsZS0aSNPH94i4VT99Uy1kaZ3S5qlzX4GWNPfmDn6D+Cq1iY6/fF6zzTxjDvi7OBxcirf5mPKYl9EayGLrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ThbX2Bxt; arc=fail smtp.client-ip=40.107.74.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+Mo0BOtQMX0QikU4WTDhg7c3MCKEKmJ8wn4zfjmUpI6P7arx1aKDDs1OcH0mJaB7J1w3ED0lzI3MuhZOXTCojAxlxPzpgijNTD/sSRG8o7pKtxaW42yfJG5MU/ApJtTUgfndzRsZ2daxm1sTnq5vjuE+XJtdz7K4C4oy6LX/tnggDVQFBhcvzDOmRKN+cCWRJQVUMh4ebG2wZm0xBnOY4OO1JaW5WU1EzsMifG0GABu1/x14NmGyVOXm2CgsjjdDLp5GtBQ6lRaQoLY3Ojt391MxwsdKsgvUUqANh5IjXuBVJ4CIMFZmG96WxkLpD947XndhZhJmnheNcKvID5W4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBJmKEgmnVULFBAKKmJ0GdWAX3JatVibcytPFvfJlzw=;
 b=H0zySMARrWDv3lOn0A7V1gVpcrW31ZHESvzwgPYT2DtrbWF5FovaicgHFb+qp11ggsWNQ+hUcLl8Nlx4u81z+kCo96s7YaJQaso/WRI9JFqCQPXD2d+Ztua8/RR9lObg45Ufh80KF18P2VL4MbgXDeNDz9x1gy6kuSobLIQrAdqOFj78F47RdXsgI722k1l4e8zzAoeR3a43X3RpUZ9hyyLBh971z1/I4FjIlsmeMQS79AUQDrLgdV+1O9J4PL8gmFlu6tzPm3tIR7iCx1hZk+ygH1dt4nz4h+sS58TTLFNYB3XbkdxOlRrerpxLKye7UdWMsrohUoG8oAA84zXxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBJmKEgmnVULFBAKKmJ0GdWAX3JatVibcytPFvfJlzw=;
 b=ThbX2Bxtz5edOrO5DfkQwUNneqovrf7YwGkUTZZ2/DARVnRT3wEpFmxyztxM/PbHvIIAEo7K5rZ/IQCM0rD1/PnuigqfCd+ezwIYX037Svej4gT+pRmYH9Vw997ryOwG96AJsco3UQI7dYFbqOJfQaJJ8mRQsmodAjEDNk6GfmQ=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OSCPR01MB13698.jpnprd01.prod.outlook.com (2603:1096:604:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Tue, 8 Apr
 2025 10:40:08 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%3]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 10:40:08 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
Thread-Topic: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
Thread-Index: AQHbp6raLCyMPN3kxkGUjRK8DG3KN7OZk3vA
Date: Tue, 8 Apr 2025 10:40:08 +0000
Message-ID:
 <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OSCPR01MB13698:EE_
x-ms-office365-filtering-correlation-id: 80e93d04-73cb-47f0-2bfd-08dd7689bb99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1uPg3uodVGn3kclEZukTq6SvcuRFetl8w8DnH9h69kMv5uXrnZPISI4rb+wO?=
 =?us-ascii?Q?DMe/t0Q6c7rUgIaygzDc6CxGPTC11XSlDtaPba/HBLmNhtR2CDp2MSJ+bvLV?=
 =?us-ascii?Q?BWRdhRFQ+E0sreAyMux4Dtkzp18ExNCSZM4Pk3zsDLRHsIAwEmwys7rd1Vzs?=
 =?us-ascii?Q?3pXKXzrQSQQIhwsNMn8Mrw8kZX6ZwZ68/L0o+mXRLytRoBXLSgKg75YlPr1s?=
 =?us-ascii?Q?uPxOcSQQydiPt8bRhQzfJusFbdQDcvLrHM8JUQ1l1gPoJP3MvuMACAp8HvJ7?=
 =?us-ascii?Q?rr7fU0Mvl+yj5a9hlmkLUViHopT1lPredoQxQeOuAlT2Z6h6gfNl2Dgy/SmW?=
 =?us-ascii?Q?D0i99DKMiVymdulhoZMwiBn/isn3DT2mfjPAU9lPMyvqxm+VOEsXf8sEIX1G?=
 =?us-ascii?Q?rhhGgHMAlB7RBLc4hOEDr4P1SBoT466+earRcuLSUWrAi5hqmeao64bLjRmJ?=
 =?us-ascii?Q?ORdvkSuz+9HdqU+Lom/q8XGY0A+xdMj0wKtZ126GQZal7nYL727buRlQsTmy?=
 =?us-ascii?Q?nPkWGWs+G+NvzPZTOL8UAkCK4C82UXbK/FfPYKg2SeYWaO4pPin7CeicPZ43?=
 =?us-ascii?Q?7/oVZ71f7SlataSpRuAzCh3vJxdrDaDd1YqmrQd0pwgntlCo7ukM3O2PV+pq?=
 =?us-ascii?Q?1ZIzsd8q88wHRTPrf4MlTYiIhaCIrqAywCiQz38Tx2BYqdX2EunNO7WNjLB4?=
 =?us-ascii?Q?x2ENCkAEP3fwd3cY6bPo4zZK1ZBpmRLRyb+lOjlg6mPNokIOsrlvwOo2lCoO?=
 =?us-ascii?Q?sCXIUgnSNzCZN7+pGNcZrpC+Fjqu6j/WlnsZtResPaXRv9o8yvIijnP9695j?=
 =?us-ascii?Q?Yvc762ZmNjgVa+JuYAB6y2tpdzPrrpwaBDlzUw4TzvtMB1PEQQo5yTZ/+7Ww?=
 =?us-ascii?Q?9JD5+Amh9t29OvqkCmXFNDiqeJTBYf0GrQOA/XuDuNsBiMqQRXgA2377INwJ?=
 =?us-ascii?Q?YTRuTvV/T9xmEMwHSGp7Vx758k9kiRJ5rbnpUP+CeAJubqNJ283JUWEaOlAH?=
 =?us-ascii?Q?oLJS8ILgSjL0R2hnULWIK2VeAjHk/HKfr1k7GwoxInvDIw6GCFxW+HuJi8Jk?=
 =?us-ascii?Q?JRujGiZDeBjombDiGarnXMZbuFjcA/HTrecAghfEROiLVSaVF2eMaAKbJ6KM?=
 =?us-ascii?Q?hSzQmawocavkFmJyKiHAf3olnvHh1icUS/LwrVRJLdukxvMDfEvAznZXKv8F?=
 =?us-ascii?Q?YQJWbz6iZxe0v3Ebh6m7Vg09nX+r+oufzPYcKyfkPU5kGgbjsvlFWNWXLrY4?=
 =?us-ascii?Q?9qbzQYxDIA8RqeRdU7BTaQA2W54MPQaWirv5KbCtRk7kR1mmmP+WwChOyU8s?=
 =?us-ascii?Q?PGk1in6aNGKBsBS0vdKhKRqsa8hEpzxFeOd9MY6P/Ck/OXMCZwGagdAyau6F?=
 =?us-ascii?Q?qQa31ZiJQEfxm0e25wmYOau+btVvwCsdaSw/NXV66nA94JKjszBQ/OoQ4yMJ?=
 =?us-ascii?Q?2ldWexqtPNmqTuyfPaLPZfbffOS23w8L+hz4Sl6AJqbOJ1t6ku2Iul1JlOxd?=
 =?us-ascii?Q?20J6QwF2c5sNUKE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6CQedeKirJ0OCzpKkertPOERT5QII3/hHVAZFn6Z1U9bJhFSnWQAlc38wt5n?=
 =?us-ascii?Q?gCMgGSrt+R0uPTr8yqciI4bT+fBJR+nNB08BtbxD8mEDPB6HdVR+l2gxw/jd?=
 =?us-ascii?Q?5xmYa09j+1ntmXPKW+MxTWO9kYRrTQu51WTMS3LheBQalN1VORuiV07DSfZ/?=
 =?us-ascii?Q?mmdA+s27giuKlmp9alghiGk3pZwMCteiunSH1mZrs+2OyLxXSSifwpbOpwY4?=
 =?us-ascii?Q?sKfGI67vWUTykkrzKqozXmu82fIty92SuxdgJcbsKstVcIkU7uLTqRz/BF64?=
 =?us-ascii?Q?Ld3b1vUUw3XtLw9dtqHOVI/Yl5rBWdIg7ZR4r0Od6ueh85ESJ/UW2h7jQHMb?=
 =?us-ascii?Q?7fuIIQ+ABXHWI5FhA0SqFuNxeW8VcJ3ol4TPFWko3C85GZGM3tIfY72LTNHT?=
 =?us-ascii?Q?PIvJkx2ojS4J2DqGrHsNhH6Sk6gl16ZMjQMWWN7nq/GeiJeD6SSOfrYOx93v?=
 =?us-ascii?Q?O0JVlgIFqiWzJ4N4wAI2MPQfyxvTd7/p+0USfNFAW9m0F+XYRG41odU9jtbZ?=
 =?us-ascii?Q?M6hHNCrQHU9wIE76QpFeYpacMEpm5SUnWRLng2lGY+gvp21s2CHBGCwLHLuj?=
 =?us-ascii?Q?lR9t134/PXtSAvDyyCnS4RjKOEdH3gSSG3U6JHJUdtgCEuKSt8HhUJ1PiqzN?=
 =?us-ascii?Q?ZR+gXx2vQyLcjDHpW2vVx7NWkcmkX0ZG6SH7T30xB3A+qJcZ1njH01fwmzHX?=
 =?us-ascii?Q?nSRyx3yssTZvNYZHgY/Q2KsZJoUbOjo1z81H77FwyKUMqm2odyocVASk63L9?=
 =?us-ascii?Q?DEXFDg46BD7Xnjuk+TqbOqi41pusRbg5ThxO5ss6wO0i6ObmVlQ7HKiyht95?=
 =?us-ascii?Q?9mzDe3i+WdpWDte/rrN5mR1balDcrLa6+QC2iBXQp6wlvCHn2SYXjcDCJmeX?=
 =?us-ascii?Q?+5XHSS7DPmGF1JxuceuihXFFOQPNPJEZb7yeWM78NPrE/PuPvT9HnrW0vJSj?=
 =?us-ascii?Q?zkC0eh+9oqqh/ZntmZuIhudLC1Fr1a3CDUWBW55BiQyDvgG1Rvr7uP/HqYkV?=
 =?us-ascii?Q?IgkfQYSKAv2judty2wmoiY2RXUAMvvRyVj11syDyO2qX+muC4HI29suAaxyJ?=
 =?us-ascii?Q?bF/gmJYaww6ZgHg1LDkiFYS2QlMI2oIqQehcLfaBhP0r2X3np0dCOKVQXwZw?=
 =?us-ascii?Q?7tmlJdUcc0Igvyk0Eq4rvxiKmONvi7kn3n+ziLRpdtiWvUYgxY2Th/Y2hDQc?=
 =?us-ascii?Q?XT0WSZap1Lm4JwMvo38mMWkMd/4/Ry8w480AlEqTFlPspgqfMfpIWRa1qrc9?=
 =?us-ascii?Q?bIhQdqbF0c4/AnrBAYk9sa9iabeQiAyBZ+Kq6Y37wHQBPXwL75i57XclX+HW?=
 =?us-ascii?Q?Z7eSE7925QP2w6OyTIlbYTUAkK6MzYoFlSvO1rska77PyO6BLQN86OHUZcnt?=
 =?us-ascii?Q?hyv7KYGK68kqUltp5XANlbaFBDfueZik9YEfoW1sndB6CfgcO2NgF/4qPKFh?=
 =?us-ascii?Q?iV5yk7m+drK14REcE20aQu47gzNxHwppHqbxCjja12emaQ9zS2YxLqRGRdKD?=
 =?us-ascii?Q?er971/plQbms28VM6OsT2i4cAH05LMq9GtVcquDsdzSc6dcx+bSl9fNijEWR?=
 =?us-ascii?Q?EgDzyYS6C0IAKSpihGYYjemGA7D+XISP8AVRcVfLRmbyPAna94EscKFmkoKO?=
 =?us-ascii?Q?rI5lPIV0BYPDOPtvygQleAk545eqfs7RvH0+sw8/hxady99DfZAK+UT3Qshc?=
 =?us-ascii?Q?5fQ7Hw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e93d04-73cb-47f0-2bfd-08dd7689bb99
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 10:40:08.6039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zrRWXte5RWjAl/nSqUPtrRWAgD9SzIvZ3m6NEJ8AMtYWJyIxwd/F3irqx3ug73O3Vl4dQJzAdXfL7wde71XYQo2Zurf9arqWG81f6sl/8FLKi87Xe2LqXrVFbgWPigqj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13698

Hello Prabhakar-san,

Thank you for the patch!

> From: Prabhakar, Sent: Monday, April 7, 2025 7:50 PM
>=20
> Reorder the initialization sequence in `usbhs_probe()` to enable runtime
> PM before accessing registers, preventing potential crashes due to
> uninitialized clocks.

Just for a record. I don't know why, but the issue didn't occur on the orig=
inal code
with my environment (R-Car H3). But, anyway, I understood that we need this=
 patch for RZ/V2H.

----- I added some debug printk -----
<snip>
[    3.193400] usbhs_probe:706
[    3.196204] usbhs_probe:710
[    3.199012] usbhs_probe:715
[    3.201808] usbhs_probe:720
[    3.204605] usbhs_read: reg =3D 0
[    3.207754] usbhs_write: reg =3D 0, data =3D 20
[    3.211941] usbhs_probe:727
[    3.214738] usbhs_read: reg =3D 102
[    3.218061] usbhs_write: reg =3D 102, data =3D 4000
[    3.222697] usbhs_read: reg =3D 0
[    3.225845] usbhs_write: reg =3D 0, data =3D 420
[    3.230118] usbhs_write: reg =3D 30, data =3D 0
[    3.234304] usbhs_write: reg =3D 32, data =3D 0
[    3.238489] usbhs_write: reg =3D 3a, data =3D 0
[    3.242673] usbhs_write: reg =3D 36, data =3D 0
[    3.246859] usbhs_write: reg =3D 30, data =3D 8000
[    3.251312] usbhs_read: reg =3D 40
[    3.254540] renesas_usbhs e659c000.usb: probed
[    3.802010] usbhs_probe:690
[    3.808677] renesas-cpg-mssr e6150000.clock-controller: MSTP 704/hsusb O=
N
-----

> Currently, in the probe path, registers are accessed before enabling the
> clocks, leading to a synchronous external abort on the RZ/V2H SoC.
> The problematic call flow is as follows:
>=20
>     usbhs_probe()
>         usbhs_sys_clock_ctrl()
>             usbhs_bset()
>                 usbhs_write()
>                     iowrite16()  <-- Register access before enabling cloc=
ks
>=20
> Since `iowrite16()` is performed without ensuring the required clocks are
> enabled, this can lead to access errors. To fix this, enable PM runtime
> early in the probe function and ensure clocks are acquired before registe=
r
> access, preventing crashes like the following on RZ/V2H:
>=20
> [13.272640] Internal error: synchronous external abort: 0000000096000010 =
[#1] PREEMPT SMP
> [13.280814] Modules linked in: cec renesas_usbhs(+) drm_kms_helper fuse d=
rm backlight ipv6
> [13.289088] CPU: 1 UID: 0 PID: 195 Comm: (udev-worker) Not tainted 6.14.0=
-rc7+ #98
> [13.296640] Hardware name: Renesas RZ/V2H EVK Board based on r9a09g057h44=
 (DT)
> [13.303834] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
> [13.310770] pc : usbhs_bset+0x14/0x4c [renesas_usbhs]
> [13.315831] lr : usbhs_probe+0x2e4/0x5ac [renesas_usbhs]
> [13.321138] sp : ffff8000827e3850
> [13.324438] x29: ffff8000827e3860 x28: 0000000000000000 x27: ffff8000827e=
3ca0
> [13.331554] x26: ffff8000827e3ba0 x25: ffff800081729668 x24: 000000000000=
0025
> [13.338670] x23: ffff0000c0f08000 x22: 0000000000000000 x21: ffff0000c0f0=
8010
> [13.345783] x20: 0000000000000000 x19: ffff0000c3b52080 x18: 00000000ffff=
ffff
> [13.352895] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000827e=
36ce
> [13.360009] x14: 00000000000003d7 x13: 00000000000003d7 x12: 000000000000=
0000
> [13.367122] x11: 0000000000000000 x10: 0000000000000aa0 x9 : ffff8000827e=
3750
> [13.374235] x8 : ffff0000c1850b00 x7 : 0000000003826060 x6 : 000000000000=
001c
> [13.381347] x5 : 000000030d5fcc00 x4 : ffff8000825c0000 x3 : 000000000000=
0000
> [13.388459] x2 : 0000000000000400 x1 : 0000000000000000 x0 : ffff0000c3b5=
2080
> [13.395574] Call trace:
> [13.398013]  usbhs_bset+0x14/0x4c [renesas_usbhs] (P)
> [13.403076]  platform_probe+0x68/0xdc
> [13.406738]  really_probe+0xbc/0x2c0
> [13.410306]  __driver_probe_device+0x78/0x120
> [13.414653]  driver_probe_device+0x3c/0x154
> [13.418825]  __driver_attach+0x90/0x1a0
> [13.422647]  bus_for_each_dev+0x7c/0xe0
> [13.426470]  driver_attach+0x24/0x30
> [13.430032]  bus_add_driver+0xe4/0x208
> [13.433766]  driver_register+0x68/0x130
> [13.437587]  __platform_driver_register+0x24/0x30
> [13.442273]  renesas_usbhs_driver_init+0x20/0x1000 [renesas_usbhs]
> [13.448450]  do_one_initcall+0x60/0x1d4
> [13.452276]  do_init_module+0x54/0x1f8
> [13.456014]  load_module+0x1754/0x1c98
> [13.459750]  init_module_from_file+0x88/0xcc
> [13.464004]  __arm64_sys_finit_module+0x1c4/0x328
> [13.468689]  invoke_syscall+0x48/0x104
> [13.472426]  el0_svc_common.constprop.0+0xc0/0xe0
> [13.477113]  do_el0_svc+0x1c/0x28
> [13.480415]  el0_svc+0x30/0xcc
> [13.483460]  el0t_64_sync_handler+0x10c/0x138
> [13.487800]  el0t_64_sync+0x198/0x19c
> [13.491453] Code: 2a0103e1 12003c42 12003c63 8b010084 (79400084)
> [13.497522] ---[ end trace 0000000000000000 ]---
>=20
> Fixes: f1407d5c66240 ("usb: renesas_usbhs: Add Renesas USBHS common code"=
)
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/usb/renesas_usbhs/common.c | 50 +++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usb=
hs/common.c
> index 703cf5d0cb41..f52418fe3fd4 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -685,10 +685,29 @@ static int usbhs_probe(struct platform_device *pdev=
)
>  	INIT_DELAYED_WORK(&priv->notify_hotplug_work, usbhsc_notify_hotplug);
>  	spin_lock_init(usbhs_priv_to_lock(priv));
>=20
> +	/*
> +	 * Acquire clocks and enable power management (PM) early in the
> +	 * probe process, as the driver accesses registers during
> +	 * initialization. Ensure the device is active before proceeding.
> +	 */
> +	pm_runtime_enable(dev);
> +
> +	ret =3D usbhsc_clk_get(dev, priv);
> +	if (ret)
> +		goto probe_pm_disable;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		goto probe_clk_put;
> +
> +	ret =3D usbhsc_clk_prepare_enable(priv);
> +	if (ret)
> +		goto probe_pm_put;
> +

Did you really need to call these functions at this timing?
IIUC, usbhs_{pipe,fifo,mod}_probe() will not access any registers.

>  	/* call pipe and module init */
>  	ret =3D usbhs_pipe_probe(priv);
>  	if (ret < 0)
> -		return ret;
> +		goto probe_clk_dis_unprepare;
>=20
>  	ret =3D usbhs_fifo_probe(priv);
>  	if (ret < 0)
> @@ -705,10 +724,6 @@ static int usbhs_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto probe_fail_rst;
>=20
> -	ret =3D usbhsc_clk_get(dev, priv);
> -	if (ret)
> -		goto probe_fail_clks;
> -

If my understanding above is correct, I would like to add some functions ca=
lling around here
to reduce modification lines.

Best regards,
Yoshihiro Shimoda

>  	/*
>  	 * device reset here because
>  	 * USB device might be used in boot loader.
> @@ -721,7 +736,7 @@ static int usbhs_probe(struct platform_device *pdev)
>  		if (ret) {
>  			dev_warn(dev, "USB function not selected (GPIO)\n");
>  			ret =3D -ENOTSUPP;
> -			goto probe_end_mod_exit;
> +			goto probe_assert_rest;
>  		}
>  	}
>=20
> @@ -735,14 +750,19 @@ static int usbhs_probe(struct platform_device *pdev=
)
>  	ret =3D usbhs_platform_call(priv, hardware_init, pdev);
>  	if (ret < 0) {
>  		dev_err(dev, "platform init failed.\n");
> -		goto probe_end_mod_exit;
> +		goto probe_assert_rest;
>  	}
>=20
>  	/* reset phy for connection */
>  	usbhs_platform_call(priv, phy_reset, pdev);
>=20
> -	/* power control */
> -	pm_runtime_enable(dev);
> +	/*
> +	 * Disable the clocks that were enabled earlier in the probe path,
> +	 * and let the driver handle the clocks beyond this point.
> +	 */
> +	usbhsc_clk_disable_unprepare(priv);
> +	pm_runtime_put(dev);
> +
>  	if (!usbhs_get_dparam(priv, runtime_pwctrl)) {
>  		usbhsc_power_ctrl(priv, 1);
>  		usbhs_mod_autonomy_mode(priv);
> @@ -759,9 +779,7 @@ static int usbhs_probe(struct platform_device *pdev)
>=20
>  	return ret;
>=20
> -probe_end_mod_exit:
> -	usbhsc_clk_put(priv);
> -probe_fail_clks:
> +probe_assert_rest:
>  	reset_control_assert(priv->rsts);
>  probe_fail_rst:
>  	usbhs_mod_remove(priv);
> @@ -769,6 +787,14 @@ static int usbhs_probe(struct platform_device *pdev)
>  	usbhs_fifo_remove(priv);
>  probe_end_pipe_exit:
>  	usbhs_pipe_remove(priv);
> +probe_clk_dis_unprepare:
> +	usbhsc_clk_disable_unprepare(priv);
> +probe_pm_put:
> +	pm_runtime_put(dev);
> +probe_clk_put:
> +	usbhsc_clk_put(priv);
> +probe_pm_disable:
> +	pm_runtime_disable(dev);
>=20
>  	dev_info(dev, "probe failed (%d)\n", ret);
>=20
> --
> 2.49.0


