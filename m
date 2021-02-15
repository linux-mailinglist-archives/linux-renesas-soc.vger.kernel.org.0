Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D928131B71B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 11:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhBOK0Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 05:26:24 -0500
Received: from mail-eopbgr50082.outbound.protection.outlook.com ([40.107.5.82]:28038
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230049AbhBOKZ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 05:25:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATdLjEjGipkM1zVuxmTQYcg491KMYbAqapaC5NZ+UGC06/gd+xm4iqCQF0rSilBx9QAtegx6mdEm52PxbbwtUkg8yNDmj/FmTQYpXrRpcIhim0g/rrth2K+tbk1PPUlgXwDqke2zfgA5YMC6zOGetWE+N5xQJ09MVRuE1tbt/Gm8Ji/cq7WVdYMn7EzfWHps7WxpMIcLhScEaxOWWyKPYDRZmBlLi5rEorJJWdzxec9kugMj5dk/010Y9OZOnfUoR+Hu3/qVhJN1Ks+o5/G/5UuFx/O75YKNrGj6iS/pWh3XWFsumnnxBK2N973qb0vKwp6Ads1nmq84cfSfCwnuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0adlE/bSmqZHiyxR1tq1ePVjJTzF0vGXD0IB2hz9PaM=;
 b=dwkBTgRGA1jBdsjjDubCzHo04JOdj3V4wrxj0MUistefT6tmlLEg0kaouRr2ygTlqfcQNB4tDVOgMdWJE4Z4D2hR37zWf5zZGxxUJNY+LphWiNDBEdQGeaCABQwyDlDzCjVO2SQ6EjaBQvR9cuPw69ffMLHVIyMKOvQCo18SIpOBsFbOmqoALOIUYMQKQW7c09XCyKe6jmMThO7zVBeRPuDXtICd3kkSuClHrmzvmOROyl5DRUK30aXfcn4OihIbYD8kaY2eCIsplWDlILagKPnP3pqjdzHMCVXEHlWHqahvQ21aJBPawSD6SZhmWNlXSom+jWVeyj4fFVX5thmGrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0adlE/bSmqZHiyxR1tq1ePVjJTzF0vGXD0IB2hz9PaM=;
 b=kQ3PDojHWoo7JQN2mNDx9i4cORZSSIpfSeMWgbNhqbfgKc1ah5f7MtjA/zScjGPbt1ciWboAIghWBOGqnd8HJqXscx4tivmiFM4IplojnWfdHmkgjybJDWXVj1X2IqbdLvzfI/81MZFoKwT/kSeHJ9MYPfAb9WC+RHbByPj3Im8=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2169.eurprd03.prod.outlook.com (2603:10a6:3:21::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.30; Mon, 15 Feb 2021 10:25:06 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c18c:4a01:ca24:78c1]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c18c:4a01:ca24:78c1%5]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 10:25:06 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 3/7] regulator: IRQ based event/error notification
 helpers
Thread-Topic: [RFC PATCH 3/7] regulator: IRQ based event/error notification
 helpers
Thread-Index: AQHXAHJWKt8WtHiVxkqAUnHICp8Su6pZCMKA
Date:   Mon, 15 Feb 2021 10:25:06 +0000
Message-ID: <6d6583ef2dd5fdeebc6b374de4af3f1b9d46a6c8.camel@fi.rohmeurope.com>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
         <3daf0531910c25d8b0da3964778ae2a6c9049d43.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <3daf0531910c25d8b0da3964778ae2a6c9049d43.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a497cae-42e9-4780-562c-08d8d19bf707
