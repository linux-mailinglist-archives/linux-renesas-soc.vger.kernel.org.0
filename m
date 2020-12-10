Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4D82D6048
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 16:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391954AbgLJPp2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 10:45:28 -0500
Received: from mail-eopbgr1400123.outbound.protection.outlook.com ([40.107.140.123]:9867
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391251AbgLJPpU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 10:45:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWXBJ2T+YYNNOAdVO36ouzIiRnQIR39RuQj0aql+oVHnnLRSwsdUuTuNB+snWwfrDMThFes/fZsnBVgHOqzlvKnMWMMQ0tXRB+Dz1/oUlT+46+M51+5lHlC/9N1rrfYHQp3XWD/rawY5IZWIQkG6rGioiYe5MmNp0FBn3yjhhebXZm8UVgx8kXIscyKX6WLjGS1zJXmmRqxLmNjT+7REyCeTa/zPUn0f0OXD3YpQukqYiSciss1qHCcSX98sFijkcXmwAboAnSJzyPuBDhnNHcSyzu2Fj44bm23An9BqgEshj4eR0rXRa4tOda1zx/LwfySS8dHELvdj/GYSxdsX3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO91sdyS1JbnmCIgV6xoTlN+7nuQYsGtdhzXeECoUPg=;
 b=i5yA/Yhv+MMudCFMx0GsAC4xYutXsAxYCQSIYphI2h/HTkuL+tyLL5cmX6hHOXOYDy1FeDMrU4/uYblnbSCzt1dHduUa8ZJgPw2xdR1z5PTzb6FHK9ztY/yvqZazkpntK+FHxLm/xukjL/Xy6of/ES0KPbHs9tw1hSj2jnCpcL4ZL4BBEiYL5XxNiYip+A6EuxfJyB/HwGZFd4msVsu6Q+/gjbGWTeYyqtIcKUJXThr+rpxkbkoQUeiwJGXvGXtT+O8UPLsemhQ59B32jNuBFHLgsj+ePDYMs8/iuwp8Ej7VC6a+Pmez+YK6XPtKpaR4hOTtEZtz3scGCGuPlPkozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO91sdyS1JbnmCIgV6xoTlN+7nuQYsGtdhzXeECoUPg=;
 b=CKeAdHcK7x+w04YKo4duhwvnIVzV/sAiNPYZdhef9c8PQ8RB0OpLfq58R1fkoGgicHQt0MmEtQRUqqQ2I/vb5H98IGUTbTXavOxpIrXeVdj03niG/wgJnkknR+qWpnhNcevvjwaTCxjrAJQScPYtjHv5AfDP4sJn9enPX+WJRQc=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TYAPR01MB5120.jpnprd01.prod.outlook.com
 (2603:1096:404:126::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 15:44:31 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db%3]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 15:44:31 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Julien Massot <julien.massot@iot.bzh>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/5] clk: renesas: Add MFIS clock
Thread-Topic: [PATCH 0/5] clk: renesas: Add MFIS clock
Thread-Index: AQHWzv/z4hXhL9QMDkafPTk9jsvyIqnwal5ggAAC/4CAAAq7wA==
Date:   Thu, 10 Dec 2020 15:44:31 +0000
Message-ID: <TYBPR01MB53090FC98C72A3DA466C064786CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201210142021.163182-1-julien.massot@iot.bzh>
 <TYBPR01MB53098A6476F176914F71239886CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <5526f9b5-59b2-492b-f541-8381894a005f@iot.bzh>
