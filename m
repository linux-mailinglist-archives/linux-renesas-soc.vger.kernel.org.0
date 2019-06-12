Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C22541F79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 10:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731793AbfFLInN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 04:43:13 -0400
Received: from mail-eopbgr1410105.outbound.protection.outlook.com ([40.107.141.105]:32801
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731716AbfFLInL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 04:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrHpEKaDHQ6xd7M/OnvyEqmZek/qa6XDjWDwbiYQKjM=;
 b=nuUGVJ8T4OoaLpmx67xdwA9wGIIv3PzpLGGkN7dgAEyUKJhz4cxWf+fPw0jtR/mPjUXLVIs4JEl4VdL7UfIEd47O69s9euFwvEVteoIECidcgVR18vLp6erlMKadKK1WUDqXxReOi7y7RckWxeFI2GChXr8BY3jNcBC2qRxfmu4=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2246.jpnprd01.prod.outlook.com (52.134.242.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Wed, 12 Jun 2019 08:42:48 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 08:42:48 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-C DRP
 port controller
Thread-Topic: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-C
 DRP port controller
Thread-Index: AQHVF5i4H7iFvw/OZk6CzzYV6n6nWKaXwXcAgAADzjA=
Date:   Wed, 12 Jun 2019 08:42:47 +0000
Message-ID: <OSBPR01MB21037C117F1E7125615AB643B8EC0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-4-git-send-email-biju.das@bp.renesas.com>
 <20190612082502.GB18301@kuha.fi.intel.com>
In-Reply-To: <20190612082502.GB18301@kuha.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a7d4df6-184c-4067-e1c7-08d6ef11f271
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:OSBPR01MB2246;
x-ms-traffictypediagnostic: OSBPR01MB2246:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <OSBPR01MB22461BC098CC1C9515690FA5B8EC0@OSBPR01MB2246.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(136003)(346002)(39860400002)(366004)(199004)(189003)(81166006)(25786009)(76176011)(6306002)(476003)(64756008)(81156014)(9686003)(68736007)(55016002)(478600001)(256004)(6506007)(486006)(7696005)(54906003)(8676002)(76116006)(86362001)(66556008)(66946007)(4326008)(102836004)(66476007)(44832011)(6246003)(66446008)(305945005)(8936002)(7736002)(53936002)(446003)(11346002)(186003)(229853002)(6436002)(71190400001)(2906002)(30864003)(33656002)(14454004)(71200400001)(99286004)(74316002)(66066001)(14444005)(52536014)(316002)(73956011)(26005)(6916009)(5024004)(5660300002)(7416002)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2246;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wqms96tsXmbj9ToXNB+6u/7xJ0aBVlI6kc/8QHddG9Jn+a6CSlnuepMwSb5vCtF4i77dXrQSo8xoo70fx3I3cXPHA7mFD37PdCoBdMpRqNhxdz0zpmUkDPtzgkd1tPkAI9bwXB4yMZGkIXIAFl5PgaV5p+JHqe2LT6Pvn05DaLZ4oH4ONdAs8wGcZa2tJDJDy5UnFILIy01450wS8r1bpLivrivZCbbUwWohbGG0diM8ltMwyHiGbxMVaMYd8Q2jTYCL0VdVQszI1oDj+Cxq77FBxDEN5HxTL6f7K1pjEAzO7KdY0kkjQsnsxVUDGCaCuNwWinQDhqZJFzZq0wL5npY3kyjOcPc8x6iHQ2K7VOy1WVecUZ/+Cv1xmjgQT/m+5dvfc/IJUhUFBODkVhMpiUtUyMa2dhQg+StWcPS++Dg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7d4df6-184c-4067-e1c7-08d6ef11f271
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 08:42:47.8097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2246
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Heikki,

> Subject: Re: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-=
C
> DRP port controller
>=20
> On Fri, May 31, 2019 at 10:59:56AM +0100, Biju Das wrote:
> > Driver for TI HD3SS3220 USB Type-C DRP port controller.
> >
> > The driver currently registers the port and supports data role swapping=
.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>=20
> Acked-by; Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks.  I believe there is a typo  it should be ":"  instead of ";" .

Regards,
Biju

> > ---
> >  V6-->V7
> >   * Rebased on below patch
> >     (https://patchwork.kernel.org/patch/10966313/)
> >   * Removed Heikki's reviewed by tag,since there is a rework.
> >  V5-->V6
> >    * No change
> >  V4-->V5
> >    * Incorporated Heikki's review comment
> >      (https://patchwork.kernel.org/patch/10902531/)
> >    * Added Heikki's Reviewed-by tag
> >  V3-->V4
> >    * Incorporated Chunfeng Yun's review comment
> >    * Used fwnode API's to get usb role switch handle.
> >
> >  V2-->V3
> >    * Used the new api "usb_role_switch by node" for getting
> >      remote endpoint associated with Type-C USB DRP port
> >      controller devices.
> >  V1-->V2
> >    * Driver uses usb role class instead of extcon for dual role switch
> >      and also handles connect/disconnect events.
> > ---
> >  drivers/usb/typec/Kconfig     |  10 ++
> >  drivers/usb/typec/Makefile    |   1 +
> >  drivers/usb/typec/hd3ss3220.c | 259
> > ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 270 insertions(+)
> >  create mode 100644 drivers/usb/typec/hd3ss3220.c
> >
> > diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> > index 89d9193..92a3717 100644
> > --- a/drivers/usb/typec/Kconfig
> > +++ b/drivers/usb/typec/Kconfig
> > @@ -50,6 +50,16 @@ source "drivers/usb/typec/tcpm/Kconfig"
> >
> >  source "drivers/usb/typec/ucsi/Kconfig"
> >
> > +config TYPEC_HD3SS3220
> > +	tristate "TI HD3SS3220 Type-C DRP Port controller driver"
> > +	depends on I2C
> > +	help
> > +	  Say Y or M here if your system has TI HD3SS3220 Type-C DRP Port
> > +	  controller driver.
> > +
> > +	  If you choose to build this driver as a dynamically linked module, =
the
> > +	  module will be called hd3ss3220.ko.
> > +
> >  config TYPEC_TPS6598X
> >  	tristate "TI TPS6598x USB Power Delivery controller driver"
> >  	depends on I2C
> > diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> > index 6696b72..7753a5c3 100644
> > --- a/drivers/usb/typec/Makefile
> > +++ b/drivers/usb/typec/Makefile
> > @@ -4,5 +4,6 @@ typec-y				:=3D class.o mux.o bus.o
> >  obj-$(CONFIG_TYPEC)		+=3D altmodes/
> >  obj-$(CONFIG_TYPEC_TCPM)	+=3D tcpm/
> >  obj-$(CONFIG_TYPEC_UCSI)	+=3D ucsi/
> > +obj-$(CONFIG_TYPEC_HD3SS3220)	+=3D hd3ss3220.o
> >  obj-$(CONFIG_TYPEC_TPS6598X)	+=3D tps6598x.o
> >  obj-$(CONFIG_TYPEC)		+=3D mux/
> > diff --git a/drivers/usb/typec/hd3ss3220.c
> > b/drivers/usb/typec/hd3ss3220.c new file mode 100644 index
> > 0000000..b8f247e
> > --- /dev/null
> > +++ b/drivers/usb/typec/hd3ss3220.c
> > @@ -0,0 +1,259 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * TI HD3SS3220 Type-C DRP Port Controller Driver
> > + *
> > + * Copyright (C) 2019 Renesas Electronics Corp.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/i2c.h>
> > +#include <linux/usb/role.h>
> > +#include <linux/irqreturn.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +#include <linux/usb/typec.h>
> > +#include <linux/delay.h>
> > +
> > +#define HD3SS3220_REG_CN_STAT_CTRL	0x09
> > +#define HD3SS3220_REG_GEN_CTRL		0x0A
> > +#define HD3SS3220_REG_DEV_REV		0xA0
> > +
> > +/* Register HD3SS3220_REG_CN_STAT_CTRL*/
> > +#define HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK
> 	(BIT(7) | BIT(6))
> > +#define HD3SS3220_REG_CN_STAT_CTRL_AS_DFP		BIT(6)
> > +#define HD3SS3220_REG_CN_STAT_CTRL_AS_UFP		BIT(7)
> > +#define HD3SS3220_REG_CN_STAT_CTRL_TO_ACCESSORY
> 	(BIT(7) | BIT(6))
> > +#define HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS		BIT(4)
> > +
> > +/* Register HD3SS3220_REG_GEN_CTRL*/
> > +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK
> 	(BIT(2) | BIT(1))
> > +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT	0x00
> > +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK	BIT(1)
> > +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC
> 	(BIT(2) | BIT(1))
> > +
> > +struct hd3ss3220 {
> > +	struct device *dev;
> > +	struct regmap *regmap;
> > +	struct usb_role_switch	*role_sw;
> > +	struct typec_port *port;
> > +	struct typec_capability typec_cap;
> > +};
> > +
> > +static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int
> > +src_pref) {
> > +	return regmap_update_bits(hd3ss3220->regmap,
> HD3SS3220_REG_GEN_CTRL,
> > +
> HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK,
> > +				  src_pref);
> > +}
> > +
> > +static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220
> > +*hd3ss3220) {
> > +	unsigned int reg_val;
> > +	enum usb_role attached_state;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(hd3ss3220->regmap,
> HD3SS3220_REG_CN_STAT_CTRL,
> > +			  &reg_val);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	switch (reg_val &
> HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK) {
> > +	case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
> > +		attached_state =3D USB_ROLE_HOST;
> > +		break;
> > +	case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
> > +		attached_state =3D USB_ROLE_DEVICE;
> > +		break;
> > +	default:
> > +		attached_state =3D USB_ROLE_NONE;
> > +		break;
> > +	}
> > +
> > +	return attached_state;
> > +}
> > +
> > +static int hd3ss3220_dr_set(const struct typec_capability *cap,
> > +			    enum typec_data_role role)
> > +{
> > +	struct hd3ss3220 *hd3ss3220 =3D container_of(cap, struct hd3ss3220,
> > +						   typec_cap);
> > +	enum usb_role role_val;
> > +	int pref, ret =3D 0;
> > +
> > +	if (role =3D=3D TYPEC_HOST) {
> > +		role_val =3D USB_ROLE_HOST;
> > +		pref =3D
> HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC;
> > +	} else {
> > +		role_val =3D USB_ROLE_DEVICE;
> > +		pref =3D
> HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK;
> > +	}
> > +
> > +	ret =3D hd3ss3220_set_source_pref(hd3ss3220, pref);
> > +	usleep_range(10, 100);
> > +
> > +	usb_role_switch_set_role(hd3ss3220->role_sw, role_val);
> > +	typec_set_data_role(hd3ss3220->port, role);
> > +
> > +	return ret;
> > +}
> > +
> > +static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220) {
> > +	enum usb_role role_state =3D
> hd3ss3220_get_attached_state(hd3ss3220);
> > +
> > +	usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
> > +	if (role_state =3D=3D USB_ROLE_NONE)
> > +		hd3ss3220_set_source_pref(hd3ss3220,
> > +
> 	HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
> > +
> > +	switch (role_state) {
> > +	case USB_ROLE_HOST:
> > +		typec_set_data_role(hd3ss3220->port, TYPEC_HOST);
> > +		break;
> > +	case USB_ROLE_DEVICE:
> > +		typec_set_data_role(hd3ss3220->port, TYPEC_DEVICE);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> > +irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220) {
> > +	int err;
> > +
> > +	hd3ss3220_set_role(hd3ss3220);
> > +	err =3D regmap_update_bits_base(hd3ss3220->regmap,
> > +				      HD3SS3220_REG_CN_STAT_CTRL,
> > +
> HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
> > +
> HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
> > +				      NULL, false, true);
> > +	if (err < 0)
> > +		return IRQ_NONE;
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static irqreturn_t hd3ss3220_irq_handler(int irq, void *data) {
> > +	struct i2c_client *client =3D to_i2c_client(data);
> > +	struct hd3ss3220 *hd3ss3220 =3D i2c_get_clientdata(client);
> > +
> > +	return hd3ss3220_irq(hd3ss3220);
> > +}
> > +
> > +static const struct regmap_config config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0x0A,
> > +};
> > +
> > +static int hd3ss3220_probe(struct i2c_client *client,
> > +		const struct i2c_device_id *id)
> > +{
> > +	struct hd3ss3220 *hd3ss3220;
> > +	struct fwnode_handle *connector;
> > +	int ret;
> > +	unsigned int data;
> > +
> > +	hd3ss3220 =3D devm_kzalloc(&client->dev, sizeof(struct hd3ss3220),
> > +				 GFP_KERNEL);
> > +	if (!hd3ss3220)
> > +		return -ENOMEM;
> > +
> > +	i2c_set_clientdata(client, hd3ss3220);
> > +
> > +	hd3ss3220->dev =3D &client->dev;
> > +	hd3ss3220->regmap =3D devm_regmap_init_i2c(client, &config);
> > +	if (IS_ERR(hd3ss3220->regmap))
> > +		return PTR_ERR(hd3ss3220->regmap);
> > +
> > +	hd3ss3220_set_source_pref(hd3ss3220,
> > +
> HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
> > +	connector =3D device_get_named_child_node(hd3ss3220->dev,
> "connector");
> > +	if (IS_ERR(connector))
> > +		return PTR_ERR(connector);
> > +
> > +	hd3ss3220->role_sw =3D fwnode_usb_role_switch_get(connector);
> > +	fwnode_handle_put(connector);
> > +	if (IS_ERR_OR_NULL(hd3ss3220->role_sw))
> > +		return PTR_ERR(hd3ss3220->role_sw);
> > +
> > +	hd3ss3220->typec_cap.prefer_role =3D TYPEC_NO_PREFERRED_ROLE;
> > +	hd3ss3220->typec_cap.dr_set =3D hd3ss3220_dr_set;
> > +	hd3ss3220->typec_cap.type =3D TYPEC_PORT_DRP;
> > +	hd3ss3220->typec_cap.data =3D TYPEC_PORT_DRD;
> > +
> > +	hd3ss3220->port =3D typec_register_port(&client->dev,
> > +					      &hd3ss3220->typec_cap);
> > +	if (IS_ERR(hd3ss3220->port))
> > +		return PTR_ERR(hd3ss3220->port);
> > +
> > +	hd3ss3220_set_role(hd3ss3220);
> > +	ret =3D regmap_read(hd3ss3220->regmap,
> HD3SS3220_REG_CN_STAT_CTRL, &data);
> > +	if (ret < 0)
> > +		goto error;
> > +
> > +	if (data & HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS) {
> > +		ret =3D regmap_write(hd3ss3220->regmap,
> > +				HD3SS3220_REG_CN_STAT_CTRL,
> > +				data |
> HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
> > +		if (ret < 0)
> > +			goto error;
> > +	}
> > +
> > +	if (client->irq > 0) {
> > +		ret =3D devm_request_threaded_irq(&client->dev, client->irq,
> NULL,
> > +					hd3ss3220_irq_handler,
> > +					IRQF_TRIGGER_FALLING |
> IRQF_ONESHOT,
> > +					"hd3ss3220", &client->dev);
> > +		if (ret)
> > +			goto error;
> > +	}
> > +
> > +	ret =3D i2c_smbus_read_byte_data(client, HD3SS3220_REG_DEV_REV);
> > +	if (ret < 0)
> > +		goto error;
> > +
> > +	dev_info(&client->dev, "probed revision=3D0x%x\n", ret);
> > +
> > +	return 0;
> > +error:
> > +	typec_unregister_port(hd3ss3220->port);
> > +	usb_role_switch_put(hd3ss3220->role_sw);
> > +
> > +	return ret;
> > +}
> > +
> > +static int hd3ss3220_remove(struct i2c_client *client) {
> > +	struct hd3ss3220 *hd3ss3220 =3D i2c_get_clientdata(client);
> > +
> > +	typec_unregister_port(hd3ss3220->port);
> > +	usb_role_switch_put(hd3ss3220->role_sw);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id dev_ids[] =3D {
> > +	{ .compatible =3D "ti,hd3ss3220"},
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, dev_ids);
> > +
> > +static struct i2c_driver hd3ss3220_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "hd3ss3220",
> > +		.of_match_table =3D of_match_ptr(dev_ids),
> > +	},
> > +	.probe =3D hd3ss3220_probe,
> > +	.remove =3D  hd3ss3220_remove,
> > +};
> > +
> > +module_i2c_driver(hd3ss3220_driver);
> > +
> > +MODULE_AUTHOR("Biju Das <biju.das@bp.renesas.com>");
> > +MODULE_DESCRIPTION("TI HD3SS3220 DRP Port Controller Driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.7.4
>=20
> thanks,
>=20
> --
> heikki
