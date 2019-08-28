Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E63449F909
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 06:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbfH1EFM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 00:05:12 -0400
Received: from mail-eopbgr1400104.outbound.protection.outlook.com ([40.107.140.104]:26976
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725497AbfH1EFM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 00:05:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1j30qH5L2cmweydAyESfmX77N9CmALRSBc7ZpjCxsL2ZGFXrn4wJhfLrBXEB3HuLh48Pn2ClIFPQtoHKFiHayKLtFrKDLIh4TZscn1UrkzcAxbAYvYG4AZnAMTTyw7UIjwfIyZT14uS6hyw0Vr4mMppbjlnOBTfV9o9iBAkGX/Se+7Tl+kVx7ysEQ7NX17UmK4bT9INQ6HZbnXQktzOgYrr1DuTNiiujzjIW+ue5Wh3IOK0vwXlyhASspl6ytLiqY+thU/+CPjYWx9X8XXHsGAEASJDwCCDe/duqqx/KZ4D40Gjui+MSCJLOTNBQJPisYK4rBIXyvc2BzM8V++PJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZzsGatfMDvdUTzQD6MyNi2kR8kP1+l61qRZarA8q5g=;
 b=g95CZszBGpXqgVk+HcfU+7+I0h36JgFiAnj+JIqY9snizxEt1iNWmITT7NHzSwVWDzUPSPt/WjqR7ZcgwBT7RZz2PKilTazCT0rPNtl3QUM4JZZQ8hhp3/htkm9u/YW2ovAynuP1C5OIyqP0DjWJqH34x7Jhcg26BD2gMk2RdI+IQhyOnpDPJCjzkonO27Z3s4/JTN51nMBY8ykIxH5Etlu+Yshb3bUryZEsW5KGuwo+a18KnzRhtDPsu/64lpWGPECnpSvuud0L/gLaiAMWie0eZoEnxCGDUfxLoFlbSyDZa79RUh7vWZz6uODRBWcBq64cyxUU7/UBNGmqOrnqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZzsGatfMDvdUTzQD6MyNi2kR8kP1+l61qRZarA8q5g=;
 b=n49Ut9mr8n0hO4gKutO8FMEdvTC8Q4U1/q0W0U5sfuWkNznAB3O78Qtu5OY5D1yHuu6G1xy1XY/cCsidzk/gbPbUc2hRqHwwqJb8VZ1NZy1Grs1BrzlOPJef2UN4uoN/jDIgGWhDE6G50bmMt5l8TSvp3fvKmzoH+n07PvRCkL8=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2749.jpnprd01.prod.outlook.com (20.177.101.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 04:05:08 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 04:05:08 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/4] usb: host: xhci-plat: add quirks member into struct
 xhci_plat_priv
Thread-Topic: [PATCH 1/4] usb: host: xhci-plat: add quirks member into struct
 xhci_plat_priv
Thread-Index: AQHVXL65boAxhOWBBEeXuQrtYxXDjacO7l+AgAD+NXA=
Date:   Wed, 28 Aug 2019 04:05:08 +0000
Message-ID: <TYAPR01MB45444BB3119058B6932C98AED8A30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1566900127-11148-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdW4xa=RFqUdCEs1v3MuqAFwpXoW=tvcdEocqe3eeCpd=Q@mail.gmail.com>
In-Reply-To: <CAMuHMdW4xa=RFqUdCEs1v3MuqAFwpXoW=tvcdEocqe3eeCpd=Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03a13a3f-e4a2-4304-3fbe-08d72b6cea3c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TYAPR01MB2749;
x-ms-traffictypediagnostic: TYAPR01MB2749:
x-microsoft-antispam-prvs: <TYAPR01MB274925966084899849AFF024D8A30@TYAPR01MB2749.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(189003)(199004)(7696005)(5660300002)(71200400001)(71190400001)(99286004)(26005)(6916009)(54906003)(476003)(316002)(76116006)(446003)(3846002)(11346002)(6116002)(66066001)(66556008)(66946007)(7736002)(66476007)(102836004)(64756008)(186003)(66446008)(33656002)(14454004)(53546011)(6506007)(305945005)(486006)(8936002)(55016002)(86362001)(81166006)(81156014)(25786009)(8676002)(4326008)(52536014)(229853002)(74316002)(2906002)(478600001)(6436002)(256004)(53936002)(6246003)(9686003)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2749;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Lolm55XEDX552wutHGonA8SSgoM+0rYegD5flhJpY0PCRJR6KoLaoQ8yqTNqPqsBZDk6R11964QyBZeiZgDcRoXZhbAkvyuglPnBNopsVcOfyYWtiqG88PsKgt8CeL2uF52nyq83cbmi8YlwBn6+2zmAyN/Fec2o72VsLhT5pGC6AlP7P1MDRcoIKGKUlACFzkh9/+mDUspj0ywBwl7DXJn7aMvLJmsA5ZfkzLJxqeDwOoDfVOkr4Poyu44rrlMND2zPfStn2IFt8PHGN7xMePN/85aOwv84h9cU8O6bovSpgqZN1g6OUnm6kxIfqOSJ/GJ114L4MWxYYPTFMs6Whp6kh739Cu/28ZgRwchw9fRp7Ejhl+RJXS0vlycS9aPN76xQDBTBCltjx0fEnSWLKl4+2YdHJ+7Q5/w9TETQoa8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a13a3f-e4a2-4304-3fbe-08d72b6cea3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 04:05:08.0954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OVKAcRdat+RPX1fg2v0yKtYS1cVHOY2xnTr3Pvj9oFXFXyUTBEl0MojmrMJgKfihyode4P9kKgF+yvcs1x1falTp0k2F6intAd+0MZEbgbHoJto6N1CtQPwkvUkkWq0b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2749
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgQXVndXN0IDI3LCAyMDE5IDk6MzYgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTI6MDUgUE0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBUbyBzaW1wbGlmeSBh
ZGRpbmcgeGhjaS0+cXVpcmtzIGluc3RlYWQgb2YgdGhlIC5pbml0X3F1aXJrKCkNCj4gPiBmdW5j
dGlvbiwgdGhpcyBwYXRjaCBhZGRzIGEgbmV3IHBhcmFtZXRlciAicXVpcmtzIiBpbnRvDQo+ID4g
dGhlIHN0cnVjdCB4aGNpX3BsYXRfcHJpdi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hp
aGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gDQo+IFJl
dmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0K
DQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+ID4gLS0tIGEvZHJpdmVycy91c2IvaG9z
dC94aGNpLXBsYXQuaA0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmgNCj4g
PiBAQCAtMTIsMTAgKzEyLDEyIEBADQo+ID4NCj4gPiAgc3RydWN0IHhoY2lfcGxhdF9wcml2IHsN
Cj4gPiAgICAgICAgIGNvbnN0IGNoYXIgKmZpcm13YXJlX25hbWU7DQo+ID4gKyAgICAgICB1bnNp
Z25lZCBsb25nIGxvbmcgcXVpcmtzOw0KPiA+ICAgICAgICAgdm9pZCAoKnBsYXRfc3RhcnQpKHN0
cnVjdCB1c2JfaGNkICopOw0KPiA+ICAgICAgICAgaW50ICgqaW5pdF9xdWlyaykoc3RydWN0IHVz
Yl9oY2QgKik7DQo+ID4gICAgICAgICBpbnQgKCpyZXN1bWVfcXVpcmspKHN0cnVjdCB1c2JfaGNk
ICopOw0KPiA+ICB9Ow0KPiA+DQo+ID4gICNkZWZpbmUgaGNkX3RvX3hoY2lfcHJpdihoKSAoKHN0
cnVjdCB4aGNpX3BsYXRfcHJpdiAqKWhjZF90b194aGNpKGgpLT5wcml2KQ0KPiA+ICsjZGVmaW5l
IHhoY2lfdG9fcHJpdih4KSAoKHN0cnVjdCB4aGNpX3BsYXRfcHJpdiAqKSh4KS0+cHJpdikNCj4g
DQo+IEp1c3Qgd29uZGVyaW5nOiBpcyB4LT5wcml2IGd1YXJhbnRlZWQgdG8gYmUgb2YgdHlwZSBz
dHJ1Y3QgeGhjaV9wbGF0X3ByaXYgKiwNCj4gYWxzbyBpbiB0aGUgZnV0dXJlPw0KPiANCj4gICAg
IHN0cnVjdCB4aGNpX2hjZCB7DQo+ICAgICAgICAgICAgIC4uLg0KPiAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nICAgICAgICAgICBwcml2WzBdIF9fYWxpZ25lZChzaXplb2YoczY0KSk7DQoNCkl0
IHNlZW1zIHNvLiBCdXQsIEknbSBub3Qgc3VyZSB0aGF0IHdlIGNhbiBjaGFuZ2UgdHlwZSBvZiB0
aGUgcHJpdlswXSB0bw0Kc3RydWN0IHhoY2lfcGxhdF9wcml2ICosIGJlY2F1c2UgdGhpcyBpbXBs
ZW1lbnRhdGlvbiBpcyByZWxhdGVkIHRvIGFsbCB1c2JfaGNkIGRyaXZlcnM6DQoNCjwgRGV0YWls
cyBpZiB5b3UgYXJlIGludGVyZXN0ZWQgaW4gOikgPg0KLS0tIGluY2x1ZGUvbGludXgvdXNiL2hj
ZC5oIC0tLQ0Kc3RydWN0IHVzYl9oY2Qgew0KCS4uLg0KCS8qIFRoZSBIQyBkcml2ZXIncyBwcml2
YXRlIGRhdGEgaXMgc3RvcmVkIGF0IHRoZSBlbmQgb2YNCgkgKiB0aGlzIHN0cnVjdHVyZS4NCgkg
Ki8NCgl1bnNpZ25lZCBsb25nIGhjZF9wcml2WzBdDQoJCQlfX2F0dHJpYnV0ZV9fICgoYWxpZ25l
ZChzaXplb2YoczY0KSkpKTsNCn07DQoNCi0tLSBkcml2ZXJzL3VzYi9ob3N0L3hoY2kuYyAtLS0N
CnN0YXRpYyBjb25zdCBzdHJ1Y3QgaGNfZHJpdmVyIHhoY2lfaGNfZHJpdmVyID0gew0KCS4uLg0K
CS5oY2RfcHJpdl9zaXplID0Jc2l6ZW9mKHN0cnVjdCB4aGNpX2hjZCksDQoNCmFuZA0KDQp2b2lk
IHhoY2lfaW5pdF9kcml2ZXIoc3RydWN0IGhjX2RyaXZlciAqZHJ2LA0KCQkgICAgICBjb25zdCBz
dHJ1Y3QgeGhjaV9kcml2ZXJfb3ZlcnJpZGVzICpvdmVyKQ0Kew0KCUJVR19PTighb3Zlcik7DQoN
CgkvKiBDb3B5IHRoZSBnZW5lcmljIHRhYmxlIHRvIGRydiB0aGVuIGFwcGx5IHRoZSBvdmVycmlk
ZXMgKi8NCgkqZHJ2ID0geGhjaV9oY19kcml2ZXI7DQoNCglpZiAob3Zlcikgew0KCQlkcnYtPmhj
ZF9wcml2X3NpemUgKz0gb3Zlci0+ZXh0cmFfcHJpdl9zaXplOw0KDQotLS0gZHJpdmVycy91c2Iv
aG9zdC94aGNpLXBsYXQuYyAtLS0NCnN0YXRpYyBjb25zdCBzdHJ1Y3QgeGhjaV9kcml2ZXJfb3Zl
cnJpZGVzIHhoY2lfcGxhdF9vdmVycmlkZXMgX19pbml0Y29uc3QgPSB7DQoJLmV4dHJhX3ByaXZf
c2l6ZSA9IHNpemVvZihzdHJ1Y3QgeGhjaV9wbGF0X3ByaXYpLA0KDQp2b2lkIHhoY2lfaW5pdF9k
cml2ZXIoc3RydWN0IGhjX2RyaXZlciAqZHJ2LA0KCQkgICAgICBjb25zdCBzdHJ1Y3QgeGhjaV9k
cml2ZXJfb3ZlcnJpZGVzICpvdmVyKQ0Kew0KCUJVR19PTighb3Zlcik7DQoNCgkvKiBDb3B5IHRo
ZSBnZW5lcmljIHRhYmxlIHRvIGRydiB0aGVuIGFwcGx5IHRoZSBvdmVycmlkZXMgKi8NCgkqZHJ2
ID0geGhjaV9oY19kcml2ZXI7DQoNCglpZiAob3Zlcikgew0KCQlkcnYtPmhjZF9wcml2X3NpemUg
Kz0gb3Zlci0+ZXh0cmFfcHJpdl9zaXplOw0KDQotLS0gZHJpdmVycy91c2IvY29yZS9oY2QuYyAt
LS0NCnN0cnVjdCB1c2JfaGNkICpfX3VzYl9jcmVhdGVfaGNkKGNvbnN0IHN0cnVjdCBoY19kcml2
ZXIgKmRyaXZlciwNCgkJc3RydWN0IGRldmljZSAqc3lzZGV2LCBzdHJ1Y3QgZGV2aWNlICpkZXYs
IGNvbnN0IGNoYXIgKmJ1c19uYW1lLA0KCQlzdHJ1Y3QgdXNiX2hjZCAqcHJpbWFyeV9oY2QpDQp7
DQoJc3RydWN0IHVzYl9oY2QgKmhjZDsNCg0KCWhjZCA9IGt6YWxsb2Moc2l6ZW9mKCpoY2QpICsg
ZHJpdmVyLT5oY2RfcHJpdl9zaXplLCBHRlBfS0VSTkVMKTsNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IA0KPiBH
cntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+
IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
