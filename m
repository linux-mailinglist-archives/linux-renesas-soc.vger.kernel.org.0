Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 000C650DCFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 11:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238353AbiDYJnQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 05:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237403AbiDYJnO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 05:43:14 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2111.outbound.protection.outlook.com [40.107.113.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF0D2E0BD;
        Mon, 25 Apr 2022 02:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+IGXeLohOUVCrld/g7Ntr6YOGp24YwQFMHYO6YFVT/j7uPxrDG7XStzxVvjR/YLISsO5KgJHgJez2yeATIQuoY9116c+2zPTqcJgbykwGeO2e8gT5OtD09Kzuoy9O877xaPf93Zh3Pi6UjWjDThnCBaHRje9eEDyE5VJsEYdo/fi8VBQjnOrPN2OVmPazT0jftofja03ADcNAToZzcY4YPyGhcwEOQ35JDvEE9mynN4lGzDDVrZXq/cWHMtVtSE8ZLLtv90P0tA03Gq2gIaCR2wz2Yk9erxn8tO6RXZECVK0Upuc3LfGytDyfprfzTaocWP7Y+K/gn9ZF5MxMxGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUhsx/qHNFsZrTpQ0KWqr2zc2RUCAQ3FF8CO1nazJ14=;
 b=fKa6+TSQ+kxflK4hdWjBdF3zXxrJTqoolup3aL5Lc0YkIX1nGSsfO4QWyLLnMev8ByHCaFWFT09RkEmeMqsO9R0hp+7jxJtw89jxeu8QWhU0a+LG/VHgIekP3zTnuB8M5j6abtzWJ04fGmE1N/uRgoz6OBZ4FoR0ZVSpukd+fLbotLRaMxSP9RSa8c0coPhSvjBoN+ZyS4rogxEU9sY9iqYlMiHEirvHkCcJcz1VsePXnNfaHPUJoec2qKHkXKdMpwLwMmIfggI3iKkF7rd4++e/0s+uQgiHpYFi4NtBGm82trn184pJhGUwhYNt4q1ZpYgI0NurnXk9EAz4w4bw1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUhsx/qHNFsZrTpQ0KWqr2zc2RUCAQ3FF8CO1nazJ14=;
 b=R//gYBFC2JSsXDZxvnJzj5XWghlrX3nVJyhdV9AYiV/PzasP8b6t4u5dNK/MUT8Z5kjQIQY/TkHpbwavbsbufYudDq0UvpUrs+/4DDKE/whZY12fBrPDdZwBE6WS8sKYwH+L2HZTGZNq6QlZKUa1xIwgLEAwfqlWpAjBLO9Byec=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSAPR01MB2386.jpnprd01.prod.outlook.com (2603:1096:604:6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Mon, 25 Apr
 2022 09:40:07 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 09:40:07 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 03/13] dt-bindings: clock: Add r9a09g011 CPG Clock
 Definitions
Thread-Topic: [PATCH v2 03/13] dt-bindings: clock: Add r9a09g011 CPG Clock
 Definitions
Thread-Index: AQHYREyWXDjuboZuFkypK7RfgpWo2qz5biaAgAJon+CAAFSQgIAEVEaA
Date:   Mon, 25 Apr 2022 09:40:07 +0000
Message-ID: <TYYPR01MB708650E8E93C3D9421F44EA0F5F89@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-4-phil.edworthy@renesas.com>
 <CAMuHMdXy7XPcAmBLuCeXwZcPxNrfBs2yBN+tLicjHLQxQO=B2Q@mail.gmail.com>
 <TYYPR01MB70867EDF52038CBA6FD42383F5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <CAMuHMdXBf1RANzoTK_TKh73_5vYqTrYaA3eTKo+joNrFaNoDeg@mail.gmail.com>
