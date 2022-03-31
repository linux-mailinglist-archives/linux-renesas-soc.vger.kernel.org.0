Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 527044EDBBD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 16:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbiCaOfU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 10:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237608AbiCaOfR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 10:35:17 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7635C3ED15;
        Thu, 31 Mar 2022 07:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5XZMpaRzaKFvLLEswdsSXBn0WXPVMVA8ltlj7Wgri6ukCtnVjt6uIW78oPitQrhvTCyncEwqdy0eF0neNNYokEB4yT0i1d/4sQtI3KUTzezDeL2kodG+W5xF7R1ctO9Nm2XTnl2giZCFldOZ1RLLeKyuroxYoTeq3gG/K2CSUm1RoiWpvQvf+nYbr34r7ZehMvrxY9PC9z1L3J/tQ6AptGvluvVlMPe0ujtlO3LkhQPRm/9sueA4TdTY3y1uRR1xIcwA90aaa0HZ4uLgsh1+RPhaPflraq3fIdomxlhaIO1eze1RIQ/RHZBm1gQaoqUzSC5kTxaqkcaz1n7VZyEiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EKKxUNMjyGUQvsb+igEaf0WEsDdd3aE44ncl0Am1LY=;
 b=lC4sO5WS0RIcv6eyOu+e/udDrlXWRBXTgsSiWOEVK8S1k9SBzH3zPclnpdi0g49JU6K7e3cAoDGOwzYEOO82o/38tSknw0ODvl9kzR0cnraMkc85uRFpGZwpTgfcIMPqpA/IFBUnc0yT52kQ9GH64nrTkv/ZxDPM493y/4qcOwZpNoVy9f80jFgt2tBBpwKlgHPCW0CXqTniebBP1mqre8mbAx6o8k4amEVPJLQlK2FbcUXTR66MKn8tXcNKHTGzr9NaYrWM2swM3K1solotIvKQrsWmjNS55z6TYMc0MfJaPfEmQktOf5WaLtSB3k5EmISoTG9hJBCxaw+/uzUuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EKKxUNMjyGUQvsb+igEaf0WEsDdd3aE44ncl0Am1LY=;
 b=nq544QE/cN0TdwGr7CI6F04JrIlJr/3qLhFH4XyPe7kSR/BNVAsSGAD8cnHCAP/M3uVmEMb97DVWtuFTUef0gaAK265dqRsWVHZXQ4ZmgT+dvxyYP3j6ucwUeXjcb4UaIf7+uwFM0T8dkHsLlsCsFZnuYKW7c2HenEET/KdR55Q=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OSBPR01MB4005.jpnprd01.prod.outlook.com (2603:1096:604:41::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Thu, 31 Mar
 2022 14:33:25 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24%8]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 14:33:25 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 7/7] arm64: dts: renesas: Add initial device tree for
 RZ/G2UL Type-1 SMARC EVK
Thread-Topic: [PATCH v3 7/7] arm64: dts: renesas: Add initial device tree for
 RZ/G2UL Type-1 SMARC EVK
Thread-Index: AQHYOHi/tOZe5MsISUOCfXlOa47c0qzZpcsAgAABf7A=
Date:   Thu, 31 Mar 2022 14:33:25 +0000
Message-ID: <TYCPR01MB5933B4D69B2310B32517E3CC86E19@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
 <20220315142644.17660-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdXE+ighcDngxWzECsNd1bVnb3+RRmrEKWzpmGJFrFYEEQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXE+ighcDngxWzECsNd1bVnb3+RRmrEKWzpmGJFrFYEEQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 029a73bf-f887-4067-f558-08da13236a4c
