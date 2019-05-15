Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3992F1F661
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 16:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfEOOSW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 10:18:22 -0400
Received: from mail-eopbgr1400122.outbound.protection.outlook.com ([40.107.140.122]:59173
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725953AbfEOOSW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 10:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLTD93r+R7LeBUO+/zvFX3naY2sFL/83QQ0hqbimby0=;
 b=Po1PO9ctEiD6GTrimBEDElQ1EnI30fJ1K9l0eUPEfihPlN+4vrgAzxKzAAZdynH88KfC36VZhSLhYRdck4OktIE7rcTeZY7/GDNLAZr97j7/yK+sRpjR5hDjRK0JvXOJFPvErXTnxqy4Sq2kEzUZCuUMCoqB7A0S11YuK8B26gM=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1664.jpnprd01.prod.outlook.com (52.133.167.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 14:18:18 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045%7]) with mapi id 15.20.1900.010; Wed, 15 May 2019
 14:18:18 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Topic: [PATCH v3 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Index: AQHVCmVwqsbIgol6iEKvZrJ46ECCEKZr2uSAgABfriA=
Date:   Wed, 15 May 2019 14:18:18 +0000
Message-ID: <TYXPR01MB15687A77DA9CEC27D214B17E8A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
        <20190514145605.19112-12-chris.brandt@renesas.com>
 <871s106ssi.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871s106ssi.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbe930bf-fabe-4ea6-82e6-08d6d9402d75
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYXPR01MB1664;
x-ms-traffictypediagnostic: TYXPR01MB1664:
x-microsoft-antispam-prvs: <TYXPR01MB16647739086FDF906E75CB358A090@TYXPR01MB1664.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(39860400002)(396003)(366004)(136003)(199004)(189003)(6246003)(6862004)(486006)(66476007)(476003)(86362001)(53936002)(8676002)(81156014)(73956011)(66946007)(76116006)(4326008)(74316002)(316002)(558084003)(72206003)(6636002)(7416002)(66446008)(64756008)(66556008)(14454004)(446003)(26005)(52536014)(8936002)(11346002)(256004)(25786009)(71190400001)(71200400001)(5660300002)(68736007)(81166006)(7736002)(186003)(305945005)(6116002)(3846002)(99286004)(102836004)(9686003)(229853002)(7696005)(76176011)(33656002)(6506007)(54906003)(2906002)(66066001)(478600001)(6436002)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1664;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TSdEIvpPwj3isQgkAUncP2xZV7WJfP+rmoHaj5tHQRo4G9uHkFPg7Ux19loQ3wO5sKIZ2F43tebmX7B5JZfRuGsdoyll0+/7ZQn6Xls6UVjyRAzynN7aJJPYdta/nPhU5VyllMxOZ8tPVpkKf16Ppe7vT3MPRKRBbZ1imO5pdDd1+PqvTQ8a6TKVs7b/sfGNiZXdvV2BKNQ1x5CXfrXOIuEsMQh0NkxKm0cH8Yjn2bFb2zIuQwGFOlKEU27zhHhPPk01i0Bt8pXUWM5Z6wZlLKr6fm4Ip0xnTsW1mQRLGv9Ao7dF4C8xSNLxVxX3qTdKwkYREauUILigi63aNRbMXNY0DblqAPsLtexSwRYTC0AbWEJTw6v6D+6gNBE/blU5YcWDFy7oPl3QRctwuFhk2wdPNuAbTf7h5yYbH0X/S48=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe930bf-fabe-4ea6-82e6-08d6d9402d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 14:18:18.2364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1664
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

> > +	if (priv->phy) {
> > +		phy_put(priv->phy);
> > +		priv->phy =3D NULL;
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> phy_put() will do nothing if priv->phy was NULL.
> We can remove if() here ?

OK. I will remove 'if'.

#I copied Shimoda-san's code from rcar.2  :)


Chris

