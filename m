Return-Path: <linux-renesas-soc+bounces-13783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D76C7A482F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 16:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D939188A451
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 15:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98C026B2C5;
	Thu, 27 Feb 2025 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BOZfbnA8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5EA26B2BE;
	Thu, 27 Feb 2025 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740670205; cv=fail; b=ln8nKU/rSVq73Rn3JQ3LfgkKZOOL52vaHY0F0DHgNErmmirdLcCaNB1F60JXiP23G5O+Ovy3OHa7m/K7N3FgZyv7ob6sx/AMBC+dERPUBhtUj7ZzzPeMhHRoYTnykNUMAjSdK2GJZwu9w9YERWhAzUBOW+ep20S0AcywWaFcgVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740670205; c=relaxed/simple;
	bh=Yg+HRYQIgy+HkyTw0QTdA/xj6l1pL4Sgx5IC0Lk44og=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EPQMG7PDjTtfwd5zwphlZG/CaDmh0kBrnByb+UUgPtUo98lga/RN1d50Bt/BgndixFIIlemh0soT8HB5OiL3Br0PwV4niayrRtcD+8lU+GHib+ZoQ/YWn1pPLtrF07b9KdGpcOpyyLYeYn3EncxukWOUOGwfEflkpXCILbC4C4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BOZfbnA8; arc=fail smtp.client-ip=52.101.229.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTQzKv9fHIoDhm+s2pHJlgaORqrm9OKpO0ANT9CIDWXAtnbsqtLYULFNKza+IyArIWvWVBLxEyIk0u6U4CbrYN2p52FTNE+KQN0AemoxTFIswQHaD1nkhGGMjpTF/wJVAeBnvT4OPNo7vAlbAUfmSRy0B0wTp9Mgm1UMqZh08CisZxCQiRUCfCDwbs9O4Oo4aC5YsTTOWr+EaOmsP122WqXbGDiNRLytIAZlg6G8khEnZ7ulyqMoLtqShHGafvR7yOMh0OM4Fqju/ccUJox8OhB+c42bCKiZDKZkqlML3KlX6mwS0hyFEsPSz34fzXru/hlev+uO+hAMEErApzBDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BO/kpKKGjSk+42e7A3V6o2+P4rOtBKFvdM1nJwtDbvY=;
 b=XFmJHZOU48fZy2rChQ6K1MDeA80YY1iqUJQ3TzTIgtTwYExpvI7I9DLu5GM0BIDWoTcmti+hiZEguNG0hsh3a2cHoBGqpKTIvp5HIWirZ+HpRNOpUcpZ7duYOuXniRpawIK5S9OadhF1WFV8he4sTIpo5FZmK9KZuCv99ZuSfFCSXQyaANRewNw8jdkFyvYnyIl524kOEKs0Odt2/0zkt2N1Q/IwMJuBFQ+hgjsp7TlRE3K8+ycPmjjBCybLIi9aHLrqK+Op+Qt6ZEp3WI9ZmJANek48JSNQUXdVl1esjhbRvmzmHhrMBDuRNunacCfC/6yTnBbzqSTya8ri13DcMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO/kpKKGjSk+42e7A3V6o2+P4rOtBKFvdM1nJwtDbvY=;
 b=BOZfbnA8AwqJWnMs295UwIEJ6GZxWxPxIgplgRGSdXIlnmJg7Kh5BFd/70FQpwVo5WF3FdifkEoSJeT5b9asJeUO0D8bc/nqulJ4Tebl7gW1PUZYxrWtY95wsks3mN+Id4i9/K+AK3AW5AyLNoY39cLJvJJVg50Yq/S3h43fPVs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB5690.jpnprd01.prod.outlook.com (2603:1096:404:8057::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 15:29:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 15:29:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Topic: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Index: AQHbeJzJXGThVn8cpEWsdB3fagweKLNbY8wAgAAAqKA=
Date: Thu, 27 Feb 2025 15:29:58 +0000
Message-ID:
 <TY3PR01MB113467C0A5623F4446B88038786CD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-4-biju.das.jz@bp.renesas.com>
 <Z8CBsrD2gKL-V-UG@shikoro>
In-Reply-To: <Z8CBsrD2gKL-V-UG@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB5690:EE_
x-ms-office365-filtering-correlation-id: e5e0e459-48a8-4d2b-73fa-08dd57439880
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?lRfJmXLlJWfuxYfLh1yE1q/PO7BO+hiC9u/3Xpn2RE4TZQPv9QWGieWAsFdU?=
 =?us-ascii?Q?kqguPnKFL9ZTYjv3TnC4UWqFpjqzNrWTHuZfLRQ5xpEakVOPwtJNPIhHErZU?=
 =?us-ascii?Q?ivt2LCa4GggDVYF48//YSkym+nPJs4qqDwate3/zW81b3sT/UVqQikJjUK/Z?=
 =?us-ascii?Q?j4+rTUA75uYVh9GlfHifsXp7rzLuR5EtuxZjrymQVPGF6aNX9WnX7bk9iz1k?=
 =?us-ascii?Q?QVDlqwbee9WfjMWAguMjiKwSHworKmZ30q1lr5zjjCMPcEjPmzQF48oV3Vz6?=
 =?us-ascii?Q?fOU7hofvo7aEqx4lcJkt4PRABKqkhS7b8WAbyBujaI+3LRCWQzNwA5IqcmeS?=
 =?us-ascii?Q?EyasTrj5XoagjsjHr1xO+uZ3nTrjC+IiLWEE4nh5LAn3k7XcoVLKvKDK2Zfr?=
 =?us-ascii?Q?4tdlXw1VpZYOPwAY4QQZU7A92e+6A25NrWWSEReCTNMe/dkio352Lfp5ITRl?=
 =?us-ascii?Q?VNh28Xx1G56XOb9omepVba6vhycYCDgZTP9Gb8kia68gsW6lvxzte7z9jmsj?=
 =?us-ascii?Q?FwNEcEiPq4VtGMD2xhaxqcMBjGKLQft7YFHfeVSHTkVfnULWAx8r7xf0dn9+?=
 =?us-ascii?Q?TPpjzXTpRhE3SeA3kiLtOz3lFLUieKgmAdk4/OlRwFpiRK884STzg46G8NqY?=
 =?us-ascii?Q?KpC06nRXTbh2fIsc1Wm/5iF/Kmms95tBo8BB0tan3CLBLq3TySBEN8MB6nJg?=
 =?us-ascii?Q?r//u8XRrhXZBxbNlnllEjJBus+DPSYBYtknaVF7vfKQ1Og6iRGugRXOcztvV?=
 =?us-ascii?Q?+a/XornIERTbyUFmG3nFbc/lfpOcaWXX/YzEpBdV90BjHc54stC7gYf3RSBH?=
 =?us-ascii?Q?s8c5+3WpRq8vmAo4pN3IknmZ651qZWGrHYuidH+aQnhSg/iejnjfSU7f/xJK?=
 =?us-ascii?Q?/sZQ3CmdWo2ujwNigpN4v2vi1s9Ihg0e5BiRWfgwUcSgKWzjVWNx49aeDS4F?=
 =?us-ascii?Q?mLRAgWTPg9hboDI9Nu/k0pRqkcLKxvM8wqJQi7MtGFuzR2qUCZiIWR52Ltdf?=
 =?us-ascii?Q?X2IgOhldKbZgNhyaj49c8E7/4TxYaSwQpX8oUlcwOCywMRYtIQDgmaIx5aAD?=
 =?us-ascii?Q?o5EozRQJkvHY5h7wdV281lMjwPfFBTwXCQIXFYT2cO3+WgzSih1rCCvtudAL?=
 =?us-ascii?Q?fmaxU05SnGMKrf+mmbmD+FcaFaRG5QMCgvirmMPSpqZB0IXJlANgP/qAc0b5?=
 =?us-ascii?Q?yIC432uuWmu0VaYOeZVrmq2dbl3V6uceQZtQGrMZh/9e5oLzq5axPYf6ROho?=
 =?us-ascii?Q?ctqhzTz8jn6ymTTqE4RntENqAs6uBO+scUC9qZufXZZ5jQvLtjLXFd/GkYbo?=
 =?us-ascii?Q?x5CjV4W8M89p3fT136TKEau0M+6GfcNdubO7r8B6MQ/cirH5wWXxBNxQyVLC?=
 =?us-ascii?Q?/RD24zapgpzidS2bLcX6YxNJoffAHlZB45Xp8hhIJ0NpdLGg1O6sLayW+WXs?=
 =?us-ascii?Q?8L9cMSPRyprBpTD2vxRa+I0j3RVrZPsA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Wp0r3dneYmvCweXWXoz0IY8t/mECw/uSc/YA4uISqkrDvdDDEDZ72U+BBXQF?=
 =?us-ascii?Q?Jdkkob1ASm3SUdUdg4Voiw8KezcMHolj12Uo7QLxAJK9DJdxWaiXgFxddc/f?=
 =?us-ascii?Q?s3Cn+WWysZDs9nuBVWf5wQM0Ki3VuXzo1lsDB4WOLfvy83C5KZ3BPfpOZMzE?=
 =?us-ascii?Q?z8j9yN9RclerUvwMyo7BwpY5TFV5KZPFSiu++TOLeckjeS8hAIVgXQaCfxcp?=
 =?us-ascii?Q?zIkgF0CiLo6y82UFVCw5V6Od5b2akFKoBCjpkZtES4JG438YbSwYt+gcoEcz?=
 =?us-ascii?Q?jjU1rf3A0Q8mmQHwWRR8gYxyEV79QfonpHJQv0Xd36TMBcDg3rVb2P9hpGz3?=
 =?us-ascii?Q?4Cz3gV5Elo9FaRMRxqRU/LB1WBZLt++gizRsKJf6gPWPv45wCfehYhl+wtGt?=
 =?us-ascii?Q?4dbJxazhujG+rkSkzy7YC8OQjrgZf1gZsb0ktOYneGAQAw9jJmoGW3xtzKvF?=
 =?us-ascii?Q?5PSvH+WcEfZ6a64qxbDCzu5ae+aLN94Pa12pqNeg7Etd8pD/cum2K20Ju2ur?=
 =?us-ascii?Q?Y7FCqNMiY3VUHyhj7QIo13TugpoXe2WUlTn4vXYIa5oMpoVEOkjr1k/DKt59?=
 =?us-ascii?Q?rZuXEbLl+Mnrui+j8K+DBHVsS5D7+ZlNpg2ztv49EWks12Hqy5qLWKZtM01d?=
 =?us-ascii?Q?pNALIAec2Ioa98ORDVhXJM/EeuBAVMo+4mJ+vCDyFFlPX0890CUUhrqdSk3W?=
 =?us-ascii?Q?ADCyGBYWRAiIJFg39jrFguGPYze9cdbzD7bgghgS0KwU0wic9M/kBhXoVkgy?=
 =?us-ascii?Q?9TxNHMIb97qZVZt215t1HblgEzHYaO10nwucqaWkmfGZ5b1DPmdOTEz1ql5+?=
 =?us-ascii?Q?GxSwBeZ4iVknFZF6wCIbxkAJvCJc6PLxNqMCq7lbJjzG1ARwo4baq0i/h3hN?=
 =?us-ascii?Q?66vxKCdb1ddN8IFXhJis804PoEKz3BHqPbNI9IN5cnuRplolyjbV6mDotE+C?=
 =?us-ascii?Q?rvlD/xNDbRvjgnXs9tXEaA42yH3c1fXAupMcxz/KOwNU6H6DgXgFw9Qr4C/a?=
 =?us-ascii?Q?eqzCrhxL2VHHu87HcZNiqr01XdCH718sWBpp+S45Pb6vCARRjXsuxuH3x0De?=
 =?us-ascii?Q?EOVwOkXIwP5fRIDLW5acmn4eRq0NRl6DOmOrSF6QhCcDhBwEZ4OnBTprvugv?=
 =?us-ascii?Q?e3w1NXZaKomInbaTM1hbCMGt7iVsOVs6msVdnTTG1nkvPcBxhljRWD50LgVt?=
 =?us-ascii?Q?xYpwOy9NEm9VYEcPLqlv1ym8A1JwHSZ+lOhDQnsGfIqn4JBeDK0bf9bBENNu?=
 =?us-ascii?Q?WU0yXMkgZEI+C6bF5M32V4rhvj52+sldEXnj8v14wxjTO0T9TB6fgeMwrjVk?=
 =?us-ascii?Q?xiWNaxbyux4za8YHbEkdjLHSs8bf0MTu1HdpvG/exmcfYely1if4RGzFlfIB?=
 =?us-ascii?Q?3EgNaY7eW6iES7U6CliuGITF4x2rgUT4TyAGRhkBFsF/si3EkKs153Gv4GFr?=
 =?us-ascii?Q?iPkTx7dDxeuafWL3SIlJIsshXHG7Z6bvPQ+EmgI0A673/V82b1rNVtPokToh?=
 =?us-ascii?Q?zTKoxWb5bLdJ4Y/adFutvULs0G9pJjcv2qbf6KsMShzK5PF+DSgPbfdK4AQq?=
 =?us-ascii?Q?9Ipioep33TC9bnHRzR22eWHhpzGlFupQp8PiiC8V7/7KjenWSVAKz4c4EHbd?=
 =?us-ascii?Q?bg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e0e459-48a8-4d2b-73fa-08dd57439880
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 15:29:58.8838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ik7QPyO5siTxTYT674VAPH6ZQI/DtCR0R4zDTcizEBbP3Mv3CrYTTJzcn8tr8CC14RE4EB/XZxGDJ7Q4UfmogOLD4BiWEwMk5abDz98aifk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5690

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 27 February 2025 15:16
> Subject: Re: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
>=20
>=20
> > +			/*
> > +			 * HW reset might have toggled the regulator state in
> > +			 * HW which regulator core might be unaware of so save
> > +			 * and restore the regulator state during HW reset.
> > +			 */
>=20
> Since this is a hard reset, can't we just reset the regulator to an initi=
al state? It seems strange to
> preserve a value when the 'preserve' flag is explicitly not set.

Assume, this happens after the card is switched to UHS state and=20
then the command won't work in UHS state if we bring the regulator
initial state of 3.3V ,

In external regulator case, we don't toggle the regulator to initial state =
of 3.3V.
That is the reason it is still working even when hard reset is applied in U=
HS state.

Am I missing anything please let me know? I can debug further.

Cheers,
Biju


