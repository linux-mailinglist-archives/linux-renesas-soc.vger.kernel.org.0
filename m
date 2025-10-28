Return-Path: <linux-renesas-soc+bounces-23726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB97C13B8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 10:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BE0C1AA756D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 09:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF98D26F2BF;
	Tue, 28 Oct 2025 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PxpBA+BJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6E2230BF6;
	Tue, 28 Oct 2025 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642545; cv=fail; b=Tb1Oy9uGAWeC8nGZFUw///7tD7lSHoHKSGdvSB6zFczVqvgc4VwXGoNZ8DTSJQ8Kmb4oRtLnIP5HcFsr9a4WeM4hQDrpYL2pWGatpdQTSN3H6vlu5fLqbq83wZ0C+E6lsxTjKh5yI7EyGnOOC3kFYKujGM6eVIPW8KvjQFCUwcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642545; c=relaxed/simple;
	bh=z4sFmxYZ0qiZI16oYxHKhMZMUYUHtJFjjLlb5mXvLPo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LvASH95LesasZYwbAB3xX+F1mSrJG5T78KppN1hcwaRqb4dCkNEovIXS6CF1yNLCdiigU0R7AfL5efCb7Enqx1cmhNxkRLsHZktkmgMRyLoEM+FZfbd5Zq854MWO5gKFc1U9iAoxjtqwoqRLGHhKPOSkevofPmdIBKE1kRm5UaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PxpBA+BJ; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZKVy7pD1lEWcBx0mw48vLK6EOo4oeSlHU5Uwoblp/u3HuTfJQysWEVo/6CAGihNKP8gZoQ6kzGsca1XiovX3AEjzIWEgI7Oasl1v40kOUnQSduPU/SDZ2iU+fdn3bgWIkS+tnCiuXMZFeqkHckjriOhwWQiMA/5YGTYrHA2hbnCCDKO9K/+MQgs+FlKe4xNvYIYGUOnE4wWQy5eTLPv5m8RD1tV+tWl/32HOLRnUDJsrWP66Fae+BxHujVU2KaZbW6fMmJk6Ds3xFyH8waT1koPov5VAAQ8d72IMNjFgq9UWH2ZInUAD1FHHySIncQJ51te4+687RbuxSMXrXRDqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ln1sHVATKD5h3xi7TcAsym/V4k405bKgOrkM9JEAJfA=;
 b=LGofecSQJshcMCeCrW51sazwTojcYQJr2fuo8o019E9FeKM3HlXqWMVtlDW/g8Az0R45u13PkOSACn9PUo8qXNauFoYZeizL38ijKrHAzt3xOsxxDIxmE3lDoYVtmW+r70jH8GT9ZCEc6vUl1lYqJVSolL26jmVRtCjwFXiUlmXuFT8tSd2YC3jXZqjJwCQ4pEXPDKmi/nEYIaCtdDNW124knnyl8BXtrEzK0r54RSEOU6Z4ojAbIocWzmKy2ppYPNoZAGHBErv1nnFE3D7Fy3lzQSz14l8TgMxNunRGkW5yMOnk2UD8wwPkYO6KoYOKOlbFKSZ1a43Bucm0pAkqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ln1sHVATKD5h3xi7TcAsym/V4k405bKgOrkM9JEAJfA=;
 b=PxpBA+BJfleWZZ26F/+YePXGy2HxfAPAvJEExLoNM3LchCEO19Km9GLSbw5/iQTTx2x5J7BKu3txskhEsHWJz6B/fW2GYBPfVMM1sHjPrRpZE2B4dFwWpl/+mUnh3vRytg/Na8dqx9jU1Kihx+RtxJwHQhqPkD6fh+qdxPeP28U=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS7PR01MB17385.jpnprd01.prod.outlook.com (2603:1096:604:439::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 09:08:57 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 09:08:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Jiri Slaby <jirislaby@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Nam Cao <namcao@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "stable@kernel.org" <stable@kernel.org>
Subject: RE: [PATCH 04/19] serial: sh-sci: Fix deadlock during RSCI FIFO
 overrun error
Thread-Topic: [PATCH 04/19] serial: sh-sci: Fix deadlock during RSCI FIFO
 overrun error
Thread-Index: AQHcR1jjjbdOMTqmaEmA2g2+PCQhtbTXPlyAgAAHORA=
Date: Tue, 28 Oct 2025 09:08:56 +0000
Message-ID:
 <TYCPR01MB113326A115358BB084F0CEC2186FDA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-5-biju.das.jz@bp.renesas.com>
 <2025102826-appraisal-tables-47b6@gregkh>
In-Reply-To: <2025102826-appraisal-tables-47b6@gregkh>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS7PR01MB17385:EE_
x-ms-office365-filtering-correlation-id: 4b37c55d-6824-4618-cf7d-08de16019fff
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6b9IzlNSi2cbT/DoWvwWpS8BnDYmIsaF2FkavaMegv93DhRgA0UAVNEYMIxX?=
 =?us-ascii?Q?mSlauZYX8cBjAQywcD+c+wxsT9X25/0AqqAIihMs2gcuC9x51SUxdCd7DrlI?=
 =?us-ascii?Q?ZuBnbGgHBZc/HNbJ1QsREtVHqgVHFQWvyREl+LVj+bFujytLQhhu6v/eO+gH?=
 =?us-ascii?Q?fSUYLkL4Wdf3zUaQnMJFc4WOmMdUQUBhXAhTa8zgm0xPX5fR4KTdNjg6pIa9?=
 =?us-ascii?Q?Z1y9kmLFDhJSTVewDdR/tT67g0RtZ+k3/Ws0s/+7UDuH/ZBG8nUxhuO6Fy2X?=
 =?us-ascii?Q?MVWYM8vhoNEGRmM7cbB9mrGoJOpluu0bl0suhEK0vphk3jlQJ8P7xLu6mibN?=
 =?us-ascii?Q?N9oYcnhmJvCHesk8l00A0AEY4LWuByvdOsEJQhWxhpzHL1TkHXa6tbCOFGOD?=
 =?us-ascii?Q?lhak5CB5gahr+P2+xhsT2XYpGp7ljI5Luho9i+zjfePZ4fhsKFqLm1wiqddB?=
 =?us-ascii?Q?ZTA1YqQW75of7cFE4ZT9Qi4cFARkxHe6CnL1bQG1RF0SPy5C0RiXq0lIqypT?=
 =?us-ascii?Q?WTKYE65STRBmQK9WwWvSjhb8jifsXlKAIshzUSJB3aHbM1edS+exw+HuSIHX?=
 =?us-ascii?Q?uJM9js/Z10mRk3KCUtJuB86ww3cz9D+xwO/hKnfSHtWUzJkmTNnasbcQc6rZ?=
 =?us-ascii?Q?B76UqHmr5M06l9neG4v6R0dXypFUpTBGu9CzKizDeHvhJBeZdoHmbvBZmXBO?=
 =?us-ascii?Q?xKcYHZBPBAYWToTdnn3P50/akoJdSJpHXCZkndpRcgYwELJD8CyAPR8Oy5Dl?=
 =?us-ascii?Q?AzeHzdOe6Wl7bqgLyhocyWfWp9axR3bbX97Pf4d3AkuI9QxBtelHm76znJuJ?=
 =?us-ascii?Q?fYHenu7+1i4FHK2lyB3Yia2//o2SDNBrWZPBeWED90VE7JAc7uqlVEa3pXMr?=
 =?us-ascii?Q?Bzv1ztUJcaKY8dm32oTd2yPz2toCNUD3FUKqQrfCzwILeMGp8sFnzHM/quTt?=
 =?us-ascii?Q?KMwPHYYNmihIgShyrQqVqV5Jxw8Xwn/xRP1r9k6io/3meqI+0nyDrjH240TJ?=
 =?us-ascii?Q?+lIpQfElcU1tCl0cH1qJdMqCmkWoKq1rB1nZAe4fOZOv++NfDdZxtEsseMkc?=
 =?us-ascii?Q?eaOvOprior56Y5JhKm33G6azKek9jGYYQTLcjE3rh4MzXDHfzbLdfNqUHnFX?=
 =?us-ascii?Q?DO3Ucmtz8JadvvE7yuwnZ3WeFqpy7E2ma5GIe6mzWB3SHf6jeg08ObMFZ3sU?=
 =?us-ascii?Q?8GvZ86/OrhZfWeYTvNYPxj0X2OYwqw4KrCc2loUdoTzFwpqS4aOVdsM1aCS4?=
 =?us-ascii?Q?BoOdWqPXW0pQE3xKol410N5riHtxl9ozcSMxnGk/1fW1IWtFsi845904q7XU?=
 =?us-ascii?Q?5MNi8bWhaLZEqmV1Xk3ZvS67KQuubpUSikUCoVx1cvlG2c2k6BE9L528d0ln?=
 =?us-ascii?Q?qqWr2OZpNi3x+4Vk65JDU4RHJg5n4afHztjW5cKfzsIDxw4osgUpEesRhNf+?=
 =?us-ascii?Q?HpRs/x2thyUjt47h5guHwGr5wpmwgRYYNqxZvL8A3EMed/MFvzanbR/rUUC7?=
 =?us-ascii?Q?KywFhYD8nayv4p7m1hBnkspMfqUc0WECI8dV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9Fri+jZWVEufEnonqLIQiY8PVbhc/VooYJqPLlNbsT8/8EDFDA8RKIiaMLC/?=
 =?us-ascii?Q?zV+jf86KLrWPMsiFqpt4FIjlnxSKmEgEyK5kkPqD/US2Gyhnevqi9SsP994O?=
 =?us-ascii?Q?bIsnyJt9o87nIAH0LDBg8DqzxVTywrtdGpqWUz5MhW+r8gRAMMcsEE0zRD0g?=
 =?us-ascii?Q?vv7GxrCFKtxJDVieaIGHK46BUmdpDr+icuUxMfCtzOFsAjho+RpimCTy5YJ0?=
 =?us-ascii?Q?knIXdntsMAU50feJyGIvQM4hwhyxttAuDZgGC73hnp9BD+G2iWltpFlkKBOU?=
 =?us-ascii?Q?pFldpmcHFaU6U4tq3rfxHQeCSJngeoZ+Mlg34S1b0dpZ0CZ6yZ8ye0aaxrDA?=
 =?us-ascii?Q?b8cr5kEUKiC+YgAGC8XvHha2eeOJyEyqvQfjutA8PlYCb+ZHnxBZPinDzJWV?=
 =?us-ascii?Q?kAcGEnHk6xZ5D/ohBfgLQi3Ey5qoqYGDrhltYylBsAl4zRXTHF/pK3IHxti9?=
 =?us-ascii?Q?qr+B2k9yJfsxp/F9Ro2beN65T0znUrNuzBW9AsX5EmE85AedMRPZ6iTx42+L?=
 =?us-ascii?Q?4R4VCSF35FLg/gXN95qpmWnceHdLe5Sk7/xP+k53D2taDF9U5zb0L2VOi48h?=
 =?us-ascii?Q?LMl91c9gYrUzckwSZ/AfpjPJWwffIyXoSUrtpL52rvpXfkO/vGb/XyuvspOb?=
 =?us-ascii?Q?q6hW7P7CgxEyyB2Qbgk1PlZd6bw2KLbbMAYSYcQIO1Pq22iqZifVGm4zP4Lh?=
 =?us-ascii?Q?nqTX5CCx43Kx12qeZFMHuzo57kXEZGjUHMjJwnthfCcl37ULjjkfxhYM0yxp?=
 =?us-ascii?Q?dkum3TumfJKkZttz7Lo0Q8zld37n2y/roaS2HaDoKMDFa77jd2zqGqxZBKhE?=
 =?us-ascii?Q?0Z9cY+yxfeRGGZoFNorw3SrKyMPSlGvuKzusVRBegIz9CVvPQw85DQ5mIDI9?=
 =?us-ascii?Q?FLdrGUZi48k31au2tZyoa31XKxP5JFJ107hJge/IX994A0tawz/+u+gQapSt?=
 =?us-ascii?Q?Ytr4hTCqL5V5lMMeGC+KZyhRdf+rMMSbhw35lx+tTS+XZs2UUiz+wBv+MvQW?=
 =?us-ascii?Q?u6H7PdF4F2jwWiHZCpLqTPpHSnDW9ruzZcPehjYKUW8mx32/quFhgHlpOuIn?=
 =?us-ascii?Q?eINL2a9D9GFIKH9NmSJpCUm1eTlOq8T9piavKORa2asyRJ8yhPEsg/yd5+GE?=
 =?us-ascii?Q?IhXNekkRToFCLwoG2jz6GedEvSeDoPTh2zkDFY2YWmgz747E+OB8jhI/mGTr?=
 =?us-ascii?Q?mo+Hzuosyp5Ydiu2EKVeX/iBSff4HrqJZzVYSgezqdvWZgD85r16bm8t5xLy?=
 =?us-ascii?Q?F+UBBKpJPhPpqilAsqbiTQjx5CvEotNL3UBNlzJnOfzB5fQwXBlI9r8oPSsb?=
 =?us-ascii?Q?dZorpgt1mNbynqqBD758vOSywtBcYHimSdF/UsaaItU4PcJNyCLxQitnf6Rp?=
 =?us-ascii?Q?SKAZwc6/dFZoa/Rd85CjefZVTo+hVhJ/bHw5/G2pgnKqi4DvoymsrRi1xXdF?=
 =?us-ascii?Q?VmBA/cMPffIeZKBaFbF53MadCYrBDu8Fm4kQr7MY9s9ufwA+sVgWiWAuMea9?=
 =?us-ascii?Q?bjoPSoV8OZuHzRO0IlsCLFL+8F9hjH7c0AB8PhCzNvSfGQxzZjUSaIxT6J2s?=
 =?us-ascii?Q?/Yly28ZBWCzhoHnU05owJU1IfF12qyvCOM2t30xeXBhGPO08trkR8ucxpgFp?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b37c55d-6824-4618-cf7d-08de16019fff
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 09:08:56.7924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3k2NM51ULPtIjnoWiXuZugWC6PEfRBRxmDBFObMFCMgkhkKUJl0m7WlgM6o3s7ycNZZPkXBxsJ5tkR7k58IJtL/VBl0n2lfW0Sik49Nkwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17385

Hi Greg,

Thanks for the feedback.

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: 28 October 2025 08:41
> Subject: Re: [PATCH 04/19] serial: sh-sci: Fix deadlock during RSCI FIFO =
overrun error
>=20
> On Mon, Oct 27, 2025 at 03:45:51PM +0000, Biju Das wrote:
> > On RSCI IP, a deadlock occurs during a FIFO overrun error, as it uses
> > a different register to clear the FIFO overrun error status.
> >
> > Cc: stable@kernel.org
> > Fixes: 0666e3fe95ab ("serial: sh-sci: Add support for RZ/T2H SCI")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Why is patch 4/19 the only one marked for stable backports?  That feels r=
eally wrong as that will not
> show up until after 6.19-rc1 is out, AND the dependant patches will also =
not be backported.
>=20

My bad, I will send this patch as a separate one.

> Please split up patch series to have "things that must be merged now"
> separate from "these are for the next -rc1 release"

OK. Will separate this in next version.

Cheers,
Biju

