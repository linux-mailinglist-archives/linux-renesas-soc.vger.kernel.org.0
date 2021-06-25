Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7124B3B48CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 20:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhFYSfX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 14:35:23 -0400
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:38496
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229531AbhFYSfW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 14:35:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvI1u+0R3T7Hk0jRAdCvK00xieqhibmUqdAA1q9SFram8SNdT5JyCmHPL2trReOSWIfqK21m0GN2MTDbXFEqdE1/NiCjIixvU7tT9vQUh3HcVF+AnmNUMe01Z6JElUM6aObEh7h+fwpxm251+OAgwCVgqyqHypc/Q53jJpCbdV8f3gREiwnd6gErQu81f8bahaHumxSOFuD68hYDNamkATWSsxLJURAtOgp8YB4f9BDAgzPWjhdN1vruxeM/EKhkxXwADM4D9ChTlXaZ6IdwAsS2RwAQ83Mb+e4bXCgk5fIksyn7N7zh/WYXj2h5czu4J2N5Aa9ugEPC7ssWgL3VfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilUjlmE76N+IUVS96k+/REcmCiSXBqX85omIXwU/ays=;
 b=MgNNisXCeX5bXSUBDW2/1wz4QiLhVPm842uBXYcxAPN5apqyt+mxPXF2N/lwu3O0T4IWul0/5lHwsOo7Xn6IdL/cn+2O6LF5TwWJwNAsYJhlBpMiKNddnTiYr7FLoePQEjUUw9B6utsePG6fZcobi6FmAHWN8+6h0umfJD4g6aRfm9q4Fw6z7z1bJ8UETkDCynvIXzHJ9rTOVUuzMg/1AkfiTuRjxuJg3Mku2KQizuQMtsyKSRgIovHBAESzxMo60UmxuHJUDwb9kTKWwkJCiIR3yEiCqVp0ZHAWephBsHxb0r5I6IR5rEf/41uD2z4ihrAVWoHDolPhFRp8ZxT6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilUjlmE76N+IUVS96k+/REcmCiSXBqX85omIXwU/ays=;
 b=Urh+lMYbUIb2AlapPZkSCtDR4Pbd74UTu1vZvoTtHBZkAP1WkcJca5GK22mao5r/GgOgHP7BO8M9aBBgaWQ1nab2fssCf4AS7i8P8cmhLtZgA+drq2vVNWId3u9cEg45j8PhYQOBrdkUSBWQrhUDhbgXPN7591nqoGA4yiaPIUE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2801.jpnprd01.prod.outlook.com (2603:1096:603:3b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 18:32:58 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 18:32:58 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 07/11] drivers: clk: renesas: r9a07g044-cpg: Update
 {GIC,IA55,SCIF} clock/reset entries
Thread-Topic: [PATCH v2 07/11] drivers: clk: renesas: r9a07g044-cpg: Update
 {GIC,IA55,SCIF} clock/reset entries
Thread-Index: AQHXaPlFx7L+bMMUMke+mOA0BuQfTKsk1QEAgAAOfdCAAB1kgIAADUIg
Date:   Fri, 25 Jun 2021 18:32:58 +0000
Message-ID: <OS0PR01MB5922026BB003F14B6260992686069@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com>
 <20210624130240.17468-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdWHz1RZ9qsbNHC9ded4x3HWCRBdRyFF2qAY4XGzV9hR2A@mail.gmail.com>
 <OS0PR01MB59229982F896C8CE60A64C5986069@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXic7vHg=-OaZ-CSzZjjideTzggitg9pz7xsLMdFH07qQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXic7vHg=-OaZ-CSzZjjideTzggitg9pz7xsLMdFH07qQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe081430-55cb-4e4f-d394-08d93807a809
