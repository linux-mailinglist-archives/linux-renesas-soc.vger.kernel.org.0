Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 269F2D6E80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 07:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfJOFR3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 01:17:29 -0400
Received: from mail-eopbgr1410135.outbound.protection.outlook.com ([40.107.141.135]:26432
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726004AbfJOFR3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 01:17:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hc43Yh2qHpvEluJGKc/q5N0EsTyhnG/UtQEmyLjKYprd3WI50M6hahmn4yj6/hXQrtnzw7BFSj7JUA2Cx7Z1znJwgesS/SVf3Av+XBwZSQLhTfhLehvzCIPMX1P2hAps4K778BsYPvSWGazL1y7HUfrEFXVwMbGMbSgCgh7ib7HqWFBz4/f7NprmQ1hKI2rsrwg81C6Wy6hEUrX4JQro5Q9gjvWI9K2umMsfSIObdlna2ckyUZXLCREkPhXHJHbkG/K/bGPLBeKJZ+Qxcv3ayyuWyV+ZrEQZD3BM3ZGXyWOzlOtl6NnqalufowDx0GBq1Kc/iAA9EH0x/TjuJrO7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8/KRecnhWuT/zs+4X5+2FBOvwO4o2oN0baGlaj/jbQ=;
 b=Lv9heihlLBALKocGYyU+R2Zu8sL3wWxo05BrB1+OBZsgT0s8dUJcx4P5XsWT287dTaCxn1a43nzdOllFFzWRyxuNtA8r5ewMlSQXIDrIVcMRCZEgKsEXJVjhUejFV5vxCMhMu3+c8mahymh0YcucQUCVJb+Mn4uoA/zOyQ1dbToID+5tIuqrN02oMqYgYrVURKoTB+xd7BpIKJkK9xwo2HCXTFz4Tgll9lR/J9iqMOnjsg0d3lPuDiRZXID99VH6P/T8jmyVE4PAsGbhAyeRN12VV+eKRojr6vJDQnGS8Jbl8Ldr0+YmjEI16DaJhLihh0FL3GJTasGgjWnDP+TlGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8/KRecnhWuT/zs+4X5+2FBOvwO4o2oN0baGlaj/jbQ=;
 b=D9csnlfjw/qPZRTMi+/92sIPWFAZfDsi35sSTRhBcrFBLHwZ0XKBEHOWcRJB551Zc4IKSnYRSP3YC8zVpa/JQP7YytjOW20bVBcFbtcI+XpUXycgFSvVZQhnPYNOwmLFMOy7ueDvk1YE/Iqu4JZRDh/j1/N2y/nlrOi6rh8VVAY=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3534.jpnprd01.prod.outlook.com (20.178.137.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 05:17:25 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 05:17:25 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/3] iommu/ipmmu-vmsa: Remove some unused register
 declarations
Thread-Topic: [PATCH 1/3] iommu/ipmmu-vmsa: Remove some unused register
 declarations
Thread-Index: AQHVfntOozqAfyzDl0yYqMh+u83hVKdVXOgAgAXRHJA=
Date:   Tue, 15 Oct 2019 05:17:25 +0000
Message-ID: <TYAPR01MB4544CF27B1D041472CC5D5B8D8930@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1570609609-1332-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWfHYDOKSJBUCVLG6yNKxbv=jUd9E1B_fiBOQajwi_wEg@mail.gmail.com>
In-Reply-To: <CAMuHMdWfHYDOKSJBUCVLG6yNKxbv=jUd9E1B_fiBOQajwi_wEg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af8abc84-2fe3-4fe1-6e28-08d7512ef74b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB3534:
x-microsoft-antispam-prvs: <TYAPR01MB3534CDE6C21898B95227C23DD8930@TYAPR01MB3534.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(199004)(189003)(6246003)(9686003)(7736002)(305945005)(5660300002)(14454004)(53546011)(33656002)(66946007)(76116006)(86362001)(66476007)(66556008)(71190400001)(71200400001)(4326008)(64756008)(66446008)(8936002)(55016002)(186003)(76176011)(25786009)(6916009)(102836004)(6506007)(229853002)(26005)(6436002)(11346002)(446003)(478600001)(486006)(74316002)(7696005)(14444005)(99286004)(8676002)(476003)(66066001)(54906003)(81156014)(2906002)(81166006)(256004)(3846002)(6116002)(316002)(52536014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3534;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9mYQNfxqL4Dh5ZaTVQi5ZIhLaxygy4lmA9yowlWnI07Y5O0/WZKjn+3YxPLwr5XcUUUux2e/aYsVciwKId7qQIRm45mcdU2PK/0eP3GfsjE/eYL6V6uLTxPLy8B/cMFJYRGnJBs5mpgcLSVtMebCzIkVkzCWn/VqN0OR/OpW+u/Gt9pHesIU/jN2YTVIkBBgKJHg7lVYpCKhxnMgnpXyD+POchCDBI6kYrPXRxaBLQYRAvf5GehuC+ueyEjVi09npyNAbLMGnBD3S9/svJDq5nOg3Y8bHgSwI0bpjjGCb4zd/c5U71Vc3+ybZMh+GnOA1h+Y+A56TXuSD50YYQGynweQsPs0KXn7H85z0K9vvKt5+tPH1YvuwVcgTmwYcmb7dvqVNezZh63tl59XJArXnL1lOQ21G7V3Me7HJEY1jB0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8abc84-2fe3-4fe1-6e28-08d7512ef74b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 05:17:25.2357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vMadipa3QuARPbvCdNXXZ5HOWvzjDW1KrnYRruxVhvfLuUh1ril1OOCI7+2Zrhg12oeuf3QpsAL/okK5Qy06voakPt225VtI95QVx9kJgE+PlvW5Qa+GrB+t5Mij6lWX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3534
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBPY3RvYmVyIDExLCAyMDE5IDk6MTEgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxMDoy
NyBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5j
b20+IHdyb3RlOg0KPiA+IFRvIHN1cHBvcnQgZGlmZmVyZW50IHJlZ2lzdGVycyBtZW1vcnkgbWFw
cGluZyBoYXJkd2FyZSBlYXNpbHkNCj4gPiBpbiB0aGUgZnV0dXJlLCB0aGlzIHBhdGNoIHJlbW92
ZXMgc29tZSB1bnVzZWQgcmVnaXN0ZXINCj4gPiBkZWNsYXJhdGlvbnMuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4NCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyENCg0KPiBXaGlsZSBJ
IGNhbiBjb25maXJtIHRoZSByZW1vdmVkIGRlZmluaXRpb25zIGFyZSB1bnVzZWQsIHRoZXkgd2Vy
ZQ0KPiBzdGlsbCB2YWxpZCAoYnV0IHNlZSBjb21tZW50cyBiZWxvdykuDQo+IFBlcmhhcHMgaXQg
d291bGQgYmUgYmV0dGVyIHRvIGFkZCBjb21tZW50cywgdG8gc3RhdGUgY2xlYXJseSB0byB3aGlj
aA0KPiBTb0NzIG9yIFNvQyBmYW1pbGllcyB0aGV5IGFwcGx5PyAgT3IgZG8geW91IHRoaW5rIHRo
aXMgd291bGQgYmUgZnV0aWxlLA0KPiBhbmQgd291bGQgYWRkIHRvbyBtdWNoIGNsdXR0ZXIgdG8g
dGhlIHNvdXJjZSBmaWxlIGluIHRoZSBuZWFyIGZ1dHVyZT8NCg0KSSB0aGluayBhZGRpbmcgY29t
bWVudHMgdG8gdGhlIGRlY2xhcmF0aW9ucyBhcmUgYmV0dGVyIHRvIGF2b2lkDQppbmNvcnJlY3Qg
aW1wbGVtZW50YXRpb24gaW4gdGhlIGZ1dHVyZS4gU28sIEknbGwgbWFrZSBzdWNoIGFuIGluY3Jl
bWVudGFsIHBhdGNoLg0KDQo+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9pcG1tdS12bXNhLmMNCj4g
PiArKysgYi9kcml2ZXJzL2lvbW11L2lwbW11LXZtc2EuYw0KPiA+IEBAIC0xMDQsOCArMTA0LDYg
QEAgc3RhdGljIHN0cnVjdCBpcG1tdV92bXNhX2RldmljZSAqdG9faXBtbXUoc3RydWN0IGRldmlj
ZSAqZGV2KQ0KPiA+ICAjZGVmaW5lIElNQ1RSICAgICAgICAgICAgICAgICAgICAgICAgICAweDAw
MDANCj4gPiAgI2RlZmluZSBJTUNUUl9UUkUgICAgICAgICAgICAgICAgICAgICAgKDEgPDwgMTcp
DQo+ID4gICNkZWZpbmUgSU1DVFJfQUZFICAgICAgICAgICAgICAgICAgICAgICgxIDw8IDE2KQ0K
PiA+IC0jZGVmaW5lIElNQ1RSX1JUU0VMX01BU0sgICAgICAgICAgICAgICAoMyA8PCA0KQ0KPiAN
Cj4gRldJVywgdGhpcyBpcyB2YWxpZCBmb3IgUi1DYXIgR2VuMiBvbmx5LiAgT24gUi1DYXIgR2Vu
MywgdGhlIGZpZWxkDQo+IGNvbnRhaW5zIDMgYml0cy4NCg0KVGhhdCdzIGNvcnJlY3QuDQoNCkJl
c3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==
