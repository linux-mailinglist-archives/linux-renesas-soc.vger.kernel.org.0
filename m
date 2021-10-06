Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76D18423DFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Oct 2021 14:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238511AbhJFMr3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Oct 2021 08:47:29 -0400
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:47988
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238087AbhJFMr2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 08:47:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juiaulFGbvEpbYwssHlNxgwwklCGkmHZA7PG46EAW56CXSWZ1/bVBQAfhYArPaiNn1Sl/t3Ch17uUFaykItk1klJoh5eOK+8AAjhTHNK+NKZqJM+mj/18g3oD6YYV1dQITX5NEkOWUEmbBNj5Bk22QaVKa4yCDFfJK4iTramFwvheR39kbFaOmaCPRFjjctzugN7U6IAGYR6ztMrPKhTlKvJ5UbvQ5QuyBORQ19EGGGNA2bUG5+xEL7P1GZKWDk5b13eqhzeofqQAmvtZ0DjuLbAmLUDIxG6qJCtP9f92hj6XikV8jf5yNUlx55N/H9iVqSMysEcn2jkKSzSULMJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mf2oQVjuvGOy9DKBNCAqeqZJW1odrHZ8enkdK1DbURE=;
 b=Ak2HtRij/0B5m+F73n+l5/4aSlZlNw+MGNg3ccsw2ir/BdiaThdAn2kWkBJgYNTOIpeghWg1lhHRcx3yLOvUc/YDJkpALrPkFTNKToln3ckIEcy0GLbqgmsU/sbV51jGtJL9QChUnS/PmlqPKn2jqKUor7Jio6I1oPfx45yEnMJwmtVhy5oF21JY+HMjWX1csKDg4SSbpwP7ZfbULAXDJj5S655+ZFbX0+2PSpb22hQxkNKmRtxGhea/651aOmfLhWMVXsohqr+e2OTDFYbZXNn1eLgh4ZhEzf3mHKntQu7vtGVHuuj7irBTPPLzY4usx3q6+hRtnb08QdiRdPYO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mf2oQVjuvGOy9DKBNCAqeqZJW1odrHZ8enkdK1DbURE=;
 b=Sl8Frh0kDT3MTlyfwAr3Vu+UZnU5FMuNaIPjWPfZZb4yNceskyv8rnLZtzsQ7shOklgyU563gcbtdRxO8BbRK5izv7e3a2weVXbe8/vEBM//67A1lLpnxRFRPrqo4G9qDZqDFxvfDdzbHHURpzBbL/Ydfp7JGkh8S3AkMirmXnc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4696.jpnprd01.prod.outlook.com (2603:1096:604:7d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Wed, 6 Oct
 2021 12:45:33 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1%3]) with mapi id 15.20.4587.018; Wed, 6 Oct 2021
 12:45:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Thread-Topic: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Thread-Index: AQHXmlNVs4LNmIzCAkCmNj25qUqILavE3GMAgAFNm3A=
