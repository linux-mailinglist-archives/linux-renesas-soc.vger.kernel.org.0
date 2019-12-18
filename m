Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091D4124906
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 15:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfLROFr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 09:05:47 -0500
Received: from mail-eopbgr1400117.outbound.protection.outlook.com ([40.107.140.117]:34784
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726856AbfLROFq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 09:05:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOrUKZt9W8gbgT90boOi9WG1XH5nCbHnMt0uZddN1pCTOD+WLjwMRh8EjnkANcPtkHERqFkhHjNdhOPfmkEtNUso620L8ZtEMBKlYXwFu6YVszAT4yN5imyQu2pC2n9cqnQro9NHt6Bdu3y5Np+3u8ceKPtHELKfr1yU60JwZeC9Nanp/HyelNGg4yJLQ/V2Em3CcnGyoUY/VcQmks7h2DaXSg3DZKCExL1DS9/CDF9e3KkAdyBLcbNx+4oTZNeAJdOmRKe/5OUv35y8Q9dl0bTEOUy1c/0Kh9NsOdvtOVFTb8oLRd2ULtVODgtgOL3L2nFNpygbJLG4A25XzayA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiEieY7Ft9mKYf0jzEXpRDaIzRRubLziMmCw/Ov5sIE=;
 b=SnHusWg4B71miToAngucAxbpVK8ymwKb7VcONUmbWjThEzAUkQUuQQgu2x9cIS+oMafVeEPt8BrLAJ3P9rkHcnwn91IvEA4v0ZHLnvrtkCnHHtaxs2qRevx+oDWD4rYO8AraQ+fPfIcDFxYHQwRuVSp9muihWGGKtg6uMNJAI+ZMHug8LVFWo6pJtzU53usQliGGtg/NF+4l9JgPaLlzRCnaNU9V9ih7ZSIWFiOCi0IhfjNdPsG08M5A1BVY8KLrucJ6878yo+C+GCQQqcnT3TkRGM+Z/ly4qGd0sy8iRlXV/pRjcxXIK0S8bobMVGietfmbPoOQG0wz0Qex5KtUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiEieY7Ft9mKYf0jzEXpRDaIzRRubLziMmCw/Ov5sIE=;
 b=q6D2oZ6NBpije2kA90NSUDhFZ2huGY2A/B38DjU01AogizrE/mxpVqGdvK7MybBwwaCCzI8a6XQpXpg6UXit1/C3jUpKLguYIBXcqJqE9ZhjTdQDBvANml8ndIIsBqHkKq2yE3hT0Prz6V6bj9qPucV6iV4kC1wYhzCDQU1JVfs=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1820.jpnprd01.prod.outlook.com (52.133.164.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.20; Wed, 18 Dec 2019 14:05:42 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 14:05:42 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
CC:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: RE: [PATCH v4 00/13] Add LCD panel support to iwg20d
Thread-Topic: [PATCH v4 00/13] Add LCD panel support to iwg20d
Thread-Index: AQHVmjo/M6ipYgFTGkKGMRHUnVLV3Ke//tUAgAAlB0A=
Date:   Wed, 18 Dec 2019 14:05:42 +0000
Message-ID: <TY1PR01MB177012F63EC99A0B209B89F8C0530@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <41b59b13-1c8d-a407-8fd8-f2d8cfadd43d@baylibre.com>
In-Reply-To: <41b59b13-1c8d-a407-8fd8-f2d8cfadd43d@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d47e64b1-c6dd-4744-6375-08d783c35ea1
x-ms-traffictypediagnostic: TY1PR01MB1820:|TY1PR01MB1820:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB182087980D482AED828FAB6DC0530@TY1PR01MB1820.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(189003)(199004)(54906003)(110136005)(2906002)(26005)(33656002)(316002)(66476007)(4326008)(44832011)(86362001)(66556008)(19627235002)(71200400001)(186003)(52536014)(7416002)(9686003)(81166006)(8676002)(8936002)(66946007)(53546011)(66446008)(6506007)(7696005)(76116006)(55016002)(478600001)(64756008)(5660300002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1820;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Nsq3Tgi2MlFTZMQZ+54NLKzv9LBLijkwWhexXfsFdWmq7F7oD5ZgdCQnicYOntKtwFIWqTwswIkZQukVQVefrllDWZWh5uaQvvtFAYqHKw/1vzcXpAa2FIWb7I7xq7A4Ye9SU66exq0nucclxWcxb6XVqO0f79PMZs+HYFWDmqp61BLmu0HZjRPLY22Dv/yHJthSzJEkxfqDINYi9s2aXgFOJvyxd4FK84nhqZ6ExJ5untqsEssaD1b+h0Zh2eim0eGlZoAzosoixBNSud8DKm6BvWW3oUYwAssg6wHvhDjIKDxJ9n+dUnM5/8xM6V+3X1/q7nj43R4Y3Khr0hC4ObPNAMtYj8jiyx+EX/Sk46PyZw6AjuvdtJR+vxNNP7rz5eQDhB2Cguu//D2cvEJXiv/ND5oMAq3OELhsOUj8LWeSMTpzmT0Vnj2iEAHDOo5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47e64b1-c6dd-4744-6375-08d783c35ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 14:05:42.4561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KjboJNMPyY30Dm0ESsxl3TjHbwTLc0bucbNxXp54BgpPAEaZq9CoOqqrlpB9afwh69uRrav97J6jKRLQEERNNoFwvUVENGfwxhJX002N1i0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1820
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTmVpbCwNCg0KDQo+IEZyb206IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJl
LmNvbT4NCj4gU2VudDogMTggRGVjZW1iZXIgMjAxOSAxMTo1Mw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0IDAwLzEzXSBBZGQgTENEIHBhbmVsIHN1cHBvcnQgdG8gaXdnMjBkDQo+IA0KPiBIaSwN
Cj4gDQo+IE9uIDEzLzExLzIwMTkgMTY6NTEsIEZhYnJpemlvIENhc3RybyB3cm90ZToNCj4gPiBU
aGUgaVctUmFpbmJvVy1HMjBELVFzZXZlbiBSWi9HMU0sRzFOIFFzZXZlbiBEZXZlbG9wbWVudCBQ
bGF0Zm9ybQ0KPiA+IGNvbWVzIHdpdGggYSA3IiBjYXBhY2l0aXZlIGRpc3BsYXkga2l0IGZyb20g
RW1lcmdpbmcgRGlzcGxheQ0KPiA+IFRlY2hub2xvZ2llcyBDb3Jwb3JhdGlvbiAoRURUKS4gVGhp
cyBzZXJpZXMgYWRkcyBhbGwgdGhhdCdzDQo+ID4gbmVjZXNzYXJ5IGZvciBzdXBwb3J0aW5nIGl0
Lg0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IEZhYg0KPiA+DQo+ID4gdjMtPnY0Og0KPiA+ICogUmV3
b3JrZWQgYWNjb3JkaW5nIHRvIExhdXJlbnQncyBhbmQgSmFjb3BvJ3MgY29tbWVudHMNCj4gPiB2
Mi0+djM6DQo+ID4gKiBTcGxpdCB0aGUgZHQtc2NoZW1hIHBhdGNoIGluIHR3byBwYXRjaGVzIGFz
IHBlciBSb2IncyBjb21tZW50DQo+ID4gKiBNYWRlIGZpeGVzIHRvIHRoZSBkdC1zY2hlbWEgYWNj
b3JkaW5nIHRvIFJvYidzIGNvbW1lbnQNCj4gPiAqIE1hZGUgZml4ZXMgdG8gdGhlIGx2ZHMtY29k
ZWMgZHJpdmVyIGFjY29yZGluZyB0byBKYWNvcG8ncyBjb21tZW50cw0KPiA+ICogQWRkZWQgdHdv
IG5ldyBwYXRjaGVzOg0KPiA+ICAgKiBkcm06IERlZmluZSBEUk1fTU9ERV9DT05ORUNUT1JfUEFS
QUxMRUwNCj4gPiAgICogZHJtL3BhbmVsOiBwYW5lbC1zaW1wbGU6IEFkZCBjb25uZWN0b3IgdHlw
ZSBmb3IgZXRtMDcwMGcwZGg2DQo+ID4gdjEtPnYyOg0KPiA+ICogQ29udmVydCBkdC1iaW5kaW5n
cyB0byBkdC1zY2hlbWENCj4gPg0KPiA+IEZhYnJpemlvIENhc3RybyAoMTMpOg0KPiA+ICAgZHQt
YmluZGluZ3M6IGRpc3BsYXk6IGJyaWRnZTogQ29udmVydCBsdmRzLXRyYW5zbWl0dGVyIGJpbmRp
bmcgdG8NCj4gPiAgICAganNvbi1zY2hlbWENCj4gPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBi
cmlkZ2U6IGx2ZHMtdHJhbnNtaXR0ZXI6IERvY3VtZW50DQo+ID4gICAgIHBvd2VyZG93bi1ncGlv
cw0KPiA+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IGJyaWRnZTogbHZkcy10cmFuc21pdHRlcjog
QWJzb3JiIHRpLGRzOTBjMTg1LnR4dA0KPiA+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IGJyaWRn
ZTogbHZkcy10cmFuc21pdHRlcjogRG9jdW1lbnQNCj4gPiAgICAgInRpLHNuNzVsdmRzODMiDQo+
ID4gICBkcm0vYnJpZGdlOiBSZXB1cnBvc2UgbHZkcy1lbmNvZGVyLmMNCj4gPiAgIGRybS9icmlk
Z2U6IGx2ZHMtY29kZWM6IEFkZCAibHZkcy1kZWNvZGVyIiBzdXBwb3J0DQo+ID4gICBkcm0vYnJp
ZGdlOiBsdmRzLWNvZGVjOiBTaW1wbGlmeSBwYW5lbCBEVCBub2RlIGxvY2FsaXNhdGlvbg0KPiA+
ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IGJyaWRnZTogUmVwdXJwb3NlIGx2ZHMtZW5jb2Rlcg0K
PiA+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IGJyaWRnZTogbHZkcy1jb2RlYzogRG9jdW1lbnQg
dGksZHM5MGNmMzg0YQ0KPiA+ICAgQVJNOiBkdHM6IGl3ZzIwZC1xNy1jb21tb246IEFkZCBMQ0Qg
c3VwcG9ydA0KPiA+ICAgQVJNOiBzaG1vYmlsZV9kZWZjb25maWc6IEVuYWJsZSBzdXBwb3J0IGZv
ciBwYW5lbHMgZnJvbSBFRFQNCj4gPiAgIFtIQUNLXSBkcm0vYnJpZGdlOiBsdmRzLWNvZGVjOiBF
bmZvcmNlIGRldmljZSBzcGVjaWZpYyBjb21wYXRpYmxlDQo+ID4gICAgIHN0cmluZ3MNCj4gPiAg
IFtIQUNLXSBkdC1iaW5kaW5nczogZGlzcGxheTogYnJpZGdlOiBsdmRzLWNvZGVjOiBBYnNvcmIN
Cj4gPiAgICAgdGhpbmUsdGhjNjNsdmRtODNkLnR4dA0KPiA+DQo+ID4gIC4uLi9iaW5kaW5ncy9k
aXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwgICAgICAgIHwgMTMxICsrKysrKysrKysrKysr
Kw0KPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQg
ICB8ICA2NiAtLS0tLS0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGhpbmUs
dGhjNjNsdmRtODNkLnR4dCB8ICA1MCAtLS0tLS0NCj4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL3RpLGRzOTBjMTg1LnR4dCAgICAgICAgfCAgNTUgLS0tLS0tLQ0KPiA+ICBhcmNoL2Fy
bS9ib290L2R0cy9pd2cyMGQtcTctY29tbW9uLmR0c2kgICAgICAgICAgICB8ICA4NSArKysrKysr
KysrDQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1kYmNtLWNhLmR0c2kgICAgICAg
ICAgIHwgICAxIC0NCj4gPiAgYXJjaC9hcm0vY29uZmlncy9zaG1vYmlsZV9kZWZjb25maWcgICAg
ICAgICAgICAgICAgfCAgIDMgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICB8ICAgOCArLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiA+ICAuLi4vZHJtL2JyaWRn
ZS97bHZkcy1lbmNvZGVyLmMgPT4gbHZkcy1jb2RlYy5jfSAgICB8IDE3OSArKysrKysrKysrKysr
LS0tLS0tLS0NCj4gPiAgMTAgZmlsZXMgY2hhbmdlZCwgMzMzIGluc2VydGlvbnMoKyksIDI0NyBk
ZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwNCj4gPiAgZGVsZXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dA0KPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RoaW5lLHRoYzYzbHZk
bTgzZC50eHQNCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSxkczkwYzE4NS50eHQNCj4gPiAgcmVuYW1lIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2Uve2x2ZHMtZW5jb2Rlci5jID0+IGx2ZHMtY29kZWMuY30gKDI1
JSkNCj4gPg0KPiANCj4gQXBwbHlpbmcgcGF0Y2hlcyAxLT45IGFuZCAxMyB0byBkcm0tbWlzYy1u
ZXh0IHdpdGggY29ycmVjdCBTb0IuDQo+IA0KPiBBbHNvIGFwcGxpZWQgY2hhbmdlIG9uIHBhdGNo
IDggd2hpbGUgYXBwbHlpbmcuDQo+IA0KPiBBbmQgY2hlY2tlZCB0aGUgZGlmZiBpcyB0aGUgc2Ft
ZSBhcyBsYXVyZW50J3MgUFIuDQoNClRoYW5rIHlvdS4NCg0KRmFiDQoNCj4gDQo+IE5laWwNCg==
