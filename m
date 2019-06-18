Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AECC849A27
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 09:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfFRHPn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 03:15:43 -0400
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:10425
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725955AbfFRHPn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 03:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkmkgJWchracTE2Jf0x3WYuTbCZJRLJ3IZ4Vi0LalK8=;
 b=I5ye6eKEe1M2LxzKJ7YPqR+qWqPDmzYrEd+fpT5c3pHH+DNKIEOe0mVWFln6PckF4LL8QPjgvC9ebTLzbynDrIYysV0aasJgkns1mv689TITiwsk/Fxc5ETlnt3V92MpkVCX7mKdEsNgMaqtpR1Fj3fQPtLYccB9hbgJaVcaU3w=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3029.jpnprd01.prod.outlook.com (52.134.254.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Tue, 18 Jun 2019 07:15:39 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::451a:14a0:aa81:1b54]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::451a:14a0:aa81:1b54%7]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 07:15:39 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-C DRP
 port controller
Thread-Topic: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-C
 DRP port controller
Thread-Index: AQHVF5i4H7iFvw/OZk6CzzYV6n6nWKahFESAgAAAXMCAAAP7gIAAAMpg
Date:   Tue, 18 Jun 2019 07:15:39 +0000
Message-ID: <OSBPR01MB210397241ADE60BB88C09E22B8EA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-4-git-send-email-biju.das@bp.renesas.com>
 <20190618064743.GA22269@kroah.com>
 <OSBPR01MB2103613A152597DF83BC18D0B8EA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190618070315.GA9160@kroah.com>
In-Reply-To: <20190618070315.GA9160@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3593c44f-b300-453f-9055-08d6f3bcc473
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3029;
x-ms-traffictypediagnostic: OSBPR01MB3029:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB302915834633ADBEE14F5616B8EA0@OSBPR01MB3029.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(76176011)(11346002)(305945005)(316002)(256004)(7736002)(14444005)(4326008)(7696005)(6306002)(74316002)(71200400001)(71190400001)(14454004)(8936002)(6436002)(33656002)(55016002)(186003)(6246003)(66946007)(6916009)(5660300002)(9686003)(73956011)(6506007)(81166006)(8676002)(81156014)(66066001)(53936002)(446003)(68736007)(102836004)(25786009)(86362001)(229853002)(99286004)(7416002)(52536014)(66446008)(26005)(476003)(54906003)(966005)(64756008)(66556008)(66476007)(486006)(2906002)(6116002)(44832011)(3846002)(76116006)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3029;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sAYTTSfOjc3aq3eXr5uTQWD46OwrPlKM9EiKj/9Bg8TJOKk50nHEZOtKnr7AZLbzmOwIGWLZY8ONy6n6tRs/dKaj6KvKGUd0bA8OUxhhfcW9xuXGtOv2rCZ2W/5NFnWKkCNjceICShADouXp3eRTtqjX2pgiPsINt5afguTxRzwfM9/a3xODh8NKMw501+0htL2EuinpWcLA1CT9b3iM5PpgvF6aOSGaTX4GmnoNf3pttU/FxL1KniNJvfE/sijnF/RLoGTYalrzmQdb8/7GbPJaUbxfqW643N0V7vGmEYLL6Ltaw19E4BW/hsPTOBJ0v84ghlVElAvqSqR5kN34cUlxALq8AQVCPPlQOzj7chHvChNRP42taoTo+0/j1HLedRxK5qs22rpHjANcHCMJlbZ9J6KQZkajoQLgcd3ihvw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3593c44f-b300-453f-9055-08d6f3bcc473
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 07:15:39.3153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3029
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

> Subject: Re: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-=
C
> DRP port controller
>=20
> > > Subject: Re: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB
> > > Type-C DRP port controller
> > >
> > > On Fri, May 31, 2019 at 10:59:56AM +0100, Biju Das wrote:
> > > > Driver for TI HD3SS3220 USB Type-C DRP port controller.
> > > >
> > > > The driver currently registers the port and supports data role swap=
ping.
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > ---
> > >
> > > I tried to apply this, but get the following build error:
> > >
> > > drivers/usb/typec/hd3ss3220.c: In function hd3ss3220_probe:
> > > drivers/usb/typec/hd3ss3220.c:179:23: error: implicit declaration of
> > > function fwnode_usb_role_switch_get; did you mean
> > > usb_role_switch_get? [- Werror=3Dimplicit-function-declaration]
> > >   hd3ss3220->role_sw =3D fwnode_usb_role_switch_get(connector);
> > >                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > >                        usb_role_switch_get
> > > drivers/usb/typec/hd3ss3220.c:179:21: warning: assignment to struct
> > > usb_role_switch * from int makes pointer from integer without a cast
> > > [-Wint- conversion]
> > >   hd3ss3220->role_sw =3D fwnode_usb_role_switch_get(connector);
> > >                      ^
> > >
> > > You might want to fix that so the series can be applied :(
> >
> > This patch depend upon the  below commit[1] which introduced the new
> API "fwnode_usb_role_switch_get()"
> >
> > [1] https://patchwork.kernel.org/patch/10986227/ ("usb: roles: Add
> > fwnode_usb_role_switch_get() function")
>=20
> Ok, then I guess I will have to wait to merge this until that is accepted=
.
>=20
> Please resend when that happens.

OK.  I will resend this patch after  patch [1]  get accepted.

Regards,
Biju
