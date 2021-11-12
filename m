Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503EC44E5C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 12:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234800AbhKLLyM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 06:54:12 -0500
Received: from mail-eopbgr1410105.outbound.protection.outlook.com ([40.107.141.105]:54080
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234766AbhKLLyM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 06:54:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoxxfxDAUH6k2qy8CBzf/yYEEfcnPyjTklngjmmtqaW/eepSW0Cp1Y+gy/aKjq+fQjwdebWBJm5uQoABVda2VqKb8RZyxyeDdf/40kjVvZ9QZbddXSxm6tWvC4gAPvis+absMO1XmC9C8JS0v0IuOCMxtMiyxGZWdQQG3VwYsRJBDaRdedjmUEquS8k1D8sBEqd+8SoiXZ0eZdQkRG/m9Zepn1YKkOXcdrqvrDJmJVCEuSQhsLWcNBANWpdqyuF5xCSDhqQNuBcQYKzPpO6pGD3jlbXfGbh3Z7b+qC5gPXVTvZqBLVzufOvUPf53E+C7sAmYiqqs9+o1CDU1/A8RgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzaZRD3fma2NlQs5YHqnzhhjBtv2cAlEsZGjkFCCXX0=;
 b=P+YJ06DZLMT6XUR/lgbGu+MnDp4n6CqyhYqdpQIKdwEmGgK3fsIk21ITlHnuSeYHdzDItN0h40iQqHYdpmctzcNKEz9Ot0b+MwXEIw5VstaWXscQIC7g2CPAKyU8RmqU5KfnlklJMlVnFVIqWOxLIfRyldryNjSYRAM/nlAPDD4d4BDfEE2b/VphdcnmLNtm9orJZygTeMu8a8ZOzp41qvWsUP2ACc6MZlG/uZhJ5NeYsktuusmmBbIeDC2RWS50NbcBtJn/616Z8G38cIzF0KLQd7w9bfH0fd+EnvpQm+Q+dlTtk4eAvj9MeY6qeTT7pc5AmHZBAdPdGuKZ/87xhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzaZRD3fma2NlQs5YHqnzhhjBtv2cAlEsZGjkFCCXX0=;
 b=ouTVjG+52azSJWCcYH9A3lAY7yUZXWCbMIEnhfGIFvIEWbTyPjDMWPR0ZyDp06S0Y0iPuxl7H7boCgeLmr+XJKtohYTCNbWq5RKCz9TMssA9DAIA1viY85opzxWan9tggo+tbjSQSQgKz3MppiHOKKxnIrxRbBKTj+EpL6A6xNM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB1878.jpnprd01.prod.outlook.com (2603:1096:603:1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 12 Nov
 2021 11:51:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4669.021; Fri, 12 Nov 2021
 11:51:18 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L
 bindings
Thread-Topic: [PATCH v4 2/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L
 bindings
Thread-Index: AQHX17ZrF1DZYi7F+0C6y+PD5m5DIqv/wGBA
Date:   Fri, 12 Nov 2021 11:51:18 +0000
Message-ID: <OS0PR01MB592293950203A80EEC7F883E86959@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210817090313.31858-1-biju.das.jz@bp.renesas.com>
 <20210817090313.31858-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVXpn7X3Tm_ouq6DVUDP4mxMO8EObFjtfEU4pX6sodo9A@mail.gmail.com>
In-Reply-To: <CAMuHMdVXpn7X3Tm_ouq6DVUDP4mxMO8EObFjtfEU4pX6sodo9A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e8ada79-8d8b-41a6-4e38-08d9a5d2bd03
x-ms-traffictypediagnostic: OSBPR01MB1878:
x-microsoft-antispam-prvs: <OSBPR01MB1878389575D5D1AA5E9E3C9F86959@OSBPR01MB1878.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p4jK84NMO8P4b9R1yABN9RfL/9jY6GTlLn//a2l1c7jWCCY/kDu6PE4371CKfBzKIiE/jU05YVxfV5Lekceo5TK6BkxNzKW1QARHA8GqJrwoEMqT9fwOPpr3MzPwzc0keIy6n8SVTqera0D/rDJB3g68hWq2dzGyQdhrL3m6G0FVtKHqxojk0cEFOyVGiftDeNEOV5OC5C8fmDwm1YwwJwSANXWME95AwVRrL/CpDosCE+UUVnf+QPc9Oq5rbT847qUu15xuzQbtPVzlYBhjliVm8hqi2ZaQCce0XyrqOv5VSrYRM7TAeTsHQRXf8Rd5J2mI3hIWMbTN0H75tKM+0yCC0pHZGVp2ZC6Tf5xsMFiwGY9KmVwRse0Yykor7wEGXam4xy3QcD++qTFBBzIvctNQ9/gmchEAyk1PPfK05A6V7ZFk1cbG0ITXR45XaPAqobO35meTymS9zYFDBA31DQ/NUG578BOR2b41QaMUnd8oD9kaQHTlMpfNQpIAZ1Gs5XLrQWeu9iYsigUnhvbmeW1nd62SNQgHg5Q7joWqnnEfubLiGdDM02zdhegGWzKL0YEy/FZWOpm7J8lbACKqwdLDLPOcOFwNzcmUyuQKXcnx60RUdPmeWd8X8uYske7HAZ+fb3XT3DzKe0PODIVXioLUygEEAyGWYio+mG5Bb+OGLlOAMvG6RJWV3Kc70yxinOH3+Aeh+hOd2TCuD9hZPTm0lWwayb33I3EriHGlsCDYvpigGTqpik3HpcxqOglJ8U6QnKAxI1vzXnGRSA9gEllqkwV842T3gk1E1hgHAmk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(4326008)(6506007)(54906003)(83380400001)(316002)(186003)(966005)(33656002)(86362001)(71200400001)(8936002)(5660300002)(508600001)(8676002)(6916009)(122000001)(9686003)(55016002)(66556008)(66446008)(7696005)(64756008)(52536014)(66476007)(76116006)(66946007)(38070700005)(2906002)(38100700002)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGl0ZHhzTFdINXMxcTRReS8vdFU1ZlYwNHpZaDVCNUpXOXVhbU9VRkRRc3NU?=
 =?utf-8?B?SENUQk5mODBJVUswTTJGY21Jd2NUK1VWa2t3K3MvNWVzU21rQmNpYzNWS2Rl?=
 =?utf-8?B?TTZvYllJdENYbFVTUXNtdTMyRUlmRXF6emdoS1ltdStiSG51c1kvaEpNbUo4?=
 =?utf-8?B?d1pjcW83eWh4SWppZGI1VXZaV1FaVlFSc2pXSmdFdWhmekJzVE5LYy9kZGZh?=
 =?utf-8?B?aG01YVJ1eXBUaWprSXRCaW9maEJseTZzM3YzNjBrdjQ2WHBlVFkvWHFpZXZ0?=
 =?utf-8?B?QzhUTWhkWnZLNWNIRU9HbU85b0V4T2FIN3B4NmlJUW12WU8wZ1NBMkgyNWU5?=
 =?utf-8?B?WmRuSkY0Y0JhZDJyTkt5a05wZXRBYjhnb1A1SndabjRzb2pzWjFZRW1NT0hm?=
 =?utf-8?B?ckt6SlV3b3J3Z0xDMStpelNzZWxRRVpJMXJ0SlgrdkZjS21jck8wZ3F3eHdk?=
 =?utf-8?B?dThTZWZycDhyVk1Ja2tremNqd3RtcVkvSnBoZ1BFWlpRN2xDVWkwNHRrb2xj?=
 =?utf-8?B?c0tPSDNYOXJYcWdPci92bDViTGRmbmRJK09VMnZ1aENFNE1aSHFSSDUvYkVY?=
 =?utf-8?B?a2ZXRUVsc0ZUK1F1RDhUdWd3ZkUyQmhBakRyZjUzTXpiYXZ2eXVNVm5BZ2ZS?=
 =?utf-8?B?bW5ZZ05CZjFId0dCcGFwRktVQkpvTW5OeDc0S0JXaWtVbTJkT1FVanRLdmx5?=
 =?utf-8?B?WGU2Vlh4Y3VGWS82ZEh3eVZFd2g2OWdhdUFEQ1FtdWVBdGdTS2gvbW8yUGlt?=
 =?utf-8?B?U2gzNmtqUFBmU1pROHBSRkUvT0xHZGp1VHpBT2RUalBKR1I0MEk0aEJVTGU1?=
 =?utf-8?B?UkZjSnVmZk1RODhUT0x6V3hweGU0Nkd5VUJBY1RUVDJ4K2tnKzlXWklQTDR2?=
 =?utf-8?B?MXVPK1BIWXMvcnFwWHZaSlJhV2dNVWFCVFduUjZubkJOS1ZhVkpjMkNHWDky?=
 =?utf-8?B?c0M4TllwMGpobFREdzVoUlhIK1Njek1QNklvTFZKekJ0RkwwSDJMMllteGh0?=
 =?utf-8?B?cmFvOXZDcUZmT1lzb0w4ejkreTQ4bU5lMTR5NFhzN1dKeGQrL3V2akd1R1Ix?=
 =?utf-8?B?ZVhsY1pyL2hmOVh4U1B5SjJZVU5qeDRlc0dKcktkNGJEa2RGZFRMWlM2U1pU?=
 =?utf-8?B?UGQrRjRxZ0hSRzVrcmJSR0hoL0lBSTVTbGNGa21QL3c5b1BkancwWEY1eHRl?=
 =?utf-8?B?UldDSkJPRHhiZkFLK1J3YTZCRFhNRWoybG84bWhOdlZUUGExSGYrUWhZY1BZ?=
 =?utf-8?B?ZWhDM3h6bGE3SXp5VElMWjRuYkhBODdDUnVrV0xSbEUxbkJHT2VYSXVtVlJK?=
 =?utf-8?B?UXJYNHdqUDMwQW8ySnJGN1VlVm04bGF2MmtXSjk0dGlrQkFwMVlRQVE0ZmdC?=
 =?utf-8?B?dURQNHNSTDNXZGxqM0I5STJiVTlYUGExQ2ZwZE1jUU1mUWJ3QzdNaHdxdExG?=
 =?utf-8?B?RTc3U1dmTHlGa1NrS0VzRlpwakkvb3RvaGUzdjhYUHNqekpCTWFHN2p0M0Z1?=
 =?utf-8?B?dEhpTG1xT1NXYllxeG9yV2pHeko3NDBEbXRoS2J2OFE3bU1WcHd1MTlRZ3NQ?=
 =?utf-8?B?TDZZRTlEUHVTSmJ1a3pQdEJzNDhXajNrUGFjMW5jNWtsMzBNVUJXTmNuN0tr?=
 =?utf-8?B?V1pJRmZTR2dHdU9yRHBzcVgrVC9rMEowUUs0cHlFT0Q4aUhTZTZUTGUrVFpv?=
 =?utf-8?B?cjlQblN5Q3ZMYUU0cW5HY05DUE1uZUxZQUFzRzlhMkI1aVN4V29hWkc1VnRj?=
 =?utf-8?B?U3IwWXM3L2luV255dFlOQ251SEMrRzBMY1ovMFludnRFbHIwZ0ZnbDRHYThO?=
 =?utf-8?B?a0ljN21CT0FhckcxWGNRdnZBZ1BES3N2ODBWRHhMY3Rkdll4QmtBNFJOZmlT?=
 =?utf-8?B?ZGsxN2t1SDcyc1F4MHFTVk1qL3hFa0x3ZzlnWkd5N0hWdE9vd2s3dHJYQkVp?=
 =?utf-8?B?UXhWb1lkcjFkaHltOGY3M3Z4cUZjY2g4Tm1TTk9hSGx0b3lHc1FOQWg5QWhI?=
 =?utf-8?B?NXdXSk9vdVN4cHJSU3dMaVlHL0E2SE56ZUxlbTh5Q25tRkRxemR1dHBrQlJw?=
 =?utf-8?B?TEEyUWtQRHhQUFEySWQvTUF0UDBmWGl2Y2JnWE1CQzFSakZ0eGwwYmlxV2pR?=
 =?utf-8?B?Rjc1bzRlZDJWZFRxbnA3MUZKczBVWFU1MU1QNzc5U0ZtSDdacHdQbUl1VFRC?=
 =?utf-8?B?bUNSeFFVbHJoWGJDRHR3N0RmRmx4bkNFaUthMm1TNVpmcmpiYWZ4U25sRG1t?=
 =?utf-8?B?Sm80VzZTL0JUU0J5RFhsaXBHejVnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8ada79-8d8b-41a6-4e38-08d9a5d2bd03
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2021 11:51:18.0758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8EKfRUZ2dpaTp07MzhorGCkO7pehoW7Lr9fRYmKHBfK1OkNwBU/hJi4M/FFLANBLJ5MkYo6rPIYk4RVKgXZM3fqkczEJikIHe0NM7dc+/zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1878
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAyLzJdIGR0LWJpbmRpbmdzOiBt
bWM6IHJlbmVzYXMsc2RoaTogRG9jdW1lbnQNCj4gUlovRzJMIGJpbmRpbmdzDQo+IA0KPiBIaSBC
aWp1LA0KPiANCj4gT24gVHVlLCBBdWcgMTcsIDIwMjEgYXQgMTE6MDMgQU0gQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBEb2N1bWVudCBSWi9HMkwg
U0RISSBjb250cm9sbGVyIGJpbmRpbmdzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJh
Ymhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBU
aGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgYmZhZGVlNDU1NGMzNzgy
Yg0KPiAoImR0LWJpbmRpbmdzOiBtbWM6IHJlbmVzYXMsc2RoaTogRG9jdW1lbnQgUlovRzJMIGJp
bmRpbmdzIikgaW4gdjUuMTUuDQo+IA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tbWMvcmVuZXNhcyxzZGhpLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3JlbmVzYXMsc2RoaS55YW1sDQo+ID4gQEAgLTQ0LDE5
ICs0NCwyMCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxz
ZGhpLW1tYy1yOGE3NzQ3MCAjIFJaL0cxQyAoU0RISS9NTUMgSVApDQo+ID4gICAgICAgIC0gaXRl
bXM6DQo+ID4gICAgICAgICAgICAtIGVudW06DQo+ID4gLSAgICAgICAgICAgICAgLSByZW5lc2Fz
LHNkaGktcjhhNzc0YTEgIyBSWi9HMk0NCj4gPiAtICAgICAgICAgICAgICAtIHJlbmVzYXMsc2Ro
aS1yOGE3NzRiMSAjIFJaL0cyTg0KPiA+IC0gICAgICAgICAgICAgIC0gcmVuZXNhcyxzZGhpLXI4
YTc3NGMwICMgUlovRzJFDQo+ID4gLSAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc0
ZTEgIyBSWi9HMkgNCj4gPiAtICAgICAgICAgICAgICAtIHJlbmVzYXMsc2RoaS1yOGE3Nzk1ICAj
IFItQ2FyIEgzDQo+ID4gLSAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc5NiAgIyBS
LUNhciBNMy1XDQo+ID4gLSAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc5NjEgIyBS
LUNhciBNMy1XKw0KPiA+IC0gICAgICAgICAgICAgIC0gcmVuZXNhcyxzZGhpLXI4YTc3OTY1ICMg
Ui1DYXIgTTMtTg0KPiA+IC0gICAgICAgICAgICAgIC0gcmVuZXNhcyxzZGhpLXI4YTc3OTcwICMg
Ui1DYXIgVjNNDQo+ID4gLSAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc5ODAgIyBS
LUNhciBWM0gNCj4gPiAtICAgICAgICAgICAgICAtIHJlbmVzYXMsc2RoaS1yOGE3Nzk5MCAjIFIt
Q2FyIEUzDQo+ID4gLSAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc5OTUgIyBSLUNh
ciBEMw0KPiA+IC0gICAgICAgICAgICAgIC0gcmVuZXNhcyxzZGhpLXI4YTc3OWEwICMgUi1DYXIg
VjNVDQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc0YTEgICMgUlovRzJN
DQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc0YjEgICMgUlovRzJODQo+
ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc0YzAgICMgUlovRzJFDQo+ID4g
KyAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc0ZTEgICMgUlovRzJIDQo+ID4gKyAg
ICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc5NSAgICMgUi1DYXIgSDMNCj4gPiArICAg
ICAgICAgICAgICAtIHJlbmVzYXMsc2RoaS1yOGE3Nzk2ICAgIyBSLUNhciBNMy1XDQo+ID4gKyAg
ICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc5NjEgICMgUi1DYXIgTTMtVysNCj4gPiAr
ICAgICAgICAgICAgICAtIHJlbmVzYXMsc2RoaS1yOGE3Nzk2NSAgIyBSLUNhciBNMy1ODQo+ID4g
KyAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc5NzAgICMgUi1DYXIgVjNNDQo+ID4g
KyAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc5ODAgICMgUi1DYXIgVjNIDQo+ID4g
KyAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc5OTAgICMgUi1DYXIgRTMNCj4gPiAr
ICAgICAgICAgICAgICAtIHJlbmVzYXMsc2RoaS1yOGE3Nzk5NSAgIyBSLUNhciBEMw0KPiA+ICsg
ICAgICAgICAgICAgIC0gcmVuZXNhcyxzZGhpLXI4YTc3OWEwICAjIFItQ2FyIFYzVQ0KPiA+ICsg
ICAgICAgICAgICAgIC0gcmVuZXNhcyxzZGhpLXI5YTA3ZzA0NCAjIFJaL0cye0wsTEN9DQo+ID4g
ICAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHJjYXItZ2VuMy1zZGhpICMgUi1DYXIgR2VuMyBv
ciBSWi9HMg0KPiANCj4gSSBkb24ndCB0aGluayBTREhJIG9uIFJaL0cyTCBpcyBmdWxseSBjb21w
YXRpYmxlIHdpdGggU0RISSBvbiBSLUNhcg0KPiBHZW4zLi4uDQoNCkl0IGlzIGlzIHNhbWUgSVAs
IGl0IGhhcyAyIG1haW4gY2xrKGNvcmUgY2xvY2tzKSwgMSBoaWdoIHNwZWVkIGNsb2NrIGFuZCAx
IGJ1cyBjbG9jay4NCkNvcmUgY2xvY2tzIGFyZSBzYW1lIHJ1bm5pbmcgYXQgMTMzTUh6LCBIaWdo
IHNwZWVkIGNsb2NrIGlzIGF0IDUzMyBNSHooMTMzIHg0KSBhbmQgYnVzIGNsb2NrIA0KQXQgMjAw
TUh6Lg0KDQo+IA0KPiA+DQo+ID4gICAgcmVnOg0KPiA+IEBAIC02NiwxNSArNjcsOSBAQCBwcm9w
ZXJ0aWVzOg0KPiA+ICAgICAgbWluSXRlbXM6IDENCj4gPiAgICAgIG1heEl0ZW1zOiAzDQo+ID4N
Cj4gPiAtICBjbG9ja3M6DQo+ID4gLSAgICBtaW5JdGVtczogMQ0KPiA+IC0gICAgbWF4SXRlbXM6
IDINCj4gPiArICBjbG9ja3M6IHRydWUNCj4gPg0KPiA+IC0gIGNsb2NrLW5hbWVzOg0KPiA+IC0g
ICAgbWluSXRlbXM6IDENCj4gPiAtICAgIGl0ZW1zOg0KPiA+IC0gICAgICAtIGNvbnN0OiBjb3Jl
DQo+ID4gLSAgICAgIC0gY29uc3Q6IGNkDQo+ID4gKyAgY2xvY2stbmFtZXM6IHRydWUNCj4gPg0K
PiA+ICAgIGRtYXM6DQo+ID4gICAgICBtaW5JdGVtczogNA0KPiA+IEBAIC0xMDgsNiArMTAzLDQy
IEBAIHByb3BlcnRpZXM6DQo+ID4gIGFsbE9mOg0KPiA+ICAgIC0gJHJlZjogIm1tYy1jb250cm9s
bGVyLnlhbWwiDQo+ID4NCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+
ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoNCj4gPiArICAg
ICAgICAgICAgY29uc3Q6IHJlbmVzYXMsc2RoaS1yOWEwN2cwNDQNCj4gPiArICAgIHRoZW46DQo+
ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY2xvY2tzOg0KPiA+ICsgICAgICAg
ICAgaXRlbXM6DQo+ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IElNQ0xLLCBTREhJIGNo
YW5uZWwgbWFpbiBjbG9jazEuDQo+ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IElNQ0xL
MiwgU0RISSBjaGFubmVsIG1haW4gY2xvY2syLiBXaGVuIHRoaXMNCj4gY2xvY2sgaXMNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdHVybmVkIG9mZiwgZXh0ZXJuYWwgU0QgY2FyZCBk
ZXRlY3Rpb24NCj4gY2Fubm90IGJlDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGRl
dGVjdGVkLg0KPiA+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBDTEtfSFMsIFNESEkgY2hh
bm5lbCBIaWdoIHNwZWVkIGNsb2NrIHdoaWNoDQo+IG9wZXJhdGVzDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDQgdGltZXMgdGhhdCBvZiBTREhJIGNoYW5uZWwgbWFpbiBjbG9jazEu
DQo+ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IEFDTEssIFNESEkgY2hhbm5lbCBidXMg
Y2xvY2suDQo+ID4gKyAgICAgICAgY2xvY2stbmFtZXM6DQo+ID4gKyAgICAgICAgICBpdGVtczoN
Cj4gPiArICAgICAgICAgICAgLSBjb25zdDogaW1jbGsNCj4gPiArICAgICAgICAgICAgLSBjb25z
dDogaW1jbGsyDQo+ID4gKyAgICAgICAgICAgIC0gY29uc3Q6IGNsa19ocw0KPiA+ICsgICAgICAg
ICAgICAtIGNvbnN0OiBhY2xrDQo+ID4gKyAgICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAgIC0g
Y2xvY2stbmFtZXMNCj4gPiArICAgICAgICAtIHJlc2V0cw0KPiA+ICsgICAgZWxzZToNCj4gPiAr
ICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjbG9ja3M6DQo+ID4gKyAgICAgICAgICBt
aW5JdGVtczogMQ0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDINCj4gPiArICAgICAgICBjbG9j
ay1uYW1lczoNCj4gPiArICAgICAgICAgIG1pbkl0ZW1zOiAxDQo+ID4gKyAgICAgICAgICBpdGVt
czoNCj4gPiArICAgICAgICAgICAgLSBjb25zdDogY29yZQ0KPiA+ICsgICAgICAgICAgICAtIGNv
bnN0OiBjZA0KPiA+ICsNCj4gPiAgICAtIGlmOg0KPiA+ICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+
ICAgICAgICAgIGNvbXBhdGlibGU6DQo+IA0KPiAuLi4gYXMgdGhlIGNsb2NrIGhhbmRsaW5nIGlz
IGNvbXBsZXRlbHkgZGlmZmVyZW50Lg0KPiANCj4gRG9lcyB0aGlzIGFjdHVhbGx5IHdvcmsgd2l0
aCB0aGUgY3VycmVudCBMaW51eCBTREhJIGRyaXZlcj8gSG93IGFyZSB0aGUNCj4gZXh0cmEgY2xv
Y2tzIGhhbmRsZWQ/DQoNClllcywgaXQgd29ya3MuIEV4dHJhIGNsb2NrcyBhcmUgYnkgUE0gZnJh
bWV3b3JrLiBXZSBhZGRlZCBtdXRsaS1jbG9jayBoYW5kbGluZ1sxXSBpbiBjbG9jayBQTS4NCg0K
WzFdOi0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYz9oPXY1
LjE1I241ODUNCg0KRmlyc3QgY2xvY2sgaXMgY29yZS1jbGtbMl0sIHNvIGl0IGdldHMgcmF0ZS4N
Cg0KWzJdaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5j
P2g9djUuMTUjbjkwNg0KDQpJIG5lZWQgdG8gYXBwbHkgdGhlIGxhdGVzdCBwYXRjaCBzZXJpZXMg
ZnJvbSBXb2xmcmFtIHRvIGNoZWNrLCB0aGUgaW50cm9kdWN0aW9uIG9mIFNESCBjbG9jayBicmVh
a3MgYW55dGhpbmcgb24NClJaL0cyTC4NCg0KUmVnYXJkcywNCmJpanUNCg0KPiANCj4gR3J7b2V0
amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4g
LS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0K
PiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
