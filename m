Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D72A2AB517
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Nov 2020 11:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgKIKfI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 05:35:08 -0500
Received: from mail-eopbgr1320111.outbound.protection.outlook.com ([40.107.132.111]:43952
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727077AbgKIKfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 05:35:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKsfXLe2x1eFikSKWob3wmwaNVk27ypiiyqgg5MNVorY3zR/FY/yAazzzF/hJg5LKcPq3wTDMhU7S5WTC1fFEwdlLqowhG8xr3XOUORIPtOyXEIdbOCxAfnerT7leX5wlFewSKKFUgHkkDcFTkuFo/HWHKy8aQuZwa9R5wv+uTYpgXm2TYt0/Q7YMLhqL7isjoEkpyXnMUtok//A9FG6E8/st8VQtbXrFWHHuTVf8JvObpYGHsKmmQp3RKpl+rmm4MlWtN0Xg6q25KlrK9tumiwC46/SvciK9FDwJlEIrhiki8QXTRJnlAZgWbx7pVqbbp3ZOIeMmjLNvHwbtdoDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G42xDJxJ4mFLwuv3szPzs1hj1wkZ7xYN8RGF9uqYV+s=;
 b=Nh/4uGeQhPA3mYV2L6zSrB73/uG0Y7xrryd99T3L2DHAwSoV/woqTD9zcV/5kVk+lLWSNm3oa+s/T46DfJxuEq3FEvNJH5OYDOrY6lcYSK2kVEEBFVvs3sW7wISfOipwlf5sTRo0oBNgKTPfiJv66PSJ8L+FQctYP76SL3mDu3aYkz7d2V3LpsLox4SVV6sibl3R8sI98R/P0MCNpm7/zMnpHl0EiBX0fb/B1bTOVRmLTGo+qp3+Ut9IFrLiPdx/vgYYUepTja2m5ZCtxlmZETMXTK2l2ZU/Oprrr5pbAGXCtKy1FqAr4Kdu/LWMGoXCXVdlEJUzXGIEI4fkgXzBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G42xDJxJ4mFLwuv3szPzs1hj1wkZ7xYN8RGF9uqYV+s=;
 b=RHp+PQmiUZilT/vpYa8kQiqpRTGcOvmz5zz+2gvLtvsUqCLu5k4dGGLWOeUSitx8MqIYJnKL7S/xVWvJpzWGylY2DI9NAtprEuhbg+bFdRBqgjYTjzNESQfurLhdOgnu8E55ANZDryY3iF+gmS8DtOFaMKkfpMDaNnWB8SINnMM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4026.jpnprd01.prod.outlook.com (2603:1096:404:e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Mon, 9 Nov
 2020 10:35:02 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 10:35:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: add sdhi/mmc aliases
Thread-Topic: [PATCH] arm64: dts: renesas: add sdhi/mmc aliases
Thread-Index: AQHWtB8erJxZkh+hv0iaRhwUVdWuX6m/lXYAgAAJylA=
Date:   Mon, 9 Nov 2020 10:35:02 +0000
Message-ID: <TY2PR01MB3692B844650D190200C3761BD8EA0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1604654877-30010-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUxcuafZ_AV__DG1vWoh1dqv_7z7-f85-t5GpzuuKs4eA@mail.gmail.com>
In-Reply-To: <CAMuHMdUxcuafZ_AV__DG1vWoh1dqv_7z7-f85-t5GpzuuKs4eA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 12bbb15e-e480-41ac-5e58-08d8849b1dcc
x-ms-traffictypediagnostic: TY2PR01MB4026:
x-microsoft-antispam-prvs: <TY2PR01MB402637AADD7FBECBEA88241CD8EA0@TY2PR01MB4026.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2dEwQoVEwFXVsTsU1s4oDRY8pVeuGr2jPx4S6VUrbmq7ENNZD10wQUkS3FTKtQTABS3KWycdXuXYVbBfkLaV1diMZ+ZsKJz0u8qdVjI42iXSJoj7qNaHGPsl7pzi159q6dxfI9kFro5vFAjyntifSKvJ1zMmFNSPQjQI93R8b/h7jjr4y9ucbyoxBncVbLOlr78zP0yHs2C8/kTGa1p4eh7CM7ct8uScgiEPW1+eYwIuu1m0jRaY38zPxzSqpb4XVvgmZr2SoZ+rnAAXULqDlBvebIwqdPfh2K1+92BCVneXMgiAc2gyZK7thyt5ma280E6WivpHaJm3jq6C+9RGNA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(6916009)(8676002)(76116006)(66946007)(2906002)(66446008)(64756008)(66476007)(71200400001)(66556008)(7696005)(55016002)(9686003)(54906003)(186003)(83380400001)(86362001)(478600001)(52536014)(26005)(33656002)(5660300002)(6506007)(53546011)(55236004)(4326008)(316002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 7gWpFbNIB8vFrEV9NVX/j/vcEwxNdXCjWo1Ocpl4IzqBmdZycrXckea+/WoxYDsOohEhz6yEzXxXw88rqr7OmWo7sURMr38DS03k8CkRC71BDT1ttKWwblS+a8ruP61qt9grvvPYo/UibC1cp6I2tKrZlsQ7SvIMeFAE+gRpjf7w5sRrv7ajz4YkQL/xKnYTACGWccMHnjHHlcYH0qDx1BXA5BsaNkKT4zb2ydO0r6Zy9cAb0mrr1e+kjhHERFv/Po10+ONbhq85EBLe0MWNj48Tkdet0hAaWF+SU/E760ysA5xwLNIhNMm0j6tPM+zSVKsPh05C/pBxdijzDzWbYKsrtp2iJrFW8yUGaTu+IYe8I/AktLtB4ZE+Pjl8+KfXPkqj2aytWPcT2FPtPZ8IP9AM2e538tHguDSRf4VW8OwYMCc2Pg+AKodPeGFFTz/Lqnphh8SI80I4xJdDOfITqqh7kfaHUw5oNXwHTAoGBuFrNAToZ+N8gbv2Dx6xWCFkQ5z09DCKxI0m6lTdJPJEhobjsGe5bkrIed6pgyXLv2DtFd+hNdMMiY28hcbbPi06c0J8Hv4RyCdsigQHyGaps6nMkbzX8iPoAuNKFEsmINnfEZSubEyu0BbrGYOdDz2ox57FOqft5JuiJzS+VrK79Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bbb15e-e480-41ac-5e58-08d8849b1dcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 10:35:02.6395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CvMCIUuaOVEY5KNCvvjBp6j2aiqZatv0iEy3gSMk2LtdyDRixgyB/UW+kGEZYtxZ1w62AdipOocp1lpPlpNGcq3Lx/cOfg7HwmzV5HXCMpGv2TBwwTnUx+UBDg5JFeYz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4026
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5
LCBOb3ZlbWJlciA5LCAyMDIwIDY6NTggUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
Q0MgZGV2aWNldHJlZQ0KPiANCj4gT24gRnJpLCBOb3YgNiwgMjAyMCBhdCAxMDoyOCBBTSBZb3No
aWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3Rl
Og0KPiA+IEFmdGVyIHRoZSBjb21taXQgNzMyMDkxNWM4ODYxICgibW1jOiBTZXQgUFJPQkVfUFJF
RkVSX0FTWU5DSFJPTk9VUw0KPiA+IGZvciBkcml2ZXJzIHRoYXQgZXhpc3RlZCBpbiB2NC4xNCIp
LCB0aGUgb3JkZXIgb2YgL2Rldi9tbWNibGtODQo+ID4gd2FzIG5vdCBmaXhlZCwgc28gdGhhdCB3
ZSBhcmUgaGFyZCB0byB1c2UgdGhlIGRldmljZSBhcyByb290ZnMNCj4gPiBieSB1c2luZyBhIGtl
cm5lbCBwYXJhbWV0ZXIgbGlrZSByb290PS9kZXYvbW1jYmxrTi4gU28sIGFkZA0KPiA+IHNkaGkv
bW1jIGFsaWFzZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghDQo+IA0KPiA+IC0tLQ0KPiA+ICBJJ20gYWZyYWlkLCBidXQgSSBvbmx5IHRlc3RlZCBv
biByOGE3Nzk1MS1zYWx2YXRvci14cy4NCj4gPg0KPiA+ICBJZiBwb3NzaWJsZSwgSSB3b3VsZCBs
aWtlIHRvIGFwcGx5IHRoaXMgcGF0Y2ggaW50byB2NS4xMC1zdGFibGUNCj4gPiAgYmVjYXVzZSB3
ZSBhcmUgaGFyZCB0byB1c2UgdGhlIGRldmljZSBhcyByb290ZnMgYXMgSSBkZXNjcmliZWQNCj4g
PiAgdGhlIGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4gDQo+IFBsZWFzZSBkb24ndCBhZGQgYWxpYXNl
cyBmb3IgdmFyaW91cyBkZXZpY2VzLg0KPiBZb3UgY2FuIHNwZWNpZnkgdGhlIHJvb3QgZmlsZSBz
eXN0ZW0gdG8gbW91bnQgdXNpbmcgUEFSVFVVSUQ9IG9yDQo+IFBBUlRMQUJFTD0gKGJ5IHRoZSBr
ZXJuZWwpLCBvciB1c2luZyBVVUlEPSBvciBMQUJFTD0gKGJ5IGFuIGluaXRyYW1mcykuDQo+IFRo
aXMgaXMgdGhlIHNhbWUgZm9yIC9kZXYvc2QqLCB3aGljaCBtYXkgY2hhbmdlIGFmdGVyIGEga2Vy
bmVsDQo+IHVwZ3JhZGUuDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJlcGx5ISBJIHVuZGVyc3Rvb2Qg
d2Ugc2hvdWxkIG5vdCBhZGQgYWxpYXNlcyBmb3INCnZhcmlvdXMgZGV2aWNlcyBhbmQgd2UgY2Fu
IHNwZWNpZnkgdGhlIHJvb3QgZmlsZSBzeXN0ZW0gYnkgdXNpbmcgb3RoZXIgd2F5cy4NCg0KQmVz
dCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
