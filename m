Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBC3241A31
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 13:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgHKLO5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 07:14:57 -0400
Received: from mail-eopbgr1300137.outbound.protection.outlook.com ([40.107.130.137]:18688
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728469AbgHKLO5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 07:14:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMQqqvrLyi30q1XBmU8hjMHp0WrLYvMQMLGoN/0J2vCE5M8VRIy28Ns3iTkQHs8aUOH5UaASbktmmum0RGWX8Wl+0OhrnoRqaUONKgi3VheFvr2GHhIZZs3Gsnrl/ce60qTvoorHSTWYmkK3H+5ffIAZIPNKje+AYRL6YuEonuXz20SHJquaUjyjWjhy8kl5ffgIQPLiaE7jEJi37LzzQB85r6AuhZokqBUdyvOpJHXG1smhEabV+a9S/9D4JBgteIWeG7gaXPab4rP3mAeazob6FICma79aXh7fPrVtVUU0osTsctw17UkWlEwPtiFOwjdfoJtPjNveWajwrb5wtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cP8ESN9mspXlRAG60ESKUnXiI6FKkUYG90AeZ/lxcpE=;
 b=YXsCYAZj4qePqp4ncx0S9fWatR5IgcCVkgZNJ/IkGoXz+GuoBgQXJYcrkS+S94PmuqpNeFXfQ3bsR+oCJgDrCMDS2pDzxNmK1Qshfj5U+OMUt4cGr8Hul5AbnjHuNqLcuuTfUFgZZjhrS9sm1kaY2V472kUwU0k+t1Tq7wq0xROyeG+d14dwefUmaadtYvf1zJmNJn4WsCadXH0JEgMudEN0eikhtFZQMP7DHhwi4KcywaBHxLhiW2//pCuXtjtQCFtVgr+IB/D0iqGN134OkNAwhcZ2ye9pvj3lBpCtpU65TedX6PUAxboKqtX6whj7K3tl4z19nLde9TAEpRIMyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cP8ESN9mspXlRAG60ESKUnXiI6FKkUYG90AeZ/lxcpE=;
 b=k+3647mfSohQeZfsth5enk/6Ob5ZVbvOIRgaqXROZ1PRg3dT3O/jhXvTUKVqvzkBFwI1aQ47u/AmB72dbz11awMndPIAJD6tTEB0LrV02jXXZIFB71VXxZCXJYY4MLcREVsrY2Icip+UrDkAo1FDXxirg2r0XOOQb6l4raGLSNo=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB4154.jpnprd01.prod.outlook.com
 (2603:1096:404:d2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Tue, 11 Aug
 2020 11:14:51 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee%7]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 11:14:51 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3] ARM: dts: iwg20d-q7-common: Fix touch controller probe
 failure
Thread-Topic: [PATCH v3] ARM: dts: iwg20d-q7-common: Fix touch controller
 probe failure
Thread-Index: AQHWbz6momr97+r7RU2kyTFhBnF9jakyu+GAgAADtoA=
Date:   Tue, 11 Aug 2020 11:14:51 +0000
Message-ID: <TYBPR01MB5309475059EA8B2850FD322A86450@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200810174944.2892-1-biju.das.jz@bp.renesas.com>
 <20200811105011.GC6054@pendragon.ideasonboard.com>
