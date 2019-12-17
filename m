Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22AB7122D62
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 14:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbfLQNsS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 08:48:18 -0500
Received: from mail-eopbgr1410090.outbound.protection.outlook.com ([40.107.141.90]:36032
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726164AbfLQNsS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 08:48:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yhl/z+bywDytOP5UuIidU7GzWYw/ytM3fEJ2WkYmDBs0Q4KQ2lgdR4lvUQqXGr9lFkfU5prRPn0MyeD7MT+Mv4iInxDRYyAxe7J+Xex/z6laJ3ZM/ldVGRuOG3JnN9p9TqDqhQDR4hMDHb2EeKKa3o+yULerAAbkKSgP1wn1ECYAlthMyx0Cd1S5nQZB0HuEwVx0ALqx4PavzXD/BSGEMDNTFxk3CXmNj0kVzR/lms7GNqeI1/yUUFNtjp5/4SZtSTlDO7L7pmJDaU1KvzzmD8S1TWj2WAet413olO59saVGw42e7ttAf6Cp83IBIoMsJTAjKr06DIfWHQm1Lou88w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rqd8pjtaK3qWqjfzIERY+6Spvz7en2eYdKaNX1JAvJM=;
 b=iPJ2FS6zLebqwz5A7FssKE0x1rLh1fmXEO8WJDRKe6en63g42RnyrNhUfCIhnI0mWPQECNHe2UUS8pUZNNtLm7/oIxI3njupHMJcrLbfhH/PbjgEZZBB7+L+vv8AyU0cqjZkO8zEV2E1u4aTRVa5KkExR4zwo4ZYzBDZoTW1n1VKVVCMpxW1kfdGMVPhldwvKoTPRN9UifrvSS3LOkdAX+XzZT/rmFUEoAfgOkeG+nyUR60zPvSh66rM+2Igjb0htBinPkfMnipUxWXQDpPID4ilKsyvQC6nBcla7MuvA+VM+EdHEvSgYeRRKLPlEOGX1xPEwkdm6NZTcy317UFs8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rqd8pjtaK3qWqjfzIERY+6Spvz7en2eYdKaNX1JAvJM=;
 b=blze8hWI7DLQqnnxYbIaEQgNIorK211eOcGNCkkfVVUPulgc8sx+mGn40vMxfP+blEGPwoG+eeKszCafl5x/1yhS4hTH9/y9to0xnPNGxj55R6pjM7sD603HlPp7Uq+doz7qoq13Qas7kZ4pFQBQFUVwPACJxcMnR9LXuqsPPRU=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1515.jpnprd01.prod.outlook.com (52.133.160.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Tue, 17 Dec 2019 13:48:13 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 13:48:13 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: RE: [PATCH v3] drm: rcar-du: lvds: Get mode from state
Thread-Topic: [PATCH v3] drm: rcar-du: lvds: Get mode from state
Thread-Index: AQHVtGB/9b08UT8/o0eWS/U/RJ7DDae+WBvQ
Date:   Tue, 17 Dec 2019 13:48:13 +0000
Message-ID: <TY1PR01MB1770BAF7AD622EAECAC6CF46C0500@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20191216223042.30590-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20191216223042.30590-1-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1ea17382-09ed-405f-073a-08d782f7c324
x-ms-traffictypediagnostic: TY1PR01MB1515:
x-microsoft-antispam-prvs: <TY1PR01MB15155E716EF83CEDDD4E4B31C0500@TY1PR01MB1515.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(199004)(189003)(316002)(71200400001)(9686003)(66946007)(52536014)(4326008)(5660300002)(2906002)(54906003)(110136005)(55016002)(6506007)(186003)(26005)(53546011)(7696005)(76116006)(33656002)(64756008)(66476007)(66446008)(86362001)(66556008)(44832011)(81166006)(478600001)(81156014)(8936002)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1515;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KsL7eb23C+iQcpdBA8FNtI0ozdtC1A+DAdaOmWpAKqZ1Nw7noXnc+AggGKJi+2JrpF2HwUGRI6DD1qHFSIlFiv/R9RU20zDz79pJNdVGfHeuk0hzf+Bs2QcZEiNUtkQrM9gFzGJSLk1g/pzwDvTNR5cwT5zH3p0jxZcSe9tBHsEJMT1w03E6zLDPyQKeI9k75yYlpQrLwMANykS/qdYML7GWxeqKnEEAheES/ZmmA8Ohs1Koy4zXycmqshmC/+CabXVzORSW9JUaFIMrzJ6H+jyuYzqGC5cgwf5tdmjbTkZZto0kUADcyfJ/tSJyzpWqfEhLLfiYVGTDlTWu8XMmVtOZbSt3N/ILy9PTcJl7uifb4MLnAfA3d7/q3y8kN17cesViQrXMeEU2u3n94WzwjZq73aG+rFD+RHwo+xBQ6dQ3d1gSqqavX60d1p2kD2r6
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea17382-09ed-405f-073a-08d782f7c324
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 13:48:13.7416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FYqSJLhKfg0WU0JiSdCqYh5pkWmQ9kYHakFZDFMX6KaNgacUPr9QEb5hadSAXaEsk6cBUUnyj8UY6AJXnQAUwTnsG418UjkuaihO8U6Rj7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1515
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thank you for your patch!

> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Sent: 16 December 2019 22:31
> Subject: [PATCH v3] drm: rcar-du: lvds: Get mode from state
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
> While at it, clarify a few error messages in rcar_lvds_get_lvds_mode()
> and turn them into warnings as they are not fatal.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

And I have tested this on the EK874, therefore

Tested-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> Changes since v2:
>=20
> - Turn a few dev_err() into dev_warn()
> - Split rcar_lvds_atomic_enable() to avoid setting the companion's
>   bridge encoder pointer manually
> - Call .atomic_disable() on the companion
>=20
> Changes since v1:
>=20
> - Call .atomic_enable() on the companion
> - Set companion->encoder in .attach()
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 140 +++++++++++++++-------------
>  1 file changed, 74 insertions(+), 66 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-d=
u/rcar_lvds.c
> index 8c6c172bbf2e..284f10d0307f 100644
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
> @@ -402,10 +399,53 @@ EXPORT_SYMBOL_GPL(rcar_lvds_clk_disable);
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
> +		dev_warn(lvds->dev,
> +			 "no LVDS bus format reported, using JEIDA\n");
> +		return RCAR_LVDS_MODE_JEIDA;
> +	}
> +
> +	switch (info->bus_formats[0]) {
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		mode =3D RCAR_LVDS_MODE_JEIDA;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		mode =3D RCAR_LVDS_MODE_VESA;
> +		break;
> +	default:
> +		dev_warn(lvds->dev,
> +			 "unsupported LVDS bus format 0x%04x, using JEIDA\n",
> +			 info->bus_formats[0]);
> +		return RCAR_LVDS_MODE_JEIDA;
> +	}
> +
> +	if (info->bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> +		mode |=3D RCAR_LVDS_MODE_MIRROR;
> +
> +	return mode;
> +}
> +
> +static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
> +				      struct drm_atomic_state *state,
> +				      struct drm_crtc *crtc,
> +				      struct drm_connector *connector)
>  {
>  	struct rcar_lvds *lvds =3D bridge_to_rcar_lvds(bridge);
> -	const struct drm_display_mode *mode =3D &lvds->display_mode;
>  	u32 lvdhcr;
>  	u32 lvdcr0;
>  	int ret;
> @@ -416,7 +456,8 @@ static void rcar_lvds_enable(struct drm_bridge *bridg=
e)
>=20
>  	/* Enable the companion LVDS encoder in dual-link mode. */
>  	if (lvds->dual_link && lvds->companion)
> -		lvds->companion->funcs->enable(lvds->companion);
> +		__rcar_lvds_atomic_enable(lvds->companion, state, crtc,
> +					  connector);
>=20
>  	/*
>  	 * Hardcode the channels and control signals routing for now.
> @@ -452,18 +493,20 @@ static void rcar_lvds_enable(struct drm_bridge *bri=
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
> @@ -520,7 +563,21 @@ static void rcar_lvds_enable(struct drm_bridge *brid=
ge)
>  	}
>  }
>=20
> -static void rcar_lvds_disable(struct drm_bridge *bridge)
> +static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
> +				    struct drm_atomic_state *state)
> +{
> +	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
> +
> +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> +
> +	__rcar_lvds_atomic_enable(bridge, state, crtc, connector);
> +}
> +
> +static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
> +				     struct drm_atomic_state *state)
>  {
>  	struct rcar_lvds *lvds =3D bridge_to_rcar_lvds(bridge);
>=20
> @@ -535,7 +592,7 @@ static void rcar_lvds_disable(struct drm_bridge *brid=
ge)
>=20
>  	/* Disable the companion LVDS encoder in dual-link mode. */
>  	if (lvds->dual_link && lvds->companion)
> -		lvds->companion->funcs->disable(lvds->companion);
> +		lvds->companion->funcs->atomic_disable(lvds->companion, state);
>=20
>  	clk_disable_unprepare(lvds->clocks.mod);
>  }
> @@ -558,54 +615,6 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *=
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
> @@ -647,10 +656,9 @@ static void rcar_lvds_detach(struct drm_bridge *brid=
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
> --
> Regards,
>=20
> Laurent Pinchart

