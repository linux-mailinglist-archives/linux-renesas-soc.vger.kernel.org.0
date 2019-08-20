Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBF3961CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 16:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730023AbfHTOAA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 10:00:00 -0400
Received: from mail-eopbgr1410090.outbound.protection.outlook.com ([40.107.141.90]:57216
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729992AbfHTN77 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 09:59:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXNPTmKJVgwUqWf8sU5Ysn6WdMyQ+1AlolByQgGTtD5cuf+vljWrutzBytX932K85o45nlt0Hapd+BF8MwDWScu22M5WP60kAHk+czklZC4HDgCAlPkpdUSAJaJ3BNgLTlO9Yy3ckvc3x/BQQN5kz/8kxBEXmfj1Z16eHPdRB83B37KwBdI3KlmPygldCLQlsUvXKXffFRs/IPIxqHg+napONcrVYlGvHEvlGR2E3AKYX38pJKmfdCrnOBmwLhxbGnYiyiksH5YRsYFKwokrG+adWOzYkTy1XRgZRXoIL2A0bvgCs+xi0nRBnREu0vURCBI0C0YRVwdrSL6vH02edw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pRwG2eLIqALzr+Og8LrtPgYD3jgz5u2gaJJsLU4hKY=;
 b=VLgH73YQQVqMQCPK1G5cY0XLmp5rhRH+e11ndMxTNpInArp6yDsH1NbIePi2FSs4v0J1ma3GYSsUWcoN52Ap4tC9atpB6TSS0p0WMxfWzqyxL+gNVAz/bpLL5bZKPaf5Q0iLvowDyIUhrUtNgllpn6ZAfqqdk/wwom0f6RE/DcULzgscBATGeu1hTiOBOYfLJvC2pUFSEK219ql1bhRUgyKMVr1gUIVmDFgCQJrdOqbJf9gDpEeS+s8FUd0eL5kqdriYTzlzn/TCzSkOnP4KjS7hpKeFfqGhwjpp5JB/dzVy++ZHxe5/ztNqHvecv07YtYSpiGDpZr7dRGOZEW4cWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pRwG2eLIqALzr+Og8LrtPgYD3jgz5u2gaJJsLU4hKY=;
 b=YJInKVjUqkAWl5XmXKel5okcbBhwKhyLjNGDGikDgRmEPfrOtVGf0D92oiNcIc+58nDIx6exgVnRS2HSH5i7Unl0xYqDo6yiEdAuFONMbGy5Slw45zgGXB64Z92InbR5pkfoZOnIiIjoJ2UPjQdgfhzWGsr01LDXsjGb2yQnuM8=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1755.jpnprd01.prod.outlook.com (52.133.161.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 13:59:55 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd%5]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 13:59:55 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH v2 9/9] arm64: dts: renesas: Add EK874 board with
 idk-2121wr display support
Thread-Topic: [PATCH v2 9/9] arm64: dts: renesas: Add EK874 board with
 idk-2121wr display support
