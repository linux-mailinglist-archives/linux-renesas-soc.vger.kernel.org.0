Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A30B4DDA6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236649AbiCRN0Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiCRN0U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:26:20 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2092.outbound.protection.outlook.com [40.107.114.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533E0EDF3D;
        Fri, 18 Mar 2022 06:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kixh6mWonH8UCdrfe4XlpRwLHFeCRqapl9wO06klfe7SO2cNtsx0SOAFB93sqXMZqzngkbmxoUzso0DdlWdrfeCLxUsTMI0Lp/eeauGEV4fz9SSCZqbj8NIsYM4o4Wj26U8hl9HEfMPPvJPD3Q6wPtBBg38c5EQhEI8ImORP4Id8goLe2G066TTVXpAfqE6FKAQ8EwbP6fRzAhmJp1l7nVUGKXBwrvvqotngPihdhQtVVYa3W1GxU0UVPM7+b05GttwIwSAAInhUKgG66xIc3i9DfeD1aC2+u4i9GhXLIDcKLkCduNDdJbqQ+/2JMt9odRmc4rOQ8wq1NyuhXAn6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPnUdNCjhg9xdCOmquQR0HfuANPBfa2bWQmFu6IhjhE=;
 b=g0sx9QfOhiVUad8PWdaug9OsUDQ5v7XeyXjicGmcInfh3dCTIB5cE2D+cLDei2TuBlEA2omiO3Q0trLSdlCHrMit/oRHBX+AhQpbQY1zZQALCPpsD0T3zD3oHP630HiKV5ZqN14CqQUDS0NX+Sr0K5pZvqfk2XclKXqxh7ZGlARQ+2khOUYhkSL0sE7OuP5ou+iMBJKgUAHdx7cqChw6jjPepw19TPVbofIqxUzcdXMKJdkvcsTZvQOigGVVVjqvzs8Lc2e9qyNHGfuDe73jPwuL9WkH2p324wwqK0QriR1TF03qyHFiLE/UKLYG2CaG0ouRtu7mUjf0W75282gV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPnUdNCjhg9xdCOmquQR0HfuANPBfa2bWQmFu6IhjhE=;
 b=MdsrQ4tbI9IxWAmngUL+705gSwxRgM7rObxUgs5vuKrTcCk5Lm/NPVQmBS91TJeM5tv93fESVWQvx3cGoAnMc+raEUCVPo11RYKXpDAFLZGi+xJ1DzVJgfIx+qmvM+bcLNqHIqTPADdl1lV98Rkg6HV4RJnWpUUr5WdMxCihMD8=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OSBPR01MB3800.jpnprd01.prod.outlook.com (2603:1096:604:45::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 13:24:59 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24%8]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 13:24:59 +0000
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
Subject: RE: [PATCH 4/4] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on
 carrier board
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on
 carrier board
Thread-Index: AQHYMlkF4GY68+CGQUWOHF1pICNxE6zFL7eAgAACSyA=
Date:   Fri, 18 Mar 2022 13:24:59 +0000
Message-ID: <TYCPR01MB5933AC1EB9E373CDAC6DEE7886139@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220307192436.13237-1-biju.das.jz@bp.renesas.com>
 <20220307192436.13237-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdWa2vZBrX7C9e9ZMHGHVNxWbaPT3zuTE7TUhr2Ts8Pj1w@mail.gmail.com>
In-Reply-To: <CAMuHMdWa2vZBrX7C9e9ZMHGHVNxWbaPT3zuTE7TUhr2Ts8Pj1w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ad715f0-afa9-4fe2-8de2-08da08e2b367
x-ms-traffictypediagnostic: OSBPR01MB3800:EE_
x-microsoft-antispam-prvs: <OSBPR01MB3800A54998AFA652ED43200386139@OSBPR01MB3800.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sOXRrD1ProAmEOnMJkcGuYrCOvVN3EvMijryHg9Ihklf6S1DLcX2s+6yLpW20wVIuIBqLdobDBrxZWKDgzIB2byNG8qoexfxae7KaNE0ZTmGi9Xjnf0G4pPE6bwMmzTKUkyUozxEG8/ZBFofgr9oXxyDMLdb2g9gF/vWIb5TYNM1SuRC7WA2u0KkRU/BGtDH0ZTQNuT3C7Ct71CcS3PGq+eQKhaUdRwXT1mY55xI21rlNQhwbYVS9XmLtJt0LiEzV/U4CdAmCYBe6AQcGM0OcIKHB0Drp47Msb2IxJP/hLx9BAeEp1T7D2tHwYiCol/zbwyAMNUVy5q2scPJX/ZGSQ2nm8dFFxerAgg7ztjVpQhYB2/HJwFuE4JSaXna2QU9PCm24/kaZSzVVWgKOtBSiFCICZ5zc5W66TV83Bbzx7tMpu4bTYbYSWsGktEKdrOg6A1tPDYARgNIxnXSc6DojdWyu0dxgQ+V7OdpQ2KC3D7SxtdMKbTjFZxYgFKowHENy+8GwfBn7hv4C6BwWBIfTzi+SpOt7VwhKGG/6O3VnfSEvq2ZycOFzKSb1gcovkSUKrRD/sTPosyWOjNjplLVMGkF1EUi3Uzoy/j0/Ho9603IscNYraKy+273sAARWlFDczSPsy29bbMbUBT1dZubS5Kp9m6hdguLostXjnDnhVXSHM0pZj00KQgNd1TvduBxz0R1NBHtZ2PY5198EonFTg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(76116006)(122000001)(38100700002)(5660300002)(86362001)(8936002)(4326008)(8676002)(66946007)(64756008)(66446008)(66476007)(66556008)(55016003)(186003)(71200400001)(107886003)(33656002)(38070700005)(2906002)(53546011)(316002)(508600001)(83380400001)(9686003)(54906003)(6916009)(7696005)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlFYTGFlTU5EMlRsRFRNVUtKd2Joa0ZSYzFZQ2J5eXFpMENKUmZ6WEd2MXR4?=
 =?utf-8?B?ejBzMXRxWCtWT1crcEFsTzYyQVczM2tYdTNUY2ZjbVZVK2IyMFFRYTdXalZz?=
 =?utf-8?B?Z2M2dk5YYVUvUFlhUnVHN3RDdTNZYktTNWllTVI3enBlREVVbjZ6R2twcW00?=
 =?utf-8?B?Y25wQ2NuSEtGVDB1WFJDWkpBMytWOTkyWHJXUWthKy9IS2NkL21abWhJWGhM?=
 =?utf-8?B?ZE5za1FOYTJtY2J4enFPS3FHdno3RVFVZUZuVHVta2tCNHMwakl1alhLZ2RJ?=
 =?utf-8?B?czVyYXJpaGhWRVFWOVM4NU5VNHZOVVA2M2xNeFZsL2JDTWZIbmw5c2kzQ1ZR?=
 =?utf-8?B?Q3F1TFA2U3paWGZYdjlWUUNHcFpUTlE1aGFNT2NaNEw2a0xRQkVUMVNIUWI5?=
 =?utf-8?B?RDBHM3o1dExUZUttVkQxd0JzYTg4ZXdaMjJBL0J0Mnd2NmI1V3hQOGltR0tT?=
 =?utf-8?B?ZnIwNTcwb2dRamZLZkJhM2VxZTY3UDUrMTlMbUVadVZQdWxwQWJta2pLMy9s?=
 =?utf-8?B?dWNPWkhCcHNnWDRPdTJ0UmFqczRtVlcyeVZBMFpsb3BkRzRKS1kyVE1NSW1B?=
 =?utf-8?B?bDVSUjlXd1JZVTI3UVVnd2xxSlZqazljTDBabmhJOURNT1pJUWU3RDZUWEpB?=
 =?utf-8?B?SmpUOHdMWWhXS3NFZEJlWm5IYWF5Ti9ORkR1Y2QrVU9wc2dsY0xiM2JSTVZv?=
 =?utf-8?B?eUsxV3Vqc0pMWWJvYk9COHpIOGNXVU8zVGRjTThGdGl3M3ozWlROMm9xQlk3?=
 =?utf-8?B?OHR6dVdQUHdSRDU1d0lyeG5uNHZEOVFIYzlQc0hMWTV6SkFjMXVGZzRMYWxz?=
 =?utf-8?B?UHpvSEtjWVlGTjA2WnZVRUk5WksyMDN0MXpVdk1aT1AvKzBDWWZXYmNQaVlF?=
 =?utf-8?B?allCZjdHclpRa2ZFK053bzJLWkl2RStvVWUxdVcvNTV6T0NnbEE3Ym93ZUE4?=
 =?utf-8?B?ZENCSk01ZTlFdkdPS1lmMndqMXg3L2s4SXFmc2pKSDFIM3A4SXgxUzQvNG5y?=
 =?utf-8?B?MERKS24xM0R5WFRtTktPZlArVHA2UFlLNlZ2KzQvR0NYK0tzU2NGN0FkSDhJ?=
 =?utf-8?B?QnFvSjhPVzh4ZnhZdlJoTnNVQ2VhYW0zWUxiV3VUQ2RPSGhCVnlvUzgzb2g2?=
 =?utf-8?B?UCtWYjFGZ29saldyN25CYm5IVWNrbFprZXZDbTlJS1RMVWhpRzBQRlFzV0Nl?=
 =?utf-8?B?SFVwZnkrTGlVRXdYSHVSNTYvcTkxZWZQSlhlRWhuN05EOXF3eFdXQ2xTaVhI?=
 =?utf-8?B?Z1dIQnNnVXdpcXNuUmJ2SjVjS21yUjJwbHhEUEtJVDJKK1RpcGE0SGM1VU5m?=
 =?utf-8?B?OFc2UjMrelFsWHIyaStlMEhxWEF2cWtjcFgzSUx4Z2kxKytNWGI3STNKdXJX?=
 =?utf-8?B?TlViZlY5TWxtTFpTWDUyTWg2UTdVTE51WC9ON1RJdXVDZ3FkamZ5eGd4allF?=
 =?utf-8?B?bXQzbWZ0dEp5S0tQQ0NrcU5hWG5SNEtNdDJJUkcyWlFlMVBUaXBVdVZ0dUZP?=
 =?utf-8?B?MUwrS0x4K3owNGtiT0xiZXUyS3ovWndxMGxkV0c4S1JKUHUrd3RabUpYREp6?=
 =?utf-8?B?bXZURXg5Uk4zNjdyMEtaakZmYWs1TkRXUXNtS2FIbkp5MGVzOW1BNG5wR09V?=
 =?utf-8?B?S2lGbmZZdXk0aG1JcXpITnRJRHNQMWtmREZRTVRIMXdTMmJkN3JkUXl1aExp?=
 =?utf-8?B?QjRkWllIdDg0NHovT0lTcnpodkRIdzV4YU5Mc1ZQTDBxaFc2SWJWRVpIbitk?=
 =?utf-8?B?SGVqZGRIR3JwaG1BTmduNGZWL2FOdEwyWk9PcVZMZDJuZUhSMGYwTkI0UVJC?=
 =?utf-8?B?bGNaVmlDV3o4aHlhRDluRVdKdXg5bjZmbzBYd1JXNXVFYWpSaUtzM2xjRzA3?=
 =?utf-8?B?SWpqWHdrL1c2NWl3N3o0UW9wM3pCT1c1VkxXNUUvMjZkbnU4RVNjNW1xb2wx?=
 =?utf-8?B?M3VZZHZHMzBWVEdwREFoTUI4UWhZQ0RNbFBOTXNpaU44UGdwVFhqaEJVUkFi?=
 =?utf-8?B?RjAvWkUwZzJnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad715f0-afa9-4fe2-8de2-08da08e2b367
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 13:24:59.0948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wYHyb9YgOZKsULK6HBQTQ0G1g41wDEGZFRSBOJ/U0ptnp2f00YeN1KV5inzU2vaBDSX7+BF0Xv2DfEdoCfHqkc6EU78dNCbiThhEkxr3pOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3800
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggNC80XSBhcm02NDogZHRzOiByZW5lc2FzOiByemcybGMtc21hcmM6IEVuYWJsZSBSU1BJ
MQ0KPiBvbiBjYXJyaWVyIGJvYXJkDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBNYXIg
NywgMjAyMiBhdCA4OjI0IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gd3JvdGU6DQo+ID4gUlNQSTEgKFNQSTEpIGludGVyZmFjZSBpcyBhdmFpbGFibGUgb24gUE1P
RDAgY29ubmVjdG9yIChKMSkgb24gdGhlDQo+ID4gY2FycmllciBib2FyZC4gIFRoaXMgcGF0Y2gg
YWRkcyBwaW5tdXggYW5kIHNwaTEgbm9kZXMgdG8gdGhlIGNhcnJpZXINCj4gPiBib2FyZCBkdHNp
IGZpbGUgYW5kIGRyb3BzIGRlbGV0aW5nIHBpbmN0bCogcHJvcGVydGllcyBmcm9tIERUUyBmaWxl
Lg0KPiA+DQo+ID4gUlNQSTEgaW50ZXJmYWNlIGlzIHRlc3RlZCBieSBzZXR0aW5nIHRoZSBtYWNy
byBTV19SU1BJX0NBTiB0byAwLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2Fy
IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yOWEwN2cwNDRjMi1zbWFyYy5kdHMNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjlhMDdnMDQ0YzItc21hcmMuZHRzDQo+ID4gQEAgLTEzLDkgKzEzLDMgQEANCj4gPiAg
ICAgICAgIG1vZGVsID0gIlJlbmVzYXMgU01BUkMgRVZLIGJhc2VkIG9uIHI5YTA3ZzA0NGMyIjsN
Cj4gPiAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxzbWFyYy1ldmsiLCAicmVuZXNhcyxy
OWEwN2cwNDRjMiIsDQo+ID4gInJlbmVzYXMscjlhMDdnMDQ0IjsgIH07DQo+ID4gLQ0KPiA+IC0m
c3BpMSB7DQo+ID4gLSAgICAgICAvZGVsZXRlLXByb3BlcnR5LyBwaW5jdHJsLTA7DQo+ID4gLSAg
ICAgICAvZGVsZXRlLXByb3BlcnR5LyBwaW5jdHJsLW5hbWVzOw0KPiA+IC0gICAgICAgc3RhdHVz
ID0gImRpc2FibGVkIjsNCj4gPiAtfTsNCj4gDQo+IFRoZSBjb21tb24gcHJvcGVydGllcyBpbiBy
ei1zbWFyYy1jb21tb24uZHRzaSBhcmUgaW5kZWVkIG5vIGxvbmdlcg0KPiByZW1vdmVkLi4uDQo+
IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRz
aQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRz
aQ0KPiA+IEBAIC03NCw2ICs3NCwxNCBAQA0KPiA+ICAgICAgICAgfTsNCj4gPiAgfTsNCj4gPg0K
PiA+ICsjaWYgKCFTV19SU1BJX0NBTikNCj4gPiArJnNwaTEgew0KPiANCj4gU3BpMSBzaG91bGQg
YmUgaW5zZXJ0ZWQgYWZ0ZXIgc2NpZjEgYmVsb3cuDQoNCkFncmVlZC4NCg0KPiANCj4gPiArICAg
ICAgIHBpbmN0cmwtMCA9IDwmc3BpMV9waW5zPjsNCj4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gK307DQo+ID4g
KyNlbmRpZg0KPiANCj4gLi4uIHNvIHJlZ2FyZGxlc3Mgb2YgdGhlIHZhbHVlIG9mIFNXX1JTUElf
Q0FOLCBzcGkxIHdpbGwgYmUgZW5hYmxlZD8NCj4gDQo+IEkgdGhpbmsgeW91IHdhbnQgdG8gcHJv
dGVjdCB0aGUgZGlzYWJsZSBibG9jayBpbiByOWEwN2cwNDRjMi1zbWFyYy5kdHMgYnkNCg0KT0ss
IHdpbGwgZml4IHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0KDQoNCkNoZWVycywNCkJpanUNCg0KPiAj
aWYgU1dfUlNQSV9DQU4vI2VuZGlmIGluc3RlYWQ/DQo+IA0KPiAgICsgI2lmIFNXX1JTUElfQ0FO
DQo+ICAgICAmc3BpMSB7DQo+ICAgICAgICAgICAgL2RlbGV0ZS1wcm9wZXJ0eS8gcGluY3RybC0w
Ow0KPiAgICAgICAgICAgIC9kZWxldGUtcHJvcGVydHkvIHBpbmN0cmwtbmFtZXM7DQo+ICAgICAg
ICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gICAgIH07DQo+ICAgKyAjZW5kaWYNCj4gDQo+
ID4gKw0KPiA+ICAvKg0KPiA+ICAgKiBUbyBlbmFibGUgU0NJRjEgKFNFUjApIG9uIFBNT0QxIChD
TjcpLCBPbiBjb25uZWN0b3IgYm9hcmQNCj4gPiAgICogU1cxIHNob3VsZCBiZSBhdCBwb3NpdGlv
biAyLT4zIHNvIHRoYXQgU0VSMF9DVFMjIGxpbmUgaXMgYWN0aXZhdGVkDQo+IA0KPiBHcntvZXRq
ZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAt
LQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+
IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
