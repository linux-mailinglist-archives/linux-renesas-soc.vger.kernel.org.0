Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22777402450
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Sep 2021 09:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237019AbhIGHaO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Sep 2021 03:30:14 -0400
Received: from mail-eopbgr1300131.outbound.protection.outlook.com ([40.107.130.131]:51441
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236858AbhIGHaC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 03:30:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed7Xev0Jizri5M5DUuKbPyNCFAiSOO+SOs3hZfPyd/rXUsHSkq0z8nvi32kR5e2gjzLpp6fNbMgQUIxXkYGvvqUt9z+YbZVJ2uQRPE/4kdEss3qoI0IjpplOt9Qs0r4uOIGKqbRJGzWN1xiecrsHmUlnmprPNDW4Jno6wCR0bPL3ltVaJ3ByaSJaR5ie4G6T1T9/ZkzWeZ9EhlS3FA1D0eL+UdrT19dJomoQxNLjhGa3BTl+FNP9QVwJSBYb40S/sNYnyNDzmgwGw6z1aVqXUCsxryZyaPrEpYw3AKiU2JKKtH/zpsSxl6ooBt3NBrYQVI9jSUQ/w6YAZqi/TUOinA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6+Cy2MB0039rXf3Q/K+tjH/P/o5Ht7H+bIoDd7azmQs=;
 b=SOmFThBatbTeFW0scqan8CvCLWU8zWzW1lJfV0P6Tj6toXHeO+RnEtJmPnTWTP3MzsboWTIDbwvbwvcvVGJFSJcZq+Qc7O0u9W0Ec1MQho3SdAcOEGNkfRU435H432mLt9Ec6Juv0Kt0Ch+5ffFgxWqbpQuCzRAX36Ow1wC9df0Ra8A77WdionswI2lyavXLR8U3Ok5Hlzh35HyBMmTtH19SHWwJCEhJBdlH9LzPuOW55/cCIWXCn51leBh3Izzwe3gP00EUgqaCoI7ycDWwc5MpJVEPozEtuc4G5p6MlzIX9CmEHbnSXnzksGOhbm6C80TDL5v8O6dP2cfOeV3kwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+Cy2MB0039rXf3Q/K+tjH/P/o5Ht7H+bIoDd7azmQs=;
 b=W+LaepwNBv1yAGuLe93AMwvRn+AKfWOcSO0ZQwad7+GGr3cnEPDxabajXYRGNd3+sPtvUrWJETr4ewDtauNiVO45Bp5kZajs4fVCkUxnUXanFeNF35NbhPWQbKJLrLsOw1fByXmiFGkDOSQn6PuNdO2cOpCYNpGInB0w7YzuBO4=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2572.jpnprd01.prod.outlook.com (2603:1096:404:7a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Tue, 7 Sep
 2021 07:28:52 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b10a:f267:d52c:1e5b]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b10a:f267:d52c:1e5b%3]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 07:28:52 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for r8a779a0
Thread-Topic: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for r8a779a0
Thread-Index: AQHXnxvyoah/Riy0106C9EDQXIK2f6uXKuaAgACM7RCAAG6YAIAADYEw
Date:   Tue, 7 Sep 2021 07:28:51 +0000
Message-ID: <TY2PR01MB36929B7C850349E2FA9E547BD8D39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
 <20210901102705.556093-3-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXwf0_+VKfuiFQf6roZErz-JAm06P5RBzD-Jwm1uk=p9A@mail.gmail.com>
 <TY2PR01MB36928CB43B188D4082829A1FD8D39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdVmkJqiK3XB3s_ibnqy9SUSUFW6mny+kefOYaWi9Ce-4g@mail.gmail.com>