In-Reply-To: <20200811105011.GC6054@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d5f96187-66e5-4fac-741c-08d83de7c43a
x-ms-traffictypediagnostic: TY2PR01MB4154:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB4154846E1490854FA292D10986450@TY2PR01MB4154.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TjVxlUOH0vpOKoGIrg6xo/2/tClUKOrsuN19FHMD9HwVA/XVqL2airhKYNw3EQepaq9hp5HtfddS83I0Mb4ebHQJx8gJCJW/9GAvFcSDuwikpIVt2RVy5tv2qFGMKCfgH1d9IRmX+00sOP2EsFqGlc2O8WU+77Hk+b+7kU8zVIkKlepIgAffmTtwkXahdMECXkeJmU0ZNHIAhPKvuv6Fuf0oTCsoiRwCurWr2Rd892Xz/8c+nZVC2I3Cv31H7Q+BEM6KWOzpLsjxS7H8G+VTMWNN0MQweSe6tRnn7tO0X5PKydC4zTTvqYpPkIZxlacmR3nPF0hLiHAOh2yMqwYKy1dJk8HsZYaX4EKQ30jiJWqdDrNgls0hfi12YjKKualvVPWZtOqtgry0p0zFiJ5GyQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(66946007)(8936002)(8676002)(66446008)(71200400001)(76116006)(7696005)(316002)(5660300002)(33656002)(52536014)(2906002)(66556008)(966005)(26005)(186003)(86362001)(478600001)(4326008)(64756008)(66476007)(107886003)(83380400001)(54906003)(55016002)(6506007)(9686003)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: xxwuPd2q3A9vavFqu38PVEiIm29WEqNy1cPdSfRYODsqSu/Gy++Zr2Wy/rUexEI1SnQ9fgriVEBxyCiLRjJComd+RdnFCRqoeWRThIFuhx5k0b26OOcs1dXnvVMe8isCxPmh+QEzd6FjiHoJ+uxNOl5et48SbjVWDix6Hd+/cyiSL2uH9a3hfPus310PguDaJwx/bRDrdMrgSpTnep9HoZw5vVLC0gXHmzyfnFxzQspO3VIzFc2eHHRLge/j4AEx5ZxAmiiirtmXtvIGF461gKin6IZ1Ts1kJiSOvPEd3lIBvYMXd0ERyRK+2jXvfvP1WScm6tMbAlzokSDYND2f6uU1BXQZU5pjVjyL+VPQfN7dD/M5LmBn2jOA26NgZDxABN8/geIzrvls1o45Rlh1R4qdzZ8XXeUK2bC+h9W3nGBj3MQE7fjjp9MkNcxKQxE243lgUZx55CbXMM0Z6u9Uv6yiCWODFgcLrygRlY4/aFv0k8cBLQbBGMVcySduxn4vKxH3FmaQBlEiyxxE5D6sIxDjh2nW/hluMR8MPM97X1UXwoK4zQWIj31F3lMnqA2m0rwm2R+f76jLLbN2eswB0VVTTo7jmK3o8RxtSQQ9DlWzrwgnrAyb+bPkHikwuivXNUP+4CyGdGabXjlNGAFtNA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f96187-66e5-4fac-741c-08d83de7c43a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2020 11:14:51.0685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZySH/0Pl+zvJl64YQW5vnLuqWG4+3aXe7DQ08Wzx2jVpfSsoREF6nHm4FVw9Kv8+kD3h9KPLgSnYe/r8jfGYLWpNmaCp+BdPitSpv4EMmvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4154
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2M10gQVJNOiBkdHM6IGl3ZzIwZC1xNy1jb21tb246IEZpeCB0b3VjaCBjb250cm9s
bGVyDQo+IHByb2JlIGZhaWx1cmUNCj4NCj4gSGkgQmlqdSwNCj4NCj4gVGhhbmsgeW91IGZvciB0
aGUgcGF0Y2guDQo+DQo+IE9uIE1vbiwgQXVnIDEwLCAyMDIwIGF0IDA2OjQ5OjQ0UE0gKzAxMDAs
IEJpanUgRGFzIHdyb3RlOg0KPiA+IEFzIHBlciB0aGUgaVdhdmUgUlovRzFNIHNjaGVtYXRpYywg
dGhlIHNpZ25hbCBMVkRTX1BQRU4gY29udHJvbHMNCj4gPiBzdXBwbHkgdm9sdGFnZSBmb3IgdG91
Y2ggcGFuZWwsIExWRFMgcmVjZWl2ZXIgYW5kIFJHQiBMQ0QgcGFuZWwuIEFkZA0KPiA+IHJlZ3Vs
YXRvciBmb3IgdGhlc2UgZGV2aWNlIG5vZGVzIGFuZCByZW1vdmUgcG93ZXJkb3duLWdwaW9zIHBy
b3BlcnR5DQo+ID4gZnJvbSBsdmRzLXJlY2VpdmVyIG5vZGUgYXMgaXQgcmVzdWx0cyBpbiB0b3Vj
aCBjb250cm9sbGVyIGRyaXZlciBwcm9iZSBmYWlsdXJlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IFRo
aXMgcGF0Y2ggZGVwZW5kIG9uIGJlbG93IHBhdGNoZXMNCj4gPg0KPiA+IDEpIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE3MDc1OTUvDQo+ID4gMikgaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wYXRjaC8xMTcwNzU5My8NCj4gPg0KPiA+IHYyLT52MyA6IEFkZGVkIHRo
ZSBtaXNzaW5nIHBhcnQgZnJvbSB0aGUgcGF0Y2guIHJlbW92YWwgb2YgcG93ZXJkb3duLQ0KPiBn
cGlvcyBwcm9wZXJ0eS4NCj4gPiB2MS0+djIgOiBBZGQgcmVndWxhdG9yIGluIHRvdWNoIHBhbmVs
LCBMVkRTIHJlY2VpdmVyIGFuZCBSR0IgTENEIHBhbmVsDQo+ID4gdjEtPmRldmljZSBub2Rlcw0K
PiA+ICAgICAgICAgICAgKFJlZjogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8x
MTcwNzU1OS8pDQo+ID4gdjEgOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEx
NzA1ODE5Lw0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctY29tbW9u
LmR0c2kgfCAxNSArKysrKysrKysrKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9pd2cyMGQtcTctY29tbW9uLmR0c2kNCj4gPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3
ZzIwZC1xNy1jb21tb24uZHRzaQ0KPiA+IGluZGV4IGViYmUxNTE4ZWY4YS4uMDU2ZjkzMTE5ZDhh
IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRz
aQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQ0KPiA+
IEBAIC01Nyw3ICs1Nyw3IEBADQo+ID4NCj4gPiAgbHZkcy1yZWNlaXZlciB7DQo+ID4gIGNvbXBh
dGlibGUgPSAidGksZHM5MGNmMzg0YSIsICJsdmRzLWRlY29kZXIiOw0KPiA+IC1wb3dlcmRvd24t
Z3Bpb3MgPSA8JmdwaW83IDI1IEdQSU9fQUNUSVZFX0xPVz47DQo+ID4gK3ZjYy1zdXBwbHkgPSA8
JnZjY18zdjNfdGZ0MT47DQo+ID4NCj4gPiAgcG9ydHMgew0KPiA+ICAjYWRkcmVzcy1jZWxscyA9
IDwxPjsNCj4gPiBAQCAtODEsNiArODEsNyBAQA0KPiA+ICBwYW5lbCB7DQo+ID4gIGNvbXBhdGli
bGUgPSAiZWR0LGV0bTA3MDBnMGRoNiI7DQo+ID4gIGJhY2tsaWdodCA9IDwmbGNkX2JhY2tsaWdo
dD47DQo+ID4gK3Bvd2VyLXN1cHBseSA9IDwmdmNjXzN2M190ZnQxPjsNCj4gPg0KPiA+ICBwb3J0
IHsNCj4gPiAgcGFuZWxfaW46IGVuZHBvaW50IHsNCj4gPiBAQCAtMTEzLDYgKzExNCwxNyBAQA0K
PiA+ICB9Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gK3ZjY18zdjNfdGZ0MTogcmVndWxhdG9yLXBhbmVs
IHsNCj4gPiArY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOw0KPiA+ICsNCj4gPiArcmVn
dWxhdG9yLW5hbWUgPSAiUGFuZWwgVmNjIjsNCj4NCj4gU2hvdWxkIHRoaXMgYmUgbmFtZWQgdmNj
LTN2My10ZnQxLCB0byBtYXRjaCB0aGUgaGFyZHdhcmUgPyBJdCdzIG5vdCBqdXN0IHRoZQ0KPiBw
YW5lbCwgaXQncyBhbHNvIHRoZSBwb3dlciBzdXBwbHkgdG8gdGhlIExWRFMgcmVjZWl2ZXIgYW5k
IHRvdWNoIHNjcmVlbi4NCg0KT2suIEkgd2lsbCBjaGFuZ2UgdGhpcyB0byB2Y2MtM3YzLXRmdDEu
DQoNCj4gPiArcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gK3JlZ3Vs
YXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KPiA+ICtlbmFibGUtYWN0aXZlLWhpZ2g7
DQo+ID4gK3N0YXJ0dXAtZGVsYXktdXMgPSA8NzAwMDA+Ow0KPg0KPiBXaGVyZSBkb2VzIHRoZSA3
MG1zIHZhbHVlIGNvbWUgZnJvbSA/IFRoZSB0aW1lIGNvbnN0YW50IG9mIHRoZSBWQ0NfM1YzDQo+
IC0+IFZDQ18zVjNfVEZUWzEyXSBzd2l0Y2hlcyBjaXJjdWl0cnkgaXMgMC4xbXMgKFJDID0gMTAw
a86pICogMW5GKSwgc28NCj4gMC41bXMgKDUqUkMpIHNob3VsZCBiZSBlbm91Z2ggdGhlcmUuIEFy
ZSB0aGVyZSBvdGhlciBkZWxheXMgdGhhdCBuZWVkIHRvDQo+IGJlIHRha2VuIGludG8gYWNjb3Vu
dCA/DQoNCk9rIFRoYW5rcyAsIEkgd2lsbCBjaGFuZ2UgaXQgdG8gMC41IG1zZWMuIEluaXRpYWxs
eSBJICBmYWNlZCBhIHByb2JlIGZhaWx1cmUsIGFmdGVyIHR1cm5pbmcgb24gdGhpcyByZWd1bGF0
b3IsICBzbyBJIGNob3NlbiBhIHZhbHVlDQpmcm9tIHRoZSBiaW5kaW5ncyBleGFtcGxlcyBhbmQg
aXQgc2VlbXMgdG8gZml4IHRoZSBpc3N1ZS4NCg0KTm93IEkgaGF2ZSBjaGFuZ2VkIHRoaXMgdmFs
dWUgdG8gMC41IG1zZWMgYW5kIGNvbmZpcm1zIGl0IHdvcmtzIGZpbmUuDQoNCkNoZWVycywNCkJp
anUNCg0KPiBXaXRoIHRob3NlIHNtYWxsIGlzc3VlcyBhZGRyZXNzZWQsDQo+DQo+IFJldmlld2Vk
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
DQo+DQo+ID4gK2dwaW8gPSA8JmdwaW83IDI1IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+ICt9Ow0K
PiA+ICsNCj4gPiAgdmNjX3NkaGkxOiByZWd1bGF0b3ItdmNjLXNkaGkxIHsNCj4gPiAgY29tcGF0
aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOw0KPiA+DQo+ID4gQEAgLTIwNyw2ICsyMTksNyBAQA0K
PiA+ICByZWcgPSA8MHgzOD47DQo+ID4gIGludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8yPjsNCj4g
PiAgaW50ZXJydXB0cyA9IDwxMiBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Ow0KPiA+ICt2Y2Mtc3Vw
cGx5ID0gPCZ2Y2NfM3YzX3RmdDE+Ow0KPiA+ICB9Ow0KPiA+ICB9Ow0KPiA+DQo+DQo+IC0tDQo+
IFJlZ2FyZHMsDQo+DQo+IExhdXJlbnQgUGluY2hhcnQNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNz
IEV1cm9wZSBHbWJILCBHZXNjaGFlZnRzZnVlaHJlci9QcmVzaWRlbnQ6IENhcnN0ZW4gSmF1Y2gs
IFNpdHogZGVyIEdlc2VsbHNjaGFmdC9SZWdpc3RlcmVkIG9mZmljZTogRHVlc3NlbGRvcmYsIEFy
Y2FkaWFzdHJhc3NlIDEwLCA0MDQ3MiBEdWVzc2VsZG9yZiwgR2VybWFueSwgSGFuZGVsc3JlZ2lz
dGVyL0NvbW1lcmNpYWwgUmVnaXN0ZXI6IER1ZXNzZWxkb3JmLCBIUkIgMzcwOCBVU3QtSUROci4v
VGF4IGlkZW50aWZpY2F0aW9uIG5vLjogREUgMTE5MzUzNDA2IFdFRUUtUmVnLi1Oci4vV0VFRSBy
ZWcuIG5vLjogREUgMTQ5Nzg2NDcNCg==
