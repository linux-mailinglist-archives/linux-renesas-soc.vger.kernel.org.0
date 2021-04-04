Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C1A3538A6
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Apr 2021 17:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhDDPrb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 4 Apr 2021 11:47:31 -0400
Received: from mail-eopbgr30057.outbound.protection.outlook.com ([40.107.3.57]:41681
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229861AbhDDPrb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 4 Apr 2021 11:47:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvXQZpX/IMMkPRivXDeAAy/PijHts0kWmZp6ryI+ik8S0/9SMhi4LWNLNsVYpjgZbTxROdgraa8VZRiZ3EhBio4BrzcybULkRhgSiZZhkltnPjxJWdD/4I+K79p5l8yJVAhxw9a2I/kFHaIMC3dPgnwppgx+PsUh8v5BvrZEyjDPiZ+zx7AmXTxSYtySgwIb8mMlOOKTMlDqwUl1OHCYYAIHDzlkdP7mxg2ONxIIjdIpsGKGGs9zHmI9pf2y7w0qRHnQT/NvnFxy3YjWHHAfPjph8nBlaLjlRk8grYwZabVzHJPsHXluzhNPnLm7t2TppnvBCfvIN5wezhdnj4AJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xX39VfRGkKRMe8yL7XQrE9V1wnb8aDGie1vsZBqlLA=;
 b=bekrZ2/o8z1XEVnMBL+NItTVcSCi4sZ0s1Da1RgzeKSF8Libr4qdUU2M4UTJY9HrFl+eoPeT7ZrC+crKnvW0y5NXufz/cq5iF/clGd0ITs79XhHG7zWudo+PUK+kP288AiFQ08AmXne2tYG+Lib17TCvSyDGZ1hB9Bqh7Ffb+hBPi7ftvgIokB8p8SZ80GHyLxscB2Yu+4ReqUu4G/tEO3o7AmlWUa19yFmsx7+Azg4ct0Cdi8SoRqomA+pIGEOZSwI9nZ44NpCsgd/e8w2rN9LgNCdsmzebxmNHytK76ew15cx4sxZJizj+zT8KD8onjeFvm79RcKJOdst8vXkjag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xX39VfRGkKRMe8yL7XQrE9V1wnb8aDGie1vsZBqlLA=;
 b=nNT1e4wvBhbG9W2LYLQcOIXbCF0a31QNPsdb/EFtYdG6Do+p+OD8p+/3f2nKsH+Cz4NBDAy2E6kL62wA+VXHL/NCdvlTalu9iqFvenw5+La4YUFWw37EKnX+H+Pc2DaTeehA/KfY/ZtzgOKsp7t3YEYeHJJNdFb4D0rNb540+W4=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2282.eurprd03.prod.outlook.com (2603:10a6:3:24::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28; Sun, 4 Apr 2021 15:47:23 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.3999.032; Sun, 4 Apr 2021
 15:47:23 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [RFC PATCH v3 4/7] regulator: add property parsing and callbacks
 to set protection limits
Thread-Topic: [RFC PATCH v3 4/7] regulator: add property parsing and callbacks
 to set protection limits
Thread-Index: AQHXFmCKB6Qxxnl3ZUKHw47lFmzZ/qqhm6gAgAMLMQA=
Date:   Sun, 4 Apr 2021 15:47:23 +0000
Message-ID: <33b652378ea04d522eb027080ed54883f0ed3d17.camel@fi.rohmeurope.com>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
         <b949e8131ffd8775e46fc51d3a7558586a9a4be1.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
         <20210402171832.GC5402@sirena.org.uk>
In-Reply-To: <20210402171832.GC5402@sirena.org.uk>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 257a5c39-f779-40eb-edb2-08d8f780f088
x-ms-traffictypediagnostic: HE1PR0301MB2282:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB22826F194437D8D95D5DEC1FAD789@HE1PR0301MB2282.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: REGLhnGCdHQWkRQOslGWclcmjtGUGXB/3tTWeZdis0BQYYC8iBvSRlkZLDtJfP4f3o+Y38XgmEnJ85c+adUD7ckpXxJbbPnC/DnOA0ot1n6ug9Sm+Vi3RpXVcVd9JzU+V4C96AKEqX7eMXfkt9htMDDn2SjGuLXQCfZY2ZE+trIboN/eC5+vWTihJ21Y78weB12ghX1zKLe/dUG8cz9euWwkHxicPXBm2cW/xLXTryZgHOk/dVmHkjyWQyJBm5o6wk7omGyl0rYAtzqse64wntX5VxdHhwM061dexVWnpc68BCOjMcqIPoPpbyhdo9oLzpH59biVG9AVfw+aOmdutl9F1qxnyrz2oOcV397GN8rDDDdTzjksPWV52AMhFxV3aGRhY09ajD3jkEOMkgkyoWSWlbAzF35tNXT+EqxIpjkzveKyrBNmyl4TQxAXzW5nQPVBbF79K83KrRqP9uUtQFI8/cZ2DR3cjFG1+JueRbB0rCSUw1mFS6p/kzq0sOmeJSSw/M5yyIBnQI7oMr+t0ZKa1bPunvbuTuPP4Qs/A33w2QHs/xkZJqT1/d/gsNiMpwWpdrvK8U0F/5PX2+tEVhxk2nIDl6HCLxgCEQH6PXISCbs/r+cwEbdlwSei9Y1Mv58TPXrgUyEDLfdS+sJrLoMFm5knctaY0GxHbl1uqss=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39830400003)(136003)(66946007)(76116006)(2906002)(6512007)(6506007)(8676002)(4326008)(71200400001)(64756008)(66556008)(66476007)(478600001)(66446008)(6486002)(86362001)(2616005)(316002)(83380400001)(186003)(3450700001)(8936002)(6916009)(5660300002)(38100700001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UmxucGJqNUt0T2hBZ0Q3eDI4NUYrSFJBdmhvR0lWbkROb0RrZEoyYlJSU2Nj?=
 =?utf-8?B?SW50VmdPTm9RWDdqY2NwenpWa0hUcVdPUVBQV2psVmQwWGU0cmRCVUxHd21y?=
 =?utf-8?B?a3NnaldRUmNYY2IrV1UwbkJ3SURuODFPRnJxaUJZUUhRV3Fzc1Nmak1DYS9a?=
 =?utf-8?B?Z2IxYjdOQ202R3pEbUFURjJmZE83WkJVMFJxaUxKLzc2cFd5Y1BSQktDcWQ4?=
 =?utf-8?B?VkJ1NWNuRGNzZUkvMlhXSFpwSm9xdjBQV0lSQ0d3TWNVNHY3NWdEMUdmbEo4?=
 =?utf-8?B?ejBkS0lPbEQ4bkJsMDdCYnBZMGUrdWh1SFJoNXBxaUdIQ0Q5YjFxMmd6S3Ix?=
 =?utf-8?B?Q3VpT0FJcXRubnRmS0xkWXA5OVZmY0ZBaFZCMVN1a3czMG96dmZsMURYR3lX?=
 =?utf-8?B?TFNlNkpxVlZDVlNRM2xDdmxnTnAyZzA5bTUwM3FIYkUxRENENmxGREc5MkY2?=
 =?utf-8?B?b2JJV3U3TmNXR2p4RGZSWFBncGkxdjNlS2w4VXZEZzNWeDlCV0llM3o3RWo4?=
 =?utf-8?B?ckRHSWo4NStGaHFCSmpOY3dwa3g0Y1phVVR5NWNVNStMcnVobEpILzFlWE5a?=
 =?utf-8?B?WmFzYjJ6eUJnbjZJQ0w1cWxZZkpNcjB3NjBRYmtJd0JCZk90TnBhd0VlSjVw?=
 =?utf-8?B?eWlxNUd3cUxrQmpuZzE4U09wbEtNam9uYSthY0xQTGpVbmhpY1VDMTl5eWdT?=
 =?utf-8?B?Y01ZZmthaHQrejVMMWl0ZC9oQW5BbEdGczdnaEI4bzFVNmJtMmg5SFlSUys2?=
 =?utf-8?B?cWc1VVdSQnV4dkxXSkMrSisxWmpSekxUSC9RR1dBeEZpby9kUHdyNVBkL3Ji?=
 =?utf-8?B?ODF4WnA0VmpvcnFTZERpL3ZJcVVqZjcxWXFibUoySjU0VHRvTXVlL2dHSDcv?=
 =?utf-8?B?TXJRaG12NXBFWUhFNjA1QXBDaFZjWE1ZSkFyL1ZENC9yRmFBMHZpODlmS1Za?=
 =?utf-8?B?YjZYZHhLTXlkaVU5SGthZ0VFOFF6SWJaZXo2V1UrWlk0RVlCZjdtRk5NdG1E?=
 =?utf-8?B?enJZMU1wN1lUemU0ZlI5aEFhTytJR3FDNFVTSmd0bE5STzZISUxRaFpDSHR4?=
 =?utf-8?B?cTJ1cXpQSHRRaUt6c0hLbk0wb2FyaTBXQ3E0U1QyMzVkVG9tWGdwcnRVL3ZK?=
 =?utf-8?B?UDh2ckVOZTh0V3o2MUw5YW9qTENPL1JWdUM3NDJpY3NGNmtHSCt1RFV3VmpC?=
 =?utf-8?B?MlpKNlpVdnFwcXNvcGxhZm9jTHpCQU5Va3ZkNGRHRDlyVzNTTUxKeHM4Nm95?=
 =?utf-8?B?ayt5VnE0T1NPYm9nOGd0dDBUZ2gxeGZ1UW5sYUdJaUZkMUpCVjloYWVMU01P?=
 =?utf-8?B?RE1GNmMySmxaei96VmkxdllPUWNHZHBFRHNGWXNsQ1hlNTJSeThqQzFSbzZT?=
 =?utf-8?B?V0hzenJZTWpMMENJM2M4YXJpN09UamkrdTg1VmpYVFNKZmkzem1uNmdaRlRD?=
 =?utf-8?B?SXM1bGRNQkdRME1WZEEzQTEwL2U5NmVXQzI4Y0grdWNVVGM4RmFHb3dhY1lq?=
 =?utf-8?B?am1ZN09XNDFoZ0h5eE5HaHhZY0F1S2pjTlNSZGxCb09GZkx3SXZDYW9TZDF0?=
 =?utf-8?B?ZU1XM2RsS3VKanBIOW93YTZNYVZ4UWc4eXJvWWF1akFSZThnWWUyc0dhMXZC?=
 =?utf-8?B?YSsyeWEzcTJYOHgwcnFEYys1SzlWNGZYaWM3Z2NhenhrWVpseUllWkl3V3lG?=
 =?utf-8?B?S3h5YmVZc2tzWGtRazk2TVlLWVRNVXMwTitIUHEvZXZPYnNobjc2WCs5RGFr?=
 =?utf-8?B?WnREM2hSR1JpSGc1WlYrblluQ3hEZGxtaXRmUEF6QVdmUUdNOGZ5RUFtK0lj?=
 =?utf-8?B?RzVuSTN1bWZ2M2MzVnkrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <175212B96B30084180AE4C95A087E312@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257a5c39-f779-40eb-edb2-08d8f780f088
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2021 15:47:23.4116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BxU+p3rBli/65SuB79UcSRWNOY5UBdj2jgUXA10zf1ZT6qCZeqme0wl+Z/bNNXasKOhC6Y679fxoXKuO5oGqcTVr5aH8uH02b4P+B+OuWJT4QPyLSHl0JvU6PFrExWYb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2282
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTWFyaywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3KHMpIQ0KT24gRnJpLCAyMDIxLTA0LTAy
IGF0IDE4OjE4ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBPbiBUaHUsIE1hciAxMSwgMjAy
MSBhdCAxMjoyMzowMlBNICswMjAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+IA0KPiA+ICsJ
LyoNCj4gPiArCSAqIEV4aXN0aW5nIGxvZ2ljIGRvZXMgbm90IHdhcm4gaWYgb3Zlcl9jdXJyZW50
X3Byb3RlY3Rpb24gaXMNCj4gPiBnaXZlbiBhcw0KPiA+ICsJICogYSBjb25zdHJhaW50IGJ1dCBk
cml2ZXIgZG9lcyBub3Qgc3VwcG9ydCB0aGF0LiBJIHRoaW5rIHdlDQo+ID4gc2hvdWxkDQo+ID4g
KwkgKiB3YXJuIGFib3V0IHRoaXMgdHlwZSBvZiBpc3N1ZXMgYXMgaXQgaXMgcG9zc2libGUgc29t
ZW9uZQ0KPiA+IGNoYW5nZXMNCj4gDQo+IFRoZSAiZXhpc3RpbmcgbG9naWMiIGJpdCBoZXJlIGlz
IGZvciBhIGNoYW5nZWxvZywgbm90IHRoZSBjb2RlIC0gYXMNCj4gc29vbg0KPiBhcyB0aGUgcGF0
Y2ggaXMgYXBwbGllZCB0aGUgY29tbWVudCBiZWNvbWVzIGluYWNjdXJhdGUuICBUaGlzIGFsc28N
Cj4gc2VlbXMNCj4gbGlrZSBhIHNlcGFyYXRlIHBhdGNoLg0KDQpJIGRvbid0IHRoaW5rIHRoaXMg
cGF0Y2ggY2hhbmdlZCB0aGUgbG9naWMgYnV0IGtlcHQgaXQgYXMgaXQgaXMgbm93Lg0KRWcsIGZv
ciB0aGUgZXhpc3Rpbmcgb3Zlcl9jdXJyZW50X3Byb3RlY3Rpb24gcHJvcGVydHkgd2Ugc3RpbGwg
c2lsZW50bHkNCmlnbm9yZSBjYXNlIHdoZXJlIHByb3BlcnR5IGlzIGdpdmVuIGJ1dCBkcml2ZXIg
ZG9lcyBub3Qgc3VwcG9ydCBzZXR0aW5nDQppdC4gRm9yIG1lIHRoaXMgc291bmRzIGxpa2UgZnJh
Z2lsZSBhcHByb2FjaCBhbmQgSSBkaWQgaGFuZGxlIHRoZSBuZXcNCnByb3BlcnRpZXMgKGxpa2Ug
ZGV0ZWN0aW9uKSBpbiBhIGRpZmZlcmVudCB3YXkuIFRodXMgdGhlIGNvbW1lbnQgc2hvdWxkDQpz
dGF5IHZhbGlkIC0gYW5kIHRodXMgSSBkaWRuJ3QgdGhpbmsgdGhpcyB3YXJyYW50cyBhIG5ldyBw
YXRjaC4NCg0KSWYgeW91IHRoaW5rIHdlIHNob3VsZCBjaGFuZ2UgdGhlIGxvZ2ljLCB0aGVuIHdl
IHNob3VsZCBkZWZpbml0ZWx5IGRvDQp0aGF0IGluIHNlcGFyYXRlIHBhdGNoLiBUaGF0IGFsbG93
cyByZXZlcnQgaWYgZXhpc3Rpbmcgc2V0dXBzIGJyZWFrDQpldmVyeXdoZXJlLiBIb3cgd291bGQg
eW91IGxpa2UgdGhpcyB0byBiZT8gSSBjYW4gY2hhbmdlIHRoZSBsb2dpYyBpZg0KeW91IHNlZSBp
dCdzIHdvcnRoIHRoZSByaXNrIG9mIGJyZWFraW5nIGV4aXN0aW5nIHNldHVwcy4NCg0KQmVzdCBS
ZWdhcmRzDQoJTWF0dGkgVmFpdHRpbmVuDQo=
