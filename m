Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC951935C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 03:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbgCZCT4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 22:19:56 -0400
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:7200
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727575AbgCZCTz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 22:19:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIhZru63Cto2TuqdrPW+LZg6eCOdi8F93PThj/I23IuN/we/X/4QnEX8K6PpzWY/kIn4TODCYhGly1NTer8jXGvQ09pd1gYX85d8Y7ho7X99FU7tqiiFWt2HY7kQs9pyrqoehL9Rhnpl0Nj25ElBBx7Ic7fZS9ArXoXto/MdmAOBs2vVf7QMJpDksIm3jRUmyCggXlh49ONM+NMoJe9ws1onz0j6GJvbLA7Cd1XWJVwMjOsKHzOWKrFj+1gWKzvn/sPsv6lLbROuR4vnpEINWBzMeP/PP49XJXBcDzAinC8EghRxNbc+QZw34bhwU5zFqJnf7EB2LUj2cdecjsYDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNVn77IIxrHtQErk2aYorAbCbnjIyKOkJhpgqM9ieNU=;
 b=ED7wk8zVoJfNUpTN/ZYwt2//ElU7dIkN1is8wrDK+taXS/gyFjQl7DYT/D9HCvNFdpGeBtEr7gyRVi+s1meI0ohbkdcGco7tShAgEtQbd7Zdmf7JEOmkeWqjn7UZwkApAKA3HcaNFQbbJ6+zQSx3xQBrD6qcJ+E7uYVuUHqgn0rRIEUoKUtiFoDTdYAQxm+zoiF7iJ7bQVJtqVl1Tj9jLlleR4q6NWpZmbWhdFOVdBDVFQ6pUjEgjdT520iimUz9iDvwvxMTsHE1CJHprVSMgKUL8LWZSZ6RG766gZC8gK42/6lNOzmy6w3H7jxjKJIH+19Xk5JrUN7r9gi3D7WCvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNVn77IIxrHtQErk2aYorAbCbnjIyKOkJhpgqM9ieNU=;
 b=roPXjhE9duZ3fxe/ymB9CJTxOvnVmyhhlq76lc9fHE1N9r9oLH+Uy3UIgJldBevfmalJE/dnvo6N51hZS6pKpa53E+1lAeMjTna9Y8tIuo0Za/+7zKqge4aAKkuv7ASWjdqDQF3XDeawHBEG+xW6D0aOPyGzSTZtdpGE5Oc943M=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5232.jpnprd01.prod.outlook.com (20.179.174.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Thu, 26 Mar 2020 02:19:52 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 02:19:51 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] dt-bindings: phy: rcar-gen3-phy-usb3: add r8a77961
 support
Thread-Topic: [PATCH 2/2] dt-bindings: phy: rcar-gen3-phy-usb3: add r8a77961
 support
