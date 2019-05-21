Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7238B24BDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 11:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfEUJmx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 05:42:53 -0400
Received: from mail-eopbgr1410102.outbound.protection.outlook.com ([40.107.141.102]:5376
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726242AbfEUJmx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 05:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0F+i24whTvt0i1uQMCTNnBmxnKlQ2oUAJOUaurMOMgk=;
 b=mnlJv2jEQdQbCuulkBpNOExfGL+EUPaCyVf/GLe3KSRqsD+juoj7Ywv+GaeA+lgmDkz9Uf83JE0uRuFvqYccJsgEGT0DYlZ5QR8/Lyc9XGFoLnS2QGfbhDAm7K86RhOIqwnDNL8aqVQxFGx/6WubFknRzXBksM5fFqET4P3SqKA=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3701.jpnprd01.prod.outlook.com (20.178.96.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Tue, 21 May 2019 09:42:48 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 09:42:48 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree binding
 document
Thread-Topic: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree binding
 document
Thread-Index: AQHVCxgM+eh9qHNmG0u9jtRSG8piA6ZsWwAAgAkAz+A=
Date:   Tue, 21 May 2019 09:42:47 +0000
Message-ID: <OSBPR01MB21033FCDE1A5965435AC4841B8070@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
 <c9b3ee90-9292-320c-4e22-8f989d829497@cogentembedded.com>
In-Reply-To: <c9b3ee90-9292-320c-4e22-8f989d829497@cogentembedded.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68f60856-5fde-4ccd-b5ce-08d6ddd0af51
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3701;
x-ms-traffictypediagnostic: OSBPR01MB3701:
x-microsoft-antispam-prvs: <OSBPR01MB37018C1D1D2F2B3958B03CEDB8070@OSBPR01MB3701.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(376002)(366004)(136003)(346002)(199004)(51914003)(189003)(76116006)(54906003)(14454004)(4326008)(73956011)(110136005)(68736007)(8936002)(11346002)(55016002)(52536014)(66556008)(64756008)(478600001)(9686003)(66446008)(53936002)(5660300002)(25786009)(229853002)(76176011)(66476007)(7696005)(66946007)(66066001)(6116002)(44832011)(7416002)(3846002)(6506007)(7736002)(26005)(33656002)(53546011)(99286004)(74316002)(305945005)(186003)(476003)(86362001)(102836004)(2906002)(8676002)(446003)(6436002)(81166006)(71200400001)(71190400001)(486006)(5024004)(256004)(81156014)(316002)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3701;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ktunc3c2uqyOT4pnQXAth5V525h7ZYIO7NMuQnToXW6M23oiu1BfLXH1V+CIK/Etdxh21syfXbEfZf19X8dYlPg+c+LtIm1mrRTJlwhUenjZ3IOI/fI5JSkdj7RA/Zbq+qqCAcjxhFpMpfSpUGuTSDvSUMhkMpoe5qpvJ0/U0yo6Fn3UzsO48uMIOz6PIBgKwNpkdBb50uVeji03Zv/6u+5omUXV9EMaAKnASrj0t9Fqdp+wwxPu6MffvV2Q0AiYABmqsM8GIh1qWUke06Kkp/qxOB0JSb5sHYBinDmYWDRnzyxhoI0NGWlLfXmn5g30FyVzt8xcTFT2JOT0+7iu5ykBDQY7w74JaOFXtE5WZKf9GOFV86nvaWHRKR5PiX/mZVAF5CNHqqUSOmJxi2N8bYJQFQB38IZX3Z8gP9nEbPg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f60856-5fde-4ccd-b5ce-08d6ddd0af51
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 09:42:48.0389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3701
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2VpLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY2IDEvN10gZHQtYmluZGluZ3M6IHVzYjogaGQzc3MzMjIwIGRldmljZSB0cmVlIGJp
bmRpbmcNCj4gZG9jdW1lbnQNCj4gDQo+IEhlbGxvIQ0KPiANCj4gT24gMDUvMTUvMjAxOSAwMzow
OSBQTSwgQmlqdSBEYXMgd3JvdGU6DQo+IA0KPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5nIGRv
Y3VtZW50IGZvciBUSSBIRDNTUzMyMjAgVHlwZS1DIERSUCBwb3J0DQo+ID4gY29udHJvbGxlciBk
cml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVu
ZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
DQo+ID4gLS0tDQo+ID4gVjUtLT5WNg0KPiA+ICAgKiBObyBjaGFuZ2UuDQo+ID4gVjQtLT5WNQ0K
PiA+ICAgKiBObyBDaGFuZ2UuDQo+ID4gVjMtLT5WNA0KPiA+ICAgKiBObyBDaGFuZ2UuDQo+ID4g
VjItLT5WMw0KPiA+ICAgKiBBZGRlZCBSb2IncyBSZXZpZXdlZCBieSB0YWcuDQo+ID4gVjEtLT5W
Mg0KPiA+ICAgKiBBZGRlZCBjb25uZWN0b3Igbm9kZS4NCj4gPiAgICogdXBkYXRlZCB0aGUgZXhh
bXBsZSB3aXRoIGNvbm5lY3RvciBub2RlLg0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy91c2IvdGksaGQzc3MzMjIwLnR4dCAgICAgICB8IDM3DQo+ICsrKysrKysrKysrKysr
KysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykNCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Vz
Yi90aSxoZDNzczMyMjAudHh0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi90aSxoZDNzczMyMjAudHh0DQo+ID4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3RpLGhkM3NzMzIyMC50eHQNCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLjdmNDE0MDANCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi90aSxo
ZDNzczMyMjAudHh0DQo+ID4gQEAgLTAsMCArMSwzNyBAQA0KPiA+ICtUSSBIRDNTUzMyMjAgVHlw
ZUMgRFJQIFBvcnQgQ29udHJvbGxlci4NCj4gPiArDQo+ID4gK1JlcXVpcmVkIHByb3BlcnRpZXM6
DQo+ID4gKyAtIGNvbXBhdGlibGU6IE11c3QgYmUgInRpLGhkM3NzMzIyMCIuDQo+ID4gKyAtIHJl
ZzogSTJDIHNsYXZlIGFkZHJlc3MsIG11c3QgYmUgMHg0NyBvciAweDY3IGJhc2VkIG9uIEFERFIg
cGluLg0KPiA+ICsgLSBpbnRlcnJ1cHRzOiA8YSBiPiB3aGVyZSBhIGlzIHRoZSBpbnRlcnJ1cHQg
bnVtYmVyIGFuZCBiIHJlcHJlc2VudHMgYW4NCj4gPiArICAgZW5jb2Rpbmcgb2YgdGhlIHNlbnNl
IGFuZCBsZXZlbCBpbmZvcm1hdGlvbiBmb3IgdGhlIGludGVycnVwdC4NCj4gDQo+ICAgIFRoaXMg
ZGVwZW5kcyBvbiBhbiBpbnRlcnJ1cHQgY29udHJvbGxlciB1c2VkLiBJJ2QganVzdCBzYWlkICJh
biBpbnRlcnJ1cHQNCj4gc3BlY2lmaWVyIiwgdy9vIGZ1cnRoZXIgZGV0YWlscy4NCg0KRmluZSAs
IElmIGl0IGlzIG9rIGZvciBldmVyeW9uZS4gDQoNClJlZ2FyZHMsDQpCaWp1DQo+ID4gKw0KPiA+
ICtSZXF1aXJlZCBzdWItbm9kZToNCj4gPiArIC0gY29ubmVjdG9yIDogVGhlICJ1c2ItYy1jb25u
ZWN0b3IiIGF0dGFjaGVkIHRvIHRoZSBoZDNzczMyMjAgY2hpcC4gVGhlDQo+ID4gKyAgIGJpbmRp
bmdzIG9mIHRoZSBjb25uZWN0b3Igbm9kZSBhcmUgc3BlY2lmaWVkIGluOg0KPiA+ICsNCj4gPiAr
CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rv
ci50eHQNCj4gPiArDQo+IFsuLi5dDQo+IA0KPiBNQlIsIFNlcmdlaQ0K
