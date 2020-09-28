Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D546227A90C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Sep 2020 09:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgI1Hwn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Sep 2020 03:52:43 -0400
Received: from mail-eopbgr1410120.outbound.protection.outlook.com ([40.107.141.120]:54799
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726657AbgI1Hwm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Sep 2020 03:52:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIzKVzy2MaJidaA+50jWJmzOgng+ziCPVUFB113AC+BR3h+oRwk+XLxLfsLvQP4Z3EqVwVZd5dvXKa1I6jbRToHXL7xu/Pg3/dMbkF4R4qwjB0307Jqnx6npS9PAE2kgm01yXNNYWz91tBArRTIjUKSPTVjOSISWsAyNOi40kXwzY2lNouSg1jSsckp+zkLWMdIB0IrHYjtfeDCRChunrI6ujjSmnx9E8OVCPU77pPrD69Bjb1RV1x9heAX+tFQ6ZzY1rKlD90aXqW4OvwjdpHYrFHvPRzl+kcWmfmolELJgbwBKFF1WFzJM6yKzUfIJuX6e1Of9DxBrewQtDXWuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T+ogERlU9jGMXsyyIuikuHy2ttcMqsInrU6bEu0TfM=;
 b=gHwaVU2AK+uVeEzArBveWfhUwa5N6oNJOteEnS8/VwUBgNomRbX+HhMA7Dsr+ABKm2vZhsoGFTk9kCUOuxaA2zfTZMcZrS/BgPOhxQYlqClzVuOiS7Bw54FZEO3qmtYOK1/qz8wVBGH2hyR73+o7qH9SF4Q391sigNnF+WEQAC4SbvR8BKklWuLAMpQGUPGjz8xJ+0iouQ2wg4gNnVhp6c+MvFRONUNjbykjSSeDz7OJikIkKG6b3upbzmqOirMUWELyOJ0yvpJcpFnYuQDXGrO4J7s/LXWYFCTr7QeHjgSR9SHCQeTEQWVUt4hvOgOCVOQ8JgBhxxIItqvKeW/NBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T+ogERlU9jGMXsyyIuikuHy2ttcMqsInrU6bEu0TfM=;
 b=lsdJvGDDJ9cQMMo06zLHxrCWY9T0nB+7NLztu9HDKEb1aYXMTzZDc5KvHLY9LeaIGDHCC6mejhufwtu4FfVUsJMpp94oUJipC89CsmT277kqxJMGZrnCFtVF1FfGlpPLor+ZseAGgL8bDjGiP+du911dzhf0nxNYR3geOTWoM4w=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSAPR01MB4452.jpnprd01.prod.outlook.com (2603:1096:604:6a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Mon, 28 Sep
 2020 07:52:38 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::cdbe:6988:b51c:51a3]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::cdbe:6988:b51c:51a3%6]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 07:52:38 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
Thread-Topic: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
Thread-Index: AQHWcXolwARwMJAfD0yrEvn6QqsGnalGfY0AgDY8OACAAHYKAIAAvoiAgAAGmdA=
Date:   Mon, 28 Sep 2020 07:52:37 +0000
Message-ID: <OSBPR01MB5048ABBC3F74E1DF49374E7DAA350@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20200813140041.5082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200824004816.GS6002@pendragon.ideasonboard.com>
 <CA+V-a8uq44hKOxbwBXZ_90q6e4JjCEPwOWp4BDY7BJJaP1Cg6g@mail.gmail.com>
 <20200927200418.GA3986@pendragon.ideasonboard.com>
 <CAMuHMdX0_VDVw41ZuGy0M+d6sgNMujSas4x+YqZMWwpF-TvOZg@mail.gmail.com>
