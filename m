Return-Path: <linux-renesas-soc+bounces-11150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CED9EB07E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 13:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D79C166E8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 12:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF5A1A2398;
	Tue, 10 Dec 2024 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cKPJu/oA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638961A00F8;
	Tue, 10 Dec 2024 12:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733832502; cv=fail; b=oaYZudUj6nx56GFsjUY2MCLfu70W7MqqQz78+7wezCFolLpySSnZ29AoYxcWDK9k8F7eMs/pssY5DWRA62f3VsiP266/ty2Tt2MWbXD6IDa0CJjJmAayJtKDJMwncM6MRHaP8uPeR1AOobxapFj0fmy78FicZKHISO9HReC4f74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733832502; c=relaxed/simple;
	bh=gYYjRFBSfbLELpoTVbmHz1uJv+6QXWPOUFYM+sucpro=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rt1nTEAIknQnUuK6rbEX9YNGbM+eGODg7b/aQ4UTFdfVr4NcAzoYBcDrABaHOuhDetZt9SNFydNSzDVqvfmU9IOy5idrMsIjCGINjyyn4Vt39bw43CQjE1rI11P7cThK+ufDuqJwj3UwnekPZR6RaXTiFHHWYl1aKbhFb7YMrnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cKPJu/oA; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQptfREVg4eTfr2oT1Mw+P8E3kglffdy/TdsFWQ6h/3sc6sCmmhpcDtRCfILQDCPfFPo7VU5E0hUBwBi24AFvmXHtRgPJNPpPBQXz5+ERs5MPuHLiHChwzDOXqq8Cmrz5DCaMt7viDNC2FS3/RxHvts8EVxa/IkCM5KNUjchorKQlZFqxO5WMlcFwhD2CugyrgJ2t31TinvRR4kwf5rg9kFH3Ex2DvTBYu37lyuPPYr6qV/NEzFsmrongfbZvZcejgsz0P4TRHcchmZEMaxPD6Iwc3IuFhOND9BXWpopQETtvXm1JD1fqN7yytzCO2OSzxsliJj2bd+1hjf+SpCdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrfNTWp+x5Os+aXyH8C8V8gc6UuQ2t+jUqFPxdLPBrY=;
 b=heUxDWW09gyPc1MvZj6P3/EfcEDXOPjTTCAuGfK4JdjHtA7aRvrqlFN3crDt+jnB2S5ACn8fiZqJWcAuvc+u585b2RCQbDVIcn1ANB1UJrIzVBmP/BFwCLRdsnfL6GNPtLtKm7hi3T+Md4ezT7aZggOGbU/Lxa0yBfERBme+huW+A3FQqFHEIw0aDuYLsJBMg9B2YxzOrKZ78Tb7DJFwKTSnCIYWbq/KiMpRoxf6Z8USUvAEH5VGN4IEAYhmhFOy8VcJuOOkIfDBODWKjIm/AsPJwX/YHE54jAuzaJ8tZsvjiNJ1Kl9ridsGUWw/omb6cAg9prCTghtsUgZQWL2XyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrfNTWp+x5Os+aXyH8C8V8gc6UuQ2t+jUqFPxdLPBrY=;
 b=cKPJu/oAYQmyFn8WfhfU91K99wy/Rpc7pCc+K7F4EpWQofP9WwhNDkCGhUKfPo5C+ReKwpnNbDPu2KdY1CCII8U1QyDVAe5L7sQHT17u3b5vYkkMjYHmfQZ1+lqQ16YeD33jVj7EzVhQfle3R2juS/pezbMr/fD/l9W9zJqz/g4=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYRPR01MB12569.jpnprd01.prod.outlook.com (2603:1096:405:1ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.17; Tue, 10 Dec
 2024 12:08:16 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 12:08:16 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: nikita.yoush <nikita.yoush@cogentembedded.com>, Andrew Lunn
	<andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Dege
	<michael.dege@renesas.com>, Christian Mardmoeller
	<christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH net-next 0/4] mdio support updates
Thread-Topic: [PATCH net-next 0/4] mdio support updates
Thread-Index: AQHbSYk5J1GiFYZP206aVROkSfqyN7LfZJEw
Date: Tue, 10 Dec 2024 12:08:16 +0000
Message-ID:
 <TYCPR01MB1104066D4705868EEA440CE13D83D2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYRPR01MB12569:EE_
