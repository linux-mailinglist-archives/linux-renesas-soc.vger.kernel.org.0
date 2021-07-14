Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FA63C80B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 10:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238527AbhGNI4M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 04:56:12 -0400
Received: from mail-eopbgr1310091.outbound.protection.outlook.com ([40.107.131.91]:24000
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238432AbhGNI4M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 04:56:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1MMPAbGvU/uXFWj4ceHkFTT6ewfpTOa0vzTFpO6/Nrdg3TevuMLuv+iv/jP5VuFAYRfc+B6LvggrPmRDyL0MI8fsX21ByUJv8Hr6Ouz1q38EBkEoY/yO6p6ZqMZ4zSXzzDXs48e+i/CgaJJ1eIDhpFgfcj248yVWHwUDgN9EhCHrGdY42AwhwRABa47RFlUL8MRpLisNyakjWHoIgrW8kUyioYf0IcRKYM6YimkU+oFm9vboyl86vasItM93Snf3GEIYXWb3t6u6uiuW+kpdlDHb+dbjqQkN28aRSfT9R1YIhym+11bJzlmCQj/+IFp3++bTagZMQ3O+b8FZtgFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRZCxW9PftqNFOSChRE4QSSNxcIoGTj0L8vIv/ehV5M=;
 b=JjwOB5AEEQX1wjXVO2i31Iqd/tRVXdnVwm+IOFzhGAKf8EVeNl6Qc2TR8i45+G0x2cGmZbGO1X9F/LaNPire1b0B8vgp+p1QqkD12mNEw7jHBruHol54xyDS3nMGcZ3KDNUzRixjijpyC58xPtScFdrCdgtPe4LyoTUflWmI3QGqjYGpHElpkfUwYyhUHUq4GXlASV8ex1PWep6mtdYmGsorqPOo5aR+jGfj15X669gbyhbyTuGqtbbwF9tK0Cp7BEaiG8LWXbD78Z/VClLfzBp84bPIdHpEMv8XKp4ILqF9t2TRSxp16h6yETSxVnp9eMfe5rx6aCDyBC98Ccm+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRZCxW9PftqNFOSChRE4QSSNxcIoGTj0L8vIv/ehV5M=;
 b=Ag0lL3htq/87Yo2ewfEtspt9SGPBvxbHXci+03e04EHSTTK7iCAt6MP9g7Y1eJR80JvzV155EOHLF/MsRXSNP9+qXncgYETg0tRXSylWSNpdkfSXU/3muZmvsKTLSMqS57COqayRwpq9dbBfr+UNi/TIieQ4P6o5UYZu5HYbCag=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4026.jpnprd01.prod.outlook.com (2603:1096:404:e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 08:53:16 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 08:53:16 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "wsa@sang-engineering.com" <wsa@sang-engineering.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RESEND] usb: renesas_usbhs: Fix superfluous irqs happen
 after usb_pkt_pop()
Thread-Topic: [PATCH/RESEND] usb: renesas_usbhs: Fix superfluous irqs happen
 after usb_pkt_pop()
Thread-Index: AQHXaPNy5eOcuQRrhUSDiBaSRxu/fKtCSJdw
Date:   Wed, 14 Jul 2021 08:53:16 +0000
Message-ID: <TY2PR01MB3692BEA8919501DCFF1BD4ADD8139@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210624122039.596528-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210624122039.596528-1-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53439ab7-bc04-438f-0ad6-08d946a4d21e
x-ms-traffictypediagnostic: TY2PR01MB4026:
x-microsoft-antispam-prvs: <TY2PR01MB402644A463099A8106E48472D8139@TY2PR01MB4026.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pfQ22pj8QzHSVvVGkF0yneepv6WRLHzjkoTDw8A2PrAc4Iae5AhP65GeK5y2jS8PWor2NyhnTRif1ZXEbSha7KDzatrNm59b42Yy17CGkS+E0Xz7h52WCBwMSMbf+YViISnF9hhz8JFx0V1R97eQQ67iVccPiGJBheWXCBuDsEZa34GB5hZ28P/WQ5M/Mev5Ny09JgsJ4yoQooM7zbYwTn7atHzAp6Y30uwxmSGrrKLuQhDqZthAdF9dGllW+s5Oze41Sc/wftDeLeaNKPOnmfFKjL9/gf/TOtzO5sW7VPi8MD75C+Cmp0KDJQK/nZ82U7q7T0csegNuErsuahmpcMknnVzv1JuiROuJPDlj6N26soZCuoSfjN1/Rfn97MS16KJM2o5H304I4feKGQ4HtbA25be+HK2T4kHeoy+FPVcZ9szIeyonSSO+Ir89te8RAWnTPlndg9kRGIcOsIOmUKRGNs9quS7/bJ78iGkJZ9GtFe/OSAquzLZnHDOZ97dl5fPQyCYyRD4RYP5PoWwtjLABuZw1z2RmRM1g6FOtOc9IJDsoGMcSYs3tgNb0mTM4oSWtOUwn7H7RNmEjJdLz0os+icEoCiUuOiKRIHh21F5kWIJFr2YUCA0Sx7BlgAmV+pxMOBdwGgB0tDBaE77CSEwVEVayEMmGundZWggazWEkztCrZI1FnLBnr+d8se6hNDtE+du8beZ5pch2bd7mmqva3ouVOqs6YEtUfCwujooB/4LAm2lYNGQq5pU5SgqpK+sVSx8aQYokG7mO9kEg4bdysu8YzUfI6oMuXmCxxF8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39850400004)(346002)(136003)(5660300002)(45080400002)(478600001)(966005)(7696005)(71200400001)(33656002)(186003)(6506007)(86362001)(8676002)(8936002)(52536014)(9686003)(76116006)(122000001)(4326008)(66946007)(55236004)(55016002)(2906002)(66446008)(38100700002)(66556008)(66476007)(64756008)(316002)(54906003)(83380400001)(26005)(110136005)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jjG2XAwkblYmDeGc/PUen+RdVjP4J4im8A/OKS00UCLTd9pKLT9cErlyAnTl?=
 =?us-ascii?Q?5B6Fa7Sf9Apdi/0SS55dEpl+1yJ+SBCeTkI112q+2W82RwHHDle6QIoBKzJm?=
 =?us-ascii?Q?J58D0Ih8P9lMHfdyMzyovBBhcOQAdjY92i4LzR/skD9Zoahp/whPB2taCMvi?=
 =?us-ascii?Q?Jea7npvf+evG0xfXwEOtM2h18p5Ps6M63xa8b3mGCSqeU7k+B9sHvmM+mY5P?=
 =?us-ascii?Q?1aHWQz5b6PKcgTd2FwC1v9A1f62lYWQroULIVHZo5qnOC9D9VdEOe2NITO2V?=
 =?us-ascii?Q?h3AOhgRLfxhfTbXrqNVUh+Obt5x5UxFxdBLhUaYnbbdQP5I0LC7EdMomkhA6?=
 =?us-ascii?Q?jBSRPypeAoN01w+4sLaW1vyrDRmiOcxGVrZ3A1CKbPJbt6mBuLliiC9FZzPf?=
 =?us-ascii?Q?FO2X0AbBWCkYExpBF7rde/SUWyoPDb+YX45ca3Mnn9Sr+EkLQbLNZA/BSw0h?=
 =?us-ascii?Q?W6+IUfnN26GpbyqRmkss669EJKrWIgwyM63TgM8PjipjbQlu2e55yYVLAY7Z?=
 =?us-ascii?Q?asH6KH/Ijqmop/Jx2I2OKmJKP+rZwF5+werQJTqrINdPGae+Ibm+bmDV0BcV?=
 =?us-ascii?Q?q2L6yONBWzFXexwpj+hBdqZx5cCzqjimBHvhTb/hWp84KHZ3o4hFwbeTRQg+?=
 =?us-ascii?Q?5EyDkFCytE6s9ZthZMqT7zN/OB+z3rNw/6KYSiJDuuTgjoVRc7dbMXUyMtDV?=
 =?us-ascii?Q?ESpWBDWY5IpGErHX2zgD0FFGgdKWFGPWzjrK7aA6pS1wlFRH+5sQOB3dPBKT?=
 =?us-ascii?Q?Gllfx4oOo4s13MHQC0SGQqi+YtsNYs8X4WQgacUq2Nx+gMOrOeir3FCRXcZR?=
 =?us-ascii?Q?8UJWry5GLQXU2OkQpA1rPHWUV3ppwSR6GWmdOxdYuyR8tAKVykJflesZ+r9B?=
 =?us-ascii?Q?HwrgJ8dCcGyXtfgcNZsaaljWKSnhbmbTz7UN/E4+MXccKjmGMPzLFoV3eNd3?=
 =?us-ascii?Q?wEceAGD/9KBXtr9e6Db3RN/UFwHhJRPGuFRl9Qk9vADYbFBnsbwPA4LuQQ+s?=
 =?us-ascii?Q?//aP4JJmorwlozSGXmKT2LJR06tVUCLiyJVu2EBH25fvCGuXoAGBUxVcnRbc?=
 =?us-ascii?Q?tdrr9CvGcS8yZigePVmfTXztssVzkulEHOenT0iZ4S3UHAb7KJIcDBHEvvbu?=
 =?us-ascii?Q?zvz7NSedEcWZgtSa0r51dscDXt8otLq5igQnIJSFpWIq+aoNyM93Z3wrfls5?=
 =?us-ascii?Q?Qh8z8Xnn46zZUWvRmjIZxOJl2ueGRSMjx6VF3TMvhDMEAvz9NOzrhMZumXgy?=
 =?us-ascii?Q?c1CoI1gsUYevWDvfAYwexrW1/r4+R6j/WaXtMJOpN1T0IWzXBnNbcDYvuIRp?=
 =?us-ascii?Q?NmLYg41auj0/tMT6KMg+5MtU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53439ab7-bc04-438f-0ad6-08d946a4d21e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 08:53:16.1931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DvKzhJuztBG07uz+8gDW0X204zX/zfOynMl0AKyqOmioQUVM82ez7wzkvUgRQt6glc9IFtlCdPQlGGPmdL2Yc5pFHsWQ7C9p8jO6LsJj8FJHdSYLOFDWVsZ941vBfbVQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4026
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

> From: Yoshihiro Shimoda , Sent: Thursday, June 24, 2021 9:21 PM
>=20
> This driver has a potential issue which this driver is possible to
> cause superfluous irqs after usb_pkt_pop() is called. So, after
> the commit 3af32605289e ("usb: renesas_usbhs: fix error return
> code of usbhsf_pkt_handler()") had been applied, we could observe
> the following error happened when we used g_audio.
>=20
>     renesas_usbhs e6590000.usb: irq_ready run_error 1 : -22
>=20
> To fix the issue, disable the tx or rx interrupt in usb_pkt_pop().
>=20
> Fixes: 2743e7f90dc0 ("usb: renesas_usbhs: fix the usb_pkt_pop()")
> Cc: <stable@vger.kernel.org> # v4.4+
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  I'm sorry for causing a trouble before [1], so I resend a suitable patch=
.
>  [1]
>  https://lore.kernel.org/linux-renesas-soc/TY2PR01MB3692555C6EAC8F02BC8B3=
D63D8329@TY2PR01MB3692.jpnprd01.prod.outlook.com/

I'm afraid, but would you review this patch?
I confirmed this patch can be applied into v5.14-rc1.
Or, should I resend this patch?

Best regards,
Yoshihiro Shimoda

