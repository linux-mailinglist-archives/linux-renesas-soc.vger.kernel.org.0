Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F5445306B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 12:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234976AbhKPL3q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 06:29:46 -0500
Received: from mail-os0jpn01on2109.outbound.protection.outlook.com ([40.107.113.109]:7233
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235000AbhKPL3L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 06:29:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJQAYdEHcLXz+f4fhjFppSv/ZCQRhjQbtOMK1e/yiQqjRxqH73fNPfS54HxyZ8i3YuEjpIZDEmb1V3CoeSTXvH9bUdITIq1phR6fJx5EpKoSZqDuN+8EW6bVmXCv6l/Mlr26MjRLqmmKdPEfIAbeuyDMmBhIO2OfvZBwHvs+wDcsJWeeapk9Kp23wUCnnxaV95UEtKmEvQQm9dXts16S0vOJPOnoq9B0X0x7sFTel+33+MAh+Vq81i2GiTTiMIde9ofDo/54xuWJmyJ3DA0dO1pB1vlSBKQ74z8oawABxtEuwqPxRsxcZjfacY94zw0yb7I15X5jQeRiw7F91mb64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ASi6HuTpJKshi9xIITBC4h1MPts6bqWrjRppN930cs=;
 b=imaD/+xATjo/Z43s0Hz23MBVtTnCwXyQB4Vv68Y+tfGOP0fv96AGKMiGM3yiHF3NCKXJRc+B5eNuEuklMSDtF8GYkR7SMF1RnQdTAzgDT+koxSyvoxAIAIj5acurNx5OL4aMRiHSNzqGERr0cCn698/N1x1hWLHpo9W5BXH2c6BFzK4VHCCQlDV9ugioUf8i/LePUlOd8uPLsAdwyaREwjhaGQtHX60aRTt824llcFX/yqD2BhT3WEewKECFZFP1lB4QGui2kJYjJPaNFjmgsv9GhHtFgpsO0ahdVA6F+slOg5UqVV53/hzbsIRPWRSFTaa5HxxI0NTP9XNOypZVzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ASi6HuTpJKshi9xIITBC4h1MPts6bqWrjRppN930cs=;
 b=f8rCDJFPcXWG87aAhxLaSPm+sDLFEUmcrV1HIlfFks97tkPGJfJTwnCPY2tFlLKRKk0JmYr0Hn7kuDCedzeudjvwPQS4CYGUhHxNAUNW/5rX2qwXAzcoupPmjijCZ3oo7w16eHEqJ2Txfvs+JQxRuOK42seBw6AsSzZQGK9agfg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB2935.jpnprd01.prod.outlook.com (2603:1096:604:20::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 11:26:12 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 11:26:11 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Topic: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Index: AQHX2jrE4eSX7ohpXUa1PkZIvz7h+6wEx4EwgAAw7wCAAA+tYIAA7DUAgAABScA=
Date:   Tue, 16 Nov 2021 11:26:11 +0000
Message-ID: <OS0PR01MB5922A978B55C09B9E754DBD486999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZKz/ptgPfzqGfeq@kunai>
 <OS0PR01MB592241C04F5CDDB94D850FFA86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUm2EG3Yi+eTZA0E9tZOT71ewkbx=yh8sVOnL207Od3Rw@mail.gmail.com>
In-Reply-To: <CAMuHMdUm2EG3Yi+eTZA0E9tZOT71ewkbx=yh8sVOnL207Od3Rw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60a8b459-fb36-497f-b34c-08d9a8f3e48a
x-ms-traffictypediagnostic: OSBPR01MB2935:
x-microsoft-antispam-prvs: <OSBPR01MB2935929F9F56F1A1AE9CEF1686999@OSBPR01MB2935.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iLll+ZeAuiITjc7LB/2GCpS8heGwQXIlGKcTVKw3sTHI4nSAuEdWHXzrkyIWiffesQedm/VoOuMNZVkK4UQt7sxfR32rMhFrI3jYD2xlvJKm9FVXhdI6t3asJstSB+J8Jz+X4sHYbF3z1RaVrAysbyGCSoRWZVpxpalvaJzGs7NQnphqJkbrVtbDw/xGKIip8Y/+dmwu9l8zROG4MkdxWvRjqeXurgqzMUkCMFaqRgBqOcTvV/V2PI312V6RUp5/InsGyKkR24JZJiU1GAWKi+ssf0xsw411kny3VxM75B5DdWyPsES9Gf4GEk837aJr+SjZXeLuf7NxW2EaZ+2f+xeF6zTZNnQ6NCWod5dFdiPedpsP3ZsterYc0EyAb/1Vy+VfWbrsGwy/Mojdtv9N5xJMI7GrfkwhjcYVAka38lX9jaW3WzvcKTrm442IuyAEfPFxpU/L9NClPkdu0I0+ckonhcT18QVez67YAwzPtdsnHeks5hdu+cpDCYVyHKf7acI4eqX6YDiP7jnB0Cegc6g22A14Ds0zbzx2y4SV/GOwRFRBFxgt4SU+WT16fGMr6LhBHpHCtanGZIrbFRorlIF1gybAbX9uKA8BfOJ7UOb4T9EurWVac9pOyaDkjiy/BcK1lMGXZAjGXk83ovKYc1l50qQ/bzHQMivm9mOHk9slUApn7VyARsAIW1A2E0CgOmlnk7S+AsFd3fYAm38Tnw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(71200400001)(6506007)(316002)(7696005)(4326008)(9686003)(52536014)(83380400001)(5660300002)(8936002)(54906003)(33656002)(508600001)(26005)(66556008)(38070700005)(76116006)(2906002)(122000001)(66476007)(66946007)(86362001)(38100700002)(64756008)(186003)(66446008)(53546011)(8676002)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzJZazVmeXJNSEF0ckZnSzRZYWowbHFTdmlPWWk1c0l5TmJ0MGc2K1oyVDdT?=
 =?utf-8?B?b0pBMEFEZzZYclVaeE5XYkcvaXE1WXRiUTB1TXZ6ZlYzY1RtREJJMmtUYUtJ?=
 =?utf-8?B?TWI4WTBPeDZuSGx5alVsZnBYNnRrb2EvS3FNbnB2aE55TlN1T3hGbURXSXpC?=
 =?utf-8?B?cGRlb1hhQVJxemF1M1RDV3EvVlhCZXU2YTVhczNoL1Rva0RFNXRHMjNPNThB?=
 =?utf-8?B?b0FOVE03R2pyejl4WVZyc2JWbTBvYkNIVEVsTlppaHFmS1lQVjUzTXFVLzZV?=
 =?utf-8?B?N0JSaXpHbTJ3dWpnZHhZbHpxSzcvWFU1ME5sQVhIaU5lQ3lHa3NSOFluMjVr?=
 =?utf-8?B?U0p6eFpydFFhczF4dE5ZU0t0Z3o1bmlDdGRSamZya1Nrd201elVVenJzMy9V?=
 =?utf-8?B?b244ZXRiaVI3TkxSU2Y1R1ZVRDJUZ1BaLzdUZ2VOa0pPZnJmR3RpQ245Y0sx?=
 =?utf-8?B?dit2V0kzZTU5a1VyYTNKOW1yK3NqVGxCMThkcXJQNGp5Qi94anpUYUFHRkt3?=
 =?utf-8?B?anNXVWVGelVmME4weGE1RGxuTFdwV1BmcWJiZ1hiTnB6OStveThRN0lGUjhy?=
 =?utf-8?B?cVpuMERvWmpwWVluMUVZWmVoRkFoZHl0VlV4d1F0NkdqWENXVkVpaGFRQ1RT?=
 =?utf-8?B?K3lwNXpicGNFT0NJMlJwSHV0czNhbTUzS1hxb0hqa3Y1VTl1bWFNOENGZEFl?=
 =?utf-8?B?NzhBbnpydUhQV0FuRFFlVVI3eTMweDgvV2syaWljZ3BIU0pqM3RTeXhBQUtG?=
 =?utf-8?B?dFdWTmw0Q3hidllMZ1BnbWdSbVdmWW5sT1JBSmp4bytXcEUvYVhYNEtZUzBM?=
 =?utf-8?B?Q2lleWs4TjkvNGcxSEtONmNUbHR5dFM0bFdiVllqS3Z0TkllcEVQUkc3MXM5?=
 =?utf-8?B?VjMvZGkraGUxaElKMHJBY3N1NHJrQ2VBOHRlZEFBVnd5L1NmVzVBNlRVaWNF?=
 =?utf-8?B?eFdEanlKZ1kyVTJKb00wNytUVnFwYVordTRDMjBHbkFrOGNSR3dhQXEzNDFE?=
 =?utf-8?B?N1Frc2NTazBjQm1tYTJabzYwaHhXZzVSeFJRRkh4NERZMThlUTQ0UkFnSUM3?=
 =?utf-8?B?TUJLV1JTVThGdWtVejVIenhYWlF3S05KK1hhMVZHSjF2SXQxY1ZEUndIU3Nu?=
 =?utf-8?B?Tk44MnNUNUZBekw0TWFjdy9rajZYYVJoM3NUVlh4N09HdWdDVVJzdzBpS05h?=
 =?utf-8?B?dXNWZ2V5bnQzYW5OSWh0WnZpT2VnVjZJb3AyVlNJWG9QNlpLQVQrMkRSWmR6?=
 =?utf-8?B?UStLTTU4RS9rdWRYVGppNkp4ZnZ6NXNjTlNvTDNJc3Z5MG5qc0dla3ArUHJJ?=
 =?utf-8?B?QXZjN0tpdW45RHRlV0RUWjY1KzJqWDJWcjd0M1ZnZ2U4a1VpbUtjV1d1VTdL?=
 =?utf-8?B?ZldYbjROVnlNc2JYWGFjL0JYK2c0MytZelV0SGZWWmp6eVdPaXpXZXk0V2J4?=
 =?utf-8?B?WnR0czFEOW45USs1ZXJ3R01mdC9LV29EMzdwaVZCZVYva01yWm9mOGRIVkxZ?=
 =?utf-8?B?QjZ2U1RlZ1BLZFUwdGp1TTdwVTdnWS9ZTDJGOHU1b2pUTUZJZjRmMzdOSFNG?=
 =?utf-8?B?cTNxTndYRVphZVZQYlI1V2Fna2VoNGhNdHRsdVZYaHBEWFhpalVnaitsTnNT?=
 =?utf-8?B?K1QvanQ2dHQ0ZDJSaWNtZUFHZzZ2bHRUaUpZdENOYTEyUm9qQmlDY2ZJUXdH?=
 =?utf-8?B?QmVOTmtvYjdoRGZoczhFZmRod2RPVHJzZnB2bTJvMXI2NlRIVnVCVDhtZ3hv?=
 =?utf-8?B?MFdaQ29GaW41TEpuekZSdXY0UDFCdDBsMXBtTE5iZmY0NVRod1JvKzA3WnVN?=
 =?utf-8?B?SGY3UUo3NFBaSkw0Yjk5YzNCSEhERHUwUWFXY0ZXeWFYY1NUemNHcVBpSEov?=
 =?utf-8?B?YkhqKzJhOC9YREpBdEJaY2gwZTAzWVFoWE1QZ3BPdWR2dE9lakVvNnhjcC9F?=
 =?utf-8?B?OG16WUpQN3BTRVdhWXdMZ0d2elo3M3dHYkt6S2pCS3N0YUN0UUdUNnIxN3dU?=
 =?utf-8?B?WDFuN0hjSkM5c2JpYnFBNDBTYVJyR2J4WHBYdDRjVStEUHFNaHNqVTc2c09y?=
 =?utf-8?B?TDBJM3M4Q1lrVUthd0lJbDgyTm5rMlNCYm9Tdjl0SUlCZENqcmF6Rytic1pi?=
 =?utf-8?B?cExrT2NyTVdlam9rcnM2UjJpVG8zUGpKL0h0bXJ2WGt6dm9wZ1Avd0pQdkhz?=
 =?utf-8?B?S0p0MjBNUjRaS3UxeHYwWnA4dzBySURzLzZHMHY0VnVBK05lcWJ4eTA1L3R6?=
 =?utf-8?B?aDNkZzFuRUhrNTBmS3hFTWloTlFRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a8b459-fb36-497f-b34c-08d9a8f3e48a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 11:26:11.2628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q3jfqDjF5kUDlSFUNGkdYKEcaTF5y1s3s+EoT3cdiTFpbe5mldfXMFKuglqHoDw6onp7AJMQnhM61AvXiwWi6eYcGNdd23lXzmJPZBEa5J0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2935
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjNdIGR0LWJpbmRpbmdzOiBtbWM6IHJlbmVzYXMsc2RoaTogYWRkIG9wdGlvbmFsIFNE
bkgNCj4gY2xvY2sNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIE5vdiAxNSwgMjAyMSBh
dCA5OjMyIFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6
DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBkdC1iaW5kaW5nczogbW1jOiByZW5lc2Fz
LHNkaGk6IGFkZCBvcHRpb25hbA0KPiA+ID4gU0RuSCBjbG9jaw0KPiA+ID4NCj4gPiA+DQo+ID4g
PiA+ID4gKyAgICAgIGlmOg0KPiA+ID4gPiA+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+ID4gPiA+
ID4gKyAgICAgICAgICBjb21wYXRpYmxlOg0KPiA+ID4gPiA+ICsgICAgICAgICAgICBjb250YWlu
czoNCj4gPiA+ID4gPiArICAgICAgICAgICAgICBlbnVtOg0KPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgLSByZW5lc2FzLHJjYXItZ2VuMi1zZGhpDQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAtIHJlbmVzYXMscmNhci1nZW4zLXNkaGkNCj4gPiA+ID4NCj4gPiA+ID4gV2hhdCBhYm91dCBS
Wi9HMkwsIGFzIGl0IGhhcyA0IGNsb2Nrcz8NCj4gPiA+DQo+ID4gPiBUaGV5IGFyZSBhIGZldyBs
aW5lcyBhYm92ZSB0aGlzIGluIGEgc2VwZXJhdGUgYmxvY2sgaWYgSSBhbSBub3QNCj4gPiA+IGNv
bmZ1c2luZyB0aGUgU29DIG51bWJlcmluZy4NCj4gPg0KPiA+IEFoIG9rLCBJIHRob3VnaHQsIHNp
bmNlIFJaL0cyTCB1c2luZyBnZW5lcmljIHJjYXItZ2VuMy1zZGhpDQo+ID4gY29tcGF0aWJsZSwg
V2UgbmVlZCB0byBtb3ZlIHRoYXQgU2VwYXJhdGUgYmxvY2sgaW5zaWRlIHRoaXMgaWYgYmxvY2su
DQo+ID4gV2l0aCBpbiBnZW4zIGNvbXBhdGlibGUsIGlmIFJaRzJMIHRoZW4gTWF4IDQgY2xvY2tz
IGVsc2UgTWF4IDMgQ2xvY2tzLiBJDQo+IG1heSBiZSBjb21wbGV0ZWx5IHdyb25nLg0KPiANCj4g
QnV0IGlzIGl0IHdvcmtpbmc/DQo+IFdpdGggdGhpcyBzZXJpZXMsIHRoZSBkcml2ZXIgbG9va3Mg
Zm9yIHRoZSAic2RoIiBjbG9jaywgd2hpbGUgaXQgaXMgY2FsbGVkDQo+ICJjbGtfaHMiIG9uIFJa
L0cyTC4NCj4gDQo+IEFzIHRoZSBSWi9HMkwgcGFydCBkZWNsYXJlcyBjb21wYXRpYmlsaXR5IHdp
dGggdGhlIGdlbmVyaWMgcmNhci1nZW4zLXNkaGkNCj4gY29tcGF0aWJsZSwgaXQgaXMgc3ViamVj
dCB0byBTREhJX0ZMQUdfTkVFRF9DTEtIX0ZBTExCQUNLLg0KPiBJbiB0aGUgYWJzZW5jZSBvZiBh
biAic2RoIiBjbG9jaywgdGhlIGRyaXZlciB3aWxsIHVzZQ0KPiBjbGtfZ2V0X3BhcmVudChjbGtf
Z2V0X3BhcmVudChwcml2LT5jbGspIGluc3RlYWQuDQo+IE9uIFJaL0cyTCwgd2UgaGF2ZToNCj4g
ICBTRDAgLT4gU0QwX0RJVjQgLT4gaW1jbGsNCj4gICAgICAgLT4gY2xrX2hzDQo+IFNvIHRoYXQg
d2lsbCBwaWNrIHVwIFNEMCwgd2hpY2ggbWlnaHQgYmUgY29ycmVjdCwgYWNjaWRlbnRhbGx5IDst
KSBBcw0KPiBxdWlya3MgaXMgbm90IHNldCwgaXQgd2lsbCB1c2UgY2xraF9zaGlmdCA9IDIuDQo+
IA0KPiBTbyBhbGwgaXMgZ29vZD8gSSB0aGluayB3ZSBzdGlsbCB3YW50IHRoZSBkcml2ZXIgdG8g
Y2hlY2sgZm9yICJjbGtfaHMiLA0KPiB0b28sIHRvIGF2b2lkIGhhdmluZyB0byBkZXBlbmQgb24g
dGhlIGZhbGxiYWNrLg0KDQpJIGhhdmUgYWRkZWQgYmVsb3cgcGllY2Ugb2YgY29kZSBhbmQgdGVz
dGVkIGNsa19ocy4gSXQgd29ya3Mgb2suDQoNCkNhbiB3ZSBjaGFuZ2UgdGhlIGJpbmRpbmcgdG8g
dXBkYXRlIHRvIHVzZSAiY2xraCIgaW5zdGVhZCBvZiAiY2xrX2hzIiBmb3IgUlovRzJMPywgc28g
dGhhdCB3ZSBkb24ndCBuZWVkDQpiZWxvdyBjb2RlIGNoYW5nZSBpbiBkcml2ZXIuIEFueSB3YXkg
aXQgaXMgb3B0aW9uYWwuDQoNCisgICAgICAgDQorICAgICAgIGlmKCFwcml2LT5jbGtoKSB7DQor
ICAgICAgICAgICAgICAgcHJpdi0+Y2xraCA9IGRldm1fY2xrX2dldF9vcHRpb25hbCgmcGRldi0+
ZGV2LCAiY2xrX2hzIik7DQorICAgICAgICAgICAgICAgaWYgKElTX0VSUihwcml2LT5jbGtoKSkN
CisgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYs
IFBUUl9FUlIocHJpdi0+Y2xraCksICJjYW5ub3QgZ2V0IGNsa19ocyIpOw0KDQpSZWdhcmRzLA0K
QmlqdQ0KDQoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+
IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
