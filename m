Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B306C19CF0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 13:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727255AbfEJL4q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 07:56:46 -0400
Received: from mail-eopbgr1400117.outbound.protection.outlook.com ([40.107.140.117]:1312
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727238AbfEJL4q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 07:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpeRmQWNkYHJH9VVrCVuehZ23rsPo/3PaaQNseizrq0=;
 b=ovYj8PrIG5XmgRu7NwzJ2aruGHD0HGVqHjg8/98GE1kEvGABWGnEbc59oKXs6+/EdFcTZ7FzyiNOEFJ0uofHLVklCcJ/40649vq4pAYTx4xiNyFVbliLOLQZmPEovM3swttApKW6NKQN2tW61lJ89JkNNBrUvUumuJKpaPp9qw8=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB5126.jpnprd01.prod.outlook.com (20.179.181.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 10 May 2019 11:56:03 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 11:56:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: renesas_usbhs: Use specific struct instead of
 USBHS_TYPE_* enums
Thread-Topic: [PATCH] usb: renesas_usbhs: Use specific struct instead of
 USBHS_TYPE_* enums
Thread-Index: AQHVBx6Shih0Fs04E0yUFwQ8PkGfqaZkNnAAgAACLEA=
Date:   Fri, 10 May 2019 11:56:03 +0000
Message-ID: <OSBPR01MB31744FA68CED11076F55B3C5D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <1557485323-3349-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVO3jLUP4HrAYJ8vxtSDfcK61G95ZzeQWQBEam+9_ycUA@mail.gmail.com>
In-Reply-To: <CAMuHMdVO3jLUP4HrAYJ8vxtSDfcK61G95ZzeQWQBEam+9_ycUA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f32ffb4f-53a8-4bfd-3506-08d6d53e7a1e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB5126;
x-ms-traffictypediagnostic: OSBPR01MB5126:
x-microsoft-antispam-prvs: <OSBPR01MB5126CF01BD371998C235F8E0D80C0@OSBPR01MB5126.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(186003)(25786009)(9686003)(99286004)(66066001)(53546011)(102836004)(6506007)(6436002)(5660300002)(4326008)(7696005)(55016002)(54906003)(76176011)(26005)(478600001)(2906002)(3846002)(256004)(486006)(6116002)(74316002)(86362001)(71190400001)(71200400001)(68736007)(33656002)(305945005)(64756008)(66476007)(446003)(66446008)(66556008)(76116006)(11346002)(73956011)(66946007)(476003)(8936002)(53936002)(81156014)(81166006)(6246003)(6916009)(229853002)(52536014)(8676002)(316002)(7736002)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB5126;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fblMon0NSds2fnwaDkFo1byBDG36fIivArvOsYF3P4Mnb1pM8Dxe0xOIWKZhbCaVExoKrOyV1ot8vSo75NIB7/SnYlDcYaB3gMwndsGwLmaD3rhY6IFOpmNp/TyLT44C95RbLrGMCq6ae+zdXtfJ7n1C8K63M+A+ZNXoTQ55uAXO+kfzZz4HjgbPVgZewtApYr1KRExUDLFauWHUo6s+dPlb/WhFIWEnMsZ3dPJy8INboysLk/zKaKJEgOdwdmPOFtjxkDkF47fHMNBNh98ROyybNyWi1p228b0DrjvPZScCW0nG41wH5GoEoVV/OOWpVqpGKsfMO0aHEEsrFqSNewgNNKYXIniOLYrHlqDi3eDQyWPkbnMkuWH4Rp+8NdEiOa1eRdBg9cludaR0WKU2mjnwCnCuwxKW8iTDdfxXeTU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32ffb4f-53a8-4bfd-3506-08d6d53e7a1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 11:56:03.0463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5126
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBNYXkgMTAsIDIwMTkgODoyMCBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0KPiBPbiBG
cmksIE1heSAxMCwgMjAxOSBhdCAxMjo1MyBQTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBh
IHNwZWNpZmljIHN0cnVjdCAidXNiaHNfb2ZfZGF0YSIgdG8gYWRkIGEgbmV3IFNvQw0KPiA+IGRh
dGEgZWFzaWx5IGluc3RlYWQgb2YgY29kZSBiYXNpcyBpbiB0aGUgZnV0dXJlLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJl
bmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gTG9va3MgY29y
cmVjdCB0byBtZSwgc28NCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+DQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCj4gd2l0
aCBhIGZldyBzdWdnZXN0aW9ucy9xdWVzdGlvbnMgYmVsb3cuLi4NCj4gDQo+ID4gLS0tIGEvZHJp
dmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL3Jl
bmVzYXNfdXNiaHMvY29tbW9uLmMNCj4gDQo+ID4gQEAgLTU5OCw4ICs2MzgsMTUgQEAgc3RhdGlj
IHN0cnVjdCByZW5lc2FzX3VzYmhzX3BsYXRmb3JtX2luZm8gKnVzYmhzX3BhcnNlX2R0KHN0cnVj
dCBkZXZpY2UgKmRldikNCj4gPiAgICAgICAgIGlmICghaW5mbykNCj4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIE5VTEw7DQo+ID4NCj4gPiArICAgICAgIGRhdGEgPSBvZl9kZXZpY2VfZ2V0X21h
dGNoX2RhdGEoZGV2KTsNCj4gPiArICAgICAgIGlmICghZGF0YSkNCj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIE5VTEw7DQo+ID4gKw0KPiA+ICAgICAgICAgZHBhcmFtID0gJmluZm8tPmRyaXZl
cl9wYXJhbTsNCj4gPiAtICAgICAgIGRwYXJhbS0+dHlwZSA9ICh1aW50cHRyX3Qpb2ZfZGV2aWNl
X2dldF9tYXRjaF9kYXRhKGRldik7DQo+ID4gKyAgICAgICBtZW1jcHkoZHBhcmFtLCAmZGF0YS0+
cGFyYW0sIHNpemVvZihzdHJ1Y3QgcmVuZXNhc191c2Joc19kcml2ZXJfcGFyYW0pKTsNCj4gDQo+
IHNpemVvZihkYXRhLT5wYXJhbSksIGZvciBpbmNyZWFzZWQgc2FmZXR5Pw0KDQpJIGdvdCBpdC4g
SSdsbCBmaXggaXQgb24gdjIgKG1heWJlIEknbGwgc3VtYm1pdCBpdCBpbiBuZXh0IHdlZWspLg0K
DQo+ID4gKyAgICAgICBtZW1jcHkoJmluZm8tPnBsYXRmb3JtX2NhbGxiYWNrLCBkYXRhLT5wbGF0
Zm9ybV9jYWxsYmFjaywNCj4gPiArICAgICAgICAgICAgICBzaXplb2Yoc3RydWN0IHJlbmVzYXNf
dXNiaHNfcGxhdGZvcm1fY2FsbGJhY2spKTsNCj4gDQo+IHNpemVvZihkYXRhLT5wbGF0Zm9ybV9j
YWxsYmFjayk/DQoNCkknbGwgZml4IGl0Lg0KDQo+IEknbSBub3QgcmVhbGx5IGZhbWlsaWFyIHdp
dGggdGhpcyBkcml2ZXIgYW5kIHdpdGggdGhlIFVTQiBzdWJzeXN0ZW0sIGJ1dA0KPiB3aHkgaXMg
dGhpcyBkcml2ZXIgY29weWluZyBzbyBtYW55IHN0cnVjdHMgYXJvdW5kLCBpbnN0ZWFkIG9mIGp1
c3QNCj4ga2VlcGluZyBwb2ludGVycyB0byB0aGUgb3JpZ2luYWxzPw0KDQojIEknbSBhbHNvIHRo
aW5raW5nIGlmIGp1c3Qga2VwcGluZyBwb2ludGVycyBhcmUgc2ltcGxlIHRoYW4gY29weWluZyB3
aGVuIEkgbWFkZSB0aGlzIHBhdGNoIHRob3VnaCwNCkkgZG9uJ3Qga25vdyB3aHkgYmVjYXVzZSB0
aGUgb3JpZ2luYWwgYXV0aG9yIGlzIE1vcmltb3RvLXNhbiA6KQ0KQnV0LCBJIGd1ZXNzOg0KIC0g
U29tZSBTSCBib2FyZHMgaGFzIHRoZSByZW5lc2FzX3VzYmhzX3BsYXRmb3JtX2luZm8gZGF0YS4N
CiAtLSBUaGlzIGlzIHJlbGF0ZWQgdG8gLnBsYXRmb3JtX2RhdGEuDQogLS0tIGFuZCBpdCB3aWxs
IGJlIGRlbGV0ZWQgYWZ0ZXIgaW5pdGlhbGl6YXRpb24gYmVjYXVzZSBzb21lIHJlYXNvbnMgKF9f
aW5pdGRhdGEgc2VjdGlvbj8pLg0KIC0tLS0gU28sIGtlZXBpbmcgdGhlIGRhdGEsIHRoZSBkcml2
ZXIgY29waWVzIGl0IHRvIG93biBhbGxvY2F0ZWQgbWVtb3J5Lg0KDQpJJ2xsIHRyeSB0byBzaW1w
bGlmeSB0aGUgY29kZSBsYXRlci4NCg0KPiBJcyBhbGwgb2YgdGhhdCBkb25lIGp1c3Qgc28gLm5v
dGlmeV9ob3RwbHVnKCkgY2FuIGJlIG92ZXJyaWRkZW4sIG9yIGFtIEkNCj4gbWlzc2luZyBzb21l
dGhpbmc/DQoNClllcywgaXQgc2VlbXMgYW55IFNIIGJvYXJkcyBkb24ndCBoYXZlIHRoZSAubm90
aWZ5X2hvdHBsdWcuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gVGhh
bmtzIGFnYWluIQ0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiAN
Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
