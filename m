Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2168418C30
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 16:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfEIOmZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 10:42:25 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:28160
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726234AbfEIOmZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 10:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqwQfVQx/tyIvHYeftXGqv1wibvDjkOi0Gd7ejHkxX0=;
 b=GdnWAzlBCdFrkpWJORnXgtG14mETb7fmmngKROC/IcGbrxO4y0eB1SPjmDnBswljVKyJ6ZCGrqejUM8Un00neBpah99+s7myzb4BUVHdpNWC/AhKHwdhAmjfZJ/Adfx2IVRQN6YqkGI5fcwuULp/nkHLNEzexZe5snZrR0bW7/k=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1628.jpnprd01.prod.outlook.com (52.133.161.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Thu, 9 May 2019 14:42:20 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 14:42:20 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
Subject: RE: [PATCH 06/10] usb: renesas_usbhs: Add support for RZ/A2
Thread-Topic: [PATCH 06/10] usb: renesas_usbhs: Add support for RZ/A2
Thread-Index: AQHVBGYrI2C6wi6GUEeEvfBgdp4V36ZiYgMAgABJS4A=
Date:   Thu, 9 May 2019 14:42:19 +0000
Message-ID: <TY1PR01MB1562EAE92B76A5F3892865308A330@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-7-chris.brandt@renesas.com>
 <OSBPR01MB317436B70E57E04964BDDECED8330@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB317436B70E57E04964BDDECED8330@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad42fa74-1d41-4e84-bfcb-08d6d48c8a54
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1628;
x-ms-traffictypediagnostic: TY1PR01MB1628:
x-microsoft-antispam-prvs: <TY1PR01MB1628C44217D7CB970CFFF3538A330@TY1PR01MB1628.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(346002)(39860400002)(366004)(199004)(189003)(446003)(6862004)(486006)(229853002)(11346002)(66946007)(6246003)(476003)(73956011)(6636002)(66476007)(8676002)(64756008)(66446008)(25786009)(66556008)(8936002)(81156014)(81166006)(478600001)(186003)(9686003)(55016002)(2906002)(86362001)(26005)(72206003)(6506007)(76116006)(53936002)(68736007)(4326008)(102836004)(14444005)(256004)(305945005)(52536014)(33656002)(316002)(5660300002)(7736002)(74316002)(66066001)(71190400001)(71200400001)(6436002)(99286004)(7696005)(76176011)(3846002)(6116002)(54906003)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1628;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KvnXzQQUOMiUfnTbbGJ6qnnq8TnVGrgDB32+OZtfFL2Ls6e5aR8F9ymhkh1YtGFNt5GBwpSTotLLnEX4U2RSFIHZfNrZbs+woBOjlKHTf93wu6BclcaKX5SXfW+lR1c8JdkUffZPd3m2OkShCojeZilNxSukf60TqW3gAyugLKCAwtbLG0sGya6jz8acKtTZ6O+G7kKO2vGUp2g6AmOiIHWM8DLk2mL/3kd4kk2X5zxTRlzulrWWK5izeiEWwrv1gkxmEzx46SHssqw9k5mUPNl/SNJWtBSgXcdlTWyNLlUJQVxyjgvggXmm3yGFmSarudBAqWhpdrFp0VhLmqP9YZIAEf48miBsd+fZJfl8iVzYZ36g4g5YyG3ybYQeiTo54FIeQaafiizto/PCvku6pBg0VMCJcR5o3E5zWkxDZww=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad42fa74-1d41-4e84-bfcb-08d6d48c8a54
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 14:42:19.9732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1628
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda=1B$B$5$s!"=1B(B

> From: Yoshihiro Shimoda
> Sent: Thursday, May 09, 2019 3:04 AM

> > -/* status */
> > -#define usbhsc_flags_init(p)   do {(p)->flags =3D 0; } while (0)
> > -#define usbhsc_flags_set(p, b) ((p)->flags |=3D  (b))
> > -#define usbhsc_flags_clr(p, b) ((p)->flags &=3D ~(b))
> > -#define usbhsc_flags_has(p, b) ((p)->flags &   (b))
>=20
> I would like to separate this patch to some patches like below to review
> the patch(es) easily:
>=20
> 1. Just move these definitions to common.h.

FYI, checkpatch.pl says this:

  WARNING: Single statement macros should not use a do {} while (0) loop
  #122: FILE: drivers/usb/renesas_usbhs/common.h:350:
  +#define usbhsc_flags_init(p)   do {(p)->flags =3D 0; } while (0)

So, I will change this code to:

#define usbhsc_flags_init(p)   {(p)->flags =3D 0;}



> It's the same with RZA1. So, I think we can reuse the code like below.
> What do you think?
> +	if (dparam->type =3D=3D USBHS_TYPE_RZA1 ||
> +	    dparam->type =3D=3D USBHS_TYPE_RZA2) {
> 		dparam->pipe_configs =3D usbhsc_new_pipe;
> 		dparam->pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
> 	}

OK.

#At first, RZA2 had 'dparam->has_usb_dmac =3D 1'. But, DMA had some
 issues, so I removed it.



> I prefer to add "{ }" on "if" and "else" like below.
>=20
> 	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR)) {
> 		for (i =3D 0; i < len; i++)
> 			iowrite8(buf[i], addr + (i & 0x03));
> 	} else {
> 		for (i =3D 0; i < len; i++)
> 			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
> 	}

OK.
#I always prefer braces. It is easier to read.


> > +static int usbhs_rza2_power_ctrl(struct platform_device *pdev,
> > +				void __iomem *base, int enable)
> > +{
> > +	struct usbhs_priv *priv =3D usbhs_pdev_to_priv(pdev);
> > +	int retval =3D -ENODEV;
> > +
> > +	if (priv->phy) {
> > +		if (enable) {
> > +			retval =3D phy_init(priv->phy);
> > +			if (enable) {
> > +				usbhs_bset(priv, SUSPMODE, SUSPM, SUSPM);
> > +				/* Wait 100 usec for PLL to become stable */
> > +				udelay(100);
> > +			} else {
>=20
> This else code never runs. So,

Yes, thank you.

This code is ugly, so I'm going to change it.

Chris

