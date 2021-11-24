Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B4845B47E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 07:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234807AbhKXGwU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 01:52:20 -0500
Received: from mail-tycjpn01on2126.outbound.protection.outlook.com ([40.107.114.126]:8775
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234268AbhKXGwT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 01:52:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAjokyxjz+KJ+BJPJjnz9AvToBAviZIUsJJfWTkBCT9VfLmsETznZrPP7/RyrLgzoY4P0IFgdkytRBNVvxiat4dUQ0Ed1G6nEwY0HPSx0fE+0vLbx8iMzx1dahkK8RA1fvVxiuubV8yMPzY7OQj3ncts+LRLgXpiBaKE+Jql1S7UKls2cIIkaOYnDfegRrGKOQ4nW/EO3DvCBwucSODCAuMwjYDzwtIJR03ccdePHhhS145PV51pSkQojEg4yBuQ8P+IL3cu2By86obyb7b7cjFV0mk/J/lE2z+6NzNdGIp6KOJkLJhCaJ84KV7b+2LClz2mVJUVkO47w+Iz1/Cymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqi7IN1BZXZV0peNf6zJGEZnfmXupSeCVkX+oXJ/7GQ=;
 b=hcEYSjDl2d/O+8T8Ye1K91eYuw89f9l5KXKKtPeGjQXSC8JphnbJeKwWiji0uvJRp6N96rF6dZC3+yD6MD15DSF8UYrjg87Tw8FaOG2CQnvDcs0dYBCaMWkmJJnHAaAotvvTRttkcr6gKAFMqL+wYIQGaMBT3orLk92Ob1A+sHKhePaqPA7UYbuhfL2bWSOQSGeWddyLaw0ifgZhW1VDul1xJb9rvZ3wiW9Cish4q7EcD6CbA1z3Y71RtyMBJYX4bn82uMEq+OWKuZ7SRnCPKJQJmK3snWXdj4kSsvKk8tZQe3B7VZ26ZwutZrJm+OPwDDGkyIJKEFd8iiAhvMechA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqi7IN1BZXZV0peNf6zJGEZnfmXupSeCVkX+oXJ/7GQ=;
 b=Pz3wmfFTUPtFMwoEqmm9vq10VY5rrFWa2W/dRAIwqIUyibqOxapRUlIuFQqiajhWk4Cr+uwMWnrkIPjNU3M8ciczTHU2vFuOW81YhSz8QBGCqt7ndgxPQZfMsHG51qaFCqp3kJG4f9V0uc7NB2mTTy2BPaqBc6u/OAFB3jMShdA=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2959.jpnprd01.prod.outlook.com (2603:1096:404:80::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 06:49:07 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4734.020; Wed, 24 Nov 2021
 06:49:07 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH 10/16] soc: renesas: r8a779f0-sysc: Add r8a779f0 support
Thread-Topic: [PATCH 10/16] soc: renesas: r8a779f0-sysc: Add r8a779f0 support
Thread-Index: AQHX2r2IjR6h950rWEiEWVEKCI66KKwRVfEAgADy4EA=
Date:   Wed, 24 Nov 2021 06:49:07 +0000
Message-ID: <TY2PR01MB3692234F2F5AB62AAC5F987DD8619@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
 <20211116074130.107554-11-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWgDRAMp5nAK2S4QcBXYysupQj+iAdTUN0orxzBLKrOQA@mail.gmail.com>
In-Reply-To: <CAMuHMdWgDRAMp5nAK2S4QcBXYysupQj+iAdTUN0orxzBLKrOQA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4a3a0f4-8e09-4881-0292-08d9af168359
x-ms-traffictypediagnostic: TYAPR01MB2959:
x-microsoft-antispam-prvs: <TYAPR01MB2959651F2BE4E31C025AF6EAD8619@TYAPR01MB2959.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VUDMBPYeLLiKZLaT18mkPte2W2r9Oq0Vml7rNZ0tckcFr7hciqwV9nbBR1dvuFyw37hk0EmnIN90bPq2bBCR3F58PtraoM3/X7NTf0wiagqotLwmkAjbO9qdrOlY2ZkbvxXiK3io4Uq/k976rfgfWbokLbJv0d5ObiWrwn2BeExUPGeZzh2ual0YVfPGJaPXq5hDHL5gdI7QSoywrKLPpz5/eaOSVuvQKSnmV47A2sHF9AEQ0nH0+GuZrSWHtztu5rEoiK/4QOCmDl7ofRkQcO0QDsBPckgQ+FCjYHToSsWbl2v/J9Iz4RpBtPav0oMtOOxzewIDZY/TBKwAN9Xpk4Ay44saJYWSCv/Fs+RZGNQpIHo1MjG/F06/RgR2XeWWVr7IIhfXLrEuc+jHARWyWVpW0KWqiLyIo80Z73P6AaQtPzHrCn0/MTb129bkVby5fn5WqIf/7jgoGpxC+aHrk0KM++jdp/3BkRxCzXv5Be3ZuL2szH52ETmHt0Im6vrlLivqRNuvW8bydo3E2c/nzMUIvQG8idB0gAJTBgts8XJAtTp+tWxfL10oACvPRdTCycPEsWza4NViYD8NJkbbyIu7fzB8qB0N2zXR6VzzakX4TUxheBZu640yHG+h06XApV705GcPxh64I+Vr1IDEvkHW8AZ4KRshHi4SwuKB+waVahauW4lggr5WG9GwquIlNKltMNY7ajw50Jzq07flRCwEOKf6hyvSNwpke59Ls2wT1hML7deaHBAbetTwVtoFRqF+ihX39TMx+nmNmWOXBE8UnFnkv9nTOo9W4gnu4SA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(71200400001)(122000001)(26005)(54906003)(33656002)(6506007)(8936002)(508600001)(53546011)(4326008)(55016003)(66946007)(316002)(66446008)(66556008)(66476007)(2906002)(83380400001)(186003)(86362001)(52536014)(5660300002)(64756008)(38100700002)(7696005)(8676002)(6916009)(76116006)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UVBfNGeAHvdpLnMzrUVXI/nQ8MI9UGBSkY++RofVgUReucy5cnUY2/TmmAQS?=
 =?us-ascii?Q?/FjZGJTPfh8cHqmzDSO0Rx9wq31nLh5HyyK3qgVHjpNrGNKGHMdWCC5e3JdT?=
 =?us-ascii?Q?jFUZ1FWZ+FSUThd1j4PWwMUiKgrmD6sDRWpZuU97vBrezQ8BZLf/7WHmoWSq?=
 =?us-ascii?Q?KGyEsWbAs1y3VA82BED29vLJM84Os2JFF2WhrI6gHcPpEaYnYtsZQq1yBI4B?=
 =?us-ascii?Q?taDPQFtSkdvRAtSwMPdb3tqwNVdwOk0QzRJmbmREjPqeZ/K0WXzxpJ6+NWqC?=
 =?us-ascii?Q?Ubbr8POr2mXlHMEePKeaVNZdhrY9nhrZj/rlwBHkC08ABTSUrpyH5RVQKx0K?=
 =?us-ascii?Q?04rc4VyuJO+KxlOJ563zzJA78NG7hsYUsAtS1hyFH7oMKxd39BbTemDsWYH+?=
 =?us-ascii?Q?nW2QsmaUu7c7T8W0EjyVnjFQa6rlclDQbPgtEt19u5taKReJWMnnKTACV1Um?=
 =?us-ascii?Q?WmbNqftG9d19dXANJXtztgki63kBGHfRdFSWIDGXepbjWmYv4yBRVrneiRZp?=
 =?us-ascii?Q?NXyC6nRRfhydI+m30XLr0M7CWCcFFOhCjxeh5MEzmxgDG3g44P7ESV/foOjP?=
 =?us-ascii?Q?J9Sv4DHolzk55mtmn7tQ5xY7DRTvtXchAjywYv/PLyXsh36YoybsqC4Ha4/I?=
 =?us-ascii?Q?stvtrxhqREaODkvWGghLAsF4g5L7a8ei2Fuic7QZ+idXCIi3nJtmstDZ7pNZ?=
 =?us-ascii?Q?lRW4wM9irbJ5EySPp1stycNFLLydqQxFRv4y6HjLrQu+n8cCaquJiuDgtCGx?=
 =?us-ascii?Q?1bCBxvT2cDlA2bvTRgimFylhRaiSSIh2nYJSWcMK/UYqVzaxmYjVtOBf0m6r?=
 =?us-ascii?Q?HRGcbOvi+mA+Y0W/tEolU8D2iRFB8ThWKiZRsD355BOqcoJSmhwG+JACCYry?=
 =?us-ascii?Q?0h22fvhRDCvomDhVVYL/QGNfW1Tbz9iMUjTJ0fhb4rTuu1J7Gyu1UEUMXE+c?=
 =?us-ascii?Q?+/ePLP++7/lyswlh3VZmVL4t48AYNDXdE4jO+AeexqmNcy1nKG9eQJDJLP+q?=
 =?us-ascii?Q?fCtsM21icbRzOVkShCPcvmvlDg5/Tz0EtII9xaWHKRdsQUBtjAU2H4obBTfT?=
 =?us-ascii?Q?trkraKrMbQKrHGFxW+QUqGxTcOhK4zKk8wxZoQbeyQ8d3xrfCrylsjD5Yh6G?=
 =?us-ascii?Q?z+wmUkwv+dI1mp8rI1e5ZhuPgm5Oy+F1yFzugQ2RBSlLmsBLSSQv61q12nIu?=
 =?us-ascii?Q?xV2T4nHL/C7GMLmbBFgeWOdCN+SsZesO7pW+nncNRDzsXB+ucE+uxY+QsQrt?=
 =?us-ascii?Q?YWmrpAGCAheCFNmM/bnOoM6vUVVaiwJGB7825vV9pdpSxaSuiXk6mzH3ntpk?=
 =?us-ascii?Q?bqMk64JObLZ5W5oQnDBUqUZ/HRUWk4++UebwALgPhHq5VVfULd0QasflLbF3?=
 =?us-ascii?Q?0jInCpqwpEchPELR8s5vBkzMf5xsX34rrYPkxdCV8vwsSgZBBVZDl6dyVbqm?=
 =?us-ascii?Q?nxxW1aflKBxenqOH7hIVeZL8CK1Sv8XQOfFdqIFM94zMVg70c6aYaJnstc58?=
 =?us-ascii?Q?A39/XZoUkzL/44xvSXNKCov1cPGDup1kylx57+rtp6XFWjCwOhNEhNvORrNA?=
 =?us-ascii?Q?z/tG5RlJILGhYiPhwT2k+ETHeGPuB53bFUqjDY0H+Jh8muvxJDBYaJHnWpCB?=
 =?us-ascii?Q?+JGsJNqfezb5dnc4bq16TfuBNjP94UuXP73q9amxGuTv32u9mbqyVTiobZvG?=
 =?us-ascii?Q?uOKo76b47P8PDxfGBvowOcXCRHfl9LqDVg7dWuMtil3GpvjlF1ggQifGn4DE?=
 =?us-ascii?Q?7uVbAF3x3Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a3a0f4-8e09-4881-0292-08d9af168359
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 06:49:07.5716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xgM1TZ8sgt+CmbrKXFNzy0BAc1QZlTh3lZQzG2XPv7Hqa6iBU9MrRHagglq/ZK0JoBNyuOfJ2LmtOw4gr04BzYglgHKh6hAdmfKh2kLRKMIY4bmN6hh09TeklouKXGr0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2959
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, November 24, 2021 1:18 AM
>=20
> Hi Shimoda-san,
>=20
> Thanks for your patch!
>=20
> On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Add support for R-Car S4-8 (R8A779F0) SoC power areas and register
> > access. This register specification is similar with R-Car V3U.
>=20
> similar to
>=20
> > So, introduces rcar-gen4-sysc.c for both V3U and S4-8.
>=20
> introduce.

I'll fix these works.

> That makes perfect sense, as "the R-Car V3U SoC is based on the R-Car
> Gen 4 architecture".
> (https://www.renesas.com/us/en/products/automotive-products/automotive-sy=
stem-chips-socs/r-car-v3u-best-class-r-car-
> v3u-asil-d-system-chip-automated-driving)

I got it.

> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -359,6 +359,9 @@ config SYSC_R8A77970
> >  config SYSC_R8A779A0
> >         bool "System Controller support for R-Car V3U" if COMPILE_TEST
> >
> > +config SYSC_R8A779F0
> > +       bool "System Controller support for R-Car S4-8" if COMPILE_TEST
> > +
>=20
> Please retain sort order (alphabetically).

Oops. I'll fix it on v2.

> >  config SYSC_RMOBILE
> >         bool "System Controller support for R-Mobile" if COMPILE_TEST
> >
> > diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefil=
e
> > index 9b29bed2a597..f6c5f8c3818c 100644
> > --- a/drivers/soc/renesas/Makefile
> > +++ b/drivers/soc/renesas/Makefile
> > @@ -25,11 +25,12 @@ obj-$(CONFIG_SYSC_R8A77980) +=3D r8a77980-sysc.o
> >  obj-$(CONFIG_SYSC_R8A77990)    +=3D r8a77990-sysc.o
> >  obj-$(CONFIG_SYSC_R8A77995)    +=3D r8a77995-sysc.o
> >  obj-$(CONFIG_SYSC_R8A779A0)    +=3D r8a779a0-sysc.o
> > +obj-$(CONFIG_SYSC_R8A779F0)    +=3D r8a779f0-sysc.o
> >  ifdef CONFIG_SMP
> >  obj-$(CONFIG_ARCH_R9A06G032)   +=3D r9a06g032-smp.o
> >  endif
> >
> >  # Family
> >  obj-$(CONFIG_RST_RCAR)         +=3D rcar-rst.o
> > -obj-$(CONFIG_SYSC_RCAR)                +=3D rcar-sysc.o
> > +obj-$(CONFIG_SYSC_RCAR)                +=3D rcar-sysc.o rcar-gen4-sysc=
.o
>=20
> This means all R-Car kernels will always include support for both
> R-Car Gen1/2/3 and R-Car Gen4.
> I think this should be split.
>=20
> The rest looks good to me, but I think it wouldn't hurt to split this
> patch in two parts: one patch to generalize r8a779a0-sysc.c for R-Car
> Gen4, and a second patch to introduce support for R-Car S4-8.

I got it. I'll split this patch in two parts in v2.

Best regards,
Yoshihiro Shimoda

