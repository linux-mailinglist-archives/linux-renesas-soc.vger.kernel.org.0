Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2B43B4622
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 16:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhFYOyp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 10:54:45 -0400
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:48358
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229653AbhFYOyo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 10:54:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5vyFmhc2xPkZ1iojJyFtfcaZJTYFeRZzR8QubYkB96ypxU/Xt82dURSUeyo5z3vEPEUYdV9b2NpRaL78Lb48DiLn/WPFUnKzCUa07D7a+DjFLlLGlyIiZo8AfZP1egqKZZSVlrYHYFDWotEGdeVTYktQPoYcxwb5X+gFsDFvdPvz1vksGDvoJUIloAmQoUy2COnUUyXttRWZwgCK+ncdz8uwYfjzuhzIM35D40HZAkLwFmgemIkOPJ6ghyih1/k1R3plJ9ZidmFKTAxEKsZtYWD7ytxy7AEFnolIwNVw22iBoLtDHxCmcmSdPZkWT+hfAQv+phPIcKYsTw7RurE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g9dQFwAcZOs8O0+XXLDW0NFL7Q8lnU3TWM2/YLD3Eg=;
 b=C2pFUD6m/O9XtWq5Mbd/ht9UXW6SqNibDH1gozPku8/G1yPijkQg4bMhz/+C7vqMMPjH+1Z5Z0yg5xfOmmYQpbWc/1Qf5i28J4isoxTMM0VnHCZWETxWK5Ll8DhezFKi5A+RPgVBkV22BV3ubdlCIXtO9kG/L6fdRRgzDYLYYR/lX3iUjAB0lhcSJTWr/8lI/xliGQPtgPAfSMZ0VtgKOmCrZPS1tVFwPmwTbQjoBCU5DKbUVMHDstoPh0kp9qpuEilbhbhFgmEOGdKVN8fQLG2OEp4+M9UpaxuxzlLh41Yx2fJ5Spp1ACYkk7Sii0U8+U0D4+95YDuHh3OIGUxMMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g9dQFwAcZOs8O0+XXLDW0NFL7Q8lnU3TWM2/YLD3Eg=;
 b=Lglw1OwiuwuXdEbxJ37LVhcXXHwGNWNcuNYKQEN+/mAuoTQe85buSpdOKDUJ4ptEGVPTcGu+CaJkpFxrVERICXi+fS51yey4HYr7MESuJH7O88KutKmIxhIjbc7S4PK7zWSR49cUf/wvCXk1KCEwIeBXZtBs1TbB4bX47sirlBo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB2342.jpnprd01.prod.outlook.com (2603:1096:604:16::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 14:52:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 14:52:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 02/11] drivers: clk: renesas: r9a07g044-cpg: Rename
 divider table
Thread-Topic: [PATCH v2 02/11] drivers: clk: renesas: r9a07g044-cpg: Rename
 divider table
Thread-Index: AQHXaPk9F3waosWhEUCbaI5bIaLX16skyqEAgAAGaQA=
Date:   Fri, 25 Jun 2021 14:52:20 +0000
Message-ID: <OS0PR01MB5922FFD9DD8042824BA7731186069@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com>
 <20210624130240.17468-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVhyBVzF864m6n78U2nr+ZREj36B=T3wdtXDmTHRXcDjw@mail.gmail.com>