In-Reply-To: <CAMuHMdXBf1RANzoTK_TKh73_5vYqTrYaA3eTKo+joNrFaNoDeg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 198d8409-e64f-41a7-2914-08da269f9599
x-ms-traffictypediagnostic: OSAPR01MB2386:EE_
x-microsoft-antispam-prvs: <OSAPR01MB2386C1EBCE4103A2E3236B2FF5F89@OSAPR01MB2386.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tYMVCPz64oieojAx6ufM9JQLwtmfSl3EWGPnMly/HzEBKMxOCWWB56GgVncHOp8udkx8cyVpt36tsdUnyRoAfSVQcFIuWOpfoo2jGq8vmZKbkWg6aGEEfXVXqLK22gGMu8shBSsjxm3gLl42xkzRxtvlBYEQRoWT7w40Cjv2J4l1VNKnGdhC6PsVpE9ppNHNLpumFhzFAo8FfMhNXxu3EbUUlrgQGhrujfNkYuJ+Xt1VxrOLIlVAypdkxKML6D7xGRSK9o9pRW3Fr61+J2B8y3hVvkuG61G+vubscZ9VocpAycF/aPkUNhSVQwrzD6I8DQ+86hxO1IGL81I06+AcE4tPCU7jTgEFQSsgGiUeNU13QGRysT9uIWA0+RAIoBbWmpyrNqA6agadRT9o6OpolP1gqld5XE7KmaRQxReeP8Q2mPSZB17AbtvDuw7ODEvYgQaRd3mGmw55Qr0CmqfYzXyrgJ3HgjpUP/BEgcAZo5uIqrcuTGam0XxGE8rcOeV3wNFS+N+x945bhxOs2gSflRe9Jef8/aSbqhGA/3refWnFpD4MYQTfRc+NrcJEbzOsukXfQYlSm67Zd36tOSXFrJP9hal2cBeXJvN/JGd1D6b3Dd3l/KdPTo/01vmWueFIqoqu3rboFKwKVR7L2O1bJKN0qm3HufBlsg7I5mDpLNP4MKlGwCz6KTUovCfHYHf1h9ZTBnmWtKbvSL+OLU50lA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(76116006)(54906003)(86362001)(52536014)(66946007)(64756008)(83380400001)(44832011)(7696005)(66556008)(66446008)(8676002)(66476007)(38100700002)(38070700005)(2906002)(6916009)(186003)(316002)(4326008)(8936002)(55016003)(33656002)(6506007)(508600001)(71200400001)(26005)(9686003)(53546011)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dURwSlVOWHNCMU4xbDdOUnp0Mzk4cGFvM3ZQb1ZvOXFMY0psTzVVWHhWQlh1?=
 =?utf-8?B?ZWtVRWpCS3ZBK0kvejVVdjJScUhmQjVSZlRlQ2xidkFWR3h1UGw0TjAxZDhP?=
 =?utf-8?B?d1hiVFhUWGFkQnRtWi83QWIyYytOODkyMGVtSnYyY2cwNm9UR1NabHI1S1FG?=
 =?utf-8?B?TmVWNzJJL2ZrZkxQRm1IbUtLaEdzclFDVjA1UWdzUk5LRWlPejM0L1c5UDlW?=
 =?utf-8?B?QnkrTDcycGdtS1I2bmt5NytFd1h1ZFZUM1ZoZnEvUWF0dnVWVXRSQXllTHAw?=
 =?utf-8?B?VUNJUCs5cjZidDNKU1RrMXJKKzBDbTU4Mm1ROXhHcFRBRmN5NDRxdHkxYkwy?=
 =?utf-8?B?ZU9yS1ZndCtxOStuc0hzTEJBdENZWVlpZVRUeGlMajJvYnpPU01Ub3JqZ3hh?=
 =?utf-8?B?U1Jub01Ka0txWjA1aW0zWVNieFpvd0hGOXFUMkNuK0VMVGp1U21iTXB2Wkpj?=
 =?utf-8?B?aVdqeE1oekJUWHc5cVlDd1I5aExYdTNtd3UxNkhiVUJHQjJIUTBLbkVlTHFN?=
 =?utf-8?B?RUhEMVJFWS9tQXpYT01lYTFRaERTZTZCdCtwUG1DbnppMTNwUXZVdEE5OTRh?=
 =?utf-8?B?TkZQeGNwVHBuaW1qZnZGZVpFUUxlWXh2cVZVZExlUkVuZWxhczFOVnp0Wkhs?=
 =?utf-8?B?dGhSeXkwWlVlRVg1Q1RLWjBGYjFobXo1aDV5cVZDRTRzU3NUejNCSWs3Z0E3?=
 =?utf-8?B?YnVLellraitIVlZLWUt4TTFvZllXZmdVdERsRjRGZ1VLRkc2a05ndkJoU0x5?=
 =?utf-8?B?V0ljM0dvVlQ5T0FXdFdZV2NWc28rKzlyb1RhKzZTWVhlZ1RUSTkraDkzajVC?=
 =?utf-8?B?bmQyaGdBL2hwZEJhNStQeC9HUjJENE56Nnh1cnZMUmE0WU9FSXQ5ZGJsZjFK?=
 =?utf-8?B?U1M2Mk9NckNxay82NCtxS201VFFac3QvTlV6RENyd3BmTVdGaHNmemZUdVd3?=
 =?utf-8?B?dXhWUXFrSDBMdm1OU3BCUm5KcjRNclEwRVgwdzVOMFhYb29GeDJSNFoyL1Z6?=
 =?utf-8?B?dmlEaUdpNjhXMGxsUkwvdWt2UFdsamZmbDExY3I1ZWtWOHBVd3d6WUIxTFFr?=
 =?utf-8?B?ZDBKNm9wdllVVk50MGE0NDl5a3JrYUFWWWlrRW9TVi9raE5GZmczYVp3SlB0?=
 =?utf-8?B?SHliMW8vK3ZxTll6RXp1Zm9WK2k2dDFBWXBmM1ZPQ0U3M2NsQ0NSNWwxSldk?=
 =?utf-8?B?NExaQWZOZDJROEhjU3NvQTB3S3RnRzd0NDZSRzNpS2s4Q3FhcC9wRGZ3dDBh?=
 =?utf-8?B?R1FtZy9CcWVvdHNjbFU5QUlsdUIvRklNU2ZWQjBZNjZ3NEEvTTFTT2Zhd3hI?=
 =?utf-8?B?WWdWK3VQajBMUEhmY1RQVlRqTlQ4Q2NpZUwyQUZleEJ0RUlPQ3I0ZVdKcHU2?=
 =?utf-8?B?enkzU09oSWtOVWdFZkRZdXQwNWxES0R1TFZUMHpvYzV4QzB0clNyVERZSVI5?=
 =?utf-8?B?TTBkWUl4NkEvU3J0cHQ3eEVlSkQxK0hsM1U0dTJIZXZ2QS9ELzBkb3hlMk1r?=
 =?utf-8?B?dmt4K2ZCUW9CY05DR1FsVHBYemp6NHN0RHowdENFeHF2aFlHUnYwcDNmTWUv?=
 =?utf-8?B?blNnMjY0NUVFMjBkcDMvOTdvZGxoMDFwSDd5Y2lZTzIycTlUUGFzZU9FemVW?=
 =?utf-8?B?V2trSmdRdFpQbzBMTFcvZGNkQ0dnNEpOWUZHZ1hkMWhNaXQ5S0g0WC9KRWpN?=
 =?utf-8?B?T1V6cHJJODV6dENIM2NpNERQRFpQTVJ1aVc4VmJzUWVDWHZ5S08yZjBhcWRl?=
 =?utf-8?B?Sm5CZ3p4WnB6cERxMGlqalptckkrcFQ4NkFTWHErU3l6amdYdkVZSEZDdDlY?=
 =?utf-8?B?N1ZDMURTdWVnSE5TWHQxUzF1amc3SVgvckVScFcvejJsNy9CcHNvUW9VNGl5?=
 =?utf-8?B?QWJyVERYZ0xHQUJ1Y2VxUVBCOHpMVXJEUnNVSEpYU1pWUit3STZTQkJmMUNV?=
 =?utf-8?B?VlVteDBHWFc1VHplb2t0SklNMW5oZkNnRFR3SFArU0dNK2E1QnlTdmo2eGlh?=
 =?utf-8?B?R1A4VXJsS3ZObjAzYXhBMHhwRklUTlZkVHhDOTlLTHA4ZGF4NExhMkg3eFlj?=
 =?utf-8?B?aC9QaEFiV1RtVW5xbzE5VnUxczlOWU5USlkydUNjVHVwNGxwbG9JN0xLNlJ0?=
 =?utf-8?B?dnNGeHZrYjJMbzRqZlVjSUI1a2hvRmwvSUlsRENqc1BTdndxRVFTYmVNdEpX?=
 =?utf-8?B?K3d1ekREdDJPakdNNzA4cmRYOEMvRHg1QytlbmlwbXExcDRkbXFwOWhTeXJx?=
 =?utf-8?B?VWtOcG9leFEvV2MzaCt5K1V2cTVkdG5uT1hjOGFPMzFNbW9NTzRLSHN6Rzlj?=
 =?utf-8?B?TWlJb0F2bXV3cWVnN3IwVW45Z29uM2Z6RlNxQjZ2RGdZMXQ5blAvUnNFTU9Y?=
 =?utf-8?Q?1IkNyHE5+ko3UxRc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198d8409-e64f-41a7-2914-08da269f9599
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 09:40:07.7688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ED2fPNahc2f1hsa+tWVUv9JJLMWDpCTNF2o5FAl7D7U6FLqYEW4mSNMAMu+RhjDkrCk7m4jDpoG6SdAFrIBJkmTpo0R+VGgy5v5q1Oj5S30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2386
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDIyIEFwcmlsIDIwMjIgMTY6MDIgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOg0KPiBPbiBGcmksIEFwciAyMiwgMjAyMiBhdCAxOjI5IFBNIFBoaWwgRWR3b3J0aHkgd3Jv
dGU6DQo+ID4gT24gMjAgQXByaWwgMjAyMiAyMjoxMyBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6
DQo+ID4gPiBPbiBXZWQsIE1hciAzMCwgMjAyMiBhdCA1OjQxIFBNIFBoaWwgRWR3b3J0aHkgd3Jv
dGU6DQo+ID4gPiA+IERlZmluZSBSWi9WMk0gKFI5QTA5RzAxMSkgQ2xvY2sgUHVsc2UgR2VuZXJh
dG9yIGNvcmUgY2xvY2tzLCBtb2R1bGUNCj4gPiA+IGNsb2NrDQo+ID4gPg0KPiA+ID4gVGhlIGRl
ZmluaXRpb25zIGNvbnRhaW4gbm8gY29yZSBjbG9ja3MsIG9ubHkgbW9kdWxlIGNsb2NrcyBhbmQg
cmVzZXRzPw0KPiA+ID4gUGVyaGFwcyB5b3Ugd2lsbCBuZWVkIGEgY29yZSBjbG9jayBmb3IgdGhl
IEV0aGVybmV0IHJlZmVyZW5jZSBjbG9jaywNCj4gPiA+IGxpa2Ugb24gUlovRzJMPw0KPiA+IEl0
IGxvb2tzIGxpa2UgcnovdjJtIGhhcyBhIGdhdGUgZm9yIGV2ZXJ5IGNsb2NrLCBzbyBubyBuZWVk
IGZvciBhbnkgY29yZQ0KPiA+IGNsb2Nrcy4NCj4gDQo+IE9LLiBUaGVuIHBsZWFzZSByZW1vdmUg
ImNvcmUgY2xvY2ssIiBmcm9tIHRoZSBwYXRjaCBkZXNjcmlwdGlvbi4NCldpbGwgZG8uDQoNCj4g
PiA+ID4gb3V0cHV0cyAoQ1BHX0NMS19PTiogcmVnaXN0ZXJzKSwgYW5kIHJlc2V0IGRlZmluaXRp
b25zIChDUEdfUlNUXyoNCj4gPiA+ID4gcmVnaXN0ZXJzKSBpbiBTZWN0aW9uIDQ4LjUgKCJSZWdp
c3RlciBEZXNjcmlwdGlvbiIpIG9mIHRoZSBSWi9WMk0NCj4gPiA+IEhhcmR3YXJlDQo+ID4gPiA+
IFVzZXIncyBNYW51YWwgKFJldi4gMS4xMCwgU2VwLiAyMDIxKS4NCj4gPiA+ID4NCj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdvcnRoeUByZW5lc2FzLmNvbT4N
Cj4gDQo+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5k
aW5ncy9jbG9jay9yOWEwOWcwMTEtY3BnLmgNCj4gDQo+ID4gPiA+ICsjZGVmaW5lIFI5QTA5RzAx
MV9JSUMwMV9QQ0xLICAgICAgICAgICA3OQ0KPiA+ID4NCj4gPiA+IElJQzBfUENMSz8NCj4gPiBU
aGVyZSBhcmUgZm91ciBJSUMgcGVyaXBoZXJhbHMsIHRoaXMgcGNsayBpZiBmb3IgaWljMCBhbmQg
aWljMS4NCj4gDQo+IEkga25vdy4NCj4gDQo+ID4gV291bGQgSUlDMF8xX1BDTEsgYmUgYSBiZXR0
ZXIgbmFtZSBmb3IgdGhpcz8NCj4gPg0KPiA+ID4gPiArI2RlZmluZSBSOUEwOUcwMTFfSUlDMjNf
UENMSyAgICAgICAgICAgODkNCj4gPiA+IElJQzFfUENMSz8NCj4gPiBhbmQgSUlDMl8zX1BDTEs/
DQo+IA0KPiBXZWxsLCBJSUMwX1BDTEsgYW5kSUlDMV9QQ0xLIG1hdGNoIHRoZSBIYXJkd2FyZSBN
YW51YWwuDQo+IA0KPiBCVFcsIGZvciByZXNldHMsIHRoZXkgYXZvaWRlZCB0aGUgY29uZnVzaW9u
IGJ5IG5hbWluZyB0aGUgZ3JvdXBzDQo+IEEgYW5kIEIsIGluc3RlYWQgb2YgMCBhbmQgMS4NClNp
bmNlIHRoZSBIVyBtYW51YWwgZGVzY3JpYmVzIHRoZXNlIGFzIElJQ19QQ0xLWzBdIGFuZCBJSUNf
UENMS1sxXSwNCmFuZCBJJ3ZlIGNoYW5nZWQgdGhlIG5hbWVzIG9mIGNsa3Mgc28gdGhlIG1vZHVs
ZSBpbmRleCBjb21lcyBhZnRlcg0KdGhlIG1vZHVsZSBuYW1lIHRvIG1hdGNoIG90aGVyIFJlbmVz
YXMgU29DcywgaG93IGFib3V0IElJQ19QQ0xLMA0KYW5kIElJQ19QQ0xLMSB0byBkaWZmZXJlbnRp
YXRlIHRoZW0/DQoNCg0KPGFkZGVkIHRoaXMgYmFjayBpbiBmb3IgZGlzY3Vzc2lvbj4NCj4gPiAr
I2RlZmluZSBSOUEwOUcwMTFfUE1DX1JFU0VUX04gICAgICAgICAgMTANCj4gPiArDQo+ID4gKyNk
ZWZpbmUgUjlBMDlHMDExX0NTVF9OVFJTVCAgICAgICAgICAgIDExDQo+ID4gKyNkZWZpbmUgUjlB
MDlHMDExX0NTVF9OUE9UUlNUICAgICAgICAgIDEyDQoNCj4gTWlzc2luZyAoc2hhcmVkKSBDU1Rf
TlRSU1Q/DQpBY3R1YWxseSwgQ1NUX05UUlNUIGlzIGFscmVhZHkgZGVmaW5lZCBvbiB0aGUgbGlu
ZSBiZWZvcmUgaXQuDQpIb3dldmVyLCB0aGUgSFcgbWFudWFsIHNheXMgIkNTVF9OVFJTVCIgaW4g
Ym90aCBiaXQgMCBhbmQgYml0IDEgb2YNCkNQR19SU1QyLiBJJ2xsIGFzayB0aGUgSFcgcGVvcGxl
IHdoYXQgdGhlIGRpZmZlcmVuY2UgaXMuDQoNClRoYW5rcw0KUGhpbA0KDQoNCg==