x-ms-traffictypediagnostic: HE1PR0301MB2169:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2169B855559113F91FD66AC2AD889@HE1PR0301MB2169.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6UEvsBcaR5NhacXFHXjWVrFX7Vnl06isUpd5w3mktA+xiJiNzjqnsGqQbG5QY7UBFsUQpEI/9k12R66+QyqY9RbMluhp5hJruVrXGQRbzFXqUtBqlzsGJRpqscPARsJ8bqH43JQRQ8nC6LGqMr0IO0oy+LxXSKas2XGw4XFrfLz0BrAg3pFr36xJaxJomTX3yYWedPnx6UiaWSQ333RhGfp6PyXuS6Hfpzf6sWHgJHD42LsbsGGZYJGtyJ1CbH5SjQnNFj4HhrUKtaCCpWTmSHk3QEo0HZs9YvvG8gHq9y35cz2ADzGWxDur/guan6gm3SxHD3li8qvx+1IC5EKc5ZpzMkQX14swK8wk8raq3GOPFsYDlTiXTX4sTxOMVpH/rtSd56brg4NNvMWUth1I+6SvoPAQV8ZvLg9XIKY5EZVqt9zr8ab16DNyz8ozkgA7cysBVH8OIIrHco8r9qsV3khtEteTCoLz/ZSOJ378RzPCsG3w7o95kESgFvAASwkHVArXX8s2wimMoyB3uNL/Eg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(8936002)(76116006)(6512007)(3450700001)(8676002)(5660300002)(83380400001)(71200400001)(6862004)(186003)(6200100001)(15650500001)(64756008)(478600001)(66476007)(6506007)(66556008)(6486002)(66446008)(4326008)(316002)(86362001)(37006003)(66946007)(2616005)(54906003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?K3dmQnF2MUkySmI5N3U4WnRXK0k5d0lNVWc2NGw2R1J6Z2kxY3hRRG5BMkI3?=
 =?utf-8?B?SFBRb3ppMy9aUzBOeHNXR2lFVXZjaFhyYjE3Y005a0NNTXM0US9ZZnJUeTZU?=
 =?utf-8?B?ZFgzWnhZTno4dHZwY20xMVNYMVFjVEw2N0tHSzF6U0xPQlBXZXBQVVVPODdo?=
 =?utf-8?B?bUJ5b20wQXF2VHFoME0vTlpvUGZMSmZqNHAxMm1zV29UVEpMd3NvSDA0Q0NK?=
 =?utf-8?B?MjBmR29XOFQwOEdhZ2VkVTkzR3h1aHV6SWttQzBLUmdIVG5ibENPQUlOUlRR?=
 =?utf-8?B?MHgzTU83YmZMRVIyMTlXVXNnZ1c1SEpoT0hUQ0x5V2xCdUcxWlN6VDZKU0lS?=
 =?utf-8?B?YzRYTE9rUEZEM1Uxb001SGZzeVJ2dzJMODVKUGhpTmllaXNaUVkrVDE0UGtn?=
 =?utf-8?B?OTZzZWIva2VtOHhmUytTbjlzSUY1QXNtbVdkVVM3MStmMndHZTRnUzdPWWlC?=
 =?utf-8?B?bXJzWU84VkNBT05WL1Z1WFljcURtejlwVmcrdXdYRzJ2UkRqdXluUzdTLzlo?=
 =?utf-8?B?TzkzRWhzZ2VZM2FNYzFrZEdjajFrYlE0a1VkNG9Vb1ZhclFiWnIwMkMzUGxX?=
 =?utf-8?B?ZjI5WmJFZzFXSEpEN1lmYU9QNnUyQS9ndGppZ1JHbnVyaXRzdE1veHY2Q0ZS?=
 =?utf-8?B?Zm94SEN4ZzErWlVCWHVndzRVbG9KQVUyQkVuSWdkdVVsWGg4YnA0eGo2dnV2?=
 =?utf-8?B?VHBIaGxVamg1VjhoZEplc2NPMFovSUVJQUZ3NnF0aFRBN0ZodXdOVXhsRFpJ?=
 =?utf-8?B?TW1QYlg5OG9mUE9hUnNOMy94K2lUWXBPYVdreHh0bGRsM3RqOEhGRVE5KzRi?=
 =?utf-8?B?VWhLWFk0YnBRUGVQUmZsVElTaWZpRU5oTWh0Yk12VUZQWVU0MVZHaXFPeGdC?=
 =?utf-8?B?bUc0ZEIrTXh2U05VSnp1SkpicUVtY0loS05HbEdwRmQ0bkVZTlRMdGUxbFBW?=
 =?utf-8?B?dUpJV2N5K0V5MWE3VnNqQlF3REdxMER1b2M0bjlSQkhaNXdBMmJDVE1pdzd2?=
 =?utf-8?B?ZE5qNGN3SUdvQmV1VFA0VlZQK0JUUlJsckVnTnBmQTE2ck5LTEhYRU1GUElu?=
 =?utf-8?B?SVBwbWtXQUZSdnFlOHhYcm01YmFzY3phZndxa3JOaEtSSEwwNTdiRFdPUjhX?=
 =?utf-8?B?UGNieWpsK3ZiM2tpdGpycVg2TTBWR0xLMlN6d1Q2RDJXekpra1RUS1hlb083?=
 =?utf-8?B?OUkyMzdhK0xNVlBWRzhPNDAyWkhoQUFYcDJJUkEwRkQxYzlpRUNoRFlwNWpk?=
 =?utf-8?B?bzFseWYweDRsL2VHZVBLVkN6bCtIZ21rUVZ4Um1RK3VNM2RHRUZSQXp6cnN5?=
 =?utf-8?B?SHZsUUhrRFJsWXMreER1bjZmMWdUemxYRjhrNlBZSTZMV2MyQVBpR05IYkN6?=
 =?utf-8?B?VUd0SGtkQU1XakFzNDFxQVlXbU8rMlRETjI5SXhFZzdGcVZweDByV25VQ3cy?=
 =?utf-8?B?ZTRqa3VnMUY1c013cThXc0hzcWlkWHRJbW1jSlZUaW41UXlFajYxNmY0dGR5?=
 =?utf-8?B?REU1eDI2TWVDSnNzd0RnUVJYRGZMZ0hIUWNPQWZQanhmc1hQT3ljamdBWFVp?=
 =?utf-8?B?R2VWS3R2TjRjNGVrY0poN3ZWWG9scnE1dDhKaEdKc2lqMS9tN0tUQ0NrcWRN?=
 =?utf-8?B?V0JSS0E4VTFWaWdiZVhCNXBqN0JNbmx1dW9Wb2RkK1FuWklnWlAzWmk1RktE?=
 =?utf-8?B?bGNvWktRV1RRV2JQZEJEZUJibE5SMmNKRHFvRVRwcUM1anRKRExSa1c0aURC?=
 =?utf-8?B?ZzdNTzlzRGhDbkRRWjBqRkJNSkYwSkRGN3VnOW5rWTFaVG5HREhuWFJQUTMr?=
 =?utf-8?Q?Ar97DN6i5mwHGvIxnWDd9Qnu3mZJNjkZMPdsY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E5CA8E4E255104FB3052DA80F8FAD97@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a497cae-42e9-4780-562c-08d8d19bf707
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2021 10:25:06.6425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GOBYEx2yCnF6RMTj6WbCaIY4GZtz1eM4Grs6bllpDn2j9FihArwjgIJpBuJsXRChJx2AKGBGOWFqVBaUGIKgOd5U3UPjcvJ2aoMZRW7XuznYmxrGfq/OcK4pCNrmJ4TG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2169
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpPbiBUaHUsIDIwMjEtMDItMTEgYXQgMTQ6MzUgKzAyMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90
ZToNCj4gUHJvdmlkZSBoZWxwZXIgZnVuY3Rpb24gZm9yIElDJ3MgaW1wbGVtZW50aW5nIHJlZ3Vs
YXRvciBub3RpZmljYXRpb25zDQo+IHdoZW4gYW4gSVJRIGZpcmVzLiBUaGUgaGVscGVyIGFsc28g
d29ya3MgZm9yIElSUXMgd2hpY2ggY2FuIG5vdCBiZQ0KPiBhY2tlZC4NCj4gSGVscGVyIGNhbiBi
ZSBzZXQgdG8gZGlzYWJsZSB0aGUgSVJRIGF0IGhhbmRsZXIgYW5kIHRoZW4gcmUtZW5hYmxpbmcN
Cj4gaXQNCj4gb24gZGVsYXllZCB3b3JrIGxhdGVyLiBUaGUgaGVscGVyIGFsc28gYWRkcw0KPiBy
ZWd1bGF0b3JfZ2V0X2Vycm9yX2ZsYWdzKCkNCj4gZXJyb3JzIGluIGNhY2hlIGZvciB0aGUgZHVy
YXRpb24gb2YgSVJRIGRpc2FibGluZy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0
aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiAtLS0NCj4gDQo+IFRo
aXMgcGF0Y2ggaGFzIGdvbmUgdGhyb3VnaCBvbmx5IGEgdmVyeSBsaW1pdGVkIGFtb3VudCBvZiB0
ZXN0aW5nLg0KPiBBbGwNCj4gcmV2aWV3cyAvIHN1Z2dlc3Rpb25zIC8gdGVzdGluZyBpcyBoaWdo
bHkgYXBwcmVjaWF0ZWQuDQo+IA0KDQovLyBTbmlwDQoNCj4gKw0KPiArc3RhdGljIHZvaWQgZGV2
X2RlbGF5ZWRfd29ya19kcm9wKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqcmVzKQ0KPiArew0K
PiArCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygqKHN0cnVjdCBkZWxheWVkX3dvcmsgKiopcmVz
KTsNCj4gK30NCj4gKw0KPiAraW50IGRldl9kZWxheWVkX3dvcmtfYXV0b2NhbmNlbChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdA0KPiBkZWxheWVkX3dvcmsgKncsDQo+ICsJCQkJdm9pZCAoKndv
cmtlcikoc3RydWN0IHdvcmtfc3RydWN0DQo+ICp3b3JrKSkNCj4gK3sNCj4gKwlzdHJ1Y3QgZGVs
YXllZF93b3JrICoqcHRyOw0KPiArDQo+ICsJcHRyID0gZGV2cmVzX2FsbG9jKGRldl9kZWxheWVk
X3dvcmtfZHJvcCwgc2l6ZW9mKCpwdHIpLA0KPiBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIXB0cikN
Cj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gKwlJTklUX0RFTEFZRURfV09SSyh3LCB3b3Jr
ZXIpOw0KPiArCSpwdHIgPSB3Ow0KPiArCWRldnJlc19hZGQoZGV2LCBwdHIpOw0KPiArDQo+ICsJ
cmV0dXJuIDA7DQo+ICt9DQoNCkkgc2VudCB0aGlzIGRldl9kZWxheWVkX3dvcmtfYXV0b2NhbmNl
bCgpICsgZmV3IGNsZWFudXAgcGF0Y2hlcyBhcyBvd24NCnNlcmllcy4gRGlzY3Vzc2lvbiB0aGF0
IHNlcmllcyBjcmVhdGVkIG1hZGUgbWUgcmVhbGl6ZSB0aGF0IHdlIGRvbid0DQp3YW50IHRvIGZv
cmNlIHVzZSBvZiBkZXZtIGJ5IGhpZGluZyB0aGUgV1EgaW5pdCBoZXJlLiBXZSBzaG91bGQNCmlu
dHJvZHVjZSBhbHNvIG5vbiBkZXZtIHZhcmlhbnQgKyBtYW51YWwgY2FuY2VsbGF0aW9uIHJvdXRp
bmUgZm9yIHRob3NlDQp3aG8gZG9uJ3QgdXNlIGRldm0gdG8gcmVnaXN0ZXIgcmRldnMuDQoNCkFu
ZCBhcyBJIHNlZSB0aGF0IEdyZWcgd2FzIHN0cm9uZ2x5IG9wcG9zaW5nIHRoZSBkZXZtIGJhc2Vk
IGRlbGF5ZWQNCndvcmsgY2FuY2VsbGF0aW9uIC0gSSBndWVzcyB0aGF0IGlmIHdlIHdhbnQgdG8g
cHJvY2VlZCB3aXRoIHRoaXMgb25lDQp3ZSdkIGJldHRlciBmaXJzdCBpbXBsZW1lbnQgdGhlICdu
b24gZGV2bScgdmFyaWFudCB3aGljaCB1c2VzIG1hbnVhbCB3cQ0KY2FuY2VsbGF0aW9uICsgbWFu
dWFsIElSUSBkZXJlZ2lzdGVyaW5nIGFuZCB1c2UgdGhhdCBjYW5jZWxsYXRpb24gdG8NCmJ1aWxk
IGEgZGV2bSBvbmUuLi4NCg0KSSdsbCB0cnkgdG8gY29vayB2MiBzdGlsbCB0aGlzIHdlZWsuDQoN
CkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0K
