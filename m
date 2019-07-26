Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 641CE75C74
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2019 03:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbfGZBWx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jul 2019 21:22:53 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:10898
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725878AbfGZBWw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 21:22:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQXKthq9UZ8TA29Srx+vf34lf6wtBHBmB5kmDqhUJ3poLq3RobCSsCgQnK8XeEp1CVFSYpRG7+QENCdR7h/Zm6FXakIlmA9tSB15tYyn8mKpGthLL1g/WGq4ERUdQcFpNYspq9iY9o5vlJbGzw8/Q9zEs5H0aJSk1ECwFiqopXs9eeiw+ofdxHM9sVCaPm2uWWzHCbE7y29lrmeV9ud5biMHfiNnfCMypv2RWGZ8Z7Em+5BWeSnCOSW7sohlssWP+HH3/GUCZPAjO+Gg34XC9Mr0itILz6YYgP1BvQt1UgWZh6eOkPqc7BdAFY/GImC2pujdo+Hv5/rKe9uKPwsX0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBPbbHAsfxvBTZSo1Mqg8EZMfrue3GPloQ5o928gz44=;
 b=V/dlVVasGa6BzJezGSi9dFmbnRiIFQw4qARYwe6gTeAEbRaXiWomxETEhhSixXTFh86hnn7wlHtmaFKJfLczhgjy7GSq9wFp2mRpiii4PtuiQ1XU/5vdRnV0atX9MUwKap0ySBbhRJOImnnP20bKFFNHkED/xdVCtoX0ls1pN4eb9lTduk4iSewmiq0r8Jv3atS98u7gE842kDcwIl8cNdz7/GMThxwDunSwhjjp7NLSTuagmb+BiSTl3f3DKKnG1zsuOwqenNBFIu/95/D2hzxkw4Ze7E1ml0u1M2ZvSurtzthBt2qP1UyNYTF5MwlUEDeMAd/Xd7OFhfukJRXD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=renesas.com;dmarc=pass action=none
 header.from=renesas.com;dkim=pass header.d=renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBPbbHAsfxvBTZSo1Mqg8EZMfrue3GPloQ5o928gz44=;
 b=Iliq7K2e8vODX0Tq49+M5p1KHykrX35/ySjaSnQCBzCagpwvDSUyUctY00/P00MtCiuUH4kogZ3VtnwLPz4y6wq6zsgXm/zNJIeKEar1LT68fYNq/SooawCUHv/lqEdox9ePUbbbCiFnE6B+gYsx01K+y8ZdgzEfty4j8SvwMCg=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.174.85) by
 TYAPR01MB3743.jpnprd01.prod.outlook.com (20.178.140.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Fri, 26 Jul 2019 01:22:48 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::5c8d:f422:6a44:57a9]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::5c8d:f422:6a44:57a9%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 01:22:48 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: RE: [PATCH v2 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Thread-Topic: [PATCH v2 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Thread-Index: AQHVMXpGeT4aQWsNQ0KL+gAQlHHL46a40smAgAxIY4CAFhNHAIABDMBg
Date:   Fri, 26 Jul 2019 01:22:48 +0000
Message-ID: <TYAPR01MB4544F226C06730C5611EB025D8C00@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190703083514.32385-1-horms+renesas@verge.net.au>
 <20190703083514.32385-3-horms+renesas@verge.net.au>
 <CAMuHMdVgx9N0yeeei5qcg1yz2WEdDf0gQ6GcwUOAz7u09S_D4A@mail.gmail.com>
 <20190711080302.qeotxueyvlr7pvhe@verge.net.au>
 <20190725090946.GA3311@kroah.com>
In-Reply-To: <20190725090946.GA3311@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6239c337-561f-49d8-73a8-08d71167c578
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3743;
x-ms-traffictypediagnostic: TYAPR01MB3743:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB37434BE2EC2906C3C1C3EBD6D8C00@TYAPR01MB3743.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(189003)(199004)(86362001)(6116002)(2906002)(55016002)(6246003)(7416002)(33656002)(9686003)(6436002)(81156014)(8676002)(4326008)(229853002)(81166006)(110136005)(6306002)(3846002)(53936002)(14454004)(305945005)(66066001)(8936002)(5660300002)(71190400001)(71200400001)(316002)(26005)(966005)(66556008)(99286004)(476003)(446003)(54906003)(256004)(25786009)(478600001)(102836004)(66946007)(11346002)(76176011)(7736002)(52536014)(7696005)(74316002)(186003)(66476007)(66446008)(68736007)(53546011)(486006)(6506007)(64756008)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3743;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7W6u4mslwTZeir+zRZKP4zq7BTP/QQ2bFh6xr+7V48HtUHLTdUs2PDalVu8zaob56KPoW23vPG4zaNMQvqhlIRhM46S+OiUMqJC0zw/Xeg5pwlbKnea8gUhBqwzuUMKHipYmaUPqruumWIN2uZMl13Xz13eVofEF1NX9iwm6NbhjleXK1lRvrO5ykFqfU3UD462f0N2F/98oEC4W6+7tzZ5v+p86pzwb7WG0TdN/EKgbYUtimXUTSRuezWBFVLZKnMswEQQvH+5OCzZnQc/PBNijTAakXudMFTtmeS8lraCNwnXq5HLSYKSHLjaJprFyOODFEDqpO2VR0YX4TcQWDtwW06DYmHyPZC51z6bgCaRyIJ12z/URei+9jD5WSkA0ffil2w/0b2y6mM3Rsg+DVTxxK+zy9t/mS7m/ao739Kw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6239c337-561f-49d8-73a8-08d71167c578
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 01:22:48.7294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3743
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

> From: Greg Kroah-Hartman, Sent: Thursday, July 25, 2019 6:10 PM
>=20
> On Thu, Jul 11, 2019 at 10:03:03AM +0200, Simon Horman wrote:
> > On Wed, Jul 03, 2019 at 02:28:51PM +0200, Geert Uytterhoeven wrote:
> > > Hi Simon,
> > >
> > > On Wed, Jul 3, 2019 at 10:35 AM Simon Horman <horms+renesas@verge.net=
.au> wrote:
> > > > For consistency with the naming of (most) other documentation files=
 for DT
> > > > bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> > > > documentation file from renesas-gen3.txt to renesas,usb3-peri.txt
> > > >
> > > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
.se>
> > > >
> > > > ---
> > > > v2
> > > > * Accumulate review tags
> > > > * Use renesas,usb3-peri.txt as new filename as suggested by Shimoda=
-san
> > >
> > > Unfortunately the previous version has already made it into usb-next
> > > 23c46801d14cb647 dt-bindings: usb: renesas_gen3: Rename bindings
> > > documentation file
> >
> > Ok, I guess we should go with that version.
>=20
> So can you resend this series based on 5.3-rc1 so I know what to apply?

Since your usb-testing branch already has it which is merged from Felipe's =
usb-next branch,
I don't think Simon has to resend this series.

https://www.spinics.net/lists/linux-usb/msg182103.html

Best regards,
Yoshihiro Shimoda

> thanks,
>=20
> greg k-h
