Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 847DAAD90B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 14:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfIIMcn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 08:32:43 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:57984
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726476AbfIIMcn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 08:32:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1A37UcDxZ3fNqMVjelCID45vojEWIFv8v04vZDe/p/3gWQJ/dSojZK8Vm9/08fVtHOFqs2ZDI/rfEQD/93uwJRlQCIlJC6FqqNAWViCAE9gKkw9Z3OLLt0f2ewcHFSMgAE0YyL77/RU6LicFYdAWGIcHVT9SvOJHwovI52tWBUvEf4g1rwd/A0PMDK23F3v88xH8Ct5OdidnB6ktI8X2K8yLttVlkjW4voH7r/bLbo9v62KEcnDW3NdP5+EM7Gp8bVUAJzZSUwFQMQPghxTTA5gDJPWakafUGc/WXj2fPJuas2W82NhbIe5i1ts9blRCB+CW+4ufdfv5p2YGuPvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZoYJzKApMOJW/yo4DUKm702egPyC1kDR++Ybb4wPKg=;
 b=AEA7/V0HlMuLtbp4Ji3nRNlK1Av0qkwMEaygym3oblFuMdWz/30ZE4VJ5r7hBUttVEK8EmeKRl8b3PW+XznexongRa7ggsquRQjTtXfdILN92Y5Guglb2E7TJP+buGLP667YvrOf6/CvxnlrXHOTgwccOAH1FDdJzQP6dB66tGWFhjOGLbai2wwcQS4rRYsKeiOMIl1m+SMkkuVTI+ep4R7eyeOUYpgxTUa1UjbXx5gy6oe51Z7oU4SQUfBZvHcaH7jRsJkzDLBuaiy/GnZLfx3rXRV3u47yQZxppcU2nujN2i8+QKAe7u8aAhiFJ5yuxAEA08NgBQq2Vk++o/Rhfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZoYJzKApMOJW/yo4DUKm702egPyC1kDR++Ybb4wPKg=;
 b=NJ1kKUpCvyK1dVHLwUYB3tc94ezVKqe9Xqcl6jBjX61sEySAtiCXBTq1Zozi8AKUFOU/Di7hUOO72jfg2lJ6Buz3j/ViyWaUMkFzJ/CrK/Spc8IaD4u5JMNF+8EL8dghZ/98+XL4bPerNQiLcXJCc6BKWlm3d3TH830vDTFT0YQ=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1782.jpnprd01.prod.outlook.com (52.134.225.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Mon, 9 Sep 2019 12:32:40 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb%5]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 12:32:39 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 3/3] arm64: Add Renesas R8A774B1 support
Thread-Topic: [PATCH 3/3] arm64: Add Renesas R8A774B1 support
Thread-Index: AQHVY82L8Dpgug/lb0uJksEiv5CNk6cjTTYAgAAAXOA=
Date:   Mon, 9 Sep 2019 12:32:39 +0000
Message-ID: <OSBPR01MB2103C4171EA7F76F60A729C1B8B70@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com>
 <1567675844-19247-4-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdXxFEmuGRzYJCgqo5EpcXVzt6ZVpsy63BjA9fixFc5vtw@mail.gmail.com>
In-Reply-To: <CAMuHMdXxFEmuGRzYJCgqo5EpcXVzt6ZVpsy63BjA9fixFc5vtw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c922069-3936-4c9d-9595-08d73521cdd4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB1782;
x-ms-traffictypediagnostic: OSBPR01MB1782:|OSBPR01MB1782:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1782EA90E19DAC9BE2C136F4B8B70@OSBPR01MB1782.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(189003)(199004)(446003)(8936002)(25786009)(7736002)(8676002)(52536014)(102836004)(76176011)(5660300002)(6116002)(3846002)(81156014)(81166006)(256004)(53936002)(9686003)(6436002)(55016002)(229853002)(26005)(4326008)(33656002)(6506007)(186003)(107886003)(6246003)(53546011)(2906002)(478600001)(4744005)(14454004)(99286004)(7696005)(76116006)(54906003)(71200400001)(71190400001)(305945005)(86362001)(66066001)(316002)(6916009)(74316002)(11346002)(44832011)(64756008)(66556008)(66476007)(66446008)(66946007)(476003)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1782;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /cU4+oflYqjtD0xOfWLLOywvX5f5za4HM9dO4sWDmddhHRnLHeFXlOJ+i2UvbAL75jCbyz2VLP0lRrRopkpaxaIvg9uMgAZSr3XGoewzNvM7PWuXWQYIgoCmal9zTZggSd6LEveI+QhzJU/coNMNvsCIuOC/PwoDsz8QelhZDd0KxGRMf1C35zonswvlP5lPeJuGwQS1TtZjuvMLyuY4xlO4zlut3ojWFkhlZM2cqra6eg1S73rvVYl8O3LY4nean/l9TAVZjOvxp0M23c5o2bIdXzJle5f1SBaJZxYdeVKuSD9aW4WL8VrgQG3fjJCBiUziEoMNJtW0FRzCXf/CrflJMaNiTF1eCV0So4cR7du18yabpXQpBpU1nahrGylknePEcHTs9L3194ds+azCFGmHFRpiksIs19ViA/Bn7h4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c922069-3936-4c9d-9595-08d73521cdd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 12:32:39.7859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l7TBdWdtw3ye8XQ+G4WORpBbmCVahPEHPu+nSIT1JlobLaMSf1cDYWx2DzD/Pc1ctXZhHdpO6ZPdqWQclKXhSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1782
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy8zXSBhcm02NDogQWRkIFJlbmVzYXMgUjhBNzc0QjEg
c3VwcG9ydA0KPiANCj4gT24gVGh1LCBTZXAgNSwgMjAxOSBhdCAxMTozNyBBTSBCaWp1IERhcyA8
YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBjb25maWd1cmF0aW9uIG9w
dGlvbiBmb3IgdGhlIFJaL0cyTiAoUjhBNzc0QjEpIFNvQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiBpLmUuIHdpbGwN
Cj4gcXVldWUgaW4gcmVuZXNhcy1kZXZlbCBmb3IgdjUuNSwgd2l0aCB0aGUgb25lLWxpbmUgc3Vt
bWFyeSBjaGFuZ2VkIHRvICJzb2M6DQo+IHJlbmVzYXM6IEFkZCBSZW5lc2FzIFI4QTc3NEIxIGNv
bmZpZyBvcHRpb24iLg0KDQpUaGFua3MgR2VlcnQuDQoNCj4gDQo+IEdye29ldGplLGVldGluZ31z
LA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0K
