Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C65426B16
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 14:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241079AbhJHMov (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 08:44:51 -0400
Received: from mail-eopbgr1400093.outbound.protection.outlook.com ([40.107.140.93]:40193
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230239AbhJHMou (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 08:44:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8vNYr/iBLz8KPcNpuFloOfHYURpXHAjGdZ+4uGQY9Cse63J91y5tkYFxMY1l5xA13PW+0x1VUEpNb8k8jA1+kQA+6djwWr8YYHBroKlTFdwTpk7ot+nQ+2oXXc6BC1zl17ZI3WBSqoLtm8gFgbPzrOX242OqVoUT6/qAWjDn4syEQNYPMtq/TOtNTK21Cx2FTy/9No1kT45OGvHqQEmlVHm/0r6Ndanp9p5btFXc4AWRcAjvrCJ+zjxAtR+HTWSV9fPJ4OBU5yjl9tmcIPhgy/d0TzkYxY14wEgI19owS3BGBrE3wZTGX7HNG4k1tbc4pv9YyEWE2fAF9JIgipjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B28TtzVJBImkY79GBDCeGk1rMfw+YzgapnUXZeosy8w=;
 b=jjnbtXeBz7PdupQzjjioPtwfA4xAEDkqtR+gy2JMlGkFKE6CW8mjCBLnv2rtD0xAg9a7vmTPA3CEVhzW2Bq+CNIMd6A2z/jPVmVqEfwor5SrUN9XpoI0ZW4OHnBvIngOU544dtDYu+YZ9XJEWCo9tRpYtHATQxl3WkaYOMqqHcBoIa9hIXc/ygtFzlO9nUM1Z+Lcd2lH2te58Q8ufjR2B84Vez96FUoEJKrk0JX33bSkkRicXsppZTVCtaELMQTI6KBOxP97VCcjNBN+aO+pJZETx8PVbkwqQwqBRhusIGmWlWILw5q+o70JzUUc+YLxShzalkDVOAabXcVSk2rlQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B28TtzVJBImkY79GBDCeGk1rMfw+YzgapnUXZeosy8w=;
 b=fWE9Ou0tIia4wBntBMqPeFTgaznnLldgTmR2sFoppMw4/wiXEiZcgXW5/v25g5zzbq3/snSzQEFR7ZJNt2UqWBnUKnn2xxPgmWODgVabRsW/zfORlz5OiyFcfGmNWk69nDmjSXccmcanbgJpOLMopkF/sBYH0w7uEgUNGTg4/vQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3730.jpnprd01.prod.outlook.com (2603:1096:604:53::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 12:42:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1%3]) with mapi id 15.20.4587.018; Fri, 8 Oct 2021
 12:42:52 +0000
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
Subject: RE: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on
 SMARC platform
Thread-Topic: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on
 SMARC platform
Thread-Index: AQHXu5Ox4/dokw/QOkuKV9S8zZhk+qvJAZcAgAAJ0QA=
Date:   Fri, 8 Oct 2021 12:42:51 +0000
Message-ID: <OS0PR01MB5922CFA47D2B427FF65BE5F886B29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211007155451.10654-1-biju.das.jz@bp.renesas.com>
 <20211007155451.10654-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXgc9MnZyznCN0CkM4bkoqz71JTAnHG_CeaDHAOCpVutg@mail.gmail.com>
In-Reply-To: <CAMuHMdXgc9MnZyznCN0CkM4bkoqz71JTAnHG_CeaDHAOCpVutg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7f98f38-5a29-4bfa-cc6c-08d98a5924aa
x-ms-traffictypediagnostic: OSAPR01MB3730:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB37308E215207B2B0A73A66DB86B29@OSAPR01MB3730.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f731PBAHSgjckPuMKTNMXKTsDL3VdSsnK/xUgOD9FwsC0EkRqesfVy3tEf+8oN5kZihvC7jIm3V/5J7nzuiuKWcOEZS1zHKlrI8MbyXhIeorQhE2Xh0zWW/MIjg18c0v81N62OUnZo5fpTcfxpyAlRSeq5fn4PJFfLNo7CNKKoKpFjFdAJ7yT1QQ+WhiV/qNIsvd6n2wazaF0+uq/uxtrK7Zm34men0YNr9grYoCD2C+fz0EwBjnaHlANARJpTrLIAyA6Hz397sxEzz+d31qwd8UORAUlusP3iq7aIKwsWhp3kiqD4QJ86FGwUcYw/9PNKUc+tCMMUAarL6APjGY3tlR5ydE1NS8W9ocYkilM0wfcIvCbM7vmyd+vvofPmdQ70NfJvlW/Sk/bmUucmcLu/642Sn/D++cICa3pFMKdWVxKbMqYJ+IAnIvtrHYc1shJwjIJ9PFvHj0yVQpsXI8hDi3b55rQVGtipxy1u0lWC7dobfX1Kz26Xz7VMuU3HGY2kQr72RzG/8WcpBYQJbVo9dUWBA0z1dpwbLAWfWnhYNuIZKhZuX3moMCweaqNCq1S0RP4h7fqAfHc+0NqP5kU/NkEDrmxuHV6c97Fdpnf0nDKhfoglNe4b6uWBPpEWpjD3Pc9LvzN76c1CnS1SI57w/sZE2M1RkFvenPNKXPA3qA8uQDTU1dCR3ntPYt/wMsxZR1zJ8QqlYpbS7pTIOszQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(5660300002)(38100700002)(86362001)(122000001)(53546011)(6506007)(76116006)(8676002)(508600001)(7696005)(55016002)(71200400001)(186003)(4326008)(2906002)(107886003)(26005)(8936002)(54906003)(66946007)(66556008)(6916009)(52536014)(66476007)(38070700005)(64756008)(33656002)(9686003)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVd0K3BYdXBmQUs5L0NVcnd0cXZIZUtGN3E4ZG8yTmxyRTRWWVJvWk9GbGlo?=
 =?utf-8?B?akYwbUVWQ2lTc2xOeWhtR2J1a2dPSjFOQnErR2RDYjJXWk00TklSc1lQbGIz?=
 =?utf-8?B?QUdXUnRtT2x3SVAvWEEwU2QyVExISW1iaCt0cythSDNjNTlIUlV3U2RoeGsy?=
 =?utf-8?B?NDhrbjFONlNyUjRFODhvZEE3cU5mYWY1MkFyV2czSTZqdkgreWF3aG5ZWGhK?=
 =?utf-8?B?TkFEZjF0SFBQbnhUU2tVcWhNaHB1RzFKUGllRTRDeDE2RTJZckZjY1ZTcTQ5?=
 =?utf-8?B?YTc3R05jMTc5M1lzTWsxYnhsRGM2ZEVHbDljSUhkanRpc1J3M3pPVTZwT05G?=
 =?utf-8?B?dXFsSzd6UUl1QXVtS0lNcFNWUi9nakNWQTdXUGx0bThKQW9sVU0xK3lNRUc0?=
 =?utf-8?B?VFdacU5JaHlRQUVvaTlKbDZEdDcvM094M29tNWhZT2VqYjVlZ0pCZzRaMW1P?=
 =?utf-8?B?M0FMeVVuWTBselhnNkNENHNzOTdDRU1pNEo2QzVPZUYvYStlTzl0eGltanl5?=
 =?utf-8?B?bStJd0VLV1JaRXlsNkJrWmRsRUxGeXZESVFvZk5WZVdDbUxzcVgzdlRsZWw3?=
 =?utf-8?B?bC9JdG5waE5kc29IdGxBTHo1U0ltUno4M3JRWTJHcmVyWk8yWW8zR08veVZk?=
 =?utf-8?B?K0dlUlIydjh5N1pVU0JzOUNWNTBFYnpabW5IT09QeitKdTVxTXN0d3QyS253?=
 =?utf-8?B?UElhTDJPMDZKTGxjT2hZMHRLWWFSZlJmZzNkSnFiN2MxS0M5eUQwUWJEdmsv?=
 =?utf-8?B?c0l5YWQ4M3pFY0REbDZNMnZCM3R3Yzh2bTBkT24yakJPMnl6dVRkajFxY3Fs?=
 =?utf-8?B?VDlmRHJrNDVMckhQdHpCeE1XL1BDeGExcnd4ajBsNDFkWC9LK2ZvQ09BQ2hl?=
 =?utf-8?B?K1AvTlo0RnJpVmMvZ3VINXpZSVBDM1JKdDVVdE5CNWx4Uit1WlRlazZJYnE0?=
 =?utf-8?B?Mm9oeURHQ21iZXBpMTV2U0FwT2xOcXF0eUF5SHdGWFAralZOd3hWUTI2dWc5?=
 =?utf-8?B?b1NwQVY2azh3QU8zdUFuUjJTM2xRSkp0V2xGcExDQVNUZEEzWHNpUnZjajhj?=
 =?utf-8?B?Q3FrOGd4dmgxN2ozRmR3T081d0t0Z2FLQXpQQkx2NW1KajQzN0JtMXlpd3Mw?=
 =?utf-8?B?TkljazdFazRGZE1EREtBeFBOZlFPNnl4R05INzhTdU9xU01QOFVzMGdHZzJv?=
 =?utf-8?B?RmFtTFBtQVE2MDZRZTQ2Qno1UFowbzhua0JOTktiRjhDYVZsbkZmU3JHajVP?=
 =?utf-8?B?WXA1R3lhdWFTR3lPZW5MSzFjWkJIWkY3dlZuWVVwaG9scTJtRU0veE40YjR5?=
 =?utf-8?B?dFJNSUZvdGUyeERuQ1piNTNUclpESmEzNjdnOFpxblVPdEtKU25lNVNBWXNa?=
 =?utf-8?B?bzRxU0FYTUwzWGh3dU1MdEN5ckRQN25sK0pNd3J3TWxEMUEveEtRZmlKTVB5?=
 =?utf-8?B?OFM1RkhrS1Z6L2hQdVdlcmZyYllTVHlkM1hWajVzaXphZVhKaVBQKzBGRjJX?=
 =?utf-8?B?RklVb1lkZnlrUVVvRUxXRHB6YWJPSHIvRHFIeVNFUEY0TFB1UkN2R1UyaHNP?=
 =?utf-8?B?c25YU2IwZGNOOFIrTE9ZR0plUkZHL2tIUzE2NnMvU3QvK2psRHJsYS9nQkVE?=
 =?utf-8?B?T0t6QWRham1hbFRtQlZuOVRTR2tvMnNBQWtSS1VLbmJVNGszRDM1UG13Rjcw?=
 =?utf-8?B?QzQrVHhUbysybFNIRmVIY0JWSlpkeHo1Y3UvM1Q5MjlESGdmQlRuNE52TVA2?=
 =?utf-8?Q?f8KyRqzAkR2RfgGItc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f98f38-5a29-4bfa-cc6c-08d98a5924aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 12:42:51.9669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: efbGe1OAhdJxe3NBfJ8wyMzA05PZwv4ZRMhMHfRllaLBGCJvLtwY8YVgvc2PyKN9hY5gI/6eLeUiIepnSH4wZYUiPQEerw7/IRfYy7xB20I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3730
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDIvM10gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMmwtc21hcmMtc29tOiBFbmFibGUgZU1N
Qw0KPiBvbiBTTUFSQyBwbGF0Zm9ybQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgT2N0
IDcsIDIwMjEgYXQgNTo1NSBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IHdyb3RlOg0KPiA+IFJaL0cyTCBTb00gaGFzIGJvdGggNjRHYiBlTU1DIGFuZCBtaWNybyBT
RCBjb25uZWN0ZWQgdG8gU0RISTAuDQo+ID4NCj4gPiBCb3RoIHRoZXNlIGludGVyZmFjZXMgYXJl
IG11dHVhbGx5IGV4Y2x1c2l2ZSBhbmQgdGhlIFNEMCBkZXZpY2UNCj4gPiBzZWxlY3Rpb24gaXMg
YmFzZWQgb24gdGhlIFhPUiBiZXR3ZWVuIEdQSU9fU0QwX0RFVl9TRUwgYW5kIFNXMVsyXQ0KPiA+
IHN3aXRjaCBwb3NpdGlvbi4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggc2V0cyBHUElPX1NEMF9ERVZf
U0VMIHRvIGhpZ2ggaW4gRFQuIFVzZSB0aGUgYmVsb3cgc3dpdGNoDQo+ID4gc2V0dGluZyBsb2dp
YyBmb3IgZGV2aWNlIHNlbGVjdGlvbiBiZXR3ZWVuIGVNTUMgYW5kIG1pY3JvU0Qgc2xvdA0KPiA+
IGNvbm5lY3RlZCB0byBTREhJMC4NCj4gPg0KPiA+IFNldCBTVzFbMl0gdG8gcG9zaXRpb24gMi9P
RkYgZm9yIHNlbGVjdGluZyBlTU1DIFNldCBTVzFbMl0gdG8gcG9zaXRpb24NCj4gPiAzL09OIGZv
ciBzZWxlY3RpbmcgbWljcm8gU0QNCj4gPg0KPiA+IFRoaXMgcGF0Y2ggZW5hYmxlcyBlTU1DIG9u
IFJaL0cyTCBTTUFSQyBwbGF0Zm9ybSBieSBkZWZhdWx0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gPiAtLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMtc29tLmR0c2kNCj4gPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMtc29tLmR0c2kNCj4gDQo+
ID4gKyAgICAgICB2Y2NxX3NkaGkwOiByZWd1bGF0b3ItdmNjcS1zZGhpMCB7DQo+ID4gKyAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWdwaW8iOw0KPiA+ICsNCj4gPiArICAg
ICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiU0RISTAgVmNjUSI7DQo+ID4gKyAgICAgICAg
ICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAwMDA+Ow0KPiA+ICsgICAgICAg
ICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsNCj4gPiArICAgICAg
ICAgICAgICAgc3RhdGVzID0gPDMzMDAwMDAgMSAxODAwMDAwIDA+Ow0KPiA+ICsgICAgICAgICAg
ICAgICByZWd1bGF0b3ItYm9vdC1vbjsNCj4gPiArICAgICAgICAgICAgICAgZ3Bpb3MgPSA8JnBp
bmN0cmwgUlpHMkxfR1BJTygzOSwgMCkgR1BJT19BQ1RJVkVfSElHSD47DQo+IA0KPiBJcyB0aGlz
IGNvcnJlY3Q/DQo+IEFjY29yZGluZyB0byB0aGUgc2NoZW1hdGljcywgdGhlIEdQSU8gc2hvdWxk
IGJlIGhpZ2ggdG8gc2VsZWN0IDMuM1YuDQoNClllcywgQnV0IGl0IGlzICJBTkQiIE9wZXJhdGlv
biBiZXR3ZWVuIFNEMF9ERVZfU0VMIGFuZCBHUElPX1NEMF9QV1JfU0VMLg0KDQpGb3IgZU1NQywg
U0QwX1BXUl9TRUwgd2lsbCBiZSBhbHdheXMgMS44Vg0KDQpGb3IgTWljcm8gU0QsIFNEMF9QV1Jf
U0VMIHdpbGwgYmUgMy4zViB3aGVuIEdQSU9fU0QwX1BXUl9TRUwgaXMgaGlnaA0KICAgICAgICAg
IFNEMF9QV1JfU0VMIHdpbGwgYmUgMS44ViB3aGVuIEdQSU9fU0QwX1BXUl9TRUwgaXMgbG93Lg0K
DQpUaGUgdGFibGUgbmV4dCB0byBpdCBoYXMgdGhlIGRldGFpbHMuDQoNClJlZ2FyZHMsDQpCaWp1
DQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1hbHdheXMtb247DQo+ID4gKyAg
ICAgICB9Ow0KPiA+ICB9Ow0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4
ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0
aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
DQo=
