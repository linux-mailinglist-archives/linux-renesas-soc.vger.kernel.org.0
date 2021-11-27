Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC4845F78F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Nov 2021 01:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344229AbhK0AsJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 19:48:09 -0500
Received: from mail-tycjpn01on2136.outbound.protection.outlook.com ([40.107.114.136]:59765
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232543AbhK0AqI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 19:46:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3We64krfKrrK5kW+KlNtlWkPW/xtodc21wWJZyeyoFJu3nBxHIFHr4x81Q1KQcZPusDlqNOOHJKbzhWjMsTJHO/ipqr+D9aUcfK78Pa43+PbLY+zDcwJnMupOesCJaJlNZtoB2GWfW173RZES1+B2ZwSXjuqoGOJ8X3jqQUKI6aQCmJZ57iPdu6GNJnm0X6kaCTZNf88r9mD1ypYk5bbbcpnw1+27qliYGqb+gyB0+KMizCoL1aBrFxmGIPzm8irgxu5Y2GkmgpQE23eGEi3+Y++iG33MFMkVOFWmrKTQYhfiByXdfsvMKDFZ6v+llvtAkzVee77t4dtYk5VcxAuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohcyQWf+Fp5in9f63KadgkDnMk72RYVvfbpAEoEG6S0=;
 b=QDKuu7JxQXyzHYOZpogalnzCETvhsaxiTQ0ksXOdHwEhsTuzSoE1NnLjHzOw6VOC3oOLhpkJh7vJfwEQYkoM5xBP3GQ/B1fCJlLZaK9VPt+if+Dis8jwGAWLKF6R5m4y+TMkY4qTEDrq61mONOwRPTMJOhe/uqOCconGZeugSo01j/kwua8P30PtVwTmnqhCfPMRhqAYjWKU/5LLxWKaKu44YaJs5Fs+RYyucvXR4U75giFX2piMmW2G6a6h1qvGO432RmAA1UvLHX8mjaUQYtMJlRorosd1bfvWxzmLGa+k3Dk15XNcbg7ObvON3qBz5Ik+bvsDfstCV/qqIfpVvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohcyQWf+Fp5in9f63KadgkDnMk72RYVvfbpAEoEG6S0=;
 b=d5ktp6oTwhkqMyV1IwI/vqcxoa218F7L7kEdJAh4KXQfUl+fQ5OugMdyA+jjdyTn3i79VNTXLVtm0Bxr6nba+QTRVt/Qx7bLjHpDH/zysLgfSrcC5RU0n8tThJ+7FoUvThTYY7dHAL3vtJvmR/03civfVbWUUX2WzY51egxITLY=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OS0PR01MB6338.jpnprd01.prod.outlook.com (2603:1096:604:e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Sat, 27 Nov
 2021 00:42:51 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::1d3d:8c79:ad2c:62ae]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::1d3d:8c79:ad2c:62ae%8]) with mapi id 15.20.4713.027; Sat, 27 Nov 2021
 00:42:49 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        John Crispin <john@phrozen.org>, Biwen Li <biwen.li@nxp.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH] of/irq: Add a quirk for controllers with their own
 definition of interrupt-map
Thread-Topic: [PATCH] of/irq: Add a quirk for controllers with their own
 definition of interrupt-map
Thread-Index: AQHX4EZYsVWc/1z3PkOzsYGcUjBc16wQ05CAgAW5wTA=
Date:   Sat, 27 Nov 2021 00:42:49 +0000
Message-ID: <OSZPR01MB7019E7DD7119EFF9C994AA62AA649@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20211122103032.517923-1-maz@kernel.org>
        <CAMuHMdX2ZRvDYA3idmw3nBcP6CO=2od6ZU-UeJo9vYsuB=fQNQ@mail.gmail.com>
        <8735no70tt.wl-maz@kernel.org>
        <CAMuHMdVS67BLP2XEdD6ZvVBVE2x11gKnQa1TqG659HXPM5scqQ@mail.gmail.com>
        <CAMuHMdWJhnXabKGpW7k944dzQHtwQtxw-yb2bRBsoaMw6N6nuA@mail.gmail.com>
        <87tug3clvc.wl-maz@kernel.org>
        <CAMuHMdWGb2xik+94RVwtq8E6+9eN=HfQLX3a4sTjKQXR96Udkw@mail.gmail.com>
 <87r1b7ck40.wl-maz@kernel.org>
