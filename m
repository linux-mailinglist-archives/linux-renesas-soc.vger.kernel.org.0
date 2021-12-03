Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41BA46720A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 07:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378698AbhLCGjL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 01:39:11 -0500
Received: from mail-os0jpn01on2121.outbound.protection.outlook.com ([40.107.113.121]:13046
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1378607AbhLCGit (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 01:38:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXdBpnVjLmODwZN0qfq31Imk6gx8n/4aZaFB1CTFJVfLwRuTQgIYncWyPXI1s2PR7gm0XG/xE7zEF0XvzP4GtRoZlLr7+Z74ffiVICZi+NanyXKmyoMWivy2BsfyofyRonNFHpgc1gw12fOOKiSovjxEeAiyXOkT95BBmw0O9Ma5DjAZwNUzaU7oiDCSeeUiR+s6witkqzrO1cW6x6yA9mdOWb9fX5b+smmGQqcCgapqQACBOBtgSfvIXWE3tki0HTSw5WoPdGFwOQlZRwWSqwb9BTwhscCSSAIIBFwY4WS6bvvwW3Nr2uAHMXACG+98Zv69sXR9odb1xIZrJi2mQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFV8wxG9rckufksnqZk5gNeiDmZ/ispHSzmMEmbqtec=;
 b=lZt1bzhIlWtZIrYYAzVHY755ZwJDdEnP/mTNUDzNut7oCvVpOHeJD61HbNrSLD1Nv0TkJte9FtzxCebqKpuSQ3296Xjve1GYqOLRe4DC5KPBOPUrZ7Yo5Hn5/gCj49+iPCBqeKtFo7MLyKebcz37P6xfxpOXY3aeJa3xf3NlMsrN+mktdyIjKIXx5nmI7V3k5QaZ/jMJH00f0R4EwawbegRvOZxtSAQNTf5Rz4xUUksZ8JcjUcNIG701ApqPSPMYE7HP9zd90hYyGbmw+lVzXMtWJwLhToDMqEclyO0ma+3iIDpZbHFuTwimnJrZK63P3Yz+JSMPYx+1iqz0AVHkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFV8wxG9rckufksnqZk5gNeiDmZ/ispHSzmMEmbqtec=;
 b=h+hoXboNLcLDFXN8R1s2ORxNDMjFPul02HOj3WReatHgMekZm+dmTrxcRKqRzK6VJMPGlYA7yv6hVA9IiMsMj3367suWOG5T00PEx3ldOh7VvMjdnQoLzIOJRncvUxMtB8iIHA7uxBcQatgzkyn+TDY3womDnjxHLDXRfPEO2sI=
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com (2603:1096:400:a::10)
 by TYYPR01MB6796.jpnprd01.prod.outlook.com (2603:1096:400:cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 06:35:23 +0000
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::d5f2:c948:3e2:ff6b]) by TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::d5f2:c948:3e2:ff6b%8]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 06:35:24 +0000
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: HDMI isn't probed on v5.15-rc1 on ULCB+KF
Thread-Topic: HDMI isn't probed on v5.15-rc1 on ULCB+KF
Thread-Index: AQHXumBA9Ogm9LZ2+0GY63D7tblfOKvHf6qAgAAQHACAACsdgIApOr0AgAJADICAH8mPAIAAsMzQgAz6rxA=
Date:   Fri, 3 Dec 2021 06:35:23 +0000
Message-ID: <TYCPR01MB55810AD85EEF11DD56BE9EC5D46A9@TYCPR01MB5581.jpnprd01.prod.outlook.com>
References: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com>
 <YV5vB4c8J0xu2mOd@pendragon.ideasonboard.com>
 <87v929moad.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUxXP86Z-2Tb8t4bK6aBfRT1Toj0jpruEEd8YbeDL+h=A@mail.gmail.com>
 <163585809096.275423.10804585086979279969@Monstersaurus>
 <87bl302598.wl-kuninori.morimoto.gx@renesas.com>
 <YZ5CuiCyNDE7IyNm@pendragon.ideasonboard.com>
 <TYCPR01MB55810D57110CD65672646EF2D4629@TYCPR01MB5581.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB55810D57110CD65672646EF2D4629@TYCPR01MB5581.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 342bc65d-4b9c-4971-9ad6-08d9b627161c
