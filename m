Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF5557298F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2019 10:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfGXIK1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jul 2019 04:10:27 -0400
Received: from mail-eopbgr1400091.outbound.protection.outlook.com ([40.107.140.91]:46142
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725882AbfGXIK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 04:10:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYPW3I89QXai2O/mdhW0K2hgeEW7sQUWZooDGmv5YS9KRIyp/ujmAP3Cb2aDKCKtLMK8p3MLqOgulW2P3OVjZRBK0j92/ua1Lv8rg7+uUPsBWzOz24vkFyTXg3KiqfII9g+Pn/iXMnCUsDRa1oRMyLdgH0BMyoh/7F6TfghCmWbmSoRhH+l/eVWCiC+Iuw0PjRBVcPZCojQJu7Kb9AcJ0adMAUX+g7Eq7cdpG14//78IP00wvFh/6zdCU7swQj83V/SDNETKF/Y4PeUioMwgtnAGt+S1NBxg7nyK8Uiw5vFLKN6q/7rPq5nS2iqiRls/Gs/UzEmle9wnlgg83qdmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqwEVaEIv32gUYLSeGQxUIQJawQRamlZQxy38lzmfO0=;
 b=jLQpuTyGXSMeV3LE8XsEixEA0djxq7lASvWJHgwEAoa3qubF6qMK84rVQXaKSPhWKQB79608JtxoRCJzbm+3pLoXdFj6XgObxFjHnc7LbULuZgutiIGMOWJZG32EhBFjw2qrwM9wgjziCYHR2lbIOHRMNbGmH4TKu0cBK+fpdd9MsT+1jzSMf8MkrPRclbSmNj2IZpqa3iVfP6NNvG0ROjaAMnl3nFXI+k4PtjClwRw2qm3zkDhtMnraW4IhA3xSDM3ebfwdgBRn/dMo0Lvt70ns/McnrcUotWWMkNkTx42kq80VIJAwYsID8i3OhaqzfL58KV1BqJYQLYSblVOPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqwEVaEIv32gUYLSeGQxUIQJawQRamlZQxy38lzmfO0=;
 b=rugvQIZI0b45pjyHGjvQbX4x85ARR7ykgjwH+DRTfHRgIvCSbD/sk0rcOA32BbZ+DwEDpzKXaAdE1+vrcggBcs6do90T4Rx0mwQ8HJriVoUiR/sE1C2XePssyIlXd0AwC3FW3s5Qt16a9m2l1Er+AovvzchQabI+fXBsXHD4j6g=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1706.jpnprd01.prod.outlook.com (52.133.160.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 08:10:23 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 08:10:23 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
CC:     "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: rcar_lvds: Fix dual link mode operations
Thread-Topic: [PATCH] drm: rcar_lvds: Fix dual link mode operations
Thread-Index: AQHVQXeAkekjE12GhEmxi27aP7D6DKbZarTw
Date:   Wed, 24 Jul 2019 08:10:22 +0000
Message-ID: <TY1PR01MB1770980628C5914BC796C47FC0C60@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
In-Reply-To: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f64e23a-c273-4972-62f2-08d7100e608c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1706;
x-ms-traffictypediagnostic: TY1PR01MB1706:
x-microsoft-antispam-prvs: <TY1PR01MB1706342FC0346FB144E852B9C0C60@TY1PR01MB1706.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(305945005)(66066001)(54906003)(256004)(14444005)(74316002)(33656002)(6116002)(81166006)(8676002)(86362001)(7736002)(476003)(446003)(68736007)(110136005)(53546011)(8936002)(3846002)(316002)(71200400001)(81156014)(26005)(66476007)(186003)(2906002)(5660300002)(6436002)(52536014)(6506007)(64756008)(66556008)(11346002)(55016002)(71190400001)(66446008)(66946007)(478600001)(9686003)(102836004)(6246003)(76116006)(4326008)(53936002)(486006)(44832011)(14454004)(25786009)(76176011)(229853002)(7696005)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1706;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jUDIBD/0U0ETu4VQ6bZ/+R4WWKWsQcGwzKEuJvL9/ReXeqzl0l69KuoMSCTjBwfkdOgG4TGdetYaQPwmNkLd5lrfn2bhpr0N0YKDKJyy5mryfeC83SetqA+N0GTSwmjveHasyCmAeRQJ9DmWIw+EKe2kmEXVWMR371ZFo5JTqyUAaoPxhvf/ie2Z2Yauz+1vzyw95Ti1BV3WmWuhRtts0MojXFrkOsY+LLm5L5hA3rX7IQjSRqgKaUvdxzEvTsbdjy2VAcSoOWuBrFN5HKvoq3nEaSa/s5XtXzdIV0nbs/8RlU+Q8v53hk6rmJSiK0kaL3fKPREQS1DtjaU6s7VRMa9lr/ePzwv0SwqovBa6ZicdraFv1dcq1c1SxebkvgBxa9WlGyGMQ6CMa8LYBWREI8PCGbpHXYV0dGlniRFv870=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f64e23a-c273-4972-62f2-08d7100e608c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 08:10:23.0075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1706
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for your patch!

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vg=
er.kernel.org> On Behalf Of Jacopo Mondi
> Sent: 23 July 2019 17:57
> Subject: [PATCH] drm: rcar_lvds: Fix dual link mode operations
>=20
> The R-Car LVDS encoder units support dual-link operations by splitting
> the pixel output between the primary encoder and the companion one.
>=20
> In order for the primary encoder to succesfully control the companion's
> operations this should not fail at probe time and register itself its
> associated drm bridge so that the primary one can find it.
>=20
> Currently the companion encoder fails at probe time, causing the
> registration of the primary to fail preventing the whole DU unit to be
> registered correctly.
>=20
> Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode"=
)
> Reported-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Tested-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

>=20
> ---
> The "Fixes" tag refers to a patch currently part of the
> renesas-drivers-2019-07-09-v5.2 branch of Geert's renesas-drivers tree.
>=20
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 31 +++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-d=
u/rcar_lvds.c
> index bada7ee98544..8b015ba95895 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -767,14 +767,29 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvd=
s)
>  	of_node_put(remote_input);
>  	of_node_put(remote);
>=20
> -	/*
> -	 * On D3/E3 the LVDS encoder provides a clock to the DU, which can be
> -	 * used for the DPAD output even when the LVDS output is not connected.
> -	 * Don't fail probe in that case as the DU will need the bridge to
> -	 * control the clock.
> -	 */
> -	if (lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)
> -		return ret =3D=3D -ENODEV ? 0 : ret;
> +	switch (ret) {
> +	case -ENODEV:
> +		/*
> +		 * On D3/E3 the LVDS encoder provides a clock to the DU, which
> +		 * can be used for the DPAD output even when the LVDS output is
> +		 * not connected. Don't fail probe in that case as the DU will
> +		 * need the bridge to control the clock.
> +		 */
> +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)
> +			ret =3D 0;
> +		break;
> +	case -ENXIO:
> +		/*
> +		 * When the LVDS output is used in dual link mode, the
> +		 * companion encoder fails at
> +		 * 'rcar_lvds_parse_dt_companion()'. Don't fail probe in
> +		 * that case as the master encoder will need the companion's
> +		 * bridge to control its operations.
> +		 */
> +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> +			ret =3D 0;
> +		break;
> +	}
>=20
>  	return ret;
>  }
> --
> 2.22.0

