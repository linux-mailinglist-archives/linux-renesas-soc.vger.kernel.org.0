Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A3B3B1A3F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 14:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhFWMfp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 08:35:45 -0400
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:55089
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230121AbhFWMfm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 08:35:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4mqgS7fYX4y0FzcdFCrHVvwZojLP3OnIeEXyiqrhLREHVVATkSUwILQG53WrSG7/+M7SxQgaVmqeb/dQOjw3qC8GuzsnD9pJd02to28N9sYMPM21BeRiYbdTkrEprzjCk+esy2h97ZQlukgf2D0RHfUvHQ0XiXzF690YZjqso16RIdNMQhUMQyI8+4q7Ue1CCfipz4IrDCkAzJ3nQhs1aWBSE+3Wpm5msGDOowNVVIyNqR3ih8AsNhBv0wdZeigmhIWFC4fwgn5U4yBiBMnfaYAITSai/FzCoB5sUO6zjWjHKdotnY8GtdMDzIaijRgq7hyyx8FjexnJraxWErqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUEQMZCGdMGutzkILfmpufB2LuCjcygIZR1BhQWdsH8=;
 b=L3xwgKZbpRxL2Sv1Geg6c1dR1siPzW882uXzr4GUPVb04DhJ3UFtB02WKInOasruD5kKKMzfaho55ce+kw5GAd26WF1VBn1l0omPER319ZNPui4EMQ/sWKBojLoq1IVUAXUWx6bUGmhMdFGs8V3MJ3AvKhMblLOO8I1n+8YAdQO8B1Hodb4GImX+mOvGlT6m2Dup8Wi75hFypuZ1J9PUuxU+jOorJhRHu2nB5VRx5TcQOz607PcXZ2kxe6aLqY0f5K1rchz4ag/Ydr54obQfKJnhZc63zvf2AJ1vw7e6VTBLYN1Z6QsHPooAR3TBtLCn5G5Bi4zSW5pNZkES/l8yug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUEQMZCGdMGutzkILfmpufB2LuCjcygIZR1BhQWdsH8=;
 b=coSmCoaZPef6jmpUCtUtuz9r5KwXWJf6THjpsjSXIUBOqHKpThZeKesMfGq/rOo8zHxvB3tB6PMTnC86nXvmY8iVKJ8+reyXaPpk9JJvjDaiT+4lP5t9MhpJkgAqce2vtLg8O1lIkWs2mewpjYK9jhITX7tO1/yt2loX9hXn6ZA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5958.jpnprd01.prod.outlook.com (2603:1096:604:d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 12:33:22 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 12:33:22 +0000
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
Thread-Index: AQHXZCh/26TZFnVapkasoStZW/+B+aseoZsAgAEjxUCAAF/wAIABTkKQgAASqICAAAUSQA==
Date:   Wed, 23 Jun 2021 12:33:22 +0000
Message-ID: <OS0PR01MB592297D57EE7BEFD4E63A4D886089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
 <20210618095823.19885-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXLrfU99sQCbwLFifqrV4B94pzGi_DWbBvpS4-Y=Z09RA@mail.gmail.com>
 <OS0PR01MB5922B821B3893BAD08D2573A86099@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWQK_k3ePJpx2CF-X9TNgPYzzP8AW9N2rDjXSOAP2wNxQ@mail.gmail.com>
 <OS0PR01MB592205558A2738A271D727D486089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWqknU6TAauueUHcCMh0cXOn7Xwy_HrnVM5-q7GX2UMaQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWqknU6TAauueUHcCMh0cXOn7Xwy_HrnVM5-q7GX2UMaQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 765b96ae-6408-4171-867a-08d9364316e2
x-ms-traffictypediagnostic: OS3PR01MB5958:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB595845063D4821BA6DEE303686089@OS3PR01MB5958.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vD1Ib0QxnAznhPj9KY8wiolA03GE9n5OxeM8YaV5uKdCynF8Y7sT49MkrGdTnKNd6emkhOVVlkq7bCcty3Yyu/+Rbs0Q+jsG2Y05she0GiU60p/sQotiba8ObrwzAUoG+C6pABpzhAhPbePn2lz/M2tRKLA0y+KOIQjtP5lTnhcrwsKEQZsKtRW8+WOuw/4vFx1dfgVNuM5/dlTLowUfrWnpEp+LHvLIdqQIQsD4shNkOEqvm27iR3+s9iTL/urjADN/gFtbuNHO+W8tHuvzvhrtkBroBtELWFxBwI+7TTOrHSdhr8cAHlKk2D8gZ3CgjE4OWmItrtFZGME//0jNOcQt5+Pm+H3vzCflHVTjQ/lvjq+MXx5NG8fHKcTJAsidCF1bSFIchwee44LMFADSxEE/Ba2TXZxktl5KOW5JXDDgCBPeu6IutvAVzFPfoxfB/ZZbrHPBvtrn3xtMGhFFsNqk03Oc2ZI0OhrXe1eI/xab8LqEPuw/T9iAo1pUUvC+mXOUSqqKvOaTyNkpWCjjtChqMpkCGRGJgW9k9PhQKvpWRHb/q/leqh+iaoppdsH8oXu5SXnoYNa5A6cRlUPp+kHyQx9LkE/2TU+tKLrvVYNchaUgddhrwm4qyV/1cZkEqZqm7hCiuD2RJdSaeBoP0DJ1sy4N/qSHRBMOewGUXsc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(38100700002)(83380400001)(26005)(122000001)(8936002)(53546011)(4326008)(6506007)(71200400001)(8676002)(55016002)(186003)(2906002)(52536014)(316002)(76116006)(6916009)(66556008)(54906003)(9686003)(66476007)(66946007)(66446008)(64756008)(15650500001)(478600001)(86362001)(7696005)(33656002)(5660300002)(449214003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmhWWFRhbksrQ3A3RldnS1JReXJ0S0YvY2NrNVRyV3dhQlNJSFdhL25DZXFM?=
 =?utf-8?B?ZDhpREdmU2xOZC9GcWNab2lZc0taOEYyMHJCOTZJbGNKejhjZ2E1RHpucDFt?=
 =?utf-8?B?SjFlRE9wc2FJOHlsWCtQRUdFQTc2a0hkV1NzdnowNUVpQjRIUnFXdWRrdGpo?=
 =?utf-8?B?dHB6dXFUYU1pZ3VJdk1oYzF1TE83b3kzTUR2M2E0MkVHMHl4Q2p2TlpCUFJP?=
 =?utf-8?B?RkZTWVlPVWs5WDk1RE1zOXl3MmVDSkMyQ3p6d2RqU3V0cGd1emtzTmFDZ3o4?=
 =?utf-8?B?N0VweUlHTDA4VGl5d3p3TC9XalppL1FWMXp6ZHZyOU9Ea3A5TlFkOHEzSUhW?=
 =?utf-8?B?VFlhQ2E1M1hmc0V2akhVQnh3cEJ1V1Qzd1U5TWFVem9WZGdiRUJEMVFxUVNS?=
 =?utf-8?B?ZXRPOTZ1eURpNTRKZzhEOWNndlRrQ1FaMjdWV1VzbGZLQnZsQkJDbXlaWFhr?=
 =?utf-8?B?RS9LYkJyVVpkVm5VOE5yVnhzSmozT3h0b3RtNDFjZEZ2clhNWFNFcUFUdlht?=
 =?utf-8?B?Tk5PbkxRK1ROZjIxTmVsUjdxZ3ZkSHFGV3VORGtyVEpIZmdMNFZsQU9kSDBl?=
 =?utf-8?B?WnR2V0xlYWdFWlNGdTdhUXJvVkFVQnc0UWlGNHdpdmZLeTExdHUxdjFvb2Qr?=
 =?utf-8?B?Zkx4VmxUOVZYNldBdzd2Qm9wNlA4ajRsaFhCRlBRR0IvZUJnZzJhWHNRNEtF?=
 =?utf-8?B?UHQva1FFSnpLRENzdE4vOTJiVkNHMXVzaElSc1dBVVZ6T1NwQnkwelNxeTRR?=
 =?utf-8?B?QXR3WThBMlJnUjZzV2JPRG9nUkNXdHF6SXJYVTArSmNmK1RnaTZOQ2FwRjlR?=
 =?utf-8?B?VXVkcEJGRlR1bnp4dE0zQkhrZXNqYXk0YlRKaGZDbnJsSkpJU0VLbkh4MEpD?=
 =?utf-8?B?STBkdGtyc0xwZ1krMHFqekg3Q29JeFhpMVFlNUZMVGJkN3lRcnkyR1dkYUU5?=
 =?utf-8?B?aTlqYTJIVEZ2a01MeXdxUkhTZE01RHI4cHhLYnJOclRHWDZQMUxmWHNrQW1o?=
 =?utf-8?B?a2lRVEFtYzZGdmgyV0JyWlFjM2EvTGxjRHF4d20rV0xSbHNCUElXbzNwNldL?=
 =?utf-8?B?aDVqOHRCalhmc2hqQ2t2SzRMV1c3Z294Qk9KRFhtd2RPb1ZwMmI0M295RDVS?=
 =?utf-8?B?ZWhGSnQwdVExNzF4UVptVk5GRGpJN1VGMzZaOFdaSkEvVWJmQUF4UjRDR1h1?=
 =?utf-8?B?NWVvVnhvbnNvcm9GL0U0aGpmV0QzNGJId3hDaStqa3R6TFp6WkxlMVNVSFBV?=
 =?utf-8?B?Z3lWTkkyd0RsSDdKeUoyVEo5clp1cFdOdGwzUkFPbHVvV0JxTGZ1TWJqYkNJ?=
 =?utf-8?B?TmRrSDRJSGUvWDlaVjV6elAyaStZakVzQUd3SlhzekMxczVBc2VXNGI4RjVt?=
 =?utf-8?B?TXVpZmM0VU5FdmQ0ODNhMjJYV2hKaFZzd0JBMjgxNlZycFpMZjNLVHZlMEIr?=
 =?utf-8?B?akMyS3o0Yy9sZG5SWTRDanRkV09LMDR3RXlIZHE5ZjhSRDVvQ2Z4R1VkNWVT?=
 =?utf-8?B?RkI1cE5CKzFNL29GZHdZYWtvVjlCVTFRVGNyd2o5aG5sR0xhTnVPSXZpeldS?=
 =?utf-8?B?YStsZlFNZTlVS1NZVzNqekN5cC8zYU1TcFM3VGE0ckFWYWxyMkJFQkhMczVH?=
 =?utf-8?B?UGp0Mm00TlRua210V29jYUJXSVp2akR4ci9QdTdDRHhXZmVWS3prUzV0ZjdS?=
 =?utf-8?B?K3drY3ZDQWU5c2RZc3U2ZjBucXAydTBpdmZBT282ek5rLzc4Nm9lMmlCbGVD?=
 =?utf-8?Q?92R2EP0OI8JJ57sM/CirvjKroaPN+QPK71fmoqa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765b96ae-6408-4171-867a-08d9364316e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 12:33:22.0824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zv2Kl8jIOs3PLJuqgsf9Dwwk8QtZW57BEys56uQqz9UhdEdUAV8zsfOXvWV3mHUgCf7JeDy8KdRyq8pnDCe4OyR1/fAHXc551NMi7ghAhvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5958
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIzIEp1bmUgMjAyMSAxMzowMA0KPiBUbzogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVs
Lm9yZz47IFByYWJoYWthciBNYWhhZGV2IExhZA0KPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJq
QGJwLnJlbmVzYXMuY29tPjsgb3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EDQo+IEZMQVRURU5F
RCBERVZJQ0UgVFJFRSBCSU5ESU5HUyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBDaHJp
cw0KPiBQYXRlcnNvbiA8Q2hyaXMuUGF0ZXJzb24yQHJlbmVzYXMuY29tPjsgTGludXgtUmVuZXNh
cyA8bGludXgtcmVuZXNhcy0NCj4gc29jQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAxLzddIGR0LWJpbmRpbmdzOiBjbGs6IHI5YTA3ZzA0NC1jcGc6IFVwZGF0ZSBjbG9j
aw0KPiBkZWZpbml0aW9ucw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgSnVuIDIzLCAy
MDIxIGF0IDE6MTEgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3
cm90ZToNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS83XSBkdC1iaW5kaW5nczogY2xrOiBy
OWEwN2cwNDQtY3BnOiBVcGRhdGUNCj4gPiA+IGNsb2NrIGRlZmluaXRpb25zIE9uIFR1ZSwgSnVu
IDIyLCAyMDIxIGF0IDExOjI2IEFNIEJpanUgRGFzDQo+ID4gPiA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDEv
N10gZHQtYmluZGluZ3M6IGNsazogcjlhMDdnMDQ0LWNwZzogVXBkYXRlDQo+ID4gPiA+ID4gY2xv
Y2sgZGVmaW5pdGlvbnMgT24gRnJpLCBKdW4gMTgsIDIwMjEgYXQgMTE6NTggQU0gQmlqdSBEYXMN
Cj4gPiA+ID4gPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gd3JvdGU6
DQo+ID4gPiA+ID4gPiBVcGRhdGUgY2xvY2sgZGVmaW5pdGlvbnMgYXMgcGVyIHRoZSBSWkcyTF9j
bG9ja19saXN0KFJldi4wMikNCj4gbWFudWFsLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+
ID4gPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+ID4gPiA8cHJhYmhha2Fy
Lm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhh
bmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAtLS0gYS9pbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL3I5YTA3ZzA0NC1jcGcuaA0KPiA+ID4gPiA+ID4gKysrIGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9jbG9jay9yOWEwN2cwNDQtY3BnLmgNCj4gPiA+DQo+ID4gPiA+ID4g
SSBkbyB0aGluayB3ZSBuZWVkIGEgc2VwYXJhdGUgbGlzdCBvZiBkZWZpbml0aW9ucyBmb3IgcmVz
ZXRzLg0KPiA+ID4gPiA+IFdoaWxlIHNpbXBsZSBtb2R1bGVzIGxpa2UgU0NJRiBhbmQgSTJDIGhh
dmUgYSBvbmUtdG8tb25lIG1hcHBpbmcNCj4gPiA+ID4gPiBmcm9tIGNsb2NrIGJpdHMgdG8gcmVz
ZXQgYml0cyBmb3IsIHRoaXMgaXMgbm90IHRoZSBjYXNlIGZvciBhbGwNCj4gbW9kdWxlcy4NCj4g
PiA+ID4gPiBFLmcuIFNESEkgaGFzIDQgY2xvY2tzIHBlciBpbnN0YW5jZSwgYnV0IG9ubHkgYSBz
aW5nbGUgcmVzZXQNCj4gPiA+ID4gPiBzaWduYWwgcGVyIGluc3RhbmNlLCB3aGlsZSBDQU5GRCBo
YXMgYSBzaW5nbGUgY2xvY2ssIGJ1dCB0d28gcmVzZXQNCj4gc2lnbmFscy4NCj4gPiA+ID4NCj4g
PiA+ID4gT0ssIEFncmVlZC4gV2Ugd2lsbCBsaXN0IHNlcGFyYXRlIGRlZmluaXRpb25zIGZvciBy
ZXNldHMgbGlrZSwNCj4gPiA+ID4NCj4gPiA+ID4gI2RlZmluZSBSOUEwN0cwNDRfUlNUX1NESEkw
ICAgICAgICAgICAgIFgxDQo+ID4gPiA+ICNkZWZpbmUgUjlBMDdHMDQ0X1JTVF9TREhJMSAgICAg
ICAgICAgICBYMg0KPiA+ID4gPiAjZGVmaW5lIFI5QTA3RzA0NF9SU1RfQ0FOICAgICAgICAgICAg
ICAgWDMNCj4gPiA+DQo+ID4gPiBQbGVhc2UgdXNlIG5hbWVzIHRoYXQgbWF0Y2ggdGhlIGRvY3Vt
ZW50YXRpb24sIGxpa2UNCj4gPiA+IFI5QTA3RzA0NF9TREhJMF9JWFJTVCBhbmQgUjlBMDdHMDQ0
X1NESEkwX0NBTkZEX1JTVFBfTi4NCj4gPg0KPiA+IEp1c3QgcmV0aGlua2luZyBieSBsb29raW5n
IGF0IFItQ2FyIGFwcHJvYWNoLCBXZSBtYXkgbm90IG5lZWQgZGVmaW5pbmcNCj4gcmVzZXRzIGlu
IGR0LWJpbmRpbmcgZmlsZS4NCj4gPg0KPiA+IFdlIGNhbiBjcmVhdGUgYSAxNiBiaXQgdW5pcXVl
IGluZGV4IHdpdGggcmVnaXN0ZXIgb2Zmc2V0IGluIHRoZSBsYXN0DQo+IDEyYml0cyBhbmQgY29u
dHJvbCBiaXRzIGluIGxhc3QgNCBiaXRzLg0KPiA+IERldmljZSB0cmVlIHBhc3NlcyB0aGlzIGlu
ZGV4IGFuZCBkcml2ZXIgZXh0cmFjdHMgdGhpcyBpbmZvIGZvciByZXNldA0KPiBoYW5kbGluZy4N
Cj4gPg0KPiA+IFRoaXMgd2lsbCBhdm9pZCBkdC1iaW5kaW5nIGRlcGVuZGVuY3kuIEFyZSB5b3Ug
b2sgdGhpcyBhcHByb2FjaCBmb3INCj4gcmVzZXRzPz8gV2hhdCBhYm91dCBjbG9jaywgZXhpc3Rp
bmcgbWV0aG9kIG9yIHNpbWlsYXIgMTZiaXQgaW5kZXggbWV0aG9kPz8NCj4gPg0KPiA+IFBsZWFz
ZSBzaGFyZSB5b3VyIHRob3VnaHRzLg0KPiANCj4gSSBkaWQgY29uc2lkZXIgdGhhdCBvcHRpb24s
IHRvby4gIEhvd2V2ZXIsIHlvdSB3b3VsZCBzdGlsbCBuZWVkIGEgYml0IG9mDQo+IHRob3VnaHQv
cHJvY2Vzc2luZyB0byBjb252ZXJ0IGZyb20gcmVnaXN0ZXIgb2Zmc2V0cyBhbmQgYml0IGluZGlj
ZXMgdG8NCj4gY2xvY2svcmVzZXQgbnVtYmVycyBhbmQgdmljZSB2ZXJzYS4NCg0KRm9yIHJlc2V0
cywgSSBoYXZlIG1hZGUgc29tZSBwcm90b3R5cGUoSTJDL1VTQikgd2l0aCBib3RoIHRoZSBvcHRp
b25zIGFuZCBpdCB3b3JrcyBPSy4NCg0KSTJDMC0tPjB4ODgwMCAoT2Zmc2V0Oi0weDg4MCwgYml0
IGluZGV4OjApDQpJMkMxLS0+MHg4ODAxIChPZmZzZXQ6LTB4ODgwLCBiaXQgaW5kZXg6MSkNCkky
QzItLT4weDg4MDIgKE9mZnNldDotMHg4ODAsIGJpdCBpbmRleDoyKQ0KSTJDMy0tPjB4ODgwMyAo
T2Zmc2V0Oi0weDg4MCwgYml0IGluZGV4OjMpDQoNCkZvciBVU0JIb3N0MCByZXNldDotIDB4ODc4
MyBhbmQgMHg4NzgwDQpGb3IgVVNCSG9zdDEgcmVzZXQ6LSAweDg3ODMgYW5kIDB4ODc4MQ0KRm9y
IFVTQmRldmljZSByZXNldDotIDB4ODc4MyBhbmQgMHg4NzgyDQoNCk9uIHRoZSBjb2RlLCByZWcg
PSAoaW5kZXggJiAweGZmZmYpID4+IDQ7IA0KICAgICAgICAgICAgIEJpdG1hc2sgPSBCSVQoaW5k
ZXggJiAweGYpOw0KDQoNCj4gQ29tcGFyZSB0aGlzIHRvIE1TVFAgY2xvY2sgbnVtYmVycyBvbiBS
LUNhciAoYW5kIEdJQyBTUEkgSURzLCBhbmQgRE1BDQo+IHNsYXZlIE1JRC9SSURzKSwgd2hlcmUg
eW91IGNhbiBqdXN0IHJlYWQgdGhlIG51bWJlciBmcm9tIGEgdGFibGUgaW4gdGhlDQo+IEhhcmR3
YXJlIFVzZXIncyBNYW51YWwuDQo+IFNvIEkgdGhpbmsgaXQncyBlYXNpZXIgdG8gaGF2ZSBhIGxp
c3Qgb2YgY2xvY2sgZGVmaW5pdGlvbnMgaW4gYSBkdC0NCj4gYmluZGluZ3MgZmlsZS4NCg0KT0su
IEkgd2lsbCBzZW5kIFYyIHdpdGggdGhpcyBvcHRpb25zLg0KDQpSZWdhcmRzLA0KQmlqdQ0KDQo+
IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