In-Reply-To: <CAMuHMdVhyBVzF864m6n78U2nr+ZREj36B=T3wdtXDmTHRXcDjw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18948e58-a60b-4dc4-cff5-08d937e8d5d3
x-ms-traffictypediagnostic: OSBPR01MB2342:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB234213F6B89EB45BE15D194286069@OSBPR01MB2342.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Go9WkXxDXoUbMb+WbVq/ebqwPFlxOiXqAek00BOQph+jCmJLBMQ6NgBukaroHcjKK90++IN/8EvaBT2CbIj721SmeFm2+yYDMyc4T7vG2uC9q9q0wmF8KvJ3w4BUz2hGMKa5x1adJXI2xLxeDy9I5sPfpXj2KtGCA60G9XHqaQKTB6PWcl6BEC66wXcy/a0sVUNMeIvH+Qo6yRwhA1/QhCMGypi0nBPkPfJ9X5Jb4ICLS2ObrzR4Eubk2juOTObDZPhXH6rW+sHQMi/2PHQF0GQycHMdAmqdRoEaN22q8qdNuxi5WKiy+XzQ8Z68PhO8nFFfzes9Y0j6LCE5CgnquTLUSACnfQqLvvc7fuqxRCJpyW4W/IGk0rU/CBihm/3178MdJsKm695V3yQKLaqJWweoxGN6DSqgAe/mOKaK1Djk6bXGwgeyK8jIxPZTRHJOCyOlTHKxripWJPUAwZnug0eBAlqFWpd0CfH/7DjpBSZ6m0R0H5IDlwJ43JharytkZma1uH7UU20Al/WNp4odnwRTT9Zr4dK0bem9UXclS+RR2md94oCa1MVARWyhk+ufbyLDpGgl13m2eGOdu0pFt+KZBrL4nRi/O3kL+NgIKX0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(366004)(346002)(396003)(376002)(136003)(38100700002)(6916009)(2906002)(316002)(26005)(53546011)(55016002)(478600001)(6506007)(4326008)(54906003)(52536014)(9686003)(186003)(86362001)(8936002)(33656002)(64756008)(122000001)(7696005)(76116006)(107886003)(5660300002)(66446008)(66946007)(66556008)(8676002)(66476007)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REw5alNqRzhCTjREbURURHBwNXhHT3NYSkUxaUJlRE9NK0oxRDA1TzBUV0Rs?=
 =?utf-8?B?Sm1UMUtQdC9MVzZsaS9RZTQ2TXJmRVpqajVVdWlNSjdkQjRiSXFnam4yRmhy?=
 =?utf-8?B?Qi9yQ2hkWjFUaU41d3lFVlVSVVM3aUhvM0NYQ0hINUNWd3REMWN1WTVsT3g5?=
 =?utf-8?B?SVVuZnd3QW54V1d5OFRjQ2xPQ0loajRESWJETzhPZUprNDRISHlZa2IxeDRI?=
 =?utf-8?B?SjBjMHUyWXhoZ2g5ekp5MTBXRGlISGNndytyYTR3Z25IN05DWThZOS9FelY2?=
 =?utf-8?B?aWNnSTVZOHJZaWFFd0dXbThabWI5VmJ5dk50TGFndzdvemo3V3lrZWkzbmZJ?=
 =?utf-8?B?bU1zaExVb2trZUFPZHd3WnAybmJMbUFkQ3Y4Ky9CN01KQ1hVdURKekJSanF2?=
 =?utf-8?B?Y0pkcWRGWmF6ay9HbUlwakprTEY2cWIxSlBaUkltRHExRThOVERGa0pPVFJE?=
 =?utf-8?B?VTFYS2MrRWNGUHBBbnFrZlU0ZTBpUVVmNkwwNFQ5YzVSaXBtR2Y5NXZLbmlK?=
 =?utf-8?B?U3hYQ2dOQ2RtYlkzNGdROGhzaStnZVl4TTJDTzA3SDV0bXlUTWt2RWNFZmJp?=
 =?utf-8?B?YS9VUldpNllMbHY4c0dlTm5kejlkYXorVTBqMU9mS1hSNWtDWlNzTG5zd3Bv?=
 =?utf-8?B?L0lJR0dZVzJ3WlR6RllVZTBZV1VIR1hxZU5Kanh2RXNIV3N2S3NoVy9QU3U4?=
 =?utf-8?B?b2FMWFlNOUE3Z1lBaEoyWklBNkhxK0ZqTENhNFM5L3E3a2tmR3Rjc1pOVzhU?=
 =?utf-8?B?OVNPQlJtM0ljQlZNZjdXZ2N2MHh0dVRVTTl0ZWpmWllJUGZEd1hzRm1XRzFv?=
 =?utf-8?B?RCtIbmNiejJOeFl3K1ZrSWhpZURCOFFXdEIrOUJMdGEya0VYd0did3Z2YVZZ?=
 =?utf-8?B?NzY5YUNZL05kUTFMWnM0SFp5SDE1VEZGdkVuUjZyODZyTXNQb1pkMmV3cE5Z?=
 =?utf-8?B?N3Nqa21OaHhjTHJOVHBMbFhiN1J6azBWUmRETnVyS0Nxenl0RktYVVFSNlZV?=
 =?utf-8?B?U2JhTWRubjZVSEluTEhmMnpmTWVuUTBnVVU2T1Y1dk50bldqcktiS0wxVDgr?=
 =?utf-8?B?OTF5NG5LVUtJOTNyaUhrNk5NVDF1clhFa1hjcG9oZnk4QkRndHV3cWcyWkdl?=
 =?utf-8?B?ZUU0RjJSenlQckd3SWk2UmFFaWVZN213NS9qbEo4UUpnMVpUeDZISUN6VVFF?=
 =?utf-8?B?Z1cxdkp5NlpaU0ZSMGg2bHJDU1BPQVhmTTZ2WCtUWUI3UlhSM3hteFBRL0NG?=
 =?utf-8?B?MWgwZ001SlU4WmFTYXhxQ0x4MW04NnB2eGlEb0FrdjhVTE9lTGFhQUFsdzQ1?=
 =?utf-8?B?YzM1aVdFR0dQdURYUzRsVDlXSkx1Vlh6SG9BSG5XdUg3c2Z6eGxGNzZOelhw?=
 =?utf-8?B?OU9YOGlQeUxOTDBTY296VzNVTTJJbldBdTZsMU5KbFJqc3JpVWRmSXJoanZ4?=
 =?utf-8?B?bzcvdmFTYXo3L1ExMjNJK1Q3K0xsZWRtYUVFaFFybXVEOCtkczlMaXVEZWcx?=
 =?utf-8?B?RTVUTC9hSThnYXVqaURnMGkzT3ZWcjdWdHJhV1ZMSFhmOGU5RzRwMTNRd1Ro?=
 =?utf-8?B?RnFsVWVxaUI5Ri95WmI0ZjJoNlBwaVBwL3dWN0xtUkhWcXBKMFpyWnE4MW1i?=
 =?utf-8?B?ZFhqRjBudXA4Zy9tb09xQVByU21uaEwzM3dMVUt1Q0JtWEFDMVQvZ0JEaHM2?=
 =?utf-8?B?RU9QSFRtQysvMzY5Qk1HbFhmeGczNnBjM1ZYZTh2a3I1eksxd0lyRG5rOXor?=
 =?utf-8?Q?in8LTiAJhtfzyFoIXNwsOR1jFKRhCjn29qJmStY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18948e58-a60b-4dc4-cff5-08d937e8d5d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 14:52:20.7471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3f+9MupzLuDmBmLH6wmYx4S3YDo9QoMPEXTkbzZSFGEGiXxwfql3BaPg4Mo9NVf9Ogl9N7ZA/Lvft0jgmBNkuZD/ombGu1DqdVoNbZ7KOYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2342
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMDIvMTFdIGRyaXZlcnM6IGNsazogcmVuZXNhczogcjlhMDdnMDQ0LWNwZzogUmVu
YW1lDQo+IGRpdmlkZXIgdGFibGUNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQo+IA0KPiBPbiBUaHUsIEp1biAyNCwgMjAyMSBhdCAzOjAyIFBNIEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQXMgcGVyIFJaL0cy
TCBIVyBNYW51YWwgKFJldi4wLjUwKSwgQ1BHX1BMM0FfRERJVixDUEdfUEwzQl9ERElWIGFuZA0K
PiA+IENQR19QTDJfRERJVihmb3IgUDApIHNoYXJlcyBzYW1lIGRpdmlkZXIgdGFibGUgZW50cmll
cy4gUmVuYW1lDQo+ID4gY2xrX2Rpdl90YWJsZSBkdGFibGVfM2IgdG8gY2xrX2Rpdl90YWJsZSBk
dGFibGVfMV8zMiBzbyB0aGF0IGl0DQo+IA0KPiBUaGlzIGRvZXMgbm90IG1hdGNoIHRoZSBhY3R1
YWwgdmFyaWFibGUgbmFtZS4NCj4gSSBkbyBsaWtlIHRoZSBzaG9ydGVyIG5hbWUsIHRob3VnaCA7
LSkNCg0KT0ssIHdpbGwgY2hhbmdlIGFjdHVhbCB2YXJpYWJsZSBuYW1lIHdpdGggZHRhYmxlXzFf
MzIuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gPiBjYW4gYmUgcmV1c2VkLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJl
dmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+DQo+IA0KPiBBcGFydCBmcm9tIHRoYXQ6DQo+IFJldmlld2VkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gPiAtLS0gYS9kcml2
ZXJzL2Nsay9yZW5lc2FzL3I5YTA3ZzA0NC1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcjlhMDdnMDQ0LWNwZy5jDQo+ID4gQEAgLTQyLDEyICs0MiwxMyBAQCBlbnVtIGNsa19p
ZHMgew0KPiA+ICB9Ow0KPiA+DQo+ID4gIC8qIERpdmlkZXIgdGFibGVzICovDQo+ID4gLXN0YXRp
YyBjb25zdCBzdHJ1Y3QgY2xrX2Rpdl90YWJsZSBkdGFibGVfM2JbXSA9IHsNCj4gPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBjbGtfZGl2X3RhYmxlIGR0YWJsZV9jb21tb25fMV8zMltdID0gew0KPiA+
ICAgICAgICAgezAsIDF9LA0KPiA+ICAgICAgICAgezEsIDJ9LA0KPiA+ICAgICAgICAgezIsIDR9
LA0KPiA+ICAgICAgICAgezMsIDh9LA0KPiA+ICAgICAgICAgezQsIDMyfSwNCj4gPiArICAgICAg
IHswLCAwfSwNCj4gPiAgfTsNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02
OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2Ug
dGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cw0K