Date:   Wed, 6 Oct 2021 12:45:32 +0000
Message-ID: <OS0PR01MB59224A73CA29E3D07CD2F0C486B09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB5922BA32F4FB02E3390781DD86AF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922BA32F4FB02E3390781DD86AF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b6e8a29-89c7-4fb2-9aff-08d988c72fb5
x-ms-traffictypediagnostic: OSBPR01MB4696:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB469670D149DEECD6D9F6E71D86B09@OSBPR01MB4696.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jBxAAmQLLI7RRpE8ytyyqSHYkicOQZ19qcUkEaYPiR8r6vG3Hrf+bUeOU04atTugHYoZYYt4Jm3yZ890/EHw4KS9z2OV9shW5SCg2d1tuCIwDF56P8t2N+fFpsEnBj+C4webvSZydPQS0AsAd9grskkTZJXY6zIY+fvpVz70tew6nr1bAmenT6JnX/enZ+FPODeCR7ZyPCfvWp1mzZoWwjA7rkxXbp9CAJz8cssKGHcLS4bUBOaR9R++2bmw6Yg1eWaHZMu6B+JmYqASyZoo2QFIJS1F5ek9Mw6oEJNVP9ggRWYM2uX7AAzXqRy9mInsKCTqrTriLGZfyHEcuyxkHlcgoFKtvxef2u2eXrLc7DmspCBXIGvDY6b6x086nYOAjhlrOxRJH3tORmQhbp6AJ3m844HRvfvMRHg99XmvKlf7dhwC60++uFNSxoZSBkFGq5zSfs5syHWvNo13jN1ij/PTFcNSM4pRnrOb8/sjWVHzmeezLYbRzA9Tps5o83VZhCm6gjBo8nxRNeOrC7Op7EEQeT1ur5I31Ila7HmVwDDkesMfHl+RU3ePwf7MIR2xIukvDw+aZXc6hasnCUJrcSD75YO8cxW2xioZfrLbtUKWdP4S/bCrQAhMkJAt7P+dp2BQ63HrFCUZoG/M9IX0VUvX87EfVr/CMsaf6oJ4NeBSc5R8uJXhDnxf26JMdci0KvXCgnj8OJY2fa3r38s66g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(71200400001)(316002)(8676002)(508600001)(66946007)(38100700002)(66446008)(66476007)(55016002)(76116006)(4326008)(38070700005)(122000001)(66556008)(186003)(33656002)(54906003)(86362001)(2906002)(26005)(9686003)(5660300002)(7696005)(8936002)(6506007)(83380400001)(52536014)(53546011)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hXVklvI3XGeZzHv2Kuud83FxBEqlFD1MBAh4Doxr1P+uVt7mcWqSXchJkQuN?=
 =?us-ascii?Q?In2dwnCuUHAv0RnodJWHxdUXqCin5tjP/x9IZVpAhoRgyLRBbtN+pkopLEHw?=
 =?us-ascii?Q?pCQr7bmP9xLw1pPjc637BCA1hBzU+kcb7LPVejPaSEdKEJV2lqdcX6K25B2J?=
 =?us-ascii?Q?3KzvWkU8T5yKNF7cstUy3nhIsXSgrr35lh2wYPXUHZzEzDTW09wMNEJIBdVV?=
 =?us-ascii?Q?eNNi5zTKTZS9OhSKraBrRY9IcYzWGAUPzVAphpZig66mLjTRaFrJYNPWFZF6?=
 =?us-ascii?Q?pIQLmZEMIZckr8CG6b2dX2M4+gxZaBJjfheOdTLfEEqFPVAqMkmrpaIe70hW?=
 =?us-ascii?Q?XF51ol/bTjdP7RiqGgLqg9LJ/5BB0/ke0c5Z6OImtFpbI+IQBu9fYZFMQQLT?=
 =?us-ascii?Q?vyFXIpV7lVDreDXeyBUwwJQCAQW7QSzxJpgS1hHNqf5LaSqhoTiDN2feNKj8?=
 =?us-ascii?Q?AT4PUxNXV+jkQUV7bqYjmQEcExV6zeqhte153XnjAZKyAAT9aOqS9pg/Pb23?=
 =?us-ascii?Q?winBfYdZk7drU9yTvfy83djFSC/Byhk8S4ovSxQ1/zgSq4UDh8o7y2E7Ngae?=
 =?us-ascii?Q?oVBbcjMmL65B25l51VkS2YrJClyqdf9t/nizjVKiDpkradebVnnh6+OLBzGK?=
 =?us-ascii?Q?h3wEyuNLg0t4tYZkgdcboOPkhjInyy95pL7ZdQgIm4Q5ruJl5OOL8ODTIzOR?=
 =?us-ascii?Q?fzHWHxZHrSmBBCEPmNUk83oZL9R5HTeGaXUy5/ki3in6BTtgUqdaEnjjiIFn?=
 =?us-ascii?Q?kKCkPba5ME5BRiE+zcJ5GkPqmyJ6wN0PdoXq2EUOuOXdI5RkG3pxZlbKcVMY?=
 =?us-ascii?Q?Sastot1j62zFmQSo/2Tpaj7Qc46mc1Qp1Q5co5DlzTbsu+dcr44+pYcpeEHU?=
 =?us-ascii?Q?VL2RSxg8tyH2VaO2jCRdyns6zx4GxIkswHOrtDJ7T9fx70ByCZrQ+ajhLHM0?=
 =?us-ascii?Q?ZzEUJ3GjtqUXrRpK6DgNHk+VpeYQ7/0FrTLT7Y1U7xY4seikwCo2JRtCSDWv?=
 =?us-ascii?Q?03VtBvkbx6u2OXsLl0mw4QkhPMLykXvNzRwXsjm0gKIgfrnj9OdmGK1pbbnc?=
 =?us-ascii?Q?3OV8lr0YFENIgkGKUmxFVXf600Lf5t8l96hZacJArvj0pPJv7DXPsvhR3cn9?=
 =?us-ascii?Q?lVb88lLW/Cmav+iLSKkZgUCdqfhlB1iSN7fur9zsVqxbBzcfhvdjQGhUFeL3?=
 =?us-ascii?Q?b9IYWozIC+DAJcGyaeBkI87NryrcEWHjZJLvq4AIDZ8ylRM1SMQycK7zjLW/?=
 =?us-ascii?Q?yNNRaz7/vr0m/CvJB8sjq83hWpAcQAKclThOSFrEySfJPPhUSwSTdRutspln?=
 =?us-ascii?Q?z7Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6e8a29-89c7-4fb2-9aff-08d988c72fb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2021 12:45:32.5903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dEumjH2MHVXcLHCZFknkGOOcXspe6kQv3z+vg6p5nc8+if8PSFWR32cXCIJwde+hLxSuJ+8OfaEVqcLM3vl4uDoV/AZgMCeMTWa8Zk7U94M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4696
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

