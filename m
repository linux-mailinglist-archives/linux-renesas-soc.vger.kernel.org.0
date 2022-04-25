Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7070250E636
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 18:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243594AbiDYQzZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 12:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237665AbiDYQzY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 12:55:24 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB451A04E;
        Mon, 25 Apr 2022 09:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqFlRrPDi2flRvwd5C4j899TZeshFVySf9ONLzF83Kekb6ogwS7goNSj0ZLCEBQ7a0J5H4p0b7IXJv0AD78mivCqELGcBxcMf0qs3fMkc1Clqnh+89ank/Maqexd4ljtXBGIt0Hp94x5PMzIkm4Q8j9RuUDfpU1V3S/2l4SbbH7mac3+raUnkn+gJgaPH+O6JkMufk4P+HwDtdTOdWo64KwsKguM5SBE+qpKlEsieRAcYFJB2XuRcO2npe87j3VCmXhdlzRqGJJLmE6xmWnb2dKBTxnWNW72AqO4LnZLceK6avCzH4L22lFOG2dwcDMTKS4EMku5lvY7pKYhsYXySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZP8PY+BIJmNHPo5PP5t3XRV4VWK/56xchgXBGT1BahY=;
 b=F+lhM7lpbT2p8s7ofC6CdXTIt9tCOLHZmJpRH3dqRlP1AGdK0pzuRZaw+dUGX3EczGsu+hxstN0q6q22v2+3MiGRnLv1tI/6gaLq2CyHeNmxMCEhxiCKTBLOFIcGhWKRgbU83ya8WzK9/yd/0wXBS+Q4HDB6Af5ANyS3ddWQ3aToR+f9YkDK/38gTuiFNKT5ub6OSAAlHPqtr7eleHOw+UaRyia5zcEe9AFTMrbQAieg0mnS8hu2rJYyrsknf6lS4CuRbayMIfYRxRbC8FcP1bO7erbO+YqVfJlkSmdRZphwT7m/TXLSx93tBhhpIlDgXhwlV/Ni/pIotMP94eIBYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP8PY+BIJmNHPo5PP5t3XRV4VWK/56xchgXBGT1BahY=;
 b=NjUnP1XR3Giar7uv7OmLBqLB2c0UXW38RTwy3qmOKnNRzjFUHZuDn3EYxXNS5KDT/e9IngnCrjZVMVZsuBcLQn/Jv4dJvnRQwOjWCVKD1WZjFveMZVxCRqAa7lZfhGM9CxP+stzNrKUaNUSJDDeAWI5rppyr2mi+YI4WJudlKgA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8128.jpnprd01.prod.outlook.com (2603:1096:400:102::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 16:52:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 16:52:16 +0000
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
Thread-Index: AQHYVxtpZzDNpS2cMUqYhuvLl0rlk6z94/kAgAC6McCAABNF8IAAJb8AgAACQVCAAEqYgIABnhbwgAAIFgCAAAN9gIAAB4gAgAAF7FA=
Date:   Mon, 25 Apr 2022 16:52:16 +0000
Message-ID: <OS0PR01MB5922708AEBE98ADEE3799FF286F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423140658.145000-1-biju.das.jz@bp.renesas.com>
 <f9c6e5e2-c819-d309-0c11-b87deb772858@linaro.org>
 <OS0PR01MB5922CFACC8FEC6D67E6BFC4986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220968EBDF76A16F7E63A386F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <7bd2ae6d-c55f-4ab7-0c98-72da0d5d4050@linaro.org>
 <OS0PR01MB5922619EE8816DA1676BAB4D86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ddf78c65-7cac-04cf-9f8d-e19335815473@linaro.org>
 <OS0PR01MB59222BF5C0D4749C8AAFC57F86F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <886fda10-fad9-83c4-10f1-1ae36cf0a6b0@linaro.org>
 <OS0PR01MB5922AB6D16AB716FECAA140786F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <d3fbb3cf-19e2-a2ad-1976-f9687150a866@linaro.org>
In-Reply-To: <d3fbb3cf-19e2-a2ad-1976-f9687150a866@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09073c31-fb05-4ff8-28d9-08da26dbf449
x-ms-traffictypediagnostic: TYCPR01MB8128:EE_
x-microsoft-antispam-prvs: <TYCPR01MB812898FF742DB2994C1F6C5786F89@TYCPR01MB8128.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gZX2ZZfZEEyQ2f4dZ7mPJcdqUSbToJBISAlj2AlK9XTDWlklvOt5D2u+zun3WSL2+zMYt2I6+J8y6khThNIj68BfJqlRLvj3adleWLY6SzRsKuu/ssdHgVqghyEPkV8h2vMVBKwQVADMCk96ha69tP/4udOffkT93RNt0AOtuA7Ahgmai0xqRtX3hRI9KL7FldUQ7NiVXj4W4gt/qwwXfxBBREVOXrWJBZczPlg7oYqE7S+i2/DdINPcK6QuRoV+87kXqjtfUIboGsfRTNn+OTkFTamAaz5Lk71dFe0cJx68mRb1ghmyxBSU7vJM3ByGXwZ6SMzBEs0IP+ljrMSRfY+5sjv/6D4QZk6wtLhwVXm/0wB24tWedckhoyWJlSGe+0cV+0TDaHI8yUAWDAEm8o2eB80ylV2GpaMUHcYPQHOygCgv1b5NaOa2YbTOTyOe3z6gwafZ0x9/zDITTLuzxRe8rvBWKb9Tes0ScAPeyrHp68AdWS4EDIp1JnliEw59k94OjnYK/+ZFB1FC2OmZVRf517qk+5nlpgGjQvzmbgA2xyvkDZvlQvjdn+oEdgN/UMP9WWaFl0YcPn3DMDimB7rxcrDHZoflM+sTlIxhoPXrTHTJp0krulI4rkypMOCaa4bzqcXDeqxk2VaRw4i63qj3W/03VruZM8pfBSCsS6krXjQD2Trgs8fGk5uhm/78SVtenEiLL07giZRWGQMnmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(64756008)(66946007)(8676002)(316002)(4326008)(66556008)(76116006)(53546011)(8936002)(66446008)(5660300002)(52536014)(26005)(186003)(508600001)(107886003)(6506007)(54906003)(7696005)(4744005)(66476007)(110136005)(9686003)(71200400001)(38100700002)(122000001)(55016003)(38070700005)(2906002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3ViRytHcHhhMUJQRE03aC85Q292TVduRk1tSXFJc0lld0RISkFyMkIrVzRz?=
 =?utf-8?B?ZytvY251aG9XUkxKblcvQndWN2IxVWpTVmJEdE5hTHdEdSsrc00rOEJMMHE2?=
 =?utf-8?B?NmczUHFjRzdPNnBGNE9uVnoweGlwYVl6TGlGQjBiTHp1T3VuaWJpZzI2RHZJ?=
 =?utf-8?B?MnJLbG9lRzdyUkNTVzhoNkdqdEMvR2JJR0tGOTV2T2VsZkhIVU5xMWVCVUMy?=
 =?utf-8?B?dVBKNUR4WGRaYk1hWG1MYjdtMnErSzQ0N3p2WnhCUEQ4TTVjVDl2emFGMW43?=
 =?utf-8?B?N2dLUWxNRGp1NjFDM0pEMHk5Um15ckZ4WXBkMDFyUUQxTFNLMlE0VDRtLzJJ?=
 =?utf-8?B?YmQxM0ZOZWY4MGVpZW9OMzZSZTd2ZUJSa0M1WG1ka2k0U2UvZ09zS0s5NzF4?=
 =?utf-8?B?dDZmVlVlVTZxV3BpRnVXWWRIYTFNaUJSdzBxVlFoWEl3cXl1czBIbk1NenRl?=
 =?utf-8?B?WkMrS2ZsMlVoc1pUWkVWcGFWN1V0QklsaFhTcXhaVzFIRWorVUF1YlVLbEd5?=
 =?utf-8?B?SlFHSUM0T0ZmM1E0WDRydjVaTlkwa0hObUdST251KzdheWpJZEN1eGs1eWxO?=
 =?utf-8?B?aGVkTjR1MGpSU0I2Tzc3UFlpL1p4WjRKdW5RMVJvL1hyQ2Yza05sZGlKdHBK?=
 =?utf-8?B?L3J1T0pja2ZSQWJITlM2T1dxclVLMlVjSGR1QjZwYzFzNnBzdGRFcmNIbUc0?=
 =?utf-8?B?STVTNFk4UmwzcWcyNXRaTk1IcE5KQ0ttYjhMNUZ6OVBaMW5Wb2h1cEFWNklo?=
 =?utf-8?B?cGljOXE4YzE1R1pzMEVSOXBqVFdEV2FPN1IwU2xGYTNyRVZVTmFrSHQ3bGlM?=
 =?utf-8?B?UTU2WHlMaGZscWszSXMyNmRDWFVnQUtVVjFzUDBpT2xMcGpnWGlUemdTd0dt?=
 =?utf-8?B?TmIrc3ZxVlk1VGxaeUwwa0t6b0w2ZXlkM2RWSGpXMXdEUkV3WVU2Q05oK0k0?=
 =?utf-8?B?cHAvN293VXJsM0RobS9XQlVOT3NYeW9rc09WYjE2V0dkZUhUWWlaNG5xQ0xz?=
 =?utf-8?B?ajJxTFJDWHFCN2NsK0YyRmdIRnpVYTl5UEVCMVNLOEFsbUNQZDZZdllIVWZT?=
 =?utf-8?B?M24yLytoT3NYZTd1a3JEM3BJbE0wUEplTmxjeFl0NHArWGE4NzFhWHNNWStK?=
 =?utf-8?B?VDBnOHQ2aXFhMDM5N2hvN21Ja0RVdkxHTE4zcFpVOS85M3paQTVzVUtqQTBY?=
 =?utf-8?B?eC9KWjdSM2xqY2RvSE16SUhKVTZ3MERlSkdnYWJmYU1vQnUyVkN6U0ZYSDdE?=
 =?utf-8?B?dDV5UHdLZTRUZVVKeVlIRThZV2QwdjBZZ21aTGVhb1N5QkJkOWZIZkFwNEpY?=
 =?utf-8?B?ZytaZ21VM1NvMXRmLzY3aTU0dS9mVzBKdXE3cHZBT1ozeE9sTUJaY3RsTEpV?=
 =?utf-8?B?czNYam52ZWRNU2VRd0NoZDMvRUV2bU82Qy85YnhidUdiRU5ZbzZuMTRVc1NC?=
 =?utf-8?B?WG44ZHIvM3lRSmJWcXVPM0ZQR2JSUmdqcHdhUyt4MFpnMXBCV0VrcThVMTRE?=
 =?utf-8?B?L3NiWHpkNUhiMWR1UUJmemt5YUtKNDV5NFlEdStNT2xyUkVwQ29RTlRZWVFa?=
 =?utf-8?B?eEwwMUdzbEliYlQzVUZxTHZnNXNtNitIUlRCaXg0WVhIRXdWQWxSRU10TElv?=
 =?utf-8?B?ZjVNTHJ2M2VMdTEzQzBSVHpLeDRtdVZOMU51cGV5aU5lNW9BUENIV1ljZkxV?=
 =?utf-8?B?OGRHVW9Kb2NHeFN1TEgwc2c0Q244NUxDSWwvcTNhZ0Q2SHlLdWxUcUFyZkFN?=
 =?utf-8?B?Y2FmQ0ZSWkdkVHZvRlJOQVB6VGF5RU1NOEIyWjFuZFVNMmtEbzg5VXE4RUEw?=
 =?utf-8?B?WWdmNzc5ZE5tcGdzL3FHNnUvcG9ZdzM2L0grZml6SVp1cnRPUXQrV0hJZjAw?=
 =?utf-8?B?YUFKUzNMSVR4SUJHd2VrZFk5OG1SeTNjY3ZDZWZmOVMzMTQwL1ZqdUowaGVz?=
 =?utf-8?B?bjRETnI2VUR2ZGtDZzUrRjlGN1ZrMWo0ZEVYcnE2dWk3ZVFHdHFPWk94Lzlu?=
 =?utf-8?B?RHp4YVp5OGFXZDd3RUxCeWV4OTVwWnBrckF0RjFKZWdIVXZJM1oxZU44UVV5?=
 =?utf-8?B?NmZaclIwRW1NNU1VTm5GdWRjQ3hYUFZOb3k4UG9JTWVCZ2tZdVVFVWlIZFNl?=
 =?utf-8?B?Qkd2TDdJQTVRYXUrNXloS2x2Q092bEI3YjJXME8zNVgxdWZGYWlZZTdtanVJ?=
 =?utf-8?B?QWF0N3lOeHg4UzcxYjh0T1dXdS9nVmlYQW5EWVR0SnlZcyt4RE5ReGY3U2gr?=
 =?utf-8?B?T1RqVFBtNEVMMHBubUVmcCtTWlR5ZjNvSmplZ1gxeFpqVmJEaXRxSENkYTZo?=
 =?utf-8?B?VlVDZ2RGUkZ6Zkw1a2d4b25YTmtDQ0hsOEFxanlldXhCQ1p1ZGpHMG1oYkpP?=
 =?utf-8?Q?07d6NBIGUp065g9k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09073c31-fb05-4ff8-28d9-08da26dbf449
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 16:52:16.4006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HQIUn7VVT4xBn5MiI32cr3q7oB95WP3/BK+RTVLi+7m9t/qSUIZksmEocU9JoMEZz39DxuFNx9CL88QfXVhAlLPDXyDRA37haNcvvyuwP7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8128
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gYXJt
NjQ6IGR0czogcmVuZXNhczogcjlhMDdnMDQ0OiBGaXggZXh0ZXJuYWwgY2xrDQo+IG5vZGUgbmFt
ZXMNCj4gDQo+IE9uIDI1LzA0LzIwMjIgMTg6MjYsIEJpanUgRGFzIHdyb3RlOg0KPiA+Pg0KPiA+
PiBXaGF0IGRvIHlvdSBtZWFuICJvayI/IEkgc2FpZCAiY2xrLVswLTldIiwgc28gImNsay0wIiwg
ImNsay0xIiwgImNsay0yIg0KPiA+PiBhbmQgc28gb24uIE5vIHNwZWNpZmljIHByZWZpeC4NCj4g
Pg0KPiA+IEFoIG9rLg0KPiA+DQo+ID4gQXMgeW91IG1lbnRpb25lZCBhYm92ZSAiZ2VuZXJpYyBw
YXJ0IGlzICJjbGsiLiBZb3UgYWRkIHNwZWNpZmljDQo+ID4gYXVkaW8vYXVkaW8tWCBwcmVmaXgg
b3Igc3VmZml4Ig0KPiA+DQo+ID4gU28gYmFzZWQgb24gdGhhdCwgSSB0aG91Z2h0ICJjbGsiIGlz
IGdlbmVyaWMgcGFydCBhbmQgIi0xLWF1ZGlvIiBhcw0KPiBzdWZmaXgsICJjbGstMS1hdWRpbyIN
Cj4gPiBzaG91bGQgYmUgYWNjZXB0YWJsZS4NCj4gPg0KPiA+IEZvciBlZzotIElmIEkgcGxhbiB0
byBtYXRjaCB0aGUgbGFiZWwgbmFtZSB3aXRoIHRoZSBoYXJkd2FyZQ0KPiA+IG1hbnVhbChhdWRp
b19jbGsxKSwNCj4gDQo+IExhYmVscyBhcmUgbm90IHJlc3RyaWN0ZWQgKGV4Y2VwdCB1c2luZyBb
YS16MC05X10sIG5vIGRhc2hlcyksIHNvIGl0IGlzDQo+IHBlcmZlY3RseSBmaW5lLg0KDQpPSy4N
Cg0KPiANCj4gPg0KPiA+IHRoZW4sIGFzIHBlciB0aGUgZGlzY3Vzc2lvbiB3ZSBoYXZlLCB0aGUg
bm9kZSBuYW1lcyBzaG91bGQgYmUNCj4gPg0KPiA+IGVpdGhlcg0KPiA+DQo+ID4gImF1ZGlvX2Ns
azE6IGNsay0wIg0KPiA+DQo+ID4gb3INCj4gPg0KPiA+ICJhdWRpb19jbGsxOiBjbGstMSINCj4g
Pg0KPiA+IE9yDQo+ID4NCj4gPiAiYXVkaW9fY2xrMTogYXVkaW8xLWNsayINCj4gPg0KPiA+IENv
cnJlY3Q/DQo+IA0KPiBZZXMsIGNvcnJlY3QuDQoNClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRp
b24uDQoNCkNoZWVycywNCkJpanUNCg==
