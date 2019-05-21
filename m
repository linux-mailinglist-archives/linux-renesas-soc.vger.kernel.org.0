Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 031A7248C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 09:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbfEUHKX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 03:10:23 -0400
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:2631
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726138AbfEUHKX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 03:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3HneZKs86PJ3dcOh5GVR1cjoc/e3Z9uWxYAIUgA/sw=;
 b=BZWKfzpLGze4ZNAbT5gYurxuXPECvzK21uTwCd7cXB3JBkpMzScM6umslysd83X8TukF34V6b0oIrYEQV76/YNy+mQe8qOpn4pTRWyZdk/ua2aH/hwWftMrRsnUq8AyJby6EP+Pl2fh9c+cx+6o/O+oi6BMg60s2oSYQJhNGl58=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3096.jpnprd01.prod.outlook.com (52.134.254.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Tue, 21 May 2019 07:10:15 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 07:10:15 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v6 4/7] usb: gadget: udc: renesas_usb3: Add dual role
 switch support
Thread-Topic: [PATCH v6 4/7] usb: gadget: udc: renesas_usb3: Add dual role
 switch support
Thread-Index: AQHVCxgUjGBFyy+W/kyDDfYy1oCZIKZ1G5eAgAANH5A=
Date:   Tue, 21 May 2019 07:10:15 +0000
Message-ID: <OSBPR01MB21032BF17963E11F3D2F7B39B8070@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-5-git-send-email-biju.das@bp.renesas.com>
 <OSAPR01MB30890B5983EEAD2536D01A05D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB30890B5983EEAD2536D01A05D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d93ac8b0-dfa5-4a0b-a557-08d6ddbb5fd1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3096;
