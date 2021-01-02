Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339EA2E86C4
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Jan 2021 09:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbhABIPD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Jan 2021 03:15:03 -0500
Received: from mail-eopbgr1320125.outbound.protection.outlook.com ([40.107.132.125]:40896
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726080AbhABIPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Jan 2021 03:15:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKNCM0ljP9PyrIym8J/UddLsyr8nPVEywvqxS/N+HR0ew1PPdRhmysEXPiVtQxK+i9l9bBkt+Hi61GUWaNQcBLEMq3qtfmJQi4RQAilkC1sn3OBeefzQJy8/qwyMk0xkMnGnvDolenHf1YKUtrJjmxYfGBDdG6RXatt9Hya5s4UMgTThaheQpE3CSsh2eXxaRxAC7qEuGtNoO068ob4W5Lc2sdeT3IZuOCbgzHDN6WcqAPiYYV8H8UUIoXgBzUR9335R95yovq8oy4JDhLQpqsHlWMPDuSe6phoT7wikTlff1yNBs7Y1EseudUzJRmVffb/8b/Yi6IpE6/4tTVLuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGhzooD1GVoy0ejk9yDYqP0uNE6WCEN1zEhgD838P5k=;
 b=d444O2U9yw/ysoFKmv/Re6PA0xUgwc+Lj+llnaARbw1gKaqP326xit7TnuVMcIcKph2AjsaJr2RTtq2jHn/noV9ZBNeGUQAEuziqYM+RrWNIlu39RAN16cFCEIPlLOlCyt4dTyJ1jfdGOv//Q5CXqO751EwYYO9ShqHn3NWeGtCIAzbofXKUKMS7rrQWS4NhT2crFQe53kKCdIrsfdxGzqVWfCqijvt9fwnSjcGQcvK0CYM6WZegzpOm+AbL2ZmFNqP1dx1nDWsUqT6Ld6tYVfJ9J+76JhTduDVKuCrttpLoJxpb4cVrn7rDLEHXUDP0XCfaieKYq9a/ilXjfYSXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGhzooD1GVoy0ejk9yDYqP0uNE6WCEN1zEhgD838P5k=;
 b=f4bKFXcTH9k1XAh+5ma77KAYOQv+OUz9tP9ZvI2qkFEkNwmIBIuufPhyKMIn/FMELX4zwnOCWuNYu5lC4ltuWw3rlVMeqLFcCXc/0MlUcTdAoZQd5lb+SBlnZQM+m2I/HuTnzvQHUzLtdBJun2U9Pa2DqBqii4rkgsfQ+eGyChw=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB4539.jpnprd01.prod.outlook.com
 (2603:1096:404:10f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Sat, 2 Jan
 2021 08:13:27 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db%3]) with mapi id 15.20.3700.032; Sat, 2 Jan 2021
 08:13:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Adam Ford <aford173@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "aford@beaconembedded.com" <aford@beaconembedded.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF: Add support for
 RZ/G2 Series
Thread-Topic: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF: Add support for
 RZ/G2 Series
Thread-Index: AQHW4IXdk3RpMO7l7kmMnxvjyicg0qoT/SCw
Date:   Sat, 2 Jan 2021 08:13:26 +0000
Message-ID: <TYBPR01MB5309CC39CE7896473819E7C486D40@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20210101113927.3252309-1-aford173@gmail.com>
 <TYBPR01MB5309353C04568B16E029261686D50@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <CAHCN7x+6BobFukqiENYg4HwZm5M0S5Dv14DmbmW5xYn0DdXBwQ@mail.gmail.com>
