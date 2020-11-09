Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61AD92AB45E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Nov 2020 11:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbgKIKFi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 05:05:38 -0500
Received: from mail-eopbgr1400123.outbound.protection.outlook.com ([40.107.140.123]:54720
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727906AbgKIKFh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 05:05:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8oYYqG4fkYT6P6HmKFGD7oInI3VwunvBvqadkbFI4INjV41r7/DSiqAkP50weRzW7CuKRi/oam2sOquqA/scqPlnolupWGGJppSkKf3vCOkgpM7IpUAueIFUIdc5DvTuWt5tNXE9pHaZPnzJQ8d36sT41l2I02GKm1AG6ueMyKvmcWD7LjLMeSKMmgTYm3+xYXLVyayH5P0I4Ek5FVz2efj4Uv6GZDDRlfZPo3jDMckg47I1cgAWHh+1V5xdAnCO3AF+eiocL4Y5d4bSkr8/relHnlPNlUCALkmJBQ9uK2TtqO/XiVDdcBydOaTfjR1SyjbYPQyFKGulBwa8rCFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+uwixEQpao4fovwe790l7PzTOvmeBqhTo73KDIJglg=;
 b=iFtbziIa27ug5cCRBp7RVeqgNxasuCDWh16mQ6vszrLSo9XoPGxxZuyY3ygC90Q8T7N9eU5ejDMkoDQ+eOtFDWQEe3fxJqJml4LZoTbJzwYE73UMM6/v+GAKNTbLXZRzPTovhY+x0AFs4J2zkUrohXn7rErXU3GRcHGvBpMxAfz5eHccNwyJdHTqBO/P69unpEODduY8dOmn7lxREugZcu6cxghmG6l6USdqH/ah/w5il24n64L5GUV+fS006WvTpcZEGcUPCBUr0AhruP53hk5E7I5J44h1tfojRvdQkoEJUXCuKNOWnb2OzoHxLbfAmIPFLx/gulBkJ0Mwex0G9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+uwixEQpao4fovwe790l7PzTOvmeBqhTo73KDIJglg=;
 b=h+gm7CHar+p8nfgQfIc7r+3cEYaD0Hvl3FOZMtceDt8PRtXeoXeAF4/+2QERVvmrO+2FCWF4cIgrevguyqBa/ivsU9ro2lkuu0+LEyPYYtIXgEVxcGAUULq4TyS+iZ9lzS2J2NkAjOQYdsBO4iGOvwGmtgCVhseyJ1ySz9TnInE=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSAPR01MB4450.jpnprd01.prod.outlook.com (2603:1096:604:63::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 10:05:33 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70%3]) with mapi id 15.20.3541.023; Mon, 9 Nov 2020
 10:05:33 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774e1: Add missing audio_clk_b
