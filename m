Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C552607E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 03:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbgIHBBV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 21:01:21 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:31407
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726918AbgIHBBT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 21:01:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jj171QLrsZLUPPYMEddeKNj9/2bPcd30lWa/J+IvkSiKSNpTfneZtYBbU4Pq4AI9FECUh2SxUPLS4fU9Zi2bcysBqnpW/Yue5b9Rdo1Ggti0CG+xofhvxyI6rA6wbGpOXEJNprkcQpgS9QLPQ9TWlIC2llpzPJIP15ywNR89EFH8J6kgfJr+Pr2BoQNxspS+vi6snVDSgW+qF4XRFGrooYLg1H5+6NOT/WuL/hy3oYPVYTdoyDObWFmkwlH4T8/qW7zqwBXt9zblF46NZPntymN2g93gV9q0rvE87gJRLdiD6NFx9qYNBLOuwurWq97KfrlUkBP2k0KiWKGo8YyAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idm5oyJlWDhTBXNAHgOzNXWEOLvCwj6E2r0OQQzfL3g=;
 b=C1vbOof9CBeAG9kJG6YHA2BOO+xG9K3pTfqjbw2I2//Ov6OrI4wJDql9rDHcuId0Y6OrmcFjK1eabf96c0OOU3+r2wzFniwvMkAMiQN889oxDxMdTR9u/rw2qG8AaSoy7/uIVzdzsevMy55QHY3TFpuirFWBu+in1FAAtXXA1aj9ve498tX2zu9IY509MHAFoilncI3PXM0CODXczKpoSul3YmhvG/I7GIvViFhqVbhR8bbvEWE6DAvNGrALdbL6YhTuw5lGwc9thY7lRMuBUaJT6Ce7Sjsk7lbGud+gRRaDRTBc5dGx/2QBfXEVkuJf8uHxdQEHHnk7gNtWHwdtgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idm5oyJlWDhTBXNAHgOzNXWEOLvCwj6E2r0OQQzfL3g=;
 b=eyJFu4GGMjjLn0hOQoVBikhKZs5cJbRYkV3rSNL5qBFGqz/6E5pvXKwCQv8jJYQM9bla70dGinKvF4QEgnsk1mLMJlcKkDo8bfvKMOBTNepkxnO5PT14A0DMYaNv7YmmBmxi2bQh6E3OyqY88A5Wfm87Om61gr7F2qT1q1AhwOc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB1903.jpnprd01.prod.outlook.com (2603:1096:404:4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 01:01:15 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 01:01:15 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas Falcon
 boards
Thread-Topic: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas Falcon
 boards
Thread-Index: AQHWhPgVqH2AcydHXEixjAxMOPZFmaldTeAAgACLPhA=
Date:   Tue, 8 Sep 2020 01:01:15 +0000
Message-ID: <TY2PR01MB3692F7496EE91E633E9EF68AD8290@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX_be=+3soDGQBxPGvjF5Ty40wDEPaki3Z=SwbDToPA3g@mail.gmail.com>
In-Reply-To: <CAMuHMdX_be=+3soDGQBxPGvjF5Ty40wDEPaki3Z=SwbDToPA3g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:7120:412c:ecaf:cff5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b478b1d0-02fd-47d2-599b-08d85392afdd
x-ms-traffictypediagnostic: TYAPR01MB1903:
x-microsoft-antispam-prvs: <TYAPR01MB19035B5F22BBB46C78895284D8290@TYAPR01MB1903.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JxRxUJDlToJhIlOutNidbw5WgbDndq6bmxIKZbtnYwyKOooBa2PNnMocoEiHDhHGKJU4NB+75g4yKHq0z9BhtO2I2kJEnEsmn64KGsA3ps1exSwH6kBR6c0sFaXncEs/w1v4HdmSgAJtGSQfTFGLVb6gVKwrsqGu6Ld5osyd18lzagBwX5nfmvOsb5KjrISqRE+1f45NUl+JDLEJka6Qh2n99OFg0gTbvQo6E4PwVwH5UGZbD7/oO5tA3YnbJtaZXkgNxWSYV1uXVFuZCQ9a3MvfkRolpowt/gxblgrTHxmRvcoXFMCzsjvocugG0/M1AMkdkrwTSsQ121+oeXStIQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(478600001)(66446008)(7696005)(66556008)(66476007)(64756008)(4326008)(6916009)(86362001)(71200400001)(5660300002)(52536014)(186003)(8936002)(6506007)(2906002)(316002)(53546011)(9686003)(55016002)(54906003)(8676002)(76116006)(33656002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: kOsZtg0RUUyAXO4Vxitc/v93XCI9BHci+rdi58Yt4kYYwGhsPxCif+UhZDO7vq30xRzK7txZFCdNeZIvBqMk7gSgATKED/2wxHnX9p055Ya/OSMM4dq0VazqO9etEYRf5j92ribPHmLCaXlc9fQY+unMU2i7xX5BZ3xujDJuClEnRBxaNmFy91TGbzfKAcTrnJYEa5DnfaQP8SKMePiKHUtVyPnjPM2nHlmqTe8v3xvMD7CU60nnWxeif1kFPLDpL7QE4N+JpqqO2STCBkW+CoDzs0Ac+nJLTxPmgPfG15tGaTLqM5ZgL8Ec6CEOQRSR4ghRqSWzeGJgmJi1h1Pzlvb8RKejkmTslKgqlPeFD8F1I0ndurL+5SA6oTEUy6TkHt87Vjr6AoIIzaynqon6QFeXc2y1EePbFmjSa/5tZJlDEWkQ74S4ZmglQLDSlo6m62Tqxvx+28cGqy4fE7QeMnSji6lmbHAjnSN1D5oMS3ZNWloAF9aTSe0CnGVWELlXa+F8ijwv4UI9EnU6DbaGXx5BlR1lgXjQJugw6NDWeX29xvWvIieGA40vw+8eBGtsgn7ZijnUEzZOlkl1nXqQNpwGldXV+oTHWSEJLlHZoNTAmMwMcUDE0uAYVS+i2G6gnVyb+eigts2eYAPIQs2OkgAfrKG374ULmTb4FvI+1pB8VyWU8Ji2zKicVeHxthflu4BuIfFxdw3th8k7mcJP6g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b478b1d0-02fd-47d2-599b-08d85392afdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 01:01:15.2655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6KQRWMoDI3wQ6Mz+DmUnjS8NII8+0dxgbIhvJfHHmcdi7hxs4+h1D3fozZtLgyxLxRKE6pJC9JNJ2G++LCCPQLWsc3pEkxxVkbRL2FqtzwoFE81r/damFiVrM1bePRgF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB1903
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDgsIDIwMjAgMTI6MzEg
QU0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4gT24gTW9uLCBTZXAgNywgMjAyMCBhdCAx
MToyMCBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20+IHdyb3RlOg0KPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBkb2N1bWVudGF0aW9u
IGZvciBSZW5lc2FzIFItQ2FyIFYzVQ0KPiA+IEZhbGNvbiBDUFUgYW5kIEJyZWFrT3V0IGJvYXJk
cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8u
c2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4g
DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9yZW5lc2Fz
LnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Jl
bmVzYXMueWFtbA0KPiA+IEBAIC0yODMsNiArMjgzLDkgQEAgcHJvcGVydGllczoNCj4gPg0KPiA+
ICAgICAgICAtIGRlc2NyaXB0aW9uOiBSLUNhciBWM1UgKFI4QTc3OUEwKQ0KPiA+ICAgICAgICAg
IGl0ZW1zOg0KPiA+ICsgICAgICAgICAgLSBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gcmVu
ZXNhcyxmYWxjb24tY3B1ICMgRmFsY29uIENQVSBib2FyZCAoUlRQMFJDNzc5QTBDUEIwMDEwUykN
Cj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMsZmFsY29uLWJyZWFrb3V0ICMgRmFsY29uIEJy
ZWFrT3V0IGJvYXJkIChSVFAwUkM3NzlBMEJPQjAwMTBTKQ0KPiA+ICAgICAgICAgICAgLSBjb25z
dDogcmVuZXNhcyxyOGE3NzlhMA0KPiANCj4gSG93IGlzIHRoaXMgaW50ZW5kZWQgdG8gYmUgdXNl
ZD8NCg0KSSBpbnRlbmRlZCB0byB1c2UgInJlbmVzYXMsZmFsY29uLWJyZWFrb3V0IiwgInJlbmVz
YXMsZmFsY29uLWNwdSIsICJyZW5lc2FzLHI4YTc3OWEwIg0KaW4gdGhlIGZ1dHVyZS4gSG93ZXZl
ciwgaWYgc28sIEkgc2hvdWxkIGZpeCB0aGUgZGVzY3JpcHRpb24gbGlrZSBLaW5nZmlzaGVyLg0K
DQo+IFRoZSBhYm92ZSBtZWFucyBpdHMgdXNlcnMgc2hvdWxkIGRlY2xhcmUgZWl0aGVyDQo+IA0K
PiAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLGZhbGNvbi1jcHUiLCAicmVuZXNhcyxyOGE3Nzlh
MCI7DQo+IA0KPiBvcg0KPiANCj4gICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxmYWxjb24tYnJl
YWtvdXQiLCAicmVuZXNhcyxyOGE3NzlhMCI7DQoNCkkgdW5kZXJzdG9vZCBpdC4gSSBtaXN0b29r
IHRoZSBkZXNjcmlwdGlvbi4uLg0KDQo+IEhvd2V2ZXIsIGZhbGNvbi1jcHUuZHRzaSBoYXMganVz
dA0KPiANCj4gICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxmYWxjb24tY3B1IjsNCj4gDQo+IFdo
byB3aWxsIHVzZSAicmVuZXNhcyxmYWxjb24tYnJlYWtvdXQiPw0KDQpJIGludGVuZGVkIHRvIGFk
ZCBmYWxjb24tYnJlYWtvdXQuZHRzaSBhbmQgdGhlIGZpbGUgaW50ZW5kZWQgdG8gdXNlDQoicmVu
ZXNhcyxmYWxjb24tYnJlYWtvdXQiIGxpa2UgS2luZ2Zpc2hlciArIFVMQ0IgaW4gdGhlIGZ1dHVy
ZS4NCg0KSG93ZXZlciwgSSByZWFsaXplZCBhIGNvbWJpbmF0aW9uIGJldHdlZW4gdGhlIGNwdSBi
b2FyZCBhbmQNCnRoZSBicmVha291dCBib2FyZCBkaWZmZXJzIHRoYW4gVUxDQiArIEtpbmdmaXNo
ZXIgbGlrZSBiZWxvdzoNCg0KLSBUaGUgVUxDQiB3aXRob3V0IHRoZSBLaW5nZmlzaGVyIGNhbiB3
b3JrLg0KLS0gU28sIHNvbWUgLmR0cyBmaWxlcyBleGlzdCBsaWtlIHI4YTc3OTUxLXVsY2IuZHRz
Lg0KLS0gQW5kLCByOGE3Nzk1MS11bGNiLWtmLmR0cyBpbmNsdWRlcyByOGE3Nzk1MS11bGNiLmR0
cyBmb3IgVUxDQiArIEtpbmdmaXNoZXIuDQoNCi0gVGhlIEZhbGNvbiBDUFUgYm9hcmQgd2l0aG91
dCB0aGUgYnJlYWtvdXQgYm9hcmQgY2Fubm90IHdvcmsgYWN0dWFsbHkuDQotLSBCdXQsIG9uIHRo
aXMgaW5pdGlhbCBwYXRjaCBzZXJpZXMgZW5hYmxlcyB0aGUgQ1BVIGJvYXJkIGhhcmR3YXJlICht
ZW1vcnkgbm9kZXMgJiBTQ0lGMCkgb25seS4NCi0tIFRoZSBicmVha291dCBib2FyZCBoYXMgc29t
ZSBoYXJkd2FyZSBsaWtlIEV0aGVybmV0IGFuZCBDQU4uDQotLSBUaGUgYnJlYWtvdXQgYm9hcmQg
YWxzbyBoYXMgc29tZSBjb25uZWN0b3JzIGZvciBzdWIgYm9hcmRzLg0KLS0gU28sIEkgaW50ZW5k
ZWQgdG8gYWRkIGZhbGNvbi1icmVha291dC5kdHNpIHRvIHN1cHBvcnQgRXRoZXJuZXQgaW4gdGhl
IGZ1dHVyZS4NCg0KSW4gdGhpcyBjYXNlLCBJIHdvbmRlciBpZiB3ZSBzaG91bGQgZGVzY3JpYmUg
anVzdCAicmVuZXNhcyxmYWxjb24iIG9ubHkNCmJlY2F1c2Ugd2Ugd2lsbCBub3QgaGF2ZSByOGE3
NzlhMC1mYWxjb24te2NwdSxicmVha291dH0uZHRzIGZpbGVzLg0KQnV0LCB3aGF0IGRvIHlvdSB0
aGluaz8NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
