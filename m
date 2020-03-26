Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251F11935D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 03:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgCZCVZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 22:21:25 -0400
Received: from mail-eopbgr1400100.outbound.protection.outlook.com ([40.107.140.100]:36153
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727639AbgCZCVZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 22:21:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3FCjrMUSLBhMObsjh7ovFP/8qwF6E0JjbNsGJ3+tC3PH1MF6pFAxi+h5qoMe2SasO0SITocBIccOET+8Ie55ceqJocq4YO94YSHHQ8op+hX2MjnviO/B6iOzHuLYwFLHkw255cyyInPeXHFywPI4bNtm4sVLmS1LH3fMVR6Ntn5ZbCLsEwrcgXfATn/HLtWyxmueMYT7+/Z0jK8bTbXkZJA2HQFe3uvadUrQTUrybjYe+vEIEgmBBUq6k/uxVP1vgXgXockZfyMEjFsNSV22K17KQt2hqE0Hwe/fEyWrLfZ/Ms02XFin//nRoYDWeGTZSQZBIa9UrPQQsmkx/MOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8BPDDPAGH817QHMlajsjIMLl3PDOgXwhbsiKSEPGwA=;
 b=IBR3zhnbpHPPblKzeYHvphFHz720rpXuTMUbyGK5q4s9UwlCrRWI8AAzaXH67UkK1SWDtVMLYzq6+ceA+bAXN5kY0pu3X1fgRiA4PyntEiHqzdddFsbDFsJ40FjfOaBWDUqnDsiSm2afS0pR04QJRPxGYBMd70dhb+f7HpCfnabaIl9QVjhRYFhgUq2TAcAHCSEZcSU5JEvP8qUPWd/X5qLhtacOfF5utjKt6Nnz+3Lx90rwe+nozAkkMIXFShHFERkCdAawHHS+0koSigx433YDb/ZzDj+qnpBmEnpU6H0jCUdHQqGyrOlkZMU410AnGEcv/wy2SSKxoJofSlFH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8BPDDPAGH817QHMlajsjIMLl3PDOgXwhbsiKSEPGwA=;
 b=FfqhlXa5YuP1GMUDG130FOwLELfPTpE0zTSfHHM4oBBumkX1FVYPK+6M+gu1X5lLhQVEDSFdyjA5Eu76rntdmzVsm7TUsk1vSqv4rd54ytgslBk6JKLca+CMGa2MrSX0I/nEgGyutOe4EM4f+Nv0SZwrbsvZY9/Dy3t9ZR0ytQY=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3327.jpnprd01.prod.outlook.com (20.178.140.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Thu, 26 Mar 2020 02:21:21 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 02:21:21 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: clock: renesas,rcar-usb2-clock-sel: add
 r8a77961 support
Thread-Topic: [PATCH] dt-bindings: clock: renesas,rcar-usb2-clock-sel: add
 r8a77961 support
Thread-Index: AQHWAm1vWB0P+WDCRki1fIvs5IYm+KhZSU4AgADb/3A=
Date:   Thu, 26 Mar 2020 02:21:21 +0000
Message-ID: <TYAPR01MB454437073AE445BF608ECB2ED8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1585117204-8469-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXopMkeBwAQRpphCUXOLeCVRaDEFi-fQzy8_8jzD=MNEw@mail.gmail.com>
In-Reply-To: <CAMuHMdXopMkeBwAQRpphCUXOLeCVRaDEFi-fQzy8_8jzD=MNEw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0ca0f539-e6e5-4b1b-d76c-08d7d12c6011
x-ms-traffictypediagnostic: TYAPR01MB3327:
x-microsoft-antispam-prvs: <TYAPR01MB33275BD68042F6FB10939435D8CF0@TYAPR01MB3327.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(5660300002)(86362001)(316002)(6916009)(64756008)(55236004)(33656002)(4744005)(186003)(6506007)(55016002)(76116006)(9686003)(8936002)(8676002)(2906002)(4326008)(52536014)(26005)(81156014)(66946007)(54906003)(66556008)(66476007)(66446008)(81166006)(7696005)(71200400001)(478600001)(142933001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3327;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nx80PoNYKYjOihAEj5CF7BQLsrb+6Rq+YOZS53TdYIDQcoBheJ3Ig3pu0DRguaK9WPdTOiI35MhzbUz+f7ryJy+RoGbzbrCq72onPO61aQdy1l4jU3ZnMMFcYs1ztRNCq0KRJUqFk2CAVGXFf9BJfJSMl2HBEN0pXhj61tBXdLhAW+b2jUZEnFa1qjHk8VtReWIeuptOwGkqK5ZBpxI5KlaGeClGwbhSaj7zwWaNy9O6RAP9MUET/eBcTqPl0P2x6x/47NaD/FFCBBT252/YkbFKMCgME13vdlYPwZ3RQMCmQ4WAVTfUAwfmrZHLzpP9Yn12jD8rvYo/49t3Rwg1mvs6LbZ5ZAxB97beBwUSw1SpncgEMe2exRVyYXcllWprg3tZD7+gr4Fuw8SVYLKUf2Pk/lbxouUenzKoRCt2BkBeSFwl0G/FdhZLGtoF6GDu4zs8Hngc9QOyiNa8YYbcfIwKdQICJjLORlPpbEFgSXEpb7uM8r7vRkaMk9Uvjp8L
x-ms-exchange-antispam-messagedata: xVh4kwBIn4Imxnzg3trrxk0n2+2+nWtnT7uTLV30Wwx7yDEDTfJnF8LeDvTJnlI3meQYMdzvdJ7H0zMKNya4zWStpTo1xPUKrt6mHJdrjecna1rnaQRLCaGVQRhZxjMPOZwQ9o6QXB4ap5sHuyQEJQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca0f539-e6e5-4b1b-d76c-08d7d12c6011
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 02:21:21.4633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zgC9Qcn73ScmigvWx3xaIu3sQdgX1C9hZOlum2+cfB5Z38rzVXPFz2DHHhutNfG0NmgdsgafXOm9rvQI2G9yeDVfzpdMQy4EMH0SE7cRdEm9ZB/Gg9Eoa5G1z/IE92mS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3327
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBNYXJjaCAyNSwgMjAyMCAxMDoxMyBQ
TQ0KPHNuaXA+DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Ns
b2NrL3JlbmVzYXMscmNhci11c2IyLWNsb2NrLXNlbC50eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcmVuZXNhcyxyY2FyLXVzYjItY2xvY2stc2Vs
LnR4dA0KPiA+IEBAIC0yOCw2ICsyOCw4IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gICAg
ICAgICAgICAgICBhbiBSOEE3Nzk1IFNvQy4NCj4gPiAgICAgICAgICAgICAgICJyZW5lc2FzLHI4
YTc3OTYtcmNhci11c2IyLWNsb2NrLXNlbCIgaWYgdGhlIGRldmljZSBpZiBhIHBhcnQgb2YNCj4g
PiAgICAgICAgICAgICAgIGFuIFI4QTc3OTYgU29DLg0KPiANCj4gV2hpbGUgYXQgaXQsIHlvdSBt
YXkgd2FudCB0byB1cGRhdGUgIlI4QTc3OTYgU29DIiB0byAiUjhBNzc5NjAgU29DIiwgdG8NCj4g
YXZvaWQgY29uZnVzaW9uIGJldHdlZW4gUi1DYXIgTTMtVyAoUjhBNzc5NjApIGFuZCBNMy1XKyAo
UjhBNzc5NjEpLg0KDQpJIGdvdCBpdC4gSSdsbCBmaXggaXQuDQoNCj4gPiArICAgICAgICAgICAg
ICJyZW5lc2FzLHI4YTc3OTYxLXJjYXItdXNiMi1jbG9jay1zZWwiIGlmIHRoZSBkZXZpY2UgaWYg
YSBwYXJ0IG9mDQo+ID4gKyAgICAgICAgICAgICBhbiBSOEE3Nzk2MSBTb0MuDQo+ID4gICAgICAg
ICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjMtdXNiMi1jbG9jay1zZWwiIGZvciBhIGdlbmVyaWMg
Ui1DYXIgR2VuMw0KPiA+ICAgICAgICAgICAgICAgY29tcGF0aWJsZSBkZXZpY2UuDQo+IA0KPiBX
aXRoIHRoZSBhYm92ZSBmaXhlZDoNCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQoNClRoYW5rcyENCg0KQmVzdCByZWdhcmRzLA0KWW9z
aGloaXJvIFNoaW1vZGENCg0K
