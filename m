Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C57628FE1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 08:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393953AbgJPGP0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 02:15:26 -0400
Received: from mail-eopbgr1300122.outbound.protection.outlook.com ([40.107.130.122]:61056
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388285AbgJPGP0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 02:15:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aORQLhH24zfWO1fnAM6tLWWG73N5k2utfb8dTailavC5ZBlmqU9A1ggoT9nApbTviCJijvfOa/MK168vlnK9RRiwHByhyoiSsKnZhxW8BJs6QsXpm+b879OESTaDtlm5yHC9E6hpGps0rIarC9z3V4HWGc/aGWc12gxhLq3qKinJnlPj0jlcQ29OkdkRV4Tg4B8npM37Ix0ACjIxccuiQE98asQXf0t7DChPoiXa7YHzTPnDEqBPeCjUuVm8v5bc61GMWoD+qjmxGO5BJZHpIueCTlbNnZBMYZZoFXV2QzIsGVHm7jisJzQ7lESe7iZR2h3BNigSYMlDUqFREUv3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC6rGrDDCwt13ZSXXjLZPwrMMCjxNIDQY2sxGKoLLv0=;
 b=X25YxJsPmNgZRWEoFa1qoAP7sD0Me0FVJLRWLLc/8UHw3Nc8hbE98nsN6q7fk1BYlxoiVntEQ8x/EwIfHvfIduq0z8JCC3kKsd3DUlx4ejZOXyTR9w8HVbQUrvTqI0CTCwB3IP9Ewwx8nYB8HUrqlB6FS1u5jXvBrrJaahp/ZaWbG9ov62b2mOQqI/IIQf/nsmGwbtpN72wCtBYUpzHhIhze7m4fgFF3fmzlUZ9+l1vmr3Yj0t/asL6fhzlDc/U6YZakeloOgxrB2SZNsqRmwMsvI4y4MtSBr1DnArK9B+Znr1fGm7CqLvy/1AOjkmsfnY6KTGhoK/PyRrjp6mVYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC6rGrDDCwt13ZSXXjLZPwrMMCjxNIDQY2sxGKoLLv0=;
 b=VeMRFbyUs3CBVPpIQB6Yr5/4pllPNAV6HrOCB6oRM+nGNcKc+JCoQyyOJyll0t1ot/HZy9YJtJxbOubZgcVNe5b3qN9DGjrsBQCe78Cf5G6sLQRLiOmcUnafS3qgVUMxcLdZzBsuz/WpZsnEpn+tKSc4tPxMD/PII73nxDZXifE=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB2123.jpnprd01.prod.outlook.com
 (2603:1096:404:c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 16 Oct
 2020 06:15:22 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%4]) with mapi id 15.20.3477.022; Fri, 16 Oct 2020
 06:15:22 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: hihope-rzg2-ex: Drop rxc-skew-ps
 from ethernet-phy node
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: hihope-rzg2-ex: Drop
 rxc-skew-ps from ethernet-phy node
