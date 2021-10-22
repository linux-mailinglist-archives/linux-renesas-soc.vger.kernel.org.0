Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40916437A8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Oct 2021 18:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbhJVQIP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Oct 2021 12:08:15 -0400
Received: from mail-eopbgr1410108.outbound.protection.outlook.com ([40.107.141.108]:51651
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230187AbhJVQIL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 12:08:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRnb4ak/YCCyX+HibvGl6IxsRqX5CiabMqdo6V8ObbxYiMxDy8f3Yhs4bZcbYe0K3yPXrMktxk8t4pc/Fz6nzkZLBu1zIiw0pxAeO5/WAiclO6D5hk3y6IwJDhPFOIgrCQeM4wohvb+1b9X2+NR6oiWLvafjNm81ESzujlWl4ODFNYxn1TPG+sjxNtkTQ18jyn4Y3qsY/pq4c2PCHNxnTNtkzXAPk0Oif+ccImHYe/vik3nAwkkq+v0cu8P4MyqY2LIsggIB2F6L6XxC/TinEw5eY6U73v0Qz5KbgG0AWUvTGz7nrGamrlCVBDXXKmzeQULHkrtqIhXvAI4YAutF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFDDsctJFZBCQ/5iZete9glbhcKJeeXLuECXeS1NJZI=;
 b=JEFxQ4h6fFJWxyi7/Bm6Zs6Ucl/M+LcwzGmHEmLaFcEaMEe8xtyRrNQPt72zYlWa0a+Rqed/aJGJyu7EgNy0eh70xj9AN97WFuOv/TVsAIkb4TL1XezB6N6sqMJzM+zRK47W/8tSXJdg56pwCGiAhzE9H1XCrof4CjT4EpNV3M/ajtOPianVHSbmnH0DhocrU4GaBnlfCY+5pD6IHcz4axsy/+RW7KQV6GPIaERk/ZKDx0bVjv7+jPxClxeAxnE29nCGed8zBKl9qcZglumME+PrFW8KULLnCoVwZBT2ODwZHxkj+Elzg7GTPQnfrTf+CwJTsAn9lsBzQ6MUV7BC9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFDDsctJFZBCQ/5iZete9glbhcKJeeXLuECXeS1NJZI=;
 b=KLGIOsYYmhs/wD6n+JUAwBXVkqzu4ZPsVKW6x6qcua82zVTTO1QSHkzvRoE2Mz7xF1XCHwV5fNttQY5gtNUM/U0KEf+11s4BiX8xcWjsyx3lneEviBXPq5mEeDEDtyEjOfvEkyWMmyAdpbgcG0xMkBxz9zMeWEOhwsCqBi9H7/o=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6568.jpnprd01.prod.outlook.com (2603:1096:604:fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 16:05:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 16:05:50 +0000
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
Thread-Index: AQHXutXdv6ZsGiNewUOReWqD4pnIGavfGfWAgAArXcCAAAG4oA==
Date:   Fri, 22 Oct 2021 16:05:50 +0000
Message-ID: <OS0PR01MB592212E593522E4E72BEAFCA86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211006171605.6861-1-biju.das.jz@bp.renesas.com>
 <YXK7AfUYxuFWl3rl@ninjato>
 <OS0PR01MB5922DC39B54A0B8D7AA8B3DC86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922DC39B54A0B8D7AA8B3DC86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51dd204b-5164-4617-2ecd-08d99575d188
x-ms-traffictypediagnostic: OSZPR01MB6568:
x-microsoft-antispam-prvs: <OSZPR01MB6568DC998A267B1D3BD48DD186809@OSZPR01MB6568.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KG8RzVdObFiptsdQ8px/Lz7dfe/ipL1jf80q4ZYPuqWDDb3/wYemtaGFT708D/oKOC0psYhlHHf2vSfxoMNcLQt8HBV0ETfelACKFqo6SeCZhnf3FnkLrLkoDeHlxcZxDAzAjbpSCXd11vFLgaQWzj0Ltc8pPjNbDONYMT6W/bvzGhDh4J4Dz6THoFe0Buh/BWFPjkBRyqIxT1Yc12wkU/UIjVEG/XtVF03r1dtguid0BYi/RYapWkYDqo+RJPyW5eqN8ENm+yjX3W5vIcRK17q88rbNUXPyl6ogot4D+AH8aGMxPH6yKnCYt+94SlXYKESrcBizDLJ9CqsQTKfT/4o2IHq5HiINIwbJnJW8HWRRNz1X4cIOnlvXC+B8X5a3ZLsziyB9lxn6pxeoa74TDPsi0GRj60Yt4La3YfFW78g6P1rjeCxPuxFiCL7k9MBhL+9McIamdAKtQ5jYc/QhtgmJN08qXDNkJQbnG6BfiNDoz0KNwrQgeJSGU0AJ3X8UG5ArK7jbrC3zvlcVtH/IM/IQ+ZbpLueFLgggkY94OSeauZu9T7qvbnoufqh7JD6v1emFIItPyvx14ZCunrECjTOAREzOdGNR6aPrzYveBXv1w4Q9hTQQZeVJoHhytrPwRsOBQ3VrNpDxMPZFXEer/7HqngkvNS1R2Jo5wLkh4tHUEjvvgqsflVkMovKzYU/uxMK/xFqoAvriIVn0SRNkhA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2940100002)(122000001)(52536014)(9686003)(5660300002)(6506007)(8936002)(54906003)(26005)(55016002)(186003)(83380400001)(508600001)(8676002)(7696005)(71200400001)(38100700002)(4326008)(316002)(66446008)(64756008)(66556008)(76116006)(66476007)(38070700005)(66946007)(33656002)(2906002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MF/EOpT9qfihgAhUuhdMT//GWsTT9yPkSNJiDmdGxAQYjp0T9cAiNXhkkHDs?=
 =?us-ascii?Q?4ebH27jIYOMs0MYgTdalsvP5FNGUktUaJM60YzALySMUr7P++sUWOjjKX/jI?=
 =?us-ascii?Q?r4/1kKEQ1dfIwf5wH+8ftgoDx/qlJn//jMvDFr2DBUQZJTk3jcN+/DOknchF?=
 =?us-ascii?Q?uNzSaf113Xr9Sd57CrnNnSjwySbKd6L1ykh3sgO3vMrQv3gdFvfSHZdcOE7j?=
 =?us-ascii?Q?YX0BRhuQAjxbrAay9HsKL69HgoOcRGBLoRnp2xuh8B+HOzzrw/lb8aPo8G/w?=
 =?us-ascii?Q?Vo2/xhjCUyD23NXpOXVczL/iZGy54qxX9phspqoOdcYIW4XmbsThfPj8AhYC?=
 =?us-ascii?Q?wClTHjEFtOoFgB5wcJ8AH0GlnMoHrDAFpkWWp6EVKNCmMOCT6wNaDJycPM8t?=
 =?us-ascii?Q?Yc6aQuwNG0i3WmoKKoCo15AViav09gmC+LEYDQ98NjYhaViakiaQhm7K4vMK?=
 =?us-ascii?Q?ciJIkYUHJfa0m0aJP/Fs5YlI7blsH7W/pNUl/uhhIfSGQYDir5SSpWSGixfm?=
 =?us-ascii?Q?vBqVbjxzeaViwftrYQHO9DssWLZZIslwkkyWEZob4ggqiD3xU4QWL2uuCX2y?=
 =?us-ascii?Q?CK5mxmWUxlqq/NZSqe9bXbwvgsB6IuyRpG/8nriJ+O/sdXogJ0XGaiM/gH5W?=
 =?us-ascii?Q?BAonC+Jf5PyZ5IahYtUJbkxDCXDMfhV9AlFT60wPq3Zte+VW0jZGMbWGJ0NB?=
 =?us-ascii?Q?+9zSkKo+wYQNA/35Pdwwm5w3J/HYGFOC7OW5Jy54FM0L9vjK8FhP7ky8A7eT?=
 =?us-ascii?Q?hphklKhGxMj8OmVf7Yq+tEGm8dEjs38Vu8olD1y/WSIlod32aq8ZUX/yNUKg?=
 =?us-ascii?Q?W/qDnN9WCF3tCA0aVPG+MjABNWLSRSKUvvYT1Fpcwer/2bPn9WigUApySSu/?=
 =?us-ascii?Q?xvYJYoIsKhnCdRMK+fjyduMRnee+mUY2Ea56ZQzMwIZvw4nGbd4Vutb2Cneo?=
 =?us-ascii?Q?B14ulQ6RcBT1+JhdNqAMms+rT7hKJ6t8f3UVKRC9xQsSzWJFh7t2FyS0Nspc?=
 =?us-ascii?Q?vy9L8Djf9k/zmXF83Y8vCti3zTYeGWdK4ak7eHqstNEikQ+TIXpFO5vERN95?=
 =?us-ascii?Q?xnfq0nI2EmwvPnluqoQHe0HHfmZ008AHRhQ6sfokwJJq2LMrjVB6NvR7EPlN?=
 =?us-ascii?Q?RUz3p4VmdCoYG2H9vR3R0IBVcKFQTpkeVRX6gllJRCRrwe/c/lCyUcYk7FGP?=
 =?us-ascii?Q?djv2nogqlTmQ/zCVf2/VSUw2XgfVP8CuFA/lsA+YMnlu9ldamsThVMoAkZTr?=
 =?us-ascii?Q?D3jGVR6LK03VPicMTcax9DQUfkinQ66jfr1A5p0kynQny86rblgE3/9zd6WY?=
 =?us-ascii?Q?H5UrTZn26kafuMZoxkv9OWBpo/m+84lv9DA+K4P4sCC/kux1IWJa6xpPJ8QP?=
 =?us-ascii?Q?AxVfDmw+xzOM/iQNsxTqKASqiJmqlZm6PmGAPl7Cpg8CMNLJ0BbUXDio7IiB?=
 =?us-ascii?Q?zTqHICVmPNYshYcnqQWMkVlzi7egjqTK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51dd204b-5164-4617-2ecd-08d99575d188
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 16:05:50.7297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das.jz@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6568
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
> > Subject: Re: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with
> > hard reset
> >
> > On Wed, Oct 06, 2021 at 06:16:05PM +0100, Biju Das wrote:
> > >
> > > This patch fixes internal cd irq miss after hard reset by enabling
> > > internal card insertion/removal interrupts.
> > >
> > > Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if possible")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > IIUC, the following should be the apropriate fix. Can you please test
> it?
> > If it works, then I'll make a proper patch out of it.
>=20
> I have tested and it doesn't work. This addresses issue from
> tmio_mmc_reset call from tmio_mmc_core.
>=20

Just to add, It could be related to timing issue, with your patch, if I put=
 some print message,
It works.

Regards,
Biju

>=20
> Regards,
> Biju
>=20
> >
> > diff --git a/drivers/mmc/host/tmio_mmc_core.c
> > b/drivers/mmc/host/tmio_mmc_core.c
> > index 7dfc26f48c18..9416245a7b56 100644
> > --- a/drivers/mmc/host/tmio_mmc_core.c
> > +++ b/drivers/mmc/host/tmio_mmc_core.c
> > @@ -195,6 +195,10 @@ static void tmio_mmc_reset(struct tmio_mmc_host
> > *host)
> >  	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host-
> > >sdcard_irq_mask_all);
> >  	host->sdcard_irq_mask =3D host->sdcard_irq_mask_all;
> >
> > +	if (host->native_hotplug)
> > +		tmio_mmc_enable_mmc_irqs(host,
> > +				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
> > +
> >  	tmio_mmc_set_bus_width(host, host->mmc->ios.bus_width);
> >
> >  	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) { @@ -1185,10 +1189,6 @@
> > int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
> >  	_host->set_clock(_host, 0);
> >  	tmio_mmc_reset(_host);
> >
> > -	if (_host->native_hotplug)
> > -		tmio_mmc_enable_mmc_irqs(_host,
> > -				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
> > -
> >  	spin_lock_init(&_host->lock);
> >  	mutex_init(&_host->ios_lock);
> >