I have reproduced this issue on RZ/G2M pin by configuring cd using SDHI ins=
tead of gpio irq.=20
After applying the patch card detection/removal works as expected.

Looks like the issue is present on R-Car Gen3 boards with cd as pin(ie, car=
d detection/removal using SDHI IRQ).
I will post a patch to fixing this issue.

Please find the logs

With IRQ fix on reset function
-----------------------------------
    3.090956] renesas_sdhi_internal_dmac ee100000.mmc: mmc1 base at 0x00000=
000ee100000, max clock rate 200 MHz
[    4.855266] mmc1: new ultra high speed SDR104 SDHC card at address aaaa
[    4.865396] mmcblk1: mmc1:aaaa SP32G 29.7 GiB
[    4.885474]  mmcblk1: p1


root@hihope-rzg2m:~# [   60.220648] mmc1: card aaaa removed
[   61.613520] mmc1: new ultra high speed SDR104 SDHC card at address aaaa
[   61.626103] mmcblk1: mmc1:aaaa SP32G 29.7 GiB
[   61.647925]  mmcblk1: p1

root@hihope-rzg2m:~# cat /proc/interrupts | grep ee100000.mmc
162:       2158          0          0          0          0          0     =
GIC-0 197 Level     ee100000.mmc


without IRQ fix.
-----------------

renesas_sdhi_internal_dmac ee140000.mmc: mmc2 base at 0x00000000ee140000, m=
ax clock rate 200 MHz

But there is no card detection during boot.
it is not detecting card removal/removal at all

root@hihope-rzg2m:~# cat /proc/interrupts | grep ee100000.mmc
162:          0          0          0          0          0          0     =
GIC-0 197 Level     ee100000.mmc
root@hihope-rzg2m:~#


regards,
Biju



> -----Original Message-----
> From: Biju Das
> Sent: 05 October 2021 18:03
> To: 'Wolfram Sang' <wsa+renesas@sang-engineering.com>; linux-
> mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>
> Subject: RE: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on
> old SDHIs
>=20
> Hi Wolfram,
>=20
> On my RZ/G2L board, if I configure card detection irq from SDHI, instead
> of card detection using gpio interrupt, then it is missing card detection
> interrupt after reset.
>=20
> Just wondering, does it work on R-Car with CD irq from SDHI instead of
> card detection using gpio interrupt?
>=20
> With the below changes, I am getting cd interrupts from SDHI after reset.
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c
> b/drivers/mmc/host/renesas_sdhi_core.c
> index a4407f391f66..32f34de1a2a6 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -561,6 +561,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host
> *host)
>                 /* Unknown why but without polling reset status, it will
> hang */
>                 read_poll_timeout(reset_control_status, ret, ret =3D=3D 0=
, 1,
> 100,
>                                   false, priv->rstc);
> +
> +               tmio_mmc_enable_mmc_irqs(host, TMIO_MASK_CMD);
>                 /* At least SDHI_VER_GEN2_SDR50 needs manual release of
> reset */
>=20
>=20
> Regards,
> Biju
>=20
>=20
> > -----Original Message-----
> > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Sent: 26 August 2021 09:21
> > To: linux-mmc@vger.kernel.org
> > Cc: linux-renesas-soc@vger.kernel.org; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com>; Wolfram Sang <wsa+renesas@sang-
> > engineering.com>
> > Subject: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on
> > old SDHIs
> >
> > Old SDHI instances have a default value for the reset register which
> > keeps it in reset state by default. So, when applying a hard reset we
> > need to manually leave the soft reset state as well. Later SDHI
> > instances have a different default value, the one we write manually now=
.
> >
> > Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if possible")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Geez, typical SDHI nastiness here...
> >
> > Geert: I think this fixes the issue you saw on Koelsch. It works fine
> > on my Lager now at least. Can you please test and tag if all goes well?
> > It would be great to have this in 5.14 but it definately needs Geert's
> > confirmation first.
> >
> >  drivers/mmc/host/renesas_sdhi_core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c
> > b/drivers/mmc/host/renesas_sdhi_core.c
> > index 6fc4cf3c9dce..a4407f391f66 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -561,6 +561,8 @@ static void renesas_sdhi_reset(struct
> > tmio_mmc_host
> > *host)
> >  		/* Unknown why but without polling reset status, it will hang
> */
> >  		read_poll_timeout(reset_control_status, ret, ret =3D=3D 0, 1, 100,
> >  				  false, priv->rstc);
> > +		/* At least SDHI_VER_GEN2_SDR50 needs manual release of reset
> > */
> > +		sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
> >  		priv->needs_adjust_hs400 =3D false;
> >  		renesas_sdhi_set_clock(host, host->clk_cache);
> >  	} else if (priv->scc_ctl) {
> > --
> > 2.30.2

