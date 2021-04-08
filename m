Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1AD0358044
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Apr 2021 12:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhDHKGh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Apr 2021 06:06:37 -0400
Received: from mail-vi1eur05on2044.outbound.protection.outlook.com ([40.107.21.44]:61280
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229517AbhDHKGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 06:06:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drbyFe0J1fAAP6A5Oxr9Vz+f1CIRuXSUWLBx+2F6iGz00A9m786H5QgcVaihlnmAMkU0Qj6T271g93HYKe+M9RP7QDr50TGatKZa1aawgCrGEm5wCSnG17XF9WvPK7r9bIEXg1H/0mhHvGDixUQwJqt6uk/7Me2pnctS9UyDttLbUCKDYFQj6qgpgQVNeNdHLL41nqnZL5HjFnlSGlJHPkPTc0YeFxr5ENUrgHK5XazXeqItWXexRDfbp1x6jdnHlOxouya7zxqCct8P8Un/ButEXMWavOVohwVqUmbI+R5ous4sR5posgCuJjYcTmusPBRMCSbaL26kty2hIrBMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTlWZgX2VhF6OwbV/MO3uFBDTCyriZymBQMWaHqEC3I=;
 b=BP92BYh5+jGN7Aw4Znc8x3l0LI9xgfmjAK+Xn/KQmoKmFuxT5PoSlhIvPGF9cqSKqx7E+6CwBiYjNbpv1+uOi2len32gho33OR9L+9O5ctNh2ntLSWq52kWdj7/bhE6twmstlqq7xqih6liqPkSE6l0ZvFx1PhzlEVLPHBJjPCqgMOPAp/zCvt5ityDwmedBtPhOCPPgGrmt0ITz86BRSvjc6CPda85AYkT3Rw2ntz+belpvQD8gp+hdAFdfG454tgKEkZ9B9eI1foPmqAHbTyHyOBziWholPlq+pUq6N/g1nUqLyEzRDm4mAzMq9Jth67SjxrehmglK87AaXuq5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTlWZgX2VhF6OwbV/MO3uFBDTCyriZymBQMWaHqEC3I=;
 b=hUTq4WAp5XdjFBHJadimD9+jo6awnrwpWW+c3jA0l8ngC+J7h2jAJjsr1KQQg2q1grQa1F6SehnMeCdsgAksPXvklIS7zARyWXxXoX2bdQnNZQ8o7bataL/e596TfJ5VYRxJXPEAVR0+CKeW6TZCm9iv3x5fkpOVp7/DaPK4788=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2476.eurprd03.prod.outlook.com (2603:10a6:3:6e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17; Thu, 8 Apr 2021 10:06:21 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.3999.033; Thu, 8 Apr 2021
 10:06:21 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH v6 3/8] regulator: IRQ based event/error notification
 helpers
Thread-Topic: [PATCH v6 3/8] regulator: IRQ based event/error notification
 helpers
Thread-Index: AQHXK5VlSdnhnApYI0mjxkiLssqN0qqpCr6AgAFZhl6AAAI2AA==
Date:   Thu, 8 Apr 2021 10:06:21 +0000
Message-ID: <d9a07c8d29c04d91d9fdf2946c54f8c9f107fb26.camel@fi.rohmeurope.com>
References: <cover.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
         <0862bbb6813891594f56700808d08160b6635bf4.1617789229.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VcHeiQgvZ5e+Dz+gpKghCo5RSTQLsyHGGSgdVQbVu2t+g@mail.gmail.com>
         <23c73081365fddce2950c101a51fc2baaaa37aa5.camel@fi.rohmeurope.com>
         <CAHp75VdYniyc8jovg9VDgwQ+_VjYOoAubB_QSokEN+REcnKTrw@mail.gmail.com>
In-Reply-To: <CAHp75VdYniyc8jovg9VDgwQ+_VjYOoAubB_QSokEN+REcnKTrw@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5225e189-e15e-4168-24b0-08d8fa75f5e7
x-ms-traffictypediagnostic: HE1PR0301MB2476:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2476BE49F44FFB2F48E3CE05AD749@HE1PR0301MB2476.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: id3C2oUrpFU64sXJEd+CShbqllQ97rkjibQdnWNBlhPay3HSaNPG7wnuZCF3YJi4BywdEOBZQ6gFIfJtwdLa+7Hdea6M/vW93aCQiBKEuYaFlol38cV47Zf0w89eWYdtuShMbvHUMrG1zl0yj8rEjFB+56p0V2ipJ066Bg6doGOEUoTWK8i9mJzHydhOctsW+VIu+1feIpzketldsnlR/jipUJhcqb67VV0Xi+ElSvG8Tv8wz8s4t4OxEGua2iKdJ6367X4HwgbcyZxgRGMBbPgmDYmEeVw7gXbXh+5Ww24adCD+6WZZnZR/+QbGq/Pou3W1EporH1qV7TlWlaYXJ8iumF6yNcg+oKVv84lfUwC4mUbf+4MREE2o1fa30uaMIjAhGMxvaNM1Nf4iKOumvshIKe6m8zjy3oCFDOO24abPtNDesnny9E3rFBIMVNgq1hw8akzoc4yMTvWTTUoKRkW7HYA0mqsDKbha+RxmBCIhePBxj3nMuBPzs1ywUyjKBez2IHlNCH9U+rr0CFtXGmcN6ZbknIS2pp70n1TTv/5BxSqoPbZ/iZf+6934q/mtLXyjyOso9xXp6tk5o+DZ+JDAxiJ7Pa6RJj2+WAPSyZoOZVX4s+4HtO4amT108DCaytbg52uGmn0v6N7gl5M7yniktVcUpdDTovI9kBux6T4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(39840400004)(136003)(346002)(2616005)(5660300002)(71200400001)(53546011)(4326008)(8676002)(38100700001)(6512007)(316002)(186003)(6486002)(6506007)(478600001)(66476007)(6916009)(8936002)(66946007)(66446008)(66556008)(3450700001)(7416002)(83380400001)(15650500001)(76116006)(86362001)(54906003)(2906002)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZjZsT3pXQURWUHJJVG15NnRLZEZNTFVMazNWY1kyMXB6bFRjQ05ScCt4NVRG?=
 =?utf-8?B?RDY3ZTk1VUU0Y2syNnpvM2dOUCtkTTVNTElOeFJBdGRjaHpVMTRoaUtwMHRs?=
 =?utf-8?B?NmU1RENNbHhuZ3IzTmFqdW50eit0SmYvV0I4b0tOdXRiVlNoN0NwMG5lQ3VW?=
 =?utf-8?B?TGtibFdSa09BeW92cG1hNEN0Q3owUlB6RXkvM1hsVXhkZWVTa09vZmZseWRm?=
 =?utf-8?B?MWU0WFNEb0lBWStlYTlEWXlRdDVhMThIWUlXM0MzTWtsN2NheTROR3d0MXlx?=
 =?utf-8?B?Y092MDg5TzZ5SFk2VC8wMzVCLzFEZU9jWnlmWjE2WFNIWnVnOHBhbEhaeXoy?=
 =?utf-8?B?YUxsaWVwamFPb3RJVlJZM2xjbVEwV0dFZHRRUkhDYjMraHhuY0k0L3oxaDdD?=
 =?utf-8?B?cDJsUDlEMGw0V2RuRFpxZVJnc3dYb2JaVE43Smt3ZEtPMjNoR1BRK05qNEdY?=
 =?utf-8?B?aGF6RG1xQnE1U3pKRW84UXpRUFpIaTZ3WXFhUWxPUXQrVkY3cjhqODdNYy8x?=
 =?utf-8?B?TnNtNlNXZHM1TUozeXRPamszRXREZzZMT2xxdDV6Q0JMK1lSMFpIcnR1ZHhT?=
 =?utf-8?B?VDNrbkpSZUpEWHd5Vk12eVgxRysxYkpJaUkyYjRkMklDdTUyYWdlUGRabUZo?=
 =?utf-8?B?clJOOFVCTVBuZlFmMkF5ZDRoaTV6SXR5T0E2SG55WS9mTjJqZkh5d3BHcVFl?=
 =?utf-8?B?U0ZmVHBqMG5qamlnYWhnRVlLUnNZeTJLQU1aN1RsTW0rMkNWRUc0a05GWHFN?=
 =?utf-8?B?a2lWUHpIK3B4cW9iZjFGZllwSVFMT3lXOVJSMlJDM05uVzlVZkk1Z3pLUmd3?=
 =?utf-8?B?UktiZ3grVXZMeThJODBjbUJoakd2YjdoT0JyU0ZnZ2xKeVpBd3VHaGIzYklv?=
 =?utf-8?B?Q1V0cVcrL1JZdnJjTWl2dXBMMzlUbmR6WjhSdjE4S2FpRUdtOFpHa0lqUkls?=
 =?utf-8?B?ZzlneFBkSG9vbXNnNkI1VGdCSHFIYjZ0V1lLMzhETk9NTWJhMVAwNjZjaCti?=
 =?utf-8?B?bHlBV0NYM0ltUWEwQ1JRSUVxY1p2N1c4ck1nK2ZrdThZNFF3ekluK0E4S1pB?=
 =?utf-8?B?SVlyL1BMTW5qTWdSeUd4RXVrMzlQaytDc1lMQTRvbmVUUDR5ZDBqYzZDWGVU?=
 =?utf-8?B?cmlOYkdkOGN5SFFUcXpQTXV2RE9UOURIUXBIT1pKZXJud3JNTGNaWnQzNTQw?=
 =?utf-8?B?NkpXUXBrdFRGaUxPVW1IZDJNOE4zZmh5ck5LWlFZcXZVV092em9Odml3VjFB?=
 =?utf-8?B?SXBSSjBJYk5FWERDWGlMTkRrUU1mT0ZneFFoY0VWUmpsczJBZWY4TEYwVXhz?=
 =?utf-8?B?Y2tpVExQQWlhY1UwRGVPK1dGbmRhL3VNVEZ0MDROL01rcVRQakZZQ25qWUFL?=
 =?utf-8?B?M0J6MUxsRzJTZXhQV2U4eUI5RjZheTR4Q3lUazJ3MnAyUm9kVzlHQ01UcWhB?=
 =?utf-8?B?RlZiczVlYnp1b3NWTXVVdGFqN21mVzg2cFdnL0EzYU1tWXdncGtkUWZIb2Uw?=
 =?utf-8?B?UEhqNEhmMUxtUFNUYkpZRUZXdXJsaEx6ZlNMZWpMdkpxWnlQZGd3YWovL3lL?=
 =?utf-8?B?Ymx1enlhSWJKN3E4dUEvZVNKa01JWXRuN3NZSWgwQTNxMW9jMy9WcmdnbEFF?=
 =?utf-8?B?RGJlKzYyUFB3QXRDeWFTSmNodi9Gek1paU9zRTlkNmVuclRCZUZTS0IyWTNU?=
 =?utf-8?B?R2M2ZlYxMzh2VCt2OEdNUnRKZStzSTM2THN3a1Q5UVp2NUVSZDJBUURic2RE?=
 =?utf-8?B?YWVPM1kraGVKNExKQzg2VlFOR3laaERqd2RUM3JLQjhoV2pEbG9jSjhBbkVl?=
 =?utf-8?Q?+Abz9BxB2XHMVFcspbsbUG/PhR+tPUCXrbzH4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F21B2166B748C1418C8F13812ACC22D4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5225e189-e15e-4168-24b0-08d8fa75f5e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 10:06:21.5019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tMf0yS+Aq2Xg2fEsQPH2MjjqJwx/K8nFHPN6lGKEz6q2t3JM0QoX9P4/IxCj4IgJFEcdRDAVuGqdFmqzfLYo4K8htKQv1WTiEm6jAML2zLC+RX+CIdtGv2N4MpbdvyfX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2476
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpPbiBUaHUsIDIwMjEtMDQtMDggYXQgMTI6NTggKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90
ZToNCj4gT24gVGh1LCBBcHIgOCwgMjAyMSBhdCAxMToyMSBBTSBNYXR0aSBWYWl0dGluZW4NCj4g
PG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+ID4gSGVsbG8gQW5k
eSwNCj4gPiANCj4gPiBPbiBXZWQsIDIwMjEtMDQtMDcgYXQgMTY6MjEgKzAzMDAsIEFuZHkgU2hl
dmNoZW5rbyB3cm90ZToNCj4gPiA+IE9uIFdlZCwgQXByIDcsIDIwMjEgYXQgMTowNCBQTSBNYXR0
aSBWYWl0dGluZW4NCj4gPiA+IDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdy
b3RlOg0KPiA+ID4gPiBQcm92aWRlIGhlbHBlciBmdW5jdGlvbiBmb3IgSUMncyBpbXBsZW1lbnRp
bmcgcmVndWxhdG9yDQo+ID4gPiA+IG5vdGlmaWNhdGlvbnMNCj4gPiA+ID4gd2hlbiBhbiBJUlEg
ZmlyZXMuIFRoZSBoZWxwZXIgYWxzbyB3b3JrcyBmb3IgSVJRcyB3aGljaCBjYW4gbm90DQo+ID4g
PiA+IGJlDQo+ID4gPiA+IGFja2VkLg0KPiA+ID4gPiBIZWxwZXIgY2FuIGJlIHNldCB0byBkaXNh
YmxlIHRoZSBJUlEgYXQgaGFuZGxlciBhbmQgdGhlbiByZS0NCj4gPiA+ID4gZW5hYmxpbmcgaXQN
Cj4gPiA+ID4gb24gZGVsYXllZCB3b3JrIGxhdGVyLiBUaGUgaGVscGVyIGFsc28gYWRkcw0KPiA+
ID4gPiByZWd1bGF0b3JfZ2V0X2Vycm9yX2ZsYWdzKCkNCj4gPiA+ID4gZXJyb3JzIGluIGNhY2hl
IGZvciB0aGUgZHVyYXRpb24gb2YgSVJRIGRpc2FibGluZy4NCj4gPiA+IA0KPiA+ID4gVGhhbmtz
IGZvciBhbiB1cGRhdGUsIG15IGNvbW1lbnRzIGJlbG93LiBBZnRlciBhZGRyZXNzaW5nIHRoZW0s
DQo+ID4gPiBmZWVsDQo+ID4gPiBmcmVlIHRvIGFkZA0KPiA+ID4gUmV2aWV3ZWQtYnk6IEFuZHkg
U2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4gPiANCj4gPiBJIChldmVu
dHVhbGx5KSBkaXNhZ3JlZWQgd2l0aCBjb3VwbGUgb2YgcG9pbnRzIGhlcmUgYW5kIGhhdmVuJ3QN
Cj4gPiBjaGFuZ2VkDQo+ID4gdGhvc2UuIFBsZWFzZSBzZWUgbGlzdCBiZWxvdy4NCj4gPiANCj4g
PiBJIHN0aWxsIGRvIHRoaW5rIHlvdSBkaWQgYSByZWFsbHkgZ29vZCBqb2IgcmV2aWV3aW5nIHRo
aXMgLSBhbmQgeW91DQo+ID4gc2hvdWxkIGdldCB0aGUgcmVjb2duaXRpb24gZnJvbSB0aGF0IHdv
cmsuIFRodXMgSSdkIG5ldmVydGhlbGVzcw0KPiA+IHdvdWxkDQo+ID4gbGlrZSB0byBhZGQgeW91
ciBSZXZpZXdlZC1ieSB0byB0aGUgbmV4dCB2ZXJzaW9uLiBQbGVhc2UgbGV0IG1lDQo+ID4ga25v
dyBpZg0KPiA+IHlvdSB0aGluayBpdCdzIG9rLiAoSSBoYXZlIHRoZSB2NyByZWFkeSBidXQgSSds
bCB3YWl0IHVudGlsIHRoZQ0KPiA+IG5leHQNCj4gPiBNb25kYXkgYmVmb3JlIHNlbmRpbmcgaXQg
dG8gc2VlIGlmIHRoaXMgYnJpbmdzIG1vcmUgZGlzY3Vzc2lvbikuDQo+IA0KPiBMb29rcyBPSyB0
byBtZS4NCj4gSnVzdCByZW5hbWUgZGllX2xvdWRseSgpIHRvIHJkZXZfZGllX2xvdWRseSgpDQoN
CkkgZGlkIHRoYXQuIFRoYW5rcy4NCg0KPiAgYW5kIGluIGFueSB3YXkgb2YNCj4gY29uZGl0aW9u
YWxzIHdpdGggdGhhdCwgcGxlYXNlIG1hcmsgaXQgd2l0aCBfX25vcmV0dXJuIGF0dHJpYnV0ZSwg
c28NCj4gaWYgKGJsYSBibGEgYmxhKQ0KPiAgIHJkZXZfZGllX2xvdWRseSgpOw0KPiANCj4gd2ls
bCBiZSBhbiB1bmRlcnN0YW5kYWJsZSB0cmFwLg0KDQpWYWxpZCBwb2ludC4gV2lsbCBkbywgdGhh
bmtzIGFnYWluLg0KDQpCZXN0IFJlZ2FyZHMNCglNYXR0aSBWYWl0dGluZW4NCg==