In-Reply-To: <CAMuHMdVmkJqiK3XB3s_ibnqy9SUSUFW6mny+kefOYaWi9Ce-4g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aefbcf26-3ed1-47a7-9c62-08d971d1244f
x-ms-traffictypediagnostic: TY2PR01MB2572:
x-microsoft-antispam-prvs: <TY2PR01MB25726D32B2FBA45BD29AC945D8D39@TY2PR01MB2572.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 75ypaK8Bsv2j1YkEQozPLaY9dxGDpD30Wz93/08Ezs3OwZRxL8fSvd4P5kbFsrNFfOAoCiBfGpB6919tiupWxgdbXJVIzo2vpHixsyANaSqF/dSIaaPIhToVRzMYBMEE9j9CMNImvRja9zvfHpVI1GymR/u0NpYLhT6qgy8ML4jutk37azjlNINDp1QTy7c8g0Bd1sk2+L4TGIe4xBR48iWuQn4JGj8RXcldCvuldfpqY1FWUs094O/J3onX+3GOnileS420BRT2N/XInNh6G2EqzjC4Ge5kOFnJuodjCZ/0WFVVCYOoA80GniQHeeY1WWaCz8Q+XvVyeMUiBDlBsKEm212NjC7rY8DWW/jTFXzg1lS/aKFaW3GAJs5HvO3WUDaHBqibd6La5M32m3g4oXn4Xtf6T6B20trUCF0XfPpHJUZzjDae0UZk1v55vcTHtlYqVRaUdI+15C4jwtJiFr9QWVK+jgeuLKWVi6kBrwT+q7yVQSYm+QDCfaLWE5w8wRV5k2nPOFbHJl9cw7/64yLwXl4AyuLCOS1boetOOHt7w1+tvwHyMiluHsU/bzTRtuxqjjWEEeFqQFzqr0lwDSswAQP6oE7uN1cCu2dQMCVZ4oMtcI7QrEUrmCzLny+AxDstgzw/IVVSGLpOF8sy87isElfyEl0KUO6rhtrX1AgSXeKfhhDVng1dNjJ+LekD/J4P0ixfZUvzlJatktcWfoya8CTrZzjR3aNa7ez5bH8qcP3380KRjiueMf71T/msMxUXuBB1Dpq3rbki+2hqGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(38100700002)(38070700005)(86362001)(53546011)(4326008)(55016002)(122000001)(6506007)(8936002)(478600001)(2906002)(66476007)(66446008)(26005)(5660300002)(52536014)(66556008)(64756008)(76116006)(71200400001)(54906003)(316002)(7696005)(186003)(9686003)(55236004)(33656002)(83380400001)(8676002)(66946007)(6916009)(138113003)(98903001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFY2R1R6QkRWYVVjYUQ5TVd5WlM0SWFwajliZDlpR1U5MmJTNWFuMFZiRWt1?=
 =?utf-8?B?VHJPQ2dvM0pIdGVyVXZSRUdkM3dCZnhqUnNyUkxBcU1zYXdJd0U4ZG1SQlhv?=
 =?utf-8?B?cll1Ti9peHhtVThZL1BwZ2k3eHRQRkE2OGlUdStyd3p1VTBOWXcwUDFXaXFU?=
 =?utf-8?B?L1p6dUJvQm5nSGp4WmRoMVpIdWVsLzk2djFoZ0xacjZ0V3RsSzU0bEZveXhl?=
 =?utf-8?B?MnVoTHVnNnNpazZPOVNPV1VHRWc1czFLSnE3aHRMb1pjVER1N3VxQnM1SVNJ?=
 =?utf-8?B?b0hEVWl0TC9xc0loUEZqQmlZVVY5Zis5aUducldqaWxySDBMazVPVzVqbHlh?=
 =?utf-8?B?RzJTSWhyT1ZPdGt4aE5hNnVjQmFMQTBqU2xtWGJybTZxQjNJSUlCbG4wTjRI?=
 =?utf-8?B?RnIvdzk5bHZabWJ5bnRLbExrQlBqYzkwMHNUcHNFSUFUcjZtdjVXd3VNOWxV?=
 =?utf-8?B?Y1U4VXdpZGpuMFFDbUl6eXg1aDdRZ25aSEsvWFk5dW9oUmIvUjhTVmQyUUpF?=
 =?utf-8?B?VWg2UTZjbjJWQkJxS2tLeUlZZHhqei9aaFo1TFZoRlEyL3l3M0oxMmlLbnZn?=
 =?utf-8?B?aHN3eFZYL20rL1pmTG1QZ05tN09RcmEyMnViR1BaaWdIK3BtK3pFZGJpWnpa?=
 =?utf-8?B?dEd2R0tHNlFtRGZuTGltdUFQR24wZXdRck1XUURneG1PUmxZUnFKQkRTRzFM?=
 =?utf-8?B?a0Z6R3ljSmxmM0RSbVU1bDd3TmtsTDlidjJYQlhWQjVMTWQ3QzVhR2ptcnJY?=
 =?utf-8?B?bDl1K1ZIK20vdE1naTFkbTZvVFhpODZTVFg1cW5PckN0TVhzdXloYmZ2Mlo0?=
 =?utf-8?B?WVVScGlQMGFRQlZQcDZwbzFMdDlSTUtLSm9ITFFjMzIzdisyalpFVll6RnpG?=
 =?utf-8?B?UGMvRHh4RExZa0JpUThldjRNMlRvTTh6ZTlaZFMxRFE2RVIxd0Y1aUQ3aklr?=
 =?utf-8?B?cGpiZW1Scytzb2ZmM3RDdDJkMG5qTnVxR3BjMkpnRElpT0tISjNUR0VGNlh5?=
 =?utf-8?B?SUJHTzVxSm1USWI4T01NcDFrdXozbGR5cHNYdTZIUDhnblM1Y3VWV2QvdXpL?=
 =?utf-8?B?QURZZ0JETWFxVkdHVXFZT21qbHJUejd5QzdteHpDMUZ1emtiajJ5SW4vWVJ0?=
 =?utf-8?B?WFBsRUh3YVRvdnFsNy9ZTHhFZVVYNjIyZFI0dVduTXQ1a05Ya2V4dU0zODAz?=
 =?utf-8?B?Y2VrOGFjZHBRUVRNZmFZek5qazFjREQxRkU3YUJ1V1Q2L2pHMkpzK0FwSElV?=
 =?utf-8?B?VTdhbWFDMEZCVmhSRnl5eEE3bWZLUUlmc0ZWOG80aXR6MlgvdkRmNy9Ld1g1?=
 =?utf-8?B?bldzUmJ1d0FoY0lleHBuK3dNYzkvaWlOazYybUtia0E2alNPSWpTVldlTGFL?=
 =?utf-8?B?MVhUSXRnZndaUE16MVBZeHdKOUtjOUdaK2FYdlN2TkdoS2p3ZVcremk2ZGFT?=
 =?utf-8?B?Q25FZStkbzlaYmVLSmtqWCt4SnpPVEJTY09KNW8rT1QyT0hReXluMm1Uc1Fo?=
 =?utf-8?B?Vmx1cVhEVXd1R2FNYm1xeTBBdFJxNkVUZk9JSkxwaGpUaEdYK09xcFNLU2d2?=
 =?utf-8?B?cjRQKzZac0FRZHdDMWw5QldLSXBDdk8xTC90Q0h4QWRRQ1JORlJJeHNpZDhH?=
 =?utf-8?B?Y3c5NEFrc3dubHBiemdHdDJITzU1QjlwaGlaL01Nc2FjWGJjN0tlblNUMzRy?=
 =?utf-8?B?b2dPNTNTYWF1UlZqdTFaVG9tWVVzTlFvNEd2bk9QV01adTNmQnc1dmxmTjI4?=
 =?utf-8?Q?JMcwtYxaslfHc6LYAMuE8DElE8RCK0beBZH3zCA?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aefbcf26-3ed1-47a7-9c62-08d971d1244f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 07:28:51.9677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FzVnB3Zr39STKVdwei+czx7w7vn35Ir8MIUSRCmn3XBtOASCUzJNVzwAEfmwKUm4vZxSjbQC90JrF9LFhSuNrLDDqkUd6uBbETpPnHFxXbC8TAUWFdl6AfrDCH0Eoh5b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2572
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgU2VwdGVtYmVyIDcsIDIwMjEgMzozNCBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBPbiBUdWUsIFNlcCA3LCAyMDIxIGF0IDI6MDIgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0
IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDcsIDIwMjEgMTI6MzQgQU0N
Cj4gPiA+IE9uIFdlZCwgU2VwIDEsIDIwMjEgYXQgMTI6MjcgUE0gWW9zaGloaXJvIFNoaW1vZGEN
Cj4gPiA+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+
IEFkZCBzdXBwb3J0IGZvciByOGE3NzlhMCAoUi1DYXIgVjNVKS4gVGhlIElQTU1VIGhhcmR3YXJl
IGRlc2lnbg0KPiA+ID4gPiBvZiB0aGlzIFNvQyBkaWZmZXJzIHRoYW4gb3RoZXJzLiBTbywgYWRk
IGEgbmV3IGlwbW11X2ZlYXR1cmVzIGZvciBpdC4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29t
Pg0KPiA+ID4NCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9pcG1tdS12bXNhLmMNCj4gPiA+
ID4gKysrIGIvZHJpdmVycy9pb21tdS9pcG1tdS12bXNhLmMNCj4gPiA+DQo+ID4gPiA+IEBAIC05
MjIsNiArOTIyLDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaXBtbXVfZmVhdHVyZXMgaXBtbXVf
ZmVhdHVyZXNfcmNhcl9nZW4zID0gew0KPiA+ID4gPiAgICAgICAgIC51dGxiX29mZnNldF9iYXNl
ID0gMCwNCj4gPiA+ID4gIH07DQo+ID4gPiA+DQo+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGlwbW11X2ZlYXR1cmVzIGlwbW11X2ZlYXR1cmVzX3I4YTc3OWEwID0gew0KPiA+ID4gPiArICAg
ICAgIC51c2VfbnNfYWxpYXNfb2Zmc2V0ID0gZmFsc2UsDQo+ID4gPiA+ICsgICAgICAgLmhhc19j
YWNoZV9sZWFmX25vZGVzID0gdHJ1ZSwNCj4gPiA+ID4gKyAgICAgICAubnVtYmVyX29mX2NvbnRl
eHRzID0gOCwNCj4gPiA+DQo+ID4gPiBTaG91bGRuJ3QgdGhpcyBiZSAxNj8NCj4gPiA+IE9yIGRv
IHlvdSBwbGFuIHRvIGFkZCBzdXBwb3J0IGZvciBtb3JlIHRoYW4gOCBjb250ZXh0cyBsYXRlciwg
YXMgdGhhdA0KPiA+ID4gd291bGQgcmVxdWlyZSBpbmNyZWFzaW5nIElQTU1VX0NUWF9NQVgsIGFu
ZCB1cGRhdGluZyBpcG1tdV9jdHhfcmVnKCkNCj4gPiA+IHRvIGhhbmRsZSB0aGUgc2Vjb25kIGJh
bmsgb2YgOCBjb250ZXh0cz8NCj4gPg0KPiA+IEkgd291bGQgbGlrZSB0byBhZGQgc3VwcG9ydCBm
b3IgbW9yZSB0aGFuIDggY29udGV4dHMgbGF0ZXIgYmVjYXVzZQ0KPiA+IEkgcmVhbGl6ZWQgdGhh
dCBjdHhfb2Zmc2V0X3tiYXNlLHN0cmlkZX0gYXJlIG5vdCBzdWl0YWJsZSBmb3IgdGhlIHNlY29u
ZCBiYW5rDQo+ID4gb2YgOCBjb250ZXh0cy4uLg0KPiANCj4gV291bGRuJ3Qgc29tZXRoaW5nIGxp
a2UgYmVsb3cgYmUgc3VmZmljaWVudD8NCg0KVGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24h
DQoNCj4gIHN0YXRpYyB1bnNpZ25lZCBpbnQgaXBtbXVfY3R4X3JlZyhzdHJ1Y3QgaXBtbXVfdm1z
YV9kZXZpY2UgKm1tdSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBjb250ZXh0X2lkLCB1bnNpZ25lZCBpbnQgcmVnKQ0KPiAgew0KPiAtICAgICAgIHJl
dHVybiBtbXUtPmZlYXR1cmVzLT5jdHhfb2Zmc2V0X2Jhc2UgKw0KPiAtICAgICAgICAgICAgICBj
b250ZXh0X2lkICogbW11LT5mZWF0dXJlcy0+Y3R4X29mZnNldF9zdHJpZGUgKyByZWc7DQo+ICsg
ICAgICAgdW5zaWduZWQgaW50IGJhc2UgPSBtbXUtPmZlYXR1cmVzLT5jdHhfb2Zmc2V0X2Jhc2U7
DQo+ICsNCj4gKyAgICAgICBpZiAoY29udGV4dF9pZCA+IDcpDQo+ICsgICAgICAgICAgICAgICBi
YXNlICs9IDB4ODAwIC0gOCAqIDB4MTA0MDsNCg0KVGhpcyBzaG91bGQgYmUgImJhc2UgKz0gMHg4
MDAgLSA4ICogMHg0MDsiIGJlY2F1c2UgdGhlIDh0aCBjb250ZXh0IGFkZHJlc3MgaXMNCjB4MTg4
MDAsIG5vdCAweDEwODAwLg0KDQpJJ2xsIHNlbmQgdjIgcGF0Y2ggdG8gc3VwcG9ydCAxNiBjb250
ZXh0cy4NCihJJ2xsIGNoYW5nZSBJUE1NVV9DVFhfTUFYIHRvIDE2IHRvby4pDQoNCkJlc3QgcmVn
YXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gKw0KPiArICAgICAgIHJldHVybiBiYXNlICsg
Y29udGV4dF9pZCAqIG1tdS0+ZmVhdHVyZXMtPmN0eF9vZmZzZXRfc3RyaWRlICsgcmVnOw0KPiAg
fQ0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