x-ms-traffictypediagnostic: OSAPR01MB2801:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB2801574CCF217E35B695A18586069@OSAPR01MB2801.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NIFcdlIlsScTb4R+tSCLfWUX4a36nWaKEjeECj7UFUiaNPBOQvw5UoNW7nCGWkKA42IfsQOAYAvCrGvgnnibTxBLZKeSDWlcaRqcPoFKu8momZGkcTcR1TFamz/oC+t2eoF/GMuM5cQ1JKd4jRYVXrUg7DFzvmkY4l5E6vFcHzEmEEHne9hoa8Oz91nP7jpRhm94OMy+ulFoJj2yqfwGHevu1sfR50YnGI63fqp1Cj7Eava/s+jce6xVeD39Xhw/UVfDtT5hwVV29d64JmyQHwjJ6VIakwzCTf79pveTM4/vNbwEo7Fb0e1gq4r/aEmR5qdi/4AVbztFe6wxkjoqJyQE5zW9QylDM2SsNPHkqb3dMxl/4GLWHkaduR4ZdWTrv4HJvapchDPuhz+DhfyQN4n+X/97b7svfbTtdyzNDuvoNT9ol4WEfAnojw7aolRsm7Oel2wl9uXuWJMWx+4pXVij4XZYQng+YSE1dMLAIevv1mL4NpTEqnMPGU/UPV4sbCB8UUk7neXz+CaD4kkmlG3Ll7JGDj7hhn1huG844bWtWN9e60pG3hpAIli3cr3MixCzNo+Mhx09LW6mFcLugoj1xUOVs0Q7fKL78DadxL2ZlMdaDnH+LVbsaz8oHknUHMZbO5a/9D2zYv0tZm17qA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(366004)(136003)(346002)(396003)(64756008)(122000001)(55016002)(66446008)(9686003)(107886003)(38100700002)(186003)(86362001)(4326008)(2906002)(5660300002)(8936002)(66476007)(66556008)(76116006)(66946007)(33656002)(6506007)(54906003)(26005)(6916009)(7696005)(478600001)(52536014)(8676002)(15650500001)(71200400001)(83380400001)(53546011)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTUraTVjMW5HS29XNkhuY2hMQmsvMkllVTlXcThra2dROVppSmRjUmxxU3l4?=
 =?utf-8?B?NDJoeHB0YjJTRG5oK3pjU1ByYjhNQzdoYVBMbmI0SHpYMG9rL1FNeWhtSTJM?=
 =?utf-8?B?L0RpazhWenIwalFZWnlFSVEyZVJzYTE0Q1hkNnlaYTBaQ0VXTXBzak14MEc5?=
 =?utf-8?B?SDY1Wmlpd2FNMzJYamY5VjJwM204RVlwN3RUakpHL1QyY1U5WFE2eUFLc0Ro?=
 =?utf-8?B?U1dNU3FtSTVjZEFRQk51cFBmUEpwRkVGb1hiOWZMSFdPQm5hdkZjSkQxQ0l1?=
 =?utf-8?B?ems3V1l5Rml4dUdiR3JMdnNhTkxJQ2JFcHFSVXpHOHlZdmh5ZUZEZmRsRG1H?=
 =?utf-8?B?SHNBUHRaYVBKKy9QOFNNVTJ4NGt0cXBkcUk5bjNnOTVIeU1pRVV6czhBdVAv?=
 =?utf-8?B?VUE2aXo3NUpvUXcrZ0RXanVlbGFHZnNFY3hGQXNGZzZEbG5PU3cwbXNReXZF?=
 =?utf-8?B?Nm9peEN3UUhJbFZaa1pHcWQzbG5Bd1V6eXVzNE9IQjVubkRtbUNaOG9JWVo0?=
 =?utf-8?B?eUZIT0pTYjBEQVphUUVXVzRjcVpNa3J2c1pRM25CQ3lFRDZvTzBocEozQVY0?=
 =?utf-8?B?Si9iYUc2anUwNklMZVdFWWV3ZnhQOXV5dzl4d2tGcEVCdHNZeE1RVjVuRTlh?=
 =?utf-8?B?L0RRZzNHZjg1aHh1V0UrYzlpTHRMYjAvK05YQm1CUHpZMiticGRPNThCdzBw?=
 =?utf-8?B?SDhRemwrdFZZYVJLRjlTS0F6djMxUENxMnpab2c3RUpiQjIrTG52M0JzWEJz?=
 =?utf-8?B?c3FkUDJ4S1oyZjVUSWszaWMwVnRrbWU3MTZFTVFIVWpqZGx3NEJkRjZYVzBK?=
 =?utf-8?B?c0FGVXNiRFFVSWduNnpZR2Z6SG9RaDMyQUZDSkUvK3NSb3Zyc0Z6a0hrbVEz?=
 =?utf-8?B?ZytmbmNMMTF0TGxSL29jdWlRTnY3a3dLK0NEKzlEQ1NoNXBlRVFCYVNYY3Z2?=
 =?utf-8?B?UzlndURhOUZTLzJiejVnbFdBZUdNZU1kelQyVitmbGl5NEIweUJ0bmd3MDZk?=
 =?utf-8?B?Z2dGWFlVVVJWVzQxckE4Rit2dkFYZnNGVmZGYjk3M1JkMkR1aS9rVjFnbkVX?=
 =?utf-8?B?NFltckNJZ3l5NDMyZ0dGS1g0VU5XNEtNZWZnY2RNdEtoRXVZczdpc1cvMDBU?=
 =?utf-8?B?RkFjRUd4WTBRTGQ3Z28yRHorSE9qYzJ0MGtOaDhLN0V4ZDRMSmZMUWp2WDFZ?=
 =?utf-8?B?cVI0c2tPcitSWnFOR0NwOVBKYld6ZkpxWW4ya1NwMWRFMis4UkdEOU84eHgv?=
 =?utf-8?B?dC9aTW5xUGlqT1BMSU1SVWI5dWpTbjd3bVNUY3IxMDF2Q2x5eE5QRGo0U0wx?=
 =?utf-8?B?RWtiamtKVnVlcUY3WmQzUmRoZkxMVkpCS1RiTDNSMzE2RkRicUlTdWVUZDE2?=
 =?utf-8?B?cTh6YkNJRGRQekpURGMydytnZi9KUjBKNjhKdnk5NzRkOTRQdDhJa3FwOTM4?=
 =?utf-8?B?S0xPZldwa2xhUjdnVUxlUThBUmNtNEdHM2ZkRHlGbmZMWUxMdjRzYWtBdnFD?=
 =?utf-8?B?SldGei91bGlMK0RKTnJ0WjBzQ0VxalBFYWxFUVdzMyt5SFJ2YXBnUENpODFa?=
 =?utf-8?B?OUpTUGxKVmxPaUhlNC9RZ2RZT2x3cktubkJKUlR0aE9pSFhWT2d1QVFGRnVt?=
 =?utf-8?B?bWxTRWRjelUzb3FkV09YWHVaelVmOWU3aDVYSkRzZU5wSUduM0tUUWh5K2VC?=
 =?utf-8?B?N3ZuVVB4LzgvQStuZjdmTE5CSk5RZkZiRU1KUkhXRmZ3T3lkNkg4T1dteFhV?=
 =?utf-8?Q?3yICb8N/wSgzgAvEtSzDlzhEWduLv7Fa+2CMEBS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe081430-55cb-4e4f-d394-08d93807a809
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 18:32:58.1164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HiFn41coIVmKYEu2PtlKnv46axeJ0tsm9aNkCi47cX7KKgjCCf9jMGWI3Esz2yfKq8NBMW0TKP9FtAB0UPC6rUskkJmTluru229AwdgirTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2801
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMDcvMTFdIGRyaXZlcnM6IGNsazogcmVuZXNhczogcjlhMDdnMDQ0LWNwZzogVXBk
YXRlDQo+IHtHSUMsSUE1NSxTQ0lGfSBjbG9jay9yZXNldCBlbnRyaWVzDQo+IA0KPiBIaSBCaWp1
LA0KPiANCj4gT24gRnJpLCBKdW4gMjUsIDIwMjEgYXQgNjowOCBQTSBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAwNy8xMV0gZHJpdmVyczogY2xrOiByZW5lc2FzOiByOWEwN2cwNDQtY3BnOg0KPiA+ID4g
VXBkYXRlIHtHSUMsSUE1NSxTQ0lGfSBjbG9jay9yZXNldCBlbnRyaWVzIE9uIFRodSwgSnVuIDI0
LCAyMDIxIGF0DQo+ID4gPiAzOjAzIFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBVcGRhdGUge0dJQyxJQTU1LFNDSUZ9IGNsb2Nr
IGFuZCByZXNldCBlbnRyaWVzIHRvIENQRyBkcml2ZXIgdG8NCj4gPiA+ID4gbWF0Y2ggd2l0aCBS
Wi9HMkwgY2xvY2sgbGlzdCBoYXJkd2FyZQ0KPiA+ID4gPiBtYW51YWwoUlpHMkxfY2xvY2tfbGlz
dF9yMDJfMDIueGxzeCkNCj4gPiA+ID4gYW5kIFJaL0cyTCBIVyBtYW51YWwoUmV2LjAuNTApLg0K
PiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+
IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3JlbmVzYXMtcnpnMmwtY3BnLmgNCj4gPiA+ID4gKysr
IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yZW5lc2FzLXJ6ZzJsLWNwZy5oDQo+ID4gPiA+IEBAIC03
OCw3ICs3OCw2IEBAIGVudW0gY2xrX3R5cGVzIHsNCj4gPiA+ID4gICAqIEBwYXJlbnQ6IGlkIG9m
IHBhcmVudCBjbG9jaw0KPiA+ID4gPiAgICogQG9mZjogcmVnaXN0ZXIgb2Zmc2V0DQo+ID4gPiA+
ICAgKiBAb25vZmY6IE9OL01PTiBiaXRzDQo+ID4gPiA+IC0gKiBAcmVzZXQ6IHJlc2V0IGJpdHMN
Cj4gPiA+ID4gICAqLw0KPiA+ID4gPiAgc3RydWN0IHJ6ZzJsX21vZF9jbGsgew0KPiA+ID4gPiAg
ICAgICAgIGNvbnN0IGNoYXIgKm5hbWU7DQo+ID4gPiA+IEBAIC04NiwxNyArODUsMTUgQEAgc3Ry
dWN0IHJ6ZzJsX21vZF9jbGsgew0KPiA+ID4gPiAgICAgICAgIHVuc2lnbmVkIGludCBwYXJlbnQ7
DQo+ID4gPiA+ICAgICAgICAgdTE2IG9mZjsNCj4gPiA+ID4gICAgICAgICB1OCBvbm9mZjsNCj4g
PiA+ID4gLSAgICAgICB1OCByZXNldDsNCj4gPiA+ID4gIH07DQo+ID4gPiA+DQo+ID4gPiA+IC0j
ZGVmaW5lIERFRl9NT0QoX25hbWUsIF9pZCwgX3BhcmVudCwgX29mZiwgX29ub2ZmLCBfcmVzZXQp
ICAgICBcDQo+ID4gPiA+ICsjZGVmaW5lIERFRl9NT0QoX25hbWUsIF9pZCwgX3BhcmVudCwgX29m
ZiwgX29ub2ZmKSAgICAgXA0KPiA+ID4gPiAgICAgICAgIFtfaWRdID0geyBcDQo+ID4gPg0KPiA+
ID4gSGFkbid0IHJlYWxpemVkIHRoaXMgYmVmb3JlLCBidXQgZG8geW91IG5lZWQgdGhlICJbX2lk
XSA9Ij8NCj4gPiA+IHJ6ZzJsX2NwZ19pbmZvLm1vZF9jbGtzW10gaXMgb25seSBpbmRleGVkIGR1
cmluZyBpbml0aWFsaXphdGlvbi4NCj4gPiA+IElmIHRoZXJlIGFyZSBnYXBzIGR1ZSB0byBub3Qg
YWxsIGNsb2NrcyBiZWluZyBpbXBsZW1lbnRlZCB5ZXQsIHRoZXkNCj4gPiA+IGFyZSBza2lwcGVk
IGJ5IHRoZSAubmFtZSBjaGVjayBpbiByemcybF9jcGdfcmVnaXN0ZXJfbW9kX2NsaygpLg0KPiA+
ID4gQnV0IEkgdGhpbmsgeW91IGNhbiBqdXN0IHJlbW92ZSB0aGUgZ2FwcyBpbnN0ZWFkLCBkZWNy
ZWFzaW5nIGtlcm5lbA0KPiA+ID4gc2l6ZSAoZm9yIG5vdykuDQo+ID4NCj4gPiBUaGF0IG1lYW5z
IHdlIG5lZWQgdG8gbG9vcCB0aHJvdWdoIHRoZSBhcnJheSBhbmQgZmluZCBvdXQgdGhlIGluZGV4
DQo+IGNvcnJlc3BvbmRpbmcgdG8gdGhlIElELg0KPiA+DQo+ID4gQ3VycmVudCBpbXBsZW1lbnRh
dGlvbiwgd2UgZG9uJ3QgbmVlZCB0byBmaW5kIG91dCBJRCBpdGVyYXRpbmcgdGhyb3VnaA0KPiA+
IExVVC4gQnV0IGFzIHlvdSBzYWlkIGl0IGlzIGF0IHRoZSBleHBlbnNlIG9mIGtlcm5lbCBtZW1v
cnkuDQo+ID4NCj4gPiBTcGVlZCB2cyBtZW1vcnkuIExvbmcgdGVybSBhbnkgd2F5IHdlIHdpbGwg
ZmlsbCB0aGUgaG9sZXMuIFRoZSBtYXggaW5kZXgNCj4gbm93IGlzIDk2Lg0KPiANCj4gVW5sZXNz
IEknbSBtaXNzaW5nIHNvbWV0aGluZywgdGhpcyBhcnJheSBpcyBvbmx5IHVzZWQgZm9yIGluaXRp
YWxpemluZyB0aGUNCj4gY2xvY2tzPyAgQ2xvY2sgbG9va3VwIGJ5IElEIGlzIGRvbmUgdXNpbmcg
cnpnMmxfY3BnX3ByaXYuY2xrc1tdLCB3aGljaCBpcw0KPiBpbmRleGVkIGJ5IElELg0KDQpHZWVy
dCwgeW91IGFyZSBjb3JyZWN0LiBfSWQgY2FuIGJlIHJlbW92ZWQuDQoNClJlZ2FyZHMsDQpCaWp1
DQo=
