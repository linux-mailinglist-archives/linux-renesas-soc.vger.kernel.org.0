Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19D506488C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Dec 2022 20:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiLITEI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Dec 2022 14:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiLITEG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 14:04:06 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F64DED0
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Dec 2022 11:04:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIbCyLEZEeA5XvJnsvJU/qOY5o5SvR//hGfgnjSNYXZ4I07BBOl4R+uQKWGLJtda63JlrFJ7mMMCSB1u2G3di1N+5Qi31nd5+/FKuluz+l7PaG79ZGKOBuxFpUi0pNb721Y4E3spchQmNmCKSo0IKWHxy3vdOuoGSXJHsFSB0OTON6M+CI1HOyWSTADR16RA1u79cg7lRYQiA7Ti6+PPZ3Dz5NrIINuybWFGonFAJB2k3Hl9rtwLV5SKxN2tSfGb/jVVEK1T7ISvcDN9Bj8y6hUfRrUfGxFqHZiAUBo1dNAOzrL/h46D1c0JeSOS9aIv3ps/D4FgXVDT1r+D5ucI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gavy1OjovdBp2rAGq4WJZCBPVkKwoatbOmfOm+x4lgM=;
 b=l6LBfXsAz1hxnQQonSwwhO4807L8hCpFECKeXDcGv50r5YKAAFT/UlbPsjRVMCdOu/53PzshyiNEAgJZyAbuvqsHCt200wsQlgB32Xq+4lGiWI9zP8WH1EWZUeab5vnjRa/JuT5L1yxKVkJ5pm/AIGPSjf5tW+xxdkP+Vr3oe2KNnclCsYXqOhSu+zu7Uj89JnFfXmSMADhsy72lCZNlKbWrNT0uSEWtydkLadDbXbjIGePGMIsn0m9xK+HlNrWsPNJiw91ma+P+72sDfWqU4BrF/tpk79R6Gzs66oeLuf9Lux0TS21my71/EIz85JfaODJtIiQCOxpc2MwhnYkjxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gavy1OjovdBp2rAGq4WJZCBPVkKwoatbOmfOm+x4lgM=;
 b=B+78Mph5Pq0GLz6u3wTLFxyInetRFRbQp6wuugfk23uXIjhM/iaCzD1ICNi3dffdHN228jj6fwu0FKQqQqrNPpGgHeCG3Djza2d3tEgjRV2981/9+pSpHDQltaLf8hyhKq23cg9fHrFIzhbenSuzEnBl8c/3/YDOd3516EEQs0c=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6279.jpnprd01.prod.outlook.com (2603:1096:604:f7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18; Fri, 9 Dec
 2022 19:04:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5880.019; Fri, 9 Dec 2022
 19:04:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v7 2/5] clocksource/drivers: Add Renesas RZ/G2L MTU3a core
 driver
Thread-Topic: [PATCH v7 2/5] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Thread-Index: AQHZACZEB1AhLVGJ/U+sVbDeZHKJA65ZNimAgAzLBVA=
Date:   Fri, 9 Dec 2022 19:04:02 +0000
Message-ID: <OS0PR01MB592248896A829F1C3E325DD5861C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221124170018.3150687-1-biju.das.jz@bp.renesas.com>
 <20221124170018.3150687-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWhHvb__B2aRg8FOjhiAyLT=x3Fyki4RpFX15K-y=re1w@mail.gmail.com>
