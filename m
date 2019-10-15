Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3CDFD6E98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 07:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbfJOF2H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 01:28:07 -0400
Received: from mail-eopbgr1410090.outbound.protection.outlook.com ([40.107.141.90]:6109
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728254AbfJOF2G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 01:28:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIqQwpJwYW7kWVmJJn0TiMId/Rfb1PgUwiepfEw/bQ9F4rIdt5eitPIuWU2mAJequGZo0mf6LCpVmFz6K2fAaCYzjJwUoupksP0bZJ8Fm/aRkohlozr+X8k4T/bLQ6SqVqo/98tiTd+DBdvYzePELuLc5wje/DkpMZg4tV2L0vTwsXcvmjMlG09OmeuiCKkJfWA2WBMAbnMoGLks4hEsRX2bl6lHWF+D88QszrRXB9HqTI+sl0uWma9E8OGgyp17yht76wJfnE34Q/xkFe1ebn+m0+GyPEbdqJBHFtp0c85V6HX3XU04FQEB4AEM0PMbh5Lw7KfKQxeD4b5js6Xx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QelUmAPW/GgTuV0owG7bBbuKiZJq7V14QjPjTuItX9U=;
 b=aG5boPaYrzwD3kj7wZTZZiDoemSoZCl8tWGIb/5f1Sy0jK3CcW3i0RWUFeX8qUAEP2kh2TQz4hdYNnqlHrprUBuuAzEHPCGMy7BTAV0rCCLD7Ot0iGqbLpvvdY4z6wIlwJomHbutTkBqz5HvNfZADERPHFraSSD+zOUte/sZpnkclhMX2bcUWuQOK7nJYzzdg+RwQNkt41CESCsM25Ki4S6khEenpONK6XTLZpCLu8C79njL+yUdF9DabC5RDAS9py1eVRRyK7WQe8pz7/PSiPPXEnON9zI6qBI6cnaxEq9osPwYvGZAOBu12xbcUfVauxDAfKQNSMvfJTBMrTQxZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QelUmAPW/GgTuV0owG7bBbuKiZJq7V14QjPjTuItX9U=;
 b=r0VSa+554yvAJX3L96m9WC/Bu2RI8kCnkwsv4GaMKpAWRqk3SarZ3jaD4Z1bi9A6WF6VGTtiP0Jc7lAcHUCuEGlsqHivo1UzNNsUgFNAOz7JWK82N5Rlel2bKEZTOJI1A8eUiOGOapCTEEtG5ejllBGshCVWG8HMa++jw66qGXs=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5229.jpnprd01.prod.outlook.com (20.179.173.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 05:28:00 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 05:28:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/3] iommu/ipmmu-vmsa: Calculate context registers' offset
 instead of a macro
Thread-Topic: [PATCH 2/3] iommu/ipmmu-vmsa: Calculate context registers'
 offset instead of a macro
Thread-Index: AQHVfntNJwDAogugWk+c3XT+CqZTpadVYhSAgAXSjeA=
Date:   Tue, 15 Oct 2019 05:28:00 +0000
Message-ID: <TYAPR01MB4544DB942C8B4F016E043B21D8930@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1570609609-1332-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXv3ChOHO7RyOjQ0mL+9ugRFWnMUw7MfYD-9aU+ZZMSTQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXv3ChOHO7RyOjQ0mL+9ugRFWnMUw7MfYD-9aU+ZZMSTQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2fcfd06-901f-4064-0a45-08d7513071f8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB5229:
x-microsoft-antispam-prvs: <TYAPR01MB5229783F27077E8FAEE82638D8930@TYAPR01MB5229.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(199004)(189003)(26005)(8676002)(11346002)(446003)(486006)(256004)(66066001)(186003)(476003)(8936002)(86362001)(64756008)(229853002)(6436002)(66556008)(66476007)(81156014)(76116006)(66946007)(66446008)(74316002)(7736002)(305945005)(81166006)(33656002)(99286004)(478600001)(4326008)(6506007)(102836004)(7696005)(76176011)(53546011)(9686003)(55016002)(6916009)(14454004)(25786009)(71200400001)(71190400001)(2906002)(52536014)(54906003)(5660300002)(3846002)(6116002)(316002)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5229;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M+DGxdUac5NJkzn+1l/r8II4uKjkmEDZVrsYCrslAYQ+rFxufkiaj4V87fKMPQ96MogFpO4aRgPurjQERTdA+ytRvITylFk4sh7ia4ve+Z0v6tN1mGr9dEA09PjqZ2rYDO034RfePVknp2TKQEJNqLTgC5KFYYKdtMVRKYZ/6IzmA/TatnGv3d36u2gmDYjkpa2CpPNbNTmheYK4iFCbQI4wPCBwYZ9elqJPn4hmW5trtv68K7/vYPoydxjow5YeHC21GMiE0/s/6kXDaI5tBUx2LtEaDdvS0RiDNIH33vLJ+b8/YPf8zs8uqlRmS1TECy1g6WR3qRvv+Ragc62pnCLyAivjWQlZLauyY45pVxNg9dBy0cUzcMGX+dkFMXxOtOQ0fb6I9dXcZ3MZj5J0O7JX88JpzEAWpiFDbSHyHhA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fcfd06-901f-4064-0a45-08d7513071f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 05:28:00.6436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sa4KQY98oDGrIvbOB7/A80Q8TcDlbt3Ql4faFEHSrorfFfhoe+EPKRBIqLrmfNP0Y5dsEQWMw6msaHigQ34rUaI7ciHKgZIfoiG6CdQ8I3g3fKmQL+tNiVsLh+bKUR3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5229
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBPY3RvYmVyIDExLCAyMDE5IDk6MjkgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxMDoyNyBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFNpbmNlIHdlIHdpbGwg
aGF2ZSBjaGFuZ2VkIG1lbW9yeSBtYXBwaW5nIG9mIHRoZSBJUE1NVSBpbiB0aGUgZnV0dXJlLA0K
PiA+IHRoaXMgcGF0Y2ggdXNlcyBpcG1tdV9mZWF0dXJlcyB2YWx1ZXMgaW5zdGVhZCBvZiBhIG1h
Y3JvIHRvDQo+ID4gY2FsY3VsYXRlIGNvbnRleHQgcmVnaXN0ZXJzIG9mZnNldC4gTm8gYmVoYXZp
b3IgY2hhbmdlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBh
dGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L2lwbW11LXZtc2EuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvaW9tbXUvaXBtbXUtdm1zYS5jDQo+ID4gQEAgLTUwLDYgKzUwLDggQEAgc3RydWN0
IGlwbW11X2ZlYXR1cmVzIHsNCj4gPiAgICAgICAgIGJvb2wgdHdvYml0X2ltdHRiY3Jfc2wwOw0K
PiA+ICAgICAgICAgYm9vbCByZXNlcnZlZF9jb250ZXh0Ow0KPiA+ICAgICAgICAgYm9vbCBjYWNo
ZV9zbm9vcDsNCj4gPiArICAgICAgIHUzMiBjdHhfb2Zmc2V0X2Jhc2U7DQo+ID4gKyAgICAgICB1
MzIgY3R4X29mZnNldF9zdHJpZGU7DQo+ID4gIH07DQo+ID4NCj4gPiAgc3RydWN0IGlwbW11X3Zt
c2FfZGV2aWNlIHsNCj4gPiBAQCAtOTksOCArMTAxLDYgQEAgc3RhdGljIHN0cnVjdCBpcG1tdV92
bXNhX2RldmljZSAqdG9faXBtbXUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+DQo+ID4gICNkZWZp
bmUgSU1fTlNfQUxJQVNfT0ZGU0VUICAgICAgICAgICAgIDB4ODAwDQo+ID4NCj4gPiAtI2RlZmlu
ZSBJTV9DVFhfU0laRSAgICAgICAgICAgICAgICAgICAgMHg0MA0KPiA+IC0NCj4gPiAgI2RlZmlu
ZSBJTUNUUiAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDAwDQo+ID4gICNkZWZpbmUgSU1D
VFJfVFJFICAgICAgICAgICAgICAgICAgICAgICgxIDw8IDE3KQ0KPiA+ICAjZGVmaW5lIElNQ1RS
X0FGRSAgICAgICAgICAgICAgICAgICAgICAoMSA8PCAxNikNCj4gPiBAQCAtMjUzLDE4ICsyNTMs
MjUgQEAgc3RhdGljIHZvaWQgaXBtbXVfd3JpdGUoc3RydWN0IGlwbW11X3Ztc2FfZGV2aWNlICpt
bXUsIHVuc2lnbmVkIGludCBvZmZzZXQsDQo+ID4gICAgICAgICBpb3dyaXRlMzIoZGF0YSwgbW11
LT5iYXNlICsgb2Zmc2V0KTsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB1MzIgaXBtbXVfY3R4
X3JlZyhzdHJ1Y3QgaXBtbXVfdm1zYV9kZXZpY2UgKm1tdSwgdW5zaWduZWQgaW50IGNvbnRleHRf
aWQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCByZWcpDQo+ID4g
K3sNCj4gPiArICAgICAgIHJldHVybiBtbXUtPmZlYXR1cmVzLT5jdHhfb2Zmc2V0X2Jhc2UgKw0K
PiA+ICsgICAgICAgICAgICAgIGNvbnRleHRfaWQgKiBtbXUtPmZlYXR1cmVzLT5jdHhfb2Zmc2V0
X3N0cmlkZSArIHJlZzsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHUzMiBpcG1tdV9jdHhf
cmVhZF9yb290KHN0cnVjdCBpcG1tdV92bXNhX2RvbWFpbiAqZG9tYWluLA0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcmVnKQ0KPiA+ICB7DQo+ID4gICAg
ICAgICByZXR1cm4gaXBtbXVfcmVhZChkb21haW4tPm1tdS0+cm9vdCwNCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgIGRvbWFpbi0+Y29udGV4dF9pZCAqIElNX0NUWF9TSVpFICsgcmVnKTsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGlwbW11X2N0eF9yZWcoZG9tYWluLT5tbXUs
IGRvbWFpbi0+Y29udGV4dF9pZCwgcmVnKSk7DQo+IA0KPiBGb3IgY29uc2lzdGVuY3k6DQo+IA0K
PiAgICAgaXBtbXVfY3R4X3JlZyhkb21haW4tPm1tdS0+cm9vdCwgLi4uKQ0KPiANCj4gYnV0IGlu
IHByYWN0aWNlIHRoZSBmZWF0dXJlcyBmb3IgZG9tYWluLT5tbXUgYW5kIGRvbWFpbi0+bW11LT5y
b290IGFyZQ0KPiBpZGVudGljYWwgYW55d2F5Lg0KPiANCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRp
YyB2b2lkIGlwbW11X2N0eF93cml0ZV9yb290KHN0cnVjdCBpcG1tdV92bXNhX2RvbWFpbiAqZG9t
YWluLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBy
ZWcsIHUzMiBkYXRhKQ0KPiA+ICB7DQo+ID4gICAgICAgICBpcG1tdV93cml0ZShkb21haW4tPm1t
dS0+cm9vdCwNCj4gPiAtICAgICAgICAgICAgICAgICAgIGRvbWFpbi0+Y29udGV4dF9pZCAqIElN
X0NUWF9TSVpFICsgcmVnLCBkYXRhKTsNCj4gPiArICAgICAgICAgICAgICAgICAgIGlwbW11X2N0
eF9yZWcoZG9tYWluLT5tbXUsIGRvbWFpbi0+Y29udGV4dF9pZCwgcmVnKSwgZGF0YSk7DQo+IA0K
PiBMaWtld2lzZToNCj4gDQo+ICAgICBpcG1tdV9jdHhfcmVnKGRvbWFpbi0+bW11LT5yb290LCAu
Li4pPw0KDQpUaGFuayB5b3UgZm9yIHRoZSBjb21tZW50cyEgWWVzLCB3ZSBjYW4gdXNlIGRvbWFp
bi0+bW11LT5yb290IHRvIGlwbW11X2N0eF9yZWcoKQ0KYmVjYXVzZSBpcG1tdV9jdHhfcmVnKCkg
b25seSB1c2UgbW11LT5mZWF0dXJlcy4NCg0KPiBJIGZpbmQgdGhlc2UgaXBtbXVfe3JlYWQsd3Jp
dGV9KCkgYSBiaXQgaGFyZCB0b28gcmVhZCwgd2l0aCBwYXNzaW5nIHRoZQ0KPiBtbXUgdG8gYm90
aCBpcG1tdV97cmVhZCx3cml0ZX0oKSBhbmQgaXBtbXVfY3R4X3JlZygpLg0KDQpJIGNvbXBsZXRl
bHkgYWdyZWUuDQoNCj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgcHJvdmlkaW5nIHR3byBoZWxw
ZXJzIGlwbW11X2N0eF97cmVhZCx3cml0ZX0oKSwNCj4gc28gYWxsIHVzZXJzIGNhbiBqdXN0IHVz
ZSBlLmcuDQo+IA0KPiAgICAgaXBtbXVfY3R4X3dyaXRlKG1tdSwgY29udGV4dF9pZCwgcmVnLCBk
YXRhKTsNCj4gDQo+IGluc3RlYWQgb2YNCj4gDQo+ICAgICBpcG1tdV93cml0ZShtbXUsIGlwbW11
X2N0eF9yZWcobW11LCBjb250ZXh0X2lkLCByZWcpLCBkYXRhKTsNCj4gDQo+ID8NCg0KSSB0aGlu
ayBzby4gSSdsbCBmaXggaXQuIFBlcmhhcHMsIEknbGwgbWFrZSBhIHBhdGNoIHdoaWNoIGNoYW5n
ZXMNCnRoZSBmdW5jdGlvbiBuYW1lIGF0IGZpcnN0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhp
cm8gU2hpbW9kYQ0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+
IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
