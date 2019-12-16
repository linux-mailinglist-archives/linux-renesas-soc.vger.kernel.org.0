Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B83D81211F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfLPRkB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:40:01 -0500
Received: from mail-eopbgr1410131.outbound.protection.outlook.com ([40.107.141.131]:30992
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726263AbfLPRkA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:40:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnoHhTXeUbxK2NcxWOjKHsFYBGJJPdZktdxk96UmLYvbcyNQwWvurm7di04bJUityodr3bL1rpTa03z6a0Ms7ZKPXALNpZ+qPFiFPIxEk3SUfS97iTrB+EXbc4MUtW7ozN30KTvvdjEK4RHMATTRWmTj2Rv7Mv1ag0eWzAPOgluSOcOUZQPL/gZjnGHbVzP4GVIBatmAuLzuDPDwyhRRp7DmhJIntxJwbFTzD/IjoUMwhxFiVsK48zfu0IJZuY9pNDOwccwYighW662nPjonFWlKuq8+iilq3/6brTGvD1xAQBVbn/pXrkenEY9X1YMzr6v6+0XGZqQ6Mx4LYU9r9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAqBReP6zvOwiS491+E5NbwZaBGcd1EPtd7r3min2Yc=;
 b=RD2U257dKJFg2Dy6PFJCJVuHCye+k/bPlepohZU2P08ZhEg490R8VkfBD060kJAmFzVvFB9GcXT2DZfksvR45sGgelRuAvAylDhF+bT+gAZy3UG/1yfaAMz1/6ydI6Za3MFIlet25kY+528rMdMMl4UYWe8lkpJ0BETssU3sT87f6xDTU8cR64irXZPJL30c2qw6EhjFPb9jUhch/2G3K2K6WJO9s0Dir/sK4WQ/CzDs8YfWvxwaQLmHteEesjhKZkTaqVEwc0ovGAOjjTX20WdVhq/JzmU+CIBGkjVcak33TRz/gS9wvvvcVtjPoX6x6NxN4KQDcbdtE06eaPNSqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAqBReP6zvOwiS491+E5NbwZaBGcd1EPtd7r3min2Yc=;
 b=IAPPbKFaM72dGmkvxCFhuN4A4FlgjimU8ELl3jP2fQkOUZIzjHrUJfhmiCmB4/9qD1/vSxfBMqr5AiMTl542lui/ZOLX31ex7XdSCQ1wJ6qF6CUsSBnJVD9iWugxvrjizzoQhPRHBPRjUkkvgjfaF2W+xW372Hr2mc+3VOa7eN0=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1834.jpnprd01.prod.outlook.com (52.133.164.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Mon, 16 Dec 2019 17:39:55 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 17:39:55 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: RE: [PATCH v2] drm: rcar-du: lvds: Get mode from state
Thread-Topic: [PATCH v2] drm: rcar-du: lvds: Get mode from state
Thread-Index: AQHVseMQmXx5CMUza0qj5zlF2goIXKe8/k/w
Date:   Mon, 16 Dec 2019 17:39:55 +0000
Message-ID: <TY1PR01MB1770A0A708F35405E76869E6C0510@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20191213182742.24348-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20191213182742.24348-1-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aec030e3-6a05-4007-5142-08d7824ef6ca
x-ms-traffictypediagnostic: TY1PR01MB1834:
x-microsoft-antispam-prvs: <TY1PR01MB183477A5F5BD84C27B8212D9C0510@TY1PR01MB1834.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(199004)(189003)(2906002)(44832011)(478600001)(966005)(33656002)(110136005)(54906003)(8936002)(8676002)(52536014)(81156014)(81166006)(53546011)(6506007)(5660300002)(186003)(26005)(4326008)(64756008)(66556008)(66446008)(66946007)(66476007)(76116006)(9686003)(55016002)(86362001)(71200400001)(7696005)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1834;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OzUepkYEIrv4T/LyVN3+KFKq3xNDyDFm9uvmScDU5ep2YFhs+9XQUTgYswBEuBlwn2zYIID4xfc2klaqvcvYjMJFandm2kzqAjA6KR0XW8kMGQPsqFBWyeCpD38j9CM4h4sYmocWCa8jW3oBYIDA3qr+9SsdFErSPvG+5wb7iiUI84we7nV1MDDjEx2AAkV9e7T0wpSd3xWUbK3B4uBQ1YaHhG/VWB9/EsEkkyOHew3lAVXHb8JUH/9/jAI7vvxGqsk/TDJEG2u6uhzvUbRuTMq+YVYNE4UnpU9X36S43WCk0kvFpvi39fSVMGQvon32C8IP7OEAPoD+fXwFZ3qY+NqaCkgoFItc4KOD4JE77aQKHDqpMHMgdAzidO3X5nRxmD5iFoZUNvVLknlLuuQEgLFk8Uya3Y9g/IKh0LqeWFmOWPmWcwvnQOYIJ8+JU9UvMDCAuknvTH72+/PINPFPvNRjOwfo+5bmyfmnCAcK0W4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec030e3-6a05-4007-5142-08d7824ef6ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 17:39:55.4039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +cUB0gDhSLhHOlVw7GCrhVGNiVOFaDfIBPTmt0FuTuaSZdlOwnnKVQWmewDFqa5mzqAgSQgPxwAZNo4Z/xSibxEKjkOua45XRUEdqDuWyyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1834
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thank you for your patch!

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vg=
er.kernel.org> On Behalf Of Laurent Pinchart
> Sent: 13 December 2019 18:28
> Subject: [PATCH v2] drm: rcar-du: lvds: Get mode from state
>=20
> The R-Car LVDS encoder driver implements the bridge .mode_set()
> operation for the sole purpose of storing the mode in the LVDS private
> data, to be used later when enabling the encoder.
>=20
> Switch to the bridge .atomic_enable() and .atomic_disable() operations
> in order to access the global atomic state, and get the mode from the
> state instead. Remove both the unneeded .mode_set() operation and the
> display_mode and mode fields storing state data from the rcar_lvds
> private structure.
>=20
> As a side effect we get the CRTC from the state, replace the CRTC
> pointer retrieved through the bridge's encoder that shouldn't be used by
> atomic drivers.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
> Changes since v1:
>=20
> - Call .atomic_enable() on the companion
> - Set companion->encoder in .attach()
>=20
> The patch has been tested on the Draak board with the HDMI output in
> LVDS dual-link mode, and on the Salvator-XS board with the HDMI, VGA and
> LVDS outputs in single-link mode.
>=20
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 158 +++++++++++++++-------------
>  1 file changed, 85 insertions(+), 73 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-d=
u/rcar_lvds.c
> index 8c6c172bbf2e..c550bfd59e71 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -65,9 +65,6 @@ struct rcar_lvds {
>  		struct clk *dotclkin[2];	/* External DU clocks */
>  	} clocks;
>=20
> -	struct drm_display_mode display_mode;
> -	enum rcar_lvds_mode mode;
> -
>  	struct drm_bridge *companion;
>  	bool dual_link;
>  };
> @@ -402,10 +399,51 @@ EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
>   * Bridge
>   */
>=20
> -static void rcar_lvds_enable(struct drm_bridge *bridge)
> +static enum rcar_lvds_mode rcar_lvds_get_lvds_mode(struct rcar_lvds *lvd=
s,
> +					const struct drm_connector *connector)
> +{
> +	const struct drm_display_info *info;
> +	enum rcar_lvds_mode mode;
> +
> +	/*
> +	 * There is no API yet to retrieve LVDS mode from a bridge, only panels
> +	 * are supported.
> +	 */
> +	if (!lvds->panel)
> +		return RCAR_LVDS_MODE_JEIDA;
> +
> +	info =3D &connector->display_info;
> +	if (!info->num_bus_formats || !info->bus_formats) {
> +		dev_err(lvds->dev, "no LVDS bus format reported\n");

dev_warn perhaps?

Also, how about:
s/no LVDS bus format reported/no LVDS bus format reported, using JEIDA/
or something along those lines?

> +		return RCAR_LVDS_MODE_JEIDA;
> +	}
> +
> +	switch (info->bus_formats[0]) {
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:

Shall we take the below into account here?
https://lwn.net/Articles/794944/

> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		mode =3D RCAR_LVDS_MODE_JEIDA;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		mode =3D RCAR_LVDS_MODE_VESA;
> +		break;
> +	default:
> +		dev_err(lvds->dev, "unsupported LVDS bus format 0x%04x\n",
> +			info->bus_formats[0]);

dev_warn perhaps?

Also, how about:
s/unsupported LVDS bus format 0x%04x/unsupported LVDS bus format 0x%04x, us=
ing JEIDA/
or something along those lines?

> +		return RCAR_LVDS_MODE_JEIDA;
> +	}
> +
> +	if (info->bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> +		mode |=3D RCAR_LVDS_MODE_MIRROR;
> +
> +	return mode;
> +}
> +
> +static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
> +				    struct drm_atomic_state *state)
>  {
>  	struct rcar_lvds *lvds =3D bridge_to_rcar_lvds(bridge);
> -	const struct drm_display_mode *mode =3D &lvds->display_mode;
> +	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
>  	u32 lvdhcr;
>  	u32 lvdcr0;
>  	int ret;
> @@ -414,9 +452,14 @@ static void rcar_lvds_enable(struct drm_bridge *brid=
ge)
>  	if (ret < 0)
>  		return;
>=20
> +	/* Retrieve the connector and CRTC through the atomic state. */
> +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> +
>  	/* Enable the companion LVDS encoder in dual-link mode. */
>  	if (lvds->dual_link && lvds->companion)
> -		lvds->companion->funcs->enable(lvds->companion);
> +		lvds->companion->funcs->atomic_enable(lvds->companion, state);
>=20
>  	/*
>  	 * Hardcode the channels and control signals routing for now.
> @@ -452,18 +495,20 @@ static void rcar_lvds_enable(struct drm_bridge *bri=
dge)
>  	 * PLL clock configuration on all instances but the companion in
>  	 * dual-link mode.
>  	 */
> -	if (!lvds->dual_link || lvds->companion)
> +	if (!lvds->dual_link || lvds->companion) {
> +		const struct drm_crtc_state *crtc_state =3D
> +			drm_atomic_get_new_crtc_state(state, crtc);
> +		const struct drm_display_mode *mode =3D
> +			&crtc_state->adjusted_mode;
> +
>  		lvds->info->pll_setup(lvds, mode->clock * 1000);
> +	}
>=20
>  	/* Set the LVDS mode and select the input. */
> -	lvdcr0 =3D lvds->mode << LVDCR0_LVMD_SHIFT;
> +	lvdcr0 =3D rcar_lvds_get_lvds_mode(lvds, connector) << LVDCR0_LVMD_SHIF=
T;
>=20
>  	if (lvds->bridge.encoder) {
> -		/*
> -		 * FIXME: We should really retrieve the CRTC through the state,
> -		 * but how do we get a state pointer?
> -		 */
> -		if (drm_crtc_index(lvds->bridge.encoder->crtc) =3D=3D 2)
> +		if (drm_crtc_index(crtc) =3D=3D 2)
>  			lvdcr0 |=3D LVDCR0_DUSEL;
>  	}
>=20
> @@ -520,7 +565,8 @@ static void rcar_lvds_enable(struct drm_bridge *bridg=
e)
>  	}
>  }
>=20
> -static void rcar_lvds_disable(struct drm_bridge *bridge)
> +static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
> +				     struct drm_atomic_state *state)
>  {
>  	struct rcar_lvds *lvds =3D bridge_to_rcar_lvds(bridge);
>=20
> @@ -558,54 +604,6 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *=
bridge,
>  	return true;
>  }
>=20
> -static void rcar_lvds_get_lvds_mode(struct rcar_lvds *lvds)
> -{
> -	struct drm_display_info *info =3D &lvds->connector.display_info;
> -	enum rcar_lvds_mode mode;
> -
> -	/*
> -	 * There is no API yet to retrieve LVDS mode from a bridge, only panels
> -	 * are supported.
> -	 */
> -	if (!lvds->panel)
> -		return;
> -
> -	if (!info->num_bus_formats || !info->bus_formats) {
> -		dev_err(lvds->dev, "no LVDS bus format reported\n");
> -		return;
> -	}
> -
> -	switch (info->bus_formats[0]) {
> -	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> -	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> -		mode =3D RCAR_LVDS_MODE_JEIDA;
> -		break;
> -	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> -		mode =3D RCAR_LVDS_MODE_VESA;
> -		break;
> -	default:
> -		dev_err(lvds->dev, "unsupported LVDS bus format 0x%04x\n",
> -			info->bus_formats[0]);
> -		return;
> -	}
> -
> -	if (info->bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> -		mode |=3D RCAR_LVDS_MODE_MIRROR;
> -
> -	lvds->mode =3D mode;
> -}
> -
> -static void rcar_lvds_mode_set(struct drm_bridge *bridge,
> -			       const struct drm_display_mode *mode,
> -			       const struct drm_display_mode *adjusted_mode)
> -{
> -	struct rcar_lvds *lvds =3D bridge_to_rcar_lvds(bridge);
> -
> -	lvds->display_mode =3D *adjusted_mode;
> -
> -	rcar_lvds_get_lvds_mode(lvds);
> -}
> -
>  static int rcar_lvds_attach(struct drm_bridge *bridge)
>  {
>  	struct rcar_lvds *lvds =3D bridge_to_rcar_lvds(bridge);
> @@ -614,32 +612,47 @@ static int rcar_lvds_attach(struct drm_bridge *brid=
ge)
>  	int ret;
>=20
>  	/* If we have a next bridge just attach it. */
> -	if (lvds->next_bridge)
> -		return drm_bridge_attach(bridge->encoder, lvds->next_bridge,
> -					 bridge);
> +	if (lvds->next_bridge) {
> +		ret =3D drm_bridge_attach(bridge->encoder, lvds->next_bridge,
> +					bridge);
> +		goto done;
> +	}
>=20
>  	/* Otherwise if we have a panel, create a connector. */

It doesn't look like this comment is in the right place. We should probably=
 move this
comment below and add a new comment here. What do you think?

> -	if (!lvds->panel)
> -		return 0;
> +	if (!lvds->panel) {
> +		ret =3D 0;
> +		goto done;
> +	}
>=20
>  	ret =3D drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_func=
s,
>  				 DRM_MODE_CONNECTOR_LVDS);
>  	if (ret < 0)
> -		return ret;
> +		goto done;
>=20
>  	drm_connector_helper_add(connector, &rcar_lvds_conn_helper_funcs);
>=20
>  	ret =3D drm_connector_attach_encoder(connector, encoder);
>  	if (ret < 0)
> -		return ret;
> +		goto done;
> +
> +	ret =3D drm_panel_attach(lvds->panel, connector);
>=20
> -	return drm_panel_attach(lvds->panel, connector);
> +done:
> +	if (!ret) {
> +		if (lvds->companion)
> +			lvds->companion->encoder =3D encoder;
> +	}

How about replacing the above with:
        if (!ret && lvds->companion)
                lvds->companion->encoder =3D encoder;

Also, I am not a DRM expert, so this comment might have no real value,
but I do wonder if tampering with the drm_bridge structure for the companio=
n
encoder is safe to do here?

> +
> +	return 0;
>  }
>=20
>  static void rcar_lvds_detach(struct drm_bridge *bridge)
>  {
>  	struct rcar_lvds *lvds =3D bridge_to_rcar_lvds(bridge);
>=20
> +	if (lvds->companion)
> +		lvds->companion->encoder =3D NULL;
> +
>  	if (lvds->panel)
>  		drm_panel_detach(lvds->panel);
>  }
> @@ -647,10 +660,9 @@ static void rcar_lvds_detach(struct drm_bridge *brid=
ge)
>  static const struct drm_bridge_funcs rcar_lvds_bridge_ops =3D {
>  	.attach =3D rcar_lvds_attach,
>  	.detach =3D rcar_lvds_detach,
> -	.enable =3D rcar_lvds_enable,
> -	.disable =3D rcar_lvds_disable,
> +	.atomic_enable =3D rcar_lvds_atomic_enable,
> +	.atomic_disable =3D rcar_lvds_atomic_disable,
>  	.mode_fixup =3D rcar_lvds_mode_fixup,
> -	.mode_set =3D rcar_lvds_mode_set,
>  };
>=20
>  bool rcar_lvds_dual_link(struct drm_bridge *bridge)

I did test this patch on the RZ/G2E with dual-link support and it seems to =
be working
just fine.

Cheers,
Fab

> --
> Regards,
>=20
> Laurent Pinchart

