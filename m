Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59DD22AB484
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Nov 2020 11:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgKIKMS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 05:12:18 -0500
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:15217
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726176AbgKIKMS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 05:12:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFMu3fRYGGXPma7FKM5UHBFIl/unPmkOC1FtzNEkPQkc3XbyQDx3ubwP+BizqsbwX/8eli0Etjb8qqxGwch/yDUtfxm5K+32xmVZQRaQNc85arzczpdHbamyRzE1AOOJy6rCx9FssNR/bIS0KV3EFVo35rqbBgROkcsN9qI5X5bZ8Pud5VtZtINz6l9g/PzWjgL/hBh/C23cqp2Vz5gSImp//ab7z+mvbjxZVtJVt4QlMdaRj46wdpJw6L+SqB516leVXA1XT6RJUGIp0JvN7uJeAUo7bigcvZZIeuEzbaCCva9pS1nJ8/mPVp90sm0jT3WTYxDBuLp6iMOyIIzxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XTP/38NkmnJbgPYwoK+5XG69Ub18gqJngCIuCrZxvc=;
 b=HUup25zURq/kCFyTAzqwaQOSJPRKCR7pcJxJVIfM5lDo4STfUiUssiyrt5MRjHUjK9XloE7uGJgRuyDoA4apPp09LT/Pe8dSLvn2NdgKpSl4VrS4rKVNRDpX7W4jwu56thzXFpq88TEGBEYUyqJCPytr4fpwmGTRRRjTVMs6Abd/xSbNONin1QqDH3T2fvPINGSOHJTyes3P2aMsloImGIeBX9DDHanGa0wxD/0Gk8FjxcYjLMZiSJrZBP0GcE1ve8rEAgNA43MtOas26EiN2UE4oD3KiGVF1O2U9B26VGYcTeMek73GF+gGjSV4RrTZCgIfr6bIiZT6FZ8hNROjBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XTP/38NkmnJbgPYwoK+5XG69Ub18gqJngCIuCrZxvc=;
 b=gJNbodT8YngBrjrCDAHPfuFPY85lSS7rlw+USEq8b+5RiTRDfRaloiKwhKx434JQv5hmgqxNO7ciK/uEZg2CCYWmyFH9R8/Ui/yPG4vF6nhWPcGpZed6c+ekaCTCG+PTeHllZTYwLlXfibn8vAHQfNRZPPlRzTE4uXUAXOhkMYc=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSYPR01MB5558.jpnprd01.prod.outlook.com (2603:1096:604:80::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Mon, 9 Nov
 2020 10:12:14 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70%3]) with mapi id 15.20.3541.023; Mon, 9 Nov 2020
 10:12:14 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774e1: Add missing audio_clk_b
Thread-Topic: [PATCH] arm64: dts: renesas: r8a774e1: Add missing audio_clk_b
Thread-Index: AQHWspj6AaA8uWUwckCFh0RhTGsbcqm/maKAgAAAPcCAAAH4gIAAAF2Q
Date:   Mon, 9 Nov 2020 10:12:14 +0000
Message-ID: <OSBPR01MB504862DD2A3B8DE3334FF831AAEA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20201104105508.21197-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUFTQTJqRqF7=-RbxKRDUbqEjf8LFpzGHugTNAZ1KV+cQ@mail.gmail.com>
 <OSBPR01MB50485F258716E49D43197587AAEA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
 <CAMuHMdWDXo+4+a=Ck8ktP2D_w2ysxDP1FqGcQ04BBvcDkbDJFA@mail.gmail.com>
