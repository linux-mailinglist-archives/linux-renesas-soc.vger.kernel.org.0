Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2CAF6B1D32
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 08:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjCIH6z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 02:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjCIH6V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 02:58:21 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20725.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::725])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1671DDF738;
        Wed,  8 Mar 2023 23:57:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzUg38iAbqwGkJURCFam8gI+umN2QOMC1UidPAWuaqp5HFhX9t3OFHp6Me4EtOBsuGaf7sCVOcwgDvN2LLvWjlG+AoFZG771vMzTPfpOiZqjobBK+b2DroiJVrJAirITal9pGNL3W/PG/BFscbokWhHpbLcZR1j6u4ScOb3+epxKpb86Cfpf2EiUQQYOh8/PILC2SaU68oGw8fWK3qR1C9B+bPiThXwY/qFtuwxPNwZe+l/HYIxvHzXKKSenZnfjE5IzHEpExhTLH4QVkGgDi+yk9rkm+EHUAm9ZmxkSllaDG9TirLKcC4r1aRlNg99zP0HbNovX6ZHOBQ95bhocqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16rWFr6gBrcdNRFj6+Q2u9vnSDnVC3jp4zNPT5hp/Ug=;
 b=UZaFce8U95N+bKlGbKIiz7Y4jaW+MbUZFEYBUUxmHIRMkYP8g09180TN5LPvL/4YM1fkXA+k21gVlSic7cHm2kLTdptUQtP47ghl7khL1k+GnClolORQ5a1XZtcOgCCUUdv6FjOHU/vUPno/1pIAsz6aIaVFPibFGq9pxNV6L19KsP4s+aA7JTrzyQIiB7rbXE1ubjfT3CELIjbJFYnhrMqf3/txkLPShnCG3SUzGDPvzw2ps6QZP/b8Fq2iMdQ3SYF0opgh3kqC4wz/NUcKC9cSijCQgvMl4WKAQ3dW+7a+Lm2UYMh7ozkvLvn61DtHdDOmM6eZj4jL3qWnYpRoxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16rWFr6gBrcdNRFj6+Q2u9vnSDnVC3jp4zNPT5hp/Ug=;
 b=bW+9OmItTWeIF9w9Af/sZRTEUZI8LSBihtvxHcq1Ku/czPLE+T+6FH/DiCfg8dCNKgSF2bFXUiY+0NGUlf3HhNt0Oa0TvibB2RUYCiw8p/N7kayKmMqZnmPwUiw1NFpjkI0XE7zebfL12y55jMadgzaBgfIQkvKAXSryAbxRQdw=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS3PR01MB9638.jpnprd01.prod.outlook.com (2603:1096:604:1ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Thu, 9 Mar
 2023 07:57:02 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06%4]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 07:57:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Topic: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Index: AQHZRS0aT95BTvtLwUKgslaMkC+eWK7at0aAgBZQ9vCAAEpeAIAAAIEwgAAHzgCAANKNMA==
Date:   Thu, 9 Mar 2023 07:57:02 +0000
Message-ID: <TYCPR01MB5933650D5BAB7A3F4BE03BAF86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
 <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org>
 <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <6cbe6c71-2d2d-0f79-1270-7f8ed2ddc1d6@linaro.org>
