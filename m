Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E600220C0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 13:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgGOLmQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 07:42:16 -0400
Received: from mail-eopbgr1300120.outbound.protection.outlook.com ([40.107.130.120]:42336
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725852AbgGOLmQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 07:42:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSnJO6gXd2dWM9Wzu6uDsgQmXDFnL1vUq5u7fjaOcccSSnWHIKXmpQvDSDGFZAnIeRrwvdssZGPzbPnK1lajOaeeRsdAgpB1KNIWEh2H15ErDq1LCPPlkkAUZfJPl1hyTWdb2LchMFMwRXKfEer0qlKDV406o0PzXrvOHTwd+sZasyyIRhkm8sdcZo6BNOxqDraGVxmxM1jOPeZawk8k7053FH7SNTcl7vffh0bzrY2SevwcfBAKyQz0Bl86DTKSO5so0oGCUZhBrG3zUmalQkG+YGFKhfM2ABtgvTeWsN+vVj2BQ3lXPao5d6Wuzr5seQuvungpGzhIVZ1t4/qRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVm+Q1WT9OcpNaDftPas+sN7N8h/WkmsGf7kp61Rhl8=;
 b=iUteuTtm1RHPUun07/mGwbf+jrBhMVbV5thE6rsLa2KUjhJv2WUeJSG6/gCOv6Il+Mz5GkB3XQCx6vHlk3PMsy0cBYsJ7HqvHSQkjKnlCUWUFZtyKaBcxTf5wBKmLlpRX5KdkWlxm5mpvNUMrvYwAyhoKriyQkhVUR+uFvkO0EOXUC5vGayNoLLrf+pCtNaE3cxUYc1oZ5lvpkyY27xfO6LCCuKyBq7Z98vC4CJRjt2qc8K9Y2veuazbOxnMa1HKBE/qhUcQslRKNQZa583b4MB50LBulWy2WQ1PbomEAjdwix77CyvNeWhc0Vf0L1qNdslVXUn+RDELiUP83skn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVm+Q1WT9OcpNaDftPas+sN7N8h/WkmsGf7kp61Rhl8=;
 b=AARaxI3OW9BuRm2TjQqm8VG3Nc/Y4oDAtqJFFeY/JdPKBXFQVBN/sn7OsMoSf6UTNBMOdxjP73pi59Y74HnaeaLSM2jD6O1DnX3tyrTe4sEQ6JBpHNW2a0fV8U7Awm47/MgOfLsXOChorNoK3i4MXWmAh9I5GHKSW28Wz3OB5bA=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB2442.jpnprd01.prod.outlook.com
 (2603:1096:404:6c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Wed, 15 Jul
 2020 11:42:09 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::590e:ebc:1f09:f160]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::590e:ebc:1f09:f160%7]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 11:42:09 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH RESEND v7 1/3] dt-bindings: usb: hd3ss3220 device tree
 binding document
Thread-Topic: [PATCH RESEND v7 1/3] dt-bindings: usb: hd3ss3220 device tree
 binding document
Thread-Index: AQHWWoQQj5gHyWjIjUamnTme2smMf6kIXN1w
Date:   Wed, 15 Jul 2020 11:42:09 +0000
Message-ID: <TYBPR01MB5309C98CD8BD3706394E4784867E0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
 <1567584941-13690-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVZkjGDFmeQ9XkOqq-ogfSZz99hd0=N-OYLai4UEzKwAQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVZkjGDFmeQ9XkOqq-ogfSZz99hd0=N-OYLai4UEzKwAQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.163.223.41]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b294927f-457c-4dda-617e-08d828b41b8c
