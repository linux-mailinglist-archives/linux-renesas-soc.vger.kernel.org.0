Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B81942D2D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Oct 2021 08:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbhJNGk5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Oct 2021 02:40:57 -0400
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:43927
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229882AbhJNGk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 02:40:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WC9JT0nZ6+MQViRdLJa69LVjZ7gJ7Y6Z5K6GvBRHk7CfdGm5Ufv3QqQR5Nrg2Q/rJAu6FNEjdPNUs0d2Vay/9SnqmQwnVlIOyxSakX1/j4hnHD6Gkp7Ryfxtelh1DRujPWPwkB/ypEWslFBtH0L1JT5qBzQmv0ZEkrImcOLZAaCgGPjNWKjvorJUlZQ5glkmvbmi3vpzKsHBOZ5ehC8hDfItLso+OncThGzukfRWkfD+CVtq7U3sOiDgYMETXLmcJWW0uQi2dR0V2AMPcSm/uI6euuFFyeK85l+doJ97O/ODYw1zqSuPt0GKH4gPIYJu3w72bb7YT6gCJUpL2ldf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWCphl7PQP/n8pcvSPvtmFzRdeO3dXBXFzsOZHALiNs=;
 b=Lc8JNRkRkO/G9y3JfUxnJSX4CCjg6nOzb9y52EHGuVecKNG+/PwfGgJ6dIlUdAG8YoWdCb/+KcOc2/3LpeLAIFrzNI/Dl6w2FCRtnkAMPjjtcJz45vgEYN1o9djovq5jBDMDjGzlDDEQfrRcc58QZ/V6pD4zIBdd0QVWZ0PJrrhXLiA/qlfT7AaEQNh0UMJFPcK42og7PTymEFaluKQcP+tQgJC7Fjue49ZQ77d5EFwQeTFfZvNhjc8e1bGu9D2gmBPbEr+As9OcX/+IIONcYWS8P4gK4mkdneSq5sO3KjdDBxdaneZQpRlXitdaq6agqQwYY6ZWkMxNBkY/IKT/+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWCphl7PQP/n8pcvSPvtmFzRdeO3dXBXFzsOZHALiNs=;
 b=EO598NbquDY7FzRWMz//Mcz49sATrNiXAazRKyqUJ+Zw56hoH+SffuUPqUi6K+tqpxFVKUjSZ2Fs5IZRXyrWQ7n5fYFKlu1sqjGFVsBcNwJH409PsvIIepdyC8yX5DcGN03z9NbEjbdlwLQyW/OlEd32Msm5MfAGc8nP5Sb9M2s=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYAPR01MB4878.jpnprd01.prod.outlook.com (2603:1096:404:129::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 14 Oct
 2021 06:38:47 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::4bd:455b:9efb:b62b]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::4bd:455b:9efb:b62b%7]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 06:38:47 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 2/2] arm64: dts: renesas: rzg2l-smarc-som: Enable
 Ethernet
Thread-Topic: [PATCH v2 2/2] arm64: dts: renesas: rzg2l-smarc-som: Enable
 Ethernet
Thread-Index: AQHXwAfmqVkJJKe3z0y+/CfZe8S1b6vRMUIAgADSXPA=
Date:   Thu, 14 Oct 2021 06:38:46 +0000
Message-ID: <TYCPR01MB59337C3D776218147060E7A986B89@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20211013075647.32231-1-biju.das.jz@bp.renesas.com>
 <20211013075647.32231-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXkYQap_oDvH1RqHHt454hX73BDWfRZu=hLGnrkipZgUw@mail.gmail.com>
