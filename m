Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF77A786A44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 10:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjHXIkV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 04:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjHXIkD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 04:40:03 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2092.outbound.protection.outlook.com [40.107.114.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F3D1709;
        Thu, 24 Aug 2023 01:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDEd6uLNC2gMZB24WYzNAGefd2fiPpnU857lFl0jh3ZvjYw6DxSOzASY/SdH57GCLSINUloqzWmO3hfkVvhmcI5gZTPewVppfk1EAsQzKpEUFowRisGwufajm/erb90MLXqmm1bxqdNXzMnHuZiy9KdgyA7aRmLOWp6DZVJ1DmRTWrEM5w54TEwD8pds6m/CIpaI/Yfau3vU6TdNVXf5sqnKOIsLm44EK1fe3lvR67xquq5byUv/hNSxHWK2u9Zc4gdAk1ScABk6fhHmq9RiHnHkVhrAPHNi5WUHvDm1kj7b4sOkSdGzYA2Ur3f09C1lzFf7W1gl3IPQDARxn3FLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZnav27oAWf/W2QY2qUQpyFXgYqg55dOgDs6MYlCkqI=;
 b=eYViqCK/b3b6A7Ggag9bVpVJf2dqgg+p5NDOZCrQejVDAjLX6PDQAycN9kS43tnEtWoOPYGB+LtPKQx273nDsLKbwvXcvAKI4ZGVvEqYRamx/45Z/4uzTl++aq4GAZwgzbAtVwQ9oyCdnfYjHr5PhoV0nLofLzgZXSEaGXW0/xkvQNsenwEoJstlqW4Y1DTSLBKCZgnDdnTnrFzLcPY0R37ngPDd5BnP+C8uXjhmfOphph7ilX33vVppRTng8E/QjZ+EwkIeBO+/rBj6jKvNuC+9AotuqbcCOgWespHSyrOQ16hyPjcZ5XtaK5qtP//qckqMBqrDphhbxNkk1QAeyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZnav27oAWf/W2QY2qUQpyFXgYqg55dOgDs6MYlCkqI=;
 b=Xs1/qJAreoC8TG8NXSKPBiZf3aExLUsyLN3zVw/53LhpN/WLchpKP3IZflizGwNytibEQvwvljolEjt7Tayu4hNbjXCTwWe0FVw6XHWcidybpcvdYsrViPDtAco2hm9yEOaGEauDkTNUHr1zO3i1U+SJ/cdwHhgxSnkjvC4JH7I=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9806.jpnprd01.prod.outlook.com (2603:1096:400:234::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 08:39:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 08:39:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v4 1/4] dt-bindings: clock: versaclock3: Fix the
 assigned-clock-rates
Thread-Topic: [PATCH v4 1/4] dt-bindings: clock: versaclock3: Fix the
 assigned-clock-rates
Thread-Index: AQHZ1mSCChbHcDjmoEa+V1KOBtSFzK/5HrmAgAAA7rA=
Date:   Thu, 24 Aug 2023 08:39:57 +0000
Message-ID: <OS0PR01MB59228C57C7E75DFA2E7C72DA861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230824082501.87429-1-biju.das.jz@bp.renesas.com>
 <20230824082501.87429-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVSoR_4vH=_6Jf15oPATpy3WuxKAHStn8bH2QCYt5FGHg@mail.gmail.com>
In-Reply-To: <CAMuHMdVSoR_4vH=_6Jf15oPATpy3WuxKAHStn8bH2QCYt5FGHg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9806:EE_
x-ms-office365-filtering-correlation-id: 42369f13-e645-4543-b59a-08dba47db240
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Re3JL/GT0UpLVpADjg5XXSWkeLkwnxm3iF0Sxztbr4nyFaPiQ1avS7COSOHe5o+2FW9wK1QuI6IaOKNH3ZtP1cX8A+/jGvx+HzYS2wgevzki7yb74mHV7GrEjuKP2SO7/JWU1zYXDwwL4wCrYXN7u3RqNF8qNTzH/5cdcNrZ4Aw09iGMtluc5LP3vlMQuqEZBC5jqHgfcsyE9PJroS6EjiVcLV0mQkrEGgBwUMv4mf7hp6rCy4ZywmgLwVyzdzCwTx8ONZcpF4OpNa/I43rzqc5vjRqNjL1V5E6bGKJhQu4s7FCTLqNwVy8b6z5kSJdANAF9kQnx3tXX8tWVwa41PVXoIwTLeIhLO2lM/rAq5Ivq73bcWTcwW60lxC0HMK+Qq/SynKb02hZboOTGgXtJv+FCQDlFCcfr7vYwUTZbj1G3x2+d/FpB4m6S2XfmkstNJ+klSKdtC6oEX3b9KO1OIfWXIHG7OcxiD18YCOBaWQ/zbusSNQ80UikxohFmdKSIhAZwRfYj/4c5KzWio+1ftZD9eOcEAcEnPr4JC3akAFbsbwBLWP01xF/ncu0G7zbyXrjJbbgc9G7SYLuXq08OIfS2cJVTloypcdAi2pRhE65V124yiL2/HnpZ7n4k6WPM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(186009)(1800799009)(451199024)(52536014)(5660300002)(4326008)(8676002)(8936002)(4744005)(83380400001)(7416002)(33656002)(55016003)(26005)(71200400001)(38070700005)(38100700002)(122000001)(66946007)(76116006)(66556008)(66476007)(66446008)(54906003)(64756008)(316002)(6916009)(478600001)(41300700001)(53546011)(6506007)(2906002)(86362001)(7696005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHMwVVNSeWdUNlBCeVBMeTJpb25UQ2JJcjJQdUZoNHFERXN2TVpQYjlXRUJa?=
 =?utf-8?B?TDRTWDJMNXNVN05OUy8zb0FMeUhnbGx5QitoUkVQSWhNWlNOeVN1dXRpZDkx?=
 =?utf-8?B?dVA1NExzbWxDR3M4QmdtbnJKd2ZySDRXU3RoVElyVlFYeHRJb3o5dHVXZjhk?=
 =?utf-8?B?MG5Qbm5lVHFvVXE2RW5jaFZUOWtzeFdBbFl0TkJuQWEraGVtZ0k3bG5YdUR1?=
 =?utf-8?B?eEtCcG9JQUNENGlxTjNGREIzRVBhZlNKS21kcVZMS2UvOXdmTU52SmtQSTlV?=
 =?utf-8?B?Z3g0UVh3U2ZvWXVWMUsyZTdqNytZT0c5K1hJZzd6NE9qT3Mvb1VTUWRveEFI?=
 =?utf-8?B?b1FTRU1EeWp6eTRYY25LQ1JTUlA5VEhyY0FqQUdjTEZVNk50QkRGRFJkbllj?=
 =?utf-8?B?SG5mZnZ5S0pCR014RkljZFlVRytjNnV6d21DVXlWUmZIZzR0dWZnQTVEUExC?=
 =?utf-8?B?REY4MFZlZ2RHQktWMHNyTHAxWDIvMERlcmQ1V043dDYzd0pxMnQ4YzJkc2NX?=
 =?utf-8?B?LzVKMXpVd1YyVUZaU05mb0F5S211TUpRRHhZOFZweGliY0wxQkdiekl4eEFO?=
 =?utf-8?B?TUxNMjlvY1dyY0E2WVV4ZjVaS1g1QlJySXRhc3FLOWhsUmhPTEZNOWVLNEVW?=
 =?utf-8?B?QmFhdjdNZHdSd210eCs5OWdNeGJXY01JdENoV2JQNmZ1bGhDQ09wbVN4RmNT?=
 =?utf-8?B?N3l1MEpjT05hdGlkT0JwdTV3UGx1Yk1nT3NaMnc1WHZpT3pGM2VGSk5EaFJI?=
 =?utf-8?B?MDZ5RjJCc0FNLzJPRGQ4L3Y2YXFjZ1cvdDhBTzN3RTVOMGxvaUhTMkRxRDlB?=
 =?utf-8?B?SHVLOUY4THk4a0o2MkE5RHdKNjBmaDRpL2RrZ2lPNHpHVWVMZ3E3ZktsU1ps?=
 =?utf-8?B?ZElTc3R6dWRvM2E5UXRYZlU1aFNrSmR1enYvQXRsWXZWWVh0QWNlejBxaFNJ?=
 =?utf-8?B?aEEreUt4MzAzM1RSVC9FVVJSams4eitYN3dlWnB6M2s5alZEM2pYaG1paDlq?=
 =?utf-8?B?ZG9XVDNsTTh1bzlCMTB1RmVZc2YwV01hVFBKYzdSZDB2Z0IzaHpTaW9JT0xM?=
 =?utf-8?B?eW82UlZyNFJWdXl1NDJOTVhjMkx6d2g4clJsQ0t5TDUzdSt0SzlRVGhIRUxP?=
 =?utf-8?B?RmlFNUxUdSs0SHlIYitaaHcyQkFmc1czQVd4RHVYYkdDNERYRDN0RzlIbUkv?=
 =?utf-8?B?a3E0S2xzem80RjdXdVdnNFhFZWxselF3bHRONW5lbEpQa1pzWVk2NnNxVS9x?=
 =?utf-8?B?NzlYSjg1Q1kvdjVYaWRpdjltVGg3Z3FFc0NZODh0czYzVDN6QlhPUVNKL1du?=
 =?utf-8?B?OUU0NlMvWnpicW1oRVN6SzFGWGk0eGJmSVhVWDFvVEFhTzJ3VHEzc0xYVTQ4?=
 =?utf-8?B?MjlqNkFtajJ4eHJyblEydmNJNXhGd09FMkx1VWswclBZdjZHU09NdFJLWDRK?=
 =?utf-8?B?SDhmS21SaEJxRFQxYTBNQ1h1MmxuQWkyWE1udnZ3MHptaWU5a3pBRnBhanNi?=
 =?utf-8?B?S0ZIMjZpdDdGOW9NbjFGTUtCMkY3bkYyUE5LS01DbmpYckc3WklPaUh3TWZD?=
 =?utf-8?B?Wm16VXNHRHcrdXA4RUswaWxvK0hlTmxHK2NjWFZ3czhsK1ZScEhaYyt6TmF3?=
 =?utf-8?B?WHM4VzRhd2ZxRFJ0VmlnVHVqK2pJOVJ5RXdEMFpQRTMyc0RIN09JZzlZTnVz?=
 =?utf-8?B?SHQ2dVFFekdhRnBIN3U1Y1ppcTh4N1RaNFBidTIwTzlrWmpmeFEvWTdndnlJ?=
 =?utf-8?B?bDBGMUZiL3Z1MUkzYXlwZmsxL0cxVXpZYThEL0lIWmVuL1pxa1RWdTVKb0xL?=
 =?utf-8?B?Wm9tUTdLNTJ2cVlrN0VQb0ZNOFVyVGtIYXBzVEJJRCtxVjJiYzlPTDFNUEhB?=
 =?utf-8?B?a2FPaGNkNFlib1VPMldyLzhHTmRudVdyTHQzNTdOV3pRY2dNS29ZRXdDdHNL?=
 =?utf-8?B?dWdTUjdIODBUN1lrRCtsL1NhdUk1L0dEaW95VFZmTHBQWWhsOW4zNVlTZlpY?=
 =?utf-8?B?TmUxZU9CNW1XNjk4aDBsdENHUXFiS1NHNVBGRWYrZnltMDF3YW5CQTM1TXZa?=
 =?utf-8?B?dkNYRGdaNGZ1K2xJU3lqc1dnS1YzUWhRQ2I4bFN6MG1hR1BVaFZYNmwzdmRt?=
 =?utf-8?B?Um1MMW90VjJ2Uzg4VHR2UzJsSXVqaGpRQ1hKRHF2VjdmM2FiMUZoa25NTWhr?=
 =?utf-8?B?a2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42369f13-e645-4543-b59a-08dba47db240
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 08:39:57.0956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u/YDA9JC8q1RjYLbA8e5y46Lk992H+aFcdvLCsrIGraABk0VDk/DOhuDibT6F91zgrizOndGxoNMZPgmCdPZoaXwb8T0Duam8SdCyQh1UGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9806
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY0IDEvNF0gZHQtYmluZGluZ3M6IGNsb2NrOiB2ZXJzYWNsb2Nr
MzogRml4IHRoZQ0KPiBhc3NpZ25lZC1jbG9jay1yYXRlcw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+
IE9uIFRodSwgQXVnIDI0LCAyMDIzIGF0IDEwOjI14oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBGaXggdGhlICJhc3NpZ25lZC1jbG9jay1y
YXRlcyIgZm9yIGVhY2ggY2xvY2sgb3V0cHV0IGluIHRoZSBleGFtcGxlDQo+ID4gYmFzZWQgb24g
VGFibGUgMy4gKCJPdXRwdXQgU291cmNlIikgaW4gdGhlIDVQMzUwMjMNCj4gPiBkYXRhc2hlZXQo
aWU6IHtSRUYsU0UxLFNFMixTRTMsRElGRjEsRElGRjJ9KS4NCj4gPg0KPiA+IFdoaWxlIGF0IGl0
LCByZXBsYWNlIGNsb2NrcyBwaGFuZGxlIGluIHRoZSBleGFtcGxlIGZyb20geDFfeDItPngxIGFz
DQo+ID4gWDIgaXMgYSBkaWZmZXJlbnQgMzI3Njgga0h6IGNyeXN0YWwuDQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IFN1Z2dlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IFRoaXMgaXMgbm90IHdoYXQgSSBzdWdn
ZXN0ZWQuDQo+IFRoZSBiaW5kaW5ncyBzaG91bGQgZG9jdW1lbnQgdGhlIG1lYW5pbmcgb2YgdGhl
IGNsb2NrIGluZGljZXMuDQoNCk9LLCB3aWxsIGFkZCB0aGlzIG1lYW5pbmcgaW4gZGVzY3JpcHRp
b24uDQoNCj4gDQo+ID4gRml4ZXM6IGEwM2QyM2Y4NjBlYiAoImR0LWJpbmRpbmdzOiBjbG9jazog
QWRkIFJlbmVzYXMgdmVyc2EzIGNsb2NrDQo+ID4gZ2VuZXJhdG9yIGJpbmRpbmdzIikNCj4gDQo+
IFRoaXMgcGF0Y2ggaXMgbm90IGEgY3JpdGljYWwgZml4Lg0KDQpXaWxsIHJlbW92ZSBpdCBpbiBu
ZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCkJpanUNCg==
