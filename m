Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC9C5136FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 16:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346723AbiD1OiY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 10:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbiD1OiX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 10:38:23 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63947E58;
        Thu, 28 Apr 2022 07:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxPufWnONthbwXMMDRkuGT+j0EziNcSGMrP5ZS7pom/jAgMkVtkM+p3+VKuDFUXxYMFG3ikOtDqSTshCmvhvqFfUfkiimS4AG0FQggcaleJAQOo47tGX2puIBLslxjFVD8osJotvhlcdKIwd52ke3o4k+JVXv/Xi+SoG2or2+++IoCKN4N/lno5o/1nj2s8Yl74ha+RqHPsXpEtAq2YJtnoWBYbGjpRPohNRDedFlIz+7DZ5EjqkPLyhtxWtbkVnJpCYibqC/3TvhMLRFQP/EwrWPRE/FLDGq/FzmaPwZw8MlwYzMmeZzaJGMNa78P34FLEhK0g/pB0SQtqvHpHpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iQs5OA3kySbtK7h/+avbSg5ebXLNbmh7eia+1Vu5BA=;
 b=A/sFhVFyO6Qa/jjvfxVFpqgMUknirmmTrZnvLw0P4lgsJ7Qd+D9zpGkBjX1r+zUpocfUQUfdzx2tyHSeAL40jetrZKD+901eEu9HNOwX/dVn/xW48AuaxcUBMFMEB524XKvG0bvglhjWznqG+iAMFsQbte1ecrVao6errPvZrkOiSRq9GksdOE9UWY6fSTVa7y+MR/3U4DMxUhjiZ12m9YjvQ+c+PLSWxfycNMpU52zR58PKkRUosU1QXic2tbJxLFI3niIk5Dv/dP+WsLJ0GWscTcZPgmQ30tEY77RgC1p8Dp6dQ0A8eNsr/JarMSL02pw9pxCWdVT31X0o3ptdTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iQs5OA3kySbtK7h/+avbSg5ebXLNbmh7eia+1Vu5BA=;
 b=J9GGy1V0Qi2H9vYRTNsB4OupiHJDsLyoROzI2ORxX4bU5sWsTuW3a6IrzumwxJ9lOlHs/FimGeKnBw2RVRkWekdiKVauX2mq67jqs/N62SOdudZpinu62NrfbHwKF26I0nXndVq8GRgdbBzZyOTKJz41Umw2eiz0bJjomq3v5hc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB7771.jpnprd01.prod.outlook.com (2603:1096:604:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Thu, 28 Apr
 2022 14:35:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 14:35:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 10/13] arm64: dts: renesas: rzg2ul-smarc: Enable USB2.0
 support
Thread-Topic: [PATCH 10/13] arm64: dts: renesas: rzg2ul-smarc: Enable USB2.0
 support
Thread-Index: AQHYWMbF/cy21ob6Xk+eSbytmpqbEa0FYCCAgAAIVZA=
Date:   Thu, 28 Apr 2022 14:35:04 +0000
Message-ID: <OS0PR01MB5922BA6F7AE313F2753A9D3E86FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
 <20220425170530.200921-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdVBczjWQQdeaiE4NvgvZUc+tkK0o8unoD5ngjGaOM1JCg@mail.gmail.com>
