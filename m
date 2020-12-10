Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414622D58CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 12:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389332AbgLJLAB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 06:00:01 -0500
Received: from mail-eopbgr1400091.outbound.protection.outlook.com ([40.107.140.91]:6208
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389313AbgLJK7K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 05:59:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTBW6hG7YJ+8Yy9Pn9J05aTR/0reT7oLdnUj24HJyNPFVrf0lqPuRES6eyIPD3BaqVRJP+V9DH8DyWAyRgQ09x6gLzXdfg00gc+aTE5bA/BrQw/GemVLAaAEGLDGvV6UOQ1WI4uCGwJVDXVEZ8SZ3xYaolP/tmWe3/r4k+DsnXr/xzow0VR16/QzxTWRFLSAdsaINctv67ckMIFPsbTGt/gry+8vGp4pJ2nYOGb0sRkODL6XQcOqnLXV7nLJWnLKw9sox8SJZ41X72yREE6JA2W18vQl1TY1tkknTutrUas84svVarmOGvInrr+ohhnhAL57RjrV6CDkSYT++X5YgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVVu9vjhQoBUejTOOI3XbJjQ86HCJHGJyQ7UMu49DbI=;
 b=mmvEi5Vf2RlL0T64Et8qxdTeKD4j0VMd9e+LVrCqdHwnvkjNEBUCH0IAmJSDn6mFuhbaES8TPFU4Jt54TEPsHO7dYNwpuPGQRB1GjLbTb6rQxUbHdG/YHzkxZNNZq5q97vQPQw4Yuevvah+mor+4gl3eIpcLZ1OtGxVIkgBlwu8b5NanfTjyud+7H58Xsq1Qm4kbWlAywDYo0pTxWLkC1IL5fMIAVvgqmUFT4xCDGcoONXSOCrwGrwyhhpOA3c2ckqqtt2Uz0jZz+CX+dLt4GFmMla3o1RPoQSRYQkk1MOP5wE1yqbl7nTCTtIdz3MaZRyj80twoZ+ThnbMgRees/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVVu9vjhQoBUejTOOI3XbJjQ86HCJHGJyQ7UMu49DbI=;
 b=OctyVjzVXAKbHJXKz3+tUqA+vZlpQDwdjM9F8Ep+SyuRh4Wtyxm1fe5rgRFnXtYboErF6NOGX4vYdPu6+kogE7njgywYhI6XD3F4yySMPcuAm2TG9Tjst/H/nfM8xSibaQ/dqy4cakRMQq5r8rxncV0OewsyDOj6s2HqnMJkPz8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3647.jpnprd01.prod.outlook.com (2603:1096:404:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 10:58:21 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.015; Thu, 10 Dec 2020
 10:58:21 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: RE: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHWzTi2AvmFiRi710Seq6CPF4SJ96nwAm0AgAAjrsA=
Date:   Thu, 10 Dec 2020 10:58:21 +0000
Message-ID: <TY2PR01MB369226B2FCFB1E6C91E2EFD5D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <2916e43d33fd13c88d983d7e8451a41ec3bf9e31.camel@fi.rohmeurope.com>
In-Reply-To: <2916e43d33fd13c88d983d7e8451a41ec3bf9e31.camel@fi.rohmeurope.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:70b3:188b:a9ac:357d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e655fbdf-f407-485a-4ff4-08d89cfa826c
x-ms-traffictypediagnostic: TYAPR01MB3647:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3647EF695032CAB524F1DE54D8CB0@TYAPR01MB3647.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wOHkcrhZxy3E1fdTQ2yejZAG0qHWzDHcHk9cfDyx2x58XlIIxcHPtPejocHjZfduiArwSgpEQhWvNElPVEqrtzFMY9c7ZFo39tE5p8wl7K2yDGrN3GSzn254ECv7QMTFHAdYlHmkxim4bMfSMmYIFs+4GU8xfwlchNS6lfKUS7TNRtsQ9phTWlOMqYGb8kbXW29bZTkShbMvQWpAE7Yun+atoyZFCdRq0n2IXg76yAF6p9uexYlTpElfE6s33Xs22c/lQYpMJzIbbLpyPclP0FSMefQvXZVayi9DaugpG+SWjMh7K63oizzWSeeb1tRi75OwOMwN+HlZdPcpGWp05g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(7696005)(66446008)(6506007)(86362001)(76116006)(55016002)(54906003)(6916009)(9686003)(8936002)(508600001)(52536014)(71200400001)(186003)(64756008)(66556008)(4326008)(8676002)(66946007)(66476007)(5660300002)(2906002)(83380400001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eHg4WS9QWUhEMnZ3KzhhREpYbW44S1YvanFSQSthSVZHY2FxLzhoYnAzLy9E?=
 =?utf-8?B?REpZcTZWZ1BabnJzTWQ3T0UxV2JyVUJiazRwOTBOWlpmVVJsRHM2TTBjZU1y?=
 =?utf-8?B?R3daUlVES0ZybjM5SGRJSjQ5WE9lQyt1bnFOenczNm1HM1J4NVBGZGJIbGZ6?=
 =?utf-8?B?NE5jWC9mUUxQQ1ZKVVdHSDZJVzg0RTZlV0FQcGdxL2VWcnFPU0s0NjVMWER6?=
 =?utf-8?B?UVRZUkRsRWVaV0tiMFRuZWJaRFVWTjA5bkk5TVl0VCtxTldqaU9aM2RMbWNm?=
 =?utf-8?B?T1VEelJCRHMraGVodEVYNHYvT05hVHNYTjF5TWFNdHpuVzMwQmp3dG16WW93?=
 =?utf-8?B?UTduUFJyWWg3S2VlT1QveDhIWlBMWXpLSFNCdU4wZTRsSnJ3dXJFbGNZdDV3?=
 =?utf-8?B?SzE2WWNIR2dQdUx2MFg3a1dNdzdKYStoRmZRYmhvMXVZU21yclpyc1AzY0E0?=
 =?utf-8?B?MDZhZjV3NEtCL3lZQk95dTdnenowVzFhbytUWVJUWCtObSt3b0h0TXUyVzVI?=
 =?utf-8?B?L2hxdkt3akQyQlF5NnVKQ1BKR014d1hZbG45aEw5b2hvNVM3RGJNdlpzRHFK?=
 =?utf-8?B?dTF4QzNIbWNUT3ZidENVNGhMc044NGlrZ2VFWGR6ZGR5YkEyVExoREkrSEl0?=
 =?utf-8?B?RG9vUTR2YWpFUXJnR3I1dWNYMTZsandWZHJLcXJzSzE1SER5YW5BaHY1VHJK?=
 =?utf-8?B?RXFxcEZ1ZklmbWtabk9FWFlGaHF3ZnZGNmw1L2FqVVdZM05LN2NtaGxWeTBZ?=
 =?utf-8?B?aVlDRlY3dlBhVHBZQmQvNnVKN2VlMjJCSVM1ejlLbjRkY3NFOUtFTXBHSlNG?=
 =?utf-8?B?SFE3WFg2VkVudXZ4cGxOYWhnemltaWFUcjNyRmZwMUxCYUI4NEJFcVoxREN1?=
 =?utf-8?B?TnBLNCtMdHk2ZWtpUGFwOG1mdHp3RGt0cDUwQm5JOHVzbjN1dGJUYWlBaGF5?=
 =?utf-8?B?UU9ST21nWUk5QzdFVFExVml2VFJ6MHc2TkhYNVhUeEFHTEFpNmVZK3lnRCsr?=
 =?utf-8?B?aW54c2UxbkdVNnFxNEhmY1ZwcUFCUUlNSE9jMDVKd2krMXlwTHFwZlZseGJB?=
 =?utf-8?B?YzJHWlVndEV4VVZNZnovRS9wQi9kWEk3c3JRbDU0TjRKRzBOM1g3QWZyQW02?=
 =?utf-8?B?cVUyUEg2d3REWDhqbkkvZW4rYjlqSVBNNDQwQ3JzTGZrUVhFYlJJUmdhZjZJ?=
 =?utf-8?B?a0ZxMEtLSFNyU3JjekVyMThtZHovaUt3Tnp5eUdZcmVyNTlQams4dHp1NUdr?=
 =?utf-8?B?YkNGZWUrRnY0R3lkbE93a3B2RzZvNXl3Ri84SExwZ2NjMkM1V1VSb0N5T3E4?=
 =?utf-8?B?QXhUeGNObE1SQytJUjVoazRFVUR4bXZxWTUyeHBYMGF4OVQycnQzclRTU0xn?=
 =?utf-8?Q?t7DnF0Ex74B3nhqyV9UbEQvMILySJuRs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e655fbdf-f407-485a-4ff4-08d89cfa826c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 10:58:21.5359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QtQemI0zUoydLwh5I04TaAQwV8mlp1i3luHh0Qv3qVtpbuqBu3XxWIdVJjVpclpWLE7NuEfiLOzwybEbCR7g8YDu8xqlFdYWpOU5dVVJcbw4UwgCSuT0RWmiM1GgpEZp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3647
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTWF0dGksDQoNCj4gRnJvbTogVmFpdHRpbmVuLCBNYXR0aSwgU2VudDogVGh1cnNkYXksIERl
Y2VtYmVyIDEwLCAyMDIwIDU6MjggUE0NCj4gDQo+IE9uIFR1ZSwgMjAyMC0xMi0wOCBhdCAxNzow
NCArMDkwMCwgWW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+ID4gRnJvbTogS2hpZW0gTmd1eWVu
IDxraGllbS5uZ3V5ZW4ueHRAcmVuZXNhcy5jb20+DQo+ID4NCj4gPiBUaGUgbmV3IFBNSUMgQkQ5
NTc0TVdGIGluaGVyaXRzIGZlYXR1cmVzIGZyb20gQkQ5NTcxTVdWLg0KPiA+IEFkZCB0aGUgc3Vw
cG9ydCBvZiBuZXcgUE1JQyB0byBleGlzdGluZyBiZDk1NzFtd3YgZHJpdmVyLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogS2hpZW0gTmd1eWVuIDxraGllbS5uZ3V5ZW4ueHRAcmVuZXNhcy5jb20+
DQo+ID4gW3NoaW1vZGE6IHJlYmFzZSBhbmQgcmVmYWN0b3JdDQo+ID4gU2lnbmVkLW9mZi1ieTog
WW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL21mZC9iZDk1NzFtd3YuYyAgICAgICB8IDkyDQo+ID4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBpbmNsdWRlL2xpbnV4
L21mZC9iZDk1NzFtd3YuaCB8IDgwDQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE3MiBpbnNlcnRpb25zKCspDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvYmQ5NTcxbXd2LmMgYi9kcml2ZXJzL21mZC9iZDk1
NzFtd3YuYw0KPiA+IGluZGV4IDU3YmRiNmEuLmY4ZjBhODcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9tZmQvYmQ5NTcxbXd2LmMNCj4gPiArKysgYi9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0K
PiA+IEBAIC0yMCw2ICsyMCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWZkX2NlbGwgYmQ5NTcx
bXd2X2NlbGxzW10gPSB7DQo+ID4gIAl7IC5uYW1lID0gImJkOTU3MW13di1ncGlvIiwgfSwNCj4g
PiAgfTsNCj4gPg0KPiA+ICsvKiBSZWdtYXAgZm9yIEJEOTU3MU1XViAqLw0KPiA+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IHJlZ21hcF9yYW5nZSBiZDk1NzFtd3ZfcmVhZGFibGVfeWVzX3Jhbmdlc1td
ID0gew0KPiA+ICAJcmVnbWFwX3JlZ19yYW5nZShCRDk1NzFNV1ZfVkVORE9SX0NPREUsDQo+ID4g
QkQ5NTcxTVdWX1BST0RVQ1RfUkVWSVNJT04pLA0KPiA+ICAJcmVnbWFwX3JlZ19yYW5nZShCRDk1
NzFNV1ZfQktVUF9NT0RFX0NOVCwNCj4gPiBCRDk1NzFNV1ZfQktVUF9NT0RFX0NOVCksDQo+ID4g
QEAgLTExMiw2ICsxMTMsOTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiZDk1N3hfZGF0YSBiZDk1
NzFtd3ZfZGF0YSA9DQo+ID4gew0KPiA+ICAJLm51bV9jZWxscyA9IEFSUkFZX1NJWkUoYmQ5NTcx
bXd2X2NlbGxzKSwNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9j
ZWxsIGJkOTU3NG13Zl9jZWxsc1tdID0gew0KPiA+ICsJeyAubmFtZSA9ICJiZDk1NzFtd3YtZ3Bp
byIsIH0sDQo+IA0KPiBBbm90aGVyICduaXQnIHN1Z2dlc3Rpb24gd2hpY2ggeW91IGNhbiBpZ25v
cmUgaWYgaXQgZG9lcyBub3QgbWFrZSBzZW5zZQ0KPiA6KQ0KPiANCj4gQXJlIHRoZSBHUElPIGJs
b2NrcyAxMDAlIGlkZW50aWNhbD8gSWYgbm90LCB0aGVuIEkgd291bGQgc3VnZ2VzdA0KPiBjaGFu
Z2luZyB0aGlzIHRvOg0KPiB7IC5uYW1lID0gImJkOTU3NG13Zi1ncGlvIiwgfSwNCg0KVGhlIEdQ
SU8gYmxvY2tzIGFyZSBub3QgMTAwJSBpZGVudGljYWwuIEJEOTU3NE1XRiBzZWVtcyB0byBoYXZl
DQphbiBhZGRpdGlvbmFsIGZlYXR1cmUgd2hpY2ggR1BJT3ggcGluIGFyZSB1c2VkIGZvciBvdGhl
ciBtb2RlIGJ5DQp1c2luZyBncGlvIG11eCByZWdpc2l0ZXIuDQoNCj4gYW5kIHBvcHVsYXRpbmcg
dGhlIHBsYXRmb3JtX2RyaXZlciBpZF90YWJsZSBmb3Igc3ViIGRyaXZlcihzKSB1c2luZw0KPiBz
b21ldGhpbmcgbGlrZToNCj4gDQo+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
X2lkIGJkOTU3eF9ncGlvX2lkW10gPSB7DQo+ICAgICAgICAgeyAiYmQ5NTcxbXd2LWdwaW8iLCBS
T0hNX0NISVBfVFlQRV9CRDk1NzEgfSwNCj4gICAgICAgICB7ICJiZDk1NzRtd2YtZ3BpbyIsIFJP
SE1fQ0hJUF9UWVBFX0JEOTU3NCB9LA0KPiAgICAgICAgIHsgfSwNCj4gfTsNCj4gDQo+IFRoZW4g
eW91IGNhbiBnZXQgdGhlIElDIHR5cGUgdXNpbmcNCj4gcGxhdGZvcm1fZ2V0X2RldmljZV9pZChw
ZGV2KS0+ZHJpdmVyX2RhdGEuDQoNCkkgZ290IGl0LiBTbywgcGVyaGFwcywgSSBzaG91bGQgYWRk
IHRoZXNlIHR5cGVzIGludG8NCmluY2x1ZGUvbGludXgvbWZkL3JvaG0tZ2VuZXJpYy5oLg0KDQo+
IE5leHQsIEkgdGhpbmsgdGhlIHBhcmVudCBkYXRhIGZyb20gTUZEIGlzIG9ubHkgdXNlZCB0byBn
ZXQgdGhlIHJlZ21hcA0KPiBhbmQgZGV2IGluIHN1Yi1kZXZpY2VzLCByaWdodD8gTWF5YmUgeW91
IGNvdWxkIHNpbXBsaWZ5IHRoaXMgYW5kIGdldA0KPiByaWQgb2YgdGhlIHdob2xlIE1GRCBwYXJl
bnQgZGF0YSBzdHJ1Y3R1cmU/IEkgdGhpbmsgeW91IGNhbiB1c2UNCj4gDQo+IHBkZXYtPmRldi5w
YXJlbnQgdG8gZ2V0IHRoZSBwYXJlbnQgZGV2aWNlIGFuZA0KPiBkZXZfZ2V0X3JlZ21hcChwZGV2
LT5kZXYucGFyZW50LCBOVUxMKTsNCj4gDQo+IHRvIGdldCB0aGUgcmVnbWFwPw0KDQpJSVVDLCB0
aGVzZSBjb21tZW50cyBhcmUgcmVsYXRlZCB0byBncGlvLWJkOTU3MW13di5jLg0KIyBBbHNvLCBi
ZDk1NzFtd3YtcmVndWxhdG9yLmM/DQpJZiBzbywgSSBkaWRuJ3QgdHJ5IHRoaXMgeWV0LCBidXQg
cGVyaGFwcywgd2UgY2FuIG1vZGlmeSBzdWNoIHRoaW5ncy4NCg0KPiAoQWZ0ZXIgdGhpcyBJIHdv
bmRlciBpZiB5b3UgbmVlZCB0aGUNCj4gc3RydWN0IGJkOTU3MW13diBhdCBhbGw/KQ0KDQpJJ20g
c29ycnksIGJ1dCBJIGNvdWxkIG5vdCB1bmRlcnN0YW5kIHRoaXMuDQoNCj4gPiArfTsNCj4gPiAr
DQo+ID4gKy8qIFJlZ21hcCBmb3IgQkQ5NTc0TVdGICovDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgcmVnbWFwX3JhbmdlIGJkOTU3NG13Zl9yZWFkYWJsZV95ZXNfcmFuZ2VzW10gPSB7DQo+ID4g
KwlyZWdtYXBfcmVnX3JhbmdlKEJEOTU3NE1XRl9WRU5ET1JfQ09ERSwNCj4gPiBCRDk1NzRNV0Zf
UFJPRFVDVF9SRVZJU0lPTiksDQo+ID4gKwlyZWdtYXBfcmVnX3JhbmdlKEJEOTU3NE1XRl9HUElP
X0lOLCBCRDk1NzRNV0ZfR1BJT19JTiksDQo+ID4gKwlyZWdtYXBfcmVnX3JhbmdlKEJEOTU3NE1X
Rl9HUElPX0lOVCwgQkQ5NTc0TVdGX0dQSU9fSU5UTUFTSyksDQo+ID4gKwlyZWdtYXBfcmVnX3Jh
bmdlKEJEOTU3NE1XRl9HUElPX01VWCwgQkQ5NTc0TVdGX0dQSU9fTVVYKSwNCj4gPiArCXJlZ21h
cF9yZWdfcmFuZ2UoQkQ5NTc0TVdGX0lOVF9JTlRSRVEsIEJEOTU3NE1XRl9JTlRfSU5UTUFTSyks
DQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9hY2Nlc3Nf
dGFibGUgYmQ5NTc0bXdmX3JlYWRhYmxlX3RhYmxlID0gew0KPiA+ICsJLnllc19yYW5nZXMJPSBi
ZDk1NzRtd2ZfcmVhZGFibGVfeWVzX3JhbmdlcywNCj4gPiArCS5uX3llc19yYW5nZXMJPSBBUlJB
WV9TSVpFKGJkOTU3NG13Zl9yZWFkYWJsZV95ZXNfcmFuZ2VzKSwNCj4gPiArfTsNCj4gPiArDQo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX3JhbmdlIGJkOTU3NG13Zl93cml0YWJsZV95
ZXNfcmFuZ2VzW10gPSB7DQo+ID4gKwlyZWdtYXBfcmVnX3JhbmdlKEJEOTU3NE1XRl9HUElPX0RJ
UiwgQkQ5NTc0TVdGX0dQSU9fT1VUKSwNCj4gPiArCXJlZ21hcF9yZWdfcmFuZ2UoQkQ5NTc0TVdG
X0dQSU9fSU5UX1NFVCwNCj4gPiBCRDk1NzRNV0ZfR1BJT19JTlRNQVNLKSwNCj4gPiArCXJlZ21h
cF9yZWdfcmFuZ2UoQkQ5NTc0TVdGX0lOVF9JTlRSRVEsIEJEOTU3NE1XRl9JTlRfSU5UTUFTSyks
DQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9hY2Nlc3Nf
dGFibGUgYmQ5NTc0bXdmX3dyaXRhYmxlX3RhYmxlID0gew0KPiA+ICsJLnllc19yYW5nZXMJPSBi
ZDk1NzRtd2Zfd3JpdGFibGVfeWVzX3JhbmdlcywNCj4gPiArCS5uX3llc19yYW5nZXMJPSBBUlJB
WV9TSVpFKGJkOTU3NG13Zl93cml0YWJsZV95ZXNfcmFuZ2VzKSwNCj4gPiArfTsNCj4gPiArDQo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX3JhbmdlIGJkOTU3NG13Zl92b2xhdGlsZV95
ZXNfcmFuZ2VzW10gPSB7DQo+ID4gKwlyZWdtYXBfcmVnX3JhbmdlKEJEOTU3NE1XRl9HUElPX0lO
LCBCRDk1NzRNV0ZfR1BJT19JTiksDQo+ID4gKwlyZWdtYXBfcmVnX3JhbmdlKEJEOTU3NE1XRl9H
UElPX0lOVCwgQkQ5NTc0TVdGX0dQSU9fSU5UKSwNCj4gPiArCXJlZ21hcF9yZWdfcmFuZ2UoQkQ5
NTc0TVdGX0lOVF9JTlRSRVEsIEJEOTU3NE1XRl9JTlRfSU5UUkVRKSwNCj4gPiArfTsNCj4gDQo+
IEFyZSB5b3UgdXNpbmcgdGhlIG90aGVyIGludGVycnVwdHMvc3RhdHVzZXMgb3IgVkRDT1JFIE1v
bmlWREFDPyBTaG91bGQNCj4gdGhleSBiZSB2b2xhdGlsZSB0b28/DQoNCkF0IGxlYXN0LCBzaW5j
ZSBCRDk1NzFNV1ZfRFZGU19NT05JVkRBQyBpcyB1c2VkIG9uIGJkOTU3MW1mdi1yZWd1bGF0b3Iu
YywNCkkgc2hvdWxkIGFkZCBpdCBpbnRvIHRoZSB2b2xhdGlsZS4NCg0KPHNuaXA+DQo+ID4gIC8q
Kg0KPiA+ICAgKiBzdHJ1Y3QgYmQ5NTd4X2RhdGEgLSBpbnRlcm5hbCBkYXRhIGZvciB0aGUgYmQ5
NTd4IGRyaXZlcg0KPiA+ICAgKg0KPiANCj4gT3ZlcmFsbCBhIGdvb2QgbG9va2luZyBkcml2ZXIh
IFRoYW5rcyBhIGxvdCENCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciByZXZpZXchDQoN
CkJ5IHRoZSB3YXksIEkgcmVhbGl6ZWQgTGludXgga2VybmVsIHN1cHBvcnRzIGJkOTU3Ni1yZWd1
bGF0b3IuYw0KYW5kIGl0IGhhcyAiYmQ5NTd4IiwgYnV0IGl0IGRvZXNuJ3Qgc2VlbSB0byBiZSBj
b21wYXRpYmxlIHdpdGggQkQ5NTcxLg0KU28sIEkgd29uZGVyIGlmIEkgc2hvdWxkIG5vdCB1c2Ug
ImJkOTU3eCIgaW4gdGhlIGJkOTU3MW13diBkcml2ZXIgdG8gYXZvaWQNCmNvbmZ1c2lvbi4gQnV0
LCB3aGF0IGRvIHlvdSB0aGluaz8NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGEN
Cg0K
