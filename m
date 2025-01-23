Return-Path: <linux-renesas-soc+bounces-12387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD5A1A290
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 12:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66DB83A574E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 11:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0613920CCE6;
	Thu, 23 Jan 2025 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LIWcDxfv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF3D20C46B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 11:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630529; cv=fail; b=CbcBT146erK0Kjrw8R9q3sCOhQZRVI+nZaVF5RZj6V/RymmB+oWDjHMM6GgGAe9w41zesMuzLltYJ+U1oVw98Ia2CHp9FCeOm+/L68UpFeV0BoCD6Jy/xG2DIk+CH41lpPPoM4a6RbBwydj/XktQXZ88o2g09gEto6G6PFNH0Vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630529; c=relaxed/simple;
	bh=mI/JBuaGjEZm1jFsclaIKZkatUJGPqoO7staavv4DaQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OsY3iz9BfiErnsBIq4g5yTqC1nAQUTxEZSDtqA9DhdGMW6KJy/R3XjGpUEhLsvQLBfb2YsZ0uuFFIwnexVYhe1vrOCbzxkZMKKLtcMNbw5Er+cEwc7T2KOgqdQ+dNvV+FEKY6BydS9lVVlO8Y46+mQYRqkijbyRiylvdE9tawhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LIWcDxfv; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpfmwQai9PtS6mAaJefZFLXu4IZ17uG2A+AKfd6XO+upZh3IRPr1upy/eW4CYtA87s/xoq3PyL4BG0kv+weZY8VC88ZIzipekzsKgqo/4eM8T/e/vP+PV/PSuysKgntK5Ki0Ix1IVO3xwIQYbKsJDQf3Bef8LGbIK4PECB049HwDLgpsJnuSyr7Us6W0SktycD8Ax2tyq4rYx3Hp5Xzm340o6WeGi4nacE/oYKyAmJNJjH7cYGa5qXO2ENh/fNU8CGRBeBf7zAb4LT6YySA4LK2Bzux/IlIJ6XFB8xb3BdCPWXZu3U+qRZWyKnemfOUz4Kt53PtDNnpY0DXnRIigHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKr3iFDXRMOxbvA7OPK+SFf6yUE88cDuJaxV+Wux0eQ=;
 b=E+MMbOXkfyrk8EaH0f6qx9kUVfYCRjYYkip5XjToWAWUqghNKlar85lSaFs86nrCe+zUs30xbhmJJa0KF6IqGepgNHD5ofBfBvzH02R0UuhPMT1xMiax0sJH127GNoN8QivBJLSUl/H7QryW5sdvmFSfj0l4c4Z3X5pdptUzrU+zXhcAoHwKciYHmFeJ8vzxhI5K069xDhcpkthogO2Yy10kaHs4WVG151tVy5yjwXodY8dV7YfrDh2CVuCOV0M3BfIxE9IIk4PXZUKmbb4TbkEqEz05jDdXOWP/liegW3B7/Mh0M6IxjNdfV51XjZBxWjda2a+ON78Uoyaw7HWqag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKr3iFDXRMOxbvA7OPK+SFf6yUE88cDuJaxV+Wux0eQ=;
 b=LIWcDxfvDlZRMg3FMPeEb4wKWv0n8fnvpnBqlGufWr+DPMGSYXQjmWorkfsxHI9roQ6rSLHZxTHANPHhWMdvnRI0OjLOiVQdsvq1Ezggvku8CSCgFASdvocCORr3NOzPoQqJXq6kYAzACpxeWmS7hS+1agMjV36ofJLXPaB95/4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB12849.jpnprd01.prod.outlook.com (2603:1096:604:337::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 11:08:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 11:08:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 06/11] irqchip/renesas-rzv2h: Add max_tssel variable to
 struct rzv2h_hw_info
Thread-Topic: [PATCH 06/11] irqchip/renesas-rzv2h: Add max_tssel variable to
 struct rzv2h_hw_info
