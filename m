Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85CE070BF0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 15:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjEVNDO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 09:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbjEVNDM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 09:03:12 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBA4B7;
        Mon, 22 May 2023 06:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJvPmSYpBS6YPIAZpcOrbe3B8K4F3vNMkZvZaPgIW07tJmzLFA4jpPap4uXb/3b4nrETVmG6SdX842Hch+wI8RQ/dd/eiYXfJriacI632ZmhHUtcoqmAIpimZbfLBF8+tg8/mQ/teOGBI7OWtI4HSEW8wyLctyTGS6G30m2CVjKuqgir3jwYbtjm6HDGm39ht98dDP4LFnzt4e2KcpsRAO1tL1YUHOzSs34yxqYiKY79Vru6YPqcR98AF+3cwi4hl8EEKVwg5a3kAVxA9dAwLon5UoMzJw82uLIZwRQ8Nzfwaz2dhReAY9dMisOknyMouBlLjQGdSMCisHpN/vYUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWf9/WDseahST0I3TXpNdlrSJ7CDca/ftnCBRr9kjdE=;
 b=lvbjIVM2y5aZBT+cXLWkuJjgXaf2Fxn5XDW7ZtmEwP6xQXmVsZgFcIFX6/uXz4P/5Xb/E7AXdud3bBdbACmV3DlvHQVsSYAenqOmmU8j1PzROlEPNbe9cBG5llRrqYXOiY29OkqPbIpUVM4+VzAChSYRhd5jmGUNmILJ/0EvEkglYCXHZEZIXuiLGIirI7jMNR7FuCB8SdXAF8qSeQBLpPftgLYe18eKoQyanoeXOabT2TRfC2zx90+cvnD75CXCaNEZp5lB7O1phILQObNEiwzQzdinHdR11NauMuv2zrlsRpdm+0u6k57063z28lI+dVqXyDCliTSn7vXPby94yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWf9/WDseahST0I3TXpNdlrSJ7CDca/ftnCBRr9kjdE=;
 b=QToxcw2X05hOoQDO6oHoqelYnIK5CC9toUik/Zog1ZqjOomb1o6rqwIjcR9tRy8N8ziwjX8wwupKZrXdiIsoyVIpDHfxCF2wXeE6Yr5VIpbvBrLtIRCNfyN9ABB1020rDBdSKHtY92uYIlJOUv0b0tdTJ7AI+iAbAwitnyjMEK8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11124.jpnprd01.prod.outlook.com (2603:1096:400:3bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 13:03:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 13:03:06 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH] clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write
