Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425DC1ABDB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441463AbgDPKQq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:16:46 -0400
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:29236
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2441512AbgDPKQU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:16:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjtaIE0p68uHPj4kDLoV8l9AW3Ti5QUZ+e0K8XKhCK0DIHhD4/1u6lp5FurGTBY/+5kJXubmaVNITV1glyR6XC7kfMp8RjZh1Gi9ArY4M54P5YbJxg9CQIv+3JDXMojo45lUBBWO7LCN8tEZD1jGuXXwL5cDER6QIt1u3BiRkIYbsVXvVVCHt304LbT1VH00LlQ3M5eJ2vAe6XZvmYjUiM2HrZzQWsg0YC2ieUvIUSpRG372hLcXe7aiO5fxINSl83pRMeYn9jT8AoIADo16naY10FvrxcpUgZtFAq0cK8SCom6UqjgJJ8CQaHqHYRgThgJNxztFBtTsJA8pG2dwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpcoxqpRKMG6ogp7hCOTX4SXvHTFwBxBHVT7PrygP/A=;
 b=EYdBOLEZR5nPVH48+n8JCMoElr8XRrBAWqAJa7shibEk9tgKFY/W+iveCcv0hapIbiDky5z5bZYgKp2FDO1+b6kllvct+SBRKJQfWgJlGKEfyXnQQ8epiwpgVqKpfSx39gAtEyn9nrWviJhThTkPT0wjMFGHOUnVosWBUuTggvjw7BcC6YEB9S6w95Y6sAvzv2TJfpyugsbKVAtEsA1KVEalDStKBC7fY4vtRzCjxHpNjz25SVUQWHkTUyjDRWoXOspbL2CTIWGM4xpQyYxNR3JyN7ToKaASwul6D7mH6Wu91nD7q2oa7uJvE9BJCl17CsrnL4AZG5T/mMLVYQdhPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpcoxqpRKMG6ogp7hCOTX4SXvHTFwBxBHVT7PrygP/A=;
 b=pp6SQBhxmM/3rm9ZcMqJ8mpcxrYiMNjMQmw1xglfKjU1smibYlwrt99CvU0e4ZotUpPS6ujDum3VyR8MgSv0Hg6x/6upNo3RXwYBb/YwIPRgtKiX9/UsJQMin2y1hNQ8K1FpADMumFyGQmi/b1TibG8y6Cg0ZCTHjpPIkt6MMwI=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2845.jpnprd01.prod.outlook.com (20.177.103.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15; Thu, 16 Apr 2020 10:16:11 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2921.027; Thu, 16 Apr 2020
 10:16:11 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bndings: iommu: renesas,ipmmu-vmsa: convert to
 json-schema
Thread-Topic: [PATCH] dt-bndings: iommu: renesas,ipmmu-vmsa: convert to
 json-schema
Thread-Index: AQHWEX3joQ1TxPqDiku42usLcXTo3Kh6PzwAgAE4wqCAABJiAIAAANaw
Date:   Thu, 16 Apr 2020 10:16:10 +0000
Message-ID: <TYAPR01MB4544793C572390BFECFC35B3D8D80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXvZp5GFY5-SjXP0PLE8MiwYencVMti93wU4E3N2c0QVg@mail.gmail.com>
 <TYAPR01MB45440F928F3DDBFCDC0A25CED8D80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <CAMuHMdUvSka3F=3mU0qpjcOxQVftyxjHFhXbx7b+Pun9226L9g@mail.gmail.com>
In-Reply-To: <CAMuHMdUvSka3F=3mU0qpjcOxQVftyxjHFhXbx7b+Pun9226L9g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0f3b3dee-b9e3-4e1b-5655-08d7e1ef2fb7
x-ms-traffictypediagnostic: TYAPR01MB2845:
x-microsoft-antispam-prvs: <TYAPR01MB2845A3EC67F29C9D8D4766A8D8D80@TYAPR01MB2845.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(2906002)(55016002)(55236004)(9686003)(4326008)(33656002)(86362001)(6916009)(478600001)(186003)(71200400001)(52536014)(316002)(64756008)(54906003)(26005)(6506007)(81156014)(5660300002)(7696005)(66446008)(66556008)(66946007)(66476007)(8936002)(8676002)(76116006)(142933001);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y4vOpgo8ERpwUQ+nAadbGnIgmuZErEmvi2yW1V/m0+NSub6YtpS13iObDtfj2T7NZeyh6Ssdzu2hVag7NXwjTHYa7t3AsvOKRkilTlaZAiVnge/mhRZzfFzVDnYtTfI0L9/b0md0qonjzJp/SuCIhfUE4gsxFXLL/U2gPjosG8xb4IDOK8FIcMz4FxxdCRtHoLYBN5TfydVPPD1smqBP1ZT1z3UfIPOt424C2iWe22MNME4Wz25coDLPQVO80chK3j7+OM0BuZkzt39d7U08ocB9oh15oFivVvY7EcemfQxbX3n3lYtlcogwumRnnYkaGgJE82gosoEKw9n88xpeTDKTG4v1Coiun8KK/QT138CJkn0vjgpTPQ/6YjGy5z86a2ko/nTUrsE/gIoBMklvg/ilKNxFs58qNFHli2lWABrMfFX0AotrPhoPdHHMSrrqisSx3ABOFGvTRNMsSmELbhxxQkaS/gH7rSFziPCf+/CKSblrfsTlJoKSFSdZZbU0
x-ms-exchange-antispam-messagedata: nVFJmugVIHcY1lEGB5BhFvEGVRVj9/oiRhu8IykQzPLahxDWHcJqsIw5Ala2wABPjbT+fqtOOBbFa/ijo2AxGeS5psukHRUXZGNtZQDQWhN9xSVKEYdjoN3uj2oSn6Ir319ftPEhfO2rX0REhhoKlA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3b3dee-b9e3-4e1b-5655-08d7e1ef2fb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 10:16:10.8143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGmVP9RThtYoZoR9TGiCGXWPApr/YrSCrykKf+nCrty/LRG4Dc76A8F0jZOXT8RSHiAszxXkav4XsnJ4DePzfs2w9q6Vtm8prnIdNe8KvvZYdoyHbfLaY8vko2xovACg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2845
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIEFwcmlsIDE2LCAyMDIwIDc6MDYgUE0NCjxzbmlwPg0KPiA+ID4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9y
ZW5lc2FzLGlwbW11LXZtc2EueWFtbA0KPiANCj4gPiA+ID4gKyAgcmVuZXNhcyxpcG1tdS1tYWlu
Og0KPiA+ID4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Bo
YW5kbGUtYXJyYXkNCj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gKyAgICAgIFJl
ZmVyZW5jZSB0byB0aGUgbWFpbiBJUE1NVSBpbnN0YW5jZSBpbiB0d28gY2VsbHMuIFRoZSBmaXJz
dCBjZWxsIGlzDQo+ID4gPiA+ICsgICAgICBhIHBoYW5kbGUgdG8gdGhlIG1haW4gSVBNTVUgYW5k
IHRoZSBzZWNvbmQgY2VsbCBpcyB0aGUgaW50ZXJydXB0IGJpdA0KPiA+ID4gPiArICAgICAgbnVt
YmVyIGFzc29jaWF0ZWQgd2l0aCB0aGUgcGFydGljdWxhciBjYWNoZSBJUE1NVSBkZXZpY2UuIFRo
ZSBpbnRlcnJ1cHQNCj4gPiA+ID4gKyAgICAgIGJpdCBudW1iZXIgbmVlZHMgdG8gbWF0Y2ggdGhl
IG1haW4gSVBNTVUgSU1TU1RSIHJlZ2lzdGVyLiBPbmx5IHVzZWQgYnkNCj4gPiA+ID4gKyAgICAg
IGNhY2hlIElQTU1VIGluc3RhbmNlcy4NCj4gPiA+DQo+ID4gPiBUaGlzIHByb3BlcnR5IGlzIG5v
dCB2YWxpZCBvbmx5IG9uIFItQ2FyIEdlbjIgYW5kIFItTW9iaWxlIEFQRTYuDQo+ID4NCj4gPiBU
aGF0IHNvdW5kcyBnb29kLiBCdXQsIHNpbmNlIGlwbW11X21tIG9uIFItQ2FyIEdlbjMgYWxzbyBp
cyBub3QgdmFsaWQsDQo+ID4gd2UgY2Fubm90IHVzZSBjb21wYXRpYmxlIHByb3BlcnR5IGZvciBk
ZXRlY3RpbmcgaXQuDQo+IA0KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5ICJpcG1tdV9tbSBpcyBub3Qg
dmFsaWQiPw0KDQpJIGp1c3Qgd2FudGVkIHRvIHNheSB0aGF0IGlwbW11X21tIG5vZGUgb24gUi1D
YXIgR2VuMyBjYW5ub3QgaGF2ZQ0KdGhpcyByZW5lc2FzLGlwbW11LW1haW4gcHJvcGVydHkuDQoN
Cj4gPiBIb3dldmVyLCBJIHJlYWxpemVkIHJlbmVzYXMsaXBtbXUtbWFpbiBpcyBvbmx5IHVzZWQg
YnkgImNhY2hlIElQTU1VIg0KPiA+IGFuZCAiY2FjaGUgSVBNTVUiIGRvZXNuJ3QgaGF2ZSBpbnRl
cnJ1cHRzIHByb3BlcnR5LiBTbywNCj4gPiBJIGRlc2NyaWJlZCB0aGUgZm9sbG93aW5nIHNjaGVt
YSBhbmQgdGhlbiBpdCBzZWVtcyBzdWNjZXNzLg0KPiA+IC0tDQo+ID4gaWY6DQo+ID4gICBwcm9w
ZXJ0aWVzOg0KPiA+ICAgICBpbnRlcnJ1cHRzOiBmYWxzZQ0KPiA+IHRoZW46DQo+ID4gICByZXF1
aXJlZDoNCj4gPiAgICAgLSByZW5lc2FzLGlwbW11LW1haW4NCj4gDQo+IEJ1dCBhbGwgb3RoZXIg
bm9kZXMgc2hvdWxkIGhhdmUgaW50ZXJydXB0cyBwcm9wZXJ0aWVzLCByaWdodD8NCg0KWWVzLCB0
aGF0J3MgcmlnaHQuDQoNCj4gU28gdGhleSBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlOg0KPiANCj4g
ICBvbmVPZjoNCj4gICAgICAtIHJlcXVpcmVkOg0KPiAgICAgICAgICAtIGludGVycnVwdHMNCj4g
ICAgIC0gcmVxdWlyZWQ6DQo+ICAgICAgICAgLSByZW5lc2FzLGlwbW11LW1haW4NCg0KVGhhbmsg
eW91ISBOb3cgSSB1bmRlcnN0b29kIGl0IGFuZCBzdWNoIHRoZSBzY2hlbWEgaXMgYmV0dGVyIHRo
YW4gbWluZS4NCkknbGwgZml4IGl0Lg0KDQo+ID4gRXNwZWNpYWxseSwgSSBjb3VsZCBmaW5kIG1p
c3NpbmcgcmVuZXNhcyxpcG1tdS1tYWluIHByb3BlcnR5IG9uIHI4YTc3OTgwLmR0c2kNCj4gPiBs
aWtlIGJlbG93IDopICBTbywgSSdsbCBtYWtlIGFuZCBzdWJtaXQgYSBmaXhpbmcgcjhhNzc5ODAu
ZHRzaSBwYXRjaCBsYXRlciAobWF5YmUgdG9tb3Jyb3cpLg0KPiANCj4gR29vZCEgOy0pDQoNCjop
DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gR3J7b2V0amUsZWV0aW5n
fXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMNCg==
