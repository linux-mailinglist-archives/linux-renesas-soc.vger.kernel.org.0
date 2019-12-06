Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6342115429
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 16:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfLFPZw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 10:25:52 -0500
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:3808
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726268AbfLFPZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 10:25:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m71wPa5a3Z10W0p1tYR0rh1SohjY7/vibpHzQXLXQInCn3ai0XXnVjQsZ8ump6Zq5I+9oXZkRi44gI30xZZyeoimPZ1HwTchG6u7Asd+SlQH9pdUGMhxsrzFY77vgpkHt1p5ayZjWmD59J9lZlkkqqY9lKRBD8IvPQmWcZ3n7sJgRy530TUQpktCkQn2B+RsB7wsP+1UnSSXMjqUCXWrtbAHQZJ0i+VVxOyd7IejIuPPsbaYT5XEXJLcEUubAfBhsJ+pP9ezb6TtaxVZRUPJykObAErQ0aWOhf5e154wogXwLqBW4g8GgxHjPMgMfXl0Gphcdj9k8O1OjLUkzq+ljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwmJalBA45l1sMLj/E79Bt6pXorVXGECa6xnn7b9x6I=;
 b=dy0G+KVre9wOkV/UZiLoNBHbD581D0lQpIpNeVwvECbOYUliwMn7z5y9kX/X8bEGp2CBhqnEP7nxy1mFPDMoz51ptBU9NrRfBqvTVqaUAk2X41Sd8PjbopN6BvaOmNVnDgDx/ifc5RnqQnQkwGWF/nMzHoIylFpj8SIjSwpcybNy6b+oC3e+7SV5UEToUahq9nfAcT6dhAvjAMlyeYOZWhaFILA+ZCAOSvqV1VQHv9W7+G9Md+O9hvHnW395mEvcPt7RakHMGovslYBtRM25qOSWaUZiYRuhB7kPszpWIuWWnpsvsM2KTquDwh+XXkPcbg4EZKdoPFiOr2n5TVk1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwmJalBA45l1sMLj/E79Bt6pXorVXGECa6xnn7b9x6I=;
 b=mmoT+oltbnc6cpzla+xepSGsj+hIhvUkHfQyzVZM9OllMooaiQh+oa6tawi/gtTFCv0aaNcCyh2Wmmj41rPgdF2bvBMsXn0tcJ6icJ/TNWJZgxiSLR21fo7kYk30io7/vv4Hp+R0l85NSsQcStn9ZDJIF45/t8fMcV79JoZgH2w=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1739.jpnprd01.prod.outlook.com (52.133.163.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Fri, 6 Dec 2019 15:25:47 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2495.014; Fri, 6 Dec 2019
 15:25:47 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "sam@ravnborg.org" <sam@ravnborg.org>
Subject: RE: [PATCH v3 3/8] drm: Add bus timings helper
Thread-Topic: [PATCH v3 3/8] drm: Add bus timings helper
Thread-Index: AQHVXc+Y3hDaAH3FzUeScbXcTlar7KeAhtmAgAABDYCALU8E4A==
Date:   Fri, 6 Dec 2019 15:25:47 +0000
Message-ID: <TY1PR01MB1770CEC02DD2832E668EE88CC05F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107192621.GH24983@pendragon.ideasonboard.com>
 <20191107193007.GT23790@phenom.ffwll.local>
In-Reply-To: <20191107193007.GT23790@phenom.ffwll.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d068c3f6-89f8-4d0f-2c05-08d77a60919b
x-ms-traffictypediagnostic: TY1PR01MB1739:|TY1PR01MB1739:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1739E92945763AE4635BC573C05F0@TY1PR01MB1739.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:276;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(189003)(199004)(26005)(76116006)(52536014)(966005)(66946007)(64756008)(2906002)(7416002)(74316002)(66446008)(81166006)(30864003)(54906003)(305945005)(86362001)(33656002)(66556008)(478600001)(8936002)(55016002)(5660300002)(66476007)(53546011)(6506007)(229853002)(316002)(102836004)(81156014)(186003)(71190400001)(110136005)(8676002)(7696005)(4326008)(44832011)(76176011)(99286004)(71200400001)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1739;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rekcO9aZ+Ry4dePNTLlOX5ndPtcCr2YPiE3Dv37u924wl4KRUkznwj0VFaKdNgEXu7PxO6jcs/zRswNujHq3LH0wl3t7wsZrS4wH8dxcTxiiIntzDG02dilApYOESC0PZOtkxQXMfOoHj33bbElH/+hrOXckeROuVlJN35R2wcSDw5/OTSbfaANPx80AsJv+i1jf+J6L+KNBnGgD5m41VLwdyK1GEvlLm9q6yrCR51oNAMV/hinYowIUArjEDelr7J1j8Q5DvWIyNRprB3DLDvCnHii0iXE6GJsD+R8P8DaeTAeTMDbtG+mnfYE5pRxTL5OBRoy5UjhIrr3jCT7xESQIYXytq7RD8h2NAcsV2j0loBuqR9CL/ujZDV4DQBMi4UEOFPO6mI6RrgB8UXmJoyU4AvNPv0oVJORgO6qleUwZc3VZYQmZlSuuTnngk6CpjU2LbIikq0Q0JXRKa+Dfo/XnILrnIo0amEa+Qun9G7M=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d068c3f6-89f8-4d0f-2c05-08d77a60919b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 15:25:47.2690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m20H7GT4EWg7VJeP4P2pYqGSTAu2qBVjsEiYr0y3Wgmx3JrJyIjJ+FWpDYxlwdHf3SEO3Uh1v5n0Dbj/ct/5nxdy5TsfJfBS1NXnu6ubV1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1739
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

Thank you for your feedback!

> From: Daniel Vetter <daniel.vetter@ffwll.ch> On Behalf Of Daniel Vetter
> Sent: 07 November 2019 19:30
> Subject: Re: [PATCH v3 3/8] drm: Add bus timings helper
>=20
> On Thu, Nov 07, 2019 at 09:26:21PM +0200, Laurent Pinchart wrote:
> > Hi Fabrizio,
> >
> > Thank you for the patch.
> >
> > On Wed, Aug 28, 2019 at 07:36:37PM +0100, Fabrizio Castro wrote:
> > > Helper to provide bus timing information.
> >
> > You may want to expand this a bit. And actually fix it too, as the
> > helper you introduce isn't related to timings (same for the subject
> > line).
>=20
> Also the kerneldoc needs to be pulled into the templates under
> Documentation/gpu. And since it's just one function, why not put this int=
o
> drm_of.c? Gets rid of a pile of overhead.

