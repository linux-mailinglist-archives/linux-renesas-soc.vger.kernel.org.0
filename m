Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCBA0D6EA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 07:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbfJOF3h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 01:29:37 -0400
Received: from mail-eopbgr1410104.outbound.protection.outlook.com ([40.107.141.104]:4896
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726004AbfJOF3g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 01:29:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY9LtJrNWz99aPvdMnG0EPRaI9lN3792hl03i3TjKytnnUy6LHTn+5PNWb8NNwzJ055srrOtNyIRiY7/AFTVpUE9M9Cux57IB2Ec+UOjZTsJ7b/x0LDxO3B71im/V/MvzPxXa6Q2dtZE87sm04RygYGrioZNUModQDeZWO8kWnJhcYnxm6jg5tqWQdivl4QRpWcHy0IBOGrW0awXtqGyWAKRC126rLK0cvN5q8cUibDy5HLBUXEOka4/QnWwLueWP67+lSINVNL/qb3RtnhtOfF77mgyjcWNVFcrzVHGk+f6srtsG3DBLzxIOutbvIIC/1TU0xO7nfA8Bxq7IUvFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a17fE3H7Pa6A6k3bdmkywBlj9KQY/4p2C1/+Pgmlp2A=;
 b=XxXBK54qL8tpH83tZG9DPOvDn8N+aoLt1JLwddwZWL0eTEu2NcKJhqxR/MwG6Jy0VGRwuWxsTioEw4PFrd/XJvj/UR2y5/m72IAjz7f8lYGNBtlVXkxWclFvBbxmk3Axcwow7zwp9Gpj7ReGIpzlRXwTdLG8+Tlzg4SIFabjftDZUyVhHZm3+Qbmpd7bmQbMeppnx0xAhZjA+awo1gRmu6AboTj8Of9C9TYZy7Ge949uIVISqK0gAjdqNOb4yJvNKGajDxDKzNvsIZOFdrNV/9FU+t/gxtk3epg9ttsichRM0XAbFR+uwPFhUCeE4ofXYC2N8YC1fW+4be80o/6WMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a17fE3H7Pa6A6k3bdmkywBlj9KQY/4p2C1/+Pgmlp2A=;
 b=fquTLtHWqCHEh0XIjPGKGobs1hqjM7NcU9wgSFsc0ca9WG3X/0XCIwUd2WXNxFm54Cr1HsBxaXs0PmSysZ4BD9p+6Kv8/5R3N68MspakJgeLPDjzOTWPsYRmks9YdMf4ToRKn1FYO4D4GmE1g1BACKFvW6iEzXULkY3KFurkPEc=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5229.jpnprd01.prod.outlook.com (20.179.173.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 05:28:54 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 05:28:54 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] iommu/ipmmu-vmsa: Add utlb_offset_base
Thread-Topic: [PATCH 3/3] iommu/ipmmu-vmsa: Add utlb_offset_base
Thread-Index: AQHVfntNLlJCEf0ASk+p9SghIphMRKdVYuwAgAXS1YA=
Date:   Tue, 15 Oct 2019 05:28:54 +0000
Message-ID: <TYAPR01MB45443D65491480D1F95ACECCD8930@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1570609609-1332-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdW-Z9xkE5Eh7rbgufHSDvqoPyRJgsFhp_Ne9uk2XfUnEg@mail.gmail.com>
In-Reply-To: <CAMuHMdW-Z9xkE5Eh7rbgufHSDvqoPyRJgsFhp_Ne9uk2XfUnEg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c756eacb-417f-41ce-3a5f-08d7513091e2
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB5229:
x-microsoft-antispam-prvs: <TYAPR01MB5229F879D43DBC1B4CFE792DD8930@TYAPR01MB5229.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(199004)(189003)(26005)(8676002)(11346002)(446003)(486006)(256004)(66066001)(186003)(476003)(8936002)(86362001)(64756008)(229853002)(6436002)(66556008)(66476007)(81156014)(76116006)(66946007)(66446008)(74316002)(7736002)(305945005)(81166006)(33656002)(99286004)(478600001)(4326008)(6506007)(102836004)(7696005)(76176011)(53546011)(9686003)(55016002)(6916009)(14454004)(25786009)(71200400001)(71190400001)(2906002)(52536014)(54906003)(5660300002)(3846002)(6116002)(316002)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5229;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eLEiXfLfr6RaNQjJ6hr9CYiUkv5eNJf3TrD9tHIWNzhdXEZ8o2Qd4/lkdt9v2eJASc/Tp4JlSROsz7s00iosc77AeDRk2nEDeXSYtDYs7bsJhXQvhW+uDGGIYAFXcJFnJkDgKUiCQkJD824FJv/q0JNgu7JvlaJiJCBgghs1SEQnMWZdS3U3KVekRX8NezRg4gpBBdA5lbIlfBKWAebSrSSdDlqtm1PQo6vcdBxDPBvgcZ9pOkRC78bJFr00WNDPFF8gJZraLBUBdkZpJTcTrHVB3vfcBoUcG3UscUbZT0BGPYLyLKozqyVE6B3dUgPuIDSMm/V4n26Y4594MlnnL4ewLU0AEI3x9+Zy3t8AS2ry9JpqdGwovf7+lV1THCRPX0xy1c6aEJ93FWcadVXfajFfH1YHKKIHNkxvgbXVSKI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c756eacb-417f-41ce-3a5f-08d7513091e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 05:28:54.2088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4l2Ql/17BQaTSMkzSoK0iWNb2BWm1eL3qDkul5pqctYAlb1FQ2Xf45wsDY2RUdMuWCy51NnC1XfzaCkMxcfolGpe/MEBsQlM7KJJHAKSGhNilpguKYD2etVOtQosLWiR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5229
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBPY3RvYmVyIDExLCAyMDE5IDk6MzIgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxMDoyNyBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFNpbmNlIHdlIHdpbGwg
aGF2ZSBjaGFuZ2VkIG1lbW9yeSBtYXBwaW5nIG9mIHRoZSBJUE1NVSBpbiB0aGUgZnV0dXJlLA0K
PiA+IHRoaXMgcGF0Y2ggYWRkcyBhIHV0bGJfb2Zmc2V0X2Jhc2UgaW50byBzdHJ1Y3QgaXBtbXVf
ZmVhdHVyZXMNCj4gPiBmb3IgSU1VQ1RSIGFuZCBJTVVBU0lEIHJlZ2lzdGVycy4NCj4gPiBObyBi
ZWhhdmlvciBjaGFuZ2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9k
YSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvaW9tbXUvaXBtbXUtdm1zYS5jDQo+ID4g
KysrIGIvZHJpdmVycy9pb21tdS9pcG1tdS12bXNhLmMNCj4gPiBAQCAtNTIsNiArNTIsNyBAQCBz
dHJ1Y3QgaXBtbXVfZmVhdHVyZXMgew0KPiA+ICAgICAgICAgYm9vbCBjYWNoZV9zbm9vcDsNCj4g
PiAgICAgICAgIHUzMiBjdHhfb2Zmc2V0X2Jhc2U7DQo+ID4gICAgICAgICB1MzIgY3R4X29mZnNl
dF9zdHJpZGU7DQo+ID4gKyAgICAgICB1MzIgdXRsYl9vZmZzZXRfYmFzZTsNCj4gPiAgfTsNCj4g
Pg0KPiA+ICBzdHJ1Y3QgaXBtbXVfdm1zYV9kZXZpY2Ugew0KPiA+IEBAIC0yODUsNiArMjg2LDEx
IEBAIHN0YXRpYyB2b2lkIGlwbW11X2N0eF93cml0ZV9hbGwoc3RydWN0IGlwbW11X3Ztc2FfZG9t
YWluICpkb21haW4sDQo+ID4gICAgICAgICBpcG1tdV9jdHhfd3JpdGVfcm9vdChkb21haW4sIHJl
ZywgZGF0YSk7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgdTMyIGlwbW11X3V0bGJfcmVnKHN0
cnVjdCBpcG1tdV92bXNhX2RldmljZSAqbW11LCB1bnNpZ25lZCBpbnQgcmVnKQ0KPiA+ICt7DQo+
ID4gKyAgICAgICByZXR1cm4gbW11LT5mZWF0dXJlcy0+dXRsYl9vZmZzZXRfYmFzZSArIHJlZzsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiAgLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgICogVExC
IGFuZCBtaWNyb1RMQiBNYW5hZ2VtZW50DQo+ID4gICAqLw0KPiA+IEBAIC0zMzAsOSArMzM2LDkg
QEAgc3RhdGljIHZvaWQgaXBtbXVfdXRsYl9lbmFibGUoc3RydWN0IGlwbW11X3Ztc2FfZG9tYWlu
ICpkb21haW4sDQo+ID4gICAgICAgICAgKi8NCj4gPg0KPiA+ICAgICAgICAgLyogVE9ETzogV2hh
dCBzaG91bGQgd2Ugc2V0IHRoZSBBU0lEIHRvID8gKi8NCj4gPiAtICAgICAgIGlwbW11X3dyaXRl
KG1tdSwgSU1VQVNJRCh1dGxiKSwgMCk7DQo+ID4gKyAgICAgICBpcG1tdV93cml0ZShtbXUsIGlw
bW11X3V0bGJfcmVnKG1tdSwgSU1VQVNJRCh1dGxiKSksIDApOw0KPiA+ICAgICAgICAgLyogVE9E
TzogRG8gd2UgbmVlZCB0byBmbHVzaCB0aGUgbWljcm9UTEIgPyAqLw0KPiA+IC0gICAgICAgaXBt
bXVfd3JpdGUobW11LCBJTVVDVFIodXRsYiksDQo+ID4gKyAgICAgICBpcG1tdV93cml0ZShtbXUs
IGlwbW11X3V0bGJfcmVnKG1tdSwgSU1VQ1RSKHV0bGIpKSwNCj4gPiAgICAgICAgICAgICAgICAg
ICAgIElNVUNUUl9UVFNFTF9NTVUoZG9tYWluLT5jb250ZXh0X2lkKSB8IElNVUNUUl9GTFVTSCB8
DQo+ID4gICAgICAgICAgICAgICAgICAgICBJTVVDVFJfTU1VRU4pOw0KPiANCj4gTGlrZSBpbiBb
UEFUQ0ggMi8zXSwgSSB0aGluayBwcm92aWRpbmcgdHdvIGhlbHBlcnMgd291bGQgbWFrZSB0aGlz
IG1vcmUNCj4gcmVhZGFibGU6DQo+IA0KPiAgICAgaXBtbXVfaW11YXNpZF93cml0ZShtbXUsIHV0
bGIsIDApOw0KPiAgICAgaXBtbXVfaW11Y3RyX3dyaXRlKG1tdSwgdXRsYiwgZGF0YSk7DQoNCkkg
YWdyZWUuIEknbGwgZml4IGl0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0K
DQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2Vl
cnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
