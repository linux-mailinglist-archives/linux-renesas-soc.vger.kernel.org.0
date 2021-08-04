Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4523DFB0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 07:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbhHDFaI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 01:30:08 -0400
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:41088
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231611AbhHDFaH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 01:30:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrR/P8CMRuqE3P7rQyhbCTlpVxsQQ1UIVer1OopJHQ+MQXUe5PMVuXATe0kaea2rACNPeFHzvZOYN1yLLwzzlZawP5hBrvO9bmC8E9suf497BQiZ6xNxX2Jg2QxAdv9WVtb3gaUih57uCiJlosqR7rztCZKmDRLYDDJizVYJameenjf+0zF1kCtjpPWMedniZ03Vw9SLHtpcXtPeStZ9JmXIMA8zeLmT7oEnUwl6t521+siILLCO4if08aQcqH8ESbVSaBsgaPOeiNNcctrbrsgAD91lbRZ1KayY7e4XjWwPTxC+WmJCiGKkFkUnL52LRqSiqH/1wEcF2k63Ppl+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00Kl0XJSRBB+yVwJk8CAC3qwmn3+Hu8jyaNm+OUMsQc=;
 b=gzHkkXjM84AewaV7xZMSrQfjI0ebPnvqsA3ZLhcGDGRd5aMMlacSyM0ykr+UvohrdskkKJKsbS03e7//BNiDUowq2O9tKP3BumM/eVAalQuZaNuSWlA6DyKqrim/YgNMeBSc+7xp6I+KU5JYKUdSEdwFNf2OQjetZGjhNpQMHGCles2zqz2cGiyEM7P0ALJTmyElvth3XDLd5MXHbnyltbdta8+2vSu8yk69whrIFZqeh5+17XcpP0vzPusiHeGJtZzcvgasTZVRCRU7nusrspaga/XEt6F2xB07EcLSpiCIoAyNLrpYvZQxXfSEOZoYBrNV/HiEpWSKwEkyifsCKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00Kl0XJSRBB+yVwJk8CAC3qwmn3+Hu8jyaNm+OUMsQc=;
 b=lAQsz16i0py+pHWF1kmQYhMvIFwCQCyIrEQ7r/yQMfrfP/ZlxciGxNraS3TO8nxEdeyDJzGbNicLpXfhahpqNn+JbvbpqnE7FIdQG1kQPsH+/HuLB9ZY7Q36msIV14287KwcVShug0yzcZ0ICEB7fzpqhfrFrDwyNxe9npimOHs=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4221.jpnprd01.prod.outlook.com (2603:1096:404:cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 05:29:54 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6%3]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 05:29:54 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulrich Hecht <uli@fpond.eu>, Wolfram Sang <wsa@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Thread-Topic: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Thread-Index: AQHXSNlLLnK0MeXzxECYWiEeEguOWqtcHUuAgAQPPJCAAGH2AIABkOCwgAEb+YA=
Date:   Wed, 4 Aug 2021 05:29:53 +0000
Message-ID: <TY2PR01MB369279B6F76FD5C3044FCDDDD8F19@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
 <YQQah2Q8qmQPEl7F@ninjato>
 <TY2PR01MB3692486033934E1C007EBF6AD8EF9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <821963380.577567.1627903098435@webmail.strato.com>
 <TY2PR01MB369245D958BD9EB77488CB43D8F09@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB369245D958BD9EB77488CB43D8F09@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fpond.eu; dkim=none (message not signed)
 header.d=none;fpond.eu; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9eef8384-e0b5-4215-0ac0-08d95708e3b0
