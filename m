Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C558E3B9136
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 13:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236204AbhGALg5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 07:36:57 -0400
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:14272
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236130AbhGALg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 07:36:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GY4iQQ1tQxtEw4hejc1wZiAjMqnNKPTS9u7MBOhJAW2HD0hx/Zx+YhHWvo4rEbRTzV9Z+KIAWtfoG9ctZRp1Ola3y6ZfLLpi7ZISErckfDmr1uWHa54n5kIy+Jv1XoDQ2GoweAiKXckDyCiDujRxHp1L1+XP0flPXCbv678YOSCgkv6GeDczVZd+gMgAkTGbl3qQozDBAvyA+AArHMVUzLmA3m36mFZYs2K5HaUflBzla3ZQNEr4x1QQCsAtX81mwO78L9USgRi0jd4Tcujvxw1ROLGR7iNDJz4pH+tAyIDggif5U+NbyFJAv8FqQrRIWhiQ+1d5L8ZudX3Rp9jHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNx3HWZAeUmt8KRf2YX2VqUzo6anODNgYFjMuQLVpbw=;
 b=iPpVqEzmb6OAOLAgnmUiT6Nyasra/X69RF5NcjAfzU6uD+S8+Up3rAE9WMKjr5Ndj7BLA0Pb7snuOnspxGiEv/5R1jRoWUehbdkEX/Ccp4/wMAdMRJb4Qc0vExTNfajmunQl5oaq0XhFfVlV2QKhSj5q8BHXDIWttp951kBM4k3bzHyE45uH2Dai9hvsA2EEfDVVefGbm76IC5vmfQ33YKRD1noikPWEm7vDaYw8ZVKxBRONVVyHm5EVQuusQJyU5GeNYP2gY6mm5k6JYGBGPUsaX32Pu1tqjh0DXC47HAK0mwFZND1EtuxpYCMh3DXx1UYhvSTkBD4Se8xhn/kXIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNx3HWZAeUmt8KRf2YX2VqUzo6anODNgYFjMuQLVpbw=;
 b=ThUb8Wf+l/qX2XJLcUUtbb0WCO7IbNBRiRK4lpI/mq5+t9tW9cZqMUoXd79TypnupD+U114kY9PGBvUi49z0XlqwqaEtEJb+CzF9pmk97todlc9s54S+xJmePiRd4rQhe5TAUp0T4YPGVwDjdj0685yVFN8t4bSDYvzNGIamBbs=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6350.jpnprd01.prod.outlook.com (2603:1096:400:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 11:34:24 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.029; Thu, 1 Jul 2021
 11:34:24 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>
CC:     USB list <linux-usb@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/3] usb: renesas_usbhs: Enable support for more than two
 clks
Thread-Topic: [PATCH 2/3] usb: renesas_usbhs: Enable support for more than two
 clks
Thread-Index: AQHXbdWvj0l2neJgTUiXf2ey8vEEX6st1ViAgAAn1NA=
Date:   Thu, 1 Jul 2021 11:34:24 +0000
Message-ID: <TY2PR01MB3692DA5F92178F1ECC31BACDD8009@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210630173042.186394-1-aford173@gmail.com>
 <20210630173042.186394-2-aford173@gmail.com>
 <CAMuHMdXoWZMj8+LhUPSpqa4t-G1WrW-wfOy3XzEDe0ihSKQkCw@mail.gmail.com>
