Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4843B193B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 13:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbhFWLuD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 07:50:03 -0400
Received: from mail-eopbgr1410108.outbound.protection.outlook.com ([40.107.141.108]:26496
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230019AbhFWLuC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 07:50:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2ILzWLQxE90ORc01vC7Zca/vRTftB5+jutIhJZTE0+Kux31zvQ6Qr/WhbOCN5TOGh4SD642dgJB2iBIai3uSN+n7BPCHVxazwpiZp8p3gQNX0aXaJCeRpf2gmrPxDbGgKksUAqVczjZ+NS5T42n0m8OZqQW7bNxH4p7wovKdGrbj3fogZ3QIf+WKMQ/Fdbysa3x/5eaJnikY2o8FTif43KobZeFoZjIT+PWKFsiKRGY3Elok3ScWFXuF1yrejBrAQObQzBOmQLwZkeV4YJxNsg8TWYcLWs1peNhG+1IL0Cxgfh5ojns0txlAuHNLXtIxfK21AX8SG2+louf+y1bVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPrEAwZPg9z+czQnl0nBw9oFL/rQTNaJNmrdyuJiADw=;
 b=Tcak6AXoTZaGWzJGE21kRn3tBzPizfg9MJdccviJ7fPZ7pg580XyW8NQ18mFioMqjGV1S6bIQca1fSqqq6tvvkaOdOjgh0UecqNiBfeYj5JWuApJrfP4fhkzPUPmfZqBBQeI05CtWZox56g3zeO1nWiaMrw46Ow3vCxVtUi1ZRCVFZ4qPMA96DQW5uaQst/ykt2xS0y38OByT4ZhregPU3IPp9wWNAzy0FXxiINnJHZ5YkcR6/U6Gw+fpf+21tLZH64cJ6bmiSFHvbaM1pr7YW1HzKQwjN6fjxkpNwcBjBkJ4B3/nYP8CW0qkDyCQF5KaZdrvmSkPT94Vs8WxkgImg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPrEAwZPg9z+czQnl0nBw9oFL/rQTNaJNmrdyuJiADw=;
 b=llvk1FzgZMTbdfAhebNU6g4ytdHbeBMCW+XBGVXZsnZo/IeQb1MOtqV6giBdz9Sb0Hpp6dLEPzHeSSuDXICEmxD7+pga+L6YZfzTiHfpviuLKNVW6sbKf693P4DZYYcDknOhEh4f5A+SsKaHzqaTn+Q9xZPbagrv8lbrn84Da94=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3575.jpnprd01.prod.outlook.com (2603:1096:604:43::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 11:47:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 11:47:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/7] drivers: clk: renesas: r9a07g044-cpg: Update
 {GIC,IA55,SCIF} clock entries
Thread-Topic: [PATCH 3/7] drivers: clk: renesas: r9a07g044-cpg: Update
 {GIC,IA55,SCIF} clock entries
Thread-Index: AQHXZCiB0Hvwq+6JGUuL+gSePnDkuKsgKd+AgAFTX5A=
Date:   Wed, 23 Jun 2021 11:47:40 +0000
Message-ID: <OS0PR01MB5922CF5BAA17C1AF116EE09286089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
 <20210618095823.19885-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdV77ORDvcQmMUg8FpmyotdiORDSN_J19hqctzZz9g6gUw@mail.gmail.com>
In-Reply-To: <CAMuHMdV77ORDvcQmMUg8FpmyotdiORDSN_J19hqctzZz9g6gUw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b84d99b4-5ffd-40d3-eb2f-08d9363cb4e9
x-ms-traffictypediagnostic: OSBPR01MB3575:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB35758E712E50B7ABEF34AFB286089@OSBPR01MB3575.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XDCIsqVP/JQadB/bWONeIF06Vt2a2L3UM2Mlq4tZPzRkdQnw0a7DCHkgS45ORAFVOcL+Nfn/Ly42fgLj/6Ucl+r3j4NIxDSXx0GrujGqwMvg5CEhyrXz6fSSZo8wuJqWcNZKa/sX+eRHg50sS5SfjvESuxr3PZqlp72ktp1fFeCufVUazsbYhlpeb0cgUAfg64+67Q/JIDALYtf+foGJg1/b62tn2JlSZVsgLdF+d/w/1JmOUbB8jKSokk983FSciaRQKzzuSmL7uxS7RMLA2gucJO58CjzHB/syL5gsoexXTjVMa/sMQCQyy/tR3WyG5AgkrDNYkvS66/W3w8ZMqu5GZcHnjbg3Jmuxoh73C9MgrerVknwIRqlZlo+4WsTVqZdBpzpSkjyUrP+JviLR0DJmsNqCZs5gZfxE70zNZV5zDFw9ZgEQrKInCljXVBCf6IdIsKhbVogdyHWgPcEUpKEtky6NelJ622c6mlxpSguNMpP0VQgwZ7OKiT27TaLi5jOh2YFlyReJZbt4ihesFuVSVR8M4Dh74O+lOqasDcsilteY/OvOoq7iHXj/3E4MuQnsdhi8SiWAEt3Jww2fhAgiqO+eSMbYSDwoRdLm2BY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(107886003)(54906003)(6916009)(478600001)(316002)(6506007)(71200400001)(4326008)(33656002)(53546011)(7696005)(83380400001)(26005)(5660300002)(9686003)(186003)(86362001)(122000001)(66476007)(55016002)(8676002)(66556008)(8936002)(2906002)(15650500001)(66446008)(76116006)(52536014)(66946007)(64756008)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXUveERCWndmNjhVV0lWckZySTRwaGFkditlejZDM00xS1JlZ1NKSnVwSFZ4?=
 =?utf-8?B?alNPNkFGazlnb3pQekJKYlhBMzQwbGpoRC94Y0JTNVo2amdoTWVCR2JleC9z?=
 =?utf-8?B?Mm9iNzUwcXlZVExkZWQzdDB4QllOeStocFpHd1FsK1UzREl4QkxvZys4QWRK?=
 =?utf-8?B?YnkweTQxU0ZaclQrQzR3b0E0WGlpYTlLRkpKTllyekh5a1Q0RkVwYU56VU5r?=
 =?utf-8?B?Z1Y3ajlUMmovTi90Q1RJbHJxcGdCd3B5QnUwTUIxQzdEQUd0Wi9BcTdmd1lB?=
 =?utf-8?B?Ujc4MWcybXRyb1JwbHpwQWdTdk1YakpaRkRFdGduVUR4c0Fld0lZUlB3V0Uv?=
 =?utf-8?B?bStHam5oVERZWUU0N1NNY0Z6Vmo5b2JzalFEYlpJUVlZNjZlTm90dTZVakZk?=
 =?utf-8?B?TjdHU0FxTlIyNnAwTGpLeURMdDVNeGlBdXp5WkxtZVJxREFLSjJDNit6cDhT?=
 =?utf-8?B?aXJiMDV5N3pkRk5NV3B0cHVGRE9iS1BFNVptYWsrLzY2QUVyQWxwSEZwRW9j?=
 =?utf-8?B?VlVqMlZSM0hiRk41enR4Sjl0bDQwWEsxMkV3WW5FNVhQQmdOK2FjbE9jeGNV?=
 =?utf-8?B?SFNBRUpYS0FTajlNM3F3ZTlFREVoV0MrSzNobVo0Z2YyVWtXSWFpMUwzM3pM?=
 =?utf-8?B?eXA3bGo1WEFjZjZnSjM4cndva3gzSjlGTTFPWWRxRStqdUpSdzFjQWhFZlg0?=
 =?utf-8?B?U1NwcTlxbW0yKzRDRDRzdjRFbU5SS2VTTjhXOTRsRXdhUXg3QmlxTGYvb09l?=
 =?utf-8?B?cDZ5cU1qNzdrV3p6SzFOaCtwcVRPZlhTZFFrZmtoUWN4VElsRmJML2N6eksz?=
 =?utf-8?B?MWRhZEpvUDMvcW11bHpmU0FLak1scFFrOTlwejNUWXorY3ZJczlrVHd1VlBD?=
 =?utf-8?B?SXlHQ1Q0QWh5SWJZQ3IvZGdnTk5peVhmRHlpWU9qNktGSkZNWlo3TVBrVENz?=
 =?utf-8?B?RytlRXlqSVdPYWdneXJNUUhMam1LQ3JWaEMyMnNBMGs1QUZ3QlF4UzJzaHU1?=
 =?utf-8?B?a3ZwbkhiRlJabE9NNXRmN1NHRWE0am4wTGFwZnZmRUFkNjVKZTRYNDhuU1V1?=
 =?utf-8?B?NmwxRmxLeDVvSndMN2s2NnNxZ21WM0VxNXRtK1pZK25OSWZEUGZVUmNHb2FD?=
 =?utf-8?B?SFZpYTN1cmh1MW5YMGdYdURBSFp5WW11aWh2M3NCZkRKMEUwNTlvbnVTelVS?=
 =?utf-8?B?TkhQSWdzUjhNd3R4bVJWaWxyaE9sQ0FhMW1OK2VEYmRJS3JXc1Y5MlRzclVR?=
 =?utf-8?B?VUZiNkl1N2Y1WVdHZkgzQlJIK2tMRFRNeHRPL0NiUWV1QjVSNHo4S1FhQ2RY?=
 =?utf-8?B?enhGTFhScEY0b1IzRE9xcFJ5T2RQS3Uyc3czNDRLR3ZaMDNZT3p2bTVVV0JO?=
 =?utf-8?B?dXdjV3UySk12QmhCMmJEa0pjcFJoWDJ3QllTNmwxbEJyRlU2OFgwbTFaY0F1?=
 =?utf-8?B?bW1OdXVYTU9CTExaWFZxR3pCTFREd2FSckEyVTNCcUpwOXpNdzRkVzFoVkMr?=
 =?utf-8?B?SG1aUEx6VFRybGhsSklaV1dMOGp4QkN3RENaUU5ia0dyQndPazZEU3VpVEx6?=
 =?utf-8?B?c21IRXVXenZzdTNaaXZoMi9pdU9DYkhoVVNTU1Q2YytGeUlQVzJnWjBKb050?=
 =?utf-8?B?T2N3NXZicnVGVG9CbjJsZ1k4eCtFdzlRVmhOc1ZGdE5zOEdyWktHczVhTEV3?=
 =?utf-8?B?M2xRaW1rZzB5TlBSZmZQOGsybHhKbVRlR1oxamxQVEM1ekhERVN5MnpsRk1B?=
 =?utf-8?Q?j448yLMXAS8Ta/x7tGXu4i9fWInFqI9JZJ4k8nJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84d99b4-5ffd-40d3-eb2f-08d9363cb4e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 11:47:40.9886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GOPatezTWQxGdp4Qj08obWqahZHzFRykOU+qdODsDwbx1A/cNW7GSnpyB7UUX9pHdiIOhYSsMBqGJ92mWtOWvSg5wH+kubYjWakpZqf4/Qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3575
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAzLzddIGRyaXZlcnM6IGNsazogcmVuZXNhczogcjlhMDdnMDQ0LWNwZzogVXBkYXRlDQo+
IHtHSUMsSUE1NSxTQ0lGfSBjbG9jayBlbnRyaWVzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24g
RnJpLCBKdW4gMTgsIDIwMjEgYXQgMTE6NTggQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBVcGRhdGUge0dJQyxJQTU1LFNDSUZ9IGNsb2NrIGVu
dHJpZXMgdG8gQ1BHIGRyaXZlciB0byBtYXRjaCB3aXRoDQo+ID4gUlovRzJMIGNsb2NrIGxpc3Qg
aGFyZHdhcmUgbWFudWFsKFJldjAuMikuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRo
YW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9y
OWEwN2cwNDQtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA3ZzA0NC1j
cGcuYw0KPiA+IEBAIC0zMiw2ICszMiw3IEBAIGVudW0gY2xrX2lkcyB7DQo+ID4gICAgICAgICBD
TEtfUExMM19ESVYyLA0KPiA+ICAgICAgICAgQ0xLX1BMTDNfRElWNCwNCj4gPiAgICAgICAgIENM
S19QTEwzX0RJVjgsDQo+ID4gKyAgICAgICBDTEtfUExMM19ESVYxNiwNCj4gPiAgICAgICAgIENM
S19QTEw0LA0KPiA+ICAgICAgICAgQ0xLX1BMTDUsDQo+ID4gICAgICAgICBDTEtfUExMNV9ESVYy
LA0KPiA+IEBAIC00Miw2ICs0MywxNCBAQCBlbnVtIGNsa19pZHMgew0KPiA+ICB9Ow0KPiA+DQo+
ID4gIC8qIERpdmlkZXIgdGFibGVzICovDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX2Rp
dl90YWJsZSBkdGFibGVfM2FbXSA9IHsNCj4gPiArICAgICAgIHswLCAxfSwNCj4gPiArICAgICAg
IHsxLCAyfSwNCj4gPiArICAgICAgIHsyLCA0fSwNCj4gPiArICAgICAgIHszLCA4fSwNCj4gPiAr
ICAgICAgIHs0LCAzMn0sDQo+ID4gK307DQo+IA0KPiBEaXZpZGVyIHRhYmxlcyBoYXZlIHRvIGVu
ZCB3aXRoIGEgc2VudGluZWwgZW50cnkgdGhhdCBoYXMgLmRpdiA9IDAuDQo+IEFjdHVhbGx5IHRo
ZSBzYW1lIGJ1ZyBpcyBwcmVzZW50IGZvciBkdGFibGVfM2JbXSwgb29wcy4NCj4gQm90aCB0YWJs
ZXMgYXJlIGlkZW50aWNhbCwgcGVyaGFwcyB0aGV5IGNhbiBiZSBzaGFyZWQ/DQoNCk9LLiBUaGUg
c2FtZSB0YWJsZSBlbnRyaWVzIHVzZWQgYnkgNCBkaXZpZGVycy4gU28gd2lsbCBjaGFuZ2UgaXQg
dG8NCmR0YWJsZV9jb21tb24gYW5kIGFsc28gd2lsbCBhZGQgYSBzZW50aW5lbCBlbnRyeSB0aGF0
IGhhcyAuZGl2ID0gMC4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiANCj4gPiArDQo+ID4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgY2xrX2Rpdl90YWJsZSBkdGFibGVfM2JbXSA9IHsNCj4gPiAgICAgICAg
IHswLCAxfSwNCj4gPiAgICAgICAgIHsxLCAyfSwNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0K
