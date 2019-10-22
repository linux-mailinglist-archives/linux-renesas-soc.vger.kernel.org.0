Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDD0E08E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2019 18:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387528AbfJVQaM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Oct 2019 12:30:12 -0400
Received: from mail-eopbgr1400134.outbound.protection.outlook.com ([40.107.140.134]:20793
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731132AbfJVQaM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Oct 2019 12:30:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5iWWxOZhYXbLDXdQPRstLSFk6xGJ4Gd8ggGIaYUWSUZhKsgTm2IDYaB4ZgHKSUCNUQXV3pS+yAazJq/WDbX0pVhQSmxvEhmfCUCrCr2puPil3RQh3wM3hliTt0gMt8W7etDegAPL16APOy0ElbMeYKcQ6oaWbPgWZ4RbR7wfbb2/fvOL9kEebSeURuCqws9W7SUVaOZ885Y0/WZMU+xO6THYzF77wV50zpxapsJvx4YJn3xPBGj7kNWFG+wGXNK2Zq4Xxx3tE2F4qs35Yl0c1NEU7I107dMwWVQJT90JrTD6hCRzH93ck3SU5TaEd+A9UX1AiwAnvdLF/sLmQLpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Waue0A9MGOm7F/zoIK/lL9zhB3dxD6Xl2alNYMmy9T8=;
 b=P5MGic66UrAGortAso8vS4M/6zu0pGv+wW8wu5gj6QhhrxgXdqX+ZM1BYrF9OJDES63WJL5W2gyTNaNn6Vo2kFk1QNoeZcI+hDN192X5mH5fMwuLl5+eBkSg6eHp2L7q1dgxCPDYoqV11pRdzsHV++xkn58h8fjp306DJGI8yC1Z0LXTQ5pww8SrC28+7CgLn/kOMaJjWKP1Kgzzw54RiEqs4tmUEoRW9ffxIYr/4jyHjzfx5YQeCueNB9DCz79Ux3mQP3ZGs55v15GSYm3y/LS7xPe4sqy5bO4jjqxU//MaOV0jBST9AsK5LWJU8pgxLR2jz/O/rZq7hA1V1VpAkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Waue0A9MGOm7F/zoIK/lL9zhB3dxD6Xl2alNYMmy9T8=;
 b=p+n5bMtqXGZa1OdaPgmWI1/fnqWrWbPOv7kabZpP/MEdx2DUKMhw6r1AD/n5YNnyS+LmckEkUDypdxEiVj82Iar3XAA0re8eTNhX026UW6kHa4YHgocJRHB5NYvKYWtjEzAgkZOxudd5sux6jsfxQ7sgOdsTZtNZpkDsM/cb/vI=
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.167.146) by
 TYXPR01MB1757.jpnprd01.prod.outlook.com (52.133.165.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 16:30:07 +0000
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::58ec:b6c:485e:19e0]) by TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::58ec:b6c:485e:19e0%7]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 16:30:07 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
CC:     Sam Ravnborg <sam@ravnborg.org>, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: RE: [PATCH v3 0/8] Add dual-LVDS panel support to EK874
Thread-Topic: [PATCH v3 0/8] Add dual-LVDS panel support to EK874
Thread-Index: AQHVXc+RlrcIOAtYlU6wFCg32X69c6dnL44Q
Date:   Tue, 22 Oct 2019 16:30:07 +0000
Message-ID: <TYXPR01MB17753318ECA1556FE53C262AC0680@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c9e063f8-f893-4ee1-4bb0-08d7570d19be
x-ms-traffictypediagnostic: TYXPR01MB1757:|TYXPR01MB1757:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB1757F605A685CE598F123F67C0680@TYXPR01MB1757.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(199004)(189003)(74316002)(2906002)(7736002)(7696005)(86362001)(6506007)(102836004)(25786009)(305945005)(6436002)(76116006)(66476007)(11346002)(6306002)(7416002)(9686003)(229853002)(53546011)(71190400001)(54906003)(66556008)(99286004)(64756008)(66446008)(76176011)(66946007)(6916009)(55016002)(966005)(6116002)(3846002)(14454004)(316002)(26005)(6246003)(256004)(71200400001)(5660300002)(14444005)(33656002)(44832011)(66066001)(186003)(4326008)(8676002)(52536014)(81166006)(81156014)(8936002)(446003)(486006)(476003)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1757;H:TYXPR01MB1775.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fCCyJDt/bkjqo+vBrSJXMRMWN26JsyuWa0BP0oVVrZEzUvBH4zrpdTzXftTnZl+5PFhrejsWPJP2NajkMefNBy67yXHuhytSsfW7fGcb6v2BHOCvQN5NDIHBZMz76D5I/kO0yYyiv6LVMap9HbPfjFpl9Vo5hlnr3gHEZfMTmQNtjrIMj3P90v6eSQY/Mq+2vtz/A3QtafxGmr2kJzvBbXOwrjLOLmYl0oAPtIQCzOd9/dagEpSf2qqNC9be8NLdf0FpUDxxBp0Y8VA5cqHzfHCK3v0mBZfp3RuULcjBNyKJtQ0+r+JtKflTHQK23cNLSTNq3rsTdu1vkFJpdbYY+pakY1dc4NOHIumVFUKUb/UTUZrj+2q4Zdumd7bwAJfbTpGOiKXHlU3zUxZploeydvwfdpSZTbDh6ygWtSWYjlELNV0IUVx8XoqauxO4S9iXSdFd03yL6NV4o5HlEpOgJB0m8gezdhm7aZ68fh0oM0s=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e063f8-f893-4ee1-4bb0-08d7570d19be
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 16:30:07.2208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbwPj9MMuvp6h2vYg52urkCJKMb/Bih2eblLHRcGmFlXlz3l+PLEup7CGeFhV+Z9EHNiNAP6n+epqwBrLLay29rkDvByj9SdzEgWkVO7lSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1757
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Did you have any time to look into this series?

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 28 August 2019 19:37
> Subject: [PATCH v3 0/8] Add dual-LVDS panel support to EK874
>=20
> Dear All,
>=20
> this series adds support for dual-LVDS panel IDK-2121WR
> from Advantech:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model=
-IDK-2121WR-K2FHA2E.htm
>=20
> V3 approaches the problem in a completely different way, we now
> have two new properties to mark the ports in the DT as receiving
> even pixels and odd pixels: dual-lvds-even-pixels and dual-lvds-odd-pixel=
s,
> which means device drivers should not use bridge specific or panel
> specific dual_link flags. Also, in this case the DT describes the
> connection fully.
>=20
> In order for the solution to be generic, I have exported a new helper
> (drm_of_lvds_get_dual_link_configuration) to walk the device tree,
> and figure out if the connection is dual-LVDS. The same helper gives
> information about the configuration of the connection. If Px is connected
> to a port expecting even pixels and Py is connected to a port expecting
> odd pixels, then the helper returns DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS
> (like in the example below), otherwise it returns
> DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS.
>=20
>=20
>  --------            dual-lvds-even-pixels  --------
> |        |----                         ----|        |
> |        | Px |---------------------->| Pn |        |
> |        |----                         ----|        |
> | SOURCE |           dual-lvds-odd-pixels  |  SINK  |
> |        |----                         ----|        |
> |        | Py |---------------------->| Pm |        |
> |        |----                         ----|        |
>  --------                                   --------
>=20
> The device driver for the encoder then will work out if with the current
> wiring the pixels need swapping or not.
>=20
> The same solution works for both panels and bridges.
>=20
> Since the DT describes the connection fully, driver
> drivers/gpu/drm/panel/panel-lvds.c works out-of-the-box, no changes
> required, however, this implementation opens up a problem with the
> dt-bindings.
> Driver drivers/gpu/drm/panel/panel-lvds.c can still be pleased by
> a port node, but also by a ports node.
> I have created Documentation/devicetree/bindings/display/bus-timings/lvds=
.yaml
> with the idea of including it from panels and bridges dt-bindings
> supporting dual-LVDS (and of course the dt-bindings for the specific
> devices should say which port should be marked as what), but file
> Documentation/devicetree/bindings/display/panel/lvds.yaml formally
> requires property "port", while with this implementation it should requir=
e
> OneOf "port" and "ports", and unfortunately I can't seem to find a neat w=
ay
> aroud that, other than creating a new compatible string
> (e.g. "panel-dual-lvds"), a new dt-binding document for it, and of course=
 adding
