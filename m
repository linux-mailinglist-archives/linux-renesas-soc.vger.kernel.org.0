Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B18B52E98A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 May 2022 11:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240332AbiETJ7q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 May 2022 05:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbiETJ7p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 May 2022 05:59:45 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2113.outbound.protection.outlook.com [40.107.114.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102376D4E8;
        Fri, 20 May 2022 02:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwO36EBHpOUAOpCWJWlUJh8tgx6aYKTh0p8pUUpLvKS4eRRn8mEf7qTRxb54XwXTdaAIDZd+ydnBLLBnQHYrEdx6f/6l4jSwUxOO5Htf2IRYh8zR2ExQNjDsjFOfRuMdOo6d1uVZlgQeB1TaCnFiWjor4JjlD9aXHAPeP3nYMsNE5hdb9cYJ3lrj+U3mmlYoYWQt6VK0YuoB6uWXNguSuN1HBZESL1THGHW4tikFELxnjBQOgYvId0/xhm2nvW0OPQil/jaBCMtapeW+MCa11ol73/V1w9wJju1XKHu0wtbPord8lBjjNcKBCzd2QNUnztXQPWDTbFjZYn4wXkm4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBEKWF6YlkeEvF/PW191pc4x/onW1tIggzqGkS1lWkw=;
 b=Le2EK15W9WWOK9B2ROv9MmruRMecmX1fMa7/5bfqSRhspu9oRX/kukhgGYfFgMGf73b30Smy/rqVUzbUzKZQktr9l0VTsDnfgUj9sFcajQX5jB5ortvKbegcj/SOkbU/74SJQH50Q4tEoqLXQqqKTnu++EtmMblrxOmtleah2vnaXXureWCMbkS7JvSaSM7xYzVrx4PLk2weYmuC9cC1lDdCbJv/7WO8sK5eaRzNix/oHVFHWqA2G0aLCsHtQXJKTZfOAX03x1jNKXVclt4CZmqsBIQ5tzHQeCut3/dDJYKrO7XfsVSxU5E0KsQ06tcNOoTkvwqIdKfRvwRdRGpEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBEKWF6YlkeEvF/PW191pc4x/onW1tIggzqGkS1lWkw=;
 b=iqtz3uMyMRpZb0rcdYbVM1Cep2xxCFeRD0PYyvMaptE+suXpQbiF/VH7FKb+o33Awf6u4/z76fVjEbSvH6gqfB9oHOQqE607mOI9y0hTNJQRpubf5Y4asA2egeslMvtnNnHlNmVU8qsE7NnV14m7FseQIHj9YAx+bSJcVQbuEaE=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYCPR01MB8737.jpnprd01.prod.outlook.com (2603:1096:400:10f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 09:59:42 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%8]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 09:59:42 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH v2 2/2] arm64: dts: renesas: rzv2m evk: Enable ethernet
Thread-Topic: [PATCH v2 2/2] arm64: dts: renesas: rzv2m evk: Enable ethernet
Thread-Index: AQHYacaLtn40hL/80UKfmnJTDjshxK0mAF0AgAFyDRA=
Date:   Fri, 20 May 2022 09:59:41 +0000
Message-ID: <TYYPR01MB70863BDC5BAEACF9AECF6C70F5D39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220517081645.3764-1-phil.edworthy@renesas.com>
 <20220517081645.3764-3-phil.edworthy@renesas.com>
 <CAMuHMdUEwEwbpTZq2AV+-YiPKXgaTb8t6Nx3zxeUF0JtEfT8BA@mail.gmail.com>
