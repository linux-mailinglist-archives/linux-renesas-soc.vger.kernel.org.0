Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF6E1935A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 03:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgCZCQ1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 22:16:27 -0400
Received: from mail-eopbgr1400124.outbound.protection.outlook.com ([40.107.140.124]:1384
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727564AbgCZCQ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 22:16:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeWpZECHxo736gusRYi53EUKnmSxPsiv0VVYZapPnANP1YdiRYHxm8HMrZGGev+5ki1I6S+8eNNnIwWXwuJRA4AJcNnzQ3/2HfgC8wMqvQy7pX4RbWZNRHO6/KxrK+q5XQmeGgUHrggLIaI6dvlS6hDlXZuuPECXdcVMyX2AfqlCzQs0rUEgUlf6gMgEDbceLWHZHpBUtkPt55OPf2HpM4ts5Dqp/Ea/Ikbi/kyIVSGse9KtnW/U1IHOF7m3dVyhYVQaI7kF5AMl3OgP1fDMpeJsgxdWk/E+tQVqqqqSNuOCrvgnB0n9wLAyYZyPP7lYjCHR8Wm4KI7XOq0A4UPx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXMpw67/fP3uOEJhgO2WXN7v+LRJRVS1pTnvra7HEnY=;
 b=c2JwdkZnFi4e12fRVqu+gRm2qMvMHSDpcfJsC4rSHt4Eb3M5KL7uuKoTMbydqBsW0NUtvGOsWadIT3uDuPqaUasl4wvTzGfC19O/aH4HY23VPA+8ttr4monj0kdPWFlGLeKcrhyc3hBSeeo6TxAn6D+Z2yPuaN14nOLE5S6Yztrefl8QRgQBC9z4errdXgZsElPxT/u8/HOX0My8J4Tywjbth7Wq0IueF91sNmCL5M4bnA6Vzj68E+eySK23rOfTR8uLlZ78YLi3x9fdxDT9QarmnoK5a6mjO2HmLZ3exJ5d1l2pmLsi4eDJNOxf7Rw+ADSteWG4hJRHIvx8qU2/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXMpw67/fP3uOEJhgO2WXN7v+LRJRVS1pTnvra7HEnY=;
 b=O4nVsDId5IRZcTqaE9yJJllzuFU/TtQlPD7b9MsrvKEKVtSlYHkGkGIkDIfD2Dy0Z913dBr6iRpfC8xib0+CQaZpZusQ337GexEOidTJILABnvK9GapjWQSyZTZSwPjTZDrdPenlvrJGVKZuA+PWKQ2QOkrnZQetq5lzJiTD948=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3327.jpnprd01.prod.outlook.com (20.178.140.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Thu, 26 Mar 2020 02:16:22 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 02:16:22 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: phy: rcar-gen3-phy-usb2: add r8a77961
 support
Thread-Topic: [PATCH 1/2] dt-bindings: phy: rcar-gen3-phy-usb2: add r8a77961
 support
Thread-Index: AQHWAm02GDiI6HjUWU+POhjnHY73I6hZR4+AgADb7wA=
Date:   Thu, 26 Mar 2020 02:16:22 +0000
Message-ID: <TYAPR01MB454468B739FE4C4CFFF51801D8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1585117100-8359-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585117100-8359-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXhwxmDuwK9M4ctP9=FVBfdLHSroq-YhuMrFtXaCtNq4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXhwxmDuwK9M4ctP9=FVBfdLHSroq-YhuMrFtXaCtNq4Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 63ae065f-b59f-494a-bbed-08d7d12bade9
x-ms-traffictypediagnostic: TYAPR01MB3327:
x-microsoft-antispam-prvs: <TYAPR01MB3327FA9ADEC9EB7DA186180AD8CF0@TYAPR01MB3327.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(5660300002)(86362001)(316002)(6916009)(64756008)(55236004)(33656002)(186003)(6506007)(55016002)(76116006)(9686003)(8936002)(8676002)(2906002)(4326008)(52536014)(26005)(81156014)(66946007)(54906003)(66556008)(66476007)(66446008)(81166006)(7696005)(71200400001)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3327;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VF//YlnkBVgm2S+kN4YsIzFJYWy6pqwT/m/MPD4xK4ZXeQ7Es3JOdlkl+Y+NMpGE6ZkZnbaBixZUptMZp4xoaXGZ7rvynw7qX0cIv6qEa8eI9bVivUG4cfBP2RQC2OZFVbSXLLyc6feB1n29UtDFQPHpUUa9sQiPh8mZZTKuds8gbY7OOVMYZ71lex6Mo37D2d8nT76s7ubHlhAaO+a6xt4X6RfrNWlC+gUihmClzhX7qBNaVmsi6ytjezfTO1hGdvA1pHpPcmjyWl7vZ9G78ID1aobUCbWHbFtT//0QfwbvzIJRip0FS0OO4kyV9RoJdM0zZpTyBbl9azePRfb3/J0Su00O5sNnTID8yE9akIiIU1v2BncA8tXrmuutiv1uiXhQcK690t0gL9IQQR2HhHdOz6dzNN/d2Ys1/6G9dly0GhUFRyJbPVqbWZjhIopSpGeAfIU2OSAT7lQOJbF5W/SXuRbqcW4rl8Pu+e3p3GVPGncNoMJkADd7uxRuNujerqmnlpqyBLTbzKYXCDVDoQ==
x-ms-exchange-antispam-messagedata: o3aG3rww4LCi03nBvOj2A02zsRBdQAgNEc8qWEDVn5Z8z5J0YApARulY7UpByDcPeyB0dFsgpXGJoVX4JF2JPTKP96XTpPcFtvzJUzHibwkj5vkLMHR620WJy32rK4biXigI6iR8Mj6YXIxKr4qWGQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ae065f-b59f-494a-bbed-08d7d12bade9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 02:16:22.6820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WEWD3Xdsx3paMmYj6RJxYGgstkj9hRVDjsTTTkAvg4Vu4W7HfBzug8VWW5ek9FwGCs8GerZ/+Ndw67lO9FNz48In/q8qcyBp6LrMsqb+5etHfLJBnfEo7NnNFSs8s5vZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3327
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBNYXJjaCAyNSwgMjAyMCAxMDowNyBQ
TQ0KPHNuaXA+DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bo
eS9yY2FyLWdlbjMtcGh5LXVzYjIudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BoeS9yY2FyLWdlbjMtcGh5LXVzYjIudHh0DQo+ID4gQEAgLTE4LDYgKzE4
LDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiAgICAgICAgICAgICAgIFNvQy4NCj4gPiAg
ICAgICAgICAgICAgICJyZW5lc2FzLHVzYjItcGh5LXI4YTc3OTYiIGlmIHRoZSBkZXZpY2UgaXMg
YSBwYXJ0IG9mIGFuIFI4QTc3OTYNCj4gDQo+IFdoaWxlIGF0IGl0LCB5b3UgbWF5IHdhbnQgdG8g
dXBkYXRlICJyOEE3Nzk2IFNvQyIgdG8gInI4QTc3OTYwIFNvQyIsIHRvDQo+IGF2b2lkIGNvbmZ1
c2lvbiBiZXR3ZWVuIFItQ2FyIE0zLVcgKFI4QTc3OTYwKSBhbmQgTTMtVysgKFI4QTc3OTYxKS4N
Cj4gDQo+IE5vdGUgdGhhdCByZWJhc2luZyB0aGlzIHBhdGNoIG9uIHRvcCBvZiB5b3VyICJbUEFU
Q0ggdjJdIGR0LWJpbmRpbmdzOg0KPiBwaHk6IHJlbmVzYXM6IHVzYjItcGh5OiBjb252ZXJ0IGJp
bmRpbmdzIHRvIGpzb24tc2NoZW1hIg0KPiAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
ZGV2aWNldHJlZS8xNTcyNTkyNzYzLTEyMzk2LTEtZ2l0LXNlbmQtZW1haWwteW9zaGloaXJvLnNo
aW1vZGEudWhAcmVuZXNhcy5jb20vKQ0KPiB3b3VsZCBhdm9pZCB0aGF0LCB0b28uDQoNCkkgY29t
cGxldGVseSBmb3Jnb3QgYWJvdXQgdGhlIHBhdGNoIEkgbWFkZS4uLg0KU28sIEknbGwgcmViYXNl
IHRoaXMgcGF0Y2ggb24gdGhlIC55YW1sLg0KDQoNCj4gPiAgICAgICAgICAgICAgIFNvQy4NCj4g
PiArICAgICAgICAgICAgICJyZW5lc2FzLHVzYjItcGh5LXI4YTc3OTYxIiBpZiB0aGUgZGV2aWNl
IGlzIGEgcGFydCBvZiBhbg0KPiA+ICsgICAgICAgICAgICAgUjhBNzc5NjEgU29DLg0KPiA+ICAg
ICAgICAgICAgICAgInJlbmVzYXMsdXNiMi1waHktcjhhNzc5NjUiIGlmIHRoZSBkZXZpY2UgaXMg
YSBwYXJ0IG9mIGFuDQo+ID4gICAgICAgICAgICAgICBSOEE3Nzk2NSBTb0MuDQo+ID4gICAgICAg
ICAgICAgICAicmVuZXNhcyx1c2IyLXBoeS1yOGE3Nzk5MCIgaWYgdGhlIGRldmljZSBpcyBhIHBh
cnQgb2YgYW4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPg0KDQpUaGFua3MhDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBT
aGltb2RhDQoNCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4g
cGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNl
bGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