x-ms-office365-filtering-correlation-id: 2efe7409-32da-45cb-ff8b-08dd191353fd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Yg1enIv4getoZR4LTb8SInfKapVD5uTcMR//8TfHAMaAkg5b5Fb4tzenJbMV?=
 =?us-ascii?Q?N6ipKDmi7dY+MMmkcz8jAqJib4kilxiV7fqcckgSufP5l3D2PlwgF1GA6LZd?=
 =?us-ascii?Q?ea3ULFiGkTetwsuWtsCRfPWleQ1uHOUJWmR6Ltjhp7d+kfclukouUTxEU5pw?=
 =?us-ascii?Q?fN+ts+U+NqnKxuOZ6WI9DrmzWPwM4Av6OWRGvgc3tyEGyj+4pCpspraUNzxk?=
 =?us-ascii?Q?X521UjCZtaz1kK1ZVlvBptaUwD6s2R2J2kmsBnDPDq8ev3wf6dFHtMoCQfY3?=
 =?us-ascii?Q?OaNCBVwnc0mbOp+7hZOBu6X8Hhwm52j0LDpTVjBysEJY1SSSUZeB2NWx5EDi?=
 =?us-ascii?Q?vu3ihTu0tA33WGVByFh734X9bbFzvXWjVXCzm47AbQWD39ZhjBopKPq+svtG?=
 =?us-ascii?Q?ivwCasKv5PNpa+/tM7mRs/GkfS2WbV1nfsZoW6PkYIChfld2EXpoCOgBOAR7?=
 =?us-ascii?Q?1E2Jpsg04J4pjpvlCXQOO9TgoRlhSJClPvp3rAEOISGwdUGVknONJcYcnQkn?=
 =?us-ascii?Q?DOoBW66lRq/dTPGKrGaHMMpVA17DI3Mm5w8X3UySEAsu50TkfdfLmJ7kHpuW?=
 =?us-ascii?Q?UGt6IzDEffmfBGtEU+ubYvO333I+c9qx//XX0qizZl4K/QJ8Q66SaWiqfxsy?=
 =?us-ascii?Q?LXBFbzdMqaSGTRlVY60y5p1dtGzmsg8ANNCIhwNXpAjpIXksumVoSWoIOA44?=
 =?us-ascii?Q?Ej30pw/LqiZSdbJujUaEgUI8hCE4d4rE0EA7MsX7FmfazJC0Xbat1RnqHUQS?=
 =?us-ascii?Q?jhszNtCNrRu76E09Ckvi0gR1MnXwB7NKgULAPHPYd+Yzj1abIYIXGVUwJ5iT?=
 =?us-ascii?Q?Y84Mk2FjoQb8NGgsyvaQadGlXRCBf8ssJkaqXY1Zij76u6FivHgnjckMHgRm?=
 =?us-ascii?Q?wnyQZojxZE1u9TR22jz95PuW2LQ0N1nivH6/FJgjHrZi56zmTWdzcGj1nG2c?=
 =?us-ascii?Q?zo2uB6MW1+0WYexY9756A2gEId0TijtyYY2zsIRulfebZE2Am5Diy/13aohD?=
 =?us-ascii?Q?pOvtybDJvUY30xoIJThL/YK36KUWh6Y4Mcv2M/EKyQAZvNeKPKO3ICPe9HBb?=
 =?us-ascii?Q?3MqcyT3kdFyEITA2AWoysrqQfDFLaskDx71QjhAU/v6C5omsoR0l+97ku3j7?=
 =?us-ascii?Q?etE7cEjUJFaVyrH0OmGb55Z3tR5f35QyHwHirTzscR8qLQoL5VBKgrzS3ks5?=
 =?us-ascii?Q?IwYblKT3gFeJoSsKI1AO1pSXtqIwoxp183OwJq6BSvNWaWdw7QiZIP+Pt+g9?=
 =?us-ascii?Q?BmDfH3hX00vHNN9Hynbiid/PjsuVa0t0pn+AJNM0QyMuptRxZfghBiRs3eLL?=
 =?us-ascii?Q?i4bmZdMA3Hondh3qybm9uEFRxWHLIh9dS/vjWyfMPA389dJLVFB293MEebdw?=
 =?us-ascii?Q?abVnsRfKG4axLuL1qFJVUAqe7hP4m1hAAVExDgjd9B7//kQfmQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QJ8OLJjA9ii9mokIzFFai9qoq52DtdGjrojTMmiorddYO3oas88eNJU/YiL1?=
 =?us-ascii?Q?A0qTQHYXEeWyH+JxHsYrn1ogihqoRtk+aqfohohB3sKT00dvyiSec8kYO7Wu?=
 =?us-ascii?Q?OVRUK1liIckSIsuqNvdmAAHT1RHxunodByFbrFvjE8v5WGFLxPtZbNAU4XCI?=
 =?us-ascii?Q?Dwx7+5huuzwmSfbZTX99IQw4FO0pxiqfnkNRd2zRd6lfePUFM5GiogczJL/j?=
 =?us-ascii?Q?rl8ftFGfid/2FlsW6pzuYTOx15+slkTP2NoboSgfmpgpTsJv+qNpF+SPkAMw?=
 =?us-ascii?Q?/MnDjL9AAU8VTC9baWcvo0+VWlQQohOJkVbV9+467Wqs4+GMMiXr6tMuYJTN?=
 =?us-ascii?Q?w57r8xxj7Uusm+4SN63pMJxU0kIiwOYzLcd36HuieZAJd/R2UW9szmcKitE2?=
 =?us-ascii?Q?yzZD365ASnaMuBUUxkzrDG9Yiy3VKMGYCbx7gyVIFj68wsWYagWj78aSwyQ8?=
 =?us-ascii?Q?lCELnyBOorudbhdnowqRjqvgHOgcjGAwX48NYfRd0cZ34EJ+hnO5sSDIykkv?=
 =?us-ascii?Q?UoZ/zbkcaJUI8gD6bOdzJjf0LfqXWqdZGg0XTr30L+IEgzWQSgUaxUk5NG1A?=
 =?us-ascii?Q?K7J9F2UqhiFELWbfmY/6xjNisSqgiDmwkpNWMdPm/DBFopskNJibZZhNY+M/?=
 =?us-ascii?Q?OWPc6E0OVQbN9+Cubc0NiA7/gXK4N9rILgXJK3RImJTdaCpmO5EHreaWh/qC?=
 =?us-ascii?Q?OAHkfKCrOdRe4VVFU+hpYfSguBcY6KXsRuvi8yNwv2OEcZIdSmIr8KuYM5+T?=
 =?us-ascii?Q?WU5bqqBbZ20AZJNJGX3D8Fgw0WivCafSB10Pjb+fo1yHNVl1cisChIaqvfwF?=
 =?us-ascii?Q?h+NEc1xbbSINkiHigvuDkKn08PjGgKh4Qfa7byxt0pP3Xd/bFQ4sQviIBaM/?=
 =?us-ascii?Q?c5fBBlk2thLg9AaXfOg+RpNGb440jHsKqUCqKTceUVyUeRLTD2gTgHtLophH?=
 =?us-ascii?Q?emgNmO437cY8cV8tJZSu8k3lPDFKLiPj4u//oYnyBJ6phFmG7c/z6wjl3el3?=
 =?us-ascii?Q?66j4dzh3yw3eBVOEe8j5/LyNCx4hr0Y0vizIlxnImpTMI9dMuAeL0F1mZEm0?=
 =?us-ascii?Q?bwU5sIT5oufxg0lYa1HlJnDW1sYOPCX6Cd/08e8PRfU7j7abb0aslfHhcL7i?=
 =?us-ascii?Q?Pb7bqt5/b76wBY9mLRs4+nyNrJsx4GbT71HAJA4Tk7PcJ0d3vczrEQvhNzm1?=
 =?us-ascii?Q?i+pih6A6NvKlSQOOuenLo2suXU3bIlJHNDa5pdjjuNkQ/WkD28WumHkmE9kn?=
 =?us-ascii?Q?/8BIbUaGvK0ehINVxgGbW6sdxvpRokON++7l0SnojSd2fymud3aGM0JEBa06?=
 =?us-ascii?Q?z3tj2e40zoAjW2UB+EmYgkeD7Bb9nT8mSZraAFCaW5mhQM9tBQTgBYln44CV?=
 =?us-ascii?Q?y27rLJsHUo2nOY6pq4U0vX0pxRfouKXcAP67jxVADvqKiL9mvArdzQkvZtdF?=
 =?us-ascii?Q?ts5ox+xKpiUZfE3tQfbGGg6auob7UKGhdsy4T80pMkzgcd/2ihukn+db78F8?=
 =?us-ascii?Q?HjoesaZGr4DXBQFlCDJ9LZMxjysq9UzwA48fOFKc7DmSZuGi3TBAf6pUOQ7a?=
 =?us-ascii?Q?5v/blTtnW3FhruRKveo20JMEM6FSrJqxfhJZCfGwlAALD5oTdibvTFmPq5Tn?=
 =?us-ascii?Q?tQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2efe7409-32da-45cb-ff8b-08dd191353fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 12:08:16.0411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6N4u2NliR31JpUaqaS2aJP67cmhoj24yfJhgNvFrP+tsYiRRssJulmQ9ZXZPCzGRZ6BvUqtZMLg4hILvpbBhgF+ZDV/YKTg8+m5ekIJCSE4HQ6e2pPkr2jnIq9/RGF5o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12569

Hello Nikita-san,

> From: Nikita Yushchenko, Sent: Monday, December 9, 2024 12:53 AM
>=20
> This series cleans up rswitch mdio support, and adds C22 operations.
>=20
> Nikita Yushchenko (4):
>   net: renesas: rswitch: do not write to MPSM register at init time
>   net: renesas: rswitch: align mdio C45 operations with datasheet
>   net: renesas: rswitch: use generic MPSM operation for mdio C45
>   net: renesas: rswitch: add mdio C22 support

Thank you for the patches. They look good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested the patches on my environment (R-Car S4 Spider), and
it worked without any regression. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


>  drivers/net/ethernet/renesas/rswitch.c | 79 ++++++++++++++++----------
>  drivers/net/ethernet/renesas/rswitch.h | 17 ++++--
>  2 files changed, 60 insertions(+), 36 deletions(-)
>=20
> --
> 2.39.5


