Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D659F505ECF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Apr 2022 22:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238522AbiDRUE6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Apr 2022 16:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbiDRUE6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Apr 2022 16:04:58 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47ECB2DD7D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Apr 2022 13:02:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBEnovlPimWiD+KE+u4iPHt7ngzr8cgB/sn0hFW64RuQSxH0UROXfWM/6AbB4SN2KBOFz8Ky9wDoZpgie4HQgvnsm1/gsfEPmbCeeVlPBCCHAVxn65KvB5eq6TjKqWTM1hzdSe3SxAHuowB5hnMoWsrs6bM0lrfouhCueCFPMa/o2p0v0MNAYI3h+Ugwx7C9DBJpBhlPo0k36e856hsq06DdqApv27ET/65BG6zUWEJ4xN2DvHQO0n2OgUZWxeypyIloQFuTb6eX6j9QXYdbdRGow7/yhco722hcFNaClKygtylMRhi1Jjft0oHugkyIIcsKvIzF62IblI05WctvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBN9IGheDsx1cK+OEIItlLc5//fbN4Ac1froTzmT4Kg=;
 b=aOMi6qilin+owpHRObV/UtXgE4Ak186VrElLczSESDvNoOhq0OAjP7Kom3NzZsqfCHX6qTku+xBWwKWNcc+tguqOg7Xj5Z/Y6/qZSE7iGpNUhIIXwBAD4dqcxTZdyIPtW+Hk+w8GermTiCYcUBduahOev3DzRsbpIh/EPRGYWjv8LuALuewPK5M1GugPwnyJiCEnE/FNlXvA3IWwdBQhl+g34heDorscJiZFUTe1AFElXaCvSDR3V+kBD2mOETDPlzYourqn6r9I8SpGLSSs74NyGqjtia7Tv8HMhTnfer9s98qhzkOgRK2BFx+1KqXLicg5lAjfnAVE7cY55IdhRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBN9IGheDsx1cK+OEIItlLc5//fbN4Ac1froTzmT4Kg=;
 b=fHp4zFPeCajYTSUHzD0oE/jnN035ACjWDG82mjIxwA2NojFXBZYCxMHSPvezUWRGjnKlPkDuzQkd0uxZUR88NzUbcU1eUlT0c2u/J9EeXJ3vRW1ou2LeEW65crG6QcrId/dTDO0PFboITYkMCguY2XDuxz57b/5Zgb2Hlwxd6VE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB3164.jpnprd01.prod.outlook.com (2603:1096:404:7c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 20:02:12 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 20:02:12 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: RE: [PATCH v2 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Topic: [PATCH v2 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Index: AQHYQnA/Cw/1LyKD8kOc9znJuIc2Zazw6l6AgAVMabA=
Date:   Mon, 18 Apr 2022 20:02:12 +0000
Message-ID: <OS0PR01MB592253DA0A85F820E881026D86F39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220328065115.11724-1-biju.das.jz@bp.renesas.com>
 <YllPoxf6tAh/W+7e@pendragon.ideasonboard.com>
In-Reply-To: <YllPoxf6tAh/W+7e@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f526fab7-478c-4c27-d255-08da217653d9
x-ms-traffictypediagnostic: TY2PR01MB3164:EE_
x-microsoft-antispam-prvs: <TY2PR01MB3164149EE1FADA8D739F8F1D86F39@TY2PR01MB3164.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xsihDqVeLr3n0g92Kh3Te2bUnwMUb1Ryqt3X7QkU+292058gZFWT+YaS/QqMJWCdpIWKYhP8UXLpN1YlDYXH7KYEdRYv8zMqv3UtKjtiMl+xFL4tFKAhOukwHVYec/uw+NtTkpLn40vwQ+sGz6ejuo6309njy74JwIF+XtId/5j+KVE/0pJXgtxbrAWz+pSWSBRpPm/2ZhD/yjtu361bYpoGMWyIyvvSaZ/4rbFvKqRlNySlxPS9M6xJVwi/4g7D/6dD93DrEy5p1mDe/MGa6gJgsKebDWS5OASjYYxdDj1r8D17ab56K3Y5IplkNLxyt1kEe1LxXjJgMxTcei+XRSn4Dvuo1QMeG+tfSywUihReXdWSQ+CNgLKlRU4umIs5bfTxP0Ixih3wTykkpFYxEIe3sWlhdOfZK9nVOTjUD+GNxDeG8EUnM2GFhpMiNGlOz3r/reF8QpeFi7QvCyC8vmJclnH3x14om1LjJVDkvE2jaRf1TkCwHYjXx9ecJDcT2Zpfoyl5GDAtiSVsQk/aANP2EYm9Umewm5cKoxYatyIA6Dxa/s6sTeGiEvtE/1ayaqj4o1UT2QaLfw5icU2HAqn/6tT1hXNu4Nkm2Yfm1GlQK2Jg+aR/HpascdjrP70GDBSggi9UJVBiTPvh9YdYbRBrWq54v6G/p3foM4VcyopaSXbHydMLMTW1dr9yzlyzobC9JoIWEZPlelDjaX7VPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(6506007)(66946007)(508600001)(52536014)(76116006)(66556008)(5660300002)(8936002)(4326008)(54906003)(33656002)(7696005)(6916009)(8676002)(9686003)(26005)(2906002)(186003)(66476007)(38100700002)(66446008)(83380400001)(122000001)(30864003)(316002)(55016003)(86362001)(64756008)(38070700005)(559001)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q1Y7odtRuCAVbCKDTSmxng4cfDrt1wua+itn7zD74snBZ+YXXeE/JIU8z6vV?=
 =?us-ascii?Q?4u4x2/y/s2+kYA4pPnvhZsDhsiL4mTw/TdKF4O2Hd+/PnoyQoiiBFlVdXY5D?=
 =?us-ascii?Q?7Fnfv+loRhPS3/GUpLJYeiSw7lURQWDBEx0g5VjuEDJbx5BKkIPu18uTfZ6U?=
 =?us-ascii?Q?LIej6qbuiSDzs9LboPXIgiedh2Ig7SutsHTa8py2Yf/aOCYSbQlok2Y08Shs?=
 =?us-ascii?Q?7R5Cox+pZZaKguZlr7h5DfG2Zdr7julIqmR5vuUJkYtbWBhTxitt1tbKAi6l?=
 =?us-ascii?Q?8CtW6Yq3HkECiolBWusBrGauxANZBxGtJC4mSR5cbD05wlQ30Y3mPJbKEg9h?=
 =?us-ascii?Q?yByHzV7cS937IgeyvVIHzSoWs2hE21FwQW6Gjuy+kVzLcoQKMaFLjz/TnFhv?=
 =?us-ascii?Q?qNGeyqSh82/qkKlJfZ2W8beMX94zvoNXqcxdsrMxBIZXr7u59U9xjd7KV83a?=
 =?us-ascii?Q?bXISSSXW1HWzDtbPJOl+uU7CEh9B8EDTDPVcaeb3zmt5K4u1DvwLsSdy9HXq?=
 =?us-ascii?Q?xrdGV35d6qM1u1XLjejTmolp3AlAuJuJ7myn0SCYXA/cVrJ57fTYB3HFjoT+?=
 =?us-ascii?Q?AKYyatqcZKnod6R4BuXpfRXp/mVqGp2pRHckbMppVWHKJ+hoVm3PTmdCQgzc?=
 =?us-ascii?Q?bnDovkR2M9I2WevcGyqdn28NL2klCMtQHuiz/EZaAQvWQOuQIMUq54U3vMPE?=
 =?us-ascii?Q?TS+HDgmde/nJTZ8ggccOYHm/WrlkG6w5jXMMN1pBhbeaDUdPsor/r8pnl0fn?=
 =?us-ascii?Q?UNSwx1ovc8dqFz1tMjTWy9NsdwaXtrKgdQr9xc5v9KaXMtl5JLipHoSI2V1y?=
 =?us-ascii?Q?zZsl018Fvjnoh7J2z00ESmd9vzJC4RMH+nyZIFe40bWnMs+gmkt98LoNmYK9?=
 =?us-ascii?Q?H2AmDb+u23/QTG12DLJXiNpLbBJIBbysaeI5qWtU/EtPWmPjQZUfSvlzvock?=
 =?us-ascii?Q?HBVAHgqd1ryJDWFYfBhEUs0tqgkr8tahiSfHfWL4utjD1XZjtAZ7iQChXG6y?=
 =?us-ascii?Q?YvSjHPjM0eOTF7josaFK9be7VHq9g5d2QkVD8hGm084TqJ5cBzcTO6PlNgsq?=
 =?us-ascii?Q?4OsuLAd+/ve5rhFmDaRcKwOod/fBH9U2sTJKwqUDHX2imAiZ4WhxJEPMzdj9?=
 =?us-ascii?Q?kNM2t/+lGbMWefNa6Q8BHyq10E3vrJulTRrS1giR+AZ0EuxqYwXOM+TeOC3u?=
 =?us-ascii?Q?7n8eayHvj11wJ/wFtBTq4H3lfbEK8Ay3MGkk3x1OZNpW7M+UBVQoDoLesoek?=
 =?us-ascii?Q?0xHz5Pq+rluQJQz9+9bNIcx6eNW/d/fX8fR1qjXqiVX3qynY3c3/CaYS/afr?=
 =?us-ascii?Q?oRuSiB+Klfb+rAR7LxRGsjOo9uDJ75gextCOB0SqShN8BuD33gyAKgrsOvPQ?=
 =?us-ascii?Q?eoPj4kIFEOR0JB5jLlzqWJlSKr7QY+O4HYwNYqEJAzbEBMK/uqE8QdHTWSjF?=
 =?us-ascii?Q?Hl7RoKPV4LoKdF3jGTQOFgBWvUjJ7iTJxq+vQVW4u14+xMSnl2WyB7414LaB?=
 =?us-ascii?Q?IabBSGQXvcHqido9bw8OF7N9iXMRvqlDNcsudk9EYlggFaoGk5CibR/+llbl?=
 =?us-ascii?Q?OHSwQixp+XDWAU70vULfL8RMyMhx8dTEmoR2Xf/unStGe4hsMoexyCbPBF6K?=
 =?us-ascii?Q?wKlpLPtUVSzRM4uOVP2rDn7XAfivZ9OypXwA2GY9QZj5SSBGQjqJ8J+A24UK?=
 =?us-ascii?Q?HML0Qq7COkekFIjqkolHky4Ui8yZVnTunaIgJV7oDHxGU2kEBtIKMb37X5Jl?=
 =?us-ascii?Q?HCjCsd09Da4zG8xLuDJItDLuBRgHjhE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f526fab7-478c-4c27-d255-08da217653d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 20:02:12.2206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fCKEHPjb33OY+3/LBhM0CLxrVd6nCbvENczREqi40q8En1DLwSrs4DeIy6q7qyqZ7duGDmn1U4gAgL/Rhrys1OejyJcIww8B+Vc2G0dWAzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3164
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH v2 2/2] drm: rcar-du: Add RZ/G2L DSI driver
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Mon, Mar 28, 2022 at 07:51:15AM +0100, Biju Das wrote:
> > This driver supports the MIPI DSI encoder found in the RZ/G2L SoC. It
> > currently supports DSI mode only.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * Rework based on dt-binding change (DSI + D-PHY) as single block
> >  * Replaced link_mmio and phy_mmio with mmio in struct rzg2l_mipi_dsi
> >  * Replaced rzg2l_mipi_phy_write with rzg2l_mipi_dsi_phy_write
> >    and rzg2l_mipi_dsi_link_write
> >  * Replaced rzg2l_mipi_phy_read->rzg2l_mipi_dsi_link_read
> > RFC->v1:
> >  * Added "depends on ARCH_RENESAS || COMPILE_TEST" on KCONFIG
> >    and dropped DRM as it is implied by DRM_BRIDGE
> >  * Used devm_reset_control_get_exclusive() for reset handle
> >  * Removed bool hsclkmode from struct rzg2l_mipi_dsi
> >  * Added error check for pm, using pm_runtime_resume_and_get() instead =
of
> >    pm_runtime_get_sync()
> >  * Added check for unsupported formats in rzg2l_mipi_dsi_host_attach()
> >  * Avoided read-modify-write stopping hsclock
> >  * Used devm_platform_ioremap_resource for resource allocation
> >  * Removed unnecessary assert call from probe and remove.
> >  * wrap the line after the PTR_ERR() in probe()
> >  * Updated reset failure messages in probe
> >  * Fixed the typo arstc->prstc
> >  * Made hex constants to lower case.
> > RFC:
> >  *
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig               |   8 +
> >  drivers/gpu/drm/rcar-du/Makefile              |   1 +
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 686 ++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 149 ++++
> >  4 files changed, 844 insertions(+)
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig
> > b/drivers/gpu/drm/rcar-du/Kconfig index e40fb0c53f9b..83d7d28214a0
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -64,6 +64,14 @@ config DRM_RCAR_MIPI_DSI
> >  	help
> >  	  Enable support for the R-Car Display Unit embedded MIPI DSI
> encoders.
> >
> > +config DRM_RZG2L_MIPI_DSI
> > +	tristate "RZ/G2L MIPI DSI Encoder Support"
> > +	depends on DRM_BRIDGE && OF
> > +	depends on ARCH_RENESAS || COMPILE_TEST
> > +	select DRM_MIPI_DSI
> > +	help
> > +	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI
> encoders.
> > +
> >  config DRM_RCAR_VSP
> >  	bool "R-Car DU VSP Compositor Support" if ARM
> >  	default y if ARM64
> > diff --git a/drivers/gpu/drm/rcar-du/Makefile
> > b/drivers/gpu/drm/rcar-du/Makefile
> > index 01ba78e56b53..7fb4f8717fc4 100644
> > --- a/drivers/gpu/drm/rcar-du/Makefile
> > +++ b/drivers/gpu/drm/rcar-du/Makefile
> > @@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_RCAR_LVDS)		+=3D rcar_lvds.o
> >  obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+=3D rcar_mipi_dsi.o
> >
> >  obj-$(CONFIG_DRM_RZG2L_DU)		+=3D rzg2l-du-drm.o
> > +obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+=3D rzg2l_mipi_dsi.o
> >
> >  # 'remote-endpoint' is fixed up at run-time
> >  DTC_FLAGS_rcar_du_of_lvds_r8a7790 +=3D -Wno-graph_endpoint diff --git
> > a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > new file mode 100644
> > index 000000000000..3b785041ba5e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > @@ -0,0 +1,686 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * RZ/G2L MIPI DSI Encoder Driver
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corporation  */ #include
> > +<linux/clk.h> #include <linux/delay.h> #include <linux/io.h> #include
> > +<linux/iopoll.h> #include <linux/module.h> #include <linux/of.h>
> > +#include <linux/of_device.h> #include <linux/of_graph.h> #include
> > +<linux/platform_device.h> #include <linux/pm_runtime.h> #include
> > +<linux/reset.h> #include <linux/slab.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "rzg2l_mipi_dsi_regs.h"
> > +
> > +struct rzg2l_mipi_dsi {
> > +	struct device *dev;
> > +	void __iomem *mmio;
> > +
> > +	struct reset_control *rstc;
> > +	struct reset_control *arstc;
> > +	struct reset_control *prstc;
> > +
> > +	struct mipi_dsi_host host;
> > +	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge;
> > +
> > +	struct clk *vclk;
> > +
> > +	enum mipi_dsi_pixel_format format;
> > +	unsigned int num_data_lanes;
> > +	unsigned int lanes;
> > +	unsigned long mode_flags;
> > +};
> > +
> > +static inline struct rzg2l_mipi_dsi * bridge_to_rzg2l_mipi_dsi(struct
> > +drm_bridge *bridge) {
> > +	return container_of(bridge, struct rzg2l_mipi_dsi, bridge); }
> > +
> > +static inline struct rzg2l_mipi_dsi * host_to_rzg2l_mipi_dsi(struct
> > +mipi_dsi_host *host) {
> > +	return container_of(host, struct rzg2l_mipi_dsi, host); }
> > +
> > +static void rzg2l_mipi_dsi_phy_write(void __iomem *mem, u32 reg, u32
> > +data)
>=20
> You can pass a rzg2l_mipi_dsi pointer to this function instead of the
> memory pointer. Same for the two functions below.

OK, Agreed.

>=20
> > +{
> > +	iowrite32(data, mem + reg);
> > +}
> > +
> > +static void rzg2l_mipi_dsi_link_write(void __iomem *mem, u32 reg, u32
> > +data) {
> > +	iowrite32(data, mem + LINK_REG_OFFSET + reg); }
> > +
> > +static u32 rzg2l_mipi_dsi_link_read(void __iomem *mem, u32 reg) {
> > +	return ioread32(mem + LINK_REG_OFFSET + reg); }
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Hardware Setup
> > + */
> > +
> > +static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> > +				  const struct drm_display_mode *mode) {
> > +	unsigned long hsfreq;
> > +	u32 txsetr;
> > +	u32 clstptsetr;
> > +	u32 lptrnstsetr;
> > +	u8 max_num_lanes;
> > +	u32 clkkpt;
> > +	u32 clkbfht;
> > +	u32 clkstpt;
> > +	u32 golpbkt;
> > +	unsigned int bpp;
> > +	struct {
> > +		u32 tclk_miss;
> > +		u32 t_init;
> > +		u32 tclk_prepare;
> > +		u32 tclk_settle;
> > +		u32 tclk_trail;
> > +		u32 tclk_post;
> > +		u32 tclk_pre;
> > +		u32 tclk_zero;
> > +		u32 tlpx;
> > +		u32 ths_prepare;
> > +		u32 ths_settle;
> > +		u32 ths_exit;
> > +		u32 ths_trail;
> > +		u32 ths_zero;
> > +	} timings;
> > +	u32 dphyctrl0;
> > +	u32 dphytim0;
> > +	u32 dphytim1;
> > +	u32 dphytim2;
> > +	u32 dphytim3;
> > +	int ret;
> > +
> > +	/* Relationship between hsclk and vclk must follow
>=20
> 	/*
> 	 * Relationship between hsclk and vclk must follow

OK.

>=20
> > +	 * vclk * bpp =3D hsclk * 8 * lanes
> > +	 * where vclk: video clock (Hz)
> > +	 *       bpp: video pixel bit depth
> > +	 *       hsclk: DSI HS Byte clock frequency (Hz)
> > +	 *       lanes: number of data lanes
> > +	 *
> > +	 * hsclk(bit) =3D hsclk(byte) * 8
> > +	 */
> > +
> > +	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +	hsfreq =3D (mode->clock * bpp * 8) / (8 * dsi->lanes);
> > +
> > +	/* Initializing DPHY before accessing LINK */
> > +
> > +	/* All DSI global operation timings are set with recommended setting
> */
> > +	if (hsfreq > 250000) {
> > +		timings.tclk_miss =3D 1;
> > +		timings.t_init =3D 79801;
> > +		timings.tclk_prepare =3D 8;
> > +		timings.tclk_settle =3D 9;
> > +		timings.tclk_trail =3D 7;
> > +		timings.tclk_post =3D 35;
> > +		timings.tclk_pre =3D 4;
> > +		timings.tclk_zero =3D 33;
> > +		timings.tlpx =3D 6;
> > +		timings.ths_prepare =3D 9;
> > +		timings.ths_settle =3D 9;
> > +		timings.ths_exit =3D 13;
> > +		timings.ths_trail =3D 9;
> > +		timings.ths_zero =3D 16;
> > +	} else {
> > +		timings.tclk_miss =3D 1;
> > +		timings.t_init =3D 79801;
> > +		timings.tclk_prepare =3D 8;
> > +		timings.tclk_settle =3D 9;
> > +		timings.tclk_trail =3D 10;
> > +		timings.tclk_post =3D 94;
> > +		timings.tclk_pre =3D 13;
> > +		timings.tclk_zero =3D 33;
> > +		timings.tlpx =3D 6;
> > +		timings.ths_prepare =3D 12;
> > +		timings.ths_settle =3D 9;
> > +		timings.ths_exit =3D 13;
> > +		timings.ths_trail =3D 17;
> > +		timings.ths_zero =3D 23;
> > +	}
> > +
> > +	ret =3D reset_control_deassert(dsi->arstc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D reset_control_deassert(dsi->prstc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D pm_runtime_resume_and_get(dsi->dev);
> > +	if (ret < 0) {
> > +		reset_control_assert(dsi->prstc);
> > +		reset_control_assert(dsi->arstc);
> > +		return ret;
> > +	}
> > +
> > +	clk_set_rate(dsi->vclk, mode->clock * 1000);
> > +
> > +	dphyctrl0 =3D DSIDPHYCTRL0_CAL_EN_HSRX_OFS |
> DSIDPHYCTRL0_CMN_MASTER_EN |
> > +		    DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR;
> > +
> > +	rzg2l_mipi_dsi_phy_write(dsi->mmio, DSIDPHYCTRL0, dphyctrl0);
> > +	usleep_range(20, 30);
> > +
> > +	dphyctrl0 |=3D DSIDPHYCTRL0_EN_LDO1200;
> > +	rzg2l_mipi_dsi_phy_write(dsi->mmio, DSIDPHYCTRL0, dphyctrl0);
> > +	usleep_range(10, 20);
> > +
> > +	dphytim0 =3D DSIDPHYTIM0_TCLK_MISS(timings.tclk_miss) |
> > +		   DSIDPHYTIM0_T_INIT(timings.t_init);
> > +	dphytim1 =3D DSIDPHYTIM1_THS_PREPARE(timings.ths_prepare) |
> > +		   DSIDPHYTIM1_TCLK_PREPARE(timings.tclk_prepare) |
> > +		   DSIDPHYTIM1_THS_SETTLE(timings.ths_settle) |
> > +		   DSIDPHYTIM1_TCLK_SETTLE(timings.tclk_settle);
> > +	dphytim2 =3D DSIDPHYTIM2_TCLK_TRAIL(timings.tclk_trail) |
> > +		   DSIDPHYTIM2_TCLK_POST(timings.tclk_post) |
> > +		   DSIDPHYTIM2_TCLK_PRE(timings.tclk_pre) |
> > +		   DSIDPHYTIM2_TCLK_ZERO(timings.tclk_zero);
> > +	dphytim3 =3D DSIDPHYTIM3_TLPX(timings.tlpx) |
> > +		   DSIDPHYTIM3_THS_EXIT(timings.ths_exit) |
> > +		   DSIDPHYTIM3_THS_TRAIL(timings.ths_trail) |
> > +		   DSIDPHYTIM3_THS_ZERO(timings.ths_zero);
> > +
> > +	rzg2l_mipi_dsi_phy_write(dsi->mmio, DSIDPHYTIM0, dphytim0);
> > +	rzg2l_mipi_dsi_phy_write(dsi->mmio, DSIDPHYTIM1, dphytim1);
> > +	rzg2l_mipi_dsi_phy_write(dsi->mmio, DSIDPHYTIM2, dphytim2);
> > +	rzg2l_mipi_dsi_phy_write(dsi->mmio, DSIDPHYTIM3, dphytim3);
> > +
> > +	reset_control_deassert(dsi->rstc);
> > +	udelay(1);
> > +
> > +	/* Check number of lanes capability */
> > +	max_num_lanes =3D rzg2l_mipi_dsi_link_read(dsi->mmio, TXSETR) >> 16;
> > +	max_num_lanes =3D (max_num_lanes & 0x3) + 1;
> > +	if (max_num_lanes < dsi->lanes) {
> > +		dev_err(dsi->dev, "DPHY can not support %d lanes", dsi-
> >lanes);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Enable Data lanes and Clock lanes */
> > +	txsetr =3D TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) |
> TXSETR_CLEN;
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, TXSETR, txsetr);
> > +
> > +	/*
> > +	 * Global timings characteristic depends on high speed Clock
> Frequency
> > +	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
> > +	 * - videoclock =3D 148.5 (MHz)
> > +	 * - bpp: maximum 24bpp
> > +	 * - data lanes: maximum 4 lanes
> > +	 * Therefore maximum hsclk will be 891 Mbps.
> > +	 */
> > +
> > +	if (hsfreq > 445500) {
> > +		clkkpt =3D 12;
> > +		clkbfht =3D 15;
> > +		clkstpt =3D 48;
> > +		golpbkt =3D 75;
> > +	} else if (hsfreq > 250000) {
> > +		clkkpt =3D 7;
> > +		clkbfht =3D 8;
> > +		clkstpt =3D 27;
> > +		golpbkt =3D 40;
> > +	} else {
> > +		clkkpt =3D 8;
> > +		clkbfht =3D 6;
> > +		clkstpt =3D 24;
> > +		golpbkt =3D 29;
> > +	}
> > +
> > +	clstptsetr =3D CLSTPTSETR_CLKKPT(clkkpt) | CLSTPTSETR_CLKBFHT(clkbfht=
)
> |
> > +		     CLSTPTSETR_CLKSTPT(clkstpt);
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, CLSTPTSETR, clstptsetr);
> > +
> > +	lptrnstsetr =3D LPTRNSTSETR_GOLPBKT(golpbkt);
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, LPTRNSTSETR, lptrnstsetr);
> > +
> > +	return 0;
> > +}
> > +
> > +static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi
> *dsi,
> > +					      const struct drm_display_mode *mode) {
> > +	u32 vich1ppsetr;
> > +	u32 vich1vssetr;
> > +	u32 vich1vpsetr;
> > +	u32 vich1hssetr;
> > +	u32 vich1hpsetr;
> > +	int dsi_format;
> > +	u32 delay[2];
> > +	u8 index;
> > +
> > +	/* Configuration for Pixel Packet */
> > +	dsi_format =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > +	switch (dsi_format) {
> > +	case 24:
> > +		vich1ppsetr =3D VICH1PPSETR_DT_RGB24;
> > +		break;
> > +	case 18:
> > +		vich1ppsetr =3D VICH1PPSETR_DT_RGB18;
> > +		break;
> > +	}
> > +
> > +	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> > +		vich1ppsetr |=3D VICH1PPSETR_TXESYNC_PULSE;
> > +
> > +	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> > +		vich1ppsetr &=3D ~VICH1PPSETR_TXESYNC_PULSE;
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, VICH1PPSETR, vich1ppsetr);
> > +
> > +	/* Configuration for Video Parameters */
> > +	vich1vssetr =3D VICH1VSSETR_VACTIVE(mode->vdisplay) |
> > +		      VICH1VSSETR_VSA(mode->vsync_end - mode->vsync_start);
> > +	vich1vssetr |=3D (mode->flags & DRM_MODE_FLAG_PVSYNC) ?
> > +			VICH1VSSETR_VSPOL_HIGH : VICH1VSSETR_VSPOL_LOW;
> > +
> > +	vich1vpsetr =3D VICH1VPSETR_VFP(mode->vsync_start - mode->vdisplay) |
> > +		      VICH1VPSETR_VBP(mode->vtotal - mode->vsync_end);
> > +
> > +	vich1hssetr =3D VICH1HSSETR_HACTIVE(mode->hdisplay) |
> > +		      VICH1HSSETR_HSA(mode->hsync_end - mode->hsync_start);
> > +	vich1hssetr |=3D (mode->flags & DRM_MODE_FLAG_PHSYNC) ?
> > +			VICH1HSSETR_HSPOL_HIGH : VICH1HSSETR_HSPOL_LOW;
> > +
> > +	vich1hpsetr =3D VICH1HPSETR_HFP(mode->hsync_start - mode->hdisplay) |
> > +		      VICH1HPSETR_HBP(mode->htotal - mode->hsync_end);
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, VICH1VSSETR, vich1vssetr);
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, VICH1VPSETR, vich1vpsetr);
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, VICH1HSSETR, vich1hssetr);
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, VICH1HPSETR, vich1hpsetr);
> > +
> > +	/*
> > +	 * Configuration for Delay Value
> > +	 * Delay value based on 2 ranges of video clock.
> > +	 * 74.25MHz is videoclock of HD@60p or FHD@30p
> > +	 */
> > +
> > +	if (mode->clock > 74250) {
> > +		delay[0] =3D 231;
> > +		delay[1] =3D 216;
> > +	} else {
> > +		delay[0] =3D 220;
> > +		delay[1] =3D 212;
> > +	}
> > +
> > +	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> > +		index =3D 0;
> > +	else
> > +		index =3D 1;
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, VICH1SET1R,
> > +				  VICH1SET1R_DLY(delay[index]));
> > +}
> > +
> > +static int rzg2l_mipi_dsi_start_hs_clock(struct rzg2l_mipi_dsi *dsi)
> > +{
> > +	bool hsclk_running_mode;
> > +	u32 hsclksetr;
> > +	u32 status;
> > +	int ret;
> > +
> > +	hsclk_running_mode =3D !(dsi->mode_flags &
> > +MIPI_DSI_CLOCK_NON_CONTINUOUS);
> > +
> > +	/* Start HS clock */
> > +	hsclksetr =3D HSCLKSETR_HSCLKRUN_HS | (hsclk_running_mode ?
> > +					     HSCLKSETR_HSCLKMODE_CONT :
> > +					     HSCLKSETR_HSCLKMODE_NON_CONT);
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, HSCLKSETR, hsclksetr);
> > +
> > +	if (hsclk_running_mode) {
> > +		ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +					status & PLSR_CLLP2HS,
> > +					2000, 20000, false, dsi->mmio, PLSR);
> > +		if (ret < 0) {
> > +			dev_err(dsi->dev, "failed to start HS clock\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	dev_dbg(dsi->dev, "Start High Speed Clock with %s clock mode",
> > +		hsclk_running_mode ? "continuous" : "non-continuous");
> > +
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_stop_hs_clock(struct rzg2l_mipi_dsi *dsi) {
> > +	bool hsclk_mode;
> > +	u32 status;
> > +	int ret;
> > +
> > +	hsclk_mode =3D !(dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS);
> > +
> > +	/* Stop HS clock */
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, HSCLKSETR,
> > +				  hsclk_mode ? HSCLKSETR_HSCLKMODE_CONT :
> > +				  HSCLKSETR_HSCLKMODE_NON_CONT);
> > +
> > +	if (hsclk_mode) {
> > +		ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +					status & PLSR_CLHS2LP,
> > +					2000, 20000, false, dsi->mmio, PLSR);
> > +		if (ret < 0) {
> > +			dev_err(dsi->dev, "failed to stop HS clock\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_start_video(struct rzg2l_mipi_dsi *dsi) {
> > +	u32 vich1set0r;
> > +	u32 status;
> > +	int ret;
> > +
> > +	/* Configuration for Blanking sequence and start video input*/
> > +	vich1set0r =3D VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
> > +		     VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, VICH1SET0R, vich1set0r);
> > +
> > +	ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +				status & VICH1SR_VIRDY,
> > +				2000, 20000, false, dsi->mmio, VICH1SR);
> > +	if (ret < 0) {
> > +		dev_err(dsi->dev, "Failed to start video signal input\n");
> > +		return ret;
> > +	}
> > +
> > +	dev_dbg(dsi->dev, "Start video transferring");
>=20
> I'm not sure this message is actually useful even for debugging.

OK, Will remove this.

>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi) {
> > +	u32 status;
> > +	int ret;
> > +
> > +	rzg2l_mipi_dsi_link_write(dsi->mmio, VICH1SET0R,
> VICH1SET0R_VSTPAFT);
> > +	ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +				(status & VICH1SR_STOP) && (!(status &
> VICH1SR_RUNNING)),
> > +				2000, 20000, false, dsi->mmio, VICH1SR);
> > +	if (ret < 0)
> > +		goto err;
> > +
> > +	ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > +				!(status & LINKSR_HSBUSY),
> > +				2000, 20000, false, dsi->mmio, LINKSR);
> > +	if (ret < 0)
> > +		goto err;
> > +
> > +	return 0;
> > +err:
> > +	dev_err(dsi->dev, "Failed to stop video signal input\n");
> > +	return ret;
> > +}
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Bridge
> > + */
> > +
> > +static int rzg2l_mipi_dsi_attach(struct drm_bridge *bridge,
> > +				 enum drm_bridge_attach_flags flags) {
> > +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +
> > +	return drm_bridge_attach(bridge->encoder, dsi->next_bridge, bridge,
> > +				 flags);
> > +}
> > +
> > +static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> > +					 struct drm_bridge_state *old_bridge_state)
> {
> > +	struct drm_atomic_state *state =3D old_bridge_state->base.state;
> > +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +	const struct drm_display_mode *mode;
> > +	struct drm_connector *connector;
> > +	struct drm_crtc *crtc;
> > +	int ret;
> > +
> > +	connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge-
> >encoder);
> > +	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> > +	mode =3D &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
> > +
> > +	ret =3D rzg2l_mipi_dsi_startup(dsi, mode);
> > +	if (ret < 0)
> > +		return;
> > +
> > +	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> > +
> > +	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
> > +	if (ret < 0)
> > +		return;
> > +
> > +	ret =3D rzg2l_mipi_dsi_start_video(dsi);
> > +	if (ret < 0)
> > +		return;
>=20
> I would have expected DSI peripherals to require the use of enable and
> pre_enable to split the clock and video enable, but if it works, that's
> fine.

