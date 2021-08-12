Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C8C3E9F5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 09:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234761AbhHLHUR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 03:20:17 -0400
Received: from mail-eopbgr1410105.outbound.protection.outlook.com ([40.107.141.105]:2992
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234626AbhHLHUQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 03:20:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1gMmJuhMVfBNxwWy+FC/oqxf7C+1jaefjTAQs1Hf9Z8IY3uwuStNCL4v999BCLicDZPRoPFdLilGZt2pq0LY1aX2OJvd5kEX68MQelZDqtjNEDc1tYNVppYeamut+vSOFOQJuFvdXuPBOMmBu+DAb6HS/WcXouuw8nzmdKZgjjBBtrV8IYYucLVczHdLM1OwfXEPrSY1vc3Dz6XECdUfhks8thAfvghES2SX+IFqTW8hpSHEC6fJlS5shyIPWPgi6ijSqRdXobs+FRJ94xA4Gu+RuZbb7isytVtuU33J+ewtf//RTc9PqoVkPOWJh4AKKQ7cPWBWj9wUlsQSZ+H5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdQGJ9xye6Nn9iEL4tNXAexEsmDhp6zP/OSzEQEvt0M=;
 b=ngS3tsDHpsl9J9MQA4bPjP4deNtQo8c9+lc8uKToLXIjr5r8rjMblk+3NiQrFs1WHPmiNRSSmMGZi3ULKzs1gsVW18BBhv6ieEjEFDV5xKVAyIyfBK44UHnFk264XR3wgOrIp1+Tm4+95Mw0ym8ao7c24oWMJuHeFlDIM31bXp2SV2z1PqdA2X73grql3A4sNiOnFbu+QjyDEgrUUVeXWygaodlI7VW/UYgYuBhPkG0ofcKuqia51x6K+WUteWpGc2bnnbWHuqVLvzGoTBJTj5ToHk2jaOg/X0AUT3BrKb+lNpeoJB8poVGltux/MrLtjOiRVQv97WC636XvTIvkrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdQGJ9xye6Nn9iEL4tNXAexEsmDhp6zP/OSzEQEvt0M=;
 b=LYjauC0aRNOu9s7QrCG8ZEdES1TttdU9DgkUEfYiGUtmepU5PmYMhcA/YL87V+7N8FmBlyaJxwYzzebUNF+rYjEvupHK1hY7m9zWXnBKvhHTYGuzBn0eNJ0Y6EECUAXk/L7mby2r2sPWOwYltGphihwWbM3cQe7lealDOvhXngI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3477.jpnprd01.prod.outlook.com (2603:1096:604:44::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 12 Aug
 2021 07:19:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 07:19:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 2/3] ASoC: dt-bindings: sound: renesas,rz-ssi: Update
 slave dma channel configuration parameters
Thread-Topic: [PATCH v4 2/3] ASoC: dt-bindings: sound: renesas,rz-ssi: Update
 slave dma channel configuration parameters
Thread-Index: AQHXiq37lTDjQJIV3E2Kf4EpyfxHo6trJuCAgARYNvA=
Date:   Thu, 12 Aug 2021 07:19:49 +0000
Message-ID: <OS0PR01MB5922D3C1DA1335FE2676B89186F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
 <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVnU4HSXCr08WEiVmYCNoRBcdZGOfS7mwmS_euo2RZaEA@mail.gmail.com>
In-Reply-To: <CAMuHMdVnU4HSXCr08WEiVmYCNoRBcdZGOfS7mwmS_euo2RZaEA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a7d887a-c6fd-4486-ecc5-08d95d619226
x-ms-traffictypediagnostic: OSBPR01MB3477:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3477E437371A78B7DA471EBF86F99@OSBPR01MB3477.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g9ER5dgxQma7k6XPLEeCn+Mr931Thcgz3PDsyDCagycQu+xv7diEpPhB80rc9xXbBnCo6nM1P4wFMYHjFxw+XqddGPXPBgiyR3nbq7HlNAFuj5A80vgwLcn+SGsWPeXXcEJPMeIcYal+WMM3MR3WHmSxPonkIstOqnHrHlWtn65QooJSbOme2HF9xE9IqI/+g+9lNd8BfLsteaJMddsuPX3inFWmNKF58j54WUXgKxVyy1VulqEH7xS8D/qQ4S9Bt02rVkojWM5VVZGAnNTjN29YiojLQZLyPS+98erim+sOg+Tq1ISIRPXLjmHHke/HhHCpz9G7Bn62wWbi0mKmzKdEB0S/vRVGq99L5y/euEdjC2BzmD2sQmn4XRsDF51Fy3yvRf3JDAVqSpe756osj03yuxPoBoKfBFPGS03JWF4OIGrLgj5Kj7rlMfO5m/0kQaOEM1rCQ9MDBoU/OU7VCTJqzNiP11LtyuCUsK/DQSqi78MPhad8yZkz6vxjveyKhtdEVxU1uEw/T5i1b0YKppIc15KjY0NqBFp74JdSSIYxP2blhdALEiDneJi68FzcnuC29NHtnXucz98GwPDXcPm2QcpKHzn4JvQFuXunHrm7Zru4zkKnv5GhtalWARKMNZXKkJf6tuJZepd/ljpX2ZrJR/sbfd3wJAdVyztDn3qBHY16Yh6cSqRqLTt4BzfsABwI3wCnQTp5uaucVc1OiA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(26005)(8936002)(9686003)(52536014)(5660300002)(478600001)(122000001)(76116006)(38070700005)(83380400001)(2906002)(86362001)(316002)(66446008)(71200400001)(7696005)(33656002)(53546011)(38100700002)(55016002)(6506007)(54906003)(66476007)(6916009)(66946007)(186003)(64756008)(66556008)(8676002)(15650500001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1Q1cDlna3dtVjFsbjdjQzJVZmg3U1Q5QmQ2TkdXR0tNdU9ZRG1hSm1mTHBO?=
 =?utf-8?B?a0l3elEyZlNqS2dFU0ZNZzl3N2FsWTNaSmxPMGR2TjFVNUEyZTBXWmFvWHZt?=
 =?utf-8?B?UWJCNmFFRlNDUkowdHRtNXNheGs5Qllrb0J0YVNDODRkTjlveUlkUENaK1ZX?=
 =?utf-8?B?UTRZZnBqQ0l1TE9wWTdaVnlSOXNEd2t2MTNNVnIrZHBSWDJyVDU4TWlsVmhS?=
 =?utf-8?B?NE9hbkErV1lEWGpSOTRReE5YWFhTekhJRlpZa3NmdS9NM2Z5amV6TS9GYndh?=
 =?utf-8?B?QWhuYk14Z01RSGoyWjlZUVdidTNTQ2U0bE43NTJXY0l0cHI1dlBPakRHMVZX?=
 =?utf-8?B?R2RTYU9sdHJUcDcrNXlscjlpV2JkZVVCUDhLcjJGM2JjKzB3eUsvUTJUWVNB?=
 =?utf-8?B?VG5Cc2pVWGwyN2NzaUgvcmxVQUNMK0FOMlMxMzhCeko5bkMrMXNuWXI3YlFR?=
 =?utf-8?B?amZSZmVXUUhCMllUN1pzTUtpZFpNaWNUQWxiYUtlSTZ6czRNcDFBeElLQzd0?=
 =?utf-8?B?K2RlR0J4dHBmMjBUZ2NzR0tORG9HS3BNMXc3anJnNkNBc3Z5Wll5R2lqUWVM?=
 =?utf-8?B?bHV6VUlqMm9xZ29aaXhnUVpmU3g1Nytaejk4WGx4ejNodEJNdDhHWVhUYmtl?=
 =?utf-8?B?cmk0TnRNOXROcElrWkpkemZLTXdrMGhtbXVDMlZJL0o0M2d5UUVIb25tR3hV?=
 =?utf-8?B?Q0pXTlNCMnMwUkE4eGlQQXVVTFBvVUVUWFFHejRnWFpkQlFDZHJvdGpZbGNZ?=
 =?utf-8?B?K1g0QTVRWUxlaWFZZmo1a2tHaGlNYy9FVnJBa3dMZ0lMZ041SjdDeEQ0SzJC?=
 =?utf-8?B?SzgweEhETFNiZ1ZuV0V6bkFHcXRPUWNsa1RqbkptWDQ1bU1yVkNUbVNZeVdk?=
 =?utf-8?B?RU5haTVnM1RKalc4Vi8xNUJqSHU4ZHpCYjFGYzJ0UHNOUWtGd3Z5VlJBeFE4?=
 =?utf-8?B?YkNxS01wTW9BVG85NkxHUTlWY2FpS281Vmg5VnU3Q2FIZnQ0bjVnSW9kczZn?=
 =?utf-8?B?MGdPQjdCYXY2SzJtMk5TSjNFRUFRNWdSSEZtU0xGMEtHc2M0TzgxM2xtdTNS?=
 =?utf-8?B?cll4QUlHMnNVNDNFUi9OTkJnWUtMU1MvWklBRy9pcjhSNEM4bS84V3Z5SnlC?=
 =?utf-8?B?VkhHVGhIZ0FEUFJNWVU2Y0M4RzB6eEFXcXVYdm5FRHZsUGZWZzk2YVp3M0t4?=
 =?utf-8?B?WVQrbTFUWmwzNEJEUlpvNk83b1FBck45TFIvbmc0SmxLVk1jYjBIWlkzWmVl?=
 =?utf-8?B?TEsxWWp5MG5kZ2dmSFU5NndaMW5udjhkYjdQaU9Hb1JNSnpXa3pTMDd5NUNM?=
 =?utf-8?B?Y0RqYytYTkg2MkM2ZGRERjVuWHlwNWozS3FjZWdhNkZBWlJBYkVYK3o5SHcy?=
 =?utf-8?B?THpqOUhZQm9NbjI4Ti80Mm5uUHFDdWd4bGk3UFpiYmgyOUQrUTArSW1lK0dD?=
 =?utf-8?B?dkFIcWxyZGpiem01enRSQ0gxTldZMzYxMjlQSTEyRHBIblU4UkNwelRVbnVF?=
 =?utf-8?B?MUdVL3Jtang2SHdmZ3VFSDIrOCtMZE1LaUN6YzlTZlNCbmZNbjdmTXEwdC9m?=
 =?utf-8?B?MUUzc0p6WDAzVkt6ejdXUDNZZmIzR3lJclhXcWlhcmg2VDBacFNvU2R2Ulh0?=
 =?utf-8?B?RUVGMktZeS9SU0pmdG14Z2RaRElNRU1zQ1ptUmJ3VlZLUHF0aE5UL2I2YlBp?=
 =?utf-8?B?bUt3ZndFNlJ0MnJ2cGJ2d2F2TnpGWUxZQzNRTnJrVnBDZlBjT3FnYVB0ZFI0?=
 =?utf-8?Q?bd2a8nsweWNevANsNmsCavDiCYpQQ8WIDUhrWHf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7d887a-c6fd-4486-ecc5-08d95d619226
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 07:19:49.3113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z1rNtQF6GXH+2bgCikfZGrD8IJmgFg6g9sfcfOVRjsH6X1fMU8DEEQ9b0yUmIB+ZAZi7sITm4rKoirUaDsohwfAP/kJq92IyWvqdyLL4umc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3477
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4NCg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0IDIvM10gQVNvQzogZHQtYmluZGluZ3M6IHNvdW5kOiByZW5lc2FzLHJ6LXNzaToNCj4g
VXBkYXRlIHNsYXZlIGRtYSBjaGFubmVsIGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVycw0KPiANCj4g
SGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgQXVnIDYsIDIwMjEgYXQgMTI6MjkgUE0gQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBUaGUgRE1BQyBkcml2
ZXIgb24gUlovRzJMIGV4cGVjdHMgdGhlIHNsYXZlIGNoYW5uZWwgY29uZmlndXJhdGlvbiB0bw0K
PiA+IGJlIHBhc3NlZCBpbiBkbWFzIHByb3BlcnR5Lg0KPiA+IFRoaXMgcGF0Y2ggdXBkYXRlcyB0
aGUgZXhhbXBsZSBub2RlIHRvIGluY2x1ZGUgdGhlIGVuY29kZWQgc2xhdmUNCj4gPiBjaGFubmVs
IGNvbmZpZ3VyYXRpb24uDQo+ID4NCj4gPiBGaXhlczogNWRmNmRmYmI2ZGU4MTViYTNhKCJBU29D
OiBkdC1iaW5kaW5nczogc291bmQ6IHJlbmVzYXMscnotc3NpOg0KPiA+IERvY3VtZW50IERNQSBz
dXBwb3J0IikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gdjMtPnY0Og0KPiA+ICAqIFVwZGF0
ZWQgYmluZGluZ3MgYXMgdGhlIERNQUMgZHJpdmVyIG9uIFJaL0cyTCBleHBlY3RzIHRoZQ0KPiA+
ICAgIHNsYXZlIGNoYW5uZWwgY29uZmlndXJhdGlvbiB0byBiZSBwYXNzZWQgaW4gZG1hcyBwcm9w
ZXJ0eS4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JlbmVzYXMscnotc3NpLnlhbWwNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcmVuZXNhcyxy
ei1zc2kueWFtbA0KPiA+IEBAIC05Myw4ICs5Myw4IEBAIGV4YW1wbGVzOg0KPiA+ICAgICAgICAg
ICAgICBjbG9jay1uYW1lcyA9ICJzc2kiLCAic3NpX3NmciIsICJhdWRpb19jbGsxIiwgImF1ZGlv
X2NsazIiOw0KPiA+ICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZjcGc+Ow0KPiA+ICAg
ICAgICAgICAgICByZXNldHMgPSA8JmNwZyBSOUEwN0cwNDRfU1NJMF9SU1RfTTJfUkVHPjsNCj4g
PiAtICAgICAgICAgICAgZG1hcyA9IDwmZG1hYyAweDI1NT4sDQo+ID4gLSAgICAgICAgICAgICAg
ICAgICA8JmRtYWMgMHgyNTY+Ow0KPiA+ICsgICAgICAgICAgICBkbWFzID0gPCZkbWFjIDB4MjY1
NT4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICA8JmRtYWMgMHgyNjU2PjsNCj4gPiAgICAgICAg
ICAgICAgZG1hLW5hbWVzID0gInR4IiwgInJ4IjsNCj4gPiAgICAgICAgICAgICAgI3NvdW5kLWRh
aS1jZWxscyA9IDwwPjsNCj4gPiAgICAgIH07DQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGdv
b2QgdG8gZGVzY3JpYmUgdGhlIGV4cGVjdGVkIGZvcm1hdCBpbiB0aGUNCj4gZGVzY3JpcHRpb24g
Zm9yIHRoZSBkbWFzIHByb3BlcnR5LCBzbyB0aGUgRFRTIHdyaXRlciBrbm93cyB3aGF0IHRoZQ0K
PiBudW1lcmljYWwgdmFsdWVzIGluIHRoZSBleGFtcGxlIHJlYWxseSBtZWFuLg0KDQpBZ3JlZSwg
d2lsbCBhZGQgZGVzY3JpcHRpb24gZm9yIGRtYXMgcHJvcGVydHkuDQoNClJlZ2FyZHMsDQpCaWp1
DQo=