In-Reply-To: <6cbe6c71-2d2d-0f79-1270-7f8ed2ddc1d6@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|OS3PR01MB9638:EE_
x-ms-office365-filtering-correlation-id: 3696b163-5539-450c-8809-08db2073de36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pZ47UVp/P3a+xckvz+gQ7FU0wFjiBbV3keQbxLQ8hu/9wPbMNuhUk/+SYBIPb7ofaye0Qsggyr/Rmr9oHG0z4YTg2n+OT89Q6u6cm3dIWwWPeJev2ubo4ky04+XQIg/ATFCTwpzQzwXoZxN8hZTXe+u5vZkFMRCAVrqGQlKQ7Mv6wsRm31SU6HoWgJo2zUtOKRMeaJ00kzwuPr1UPjVQ0NtIbo415Ti7ahhqg0FVkeixg3A3flQQNb7z0feG1/WCx0pOjAyfc9oi0jfJzWrgCST4R32U3WHtuqMT4Zr0Ss0pxXglIz2EIxazf8BiyPHr9mMLaZFXvV2dL3uws2lVcoHUn9C4iPUNlDyAm6zSgm+5g1JHmEDqQGJNYB8lxl4AQQVzkUgnQ4JTfx8e4SyCluomaL8uHTi5UYuUJJlXfWDWEbN+/yW3H2zDQiEWb8mvCPrV/68zac/iR2v8t2+M2HEaCB2O/i/vl4Kyj6drN9wDncaXf3YR/aEoMGZFyi6+/a/EInIW1wS/hN56CirGFOhmsvpjq+37PQtxjvJwEpdsiBzBtx9akL6Wnl4+qyMkzqTRuzfHqS7TRajXfuCh+P1vchVkZzN0S2MOLL0CM3B8c2oQAbpWTW4MTv5qRrbjJLTiEVLqRanDKS72bkB9bqGagdv5JmDOpIMWIvZNLpMHmHfQhXZe5KoE47iC8g+SXK7O6XM9DlUIgbMBNi6UiA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199018)(86362001)(122000001)(66446008)(38070700005)(38100700002)(33656002)(66946007)(76116006)(5660300002)(2906002)(8676002)(66476007)(8936002)(4326008)(64756008)(66556008)(41300700001)(52536014)(9686003)(53546011)(186003)(83380400001)(110136005)(55016003)(478600001)(7696005)(316002)(26005)(6506007)(71200400001)(107886003)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1RiMGtleFZlYVlrN3RTamUwWHoxbi91WGpXbWZwdENhUlU5SmV3SzhOdHFm?=
 =?utf-8?B?WktGbEFCSk52bTRXU1V4ZUVOV2JxRWtDRlc1V0Y5TkU0QTZpdktZS0NSRkJs?=
 =?utf-8?B?VWx2ZElDTjNYbSt6Z0RiVHdPeDRZQkhSMllHSGpPY3YxemwwUW5rMEFVb2dX?=
 =?utf-8?B?NmREdWd4dnRaNHN3V25KQ3haWTM2c2RzcG5Lb0F0UXhSbzFoNlVGTW0rNldS?=
 =?utf-8?B?R1g2NGFVMG50NGVjMXFzMm9td1Y0QjhzeUlXNitsSlRmRUlzNlJlSkhJa0FE?=
 =?utf-8?B?VGRSLzJyMCtkVEhzUndBNGhPRnkrdUpiUmRUNDJyR2NsZGRLU2RHd09VSTk1?=
 =?utf-8?B?b3R2WGU1NW1sdml4WlVwKzdhYk1NZU9pYlBOQzJ4VzNId1FLZGdOeWp2NG5n?=
 =?utf-8?B?QU9HNjQzaTJJVERIUHozeG5RMjBack8rNnVadVNsNGZSbEJiQXJPTVdVM3du?=
 =?utf-8?B?eVMzTDJGOGhNd21FbGx0QmRBVGQxRXI3QmRFa3pPSDgrcTZ4MnJGU1RrVjYz?=
 =?utf-8?B?aWtReVAzN0lrSjJtbVZEdUhkeHUwK2R4azBoUmdHeUVKZURlT0FQOXI4YU03?=
 =?utf-8?B?bFl6N1FTc0tzQ3Boa3gvTWRHaHk1eGErSzhwTkFoT0pzMlB4bDhIbUM3Tm96?=
 =?utf-8?B?WGV5alVDT0srcEFRMENmNHM4eWdDTk9tZFFORXlBUGhqWnM4TE1oNEJ5NytG?=
 =?utf-8?B?VlhLdm5JRXV6RzhCMHhHMHNJVm5YZWJ6bitIVzZsQjRDZFAwbkZFT3JOZllZ?=
 =?utf-8?B?by9zVk5GN0hQWnRCU0o1eXc2SXpCZ0FUamFQVkFaTG0wOGJxeVJhMHlScFlo?=
 =?utf-8?B?dURYeW5ET0ljVnVZbm5kb2c5Z2pPWjkxZEwyeEQwRVhZd3JUWEtTOFpzNU4y?=
 =?utf-8?B?ME5UVG13SGtJWjQyLzYreitYZFBHT2NSNlJiaC9CTEFCKzNEREJIYklyR2pp?=
 =?utf-8?B?dzlWb0J1VjNQUWJvTktJeGFORHBadFR2L2VEQ2hQME9jdk54WDZBU1FkVmJQ?=
 =?utf-8?B?bWZzcG9lUVZaV2hDdzAyaFlQRCtRSmI2L2swUjlpNDdSYWRLalpkcC9NVGZJ?=
 =?utf-8?B?YktJUWhtZ2c5dXBzM2tHeTdWN0JuRjZhbkdHTCt5WDFvaE10WmJUUXVKRExq?=
 =?utf-8?B?cy9iUWcveHArZE5nckwyZXdJdnVJTzhHYXpMNTRSTXp2bTB1cHNraS83aEJx?=
 =?utf-8?B?N3ZoK2RiZ1REbDVzWWhUMCtvNHpFaHJ3N0ZYT2dETm4zV0wxSFlDa1k0MUZD?=
 =?utf-8?B?TnNWeEphandOQWFndVR0aHNlNlZaclJXMkJNYi82OEJNUlZQNm1hMXlhbDE1?=
 =?utf-8?B?Zm9id2IzcmU2TFZPSHA0TUZyaUNHZFlhRUl5WmhaZElJTTllWHhXM1FSc1gr?=
 =?utf-8?B?RTJEOVc5Zk91RnlqdHR1dk0renBhY0RkQ1docE9CdjRETXQ0T2JGK3NOV0tn?=
 =?utf-8?B?K2plaGJ0b3g5WDkrYUJBNU4wdWJ0a1FlWS92Q1VnQXVGMnFneXp2clVVaEpu?=
 =?utf-8?B?NGFYb1VqYzVZSFpFcjltNXlqUituOG9SNDFOYWNGZnRyWHNPbU9WYjhVOW9j?=
 =?utf-8?B?KzBQdDNqbWR2dnhRMkZhQ05zb2lQMWNFZ2YxOHZrTDRSMzNjSHFKeGxMWDZo?=
 =?utf-8?B?TXk4VmpOMHFFWGovRXFJZ0drejFIOVV6NHN2L0c1dWR4WHUzMlR5NkVKdkNr?=
 =?utf-8?B?UlFkK3BFazVjeHcrQXVCS1RkeXU3b0hEay9ZUHQyU1ZCV09TbXEzQ3cvRURt?=
 =?utf-8?B?RnlDdU00aFRxcENDMVdQdFIreUs0ZUF1c3lyUC92VUhRRzViQzgyR21VdEtL?=
 =?utf-8?B?NHV0RTQyM0U5Nk1WSWVqQVVlLy96QS8vbmZWYitLZGdhSU1UdE1RbVNrNHV1?=
 =?utf-8?B?TktNVzgzNWkxbVZiMDdCSHJtcDJOYjNvQ3Z5MDRjanR1VFA4VGVWTXh3MXVj?=
 =?utf-8?B?eGVlclIvVU42dlJnbmwzMDh1bEszcmswWWFnbVJ1Rzk0RVJzM3NFV2J0aVpV?=
 =?utf-8?B?d1V5dTNjSnBMTURTUXFkVEFZTVNqQ3RWRXg3MElGM1dQeUp2VlNMMGdmZUIv?=
 =?utf-8?B?RVgrTWlBZVl4RFBjS1kyZGxiSldBcFpRN3dOcVdPZ1ZEenVMTk5yeHV6aXlq?=
 =?utf-8?Q?12yL64PsSnb24x9XNNbJOg0as?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3696b163-5539-450c-8809-08db2073de36
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 07:57:02.4032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPGxiHCn7MOpWpl2y2LPE/I2ZFEZ6eRwt7ObGvjFZbX+ZwM+7cv7gLB8Ok7dYs0fegpV6a4dswpSuIKsl7BQgeFj6L4OfHKp2fZtGZ6vHf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9638
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCBSRkMgMS8zXSBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBSZW5l
c2FzIHZlcnNhMyBjbG9jaw0KPiBnZW5lcmF0b3IgYmluZGluZ3MNCj4gDQo+IE9uIDA4LzAzLzIw
MjMgMTk6NTUsIEJpanUgRGFzIHdyb3RlOg0KPiA+DQo+ID4gUmVuZXNhcyA4VDQ5TjI0MSBoYXMg
NCBvdXRwdXRzLCAxIGludGVncmFsIGFuZCAzIGZyYWN0aW9uYWwgZGl2aWRlcnMuDQo+ID4gVGhl
IDhUNDlOMjQxIGFjY2VwdHMgdXAgdG8gdHdvIGRpZmZlcmVudGlhbCBvciBzaW5nbGUtZW5kZWQg
aW5wdXQNCj4gPiBjbG9ja3MgYW5kIGEgZnVuZGFtZW50YWwtbW9kZSBjcnlzdGFsIGlucHV0LiBU
aGUgaW50ZXJuYWwgUExMIGNhbiBsb2NrDQo+ID4gdG8gZWl0aGVyIG9mIHRoZSBpbnB1dCByZWZl
cmVuY2UgY2xvY2tzIG9yIHRvIHRoZSBjcnlzdGFsIHRvIGJlaGF2ZSBhcw0KPiA+IGEgZnJlcXVl
bmN5IHN5bnRoZXNpemVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleCBIZWxtcyA8YWxl
eGFuZGVyLmhlbG1zLmp5QHJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPg0KPiANCj4gQWgsIGluZGVlZCwgZmluZSB0aGVuLg0KPiANCj4g
Pj4NCj4gPj4+Pg0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgIHJlbmVzYXMsY2xvY2stZmxhZ3M6DQo+
ID4+Pj4+ICsgICAgZGVzY3JpcHRpb246IEZsYWdzIHVzZWQgaW4gY29tbW9uIGNsb2NrIGZyYW1l
IHdvcmsgZm9yDQo+IGNvbmZpZ3VyaW5nDQo+ID4+Pj4+ICsgICAgICBjbGsgb3V0cHV0cy4gU2Vl
IGluY2x1ZGUvbGludXgvY2xrLXByb3ZpZGVyLmgNCj4gPj4+Pg0KPiA+Pj4+IFRoZXNlIGFyZSBu
b3QgYmluZGluZ3MsIHNvIHdoeSBkbyB5b3Ugbm9uLWJpbmRpbmdzIGNvbnN0YW50cyBhcw0KPiBi
aW5kaW5ncz8NCj4gPj4+PiBUaGV5IGNhbiBjaGFuZ2UgYW55dGltZS4gQ2hvb3NlIG9uZToNCj4g
Pj4+PiAxLiBEcm9wIGVudGlyZSBwcm9wZXJ0eSwNCj4gPj4+PiAyLiBNYWtlIGl0IGEgcHJvcGVy
IGJpbmRpbmcgcHJvcGVydHksIHNvIGFuIEFCSSBhbmQgZXhwbGFpbiB3aHkNCj4gPj4+PiB0aGlz
IGlzIERUIHNwZWNpZmljLiBOb25lIG9mIGNsb2NrIHByb3ZpZGVycyBoYXZlIHRvIGRvIGl0LCBz
byB5b3UNCj4gPj4+PiBuZWVkIGhlcmUgZ29vZCBleHBsYW5hdGlvbi4NCj4gPj4+DQo+ID4+PiBJ
IHdpbGwgY2hvb3NlIDIgYW5kIHdpbGwgZXhwbGFpbiBhcyB1c2VyIHNob3VsZCBiZSBhbGxvd2Vk
IHRvDQo+ID4+PiBjb25maWd1cmUgdGhlIG91dHB1dCBjbG9jayBmcm9tIGNsayBnZW5lcmF0b3Is
IHNvIHRoYXQgaXQgaGFzDQo+ID4+PiBmbGV4aWJpbGl0eSBmb3INCj4gPj4+IDEpIGNoYW5naW5n
IHRoZSByYXRlcyAocHJvcGFnYXRlIHJhdGUgY2hhbmdlIHVwIG9uZSBsZXZlbCkNCj4gPj4+IDIp
IGZpeGVkIGFsd2F5cw0KPiA+Pj4gMykgZG9uJ3QgZ2F0ZSB0aGUgb3VwdXQgY2xrIGF0IGFsbC4N
Cj4gPj4NCj4gPj4gVXNlcidzIGNob2ljZSBpcyB0YXNrIGZvciB1c2VyLXNwYWNlLCBzbyBub3Qg
YSBnb29kIGV4cGxhbmF0aW9uIGZvciBEVC4NCj4gPg0KPiA+IEkgZG9uJ3QgdGhpbmsgY2xvY2sg
Z2VuZXJhdG9yIEhXIGhhcyBhbnkgYnVzaW5lc3Mgd2l0aCB1c2VyIHNwYWNlLg0KPiA+DQo+ID4g
SXQgaXMgY2xrIGdlbmVyYXRvciBIVyBzcGVjaWZpYy4gQ2xrIGdlbmVyYXRvciBpcyB2aXRhbCBj
b21wb25lbnQNCj4gPiB3aGljaCBwcm92aWRlcyBjbG9ja3MgdG8gdGhlIHN5c3RlbS4NCj4gDQo+
IEV2ZXJ5IGNsb2NrIGNvbnRyb2xsZXIgaXMgdml0YWwuLi4NCj4gDQo+ID4gV2UgYXJlIHByb3Zp
ZGluZyBzb21lIGhhcmR3YXJlIGZlYXR1cmUgd2hpY2ggaXMgZXhwb3NlZCBhcyBkdA0KPiA+IHBy
b3BlcnRpZXMuDQo+ID4NCj4gPiBMaWtlIGNsb2NrIG91dHB1dCBpcyBmaXhlZCByYXRlIGNsb2Nr
IG9yIGR5bmFtaWMgcmF0ZSBjbG9jay8NCj4gDQo+IE9LLCBJIHdhaXQgdGhlbiBmb3IgcHJvcGVy
IGRlc2NyaXB0aW9uIHdoaWNoIHdpbGwgZXhwbGFpbiBhbmQganVzdGlmeSB0aGlzLg0KDQpIZXJl
IGl0IGlzLCBQbGVhc2UgbGV0IG1lIGtub3cgaXMgaXQgb2s/DQoNCnJlbmVzYXMsb3V0cHV0LWNs
b2NrLWZpeGVkLXJhdGUtbW9kZToNCiAgICB0eXBlOiBib29sZWFuDQogICAgZGVzY3JpcHRpb246
DQogICAgICBJbiBvdXRwdXQgY2xvY2sgZml4ZWQgcmF0ZSBtb2RlLCB0aGUgb3V0cHV0IGNsb2Nr
IGZyZXF1ZW5jeSBpcyBhbHdheXMNCiAgICAgIGZpeGVkIGFuZCB0aGUgaGFyZHdhcmUgd2lsbCB1
c2UgdGhlIHZhbHVlcyBmcm9tIHRoZSBPVFAgb3IgZnVsbCByZWdpc3Rlcg0KCW1hcCBpbml0aWFs
aXplZCBkdXJpbmcgYm9vdC4NCiAgICAgIElmIG5vdCBnaXZlbiwgdGhlIG91dHB1dCBjbG9jayBy
YXRlIGlzIG5vdCBmaXhlZC4NCiAgICBtYXhJdGVtczogNg0KDQpDaGVlcnMsDQpCaWp1DQo=
