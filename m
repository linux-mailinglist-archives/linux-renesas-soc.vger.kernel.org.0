Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482EA453702
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 17:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbhKPQNL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 11:13:11 -0500
Received: from mail-os0jpn01on2106.outbound.protection.outlook.com ([40.107.113.106]:59191
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238420AbhKPQMv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 11:12:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T48U3olr3rfiWHprh5AdEU1SVCheC4XDKKiUF/JcNT+w73ozjd8ZvYHhg48YawkYGZoRlweCGybu7SHd6zRCqKhiJvG4y9ocLc4+fok1XUhQPA/m29XThm0zFhf7eyoz7mKzGqn0kYGJ+XZUbjUWW4a1m+SaaA35ZGWVxJQsU2tAwoXvOWebeh1EY2o6BbTZ0urgv760GTMv6KTXXdtYSf8GygOPMFourXeCe5PqLMWkgO7lOUcUwAT/5uUS1yCJ9rj36rqjbnOn9CYRHHdcIa9DRPHcvkoMFDZ4jB3ou2eMKeSHRqRVjao8jsNYhvUkTGXJRv/YPHGNkGXTeKW2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgnSwCRiaSdhfl9W7vdY39uORTk5oVV5Tyy43AFIuYQ=;
 b=beLJgRJq8giVuT6Xumsj+3x+nuoRAdW4o73f1lsU17Q8Et3MuFf/DjrMExtze6+WPpndDvEA8cPMcd77DBxL4BpwZoXyXMX25ywB4u+Od6DMs3CSWX1unQW05eFGA8YicNg/ZsNm6Bhait4u4q72Eat5jWs+DEWlQomucR1yff7Uuipdp76EFXYvirtCye5/AIABpd693TeVr6bI6VE5UX2XziiD7xbbqL5aBeXt/ymPAWLcYUck3mX6NyQWtIbHs4ZeczPqGXLIVSwVBJpAySh1T5lgmGWdM41JrJ6HMwXzoD0q+oK1CfbXMpoeoBKkve2GbQria83pUXHtI7lr2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgnSwCRiaSdhfl9W7vdY39uORTk5oVV5Tyy43AFIuYQ=;
 b=M3di6dkkjY6P1jFLjWDKZXuerHih/P4zhAuS66cQ2q+x1QiAo/hTsML5cpuIHme2f3kajZ2LuWsv/bR+5BlV3/aETPz7Op3HIJeo1Vw15sQ51FHrAgF3NKu0LjJYR1HoMY1d1wqM8saBtxLNhDGLz9ISiw4swNGbBf2rjmENxo8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4182.jpnprd01.prod.outlook.com (2603:1096:604:4c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Tue, 16 Nov
 2021 16:09:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 16:09:45 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
Thread-Index: AQHX2jrE4eSX7ohpXUa1PkZIvz7h+6wEx4EwgAAw7wCAAA+tYIAA7DUAgAABScCAADAKAIAALcyw
Date:   Tue, 16 Nov 2021 16:09:45 +0000
Message-ID: <OS0PR01MB59220069B3113A206F31305286999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZKz/ptgPfzqGfeq@kunai>
 <OS0PR01MB592241C04F5CDDB94D850FFA86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUm2EG3Yi+eTZA0E9tZOT71ewkbx=yh8sVOnL207Od3Rw@mail.gmail.com>
 <OS0PR01MB5922A978B55C09B9E754DBD486999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWVB_7U0R5hkO7eEkzdkmhwCEFstskvXJgO-dU1hog=+A@mail.gmail.com>
In-Reply-To: <CAMuHMdWVB_7U0R5hkO7eEkzdkmhwCEFstskvXJgO-dU1hog=+A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e9860ba-30c5-407f-2e4d-08d9a91b8198
x-ms-traffictypediagnostic: OSBPR01MB4182:
x-microsoft-antispam-prvs: <OSBPR01MB41828930C24223D6A389AA4586999@OSBPR01MB4182.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hruiN0WZFKCDWjgN8tFVKPokYB+F77M7Uc/ZkMUN61jxdzgeG90b5s0Hne7luuYps9HvYUdTdPadUrQjsX5/BMu/4MoRPRtpfsWCChMMbeelFGsklTdAeC1/hBFln9iXzwrBFzpHStOgvD427i6XKDNLyWaJpfzBNXTzwRwocJrGbT2mvcTjVZEMrqRP0kwjc36f98P4Fbw0n5BwK+aO4HMkRQ8A5iYKLvzLaEiiKjDEjZkVzn7qswUZ0u8VS71Fb/2d0T6/ExX3DJUxQKozMGyH26zBiyu2aBw0Htwe6egsEb1vaCTqv7mm8D1xTX2MNqfGCNREn00P5GSkEy55dDuiFUy+UbNigV1B7LLYsCPqcaOFUluKP60mh/z5hRiNomAD0wK6Z6NfdLUIjAv99e1/trJ6t9r1bJGooIql46erokApxLMw4iL4NFL0VO8pdGGJ9r719b21iFrmFIBhJIENe+lm0v7LiBFUoskjiF2JEjtixtEqVvBQqecdHrvfDblz0ImSo65GlUdMqheJBaU0fnqfgTbbX4X0+M9jAF12DhdVDykRuoAagbvgx+dnK6ilZf+Ana4wwM/yhooDzXpmdXoDWyfHqLBhk/4Ni/QX3HOPZnSOMPW91xbKPb1JRyQN2V92iHo2az2AXhFtuWVK/CiIljvEBcyMQZ0vQ3oXFLT7xmp5IYgtxxNg1JZ2WJJ6CaY218mbIU7jvvyqwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(64756008)(6506007)(52536014)(8936002)(76116006)(66476007)(66446008)(5660300002)(53546011)(26005)(7696005)(71200400001)(8676002)(186003)(66556008)(38100700002)(38070700005)(122000001)(4326008)(508600001)(33656002)(83380400001)(6916009)(55016002)(2906002)(54906003)(316002)(9686003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1pYUU9mY0JSMHprUkZXbkpYT0xtSkRkSmZhdEJqUzN5ZG9CV2UvdnZEbWhB?=
 =?utf-8?B?cm5zQ0JMemw5cHpuOGlzMjMrZ0I5bUtBWXdVSEg4d2kwbTBLRjlKMnhLNFdk?=
 =?utf-8?B?Z1EwQTZkQ3NvYjdyMGx0NGdudlA2ZmRDQytYeS9YajRpSklweXMwbTJHR0VL?=
 =?utf-8?B?REoxYi9RZHVvV1IzYWV4bDNaUE1jaDIwa2FXTm1CTzFHaWJQaVlzK3pmRDU5?=
 =?utf-8?B?L0tqNm84Y0pWN2pLR2VjLzRaR3k2THh5ZG1BV2QwdFdkaXY0N1pYYURReEM1?=
 =?utf-8?B?OGU3YlBMVTNpczRKVC9sZUpqajdDQ0ZIMjAwY1c3SUtjUm5JdjVtUS9PWnl5?=
 =?utf-8?B?emNMWEF1MURyNDlKMmNUajB0UG4wS3E0bEtQbm5nRnJ5VnZldjZBTzBuSGlT?=
 =?utf-8?B?UW1lNXRubDIzeGhINkpONFVTQlRIdDBoQTRPRkJDQ2o4Ync5cTJnVlF1ZUxK?=
 =?utf-8?B?RnRJeHlJS3JnZkNJZmdUMkE0VjZxeHl4NHRhSWFFU1RFajFETmJQQXlOMVJa?=
 =?utf-8?B?ank4QWFvU2xXYXNaNjM0Ym1SajY0Mk9LYXRnN2RNTlZiSU5UUzQyYytqdWxW?=
 =?utf-8?B?VnVFTVN6K3Vrb1g3dzVDTW51MUE5b2VmaDRVcHkrMmRJQnI1dVV4dlRpanA3?=
 =?utf-8?B?WkR0aklsTFprcGNCSEY3NW9CWjU5SU11YUxZNkpraXh4WXNLL0JFeW53OTBu?=
 =?utf-8?B?UmozSjd0UXJzOTZqVkdOaERqTzJxeEIrZVNPYXFUUDB2MW50T2FZY2FHNzk2?=
 =?utf-8?B?WHpzMnQwVmxhbFk2b1RlOWZYS09CZjZBbWxuVUQ0WmJ6UGx4MVp3YzFSK0hL?=
 =?utf-8?B?em02cGQyUE5BTUhSampCd05zZFhxNzRNM0lnWmZGQmMvVHp1K3MrR3lOYXZw?=
 =?utf-8?B?OUdYRWdoWGlORnp4dmJMUHNaTXptOEtSTEQ1U0o1eDUrT1lYNnAxZGd1bCth?=
 =?utf-8?B?R3hsdytIWTNhYmJzZ2hOalRSN3N0R29acGhVQ0NGcFRQWFRhdndWUldSVEVY?=
 =?utf-8?B?L0tMLytSYkNXOWtYOUtVN0cxNFlETk0yRGwzR214aldwblhTWGorSkVFTDkw?=
 =?utf-8?B?VmhmUUtYOWozSENTZVhBcmlPQkViUUVSbFBTQlJrZ2Y4UE1GdTJDRW1LUWRv?=
 =?utf-8?B?bzN1cTF3eVhLbzdycXR6NnJoSWNSR3kxcFV4b3R5c2owWEFVdmFSRytiYnpM?=
 =?utf-8?B?QkxsNi94NklOWmhDWlJySktyeE9DU3F4ekY1Sjl1Z3FtenhxaEErTlFxODJ3?=
 =?utf-8?B?MjhhL3ZNSXB6cHB0eTNkbVZUYVJCUkUyeWdoSERTL1dVcURydEIyWmJGbmtk?=
 =?utf-8?B?N1BUaFpJQ3FwSUxiOGlMTnZCVk5aUUhEU2s2Vk9iV1lsUEhkQXQ1bEpwdkJZ?=
 =?utf-8?B?am53MEVKalV5V21qZUdpd2RtQmMvNmpCQ3ZybmR4a3krYXEzVDNpNHA1ZmM3?=
 =?utf-8?B?bEtJWndYcE9FbzlHbmt1Tzg0Q3BES0E0NUMrdy9OWVBRUDJwQVVjT3dVZmJr?=
 =?utf-8?B?OVVLNUVqWE9OVHpBQzJQNUNSWStibnp0QzFPdWtvV0tNdlRXWlVaUEtqbE9H?=
 =?utf-8?B?UFJFMXMrMTNKMm5BRVhRTkNLQVJHU0xlcjFIWk1yc2lONFZyU3VnRFRNT3J3?=
 =?utf-8?B?MGRYWDdSd3I5MTNoa3plbngzWnRNY2RnVlpRRmxsejd1K1RQWk14bVFQc2dX?=
 =?utf-8?B?MTBnSHBEWHpackxUSmpIWlI3a1o5aDJsckgvWHQvVDZYaVNJTTNNeUpVRzNj?=
 =?utf-8?B?NEJZSFBpa3h4N1hmM0x3SVVycjZqUW10dXZLcGw2YmVBNHZNQjBKdk9GSHk1?=
 =?utf-8?B?UHppN1l1WW9CQ3hackZPRkNyRTVBNEw0dFl1eG5PdVZ4cXZrb1M3eWpFenlH?=
 =?utf-8?B?UXlJcUNqMEdhRDFKVVBuci9HY3BMSkYzVitxN0ZlcEhNV2g4SXZBT1dna2ZM?=
 =?utf-8?B?dHRUaFBJa2M1YnA2YndWWWVXS1ZEV0liUFppUE1XWlkrd3VzdDkzWm9LN3No?=
 =?utf-8?B?VXpDdVFOSjMva1NLTDVJaWFrMmJFOWd0L1U1S1RZUE9kYlltb25nbEd1L2ZC?=
 =?utf-8?B?bnVyZHR1Mi9pZWkraVlzc2ZJUm9vWTM1TWFGVHgvSXVUUlpyWkVSR05XbVVQ?=
 =?utf-8?B?dUZuMjlDS2RQRXY1OVdqUWg4SEtTQStvSzlzcXVqQVgrWldid01ld203WlNm?=
 =?utf-8?B?NWoyT2FxaVdBRkNnSHdYYTNaVmxQWWh4ODB0MmYvNStuWGUyVXRNbXdIa0V2?=
 =?utf-8?B?bjQ4eFkvTXhEcGIrMURmRzRKeXZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9860ba-30c5-407f-2e4d-08d9a91b8198
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 16:09:45.1060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3sR9dvtS4GiMiFAtO6fvQTZwNrFTLHJyrRf0tgjWlxdA/uB7eCol+Xe2UponSmqVckVHy4h299b1J4UK7j/qN1IQUEqrH2mvABxsvJUc8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4182
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjNdIGR0LWJpbmRpbmdzOiBtbWM6IHJlbmVzYXMsc2RoaTogYWRkIG9wdGlvbmFsIFNE
bkgNCj4gY2xvY2sNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIE5vdiAxNiwgMjAyMSBh
dCAxMjoyNiBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3Rl
Og0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10gZHQtYmluZGluZ3M6IG1tYzogcmVuZXNh
cyxzZGhpOiBhZGQgb3B0aW9uYWwNCj4gPiA+IFNEbkggY2xvY2sgT24gTW9uLCBOb3YgMTUsIDIw
MjEgYXQgOTozMiBQTSBCaWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10gZHQtYmlu
ZGluZ3M6IG1tYzogcmVuZXNhcyxzZGhpOiBhZGQNCj4gPiA+ID4gPiBvcHRpb25hbCBTRG5IIGNs
b2NrDQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiArICAgICAgaWY6DQo+ID4g
PiA+ID4gPiA+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAg
Y29tcGF0aWJsZToNCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ID4g
PiA+ID4gPiArICAgICAgICAgICAgICBlbnVtOg0KPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgIC0gcmVuZXNhcyxyY2FyLWdlbjItc2RoaQ0KPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgIC0gcmVuZXNhcyxyY2FyLWdlbjMtc2RoaQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFdo
YXQgYWJvdXQgUlovRzJMLCBhcyBpdCBoYXMgNCBjbG9ja3M/DQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBUaGV5IGFyZSBhIGZldyBsaW5lcyBhYm92ZSB0aGlzIGluIGEgc2VwZXJhdGUgYmxvY2sgaWYg
SSBhbSBub3QNCj4gPiA+ID4gPiBjb25mdXNpbmcgdGhlIFNvQyBudW1iZXJpbmcuDQo+ID4gPiA+
DQo+ID4gPiA+IEFoIG9rLCBJIHRob3VnaHQsIHNpbmNlIFJaL0cyTCB1c2luZyBnZW5lcmljIHJj
YXItZ2VuMy1zZGhpDQo+ID4gPiA+IGNvbXBhdGlibGUsIFdlIG5lZWQgdG8gbW92ZSB0aGF0IFNl
cGFyYXRlIGJsb2NrIGluc2lkZSB0aGlzIGlmDQo+IGJsb2NrLg0KPiA+ID4gPiBXaXRoIGluIGdl
bjMgY29tcGF0aWJsZSwgaWYgUlpHMkwgdGhlbiBNYXggNCBjbG9ja3MgZWxzZSBNYXggMw0KPiA+
ID4gPiBDbG9ja3MuIEkNCj4gPiA+IG1heSBiZSBjb21wbGV0ZWx5IHdyb25nLg0KPiA+ID4NCj4g
PiA+IEJ1dCBpcyBpdCB3b3JraW5nPw0KPiA+ID4gV2l0aCB0aGlzIHNlcmllcywgdGhlIGRyaXZl
ciBsb29rcyBmb3IgdGhlICJzZGgiIGNsb2NrLCB3aGlsZSBpdCBpcw0KPiA+ID4gY2FsbGVkICJj
bGtfaHMiIG9uIFJaL0cyTC4NCj4gPiA+DQo+ID4gPiBBcyB0aGUgUlovRzJMIHBhcnQgZGVjbGFy
ZXMgY29tcGF0aWJpbGl0eSB3aXRoIHRoZSBnZW5lcmljDQo+ID4gPiByY2FyLWdlbjMtc2RoaSBj
b21wYXRpYmxlLCBpdCBpcyBzdWJqZWN0IHRvDQo+IFNESElfRkxBR19ORUVEX0NMS0hfRkFMTEJB
Q0suDQo+ID4gPiBJbiB0aGUgYWJzZW5jZSBvZiBhbiAic2RoIiBjbG9jaywgdGhlIGRyaXZlciB3
aWxsIHVzZQ0KPiA+ID4gY2xrX2dldF9wYXJlbnQoY2xrX2dldF9wYXJlbnQocHJpdi0+Y2xrKSBp
bnN0ZWFkLg0KPiA+ID4gT24gUlovRzJMLCB3ZSBoYXZlOg0KPiA+ID4gICBTRDAgLT4gU0QwX0RJ
VjQgLT4gaW1jbGsNCj4gPiA+ICAgICAgIC0+IGNsa19ocw0KPiA+ID4gU28gdGhhdCB3aWxsIHBp
Y2sgdXAgU0QwLCB3aGljaCBtaWdodCBiZSBjb3JyZWN0LCBhY2NpZGVudGFsbHkgOy0pDQo+ID4g
PiBBcyBxdWlya3MgaXMgbm90IHNldCwgaXQgd2lsbCB1c2UgY2xraF9zaGlmdCA9IDIuDQo+ID4g
Pg0KPiA+ID4gU28gYWxsIGlzIGdvb2Q/IEkgdGhpbmsgd2Ugc3RpbGwgd2FudCB0aGUgZHJpdmVy
IHRvIGNoZWNrIGZvcg0KPiA+ID4gImNsa19ocyIsIHRvbywgdG8gYXZvaWQgaGF2aW5nIHRvIGRl
cGVuZCBvbiB0aGUgZmFsbGJhY2suDQo+ID4NCj4gPiBJIGhhdmUgYWRkZWQgYmVsb3cgcGllY2Ug
b2YgY29kZSBhbmQgdGVzdGVkIGNsa19ocy4gSXQgd29ya3Mgb2suDQo+ID4NCj4gPiBDYW4gd2Ug
Y2hhbmdlIHRoZSBiaW5kaW5nIHRvIHVwZGF0ZSB0byB1c2UgImNsa2giIGluc3RlYWQgb2YgImNs
a19ocyINCj4gPiBmb3IgUlovRzJMPywgc28gdGhhdCB3ZSBkb24ndCBuZWVkIGJlbG93IGNvZGUg
Y2hhbmdlIGluIGRyaXZlci4gQW55IHdheQ0KPiBpdCBpcyBvcHRpb25hbC4NCj4gDQo+IEZpbmUg
Zm9yIG1lLg0KPiBTaG91bGQgd2UgYWxzbyByZW5hbWUgaW1jbGsyIHRvIGNkPw0KDQpZZXMsIHdl
IGNhbiByZW5hbWUgaW1jbGsyIHRvIGNkLg0KDQpSZWdhcmRzLA0KQmlqdQ0KDQo+IA0KPiBOb3Rl
IHRoYXQgb24gUlovRzJMLCBpdCB3aWxsIGJlIGhhbmRsZWQgYnkgUnVudGltZSBQTSByZWdhcmRs
ZXNzLg0KPiA+ICsNCj4gPiArICAgICAgIGlmKCFwcml2LT5jbGtoKSB7DQo+ID4gKyAgICAgICAg
ICAgICAgIHByaXYtPmNsa2ggPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoJnBkZXYtPmRldiwNCj4g
ImNsa19ocyIpOw0KPiA+ICsgICAgICAgICAgICAgICBpZiAoSVNfRVJSKHByaXYtPmNsa2gpKQ0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5k
ZXYsDQo+ID4gKyBQVFJfRVJSKHByaXYtPmNsa2gpLCAiY2Fubm90IGdldCBjbGtfaHMiKTsNCj4g
DQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2Vl
cnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
