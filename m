Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD056C7942
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Mar 2023 08:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbjCXH4Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Mar 2023 03:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjCXH4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Mar 2023 03:56:23 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF7322101;
        Fri, 24 Mar 2023 00:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwoJMGhzsUhXCBCDRBsAedcJVadPXfn2ulYxgPV1sPNjp6qy4aXzSK0XFH6M9nzH9e3Ka1XjvsHSUvzWv5tOp7qxHU+IisCY27/KZTFQcDjZqAjgDElidRgXHfnAfIw4qSyIeHPa8aCYFZSLhqWTiS3zG0M9r3bHXQ1bu5exUfdd/YctNPbYFphhCKsKZvE04ZpJpYXOP5WdHu5IuY1D2RzODZZ/yh7FyMt9+R03PQIgIVwDFKm16boy+VUfUcu9ZwUSMLmPq7JcKB00oBPOvUdx3slC9d9tP0jv1ktP5P3Y8xPlusr7k88OnO1AVKQOvkmLL7YW1rHm01yqm2aCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUz6uDiGxNJ1QzSXl/CjGf2hJYz+HGo0lq/Im6JrKHY=;
 b=gALwC3QnDbQT1+6DRZUMTp1p7ArdGl8uCgcDVGESWdGEUn3SmevKM68aC129DTCWvrOIQlzopejaTJbNUTO3CSVcWaD0krhVbHegR7yKPSe1plBWx21xj1P3mNG9gdRfTGU7B2ElEL5xZpJfUIy4SyDkea2KAxhJmMLT9veoE6WKrJhJDB3F8cCkAga3QK1mEdiHInXmiwB1iawx7IIUoeE2rZJiACwm1EyP91hy5H0vYLPXSVTFy4Enlg3pdwPEMDL6u7tFfcDBT86HD4P6QSqMXtPPL6Vc7EgdmNNxCPrlHiExtFSmpz3YqxHumkCZLeX6REcmv9NB7yffDy9P0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUz6uDiGxNJ1QzSXl/CjGf2hJYz+HGo0lq/Im6JrKHY=;
 b=Ba9jO3M8irtQpJ1sKA+obwwtUa4Rt4tYDeQwp13gCl5WCom6rHInM7Jn5goGLgZzEKUtv2MynHaeX8J5EkHN4N4Mv3plAwTacp9K3iwegWUqcoOCtMpBSf84UMMMRfUerP9NcEQjjxtOk26C2upQUJYLHzvXgg3L4lxMF7hz5uE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS7PR01MB11758.jpnprd01.prod.outlook.com (2603:1096:604:239::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 07:56:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%8]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 07:56:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v2 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Topic: [PATCH v2 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Index: AQHZUqf9CaO1kLmgWEey5fqAuaKaea8F8OiAgAOxxDA=
Date:   Fri, 24 Mar 2023 07:56:17 +0000
Message-ID: <OS0PR01MB5922FA11271563F1FBAC3FED86849@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230309165529.223052-1-biju.das.jz@bp.renesas.com>
 <20230309165529.223052-3-biju.das.jz@bp.renesas.com>
 <fbb9d1bf8643b4ddce6e9498911f3137.sboyd@kernel.org>
In-Reply-To: <fbb9d1bf8643b4ddce6e9498911f3137.sboyd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS7PR01MB11758:EE_
x-ms-office365-filtering-correlation-id: 65116672-57ad-4327-b759-08db2c3d3fdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dg/130qPIwlG41nd44IrUxGo612/UhV8HUiepaybOGspyS4+Wz3r6doZu1WiSegT5ChZTEiaDZIH7qckSkztT4WvQGAteeI0HpapZsKLsYF9f/o2bmbyozU4d1NYzy42er3w45CL8ujgmWKoUWC8PFeqDIrIRuulPDUtKD9FRJ499JuisqVYUnD7LrGl3FzFn1BaeWPL1Ydg1ofs4rCXVVSCGPDTx/Huk9HRsLNEOL1l/6RonMGhez5I02yLZYZ+ZITiyGSpECal5IylleuloXDl39f/Aar8aFHFzQmMYDIThgjGVrbQkJjctVej7mkV+o9qRr5mtqcNj9jIGTVXvEhz3c6+NzVWE3qhiBGoIIIiR2GqiKQ0upqBNFzSvXrvaMCPBbZ8lRCtbgbvVOfFxJ30VyJW8C4bHRWjnyBoMYS+oHAkGyJpL7cQS54rSXhmYZoPcXwJfe5EM3bahah+l18DRl92Ls5tXmF7aAZTxhDbfqi9ClHwp2Xk1sKzG/jdRte7ETa9GD0DzgvjanD6B0JeI5EzI3HnoMkSAT4WuScIiq6tem6LDwvTJpoXYMxM+G2edj15h6BsRpWrwViQs2TOjr97anwYqTipUY00lWhF2qMg2huNUJYmPxhYFWX7UmDFO4WDJw/5ugNipB7bwzP3ev4JvHtIG4GizrTMUBPMqMDUx+i7+I3g4cBxteVr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199018)(54906003)(86362001)(71200400001)(41300700001)(110136005)(478600001)(8936002)(52536014)(5660300002)(33656002)(38070700005)(66446008)(66476007)(66556008)(8676002)(7696005)(64756008)(76116006)(66946007)(4326008)(316002)(2906002)(966005)(122000001)(6506007)(38100700002)(53546011)(9686003)(186003)(26005)(83380400001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3dtdFNiSThjdm1vSzdjMy9ra01vWFliTlZ5OHJrM2x3MkpDL1hPQW1SWjRz?=
 =?utf-8?B?TU5aMy8zS3NEcHFtVlF0anoyVUxhWE5keEpBMElOS3V5d216NWt1Y0Jic0xh?=
 =?utf-8?B?TmM1amJEYjNDR2lFQ3dpZTFBVkc3dzlzY3ZNU2RqMWRBV3BvRERocDl0K3I2?=
 =?utf-8?B?NmYvY1dPZTFDMUw3MDVoY1NhRlpOTzRQemg3cGwvSENORHBhR3N0dGRyVHpa?=
 =?utf-8?B?WWdhWFZWcHlJakVEZTA5YVpXcFZCOCtMbnVPMW9DaGJrbFVnempoVS8zb0Yy?=
 =?utf-8?B?QmxzSVowMzA2aG53eTBnR1diUHBGWmVJQk45bUNteFdsT1JFTVFvdFQ0QnRy?=
 =?utf-8?B?M1RUQ2p1cmNQVHFFNlplZ2tEM3Z1OXNwU2pnR0RwQ0U0azRYT3Y1MnhyNU5o?=
 =?utf-8?B?dW9lbjhvVStpcWUvSTNFSzhvQUdzMFpIb3pINytQMUtGWWlQQmw4a2NEQ2dD?=
 =?utf-8?B?eSs5aUFpVGY5NkYvR29IWHdmcDltb2NYVzg4WW0xdmh0Y3pSMXFtYU5NcmFE?=
 =?utf-8?B?RndxT1dPRzZoV09adVdVeW5YekswaG9STGdEQ2xaNVdRdnU1MUt0c2JVd3NL?=
 =?utf-8?B?QjIzd24xQXpybURQTHRERlVINVRoTnROWjQwdGRIVCtSUC9iV3NDTGRJQTZM?=
 =?utf-8?B?ekZwemQ3SGhTZGxlMDJWL0NiS2hXZkk3WWpqb2l1aFhkckxjdTJTY2ZIenBH?=
 =?utf-8?B?NEpveHRVV0VEeG91YzM3QTJ4NjRSeG02R0pqYnBYTUZWcVJJSm9EaW5mTkFL?=
 =?utf-8?B?UUtjRmdGbi93RTdLQ3RRcm51THI5bXdvYjdNZE1HUDVrVVgrbzZvR2NETzM4?=
 =?utf-8?B?aXcweEJOT0daem9qTXczaU95MzdZTnNoaVpCRmhjVGJHQThnWVp4ZjZRL3VR?=
 =?utf-8?B?TkNTZFBJSEZmeHJiSHhHcmpBa21EWE1PNEQ5ZkU2cXpFMUF5SVhEN256ZkpS?=
 =?utf-8?B?QzRGOGhRZStBMmhjU0tYVWhlUGh2Q2FIK2s2OEQ5M1RxeEtUdUlIK1RrZ3FC?=
 =?utf-8?B?UU9lUVBNL0p5RmZUeWxpVHRkTElMZ25acEZ1NWtaaU9CazZaMFZWZUhsQnpH?=
 =?utf-8?B?V1RwN1JxcFRtRTJTUjRxVy9WWGVxckprb0U5VEdXUWRnemgvOXllbzY3ZVd6?=
 =?utf-8?B?dTBxbElrWGc0QzlUSTlrMC9wWUFHZkVickxUUnhnV2RJWFBDbG8ycFNvb20y?=
 =?utf-8?B?UEp1MFZOVGg3TlhnTjNKeFpnZDlhN1ZLL2V6U3RyY1JpZzdDN1RtYW9DRVRj?=
 =?utf-8?B?MDNoWUdKVzgyRDZ1SHFKMGthVlptenNzN3BlUnp5eEwvWEgzSjdMbEdIS1cv?=
 =?utf-8?B?TkRKa0p0NWcvUDdMS0I2M1NqR25wODdqWUpFVlpKVTExWm1aQTBtSE5jNnEr?=
 =?utf-8?B?R0UwZE5MRCtQWXJXb2VDdTZ0QXdrckpxQ05MQVdnUTZtR3FrZWVmUEk4SGJR?=
 =?utf-8?B?TkF2NEZHNE5wclBFMlJ0VnFXL1BVaFZ2M1hxcGwxb2JocVpkMmgzTU92dTRP?=
 =?utf-8?B?QURJcUVsZktxY2FaZTVkL0ZzOFp6UTN0Rm16dzgvNXRXeHRYOWc1ZUJINnhR?=
 =?utf-8?B?MmM4SHNsSGhjTVVtTGVvNWlzc2NVcXdQMkZ1VDE0NmhFT2NhWmx3SzBXZklj?=
 =?utf-8?B?a2lhSGkwZXVJcXp1OGU2d0FoQnJQQVdmMTh4T2N5QjUreW95bVVBTStySkMv?=
 =?utf-8?B?cGVjc2F3N0FDUlFTVnZCN044N2VxNFBvcDNDeGhOWHNXVmFUT1B2NzdUcERZ?=
 =?utf-8?B?RWE4THUxZ0tNUEFtNVAwc2ZUSWJlWTloanExeURKRGg2MkFQTURLM3UxcGNC?=
 =?utf-8?B?eFJRZEZsdzBnSGRvNlp2ZVhyTXFlcmNPT2tvZTQ4ZS83WDg3Q3J5UXFGUENO?=
 =?utf-8?B?WjRhQ2IyY0dIZHM1THpFd1B2cVRkeXYxenNaYkl3Rm9UVmJaV2l2cHVlNHhx?=
 =?utf-8?B?RVR1Wm0vTjRkcFMzMWJWeDNSTmVFVnhwM1JsTjdYa2xZVWd2UldOVEZoNmEx?=
 =?utf-8?B?cXoyL0VFNXJ0aS9Wc3ZhWEl5OTEvcW0vTXhuRTR2eElreFoyNXU2bVVScjAy?=
 =?utf-8?B?MzNlQ0NiaGE3ZWRpdmxmVFkxU094TkJCL2JDRlZCR25Bc2NEa3E0UklrL3Ba?=
 =?utf-8?Q?OQEWzC6ryrb7Cawg19AtOGlAQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65116672-57ad-4327-b759-08db2c3d3fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 07:56:17.8957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6kuhgrlxJgFV4MAfy/fsNHwIOQhgbWCNhWmQCVLntg599WPoNPA7rDbRUer9RET0zRJIAcEjyTtxO2HQRPlkwcTnBUvBjk16Dh6eEi7V9KU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11758
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPg0K
PiBTZW50OiBUdWVzZGF5LCBNYXJjaCAyMSwgMjAyMyAxMToxNiBQTQ0KPiBUbzogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgTWljaGFlbCBUdXJxdWV0dGUNCj4gPG10dXJx
dWV0dGVAYmF5bGlicmUuY29tPg0KPiBDYzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPjsgbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgR2VlcnQNCj4gVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IFByYWJoYWthciBNYWhhZGV2IExhZA0KPiA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPjsgbGludXgtcmVuZXNhcy1zb2NA
dmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8zXSBkcml2ZXJzOiBj
bGs6IEFkZCBzdXBwb3J0IGZvciB2ZXJzYTMgY2xvY2sNCj4gZHJpdmVyDQo+IA0KPiBRdW90aW5n
IEJpanUgRGFzICgyMDIzLTAzLTA5IDA4OjU1OjI4KQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9jbGstdmVyc2FjbG9jazMuYw0KPiA+IGIvZHJpdmVycy9jbGsvY2xrLXZlcnNhY2xvY2sz
LmMgbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXgNCj4gPiAwMDAwMDAwMDAwMDAuLjZjNWM4YjM3
ZjZhZg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9jbGstdmVyc2Fj
bG9jazMuYw0KPiA+IEBAIC0wLDAgKzEsMTEzOSBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCsNCj4gPiArLyoNCj4gPiArICogRHJpdmVyIGZvciBSZW5lc2FzIFZl
cnNhY2xvY2sgMw0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjEgUmVuZXNhcyBF
bGVjdHJvbmljcyBDb3JwLg0KPiA+ICsgKi8NCj4gPiArDQo+IFsuLi5dDQo+ID4gKyAgICAgICBb
dmMzX3NlMV0gPSAic2UxIiwNCj4gPiArICAgICAgIFt2YzNfcmVmXSA9ICJyZWYiDQo+ID4gK307
DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19wYXJlbnRfZGF0YSBwZmRtdXhf
cFtdID0gew0KPiA+ICsgICAgICAgeyAuZndfbmFtZSA9IHZjM19maW5fbmFtZSwgLm5hbWUgPSB2
YzNfZmluX25hbWUgfSwNCj4gDQo+IE5ldyBkcml2ZXJzIHNob3VsZCBvbmx5IGhhdmUgLmZ3X25h
bWUgaGVyZS4gSSBkb24ndCB0aGluayB5b3UncmUgbWlncmF0aW5nDQo+IGFuIGV4aXN0aW5nIGRy
aXZlciB0byBjbGtfcGFyZW50X2RhdGEgc28gLm5hbWUgc2hvdWxkIGJlIHJlbW92ZWQuIEFuZCB0
aGVuDQo+IG1heWJlIHlvdSdsbCB3YW50IHRvIHNpbXBseSB1c2UgdGhlIGluZGV4IGluc3RlYWQg
c28gdGhhdCB3ZSBkb24ndCBoYXZlIHRvDQo+IGRvIGFueSBzdHJpbmcgY29tcGFyaXNvbnMgdG8g
ZmluZCBjbGsgcGFyZW50cy4NCg0KKyBSb2IgYW5kIEtyenlzenRvZiBLb3psb3dza2kNCg0KQWdy
ZWVkLiBCdXQgaXQgcmVxdWlyZXMgdGhlIGJlbG93IGNoYW5nZSBpbiBkZXZpY2UgdHJlZS4gDQor
CQljbG9jay1uYW1lcyA9ICJ4dGFsIjsNCg0KT3RoZXJ3aXNlIHdpdGgganVzdFsxXSwgZGV2bV9j
bGtfaHdfcmVnaXN0ZXIgaXMgbm90IGFzc2lnbmluZyB4dGFsIGFzDQpQYXJlbnQgY2xvY2suDQoN
ClsxXQ0Kc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEgcGZkbXV4X3BbXSA9IHsN
CnsgLmZ3X25hbWUgPSAieHRhbCJ9LA0KLi4NCn0NCg0KU28gSSB3aWxsIHVwZGF0ZSB0aGUgYmlu
ZGluZ3MuDQoNCg0KPiANCj4gPiArICAgICAgIHsgLmZ3X25hbWUgPSAiZGl2MiIsIC5uYW1lID0g
ImRpdjIiIH0gfTsNCj4gPiArDQo+IFsuLi5dDQo+ID4gKw0KPiA+ICtzdGF0aWMgdW5zaWduZWQg
bG9uZyB2YzNfY2xrX291dF9yZWNhbGNfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nDQo+
ID4gK3BhcmVudF9yYXRlKSB7DQo+ID4gKyAgICAgICByZXR1cm4gcGFyZW50X3JhdGU7DQo+ID4g
K30NCj4gPiArDQo+ID4gK3N0YXRpYyBsb25nIHZjM19jbGtfb3V0X3JvdW5kX3JhdGUoc3RydWN0
IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKnByYXRlKSB7DQo+ID4gKyAgICAgICAqcHJh
dGUgPSBjbGtfaHdfcm91bmRfcmF0ZShjbGtfaHdfZ2V0X3BhcmVudChodyksIHJhdGUpOw0KPiA+
ICsNCj4gPiArICAgICAgIHJldHVybiAqcHJhdGU7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRp
YyBpbnQgdmMzX2Nsa19vdXRfc2V0X3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxv
bmcgcmF0ZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgcGFyZW50X3JhdGUpIHsNCj4gPiArICAgICAgIC8qDQo+ID4gKyAgICAgICAgKiBXZSBtdXN0
IHJlcG9ydCBzdWNjZXNzLiByb3VuZF9yYXRlKCkgcHJvcGFnYXRlcyByYXRlIHRvIHRoZQ0KPiA+
ICsgICAgICAgICogcGFyZW50IGFuZCBiYXNlZCBvbiB0aGUgcmF0ZSBtdXggY2hhbmdlcyBpdHMg
cGFyZW50Lg0KPiA+ICsgICAgICAgICovDQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIDA7DQo+
ID4gK30NCj4gPiArDQo+ID4gK2NvbnN0IHN0cnVjdCBjbGtfb3BzIHZjM19jbGtfb3V0X29wcyA9
IHsNCj4gPiArICAgICAgIC5yZWNhbGNfcmF0ZSA9IHZjM19jbGtfb3V0X3JlY2FsY19yYXRlLA0K
PiA+ICsgICAgICAgLnJvdW5kX3JhdGUgPSB2YzNfY2xrX291dF9yb3VuZF9yYXRlLA0KPiA+ICsg
ICAgICAgLnNldF9yYXRlID0gdmMzX2Nsa19vdXRfc2V0X3JhdGUsIH07DQo+IA0KPiBBcmUgYW55
IG9mIHRoZXNlIGNsayBvcHMgbmVjZXNzYXJ5PyBUaGV5IGRvbid0IGRvIGFueXRoaW5nIGJlc2lk
ZXMgcGFzcyB1cA0KPiB0byB0aGUgcGFyZW50LCBzbyB5b3UgY2FuIHNldCBDTEtfU0VUX1JBVEVf
UEFSRU5UIGFuZCBiZSBkb25lPw0KDQoNClllcyBpdCBpcyByZXF1aXJlZCwgb3RoZXJ3aXNlLCBJ
IGdldCBXYXJuIG1lc3NhZ2UgWzJdIGFuZCBpdCBmYWlscyB0byByZWdpc3RlciB0aGUgY2xrIGh3
Lg0KWzJdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJp
dmVycy9jbGsvY2xrLmMjTDQxMjANCg0KDQo+IA0KPiA+ICsNCj4gPiArc3RhdGljIGJvb2wgdmMz
X3JlZ21hcF9pc193cml0ZWFibGUoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQNCj4g
PiArcmVnKSB7DQo+ID4gKyAgICAgICByZXR1cm4gdHJ1ZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHZjM19yZWdtYXBfY29uZmlnID0gew0K
PiA+ICsgICAgICAgLnJlZ19iaXRzID0gOCwNCj4gPiArICAgICAgIC52YWxfYml0cyA9IDgsDQo+
ID4gKyAgICAgICAuY2FjaGVfdHlwZSA9IFJFR0NBQ0hFX1JCVFJFRSwNCj4gPiArICAgICAgIC5t
YXhfcmVnaXN0ZXIgPSAweDI0LA0KPiA+ICsgICAgICAgLndyaXRlYWJsZV9yZWcgPSB2YzNfcmVn
bWFwX2lzX3dyaXRlYWJsZSwgfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgY2xrX2h3ICp2
YzNfb2ZfY2xrX2dldChzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzICpjbGtzcGVjLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKSB7DQo+ID4gKyAgICAg
ICBzdHJ1Y3QgdmMzX2RyaXZlcl9kYXRhICp2YzMgPSBkYXRhOw0KPiA+ICsgICAgICAgdW5zaWdu
ZWQgaW50IGlkeCA9IGNsa3NwZWMtPmFyZ3NbMF07DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKGlk
eCA+PSBBUlJBWV9TSVpFKGNsa19vdXRfZGF0YSkpIHsNCj4gPiArICAgICAgICAgICAgICAgcHJf
ZXJyKCJpbnZhbGlkIGNsayBpbmRleCAldSBmb3IgcHJvdmlkZXIgJXBPRlxuIiwgaWR4LA0KPiBj
bGtzcGVjLT5ucCk7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FSU5WQUwp
Ow0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiAmdmMzLT5jbGtfb3V0
W2lkeF0uaHc7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHZjM19kaXZpZGVyX3R5
cGVfcGFyc2VfZHQoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHZjM19kcml2ZXJfZGF0YSAqdmMzKSB7DQo+ID4gKyAg
ICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOw0KPiA+ICsgICAgICAg
c3RydWN0IHByb3BlcnR5ICpwcm9wOw0KPiA+ICsgICAgICAgY29uc3QgX19iZTMyICpwOw0KPiA+
ICsgICAgICAgdTMyIGkgPSAwOw0KPiA+ICsgICAgICAgdTMyIHZhbDsNCj4gPiArDQo+ID4gKyAg
ICAgICBvZl9wcm9wZXJ0eV9mb3JfZWFjaF91MzIobnAsICJhc3NpZ25lZC1jbG9jay1yYXRlcyIs
DQo+IA0KPiBUaGlzIGlzIGFuIGludGVyZXN0aW5nIHVzZSBvZiBhc3NpZ25lZC1jbG9jay1yYXRl
cy4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJvcCwgcCwgdmFs
KSB7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChpID49IEFSUkFZX1NJWkUoZGl2X2RhdGEpKQ0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgICAgICAgICBp
ZiAodmFsKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHZjMy0+Y2xrX2RpdltpXS5mbGFn
cyA9IENMS19ESVZJREVSX1JFQURfT05MWTsNCj4gDQo+IFdoeSB3b3VsZCBhc3NpZ25lZCBjbG9j
ayByYXRlcyBjaGFuZ2UgdGhlIHJlYWQgb25seSBmbGFnPw0KDQpJIGRvIG5vdCB3YW50IHRvIGNo
YW5nZSB0aGUgZGl2aWRlciBzZXR0aW5ncywgc28gSSB0aG91Z2h0IG9mIHVzaW5nDQp0aGVzZSBw
cm9wZXJ0aWVzIHRvIGFzc2lnbiB0aGUgcmVhZCBvbmx5IGZsYWcgdG8gY2xvY2stZGl2aWRlciBm
bGFnLg0KDQpJIHdpbGwgcmVtb3ZlIHRoaXMgZnVuY3Rpb24gaW4gbmV4dCB2ZXJzaW9uIGFuZCBX
aWxsIHVzZSBDTEtfRElWSURFUl9SRUFEX09OTFkNCmZsYWdzIGZvciBkaXZpZGVycy4NCg0KQ2hl
ZXJzLA0KQmlqdQ0K
