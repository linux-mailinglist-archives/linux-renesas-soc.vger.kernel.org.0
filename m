Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872413FB0D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Aug 2021 07:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhH3Fde (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Aug 2021 01:33:34 -0400
Received: from mail-eopbgr1300103.outbound.protection.outlook.com ([40.107.130.103]:52768
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229936AbhH3Fdd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Aug 2021 01:33:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbfN9LyrRMoEbRvKo/foGJ75OkW3wm2de6ANWUbr3dWxZcNIYddom+HbJrMOva0VKjl1BwuiLP3FBVS2uDA9AQz2MKZV//wdvHRKcxdfY11n/0H38IaUbcgxm/JjXkcFXXEPnnOY6xvvqdphs4QapSz376PBUCtvjPqfXlR8EzAdmNHARk94dWtItOOyclFC1+J6egiz0RyrDbtTp4tq3fawt0p9icPiqHw3JilJmeLjR75uh358PiuwJL1M1bmFn9Vz7FFx3VGnbHd2HZWd37yjMiix905fY/H3xy1PNCLpehY7Oh+xhL4y6sGjM5AVo92ZPruA9IAoBd8ggZawEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSWEskTgK6YzhhuPew1+SkYWCMjzL3+mcTrWiwoXTrY=;
 b=f62yc01uNa9prxawgoQZuC9JfU529pWt2lXpoTy2I2kGpyy6HkVgyRWrjUh6TNiHOHSOLb6qQ3ylcIbbiBxrzIH1CjWRTCNtoCWBdMfHHXDKdVMRsu9r7i/MrZuGE/gURyPMiTfIQEGuI5MNaVhMItcCaYHnZhLVRiXVq6yfWXDfN0NIaAU7IdM2xUbALNzn6q7MX6EP7/mbG1yCNlTX3+u3NwSUatjObGkIR9k9U98YX6JyCAhSZf04afzuj4TPi3FIMK5X37/C68qFKgJSmQJsVPaz+2/uv2TJbZwkbc1Wtt4jjgPJ7dUO/I6nbA7+aDLtNOKOlKqXkjLmsOU7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSWEskTgK6YzhhuPew1+SkYWCMjzL3+mcTrWiwoXTrY=;
 b=qDHX588ECjS0QUDjMxDC5xRw/KBfzanTd2Jt+hXiXeG3VxUnoWimIxr7NiD3DD7/Q9f/oMTzjhZWRS9wYu28C25l0+vNo7gLGMN84dqYixo+GFUDmMKHrRS4B/zEKSBJd6K1ICrkom6SsJE3eKg7S4Z+9WaGoDNSdjnhMvoyojc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4220.jpnprd01.prod.outlook.com (2603:1096:404:d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 05:32:30 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b10a:f267:d52c:1e5b]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b10a:f267:d52c:1e5b%3]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 05:32:30 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Adam Ford <aford173@gmail.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        USB list <linux-usb@vger.kernel.org>,
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
Thread-Index: AQHXbdWvj0l2neJgTUiXf2ey8vEEX6st1ViAgAAn1NCAWhIDAIADz/hA
Date:   Mon, 30 Aug 2021 05:32:30 +0000
Message-ID: <TY2PR01MB3692FC49A643DCC91538CB31D8CB9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210630173042.186394-1-aford173@gmail.com>
 <20210630173042.186394-2-aford173@gmail.com>
 <CAMuHMdXoWZMj8+LhUPSpqa4t-G1WrW-wfOy3XzEDe0ihSKQkCw@mail.gmail.com>
 <TY2PR01MB3692DA5F92178F1ECC31BACDD8009@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAHCN7xJrP9Aug6jQzWqdSZ3Tr1_A9qhssc6SYW0rS-VE9Yg9PA@mail.gmail.com>
In-Reply-To: <CAHCN7xJrP9Aug6jQzWqdSZ3Tr1_A9qhssc6SYW0rS-VE9Yg9PA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 247692a4-8f34-4e53-1a44-08d96b778f93
x-ms-traffictypediagnostic: TY2PR01MB4220:
x-microsoft-antispam-prvs: <TY2PR01MB4220CEACCA72F76B3E821E9BD8CB9@TY2PR01MB4220.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cG2qxsGCaZBmUFRRutNOcbiOzY2w8bvQeYRLw2VT0vf96EI59rKW13e81KCnoMXuHdmCKi9HDCZ+20jtQKiQWW1VYLOP3yVsmqbC9k9z6LdKXkr+5HMQ0AlAYnWIKnhCrpJZRltugnz5RMwE7CTfv/5J4EOXvu213tO0jrPItV/T67a+bs1hEKzrTB94L1oVFj7J8EqobmFIEYwtb6qv1UH4Pqz8rj9csDxCP2S967D27DwECpVGpa9MI0YQoaUs2zM3nBh6MLM7j46IsZxaE9nvk+oaurQSHFHYzwlBZPQIB0hNeUV9NOBV2hJe2a4F2uQI+GUncXT1EaqmWKv3gfAqFIDZbI28xRiyb/kDo0q8KUqs7sLlMF4G8F9UFz/gH/UWORASWztsrSj2k02g6NbUT/VrXc3sgH7PTE/EW/ZjzcXtyIpXtBPh57ST/p1X1nEADVHAG/UBr/nlUCmwqxnjQjNkIjzfkrpHESf21HjJ6LnLEKw7nstrrFlrtBTTj6H8D3IU07yNPTJ+uWWZr+JLt5vA2tS8SXjw7AB8cQonOsk/Xr+rNpv3hKXufIFgqOVewCj/ptppTSOZXVsrhLJHHYjd9fdUNe+J4px6aYAu7kqZ76dfFQJfQFudQTBEedCfq72dZQuV12ZZ38An4EzwRSv9oco45oGI6IuHiDCS8DEjfZ3I6DZ7Dt1ZGo15HGZloitogdBrTEOzil/sws0l9lhweT53JE4y/NyBq5qNt3Nq8b9qXnx2sJvqwAAlrlPJt9GE0N/FUscF/wwk1aeFM3MtkzQJoD8Xsynoobs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(122000001)(966005)(8936002)(38100700002)(38070700005)(86362001)(7696005)(53546011)(5660300002)(55236004)(52536014)(26005)(66476007)(6506007)(54906003)(66556008)(64756008)(66446008)(66946007)(76116006)(7416002)(9686003)(2906002)(71200400001)(33656002)(83380400001)(55016002)(316002)(4326008)(6916009)(186003)(8676002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHBKaDN5NitQUFN4Uy82Q2VvVVRLcGo5NjVjWWdGVmwxTkUwQlBxQU1LcEE1?=
 =?utf-8?B?dmltQUM2V2gxbEVpR0Y3bkhmRVp4QUdTaGVkUUxOTWNDaGltcXAzL3Z2Tm45?=
 =?utf-8?B?SkFrQU5IblpFU0pOekorb0VaQ1REdERrWUtwRmFtalpuQmdRbTRnVlRYaHRl?=
 =?utf-8?B?amRoUEFwSXQ4R2syRkNiQ2lUUVJLMFA1TDY2SmRpY2F1WGdwTEhCbXRiczgr?=
 =?utf-8?B?ejEyQ1FEWm5pdzFTRWJqWVEwSW94TUkzaGprTVdlT0c2bWlmVnlPYzVYUDFh?=
 =?utf-8?B?cE84T29DTGhaU3g3WURNdlpvR05JQ1NYMlE5TU5GblJIZ1p2ODJ0VWZNcUd4?=
 =?utf-8?B?RXk2M3UraVlpanZ3N0dVRGh5NG5qRkdQMjV6djEvTjlJQ293R1pTUm44N1N3?=
 =?utf-8?B?UnU1emRpM2RISWY4KzNSK0F0N3VuZEdMTXlsUGZPUDRFeGlHNnk5Qmk0K2Vw?=
 =?utf-8?B?OWhzblRGNTN3S0VMM1hFdjNnRitpVlhReUVYeG9KbC85NWw3K0hQcnVldlB1?=
 =?utf-8?B?a3dORHNrZDZYWnNPOHdOY21YT3E4V3FQQ3VML2NablN5bVBLYVh0TkJmOHpN?=
 =?utf-8?B?U3N3d05YWFNQTm52R003cEJWNjYrbG1LSFlkcnBKREtPSkhEdHgrL0VTOXFB?=
 =?utf-8?B?L2RBYjYvMHNZNy9lQ2pQRFJwV2xMZWhwcFE3ZTVZQWl5cFNHVjF1djg4UFRI?=
 =?utf-8?B?YVBFeEVQUC8xRlBhNElBVGpHQTBramE1MllmNjJIWnVmSWJjQk1EUVdFUURr?=
 =?utf-8?B?bEE5MURMcVJSdXZ3YWp4clovNTNrbjhRb0o4N2pSckZocW0zU2h1a2hOQTF1?=
 =?utf-8?B?ZlE5cnNQUndQY3dsSldKaHZ4N28xTkJnZzZ6a0w0cmp4bHFXZnlSMTh2ajRG?=
 =?utf-8?B?WjVydnoyeVpVbVYwN3UwaTFuOThlOHlGTFhtR3BKNThEeDBIaE92TEVsUlhB?=
 =?utf-8?B?NHl0aktHVTJjOVVJUk0rWTRUMmRlaUpBdXUwSHNkQTlzc3Z3SUM4d1d2YTVC?=
 =?utf-8?B?MXZ6ZHFLT002QzZMWFpGM1AzSCszQWxuS3AvOHphNHdhb1BFalgzMkp3eFRl?=
 =?utf-8?B?dXVZZVpFSVpFTVNUdWRTcURrNk0zbWJqR1Z0TmxmK3ZxcXo2Y2ErZE92bThy?=
 =?utf-8?B?WmRaQVJXN09kLzNESnJMOWRzVGRxbWtaWjRWUmNNV0FaMG9keFF5TWFhc0to?=
 =?utf-8?B?dkovME0vTzdackxoRnRkdkwvMEpYbUlwbjFBOFZYb3AyS0N3djlBK25JY3JH?=
 =?utf-8?B?OVlhU0Z1SHJyNEltVmRObDA0VUlIbCtHc2xEM083RmFzUXNHYlcvd2p1dTkz?=
 =?utf-8?B?UHNuRlVHTmk0SnpOb21WQkFwQ25XaU9xUTB4cUNaUUtxUzNjcXNDaHNiYVVq?=
 =?utf-8?B?bG82NDdKWWc1MmdxQ1NPWkljZUd0UUdabnhodVo2N1JxUElnVFBtb2Frazln?=
 =?utf-8?B?UXpQMTFJN3o1dy8rV1IrZDkvUUJGU0gyaGZITDF6ZTRYSjdudlp0enhFVTh0?=
 =?utf-8?B?NFRzZjNwbUhmdjVVK1NwVi93TkJpMlJWMmtEU0VkUlhpVzdjd1dPZmd0VklK?=
 =?utf-8?B?dlFsRW9iUENPVFJtc2tSSnJNbGJtNFJmejNuSUpPSXY1T0hkbk1reUpyYUFK?=
 =?utf-8?B?bXpESXVJZnJ1Y0lHUzNQbXV5QTVmWnpVSG1ORGJ0U2pqV3JkVWFMeG9tQThE?=
 =?utf-8?B?NStKK04vbStBTkthV0FhY3NjajlJazlrclBNaW1lNFltNktMcy90anFvUk5J?=
 =?utf-8?Q?iwGAR7Rctv5COiKxEvc5jqNvH0qoBgc+Ys9A+KC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247692a4-8f34-4e53-1a44-08d96b778f93
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 05:32:30.2339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xchXMpurzgcO6NmLpAi0BZk6ZL/quauwABNDBI1Tb9YskSKM8KoxC4Aw2TSenT+Fh4bVetH4Bb+9IwAXiCek3obThkN5jo/lp9H/gJoQMvyqXru3QK59XRcN9l15zQZ7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4220
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQWRhbSwNCg0KPiBGcm9tOiBBZGFtIEZvcmQsIFNlbnQ6IFNhdHVyZGF5LCBBdWd1c3QgMjgs
IDIwMjEgMzo1OCBBTQ0KPiANCj4gT24gVGh1LCBKdWwgMSwgMjAyMSBhdCA2OjM0IEFNIFlvc2hp
aGlybyBTaGltb2RhIHdyb3RlOg0KPiA+DQo+ID4gSGkgQWRhbSwgR2VlcnQtc2FuLA0KPiA+DQo+
ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFRodXJzZGF5LCBKdWx5IDEsIDIw
MjEgNjowNyBQTQ0KPiA+ID4NCj4gPiA+IEhpIEFkYW0sDQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQ0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgSnVuIDMwLCAyMDIxIGF0IDc6MzAg
UE0gQWRhbSBGb3JkIHdyb3RlOg0KPiA+IDxzbmlwPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYyBiL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNi
aHMvY29tbW9uLmMNCj4gPiA+ID4gaW5kZXggM2FmOTFiMmI4Zjc2Li4yNTVlNGJkNjhlZDMgMTAw
NjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMNCj4g
PiA+ID4gKysrIGIvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYw0KPiA+IDxzbmlw
Pg0KPiA+ID4gPiBAQCAtMzA5LDExICszMTEsMTMgQEAgc3RhdGljIGludCB1c2Joc2NfY2xrX2dl
dChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCB1c2Joc19wcml2ICpwcml2KQ0KPiA+ID4gPiAg
ICAgICAgICAqIFRvIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgd2l0aCBvbGQgRFQsIHRoaXMgZHJp
dmVyIGNoZWNrcyB0aGUgcmV0dXJuDQo+ID4gPiA+ICAgICAgICAgICogdmFsdWUgaWYgaXQncyAt
RU5PRU5UIG9yIG5vdC4NCj4gPiA+ID4gICAgICAgICAgKi8NCj4gPiA+ID4gLSAgICAgICBwcml2
LT5jbGtzWzFdID0gb2ZfY2xrX2dldChkZXZfb2Zfbm9kZShkZXYpLCAxKTsNCj4gPiA+ID4gLSAg
ICAgICBpZiAoUFRSX0VSUihwcml2LT5jbGtzWzFdKSA9PSAtRU5PRU5UKQ0KPiA+ID4gPiAtICAg
ICAgICAgICAgICAgcHJpdi0+Y2xrc1sxXSA9IE5VTEw7DQo+ID4gPiA+IC0gICAgICAgZWxzZSBp
ZiAoSVNfRVJSKHByaXYtPmNsa3NbMV0pKQ0KPiA+ID4gPiAtICAgICAgICAgICAgICAgcmV0dXJu
IFBUUl9FUlIocHJpdi0+Y2xrc1sxXSk7DQo+ID4gPiA+ICsgICAgICAgZm9yIChpID0gMTsgaSA8
IEFSUkFZX1NJWkUocHJpdi0+Y2xrcyk7IGkrKykgew0KPiA+ID4gPiArICAgICAgICAgICAgICAg
cHJpdi0+Y2xrc1sxXSA9IG9mX2Nsa19nZXQoZGV2LT5vZl9ub2RlLCBpKTsNCj4gPg0KPiA+IHMv
Y2xrc1sxXS9baV0vDQo+ID4NCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChQVFJfRVJSKHBy
aXYtPmNsa3NbaV0pID09IC1FTk9FTlQpDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHByaXYtPmNsa3NbaV0gPSBOVUxMOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgZWxzZSBpZiAo
SVNfRVJSKHByaXYtPmNsa3NbaV0pKQ0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gUFRSX0VSUihwcml2LT5jbGtzW2ldKTsNCj4gPiA+ID4gKyAgICAgICB9DQo+ID4gPg0K
PiA+ID4gVGhpcyBpcyBpZGVudGljYWwgdG8gdGhlIGN1cnJlbnQgY29kZSwgYXMgQVJSQVlfU0la
RShwcml2LT5jbGtzKSA9PSAyLg0KPiA+ID4gUHJvYmFibHkgeW91IHdhbnRlZCB0byBpbmNyZWFz
ZSB1c2Joc19wcml2LmNsa3NbXSwgdG9vPw0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LiAg
U29ycnkgZm9yIG15IGRlbGF5ZWQgcmVzcG9uc2UuICBJIGJyb2tlIG15DQo+IHdyaXN0IG9uIHRo
ZSBldmVuaW5nIG9uIEp1bmUgMzAsIGFuZCBJIHdhcyBvbiBtZWRpY2FsIGxlYXZlIGZvciA2DQo+
IHdlZWtzLiAgSSBhbSBub3cgdHJ5aW5nIHRvIGdldCBjYXVnaHQgdXAgdG8gd2hlcmUgSSB3YXMu
DQoNCkknbSBzb3JyeSB0byBoZWFyIHRoYXQuIEkgaG9wZSB5b3UgcmVjb3ZlciBzb29uLg0KDQo+
ID4NCj4gPiBJIHRoaW5rIHNvLg0KPiA+ICMgSSByZWFsaXplZCB0aGUgY2xrcyBhcnJheSBpcyBv
bmx5IDIsIHNvIHRoYXQgdGhpcyBkcml2ZXIgY2Fubm90DQo+ID4gIyBlbmFibGUgdXNiMl9jbGtz
ZWwuLi4NCj4gPg0KPiA+ID4gRG9lcyBpdCBtYWtlIHNlbnNlIHRvIHN0YXJ0IHVzaW5nIHRoZSBj
bGtfYnVsayooKSBBUEk/DQo+ID4NCj4gPiBjbGtfYnVsayooKSBBUEkgc2VlbXMgdG8gbmVlZCBj
bG9jay1uYW1lcyBwcm9wZXJ0eS4NCj4gPiBJcyBteSB1bmRlcnN0YW5kaW5nIGNvcnJlY3Q/IEhv
d2V2ZXIsIHRoZSBoc3VzYiBub2RlcyBkb2Vzbid0DQo+ID4gaGF2ZSB0aGUgcHJvcGVydHkgZm9y
IG5vdy4uLg0KPiANCj4gVGhlIHVzYjJfY2xrc2VsIGhhcyB0aGUgbmFtZXMgImVoY2lfb2hjaSIg
YW5kICJocy11c2ItaWYiIGZvciA8JmNwZw0KPiBDUEdfTU9EIDcwMz4gYW5kIDwmY3BnIENQR19N
T0QgNzA0PiwgcmVzcGVjdGl2ZWx5Lg0KPiANCj4gV2hhdCBpZiBJIGFkZCB0aGUgY2xvY2stbmFt
ZXMgcHJvcGVydHksIHRoZW4gc3dpdGNoIHRvIHRoZSBjbGtfYnVsaw0KPiBJTz8gIEkgdGhpbmsg
d2UgY2FuIGp1c3QgdHVybiB0aGVtIGFsbCBvbiB0b2dldGhlciBpZiB0aGF0J3MNCj4gYWNjZXB0
YWJsZQ0KDQpBY2NvcmRpbmcgdG8gYW4gYXJ0aWNsZSBbMV0sDQo9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KZm9yd2FyZCBhbmQgYmFja3dhcmQg
ZHRzIGNvbXBhdGliaWxpdHkNCg0KQ3VycmVudCBwcmFjdGljZSBpcyB0aGF0DQoqIG5ldyBrZXJu
ZWxzIHdvcmsgd2l0aCBvbGQgZGV2aWNldHJlZXMNCiogb2xkIGtlcm5lbHMgbWF5IG9yIG1heSBu
b3Qgd29yayB3aXRoIG5ldyBkZXZpY2V0cmVlcw0KPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0NClsxXQ0KaHR0cHM6Ly9lbGludXgub3JnL0Rldmlj
ZV9UcmVlX0xpbnV4I2ZvcndhcmRfYW5kX2JhY2t3YXJkX2R0c19jb21wYXRpYmlsaXR5DQoNClNv
LCBJSVVDLCB3ZSBoYXZlIHRvIG1vZGlmeSBiaW5kaW5nIGRvYywgZHRzL2R0c2kgZmlsZXMgYW5k
IHRoZSBkcml2ZXIgY29kZSBzdGVwLWJ5LXN0ZXANCnRvIGFjaGlldmUgdGhlIGNvbXBhdGliaWxp
dHkuDQoxKSBNb2RpZnkgYmluZGluZyBkb2MgdG8gYWRkIGNsb2NrLW5hbWVzLg0KMikgTW9kaWZ5
IHRoZSByZW5lc2FzX3VzYmhzIGRyaXZlciB0byBjaGVjayBjbG9jay1uYW1lcy4NCjMpIE1vZGlm
eSBhbGwgZHRzL2R0c2kgZmlsZXMgdG8gYWRkIGNsb2NrLW5hbWVzLg0KDQpXZSBjYW4gbWFrZSAi
MSkgYW5kIDIpIiBwYXRjaGVzLCBhbmQgIjMpIiBwYXRjaCBpbiBwYXJhbGxlbC4NCkFuZCwgdGhl
IDIpIHNob3VsZCB0YWtlIGNhcmUgb2YgZm9yd2FyZCBhbmQgYmFja3dvcmQgZHRzIGNvbXBhdGli
aWxpdHksDQpJSVVDLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
