Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2908104E72
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 09:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfKUIww (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 03:52:52 -0500
Received: from mail-eopbgr1400139.outbound.protection.outlook.com ([40.107.140.139]:48180
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726132AbfKUIww (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 03:52:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBEmDhZEJKqyLXymPXzz3/NghaZCpKS1JfgfoMM+Hqsqgse2eFi08SW5h0DEQA6OIuhRbd0dXEUYLW+Pt+FWrKuZwS2SRLy4jg29TKrhGzYRreYAXFi+ItiSX7HZtGcjoJfR3nQethGrnFGDp9a3dxdRoEDt1yd4iD6HPoa09dKdE+q4HR+7SCT9WtGvRQXlVf/MnpMREYqcxTl809p4EklAIQkN0YONGuIyWZqVnFFpFiqomt7B+xo/7hIXkc8y/rzz+KxB+V2iw+gAAIcoIb1vQHBDCApgEMXc+ijd+YupvXWVnNtNyaCOLHRwD0hbyP1yBnFf0Cek/lvMxjz+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IA4X1eGUqLoYsSXLWtLz7XgV/C73/o60Xytn06OxyLk=;
 b=Blom2ZJybrY/BrpJ5uQiLqsH03+nZZ1+792IT7A5IVx2dbUPtn28snnj4IBLMmV5/QLTBUOz3qTro+/abE5xDljJsf3Z4Q9R3Sff5HC75G3+EyImPkqKncgEKLQI/jgFVXO1p1FKZC0AougCrTug6xtdoGN87IHG81L4cIEFmHyR8rIQ84fPWkyKvBsbrTWiXf4Kv0sUhazYw8BsgcEpHj7D6dCUS/YEfRW5N63GufDuThfU+j7TXE5Mn/uStRhQQYaw7GXj5ArvYd/Bt4gAdpygAggqZ54BSvRObuDQ21mo/fhtguQJG6X52w2kZ4m3QVxfpSuMj3QkwRA/q+FlPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IA4X1eGUqLoYsSXLWtLz7XgV/C73/o60Xytn06OxyLk=;
 b=YqkOkqcm89gQ4DHgrmixvExoD2z2GZH23D+MsqnyOvoIZqpJhwYnJ0XBujorrVdZTmh0Z7JcP+dgfZKPXLjTG3tiEhQlniDobdczRM7urt9zxJLG8ri/ww/y+m0U5jOBYjKn+zDrCOwo8c2qoxXRH++mEV/+sl2INq+PKRmRRHs=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2839.jpnprd01.prod.outlook.com (52.134.254.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.28; Thu, 21 Nov 2019 08:52:08 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::c9e7:5418:764e:69e3]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::c9e7:5418:764e:69e3%3]) with mapi id 15.20.2451.031; Thu, 21 Nov 2019
 08:52:08 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: timer: renesas: tmu: Document r8a774b1
 bindings
Thread-Topic: [PATCH] dt-bindings: timer: renesas: tmu: Document r8a774b1
 bindings
Thread-Index: AQHVchuIQNHun2Bo106a/51G2vHeg6dIXISAgAAs/oCATSPLEA==
Date:   Thu, 21 Nov 2019 08:52:08 +0000
Message-ID: <OSBPR01MB21035DCC73952DBC72C139B2B84E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569249052-1037-1-git-send-email-biju.das@bp.renesas.com>
 <dd752192-8caf-39bf-5a91-27adb6a5f84b@linaro.org>
 <CAMuHMdVvgS17NW7srZ37x5QD3qtZkGQY9xE_97bvF8bwAcmLvg@mail.gmail.com>
In-Reply-To: <CAMuHMdVvgS17NW7srZ37x5QD3qtZkGQY9xE_97bvF8bwAcmLvg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3eaece3b-36f3-4c01-8dbd-08d76e60175b
x-ms-traffictypediagnostic: OSBPR01MB2839:|OSBPR01MB2839:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB2839992B785A065D369AE9D5B84E0@OSBPR01MB2839.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(199004)(189003)(13464003)(54906003)(52536014)(66476007)(305945005)(102836004)(64756008)(86362001)(446003)(11346002)(316002)(229853002)(3846002)(33656002)(74316002)(4326008)(966005)(66066001)(44832011)(7736002)(7696005)(5660300002)(81156014)(81166006)(76176011)(478600001)(8676002)(256004)(66446008)(14444005)(6436002)(6246003)(25786009)(186003)(8936002)(26005)(14454004)(53546011)(55016002)(99286004)(66556008)(66946007)(110136005)(6116002)(6506007)(6306002)(76116006)(71190400001)(2906002)(71200400001)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2839;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xeb+g3aPMke1ECO+IRI+Fs9uGrsDPs9hWRGOTGT96sEofIXyB2brkjS5+WiD9p6AAVEC0qwoA7x2g0g4NxQekmf3zj1D8F6IgWuZpLJiOQe2YrdAczxHoQ3Jo6BHpJej63rjJsuDUTBX7COPEuPXQYPtRfvanORHT+sePbHujeXmZFdW6/3otjfZ06HiKkJl8XVGuieEmqe11H3pBX8j2sAgnlNH+4Q6nASyzGh142Ejvx0J6MW20m68SizAjlMsrLLjbEOljvk/ivJtJjj/j6w2mXjrUT2GRWYmw2TsMP6DkzqAJQ4Xd3IvloyCyl0ahRzHzKXoSWJX6dHqWwt1JI1yaREMQkHOHvfDiJCh1PL8HhPN9vq5uL/6SbFWoB+RqP1j+00kiIUjVP/2I3KxZTox2LuZ8uKTn+eGFJlDijUdp+YjTU4l+h/Vsc5MKqNpqQ7R+TzWVEOk7E0GcwQUZf3ML28kWFH5THsotMvwA+c=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eaece3b-36f3-4c01-8dbd-08d76e60175b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 08:52:08.2817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/t6MP99PanC2ODiEVDMenthyRrhXGx4tMNzqjQScAi7ycorIoaqW89hnptBxDiMpJ68TOfKqffhIysJRyL70Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2839
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsIERhbmllbCwNCg0KQW55IHVwZGF0ZSBvbiB0aGUgYmVsb3cgYmluZGluZyBwYXRj
aD8NCg0KUmVnYXJkcywNCkJpanUNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogVGh1
cnNkYXksIE9jdG9iZXIgMywgMjAxOSA3OjUxIEFNDQo+IFRvOiBEYW5pZWwgTGV6Y2FubyA8ZGFu
aWVsLmxlemNhbm9AbGluYXJvLm9yZz4NCj4gQ2M6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5l
c2FzLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBNYXJrIFJ1dGxh
bmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPjsgVGhvbWFzDQo+IEdsZWl4bmVyIDx0Z2x4QGxpbnV0
cm9uaXguZGU+OyBvcGVuIGxpc3Q6T1BFTiBGSVJNV0FSRSBBTkQgRkxBVFRFTkVEDQo+IERFVklD
RSBUUkVFIEJJTkRJTkdTIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47IEdlZXJ0IFV5dHRl
cmhvZXZlbg0KPiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBTaW1vbiBIb3JtYW4gPGhvcm1z
QHZlcmdlLm5ldC5hdT47IENocmlzDQo+IFBhdGVyc29uIDxDaHJpcy5QYXRlcnNvbjJAcmVuZXNh
cy5jb20+OyBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNv
bT47IExpbnV4LVJlbmVzYXMgPGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGR0LWJpbmRpbmdzOiB0aW1lcjogcmVuZXNhczogdG11
OiBEb2N1bWVudCByOGE3NzRiMQ0KPiBiaW5kaW5ncw0KPiANCj4gSGkgRGFuaWVsLA0KPiANCj4g
T24gVGh1LCBPY3QgMywgMjAxOSBhdCA2OjA5IEFNIERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6
Y2Fub0BsaW5hcm8ub3JnPg0KPiB3cm90ZToNCj4gPiBPbiAyMy8wOS8yMDE5IDE2OjMwLCBCaWp1
IERhcyB3cm90ZToNCj4gPiA+IERvY3VtZW50IFJaL0cyTiAoUjhBNzc0QjEpIFNvQyBpbiB0aGUg
UmVuZXNhcyBUTVUgYmluZGluZ3MuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3JlbmVzYXMsdG11LnR4dCB8IDEgKw0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVuZXNhcyx0bXUu
dHh0DQo+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZW5l
c2FzLHRtdS50eHQNCj4gPiA+IGluZGV4IDlkZmY3ZTUuLjI5MTU5ZjQgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVuZXNhcyx0bXUu
dHh0DQo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIv
cmVuZXNhcyx0bXUudHh0DQo+ID4gPiBAQCAtMTEsNiArMTEsNyBAQCBSZXF1aXJlZCBQcm9wZXJ0
aWVzOg0KPiA+ID4gICAgLSBjb21wYXRpYmxlOiBtdXN0IGNvbnRhaW4gb25lIG9yIG1vcmUgb2Yg
dGhlIGZvbGxvd2luZzoNCj4gPiA+ICAgICAgLSAicmVuZXNhcyx0bXUtcjhhNzc0MCIgZm9yIHRo
ZSByOGE3NzQwIFRNVQ0KPiA+ID4gICAgICAtICJyZW5lc2FzLHRtdS1yOGE3NzRhMSIgZm9yIHRo
ZSByOGE3NzRBMSBUTVUNCj4gPiA+ICsgICAgLSAicmVuZXNhcyx0bXUtcjhhNzc0YjEiIGZvciB0
aGUgcjhhNzc0QjEgVE1VDQo+ID4gPiAgICAgIC0gInJlbmVzYXMsdG11LXI4YTc3NGMwIiBmb3Ig
dGhlIHI4YTc3NEMwIFRNVQ0KPiA+ID4gICAgICAtICJyZW5lc2FzLHRtdS1yOGE3Nzc4IiBmb3Ig
dGhlIHI4YTc3NzggVE1VDQo+ID4gPiAgICAgIC0gInJlbmVzYXMsdG11LXI4YTc3NzkiIGZvciB0
aGUgcjhhNzc3OSBUTVUNCj4gPiA+DQo+ID4NCj4gPiBUaGUgcGF0Y2ggZG9lcyBub3QgYXBwbHkg
b24gdGlwL3RpbWVycw0KPiANCj4gVGhhdCdzIGV4cGVjdGVkLCBhcyBJIHF1ZXVlZCB0aGUgcHJl
dmlvdXMgY2hhbmdlIGluIHJlbmVzYXMtZHQtYmluZGluZ3MtZm9yLQ0KPiB2NS41LCBjZnIuDQo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJlbmVzYXMtc29jLzI0NGNhN2FjLTU0ZDEt
ZDA3ZC03NjJmLQ0KPiBlODMyYjBlMmEyNjdAbGluYXJvLm9yZy8NCj4gDQo+IERvIHlvdSB3YW50
IG1lIHRvIGtub3cgdGhpcyBpbiByZW5lc2FzLWR0LWJpbmRpbmdzLWZvci12NS41Pw0KDQo=