Yeah, you are right, will try and pull this into drm_of.c in v4.

Thanks!

Fab

>=20
> >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > ---
> > > v2->v3:
> > > * new patch
> > > ---
> > >  drivers/gpu/drm/Makefile          |  3 +-
> > >  drivers/gpu/drm/drm_bus_timings.c | 97 +++++++++++++++++++++++++++++=
++++++++++
> > >  include/drm/drm_bus_timings.h     | 21 +++++++++
> > >  3 files changed, 120 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/gpu/drm/drm_bus_timings.c
> > >  create mode 100644 include/drm/drm_bus_timings.h
> > >
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index 9f0d2ee..a270063 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -17,7 +17,8 @@ drm-y       :=3D	drm_auth.o drm_cache.o \
> > >  		drm_plane.o drm_color_mgmt.o drm_print.o \
> > >  		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
> > >  		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
> > > -		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o
> > > +		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
> > > +		drm_bus_timings.o
> > >
> > >  drm-$(CONFIG_DRM_LEGACY) +=3D drm_legacy_misc.o drm_bufs.o drm_conte=
xt.o drm_dma.o drm_scatter.o drm_lock.o
> > >  drm-$(CONFIG_DRM_LIB_RANDOM) +=3D lib/drm_random.o
> > > diff --git a/drivers/gpu/drm/drm_bus_timings.c b/drivers/gpu/drm/drm_=
bus_timings.c
> > > new file mode 100644
> > > index 0000000..e2ecd22
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/drm_bus_timings.c
> > > @@ -0,0 +1,97 @@
> > > +// SPDX-License-Identifier: GPL-2.0
>=20
> DRM core is supposed to be MIT.
> -Daniel
>=20
> > > +#include <drm/drm_bus_timings.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/of.h>
> > > +#include <linux/types.h>
> > > +
> > > +#define DRM_OF_LVDS_ODD		1
> > > +#define DRM_OF_LVDS_EVEN	2
> > > +
> > > +static int drm_of_lvds_get_port_pixels_type(struct device_node *port=
_node)
> > > +{
> > > +	bool even_pixels, odd_pixels;
> > > +
> > > +	even_pixels =3D of_property_read_bool(port_node, "dual-lvds-even-pi=
xels");
> > > +	odd_pixels =3D of_property_read_bool(port_node, "dual-lvds-odd-pixe=
ls");
> > > +	return  even_pixels * DRM_OF_LVDS_EVEN + odd_pixels * DRM_OF_LVDS_O=
DD;
> >
> > s/  / /
> >
> > But I would make these bitflags.
> >
> > enum drm_of_lvds_pixels {
> > 	DRM_OF_LVDS_EVEN =3D BIT(0),
> > 	DRM_OF_LVDS_ODD =3D BIT(1),
> > };
> >
> > static int drm_of_lvds_get_port_pixels_type(struct device_node *port)
> > {
> > 	bool even_pixels =3D of_property_read_bool(port, "dual-lvds-even-pixel=
s");
> > 	bool odd_pixels =3D of_property_read_bool(port, "dual-lvds-odd-pixels"=
);
> >
> > 	return (even_pixels ? DRM_OF_LVDS_EVEN : 0) |
> > 	       (odd_pixels ? DRM_OF_LVDS_ODD : 0);
> > }
> >
> > > +}
> > > +
> > > +/**
> > > + * drm_of_lvds_get_dual_link_configuration - get the dual-LVDS confi=
guration
> >
> > Should we name this drm_of_lvds_get_dual_link_pixel_order to better
> > reflect its purpose ?
> >
> > > + * @p1: device tree node corresponding to the first port of the sour=
ce
> > > + * @p2: device tree node corresponding to the second port of the sou=
rce
> >
> > Maybe port1 and port2 to make this more explicit ?
> >
> > > + *
> > > + * An LVDS dual-link bus is made of two connections, even pixels tra=
nsit on one
> > > + * connection, and odd pixels transit on the other connection.
> >
> > To match the DT bindings documentation, I would recommand
> >
> > "An LVDS dual-link connection is made of two links, with even pixels
> > transitting on one link, and odd pixels on the other link."
> >
> > > + * This function walks the DT (from the source ports to the sink por=
ts) looking
> > > + * for a dual-LVDS bus. A dual-LVDS bus is identfied by markers foun=
d on the DT
> > > + * ports of the sink device(s). If such a bus is found, this functio=
n returns
> > > + * its configuration (either p1 connected to the even pixels port an=
d p2
> > > + * connected to the odd pixels port, or p1 connected to the odd pixe=
ls port and
> > > + * p2 connected to the even pixels port).
> >
> > "walking the DT" sounds like the function goes through the whole graph.
> > How about the following ?
> >
> > /**
> >  * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel ord=
er
> >  * @port1: First DT port node of the Dual-link LVDS source
> >  * @port2: Second DT port node of the Dual-link LVDS source
> >  *
> >  * An LVDS dual-link connection is made of two links, with even pixels
> >  * transitting on one link, and odd pixels on the other link. This func=
tion
> >  * returns, for two ports of an LVDS dual-link source, which port shall=
 transmit
> >  * the even and off pixels, based on the requirements of the connected =
sink.
> >  *
> >  * The pixel order is determined from the dual-lvds-even-pixels and
> >  * dual-lvds-odd-pixels properties in the sink's DT port nodes. If thos=
e
> >  * properties are not present, or if their usage is not valid, this fun=
ction
> >  * returns -EINVAL.
> >  *
> >  * @port1 and @port2 are typically DT sibling nodes, but may have diffe=
rent
> >  * parents when, for instance, two separate LVDS encoders carry the eve=
n and odd
> >  * pixels.
> >  *
> >  * Return:
> >  * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 carries even pixels an=
d @port2
> >  *   carries odd pixels
> >  * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 carries odd pixels and=
 @port1
> >  *   carries even pixels
> >  * * -EINVAL - @port1 and @port2 are not connected to a dual-link LVDS =
sink, or
> >  *   the sink configuration is invalid
> >  */
> >
> > We could also add -EPIPE as a return code for the case where port1 or
> > port2 are not connected.
> >
> > > + *
> > > + * Return: A code describing the bus configuration when a valid dual=
-LVDS bus is
> > > + * found, or an error code when no valid dual-LVDS bus is found
> > > + *
> > > + * Possible codes for the bus configuration are:
> > > + *
> > > + * - DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS: when p1 is connected to the=
 even pixels
> > > + *   port and p2 is connected to the odd pixels port
> > > + * - DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS: when p1 is connected to the=
 odd pixels
> > > + *   port and p2 is connected to the even pixels port
> > > + *
> > > + */
> > > +int drm_of_lvds_get_dual_link_configuration(const struct device_node=
 *p1,
> > > +					    const struct device_node *p2)
> > > +{
> > > +	struct device_node *remote_p1 =3D NULL, *remote_p2 =3D NULL;
> > > +	struct device_node *parent_p1 =3D NULL, *parent_p2 =3D NULL;
> >
> > There's no need to initialize those two variables.
> >
> > > +	struct device_node *ep1 =3D NULL, *ep2 =3D NULL;
> > > +	u32 reg_p1, reg_p2;
> > > +	int ret =3D -EINVAL, remote_p1_pt, remote_p2_pt;
> >
> > Please split this last line, as it otherwise hides the initialization o=
f
> > ret in the middle.
> >
> > > +
> > > +	if (!p1 || !p2)
> > > +		return ret;
> >
> > You can return -EINVAL directly.
> >
> >
> > > +	if (of_property_read_u32(p1, "reg", &reg_p1) ||
> > > +	    of_property_read_u32(p2, "reg", &reg_p2))
> > > +		return ret;
> >
> > Same here.
> >
> > > +	parent_p1 =3D of_get_parent(p1);
> > > +	parent_p2 =3D of_get_parent(p2);
> > > +	if (!parent_p1 || !parent_p2)
> > > +		goto done;
> > > +	ep1 =3D of_graph_get_endpoint_by_regs(parent_p1, reg_p1, 0);
> > > +	ep2 =3D of_graph_get_endpoint_by_regs(parent_p2, reg_p2, 0);
> > > +	if (!ep1 || !ep2)
> > > +		goto done;
> >
> > If you only support the first endpoint, this should be mentioned in the
> > documentation. Alternatively you could pass the endpoint nodes instead
> > of the port nodes, or you could pass the endpoint number.
> >
> > It's also a bit inefficient to use of_graph_get_endpoint_by_regs() when
> > you already have the port nodes. How about adding the following helper
> > function ?
> >
> > struct device_node *of_graph_get_port_endpoint(struct device_node *port=
, int reg)
> > {
> > 	struct device_node *endpoint =3D NULL;
> >
> > 	for_each_child_of_node(port, endpoint) {
> > 		u32 id;
> >
> > 		if (!of_node_name_eq(endpoint, "endpoint") ||
> > 			continue;
> >
> > 		if (reg =3D=3D -1)
> > 			return endpoint;
> >
> > 		if (of_property_read_u32(node, "reg", &id) < 0)
> > 			continue;
> >
> > 		if (reg =3D=3D id)
> > 			return endpoint;
> > 	}
> >
> > 	return NULL;
> > }
> >
> > If you're concerned that adding a core helper would delay this patch
> > series, you could add it as a local helper, and move it to of_graph.h i=
n
> > a second step.
> >
> > > +	remote_p1 =3D of_graph_get_remote_port(ep1);
> > > +	remote_p2 =3D of_graph_get_remote_port(ep2);
> > > +	if (!remote_p1 || !remote_p2)
> > > +		goto done;
> > > +	remote_p1_pt =3D drm_of_lvds_get_port_pixels_type(remote_p1);
> > > +	remote_p2_pt =3D drm_of_lvds_get_port_pixels_type(remote_p2);
> > > +	/*
> > > +	 * A valid dual-lVDS bus is found when one remote port is marked wi=
th
> > > +	 * "dual-lvds-even-pixels", and the other remote port is marked wit=
h
> > > +	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
> > > +	 */
> > > +	if (!remote_p1_pt || !remote_p2_pt ||
> > > +	    remote_p1_pt + remote_p2_pt !=3D DRM_OF_LVDS_EVEN + DRM_OF_LVDS=
_ODD)
> > > +		goto done;
> > > +	if (remote_p1_pt =3D=3D DRM_OF_LVDS_EVEN)
> > > +		/* The sink expects even pixels through the first port */
> > > +		ret =3D DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS;
> > > +	else
> > > +		/* The sink expects odd pixels through the first port */
> > > +		ret =3D DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
> > > +
> > > +done:
> > > +	of_node_put(ep1);
> > > +	of_node_put(ep2);
> > > +	of_node_put(parent_p1);
> > > +	of_node_put(parent_p2);
> > > +	of_node_put(remote_p1);
> > > +	of_node_put(remote_p2);
> > > +	return ret;
> >
> > This is heavy, I would add blank lines to make the code easier to read.
> >
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_configuration);
> > > diff --git a/include/drm/drm_bus_timings.h b/include/drm/drm_bus_timi=
ngs.h
> > > new file mode 100644
> > > index 0000000..db8a385
> > > --- /dev/null
> > > +++ b/include/drm/drm_bus_timings.h
> > > @@ -0,0 +1,21 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef __DRM_BUS_TIMINGS__
> > > +#define __DRM_BUS_TIMINGS__
> > > +
> > > +struct device_node;
> > > +
> > > +#define DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS	0
> > > +#define DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS	1
> >
> > These should be documented with kerneldoc. How about also turning them
> > into an enum ?
> >
> > > +
> > > +#ifdef CONFIG_OF
> > > +int drm_of_lvds_get_dual_link_configuration(const struct device_node=
 *p1,
> > > +					    const struct device_node *p2);
> > > +#else
> > > +int drm_of_lvds_get_dual_link_configuration(const struct device_node=
 *p1,
> > > +					    const struct device_node *p2)
> > > +{
> > > +	return -EINVAL;
> > > +}
> > > +#endif
> > > +
> > > +#endif /* __DRM_BUS_TIMINGS__ */
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
