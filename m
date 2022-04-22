Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE7150B0B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 08:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444460AbiDVGlF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 02:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444418AbiDVGlE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 02:41:04 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9103FD9F;
        Thu, 21 Apr 2022 23:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6eC34CfcIXZV1LQc9Yf8aOm48LV2rMbezGXRJo51/mCUuk0sH4Vp7fWXttkVQPBF0bfzyFxUUaYXNZatB1VLM3lk3+NdQVoPk2V8kKYpZ+avEpKnau8IU9rg3ijs/HRoRo7z1xOu6s0O4X5UBWUYZJHKww5waNaW00IiHrvA1Bf0qJV866MfCqEC2xe/XDw2UFVma1n1dZXOEFsX06Z7xTSCs/GdCVWzEeA8dgMENUcSboY2wDVEEzLsWZRvhnxm8sC0+QnUTfJi11KLfNx1nOvYrk+o24pws+h0joGvTlsPyNRro2Ql5R9Lk7cIvg7k82fEoaOH23bCP6iXvurpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+P3Xru1bjknVU6d73rWkyyKSbknUOzWQGQc6+fXoUFc=;
 b=WEP+3S26lZMgVJj6725PVoO69N1Epu65sHYi8/FzVfaIwjHCLSmqkDZ1irkzACAMTKO5Te62IBtWnKIDbFG8dgLfo/5ujT2h2e7KYp0RFwLxefneaUUWNULYITHgaRN+n9P5TtX766YDZuXxoMbi/4MsKwI31XISdOF/iGjqox2kMuAJ1CTF/t6MB4gXt1OW1lzLtXEx0+1WSyLwlIRmdvB/lQZKanuD20O2cZQoIsKXjSCZD9SWSugnWyKkepbXQlN7Dyh/8Ci/8bpq6bZK0VajWoKbxRsNWQ5ELPMX6Co88/VFRPtAOxqOeiHF+otLnvRp23kj1H+Gr1HfiKkeTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+P3Xru1bjknVU6d73rWkyyKSbknUOzWQGQc6+fXoUFc=;
 b=RKssP13ARzVsncsqZssTlXhTn881dcyvDRBMjjKRotRfd04jg4SC0U/8YCZn3HALoregOClpY/i3ZQ8OxmcxKWH6DCtPLwJTVBSL1Z4VMwTDXnBY+ydlS3pbNZXY0H/7e1fi6r20UyXmlrUxEdCSSSJeY9strqhn5QjansRnJJk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB7219.jpnprd01.prod.outlook.com
 (2603:1096:400:f0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 06:38:09 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%9]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 06:38:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH 12/15] clk: renesas: rcar-gen4: Add CLK_TYPE_GEN4_PLL4
