Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31B27178A9B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2020 07:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgCDGc4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Mar 2020 01:32:56 -0500
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:64480
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725861AbgCDGc4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 01:32:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2TsU+nSmp6IcwLCIc/trzBirdSpXVjxQRsHi19CJ3nKtUbivI+WGyozW+WW6bxgY/IaDZFtpzzxSFvlQ0V8zO3spR5jZ+jo5F1T/mU+UrHt1n+Nf4isFPButYomayiICCqiGP9lD3Zggc991eSuXHkBZ7C8v1COB3fdcgLGHLWMT9T7S3+2BsI9W/NdOiV490jbEo3owIGN2sNsjCOMf/B1ChX715bt3emLZibVywjNhKlNVDXAPi9cScwrhPOtIc7AlBhqGhx1F0EENLQwthk6ozd1kvfJDqWXW6Pz6ZpYbLacUgzNqWRNAazzuTrF1avh3sOSay5lGfk1ZsnR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3V4jS0LoEmbzRNPOIStuGGZEZUVaf9JoFzX1gFRNiQ=;
 b=NLwQrm0RtiRUexI2jd+kUsi0iPLD49MMGh6KsbNiZmDYlpB4eBRFgM/x44hYBjGg5Rei2CNplqDtRIWGerL+oJaGqdrhxLa9LwceBbn+ET9Ttjtl7fGA1CjKoQltKJlyCg85Ej9rFtUYveDryEdGIFM8b1QGWPmRwWP/lxjO1xFi61NjNOc9aYFpbYGRw4TXyK9+wNNdJhZ649N15hEqrBlG7Ha2p6cn3/cpAy1LcxalQlx8vWAF1wzh1k/LP+uR2yAE78B7Wh9Ry3XmOE0pcjfCHs4FQmuiUe7ohJlwhuqEawUefY3rnvo5iX7g/mvSwiYbeiZKngLvqOhSVI0T7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3V4jS0LoEmbzRNPOIStuGGZEZUVaf9JoFzX1gFRNiQ=;
 b=UBU2L7lfgAv7xiMMfTqwpn0VGdv4E4RIFUIVCo4oPGZPBt1sgtTlg0V4pH845wUQAWi9/J2zyJ2t2c+jnI9QjiGKcsjEPzkg02QDyMRnUx5p6KpoiAeooYaxoaOGPdE6tYPOFqjdtO38FbaxvWfLSrk45ehl2sF60eCmYvx4ZEg=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3374.jpnprd01.prod.outlook.com (20.178.139.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Wed, 4 Mar 2020 06:32:41 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::dccc:154d:a04e:3ee3]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::dccc:154d:a04e:3ee3%3]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 06:32:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/4] clk: renesas: rcar-usb2-clock-sel: Add multiple
 clocks management
Thread-Topic: [PATCH v3 3/4] clk: renesas: rcar-usb2-clock-sel: Add multiple
 clocks management