In-Reply-To: <87r1b7ck40.wl-maz@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e7d06c3-9a80-49e8-0541-08d9b13ed6ba
x-ms-traffictypediagnostic: OS0PR01MB6338:
x-microsoft-antispam-prvs: <OS0PR01MB633854E5827EB3C66AF9E76EAA649@OS0PR01MB6338.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gcXVZV54C19mXboGVrbj/GHw9LRrk4ky+SyAOnmnF7/5fzhYq3Yh/UtFmG2bFf0rXzkbdzOIZuEmAIsRwB3dzC/VU8jDZcOblKE0SS8lHxRJXpjBM94tazYeRPo/aZpnBIlhH3HZUVxuPOItRa8CLLcSPduTrBdD8OuyX8Vjntu/u0znVbI/BRJYHV0wwxstnYBlmCqAnBZgblxxkhv44XdWvYjQUWaJ3O9eNi+T5JKinZDsITj+/FjJALkVNlpwJGPW331b/Ly+AwkJIdHP7elnd09hVq/qlnKlitmcc5QbL4ojsJIaZcNk0uqLpsoeDjTjET4HwSTUqMm+rXOh7e89UF6uQeX0LrOr2B0ne1vJWz33JPe+6BprAmtnrBdtfzIrmYUztTHbyQpKC4x1y4PWQz9mLyo0Ofb/kDhRMu6ZE2mh4lKUCM6EA1FsTXpVyRKCBqMv6mU6y/BTsOsIBjbuagY+WhnwKjaKXi0Ki7wAyBNsIzz7LLCMGqtQeqh0OM12O6qXjkCUS8a17idTWSmdDengrwvq1Kp8LYjKyAzNgA8cj9Ndxu3n9m3VLTct4Wsr/kalWXRefINMsYU86dnRLGVcn86CSfhbnqM/X9NFq6l/jkidKTMfPRHxJwWHB8omcYGktSuTbPCV0ny0ABRXtrzlOR05uCdxg0eXlx+zOp7SuN/jr5dG0Oi/+1oXnz6y4gQznCftQBOXlV/i8g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(53546011)(6506007)(9686003)(26005)(122000001)(4326008)(7416002)(86362001)(38070700005)(2906002)(71200400001)(52536014)(66556008)(55016003)(38100700002)(33656002)(66476007)(54906003)(66946007)(83380400001)(66446008)(110136005)(76116006)(64756008)(316002)(508600001)(186003)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Xck9QP7CJ8fakwWQ7KYGMlDv7HT1Dx39DbEPL0agVvHvWwsLuSUoH8ZHVp50?=
 =?us-ascii?Q?96raBm/oL1ot5U23ZpuaLBuqjqGZ+C53PnrAx00IH0/A+3Cm7CSoa+1JUztp?=
 =?us-ascii?Q?M2xd9R38K49kKHVuu59WyYDb3OYspYEvWZlcjylR5wn+pr9BNHpyAVNfi3sQ?=
 =?us-ascii?Q?pLGcTTicBAX1N/7bxLakxT5vNf+9xVVsLac6huYli+KPZHhs9n0ExPBE7Fik?=
 =?us-ascii?Q?v4fCBCUTMszvr5nD4Al/B2LaG5lTx0oxnnAC6+NnTTNpzOd23hgF/B5Vhv7A?=
 =?us-ascii?Q?NslT5XdwNqZdJ9NnqnPH5Q/ff5zVl7V2ao1OeCZE16taZSTkfVCMMrsoJoGu?=
 =?us-ascii?Q?aEtVxwmdxHCOhcxhoyQHE+itaOV0uYtIclROlyuT6lXMX+piORg3bnBIGofA?=
 =?us-ascii?Q?tYxs/Pdib0NYjl7IAiZIszTGHvw5oa14IJBW8ULgogh0K/i1M7Rbp7YBfI+I?=
 =?us-ascii?Q?5IWdK7OnIs048Q5u7CxYfNLmv650hOmPo6+Cx7KyQzv5l7sAh/k/qkMCHmFN?=
 =?us-ascii?Q?vRQKCXD/n2ZhdPyqeOxaXkaLGMyBDrYs0Qnyvt1QdCO0mVftRaZf+GL0bhdk?=
 =?us-ascii?Q?4266UqSQy1Thkc8lS44a8EfbDd4Yxd68WQ5ToKY2zLfd0JKtU+bbpAF7I8bX?=
 =?us-ascii?Q?FPqqV/kJnIBzU5Auj+7OuHC5eFAGWZuX/BXoB3mA9lSn6I226A07WEH4XWb7?=
 =?us-ascii?Q?WThvjtgzc3RzblcQFkzfMNO/38icay7BblWe+Dr0zd6XgmVznpdBO05+VDox?=
 =?us-ascii?Q?2jARPymtnlr8Jt7XJb9AxLD9auds6b1GITFh82h6X4vwUloLDSWjOBsz41IU?=
 =?us-ascii?Q?ydQODiw4r03LoKiI4FUTgJXkTHHXArKOS34X2R14uGBS99dnkjkCZzOcJOU/?=
 =?us-ascii?Q?OFG464Iaf8RFzBbUP//FN9ar0y1jP20jzNLPE+1rIGcyZgstg5gCiS/52R71?=
 =?us-ascii?Q?6F42ZYunsaSGcJ5WD7iRjypb++THH57jTb8ZOGgpBMO8nTICAfJtbiU0AaPV?=
 =?us-ascii?Q?xuHK+DjD2mi9G7+hKIcbXFVxuOldZF9ln4bLK1fSRsSnqx1sG/ESPBD1nNwz?=
 =?us-ascii?Q?9i6wu1M0js7+e5hQeGx+kbkkvmf9pTOwWTykLXlS/zspBqBHdp1Gtidsx1qs?=
 =?us-ascii?Q?z7YPrP29vZm13GoC+fVodrZcLhZhNybplCvM7nQ3NX6xchRvmNz3Ysvs1cEp?=
 =?us-ascii?Q?JzB8u/iN5fmQcPVvDbmKtsZmb/spDVHm8qLC0/aLdfilinLXcK2r4cncHNG/?=
 =?us-ascii?Q?OkzhGELLuMMxTMClh7btaybs1EYXOZRAvG2Cv3XApkuDOE513o2PGRVKDrfJ?=
 =?us-ascii?Q?6EacQNje0S/ntvIGNCrh2wwxj8n9GuQEPl1UyyzjUP5744cp9UOBdUlaPBD4?=
 =?us-ascii?Q?PCXm82xCyUSpk7aABfD95k0XPmNJ1tSGkuznlft9l5tDNrGqyX/piT6MhT71?=
 =?us-ascii?Q?akr+JI0JffyEwaPboIhHInox/aMCcxWnXvQVQcxF2nuvSbnOzi5E6tsfQvqp?=
 =?us-ascii?Q?UOMMWttx7hJZ3vs7Jleh+/v9rh/CsnlHd5oSv8iHR5AlQPo7FmRI03Oi0xQT?=
 =?us-ascii?Q?PiCR+atA1Bg2/r4hldNG5+ASo/8B/OF6TckSxiNjQXOGKiRqrLcqVZum1gIw?=
 =?us-ascii?Q?Zyvi+i87qy7lKUpYNvOgnqNsiHN42ctCo69QonZovDCIqdznrnt/lgIbiOUg?=
 =?us-ascii?Q?0UialbvU2mK9jMxDKmE7iHToNcHGJqdCCqaaG5Z6TtB3N8J3VVPNI3GZYteg?=
 =?us-ascii?Q?UkuI/lLXiQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7d06c3-9a80-49e8-0541-08d9b13ed6ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2021 00:42:49.4675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmPxAhGa5BQtUI8dYf4SSsD6wSmU5cC4qZUIJnoVa1vZA7TKdonAKkcr8tsWvvkAN512wdC+F1qKe9tWZrvWgfjKKGEQQa0JOTf+bcJGIEgs3OmG3lORp8bQcx3k8Wjx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6338
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marc,

