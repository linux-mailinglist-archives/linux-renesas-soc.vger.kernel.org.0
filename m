Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0F7D8EEA1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 16:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731328AbfHOOsx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 10:48:53 -0400
Received: from mail-eopbgr1410135.outbound.protection.outlook.com ([40.107.141.135]:35872
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729924AbfHOOsx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 10:48:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFBVLTiC57i2cZ2mi1a/vVsK9+ttjxiX7s9Hfs2TOAS5wdg2V3P997a81rDO7AUAdSdewiboqZITpv6rGegJ7wvsGdv7xA7sQZNjC5KjycfiI2UAmgEWGmDkIEvXGLps4lsqAFbcbfQoZnKniUZPbYQJgf6C2QIURoyZDSe7w1AE+mkeCI1W7sp6EsTmHmrVuSAmIp/VtdA9MTCYbvt8/0qhmsn0u57SvksURRtBJr+tQvGXc9RZ03avS1FWxwXJOMDMaYPAWbBoO9jRVlmYF6Z1qZ61gYk+lWWQraMSOa2oMZ9YUdLzq63EfCrHxxByYNJ4RF/KzQ9P9u3wfW2MfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CKa283XFH7H0pkzPzqX0STiEG098bbKjFleO15yBW4=;
 b=WqBJTOJ4NGomScO0BgyyH07izO3SFAVHJpapCTzzVeTT8Wg/wsM5wYhlKlZuM7nzoxFviAnLcg9ddbETRRKC+MCHA/am91KOJS7bfNCBYc2JJ4bFX+CAzBeCPWi6dIRV3eJG0WtpAjyFuNAmv7f122pOLb/uu0MUG3FmqcKlBrMcyYtc1lfU+MaNx4kBdMpjC5rbBDzxbRJa0F+vr2JRXOApPyAKlGmjZxorgtvjwGj87BZjZsQFRv4ndzeDYMPBTGGZUBjJqIVHX4D+xDXXEAmb53pBNAhAS9Zd1nRo0teTwOwfydGfamNkUoKXcXlzKNWIDFfkA+B9MSdec/GNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CKa283XFH7H0pkzPzqX0STiEG098bbKjFleO15yBW4=;
 b=p1FY8eN2PsZCvLYG4hVDv17VnlCmCd8YydJ+k/VSGp0WqXl3fnWblle5jtQi2evJiO7UZpG78hBeqM7QFL39L88kFstq400JMbZQp6rTGduXDTMSxP2sS2SnZMQTTp0YbvsLZRf1uh3yRoHPcdSppmUeSUk/R39ncYUdxRCdna8=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1882.jpnprd01.prod.outlook.com (52.133.162.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 15 Aug 2019 14:48:37 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 14:48:32 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Sam Ravnborg <sam@ravnborg.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: RE: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Thread-Topic: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Thread-Index: AQHVU1lR1gJ71LUS4EifTwZDwmXYxab8QI+AgAAFtUA=
Date:   Thu, 15 Aug 2019 14:48:32 +0000
Message-ID: <TY1PR01MB1770D35FF55C2905191426D5C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815141337.GA2437@ravnborg.org>
In-Reply-To: <20190815141337.GA2437@ravnborg.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71454eb6-ba8f-4d7d-4502-08d7218fa4bc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1882;
x-ms-traffictypediagnostic: TY1PR01MB1882:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB18828AC9FE01A128138896EBC0AC0@TY1PR01MB1882.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(199004)(189003)(76116006)(76176011)(7696005)(66446008)(64756008)(66556008)(66476007)(66946007)(316002)(229853002)(6436002)(55016002)(9686003)(6506007)(53546011)(52536014)(71200400001)(71190400001)(102836004)(446003)(486006)(25786009)(11346002)(476003)(44832011)(256004)(5024004)(99286004)(54906003)(186003)(26005)(5660300002)(53936002)(14454004)(7416002)(6916009)(478600001)(4326008)(6246003)(33656002)(86362001)(74316002)(7736002)(305945005)(6116002)(66066001)(2906002)(3846002)(81166006)(81156014)(8676002)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1882;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BHW+ssW3UmCahKljyL1PExP5qMSv2bTk/fwqrchkcio6wIsbsldftwAjCbGV5Si9Ect3RrcsZ1P8Mk7GriOc/VzPy43mQgsg3SWFZZMn60oXxh1GSPLZw45yhJ+ZJqLLLnpt70LHZztjVmTSkQFDlhFJBEgu/clSLb1uAmSrfYc/5pa9ozXOxgCQXmAbRzDK9cXuJbiXn7tmqyj8S3FWxAkrcGiA0PvMhar13rAwjNzVmenNsCfXRn8odl2ZsP+UxWx2DEIQYZNAWlO+YXT1bQ25l3221qM1OaeX3vIJxPUnJs5kgQI0xxLM3LhBp8Mt+YsiAfU+ETAz/hTU5qqLnZqfGOo5ZAA1d/JHgGRbJPGM238kD834Nt02pCAknlDoICbE6qzkCG6EVmLIzcwhoG0U0U6XkHe5hQLGb+Rijdc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71454eb6-ba8f-4d7d-4502-08d7218fa4bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 14:48:32.2547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sIm0YenKzU2zpDYLh8qCbY+kcmcYHgnWtQgQ5tiDU8LKSLtDuFbUSJM5+BP6/zMsd3wcqN9YFChdLpuWwUxdk3QDGB+/EuKw9rqgV2TBeHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1882
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for your feedback!

> From: Sam Ravnborg <sam@ravnborg.org>
> Sent: 15 August 2019 15:14
> Subject: Re: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
>=20
> Hi Fabrizio
>=20
> On Thu, Aug 15, 2019 at 12:04:29PM +0100, Fabrizio Castro wrote:
> > We need to know if the panel supports dual-link, similarly
> > to bridges, therefore add a reference to drm_timings in
> > drm_panel.
>=20
> Why do we need to know this?

The encoders connected to a dual-LVDS panels may need to do special
arrangements for the dual-link setup, like initializing a companion
encoder, and working out which pixels (even or odd) to send to which
port (first LVDS input port or second LVDS input port). At least, this is
within the scope of the implementation of this series, which is currently
being discussed.

> Why is it needed in drm_panel and not in some driver specific struct?

The other fields are still applicable to panels, so I think it makes sense=
=20
for this to be included in struct drm_panels.=20

>=20
> I cannot see the full series, as I was copied only on some mails.
> Awaiting dri-devel moderator before I can see the rest.

I am sorry about this, some people don't want to be bothered by the whole
thing, I'll make sure I add you to the recipients list for the next iterati=
ons
of this series.

Thanks,
Fab

>=20
> 	Sam
>=20
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > ---
> > v1->v2:
> > * new patch
> >
> >  include/drm/drm_panel.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > index 8c738c0..cd6ff07 100644
> > --- a/include/drm/drm_panel.h
> > +++ b/include/drm/drm_panel.h
> > @@ -26,6 +26,7 @@
> >
> >  #include <linux/errno.h>
> >  #include <linux/list.h>
> > +#include <drm/drm_timings.h>
> >
> >  struct device_node;
> >  struct drm_connector;
> > @@ -81,6 +82,7 @@ struct drm_panel_funcs {
> >   * struct drm_panel - DRM panel object
> >   * @drm: DRM device owning the panel
> >   * @connector: DRM connector that the panel is attached to
> > + * @timings: timing information
> >   * @dev: parent device of the panel
> >   * @link: link from panel device (supplier) to DRM device (consumer)
> >   * @funcs: operations that can be performed on the panel
> > @@ -89,6 +91,7 @@ struct drm_panel_funcs {
> >  struct drm_panel {
> >  	struct drm_device *drm;
> >  	struct drm_connector *connector;
> > +	const struct drm_timings *timings;
> >  	struct device *dev;
> >
> >  	const struct drm_panel_funcs *funcs;
> > --
> > 2.7.4
