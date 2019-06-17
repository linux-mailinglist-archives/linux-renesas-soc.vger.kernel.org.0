Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1340479B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 07:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbfFQFYC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 01:24:02 -0400
Received: from mail-eopbgr1410134.outbound.protection.outlook.com ([40.107.141.134]:12860
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725280AbfFQFYC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 01:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gN6mmnoW3K5hOh93BKKuzGjFySEqVjLaEAVJdZOglJk=;
 b=OqjlMWBG//dEcK1b/jtRUnGDTlaWCt+LaSO+gcnh2B/9DCtTWr+zQGQLbOZIXnGqcDvoiQaPuE1+avDKaReNQVvCdEbhmVeFp/xme47lrvP7oUpHQgX7Ng3wd/5Rjc2Bx/Sfl6yhy1AEQ0BiZg2drVtSVJxzv0rMeuSxgOOLSeQ=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB4024.jpnprd01.prod.outlook.com (20.178.98.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Mon, 17 Jun 2019 05:23:57 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 05:23:57 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Robin Murphy <robin.murphy@arm.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "hch@lst.de" <hch@lst.de>, "joro@8bytes.org" <joro@8bytes.org>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Subject: RE: [RFC PATCH v6 1/5] iommu: add an exported function to get minimum
 page size for a domain
Thread-Topic: [RFC PATCH v6 1/5] iommu: add an exported function to get
 minimum page size for a domain
Thread-Index: AQHVIdGm+Ppekm2K+U6llaxf9E8Pnaaa5vGAgARrtMA=
Date:   Mon, 17 Jun 2019 05:23:57 +0000
Message-ID: <OSBPR01MB359067FF26C34F8D8090D606D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <5e295ec3-39c9-de8a-a649-0aeeb0078ae3@arm.com>
In-Reply-To: <5e295ec3-39c9-de8a-a649-0aeeb0078ae3@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34730ba4-6d2c-4f8f-3bcd-08d6f2e3ff2b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4024;
x-ms-traffictypediagnostic: OSBPR01MB4024:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <OSBPR01MB40244BE2E72C3C053B5C0FE0D8EB0@OSBPR01MB4024.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(376002)(366004)(136003)(346002)(199004)(189003)(66066001)(6916009)(55016002)(6436002)(25786009)(52536014)(229853002)(14454004)(478600001)(66574012)(6246003)(305945005)(6306002)(7736002)(5660300002)(966005)(9686003)(4326008)(476003)(71190400001)(71200400001)(3846002)(53936002)(14444005)(33656002)(256004)(316002)(53546011)(81166006)(6506007)(7696005)(8676002)(186003)(81156014)(74316002)(6116002)(54906003)(8936002)(7416002)(2906002)(66446008)(73956011)(99286004)(64756008)(66476007)(486006)(446003)(66946007)(66556008)(76116006)(26005)(11346002)(68736007)(102836004)(86362001)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4024;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5kgJNZ6XnxcYnh73fvJw9kEswz542cIOoX63/WkMHpAVHVX757hjfhuKZBDomRCOWloG9ypbP1vOt2vuGB0pb5+YpLWYrEKWgYv0LZ7GtoHNpVIJMkuMfbav6Aio2dR+j1brjMkrf3Y+7z7O+CBw40YGn+Q+uEvSGUMekAyHuFbAQtxNtfZdc/WM/c9f5iT0HiocVrOunN5qR6TNMSUhpNtwpblHr8uovxcGvOt23isvt6braBrrG9xBqgOsmuD/5+DfJmB/pew30LHUPIVGWaq1lmOOLEcN2VQOYI3GHxaijzeBSIp0dZWgmeQ54AvJfsXLa1jeumxrWVj2hnFXz94LunAo2PT5CD0uDqtwwyuYfX4RYaeqqvDLzblYAYmqbHBVs1Uzu7r9A5kgqim0YFfa+vzWIy8YKyvpxaCb8OM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34730ba4-6d2c-4f8f-3bcd-08d6f2e3ff2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 05:23:57.1035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4024
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUm9iaW4sDQoNCj4gRnJvbTogUm9iaW4gTXVycGh5LCBTZW50OiBGcmlkYXksIEp1bmUgMTQs
IDIwMTkgNjo0MSBQTQ0KPiANCj4gT24gMTMvMDYvMjAxOSAxMToyMCwgWW9zaGloaXJvIFNoaW1v
ZGEgd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBhZGRzIGFuIGV4cG9ydGVkIGZ1bmN0aW9uIHRvIGdl
dCBtaW5pbXVtIHBhZ2Ugc2l6ZSBmb3INCj4gPiBhIGRvbWFpbi4gVGhpcyBwYXRjaCBhbHNvIG1v
ZGlmaWVzIHNpbWlsYXIgY29kZXMgb24gdGhlIGlvbW11LmMuDQo+IA0KPiBIZWgsIHNlZWluZyB0
aGlzIGdhdmUgbWUgYSBnZW51aW5lIGTDqWrDoCB2dSBtb21lbnQuLi4NCj4gDQo+IC4uLmJ1dCBp
dCB0dXJucyBvdXQgSSBhY3R1YWxseSAqaGF2ZSogcmV2aWV3ZWQgdGhpcyBwYXRjaCBiZWZvcmUg
OikNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMDVlY2E2MDEtMDI2NC04MTQx
LWNlZWItN2VmN2FkNWQ1NjUwQGFybS5jb20vDQoNClRoYW5rIHlvdSBmb3IgdGhlIGluZm9ybWF0
aW9uIDopDQpJIHJlYWxpemVkIG15IHBhdGNoIHNob3VsZCBoYXZlIHRha2VuIGNhcmUgb2YgdGhl
IENPTkZJR19JUE1NVV9BUEk9biBjYXNlLg0KDQpIb3dldmVyLCB0aGUgbGF0ZXN0IHBhdGNoIHNl
cmllcyBkb2Vzbid0IGhhdmUgc3VjaCBhIHBhdGNoLiBTbywgSSdsbCBrZWVwIHRoaXMNCm15IHBh
dGNoIG9uIG5leHQgcGF0Y2ggdmVyc2lvbi4NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAxOTA2MDMwMTE2MjAuMzE5OTktMS1iYW9sdS5sdUBsaW51eC5pbnRlbC5jb20vDQoNCkJlc3Qg
cmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gUm9iaW4uDQo+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNv
bT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvaW9tbXUvaW9tbXUuYyB8IDE4ICsrKysrKysrKysr
KysrKy0tLQ0KPiA+ICAgaW5jbHVkZS9saW51eC9pb21tdS5oIHwgIDEgKw0KPiA+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvaW9tbXUuYw0K
PiA+IGluZGV4IDJhOTA2MzguLjdlZDE2YWYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pb21t
dS9pb21tdS5jDQo+ID4gKysrIGIvZHJpdmVycy9pb21tdS9pb21tdS5jDQo+ID4gQEAgLTI4MCw2
ICsyODAsMTggQEAgaW9tbXVfaW5zZXJ0X2RldmljZV9yZXN2X3JlZ2lvbnMoc3RydWN0IGxpc3Rf
aGVhZCAqZGV2X3Jlc3ZfcmVnaW9ucywNCj4gPiAgIAlyZXR1cm4gcmV0Ow0KPiA+ICAgfQ0KPiA+
DQo+ID4gKy8qKg0KPiA+ICsgKiBpb21tdV9nZXRfbWluaW11bV9wYWdlX3NpemUgLSBnZXQgbWlu
aW11bSBwYWdlIHNpemUgZm9yIGEgZG9tYWluDQo+ID4gKyAqIEBkb21haW46IHRoZSBkb21haW4N
Cj4gPiArICoNCj4gPiArICogQWxsb3cgaW9tbXUgZHJpdmVyIHRvIGdldCBhIG1pbmltdW0gcGFn
ZSBzaXplIGZvciBhIGRvbWFpbi4NCj4gPiArICovDQo+ID4gK3Vuc2lnbmVkIGxvbmcgaW9tbXVf
Z2V0X21pbmltdW1fcGFnZV9zaXplKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbikNCj4gPiAr
ew0KPiA+ICsJcmV0dXJuIDFVTCA8PCBfX2Zmcyhkb21haW4tPnBnc2l6ZV9iaXRtYXApOw0KPiA+
ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKGlvbW11X2dldF9taW5pbXVtX3BhZ2Vfc2l6ZSk7
DQo+ID4gKw0KPiA+ICAgaW50IGlvbW11X2dldF9ncm91cF9yZXN2X3JlZ2lvbnMoc3RydWN0IGlv
bW11X2dyb3VwICpncm91cCwNCj4gPiAgIAkJCQkgc3RydWN0IGxpc3RfaGVhZCAqaGVhZCkNCj4g
PiAgIHsNCj4gPiBAQCAtNTU4LDcgKzU3MCw3IEBAIHN0YXRpYyBpbnQgaW9tbXVfZ3JvdXBfY3Jl
YXRlX2RpcmVjdF9tYXBwaW5ncyhzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdyb3VwLA0KPiA+DQo+ID4g
ICAJQlVHX09OKCFkb21haW4tPnBnc2l6ZV9iaXRtYXApOw0KPiA+DQo+ID4gLQlwZ19zaXplID0g
MVVMIDw8IF9fZmZzKGRvbWFpbi0+cGdzaXplX2JpdG1hcCk7DQo+ID4gKwlwZ19zaXplID0gaW9t
bXVfZ2V0X21pbmltdW1fcGFnZV9zaXplKGRvbWFpbik7DQo+ID4gICAJSU5JVF9MSVNUX0hFQUQo
Jm1hcHBpbmdzKTsNCj4gPg0KPiA+ICAgCWlvbW11X2dldF9yZXN2X3JlZ2lvbnMoZGV2LCAmbWFw
cGluZ3MpOw0KPiA+IEBAIC0xNTk1LDcgKzE2MDcsNyBAQCBpbnQgaW9tbXVfbWFwKHN0cnVjdCBp
b21tdV9kb21haW4gKmRvbWFpbiwgdW5zaWduZWQgbG9uZyBpb3ZhLA0KPiA+ICAgCQlyZXR1cm4g
LUVJTlZBTDsNCj4gPg0KPiA+ICAgCS8qIGZpbmQgb3V0IHRoZSBtaW5pbXVtIHBhZ2Ugc2l6ZSBz
dXBwb3J0ZWQgKi8NCj4gPiAtCW1pbl9wYWdlc3ogPSAxIDw8IF9fZmZzKGRvbWFpbi0+cGdzaXpl
X2JpdG1hcCk7DQo+ID4gKwltaW5fcGFnZXN6ID0gaW9tbXVfZ2V0X21pbmltdW1fcGFnZV9zaXpl
KGRvbWFpbik7DQo+ID4NCj4gPiAgIAkvKg0KPiA+ICAgCSAqIGJvdGggdGhlIHZpcnR1YWwgYWRk
cmVzcyBhbmQgdGhlIHBoeXNpY2FsIG9uZSwgYXMgd2VsbCBhcw0KPiA+IEBAIC0xNjU1LDcgKzE2
NjcsNyBAQCBzdGF0aWMgc2l6ZV90IF9faW9tbXVfdW5tYXAoc3RydWN0IGlvbW11X2RvbWFpbiAq
ZG9tYWluLA0KPiA+ICAgCQlyZXR1cm4gMDsNCj4gPg0KPiA+ICAgCS8qIGZpbmQgb3V0IHRoZSBt
aW5pbXVtIHBhZ2Ugc2l6ZSBzdXBwb3J0ZWQgKi8NCj4gPiAtCW1pbl9wYWdlc3ogPSAxIDw8IF9f
ZmZzKGRvbWFpbi0+cGdzaXplX2JpdG1hcCk7DQo+ID4gKwltaW5fcGFnZXN6ID0gaW9tbXVfZ2V0
X21pbmltdW1fcGFnZV9zaXplKGRvbWFpbik7DQo+ID4NCj4gPiAgIAkvKg0KPiA+ICAgCSAqIFRo
ZSB2aXJ0dWFsIGFkZHJlc3MsIGFzIHdlbGwgYXMgdGhlIHNpemUgb2YgdGhlIG1hcHBpbmcsIG11
c3QgYmUNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb21tdS5oIGIvaW5jbHVkZS9s
aW51eC9pb21tdS5oDQo+ID4gaW5kZXggOTFhZjIyYS4uN2U1M2I0MyAxMDA2NDQNCj4gPiAtLS0g
YS9pbmNsdWRlL2xpbnV4L2lvbW11LmgNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2lvbW11LmgN
Cj4gPiBAQCAtMzY2LDYgKzM2Niw3IEBAIGV4dGVybiBpbnQgaW9tbXVfcmVxdWVzdF9kbWFfZG9t
YWluX2Zvcl9kZXYoc3RydWN0IGRldmljZSAqZGV2KTsNCj4gPiAgIGV4dGVybiBzdHJ1Y3QgaW9t
bXVfcmVzdl9yZWdpb24gKg0KPiA+ICAgaW9tbXVfYWxsb2NfcmVzdl9yZWdpb24ocGh5c19hZGRy
X3Qgc3RhcnQsIHNpemVfdCBsZW5ndGgsIGludCBwcm90LA0KPiA+ICAgCQkJZW51bSBpb21tdV9y
ZXN2X3R5cGUgdHlwZSk7DQo+ID4gK2V4dGVybiB1bnNpZ25lZCBsb25nIGlvbW11X2dldF9taW5p
bXVtX3BhZ2Vfc2l6ZShzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4pOw0KPiA+ICAgZXh0ZXJu
IGludCBpb21tdV9nZXRfZ3JvdXBfcmVzdl9yZWdpb25zKHN0cnVjdCBpb21tdV9ncm91cCAqZ3Jv
dXAsDQo+ID4gICAJCQkJCXN0cnVjdCBsaXN0X2hlYWQgKmhlYWQpOw0KPiA+DQo+ID4NCg==