In-Reply-To: <CAMuHMdXoWZMj8+LhUPSpqa4t-G1WrW-wfOy3XzEDe0ihSKQkCw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6456bfe1-79dc-4554-9e57-08d93c842da2
x-ms-traffictypediagnostic: TYCPR01MB6350:
x-microsoft-antispam-prvs: <TYCPR01MB63506C675DC853380DBC7BFBD8009@TYCPR01MB6350.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7L5QdD5k/MNu4kmm/UEMNC79Xdj/adT0TkRipbYMROiDHuvSdnOJQ7tgHTBpC+OKfJyEWTA1FgxC3/KorUY0nhe7WAUakjMtlfwLmTggWbtq6C+cwLyC8jeOG3Vi10x+y80i5UKE5TMt9Zb22loQxdPxYBLAkxKbULJl0YCdsXkdrvXUbwC1G0eD6yw6pWvQBS+YTf2meP+/5/Ovqeik2ylY9cGJP2JMaYTuDVldimXR5BuukzkEBJcAgT2DMUu6Pwj+Rl2p6Ec1rA5TsvJbSmqOj+cl7dh77tHRynRfve7yCrW0yZa/yRjj3snlH8IxiFGzk/hqzQjmJtnJwNjrDWa+5vnGeP96yBw3utmJ9+Ub3z4iER8SpjtTeuHreihcefsUHNgJpGi9TBagwJfKO4lVb2mHxUV7Y8dv9lXI/Dx5DI+IIVme0/Ux/ivVVTIgzZaR76VAxs2gybxViJGbU1f6I1W/ZRdhDPI0NfC3UEGpiMxUoA0RZ415xCcUaG/jnrzrPP77hDixFzqPvkaFvz9mMvz2UG7BiG9JgA/udwaMlRv/rAHWYIH9CLHe23tz1zHN15qjWkoLGpjBazdnOfpC/qrmxJJiiND/UzeDD9jGR0St1Dk4gTbZeRkDq6nafhn0hnbXPO2//9QxbZeY0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(186003)(66946007)(76116006)(55236004)(478600001)(52536014)(7696005)(26005)(2906002)(86362001)(4326008)(66556008)(5660300002)(66446008)(6506007)(53546011)(66476007)(64756008)(110136005)(33656002)(7416002)(54906003)(71200400001)(83380400001)(8936002)(316002)(55016002)(8676002)(38100700002)(9686003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW9BNWlHaDdacktZZWt6WkRNTDUrdkxEK2ZKS08rVVVLOWxSSWNJUFVzemhX?=
 =?utf-8?B?Nzd5QUlhQzhReEdBV1Y3SytWdG9tRjNXRytyWW5XN3pMd0RYYW12aXNUL3Fa?=
 =?utf-8?B?OWZzdE1UbGcrVVY0OXd0ZW9reVJITHdLY1lLZmJGOVJVdjhUWW1UbHdMUnNK?=
 =?utf-8?B?TzI2ZTFnOG1NN1pHV1A3SG5tSmpQNkltVUd1MzVVVThPVE1mT29aZ3dsR1FN?=
 =?utf-8?B?TU13RmhUR1RvQ2s0TzRlV2tPa0Q2RjFlbDZqWUJLWTBYUERLTHo0d3BqUXJp?=
 =?utf-8?B?QnRlV1FpOHhBaTU3dkVHTmQxd1ZkTnJDYURrNWhWT2xCeUhoRStpZHhBTWoy?=
 =?utf-8?B?ejF6c1Fvc3E2cHZWeEwwSXlsanRpVXpRT0Y2a3FWOTJ6MjV0RVFIUXFwTkdK?=
 =?utf-8?B?a25Ja1QrbDBFWHlTdGxNT1lkUTJUcjJJaFJITTBUWHJ3YW9HTWhmcXlXdjZV?=
 =?utf-8?B?dEt0dHNLRFlDb0F3N010Yyt4TnFSWDNzY1R2ckc3L1hHYVVkL2dFK1N4WmZ1?=
 =?utf-8?B?bm9LbmEwY3pWeVdBeWd3aHc1WnN6SmRaTTNBTk9EdzM2TEJlZFZNL1RydGJ6?=
 =?utf-8?B?TGVFMWMvcjZZdlJNcVdSZSt0QVV3SDFjUisxVm1XTG8rS2JSUHRDRk5OVmlN?=
 =?utf-8?B?MTVtM1pDaVR5dWFjaTNJNW91VXA5OWlZVnlUVFEvaEFMemU0UkZMSGp2RGYv?=
 =?utf-8?B?NUJFNjF0NUxTaEhKT08rOXR2VDZaK3ZSYmVoalJhS1pZOEQ0dCtMdVptTXBv?=
 =?utf-8?B?a1RadEFvVkN3aXpudWx0OFBoUjlXV3F4Z05kWldVWTZQd0RLdFJiNTFVcFlm?=
 =?utf-8?B?MFJJTk50WGcxbWdOc3JJdHpvL1lRd3ZSaDUzWWJOYk9RcmlrbTNqV0QzQ0dQ?=
 =?utf-8?B?R01XZ1ZLUSs4cU5rSXRwc2w5LzNHYzNXZ0ZRMnFBTUUrVEV5alM3bzNodmkv?=
 =?utf-8?B?ZTdaQWlKYnpsZ0crRHZuVzY3VTNqY0lhMVRBME43cmZvc21UQnFPVTlteFMr?=
 =?utf-8?B?bVhFZ1dtYUR2bytWK0doWmFlZWZ5NitpK1RwNTY5Y2FQVkRYZVRwK21NN0px?=
 =?utf-8?B?WFIrREZBRzZ2WDZlYkprM0xwandXSkdpK2haMUxDc0NUZTFZTjJ3ayt6MUlt?=
 =?utf-8?B?RkdUS215T0lpOFU1dStsMXpxQ3RXQkNsWkdrWjBGeGxNczFnaUlHOGhhQk1m?=
 =?utf-8?B?L0EwZWIzczdVYVdvMTcra0pVZ1RFSHQzYzE0eGpTUlF6ZGh4bTBNNGpaMkND?=
 =?utf-8?B?YmZROVFHQlZCUEJYOUh3cGdMNkE4aDMrTVE1RXd5bHFwSGd5VS9mKzBzVlhB?=
 =?utf-8?B?cklXdTNFd3luVHZyUXU3cjY1eE9ndWxGWUhwY3JMd2VhN000Vmt2V0NKL3hK?=
 =?utf-8?B?WjlLYnlTNVdoa1RjSEY0SllTZW8vd1NUWE9TQ2hwdGpQUlR4YzZma0RQZjdO?=
 =?utf-8?B?MkxmYXFPTGo3MWJ5Tlh3S0pTQkZQZkdzVCtzWEsyekZDRzQ2YzN0eFBUSy8r?=
 =?utf-8?B?SnQ3RS8vY0dzV1daNjUvMzlnYkl5SGowVGlieU5yS1djQlFTaHNnSFgxckpz?=
 =?utf-8?B?ajhid2ppaWdlOEhaODQrQlZyUXlWaU5xa0tZRUhETEF5YzloVDQzT2FrUHFM?=
 =?utf-8?B?RzZpNWc1YXJqQ2hvUE1zZlJoRHJwaWlnbmdPbytSY1hON0hzdC90MkRCSTBL?=
 =?utf-8?B?aWk1SkRVWnlnZG9Ecm91NDhCSHowSlJaSFFPelFGYStDcDd6VUJMeEdhSTNN?=
 =?utf-8?Q?b+koEa+imgc7FgY+Q7ni+WSN/b/DEMUyX9dVyMw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6456bfe1-79dc-4554-9e57-08d93c842da2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 11:34:24.7418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bbn6hVqRkdFH+Y7WVJrFfhnTPTqwcNnie46M5J7KKIJn/4cB32BUNAwXwHoamIgfvMKt6ToXFf2anRL498+D884TdgbSjIanVZNEnMjyornapkhcOtYQehyTPF8Yw1zp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6350
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQWRhbSwgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDog
VGh1cnNkYXksIEp1bHkgMSwgMjAyMSA2OjA3IFBNDQo8c25pcD4NCj4gVG86IEFkYW0gRm9yZCA8
YWZvcmQxNzNAZ21haWwuY29tPg0KPiBDYzogVVNCIGxpc3QgPGxpbnV4LXVzYkB2Z2VyLmtlcm5l
bC5vcmc+OyBBZGFtIEZvcmQtQkUgPGFmb3JkQGJlYWNvbmVtYmVkZGVkLmNvbT47IEdyZWcgS3Jv
YWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBSb2IgSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPjsgTWFnbnVzIERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47
IFlvc2hpaGlybyBTaGltb2RhDQo+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT47
IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVORUQgREVWSUNFIFRSRUUgQklORElO
R1MNCj4gPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgTGludXggS2VybmVsIE1haWxpbmcg
TGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IExpbnV4LVJlbmVzYXMNCj4gPGxp
bnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAy
LzNdIHVzYjogcmVuZXNhc191c2JoczogRW5hYmxlIHN1cHBvcnQgZm9yIG1vcmUgdGhhbiB0d28g
Y2xrcw0KPiANCj4gSGkgQWRhbSwNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+
IE9uIFdlZCwgSnVuIDMwLCAyMDIxIGF0IDc6MzAgUE0gQWRhbSBGb3JkIHdyb3RlOg0KPHNuaXA+
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMgYi9k
cml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL2NvbW1vbi5jDQo+ID4gaW5kZXggM2FmOTFiMmI4Zjc2
Li4yNTVlNGJkNjhlZDMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvcmVuZXNhc191c2Jo
cy9jb21tb24uYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMN
CjxzbmlwPg0KPiA+IEBAIC0zMDksMTEgKzMxMSwxMyBAQCBzdGF0aWMgaW50IHVzYmhzY19jbGtf
Z2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHVzYmhzX3ByaXYgKnByaXYpDQo+ID4gICAg
ICAgICAgKiBUbyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdpdGggb2xkIERULCB0aGlzIGRyaXZl
ciBjaGVja3MgdGhlIHJldHVybg0KPiA+ICAgICAgICAgICogdmFsdWUgaWYgaXQncyAtRU5PRU5U
IG9yIG5vdC4NCj4gPiAgICAgICAgICAqLw0KPiA+IC0gICAgICAgcHJpdi0+Y2xrc1sxXSA9IG9m
X2Nsa19nZXQoZGV2X29mX25vZGUoZGV2KSwgMSk7DQo+ID4gLSAgICAgICBpZiAoUFRSX0VSUihw
cml2LT5jbGtzWzFdKSA9PSAtRU5PRU5UKQ0KPiA+IC0gICAgICAgICAgICAgICBwcml2LT5jbGtz
WzFdID0gTlVMTDsNCj4gPiAtICAgICAgIGVsc2UgaWYgKElTX0VSUihwcml2LT5jbGtzWzFdKSkN
Cj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocHJpdi0+Y2xrc1sxXSk7DQo+ID4g
KyAgICAgICBmb3IgKGkgPSAxOyBpIDwgQVJSQVlfU0laRShwcml2LT5jbGtzKTsgaSsrKSB7DQo+
ID4gKyAgICAgICAgICAgICAgIHByaXYtPmNsa3NbMV0gPSBvZl9jbGtfZ2V0KGRldi0+b2Zfbm9k
ZSwgaSk7DQoNCnMvY2xrc1sxXS9baV0vDQoNCj4gPiArICAgICAgICAgICAgICAgaWYgKFBUUl9F
UlIocHJpdi0+Y2xrc1tpXSkgPT0gLUVOT0VOVCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBwcml2LT5jbGtzW2ldID0gTlVMTDsNCj4gPiArICAgICAgICAgICAgICAgZWxzZSBpZiAoSVNf
RVJSKHByaXYtPmNsa3NbaV0pKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQ
VFJfRVJSKHByaXYtPmNsa3NbaV0pOw0KPiA+ICsgICAgICAgfQ0KPiANCj4gVGhpcyBpcyBpZGVu
dGljYWwgdG8gdGhlIGN1cnJlbnQgY29kZSwgYXMgQVJSQVlfU0laRShwcml2LT5jbGtzKSA9PSAy
Lg0KPiBQcm9iYWJseSB5b3Ugd2FudGVkIHRvIGluY3JlYXNlIHVzYmhzX3ByaXYuY2xrc1tdLCB0
b28/DQoNCkkgdGhpbmsgc28uDQojIEkgcmVhbGl6ZWQgdGhlIGNsa3MgYXJyYXkgaXMgb25seSAy
LCBzbyB0aGF0IHRoaXMgZHJpdmVyIGNhbm5vdA0KIyBlbmFibGUgdXNiMl9jbGtzZWwuLi4NCg0K
PiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gc3RhcnQgdXNpbmcgdGhlIGNsa19idWxrKigpIEFQST8N
Cg0KY2xrX2J1bGsqKCkgQVBJIHNlZW1zIHRvIG5lZWQgY2xvY2stbmFtZXMgcHJvcGVydHkuDQpJ
cyBteSB1bmRlcnN0YW5kaW5nIGNvcnJlY3Q/IEhvd2V2ZXIsIHRoZSBoc3VzYiBub2RlcyBkb2Vz
bid0DQpoYXZlIHRoZSBwcm9wZXJ0eSBmb3Igbm93Li4uDQoNCkJlc3QgcmVnYXJkcywNCllvc2hp
aGlybyBTaGltb2RhDQoNCg==
