Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BED981532
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 11:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbfHEJRU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 05:17:20 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:4032
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727259AbfHEJRU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 05:17:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDqtQ6oDD1ISHnm8ZOfjmLD7NpFDcPnw8FTxy56tZ+4Hiq/LYXswm8/nzh5UlzlY+c4gDh+PU+67KegaE9/5jOBXikBVCGSI9xT5Nuhm686vquVxzAcIXLHxhe/PMxqY+kVOsGrxFZ8YWDH0zyuR3m1QUo8h8uiBmoMK7fJ5oGpyuUfCFk68VCbfRDvNUfGZj5ETra2KBywg1ae3hVb5J/Epb1YJwRwHkn2piicgDqVhZ5Hul6Tia1KliW+ohu3JAxGxsQGRihCM0XUDWt604/eMKPlLk5k8Ud7IntZMqiVnLmkNsBcGRicTA+kL4pRHwjNITpFkT0rHNw5o5s+L3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qy7EHED6Y+EvUwV8f6QiKMthPej0Lp+pwP6vKL4PnuE=;
 b=lkhkLj57m9poeAmH+l+tSU+AtbYAjKK7Ys8Pk904y/ErOrL/te3S05LaZbi+Om9C6IyvSkEX9drok+vRofWk9BXNXMd5uJy/WU8fhT65lNREq/8ukhLkp5f8o9q0e2u685ARVlpaCGAESJtPCWDCX/o51SK1qLDvLPWYm85mRITveVl80IbC6H1slw8PQQIlSYUWxuR0iss0tHr/Ngr/JBoQ1lpU60hQxcNyzyh8ObAWEILLuQCpFicVmuIK5/rcZRgc7+kNjE8KFYb9M7U3hbuXb+AeYVP/i9PsClfWnzqMfrmHuqT8JwF96TDKeG0F3fhLOmPQmY3SIbCNSnT5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qy7EHED6Y+EvUwV8f6QiKMthPej0Lp+pwP6vKL4PnuE=;
 b=n9i0mm3cu+l54MwNnrb0yFranClBcn5OuP1MHAQjp/VoE/ibusasi0oDB+ihe8I+FUwH7HR/76TPbXDb5eSW7X3V6mHbK7OeE4OtM3DbmyYSXXBTNtxFUNU9kYfV4zSD7td0+xBg5XE9a/iZ619vx6X4CWaN50vW54n3RWhBYxE=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1465.jpnprd01.prod.outlook.com (52.133.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 09:17:04 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 09:17:04 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH/RFC 11/12] arm64: dts: renesas: cat874: Add definition for
 12V regulator
Thread-Topic: [PATCH/RFC 11/12] arm64: dts: renesas: cat874: Add definition
 for 12V regulator
