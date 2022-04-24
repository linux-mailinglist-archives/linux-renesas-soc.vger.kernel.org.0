Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD6350D11B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Apr 2022 12:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbiDXKZP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 06:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234735AbiDXKZO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 06:25:14 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A7E5E74A;
        Sun, 24 Apr 2022 03:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqGHDwpfB6BqbY7I1OSnXjWSpBbdQJrfZYuPDz1s8MFEvTVXV77Tyy3CMCsjroMr36TXxiOw0kpUIX5NNRCUzmrEefWvu2XO0Kt77VUOXJGxHIr1ZrR81vAW/mfSEX21i+Onf9KMBxcVmADcYx1gFRktcs0/ydDx3FRBOQum0nJDl1Syrmni8ZNFow9uNgBvFHQvFc//ZQKRovMhM4qvDby5AJgQgbzv6Rcg+m6EU4ItV3CKkhWGMXAke7CbnfvGbGNg7EWkJ8YVKKcOiRlLJrtjz3wVS9Ak5vblOcKGywTnWyC+cuxBh28kjvSiC+PZ5Qw8bzUFVcgVm9peshJdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/FUxuU/Wu85W8sWhUnL6rzpenbhU4lP+JtwC8v5qsI=;
 b=TZBCu6+Uw6A0VqnYSBamNO2JDP5Yfxqlo3iQ2nxnyzwXlxc8s2fTSB0Ow4P8i6bW0d1F+dpz/PP3mZWKc8gGBVTotUzAkLyMwOFT18SR1V7iXwo4CY27lxt9cGWFcuBkIOZNXU+B02FdYvo0rKsi7NXeyrYA0WiRze2T1wy5fF1z0IwUre0DTb5gO3+GnqYmsLyDtguG7cbQ8xtsvXd/jHwchths2inJiboKLXZcaiL6uVVRNVRysL3HGKDvYI76qIBQSfV61TVTS2mHlsb8o2knJnNmSCHKqD5oU0XJ70XWZFKgZn8r4mhoMwjVIjYZYCmiAJGpNtF0yTrQvwdEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/FUxuU/Wu85W8sWhUnL6rzpenbhU4lP+JtwC8v5qsI=;
 b=QBwR87Hgyv+XlmZsTukxvTJ2qvLa6Q1NGisOwjh+3mKHm73u7TvLU8zqlXqIpQKB1yQG/YaVcouuMm49vYvCNM2S1ZjzDOFaUlDDqGxhzmdBhCS6fz/BcaNutn5alo4REA4zVIUBlxBAiN2ZjaDv9qC9uDjVQiwB7x0xwmKwPTs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB5175.jpnprd01.prod.outlook.com (2603:1096:604:77::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Sun, 24 Apr
 2022 10:22:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 10:22:09 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external clk node
 names
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external clk
 node names
Thread-Index: AQHYVxtpZzDNpS2cMUqYhuvLl0rlk6z94/kAgAC6McCAABNF8IAAJb8AgAACQVA=
Date:   Sun, 24 Apr 2022 10:22:09 +0000
Message-ID: <OS0PR01MB5922619EE8816DA1676BAB4D86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423140658.145000-1-biju.das.jz@bp.renesas.com>
 <f9c6e5e2-c819-d309-0c11-b87deb772858@linaro.org>
 <OS0PR01MB5922CFACC8FEC6D67E6BFC4986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220968EBDF76A16F7E63A386F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <7bd2ae6d-c55f-4ab7-0c98-72da0d5d4050@linaro.org>
In-Reply-To: <7bd2ae6d-c55f-4ab7-0c98-72da0d5d4050@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c36167d-4046-4c9a-a653-08da25dc4a66
x-ms-traffictypediagnostic: OSBPR01MB5175:EE_
x-microsoft-antispam-prvs: <OSBPR01MB51755E3136262D89661E57BF86F99@OSBPR01MB5175.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0snJ7rxHZ3J0o/W9/kbj3IQONz2q+GZ4xqIKs0qjtpt40xu3sEvr8o8CzgjJrYbQG/moshDz36Ds79XpR27m4z/KD9vhhLgYT3TMuKRj1IldZDCAhTV12Zlz3PS2iN4ua/Kwz3xa5D6vfv7IVQNrRiONLvbGM0zACFb26g7aGShfe486yIuFUOU6uEldUETjlD7U+hWOQF4N16j+u/t9C6IrH17VWqdNFfkhridBU3us17gqJuJThWqhEq2o4iM2jby+TtbgNaFpX7NqRmLsHx2GdyHCLnxREHYEFJDJPs+fczJa3M/G2hTOmr3YD1Mgy8Iyw6w4OFXteFwynRcMQyABVuatn9YOs1HtL3hBiLkPo9dS5XwbbxJ9RILZ6+Ap8N2RvgRDcskPdtNwqMgPsF0wHl+R7vxIoFyBm7+D79+up6erL+G2p3mxBmxdL/zuoOcbFIYNLULE9mCAm9PPFCYjQCBMQUHz5gDT4WuQ78WCokA+JgBiY3Vpz5IUv1OhHNVzNm9PUOYuw3mqtc7Fh8pakQuSM8ShneMc5wRKHhsZGq6WitOHV6PfqPgGbYUIx5sf6WykeK/o0DG9o1OPK22q9NogrX8K36Q7V4zVGNdr9MDb8uFHCleZeBMdTaGm7GseyHl1wiPEgA03Ml8VB6E2LeTDFmdnUtlZdIxoiI69A1eIjOBCWGJcwBvZx4jkhoo/1xI/pcI/eehLD3nNUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(2906002)(52536014)(8936002)(38070700005)(5660300002)(83380400001)(107886003)(38100700002)(316002)(33656002)(4326008)(66476007)(66556008)(66946007)(66446008)(71200400001)(55016003)(64756008)(76116006)(8676002)(54906003)(186003)(110136005)(53546011)(508600001)(26005)(86362001)(7696005)(9686003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGdNTDY1RElkaGNiSWcwSVRjQXRDclJJTG43RXMvZ0NuVTNUNGFoMmRGb3FC?=
 =?utf-8?B?UnNqSnRBaFNiQWRhbGJlZGpVem02ZDFBN3RQT2ZDUm5yTTI3VjZCeVJtMTBD?=
 =?utf-8?B?T3hQWENxK1hTVHJNSmZiMVNhZUJHQUVwYkNnazVPWEg0YU9oSDhsMzExNXNH?=
 =?utf-8?B?MTJVbzZHUlFoMTNSb1J6akM4akJjUjhyVHg5K3FoMnFhc3JlT2VnV3VDSkpW?=
 =?utf-8?B?amNrZWZLRDUzai9OSVZpNmJkb0NSWWpERTlTV0FWMldmVlUvMEx3MmExNE1V?=
 =?utf-8?B?V3ZqRHFhVmxOUElrZE80NHl5aTlOTFQxUGo1Mm0za29WeFY2T3l1L0oxZlYv?=
 =?utf-8?B?NW1jdEU4YVRqcGk3WThTM29HQml3WThrbTk3TCs0UUQxVmkvV1ErRUFveVZq?=
 =?utf-8?B?RVZsZ1gyTVYwRFlxSk9xU2pNRTBGbmxLWkdUV0trYTBBT09jWGlXQmptZFdu?=
 =?utf-8?B?T2g4dUg0MWVRLzlUMGpRcml4aDdJSHpRL2h4MkpIeXJOb3I3aXRwcmowZjlI?=
 =?utf-8?B?cERlNTI3S0V1ZEtGT3lQdUwxcDU1Zi9Uc1hzcFF3U085NGFDcmNuUEtyN1ht?=
 =?utf-8?B?akVXaGMzNDdjbG8veFFCbzRpamxCQ3R1dTNPaUJscXhacEdmSzN5Q2tqcmJX?=
 =?utf-8?B?aCtHYURHdFRYencxajNtZ1BYUlBRSTlEcHE1b21VODBMZ0ZXSXlxZ2tCZjJ1?=
 =?utf-8?B?UzdnQ2M4c3BOanVrNkVudkZqNE1DUU45emQ1RUp2N0U2dDY1bkt3eG1zQ3ZO?=
 =?utf-8?B?d0xxa0R5eU1uWW1sYXZoaXd4MzZoeW9BLytnNFdOd3UyTHVZaElvTVE1Z0lp?=
 =?utf-8?B?cUdCUGtnOHdvV3h0MUg3V0lRUDZXSnJ5OS9UbWI5NllGN0hYWDE0MGRjZzc0?=
 =?utf-8?B?Rk9wdHYxdVhPcDZzNHQ5YWV1Y3g4WFZFSFNWNWdQdmRheEpXWUxjYmh4czFN?=
 =?utf-8?B?ZThiVDI4RlplTDFJd2U0ODBpVkNxdEhBdjNNK3pnRTd5TDNlOUtnY3M2UzI5?=
 =?utf-8?B?eUwyQWJTZWtDQ0t0SkRmVitZMmgwSklPWW51U0w0Z21xcGlOUEduY0FHcU9y?=
 =?utf-8?B?eWt0M3BIbWQrSHcyWVpkK00reFRkZGF0d1djWEYySWZtaFlpK2NDSTFudFNO?=
 =?utf-8?B?ckQ2eEVya1dsSlU2R1hlbE5tUEl0RERBQmdMR2h2NXNYbUJRVVJVY1pzOVV4?=
 =?utf-8?B?Vmx4TzYwOHVSUThmZXEvZFM2QVdHZDRmVGh1V21GVDRpM0ttSVFGd2oxRHEr?=
 =?utf-8?B?Zys4MDJZVlVGSm5tVm1JSEdNbUx1RlZ0K2JBSTMwRTZ4bllvUTlDcnlYaXlX?=
 =?utf-8?B?TGVYTHd6YU5EeU5sUllYeUVCTkpUL01nejkrL3pNVVRaNHZPNTloVllCMTNX?=
 =?utf-8?B?cTBnSW1MbWl0Z3dUMEtwa0kyNmx4Q084SDkzbmx0STJObnoyNkJFMFpuTFdH?=
 =?utf-8?B?VzQ2a3N1TWRWaTVqZFRQYXRKSXh2V09Ta2N5RHdoYU9XdmU0Sk1Wbmw0MjAz?=
 =?utf-8?B?MFFsL3FHSHRjTnVoaDA0TGJFVnNlUVFlcE9aSFFjQjlsaXlRZmhUOVZyRXNP?=
 =?utf-8?B?YWxXWWhaRWx5VmNNL29ZTm5XQSs5RXVKWmROb1BzN1A2cEgrTnZDeTYrU2dS?=
 =?utf-8?B?bDgrUE1UVGVsaWJaQkk2dEJwN05UK0hKbmtuZ1pwTEdSN1lXSjljcTJUdUZr?=
 =?utf-8?B?bWt6L0lHVXpxYXpvYjFDVXROZ3JrNW1jN3U5SHgxSldCNHVPbklhTTRXK0FW?=
 =?utf-8?B?bHJqZ2JnM0w0TDNWbDNtWDk1enc2akpFVE5pTlVhd2VkeHhpMExoNVUvOUlS?=
 =?utf-8?B?RjF4ZFRadWM4VFZUUFZDdGJ2c1FKRUQzZFFycVM4c0d4VjBGcVYvenpWM1lP?=
 =?utf-8?B?eDBOMkcvVUl4bTN5NmNsdXd1cVF1dW5XaWc5NHJqZE1HcWpSdVhiL1Z4Nk0z?=
 =?utf-8?B?MW0rL0FhTnlwVHQvWFYvQ1Z4UFRJcE5KWElmR3BUZjVTNnFabmttOWFncjZV?=
 =?utf-8?B?OWZNdFpBRCtqbzBudFFZcTQ1cUd2UEttZC84blJLRGlGcjg0MS8xV3lZU0JQ?=
 =?utf-8?B?OHNGWU9oOUc5OE1zSUwza25ySUM2MlJ3VHFrMzlXWVZLQ0xMQVh4eXd2WkhG?=
 =?utf-8?B?em1XeUxGVUlmeEdUNjJwSEJlY3I0TUQ4RHJJRUQwKzcvOWdZYjd5WFlCVVhL?=
 =?utf-8?B?bEV4R1dsenJqWi9lQXlXSlpiQ1I4aWl4akozSDdCbDk5TVgyeHdqcEtWN050?=
 =?utf-8?B?TVZDMXlGRi9WWURkMEovUXQwVituekxjWGQyRjBjYVRMZytKRXRLU0VyQlVC?=
 =?utf-8?B?T0U2aEVQM3hrWlcrcEVGeXh3VGZuWnpoek14dml5Sm1mVEpZaHRES04vaGtL?=
 =?utf-8?Q?6kFUOj2ANExoRdJI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c36167d-4046-4c9a-a653-08da25dc4a66
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2022 10:22:09.7308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9WTgtmaCIahbPtjELOpMnYZCAwW58LqKlIMUe1R5CwWOtmY2f8OYl/pZIGz40emvo4F7G7vnHc/Ez2WADeu7lEoO8fPEUBIG95ylIutuWC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5175
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0NDog
Rml4IGV4dGVybmFsIGNsaw0KPiBub2RlIG5hbWVzDQo+IA0KPiBPbiAyNC8wNC8yMDIyIDA5OjUw
LCBCaWp1IERhcyB3cm90ZToNCj4gPj4gU3ViamVjdDogUkU6IFtQQVRDSCAxLzJdIGFybTY0OiBk
dHM6IHJlbmVzYXM6IHI5YTA3ZzA0NDogRml4IGV4dGVybmFsDQo+ID4+IGNsayBub2RlIG5hbWVz
DQo+ID4+DQo+ID4+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+ID4+DQo+ID4+IFRoYW5rcyBm
b3IgdGhlIGZlZWRiYWNrLg0KPiA+Pg0KPiA+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGFy
bTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0NDogRml4DQo+ID4+PiBleHRlcm5hbCBjbGsgbm9k
ZSBuYW1lcw0KPiA+Pj4NCj4gPj4+IE9uIDIzLzA0LzIwMjIgMTY6MDYsIEJpanUgRGFzIHdyb3Rl
Og0KPiA+Pj4+IEZpeCBhdWRpbyBjbGsgbm9kZSBuYW1lcyB3aXRoICJfIiAtPiAiLSIgYW5kIGFk
ZCBzdWZmaXggJy1jbGsnIGZvcg0KPiA+Pj4+IGNhbiBhbmQgZXh0YWwgY2xrcy4NCj4gPj4+Pg0K
PiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPj4+PiAtLS0NCj4gPj4+PiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3
ZzA0NC5kdHNpIHwgOCArKysrLS0tLQ0KPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDQuZHRzaQ0KPiA+Pj4+IGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpDQo+ID4+Pj4gaW5kZXggMTkyODdjY2Ni
MWYwLi40ZjlhODRkN2FmMDggMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpDQo+ID4+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpDQo+ID4+Pj4gQEAgLTEzLDE0ICsxMywxNCBAQCAvIHsN
Cj4gPj4+PiAgCSNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiA+Pj4+ICAJI3NpemUtY2VsbHMgPSA8
Mj47DQo+ID4+Pj4NCj4gPj4+PiAtCWF1ZGlvX2NsazE6IGF1ZGlvX2NsazEgew0KPiA+Pj4+ICsJ
YXVkaW9fY2xrMTogYXVkaW8tY2xrMSB7DQo+ID4+Pg0KPiA+Pj4gSG93IGFib3V0IGluIHN1Y2gg
Y2FzZSBrZWVwaW5nIHN1ZmZpeCAiY2xrIiBldmVyeXdoZXJlIGFuZCBtb3ZpbmcNCj4gPj4+IHRo
ZSBpbmRleA0KPiA+Pj4gKDEvMikgdG8gdGhlIGZpcnN0IHBhcnQ/IFRoaXMgd2F5IG9uZSBkYXkg
bWF5YmUgc2NoZW1hIHdpbGwgbWF0Y2gNCj4gPj4+IHRoZSBjbG9ja3MuDQo+ID4+DQo+ID4+IEp1
c3QgYSBxdWVzdGlvbiwNCj4gPj4NCj4gPj4gWW91ciBzdWdnZXN0aW9uIGlzICJhdWRpb19jbGsx
OiBhdWRpby1jbGsxIiAtPiAiYXVkaW9fY2xrMTogYXVkaW8tY2xrIg0KPiA+Pg0KPiA+PiBJbiB0
aGF0IGNhc2UsIElmIHlvdSBwbGFuIHRvIGRyb3AgdGhlIGxhYmVsIGluIGZ1dHVyZSwgaG93IHdp
bGwgeW91DQo+ID4+IGRpZmZlcmVudGlhdGUgYmV0d2Vlbg0KPiA+PiBhdWRpby1jbGsxIGFuZCBh
dWRpby1jbGsyIHdpdGgganVzdCBub2RlIG5hbWVzPw0KPiA+DQo+ID4gT3INCj4gPg0KPiA+IERv
IHlvdSB3YW50IG1lIHRvIGRvIHRoZSBjaGFuZ2UgbGlrZSB0aGlzPw0KPiA+DQo+ID4gImF1ZGlv
X2NsazE6IGF1ZGlvLWNsazEiIC0+ICJhdWRpb19jbGtfMTogYXVkaW8tY2xrLTEiDQo+ID4NCj4g
PiBBbmQgZml4IHRoZSBwaGFuZGxlIHJlZmVyZW5jZSBpbiBvdGhlciBkdHNpIGZpbGVzPz8NCj4g
DQo+IE15IHN1Z2dlc3Rpb24gd2FzIHRvIG1vdmUgdGhlIFsxMl0gcGFydCBpbnRvIHRoZSBmaXJz
dCBwYXJ0LCBzbyB0aGUgc3VmZml4DQo+ICJjbGsiIHN0YXlzIGNvbnNpc3RlbnQ6DQo+IGF1ZGlv
MS1jbGsNCj4gYXVkaW8yLWNsaw0KDQpGcm9tIEhXIHBlcnNwZWN0aXZlLCAgdGhlcmUgYXJlIDIg
YXVkaW8gY2xvY2tzLCBhdWRpbyBjbG9jazEobXVsdGlwbGUgYW5kIHN1YiBtdWx0aXBsZSBvZiA0
NC4xIEtoeikgDQphbmQgYXVkaW8gY2xrIDIoTXVsdGlwbGUgYW5kIHN1Ym11bHRpcGxlIG9mIDQ4
S2h6KSBjb25uZWN0ZWQgdG8gYSBzaW5nbGUgYXVkaW8gQ29kZWMuDQoNCkJhc2VkIG9uIHRoZSBz
YW1wbGluZyByYXRlLCB0aHJvdWdoIGNsb2NrIGdlbmVyYXRvciBkcml2ZXIgd2UgY2FuIHN3aXRj
aCB0aGUgY2xvY2sgc291cmNlIGZvciANCmF1ZGlvIG1jbG9jayBhbG9uZyB3aXRoIGF1ZGlvIGNs
b2NrIGZvciBTU0kgYW5kIHdlIGNhbiBzdXBwb3J0IGJvdGggdGhlc2UgcmF0ZXMgDQoNClNpbmNl
IHRoZXJlIGlzIGEgc2luZ2xlIGF1ZGlvIGNvZGVjLCBJIGFtIG5vdCBzdXJlLCBhdWRpbzEtY2xr
IGFuZCBhdWRpbzItY2xrIGlzIGEgZ29vZCBjaG9pc2UuDQoNCldoYXQgYWJvdXQgbGlrZSANCg0K
YXVkaW9fY2xrMTogYXVkaW8tY2xrLTEgPw0KYXVkaW9fY2xrMjogYXVkaW8tY2xrLTIgPw0KDQpX
aGljaCBpcyBjb25zaXN0ZW50IHdpdGggbmFtaW5nIHVzZWQgZm9yIGNwdSBhbmQgb3BwLXRhYmxl
cz8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=