x-ms-traffictypediagnostic: OSBPR01MB4005:EE_
x-microsoft-antispam-prvs: <OSBPR01MB4005A84F942DD38DBC4F73D286E19@OSBPR01MB4005.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hh5DEkF25yblusfTKp8NNWcTf5I/vV4+IZqlw90bulbSuAzSRFCqCerHE1Py0xDpUdWWRR6L7rRww0qkVduRK3ufwPg90zaJ134txAYLvf1m5+oE2SqDNcze1ONdw8vZcaE7DepHMUg+G7mDh2hVrgIgjS7qwtlvT6vJtxOQ/WrlHsnV5mtoj1qaOYP+9vyW9i/2w+nUWAvW07xE6uxdhOLPNV1lLwSqL4rFi4PsUSC68rPxSkVppyxoDTgBqwX9aAbFkJGhhz9XfkHhJ1KX3hgt4NAmLn1SHjxI3GnyVW6040okEW1405ziks8hp8uA4k2A6GS77sArb9/WMcuc9igJxJkYyry8YYUKrzdD8yHzCm5kH6L1QBZGJLpE8T0niIiW8Iutf22hTtXvmtLzZSxpt1B3KkkUYQUIgGuIA3b2R8VnsGX4xVLBhdcIiVY36JJHWgmhjRihz7pf2df78L3SKeZ1Kn+cQPIYv4fzOkLygAat8MzEIIDESjyT1CuABxES/uMDun6Pw1vE5qS0JNEPkKRZAXRaq8EDgRPU3mIoIuSgBI3eO2Yf62GqdnlWy7GTAKQGUTUo+YAtlxm9v61QC8nsGT//enTocE6CFzIcSAsq6ZDA8Ae71j5XEb+XxmaTtIcg1PpbpT20Lar8bnNaBnb2eTw58jopsb2WYj7vXgSaCRRhlykHs9J4aqWffj2MkKmOzJGosuJgAbFkyw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(52536014)(38100700002)(8936002)(6506007)(53546011)(107886003)(7696005)(83380400001)(86362001)(71200400001)(6916009)(122000001)(508600001)(5660300002)(66556008)(8676002)(76116006)(38070700005)(316002)(54906003)(66476007)(64756008)(4326008)(2906002)(66946007)(55016003)(66446008)(33656002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tk5BM25rbFA3cHUxWHZRQURIdjVzSlNOZnpaZjlqWG10QjI2MWIzTWUzbGlW?=
 =?utf-8?B?aVFmS3JHT3dPMVlGUzNFaVNqYm1YeUd6ZFN0N2FXU3RtbVJEZDNFVFBxRytK?=
 =?utf-8?B?eW9iZzQzM1FwNzFjSUk5V3VUV2pYb3hBYlZkckNSMXNOYXRIbDFpWjhIaThO?=
 =?utf-8?B?MzNyUkRGVHBOLzVpZWlRRVA4dHlNRE0zUElRcHdFekRVckpmM3pzLzc3Umtr?=
 =?utf-8?B?ZCtWY0hTa1h1c2ZpSmxRWXBxdzB6UGNRYUJjeGt0S3dZc0trTThlSVNHWmNK?=
 =?utf-8?B?TFhQZjRQa05teUwxb3ZmYXB5ZURyK2I3TnRrdnBheWc5cHhwTmpyMnpQMVU4?=
 =?utf-8?B?VDgvMFpVVzcvNUo3N2RSWkVIVE5EREVLNzcxd2VHZXVSYVo1K1VROTVOVVhC?=
 =?utf-8?B?OVA3T0RPT1A4THVrYkJkTVAyT04vUzdVVGFkR1F5YXBhc01vMmE0QmllSU5U?=
 =?utf-8?B?cklBMGF0Ukx0MnJ4NWFmRjVIM0JYaG9HVmVTZjViRGhRakZZd2tOdkNucWJ4?=
 =?utf-8?B?OWVkSlgyYllkc1oxaDZvRkxCVDJHZGlwSS8wcG82bmFxaFhoK1A4TGx4WUpv?=
 =?utf-8?B?T0JTWHRJTGhJV1NpU0hvbkF0UE83Z3c3aGxhZ1llNnVVanlhRnB6ZVJNdTNX?=
 =?utf-8?B?S2owUU1oNnVuY0gxTlRtOSsyMDhDZ1NBbUl1cGd3WkwvN3dUc3RqUHRGMUJz?=
 =?utf-8?B?SHlzZ2lLaTM4VXRIZEw5Yk56cGRvRnQrcm5zZ0oveTNlUEttcU1wWDVrS0hj?=
 =?utf-8?B?YnkraHJOeHBlMk0xTFhwK3JaM2ZNdW4vMkNzR2xWeGM0NEpjcHpweDM4Vzh4?=
 =?utf-8?B?cDlJUnMvY21nRkVLYXRTM2lYbW50ajBiZFlXb01oTXpUMEw3NEFiVzdldWVZ?=
 =?utf-8?B?VFBIOHVaQm9Pc2d6ZG9jMElzbDR6bVoydWZNbEpBUWp4SmhLWkUzM1dvMWRv?=
 =?utf-8?B?MnNBUnowQkJ4M0t3ZEdscHV3aEdjbDJXNjJiSkFVOGluQlRNQk9TTXM2WkdZ?=
 =?utf-8?B?c0lNeG9pZkpBZEVZODBIaDZubzlKTFZGWjNqSmdLRnUyK0RNWTAxOUZqK0Z0?=
 =?utf-8?B?OWVwUFBQbThWdW93SUdZTUJxYXZRZkt0SHpXZEFhbmZ1dmU3TlBXbUozbEIz?=
 =?utf-8?B?RzZlUVRUcWxyQlZxeE84WEM4eFl3NVBtNVNQZU5hOWp2bzZla1ZaQ0tEZ1dt?=
 =?utf-8?B?Wm01NmVQclNobmI2L3hvTGt5b25rcHB4bnR1eXI2dzM4YUkxWXFRVWlLS0xx?=
 =?utf-8?B?YUtUaTVFVmR0bHMyeHlGemkwblQvc0lxL0I2YmpCcE92TUZ0ZWs3Ri8rWG9W?=
 =?utf-8?B?WGNhdHhreW4wMFJNZE5nNnc5cjBXbVJic0k2RnBCOHpCUDU2RFlOWnoySGJp?=
 =?utf-8?B?d0Q5cVZNRldMRDNtVWF5NXpSSU03NU5ZeVh0Z0I2bWR2R3AvRkZJV0FtVTl0?=
 =?utf-8?B?cGl1OVd4U3kzY3JDbHh0eWRMZm9Oa0wrUFkwWHRad0FKa3NTVlRZdGZXWlpr?=
 =?utf-8?B?eUhzaUJyM1pxeld2SlJWZVBKY3FnenNWVmR2VXFSbGd5b0JJalhaUmxZSnp0?=
 =?utf-8?B?QjNBakFyb01QZmllNFh5cHF2eGRRNDlERUM5VDk4Lzh6Q1Mra0UyK1JPN3RG?=
 =?utf-8?B?TXFtZjlWQlNhS2FrZ2YzZkFMem5XaU5HR1cwQjQ1bnZzdGN2dE9RSDJDd2Y5?=
 =?utf-8?B?ZC9MQzh0Q3Iwdi96cjNoZ3JvditKVHhXbkcrRzE3SFNmLzJlSnoydU84MDY1?=
 =?utf-8?B?SExoSGlQdkl6c2kzTGp3TkY1YUZnQ0M4TU5XRm51QWFIL1VWcTlMVWhQUm5O?=
 =?utf-8?B?NldoM0ZqMUJxOUZKcjJPbnlOdCsrUEp6ZjJsNTdmZnJGbXp5SlZZZXhQeG9O?=
 =?utf-8?B?WU9XcWhXZkxqYUdKOTJza0pIRWFWUTZvWGhEaUU1NVNGdVB5SWdsaTUyVmI5?=
 =?utf-8?B?N04xZWRveXN0WTR1SHRuRVl2WWVVWW4rNlArQzdZVUh1ZTA3UFZ2QWRaQ0Nx?=
 =?utf-8?B?UTR5RDl4NzN4c2RNdFNYcnplL1YwUk1YdXZvOCtWOVdFb1dkTnhkYTFkUTIr?=
 =?utf-8?B?ZVNOTFpQTzdUWjZMVUMyZDZBNmduaHdnVzRGL3NySGVnS2IzdWtXMnBPWGNl?=
 =?utf-8?B?N0ZvYjcwTXpKVFNQdEpIWm5ITUYzWUNhVHJ0UmNvQzcxM1hSaFNjUDhxUG9R?=
 =?utf-8?B?bGNFUXg3M0oxRFVQa1RMdEwvOFgzaEllVm0ySDhweE1wSi9aemJWdzlPZGpJ?=
 =?utf-8?B?Sk9ubDNZRGVubExKbjR1dDFmM1I3OHVxL1doZ1BHZSs3WitLRHpVNHRER2c4?=
 =?utf-8?B?d2N6NXMvbWdISnFZbVZvVTZNYk1EVUR5SXI2WkFtZUk4M01DaUZaaWhnMTFL?=
 =?utf-8?Q?qOJbu1Bl4Bk/1W6c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029a73bf-f887-4067-f558-08da13236a4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 14:33:25.3933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4+K5ZGvunTeOzgyvaIyw+lQdj7bwdTWDZlg2/dE1mvBjAqPtCbvmfYo7Z3vF6JNPTeZhIl8MN9VVAsmqnVB4auTyTZy/jH5XI7BulnByTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4005
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
UEFUQ0ggdjMgNy83XSBhcm02NDogZHRzOiByZW5lc2FzOiBBZGQgaW5pdGlhbCBkZXZpY2UgdHJl
ZQ0KPiBmb3IgUlovRzJVTCBUeXBlLTEgU01BUkMgRVZLDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4g
T24gVHVlLCBNYXIgMTUsIDIwMjIgYXQgMzoyNyBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEFkZCBiYXNpYyBzdXBwb3J0IGZvciBSWi9HMlVM
IFNNQVJDIEVWSyAoYmFzZWQgb24gUjlBMDdHMDQzVTExKToNCj4gPiAtIG1lbW9yeQ0KPiA+IC0g
RXh0ZXJuYWwgaW5wdXQgY2xvY2sNCj4gPiAtIENQRw0KPiA+IC0gRE1BDQo+ID4gLSBTQ0lGDQo+
ID4NCj4gPiBJdCBzaGFyZXMgdGhlIHNhbWUgY2FycmllciBib2FyZCB3aXRoIFJaL0cyTCwgYnV0
IHRoZSBwaW4gbWFwcGluZyBpcw0KPiA+IGRpZmZlcmVudC4gRGlzYWJsZSB0aGUgZGV2aWNlIG5v
ZGVzIHdoaWNoIGFyZSBub3QgdGVzdGVkIGFuZCBkZWxldGUNCj4gPiB0aGUgY29ycmVzcG9uZGlu
ZyBwaW5jdHJsIGRlZmluaXRpb25zLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhh
a2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+IC0t
LSAvZGV2L251bGwNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdn
MDQzdTExLXNtYXJjLmR0cw0KPiA+IEBAIC0wLDAgKzEsMTExIEBADQo+ID4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArLyoN
Cj4gPiArICogRGV2aWNlIFRyZWUgU291cmNlIGZvciB0aGUgUlovRzJVTCBUeXBlLTEgU01BUkMg
RVZLIGJvYXJkDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMiBSZW5lc2FzIEVs
ZWN0cm9uaWNzIENvcnAuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArL2R0cy12MS87DQo+ID4gKyNp
bmNsdWRlICJyOWEwN2cwNDMuZHRzaSINCj4gPiArI2luY2x1ZGUgInJ6ZzJ1bC1zbWFyYy1zb20u
ZHRzaSINCj4gPiArI2luY2x1ZGUgInJ6LXNtYXJjLWNvbW1vbi5kdHNpIg0KPiA+ICsNCj4gPiAr
LyB7DQo+ID4gKyAgICAgICBtb2RlbCA9ICJSZW5lc2FzIFNNQVJDIEVWSyBiYXNlZCBvbiByOWEw
N2cwNDN1MTEiOw0KPiA+ICsgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHNtYXJjLWV2ayIs
ICJyZW5lc2FzLHI5YTA3ZzA0M3UxMSIsDQo+ID4gKyJyZW5lc2FzLHI5YTA3ZzA0MyI7DQo+IA0K
PiBDYW4geW91IHBsZWFzZSBzZW5kIGEgcGF0Y2ggdG8gYWRkIHRoaXMgY29tYmluYXRpb24gdG8N
Cj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9yZW5lc2FzLnlhbWw/DQoN
Ck9LLCBXaWxsIGRvLg0KDQpDaGVlcnMsDQpCaWp1DQo=
