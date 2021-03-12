Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FFA3387EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 09:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhCLIu3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 03:50:29 -0500
Received: from mail-eopbgr1410115.outbound.protection.outlook.com ([40.107.141.115]:59520
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232520AbhCLIuH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 03:50:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5WWYEFWQaL0YP6BqjgyIursDDIojkF05q6rzom7Sw4UDvTzFoLajI5iII+xiF02JcRckJxphcFhI6wmDY6+qEzZRgxHP2MyExEhEu67YPaUKEIQvJTDh4rI+tN9an2Iyllu67WtAIretnTqNbnVkJ5udhyIeuQrrfMCCH+55TZoGDrOcAsrjO0B0qNkgcu7IsauwcQDYIL2SrJIyGDPovYw716sC5mMrqSoEALVBjPKQYczSd/A0c3cBfazVIB1JW69E2vNOeIdgva9hjzM5SMcMU1CZD/2Xa3PPMSkWfmujSpHNflaInlMTjPSukbniZjFgK6RQAere+wfbMXIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29+WbOD2R0RUm02AtJJF0hzWmz7WZ1Bnl0wTYdQi8s4=;
 b=V3Mrcv7rbE8+FhuoC5Wov5oVyMcNOhniNOG4q/McCZYAfX+a2bht9sPPj29WjuVN90M7OxImry05iSWVfabg+3aAYq/MWkaQ8wjWSEiskNpIa09OhBC3mhtI2PcN8H/YpNt7y7OI2fMNdIfjd4H3gNcPTR15t3/ygCZsFM+DEpPufg2LfzUlvRzalWW014gGPq0uUBazoR3xJYW+WVpygUh4dwUVBMaXOBj7Pbh5LYT5Vsifu7VIDDGfLJ27KDSx0MYTnx0mxCa/3AErsiawD9D+uoMTEVe+uveidzneEcwqVxhayKu3+pfptEq1qlodO3nnJEH8evGnrUg2CHdDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29+WbOD2R0RUm02AtJJF0hzWmz7WZ1Bnl0wTYdQi8s4=;
 b=h7H0bqpf4Py51S7tOHb1kmhjTOeWFstuHhAPp0uKyGKF7puZPouvsJk1fCJXXb05mpdlhQVIzcFQOEDfE/8ITxBGYezCG0OFoNPPiaxTwdSXpzcx2etcMPiujgBwbhonQrls/ctjyzqBksidt8qfgNxv89bhDmdHTbsQgkExKRc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYBPR01MB5485.jpnprd01.prod.outlook.com (2603:1096:404:8026::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 08:50:03 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 08:50:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: net: can: rcar_can: Document r8a77961
 support
Thread-Topic: [PATCH 1/2] dt-bindings: net: can: rcar_can: Document r8a77961
 support
Thread-Index: AQHXFusH52f8X2djCEiRymGB5/SRz6p//NEAgAAAx6A=
Date:   Fri, 12 Mar 2021 08:50:03 +0000
Message-ID: <TY2PR01MB369292469D8CD8017656A1FBD86F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210312025420.529339-1-yoshihiro.shimoda.uh@renesas.com>
 <20210312025420.529339-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdW-jPRe=PBOjgk+YA6VFD_LKg5jCMtRxz4bAji88iRtJA@mail.gmail.com>
In-Reply-To: <CAMuHMdW-jPRe=PBOjgk+YA6VFD_LKg5jCMtRxz4bAji88iRtJA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a39a655a-d007-4cd9-afcc-08d8e533d410
x-ms-traffictypediagnostic: TYBPR01MB5485:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYBPR01MB5485CE60EBB56F60BF9F2AA1D86F9@TYBPR01MB5485.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vleq8Y6q6ir9Qd/OTkODFB347wLCpgbi7ajcWTg+N53DLHUE5adXz8LuXjC+He4xAca2l/jqq2KAEVf5Seez5fhBvWTxrhlwIosbNvOdeU2TCOyIiPOe8Yax0zv11yQ5zWCGKW4PHkLNHUBdWMWqGbWrBAhoJMdRVaH5HDNMIB+cHWfoWGS6snOlF0BbD/WgJz7e8TaIIlQxnzayOQ0hck3/kjet0kPk+q+WVgGwxqVQ+6MaB9nczjIvH9A3E64WRTwHRn+fUWb+Yf1pX0+JRTFNu96WCyAp8HKThpNoDP8IN3w+Yyk1eDfEID4xo6HrsBdoXp9Us1ewk9R5pCtFGq8EHiIULkVXt6UcxC9gBl53KPMNMXck3ZcO9fVFeTtH/mZAYF6ULpcCjHIaMmdjC30AofcW26MdiryetszDzEGCKxmFCEZ4ROc2rDTjhec7COBNrAwNSNBFynJG8Tkpri+1UY5lec4BNhLhSPZXGLEC/Dy1DQsObErDn6Ikyty/hbgx48JGL1f2IgfVFRqm/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(39850400004)(346002)(6506007)(7696005)(9686003)(5660300002)(54906003)(33656002)(71200400001)(55016002)(26005)(316002)(55236004)(8676002)(86362001)(478600001)(186003)(2906002)(8936002)(83380400001)(52536014)(64756008)(4326008)(66476007)(66946007)(66446008)(66556008)(76116006)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?S1lDdyszUWtTVGRMUUVBZERneThHTkpmNVVPNCszTi9Hblo4ZmdDQ3dpbVI0?=
 =?utf-8?B?Tk4zRjVHeWRhRnFma0VhUzlDZ3cxNXYzTmd2UjlYUDAwTE5sNEtsOHpDOVZn?=
 =?utf-8?B?Nm5tS01oT2Z1aTVDK0NJZnZGYUdqU1FhSjJBK1htZ2xmMnA0SGZFemtEb3A5?=
 =?utf-8?B?REJPR2FBc3d0dEpCVklSci8vcmFpNXc3cHVKa2daTkZqS0l3cDVrT2NOM3BY?=
 =?utf-8?B?NjJXTjhVVSthT2g3Y2dCbEUrWTVMK05EQjdIWTNrT1JtaU5BcEx6TklyQnc5?=
 =?utf-8?B?MWRDZTErUHFSY0VyVkNYVytkYzIxWDBjNEZHVUtIdjNHR29VaGl4MVNQUy9o?=
 =?utf-8?B?R1NrdWxOMlpRVjZjYjJtSlBqcU5DOE44NjFUR1BWa0Q2S2FaeDBXTkN1Z3ZO?=
 =?utf-8?B?SEFUd2pRTE5iV2UycHpzMm05Q1o1L3I4Q0dwQ1BNWjRXWlJSQWtpRjYycjVI?=
 =?utf-8?B?dklvMndNT2JPaTdGcTZQZzkzT0NTcEI1KzhNd1V3MHlzbnZiYXl2dndBdkJh?=
 =?utf-8?B?ajBpYm8zNFZ2VXFCNHYyYjJUODNhVlZmb2grc1N0c3V2ZFZ3b2sxMnJrYUlI?=
 =?utf-8?B?MERxdkhJbk5yd1A0c2cwUkFidm9OK3RhMERMYko2aFdYMmxwaE81VXpVUGM5?=
 =?utf-8?B?ZERxWTZleWxzRTE1THNPRFI3SnFmcVBiL0JsekQ2R2dBYzlqSlJleWxoUVFG?=
 =?utf-8?B?NTVBRDd1NitIeW1QTnBUNlJUd2J4ekh5K0RjWm8wTkZDZWFHd2pUWFVEOGtm?=
 =?utf-8?B?dVZYaDFPT3hPQ1N2WExGMHh1Y0gzeVFYM1Y3NlNHVUh5a043MjlpYVF2Wjd4?=
 =?utf-8?B?bjY4ajNaWWtoRElqM3ptT0NqOU5YUnRhTXh6YkpyOWYzendKRHNFVC81UTdx?=
 =?utf-8?B?OXB2MnlNcWVnWHk3MXJVQlpYMWc0ODRhdVMwc3pNUndkVmhiNVZjcUJZYmZO?=
 =?utf-8?B?MFZyYmlkZEE3THhHODI3MFRWL2JTMHF2MVhZV2lXc3U3cWpLWGJCQU43Nm5F?=
 =?utf-8?B?bUNkdGdaQm5LcWZaZjl5S2wyWE9UdkpidXBqWWVXWEZtRHhkS2lBajQyZWFQ?=
 =?utf-8?B?MG02VWxtZkNrTjJwa2wyWHUrc1libVN6RlcvTnpsYUlGR1V5Z1I0aVB3bURY?=
 =?utf-8?B?RWFwS3o1djFBdXNJUERtd0xLWmg5Zk9Zc3ZLRy9uNHByWDB2V2ZHU1p0RmFv?=
 =?utf-8?B?VlBTM0s0cmYySnpqQVA3Sk1mR20wN2J4SGd1aDE5ZlFJZEF0Qk1qT20rWllU?=
 =?utf-8?B?bDdDWE5XZzZTZ3drZHRWbkpNbzU0TzJwUkY5ejRKUG5hS2x1cUJTUWU2aXU1?=
 =?utf-8?B?ZGNLZGJIZ2J1MnNKU1BCVUVCb0cxNm9mK1hwRnlia3RYdDlGWC96T1B6TFNh?=
 =?utf-8?B?eEFoV1ZWM1RySkE5MHlvVlkwaVpIRjRvTm1jNW13Z3hsTDRGU1JzSG9LeUtV?=
 =?utf-8?B?SExtak5UVEZZenB1dDFPZ1hnSzc4U0doNm1LbXIrcHBTRFYyTDBQVTVqS2lh?=
 =?utf-8?B?bmRMbUdOeFJUcTVOU0YyZ3FsRWVaZWdUMnRxUDhqamdXc2ZiRnRzR2NiMTdz?=
 =?utf-8?B?eG0vejZ3S1pndUNEVHdtMTJmaE9LbUVPa1MyVmFYU1RQRm9qM3JlaFVBTG9H?=
 =?utf-8?B?R3lYZHQyK3JSTW93YlI2blVhU3JqL2FTcTNmK0pyZVJsSEhlMUVWYUU0bTZO?=
 =?utf-8?B?RTVOZGpqdXhPdnJEQzFCb2pZdVhBUUdMY3pBRG1XZklDY0tKL3hZUEJPRWd3?=
 =?utf-8?Q?YAusvLmuFW1z65bJtvTcw8ED0BAhr+UqXI1cT9r?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39a655a-d007-4cd9-afcc-08d8e533d410
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 08:50:03.5502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UEbSJSA7yEge/XP3oobjKpTldIvai4PTCA2c8xu9t06Hj76kw7u1ToE8RGJ63yx/az7ZEfIgGuhqFwUJjzA4Ggl/a/a7WoPhywAp+LmSRZxF951cJOzUxkxBUYE2zzAx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5485
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBNYXJjaCAxMiwgMjAyMSA0OjU3IFBNDQo+IE9uIEZyaSwgTWFyIDEyLCAyMDIxIGF0IDM6NTQg
QU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPiBEb2N1bWVudCBTb0Mgc3BlY2lmaWMgYmluZGluZ3Mg
Zm9yIFItQ2FyIE0zLVcrIChyOGE3Nzk2MSkgU29DLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
WW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiAN
Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbmV0L2Nhbi9yY2FyX2Nhbi50eHQNCj4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2Nhbi9yY2FyX2Nhbi50eHQNCj4gPiBAQCAt
MjAsNiArMjAsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgICAgInJl
bmVzYXMsY2FuLXI4YTc3OTQiIGlmIENBTiBjb250cm9sbGVyIGlzIGEgcGFydCBvZiBSOEE3Nzk0
IFNvQy4NCj4gPiAgICAgICAgICAgICAgICJyZW5lc2FzLGNhbi1yOGE3Nzk1IiBpZiBDQU4gY29u
dHJvbGxlciBpcyBhIHBhcnQgb2YgUjhBNzc5NSBTb0MuDQo+ID4gICAgICAgICAgICAgICAicmVu
ZXNhcyxjYW4tcjhhNzc5NiIgaWYgQ0FOIGNvbnRyb2xsZXIgaXMgYSBwYXJ0IG9mIFI4QTc3OTYg
U29DLg0KPiA+ICsgICAgICAgICAgICAgInJlbmVzYXMsY2FuLXI4YTc3OTYxIiBpZiBDQU4gY29u
dHJvbGxlciBpcyBhIHBhcnQgb2YgUjhBNzc5NjEgU29DLg0KPiA+ICAgICAgICAgICAgICAgInJl
bmVzYXMsY2FuLXI4YTc3OTY1IiBpZiBDQU4gY29udHJvbGxlciBpcyBhIHBhcnQgb2YgUjhBNzc5
NjUgU29DLg0KPiA+ICAgICAgICAgICAgICAgInJlbmVzYXMsY2FuLXI4YTc3OTkwIiBpZiBDQU4g
Y29udHJvbGxlciBpcyBhIHBhcnQgb2YgUjhBNzc5OTAgU29DLg0KPiA+ICAgICAgICAgICAgICAg
InJlbmVzYXMsY2FuLXI4YTc3OTk1IiBpZiBDQU4gY29udHJvbGxlciBpcyBhIHBhcnQgb2YgUjhB
Nzc5OTUgU29DLg0KPiANCj4gWW91IGZvcmdvdCB0byBhZGQgUjhBNzc5NjEgdG8gdGhlIHBhcmFn
cmFwaCBhYm91dCByZXF1aXJlZCBwcm9wZXJ0aWVzLg0KPiBBcyBSOEE3Nzk2IGlzIG5vdyBjYWxs
ZWQgUjhBNzc5NjAsIHBsZWFzZSB1cGRhdGUgdGhvc2UgcmVmZXJlbmNlcywgdG9vLg0KDQpPb3Bz
LiBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KSSdsbCB1cGRhdGUgdGhpcyBwYXRjaCBzZXJp
ZXMuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gVGhhbmtzIQ0KPiAN
Cj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
