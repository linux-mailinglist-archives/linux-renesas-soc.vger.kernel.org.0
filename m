Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC67517416
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 18:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386260AbiEBQVi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 12:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355099AbiEBQVh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 12:21:37 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6F7DF70;
        Mon,  2 May 2022 09:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXPzZeMIicGyhRMEVZ/RsG32QUydurdHKozu94P+zylVoKGWZyBuEUASpjLcWd9zbr15itT0Qk5z48c69GAIuG6qnYXPKg6WI7NDhGo4GoC7A2V8sClnoQVelMmUqnYhF4Dtf6DOarWW6sMLLlNkdFdK4ahN+7xd1VWS2LmTJbXP3d4qQFmjlNPRWngwx20GNnoEmXUtKJbr2E3JE1TxZuO4oE7HP1RmbkjUyCA45jJh6bfEG8A8uf83nz7AFwyTRvM2BbiACYCqRv4osoeM+PArOMGiWGKUwTgmWIjQ4H8a7HtzXI2yfqRwmH/ntVEr+k/q4+bLwfUlWbZ2I8uaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl4/bEMyvfdW1C0yJhzCwOvbKRqI0L6ashtpGPrdSP8=;
 b=BzHRZwr4bdvYuxicjCUTrTb6UgmM8r3X+nMXoyX4gi7r1OHCKRv0TxE0MrB+oCXRisW8U3t8VtIvkeZIF5tGQrEixnvJYxrGpPFEkGG4PDCpQMU2DmE7Zxs/6SAG5WmBp3MI7vceTU+v7cSt2kWuNn0svGlbjg0h9XhJLfnkDYOHqfvrbk78DqyBMQpUGqgsb3uX9Ra9f0eOY+sqJfF/9Xwx27XxrspIostbi8+77UX+BHxSrUYc8llYS9lkxMJz1kLUELvVdWSM/DrfnddzC3bFrBtlx1qTACdYmPokWLco8orw7ALsqxcZUVPDfoCC5t4oG/Iclz9OZAU+66ze1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl4/bEMyvfdW1C0yJhzCwOvbKRqI0L6ashtpGPrdSP8=;
 b=e6Ay4B8/aKwqJW385bg3mw0WfZ+4ab1pIpyU6RY4fr5GwVYN9GxMtqndf0LwNukKAIoIrEOF2QTNFQaG1XRH4jF8TF4ne44equOPdWA1qgkPEgpMds9JXAbqI0adOLRCwOJBuRuH+6v999PpCZTjzqo3VSmxbedoHY0pwMO3HHU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3859.jpnprd01.prod.outlook.com (2603:1096:604:53::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 2 May
 2022 16:18:05 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 16:18:05 +0000
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
Subject: RE: [PATCH 1/6] arm64: dts: renesas: r9a07g043: Add SPI Multi I/O Bus
 controller node
Thread-Topic: [PATCH 1/6] arm64: dts: renesas: r9a07g043: Add SPI Multi I/O
 Bus controller node
Thread-Index: AQHYXU6+W6RVz7pAYEutWGLvTrnR4K0LwPYAgAADOJA=
Date:   Mon, 2 May 2022 16:18:05 +0000
Message-ID: <OS0PR01MB59221F1878FED409ACBE21B786C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220501112926.47024-1-biju.das.jz@bp.renesas.com>
 <20220501112926.47024-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdV1fO4EuV2n-iQ1jYmX9Fz5B6nX8oYMfduVHSEPAKG+dg@mail.gmail.com>
In-Reply-To: <CAMuHMdV1fO4EuV2n-iQ1jYmX9Fz5B6nX8oYMfduVHSEPAKG+dg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6b63bc5-3e15-44d2-50f0-08da2c575672
x-ms-traffictypediagnostic: OSAPR01MB3859:EE_
x-microsoft-antispam-prvs: <OSAPR01MB3859C39AC2696E600C85EAB986C19@OSAPR01MB3859.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YGIrpjtMwFe6d24Qt67wszGGJPqfbM0RGeUJjrQTt4jVJqkBEykf7wSKukkre7khRRQvXAKjm82Fkh/KeMjwNRcI+U7Ta2K4B+SZMsI1tsZhZIcw0sKw5uHm9lOMvYkMTMbsNHqglP2xy4atymrKTeIsc2eWfLTbidhpvz9MGLot7y9cMN+SC2fefy9lDQ4EdfsTU8Y9GhAecZ+1Wu2Eu2nW6eIKI322UMfHqG0GNlSOEz4sGsxm5RDQV1ske2xSHfFIq5QshY+yR8QfCo5+PIUl7BKQISWL4ro0PzM/zP3mQblQl0Yh1fJ5nw0LbR4dl5h5J344t23KKKFwybeWZIQoYUBO8taXzuUBI+CXzFx/snv4LNRHrJTH2UNTTAJFvNBamBvQ98ocSDrMREhSl12zY6osz+zybJH5WFnviTvmZ1G+T8VXE4EonI9sZkx2zIE8Qyec3GcmVlOz0KY44nL+6T/4Vi2ydYQJdul2fGpK+56trvXJarwEmvRssZAf9C+jFTKp0cYxRVkl3bm55CIST6/6/5icO2CLt24OvS+B9gjKByjHADDWefChYLlLubFZxx/c5v5X6MeipNidDMCiqMlnWwz5TCJGKywWptz0/J+pWvjywPF+EBQnycsR/pF3nIkKKSROWAIVjCjXKycTKRAqNUuZ31eVnFoFT5zL9UG1MZ+QxjQHHvX0bzNfjLxkIklq0e+kd35KauVLQg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(508600001)(107886003)(55016003)(6506007)(9686003)(7696005)(53546011)(83380400001)(186003)(26005)(66556008)(86362001)(66946007)(66476007)(66446008)(64756008)(71200400001)(52536014)(4326008)(8676002)(2906002)(5660300002)(33656002)(8936002)(76116006)(38100700002)(122000001)(38070700005)(316002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTVxKzFFdm5FaW5FdEx3a1JjcXoxelpyRzRCRkdWd25xbVc4ZEs0UTdueXln?=
 =?utf-8?B?aCtnWTRaUUlhcllHbjBLRllzSzc0K2lNRGRHYnhEYmREZ1dJWEhiVU5FOU9S?=
 =?utf-8?B?aVRXNEEzYWk0ZTNsT3NRT3dLM3YwZTJGUTRuRnYxamttRHhYTW5MVEhmVUlZ?=
 =?utf-8?B?czdPS2UycHg5Qi9nT0xrdkpQMDhmQzc5bGRJa2ZaeHdsWE9FNVdBWnlxT3gw?=
 =?utf-8?B?OEF6N1BoRENWc0Vka3FSd3Q1bUFsUjl6RHpaUXhHbXhhTTF5bDFwdWNHNjIr?=
 =?utf-8?B?VUhWbTZtZDg1RFRJckc3YmNsN0k2TzFRWElZSHlPbGRHQ2pzcnZmYWJycVRm?=
 =?utf-8?B?cEFEaWdmU29ObW94dU0wY2Q4SlN3K3lVSnp4YzFBOGF2QzVrcXVmSi9aOUtH?=
 =?utf-8?B?MUloMnVYWjd0dk5aQzhpRzVzM2lmdXVISmFxRU9TclZZaHZwOUVGQ0h4a0wv?=
 =?utf-8?B?MytSckpsNCt6c2RCRGd6amp0Y2dtRFMybEdzVU8wZWUzTVZQWFRWTnVDbHZs?=
 =?utf-8?B?c1VGNWRpaUxrdEZoaFJ4SWI1REJWREJLbG5qT3Y0RHVaRm1QejZPRGlLUXZi?=
 =?utf-8?B?NUZYa3FoM3Y0ZGFGdzVUbmVNRkFLSVp5TTkwVUR6ZFF1VmU1bzFHdCtPS3kw?=
 =?utf-8?B?TVcxdjBJUHVMOHFaZ2M0MDRCM3ZwMkRsZER4N0ZnVSt6b05XV2hnaGlyZXBF?=
 =?utf-8?B?ZVZ2amFvV1g5NGV4WEVYVEsrSjBWZTkxdGZKVUlVRDBkR01IdStTN3R2Q0FF?=
 =?utf-8?B?RXBDQ2ptRXlLSTVuSEZsMjNXSmR6ZW83ZUVlUkRuWTFCNUNueFpQVkptcERo?=
 =?utf-8?B?RmNCWC9iM1dLOVM2NnZodUk4dmwvU2k5Mm9SR0JUdXFHbjRmUWRFaDNFdndj?=
 =?utf-8?B?ZW9YY3JLWFQ1eFYrdDQxaVpvbVlXc0ZtWHpuWnZicld4akhVTDY5MFA3YkNs?=
 =?utf-8?B?b2lSRlRlM1Z3M2lMc3BnamMyQ0h2ZklYeVVpR1ZTb3hqdnNUQWl3ZHBqM1A2?=
 =?utf-8?B?R3hOSXJJMWYzelp3QjlweE1OUDdIcmp2c0I0ZVhVNHN6SlZGcGd3MGUzNFVH?=
 =?utf-8?B?aXNGemNOWk5SR2tVZXZuZjE1MURaK3VOSTRaa3ZYeXdYTEp1eVBPTklxbmdz?=
 =?utf-8?B?SU5aTTZrdTNNMElsOVB6ZitObkZoQzlJbDI4YmxsNFJOZFBsUEt6RDV1Mitt?=
 =?utf-8?B?RXEzVFBzcUFtT1JYZ0lUc2ZNZVo3N0lVVlNiUHJpRGtod05GZ0pxcXBJK2x5?=
 =?utf-8?B?dkZjazZEc3FodVZCcXhKcnpMd1hOb2dkZGMrSUdCSjJNNUpMdWxHdkVra2w1?=
 =?utf-8?B?NTlCdjJqc09sWDRIcTJ1SEJsOTAxaUgvNG0rcEtlMzN6VTBHNCtjN2xSbTla?=
 =?utf-8?B?YnF3Y3FqaWRPUzFJZEZGUldwN0VseStmU09sN1pxZzdadklETmh5NWZDczRn?=
 =?utf-8?B?blJoOENJb3c0WkNvOVpzN3ZwZWJNQVdvVDBtTXd2VlRvSjZLeXpUTE55YVpl?=
 =?utf-8?B?YmgwTGRnZkg0Z1VyNndFUlF4UEFQMnUvVnprZ1lyK2I4KzFiNGRxK3pDMWJD?=
 =?utf-8?B?YzQ3T0RNKzlPWWlEYlVlRUJEKzNnR1VlbzBOT0RPVHdGUFhlNHkxMzFvb05V?=
 =?utf-8?B?aTNXOE9TVU5jQ0l1VlhkSmpLVTNDV2s3TzcrWHpGbVpHeWpPZDZnNGwvRXpw?=
 =?utf-8?B?QWwxbUY1ajJGQVBpZTNCWkZsWHJuREJxd2NTU1BJZDlYQWptcDl4bTNDWm9X?=
 =?utf-8?B?Wnp1Sm9JNHllU0VzSGVnbDl2cXRtR25xbkdKMTJKd2NTQi85OVBNZVhCUHBt?=
 =?utf-8?B?ZkdYOURnQnk1WHhveUpVUm8wbUQrYklwODkrdUNwZ0tJaHhmaDJYVzZ4amRS?=
 =?utf-8?B?eG4rQW5DNVpVR2R4cHFkaHFUOTV4ZVhXeU5uZ0w1bDN6cmJVcjlqdzAyVTl3?=
 =?utf-8?B?Q0xDajFpcytiYjlLamJWckIxVDZIQ3N0Z1NuVjI3ZmZpb0M3VDdidkNFeHJB?=
 =?utf-8?B?dUhSMDZVTGR5U0wrWVJjdS9Oc2sxSnNuR1hVN0tlaWIwVFhJZlpXdzVKS25O?=
 =?utf-8?B?akdWTmx3TTZNV25iVXFGaUxXYW1xYWpZR2s4SDlnQm44b2lnekF1bmREV2Fj?=
 =?utf-8?B?RGtBWXgwYTNFbXA5ck40MW5hNmxWTUlrWndlUFQyMXhmbGpTbmpCWXhxaVNW?=
 =?utf-8?B?UVA4b2N4Rkh1K2NrMkYzb0toamxsV1d3T0sxeStHNXRWME9STjZTeUx2Z2RF?=
 =?utf-8?B?R1hLa0t5UDJ5UXoweTh2ZFZ3TlVzRFliV0RsZ1IwaFIvdlVDSUJBQlA4cDIv?=
 =?utf-8?B?bFFzQW9TNEJPR1JPdzZZbmlXZFFwRGRMY2ZVZGtOWGlkMXc5TFUyRCtTeHZ4?=
 =?utf-8?Q?JKnvMLDZ0SXOyyJQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b63bc5-3e15-44d2-50f0-08da2c575672
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 16:18:05.0299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22niZbMEv1i391mwpP9aG51LvHRJGfEpcbsNxXKpMxwTgaKxPN/88PK7EUpwmrXNPT4qNZCsvxqr28aZ10JYGj3F8EkOpSK+DLxPif3EO9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3859
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIDEvNl0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDdnMDQzOiBB
ZGQgU1BJIE11bHRpIEkvTw0KPiBCdXMgY29udHJvbGxlciBub2RlDQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gU3VuLCBNYXkgMSwgMjAyMiBhdCAxOjI5IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQWRkIFNQSSBNdWx0aSBJL08gQnVzIGNv
bnRyb2xsZXIgbm9kZSB0byBSOUEwN0cwNDMgKFJaL0cyVUwpIFNvQyBEVFNJLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiAN
Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjlhMDdnMDQzLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcjlhMDdnMDQzLmR0c2kNCj4gPiBAQCAtNDE4LDEyICs0MTgsMjAgQEAgYWRjOiBh
ZGNAMTAwNTkwMDAgew0KPiA+ICAgICAgICAgICAgICAgICB9Ow0KPiA+DQo+ID4gICAgICAgICAg
ICAgICAgIHNiYzogc3BpQDEwMDYwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInJlbmVzYXMscjlhMDdnMDQzLXJwYy1pZiIsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJyZW5lc2FzLHJ6ZzJsLXJwYy1pZiI7DQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxMDA2MDAwMCAwIDB4MTAwMDA+LA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwwIDB4MjAwMDAwMDAgMCAweDEwMDAwMDAw
PiwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MCAweDEwMDcwMDAwIDAgMHgx
MDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnLW5hbWVzID0gInJlZ3MiLCAi
ZGlybWFwIiwgIndidWYiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMg
PSA8R0lDX1NQSSA0MSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gDQo+IExHVE0sIGJ1dCB0aGlz
IGludGVycnVwdCBpcyBub3QgZG9jdW1lbnRlZCBpbiB0aGUgUlovRzJVTCBIYXJkd2FyZSBVc2Vy
J3MNCj4gTWFudWFsIChSZXYuIDAuNTEgYW5kIDEuMDApPw0KDQpZb3UgYXJlIGNvcnJlY3QuIEFz
IHBlciBUYWJsZTI1LjEgYW5kIFRhYmxlIDguMiwgUVNQSV9JTlQjIGlzIG5vdCBhdmFpbGFibGUg
b24NClJaL0cyVUwuDQoNCldpbGwgRml4IHRoaXMgaW4gbmV4dCB2ZXJzaW9uLiBNYXliZSB3ZSBu
ZWVkIHRvIG1ha2UgaW50ZXJydXB0IGFzIG9wdGlvbmFsIGluIGJpbmRpbmdzIHdpdGggZHJpdmVy
IGNoYW5nZXM/DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIFI5QTA3RzA0M19TUElfQ0xLMj4sDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCBSOUEwN0cwNDNfU1BJ
X0NMSz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjcGcgUjlBMDdH
MDQzX1NQSV9SU1Q+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMg
PSA8JmNwZz47DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgLyogcGxhY2UgaG9sZGVyICovDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAgICAgICAgICAgICAgICAg
fTsNCj4gPg0KPiA+ICAgICAgICAgICAgICAgICBjcGc6IGNsb2NrLWNvbnRyb2xsZXJAMTEwMTAw
MDAgew0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+
IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
