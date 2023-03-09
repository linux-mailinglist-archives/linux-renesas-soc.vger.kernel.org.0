Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93FB6B20B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 10:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjCIJxZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 04:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbjCIJxR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 04:53:17 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2135.outbound.protection.outlook.com [40.107.113.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0F2193F6;
        Thu,  9 Mar 2023 01:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzcHVHWCzKChuq9Zrhp0VbHs9L0jxEq+3wtlTIG2ztAChYI95DsgzP6djVD7Z8QIXzXwlccwdX723I+1EFPpbHKywxf+6ZS4bQpq8o3NR4hBsUY4buOJ4yemELD5xampXz1OvRiTZ5y2lRH/2+19P3c1nWOcCC7ha5wffJn7Q8viZhFiig6ThSiq8YTP/kRemJlmn+USl7krVvd20VtHMXBEdPiGw8WXM66rIwzLkE4TN71293HoN7hHOdyF2JVudiK/EIF3L1mQEa5+fGLX3JA6WLR8YZ9Q0dR/YsbYYxIp6XmDjXE3cLrs+/R4ImmVsJTtMP6dO5kL+ROXOD4HoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n454bL5sdUQD9sA3tr1tjjMRlGPuELn28M8ZZG/32tI=;
 b=ntQ0hd3Fe73AKdixGwtRQl8yBhG39izeZvT9+V86elpQiDeLNai9HYlC8Nf9vPtL5CJROp9D/vgILTgAyuTsMgRcTY9LIRxARfJoQme3hJ4ncjv/VmANeOJWMFOqq6NKoNXmTFQBKA8jHYJ0zuFnn/Y/wh2j2A0QimehMIHykyNgcVafocv3l4vROepnD6YF8yd1/y6vVOM1HvtcT0QeelM8mh+pGnb1AXgzxq5NVkv06jLJFQE9Qy3gTtSr8FLx+YO9QSnbTfS6mEXpaeiThIqnUeohn3KPe/ddAV1Sa/fNR2JdPYJ0YLX5/LxcwowzFFxEF2u+WFVybf/Pdmh3CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n454bL5sdUQD9sA3tr1tjjMRlGPuELn28M8ZZG/32tI=;
 b=q7hHjDDHkLz28zpWo/TF3ZhIROUQ73IW1V6SjUvVsF9dl08n0oRni6UEMO34fMNM3jnfUIR1e0bV6ynUN8+4tA7dxDGd2qUAyqHQl4Dvh+UR3vq59TAA8MsbAm5Zk/O84YVQoCjAD9hEdNSuEilyjDH49gUZcRgligOq6aW4Vfs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5839.jpnprd01.prod.outlook.com (2603:1096:400:45::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 09:53:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 09:53:03 +0000
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
Thread-Index: AQHZRS0aT95BTvtLwUKgslaMkC+eWK7at0aAgBZQ9vCAAEpeAIAAAIEwgAAHzgCAANKNMIAAFx2AgAAAUHCAAAgsgIAAADeg
Date:   Thu, 9 Mar 2023 09:53:03 +0000
Message-ID: <OS0PR01MB59222B5A8747EC2B682AEE3486B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
 <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org>
 <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <6cbe6c71-2d2d-0f79-1270-7f8ed2ddc1d6@linaro.org>
 <TYCPR01MB5933650D5BAB7A3F4BE03BAF86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <984f1689-459e-bd26-b96c-6c759417b3d1@linaro.org>
 <TYCPR01MB59335607AE6A2F4FBBA46ACC86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <bc9e8ccd-9f98-6fae-9491-dc2bd96c2e4f@linaro.org>
In-Reply-To: <bc9e8ccd-9f98-6fae-9491-dc2bd96c2e4f@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB5839:EE_
x-ms-office365-filtering-correlation-id: 7587bf1c-2e97-4a11-a990-08db20841352
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TCeeKh/IqtxGJ08sVgHJs5Ln8f8pMa6U074zCSDjAVKqhOv1sYUISQdCuVTevI+EYsPVqulqZxX0JPqE0UYhdPfYLvIo5+LdnyZU60fx0lxr7Pkjwq167KL5VO4+uzmbswvrzii3NzodnwPWnmINh+DHsyHmW082qTicPdCPdg+eR8YIsVtOMqgVTjwJXIWtiCoPwgTtcjyrzX7ZHkBM3CLqXNhfhdms/RwBII+W4rGegmUFkEDVNxKP5yv1eeK1j0m+L6qVZKr+LhgMHaG1zr4vcBrWIVCuscWaAcuM5zZ7gJ6PJg6UKXvt5J8/bsxEXN+aICGw4h6azwzE931OR7qf9D2OZIxizwV9CcIedxEIsRfB+UlwK/VEelpf+Qa2HnXOIIFuTp8h5PyOfn01s+sEs8KwdgORR43tYbXgl0HVJEmqz+25criDhIgBWlKx+tj3AzTlLrE0Wj3DGdq6YjO1cu5y2pBXDLlyFMWGYXTB/vbwHLHaPKOMO0D+14bBsm7Z+fGtmjl2Gmhp1Q705h6PdUfqM4VcphQKXF4k8qrOOIkXsZbCItVqOYWsZB3LDIbE+lgZQfnpsJjvWXsbzBMxSvcGhFc3PKSLBGHL3KtD0fYpdFuNTn7PNNIQtyrWR5eNyH4+G7D4R6bTsvOC1mVdRJxPo4WDUAQUaRHFW1elXKvHsNRKix/xVjHFJTg1uumGwuaC/RPIqFJXU6Cttg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199018)(33656002)(478600001)(83380400001)(107886003)(6506007)(26005)(53546011)(186003)(71200400001)(52536014)(66946007)(76116006)(64756008)(2906002)(86362001)(4326008)(66476007)(66556008)(66446008)(41300700001)(5660300002)(9686003)(7696005)(8936002)(8676002)(38070700005)(38100700002)(316002)(55016003)(54906003)(110136005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1U0c1V1Zk5iL2x4U0ZUWm5aN2Njd2VyNXBWblNWb3ZKYjRNaDF3TDZ5TThK?=
 =?utf-8?B?Tys4Q1dqRWczNmZlOHk5MkcxMnJGdTJVbkdtUUhFYmxOT0tCZzcxS3ptUWMw?=
 =?utf-8?B?b3B5aGRad1BRSEtIVSt1UmV4bS80NlJNdDllYUgwRTJHRVFEWHM4VmdkbEVs?=
 =?utf-8?B?Nzd5WVNHc2VMdzE4Z3FqUENkUDFIRFYxeG5JUXNqNzBjMDI5NVhpSDBhSnhS?=
 =?utf-8?B?Q2liRzZkVlBHczF3RHhwRjlUVGZ2YVZNa3hWRTJadHBQTGlHam5CdXNLcnFy?=
 =?utf-8?B?Vm1DazdPcm12T00wZFVRVTNzNU9od29Wd0lYaTV3MXVFYURNbXRHWmVqTWJE?=
 =?utf-8?B?WER1UkxXdG1va2xITVh6UjZMSFZwU2NrMU1GZzhoSFowc2FrTEVVYnZrUGxS?=
 =?utf-8?B?TUxqVEdNRFFtdjhjSFREWDFxR0dnVzNwV3R6WFZzcjNFbmlSb3lRL29TZEh3?=
 =?utf-8?B?cW8yaUs2cm9zeElwU0JOQjEyNngzYWdSMnRvdzNnLzFFeDhoeFRKUWcya0pa?=
 =?utf-8?B?Z1Z0N3NPeFFDNW1GV05pdVF2TjFXamZhaCtQQ1htU2Y3MW1tY3lNMXNVcVBF?=
 =?utf-8?B?bDNxY09saVJod21oSU5BcEdnRE1mWU1Ta1JtU1k3WmhkRk1WaFNrSXUvWENS?=
 =?utf-8?B?Zkx1VC9Ud0hDdS9QUSsyWkliOUdwWTYrUWNqenBnTFZTMGVleitic3F3cGoz?=
 =?utf-8?B?bDFCWUk3ajAydHJydldyYm45VTAycHk0d1dRalFmdlFFWXRIVTladVV5T3dC?=
 =?utf-8?B?VTlUV0NEL0NjTzVXa1pPRnhGM2RIQTF4TGhHZ3NQQ3JkRWdBR0lPRk8rRVZL?=
 =?utf-8?B?L1RVNXJVSVBIZE5SQktGcFQxRk11dmtlQTErRys5Z3hBMWJDcHFiM0VmNXkx?=
 =?utf-8?B?T1J3b29hdjN6bDV4blpiWXhkblRjYnVrNkNGbkVDM2YxRjBIeXEzRUhzc0Zr?=
 =?utf-8?B?UUV2NWYrditoM1k5c3h3WURldDBrODBkZVhJYzJOYTdSZm1OeEZSZE1MMkJU?=
 =?utf-8?B?QjJWTWxQSXVmTHlMb2dXWHhBcmlkRlczYkV5Um9LNmlnZnNONlFQOVpVUFRt?=
 =?utf-8?B?RVo4ZVY0aGpFRTlJN2QxQ204U1ExR1RoSUszZzdwTStCOUhQNkFNMVFmbnRm?=
 =?utf-8?B?dTQ5dWdySWZlUmpQOGxyWCtsTlBFN0doU3hua2k3b0RmcndDTkZKVjNPNktG?=
 =?utf-8?B?aEtUeW5EY210dmhVTWVkWUo4akxXbUZ1T0t6Q3Nyc3JmUlNDZW5oNTZ2MGlV?=
 =?utf-8?B?OWYzSWR3cTNPdzRhWWVNYzF1VGpPMmhyZVhOTGtWSjRRaHloTnNlUndhbjZh?=
 =?utf-8?B?cHMyY25QVndRdERLZnN0MHpEbVZMSVdXeTlDU0p4Y1hrb0RZbzV1cTllY0Jz?=
 =?utf-8?B?Q3pYSFlLSm8waWFjVEJiek5HVGVUSnNhUFZZUXlCWXQxZHM3Tjg4M282NFVM?=
 =?utf-8?B?aWRSekpGakVqWGtaOXFWSFVWSkNrbmxOQW1SNUxMMm42VVJUWTRabTN4Rnl4?=
 =?utf-8?B?R1dhUm01MElBSHc2REQ5d2dqVkY3Y1lEZXltTUU2bVl2U0xlU24rd1g3QUN4?=
 =?utf-8?B?QURtTkFacUV2ZDNuOU9DUXlTMGFzMHNxNUxKYVAxT0JONS9MV3pLSjlYUkk2?=
 =?utf-8?B?ei9pM1FnTWl3bXRJaFd0cjBYb2F3QjBlYjdUTGlUQ29jMjF1T1l3akpZWUFt?=
 =?utf-8?B?UDdyL1dOR1NhMVhtNzRyMTNOWHpreW5iaWZqcUpwUDc1RWNBYkJxMkJ1MFRi?=
 =?utf-8?B?ZnkzKy9OTFIxY2VGTWE4TVRIb0pWZXhJODVvY2lDV2tEMkVUVnFpWU5NVU5O?=
 =?utf-8?B?Y2x6VTdWWHFxZ0ZUbmZwL2crdTJoUFQycGNnbVc0V1hQNXlyOHMvbUZRN0lq?=
 =?utf-8?B?ODBGSTNqY0Y4eEFDYk1JV2FaaytHeks1SW01K1NERkQ5Q1V3Q0g4M2pHKzVu?=
 =?utf-8?B?dTZWZ0tBWlhHYUNvUXorZGNIRWFmUWJYY1BCWk1aU3o0M2tLZlpCdnhEK1Za?=
 =?utf-8?B?cHphbEFub29JOEZxSUlhYUlQbGRFeG02Ti9SS3FuRmZpSFJHeUhNL3g2Um5z?=
 =?utf-8?B?a3FDcFd3OGxzNllldlZ3a1ZqUXp6WW5uWTFtUkk4WXVXQVNPN1psQmY2VEdS?=
 =?utf-8?Q?K8QLPg93U7m1FdN9wDnK04CEx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7587bf1c-2e97-4a11-a990-08db20841352
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 09:53:03.4701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v6hFfYpDPWK7hjq32fgdWA6JLCUPb1k5ya5vqfqgUjjzh5+U03QuTcufjuLGgoFcF2dpY0DIWB0UE4i4k7NkZsDtI9FaHkvYicmvOEo7c/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5839
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwg
TWFyY2ggOSwgMjAyMyA5OjQ0IEFNDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+OyBNaWNoYWVsIFR1cnF1ZXR0ZQ0KPiA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+
OyBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtk
dEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3Nr
aStkdEBsaW5hcm8ub3JnPg0KPiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT47IGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBGYWJy
aXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBSRkMgMS8zXSBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBSZW5lc2FzIHZlcnNh
MyBjbG9jaw0KPiBnZW5lcmF0b3IgYmluZGluZ3MNCj4gDQo+IE9uIDA5LzAzLzIwMjMgMTA6MTgs
IEJpanUgRGFzIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPg0KPiA+PiBTZW50OiBUaHVyc2RheSwgTWFyY2ggOSwgMjAyMyA5OjE0IEFNDQo+
ID4+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBNaWNoYWVsIFR1
cnF1ZXR0ZQ0KPiA+PiA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+OyBTdGVwaGVuIEJveWQgPHNi
b3lkQGtlcm5lbC5vcmc+OyBSb2INCj4gPj4gSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsg
S3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+PiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8u
b3JnPg0KPiA+PiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT47IGxpbnV4LXJlbmVzYXMtDQo+ID4+IHNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWNsa0B2
Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBGYWJyaXpp
byBDYXN0cm8NCj4gPj4gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCj4gPj4gU3Vi
amVjdDogUmU6IFtQQVRDSCBSRkMgMS8zXSBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBSZW5lc2Fz
IHZlcnNhMw0KPiA+PiBjbG9jayBnZW5lcmF0b3IgYmluZGluZ3MNCj4gPj4NCj4gPj4gT24gMDkv
MDMvMjAyMyAwODo1NywgQmlqdSBEYXMgd3JvdGU6DQo+ID4+Pj4+IEl0IGlzIGNsayBnZW5lcmF0
b3IgSFcgc3BlY2lmaWMuIENsayBnZW5lcmF0b3IgaXMgdml0YWwgY29tcG9uZW50DQo+ID4+Pj4+
IHdoaWNoIHByb3ZpZGVzIGNsb2NrcyB0byB0aGUgc3lzdGVtLg0KPiA+Pj4+DQo+ID4+Pj4gRXZl
cnkgY2xvY2sgY29udHJvbGxlciBpcyB2aXRhbC4uLg0KPiA+Pj4+DQo+ID4+Pj4+IFdlIGFyZSBw
cm92aWRpbmcgc29tZSBoYXJkd2FyZSBmZWF0dXJlIHdoaWNoIGlzIGV4cG9zZWQgYXMgZHQNCj4g
Pj4+Pj4gcHJvcGVydGllcy4NCj4gPj4+Pj4NCj4gPj4+Pj4gTGlrZSBjbG9jayBvdXRwdXQgaXMg
Zml4ZWQgcmF0ZSBjbG9jayBvciBkeW5hbWljIHJhdGUgY2xvY2svDQo+ID4+Pj4NCj4gPj4+PiBP
SywgSSB3YWl0IHRoZW4gZm9yIHByb3BlciBkZXNjcmlwdGlvbiB3aGljaCB3aWxsIGV4cGxhaW4g
YW5kDQo+ID4+Pj4ganVzdGlmeQ0KPiA+PiB0aGlzLg0KPiA+Pj4NCj4gPj4+IEhlcmUgaXQgaXMs
IFBsZWFzZSBsZXQgbWUga25vdyBpcyBpdCBvaz8NCj4gPj4+DQo+ID4+PiByZW5lc2FzLG91dHB1
dC1jbG9jay1maXhlZC1yYXRlLW1vZGU6DQo+ID4+PiAgICAgdHlwZTogYm9vbGVhbg0KPiA+Pj4g
ICAgIGRlc2NyaXB0aW9uOg0KPiA+Pj4gICAgICAgSW4gb3V0cHV0IGNsb2NrIGZpeGVkIHJhdGUg
bW9kZSwgdGhlIG91dHB1dCBjbG9jayBmcmVxdWVuY3kgaXMNCj4gPj4gYWx3YXlzDQo+ID4+PiAg
ICAgICBmaXhlZCBhbmQgdGhlIGhhcmR3YXJlIHdpbGwgdXNlIHRoZSB2YWx1ZXMgZnJvbSB0aGUg
T1RQIG9yDQo+ID4+PiBmdWxsDQo+ID4+IHJlZ2lzdGVyDQo+ID4+PiAJbWFwIGluaXRpYWxpemVk
IGR1cmluZyBib290Lg0KPiA+Pj4gICAgICAgSWYgbm90IGdpdmVuLCB0aGUgb3V0cHV0IGNsb2Nr
IHJhdGUgaXMgbm90IGZpeGVkLg0KPiA+Pj4gICAgIG1heEl0ZW1zOiA2DQo+ID4+DQo+ID4+IGJv
b2xlYW4gaXMgc2NhbGFyLCBub3QgYXJyYXksIHNvIG5vIG1heEl0ZW1zLiBJZiB0aGUgZnJlcXVl
bmN5IGlzDQo+ID4+IHRha2VuIGZyb20gT1RQIG9yIHJlZ2lzdGVyIG1hcCwgd2h5IHRoZXkgY2Fu
bm90IGFsc28gcHJvdmlkZQ0KPiA+PiBpbmZvcm1hdGlvbiB0aGUgY2xvY2sgaXMgZml4ZWQ/DQo+
ID4NCj4gPiBPSywgSSB3aWxsIG1ha2UgYW4gYXJyYXkgcHJvcGVydHkgaW5zdGVhZC4gRnJvbSBI
VyBwZXJzcGVjdGl2ZSBlYWNoDQo+ID4gY2xvY2sgb3V0cHV0IGZyb20gdGhlIENsb2NrIGdlbmVy
YXRvciBpcyBjb250cm9sbGFibGUgaWUsIGZpeGVkIHJhdGUgb3INCj4gZHluYW1pYyByYXRlLg0K
PiA+DQo+ID4gSWYgYWxsIHRoZSBvdXRwdXQgY2xvY2tzIGFyZSBmaXhlZCByYXRlIG9uZSwgdGhl
biBmcmVxdWVuY3kgaXMgdGFrZW4NCj4gPiBmcm9tIE9UUCBvciByZWdpc3RlciBtYXAuIEJ1dCBp
ZiBhbnkgb25lIGNsb2NrIG91dHB1dCBnZW5lcmF0ZXMNCj4gPiBkeW5hbWljIHJhdGUsIHRoZW4g
aXQgdXNlcyBkeW5hbWljIHNldHRpbmdzLg0KPiANCj4gU2Vjb25kIHRyeSwgc2FtZSBxdWVzdGlv
biwgbGV0IG1lIGtub3cgaWYgaXQgaXMgbm90IGNsZWFyOg0KPiANCj4gIndoeSB0aGV5IGNhbm5v
dCBhbHNvIHByb3ZpZGUgaW5mb3JtYXRpb24gdGhlIGNsb2NrIGlzIGZpeGVkPyINCg0KVGhpcyBp
bmZvcm1hdGlvbiB3ZSBhcmUgcHJvdmlkaW5nIHRocm91Z2ggZHQuDQoNCkl0IGlzIGEgY29tcGxl
eCBjbG9jayBnZW5lcmF0b3Igd2hpY2ggcHJvdmlkZXMgNiBIVyBjbG9jayBvdXRwdXRzLg0KVGhl
IDYgSFcgY2xvY2sgb3V0cHV0cyBjYW4gYmUgaW5kaXZpZHVhbGx5IGNvbnRyb2xsYWJsZSB0byBn
ZW5lcmF0ZQ0KRWl0aGVyIGZpeGVkIGZyZXF1ZW5jeSBvciBkeW5hbWljIGZyZXF1ZW5jeS4NCg0K
IE91dHB1dCBjbGsxICJkaWZmMiIsDQogT3V0cHV0IGNsazIgImRpZmYxIiwNCiBPdXRwdXQgY2xr
MyAic2UzIiwNCiBPdXRwdXQgY2xrNCAic2UyIiwNCiBPdXRwdXQgY2xrNSAic2UxIiwNCiBPdXRw
dXQgY2xrNiAicmVmIg0KDQpJIHdhbnQgdG8gbWFrZSAiT3V0cHV0IGNsazQiIGZyb20gY2xvY2sg
Z2VuZXJhdG9yIGFzIGR5bmFtaWMgZnJlcXVlbmN5IG9uZQ0KQW5kIG1ha2Ugb3RoZXIgY2xvY2sg
ZnJlcXVlbmN5IGZyb20gY2xvY2sgZ2VuZXJhdG9yIGFzIGZpeGVkIG9uZS4NCg0KSG93IGRvIHlv
dSBkZXNjcmliZSB0aGlzIGluIGR0PyBQbGVhc2Ugc2hhcmUgeW91ciB0aG91Z2h0cy4NCg0KQ2hl
ZXJzLA0KQmlqdQ0K