In-Reply-To: <CAMuHMdVBczjWQQdeaiE4NvgvZUc+tkK0o8unoD5ngjGaOM1JCg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59cf8cb2-202e-4db8-429a-08da292448c2
x-ms-traffictypediagnostic: OSZPR01MB7771:EE_
x-microsoft-antispam-prvs: <OSZPR01MB777189368ECFF907E31E277286FD9@OSZPR01MB7771.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FRbQ6EQZ2Pl+Uz4zMDKCXqmvrsiAJAh/W2udire71X5EjGljl5o6onF1GLX/XvBVFhgvaw57WZmweA7eOgR3OjgFEh1A5d1txaFLa6p/ZUORJRZsyZrMQ68NUUM2AqsHz9LweOL1tdVzwPeBE/uUtIoeKC81EbR2yjW0ioOVam3Q5f6LyqEGdqIsk6eexN9rTUFZ1lKXLz+f+zyldXxMkYeC3KMtQBck/ZTLKRcaK8cAv4YzNn9BO8vn99hOJNdAv5VMaZrd3Mc/ILRmzVQVbSR5GqiNO+iBW4XukNJBYOYlcAGCMYsSTqF719fCnGKybvuvgj6AwheOVBDiU0zY/xTEQzADUp57cLCC1oKyoEvBEFx30eHl7f+sQiMUgnyMCvz0iJgVYu1mcBcaVbm0p9yjnwjthW9F6YUQavVdTg5R4hsoleTyO975EHcDdmEz1W4n/9sArlteFDe9hKKu7KsjhtlMMbvLBWKq1/nkfVCUP2Fr2QeRNmY0rCl+gUAGy575Osyg2cAMEhPVJ0ie905n2W+51VqEGymvnvTjzssLS7M0L6GgWYziV+hGBJNGQJ3Q53GH3MDepFZ1EvR0xHfZnJPIRItqp651rMCf2UrjgYIvTSZo0PkXy6cZgchUpFtfQnmHuMIW80yD7kHqKvugjSaSzXtv0UO8fmdcDcVK9rKNmDcNhVDo2+GbWshzlsLBcbBlgvL/siY3UoZPag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(54906003)(66446008)(66946007)(8676002)(6916009)(64756008)(4326008)(66556008)(66476007)(316002)(38100700002)(38070700005)(76116006)(55016003)(508600001)(9686003)(53546011)(7696005)(6506007)(26005)(186003)(107886003)(71200400001)(86362001)(83380400001)(52536014)(8936002)(33656002)(5660300002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEhSYWMrRWMwTCtheXFwMFZTSFA4Szl5ZnlVMzZheXp2TUg2QzlxS3lod2dQ?=
 =?utf-8?B?V0RqTDJQN0hCVUN6S2RqYnJaTEhuU0lwL3lna3Z3ejI2K2J4OXhvVDZ4UkJt?=
 =?utf-8?B?c1NrRk9QRGhET3ZPUVk1WXg2Q1hPWTU0VXA1VHdhdWtXaWF4amhoSDJsWVZm?=
 =?utf-8?B?QzBUeVl4cnVIbzg5MVVFTXV4SDlXZ3dSeFZHazRsQnNTb0Fkbjc1L2kvVXpP?=
 =?utf-8?B?MmxrOHZ4LzJEM3luaGtmT2JTcE51TEpKd3I2T1c3K3BGNytBU1JEU2FtaEUw?=
 =?utf-8?B?clhoU2xMZW1tc2lMd2xaQlNlZ2M1a052RWpVYmdVRjBpNG5yYksyKzVrRGxM?=
 =?utf-8?B?cGxrWHFONlNKWFIxU1NPWWN4QjlzUVBiS2IrY21xU0hxUXNGaDNuZmIwZG82?=
 =?utf-8?B?Q2Zpbkh6ZHFxc1draHF0elk4SkJZL2tZeUs0OWE0V2IxQWNJd1pvdE92MW5C?=
 =?utf-8?B?K0FVTnZKUjdDQ3ZwWnhYeUJMRGVMK2IwQVl2UFJuMXhKYVhFc1hjbWk5RWRk?=
 =?utf-8?B?emVqSmxOQWd5WkdVU05BY2w4QnZHYUhyNXJpUS9SWmZLbVFWVWNmcWFXMWhm?=
 =?utf-8?B?SzV0T2RSSUhOOVV5b3pzTU05ek9IbWNJVS8wUEY3U1ZkS2V4MmtkQitrcm5G?=
 =?utf-8?B?d2JnRjZieEJpZDdHN0oraWQrRFR1bjJkdGtMcjhGNFk3N0tNbUZKQU9WMkk0?=
 =?utf-8?B?OWgwYXdNYVpSbWowTm5hRWZVSU1JYWpET0VMRVd2S3JBNkNVcFFvTXRUMGRw?=
 =?utf-8?B?N0ZUc1laZU1Lb1VZeFhvUE1EL2NMbEU2VlZyYXhWT3NmM21aTlQxb0JXQ3k1?=
 =?utf-8?B?R09lUTBvZzJjdjRUQlBmcUM3aW9DSzVMdTVKb2lTTlRGMDZCc2dtd29KSCtB?=
 =?utf-8?B?L1BDa0VyVEwwUnFManFaeVc1cjBpcWxKSjhPS2ZJbFBqYlhRVDRiRW1BSGhh?=
 =?utf-8?B?UTFGNVBkT0pEV0hKQkNCdXVRdjYvYUJ5NTdGWXRDcGhvSTVkNjNKQTdPT0VZ?=
 =?utf-8?B?d3FhMGR2NHk1NlJlRmZnWjk0ZmxmNGl3d0NTclBSWjFWQXFpdlMrMkExSnlP?=
 =?utf-8?B?S2NUV21OR3lGajhmSzNpZWw4TnFMRWdrWHE2aWhsTytvcjlxcFl2aFZQeEVx?=
 =?utf-8?B?MFNOQkRVRllVenhXZ083akxIOE90dTA5MlJqQVMzNG1weVYyZzZXOXAySnRU?=
 =?utf-8?B?bHRBcjgwc3RkYld1V2Vxbk5MTXpxaC9SL3NvMGVheDNEems4ODJHWlVJc3ov?=
 =?utf-8?B?cC9aU3NtdFV3UFdBa0NpUWFNWHRpWGtpbFFmb1o1SHJ4blhkVGkxZVRNVTdv?=
 =?utf-8?B?RTlaUUNxd010d1RRN3J3bmdoSi9CR0xsNUo4dGZFR1lHTVVSL1V0bUh5bGY2?=
 =?utf-8?B?amZ5TFRxVHZyU1NxZnkwWkN6c1VJbWtTZGQyMkxmb1lEWnJvSXoxd0dJNTNP?=
 =?utf-8?B?R0VEeEtmbXk5VzVmUkt4L3JzVndWcWpDOFNJRFJMRzdFYzZsZDlub1BFR1Ni?=
 =?utf-8?B?TFB6dUtDVXptSUY0RTBvaWNyK2J1eGdDR2k5SmlzQjJkTW9wcVptRGNDb0tk?=
 =?utf-8?B?S0UrQjlnUTBxQzdmb2oraDl0Rm1MNU55M0ZKWllEWlZzbzh2TVFCMDgyRmNE?=
 =?utf-8?B?Q2lleitseVJlYnQyRXhJYjZPZzVRRkFLNEgvSTZOaEZ6ek9YbWptMzlmM3cr?=
 =?utf-8?B?QjJSUzh6aXI0Ymp4NGtsR0FZQ1B5bk5za3creXlyZWY0dXJhNVJQaWVhODdE?=
 =?utf-8?B?NCtmNEI5QjJrZVEvZm5aUlpGWGZzaWc1b3BPWS95ODJQQ2d2RG5mUXhreHVK?=
 =?utf-8?B?ajVwNVpxR3hGeDY1UmF0VzN0OGt6enlHcThPTS9RRlpGOVM3bVBpS0lFZUN1?=
 =?utf-8?B?RllyZnBCSXRnWm5CTUpYS2d3YzRQUVFKU1ZERE5FMHNyVkQ3MkYwSFdBMGk5?=
 =?utf-8?B?MGdFa0g3S1dXYTJ6WW9IZ0dLdGJETDBic1dWclIrbmNycEVXMW5OOTN6UEpl?=
 =?utf-8?B?Z3NQa2FlemxCemxGdllBWTVqcnJVWFVkM2c4bU1GOXJFVHBwbFpSeWFySnFD?=
 =?utf-8?B?VS9CRW03WDM1c2diNmkzRUlkUE9NYmhrOFR1OXRpY1pCVGZZV2JBNGVxQjA0?=
 =?utf-8?B?NGtudFZtN0s0OFI3QitUVW5ZcGt6SW1QZkxxSU95SVlMVWozQlcrTHBBaGdw?=
 =?utf-8?B?SjltUGpEYnlsakQ3YmNCRGp2b29hcmZUSmdRZnVqMnF3TURzNFVieUJJc0Ns?=
 =?utf-8?B?dWNwY0RGZWVtTk84dkFXZUNUUHVJdnZzN0pQdW45UTdqbUNoak51anBiOXNt?=
 =?utf-8?B?cWlibm5YWmtTMVJ3VERnMEpjSnRuaVpuWVpiVG9GdlQ3MHIrRzYvMno4UjJ4?=
 =?utf-8?Q?kKXkxuWlYAXaz4JA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cf8cb2-202e-4db8-429a-08da292448c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 14:35:04.2130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgWxKGyDhyCILNTQegKvY2PYcf/trNozdFDX2AOdelHx5GixGtTTyuw2Algss3n6BAjEloDXjcM5E0p8VZqAufK3nY8xl70/5jGyrfxiD0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7771
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAxMC8xM10gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMnVsLXNtYXJjOiBFbmFibGUNCj4g
VVNCMi4wIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIEFwciAyNSwgMjAy
MiBhdCA3OjA2IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3Jv
dGU6DQo+ID4gRW5hYmxlIFVTQjIuMCBIb3N0L0RldmljZSBzdXBwb3J0IG9uIFJaL0cyTCBTTUFS
QyBFVksgYnkgZGVsZXRpbmcgdGhlDQo+ID4gbm9kZXMgd2hpY2ggZGlzYWJsZWQgaXQuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M3UxMS1zbWFyYy5kdHMN
Cj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzdTExLXNtYXJj
LmR0cw0KPiA+IEBAIC0yMCw1NCArMjAsOCBAQCAmY2FuZmQgew0KPiA+ICAgICAgICAgc3RhdHVz
ID0gImRpc2FibGVkIjsNCj4gPiAgfTsNCj4gPg0KPiA+IC0mZWhjaTAgew0KPiA+IC0gICAgICAg
L2RlbGV0ZS1wcm9wZXJ0eS8gcGluY3RybC0wOw0KPiA+IC0gICAgICAgL2RlbGV0ZS1wcm9wZXJ0
eS8gcGluY3RybC1uYW1lczsNCj4gPiAtICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4g
LX07DQo+ID4gLQ0KPiA+IC0mZWhjaTEgew0KPiA+IC0gICAgICAgL2RlbGV0ZS1wcm9wZXJ0eS8g
cGluY3RybC0wOw0KPiA+IC0gICAgICAgL2RlbGV0ZS1wcm9wZXJ0eS8gcGluY3RybC1uYW1lczsN
Cj4gPiAtICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gLX07DQo+ID4gLQ0KPiA+IC0m
aHN1c2Igew0KPiA+IC0gICAgICAgL2RlbGV0ZS1wcm9wZXJ0eS8gcGluY3RybC0wOw0KPiA+IC0g
ICAgICAgL2RlbGV0ZS1wcm9wZXJ0eS8gcGluY3RybC1uYW1lczsNCj4gPiAtICAgICAgIHN0YXR1
cyA9ICJkaXNhYmxlZCI7DQo+ID4gLX07DQo+ID4gLQ0KPiA+IC0mb2hjaTAgew0KPiA+IC0gICAg
ICAgL2RlbGV0ZS1wcm9wZXJ0eS8gcGluY3RybC0wOw0KPiA+IC0gICAgICAgL2RlbGV0ZS1wcm9w
ZXJ0eS8gcGluY3RybC1uYW1lczsNCj4gPiAtICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+
ID4gLX07DQo+ID4gLQ0KPiA+IC0mb2hjaTEgew0KPiA+IC0gICAgICAgL2RlbGV0ZS1wcm9wZXJ0
eS8gcGluY3RybC0wOw0KPiA+IC0gICAgICAgL2RlbGV0ZS1wcm9wZXJ0eS8gcGluY3RybC1uYW1l
czsNCj4gPiAtICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gLX07DQo+IA0KPiBMb29r
cyBsaWtlIGxvdHMgb2Ygbm9uLWV4aXN0ZW50IHBpbmN0cmwgcHJvcGVydGllcyB3ZXJlIGRlbGV0
ZWQuDQo+IEFueXdheSwgdGhleSdsbCBiZSBnb25lIHNvb24gOy0pDQoNCk9vcHMuDQo+IA0KPiA+
IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcydWwtc21hcmMtcGluZnVuY3Rp
b24uZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcydWwtc21h
cmMtcGluZnVuY3Rpb24uZHRzaQ0KPiA+IEBAIC03Nyw0ICs3NywxNSBAQCBzc2kxX3BpbnM6IHNz
aTEgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpHMkxfUE9SVF9QSU5NVVgoMywg
MiwgMik+LCAvKiBUWEQgKi8NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzJMX1BP
UlRfUElOTVVYKDMsIDMsIDIpPjsgLyogUlhEICovDQo+ID4gICAgICAgICB9Ow0KPiA+ICsNCj4g
PiArICAgICAgIHVzYjBfcGluczogdXNiMCB7DQo+ID4gKyAgICAgICAgICAgICAgIHBpbm11eCA9
IDxSWkcyTF9QT1JUX1BJTk1VWCg1LCAwLCAxKT4sIC8qIFZCVVMgKi8NCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgPFJaRzJMX1BPUlRfUElOTVVYKDUsIDIsIDEpPiwgLyogT1ZDICovDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkcyTF9QT1JUX1BJTk1VWCg1LCAzLCAxKT47
IC8qIE9UR19JRCAqLw0KPiA+ICsgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICB1c2IxX3Bp
bnM6IHVzYjEgew0KPiA+ICsgICAgICAgICAgICAgICBwaW5tdXggPSA8UlpHMkxfUE9SVF9QSU5N
VVgoNSwgNCwgNSk+LCAvKiBWQlVTICovDQo+IA0KPiAvKiBPVkMgKi8/DQo+IA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICA8UlpHMkxfUE9SVF9QSU5NVVgoNiwgMCwgMSk+OyAvKiBPVkMg
Ki8NCj4gDQo+IC8qVkJVUyAqLz8NCg0KT0ssIHdpbGwgZml4IHRoaXMgYW5kIHNlbmQgYWxvbmcg
d2l0aCBvdGhlciAyIGF1ZGlvIHBhdGNoZXMuDQoNCkNoZWVycywNCmJpanUNCj4gDQo+ID4gKyAg
ICAgICB9Ow0KPiA+ICB9Ow0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4
ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0
aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
DQo=