Thread-Index: AQHWovZwTOpS86uN10+prAj8Q++MI6mYq/gAgAEVPmA=
Date:   Fri, 16 Oct 2020 06:15:22 +0000
Message-ID: <TYBPR01MB53091FA117DF513BAF6A46E486030@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201015132350.8360-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUogbfHYv+g3+2=7JwhgH3MngmDEe5nvjZwkjTOJyn9dQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUogbfHYv+g3+2=7JwhgH3MngmDEe5nvjZwkjTOJyn9dQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [81.131.167.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e200b792-3d9f-43ce-156a-08d8719add52
x-ms-traffictypediagnostic: TY2PR01MB2123:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB212388DC26D10824C489591786030@TY2PR01MB2123.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +U7lg3hoTSMxXpOKlUl2Ef1SZk5KdntMWqf6uGWA8LHnU607ZfhwupNEhWc2pmi9Fs38MSLQw0Mk4zCCU/76hPr+kjSVD7fa7FQGbKJTd0MjB9IS/H+D8bvN5thAe3sfCUHColVSGEwJUH/mdZDxHqRJD5qSvGZcWvU9BZA3BC+3fpC2m7B99/DWCQpVfp/nHPkFum05VeM4sxz/hWir4PmZi06uJfVcIu9s59SZYFQgdoZ+J194nIEbNj2/8iwba7F7J+IqC6c+iR4qrW9jgkDbkOWNW6v1pQhfofKU5aZRDf78NCbbOySNaXEDuHlvU4uV9YMpAAZ2FqnxShoSkdDhtWA70je3Z0164Y7lRBr7lEk1+xKcXIJGDQIUWlwwzea5slJJ9qeujxjZiPxbRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(9686003)(86362001)(71200400001)(107886003)(54906003)(33656002)(4326008)(478600001)(316002)(83380400001)(6506007)(66556008)(64756008)(52536014)(8676002)(26005)(8936002)(66946007)(66476007)(76116006)(66446008)(2906002)(7696005)(55016002)(186003)(5660300002)(6916009)(53546011)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 0xpWnrmUtom4h0tuAwxfUjPc0g880ONnite0VxJKwkVAph34LZ82ZXmuqDdGMbwAbwcPvZIP5Xr4Pkvs366/s94IDbuQsJZkyIB04qD+nMHkJcIj6aAYiOc3LD6ab3ruZXh/fzzprft/B4WP6jR444xNZq19hS4s0tU0MHn0WNVe3SO5+tkw/VC6T+saXdCSfTPU+gfOvZFG2j58FmhSbC4ixIOR2IgFE4T4l7a7wlAH6KoeAlLrNBA7mfmHhXDu29NIt0vn8k5czhAb8Xc6xV/lwxEjVdfJcPpyxH9ujgkbZDfxUaPaj3BKbXS2ihvlR4GKaIthok0QxwTkhkwkfcjwkp3eDgpEyt6oJYdFJwhN0yHoxdHBHbGii8fJn8PqH9ISC8imdOxIM1IOknT6W/EN6o7hNVFQPqcFGIk5FfnpttR0r+EtwekB06V6JKlQ72aDksckmctb6kneDG9vOCxo7tRJEG/8gWBmxv2ZwNr40O053ZIww967mZ8vZONPIo5/vBl2TczZ3mH6uW+efHhyBlCgv1Amq7mRsx5TA12r0mZavCPj6c2kcVkGLfWghRbWWoDYQ5ytSJS5VbqXt66Pb97uN6Kkpgvqx5rCSDPchVRqSfOYWDXiY7sKq+5/RV7MNSfahmjOLpeA1auRXQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e200b792-3d9f-43ce-156a-08d8719add52
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 06:15:22.3796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uKkOu7UFWmCnNDa8Q0qXDtPAdc6Jf6VASdvyqV2qK050gQcsBSmZYAZoh0ENrKqIolMMeC9TSW79IJfreu9tw0pEIYatfCQTWq5XXFD9UP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2123
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8yXSBhcm02NDogZHRzOiByZW5lc2FzOiBoaWhvcGUtcnpnMi1leDogRHJvcCByeGMt
DQo+IHNrZXctcHMgZnJvbSBldGhlcm5ldC1waHkgbm9kZQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+
IE9uIFRodSwgT2N0IDE1LCAyMDIwIGF0IDM6MjQgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBIaUhvcGUgUlpHMltITU5dIGJvYXJkcyB1c2Vz
IFJlYWx0ZWsgcGh5IGFuZCB0aGUgZHJpdmVyIGRvZXMgbm90DQo+ID4gc3VwcG9ydCByeGMtc2tl
dy1wcyBwcm9wZXJ0eS4gU28gcmVtb3ZlIHJ4Yy1za2V3LXBzIGZyb20gZXRoZXJuZXQtcGh5DQo+
IG5vZGUuDQo+ID4NCj4gPiBGaXhlczogNzQzM2YxZmI4ZWM4ZmUgKCJhcm02NDogZHRzOiByZW5l
c2FzOiBBZGQgSGlIb3BlIFJaL0cyTSBzdWINCj4gPiBib2FyZCBzdXBwb3J0IikNCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LQ0KPiBsYWQucmpAYnAu
cmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtcnpnMi1leC5kdHNpDQo+ID4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL2hpaG9wZS1yemcyLWV4LmR0c2kNCj4gPiBA
QCAtMjMsNyArMjMsNiBAQA0KPiA+ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+DQo+ID4g
ICAgICAgICBwaHkwOiBldGhlcm5ldC1waHlAMCB7DQo+ID4gLSAgICAgICAgICAgICAgIHJ4Yy1z
a2V3LXBzID0gPDE1MDA+Ow0KPiA+ICAgICAgICAgICAgICAgICByZWcgPSA8MD47DQo+ID4gICAg
ICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8yPjsNCj4gPiAgICAgICAgICAg
ICAgICAgaW50ZXJydXB0cyA9IDwxMSBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiANCj4gU2hvdWxk
ICJyeC1pbnRlcm5hbC1kZWxheS1wcyA9IDwxODAwPiIgYmUgYWRkZWQgdG8gdGhlIGF2YiBub2Rl
IGluc3RlYWQNCj4gKGFmdGVyIFsxXSBoYXMgZW50ZXJlZCB2NS4xMC1yYzEsIGFuZCB0aGUgRFRT
IHBhcnQgb2YgWzJdIGhhcyBiZWVuICBhcHBsaWVkIHRvDQo+IHJlbmVzYXMtZGV2ZWwpPw0KDQpM
b29raW5nIGF0IHRoZSBzY2hlbWF0aWMsIGl0IGlzIG5vdCBuZWVkZWQsIHNpbmNlIGl0IGhhcyAi
Mm5zIiBpbnRlcm5hbCBkZWxheSAgKDQuN0sgT2htIGxhdGNoZWQgdG8gMi41IFYpIG9uIHRoZSBS
eCBzaWRlLg0KDQpDaGVlcnMsDQpCaWp1DQogDQo+IFsxXSBbUEFUQ0ggbmV0LW5leHQgdjQgcmVz
ZW5kIDUvNV0gcmF2YjogQWRkIHN1cHBvcnQgZm9yIGV4cGxpY2l0IGludGVybmFsDQo+IGNsb2Nr
IGRlbGF5IGNvbmZpZ3VyYXRpb24NCj4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXJlbmVzYXMtc29jLzIwMjAxMDAxMTAxMDA4LjE0MzY1LTYtDQo+IGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlLw0KPiBbMl0gW1BBVENIIHYzIDAvN10gbmV0L3JhdmI6IEFkZCBzdXBwb3J0IGZvciBl
eHBsaWNpdCBpbnRlcm5hbCBjbG9jayBkZWxheQ0KPiBjb25maWd1cmF0aW9uDQo+ICAgICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yZW5lc2FzLXNvYy8yMDIwMDgxOTEzNDM0NC4yNzgx
My0xLQ0KPiBnZWVydCtyZW5lc2FzQGdsaWRlci5iZQ0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMs
DQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzDQo=
