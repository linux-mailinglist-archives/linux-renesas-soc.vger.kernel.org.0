Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE5A9194F24
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2020 03:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbgC0Cjk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 22:39:40 -0400
Received: from mail-eopbgr1410090.outbound.protection.outlook.com ([40.107.141.90]:12699
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726496AbgC0Cjk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 22:39:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iwl7whGO/kaEJQX5/oLMbHjz0EULr1/3OKofmc1Lt1PB+Xee/bNixShlMQk+vk9AUi0C5yL7DBhHvQko6fthuUp45LWG8K49j/3Vf/JLDP6PsHWRB9Tz03kJHOC7GQEANaIuhpxY3XXtvgsfUynUxUXhjUfrAA5EwFel26iWfub5vMWwzqqIKuj1Mbdxd8/dg0i5Hgpd1ocw4lbDzvfgv5joFEF37LxRkAjVlXkA85I+osDX1EBhemD8KPPTzHE4l4fXX1QAL9A6eoqRm1lqv2QcV5g/uUdu+bt7xH8Mlg8bzWxdi0GbwYKb9PVF64ZnkHyeDFOiKkqnu104cEJ4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPuOOFNuHe8wRMJHqaH6xr5W0uoFqZQE9iQ//QoHrh0=;
 b=a8HezO2oy4Z8t6zggOlFYBQE1TWzHwDU/jwUTI15JZHPVseFhgeMDd3I9JmmCSNk4u8hFYbpvY/VmNChgYeommdrsBMr5khb41eHsez5KdPE6a+GAm0VSpx0JQ/aWd59w8q3G8tGxhHH2E6w6Vlk6hMLgF4mCXgqSQhhEyMmXVpTCtZHBkRiQ5RTllJGT6bb91ApGYKS4iH0pgjf6wQBkowTa8ZZQBX+Xdh4abyinXRIMmBF1YenOoZowF7DlEG+lZVqYs0tsdNS+TqvlU5h7+xYh8WeU7SqGUvmnMBjPDkdWdKUeo0RP0i+D07IxdUrICSvtMwC24jW6+0eKxWxhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPuOOFNuHe8wRMJHqaH6xr5W0uoFqZQE9iQ//QoHrh0=;
 b=qJEmh/SwnLD2YhufeAEeJOeGafzh+ivE6XpZCPyD0RTfDiuuugAdTuN2AyP+u/580UI9exU9rCz3xsWuZRRJQZ+koQULLoK7RHg5HUIgUhKvvH2IRNxGfRTysFY01Ir3UyIVFDdXVYI3PbiUcd3zBy7nIgJP+FwZSGBufGm9z3c=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2735.jpnprd01.prod.outlook.com (20.177.101.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Fri, 27 Mar 2020 02:39:35 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 02:39:35 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 3/4] dt-bindings: phy: renesas: usb3-phy: convert
 bindings to json-schema
Thread-Topic: [PATCH v2 3/4] dt-bindings: phy: renesas: usb3-phy: convert
 bindings to json-schema
Thread-Index: AQHWAy+Fjgxp9Oc5L0CzZTnYZ98xZ6hakX4AgAEobYA=
Date:   Fri, 27 Mar 2020 02:39:35 +0000
Message-ID: <TYAPR01MB454422247D0D1AF062625803D8CC0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1585200559-30033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585200559-30033-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXe6GjjQDCjGAE=GfkEYkBZjqj4PNNB+Sp_NOtYXx8ZTA@mail.gmail.com>
In-Reply-To: <CAMuHMdXe6GjjQDCjGAE=GfkEYkBZjqj4PNNB+Sp_NOtYXx8ZTA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.148]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: db86a345-a5cd-4b80-b0a4-08d7d1f81695
x-ms-traffictypediagnostic: TYAPR01MB2735:
x-microsoft-antispam-prvs: <TYAPR01MB273587801000EC82435A2E58D8CC0@TYAPR01MB2735.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(8936002)(81166006)(6916009)(81156014)(86362001)(4326008)(5660300002)(8676002)(478600001)(966005)(66446008)(55016002)(64756008)(52536014)(66556008)(9686003)(66476007)(66946007)(76116006)(6506007)(7696005)(186003)(33656002)(54906003)(26005)(2906002)(316002)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2735;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mEmm8Adsa77VQX2geKoSknHB5yxLRc45kZrRu7ZBY2DEJCYvfZUkw5E+lpL9boVtGI0f0vcqimDSUgAARfl8DLH4q34QnvUWwUYxEdp8t8xUakulnjLbb8x/7EBf/ttF6GSJ7M5DbPM4Hil4YRRGPXTlHlwRNaccIrCTpXCVvZRcJ4wyGNEREWnuI3LINQ80Qa/QaLSI7SupzdNhKnmgErlfJiPnhjMcCHDugEUy4JgqQUXiOZrlUNMnHLzb/S1Z9Co+73PmOANX+OvNtCir8oaxcKfwIFJDPmXqXyn6z2LBqkEqO+BjCgwiTNJ35W1G1FHdl2YC/lwD9mDyom4bi++PCPN7bwyq4+LATxgNRPw5rWaYH7sjV5w+XeHKo2xjYIitfxM1qdNzg7TEOMppcMqnTSD0Vm4gVLVEZdKMd9VqNfL9aosdzrQsFUrDNwXm6Cu9E0kp+WD+HsSI33MOyjOVzKlTfcJ+VU7wQkIDkZM4OwCky3d8iJ51rVvyTwNNbzItppgaICd5JW1jDnY3LQ==
x-ms-exchange-antispam-messagedata: WJCSv4dP7mRYDPema8T4bzmsonIiGO4RQ4RF9hSYnIIqV4buugBKA41vyxLl6FOTaXNVr+SCe/WYkl/blqIL/meKiZpKpGre6+45E8rWcQzXuTiyQDcIN5KgINNGOSxUI2cgUQRZ29M25A+ayTjWxg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db86a345-a5cd-4b80-b0a4-08d7d1f81695
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 02:39:35.5828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Grj9niSRxP1b24I8gBqUVbDrI7Ap5lXf21XUZMEzvfa1Dp+dmU9+VBspLTktvr2NNoIxcHr2SSW29fuK96pDIXy+eRtl6FUBeulFaHxxSo35NeAc3sCCgKQ5If9nFHDA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2735
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyNiwgMjAyMCA1OjUzIFBNDQo8
c25pcD4NCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BoeS9yZW5lc2FzLHVzYjMtcGh5LnlhbWwNCj4gPiBAQCAtMCwwICsxLDc4
IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiANCj4g
SW4gdGhpbmsgUm9iIHdvdWxkIHByZWZlcg0KPiANCj4gICAgICMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KDQpJIGdvdCBpdC4NCg0KPiA+
ICslWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvcGh5L3JlbmVzYXMsdXNiMy1waHkueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTog
UmVuZXNhcyBSLUNhciBnZW5lcmF0aW9uIDMgVVNCIDMuMCBQSFkNCj4gPiArDQo+ID4gK21haW50
YWluZXJzOg0KPiA+ICsgIC0gWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVo
QHJlbmVzYXMuY29tPg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxl
Og0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgIC0g
cmVuZXNhcyxyOGE3NzRhMS11c2IzLXBoeSAjIFJaL0cyTQ0KPiA+ICsgICAgICAgICAgLSByZW5l
c2FzLHI4YTc3NGIxLXVzYjMtcGh5ICMgUlovRzJODQo+ID4gKyAgICAgICAgICAtIHJlbmVzYXMs
cjhhNzc5NS11c2IzLXBoeSAgIyBSLUNhciBIMw0KPiA+ICsgICAgICAgICAgLSByZW5lc2FzLHI4
YTc3OTYtdXNiMy1waHkgICMgUi1DYXIgTTMtVw0KPiA+ICsgICAgICAgICAgLSByZW5lc2FzLHI4
YTc3OTY1LXVzYjMtcGh5ICMgUi1DYXIgTTMtTg0KPiA+ICsgICAgICAtIGNvbnN0OiByZW5lc2Fz
LHJjYXItZ2VuMy11c2IzLXBoeQ0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICAjIGJhc2Ug
YWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSByZWdpc3RlcnMgYmxvY2sgZm9yIHRoZSBQSFkuDQo+
IA0KPiBJIHRoaW5rIHRoaXMgY29tbWVudCBjYW4gYmUgcmVtb3ZlZC4NCg0KSSB0aGluayBzby4g
U28sIEknbGwgcmVtb3ZlIGl0Lg0KDQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiAr
ICBjbG9ja3M6DQo+ID4gKyAgICAjIEEgbGlzdCBvZiBwaGFuZGxlcyBhbmQgY2xvY2stc3BlY2lm
aWVyIHBhaXJzLg0KPiANCj4gTGlrZXdpc2UuDQoNClllcywgSSdsbCByZW1vdmUgaXQuDQoNCj4g
Im1pbkl0ZW1zOiAyIj8NCg0KVGhhbmsgeW91IGZvciBwb2ludGVkIGl0IG91dC4gWWVzLCB0aGlz
IHNob3VsZCBoYXZlICJtaW5JdGVtczogMiIuDQoNCj4gPiArICAgIG1heEl0ZW1zOiAzDQo+ID4g
Kw0KPiA+ICsgIGNsb2NrLW5hbWVzOg0KPiA+ICsgICAgIyBJZiB5b3Ugd2FudCB0byB1c2UgdGhl
IHNzYywgdGhlIGNsb2NrLWZyZXF1ZW5jeSBvZiB1c2JfZXh0YWwNCj4gPiArICAgICMgbXVzdCBu
b3QgYmUgMC4NCj4gDQo+ICJtaW5JdGVtczogMiI/DQoNClllcywgSSdsbCBhZGQgaXQuDQoNCj4g
PiArICAgIG1heEl0ZW1zOiAzDQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25zdDog
dXNiMy1pZiAjIFRoZSBmdW5jaW9uYWwgY2xvY2sNCj4gPiArICAgICAgLSBjb25zdDogdXNiM3Nf
Y2xrICMgVGhlIHVzYjMncyBleHRlcm5hbCBjbG9jaw0KPiA+ICsgICAgICAtIGNvbnN0OiB1c2Jf
ZXh0YWwgIyBUaGUgdXNiMidzIGV4dGVybmFsIGNsb2NrDQo+ID4gKw0KPiA+ICsgICcjcGh5LWNl
bGxzJzoNCj4gPiArICAgICMgc2VlIHBoeS1iaW5kaW5ncy50eHQgaW4gdGhlIHNhbWUgZGlyZWN0
b3J5DQo+ID4gKyAgICBjb25zdDogMA0KPiA+ICsNCj4gPiArICBwb3dlci1kb21haW5zOg0KPiA+
ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgcmVzZXRzOg0KPiA+ICsgICAgbWF4SXRl
bXM6IDENCj4gPiArDQo+ID4gKyAgcmVuZXNhcyxzc2MtcmFuZ2U6DQo+ID4gKyAgICBkZXNjcmlw
dGlvbjogfA0KPiA+ICsgICAgICBFbmFibGUvZGlzYWJsZSBzcHJlYWQgc3BlY3RydW0gY2xvY2sg
KHNzYykuIDAgb3IgdGhlIHByb3BlcnR5IGRvZXNuJ3QNCj4gPiArICAgICAgZXhpc3QgbWVhbnMg
ZGlzYWJsaWluZyB0aGUgc3NjLg0KPiANCj4gZGlzYWJsaW5nDQoNCk9vcHMsIEknbGwgZml4IGl0
Lg0KDQo+IFRoZSBhY3R1YWwgdmFsdWUgd2lsbCBiZSAtPHZhbHVlPiBwcG0uDQoNClllcywgdGhh
dCdzIHJpZ2h0LiBTbywgSSdsbCBhZGQgdGhpcyBzZW50ZW5jZS4NCg0KPiA+ICsgICAgYWxsT2Y6
DQo+ID4gKyAgICAgIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWlu
dDMyDQo+ID4gKyAgICAgIC0gZW51bTogWyAwLCA0MDAzLCA0NDkyLCA0OTgwIF0NCj4gPiArDQo+
ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAg
LSBjbG9ja3MNCj4gPiArICAtIGNsb2NrLW5hbWVzDQo+ID4gKyAgLSAnI3BoeS1jZWxscycNCj4g
PiArDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBs
ZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svcjhh
Nzc5NS1jcGctbXNzci5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL3I4
YTc3OTUtc3lzYy5oPg0KPiA+ICsNCj4gPiArICAgIHVzYi1waHlAZTY1ZWUwMDAgew0KPiA+ICsg
ICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk1LXVzYjMtcGh5IiwgInJlbmVzYXMs
cmNhci1nZW4zLXVzYjMtcGh5IjsNCj4gPiArICAgICAgICByZWcgPSA8MCAweGU2NWVlMDAwIDAg
MHg5MD47DQo+IA0KPiBFeGFtcGxlcyB1c2UgdGhlIGRlZmF1bHQgI3thZGRyZXNzLHNpemV9LWNl
bGxzIG9mIDwxPiwgc28NCj4gDQo+ICAgICByZWcgPSA8MHhlNjVlZTAwMCAweDkwPjsNCg0KT2gs
IEkgZGlkbid0IGtub3cuIEknbGwgZml4IGl0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8g
U2hpbW9kYQ0KDQo=
