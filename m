Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 404AE6EA7A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 11:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjDUJ4l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 05:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjDUJ4k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 05:56:40 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC7C1731;
        Fri, 21 Apr 2023 02:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bStY6rjaSHhgFhDWHyk5FhBkCCfVJK4VkQ7+nOXHZPeCcZsICYGVCegZAPH/grKnA1aPHXasHupnhb00hgpd0AYMVBXGNw0FfbcDILp8zb8YXEes2rfHD16RjSIaliBSf5aSeJAEr3f0aL7QPDCIk3yigNfUpe3rEuE8FmyCpCiWatWWYRBasIqlfTFS+7QXfvA6wButpf1LLrA+CEyBrrSJ6nt62BPcm5299Sn+XrTxPhaskYNu2SaOYR85I62eFGjrrDa3QYdPTJtvPdtbeEZNZGgwYGLtE05Wu06LDrUCMcRKT1A+sE46lEbHrMEprEMaykmaBhWw2DDMvvmmhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0c+P7ZWdf1LXMpEKXOsa3RIgZ+cQoDxD781teljnkg=;
 b=jE7KsO2L7eYY1HksCul5yW67qaPGZsnReeGi7/ddox2njpqH/CQoSwTLAhPPrq1GCH+RfT1Ki/xLlO1mZjnxahq40paYcj+LWfaDjCiYbOnQZlOa35nNOcQ40RZ7ALJ9av61kkbUwUe+ls8osrvqxNS7fCg4l8M4URQY6ATq3+cm/tfl4wL2h0Jujvtyld9vI1qqtIZ5QvEokgp3uu8EHVH+9nWI1hUITkdnc96WTOJ/xaT/gP4BMrVL2FzVC21BJeJP2hQFBgu4cbVQ+mu0bwPBVA0LmUETzWTfKSsg7v0BYgAr3V6bnsMLohGJnJdDeg4xq9Nsbphq6UC5rzWixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0c+P7ZWdf1LXMpEKXOsa3RIgZ+cQoDxD781teljnkg=;
 b=gOmr4eoyH/SPwfnXrPOjggQ+0S5UbJ0EN+hMUhPKDOLe7Fzdl27XfLvxbtmBZYH7dPg/AIOv+kxh5Pwr42GtUKRRYeHCXBjHkSXRI2ONWrHrumcWeFpBgPqRveT5GWxtGgKfsiyKdWU0MduchM1VXC3vX8i39IMcet+DhUR8B4I=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10542.jpnprd01.prod.outlook.com (2603:1096:400:303::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 09:56:35 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 09:56:35 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 1/5] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx
 support
Thread-Topic: [PATCH v4 1/5] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx
 support
Thread-Index: AQHZbU4z4dLath+5m0ykLV3bkEmC1681iuwAgAAIMSA=
Date:   Fri, 21 Apr 2023 09:56:34 +0000
Message-ID: <OS0PR01MB59220F311276F8C09603A1AC86609@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com>
 <20230412145053.114847-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWozy3JLxomwv44aqKFGavC5zyeX6RY7rraR=+CcaB11w@mail.gmail.com>
