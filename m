Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2548450B5F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 13:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447016AbiDVLOv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 07:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446885AbiDVLOu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 07:14:50 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2108.outbound.protection.outlook.com [40.107.113.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897236395;
        Fri, 22 Apr 2022 04:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZOm2L8gagwIbSbK7wgKGzj3Ej0vyNlFK0YqOICdpUr3PJgPvxioTlaw0SEUKFZ3e2m59ZZEcqkrsJkOOIaEoJOZKJPAwpacdo80/kNIOiFCeaiIkAmDJitC9BYuY5neYtgkro8cOnt+hCGxNJhfhBaRqgmuZTZheFuyL9/OGnf0iIr6Dvq6aFGNO+pRhkuI14vFg7bZhf7oXHI6EHY4UPSAMEw/05IlEkf94tddGv6gg84iZxAl5oMSqZwqgVimhkHXS0wLN8/IEPc5qglEYgzPIAMbDAqeERSdnWxixlEDy2amKixsm1nfQmRCVc1sJkTd5ddLt/ODgAYVaqSmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jgUvOb78N6CFhQW6WLvJOXTq3GvB/J/x1hMXBbI+Zo=;
 b=n0aGjtqQ76Y2RzWx3ryQqH+J5J8DPv1y0bXhP/kdGPM03NugFSF8yHafTOzpp1EJvblNDwCZamWdsSVhj3Och9NinYLkAAz1iyyflE7UG3G30rCzEjXe7jJLg3frhekkBaDEHAj8xJ9v/Xf9Bqr+lCDXfWLZc5qRlL5E5EYOS+0jdL9fhHGPFxX1BmnbRBjrQUPwGISOGy7VUn9zQ248uaXi5HM4FQ2BUz5v5eYGDzWBa+Ej281sS+BuGJZSyCmcA2K6UfW3Sg3LbIZuK3hdgoL2au3OwCFZ0zV52t9jO9D8FRR/7BWNNWL47nPTBTrw0XUxMCFex38eQCr11MUWZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jgUvOb78N6CFhQW6WLvJOXTq3GvB/J/x1hMXBbI+Zo=;
 b=h/WSZl6vl8dL5zCZ4MiMO07BDV9E6pxZRw0p76dSGaV8x2h6Ghrdx9pnyrbX+jwt/R4eciFJX27p9jrq9Q3SRRaUiknVDaquPJOpyGIXk6KVmtkhdf/wCjcvylcbGr1DfJ2nn6mOM2uN98ZvjbTgC3fIHGpgHiHsGpd1GgT61hs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9601.jpnprd01.prod.outlook.com (2603:1096:400:192::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 22 Apr
 2022 11:11:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 11:11:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/9] clk: renesas: rzg2l: Add PLL5_4 clk mux support
Thread-Topic: [PATCH 2/9] clk: renesas: rzg2l: Add PLL5_4 clk mux support
Thread-Index: AQHYOvDIiA0y1Cks0UK5T/0vXLy/tqz6MhwAgAHJj/A=
Date:   Fri, 22 Apr 2022 11:11:52 +0000
Message-ID: <OS0PR01MB5922E2040203F9C953DAE9D586F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220318175113.8956-1-biju.das.jz@bp.renesas.com>
 <20220318175113.8956-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUCos4aDTXBQeKNW4BvM=rXTGO-PZe9EHhaafT+sY30VQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUCos4aDTXBQeKNW4BvM=rXTGO-PZe9EHhaafT+sY30VQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d797b9e1-9461-4941-f180-08da2450e7a1
x-ms-traffictypediagnostic: TYCPR01MB9601:EE_
x-microsoft-antispam-prvs: <TYCPR01MB96012F7E0851C602DD1B8CB386F79@TYCPR01MB9601.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dw2TkJHzG4uIWa7bV+4XTfDV08Or7As3rmLwYOQPp1InMXbhbdrLs5scLZe8PpXykYrjghYXILU0NRHmHEJb/0u2BFAACPuJpeSjbyaA1oZ1DNF/tsrMOlPFebptFzPlioLBNQpIIxF4r8ScPI9c/u2ujN/xFuKWRlmy7GRcUeRWHVo1B0MMljFOyapz6ikBYc9j6A9Rx24+S+83eJRG3xvHV0YQpa9BuScmvG22/Sk+7XSLsNLY61cY361b/1JipZjKCE+3ay0ufAkuZ42QwTXuNt90lIQ7dxZrMJZDB5eCf2Ogh/BSaLd/A2yjfdZPReCaifIoGBqbh1QWyJQ5qMq0b0Asl/s3MWlFj+dTsJ1afMb0lFZJalXfQC0mP9Arp6tWThb0zhyRPiQsT09t+40XTdjnqEeiAEBzIpyhuUm/BihPukGZ4pW6McaUNHiMvFGcndOvi/osUuEWPLMJk1KBx/trUcKaCJEVE0IX64Nb/6HUpjbaOV22ybSt3t3UpWZkRpTJeJjT1UdAraTEOLH7fEjo7SWyyEcrjgUvfdlp5fG/hdPARwycR2ZsxI682WXrOw5WObdD+PsLqLpiI7H/oTJ4t29vkazK5cOsxvOU0mngnFXtvsrkaBa22nlOaD8X0FszppjB5nj/4LvUYhNEthBoqOE0jVoBbnP4HKCQWWsiSMAKuJUoAC1JLyspIqUpgYPpaJt0f1QWmFLE+w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(5660300002)(508600001)(8936002)(71200400001)(76116006)(122000001)(33656002)(316002)(38070700005)(66946007)(53546011)(2906002)(186003)(26005)(7696005)(107886003)(66476007)(38100700002)(64756008)(8676002)(4326008)(6916009)(66446008)(52536014)(54906003)(83380400001)(86362001)(66556008)(55016003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N21Ja25CZW12anVDQU9iSXNnTUN1SGp5bmZGTkJoZ1czVmtiV2twSmh5TkQw?=
 =?utf-8?B?bnIxTUxmUWkzaXUyTnpURncvWnI4Y0YzUW0zbVl6RjFTUU5sTzFOR25IMW9h?=
 =?utf-8?B?bGFrMHI2dzY5K2dCSXViemZxWmVQY3JkcmRYcmVsQlVHbyt1MmM3V3BGMVpX?=
 =?utf-8?B?bU43R0JvVG5LMll5OUZzMEZiVUtmT3ZZZzB5SHNxVWphU0hRZ2tFUHUrdDYr?=
 =?utf-8?B?Vmt5dFk3cDR1THRTdjc4Y1JLRXNPc3duM0J6VUU5elFjejlJc1JmY0RmNDA0?=
 =?utf-8?B?OTNNOU1iWWNHY1BLdVB5aFN0Qmh5cHk1Q21PeElKWUZ3OGhVMUdSMWZWT0Er?=
 =?utf-8?B?eDYrNzZzVzFPS2dNdWJOc3hDd1dtOWNsbmxRQys2ZStUQ1laSndRUGVqVEND?=
 =?utf-8?B?c3E0VVNsSmx1RHVaV2VGQVljNlZncEM3aUpOem5oR0dBYjZDZ29MSjJUTUtM?=
 =?utf-8?B?Q0F1N3hVMi85dVFqdVFvU2RZRW4yMTBJRitjUXdPMmh3YllTeHBtQkVWNGht?=
 =?utf-8?B?VnRDTXpIWFk0bmVNWVVnQkFkY1B2bmV1ZTF5U1lmelk2ZEduY3Z6cGJYM2xn?=
 =?utf-8?B?ZEpuUWkrTlBucVMxNy9ENWkzcWlNQ2NLWWtFUG1kanM2SzcwSm1EQ0J0Tktu?=
 =?utf-8?B?bmJLVTFESmE1QUZ3TzZxUFZ3QlVsdzZscldGTkNXeDF4dnhUeWJjcGMwVDhp?=
 =?utf-8?B?T2UzY2F1dllPdWRxTzh0SlRtZzZiVlUycXpUMjhpT1dEQ3hJWTk2OWpXOTd2?=
 =?utf-8?B?aXZabldtazBOU2xSNkFhaUtkdXQwRitzVGdRd2xrRHMrT1ZMYjUvL0lwbTJO?=
 =?utf-8?B?SGtaTnhWWVQxSWtxc1hyU0NFZHZxVEhiV3hpWkQrT1ZJLzNNa0Z6TzI1Q0My?=
 =?utf-8?B?VXRYWTlxVVcyaFozcGhqOUJzMXdOZkdLY2tUYmx4bnlKVVNOQThuOWVKSVVj?=
 =?utf-8?B?b2VNSDVOVG1QY0MvNzJGSi9tc2JPaHpMRlB5OUNFamNBWEZGUGlOeS84djhh?=
 =?utf-8?B?cFBwc0xGSEJZQmpYSlRzYk5uVTlzbHU5QjZXKzVtQUFKTEl3eTZvT0tpdmdL?=
 =?utf-8?B?VzJ5dE54R01sL3NhRWFRUzE0Qml2Q2k1SitENEJYR1krdFFhNzRZSXduUjVq?=
 =?utf-8?B?Wm5JRncxbkhTYm94TDdPUFlwZmtiS0RmR1p4QWhxVFhTZWV0L043dU9ya3c4?=
 =?utf-8?B?U3VBajFyUHBodkxqYmJMM0hseU9RR3ZSdUdsNjVxMmQya2ovdmZCOWpJS3Bq?=
 =?utf-8?B?Y2ZSSVVHMVFuaG93Qm5vQjYxbHBUQjdtcG5lTnJkck1DK2NhS3lhRmpUVjdS?=
 =?utf-8?B?UmZCVTZFLyttaUUvNWdqeDB1aGg1Z0NEcGhzOWJBdUFTNzVXb1h1WXl2UXZm?=
 =?utf-8?B?b0ptZXBEVXl0UXJNYXc5Y3puNUZYQnBBYkgxaHNQOWZGMEoza1plR0dzZ3R3?=
 =?utf-8?B?cFhBSVdUSlJTcUFMSU1xaERpeTU0TGc0OHlmdEZjMkFsMzRrM3ZsSy9BODht?=
 =?utf-8?B?NE51MFJFZm50ZTlMYlVsVFZINDBTVGdneDEyc3pzWnViZHk4RHdOT2pKb3RD?=
 =?utf-8?B?NWtvWVdvb3YrZEhwazF4YVBma1U0YzZCT1MvSFcvN1RwdXVXaWNodXNWM0JZ?=
 =?utf-8?B?K0FUT084RHUwbzdMSGkraUYrbnR3OGRJZndUSStod0NTR0NtQXpPRWw5K0Jr?=
 =?utf-8?B?WUVkNnc0U2JUVkJkMFBuQ0lZUWN5WCt3VDl1OW1ZY3N2SS9rTjZIQWlzYmZs?=
 =?utf-8?B?blJLUmxYVEFEUFZTTzNxYzNHM1hFL3NZWlptRnZQSWpWTWl0NkFRM3NPR0tW?=
 =?utf-8?B?U09nVVNaWnFYL05Jd1NMYm4yWU5PVDQxLzVINnFtRU9LZDR4MGxPa3lPcFRs?=
 =?utf-8?B?SHZYamk2dzRoR0RTU0dRYlQ2OEVtTU1rWlVadWdGMWlVclZDSGF3MitBQk82?=
 =?utf-8?B?NWtmTVZaN0hwSXYvVlZOd3ZUTzZOVGd5NHVGTll5Y1R6VVA1eUkyRGdrMkVB?=
 =?utf-8?B?bWxpTXZpVHhNcy8zNXRyRmtkL1RYOUVaMmNpZURpQ0hOZWRZcDk1SmxBTGFZ?=
 =?utf-8?B?Q2gzMXN2Nk5HVDJKcHFlRVcrTGZ5WDBzTTAwQ0pDT0s2WWtramV0WG9UN0FL?=
 =?utf-8?B?aDdPTm1JYWYwdlJHYzNYRHdMSFBGVDFlVWo3ekNFdjgxZTdJRXhEU1dlZCs1?=
 =?utf-8?B?TDErNW5wZExJb2JuSDdJWVFCQWFuN3NhUzIvQ3J4L2tDcUFwb0V3c3U1ODIr?=
 =?utf-8?B?blNMbXBlTW9hZklyK0pEVkhTSzhOMzJsalUrRU9JTm5vYUNkeStpYXY0ZVFJ?=
 =?utf-8?B?SDNLYzBTTE1sQVIvckk5WGUwUHFGdEx1aStUUnJzVjRUSHljSHMwcTNFV3M4?=
 =?utf-8?Q?B12wNmCinh28fY2k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d797b9e1-9461-4941-f180-08da2450e7a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 11:11:52.8010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vtXyiHVkgHIO7wUPdrqx3H15xEKJyIv2XGnPy3wYbugBP4L3JEtpaCUFDLw3Lj4/d82o69MKk2TntsPvyug1ijVGLQt/BSP0nFOodx0f73Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9601
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMi85XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgUExMNV80IGNsayBtdXggc3VwcG9y
dA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgTWFyIDE4LCAyMDIyIGF0IDY6NTEgUE0g
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBBZGQg
UExMNV80IGNsayBtdXggc3VwcG9ydCB0byBzZWxlY3QgY2xvY2sgZnJvbSBjbG9jayBzb3VyY2Vz
DQo+ID4gRk9VVFBPU1RESVYgYW5kIEZPVVQxUEgwLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IFJGQy0+
VjE6DQo+ID4gICogUmVtb3ZlZCBMVVQuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+
IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiArKysgYi9k
cml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+ID4gQEAgLTcxLDYgKzcxLDcgQEAgc3Ry
dWN0IHJ6ZzJsX3BsbDVfcGFyYW0gew0KPiA+ICAgICAgICAgdTggcGw1X2ludGluOw0KPiA+ICAg
ICAgICAgdTggcGw1X3Bvc3RkaXYxOw0KPiA+ICAgICAgICAgdTggcGw1X3Bvc3RkaXYyOw0KPiA+
ICsgICAgICAgdTggY2xrc3JjOw0KPiA+ICB9Ow0KPiANCj4gSSB1bmRlcnN0YW5kIHlvdSBjYW5u
b3QgdXNlIHRoZSBwbGFpbiBERUZfTVVYKCkgaGVyZSwgYXMgImNsa3NyYyINCj4gaXMgc2V0IHVw
IGluIHBsbDVfcGFyYW1zIGluIHRoZSBEU0kgZGl2aWRlciAocGF0Y2ggMyksIGFuZCB5b3UgcmVs
eSBvbg0KPiBwYXJlbnQgcHJvcGFnYXRpb24gYWdhaW4gdG8gcHJvZ3JhbSB0aGUgbXV4IGFjY29y
ZGluZyB0byB0aGF0Pw0KDQpZZXMsIFRoYXQgaXMgY29ycmVjdC4gQ2xrIHNyYyBmb3IgRGlzcGxh
eSBQYXJhbGxlbCBpbnRlcmZhY2UgYWx3YXlzIG5lZWQgdG8gYmUgIjAiDQphbmQgZm9yIERTSSBp
dCBjYW4gYmUgMCBvciAxLiBDdXJyZW50bHkgZm9yIERTSSwgdGhyb3VnaCBnZW5lcmljIGVxdWF0
aW9uIHdlIGNhbg0KZ2VuZXJhdGUgUExMNSBmcmVxdWVuY2llcyBmb3IgdmFyaW91cyByZXNvbHV0
aW9ucyB1c2luZyBjbGsgc3JjICIxIi4NCg0KVGhpcyBuZWVkcyB0byBiZSBleHRlbmRlZCBmb3Ig
cGFyYWxsZWwgaW50ZXJmYWNlIHdoZW4gd2UgYWRkIHN1cHBvcnQgZm9yIGl0Lg0KDQo+IA0KPiBJ
IHRoaW5rIGl0IHdvdWxkIGhlbHAgdG8gZG9jdW1lbnQgdGhhdCBzb21ld2hlcmUuDQoNCk9LIHdp
bGwgRG9jdW1lbnQgdGhpcy4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiANCj4gVGhlIHJlc3QgTEdU
TSwgc28NCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU+DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0K
PiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
