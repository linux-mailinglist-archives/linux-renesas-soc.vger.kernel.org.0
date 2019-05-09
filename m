Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7DD018565
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 08:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfEIGXn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 02:23:43 -0400
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:6077
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726683AbfEIGXm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 02:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBBThbzzBZhrySEVZWkmkes7KaA/DSkhPMh+Otfsm38=;
 b=RTM43DUZaplDZ5uCNwI2HeRV5neNUuhbxORq0EgUG9urgpiJmP9kK/URY+ir/F1f5+YYIfsCc2uhpdqO1Hm7vpo1nbMZYmE63X/DOO341GJSczIHWq446wpjRXud4otJmZ28BU4DxoqFjMNEl93Fr+AzAIhBcZi3mPSoBEtlgok=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB3591.jpnprd01.prod.outlook.com (20.178.5.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.20; Thu, 9 May 2019 06:23:38 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562%3]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 06:23:38 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>
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
Thread-Index: AQHVBGYHqBe7JTZ/4k2vKamrKGugU6ZfYQSwgAIoCQCAAMOq8A==
Date:   Thu, 9 May 2019 06:23:37 +0000
Message-ID: <OSBPR01MB3174EB1DCBEB9C7CDB3EC3D6D8330@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <OSBPR01MB317442B092744C8D312682DCD8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <TY1PR01MB1562C5FCC551A2857A6D15E78A320@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562C5FCC551A2857A6D15E78A320@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d08fc73-23e3-4513-63a5-08d6d446df82
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3591;
x-ms-traffictypediagnostic: OSBPR01MB3591:
x-microsoft-antispam-prvs: <OSBPR01MB3591A5CA5E818F8328785EC3D8330@OSBPR01MB3591.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(376002)(346002)(396003)(39860400002)(189003)(199004)(8676002)(81156014)(81166006)(76116006)(446003)(11346002)(478600001)(316002)(66476007)(68736007)(476003)(8936002)(86362001)(486006)(74316002)(14454004)(6116002)(26005)(3846002)(6636002)(66066001)(229853002)(2906002)(9686003)(53936002)(54906003)(6506007)(7696005)(6862004)(4326008)(76176011)(52536014)(99286004)(71200400001)(71190400001)(66946007)(55016002)(186003)(66556008)(73956011)(66446008)(64756008)(7736002)(305945005)(33656002)(14444005)(6246003)(256004)(25786009)(6436002)(102836004)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3591;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vKS4Qsb790L9cleSqww6DVcVBBh8Hl9EpbCbH0rQLQPExyWVMq41XDUx0oWW0hvs2vyJ9uY5jxqopWle9YacB0QBR62CK4ePTqJEO6jqPERp4+TISEADuU3xr3B4lr0AGINjxFE7X+4XeafcTAPEB4TEc5qlMimR0hAjPdTKwPDSKmAS069wI/JyUd64NVb7UhnrcIzm22Q4Sp29N1yQwuC9ms5J47yj0FQktX4W5oHyZ8SedzKoY1blgW8fZu/kf+oCEGkMzgjptejB7dNSv7fuqlTGGb0pFDZAOQR8nt0wbpUPWYZzYay/T7z+3kMdmE/QkQADP1dFZGp6PnclUwtzv3BqlxTDnUQ5kFoD6IzJVnT2LT17beIAvo/5Yedj8W6bU3SUvwOuW4rA/ClirHcGvQt4LoJiNoU82zFgUr0=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d08fc73-23e3-4513-63a5-08d6d446df82
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 06:23:38.0386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3591
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris=1B$B$5$s=1B(B

> From: Chris Brandt, Sent: Thursday, May 9, 2019 3:08 AM
>=20
> Hi Shimoda=1B$B$5$s=1B(B
>=20
> > From: Yoshihiro Shimoda
> > Sent: Tuesday, May 07, 2019 5:17 AM
> > > For the most part, the RZ/A2 has the same USB 2.0 host and device
> > > HW as the R-Car Gen3, so we can reuse a lot of the code.
> > >
> > > However, there are a couple extra register bits, and the CFIFO
> > > register 8-bit access works a little different (weird, no idea why).
> >
> > This is just my gut feeling, but if we set the BIGEND bit in the CFIFOS=
EL
> > of RZ/A2M (R-Car Gen3 doesn't have such a bit though), could the origin=
al
> > code work correctly?
>=20
> I just tried to set CFIFOSEL.BIGEND =3D 1

Thank you for trying it!

>  * Set CFIFOSEL.BIGEND =3D 1
>  * Write 8-bit values to CFIFO (same method as R-Car)
>  * Set CFIFOSEL.BIGEND =3D 0
>=20
> The result is bad.

I got it...

> But, then I tried this:
>  * Set CFIFOSEL.MBW =3D 0   (CFIFO port access =3D 8-bit)
>  * Write 8-bit values to CFIFO
>  * Set CFIFOSEL.MBW =3D 2   (CFIFO port access =3D 32-bit)
>=20
> Code:
> u16 cfifosel =3D usbhs_read(priv, fifo->sel);
>=20
> usbhs_write(priv, fifo->sel, cfifosel & 0xF3FF); // MBW =3D 8-bit
>=20
> 		for (i =3D 0; i < len; i++)
> 			iowrite8(buf[i], addr); //same address each time
>=20
> usbhs_write(priv, fifo->sel, cfifosel);	// MBW =3D 32-bit
>=20
>=20
> This method works good.

I got it.

>   (I assume this method would work with R-Car also)

Unfortunately, R-Car cannot work with this method...
But, "iowrite8(buf[i], addr + 3);" or "iowrite32(buf[i], addr);" works on t=
he R-Car.
And then, I realized that R-Car CFIFO register allows 32-bit access only...
# So, I'm asking HW guy whether the 8-bit access can be allowed or not now.=
..

> But...then we have extra register reads and writes.
> Register accesses are slower, so performance is lower.
>=20
> So, I prefer my original method:
> 	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR))
> 		for (i =3D 0; i < len; i++)
> 			iowrite8(buf[i], addr + (i & 0x03));
> 	else
> 		for (i =3D 0; i < len; i++)
> 			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
>=20
>=20
> Do you agree?

I agree.
However, I have some comments about the patch. So, I'll reply on the patch =
later.

Best regards,
Yoshihiro Shimoda

> Chris