Thread-Topic: [PATCH] clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write
Thread-Index: AQHZiZy5sNa0Nnaz80KmiWf8cA57PK9mRTmAgAAC3vA=
Date:   Mon, 22 May 2023 13:03:06 +0000
Message-ID: <OS0PR01MB59229A255B96E159B9745B4D86439@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518152334.514922-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdU7VgoOxo8LHgJvJEc7ZSoAbqTUgU390Cb9-V-8fGEjag@mail.gmail.com>
In-Reply-To: <CAMuHMdU7VgoOxo8LHgJvJEc7ZSoAbqTUgU390Cb9-V-8fGEjag@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11124:EE_
x-ms-office365-filtering-correlation-id: 77cca729-4914-4d26-2e7d-08db5ac4e2b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qB5SavMOlAnbfESZpKU0EawhXvEsd0zmINsDI4spG2Ojap6j446UY61/lR5rRy79INnynPjSSjmoQAoU3mNTkR748GlO99s+SQZtfewW9g7gpW/8svjMIEIzCaxsP7odIjxdZRNLDfXwYxM4cGK/+vsnwfu0sO82hwEhKMu3jy6iGq8r1/ptXI9WK/IXV1C8j7uHNP1YZbFGmJTprSbP3zBIf0eKq95y6cLmiabAr4hiGGuCLb4tgHY36zvUepcDlNirGdxXzNLaAZMb4+Qa2DNhJw3h/UZG5cQGfC0M6kYZQdgFgr+tybXIaaThA3fcGgfg555E5QaSuXRA2H4D+WpeMdnWnkkk4wldCQFdLEypZ8fBdJS27AUNTgaZlMENKrBVYCzd+ZG1fYhB7kpt+jRDSXlU+CYDyIEMUbOZ7OhnozJmY1f8+gNUnfGUKzBi4kcjUltTi8v7YXXRREKDy2JXaKdnIZJQhbOCf/7NaI3mGdsN/WKEePbc31m9CBEbcjt+0BQlerRKuxBGQnR9j440o4/nMa1khEwot+NoSuG72AiOFow13HVqAc+IAUt/skNv8At124lN1ctyI3Pedgx8SVCuAkGZT36xs6maILHMt814h4KObJ+sicEXPsJI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199021)(2906002)(52536014)(5660300002)(83380400001)(8676002)(8936002)(76116006)(66946007)(64756008)(66556008)(66476007)(4326008)(6916009)(54906003)(316002)(7696005)(478600001)(41300700001)(55016003)(71200400001)(66446008)(33656002)(86362001)(107886003)(122000001)(26005)(186003)(6506007)(53546011)(9686003)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RG5jd2taQzgyQ3hNekVqeXpUSWc2R09pN2hnRW15b3djSi92S2VjZmJIeTh1?=
 =?utf-8?B?ZkZDWlhZS0ljeC96akh1L29zVkRjU2dJYlQ5ZjJNaVc4Q0pNK3JBbFFQRFhH?=
 =?utf-8?B?TTlnSG9tRlAwTnZxWnEwRVBpRjRIS1lQL1BPNUswLzFqOG83c05xSVhHeWxG?=
 =?utf-8?B?eGQ2d21vWVFmbzVhclNxV3pjTGNpd0hPVGVMZ0JkK0UvdW85YWxmOXNwWHlL?=
 =?utf-8?B?cVZiZyt6NE1BZFJTdG8vR24rTldBcjlqemgwNHF3bEYxVGkvZHZSMjNQeTFS?=
 =?utf-8?B?dk93L25vb1J0OGd1dmNjL3lodXNCOVc5QnU3czJ3YlBkbVhoTXlYNFRzRHFF?=
 =?utf-8?B?Tk5xYTRNYnhhS0M3cVhEem8xUmNuOVBoVll1TVJESHFxNjJRclhUQWNZNzhq?=
 =?utf-8?B?T0dsalBya2ZvQkJoaXZyY1Zkc2Z4UzNHaUJBTkd5T3NiQVMxVXBGVFdEdmNB?=
 =?utf-8?B?UHN2dHJKa05QMVdJZTJHS0o2blNFTEJ1UWsydnd3bFBEYVdFaUVXMUs4RWtJ?=
 =?utf-8?B?S1hKZXVMTUhXZnU5TVpIeWhNQmYyRnhreUVwcjRFbnF1RGRGT3V5SkZVdUZr?=
 =?utf-8?B?alEyZVR2ZUhSczlpOW5mOU9WT0R6YU01c3Z2cWRESngyeDd2WldIQUNxamRz?=
 =?utf-8?B?S2FEMXg0ZFJrUjM4dHd0aGNaMVVRZDR4bFVOSkpoSGp5TFBRSmZWUEIydFd6?=
 =?utf-8?B?VGVETXJLTFg0YnNhZmp6S28xRXNSZ3k5cUZGaUtOQnJDRnNqbkF3eE1YNjF4?=
 =?utf-8?B?OUkwTHNEYlpyVmNZNUtuUGlxaEFRdisyOWhtbmsvVkdhb1RZSnJGMWs4TnRk?=
 =?utf-8?B?K0prS2F3eXpWc3RrOG5WY1N6TFNEc1BhcDJ0L201OUI1L1ozYjRRRXZ3aTRZ?=
 =?utf-8?B?VGhjaEYwNm1KUHB4VlZuVFg5dnBqMEFNeGxyWTRJNUdkUWp3RmpRM2lqNHRC?=
 =?utf-8?B?SXUveTN6TUFjVFRwYWk1YTUxbFJmSkRRSnZYQUlueElRQ2lta3E2YmVxaGg5?=
 =?utf-8?B?N25rMWFKcFNkOXJVdnUrM0ZLd2NQZzNHNFhTZzdiY05ISlJvVUo4YlY2QkdQ?=
 =?utf-8?B?Y3pLOWZ2c1IvVDRDWFJ6bWU1RXl6NVlVWFlzYzQrVStMdVo5eWZtM0s3ZUJo?=
 =?utf-8?B?Y3E5L05td1YwYllSQk1TREtRMVB4UUt1YnJQQkRmNGpJYTgyZkh1d2wrQ3Za?=
 =?utf-8?B?MVZnRjVCWDRwMytUSlNXQVQvY3lxTVpVRmNKNmFBRnhXZFp4aG1wY050THJ2?=
 =?utf-8?B?SFVlUlhoaTE3VVpqdE5iSVE3c1NFc05IMTRyaWRKM0RCZWZYWG8rb0c5WTgz?=
 =?utf-8?B?QjhJTXFaQWtRblBsSXhoQlRLT3E4bW8xM1RLdHloSXc5RVJGVERTakMvVmFi?=
 =?utf-8?B?Z0RTNjRVTFN5VURGMVJjdHlBaVJhY2ZXeVVwdm1PRytWczMveEkwV2dkQ1kx?=
 =?utf-8?B?ajFWWFBxVDBBRU5KSmtsMFViZDEwWDRvWTNmaTNhREx2SVJqcjgyUHBTOUVo?=
 =?utf-8?B?SmljckZMZ2l5ampXcUpEVDV4cDJveGNGeGt1SDE3aENYc3VGZDJtUkhJU1Fs?=
 =?utf-8?B?bmFhRnJycUVKaEFnTks2QTZ2RUwvZHM5bWtMOUZUa1RqU253QWZleWJES25N?=
 =?utf-8?B?QWxSSGlmc0h0SnZySWpxU1ExNUpEM29rY1NoL3A3NU5IU1NTVW1ZVWN6MERo?=
 =?utf-8?B?SjVUSXNOdmZFa2VFQW56a3FmMkZDTHVHeENZMEpNYkxTSGZhTk9JSmxWTVcv?=
 =?utf-8?B?d0Rubk5VZGNNU0dqaDZUVTdjTmpnRzcrc29iWVh0RU44NGJ4c2ptbUY0QVN6?=
 =?utf-8?B?WUZLM3BRTFJ4U2xYK1dVQkN6aU1nNlEzejFaWmN6d3dGaG44YitGMzhEYy9O?=
 =?utf-8?B?aHJVNU1Fc1JqdTIwRUtxTUpKREVwVCtFWXNyZENjeWg2MmFjVHpibDZwSTV2?=
 =?utf-8?B?c1orOU1WTFZRTnRSa1ZpVDNkYUVkTzFZYzNkeXpSTjRhdGF2ZlJiZmJIaGFm?=
 =?utf-8?B?ckxXWkhMUWJtR1Jxd2U1UGlkTTNOWmtySFV1NSswdlpCSVA4SjFER01abExB?=
 =?utf-8?B?QWh4VDhaTTVsOFhTMDlkd1BCQnZyN2Z5eDA1blczMXdTRzl2ZXN3QVBMZ0Jp?=
 =?utf-8?Q?d1AiYyAiNZULXjtIv9jzkeuZa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cca729-4914-4d26-2e7d-08db5ac4e2b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 13:03:06.6364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l8EEOJqvYABPTPtvlcq3uFt2ZzJC0MWFAUVEIqcZMfnXXWSpPLty6ne/oSmdqu+xLZBMgZouZGzHliTp2aYwgWu0vza5dS05ddv4A6Kv6iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11124
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGNsazogcmVuZXNhczogcnpnMmw6IEZpeCBDUEdfU0lQTEw1X0NMSzEgcmVnaXN0ZXIN
Cj4gd3JpdGUNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCA1
OjIz4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToN
Cj4gPiBBcyBwZXIgUlovRzJMIEhXKFJldi4xLjMwIE1heTIwMjMpIG1hbnVhbCwgdGhlcmUgaXMg
bm8gIndyaXRlIGVuYWJsZSINCj4gPiBiaXRzIGZvciBDUEdfU0lQTEw1X0NMSzEgcmVnaXN0ZXIu
IFNvIGZpeCB0aGUgQ1BHX1NJUExMNV9DTEsgcmVnaXN0ZXINCj4gPiB3cml0ZSBieSByZW1vdmlu
ZyAid3JpdGUgZW5hYmxlIiBiaXRzLg0KPiA+DQo+ID4gRml4ZXM6IDE1NjEzODBlZTcyZiAoImNs
azogcmVuZXNhczogcnpnMmw6IEFkZCBGT1VUUE9TVERJViBjbGsNCj4gPiBzdXBwb3J0IikNCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcnpnMmwtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNw
Zy5jDQo+ID4gQEAgLTYwMywxMCArNjAzLDggQEAgc3RhdGljIGludCByemcybF9jcGdfc2lwbGw1
X3NldF9yYXRlKHN0cnVjdA0KPiBjbGtfaHcgKmh3LA0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4g
ICAgICAgICAvKiBPdXRwdXQgY2xvY2sgc2V0dGluZyAxICovDQo+ID4gLSAgICAgICB3cml0ZWwo
Q1BHX1NJUExMNV9DTEsxX1BPU1RESVYxX1dFTiB8DQo+IENQR19TSVBMTDVfQ0xLMV9QT1NURElW
Ml9XRU4gfA0KPiA+IC0gICAgICAgICAgICAgIENQR19TSVBMTDVfQ0xLMV9SRUZESVZfV0VOICB8
IChwYXJhbXMucGw1X3Bvc3RkaXYxIDw8DQo+IDApIHwNCj4gPiAtICAgICAgICAgICAgICAocGFy
YW1zLnBsNV9wb3N0ZGl2MiA8PCA0KSB8IChwYXJhbXMucGw1X3JlZmRpdiA8PCA4KSwNCj4gPiAt
ICAgICAgICAgICAgICBwcml2LT5iYXNlICsgQ1BHX1NJUExMNV9DTEsxKTsNCj4gPiArICAgICAg
IHdyaXRlbCgocGFyYW1zLnBsNV9wb3N0ZGl2MSA8PCAwKSB8IChwYXJhbXMucGw1X3Bvc3RkaXYy
IDw8IDQpDQo+IHwNCj4gPiArICAgICAgICAgICAgICAocGFyYW1zLnBsNV9yZWZkaXYgPDwgOCks
IHByaXYtPmJhc2UgKw0KPiA+ICsgQ1BHX1NJUExMNV9DTEsxKTsNCj4gPg0KPiA+ICAgICAgICAg
LyogT3V0cHV0IGNsb2NrIHNldHRpbmcsIFNTQ0cgbW9kdWxhdGlvbiB2YWx1ZSBzZXR0aW5nIDMg
Ki8NCj4gPiAgICAgICAgIHdyaXRlbCgocGFyYW1zLnBsNV9mcmFjaW4gPDwgOCksIHByaXYtPmJh
c2UgKw0KPiA+IENQR19TSVBMTDVfQ0xLMyk7DQo+IA0KPiBNYXRjaGVzIHRoZSBkb2N1bWVudGF0
aW9uLCBzbw0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4NCj4gDQo+IEJ1dCBJIGd1ZXNzIHRoZSBhY3R1YWwgQ1BHX1NJUExMNV9DTEsx
XypfV0VOIGJpdCBkZWZpbml0aW9ucyBzaG91bGQgYmUNCj4gcmVtb3ZlZCwgdG9vPyBJIGNhbiBk
byB0aGF0IHdoaWxlIGFwcGx5aW5nLi4uDQoNClllcywgaXQgaXMgbm90IHJlcXVpcmVkLg0KDQpU
aGFua3MsDQpCaWp1DQo=