In-Reply-To: <CAHCN7x+6BobFukqiENYg4HwZm5M0S5Dv14DmbmW5xYn0DdXBwQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [81.135.30.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d58e841a-7f7f-4507-c5aa-08d8aef64848
x-ms-traffictypediagnostic: TY2PR01MB4539:
x-microsoft-antispam-prvs: <TY2PR01MB4539952BC5C5CDB140847F8486D40@TY2PR01MB4539.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: szQtpt39e2colesBCMYbrZJ8fun6WgLM6H3f0Q0o301Ak9Ntk6ceBHbrPYH2No2NOYy9ipqjixhUoFrdO0udu3WNH31jGi0Vo35+hkLuVYDbRjZxmg9ulVX5Etijt0wBrBdBgNrh2pRioiYgjZ94BxvWHl5Ge3go7V+s2nkhNcynZDaryQyHwkePoEXUf5AnCggCcMY5LP/WF82dEuF0CT1g6MouRMD07+BoNdQRlH2dcLig2MN4ZGLSfs7pTTPIRePgwMDOy2YFcCCkDrkLgtEG3QdDxMqBuSfEv9SEnU4RRmdPvdfvXK2oo8QIjEgnFvb6L6k14M1FvjZEdVhYitCX4VjuZnbG+NqJJGtvkU+iLMiotnTuB0zRJz7moBC4SYq7XsQops5xmd6rBLR18Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(478600001)(4326008)(71200400001)(33656002)(8676002)(9686003)(55016002)(83380400001)(52536014)(316002)(7416002)(54906003)(6916009)(64756008)(5660300002)(66556008)(66446008)(86362001)(66476007)(6506007)(26005)(186003)(7696005)(76116006)(66946007)(2906002)(53546011)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?M25NRGhrQURjWVBGbTRhOTBHd1JmNXZ3ck82ZGs1OGpLSTk4bVNhV2pteDAv?=
 =?utf-8?B?NW5LY3I4dzFLeUpScDhjN2RyK0FYOVliVHdETFZmVUs0Szd2bXNRNHQ4d0V3?=
 =?utf-8?B?S2JpcnVOckhIL2tiOU1WNFhaYUliN0dtc3BWYW9QNnkzSnVsRWN5L014dUhu?=
 =?utf-8?B?ZU4zbGV3NjBEcU1qSnhoYXNURkJqOUNxL2FzdERQT1BSSHlva2N6endLWWZw?=
 =?utf-8?B?M1Z0TTVTSUF1TVlidndJd21iL1pzcDdudzhMc0M5Tk83b214UkZRb1hHUHNm?=
 =?utf-8?B?dGxsYzFSRlVMV2Y0WjB1TTZyb3N3QW9MVGxibldnZm1HcmFOZE5xSTJnVTNG?=
 =?utf-8?B?Q1FxSHc5SEI2c1lqQlhoSGNwYUptdkd3bER0K0RiTlBYSmRDRjBvck9GS2Vi?=
 =?utf-8?B?OHhtcndtbWVhdFpxTmdHcVV0bytaRUduKzE2M2lGOWloY2RJeUFUMTFkMVlY?=
 =?utf-8?B?bVBlZ2FOSVBnK28vbk1FSmpKRUwvUGJ2YmlmUi95Sjg4bHk1UFU5Vkt2UTVW?=
 =?utf-8?B?ekExVElscURBSUdIcUFXN21Nbnp6a0h6eUh6Vm9vazR6QzlhR0tKZEFPa1Ft?=
 =?utf-8?B?eTIyRXBuLzlSLzFYWWtMSitNOFQxSnA5VGh0aHJzSmQ5Uk03ejE5Um85SU9C?=
 =?utf-8?B?YXNtc0ltK1ZRdTVYd25pNFdPdmRDK1dZT2JLV0tKUTVyZlFMeUlYK0hzcEF4?=
 =?utf-8?B?NTAzOW5VMkRxc3Qwb1NNbm1lLzZ6VjhEMTEwZE5tMSs1dTNhbVM5YTYvRDZK?=
 =?utf-8?B?WUhsNUhUVnQza1d4TWdyaWZxUmpSdkFBN1k3UjBBSDhhL0M0NUpVMjJENGlR?=
 =?utf-8?B?TEZueHhGOXVCWTFYako4UFQyVlJGSjRkK1BrWXltVmJaMmlKdmNIWFJUSWtw?=
 =?utf-8?B?RXp1dlhHK0ZrZDNubm94Nld1c0lGQUJhMWsvc0YwUTlYay95Z0tXd1RTSUt0?=
 =?utf-8?B?a0ZLd1UzbHdES2FHaHoxbk1VQ0UzaFlCNk9sT2F1bWsvK3dKTXc0K0ZwcE5a?=
 =?utf-8?B?SGZmRE1YNk5qRVNVL2ZROEp4UVZ2YTUyTWJYUjdrV0ZWa0FzZTVhcDdFUlFk?=
 =?utf-8?B?OGFzaS9aRUYzRlFLMkxXYnFPY3NhYTBpbGNSMXIwc2xuSVdoK0V0QmVRNFdu?=
 =?utf-8?B?Sk04SFlXWFdOVVczN1BUVk1aQW9ldWFEWHR2YWszeUxudU9VMFM2eUJYVWgw?=
 =?utf-8?B?UStxeUppR2ZDUHMrNm85VXgrVkF3U3dIdFl1dWZGRDQxSmVETWVXSGdIaFNk?=
 =?utf-8?B?bTRDOVpEMHNtdDVBamUrSzVFUWtQbmUwYWt4STBWWU9tTFV5OEs3OTRkOG9L?=
 =?utf-8?Q?Cp0zb6GBwGXyQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58e841a-7f7f-4507-c5aa-08d8aef64848
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2021 08:13:26.9895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IKnyuzf2TKaoHgEOflNHo8s4W7mYPso+CNiSoV7tj2GKZ09iNC0n24iGBvLiq/cLMQ2QYpO06Stk8ZGMG40wzBIR6O3KhEsdJXKvv4ilQP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4539
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWRhbSBGb3JkIDxhZm9y
ZDE3M0BnbWFpbC5jb20+DQo+IFNlbnQ6IDAxIEphbnVhcnkgMjAyMSAyMTozNA0KPiBUbzogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBDYzogbGludXgtcmVuZXNhcy1z
b2NAdmdlci5rZXJuZWwub3JnOyBhZm9yZEBiZWFjb25lbWJlZGRlZC5jb207IEtyenlzenRvZg0K
PiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+OyBHZWVydA0KPiBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsg
TWFnbnVzIERhbW0NCj4gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IFNlcmdlaSBTaHR5bHlvdiA8
c2VyZ2VpLnNodHlseW92QGdtYWlsLmNvbT47DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8y
XSBkdC1iaW5kaW5nczogbWVtb3J5OiBSZW5lc2FzIFJQQy1JRjogQWRkIHN1cHBvcnQNCj4gZm9y
IFJaL0cyIFNlcmllcw0KPiANCj4gT24gRnJpLCBKYW4gMSwgMjAyMSBhdCAxMjo1OCBQTSBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gSGkg
QWRhbSwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiA+DQo+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFp
bC5jb20+DQo+ID4gPiBTZW50OiAwMSBKYW51YXJ5IDIwMjEgMTE6MzkNCj4gPiA+IFRvOiBsaW51
eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+IENjOiBhZm9yZEBiZWFjb25lbWJl
ZGRlZC5jb207IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPjsNCj4gPiA+IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nDQo+ID4gPiA8cm9iaCtk
dEBrZXJuZWwub3JnPjsgR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT47DQo+ID4gPiBNYWdudXMgRGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgU2VyZ2VpIFNo
dHlseW92DQo+ID4gPiA8c2VyZ2VpLnNodHlseW92QGdtYWlsLmNvbT47IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiA+ID4g
U3ViamVjdDogW1BBVENIIDEvMl0gZHQtYmluZGluZ3M6IG1lbW9yeTogUmVuZXNhcyBSUEMtSUY6
IEFkZA0KPiA+ID4gc3VwcG9ydCBmb3INCj4gPiA+IFJaL0cyIFNlcmllcw0KPiA+ID4NCj4gPiA+
IFRoZSBSWi9HMiBTZXJpZXMgaGFzIHRoZSBSUEMtSUYgaW50ZXJmYWNlLg0KPiA+ID4gVXBkYXRl
IGJpbmRpbmdzIHRvIHN1cHBvcnQ6IHI4YTc3NGExLCByOGE3NzRiMSwgcjhhNzc0YzAsIGFuZA0K
PiA+ID4gcjhhNzc0ZTENCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFm
b3JkMTczQGdtYWlsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIC4uLi9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvcmVuZXNhcyxycGMtaWYueWFtbCAgICAgICAgICAgfCA0DQo+ICsrKysNCj4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4gPiBj
b250cm9sbGVycy9yZW5lc2FzLHJwYy1pZi55YW1sDQo+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvcmVuZXNhcyxycGMtaQ0KPiA+ID4g
Zi55YW1sIGluZGV4IDZkNmJhNjA4ZmQyMi4uMDUwYzY2YWY4YzJjIDEwMDY0NA0KPiA+ID4gLS0t
DQo+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJv
bGxlcnMvcmVuZXNhcyxycGMtDQo+ID4gPiBpZi55YW1sDQo+ID4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3JlbmVzYXMscg0KPiA+
ID4gKysrIHBjLQ0KPiA+ID4gaWYueWFtbA0KPiA+ID4gQEAgLTI2LDYgKzI2LDEwIEBAIHByb3Bl
cnRpZXM6DQo+ID4gPiAgICBjb21wYXRpYmxlOg0KPiA+ID4gICAgICBpdGVtczoNCj4gPiA+ICAg
ICAgICAtIGVudW06DQo+ID4gPiArICAgICAgICAgIC0gcmVuZXNhcyxyOGE3NzRhMS1ycGMtaWYg
ICAgICAgIyBSWi9HMk0NCj4gPiA+ICsgICAgICAgICAgLSByZW5lc2FzLHI4YTc3NGIxLXJwYy1p
ZiAgICAgICAjIFJaL0cyTg0KPiA+ID4gKyAgICAgICAgICAtIHJlbmVzYXMscjhhNzc0YzAtcnBj
LWlmICAgICAgICMgUlovRzJFDQo+ID4gPiArICAgICAgICAgIC0gcmVuZXNhcyxyOGE3NzRlMS1y
cGMtaWYgICAgICAgIyBSWi9HMkgNCj4gPiA+ICAgICAgICAgICAgLSByZW5lc2FzLHI4YTc3OTcw
LXJwYy1pZiAgICAgICAjIFItQ2FyIFYzTQ0KPiA+ID4gICAgICAgICAgICAtIHJlbmVzYXMscjhh
Nzc5ODAtcnBjLWlmICAgICAgICMgUi1DYXIgVjNIDQo+ID4gPiAgICAgICAgICAgIC0gcmVuZXNh
cyxyOGE3Nzk5NS1ycGMtaWYgICAgICAgIyBSLUNhciBEMw0KPiA+DQo+ID4gTWF5IGJlIHdlIG5l
ZWQgdG8gdXBkYXRlIHRoZSBiZWxvdyBkZXNjcmlwdGlvbiBhcyB3ZWxsIHRvIGNvdmVyIFJaL0cy
DQo+IGRldmljZT8/DQo+ID4NCj4gPiAtIGNvbnN0OiByZW5lc2FzLHJjYXItZ2VuMy1ycGMtaWYg
ICAjIGEgZ2VuZXJpYyBSLUNhciBnZW4zIGRldmljZQ0KPiANCj4gSG93IGRvIHlvdSB3YW50IGl0
IHRvIHJlYWQ/DQoNClNpbmNlIGl0IGlzIGdlbmVyaWMgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGJv
dGggUi1DYXIgZ2VuMyBhbmQgUlovRzIgZGV2aWNlLCBJIHdvdWxkIHVwZGF0ZSB0aGUgZGVzY3Jp
cHRpb24gYXMNCg0KLSBjb25zdDogcmVuZXNhcyxyY2FyLWdlbjMtcnBjLWlmICAgIyBhIGdlbmVy
aWMgUi1DYXIgZ2VuMyBvciBSWi9HMiBkZXZpY2UNCg0KQWxzbyBtYXkgYmUgd2UgbmVlZCB0byB1
cGRhdGUgdGhlIGRlc2NyaXB0aW9uIG9mIGNvbmZpZyBSRU5FU0FTX1JQQ0lGIGluIGRyaXZlcnMv
bWVtb3J5L0tjb25maWcgdG8gdGFrZW4gY2FyZSBvZiBSWi9HMiBkZXZpY2VzIGluIGEgc2VwYXJh
dGUgcGF0Y2guDQoNCkNoZWVycywNCkJpanUNCg==