Yes, it works fine.

>=20
> > +}
> > +
> > +static void rzg2l_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
> > +					  struct drm_bridge_state *old_bridge_state)
> {
> > +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +
> > +	rzg2l_mipi_dsi_stop_video(dsi);
> > +	rzg2l_mipi_dsi_stop_hs_clock(dsi);
> > +	pm_runtime_put(dsi->dev);
> > +	reset_control_assert(dsi->rstc);
> > +	reset_control_assert(dsi->arstc);
> > +	reset_control_assert(dsi->prstc);
> > +}
> > +
> > +static enum drm_mode_status
> > +rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> > +				 const struct drm_display_info *info,
> > +				 const struct drm_display_mode *mode) {
> > +	if (mode->clock > 148500)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops =3D {
> > +	.attach =3D rzg2l_mipi_dsi_attach,
> > +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +	.atomic_enable =3D rzg2l_mipi_dsi_atomic_enable,
> > +	.atomic_disable =3D rzg2l_mipi_dsi_atomic_disable,
> > +	.mode_valid =3D rzg2l_mipi_dsi_bridge_mode_valid, };
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Host setting
> > + */
> > +
> > +static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> > +				      struct mipi_dsi_device *device) {
> > +	struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
> > +	int ret;
> > +
> > +	if (device->lanes > dsi->num_data_lanes)
> > +		return -EINVAL;
> > +
> > +	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
> > +	case 24:
> > +	case 18:
> > +		break;
> > +	default:
> > +		dev_warn(dsi->dev, "unsupported format");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dsi->lanes =3D device->lanes;
> > +	dsi->format =3D device->format;
> > +	dsi->mode_flags =3D device->mode_flags;
> > +
> > +	dsi->next_bridge =3D devm_drm_of_get_bridge(dsi->dev, dsi->dev-
> >of_node,
> > +						  1, 0);
> > +	if (IS_ERR(dsi->next_bridge)) {
> > +		ret =3D PTR_ERR(dsi->next_bridge);
> > +		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	/* Initialize the DRM bridge. */
> > +	dsi->bridge.funcs =3D &rzg2l_mipi_dsi_bridge_ops;
> > +	dsi->bridge.of_node =3D dsi->dev->of_node;
>=20
> This can be done at probe time.
OK.

>=20
> > +	drm_bridge_add(&dsi->bridge);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_host_detach(struct mipi_dsi_host *host,
> > +				      struct mipi_dsi_device *device) {
> > +	struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
> > +
> > +	drm_bridge_remove(&dsi->bridge);
> > +	return 0;
> > +}
> > +
> > +static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops =3D {
> > +	.attach =3D rzg2l_mipi_dsi_host_attach,
> > +	.detach =3D rzg2l_mipi_dsi_host_detach, };
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Probe & Remove
> > + */
> > +
> > +static int rzg2l_mipi_dsi_parse_dt(struct rzg2l_mipi_dsi *dsi) {
> > +	struct device_node *ep;
> > +	u32 data_lanes[4];
> > +	int ret;
> > +
> > +	ep =3D of_graph_get_endpoint_by_regs(dsi->dev->of_node, 1, 0);
> > +	if (!ep) {
> > +		dev_dbg(dsi->dev, "unconnected port@1\n");
>=20
> Should this be an error message ?

Will change it to error message.

>=20
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret =3D of_property_read_variable_u32_array(ep, "data-lanes",
> data_lanes,
> > +						  1, 4);
> > +	of_node_put(ep);
> > +
> > +	if (ret < 0) {
> > +		dev_err(dsi->dev, "missing or invalid data-lanes property\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	dsi->num_data_lanes =3D ret;
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_probe(struct platform_device *pdev) {
> > +	struct rzg2l_mipi_dsi *dsi;
> > +	int ret;
> > +
> > +	dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> > +	if (!dsi)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, dsi);
> > +	dsi->dev =3D &pdev->dev;
> > +
> > +	ret =3D rzg2l_mipi_dsi_parse_dt(dsi);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	dsi->mmio =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(dsi->mmio))
> > +		return PTR_ERR(dsi->mmio);
> > +
> > +	dsi->vclk =3D devm_clk_get(dsi->dev, "vclk");
> > +	if (IS_ERR(dsi->vclk))
> > +		return PTR_ERR(dsi->vclk);
> > +
> > +	dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");
> > +	if (IS_ERR(dsi->rstc))
> > +		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> > +				     "failed to get arst\n");
> > +
> > +	dsi->arstc =3D devm_reset_control_get_exclusive(dsi->dev, "arst");
> > +	if (IS_ERR(dsi->arstc))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(dsi->arstc),
> > +				     "failed to get arst\n");
> > +
> > +	dsi->prstc =3D devm_reset_control_get_exclusive(dsi->dev, "prst");
> > +	if (IS_ERR(dsi->prstc))
> > +		return dev_err_probe(dsi->dev, PTR_ERR(dsi->prstc),
> > +				     "failed to get prst\n");
> > +
> > +	pm_runtime_enable(dsi->dev);
> > +
> > +	/* Init host device */
> > +	dsi->host.dev =3D dsi->dev;
> > +	dsi->host.ops =3D &rzg2l_mipi_dsi_host_ops;
> > +	ret =3D mipi_dsi_host_register(&dsi->host);
> > +	if (ret < 0)
> > +		goto out_pm_get;
> > +
> > +	return 0;
>=20
> Missing blank line.

OK.

>=20
> > +out_pm_get:
> > +	pm_runtime_disable(dsi->dev);
> > +	return ret;
> > +}
> > +
> > +static int rzg2l_mipi_dsi_remove(struct platform_device *pdev) {
> > +	struct rzg2l_mipi_dsi *dsi =3D platform_get_drvdata(pdev);
> > +
> > +	mipi_dsi_host_unregister(&dsi->host);
> > +	pm_runtime_disable(&pdev->dev);
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> > +	{ .compatible =3D "renesas,rzg2l-mipi-dsi" },
> > +	{ /* sentinel */ }
> > +};
>=20
> MODULE_DEVICE_TABLE(of, rzg2l_mipi_dsi_of_table);
>=20
> > +
> > +static struct platform_driver rzg2l_mipi_dsi_platform_driver =3D {
> > +	.driver	=3D {
> > +		.name =3D "rzg2l-mipi-dsi",
> > +		.of_match_table =3D rzg2l_mipi_dsi_of_table,
> > +	},
> > +	.probe	=3D rzg2l_mipi_dsi_probe,
> > +	.remove	=3D rzg2l_mipi_dsi_remove,
> > +};
> > +
> > +module_platform_driver(rzg2l_mipi_dsi_platform_driver);
> > +
> > +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com");
> > +MODULE_DESCRIPTION("Renesas RZ/G2L MIPI DSI Encoder Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > new file mode 100644
> > index 000000000000..40c96330e79a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > @@ -0,0 +1,149 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * RZ/G2L MIPI DSI Interface Registers Definitions
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corporation  */
> > +
> > +#ifndef __RZG2L_MIPI_DSI_REGS_H__
> > +#define __RZG2L_MIPI_DSI_REGS_H__
>=20
> Please include linux/bits.h here to make this file self-contained.
OK.

>=20
> > +
> > +/* DPHY Registers */
> > +#define DSIDPHYCTRL0			0x00
> > +#define DSIDPHYCTRL0_CAL_EN_HSRX_OFS	BIT(16)
> > +#define DSIDPHYCTRL0_CMN_MASTER_EN	BIT(8)
> > +#define DSIDPHYCTRL0_RE_VDD_DETVCCQLV18	BIT(2)
> > +#define DSIDPHYCTRL0_EN_LDO1200		BIT(1)
> > +#define DSIDPHYCTRL0_EN_BGR		BIT(0)
> > +
> > +#define DSIDPHYTIM0			0x04
> > +#define DSIDPHYTIM0_TCLK_MISS(x)	((x) << 24)
> > +#define DSIDPHYTIM0_T_INIT(x)		((x) << 0)
> > +
> > +#define DSIDPHYTIM1			0x08
> > +#define DSIDPHYTIM1_THS_PREPARE(x)	((x) << 24)
> > +#define DSIDPHYTIM1_TCLK_PREPARE(x)	((x) << 16)
> > +#define DSIDPHYTIM1_THS_SETTLE(x)	((x) << 8)
> > +#define DSIDPHYTIM1_TCLK_SETTLE(x)	((x) << 0)
> > +
> > +#define DSIDPHYTIM2			0x0c
> > +#define DSIDPHYTIM2_TCLK_TRAIL(x)	((x) << 24)
> > +#define DSIDPHYTIM2_TCLK_POST(x)	((x) << 16)
> > +#define DSIDPHYTIM2_TCLK_PRE(x)		((x) << 8)
> > +#define DSIDPHYTIM2_TCLK_ZERO(x)	((x) << 0)
> > +
> > +#define DSIDPHYTIM3			0x10
> > +#define DSIDPHYTIM3_TLPX(x)		((x) << 24)
> > +#define DSIDPHYTIM3_THS_EXIT(x)		((x) << 16)
> > +#define DSIDPHYTIM3_THS_TRAIL(x)	((x) << 8)
> > +#define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
> > +
> > +/* --------------------------------------------------------*/
> > +/* Link Registers */
> > +#define LINK_REG_OFFSET			0x10000
> > +
> > +/* Link Status Register */
> > +#define LINKSR				0x10
> > +#define LINKSR_LPBUSY			BIT(13)
> > +#define LINKSR_HSBUSY			BIT(12)
> > +#define LINKSR_VICHRUN1			BIT(8)
> > +#define LINKSR_SQCHRUN1			BIT(4)
> > +#define LINKSR_SQCHRUN0			BIT(0)
> > +
> > +/* Tx Set Register */
> > +#define TXSETR				0x100
> > +#define TXSETR_NUMLANECAP		(0x3 << 16)
> > +#define TXSETR_DLEN			BIT(9)
> > +#define TXSETR_CLEN			BIT(8)
> > +#define TXSETR_NUMLANEUSE(x)		(((x) & 0x3) << 0)
> > +
> > +/* HS Clock Set Register */
> > +#define HSCLKSETR			0x104
> > +#define HSCLKSETR_HSCLKMODE_CONT	BIT(1)
> > +#define HSCLKSETR_HSCLKMODE_NON_CONT	(0 << 1)
>=20
> I would either drop the second macro, or write

Agreed.

>=20
> #define HSCLKSETR_HSCLKMODE_CONT	(1 << 1)
> #define HSCLKSETR_HSCLKMODE_NON_CONT	(0 << 1)
>=20
> if you don't want to handle it as a bit flag but a 1-bit field with a
> value. Same in multiple locations below.

Agreed.

>=20
> > +#define HSCLKSETR_HSCLKRUN_HS		BIT(0)
> > +#define HSCLKSETR_HSCLKRUN_LP		(0 << 0)
> > +
> > +/* Reset Control Register */
> > +#define RSTCR				0x110
> > +#define RSTCR_SWRST			BIT(0)
> > +#define RSTCR_FCETXSTP			BIT(16)
> > +
> > +/* Reset Status Register */
> > +#define RSTSR				0x114
> > +#define RSTSR_DL0DIR			BIT(15)
> > +#define RSTSR_DLSTPST			(0xf << 8)
> > +#define RSTSR_SWRSTV1			BIT(4)
> > +#define RSTSR_SWRSTIB			BIT(3)
> > +#define RSTSR_SWRSTAPB			BIT(2)
> > +#define RSTSR_SWRSTLP			BIT(1)
> > +#define RSTSR_SWRSTHS			BIT(0)
> > +
> > +/* Clock Lane Stop Time Set Register */
> > +#define CLSTPTSETR			0x314
> > +#define CLSTPTSETR_CLKKPT(x)		((x) << 24)
> > +#define CLSTPTSETR_CLKBFHT(x)		((x) << 16)
> > +#define CLSTPTSETR_CLKSTPT(x)		((x) << 2)
> > +
> > +/* LP Transition Time Set Register */
> > +#define LPTRNSTSETR			0x318
> > +#define LPTRNSTSETR_GOLPBKT(x)		((x) << 0)
> > +
> > +/* Physical Lane Status Register */
> > +#define PLSR				0x320
> > +#define PLSR_CLHS2LP			BIT(27)
> > +#define PLSR_CLLP2HS			BIT(26)
> > +
> > +/* Video-Input Channel 1 Set 0 Register */
> > +#define VICH1SET0R			0x400
> > +#define VICH1SET0R_VSEN			BIT(12)
> > +#define VICH1SET0R_HFPNOLP		BIT(10)
> > +#define VICH1SET0R_HBPNOLP		BIT(9)
> > +#define VICH1SET0R_HSANOLP		BIT(8)
> > +#define VICH1SET0R_VSTPAFT		BIT(1)
> > +#define VICH1SET0R_VSTART		BIT(0)
> > +
> > +/* Video-Input Channel 1 Set 1 Register */
> > +#define VICH1SET1R			0x404
> > +#define VICH1SET1R_DLY(x)		(((x) & 0xfff) << 2)
> > +
> > +/* Video-Input Channel 1 Status Register */
> > +#define VICH1SR				0x410
> > +#define VICH1SR_VIRDY			BIT(3)
> > +#define VICH1SR_RUNNING			BIT(2)
> > +#define VICH1SR_STOP			BIT(1)
> > +#define VICH1SR_START			BIT(0)
> > +
> > +/* Video-Input Channel 1 Pixel Packet Set Register */
> > +#define VICH1PPSETR			0x420
> > +#define VICH1PPSETR_DT_RGB18		(0x1e << 16)
> > +#define VICH1PPSETR_DT_RGB18_LS		(0x2e << 16)
> > +#define VICH1PPSETR_DT_RGB24		(0x3e << 16)
> > +#define VICH1PPSETR_TXESYNC_PULSE	BIT(15)
> > +#define VICH1PPSETR_VC(x)		((x) << 22)
> > +
> > +/* Video-Input Channel 1 Vertical Size Set Register */
> > +#define VICH1VSSETR			0x428
> > +#define VICH1VSSETR_VACTIVE(x)		(((x) & 0x7fff) << 16)
> > +#define VICH1VSSETR_VSPOL_LOW		BIT(15)
> > +#define VICH1VSSETR_VSPOL_HIGH		(0 << 15)
> > +#define VICH1VSSETR_VSA(x)		(((x) & 0xfff) << 0)
> > +
> > +/* Video-Input Channel 1 Vertical Porch Set Register */
> > +#define VICH1VPSETR			0x42C
>=20
> This is the only address written as an uppercase hex value.

OK, will fix this.

Cheers,
Biju

>=20
> > +#define VICH1VPSETR_VFP(x)		(((x) & 0x1fff) << 16)
> > +#define VICH1VPSETR_VBP(x)		(((x) & 0x1fff) << 0)
> > +
> > +/* Video-Input Channel 1 Horizontal Size Set Register */
> > +#define VICH1HSSETR			0x430
> > +#define VICH1HSSETR_HACTIVE(x)		(((x) & 0x7fff) << 16)
> > +#define VICH1HSSETR_HSPOL_LOW		BIT(15)
> > +#define VICH1HSSETR_HSPOL_HIGH		(0 << 15)
> > +#define VICH1HSSETR_HSA(x)		(((x) & 0xfff) << 0)
> > +
> > +/* Video-Input Channel 1 Horizontal Porch Set Register */
> > +#define VICH1HPSETR			0x434
> > +#define VICH1HPSETR_HFP(x)		(((x) & 0x1fff) << 16)
> > +#define VICH1HPSETR_HBP(x)		(((x) & 0x1fff) << 0)
> > +
> > +#endif /* __RZG2L_MIPI_DSI_REGS_H__ */
>=20
> --
> Regards,
>=20
> Laurent Pinchart
