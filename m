Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7E3AA9839
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 04:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfIECJs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 22:09:48 -0400
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:8368
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726240AbfIECJr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 22:09:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsYL+MuM7Qw4P+YfsoJTy0tgGsv4aR52dzmbgkwFueFs6k0IMNU5XBVIJGbKS/adnBv7Ut2Q4cXlLc5FarA81ZSNHm7kVSXPaxFStiSpxalFLZniCQTvygp1laOi3wpr+GAjHbFqjvy3cVRGrDURWRh2O8ZW9lPgB7ga5VgJGxpPsVDMfUVCadEeuD3LMZiGiNh7Jw89Kqczsl1Xka2xh08tcuB+3joCBlpVF+9w8u9g5NKSqfJcd3gF9uMhdzGrljfwMYOumraEDtrbx6gP4pKCckGTii2k/JpxK6aydKm8k6oUrHdQamFLIq5xo6RE8ZMd4z7KWvpOlMxb3flXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jvKfLF2R+UpAfqE4o7aItd1RBKl3PXtgKTuVVNp9rc=;
 b=BFdlSY+Af0lNpu7obxJV+crdIYGGh8uVC5jt8Go0fqe2hx5P6N6JI6oW9cNkedROqcmv4juKR7PgnAG3fa3ywXWIFA5/o2SjVDuGWwHCsdWY0WWMTVIdmidHWDHYTCAhqXl0QIaCHlEeOExOo1GBuam79p10nqzCTmh8hza/egteexEorStedcZLN9cuembByKS+/DkYx8BMJXdTpxcOy/WkUVuvq2H0ULxeiNk7gQ7OtNLD/0pgSxtXzNI3+Xpgg6aPAvUBryMxcEQM0ZtD6T7xcD84tsqyA+yPNtiPmiZttpd8YHsYUQCSIXmdLaZXnMp19i/euTQRWFzR3kP2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jvKfLF2R+UpAfqE4o7aItd1RBKl3PXtgKTuVVNp9rc=;
 b=peXOxryPhTc5yKAV3G0jY8mdzurt8x18HTtsv4fBpiKoXKeld1zjixtrbrHA+0/lT7DpN5+FGcpvxzVIYoNwIfTkXe0CCs6zOmeT8OA8GCGo4vdjY8sEj1Dy273uSrcUheFvcdwisMAarwBlEheIv6xIXUI1V+4aQZ12JYSLxYc=