x-ms-traffictypediagnostic: OSBPR01MB3096:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <OSBPR01MB30961EE1FDA1570DF1E2B17FB8070@OSBPR01MB3096.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(39860400002)(396003)(346002)(136003)(189003)(51914003)(199004)(33656002)(14444005)(52536014)(54906003)(476003)(55016002)(256004)(486006)(110136005)(71200400001)(71190400001)(74316002)(9686003)(76176011)(102836004)(3846002)(5660300002)(6506007)(53546011)(44832011)(5024004)(99286004)(6306002)(7696005)(6116002)(53936002)(81166006)(81156014)(316002)(186003)(229853002)(25786009)(8676002)(2906002)(8936002)(478600001)(14454004)(6246003)(7736002)(305945005)(66946007)(66066001)(11346002)(86362001)(68736007)(66446008)(64756008)(66476007)(66556008)(76116006)(73956011)(7416002)(4326008)(26005)(6436002)(446003)(966005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3096;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kcDYKA+YwPUsaGSpuFzUDouFlcubkZAaZbUeFy54A+zmJg+Qv5Ip0W0tWVo99g4itQKvIT02osyvje/HBAbbby64ATKEnT11PE3r0bfMRA6UmI1GhzDXw5CbNT6CF3vXZq2Pro7XAho613IgzxIdwKQF7fI2jfg00Yu0EU8wH61OJgKfnW5NcS0lktSFp6LwE6++bHgUI3uAP0d3Qyl25sCfrG8RCqERhmgjxdJL9v777oBFLauSJ9oHLJT9gUQlKCLboaXZKHZZMBlyrAMHy8VoRZmKOMpmgsQDeHp3FEhNQMfp1sXS89ksQU9AmnSk5xmuHR92LJwBHPyAFx8Br3CiTBb+Q1lXfK+/8oV1REw4wZM+RQokbSmuuLMNZEuxRe06JKnGsd2qzUsck0DccAzasgw9z1xVbxLhGFSL+To=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93ac8b0-dfa5-4a0b-a557-08d6ddbb5fd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 07:10:15.3602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3096
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-San,

Thanks for the feedback.

> > From: Biju Das, Sent: Wednesday, May 15, 2019 9:09 PM
> > Subject: [PATCH v6 4/7] usb: gadget: udc: renesas_usb3: Add dual role
> > switch support
>=20
> Now I'm confusing about the "Add dual role switch support" mean...
> Especially, this driver has already supports dual role switch support by =
own
> sysfs or debugfs.

Sorry for the confusion.=20
What about "Enhance role switch support" ?

> > The RZ/G2E cat874 board has a type-c connector connected to hd3ss3220
> > usb type-c drp port controller. This patch adds dual role switch
> > support for the type-c connector using the usb role switch class framew=
ork.
>=20
> IIUC, after this patch is applied, the hs3ss3220 type-c driver can switch=
 the
> role by using the usb role switch class framework.

Yes, That is correct. HD3SS3220 driver detects host/device  connection even=
ts (attach/detach) and=20
It calls "usb_role_switch_set_role"  to assign/switch the role.

> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  V5-->V6
> >    * Added graph api's to find the role supported by the connector.
> >  V4-->V5
> >    * Incorporated Shimoda-san's review comment
> >     (https://patchwork.kernel.org/patch/10902537/)
> >  V3-->V4
> >    * No Change
> >  V2-->V3
> >    * Incorporated Shimoda-san's review comment
> >      (https://patchwork.kernel.org/patch/10852507/)
> >    * Used renesas,usb-role-switch property for differentiating USB
> >      role switch associated with Type-C port controller driver.
> >  V1-->V2
> >    * Driver uses usb role clas for handling dual role switch and handli=
ng
> >      connect/disconnect events instead of extcon.
> > ---
> >  drivers/usb/gadget/udc/renesas_usb3.c | 121
> > ++++++++++++++++++++++++++++++++--
> >  1 file changed, 114 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/udc/renesas_usb3.c
> > b/drivers/usb/gadget/udc/renesas_usb3.c
> > index 7dc2485..1d41998 100644
> > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/usb/ch9.h>
> >  #include <linux/usb/gadget.h>
> >  #include <linux/usb/of.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/usb/role.h>
> >
> >  /* register definitions */
> > @@ -351,6 +352,8 @@ struct renesas_usb3 {
> >  	int disabled_count;
> >
> >  	struct usb_request *ep0_req;
> > +
> > +	enum usb_role connection_state;
> >  	u16 test_mode;
> >  	u8 ep0_buf[USB3_EP0_BUF_SIZE];
> >  	bool softconnect;
> > @@ -359,6 +362,7 @@ struct renesas_usb3 {
> >  	bool extcon_usb;		/* check vbus and set EXTCON_USB
> */
> >  	bool forced_b_device;
> >  	bool start_to_connect;
> > +	bool dual_role_sw;
>=20
> I'm also confusing this name.

OK. will change it to "role_sw_by_connector"

> >  };
> >
> >  #define gadget_to_renesas_usb3(_gadget)	\
> <snip>
> > @@ -699,8 +703,10 @@ static void usb3_mode_config(struct renesas_usb3
> *usb3, bool host, bool a_dev)
> >  	unsigned long flags;
> >
> >  	spin_lock_irqsave(&usb3->lock, flags);
> > -	usb3_set_mode_by_role_sw(usb3, host);
> > -	usb3_vbus_out(usb3, a_dev);
> > +	if (!usb3->dual_role_sw || usb3->connection_state !=3D
> USB_ROLE_NONE) {
> > +		usb3_set_mode_by_role_sw(usb3, host);
> > +		usb3_vbus_out(usb3, a_dev);
> > +	}
> >  	/* for A-Peripheral or forced B-device mode */
> >  	if ((!host && a_dev) || usb3->start_to_connect)
> >  		usb3_connect(usb3);
> > @@ -716,7 +722,8 @@ static void usb3_check_id(struct renesas_usb3
> > *usb3)  {
> >  	usb3->extcon_host =3D usb3_is_a_device(usb3);
> >
> > -	if (usb3->extcon_host && !usb3->forced_b_device)
> > +	if ((!usb3->dual_role_sw && usb3->extcon_host && !usb3-
> >forced_b_device)
> > +	    || usb3->connection_state =3D=3D USB_ROLE_HOST)
> >  		usb3_mode_config(usb3, true, true);
> >  	else
> >  		usb3_mode_config(usb3, false, false); @@ -2343,14 +2350,65
> @@
> > static enum usb_role renesas_usb3_role_switch_get(struct device *dev)
> >  	return cur_role;
> >  }
> >
> > -static int renesas_usb3_role_switch_set(struct device *dev,
> > -					enum usb_role role)
> > +static void handle_ext_role_switch_states(struct device *dev,
> > +					    enum usb_role role)
> > +{
> > +	struct renesas_usb3 *usb3 =3D dev_get_drvdata(dev);
> > +	struct device *host =3D usb3->host_dev;
> > +	enum usb_role cur_role =3D renesas_usb3_role_switch_get(dev);
> > +
> > +	switch (role) {
> > +	case USB_ROLE_NONE:
> > +		usb3->connection_state =3D USB_ROLE_NONE;
> > +		if (usb3->driver)
> > +			usb3_disconnect(usb3);
> > +		usb3_vbus_out(usb3, false);
> > +		break;
> > +	case USB_ROLE_DEVICE:
> > +		if (usb3->connection_state =3D=3D USB_ROLE_NONE) {
> > +			usb3->connection_state =3D USB_ROLE_DEVICE;
> > +			usb3_set_mode(usb3, false);
> > +			if (usb3->driver)
> > +				usb3_connect(usb3);
> > +		} else if (cur_role =3D=3D USB_ROLE_HOST)  {
> > +			device_release_driver(host);
> > +			usb3_set_mode(usb3, false);
> > +			if (usb3->driver)
> > +				usb3_connect(usb3);
> > +		}
> > +		usb3_vbus_out(usb3, false);
> > +		break;
> > +	case USB_ROLE_HOST:
> > +		if (usb3->connection_state =3D=3D USB_ROLE_NONE) {
> > +			if (usb3->driver)
> > +				usb3_disconnect(usb3);
> > +
> > +			usb3->connection_state =3D USB_ROLE_HOST;
> > +			usb3_set_mode(usb3, true);
> > +			usb3_vbus_out(usb3, true);
> > +			if (device_attach(host) < 0)
> > +				dev_err(dev, "device_attach(host)
> failed\n");
> > +		} else if (cur_role =3D=3D USB_ROLE_DEVICE) {
> > +			usb3_disconnect(usb3);
> > +			/* Must set the mode before device_attach of the
> host */
> > +			usb3_set_mode(usb3, true);
> > +			/* This device_attach() might sleep */
> > +			if (device_attach(host) < 0)
> > +				dev_err(dev, "device_attach(host)
> failed\n");
> > +		}
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> > +static void handle_role_switch_states(struct device *dev,
> > +					    enum usb_role role)
> >  {
> >  	struct renesas_usb3 *usb3 =3D dev_get_drvdata(dev);
> >  	struct device *host =3D usb3->host_dev;
> >  	enum usb_role cur_role =3D renesas_usb3_role_switch_get(dev);
> >
> > -	pm_runtime_get_sync(dev);
> >  	if (cur_role =3D=3D USB_ROLE_HOST && role =3D=3D USB_ROLE_DEVICE) {
> >  		device_release_driver(host);
> >  		usb3_set_mode(usb3, false);
> > @@ -2361,6 +2419,20 @@ static int renesas_usb3_role_switch_set(struct
> device *dev,
> >  		if (device_attach(host) < 0)
> >  			dev_err(dev, "device_attach(host) failed\n");
> >  	}
> > +}
> > +
> > +static int renesas_usb3_role_switch_set(struct device *dev,
> > +					enum usb_role role)
> > +{
> > +	struct renesas_usb3 *usb3 =3D dev_get_drvdata(dev);
> > +
> > +	pm_runtime_get_sync(dev);
> > +
> > +	if (usb3->dual_role_sw)
> > +		handle_ext_role_switch_states(dev, role);
> > +	else
> > +		handle_role_switch_states(dev, role);
> > +
> >  	pm_runtime_put(dev);
> >
> >  	return 0;
> > @@ -2650,12 +2722,41 @@ static const unsigned int renesas_usb3_cable[]
> =3D {
> >  	EXTCON_NONE,
> >  };
> >
> > -static const struct usb_role_switch_desc
> > renesas_usb3_role_switch_desc =3D {
> > +static struct usb_role_switch_desc renesas_usb3_role_switch_desc =3D {
> >  	.set =3D renesas_usb3_role_switch_set,
> >  	.get =3D renesas_usb3_role_switch_get,
> >  	.allow_userspace_control =3D true,
> >  };
> >
> > +static bool is_usb_dual_role_switch(struct device *dev) {
> > +	struct device_node *np =3D dev->of_node;
> > +	struct device_node *parent;
> > +	struct device_node *child;
> > +	bool ret =3D false;
> > +	const char *role_type =3D NULL;
> > +
> > +	child =3D of_graph_get_endpoint_by_regs(np, -1, -1);
> > +	if (!child)
> > +		return ret;
> > +
> > +	parent =3D of_graph_get_remote_port_parent(child);
> > +	of_node_put(child);
> > +	child =3D of_get_child_by_name(parent, "connector");
> > +	of_node_put(parent);
> > +	if (!child)
> > +		return ret;
> > +
> > +	if (of_device_is_compatible(child, "usb-c-connector")) {
> > +		of_property_read_string(child, "data-role", &role_type);
> > +		if (role_type && (!strncmp(role_type, "dual",
> strlen("dual"))))
> > +			ret =3D true;
> > +	}
> > +
> > +	of_node_put(child);
> > +	return ret;
> > +}
> > +
> >  static int renesas_usb3_probe(struct platform_device *pdev)  {
> >  	struct renesas_usb3 *usb3;
> > @@ -2741,6 +2842,12 @@ static int renesas_usb3_probe(struct
> platform_device *pdev)
> >  	if (ret < 0)
> >  		goto err_dev_create;
> >
> > +	if (device_property_read_bool(&pdev->dev, "usb-role-switch") &&
> > +	    is_usb_dual_role_switch(&pdev->dev)) {
>=20
> I think either one of the conditions is enough. (Only "usb-role-switch"
> checking is enough, IIUC).

OK, Will remove the other check.

> JFYI, according to the binding document [1], this "usb-role-switch" means=
:
> ---
> + - usb-role-switch: boolean, indicates that the device is capable of ass=
igning
> +			the USB data role (USB host or USB device) for a
> given
> +			USB connector, such as Type-C, Type-B(micro).
> +			see connector/usb-connector.txt.
> ---
>=20
> So, R-Car Gen3 / Salvator-XS cannot have this property because the board
> has Type-A connector.
>=20
> [1] https://patchwork.kernel.org/patch/10934835/

I have updated the  binding patch to cover this[1]
[1]. https://patchwork.kernel.org/patch/10944631/
Are you ok with this binding patch?

> > +		usb3->dual_role_sw =3D true;
>=20
> So, "role_sw_by_connector" matches with my image.
> What do you think?

OK, will use " role_sw_by_connector"

Regards,
Biju
=20
> > +		renesas_usb3_role_switch_desc.fwnode =3D
> dev_fwnode(&pdev->dev);
> > +	}
> > +
> >  	INIT_WORK(&usb3->role_work, renesas_usb3_role_work);
> >  	usb3->role_sw =3D usb_role_switch_register(&pdev->dev,
> >  					&renesas_usb3_role_switch_desc);
> > --
> > 2.7.4

