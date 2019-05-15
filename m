Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B47D1F51C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 15:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfEONMC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 09:12:02 -0400
Received: from mail-eopbgr1400099.outbound.protection.outlook.com ([40.107.140.99]:38448
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727388AbfEONMC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 09:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtG8GOaTYegz1xU/k9K+m0hSrCUOC3OUBU8nTwz+ms0=;
 b=U5UHRFmFo84aMbq5uTgtraBRS5HHvFfmxhpjdb/HntYr9K0lRhSoAWgDTim5kFRxvEvVQpqg3DUEP7nXZ2y8xpGllEmK+pRGXS4QVHKlInwqE9mfJzbivd58FNHKHRGbXYYDFr3Sak6DDpkVD5X3QruQWZ/W53U5S021/TaCVU4=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1885.jpnprd01.prod.outlook.com (52.133.169.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 13:11:57 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::c989:cb4d:b41e:2045%7]) with mapi id 15.20.1900.010; Wed, 15 May 2019
 13:11:57 +0000
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
Subject: RE: [PATCH v3 12/15] dt-bindings: usb: renesas_usbhs: Add support for
 r7s9210
Thread-Topic: [PATCH v3 12/15] dt-bindings: usb: renesas_usbhs: Add support
 for r7s9210
Thread-Index: AQHVCmV0XPRlldcJ5E2fJ9gGZbjhzqZr086AgABWmmA=
Date:   Wed, 15 May 2019 13:11:57 +0000
Message-ID: <TYXPR01MB1568502702CA9A059F2BC4998A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-13-chris.brandt@renesas.com>
 <CAMuHMdVKAB0CtqgEgyeoeFoFrg5sFdm03F_PDHztq224G_ugXg@mail.gmail.com>
In-Reply-To: <CAMuHMdVKAB0CtqgEgyeoeFoFrg5sFdm03F_PDHztq224G_ugXg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fb4fe39-d7b4-483c-8758-08d6d936e8f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYXPR01MB1885;
x-ms-traffictypediagnostic: TYXPR01MB1885:
x-microsoft-antispam-prvs: <TYXPR01MB1885AE2EB143CDB052FB80478A090@TYXPR01MB1885.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(346002)(136003)(396003)(39860400002)(199004)(189003)(305945005)(7696005)(7736002)(6506007)(76176011)(71190400001)(54906003)(186003)(26005)(71200400001)(229853002)(74316002)(6436002)(6916009)(6246003)(102836004)(7416002)(66446008)(33656002)(64756008)(66556008)(66476007)(558084003)(53936002)(99286004)(66946007)(73956011)(76116006)(52536014)(86362001)(55016002)(9686003)(476003)(11346002)(446003)(8936002)(316002)(4326008)(25786009)(81156014)(81166006)(8676002)(68736007)(256004)(72206003)(5660300002)(14454004)(478600001)(2906002)(486006)(3846002)(66066001)(6116002)(138113003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1885;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zihXO+rcPqccES4H9k3+UdeUhuoVupmL0KTSrSjuUSF+ne8Z36gCnOOjvaxKHi7TeO3MNpUTC+g4yc4ew/YtDUK5XsqIYXes7tIg2f//P0tKesnC8d8LCWHo//vnFoaTI2sbkH9cxI8WPtf8+u4laPRGmoB9hSAutW3b6Jecs2Cany8v8vGP1594AHxTpc2qmItgKFk+wjP4JhPz6ig39uYRBY4sPOekUUYC7sAfctx11V5l+cvuhGHOdS4+LPZV/Epp88Sz5t2HhPvTgVT8vsn+gD7/scbzzziDzJCDaLpDiC+arDDYrkUzDuhpm/L83fGdcxUS8jM2QsKted+mgdreg6b6ud69Lu+CaSsVW1GuEJGSLHKLnXlQiDO1aWPzlxvr3CGXGEBI9spgwU5Kq/O/vx9xbviHWQbCnOJD6CM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb4fe39-d7b4-483c-8758-08d6d936e8f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 13:11:57.7855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1885
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFdlZCwgTWF5IDE1LCAyMDE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+ID4gKyAgICAgICAtICJyZW5lc2FzLHVzYmhzLXI3czkyMTAiIGZvciByN3M3MjEwMCAo
UlovQTIpIGNvbXBhdGlibGUgZGV2aWNlDQo+IA0KPiBmb3IgcjdzOTIxMCAuLi4NCg0KDQpUaGFu
ayB5b3UhDQoNCg0KQ2hyaXMNCg==
