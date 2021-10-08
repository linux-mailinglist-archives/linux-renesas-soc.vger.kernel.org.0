Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC0E426BD2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 15:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbhJHNlO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 09:41:14 -0400
Received: from mail-eopbgr1400091.outbound.protection.outlook.com ([40.107.140.91]:30528
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230324AbhJHNlO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 09:41:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2MwY6vmCmL6rT56/if50/qnVCY6RTuUEmmhptWLs/ApfV+kN24rRitA7PxULACG7+c+Hvg0HiuGwFRNskoDaVOOKAUd5ZKmgsqGw2Kj7B2s1LSIOPNQHVAX7XWJYpsvLI2jNeCj1M8XzFL+nD+EWGU5yXnHqa+/B22UzGT9KzKj8zNVJGUjBAhwr+yeudqlzIVhGnOCvq9NZvd9n62lKGEhyXpEpB9+kt+opt3fDOCKYeBKXpk7FMU7XCTRR2GZYgMwHzCiWK5RisO9uguDwu8YMj69Sb1bIPrV2lCDiZOhtg0krqJ0X8oFKI5KBnHbFxd1NzDzHdwzT4EJra/geQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzGUg19UUa7Wh5EutRn89NQlJxsJ4oWNpFjiCq7N4h4=;
 b=AMucRPPcY+mmS0+0cUk9EN4BQwfAOIjJgR47vdAjudpdbAizWJIkeMITNo/NG/W0EjSW+IYngoCuwmDqxLkjkPaFuLUQW3etMr/yrBA/FMZXMhA4QP5uFLXpiyiU7O0W2U9WlZ6kLmbiGgHbFI98wxrGtW+PoOAVgx5fDzSb3BstoWLlhel3R4M+OQVqK6sJkczqQzxgtAgUBcuspZFESKXQjZRMvmxhIRx1ieskcYiPN/z9W3cQXqyKHkZMmDQE2/3eLkiQdNsWvvjJjfreUvddgCnQ/iSLf7h2ub+gFXxmOst745zmUPsqIlwP/f7StLzjSx+d12KuPsRSYJdm+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzGUg19UUa7Wh5EutRn89NQlJxsJ4oWNpFjiCq7N4h4=;
 b=U774a47rWB5pVfy4rSxtfJ2Mi3Vuzi4xkOZWRpQY6RDCLRqX7U9z1Snb1e7QyNWAH5dPcMn64cTN1XO/gGZzQMRh5RVHvBrzgP7+fOwDqKBwGNXYsmfSojZB927kFjYpMOS4QzuDytRoIz2f4Fe48c3PgMm+hL0bRQ99neZK5Ok=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB2550.jpnprd01.prod.outlook.com (2603:1096:604:1d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 13:39:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1%3]) with mapi id 15.20.4587.018; Fri, 8 Oct 2021
 13:39:16 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable microSD on
 SMARC platform
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable microSD on
 SMARC platform
Thread-Index: AQHXu5OzbzOgmHoLLUaGy1YV5PP6JavJBCuAgAAYGcA=
Date:   Fri, 8 Oct 2021 13:39:16 +0000
Message-ID: <OS0PR01MB5922C701D9C8E133EF71FA3D86B29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211007155451.10654-1-biju.das.jz@bp.renesas.com>
 <20211007155451.10654-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdX_sHb9w1v9g7Lycp-RQnm9sHGv8MtJmfM3js5DrwO6+A@mail.gmail.com>
