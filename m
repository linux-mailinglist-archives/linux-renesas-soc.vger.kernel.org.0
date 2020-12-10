Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095BD2D52E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 05:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732306AbgLJEpR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Dec 2020 23:45:17 -0500
Received: from mail-eopbgr1400098.outbound.protection.outlook.com ([40.107.140.98]:23370
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732143AbgLJEpO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Dec 2020 23:45:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLRYAEhwk+26ejayX4RhojdxnsMPMmv0rKH9C+t71LiYfR+KShh9t10NZdFzdgm9YoJhwg0OUu7e/r+SylzgMxHdH66eOI8zMy6sCIaD+rG+Ne3sB7CgpA3L9BQYQnz3E2W36n0FfLMWZJQ6GT2GHTBnZVjeQfuFkSbWJ1gCyX/Igrqrc+jMOqtc/ADAGXXZYs9aNsxImpH/XEOevzZe+iziRbVZ+1vclrhgLRmbGYaVZFoM/bs2HFejvHrvepWW+T3Q6mldQjax/xOFu1Yi62YU9FS6bkWHMRQcU8Z53LNbDPDe3r/czuH7EXVbrOM1RyyzLLnmK/p3Z+lTpopESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3U6kEJTKmrTr3nfa3tEIiBff5iOjXVpoq7aqMpVgq0=;
 b=cdpr1xrLROfAwyQFXy5mhNnSPHUQiynEOGkhFmHW/Zt+MRSG9gR8D2p48pkenwb6QdGsGXQTFecr/B0ekda53HqgcYGQ1Y+NpDbzIw6iilEyY4t4bK1bQzLW6rt6xGy0yVP4jloggsdjqbyePei+NQvAS1VMHnRZp/lbodMc9z1Q8Isj4Fd7kLuEaafHTY169GZOTrQSBWu+Om5T2lwEP+qftDlt5JGZ0TP/eHAUeGmXw0Tnj8cUcWKc7DnoNeRZTUNwcaNT94veiiNc+aJRQH/UJiuSKQ8CxEPT0jd2KQfX6oNGI9vFtdgo4x7pDsRdEE5K6tYOi9MRY0v8oLFyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3U6kEJTKmrTr3nfa3tEIiBff5iOjXVpoq7aqMpVgq0=;
 b=V4b76C3aexP0vDPltMuOR/fDwwOMTpeHk8aXfdDQBhpSzflW5+JlTbSgnREJgHaHIQg0b8Brqvc67eJ5X8O9/L68e+GpV5sKOSEEtHNc2/sfohMSbuGz4mYAzXboBTnQq42Ij9dKkLeR5kfYMC2DyqcAWKE2RYVP2hN65rqLfIw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1872.jpnprd01.prod.outlook.com (2603:1096:403:12::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 10 Dec
 2020 04:44:25 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.015; Thu, 10 Dec 2020
 04:44:25 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: RE: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHWzTi2AvmFiRi710Seq6CPF4SJ96nuxG0AgAD19iA=
Date:   Thu, 10 Dec 2020 04:44:25 +0000
Message-ID: <TY2PR01MB3692AE2EBAE6876F1CA26A34D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWY_M=XZF4FtP0E0vU3u=S1Gj7ynQVLyn1KA9iRDgvvOQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWY_M=XZF4FtP0E0vU3u=S1Gj7ynQVLyn1KA9iRDgvvOQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:70b3:188b:a9ac:357d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 99294f23-a06d-4bd5-c2c1-08d89cc64596
x-ms-traffictypediagnostic: TYXPR01MB1872:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB187278A1384F3650C04E8A1AD8CB0@TYXPR01MB1872.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: skIf7tWN6Gywfd68dTWhuyk5GmH7PBLOzX1GP10IZQYs9mQexcswWxqyb9YFXU4d4VtjtAb365r2gc0Wy9JGsh8riCoWfK2YOxS5EkaXOEgcl96JYwD2tLBbmnaRNleSqMQr3Xk353vRLIsf64uvs2AoaRzdRGwTkMshlgop2FAfoO/TOCiSdp3gfd6as4t3iC0MNzlRi7jqyneWKdwhInHpi64VxCKxQ+r9g6pGcAcr5TGcYutuyAk+IyRuOKjGI2y89Zq2uC48Jz1APlNNsCgcMBbyJ9cs82yUZ0oPuPEwLUtkWsij4fCNk2JvrfLTwXAmZy+P4sjwCwqNHQh10g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(55016002)(7696005)(6916009)(8936002)(186003)(71200400001)(76116006)(8676002)(9686003)(6506007)(508600001)(83380400001)(86362001)(4326008)(54906003)(33656002)(66556008)(66946007)(64756008)(66476007)(66446008)(52536014)(2906002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MXBGWnNVNmpGRCtON1JCSG11ZmNiTG9nT09TVW9lSkZVNzlIQytlUDdHKzNY?=
 =?utf-8?B?bXBoVUN6eExhaFJTbWpiR2FadVk1ejBQZWI3S2hWdkZjOTE5Tm01ejdSUnZU?=
 =?utf-8?B?VXJFWTFMVG5OUGQ3a2RiMDM5c1BHd1NiajFIOGRDMllqNGJGSTNDb0gxSnpY?=
 =?utf-8?B?UFhqeTllNStKUDFpbmkyYjNZTFNxaFdIb0hLc0lrMFpicUFnb1dwSFFaNnVt?=
 =?utf-8?B?OGoxYW4rQ2YxdSt3T0I5R3BSdEo0R1lUbjE2L3J5MXh4NGt4T1c2VDErckpu?=
 =?utf-8?B?TTVQRFgrazJtM3h4Z1NYd1lXbE5WMkVUYlAwZlZHbURkRG9peEowaU5NUlFT?=
 =?utf-8?B?R2JUSFRlVnhXby9OVGdBNmhYYi9VZS94dkw2UmtsMHQwYU1OOEZPMjh3MXBC?=
 =?utf-8?B?YzdjSUN3MERRMzdldGV1YWYxUW0rUjUxbzlTOVc1dFF1VmM1eUFMeVpJZHRj?=
 =?utf-8?B?RjZxZ0l0RFErUHlPNngxYm5jaHpOeDBibFBCUGNBKytsYmV5QjZGWkY0bUJr?=
 =?utf-8?B?MkEydm5rQ0xvQlFUdFpyN08zekJ5NTB5Nmw1SmFUcytCdDN1YndrRWFsNFNW?=
 =?utf-8?B?R3JkLytxKzc1dHdHM1N4NXU1L3JRcWNNM2dYOERFSUhud3dJUzJmR2YxTmU0?=
 =?utf-8?B?R1Zmc0g0Wk01WUVkNWQwaVNhOFBxdjRVaXVUUXRpVC85b2ZmRGYxVXkxa2hr?=
 =?utf-8?B?dzJDNXZXZGJNVVg2NEdMQnF5RTMzdmg3Zldtak1qa1A2MElUK2ZIc0V2NjFI?=
 =?utf-8?B?VW5FUlpMOHc5VDFXZFl0R2tTU3U0WUZvQ1prWXcvVk5OajY5d2dIVTVyMUE1?=
 =?utf-8?B?a3JUWEs0ZUpVREdaZVY2SU9McG9CYXRrcnp6ZXV5MjIzYUNucS9HeW9IcER4?=
 =?utf-8?B?WjdSZXExQS9TNFVJZGlMa3R1UHV1ZkFQdURVdlEwUVUrMXVtMXNNalZtMDh5?=
 =?utf-8?B?UlExaEZSY3RBTnYrL2t6dzJaWkc0bGZzT0tLamNZc1lJV1ptSTBFQjVISkE0?=
 =?utf-8?B?SThCVzI0emxOMkMyck50aVpWcENrQ0pDeFFNZEV1dnJZcExoVTBKT0w0WE1W?=
 =?utf-8?B?b21IbUNaNjZpREk5c216VGsvZ2JZdGpVSVRRc1FoTVRYbGpLZVRUK2Q4aVVr?=
 =?utf-8?B?c2lRUnlkOGp0ZXNxRTV2RTlqWkdZTTBEN2Z0V1BnWEVoWWwxYWpNdmgzVWJn?=
 =?utf-8?B?K25nOXE0ZTRPdnQvNlV4TWlXMGRqNmRGQWc4SGp3RnBMaDAvYUFOa09Cb3Jn?=
 =?utf-8?B?NjRyZ05kQkVQeG8rZzh0czAxTHp4Z1pSWFdPc1NDS0VHa1pjZi9QMmFDeGRm?=
 =?utf-8?B?N3BCNDNBSnRLMjBPZVNvMHM1TWJKdnlJSVBQNkJYYlZ5dUFjdUk5d3J0NWZR?=
 =?utf-8?Q?Fz6vIEyXzxEB2dX38mKw34p5vcVmv4uY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99294f23-a06d-4bd5-c2c1-08d89cc64596
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 04:44:25.6221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eVIvRlx8pq6373TtRIMEwIyABh5wdVeDZwvVLIg/H/OF81fohWj2zu12aURN2K0mYYAMQPL8Rnen+GSTDZPshpTFjjZXt1HD3mUfiI2lIp9OYla/qdCwKVtBCCibr2jK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1872
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciA5LCAyMDIwIDEwOjMw
IFBNDQo8c25pcD4gDQo+ID4gLS0tIGEvZHJpdmVycy9tZmQvYmQ5NTcxbXd2LmMNCj4gPiArKysg
Yi9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPiA+IEBAIC0yMCw2ICsyMCw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbWZkX2NlbGwgYmQ5NTcxbXd2X2NlbGxzW10gPSB7DQo+ID4gICAgICAgICB7
IC5uYW1lID0gImJkOTU3MW13di1ncGlvIiwgfSwNCj4gPiAgfTsNCj4gPg0KPiA+ICsvKiBSZWdt
YXAgZm9yIEJEOTU3MU1XViAqLw0KPiANCj4gTm90ZSB0aGF0IGJkOTU3MW13dl9jZWxsc1tdIGFi
b3ZlIGFsc28gYXBwbGllcyB0byBCRDk1NzFNV1YuDQoNClllcywgc28sIEknbGwgbW92ZSB0aGlz
IGNvbW1lbnQuDQoNCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfcmFuZ2UgYmQ5NTcx
bXd2X3JlYWRhYmxlX3llc19yYW5nZXNbXSA9IHsNCj4gPiAgICAgICAgIHJlZ21hcF9yZWdfcmFu
Z2UoQkQ5NTcxTVdWX1ZFTkRPUl9DT0RFLCBCRDk1NzFNV1ZfUFJPRFVDVF9SRVZJU0lPTiksDQo+
ID4gICAgICAgICByZWdtYXBfcmVnX3JhbmdlKEJEOTU3MU1XVl9CS1VQX01PREVfQ05ULCBCRDk1
NzFNV1ZfQktVUF9NT0RFX0NOVCksDQo+ID4gQEAgLTExMiw2ICsxMTMsOTUgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBiZDk1N3hfZGF0YSBiZDk1NzFtd3ZfZGF0YSA9IHsNCj4gPiAgICAgICAgIC5u
dW1fY2VsbHMgPSBBUlJBWV9TSVpFKGJkOTU3MW13dl9jZWxscyksDQo+ID4gIH07DQo+ID4NCj4g
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtZmRfY2VsbCBiZDk1NzRtd2ZfY2VsbHNbXSA9IHsNCj4g
PiArICAgICAgIHsgLm5hbWUgPSAiYmQ5NTcxbXd2LWdwaW8iLCB9LA0KPiANCj4gTm8gcmVndWxh
dG9yIGNlbGw/DQoNCk9vcHMsIHdlIHNob3VsZCBhZGQgcmVndWxhdG9yIGZvciBiZDk1NzRtd2Yg
dG8gdXNlIGJhY2t1cF9tb2RlIGFuZCBEVkZTLg0KSG93ZXZlciwgc2luY2UgQkQ5NTc0TVdGIGRv
ZXNuJ3QgaGF2ZSBBVlMsIHdlIHNob3VsZCBhZGQNCiIgYmQ5NTc0bXdmLXJlZ3VsYXRvciIsIG5v
dCAiYmQ5NTcxbXd2LXJlZ3VsYXRvciIuDQojIFlvdXIgaW5kaWNhdGVkIHdlYiBzaXRlIHNhaWQg
QkQ5NTc0TVdGIHN1cHBvcnRzIEFWUyBmZWF0dXJlLg0KIyBCdXQsICJBcHBsaWNhdGlvbiBDaXJj
dWl0IiBkb2Vzbid0IGhhdmUgYW55IEFWUyBwaW5zLg0KIyBPZiBjb3Vyc2UsIHRoZSBkYXRhc2hl
ZXQgZG9lc24ndCBtZW50aW9uIGFib3V0IEFWUyA6KQ0KDQo+ID4gK307DQo+ID4gKw0KPiA+ICsv
KiBSZWdtYXAgZm9yIEJEOTU3NE1XRiAqLw0KPiANCj4gTm90ZSB0aGF0IGJkOTU3NG13Zl9jZWxs
c1tdIGFib3ZlIGFsc28gYXBwbGllcyB0byBCRDk1NzRNV0YuDQo+IFBlcmhhcHMgdGhlIGNvbW1l
bnRzIHNob3VsZCBiZSBjaGFuZ2VkIHNsaWdodGx5LCBhbmQgbW92ZWQgdXAsDQo+IHRvIHNlcnZl
IGFzIGEgc2VwYXJhdG9yIGJldHdlZW4gY2hpcCB2YXJpYW50cz8NCg0KSSB0aGluayBzby4gSSds
bCBmaXggaXQuDQoNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfcmFuZ2UgYmQ5NTc0
bXdmX3JlYWRhYmxlX3llc19yYW5nZXNbXSA9IHsNCj4gPiArICAgICAgIHJlZ21hcF9yZWdfcmFu
Z2UoQkQ5NTc0TVdGX1ZFTkRPUl9DT0RFLCBCRDk1NzRNV0ZfUFJPRFVDVF9SRVZJU0lPTiksDQo+
IA0KPiBNaXNzaW5nIEJEOTU3NE1XRl9CS1VQX01PREVfQ05UIGFuZCBCRDk1NzRNV0ZfRFZGU18q
Pw0KDQpZZXMsIEknbGwgYWRkIHRoZXNlLg0KDQo+ID4gKyAgICAgICByZWdtYXBfcmVnX3Jhbmdl
KEJEOTU3NE1XRl9HUElPX0lOLCBCRDk1NzRNV0ZfR1BJT19JTiksDQo+ID4gKyAgICAgICByZWdt
YXBfcmVnX3JhbmdlKEJEOTU3NE1XRl9HUElPX0lOVCwgQkQ5NTc0TVdGX0dQSU9fSU5UTUFTSyks
DQo+ID4gKyAgICAgICByZWdtYXBfcmVnX3JhbmdlKEJEOTU3NE1XRl9HUElPX01VWCwgQkQ5NTc0
TVdGX0dQSU9fTVVYKSwNCj4gPiArICAgICAgIHJlZ21hcF9yZWdfcmFuZ2UoQkQ5NTc0TVdGX0lO
VF9JTlRSRVEsIEJEOTU3NE1XRl9JTlRfSU5UTUFTSyksDQo+ID4gK307DQo+ID4gKw0KPiA+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9hY2Nlc3NfdGFibGUgYmQ5NTc0bXdmX3JlYWRhYmxl
X3RhYmxlID0gew0KPiA+ICsgICAgICAgLnllc19yYW5nZXMgICAgID0gYmQ5NTc0bXdmX3JlYWRh
YmxlX3llc19yYW5nZXMsDQo+ID4gKyAgICAgICAubl95ZXNfcmFuZ2VzICAgPSBBUlJBWV9TSVpF
KGJkOTU3NG13Zl9yZWFkYWJsZV95ZXNfcmFuZ2VzKSwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX3JhbmdlIGJkOTU3NG13Zl93cml0YWJsZV95ZXNfcmFu
Z2VzW10gPSB7DQo+IA0KPiBNaXNzaW5nIEJEOTU3NE1XRl9CS1VQX01PREVfQ05UIGFuZCBCRDk1
NzRNV0ZfRFZGU18qPw0KDQpZZXMsIEknbGwgYWRkIHRoZXNlLg0KDQo+ID4gKyAgICAgICByZWdt
YXBfcmVnX3JhbmdlKEJEOTU3NE1XRl9HUElPX0RJUiwgQkQ5NTc0TVdGX0dQSU9fT1VUKSwNCj4g
PiArICAgICAgIHJlZ21hcF9yZWdfcmFuZ2UoQkQ5NTc0TVdGX0dQSU9fSU5UX1NFVCwgQkQ5NTc0
TVdGX0dQSU9fSU5UTUFTSyksDQo+ID4gKyAgICAgICByZWdtYXBfcmVnX3JhbmdlKEJEOTU3NE1X
Rl9JTlRfSU5UUkVRLCBCRDk1NzRNV0ZfSU5UX0lOVE1BU0spLA0KPiA+ICt9Ow0KPiANCj4gPiBA
QCAtMTgyLDYgKzI3Miw4IEBAIHN0YXRpYyBpbnQgYmQ5NTcxbXd2X3Byb2JlKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQsDQo+ID4gICAgICAgICBwcm9kdWN0X2NvZGUgPSAodW5zaWduZWQgaW50
KXJldDsNCj4gPiAgICAgICAgIGlmIChwcm9kdWN0X2NvZGUgPT0gQkQ5NTcxTVdWX1BST0RVQ1Rf
Q09ERV9WQUwpDQo+ID4gICAgICAgICAgICAgICAgIGJkLT5kYXRhID0gJmJkOTU3MW13dl9kYXRh
Ow0KPiA+ICsgICAgICAgZWxzZSBpZiAocHJvZHVjdF9jb2RlID09IEJEOTU3NE1XRl9QUk9EVUNU
X0NPREVfVkFMKQ0KPiA+ICsgICAgICAgICAgICAgICBiZC0+ZGF0YSA9ICZiZDk1NzRtd2ZfZGF0
YTsNCj4gPg0KPiA+ICAgICAgICAgaWYgKCFiZC0+ZGF0YSkgew0KPiA+ICAgICAgICAgICAgICAg
ICBkZXZfZXJyKGJkLT5kZXYsICJObyBmb3VuZCBzdXBwb3J0ZWQgZGV2aWNlICVkXG4iLA0KPiAN
Cj4gV2hpbGUgQkQ5NTcxTVdWIGFuZCBCRDk1NzRNV0YgY2FuIGJlIGRpc3Rpbmd1aXNoZWQgYXQg
cnVudGltZSwNCj4gSSB0aGluayBpdCB3b3VsZCBzdGlsbCBiZSBhIGdvb2QgaWRlYSB0byBkb2N1
bWVudCBhICJyb2htLGJkOTU3NG13ZiINCj4gY29tcGF0aWJsZSB2YWx1ZSBpbiB0aGUgRFQgYmlu
ZGluZ3MsIGFuZCBsZXQgdGhlIGRyaXZlciBtYXRjaCBvbiB0aGF0Lg0KDQpJbiB0aGlzIGRyaXZl
ciBwb2ludCBvZiB2aWV3LCB3ZSBjYW4gdXNlIHN1Y2ggdGhlIERUIGJpbmRpbmdzLA0KaG93ZXZl
ciwgaW4gdGhlIGJvYXJkIHBvaW50IG9mIHZpZXcsIGl0J3MgZGlmZmljdWx0IHRvIGRlc2NyaWJl
DQp3aGljaCBjaGlwIGlzIGluc3RhbGxlZCBvbiByOGE3Nzk5MC1lYmlzdS5kdHMuIFNvLCBJJ2Qg
bGlrZSB0bw0Ka2VlcCB0aGlzIHJ1bnRpbWUgZGV0ZWN0aW9uLg0KDQo+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvbWZkL2JkOTU3MW13di5oIGIvaW5jbHVkZS9saW51eC9tZmQvYmQ5NTcx
bXd2LmgNCj4gPiBpbmRleCAwMTI2YjUyLi5lOWUyMTliIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1
ZGUvbGludXgvbWZkL2JkOTU3MW13di5oDQo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tZmQvYmQ5
NTcxbXd2LmgNCj4gDQo+ID4gKyNkZWZpbmUgQkQ5NTc0TVdGX1ZEQ09SRV9WSU5JVCAgICAgICAg
ICAgICAgICAgMHg1MA0KPiA+ICsjZGVmaW5lIEJEOTU3NE1XRl9WRDA5X1ZJTklUICAgICAgICAg
ICAgICAgICAgIDB4NTENCj4gPiArI2RlZmluZSBCRDk1NzRNV0ZfVkRDT1JFX1NFVFZNQVggICAg
ICAgICAgICAgICAweDUyDQo+ID4gKyNkZWZpbmUgQkQ5NTc0TVdGX1ZEQ09SRV9TRVRWSUQgICAg
ICAgICAgICAgICAgICAgICAgICAweDU0DQo+ID4gKyNkZWZpbmUgQkQ5NTc0TVdGX1ZEQ09SRV9N
T05JVkRBQyAgICAgICAgICAgICAgMHg1NQ0KPiA+ICsjZGVmaW5lIEJEOTU3NE1XRl9WRENPUkVf
UEdEX0NOVCAgICAgICAgICAgICAgIDB4NTYNCj4gDQo+IFNvbWUgb2YgdGhlIGFib3ZlIGFyZSB0
aGUgc2FtZSBhcyB0aGUgY29ycmVzcG9uZGluZyBCRDk1NzFNV1YNCj4gcmVnaXN0ZXJzLCBzbyB1
c2luZyB0aGUgc2FtZSBkZWZpbmUgbWF5IHNpbXBsaWZ5IHJlZ3VsYXRvciBzdXBwb3J0DQo+IChj
ZnIuIEJEOTU3MU1XVl9EVkZTX1NFVFZJRCBhbmQgQkQ5NTcxTVdWX0RWRlNfTU9OSVZEQUMpLg0K
DQpJbmRlZWQuIEknbGwgZml4IGl0Lg0KDQo+ID4gKyNkZWZpbmUgQkQ5NTc0TVdGX1BBUlRfTlVN
QkVSICAgICAgICAgICAgICAgICAgIkJEOTU3NE1XRiINCj4gDQo+IEJEOTU3NE1XRl9QQVJUX05B
TUU/DQoNClllcywgSSdsbCByZW5hbWUgaXQuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBT
aGltb2RhDQoNCg==
