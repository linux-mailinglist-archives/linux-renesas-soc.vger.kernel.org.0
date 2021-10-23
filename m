Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C330543823C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Oct 2021 09:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhJWHkz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 23 Oct 2021 03:40:55 -0400
Received: from mail-eopbgr1410120.outbound.protection.outlook.com ([40.107.141.120]:41914
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229805AbhJWHky (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Oct 2021 03:40:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gn5RBBhJUCPFVjkoD5LJ2Ha88KzTj50gvRbmpaZ1gs4pGQUvKxe03Y97BoZoamsU/HOQ8lbdN166In6imqfJB06umUXJdusqbttFP5p9bZh41LpJMjpId/qCR/Y9ye1dvkSVz0uL8UI+RJp5l5NXt25VQ902UMBKcxYfKCF3hVBfwQjnMO0jshF09+ufTuVR4vbRCbG0wBVBIqhknVwefZGR9HVMYwmK+kU60CFZ9ZaFSa3TpkpxsUwM3fwWWhtCZEETZHTuJVsFybny3rxxHLMhSdCIUc/FwWcPsbrzxn28KhOl/AYdjyPHcDe7duQa0joPJpsoAT8iYgbFrtsGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QKaxD6SDVyLE49wLyScj0nKl95SNt6bJRnUyAdA8ck=;
 b=XCLJcVauyqYsm/4H+U03tuBWC4rinkIlhW9DqFwJBUj48wF9wGp8d9ZaPPLitB/V8RAWCZutSzHVl7vWC2WwE2O62tHbNO7ckrs7KPgggCV+XTT/wOZSEAH1jjd2iPeDgPtI2xIA9Bop8qw0K8VEpwKPERjV3BmBuS1NX81lHGUQFxBkzcgzveURaOMnKPTYz+1T0guQF8csQwmp+LA7gIq24Y/kKpgN2QzgVplnNzProPqqzQEiEwTSCGSliR1A9SM8RTiRnWoyvyDGQsgA4HKP2yEjYwgdGE+8yN2pZIz5wYxJ0VKr7ie1lH6V1JpMZzOGs2RkgkXO1x9vHLiHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QKaxD6SDVyLE49wLyScj0nKl95SNt6bJRnUyAdA8ck=;
 b=WtbhzrE/wS/z/baWhcqBX8JKE28iMSORWVf6p1jzqiaK439jHUHvGmv3siynRhqotgLICIhrdiHB9833BOX1OecY6B5rp8USs0mzj714lzVvp0PCiO2Lc90ef4lar15E4Z7Cm59jDOUo50st/ctH6zR4S8PsoHBy1VOpM4XD2As=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4024.jpnprd01.prod.outlook.com (2603:1096:604:4b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sat, 23 Oct
 2021 07:38:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4628.018; Sat, 23 Oct 2021
 07:38:31 +0000
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
Thread-Index: AQHXutXdv6ZsGiNewUOReWqD4pnIGavfGfWAgAArXcCAAAG4oIABBI8g
Date:   Sat, 23 Oct 2021 07:38:31 +0000
Message-ID: <OS0PR01MB592273BA2B117BE67B108BDF86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211006171605.6861-1-biju.das.jz@bp.renesas.com>
 <YXK7AfUYxuFWl3rl@ninjato>
 <OS0PR01MB5922DC39B54A0B8D7AA8B3DC86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592212E593522E4E72BEAFCA86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592212E593522E4E72BEAFCA86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47c95e2f-e553-4ab8-532d-08d995f81cc2
x-ms-traffictypediagnostic: OSBPR01MB4024:
x-microsoft-antispam-prvs: <OSBPR01MB402400907B2ED90DBFAF553D86819@OSBPR01MB4024.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6WsMzFbx6MQyZzW0xhHnK4VOcQjOESvX6x2/dNRmWXoOLNlZD8VrY++XtF0c8g82foJv1XB6Q1EoQxHFr0Aq3gSSlmcbnfH/VKqWNaQ7SNCw5dYfh+El/gucsnxhfULobFoCadHP8yuAnNena83/q7KZo/AAH+q6pWQ17ELZLtYs1fRgANzJzKdHgkZPjdb/7MFSqSINk5e3v5rVD/o1tlbFrw3OAhJxic9+enPaW0XO/piKritZbYzsxjCUDMtHATPw3A2AL2w1/njTTCBRyOg+RJWE6pCuGcj5Ja7+yCOdKoZP8Zo1t1H3Wb9+dUXLyScYmu+eM4UOfObqK3QSa22n4++nQH05Py6+er1oCyyWzM81YZenA9KQ41g1a4QPYDPViqQjviqFFIHEwZyPqUtMCasw0/TLx2fidqlfr8iqYw+E72+cwGFe+XUh2+KtQYz5b8EbA1WpWlGWUNL112sDw1TIXOIEOrTPkv1QgXPbdYdc9AhgshC/yCaYKiNAiIdwjyYdNKdrbaNZQwhjuxYrSbR1H6SUYPabuHoZsWbw0K7Ca7A5Yqgjd2NS/tcrSrQ1AhoKA6oop00/VonjhOb+qjn9YF0EEIzsmaatUtG3bUxYsDK++zCpD6sZ38ykeR9ZeAgQ2QXvTEEDdwSZt39g7JQyLuCm35KiZitXnpfahuDFk38ehR6TdoCnJwL4yl7QE956rsxUunipnVjNRg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(55016002)(2906002)(71200400001)(33656002)(122000001)(8936002)(54906003)(38100700002)(86362001)(7696005)(52536014)(76116006)(66946007)(66556008)(9686003)(6506007)(66446008)(38070700005)(4326008)(508600001)(186003)(66476007)(64756008)(8676002)(5660300002)(26005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wmOgMgVGye4WeqWXOVDNpENxaWNWKsepGj0szhvzujHvcOH0yVQTScpZbPm3?=
 =?us-ascii?Q?x63V43vkdBkNeQitZeDVcEx3++VgsFryY3Zx037KPt5IQmmdvExL3brPO3Rh?=
 =?us-ascii?Q?U2I1ocxH5N8ct39o8N8sdUjDTHK9cNcIFd7VobHap0ss+tVA+fuVPwkJ/8uY?=
 =?us-ascii?Q?4FlolqWsTzxyVv5uk3wC1hyG4i8HIgfhyLYY9ZDNkNecGPl4acr3G+adiOlj?=
 =?us-ascii?Q?53vBkTneuuK8YOuO0qjqfKjFnBG9BmKeClNaiM4yaVzJDt8T+n6T7xr6FVbT?=
 =?us-ascii?Q?lPAoeI2qnlCHaOsUCiKd/cNvOVRD7WPiy95WrqoGDu66tideQB9F7j9t97yv?=
 =?us-ascii?Q?p5DX/fL+bpAIgBnUJoloyTtzDL3PUIleEJqDvem+Xzmg36DRVgiFBnAR9RAF?=
 =?us-ascii?Q?TGMIhWt4dYoeH7yp+MDvuAAAw2EUAtcZf2rGVxS1Am+EMmTLLmVufh2h0YZy?=
 =?us-ascii?Q?esuxvL0iKVSh1eYfCL39Pq9YokQrrFp2d0wBCc3ap7VlF5st6l/JBfPGaWK9?=
 =?us-ascii?Q?UA4wm33LckwQqsgVpMOU12Fon/ig0n6r4NMkvviiCnclcx34ksfsS/OotBb6?=
 =?us-ascii?Q?7owUbDWHQYw2V0txhulq+oSad5sgG9LWzIYXCljSieyUx+h81FtpzSX30k8a?=
 =?us-ascii?Q?4iDLjooEmKGnhITaXIry0FKQSRsbeBGrlaZ+odT4HaDzKCo185MXSvS69LnU?=
 =?us-ascii?Q?ZxBx+qimqtfQN5zrC1+48J7ZnNMo35DFX/aCIX+R+znWUFsCwg4A0jz3dqi3?=
 =?us-ascii?Q?5Wcn5521BNO55bF77xXJndBRc0Dw04goe/26gzwszEwgyQxWdiFD+rj4n3mR?=
 =?us-ascii?Q?NHqMVxoRJn4J9w8qe6zkL4TiHD+L/869Jt5olFWO+QYfpqqELv33+7jElcNl?=
 =?us-ascii?Q?iNDqA4PjggDr9vVsp8YhPmBC3Bn9R7vLv5IJjh2sJHu4bdiB4S93gOrE8Zs6?=
 =?us-ascii?Q?R4Wf6KvxJ//Xom9//a1EAdKXNcr0kVZH0HJhhkrqh9lM2LtOt3jr9Zdaxwb6?=
 =?us-ascii?Q?60lnI2ZtnT6i4FAntG1nwAY7qV7aFAHQMZgmhal1PSMOR+TD+3UP3LHBlebn?=
 =?us-ascii?Q?j7w3o0DtjSEg6i/Bj2xWGt7v7j/kB4/6rAVckgijT1nTG7vRfg4fmx3IMclM?=
 =?us-ascii?Q?Yu+r15voOUnSZea6teDXBw6JXZXRTZ1E2sA0Ln4AssIBFu5WnqmWg0irSJrM?=
 =?us-ascii?Q?sF0ifM1O7CdqXfaN1qcOUrJhq5s+BVyo2zUDi6XwDOMowdLtacR61EvQYpZf?=
 =?us-ascii?Q?g93KH9eDFrYqe1/StioF9onttdnwmrife7NvW7Y+VaB43YMPks4uxYtzn1fu?=
 =?us-ascii?Q?TxL2uOmWu5lTfd8M+kZqQhJpDErxFMt33Sx5NmlCVDeqVubuDzDQ2fg1PPVA?=
 =?us-ascii?Q?RjZNCGH99+WK3xvR0ZDt8u8N8BkYA9FlWHZLwOMbj5X+JdNfPph1CVaxqJWA?=
 =?us-ascii?Q?rTBfKLBwvWDurrKWxtPjJzDf5pXFwVY5Z/ddqsvcCWCB1I+LrHPpHLe8G/j4?=
 =?us-ascii?Q?VoWFrsFKHgQz3bn4c2bUSLB9itPcCla0JxQM2//NRljgm80//AC6T+vXfno3?=
 =?us-ascii?Q?v8TYOWjGcPAZXFYI7YwT4iX8vRWDka4ZOAdmgMRQvpfMO8IOh7CCgXYTNbw5?=
 =?us-ascii?Q?YPi5R+avsJTV5jUuxagh6DYtBc96HkXpF8EHCAGf9uh8KslNnw68pgpL18sD?=
 =?us-ascii?Q?t2BZCw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c95e2f-e553-4ab8-532d-08d995f81cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2021 07:38:31.4042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SXWzhBqclBjAWyJV0gdZ+d9kcZ13oC7sL1hLTrgBOJSxvxfPn5omTJmYVRGCUSjKZtsYok7mM1Q21i9tKi3UyyCwLUkEW8XREbN2ZzSjSjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4024
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
> > Subject: RE: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with
> > hard reset
> >
> > Hi Wolfram,
> >
> > > Subject: Re: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss
> > > with hard reset
> > >
> > > On Wed, Oct 06, 2021 at 06:16:05PM +0100, Biju Das wrote:
> > > >
> > > > This patch fixes internal cd irq miss after hard reset by enabling
> > > > internal card insertion/removal interrupts.
> > > >
> > > > Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if
> > > > possible")
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > IIUC, the following should be the apropriate fix. Can you please
> > > test
> > it?
> > > If it works, then I'll make a proper patch out of it.
> >
> > I have tested and it doesn't work. This addresses issue from
> > tmio_mmc_reset call from tmio_mmc_core.
> >
>=20
> Just to add, It could be related to timing issue, with your patch, if I
> put some print message, It works.

Finally found the issue. There is one more patch for host->reset in tmio_mm=
c_core.c. please see below.
If you add this code, then it works.

Can you please add this as well in your proper patch?

@ -958,6 +963,11 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, stru=
ct mmc_ios *ios)
                /* For R-Car Gen2+, we need to reset SDHI specific SCC */
                if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
                        host->reset(host);
+
+               if (host->native_hotplug)
+                       tmio_mmc_enable_mmc_irqs(host,
+                               TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSE=
RT);
+

Regards,
Biju

> >
> > >
> > > diff --git a/drivers/mmc/host/tmio_mmc_core.c
> > > b/drivers/mmc/host/tmio_mmc_core.c
> > > index 7dfc26f48c18..9416245a7b56 100644
> > > --- a/drivers/mmc/host/tmio_mmc_core.c
> > > +++ b/drivers/mmc/host/tmio_mmc_core.c
> > > @@ -195,6 +195,10 @@ static void tmio_mmc_reset(struct tmio_mmc_host
> > > *host)
> > >  	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host-
> > > >sdcard_irq_mask_all);
> > >  	host->sdcard_irq_mask =3D host->sdcard_irq_mask_all;
> > >
> > > +	if (host->native_hotplug)
> > > +		tmio_mmc_enable_mmc_irqs(host,
> > > +				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
> > > +
> > >  	tmio_mmc_set_bus_width(host, host->mmc->ios.bus_width);
> > >
> > >  	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) { @@ -1185,10 +1189,6
> > > @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
> > >  	_host->set_clock(_host, 0);
> > >  	tmio_mmc_reset(_host);
> > >
> > > -	if (_host->native_hotplug)
> > > -		tmio_mmc_enable_mmc_irqs(_host,
> > > -				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
> > > -
> > >  	spin_lock_init(&_host->lock);
> > >  	mutex_init(&_host->ios_lock);
> > >

