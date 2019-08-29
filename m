Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65864A17C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 13:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfH2LIY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 07:08:24 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:13985
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726979AbfH2LIY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 07:08:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqSbV4WzyOXzDTtXCH8OFeQGPdhcjDoY/wI5gYt9+jteInbjTq43RxsYZSfan/b4vpXVOIJWvXHxxC5pQZwGWJgMOAGo2E9l6fml7pqmLXcqaG+RjXSYo17u0DHJe1YDiFBeh7tqZGGgjYFFk8jKQuhkhasBtVjpPkYIT4LLlbu9hlRBr0JmWzAFEICJxrUMFRycD5d9mpxvnXhg9GYxPtA1nuYxWNJI4SL4L27S7BtxNWJjlTxLck/l4eexeZVnrp/cFM8dsVNb5VL7FuxYeVPAYjYeYfqux1JWpTUqJdFH4Tu/gZMGb4WfU2/piTj/RcH8WTWNu1quaA+zYEszvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxuTuaUx4hSJB+N0WH/7moESLM+Cs7b6qePh8Zxb0eU=;
 b=krvn/cFWqG1cZQTg3YxCqyPR2iAQO91tGDkdfaZg9Qp0ENN+AVvNdniDD92WKPUzzT2LkuiqlZMJQd4fVvaIFT8rMqb7Qqg/pDw/PppuTxQZiJgREMnkCymSn2FplIlfFHaXgDIvuLqxYd3HwcfzCW48O7duat4X9TcnKZtSSaEwoP1n8SOtZZS4MrkATZAbA4G/4/kkw1uSHNMxwTksPeZ6Ip+NRwBwi+4iD2VC5OqP7dHwUNxvB0NMfG5pSvCn4EWSA0j5nDYsXd6B2Z6uas21AZbiT0R4f0llad3wugLKvAAqJ3RJ98imggJu3VxLKlxtoRA9SWbsOzkTxXX8mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxuTuaUx4hSJB+N0WH/7moESLM+Cs7b6qePh8Zxb0eU=;
 b=MtY/jHaj+NMUqiO4UPk3JjZAL63W3UPfz9Ikd3gM9+72wfJdZmXOGC96XCbYz5Q+M1l/U/C5A1F6Y3TK8q3roEvq2WY2uoG708rED2hWlCvFIWAGGx87cvY82qiRnF9Jpx7lwtCHi+IN+ugDEGn8T2TyxFZ4n94tEoRUFRW14P0=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1529.jpnprd01.prod.outlook.com (52.133.160.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 11:08:20 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd%5]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 11:08:20 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
