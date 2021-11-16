Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21B4453A52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 20:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240115AbhKPTob (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 14:44:31 -0500
Received: from mail-tycjpn01on2122.outbound.protection.outlook.com ([40.107.114.122]:52130
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240113AbhKPTo3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 14:44:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cI950ZRZK2Ay1X8LYEYHCcUxzlGPxywwbV66o+b5RQVc+1kSHXHqJry8+ejeU689QZVxCLeQYufRxzUIeZYD0pYW6YTjEjwyqEgO3CQUYbsHB1bvuNz3y+DnCjdRwTYUyAgLmRVngGabxprTqWLIHiic+1W3z8zU5AEsPphm3reNB95IX8/KOh35GEQn5VahINRiagUbn/c8I/0MaYQDz5uwN6EJ+q2zQloZyC8SdYhKcuQf+MdDesJb2NhZyl6ugMBggXfdDP/BEp+ZdyKcG7k1UH4jnns5SjJByob9x7tvV+7E4Le5waCzXwg60GoJK9ujcQYtvqoFhzsfa8e7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OK2wsg7/Y6idUl0ld9AYR8Zfe2bEHBHA0RU5nIzb5vs=;
 b=L0DfZJD51UQXrm2hRGKsgDiK/oMM20l+051RKMCMKAYBm/f40GfjimjnuH/okZZBCl+q6VpgRl/T6ig9029ARJ5gz85CtXkI6+bCwlk6UcLMNwPviNmzvKULZ02LjHjpjcs+YZCYNj7xTklknNAC/h5x5UAq22MhfgEiDDAx5DX8dNyYIxHKUzStsBpFEsGQovAgpWp5UO3w27eMERhNYIh68EECaMYsUYmSshkZW9nLI/kUI6gznfaCruOjbtObRBMTqd8Zyq91TkkDdsTfMq5JIe9Qd7SJCBz4OCM3Kogef3O2Di79RCe6OyhyHlRvECka3RVQEdRy/CfAMUHZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OK2wsg7/Y6idUl0ld9AYR8Zfe2bEHBHA0RU5nIzb5vs=;
 b=goFfiSG7+MVNKuROlGVmhcKIPQFtMX953+v2Q17/ANQxQdN3PkpO0Zh4yku8zqkNKlJZj4mC/+76SkY5Rek0T8qrj84zUV2SCFsut3RYjt1XfejUal8jtRlGY4l2qRRzUawFUl70zHWFHOGyM1ehiob0st16iYx7jRr4ozJqiz4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB1700.jpnprd01.prod.outlook.com (2603:1096:603:31::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Tue, 16 Nov
 2021 19:41:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 19:41:28 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Topic: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Index: AQHX2jrE4eSX7ohpXUa1PkZIvz7h+6wEx4EwgAAw7wCAAA+tYIAA7DUAgAABScCAADAKAIAALcywgAA6idA=
Date:   Tue, 16 Nov 2021 19:41:28 +0000
Message-ID: <OS0PR01MB592210D033924785A1C33A3386999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZKz/ptgPfzqGfeq@kunai>
 <OS0PR01MB592241C04F5CDDB94D850FFA86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUm2EG3Yi+eTZA0E9tZOT71ewkbx=yh8sVOnL207Od3Rw@mail.gmail.com>
 <OS0PR01MB5922A978B55C09B9E754DBD486999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWVB_7U0R5hkO7eEkzdkmhwCEFstskvXJgO-dU1hog=+A@mail.gmail.com>
 <OS0PR01MB59220069B3113A206F31305286999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59220069B3113A206F31305286999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82dd2eba-a6f7-498b-b463-08d9a9391511
x-ms-traffictypediagnostic: OSAPR01MB1700:
x-microsoft-antispam-prvs: <OSAPR01MB170099434396EA4B40213E9086999@OSAPR01MB1700.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cnP3Xu4RMq7F3KKrz1MUyhROQeOnTVcIDCnLDwfEtI1L0Mqm+xOmdPtf9SnmxrzekmAR8I6XPs36OUmA9ph0bkEjyTrzjijf80uwQ+JlQZxBdFLvDkRClaVgZGXouSac5hj5IB0EbNt+yrrSg7H00MweX1m5FJTqAzXW/EZuOAqjxBtTT8sMUyUBc04riCrmmDeCt6AKELn8OMdBWVlfedm/Dl95UI9gdHdlpi7EYP8r0AexhpJu0hu0eefHXRgcf6pA7wQoZvGXHG7XNOK+nYCv0yg2UgE2cZeMI8Y4tvk8O1e2kODbX9JEUHhauUCvhl/7ptlXNf/9CAiWMeQOSL09OR6jUgxaGp9sRmYglz/fCjRsUqOcL6z8U8duxJeWwdPTKfyOYhg0A4KldGq6zKeMhpNWPq3BpXfSZCBiVLnqY7Fqmn7lbCgkczgalgzqmM88FEDGmNQwsHefCFzrdNnze4WJ4XbzbhNLZzPPw4/i/MEJmHb1JnLr6AnscjjPQNe5WTHiac8yjY3G+bH6qZXJJ8Wndnmz3iORKxdYXlsqy+THKBqSPZoCLJxVzqqXjCGohKDN1e+ELgi9TzGj9acLZmjM+hCsCWxho0Pz1oENfMo3dPn1OOa7SIOCkc868mbpV3MNLAexy4lP3Fy9dX9OM9hbhbYcmroiJMYQ2wTbDT6Im8crym0Joi7hkJl1k3826+4pSk08okmZ32d0qQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(8676002)(2906002)(7696005)(8936002)(66556008)(66476007)(54906003)(122000001)(38100700002)(316002)(66946007)(186003)(55016002)(9686003)(26005)(508600001)(33656002)(5660300002)(4326008)(6506007)(64756008)(53546011)(83380400001)(66446008)(38070700005)(52536014)(76116006)(86362001)(110136005)(2940100002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlRrWWxwdzdicVkwRVhWMmwxMk12YndmYy9JRlRWSFNpMDBObm5mb2NHbC9K?=
 =?utf-8?B?SFpWTTJvaUQ0WHFLNGJIUXlnblpOdVQva3dKWXo5c2E1enBLNTZVTURocjZW?=
 =?utf-8?B?TEFVM1lhRUFlS0NPQkZ3aXphS0pUOEdoWGpMUzNUSktySTlGbnF5a01KR3Bo?=
 =?utf-8?B?NjhSWnlMbjlEcCt6MVhPZzdNTzFCbVFrK0RQd3JFcGsrbmFVNzdYcElNNm5L?=
 =?utf-8?B?cU4zOEZXNnNkL2l4UGVsY29YKzd2cFlaRVg4WFVJb2ZDYlJ2dDJyYSs3THR2?=
 =?utf-8?B?LzcxTWhFQ0N0MUxQZUEwUElQOTZXY1laUXVvS2VoMm9LaUp2c0VuNTBmVjJH?=
 =?utf-8?B?TFJ5UEdOMWFHWHFUSW9GOGw2ZXZpU3d5VVZ4WmJEL2s5ZGVvcnRFL1U5a0VK?=
 =?utf-8?B?aUVQMWt3VEc4cEJZR2VaQkEvQkFlOTNpV28yb0Z5VVd5VDVCVVF0RXRWVTQ3?=
 =?utf-8?B?Q094S213bUZ2a241NHNUQTRXRUUvaWhkQXN4djd5SVNOMkE5TWQ1WkdxeElz?=
 =?utf-8?B?Vml6YlNrbXlIcSs3cDJDbHdLNnMyVGgxZ0lxQ0VyMDZFM2FFTzUzamdUd0JJ?=
 =?utf-8?B?bTM1UHU4NGpaYStMeVZQTkg4Q1JLQVd4M2l0WkNYTzNzMUFvUW1BUlo3N1pt?=
 =?utf-8?B?WjNGWjZ5YzlhczgrSmk1YlVscWNNc0ZSRjBjL25WUDdtQkdaeWRhekpocitF?=
 =?utf-8?B?ZjU2d3NWZzcrRFdHNzUwTUF1d2lVbEh2enhKTmt6MkhyZkI5SlhTc1hpTXJw?=
 =?utf-8?B?aGVwYTRxbEhuZ3lMWDkrWjVVaTlCbHpxVEZIV3hpRTZtWE5jWVlwMEgvL0sx?=
 =?utf-8?B?TTBqdWZIMHVnM3JYdE0rMlZERFZpMnkzNUt3YWFJdERGMUtjakVVVUpjV082?=
 =?utf-8?B?V3RPa0ZaSEFjZk1LTWRYeGNKR0d2NmREbk9ackVHS1IwcXYwaTl3bXlFKzVq?=
 =?utf-8?B?blJ0OXBGanNEQXNMQ0FZSGZTYWdla2hVM21oSGk0T3gvWTBDL0tVNVBsVjlh?=
 =?utf-8?B?eG5SYjhwR1lYVDUxSTFkN3ZpbUs4bCtMWTMydUQ2Z2kzQXRmYWpYbzdoRWIx?=
 =?utf-8?B?eFNnd1lhQm5DcmQ5WndJbk9seXl6cW8yaXJGRGRZVFRCcWNTRHczN3pFMXU2?=
 =?utf-8?B?NFd2OG9nWWZiL0hZSStaVEFmUXJudCtiWGFzQ0J6cUlWSlBadTI4bE00aUh6?=
 =?utf-8?B?dkREdEY1ZUx4SGdzV0hqcUhpeWJla0JGWkYyQTNlcmVlWGt5VXRveXV5KzVS?=
 =?utf-8?B?bE9PaU80ZW0rRUpzK05LZFN2R3djaEhLcENsR1RhbWNXdlJYb055clpuU0xl?=
 =?utf-8?B?d1ZnOFJYbHlLQlgyT1ZTcXErK1ZKYWFzb1JYR1I0UlEvbjBYdDRqcVdnTHBF?=
 =?utf-8?B?ZWR4RWpRaWk4Qk12MitFMitlemhDV1liQzFEQkJhYjRtdC9mdmhyQWsvL2ll?=
 =?utf-8?B?R2cxT0sreDJDR09ZYmZjNGpITXMwV3FDZ0YwOFMwWDBBWXAzRjgyUVFWbkk5?=
 =?utf-8?B?aGZHWXF6NUtHSjN4UzRMME50Z3RpNUlSaEwvOExSRFRMSnVYbzlJd3NQMFV6?=
 =?utf-8?B?ZHAyYnJ5dzFSUlZnT01HeUNvZ1lpa2Q4N3ZEaWZEY054bGQzOWhXZzBZMDNH?=
 =?utf-8?B?SlI2NTJ5TytRQ0hzSVlxVlBkZ1llUU54anJEbm04NW9WQjlxZVN3MWRXNGtF?=
 =?utf-8?B?QUxtYlFjZi9YV3JjckFBTEFPZVZLeFUzT3paaWtHaW56MXIzUDVQR0dqRXV3?=
 =?utf-8?B?d1JKbE5FU1hTSU0rcWhDQVJkMm5VSENUNFFoK2xzMmsvMlZENmcrZ0VMcmE3?=
 =?utf-8?B?OTF2blNnYlhIQmIzT0V4TG5yVmNkZldsTVR3NUU0NEV3TUlUU2NDalN5anBQ?=
 =?utf-8?B?dTBDM3JpRkRFR0QvSjAyUHBabmFBVFAxNTl6RTgzM3dZQ3ZZUWFqcms4enc1?=
 =?utf-8?B?VTFoejJ4OW5Sc0RvZEpTemRHOFI2TnRUblpQaDdabnB2RmhuWDgyRUJSRlk3?=
 =?utf-8?B?bzZNREJJalZtWDJicFlBMVJtTG01bi94MWYxK0RHbjVRcFRNWGtGaXdXSjRi?=
 =?utf-8?B?M3EvcGp1cURoTzFXRXk5K3d1dzl3UVpJWUhJckIwNG8yK2VoRUdtRVM1UzZ3?=
 =?utf-8?B?UCsyUjJYUGxtVXZzYzJWOVFEM0NqRWlacXVieWk3N2ZycXNYTGlyTkhibjJ0?=
 =?utf-8?B?QU5lcGpUWE1HRlRIUEZzV0pJMTc5UHBlaHJseFl6Z2xFeFV6cllLL09KOXB0?=
 =?utf-8?B?eVdNVmFrU0ppTzQrcU1Gak5TQVJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82dd2eba-a6f7-498b-b463-08d9a9391511
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 19:41:28.0322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4tRJam341OO0o30ib6Zf4Pfu8poAmMi0TyBk47uGI6WRt/Zr43v1X7S4W+u108qds6PRlkNhC0dpA0OUiqrFLGoOpDYMAVuCOMY5Bi/foKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1700
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgYW5kIFdvbGZyYW0sDQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2M10gZHQtYmlu
ZGluZ3M6IG1tYzogcmVuZXNhcyxzZGhpOiBhZGQgb3B0aW9uYWwgU0RuSA0KPiBjbG9jaw0KPiAN
Cj4gSGkgR2VlcnQsDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gDQo+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2M10gZHQtYmluZGluZ3M6IG1tYzogcmVuZXNhcyxzZGhpOiBhZGQg
b3B0aW9uYWwNCj4gPiBTRG5IIGNsb2NrDQo+ID4NCj4gPiBIaSBCaWp1LA0KPiA+DQo+ID4gT24g
VHVlLCBOb3YgMTYsIDIwMjEgYXQgMTI6MjYgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiA+IHdyb3RlOg0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBk
dC1iaW5kaW5nczogbW1jOiByZW5lc2FzLHNkaGk6IGFkZA0KPiA+ID4gPiBvcHRpb25hbCBTRG5I
IGNsb2NrIE9uIE1vbiwgTm92IDE1LCAyMDIxIGF0IDk6MzIgUE0gQmlqdSBEYXMNCj4gPiA+ID4g
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIGR0LWJpbmRpbmdzOiBtbWM6IHJlbmVzYXMsc2RoaTog
YWRkDQo+ID4gPiA+ID4gPiBvcHRpb25hbCBTRG5IIGNsb2NrDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiArICAgICAgaWY6DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAg
ICAgcHJvcGVydGllczoNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgIGNvbXBhdGlibGU6DQo+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgIGVudW06DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAtIHJl
bmVzYXMscmNhci1nZW4yLXNkaGkNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgIC0g
cmVuZXNhcyxyY2FyLWdlbjMtc2RoaQ0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBXaGF0
IGFib3V0IFJaL0cyTCwgYXMgaXQgaGFzIDQgY2xvY2tzPw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+IFRoZXkgYXJlIGEgZmV3IGxpbmVzIGFib3ZlIHRoaXMgaW4gYSBzZXBlcmF0ZSBibG9jayBp
ZiBJIGFtDQo+ID4gPiA+ID4gPiBub3QgY29uZnVzaW5nIHRoZSBTb0MgbnVtYmVyaW5nLg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gQWggb2ssIEkgdGhvdWdodCwgc2luY2UgUlovRzJMIHVzaW5nIGdl
bmVyaWMgcmNhci1nZW4zLXNkaGkNCj4gPiA+ID4gPiBjb21wYXRpYmxlLCBXZSBuZWVkIHRvIG1v
dmUgdGhhdCBTZXBhcmF0ZSBibG9jayBpbnNpZGUgdGhpcyBpZg0KPiA+IGJsb2NrLg0KPiA+ID4g
PiA+IFdpdGggaW4gZ2VuMyBjb21wYXRpYmxlLCBpZiBSWkcyTCB0aGVuIE1heCA0IGNsb2NrcyBl
bHNlIE1heCAzDQo+ID4gPiA+ID4gQ2xvY2tzLiBJDQo+ID4gPiA+IG1heSBiZSBjb21wbGV0ZWx5
IHdyb25nLg0KPiA+ID4gPg0KPiA+ID4gPiBCdXQgaXMgaXQgd29ya2luZz8NCj4gPiA+ID4gV2l0
aCB0aGlzIHNlcmllcywgdGhlIGRyaXZlciBsb29rcyBmb3IgdGhlICJzZGgiIGNsb2NrLCB3aGls
ZSBpdA0KPiA+ID4gPiBpcyBjYWxsZWQgImNsa19ocyIgb24gUlovRzJMLg0KPiA+ID4gPg0KPiA+
ID4gPiBBcyB0aGUgUlovRzJMIHBhcnQgZGVjbGFyZXMgY29tcGF0aWJpbGl0eSB3aXRoIHRoZSBn
ZW5lcmljDQo+ID4gPiA+IHJjYXItZ2VuMy1zZGhpIGNvbXBhdGlibGUsIGl0IGlzIHN1YmplY3Qg
dG8NCj4gPiBTREhJX0ZMQUdfTkVFRF9DTEtIX0ZBTExCQUNLLg0KPiA+ID4gPiBJbiB0aGUgYWJz
ZW5jZSBvZiBhbiAic2RoIiBjbG9jaywgdGhlIGRyaXZlciB3aWxsIHVzZQ0KPiA+ID4gPiBjbGtf
Z2V0X3BhcmVudChjbGtfZ2V0X3BhcmVudChwcml2LT5jbGspIGluc3RlYWQuDQo+ID4gPiA+IE9u
IFJaL0cyTCwgd2UgaGF2ZToNCj4gPiA+ID4gICBTRDAgLT4gU0QwX0RJVjQgLT4gaW1jbGsNCj4g
PiA+ID4gICAgICAgLT4gY2xrX2hzDQo+ID4gPiA+IFNvIHRoYXQgd2lsbCBwaWNrIHVwIFNEMCwg
d2hpY2ggbWlnaHQgYmUgY29ycmVjdCwgYWNjaWRlbnRhbGx5IDstKQ0KPiA+ID4gPiBBcyBxdWly
a3MgaXMgbm90IHNldCwgaXQgd2lsbCB1c2UgY2xraF9zaGlmdCA9IDIuDQo+ID4gPiA+DQo+ID4g
PiA+IFNvIGFsbCBpcyBnb29kPyBJIHRoaW5rIHdlIHN0aWxsIHdhbnQgdGhlIGRyaXZlciB0byBj
aGVjayBmb3INCj4gPiA+ID4gImNsa19ocyIsIHRvbywgdG8gYXZvaWQgaGF2aW5nIHRvIGRlcGVu
ZCBvbiB0aGUgZmFsbGJhY2suDQo+ID4gPg0KPiA+ID4gSSBoYXZlIGFkZGVkIGJlbG93IHBpZWNl
IG9mIGNvZGUgYW5kIHRlc3RlZCBjbGtfaHMuIEl0IHdvcmtzIG9rLg0KPiA+ID4NCj4gPiA+IENh
biB3ZSBjaGFuZ2UgdGhlIGJpbmRpbmcgdG8gdXBkYXRlIHRvIHVzZSAiY2xraCIgaW5zdGVhZCBv
ZiAiY2xrX2hzIg0KPiA+ID4gZm9yIFJaL0cyTD8sIHNvIHRoYXQgd2UgZG9uJ3QgbmVlZCBiZWxv
dyBjb2RlIGNoYW5nZSBpbiBkcml2ZXIuIEFueQ0KPiA+ID4gd2F5DQo+ID4gaXQgaXMgb3B0aW9u
YWwuDQo+ID4NCj4gPiBGaW5lIGZvciBtZS4NCj4gPiBTaG91bGQgd2UgYWxzbyByZW5hbWUgaW1j
bGsyIHRvIGNkPw0KPiANCj4gWWVzLCB3ZSBjYW4gcmVuYW1lIGltY2xrMiB0byBjZC4NCg0KUGxl
YXNlIGxldCBtZSBrbm93LCBpZiB5b3Ugd2FudCBtZSB0byBkbyB0aGlzIGNoYW5nZXMgYXMgc2Vw
YXJhdGUgcGF0Y2goYmluZGluZyArIGR0c2kpIG9yDQpXaWxsIHlvdSB0YWtlIGNhcmUgdGhpcz8g
Qm90aCBhcmUgb2sgdG8gbWUuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gDQo+ID4NCj4gPiBOb3Rl
IHRoYXQgb24gUlovRzJMLCBpdCB3aWxsIGJlIGhhbmRsZWQgYnkgUnVudGltZSBQTSByZWdhcmRs
ZXNzLg0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBpZighcHJpdi0+Y2xraCkgew0KPiA+ID4gKyAg
ICAgICAgICAgICAgIHByaXYtPmNsa2ggPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoJnBkZXYtPmRl
diwNCj4gPiAiY2xrX2hzIik7DQo+ID4gPiArICAgICAgICAgICAgICAgaWYgKElTX0VSUihwcml2
LT5jbGtoKSkNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3By
b2JlKCZwZGV2LT5kZXYsDQo+ID4gPiArIFBUUl9FUlIocHJpdi0+Y2xraCksICJjYW5ub3QgZ2V0
IGNsa19ocyIpOw0KPiA+DQo+ID4gR3J7b2V0amUsZWV0aW5nfXMsDQo+ID4NCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydA0KPiA+DQo+ID4gLS0NCj4gPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tDQo+ID4gZ2VlcnRAbGlu
dXgtIG02OGsub3JnDQo+ID4NCj4gPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gPiBCdXQgd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvcg0KPiA+IHNv
bWV0aGluZyBsaWtlIHRoYXQuDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
LSBMaW51cyBUb3J2YWxkcw0K