> support for the new compatible string to drivers/gpu/drm/panel/panel-lvds=
.c.
> As a result, this series is missing (at least) a patch necessary to fully
> document the new implementation within
> Documentation/devicetree/bindings/display/panel/lvds.yaml
>=20
> Rob, do you have any suggestions? Do you think this idea works ok from a
> documentation point of view? By the way, I don't really know what I am do=
ing
> with the yaml dt-bindings, I hope you won't be horrified by this series :=
-P
>=20
> I hope I was able to deliver the concept clearly, if not please just ask.
>=20
> Comments are very much appreciated.
>=20
> Thanks,
> Fab
>=20
> Fabrizio Castro (8):
>   dt-bindings: display: Add bindings for LVDS bus-timings
>   dt-bindings: display: Add idk-2121wr binding
>   drm: Add bus timings helper
>   drm: rcar-du: lvds: Add dual-LVDS panels support
>   drm: bridge: thc63: Do not report input bus mode through bridge
>     timings
>   arm64: dts: renesas: Add EK874 board with idk-2121wr display support
>   [HACK] arm64: dts: renesas: draak: Enable LVDS
>   [HACK] arm64: dts: renesas: draak: Enable LVDS dual-link operation
>=20
>  .../bindings/display/bus-timings/lvds.yaml         |  38 +++++++
>  .../display/panel/advantech,idk-2121wr.yaml        |  90 +++++++++++++++=
+
>  arch/arm64/boot/dts/renesas/Makefile               |   3 +-
>  .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 116 +++++++++++++++=
++++++
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  21 +++-
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |  26 +++--
>  drivers/gpu/drm/Makefile                           |   3 +-
>  drivers/gpu/drm/bridge/thc63lvd1024.c              |   9 +-
>  drivers/gpu/drm/drm_bus_timings.c                  |  97 +++++++++++++++=
++
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                | 110 +++++++++++----=
----
>  include/drm/drm_bridge.h                           |   8 --
>  include/drm/drm_bus_timings.h                      |  21 ++++
>  12 files changed, 473 insertions(+), 69 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bus-timings=
/lvds.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advan=
tech,idk-2121wr.yaml
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr=
.dts
>  create mode 100644 drivers/gpu/drm/drm_bus_timings.c
>  create mode 100644 include/drm/drm_bus_timings.h
>=20
> --
> 2.7.4