In-Reply-To: <CAMuHMdUEwEwbpTZq2AV+-YiPKXgaTb8t6Nx3zxeUF0JtEfT8BA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adb9860e-2f66-4600-c3e3-08da3a4775d5
x-ms-traffictypediagnostic: TYCPR01MB8737:EE_
x-microsoft-antispam-prvs: <TYCPR01MB8737F934E39B6FE4E6CF148BF5D39@TYCPR01MB8737.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6G87CAMBZ2AiWlcfzGRMoDnKWNwTs1Mk7e33L2TWnucaHcsqU6MePYBqXtMfltdvxcLmhtkDQOQnv3/607Rhh9TIZbHPD2JlRCQ/A20a4blh1y4vWGWAImUvNGqaeI7XqjOk0ieX4i3gKtNAR/NO4axuTwQhKoWSBiUbYsO0FvAMxU/B2XObssWDuBao2awEiAlxDBrojAc+VoraMMolCoRiEiSbptwVVXgJSvt8joAzTK/6hrKzIPLjbRThrp68xVVfvvDT/tRN8ph6jhsTuiB3fgfz/j75m/Yw/+GJvsyHMlgUI2csBp/rfd6MRZLoQMpg6hq1a6XXWsutBTctr+6B4FQdjvUgEDlPDUk59beXU2sLdoBexUzq9Rc7su5kjpNKGZOndTaXINNAeowwEaBgGEc8Wx/qYS1XqG52CsBbhdEHlL+AaxeGEQwShvS1MxXyiy5I3bLGrIstG6iUqvVA1LIZ9JRrHPcky/2O9QAk+eWOwoWs3adQLGjXYGQv6svCPBDgvmaQKeOCNOT4/JMiL82gLtMkUvGawANQGVYTWoGGcn9i3+G5Sq8O0rjnM8aHk/a8PPBnBoXcHLPbWK5vTH6nFv6rCzomPsecvPJDO6y9juCT4moMRo2kVfA7B8JW/m6HOnBNukjFOWtbq+Jyt2xj5yUEIUScbp7B+C0+umv6h4ugdZmkwRw2WtMZDvRSSo6KBcRc0iaUsvxOIA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(107886003)(122000001)(55016003)(4326008)(26005)(5660300002)(9686003)(6506007)(7696005)(53546011)(38070700005)(38100700002)(86362001)(66476007)(54906003)(316002)(71200400001)(508600001)(33656002)(52536014)(2906002)(8676002)(83380400001)(76116006)(8936002)(66946007)(64756008)(66446008)(66556008)(6916009)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akpaWG03TDhnRVJaSzhhQ2xOZWNiZ29oaDgxamU2WTl5K2lUSkxnMDc5M0ZM?=
 =?utf-8?B?TUYzditHVmRMMzZubWx3NWwyQmg4bWlZMzkyTVJTakZNZ1hIYTFzSktoU3RE?=
 =?utf-8?B?bW43VVlOOUVFSTFpdjl3TFhtaHNEeDlkYUNDVHJtNmRxODR0UWtDT0ZBMTRD?=
 =?utf-8?B?M1poMGlNUm9mV25xeGtVdWlBUnI5cnRwOVlRU3JiejVpNkhSdDRhL2lLYkVG?=
 =?utf-8?B?cFptNUlQTWdOZjVWVlZFLzFxR0lGa0Jva1pxaUpnNy9Td2NWcmZqUGJ6MldK?=
 =?utf-8?B?WFIvcGRCcUNsbVlORzkrMHB1cjFDV09MRllZbFNETWhraERsU1hNQlBMWENj?=
 =?utf-8?B?d3IwcVhOM2pzUnpVZSt4bFpDSlN3a2dyNi9sMUdnZnFMaFNYdjNhQ3poNzVF?=
 =?utf-8?B?MWprN1FYcGtIUm9scjlKZmtEMVBTa3ZPZjNNU0VwQW5lMXFRUlVJemJIRGpM?=
 =?utf-8?B?YmlSVThPYlFEMVlPaGZneS90RVJEMkFTelBCc2hSZmdUUnVybXpCdmFPd091?=
 =?utf-8?B?Wm0yMWpOcW44bm1qRVYvMW11V3U0RCtRZ1lnWXNaTnYwOVZaNk43S0o0Njd0?=
 =?utf-8?B?bzlJMXNZZ2FtdE42ellMOHZMS2NSRjJaejJoOENSNzNsdDZmVVBjTGN0SDNE?=
 =?utf-8?B?RWROdit3Q3BIdkZxbHVxT052VDN5ZXhZSGxUZDA1dWhqZUo5cS9EVW1KOGJ1?=
 =?utf-8?B?cXhnZjBadkFkUFgweGJRTjh2dnBUSmJVT09sWU00U0M4YXJzYW94WFp0VEJ5?=
 =?utf-8?B?RS9XaEVFVzVmbU1XQktXdGd2dFFLKytkaHZpb3BYTEovenZoTDNXVlBWblQv?=
 =?utf-8?B?cWNiZGlCbmpXbVlaRldlVmhKdWRKZUpWbEh0blhncEJpdGdHZWxzRUt4V29O?=
 =?utf-8?B?WGpHTTlLcFJVZVg5dUdQak1EVXpxMnhlWWlxTC83OVUyTWZtcTE2aFdGZzRL?=
 =?utf-8?B?TnVReDBuQnJZUFQvNDNHSGZwV2ZvTENjQzhQclFwSllPOTRxTDB2YTcvZXEw?=
 =?utf-8?B?MkxaRG1jT2IxS0R6QitaUkVXb0lISmpObFZoN010QTRUZm51ZnNMcjlnK2xO?=
 =?utf-8?B?SXdWM0lPWFdubnpOZW1rQTJhMDMzQ1ZrdkdSbDdOSCszVzNHNG1VcnEvdUd5?=
 =?utf-8?B?QUdleVMxK2RINmVwT1JMYmsyVUJCM3lGU0JJSTdtczBCL1hSb1VjNWlXbXE2?=
 =?utf-8?B?SWZwZzR0Q0I0UTVraU5IU0FEM3hXNkZHdFVwcVNOSlRDdVR2d2RLR3FPMFdt?=
 =?utf-8?B?dnJWQXJZSUoreEwzNUYyWFlBRVFKLzBFaGpoczRyZzU4N0dGNTRGUW83MFBY?=
 =?utf-8?B?OXc3TExGRXJZcmRWMHAzdE9qdG1oR1k0VTZBamZnQTFYM0ZVMHI3QURDbWkx?=
 =?utf-8?B?cDdTenJQdU8wKzFqWTRjaForVFpYVWx1bFlwbC9rbStIY3VtWUJ1WGpWUFFF?=
 =?utf-8?B?OGJkTGg5ZlhpSFh3V0JqYmp3TFZES2ZWUTVqLzRJZ0ZwNFRGM1c3d0pjaDF3?=
 =?utf-8?B?MXZ4V0pyenBtejdtU1psME96L2p4VXBYWklZYmtKQmVUVm1yVkZ4NE9oTE1D?=
 =?utf-8?B?aU84ZmpVZE03MlJPUVV2QkJGMEZuWGhEMHI2SHplM095Q0RhckJwWE9DMjdD?=
 =?utf-8?B?Ni9zTytwTGd2d2NkWEFKVDY3YkM4alVuR3lNdE43QTUwSG5OSDE1ZnZQMk5M?=
 =?utf-8?B?WHlzTDFxc3gzMzFNR3BRQ3hEQ0hWbkFmYVFFbm1vWlVzd25RUXNWT0NMZzNw?=
 =?utf-8?B?eWtocXU3ZllVdkRMaG5paXZtME9jZzVVVDRPaFN2OFp2T3RkalM3ZVZDSUFR?=
 =?utf-8?B?Uk9WYzk1aWg2aUhIdCt5K3dYeU83MmI0U3BrOGlHZzlhcmZLa25JNkVsQzZ4?=
 =?utf-8?B?bU5RZ00vSnpBY0JBMXFVVU1uWmFWRTVOU0w5aHN2YlUwQ1g3WmptSWFQZmpp?=
 =?utf-8?B?WW9ZNzk2R1FFQmFIL1BIUnRVdDRRWmRpY3IxMEQ3NFhIUGZaNVhXdGIzWXkx?=
 =?utf-8?B?LzUyOHd6YVA2WGNkVHdzZWZ3K2pFY3dFUU0yNzVJVGk2NUpuTU5oM29vbEVn?=
 =?utf-8?B?ZHh5eTV3cTZCZDB1ZG5oSGlvTUh2cWNwWGR0QUxQYlVuNjdsYklMN1V4UHFq?=
 =?utf-8?B?THRqNWZ0OEVTbFJXbFlCemg1ZVdhLzNtZ21KV1NlSFBDVEVBa2hXRDVJQ1JL?=
 =?utf-8?B?VUdpS05xQXBBdlhoZk9wZ0VRWklpQjBwdjQ1cS9OOS9mMDZlcHpKbmFSUnU0?=
 =?utf-8?B?Wit5T01mR21nNk80ZzhKUzFjUDVYTnpwSmhKQjJwSGErWFVJblA0N0FsSGwv?=
 =?utf-8?B?VTY2R2FOckJvR3ZJdUQ1THEzNzRnZlFUK29HN2VhMzYxQVJtVmZSTldMZTh6?=
 =?utf-8?Q?wbcdln6bcpg5hKJk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb9860e-2f66-4600-c3e3-08da3a4775d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 09:59:42.0067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJ6mXxtDF3qz75Jz6bqR+OfR6HN+glVeuWBNyFkcCeSNVCqTjVS027AYAMXsQBmqdVtxQ6aEhs7NkOUfHFUxm+TmPHad1tBjWX0w18YGtk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8737
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXchDQoNCk9uIDE5IE1heSAyMDIyIDEx
OjIwIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gT24gVHVlLCBNYXkgMTcsIDIwMjIgYXQg
MTA6MTcgQU0gUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdvcnRoeUByZW5lc2FzLmNvbT4NCj4gd3Jv
dGU6DQo+ID4gRW5hYmxlIEV0aGVybmV0IGludGVyZmFjZSBvbiBSWi9WMk0gRVZLLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdvcnRoeUByZW5lc2FzLmNv
bT4NCj4gPiBSZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+IC0tLQ0KPiA+IHYyOg0KPiA+ICAtIE5vIGNoYW5nZQ0KPiANCj4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlh
MDlnMDExLXYybWV2azIuZHRzDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I5YTA5ZzAxMS12Mm1ldmsyLmR0cw0KPiA+IEBAIC00MiwzICs0MywxNiBAQCAmZXh0YWxfY2xr
IHsNCj4gPiAgJnVhcnQwIHsNCj4gPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiAgfTsN
Cj4gPiArDQo+ID4gKyZhdmIgew0KPiA+ICsgICAgICAgcmVuZXNhcyxuby1ldGhlci1saW5rOw0K
PiA+ICsgICAgICAgcGh5LWhhbmRsZSA9IDwmcGh5MD47DQo+ID4gKyAgICAgICBwaHktbW9kZSA9
ICJnbWlpIjsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKyAgICAg
ICBwaHkwOiBldGhlcm5ldC1waHlAMCB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAiZXRoZXJuZXQtcGh5LWlkMDAyMi4xNjIyIiwNCj4gDQo+IE15IHNjaGVtYXRpY3Mgc2F5cyBS
VEw4MjExRkctQ0csIG5vdCBNaWNyZWwgS1NaOTAzMT8NCj4gSS5lLiAiZXRoZXJuZXQtcGh5LWlk
MDAxYy5jOTE2Ij8NClllcywgeW91IGFyZSBjb3JyZWN0LCBJIGhhdmUgc2luY2UgZHVtcGVkIHRo
ZSBpZCBpbiBnZXRfcGh5X2MyMl9pZCgpLg0KU29ycnksIEkgc2hvdWxkIGhhdmUgY2hlY2tlZCB0
aGF0IHRoZSBCU1Agd2FzIGNvcnJlY3QuDQoNCj4gQXMgdGhlcmUgaXMgbm8gUEhZIHJlc2V0IHRv
IGRlYXNzZXJ0LCB5b3UgY2FuIHJlbW92ZSB0aGUgY29tcGF0aWJsZQ0KPiBwcm9wZXJ0eSwgYW5k
IGNoZWNrIHdoYXQncyByZWFkIGJhY2sgZnJvbSB0aGUgUEhZIElEIHJlZ2lzdGVycy4NCj4gDQo+
IEknZCBzYXkgeW91IGNhbiBqdXN0IGRyb3AgdGhlIGNvbXBhdGlibGUgdmFsdWUgY29tcGxldGVs
eSwgYnV0IHlvdSB3b3VsZA0KPiBoYXZlIHRvIHJlYWRkIGl0IGFueXdheSB3aGVuIHRoZSBQSFkg
cmVzZXQgaXMgZG9jdW1lbnRlZC4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOw0KPiA+ICsgICAgICAgICAgICAgICByZWcg
PSA8MD47DQo+IA0KPiBPbmNlIHlvdSBoYXZlIEdQSU8vSVJRIHN1cHBvcnQsIHlvdSBjYW4gYWRk
IHRoZSBpbnRlcnJ1cHRzIGFuZCByZXNldHMNCj4gcHJvcGVydGllcywgcG9pbnRpbmcgdG8gUDE2
XzEyIHJlc3AuIFAxN18wMC4NCldpbGwgZG8hDQoNClRoYW5rcw0KUGhpbA0K
