Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 919B04A9828
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 12:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240152AbiBDLEx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 06:04:53 -0500
Received: from mail-tycjpn01on2138.outbound.protection.outlook.com ([40.107.114.138]:36418
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236450AbiBDLEx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 06:04:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvTapGLcAatPSfJ8s965gdtCDyWXb/3o4aT1mBWVWiDolqS2DeacCXzCIbWQcQTqnRTsoxrg37LHLsllRGTf+eIE7IecHCkxUZlmJ08cu4yLq7l+ihWnw7cnbfc/f2NcvxVS2HpgpIJ83p/qhJ9va9cR3tPNauMPaVbXNOHGCXPemeNG6lLSinIVXMRMzNB+5cRyiyC47rJtliJ3czg2oAUFhbPC+YCrsBv7NVlkwrDKTd2pWUh5E5PXiUhdbTv+OME8wFUYwL+iprrzxmB/7N6E33PiueS/aRtbYiFpH8PLKTSPhfEaUl1dfnoYB0wE9A6wNxk7V+o7ny/PM2uavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ij1z8cdxs35EjhJ3tSKYYewY2HYuch5oaehkLQo+F9Y=;
 b=az/2uLe+MlTLXrneHN1YeQhgCsAmeHvcucEGDWykVaAsiRulnPXGwB+y1/mi52x5pQHRkeEylFIQI4LChJx3fiEqAqb/8yVzKJxpwnU6pslO9DFKdj60h3lKGg7dAyreuJBLmaUwQ2/uFBxVM+J3wNimsWBZRWH5zFNLjxklrH1EznBVdER09HY5tv+H9/gdzgPkrFqCChqv8CtDa3BBd3YxklnSgrIa3M2W8Xg0mhneP3VFKulPxTrr3MdO9SvENfZZ+GG6SLLnK97SX+cLHGGHS6wmYZI3FFIzcgAlkPtnlUcyT+6IocjItjuPs1ASTfscxN6BjaOxT7MXZPZnPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij1z8cdxs35EjhJ3tSKYYewY2HYuch5oaehkLQo+F9Y=;
 b=kXRCVo1DGZsQY2JJP0kVpMGe9ua26mRr9zJvt6IOE9HGexko5uJWe4Ji99F9Sh6zdUp2mFEOnQ+YKnVeoz4cNiRpVh/ZLx3cx/elI0ri4jgM3NrjFQO9D5lJuizwgmXbFZc2ArIx4GFCPgQU97EI33esvccxRo3QWCx5hx3rZDQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB5061.jpnprd01.prod.outlook.com (2603:1096:604:75::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 11:04:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%8]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 11:04:51 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 2/4] arm64: dts: renesas: rzg2lc-smarc: Add macros for
 DIP-Switch settings
Thread-Topic: [PATCH v3 2/4] arm64: dts: renesas: rzg2lc-smarc: Add macros for
 DIP-Switch settings
Thread-Index: AQHYGSBurZKgi1/kdUGDAgyxiLwheKyDOliAgAABEuA=
Date:   Fri, 4 Feb 2022 11:04:51 +0000
Message-ID: <OS0PR01MB5922E6B541A80B57C5CD019186299@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220203170636.7747-1-biju.das.jz@bp.renesas.com>
 <20220203170636.7747-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWV0dwgRoq=X7bKy230AU1O7QuuaHkv82+eeJQf38154w@mail.gmail.com>
