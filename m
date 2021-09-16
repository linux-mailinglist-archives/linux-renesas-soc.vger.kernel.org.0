Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431FF40D344
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Sep 2021 08:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234492AbhIPGdJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Sep 2021 02:33:09 -0400
Received: from mail-eopbgr80073.outbound.protection.outlook.com ([40.107.8.73]:56910
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231255AbhIPGdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Sep 2021 02:33:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDDPzK9hA7c7mscsP9gnU4BChgxbKDCylgpeUc29b8h4hjU8nqg47/LjA1pp2AjhvXiKv7iGCyKKSOkzP2RG/hljY8S1b2sE1sH87QwUt6bRtqHHuZ9RzpAXtRVq14oounGb2FL/XF2QJfbsirv7kTW3gN+vQejMzbfb7/Rphn2xrqPz/94WTw9Vjo5WObyiIXrpuRsKon5ve1sfskXjitt37y52LLmzYfrI4Z0tq8aaS83YtzHnr4eyf3QDUnKO0bwpQzHjwWPhbsts913DoXAFErQQuxliC8s2v5Lk9cPdr89PKvcx2s6YO97xTNxI2DFhdAgmevlSf/xn4rY2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=sMD8NJoPwAyvHxOyYyCAknMpPP6zfg4Qr4eDdIr2mOk=;
 b=iDevb0qggym7JhqQM7ndai+iz09ILH7lZE88J7p5UOl/Gf4HGeyZnEBfvTpaCt0B24iLHWxD0XC0/9P1eMtIG+WdkupN4u0IFQ5jbvFmsvsV04NR9Eu+fTxAH6oF2srBsx70WUGXEwX7E4wzuccBi4l5xuznPUciPxQMepMwN3qJwRdR0DVM0G2vtQMcIQDO1Un+NMECmKvYKvdWDnLVQXywbic9iZEb+oIvjYxN7WBh3n0eZhPEz0v3M5Qag2bE9LJIAsZg3FZSQVShZ0UdIzx8U4xyGrGLZRcMSc0nZQG3St7tGEOQZmSiMAUhZfStVTspIiaavTmRDqiLjkuwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMD8NJoPwAyvHxOyYyCAknMpPP6zfg4Qr4eDdIr2mOk=;
 b=fhjP1DEAvLbsIGry7R1nNHWGUJF9UjMEMBJg2paz6bNg8+osTT4bThJVLb7PVAXFS4UqRQvmVD7D1Cir1Kl1OrENdneKK4ipLQhG/EomI1JNiXvlQNZIHzlnOKXICgVUm46geR4ECxSXnifb4QaC9vX/JPCQfYTWqJadDBcnOxU=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3115.eurprd03.prod.outlook.com (2603:10a6:7:56::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.17; Thu, 16 Sep 2021 06:31:45 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c10a:1cea:5bcd:f415]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c10a:1cea:5bcd:f415%7]) with mapi id 15.20.4500.019; Thu, 16 Sep 2021
 06:31:45 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mfd: bd9571mwv: Convert to json-schema