In-Reply-To: <5526f9b5-59b2-492b-f541-8381894a005f@iot.bzh>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: iot.bzh; dkim=none (message not signed)
 header.d=none;iot.bzh; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [109.152.167.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: acc56b18-06a8-41f2-f0c3-08d89d227c9a
x-ms-traffictypediagnostic: TYAPR01MB5120:
x-microsoft-antispam-prvs: <TYAPR01MB51202E6981D05FC25A6F919C86CB0@TYAPR01MB5120.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TbAGVqZtlE9JOwtzJ0NjXa4sg8xRqgT56+8RBv7qe0QPlhnnFeei8PEe8YqTxJqTfiKijJYsYXMMLbm4dapINEiQsicoHndrOr1mOmUwWjkA8aw5ahEc611zJnMatZC9jTpwp3jVREKgjUE0SKj42Bc47ogrJaNBwNX43A2gO0jaraLDUmy+3NhiIBUuUuREIS3/KlChySe6PEvVrIGEJHxxHxInA2krnHa68EuWUvShhaAGgpTGxvdOAmqD1fRQ4PdC8NSrAMk/9bKIMgupi9JZgb2e+mxWy4dP7gXkHdUCv5Ov+hrGeZOktPGY85EG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(52536014)(86362001)(55016002)(33656002)(5660300002)(8676002)(9686003)(4744005)(66446008)(66476007)(76116006)(66946007)(8936002)(2906002)(508600001)(6506007)(71200400001)(53546011)(83380400001)(64756008)(110136005)(66556008)(26005)(186003)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z3QvK3dobUVGSEZJRUswR2x3NWZkWnBORC9WNkVNMDFlK2h2Nmk0djBvaDZF?=
 =?utf-8?B?K1ZaQkVtbHQ2bXl3alRkRU11K3htanpGdTV2enE1a3pSNndHQ01KeUZza0FC?=
 =?utf-8?B?cEI4M0UybGlZR2tORU9iYU1vL1lhZWZxWFBuL3VnaEVZMnJpT0VzRmFYblFV?=
 =?utf-8?B?TEhvMDBBcFJmTFc0VC9qd0VJVGNWcGZuVFRHT0tBTEpMeTkxc0VUQWh2a01B?=
 =?utf-8?B?MDNJTUk5TE05cTI1a3RiQURjTWpMelI0UnQ4bEtOWFhhbDhxM1MzSTBhOTNx?=
 =?utf-8?B?OXhnQ01WUFlTaEIvZzBqWllVUnZMcjFiVm84TVBGblluMFV1THJ4dldlWmQx?=
 =?utf-8?B?cGxXMjl2cllNQzZTQjNqeHdKUGFuQW9DWU9uVmJsTGxlM3hxTnJTRFhmSm84?=
 =?utf-8?B?YjIrMVVCODFlM2dCM2NRZTB6SjVOeHlOeFRXVlQrclU1NUJwbzBJUDE4Wkkx?=
 =?utf-8?B?Smx3ZUMrdmFsOUt3UDF1bWpvc2N1c01OeGRVaDZyZnhDTVp5Y2VOR2ZJbTdS?=
 =?utf-8?B?T1dOeEx2SVJpNUM5VDhlazRPdDM1RmpuS01nQU1FQXo3Y3pSbmlVc2wramtK?=
 =?utf-8?B?WDRWUnVEVWFVcnhtYVVtTHMwaUJpZUVlUEJNcHNYZUx5bzhGdjFIaVEzdml1?=
 =?utf-8?B?ajdZUEFYQkZrMWtIbXBGbkI1RzY5VEpQd24yaWg3VVBTRUVYcFBoSmtoZUNi?=
 =?utf-8?B?aVUzMEkxc1ZSZm5DdDd4U2FaM0N1VzBVVmYwYm1FRTRtamZ1WmVIVks0TWNn?=
 =?utf-8?B?Y2tzdnZXVEFCTloyem1mTHI2NWkreXlycWtXWCtrNHRyWEF0MUVjam5ONmlQ?=
 =?utf-8?B?SkJyN3U5Ni9WUENaY29LaStLU0ZIRDFIb1FoV25HZDZWWTFzLytDQjVqRlA4?=
 =?utf-8?B?RGhhUU5WQTJxRlhQQXBFcFh0eVJQQXJiUVhVTVNyb3g0SFNNcGVFQ0ZIaWJK?=
 =?utf-8?B?SExSb1JQSXB2SU1tRjUvLzl5TjVWTUMzL2l6YXY4aE5UbysrdTdOcXQxbk10?=
 =?utf-8?B?N1NrdXEvRUdkTksrVC9RbU9QOVNxbDVBcEhGcmxPNmhKTVdTV3dpS3c1M1VU?=
 =?utf-8?B?TVd6ekJSV0FGcEt5S1pnaXZGYnd2bzdmL2crczhlSEIwZS9XcTd6TS9wazAy?=
 =?utf-8?B?dXgvTFExcmprYWdrdnBVM2kxNmFxWkNQUWl6RmY5NjdQSk1pS1p5K2FoakZS?=
 =?utf-8?B?eENGTTYzLzBxbU82R1cveEtxaXNnalkySXNUekhkV1hsZk1VMWdlcWF3MzlZ?=
 =?utf-8?B?TWI0V0g3bVB4b1dBa3lnVkczR0NjTHQvOXhncks1UFpIS2YzdlhQdXI0TDV0?=
 =?utf-8?Q?83bHazMyqVEYQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc56b18-06a8-41f2-f0c3-08d89d227c9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 15:44:31.6977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h51sHPgcYKSCTLeGK59Q1I6zqN/ylGrHR4H5HfmKjjDxYPyWp4FxWyZQAmVu5l/m2E1HcNSWVOd3tcEO8CnwDfM5CHu5RYzhTZ6ApYXULrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5120
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgSnVsaWFuLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC81XSBjbGs6IHJlbmVzYXM6IEFk
ZCBNRklTIGNsb2NrDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDEyLzEwLzIwIDM6NTcgUE0sIEJpanUg
RGFzIHdyb3RlOg0KPiA+IEhpIEp1bGlhbiwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNo
Lg0KPiA+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCAwLzVdIGNsazogcmVuZXNhczogQWRkIE1GSVMg
Y2xvY2sNCj4gPj4NCj4gPj4gVGhpcyBzZXJpZXMgYWRkcyB0aGUgbWlzc2luZyBNRklTIGNsb2Nr
cyBmb3IgbW9zdCBSZW5lYXMgUi1DYXIgR2VuMw0KPiBTb0NzLg0KPiA+PiBJIGhhdmUgdGVzdGVk
IHRoaXMgc2VyaWVzIG9uIEUzLCBNMywgYW5kIEgzIGJhc2VkIGJvYXJkcywgSSBkb24ndA0KPiA+
PiBoYXZlIGFjY2VzcyB0byBEMyBub3IgVjMgYm9hcmRzLg0KPiA+DQo+ID4gSnVzdCBhIHF1ZXN0
aW9uLCBDYW4geW91IGV4cGxhaW4gd2hhdCB0ZXN0IGhhdmUgeW91IGRvbmUgd2l0aCBNRklTDQo+
IG1vZHVsZT8NCj4gQSBiYXNpYyB1c2FnZSBJIGRpZCBpcyB0byBzdG9yZSBhbmQgcmVhZCBhIGJ5
dGUgaW50byBvbmUgb2YgdGhlDQo+IGNvbW11bmljYXRpb24gcmVnaXN0ZXIgTUZJU0FSSUlDUiAv
IE1GSVNBUkVNQlIsIGEgbW9yZSBjb21wbGV4IHVzYWdlIGlzIHRvDQo+IHRyaWdnZXIgaW50ZXJy
dXB0cyBiZXR3ZWVuIExpbnV4IGFuZCB0aGUgcmVhbHRpbWUgcHJvY2Vzc29yLCB1c2luZyBhDQo+
IG1haWxib3ggZHJpdmVyLCB0aGF0IEkgZGlkbid0IHBvc3QgeWV0Lg0KDQpUaGFua3MgZm9yIHRo
ZSBleHBsYW5hdGlvbi4NCg0KRllJLCBBcyBwZXIgUi1DYXIgR2VuMyBIVyBtYW51YWwgUkNhci1E
MyBkb2Vzbid0IGhhdmUgUlQgQ29yZS4NCg0KUmVnYXJkcywNCkJpanUNCg==
