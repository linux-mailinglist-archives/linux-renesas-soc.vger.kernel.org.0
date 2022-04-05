Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB7D4F4399
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Apr 2022 00:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240055AbiDEOfA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Apr 2022 10:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386257AbiDEMkt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 08:40:49 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817CC1017EB;
        Tue,  5 Apr 2022 04:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JI0vlkhznPfAZFIcocbpvf9ftYSMXCvhjGo3q48Qhwgd1CnKIaknr9EZj6RyNFpIg3hra90o6znAIB4Ad1zVSubolGGB2NnQlGLcEQZq/CzguhhFLGXoI3F4cbLKe5T2btVaacJIxrtgoEguvQNjOtvQLdJ7i3CtHoQ3Vh9+OBuKeuydyTO4sOY2rFxpWl1Z+QwFmKnnTxNuKN/jYV2ywOKNhn2e5UmT7kMSuqiSzB990zRa9p7dTruvg12UyIqg9yNMk7ZyAb0s0yGUEumOWiSeOKxYu6lrHgroTAVrpiUzyjmwqFiWouWKS4/eNyFvnJ/EqGgxw0E0bbaGnDj2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGIC7XwfAClnwW0BB+2c3bCl7kXo45LxCz+MjazHcGQ=;
 b=e0pi8izdatXWT8SASKJbUbss7v3sbdDq1KRRRbTpVPHdrsJ8BabVq3jMNuu00g+uChDV64JqQ5KAw5TegyumRleI6F3yuptX37tUJQ3qNz/kZJsX4YEpYJyxZ2i/skNEhRa/9216ZgQGm06pbDFJc5kzF8P07WUM1F9kKHNICD/ZR+LRcbvDSaSrVpWXQGDQDHog4DNpUVVqtLtoR3wNr9UtGL4wOtxU6dGWGZUi7BDWNWCSpU8eZAQ/CbsPmsKgezfQa75mxhJXSVDaqC8GssmU23ZZ3/YRLJgHiAoAZ7moBee73C1Xpv1SRU7iJM8Sh2ujCedDvM41rw+BpctMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGIC7XwfAClnwW0BB+2c3bCl7kXo45LxCz+MjazHcGQ=;
 b=qNFilITRuzgEpTaWgvf3juNaE5i0+FTuTaj9fOO5KcEKHzYzgDMynK4BGcVN9BvwglhgFDPedZgwQVKhj3dlSM/XEDIUuRK2rcVN1LDot2nb32M3zdTrkH0xmhqIIESdGmd2QL2do1r+4Xhnuhlh0q+Klj5Con+PfR88n5lrWBg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB1654.jpnprd01.prod.outlook.com (2603:1096:603:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 11:47:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 11:47:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Thread-Topic: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Thread-Index: AQHYRmPV/EWVE3M8n0+qBjpsuXfV0azc0uuAgAAmAPCAAAeYAIAACFpwgAAD34CAAqW4AIAACMYAgAF7siA=
Date:   Tue, 5 Apr 2022 11:47:54 +0000
Message-ID: <OS0PR01MB59225118A6FC3D9C58D9A00E86E49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220402073234.24625-1-biju.das.jz@bp.renesas.com>
 <cf7728fd-b5c8-cd3d-6074-d27f38f86545@linaro.org>
 <OS0PR01MB5922B49ED5DADA5DD3DDA60786E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <d6989ea9-9e84-0022-aff0-c75b0e3203e2@linaro.org>
 <OS0PR01MB5922C1100BCF87341534FC6E86E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <e3ebc5d0-d2bc-b5a8-1b19-5e0c2f3d7c41@linaro.org>
 <CAMuHMdVTjHx8St_LxvMy1UfkRqNxZ1Dz0YYNXKMAhqouUxiW0w@mail.gmail.com>
 <a480eb35-4d27-8e40-4b34-9ed269ec6ccf@linaro.org>
In-Reply-To: <a480eb35-4d27-8e40-4b34-9ed269ec6ccf@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70872527-e535-4825-c44a-08da16fa1f55
x-ms-traffictypediagnostic: OSBPR01MB1654:EE_
x-microsoft-antispam-prvs: <OSBPR01MB16543A433480D2ADD0E49B7386E49@OSBPR01MB1654.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JYfp9LUisrELaGyQxyabnZ9VrnwmA7giYSESEv0gwFzH4YMp7DLue2e1TnV8AO8w9CeOnABJXY9LWicXsp+Y+2Sz/M2dkkgsREitJqYkdffTa0oN8mBqKyKZQUzTEyAoqLjD2jtDXMp8yk+a2geTgGk3+fzhE8FDPx6iGYCeX46bZ05CqQYcssSSUNbabPmFXz8+/VIiAIyksRfAYM2BFFzOzcHDoFnzzF4zVDDpkSh5KHKs0kLu4il/yuTmmetReTNeCoeH+rrX7zu3WtCx9fiCIGTGAfqIsYdhwIQNfYb2j0v0Yh0bwDoiPakOTOYKc/KFWNGgPJ5cuyxNCAQpDwbM3wHjXGZlXki//vFStfWxjt5/8R49i275U/52+HGL2SQ/Dinx7oCFaJ+SLmxSt3iJ2GgiB7SX3ffzUjl/apCTvlclk3/x2sE50SrhnK526lEze5PcmIzHAYzSVt3j+u08b++3CcigI4Judfxu8SS+p1713SotHDPO8Q5t44CjrciWx8liEyepE/L0qmrloh5Ndx6sm7q2hp1lgjwPaHSznLTGfQzENwkkG4vBpMoVcIj1NjUtgx0E3GSsqkGiX0Ny/hyU4UmZxSsfHPSn+FgsYWhdb58QpLIWiDw8FqlY/YIs6wDYX3lX1cf6zVbJPRUvEH0nSyfHLydqqYQlku7qZ0vuMD4rObd0hBmfXytX/8f2ZzKk01Am/Gcb1e4k7Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(8936002)(76116006)(66946007)(33656002)(52536014)(4326008)(38100700002)(8676002)(508600001)(110136005)(54906003)(5660300002)(66446008)(66556008)(38070700005)(64756008)(86362001)(55016003)(26005)(122000001)(316002)(9686003)(83380400001)(6506007)(53546011)(186003)(2906002)(107886003)(71200400001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cG9mRmc4VGVoa0pRMmpLbTl0ajcrWGZpTU1mSWhMcExwNWE2RzlUT2FRYXA0?=
 =?utf-8?B?SWtSUkRGUHR1MDM4MkpLR1hsL3MyclA0Nm5UTlhQRXgyU2RJeG9EZEFDRHl3?=
 =?utf-8?B?Rjc2WkladmRROTE2Vmtpdk9MVU8zQUVSVzZpVk9pUDJYbGRjanJsSWRCUUZU?=
 =?utf-8?B?Y25TbkxOL1NSQTJNZmxrYUl6b2JDUlZ3RVpadEJyYjN2Y0xFS3NsS0gxaVVG?=
 =?utf-8?B?QnA1aEVMeWdSMzFJTW5Ed1hYQkd6Y2hMT1AwZWRFZjVEZ2xBSDZ1MSt1M2k2?=
 =?utf-8?B?LzJNeEZLa05OR1FmS0R1eTAwWEdmZFVsQ1Ayc2ZscXE1WGRYZGtsc1FRL2N3?=
 =?utf-8?B?cm5NdmdLdTJJZTVzZGF4OW11WlZzczhkdWgrSFZ5RVh1UUdwMkZtaGl4UVUx?=
 =?utf-8?B?K25LQmFCMTFzSlVEbS84ZmhBdENtRHRiWXpBbWIwdjVpbythRVRzZFFMQVhy?=
 =?utf-8?B?UFg3THZXQmdBZS9KNGNuU2JQMzdPMkZ1amQ5aW5qbXZ3ZXlpU0hLUFZNWXl3?=
 =?utf-8?B?ZzVOSVo3bkp0RExhQWpmNzIyM25wbzUwZzVhSndvMGdkVWptZ3NJZ2xjNUth?=
 =?utf-8?B?OHpsaXo1bkhuM2hMTW1XQ3VyZjloUG92Z2xVNDNaWkdyTFA0T1RRb0ZFelNw?=
 =?utf-8?B?Qm9sdDNiUS9EUWJRUXFCR1pUbnhnVVBBVDhoT2NDb0U5R3hDUXNwc241a0Qv?=
 =?utf-8?B?UDhKUSs4alJXdnllQWxoK09oNXI0Q056VXh6bVVQVzZXNDBqbm80akZCZXhV?=
 =?utf-8?B?aGNtWDcwRUkyKzZPak5IZkxqeHZDTmxRTHdXZEpWNVpjWFIzR1hBdGVQd2pC?=
 =?utf-8?B?ZHA3WThuVllTSVlXUGlRS2tWcFFZMUdBWW1Na1BWS2pZWVdvd3kxcXB0L3JX?=
 =?utf-8?B?WWRRSi8rRkZVbTgvOVdFR2YrS2V6NE0wK3JKZzB1My9Md3JBRVZhOGlDTnN4?=
 =?utf-8?B?OC9aa3dteGFVY2pIaGlmbXI4N0lhU01Cbzk2eTF0RjZOcEc4c1ZMK3ViOFB0?=
 =?utf-8?B?U25IM1pKdzdWZmZQTFdFNDluYnV1aFNRNmNRT1h5ZENtTGcyNXdTblVWSnFm?=
 =?utf-8?B?d0FkSnV0cDdkcnlCeFNwUkd2My9wZnZFNXdjVnFGVWNSSkgrWWw4QTh3YzRY?=
 =?utf-8?B?M3dNKzFoZTBGdFVyODBOM1QxbGZNZ3A4Q1NXMXNSWnFOSzlGR0hDemVBRElk?=
 =?utf-8?B?MzJDSGw2RWdSWm52bVhPWmNVdHN3dVp0ckpaK1pYdlY2NktHU3k1emkwMVdF?=
 =?utf-8?B?ZDJiQmozM3VBcFBpeDJnbG91QThNb0p4WDI0OXk5VkJULy84L0J3WVhPOExR?=
 =?utf-8?B?dWszNVNMYUdUMW5aRklKZ2R2WUp2REtQWWlRc3RZU1h1UzNIdTREM1RDekVt?=
 =?utf-8?B?WFBrVXFXZHBXQzRySjg3enAvT21MMXhhNmkya2s4d2dvODJ3czZPakJGRU50?=
 =?utf-8?B?QmJBb0hTbnF1cEQvRHdWU2l0VGxlUzRsMkY0NVRwcTJLaVYxNDVCQitwdHZy?=
 =?utf-8?B?cDE3VGtPb1FZOE40Z1duMUFwdlRHVk0vMGNaR09YbVl1cEZPVHlCWmVVcXh1?=
 =?utf-8?B?WWxaaUNSNXBYMVRkKzJOci9TVEUvK0llSkVQY2IvNTlQQ2pLNHgweU5JZWxJ?=
 =?utf-8?B?NU02eW5NQ0lreUpIQWw2aEUwWnVlWGtucCtOdGlNUnVjTTRVZU5yd1FmR042?=
 =?utf-8?B?Y0tvSlZWT1BpL250OVNmbjYwM3RIb2I0bUNLcERBYlVkL1hnK3pXMk1hZFFr?=
 =?utf-8?B?SmlEMHk4NWlyVDl5YzNiVkVPM0RVZTA4QWxKRUovVXN1VWhFdVNDV0hYdDdO?=
 =?utf-8?B?Tjc3Q1UwMkQ1ekFSaVM3RkJjUGtYdTF3UHM2RVBrV1RzYndyRjlzQWozZFJH?=
 =?utf-8?B?ejVUQjdOeWtWd3VaQ3g0aG5ueEMyQjhLSHRnVjdoZmJESUhxSlZ4djhLSlMz?=
 =?utf-8?B?bFZYU2FmM2NnSlZMaDJXUi9zMlIyU3R2TjFONmxKMFdsK3c2M3FpVXFaYVZZ?=
 =?utf-8?B?MjhXeHZzL1cxY3MwMjFHdHVFcmJNSTMwYkU5Q1VUV0kwR3RmZENlWHhrbEcz?=
 =?utf-8?B?aVlhZmxwaWRjMXFEbnJFV295d3g1WXZWZHNjdER1M1cxdm1xYUZkWGZvTmNo?=
 =?utf-8?B?MDBFTUtpY2RScnJkZU1ZN1J1elVLdWhVRmhyWEN2WUhHRUNVdFducFA1UVJL?=
 =?utf-8?B?Vy83aWp1WkF1eXk1cEFwSHJ1T1ZVWTNSdTRNZFhrRERrOXFLVXlQdEU2Q2lE?=
 =?utf-8?B?QWVwMzlIKzdlWmE4bkhjU3dsaFlheHJ5Wit0MVNuNE9xTzl1K0VNWVhEcHA3?=
 =?utf-8?B?dVBSZGlaSVVQQUdaK29wa3hSd2dCYnhHVHcvSHlRWmxoaEk5WUFVUjMxdHNK?=
 =?utf-8?Q?Su4mVemI6BlwyCeM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70872527-e535-4825-c44a-08da16fa1f55
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 11:47:54.8758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ki+gwGNOkjnU7qP7Q85YdrTvStLNh5bsAMRCbSoJfLafIN2TXTZLHaiY2uhIvM93ndIywoVoNGQOTzx42g7aGVOK2XW+SET4yuvdQxtgiJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1654
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEvNV0gZHQtYmluZGluZ3M6IGFybTogcmVuZXNhczog
RG9jdW1lbnQgUmVuZXNhcw0KPiBSWi9HMlVMIFNNQVJDIEVWSw0KPiANCj4gT24gMDQvMDQvMjAy
MiAxNDoyOSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+Pg0KPiA+PiBVc2VyLXNwYWNl
IGlzIG9uZSBleGFtcGxlLiBXZSBkb24ndCBsaW1pdCB0byB0aGlzLiBBbnl3YXksIHRoZQ0KPiA+
PiBjb21wYXRpYmxlIGlzIHRoZSBtYWluIHdheSB0byBjaGVjayBpdC4gTWFjaGluZSBpcyBqdXN0
IHRlc3QsIG5vdA0KPiA+PiBjb21wYXRpYmxlLCBub3QgcGFydCBvZiBBQkkuIHNvY19pZCBhbmQg
cmV2aXNpb24gY291bGQgaGVscCwgYnV0DQo+ID4+IHRoZXNlIGFyZSBzZXBhcmF0ZSBBQklzLiBU
aGV5IGNhbiBiZSBub3QgY29tcGlsZWQtaW4gYW5kIHRoZW4geW91DQo+ID4+IGhhdmUgb25seSBj
b21wYXRpYmxlLg0KPiA+Pg0KPiA+PiBSZWdhcmRsZXNzIHdoZXRoZXIgdGhlcmUgaXMgYW5vdGhl
ciB3YXkgZm9yIHVzZXItc3BhY2UgdG8gZmlndXJlIG91dA0KPiA+PiBoYXJkd2FyZSwgaXQgZG9l
cyBub3QgY2hhbmdlIHRoZSBmYWN0IHRoYXQgc3VjaCB1c2FnZSBvZiBjb21wYXRpYmxlcw0KPiA+
PiBkb2VzIG5vdCBsb29rIGNvcnJlY3Qgd2l0aCBEZXZpY2V0cmVlIHNwZWMuDQo+ID4+ICIuLi5U
aGV5DQo+ID4+ICBhbGxvdyBhIGRldmljZSB0byBleHByZXNzIGl0cyBjb21wYXRpYmlsaXR5IHdp
dGggYSBmYW1pbHkgb2Ygc2ltaWxhcg0KPiA+PiBkZXZpY2VzLCBwb3RlbnRpYWxseSBhbGxvd2lu
ZyBhIHNpbmdsZSAgZGV2aWNlIGRyaXZlciB0byBtYXRjaA0KPiA+PiBhZ2FpbnN0IHNldmVyYWwg
ZGV2aWNlcy4iDQo+ID4+DQo+ID4+IFRoZSAicmVuZXNhcyxzbWFyYy1ldmsiIGNvbXBhdGlibGUg
aXMgbm90IHRoZSBtb3N0IHNwZWNpZmljIG9uZSwNCj4gPj4gYmVjYXVzZSBkaWZmZXJlbnQgY29u
ZmlndXJhdGlvbnMgaGF2ZSBpdC4NCj4gPg0KPiA+IEZyb20gdGhlIGxldHRlciBvZiB0aGUgc3Bl
YywgdGhpcyBpcyBpbmRlZWQgbm90IHZhbGlkLg0KPiANCj4gSXQgaXMgYWxzbyBpbnZhbGlkIGZy
b20gbG9naWNhbCBtZWFuaW5nIG9mIGNvbXBhdGlibGVzLi4uIFRoZSBnZW5lcmljDQo+IGNvbXBh
dGlibGUgKFNNQVJDIGJvYXJkKSBpcyBub3QgY29tcGF0aWJsZSB3aXRoIGEgc3BlY2lmaWMgU29D
LiBJdCdzIHRoZQ0KPiBvdGhlciB3YXkgYXJvdW5kLg0KPiANCj4gPiBIb3dldmVyLCB3ZSBzdGFy
dGVkIGRvaW5nIHRoaXMgc2V2ZXJhbCB5ZWFycyBhZ28sIGFzIHRoZSB2YXJpb3VzDQo+ID4gdmFy
aWFudHMgb2YgdGhlIFNhbHZhdG9yLVgoUykgYW5kIFVMQ0IgYm9hcmRzIGFyZSBpZGVudGljYWws
IGFuZCBqdXN0DQo+ID4gZGlmZmVyIGluIFNvQyAoYWN0dWFsbHkgU2lQKSBtb3VudGVkLg0KPiA+
DQo+ID4gRS5nLiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NTEtc2FsdmF0b3It
eHMuZHRzIGhhcw0KPiA+IGNvbXBhdGlibGUgPSAicmVuZXNhcyxzYWx2YXRvci14cyIsICJyZW5l
c2FzLHI4YTc3OTUiLg0KPiA+DQo+ID4gV2hpbGUgd2UgY291bGQgYWRkIGUuZy4gInJlbmVzYXMs
c2FsdmF0b3IteHMtcjhhNzc5MSIsIGRvaW5nIHNvIHdvdWxkDQo+ID4gaW5mbGF0ZSB0aGUgYmlu
ZGluZ3MgYSBsb3QuDQoNClJvYiwNCg0KQW55IHRob3VnaHRzIG9uIHRoaXMgdG9waWM/DQoNCj4g
DQo+IFRoYXQgd2hhdCBpcyBhY3R1YWxseSBoYXBwZW5pbmcgZm9yIGV4YW1wbGUgaW4gU29NLWxp
a2UgY2FzZXMgb24gTlhQLiBJDQo+IHVuZGVyc3RhbmQgdGhhdCBpdCBncm93cywgYnV0IHRoYXQn
cyB3aHkgd2UgaGF2ZSBzY2hlbWEgdG8gZmluZCBtaXN0YWtlcy4NCj4gOikNCj4gDQo+ID4+IEFn
YWluIC0geW91IGludGVuZCB0byB1c2UgYSBwYWlyIG9yIGV2ZW4gYSB0cmlwbGUgb2YgY29tcGF0
aWJsZXMgdG8NCj4gPj4gdW5pcXVlbHkgaWRlbnRpZnkgdHlwZSBvZiBoYXJkd2FyZS4gSSBkb24n
dCB0aGluayBpdCBpcyBjb3JyZWN0IC0gdGhlDQo+ID4+IGZpbmFsLCBtb3N0IHNwZWNpZmljIGNv
bXBhdGlibGUsIHVuaXF1ZWx5IGlkZW50aWZpZXMgdGhlIGhhcmR3YXJlLg0KPiA+PiBBbGwgb3Ro
ZXIgY29tcGF0aWJsZXMgYXJlIGp1c3QgZm9yIGZhbGxiYWNrLg0KPiA+DQo+ID4gQW5kIHdoYXQg
dG8gZG8gd2hlbiBhZGRpbmcgbW9yZSBEVCBvdmVybGF5cyBmb3IgZXhwYW5zaW9uIGJvYXJkcz8N
Cj4gPiBUaGlzIHdvdWxkIGJlY29tZSB1bm1hbmFnZWFibGUgc29vbi4NCj4gDQo+IFRoZXJlIGFy
ZSB0d28gdG9waWNzIGhlcmU6DQo+IDEuIFdoZXRoZXIgd2Ugc2hvdWxkIGZvbGxvdyBEVCBzcGVj
LiBJZiBubywgd2h5IFJlbmVzYXMgaXMgc3BlY2lhbCBhbmQgZm9yDQo+IG90aGVyIGNhc2VzIHdl
IGZvbGxvdyBEVCBzcGVjPyAiVW5tYW5hZ2VhYmxlIiBpcyBub3QgdGhlIGFuc3dlciBoZXJlLA0K
PiBiZWNhdXNlIG90aGVyIHBsYXRmb3JtcyB3aWxsIGhhdmUgdGhlIHNhbWUgcHJvYmxlbS4NCj4g
DQo+IDIuIElmIHRoZSBhbnN3ZXIgZm9yIGFib3ZlIGlzIHllcywgd2UgZm9sbG93IERUIHNwZWMs
IHRoZW4gdGhlIHF1ZXN0aW9uIGlzDQo+IGhvdyB0byBkZWFsIHdpdGggb3ZlcmxheXMuIEluIGN1
cnJlbnQgY29kZSAtIEkgZG9uJ3Qga25vdy4gTG9uZyB0ZXJtLA0KPiBtYXliZSB3ZSBuZWVkIGEg
d2F5IHRvIGFwcGVuZCB0byBleGlzdGluZyBjb21wYXRpYmxlICh0byBleHRlbmQgaXQpPw0KPiBT
b21lIGV4cGFuc2lvbiBib2FyZHMgZG8gbm90IG5lZWQgdG8gY2hhbmdlIHRvcCBsZXZlbCBjb21w
YXRpYmxlLCBiZWNhdXNlDQo+IHRoZXkgb25seSBhZGQgY29uc3RyYWluZWQgZmVhdHVyZXMgKGxp
a2UgQXJkdWlubyBzaGllbGRzIHdpdGggc29tZQ0KPiByZWd1bGF0b3IpLiBZb3UganVzdCBhZGQg
aXQgdG8gRFQgYW5kIHByZXNlbmNlIG9mIG5ldyBjb21wYXRpYmxlLCBlLmcuIG9mDQo+IHJlZ3Vs
YXRvciwgaXMgZW5vdWdoLiBZb3UgZG8gbm90IG5lZWQgdG8gY2hhbmdlIHRoZSB0b3AgbGV2ZWwg
Y29tcGF0aWJsZS4NCj4gDQoNCkRvZXMgdGhlIHJ1bGVzIGZvciBjb21wYXRpYmxlIHZhbHVlcyAo
bW9zdCB0byBsZWFzdCBkZXNjcmlwdGl2ZSkgDQphbHNvIGFwcGx5IHRvIHRoZSByb290IG5vZGU/
DQoNCkNoZWVycywNCkJpanUNCg==
