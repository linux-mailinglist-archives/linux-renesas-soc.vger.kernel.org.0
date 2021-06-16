Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA423A96FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jun 2021 12:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbhFPKO6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 06:14:58 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:15102
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231452AbhFPKO6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 06:14:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGDt+uX1lidvjoRbe0XbVs+l4xl6CGSHVAuK12FzwF6NPhThD7OGh/GmCGQLJZwU4NxrPAF2x8vzrz0ltjPmbjkIOnmFXPHvIjJAXbsIY0bfzfGrzD4pp8lCZvifxfzS4jfNJH9r4o/RazFDjo5538+Xlc1L1Bjh12g8rptMthExyeUWKK7w+6pe1uOQ7+J9bkCQW8SUWBw1tS9GPlJ1RuXOgZg1qWspyS/4h+sWFnlpowrDbaQqot5bfvz2K6U5bG5SoLZmqY0NUd9wv77HYvYMVtZKJ8XVol2K9b/7KKuxrfV5rotIHDkbzLxAsabrvibOke8RjiVyudN1B3q2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNKrLSsYvTo3JeuCJsA0DmMOqrULKfUgetU4FTQfRUA=;
 b=M/U0f0qj1DDoOpSt1A4m4RYT3brTzLC5WSAONOJBu0DMr89iUueY46D44qpH1RkxBQ4zR49VcO6UTkBa5ryiGoc53DrZeXPhM0NljiCL3clXugLYQUvQ8ewzqy9ZJzbmstMSw9B0gLoH+vfCC4nf3zRnt/1DazlxQqygnmVMDthU4l0Cm0tKhXsPvpX0TcBzM62zv/yM5ZQE1eNQvVqpsJkeD9h0kOqeGQgn/iKOWRboxRZTe6d7vBepjyzFnptd847p21OPcPUqfs61MlmT0+15wkAAsasHTIO2Io38Zs9M5etyVqaM/Ex1Jdge6nDQvkrxj5DoHwnOUOq53Lq6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNKrLSsYvTo3JeuCJsA0DmMOqrULKfUgetU4FTQfRUA=;
 b=q0qvurBOUt7+9Zeg+FcVviggk7dPacNSTkc8d1lw9RrKtFwAMhhS5Jybk7ULra1z1aXY9BaWgj0wfmPKadyEzaAEUUA91IKW1AuIH86b9kyQkL4SymkuifEXQWCyrTmSUfraT20m4a3VqWRr0v2astt+ETfbb0rF8BJH6H1/gE0=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYBPR01MB5344.jpnprd01.prod.outlook.com (2603:1096:404:802f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Wed, 16 Jun
 2021 10:12:50 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::d47c:6365:dc20:bb]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::d47c:6365:dc20:bb%3]) with mapi id 15.20.4242.016; Wed, 16 Jun 2021
 10:12:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: RE: [PATCH 2/6] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
Thread-Topic: [PATCH 2/6] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
Thread-Index: AQHXXsg9QvlIkn27S0WnMNEjGBSsGqsTc30AgAFYS4CAAaaE0A==
Date:   Wed, 16 Jun 2021 10:12:49 +0000
Message-ID: <TYCPR01MB593339B3D580336CE2FB5BAC860F9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
 <20210611134642.24029-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXpOGWLMXph9OGeZqZiy33O_y5z2XfAf0YzQgb4q_8+rA@mail.gmail.com>
 <CAMuHMdV=AcCgwJqiEoUyK9cDnyT-arOVSNFS5Z1xxXQ7PeZzkg@mail.gmail.com>