Received: from OSAPR01MB4529.jpnprd01.prod.outlook.com (20.179.176.20) by
 OSAPR01MB2547.jpnprd01.prod.outlook.com (52.134.246.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 5 Sep 2019 02:09:43 +0000
Received: from OSAPR01MB4529.jpnprd01.prod.outlook.com
 ([fe80::80c8:d4a:d177:30f5]) by OSAPR01MB4529.jpnprd01.prod.outlook.com
 ([fe80::80c8:d4a:d177:30f5%3]) with mapi id 15.20.2241.014; Thu, 5 Sep 2019
 02:09:43 +0000
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
Subject: RE: [PATCH v2] usb: gadget: udc: renesas_usb3: add suspend event
 support
Thread-Topic: [PATCH v2] usb: gadget: udc: renesas_usb3: add suspend event
 support
Thread-Index: AQHVYy/I2t9BLcJRXk2KkAPfCRN4PaccVmqA
Date:   Thu, 5 Sep 2019 02:09:42 +0000
Message-ID: <OSAPR01MB4529159D4DA9764B0688D4A4D8BB0@OSAPR01MB4529.jpnprd01.prod.outlook.com>
References: <TYAPR01MB454435E0431173D3C7F76D65D8B80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <1567608481-771-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
In-Reply-To: <1567608481-771-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36d34d33-6365-4236-5917-08d731a61dc6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB2547;
x-ms-traffictypediagnostic: OSAPR01MB2547:|OSAPR01MB2547:
x-ms-exchange-purlcount: 1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <OSAPR01MB2547FB23BD3CBCD7362BA8EAD8BB0@OSAPR01MB2547.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(199004)(189003)(8936002)(476003)(305945005)(15650500001)(74316002)(81156014)(81166006)(11346002)(446003)(486006)(102836004)(4326008)(7736002)(8676002)(186003)(26005)(14444005)(256004)(6506007)(76176011)(229853002)(52536014)(66066001)(6306002)(6436002)(55016002)(5660300002)(9686003)(478600001)(33656002)(53936002)(86362001)(14454004)(966005)(71200400001)(71190400001)(316002)(6246003)(110136005)(2906002)(3846002)(6116002)(107886003)(7696005)(99286004)(76116006)(66446008)(64756008)(66556008)(66476007)(25786009)(54906003)(66946007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2547;H:OSAPR01MB4529.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RSHwIBE74LnohWti8SXPgmXPEXctbNKq36Om14Mloyap4ycVKKeoVNm5oCYbPvh5vUlRYiSw+EiU8dcV7HMx51E480k6L4l7C69idX8gHKOb7ZLMBzrV7lc5BBLTyu3QvrHF93FsbKBSB65p1cKopzkfUNwnsVV7H3fJkN1al+lTjFbfIxRqOo/NucIVMKutzeioNItago6+IKKOEjJraSIWqTvrzLF/RuKM6nBMLpiu/plj1iihX5JujSwt5+tSY0hVaTftZKFcUQpI7zr1k5mJcG26nhFDjDKG+JzspbwVia60P7UyIv1B1VC0nv2Nox6xCQ4MAJxlff7RTZpfRHas3f8Byjk7Ac8M/7UXTAmrXKV4oIbhr+GOR5qggqYZ7o7VPRKMZH7YXd/LEL9UPwnshFUoLM3UrvAthMZ+R3o=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d34d33-6365-4236-5917-08d731a61dc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 02:09:42.8235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pxzwLg0n+XIv41NVriiElAmdNm8ONSjQopfUuvnmUBYOEEa4h/VI/PDRQPDYiwhXfLsFQAxRm0mG7be5ED7Lbn1c+gy0Z+eRRqaCR29ilYHJzaNrRn03zx7IfLwxA6tA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2547
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan,

Thank you for the patch!

> From: Veeraiyan Chidambaram, Sent: Wednesday, September 4, 2019 11:48 PM
<snip>
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -767,6 +767,20 @@ static void usb3_irq_epc_int_1_resume(struct renesas=
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

As I mentioned on v1 patch [1], I'd like to remove these conditions.
After fixed it,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

[1] https://patchwork.kernel.org/patch/11129797/#22862513

Best regards,
Yoshihiro Shimoda

> +	    usb3->gadget.speed !=3D USB_SPEED_UNKNOWN &&
> +	    usb3->gadget.state !=3D USB_STATE_NOTATTACHED) {
> +		if (usb3->driver && usb3->driver->suspend)
> +			usb3->driver->suspend(&usb3->gadget);
> +		usb_gadget_set_state(&usb3->gadget, USB_STATE_SUSPENDED);
> +	}
> +}
> +
>  static void usb3_irq_epc_int_1_disable(struct renesas_usb3 *usb3)
>  {
>  	usb3_stop_usb3_connection(usb3);
> @@ -852,6 +866,9 @@ static void usb3_irq_epc_int_1(struct renesas_usb3 *u=
sb3, u32 int_sta_1)
>  	if (int_sta_1 & USB_INT_1_B2_RSUM)
>  		usb3_irq_epc_int_1_resume(usb3);
>=20
> +	if (int_sta_1 & USB_INT_1_B2_SPND)
> +		usb3_irq_epc_int_1_suspend(usb3);
> +
>  	if (int_sta_1 & USB_INT_1_SPEED)
>  		usb3_irq_epc_int_1_speed(usb3);
>=20
> --
> 2.7.4

