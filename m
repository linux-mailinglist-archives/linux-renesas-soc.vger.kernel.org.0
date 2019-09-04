Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E488EA8214
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 14:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbfIDMIn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 08:08:43 -0400
Received: from mail-eopbgr1400109.outbound.protection.outlook.com ([40.107.140.109]:39184
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726943AbfIDMIn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 08:08:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btB3AOpE/YsQB6I6b2o/6sb/NYkoD42plfgyvMEdZydQBO4+HItFed4adhzfRF1imS+tiMZGjZEhOW1rTbPW6/qQtscfscUkEkmj/9LJUtOnsf/X+mxjmb8r9rvnJVebacEuad2SXh5/kyiEldKiDmxpFDyNJLwQyRFdtFm60AN5RV0v6mpD35SLeqSvZXS37Ms0tahZ5dTd42dIZZ9zHAKLgH8w94kc5QeSqAfVahb+e+DivdCZDz9VvVrwwx+shcnd441ssrMjqcdyvSSAhY6IvYhimx/YY9660Agf13lDSEpkO/vy2PMp9GbnWRSDWWbuYtso6SWMThYf3JYP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1R/UZTBk1EZVhxq/AgBJ0qH4J3h5ssCDTZ9JW1jJVlU=;
 b=gIibWJtjjv8alI3lv/mSfTMnxHFNSBIIt7EqR4pOCIoFzOCC4r0OvsVMZUUcFH+cIrIL//6Ed9NYBONzIKlQ/7piIltEmmO4/rnlzKgiiakCc4lQ93gj01o2A22Z2lpX8XP+T8M83k8FqHdoGun+JhJbBY/rDVHiogSborAz3CKa/P1vLrRTrJ4JVM4vZAEzD9CIJBo9nh0bhXiGZ6MM1u3e8ZhXdY+FO8QHfEXHjF8cAKoMPYjfPIocRfFOk2Nv4pjT3Sslf6ezrw55uRuWZrutyf9ty49StL/Wwy86q10gchwRmKpCue+PxCuCyCNUyh09ye4gAQsXHrEnxuNmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1R/UZTBk1EZVhxq/AgBJ0qH4J3h5ssCDTZ9JW1jJVlU=;
 b=skn5BjDkeJLLhOYmKydNIb4WiQ68yfdYxUI4rQKWCBWdz/Voh/yrKqSsan9AKjlMpsFZLSzjA4cvOoilzX6ZNTzIl8qLYp93qsZkMQQij3k4LwzruRCm2OXQyle6DqDf4fw1mwcsdUlajOu6NSF5BOhrvKwmtxoMBhk9J5+PiPI=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3374.jpnprd01.prod.outlook.com (20.178.139.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Wed, 4 Sep 2019 12:08:39 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 12:08:39 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: udc: renesas_usb3: add suspend event support
Thread-Topic: [PATCH] usb: gadget: udc: renesas_usb3: add suspend event
 support
Thread-Index: AQHVYwKLkKD2lws+YUOvQ9zWiSrhhKcbZrdA
Date:   Wed, 4 Sep 2019 12:08:39 +0000
Message-ID: <TYAPR01MB454435E0431173D3C7F76D65D8B80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1567589047-29816-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
In-Reply-To: <1567589047-29816-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a34ead71-2f24-40b9-9d30-08d731309f60
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3374;
x-ms-traffictypediagnostic: TYAPR01MB3374:|TYAPR01MB3374:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB3374B3C1D98E6292439C6D2AD8B80@TYAPR01MB3374.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(199004)(189003)(229853002)(478600001)(6916009)(14454004)(6116002)(3846002)(33656002)(25786009)(15650500001)(4326008)(53936002)(6436002)(6246003)(9686003)(2906002)(55016002)(11346002)(446003)(476003)(66476007)(66556008)(64756008)(66946007)(66446008)(99286004)(7736002)(305945005)(76116006)(26005)(74316002)(7696005)(76176011)(14444005)(256004)(186003)(54906003)(86362001)(102836004)(6506007)(5660300002)(66066001)(81166006)(81156014)(52536014)(71200400001)(71190400001)(8676002)(316002)(486006)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3374;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S762IQB+Q9LSWZLdWvmBlf5tGuO4Zvv4lq2TOokTsmy89tDteerVvhRqGKa6fNLGJqbqyZxIoCjr14Mh3sI80w2o/4TdpdH0PPFYzNJG0OB2FtfC7hhtuWcRL3dTJCi+jK9grCUnsjMxEOX518XBhnj3g4NgSO8OBTlGOkPO0btapESjBaTGyxgLRcKTEze4ThUW7Oa2+S1sYQ3vNdVq2iED6+Ke+GS7JGeQEreo+BwJmiro/rclppOIfwRRdHOcCOCxvZ1l/Jm/LAfbwrR0XxChGcOYMteaQrAun3euBunhaf0sfPqI1ms0py+vzagwKi2QY9MB0vY0fsf/4DbjComkAhF4idDJw9qvxYEz5ouL4UDL8OAzR865Q9qK0zt57lLRQ/u4zbl7HERJv46WJyphvvT4URp3xtgcC9SQkFA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34ead71-2f24-40b9-9d30-08d731309f60
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 12:08:39.7075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7kzA7r3wWNLhB0hPDnl/1zZ0uAe9KNCM33RBseS8O4KYdOIxFB1BvSJilZfN0dR3r7MlUiDXe1QRjBJGrKZw1dS0Y0vjiljWyS2KM3GgMrwUAnKGKcador3QZQW5YOfc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3374
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan,

Thank you very much for the patch! I didn't realize that using USB_INT_1_B2=
_SPND
can resolve such a behavior. I'd like to apply this patch into upstream, bu=
t
I have some comments below.

> From: Veeraiyan Chidambaram, Sent: Wednesday, September 4, 2019 6:24 PM
>=20
> In RCAR3 USB 3.0 Function, if host is detached an interrupt

I'd like to replace "RCAR3" with "R-Car Gen3".

> will be generated and Suspended state bit is set in interrupt status
> register. Interrupt handler will call driver->suspend(composite_suspend)
> if suspended state bit is set. composite_suspend will call
> ffs_func_suspend which will post FUNCTIONFS_SUSPEND and will be consumed
> by user space application via /dev/ep0.
>=20
> To be able to detect the host detach, USB_INT_1_B2_SPND to cover the
> Suspended bit of the B2_SPND_OUT[9] from the USB Status Register
> (USB_STA) register and perform appropriate action in the
> usb3_irq_epc_int_1 function.
>=20
> Without this commit, disconnection of the phone from R-Car-H3 ES2.0

s/R-Car-H3/R-Car H3/

> Salvator-X CN11 port is not recognized and reverse role switch does
> not happen. If phone is connected again it does not enumerate.
>=20
> With this commit, disconnection will be recognized and reverse role
> switch will happen. If phone is connected again it will enumerate

IIUC, reverse role switch will happen by a user space application.
Is it correct?

> properly and will become visible in the output of 'lsusb'.
>=20
> Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
> ---
>  drivers/usb/gadget/udc/renesas_usb3.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/u=
dc/renesas_usb3.c
> index eaa3339b30a2..4ec703e302f5 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -767,6 +767,19 @@ static void usb3_irq_epc_int_1_resume(struct renesas=
_usb3 *usb3)
>  	usb3_transition_to_default_state(usb3, false);
>  }
>=20
> +static void usb3_irq_epc_int_1_suspend(struct renesas_usb3 *usb3)
> +{
> +	usb3_disable_irq_1(usb3, USB_INT_1_B2_SPND);
> +
> +	if (usb3->driver &&
> +	    usb3->driver->suspend &&
> +	    usb3->gadget.speed !=3D USB_SPEED_UNKNOWN &&
> +	    usb3->gadget.state !=3D USB_STATE_NOTATTACHED) {
> +		usb3->driver->suspend(&usb3->gadget);
> +		usb_gadget_set_state(&usb3->gadget, USB_STATE_SUSPENDED);

I'd like to change the conditions like below if it still works on your envi=
ronment.
This is because I'd like to set the gadget state if other gadget driver exc=
ept f_fs
is used anyway. After that, a user also can recognize the state by using
/sys/devices/platform/soc/ee020000.usb/udc/ee020000.usb/state even if the u=
se
doesn't use f_fs driver.

	if (usb3->gadget.speed !=3D USB_SPEED_UNKNOWN &&
	    usb3->gadget.state !=3D USB_STATE_NOTATTACHED) {
		if (usb3->driver && usb3->driver->suspend)
			usb3->driver->suspend(&usb3->gadget);
		usb_gadget_set_state(&usb3->gadget, USB_STATE_SUSPENDED);
	}

Best regards,
Yoshihiro Shimoda

