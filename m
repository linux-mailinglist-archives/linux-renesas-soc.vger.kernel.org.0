Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE86533DCC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 06:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfFDEU4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 00:20:56 -0400
Received: from mail-eopbgr1400104.outbound.protection.outlook.com ([40.107.140.104]:27488
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725267AbfFDEUz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 00:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMGRurjI8kIyjG8FzYzhFALeHqHt8w+X5kpZpf2P+JU=;
 b=r+208TgLSV7vn3ZLc95bMXFBy/hk/KSiMuSEQi4ckXZxYhuESigiffC7RlabhzI/H6uN+ScD9KxTH8upmeX4wIBwK69mBJtgCX75MCCS//24nGUbCDhh+MafXCmzHD4NypogDaDL7a9ZYQOtz6uzhIojbsGkHAr7haO6NN3CdH0=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB2019.jpnprd01.prod.outlook.com (52.134.235.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 04:20:52 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 04:20:52 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dmaengine: rcar-dmac: Update copyright information
Thread-Topic: [PATCH] dmaengine: rcar-dmac: Update copyright information
Thread-Index: AQHU78smMz+XEEhstEycfA+c5SHoMqY2p2WAgABsgICAFD0tAIAA7a+AgAIvDYCAFH+QgIABcl6QgATNG4CAIguhkA==
Date:   Tue, 4 Jun 2019 04:20:52 +0000
Message-ID: <OSAPR01MB3089A2D7AB64489BB58CF5FED8150@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
 <20190411084937.y5m6vzcwtkqqun7s@verge.net.au>
 <20190411151756.GC30887@bigcity.dyn.berto.se>
 <CAMuHMdXLM0hkUva4AukBpYy+=mRQ_tWT4XCGb=ZGbuT5nYMzjA@mail.gmail.com>
 <OSBPR01MB1733615712FC0F8271580D8BD83D0@OSBPR01MB1733.jpnprd01.prod.outlook.com>
 <20190426115343.GY28103@vkoul-mobl>
 <20190509125528.d7eryp5iv45yn2mp@verge.net.au>
 <OSBPR01MB31747DA6369AD1C240972FBBD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <20190513122012.kv7q2krvq3dlzij4@verge.net.au>
In-Reply-To: <20190513122012.kv7q2krvq3dlzij4@verge.net.au>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8850976-099c-4924-cb03-08d6e8a4081e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB2019;
x-ms-traffictypediagnostic: OSAPR01MB2019:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSAPR01MB201977DE29ABF873C1E5511BD8150@OSAPR01MB2019.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(136003)(39860400002)(376002)(366004)(189003)(199004)(316002)(2906002)(6506007)(966005)(3846002)(66946007)(102836004)(66066001)(66476007)(486006)(68736007)(76116006)(25786009)(66446008)(64756008)(256004)(66556008)(7736002)(73956011)(52536014)(6246003)(86362001)(71200400001)(71190400001)(74316002)(5660300002)(6116002)(55016002)(478600001)(81166006)(33656002)(4326008)(229853002)(8676002)(6436002)(81156014)(4744005)(305945005)(6306002)(186003)(9686003)(6916009)(26005)(476003)(99286004)(14454004)(53936002)(7696005)(76176011)(8936002)(446003)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2019;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 25Fi1ZjcGYCHqxVlTtQBI5nUNQzWnb1BAiTzyC4sudvoVXSnlE4fD8VPSrUIZ7N0XFlHccoC7jPOgCTaonzhdNg+gIjL/zFsHqevx/gCtOvacPvAMlmqJJ1qME5GsItslKQ29QsIgxrJkqGxzCmZctXVQoy1+AKXMU8IrYISejTlbiaQ5YF450e+pzUIIJojx2pvP03GZWSchcwzvY0IXdzDbyuSHxckNOnkw4IVNcwwExrDt/GUk3lzNwBiNo8xwZtaiJr3pvQNWWX95aVu3v8x4/iq6gy2fJG5nkP5L1iEBO4KlOr07PiWzH29uwd7bNzuwW3aZwU9vq5zsbE19Vz/GloWho4oXtgn0sJHGn+nZhMr1RzTJSeXFFiNYTnW44pay6TGm8BIb8yr5WJNUtBrMZj7r2TUG4cjtYS2jVA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8850976-099c-4924-cb03-08d6e8a4081e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 04:20:52.6591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2019
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon-san again,
(clean up on CC)

This is just a record.

> From: Simon Horman, Sent: Monday, May 13, 2019 9:20 PM
<snip>
> > > Shimoda-san, can we go further and also:
> > >
> > > 1. Remove the r8a66597-udc driver, which also seems unused

I overlooked that some SuperH platforms used this driver like below.
So, I will not submit removing this driver patch at this time.

$ git grep -l r8a66597_udc
arch/sh/boards/mach-ecovec24/setup.c
arch/sh/boards/mach-kfr2r09/setup.c
arch/sh/boards/mach-se/7724/setup.c

> > > 2. Remove (minimal) sudmac integration from usbhs ?

I have submitted a patch like below:
https://patchwork.kernel.org/patch/10974161/

Best regards,
Yoshihiro Shimoda

