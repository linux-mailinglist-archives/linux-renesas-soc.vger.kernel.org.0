Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8CC5BADF2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 08:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404722AbfIWGmT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 02:42:19 -0400
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:54893
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404408AbfIWGmT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 02:42:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpS1NCKODoWZ+IVRgHMmsH0moAB1UTJD6u+eVx29d5S4LdRUWg5TdeSe7uDWdUCeTV8woi85i0AeD87zPfmPA2sDq0aAxrangK+vvoRMAR58M/AlbWbmeG31m5GvrtO0cs3Y23qbp7biNMOeIGYKOLCavQy7oLvJud7ch3xC4kUpGjEbLOQq0ElJ9xh0/b8lJAU+mEV2gODSqvZSq5rvOTtV17AJgrvRn/niU/co1VPz6elaeQZPRIP5o54RtRcC9fIVc5xLOjWe8aZrwLFj3+wwIJ7BC0yY9OSbHClRPEV7RY2rhYYZRmzgSqK+rUrlut9MfHOwKkC1OCRygVhwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/yuiO54jrBuoyXJqVnWtnMkzSXXqTa1aTWPjuzKRq0=;
 b=SfpWs1AHzHI9JeL1qU3Yl49uRVegzYsXRcCTfsSGvz4KltGH5wNNxkOLhvmq0S8CBZ6+jOFRpEWNNRh0nhlyQ8SwqVDpf4u74NvAfqg/vONR67XHgBwoMNtBIi4lfAN8/98eWcfY2ACl8WXySx6U2bWIvwzg+PA0mNhTXb/aaCHl5N/hfXIfuZRMzSjMgaVk8Lufhg8hgPTU5yNdG2DvdPnuQ/aK3h8kg/Fh+mkw+VbY6ewHjRLIsk2C6gHs+CZ+qLCBPYsGoptwXFeEb9SXgfw0wlap9Z8gFYvJc9fD+hQh8XIx0iIAq52Radjyj6wReiPt1tUFfnpRuPUfEnm/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/yuiO54jrBuoyXJqVnWtnMkzSXXqTa1aTWPjuzKRq0=;
 b=r9gN5z+oI8lDfe71j3AMyljTrNPIDZt9QklaAvC95qZHrJIGhSbxYsTYxp8uCDuLN9fgVp67FC4sYXopWgJE9tDrDX16zKThMYOgWd2sNpwqlvKssQswktfEU2/SxG5fSeQK8XexFke/HoTtSUbmM+gNf/O4OBWWg2C9BNGAkUk=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1655.jpnprd01.prod.outlook.com (52.134.227.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 06:42:13 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 06:42:13 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v2 2/8] soc: renesas: rcar-sysc: Add r8a774b1 support
Thread-Topic: [PATCH v2 2/8] soc: renesas: rcar-sysc: Add r8a774b1 support
Thread-Index: AQHVbsKuu8LKqdUXjU6PgkpjsCNDL6c0qSUAgAQsyLA=
Date:   Mon, 23 Sep 2019 06:42:13 +0000
Message-ID: <OSBPR01MB2103BCC545F3F4C4AFB3A61CB8850@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com>
 <1568881036-4404-3-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUvVKYZuzS7Z9uiN=KmdKm6GPnGS0oZbGZKfkbaUOB+Ng@mail.gmail.com>
