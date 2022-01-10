Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219B8489E55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 18:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238273AbiAJR2F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 12:28:05 -0500
Received: from mail-os0jpn01on2138.outbound.protection.outlook.com ([40.107.113.138]:7284
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238230AbiAJR2D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 12:28:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvMSJeVPHQ43ITekdikeopmkz8wf3juJbPlusD95FUYJ6kLSLLHzfE05tGPO67DC7OIBLdgGbcx0iVGceYledtH77FqguTLWkX45E40mUi14B7bLiSrIMcLlYIgXj8ZVT5gzfMxzxGy9v8vLNua59ceWkhFVKIQt69auh61ENJps110XTtIbCL/ynwCah7ZGtea2gi9KLIEsFfqJsApgky5ZYyTshs99dw8IZjvKWEM045SQIZUuXxWSVjHLwNjW+XDuq8LuFoQu28eEniQqJllwMChFkpTEmOxT8cMY0QaVFh0EwT2kiUCl5v/VCg9AJ+oDWC9K+SZ9JTbZFJwWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVa5B6Y9Rg0UFEPuuwevkNIEl8PI8h1ioEoU8optQdY=;
 b=A2LdcMRNI0HmC0TR7Nv0i+ZvYPMYs1bpKSVN/NaufkkZ/5QowW38f6LC1Mzhjd2Bu0A0Wgw7oWZsvmnG+m5g9RqW/nGMvdkFf4Wubi4Y96/rsXQFIRE/xf81h/+paFdqVI9mL4wnTBKIt5bPG3F0YbvUyQnuPT3gpcmVQXnm5D4ANrajbM5auURmGtVnK3OGdQ7LTqI7izkf2NL3o+nOW2SeIN8/nkWE014ZFEzW4VRWaLdl1mOxOPNPzsKA9PqkD0Bwt1GCIdJc5Hp9PIWTSyzx5zCZmDz7szysNDHQKXEsdB/8Mn2js1LBTke8dXUKvHWm8YQ5+1ED2OPty8reqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVa5B6Y9Rg0UFEPuuwevkNIEl8PI8h1ioEoU8optQdY=;
 b=q4ojXnousqJCGiqfLF+DUagQ2X4H5fY1TshVbfLz/rb/ZUZHX8hd2ZglelHnmd06i5WelB4iJHIhA7ugZxI2yURKb9zNa5h7T8a/uE9WgeUw0aRCyRxxNxB3jUrJkEEUnXoEVELcFjM+JaXwNLorW04WekFmVvrI57oMIfCr6OA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSYPR01MB5494.jpnprd01.prod.outlook.com (2603:1096:604:8a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 17:28:01 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 17:28:01 +0000
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
Subject: RE: [PATCH 3/3] arm64: dts: renesas: Add initial device tree for
 RZ/G2LC SMARC EVK
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: Add initial device tree for
 RZ/G2LC SMARC EVK
Thread-Index: AQHX8nIfKG4ObBvR40Sk6KCj9CvbzaxcfscAgAAAnFA=
Date:   Mon, 10 Jan 2022 17:28:00 +0000
Message-ID: <OS0PR01MB59222FCD5D966294B9E29F6786509@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211216114305.5842-1-biju.das.jz@bp.renesas.com>
 <20211216114305.5842-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdWG+onWR-UGSG9WXcTmgfjnWxA77ZUMR6dicS9=T7Mqmw@mail.gmail.com>
In-Reply-To: <CAMuHMdWG+onWR-UGSG9WXcTmgfjnWxA77ZUMR6dicS9=T7Mqmw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc96764e-ad7c-428d-f319-08d9d45e8d34
x-ms-traffictypediagnostic: OSYPR01MB5494:EE_
x-microsoft-antispam-prvs: <OSYPR01MB54949ED14D197011E375F2C886509@OSYPR01MB5494.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 28ZK0xXd5Gvp6XC1l7+trf/+a9jAW3BDHUyzCJM9+RnPoaFUXu44EbRzHCQIrrgJLnopjd0Nkt/a6ffOgc9bKa2sNKo7t95ZTJi0I4QnHWZ4onQcS9kE5pZtwhTnqv73gP6ASKaPdvrsjIaISHOl7hqtjk7I6iV9cVz0/M5Dy40Al+mjTbGK1/pogyPuBqVxJPDAQpEzUCjYYngXAaC7Gmq0CUg6kHW+KXkvu+sE0fqV+zd6qYlHKj/TtcD5R5y+m9bP3NDfbhe3hRik06Pm9ULmFbhuJvgY1XNGKT1cydPVPOGV2RSIn5fiMmkb51o9nCvWDvdvPt/zf3noNPX8ZUp6QZULYtZHdi+2ht58JBm3zuGU3+9TihikN1geOtc3b3tJPPW5tGTkJq+Y2CDigZOc/MISTgZROMDfGlgZ8/hr+3G+QbC7tzZLkma0rdWrRiFfavVBEpqoDJwUsqeDiMFZQYHcGsS9d6X/CakS/mFejsgJ9VTlkl9JtyS30RnQ9a3ZX0WF9zoOVkVvDc6z8Mu37tTGf9B5fIPZmCrqOlLBAx20fnTwYq+vv9pK81cb4LKWkrR5/kWskZ44uS9gzU7ULpN5FHcP2C+IIhMKPsRdT3JvQO4/UfzFNFANIa9F4eL/sIjhkagXL2Mp4wkaiPAnh7erf8dLnhMOgF+YJeTjiCb5ZmuxV6UNr3glKGwTQVDqC+a+lGLibbIo/ZVk0A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(53546011)(6506007)(86362001)(316002)(66476007)(33656002)(38070700005)(71200400001)(66446008)(64756008)(7696005)(6916009)(4326008)(66556008)(8676002)(508600001)(9686003)(55016003)(5660300002)(107886003)(8936002)(122000001)(26005)(38100700002)(186003)(66946007)(76116006)(2906002)(54906003)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wlk2bVdPM1FMeWVZdWFqTkRhS3J3MVJXcW9Sek1RcytNMnI0MWZITHhlMmZm?=
 =?utf-8?B?QWUxN2E3ZTNtTWtnUzZwVnVuNmJaYVdNUzZHMjhMeWVjcXF3clBka01wd29j?=
 =?utf-8?B?RWFWbW94N0R0ekJFSU51dG8vTlJJd0QvMnlOVEVWU0dLcmJDbkMvN2FISVBK?=
 =?utf-8?B?TjB3aUNQcWlXMlNSNVFHdlRWcjBiaXFUc0hLbDRSUUdxb3UxcVlXQlhKQWhy?=
 =?utf-8?B?cG54eGxLUWorMDNWVnRISjNGb012VlVpaHJURGl4SUx3SnBUSUhrOGMvU0VM?=
 =?utf-8?B?bWQzenRZT3FoQmpUdFZTZHJxem53eVBFVkhJTTJDVTJPWjhDK015TFplbXNZ?=
 =?utf-8?B?QzZXcXhVSWxGTk83bW9zUHVpQVZuMmFVV3ptYzNVaFhuVzJXUU1tZ3VmR1dt?=
 =?utf-8?B?Z3UrQ0Z2K0R5MS9RSzFZUW12bTBpbnBuc2RvQzBvR3pLRlpQQUNBQUh0bGZN?=
 =?utf-8?B?dzJUZG1QTDVCQnp3cDJwaGpaQmI2bitndHg0RUNWR1B5QUp4WC85M2xlSWhU?=
 =?utf-8?B?ZWtSV1ZoUVNob05UbUNhS0F6cFBUWjNpa2JXbmwrR0xpZEFycmczWTV4ZFF2?=
 =?utf-8?B?c3VyTDJzMUxNQVNWMXF0TE5EdFRJdlpEbnVzeFBMSjBSTlFITHY4eGNXTXZa?=
 =?utf-8?B?ZGFsd2VuUFluMCszSitDWEZiZm5SaFNONTFvNjErVmx6VXl6VGZ0RkZXL2Y2?=
 =?utf-8?B?Z1d0SU9MSlNpMXRyUHQxS3ZrckRFTFNpalhhd3B3ZDE4Z3dsYUY5VjlCOWZ6?=
 =?utf-8?B?UFNyNWdpMGgyd0pHQTF3QmhUVjlWRk1IT3lvZjRSTXFuNU80OWpzQUF0SnZB?=
 =?utf-8?B?MjFydnNVbWwvS2IzVHlYS1oxYkdGT0Rja25mWXIzZ29sZ0hWcG53YWJ3enJ1?=
 =?utf-8?B?THRLODFGZThUOHRKWkZnQzdMMmdOTFQ0MHQxOHRVUG1mWlByeTNjR0R2Mm51?=
 =?utf-8?B?VXhoMWhEaVV2cGFCL1QwMThFdzc2YVQ2OXRNTEZDM1BCSkxyQTI1QmJvcXVo?=
 =?utf-8?B?dXZlVEd6ZEM2Yll0VW5RL1VpYTlONk9md0kyZE81NWZLckhJOWMzeGlrNnp4?=
 =?utf-8?B?WTVibUQwQnJKODhtRG40Mlo2TXFJeEROOHVNWit5TUxtT2tKSitHaVZMUWtv?=
 =?utf-8?B?SWxIK1VxYTl1WmMxVnJFdU1Bdk51Rm10czhiWmlnczdHZnVUaTVRRkRNOWgw?=
 =?utf-8?B?dVBWbHpZZDl2TUNId3dxRkJWNG9CZWdKT3NhQklveVlRVy9GbEdWSDZ5U0Fw?=
 =?utf-8?B?OU1zQ3pMd0dNd2NOeEhMZUlNUG5yVTd6RGlHTDZ2c1FkNStlUlI3UTEvMi9F?=
 =?utf-8?B?VFU2UjAzSDQrY0l0cUNzNU11ZmVqdG42a0NHbDNGbWdtVDhZenljZjFUNmds?=
 =?utf-8?B?TS8vc08xOWk0NmdxRlRSU3l3MjZNNlR0TXZCZ3FGRkk1UzdjRlJnZTA4Ujgw?=
 =?utf-8?B?NEFWOFQ0N1FxaFFCL2xuRzVRaHpTSWxheVZjMEkyYnFZOTY4b2syaEd2NjV6?=
 =?utf-8?B?VkhRM2FEa0JFd2pWSzlVUVIzdHB6dEdyMVRtS2U4UWJGL0pJdlV0TkIzcjZy?=
 =?utf-8?B?YmtEdERTakNSV1JtQVJBTm83Qk1qaVpHSXg4ZGFYSFRvci8xVWxPY3F1M1R2?=
 =?utf-8?B?WGxEb3c3S2xMWW9tZkNJS2NqREZOandpOE9xa3RRQXpzZm5GTUQ0SytDWWw2?=
 =?utf-8?B?WFpSVXBlVitaN3h0Mk5aNTVycStjVWFTTjVQb0xKa09SdmFCNWVPcXFUak5p?=
 =?utf-8?B?TDBaUHUvaXVzNFBvelIyMHY0MjFtb1BKb1dDcXcvME9sbU82bURLdlIyT3Ez?=
 =?utf-8?B?WTJ5UUJoa0tld240RFRVQVlLaGNrZVR1c0haTUJNdGc0akZKYktVS0dManNX?=
 =?utf-8?B?Q1JHWDlha1FDMkhDcVpsbFJYd04zaWMvVXdKNVJxOFdoWEdoSDEzOHBkVVZv?=
 =?utf-8?B?N0plS2VWNDBwSldSR0xVZzJIOVN2a0NLenc1S2lrSzVCN1NkRDJuUjUvNlMv?=
 =?utf-8?B?YWVUK2oxbW5WTmF3ZlhzS3ZYSlNVQ1VZVzNIQTMyWEJQNzRBTEhTUHNxdExZ?=
 =?utf-8?B?VENZZGZKY1Q0RTlnaTYxckZBcm5ZV2Fqb1pSVUdlOTlPU0psSktOdGpXZTJj?=
 =?utf-8?B?UENFallzbjVZTEJ6Zm1vcHZMTUZibmpOUnNwN2tBd0VSbGJYcUswbUJjZmpU?=
 =?utf-8?B?QklLbFVvekJZd0Q5TGNqTi8ydUlYQVlGSU5mTFVuWCtYS3hWVjdvSFlVTm5V?=
 =?utf-8?B?RTRNUTh6ejRqYTFwa0dtK0R6MTBRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc96764e-ad7c-428d-f319-08d9d45e8d34
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 17:28:00.9927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LHE3W+RDbpxRzwxT9xtxqGJAC7gDFKpFooUvyLwtJ58fGYvOHZ5MgOCKW+VWuYuBP87fwmVrR1hrKr20p1Fae1j06ckFhQjSyi3ipF1crqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5494
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMy8zXSBhcm02NDogZHRzOiByZW5lc2FzOiBBZGQgaW5pdGlhbCBkZXZpY2UgdHJlZSBm
b3INCj4gUlovRzJMQyBTTUFSQyBFVksNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIERl
YyAxNiwgMjAyMSBhdCAxMjo0MyBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+IHdyb3RlOg0KPiA+IEFkZCBiYXNpYyBzdXBwb3J0IGZvciBSWi9HMkxDIFNNQVJDIEVW
SyAoYmFzZWQgb24gUjlBMDdHMDQ0QzIpOg0KPiA+IC0gbWVtb3J5DQo+ID4gLSBFeHRlcm5hbCBp
bnB1dCBjbG9jaw0KPiA+IC0gU0NJRg0KPiA+IC0gR2JFdGhlcm5ldA0KPiA+IC0gQXVkaW8gQ2xv
Y2sNCj4gPg0KPiA+IEl0IHNoYXJlcyB0aGUgc2FtZSBjYXJyaWVyIGJvYXJkIHdpdGggUlovRzJM
LCBidXQgdGhlIHBpbiBtYXBwaW5nIGlzDQo+ID4gZGlmZmVyZW50LiBEaXNhYmxlIHRoZSBkZXZp
Y2Ugbm9kZXMgd2hpY2ggaXMgbm90IHRlc3RlZCBhbmQgZGVsZXRlIHRoZQ0KPiA+IGNvcnJlc3Bv
bmRpbmcgcGluY3RybCBkZWZpbml0aW9ucy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFBy
YWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiANCj4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBCZWZvcmUgSSBxdWV1ZSB0aGlz
IGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY1LjE4LCBJIGhhdmUgdHdvIHF1ZXN0aW9uczoNCj4gDQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OWEwN2cwNDRjMi1zbWFyYy5kdHMNCj4gPiBAQCAtMCwwICsxLDk5IEBADQo+ID4gKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiAr
LyoNCj4gPiArICogRGV2aWNlIFRyZWUgU291cmNlIGZvciB0aGUgUlovRzJMQyBTTUFSQyBFVksg
Ym9hcmQNCj4gPiArICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIxIFJlbmVzYXMgRWxlY3Ry
b25pY3MgQ29ycC4NCj4gPiArICovDQo+ID4gKw0KPiA+ICsvZHRzLXYxLzsNCj4gPiArI2luY2x1
ZGUgInI5YTA3ZzA0NGMyLmR0c2kiDQo+ID4gKyNpbmNsdWRlICJyemcybGMtc21hcmMtc29tLmR0
c2kiDQo+ID4gKyNpbmNsdWRlICJyemcybGMtc21hcmMtcGluZnVuY3Rpb24uZHRzaSINCj4gDQo+
IDEpIFNvIGZhciBpdCBsb29rcyBsaWtlIHRoZSBkZWZpbml0aW9ucyBpbiByemcybGMtc21hcmMt
cGluZnVuY3Rpb24uZHRzaQ0KPiAgICBkbyBub3QgcmVhbGx5IGRpZmZlciBmcm9tIHRob3NlIGlu
IHJ6ZzJsLXNtYXJjLXBpbmZ1bmN0aW9uLmR0c2ksXA0KPiAgICB0aGVyZSBhcmUganVzdCBsZXNz
LiBXaWxsIHRoZXJlIGJlIG90aGVyIGRpZmZlcmVuY2VzPw0KDQpTb00gbW9kdWxlIGNvbnRhaW5z
IGJlbG93IFNXIGZvciBtdWx0aXBsZXggZnVuY3Rpb24uIFNhbWUgcGlucyB1c2VkIGZvciBib3Ro
IG9wZXJhdGlvbnMuDQoNClNXMS0zIDogMTpDQU4xLCAwOlNDSUYxDQpTVzEtNCA6IDE6Q0FOMSwg
MDpSU1BJMQ0KU1cxLTUgOiAxOkkyUzIgSERNSSBBdWRpbywgMDpJMlMwIEF1ZGlvIGNvZGUNCg0K
QXBhcnQgZnJvbSB0aGlzLCB0aGVyZSBhcmUgZGlmZmVyZW5jZXMgdy5yLnRvIA0KMSkgUE1PRCBw
aW5zDQoyKSBTRDAgcG93ZXIgZW5hYmxlIGFuZCBTRDBfREVWX1NFTA0KMykgSUlDMw0KNCkgT25s
eSBDQU4xIGFuZCBFVEgwLg0KDQo+IDIpIFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gY3JlYXRlIHJ6
ZzIqLXNtYXJjLXNvbS1waW5mdW5jdGlvbi5kdHNpDQo+ICAgIGZpbGVzLCB0b28/DQoNCk9ubHkg
QURDLCBFdGhlcm5ldCBhbmQgU0QwL2VNTUMgYXJlIGRlZmluZWQgb24gU29NLg0KDQpCZXR3ZWVu
IFJaL0cyTCBhbmQgUlovRzJMQywgQURDIGlzIG5vdCBwcmVzZW50IG9uIExDDQpBbmQgU0QwIHBp
bnMgYXJlIGRpZmZlcmVudCBiZXR3ZWVuIHRoaXMgYXMgbWVudGlvbmVkIGFib3ZlLg0KDQpPbmx5
IGV0aGVybmV0KGV0aDApIGlzIGNvbW1vbiwgYnV0IHRoYXQgYWxzbyBkaWZmZXJlbnQgaW4gUlov
RzJVTC4NClRoYXQgaXMgdGhlIHJlYXNvbiBpdCBpcyBub3QgZG9uZS4NCg0KSWYgdGhlcmUgaXMg
YSB2YWx1ZSBpbiBhZGRpbmcsIHJ6ZzIqLXNtYXJjLXNvbS1waW5mdW5jdGlvbi5kdHNpLCBJIGNh
biBjcmVhdGUNCnJ6ZzIqLXNtYXJjLXNvbS1waW5mdW5jdGlvbi5kdHNpIGZpbGVzLiANCg0KUGxl
YXNlIGxldCBtZSBrbm93Lg0KDQpSZWdhcmRzLA0KQmlqdQ0K
