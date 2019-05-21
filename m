Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40EB72479D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 07:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbfEUFtL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 01:49:11 -0400
Received: from mail-eopbgr1400099.outbound.protection.outlook.com ([40.107.140.99]:45664
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725794AbfEUFtL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 01:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PqVIgPBAp22EYPduTUhiXgkl1aDhTE+y2WWy42Cmq0=;
 b=pAY1E4mZNBgeVn0NsfiIpQzEanjXdIDVYnoo9iC6Gc0b7Rff7vHDOxGiOKy/kDZKZN1D9HdjIYR+StPhf2L6S2v7LWnenr8ig6GkmFQtRi0ElH7aUUR/PAef25M+pC5fxySw8WnmLMh3uTMFXNm9lMZBH1Wz469cpwGpJp6qrFo=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB2353.jpnprd01.prod.outlook.com (52.134.249.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 21 May 2019 05:49:01 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 05:49:01 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 4/7] usb: gadget: udc: renesas_usb3: Add dual role
 switch support
Thread-Topic: [PATCH v6 4/7] usb: gadget: udc: renesas_usb3: Add dual role
 switch support
Thread-Index: AQHVCxgUJtDbUoV/lUufMqZWI03qcqZ1EFsg
Date:   Tue, 21 May 2019 05:49:01 +0000
Message-ID: <OSAPR01MB30890B5983EEAD2536D01A05D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1557922152-16449-5-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f8e6994-6e5a-4552-6cea-08d6ddb006aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB2353;
x-ms-traffictypediagnostic: OSAPR01MB2353:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <OSAPR01MB235307560D6491BB89E3D62FD8070@OSAPR01MB2353.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(346002)(376002)(396003)(39860400002)(366004)(136003)(199004)(189003)(316002)(229853002)(9686003)(486006)(110136005)(2906002)(54906003)(26005)(33656002)(53546011)(7736002)(4326008)(6506007)(55236004)(25786009)(86362001)(476003)(6246003)(99286004)(6436002)(74316002)(305945005)(102836004)(76176011)(446003)(256004)(5024004)(14444005)(7696005)(53936002)(3846002)(8676002)(186003)(11346002)(55016002)(6116002)(6306002)(8936002)(66476007)(66556008)(64756008)(66446008)(66946007)(81166006)(73956011)(76116006)(81156014)(66066001)(71200400001)(478600001)(68736007)(966005)(71190400001)(14454004)(5660300002)(52536014)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2353;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fj2W1BIZ2Z2KSCdtgxL3RihZTqOPbOp/+PCqy16cWPGJ6EKuksW//1w6Hpk1Rh8YDl/lzL7z8IICp9wfd7BGYJXlq4yJigeeAI//OPhN7UHna8Pkpc437TYM4Hw+Ea+4LRdijlEHnzFYja5Ed5YZzArrVQlo6jBC1xuAJKDkDX7e81j7UaMJEwmB6Jvd7bjN/LzPre1PN3PNQylPbEHkvU9WmspHSyqwadRH4Ov9dJxyqBu+E/+WpHn2F/0W/P4kwDh+/ysCWdeLDCmfirn0ASxMSmDF1o/PfPRMAQayGpNXSbvZpCV/BSdr9mQ3W8OHKQLin1u2NoTfm6q+VKRN3QaRscjpJJat6IK773jlHw+MPCzAENfWWuXz7GERJKCuy+6XDX2i40ZHTwVUTxk7N4Hhc9HJnikwlX7F0vtRS0Q=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8e6994-6e5a-4552-6cea-08d6ddb006aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 05:49:01.3591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2353
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Wednesday, May 15, 2019 9:09 PM
> Subject: [PATCH v6 4/7] usb: gadget: udc: renesas_usb3: Add dual role swi=
tch support

Now I'm confusing about the "Add dual role switch support" mean... Especial=
ly,
this driver has already supports dual role switch support by own sysfs or d=
ebugfs.

> The RZ/G2E cat874 board has a type-c connector connected to hd3ss3220 usb
> type-c drp port controller. This patch adds dual role switch support for
> the type-c connector using the usb role switch class framework.

IIUC, after this patch is applied, the hs3ss3220 type-c driver can switch
the role by using the usb role switch class framework.

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V5-->V6
>    * Added graph api's to find the role supported by the connector.
>  V4-->V5
>    * Incorporated Shimoda-san's review comment
>     (https://patchwork.kernel.org/patch/10902537/)
>  V3-->V4
>    * No Change
>  V2-->V3
>    * Incorporated Shimoda-san's review comment
>      (https://patchwork.kernel.org/patch/10852507/)
>    * Used renesas,usb-role-switch property for differentiating USB
>      role switch associated with Type-C port controller driver.
>  V1-->V2
>    * Driver uses usb role clas for handling dual role switch and handling
>      connect/disconnect events instead of extcon.
> ---
>  drivers/usb/gadget/udc/renesas_usb3.c | 121 ++++++++++++++++++++++++++++=
++++--
>  1 file changed, 114 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/u=
dc/renesas_usb3.c
> index 7dc2485..1d41998 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -24,6 +24,7 @@
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/usb/role.h>
>=20
>  /* register definitions */
> @@ -351,6 +352,8 @@ struct renesas_usb3 {
>  	int disabled_count;
>=20
>  	struct usb_request *ep0_req;
> +
> +	enum usb_role connection_state;
>  	u16 test_mode;
>  	u8 ep0_buf[USB3_EP0_BUF_SIZE];
>  	bool softconnect;
> @@ -359,6 +362,7 @@ struct renesas_usb3 {
>  	bool extcon_usb;		/* check vbus and set EXTCON_USB */
>  	bool forced_b_device;
>  	bool start_to_connect;
> +	bool dual_role_sw;

I'm also confusing this name.

>  };
>=20
>  #define gadget_to_renesas_usb3(_gadget)	\
<snip>
> @@ -699,8 +703,10 @@ static void usb3_mode_config(struct renesas_usb3 *us=
b3, bool host, bool a_dev)
>  	unsigned long flags;
>=20
>  	spin_lock_irqsave(&usb3->lock, flags);
> -	usb3_set_mode_by_role_sw(usb3, host);
> -	usb3_vbus_out(usb3, a_dev);
> +	if (!usb3->dual_role_sw || usb3->connection_state !=3D USB_ROLE_NONE) {
> +		usb3_set_mode_by_role_sw(usb3, host);
> +		usb3_vbus_out(usb3, a_dev);
> +	}
>  	/* for A-Peripheral or forced B-device mode */
>  	if ((!host && a_dev) || usb3->start_to_connect)
>  		usb3_connect(usb3);
> @@ -716,7 +722,8 @@ static void usb3_check_id(struct renesas_usb3 *usb3)
>  {
>  	usb3->extcon_host =3D usb3_is_a_device(usb3);
>=20
> -	if (usb3->extcon_host && !usb3->forced_b_device)
> +	if ((!usb3->dual_role_sw && usb3->extcon_host && !usb3->forced_b_device=
)
> +	    || usb3->connection_state =3D=3D USB_ROLE_HOST)
>  		usb3_mode_config(usb3, true, true);
>  	else
>  		usb3_mode_config(usb3, false, false);
> @@ -2343,14 +2350,65 @@ static enum usb_role renesas_usb3_role_switch_get=
(struct device *dev)
>  	return cur_role;
>  }
>=20
> -static int renesas_usb3_role_switch_set(struct device *dev,
> -					enum usb_role role)
> +static void handle_ext_role_switch_states(struct device *dev,
> +					    enum usb_role role)
> +{
> +	struct renesas_usb3 *usb3 =3D dev_get_drvdata(dev);
> +	struct device *host =3D usb3->host_dev;
> +	enum usb_role cur_role =3D renesas_usb3_role_switch_get(dev);
> +
> +	switch (role) {
> +	case USB_ROLE_NONE:
> +		usb3->connection_state =3D USB_ROLE_NONE;
> +		if (usb3->driver)
> +			usb3_disconnect(usb3);
> +		usb3_vbus_out(usb3, false);
> +		break;
> +	case USB_ROLE_DEVICE:
> +		if (usb3->connection_state =3D=3D USB_ROLE_NONE) {
> +			usb3->connection_state =3D USB_ROLE_DEVICE;
> +			usb3_set_mode(usb3, false);
> +			if (usb3->driver)
> +				usb3_connect(usb3);
> +		} else if (cur_role =3D=3D USB_ROLE_HOST)  {
> +			device_release_driver(host);
> +			usb3_set_mode(usb3, false);
> +			if (usb3->driver)
> +				usb3_connect(usb3);
> +		}
> +		usb3_vbus_out(usb3, false);
> +		break;
> +	case USB_ROLE_HOST:
> +		if (usb3->connection_state =3D=3D USB_ROLE_NONE) {
> +			if (usb3->driver)
> +				usb3_disconnect(usb3);
> +
> +			usb3->connection_state =3D USB_ROLE_HOST;
> +			usb3_set_mode(usb3, true);
> +			usb3_vbus_out(usb3, true);
> +			if (device_attach(host) < 0)
> +				dev_err(dev, "device_attach(host) failed\n");
> +		} else if (cur_role =3D=3D USB_ROLE_DEVICE) {
> +			usb3_disconnect(usb3);
> +			/* Must set the mode before device_attach of the host */
> +			usb3_set_mode(usb3, true);
> +			/* This device_attach() might sleep */
> +			if (device_attach(host) < 0)
> +				dev_err(dev, "device_attach(host) failed\n");
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void handle_role_switch_states(struct device *dev,
> +					    enum usb_role role)
>  {
>  	struct renesas_usb3 *usb3 =3D dev_get_drvdata(dev);
>  	struct device *host =3D usb3->host_dev;
>  	enum usb_role cur_role =3D renesas_usb3_role_switch_get(dev);
>=20
> -	pm_runtime_get_sync(dev);
>  	if (cur_role =3D=3D USB_ROLE_HOST && role =3D=3D USB_ROLE_DEVICE) {
>  		device_release_driver(host);
>  		usb3_set_mode(usb3, false);
> @@ -2361,6 +2419,20 @@ static int renesas_usb3_role_switch_set(struct dev=
ice *dev,
>  		if (device_attach(host) < 0)
>  			dev_err(dev, "device_attach(host) failed\n");
>  	}
> +}
> +
> +static int renesas_usb3_role_switch_set(struct device *dev,
> +					enum usb_role role)
> +{
> +	struct renesas_usb3 *usb3 =3D dev_get_drvdata(dev);
> +
> +	pm_runtime_get_sync(dev);
> +
> +	if (usb3->dual_role_sw)
> +		handle_ext_role_switch_states(dev, role);
> +	else
> +		handle_role_switch_states(dev, role);
> +
>  	pm_runtime_put(dev);
>=20
>  	return 0;
> @@ -2650,12 +2722,41 @@ static const unsigned int renesas_usb3_cable[] =
=3D {
>  	EXTCON_NONE,
>  };
>=20
> -static const struct usb_role_switch_desc renesas_usb3_role_switch_desc =
=3D {
> +static struct usb_role_switch_desc renesas_usb3_role_switch_desc =3D {
>  	.set =3D renesas_usb3_role_switch_set,
>  	.get =3D renesas_usb3_role_switch_get,
>  	.allow_userspace_control =3D true,
>  };
>=20
> +static bool is_usb_dual_role_switch(struct device *dev)
> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct device_node *parent;
> +	struct device_node *child;
> +	bool ret =3D false;
> +	const char *role_type =3D NULL;
> +
> +	child =3D of_graph_get_endpoint_by_regs(np, -1, -1);
> +	if (!child)
> +		return ret;
> +
> +	parent =3D of_graph_get_remote_port_parent(child);
> +	of_node_put(child);
> +	child =3D of_get_child_by_name(parent, "connector");
> +	of_node_put(parent);
> +	if (!child)
> +		return ret;
> +
> +	if (of_device_is_compatible(child, "usb-c-connector")) {
> +		of_property_read_string(child, "data-role", &role_type);
> +		if (role_type && (!strncmp(role_type, "dual", strlen("dual"))))
> +			ret =3D true;
> +	}
> +
> +	of_node_put(child);
> +	return ret;
> +}
> +
>  static int renesas_usb3_probe(struct platform_device *pdev)
>  {
>  	struct renesas_usb3 *usb3;
> @@ -2741,6 +2842,12 @@ static int renesas_usb3_probe(struct platform_devi=
ce *pdev)
>  	if (ret < 0)
>  		goto err_dev_create;
>=20
> +	if (device_property_read_bool(&pdev->dev, "usb-role-switch") &&
> +	    is_usb_dual_role_switch(&pdev->dev)) {

I think either one of the conditions is enough. (Only "usb-role-switch"
checking is enough, IIUC).

JFYI, according to the binding document [1], this "usb-role-switch" means:
---
+ - usb-role-switch: boolean, indicates that the device is capable of assig=
ning
+			the USB data role (USB host or USB device) for a given
+			USB connector, such as Type-C, Type-B(micro).
+			see connector/usb-connector.txt.
---

So, R-Car Gen3 / Salvator-XS cannot have this property because the board
has Type-A connector.

[1] https://patchwork.kernel.org/patch/10934835/

> +		usb3->dual_role_sw =3D true;

So, "role_sw_by_connector" matches with my image.
What do you think?

Best regards,
Yoshihiro Shimoda

> +		renesas_usb3_role_switch_desc.fwnode =3D dev_fwnode(&pdev->dev);
> +	}
> +
>  	INIT_WORK(&usb3->role_work, renesas_usb3_role_work);
>  	usb3->role_sw =3D usb_role_switch_register(&pdev->dev,
>  					&renesas_usb3_role_switch_desc);
> --
> 2.7.4

