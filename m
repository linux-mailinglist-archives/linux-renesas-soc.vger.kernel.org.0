Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5211637513
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Nov 2022 10:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiKXJZU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Nov 2022 04:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiKXJZS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2022 04:25:18 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2115.outbound.protection.outlook.com [40.107.113.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B80311605A;
        Thu, 24 Nov 2022 01:25:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OE+K36IEM1llkc0tS/U8WbBWXsotpA2OS6fFvxmDQ5K4qj0w+EE4xebYcnihQK6a22aRxJ8fw0QCCmmShgnzEFmEdiOUbnvlexrjx2J9wbC5yPbQV/aCMl7WznQ+jDlh1V0q7eOdJk9p5WT8Lqer7xBNuR7urg8xf6N9PR28xRjNwO6odRNlwp4rhb0GjTEBQux83kSScT1ba/iYdJEXFFDnnQEVfGh2nksXrdOX/C+Z76YogunMmwVH2aoF7mUkCluxbDYISU2nPf/bpOOKHpQOj8vgrAFSlatwO73zICfXM9yA0Z5yD9kCUoUnIXCSApOii/a6XBeySc/Lau0t3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97j4ugpzhhtPwa7o1U0aPYsOctzAZTY7SNGYOubFvHo=;
 b=ScCZMRyMyub+aWpbeqZzErTKFYH0CDyDwoB+LN1wGnU45eqCnAI76bR9OvzYR0kgl8LgOacSL13/1Ngv4JJfX/1aO+myFqOUFHhwLkZfe6Q3PwKp20MZ8QqUkMWC/cpRnXV/X3YsQ4Xy/XabOBmggfO/DG4pzWru1vEijj1zLk5Xqxy1PquCRXsQDD6XHaS9ckRJHFmf8lfOdf7MGwY5Z1txICRCSuvjwEqPWldsKb9tzvtYeTIDrKAIVohvCFfDFFmkIIZhGSAeZbJKcvbd6tNnUEAIcCauNQjZPrDSQViMIv8LNikSLMNlmt43wh/jTXDS3/RmIlTvvRMtyroMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97j4ugpzhhtPwa7o1U0aPYsOctzAZTY7SNGYOubFvHo=;
 b=XQ/WB3BpM7/dLWze6xAl+fh+qWLcs2ebjCkAHI9R9O07eEdty12I5YN9Iah8StgdW8Aeq+KQPrAdevySt7kkoSCrIjPm/KQdcf7m47ociMf3uw5hZOk9VCii+VVvnPODFjm6J3z3rZO2QOhE5OkxEbCh2vT2/T6ujawnHfde6f8=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYWPR01MB9885.jpnprd01.prod.outlook.com (2603:1096:400:224::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 09:25:14 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::dc1d:adf8:9948:6dae]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::dc1d:adf8:9948:6dae%8]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 09:25:14 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH 1/5] clk: renesas: r9a09g011: Add PWM clock entries
Thread-Topic: [PATCH 1/5] clk: renesas: r9a09g011: Add PWM clock entries
Thread-Index: AQHY+1AGRtGN14GIa02VCAZ62rt/Ka5NyhkAgAAHHJA=
Date:   Thu, 24 Nov 2022 09:25:14 +0000
Message-ID: <TYCPR01MB59332B69440D0EFF78ED5254860F9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20221118131641.469238-1-biju.das.jz@bp.renesas.com>
 <20221118131641.469238-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWONMvHeShCK76_2G0FiYKsqTO57kKOhG0nN1Sb09+6YQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWONMvHeShCK76_2G0FiYKsqTO57kKOhG0nN1Sb09+6YQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYWPR01MB9885:EE_