Thread-Topic: [PATCH v2] dt-bindings: mfd: bd9571mwv: Convert to json-schema
Thread-Index: AQHXqjRwGSk2BDaCLke3rQiwh2NJ0qumZkoA
Date:   Thu, 16 Sep 2021 06:31:45 +0000
Message-ID: <dbc3f4bf-78cd-fb97-2502-ab87f9881179@fi.rohmeurope.com>
References: <29de13c075b839ed62cee189b6eb262e540c6553.1631707026.git.geert+renesas@glider.be>
In-Reply-To: <29de13c075b839ed62cee189b6eb262e540c6553.1631707026.git.geert+renesas@glider.be>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64f3737f-97bf-41c4-69e7-08d978dba795
x-ms-traffictypediagnostic: HE1PR03MB3115:
x-microsoft-antispam-prvs: <HE1PR03MB3115947B9D83326286F761A9ADDC9@HE1PR03MB3115.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1llhWxTiPzUsWRheHjFLW3VWg028RRK47kq7X5Mk/4koSrK0NxnKbk2/+6k3IIiwdPaja6Ju/Q42VUDmckEBzN1A/+E9guZ6p/RrEJKhiG4U3+DJNtgJN5tigFQQmKAg6oLC0BWW1J5eHA+CDEIIbjtZqETFTMEpocllufrkcm78b6aax2YdvKXhgT+DrlnH+Kyt9yxhe+AUqeD3Lg/OY5WX3/Me+cys9PhnlpNZZriPEkt6GqMsOS0AFBtUYikEpn43Mu4uerb+uFqXKEdzwoB3diEhvPbwgugWSlYTFcSapHcc0nx2Il7hHi5xy94PraeE1LfKhP12d07SEezRZgpmdcuVllRkW29SY7kbiskoR9ccGPFnZ5Wq3Kwp01b/8rDFPWaR1LGJHal5qS02/8s7lKeztX0ioQXiS+u5WzoBrgdIuNxHA8yZgjmcqn6ZdASQqtHW5CJR22tGK97i3vsh84bRIpWOSdM4AZHMus2TSJuxVw3NTcziGfEd+AJwxPtnxBZjPIRrAMpCFDDhGvG19h5iclXbaEK1T1plMII2SpwOJc63knuZMN0OxvUa2AK320c16w8i93DgIcI3wqwIABBWdeReOp8ESdHLViVSfIYIwOKB8IJKSKSVjDhWDkP1yhYAHmI0c4zo4/N9AuDk9plH65mRqmJMLlrzK0TXGMhVyjsvv/hbGr+kbYTiJk5R3CCXzqmors1l5ZxeXKVdk4lsS9lTqMN6OuhHmUELOiJT+DX3QRhvTVTEgk2wWeSveTBbzJufm49PmdOfHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(376002)(346002)(136003)(4326008)(83380400001)(6512007)(122000001)(2616005)(66446008)(66946007)(64756008)(186003)(53546011)(31696002)(7416002)(86362001)(31686004)(71200400001)(5660300002)(66556008)(8936002)(478600001)(66476007)(38070700005)(38100700002)(8676002)(316002)(2906002)(6506007)(76116006)(110136005)(6486002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2dNR3VRdThKSFRTcG04NUE5Z0lBSUZ4ZHNqSDFvRklha0thTVRRV1JFRGt4?=
 =?utf-8?B?ekF0ZmtmWHhYRU8xUHFWRHBVRzIyUnBiYll6Mm5Ham1tblZJZ05XKzZzWGRh?=
 =?utf-8?B?OXRSejQzZ2ZaQURCSW8zcGlHb0ZlbHJOamxwVDJ0TWhFRDJjd1dPNEZZZnZj?=
 =?utf-8?B?WXRoQnUvK0FhTmo3QzNDV2lIbldqay9IcTZodnIyRjZCQXlCR3BNZThjczZC?=
 =?utf-8?B?MXJRL3d2N2ZRbW1ja1Z4bG5MaHg1QmtvazhiNVozNnhYQ080RWlnaDJFaFpj?=
 =?utf-8?B?UUIrWkFaYi9SOVN2b0N3czlid2F6c3ptZ2gvOTJ3dzBtY1ZnQnU3NTR5V1V5?=
 =?utf-8?B?T1dDTklGc2libFc1NU1ZT2xOeDlSWEtXUWVuRVJRakRwYWdMRXMwTjhGZHhh?=
 =?utf-8?B?MmExUGZQc08zSWJKcjg2WFBRV0k4MG1wUDYwdmhNdDFQY3hWSVU1WitMRzRU?=
 =?utf-8?B?M1VaQzlpQkE3NS9nM0VUc1UvQ09oTEhaZVB3SlhZWDhCNnJwTVlMaExldERD?=
 =?utf-8?B?WS9ZQ2U1NitnRUE3L0Fjakc3S0djcEg3dVZ4WEN0TXo3UjNZTmU4em1jWExh?=
 =?utf-8?B?Zkh3NlZ1RnFjNVY5R3M2RCtBOG1TNmh1enplODRBL2RJbzhQSmI5RVNoZDJk?=
 =?utf-8?B?M1dLU2dGb0wzOXpYbGxiTFlaMSthZGlpL1lNODVFKzI4Q20rSUlucElTK05q?=
 =?utf-8?B?ZWdSTEJEQ09oRWxsY1VPUTNlSE1EeG1lS1dnVFo0cW9Dc3lDcThqM092WWd2?=
 =?utf-8?B?N1JxWmFZSjdGZHdUNDY3ZGs2dWt5bFI2SVNHN0Jhdm1PYU40STJlYThMQkk5?=
 =?utf-8?B?TmIzQlVEaGRjQ1k3STRZUHN2RzBUUWF0VHRxSjFEeHAwSFRHTW8rQlJtanU4?=
 =?utf-8?B?N2FOdHA4NEFyRllySjZURWdWTElhckhmRUtYQitqK0NoUXJqTWZJRXJmWllT?=
 =?utf-8?B?TDIyaldPSnVuRWdTdTZlR21qL1FUWGsxOWJmOXg3MStPMTBzbGplNWQvM2FT?=
 =?utf-8?B?QWMzaUF3dTZpVFk5akpUZjZ4Nm9sd3RDRmVGVWR6RXRqMWFRVHZmMTdBS1Ft?=
 =?utf-8?B?UUxTWHgwSHR0Q2NhQmtWaHcvOUZ1YStXZTFvNmFadFgwbXUrcmJMM0lZOUhF?=
 =?utf-8?B?bkVlRnczS1Y4N3BWbzFkY2VlYk5qRUhmaFg0QmtndDNVNDIxbVZNRFlsL081?=
 =?utf-8?B?TEVHL2NOZ3NVaUo1bnZnSEZUOUJzc3hMTnBQekk4QmVMYWlWdjJ4V2dpWnhH?=
 =?utf-8?B?bkwzZmwrVk1OT2VwcUVaL0JydEliOTRBM0pzM2lsRmU0bk9jWTlTcnd1RFBK?=
 =?utf-8?B?dVAxUUQwNU1KLzN6WlVXWHpGa01keFNNZ092Zy9zRmlHenNGcWp1ZC81ZndN?=
 =?utf-8?B?bHluN1p6Rm5tZUgrNzFGWWNSMVZ2bXB3VkI3L3BpUXpnTDhEVjlqR0ptdXB5?=
 =?utf-8?B?bVdsVFhlamEzNTBXMnV2ZWQ4SW0xWXFBNGJNbkZGcXpweTAwYXZpVHExUTZI?=
 =?utf-8?B?TnE2SHRleWU4amRkMUNpMk15dy9GMkpsK0x0WlRhd3NaSW1qTnE2NTJjYnIy?=
 =?utf-8?B?VTBMYzc4U0xBZ0RDbmlDOFJLOVpRWXQrNURZTmI1c1d3eU1PMHE5KzdGLzdn?=
 =?utf-8?B?YmtRMFBFeWN6cGErSDQvVHFoZForL2RRZDNETDdSLzhCK2hNcWE4VWZoTWNH?=
 =?utf-8?B?NENDYmNlSXBTQzR1ZWdVNnpCZ1RCdlp3N2haUE5nbmpPeU9ncVpudGEvbk1z?=
 =?utf-8?B?OXl0U1hrMmpIVWNPdVAyR0VEZ1diczNzMnRJZ3FlOXhkUE8rVjYxK0VIeWE1?=
 =?utf-8?B?TVRRdXFXU1YzKzc5OGJIZz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B953A2CBD03E68488F9A7277A6CB9832@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f3737f-97bf-41c4-69e7-08d978dba795
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 06:31:45.3774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FwzBlLza5XKJ2DA6tyyxANtAkEJUJBWJ0TfnmK0ANfXl/5L2gfxhEdm+jT/V2lkEzL4moLdIuIZrOEUDi4izhXplzt00YDT6ALlmtG6kEm/joEIYfL291AnCI+qdHgJk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3115
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gOS8xNS8yMSAxNToxNCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBDb252ZXJ0IHRo
ZSBST0hNIEJEOTU3MU1XVi9CRDk1NzRNV0YgUG93ZXIgTWFuYWdlbWVudCBJbnRlZ3JhdGVkIENp
cmN1aXQNCj4gKFBNSUMpIERldmljZSBUcmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiB0byBqc29u
LXNjaGVtYS4NCj4gDQo+IE1ha2UgdGhlICJyZWd1bGF0b3JzIiBzdWJub2RlIG9wdGlvbmFsLCBh
cyBub3QgYWxsIHVzZXJzIGRlc2NyaWJlIHRoZQ0KPiByZWd1bGF0b3JzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4g
UmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiBJIGhh
dmUgbGlzdGVkIE1hcmVrIGFzIHRoZSBtYWludGFpbmVyLCBhcyBoZSB3cm90ZSB0aGUgb3JpZ2lu
YWwNCj4gYmluZGluZ3MuICBNYXJlazogUGxlYXNlIHNjcmVhbSBpZiB0aGlzIGlzIGluYXBwcm9w
cmlhdGUgOy0pDQo+IA0KPiB2MjoNCj4gICAgLSBBZGQgUmV2aWV3ZWQtYnkuDQo+IC0tLQ0KPiAg
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9iZDk1NzFtd3YudHh0ICAgICB8ICA2OSAtLS0t
LS0tLS0tDQo+ICAgLi4uL2JpbmRpbmdzL21mZC9yb2htLGJkOTU3MW13di55YW1sICAgICAgICAg
IHwgMTI3ICsrKysrKysrKysrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTI3IGluc2Vy
dGlvbnMoKyksIDY5IGRlbGV0aW9ucygtKQ0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2JkOTU3MW13di50eHQNCj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yb2htLGJk
OTU3MW13di55YW1sDQo+ICsgICAgICAgICAgICAgICAgICByZWd1bGF0b3JzIHsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgZHZmczogZHZmcyB7DQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiZHZmcyI7DQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8NzUwMDAwPjsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jv
dm9sdCA9IDwxMDMwMDAwPjsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWd1bGF0b3ItYm9vdC1vbjsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWd1bGF0b3ItYWx3YXlzLW9uOw0KT3V0IG9mIHRoZSBjdXJpb3NpdHkgKGFuZCBpbiBvcmRlciB0
byBsZWFybikgLSB3aGF0IGlzIHRoZSBleGFjdCBpZGVhIG9mIA0KdGhlICdyZWd1bGF0b3ItYm9v
dC1vbicgYW5kIHdoZW4gaXQgc2hvdWxkIGJlIHVzZWQ/IEkgX3RoaW5rXyB0aGUgDQoncmVndWxh
dG9yLWJvb3Qtb24nIGlzIGluIG1hbnkgY2FzZXMgdXNlZCB0byBtYWtlIHRoZSByZWd1bGF0b3Ig
DQpmcmFtZXdvcmsgdG8gZW5hYmxlIHRoZSByZWd1bGF0b3IgYXQgc3RhcnQtdXAuIFdoYXQgSSBf
dGhpbmtfIHRoZSANCidyZWd1bGF0b3ItYm9vdC1vbicgaXMgaW50ZW5kZWQgZm9yIGlzIHRvIGFk
dmVydGlzZSB0aGUgcmVndWxhdG9yIA0KYm9vdC11cCBzdGF0ZSBmb3IgcmVndWxhdG9ycyB3aGlj
aCBkbyBub3QgcHJvdmlkZSBhIHdheSB0byBnZXQgdGhlIA0Kc3RhdGUuIEkgYW0gdW5zdXJlIGlm
IHRoZXJlIGlzIGFueSBwcm9wZXJ0eSB3aGljaCBpcyBpbnRlbmRlZCB0byBiZSB1c2VkIA0KZm9y
IGVuYWJsaW5nIHRoZSByZWd1bGF0b3IgYXQgc3RhcnQtdXAuIERJU0NMQUlNRVI6IFNvdXJjZSBv
ZiB0aGVzZSANCnRob3VnaHRzIGlzIHVua25vd24uIEkgbWF5IGJlIHdyb25nIGhlcmUuIElmIHNv
bWVvbmUga25vd3MgdGhpcyBmb3Igc3VyZSANCkknZCBiZSBncmF0ZWZ1bCBmb3IgYW55IGVkdWNh
dGlvbiA6KSBJZiBJIGFtIG5vdCBtaXN0YWtlbiB0aGUgZHZmcyANCnJlZ3VsYXRvciBkb2VzIHBy
b3ZpZGUgYSB3YXkgb2YgcmVhZGluZyB0aGUgZW5hYmxlIHN0YXRlIGFmdGVyIGJvb3QuDQoNCkZp
bmFsbHksIEkgaGF2ZSBzZWVuIHRoaXMgcXVpdGUgbWFueSB0aW1lcyBiZWZvcmUgYnV0IEkgYW0g
dW5zdXJlIEkgDQp1bmRlcnN0YW5kIGl0IC0gd2h5IHNldHRpbmcgYm90aCB0aGUgJ3JlZ3VsYXRv
ci1ib290LW9uJyBhbmQgDQoncmVndWxhdG9yLWFsd2F5cy1vbic/IFdvdWxkbid0IHRoZSAncmVn
dWxhdG9yLWFsd2F5cy1vbicgc3VmZmljZT8NCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
fTsNCj4gKyAgICAgICAgICAgICAgICAgIH07DQo+ICsgICAgICAgICAgfTsNCj4gKyAgICB9Ow0K
PiANCg0KQW55d2F5cyAtIGFzIEkgbWVudGlvbmVkLCBJIGFtIG5vdCAxMDAlIHN1cmUgb2YgcHJl
dHR5IG11Y2ggYW55dGhpbmcgOikgDQpIZW5jZSBteSBxdWVzdGlvbnMgYXJlIGp1c3QgcXVlc3Rp
b25zIC0gYW5kIHRoZSBiaW5kaW5nIGxvb2tzIGdvb2QgdG8gbWUuDQoNCkZXSVc6DQphY2tlZC1i
eTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQoN
Ci0tTWF0dGkNCg0K