Thread-Index: AQHbayBYeBrhgB6HMkK/UVonDpoKwbMkM/YAgAADyUA=
Date: Thu, 23 Jan 2025 11:08:42 +0000
Message-ID:
 <TY3PR01MB113466D80FED88D652800B9C286E02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-7-biju.das.jz@bp.renesas.com> <874j1pajhz.ffs@tglx>
In-Reply-To: <874j1pajhz.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB12849:EE_
x-ms-office365-filtering-correlation-id: 96605e6a-e150-4c63-ff8d-08dd3b9e4c3d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NlZ8j9JuElgJp1yc95El/4XZnh+L0QeHzdQjxiZ7iLxpIQqnibH9wvvXl2s+?=
 =?us-ascii?Q?ejaPHNk7iafQJ3ROUCDwF43Zti7s0TCtk9YYZZe9G1r1v/J1M2JU8rL70a4F?=
 =?us-ascii?Q?NvixKfCLJuUeo03qAJdn2VYVBR9/Lw/raOgdnFHymNCaNp/hQZ5IYmwV+g86?=
 =?us-ascii?Q?LZP2UcCqVQUqVqc+NP6kzXA/K1XsLptgwJLGd4kC1IiP6NiSnfxZS+4yXiV/?=
 =?us-ascii?Q?ajoGkFcwkKMKTqOSwQ7DRFu1047kMcXMptmbksDY/rv35U5H/ruP6Dvq+DAE?=
 =?us-ascii?Q?53HEyHwSh/TtYoQQvMzXU7Yve0Gfa2htmOagXxZq2tnh1SpIQ9Ie4OXEFoN3?=
 =?us-ascii?Q?ynTG2zV123bL1NQ0p2Ga9LLE4ltkwYUFiqMEZDk6eIzEiuGUjiqH0roXk2Am?=
 =?us-ascii?Q?yxwX7z9pvAyTZLtCP5IHIoiEsnvMhLY785t6HNFA7FLj/pZi8KtQMloLiVvw?=
 =?us-ascii?Q?fX3ktlriuf3aNNmncKBRTy5GocBoOslGh801ZytHzmtoCdkIn0SlENN8Vq7c?=
 =?us-ascii?Q?5Bm62xWTzBXw0PSt/OHdv/v7L3Tl62YGpbI54pd21zaoagoEjiWqsPd3z3i9?=
 =?us-ascii?Q?xZt2DQpDkINOmEeK5Ib0n3d0ID/VIZEfHTH4pXmV0yqpYIHUYbEPgfOJHqWV?=
 =?us-ascii?Q?eXi7eJ4FQPAMcKq+owcrL273uwLqnyfJBuibVkNbyAVmmOsREzpFKF+/Nsy0?=
 =?us-ascii?Q?lpwzltcBUwBGfhLTpjZEtmSz5o0BtICTvb+8Ww7NyTyeXiCAUIcXQtBE+yO5?=
 =?us-ascii?Q?FslCXGCyw/0ocpnSz2wIcXbRv8snwiiHNh5q0ii+21LxjutXOPi8v1slHnym?=
 =?us-ascii?Q?944cdAUgjEjACOMNx8z4SjGHvSFEQA6Yk6UgiBXIn4bOj9Dh/UN20mS5nlTO?=
 =?us-ascii?Q?atASatvdPnsnT1o7+CrEZWcRl9r5zI2o01uoux6PgSD2EQuJZXRolOBSP82A?=
 =?us-ascii?Q?VZiJnDe49yBIelxYcuDsonClZT8Ir+AIw7x9zeln8/LgWQStvFy/4sfgs96T?=
 =?us-ascii?Q?b1qlCZlCKH5N+rPGC1O5XmGesNJmWHI+jgyVtmeDoG3lzec/P1BzjskFQGGj?=
 =?us-ascii?Q?gGFFmoluNqYb3ONbfgJIqvKgcP2F+ZaAcrKJisa1oKIWKDpv/KhjgaoE+Ih9?=
 =?us-ascii?Q?0riBL7bvwIsyZcS3YL4YpIhgJhv0KX0n5bZv5y9UT7j+DWZn6fG0WFNl207+?=
 =?us-ascii?Q?1B0fnwztGgzHPClRFd4BaSUbgLLy38WxGA7mqIyDvwb9+n7CPkeU7sNH73tb?=
 =?us-ascii?Q?K/mr3crd6KfMJIqCGyGLIDBLWoqnnmHJgNCoDeHdomdGyMdFCYlQ1n7YPb1p?=
 =?us-ascii?Q?Cn407dv0qh6THzBTLWQQt2+UfMRzHS+3prd5v3gh7MtcDGMLF9Ia59U/7KeW?=
 =?us-ascii?Q?uVr0be1qOhgRigcADZ/sE8q6f3GQj0Bb3j2b3KAyA5cenFK4Yg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IkWzSGZQgdSV6RbWAVCIIgxqczPUR0UNZ4cTtUK7bF6Yx5uItRGWjbD18muP?=
 =?us-ascii?Q?na1i/WnNrPvvnd6b5QcxboPWMd0nW12KdFoJXcS+LJDwJLmlBTUcIk/6pM1W?=
 =?us-ascii?Q?LWXwHPkIkvLdOAe/i5atIF+h7FOjluOAwjG29v9sMnZqEIhydNb6SFWKJqAM?=
 =?us-ascii?Q?9JDBJBIZJ5h+ES6Z+qI73EhcXMWl2RwjeAYyCFD5XatBjq/cIwpbX6CLlDNe?=
 =?us-ascii?Q?1etfQaN2u0TJQ7oxo055phjaLn6COv5FnlM6moRyGF7i55jjxasz+8h1tUED?=
 =?us-ascii?Q?wX5fkgoxx9X97AsTSfOaWegoERBYFj5u9QQfaVOFTBm6wsK8wq3n8vP0tSJ+?=
 =?us-ascii?Q?mQRpiQ/hb6ShpMSLxgQtcXlQZEj5A8E7S9vbCTlnLmY/H8qZT/5PuC/ldfPB?=
 =?us-ascii?Q?Q4GDvtNhc1mdoaFEsFQgXTwN+8xqMpKIozDXkltXnduZOGB7HIAdCMw7w2bQ?=
 =?us-ascii?Q?/2azJ3BCbMSal+YrSzLQaAgyoxO3zBvCpECCgfmh6jj8uUrv1w+r51PhukOG?=
 =?us-ascii?Q?G0cB+AtDnmFs1I2NrnyB9u9KCpFrwE10XSIpKqlEhs/voK0t2L+ldvLf/P1J?=
 =?us-ascii?Q?D+sVNN8ViyB6umxCBG70K1LoV01QMMJ5DLtMoaP0jYYxTiFHL5ZHvZ61sDSR?=
 =?us-ascii?Q?9xEE32I8vtK7YD97wDjxIxTdryqgY3MOzlKo4d7HKYvSNeCfQ0w3dBFOa8L4?=
 =?us-ascii?Q?d+6cO6p6KoDtI0zNcMFWK9GWuPAdbzq7Fv7Nf6R/j4ZbL+777RqUgi3AnHic?=
 =?us-ascii?Q?+/VQvaOW8cFFTxVj0nLOxRlJDuWTIofcuZJ9DyMEGMaFILpbL48/sidUzsbz?=
 =?us-ascii?Q?ykL3tM4q7MgcibWS3FNEGpCetu7aseDBRsnzttwnojLr7jAefgiGorBYDPKF?=
 =?us-ascii?Q?cPITn1fXMkW3zBOWtPu5tQurF03oTrqnPSS4mbyo2Crp39Sl+lREt5kFKefU?=
 =?us-ascii?Q?oQPIDDRo5qhcCsk/RtYcINa/tRf5IQe/J+eKEJKWORGDqEV6hXj3ubYMwRRH?=
 =?us-ascii?Q?RV+rulvvhv8GxarOYt9+VrhB94ZsZxPL01Zxx9VXB+GmHN7pEXhYUMpFLrd1?=
 =?us-ascii?Q?vEwR6GPN77Fxkiqz1p4x7iwmqq/dGoE4we1+WNH9xT/dYhqDoW9SFOmqa/Zx?=
 =?us-ascii?Q?0W4ck9whlvl9e5dRr3yMcT7Z7Lkuf3O7xeYpnPxrRbRfQQ246Wx3qjTqsvQ7?=
 =?us-ascii?Q?uquOYHehZHov+Tb4ECuzKz24xf65lQpDPtyWzmXOYRRKqs4aOJ2i8ZWMH2Mz?=
 =?us-ascii?Q?Ct2y0kDqIjRTeOLzjCN+xVbXrSRU28dCyWGXaYJv/cQPLNn7rK/IeT5BFhgN?=
 =?us-ascii?Q?qYiYCBT8X3JUE2GjEChUK1JSF93Ed8OFcqQjCwY8/W0prMxfiDU0F8Et6D/h?=
 =?us-ascii?Q?2wSpWFCSd7CuYDtF8SgIYfsL17IBXS3GbR+M8iy1Oy+Mk/yypYUeK2zZBHZl?=
 =?us-ascii?Q?S348nmleIqYJamXj83H3C+S9CTSeeD/ZILpigRygRgLxT/iRksUXTNVhpRK0?=
 =?us-ascii?Q?7pV1t62CBzxpBbm7ZGKEUgezH4/3Ww8YIad2BEIBWLU9ZPuERv8PR0ufePeb?=
 =?us-ascii?Q?AsEi/Ka6renjJvX+NCWUYjFP3G9zQBYBCLXD9YRAWSqAH6yjPFz3UCY55xej?=
 =?us-ascii?Q?og=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 96605e6a-e150-4c63-ff8d-08dd3b9e4c3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 11:08:42.6192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YHJ0SBYnn86rT09SGbMcKiwOXQb1U9Dbv46+bXPx2eip5k1+O1kryvTgtz6pzj5Zp/3nd3P2joHm55ihUQavNABu37J4ZdHuIRnsAtKd9EU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12849

