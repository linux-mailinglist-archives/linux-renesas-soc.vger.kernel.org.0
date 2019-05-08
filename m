Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62ECD17F80
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 20:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfEHSHp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 14:07:45 -0400
Received: from mail-eopbgr1400109.outbound.protection.outlook.com ([40.107.140.109]:27088
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726544AbfEHSHp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 14:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KBOWG33IGhBtG045h6tD3RlR9D+C1Ri/Ad0/07j5bs=;
 b=jp/3y7nMkfhKdFY4EnRrNB9hZo4Ny4Aks3ZoNOi+FF0dNjXLBOHyOpUvxYfKk84kcMiuYIgvWxIZ6GrIA70MR/R+VBAmVTgpKUaC0/7mN9lMiHLbyIfcAhLExfKtQVGNB2qy0WdZwBtfnY+tJBJ2VObDwJ8Yl1iR/+SCScR6HPM=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1563.jpnprd01.prod.outlook.com (52.133.160.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.15; Wed, 8 May 2019 18:07:40 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 18:07:40 +0000
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
Subject: RE: [PATCH 00/10] usb: Add host and device support for RZ/A2
Thread-Topic: [PATCH 00/10] usb: Add host and device support for RZ/A2
Thread-Index: AQHVBGYH7aUZDb07sEevR4eh25Pg7qZfYocAgAIgbZA=
Date:   Wed, 8 May 2019 18:07:40 +0000
Message-ID: <TY1PR01MB1562C5FCC551A2857A6D15E78A320@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <OSBPR01MB317442B092744C8D312682DCD8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB317442B092744C8D312682DCD8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dba9d94b-5b41-490e-ddbb-08d6d3e00f93
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1563;
x-ms-traffictypediagnostic: TY1PR01MB1563:
x-microsoft-antispam-prvs: <TY1PR01MB1563488AF85FA4FD08F78B578A320@TY1PR01MB1563.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39860400002)(346002)(136003)(396003)(366004)(199004)(189003)(305945005)(7736002)(99286004)(55016002)(71200400001)(71190400001)(66066001)(6436002)(6246003)(66476007)(76116006)(74316002)(54906003)(66446008)(64756008)(6862004)(73956011)(66946007)(4326008)(66556008)(14454004)(53936002)(229853002)(316002)(446003)(186003)(11346002)(72206003)(25786009)(476003)(486006)(8936002)(81156014)(81166006)(2906002)(256004)(14444005)(8676002)(6636002)(86362001)(26005)(478600001)(5660300002)(6506007)(52536014)(102836004)(68736007)(9686003)(6116002)(3846002)(33656002)(7696005)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1563;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tSdsD4MJdDr8xeXmBj2L/2DvZuJAKjR6U+wevjJISGaZnv516tSM4ZtUu0B/QUDG22AfQvhhZrSK0IY4w/X9bARGRu7mgv3A5PZen4BDMkihKl8jW1yod8x1RYqeT5YmGbsUHA7UEK3exlsSLYLjfKUwitIbv2SS2zpIPXN926Rl7pBJQFp49EJQ1Xd+YB3yljf8hoP3H1UMrwQqEeVLBxlx7zNKZpSzNj7tMJ5iBU2X6PzjuX5Mac8IS/bOlP1CLmm+E0ZLRH3KeyQzbIFjitQNgZCUz0DyVLWpOAYF2Xv+y/RCnLt4a6miJj2bahVEemHR34Xx4bWleq0YAzsyqeLxoZ9QfzW7mV1qFRem5eyDeqYuzpFgOZXvNQraHVVdvq0M9mue6sAER6Ivp137p8lIU3r+4zIxF+erRBQJOWc=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba9d94b-5b41-490e-ddbb-08d6d3e00f93
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 18:07:40.5136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1563
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda=1B$B$5$s=1B(B

> From: Yoshihiro Shimoda
> Sent: Tuesday, May 07, 2019 5:17 AM
> > For the most part, the RZ/A2 has the same USB 2.0 host and device
> > HW as the R-Car Gen3, so we can reuse a lot of the code.
> >
> > However, there are a couple extra register bits, and the CFIFO
> > register 8-bit access works a little different (weird, no idea why).
>=20
> This is just my gut feeling, but if we set the BIGEND bit in the CFIFOSEL
> of RZ/A2M (R-Car Gen3 doesn't have such a bit though), could the original
> code work correctly?

I just tried to set CFIFOSEL.BIGEND =3D 1

 * Set CFIFOSEL.BIGEND =3D 1
 * Write 8-bit values to CFIFO (same method as R-Car)
 * Set CFIFOSEL.BIGEND =3D 0

The result is bad.


But, then I tried this:
 * Set CFIFOSEL.MBW =3D 0   (CFIFO port access =3D 8-bit)
 * Write 8-bit values to CFIFO
 * Set CFIFOSEL.MBW =3D 2   (CFIFO port access =3D 32-bit)

Code:
u16 cfifosel =3D usbhs_read(priv, fifo->sel);

usbhs_write(priv, fifo->sel, cfifosel & 0xF3FF); // MBW =3D 8-bit

		for (i =3D 0; i < len; i++)
			iowrite8(buf[i], addr); //same address each time

usbhs_write(priv, fifo->sel, cfifosel);	// MBW =3D 32-bit


This method works good.

  (I assume this method would work with R-Car also)

But...then we have extra register reads and writes.
Register accesses are slower, so performance is lower.

So, I prefer my original method:
	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR))
		for (i =3D 0; i < len; i++)
			iowrite8(buf[i], addr + (i & 0x03));
	else
		for (i =3D 0; i < len; i++)
			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));


Do you agree?

Chris

