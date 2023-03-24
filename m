Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16FB56C7C74
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Mar 2023 11:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbjCXKVu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Mar 2023 06:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbjCXKVt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Mar 2023 06:21:49 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2136.outbound.protection.outlook.com [40.107.113.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456A71DB90;
        Fri, 24 Mar 2023 03:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuzHqU/kFyppIHXK3MC+rNtxmUaiH5Xy0gcISgx+otEQjR2MqgSRcddzp2xFbkJTpsPLvpPKZWD3zsTxBNf5phU9h4meoHnnJJdMrDKwqRnct2MZS0IgOS5ZLqpFFJDu3+bAhHYvDG8/PzSfKrzyssYnlb6FUE612SIHHPGYIyGDy3St9LcmhCCSzZjX7qaBWEdktym/z8LtPKPsW7VVKPWXZfrxHCLYFzmSJlN46OH1LeRthhrTCvKFXdjatPjB0TX6o7sFf6SE+a9HybnKgBLn41ZrbAnP/UEcxfV3E5WQk7rzbevFKXMYXYzK52PhqcFf97FiBGTo25pe5VCPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXydrbqMwUhe1ZKf1dAVAsx3EnDbuodn+Fdqv7TsJ7w=;
 b=II4NlbAlBL2Dek53l9gYrm4NMPJrlP5k9OITQjPQC5ZZk09xnBHTl0+NKRYhNlyA02q3k3fWEO/8/lR/LWSgXe5LOZb9XITNgRLWX558hlkF2sJES3Y80omjRCboVDCKGHr59q/jsmyjUQsH6hemQMUdHNCvR3wv0KoxeEjH9g64GeeZkSrFYUdMg05fUtn9t0cC4ywBGV8RhnQNMZ9y7hw87SYAygEF8DRnuyFSv6crURs10jkJu8y3uRp9Klit00QTQpuB3Rh6yIFfj2H5mMS894/LFktbcaEZYuCaWvo1/ndkEumjLW1aWhm9rPZd5FPv4qUBdhSFPpsQdF6XMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXydrbqMwUhe1ZKf1dAVAsx3EnDbuodn+Fdqv7TsJ7w=;
 b=t4u8fK8yGCbul8PRpMnoyHl6N9XyDj8z7SHQWPqAsxah7nNAppBgfLP8MDz5b/wh+K1gINkIqZpvS78P6uwfwpeV2QY1zhX92sDMAE7MwUIbzAs4TjtHWTgaMfXCxqcz4EWkiGBNjdaJVvOhzksUNCLEFIeF44i76Gm6TAZHWeM=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYWPR01MB8511.jpnprd01.prod.outlook.com (2603:1096:400:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 10:21:43 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06%4]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 10:21:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/3] Add RZ/G2L SCIFA DMAC support
