Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 009CFB5172
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 17:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbfIQP1l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 11:27:41 -0400
Received: from mail-eopbgr1310091.outbound.protection.outlook.com ([40.107.131.91]:52325
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726305AbfIQP1k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 11:27:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFMH0Pf674JwqGWcx4vfQ3A6qR5DKKbNII2rwV8lahhid4D9XYrb6DeBaMcjZV4hJZUWeCytyQxA61ucrtpZocHtiabx5pJCqI/YNtm8ajdDoN9DqnVWuaHdoIVyWsILL0Je9Ctygv8Q/c1jAVsSvxcKR9WRK4sDVmDX1w+Ei8u67Pxi/dWUF0aVq156UJCJz6DSFSlp+ntsrWRL6cZ8XQKR5nZivlbnPIQoC9kA5CzUafpLXQsn+M1NQT+Twx4SrA1tnSqi4ivXiyDlfGfY9UH7Jgld+GFBzMPhjazgHqFXxqsUpINCmokF1v9NwRCuv7UZXpHxcmHgm/S21naY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFjXcB3661EPhKfJjK3ZiQu8zLfnoOpVEvZUb8+1U6w=;
 b=ki6rbbqtH3PAQMUYcybm8h4Padn97aKtDKeKDFciyvtEkEK/LwnuYn9n2ERnlVCbKyzbupO46pJpBgKkeOFl5tm6d+9IKBl/YBmGf0QROZFZo5YXV8+BOtDrawM4ZVPwjjGyNQeB9dqFMHjsUNjRGv48FgNODmHcFZQ2kcZ57BCiU1+ceckefnbYP/Hhse8NUip7J93wPMpEjRCTWmscXeol9Eg+72YlFJ3F0ToEEEII5EKKZPt1qL+wKff3Oont225O4jZs8gd8BxZRQy/7rZqbFZ6OhpTH+UAzcw3TK8ZvR2xRu59EBSg66O1ZhGgp8w8APDnHZqvAlh1wcqkXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFjXcB3661EPhKfJjK3ZiQu8zLfnoOpVEvZUb8+1U6w=;
 b=P1CitctruDNVphngf0spj19r+m2Ioc8xixbE7PYA7oj8rJn0ix+T1SaovZG1gfIZ8FRQCENh7F6zUBAnu+SA3T+E8Dc909lipO5kXMgaYRXi/hwRpYNxq+gKojdVAKwTAdqVzQNQU6uyDJoC1WQF7sbac5MrEUk/OslNdSzbbys=
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com (20.177.98.81) by
 TY2PR01MB3916.jpnprd01.prod.outlook.com (20.178.133.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Tue, 17 Sep 2019 15:27:34 +0000
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::7ce4:f502:8430:51a]) by TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::7ce4:f502:8430:51a%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 15:27:34 +0000
From:   Gareth Williams <gareth.williams.jx@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>
Subject: RE: DRM Driver implementation question
Thread-Topic: DRM Driver implementation question
Thread-Index: AdVslX1ZBzegHzojRVS64lgG04s8jgAenS2AABbmTEA=
Date:   Tue, 17 Sep 2019 15:27:34 +0000
Message-ID: <TY2PR01MB292423C617848A66F61B1027DF8F0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
References: <TY2PR01MB29242CA3B8CBE834A5B0CC48DF8C0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
 <TYAPR01MB4544D0B345C809CD3555A9EFD88F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4544D0B345C809CD3555A9EFD88F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gareth.williams.jx@renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1b30422-70c5-4c9a-4721-08d73b83906b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TY2PR01MB3916;
x-ms-traffictypediagnostic: TY2PR01MB3916:|TY2PR01MB3916:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3916558A9A81E6432C7DD8E6DF8F0@TY2PR01MB3916.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(51444003)(199004)(189003)(6636002)(6246003)(55016002)(74316002)(86362001)(7736002)(33656002)(446003)(25786009)(54906003)(66066001)(99286004)(5660300002)(6506007)(11346002)(9686003)(26005)(76176011)(4326008)(6862004)(316002)(7696005)(256004)(81166006)(66946007)(8676002)(186003)(6116002)(3846002)(76116006)(66446008)(66556008)(66476007)(64756008)(305945005)(486006)(81156014)(229853002)(71200400001)(2906002)(71190400001)(476003)(3480700005)(8936002)(6436002)(478600001)(102836004)(52536014)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB3916;H:TY2PR01MB2924.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: USC6RO7cXyQvl51euqQ1OU30wbdVyY2EOmt7WUKA9nCkUQoaDOFlDeSb5L0i3ZcRyKVYflYmMF3DnSPvnx1TlXjyaFTRMe6Cywdv76VP0xLh/LhPePlDxHKojFmP8H1wKpc/GZ6dHD69Kcx8ToEiFJdU+y76CDTg6ziN5Lx5ftRcd4YdfdaBlm17zR6Wh59wHoWsAd7up4qT+mioijwIsBY1Pq7oRok+d5Ot+alKXWefh55ib5iDSqMVaKtMZrgXmJnhtmMs7mR5S2nYp5RrR5iGaevn9Yx+I2zwGOvOC6tmBcgqQh1UJ7wVsUU+mIldyD4Uhlocqwg47yOOaz0oHxU7IALaxdJrRskCpMF7s7zCzJ1gUYr9T6puTigixh7nsNV8O5pRYnQyX1xGyLO6UU19NW9Dkx7mcpGC5fDKe7U=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b30422-70c5-4c9a-4721-08d73b83906b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 15:27:34.2720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4bRpjsXLmE6KLuUyVI+6lL8LOPVfSnfU8r1eOFuCs/fWbb7nJl4LfvOQk6bPoxy7nX0UzjNy3O149UTYjame7Qb3rgyAh+5plfGlVGHuyz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3916
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yoshihiro,

This looks like an elegant solution that I can implement.
Many thanks for pointing me in a good direction.

> From: Yoshihiro Shimoda, Sent: Tuesday, September 17, 2019 05:39 PM
>=20
> Hi Gareth,
>=20
> > From: Gareth Williams, Sent: Monday, September 16, 2019 10:56 PM
> >
> > Hi Laurent/Kieran,
> >
> > I need to upstream a driver for a display controller that within its
> > registers memory region contains registers related to a PWM device. The
> PWM device is for controlling the backlight of the display.
> > Ideally, I would like to create a separated driver for the PWM, so
> > that I can re-use "pwm-backlight", but since the registers for the PWM
> > are right in the middle of the registers for the display controller I w=
ould
> need to ioremap the memory region for the PWM registers region twice,
> once from the display controller driver, and once from the PWM driver.
> > Do you think that the double ioremap would be acceptable upstream?
>=20
> I think that an MFD driver can support such hardware. I checked
> Documentation/devicetree/bindings/mfd roughly, and then atmel-hlcdc.txt
> seems to have a display controller and a PWM device.
>=20
> Best regards,
> Yoshihiro Shimoda

Best Regards,

Gareth Williams
