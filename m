Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 256D74A5F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 17:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbfFRP4W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 11:56:22 -0400
Received: from mail-eopbgr1410115.outbound.protection.outlook.com ([40.107.141.115]:30271
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729246AbfFRP4W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 11:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJVkJe+4gs4HlkwXIszF3yC+2bZbjKyHNALoY8oXbaI=;
 b=ZAqzMpKEkMFNSZ1B4oZ73eMZlqrSzTTAynfpXy63v/YhNeyHWtsuoSvw4YBo4G5CpbMRkIG4iH2ZlQtScwqMpMVDYSjImk4S0DydHux1dlXjLvwjpOUW6vz9Qvxob1VCtUaLsveIw40xBodNRd3emJZvTQhc9UtJVxX/6KArjtg=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1481.jpnprd01.prod.outlook.com (52.133.160.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Tue, 18 Jun 2019 15:56:17 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 15:56:17 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: RE: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
Thread-Topic: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
Thread-Index: AQHVIrOD4fCNYWErgUiYJbbykExq36ahinuAgAAEL9A=
Date:   Tue, 18 Jun 2019 15:56:17 +0000
Message-ID: <TY1PR01MB17707C3C979FB60611FB34A7C0EA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdU8oag+1oNa_jS=v99W05=8SRLhdoZdCusmeVf1VZbarQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU8oag+1oNa_jS=v99W05=8SRLhdoZdCusmeVf1VZbarQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58bf447f-394c-4e8c-66ab-08d6f4057fd6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1481;
x-ms-traffictypediagnostic: TY1PR01MB1481:
x-microsoft-antispam-prvs: <TY1PR01MB14814F174F269F0D89E3058DC0EA0@TY1PR01MB1481.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(39860400002)(346002)(366004)(189003)(199004)(33656002)(8936002)(486006)(81156014)(71200400001)(53936002)(81166006)(71190400001)(102836004)(52536014)(86362001)(6116002)(3846002)(53546011)(6506007)(8676002)(5660300002)(26005)(66066001)(74316002)(66556008)(186003)(66446008)(66476007)(66946007)(76116006)(7736002)(305945005)(6916009)(55016002)(2906002)(68736007)(14454004)(64756008)(9686003)(478600001)(6246003)(7696005)(99286004)(476003)(73956011)(25786009)(4326008)(446003)(6436002)(316002)(44832011)(256004)(76176011)(229853002)(11346002)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1481;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VpDpLxpIEdbl6Wm6++4GLwyJDCiVUe4A0G/YneC4oEAdXBU8TTBqZp+MbmuTYWHsNPAPlwcNRgntlNoNzih+JKtcro88VZUzDtMZIkoVbbrj2x/yCrP+7yokQ8oI93cZePEmSo9rw5R4aZCdfVqacVrC5gSXnxapeKcHvJMA+SE/Ghm7ESDsPA4H0PTN6r4Yi2idcV32lv0tg27qqKdYDfyAUi9vIqjQCULMyq87yJ1SD3vVNdWID1/AtCf0MySYjUJG2uCctx8Yjv40dQTMqCBCjNlUaCZh21QgnnuOm42/WbReLZlReEaPEMTNUELWR0XloaGmzFa4nQvu95nObw8IGuLzOBxtdlTEFa7lxDYD8DyKUNw+kmqVJfDQ9WgtcyXFvStX5QZj6Vd6JPPxRqxxARH8MfSDAahuxA8rEBQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bf447f-394c-4e8c-66ab-08d6f4057fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 15:56:17.4276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1481
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBs
aW51eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LXJlbmVzYXMtc29j
LW93bmVyQHZnZXIua2VybmVsLm9yZz4gT24gQmVoYWxmIE9mIEdlZXJ0IFV5dHRlcmhvZXZlbg0K
PiBTZW50OiAxOCBKdW5lIDIwMTkgMTY6MTANCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gYXJtNjQ6
IGR0czogcmVuZXNhczogaGlob3BlLWNvbW1vbjogQWRkIExFRHMgc3VwcG9ydA0KPiANCj4gSGkg
RmFicml6aW8sDQo+IA0KPiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCAzOjE3IFBNIEZhYnJpemlv
IENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBU
aGlzIHBhdGNoIGFkZHMgTEVEcyBzdXBwb3J0IHRvIHRoZSBIaUhvcGUgUlovRzJbTU5dIE1haW4g
Qm9hcmQNCj4gPiBjb21tb24gZGV2aWNlIHRyZWUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBG
YWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRo
YW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL2hpaG9wZS1jb21tb24uZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9oaWhvcGUtY29tbW9uLmR0c2kNCj4gPiBAQCAtMTcsNiArMTcsMzAgQEANCj4gPiAg
ICAgICAgICAgICAgICAgc3Rkb3V0LXBhdGggPSAic2VyaWFsMDoxMTUyMDBuOCI7DQo+ID4gICAg
ICAgICB9Ow0KPiA+DQo+ID4gKyAgICAgICBsZWRzIHsNCj4gPiArICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJncGlvLWxlZHMiOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgbGVkMCB7
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ3Bpb3MgPSA8JmdwaW82IDExIEdQSU9fQUNU
SVZFX0hJR0g+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gIkxFRDAiOw0K
PiANCj4gVGhlcmUncyBubyBuZWVkIGZvciBhIGxhYmVsIHByb3BlcnR5LCBpZiBpdCBtYXRjaGVz
IHRoZSBub2RlIG5hbWUNCj4gKGFwcGxpZXMgdG8gYWxsIGZvdXIgTEVEcykuDQoNCkkgY291bGQg
aGF2ZSB1c2VkIHRoZSBhY3R1YWwgbmFtZXMgb24gdGhlIHNjaGVtYXRpYywgYnV0IHRoZW4gSSBy
ZWFsaXNlZCB0aGF0DQp3b3VsZCBub3QgaGF2ZSBiZWVuIHRvbyBoZWxwZnVsIGR1ZSB0byB0aGUg
Y29ycmVzcG9uZGluZyBzd2l0Y2ggbmFtZXM6DQpMRUQwIC0gR1A2XzExIC0gU1cyMjAyIC0gTEVE
MjIwMQ0KTEVEMSAtIEdQNl8xMiAtIFNXMjIwMSAtIExFRDIyMDINCkxFRDIgLSBHUDZfMTMgLSBT
VzIyMDMgLSBMRUQyMjAzDQpMRUQzIC0gR1AwXzAwIC0gTi9BIC0gTEVEMjQwMg0KVGhlIGZpcnN0
IDMgTEVEcyBhcmUgZm91bmQgbmV4dCB0byB0aGUgbWljcm8gVVNCIGNvbm5lY3RvciBmb3IgdGhl
IGRlYnVnIGNvbnNvbGUsDQp0aGUgZm9ydGggTEVEIGlzIGZvdW5kIG5leHQgdG8gdGhlIFdpRmkg
YW5kIEJUIExFRHMuDQoNCkkgdGhvdWdodCB0aGF0IHVzaW5nICJMRURuIiBhcyBsYWJlbHMgd291
bGQgcHV0IGEgcmVtYXJrIG9uIHRoZQ0KImRlc2lyZWQgb3JkZXJpbmciIG9mIHRoZSBMRURzIChl
dmVuIHRob3VnaCB0aGVyZSBpcyBubyBhY3R1YWwNCnJlcXVpcmVtZW50IGZvciB0aGF0KSwgYnV0
IGFzIHlvdSBwb2ludGVkIG91dCBpdCdzIHByb2JhYmx5IGEgYml0DQpjb25mdXNpbmc/IERvIHlv
dSB0aGluayBJIHNob3VsZCB0YWtlIHRoZSBsYWJlbCBvdXQ/DQoNCj4gDQo+IE5vdGUgdGhhdCB0
aGlzIEdQSU8gaXMgc2hhcmVkIHdpdGggYSBzd2l0Y2gsIGxpa2Ugb24gU2FsdmF0b3ItWChTKSBh
bmQNCj4gVUxDQi4gIEFzIGN1cnJlbnRseSBMaW51eCBjYW5ub3QgaGFuZGxlIGJvdGgsIGRlc2Ny
aWJpbmcgdGhlIExFRA0KPiBwcmVjbHVkZXMgYWRkaW5nIHRoZSBzd2l0Y2ggbGF0ZXIuDQo+IChh
cHBsaWVzIHRvIHRoZSBmaXJzdCAzIExFRHMpLg0KDQpUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRo
aXMgb3V0LiBUaGF0J3MgZGVzaXJlZCBiZWhhdmlvdXIgaW4gdGhpcyBjYXNlLg0KDQo+IA0KPiA+
ICsgICAgICAgICAgICAgICBsZWQzIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBncGlv
cyA9IDwmZ3BpbzAgIDAgR1BJT19BQ1RJVkVfSElHSD47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgbGFiZWwgPSAiTEVEMyI7DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+IA0KPiBJIGNh
bm5vdCBmaW5kIExFRDMuIEFjY29yZGluZyB0byB0aGUgc2NoZW1hdGljcyBHUDBfMCA9PSBDUzBu
IGlzIHVzZWQNCj4gYXMgdGhlIGNoaXBzZWxlY3QgZm9yIHRoZSBMVkRTIHN3aXRjaD8NCg0KTXkg
dW5kZXJzdGFuZGluZyBpcyB0aGF0IENTMG4gaXMgb24gR1AxXzIwLCBjb3VsZCB5b3UgcGxlYXNl
IGRvdWJsZQ0KY2hlY2s/DQoocGluIG5hbWU6IEFKNCkgR1AwXzAwID09IEQwID09IEV4RDAgb24g
dGhlIHNjaGVtYXRpYyBJIGhhdmUsIEkgdGhvdWdodA0KeW91IG1heSBoYXZlIGJlZW4gbG9va2lu
ZyBhdCBhbiBvbGRlciB2ZXJzaW9uIG9mIHRoZSBzY2hlbWF0aWMsIGJ1dCBhZnRlcg0KZ29pbmcg
dGhyb3VnaCB0aGUgaGlzdG9yeSBpdCBzZWVtcyBsaWtlIHRoYXQgbGluZSBoYXMgYWx3YXlzIGJl
ZW4gdGhlcmUuDQoNClRoYW5rcywNCkZhYg0KDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4g
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcw0K