Thread-Index: AQHVU1lcoRxEQVUf1UOIA+jduAsu36cCZWkAgAGw67A=
Date:   Tue, 20 Aug 2019 13:59:55 +0000
Message-ID: <TY1PR01MB1770B6108929C74EC4064345C0AB0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-10-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdW9Lx_x=tgTXxpKAqTxY5w_b06y7Httky-ks8jj3zQHBg@mail.gmail.com>
In-Reply-To: <CAMuHMdW9Lx_x=tgTXxpKAqTxY5w_b06y7Httky-ks8jj3zQHBg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0387fff-3c4a-4c43-aecc-08d72576ae38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TY1PR01MB1755;
x-ms-traffictypediagnostic: TY1PR01MB1755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1755308B5C6DAB321317C52CC0AB0@TY1PR01MB1755.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(256004)(4326008)(7736002)(76176011)(7696005)(66446008)(64756008)(86362001)(74316002)(5660300002)(11346002)(446003)(44832011)(476003)(486006)(81156014)(6116002)(81166006)(3846002)(6916009)(2906002)(229853002)(14454004)(478600001)(54906003)(8676002)(76116006)(99286004)(8936002)(71200400001)(25786009)(71190400001)(33656002)(316002)(66946007)(66066001)(6436002)(7416002)(66476007)(55016002)(6246003)(66556008)(52536014)(305945005)(53546011)(6506007)(102836004)(186003)(26005)(9686003)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1755;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AW3AkkUWFnAjN/sgRbguCuPKo0hVZEeJDRV6HwP4P1k82uOhzN7HMLnEuOKtnKAS8GrEc/+xPuwTm0l2rS81g7lra1PN7QbrlSNdJcB7aDF6S/T6t6C96T3ovXE0GPT+oLkSPMQJ9CFqC6M7h4BbIyep+XNQ/igJEhHrERVxOn8vj6yVFVGtf+Myg9gAFftCdBiOPfHqqC5UzYBYfUkufh928N2ZUpIhnMAGPmfukxZBDfyIxOyjO7VlZW06xOoNHQy1CXpEB6hOgYbVjB0Y4luLHPy10Vo/bk5pbDTi4lObRb/OoEWKXfcdTJEvyGaPRxh+Tai9+ZYzzWj2d47weHzb9J1T7JrQQU8c7WDFtpfQ9o4k5ov5JPvGeVYuhXGKNTD5OWDqTp7rZ8+kqdquanUijqQWwtj2CN+7l5qXHFA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0387fff-3c4a-4c43-aecc-08d72576ae38
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 13:59:55.3704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZriDyhx5GrpbpmMTST+RtuVOePJWdPBhxrBhgitibTCFXO1Tt2ERqVLTVuH/T7XOJJo50gyopSm2AM0AOvKarAEL7UYaelAiOI7nvPQIBtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1755
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxOSBBdWd1
c3QgMjAxOSAxMzowMw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDkvOV0gYXJtNjQ6IGR0czog
cmVuZXNhczogQWRkIEVLODc0IGJvYXJkIHdpdGggaWRrLTIxMjF3ciBkaXNwbGF5IHN1cHBvcnQN
Cj4gDQo+IEhpIEZhYnJpemlvLA0KPiANCj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTowNSBQ
TSBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4gd3Jv
dGU6DQo+ID4gVGhlIEVLODc0IGlzIGFkdmVydGlzZWQgYXMgY29tcGF0aWJsZSB3aXRoIHBhbmVs
IElESy0yMTIxV1IgZnJvbQ0KPiA+IEFkdmFudGVjaCwgaG93ZXZlciB0aGUgcGFuZWwgaXNuJ3Qg
c29sZCBhbG9uZ3NpZGUgdGhlIGJvYXJkLg0KPiA+IEEgbmV3IGR0cywgYWRkaW5nIGV2ZXJ5dGhp
bmcgdGhhdCdzIHJlcXVpcmVkIHRvIGdldCB0aGUgcGFuZWwgdG8NCj4gPiB0byB3b3JrIHdpdGgg
dGhlIEVLODc0LCBpcyB0aGUgbW9zdCBjb252ZW5pZW50IHdheSB0byBzdXBwb3J0IHRoZQ0KPiA+
IEVLODc0IHdoZW4gaXQncyBjb25uZWN0ZWQgdG8gdGhlIElESy0yMTIxV1IuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2Fz
LmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gR2VlcnQsDQo+ID4N
Cj4gPiBhdCB0aGlzIHBvaW50IGluIHRpbWUgbm8gb3RoZXIgYm9hcmQgdXNlcyB0aGlzIGRpc3Bs
YXksIGNhbiB3ZQ0KPiA+IHBvc3Rwb25lIHRoZSBjcmVhdGlvbiBvZiB0aGUgLmR0c2kgZmlsZSB0
byB3aGVuIHRoZXJlJ2xsIGJlIGFub3RoZXINCj4gPiB1c2VyIChpZiBhbnkpPw0KPiANCj4gT0su
DQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc0YzAtZWs4NzQtaWRrLTIxMjF3ci5kdHMNCj4gDQo+ID4gKyZsdmRzMCB7DQo+
ID4gKyAgICAgICByZW5lc2FzLHN3YXAtZGF0YTsNCj4gDQo+IFdhc24ndCB0aGF0IHByb3BlcnR5
IGRyb3BwZWQ/DQoNClllYWgsIGxlZnRvdmVyIGZyb20gdGhlIHByZXZpb3VzIHNlcmllcywgc29y
cnkgYWJvdXQgdGhhdC4gQW55aG93LCB3ZSBiZXR0ZXIgZGVjaWRlDQpob3cgdG8gaW1wbGVtZW50
IHRoZSBzd2FwcGluZyBiZWZvcmUgZG9pbmcgYW55dGhpbmcgd2l0aCB0aGUgRFQgcmVsYXRlZCBw
YXRjaC4NCg0KVGhhbmtzIQ0KRmFiDQoNCj4gDQo+IEknZCBiZSBncmF0ZWZ1bCBpZiBhbnlvbmUg
Y291bGQgcmV2aWV3IHRoZSBwYW5lbCBwYXJ0cy4NCj4gVGhhbmtzIQ0KPiANCj4gR3J7b2V0amUs
ZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0N
Cj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMNCg==
