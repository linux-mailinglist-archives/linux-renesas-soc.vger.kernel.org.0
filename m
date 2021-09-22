Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2A64147AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 13:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235561AbhIVLTl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 07:19:41 -0400
Received: from mail-eopbgr1400132.outbound.protection.outlook.com ([40.107.140.132]:64050
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230171AbhIVLTk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 07:19:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbfwI1LUud0CL2iNDphaue28Bzr5lvY1nT2Yv6thTLaEB2SzV+/FKOYsvt35chWyd2pHERhKh4jdzMHS2Gy+jxSpvnfzLaq6VF6npXM6o9VNTEiBK13Pe1ie+ccO9IuJx7RhQI2ouOccfnrXmoGHsURCsKMAgEqwOnjqPIGyiHquGMIwqiYSn6hJ0A44qFLD48LBs1NdmvE0mXmuPy5E/Q25cb0ArTd6LNX/VE/5LyNIsiuTTh8pf2XZvoMUg/ZhZVjnEtUVvIEjp+BPSEuuQBa/GIEUW9vh8m1DgjLRsUc0V04LMaZ64LHGg30GTgd+kgjG74bx2GdR9ri8HZ9I4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gdkRjuCNQOMDsRvxJaHUTahZIJO4oAUdCGF+Wz25xNI=;
 b=aiK1azLqtU0hpcWJaV3JVNIZZZQLhtpbw+01YwZdbDvDpLsQ5JJmNxVtE8tVk9TrmvY8QUo8SkafAT3BBhs1V0+IInDPsnioh82qFkS36xgdG7WoXfXdXLl6H7XFwxYsDsRrNA5ddDJsB4jygM/JdTh4bPvGWzwqIpohtEDbwkkpwWSIa6Gtg7dkyftZ6AgVabhwcYGpQ/Lk96xGY6BcCZrZtOnyQgwW9gFydjtFBoa6GZIKaPpxfPLk+2oMkJZ9ikRVIuF68j9jYcYPm43UhJ2mlXOEdqzYEE3Keuwe1uy4Tg4dE2+V+VZZxLvy32vdsh+QHNCqdhoGDruNGFcz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdkRjuCNQOMDsRvxJaHUTahZIJO4oAUdCGF+Wz25xNI=;
 b=HzoSs7q/QwgXO6IiPnfZQK3FaPJHf6RCIq/ZgxYqsBPWthni/OmqQGGdJAtudKLm6SHJ5FLl4prpXx6Xt0pWVWF9P//YjJK8SZpDYdFn8btu1f+T1jbDn8yHTalN1AIn4on7WdBY14NKwTq0jC47qguBl4mU969uk9kLPI9P1PA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3079.jpnprd01.prod.outlook.com (2603:1096:604:13::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 11:18:07 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::6532:19dd:dfa1:4097]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::6532:19dd:dfa1:4097%7]) with mapi id 15.20.4523.018; Wed, 22 Sep 2021
 11:18:07 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod Koul <vkoul@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 2/2] clk: renesas: rzg2l: Fix clk status function
Thread-Topic: [PATCH 2/2] clk: renesas: rzg2l: Fix clk status function
Thread-Index: AQHXr4aU4KfSM2ffiUaWDmt2L5GJA6uvxE0AgAAjbgA=
Date:   Wed, 22 Sep 2021 11:18:06 +0000
Message-ID: <OS0PR01MB59223EDCD958DFB0DDDB5E2286A29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210922073834.21304-1-biju.das.jz@bp.renesas.com>
 <20210922073834.21304-2-biju.das.jz@bp.renesas.com>
 <38363f36-5da3-af67-c803-42b277a6f4ec@gmail.com>
