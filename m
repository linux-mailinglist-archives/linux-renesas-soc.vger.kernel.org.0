Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAD03D7788
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 15:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbhG0NxQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 09:53:16 -0400
Received: from mail-eopbgr1400099.outbound.protection.outlook.com ([40.107.140.99]:63086
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231223AbhG0NxP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 09:53:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdv8aOhNczf9mbFl4eJLYyTJBvTl4SFGTCPDaXwmP4XF1OAoQsNCgwoKZvv95g6BySvCRRI6DWdvOEAMnDrMTPdcaOFGxjqHJat2VSI5edIV0wcIhQes2aVym3p+7G4e5t0CJAyR9sAQQjyayOCt1ru4zWNVCv15tEhVeE7BpaUomTspbMh/uLwFDpT80cZqu8FnvfUFakiMZQPp5Jw4qLJT52DGgBWmDYShUgPDTsKzI1VYT9ixv/uC75Jr6tP8+iLAFy6zVGtXZy21HFTB5DBQmA8RccT0veWHvc4aYZZcxnHwOT13sKcPGXoC249Wm6hDud+nB35sPy2RKIfFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43t6PxdR7/qrCJlt2UFTtbPYiJQ/XIXtsT8mGWrKZ/M=;
 b=OuFVvHwgpp595fhDVeDXX8pZWX0GKO52ZCR4SeUKvtzzZX8UFJfVbia25vgLuO2SdN67Dk9Z8adrBOsij1mCqWmbagQX5xJBNz8mhRn5q7Hqjee5Qi4dTt0QbG8LphPPs5A6Ph8a5y+dKU8Mz3K2PQAQzSw6d03Je7jda3fyob1SgHbSjYn4cgRZ2gogdfPiyB9E1VDCElXD2vaEQvpB87kCqYpNOMiMw/v1s0KWPmSgz3k+ybrShz9OoSo2TL/ekLhvEfehJklN8SHnI6YoXv6ElnMdCpbiivwot53SEg36P/vi+RkZQUQVbcmrv/3Pr/Pn1fyYpieLZcyI1fmWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43t6PxdR7/qrCJlt2UFTtbPYiJQ/XIXtsT8mGWrKZ/M=;
 b=OqEq7JQAe4N31EXTVk+0lqeOcLOtXc0KFj4tSe1DpweicgaGdHz7ECWNFZ9paQ+GPws5KjvRIazhhFfYS7bRlhlSvYGqiq25sVrIhf3BFomR7hTbGnLIqMm9coskHDM3xVJuBoQJQTm3i7phtmmddJMonZouero8uZ8mLhMrQFY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5927.jpnprd01.prod.outlook.com (2603:1096:604:c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 13:53:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 13:53:13 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 04/10] reset: renesas: Add RZ/G2L usbphy control driver
Thread-Topic: [PATCH v4 04/10] reset: renesas: Add RZ/G2L usbphy control
 driver
Thread-Index: AQHXfJhheV5fogd0t0SNRhT6tn8BzqtWf90ggABf7ICAAAKcQA==
Date:   Tue, 27 Jul 2021 13:53:13 +0000
Message-ID: <OS0PR01MB592261A1BE75C39115A4C01F86E99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
         <20210719121938.6532-5-biju.das.jz@bp.renesas.com>
         <OS0PR01MB59224851A0C86B3AFECD575186E99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <94589fced6b4495593ff558b2b56eae4fff70bed.camel@pengutronix.de>
In-Reply-To: <94589fced6b4495593ff558b2b56eae4fff70bed.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cad78c8f-533c-4b04-4d6e-08d95105e09e
x-ms-traffictypediagnostic: OS3PR01MB5927:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB59278481E9381C375B310F4C86E99@OS3PR01MB5927.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6EQ22BbF2uhzeGrccBsMQEfIYyOI65dB/I0M3xUKB4Ll1hCffp0e53pt3q/aqdIbsrLvqFwyhh8GEVmh5/MLcA5McTTP5xpDjn1Wzm11pgSd2UhaQePERQ1BHS1K2siIRZTy5JXwfZz8WK/qxgkFGqBjE1SACfrIGO5F6Oh1xGvbnoGqQRGFw6BGzKw30kFTkONVZjUZbbMKE32VWSw2MWLGrscqAZ4KyJFE5g76dvwGMDl8eR7GYPb33mkAJuZr1yQP6sA3fKrl9FVo+/sFO1kORLYFVsJHgYS4cY/euaLClVFJIdaWYrqn8EUFF9QOj224sZJ+kIbJYQtN7WK+879juoTBEH/foGmeBHfCstKTOPDNuRQAU4iW1fzcBkVl8RieIseYzKCZZYc54f02vrB+9lVdhRhXBuGBRz/PXT6RbrkEAdCD6FT5LJrOHeqoEeJ2JU3Kek0CmLsVZfmi8xEeLHcRYsvpvwtFOGy1ktjCBV2hIXWaI1jVp4i5NcPE1bG0m7J94A41bUWlsSrQl5RzmKfEB1DrprOpT7MW3DtQwL4CdjQFOUtqS6p/NbwV1G/4S4gcvDUPi3MKbqccJdy5W+TuB5+agZ4kNMFWjwircNYicsaICC156BDpjFDdUgoXfDqSsSuP15oCK66EJvJ2fk9uTM8QgKosSsEykNk4bWEUfRQ+tULjWY3EDiy5o3mmY1jVc0U9JA5nV5oFUDiC9LCHwt6FgZ1wJ5ySCchnuW0kD7Zn6pj6hS795Gm+xCgsSOv6sVCrxqv+iiJYjpDEuha4sMSk3+ju7ZjVlmw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(7696005)(76116006)(33656002)(38100700002)(86362001)(8936002)(2906002)(66556008)(26005)(64756008)(55016002)(316002)(478600001)(54906003)(186003)(9686003)(66946007)(6916009)(4326008)(66476007)(966005)(5660300002)(66446008)(6506007)(4744005)(52536014)(122000001)(8676002)(71200400001)(83380400001)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm9BeSs1ZWwrYTFkcFBkc2dkU2RwbHNRcmlIdDdXbHB0Nncyc1VvNEF4NWht?=
 =?utf-8?B?MTRDTzBmZ0ZNTzdFbFIvdTQzelJLRnh6TXRMS05zd2RQNHBMTlgyUUtERjJV?=
 =?utf-8?B?MSs1akNPd1d1NVVWamNpZnpKRzJaMjArbjIvU2VwQkxDTkR3K1krSmV3c1VO?=
 =?utf-8?B?MnRaSSt5WlkrcVExM0k5ZVlzSGFsd01kVVp4UDk0SjdCa2VhU2theEdCdWFP?=
 =?utf-8?B?elluZ0V4ZHErWDA4OENxYkNTWnhOVWdHWmtkc284ay9RV3FHTnVNNm15Wk43?=
 =?utf-8?B?ZC9WZ3Z6M0tjSUtsWEp3b1U2Yml6a3R3SG5EU3BXdGdPVVhkSGdCUmlMUDJm?=
 =?utf-8?B?TGlWdzdKYUdNbGtlK2IyTU1kNk5mZTFEdmNSQ05Sa0ZuTlZFaW02ZG96Znp1?=
 =?utf-8?B?ckxHaVFZMTI1Z2FMSElqSy9OTnJaUm5xQ01lUXREYjhJdjhyM0s0eXlGM0pz?=
 =?utf-8?B?NDRpNUYyZWJjS00yZGhsbm91dUFvbStweVpsNndKRFVTSlRCMzdyUjZNMU45?=
 =?utf-8?B?U0s0TCt3b0dTSmlwTzQvQVU3MnF4UzM4d1lxZS9yVXovWTBKR2xBd1JyMWZK?=
 =?utf-8?B?d3NTUS9wREZja0tGWk5mM2lSR29ESDlYZFJNOGROWmZ5MmhEQkVOak5KRGlo?=
 =?utf-8?B?ekhTY0I4aFNBWXkyczVLUDlEVG0zSjFNMlFnd1MrSmlRcTZNNGVrVVVrQXpa?=
 =?utf-8?B?WFRsb1lIVldDQVRFaXBHc1dORy9RRVBjalpacFgrN2FhM2NvZmx2UEtDUjRF?=
 =?utf-8?B?amwzdlVIOC84eXJHZi8rOTYyMVZmMDRuVmRPUlJLQm1IZ1pZWUZPM1lUVGJo?=
 =?utf-8?B?UzhvbEpMZ2E5cVdoL0NVb2hzSy9BMlVkdnBUYWVNcEJHUEM1d0lsVTdKdFMy?=
 =?utf-8?B?azg4clU3YzRnZWV3QVBoelZPNDY2MW5sTWZ5ZnZMc2dIUGMxdGdyVFdlRzFM?=
 =?utf-8?B?NkVOdjRONnVmMEVmbW12cm40OUhBTVZJMTgxT3R4OURwcVk5dWdObnZ6aitO?=
 =?utf-8?B?MTJWVkpjMXBMcTh2dHRIVEpKSldsNWhlTEdWdmxFWUZSZnlhaGJOeEd4UkUv?=
 =?utf-8?B?aU9rWHJvMjg0eEdFWnZmemN5ZUt2dzFhUWQrVlU2eXpXRyswb0IzeGNiLzV6?=
 =?utf-8?B?bDA4WThOdFlSZUh4VnQ4VHFRVTlHTENqUW5TSFNueXl2NXUvWnZxNGwxK3Fy?=
 =?utf-8?B?ZVUxRTQwZmtsRXIrR24wMXdRU3NtZi9BV2tyTm01dXloRVRidjY5TllRUXp6?=
 =?utf-8?B?RE1ZbUtJc3pPaVgvQk4ybkVXQkRHMVAxWmVNcGRVWGtFTktQWGplWStWZ1lk?=
 =?utf-8?B?bmxWa0RFYWh3Z3M0WjJNTUU1SkdURGg5MkRnK2VmdVFZdFYzTlNKd29NRTNH?=
 =?utf-8?B?a3ZrTEI2Q3htcnM2VXZxWEdUSTZvVkdwTjVYZVc3VUx0alFpeXVYZXdpWHBP?=
 =?utf-8?B?VmtOK0FiQWVvNDJMdGJjaXpic1NvaCtpQmFKS29ZWCt5azNCaStOTGtad1E4?=
 =?utf-8?B?N015WkdTQVhLMWo4eFdBT0ZFNFpBVzNUZnZhTnBTY3BEbkZLdWlwWWh6RXEx?=
 =?utf-8?B?T2VYN0FGM2t6WDdOL3YyelhQOW8vcVpxYjY0cExyN3pFeUVxYkREMUlOY2JI?=
 =?utf-8?B?K3hhTXAzaHJIM3JZM1k3Nm9YM1JXUHlmNTV2VDAxTnFTUkd3OXFmbVNRVUlX?=
 =?utf-8?B?dnhJRStpQTFCenlxUmY5dDdVMzgrUHpRalB4WUM5TUZKc2wxd3BNbnlHOW1F?=
 =?utf-8?Q?0XOXjSmHcyv7vvA9pdt4rstuzK5sl4Uy1qXVzRs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad78c8f-533c-4b04-4d6e-08d95105e09e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 13:53:13.2921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CrGLeaiwsGA/NILjUp34otRbcNIFrp6sFQ/wN+XYqgU9XoIVcaWjjuiWzUCOdkoGSkrzY59O/C5xx2Ayp1DkTFks4PhkYxQHHQl1rG8+RZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5927
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUGhpbGlwcCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2sNCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY0IDA0LzEwXSByZXNldDogcmVuZXNhczogQWRkIFJaL0cyTCB1c2JwaHkgY29udHJv
bA0KPiBkcml2ZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDIwMjEtMDctMjcgYXQg
MDc6NTUgKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIEFsbCwNCj4gPg0KPiA+IEdlbnRs
ZSBwaW5nLiBBcmUgd2UgaGFwcHkgd2l0aCB0aGlzIHBhdGNoPyBQbGVhc2UgbGV0IG1lIGtub3cu
DQo+IA0KPiBEbyB5b3Ugd2FudCBtZSB0byBwaWNrIHVwIHBhdGNoZXMgMyBhbmQgND8gQXJlIHRo
ZXJlIGFueSBkZXBlbmRlbmNpZXMgdGhhdA0KPiBJIHNob3VsZCBiZSBhd2FyZSBvZj8NCg0KWWVz
IHBsZWFzZS4gVGhlcmUgaXMgbm8gY29tcGlsZSB0aW1lIGRlcGVuZGVuY3kgYXQgYWxsLg0KDQpC
dXQgdGhlcmUgaXMgYSBydW50aW1lIGRlcGVuZGVuY3kgcmVsYXRlZCB0byBjbG9jayBhbmQgdGhl
IGNsb2NrIHBhdGNoZXMgYXJlIHF1ZXVlZCBmb3IgdjUuMTUgb24gcmVuZXNhcy1jbGsNCkFuZCBp
cyBwcmVzZW50IGluIExpbnV4LW5leHRbMV0gYXMgd2VsbC4NCg0KWzFdIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29t
bWl0Lz9oPW5leHQtMjAyMTA3MjYmaWQ9MDNmYTZlNGIyNjIyMDM1Mzg5YTRiZWI5Njk5NTUxZDYz
ZDEzMDQ5Mw0KDQpSZWdhcmRzLA0KQmlqdQ0KDQoNCg==