x-ms-traffictypediagnostic: TYAPR01MB4221:
x-microsoft-antispam-prvs: <TYAPR01MB422138EEE85393934B2DC9D9D8F19@TYAPR01MB4221.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1RJVvp0H03tWWnrn2jJj7woHGVhbKlpHWJGLHbRApS79zTBTuCkUNmtZ2LD6vlwa860oQCQXmczFFT/kAlLzi6GsrAQ1Jzgomtjl2UFlAkASOpXu+FUCFzqoygY33yG5II+VcuSfOS5464Gu2p2yg6D4me6zE9GdxcPJ3BkYPQzcHZ0cuhM/+WSM1rkLQxHMJg1VZ6rxyUFSDEwcrLv6B+n65iq37qt+rjKEOsSDG/0SoKjC6VOasgKBozYOlswuaQlVpW/Tfxp5VgFsbpzAKvPU3tsVoqCFKibV17EkBaFIgNHM65ibmzD2yEmuNlY1w3LrQ0jvzZC/zSaGE4h4fbCsuQh5Zufi6+mvuh6uMidY/OkKY5nyGlvvyIUjCIQHUm57WQuBM4YxtlgTrPuYk6y057v7N5rocZ2GhXTAUO4OWDR6+9tPnj5dU3VSG+PA1VNhaMZwWhFI8nJWJwyR118wk+g7aqCBF3oNXqKZ5p46ZSqu57x9bWg8MtdoC4i360MlY07YyXpmGLRxU7MLl1oEGXWpsTvHb5SUSXh91GqM1xCtJI2UvX7YQqdBbUX8yOHY6LukGa1nHrWeWBp0RA86tms/v6KA4CSl/Axbewhb9OpS7Ybap4YQNX2fJWh4Oy0aRTPSu3tCExL3oO1wFfICLzEHgQBEh80eBgFLTJF3zpjJdtIzQAgAUKpym1nIpq3TPBcwf0jQctl0rUVOEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(52536014)(5660300002)(6506007)(55236004)(508600001)(7696005)(26005)(86362001)(8936002)(66476007)(66946007)(66556008)(316002)(64756008)(76116006)(8676002)(2906002)(66446008)(71200400001)(54906003)(4326008)(110136005)(38070700005)(122000001)(38100700002)(83380400001)(9686003)(33656002)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUxna0VQTTMvd1dnS3JqNk5VQktENFlLTVFqM0V5N21rL2dPOFBUTzdhS2RY?=
 =?utf-8?B?b1BjbGdGeHc5cTczbmM1UzNNelVZbFFsWm9FSExIN29NSVlENFhMWVJFL0JZ?=
 =?utf-8?B?TGUxWHYvSHNEc1daNW1WMVpabnV2K0FTNll1aDdudzdFWW9hVDhjRVRybzlr?=
 =?utf-8?B?WlBvZXJhVVdNdnBHNU8yZzk1aU5OMDZSTTJBdVFlZXM2RDZwMGJBZUFPOFVH?=
 =?utf-8?B?bnJ0UmVVTm1JdGlWb2NPOHpxbkNid0F3aHlUVzNwRnJUcHVtcEJvQ2xPM2pu?=
 =?utf-8?B?Vlh5cDc4Z2h2cXd6b1MyK01tSDV3cXhaQjJQQXpJejRCYWJQdWhEM2NDcGVz?=
 =?utf-8?B?SU01aUd4MDZTTXdraytwem9rTGRUZlMyVjR6Mi9odVpiLzRrd1N5c2dCVFlh?=
 =?utf-8?B?RDBlZWxWL2tCNXlzTEFmZmpHblp5V1J0SzJadWVnaWY4NjVDazlGZ3J3Rk9K?=
 =?utf-8?B?ZUYzbjJMd1lwdEN1OEcwOEcyNFVSdjhDYTVUK2xISjlPcG5pN0hmeFRKY3J4?=
 =?utf-8?B?aUllYUw4UGRMOHI0bGYyWS9Zam1zNXl6U2Nac04rdEJFU214Q2lYU1p5TTFj?=
 =?utf-8?B?WE81YnZiWXliSE9CZ3l1NzdWNGZvYmxmeE1ZM216WmVieW1ROG1ER0ZsVHZs?=
 =?utf-8?B?dFQ1d241bVNCVEI0eCtldDRkVTFMamFOR0Q5akw4di9BQTRQVkFTTlQ3VUZQ?=
 =?utf-8?B?bjVDdGxpQ0UwTjhqUkNlcVo1M2lGMWlxLy9EMUVLeC9sMThrYzlHMFRlOGM3?=
 =?utf-8?B?Qm9QRHNzZ2RIdFpGLzliSzVKcTk2UElBeTYxSjRicW5MM3lhYmt6aUFNN2R6?=
 =?utf-8?B?R3JQMUdnZjJVTEJYaUN0RC83ZEMxTVc5bHlNZk1XYTNKREg1cm1acG5xRDk4?=
 =?utf-8?B?OE1vZGxzbFZaNkIrTFhVRUUyTVlpdXNiaEIyTVdlSERUdmwzZFJTUHVSWEM1?=
 =?utf-8?B?MnU1MlhFYnhtVWIvdmZib2FFVkV6dTJkMkxnbVFRWWZQWVVEd1BmRmQ3UlZx?=
 =?utf-8?B?aG5qOVRYQlRidnNjMEc0WTgyOERsZWZTTUZtbnlIRzRrclBnb05zN3JyOTln?=
 =?utf-8?B?YlNoL1FhYm1zSE1lb2VLT2tZN3pET2xSSVRjZ2cyMUxXeldPZnIzajA2K1VR?=
 =?utf-8?B?WFlIZE4vMk4rNkhBZTFJSmJlMHhyTnRQNGhOZkw5aERNN2NiMFpmcnl4MVIv?=
 =?utf-8?B?S2krYk82Ymt4OUpHZjBOL0NjWDFFaS9JMzFHdHV5QjcyblAvS28zL0Vpd2FK?=
 =?utf-8?B?SkFSTTlmYUN0d1lHNDdhTjg3dDV4MWNJM08zbEFveVh0WEQ1MUZ0N2NaYTEx?=
 =?utf-8?B?Rk9uNCtEZmprYlI0U1VCQXJRVEFZeHJONitFdUQ1bkpSeGdWTndrdGVuTFps?=
 =?utf-8?B?VzBuMTQwS1BFd2dYOXJsSm0xMUcwcHcyL251bUhPUXBLUWJRa0h3bWdFL0FV?=
 =?utf-8?B?dVFUTnRLTjVaTnlsQ1RxeWRNRkt2MzNDL3RKSFVTaGsxVVA4ZmEwZ0U5dUFL?=
 =?utf-8?B?aVZSdzdUbjR1d2lqYkw4dTRSMTRUNGZ4VjJzckUrRWhmL1F5SUZCVFd0NXNu?=
 =?utf-8?B?NWFXTlNqdmJOZkg4WnQ4N3ZqUDE1bERySFZMdXlzY0M5U0FET1dreGVIdmk0?=
 =?utf-8?B?TkFNREZURmhodGRiR082UnpFTVE1RFFiMVpqbllXbkEyMksyY1pJQ0gzVVc0?=
 =?utf-8?B?NEVVNlBLK1ZGSE5EdmVNMFJzb2xYZWNTMy9SK1RxWU8wcm9HTld4TUdtVzRq?=
 =?utf-8?Q?at28MjpGZXjOltK0JSWPOYzrzLyOtgUKZgJuS9A?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eef8384-e0b5-4215-0ac0-08d95708e3b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 05:29:53.9476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JNxS4bLA6aF3d51vJicbss5+cSb7m2duGOlQPE7vXBkvcmh5ZQkdFgcskigMdZL+HstnnGhncPIaYt8Erve72c0wvbk6qmkEE2iNRfCA4uRXH7eqLYI0IWHxahSP0Kc0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4221
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxyaWNoLXNhbiBhZ2FpbiwNCg0KPiBGcm9tOiBZb3NoaWhpcm8gU2hpbW9kYSwgU2VudDog
VHVlc2RheSwgQXVndXN0IDMsIDIwMjEgODoxNyBQTQ0KPiANCj4gU28sIEknbGwgdGVzdCB0aGlz
IHBhdGNoIHdpdGggbXkgdGVzdCBlbnZpcm9ubWVudCB0b21vcnJvdy4NCg0KVW5mb3J0dW5hdGVs
eSwgdGhpcyBwYXRjaCBmYWlsZWQgb24gbW1jX3Rlc3QgZHJpdmVyLg0KSSdtIG5vdCBzdXJlLCBi
dXQgcGVyaGFwcyB3ZSBoYXZlIGEgcG90ZW50aWFsIGlzc3VlIG9uIHJ1bnRpbWUgUE0gd2l0aCBT
REhJIGRyaXZlcj8NCg0KPCBNeSBlbnZpcm9ubWVudCA+DQotIEgzIEVTMy4wIFNhbHZhdG9yLVhT
DQotIGtlcm5lbCB2NS4xNC1yYzINCi0gYnVpbGRyb290IHYyMDIwLjAyLjEwDQoNCjwgSG93IHRv
IHRlc3QgPg0KIyBtb3VudCAtdCBkZWJ1Z2ZzIG5vbmUgL3N5cy9rZXJuZWwvZGVidWcNCiMgLi9i
aW5kLnNoIG1tYzA6MDAwMQ0KIyAuL3Rlc3Quc2ggbW1jMCBtbWMwOzAwMDEgMzggMzgNCiMgLi90
ZXN0LnNoIG1tYzAgbW1jMDswMDAxIDM4IDM4DQoNCkNBVVRJT046IFRoZSBtbWNfdGVzdCBkcml2
ZXIgd2lsbCBvdmVyd3JpdGUgYW55IGRhdGEgb2YgdGhlIGRldmljZS4uDQoNCjwgUmVzdWx0cyA+
DQotIFdoZW4gSSB0ZXN0ZWQgb24gYW4gZU1NQywgdGhlIGlzc3VlIGhhcHBlbmVkLg0KLS0gQnV0
LCB3aGVuIEkgdGVzdGVkIG9uIGEgc2QgY2FyZCwgdGhlIGlzc3VlIGRpZG4ndCBoYXBwZW4uDQoN
Ci0gVGhlIG1tY190ZXN0IGZhaWxlZCBhZnRlciB0ZXN0IGNhc2UgMzguDQotLSBBZnRlciB0aGF0
LCBJIGNvdWxkIG5vdCByZWNvdmVyIHRoZSBkZXZpY2UgZXZlbiBpZiBJIGlzc3VlZCB0ZXN0IGNh
c2UgNDUoUmVzZXQpLg0KLS0gT25jZSB0aGUgdGVzdCBjYXNlIDM4IHdhcyBPSywgYnV0IGFmdGVy
IHRoYXQsIGFueSB0ZXN0IGNhc2UgZmFpbGVkLg0KDQotIFdoZW4gSSBjaGFuZ2VkIHRoZSBsYXRl
bmN5IHZhbHVlIHZpYSBzeXNmcyBhcyAxMDAsIHRoZSBpc3N1ZSBkaWRuJ3QgaGFwcGVuLg0KIyBl
Y2hvIDEwMCA+IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvZWUxNDAwMDAubW1jL3Bvd2VyL3Bt
X3Fvc19yZXN1bWVfbGF0ZW5jeV91cw0KDQo8IElzc3VlID4NCiMgLi90ZXN0LnNoIG1tYzAgbW1j
MDowMDAxIDM4IDM4DQpbICAgOTAuNjg4OTcxXSBtbWMwOiBTdGFydGluZyB0ZXN0cyBvZiBjYXJk
IG1tYzA6MDAwMS4uLg0KWyAgIDkwLjcxODcwM10gbW1jMDogVGVzdCBjYXNlIDM4LiBXcml0ZSBw
ZXJmb3JtYW5jZSB3aXRoIG5vbi1ibG9ja2luZyByZXEgNGsgdG8gNE1CLi4uDQpbICAgOTAuNzYy
MTI3XSBbbW1jX3Rlc3RfcndfbXVsdGlwbGVdIGVycm9yDQpbICAgOTAuNzcwOTY0XSBtbWMwOiBS
ZXN1bHQ6IEVSUk9SICgtODQpDQpbICAgOTAuNzc5NTUxXSBtbWMwOiBUZXN0cyBjb21wbGV0ZWQu
DQoNCjwgTXkgc2NyaXB0cyA+DQotLS0gYmluZC5zaCAtLS0NCiMhL2Jpbi9zaA0KaWYgWyAkIyAt
bmUgMiBdOyB0aGVuDQoJZWNobyAiW2Rldl0gW2JpbmQgb3IgdW5iaW5kXSINCgllY2hvICJkZXYg
bGlzdCAoZm9yIGJpbmQpIg0KCWxzIC1sYSAvc3lzL2J1cy9tbWMvZHJpdmVycy9tbWNibGsNCgll
Y2hvICJkZXYgbGlzdCAoZm9yIHVuYmluZCkiDQoJbHMgLWxhIC9zeXMvYnVzL21tYy9kcml2ZXJz
L21tY190ZXN0DQoJZXhpdA0KZmkNCg0KaWYgWyAkMiA9ICJiaW5kIiBdOyB0aGVuDQoJZWNobyAk
MSA+IC9zeXMvYnVzL21tYy9kcml2ZXJzL21tY2Jsay91bmJpbmQNCgllY2hvICQxID4gL3N5cy9i
dXMvbW1jL2RyaXZlcnMvbW1jX3Rlc3QvYmluZA0KZWxpZiBbICQyID0gInVuYmluZCIgXTsgdGhl
bg0KCWVjaG8gJDEgPiAvc3lzL2J1cy9tbWMvZHJpdmVycy9tbWNfdGVzdC91bmJpbmQNCgllY2hv
ICQxID4gL3N5cy9idXMvbW1jL2RyaXZlcnMvbW1jYmxrL2JpbmQNCmZpDQotLS0tLS0tLS0tLS0t
LS0NCg0KLS0tIHRlc3Quc2ggLS0tDQojIS9iaW4vc2gNCg0KaWYgWyAkIyAtbmUgNCBdOyB0aGVu
DQoJZWNobyAiW2RldiBiYXNlXSBbZGV2XSBbc3RhcnRdIFtlbmRdIg0KCWlmIFsgJCMgLWVxIDIg
XTsgdGhlbg0KCQllY2hvICJ0ZXN0bGlzdCINCgkJY2F0IC9zeXMva2VybmVsL2RlYnVnLyQxLyQy
L3Rlc3RsaXN0DQoJZmkNCglleGl0DQpmaQ0KDQpkZXZfYmFzZT0kMQ0KZGV2PSQyDQpzdGFydD0k
Mw0KZW5kPSQ0DQoNCmk9JHN0YXJ0DQp3aGlsZSBbICRpIC1sZSAkZW5kIF0gOyBkbw0KCWVjaG8g
JGkgPiAvc3lzL2tlcm5lbC9kZWJ1Zy8kZGV2X2Jhc2UvJGRldi90ZXN0DQoJc2xlZXAgMQ0KCWk9
YGV4cHIgJGkgKyAxYA0KZG9uZQ0KLS0tLS0tLS0tLS0tLS0tDQoNCkJlc3QgcmVnYXJkcywNCllv
c2hpaGlybyBTaGltb2RhDQoNCg==
