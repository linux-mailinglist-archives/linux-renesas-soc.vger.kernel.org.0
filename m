Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3740A1953B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2020 10:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgC0JTX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Mar 2020 05:19:23 -0400
Received: from mail-eopbgr1400090.outbound.protection.outlook.com ([40.107.140.90]:10828
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725946AbgC0JTX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 05:19:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zo6sgmlwkf9ySWokJi/pR9aQmn+XQ5hZrk1oVmcEl4lUSAzGHo+WBknO9uEabw/bF14tMeFp1MeQqRQoxqN2gxWzil4g7QgJ2U8jwjyYU7zL9moFYVTW7WinCDOf+pGUWQSaNEoedo+tnLhTc7UlvQJVsE+UWHZv0tHWvwrYXW/pIfAsMEdQZi1aovL89AlXEEUZSx5xBerifZwJJsXP+eRh0VGZYNy780LWslgcuQbtdBxBjymJHPybpmhEPl2dFQbCQBtQKlhrszubdY/sRDtBQPfRFkDpUsgXeRlwHexrTuXXbSGKYAtLQNUVf8+WfoVCSq35uJGFtMk5JkJQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WWd/EB7bKGVbjYf7lmOO/3qwqklrC7Ims8FSJ/BCr8=;
 b=jmHar2D7WK7Wy00+QYFYvs8uQulWWsPhSIcHNsdYZjDZBG8LxeN0ppVAaW6DoOM//bEmMs3ZU6O8U7r3R7LoqVjpKGgExKOQpg7+cMRccXB/0bsbXGFrao0ZVr3NVbDWHyf1AW3vxJPhX3xbs9MgLgPFXWB8iT5ydDsljlaMIp/BXMWFO0dKU9LVwdb4EtyQOfD9Iist4kYIFwKqVYrMl+r9uKL4zJS0gFIUwNFFNvTffYX2J9HFNDtQoru5pflFBtHdetsRkCp8ZR+w3vnUCstCDXyMJpFZFD3IyoOiFNuxMX6ljWBYb2yTp7vBg1K7Ehar7nDZsZz+2gioyqn00w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WWd/EB7bKGVbjYf7lmOO/3qwqklrC7Ims8FSJ/BCr8=;
 b=i1tpjs5LJmmlmhTeCWjIL8ZcgI8X8D5SM6lgwcJKIP2JswuKv5O2bOliEHW16Uwv0mccBs5/x4PuwEZrvcts4swUwkn34bRPHpLhHhKhhfF14SIRIXSkou7dOMn7WKXlnVFBChjbDtREG7T140TDYziiL3E292vhpkBRSFv84yo=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4063.jpnprd01.prod.outlook.com (20.178.140.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Fri, 27 Mar 2020 09:19:20 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 09:19:19 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/4] dt-bindings: phy: renesas: usb2-phy: convert
 bindings to json-schema
Thread-Topic: [PATCH v3 1/4] dt-bindings: phy: renesas: usb2-phy: convert
 bindings to json-schema
Thread-Index: AQHWA/iZb4r2sibuR06+pRT+YCncm6hcIuKAgAAF3uA=
Date:   Fri, 27 Mar 2020 09:19:19 +0000
Message-ID: <TYAPR01MB4544104071EEA9DA9BF86B96D8CC0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1585286923-11740-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585286923-11740-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdV+kPei=4tBb8FGC1oE2+sRffXRz2KZtKU7svyz=22AGg@mail.gmail.com>
In-Reply-To: <CAMuHMdV+kPei=4tBb8FGC1oE2+sRffXRz2KZtKU7svyz=22AGg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.148]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ca2af7de-3a51-4748-7de6-08d7d22fee4e
x-ms-traffictypediagnostic: TYAPR01MB4063:
x-microsoft-antispam-prvs: <TYAPR01MB406382A901F77500E64995A3D8CC0@TYAPR01MB4063.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(81156014)(71200400001)(186003)(2906002)(4326008)(86362001)(4744005)(8676002)(6916009)(26005)(6506007)(76116006)(55016002)(5660300002)(52536014)(9686003)(33656002)(66446008)(7696005)(66476007)(66556008)(64756008)(8936002)(316002)(478600001)(81166006)(66946007)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4063;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OWhIQ7ZFSnRwkvW5pKiC6ibBNECFPhb18Tw+lold6OUHo2shyuNlh4xjJj82+2ExJJzZ/w8ezG4Isz2Wb3KFT8FNpFQCNHfMZt7teaKzi+DEPc+iv3GQro1VYS2wKYkhqzmF6ko/v3VTO+nHIPiGIP4WAx0MlgBmcLqk/8rGXIfCrZP9EkhVj9MziS7L/rBRBczEyMlaytHW/a7IYeoBmYrwZgbr4EpTRCgpxVZU69gNgFdZQYwq4d9jzXkPPGgq9eqKsPVjYR9B47zRXo65Vmgf3Jw21dg7W8N/Djj5FAMvLL4ymuu9ksA2cQgq/HpvvvrQZVL6Pc3zEVoNxi3xuE4LXHIGVbS7ag9LKgy1+3rYwXZVss/OKeLzquxGOzPJkBcJs6XEnfPdh7U9xw+yEaL7vEgU6rjJ7Rs3pyLhMBcNlKbip41gIgl96eRU/UXu
x-ms-exchange-antispam-messagedata: 8Sbp+XcN9b9tn/V5YohJwSw119fjqdA96rZAiJI3EspHP1pUmAPZUitcOiDs05UUbObSnKODErmsF+8/gfVziwQ3D/3wf9PLDUmHQeyXlr2QhI9S5CeGZClihi1gNqWoF3gs71fTApbqIixlxZ30ug==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2af7de-3a51-4748-7de6-08d7d22fee4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 09:19:19.8682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HHwZ9FH06EUCxrA8a1qjJAq5XmH3RSl1/2Es9hU7zeDN9h6lbU7E+ZJrkBp2WUyEWoTAqsbH4jyFURYQMR9dFIbnDTtefxhP9aPXsTv22Z0Zp7EniPQZ/oKuVogW9F9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4063
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5LCBNYXJjaCAyNywgMjAyMCA1OjU1IFBNDQo8
c25pcD4NCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3Jj
YXItZ2VuMy1waHktdXNiMi50eHQNCj4gPiArKysgL2Rldi9udWxsDQo+IA0KPiA+IC1UaGUgcGhh
bmRsZSdzIGFyZ3VtZW50IGluIHRoZSBQSFkgc3BlY2lmaWVyIGlzIHRoZSBJTlRfU1RBVFVTIGJp
dCBvZiBjb250cm9sbGVyOg0KPiA+IC0tIDEgPSBVU0JIX0lOVEEgKE9IQ0kpDQo+ID4gLS0gMiA9
IFVTQkhfSU5UQiAoRUhDSSkNCj4gPiAtLSAzID0gVUNPTV9JTlQgKE9URyBhbmQgQkMpDQo+IA0K
PiBTb3JyeSwgSSBmYWlsZWQgdG8gbm90aWNlIGR1cmluZyBteSBwcmV2aW91cyByZXZpZXcgdGhh
dCB0aGUgYWJvdmUgaW5mb3JtYXRpb24NCj4gaXMgbG9zdCBkdXJpbmcgdGhlIGNvbnZlcnNpb24u
ICBJIHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QgdG8gcmV0YWluIGl0IGluIHRoZQ0KPiBkZXNjcmlw
dGlvbiBmb3IgI3BoeS1jZWxscy4NCg0KSSBhZ3JlZS4gSSdsbCBhZGQgaXQuDQoNCj4gV2l0aCB0
aGF0IGFkZGVkOg0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4NCg0KVGhhbmtzIQ0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hp
bW9kYQ0KDQo=
