Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2011E50D6C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 04:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240272AbiDYCF6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 22:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236668AbiDYCFx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 22:05:53 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569891CB25;
        Sun, 24 Apr 2022 19:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7M5BKruzJ5tk6A86PuC7FA9saEqw4ZjNKDw+2mw12WFlTG8o6o2hYNjimH8KJTj8UVzSlyhmxZQcRaxSjLHIDPCBRFXuMCKjA8dhBMf/27ZJYVz2N104I0kS3Nr6HzMKzi7E3owf3wWW1yPMSUVUNeT3OqnTYEPcu4DyMVWp2J/bj4pZS+As+WzHoocJ6r7U9OnXm8OZVFyRFXL9K1NUpHcfWq5XOztO/q7swcyV2bOmNckbh8c0YJBpiy4fnh4t8O9l32L70jS85bNMxI1cRhzM8bQ+oFhIPar6a8Oafce3kEtxc9scPWV/lqYii07nZ5S1TKp87VyD1heclSSKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeccMR1wGGXW/mSF/EolFinAnsxLzTE+YaENNRjSGx8=;
 b=Xkq1IUuIbnQjkLQ/Wgo5IvHSra0MTYJtLq+K0XIc7ofm8+W6ZJyJTqaaaZdQWjllgV6Ot7jhFwswilV1aq1u26jcUhIomlfQE7hdYHM51zH3TqH698SamAoyoUxw0FfzqpEVfhT2GqJrP+tFNdiRJ5tLinHieB7nJgaGWPyK6NKBcswdB2pG8uwDiUfly9AP6YcBAiCcCsO83LnlUm6ZxIt+z3rCwVoWWQCC1Pn4lYTHUGKlsdjUct5FgeQNRFqItRw27WHlEfTliK9K0/UK/iiDOwmrzyY0LdvbTZ6g5Kl+fV5uwG1Y8fXh+l5DZxY/mRDcLD2pV00xHxhdDZxHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeccMR1wGGXW/mSF/EolFinAnsxLzTE+YaENNRjSGx8=;
 b=KfR+kpaqd+y4JXS2L6ung7tOfxwND8u20X1X7VDvX9sF71uCZMOLviSkKHYrIi49V6n55wpy9KEjMfs5pj0RgNap57e8FZ7XokHCsLOZwCs0pDivASfwwtgVcQbJ6RpmanMm4njovUJgNaD/0zEDwyB49jBUJU4/nSor1pcpF1g=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSBPR01MB4456.jpnprd01.prod.outlook.com
 (2603:1096:604:3a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 02:02:46 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 02:02:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH 07/15] dt-bindings: clock: Add r8a779g0 CPG Core Clock
 Definitions
Thread-Topic: [PATCH 07/15] dt-bindings: clock: Add r8a779g0 CPG Core Clock
 Definitions
Thread-Index: AQHYVJKjJj52YFGbOU6ODr6gZEiy9az5/0WAgAFf3jCAACmfAIAEXj9Q
Date:   Mon, 25 Apr 2022 02:02:46 +0000
Message-ID: <TYBPR01MB534105AE0DF141AE297D5AD1D8F89@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-8-yoshihiro.shimoda.uh@renesas.com>
 <c86f78ac-ccf5-30ad-5de4-33211ca8b351@linaro.org>
 <TYBPR01MB5341D2CAB8DD77E95C14AF8CD8F79@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <d953b4e8-4e0a-8a6d-16cf-1ea4e4bd0190@linaro.org>
