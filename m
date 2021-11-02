Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B1D4431B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Nov 2021 16:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234314AbhKBPau (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Nov 2021 11:30:50 -0400
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:47712
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233684AbhKBPat (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 11:30:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqY//wK4O8kjTDpECb0It3qKjOBoy/tKS5oVNztmATFuOE3elll02g0qiL4IJcIKDva5jPy875WAJKM6HFsk1HC381BEPFedXqre9oJrlDnc6JPZgtLHORui4/lhfBXqLmHdy3p2kau+YLMnpd1lFlEz9lfjiPG8mjia+fwezMpOChyy0XD5rfNP5RLiTDF3Wh+WTvpk/mtQL0RZsa8U0bECZxYU9JOHn9bJ4/qE8ko4bEji2xsI+VlzF5Ow7eg6qH8ZVuLvXvM8YPOmVTTxEyocyzQmKvFu7C4v04nmiasMgnwbWsOxsmJt9iANQk5mT0PCgkr21jBodqWb8c0Sdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACZhwZGSg729XGfVOoyH2ZzBlm+iW80CuHjzlCnDbSw=;
 b=IhzEeP2A/M8HGnYSiQv0nI4oR85RMtEgwuXyAzCRWC0ByW1moZOuhX03MepbkKVL5XKnmDNISAzXrvH/5n7x78HIoaF7LeMG9Fq2yLfLy7POAfrFHiGSxBxK79GcMJ1I0/RrZz4f91AgapUWNhMy2FkJZtB9ZLJeaWIQonIuU3A59obOsmckrwXT6t6H+hk20mjyc/o7bmsqgHAaxUg7nPQQ37YaBX6v+Grz6bB0VvwPkeY9REa6DGHXKIOZ79h0KjiM9afCaaqctmEEXTI9yTA0RP5thsZC7Ga47wwQzPDfHpFbym/p1zvX1B1EQFnpNo2FCXbmDR30sKX5Z7CxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACZhwZGSg729XGfVOoyH2ZzBlm+iW80CuHjzlCnDbSw=;
 b=kPt/abrCNCYLhBp9hG3MeEUyCbfBVVUD+Dk2Su6qkrDXWdneoKdIyvDAv2PVVuly0sjzmToJa25nYnMAPCbVtPFGhpOfeuU9vdZicanH8rjPLDdMhtEEZ3OOWJ62S5soUm68vq4/R9uMvImaR8k4NVAT1Nvt1UxlV02yfcLwPYI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 15:28:11 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 15:28:11 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with hard
 reset
Thread-Topic: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with hard
 reset
Thread-Index: AQHXutXdv6ZsGiNewUOReWqD4pnIGavfGfWAgAArXcCAAAG4oIABBI8ggAincACAALqzwIAG2DWg
Date:   Tue, 2 Nov 2021 15:28:11 +0000
Message-ID: <OS0PR01MB59222477102B63D3F0D7E580868B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211006171605.6861-1-biju.das.jz@bp.renesas.com>
 <YXK7AfUYxuFWl3rl@ninjato>
 <OS0PR01MB5922DC39B54A0B8D7AA8B3DC86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592212E593522E4E72BEAFCA86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592273BA2B117BE67B108BDF86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YXr91sKve3pmY+yj@ninjato>
 <OS0PR01MB59227455C2F3B1AB3BE0237D86879@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59227455C2F3B1AB3BE0237D86879@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa271a15-c116-48d8-b0b8-08d99e156195
x-ms-traffictypediagnostic: OS0PR01MB5922:
x-microsoft-antispam-prvs: <OS0PR01MB5922B0863BDBAA4508A98A47868B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mq7IsjfXiaj2r/BRiQj0bDnk4nE9S/Ffcvxb8iTfY/zYb40jeIdJZxEntXnjCEsAHU3BbBnYCDNgVBuzo22B1jKpQ9/+VR0kPVyZgNVzzJo7PnMkQYrt8kVK86z0R0Zyzna8Ya+I2rTVewcCIQMpA0tJUdBD6MXAgu7jI+QNw93tsvINtk5B/xs+1gYMM7E49D2LCkw+8QewIJADlQ+KKfDdCctZLKnkugo9231G0QcJHVAwyl5V/Ov2Xmjs8P+bSP8NNliRLXx8/a1esIormgGLV70OHqtJQrAu6xf1lFK1p4VesUriGM65OK4mQ5dnB/foWCWxmtK914twVIecZoca/vRpLfi0cUcY/1tN61lBARHVdc6lPSHEL9F2dp23IW9wCroW5xaLDiCR5r04bzaBRIJKR/JO/1qKJYKogvOfRnZdh32yBAfb90j6RNtdUmCagaK35Q+OlYD+XEIgkZai0piEu2AaoPEnmU4BfXNSblBI39nepa2990NV9BAyeAI+ZCsPlkQiCv/GEiOmwEQ1shrjmehSu8m3uqm+OKXZEkYiQPRaWOu41wYqiQ9OhiHCGHAWvcJ1D0NGCRryy7Fco+BjnRXV+vsjdCjbqGtizC8TfUty3pVnN+eJUqcN5pM2tD6RBGqjIrAp7UxJDaBRNnBRSqwJEr6y6nuSQqLcivBgxlli7R+dciDNsx7IrcDYte6lWJ07as5OLn6nWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(316002)(33656002)(6506007)(186003)(54906003)(71200400001)(508600001)(83380400001)(8936002)(5660300002)(2906002)(55016002)(122000001)(7696005)(76116006)(66446008)(66556008)(66476007)(52536014)(64756008)(26005)(9686003)(38070700005)(38100700002)(66946007)(86362001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oiI2Hk3QgpbK1BNVAL1PVY7HpQ2nYr93Qr8T7+PSCSnk943zvj1FXAO35CkP?=
 =?us-ascii?Q?SAKwyPyJemSxZF+ppgA2QNNlCwjT2Dygul02yUeBWtW9yaewJNQ9Gu/2Kyxe?=
 =?us-ascii?Q?DsT8OP3KxftK4qCehuM5SHvt8DaVGMQHKgXrAOAw8cC8DL8dkGAg0rAQ5dUJ?=
 =?us-ascii?Q?VEIO3T4ztGZcINPhMQe/S+JxInqfE18bwCPPRM99kScP39eTjcWIpgtdAFPQ?=
 =?us-ascii?Q?QmRxwpW422yN52l49TzypRIlvkM8BXhGTyt4WfytjKM8iT7pivxPy6JCxx1S?=
 =?us-ascii?Q?QYPJiCGvli2FkyYFA31YclCAl7txP5PhvLpm4RLFfE982Sc16KDqgwLJo0hy?=
 =?us-ascii?Q?QJwSnVp+nqjjSmzllJW1Gb0ovnsW30JspIwNeCAR2kCnlGPvrJOx+pKrpWov?=
 =?us-ascii?Q?DlJ3pz8k+BfHDc6DE1/lAQFPO7MOwslcC1eEzX0hcnxLBtQeZkAj/rYmVwXz?=
 =?us-ascii?Q?CbuphmKoO48lgnrMFWm0vZw3Z3wcJVxPLEq1APBGJ/V/dIM4Ucv6wuHWgNZy?=
 =?us-ascii?Q?GrSmGh0k/GM2LPSxrCnqbFLbf41I54CauZobcOcLIQejE9sVpszy3PEtm/0i?=
 =?us-ascii?Q?32Z4EVC/jDhOzPNChstyE+0tReCCO4E2cP+NYn5kXVY6sPe3stYArC7N2Mx1?=
 =?us-ascii?Q?b4JO5IoZtIUzqjPB5KyxobSOkZoS128C/PtAvsULlSOZ3XBBCruGT5fgtBMa?=
 =?us-ascii?Q?xIvDZ0Nx/+KGOWpoKIvHNz7WGFC+/mtK/l6KgF/cbe4rZ2snl9Lzt1cFfl55?=
 =?us-ascii?Q?wm+PNiWf8LBpbSpO+l+0mgmsmQxUkja4YumGbzoQZvSUdIxs+oM42vcvLyPv?=
 =?us-ascii?Q?FTB8U4N+zCmCU4NzNGlugshix4P6OZXJ9eKDl2KN7t3JR/oWQwKi4nM3r8/T?=
 =?us-ascii?Q?vLroQ/sNPcEpMbkmO+CGNXxKPJn0R9kl1kwQxcuvICAOOSCF8+sP83/h4NhU?=
 =?us-ascii?Q?spLAB6vAw6HcaBtSzK2jA7KRtXKRt4dSLPB/0EVPmKy7/cq194wSTi6RNulO?=
 =?us-ascii?Q?xobw9jRghiUIkLL0Dr8MbOLAz0aJQ25+YQTpDaBcvl3WhMeb3cJ3+vHObtMS?=
 =?us-ascii?Q?pNSRdigHA16r5Bn187SsrSLBT7XFvPwHgd+l0qOrG3zueJKGzPUzxqB8ul1j?=
 =?us-ascii?Q?KAVNyE0I2Pd9jCg+YtrhxMmUZ2uFnBUZavLuTs5TMv7sXN8hCb4Asz63bXHX?=
 =?us-ascii?Q?3gbBInguMbEeIPFhktjg+cHb8QTaJD5ehG2FlYcZYS2rdDM8OsaKabvktnJM?=
 =?us-ascii?Q?CX9YmBLVPu2csErVa/92AvHvGqll+JbbDk/rJs7MmZKSlSCC9HOr06kegVrb?=
 =?us-ascii?Q?I5/NshcAerZRt/mUu6spv6kQ0JZanzlI4DstNRF2MQxBy64cBZn/mnWeV74i?=
 =?us-ascii?Q?jVSXdsd8ZbvIN2njOgJp/mhkrhX/Yr2cKhLsWUkuApzMhLTb6IRYJoT+fgwD?=
 =?us-ascii?Q?oKtqOWIrXhSHFv+HKVYlzfNt033vAWMKYnH3/VCwPLm7FFzw9FE3Y+Zhua32?=
 =?us-ascii?Q?hCLrDYQ3V6sLh1V2O0ztJjtzPfQnMPnvO81QIHif6EM4djviTs0HRaTChaWq?=
 =?us-ascii?Q?AM4Uq1U3FWtMlDfohX/o2IA3vHwZiEcfMFsXNFhvLLxULPM7lBwr2pO3RbVw?=
 =?us-ascii?Q?O3u2WrAhJv95G5IuOxHELxMPOLAdnKTcVtM3lbb04Zsur+B3O1wIZwTdIyfD?=
 =?us-ascii?Q?0maoIA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa271a15-c116-48d8-b0b8-08d99e156195
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 15:28:11.6983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6kkv9/k3aqJcEFj5LNp6sOHY7O7tGcDveE4XHsrqGlLF/PYbqLlxEpFmBAKVBVTCStWgjEcruG3F9T2owEZiXp73sbKmA+aUNtOK642Uk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5922
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

> Subject: RE: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with har=
d
> reset
>=20
> Hi Wolfram,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with
> > hard reset
> >
> > Hi Biju,
> >
> > > Finally found the issue. There is one more patch for host->reset in
> > tmio_mmc_core.c. please see below.
> > > If you add this code, then it works.
> >
> > Thanks for finding the culprit! To get this hopefully into v5.15
> > still, I will simply add this chunk like you suggested. However, I
> > really wonder if we shouldn't just replace this:
> >
> > >                 /* For R-Car Gen2+, we need to reset SDHI specific
> > > SCC
> > */
> > >                 if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
> > >                         host->reset(host);
> > >
> > >                 if (host->native_hotplug)
> > >                         tmio_mmc_enable_mmc_irqs(host,
> > >                                 TMIO_STAT_CARD_REMOVE |
> > > TMIO_STAT_CARD_INSERT);
> > >
> >
> > with a simple call to
> >
> > 	tmio_mmc_reset(host)
> >
> > (with tmio_mmc_reset() still updated to set the card interrupts, of
> > course)? I have to admit I haven't checked all paths for side-effects
> > yet, but maybe you can already test if this change also works (instead
> > of adding the second chunk)? If so, we could change it incrementally
> > for 5.16.
>=20
> Agreed. Will test and provide you feedback.

I have tested and it works ok on RZ/G2L platform.=20

Looking at the code, further optimization is possible. Can you please check=
 below and
If it is ok, please add to the new patch for 5.16.

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_c=
ore.c
index e2affa52ef46..e8add010bd7d 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -960,14 +960,8 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, str=
uct mmc_ios *ios)
        case MMC_POWER_OFF:
                tmio_mmc_power_off(host);
                /* For R-Car Gen2+, we need to reset SDHI specific SCC */
-               if (host->pdata->flags & TMIO_MMC_MIN_RCAR2) {
-                       host->reset(host);
-
-                       if (host->native_hotplug)
-                               tmio_mmc_enable_mmc_irqs(host,
-                                               TMIO_STAT_CARD_REMOVE |
-                                               TMIO_STAT_CARD_INSERT);
-               }
+               if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
+                       tmio_mmc_reset(host);
=20
                host->set_clock(host, 0);
                break;
@@ -1295,10 +1289,6 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
        if (host->clk_cache)
                host->set_clock(host, host->clk_cache);
=20
-       if (host->native_hotplug)
-               tmio_mmc_enable_mmc_irqs(host,
-                               TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSE=
RT);
-
        tmio_mmc_enable_dma(host, true);
=20
        return 0;

Regards,
Biju