In-Reply-To: <CAMuHMdWhHvb__B2aRg8FOjhiAyLT=x3Fyki4RpFX15K-y=re1w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB6279:EE_
x-ms-office365-filtering-correlation-id: a5f51907-f8dc-4bd8-0254-08dada1822f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rh3K95THPpiWEB9exm4DnVn9zQSkVBb8vQSzmD+dsWrc1GAZ8ZbfIjLtrEgqzdVOZOp/ikbCZqpp+1SWB2MtNjwtsNEm3iqdF0Ps30GGuJkrBzspTkl2n3T4hICHYldUSkXpHLUWXdojvR4Ng9P4dHQnGhAn7iu5FHHRWEhCNSOtndX6zkaspEbMB381dsBY2tUHHSDCaKYqgbVbYMbCd2aOf8SKqfB6/c9oE2BsbX/y924VHO1ULiJVNQaywWJ6bHB7PtRU+E6t138ztDX02c04VCemQyCJr+gtYX5JJpq7x2sHctVmhHTl2VjXo0r02S+hQFjq0f0eKJETLL2DLwYQMKlBJT9BUUkJ+YTzKFWJcVqr+0yhSI5jW3hnQXXZY21jaVE9V19RW5+Tr+ftDyzklktVmewa4qnwMlT9MSHDPOKYF3uqDyOzMw69rI+pM6RQq5HWYyojUpcnKsoqkPEodHLLnCHIYxMIT63UDxC2nrkqRJpy5h+kwpCWwQBzW3PsyRRKoBK0WuQAcUOXcZCRGGwwtr1UJpNQApgrSab8iCMaEULakLh5cQtOXWvLlnTubHnYYzpzfUIuA6Uh2hlO5PGKM/s3hFvH7D0QcpNqVlWEI6zm0Z2H161edJlN2sK5cHVznVkvbkGh96a1JBVqCdvpvHYTTTHcwXifgPisKspPeI4gkSDEOFrqU3hT3/KNsUXU04OAhf5ZS5RYldYKcw9KTpgekKAbX9GQTr8f5Nyp4bSRjEYxg94NQoZr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(2906002)(86362001)(5660300002)(41300700001)(83380400001)(38070700005)(52536014)(8936002)(55016003)(8676002)(66446008)(66556008)(64756008)(38100700002)(76116006)(4326008)(66946007)(33656002)(54906003)(6916009)(316002)(66476007)(478600001)(6506007)(7696005)(53546011)(186003)(26005)(9686003)(122000001)(71200400001)(32563001)(309714004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MExJSHJBYXNwUXkyVnVLZHZjZE42QTBkMHhZK3VFL2pFNHp5V0REOFYvV3Fl?=
 =?utf-8?B?T0psTTNmeXJ5UGdUd1JhcGhZbHVpODNTTXZ4M0xYSFVWZWgzT3NlU05TTEt0?=
 =?utf-8?B?cUpxUDdXNGF3SUJHR2JOTVlqcmRLWTdKbzExbEp2aGNGOXR1MlBlWmd0K2Qy?=
 =?utf-8?B?aUh2dnkzOURJaTJTTGFDOEZUbkw3MUJYekV4OTNYcG1EV2ZqUUd4Z3pvV2Nh?=
 =?utf-8?B?MzBiUVlnS3lSRTJRRnFPS2RHc215VzZBTWlVZ1lqY1NNOFVKZDRzeWRjbkEv?=
 =?utf-8?B?M1NGdllXSW1VSGxBRVlvb3o0eUJtOEFLajJsNWg4TmFJNXo5K2gzRk9obE5h?=
 =?utf-8?B?ejRicFFPU1lUTmhudWdoUWFXSFQySlZVNnA2ZzNrQmcwdlBUK0JTY3Nld0hn?=
 =?utf-8?B?cHlGOUFZd0N5TTRBWTVkUmYyV1BPLzU0Q0d1R3BYR2tIZDZkSUQyVG82RkFQ?=
 =?utf-8?B?Mm4zeEdJK1FkOFgzMU5LaWxnRXpoSisrZUJGbmpOWDNUeXp6Mkpac1pPNUZU?=
 =?utf-8?B?TG54dEFNNlpsVUVELzMyUjErT2RGRUUvWkY4YmFPUmhxRXJjY08vWEZpMjJ4?=
 =?utf-8?B?VG9GTzJqOFMzTzVmZ08vVEZkVnhka08rNTIvN3Y0a0lERHhQUVFxYnlsazRX?=
 =?utf-8?B?aTFJb2ZmODY0SGtFR1JiVHByT2t6SEZTNktWY2gyRnVPcFhPK2xObmo3c3Js?=
 =?utf-8?B?K2MxNk5mUG1qekwyQVV6aTdQangzVzhmL21wbmY4Z2pKS0dVZlNsQTVkNWFD?=
 =?utf-8?B?M1pLanhacS81VXBMb2ZWZVlneW12R3BPSDZCejIwakk4NzhjOGVjTVR0SGVk?=
 =?utf-8?B?QkVDckNQVVNGKzhvQWd6NkU0aDduVjVkYlBWRU9kQlZ0M09YN29BeXQrSjNV?=
 =?utf-8?B?TlE5MTZ3dnRnOGhMWVQxaUlyL0tybndDUE9VWDcxNWpXbUdSUm9aeGRkODc5?=
 =?utf-8?B?QkFZcTNUUnBVT1orYmx6ZDN1MU81MGNITFpMbkdRY0Q1a1JmM2t0SUpDekYx?=
 =?utf-8?B?NE5Tb3pPTERVQTNGRWtXSjZxdlY4WTlKQWUvOXV0R2ZLaHByV1F2dy9mc0dB?=
 =?utf-8?B?dWdUa2Y0ZzViYUpXOEpiOFFldzJadmY5c0kvOHVXWGV5NEJRVzZVblNpa240?=
 =?utf-8?B?VDAvbHNtYktvdnBKSmFmTzZjRk4vbXI4b0FHV0ZQM1lUZUh1QWZjMTBVYmdG?=
 =?utf-8?B?bGs4UTQ4cVZyZ0NTYzU5OHlQejBXRmluMXJLTlZHMzlaenB1ZnJReTUyTnBU?=
 =?utf-8?B?bm4yajcyV1VVTnNoRFR4UmdQVFM1b1ZOUzRxaHBmMkhkSnB3V294ajIvRDR6?=
 =?utf-8?B?YTY5TWdYUWl2Z0FadXVLczN0dERrb014Mks3NDFSaDU5cGk2VVVaZGJ3SWpU?=
 =?utf-8?B?SzFGSjBqVzZpNVdhMWNwVmFOSzNLcDBPMW9SbHJBQk1DWmUwWGM5SXJ6ejds?=
 =?utf-8?B?RHBVY0cya3BVWWV1b2h1OVl3TWEyak43QXVTT1RLMGt6VmhYaE1DdjNJa2Vp?=
 =?utf-8?B?SytnaGIzTHY0eEpBdC9uazgza2crUWUvWmQ3WFRVRDB5bEx2QkZpczdYR1RC?=
 =?utf-8?B?a0xXcHhtbjVNQ2Q0cDlCQ25aL0tIOXRpRDdoczRWcWhhWHVEL3dXMGE4ZWxO?=
 =?utf-8?B?N2ZvMThJbE5VV2p0dDd1NFE0UUozRFg1MzNZN2wwSzJjOUJnVHZiZG85bzlK?=
 =?utf-8?B?UHh1WVFQeVlpcmJXZlBMakc5ejZhVUxINklXaldGZmpQWjJXaFhNNzVpb0tl?=
 =?utf-8?B?NzhROXJrYlhlcUF5RVFjaDI4S1k1dmJrNUpwSzFSZUw3YS9aY1V0NmlKczRI?=
 =?utf-8?B?ZHBMUEk2ZC9FazdpN0VOQ3BpcFo5ekJqZnVCcWhKNTBqYUdnWlBFMm5KRnZH?=
 =?utf-8?B?U1l3SGp1eGV6SEo1OVRRRmxhNTJQNGZ2REc2T2FZL21PbjJub0FyRTExYUI5?=
 =?utf-8?B?dWh1WG9DNWltaG9TVmtzTkYrWHd5S2xMTVlqSlJLcHBtaHJ3NHBBYmlqMU9w?=
 =?utf-8?B?NVRJQ2F3VHhSaS9ZdVNEbUlMak9SSHprbGpydmNHamdNcTh6MVR0WTA3ZDJ2?=
 =?utf-8?B?MWU2d1dUSlo3cGlPY21tNjVCR0Rpb1JrUjZMKzY4bU9WczBKU3Q4WTRRUjVC?=
 =?utf-8?B?RkVTNGIxbkd4ZXJxUURVY3VZSVFjNmtDZ05KV0ZaL3Uzdy9TSC9PVVNWdUV2?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f51907-f8dc-4bd8-0254-08dada1822f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 19:04:02.6340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Uf54sBNMIPkZ3Vw9Hi8YnZFSOvY5e5gGWsE/q1OkhefQgruwL/wkvD9ujomakhiQ4Dl5FXjkKzQ0yaFZoUX2nVgJYnENaphlzxNOiAJzmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6279
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjcgMi81XSBjbG9ja3NvdXJjZS9kcml2ZXJzOiBBZGQgUmVuZXNhcyBSWi9HMkwgTVRV
M2ENCj4gY29yZSBkcml2ZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIE5vdiAyNCwg
MjAyMiBhdCA2OjAwIFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
d3JvdGU6DQo+ID4gVGhlIFJaL0cyTCBtdWx0aS1mdW5jdGlvbiB0aW1lciBwdWxzZSB1bml0IDMg
KE1UVTNhKSBpcyBlbWJlZGRlZCBpbg0KPiA+IHRoZSBSZW5lc2FzIFJaL0cyTCBmYW1pbHkgU29D
cy4gSXQgY29uc2lzdHMgb2YgZWlnaHQgMTYtYml0IHRpbWVyDQo+ID4gY2hhbm5lbHMgYW5kIG9u
ZSAzMi1iaXQgdGltZXIgY2hhbm5lbC4gSXQgc3VwcG9ydHMgdGhlIGZvbGxvd2luZw0KPiA+IGZ1
bmN0aW9ucw0KPiA+ICAtIENvdW50ZXINCj4gPiAgLSBUaW1lcg0KPiA+ICAtIFBXTQ0KPiA+DQo+
ID4gVGhlIDgvMTYvMzIgYml0IHJlZ2lzdGVycyBhcmUgbWl4ZWQgaW4gZWFjaCBjaGFubmVsLg0K
PiA+DQo+ID4gQWRkIE1UVTNhIGNvcmUgZHJpdmVyIGZvciBSWi9HMkwgU29DLiBUaGUgY29yZSBk
cml2ZXIgc2hhcmVzIHRoZSBjbGsNCj4gPiBhbmQgY2hhbm5lbCByZWdpc3RlciBhY2Nlc3MgZm9y
IHRoZSBvdGhlciBjaGlsZCBkZXZpY2VzIGxpa2UgQ291bnRlciwNCj4gPiBQV00sIENsb2NrIFNv
dXJjZSwgYW5kIENsb2NrIGV2ZW50Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHY2LT52NzoNCj4gPiAg
KiBBZGRlZCBjaGFubmVsIHNwZWNpZmljIG11dGV4IHRvIGF2b2lkIHJhY2VzIGJldHdlZW4gY2hp
bGQgZGV2aWNlcw0KPiA+ICAgIChmb3IgZWc6IHB3bSBhbmQgY291bnRlcikNCj4gPiAgKiBBZGRl
ZCByel9tdHUzX3NoYXJlZF9yZWdfdXBkYXRlX2JpdCgpIHRvIHVwZGF0ZSBiaXQuDQo+IA0KPiBU
aGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9k
cml2ZXJzL2Nsb2Nrc291cmNlL3J6LW10dTMuYw0KPiANCj4gPiArdm9pZCByel9tdHUzX3NoYXJl
ZF9yZWdfdXBkYXRlX2JpdChzdHJ1Y3QgcnpfbXR1M19jaGFubmVsICpjaCwgdTE2IG9mZiwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUxNiBwb3MsIHU4IHZhbCkgew0K
PiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyB0bWRyOw0KPiA+ICsNCj4gPiArICAgICAgIHRtZHIg
PSByel9tdHUzX3NoYXJlZF9yZWdfcmVhZChjaCwgb2ZmKTsNCj4gPiArICAgICAgIF9fYXNzaWdu
X2JpdChwb3MsICZ0bWRyLCAhIXZhbCk7DQo+ID4gKyAgICAgICByel9tdHUzX3NoYXJlZF9yZWdf
d3JpdGUoY2gsIG9mZiwgdG1kcik7DQo+IA0KPiBBcyB0aGlzIGlzIFJNVyBvbiBhIHNoYXJlZCBy
ZWdpc3RlciwgcHJvYmFibHkgdGhpcyBuZWVkcyBsb2NraW5nLCBoZXJlIG9yDQo+IGluIHRoZSBj
YWxsZXJzPw0KDQpPSyB3aWxsIGFkZCBsb2NraW5nIGhlcmUuDQoNCj4gDQo+ID4gK30NCj4gPiAr
RVhQT1JUX1NZTUJPTF9HUEwocnpfbXR1M19zaGFyZWRfcmVnX3VwZGF0ZV9iaXQpOw0KPiANCj4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVkZS9jbG9ja3NvdXJjZS9yei1tdHUzLmgN
Cj4gDQo+ID4gK2VudW0gcnpfbXR1M19mdW5jdGlvbnMgew0KPiA+ICsgICAgICAgUlpfTVRVM19O
T1JNQUwsDQo+IA0KPiBJSVJDLCB0aGlzIHN0YXRlIG1lYW5zIHRoZSBjaGFubmVsIGlzIGlkbGU/
DQo+IFJaX01UVTNfSURMRT8NCj4gDQo+ID4gKyAgICAgICBSWl9NVFUzXzE2QklUX1BIQVNFX0NP
VU5USU5HLA0KPiA+ICsgICAgICAgUlpfTVRVM18zMkJJVF9QSEFTRV9DT1VOVElORywNCj4gPiAr
ICAgICAgIFJaX01UVTNfUFdNX01PREVfMSwNCj4gDQo+IERvIHlvdSBuZWVkIHRvIGtub3cgdGhl
IGFjdHVhbCBmdW5jdGlvbiwgb3IgaXMgaXQgc3VmZmljaWVudCB0byBqdXN0IGtub3cNCj4gaWYg
dGhlIGNoYW5uZWwgaXMgYnVzeT8gLi4uDQoNCkFjdHVhbGx5IG5vdCByZXF1aXJlZC4gQ2hhbm5l
bCBidXN5IGlzIGVub3VnaC4NCg0KPiANCj4gPiArfTsNCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsg
KiBzdHJ1Y3QgcnpfbXR1M19jaGFubmVsIC0gTVRVMyBjaGFubmVsIHByaXZhdGUgZGF0YQ0KPiA+
ICsgKg0KPiA+ICsgKiBAZGV2OiBkZXZpY2UgaGFuZGxlDQo+ID4gKyAqIEBpbmRleDogY2hhbm5l
bCBpbmRleA0KPiA+ICsgKiBAYmFzZTogY2hhbm5lbCBiYXNlIGFkZHJlc3MNCj4gPiArICogQGxv
Y2s6IExvY2sgdG8gcHJvdGVjdCBjaGFubmVsIGZ1bmN0aW9uDQo+ID4gKyAqIEBmdW5jdGlvbjog
Y2hhbm5lbCBmdW5jdGlvbg0KPiA+ICsgKi8NCj4gPiArc3RydWN0IHJ6X210dTNfY2hhbm5lbCB7
DQo+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ID4gKyAgICAgICB1bnNpZ25lZCBp
bnQgaW5kZXg7DQo+ID4gKyAgICAgICB2b2lkIF9faW9tZW0gKmJhc2U7DQo+ID4gKyAgICAgICBz
dHJ1Y3QgbXV0ZXggbG9jazsgLyogUHJvdGVjdCBjaGFubmVsIGZ1bmN0aW9uICovDQo+ID4gKyAg
ICAgICBlbnVtIHJ6X210dTNfZnVuY3Rpb25zIGZ1bmN0aW9uOw0KPiANCj4gLi4uIHNvIHBlcmhh
cHMgYSBzaW1wbGUgYnVzeSBmbGFnIGlzIHN1ZmZpY2llbnQ/DQo+IA0KPiBSZWdhcmRsZXNzLCB0
byBhdm9pZCByZXBsaWNhdGluZyB0aGUgY2hhbm5lbCBmdW5jdGlvbiBpbiBldmVyeSBzdWJkcml2
ZXIsDQo+IEkgd291bGQgYWRkIGEgc2ltcGxlIEFQSSAoY2FuIGJlIGlubGluZSkgdG8gcmVxdWVz
dCBhbmQgcmVsZWFzZSBhIGNoYW5uZWwuDQoNCkFncmVlZCwgaXQgd2lsbCBzaW1wbGlmaWVzIGEg
bG90Lg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gK307DQo+IA0KPiBHcntvZXRqZSxlZXRp
bmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9u
cyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMNCg==