Thread-Topic: [PATCH v2 0/3] Add RZ/G2L SCIFA DMAC support
Thread-Index: AQHZXje+lzOHOnF/+kSAoAb/rokika8Jt7uAgAAAOuA=
Date:   Fri, 24 Mar 2023 10:21:43 +0000
Message-ID: <TYCPR01MB5933A8D6F59175C61D54940186849@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230324100222.116666-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVD-545UeLZcBKc3OKSyO0=+YSBwN=invZVAvGjhmH58w@mail.gmail.com>
In-Reply-To: <CAMuHMdVD-545UeLZcBKc3OKSyO0=+YSBwN=invZVAvGjhmH58w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYWPR01MB8511:EE_
x-ms-office365-filtering-correlation-id: 1b90521d-8a75-4594-0538-08db2c5190f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vf1QLKDwXYmceLqZHuMgWFSxdqHB+EdQfLCxizU7pA0SeYxuhbevvNy8ko6xM05hjUzaK9avqBWVCBw4X4owil0b4xC1f+qXSE3Cw/qH2RmeY6Fy67C9TnwJDUPJaHuKhjGVXwPHISExp6PJXG61dkm/Zs0xJGY0KMCDktsr7zIzQNP0XvUg2Rri8AI2QH7ZADMjL4nPrd3dRvaTOyZO5PH+iAlkpwt/y6a69p0kSKI+WuEhPWXfgcGrGS0HLQA4AKTgZtd7Tny4FxE8RLBjpL/GIisikc0Jccu2LCWLr/hcHTKZAqoKpoR8xeSJFEZ3w6lhnlldknhTzPF18bbMFuvFQrqwZgGX5Auns6kbpJ7voZycWDybdNJLACgjvWnWQe5CcvV7/ofjKEL862KUE4stEYD84qI1Ey8IetMEfdcK+hmFWxTeOhvGDcMpo5WbmJMeTePzmzGTi9VT+7oI5B1qMGmvieCtyZ8pEQEwt2tVRCHmPG7KwcR5HJE2FCCKa7G0Ow9JUbrudoqywPCOl9Cdi2vTBhJyHTwKTCrTlcnO0jgcdfXTJGSk7kmFfq5lvL1RpS0lfXs/+gxgphNWI1HRJjVR/XO8M3P/wOmS1teemtHW7Pebk27ifbRL+1p2Q9omAXjF1jARd4ynPd3uraHWLF4f65BE4mwZDKP3sIvyalQKf8dOp5SfdgVNyr7/FE9gHIoS1AZGao/Xg0C2dg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199018)(33656002)(38070700005)(86362001)(38100700002)(52536014)(5660300002)(122000001)(8676002)(64756008)(66476007)(4326008)(2906002)(66946007)(6916009)(8936002)(66446008)(41300700001)(66556008)(4744005)(55016003)(26005)(9686003)(54906003)(478600001)(53546011)(186003)(83380400001)(6506007)(316002)(71200400001)(7696005)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ck5tMUYzdngvYUJjNWdBWVd0UUF1OWdURnluSmtCbG5rbjBkZ3RIYituQi8y?=
 =?utf-8?B?eWlZWmV0TXg4TktoUGZlblZGMHRZRFljK2tBdCtFVDA5QmNNaGtWaXhaYWVi?=
 =?utf-8?B?VGlaVWZxWENGN1lIZWRzODRIeUdCdytvd1BQUWV2QXVIWVM4ZzZublBhb2hl?=
 =?utf-8?B?eGptOTVCZWZpK1c3UlpiL1RuN2tOWmlQWGVyK2FwVmp5R0RCMDQ1c1RZdndi?=
 =?utf-8?B?Q0oycUJWY3BxUnJhS2Rjby9WdTlLeXJJTVNranF0Rk9uOE1BVEd2ZWRtU3Fq?=
 =?utf-8?B?TFFQNU9wZW8yNHdqSkhTakVXM0JEcUg2MitacUlOVExVRVFNY3YwOWxOT0Iv?=
 =?utf-8?B?eWpSUXN3WHpqdEY1TUpHZXQzOURrUFRub1BTMUdabXpNNjFHRHpHVDYwdlg5?=
 =?utf-8?B?UndjWG55MkRNd2d0YWNac3dHMCtKSlNMek0vTzV2NmM4TDFRUERZSlkrTUpt?=
 =?utf-8?B?dlRWVkxwMERtaS9mQUM0Z3FrL1VTUnRvVzVNUytnSjhvZzdQQUMyR2o1TXdi?=
 =?utf-8?B?SnNEOXlFRUZsS0tPUWF2b2dZQzI1QndQd2Fjejh4KysxdFcvc2w5VGhtZlM2?=
 =?utf-8?B?R3A0MWlqT21CWEV3aGNkajlzVDF1emI0SlI5c1NXTUtJRUJ5NGlHZTFoV25i?=
 =?utf-8?B?MEIrWjBlTDZNWmRXMENOcFRKcWpSd3J5ekhOVDlBOGx2TVRkRlYwZGt1TFB4?=
 =?utf-8?B?YWRHME1jbmlzZWppRGVBUGFQRTBRbXNsNWJ2SDV1MEhxcU5zTW9kRk1wbXZw?=
 =?utf-8?B?dnRycVBFTVJzNUwrZFdHTCtPOXBQQnZCb2gxOFlnb1YveFdRQlZnS2lVVGt0?=
 =?utf-8?B?UTlCTnBvdXc5UkZDSndhNlpkdm0wNFNaYkFSUTBTS2ZaRkNSRGdKaHpiNGVH?=
 =?utf-8?B?S1IwaXYzUFBXR2plQWpVNVh6NE5YQUo5cFpsT1hUMTMyRFJmaVQvRTZwNFN3?=
 =?utf-8?B?TEJLcTVXKytlYjhTK2grT3lRTjAwRGc4Q1AxbVNUVjJqM2JUQ3Y0ZWdmd2hY?=
 =?utf-8?B?KzVMS3prZW1DTnVXdjNEY3N2UlBOT0lKMjZsNzN0bm84SDd4SHhSSDlJYlBj?=
 =?utf-8?B?V052cUNtMlRSV0NTZGhUb1c3a0NyemdReS83QS9wVjRJSHJNMW1ydiszV1Q1?=
 =?utf-8?B?VzhnYU1OM0RDNSs0RFl2VjAzUW9sUmtMcVhnajFNUzdqenNEK2d6aEJMaEFK?=
 =?utf-8?B?N09RWXlnS0NkWHREVXpTZWNERVB6R3BlNlVNQytMci9oVFh3VnptTS9jdFdF?=
 =?utf-8?B?L3ZZcDI2L0NuMmk3MlY3OFN6MWlIYk0vd0pPNWpWdHZpL3haRzg3NjNGNTRI?=
 =?utf-8?B?V3VUOW5XQkgwaEd2eS9KdkM0aWZXQ0ZycVpsVEpWNUMvcjByWDF0Ti9zRENi?=
 =?utf-8?B?c3c5WGFKVk14dWhRV0dOeWF2ZFlqLzcwdDNTN0tkNDJJTGFqUzJrcEFlSGg0?=
 =?utf-8?B?eEdLTjYwcy9TRHI0S3AvQjI0cmlra0llMEIvWGZ6TVhoVWd4aUZhWjN6WEVj?=
 =?utf-8?B?YTVDbWhPdmswZTB2eldtZmpIby84U2t2bVl3TmdSZDl3S05wSGxRRU5BOC81?=
 =?utf-8?B?K0E4WTlhMzloSTMyNThjbDdPb0trc1BGMGkyNXExdXZFQ2Z6UjBYNjE0S1kv?=
 =?utf-8?B?YjUrRWtzeFJldzdXNnJrRHJaaVhEaFNvbS9ueXpLNmN0YVdCdERSS0dQRWNE?=
 =?utf-8?B?QzFaUkdGZzVZN1NtVXFkVUUvRmV0d2ZKSHJOZG13MDV0UzN1UFkwdGdMTjJ0?=
 =?utf-8?B?WXpodllPWXZPZ3VtMCtNd3JteUJxSHkwQnArUzNzb0h2b1NNZmlNLzBQRDE3?=
 =?utf-8?B?b2lxY0pCaFZRektBUkYvL3R4Vk15bWU1RzVpbTRseWJLTDlWaHFQN0p4NEMx?=
 =?utf-8?B?TFRUV1FIQXRuZlVkVFFkUStDZlZaSXE2WUl1OFFrMzJYRkdXUWNrak9jYlg3?=
 =?utf-8?B?M1pxOEtTbUROckc2V1Q2VmhGV3RXUktqTHJSTmFmaWVIZGx0ZWdqWDUwTVNu?=
 =?utf-8?B?MldjRXZxbUYvV21Tb1RpbmZBdGY2dndrQmZsd09SckhSMFZUOFdPRTZGWmxr?=
 =?utf-8?B?SWJHOVhIcDlmOUxHSWU3eTF2MEJhV20xRVM4TzJuTlA3LzJWRUpEODhNeVdF?=
 =?utf-8?B?MFdHTE1SeHlhRHY0VHNtd1BNRW9OdGR1U3R6bzdKeWFXYmhGeWRMQ0dibHNZ?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b90521d-8a75-4594-0538-08db2c5190f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 10:21:43.8735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QXoqEoyZwBGZ+lcV3I2MnqwpvmzRWqJ2y9j+pz/m0FRchqA9eD3oV1dOU12M/fll49PO+FjfJTRkfqh6bgf5LY9cGmiFo1eDu24kcausgzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8511
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpIaSBHZWVydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBNYXJjaCAyNCwgMjAyMyAxMDoxOSBBTQ0KPiBUbzog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBDYzogR3JlZyBLcm9haC1I
YXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IEppcmkgU2xhYnkNCj4gPGppcmlz
bGFieUBrZXJuZWwub3JnPjsgbGludXgtc2VyaWFsQHZnZXIua2VybmVsLm9yZzsgR2VlcnQgVXl0
dGVyaG9ldmVuDQo+IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IFByYWJoYWthciBNYWhhZGV2
IExhZCA8cHJhYmhha2FyLm1haGFkZXYtDQo+IGxhZC5yakBicC5yZW5lc2FzLmNvbT47IGxpbnV4
LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAv
M10gQWRkIFJaL0cyTCBTQ0lGQSBETUFDIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBU
aGFua3MgZm9yIHlvdXIgc2VyaWVzIQ0KPiANCj4gT24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMTE6
MDXigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMgdG8gYWRkIERNQSBzdXBwb3J0IGZvciBTQ0lGQSBJ
UCBmb3VuZCBvbiBSWi9HMkwNCj4gPiBhbGlrZSBTb0NzLg0KPiA+DQo+ID4gdjEtPnYyOg0KPiA+
ICAqIEFkZGVkIHN1cHBvcnQgZm9yIERNQSB0eCBhbmQgcnguDQo+IA0KPiBBbGwgaW5kaXZpZHVh
bCBwYXRjaGVzIHNheSAibm8gY2hhbmdlcyBmcm9tIHYxLT52MiI/DQoNCk9vcHMuIEJhc2ljYWxs
eSBwYXRjaCMyIGFuZCBwYXRjaCMzIGFyZSBuZXcgcGF0Y2hlcy4NCg0KQ2hlZXJzLA0KQmlqdQ0K
