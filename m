Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD35BE94FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2019 03:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfJ3C3R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Oct 2019 22:29:17 -0400
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:19136
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726037AbfJ3C3Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Oct 2019 22:29:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDhJ3+lo9scNZKmaoXpAzjwbhzqIYCRykMzWAdYnjMo+QQO51GxinyZosineuLJpb32PLKjuKVgNjOvS+UprggNltfVH4bkSoAJLqNEeYjU18BL8XCEG40qUSbBXtRC5D+XDr0kavnBR8p1uvVs5MHIYbhKsrvllzb1QtA6wioBv51XyI1B92ujxvD4S77AUCcjpH0TMUuA11Stn1B8s0gtG9zhj0AcKywlxjnXBeWjhujLVbZpQdNpudH7JWAkpe/j1PGYtRDS8L3lN7hHZjdjFbo3wNllyKaVuHufZLHbYt27DyxDydDHDUL5IMxXihVOyQCV/FYIFdClThBloqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkbEhW9s2Ekq4WHoyYh82t5Tgr/ZtY71pVRgZreGhN4=;
 b=Z4eVxGkIhc93Jh8cLbrnPDNi8BnAAN1nccV+KQzvhHxj8zG+wCfGFpzCdBxTb0xONIQcFix2go1ro72TOkrEiHwFNq4Gv6MFf5q7SUB7QC7nPsaeYuiM1+Sz4J8tatEI1oDBeaovsk7OsU1Mvwiusur+M7DfdVnXvBlDtxuPngGuh2HebWDsWxHSq4Tc4AQrsKdsTCiZiz0GDEuH2H2bBPzdjadmt+3PffFDrjPCphZqZluiIoln+pr3kDQf5gNezabknOWgWTaKssHmRkFh2T3lyS20mmIRCVAzKshsy/aroRvKbkjOMPmx8SAbnNI8YFI3v313XWFWuG4Waoax9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkbEhW9s2Ekq4WHoyYh82t5Tgr/ZtY71pVRgZreGhN4=;
 b=aofXyamPwoIJ+cfU9Kg67eex/+wFtT6hZx+ptuIbLaljfpzB5sJ9fIkjwnlmbvHv+1uv2bkU+AMdy5N82av9cYDuM5dEqAV4Iko7e9xjO7zSocnv3jiqY9uKx7sstUOBqxR53peOUbefXkJXrZh3I5njSSVLugCkh+uvTWJrCyE=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4191.jpnprd01.prod.outlook.com (20.178.140.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Wed, 30 Oct 2019 02:28:57 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2387.028; Wed, 30 Oct 2019
 02:28:57 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     "kishon@ti.com" <kishon@ti.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: phy: renesas: usb2-phy: convert bindings to
 json-schema
Thread-Topic: [PATCH] dt-bindings: phy: renesas: usb2-phy: convert bindings to
 json-schema
Thread-Index: AQHVhY952/0Zj6abi0uVrAee6hPMwadw7TgAgAAiTACAARHNAIAAZsNw
Date:   Wed, 30 Oct 2019 02:28:57 +0000
Message-ID: <TYAPR01MB454465C8076E9F77420DB7DBD8600@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1571387933-23397-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20191029015708.GA29561@bogus>
 <TYAPR01MB4544FD4F09FAA09F7AF79EF0D8610@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <CAL_Jsq+H-4V=v0GTUgTXAiwOtn_BoMtcMpinb1v51V_Jy9mBXA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+H-4V=v0GTUgTXAiwOtn_BoMtcMpinb1v51V_Jy9mBXA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f507590c-b6fe-493e-6eae-08d75ce0eace
x-ms-traffictypediagnostic: TYAPR01MB4191:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <TYAPR01MB41916E5C714B34A871A74D0DD8600@TYAPR01MB4191.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02065A9E77
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(199004)(189003)(966005)(71200400001)(478600001)(14454004)(33656002)(6916009)(3846002)(6116002)(316002)(54906003)(6246003)(86362001)(6436002)(9686003)(6306002)(55016002)(2906002)(25786009)(446003)(64756008)(66446008)(66476007)(66556008)(76116006)(52536014)(71190400001)(14444005)(186003)(66066001)(476003)(11346002)(486006)(5660300002)(81166006)(81156014)(8676002)(7736002)(305945005)(74316002)(8936002)(99286004)(26005)(4326008)(102836004)(76176011)(53546011)(7696005)(66946007)(6506007)(256004)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4191;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5OIzo1BfPfGIQBHq7vKYObS9ij32ZTyrcHLH0fh+8BWupvoICxNeVZTpUytoRlJf1z5LyvK8ms2pGd+aPjHgwC6baMxst9slj1TzGDDNbickNlbj7Ozr8HjlmYEN0eJ5eeYl/SMb3XV1VxR1lzuvY2wciNL3112ShKZ6DG3cHPJDBi0tWYx8mOKxfj5Tx62YdIaG8vG55qrV23HGBw6RfLN7UZG01xDLkY1m6o9epR0s4OcF6bZDj4LAm/U5FxiRBJ3g7t7u5m9WBMhIQbeYiayutb47Vr7P9ps6OSZBSPndu577zQ0EtV8DIXaIf+y8W5ehk2VdRdONKlm8ilaat4tarZfJwjFQ4pfyXJIzHVc/hD4rbpEG2TEY8TGUjPqS5f+kpe+gS+RLT5RwgJyy4MxHRwCkRvj99z/tYXHT2/lxl8foI8t3miuMPZiOze+CM1SkAhdADSME3j8kpWEaHmR2W1Tz29OWTK+8oFVXMp4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f507590c-b6fe-493e-6eae-08d75ce0eace
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2019 02:28:57.6212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2fHES7nZ5sMHHsbyU2og01HqLpoK5GqfsmzSbjx9uYgZC7d1uUvLsoGH9KuCPZyThmb3JAx5l3mAjodxqYAtyIqbufysVQV/ARsNPShtmI87H+TcNRcPwSZTD2ADXEtZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4191
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUm9iLA0KDQo+IEZyb206IFJvYiBIZXJyaW5nLCBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIg
MzAsIDIwMTkgNToyMCBBTQ0KPiANCj4gT24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMTE6MTQgUE0g
WW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3
cm90ZToNCjxzbmlwPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BoeS9yZW5lc2FzLHVzYjItcGh5LnlhbWwNCj4gPiA+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9yZW5lc2FzLHVzYjItcGh5LnlhbWwNCj4gPiA+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gaW5kZXggMDAwMDAwMDAuLjBmMTA5YzIN
Cj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGh5L3JlbmVzYXMsdXNiMi1waHkueWFtbA0KPiA+ID4gPiBAQCAtMCww
ICsxLDEwNiBAQA0KPiA+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5DQo+ID4gPiA+ICslWUFNTCAxLjINCj4gPiA+ID4gKy0tLQ0KPiA+ID4gPiArJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waHkvcmVuZXNhcyx1c2IyLXBoeS55YW1sIw0KPiA+
ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3RpdGxlOiBSZW5lc2FzIFItQ2FyIGdlbmVyYXRpb24g
MyBVU0IgMi4wIFBIWQ0KPiA+ID4gPiArDQo+ID4gPiA+ICttYWludGFpbmVyczoNCj4gPiA+ID4g
KyAgLSBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+
DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3Byb3BlcnRpZXM6DQo+ID4gPiA+ICsgIGNvbXBhdGlibGU6
DQo+ID4gPiA+ICsgICAgb25lT2Y6DQo+ID4gPg0KPiA+ID4gVGhpczoNCj4gPg0KPiA+IFdoYXQg
ZG9lcyB0aGUgIlRoaXM6IiBtZWFuPw0KPiANCj4gSSB3YXMgcmVmZXJyaW5nIHRvIHRoZSAzIGxp
bmVzIGJlbG93LiBJIHdhcyB0cnlpbmcgdG8gYmUgY2xlYXIgd2hpY2gNCj4gbGluZXMgdG8gcmVw
bGFjZSB3aXRoIGp1c3QgJ2NvbnN0Jy4NCg0KVGhhbmsgeW91IGZvciB0aGUgcmVwbHkhIEkgdW5k
ZXJzdG9vZCBpdC4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiA+IElm
IEkgcmVwbGFjZWQgdGhlICJvbmVPZjoiIHdpdGggIlRoaXM6IiwNCj4gPiB0aGUgZm9sbG93aW5n
IGVycm9yIGhhcHBlbnMgd2hlbiAibWFrZSBkdF9iaW5kaW5nX2NoZWNrIjoNCj4gPg0KPiA+ICAg
U0NIRU1BICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHJvY2Vzc2VkLXNjaGVt
YS55YW1sDQo+ID4gd2FybmluZzogbm8gc2NoZW1hIGZvdW5kIGluIGZpbGU6IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcmVuZXNhcyx1c2IyLXBoeS55YW1sDQo+ID4gW3Nu
aXBdL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcmVuZXNhcyx1c2IyLXBo
eS55YW1sOiBpZ25vcmluZywgZXJyb3IgaW4gc2NoZW1hICdjb21wYXRpYmxlJw0KPiA+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9NYWtlZmlsZTozMzogcmVjaXBlIGZvciB0YXJn
ZXQNCj4gJ0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wcm9jZXNzZWQtc2NoZW1h
LnlhbWwnIGZhaWxlZA0KPiA+IG1ha2VbMV06ICoqKiBbRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Byb2Nlc3NlZC1zY2hlbWEueWFtbF0gRXJyb3IgMjU1DQo+ID4gTWFrZWZpbGU6
MTI2MzogcmVjaXBlIGZvciB0YXJnZXQgJ2R0X2JpbmRpbmdfY2hlY2snIGZhaWxlZA0KPiA+IG1h
a2U6ICoqKiBbZHRfYmluZGluZ19jaGVja10gRXJyb3IgMg0KPiA+DQo+ID4gPiA+ICsgICAgICAt
IGl0ZW1zOg0KPiA+ID4gPiArICAgICAgICAgIC0gZW51bToNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgLSByZW5lc2FzLHVzYjItcGh5LXI4YTc3NDcwICMgUlovRzFDDQo+ID4gPg0KPiA+ID4gWW91
IGNhbiBzaW1wbGlmeSB0byBqdXN0Og0KPiA+ID4NCj4gPiA+ICAgICAgICAgIC0gY29uc3Q6IHJl
bmVzYXMsdXNiMi1waHktcjhhNzc0NzAgIyBSWi9HMUMNCj4gPg0KPiA+IEknbGwgZml4IGl0Lg0K
