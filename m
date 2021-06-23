Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4A93B188A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 13:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhFWLNt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 07:13:49 -0400
Received: from mail-eopbgr1410114.outbound.protection.outlook.com ([40.107.141.114]:53366
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230031AbhFWLNr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 07:13:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWvf41CrRGMnl5l7t7uHOLiEl8I0HcyagH7LsqxcZrdvn2iq0O7qlX/6pARfX2mTcqG4A3NUNi1rqP3brbhfJ6LszkAFxrNEGpgXvwkQhekXBocP/hwkH2Kqln/6y39T6jAX4gPtfLaw82dOzjxwbk5M4rvVhW1DO0Bf3wporMc4exAzjBPh+Rcc6m7xUSO2sfMDh+hhO0XOwozUnKms0xu4KIw6LhGF9K5K6j/q1raoRkNFQXYesjx/E5SaUQ0w2GyNm4kXroRcICCFzJxCu7fwrwlEWZQ+0pLQW40cOQr7nUsBDX/MiheqH2VerX2EwUcLTQADmnyansXHZQRBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g+U3bEwJj2UboGATP1kUfj+PyCYfBB5vBPXpviuMH8=;
 b=ak2JEMpPqhcCrNUIR2l/WvDTdfxfEytnoDF32YMO/p0/KI6t+XLQTUDANqP0IVRaTEsjJW6tlp1+HJFLddelcHAaUdMie9R9gJbq/AgOaLaib+kHr/jpld2XkXxbZlNhYzoqc0KhjIvhtcNvpYRbtMU7eZmqxmI42fpwTQPav1wn8x1Bm98nxIG+lM/ods7oqsD43LADA7x7kPECkN0LVFrydXdy1GS2OtYoXZM9icMtIyOzugQ/O4bLOcJBZLpkl+FeEwODT0JBo+tmtkqe438Phm8nrI3uPCb5StEeVG9T4mG9LMph+98S1Dg20NTJMlT55IgCrIRyZZMKEi4QSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g+U3bEwJj2UboGATP1kUfj+PyCYfBB5vBPXpviuMH8=;
 b=Nwp4O67nkpJAiPudWMrX8jo4c53eyXJml2gEe4RKEAMfpYsIg7odvl7c5Co/m+g2qGfxll6Qm97++ZfMz6VQ67zzeJIcq4sfY1AX0z69+wSJCxLRbFRo46N6PGdddE+LezpDjr64tpsGYDLjGx/nz6YLNeZM2DhRjEnSfw+3dc0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3575.jpnprd01.prod.outlook.com (2603:1096:604:43::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 11:11:26 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 11:11:26 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/7] dt-bindings: clk: r9a07g044-cpg: Update clock
 definitions
Thread-Topic: [PATCH 1/7] dt-bindings: clk: r9a07g044-cpg: Update clock
 definitions
Thread-Index: AQHXZCh/26TZFnVapkasoStZW/+B+aseoZsAgAEjxUCAAF/wAIABTkKQ
Date:   Wed, 23 Jun 2021 11:11:26 +0000
Message-ID: <OS0PR01MB592205558A2738A271D727D486089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
 <20210618095823.19885-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXLrfU99sQCbwLFifqrV4B94pzGi_DWbBvpS4-Y=Z09RA@mail.gmail.com>
 <OS0PR01MB5922B821B3893BAD08D2573A86099@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWQK_k3ePJpx2CF-X9TNgPYzzP8AW9N2rDjXSOAP2wNxQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWQK_k3ePJpx2CF-X9TNgPYzzP8AW9N2rDjXSOAP2wNxQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c1fe89f-af39-4ad3-f89a-08d93637a4e9
x-ms-traffictypediagnostic: OSBPR01MB3575:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3575C0E3042DBB023B72C8BD86089@OSBPR01MB3575.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ibpaTbumjxxDsDOSSsebfPvL5hgvZo65vgsmA+NS1siFVLliSTc5xHxkULr1EfysSHgNVGlFB0LF6plIkGwz3CBc+7ALlwB/hnpSw0FxRMHez/aliXYPslIoFCuKz03o8dXvngzqbDRChrnMl/kdiMahJYCfg4GTqlnZ0wZxTppkpZwQ8WEkPmHhJVL8hhPd//Gw121aucfy3cJ2EZlgdL8dugJvClH3HDsvwSX3G/fDd2reVPF8TvA4BR2ZxZcn3jMuHdVn9Rm4lu29KsoyIXtAMJtqkI/haV345ve+z4WEoq1zB919bKxJSWs1sNZXTq/gHV1eNKphNgyYWSZhSxTj4MnD+mJfeNJ3HiM6s0eccdYrZ8w4Py28JmqOgQ7iyi3uC7mEewwaXyuGbB1VdT3urBYC6JrFHRDIGnmEF9xDsl5iUMQX/A4TaAzNkcNOYC+IWMT48YYjB88WMl1brEJ6u+KQvNxJo7j4UttaEDKPmQ+SIeYhyhw1GKBy8zOJh+cLqMJ8xXbZ5j1Ck+5kq0c6EujNug4uLSw/57k4HdNZ5MfKEfRFtwZc+OUSGeYJN7Ihczqd63qPj7inFvLYdvWU1XqKYI0QBZksrC7gdfk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(5660300002)(26005)(9686003)(186003)(76116006)(8936002)(2906002)(66446008)(15650500001)(64756008)(38100700002)(52536014)(66946007)(66476007)(55016002)(86362001)(122000001)(66556008)(8676002)(316002)(6506007)(478600001)(4326008)(71200400001)(6916009)(54906003)(53546011)(7696005)(83380400001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFFuT3R2NVVjODRlMkRHeCtraENrVWMzN2ZiNHNucmpoR0lhQWhwcldKRXR1?=
 =?utf-8?B?RXNJd1I2amY2RTdzaXZlUUZqTzdDckRTL1lLM25HdXFJUm5jY01aSm1GZGpQ?=
 =?utf-8?B?MG5LSlpldzhGQjZqMEkvVytpSmhlSEVlU0d3YXhJbXhXd1YxOXZVcEx0UnZC?=
 =?utf-8?B?SDEyZWFzUG1DNW1EakdqcFhtdURSTmR1a281R0R5a1p0R2RVU2ZyVWh2WXVy?=
 =?utf-8?B?STkxdEhCd1B3a0UxbWVocWxrK1E0b2h6blJSMS9xb0FmYXQ1RjVOWXFSMEdv?=
 =?utf-8?B?R0VzU2FEaXNqc3ZMVHBhdGIzTTNlQ0tEWng2SENibDdodVk1c1ltNGRsdW1n?=
 =?utf-8?B?dDhtRmxhMzFaQUs3QmRLSVRGa1pST3FnTUJsZk5UTjJ4eVc0dzZMUGFpR2RO?=
 =?utf-8?B?NWNLdktBVEdBN2dzb1JUTU5JQTBzK21YNU5QRlhzYTQ1eENEcXpJb1lJOCs0?=
 =?utf-8?B?SE9lWXJlRVY2cUF1ejRvQmlsdGFvSFR6Q2gzaDNaNW9CQzVMbHpPK1NNZ0lD?=
 =?utf-8?B?WS82QmFQNGdwMGZiMjhCQmdkMnhKSzZXbFZ1OTBiZW4raVF5d1BEamJQdzAx?=
 =?utf-8?B?bTJpb2J6Vzk5MDExUmxDWFZqS2s1bGhNdHF3MUlSdThjVHJxQ3dKMkovL2Np?=
 =?utf-8?B?RmMwZVFvOUpEd2ZGajhsSk03R2tGaG5iMElmS3ZwMk1IQ1RIb2RRT05ySU1W?=
 =?utf-8?B?V3YyQ3dZalBFQVBsM3M5UEtnSDIyRC9SVHNnQy9rTkV3ZWJDZHlrMFNWcUYz?=
 =?utf-8?B?WTJidDZwS0RWaWdIaDlHT1pxWEM0cTNrcWFnTVl6RFR4VXlOUzhxMTN5N3Qr?=
 =?utf-8?B?cWpjeTFDYVArYzEyRjQ5Qks3VlQwS1VwU1N4eklXYkZHbk9CWWF6NmhnVFhM?=
 =?utf-8?B?RlJRaUhwVWlyM2dPRzIyTVhHMGltWHhkbGhmRzl3SU1IMkswZkJESW9qbjRF?=
 =?utf-8?B?K2FBUnRuRm93VzJZUVk2UXhqd2ZFaTFDVTl2eS92VUdVTFJzYkRXZXVCYysy?=
 =?utf-8?B?Mk5td0hKTWRmR0dCS05YRGJtdmx0L2piSDlpdUhnYmsxdGt1ajg2MGJxQ1Bh?=
 =?utf-8?B?M1Awd0Q1WFNWaTN3dHBGSTFJQ2ozbzZDdmRkbnpqdHhRcW5RcGlRaTNYVlpF?=
 =?utf-8?B?R1RQR1dVb2JKU3RVNzR2T3E0QTgvdzBTeEI4cmo2ckt0S0pSSW1Oek1vT29m?=
 =?utf-8?B?VzFSNCtTSy9MSVBlZDd1amZEaWRzMGFCZVFHYlp5Z1MxL2lESWUrejFwQUkw?=
 =?utf-8?B?cHU1WGFsSnlyVVBPT2dBNTQ4R0dWRWxFb3RndHB0OWJrR2kvU0drZi9OZ2lI?=
 =?utf-8?B?SXQyMlA4Z2NHMVplZm05ODZyWTV0STNtd3pJaDBiNXhvVXJ1N1k4ZkZ4ZHJx?=
 =?utf-8?B?a05CUUF4Q0xpcTk3MDYxaVpmN3JjcHlLWDljaWhqN1JGY3YzQ2M2NnhQcEFh?=
 =?utf-8?B?VnJ0aHc2NmxyTVpYcXBXMDUrbTBlZWVCRmpZZVh5MlhwWXVkZnpFLytWaVFu?=
 =?utf-8?B?V3JEZi9TVTdoYlNSV0lxbkN6WkV3ZGFjU1BOTFczbDNTRkRGYTBZZlVLemtm?=
 =?utf-8?B?S2dOS0tVYyszRGR1UlpXMkN2bTVHTW9TSitPbjl6TlFyaitJT2VkdTlJbnJH?=
 =?utf-8?B?RklzS0lTakZncGNJTk1XM2ZWMnk1ei9jTHNxaVJaOW5FcG1aRG5Da2dNRk5V?=
 =?utf-8?B?QWxFUmdvOEU5azJoU1o5TU45cU0wTHcwa01DQVpaQjhDUUFoUGNYQWI4dnJZ?=
 =?utf-8?Q?q+JWWQjIB2vfkpsviWKofMhEFwIWTUIDjlWbXAP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1fe89f-af39-4ad3-f89a-08d93637a4e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 11:11:26.6030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nhi9+cSctLuHsmHvqqoZL8SgcENPWfxoUh24T5lAPf/iYY0cwxnWUFpw8oE1AvLhoQJBceGe/c5Zpu1NWIwqqfUGOXqWiwkB3tFnt15WSks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3575
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS83XSBkdC1iaW5kaW5nczogY2xrOiByOWEwN2cwNDQtY3BnOiBVcGRhdGUgY2xvY2sN
Cj4gZGVmaW5pdGlvbnMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIEp1biAyMiwgMjAy
MSBhdCAxMToyNiBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdy
b3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzddIGR0LWJpbmRpbmdzOiBjbGs6IHI5
YTA3ZzA0NC1jcGc6IFVwZGF0ZQ0KPiA+ID4gY2xvY2sgZGVmaW5pdGlvbnMgT24gRnJpLCBKdW4g
MTgsIDIwMjEgYXQgMTE6NTggQU0gQmlqdSBEYXMNCj4gPiA+IDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBVcGRhdGUgY2xvY2sgZGVmaW5pdGlvbnMg
YXMgcGVyIHRoZSBSWkcyTF9jbG9ja19saXN0KFJldi4wMikgbWFudWFsLg0KPiA+ID4gPg0KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+IDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQ0KPiA+ID4NCj4gPiA+ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9j
ay9yOWEwN2cwNDQtY3BnLmgNCj4gPiA+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9j
ay9yOWEwN2cwNDQtY3BnLmgNCj4gDQo+ID4gPiBJIGRvIHRoaW5rIHdlIG5lZWQgYSBzZXBhcmF0
ZSBsaXN0IG9mIGRlZmluaXRpb25zIGZvciByZXNldHMuICBXaGlsZQ0KPiA+ID4gc2ltcGxlIG1v
ZHVsZXMgbGlrZSBTQ0lGIGFuZCBJMkMgaGF2ZSBhIG9uZS10by1vbmUgbWFwcGluZyBmcm9tDQo+
ID4gPiBjbG9jayBiaXRzIHRvIHJlc2V0IGJpdHMgZm9yLCB0aGlzIGlzIG5vdCB0aGUgY2FzZSBm
b3IgYWxsIG1vZHVsZXMuDQo+ID4gPiBFLmcuIFNESEkgaGFzIDQgY2xvY2tzIHBlciBpbnN0YW5j
ZSwgYnV0IG9ubHkgYSBzaW5nbGUgcmVzZXQgc2lnbmFsDQo+ID4gPiBwZXIgaW5zdGFuY2UsIHdo
aWxlIENBTkZEIGhhcyBhIHNpbmdsZSBjbG9jaywgYnV0IHR3byByZXNldCBzaWduYWxzLg0KPiA+
DQo+ID4gT0ssIEFncmVlZC4gV2Ugd2lsbCBsaXN0IHNlcGFyYXRlIGRlZmluaXRpb25zIGZvciBy
ZXNldHMgbGlrZSwNCj4gPg0KPiA+ICNkZWZpbmUgUjlBMDdHMDQ0X1JTVF9TREhJMCAgICAgICAg
ICAgICBYMQ0KPiA+ICNkZWZpbmUgUjlBMDdHMDQ0X1JTVF9TREhJMSAgICAgICAgICAgICBYMg0K
PiA+ICNkZWZpbmUgUjlBMDdHMDQ0X1JTVF9DQU4gICAgICAgICAgICAgICBYMw0KPiANCj4gUGxl
YXNlIHVzZSBuYW1lcyB0aGF0IG1hdGNoIHRoZSBkb2N1bWVudGF0aW9uLCBsaWtlIFI5QTA3RzA0
NF9TREhJMF9JWFJTVA0KPiBhbmQgUjlBMDdHMDQ0X1NESEkwX0NBTkZEX1JTVFBfTi4NCg0KSnVz
dCByZXRoaW5raW5nIGJ5IGxvb2tpbmcgYXQgUi1DYXIgYXBwcm9hY2gsIFdlIG1heSBub3QgbmVl
ZCBkZWZpbmluZyByZXNldHMgaW4gZHQtYmluZGluZyBmaWxlLg0KDQpXZSBjYW4gY3JlYXRlIGEg
MTYgYml0IHVuaXF1ZSBpbmRleCB3aXRoIHJlZ2lzdGVyIG9mZnNldCBpbiB0aGUgbGFzdCAxMmJp
dHMgYW5kIGNvbnRyb2wgYml0cyBpbiBsYXN0IDQgYml0cy4NCkRldmljZSB0cmVlIHBhc3NlcyB0
aGlzIGluZGV4IGFuZCBkcml2ZXIgZXh0cmFjdHMgdGhpcyBpbmZvIGZvciByZXNldCBoYW5kbGlu
Zy4NCg0KVGhpcyB3aWxsIGF2b2lkIGR0LWJpbmRpbmcgZGVwZW5kZW5jeS4gQXJlIHlvdSBvayB0
aGlzIGFwcHJvYWNoIGZvciByZXNldHM/PyBXaGF0IGFib3V0IGNsb2NrLCBleGlzdGluZyBtZXRo
b2Qgb3Igc2ltaWxhciAxNmJpdCBpbmRleCBtZXRob2Q/Pw0KDQpQbGVhc2Ugc2hhcmUgeW91ciB0
aG91Z2h0cy4NCg0KPiA+IENsayBkZWZpbml0aW9ucw0KPiA+DQo+ID4gICAgICAgICBERUZfTU9E
KCJzZGhpMF9pbWNsayIsICBSOUEwN0cwNDRfU0RISTBfSU1DTEssDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBDTEtfU0QwX0RJVjQsDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAweDU1NCwgQklUKDApKSwNCj4gPiAgICAgICAgIERFRl9NT0QoInNkaGkw
X2ltY2xrMiIsIFI5QTA3RzA0NF9TREhJMF9JTUNMSzIsDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBDTEtfU0QwX0RJVjQsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAweDU1NCwgQklUKDEpKSwNCj4gPiAgICAgICAgIERFRl9NT0QoInNkaGkwX2Nsa19o
cyIsIFI5QTA3RzA0NF9TREhJMF9DTEtfSFMsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBSOUEwN0cwNDRfQ0xLX1NEMCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDB4NTU0LCBCSVQoMiksDQo+ID4gICAgICAgICBERUZfTU9EKCJzZGhpMF9hY2xrIiwg
ICBSOUEwN0cwNDRfU0RISTBfQUNMSywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFI5QTA3RzA0NF9DTEtfUDEsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAweDU1NCwgQklUKDMpKSwNCj4gDQo+IEFzIGVhY2ggY2xvY2sgbm93IGNvcnJlc3BvbmRzIHRv
IGEgc2luZ2xlIGJpdCwgeW91IGNhbiBzdG9yZSB0aGUgYml0DQo+IG51bWJlciAoZS5nLiAiMCIp
IGluc3RlYWQgb2YgdGhlIGJpdG1hc2sgKCJCSVQoMCkiKS4gIFRoaXMgYWxzbyB3b3JrcyBmb3IN
Cj4gYml0cyA+IDgsIHdpdGhvdXQgbmVlZGluZyB0byBlbmxhcmdlIHJ6ZzJsX21vZF9jbGsub25v
ZmYgIDstKQ0KDQpJIGFncmVlLCBwbGVhc2Ugc2VlIG15IGFib3ZlIGNvbW1lbnQgZm9yIHVuaXF1
ZSBpbmRleChvZmZzZXQgKyB0aGlzIHZhbCkuDQoNCj4gPiBSZXNldCBkZWZpbml0aW9ucw0KPiA+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gICAgICAgICBERUZfUlNUKCJzZGhpMF9SU1QiLCAg
ICBSOUEwN0cwNDRfUlNUX1NESEkwLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMHg4NTQsIEJJVCgwKSksDQo+IA0KPiBTYW1lIGhlcmUuDQo+IE5vdGUgdGhhdCB5b3UgZG8g
bm90IG5lZWQgbmFtZXMgZm9yIHJlc2V0cywgdW5saWtlIGNsb2Nrcy4NCg0KT0suDQoNCj4gPiBB
bmQgRFRTIGluc3RhbnRpYXRlIGJvdGggcmVzZXQgYW5kIGNsb2NrIGVudHJpZXMuDQo+IA0KPiBX
aGF0IGRvIHlvdSBtZWFuIGJ5ICJpbnN0YW50aWF0ZSI/DQo+IFRoZSAiY2xvY2tzIiBhbmQgInJl
c2V0cyIgcHJvcGVydGllcz8NCg0KSSBtZWFuIGNsb2NrcyBhbmQgcmVzZXQgcHJvcGVydGllcy4N
Cg0KUmVnYXJkcywNCkJpanUNCg==
