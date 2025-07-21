Return-Path: <linux-renesas-soc+bounces-19598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FD9B0C7C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jul 2025 17:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7B8B6C12BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jul 2025 15:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BC72DECD8;
	Mon, 21 Jul 2025 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hEtOB1N5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CF02E092A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jul 2025 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753112234; cv=fail; b=eOlJcFHUrsJ8MWjs07oPPrvHQxOEQPcgrilVtl0v7qsHjRjznWgvULFrVSumhrzSu7h1TZpTs+VLqlUyNm8bNAKxcyGUAeI37sxTzvuryriM5c1V18R8KhsCf3FYdgDpCYz3cONw+7wKcsNJ8jNETYRoKD6Pws/xrdQpJoAbx6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753112234; c=relaxed/simple;
	bh=/+xQIym0mZQ3wRPgtO+FED1ruHqpZ2jKveP8A/EENrk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Op5/C/UueSIcG5HCRx05DYaqz4X/GaxN5iXam+SuTn/zot9ccd4Y45kEEYbjkIUdtEaoN2jU5mM1vVxpuuv3IHBgsVdsU643TZgIZAGN307U3rWfhcL8nM2Lx5ICMde8IKqVcL9he0LnK5JzUClcznnY/UjOqmRJMGjV8GmL+ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hEtOB1N5; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNV8ADUVMNb7B33b7rIZGnDUslVoSB5JK0GlXJVJ0Un+8M1qyVcmKmNRWeWU00rGX7EREMNTqWmRFbM6gqz3pLoVi3KOgMvBXolVAr0PO8zaOSMaFYe+26Kg9lKNg5C8Szn9ozyWniagNH3fwuelZcv2PejU1hCrMt60IJUfPjaLHDGgn4iogDJwX8d/rYRQv8paLCaD1wAjGnuBR3sI3bZcNsxf+qIyeRCdu3FVU+4bf5ctU8APhq1LBOwjZ8npEoBmHsLfwQIZAzG/ihCD+5morGYVj78tQowaJL7uIy3x5ZYYWyzfX7iD/6I/HJFvzAsep1mw9MnBqsNlG0HBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9CBS36UQ8vUiqZ0UopN308W2kz1g6VHBV7diGcJRAs=;
 b=JOdZR1K2z2gk0EnTLWUNeciqtXRiC9BlTTXlohk+Kp78FJiucgRWFWcYVhFfbK0Uyt5X/I+MM4YqvP0Plt6+7UxwN/SWXaxkymqvE81bi2sknOQqBCsHffSiaTV7vKnBm8P5Xtznv2s9S8brAprdhAQa+mDoqJ94ycOOLxQvCdy3lcbQykJn3PeNZhMRcuz8g+uy3gNXQtWwMXsOzII5vUlcok+Z0SlZxPsELkBRo529W5f7ezgFwU9i7bQc6oWJLWO2OIaYDlfbyzwpQd8J3MIiuCJSstpzM/ib82C2iTvxJqG6E3/9TX1w8JpmhwGEl8MiX46q6CGPMkUN5LsRLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9CBS36UQ8vUiqZ0UopN308W2kz1g6VHBV7diGcJRAs=;
 b=hEtOB1N5pX0rtxS24rXDKuHCJ0PUHetQLhLU4couqa01Z/IHiK7VyyGZKaThpT8l85R857TT5rRwt/143VO8gcECRRdS0BywnzaUWlfkNoou382FA6GtM3jvOg2VmoZ+Ztg/w7lpYCyCOPt6HTcBN4apCapRTikjw6ENVMuw/fg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB15946.jpnprd01.prod.outlook.com (2603:1096:604:3d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Mon, 21 Jul
 2025 15:37:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 15:37:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>
CC: kernel test robot <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Thread-Topic: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Thread-Index: AQHb6ZbcTwodwylbck63zUQYC+u2R7QcGawAgACc3sCAH9qPgIAARUaw
Date: Mon, 21 Jul 2025 15:37:03 +0000
Message-ID:
 <TY3PR01MB11346D7F43A7073160EBE6BA5865DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250630081315.33288-2-biju.das.jz@bp.renesas.com>
 <202507010308.KUbUR1fM-lkp@intel.com>
 <TY3PR01MB1134662BDC486D781E5B263878641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aH4jnz0RPssZ7SfF@shikoro>
In-Reply-To: <aH4jnz0RPssZ7SfF@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB15946:EE_
x-ms-office365-filtering-correlation-id: 587b6e4f-f601-4c54-422c-08ddc86c7152
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gyRD7bBi11JW43XQPT6SOlXOkRsHy4riOVdA+qFaqTskaFsE/fMqYfvpTbzi?=
 =?us-ascii?Q?64N/1qIhFKhTQV9G2YJdWaQgn+db3WXjLDjQ6wDqp+NruJTGnngdUGZ+isQM?=
 =?us-ascii?Q?xS8zYBSKfqS3/IfGXgJRWLX2jFmUerbAunCs+mR95mbiM1EImn5nfuUvS635?=
 =?us-ascii?Q?c7nu9rcTR3zhXpd5XRu/aTZwW6K5G4Rqm13tOD2dm3n4x6gi5EJxo3DQwOI9?=
 =?us-ascii?Q?8sDJLOYlu5HxBnT8zfbbHQxlY1lT2gXaq8ZFIBIz6G3Wfb8YbmSApn7xQZmb?=
 =?us-ascii?Q?prJbs+5F3Kd7i/jUkPFf7v4UF2/ttKMGvQGnABA/g5K5cv9ufpbbVzZkfFId?=
 =?us-ascii?Q?xnHEkJX3RTUa04ZxctnBTTQe3xPy9kxf3aR4rZHgIGcaNy0B6k1OrE8xLj19?=
 =?us-ascii?Q?D9nF3GGka72dQGeMwiKENUvzTH5Y3B0aSxiwnIOuVW5WHdoiUPaS7g0r7Esf?=
 =?us-ascii?Q?m9FD/Uhv7JacI4k8V2h4w2F0OVMApvVwSoK0d+oirQTd6nDlvpwqB0zDMbKt?=
 =?us-ascii?Q?9cYwYA0RanTs3ywch8AE9qkB08Et4Oedrqhr14/e7izJfimInrteA3+B9aYP?=
 =?us-ascii?Q?ZzPZeWRGpwgN5Iq2rRLRk3IJSvoN/QzCnaRDX/1jf6O6tozYCHnbGFa9/K54?=
 =?us-ascii?Q?+fXj8WIJ4OI2edH3NJBCYmOR73K+dkp2urVv9PYWpuemWD09QBFyeULUJS4u?=
 =?us-ascii?Q?hs24zDbN27kjUzDwZZCYfSl4HueLS5Tu9YtBBpW6n5hTl8m0tmtwKS+1x6mN?=
 =?us-ascii?Q?lwDb6fkUZwa9saBm/mnrGz43Y3guzsyhJ7C9yG3dpsw6QsXJBB+/OgIVE2Sp?=
 =?us-ascii?Q?jcs30MBrZA0+zfJNTQKZl9XaBHditML47ObgM7PFH0LR3J3MuS15OBZW56PG?=
 =?us-ascii?Q?xPaTWDW27gfIymz0FkIJeHhh5LcXKJDRzHIWK4XA0yGwVV9o70Wob/hiqk02?=
 =?us-ascii?Q?TxhlkYr6KYcm/cOYeCkO7shMZxwjl/Lh75nYfqUZmOVZP4kmSyu00MsBTDGw?=
 =?us-ascii?Q?SNn/JBL2iF5ajLI6C/oZowoc4YA511VmemKvKhjKMDPFlsLFrTAT8UsDmSvQ?=
 =?us-ascii?Q?j8iewMok0ILqsrWUIhcoiGOkhN0f1Y2wWIDyukrkWXTc0KIA5ppik2e+3OIr?=
 =?us-ascii?Q?dyjZ2/b8AV12tH9eOeMToEm3wMstWho5HNWuyr7dNae773zB5XYS+ztgsgtx?=
 =?us-ascii?Q?0u7OzNkkuROLlLyVrfuU8gE9oNjwcnz4lL2xbP4IoLYUKRnIqhEQNIAaUiDh?=
 =?us-ascii?Q?GMTxO3GqyVTsE9gIJ3FHux6cwLsDRACa4go417fN69sIuFzK1n0yhyf/Aqd1?=
 =?us-ascii?Q?Q+s+Ut/pf4GeJ6D/ox4ItYsnocNd+2voKAuvjSV3W4OxCGM3AA5vsKdHF9pl?=
 =?us-ascii?Q?YrXdVVeY/kmR8quJDyKX35BG0GK5hFLNhUMlE31JXbKl8OfnOqf2SeGCrcui?=
 =?us-ascii?Q?YOvKwsLnX2yL1wd2rKRlanFMd4PUt/e1h8nL55G4DKjCyF/7QfqMc3KgZORB?=
 =?us-ascii?Q?RWQr4e/3yqbTkZg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?czS/7waPK3o/3BLRwvB7woP7JaPFmQhCIo+WIC5gkzeAXnPdo7q3vH9hGMDM?=
 =?us-ascii?Q?lMamzg2O7d2+AiANqppr2uHfqvZ1Qz3QHsmKraDMLG5bFdKCIb6oe38jnKzV?=
 =?us-ascii?Q?ROgUfAb0UtO14R1WyfAmYwVhfKGLPs29vSZ3866ram3ki8GTz4lzfiFb4shT?=
 =?us-ascii?Q?0ZjyNWqIcMfz+GOTbbEmCJNnJX9PilIe/Jx+YUwwRF2gfrxtQc+nrgs2p+e2?=
 =?us-ascii?Q?u1orOrycpGr3qPGcObrHaSRZv8ohhmPFBfZ16zLfm+Gq0HpTkHdjnkouic1i?=
 =?us-ascii?Q?tNwJIitPv9sqQAKmVecLV+Q/hE/lqLxepBHtp1PI2oCAyyaGNihb8JVUfHUg?=
 =?us-ascii?Q?7iyh2/B1QnyZBgMOP1ZvYoo3jtANmbdcYhhMeDcH2+9mHqcnNuZ242sbyp4W?=
 =?us-ascii?Q?l1o3LVF2RgAjKOjUwhqZk5EgPWkyUwWClIyc3DykpJ9wUVlR2jX7D9cWTLA8?=
 =?us-ascii?Q?7n5vrhEeD1zPrLr3TEviaQDXgMNjTULBpJJEGmIzFmkE2m6EJc5kI3Nz8f1a?=
 =?us-ascii?Q?77qikmSl1mmecmN6apRLJwaNKwM3drPNDb0QuK17hbpQbG59X9ylYOc9m8nb?=
 =?us-ascii?Q?SyyCMTegnjdGIJ6tqYdVGPaQVA5r83ofWp4h00UaYjhyGCvrORzBHkSZfeUv?=
 =?us-ascii?Q?w++ZTXImy4aRnBrB3EB5GHqTsSKcU77TqyCaZKE+YQWk42LzQ/+2+vOB8/AX?=
 =?us-ascii?Q?1+4YKYvjbYU/NOed0wvQNb4jDWWocrcdhXTBOjWzJHI6ss9n04DqvDSqDa3e?=
 =?us-ascii?Q?q4R9IpTtuGfwRqTQlNWmspa0SgW8PcZWaJ7W6Slm9iJYb8kemzkdqL2Jb9qN?=
 =?us-ascii?Q?qWeuKKK4dWnSiworxA8owu0zv+xxv9Lc3fTWZdwSzhlmO009IvAdEe5AkPlS?=
 =?us-ascii?Q?dKeN2M4QYssA+3cXs16C6fQCiWrkLM36vHl2l0jn6pvyu6thVAQx9KGqD8lO?=
 =?us-ascii?Q?Z5508VGXhJPAMQVPibsBDw69lTkGaDjLDkuQCvoANKDd7ddDy8I6Ke1a6/Yo?=
 =?us-ascii?Q?zfn3xlrEsITW1s2ilFAzV6Y/XTQ2n/guyoRMbG8Y1fWpa+cErknbe6QcpuHf?=
 =?us-ascii?Q?vrursvdaif0LWIPc/ToSQfgIj45GbA3e47U07HH3MGsxCbhYjagxllAXYq68?=
 =?us-ascii?Q?zWq7X4AwpYHfVQrxKOOSQ8lqHmSqMOg1NF7HKbmKbx5g6JScrODXehprg9CK?=
 =?us-ascii?Q?6AKy/z5jEFHxgYK7Mi8w502YHHGTZpHQdVLSg/tvS/dacHkH8tqKWjlNG1yN?=
 =?us-ascii?Q?iquBJq12tYguTp1BvLwadWjdJljHD6RG12pCEEhQGSSuwYXeDKk4jOtQjUpp?=
 =?us-ascii?Q?voKpQF8B1AMnMnjOPRKXdVnOODY4P6uIxLeAumJrbml7Lm8C5vAiTaMCFkJe?=
 =?us-ascii?Q?wPc1zs5AKwRrIzgXt2y3+0OFl2rlG/lCR7brkPmxiPoY0aIwearq+GogyofL?=
 =?us-ascii?Q?Z6u/TE+QG4HOI4Thm0ViRMN3sxKUFkvcu5gZfNRIzH41RnDVaBIpiLlSHB2t?=
 =?us-ascii?Q?8grBWD1raDUVnNDFCEZ+TMzOkVT2gtv8bLyuDL9mBJqvlPYnxuMr9IDKMB94?=
 =?us-ascii?Q?w8vvB+MDjCVbB3waRoVZm9iI9CrVol4+CitIdFFB1wfx+GiVrXg9Va6XeUhv?=
 =?us-ascii?Q?wg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 587b6e4f-f601-4c54-422c-08ddc86c7152
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 15:37:03.9665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qfuNhOoH3YFd9ib5hV3M9geemWlRV9UVTuk72LNlg9iPNC/ZmSHA3Xr17dxwfAf+hsUlQ/F7TuCjObzuNmgscyoUfQX3kkw1qzZIXGEEjdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15946

Hi Wolfram Sang,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 21 July 2025 12:25
> Subject: Re: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support=
 for SD_BUF0 in polling mode
>=20
>=20
> > Maybe I can guard these functions/caller using CONFIG_ARM64 as it is
> > applicable only to GEN3 Platforms. Similar issue seen on [1]??
> >
> > [1] https://lkml.iu.edu/hypermail/linux/kernel/2209.2/04657.html
>=20
> Maybe just use 64BIT as the guard? Seems a tad more precise to me.
>=20
> Other than that, looks good to me:
>=20
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Wasn't able to test this yet, though, sorry. I hope for tomorrow, but no =
promises.

Ok, will guard like this in next version.

#ifdef CONFIG_64BIT
static inline void sd_ctrl_read64_rep(struct tmio_mmc_host *host, int addr,
				      u64 *buf, int count)
{
	ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count);
}

static inline void sd_ctrl_write64_rep(struct tmio_mmc_host *host, int addr=
,
				       const u64 *buf, int count)
{
	iowrite64_rep(host->ctl + (addr << host->bus_shift), buf, count);
}
#else
static inline void sd_ctrl_read64_rep(struct tmio_mmc_host *host, int addr,
				      u64 *buf, int count)
{
}

static inline void sd_ctrl_write64_rep(struct tmio_mmc_host *host, int addr=
,
				       const u64 *buf, int count)
{
}
#endif


Cheers,
Biju

