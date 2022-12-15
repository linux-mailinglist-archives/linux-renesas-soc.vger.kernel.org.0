Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4DB64D85A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Dec 2022 10:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiLOJO4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Dec 2022 04:14:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiLOJOz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 04:14:55 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2103.outbound.protection.outlook.com [40.107.114.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76B52B603
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Dec 2022 01:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcdZevMzOhJrYK7XwNEjK6BZcpu3i9KofbiXOOGYzpIhT1V2ki0fqUusUFoW+pUktiuCQ2rv58M/PB7q3WwEx7LlICv/bExEQJgM6P4QSM6Oxm5+oC6anVZ8mG7gLgNWqgvF89voYtSy6cdIZeKqjHVLL0bIRaTTXcijtcVruirfoP1Nml3Oq0V51lTs7eGYzC4rgZvKTB4y2dFSFnzVdWFDQwIFTvTqj5tHlgtDFn1rGKvd7e4nV9143Z9vNHi/rn8PZQwYaLAVVhWcelH3oyrF46Dxo2yKC9IuJ+elt2uEk/5hVMHW+KLsem1sbBPaxVpxAtnoibDABFK8XtYvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiB4UtRaGRIgIyoEu0DhdqweS8RUFsvlLqyMLTsB4dE=;
 b=N/+AlVPmaRyC4e29wTCfwQpzS+13BRTP4r5R2RnurjYxdHKrzHMUzRcxeORidlg0mdaOj0E5TlHvP7sxPnNWb7ts0IcDtZEeDhtqkWYQo1NxZaEYLM7RNsZm9oy4vEGb7UbqQdCug771qqz7Tw904R7/5RI37HJfuLMjsQYlgT2v/zx61COFbzwChczd7pZSAPurs55Okd9u5vYdtOGhMk1l21FsUa/gTBw0SMFSKGCG8lxlQyGBL4hB6mnXsmd/u+F3WvuUOCFlCQ2gTW0AbNY3l6DoTUoy6gUUdxCuHEGFQjmsgje9800bBmPvx35Ox/6DCSvM/NYy5rL8IT9EGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiB4UtRaGRIgIyoEu0DhdqweS8RUFsvlLqyMLTsB4dE=;
 b=UCtWHE1Ve4tz2w2QkzzlHbefKbPRtcyOKjJQY9k2PRKpQkFl9GVu2+UhxCTCAjwtfr8zVLAz5X0chQZPQa0X+ka4K9XC2KlqUj20ER05kxkDxE3AYdMo7w0DSzBI1wamMuyyFIk37oN431LQNLamwqyrYWl6iAKvgp0oSpkZUDs=
Received: from TYYPR01MB7024.jpnprd01.prod.outlook.com (2603:1096:400:dc::9)
 by TYCPR01MB6301.jpnprd01.prod.outlook.com (2603:1096:400:79::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 09:14:51 +0000
Received: from TYYPR01MB7024.jpnprd01.prod.outlook.com
 ([fe80::c3c4:a23f:33ad:d6e2]) by TYYPR01MB7024.jpnprd01.prod.outlook.com
 ([fe80::c3c4:a23f:33ad:d6e2%7]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 09:14:51 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Robin Murphy <robin.murphy@arm.com>,
        Conor Dooley <conor@kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "guoren@linux.alibaba.com" <guoren@linux.alibaba.com>
Subject: RE: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
Thread-Topic: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
Thread-Index: AQHZD/TEl8pPFAVi00Odphb7AlEWFa5t31KAgAAJSpCAAL/6AIAAAeQQ
Date:   Thu, 15 Dec 2022 09:14:51 +0000
Message-ID: <TYYPR01MB70244846B75DBCDD9CF86CECAAE19@TYYPR01MB7024.jpnprd01.prod.outlook.com>
References: <20221214180409.7354-1-palmer@rivosinc.com>
 <8DACBAC8-F220-4DA7-BCC2-4E2ED9E3E03E@kernel.org>
 <b8665f9d-44cf-5719-c206-5eb622978b1a@arm.com>
 <OSZPR01MB7019D761845E3AC9E30F2D2DAAE09@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <CAMuHMdUt7coFBx-+mXJcf7E0f5S_Q_Rmb6VVq-4E7_m99GXyRw@mail.gmail.com>
In-Reply-To: <CAMuHMdUt7coFBx-+mXJcf7E0f5S_Q_Rmb6VVq-4E7_m99GXyRw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB7024:EE_|TYCPR01MB6301:EE_
x-ms-office365-filtering-correlation-id: cf30ab7a-0a19-4a0a-0d04-08dade7cd254
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rA3YOp1CIF8s6oBldd/7E5TpS+KlpFrHcDo0LiDSo+ognVM2w4k5bi3NgDInhmUP9YvQaJhUAtUNvnzkUotSED/d13kjoJ/xWLiuFEHUlGFwo9Msx1nAyQ3cezdmuqN/Jtl9RdNjfbR0X/Yr+vo4rRE60zfJ+OYPtqUZ/TYWcuQRlcjUSYhgekBznyRNEH53Zfivj2J+tim+Kcm0JbzYityZEPEekrcknvbZkXHikrzMV5OJ7OW4r0uN6dWp50CjNb0nhEIF61NR8V4T7qoq5w3BFUODmccz6SpyLxGDBnCmOqJBe9YE0TkQNnGG+rxA1wIw6cuGHYxpo+5VhZaSSlzMAx9bQLZCAUAkdPAPBolVX718YZpKFEgcUjpMHe4dLpXR6lZLQ64kJ/GOCB6ac2Ua2PKkITPbiEu1BsmhRY93HFVkDjfQRjEgdv8wQNw6enFSPCzDCHAJQSADwUCznoZmEq889t0/ZxHxch4q0WCeIg9fWJIVhZWH1fs0Ywx/n5SxyicQBN9sCgIfWSt1cW9Nwhny3FnQbEfbPIvEZN9b2Lk61OQb781IrceFf/H6c8LJZlAOi+HwvKCSFEtlBxMwpuXX3IzT9NrFc/xK4JyvWeXAlOUiGOcq7yf6S86lfPNELf85YTefygeKmJaHzpLGTvFBrGI5h9daijGc6NFpTDb9znvWgRT17ewmFtN20iEqgyEoZIkzny56CErBFPzs/Ok0DeEl3PXViFlbDcTEXSArKkriuCOJWzukuWCoLibfIkZPgJmjtrEWAZ/1vw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7024.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199015)(26005)(478600001)(54906003)(966005)(186003)(7696005)(53546011)(6916009)(6506007)(316002)(122000001)(86362001)(45080400002)(55016003)(38100700002)(38070700005)(9686003)(33656002)(83380400001)(8936002)(52536014)(41300700001)(71200400001)(2906002)(4001150100001)(5660300002)(66446008)(66476007)(66556008)(4326008)(76116006)(66946007)(64756008)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L7jPHcWH6uTBVw6+bBgko6hOtdejEZPR19pYhRjHr+e3xZuNTIxbSm9CCIlD?=
 =?us-ascii?Q?ZGdDWwINoHdNqdRiDVkST0rzjALkHdF0nLGaL+Z6Ss78YjoH/vHD3PzQrs45?=
 =?us-ascii?Q?FIoOxvD0HUQvfx+LY1EPbklEE1iDn7D/p+FahPVpBe3eig3qUa02P494CxF0?=
 =?us-ascii?Q?8CyYSTq6cx0sgNfcXUuNLXVdZfSf9ctLkYNXDsw4ln3qd76sN78Qas+q8Ija?=
 =?us-ascii?Q?gazPDxXbUgAgPl8lDFL+1w7tY3HII8hHgdiVpPB+DfRnuhXQJIwu162mh4dQ?=
 =?us-ascii?Q?9lQyR82JSFIs5o5TZVUsXy3UD8l3+YNXqFsQ/R5D5QPfZvp3iJWzz5lI66ie?=
 =?us-ascii?Q?pNt5W5Xz3TniiIEqetHL9Cq0IRXeW5OMzoBLP29h0J33HI2P7ArDxzIxncEN?=
 =?us-ascii?Q?D0VeSu6NT3DRRksXJac6MksRUdsyL4PTIW2ISI/Ri19Zn6ZDYywQjOOJFRIK?=
 =?us-ascii?Q?RKKB9HGLxfy1vkURPXm7B7ti5EUJYblvoEAP3rWL/y/GJmHdQ7QW3Wc6uMyj?=
 =?us-ascii?Q?GER1kC/3qoTF1nbAK/pnKSNcC4eu00Q25nLj5tpjp7e8hCBuOvOqmgfOenuY?=
 =?us-ascii?Q?0B94jWjrqyspU0ol6zTqmFjoCrRLaV6bxoLnrnaX8pz4VxLu5dWo00VG3ex+?=
 =?us-ascii?Q?eWT8D79saL6rsXF8l/YBRt2BXVT6K/8m0mTjSywCyOaBKmK5mxFkBtdh1fYW?=
 =?us-ascii?Q?G+Pvy/exciJp69K1KmQZp2L+gd2uegRfFzU5Y7y3JZ5u0Znc/ctiwA6y56Xp?=
 =?us-ascii?Q?bLmao236H0Z8+D3k4TAh+kIGdFakOFGSRcF4fQbK2XJL1FISVYcxAhZs4G5q?=
 =?us-ascii?Q?hCP4Rf9rK8wmX4PDBt3D693Vx6MYQIjWFdH43ihSLZPjwbco/CxwSCmwWKa7?=
 =?us-ascii?Q?ORUbk2MiZe859zELFKjMq+rjDKsoqfodBjeak85WM+KqHambQS37H/vZBKSA?=
 =?us-ascii?Q?EL8G7jayXe1jQFyN2r3Es9f4SFVYeTKN0rX9JFGiATUzwMpUwlkEgqm475+q?=
 =?us-ascii?Q?i7jfYs5u+hIBhFgEQDpvfezjx5NhwY46820Ffu6Q2S31MKOg9fRL7LPXhsIb?=
 =?us-ascii?Q?nHk9RwCtG+gqLVsKH2CQfzhMKtt2xrhVsPHt1t1uBBrDaHifDJtQdAO0OzhH?=
 =?us-ascii?Q?b/pN/0INhezxWKSziYdG6F5NKq+BHk7E/j9m27ES31nCWgP72Xv7NXW0zTrQ?=
 =?us-ascii?Q?AhNS0dLqP5KQ2nc+GRE9uJ8lAzow9S43uycv3JA0yauulNNfhdw2L+wL4y6o?=
 =?us-ascii?Q?nqGsw9ADZHjgc0ZO5qmiAlV9eza6ckHorxVBk9KdpoM2OojUlUcQQVEn7f7f?=
 =?us-ascii?Q?fTmzriK60rpzA2ddoIzTKtf2mLoyhFrxWIc+U9ysTImtfmQ24IKyWluvWQCO?=
 =?us-ascii?Q?6Tg8iM2UOM58q7DEjTMvfaFaCb1hmcGfr8QT1rbz7KEejhDxk0vGsd4j5C6h?=
 =?us-ascii?Q?C8pHCn9LFYdZGUN1SOu6Sxn4txP23RXIgh+pn/eRGuB4VhJP/Ws82sYUO2US?=
 =?us-ascii?Q?EYJd83Ca13PKwW5WtfJ6KXBDwEcCPEGpALquTGWhVnxtSUQbfsT18qaedXd6?=
 =?us-ascii?Q?wR/pnG/XL/gs+tW9WP4k4iFKUQdHyvirJdwMGBVvRU3wYf6U3Mg3HQVwTgC+?=
 =?us-ascii?Q?3hLqcpBdItCkArp4RQDLCrA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7024.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf30ab7a-0a19-4a0a-0d04-08dade7cd254
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 09:14:51.1912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XKf0kAykd/9A4wQYCyVawn6Dqo1oVGHjDb79BobfNTwevAFMPWZtMD0rS6/35K73TQAfBtjILQkGsp9YOZnO7iL9LH+1PxT5DhqwSdCRvkTajI9veNESXt1bKbgg2awO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6301
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: 15 December 2022 09:05
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Robin Murphy <robin.murphy@arm.com>; Conor Dooley <conor@kernel.org>;=
 linux-
> riscv@lists.infradead.org; Palmer Dabbelt <palmer@rivosinc.com>; arnd@arn=
db.de; iommu@lists.linux.dev;
> Linux-Renesas <linux-renesas-soc@vger.kernel.org>
> Subject: Re: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
>=20
> Hi Prabhakar,
>=20
> On Wed, Dec 14, 2022 at 10:40 PM Prabhakar Mahadev Lad <prabhakar.mahadev=
-lad.rj@bp.renesas.com>
> wrote:
> > > From: Robin Murphy <robin.murphy@arm.com> On 2022-12-14 19:46, Conor
> > > Dooley wrote:
> > > > On 14 December 2022 10:04:09 GMT-08:00, Palmer Dabbelt <palmer@rivo=
sinc.com> wrote:
> > > >> Without this I get a Kconfig warning and then subsequent build
> > > >> failure when building allmodconfig on rv32.
> > > >>
> > > >> WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_L=
PAE
> > > >>   Depends on [n]: IOMMU_SUPPORT [=3Dy] && (ARM || ARM64 ||
> > > >> COMPILE_TEST [=3Dy] && !GENERIC_ATOMIC64
> > > [=3Dy])
> > > >>   Selected by [y]:
> > > >>   - IPMMU_VMSA [=3Dy] && IOMMU_SUPPORT [=3Dy] && (ARCH_RENESAS [=
=3Dy]
> > > >> || COMPILE_TEST [=3Dy]
> > > >
> > > > This here is your problem afaict
> > > > I got a report from lkp about it yesterday, "blaming" Prabhakar for=
 it:
> > > > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
F
> > > > lore
> > > > .kernel.org%2Fall%2F202212142355.b7vf3Jh0-lkp%40intel.com%2F&amp;d
> > > > ata=3D
> > > > 05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.com%7Ca51ccd27ccda
> > > > 45e7
> > > > 53c208dade16c553%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6380
> > > > 6648
> > > > 6632283001%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l
> > > > uMzI
> > > > iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DFshRCpn=
I
> > > > oU0b
> > > > c38MYnesotcgOV4JT%2FXVOidbDMpAWbc%3D&amp;reserved=3D0
> > > >
> > > > I hate selects, just ignores the dependency :(
> > > >
> > > >   && !GENERIC_ATOMIC64 [=3Dy])
> > >
> > > I think the existing assumption was that ARCH_RENESAS implied
> > > !GENERIC_ATOMIC64. If that is no longer true then please feel free to=
 adjust drivers/iommu/Kconfig
> to suit.
> > >
> > IPMMU is not available on Renesas RISCV SoCs, so maybe something like b=
elow?
> >
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -283,7 +283,7 @@ config EXYNOS_IOMMU_DEBUG
> >
> >  config IPMMU_VMSA
> >         bool "Renesas VMSA-compatible IPMMU"
> > -       depends on ARCH_RENESAS || (COMPILE_TEST && !GENERIC_ATOMIC64)
> > +       depends on (ARCH_RENESAS && !RISCV) || (COMPILE_TEST &&
> > + !GENERIC_ATOMIC64)
>=20
> Negative dependencies on a symbol like that tend to need future extension=
.
>=20
> What about
>=20
>     depends on ARCH_RENESAS || COMPILE_TEST
>     depends on !GENERIC_ATOMIC64
>=20
> instead?
>=20
> That does mean the question will show up on RV64, too.
> Adding
>=20
>     depends on ARM || ARM64 || COMPILE_TEST
>=20
Guo has posted a similar patch [0].

[0] https://patchwork.kernel.org/project/linux-riscv/patch/20221215073212.1=
966823-1-guoren@kernel.org/

Cheers,
Prabhakar
