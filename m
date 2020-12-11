Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449172D6CC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 01:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394678AbgLKAuc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 19:50:32 -0500
Received: from mail-eopbgr1400104.outbound.protection.outlook.com ([40.107.140.104]:38784
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394673AbgLKAt7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 19:49:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJWHBkR2i3TvmuNHVpeDMbZ33fEbnDio0mSHQOg2XASS88ZVhh3C/GsIxp62kY8RyGDmgtpdDS2gh6vfim/phPTDnH4h89dmQMkmzfs9mF2A3Z/QPGjmGDZgODG2PDBXKGG6l2tfaya+wCOIjjJYXtcqAXeATeS2a+imKBuR5djOOg4CqaeEE1Kl8eLyh5R0QyrGgw7sLJ5YZKkWlFdrFo0WLt7Fr6OAjWRAQ3D+bQYHKgEVwjfNDAu+6MvYb2uG919jph5C7HtwmbrASuIP1lXbPa7SSJ+TLXYsBt788yVFgw3FffaeoHKweUz8+DD+Ao2VTivrx08+p6DQS2yCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OefZmUCFEV50uXacRJ5gF+tWdG4skGPnrQbBPrPBcc4=;
 b=XPV8zPV2zNnb6yGP+xvNaEidfSTgUP37lx+wGNA9gvE4cvbDt2U7SWZnqFqotfrwIXMrcyWr2vToBV1UBQ+ejcAkdbIvsGfAKkaEANOI6isDA0JkxiD1n25ebkbeF/VR5Yug+ErIMp7gIDI67UNU/bdZa8KrP09+HqdjLbjirYZFgV8C816gryJuDf51ExGdE499y6wYrhdkMcDpIagA+XwNmBCeC6RMcreKNRd8WwcZRT+w/Kiv6wJAvE5W59FTuKurKD9hyAAe8eOcrRno7OyJTzuBqCtAG+5glzQHW3gQoICHe7o54ppMFhGn0xZrgIba7HVIBTtBofUDLHZ/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OefZmUCFEV50uXacRJ5gF+tWdG4skGPnrQbBPrPBcc4=;
 b=P6Hbs2Mtex1A2kiLiAsBJD8SMkTXzKwXyFimJUadIde5+6N7vqR9yDZB72jam5OF6A9EhuUwifzmmceLvFhFHUDHIhgry451ip3Qr3ycSDm9E28edsyJHFiWS59AJ7y+SRzBo/lS0onWG14eysp3912NGXf29jCfDTSxpThBdAw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2958.jpnprd01.prod.outlook.com (2603:1096:404:85::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Fri, 11 Dec
 2020 00:49:11 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.015; Fri, 11 Dec 2020
 00:49:10 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHWzTi2AvmFiRi710Seq6CPF4SJ96nwAm0AgAAjrsCAABZigIAA1GvA
Date:   Fri, 11 Dec 2020 00:49:10 +0000
Message-ID: <TY2PR01MB3692AE9149111BDD1A36F712D8CA0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <2916e43d33fd13c88d983d7e8451a41ec3bf9e31.camel@fi.rohmeurope.com>
         <TY2PR01MB369226B2FCFB1E6C91E2EFD5D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <f7ba498de609623bf2df9e43cfddb7b92d699238.camel@fi.rohmeurope.com>
In-Reply-To: <f7ba498de609623bf2df9e43cfddb7b92d699238.camel@fi.rohmeurope.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:3194:a3e8:9b43:51cc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1d1cebcd-a431-4059-51ea-08d89d6e92e7
x-ms-traffictypediagnostic: TYAPR01MB2958:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB2958B3B7EC4074E2A010816DD8CA0@TYAPR01MB2958.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B1zNRVH/P1V9uv3X/2fBx8CALGmmaKFh2pR8AIimQVz6xWg1Uvk3TJS9izV1UptetNDc7IRajeabuMjOobbT5NuHqSgNalcdCbtBdkX4Ud8qWUd7MaofW7jB8TwCZaMWonCjxkfDor3EO8j2a+8e+/srJttPbNlLXI/U/I0MIQ0/HX7uMXZNgpXOhYE0DTxC05QaZGKIdFObhS+eFZf+ruWBX+T7/DIrEm43PqUDVt11qJ//H/Ju7ml/N9xI6Pib3w1hdFw6aY/GcK+WFWdh/I2Zt6ksTkzMlz6xMgCw87Q6jNrGsKvKvoEwLP9BF0Zczz16jDVcd0xrz4AK6P4CgQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(5660300002)(186003)(9686003)(55016002)(2906002)(8936002)(8676002)(83380400001)(71200400001)(33656002)(66476007)(6506007)(76116006)(66946007)(66446008)(6916009)(316002)(478600001)(4326008)(7696005)(54906003)(52536014)(64756008)(66556008)(86362001)(4001150100001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q0s4cUV1Ymd3a2d5azFoS3dMdEloYzBqNmRwYWVJMXR0TWVUQXFqYlQrNDZR?=
 =?utf-8?B?bEp3bW1IVEp5SlhDR0pxcmNBTHR6blVXd3BONlpyc3NhSzFNejNKaURoMFJR?=
 =?utf-8?B?S3oxUDlKVmxYV0NQZ1E0dUkzWHN1UCszYzVET1I1YllYVktmc1FBOUhLb3I1?=
 =?utf-8?B?RjZwelZHTzBTNEZtZjNacEdINWpqUmhCUmF6L0NkRDNvQUV0L0FiREdnaEdl?=
 =?utf-8?B?RkZhb3B4d2FhVFByR0pBYURCckJ2ZmlrNFdtdlY3RlRkVTFzendKa0R5L095?=
 =?utf-8?B?aW5MQUUrRzU4UVlGK1psaHNxV3NsMnRkTzJtcEhxVlVMYTBwTzJZNGExQVIx?=
 =?utf-8?B?a2VLa2JnUy9ONGpoNFA1NzcwcjBrQzZlaHNHUk9pNGJ1UHhDWTg1RE5WVmcx?=
 =?utf-8?B?R3pKV09taldPUGs5Zk0xNU1OSDdxOGdNQ0VYRkxxTnFZOStKQ2ZBUlZnWllG?=
 =?utf-8?B?TnhzQWVROFJRN2NoUVJhOFVsVDcrMFA3Nk9wOVdvMGt1cnFjcEllYkRRc0R3?=
 =?utf-8?B?eGZKaVZIOTd6Q3QwU1JMMGJrdisxOFhNZzZ4WTdYY1NXa3RPOFRIcVcrbUpF?=
 =?utf-8?B?bVZPQ3N0NHptclQwU1VTcmR6emJtVlFLQnJaZk8zS2hReUJiUnpuLzBjZEZZ?=
 =?utf-8?B?OXpSQkQvOVozMjN3WkY5NFZRQmFLMkxzbHIyYkVmY1hTK2FlQXhLRU1aMmZP?=
 =?utf-8?B?RTUrVFdYakpTaVZobk9NcjhNam9qTHVnT3E0dWNidWg0djJCeHBRQ0FRbkI3?=
 =?utf-8?B?OXd4d3VCMGJiQ3pzQ29kTHZINGJNU3NLTms4Mm5QbjdnaUFoOHg5M0o1ckxT?=
 =?utf-8?B?aTlWTnNjeU1WS0dkMG9heEhzZ2UyQ3QvVStrVHhIcytaejlpVkdFNG9PMndi?=
 =?utf-8?B?YlRXTDRkSVphR2UyZE01dW05K2ttc0JrODBRYWQyaS9OdE9LRE5SVkdyUVR6?=
 =?utf-8?B?SExPVUYydDEvelJTdy9CMUYxM3cvV3dCcnFXS3ZNV01qQmFlenBOeGJycFpv?=
 =?utf-8?B?amJkMDlkV2NRM2RXNjE5eXRHdnJ3T1FyYTMzaHRodTdvYWk4NFM5SlZyZkhj?=
 =?utf-8?B?N1Q3WXR3Q0lXMzJjZmtWRXp3Sy85dk9ibzdQQlZkQzRNQitZUWJzNGtOZ1dF?=
 =?utf-8?B?T2VobXQ2ZGx5VzYralY5YVhwbVphY1Zpc0lyYTdQNE1TR2RXdndjQlRhaUxs?=
 =?utf-8?B?aUs2cWVxekl0WXQ5VjlESEJuUjJuOENSVzhLM2R6SjdBN1VTR1lya3lDVVlF?=
 =?utf-8?B?NHZXQnlOeExCVXIvRjg4VjZvTU5zZ09zMHFrY2NBaVNFMFM5VDVuVGdiL0lH?=
 =?utf-8?B?L0FLN0lvRk1GVUVvTzdoakdYbmRQOXBGYkZBd2MzYnAyZ1VCeVhFMzB6S0tX?=
 =?utf-8?Q?KMwMEP0tZrnun06LboTV9VL7AT1F2RMo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1cebcd-a431-4059-51ea-08d89d6e92e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 00:49:10.8042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtlL0yB0+Z7nQFIUkDvUPUe/jSx+QmKcG3t+FTTk9k4dWRUoFF0Sa6Shegu7p/Pqy0HjU8nG312Tx3f2Vxcg3fsFG7ndUrsa/vyrvpIrn4m5Cij64iV2X0UCq1cDOdzV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2958
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTWF0dGktc2FuLA0KDQo+IEZyb206IFZhaXR0aW5lbiwgTWF0dGksIFNlbnQ6IFRodXJzZGF5
LCBEZWNlbWJlciAxMCwgMjAyMCA4OjU2IFBNDQo+IA0KPiBIaSBZb3NoaWhpcm8gc2FuLA0KPiAN
Cj4gT24gVGh1LCAyMDIwLTEyLTEwIGF0IDEwOjU4ICswMDAwLCBZb3NoaWhpcm8gU2hpbW9kYSB3
cm90ZToNCj4gPiBIaSBNYXR0aSwNCj4gPg0KPiA+ID4gRnJvbTogVmFpdHRpbmVuLCBNYXR0aSwg
U2VudDogVGh1cnNkYXksIERlY2VtYmVyIDEwLCAyMDIwIDU6MjggUE0NCj4gPiA+DQo+ID4gPiBP
biBUdWUsIDIwMjAtMTItMDggYXQgMTc6MDQgKzA5MDAsIFlvc2hpaGlybyBTaGltb2RhIHdyb3Rl
Og0KPHNuaXA+DQo+ID4gPiBhbmQgcG9wdWxhdGluZyB0aGUgcGxhdGZvcm1fZHJpdmVyIGlkX3Rh
YmxlIGZvciBzdWIgZHJpdmVyKHMpIHVzaW5nDQo+ID4gPiBzb21ldGhpbmcgbGlrZToNCj4gPiA+
DQo+ID4gPiBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2RldmljZV9pZCBiZDk1N3hfZ3Bp
b19pZFtdID0gew0KPiA+ID4gICAgICAgICB7ICJiZDk1NzFtd3YtZ3BpbyIsIFJPSE1fQ0hJUF9U
WVBFX0JEOTU3MSB9LA0KPiA+ID4gICAgICAgICB7ICJiZDk1NzRtd2YtZ3BpbyIsIFJPSE1fQ0hJ
UF9UWVBFX0JEOTU3NCB9LA0KPiA+ID4gICAgICAgICB7IH0sDQo+ID4gPiB9Ow0KPiA+ID4NCj4g
PiA+IFRoZW4geW91IGNhbiBnZXQgdGhlIElDIHR5cGUgdXNpbmcNCj4gPiA+IHBsYXRmb3JtX2dl
dF9kZXZpY2VfaWQocGRldiktPmRyaXZlcl9kYXRhLg0KPiA+DQo+ID4gSSBnb3QgaXQuIFNvLCBw
ZXJoYXBzLCBJIHNob3VsZCBhZGQgdGhlc2UgdHlwZXMgaW50bw0KPiA+IGluY2x1ZGUvbGludXgv
bWZkL3JvaG0tZ2VuZXJpYy5oLg0KPiANCj4gVGhhdCB3b3VsZCBtYWtlIHNlbnNlIHRvIG1lLiBJ
IGxpa2UgdGhlIGlkZWEgb2YgY29sbGVjdGluZyB0aGUgSURzIGluDQo+IHNhbWUgcGxhY2UgLSBi
dXQgb24gdGhlIG90aGVyIGhhbmQsIHRoZSBkZWZpbmUgaW4gaWQtdGFibGUgaXMgbm90DQo+IHJl
YWxseSB2aXNpYmxlIG91dHNpZGUgdGhlIHN1Yi1kcml2ZXIgLSBzbyB5b3UgY2FuIHByb2JhYmx5
IGFsc28gZGVmaW5lDQo+IHRoZSB0eXBlIGluIHN1Yi1kZXZpY2UgZHJpdmVyIGlmIHlvdSB3aXNo
LiBJIGRvbid0IGhhdmUgc3Ryb25nIG9waW5pb24NCj4gb24gdGhhdC4NCg0KSSBnb3QgaXQuIFJP
SE1fQ0hJUF9UWVBFX0JEOTU3WzE0XSBhcmUgdXNlZCBmcm9tIGJvdGggZ3BpbyBhbmQgcmVndWxh
dG9yDQpkcml2ZXJzIHNvIHRoYXQgYWRkaW5nIElEcyBpbnRvIHJvaG0tZ2VuZXJpYy5oIGlzIHJl
YXNvbmFibGUuDQoNCj4gPiA+IE5leHQsIEkgdGhpbmsgdGhlIHBhcmVudCBkYXRhIGZyb20gTUZE
IGlzIG9ubHkgdXNlZCB0byBnZXQgdGhlDQo+ID4gPiByZWdtYXANCj4gPiA+IGFuZCBkZXYgaW4g
c3ViLWRldmljZXMsIHJpZ2h0PyBNYXliZSB5b3UgY291bGQgc2ltcGxpZnkgdGhpcyBhbmQNCj4g
PiA+IGdldA0KPiA+ID4gcmlkIG9mIHRoZSB3aG9sZSBNRkQgcGFyZW50IGRhdGEgc3RydWN0dXJl
PyBJIHRoaW5rIHlvdSBjYW4gdXNlDQo+ID4gPg0KPiA+ID4gcGRldi0+ZGV2LnBhcmVudCB0byBn
ZXQgdGhlIHBhcmVudCBkZXZpY2UgYW5kDQo+ID4gPiBkZXZfZ2V0X3JlZ21hcChwZGV2LT5kZXYu
cGFyZW50LCBOVUxMKTsNCj4gPiA+DQo+ID4gPiB0byBnZXQgdGhlIHJlZ21hcD8NCj4gPg0KPiA+
IElJVUMsIHRoZXNlIGNvbW1lbnRzIGFyZSByZWxhdGVkIHRvIGdwaW8tYmQ5NTcxbXd2LmMuDQo+
ID4gIyBBbHNvLCBiZDk1NzFtd3YtcmVndWxhdG9yLmM/DQo+ID4gSWYgc28sIEkgZGlkbid0IHRy
eSB0aGlzIHlldCwgYnV0IHBlcmhhcHMsIHdlIGNhbiBtb2RpZnkgc3VjaCB0aGluZ3MuDQo+IA0K
PiBDb3JyZWN0LiBNeSBzdWdnZXN0aW9uIHdhcyByZWxhdGVkIHRvIGhvdyByZWdtYXAgYW5kIGRl
diBwb2ludGVycyBhcmUNCj4gb2J0YWluZWQgaW4gc3ViLWRldmljZXMuIEl0IGlzIHJlbGF0ZWQg
dG8gTUZEIGJlY2F1c2UgSSB0aGluayB5b3UgY291bGQNCj4gcmVtb3ZlIHRoZSBNRkQgZHJpdmVy
IGRhdGEgdXNhZ2UuDQoNCkkgdW5kZXJzdG9vZCBpdC4NCg0KPiA+ID4gKEFmdGVyIHRoaXMgSSB3
b25kZXIgaWYgeW91IG5lZWQgdGhlDQo+ID4gPiBzdHJ1Y3QgYmQ5NTcxbXd2IGF0IGFsbD8pDQo+
ID4NCj4gPiBJJ20gc29ycnksIGJ1dCBJIGNvdWxkIG5vdCB1bmRlcnN0YW5kIHRoaXMuDQo+IA0K
PiBJIGJlbGlldmUgdGhlIHN0cnVjdCBiZDk1NzFtd3YgaXMgZGVmaW5lZCBvbmx5IHRvIGNvbGxl
Y3QgYWxsIHRoZSBNRkQNCj4gZHJpdmVyIGRhdGEgaW4gb25lIHN0cnVjdCBzbyB0aGF0IGl0IGNh
biBiZSBwYXNzZWQgdG8gc3ViLWRyaXZlcnMgdXNpbmcNCj4gdGhlIE1GRCBkZXZpY2UgcHJpdmF0
ZSBkYXRhLiBCdXQgYXMgZmFyIGFzIEkgY2FuIHRlbGwsIHRoZSBzdWItZGV2aWNlcw0KPiBvbmx5
IHVzZSByZWdtYXAgYW5kIGRldiBwb2ludGVycyBmcm9tIHRoaXMgZGF0YS4gSWYgdGhpcyBpcyB0
aGUgY2FzZSwNCj4gdGhlbiBJIHRoaW5rIHRoZXJlIGlzIG5vIG5lZWQgdG8gZGVmaW5lIHRoaXMg
c3RydWN0IG9yIHBvcHVsYXRlIHRoZSBNRkQNCj4gZHJpdmVyIGRhdGEgKHVubGVzcyBJIGFtIG1p
c3Npbmcgc29tZXRoaW5nKS4NCj4gDQo+IChBbmQgYXMgYSBmdXJ0aGVyIGNsZW4tdXAsIG9uZSBj
b3VsZCBwcm9iYWJseSBzd2l0Y2ggZnJvbToNCj4gcmVnbWFwX2FkZF9pcnFfY2hpcA0KPiB0bw0K
PiBkZXZtX3JlZ21hcF9hZGRfaXJxX2NoaXANCj4gYW5kIGdldCByaWQgb2YgdGhlIHJlbW92ZSBm
dW5jdGlvbikNCg0KVGhhbmsgeW91IGZvciB0aGUgZGV0YWlsLiBJIHVuZGVyc3Rvb2QgaXQuDQoN
Cj4gYnV0IGFzIEkgc2FpZCAtIHRoZXNlIGFyZSBvbmx5ICduaXQnIGNvbW1lbnRzIGFuZCBJIGFt
IG5vdCBpbnNpc3Rpbmcgb24NCj4gY2hhbmdpbmcgdGhlc2UuIEVzcGVjaWFsbHkgc2luY2Ugc29t
ZSBvZiB0aGUgY29tbWVudHMgYXJlIG1vcmUgcmVsYXRlZA0KPiB0byBjaGFuZ2luZyB0aGUgb3Jp
Z2luYWwgYmQ5NTcxbXd2IHRoYW4gYWRkaW5nIHN1cHBvcnQgZm9yIHRoaXMgbmV3IElDLg0KPiBJ
IGp1c3QgdGhpbmsgb25lIG1pZ2h0IGJlIGFibGUgdG8gbWFrZSB0aGlzIGEgbGl0dGxlIGJpdCBz
aW1wbGVyIDopDQoNCkkgZ290IGl0IDopIEZvciBub3csIEkgd291bGQgbGlrZSB0byBmb2N1cyBh
ZGRpbmcgQkQ5NTc0TVdGIHN1cHBvcnQgYXQgZmlyc3QuDQpBZnRlciB0aGF0LCBJJ2xsIHRyeSB0
byBjbGVhbi11cCB0aGVzZSBkcml2ZXJzIGxhdGVyLg0KDQo+ID4gPHNuaXA+DQo+ID4gPiA+ICAv
KioNCj4gPiA+ID4gICAqIHN0cnVjdCBiZDk1N3hfZGF0YSAtIGludGVybmFsIGRhdGEgZm9yIHRo
ZSBiZDk1N3ggZHJpdmVyDQo+ID4gPiA+ICAgKg0KPiA+ID4NCj4gPiA+IE92ZXJhbGwgYSBnb29k
IGxvb2tpbmcgZHJpdmVyISBUaGFua3MgYSBsb3QhDQo+ID4NCj4gPiBUaGFuayB5b3UgdmVyeSBt
dWNoIGZvciB5b3VyIHJldmlldyENCj4gPg0KPiA+IEJ5IHRoZSB3YXksIEkgcmVhbGl6ZWQgTGlu
dXgga2VybmVsIHN1cHBvcnRzIGJkOTU3Ni1yZWd1bGF0b3IuYw0KPiA+IGFuZCBpdCBoYXMgImJk
OTU3eCIsIGJ1dCBpdCBkb2Vzbid0IHNlZW0gdG8gYmUgY29tcGF0aWJsZSB3aXRoDQo+ID4gQkQ5
NTcxLg0KPiA+IFNvLCBJIHdvbmRlciBpZiBJIHNob3VsZCBub3QgdXNlICJiZDk1N3giIGluIHRo
ZSBiZDk1NzFtd3YgZHJpdmVyIHRvDQo+ID4gYXZvaWQNCj4gPiBjb25mdXNpb24uIEJ1dCwgd2hh
dCBkbyB5b3UgdGhpbms/DQo+IA0KPiBWYWxpZCBwb2ludC4gSSB0aGluayBCRDk1NzMgYW5kIEJE
OTU3MyBhcmUgY2xvc2UgdG8gZWFjaC1vdGhlcnMgYnV0DQo+IGxhcmdlbHkgZGlmZmVyZW50IGZy
b20gQkQ5NTcxIGFuZCBCRDk1NzQuLi4gR29vZCBleGFtcGxlIHdoeSB3aWxkY2FyZHMNCj4gYXJl
IHNvIGhhcmQuIEkgaGF2ZSBwcmV2aW91c2x5IGF0dGVtcHRlZCB0byB1c2UgdGhlIHdpbGRjYXJk
cyBpbiBST0hNDQo+IFBNSUMgc29mdHdhcmUgbmFtaW5nIC0gYW5kIHVzdWFsbHkgZmFpbGVkLiBU
aGUgbnVtYmVyaW5nIGRvZXMgbm90DQo+IHJlYWxseSBzZWVtIHRvIHJlZmxlY3QgdGhlIGZ1bmN0
aW9uYWxpdHkuLi4gU28gbWF5YmUgaSBhbSBub3QgdGhlIGJlc3QNCj4gcGVyc29uIHRvIGNvbW1l
bnQgb24gdGhpcyBYRA0KPiANCj4gT24gdGhlIG90aGVyIGhhbmQsIHNvbWV0aW1lcyB3ZSB3YW50
IHRvIGhpZ2hsaWdodCB0aGF0IHNvbWUgb2YgdGhlDQo+IGZ1bmN0aW9ucy9kZWZpbmVzIGFyZSB1
c2VkIGJ5IGFsbCBJQyB2ZXJzaW9ucyBhIGRyaXZlciBzdXBwb3J0cyAtIHdoaWxlDQo+IG90aGVy
cyBhcmUgSUMgc3BlY2lmaWMuIEZvciBleGFtcGxlLCBpbnNpZGUgdGhlIGRyaXZlciB3aGljaCBz
dXBwb3J0cw0KPiBCRDcxODM3IGFuZCBCRDcxODQ3IEkgdXNlZCBCRDcxOFhYIGFzIGEgcHJlZml4
IGZvciBkZWZpbmVzIHRoYXQgd2VyZQ0KPiBjb21tb24gZm9yIGJvdGggSUNzLiBJQyBzcGVjaWZp
YyBkZWZpbmVzIEkgbmFtZWQgd2l0aCBCRDcxODM3IGFuZA0KPiBCRDcxODQ3LiBJIHRoaW5rIHRo
YXQgd2FzIHF1aXRlIGNsZWFyIGluc2lkZSB0aGUgZHJpdmVyICh1bnRpbCBCRDcxODUwDQo+IHdh
cyBtYWRlIC0gd2hpY2ggdXNlcyBzYW1lIGRlZmluZXMgYXMgQkQ3MTg0Ny4uLiA6fCApDQo+IA0K
PiBTby4uLiBNeSBzdWdnZXN0aW9uIC0geW91IGNhbiBwcm9iYWJseSB1c2Ugd2lsZGNhcmRzIGlu
c2lkZSBhIGRyaXZlcg0KPiAoYW5kIGNvbW1lbnQgdGhpbmdzIHdoZW4gd2lsZGNhcmRzIGRvIG5v
dCBtYXRjaCBhbnltb3JlKS4gQnV0IEkgd291bGQNCj4gbm90IGFkZCB3aWxkY2FyZHMgdG8gYW55
IGdsb2JhbGx5IHZpc2libGUgZGVmaW5lcyAoaW4gZGVmaW5pdGlvbnMNCj4gaW5jbHVkZWQgZnJv
bSBoZWFkZXJzLCBmaWxlIG5hbWVzLCAuLi4pDQoNClRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rp
b24hIEkgdGhpbmsgaXQncyBhIGdvb2QgaWRlYS4gU28sIEknbGwgbW92ZQ0Kc3RydWN0IGJkOTU3
eF9kYXRhIGZyb20gdGhlIGhlYWRlciB0byBNRkQgZHJpdmVyLg0KDQo+IEFzIFJvYiBwdXQgaXQg
YSB3aGlsZSBhZ28gLSAiTmFtaW5nIGlzIGhhcmQiLiA6KQ0KDQpJIHRoaW5rIHNvIDopDQoNCkJl
c3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
