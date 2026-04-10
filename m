Return-Path: <linux-renesas-soc+bounces-31163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJN8Ekwz2WmjnQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 19:28:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 967B63DB0E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 19:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C50D303309F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 17:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB183E1D05;
	Fri, 10 Apr 2026 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Up+GAfIJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AFC3E3174;
	Fri, 10 Apr 2026 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775842028; cv=fail; b=mproCqUS9L6M18lnMk3l85Gp2Zy0N6BgjNYVplgC3IcQvTrqopEtgkWFRMKWD6wWHPNC0qZVjq7rwt2E+0FQOBKAm3RIrd0Gg2TH+cJTr57Cbs7HHwwRxuwljBsOQX3692sJq3pse1h9tMThdRvHoquZgJKvUBneIHQ+Y1OnUWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775842028; c=relaxed/simple;
	bh=EaXhHqJjFTuY6Cg4tMEGOxS07Q5du2fiQ2rhCmNFXh0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rinzxzVb5T0YWydubDeinVclHAhO4Z612qA2Z44/XyNpOrfIWnPAXD8xavOCyEwDxravBtijp52SJQkvcfnC5sKEtOQ8JFS5/5jGzufPeIt5iVZkrYN+X+CTocPgsubL5hbXPK+LihslBXE5LNSLjYYvB9UB9Dw3N0MODwrjZUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Up+GAfIJ; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6wIhfW0nanlRMyAZG8zxzTR2B7OZ04mB8uJotjJDjJMz55BbLdVi7DQq8oP1NKE7JIqlw5QBasodc5uJoXrdkD7YsbX7BnhhD/ROHuFEEyu8G+lACUkO43Gxx7zwxtDxB8t8W2ASAuWlkYdYVfq2xM+QBNk/esUML8uWMQUiDBlLzNjtw4kr/otjQIiTCTE2JwCC6lzpchVttbgnxfQw6iYBk1LKKE3oLolO88+RoK1wTjt9Uip00alKxy+Jnbz9aU1QLfHVhlQ5tJv0XlNMgdWGUtYrxpDg/l0seYZjfhIKEW5jIQ1OcSWlZeO9rEsuvu2WO7ryVR4JEZS7MaYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtRsTVCwcfORwlgx1Rbu48a8kkS0OacAr7dN2oh41ls=;
 b=aaYn+H9NWmysjZPt+cLoPOp7qggPiasX1GXkQg9ZHhGlZUcAV6JWfArN+4xKJ2SlIt5fwMV2AGwaFvUgoSWyHXfM67iul/OtkI2hPns9Dhw7zDpQ/HaSikn9CtXc0FyrpqqRDmgnNzO5EUdY5TR9P3kFHkpRKBZOKjiaegri3X9f8eRjjq0fXE8daTGE0vuZuBytBtm94UJyj5Emhq2sI1K1weCzQIDsOA9oLZZMlJSkuAiUPKbScpetlrXIDmiHikuwltGbVDtD9nC2YYMLy5ARitepsjp/SvTNKyJTkcm2oWFKjcaxyfTwOMFYqaVKc2MF2oyDLSTpNTidR0inNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtRsTVCwcfORwlgx1Rbu48a8kkS0OacAr7dN2oh41ls=;
 b=Up+GAfIJBXldXqfIfKDD+n72Qi27/K9g6IdpiPDz2dptYkJhdnL3aVMXTKrslj2gXoo+3hk7/qIwZ9V5SmYIGxQC66HhEmM4UjC2Ro246lJ+9VpJgj36EQNO5KINz+1WrkPc6mHaVlrfhu/NHUX70NBr+9VuP/NQ+D4EKBhcV+A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB17901.jpnprd01.prod.outlook.com (2603:1096:604:444::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Fri, 10 Apr
 2026 17:27:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.043; Fri, 10 Apr 2026
 17:27:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
CC: Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ovidiu Panait
	<ovidiu.panait.rb@renesas.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Thread-Topic: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Thread-Index: AQHcyPZnBK/SG6spWkirTeqviN9wXLXYYQwAgAABJQCAACliYA==
Date: Fri, 10 Apr 2026 17:27:02 +0000
Message-ID:
 <TY3PR01MB113466D8DD83EC0B48D8262CA86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
 <adkPXI9pz1RCYpJ8@shell.armlinux.org.uk>
In-Reply-To: <adkPXI9pz1RCYpJ8@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB17901:EE_
x-ms-office365-filtering-correlation-id: 53fcd5e5-0bc3-4eeb-7aa9-08de97266152
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 leM6x8TRg2ow0ptjtFCjIGr5BBspPRVykGzzgdT/uchCaMiVBUsncj4VXNOoJScRE7c5SQYZG9ADnYKjs2I7PMx6+xYraDqaztc4WdbTj2w0dQ/Lmt+D+qrVT92jDJaazf4AScvUYaqTNc9DnZ1IQz6AXrvMSR/8m10JZhT/8XF1j5GxGi/HMGzcIR4Tv+qPqG+K5XLsNdE4hLKpilzZaNHUhv/877SVjZzC4EjV6pOlew6Kag+EKdsIzxU4kR7Bw4XESYhRu1dvXevOygealK+26LwnEPix1HiLwQnT6VPDZZhpxy88uiivUhu/yK16ApCVU/ZBwqILaYAwGy60GKpzj6Mvvp/V0LZ2g8IS7nA7+WxGueoS7CPxPU9zGsHygTFOAIj6eAMk9Hmt0cznGOV+sjaAMwG4ScMGa37StNGsAKspwzPFdVZiQ2O7iuxQU+tHCPW1N20GKkrfPS2mcm5+S43nZGEAxX7qcnXpbAKUiZeQSuxr1PpgD4hkZSquT5S0kynefsFtSXKruHGvYbkoAnc2IswAzGC22ir9iJFYEB0nA06yhrNDeKRr0tTjKVkb0FjW5SPsTAzFNzUihtvW7etLOIxq+QMrq0oKZKgQvkAP+gN5fuTEEDkcF1+gokvy2OsEe2YYCQhMSFdj40QhjoRXEhoORaji7IClotmxZzga9nmdqZUgXehquV4xo+6U3z0yHTDrGHmcChPiUKeInupCejma7TKzqgEC+5t3ctQfu+EGpmN4lKr+xgfLF7jX4A092FRRWvqYxUWlQ4JdEeuvNVz9Ch449kseUVU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bnrm7ZsVvmvp1hW4/bgu7QLIyhwBzlKwuDr6hePVNgHLRXAvCBCuAKStzz/r?=
 =?us-ascii?Q?FD6g8TpgVGiacOKh5LCZJrknUZuZVIT21bbfuWTVXxfwyDsARUZBe3ys7gwe?=
 =?us-ascii?Q?ov5mBctwGiZvk86PXWb0Wabno3juEkcu/HghP9lMcke2s6+UZfBS7Uhd2Oi8?=
 =?us-ascii?Q?6TDM2zg+shJe0cSo7NMALCsmp1KjrMAZeMZ6Cp7YxF6z9CBgInokcAA/siaY?=
 =?us-ascii?Q?7FExW55NVBW56Qo1qc3wAryoQRU0bWr2JcEYybxom4wK1K53jXAoO8Eoxi/O?=
 =?us-ascii?Q?uk5lNnQYmdpMwjZpaV+BEI5MVXoGhkeUQ8SHShFMtCt9SZ1CSQXFcw+pxgLK?=
 =?us-ascii?Q?y9XLAn2SEc8m5gPE5sqvD/N/IvG4JrcK6Qq3gWr/Y/nyrQSpwO01JWN+bTO2?=
 =?us-ascii?Q?iEETJF3mE/uRF4V4vOJITIlWu3MHS3OhmWdDpvUelvhVoRxKRD5KcAZam8Jz?=
 =?us-ascii?Q?z4U0TKyj2EZBkgzMyHRRPOfwLjbK266x/NAVaUn58Raz57Wn87Z5t83XgF3f?=
 =?us-ascii?Q?dYmbWUwAHZOPfmE/w9dmsOV8oHDE3rC/lTT7lbihKDx6BWM7TQJaUcFxMdGg?=
 =?us-ascii?Q?jGMm24rJIhdodvCYOuZPasKZn3aBtYycu31yIRVrPRDudbmW0eXSdxxiD2hC?=
 =?us-ascii?Q?06fCd8A3qVML/SWANDnCW8gQCLvdvRbDxY9qv3zJp13Hx/pdCaLHWNZ70i/M?=
 =?us-ascii?Q?IlF0P6ryaUWmzweVm+61CHSPSj3mjRb2mF62REMQCu0GqVO2R7uMVnobyFMn?=
 =?us-ascii?Q?SwSKYsOpOgT5b7ZWt9bofASrSpf7TNDeTVGyOaA8UFvs9NbE28GwcPqUgaqn?=
 =?us-ascii?Q?bIRqV52Ow9/CVOGuX3w7RbPVWpvItoqQLgi83q0HOvgkm58ml8XVSCjkACBg?=
 =?us-ascii?Q?r8lx5zik553O7TL0OBqZN/YemiscxJH/8iwUAe2TyHD6fRgtCy7z2+F+VxTI?=
 =?us-ascii?Q?Mx/FGYGm6qqWKVuJmQTao2ti+/aBUy01nI+MUgJK1sTs3nxnixUBiIMexe3U?=
 =?us-ascii?Q?RLH6pPXkPiqzuhX86jhRkVMr7EzAkVxCj6sFgKPKaGk3n4e3ILl9smXS4fb/?=
 =?us-ascii?Q?aR9nRUSRokmF/u20fYKrcn/qPBpeWkeGTz/LMTgqjT203YSoyws9YqcMhdAC?=
 =?us-ascii?Q?1DZgtNZOIjPL22TdTvP6Tzy41gU+emIf7NjBiiNPusvBx0xERIlnveofCspK?=
 =?us-ascii?Q?H5LoKprO3VbLVZLdda9JpGgdE3FLmOVX8OacdGlENgHZmZfvJjfPG97B35c4?=
 =?us-ascii?Q?pF6zq6a2/421Qenzh0Ny3BG+mXMgXYmHkJq6GKsxjdGjUWhKa043HuAgIb8c?=
 =?us-ascii?Q?hZy2/F3zV9wQO+hYD7s5I2Muf55uaUFqK45hoUDc66qz64eJhpDXO5sx0wMb?=
 =?us-ascii?Q?6ua+1Uj7vuCac8z5Q+t7kd1z7mHtvGfcitUeImlid72APspPjZmqeu0rlRBL?=
 =?us-ascii?Q?dOYYoygpWC7pKhX//ae/3TrlEKoBSPnTlR63umRNwTYFx3HIFrncgqKiokss?=
 =?us-ascii?Q?1CHJErvOzQiZr4OqY/kIXzp8te9R81053eKaUhL76AZxAhJ/RD47pIA3t0tA?=
 =?us-ascii?Q?hUKmj56X4thtG5Ia+0rGnxNPGi2Y8wMQ38N1u2sZpnXPs90O3FFK61MSfhMF?=
 =?us-ascii?Q?XjaeuKZ2dRpHmcRORy+uhRFH4vHCz86M2z7gZIyuanWxjIa/BxOVOwSDIyfm?=
 =?us-ascii?Q?quWL1iYEiB/9MGJcTKoDh58xdBwO0OQt8nfynyJJ4SW53/Y6yWMAnmol0+Tp?=
 =?us-ascii?Q?qjsf9sjTrQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fcd5e5-0bc3-4eeb-7aa9-08de97266152
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 17:27:02.9892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /he1uJH24OdzlF1b+POY968IcM6Qjunto5zV7qlHj4q5ZSR6ozDV7qa6HYTZWs+gskem8qqCaAmThqOwvyWdmq9WIfQDohzaEyZhdnDfleg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17901
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31163-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be,bp.renesas.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 967B63DB0E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell King/ Andrew,

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: 10 April 2026 15:55
> Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume =
path
>=20
> On Fri, Apr 10, 2026 at 03:51:18PM +0100, Russell King (Oracle) wrote:
> > On Fri, Apr 10, 2026 at 03:29:01PM +0100, Biju wrote:
> > > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > >
> > > When mac_managed_pm flag is set, mdio_bus_phy_resume() is skipped,
> > > so phy_init_hw(), which performs soft_reset and config_init, is not
> > > called during resume.
> > >
> > > This is inconsistent with the non-mac_managed_pm path, where
> > > mdio_bus_phy_resume() calls phy_init_hw() before phy_resume() on
> > > every resume.
> > >
> > > To align both paths, add a phy_init_hw() call at the top of
> > > __phy_resume(), before invoking the driver's resume callback. This
> > > guarantees the PHY undergoes soft reset and re-initialization
> > > regardless of whether PM is managed by the MAC or the MDIO bus.
> > >
> > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/net/phy/phy_device.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/net/phy/phy_device.c
> > > b/drivers/net/phy/phy_device.c index 0edff47478c2..8255f4208d66
> > > 100644
> > > --- a/drivers/net/phy/phy_device.c
> > > +++ b/drivers/net/phy/phy_device.c
> > > @@ -2008,6 +2008,10 @@ int __phy_resume(struct phy_device *phydev)
> > >  	if (!phydrv || !phydrv->resume)
> > >  		return 0;
> > >
> > > +	ret =3D phy_init_hw(phydev);
> > > +	if (ret)
> > > +		return ret;
> >
> > Do we want to do this even when phydrv->resume is NULL?
>=20
> I should've also added (sorry, busy packing) - with it always being calle=
d even when phydrv->resume is
> NULL, it means that the call sites to phy_resume() in phylib which are pr=
eceeded by a call to
> phy_init_hw() should have that call removed, otherwise we're going to be =
calling phy_init_hw() twice.
>=20
> As the patch currently stands, that's the case when phydrv->resume is pop=
ulated, and I think we should
> avoid that.
>=20
> > Apart from that, looks fine to me - it seems some paths call
> > phy_init_hw() can be called with or without phydev->lock held, and
> > this one will call it with the lock held which seems to be okay.


The new patch will be like this, after moving phy_init_hw() without
phydev->lock held. Please let me know are you ok with this?


diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 0edff47478c2..4a2b19d39373 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -396,10 +396,6 @@ static __maybe_unused int mdio_bus_phy_resume(struct d=
evice *dev)
 	WARN_ON(phydev->state !=3D PHY_HALTED && phydev->state !=3D PHY_READY &&
 		phydev->state !=3D PHY_UP);
=20
-	ret =3D phy_init_hw(phydev);
-	if (ret < 0)
-		return ret;
-
 	ret =3D phy_resume(phydev);
 	if (ret < 0)
 		return ret;
@@ -1857,16 +1853,14 @@ int phy_attach_direct(struct net_device *dev, struc=
t phy_device *phydev,
 	if (dev)
 		netif_carrier_off(phydev->attached_dev);
=20
-	/* Do initial configuration here, now that
+	/* Do initial configuration inside phy_init_hw(), now that
 	 * we have certain key parameters
 	 * (dev_flags and interface)
 	 */
-	err =3D phy_init_hw(phydev);
+	err =3D phy_resume(phydev);
 	if (err)
 		goto error;
=20
-	phy_resume(phydev);
-
 	/**
 	 * If the external phy used by current mac interface is managed by
 	 * another mac interface, so we should create a device link between
@@ -2020,6 +2014,10 @@ int phy_resume(struct phy_device *phydev)
 {
 	int ret;
=20
+	ret =3D phy_init_hw(phydev);
+	if (ret)
+		return ret;
+
 	mutex_lock(&phydev->lock);
 	ret =3D __phy_resume(phydev);
 	mutex_unlock(&phydev->lock);
--