Hi Thomas Gleixner,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: 23 January 2025 10:54
> Subject: Re: [PATCH 06/11] irqchip/renesas-rzv2h: Add max_tssel variable =
to struct rzv2h_hw_info
>=20
> On Mon, Jan 20 2025 at 09:47, Biju Das wrote:
> >  /**
> >   * struct rzv2h_hw_info - Interrupt Control Unit controller hardware i=
nfo structure.
> >   * @t_offs: TINT offset
> > + * @max_tssel: TSSEL max value
> >   */
> >  struct rzv2h_hw_info {
> >  	u16 t_offs;
> > +	u8 max_tssel;
>=20
> Both the kernel doc and the actual struct members want to be done in tabu=
lar fashion.
>=20
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct=
-declarations-and-
> initializers

Thanks. I will fix it in next version.

>=20
> >  };
> >
> >  /**
> > @@ -298,13 +299,12 @@ static int rzv2h_tint_set_type(struct irq_data *d=
, unsigned int type)
> >  		return -EINVAL;
> >  	}
> >
> > +	priv =3D irq_data_to_priv(d);
> >  	tint =3D (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
> > -	if (tint > ICU_PB5_TINT)
> > +	if (tint > priv->info->max_tssel)
> >  		return -EINVAL;
> >
> > -	priv =3D irq_data_to_priv(d);
> >  	hwirq =3D irqd_to_hwirq(d);
> > -
> >  	tint_nr =3D hwirq - ICU_TINT_START;
> >
> >  	tssr_k =3D ICU_TSSR_K(tint_nr);
> > @@ -514,6 +514,7 @@ static int rzv2h_icu_init_common(struct
> > device_node *node, struct device_node *p
> >
> >  static const struct rzv2h_hw_info rzv2h_hw_params =3D {
> >  	.t_offs =3D 0,
> > +	.max_tssel =3D 0x55,
>=20
> See documentation.

OK, Will fix it.

Cheers,
Biju