In-Reply-To: <CAMuHMdX0_VDVw41ZuGy0M+d6sgNMujSas4x+YqZMWwpF-TvOZg@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: eb353f8b-7602-4d86-7639-08d863837826
x-ms-traffictypediagnostic: OSAPR01MB4452:
x-microsoft-antispam-prvs: <OSAPR01MB445294B97DE7B302F192878DAA350@OSAPR01MB4452.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T929nZQUv1BOU0jFMX6Hc+Qfd8zaNyrUcAuyY5rafXxdkADDc4Bf5XrPRspYIK9qIg0jM+acjLNBZ3tabFItZLGq2drtHakIuHkriQWB8cl+iaR/1KDdakz7DjOHL0pO20oCUGzVXa0Wr6XSOKVamEibkW9s8tIP12Jol/sEstlASGH2w5T/yxTmCMir09lZmUu9sJuM5NDBOOLBZY3E3C4fVB73ZaLCdBqIe+Fe7oHgrv4dy5ziuUelF5XshtkM67vXyFAzzCspbeBw5I062Qot/SfCE7o38Z7ON/oNUZZdjfBdSkRE11e1OxjT8j4bFCMko9cTf+Sj+tdNoF1+cjsrskExSDGrkxEFBP9279heNvrp1RTQNr3xg9642hPzQyAY1i0lWm01NLtIyYAf17Fj6nzu+2neTvgK7W1zssYUKutHOfySbSn+FjZHIwrnSPTnFc1l7+LXuf9pfsTBow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(52536014)(186003)(64756008)(66556008)(66476007)(478600001)(66446008)(8676002)(53546011)(7696005)(2906002)(6506007)(26005)(83380400001)(33656002)(71200400001)(316002)(66946007)(54906003)(76116006)(966005)(8936002)(9686003)(86362001)(4326008)(55016002)(110136005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: LbLepFYNRr3bgxaK1tDkMcS/p7TNln7Cu4UguZYpNeO73Ha/+RNHKxHIWkygixMJWzchaatzNZX8IzsjRhFcyLsgnQp60CVTSnL0QX+6q2ZrWunqFrU5TGA/4rd+yCISlW8ZSZ8kLbWCXRdvHHwhOO+c5qxC0UI2iK+GlSSbOmurv93uLDSlvr+oxqbtmP1FV3SBohAwNRVVlip9hAqKdyPQxwoxEvh739fCyoylB8FGRybGm2YXS/i+bpPaNf7OiW/kZM6VKqy8fFcoFp0BGBcPj9x45CjQGKyhQ40BKKbnCKCJiWZoMm3WN430J13Eavu6SgBnrA5QYbcQYG5v5/kXWh/dI3rQR5A7hIIuXPqStWBtADLnC3YDjjwwuYHfNdxuYI+a+HIl2CNOcDh/Iv/sO8CfsxosQvGPk/guH2V9RdvLBzER9Np/XlYjVdeu2LsSd2a6yjKnxms51YFmOknMWPWOM6x/CnOVekoV7skJaUFICEjb+2SsRedvIE9jO1rKt3WohxJLJ7ATE4tD5q+t05ai5DSzwQs74zQfiDIiqd1f4iFB8kcWeVoZwAZvTY4RdosvBZeMx4pwJTrEc9Qkm+AQKC/4BlF3mujTxoulfzfNlBy/sqHJeU/jUNNpW9mUwU+pDwHdesjPdsG0hg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb353f8b-7602-4d86-7639-08d863837826
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 07:52:37.8458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1l865A22iMSs1JfYsQr8l4Pg2v6FM0Iap1/nz8uIWCUyBvUPO1SKArv50gAL/YVp/nSpIo9FM4apx9PUOHrgvOrx8rWCfhypd0s3sJPYLEd4SJN4qwuqW5mfZrUzPfui
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4452
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjggU2VwdGVtYmVy
IDIwMjAgMDg6MjYNCj4gVG86IExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWls
LmNvbT4NCj4gQ2M6IFByYWJoYWthciBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtbGFk
LnJqQGJwLnJlbmVzYXMuY29tPjsgTWFnbnVzIERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47
IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBEUkkgRGV2ZWxvcG1lbnQgPGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBMaW51eC1SZW5lc2FzIDxsaW51eC1yZW5l
c2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuDQo+IGxpc3Q6T1BFTiBGSVJNV0FSRSBBTkQg
RkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
Zz47IExLTUwgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Ow0KPiBMYXVyZW50IFBpbmNo
YXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjJdIEFSTTogZHRzOiByOGE3NzQyLWl3ZzIxZC1xNzogQWRkIExDRCBzdXBwb3J0DQo+
DQo+IEhpIFByYWJoYWthciwNCj4NCj4gT24gU3VuLCBTZXAgMjcsIDIwMjAgYXQgMTA6MDQgUE0g
TGF1cmVudCBQaW5jaGFydA0KPiA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3
cm90ZToNCj4gPiBPbiBTdW4sIFNlcCAyNywgMjAyMCBhdCAwMjowMTo1MFBNICswMTAwLCBMYWQs
IFByYWJoYWthciB3cm90ZToNCj4gPiA+IE9uIE1vbiwgQXVnIDI0LCAyMDIwIGF0IDE6NDggQU0g
TGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gPiA+ID4gT24gVGh1LCBBdWcgMTMsIDIwMjAgYXQg
MDM6MDA6NDFQTSArMDEwMCwgTGFkIFByYWJoYWthciB3cm90ZToNCj4gPiA+ID4gPiBUaGUgaXdn
MjFkIGNvbWVzIHdpdGggYSA3IiBjYXBhY2l0aXZlIHRvdWNoIHNjcmVlbiwgdGhlcmVmb3JlDQo+
ID4gPiA+ID4gYWRkIHN1cHBvcnQgZm9yIGl0Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBNYXJpYW4tQ3Jpc3RpYW4gUm90YXJpdSA8
bWFyaWFuLWNyaXN0aWFuLnJvdGFyaXUucmJAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+DQo+ID4g
PiA+IEV2ZXJ5dGhpbmcgc2VlbXMgdG8gbWF0Y2ggdGhlIHNjaGVtYXRpY3MgOi0pDQo+ID4gPiA+
DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiA+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gdjEt
PnYyDQo+ID4gPiA+ID4gKiBUaGlzIHBhdGNoIGlzIHBhcnQgb2Ygc2VyaWVzIFsxXSAocmVzdCBv
ZiB0aGUgcGF0Y2hlcyBoYXZlIGJlIGFjY2VwdGVkDQo+ID4gPiA+ID4gICBieSBHZWVydCBbMl0p
Lg0KPiA+ID4gPiA+ICogQWRkZWQgcmVndWxhdG9yIGZvciBsdmRzDQo+ID4gPiA+ID4gKiBBZGRl
ZCByZXNldCBwaW4gZm9yIHRvdWNocGFuZWwNCj4gPiA+ID4gPiAqIFRoaXMgcGF0Y2ggaXMgYmFz
ZWQgb24gc2VyaWVzIFszXQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yZW5lc2FzLXNvYy9saXN0Lw0KPiA+ID4gPiA+
ICAgICA/c2VyaWVzPTMzMDI3Nw0KPiA+ID4gPiA+IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9nZWVydC8NCj4gPiA+ID4gPiAgICAgcmVuZXNhcy1k
ZXZlbC5naXQvbG9nLz9oPXJlbmVzYXMtYXJtLWR0LWZvci12NS4xMA0KPiA+ID4gPiA+IFszXSBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmVuZXNhcy1zb2MvbGlz
dC8NCj4gPiA+ID4gPiAgICAgP3Nlcmllcz0zMzA5NTcNCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4g
PiAgYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc0Mi1pd2cyMWQtcTcuZHRzIHwgOTkgKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOTkgaW5zZXJ0aW9u
cygrKQ0KPiA+ID4NCj4gPiA+IFdvdWxkIHlvdSBiZSBxdWV1ZWluZyB0aGlzIHBhdGNoIGFsb25n
IHdpdGggRFJNIGRyaXZlciBwYXRjaGVzIGZvciB2NS4xMCA/DQo+ID4NCj4gPiBObywgSSBleHBl
Y3QgR2VlcnQgdG8gZG8gc28sIERUIHBhdGNoZXMgZ28gdGhyb3VnaCBoaXMgdHJlZS4gSSBoYW5k
bGUNCj4gPiB0aGUgZHJpdmVycyBhbmQgRFQgYmluZGluZ3MuDQo+DQo+IEluZGVlZC4NCj4NCj4g
QXMgdGhlIGRlcGVuZGVuY2llcyBhcmUgbm93IGluIGxpbnV4LW5leHQsIEknbSBxdWV1ZWluZyB0
aGlzIGluDQo+IHJlbmVzYXMtZGV2ZWwgZm9yIHY1LjExLCBhZnRlciBmaXhpbmcgYWxsIGNvbmZs
aWN0cyBkdWUgdG8gcmVjZW50DQo+IGFkZGl0aW9ucywgYW5kIHNvcnRpbmcgJmx2ZHMwIGJlZm9y
ZSAmcGZjLg0KPg0KVGhpcyBhbHNvIG5lZWRzIGNoYW5naW5nIHZjYy1zdXBwbHkgdG8gcG93ZXIt
c3VwcGx5IGZvciBsdmRzIHJlY2VpdmVyIGR1ZSB0byByZWNlbnQgYmluZGluZyBjaGFuZ2VzLCBw
cm9iYWJseSBJbGwgZG8gdGhlIGFib3ZlIGFuZCBwb3N0IGEgdjMuDQoNCkNoZWVycywNClByYWJo
YWthcg0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydA0KPg0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+DQo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmlj
cyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0c2Z1ZWhyZXIvUHJlc2lkZW50OiBDYXJzdGVuIEphdWNo
LCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVnaXN0ZXJlZCBvZmZpY2U6IER1ZXNzZWxkb3JmLCBB
cmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVlc3NlbGRvcmYsIEdlcm1hbnksIEhhbmRlbHNyZWdp
c3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVyOiBEdWVzc2VsZG9yZiwgSFJCIDM3MDggVVN0LUlETnIu
L1RheCBpZGVudGlmaWNhdGlvbiBuby46IERFIDExOTM1MzQwNiBXRUVFLVJlZy4tTnIuL1dFRUUg
cmVnLiBuby46IERFIDE0OTc4NjQ3DQo=