x-ms-traffictypediagnostic: TYYPR01MB6796:
x-microsoft-antispam-prvs: <TYYPR01MB6796AF01C8C75F0AAC683394D46A9@TYYPR01MB6796.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u5hp5F/nnMWA/+c6W/Vz9FDf8c4kp29LgiPP715p/KtflgYgXGjxLRkWEvqhbHXWKqwAm1e5VdNdFCG3uL92aWlI9IJNmcUbeECfX1N0oNxy4gJ7eh/7YtbGBUcaY8U0b0FMD+qmAjaNtZKlY8jvC9jakwVMuHynNdqmhVof0B6+jR10cWhdpgwwQC8jAQAb8FI7ZN+UhThCrMW7iqr2Hlh47wo3hSKsEpCtAEwB84YosOLlS+in54MWOH4WSrFwKQcZlY2EwvtwSG8xflik+zqiB6smTLyCnHhq18Qo0vXq3Eg7CIoviz9gLj3bnwI9SFqgn/xOisZ7KVbxFA0n6f/i+lX0eFjXidhN8FRlh2oCYJaIt0LrhIUWuO679p+OnXYA4Q/p81AaJVnOjnLiNd9Gz0h4tof+CQeZXKS+f/lO28dcmhfBIJ3F1pHbFk31/tuXEAmeuHvdgAqj/zLJ4a2v5j1KBcoBizJran6/f05gSm5Qf5GhXCgJclVaqcJTVONfcINUTgTKK39Y92Lx2OEScH7IOSuh+1X747W0Z8gcVOiY5QDTzLH8jgg6h/2u3CujnWMtFrRXsno74QYa4Z2VUkM29nPiRYRFE5Y3CvDew0SywddbEAtr03/vOzRoWRLPpa4U6Lpf7aeAGR+tHTJ+5bn0RdbvCtqbb78AEhJEy3I/4C6uVm/J5I2M41m+W5GBKJtTYmYObcEOYohOwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5581.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(55016003)(8936002)(2906002)(122000001)(4326008)(316002)(54906003)(86362001)(8676002)(83380400001)(6916009)(508600001)(38070700005)(186003)(7696005)(6506007)(66946007)(26005)(66476007)(66556008)(33656002)(76116006)(66446008)(64756008)(5660300002)(9686003)(38100700002)(558084003)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTZYVFFSQ0E5c2x1NHBhYzJhajY2MlN3VWs1cVVFbnBhYllZTjZrSG9TOGlz?=
 =?utf-8?B?SnUzRFQ1M1RaMUw5MUI4LzUzK2JWN2JjOWV0ZkQycm03eW95OURYS0xZUngr?=
 =?utf-8?B?Tlo0WndZRWppazZ1dzJjbkEzTmVrTmFYbWNtMkxNNnZyaU5JTHNabDlZT3c4?=
 =?utf-8?B?d2YxS0k4SHZIQWhVazJ6L3l2VVl2cjlLUDJxUmt0R0J0MVNBVmN0MXUxeVJC?=
 =?utf-8?B?Tjg1V0R0WmJYU0crTFloV0ZjTGkrMlpwZE5oTlA0YkRsRXo1aHhUZTZIQ3lv?=
 =?utf-8?B?QmRqQ1M4SzlXVW9yc08yYmVCTko1aFFkd0pFODZ1R3NJczF4YXkwUzIvTUdk?=
 =?utf-8?B?aStLeUg0eTl0SnpWK1JtOU1ZNUxScmp1d3ZMRStSZ1lQQmYvM3JyaVRWemJD?=
 =?utf-8?B?VkRIam5MejlwRnRTZXJqZjRTc013RExGZFFoT2JWMmlIS3hQL0tHRllvSnda?=
 =?utf-8?B?d3Z6SWYwdkNUMXpRbUVBSlZMOTcvRTlSUjJaZnQyRWFBY2IrTUEyd3VaRkY2?=
 =?utf-8?B?Q1lmcCsvc3lDT1dvM1Y1TXZ4VE8xZk1RSVUydjZKcFZFYU12N25HSWxCK0pn?=
 =?utf-8?B?VU1rK2RkRGp2Q05wbDcra0d4YU9ESUlvUjgwUGpHYWhtT09MY2d2NDBPcG1R?=
 =?utf-8?B?R0w3eUlXSEw3dVVQVGVCSmQ3MnJVUlM1MGRtemxsK051RTlEWTRaUUx2TTM3?=
 =?utf-8?B?UTF3Skd2d1FPREkyWUdxL3llbVIrRUw2anVmR1Y4UmY3NHdDcm1pNUxiQm9o?=
 =?utf-8?B?YjJNdW80V21ZZmxOeDhTa29MZ3ZrSTQ5Rm5uRk9uNzZYRWt2MDBnREZTcHhM?=
 =?utf-8?B?N2lUMExMYi9rKzJRbG1uZEpKbXN5eTFXdzVyYTNjYjFkaFdmK0dOUDFzTFdK?=
 =?utf-8?B?b3RYdjN6ZmNYaFZpNEMwUXdPSjVoZEE1d1BFMm9nRldrVEM5N2F0MTYyY1BU?=
 =?utf-8?B?NHpRN1E4eGY0SUI5eW1WdktIRSs1Z0NNTytXUUxyU0VEcGFOWU9NWGFjRDhS?=
 =?utf-8?B?Y0NFSy8wWDFqTFRuM3g5Vkdhd2s5THB5NGp4QWkwbTZGWTNNT2VvMDBnbGRz?=
 =?utf-8?B?aGFrenFZazNxZ3BNeU5ETFgvNVR6eWJsanhodG81MjdRTkpuTVFLYXNiN2Vx?=
 =?utf-8?B?cVl4ZUlUbFdERnlBY2lnVEFkSXFrUFFEM2VtYmF0ZWoxL3Rtdi9jcTZqU2lB?=
 =?utf-8?B?ZmQ1Y0tEL2RXSkkxaFhKNVdkWEltaHBnZURGQTVpTXA1bkVtTzA1b3pvNGJa?=
 =?utf-8?B?dFJOQmhpb0dDbmRoNEI0M21rUnM1OHNvbXo1NzZjc0E1S1l6Y2tPWkVqOUp5?=
 =?utf-8?B?aGxPYlR2OVM5UE4zUzNUZW9FN25zSVZOamJJMEQ1NWZtcDFORnhLSWxKMG1Z?=
 =?utf-8?B?VXZWVk5tUlB3SFhlcUZCWHNKeEQ5Vis5OS9PY1c3b3U4UTIvWVE4YzBucG1J?=
 =?utf-8?B?eWpTUFVzSloyWHFNbnRsTWNZaWIwblZVKzVZajdFeHd3RWpNRmxnM3FNUDZs?=
 =?utf-8?B?QjZiL25SWlJYY0hxK3RML1NXSmxnYU9tV0FaN0x5Mm1DaUxrOEhuVGV4aHh5?=
 =?utf-8?B?N25PN1dYcWhvams5TkNpVzVhbUk4ZVJVd1FDNTRyaDZsVTk0WUxSeGtqNUxt?=
 =?utf-8?B?QThrYkhaNitGSXBoMFhONzNzZmFKSXNPYXpEdFR3THhUazFlbmJiSkRFeGpH?=
 =?utf-8?B?U3NwVVBacHhkZnRIb21YQ0NSeGFHdHNxUmZnLzVzVkVjdEorV3p4cDdJcmpq?=
 =?utf-8?B?WTBvRXB0WmU4YkJsL1BoS0FKNlBPU3c3VUt1TVE4QVJqeldNK1NzeTl4V2w1?=
 =?utf-8?B?dmF0czFXMzhRb0RXZXQweW9TOXRRTXRUalUvWE9tUmhiMlRZUThzK2tRelFL?=
 =?utf-8?B?bDI2cHlQcExYUmxGYTdBcVVxS09nZVBjQmZ0S2o2WDBFR2V2TjEwbmRjUHo5?=
 =?utf-8?B?NU9uMU1BV2VQeDcxYmF3QnVUK2xDeGZCWU5XZ2xGRk5HN1RzVlBZVllINGhO?=
 =?utf-8?B?d3V1d0NiU3FNY0ZaWURwcWxZd29FcGxjR2QzT2ZRTlRlbGJyenZrTGpJaXVL?=
 =?utf-8?B?NXE0aUxXeWFRQjNscDVFMzIyb2lNUDRjY3lxK2Z4V0l6NkY4U0ZPTGhJbEVk?=
 =?utf-8?B?blp0Z0tGOW1qODNJQWZ3Uis3Qi80UVh5SkY0OUdCNlpmdzFUZmlMS0QyVTNJ?=
 =?utf-8?B?bklPSndBczFTN1FuOEhlbDBpdzlySkV6eUhsNkdQSDdNOGZqV1JEMWxPK211?=
 =?utf-8?B?bWJPd2QxYzh4dDFXUlQxaUZuTlRIUWszZERDcmZRRnp3TU5LK05wNUMvMVd4?=
 =?utf-8?B?Nmo2RG1DeHFWK1doSUhHYmNhcEwrUU1LeDJLcTEyNlFjTXJ1RDVadz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5581.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342bc65d-4b9c-4971-9ad6-08d9b627161c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2021 06:35:23.9324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJMYNSekpStlhqDOqrU3NwRr41fC4KmCg1eckeAaOtG+foaFqv4BjcFm3f3DH9CnOIStwY5GL0s3Q5avognhJR4ElCCeolUjS5b3nT1f+1w8Y6dSNBDpssTcNMRyFQ7a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6796
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpIaSBMYXVyZW50DQoNClRoYW5rIHlvdSBmb3IgeW91ciBoZWxwLA0KYW5kIHNvcnJ5IGZvciBt
eSBsYXRlIHJlc3BvbnNlLg0KSXQgd2FzIFBDIHJlcGxhY2Ugd2Vlaw0KDQo+Pj4gIyBDT05GSUdf
RFJNX0RJU1BMQVlfQ09OTkVDVE9SIGlzIG5vdCBzZXQNCj4+DQo+PiBFbmFibGluZyB0aGlzIG9w
dGlvbiBzaG91bGQgaGVscC4NCg0KVGhhbmsgeW91LiBJIGNvdWxkIGNvbmZpcm0gdGhhdCBIRE1J
IHNvdW5kIGNvdWxkIGJlIHByb2JlZC4NCg0KQmVzdCByZWdhcmRzDQotLS0NCkt1bmlub3JpIE1v
cmltb3RvDQo=