In-Reply-To: <CAMuHMdV=AcCgwJqiEoUyK9cDnyT-arOVSNFS5Z1xxXQ7PeZzkg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd172a29-b8a8-4b9a-8193-08d930af4bbf
x-ms-traffictypediagnostic: TYBPR01MB5344:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYBPR01MB53445BED26F6F8EF0D6AE517860F9@TYBPR01MB5344.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZZC9ObFisVMxGnpXylFM/yKaDbOFODOp064vrUeBu5BFs1f39iT+psZRRmx1IccfePbahZhJdkV+KdvBvgn+QNgHr7/TUF7e+M12K/47tvI4YhYXtq/FoS/UmYzqKvNat99dSNiDf1HxdzBYz3bBtIOC6JvcBMRXN9c2CjrTMZUmSqRuxPBX7YzK7l+lTEojN1eOF6tkdVGsjWA5ZdmF+9uhKY5xOz250LY0eNsj/dEvqBW6kPzT+8D53z9QV8bKzLyGqlinjbfQ82E8Ve9Sm3kReairhlbUE35w9nicll/1YCraggbG4UVPVc8Q23De6P/vfUdWEyi6Ii+yWBUMhJmzBKlLzRHHvJmUz4FreXZ/t4inwN/3yRpbn4N/r/uvgyoJs930Hj5mFT4RQNoWdjXZ8AGXLj/0zzJ6gYUSkBTwk3KMfcpyWibZRBye2+7aR7qXSov43ADSVYUu3GxahhA9mf0a79Tbehau/CQDjOnvjIKklH/ixujpopVclKJpEmCD4mnrFwFjnXpCTF8OeClIsP1vAgTuj928SE5eVymXatIdBXYf7Guvm9v0qaBmF5O3tFEJCZEqpJDxEw1mJ91OMBGmuE9XDxiuE2s5LKY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(478600001)(7696005)(316002)(186003)(4326008)(26005)(6506007)(5660300002)(52536014)(54906003)(83380400001)(33656002)(71200400001)(55016002)(122000001)(86362001)(2906002)(66946007)(38100700002)(66446008)(64756008)(8936002)(66476007)(66556008)(76116006)(9686003)(53546011)(8676002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlFseUpEbXRCY0o2Rnc0L3hjWVpreE0vT2E1c0hmOExiQmsyNDR2YitKZEMw?=
 =?utf-8?B?ZCtLOFdhZ09USFJJaTh1ZjdsZWdab1FRZUNWcW4zMFdjaHlKM1A4YVVHdXhN?=
 =?utf-8?B?eGg1V3JOTThGWGplNkVOdDBidC8zUFMxVlJFcFFnbFk5Y29nYjBENlJlcHd1?=
 =?utf-8?B?cHdZRjlvVWN2T091Zk9nTTFBQzNub2xsOENQR0hKNWZQd1VLSEZRcU8vUEZ6?=
 =?utf-8?B?RC9veGtyamVTZFc4TjV1bnFEWDVtK1pRRW1CZ1VhL0Qzc0ZoRWFoaVFZek5m?=
 =?utf-8?B?aHpZUzVWY0lsTnY2dGVmQ1VrZWtpQkJzSmphanQ5RDNjUjZXL2dmR2tBRmsy?=
 =?utf-8?B?SldPdWlZZ2tZVEZxcHVlUVlaN2xWaWxMZmJXb0twL0xRYStJYXFjQ2plc0tz?=
 =?utf-8?B?OUc3Y3ZwNFBTV1JjMmlpUHhhVWpDVlZkU2N0eTRlNGwzV2tzSGlpa0loaWtz?=
 =?utf-8?B?L2o1cUdQUGpFKzdmYVNMUGUwZ0ZMc0FBWGlsOTg0OVZwN09CRk94cll6VXl0?=
 =?utf-8?B?ZWxtYVRDVFRxMm1xbDBmVG5TMVJQcTFMZkU1ek8rc2ZMZTAzdndPRnVGS1A5?=
 =?utf-8?B?NkNtYjNxK1piaG1oc01qamtPWlRGaHl4YjlLQXlDZU4zUHB5VUNyd3U3d21G?=
 =?utf-8?B?WFZBRWJqYzdEWmY2dW1IV0prRG9ZWkJKb0h6UGVGYVIxTG40L3o5VnFYOUFt?=
 =?utf-8?B?RUVsZGwrSVM4b04vV0dWNnVEelB0bUc4MmxIb3J4ejRtVFZGL3VyNHJVZW9z?=
 =?utf-8?B?SE1QTG1pNzA0UjA5ekZRVXhUVXpGaWFvcnV4S1RaTjVsOEVtTUkwVlNuRnVz?=
 =?utf-8?B?SDJXbkdvcVRxV281ZjNRRWVCRDB1cnFhdmJRT2xlcHVXOXdjWmtGYjY1UnhJ?=
 =?utf-8?B?andqUk8wR3c1c3pzUmpVemdoNkxrQ2xTOFQ0Sk4yYzlnekpIWDUwZlpobm9Q?=
 =?utf-8?B?cHVzQnlSNFVTR0lnbkozUmhXcFRQWTA5WEN4TVhzay9Ed2FoY0xTZ2tGTHdv?=
 =?utf-8?B?RGxVaDdmcUtWV2FpdGZINVhLS01FT2dvbm5JMHViVTdEMjBLQzB3Q1hDY1JF?=
 =?utf-8?B?WnZkUHlwTGFXaWJNbzd0MlVLUGM5SVUrdkZ2Kyt5RWpwZkZTaXIyVGZKcDls?=
 =?utf-8?B?WkhoSkNFMTl1Qk1WM1ozUTFrR0pzdGNWYUFRc01INTFNUjczUVlkZU9RRUY1?=
 =?utf-8?B?UVlZQm5yQ1pyL2NaUW9xMEtROVZlcU9LMm9rVUdXRmZ5NXdLakNiMGlxU3BH?=
 =?utf-8?B?TVRMdk42ZGMwd1NlYXVzNXdmY250Qy9DMnlWT2U1SVh2eUlDRjFyMWlMcEFV?=
 =?utf-8?B?WVp6RXlDVXZZaWhjT0tyWncrYnpSeTV2cDRWMjlrcmUzZGI4MVd4VytnMUxi?=
 =?utf-8?B?UzFUUjRlMzlEN3JKZGdFamhPeXdUcnF3VXEranludllwMUozQ0d1dUFYQXFX?=
 =?utf-8?B?c2xSaUtJSDBWRXhaRjUyak1Udm4rRVBvc0xjd3V6MTN1Wjg0dlhTYVVxM2Ju?=
 =?utf-8?B?dzFsSWlDZG43dW9lOHczOUw5c0M3dGF0a2xEOGVhcHFEdW14dHRmM2VBS1dC?=
 =?utf-8?B?WnoxYlQzWFNQb01sSW1IUDgzTDlJcWgwUWRDbW9OMVdCK1hhRk55amJoRWFr?=
 =?utf-8?B?cWpqK3F4bnRCMmdGSjdsNUxUeDRsd2lSMnFZWHBYeksrRkU5a1d0Zm14R1c2?=
 =?utf-8?B?bVNFbHhXZDN1MU80SGFQN1VDaHJPQ3c0a05EUzRpYXVWMEpEeEJXWEU1dG53?=
 =?utf-8?Q?HntUzwUZb6GNrX+nFCsbtYnh9M4kHvcbIcNww79?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd172a29-b8a8-4b9a-8193-08d930af4bbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 10:12:49.3984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ApqQS12r6iYqWaDsNxU/IfNNsLgCAvDKm+hnSIhN1N62oZrpETFkQDMmVuBT5a4PMuwKaL7k/NcQBPuefaIxa2XBIKl95XLnj7hnmSm2fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5344
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMi82XSBkcml2ZXJzOiBjbGs6IHJlbmVzYXM6IHI5YTA3ZzA0NC1jcGc6IEFkZCBVU0IN
Cj4gY2xvY2tzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBKdW4gMTQsIDIwMjEgYXQg
MjoyNiBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiB3cm90
ZToNCj4gPiBPbiBGcmksIEp1biAxMSwgMjAyMSBhdCAzOjQ2IFBNIEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBBZGQgY2xvY2sgZW50cmllcyBm
b3IgVVNCezAsMX0uDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIg
PHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gPg0KPiA+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9y
OWEwN2cwNDQtY3BnLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDdnMDQ0
LWNwZy5jDQo+ID4gPiBAQCAtODgsNiArODgsMTIgQEAgc3RhdGljIHN0cnVjdCByemcybF9tb2Rf
Y2xrIHI5YTA3ZzA0NF9tb2RfY2xrc1tdID0NCj4gew0KPiA+ID4gICAgICAgICBERUZfTU9EKCJk
bWFjIiwgICAgICAgICBSOUEwN0cwNDRfQ0xLX0RNQUMsDQo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFI5QTA3RzA0NF9DTEtfUDEsDQo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDB4NTJjLCAoQklUKDApIHwgQklUKDEpKSwgKEJJVCgwKSB8DQo+ID4g
PiBCSVQoMSkpKSwNCj4gPiA+ICsgICAgICAgREVGX01PRCgidXNiMCIsICAgICAgICAgUjlBMDdH
MDQ0X0NMS19VU0IwLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSOUEw
N0cwNDRfQ0xLX1AxLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDU3
OCwgKEJJVCgwKSB8IEJJVCgyKSB8IEJJVCgzKSksDQo+IChCSVQoMCkgfCBCSVQoMikgfCBCSVQo
MykpKSwNCj4gPiA+ICsgICAgICAgREVGX01PRCgidXNiMSIsICAgICAgICAgUjlBMDdHMDQ0X0NM
S19VU0IxLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSOUEwN0cwNDRf
Q0xLX1AxLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDU3OCwgKEJJ
VCgxKSB8IEJJVCgzKSksIChCSVQoMSkgfA0KPiA+ID4gKyBCSVQoMykpKSwNCj4gPiA+ICAgICAg
ICAgREVGX01PRCgic2NpZjAiLCAgICAgICAgUjlBMDdHMDQ0X0NMS19TQ0lGMCwNCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUjlBMDdHMDQ0X0NMS19QMCwNCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg1ODQsIEJJVCgwKSwgQklUKDApKSwNCj4g
Pg0KPiA+IFdoaWxlIHRoZSBhYm92ZSBtYXRjaGVzIHRoZSBkYXRhc2hlZXQsIEkgc2VlIGEgcHJv
YmxlbSB3aXRoIHRoZQ0KPiA+IGltcGxlbWVudGF0aW9uLiBBcyBCSVQoMykgb2YgdGhlIENQR197
Q0xLT04sQ0xLTU9OLFJTVH1fVVNCIGlzIHNoYXJlZA0KPiA+IGJ5IHRoZSB0d28gVVNCMi4wIGNo
YW5uZWxzLCBkaXNhYmxpbmcgVVNCX1BDTEsgb3IgYXNzZXJ0aW5nDQo+ID4gVVNCX1BSRVNFVE4g
d2lsbCBhZmZlY3QgYm90aCBjaGFubmVscy4gIFNvIGl0IGxvb2tzIGxpa2UgeW91IG5lZWQNCj4g
PiBzcGVjaWFsIGhhbmRsaW5nIHRvIG1ha2Ugc3VyZSB0aGF0IGRvZXNuJ3QgaGFwcGVuIHdoaWxl
IHRoZSBvdGhlcg0KPiBjaGFubmVsIGlzIGluIHVzZS4NCj4gPg0KPiA+IE9yIGFtIEkgbWlzc2lu
ZyBzb21ldGhpbmc/DQo+IA0KPiBJJ20gZ2V0dGluZyB0aGUgaW1wcmVzc2lvbiB3ZSBkbyBoYXZl
IHRvIG1vZGVsIHRoZSBpbmRpdmlkdWFsIGJpdHMgYXMNCj4gc2VwYXJhdGUgY2xvY2tzIChhbmQg
cmVzZXRzKS4gIFRoYXQgd291bGQgc29sdmUgdGhlIHByb2JsZW0gd2l0aCB0aGUNCj4gc2hhcmVk
IFVTQl9QQ0xLLCBhcyB0aGUgY2xvY2sgZnJhbWV3b3JrIHdpbGwgdGFrZSBjYXJlIG9mIGtlZXBp
bmcgaXQNCj4gZW5hYmxlZCB3aGVuIGF0IGxlYXN0IG9uZSBjaGFubmVsIGlzIGluIHVzZS4NCj4g
DQo+IEJlc2lkZXMgVVNCLCBTREhJIGhhcyA0IGNsb2NrIGJpdHMsIHdoaWNoIHdlIGRlZmluaXRl
bHkgZG9uJ3Qgd2FudCB0bw0KPiBjb250cm9sIHRvZ2V0aGVyLCBhcyB0aGUgY2FyZCBkZXRlY3Qg
Y2xvY2sgbXVzdCBub3QgYmUgc3RvcHBlZCB3aGlsZQ0KPiBzdXNwZW5kZWQuDQo+IEhvd2V2ZXIs
IHRoZSBleGNlcHRpb24gdG8gdGhlIHJ1bGUgaXMgRXRoZXJuZXQ6IGVhY2ggY2hhbm5lbCBoYXMN
Cj4gMiBjbG9ja3MsIGJ1dCBvbmx5IGEgc2luZ2xlIGJpdCB0byBjb250cm9sLCBzbyB0aGlzIG5l
ZWRzIGEgY3VzdG9tIHNpbmdsZS0NCj4gZ2F0ZS1mb3ItZHVhbC1jbG9jayBkcml2ZXIuDQo+IA0K
PiBQZXJoYXBzIG1lcmdpbmcgdGhlIGNsb2NrIGJpbmRpbmcgZGVmaW5pdGlvbnMgYW5kIGluaXRp
YWwgZHJpdmVyIGZvcg0KPiB2NS4xNCB3YXMgYSBiaXQgcHJlbWF0dXJlLi4uDQo+IEFueXdheSwg
d2UnbGwgaGF2ZSA2IHJjcyBhZnRlciB2NS4xNC1yYzEgdG8gZ2V0IGl0IHJpZ2h0IDstKQ0KPiAN
Cj4gV2hhdCBkbyB5b3UgdGhpbms/DQoNCkkgYW0gb2sgd2l0aCB0aGlzIGFwcHJvYWNoIGZvciBV
U0IsIFNESEkgYW5kIEV0aGVybmV0Lg0KDQpSZWdhcmRzLA0KQmlqdQ0K
