Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B79AD360
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 09:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfIIHFG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 03:05:06 -0400
Received: from mail-eopbgr1400100.outbound.protection.outlook.com ([40.107.140.100]:60960
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727251AbfIIHFG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 03:05:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0cYxrj+5XDXbGItox81c8XbV1kuFPL3isYtO15sxe2dU7ONsf9PD+xLDTebhoGyvpSc5fUAcVhGXS5KqFQgVJvlR6rL6HOOiecCj3YM2HJXCtvflvrOVaryTw0CII2JPB+NSIjPP5p1N+Kuj73XkyOcdhrR5lzBVDPgpj+LxRPQZBzpyEpB164moFuOoaMA9mddc2f1B8VjIMgSrufKlA7lbTt+ec/f2LtFB54FR9yKE3BpEVr3/vnwZM1WECz2no1he4bjz6nqknRyj/2lU5WOTXXGgM4KknQw38uVoLEmRwUnmPQ2ZVuZpWO4sbttpj9ep3hx2M3TXYaNpaLUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HZdlPQuuPmPWbOrWmgjFPtQ/gkTPKil3xfyMUrlXxc=;
 b=equwO5Lzql+HE7CC656jM5puElsI7iy3e18MLm5X45cwIuwP2+8kB53jBnZsObzTyYwKm1NHHR1Tr87gBGLqI6Nr4kqQFWMg7PT8ebvGZ4pdnOGnmF0K0c081CBkaf5ijJj/TIgTR3DDcX14YQPdnESz7/iyYGphSynZifHNlxhrzgXAVdJK46Bk2rZY3pQ7xPO8pT4MB5DoYZLa6mzIUXHXOHSS/Nb2+5RlrjnG6M2cmFY6ApARXlr2zOEWNBTa3W/xNDpxsPNowXYil408ceb7DTyeBYPCjdMOUhYp49ALyPOoOQUuvkpMPAH+1Z2GIzfHOttW30RDyBHvyJVqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HZdlPQuuPmPWbOrWmgjFPtQ/gkTPKil3xfyMUrlXxc=;
 b=SPF6mCW7y+nGEr9mswkOQfFA1UztjdkbDa+S66Zr42b+JIcQ8VZ48mhNHA+MER0ssXgi44fuFgEJD6Oetb7SfvudswcuR/bo6KwkBdJqQGrr3UDhTnRE3QTvxO9MBCKiNx2KBXMR9iRMS5UJ02iBwa0NLSOlp3UIBqlCC1A9Q6s=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4094.jpnprd01.prod.outlook.com (20.178.137.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.19; Mon, 9 Sep 2019 07:05:01 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 07:05:01 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: RE: [PATCH v2 3/3] usb: renesas_usbhs: add suspend event support in
 gadget mode
Thread-Topic: [PATCH v2 3/3] usb: renesas_usbhs: add suspend event support in
 gadget mode
Thread-Index: AQHVZKtEyHZbagiOskmCONkzwzMGQKci7+Wg
Date:   Mon, 9 Sep 2019 07:05:01 +0000
Message-ID: <TYAPR01MB45442C64F7971045C9321949D8B70@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1567771431-13235-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <1567771431-13235-3-git-send-email-external.veeraiyan.c@de.adit-jv.com>
In-Reply-To: <1567771431-13235-3-git-send-email-external.veeraiyan.c@de.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5fa618e-57c4-41a0-1847-08d734f408ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4094;
x-ms-traffictypediagnostic: TYAPR01MB4094:|TYAPR01MB4094:
x-ms-exchange-purlcount: 1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB40949450C04793E18C46FF98D8B70@TYAPR01MB4094.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(189003)(199004)(107886003)(14454004)(52536014)(6116002)(3846002)(2906002)(486006)(15650500001)(229853002)(71200400001)(5660300002)(6436002)(66066001)(446003)(76116006)(11346002)(476003)(316002)(110136005)(54906003)(25786009)(6246003)(4326008)(6506007)(53936002)(186003)(55236004)(102836004)(81156014)(81166006)(478600001)(256004)(74316002)(71190400001)(14444005)(8936002)(7696005)(76176011)(26005)(6306002)(55016002)(33656002)(9686003)(66446008)(64756008)(66556008)(66476007)(66946007)(86362001)(966005)(8676002)(305945005)(7736002)(99286004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4094;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YZWK5LAuUe8r/0b18n3MLMWhnJbN3K5KTBWdgyvtd0szx+VLvbZtK2I64ilxNW1cBPomZNNy8TMhqeitXxylcwCEEKQnHNlR6e1WOcRuif5vdF6npY2u30GaTFsOmC192opRj12lsPe5FY3oLWqQZyemQeo7Jrc7lQHjWPqZr0x7Ps5CrRED/F8hIcPoBeVHtuFz1zWKUHSihVLsBbeelpc+Q/DL6JbUh1ZPoVdFZQqPqC4Jz2ZHCp0SndszblhiX76ENg8YXmkipQO7L3IskoyVH5xtIPfWn5yZHCMPGGvp6DBwAVUgkHJOfyk4X5Y3UBSGsnOjWdgg4FYK3nbLxHptepLT+KluZ7bG1/zA4dJEqaBRfv71JFLT/+Bq+6Sb/mghkrX3bOaEz5cAalvVwlZI8cWKQG7FNtn7My2G134=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fa618e-57c4-41a0-1847-08d734f408ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 07:05:01.6806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kfZcDB6ZgTOyYQnf4v0+FtkWT/SZWRFX9bX9bpH/BglpzJIOVbdxd4apEuetQLxgfqHk/InKljUNVVtHhygiccbfiWWOzQ/E8eLcnVg5zfk56hNjt4YEVSuTDbKEMnjR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4094
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan,

Thank you for your patch!

> From: Veeraiyan Chidambaram, Sent: Friday, September 6, 2019 9:04 PM
<snip>
> When R-Car Gen3 USB 3.0 is in Gadget mode, if host is detached an interru=
pt

This should be "USB 2.0" instead of "USB 3.0".

Best regards,
Yoshihiro Shimoda

> will be generated and Suspended state bit is set in interrupt status
> register. Interrupt handler will call driver->suspend(composite_suspend)
> if suspended state bit is set. composite_suspend will call
> ffs_func_suspend which will post FUNCTIONFS_SUSPEND and will be consumed
> by user space application via /dev/ep0.
>=20
> To be able to detect host detach, extend the DVSQ_MASK to cover the
> Suspended bit of the DVSQ[2:0] bitfield from the Interrupt Status
> Register 0 (INTSTS0) register and perform appropriate action in the
> DVST interrupt handler (usbhsg_irq_dev_state).
>=20
> Without this commit, disconnection of the phone from R-Car H3 ES2.0
> Salvator-X CN9 port is not recognized and reverse role switch does
> not not happen. If phone is connected again it does not enumerate.
>=20
> With this commit, disconnection will be recognized and reverse role
> switch will happen by a user space application. If phone is connected
> again it will enumerate properly and will become visible in the output
> of 'lsusb'.
>=20
> Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
> v2: if conditions changed
> v1: https://patchwork.kernel.org/patch/10581489/
>=20
>  drivers/usb/renesas_usbhs/common.h     |  3 ++-
>  drivers/usb/renesas_usbhs/mod_gadget.c | 12 +++++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usb=
hs/common.h
> index 3777af848a35..142319c7585d 100644
> --- a/drivers/usb/renesas_usbhs/common.h
> +++ b/drivers/usb/renesas_usbhs/common.h
> @@ -159,11 +159,12 @@ struct usbhs_priv;
>  #define VBSTS	(1 << 7)	/* VBUS_0 and VBUSIN_0 Input Status */
>  #define VALID	(1 << 3)	/* USB Request Receive */
>=20
> -#define DVSQ_MASK		(0x3 << 4)	/* Device State */
> +#define DVSQ_MASK		(0x7 << 4)	/* Device State */
>  #define  POWER_STATE		(0 << 4)
>  #define  DEFAULT_STATE		(1 << 4)
>  #define  ADDRESS_STATE		(2 << 4)
>  #define  CONFIGURATION_STATE	(3 << 4)
> +#define  SUSPENDED_STATE	(4 << 4)
>=20
>  #define CTSQ_MASK		(0x7)	/* Control Transfer Stage */
>  #define  IDLE_SETUP_STAGE	0	/* Idle stage or setup stage */
> diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas=
_usbhs/mod_gadget.c
> index 34ee9ebe12a3..d8972ab3c2f9 100644
> --- a/drivers/usb/renesas_usbhs/mod_gadget.c
> +++ b/drivers/usb/renesas_usbhs/mod_gadget.c
> @@ -456,12 +456,18 @@ static int usbhsg_irq_dev_state(struct usbhs_priv *=
priv,
>  {
>  	struct usbhsg_gpriv *gpriv =3D usbhsg_priv_to_gpriv(priv);
>  	struct device *dev =3D usbhsg_gpriv_to_dev(gpriv);
> +	int state =3D usbhs_status_get_device_state(irq_state);
>=20
>  	gpriv->gadget.speed =3D usbhs_bus_get_speed(priv);
>=20
> -	dev_dbg(dev, "state =3D %x : speed : %d\n",
> -		usbhs_status_get_device_state(irq_state),
> -		gpriv->gadget.speed);
> +	dev_dbg(dev, "state =3D %x : speed : %d\n", state, gpriv->gadget.speed)=
;
> +
> +	if (gpriv->gadget.speed !=3D USB_SPEED_UNKNOWN &&
> +	    (state & SUSPENDED_STATE)) {
> +		if (gpriv->driver && gpriv->driver->suspend)
> +			gpriv->driver->suspend(&gpriv->gadget);
> +		usb_gadget_set_state(&gpriv->gadget, USB_STATE_SUSPENDED);
> +	}
>=20
>  	return 0;
>  }
> --
> 2.7.4

