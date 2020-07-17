Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7292238DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 12:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgGQKBT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 06:01:19 -0400
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:51968
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725932AbgGQKBS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 06:01:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFO+akO6Q6IVF92H8StkTpmdQcboBshdbKW25drG1StJJ39KkRASAQt+8Q8nuZCK6HTkIb207HOGdHD0CS5eSLzE/JtiQPoDd4FPSRWa4DiZQ6ovIfF6rwgi3/zEFNOt1ioKfX8AtkuVSIaqSt+IUXKcvwGhuoNetETqCIUNPUWv7tI2QSJc90vpnGDCQUduhypEgIsIGT8iC5/TapDwEE5IJBl7m/KGjmWUgjRekc1JTD6HvXuWkMyiNqCG5qaTk7rkoiDlT0V6oxky4iB0PLmsnFowEuOB2L9GpE9PN8WGeVEs9adKU+UZh62CnCl5jjIGPmYYwOeauKONtZ9v8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POrUM6dUTfcgUbNRXUmZlk/cZL6yuasmT+vgdFA0aug=;
 b=ELg5tV2pFhdvTkFRHSHr/Z02VtLCro+glYDFhsANFxJLVB2yrubMnabNwjTrXNr8ccxtTnjkSV/Ij+zQkisLwbxNNDEherzrwCSbQ1BpLlAnIaSFx7dc5ORdbqicjLeFq9/L4B8XPvRmQuYG6zOeUoPdM3NOl+FMrtwomdoma4Lxf3cJdSgAROusNhKqzfIMsKX5QKCs5UOnmX+cy9nCPq+E+K3r8AmoCanHEC02EuhN3I2/O4P0NOKN2DglhWEKLyxJj54GGofx1qZE5ItNHd+cT0IB4sGRnZT0xx00PdxM+LhRwNx71TreLKy6AvnkJxEJeSaI1DDtTcHUc5sgoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POrUM6dUTfcgUbNRXUmZlk/cZL6yuasmT+vgdFA0aug=;
 b=gaHsQxeyVzhIONKl0dGaJBbud8Ha+lr05ooaPr92jXfj6D2/ZHtOgeDaXSYdJBmkpJQ0Yg4As/j6e/hk8w6ynyzD8TB/jfGsbmlflUHK1W6G9hVDeS/DTRGnTWsBQF2pIUZ3G1LFzmDHRmvtrz/nbvzJuT+50kWWzl9BIrJkUiI=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1727.jpnprd01.prod.outlook.com (2603:1096:403:b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 17 Jul
 2020 10:01:16 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 10:01:16 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: add full-pwr-cycle-in-suspend into
 eMMC nodes
Thread-Topic: [PATCH] arm64: dts: renesas: add full-pwr-cycle-in-suspend into
 eMMC nodes
Thread-Index: AQHWVrImoipTHpQCfEOOGfl8yMfzBakIYI8AgALjfUCAACHpAIAAEe1ggAAFGICAABXGIA==
Date:   Fri, 17 Jul 2020 10:01:16 +0000
Message-ID: <TY2PR01MB36923CD412750CE20F416A45D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594382612-13664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVqFU538syZq2B=An-MA3zo3RT115JmvaVxyt5mb-Wvsg@mail.gmail.com>
 <TY2PR01MB3692CD5627D9848ADDA88BF0D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdVzO=wwTyYhHj2Cg3g_rRQCHQ_97DVH8zXAkg_ki5ZHhw@mail.gmail.com>
 <TY2PR01MB3692646F94A991EB373A8AA3D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdU2R7qxtgmP6CgmN9_3SZeL7DFUs5iCAu2QG+UBay=EBw@mail.gmail.com>
In-Reply-To: <CAMuHMdU2R7qxtgmP6CgmN9_3SZeL7DFUs5iCAu2QG+UBay=EBw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4661c5c6-2c9a-4431-cb2e-08d82a385870
x-ms-traffictypediagnostic: TYXPR01MB1727:
x-microsoft-antispam-prvs: <TYXPR01MB1727EC97111B3741AE8BE826D87C0@TYXPR01MB1727.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jvED0VYkeUM2jHLfIwuJvPBBRkKgINvHTnDUIU9VTlqoIY7PNC1EvMfsZ2Myop1XnlqA0YZhZT4O238vDRNmbX9hROEHoH3MF3mBtVHurDA3XvqJnIsvNnQjENe1XvTBX4fTCs8UPifXtBOYhWJnwA/rEHU6pcAJPcRin1fhzfy1FC6/ZI5TKjEjQXuzoawesiL5wSfcHAEHCWdDojk2MQeGiuoeD5VCNic7rU6Wdyv0N7GpNxGwP0kWiebo7+18DdPAUvPfz405lI/+gurye1wC95D4R40r/vKNdpFtmn5YJRaWGkLjr5O+6OJhIc8P47LlswPLgtQvYY5oUrnqPps87VT4bOWmqPF3sF5lblqGTq7u8zCjtF83FtlVf2Ua1KxfDX7DOtX+xbxCp9I2vg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(8676002)(55236004)(15650500001)(86362001)(5660300002)(53546011)(6506007)(6916009)(71200400001)(33656002)(186003)(26005)(52536014)(9686003)(4326008)(76116006)(55016002)(66946007)(66476007)(66556008)(83380400001)(64756008)(66446008)(7696005)(8936002)(54906003)(966005)(478600001)(2906002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: pvvTWxWhnwsOg9bXltz0zcYje9+4CSCaq5IMRjuCwgXr/a0J7913ctoiXrJ3KIVu+elGqSh36GRl5sB9lZgwS8N3bUHuutYJpjt8uw24NNDAdPKkzKSwiRQodk3G3iMob66tejKNNqf88ZKT6SRp81GsSatYGjAFTvA2IvYfww5TboYN5pvEJV1c33ETg5FQdnrJauMnIHcol0C/1adPsuNGAP6Feir3rZ2WLKr23h3mw5g2hKrvziSoXhrmjClo6pMnqkRmLmKna4jwiyobv/lV8d90zfdOgt0BvmfSenFYd1NaQJOzCZXCWBA+q5RkZItOEXXH1RIlmb9zsex6UOC9M2FKCJZpPSIe8wyO6BEqTsNpBX3M/ApDRXUakr2GqLWX8Ok8lhV+tAqBdhhV5seOLl1SAF1+b6GXA1kduQgkVmjLuQwOyCHs41iZbDrmLj+Swz8vBfqMFp2pmu2u37+Iu907NKnD+sD0psAs5uTkARDfZR0eV8HWUbEMjSfj
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4661c5c6-2c9a-4431-cb2e-08d82a385870
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 10:01:16.2068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: obCjNgR3BPVDj4CtnZKzPBkxjiTa4kO8pV/3tBvANjOG7cpPFRoGRylCXWVCM+a2r+1GtLIHk6XEFqRJMWgrZ6QRTUZV6LWJOZ9M02YTmzmoftpn8itjLZn66bGdYM4U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1727
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBKdWx5IDE3LCAyMDIwIDU6MzUgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4gT24g
RnJpLCBKdWwgMTcsIDIwMjAgYXQgMTA6MjkgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hp
aGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5
dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5LCBKdWx5IDE3LCAyMDIwIDQ6MTMgUE0NCj4gPiA+IE9u
IEZyaSwgSnVsIDE3LCAyMDIwIGF0IDc6NDQgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPiA+IDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gRnJvbTog
R2VlcnQgVXl0dGVyaG9ldmVuLCBTZW50OiBXZWRuZXNkYXksIEp1bHkgMTUsIDIwMjAgNjowNSBQ
TQ0KPiA+ID4gPiA+IE9uIEZyaSwgSnVsIDEwLCAyMDIwIGF0IDI6MDMgUE0gWW9zaGloaXJvIFNo
aW1vZGENCj4gPiA+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3Rl
Og0KPiA+IDxzbmlwPg0KPiA+ID4gPiA+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OGE3Nzk5MC1lYmlzdS5kdHMgICB8IDEgKw0KPiA+ID4gPiA+ID4gIGFyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9zYWx2YXRvci1jb21tb24uZHRzaSB8IDEgKw0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gSSBhc3N1bWUgd2UgbmVlZCB0aGlzIG9uIG90aGVyIGJvYXJkcywgdG9vPw0KPiA+ID4gPiA+
IEF0IGxlYXN0IFVMQ0IgdXNlcyB0aGUgQkQ5NTcxIFBNSUMsIGFuZCBoYXMgYSBzaW1pbGFyIFBT
Q0kgczJyYW0NCj4gPiA+ID4gPiBpbXBsZW1lbnRhdGlvbiBhcyBTYWx2YXRvci1YKFMpIGFuZCBF
YmlzdS4NCj4gPiA+ID4NCj4gPiA+ID4gSSB0aGluayBzby4gQW5kLCBJIGFsc28gdGhpbiBVTENC
K0tGIHNob3VsZCBub3QgaGF2ZSB0aGlzIGJlY2F1c2UNCj4gPiA+ID4gaXQgZG9lc24ndCBzdXBw
b3J0IFN1c3BlbmQtdG8tUkFNLiBCdXQsIHdoYXQgZG8geW91IHRoaW5rPw0KPiA+ID4NCj4gPiA+
IEhvdyBjb21lIFVMQ0IrS0YgZG9lc24ndCBzdXBwb3J0IHMycmFtPw0KPiA+ID4gSXNuJ3QgS2lu
Z0Zpc2hlciBqdXN0IGFuIGV4dGVuc2lvbiBib2FyZCBmb3IgVUxDQj8NCj4gPiA+IERvZXMgaXQg
cmVxdWlyZSBhIGZpcm13YXJlIHVwZ3JhZGU/DQo+ID4NCj4gPiBJdCdzIHJlbGF0ZWQgdG8gYm9h
cmQgZGVzaWduLiBJZiBVTENCK0tGLCB3ZSBtdXN0IG5vdCB1c2UgNVYgQUMgdG8gVUxDQiBzaWRl
DQo+ID4gYW5kIG11c3QgdXNlIDEyViBBQyB0byBLRiBzaWRlLiBBbmQgS0YgaGFzIHBvd2VyIHN3
aXRjaCBhcyBTVzYgZm9yIGJvdGggVUxDQitLRi4NCj4gPiBodHRwczovL2VsaW51eC5vcmcvUi1D
YXIvQm9hcmRzL0tpbmdmaXNoZXINCj4gDQo+IE9LLg0KPiANCj4gPiBIb3dldmVyLCBQTUlDIG9u
IFVMQ0IgY2Fubm90IGNvbnRyb2wgdGhlIEtGIHBvd2VyIHVuZm9ydHVuYXRlbHkuDQo+ID4gU28s
IHdlIGhhdmUgbm8gY2hhbmNlIHRvIHVzZSBzMnJhbSBvbiBVTENCK0tGLi4uDQo+IA0KPiBNYWtl
cyBzZW5zZS4NCj4gQlRXLCB3aGF0IGhhcHBlbnMgaWYgeW91IHRyeSBzMnJhbT8gSSBndWVzcyB0
aGUgc3lzdGVtIGp1c3Qgd2FrZXMgdXAgYWdhaW4NCj4gaW1tZWRpYXRlbHk/IE9yIGRvZXMgaXQg
Y3Jhc2g/DQoNCkl0J3MgZnJvemVuIGFmdGVyIHMycmFtLiBTb21lIExFRHMgb24gVUxDQiBpcyBP
RkYuIEJ1dCwgTEVEcyBvbiBLRiBpcyBzdGlsbCBPTi4NClNvLCBJJ20gd29uZGVyaW5nIGlmIGl0
J3MgYmV0dGVyIHRvIGFkZCB0aGUgcHJvcGVydHkgb24gVUxDQitLRiB0b28NCmJlY2F1c2UgaXQg
c2VlbXMgVUxDQiBpcyB0dXJuZWQgb2ZmLiBCdXQsIHdoYXQgZG8geW91IHRoaW5rPw0KDQotLS0g
bG9nIC0tLQ0Kcm9vdEBtM3VsY2I6fiMgZWNobyBOID4gL3N5cy9tb2R1bGUvcHJpbnRrL3BhcmFt
ZXRlcnMvY29uLi4uIA0Kcm9vdEBtM3VsY2I6fiMgZWNobyBOID4gL3N5cy9tb2R1bGUvcHJpbnRr
L3BhcmFtZXRlcnMvY29uc29sZV9zdXNwZW5kDQpyb290QG0zdWxjYjp+IyBlY2hvIG1lbSA+IC9z
eXMvcG93ZXIvc3RhdGUNClsgIDEwOS44NzAyNDBdIFBNOiBzdXNwZW5kIGVudHJ5IChkZWVwKQ0K
WyAgMTA5Ljg3Mzk5M10gRmlsZXN5c3RlbXMgc3luYzogMC4wMDAgc2Vjb25kcw0KWyAgMTA5Ljg3
OTM3MV0gRnJlZXppbmcgdXNlciBzcGFjZSBwcm9jZXNzZXMgLi4uIChlbGFwc2VkIDAuMDAxIHNl
Y29uZHMpIGRvbmUuDQpbICAxMDkuODg4MTIxXSBPT00ga2lsbGVyIGRpc2FibGVkLg0KWyAgMTA5
Ljg5MTM1OF0gRnJlZXppbmcgcmVtYWluaW5nIGZyZWV6YWJsZSB0YXNrcyAuLi4gKGVsYXBzZWQg
MC4wMDEgc2Vjb25kcykgZG9uZS4NClsgIDEwOS45Mjk5NzddIHNkIDA6MDowOjA6IFtzZGFdIFN5
bmNocm9uaXppbmcgU0NTSSBjYWNoZQ0KWyAgMTEwLjAxOTc3Ml0gcmF2YiBlNjgwMDAwMC5ldGhl
cm5ldCBldGgwOiBMaW5rIGlzIERvd24NClsgIDExMC4yMjI5NzhdIERpc2FibGluZyBub24tYm9v
dCBDUFVzIC4uLg0KWyAgMTEwLjIyNzM3OV0gQ1BVMTogc2h1dGRvd24NClsgIDExMC4yMzAxMDhd
IHBzY2k6IENQVTEga2lsbGVkIChwb2xsZWQgMCBtcykNClsgIDExMC4yMzY0NTJdIENQVTI6IHNo
dXRkb3duDQpbICAxMTAuMjM5MjE2XSBwc2NpOiBDUFUyIGtpbGxlZCAocG9sbGVkIDAgbXMpDQpb
ICAxMTAuMjQ1MzA0XSBDUFUzOiBzaHV0ZG93bg0KWyAgMTEwLjI0ODAzM10gcHNjaTogQ1BVMyBr
aWxsZWQgKHBvbGxlZCAwIG1zKQ0KWyAgMTEwLjI1MzY0Ml0gQ1BVNDogc2h1dGRvd24NClsgIDEx
MC4yNTYzNzZdIHBzY2k6IENQVTQga2lsbGVkIChwb2xsZWQgMCBtcykNClsgIDExMC4yNjE4NzJd
IENQVTU6IHNodXRkb3duDQpbICAxMTAuMjY0NjM4XSBwc2NpOiBDUFU1IGtpbGxlZCAocG9sbGVk
IDAgbXMpIA0KLS0tDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
