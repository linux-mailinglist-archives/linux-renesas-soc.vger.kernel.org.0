Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3D61F62C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 16:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfEOODN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 10:03:13 -0400
Received: from mail-eopbgr1400112.outbound.protection.outlook.com ([40.107.140.112]:20794
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726702AbfEOODN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 10:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jpBzTsym1SVZUteQvpuQTMPwCfm8ZGGyCFeF0gvomI=;
 b=bro+OQKa5PS6mq0qP9d7mBQ7pSxbVWvI9qs1RCzeghPtMoFObaE0l/Fsu9VjLHFqWW5HjwXeJu0GY+3JYuoHUZw0lHiTutLsZtstVrtomM2JJW0XxVZl5EE6RrXS3RD57yYzOnv2jDLasy/RNjFGJuxDTms0AyNVNfkCmUAe+cU=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1645.jpnprd01.prod.outlook.com (52.133.167.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 14:03:07 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045%7]) with mapi id 15.20.1900.010; Wed, 15 May 2019
 14:03:07 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 15/15] ARM: dts: rza2mevb: Add USB host support
Thread-Topic: [PATCH v3 15/15] ARM: dts: rza2mevb: Add USB host support
Thread-Index: AQHVCmWCnsI2dzmQpU69erLMQyE+h6Zr2ZoAgABbaPA=
Date:   Wed, 15 May 2019 14:03:07 +0000
Message-ID: <TYXPR01MB15689E3664801057DFCA09EA8A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-16-chris.brandt@renesas.com>
 <CAMuHMdXx=7v5v3tHwS-01eNnzz6NSfs=M02jU1tNJMdcRbGScg@mail.gmail.com>
In-Reply-To: <CAMuHMdXx=7v5v3tHwS-01eNnzz6NSfs=M02jU1tNJMdcRbGScg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5edd8a82-f731-44d0-f7c5-08d6d93e0ecc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYXPR01MB1645;
x-ms-traffictypediagnostic: TYXPR01MB1645:
x-microsoft-antispam-prvs: <TYXPR01MB1645F869DE9ED15F33002B468A090@TYXPR01MB1645.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(26005)(76176011)(6506007)(7736002)(305945005)(81166006)(68736007)(81156014)(99286004)(33656002)(8676002)(7696005)(186003)(4744005)(2906002)(52536014)(5660300002)(73956011)(102836004)(66946007)(486006)(76116006)(476003)(446003)(11346002)(71200400001)(71190400001)(256004)(66476007)(229853002)(6116002)(6436002)(316002)(55016002)(8936002)(3846002)(478600001)(72206003)(14454004)(64756008)(66556008)(66446008)(54906003)(74316002)(4326008)(6916009)(7416002)(9686003)(53936002)(6246003)(25786009)(86362001)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1645;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0TxQ+VPwWP4jTUjPeEcG7NBwQuJbPILWjb9/8XFYy4bpBphSYEsR7oazDdteCGdaGwCuVUDjQXm2h+etvapmsS5q5vDtJgm/kV358lY9iqy5CrPnz5XeuiZ77HBWAC36kL+uidfzP2F7r8Emm83nUsVYlAdTPv6et4vuoBr+FU3NsNDcCYmHz7MOPoaSROwv1pw/KWLuyrMKgxpZrX2Jt90vxoUIc/GaAKCfSz6P/47fYIwZ4Ch26HaHs60i5H0E+KIDMFDBESQHkbfRYpqtrTzfVYLgrmazvuimW/rcCiufT1+J6+RXP8GK1UnC0MqMVddn371icINud9gOJ1XILyqTi786SYXQpCfKjWX82hEqh8iiWnUK23A/EXcU8h1DrpRBfXC16pzYTEUlccSasJ4BfZ4Bq79xeEB2oT03mWM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5edd8a82-f731-44d0-f7c5-08d6d93e0ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 14:03:07.8447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1645
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFdlZCwgTWF5IDE1LCAyMDE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+ID4gKy8qIFVTQi0wIGFzIEhvc3QgKi8NCj4gPiArLyogTk9URTogUmVxdWlyZXMgSlAz
IHRvIGJlIGZpdHRlZCAqLw0KPiANCj4gVGhpcyBub3QgYXBwbGllcyB0byB0aGUgZHJfbW9kZSBw
cm9wZXJ0eSBiZWxvdywgcmlnaHQ/DQo+IFNvIHBlcmhhcHMgaXQgc2hvdWxkIGJlIG1vdmVkIHRo
ZXJlLi4uDQo+IA0KPiA+ICsmdXNiMl9waHkwIHsNCj4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7DQo+ID4gKyAgICAgICBwaW5jdHJsLTAgPSA8JnVzYjBfcGlucz47DQo+ID4g
KyAgICAgICBkcl9tb2RlID0gImhvc3QiOw0KPiANCj4gLi4uIGxpa2U6DQo+IA0KPiAgICAgZHJf
bW9kZSA9ICJob3N0IjsgICAgLyogUmVxdWlyZXMgSlAzIHRvIGJlIGZpdHRlZCAqLw0KDQpPSywg
aWYgeW91IHRoaW5rIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdGhlcmUuDQoNCg0KPiBEb2VzIHJlc2lz
dG9yIFI3OCBuZWVkIHRvIGJlIG1vdW50ZWQsIHRvbz8NCg0KQnkgZGVmYXVsdCwgUjc4IGFuZCBS
NzkgYXJlIG5vdCBwb3B1bGF0ZWQgb24gdGhlc2UgYm9hcmRzLCBhbmQgYm90aCBIb3N0DQphbmQg
RnVuY3Rpb24gd29yayBmaW5lIHdpdGhvdXQgYm9hcmQgbW9kaWZpY2F0aW9uLCBzbyBJIHdvdWxk
IHNheSANCnBvcHVsYXRpbmcgUjc4IGlzIG5vdCBhIHJlcXVpcmVtZW50IGFzIGZhciBhcyBJIGNh
biB0ZWxsLg0KDQpDaHJpcw0K