In-Reply-To: <CAMuHMdX_sHb9w1v9g7Lycp-RQnm9sHGv8MtJmfM3js5DrwO6+A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 237cb078-0e69-4770-29d5-08d98a6105e1
x-ms-traffictypediagnostic: OSBPR01MB2550:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB2550319546B3271A0C109DD286B29@OSBPR01MB2550.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xxa/s0qVlD/AgT2go9PWyMo1OMBY0xEzXVmA1sS9ZvZKQu23FcpFtvgNSjGrGq80Jt3pj5KmvnWZEcy1aC73dwDSyyUH5OZTp3Lsmrd04rB1CgUJNi1aDOxOY+R/qEx099VY1Wh7UA2ccbBl2HpGHA17pvrV5sYOm0NcBjYEXTlfTHj/FH4+EsJKlEJ4SdiqHsw4/9YSqOd+NzA7GbKTy56kBwAbBxO9tNj8ApxnYNoVWNDpz6O5SDVt7HAaU0BdSD9qNDppHHiujdJKjNbyHFhkq6wzSYyDIvWY8RZ4mTkngekm4kKNF3/dDOjRtk/hORHFCz9SUrXkyHmPqLTPtzxZij0QJ5edsHV14Nxs/iwlIUDr+ZP9K+glvA6iekZG+1DXSmVefIvChRWV+naikTk5M2JLMDQDriodD3219v/9pVu6k8FQC0rP3Muzwj1HrANRi8e9O/1USFzPQUWVm2YIrsytlcmUgsFlPUohjZ0XA7DrwR9GGnyCMNXTeXiDa1cZebHrTOyeI+pbIHLEERGkRtXODpyVpAOLBoDC6GuMdYNambh2JH6GSzg9jbRBgYsSdYlX4fFDVxg2ifN585X29xYp6nG3/jGW8wEC/Fkf57gL/ZbRDhta5rPRX7HpRx7Oidi9oTz1GfNpMakcZ+d8cAJTwyVHe90z+aWvkI/Rqhjqi9FocNIoo1U9X8SNWestsr0jIm6OfGeCw0r7EQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(33656002)(8936002)(122000001)(38070700005)(8676002)(86362001)(71200400001)(55016002)(7696005)(54906003)(66946007)(6916009)(508600001)(76116006)(107886003)(2906002)(26005)(64756008)(186003)(66446008)(66556008)(66476007)(9686003)(52536014)(4326008)(5660300002)(316002)(6506007)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDdCaWVSU3hsQng0eEV6ZGcrWFFtMjAwUFVKa0M1SUhSUjFlempwQmhwT1FR?=
 =?utf-8?B?Uk5MbGNvdnJ0eFZoK1cyQnZRbllzTk1DYlYrSEJlVUtpbDh5UG12REkyOUl6?=
 =?utf-8?B?Vk0xZXVqYk0vL3NaaDgwODVoNDU1YmhlUENMLzdhOGFva0dXWi9sQTRrbFJ1?=
 =?utf-8?B?bnR1cTd6YXlGMmRSeksvT1VyaDIvbGQyamFNdlhjUjQyOTIzemlnbHY5RER3?=
 =?utf-8?B?dlJ0SjF5b3BiUUcrZVdzUGtRaFMvUFBPa2NkNm5IZFRCME1lalY4UVdONXZw?=
 =?utf-8?B?aW13VXdEaWlSMlEyRXNGMVhpVks5QzdjeUJkWWo0KzFtL3lmZTRmOUZMbXNj?=
 =?utf-8?B?N1cxd01uQVNrWUJOaFJrM0hwSHI2Q2gvN09qOTg1aDEwLzNMYStQM3EzVFJM?=
 =?utf-8?B?aDFoM1pLWUpENEFmZDI3RDRaRmZ2d2hyOTRTYlkwUzlmTHlvTW9mTVE5K24y?=
 =?utf-8?B?RFAzQ1lLSHd3VEorMXFkQVpDb1dOMTlmVmZOblhvQllGZU5KakhSLy92VEQw?=
 =?utf-8?B?N000TnVjUnNDcG9WNjh0UE9yaDE3WTN2OGs0Wmp5NXRyd1pLQkpxOFRERWdv?=
 =?utf-8?B?RXpueFB5KzBDdE95STh2YXQ3NmQvQmY0RGJhNE1xN1d1dUs4eHJqejRRbzVm?=
 =?utf-8?B?VWZObmcwQW1MSDhoRmdxeHdRU0NaY0FaRnRHdUsyYVpEekxDQ1ZISytyQ0Fj?=
 =?utf-8?B?MXl6Y3p3M3dMWDkyWWtqMTl5WklSZ2ZZQjVrVFZZOEg0dEViMVNmcEgrM0RI?=
 =?utf-8?B?TkVnOUpjZDZpQStORnhOaFRoM3BRdzJqWmp2ek0xVld3b09EZUhSdmlQeito?=
 =?utf-8?B?R1oySWVnU0Zzampqek13TDc2SXNtekE3TnJoQk1NSHRRYW9uWmNWZHJUeGhS?=
 =?utf-8?B?S1hYZzJPQ1NWVzd6bGJqQXZSWkpQUlNvdmUrU0hiU3lpNWVYbEZaWEVzbkda?=
 =?utf-8?B?KzZSSTlEMnBpL1p4alBTMXBKZ252dFdOZTltMUZXWGRuM2VkdkdoelRBRmpV?=
 =?utf-8?B?WUV4SExoWDFOMzFKZFluZ0E3LytUeHhzRXFYaGtqSXE5VEExV1RKWWhsV1dP?=
 =?utf-8?B?cklzZnVJUFhybkduMVBrd1FFM2NvcEQzODQ1Q3JHdXpqYWRXTU1PTGVQS2tn?=
 =?utf-8?B?Uy9kbDB4NFA4cERKb0s4VmJQRDNFa0lQUGdCWFozQ0p6bnVxTEdNMmhRV2Fs?=
 =?utf-8?B?VkNJMDZ2bEJCWmZ0QktQSkMrSUNRVExsc1N2Sm9oSjgraXRmZTRXbFd0dTFz?=
 =?utf-8?B?VVpDVzh0NmpoRUtId0hKb1FRako2RVc3dXZqOTRyaFdnaklmMFJlMHpFMHRx?=
 =?utf-8?B?NFBNNnNpeGIwV3YzRjc1ZzlMdTlYWjJwRmdOOFEzdDJBcXcydTFJR3l1WVFS?=
 =?utf-8?B?ODhQT3pKS2pnc2lPRy95Mzc5LzNLUTVlS0ROR3J6aTFtV3FjaTd1Z0pnZ0pU?=
 =?utf-8?B?b1VWQXJJVHdJMmNja3VNTWtFamtnNWdoWS9acjJWbk93RzN2Y3kyNmhlRzdp?=
 =?utf-8?B?WldUcWFHejlDWDdRUDNDNzZ1NURGak5CaVpicmRJUEFhNndEaVBqSU0vbzlr?=
 =?utf-8?B?NXBTUEFPSENKeVI0OUxXQyswMXRGVUYxcDlVNkFJdHFwd2ZNMTVBZUI1VXZX?=
 =?utf-8?B?ZStEWEZyMkVQYTkxUUU4QytMeHN4Q1d3TWRzTlhSc2pRQVdlQUtrTmUyTjJ4?=
 =?utf-8?B?WENzYkNJUHB6NWJ6MzVCRnVJWU9ySUQyWlgwUzNLUEZQbmFuRjJXV0xPY0E0?=
 =?utf-8?Q?WzOyL+lmCE6XapN2kc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237cb078-0e69-4770-29d5-08d98a6105e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 13:39:16.3066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4aJL9lXVsNTKw4pvCNakMoRGZkyZnryILVxlCFjzusWI18Rlh6RVRlueSDK0jisfuR6UnIeNltGbxcY4MzkceIu069KBHWjnPMe3eETfz6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2550
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMy8zXSBhcm02NDogZHRzOiByZW5lc2FzOiByemcybC1zbWFyYzogRW5hYmxlIG1pY3Jv
U0QNCj4gb24gU01BUkMgcGxhdGZvcm0NCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIE9j
dCA3LCAyMDIxIGF0IDU6NTUgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGVuYWJsZXMgbWljcm9TRCBjYXJkIHNsb3QgY29u
bmVjdGVkIHRvIFNESEkxIG9uIFJaL0cyTA0KPiA+IFNNQVJDIHBsYXRmb3JtLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiAN
Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yemcybC1zbWFyYy5kdHNpDQo+ID4gQEAgLTcwLDYgKzcwLDE2IEBADQo+ID4g
ICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDUwMDAwMDA+Ow0KPiA+
ICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsNCj4g
PiAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgdmNjcV9zZGhpMTogcmVndWxhdG9yLXZj
Y3Etc2RoaTEgew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1n
cGlvIjsNCj4gPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiU0RISTEgVmNjUSI7
DQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAwMDA+
Ow0KPiA+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAw
PjsNCj4gPiArICAgICAgICAgICAgICAgZ3Bpb3MgPSA8JnBpbmN0cmwgUlpHMkxfR1BJTygzOSwg
MSkgR1BJT19BQ1RJVkVfSElHSD47DQo+IA0KPiBJcyB0aGlzIGNvcnJlY3Q/IFNjaGVtYXRpY3Mg
c2F5IEdQSU8gaGlnaCBpcyAzLjNWLg0KPiANCj4gPiArICAgICAgICAgICAgICAgZ3Bpb3Mtc3Rh
dGVzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICBzdGF0ZXMgPSA8MzMwMDAwMCAxIDE4MDAw
MDAgMD47DQoNCk9LLiBXaWxsIGZpeCB0aGlzIGxpa2UgcHJldmlvdXMgcGF0Y2guDQo+ID4gKyAg
ICAgICB9Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gICZhdWRpb19jbGsxew0KPiA+IEBAIC0xOTksNiAr
MjA5LDQ1IEBADQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkcyTF9QT1JUX1BJTk1V
WCgzOCwgMSwgMSk+OyAvKiBSeEQgKi8NCj4gPiAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAg
IHNkMV9wd3JfZW4gew0KPiANCj4gc2QxLXB3ci1lbi1ob2cgKGxpa2UgaW4gdGhlIGV4YW1wbGUg
aW4NCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxy
emcybC1waW5jdHJsLnlhbWwgOy0pDQo+IA0KDQpPSy4NCg0KV2lsbCBmaXggdGhpcyBpbiBuZXh0
IHZlcnNpb24uDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIGdw
aW8taG9nOw0KPiA+ICsgICAgICAgICAgICAgICBncGlvcyA9IDxSWkcyTF9HUElPKDM5LCAyKSBH
UElPX0FDVElWRV9ISUdIPjsNCj4gPiArICAgICAgICAgICAgICAgb3V0cHV0LWhpZ2g7DQo+ID4g
KyAgICAgICAgICAgICAgIGxpbmUtbmFtZSA9ICJzZDFfcHdyX2VuIjsNCj4gPiArICAgICAgIH07
DQo+IA0KPiBUaGUgcmVzdCBsb29rcyBnb29kIHRvIG1lLg0KPiANCj4gR3J7b2V0amUsZWV0aW5n
fXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzDQo=