In-Reply-To: <CAMuHMdWDXo+4+a=Ck8ktP2D_w2ysxDP1FqGcQ04BBvcDkbDJFA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0ed9adef-6884-4bd5-5abc-08d88497ee36
x-ms-traffictypediagnostic: OSYPR01MB5558:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSYPR01MB5558ABD15893EFEEB0583DA8AAEA0@OSYPR01MB5558.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZvdYqKPs4gzq40i8HRvVgcY55qXABvjAwsjsvP4xG4N/kUtTlkv+yQOg85AJ7SbJvQBuGNnWIayBXt7ks5joZvJzT/LRnp4wxuSOFsSdDA4PD131KJsTCf+4rT2z62RXiDkpFtriIJm0OmnfpO/JrVeyIQTnFGZ77LdEron87zvs5JU4X7RPjtC6ol58Wqw5AJm2Q28jTQ6yH39sO8v9F2yw0x0o+Xiy/ZixY3UjazxQYqoA+CZyPMDCOlt1ZRxF0uwnPEBn0sa6o0DuCXU34OPFg0wWXQdMMP+8ZfF9MtOgZsEMKlTGmnb/+H24YL8WEAQkPyY8yd5AQRXH0NFb1w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(55016002)(9686003)(478600001)(316002)(54906003)(76116006)(66946007)(33656002)(66556008)(71200400001)(66476007)(52536014)(64756008)(5660300002)(8676002)(66446008)(8936002)(6916009)(2906002)(86362001)(4326008)(7696005)(83380400001)(26005)(186003)(6506007)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: KIjMkWpNaY4NCISEgPOeXfqk0ji6P7GLek6joNVoHkIYG1dH3LPPNOnv4G5kiA3FoOAc72U0QAsOETvHHd55m9Viua6CAS0D4whw/SoB5rUuZyawByrovp5XJJ8KUANA2I/cBpZJ64DUVNSAmzLKd6AITtEg2G1InSNs3Aec7pB+7fUFu+PQOkc1aTizHLYtMvx8todeG3xyak2iN+Rk+YBKiq4UItbT+YhWAcv9Uvwm2n1K+IXEYq/eR0jBMj2DFTjH6S5aQrP+dh/nrfb/CtmdGznhFcnDH2V5FW22E4u/37T4gbKmwcio4X0zSWLQ0TaAReQfiK8dMMP59hvMLoT33ZxOoTu9yFlfiiyY4vGhbtmIu/vMNUC9KcFxdco/BJpNSNXt8Cg1BPOSlCmPpJ6CbGmN45L0CsiTUnPEch27DUgdyRkSN5Qtl1KP+vrQzXr+J3pZ5lT+lANWd7/DXv+D3xndafscPK2t7YNvM25kg8lJlc0yy3smeg2INZxu4U0kjJqGjKDHroSobjUmnwuG5eHED5/DYMLl/jZ6WXoXpAxZnkF1JYNmVQhqfBkOQLPzUp62Y2Fm6QlW57NmG45wVd9cIevduvOQPz1h6gHKC2vPzIxFzPrdW1KuIF6uqCGj1K9/fYZ1ux+ZiCsXsg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed9adef-6884-4bd5-5abc-08d88497ee36
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 10:12:14.3353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xRll+/rcr1oRfdkBii28l0G1V0s1tDDTWL+/Xae/62O5cCI18OQHFT6giQh7Kn246rhtE5hdD4lx49skutZGfXF2tBdDZssPT5/LUxtq/tivZ7qEWyjxJ7LQptfegTJg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5558
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDkgTm92ZW1iZXIg
MjAyMCAxMDoxMA0KPiBUbzogUHJhYmhha2FyIE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBNYWdudXMgRGFtbSA8bWFnbnVzLmRhbW1A
Z21haWwuY29tPjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IExpbnV4LVJlbmVz
YXMgPGxpbnV4LQ0KPiByZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3Q6T1BF
TiBGSVJNV0FSRSBBTkQgRkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTDQo+IDxkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBCaWp1IERhcw0KPiA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+OyBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiByZW5lc2FzOiByOGE3NzRlMTogQWRkIG1pc3Npbmcg
YXVkaW9fY2xrX2INCj4gDQo+IEhpIFByYWJoYWthciwNCj4gDQo+IE9uIE1vbiwgTm92IDksIDIw
MjAgYXQgMTE6MDUgQU0gUHJhYmhha2FyIE1haGFkZXYgTGFkDQo+IDxwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+ID4gPiBTZW50OiAwOSBOb3ZlbWJlciAyMDIwIDEwOjAyDQo+ID4gPiBUbzogUHJh
Ymhha2FyIE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+DQo+ID4gPiBDYzogTWFnbnVzIERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IFJvYiBI
ZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBMaW51eC1SZW5lc2FzIDxsaW51eC0NCj4gPiA+
IHJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz47IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFO
RCBGTEFUVEVORUQgREVWSUNFIFRSRUUgQklORElOR1MNCj4gPiA+IDxkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc+OyBCaWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
PjsgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gPiA+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI4YTc3NGUxOiBBZGQgbWlzc2luZyBh
dWRpb19jbGtfYg0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgTm92IDQsIDIwMjAgYXQgMTE6NTUgQU0g
TGFkIFByYWJoYWthcg0KPiA+ID4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2Fz
LmNvbT4gd3JvdGU6DQo+ID4gPiA+IEFkZCBhdWRpb19jbGtfYiBjb25maWd1cmVkIGFzIDAgSHos
IHRoaXMgd2lsbCBiZSBvdmVycmlkZGVuIGJ5IHRoZQ0KPiA+ID4gPiBib2FyZHMgcHJvdmlkaW5n
IHRoZSBhdWRpbyBjbG9jay4NCj4gPiA+ID4NCj4gPiA+ID4gRml4ZXM6IDgxODNhNzkzOGNmZWMg
KCJhcm02NDogZHRzOiByZW5lc2FzOiByOGE3NzRlMTogQWRkIGF1ZGlvIHN1cHBvcnQiKQ0KPiA+
ID4gPiBSZXBvcnRlZC1ieTogTm9idWhpcm8gSXdhbWF0c3UgPG5vYnVoaXJvMS5pd2FtYXRzdUB0
b3NoaWJhLmNvLmpwPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFi
aGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gUmV2aWV3
ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4g
PiBpLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1kZXZlbCBmb3IgdjUuMTEuDQo+ID4gPg0KPiA+
ID4gPiBJIGhhdmUgcmViYXNlZCB0aGlzIHBhdGNoIG9uIHJlbmVzYXMtYXJtLWR0LWZvci12NS4x
MCBicmFuY2guDQo+ID4gPg0KPiA+ID4gTm90IHJlbmVzYXMtYXJtLWR0LWZvci12NS4xMT8NCj4g
PiA+DQo+ID4gU2luY2UgdGhpcyB3YXMgYSBmaXh1cCwgSSB3YXMgaG9waW5nIHRoaXMgd2lsbCBn
byBpbnRvIHY1LjEwIGFzIGEgcmVzdWx0IEkgcmViYXNlZCBpdCBvbiByZW5lc2FzLQ0KPiBhcm0t
ZHQtZm9yLXY1LjEwIGJyYW5jaC4NCj4gDQo+IE9LLiBXaWxsIHF1ZXVlIGluIHJlbmVzYXMtZml4
ZXMtZm9yLXY1LjEwIGluc3RlYWQuDQo+IA0KVGhhbmsgeW91Lg0KDQpDaGVlcnMsDQpQcmFiaGFr
YXINCg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