x-ms-traffictypediagnostic: TY2PR01MB2442:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB24424ACA1229CF795641866B867E0@TY2PR01MB2442.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L7ClpkaTFwna+h6gHX+/oDrHLdnrRmEYmeiTy1PkSbJkwbWqGAUR/Axi7tKxIFik6g0Z4kx0lp1BXbEUOoQtUBK9XFFKRt4TWhr9M4HQ8nTSLWlZ9HIalmcfZgNH2zVR4BmaWMYCYoCJpcUNsrGuzH8W37T7KRFrqHfCwr64/R70a/Igc79zUEyDbCYxHZ8GbIbA6xi8ZVhuCGMrB3vN3TzRJWnfQ/LYIUaYqmcbyu3eipIJkeFj0eD/HYosxvQ1w7nBpfZ8pZ4GDaaEyDBOHEubGntyP4bILeTjMWUGgTNHkRRAn0Glnfh8N2pHmgDk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(86362001)(33656002)(64756008)(76116006)(316002)(66946007)(71200400001)(110136005)(5660300002)(7416002)(52536014)(478600001)(66446008)(66476007)(54906003)(7696005)(66556008)(26005)(186003)(4326008)(6636002)(8936002)(8676002)(53546011)(55016002)(9686003)(2906002)(107886003)(83380400001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: jS2dCt/ka6Exrzj3BCxKvUdswH8l39b7dhiTkxpve3bH/9ySII5uUZm0k6nkOX9AYtCFcwm1l5G9e25JGuvkWoTqiWafQzDOnfIGRbjsjbq8ddAZVG78p+8V+GKMBxzDzF3tKy+WdLpGox/CH4IiBoFX1tMqSKiqRX8Qmvdr9DS0Opadtm4DmPuLFpdcChviHH2T/hF/dBTY16l71I12qs+K3fP2rY6G66JMmPcB/G3/iCpJioMoicDiaO131IurdqWw+QC4iNNjcCa/+vtKiZSIH4Z+Bk5AxKoY+IZ5k/yO86wMFgF2mvnscGtXO4mGwlThQ5DoG62U9HIW2JTIlBz7vCncilyJMs2D4a5EGqB3rgJ1T+A2ukT+oll+FCWLLCtf43KWvDrB7HFPf3jDuq9bqNAD43jQynexwWyfyr0IiWYOYCfGvltw9gF8rd0dSsvNMreZ+walEX+f08XeUh080faidLdJpTWXPKDH2bg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b294927f-457c-4dda-617e-08d828b41b8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 11:42:09.3030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+jtnW8iSBb4q4Z4t17GChjV0q9+XRoY5CyGZ+DigpE98fdjm6nXEdlGdJ2/j2M/QXHBN8J63qwFrWIJhoKAdBJblV/wf3lPz7eRD1fJk/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2442
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggUkVTRU5EIHY3IDEvM10gZHQtYmluZGluZ3M6IHVzYjogaGQzc3MzMjIwIGRldmljZSB0
cmVlDQo+IGJpbmRpbmcgZG9jdW1lbnQNCj4NCj4gSGkgQmlqdSwNCj4NCj4gT24gV2VkLCBTZXAg
NCwgMjAxOSBhdCAxMDoyMiBBTSBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+
IHdyb3RlOg0KPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5nIGRvY3VtZW50IGZvciBUSSBIRDNT
UzMyMjAgVHlwZS1DIERSUCBwb3J0DQo+ID4gY29udHJvbGxlciBkcml2ZXIuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+DQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvdGks
aGQzc3MzMjIwLnR4dA0KPiA+IEBAIC0wLDAgKzEsMzggQEANCj4gPiArVEkgSEQzU1MzMjIwIFR5
cGVDIERSUCBQb3J0IENvbnRyb2xsZXIuDQo+ID4gKw0KPiA+ICtSZXF1aXJlZCBwcm9wZXJ0aWVz
Og0KPiA+ICsgLSBjb21wYXRpYmxlOiBNdXN0IGJlICJ0aSxoZDNzczMyMjAiLg0KPiA+ICsgLSBy
ZWc6IEkyQyBzbGF2ZSBhZGRyZXNzLCBtdXN0IGJlIDB4NDcgb3IgMHg2NyBiYXNlZCBvbiBBRERS
IHBpbi4NCj4gPiArIC0gaW50ZXJydXB0czogQW4gaW50ZXJydXB0IHNwZWNpZmllci4NCj4gPiAr
DQo+ID4gK1JlcXVpcmVkIHN1Yi1ub2RlOg0KPiA+ICsgLSBjb25uZWN0b3I6IFRoZSAidXNiLWMt
Y29ubmVjdG9yIiBhdHRhY2hlZCB0byB0aGUgaGQzc3MzMjIwIGNoaXAuIFRoZQ0KPiA+ICsgICBi
aW5kaW5ncyBvZiB0aGUgY29ubmVjdG9yIG5vZGUgYXJlIHNwZWNpZmllZCBpbjoNCj4gPiArDQo+
ID4gKyAgICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY29ubmVjdG9yL3Vz
Yi1jb25uZWN0b3IudHh0DQo+ID4gKw0KPiA+ICtFeGFtcGxlOg0KPiA+ICtoZDNzczMyMjBANDcg
ew0KPiA+ICsgICAgICAgY29tcGF0aWJsZSA9ICJ0aSxoZDNzczMyMjAiOw0KPiA+ICsgICAgICAg
cmVnID0gPDB4NDc+Ow0KPiA+ICsgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzY+Ow0K
PiA+ICsgICAgICAgaW50ZXJydXB0cyA9IDwzIElSUV9UWVBFX0xFVkVMX0xPVz47DQo+ID4gKw0K
PiA+ICsgICAgICAgY29ubmVjdG9yIHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJ1c2ItYy1jb25uZWN0b3IiOw0KPiA+ICsgICAgICAgICAgICAgICBsYWJlbCA9ICJVU0ItQyI7
DQo+ID4gKyAgICAgICAgICAgICAgIGRhdGEtcm9sZSA9ICJkdWFsIjsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgICAgIHBvcnRzIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9
IDwwPjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG9ydEAxIHsNCj4NCj4g
VGhpcyBkb2VzIG5vdCBjb21wbHkgd2l0aA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbDoNCj4NCj4gICAgIGNvbm5lY3Rvcjog
cG9ydHM6ICdwb3J0QDAnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkNCg0KQnV0IGluIFJaL0cyRSBj
YXNlLCB0aGUgY29ubmVjdG9yIGlzIGEgU1MgY2FwYWJsZSBjb25uZWN0b3IuICBNYXkgYmUgd2Ug
bmVlZCB0byB1cGRhdGUgcmVxdWlyZWQgcHJvcGVydHkNCmFzIHBvcnRAMCBvciBwb3J0QDE/IFBs
ZWFzZSBsZXQgbWUga25vdw0KDQogLSAgICByZXF1aXJlZDoNCiAtICAgICAgLSBwb3J0QDANCiAr
ICAgIGFueU9mOg0KICsgICAgICAtIHJlcXVpcmVkOg0KICsgICAgICAgICAgLSBwb3J0QDANCiAr
ICAgICAgLSByZXF1aXJlZDoNCiArICAgICAgICAgIC0gcG9ydEAxDQoNClJlZ2FyZHMsDQpCaWp1
DQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhkM3NzMzIyMF9lcDogZW5kcG9pbnQgew0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9p
bnQgPSA8JnVzYjNfcm9sZV9zd2l0Y2g+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAg
ICAgICB9Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArfTsNCj4NCj4gR3J7b2V0amUsZWV0aW5nfXMs
DQo+DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtDQo+IG02OGsub3JnDQo+DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0
c2Z1ZWhyZXIvUHJlc2lkZW50OiBDYXJzdGVuIEphdWNoLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQv
UmVnaXN0ZXJlZCBvZmZpY2U6IER1ZXNzZWxkb3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIg
RHVlc3NlbGRvcmYsIEdlcm1hbnksIEhhbmRlbHNyZWdpc3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVy
OiBEdWVzc2VsZG9yZiwgSFJCIDM3MDggVVN0LUlETnIuL1RheCBpZGVudGlmaWNhdGlvbiBuby46
IERFIDExOTM1MzQwNiBXRUVFLVJlZy4tTnIuL1dFRUUgcmVnLiBuby46IERFIDE0OTc4NjQ3DQo=
