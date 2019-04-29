Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C142BE281
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 14:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfD2MZQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 08:25:16 -0400
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:43232
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728005AbfD2MZQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 08:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXi0PzQBcTaVfb4Te06wM7Ri9eVVQFSQqsrolYwXmnA=;
 b=lw8aZnacT5lqnK927PFTmTmsrAV0SaZ38iHmCgJOfKe6ZyB8qdwyI96Z7D6iinxvdgrDgki+zaJ4Jw4Zwf7ojBCvdy1ZG7KOUA+P7QQsHOFYJSeWGFE6fxV4qG5O7VuBQ0XdqvrxKo4pg5BjVsonwDZKdhfFr7o3mXvWQcMe1k4=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1676.jpnprd01.prod.outlook.com (52.133.163.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 12:25:11 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 12:25:11 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marc Zyngier <marc.zyngier@arm.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/5] irqchip: Add Renesas RZ/A1 Interrupt Controller
 driver
Thread-Topic: [PATCH 2/5] irqchip: Add Renesas RZ/A1 Interrupt Controller
 driver
Thread-Index: AQHU/m8PB9wkGP0JyE6XlHkrtJGBYaZS6auAgAAU5ICAABDeMA==
Date:   Mon, 29 Apr 2019 12:25:11 +0000
Message-ID: <TY1PR01MB1562E95253A89499124CC6978A390@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190429093631.10799-1-geert+renesas@glider.be>
 <20190429093631.10799-3-geert+renesas@glider.be>
 <f9310d4c-8f9e-a837-3ed3-4d7c294efd3f@arm.com>
 <CAMuHMdU3i7vqs9hd7rfvYH8QtqvwUB5vgsa_fwo5L4E3DQ_d1Q@mail.gmail.com>
In-Reply-To: <CAMuHMdU3i7vqs9hd7rfvYH8QtqvwUB5vgsa_fwo5L4E3DQ_d1Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c16a221-4348-4b8e-63b8-08d6cc9db9b2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1676;
x-ms-traffictypediagnostic: TY1PR01MB1676:
x-microsoft-antispam-prvs: <TY1PR01MB16766E638159CC99599726A88A390@TY1PR01MB1676.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(136003)(396003)(346002)(366004)(376002)(189003)(199004)(8676002)(81156014)(8936002)(81166006)(93886005)(486006)(476003)(33656002)(11346002)(97736004)(446003)(478600001)(72206003)(4744005)(66066001)(14454004)(71190400001)(256004)(5660300002)(71200400001)(52536014)(99286004)(86362001)(4326008)(186003)(25786009)(54906003)(316002)(110136005)(305945005)(68736007)(7736002)(74316002)(102836004)(7416002)(9686003)(76176011)(26005)(3846002)(6116002)(6506007)(55016002)(53936002)(2906002)(6436002)(7696005)(6246003)(229853002)(76116006)(66556008)(66476007)(66946007)(64756008)(73956011)(66446008);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1676;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BINyxRntme5yBXnSMxDvwapodzVx3jPxaqhZzWtLdKfCKIU/esNfasd86T2TSrucvIoDh9uUWKdqmbCG2to2unbIxupZex/V109zoKrCjb3thD+eRse0Js6KrfPtoYqBxNWOpkSdkZKCk1AkIdR7/I6IN+AsVfk0Pf0C19qy3jo0zySvSBPyIFgsgK3BYBkxBakptykK669KjEXiFZrK4a911pG09kP+FxwIxMEUE/oLJSpjtCpJaMjElh2Ou+wAemftC1RnKKlhoZOzUpKmunr+kvZkRvaJ/ZS5pUWNP0a0VKk+zZtTeF6OYzhsskPSR59LNO4g33CnGvHNaqn+qu0WepE9SxI3zZRjM7R8kxm1uZh1QSq/Wl4pdcQMj/muvTt/bTQCxyw7WxnpJJRL+J5HlwU9xztU68ZHiHPyewA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c16a221-4348-4b8e-63b8-08d6cc9db9b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 12:25:11.4319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1676
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIE1vbiwgQXByIDI5LCAyMDE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+ID4gSXQgb3RoZXJ3aXNlIGxvb2tzIGdvb2QgdG8gbWUuIElmIHlvdSByZXNwaW4gaXQg
cXVpY2tseSBlbm91Z2gsIEknbQ0KPiA+IGhhcHB5IHRvIHRha2UgaXQgZm9yIDUuMi4NCj4gDQo+
IFRoYW5rcywgd2lsbCBkbyB0b21vcnJvdywgc28gQ2hyaXMgKGluIE5DLlVTOyBsZXQncyBob3Bl
IGhlIGRvZXNuJ3QNCj4gY2VsZWJyYXRlIEdvbGRlbiBXZWVrKSBoYXMgYSBjaGFuY2UgdG8gY29t
bWVudC4uLg0KDQpObyBHb2xkZW4gV2VlayBmb3IgbWUuDQoNCkV4Y2VwdCwgSSBnZXQgMSB3ZWVr
IGEgeWVhciB3aGVuIEkgd2FrZSB1cCBpbiB0aGUgbW9ybmluZyBhbmQgbXkgaW5ib3ggDQppcyBu
b3QgYWxyZWFkeSBmdWxsLi4uc28gaXQgaXMgYSBnb2xkZW4gd2VlayBmb3IgbWUuIDopDQoNCkkn
bSBnb2luZyB0byB0cnkgdGhlc2UgcGF0Y2hlcyBvdXQgb24gUlovQTEgYW5kIFJaL0EyIHRvZGF5
Lg0KDQoNCkNocmlzDQo=