In-Reply-To: <CAMuHMdUvVKYZuzS7Z9uiN=KmdKm6GPnGS0oZbGZKfkbaUOB+Ng@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ade7b3d-a024-4a60-2a94-08d73ff12aca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:OSBPR01MB1655;
x-ms-traffictypediagnostic: OSBPR01MB1655:|OSBPR01MB1655:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB16552234E9587CE2D4C12448B8850@OSBPR01MB1655.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(51914003)(189003)(199004)(7736002)(81166006)(71190400001)(74316002)(9686003)(71200400001)(52536014)(316002)(66066001)(26005)(186003)(102836004)(33656002)(6506007)(66946007)(99286004)(76116006)(66476007)(66446008)(53546011)(64756008)(66556008)(6916009)(5660300002)(54906003)(3846002)(8936002)(305945005)(6116002)(446003)(2906002)(4326008)(14454004)(86362001)(476003)(44832011)(478600001)(81156014)(486006)(11346002)(6436002)(229853002)(256004)(107886003)(6246003)(76176011)(8676002)(55016002)(25786009)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1655;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GxIOoxXtuebIzhMip40WSGhtuAy441Hmx+k/dknXlv3eDIWl6xP9+EPZ94gdHovo8saDirC7SGlIBhsz0vnXXN8kJFeazdQIWXnl+HES/uXwCvMbGDh4JAWtgpo+f66DGNCTzmJ2hTtooyDNr6hHGUFUZUasz5qQgjZkD3s6EHjFyfBudHOKiGk0jTy9uCWsmUoWzJlbin0Rw0LjoAFVrDdLcwreBOaw2ShDfoxUSOxC5RBn9y8ryD4gsuW+z/4Fymig+SJCTBSHFIr4PwC+m8oQEbYlO6O8ZSac4MAIhSr0os9KZqOCafx/AUpdlQwwjpCoDHQ5gPmwt/Y/6agb3QXesqvWMfImKWs0TMHi5ARByhW9GgouzAJ+5PAZT8I4g3z/3qr6XFwWHevHKcc3CR3SLhFypZ7dY4nT/e7KQYE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ade7b3d-a024-4a60-2a94-08d73ff12aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 06:42:13.2125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GT1ZSy+/oEChX+Hba4QlUH2C6/8UlpOX8lZBzYf1NWqW1kew9VXnWhETbElgIdlA54ztroyyZq5JpoTmErLN3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1655
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SEkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMi84XSBzb2M6IHJlbmVzYXM6IHJjYXItc3lzYzogQWRkIHI4YTc3NGIxIHN1cHBv
cnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIFNlcCAxOSwgMjAxOSBhdCAxMDoxNyBB
TSBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEFkZCBz
dXBwb3J0IGZvciBSWi9HMk4gKFI4QTc3NEIxKSBTb0MgcG93ZXIgYXJlYXMgdG8gdGhlIFItQ2Fy
IFNZU0MNCj4gPiBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL3I4YTc3NGIx
LXN5c2MuYw0KPiA+IEBAIC0wLDAgKzEsMzUgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiArICogUmVuZXNhcyBSWi9HMk4gU3lzdGVtIENv
bnRyb2xsZXINCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDE5IFJlbmVzYXMgRWxlY3Ryb25pY3Mg
Q29ycC4NCj4gPiArICoNCj4gPiArICogQmFzZWQgb24gUmVuZXNhcyBSLUNhciBNMy1XIFN5c3Rl
bSBDb250cm9sbGVyDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxNiBHbGlkZXIgYnZiYQ0KPiA+
ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9idWcuaD4NCj4gDQo+IFRoaXMgaW5j
bHVkZSBkb2Vzbid0IHNlZW0gdG8gYmUgdXNlZD8NCg0KT0ssIFdpbGwgcmVtb3ZlIC4NCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL3Bvd2VyL3I4YTc3NGIxLXN5c2MuaD4NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJyY2FyLXN5
c2MuaCINCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmNhcl9zeXNjX2FyZWEgcjhh
Nzc0YjFfYXJlYXNbXSBfX2luaXRjb25zdCA9IHsNCj4gPiArICAgICAgIHsgImFsd2F5cy1vbiIs
ICAgICAgMCwgMCwgUjhBNzc0QjFfUERfQUxXQVlTX09OLCAtMSwNCj4gUERfQUxXQVlTX09OIH0s
DQo+ID4gKyAgICAgICB7ICJjYTU3LXNjdSIsICAgMHgxYzAsIDAsIFI4QTc3NEIxX1BEX0NBNTdf
U0NVLA0KPiBSOEE3NzRCMV9QRF9BTFdBWVNfT04sDQo+ID4gKyAgICAgICAgIFBEX1NDVSB9LA0K
PiA+ICsgICAgICAgeyAiY2E1Ny1jcHUwIiwgICAweDgwLCAwLCBSOEE3NzRCMV9QRF9DQTU3X0NQ
VTAsDQo+IFI4QTc3NEIxX1BEX0NBNTdfU0NVLA0KPiA+ICsgICAgICAgICBQRF9DUFVfTk9DUiB9
LA0KPiA+ICsgICAgICAgeyAiY2E1Ny1jcHUxIiwgICAweDgwLCAxLCBSOEE3NzRCMV9QRF9DQTU3
X0NQVTEsDQo+IFI4QTc3NEIxX1BEX0NBNTdfU0NVLA0KPiA+ICsgICAgICAgICBQRF9DUFVfTk9D
UiB9LA0KPiA+ICsgICAgICAgeyAiYTN2YyIsICAgICAgIDB4MzgwLCAwLCBSOEE3NzRCMV9QRF9B
M1ZDLA0KPiBSOEE3NzRCMV9QRF9BTFdBWVNfT04gfSwNCj4gPiArICAgICAgIHsgImEzdnAiLCAg
ICAgICAweDM0MCwgMCwgUjhBNzc0QjFfUERfQTNWUCwNCj4gUjhBNzc0QjFfUERfQUxXQVlTX09O
IH0sDQo+ID4gKyAgICAgICB7ICJhMnZjMSIsICAgICAgMHgzYzAsIDEsIFI4QTc3NEIxX1BEX0Ey
VkMxLCAgICBSOEE3NzRCMV9QRF9BM1ZDIH0sDQo+ID4gKyAgICAgICB7ICIzZGctYSIsICAgICAg
MHgxMDAsIDAsIFI4QTc3NEIxX1BEXzNER19BLA0KPiBSOEE3NzRCMV9QRF9BTFdBWVNfT04gfSwN
Cj4gPiArICAgICAgIHsgIjNkZy1iIiwgICAgICAweDEwMCwgMSwgUjhBNzc0QjFfUERfM0RHX0Is
ICAgIFI4QTc3NEIxX1BEXzNER19BDQo+IH0sDQo+ID4gK307DQo+ID4gKw0KPiA+ICtjb25zdCBz
dHJ1Y3QgcmNhcl9zeXNjX2luZm8gcjhhNzc0YjFfc3lzY19pbmZvIF9faW5pdGNvbnN0ID0gew0K
PiA+ICsgICAgICAgLmFyZWFzID0gcjhhNzc0YjFfYXJlYXMsDQo+ID4gKyAgICAgICAubnVtX2Fy
ZWFzID0gQVJSQVlfU0laRShyOGE3NzRiMV9hcmVhcyksDQo+IA0KPiBHaXZlbiB0aGUgSGFyZHdh
cmUgVXNlcidzIE1hbnVhbCBkb2N1bWVudHMgdGhlIHByZXNlbmNlIG9mIHRoZQ0KPiBTWVNDRVhU
TUFTSyByZWdpc3RlciBvbiBSWi9HMk4sIHlvdSB3YW50IHRvIGZpbGwgaW4gdGhlIC5leHRtYXNr
X3tvZmZzLHZhbH0NCj4gZmllbGRzLCB0b28uDQoNCldpbGwgU2VuZCBWMywgd2l0aCB0aGUgYWJv
dmUgY2hhbmdlcy4NCg0KPiBXaXRoIHRoZSBhYm92ZSBmaXhlZDoNCj4gUmV2aWV3ZWQtYnk6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRq
ZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAt
LQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