In-Reply-To: <CAMuHMdWozy3JLxomwv44aqKFGavC5zyeX6RY7rraR=+CcaB11w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10542:EE_
x-ms-office365-filtering-correlation-id: c8ab9a0a-f753-4b8f-13e9-08db424eb12d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UPLDzY1UqbeV3B3Dxv/2KZyVDXi4i+ywaZqdsb4NcwBsYncd3t5QfUUSDgnCyRYMAznELRt1dQW3ATY2peH/3eGOLN44ols+88b/1VjYAVKPVZGMCAoIzYxVyENAC14MkVR87SXWUziQGFtlZtYVnTe5CcrDKSavsOW4yleQXHnE8/XdS03++OMIsFz3Q0jMJ/RDIdPs6etvkG1qeypdnrqxlubk/rhguTXczPeUxnTKVy89JOIhM0848kgGIsSj4X1kfsYgSslO6mZU7vyihvn3lqGWpL6UUVAqEcApOtnR7YjIJANCvHXG8a7ukrj3u+O3UvrZgaj8/KE4r44NF/uRR9QRNUfR+UdH50PJteuKKRFKZ0wkDttkp+swjjh16ZFV6evCORjuxzbCmIlYdeazDXI52sarpl+S4QIWmFkiWPpiZpR/acyW8uhQY/8TOugagfJMPtQHhv+yD095Ho6pzYsV4kBmDsx/hb4LK+ksM7iqsuJYfaKbxbvWoS4vsFRFjpAXNfKHv8nG6KIWW2APoW95z+WHsGgJ98chnc4SsLYS+1QI0HipVjQSTC7oNN5VGM4sLH1GYoRQ9LxDrel/lYTsIKkvu/tXY+nPfMc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(33656002)(2906002)(86362001)(38070700005)(38100700002)(55016003)(7696005)(9686003)(71200400001)(186003)(53546011)(83380400001)(26005)(6506007)(966005)(478600001)(66556008)(66476007)(66946007)(66446008)(6916009)(4326008)(64756008)(52536014)(41300700001)(76116006)(54906003)(122000001)(316002)(8676002)(5660300002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVdKMHNXOVhjeUQxVnlQT0xJSnVITzRvUFcxUHVjREVaaC9RYnFOd3JyRWUv?=
 =?utf-8?B?dncrd2UycGl4WmhtaGcraml2V2hUbGoyWVEyVThDakVwcitZMVRhRXVFVG1l?=
 =?utf-8?B?dUNQTlk0UUJtKzREVkZEaXJDbjMrNU1nYnZFTTRTZElhcXpTMHpDVi9XbGdV?=
 =?utf-8?B?d0dqNG14SWo5K2lUU0IyRTljQ1QxRVdrbUV5Yml6dVBRcnNnODdXY3JPTitC?=
 =?utf-8?B?dy9ZUldtQlIyaDRkYThhdno1NTlrSUpxOGlNZmNNeEFGZ2FzYWZpR21YT2Mx?=
 =?utf-8?B?RTJsK0ZJSm5rZFhJTG50dGRkVC9saVh1UWZYcFNacUMzUktPV3Urb25adEQw?=
 =?utf-8?B?bElFVlRFbDNEZFhKQlB1cUhCblBKb2VydzVQMVVWRlZSSXIzWmdkNHNyNHZV?=
 =?utf-8?B?ODd6Q24zYlQ4UUp5bmYrSGQxN29mV3ZWNGlNK1VMTm4zUk1wYStMVCtENXgw?=
 =?utf-8?B?SGdldWw4Q3NkSmI5SWExd0Y0RGc2QWhBUUZuTzJRbTVKQjdOeGFmLzhZRFJw?=
 =?utf-8?B?akVLbUhMT0FHcnliWUt0aUFOdExNQVd0QVEvc0VWQzhIeTZSaEpMNlZLWC9u?=
 =?utf-8?B?Q2pneHNYbE1MZjR5cnJEL0Q2SU10UERWYkFlYVBtUHZHdmV5VzJLcjVrNGxB?=
 =?utf-8?B?aGNmc1ZJeFJQUUdQSGRJL2g5Nlo3aTBnL21QMHlHY3ZsM3RVdS9WOU5lQjVy?=
 =?utf-8?B?am1yeTVjMkNhTmZlYmJVMkgrZHd3S2VkZ3h3L0x1U3dlMDNJTE5nQlFhVjdO?=
 =?utf-8?B?Ykg5S1lKZFgranovU3dTK1RtOVZVVWF1UFNHYW5LSk5SL1BHNkhWVkdDUzE4?=
 =?utf-8?B?aGZXQk41R2NsanB1b0NVNStoWlhIaHBUQ3crcy9PNElweFVFcnV4bHE1b0Fj?=
 =?utf-8?B?OWcxakFoRVVPZnRlTFFOditZZkgzbThwRkNVc3VzL0p3a09aWGVzQWF3aHN0?=
 =?utf-8?B?d0lIb1JkR1oyMUxsMGVNL05XZzQ1aWFDcGRBdnV0UzRpTlR3YTlHRi9ySG9K?=
 =?utf-8?B?TENsNkZoNFVnSS9QTUlQMk9sSXBkcFJLeVJOandzdHVVTVltQmJYY2hqYlRl?=
 =?utf-8?B?Y0tMQldyK0FmWlhoQnN2N2lpWXhvWXcrSzBhMFZSNHdPL0hjVHJTdXdPdlhJ?=
 =?utf-8?B?VXFZVDlGRStJRVZ6ZDdWYjgwRGp5V2NzVjA1NzY3SkhUWVZ4d00zTGhXdHZp?=
 =?utf-8?B?NkJJbG1CNEgyQ2gzRy9NRUQrbzBTN2FYaEFtUDJYT3JwZktDZXJUWHpVUFJl?=
 =?utf-8?B?akN1OFNaQmJONlNuT3Q3WkQ2bmpHT2dvUXBhWTdEM1VrVzVYSlJGUVJ4TFRs?=
 =?utf-8?B?Y0diTjlYMy9jTDhrMUEyZDZteWpYZWg3UzF2UklTMHp2Ym5IYnVGeHkzTVAx?=
 =?utf-8?B?L2FoYTVkMFJ4b3poT2l6ZEZLRE83V3BnVzVKWTdKT1BBcGEyNnNHZ1RNV0pX?=
 =?utf-8?B?SkdKbjBlS3VZNkhndkUxQWJya0IybFFnY3pwNHpLUTBBa0syZ0xJdHhFTHNI?=
 =?utf-8?B?bm1VZWZjTlpPY2NxUzR1RWw4VVdkZTFvbEJyK3g3VHVBQUhneWlQWjJZZ3JH?=
 =?utf-8?B?OGN2Zzcwa1pMdWdMUzNzeEVTUlJlYWh4K1QwYitHK1Fsb3VzSHZOamxpNjRE?=
 =?utf-8?B?UWE5b0l2U1FnVFF6U1hhWmJ4V1hIME1rTzdTbWphWmhJSDJ6ZHNUWjUyRFdX?=
 =?utf-8?B?cng4WVFsaUhGZUZ5WDBERFNmakNJR1pYMEZwVEp4MXMvVjlDZlpKSXpRL0I4?=
 =?utf-8?B?N0xVOEFMYW5EWnRHNTdOL1ZSWTFrWEVMSDQxRUd1QXR5WFAwZTVlWTFFL0g0?=
 =?utf-8?B?TkdRaEN5MlJWUDJMc240SFJ3MmtESDlzZWE1OW9WSzl5SEY3YktpQjdzQzhj?=
 =?utf-8?B?a21MNUc4NXgxNTM4UEVqWFRkSFpHMWVOblZueHc0S0huT2lnM0p3MXRvZks5?=
 =?utf-8?B?QkNYZzBSU2E3dWxRRGNoNHU3RVNRY1FiN3V6MmVQS3Rua3BTZXZuZWV1WTYy?=
 =?utf-8?B?QlFJYlRoOEpnaWlFNFhOK0tObEhxU1ZROVN3TmRwbE1rOUs4cFY5OEZCa2VP?=
 =?utf-8?B?RWVCUlRXcXZBL2dLWmYzVWlhRFBBWjdEN3hZL3JFY2FlaXp6SFluN0pnUGRx?=
 =?utf-8?Q?NCdX/uFRemn5JohrR/2AdGqKv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ab9a0a-f753-4b8f-13e9-08db424eb12d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 09:56:34.9930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YX7jL/jC6SsNFLuckaWgI/T47UTRSA2KFgPj31YWjwRgSyvG8gWWY6XeFlU9y55NonGOmeJlU9rLAP+8AohZjvD+mia9rOygDT+fqGlGfJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10542
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBBcHJp
bCAyMSwgMjAyMyAxMDoyMiBBTQ0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz47IEppcmkgU2xhYnkNCj4gPGppcmlzbGFieUBrZXJuZWwub3JnPjsgbGludXgtc2VyaWFs
QHZnZXIua2VybmVsLm9yZzsgR2VlcnQgVXl0dGVyaG9ldmVuDQo+IDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT47IFByYWJoYWthciBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtDQo+IGxh
ZC5yakBicC5yZW5lc2FzLmNvbT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEvNV0gdHR5OiBzZXJpYWw6IHNoLXNjaTogQWRkIFJa
L0cyTCBTQ0lGQSBETUEgdHgNCj4gc3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdl
ZCwgQXByIDEyLCAyMDIzIGF0IDQ6NTHigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+IFNDSUZBIElQIG9uIFJaL0cyTCBTb0MgaGFzIHRoZSBzYW1l
IHNpZ25hbCBmb3IgYm90aCBpbnRlcnJ1cHQgYW5kIERNQQ0KPiA+IHRyYW5zZmVyIHJlcXVlc3Qu
IFNldHRpbmcgRE1BUlMgcmVnaXN0ZXIgZm9yIERNQSB0cmFuc2ZlciBtYWtlcyB0aGUNCj4gPiBz
aWduYWwgdG8gd29yayBhcyBhIERNQSB0cmFuc2ZlciByZXF1ZXN0IHNpZ25hbCBhbmQgc3Vic2Vx
dWVudA0KPiA+IGludGVycnVwdCByZXF1ZXN0cyB0byB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIg
YXJlIG1hc2tlZC4gU2ltaWxhcmx5DQo+ID4gY2xlYXJpbmcgRE1BUlMgcmVnaXN0ZXIgbWFrZXMg
c2lnbmFsIHRvIHdvcmsgYXMgaW50ZXJydXB0IHNpZ25hbCBhbmQNCj4gPiBzdWJzZXF1ZW50IGlu
dGVycnVwdCByZXF1ZXN0cyB0byB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgYXJlDQo+ID4gdW5t
YXNrZWQuDQo+ID4NCj4gPiBBZGQgU0NJRkEgRE1BIHR4IHN1cHBvcnQgZm9yIFJaL0cyTCBhbGlr
ZSBTb0NzIGJ5IGRpc2FibGluZyBUWEkgbGluZQ0KPiA+IGludGVycnVwdCBhbmQgc2V0dGluZyBE
TUFSUyByZWdpc3RlcnMgYnkgRE1BIGFwaSBmb3IgRE1BIHRyYW5zZmVyIHJlcXVlc3QuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gLS0tDQo+ID4gdjMtPnY0Og0KPiA+ICAqIFVwZGF0ZWQgY29tbWl0IGRlc2NyaXB0aW9u
IGJ5IHJlbW92aW5nIHR4IGVuZCBpbnRlcnJ1cHQuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRh
dGUhDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYw0KPiA+IEBAIC01ODgsMTIgKzU4OCwxNyBAQCBz
dGF0aWMgdm9pZCBzY2lfc3RhcnRfdHgoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCkNCj4gPg0KPiA+
ICAgICAgICAgaWYgKHMtPmNoYW5fdHggJiYgIXVhcnRfY2lyY19lbXB0eSgmcy0+cG9ydC5zdGF0
ZS0+eG1pdCkgJiYNCj4gPiAgICAgICAgICAgICBkbWFfc3VibWl0X2Vycm9yKHMtPmNvb2tpZV90
eCkpIHsNCj4gPiArICAgICAgICAgICAgICAgaWYgKHMtPmNmZy0+cmVndHlwZSA9PSBTQ0l4X1Ja
X1NDSUZBX1JFR1RZUEUpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogU3dpdGNoIGly
cSBmcm9tIFNDSUYgdG8gRE1BICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZGlzYWJs
ZV9pcnEocy0+aXJxc1tTQ0l4X1RYSV9JUlFdKTsNCj4gDQo+IFBsZWFzZSB3cmFwIHRoaXMgYmxv
Y2sgaW5zaWRlIGN1cmx5IGJyYWNlcy4NCg0KSSB0aG91Z2h0LCBmb3Igc2luZ2xlIGlmIHN0YXRl
bWVudCBicmFjZXMgbm90IG5lZWRlZC4NClRoYXQgaXMgd2h5IEkgaGF2ZW4ndCBhZGRlZC4gQW0g
SSBtaXNzaW5nIGFueXRoaW5nIGhlcmU/DQoNCk5vdGU6DQpUaGlzIHBhdGNoIGlzIGFscmVhZHkg
YXBwbGllZCBvbiB0dHktbmV4dC4gSSBuZWVkIHRvIHNlbmQgYSBzZXBhcmF0ZSBwYXRjaCwgaWYg
YnJhY2VzIGlzIHJlcXVpcmVkLg0KDQpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvZ3JlZ2toL3R0eS5naXQvY29tbWl0Lz9oPXR0eS1uZXh0JmlkPTg3
NDkwNjFiZTE5NmI0MWE4NzRkNzFjMDczYzAzMTcxYmYyNzQxYjINCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo+IA0KPiA+ICsNCj4gDQo+IFRoZSByZXN0IExHVE0sIHNvDQo+IFJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gR3J7b2V0amUs
ZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gDQo+
IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UNCj4gdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