x-ms-office365-filtering-correlation-id: 8d8ce999-b676-4bee-6ce1-08dacdfdcb0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wcSywoOh5r+HyG298Sh0Am/HlIanTBaVPcMthvYqG8QxJAhmQ/ZXOyp2B/7YjXGm24IIhWT2YhPNru7//3PfHwjTjxKjLvKnIRMV0QtBaupa1nelh/siN57db8N1VgUVwCnRr0bGNUnPadpVwq+XqC5v60H/fir6V3uzQ6I7ShqaSvOD5ac+4ctMRUbxKGVuC12HndaK8oZP0EKnx9tSQQb5aP9srlzWok3UzFqkG0A9EMqPRBBCBZN05JfVq3siJq7uub5qZs5kbCWM9qn/Y+QYw0NZnWlUXWfXxuS+KC9MOIO4kHeN/r1PoslKLKx/kL2TvX8lXrMCBGplBJKykHlVK+4Xar1UhqBbac8TCJfX+M2ELDwMoe/52IPIjCewA2egPsMuHOuYn1/afKuljHkD4b8bMbtl8prTjO/Nh++KfzPpaES0EYEG7rs81310P/kxkA0zUdX9z0x4OZejiirqF5ZoAN/YgdHFXcVcPgCRZVYLtiK9750HQvMj681/7j8FSiR6HOEs2wE02FY88tiuyyVBnFCaBwYrBv5LiNzeW8uU861LaI67jfSFmFCDb3yqo0Sgn2jHmSBAbNu3hVZsdi4gVII9PYK8ARpWxq0CnbvBztcWNtp3wPdcsau/6FL/soJOnwAl2Tq+X6g6Q6gAmYDOVNhiU3G1piPJ3Zx2asACEmLFBgkesYJzJ7XMwRobLev9pl2Bpbm8yM53SA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(53546011)(6506007)(41300700001)(7696005)(26005)(38100700002)(9686003)(38070700005)(55016003)(6916009)(33656002)(54906003)(316002)(66946007)(71200400001)(76116006)(66476007)(8676002)(64756008)(66556008)(66446008)(122000001)(86362001)(4326008)(107886003)(52536014)(5660300002)(83380400001)(2906002)(186003)(478600001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkJQdGVUNnd0UzhFcEV4NUFmUnFQVW80UlpNcWRFcDFneC9yNEgrTUtGeUlC?=
 =?utf-8?B?Z1p5NHVZT1RZdDVHcjhkVUZKaFBtV3dzUHYrajhoc1paNzF6ZnEwd1RLUUc5?=
 =?utf-8?B?ME9EZit5ejkySkhlL1p1d1BNZFNMdFUzcGhVdms5OVd4RFdOQVZlZm1MbTBj?=
 =?utf-8?B?cDV2WGpVUE9GVmUxbHNTRjI4VUdKOGQyOU9ENkNuSnJlb2t5T0V6bUtQakoz?=
 =?utf-8?B?bXJlOHczWUJmdDdGYURVc3NVUFZvRVEycCtSd2ZWbnowTCtxUnBHU1BKR1hu?=
 =?utf-8?B?eFNWZjJHOGlRaHQwWng4anplQTVPN1Y1NSsvaFJCUmVFM1gvaFduRytGUHRr?=
 =?utf-8?B?UVhVQS9oNVdXWU14Qm4rUEtrdlFmRk9ObzJxczg5Vk9nTkRQNVBDNFdXNEY2?=
 =?utf-8?B?eVFBZTdldFJ0V0JnVVpoalh6cWpKc3BrRlJvWUpmT2pFTE1Va2VFYWRkZnZs?=
 =?utf-8?B?TFhEYWZhNHNJVGlaa0wrQkVaaXN6Sy8zTjdNb05qMnQwbkt0eVZSNUNnNzNG?=
 =?utf-8?B?alFQVEM5dEVvdmU2UFhPUjNSN0kwQm82ZDIwcGpkekh4NGlkaU5hQW9ZWGRR?=
 =?utf-8?B?bnhXemkvNnc3ZXlJMXVKWGRoNjZxbm9lVG5MWmZ3MlpnSGlTaktjdUM4M2hP?=
 =?utf-8?B?TjFoZzRCeEVKeFVVajBjdy9uMTVYWnIrbVh4WnAvM095aWlvU0tkUXZrRmEy?=
 =?utf-8?B?Qzh3Mk5lVE5UUVFLK1RFcG1vR2ZINndFSnNsc01VMDQzdU1GTDJ5V0RuNmFW?=
 =?utf-8?B?V05kV1BTRWlJa0s3TXl6dmJRYm5DNnpPM1lHUk9yMlJXaThlaXhtdlVYcGMr?=
 =?utf-8?B?S01SL09yekJuclQwZWpSVXpjSXNQdUlUdnlSV2FTVzA1SkhFVjgyeUNURHQy?=
 =?utf-8?B?L3NCcmo3eVRuT0QySm9NcDJQa1UrQ1l5bWJjUkNUNkdDaDUrVEwwL1F6SDlG?=
 =?utf-8?B?T0dYa20vS2VyenZrM2FlTUZ1TFllMTZ0bExFdUFNOXpneC84cDBLYWM2ajdx?=
 =?utf-8?B?VzZ6R1N2dGhYa1lzaVAwL3V3RDhBNitPYWJGdTFJOGc2OGk1c2JnNlVTRmt1?=
 =?utf-8?B?eHpBK3gvcUpmc1QzMUJoaExMV2cvejZzeHZwZjlKaEtLYXp1MmpxckNaSXdB?=
 =?utf-8?B?RHZrRlRWbk5rVE1tK2NGWUlOYkR5N25mOERSWUdUNmJ6cndSSjlUemtJQVds?=
 =?utf-8?B?bmtydzFRZlhDdUFRT0lrd1k4dmRCM1I5b2QxUmpyWlp1dlBvanRLbTFJVW5q?=
 =?utf-8?B?a1BZZUVnRDZZZEkyWitvQnlndzdJdFMzbUFRcFF2RWRNSUVyTkZzb1VMay8x?=
 =?utf-8?B?VlYwM3JRb0NRRnNZZDVvRWJGYjZhYndJa1p6YVFvbG92bmhrcHZub01nUHJF?=
 =?utf-8?B?NlZpVXUyYWdwanBvNTFJbldrQ21wYlhvM2prWTFoOXl2M3pFbGM0bURNVUZB?=
 =?utf-8?B?Ujlyb1JscUNqQURLZmplVnNpOXdOYUlFNkFKMVhNS0FZd2lBU2F2Q0QrRHlu?=
 =?utf-8?B?QjJwZy9TQVJkYng5dG9zQUxVM0V6NitjaHVYTVBDVkpPN2NJajRDSGtFSjJp?=
 =?utf-8?B?VmwzTTdieWRYekY0MnVSRUdjSFpnWWs1aUNNTXg3NTMwSm1YSHlLU3FTVXhX?=
 =?utf-8?B?M2NPVHY5aFduQjgyQ2M5ckpVVXNaOTRNSjRJS2taQVJEQWxpWjdHbkxxUi92?=
 =?utf-8?B?SFlOZnpIR2Z5aUR5QVZvZmRoNW1ZNzFZT2F4VlJFeFR2OWVRNVNhT25DMFZp?=
 =?utf-8?B?QzVXai83cWM5d05OaHljd09OUDQ3VTBrdW1hRGEwb0RwT2lyNWJtdDMwNkZP?=
 =?utf-8?B?Z0dZa1Exbmx5ZmEzZmJnQUYzM1NyelozbDJ4T2kvMGE5VXNMbmJIQzdibk16?=
 =?utf-8?B?QTlVWFdTUzVoNzJjc0hFYUdpWTM0VmRGUy91WlQ3MWhLVTJwVHV1eENzbFF2?=
 =?utf-8?B?OVJPcjAvd3RwTXRWRU8rOGpPbzVjOTRKWVBieHp3Y1JIZ0hmM3VGaXdLUFk0?=
 =?utf-8?B?ZWxlSmlpcWtBbGZXWmx2QTIyRktDNGtnS0VrR2JvaUpiSnhqU0UwWjdUVkpn?=
 =?utf-8?B?N2VvRExMVXExYXhveks2Z3ZkeTBPd2RJelNyMnQ1N0NlZ0ZBbXFWWitSRHR6?=
 =?utf-8?B?K3ovZ0VIMWhKRUw5QW01dHpJbE9KTEJ4cmVIQ3k3SW8vR1pDSmNSNWt4ZC85?=
 =?utf-8?B?dFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8ce999-b676-4bee-6ce1-08dacdfdcb0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 09:25:14.2927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZDBV9eDgRKM7P2Bw86+hvDdyYuB5087h5GtNtoxyWH6v36oKd1afa6TIUIN8qoWmcizcfph3bkUU6NTNPAdApfTUlmKp9htyPf1hVFgbagE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9885
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS81XSBjbGs6IHJlbmVzYXM6IHI5YTA5ZzAxMTogQWRkIFBXTSBjbG9jayBlbnRyaWVz
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24g
RnJpLCBOb3YgMTgsIDIwMjIgYXQgMjoxNiBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoZSBQV00gSVAgb24gdGhlIFJaL1YyTSBjb21lcyB3
aXRoIDE2IGNoYW5uZWxzLCBidXQgdGhlIElTUCBoYXMgZnVsbA0KPiA+IGNvbnRyb2wgb2YgY2hh
bm5lbHMgMCB0byA3LCBhbmQgY2hhbm5lbCAxNSwgdGhlcmVmb3JlIExpbnV4IGlzIG9ubHkNCj4g
PiBhbGxvd2VkIHRvIHVzZSBjaGFubmVscyA4IHRvIDE0Lg0KPiA+DQo+ID4gVGhlIFBXTSBjaGFu
bmVsIDE1IHNoYXJlcyBhcGIgY2xvY2sgYW5kIHJlc2V0IHdpdGggUFdNezguLjE0fS4NCj4gPiBU
aGUgcmVzZXQgaXMgZGVhc3NlcnRlZCBieSB0aGUgYm9vdGxvYWRlci9JU1AuDQo+IA0KPiBTaG91
bGRuJ3QgeW91IGFkZCB0aGUgcmVzZXQgYW55d2F5LCBidXQgbWFrZSBzdXJlIGl0IHN0YXlzIGRl
YXNzZXJ0ZWQgYnkNCj4gaW5jcmVhc2luZyBpdHMgcmVmY291bnQsIGNmci4gY3JpdGljYWwgY2xv
Y2tzPw0KDQpJIGp1c3QgY29uZnVzZWQsIGRlYXNzZXJ0aW5nIHdpbGwgZ2l2ZSBzb21lIGdsaXRj
aCBvbiBJU1AsDQoNClRZUEUtQTogQSB0eXBlIHdoaWNoIGRvZXMgbm90IHJlcXVpcmUgY2xvY2sg
c3VwcGx5IGF0IHRoZSB0aW1lIG9mIGEgcmVzZXQuDQpUWVBFLUI6IEEgdHlwZSB3aGljaCByZXF1
aXJlcyBjbG9jayBzdXBwbHkgYXQgdGhlIHRpbWUgb2YgYSByZXNldC4NCg0KRmlndXJlIDQ4LjYt
MjcgVFlQRS1CIFJlc2V0IFRpbWluZyBieSB0aGUgQ1BHIFJlZ2lzdGVyDQpBbmQgRmlndXJlIDQ4
LjYtMjggVFlQRS1CIFJlc2V0IFRpbWluZyBieSB0aGUgUmVzZXQgU291cmNlDQoNCkJ1dCB0aGF0
IGRpYWdyYW0gZm9sbG93cyBhIHJlc2V0IGZvbGxvd2VkIGJ5IGRlYXNzZXJ0Lg0KDQpZZXMsIHlv
dSBhcmUgY29ycmVjdCBkZWFzc2VydCB3b24ndCBjcmVhdGUgYW55IGdsaXRjaGVzLiBCdXQgcmVz
ZXQgZm9sbG93ZWQgYnkNCmRlYXNzZXJ0IG1heSBjcmVhdGUgY2xvY2sgZ2xpdGNoLCB0aGlzIHdp
bGwgYmUgZG9uZSBieSBlaXRoZXIgSVNQIG9yIGJvb3Rsb2FkZXIuDQoNCkN1cnJlbnQgYXNzdW1w
dGlvbiBpcyBoYW5kbGluZyBvZiBzaGFyZWQgcmVzb3VyY2Ugd2lsbCBiZSBoYW5kbGVkIGJ5IGJv
b3Rsb2FkZXIgb3IgSVNQLg0KDQpMaW51eCBKdXN0IGluY3JlbWVudCB0aGUgcmVmY291bnQuDQoN
Ck9LLCBJIHdpbGwgc2VuZCBWMiB3aXRoIHRoaXMgY2hhbmdlLg0KDQpDaGVlcnMsDQpCaWp1DQoN
Cg0KPiANCj4gPiBBZGQgUFdNezguLjE0fSBjbG9ja3MgdG8gQ1BHIGRyaXZlciBhbmQgbWFyayBh
cGIgY2xvY2sgYXMgY3JpdGljYWwNCj4gPiBjbG9jaywgc28gdGhhdCB0aGUgYXBiIGNsb2NrIHdp
bGwgYmUgYWx3YXlzIG9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2Fz
L3I5YTA5ZzAxMS1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDlnMDEx
LWNwZy5jDQo+ID4gQEAgLTEzNiw2ICsxMzYsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByemcy
bF9tb2RfY2xrDQo+IHI5YTA5ZzAxMV9tb2RfY2xrc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+ICAg
ICAgICAgREVGX01PRCgiaWljX3BjbGsxIiwgICAgUjlBMDlHMDExX0lJQ19QQ0xLMSwgICAgIENM
S19TRUxfRSwNCj4gMHg0MjQsIDEyKSwNCj4gPiAgICAgICAgIERFRl9NT0QoIndkdDBfcGNsayIs
ICAgIFI5QTA5RzAxMV9XRFQwX1BDTEssICAgICBDTEtfU0VMX0UsDQo+IDB4NDI4LCAxMiksDQo+
ID4gICAgICAgICBERUZfTU9EKCJ3ZHQwX2NsayIsICAgICBSOUEwOUcwMTFfV0RUMF9DTEssICAg
ICAgQ0xLX01BSU4sDQo+IDB4NDI4LCAxMyksDQo+ID4gKyAgICAgICBERUZfTU9EKCJwd204XzE1
X3BjbGsiLCBSOUEwOUcwMTFfQ1BFUklfR1JQRl9QQ0xLLCBDTEtfU0VMX0UsDQo+ID4gKyAweDQz
NCwgMCksDQo+IA0KPiAiY3BlcmlfZ3JwZiI/DQo+IA0KPiA+ICsgICAgICAgREVGX01PRCgicHdt
OF9jbGsiLCAgICAgUjlBMDlHMDExX1BXTThfQ0xLLCAgICAgIENMS19NQUlOLA0KPiAweDQzNCwg
NCksDQo+ID4gKyAgICAgICBERUZfTU9EKCJwd205X2NsayIsICAgICBSOUEwOUcwMTFfUFdNOV9D
TEssICAgICAgQ0xLX01BSU4sDQo+IDB4NDM0LCA1KSwNCj4gPiArICAgICAgIERFRl9NT0QoInB3
bTEwX2NsayIsICAgIFI5QTA5RzAxMV9QV00xMF9DTEssICAgICBDTEtfTUFJTiwNCj4gMHg0MzQs
IDYpLA0KPiA+ICsgICAgICAgREVGX01PRCgicHdtMTFfY2xrIiwgICAgUjlBMDlHMDExX1BXTTEx
X0NMSywgICAgIENMS19NQUlOLA0KPiAweDQzNCwgNyksDQo+ID4gKyAgICAgICBERUZfTU9EKCJw
d20xMl9jbGsiLCAgICBSOUEwOUcwMTFfUFdNMTJfQ0xLLCAgICAgQ0xLX01BSU4sDQo+IDB4NDM0
LCA4KSwNCj4gPiArICAgICAgIERFRl9NT0QoInB3bTEzX2NsayIsICAgIFI5QTA5RzAxMV9QV00x
M19DTEssICAgICBDTEtfTUFJTiwNCj4gMHg0MzQsIDkpLA0KPiA+ICsgICAgICAgREVGX01PRCgi
cHdtMTRfY2xrIiwgICAgUjlBMDlHMDExX1BXTTE0X0NMSywgICAgIENMS19NQUlOLA0KPiAweDQz
NCwgMTApLA0KPiA+ICAgICAgICAgREVGX01PRCgidXJ0X3BjbGsiLCAgICAgUjlBMDlHMDExX1VS
VF9QQ0xLLCAgICAgIENMS19TRUxfRSwNCj4gMHg0MzgsIDQpLA0KPiA+ICAgICAgICAgREVGX01P
RCgidXJ0MF9jbGsiLCAgICAgUjlBMDlHMDExX1VSVDBfQ0xLLCAgICAgIENMS19TRUxfVzAsDQo+
IDB4NDM4LCA1KSwNCj4gPiAgICAgICAgIERFRl9NT0QoImNhNTMiLCAgICAgICAgIFI5QTA5RzAx
MV9DQTUzX0NMSywgICAgICBDTEtfRElWX0EsDQo+IDB4NDQ4LCAwKSwNCj4gDQo+IEdye29ldGpl
LGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0t
DQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4g
QnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
