Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0DF63EC38
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 10:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiLAJUx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Dec 2022 04:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiLAJUv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 04:20:51 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2121.outbound.protection.outlook.com [40.107.113.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B3455AAF;
        Thu,  1 Dec 2022 01:20:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elmN95dlXr5n8CVWLQDQZz7WR9Ee2AAHlU5CQlMQ5vtJe6AXVH3snuwXvSsVTowtOMYBXEUVwUpxDBr/0qBTCSxBV25XC4bH7l8e/5myLhhIa6kA+tcwfbIZKX9amlIsFeC7QPsx8dK/6oqwxy7K+3FqAGO6/KChDGqVkuKmB1lW3p/oi6cYg2t+H1eAY9Ep/ClBoUogQun2+s11GZtVAezUlE8pgjocIg+yAHrfZtZgc6V64MTMOVwsAS9+QgDjqcaC00WK7Jsng5JaYkqmVeGppYNADze8s6RCDUCeIobN+/O/Xkk7NW5JV7lQjVMx44dnN/gk0HL9FT0w60N3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwxJoiUt3+BIMQA43KN2Cg3zPBMFDetDKtmR5QzrnMA=;
 b=MN0TY6u3V8efDD+5D8MHdqkoJteQrdxdgdXMGFjBaq/lGJQzAm8b5cp/Ks0hgh7FMYDwCe5GTiWlr4F+O41jAjjOUMyWsgxtf1kG4vSyn8C40VnhxYklh9tIv8M3pdLY41h0p4xGo6FTnt2YucMBRIdaTVh4MvIagWszD7gmkgss4e/v9b1PjqPh9ENNRUYn/gbWttdZQH4EKyy7yrEz32adzC+KdY4iZr/P/QumwuI4SF9p8g/RNlW3uz06dfZoPnCFuEAzastsCQ0dy/ordSjzznyYKFz2O03udBtOA6vX2No3Qd292ACp2vF6wSSLSAKEnomOInlf3zzmxFoYew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwxJoiUt3+BIMQA43KN2Cg3zPBMFDetDKtmR5QzrnMA=;
 b=QyngoobRhnaP+tbh+SCToowEL9gl0hRe59qE8ilZ2I5s74So1VuhTJQkrQcboXigNhu3xl8NHxt65gE3t4mo+hud/fXG646oGTG40WPwRF/gwBQAa2bDtBZ9m0QH7+oHQxFIbOn2Fiw8/JIVPyToveZST0zY7avWvpHpD1C1nKw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9306.jpnprd01.prod.outlook.com (2603:1096:400:197::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 09:20:47 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 09:20:47 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
 carrier board
Thread-Topic: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
 carrier board
Thread-Index: AQHY/qRdHnnq9f6Pjk2Z6VVJLbhAZ65LVS6AgAAAlfCAAAWZAIANbl+AgAAAwQA=
Date:   Thu, 1 Dec 2022 09:20:46 +0000
Message-ID: <OS0PR01MB59227AF03E84568B443C053286149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221122185802.1853648-1-biju.das.jz@bp.renesas.com>
 <Y30j7Q6Jc/y8mGTu@pendragon.ideasonboard.com>
 <OS0PR01MB59224A76B83B9A2318A8D4E9860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y30pHOylptuMxFgX@pendragon.ideasonboard.com>
 <CAMuHMdUjibk0FO0+Su5NbV-pgBhiYqVsjX6XM5Sg2nXyybA3YQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUjibk0FO0+Su5NbV-pgBhiYqVsjX6XM5Sg2nXyybA3YQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9306:EE_
x-ms-office365-filtering-correlation-id: 1e00d175-3b87-45d7-bada-08dad37d549b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a115JZMSTDNCgFHZ1bNcg/zWmo71dtaRwlpzkdNFjDHQ8bju6EdVZy7LSL+6MJXYe+JvjP66mjFtgA5jvLdshzL61vWYOg4s6xwmGJlZgSybCM9cFr4Xu+j8EsAVsgnrcE0j1crtKnIIdC5IRHrVAzK2kG+sFZvzbQb1DObold64TTXoUX9sJdLRYBdtGyE1GKH0fikvuNtMh0t//MeM87z0TxdDrjsUDq1pa71PCcHCl9rPYbxk+ZAHHU/HH9tQe5Eye3z/nTva3/D90sqwl78BJP3mE4ixb9nZ3gIQxrYvrNRP/Enz89GBx7lrAIHsBA0PiN0EPmBYZEAPaxiMIT2ci/9gMyhyvFA3w/1QveFr9S5AgXU9q411JAhvkc6y5pTWKrG/TvSeGNJsbGJ6pyuNIJbX3rj7KVrpj/XXo39MhJVOpBn+jzYf43YKzYLvlxSuyuD+DI6o8UYFp44yquND8v8yDYGRAF+x3isM4vTP91ygRdlVcVqupuEvQgWnvF/DrWED7hluf5fdYVHA0QLBKHCTEk1M1W5zrMZtAKpHMoe1r+ENCzDSSaJdPwtANZbI+VncVix4xtgJH7ma1lmCoN76KzRCdLCmR4Z/ghlPP1IIpEms5IKEIkkhNjWfG/WQR2SMVx7KyFr1+sidKwdNS9YcJ0mackD11NzhpoyKttXLOrtM4hsMpJ1LtGUakGxjCDSrLu32X+J+bHLaIEnixH//DjxpbVnkVssiLSsWW1s/aIZR4ypDM8oXA28KByY8NApTh1sJ0ULlOe6TJw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199015)(76116006)(53546011)(966005)(66946007)(9686003)(64756008)(7696005)(478600001)(71200400001)(316002)(4326008)(66476007)(26005)(8676002)(55016003)(33656002)(38070700005)(8936002)(6506007)(52536014)(86362001)(2906002)(66556008)(186003)(41300700001)(66446008)(5660300002)(122000001)(6916009)(54906003)(83380400001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDhWK3U2ZGhHZzBnL1FNVitpSWVkUkhIcUdBcU1YanhUMkxxdGdUWFlyaFNV?=
 =?utf-8?B?ZXZHNkloNUNPNjM5WnFlN1d1b0xxS0hyZkthVkdML1FFTUhsZk83SytDemZr?=
 =?utf-8?B?VDY5QThSMDB4WEZ2QjdhN3c3SkxxOFF4M2J0UWpHdVhQUXZ2OURpVHRyVXVr?=
 =?utf-8?B?a294K1pQOE9KVHBwMXJ1ZzNQVWpVZ05OSnAvWU5TQ2I5RUZyQXVvYmczT05s?=
 =?utf-8?B?Mll3SDljWHo0UmNzY21YNDB2Q0krMUwwSkJ0clFrSGZqVmQ4bzFYSkJvc29F?=
 =?utf-8?B?MXF1czZXT0pGNGZ6KzZ0eUhyWFJUTUlLenZFTUtKSUtrVTMzanVWRlFMWmRU?=
 =?utf-8?B?RU5UbForcnRzZTJtMkZCMzVyVGd6OXJsNzNyZWgzMXEwY2lOS3kvZ3R5VCt6?=
 =?utf-8?B?VzhqUWJ5b24wbFp1TjkxL3cyTiswUzUzdngrZlFyR29EMVB5dVJXU0VialFx?=
 =?utf-8?B?cCtDM01Dd2RnaUJWWkRPZkZZQk5XSWZSNW5hODZQSENqeGt6ZXZ4dG9jZDdP?=
 =?utf-8?B?TGxMQWUyWE9wSGJLUkZjd3RiQzFpZHNHNmZpUEs5MXo0djFMSC9EZnJoblps?=
 =?utf-8?B?dmJ2dVNGOFEwY3EwVTN0aFQvUEp1Z3NNTEJVamlDZ2ZNSU1CZWN1ZnN6UUow?=
 =?utf-8?B?UlkxaUF3WDVMU1B2TStldzlxZzNGZ0pKa1lEaW5PVlprYTFZc094S2FNdm1z?=
 =?utf-8?B?TXNibzI5VWZWZEdtWDBCRDhydldlSG55RVJzN0pmZUxUU1ZvQTNyYm03QXR3?=
 =?utf-8?B?dnMvVTVLNUdZMWVuRjA1Z3Z6RllIbzgrclRuRENDc3QvRTZyVEFOS0o5YXgx?=
 =?utf-8?B?QngvaDNzdVlwSjZpVjRFQ2lpSzFlaWRwZWY5cHAxUGwzZnhoWkRRK21PWWpR?=
 =?utf-8?B?N3B3U1NGU3RzQUNkaEQxbEVGTXJjcWhDS1hwL1c2SnRWWit2ZGtBS3E0SFZq?=
 =?utf-8?B?c0ZhN0FYRFJmRkpEczh3S05OWGpDRjlqdkxSaDFhMi8zaXptRUZoT3NKRFEy?=
 =?utf-8?B?cG5Mam5aaTBzREpRZTV5NXE2UTJUZEUxaXpwdTNVbjRDSnoyV1VsL3RCbGlZ?=
 =?utf-8?B?Vy9qZXozQW00Zkx0Mm1iaFd6cnhoMmVNVThybkdCaG8yeUtvOVArY0llSlcy?=
 =?utf-8?B?VnRjT2pLQ0RNdDlMRnJrVWd5Qncyd1dxeS9OVmx1SXM2OHR5UG43TjIvMFRz?=
 =?utf-8?B?UkM4MXNhVVZoUi8rc2xyK1lwQmZJRnFBdGI1Z2dZalNLZ3JlU1QzREhTNUNW?=
 =?utf-8?B?ZHhPZjZDTGZJdWR2UjBGeUZhWjJvTE9RQ1BtODVwK0ptNElBbEhvVXEzclFP?=
 =?utf-8?B?bjVjaVlaZWpqQVlGbWNjVDVjaEtpekhzbFdhbjhLK3czUjhOb1JKNUwvYUhR?=
 =?utf-8?B?VzhEWDFMQkNqSGp4R2g4N0U2U2EzbkJoZW9DTlVra0wxZGg1RWNQVUFLTnBX?=
 =?utf-8?B?Y3lQN0xUckx0OExwVmF5alFrR1Nud0V5aGFkZVdsWFA4Y1ZiZzlBd3FQMzBR?=
 =?utf-8?B?Y1ZieGE5b2RubTREWDdkRld5UmR1M1NPN3ppcnRMekNhVmNsdG1vbFlBbXF1?=
 =?utf-8?B?VG9mL3NYWVBqNWtBNUxEbkQzODU5Q3VqQ0tjc0dVeFVxRFd6STFseHNnalBZ?=
 =?utf-8?B?VFJaNUZOdXY1R1hkS1RBVzM0TGNYcnFUM21mVmZQRjdKYUl6c1lYWnBvRHhw?=
 =?utf-8?B?aFM1N0h1OXRFM0tLWGRKVW5uczI0SGdpK2lGaXE1bFU5TUptTFo5bTFDZXpI?=
 =?utf-8?B?NElSRnBYVWxwUUVuWTR2WFQ3STBuQkRXTEJSUU5MTWxCSHQzZktjRHBralhW?=
 =?utf-8?B?RGhoaWI1V3g0cnlUNmZlaloxa05uOWhxbHhjUXgxV2kwSDlVSWZmQkNmTXU2?=
 =?utf-8?B?US8yalpBSWNrY3lOaXdQQjlwUE5oWDloRURvYXNKZy9vTjQrcWR4WC96Zzg1?=
 =?utf-8?B?OGpMMXlMdjVJd3dKa1o0WG1HU3dIdGM0c2RTNmxCTERnWTJrK0pWVEdycjhU?=
 =?utf-8?B?SSt1K0hQVWRVWXc2K3FIMGswQWQ4bzV2VElNQ0E1ZnVtcnBCNUg3NFdhbE5o?=
 =?utf-8?B?T2lvMVNIN2djVU1kNXBVdk5ydGZ6RzBVU3pmVGZOWnRVc1M0U1BqMUMzZitU?=
 =?utf-8?B?Zkpoc0kyVkc3dzRNVHpodjJxcjViOWZxVkN5MzVCRnpnbVpKczBZUllOWmFi?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e00d175-3b87-45d7-bada-08dad37d549b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 09:20:46.9738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NGK4ZEXCnT6Bme6cmkuMD9+YjsXTqKm4M8mAag0YZQfqwc/mk5qsHjc71Z7KxfdzTS+b4L2EGde+0/WjkzN7C5Bcln/PrUaQgadhXpS0QZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9306
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJsLXNtYXJjOiBFbmFibGUgQURWNzUzNSBv
bg0KPiBjYXJyaWVyIGJvYXJkDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmtzIGZvciB5b3Vy
IHBhdGNoIQ0KPiANCj4gT24gVHVlLCBOb3YgMjIsIDIwMjIgYXQgODo1NSBQTSBMYXVyZW50IFBp
bmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOg0KPiA+
IE9uIFR1ZSwgTm92IDIyLCAyMDIyIGF0IDA3OjQxOjEzUE0gKzAwMDAsIEJpanUgRGFzIHdyb3Rl
Og0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiByZW5lc2FzOiByemcy
bC1zbWFyYzogRW5hYmxlDQo+ID4gPiA+IEFEVjc1MzUgb24gY2FycmllciBib2FyZCBPbiBUdWUs
IE5vdiAyMiwgMjAyMiBhdCAwNjo1ODowMlBNICswMDAwLA0KPiA+ID4gPiBCaWp1IERhcyB3cm90
ZToNCj4gPiA+ID4gPiBFbmFibGUgQURWNzUzNSAoTUlQSSBEU0kgUmVjZWl2ZXIgd2l0aCBIRE1J
IFRyYW5zbWl0dGVyKSBvbg0KPiA+ID4gPiA+IFJaL0cyTCBTTUFSQyBFVksuDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+IA0KPiA+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
emcybC1zbWFyYy5kdHNpDQo+ID4gPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3J6ZzJsLXNtYXJjLmR0c2kNCj4gDQo+ID4gPiA+ID4gKyZpMmMxIHsNCj4gPiA+ID4gPiAr
IHBpbmN0cmwtMCA9IDwmaTJjMV9waW5zPjsNCj4gPiA+ID4gPiArIHBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCI7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgc3RhdHVzID0gIm9rYXkiOw0KPiAN
Cj4gcGluY3RybCBhbmQgc3RhdHVzIGFyZSBhbHJlYWR5IHNldCBieSByei1zbWFyYy1jb21tb24u
ZHRzaT8NCg0KT0sgLCB3aWxsIHRha2Ugb3V0IHRoaXMuDQoNCj4gDQo+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ICsgYWR2NzUzNTogaGRtaUAzZCB7DQo+ID4gPiA+ID4gKyAgICAgICAgIGNvbXBhdGli
bGUgPSAiYWRpLGFkdjc1MzUiOw0KPiA+ID4gPiA+ICsgICAgICAgICByZWcgPSA8MHgzZD47DQo+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgICAgICAgICBhdmRkLXN1cHBseSA9IDwmcmVnXzFwOHY+
Ow0KPiA+ID4gPiA+ICsgICAgICAgICBkdmRkLXN1cHBseSA9IDwmcmVnXzFwOHY+Ow0KPiA+ID4g
PiA+ICsgICAgICAgICBwdmRkLXN1cHBseSA9IDwmcmVnXzFwOHY+Ow0KPiA+ID4gPiA+ICsgICAg
ICAgICBhMnZkZC1zdXBwbHkgPSA8JnJlZ18xcDh2PjsNCj4gPiA+ID4gPiArICAgICAgICAgdjNw
My1zdXBwbHkgPSA8JnJlZ18zcDN2PjsNCj4gPiA+ID4gPiArICAgICAgICAgdjFwMi1zdXBwbHkg
PSA8JnJlZ18xcDh2PjsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAgICAgICAgIGFkaSxkc2kt
bGFuZXMgPSA8ND47DQo+IA0KPiBNaXNzaW5nIGNsb2Nrcy9jbG9jay1uYW1lcyAoT1NDMSwgMTIg
TUh6KS4NCk9LLCB3aWxsIGFkZCB0aGlzLg0KPiBNaXNzaW5nIGludGVycnVwdHMgKFAyXzEpLg0K
DQpTbyBmYXIsIEkgYW0gdGVzdGluZyB3aXRoIHBvbGxpbmcgbW9kZS4gT0sgd2lsbCBhZGQgaW50
ZXJydXB0cyBhbmQgdGVzdC4NCg0KPiANCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAgICAgICAg
IHBvcnRzIHsNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwx
PjsNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiA+
ID4gPiArDQo+ID4gPiA+DQo+ID4gPiA+IEhvdyBhYm91dCBwb3J0QDAgPyBUaGF0J3MgdGhlIERT
SSBpbnB1dCwgSSBleHBlY3QgaXQgc2hvdWxkIGJlDQo+ID4gPiA+IGNvbm5lY3RlZCB0byB0aGUg
RFNJIGVuY29kZXIgb3V0cHV0Lg0KPiA+ID4NCj4gPiA+IFllcywgSSB3aWxsIGVuYWJsZSBEU0kg
bm9kZSBhbmQgbGluayB3aXRoIHBvcnRAMC4gIFNpbmNlIGJvdGggUlovRzJMDQo+ID4gPiBhbmQg
UlovVjJMIHVzZXMgc2FtZSBDYXJyaWVyIGJvYXJkLCBJIG5lZWQgdG8gc2VuZCBiaW5kaW5nIHBh
dGNoIGZvcg0KPiBSWi9WMkwuDQo+ID4gPg0KPiA+ID4gZHRzIFBhdGNoZXMgZm9yIGVuYWJsaW5n
IERTSSBmb3IgUlovRzJMIHJlYWR5LiBCdXQgVjJMIHRoZXJlIGlzDQo+IGRlcGVuZGVuY3kgb24g
YmluZGluZ3MuDQo+IA0KPiBUaGF0J3MganVzdCBhIG1hdHRlciBvZiBkYXlzLCByaWdodD8NCg0K
WWVzLCBJIGhhdmUgYWxyZWFkeSBwb3N0ZWQgdGhlIHBhdGNoIFsxXQ0KWzFdIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yZW5lc2FzLXNvYy9wYXRjaC8yMDIyMTEy
MjE5NTQxMy4xODgyNDg2LTEtYmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20vDQoNCj4gDQo+ID4g
PiBJZiB5b3UgcHJlZmVyIGJvdGggcG9ydHMgdG9nZXRoZXIsIHRoZW4gSSBjYW4gZGVmZXIgdGhp
cyBsYXRlci4NCj4gPg0KPiA+IEl0IGNvdWxkIGJlIGVhc2llciB0byByZXZpZXcgKG5vdCB0byBt
ZW50aW9uIHRlc3RpbmcpLiBJJ2xsIGxldCBHZWVydA0KPiA+IGRlY2lkZS4NCj4gDQo+IElzIHRo
ZXJlIGFueSBhZHZhbnRhZ2UgaW4gYXBwbHlpbmcgdGhpcyBwYXRjaCBub3csIGkuZS4gZG9lcyBp
dCBlbmFibGUNCj4gYW55IHdvcmtpbmcgZnVuY3Rpb25hbGl0eT8NCg0KQ3VycmVudGx5IGFsbCBk
aXNwbGF5L2dyYXBoaWNzIGZ1bmN0aW9uYWxpdHkgdGVzdGVkIHdpdGggWzNdDQoNClRoZSBhZHZh
bnRhZ2UgaXMsIA0KDQoxKSBJIHdvdWxkIGxpa2UgdG8gYmFja3BvcnQgZ3JhcGhpY3MgYW5kIGRp
c3BsYXkgZnVuY3Rpb25hbGl0eSB0byBjaXAga2VybmVsIFsyXQ0KICAgYXMgbW9zdCBvZiBvdXIg
Y3VzdG9tZXJzIGFyZSB1c2luZyB0aGlzIGtlcm5lbC4NCg0KMikgd2UgY2FuIHRlc3QgQURWIGRy
aXZlciB1c2luZyBpMmMgcmVhZC93cml0ZSBjb21tYW5kDQoNCjMpIFdlIGNhbiB0ZXN0IEFEViBp
bnRlcnJ1cHRzDQoNCjQpIFRoaXMgd2lsbCByZWR1Y2UgaW50ZWdyYXRpb24gZWZmb3J0IGFzIHdl
IGNhbiB0ZXN0IGZ1bGwgZGlzcGxheSBhbmQgZ3JhcGhpY3MNCiAgZnVuY3Rpb25hbGl0eSB3aXRo
IFszXQ0KDQpbMl0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvY2lwL2xpbnV4LWNpcC5naXQvbG9nLz9oPWxpbnV4LTUuMTAueS1jaXANClszXSBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmVuZXNhcy1zb2MvbGlzdC8/c2Vy
aWVzPTY5ODYwNg0KDQpQbGVhc2Ugc2hhcmUgeW91ciB2aWV3cy4NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQoNCg0KDQo=
