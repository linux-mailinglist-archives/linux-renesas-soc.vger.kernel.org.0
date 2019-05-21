Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01B4124908
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 09:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfEUHeq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 03:34:46 -0400
Received: from mail-eopbgr1400098.outbound.protection.outlook.com ([40.107.140.98]:8931
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726011AbfEUHeq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 03:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qAaIZc2MbYEN4HpLvFIMoVEC0n21oKtKy6lIzjPSzc=;
 b=p09BeCTvUNDArL9Zzq9PeJDyO4RuFPX2ANk56zVwaIgnKzKht4JueVuuQ0Ek6t3UIaVWIYqDSfEuHEVSSObhggoCgq0ykt16KuXASBHHvsdiltMfDUTTTrT7FSZ3+6XEF9pQ3DUHyhwfANWp4LME6ohdkR9oOxYPJhcqe1nNWno=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB2322.jpnprd01.prod.outlook.com (52.134.249.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Tue, 21 May 2019 07:34:42 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 07:34:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v6 4/7] usb: gadget: udc: renesas_usb3: Add dual role
 switch support
Thread-Topic: [PATCH v6 4/7] usb: gadget: udc: renesas_usb3: Add dual role
 switch support
Thread-Index: AQHVCxgUJtDbUoV/lUufMqZWI03qcqZ1EFsggAAh7oCAAAYkIA==
Date:   Tue, 21 May 2019 07:34:41 +0000
Message-ID: <OSAPR01MB30893CC5002CCE99A2135683D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-5-git-send-email-biju.das@bp.renesas.com>
 <OSAPR01MB30890B5983EEAD2536D01A05D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <OSBPR01MB21032BF17963E11F3D2F7B39B8070@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21032BF17963E11F3D2F7B39B8070@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e24d2930-9f64-4af8-7975-08d6ddbec9f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB2322;
x-ms-traffictypediagnostic: OSAPR01MB2322:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <OSAPR01MB2322F67300A2A31618658C66D8070@OSAPR01MB2322.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(136003)(396003)(366004)(376002)(346002)(51914003)(199004)(189003)(6436002)(2906002)(86362001)(256004)(476003)(486006)(25786009)(966005)(33656002)(102836004)(55236004)(55016002)(5660300002)(6246003)(11346002)(71200400001)(4326008)(6506007)(26005)(71190400001)(53546011)(14454004)(6306002)(5024004)(68736007)(7416002)(229853002)(478600001)(305945005)(446003)(6116002)(74316002)(3846002)(8676002)(8936002)(81166006)(81156014)(110136005)(66066001)(54906003)(99286004)(186003)(66946007)(66476007)(76176011)(66556008)(64756008)(66446008)(53936002)(316002)(7736002)(7696005)(9686003)(76116006)(73956011)(52536014);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2322;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PE4dxy4/LQ7LdXmbRE9wSIwaZJTwogLYpI7G1iVXpD33k6oJf5jLQlN+EFRPjOi85gfH1QiDzZ5me7lRN/O9kWxZJrLDQxjRvRKE2Wsf4sVDgZBnvxAm+y/0aNvb/3JpcVGnDnejjom5TcQTNDWckHQuWpOZ5LTJ7WlPsrdnE8SG4MearjYz51FPdOMleufTQ47htOrcp+Z3ETT6r7Qrn+ZEzkt6aNjUMaQCmNDMPT6s5wTR2XPXLGX/cSg77T3gI7GWs7sZBhfbpvoGoUq560I2dAvUzskd75G5zSiaZJTIAKPTlc+x6I9I3mnhcHA1CSdUyBwojKqL3zmSzU6PolC//D6W9KxDI3OKSPT5p2uPd9HpHO3ZBZxHqZC8YhTmDW+1JmrSpKgg1GnK4eyL7DYcGgOUp5+ocMl44ceyU0M=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24d2930-9f64-4af8-7975-08d6ddbec9f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 07:34:41.9297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2322
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Tuesday, May 21, 2019 4:10 PM
>=20
> Hi Shimoda-San,
>=20
> Thanks for the feedback.
>=20
> > > From: Biju Das, Sent: Wednesday, May 15, 2019 9:09 PM
> > > Subject: [PATCH v6 4/7] usb: gadget: udc: renesas_usb3: Add dual role
> > > switch support
> >
> > Now I'm confusing about the "Add dual role switch support" mean...
> > Especially, this driver has already supports dual role switch support b=
y own
> > sysfs or debugfs.
>=20
> Sorry for the confusion.
> What about "Enhance role switch support" ?

Thank you for the suggestion. It's good to me.

> > > The RZ/G2E cat874 board has a type-c connector connected to hd3ss3220
> > > usb type-c drp port controller. This patch adds dual role switch
> > > support for the type-c connector using the usb role switch class fram=
ework.
> >
> > IIUC, after this patch is applied, the hs3ss3220 type-c driver can swit=
ch the
> > role by using the usb role switch class framework.
>=20
> Yes, That is correct. HD3SS3220 driver detects host/device  connection ev=
ents (attach/detach) and
> It calls "usb_role_switch_set_role"  to assign/switch the role.

I got it.

<snip>
> > JFYI, according to the binding document [1], this "usb-role-switch" mea=
ns:
> > ---
> > + - usb-role-switch: boolean, indicates that the device is capable of a=
ssigning
> > +			the USB data role (USB host or USB device) for a
> > given
> > +			USB connector, such as Type-C, Type-B(micro).
> > +			see connector/usb-connector.txt.
> > ---
> >
> > So, R-Car Gen3 / Salvator-XS cannot have this property because the boar=
d
> > has Type-A connector.
> >
> > [1] https://patchwork.kernel.org/patch/10934835/
>=20
> I have updated the  binding patch to cover this[1]
> [1]. https://patchwork.kernel.org/patch/10944631/
> Are you ok with this binding patch?

I'm sorry, I overlooked the patch. I'll check it later.

Best regards,
Yoshihiro Shimoda

