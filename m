Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734052236FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 10:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgGQI3I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 04:29:08 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:9142
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726071AbgGQI3F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 04:29:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAu1OjuMNuOvZiwbiExkMVZYKd1A2Zteh9sA55DQLP11NuubQF4Cgcox8FHAxHuER4oJYBlClZxldw7MYSl1z2qOWEVyW3VniwTNH88tqFVBZYnVm9qml+y9cHUB5o8Dn5IEBZFXXxWyik6i8pN5anToBSPF0m1smfXt7j3d/nel26gyBmmBWsm0MMNP5N42CFkHrn4zi/Ww7HUcJixmoayIjVxWuiSFQ/4l5oRnlIeiQTUDgXCEZs2KcYtiN+qt4HUUq6HpmpbaxIfZYMpAPw66NBYHIm7CErei/j/BxEvdJ8GAP9ZKGyqkG9M/wkqDsXxYqBOw2Z0Tn6FZ/DRHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeuPMQwONoO0veQcxYTElEgMmvMTcndAhPkapEKiQ1M=;
 b=nabEm8Z27/Gj7/FlbtWozqq/ukl60lkIGyVaqd56l389DveYvMgRAG1CrxwMy3JLuwty/w7t+fqLP0+NAk4Forz0IhzOK3F6qCXKl/F3iTK1AArr/HDbjlasW8P8iF7N77QdrwsgJ9u828ecx3oevuW/2v6TbiBK3XnxYNbbhKmQqe/ib3YMz+qTElaGk5gLQ5YzbCorZ/+ITJwOB9TeoC4eRWdSPfj10SI2dyRJN83PR1HfYfwVTNa+Pp9QZXTv37LNTf4iulQXtgZAhzYxFm7qoB/PlG4Psd7FDnnpoO2Jec2CmI5hSDasE5iVSn/ZtK+gV2jlW8Hrnq2aN86Oaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeuPMQwONoO0veQcxYTElEgMmvMTcndAhPkapEKiQ1M=;
 b=V94uaGYqXidiUqX4MgoKsiHwA6JvHukF54FqhxZCpLK7JpQ0PcIkb9is3SGOnJiimKdjl6WJltGfsTKCRXGGS2goGjzaB8RewVcisfCEdgzi17TcEe2Q1qzlZpLgd7oO7KtrYu2cZQiMkoNJCh+PywLWtOWthR3ALhRNK57M10Q=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2958.jpnprd01.prod.outlook.com (2603:1096:404:85::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 17 Jul
 2020 08:29:03 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 08:29:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: add full-pwr-cycle-in-suspend into
 eMMC nodes
Thread-Topic: [PATCH] arm64: dts: renesas: add full-pwr-cycle-in-suspend into
 eMMC nodes
Thread-Index: AQHWVrImoipTHpQCfEOOGfl8yMfzBakIYI8AgALjfUCAACHpAIAAEe1g
Date:   Fri, 17 Jul 2020 08:29:02 +0000
Message-ID: <TY2PR01MB3692646F94A991EB373A8AA3D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594382612-13664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVqFU538syZq2B=An-MA3zo3RT115JmvaVxyt5mb-Wvsg@mail.gmail.com>
 <TY2PR01MB3692CD5627D9848ADDA88BF0D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdVzO=wwTyYhHj2Cg3g_rRQCHQ_97DVH8zXAkg_ki5ZHhw@mail.gmail.com>
In-Reply-To: <CAMuHMdVzO=wwTyYhHj2Cg3g_rRQCHQ_97DVH8zXAkg_ki5ZHhw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c1e33a86-d19c-4920-1912-08d82a2b7653
x-ms-traffictypediagnostic: TYAPR01MB2958:
x-microsoft-antispam-prvs: <TYAPR01MB2958ED3E39FFE7A0658145A1D87C0@TYAPR01MB2958.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jglpm02NJXBpNMVjDfCBYNaaxVb0GoiXrC/kFShb0DLF4Cp067FSpC7ErGq2zbzQ0zUEPJlTX3KYtwVnf47bZ5du1LpeBf88ViX2lfT2sLwH+9WSaYVl739BHjz7EEE7Q2VekxJKqYxjGfCsgZU5jIwg2W8iYNMGwFKckS38RMUHCXtqiA24oglQ2Gi+sucIwDrDWoSBAPhE+Vp5nCAppcjQL3yUS/8whWKgFFeQQ5UqKYActfgukrajI8P5tlJKVwS6CNWf74sgOs6XgpSJtWtKTEPSExzhkYsCPPFycKFFwW/RNBDP57GDI8AEOrcyt719KmEdjPY+ZlavPU/Fa4E9V8Jjpu8ri+UCa4HIIMK/B22rtoSzrHFyZ6rLdg+n2HKDEWpWkl9hwMx0QU4zQg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(8676002)(53546011)(86362001)(76116006)(64756008)(66946007)(186003)(83380400001)(4326008)(9686003)(55016002)(966005)(71200400001)(316002)(478600001)(5660300002)(52536014)(2906002)(7696005)(6916009)(66556008)(55236004)(54906003)(66476007)(15650500001)(6506007)(66446008)(26005)(8936002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: HAMiJKrU3xcBbm8hW+ippKmg3vjlkT7Je9pHdbgxxOwt0TF6g5GDWmB926G1AaZRy1/wIWKrtWslX3sUYfoFwhMg7oONwFTbtrvtI652WjDqf5GSdkmnUfilEBkj/kMNTJJcvOeTgi1EQvhurw0JVSM9yn50kRZVmVM7qybzPtjWXJZXqugi7Qdr9BnC3q5l4VzQ7XGSqOChox8U8EMaA5ts0wEP8YtPZ2of1B33Gs4vytZTqeAfDLp8wZHS4NBKzPh0mRdU45b41c4uMY5SxSRQIwcxp4UR4mynYUw1UOeBi/H++Oy0cuBl0TYxJjeEiRXanG8Xo7zlhVQ0U1BkXXJP6AeRdNvTlmhF5KMcL1Ncx5ubcrqHitFpW1EHZMDRKiM/2XAQLoWhZRRVEqlNkydEVofoEl6b2r+XNKQoEcrZYWY5DxCqcsQfs5XL/NtubO0UDw1TJwbBYcs0SwIwrzCB3oYMG1Vt7/TCDndOEk5XfpNSbSu36gyZBgB7iUUL
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e33a86-d19c-4920-1912-08d82a2b7653
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 08:29:02.8653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5GsQvFR+qjVdOTBrZUuQ0o9wweebTnc6+O1e0vv1qDInmg0D1DtWp0j2LWcJFJtcY/lnjNCAYWAYi0XyGCANsBrE78zcvTXeDXWqMh66asQZwWVYZbXjlBw9NEHpgM9o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2958
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBKdWx5IDE3LCAyMDIwIDQ6MTMgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4gT24g
RnJpLCBKdWwgMTcsIDIwMjAgYXQgNzo0NCBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0
dGVyaG9ldmVuLCBTZW50OiBXZWRuZXNkYXksIEp1bHkgMTUsIDIwMjAgNjowNSBQTQ0KPiA+ID4g
T24gRnJpLCBKdWwgMTAsIDIwMjAgYXQgMjowMyBQTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA+ID4g
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCjxzbmlwPg0KPiA+ID4g
PiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLWViaXN1LmR0cyAgIHwgMSAr
DQo+ID4gPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvc2FsdmF0b3ItY29tbW9uLmR0
c2kgfCAxICsNCj4gPiA+DQo+ID4gPiBJIGFzc3VtZSB3ZSBuZWVkIHRoaXMgb24gb3RoZXIgYm9h
cmRzLCB0b28/DQo+ID4gPiBBdCBsZWFzdCBVTENCIHVzZXMgdGhlIEJEOTU3MSBQTUlDLCBhbmQg
aGFzIGEgc2ltaWxhciBQU0NJIHMycmFtDQo+ID4gPiBpbXBsZW1lbnRhdGlvbiBhcyBTYWx2YXRv
ci1YKFMpIGFuZCBFYmlzdS4NCj4gPg0KPiA+IEkgdGhpbmsgc28uIEFuZCwgSSBhbHNvIHRoaW4g
VUxDQitLRiBzaG91bGQgbm90IGhhdmUgdGhpcyBiZWNhdXNlDQo+ID4gaXQgZG9lc24ndCBzdXBw
b3J0IFN1c3BlbmQtdG8tUkFNLiBCdXQsIHdoYXQgZG8geW91IHRoaW5rPw0KPiANCj4gSG93IGNv
bWUgVUxDQitLRiBkb2Vzbid0IHN1cHBvcnQgczJyYW0/DQo+IElzbid0IEtpbmdGaXNoZXIganVz
dCBhbiBleHRlbnNpb24gYm9hcmQgZm9yIFVMQ0I/DQo+IERvZXMgaXQgcmVxdWlyZSBhIGZpcm13
YXJlIHVwZ3JhZGU/DQoNCkl0J3MgcmVsYXRlZCB0byBib2FyZCBkZXNpZ24uIElmIFVMQ0IrS0Ys
IHdlIG11c3Qgbm90IHVzZSA1ViBBQyB0byBVTENCIHNpZGUNCmFuZCBtdXN0IHVzZSAxMlYgQUMg
dG8gS0Ygc2lkZS4gQW5kIEtGIGhhcyBwb3dlciBzd2l0Y2ggYXMgU1c2IGZvciBib3RoIFVMQ0Ir
S0YuDQpodHRwczovL2VsaW51eC5vcmcvUi1DYXIvQm9hcmRzL0tpbmdmaXNoZXINCg0KSG93ZXZl
ciwgUE1JQyBvbiBVTENCIGNhbm5vdCBjb250cm9sIHRoZSBLRiBwb3dlciB1bmZvcnR1bmF0ZWx5
Lg0KU28sIHdlIGhhdmUgbm8gY2hhbmNlIHRvIHVzZSBzMnJhbSBvbiBVTENCK0tGLi4uDQoNCj4g
PiBKRllJLCBJIGNvdWxkIHN1Y2ggZW52aXJvbm1lbnQgaWYgSSBhZGRlZCB0aGUgcHJvcGVydHkg
aW50byB1bGNiLmR0c2kNCj4gPiBhbmQgYWRkZWQgIi9kZWxldGUtcHJvcGVydHkvIiBpbnRvIHVs
Y2Ita2YuZHRzaS4NCj4gDQo+IElmZiB0aGF0J3MgdGhlIGNhc2UsIHRoYXQncyBhIHZhbGlkIHNv
bHV0aW9uLg0KDQpJIHRoaW5rIHRoYXQncyBhIHZhbGlkIHNvbHV0aW9uLiBCdXQsIHdoYXQgZG8g
eW91IHRoaW5rPw0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