Thread-Topic: [PATCH 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
Thread-Index: AQHVXlOc75b7f0oft0mKg/tJlOqEmqcR8pWAgAAD5QA=
Date:   Thu, 29 Aug 2019 11:08:19 +0000
Message-ID: <TY1PR01MB17706E2BF89687B4027F86E0C0A20@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1567074107-4899-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567074107-4899-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdW7asYJGC2+c-4=a6006K2WMjEAAigBLA+MTaFip03R+Q@mail.gmail.com>
In-Reply-To: <CAMuHMdW7asYJGC2+c-4=a6006K2WMjEAAigBLA+MTaFip03R+Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 935b32c3-e008-41f4-b6f7-08d72c713361
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1529;
x-ms-traffictypediagnostic: TY1PR01MB1529:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB15295445B2B376DEDDB081EEC0A20@TY1PR01MB1529.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(6029001)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(199004)(189003)(7416002)(26005)(81156014)(66066001)(71200400001)(54906003)(71190400001)(76176011)(14454004)(3846002)(8676002)(81166006)(7736002)(7696005)(52536014)(86362001)(6116002)(8936002)(316002)(99286004)(2906002)(6916009)(486006)(44832011)(5660300002)(76116006)(64756008)(66446008)(66946007)(256004)(33656002)(6506007)(476003)(66556008)(53546011)(102836004)(74316002)(66476007)(305945005)(186003)(446003)(4326008)(6436002)(478600001)(25786009)(11346002)(229853002)(55016002)(53936002)(6246003)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1529;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O/hECghyxmN0mlVznDcm+rDivauTJN91O1cEmMsv6Dv2hS3PFwyydI7KYydNMss9lWCQCJ1Fh7oP2xbqbeCV0oecAl58wRaS2mE8JCTNXeksy4jtiXtZMbDW413W4S0JlDNHGeqO+152hNB+cM7+7r2VCe2M7eUBtc2VTnwcAnfDc+IN0Tt6Yk/xQMd9gPsnoQIQP6FnkuMLIllsDzxJ8Q/4HVxEj7P4HFh7SsoupRxsOGFzWQSa/knOqTKSLF2mk7DHN4WNvBowZa6yMf9NNav8/jjroVTpRTibnVxVInWuQAbwcYSXQeS+c3d/UbUIH84D6rP/ubm0pkE5fgpLT0TkzVefMr7HydXYwXmk3XS5cN8SEfA3JWJGkLWyss8JNVfNMvHemrNO5XslHBEiaGO8DXoQcDv2gfy+yvtS7e4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935b32c3-e008-41f4-b6f7-08d72c713361
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 11:08:19.9523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SGECUPPJ3tFz7NxrPS8rwzEp0UX3MWT6+w6amzYUMIxP9SF+JoHc3bffbmM2Jep5TZkkiX/TouR8epCdKZk1viQ+VOToAgl34tSaIbmmEjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1529
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAyOSBBdWd1c3Qg
MjAxOSAxMTo1MQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gYXJtNjQ6IGR0czogcmVuZXNh
czogQWRkIEhpSG9wZSBSWi9HMk0gYm9hcmQgd2l0aCBpZGstMTExMHdyIGRpc3BsYXkNCj4gDQo+
IEhpIEZhYnJpemlvLA0KPiANCj4gT24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMTI6MjIgUE0gRmFi
cml6aW8gQ2FzdHJvDQo+IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+IHdyb3RlOg0K
PiA+IFRoZSBIaUhvcGUgUlovRzJNIGlzIGFkdmVydGlzZWQgYXMgY29tcGF0aWJsZSB3aXRoIHBh
bmVsIGlkay0xMTEwd3INCj4gPiBmcm9tIEFkdmFudGVjaCwgaG93ZXZlciB0aGUgcGFuZWwgaXNu
J3Qgc29sZCBhbG9uZ3NpZGUgdGhlIGJvYXJkLg0KPiA+IEEgbmV3IGR0cywgYWRkaW5nIGV2ZXJ5
dGhpbmcgdGhhdCdzIHJlcXVpcmVkIHRvIGdldCB0aGUgcGFuZWwgdG8NCj4gPiB3b3JrIHRoZSBI
aUhvcGUgUlovRzJNLCBpcyB0aGUgbW9zdCBjb252ZW5pZW50IHdheSB0byBzdXBwb3J0IHRoZQ0K
PiA+IEhpSG9wZSBSWi9HMk0gd2hlbiBpdCdzIGNvbm5lY3RlZCB0byB0aGUgaWRrLTExMTB3ci4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJv
QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAt
LS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
NGExLWhpaG9wZS1yemcybS1leC1pZGstMTExMHdyLmR0cw0KPiANCj4gPiArJmdwaW8xIHsNCj4g
PiArICAgICAgIC8qDQo+ID4gKyAgICAgICAgKiBXaGVuIEdQMV8yMCBpcyBMT1cgTFZEUzAgaXMg
Y29ubmVjdGVkIHRvIHRoZSBMVkRTIGNvbm5lY3Rvcg0KPiA+ICsgICAgICAgICogV2hlbiBHUDFf
MjAgaXMgSElHSCBMVkRTMCBpcyBjb25uZWN0ZWQgdG8gdGhlIExUODkxOEwNCj4gPiArICAgICAg
ICAqLw0KPiA+ICsgICAgICAgbHZkcy1jb25uZWN0b3ItZW4tZ3Bpb3sNCj4gDQo+IE1pc3Npbmcg
c3BhY2UgYmVmb3JlIGN1cmx5IGJyYWNlLg0KDQpEb2gsIHRoYW5rIHlvdSBmb3Igc3BvdHRpbmcg
dGhpcywgSSdsbCBzZW5kIGEgdjIuDQoNCkNoZWVycywNCkZhYg0KDQo+IA0KPiBHcntvZXRqZSxl
ZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0K
PiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25z
IHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
LSBMaW51cyBUb3J2YWxkcw0K