Thread-Topic: [PATCH 12/15] clk: renesas: rcar-gen4: Add CLK_TYPE_GEN4_PLL4
Thread-Index: AQHYVJKk7Eepwr6CTk2d/zas10xUmKz6Y5OAgAEZ/QA=
Date:   Fri, 22 Apr 2022 06:38:09 +0000
Message-ID: <TYBPR01MB534101335CC81CC959E3B118D8F79@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-13-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXdgvcf0w06GaaSZSqdEwytKi+tNXpsUb29vXmKrB=gYA@mail.gmail.com>
In-Reply-To: <CAMuHMdXdgvcf0w06GaaSZSqdEwytKi+tNXpsUb29vXmKrB=gYA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b4b6d65-aa85-4b4f-b1bb-08da242aaa58
x-ms-traffictypediagnostic: TYCPR01MB7219:EE_
x-microsoft-antispam-prvs: <TYCPR01MB721991ADAD774632EF33043AD8F79@TYCPR01MB7219.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LBHbNPuoYf6zab6inwdaAoB8bT21MJPjj/q1SukSqYiJ99H36wuoyE80QOZIH8ljIxYTkoV9XEZaPqh+DApSSKUBqSv8DWjdA0AEQN3KgDP646A9/f1WiOnyiMSjT97weH5R23J6v5vLvCYy8ubWK11orPBRchuIiIQ0SccNVr+W1oDMCKCpihq4QpNk0394VOK2KMQq/Ssb8EoRAR/NulZeju/O6rObVsEbROegnc8vgueSISQhpQLanPxRMLTXLyUqUrwxBc/PTwxQpyJkyaSeHN2D4g6DXBjDdxGSMBrTo11HoAFq/XKvPoUoFyQkjE+jUxqOH6Vx2gcqW69ZUS/wKyngl6/XHhNVC8R7pWCkarDMfTifoWSqNAyIMmqpHqjxkMcteBbqo/cJJMkzFvAXFsm2VESiP+LLfuoQYCTKyDCJlEglfnHVXS4hjRxc+/W/jFo4dB0ueo8k6ypGE1uZoShAY/WuLI7W7DxI3UitobuZBEg3IzkxJRwStJ2my582XzpVZQk8OW60dLxNuekQYd7lFx/nT1zkkhsA2psIeNgYkrgk4e5b7xmvGJe93mx4oRR+IW7UohKpOybFH5dueHcGj3+w/W+pmhzQXpSJlJEPrMrI8S/Hoj3Qj/9o4iFk+sF27nGqTt9czN0hHnffoeCs1vAXk9Ubt4068hkihNPByk8TuYAtNPN23T/9MDGqChKSTCzWuvjGYn5zjw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(55016003)(186003)(122000001)(54906003)(316002)(6916009)(86362001)(83380400001)(38070700005)(38100700002)(52536014)(33656002)(6506007)(9686003)(7696005)(2906002)(53546011)(5660300002)(66556008)(76116006)(66946007)(8676002)(8936002)(66446008)(66476007)(71200400001)(4326008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SktaZUg0RW9hUUxFeHhQakZlZXZVSTJVQm5BKy9oNWFSREFSQlQvOFRqTFRF?=
 =?utf-8?B?RWFIOUpWV1NzamZ3cVVyc0RrbjQ4MzkrekxuRDZaelNvZzkrem5kVmFQWFNT?=
 =?utf-8?B?cERHL2RvVGxhaDNTVVRmVDFwNlBvVVV3Y1NRSWlDNnFDeVd2Yjl2Rnd0OE1j?=
 =?utf-8?B?VUlxejFCNXdnZlhqeCtzSkdQOTJscjlab2xjbk8vMmY1aXF1T3huWmJwSGZK?=
 =?utf-8?B?SDc1bERWQVVpSlZaZ2hYc1B4QXBsNG5NZVBIK0tvWXBxMFVHRDFPeTZ4MEgv?=
 =?utf-8?B?cS9qd0RqSis1bTNnZko2TjMrb0liUjhoeDdOWlM3cDlXWitUOHJMRFpnQU9B?=
 =?utf-8?B?Q2tYOHVKVnJnOXVvdXpnOVpTTUxwOC9ZbW10c0VDWVNJVU51aHIrQUFwLzJT?=
 =?utf-8?B?dXUvZTQyRk5MTnhSNmhYaUViRjRhbUtFY1JYL3hzTjhLeko1anlkMEtTUEtF?=
 =?utf-8?B?enRORjVGTFlUQzFTNjl3L0piTkZIK0Raak9zQ3QvU1pKSDdwYnFCM2dEN1Z1?=
 =?utf-8?B?eWxmeUJWdEJvQ1VUQjcreXZFMk5hL1ArSUlzVVEyUjVTeWp5SVhrSHJkYUlX?=
 =?utf-8?B?TTYrbnpvKzBSK2twcXFvYmRaSm05WmpnTUlBaE53SDZFZ2h4Nk42WURIZWpY?=
 =?utf-8?B?bjhoYUl5N0VoOE1BVVFUQi9kcWF3ZDl3OEtUK2JSMWZDdW9qMFFidWpqQ0x1?=
 =?utf-8?B?a2UyaDNIbTN2cmVLSDNxamVYcDV0bXRtVHprVjdOdjlxTktEc3VSbVF5Uk9Z?=
 =?utf-8?B?TmxkMElBYzZncnV5dzlLWVlXa202ZktIRE9ZdGpsZnc1U3UrSVJtZ1BwWUVh?=
 =?utf-8?B?ZnY4SC80a1FjUkhkTGdHcmEzeW1nckYvamd6dm5JbFV4WWRGeTFPMzAraWJy?=
 =?utf-8?B?QTBHdFlzWVM1RkN1VUwwRVVWcVRZMlRJS3ZMWGQxazBaeEsrdUMyM1ZNdkRY?=
 =?utf-8?B?MThtdm1SRUhYRjZPUFJ0TWRMWTNLNFhrUVd0emJxVk5kemlHZGZncWVrMUtM?=
 =?utf-8?B?RDdyWnJTVkNUZGdCOS9oZ3ZOOSsxMnBNemJPcGk0M3pJVlM1RDlNL3hDZVI1?=
 =?utf-8?B?UnJ6czdWak5kNElMWHJjTDV4RXlJSldndU5RY2JPbEM3VlRQcldSQ1JQT2Rz?=
 =?utf-8?B?b3ZhOVNxL204ZVlVUWZ1WDgzRjdOMk1rRncxOURYKzNsL2JnVkFQeXhBdDdq?=
 =?utf-8?B?ZzlrbjNJdmlMT3E0c2U3VmRDL3VneXlZSmVZMzl3SW53c21rd251SlZ1ZEF6?=
 =?utf-8?B?bXhhRXZ5YldYeTZPQzZFbll4SnVRYlhxVFN1dnZZWXJBcmlaRlMrTDVHQk5Q?=
 =?utf-8?B?VitQZnRmcXA3MUxHUUFZTXBuNUZ5NXIycVVabXJ6QTM5cHp6aVVQbVJ0RDBh?=
 =?utf-8?B?QVpqSjBhdWpKTXQ1SHNvdEFmNVFoTGJCQVNqdlYzQmVSTG9HOU85ZnJwOGRF?=
 =?utf-8?B?ZERZU1BtVkpUd21JaUVjYkdOVXVwYjFBcTlEaTc3bXdLYUFmWm1ockRmc3RZ?=
 =?utf-8?B?YjlXK3paTXZxRG5xdlBaak5pdDVpczlHaEpzbkRGMVN6SUVGSHVSNnJQclFF?=
 =?utf-8?B?am5sOXBsQUd1bXdiTm5HSC90NkZ1cEpFOE15bytTb01rQ1ZXa3dwVms2T3hR?=
 =?utf-8?B?OGRWRkdrdTlxYVN4K0VPalVUSGt3QS83UkhFd2g3b3R3ZXpNYmx4N0V0cHV4?=
 =?utf-8?B?TGswanROcmtHcnFJSGZqQ2tzZTRwbWRGWFZlQVNyN3NsbHJXT2NXWngwcjFq?=
 =?utf-8?B?ck5GbUU3bk1DeTB3TjVhYVArbUpFUmJWNW1xLzNsTW91OENwMTdHWFZuUmdw?=
 =?utf-8?B?UGdZaVlVZFJIaGlObGZDV1I1L05EN1IyY2Z2V0RwVXBDZWRWMkdsVDB3WGIx?=
 =?utf-8?B?dDVkNFlFb1FTWUhIMGlXQjVDckQrYnZGaUdNSVVNSTFpR0tYbU5VcTdUY2dE?=
 =?utf-8?B?S0ZTU1c4TUlya2t6VXJzRUM0RGFvMjZDQ1NvMGZ3UGtkRUNGSmc3d0dkUkdV?=
 =?utf-8?B?b1NTdTRaYjRmM3crQUpvdjdPemtEMkZmcE9LSVYyWW5URllKZCsxd2c0TUk2?=
 =?utf-8?B?djNyZDBWTk5oZUR3N3QvcXZicEZTcFJDMkliQkFvR3FSSkgzeFVScGoyMHRP?=
 =?utf-8?B?OWE2MzZZK0Q3RFhlN1FMVVBNZ2xDc0xkeHEzcWY5RUZ4UmF0UDB6UUxLRXh1?=
 =?utf-8?B?c1VIS1U2OTdXZDdxZzIyRUVHTENXV1JRZUMrd2d0ckhPcGxqS2FRM0U4ajhG?=
 =?utf-8?B?L0ZUd3ZJeEwxaXdXZ3dBVHlBY3ZJU2NlMUFDKzFUWHZ1dnBZN2Y5UHJ0dUEy?=
 =?utf-8?B?L1M3Q3ZEUExvMUl4MCt1MDFqbDlpWG5XeHZoQTVVZGJ2dCtreTFmZGNtWnVP?=
 =?utf-8?Q?njvPH9XhV1qDRNzld0FmdCfAAluHa6GFaGN9V94r2Yqm8?=
x-ms-exchange-antispam-messagedata-1: vEd9yNWqVY+5NsMf389AU3zAQuYapRMxqQM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4b6d65-aa85-4b4f-b1bb-08da242aaa58
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 06:38:09.0887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Znsup5Cm40vw8piK/18SZsqa1s92HKQBCuT3it9IuQHHoLCvxG1Yt2g7RkM90cdeV8efikOCQj2K26ZB+ZATzEow+HRzMGCQPwPr5P2MyZ5fqBpwTiPLWWlPw9Da2dzM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7219
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNkYXksIEFwcmlsIDIxLCAyMDIyIDEwOjQ4IFBN
DQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIFdlZCwgQXByIDIwLCAyMDIyIGF0IDEw
OjQzIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2Fz
LmNvbT4gd3JvdGU6DQo+ID4gUi1DYXIgVjRIIChyOGE3NzlnMCkgaGFzIFBMTDQgc28gdGhhdCBh
ZGQgQ0xLX1RZUEVfR0VONF9QTEw0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJv
IFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtz
IGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9jbGsvcmVuZXNhcy9y
OGE3NzlmMC1jcGctbXNzci5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tDQo+ID4gIGRyaXZlcnMv
Y2xrL3JlbmVzYXMvcmNhci1nZW40LWNwZy5jICAgICB8ICA1ICsrKysrDQo+ID4gIGRyaXZlcnMv
Y2xrL3JlbmVzYXMvcmNhci1nZW40LWNwZy5oICAgICB8ICAzICsrKw0KPiA+ICAzIGZpbGVzIGNo
YW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+IA0KPiBZb3UgZm9yZ290
IHRvIHVwZGF0ZSBkcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OWEwLWNwZy1tc3NyLmMuDQoNCkkg
Y29tcGxldGVseSBmb3Jnb3QgaXQuIEknbGwgZml4IGl0Lg0KDQo+IEhlbmNlIGFsbCBjbG9ja3Mg
ZGVyaXZlZCBmcm9tIFBMTDUgaGF2ZSBhIHplcm8gcmF0ZSwgY2F1c2luZyB0aGUNCj4gU0RISSBk
cml2ZXIgdG8gZW50ZXIgYW4gaW5maW5pdGUgbG9vcCBpbiByZW5lc2FzX3NkaGlfc2V0X2Nsb2Nr
KCkNCj4gKGNsb2NrID0gMCk6DQo+IA0KPiAgICAgICAgIGZvciAoY2xrID0gMHg4MDAwMDA4MDsg
bmV3X2Nsb2NrID49IChjbG9jayA8PCAxKTsgY2xrID4+PSAxKQ0KPiAgICAgICAgICAgICAgICAg
Y2xvY2sgPDw9IDE7DQo+IA0KPiBBZGRpbmcgdGhlIG1pc3NpbmcgUExMNCBtdWwvZGl2IGNvbHVt
bnMgZml4ZXMgdGhhdC4NCg0KSSBnb3QgaXQuDQoNCj4gVGhlIHJlc3QgTEdUTS4NCg0KVGhhbmsg
eW91IGZvciB5b3VyIHJldmlldyENCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGEN
Cg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
