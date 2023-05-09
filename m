Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4CF86FCC62
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 19:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235482AbjEIRIj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 13:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235333AbjEIRIU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 13:08:20 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7011D2D0
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 10:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fanbLFoNMpvsaWn4OSpcDWmKmYxcHLiQ4eprG5AJCRQYLJFLhPsQ3d/9DwZ9UlovhqN4WOGThr1rLdnlekicRk1V2CT7Nnkrk8LcaNOR/zX4iUiStrRMmmuC5LWMlal65vhjhh9cP0Og1qDFI3jyXrUZWD8iYp3AeyWzcMMwMdkAceK/kPZdfl+/UFg8zzlHcbtRD0oEu9guXqXeFZK+MeG4lsZzMDBVOpu2l5k+pvmLgThlU66wANf3L5AiwdFVj0mW3ry27jEqfPyT9tCUh7ZpBCHRNhS3akuZWEgsbRoX+OKhOyGFPqpER3r5sl6HaFXrmQEqaCZs1QgiPszyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMTkOXRiMwPtcyMLjbxg1T5b7M39PS92bZXk30QumwQ=;
 b=BgfefXnQCF9gBj+aCCbDsZ5+vlu46YvujmNyHTk3nR6262Uaf89PM0QXeBiEyAI/bCp/oaKxbUjdYQmiVPwUJveFvJ2b0GE2YICNC9mJAEDxLOwrli+RmLagbVgCMClyYeKOLdDNjm7EyyX86zbDaMZScBqr7fObtFr28HnN9AvZcptN4ByexLDtBwgSqxkUNw+OInn/Oly/G4XJnbtyNJ557K9bR7WbBcHwor3IiVV/zOOKOlhXmalZCoLCujeibDsL8QQTlubb0eUhZ53BcV/pphKht4PYfhq1g6DStQnVaV4kwCzmjggFtYxAgJtz427hx1cYwWj+lk5O+YblZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMTkOXRiMwPtcyMLjbxg1T5b7M39PS92bZXk30QumwQ=;
 b=jPbuFQL9AuZt2ox4VH41t0jW9XlPlm+aP6pAo5N14HM6dLMCah8AYllQAOGpp0EW+XIN9dhbYbEe3Gh1zGBKHwzah+k3L0w2MgtTygoIiEdFeGxERSxuEZmuByD6T327h1nkdj/P9c7wK7tXWp+X8aGnM80LVq+NjUaWt/Hd8Xg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 17:05:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6387.019; Tue, 9 May 2023
 17:05:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
CC:     Lee Jones <lee@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
Thread-Topic: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
Thread-Index: AQHZf3aj2rY7Ee22ykCAZA9TJ0ZPFa9RiFzwgAADeoCAAACWwIAAHvYAgAAE0UCAAAU2gIAAeTMw
Date:   Tue, 9 May 2023 17:05:27 +0000
Message-ID: <OS0PR01MB5922E36A73E46EEC2AEBF89586769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
 <20230505172530.357455-5-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922CB267130D6E5DBE4AD1086769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU36vONu2GMKYZwtLPo_+CDYnWKDXjMytAg0r6BPRUv7Q@mail.gmail.com>
 <OS0PR01MB5922474E0B42B6301DB1961986769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdV+kjU5Ymy70_fus+tvO6ENPY04QG0ANr2WtraPK0H45w@mail.gmail.com>
 <OS0PR01MB5922257A4BBA98232317C38286769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVECGJcYMYpPbDewNofWrrU4yE_hhyXm6GR1SdnX5q0pQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVECGJcYMYpPbDewNofWrrU4yE_hhyXm6GR1SdnX5q0pQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB12093:EE_