Thread-Index: AQHVkIJtLll9XmSVZ02tcHfyziasSqeQ08aAgKfnngA=
Date:   Wed, 4 Mar 2020 06:32:40 +0000
Message-ID: <TYAPR01MB45445392291F9914012BE15CD8E50@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1572591791-11280-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1572591791-11280-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXpkTH9bqAahMpUB6quCXpgFi8Uw1RPYdXFkeaFh0js4w@mail.gmail.com>
In-Reply-To: <CAMuHMdXpkTH9bqAahMpUB6quCXpgFi8Uw1RPYdXFkeaFh0js4w@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4125d39f-ba2e-4f93-3cf5-08d7c005d6f5
x-ms-traffictypediagnostic: TYAPR01MB3374:
x-microsoft-antispam-prvs: <TYAPR01MB33748C3DA12D3D697DDFF09CD8E50@TYAPR01MB3374.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(189003)(199004)(54906003)(71200400001)(52536014)(26005)(186003)(33656002)(81156014)(66556008)(64756008)(5660300002)(81166006)(66446008)(2906002)(76116006)(66476007)(66946007)(478600001)(55236004)(8676002)(6916009)(53546011)(9686003)(4326008)(7696005)(316002)(6506007)(55016002)(86362001)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3374;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nozhi9DLN0KBUNV1pbp4UrOU5S0f6yDq6sTeSgjUTeBrO84WMWzrIUcv8EvfM+ZBCmuqUwl38eHLk0CNE98o5LSYHkErzQxmZipRUIv3FFisK/y7IpcouGZFwecE/qgHqg4OkNfVTdpLxh5HWSMpoa6/NMIqPhjeUqQ//DqAvxkgKY4FQcCM3DPkmNu9X9tihfyEnq3zTyAdgGyGCmIvLrAoYRFDb30Kot9yOtFOmEf47hxsyRuyEWxtvZoGNMA1H2ndTzGS7Kzd7u2eVfNFZiJiPm0XjQ377x9SlxVk3kqCWRPaX1gah9FS8/6Raby2cdw/BpFJbxb5V6XNtk2sWx22b7Zp5SHnggguirjJc3+NUJXubUDweG5km727YJmtz5hXJn8DJq6XVYKc68d71g6U56/hrUaVXhj28HdugocOBVvLXPTftT175VXFH0uV
x-ms-exchange-antispam-messagedata: cK5ku09XP+g0lq5lNwMfF3aTMPnEaHoRQMpg2GcekfZYMs/ZTfv9clLugH5Dn9LGQJ124PBPbEyG8LJ56To17esUixrPy468Syn66HDWRQ0gApWAEpwUtN6KwuX7W7ei3tnAbDfEN3DsvU3imx9wFg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4125d39f-ba2e-4f93-3cf5-08d7c005d6f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 06:32:40.8171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3hu2GTXSpLG7DYJC4anjPzyMsE6BfWLYNWIuTQbSLVR/+RmzBIxEDmjpKQON4WcsNW88F8+rTV+SJJd8u3l5GeD1Uw4vvC96/nnU4uBB3XllXuSXHTqJoLiKmiURRu5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3374
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5LCBOb3ZlbWJlciAxOCwgMjAxOSA3OjI1IFBN
DQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIEZyaSwgTm92IDEsIDIwMTkgYXQgODow
MyBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5j
b20+IHdyb3RlOg0KPHNuaXA+DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yY2FyLXVz
YjItY2xvY2stc2VsLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3JjYXItdXNiMi1j
bG9jay1zZWwuYw0KPiANCj4gPiBAQCAtMTI4LDYgKzE0NiwxNCBAQCBzdGF0aWMgaW50IHJjYXJf
dXNiMl9jbG9ja19zZWxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAg
ICAgICAgIGlmIChJU19FUlIocHJpdi0+YmFzZSkpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVy
biBQVFJfRVJSKHByaXYtPmJhc2UpOw0KPiA+DQo+ID4gKyAgICAgICBwcml2LT5jbGtzW0NMS19J
TkRFWF9FSENJX09IQ0ldLmNsayA9IGRldm1fY2xrX2dldChkZXYsICJlaGNpX29oY2kiKTsNCj4g
PiArICAgICAgIGlmIChJU19FUlIocHJpdi0+Y2xrc1tDTEtfSU5ERVhfRUhDSV9PSENJXS5jbGsp
KQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihwcml2LT5jbGtzW0NMS19JTkRF
WF9FSENJX09IQ0ldLmNsayk7DQo+ID4gKw0KPiA+ICsgICAgICAgcHJpdi0+Y2xrc1tDTEtfSU5E
RVhfSFNfVVNCXS5jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAiaHMtdXNiLWlmIik7DQo+ID4gKyAg
ICAgICBpZiAoSVNfRVJSKHByaXYtPmNsa3NbQ0xLX0lOREVYX0hTX1VTQl0uY2xrKSkNCj4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocHJpdi0+Y2xrc1tDTEtfSU5ERVhfSFNfVVNC
XS5jbGspOw0KPiA+ICsNCj4gDQo+IElzIHRoZXNlIGFueSBzcGVjaWZpYyByZWFzb24geW91J3Jl
IG5vdCBqdXN0IGZpbGxpbmcgaW4gdGhlIC5pZCBmaWVsZHMgZmlyc3QsDQo+IGFuZCBjYWxsaW5n
IGRldm1fY2xrX2J1bGtfZ2V0KCk/DQo+IA0KPiAgICAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtf
YnVsa19kYXRhIHJjYXJfdXNiMl9jbG9ja3NbXSA9IHsNCj4gICAgICAgICAgICAgeyAuaWQgPSAi
ZWhjaV9vaGNpIiwgfSwNCj4gICAgICAgICAgICAgeyAuaWQgPSAiaHMtdXNiLWlmIiwgfSwNCj4g
ICAgIH07DQo+IA0KPiAgICAgbWVtY3B5KHByaXYtPmNsa3MsIHJjYXJfdXNiMl9jbG9ja3MsIHNp
emVvZihwcml2LT5jbGtzKSk7DQo+ICAgICAuLi4gPSBkZXZtX2Nsa19idWxrX2dldChkZXYsIEFS
UkFZX1NJWkUocHJpdi0+Y2xrcyksIHByaXYtPmNsa3MpOw0KPiAgICAgLi4uDQo+IA0KPiBUaGF0
IHdheSB5b3UgY2FuIGRyb3AgdGhlIGVudW1zLCBhbmQgdXNlIEFSUkFZX1NJWkUocmNhcl91c2Iy
X2Nsb2NrcykNCj4gaW5zdGVhZCBvZiBDTEtfTlVNLg0KDQpJIGRvbid0IGtub3cgd2h5IEkgZGlk
bid0IHVzZSBkZXZtX2Nsa19idWxrX2dldCgpLi4uDQpJJ2xsIGZpeCB0aGUgY29kZS4NCg0KQmVz
dCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
