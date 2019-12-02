Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B483D10EC0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 16:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfLBPGS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 10:06:18 -0500
Received: from mail-eopbgr1400103.outbound.protection.outlook.com ([40.107.140.103]:51808
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727413AbfLBPGS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 10:06:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXpJUoxvTQUZnI1vKoyu/Bdc+/RdLACenQOm5QgDVjFqP4t9U4WM4pbkKR6RufqQmi5RovFJrJJmV4nDcKMjnW62iejH/RV1I34S7xUmFIYulaECCZXbRit0+sVKwuZEclx0l+MY1/XtG3sSiZgTdQflCTJcjsv3Wt8mammPCfHKyjRcMtrsvSChXW63nsq+NVSYYy5XjPN7s4hXwi5dngeNN4BtUXFyGeabdeYY/hy5U5NgwJmvw8W8djeDJLI1r+mk74RZcUg3eTTfbLO3Y0XWh62tVx8Okcd8YSMVVe2zQg6nQiVYuMQW9MGoX9pre9Wmpc4ps0tj/sXOEqPgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bo8TZb0QC8Dvy/NbXrKdM9Wptt3/Uk059oibZbjaL4w=;
 b=Vu9f1EbZ7uJ8KZb2Vs1oguLmR+DQIEo+YD0Yh5RT54DM/pfl6E54HyqhA1J6VYJvZiN4ZeIovnOHteeXgBavv6rQkJ+7t7+5870SeNmL3PZxCTa+NQtH4yevKY8pzJIOAZ4rCE3Nd/RSFdHUTr0znhx4qdaD2SSAF+1RzcFVVMLRkpUkf+Uxx7B2PtoQ3SR8wRkQkCKPPzFIybWA114d87X6EeTxLe8519Vqtxghhb31Umk/oZqT6pVAdRiyHjecbCOBNN11taOCp7bYYeN9k43bpaTNA92Td9tkxjxDS8fGpp0goS5540NTMGe3v+LzED9kPMiURPqKuccMo2upYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bo8TZb0QC8Dvy/NbXrKdM9Wptt3/Uk059oibZbjaL4w=;
 b=MT9JJ1Dr6p701t05ZSchFNmjxOTgmjxoykDW+LTi1ABSX1oM5W7cOoWNEVMRgyn7RfAlrRCK0kp9nC40+ykHbRPtuGD5+ltfWPZsZSuJVicbFqiWUv79hGUKi1WNulMHgEwxRzSMerZYbTfLT4dAbune4Bd2v21ij9z1IaRr4O8=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1833.jpnprd01.prod.outlook.com (52.133.163.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Mon, 2 Dec 2019 15:06:13 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 15:06:13 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] drm: rcar-du: lvds: Get mode from state
Thread-Topic: [PATCH] drm: rcar-du: lvds: Get mode from state
Thread-Index: AQHVg6/ZoqgnXEtOHUG426Czz4f2haenNdag
Date:   Mon, 2 Dec 2019 15:06:13 +0000
Message-ID: <TY1PR01MB1770F50373A7E518388EEA4AC0430@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20191015232521.9455-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20191015232521.9455-1-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 56392dd1-b024-438e-c4dc-08d777392c6c
x-ms-traffictypediagnostic: TY1PR01MB1833:|TY1PR01MB1833:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB18337043A5DAE0FA8253E0B4C0430@TY1PR01MB1833.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(199004)(189003)(9686003)(66476007)(2501003)(66556008)(66946007)(8676002)(55016002)(52536014)(76176011)(7696005)(26005)(66066001)(66446008)(64756008)(186003)(76116006)(99286004)(256004)(14444005)(446003)(11346002)(229853002)(5024004)(6506007)(107886003)(102836004)(53546011)(6436002)(6246003)(3846002)(478600001)(6116002)(2906002)(305945005)(7736002)(25786009)(5660300002)(4326008)(14454004)(33656002)(86362001)(110136005)(44832011)(54906003)(74316002)(71190400001)(71200400001)(316002)(81156014)(81166006)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1833;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dKS/pU5NULWxsdWNE1kB+9gj4mR3dyVHHjPHJ17NrgGEgLkY9cKvaO8wuv7Rc3tmoJkkGpX9q596QMCp8P2G8BplxiYUVIf8GLi1bZi8A9W8cQkpOPTN3SwV2aCIKjVxUINYJ1PvPeletmRv1HJNBrXYz+8C6+SXRyzRIuYspVJqmtDVLRxsXKzftKZmTIWppGxoFxyhHWM44c5S5DVoryhudkAgSPPsC2J50bcQFd0iNdG7ZtYGpF1LAUYU8G+aYy6o7wt/RB9kPW8jA7liTOyLDHduzTBPqrd+wzQ+UAkALvPGyzms9aiCUSP9L6k2lNTON8/wgtK/URkauQHD77h6OxmCX8keilWyUiDMqlxeJNXkSqOwwKWz872LTMXkXDYjIz6eXSrede8xJDYOvO8lV+wvP8QQApqRReflW6Q5mTZxt3CaOeq9p6IRENIU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56392dd1-b024-438e-c4dc-08d777392c6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 15:06:13.6062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJqWVNbKmNeUNU3RJm892fD0WTpocOY3Rw1dowwc5gxqgw5xMn0+39UhBV94Vf549HATQCtJT+rlqOJIlINyEtQ18uKEaVRluVr8F4Uo6Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1833
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Laurent,

Thank you for your patch!

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vg=
er.kernel.org> On Behalf Of Laurent Pinchart
> Sent: 16 October 2019 00:25
> Subject: [PATCH] drm: rcar-du: lvds: Get mode from state
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
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 125 ++++++++++++++--------------
>  1 file changed, 61 insertions(+), 64 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-d=
u/rcar_lvds.c
> index 8c6c172bbf2e..8f355ea07cb5 100644
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
> +		dev_err(lvds->dev, "unsupported LVDS bus format 0x%04x\n",
> +			info->bus_formats[0]);
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
> @@ -414,6 +452,11 @@ static void rcar_lvds_enable(struct drm_bridge *brid=
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
>  		lvds->companion->funcs->enable(lvds->companion);

This should call atomic_enable now, therefore I take this won't work as-is =
on
a system with a companion encoder. Do you mind testing this patch on a dual=
-LVDS
capable system?

Thanks,
Fab

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
> @@ -647,10 +645,9 @@ static void rcar_lvds_detach(struct drm_bridge *brid=
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