In-Reply-To: <d953b4e8-4e0a-8a6d-16cf-1ea4e4bd0190@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1308a004-875a-46a4-48aa-08da265fb16b
x-ms-traffictypediagnostic: OSBPR01MB4456:EE_
x-microsoft-antispam-prvs: <OSBPR01MB4456E04697136A270B5254F6D8F89@OSBPR01MB4456.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZWFJCsklD1ZStYkxVo58L3PnOJGjsLCSQ/S0JIKALZgPoBQ4RIvH9XdCuipw6YeXTaFqjfJkV6cM1mZytMBVWj+RHJrSlQLX2OdXs5UXc9AQZ3tKTMES2iiXxnIu7p53gal8AyaSvvmoSGMhdOvSv++e5sUCEj0zGx51OIXd1obvfwMW1jBMWQRYZvLcsZYjtE4s7pVPbOmSHuIW5je5VkNrewOE2G616jHS8628yADBmA9clrxk9qddh0bzfprNBv9IIMkkj95ORrGbCsGeQY0ocFot4Jsfrp1eF3thAJlitIfYSKVzBJgDpme4b5dhXJKlowbu0/Bz71bOMs5OCaRHty9whDWbVsuGbTdbbtcKyWEUV2k9BqJeOpxfd77NhF6d64bsqG/qZoP4AEimQ/b7xcA01XooPXNMKisoIhC703eHH2acPMTy4AFoM3zrlhIA2kbpy0BXIhmeAMXdkBRVGaRr5rvvdY3bW355mOQ1wfAUDp7Pf/POYcK1xTxQcFfwccQGUx/gYwqmA5xcyf2B2WV/1codZSD+OwGAjb4mUcOQS99uW/7g26Gqmczf17BXFi9waBTd+wL0AyJ1RBS6LyE+VNUPCeo42weooE+7z4FjYCcPOH0P8O7n+t1AjflWTAK3oyAELCePmWLwhzA4UX7EHaaoz2XvRkautrNdEZ2T0L1036h8jsj0nla9QfMSzXZPX7jr/5Oati8ppw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(38100700002)(83380400001)(38070700005)(86362001)(186003)(110136005)(52536014)(5660300002)(8936002)(55016003)(33656002)(2906002)(508600001)(53546011)(54906003)(6506007)(7696005)(64756008)(66446008)(66476007)(4326008)(66946007)(9686003)(8676002)(66556008)(76116006)(316002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUxsWGk4bHZIRWlXUllPOThDVS9iVFJHMTNDUHlWeHphMGFiZWZkdWZidVlS?=
 =?utf-8?B?WE9Pd1Y0T3QvY1JrbzdObFhoVEhaeGhFZEFyR1ZuSllSampIOHY3cld0UUdC?=
 =?utf-8?B?VE5uTkpjUEgxTHNQeU5vTVJoaXlGMEVZYWg3SHJMWVA1blNGelJPVmxvOEhP?=
 =?utf-8?B?akErZVhaSVEwWHNnS2VrMVhySTB1WkpuT3pJTG5UcnZsbUhDT1FBZG1vTk4v?=
 =?utf-8?B?Q3R6elU2bks0TzBnQUdpUVY1SkR4dTZlaXQyaExNV0RRc2x4QW1QNlJaU1F4?=
 =?utf-8?B?ZCt4MFNwNXpYWEdHNFZiZU5GTmIrNS8xZDB3K0I1WmFZMFlHcWdUMS9aS2Uw?=
 =?utf-8?B?OFBYY0R1TkVrbW9FT0xYTDhRZDJCcGdVd0ZISGJmV093ZGRuWkhnazdMZkZF?=
 =?utf-8?B?R0hTcGpOcmN4ZTEyQ052Zkw3UmdhejdLcjczRkxjeStoNGRjUGVhaWxMUlkz?=
 =?utf-8?B?NDd6Q0ttbkJmTitiaXIvK3YxajZycUxUL0kvMlJTMDJmSmRsWkY0clF3dEtV?=
 =?utf-8?B?d0FoR3FCdnp5QjB6cU1tWUE5aVpwSmE0Wkh2SXcwWlRIZFNteWJCVUhDeEs2?=
 =?utf-8?B?SjVucmRvQ2J5WS8vWkNCdms0KzF6Qyt4a0YvcUM3Qk9zT2JuaklIeGZyamdP?=
 =?utf-8?B?QUJDekFHMUg1aHBNVElMRWNsYUFzZ3BLT0t3VzBlSjJHbzJ6MFc5NUYzZmta?=
 =?utf-8?B?MGc0UjlCL25KeGFKdUNLU1AwcGhINXE4dmJiVmI0YnRsdE5hL2ZzdUpaRmlq?=
 =?utf-8?B?VXJzeXlwQmQ4b2hqK0FVdFR4NWxqRHNIOHVYMDdoR1dsNXdLRStZVTNnazVV?=
 =?utf-8?B?UmxQbmMzOEEzUG9IUWxjZksvYTFFMTIyWVhHNXFyNWdGd1IzelpMOENYTE1a?=
 =?utf-8?B?dTEvSGNlejVBUG56akZCdUZ1aFArZDdsMkYzMVlkRDRoejlmNnFjODdnS3Z3?=
 =?utf-8?B?Y3hEMk1ieGF1RXVGU21DYXdKc2VIeEwyNU9kSmZSRld1OXFnVzRIRzhoZXJt?=
 =?utf-8?B?ZHZqTldjMk1peXhIZko3dDI5UllTUzJ6REpiWEN3eExtY1ZVZm95VGs1ZFlz?=
 =?utf-8?B?Q21FZmFzWTdOWVY1bkFNSG8yb1FmdWFzQ1RSTTBoVjNiNmhnMUdRanFQT3lk?=
 =?utf-8?B?V2JkcDU2ZVAyZWw3TXUrd25PSjh5bWVGMkZvVmgvUXFHdmh0Yk13ZzF3VnRC?=
 =?utf-8?B?RGpjN0dnTmFjWUtOZjFwMGtCQlRKZ0NrVS9jeUFaNzExR2I4Ny92SzlJVjV0?=
 =?utf-8?B?Y2pzWmVzTmM3SUJYa3IyMEI1Y2dDVEZIMzZxYzlYL1VvRERHR3V2dTJXNEJE?=
 =?utf-8?B?Y3RxeUJ5YnlZa2x5dzZtMkQzUGs0TlV6OVpvYmtIeVdQU2ZlY3pNK0dJZVZL?=
 =?utf-8?B?WGF4Wncvd0g5WmlOYVJnK3I5KytjNkY5d2pNRDFveUdhUjZKZm44S045Wkd4?=
 =?utf-8?B?bmw3dEsyZitxNHMvdU84UC9uQTV1UHE3Y2Z5ZDN1aTMydURyWVRKejlFMUh3?=
 =?utf-8?B?b1YyeVhGUlNLcHZzeWpacmUwMHRjZFBId1dwM1hRMlNLNjVaT3Z0RmgyM1R5?=
 =?utf-8?B?U1FCOVdHMDlOOHZpdTJ5Y0hqUzBoVXdPc0V1LzJtMzkyZ0UyWjVqdktESWI1?=
 =?utf-8?B?ZE12UytRMDhROU5ieVF5WlFjaEZuOVBNbmp6WGowVTZmcCt2OFZLSk1aV1J6?=
 =?utf-8?B?Vm5Md09BOGN6cUNzaFh0YWxxSy9pYVBScHFqbXVsNUk2Z3NvcmtkaVJKckJO?=
 =?utf-8?B?OU9CcDhKd21Kbk5FWmhYZ0czQWZ0OTVZbUJVVFM1N3BRWjNhYUtYUUZJc3FZ?=
 =?utf-8?B?eThUTEV5cThzVWVON0tjek9OMnZsQnpZNVBTMzZ3NEZOeUlMbGIvckJCSkhV?=
 =?utf-8?B?QTVLYk8ySG1GeVlvbzlzNjV4dTdrdFFJbnFtSmlLbXQzNGoxR1Z2TTU3TS80?=
 =?utf-8?B?MCsxSStRTFVVa0ZJVUl2dXlwblY2U0dCeWtlU2xTc2VMbGNvZUdDbXJRUnNX?=
 =?utf-8?B?Y1IwUHNaS2tTVG5rclg4N0pOREhsMFJvWVkyekIveXN5alpneklDUXJVUElX?=
 =?utf-8?B?b1pSVmozV2FCbzVBYUtoam9ZV3dPWVpSNlAzVkJHOHZNQ3hrV2VjaENJQ3ls?=
 =?utf-8?B?ZjN6TUN2UnZSNWhYOU9NYkxtM2ZyYis3REtNaDJVbGgzMjVGNDJmZUp3U1pq?=
 =?utf-8?B?dHhPekx3T1NMRytQUlVJc3pEL05ET2VUSGlWa3J6K2FNbFNGbkJySDJJTmNF?=
 =?utf-8?B?clJXalQ3Q1NnWWl5U1NPcE44Z3lsZDdiTEtFdzJ1MUpqTzl3WjJZaEVGWVM2?=
 =?utf-8?B?eStsMHlIYWdBNlJaNXJxNFp2SnFGRVVNZFRWa0hudklmU1g4ZEZIZU8wdnZC?=
 =?utf-8?Q?9cMQEgFBHQw+63R8i6kUgfTicHb6w6cLAkw6dJhtWzBqB?=
x-ms-exchange-antispam-messagedata-1: AYoZLZKf/HrK8w1uHF8JLQmEkCzbE6bA+oc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1308a004-875a-46a4-48aa-08da265fb16b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 02:02:46.6224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nXY2fZrA4E2SJxjJZZdy4Zsb2kZY3i4/hx8ObBm8eh1cduEEloB9e+6PbZiqAP2uE6/NTdltyFIO3VY43x3/DMo4dsa+COVK4h6glWff+f7Y0KTBmkX88aG1tC6hl5FO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4456
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dza2ksIFNlbnQ6IEZy
aWRheSwgQXByaWwgMjIsIDIwMjIgNDoxNyBQTQ0KPiANCj4gT24gMjIvMDQvMjAyMiAwNzozMiwg
WW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+ID4gSGVsbG8gS3J6eXN6dG9mLA0KPiA+DQo+ID4+
IEZyb206IEtyenlzenRvZiBLb3psb3dza2ksIFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAyMSwgMjAy
MiA0OjQ5IFBNDQo+ID4+DQo+ID4+IE9uIDIwLzA0LzIwMjIgMTA6NDIsIFlvc2hpaGlybyBTaGlt
b2RhIHdyb3RlOg0KPiA+Pj4gQWRkIGFsbCBDbG9jayBQdWxzZSBHZW5lcmF0b3IgQ29yZSBDbG9j
ayBPdXRwdXRzIGZvciB0aGUgUmVuZXNhcw0KPiA+Pj4gUi1DYXIgVjRIIChSOEE3NzlHMCkgU29D
Lg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhp
cm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gIGluY2x1ZGUvZHQt
YmluZGluZ3MvY2xvY2svcjhhNzc5ZzAtY3BnLW1zc3IuaCB8IDg3ICsrKysrKysrKysrKysrKysr
KysNCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3I4YTc3OWcwLWNwZy1tc3Ny
LmgNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9y
OGE3NzlnMC1jcGctbXNzci5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9yOGE3NzlnMC1j
cGctbXNzci5oDQo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+Pj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4wN2E5NGNmNDU1ODENCj4gPj4+IC0tLSAvZGV2L251bGwNCj4gPj4+ICsrKyBiL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svcjhhNzc5ZzAtY3BnLW1zc3IuaA0KPiA+Pj4gQEAgLTAs
MCArMSw4NyBAQA0KPiA+Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBv
ciBNSVQpICovDQo+ID4+DQo+ID4+IEFueSByZWFzb24gd2h5IG5vdCBsaWNlbnNpbmcgaXQgdGhl
IHNhbWUgYXMgYmluZGluZ3MgZG9jdW1lbnQNCj4gPj4gKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpPyBUaGUgc2FtZSBhcHBsaWVzIHRvIHBhdGNoIDUuDQo+ID4+DQo+ID4+IE1JVCBhbmQg
QlNELTItY2xhdXNlIGFyZSBhbG1vc3QgdGhlIHNhbWUsIEFGQUlSLCBzbyBsZXQncyBzdGljayB0
byBvbmUNCj4gPj4gKEJTRC0yLWNsYXVzZSkgZm9yIGNvbnNpc3RlbmN5Pw0KPiA+DQo+ID4gU2lu
Y2UgcjhhNzc5ZzAuZHRzaSAod2hpY2ggdXNlcyB0aGlzKSBpcyB1bmRlciAoR1BMLTIuMCBvciBN
SVQpLCBJIHVzZSBpdCBoZXJlLg0KPiA+IEFsc28sIHI4YTc3OWcwLmR0c2kgaW5jbHVkZXMgZHQt
YmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oIGFuZA0KPiA+IHRoZSBhcm0t
Z2ljLmggaXMgdW5kZXIgKEdQTC0yLjAgb3IgTUlUKS4gU28sIHVzaW5nIGl0IGlzIGJldHRlciwg
SUlVQy4NCj4gDQo+IFRoaXMgd291bGQgbWVhbiB3ZSB3YW50IHRvIGxpY2Vuc2UgdGhlIGJpbmRp
bmdzIHRoZSBzYW1lIGFzIHdlIGxpY2Vuc2UNCj4gdGhlIERUUy4gSXQncyBub3QgdGhlIGNhc2Uu
IEZvciB0aGUgYmluZGluZ3Mgd2UgaGF2ZSB0aGUgc3Ryb25nDQo+IHByZWZlcmVuY2UgLSBHUEwt
Mi4wIG9yIEJTRC0yLWNsYXVzZS4gRm9yIHRoZSBEVFMgLSBub3QgdGhhdCBtdWNoLCBqdXN0DQo+
IHJlY29tbWVuZGF0aW9uLCBJIHRoaW5rLg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3Vy
IGNvbW1lbnRzLiBOb3cgSSB1bmRlcnN0YW5kIHRoZSBmaWxlcyBpbiBpbmNsdWRlL2R0LWJpbmRp
bmdzLw0KYXJlIGFsc28gdGhlIGJpbmRpbmdzLg0KDQo+ID4gSW4gb3RoZXIgd29yZHMsIHI4YTc3
OWcwLmR0c2kgZG9lc24ndCBpbmNsdWRlIGFueSB0aGUgYmluZGluZ3MgZG9jdW1lbnQNCj4gPiBz
byB0aGF0IHRoZXJlIGlzIG5vdCBuZWVkZWQgdG8gdXNlIHRoZSBzYW1lIGxpY2Vuc2UsIEkgdGhp
bmsuDQo+ID4gIyBJJ20gbm90IGEgbGF3eWVyIHRob3VnaC4uLg0KPiANCj4gSWYgeW91IHdvdWxk
IGxpa2UgdG8gZm9sbG93IHlvdXIgcmVjb21tZW5kYXRpb24sIHlvdSBzaG91bGQgbGljZW5zZSBh
bHNvDQo+IHNjaGVtYSBhcyBNSVQsIGJlY2F1c2UgeW91ciBEVFMgdXNlcyBpdCBhcyB3ZWxsIChh
cyBhIGRlcml2YXRpdmUgd29yaykuDQo+IA0KPiBBbnl3YXkgTUlUIGFuZCBCU0QtMi1jIGFyZSB2
ZXJ5IHNpbWlsYXIsIHNvIHRoZXJlIGlzIG5vIG11Y2ggZGlmZmVyZW5jZQ0KPiBoZXJlLg0KDQpJ
IGdvdCBpdC4gU28sIEknbGwgY2hhbmdlIHRoZSBsaWNlbnNlIGZyb20gKEdQTC0yLjAgb3IgTUlU
KSB0byAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkuDQoNCkJlc3QgcmVnYXJkcywNCllv
c2hpaGlybyBTaGltb2RhDQoNCg==
