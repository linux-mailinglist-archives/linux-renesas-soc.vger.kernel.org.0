Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C10D67CF7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 16:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjAZPMU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 10:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbjAZPMS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 10:12:18 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2101.outbound.protection.outlook.com [40.107.215.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB526F208
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 07:11:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAu0ltzjKTw+aelIFtzZdIpmEho8AZBWyIiQoZpCssxxP+9n55LSh+LSIDmEIsEqZrQ1s7txwL7a9mp1FmptnULM+ND9tKzZKvSv6LZTI/4V7L8Cype37qA6oSdorCsxXRkoyg2u0s9ZwF7sqXbC4n1nfgH/LRmbhjiAJnWMDI9xz9kzZpXceH9O60eCSCFh28aOBby99c4z28ftkuvgN/TiMqns7z9l9AIugJnK4iUUuaQFG5nEnn0cJLxAr5RJr6M6u3zEWykNdZ0MO/wjRBJ9hawuIqPTN6GYyyxl2xDwlh4eSHheUjeVSdy1SeS+Zedbfwo03RQv/fmXyvsGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Jdt0yaXonQ6HNDAURBUTeDFCh5E9t2PASkNhqhd878=;
 b=Bb/efnJ+FovY9DaP4Wr/C7pTL3nuJG+aS9563T8EM5eNNUG6W0Mlby7bbSvyBT5QXto477NuHydYKJcc+tuLg9NlrQ4LjFgEgm7nq1qFn4HD4FcyGmqu46sYk6jdpd8FqsJvzwGwCupXwCwBimKLQFYsvydTKFR3FL6OfTM7HVYm/RnCOTsCAZNw7e3sLvqvjn3hlHJLWnxGHXNHPAy75EuBXxzZLCsuTamHp9QxYrdsQTxlldp1D93tWIEmCYcBNiGzfBxGsZxM/o1vWfDllun4RHF0csUPJ6TMF51UMD5e//WkjIzmQwUBOD3GQtIG92YdVMivWDqou5/8+VgFlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Jdt0yaXonQ6HNDAURBUTeDFCh5E9t2PASkNhqhd878=;
 b=pWuPZtBdxsQolzGCvGf6f9Mm704rycC+Hu70siEKANdy7dqbAsO3rTMTvNkGkmJU/Pm0+rQzpPTlYyeIjqtd0/0Db0PguPXNVlwtgNmLdLOw0qDM4jhW/g4CDjV5QfKCUZe8ejA3Ow7b+4PcVsPlwjadwRrEgl4eypt8RGZlhlQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB8120.jpnprd01.prod.outlook.com (2603:1096:400:fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 15:11:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 15:11:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
CC:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: RE: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Thread-Topic: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Thread-Index: AQHZJ2qh0xCJ0ka0qkO8eIRJwRDaI66wmfQAgAACtkCAAD/3gIAAAymA
Date:   Thu, 26 Jan 2023 15:11:54 +0000
Message-ID: <OS0PR01MB5922046617C1C9461DEAA7A786CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230113161753.1073706-1-biju.das.jz@bp.renesas.com>
 <20230113161753.1073706-3-biju.das.jz@bp.renesas.com>
 <9f722f37-15da-0384-c059-a4af0f1dab10@linaro.org>
 <OS0PR01MB5922F1D5EEBE6D5B24F1820B86CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y9KTi4TYjh9qwBPE@google.com>
In-Reply-To: <Y9KTi4TYjh9qwBPE@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB8120:EE_
x-ms-office365-filtering-correlation-id: d5a24611-ce44-4368-23cd-08daffafa8bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pcxwlC67KTYx+lvy0KTMnxB7XQKpjMPbv5KB9GIJnwt73GSfGg2QvpbxVOyKaxFVT+p/yiqGgfSWCSknw3qSRix8g03xBRHn876gH/CT5dnOPS7wFUSTeFNbKKKwDJojO7dH+DEmBMeInK60VWNCNLVPMgfL4UPf9nbAAFmdgAk0Gz+uvxMh+xrdM2+viC0rGy9SbbHYos2ScgVcwNzNeNhHlW+t3cBFr4GlcQYcsJP+3l1rQbNqr6aiytExbcsH7GY7etizy7EhzeZV0YiU/xKQLUt+AQojESpoCkMFnwWglO0PC8s753fxPgytJt2uxMbXjKM/LOAvpEkdyB3yOS0t3wvUjpGaOPgsL9ddux0LiyyaqOTgabc9ZFMFf/dkwYZfev3T+fdDALKohz4lXjAkm0S1JNxbw0GS7NDxo58Y1aGEgNPr5ekxZyRtnI75VbyymtKSNJefplSXHehVZwA9JqLs/+3PWMSnwDWXSRAgTbPr5ZiwuD5inEBqoBQ5MDkZc8CWpOTQ/NTJn3Br0eC9IOXYbpRefanCvZ8XeiwJrMvYdIPKkO0zivtpawyrQ2UxnpQ3MLkDIDUdW/cB6mCrU29jDVeQDnm2rTef+60SGRE9Rt1+XyYS7cXBu3bzO9ijEOUtox7spzpB/lRvm+peBMCJ/7eyHUJP8v89jeXa3xI+qjjLL/R66eM0SwqhjatBAZuSYMrYeQ9LbhtlrON/ntZlrY3oAC4CpfrUo2A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199018)(38070700005)(122000001)(38100700002)(2906002)(316002)(45080400002)(478600001)(54906003)(8936002)(41300700001)(966005)(33656002)(7696005)(71200400001)(86362001)(83380400001)(9686003)(186003)(26005)(55016003)(6506007)(53546011)(4326008)(76116006)(5660300002)(52536014)(8676002)(7416002)(64756008)(66946007)(66556008)(6916009)(66476007)(66446008)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3RWclpVdUhsOGNSNTNkdzlDSThMQU9KMDZiTEYvaUhUZnR0NkJnN1BHY253?=
 =?utf-8?B?WVZiNjVsNWkrak9iZEdBbTJNbFI1Q1M5c21xdXk1bG5zVzNvQnZNL1k3b2dk?=
 =?utf-8?B?OWVWTDAzT2k2dTZ3TVBMaXQ2MUhnTnFaQzBqQU5vdHJ3eUNobklLRU1YRHlV?=
 =?utf-8?B?ZlhlcFp4R3NyZ2RDcWEyb016Y0loS0VFdnFaallJMm5iK1FybTV2K0F5ejlt?=
 =?utf-8?B?bis0TktTaXNrM2JieFRVWWc2c1RVVU5FT0UzenEvYU9KR2pPMVlmSWc4OG9p?=
 =?utf-8?B?TW9Qdk9uSXp5anZUSVE2dy9lcHM4cTRjZVNsajV1MkltbERNTWhvMisxa2sr?=
 =?utf-8?B?SnBZOGpxakFMSXBVYm5PczF4c2M5N3pjVW5lV1dXWHUrN1BOSFljMjV2Zm83?=
 =?utf-8?B?MzZKZ09hekN2SDdGZmMzelhjS0Y5US94Z1cwdWNQQUdWSUpjMEUzUUg0Rkl5?=
 =?utf-8?B?YVhxTWN5WUFpV3lTL0RUNmY5dTN1RmVlVm5haGdaQ29RaklKZG5nZzN4S1k0?=
 =?utf-8?B?bk9WZVg4V3R3TkRBZXhhc0RZU0oycWVBTW12K0l2U1M4bHFFbzBoOU9XQitJ?=
 =?utf-8?B?MjhzbFUrZkx6TGZ3enN6a3pGaEdHVG5HSUlHeDV6MjZWQnVyNTArbGpCR1l4?=
 =?utf-8?B?bjhaUzZubTFScjlPMEZmTCtDdU93SHhheTBsT1pWcnRBWnlNV05BRm1kQTB6?=
 =?utf-8?B?OUVPY3QvOWdtTmF0YlpHenVYNWxxQndiU1J4YlArTk01d0JVMXc0MXBueWZa?=
 =?utf-8?B?aEExcW5VN0dxN28vSjRDb2pHaEJhWjVLK3lDNG9wd0RHNHcybERCYVY2aVRt?=
 =?utf-8?B?RkxGZjR0TlkxL2c5VjRGVHpBc29ORjVzMjlSdjFDZVlqemQ5L1FoeDkzMzgv?=
 =?utf-8?B?Y0lkOVVwZkJsVmpjSWRtOHZOWXZscUVQaDFVT0wrR0hXYXJ6KzkxSkw0ald3?=
 =?utf-8?B?ZWdMcmIzait5MEMyLzVuN1BRQUw5SmcvNWJ0Ums4U2c3ZnlLZ0w5RlRPL2ZB?=
 =?utf-8?B?aXc0bVJSdVJCR1loUXpIbFBrMEVka0c4VUtCSmdzUUhQc0dTaDljREQ0dmFx?=
 =?utf-8?B?Y0E4dlBNclhjZ2xZZ2MySjRhdG93bHRqcHdZMURJbTcvRW9WVzJGb09FSkpp?=
 =?utf-8?B?WTVlVmw1NkRkYlB0NnpCWXNQRWl6T3lsTkRuM2Q4L0RWdS9rM01lc0JaTzdx?=
 =?utf-8?B?WjZiTTY2cUx6V0Z2WXR1QTNRU1N6M09PblJ3anVLYlQyU0JlSVd5blRqU09N?=
 =?utf-8?B?YU5lVjh1RVRLWDVrNnRwV1hWditVcE5DcVhxZlNUK2drUkxUeFFNQW0xdlox?=
 =?utf-8?B?YW9VdFRIaExmZGFWZmpMQ3Q2bkN6Vkk0M1ZIbVpsOXlwMW1zYlhNWjdEUURX?=
 =?utf-8?B?M295TGdRYlRBVEVxTjNucVdxOWdSMXE4aENSVTAxemdiQnVpUWFJZ1RBZFNY?=
 =?utf-8?B?dzJ6N0UvQTFwOTRPL3lVam5zai8vcTFOUUFybnpjdDZCNlRhNzc5TThVMlNR?=
 =?utf-8?B?eHJxMGpDeEk0Q3BHKytJaWxYNm15R1NCb1NEOElzVWpZQTJOMGxQbk9nWGVa?=
 =?utf-8?B?cm5BT3B6c01oVE4xM3ZKMXJJelk2RFh4VktyQWMrYUtHb3BVTWYwVlFQM3lJ?=
 =?utf-8?B?ZSt1NXpVV1lpM2lETEREUWZDSFhoclJ1RDc4MFhlbEVsWXY4Vnc5Um1KVUtM?=
 =?utf-8?B?YjZvdHVUWkZSMHViTzVtMmVsVkNmanZ0bEFXTjkrZmh0NDhvc2J5T2I1SnNZ?=
 =?utf-8?B?MnJUZENXSy94STFnWmE2YTg1V0FIS0VaOWVYbWh1dkZKd2JvOEZlTXRBTjlO?=
 =?utf-8?B?SjZDSlN0aXd6SEMwc0xCTmZ1dHJpOWZuL1ZZWGxoc3Q4V1Izc09UTncvTlBB?=
 =?utf-8?B?SmhTM3FLdkxGbk9rQnhFUTcyTE5ab3RzUk5vc1JMdjVROExmQlhDSGF4clRz?=
 =?utf-8?B?cmpCcTE4Nm5FVmFuVkhFamYxaHkrUXBMWStIVk1LM2I2WWJkWExmbjBlMjNh?=
 =?utf-8?B?SXZIcVZtVmVxQzJlSS9qZzcwMC80dFFHSzAzdE9MVmZJQ05BdWhoNWF0eExn?=
 =?utf-8?B?VGlaNUxCbGg2dHdQbUFmZXd3b1NxZUluWXZ3M0xmRjZBbGp3Q2pmRFpEVmdo?=
 =?utf-8?B?SDh1ODU5ZGc1MGxGMExtM2RpempaT3JJRmpHTS81ZWxDeTYxbnFLUktyK25B?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a24611-ce44-4368-23cd-08daffafa8bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 15:11:54.1230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cbZXOGrKKKarc65Qxbk5espE+ClrD9i6LoTJfDIKGslk3p5FJ7dCygO46/GARvDrvAAzop4JkpEM1kLzbnEE1vTDQS41xRH4HygbpfiZ+kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8120
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGVlIEpvbmVzLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPg0KPiBT
ZW50OiBUaHVyc2RheSwgSmFudWFyeSAyNiwgMjAyMyAyOjUyIFBNDQo+IFRvOiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVs
LmxlemNhbm9AbGluYXJvLm9yZz47IFBoaWxpcHAgWmFiZWwNCj4gPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+OyBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT47IEdlZXJ0DQo+IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBDaHJpcyBQYXRlcnNvbg0KPiA8
Q2hyaXMuUGF0ZXJzb24yQHJlbmVzYXMuY29tPjsgUHJhYmhha2FyIE1haGFkZXYgTGFkIDxwcmFi
aGFrYXIubWFoYWRldi0NCj4gbGFkLnJqQGJwLnJlbmVzYXMuY29tPjsgbGludXgtcmVuZXNhcy1z
b2NAdmdlci5rZXJuZWwub3JnOyBSb2IgSGVycmluZw0KPiA8cm9iaCtkdEBrZXJuZWwub3JnPjsg
S3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3Jn
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMSAyLzZdIGNsb2Nrc291cmNlL2RyaXZlcnM6IEFk
ZCBSZW5lc2FzIFJaL0cyTCBNVFUzYQ0KPiBjb3JlIGRyaXZlcg0KPiANCj4gT24gVGh1LCAyNiBK
YW4gMjAyMywgQmlqdSBEYXMgd3JvdGU6DQo+IA0KPiA+IEhpIERhbmllbCwNCj4gPg0KPiA+ICsg
Um9iIGFuZCBLcnp5c3p0b2YgS296bG93c2tpDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGlu
YXJvLm9yZz4NCj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDI2LCAyMDIzIDEwOjUzIEFN
DQo+ID4gPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgUGhpbGlw
cCBaYWJlbA0KPiA+ID4gPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+ID4gPiBDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPiA+
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IENocmlzIFBhdGVyc29uDQo+ID4gPiA8Q2hyaXMu
UGF0ZXJzb24yQHJlbmVzYXMuY29tPjsgUHJhYmhha2FyIE1haGFkZXYgTGFkDQo+ID4gPiA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPjsgbGludXgtDQo+ID4gPiByZW5l
c2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IExlZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+DQo+ID4g
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMSAyLzZdIGNsb2Nrc291cmNlL2RyaXZlcnM6IEFkZCBS
ZW5lc2FzIFJaL0cyTA0KPiA+ID4gTVRVM2EgY29yZSBkcml2ZXINCj4gPiA+DQo+ID4gPiBPbiAx
My8wMS8yMDIzIDE3OjE3LCBCaWp1IERhcyB3cm90ZToNCj4gPiA+DQo+ID4gPiBbIC4uLiBdDQo+
ID4gPg0KPiA+ID4gPiArY29uZmlnIFJaX01UVTMNCj4gPiA+ID4gKwlib29sICJSZW5lc2FzIFJa
L0cyTCBNVFUzYSBjb3JlIGRyaXZlciINCj4gPiA+ID4gKwlzZWxlY3QgTUZEX0NPUkUNCj4gPiA+
ID4gKwlkZXBlbmRzIG9uIChBUkNIX1JaRzJMICYmIE9GKSB8fCBDT01QSUxFX1RFU1QNCj4gPiA+
ID4gKwloZWxwDQo+ID4gPiA+ICsJICBTZWxlY3QgdGhpcyBvcHRpb24gdG8gZW5hYmxlIFJlbmVz
YXMgUlovRzJMIE1UVTNhIGNvcmUNCj4gZHJpdmVyIGZvcg0KPiA+ID4gPiArCSAgdGhlIE11bHRp
LUZ1bmN0aW9uIFRpbWVyIFB1bHNlIFVuaXQgMyAoTVRVM2EpIGhhcmR3YXJlDQo+IGF2YWlsYWJs
ZQ0KPiA+ID4gPiArCSAgb24gU29DcyBmcm9tIFJlbmVzYXMuIFRoZSBjb3JlIGRyaXZlciBzaGFy
ZXMgdGhlIGNsayBhbmQNCj4gY2hhbm5lbA0KPiA+ID4gPiArCSAgcmVnaXN0ZXIgYWNjZXNzIGZv
ciB0aGUgb3RoZXIgY2hpbGQgZGV2aWNlcyBsaWtlIENvdW50ZXIsDQo+IFBXTSwNCj4gPiA+ID4g
KwkgIENsb2NrIFNvdXJjZSwgYW5kIENsb2NrIGV2ZW50Lg0KPiA+ID4NCj4gPiA+IERvIHlvdSBy
ZWFsbHkgd2FudCB0byBoYXZlIHRoaXMgb3B0aW9uIG1hbnVhbGx5IHNlbGVjdGFibGU/IFVzdWFs
bHkNCj4gPiA+IHdlIHRyeSB0byBhdm9pZCB0aGF0IGFuZCBrZWVwIGEgc2lsZW50IG9wdGlvbiB3
aGljaCBpcyBzZWxlY3RlZCBieQ0KPiA+ID4gdGhlIHBsYXRmb3JtIGNvbmZpZy4NCj4gPg0KPiA+
IEZvciBjcml0aWNhbCBkcml2ZXJzIGxpa2UgQ1BHLCBQaW5jdHJsIHdlIGVuYWJsZSBpdCBieSBk
ZWZhdWx0IGJ5IHNpbGVudA0KPiBvcHRpb24gaW4gcGxhdGZvcm0gY29uZmlnLg0KPiA+IEZvciB0
aGUgb3RoZXJzIHdlIGFkZCBpdCB0byBkZWZjb25maWcsIG9uY2UgdGhlIGRldmljZSB0cmVlIHN1
cHBvcnQgaXMNCj4gYXZhaWxhYmxlLg0KPiA+DQo+ID4NCj4gPiA+DQo+ID4gPiBbIC4uLiBdDQo+
ID4gPg0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmV0ID0gbWZkX2FkZF9kZXZpY2VzKCZwZGV2LT5k
ZXYsIDAsIHJ6X210dTNfZGV2cywNCj4gPiA+ID4gKwkJCSAgICAgIEFSUkFZX1NJWkUocnpfbXR1
M19kZXZzKSwgTlVMTCwgMCwgTlVMTCk7DQo+ID4gPiA+ICsJaWYgKHJldCA8IDApDQo+ID4gPiA+
ICsJCWdvdG8gZXJyX2Fzc2VydDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCXJldHVybiBkZXZtX2Fk
ZF9hY3Rpb25fb3JfcmVzZXQoJnBkZXYtPmRldiwNCj4gcnpfbXR1M19yZXNldF9hc3NlcnQsDQo+
ID4gPiA+ICsJCQkJCSZwZGV2LT5kZXYpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICtlcnJfYXNzZXJ0
Og0KPiA+ID4gPiArCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGRkYXRhLT5yc3RjKTsNCj4gPiA+ID4g
KwlyZXR1cm4gcmV0Ow0KPiA+ID4gPiArfQ0KPiA+ID4NCj4gPiA+IEknbSBub3Qgc3VyZSB0aGlz
IGRyaXZlciBmYWxscyB1bmRlciB0aGUgY2xvY2tzb3VyY2UgdW1icmVsbGEgYnV0DQo+ID4gPiB1
bmRlciBtZmQgW2NjJ2VkIExlZSBKb25lc10NCj4gPiA+DQo+ID4NCj4gPg0KPiA+IFBsZWFzZSBm
aW5kIFsxXSwNCj4gPg0KPiA+IEFmdGVyIGEgbG9uZyBkaXNjdXNzaW9uIHdpdGggZHQgbWFpbnRh
aW5lcnMsIGNvdW50ZXIgbWFpbnRhaW5lciwgTUZEDQo+ID4gbWFpbnRhaW5lciBhbmQgUFdNIG1h
aW50YWluZXIsIGl0IGlzIGNvbmNsdWRlZCB0byBBZGQgdGhlIGNvcmUgZHJpdmVyIHRvDQo+IHRp
bWVyIHN1YnN5c3RlbS4NCj4gDQo+IFdoaWNoIGlzIGZpbmUuICBIb3dldmVyLCB5b3UgY2Fubm90
IHRoZW4gdXNlIHRoZSBNRkQgQVBJLg0KDQpJcyBpdCBvayB0byBrZWVwIHRoZSBiaW5kaW5ncyBp
biB0aW1lciBzdWJzeXN0ZW0gYW5kIG1vdmUgdGhlIGNvcmUgZHJpdmVyIHRvIE1GRA0KYXMgaXQg
aXMgdXNpbmcgTUZEIGFwaSdzPw0KDQpQbGVhc2UgbGV0IG1lIGtub3cNCg0KVGhhbmtzIGFuZCBy
ZWdhcmRzLA0KQmlqdQ0KDQoNCj4gDQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly9qcG4wMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGcGF0Yw0KPiA+IGh3
b3JrLmtlcm5lbC5vcmclMkZwcm9qZWN0JTJGbGludXgtcmVuZXNhcy1zb2MlMkZwYXRjaCUyRjIw
MjIxMDEwMTQ1MjINCj4gPiAyLjEwNDc3NDgtMi1iaWp1LmRhcy5qeiU0MGJwLnJlbmVzYXMuY29t
JTJGJmRhdGE9MDUlN0MwMSU3Q2JpanUuZGFzLmp6DQo+ID4gJTQwYnAucmVuZXNhcy5jb20lN0M0
YzU4OTZkOGMwMDY0ZDVlMjYxODA4ZGFmZmFjZTM5MCU3QzUzZDgyNTcxZGExOTQ3ZQ0KPiA+IDQ5
Y2I0NjI1YTE2NmE0YTJhJTdDMCU3QzAlN0M2MzgxMDM0MTUyNTY5MzQzMDYlN0NVbmtub3duJTdD
VFdGcGJHWnNiM2QNCj4gPiA4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENK
QlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDDQo+ID4gMzAwMCU3QyU3QyU3QyZzZGF0YT0y
VGtOMiUyRkVXQ3ZDOXlBZWlSNGZXMGl4ODRBZmlENDFCSXVITXVLTURHbnclM0Qmcg0KPiA+IGVz
ZXJ2ZWQ9MA0KPiANCj4gICAiVGhlIFRMO0RSIGlzOiBpZiB5b3UncmUgbm90IHVzaW5nIHRoZSBN
RkQgQ29yZSAoYW5kIGluY2x1ZGluZw0KPiAgIG1mZC9jb3JlLmgpLCBpdCdzIG5vdCBhbiBNRkQu
ICBZb3UgKmNvdWxkKiBzcGxpdCB0aGlzIHVwIGludG8gaXRzDQo+ICAgY29tcG9uZW50IHBhcnRz
LCBwbGFjZSB0aGVtIGludG8gdGhlaXIgb3duIHN1YnN5c3RlbXMgYW5kIHVzZSBhbiBNRkQNCj4g
ICBjb3JlIGRyaXZlciB0byByZWdpc3RlciB0aGVtIGFsbCwgYnV0IGFzIFRoaWVycnkgc2F5cywg
dGhpcyBpcyBub3QgYQ0KPiAgIGhhcmQgcmVxdWlyZW1lbnQgZWl0aGVyLiINCg0KDQo=
