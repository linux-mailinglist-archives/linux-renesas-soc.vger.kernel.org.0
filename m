Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A606C49990
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 08:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbfFRG5f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 02:57:35 -0400
Received: from mail-eopbgr1400095.outbound.protection.outlook.com ([40.107.140.95]:32634
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726037AbfFRG5f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 02:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFDMs46K7MyhBEoqm5zFXFqKYiOr8P2zJKquBIMz8gA=;
 b=rgoIBB8wd3MVu09R0ce5bFnmjQCSnCNTX5UZRuuN9dJNUtYp7Z4FDLGkS113yUNKwVwCLttPUzloGNHUJ95vDtW8tU9QjQ/IF2l7gtX+mqAFLIpWC9cUnRqzBTLTaC4AfKo0jR1Sx/cqHINiJIT54mv4Ni+bj99WUmGvvjOdjfs=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4872.jpnprd01.prod.outlook.com (20.179.180.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Tue, 18 Jun 2019 06:57:31 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::451a:14a0:aa81:1b54]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::451a:14a0:aa81:1b54%7]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 06:57:31 +0000
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
Thread-Index: AQHVF5i4H7iFvw/OZk6CzzYV6n6nWKahFESAgAAAXMA=
Date:   Tue, 18 Jun 2019 06:57:31 +0000
Message-ID: <OSBPR01MB2103613A152597DF83BC18D0B8EA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-4-git-send-email-biju.das@bp.renesas.com>
 <20190618064743.GA22269@kroah.com>
In-Reply-To: <20190618064743.GA22269@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71b3b54a-2b54-41e7-d960-08d6f3ba3c0d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4872;
x-ms-traffictypediagnostic: OSBPR01MB4872:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <OSBPR01MB48721347C7F1460A2C55E128B8EA0@OSBPR01MB4872.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(136003)(366004)(346002)(376002)(396003)(39860400002)(199004)(189003)(13464003)(51914003)(55016002)(7696005)(102836004)(53546011)(316002)(81166006)(33656002)(6506007)(54906003)(81156014)(5660300002)(256004)(8676002)(6306002)(99286004)(229853002)(14444005)(6246003)(25786009)(86362001)(4326008)(53936002)(6436002)(52536014)(6916009)(44832011)(66446008)(73956011)(476003)(66946007)(66476007)(76116006)(486006)(446003)(26005)(66556008)(71200400001)(3846002)(2906002)(7416002)(76176011)(64756008)(11346002)(74316002)(478600001)(71190400001)(305945005)(7736002)(8936002)(6116002)(14454004)(186003)(9686003)(68736007)(66066001)(966005)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4872;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ta0rgk2NtDLL2LsUhIr3LRvCyCW4eI6h57obWsyE/3WjS2FvttB2YHNy1ZDUHh9267UhfsdHh8A6tRmQ6xx3vupKuEWYe210HcYV6J8wPwR5NvwFj5KGUVtLoFe3Q9h45b0eVPYeiN/pQYHgv6IWZ3gevFIboJipwUN9plG4RUh5+5pvYkZmC+X6H0Yawoq9u+4+gzbXvZTz3UN5OqsHa4sS6/yrAPR5P0cPOdu7C31AJK2TmXNKCjqKlpVvheYc9xWytYK2y7lOwbvzjeKbxm7KSFtmjI6nYxUYHUW5SZDNpT5dmngn7CxjEAyRVr3c6mDjItFvBbwap/l6iHWJMSNSPwT10HeHVdDonCvW4N3xYvl7fpW9kgcB9fFNLeXy1k/QoBzzuNbNjxmYu7Zb8sHy2LNpPI6c8F7+dzIA8QM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b3b54a-2b54-41e7-d960-08d6f3ba3c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 06:57:31.4412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4872
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

Thanks for the feedback.

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Tuesday, June 18, 2019 7:48 AM
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>; Matthias Brugger
> <matthias.bgg@gmail.com>; Rob Herring <robh+dt@kernel.org>; Felipe Balbi
> <balbi@kernel.org>; Chunfeng Yun <chunfeng.yun@mediatek.com>; linux-
> usb@vger.kernel.org; Simon Horman <horms@verge.net.au>; Yoshihiro
> Shimoda <yoshihiro.shimoda.uh@renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-=
C
> DRP port controller
>=20
> On Fri, May 31, 2019 at 10:59:56AM +0100, Biju Das wrote:
> > Driver for TI HD3SS3220 USB Type-C DRP port controller.
> >
> > The driver currently registers the port and supports data role swapping=
.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
>=20
> I tried to apply this, but get the following build error:
>=20
> drivers/usb/typec/hd3ss3220.c: In function hd3ss3220_probe:
> drivers/usb/typec/hd3ss3220.c:179:23: error: implicit declaration of func=
tion
> fwnode_usb_role_switch_get; did you mean usb_role_switch_get? [-
> Werror=3Dimplicit-function-declaration]
>   hd3ss3220->role_sw =3D fwnode_usb_role_switch_get(connector);
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>                        usb_role_switch_get
> drivers/usb/typec/hd3ss3220.c:179:21: warning: assignment to struct
> usb_role_switch * from int makes pointer from integer without a cast [-Wi=
nt-
> conversion]
>   hd3ss3220->role_sw =3D fwnode_usb_role_switch_get(connector);
>                      ^
>=20
> You might want to fix that so the series can be applied :(

This patch depend upon the  below commit[1] which introduced the new API "f=
wnode_usb_role_switch_get()"

[1] https://patchwork.kernel.org/patch/10986227/ ("usb: roles: Add fwnode_u=
sb_role_switch_get() function")

Patch  [1] depend up on [2] ,[3] and  the binding patch [4]

[2] https://patchwork.kernel.org/patch/10986233/  ( "device connection: Add=
 fwnode_connection_find_match()")
[3] https://patchwork.kernel.org/patch/10986221/  ("usb: roles: Introduce s=
tubs for the exiting functions in role.h")

Binding patch
[4] https://patchwork.kernel.org/patch/10986215/ ("dt-binding: usb: add usb=
-role-switch property")

Regards,
Biju