In-Reply-To: <CAMuHMdWV0dwgRoq=X7bKy230AU1O7QuuaHkv82+eeJQf38154w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d492d583-265a-4d58-d878-08d9e7ce2a75
x-ms-traffictypediagnostic: OSBPR01MB5061:EE_
x-microsoft-antispam-prvs: <OSBPR01MB5061E8A75C84825902F3F23086299@OSBPR01MB5061.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J/zEutdX1h7CxRLkHalkEedAEkKlwInUvDsNg3ZTuga1yGiw+1WiOih9lTdKTjhud5K6y3NUcAzwJ9Ha571Q12AHXDSWpeDOVMIo0v2uaGw9Xsv3SVM90VVoPVEGutmWYpeQODeFbVzAwxjySzrx9f4xX4rypzrc0Wc+2kwzhPgAGTKZGBAewIDCHqgMjeQGnIXU8KmmwJpvhfT69IW4hiXV7IA2Zeu6oVy9RJPVN8xI+kg+U1K2tb+7Ul49m4DAAtQQlR70gKd2Acw1L8rr2knJ6Ybcu5auUS2jnccA1sZ+8XeLYsfp0ZqrcwTdKC5WHchF7wVfUOd3Lyeqb/NsVZrGGLzLO61P2tvOI1B1KMycZ1kSjCj6VB+FHKEnqAZssYqy4Q6OXEOgc5yxMmKy0aVkIShAKX8jymkjtihPkPhF8/4q1SeQLDBTnbi7uqeT51hrGKIwhWWJ5qCG3m/RpM/W0aJscTjXVzx+WxPUBPQNwtLxvcjuHPidMCMKr+yzi8tTBKFXDg6SiFRoz+fOUHu9LltTAEBivJgYYdcAHNq5GDce4E4voL6nz2+eF4m5b4J7liS4EwWJ5hg+6EVpX/wyJou8T9x6XfzHZERLJIgFGLzvRa1Fl2VX4pn7aRBxOlcteghyxTx0gZYNyeRCjECFiVGQYkgfkMI2VVGvYURY0x8RuiVM9pK4YHaknlkeqWZXrXfJHpVnJdSXsg0XeA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(53546011)(55016003)(66946007)(9686003)(2906002)(122000001)(6506007)(8676002)(7696005)(38070700005)(86362001)(76116006)(52536014)(6916009)(38100700002)(107886003)(508600001)(316002)(26005)(33656002)(54906003)(186003)(64756008)(66556008)(66476007)(66446008)(71200400001)(4326008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3BCLzdFSWlCVTlzMVRVbGF1K0FZWU5hemgvQjJhem0yTVNQNFJtVUdmYjVq?=
 =?utf-8?B?ZkYvRlQ0VXpBcjRxOFBDRm5MQW41VWhlT2ViWVZUbFJoTnRkSTRjOW84R1cz?=
 =?utf-8?B?b1Mvb0xKU21nN2VHdlJNekJRU2pVZlN4Vk9NQkZvOVNmbWNEa04rZzRaQkl6?=
 =?utf-8?B?RDUxb3RhZXhldDB3bEtlcGFNYXp4UWtMMWpPalFEVFcrcVBrRCtTYVZmZzFC?=
 =?utf-8?B?V21IRDhaTU5CQTBlWk9zTVFETE9JZjE5d3BkWlAzUjA5OXNSc3F5RG9RTGZY?=
 =?utf-8?B?blN6b05UY0VCd3g2bnJlcGVsZGkvVXBJU3cxaXZqVGV4QVZ1VVlrSFFZczZj?=
 =?utf-8?B?cXZlSVo3OHo3czBXSzA3MmNUT1BvV284N25sVmoyUTNGU0xPZldtbmxOQW9o?=
 =?utf-8?B?R2QwYTNjNWMyUDh2S1NUWjlBajFSL3JCZEFoZnRnaVZEUXloYm9qWGIrenkv?=
 =?utf-8?B?dkNGT2tTRnZ6bUJSY1hVSzlMQ1VEK2J2Tkh5WFk5WHpZYzNRaElnMjhzSWpU?=
 =?utf-8?B?Vlk0eS8wY2ZNMFdrWkZrVUFlVlRWMUJncisrZVFqSHo1SVAyb3RtWU9IbDFy?=
 =?utf-8?B?TzVmbkpDRitsR2JJR0s4ZXEvUHF2eTh5YVJ6Tmk0MkZoQmpDUTh0R09FWE1l?=
 =?utf-8?B?R0hGMzBkRjZTZlZ3U0VjSmpOeTJnckgwSzVEVGl6bDlxOHJBMWFwamVvVU1X?=
 =?utf-8?B?MXVWN3NtbEtPdDhyYmQ5TjYwamJXVFM2OFBFekxsbkMvQTJic3lyZlloN0JW?=
 =?utf-8?B?YUluS2hlN09oT2NNM0R5R21EZFJHNExrMlNMeWlZTU1HSmszZi9nZ3NKZUVJ?=
 =?utf-8?B?bVZoV1Y2S1lNTURiVFgwYlp1ak9VYUZQdVFhS0lmQmlNL0kxdUloYmo5aGRG?=
 =?utf-8?B?ck5Iby9sWVdFSnU1Q1hSdHQxMFZGUGtTOWlDUE5NcWhhM1hrLzJyZjh3YkZX?=
 =?utf-8?B?NTlVcTcrYmJ6ZUJ5OHJUd0QxZWV0UVFGWkpRK08xQ2VtYURpL1VsZGJiMWFI?=
 =?utf-8?B?eWNGQnZzTFFKVnZudXY5TGljQVlab1RTTEltT0JiUk9yN2QvbVpmdE1HK2Rm?=
 =?utf-8?B?OWdCNkVmUUovWmlWeGhTSTkwNmIxS0dkTnRUTVRmMFB4VXVzazU4UG9DVkJy?=
 =?utf-8?B?SXkvZ20vckJ2T2VweURXdnVrYitXSzM1M0owZjVYbFZKVURsSjBvMW40WUtD?=
 =?utf-8?B?L0Y1UXVDK0ZIVWFLRnZkZHlpSzUyY2hKaWxCK3Qzd1lVbFNZMW14alZlcWZB?=
 =?utf-8?B?eG9GVk8wRTgvaTFTVnpRVFZjTG1haXNIK3ZrYUNZc1pDNTZjYWdvNGN6a29L?=
 =?utf-8?B?YWV6UnRpR3BXbUhobnB2OGtRaUdLa2lkbEIxa3JTYWdHWC94d3JRbnBQMDlV?=
 =?utf-8?B?MXl0K3AvMHFhVGZCN3BIbGJnc3lEWnFEdkNMMUgxNVlBOVVQY01NUHFkTmdm?=
 =?utf-8?B?SEREaFF6NUJ0ZTloVk04MHZZUUpoYmk2VW5oM1VzV2QzY2FUTjhNY1V1VGNz?=
 =?utf-8?B?cjEzaGZKT3B2dUtnN1FnaGlOUFpYYVFLLzJCeExNZHhlb1BDZVdLelFFZmh2?=
 =?utf-8?B?NmVkdHgyT1R4MXU0d25SZ1ZUL2VXYlFOTEMzNVBuOFFwdUFERXdERnpXcUxZ?=
 =?utf-8?B?WWYrM3E1MEtBNFN5azhZOEFHQ2tsQTRzbE9MSlhPb2RRc2IrN3ZvdDZLajA0?=
 =?utf-8?B?VjBqTzcrWXJiTmlUQldpTUQxTmVudTZEUFZOZUk5aXVkWkU0M1hDRVlZSGdW?=
 =?utf-8?B?Mzc5bEZpRWF6WWt2N3NRZHEyZUhmY1FWbXBxcW5XUTlBbTQycXdTUmtQL0xm?=
 =?utf-8?B?bWxxWkxqY21qbmNQaDN3Y1VtQTlCMTB5Y1RmYlRhdTdPQXEvdjlIVkN2b2dN?=
 =?utf-8?B?cG5lVmhjc3JhcG9qazlkTTI2KzdKTWtWT01UUG03cGdDMVVYdEJRVlRIZFd1?=
 =?utf-8?B?S0pvT2JSNEpqUWIwT3h2WUhvVElWMGZRVW15c21vRmlHUVFGL1RZbGJHRngv?=
 =?utf-8?B?aFY1L3czMmpHcFZab1BzOStpNnpZSUZhazU2a1ZxODhGZ0daWGtidGpHMEU4?=
 =?utf-8?B?NUhCM2hqOU9UU1ByQXp2bXBLSTBMdmc0dHNKdi9YOWtCVEJ2MEF5dU50ZlNz?=
 =?utf-8?B?NFo2eEI4bWdxNXc5NUZuaUJOOVF4aVlib0NndGFiN1RNQkgvaUpxazU5b1E2?=
 =?utf-8?B?MHYrNlU4UVgvbHU0WHRpSXQyV2pEZFRCR2dOY0NsMlRpSmpWWHlhazl2c0c1?=
 =?utf-8?B?M0Q1bEcwbFBkamdPb1BzaWVjOG1RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d492d583-265a-4d58-d878-08d9e7ce2a75
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 11:04:51.0656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7eP181RKXMZtKJeqBVa9Te4/1r+V+i/iKJJ22qn2oJG/3v62PMpKrbBKzgcoVIO+JwBXPkr13G022XAHNbLZPQRAvS7NviCf+u7I/wyOUpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5061
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMi80XSBhcm02NDogZHRzOiByZW5lc2FzOiByemcybGMtc21hcmM6IEFkZCBtYWNy
b3MNCj4gZm9yIERJUC1Td2l0Y2ggc2V0dGluZ3MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBU
aHUsIEZlYiAzLCAyMDIyIGF0IDY6MDYgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiB3cm90ZToNCj4gPiBSWi9HMkxDIFNvTSB1c2VzIERJUC1TV2l0Y2ggU1cxIGZv
ciB2YXJpb3VzIHBpbiBtdWx0aXBsZXhpbmcgZnVuY3Rpb25zLg0KPiA+DQo+ID4gVGhpcyBwYXRj
aCBkZXNjcmliZXMgRElQLVNXaXRjaCBTVzEgc2V0dGluZ3Mgb24gU29NIGFuZCBhZGRzIHRoZQ0K
PiA+IGNvcnJlc3BvbmRpbmcgbWFjcm9zIGZvciBlbmFibGluZyBwaW5tdXggZnVuY3Rpb25hbGl0
eSBvbiBSWi9HMkxDDQo+ID4gU01BUkMgRVZLLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYWQg
UHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0K
PiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT4gaS5lLiB3aWxsIHF1ZXVlDQo+IGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY1LjE4Lg0KPiANCj4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6
ZzJsYy1zbWFyYy5kdHNpDQo+ID4gQEAgLTAsMCArMSwzNiBAQA0KPiA+ICsvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKy8qDQo+
ID4gKyAqIERldmljZSBUcmVlIFNvdXJjZSBmb3IgdGhlIFJaL0cyTEMgU01BUkMgRVZLIHBhcnRz
DQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMiBSZW5lc2FzIEVsZWN0cm9uaWNz
IENvcnAuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8v
Z3Bpby5oPg0KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9yemcybC1waW5jdHJs
Lmg+DQo+ID4gKw0KPiA+ICsvKg0KPiA+ICsgKiBESVAtU3dpdGNoIFNXMSBzZXR0aW5nIG9uIFNv
TQ0KPiA+ICsgKiAxIDogSGlnaDsgMDogTG93DQo+ID4gKyAqIFNXMS0yIDogU1dfU0QwX0RFVl9T
RUwgICAgICAoMTogZU1NQzsgMDogdVNEKQ0KPiA+ICsgKiBTVzEtMyA6IFNXX1NDSUZfQ0FOICAg
ICAgICAgKDE6IENBTjE7IDA6IFNDSUYxKQ0KPiA+ICsgKiBTVzEtNCA6IFNXX1JTUElfQ0FOICAg
ICAgICAgKDE6IENBTjE7IDA6IFJTUEkxKQ0KPiA+ICsgKiBTVzEtNSA6IFNXX0kyUzBfSTJTMSAg
ICAgICAgICAgICAgICAoMTogSTJTMiAoSERNSSBhdWRpbyk7IDA6IEkyUzApDQo+ID4gKyAqIFBs
ZWFzZSBjaGFuZ2UgYmVsb3cgbWFjcm9zIGFjY29yZGluZyB0byBTVzEgc2V0dGluZyAgKi8NCj4g
PiArDQo+ID4gKyNkZWZpbmUgU1dfU0NJRl9DQU4gICAgMA0KPiA+ICsjaWYgKFNXX1NDSUZfQ0FO
KQ0KPiA+ICsvKiBEdWUgdG8gSFcgcm91dGluZywgU1dfUlNQSV9DQU4gaXMgYWx3YXlzIDAgd2hl
biBTV19TQ0lGX0NBTiBpcyBzZXQNCj4gdG8gMSAqLw0KPiA+ICsjZGVmaW5lIFNXX1JTUElfQ0FO
ICAgIDANCj4gPiArI2Vsc2UNCj4gPiArLyogUGxlYXNlIHNldCBTV19SU1BJX0NBTi4gRGVmYXVs
dCB2YWx1ZSBpcyAxICovDQo+ID4gKyNkZWZpbmUgU1dfUlNQSV9DQU4gICAgMQ0KPiA+ICsjZW5k
aWYNCj4gPiArDQo+ID4gKyNpZiAoU1dfU0NJRl9DQU4gJiBTV19SU1BJX0NBTikNCj4gPiArI2Vy
cm9yICJDYW4gbm90IHNldCAxIHRvIGJvdGggU1dfU0NJRl9DQU4gYW5kIFNXX1JTUElfQ0FOIGR1
ZSB0byBIVw0KPiByb3V0aW5nIg0KPiA+ICsjZW5kaWYNCj4gDQo+IFdvdWxkIGl0IG1ha2Ugc2Vu
c2UgdG8gaGF2ZSBhIG1hY3JvIGZvciBTV19TRDBfREVWX1NFTCwgdG9vLCBvciBpcyB0aGVyZSBh
DQo+IHNwZWNpYWwgcmVhc29uIHRvIGtlZXAgdGhlIHNlcGFyYXRlIEVNTUMgYW5kIFNESEkgbWFj
cm9zPw0KDQpJIHdpbGwgc2VuZCBhIGZvbGxvdyB1cCBwYXRjaCBmb3IgcmVwbGFjaW5nIEVNTUMg
YW5kIFNESEkgbWFjcm9zIHdpdGggU1dfU0QwX0RFVl9TRUwNCg0KUmVnYXJkcywNCkJpanUNCg==