In-Reply-To: <CAMuHMdXkYQap_oDvH1RqHHt454hX73BDWfRZu=hLGnrkipZgUw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2679b4b-4b51-471a-0870-08d98edd4675
x-ms-traffictypediagnostic: TYAPR01MB4878:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB487897B6030F8635EC24457886B89@TYAPR01MB4878.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EisNbxQf6hw4NSiDfucr14SuQ8bTwTydJiqdzvogF0oijDjssL2gc1FIMWa1KbdfYLV7YDwoDymlh2OmkC126gfD8mdVWWcuPyOdSVl2sjBa8XNUOjO7aVyCbxRo2WmhGSycsX/ap+WNEfHQRp36dn8PH8h9/1W9lqsF5d5tRAE0QJzYeNy5VH0/xj9Noh5PZuLiWGomUFAT1I/SpuVjiZSIiaIzwE8dUZBuPkh4QisbgNb9R4wMG3pC1u920qDdo+9v5M49tSVionUnlrFSqaJKpE8EXBb65ilutHdr7ND+IncnD0LZuXRV8m7C0sgfo6wpl6HaeOTA9Y4laopM+e9t8jjU8seeCbYYBLkQojyFu8P3qwC/Mc4hVrAH3yRQWumaBnlc82NnurjR8rqY7tCgDKIzZyxO97de36/VEkOdx/JUs27iIDWIvUCSycJnUuBG9mbxKbMelQxPdwJntuWDUex3/FP4VTTJC2I/nkwLr43CCztKsaCfDFRyBpd2dax0FsS1A9f1ifHZXQM6it4GP4XMDE14Qt9iLmUgHeCzW7NIVZcGodQ2a/67gKJDMpKDaEqsfAYnmPuK6ibjj2UAd5XGYvYhdqftq3S5EY9d8im9PvRusUdP+sM/Trv32L081KU8pCiEBeAjC5gzOCEyQFGxqymWlfhHT1j/Vf5QnjlZdqwM5XOluNKgVGXFKpHToVeFvkQljqSgIrfuWQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(107886003)(122000001)(8936002)(6916009)(83380400001)(55016002)(26005)(508600001)(2906002)(8676002)(54906003)(38100700002)(4326008)(52536014)(38070700005)(64756008)(66946007)(66446008)(66476007)(66556008)(6506007)(7696005)(53546011)(186003)(33656002)(71200400001)(76116006)(9686003)(316002)(86362001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGF3VFRZL1JEMTF4UkFDQ0ZSY2NvcmEzM09rakkzNGZHRGNZR3V0a2VQa3VY?=
 =?utf-8?B?OExMK05oK0hNQUI3UFdNQlg2ZXphOUg4eDltd1E3RUlISjBBVk9RUmZCR1Vy?=
 =?utf-8?B?T3ErQjBUV0wyTVo5Lzk1NnptM3ZyT0JBSVoxSVRxZ01KbWRkS2ZIci9iY2R4?=
 =?utf-8?B?QmxnSlppNGJkcXZGU2FxZHdjYlZNejlqZ1NScEVoblhkRkpiY1N4NjY5TlJW?=
 =?utf-8?B?cFA1NkREZ3ptbTJxRHhPcUV6Mnh6RHV3YnZCNXJVd1c5aHJxZXpRZDZaeWM0?=
 =?utf-8?B?SVkxN21lY2l5VUNwRHo0dTl0V2xYVW9vQThJZkV6SXlXY2RWZEZGaVFwS01Z?=
 =?utf-8?B?bjRZT0plYlVoOHlySUdTeTZnazZWMTVmS2VtS3BkN3p2SER0d2UySEMrbWpk?=
 =?utf-8?B?eERhVkEwcE52dzdhV2luZGlMWkVkN1RGWUtaTUJUVDBoSGh2SFNhSm52bjk0?=
 =?utf-8?B?d283VnlHVVAyYUwvYzJGcHZWdVUvcU1BN2YxaFNXNFFYZy9CSUsyMHg4YXdL?=
 =?utf-8?B?TkRSTkRULzQxS295enJ5aDQ4NWVoVERHd29tdlJCVGd2Z1ZTVmVOZmRLYmd3?=
 =?utf-8?B?eS85ZkoyTEpjdDhpV3lYZ2pTQS9EY1dDSS81QU9ZT0dBTXpFSGtxUmwyWUtY?=
 =?utf-8?B?Qm9NOHNCVU5BeTZlalFUT2kxVGFVeEowWUVmYmdvNWk4a3d3V3NNUnBqV21t?=
 =?utf-8?B?WHhTWTZQMmRpVmM5YU4rd0dvZVg3dXU5WXFvZi9nUHoyY25vM3hCSHJrb0Fr?=
 =?utf-8?B?WXI2RUdabm1PZFcrQTdYUkZHUjRobGdKNkY1YWRDOWZFOVQzUytJeGpjcWYz?=
 =?utf-8?B?T0tJVHBWK28wSlVFVVlyaXhTRWtHRVlRTmhMRXFQZXVQb1dkQUFEZU0zSm5H?=
 =?utf-8?B?TEQxalRHVmJtZDlFUzU0N3dIVXFPTVNJRmtqbVB0MVV6S0NTOUk1SDVSVnBF?=
 =?utf-8?B?K1g0VTZEakVadm82SVJVTGM3RHA0YlJDQzVRY3ByMlV1WkpEdm1yN0RsbEcz?=
 =?utf-8?B?Z2dlWXpta09KbmFNZFBRbklELzZHMDFTZ2FXQS9qVTF5aCs4eGhNeXlPLzAw?=
 =?utf-8?B?c3Eyd1d3M0pWOE42Tkw1UlZFM2pBUEVYV1ZyRE0wcjgwdlVoNjVSVTdUSjgv?=
 =?utf-8?B?ZVNGM2xxcWFhYTVrQzAvanZKT3I4Mk5tT3hRUjVJMWU1OG0vdWhKaVRpSGpR?=
 =?utf-8?B?SE5zNENLMGVQeWFjaHJiRVk1VnJxV2NxWFR2UkJXVGVNRmZlMm5sYnVpc0Fs?=
 =?utf-8?B?SlYrdjBGZnhtT2thK1RIdFJmNXZqam1FUllpdTExUFR3c2VDa0FaY2FxN1o1?=
 =?utf-8?B?emw4YnRCUTBuaXlPaG9EOHFPalg4bWRlVWJVVnRtL0lUM25BUHE5R2FjMEVF?=
 =?utf-8?B?d2hyTjhyQ3Z2bVFWTnRDVytPMjAreGJHNEdNdlR2YjkwTzFzU1NiNnRPMWI3?=
 =?utf-8?B?OXErWDJKSnhFNWEwWlQ1bTZ5WDBmRXZUTnNlL21raWR1bmRyK2puVkU4UWFv?=
 =?utf-8?B?cFlDNG03b2V3ZHRLSG40UzhDS1VpU01NZ2dQNUVhQWlsbVVIa1UvbEZQbE9y?=
 =?utf-8?B?emxaaWdXT3hIbTUrZXpVVFM1aUp5WTgrKytDcFhWL1RQRnBRaWEyNzVCSDVZ?=
 =?utf-8?B?bk11dk5nTWNLblVKUXN0Wnl0NytIUDMrWDBpQlpOMytjSWJoYU91czZDbnE3?=
 =?utf-8?B?OG9SUGxhTXpwMGxyb1J2UmVxTjdBL0hXdlFGTzRaMXN5bDJNYkg1TGkzdGJ2?=
 =?utf-8?Q?NNV9dtDdJGOnzavrac=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2679b4b-4b51-471a-0870-08d98edd4675
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 06:38:46.9372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ple+hmIp4ZZDwFtPAmJLdcOqrHR3ryXKmZBuOcdOrOrg2/P7+fuGUjO3tj43DvlZ1uctxcI37XnlaSjv2Pe2Mv8glA1pmgKegATRyZUWawU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4878
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMi8yXSBhcm02NDogZHRzOiByZW5lc2FzOiByemcybC1zbWFyYy1zb206IEVuYWJs
ZQ0KPiBFdGhlcm5ldA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgT2N0IDEzLCAyMDIx
IGF0IDk6NTcgQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90
ZToNCj4gPiBFbmFibGUgRXRoZXJuZXR7MCwxfSBpbnRlcmZhY2VzIG9uIFJaL0cyTCBTTUFSQyBF
VksuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zbWFyYy1zb20uZHRzaQ0KPiA+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zbWFyYy1zb20uZHRzaQ0KPiANCj4g
PiBAQCAtNjUsNiArNzQsNTggQEANCj4gPiAgICAgICAgIC9kZWxldGUtbm9kZS8gY2hhbm5lbEA3
Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gKyZldGgwIHsNCj4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwm
ZXRoMF9waW5zPjsNCj4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4g
KyAgICAgICBwaHktaGFuZGxlID0gPCZwaHkwPjsNCj4gPiArICAgICAgIHBoeS1tb2RlID0gInJn
bWlpLWlkIjsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKyAgICAg
ICBwaHkwOiBldGhlcm5ldC1waHlANyB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAiZXRoZXJuZXQtcGh5LWlkMDAyMi4xNjQwIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiI7DQo+ID4gKyAgICAgICAgICAgICAg
IHJlZyA9IDw3PjsNCj4gDQo+IEkgZ3Vlc3MgeW91IGRpZG4ndCB3aXJlIHVwIHRoZSBQSFkgaW50
ZXJydXB0IGJlY2F1c2UgdGhlIHBpbmN0cmwgZHJpdmVyDQo+IGRvZXNuJ3Qgc3VwcG9ydCBpbnRl
cnJ1cHRzIHlldD8NCg0KWWVzLCBUaGF0IGlzIGNvcnJlY3QuIFdlIGFyZSBsYWNraW5nIHBoeSBp
bnRlcnJ1cHQgc3VwcG9ydC4gT25jZSBzdXBwb3J0IGlzIGFkZGVkIGluIHBpbmN0cmwgZHJpdmVy
LCB3aWxsIGFkZCBwaHkgaW50ZXJydXB0IHN1cHBvcnQuDQoNCj4gDQo+IEFuZCB3aGVuIHRoZSBW
ZXJzYUNsb2NrNSBjbG9jayBnZW5lcmF0b3IgaXMgZGVzY3JpYmVkLCB3ZSBuZWVkIHRvIGFkZCBh
DQo+IGNsb2NrcyBwcm9wZXJ0eS4NCg0KQWdyZWVkLiBXaWxsIGFkZCB0aGlzIHdoZW4gd2UgYWRk
IFZlcnNhQ2xvY2szIGNsb2NrIGdlbmVyYXRvciBzdXBwb3J0IGluIG1haW5saW5lLg0KDQpSZWdh
cmRzLA0KQmlqdQ0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICByeGMtc2tldy1wc2VjID0gPDI0
MDA+Ow0KPiA+ICsgICAgICAgICAgICAgICB0eGMtc2tldy1wc2VjID0gPDI0MDA+Ow0KPiA+ICsg
ICAgICAgICAgICAgICByeGR2LXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAg
dHhkdi1za2V3LXBzZWMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgIHJ4ZDAtc2tldy1wc2Vj
ID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICByeGQxLXNrZXctcHNlYyA9IDwwPjsNCj4gPiAr
ICAgICAgICAgICAgICAgcnhkMi1za2V3LXBzZWMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAg
IHJ4ZDMtc2tldy1wc2VjID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICB0eGQwLXNrZXctcHNl
YyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgdHhkMS1za2V3LXBzZWMgPSA8MD47DQo+ID4g
KyAgICAgICAgICAgICAgIHR4ZDItc2tldy1wc2VjID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAg
ICB0eGQzLXNrZXctcHNlYyA9IDwwPjsNCj4gDQo+IFNpZ2guIFdobyB0aG91Z2h0IGl0IHdhcyBh
IGdvb2QgaWRlYSB0byB1c2UgKi1za2V3LXBzZWMgZm9yIEtTWjkxMzEsIGFuZA0KPiAqLXNrZXct
cHMgZm9yIGFsbCBvdGhlciBkZXZpY2VzPw0KPiANCj4gPiArICAgICAgIH07DQo+ID4gK307DQo+
IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4gaS5lLiB3aWxsIHF1ZXVlDQo+IGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY1LjE2Lg0KPiAN
Cj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