x-ms-office365-filtering-correlation-id: 748668bb-5049-475a-1532-08db50af961e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SfpAaLqbx2SooLLAVgBWkSeRK/EKLX40zQsDf2wYVia3aJZi0ukLX09QquJzWJBAiysdoZjMJqCUrq8mWowBVsZHioBH7iWEYdfwmzKsAK3V2JiV7y4rw+yww7hYeP6DhSBbcIBvkIvQMv4RRnUu8WoZYahYR8ryuFo24LvI+t8lut3GCJjM63uAS2zCadDsP6Z8nNCeoQE34CEOQb5/fPYQPiGVpCfRJDffYZMe4WqxSqcaVDG9bt9ZPL3TSMGhWgTiYQDzKoLUAynvVYCaEVXiew5VBUYWqqKYWr1qgDQzA7Kw3DS1MdV0SfBeBE6uCBQZwANyBFAhNr58F2c8Z9hVtazDCILPpx+DwdMA5ZfQw0u8/9qZvxHyOTxV85lkn4wgBWKh6uALsl0HqHQpx0yyeE+XRQwcxYQMdx9gIih+K5Ll/00qE6S04mnGG5Eqgbh8F6Q6XDxhv7n009bAhJTyV45l46HmwOQNajnQhh6dJVINzoXadGMfgbshkgyN4JyjqSOqX6OBqbEs/H5lL1aB7h5S5hieUVZniqK9mqdIiytCTvg5qWKHeSuzMZHHwBFPZWgOdISfle5QTyF5gjJN12Dc3IYTihBXwNSA/fcCwlO6LFt3eYDt8XtjBWcq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(86362001)(33656002)(110136005)(316002)(54906003)(66476007)(4326008)(76116006)(66946007)(64756008)(66556008)(478600001)(71200400001)(66446008)(7696005)(55016003)(8676002)(8936002)(52536014)(5660300002)(41300700001)(2906002)(38100700002)(122000001)(186003)(38070700005)(9686003)(53546011)(6506007)(107886003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2xYSTdIQnl5djNuRnZLSytURE9WcHVQLzhhU2YyMXg2bFVLUTFkWFJwbm5i?=
 =?utf-8?B?b1BEMW9aeCtNVnBGNk1Jc0RRUExJcW1WaG1LRDQ1RmZ4L0c5T2phekFxclhR?=
 =?utf-8?B?OFo5OGU1eGNZdVNjVDRBb0hZYUZWSE1USzlPTlEyZmw4L0NuTXU4ZkJHMXdL?=
 =?utf-8?B?ckd5NEt2aDNac091Mmc0V3RLNHZ5eEFQTnZrblNiTXp0d1prUTcxTGZYekkw?=
 =?utf-8?B?cW0xQUw4K3k4SE1QRnZUQnV6SmMxa095MVh5aGFLOVJ4VUxxYXE4QnNVYzA1?=
 =?utf-8?B?TmxXTFhBK3p5T3NhWENxMW1JMnhGdDROTXVWeGdSc05pV0lYWGNYengvbGZM?=
 =?utf-8?B?a0s5VGJ5b0pHcU5WNWR5amtYcldWM1l6SFF0Z3htZ0U0UzBVR3ZWQXdLWnRN?=
 =?utf-8?B?QzlEbndCR1RrSG1oa1VLSVZ2Tms1aW1aa2lRaTRWK0ZqNU5qdHQ3Tk96T3B4?=
 =?utf-8?B?Ukl3bVIyMGErekZmVUIrK0JCQlRkSGwvSjNoWGxqL1ZoNlNicFlabVd0c0Vr?=
 =?utf-8?B?WTNqR1QwenluZG5SeXRDT240cTB3bXhXQVpxQkpjTEJGMkptM2QxZlUzZWdC?=
 =?utf-8?B?RFI1dVhIeHZ6OWowbDBFelFZN2lma05UU2JlUmk0S1BEK3V0OEtybVNqR2hP?=
 =?utf-8?B?dTZzR1ROUXhuanZSeXlidG5JYzVRWXBCaTUyNlltTXNDY1FHM3FCSzdiVkpj?=
 =?utf-8?B?TU9qMklpZkpqcHhyNW5kM1VWSXcybUlPV3JEcUZVK1VaK042Ukcyc091WTho?=
 =?utf-8?B?R3dCR3FrM0FLdFRld045M0RMOWo2OVZGdEJaN2pISktrUHdkcWcyL2VvQ1Zv?=
 =?utf-8?B?dXNOVzdhS0pUdkhXWXVCM2llbG5OdExOY0tJekpIYjdjNlN5cXgxQ1A1SWto?=
 =?utf-8?B?cldlQVozS2RuR1U3anQ3RWM0S0hTcFBpZk5sV1dmcVhScE5JelNKTFVWZFpY?=
 =?utf-8?B?aHhESVVxVytEakpXcTN3ZHg4aHRZaHV6ZnF6QWxPNWVLQXJYNXRTQ2JtdXhL?=
 =?utf-8?B?S2dXRUcyNjVNOUo1YU9FVDJjcmtBT2V4c0pLZllyRDhXbGVIRFkrS0xqbmxY?=
 =?utf-8?B?dXBnSllaSHJMSFVHMGpZMThlRDdiU3VHTE5KZUU5Vms0WDZCOE9jOEY1ZWlu?=
 =?utf-8?B?bzVVb0lISjhWZjFXUUlIa0lDTDNpMC9xMjN2NEZlTzQ5a1FwaWJJV3VSdnFJ?=
 =?utf-8?B?YUI2L2ZxQ3B0cU1TS0dXZkpDbm1kV0dFSGZqVEcwbHFzLzJoenhYbnlrazVU?=
 =?utf-8?B?RHJFTlh5bi9jMFlrU2ZiRU9CcFUxS1BVM0hNUGRLdCtHaHdNSTRNV1U2NmMx?=
 =?utf-8?B?VkNtemtWd0tzR0MzV3EzNEc2N3c5U1UzNVhTV00vd21QdERlaFZCcS9sdVJU?=
 =?utf-8?B?NFVZKzhVeHJXZGxwN05VVmRwLzlsck9EcGJaa0NuenhQSThSL1U0bFdtNVJF?=
 =?utf-8?B?cXZHU0FvVXVSa1NFMzc2T0JqejhGa1ZLRFNEcUlkZVRLbDR6Q3E2bm5xNG5v?=
 =?utf-8?B?Zk9sbFk5TGRnMjVpNnJYU3crbHVGbkNIR3p5WlhLUkxMSFpNaW4vSS9xb2I2?=
 =?utf-8?B?YjJqMWlZczJKcU5HaTRUMDhYQzhuaHh6U2llL00yaTJHM1hoZ0d6dktqdnE2?=
 =?utf-8?B?emtXcm0zZHA5Y2k0RTYzTW80eHBwMVlTNk1kWkkweVB4OVAvT2doU3cyb1Jy?=
 =?utf-8?B?REE0SVJkcjFUU0pVYkFBRTdTcVpoNTZodW02cG9idjJTRC85SkxMamJuT0JE?=
 =?utf-8?B?ZzJtRjBUMlhxK0F5S0N5Z3hhSzgvVmtSTjFvcUw4WnE5eWxZdk1IQi9JcmZp?=
 =?utf-8?B?Z0cyTHo5STZ1cmZHT2R3dnBIZVlTTE9NM2Nta29qL25Gc3o3dDJDelhQbHJI?=
 =?utf-8?B?VGZMQ0xNR2h4Y3AwZlRIdjYreUgzdU9acVlibWhDWUlLVWkwSFpRQUk4bDcx?=
 =?utf-8?B?VDZMM21wUDhCVnpNaklway85ZkpnU1dCVkZBalY1OHRQTlp5bXBJb0F3dFVo?=
 =?utf-8?B?bUZRZmdLWEJqQWxyam94VEFCSUp2ekR5aXlibFZEbFEveTFZZE9TMmplb3hB?=
 =?utf-8?B?NXNxdnlPS0hsZzJyMlVzZTNhSmFIMSt2UTRhT0N4cXdKa2x0UjlYUGkrTzAz?=
 =?utf-8?Q?0qHo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748668bb-5049-475a-1532-08db50af961e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 17:05:27.0896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CYgC6JATjTDalKojgs67jZgApznnWX8KybQoruwjzfkB4g+kp60mA9aO26XcuF/XCTvbRHtJHX77EgogAmTKSg/6HiEFeKVFnbpAuc0ha+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12093
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSA5LCAyMDIzIDEwOjQwIEFNDQo+IFRvOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBMZWUgSm9uZXMgPGxlZUBr
ZXJuZWwub3JnPjsgQWxleGFuZHJlIEJlbGxvbmkNCj4gPGFsZXhhbmRyZS5iZWxsb25pQGJvb3Rs
aW4uY29tPjsgQWxlc3NhbmRybyBadW1tbyA8YS56dW1tb0B0b3dlcnRlY2guaXQ+Ow0KPiBNYWdu
dXMgRGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5r
ZXJuZWwub3JnOw0KPiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2Fz
LmNvbT47IFdvbGZyYW0gU2FuZyA8d3NhLQ0KPiBkZXZAc2FuZy1lbmdpbmVlcmluZy5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC81XSBtZmQ6IEFkZCBSZW5lc2FzIFBNSUMgUkFBMjE1
MzAwIFJUQyBkcml2ZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIE1heSA5LCAyMDIz
IGF0IDExOjMy4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90
ZToNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC81XSBtZmQ6IEFkZCBSZW5lc2FzIFBN
SUMgUkFBMjE1MzAwIFJUQw0KPiA+ID4gZHJpdmVyIE9uIFR1ZSwgTWF5IDksIDIwMjMgYXQgOToz
NeKAr0FNIEJpanUgRGFzDQo+IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+
ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA0LzVdIG1mZDogQWRkIFJlbmVzYXMgUE1J
QyBSQUEyMTUzMDAgUlRDDQo+ID4gPiA+ID4gZHJpdmVyIE9uIFR1ZSwgTWF5IDksIDIwMjMgYXQg
OTowNuKAr0FNIEJpanUgRGFzDQo+ID4gPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+ID4gPiA+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgNC81XSBtZmQ6IEFkZCBSZW5l
c2FzIFBNSUMgUkFBMjE1MzAwIFJUQw0KPiA+ID4gPiA+ID4gPiBkcml2ZXINCj4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gQ3VycmVudGx5LCBpdCBpcyBub3QgcG9zc2libGUgdG8gaW5zdGFu
dGlhdGUgdGhlIGkyYyBjbGllbnQNCj4gPiA+ID4gPiA+ID4gZHJpdmVyIHVzaW5nIE1GRCBjZWxs
IGFzIGl0IGlzIG5vdCBhIHBsYXRmb3JtIGRyaXZlci4gQWRkDQo+ID4gPiA+ID4gPiA+IHN1cHBv
cnQgZm9yIFJlbmVzYXMgUE1JQw0KPiA+ID4gPiA+ID4gPiBSQUEyMTUzMDAgUlRDIHBsYXRmb3Jt
IGRyaXZlciwgc28gdGhhdCBpdCBjYW4gYmUNCj4gPiA+ID4gPiA+ID4gaW5zdGFudGlhdGVkIGJ5
IE1GRA0KPiA+ID4gPiA+IEFQSS4NCj4gPiA+ID4gPiA+ID4gVGhlIHJ0YyBkZXZpY2UgaXMgY3Jl
YXRlZCBieSB1c2luZw0KPiA+ID4gPiA+ID4gPiBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UoKSBh
bmQgaXQgcmVnaXN0ZXIgYXMgdGhlIHJ0YyBkZXZpY2UNCj4gPiA+ID4gPiA+ID4gYnkgdGhlIGhl
bHBlciBmdW5jdGlvbiBwcm92aWRlZCBieQ0KPiA+ID4gPiA+ID4gPiBydGMtaXNsMjEwOCBkcml2
ZXIuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gTm90IHN1cmUgdGhpcyBwbGF0Zm9ybSBkcml2
ZXIgaGFzIHRvIGJlIHBsYWNlZCBpbiBSVEMNCj4gPiA+ID4gPiA+IHN1YnN5c3RlbSByYXRoZXIg
dGhhbiBNRkQgc3Vic3lzdGVtIGFzIFBNSUMgTUZEIGRyaXZlciwgY2FuDQo+ID4gPiA+ID4gPiBp
bnN0YW50aWF0ZSBpdCB1c2luZw0KPiA+ID4gTUZEIGNlbGw/Pw0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gQ2FuJ3QgeW91IGp1c3QgaW5zdGFudGlhdGUgdGhlIGkyYyBhbmNpbGxhcnkgZGV2aWNlIGZy
b20gdGhlDQo+ID4gPiA+ID4gUE1JQyBkcml2ZXIsIGFuZCBkcm9wIHRoZSBuZXcgbWZkIGFuZCBw
bGF0Zm9ybSBydGMgZHJpdmVycz8NCj4gPiA+ID4NCj4gPiA+ID4gWWVzLCBpdCBpcyBwb3NzaWJs
ZS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIG9ubHkgcmVhc29uIE1GRCBpcyB1c2VkIGZvciBmdXR1
cmUgZXhwYW5zaW9uIGxpa2UgYWRkaW5nDQo+ID4gPiA+IHN1cHBvcnQgZm9yDQo+ID4gPiA+DQo+
ID4gPiA+IDEpIGJhdHRlcnkgY2hhcmdlcg0KPiA+ID4gPiBPcg0KPiA+ID4gPiAyKSByZWd1bGF0
b3INCj4gPiA+DQo+ID4gPiBJJ2QganVzdCBzdGFydCB3aXRoIGEgc2tlbGV0b24gcmVndWxhdG9y
ICgiUE1JQyIpIGRyaXZlci4uLg0KPiA+ID4NCj4gPiA+ID4gSW4gdGhhdCBjYXNlLCB3ZSBjYW4g
c2hhcmUgcmVnbWFwIHRvIHN1YiBkZXZpY2VzLiBCdXQgdGhlc2UNCj4gPiA+ID4gZHJpdmVycyBh
cmUNCj4gPiA+IG5vdCBjdXJyZW50bHkgcGxhbm5lZC4NCj4gPiA+ID4NCj4gPiA+ID4gQXBhcnQg
ZnJvbSB0aGF0LA0KPiA+ID4gPg0KPiA+ID4gPiAxKSBJdCBhdm9pZHMgc3Vic3lzdGVtIGRlcGVu
ZGVuY2llcywgaWUsIFBNSUMgZHJpdmVyIGRpcmVjdGx5DQo+ID4gPiA+IGNhbGxpbmcgcnRjDQo+
ID4gPiBkcml2ZXINCj4gPiA+ID4gICAgZm9yIHJlZ2lzdGVyaW5nIFJUQyBkZXZpY2UuDQo+ID4g
Pg0KPiA+ID4gWW91IG1lYW4gdGhlIGRpcmVjdCBjYWxsIGludG8gcmFhMjE1MzAwX3J0Y19wcm9i
ZV9oZWxwZXIoKT8NCj4gPg0KPiA+IFllcywgaW5kZWVkLg0KPiA+DQo+ID4gPiBJIHRoaW5rIHRo
YXQgY2FuIGJlIHNvbHZlZCBieSBlbmhhbmNpbmcgaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlKCkN
Cj4gPiA+IHRvIHRha2UgYSBwcm9wZXIgZGV2aWNlIG5hbWUsIGluc3RlYWQgb2YgdXNpbmcgImR1
bW15Ij8NCj4gPg0KPiA+IEdlZXJ0LCBXb2xmcmFtLA0KPiA+DQo+ID4gQW55IHBvaW50ZXJzIGZv
ciBpbnN0YW50aWF0aW5nIGkyY19jbGllbnQgZGV2aWNlKGZvciBlZzoNCj4gPiBydGNfaXNsMTIw
OC5jKSBieSBlbmhhbmNpbmcgaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlKCkgYXBpPw0KPiA+DQo+
ID4gQXBhcnQgZm9yIHRoaXMsIHNpbmNlIGEgc2luZ2xlIGNvbXBhdGlibGUodGhlIHBtaWMgb25l
KSBpcyB1c2VkLA0KPiA+DQo+ID4gSW4gcnRjIGRldmljZSBwcm9iZSwgSG93IGRvIHdlIGlkZW50
aWZ5IHRoaXMgUE1JQyBSVEMgZGV2aWNlIGFuZCB1c2UNCj4gPiB0aGUgIlRZUEVfSVNMMTIwOCIg
Y29uZmlnIGluIFJUQyBkcml2ZXIsIG9uY2Ugd2UgaW5zdGFudGlhdGUgUlRDIGRldmljZT8NCj4g
DQo+IFlvdSBjcmVhdGUgYW5jaWxsYXJ5IGRldmljZXMgd2l0aCBkaWZmZXJlbnQgbmFtZXMsIGJh
c2VkIG9uIHRoZSBkZXRlY3RlZA0KPiBQTUlDIHZlcnNpb24sIGFuZCBhZGQgbmV3IHR5cGVzIGZv
ciB0aGVtIHRvIHRoZSBpc2wxMjA4IGRyaXZlcj8NCg0KT0ssIEkgaGF2ZSBwcm90b3R5cGVkIHRo
aXMuDQoNCldvbGZyYW0sDQoNCldoYXQgaXMgeW91ciBvcGluaW9uLCBzaG91bGQgSSBlbmhhbmNl
ICJpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UiIGxpa2UNCmJlbG93WzFdPyAgb3IgZGlyZWN0bHkg
Y2FsbCAiaTJjX25ld19jbGllbnRfZGV2aWNlIiBmcm9tIFBNSUMgZHJpdmVyIHRvDQppbnN0YW50
aWF0ZSB0aGUgY2xpZW50IGRldmljZT8NCg0KUGxlYXNlIGxldCBtZSBrbm93Lg0KDQpbMV0NCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgYi9kcml2ZXJzL2kyYy9pMmMt
Y29yZS1iYXNlLmMNCmluZGV4IGFlM2FmNzM4YjAzZi4uNzk4MDhlODUyZjJmIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jDQorKysgYi9kcml2ZXJzL2kyYy9pMmMtY29y
ZS1iYXNlLmMNCkBAIC0xMTIyLDE1ICsxMTIyLDE3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGRldm1f
aTJjX25ld19kdW1teV9kZXZpY2UpOw0KICAqIEBjbGllbnQ6IEhhbmRsZSB0byB0aGUgcHJpbWFy
eSBjbGllbnQNCiAgKiBAbmFtZTogSGFuZGxlIHRvIHNwZWNpZnkgd2hpY2ggc2Vjb25kYXJ5IGFk
ZHJlc3MgdG8gZ2V0DQogICogQGRlZmF1bHRfYWRkcjogVXNlZCBhcyBhIGZhbGxiYWNrIGlmIG5v
IHNlY29uZGFyeSBhZGRyZXNzIHdhcyBzcGVjaWZpZWQNCisgKiBAYXV4X2RldmljZV9uYW1lOiBP
cHRpb25hbCBhbmNpbGxhcnkgZGV2aWNlIG5hbWUNCiAgKiBDb250ZXh0OiBjYW4gc2xlZXANCiAg
Kg0KICAqIEkyQyBjbGllbnRzIGNhbiBiZSBjb21wb3NlZCBvZiBtdWx0aXBsZSBJMkMgc2xhdmVz
IGJvdW5kIHRvZ2V0aGVyIGluIGEgc2luZ2xlDQogICogY29tcG9uZW50LiBUaGUgSTJDIGNsaWVu
dCBkcml2ZXIgdGhlbiBiaW5kcyB0byB0aGUgbWFzdGVyIEkyQyBzbGF2ZSBhbmQgbmVlZHMNCi0g
KiB0byBjcmVhdGUgSTJDIGR1bW15IGNsaWVudHMgdG8gY29tbXVuaWNhdGUgd2l0aCBhbGwgdGhl
IG90aGVyIHNsYXZlcy4NCisgKiB0byBjcmVhdGUgSTJDIGFuY2lsbGFyeSBjbGllbnRzIHRvIGNv
bW11bmljYXRlIHdpdGggYWxsIHRoZSBvdGhlciBzbGF2ZXMuDQogICoNCi0gKiBUaGlzIGZ1bmN0
aW9uIGNyZWF0ZXMgYW5kIHJldHVybnMgYW4gSTJDIGR1bW15IGNsaWVudCB3aG9zZSBJMkMgYWRk
cmVzcyBpcw0KLSAqIHJldHJpZXZlZCBmcm9tIHRoZSBwbGF0Zm9ybSBmaXJtd2FyZSBiYXNlZCBv
biB0aGUgZ2l2ZW4gc2xhdmUgbmFtZS4gSWYgbm8NCi0gKiBhZGRyZXNzIGlzIHNwZWNpZmllZCBi
eSB0aGUgZmlybXdhcmUgZGVmYXVsdF9hZGRyIGlzIHVzZWQuDQorICogVGhpcyBmdW5jdGlvbiBj
cmVhdGVzIGFuZCByZXR1cm5zIGFuIEkyQyBhbmNpbGxhcnkgY2xpZW50IHdob3NlIEkyQyBhZGRy
ZXNzDQorICogaXMgcmV0cmlldmVkIGZyb20gdGhlIHBsYXRmb3JtIGZpcm13YXJlIGJhc2VkIG9u
IHRoZSBnaXZlbiBzbGF2ZSBuYW1lLiBJZiBubw0KKyAqIGFkZHJlc3MgaXMgc3BlY2lmaWVkIGJ5
IHRoZSBmaXJtd2FyZSBkZWZhdWx0X2FkZHIgaXMgdXNlZC4gaWYgbm8gYXV4X2RldmljZV8NCisg
KiBuYW1lIGlzIHNwZWNpZmllZCBieSB0aGUgZmlybXdhcmUsIGl0IHdpbGwgY3JlYXRlIGkyYyBk
dW1teSBjbGllbnQuDQogICoNCiAgKiBPbiBEVC1iYXNlZCBwbGF0Zm9ybXMgdGhlIGFkZHJlc3Mg
aXMgcmV0cmlldmVkIGZyb20gdGhlICJyZWciIHByb3BlcnR5IGVudHJ5DQogICogY2VsbCB3aG9z
ZSAicmVnLW5hbWVzIiB2YWx1ZSBtYXRjaGVzIHRoZSBzbGF2ZSBuYW1lLg0KQEAgLTExMzksMTAg
KzExNDEsMTIgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZGV2bV9pMmNfbmV3X2R1bW15X2RldmljZSk7
DQogICogaTJjX3VucmVnaXN0ZXJfZGV2aWNlKCk7IG9yIGFuIEVSUl9QVFIgdG8gZGVzY3JpYmUg
dGhlIGVycm9yLg0KICAqLw0KIHN0cnVjdCBpMmNfY2xpZW50ICppMmNfbmV3X2FuY2lsbGFyeV9k
ZXZpY2Uoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCi0JCQkJCQljb25zdCBjaGFyICpuYW1l
LA0KLQkJCQkJCXUxNiBkZWZhdWx0X2FkZHIpDQorCQkJCQkgICAgY29uc3QgY2hhciAqbmFtZSwN
CisJCQkJCSAgICB1MTYgZGVmYXVsdF9hZGRyLA0KKwkJCQkJICAgIGNvbnN0IGNoYXIgKmF1eF9k
ZXZpY2VfbmFtZSkNCiB7DQogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBjbGllbnQtPmRldi5v
Zl9ub2RlOw0KKwlzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjX2F1eF9jbGllbnQ7DQogCXUzMiBhZGRy
ID0gZGVmYXVsdF9hZGRyOw0KIAlpbnQgaTsNCiANCkBAIC0xMTUzLDcgKzExNTcsMjcgQEAgc3Ry
dWN0IGkyY19jbGllbnQgKmkyY19uZXdfYW5jaWxsYXJ5X2RldmljZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50LA0KIAl9DQogDQogCWRldl9kYmcoJmNsaWVudC0+YWRhcHRlci0+ZGV2LCAiQWRk
cmVzcyBmb3IgJXMgOiAweCV4XG4iLCBuYW1lLCBhZGRyKTsNCi0JcmV0dXJuIGkyY19uZXdfZHVt
bXlfZGV2aWNlKGNsaWVudC0+YWRhcHRlciwgYWRkcik7DQorDQorCWlmIChhdXhfZGV2aWNlX25h
bWUpIHsNCisJCXN0cnVjdCBpMmNfYm9hcmRfaW5mbyBpbmZvOw0KKwkJc2l6ZV90IGRldmljZV9u
YW1lX2xlbiA9IHN0cmxlbihkZXZpY2VfbmFtZSk7DQorDQorCQlpZiAoYXV4X2RldmljZV9uYW1l
X2xlbiA+IEkyQ19OQU1FX1NJWkUgLSAxKSB7DQorCQkJZGV2X2VycigmY2xpZW50LT5hZGFwdGVy
LT5kZXYsICJJbnZhbGlkIGRldmljZSBuYW1lXG4iKTsNCisJCQlyZXR1cm4gRVJSX1BUUigtRUlO
VkFMKTsNCisJCX0NCisNCisJCW1lbXNldCgmaW5mbywgMCwgc2l6ZW9mKHN0cnVjdCBpMmNfYm9h
cmRfaW5mbykpOw0KKw0KKwkJbWVtY3B5KGluZm8udHlwZSwgZGV2aWNlX25hbWUsIGRldmljZV9u
YW1lX2xlbik7DQorCQlpbmZvLmFkZHIgPSBhZGRyOw0KKw0KKwkJaTJjX2F1eF9jbGllbnQgPSBp
MmNfbmV3X2NsaWVudF9kZXZpY2UoY2xpZW50LT5hZGFwdGVyLCAmaW5mbyk7DQorCX0gZWxzZSB7
DQorCQlpMmNfYXV4X2NsaWVudCA9IGkyY19uZXdfZHVtbXlfZGV2aWNlKGNsaWVudC0+YWRhcHRl
ciwgYWRkcik7DQorCX0NCisNCisJcmV0dXJuIGkyY19hdXhfY2xpZW50Ow0KIH0NCiBFWFBPUlRf
U1lNQk9MX0dQTChpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UpOw0KDQoNCkNoZWVycywNCkJpanUN
Cg==
