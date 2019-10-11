Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE2AD3B30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2019 10:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfJKIbf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Oct 2019 04:31:35 -0400
Received: from mail-eopbgr1400112.outbound.protection.outlook.com ([40.107.140.112]:34016
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726310AbfJKIbf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 04:31:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgDrxz/lwj0tckvGAl+c7u58/7hs7GmBPXrcEhBHATT3Muo+rjnfVRAoWH5Zi+1PflNYHU4boCFn9tSigUUCaY67LoHh3b14uPqIJzJXHTusEpmiFY/JIK3SLJ+1TeqqlVU29/8+aiWpuFgsekv0ylIjnszRiXaWGhzwBbkXRt7Jo9dAv33XsZKT2q1SYg2Yx2ScbT1pIREYek0Dgmoz50ahdMJTr6ymrwx+WuZujdo0JNbkRRdkn+SbqiJzgvzSbfRRn/5IygI0eMzL+qRWWcv9hnaOQdzQorO1aBmXSXlZZn3piImnBbogx1OMpNJT6ZpDqZajKkT7XVzZL2b46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBA3P9r6HM8LXcH0ig4BQHGOd92TsNf3rxYdu34Utik=;
 b=P6d++vqcG49TvVvJn2Facy1rxuHxix+ZfMUnhY9di9M09CnXca/NSO97UyP5P8CYm5Yke37oM/fWVW3JMxPD6LiL0Tuf9x+tmvJ6ep1s9MjLT1VKLDcdc/1CwwZqkhANarsBndlVsH/BeDTv7sLG4Zv9kAS9x9tEHBlpShjOnKFognxho0zSqq8u004oZhS6yCl5C3ao05tzRI0CZCTRfcRq7N05g0BQwZnY7B3DG0bYXVu9M4PKzeO4WVWHAm1odMi+cOeoPNaTlij8FUr46abBJsFEOtBkunGr+CEG5waMpsDDBxggZxu/UMUhNoaKv2/ZeKxfwXUqARAgSpgcGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBA3P9r6HM8LXcH0ig4BQHGOd92TsNf3rxYdu34Utik=;
 b=kEla6/Ci1gGSnbUEChzqVDcTS8OOOVt9LAwaWck461QpkN67PyYXPoanpG9bQxMJ+i41HnF2dM4bAohpD9ko4TqYKHidbSfIM5iiwDWsRYAlTsGgeFKvh0645yn3TxH1u1YQ9M3qHj2q9RU36stC+9DIIVxJRG6AHhQ4s/qhK64=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4784.jpnprd01.prod.outlook.com (20.179.186.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 11 Oct 2019 08:31:32 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 08:31:32 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>
Subject: RE: [PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car
 M3-W+
Thread-Topic: [PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car
 M3-W+
Thread-Index: AQHVfPlPSzwDchXw90SM+Azsmh2C4KdVH14w
Date:   Fri, 11 Oct 2019 08:31:31 +0000
Message-ID: <TYAPR01MB45444F8B8EEB971FA61D853BD8970@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191007102332.12196-1-geert+renesas@glider.be>
In-Reply-To: <20191007102332.12196-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce70964a-f07c-4955-eee3-08d74e256bb7
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB4784:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB4784C45668EB8F5DB31339CED8970@TYAPR01MB4784.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(199004)(189003)(53754006)(4326008)(476003)(66446008)(66476007)(76116006)(66556008)(64756008)(52536014)(229853002)(8936002)(186003)(66946007)(99286004)(11346002)(102836004)(81166006)(74316002)(2906002)(256004)(81156014)(86362001)(8676002)(486006)(316002)(3846002)(446003)(54906003)(14454004)(2501003)(7696005)(66066001)(26005)(305945005)(6506007)(25786009)(478600001)(55016002)(6436002)(5660300002)(6246003)(33656002)(110136005)(7736002)(71190400001)(71200400001)(6116002)(76176011)(9686003)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4784;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0TYz12H8CeBAv71HC7dKyK7OiZIEBC1WwFftTjj7KvpG55HhT4mG3NgY0xywWUCwZKtmu0e6efg0gQZU9QBjCh+rgMYmgQXx9vVfbnUu9MzPmLk94+dOsK2f4w6e38/zufuHx46rGJv7YRuNTqcbWTRu1PuY7LAQh9mzZ1zXCG1hnEiQ7rxSLmuOWRCkmRY8QKTLbBrxwhA+JND/BuTklElEczzBZjL2U9UKm3IV++ULNt8Y7xdqfQpRWsWG/aA9F/h+07f/BAJuUb6g0y/tnBsnaUTKQGrtSEDn/2LSljCLsbKakgTsvXkUnFfPAuqP3xKsm/Ask7y3c4tLqrYL5z40Slv2IkRYuPIrGhoRwFlxp0GT7FXYES+Kp62oXs4T3sLLfvzAednOaYqED4R51xM9UYqHQIQjSx9Yyj5s61k=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce70964a-f07c-4955-eee3-08d74e256bb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 08:31:32.2768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZsAj2yFG6zS0Y9dbjeKQhkMP+NTaB2UblTZlm/WOrfI4YIslPHrveTCIQ/DfdDNXr5p84votiOekla5Qr3bgQ4PpDkqaPeZkPae+wwGEl78iKtoU+oby1GqTkbYJ24sx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4784
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaGVzIQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5LCBPY3RvYmVyIDcsIDIwMTkgNzoyMyBQTQ0K
PiANCj4gCUhpIGFsbCwNCj4gDQo+IFRoaXMgUkZDIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQg
Zm9yIHRoZSBSLUNhciBNMy1XKyAoUjhBNzc5NjEpIFNvQw0KPiBhbmQgdGhlIFNhbHZhdG9yLVhT
IGJvYXJkIHdpdGggUi1DYXIgTTMtVysuICBUaGlzIFNvQyBpcyBhIGRlcml2YXRpdmUgb2YNCj4g
Ui1DYXIgTTMtVyAoUjhBNzc5NjApLCBhbmQgYWxzbyBrbm93biBhcyBSLUNhciBNMy1XIEVTMy4w
Lg0KPiBBcyB0aGlzIGlzIGFuIFJGQywgSSdtIHNlbmRpbmcgaXQgdG8gYSBsaW1pdGVkIGF1ZGll
bmNlLg0KPiANCj4gQmFzZWQgb24gZXhwZXJpZW5jZSB3aXRoIHByZXZpb3VzIFNvQ3MgaW4gdGhl
IFItQ2FyIEdlbjMgZmFtaWx5LCB0aGUNCj4gZm9sbG93aW5nIGRlc2lnbiBkZWNpc2lvbnMgd2Vy
ZSBtYWRlOg0KPiAgIC0gVXNlIGRpZmZlcmVudCBjb21wYXRpYmxlIHZhbHVlcyAocjhhNzc5NjEt
YmFzZWQpLA0KPiAgIC0gVXNlIGRpZmZlcmVudCBjbG9jayBhbmQgU1lTQyBEVCBiaW5kaW5nIGRl
ZmluaXRpb25zDQo+ICAgICAoUjhBNzc5NjEtYmFzZWQpLCBidXQgdGhlIHNhbWUgbnVtZXJpY2Fs
IHZhbHVlcywgdG8gYWxsb3cgc2hhcmluZw0KPiAgICAgZHJpdmVycywNCj4gICAtIFNoYXJlIHRo
ZSBwaW4gY29udHJvbCBkcml2ZXIsDQo+ICAgLSBTaGFyZSB0aGUgY2xvY2sgZHJpdmVyLA0KPiAg
IC0gU2hhcmUgdGhlIHN5c3RlbSBjb250cm9sbGVyIGRyaXZlci4NCj4gDQo+IFdoaWxlIHRoZSBE
VCBBQkkgaXMgc3RhYmxlIChoZW5jZSB3ZSBjYW5ub3Qgcy9yOGE3Nzk2L3I4YTc3OTYwLyBpbiBE
VFMpLA0KPiBrZXJuZWwgc291cmNlIGNvZGUgYW5kIGtlcm5lbCBjb25maWcgc3ltYm9scyBjYW4g
YmUgY2hhbmdlZCBhdCBhbnkNCj4gdGltZS4gIEFzIGNoYW5naW5nIGtlcm5lbCBjb25maWcgc3lt
Ym9scyBpbXBhY3RzIHRoZSB1c2VyLCB0aGV5IHdlcmVuJ3QNCj4gcmVuYW1lZCB5ZXQuDQo+IA0K
PiBRdWVzdGlvbnM6DQo+ICAgLSBXaGF0J3MgdGhlIGJvYXJkIHBhcnQgbnVtYmVyIG9mIFNhbHZh
dG9yLVhTIHdpdGggUi1DYXIgTTMtVys/DQoNClJUUDBSQzc3OTZTSVBCMDAxMlNBNUEuDQoNCj4g
ICAtIFNob3VsZCByOGE3Nzk2MV9waW5tdXhfaW5mbyAoYW5kIHRoZSByZW5hbWUgb2YgcjhhNzc5
Nl9waW5tdXhfaW5mbw0KPiAgICAgdG8gcjhhNzc5NjBfcGlubXV4X2luZm8pIGJlIGRyb3BwZWQ/
IEkgYWRkZWQgaXQgYmVjYXVzZQ0KPiAgICAgcjhhNzc5Nl9waW5tdXhfaW5mby5uYW1lIGNvbnRh
aW5zICJyOGE3Nzk2MF9wZmMiLg0KPiANCj4gICAtIFNob3VsZCB0aGUgQ0xLX1I4QTc3OTYxIGFu
ZCBQSU5DVFJMX1BGQ19SOEE3Nzk2MSBzeW1ib2xzIGJlIGRyb3BwZWQ/DQo+ICAgICBUaGUgY2xv
Y2sgYW5kIHBpbiBjb250cm9sIGRyaXZlcnMgYXJlIHRoZSBzYW1lIG9yIGFsbW9zdCB0aGUgc2Ft
ZSwNCj4gICAgIHNvIHRoZSBjb2RlIGluY3JlYXNlIGJ5IGFsd2F5cyBlbmFibGluZyBib3RoIGlz
IG1pbmltYWwuDQo+IA0KPiAgIC0gU2hvdWxkIHRoZSBSOEE3Nzk2MSBjb25maWcgc3ltYm9scyBi
ZSBkcm9wcGVkPw0KPiAgICAgICAtIENPTkZJR19BUkNIX1I4QTc3OTYxDQo+ICAgICAgIC0gQ09O
RklHX0NMS19SOEE3Nzk2MQ0KPiAgICAgICAtIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk2MQ0K
PiAgICAgICAtIENPTkZJR19TWVNDX1I4QTc3OTYxDQoNCkkgdGhpbmsgdGhlIGN1cnJlbnQgaW1w
bGVtZW50YXRpb25zIGFyZSBPSy4NCg0KPiAgIC0gSWYgbm90LCBzaG91bGQgdGhlIFI4QTc3OTYg
Y29uZmlnIHN5bWJvbHMgYmUgcmVuYW1lZD8NCj4gICAgICAgLSBDT05GSUdfQVJDSF9SOEE3Nzk2
IHRvIENPTkZJR19BUkNIX1I4QTc3OTYwPw0KPiAgICAgICAtIENPTkZJR19DTEtfUjhBNzc5NiB0
byBDT05GSUdfQ0xLX1I4QTc3OTYwPw0KPiAgICAgICAtIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3
Nzk2IHRvIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk2MD8NCj4gICAgICAgLSBDT05GSUdfU1lT
Q19SOEE3Nzk2IHRvIENPTkZJR19TWVNDX1I4QTc3OTYwPw0KPiAgICAgRHVlIHRvIGRlcGVuZGVu
Y2llcyBvbiBDT05GSUdfQVJDSF9SOEE3Nzk2LCB0aGlzIHNob3VsZCBiZSBhIHNpbmdsZQ0KPiAg
ICAgY29tbWl0Lg0KDQpJIHRoaW5rIHNvLg0KDQo+IFJlbGF0ZWQgcXVlc3Rpb25zIGZvciBvbGQg
Ui1DYXIgSDMgRVMxLnggc3VwcG9ydDoNCj4gICAtIFNob3VsZCBDT05GSUdfUElOQ1RSTF9QRkNf
UjhBNzc5NTAgYmUgYWRkZWQsIHRvIGFsbG93IGNvbXBpbGluZyBvdXQNCj4gICAgIFItQ2FyIEgz
IEVTMS54IHBpbiBjb250cm9sIHN1cHBvcnQ/DQo+ICAgICBJZiB5ZXMsIHNob3VsZCBDT05GSUdf
UElOQ1RSTF9QRkNfUjhBNzc5NSBiZSByZW5hbWVkIHRvDQo+ICAgICBDT05GSUdfUElOQ1RSTF9Q
RkNfUjhBNzc5NTE/DQoNCkkgdGhpbmsgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gKENPTkZJ
R19QSU5DVFJMX1BGQ19SOEE3Nzk1IG9ubHkpIGlzIE9LDQpiZWNhdXNlIHRoZSBoYXJkd2FyZSBk
b2N1bWVudCBkb2Vzbid0IG1lbnRpb24gYWJvdXQgUjhBNzc5NTAuDQoNCj4gVGhpcyBwYXRjaCBz
ZXJpZXMgaXMgYmFzZWQgb24gcmVuZXNhcy1kcml2ZXJzLTIwMTktMTAtMDEtdjUuNC1yYzEpLiAg
Rm9yDQo+IHlvdXIgY29udmVuaWVuY2UsIGl0IGlzIGF2YWlsYWJsZSBpbiB0aGUgdG9waWMvcjhh
Nzc5NjEtdjEgYnJhbmNoIG9mIG15DQo+IHJlbmVzYXMtZHJpdmVycyBnaXQgcmVwb3NpdG9yeSBh
dA0KPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZ2VlcnQv
cmVuZXNhcy1kcml2ZXJzLmdpdC4NCg0KSSByZXZpZXdlZCB0aGUgcGF0Y2ggc2VyaWVzIGFuZCBz
ZWVtcyBnb29kIHRvIG1lIGFmdGVyIHVwZGF0ZWQgYSBmZXcgdGhpbmdzDQooYWRkIHRoZSBib2Fy
ZCBwYXJ0IG51bWJlciBhbmQgcmVuYW1lIFI4QTc3OTYgdG8gUjhBNzc5NjApLiBTbywNCg0KUmV2
aWV3ZWQtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2Fz
LmNvbT4NCg0KQW5kLCBJIHRlc3RlZCBvbiB0aGUgbXkgZW52aXJvbm1lbnQuIFNvLA0KDQpUZXN0
ZWQtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNv
bT4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
