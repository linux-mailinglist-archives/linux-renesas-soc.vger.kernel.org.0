Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739CF3D3CD2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jul 2021 17:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235582AbhGWPLp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jul 2021 11:11:45 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:41937
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235470AbhGWPLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jul 2021 11:11:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g61VLerAbtY9DxMG/2LMy0oSN3iC6Uxy991PcdpkeOV3lJIggPk6wo/mzdDCCNCN6uqal4D4S7YaCG9SAoIxOQYnFWtxJGxYYjv7dlNHuhS/W45zIWLDuSs81f3Wn1bb9lLzrpKthLcU4AhvIy+hFGJApYA9st8pJlOQjoOJhiKx2W6rD+YbOcSQWj3BdbUsfiNb8Gl1cwjYIVng7dFzdYd3okcpZu0w8OOO11bGjh32Lcr8DmTfTIqgVK6TgqTX2tHoXc8M06fgQp0Syk1Ajb38LBqjw5xEdiA1RAPvprYhvD3I7n+VmMHdPvrVlx4GwjsvoNGeizg//ns1Hx821A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LD90y8Tpf+i1PGV/ju3j09IjKs6xcB8ZD59Y5NkmCJ0=;
 b=Te+cxHbUauGY4jUAVqpInS7omnlSjtG8ACkDsbVm+tPDgpoLEyTbQiPV5jYgGEzHcrPYWCnGvK7DJyfOm+Fl1JeCcTMMC3D86d9G7XfVJNJNrrG3w4iw65UoPygvkKIwBZ6sYuVEvYQm0TX/M6m/cYkSOTG3qQ3Kqt4Y118grAhoePlhva6ghyyRrWeK/qjWUNacvVtjCbm30wm++acBEUrxfV9AmXDgExIBAnro4zlcImVSaa3n78U68r/g34t9EjZ+kCsNg7sPovhjVYZt4vonLZKLjYqV7ySR+sQicB80okaJ1TNW5o2fo5WWnO8LbJ7DmkidHoGkcsLeovl+WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LD90y8Tpf+i1PGV/ju3j09IjKs6xcB8ZD59Y5NkmCJ0=;
 b=hgxjqohbtklHSfeuLp6s7Yd4WN/IBLsHxU9JJeRjiUZtRQtfgrkfre4f8fNb0aOw+E81JOAXvAx3ZJRORLarEJT2rIUIbyJgD00YQjIwo4hCRoqON9O4NjV8cggFihT/OkRo2udEY30sSCYmCIooLn/XEXxVWdwk1QsGi0PfTWc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (20.183.20.197) by
 OSYPR01MB5461.jpnprd01.prod.outlook.com (20.180.251.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25; Fri, 23 Jul 2021 15:52:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 15:52:13 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: rzg2: Add internal rx delay
Thread-Topic: [PATCH] arm64: dts: renesas: rzg2: Add internal rx delay
Thread-Index: AQHXflsnYeOcD3IFRkSiTTv4CyKaCqtQsGYAgAAEDSA=
Date:   Fri, 23 Jul 2021 15:52:13 +0000
Message-ID: <OS0PR01MB592299E2554B073C582F29BE86E59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210721180632.15080-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWMB8o=GuvOtzBg6w6m3C030wu7-btT+FJ-dAZgNK3xsQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWMB8o=GuvOtzBg6w6m3C030wu7-btT+FJ-dAZgNK3xsQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97b6a370-cdd0-468b-0694-08d94df1d6cf
x-ms-traffictypediagnostic: OSYPR01MB5461:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSYPR01MB5461C09C5C28EDEE6B7D98A786E59@OSYPR01MB5461.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zEEMsuYdP4yQGP61V81+NYJOmDMU0fLgl9oel7PF4by01cK+//tbS/hvL6KaZUkLcX1f0b0J7063j9A5j/HBPAC810wYc9ceHGxmzUbRZvMJZeSs0s9ddFedFdcHmBBCFWmCAb41FyersYDLEBiTWS+nCFcAvTH+/1DAextRHjZP9iJls9kIir03Z/FkSrr7bnGQRbXp9PM3F4+X6Je4Ke8VpQgI2ABEcJwWJcOj2cbz6/b1lHMTytwZBPxkvJgTM8UETCSDfzEZyUWbKEE7ijzlJkNALIYAab6xc4Nm7UMZHMv+IJpYl2/LSfyXh/TKXQgFkbUJ08ebXFFIuwc09OMwhitsYdbOLs3QeFzuTtRhWuAsupYI10BERX3MZfm1laCiLeD/Q8uZW8Uf0JmnqM3CKjxby8NlJbUg3bcHYUN4xyga7+FJ3CBIceogz5MpMNtR5ieG/hFahYmPaGmCN108MgDaLrR3L8YlJLXewLMCkIPW+PrSaO7Z3WZvc0gnN1P3R4UEnoesr/RDHPYvgiOfY3Z/1i4rJygVg/o2b3gdUYL6QVPVapocEqiUn38dxWAEqfaKXCa5q4jI3I0xxikXVUHoM1WSOuY+dsNYztXn1RT4qPfxqcEne97HM+1ZIh7b/rIsHUfc2p3YnoLtruSyC0MxnCb39FVRGHlGPMDlOBOUkn09/RUhkij0qmo56p4Xf04Q/196cd50WtAcnQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(86362001)(9686003)(107886003)(4326008)(33656002)(55016002)(2906002)(83380400001)(7696005)(54906003)(38100700002)(6916009)(6506007)(64756008)(52536014)(26005)(66446008)(66476007)(8676002)(66946007)(122000001)(76116006)(53546011)(66556008)(186003)(478600001)(71200400001)(316002)(8936002)(5660300002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nlp0Qi9teDhQSjlqZzE4SGNhSTN3OU1jQUhnekhieThYeko5U21neExvS0x2?=
 =?utf-8?B?bkd0TzlLajB1L210b0NjNEE3Z0RxMCtLMkk1Sm5ob2F2NjNjeDZRUFB4SWpz?=
 =?utf-8?B?cU5vbHU2K0VsMHNNV0Z3S2RVSGxMT2dMTFRrY0h5NWVkYVg3K3d3U0xwekxQ?=
 =?utf-8?B?OXlhN2RucjR3S2JiVFRKWGdGSGlKc0o1TmphMzdVa1lMbWlSSURnN0Qxczcy?=
 =?utf-8?B?MldXLzRPVGoydXpyWXJwV3lJTkEzLy95SUgyMjV2eElrQ2d1NzkzYzR1M3lQ?=
 =?utf-8?B?Ymk5ZndrRFBXVWVRbEZBQnRNNjdFY3NtbjhIcWJJRFdaN3hHTGFTUGM4QnJV?=
 =?utf-8?B?VDZMUWc5Skp6ZmprK2ozZlhRdTBZei9xblRCZkl6c3JTZkRBRkE0K0g5bnhK?=
 =?utf-8?B?bE5tUkQ5V1QraGNrWWRFNDBYT3NDbFgvR3JoZDNyQXJhRjF6cmZlODFVeE9M?=
 =?utf-8?B?bDc0L3pOWEw3V1dzbm1vU0dLVEFaalBnRFF3QU92SlRQSzY5TnVTSnVFL3pH?=
 =?utf-8?B?aE1CaFh5Q0x3a0UwaEQzUEM4VzNjUGp1NWlhcVZxMERURm4xalg1a2dsWDBS?=
 =?utf-8?B?Mm9TUXFqOXA5WXdEazdhVGMvYU1ZTGk4cVFXSURaWk1NZGIwcFJOV1hsT3J4?=
 =?utf-8?B?emZqaGVxd1NJazFDNkh3TnFXTjBaZVlBOVJrTlFXMjBScFBuQXNOTi96cFkr?=
 =?utf-8?B?NklhbGlJQmpQNlBpek04dmJldDl0b3dPRFJLSDJQR0V5YjlnQVlTd29jb0Vo?=
 =?utf-8?B?SWduck9CdTVGUElNczhjYVV4TmFCY2Z5a1kvbXQxWkxjWTJhbEdnT2IxUStS?=
 =?utf-8?B?Mm9XWWUwaEhuRkNhZWJ5cGM1QWo4VEFyb2NMVmhLV281M2Z1Z0orYU5UT05I?=
 =?utf-8?B?RUJ4c1YwZXhGckN3azN6bndjR0MvNkdyRWttREJlQy94bXNTVldndGllUEpJ?=
 =?utf-8?B?SmVER21GdEFBSm5lcmNyZ0ErL3RRRDhydGdXTTlPK29GZjl2OUFoNmVoZWg3?=
 =?utf-8?B?UFRPSlQ1QmwwYjdmTWJDVmlZaStBdlJOVHJqY1FCRmVGZGM2MXB3OXgxcUlq?=
 =?utf-8?B?ZTVjSTg5bm9GRHdqUXMzMWxPOVp5NkE3aUdtbS9KZGlsYzQvU0dTclJRMzVh?=
 =?utf-8?B?cnlWQUNDNGZhK3c2RjY5VjN3VGpEMXRnZlYxVy9lOHM4ejhHcGdPZFNmckxX?=
 =?utf-8?B?WXdBTFg2T3JUZ0U5STllVlMrNEt5b3RJQksvWUU0OTBFbjFKOE1tdGdGUExq?=
 =?utf-8?B?NHJYczB3bWtEZmZSNWl5QjNhdmRJeG5NYWtHSHZOY0hWdm9rQkg5R25tM09w?=
 =?utf-8?B?R3RNbWRyTmFOSTJuQU00ZWF0REord1pOUDY5enVQdDRhLy9IUVJJbVgzRGRN?=
 =?utf-8?B?QXVKa0N6dFZ2UlU3M0lDOXdEVzczNCtxNHU4Y1IzRGdOOXRvTlFoVW5EalE2?=
 =?utf-8?B?TUJmbk5IUGhXN1RxR0Jzd3BZMm5Uemc0WUpoMnhUNXlvTGlJNTkzWXdDVnEy?=
 =?utf-8?B?SXVidUNkU1pYaGMwME1wdkhFTTgvcG8yMWN4MVIwMHdINFV4VS9pUnVYZXFu?=
 =?utf-8?B?VzJNemtGT1p1VW9KZHRhWmN2VllBZ1JIVzFuWmRsa281Z3dJTko1YnYzMG8r?=
 =?utf-8?B?QUNuNnkwQTB1WS9jSExlcDB2TGIvdU90cFBDVjNOUXlZekVBWjRhOWlrcE8z?=
 =?utf-8?B?TDlsdFdyWlhFeFV5L2psTlE1blJFbFdrYWhWNXRhQ3c4RUttMFVNRDRWZ1Nu?=
 =?utf-8?Q?4VZwr/A64IgY3GzxtmvImIYXYWHC+trzzJ6nebO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b6a370-cdd0-468b-0694-08d94df1d6cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 15:52:13.1534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZULAhCptCKPvoUNILj0zLrZxBRe702fNyKWvrYH9RUecZedXHDF/6vRNJcBfVydzMMWbY6jbYyfxCtU+ZSv1LjgS6ncJmSoBcj+uWo42RV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5461
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzI6IEFkZCBpbnRlcm5hbCByeCBkZWxheQ0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgSnVsIDIxLCAyMDIxIGF0IDg6MDYgUE0gQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBIaWhvcGUg
Ym9hcmRzIHVzZSBSZWFsdGVrIFBIWS4gRnJvbSB0aGUgdmVyeSBiZWdpbm5pbmcgaXQgdXNlIG9u
bHkgdHgNCj4gPiBkZWxheXMuIEhvd2V2ZXIgdGhlIHBoeSBkcml2ZXIgY29tbWl0IGJiYzRkNzFk
NjM1NDliY2QwMDMNCj4gPiAoIm5ldDogcGh5OiByZWFsdGVrOiBmaXggcnRsODIxMWUgcngvdHgg
ZGVsYXkgY29uZmlnIikgaW50cm9kdWNlZCBORlMNCj4gPiBtb3VudCBmYWlsdXJlLiBOb3cgaXQg
bmVlZHMgcnggZGVsYXkgaW5hZGRpdGlvbiB0byB0eCBkZWxheSBmb3IgTkZTDQo+ID4gbW91bnQg
dG8gd29yay4gVGhpcyBwYXRjaCBmaXhlcyBORlMgbW91bnQgZmFpbHVyZSBpc3N1ZSBieSBhZGRp
bmcgTUFDDQo+ID4gaW50ZXJuYWwgcnggZGVsYXkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4gaS5lLiB3aWxsIHF1
ZXVlDQo+IGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY1LjE1Lg0KPiANCj4gRG8geW91IHdhbnQgYSBG
aXhlczogdGFnPw0KDQpJdCBpcyBhIHRyaWNreSBzaXR1YXRpb24uIFRoZSBwaHkgcGF0Y2ggaXMg
aW50cm9kdWNlZCBpbiA1LjkgYW5kIGlzIGJhY2twb3J0ZWQgdG8gNS44LiANCkJ1dCB3ZSBkb24n
dCBoYXZlIE1hQyBpbnRlcm5hbCBkZWxheXMgb24gdGhvc2Uga2VybmVscy4gU28gRml4ZXMgZm9y
IDUuMTArIHdpbGwgYmUgb2sgSSBndWVzcywNClNvIHRoYXQgYXQgbGVhc3QgdGhpcyBmaXggd2ls
bCBsYW5kIG9uIGNpcCA1LjEwIGtlcm5lbC4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiANCj4gPiAt
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvaGlob3BlLXJ6ZzItZXguZHRzaQ0KPiA+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtcnpnMi1leC5kdHNpDQo+
ID4gQEAgLTIwLDYgKzIwLDcgQEANCj4gPiAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7DQo+ID4gICAgICAgICBwaHktaGFuZGxlID0gPCZwaHkwPjsNCj4gPiAgICAgICAgIHR4LWlu
dGVybmFsLWRlbGF5LXBzID0gPDIwMDA+Ow0KPiA+ICsgICAgICAgcngtaW50ZXJuYWwtZGVsYXkt
cHMgPSA8MTgwMD47DQo+ID4gICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4NCj4gPiAgICAg
ICAgIHBoeTA6IGV0aGVybmV0LXBoeUAwIHsNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiAN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
DQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51
cyBUb3J2YWxkcw0K