In-Reply-To: <38363f36-5da3-af67-c803-42b277a6f4ec@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2eeff633-4f44-4121-e758-08d97dbaa724
x-ms-traffictypediagnostic: OSBPR01MB3079:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3079375933CF08352F48604F86A29@OSBPR01MB3079.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xQZN7BL0u4nQz266Kh+zfEWt1+6HW3/fSeBE4G2XVBgYGTsms7xtydt+RR4tLwsJgaAM9KJgiv18gW9KPIKleMdRpxdAqnzF6Q6ssPVVXBMhGSo33LaEKCpU+3eaXArJX1hKjwd3WXRrmh7Ahbi0WbzdRHGfSo+78e5WSiyM9lwr3oWEK9Ef97DGTrQALrYgtrG5TeyRsSG2Ekr/Pz9VPrJt5iHHyMOqIc0F43YFkM/z9ijfsDuu/lLvkxRx0Kgk2n4lFvmCfoV+8Mg776Ans+3kqYULONu4x/0/xqiJDtOF6xckPr+6QIICxDFNmsTozhW34AeUv/zCOvkQfhBNv0rUp4P/fr+Lsj/yqHH2EDBIpeXwpIz4WBfnH/W6+8gQ21kGDxGytxfNMXRYb5fDNsC8gbzl76lvHwy9SRU8GvC+Ho0rAygujwqCU+aUoZakUqJBuNw86ypeHeOiFdvPqouXwsNsCdgqagDG7rGF1OXqrDvwjLCNSQpU+L9Mm6bk0MtfE00vvMtnOcDI5OgDXPFNs4dg3HYaZfx2COK56UJ+bSQ3XDNFzcNbh+mBDCF/jA0P5J+VHylD0yM6yG7R1jd6GxB2KxtAXekGCDOrotrauB1EWk2jU2FlCCr9GwZScT2KazXtSPzB+qgcyQRKUGNsQ9Ks7Prhe1LLV8Mg6h0bkiQZizfi7VTITIxBFlTWz9GA5sO4tXE9P94GVIXgJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(316002)(38070700005)(26005)(52536014)(2906002)(122000001)(9686003)(54906003)(110136005)(66556008)(66476007)(66446008)(6506007)(76116006)(4326008)(508600001)(66946007)(64756008)(83380400001)(8676002)(33656002)(86362001)(7696005)(8936002)(38100700002)(5660300002)(107886003)(53546011)(55016002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnZTdkV4YzR0RERkL1RTRS9PNjhLRDJHclZNSExSTk1JMkFrend3VEhlMzdY?=
 =?utf-8?B?TmNTY1ZRVlEzY2xCK05HUXhOK3N4VHdFWHdSYm1kMXVzVnU4bWRIQWloU0gx?=
 =?utf-8?B?NkFnc0h6aWQrcnFHQ0YxZlcvbzZVMTBGUXZJSkllR010ak9UaGZqc2Z3djA1?=
 =?utf-8?B?Y2JxUXFsUk5NdFI3ZnptdEsrMjN6K0Q3TkxITFhFamNaZG5YY1FpeU9kSlZL?=
 =?utf-8?B?VWM2ME8zQW93TVQ1TXdRU2IzbGhrMURvV25BRGI2UHJDNElOWVNLRy95c0Nl?=
 =?utf-8?B?Y0d5Z0prbmprWXVWcE9yMGJiMTFKUEdiZGcydFVRbTZDc0l2N1hnRVFRem94?=
 =?utf-8?B?Tk1OanRzbS9hdmRzb3o2U1ZFY3dYSDZsd1JOMEM1VFNBTVNTMmJlaVJENXBC?=
 =?utf-8?B?UWRHNUdleGJibUx4TzA4UTZNK01ZWTIwdGFKZWRTbERNUFRmeERYV1ViNFNN?=
 =?utf-8?B?ZnZVUVdBVm5YeWE3Nm9abkZ4T1RIc2V4THg0L2FNRVBqR0o1OXFpd1RYbTFF?=
 =?utf-8?B?UjNsWmtUMGwxcUxURzk1MUdBRGpKQm9WdmsxTUovcVEvYzB6VWplWVQ3Z2hv?=
 =?utf-8?B?RnRFV1ZvV241cTMxMVVWT0JqSEJYOWRmMFJDS3VnT0hMMVU5bmJUU1ZLMHdU?=
 =?utf-8?B?cUFpMnhuc3JMaUlVNVp2ZnZ5TTVrcUdvdUYvMDlMajAyNUxSUGZqMmV6L0FU?=
 =?utf-8?B?SWVMZmY2VExRN2o3MnN2RDVRT01WUkcwMGwwbGU3VFRNcTNFeGRwVkRtNDcw?=
 =?utf-8?B?SWhhVStnUVNxTGtDaWNkRS9IcnNYT1l5MVlDZU96bG9HNmE1d3J3NjBCUjV0?=
 =?utf-8?B?dDVIMUlVUXpRK01zdGhqMkRwcHBFeVdybStPc3VCWTlIbHkyN01taDdPZzJl?=
 =?utf-8?B?TzVVNnFyQ0t2YmMvY2tFb3NDaStBUzlrdlhQQzNwYm5pY3NXSndDQmNEaFhB?=
 =?utf-8?B?cFQzeHhnZ1NWaEpWeTBUZzV6Rzh2a1B4Zml0Rkh6WTB6YU1jdkZRS1pyUHZi?=
 =?utf-8?B?eXViVkF3UWpCVlBpbWRVUDhPZjhrNmFGSnBJd2Nka1dyRjBraStyWFZsMk9u?=
 =?utf-8?B?cmtjNlhRd2I1ZERocWx2b2VLcVQ4bnBYQm5kblp4aGhVTFdXalMvZjMrUytu?=
 =?utf-8?B?V0hOallqYWNWK3VTc2toWHJ1QmRNRlI1U0pENXBlazdkb052OVVEZGtPeUl0?=
 =?utf-8?B?cW1KZ3pqdk1zZnhJbjVPeHpzNFZCdGZ5WmpBVWxQQ002aDdMRDl2Nm9nVDRh?=
 =?utf-8?B?Y29DVzdVWHlWTHFpNEtKc2xIVVVTeVovMFlrcG5JRGs5SkY2eEVsNWlXYXp1?=
 =?utf-8?B?LzA1LzFKNlNmZnFUdm5ka05EVnhQZzRmbHZNVk5NMHhxYnYyUFZnOGhNMFN2?=
 =?utf-8?B?TVRlUEhQK2FXRzFxYkpEcUIwTXMvR2J4TnFzNW1rNWRBbHY5ZExmY1JmVVFC?=
 =?utf-8?B?KzFEdEZuY0hIbmh5YktjYmNQUEZvNWR1WUFTZHJZOWNKbW1YUTNjaUx4dmtk?=
 =?utf-8?B?M0tzSlZlbVIvRm1yZjZ0ZjNINGN6a0poQnhrK1p5TVEwYTMycXFSMjlONVox?=
 =?utf-8?B?c1ZVMFE2dDRWUGhXSW5DOEZvYTBEVGQrNFhqR2lFeDZ6NUFaRzk2YmRJZUZp?=
 =?utf-8?B?UDZWRXdQSXh4ZnljcVNHM1JVbE5ZNGhTbngxNk1yTExDYUpidmE1bFFuNE9u?=
 =?utf-8?B?RXduajQyTlpSZ3hjT2E3T2ZTN3NuRXpMNXBUZU1tbTdvWnB6TCtFYm5KMXJY?=
 =?utf-8?Q?JH9C3mWn3HmFGsGdCbfpeN/8YrSpzyUkyLQtrFn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eeff633-4f44-4121-e758-08d97dbaa724
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 11:18:06.9326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cASe/rVw4IH/uNr8mTGSd2MqnloI8LxrmpgwHbl2AW1R/xzQEjbypWdt5N1zjBQC8B8Wnq7uLhKbrEtSnkFn2q8wn5HQYAtnam3RDL4MDgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3079
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2VpLA0KDQpUaGFua3MgZm9yIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMi8yXSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBGaXggY2xrIHN0YXR1cyBmdW5jdGlvbg0KPiAN
Cj4gSGVsbG8hDQo+IA0KPiBPbiAyMi4wOS4yMDIxIDEwOjM4LCBCaWp1IERhcyB3cm90ZToNCj4g
DQo+ID4gQXMgcGVyIFJaL0cyTCBIVyhSZXYuMC41MCkgbWFudWFsLCBjbG9jayBtb25pdG9yIHJl
Z2lzdGVyIHZhbHVlDQo+ID4gMCBtZWFucyBjbG9jayBpcyBub3Qgc3VwcGxpZWQgYW5kIDEgbWVh
bnMgY2xvY2sgaXMgc3VwcGxpZWQuDQo+ID4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWUgYnkg
cmVtb3ZpbmcgdGhlIGludmVydGVkIGxvZ2ljLg0KPiA+DQo+ID4gRml4aW5nIHRoZSBhYm92ZSwg
dHJpZ2dlcmVkIGZvbGxvd2luZyAyIGlzc3Vlcw0KPiA+DQo+ID4gMSkgR0lDIGludGVycnVwdHMg
ZG9uJ3Qgd29yayBpZiB3ZSBkaXNhYmxlIElBNTVfQ0xLIGFuZCBETUFDX0FDTEsuDQo+ID4gICAg
IEZpeGVkIHRoaXMgaXNzdWUgYnkgYWRkaW5nIHRoZXNlIGNsb2NrcyBhcyBjcml0aWNhbCBjbG9j
a3MuDQo+ID4NCj4gPiAyKSBETUEgaXMgbm90IHdvcmtpbmcsIHNpbmNlIHRoZSBETUEgZHJpdmVy
IGlzIG5vdCB0dXJuaW5nIG9uIERNQUNfUENMSy4NCj4gPiAgICAgU28gd2lsbCBwcm92aWRlIGEg
Zml4IGluIHRoZSBETUEgZHJpdmVyIHRvIHR1cm4gb24gRE1BX1BDTEsuDQo+ID4NCj4gPiBGaXhl
czogZWYzYzYxM2NjZDY4ICgiY2xrOiByZW5lc2FzOiBBZGQgQ1BHIGNvcmUgd3JhcHBlciBmb3Ig
UlovRzJMDQo+ID4gU29DIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2Nsay9yZW5lc2FzL3J6
ZzJsLWNwZy5jIHwgMiArLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9y
emcybC1jcGcuYw0KPiA+IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYyBpbmRleCAz
YjNiMmMzMzQ3ZjMuLjNlMzJhODU4Yjg1Mg0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Y2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6
ZzJsLWNwZy5jDQo+ID4gQEAgLTM5MSw3ICszOTEsNyBAQCBzdGF0aWMgaW50IHJ6ZzJsX21vZF9j
bG9ja19pc19lbmFibGVkKHN0cnVjdA0KPiA+IGNsa19odyAqaHcpDQo+ID4NCj4gPiAgIAl2YWx1
ZSA9IHJlYWRsKHByaXYtPmJhc2UgKyBDTEtfTU9OX1IoY2xvY2stPm9mZikpOw0KPiA+DQo+ID4g
LQlyZXR1cm4gISh2YWx1ZSAmIGJpdG1hc2spOw0KPiA+ICsJcmV0dXJuICh2YWx1ZSAmIGJpdG1h
c2spOw0KPiANCj4gICAgIFBhcmVucyBub3QgbmVlZGVkIGFueW1vcmUuLi4NCg0KR29vZCBjYXRj
aC4gV2lsbCBzZW5kIFYyLg0KDQpSZWdhcmRzLA0KQmlqdQ0K
