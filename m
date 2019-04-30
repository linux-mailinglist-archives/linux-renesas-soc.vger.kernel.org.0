Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB01EFB87
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 16:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfD3OcA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 10:32:00 -0400
Received: from mail-eopbgr1400118.outbound.protection.outlook.com ([40.107.140.118]:23989
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725942AbfD3Ob7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 10:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfsvZkU4LXIp9/Qp3OtJc67Q7up3yzNMrOCns2lZJeU=;
 b=PqvnXhOTXCZQo5utNWYp4hCLB+SGQcQtNL80yLmCNF0zLBEjtTa0Y8GXl0pEzc6EE4sJ+PDoypzUFahDg4IQOtb7aQHYE4VwxVanZ57g8JeCtY3Q25JGBWn/qymgTOcUhbOfbVeavI8LqtHmHyVbKCIVKFh7qCS4aQILy69LQtg=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3911.jpnprd01.prod.outlook.com (20.178.97.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 14:31:52 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 14:31:52 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: RE: [PATCH 1/6] arm64: dts: r8a774a1: Add VSP instances
Thread-Topic: [PATCH 1/6] arm64: dts: r8a774a1: Add VSP instances
Thread-Index: AQHU9Gp5UL02iNSR/kSSzpUyvQ5GmKZU1BoAgAAEBiA=
Date:   Tue, 30 Apr 2019 14:31:51 +0000
Message-ID: <OSBPR01MB2103C18AA80F4E9682DCCFC8B83A0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com>
 <1555428717-18376-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdV4PiVjYotbR-LF-2BNkpY61Q7XsxKFKDk56dvA_0iibA@mail.gmail.com>
In-Reply-To: <CAMuHMdV4PiVjYotbR-LF-2BNkpY61Q7XsxKFKDk56dvA_0iibA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be0a4030-9701-4c3f-4b95-08d6cd78968f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3911;
x-ms-traffictypediagnostic: OSBPR01MB3911:
x-microsoft-antispam-prvs: <OSBPR01MB391147A315A9C392CB1863FEB83A0@OSBPR01MB3911.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39860400002)(136003)(366004)(189003)(51914003)(199004)(76116006)(66066001)(64756008)(66556008)(54906003)(316002)(66446008)(66476007)(73956011)(66946007)(97736004)(256004)(33656002)(71200400001)(9686003)(71190400001)(6246003)(4326008)(25786009)(53936002)(14454004)(68736007)(305945005)(86362001)(229853002)(6116002)(55016002)(44832011)(53546011)(5660300002)(6506007)(74316002)(26005)(11346002)(81166006)(6916009)(446003)(81156014)(486006)(8936002)(8676002)(7696005)(186003)(7736002)(476003)(102836004)(478600001)(2906002)(76176011)(99286004)(52536014)(3846002)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3911;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0P8VceNc1TIqjpOVCbs53YegsqnYYdqOIL4bQpIc/hz9YDmDfGINvF/aItDC3m0pPMujfRryLKNNZ1hfhIakChUSGMm513T5LInqEjwp51A8nMVOn7omZZZ8mTaQGV5rLG01NkTnjSAjTNb9EHkb5U8ffB+ikxaspgMXZzzDdLZteBtnuxBjHVPp7HC2JzVRaLqi8luzKOA0Byxi4ZGJQsU7US/LXkuyyTbEUFBL6oJP70yBepTti7UNcxyl2mW7Ayn4pd/bKBWye9/Bq9gl9jw1Atclhla7XLXjsXjoESCf8yarXwF8DKwyXwfu8UyIuARTrXHtUZX/XmGlKHQoFJUX1Ad8Xj+p/hVtZhfV+lBJAYFqsQ8HUSbzYJSe8Hd+uXg+2tkUaBclK3Rxn2qfc/DBIIqom8PRHfc7YWX0K6A=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0a4030-9701-4c3f-4b95-08d6cd78968f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 14:31:52.1884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3911
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS82XSBhcm02NDogZHRzOiByOGE3NzRhMTogQWRkIFZTUCBpbnN0YW5jZXMNCj4gDQo+
IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIEFwciAxNiwgMjAxOSBhdCA1OjM4IFBNIEJpanUgRGFz
IDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhlIHI4YTc3NGExIHNvYyBo
YXMgNSBWU1AgaW5zdGFuY2VzIHNpbWlsYXIgdG8gcjhhNzc5Ni4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGExLmR0c2kNCj4gPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRzaQ0KPiA+IEBAIC0xODc3LDYgKzE4
NzcsNjEgQEANCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpb21tdXMgPSA8JmlwbW11X3Zj
MCAxOT47DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgICAgICAgICAg
dnNwYjogdnNwQGZlOTYwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gInJlbmVzYXMsdnNwMiI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0g
PDAgMHhmZTk2MDAwMCAwIDB4ODAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDI2NiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDYyNj47DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3NzRBMV9QRF9BM1ZD
PjsNCj4gDQo+IEkgaGF2ZSBteSBkb3VidHMgYWJvdXQgdnNwYiAoYW5kIGZjcHZiMCkgYmVpbmcg
cGFydCBvZiB0aGUgQTNWQyBwb3dlcg0KPiBkb21haW4gKGFsc28gb24gUi1DYXIgTTMtVykuDQoN
CkFzIHBlciBSLUNhciBHZW4zIFJldi4xLjUwIE5vdiAyMDE4IEhhcmR3YXJlIHVzZXIncyBtYW51
YWwgaXQgaXMgQTNWQywNCg0KVGhlIGRldGFpbHMgYXJlIG1lbnRpb25lZCBpbiBUYWJsZSA5LjQg
UG93ZXIgZG9tYWlucyBmb3IgQTNWUC4NCg0KQTNWUCA6LSBUaGlzIGRvbWFpbiBpcyBhdmFpbGFi
bGUgb25seSBmb3IgUi1DYXJIMywgUi1DYXIgSDMtTiBhbmQgUi1DYXIgTTMtTi5Nb2R1bGVzIGlu
Y2x1ZGVkIGluIHRoaXMgZG9tYWluIHdhcw0KTW92ZWQgdG8gQTNWQyBkb21haW4gZm9yIFItQ2Fy
IE0zLVcuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmVzZXRzID0gPCZjcGcgNjI2PjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmVuZXNhcyxmY3AgPSA8JmZjcHZiMD47DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+IA0K
PiBBcGFydCBmcm9tIHRoYXQ6DQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9l
dmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0N
Cj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzDQo=