Thread-Index: AQHVSQTbv5qeZRv/zkiRrhmPMH0v8abnht8AgATD80A=
Date:   Mon, 5 Aug 2019 09:17:03 +0000
Message-ID: <TY1PR01MB17702E7517D3EE5E48337DA8C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-12-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802082952.GL5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802082952.GL5008@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae266d50-83ec-440d-5700-08d71985ae3a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1465;
x-ms-traffictypediagnostic: TY1PR01MB1465:
x-microsoft-antispam-prvs: <TY1PR01MB1465D4F1CCF5D88947857DA0C0DA0@TY1PR01MB1465.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(199004)(189003)(102836004)(66446008)(66556008)(64756008)(2906002)(6916009)(66946007)(81156014)(81166006)(14454004)(6506007)(53546011)(8676002)(256004)(11346002)(8936002)(5660300002)(26005)(446003)(76176011)(66476007)(68736007)(486006)(76116006)(476003)(66066001)(7696005)(86362001)(229853002)(44832011)(3846002)(6116002)(305945005)(55016002)(186003)(6436002)(53936002)(9686003)(71200400001)(99286004)(33656002)(71190400001)(52536014)(74316002)(7736002)(478600001)(7416002)(25786009)(4326008)(316002)(6246003)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1465;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: obOZiH7TGNONBA/3bU7776WPIZnkb//5q4dlXo/34yBypdO+/x6tTsIC8LorEnmBFY2dMPF+P1CNxxvSlkKBcGK+hKYFpt5ujob1IhDMOn92aXZW+UaDnkFmWCCk9fMdYVj2Tk0eWJuQn8j2j1HCLmJbrsHWmz97ocRXSIiveWwj+oWFwTK1OqJWswWdI4UhmdTr4EtdK+uNhevh7gh0sMX2pkm1tF83zWoqBzGCZRnZ1B5wZxeiQS/P/Z2/YHO8e+L1YQFGI9hSvSX6pd/ZNFtoD3UFzTpO3z+WY1dIrDvtzDTY+27Sx5ZRjUXvAIH1JYn0lRKukdG/NF3yEykmRVf1OkUP+q+nTrBlWGV0IiXxVsJ8mS4k4VWhEV1sB693GpFCJr9B07C/hDb/p4ZCn5+0wPEMZiUzezft4RTuNVk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae266d50-83ec-440d-5700-08d71985ae3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:17:03.8969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1465
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMDIgQXVndXN0IDIwMTkgMDk6MzANCj4gU3ViamVjdDogUmU6IFtQQVRDSC9SRkMgMTEvMTJd
IGFybTY0OiBkdHM6IHJlbmVzYXM6IGNhdDg3NDogQWRkIGRlZmluaXRpb24gZm9yIDEyViByZWd1
bGF0b3INCj4gDQo+IEhpIEZhYnJpemlvLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gu
DQo+IA0KPiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAwODozNDowOEFNICswMTAwLCBGYWJyaXpp
byBDYXN0cm8gd3JvdGU6DQo+ID4gUG93ZXIgcmFpbCAiRDEyLjBWIiBjb21lcyBzdHJhaWdodCBm
cm9tIHRoZSBwb3dlciBiYXJyZWwgY29ubmVjdG9yLA0KPiA+IGFuZCBpdCdzIHVzZWQgaW4gYm90
aCBtYWluIGJvYXJkIGFuZCBzdWIgYm9hcmQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJy
aXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFJldmll
d2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5j
b20+DQo+IA0KPiBJIGRvbid0IHBsYW4gdG8gdGFrZSB0aGlzIGluIG15IHRyZWUgd2l0aG91dCBw
YXRjaCAxMi8xMiwgc28gaWYgeW91DQo+IHRoaW5rIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMgd29u
J3QgYmUgcmVhZHkgaW4gdGltZSBmb3IgdjUuNCwgZmVlbCBmcmVlDQo+IHRvIGdldCB0aGlzIHBh
dGNoIG1lcmdlZCB0aHJvdWdoIFNpbW9uIG9yIEdlZXJ0IGFscmVhZHkuDQoNCkdlZXJ0LCB3b3Vs
ZCB5b3UgYmUgaGFwcHkgdG8gdGFrZSB0aGlzIHBhdGNoPw0KDQpUaGFua3MsDQpGYWINCg0KPiAN
Cj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGMwLWNhdDg3
NC5kdHMgfCA5ICsrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
NGMwLWNhdDg3NC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAtY2F0
ODc0LmR0cw0KPiA+IGluZGV4IDQ2YTc3ZWUuLjY1MTM4M2MgMTAwNjQ0DQo+ID4gLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGMwLWNhdDg3NC5kdHMNCj4gPiArKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAtY2F0ODc0LmR0cw0KPiA+IEBAIC02
NSw2ICs2NSwxNSBAQA0KPiA+ICAJCXJlZyA9IDwweDAgMHg0ODAwMDAwMCAweDAgMHg3ODAwMDAw
MD47DQo+ID4gIAl9Ow0KPiA+DQo+ID4gKwlyZWdfMTJwMHY6IHJlZ3VsYXRvci0xMnAwdiB7DQo+
ID4gKwkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOw0KPiA+ICsJCXJlZ3VsYXRvci1u
YW1lID0gIkQxMi4wViI7DQo+ID4gKwkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTIwMDAw
MDA+Ow0KPiA+ICsJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDEyMDAwMDAwPjsNCj4gPiAr
CQlyZWd1bGF0b3ItYm9vdC1vbjsNCj4gPiArCQlyZWd1bGF0b3ItYWx3YXlzLW9uOw0KPiA+ICsJ
fTsNCj4gPiArDQo+ID4gIAlzb3VuZDogc291bmQgew0KPiA+ICAJCWNvbXBhdGlibGUgPSAic2lt
cGxlLWF1ZGlvLWNhcmQiOw0KPiA+DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVu
dCBQaW5jaGFydA0K