Thread-Index: AQHWAm01g/idEsDtZE+ykaC1jGkcE6hZSF0AgADckeA=
Date:   Thu, 26 Mar 2020 02:19:51 +0000
Message-ID: <TYAPR01MB4544559E62F9CE5826DD938CD8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1585117100-8359-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585117100-8359-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUu9KF8NU-4d+8xUF8_iqicHq1QOOhoqrvSCOrPLEwWEA@mail.gmail.com>
In-Reply-To: <CAMuHMdUu9KF8NU-4d+8xUF8_iqicHq1QOOhoqrvSCOrPLEwWEA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fbc27490-5c3e-47a5-f65a-08d7d12c2a9d
x-ms-traffictypediagnostic: TYAPR01MB5232:
x-microsoft-antispam-prvs: <TYAPR01MB5232ECB8A5D0C94BDEEFB789D8CF0@TYAPR01MB5232.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(316002)(4744005)(52536014)(64756008)(66476007)(5660300002)(66946007)(6916009)(66556008)(6506007)(76116006)(55236004)(7696005)(71200400001)(81156014)(8936002)(81166006)(33656002)(54906003)(66446008)(2906002)(478600001)(26005)(55016002)(9686003)(4326008)(86362001)(8676002)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5232;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VNbPFNQglnlny3/d69rmih+12vpe53ZFwQ/nOFAwbStra32x5K+r1NhZ7WZ6Ni/4Vhyhsc5UNlH/rEDIqDxKWrcSsNfA3cGB9fdXz20hg376AZ4eVjMl8hHdia6Zz3bmLAQxNxLTDYwfZN6CqYHx19WI5N3HZBrrp+CuFVEPGi9oD/Vq46ub9zGe5Uoe6xWsHetDn/xozEp+fXvDjV3DsOZDF5JvkPchh01lbvgZR10HDSfOKrog6aEihEIpNroJA8M6T81KcV1S83IH20TNql1SwDy6Luy+hLDccKqSQ+lBFxUUXEAUCyd1voPkM2bjK3KlhCJxMKFdT54CAiDLv/QsYWHsaOYbUUqa8l387XBoxXz96DtLdMZoFYnoUClXKb4HMYE9+ECIAG1jHKhlh+4TK87WMOWKgxcDIWRNpP5zytYtIBPhs4/c/PzqC890KUaWburKLBxXOat1gG/Yeg+Wy1hJEKzTfgo/av+l5eQMR1Gf9YUN+U5K7KkdyHvHV6DF+pW6fKUN23ImepClCA==
x-ms-exchange-antispam-messagedata: AnDMzqspFPMSKmyNtXvr2D7qzzewbbx5YenpdPVtu025TWM15cq8ZFrifAYcIeoxLbfRa6S9SBgFDlZndZkmYEcfClQHHh4rpYE9Cs1WEhDI+5IBMCz2sNkJ3Ptt4ORGeBf/LuGcbJ261jZFmmJPiA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc27490-5c3e-47a5-f65a-08d7d12c2a9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 02:19:51.8876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tqfia0r9KrwIHyaf8KNFPwc49Kk6Xw+doyD0fv4yMkiJM6dCZZGOelzUq/G1oF7ZDO2grS10xFF7HcrRiDiyCenADQadOukBkZyQt+7mwoWzdwvlfR130b1VfOhStijy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5232
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBNYXJjaCAyNSwgMjAyMCAxMDowOSBQ
TQ0KPHNuaXA+DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bo
eS9yY2FyLWdlbjMtcGh5LXVzYjMudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BoeS9yY2FyLWdlbjMtcGh5LXVzYjMudHh0DQo+ID4gQEAgLTE1LDYgKzE1
LDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiAgICAgICAgICAgICAgIFNvQy4NCj4gPiAg
ICAgICAgICAgICAgICJyZW5lc2FzLHI4YTc3OTYtdXNiMy1waHkiIGlmIHRoZSBkZXZpY2UgaXMg
YSBwYXJ0IG9mIGFuIFI4QTc3OTYNCj4gPiAgICAgICAgICAgICAgIFNvQy4NCj4gPiArICAgICAg
ICAgICAgICJyZW5lc2FzLHI4YTc3OTYxLXVzYjMtcGh5IiBpZiB0aGUgZGV2aWNlIGlzIGEgcGFy
dCBvZiBhbg0KPiA+ICsgICAgICAgICAgICAgUjhBNzc5NjEgU29DLg0KPiA+ICAgICAgICAgICAg
ICAgInJlbmVzYXMscjhhNzc5NjUtdXNiMy1waHkiIGlmIHRoZSBkZXZpY2UgaXMgYSBwYXJ0IG9m
IGFuDQo+ID4gICAgICAgICAgICAgICBSOEE3Nzk2NSBTb0MuDQo+ID4gICAgICAgICAgICAgICAi
cmVuZXNhcyxyY2FyLWdlbjMtdXNiMy1waHkiIGZvciBhIGdlbmVyaWMgUi1DYXIgR2VuMyBvciBS
Wi9HMg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+DQo+IA0KPiBMaWtld2lzZSwgYSByZWJhc2Ugb24gdG9wIG9mICJbdjJdIGR0
LWJpbmRpbmdzOiBwaHk6IHJlbmVzYXM6IHVzYjMtcGh5Og0KPiBjb252ZXJ0IGJpbmRpbmdzIHRv
IGpzb24tc2NoZW1hIg0KPiAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJl
ZS8xNTcyNTkyNzcxLTEyNDQ0LTEtZ2l0LXNlbmQtZW1haWwteW9zaGloaXJvLnNoaW1vZGEudWhA
cmVuZXNhcy5jb20vKQ0KPiB3b3VsZCBiZSBuaWNlLg0KDQpJIGFncmVlZC4gSSdsbCByZWJhc2Ug
aXQuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
