Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BB01E8AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 08:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfEOG5Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 02:57:24 -0400
Received: from mail-eopbgr1400133.outbound.protection.outlook.com ([40.107.140.133]:11148
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725871AbfEOG5Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 02:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/CtupbjyREENL59IRuJZgUhp8zoQdfkCHNCTdzlxHA=;
 b=o5MSqRSg0T1yjHIbu6M/MhnrejHaPatR/o3RZJCR+kiW/DDoxHcm3JDu3JvVE1CERP7DIQTMLw5UeWAXW0iyND9nlD7Bc8QsKa5GcS8YL0uYciVHZoLd0PWVmQhe++BSxKyw7qEjQDUJjRtfDEzSVJkUDNlUuHuP7cwGL/E57ls=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB3030.jpnprd01.prod.outlook.com (52.134.252.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 06:57:17 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 06:57:17 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] usb: renesas_usbhs: Use specific struct instead of
 USBHS_TYPE_* enums
Thread-Topic: [PATCH v2] usb: renesas_usbhs: Use specific struct instead of
 USBHS_TYPE_* enums
Thread-Index: AQHVCTXiNCoZlE2sQkyyc0StjZieSqZo9MGAgALG6XA=
Date:   Wed, 15 May 2019 06:57:17 +0000
Message-ID: <OSBPR01MB3174C65FDF208431F988068DD8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <1557715229-13102-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190513120124.72pyg5hileurtkry@verge.net.au>
In-Reply-To: <20190513120124.72pyg5hileurtkry@verge.net.au>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e678ca5-d9b8-41fd-a9ff-08d6d90291bc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3030;
x-ms-traffictypediagnostic: OSBPR01MB3030:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <OSBPR01MB30307B78778134E4FCC4CFF5D8090@OSBPR01MB3030.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(39860400002)(346002)(366004)(396003)(189003)(199004)(2501003)(81156014)(476003)(3846002)(486006)(478600001)(8676002)(446003)(52536014)(81166006)(6116002)(11346002)(86362001)(256004)(102836004)(6506007)(305945005)(7736002)(966005)(76176011)(6306002)(9686003)(66066001)(7696005)(26005)(186003)(68736007)(4326008)(14454004)(54906003)(71190400001)(25786009)(53936002)(2906002)(33656002)(229853002)(8936002)(74316002)(71200400001)(99286004)(110136005)(66946007)(5660300002)(6246003)(66476007)(66556008)(64756008)(66446008)(73956011)(76116006)(55016002)(6436002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3030;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /N7wDC9yZMSEItB0SNKi2LLpmz+OKn7Emf5WXf6/IsHiAVa6n08+8et2/S6EsvgGdMcMWE55PqJB4x0o1MMo1+DhwkdKbe5AEVjkXHpI55f3oszi4laO/2wTaB/yolCar57VTAwPMt9vBZPouzEilH+km6jfRcv0EOsWOvpr//oOHVBjRrKT4H8nSq4vH4e6KXtV62QC/LEi0xakSVkstYo5a6PHOM+lFBiy+VsQb6GZBwyXlWPisYcRnQrakec16YUmjPtu9UG7tUx7u30r/SK5cJphe9pwCLZ3Pjgzvxxb1+4k2ga4AKphZa9RUBx72AP/DbUucoFG9w7ORuPhq4Fuy1P2ZDmzEt+WXmgKDB9zPSNCIjeL1JvXd2xc6A3We5L3lNXbU2mIY8MrCvEjkgW77C44NWpdqoXViiKeLSo=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e678ca5-d9b8-41fd-a9ff-08d6d90291bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 06:57:17.6357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3030
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon-san,

> From: Simon Horman, Sent: Monday, May 13, 2019 9:01 PM
>=20
> On Mon, May 13, 2019 at 11:40:29AM +0900, Yoshihiro Shimoda wrote:
> > This patch adds a specific struct "usbhs_of_data" to add a new SoC
> > data easily instead of code basis in the future.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Hi Shimoda-san,
>=20
> the minor suggestion below not withstanding this looks good to me.
>=20
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thank you for your review!

> > ---
> >  Changes from v1 [1]:
> >  - Use sizeof(variable) instead of sizeof(type).
> >  - Add Geert-san's reviewed-by (thanks!).
> >
> > [1]
> > https://patchwork.kernel.org/patch/10938575/
> >
> >  drivers/usb/renesas_usbhs/common.c | 112 +++++++++++++++++++++--------=
--------
> >  drivers/usb/renesas_usbhs/common.h |   5 ++
> >  2 files changed, 70 insertions(+), 47 deletions(-)
> >
> > diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_u=
sbhs/common.c
> > index 249fbee..0ca89de 100644
> > --- a/drivers/usb/renesas_usbhs/common.c
> > +++ b/drivers/usb/renesas_usbhs/common.c
<snip>
> > @@ -598,8 +638,15 @@ static struct renesas_usbhs_platform_info *usbhs_p=
arse_dt(struct device *dev)
> >  	if (!info)
> >  		return NULL;
> >
> > +	data =3D of_device_get_match_data(dev);
> > +	if (!data)
> > +		return NULL;
> > +
> >  	dparam =3D &info->driver_param;
> > -	dparam->type =3D (uintptr_t)of_device_get_match_data(dev);
> > +	memcpy(dparam, &data->param, sizeof(data->param));
> > +	memcpy(&info->platform_callback, data->platform_callback,
> > +	       sizeof(*data->platform_callback));
>=20
> Can we avoid the error-proneness of calls to sizeof() as follows?
>=20
>         *dparam =3D data->param;
>         info->platform_callback =3D *data->platform_callback;

Since Chris-san has submitted a patch series [1] that is based on this patc=
h today,
I'd like to submit an incremental patch to avoid the error-proneness in the=
 renesas_usbhs
(common.c and mod_host.c) later, if possible.

Greg-san, is it acceptable?

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D11745=
9

Best regards,
Yoshihiro Shimoda

> > +
> >  	if (!of_property_read_u32(dev->of_node, "renesas,buswait", &tmp))
> >  		dparam->buswait_bwait =3D tmp;
> >  	gpio =3D of_get_named_gpio_flags(dev->of_node, "renesas,enable-gpio",=
 0,
> > @@ -607,19 +654,6 @@ static struct renesas_usbhs_platform_info *usbhs_p=
arse_dt(struct device *dev)
> >  	if (gpio > 0)
> >  		dparam->enable_gpio =3D gpio;
> >
> > -	if (dparam->type =3D=3D USBHS_TYPE_RCAR_GEN2 ||
> > -	    dparam->type =3D=3D USBHS_TYPE_RCAR_GEN3 ||
> > -	    dparam->type =3D=3D USBHS_TYPE_RCAR_GEN3_WITH_PLL) {
> > -		dparam->has_usb_dmac =3D 1;
> > -		dparam->pipe_configs =3D usbhsc_new_pipe;
> > -		dparam->pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
> > -	}
> > -
> > -	if (dparam->type =3D=3D USBHS_TYPE_RZA1) {
> > -		dparam->pipe_configs =3D usbhsc_new_pipe;
> > -		dparam->pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
> > -	}
> > -
> >  	return info;
> >  }
> >
> > @@ -676,29 +710,13 @@ static int usbhs_probe(struct platform_device *pd=
ev)
> >  	       &info->driver_param,
> >  	       sizeof(struct renesas_usbhs_driver_param));
>=20
> Likewise in the (otherwise unchanged) use of memcpy above.
>=20
> >
> > -	switch (priv->dparam.type) {
> > -	case USBHS_TYPE_RCAR_GEN2:
> > -		priv->pfunc =3D usbhs_rcar2_ops;
> > -		break;
> > -	case USBHS_TYPE_RCAR_GEN3:
> > -		priv->pfunc =3D usbhs_rcar3_ops;
> > -		break;
> > -	case USBHS_TYPE_RCAR_GEN3_WITH_PLL:
> > -		priv->pfunc =3D usbhs_rcar3_with_pll_ops;
> > -		break;
> > -	case USBHS_TYPE_RZA1:
> > -		priv->pfunc =3D usbhs_rza1_ops;
> > -		break;
> > -	default:
> > -		if (!info->platform_callback.get_id) {
> > -			dev_err(&pdev->dev, "no platform callbacks");
> > -			return -EINVAL;
> > -		}
> > -		memcpy(&priv->pfunc,
> > -		       &info->platform_callback,
> > -		       sizeof(struct renesas_usbhs_platform_callback));
> > -		break;
> > +	if (!info->platform_callback.get_id) {
> > +		dev_err(&pdev->dev, "no platform callbacks");
> > +		return -EINVAL;
> >  	}
> > +	memcpy(&priv->pfunc,
> > +	       &info->platform_callback,
> > +	       sizeof(struct renesas_usbhs_platform_callback));
>=20
> And here too.
>=20
> >
> >  	/* set driver callback functions for platform */
> >  	dfunc			=3D &info->driver_callback;
> > diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_u=
sbhs/common.h
> > index 3777af8..de1a663 100644
> > --- a/drivers/usb/renesas_usbhs/common.h
> > +++ b/drivers/usb/renesas_usbhs/common.h
> > @@ -282,6 +282,11 @@ struct usbhs_priv {
> >  	struct clk *clks[2];
> >  };
> >
> > +struct usbhs_of_data {
> > +	const struct renesas_usbhs_platform_callback	*platform_callback;
> > +	const struct renesas_usbhs_driver_param		param;
> > +};
> > +
> >  /*
> >   * common
> >   */
> > --
> > 2.7.4
> >