Thread-Topic: [PATCH] arm64: dts: renesas: r8a774e1: Add missing audio_clk_b
Thread-Index: AQHWspj6AaA8uWUwckCFh0RhTGsbcqm/maKAgAAAPcA=
Date:   Mon, 9 Nov 2020 10:05:32 +0000
Message-ID: <OSBPR01MB50485F258716E49D43197587AAEA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20201104105508.21197-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUFTQTJqRqF7=-RbxKRDUbqEjf8LFpzGHugTNAZ1KV+cQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUFTQTJqRqF7=-RbxKRDUbqEjf8LFpzGHugTNAZ1KV+cQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2d0d0bfd-dccb-4c2e-f864-08d88496fef4
x-ms-traffictypediagnostic: OSAPR01MB4450:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB4450DEBFCFC80BD917DACE48AAEA0@OSAPR01MB4450.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3lAR+RofzXOmyBORevX7ghe0CH4k9tmZ3qrsjLp0Kfx66HoQ4YOV47iSyQtPwNtHSqJvTDwQy0n62nKwiZbEuVNYKdC8e5g3PQw/+Gf0iqfKqJv8hHeaouGLqeK41vuyp2BaTJ6yvPqhdhK/SI7eamQtRGITPHWLmP56Lz22TZZpJL1kWbdL7Wy56BfY0M0l1eygbqa3MQvCeJaPMdhS9AtBumRYp4U/ms54mq87wLGvB1vwpIbv10XTKgghoE1ANtlltqkLjWVLwktMmkbT1/l/l+akFiVllkg5hOfUg92sNu5RzLSR6wMpvl6EflOnBfsryLtC2PgeWRkiq9liUQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(478600001)(316002)(6916009)(52536014)(83380400001)(86362001)(54906003)(26005)(186003)(5660300002)(71200400001)(2906002)(33656002)(76116006)(64756008)(66556008)(66946007)(66476007)(66446008)(9686003)(8936002)(7696005)(4326008)(8676002)(55016002)(6506007)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: P/aunzUmQds+omS4TvrLWNLIvmlAuBU3MEMtzFfmSp0LYwtJX1UOwV39fr+mTReh77VhRd4qSttnuKelPEbd5/5ZRbeQOTUxCEO2z5a0jOWKd//Nz366ExEA8QT4of9cuW1nNzXlOWfEnfBlyPI/FUISIPCdVAaDwR1A25cg7BZnf8f3E4mgndpGlHJz0QLp01hlbpzuk9qq5QPk21RwxLcYKXO/cLqKvbsKmMpbPJrkTlrWb4aowPsCBS6LfB1Tfuf8vPmzrLO38k9hI2osx7J5M7lGxp1CcFtTN4shh4lcGXJ0dWsq6jt1xb8iDXmsh44cZO+imFsyTs4T3nJy1PqBR4NwnlOPI5/ppHj8vplfjq54X+IJEs6aqIbCUl81TCnK24Km420rSDQ/C165xDnCw5Y7H//o3XPPoIFWhEZ4xrSUtrsnCScPpgcD3qQAxLviGVI/IMCjI62rmzezkFbDrABWUbVEt2Rg30IvWZ+VGi9YAoppdgkSlDrfs9GmZBpVJjqs50k6BMl/sOuHK2+pLAlEzqeXCRDU6VF1KNLLSfGjNEcMjjxyULvnZR7eaz1wJ2ymGfeOyBSDgOwlg/Rm32LMRN3nH5N2q7fGrDEvr+o4IbS68NBCSkO3BuOXZgjnGCvMxQmLCb0B4mLyhg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0d0bfd-dccb-4c2e-f864-08d88496fef4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 10:05:32.9024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z8exgo4Kz8tg3MWnjLzeAgszNp9QhtRBSHpkfgKpWdXDxhefAeZjYO+zJvZ0AmRsqJ+/EKgfszDo2oT8dHojZkYLGzVrPeS+rB9qpOr5oo1WhsTVHcGqXGlRsQttbKpr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4450
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPg0KPiBTZW50OiAwOSBOb3ZlbWJlciAyMDIwIDEwOjAyDQo+IFRvOiBQcmFiaGFrYXIg
TWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4g
Q2M6IE1hZ251cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBSb2IgSGVycmluZyA8cm9i
aCtkdEBrZXJuZWwub3JnPjsgTGludXgtUmVuZXNhcyA8bGludXgtDQo+IHJlbmVzYXMtc29jQHZn
ZXIua2VybmVsLm9yZz47IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVORUQgREVW
SUNFIFRSRUUgQklORElOR1MNCj4gPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgTGludXgg
S2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IEJpanUg
RGFzDQo+IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47IFByYWJoYWthciA8cHJhYmhha2Fy
LmNzZW5nZ0BnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0OiBkdHM6IHJl
bmVzYXM6IHI4YTc3NGUxOiBBZGQgbWlzc2luZyBhdWRpb19jbGtfYg0KPiANCj4gT24gV2VkLCBO
b3YgNCwgMjAyMCBhdCAxMTo1NSBBTSBMYWQgUHJhYmhha2FyDQo+IDxwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBhdWRpb19jbGtfYiBjb25m
aWd1cmVkIGFzIDAgSHosIHRoaXMgd2lsbCBiZSBvdmVycmlkZGVuIGJ5IHRoZQ0KPiA+IGJvYXJk
cyBwcm92aWRpbmcgdGhlIGF1ZGlvIGNsb2NrLg0KPiA+DQo+ID4gRml4ZXM6IDgxODNhNzkzOGNm
ZWMgKCJhcm02NDogZHRzOiByZW5lc2FzOiByOGE3NzRlMTogQWRkIGF1ZGlvIHN1cHBvcnQiKQ0K
PiA+IFJlcG9ydGVkLWJ5OiBOb2J1aGlybyBJd2FtYXRzdSA8bm9idWhpcm8xLml3YW1hdHN1QHRv
c2hpYmEuY28uanA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2Fy
Lm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IGkuZS4gd2lsbCBxdWV1
ZSBpbiByZW5lc2FzLWRldmVsIGZvciB2NS4xMS4NCj4gDQo+ID4gSSBoYXZlIHJlYmFzZWQgdGhp
cyBwYXRjaCBvbiByZW5lc2FzLWFybS1kdC1mb3ItdjUuMTAgYnJhbmNoLg0KPiANCj4gTm90IHJl
bmVzYXMtYXJtLWR0LWZvci12NS4xMT8NCj4gDQpTaW5jZSB0aGlzIHdhcyBhIGZpeHVwLCBJIHdh
cyBob3BpbmcgdGhpcyB3aWxsIGdvIGludG8gdjUuMTAgYXMgYSByZXN1bHQgSSByZWJhc2VkIGl0
IG9uIHJlbmVzYXMtYXJtLWR0LWZvci12NS4xMCBicmFuY2guDQoNCkNoZWVycywNClByYWJoYWth
cg0KDQo+IEFueXdheSwgc2VlbXMgdG8gYXBwbHkgY2xlYW5seS4NCj4gDQo+IEdye29ldGplLGVl
dGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+
IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzDQo=