> -----Original Message-----
> From: Marc Zyngier <maz@kernel.org>
> Sent: 23 November 2021 09:11
> To: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; kernel-team=
@android.com; Rob Herring
> <robh@kernel.org>; John Crispin <john@phrozen.org>; Biwen Li <biwen.li@nx=
p.com>; Chris Brandt
> <Chris.Brandt@renesas.com>; linux-renesas-soc@vger.kernel.org; Prabhakar =
Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: Re: [PATCH] of/irq: Add a quirk for controllers with their own d=
efinition of interrupt-map
>=20
> On Tue, 23 Nov 2021 08:44:19 +0000,
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Marc,
> >
> > On Tue, Nov 23, 2021 at 9:33 AM Marc Zyngier <maz@kernel.org> wrote:
> > > On Tue, 23 Nov 2021 07:57:48 +0000,
> > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > Summarized:
> > > >   - Before the bad commit, and after your fix, irqc-rza1 is invoked=
,
> > > >     and the number of interrupts seen is correct, but input events
> > > >     are doubled.
> > > >   - After the bad commit, irqc-rza1 is not invoked, and there is an
> > > >     interrupt storm, but input events are OK.
> > >
> > > OK, that's reassuring, even if the "twice the events" stuff isn't
> > > what you'd expect. We at least know this is a separate issue, and
> > > that this patch on top of -rc1 brings you back to the 5.15 behaviour.
> > >
> > > I'd expect it to be the case for the other platforms as well.
> >
> > OK.
> >
> > BTW, what would have been the correct way to do this for irqc-rza1?
> > I think we're about to make the same mistake with RZ/G2L IRQC
> > support[1]?
>=20
> Indeed, and I was about to look into it.
>=20
> There are multiple ways to skin this cat, including renaming 'interrupt-m=
ap' to 'my-own-private-
> interrupt-map'. Or use something akin the new 'msi-range' (which we could=
 call interrupt-range), and
> replace:
>=20
>   interrupt-map =3D <0 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>                   <1 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
>                   <2 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
>                   <3 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
>                   <4 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
>                   <5 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
>                   <6 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
>                   <7 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
>=20
> with:
>=20
>   interrupt-range =3D <&gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0 8>;
>=20
Just to clarify, do you suggest to add interrupt-range as a generic DT prop=
erty or SoC/company specific property? If you meant to add generic property=
 where would you suggest to document this property?

Maybe to chime in with "msi-ranges" we could name it to "interrupt-ranges"?

Cheers,
Prabhakar

> which reads as "base interrupt spec", "start pin", "count".  This gives y=
ou almost the same level of
> information, and doesn't interfere with the rest of the DT properties. Pa=
rsing it is also much
> simpler.
> But that's up to you, really.
>=20
> 	M.
>=20
> --
> Without deviation from the norm, progress is not possible.
