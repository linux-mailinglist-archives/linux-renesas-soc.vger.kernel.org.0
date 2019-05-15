Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4B151E995
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfEOH5H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:57:07 -0400
Received: from mail-eopbgr1400108.outbound.protection.outlook.com ([40.107.140.108]:60320
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725876AbfEOH5H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Bz/ffe3NcGWlUBtncHhdBmHQdudJ8779tKIyCAdWW0=;
 b=d9Hjs6OMD0WW+MWbNKPqZ8uP5xecevdy08959MONb8NDpDyVhqT21kKZvGZyAlVAQU6VSjH/ciRC256E8IB65A8y5rlWqjnFG6vzozc3VfUrf+ELPJH/xYd8LvWy/ntLTi3qaLvGhOGqP7/aNZyHX4UrDxFX2i3kW7th2rjEaCE=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB2392.jpnprd01.prod.outlook.com (52.134.255.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 07:57:00 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 07:57:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3 10/15] usb: renesas_usbhs: support byte addressable
 CFIFO
Thread-Topic: [PATCH v3 10/15] usb: renesas_usbhs: support byte addressable
 CFIFO
Thread-Index: AQHVCmVrG6/X5i7M6EKkoR03gRcoraZr0DkggAACJ/A=
Date:   Wed, 15 May 2019 07:57:00 +0000
Message-ID: <OSBPR01MB31748EA6127F817BA7AFDE4ED8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-11-chris.brandt@renesas.com>
 <OSBPR01MB3174D47DB6FFCA64733DDFF3D8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3174D47DB6FFCA64733DDFF3D8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5e3404e-3c7e-4847-7b3b-08d6d90ae925
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2392;
x-ms-traffictypediagnostic: OSBPR01MB2392:
x-microsoft-antispam-prvs: <OSBPR01MB239281A49EF7FBF98CEA4ED0D8090@OSBPR01MB2392.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(136003)(376002)(366004)(39860400002)(199004)(189003)(33656002)(54906003)(26005)(74316002)(6436002)(110136005)(9686003)(55016002)(14454004)(229853002)(53936002)(6116002)(5660300002)(2940100002)(186003)(478600001)(316002)(86362001)(25786009)(4744005)(4326008)(52536014)(66066001)(68736007)(107886003)(2906002)(6246003)(71190400001)(66946007)(64756008)(256004)(8676002)(8936002)(81156014)(7736002)(305945005)(71200400001)(76116006)(81166006)(102836004)(66556008)(3846002)(73956011)(7416002)(476003)(446003)(486006)(66476007)(76176011)(99286004)(7696005)(66446008)(11346002)(6506007)(14444005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2392;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +7B0SVh4CFY1ugd97lgPSuQZKMDfj0LTmZ1ks8qNX0v4zcjonP3UJxSrQ/NqOY876FBcfzUN5bwHxjuGsfvm/XTW5QgDIVP4lgqe195EEt7AnYGqqVHHCMFxwPtHHLhs4slpV/bUOdclMJ9R5s9fbsEUk0Gc/BwQ3Vd4SuDdlEoa5EwA39hhLExAH4cB4GB1wpcnwRT2KoddIZsnDWa04Wv9k9xW5NA1LEeaqQuha8IbTFHBuVPoMs3OdorHL4qieAMLFjXUjAIefDUPKgziCBFrj2sFISSch4sMFOD0yEd/YLgndTLYpnhyyY8PWOGmm278QTFXaGcXSdkxwY9DMOTOpVfU6uCMHv7ehJFMQ/EwQ6YDYHIr0Dka/+oiF/J4GD3U1KhI0crc7jHTdcF4LiskOSxbSBlNz3VCMyGLGq0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e3404e-3c7e-4847-7b3b-08d6d90ae925
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 07:57:00.2502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2392
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris-san again,

> From: Yoshihiro Shimoda, Sent: Wednesday, May 15, 2019 4:48 PM
>=20
> Hi Chris-san,
>=20
> > From: Chris Brandt, Sent: Tuesday, May 14, 2019 11:56 PM
> >
> > Some SoC have a CFIFO register that is byte addressable. This means
> > when the CFIFO access is set to 32-bit, you can write 8-bit values to
> > addresses CFIFO+0, CFIFO+1, CFIFO+2, CFIFO+3.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>=20
> Thank you for the patch!
>=20

Oops! I didn't write my tag...

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> Best regards,
> Yoshihiro Shimoda

