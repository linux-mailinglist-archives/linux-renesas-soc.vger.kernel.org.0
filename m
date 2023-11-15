Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D39237E9B5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Nov 2023 12:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjKMLr0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 06:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjKMLrZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 06:47:25 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1682ED6C;
        Mon, 13 Nov 2023 03:47:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFtu1SwQmiTFISMZKqMoBYrZTJMuKKNwu4RQqzHZvpAAM0wb3ZaQT5LK+KFBFEuu5oF6+s1igPsdUcXXkUxGvw2dBiRk4agGyjiqHiP2XXrbuSDYn/tj7bfZQ7e1lQrgQFluNN31BdK+hvzvfChQLAN9GPhpWFWh/9sXvYar3Na1T4i3p0rxs+8AkMEowK0TEvopHpE9JBLy9tbB6MJEBZDcQYEbeUmAnxnrlF6IMWdwsaJrFng3fpO9uNkbsNA3dXvZWXYoGLzaizdS3B+Ig6tM83zBamZxsjZl8tl5a1uSmRyJTxymXymsz8WnkFuzUk+wDYlz22FZ7o8ZG31TkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKIrkNxftYGtwcxVfhCgAd4xnbwpse0KXc8PIvuCc+g=;
 b=kBECME596w6O8dGDgDaICO/gfCtOrCWJGDo12I21KQKt2nsVFBF5thJfpq3ijProJUxpc21bBykVHmp2SwO+QhHGSeX18OQRfdqDrlJc8N1E7d7/YfAXZss37Lgeh2xu3VOFsi0bKbK9rAthyazf5OYROcpx3QQSxE1pPHLJBNsYkxb+BBu+Zs9FTL13mJyacvRA4i1s+pYpFyv/veiqQgLeaiT/RSw3ox9n9zpGyo9cXI4WHgamn63vV5D1g+Uxl7W2rKQof9EclDtBVFYAxQooYrJVk6SggfK3nrMVLXI8a1ikXhxqiHKpo7YaeRoeBHQPA+jKo0ouUIbgelZG8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKIrkNxftYGtwcxVfhCgAd4xnbwpse0KXc8PIvuCc+g=;
 b=CDtDtSIKSpJeMvcmmrLPcVJXpJMY+IDy9TZXnJ96PS9MRU93V6HLvyPNeIPQoL6DjYu5bh7l59xiuOKABvM+hF+w7ExLrV0BTQP/9rsv2Ew63Hj7EQYvVgPNY7O8GMViVlL5VkXoP9yzc0c3jx0u2KftnwXOpEgtHiC0Upk0NBw=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB5856.jpnprd01.prod.outlook.com
 (2603:1096:400:46::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 11:47:16 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%6]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 11:47:16 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>
CC:     "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "minghuan.Lian@nxp.com" <minghuan.Lian@nxp.com>,
        "mingkai.hu@nxp.com" <mingkai.hu@nxp.com>,
        "roy.zang@nxp.com" <roy.zang@nxp.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/3] PCI: dwc: Improve code readability
Thread-Topic: [PATCH 0/3] PCI: dwc: Improve code readability
Thread-Index: AQHaFdFZE9Ce1zVW+UaSH+2OKmpsyrB4B0UAgAAQLQCAAApcIA==
Date:   Mon, 13 Nov 2023 11:47:16 +0000
Message-ID: <TYBPR01MB53411530E01A90CB525DF814D8B3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
 <20231113100914.GB1583963@rocinante>
 <CAMuHMdVLmmf12KPQch7fT2iGjfDV--M2Wd0zsxSw6wfqYxUggQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVLmmf12KPQch7fT2iGjfDV--M2Wd0zsxSw6wfqYxUggQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB5856:EE_
x-ms-office365-filtering-correlation-id: 4ae72a57-6480-4e56-bee5-08dbe43e490b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uWKsF58p6wZgM0YlIhytsxAA0z2hdxxxAzCefainsYlUUAaKjhtowYI0Wxbyr088s5dWeRy6WvXII/5X8LDdMIqQN56e88qe3KYEjGQMjvwg498D9VBADsmENqiS0bnIzoLNNNJFr2nVKScjpbRnF/Y/znzn/OmCOfS0orhAYS2Pu53+ILD/2cTmDSRGiPz3dDxI7ZiutFUSOCBFZU/skiAiTy4tlfzBYuf7QR686WqgeEm57rVIA34lwmFik3zcPmHfRig1LxDQ/HbBVdOoV5kSMzw0aajiGk4JlI5VW8ABopSAeXGTm5jlJFvdcI/g/mRv9A70m0PFM5CX/1bcWzuWCnjZQ86rQygduBFULzprYBPb6AfEX1NFqbk49wCGEn6MgAEtBFUP03x5vXxW178zYe1RZOVmcDahTjfEBOr0qlq1UrR4IlGoKfRKHVED0R4KyaByR8wKe4INuGIHV37ro7V7crQQNtnU/KrD9GlwO4Q7pPqJojiAVyI3TRJ7tQUdWO8+MrQUP2bunqrVHuoll5rNOqhFIhqwKs2IXWaxflH71B3FIR8t++1TvdR1ImiU9dztpP4MR5NvmczWaZzYoLs4FxHxUkwfhnWk5FeFMDiOMhTFBKt3sjO89EaLGmNER1p5oV3I1YIT+7JoXZlKzKK4iSwPch+zuTlj+S4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(1800799009)(186009)(38100700002)(86362001)(55016003)(478600001)(110136005)(76116006)(316002)(66946007)(64756008)(66446008)(66476007)(66556008)(54906003)(2906002)(52536014)(7696005)(6506007)(41300700001)(71200400001)(122000001)(7416002)(9686003)(53546011)(5660300002)(38070700009)(83380400001)(66574015)(33656002)(4326008)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2FYM3VtejRvWGtBZDBPNm0zSlpORzh3K1hSVlFTQW15cElDSWh1NWdsbDVZ?=
 =?utf-8?B?alozNVE1d1pQWDFOd1M3Mkl3RzBwMFVTbXFrL2oxY0pGekpqaXI2eCtGS3Bq?=
 =?utf-8?B?RnM0cm80dW5SM1QrZDc2NjlLcHdtUUh3bUF5S3huL2Y4d0QrbElNQ3pQdFVJ?=
 =?utf-8?B?eDZpcU9NWktmTkpYbU9YQ3Y4d2dlNzNnTXlldE5TRHIxckNHNWRvc3RYWWJO?=
 =?utf-8?B?dmNlaGxzb0tBTVg4NC9GZXBMQ09qaWN3YmIxUDh0WGhYdmZLaFpjTEJIaitT?=
 =?utf-8?B?c2hkSU81WGJZcHBXNndKQzdXWHhNOUJ5RHJtTS9QTmRnSE1FZjBpb3NFb2hi?=
 =?utf-8?B?VXBhTWZEd3FoOHZuekdoMXBNK3psSTRTazlmbVZUNDJrdUZMc1Zpbm11eWZ2?=
 =?utf-8?B?WlppZHdVVlpSUHlTSm5pQWxuVDFTTzdLc05pZUZ6QldBSjU1Mmp0a21TYUVN?=
 =?utf-8?B?ZVdrRlduaUlhRXpWUkwrZzZieDlLQXFNMFRFN04wRVlaMFpHVU5Yb3pPa2t2?=
 =?utf-8?B?blFpY3YrdjBsQWcvbjZGNzJOWmFLODIrL0IxTUlMWUZtblJVWmZMQ2h3cVZB?=
 =?utf-8?B?Q2VkczBTellNZWJuRTB3UVI0YW9kbkUvMXQ2V3hrQ0ZCRjczbExTeHFBb3Vi?=
 =?utf-8?B?L1FOUGx0QUVIOXpKdnNQWC85Z3U1bFUwTER2cyt4MGp4NU5jWUZYM3kzU1FG?=
 =?utf-8?B?NnNBVldrajJ0Zy9jeUFpTEVrYlZQcXozSzhOWFRwVlBYMURKc3JZdlkyaVpH?=
 =?utf-8?B?Ri9SWmw4SGh5WVp2MHJpdFRNWDNIanYyWlJjTGE1U2I2dlUrY3REU3dXU0ov?=
 =?utf-8?B?SXNiRDVnVklKOWZJQVZuTEE4SldSa3oyL1hhNGQ5QzRDMXV5dFE2djVtdG1a?=
 =?utf-8?B?YmFkM1N1d1diR09QaWtZQ3BPdVA0d0RLbUsvR29uU3drSSs0YUtDd1RHZ2tZ?=
 =?utf-8?B?OEZrUE5hdjd6TUVXUWpVSmVab2xrQ1Z0SisvQ2RabzdnTk9RYlhNZlJWOWYr?=
 =?utf-8?B?ZjYvSStZL2tQaVJwK1FmV1Zra3hWejU4R0hPK0FyK1g1UXJWRHFaL0JURzVu?=
 =?utf-8?B?YzdoeFJhQ1FRbjgxT2tXTjJHUUc3dS95TzdYOWR0UXVpMTl5RGdLL3VVZjlI?=
 =?utf-8?B?WldkZUpLNk9RMzNPYng0ZFFzMXQ5cDE1UUVaYXBVSFZsY0xWR3pDVWtjZ1gv?=
 =?utf-8?B?aXpwdXhrOFpjR0ZvMmIzT01IOEhtSGI3QjRSMEcybTc5SkNPTzVVZy9lQ2cv?=
 =?utf-8?B?alRkMEdJNnhFYTJIVGZmNXFiRVVxRDlkN3c1WjBQQjgydXBRWEtHbXJ3ZnU3?=
 =?utf-8?B?M0luTW40RGtsaEw4OGNXNUdMVXNJVkNuN1piSk5vb0hqNE5lRElhdXhOVmxu?=
 =?utf-8?B?c2k3STJtYzFYcCswREZwOTYxZFZlcUZ6RzBySXhOMjVFN0xDdDMwTy9UbXpx?=
 =?utf-8?B?MEJQT2p6b1pnbUQ1UTBSNXpETnZlRjQ0WjBPeE5ieko3NWswaVovcFBBK1dV?=
 =?utf-8?B?VXBBRklUUGtVMlR1ZjRGbnhpNmJXREJjTVlwY3RKMWY2cUN6UDVwMXVRODRM?=
 =?utf-8?B?QWNvR0pzVkRVcXhRRnBMSGQ1RmVZekVtOHdSQ29lQnZiYXZkajhxcllVUkNn?=
 =?utf-8?B?eEJQdHE4ckNqMGgxbUFpbWtTM0xsRUJSc1JzcUtQdnFub3IxQUl1TFQ2eFBw?=
 =?utf-8?B?S2YydURVY2dQTlNwL1NNTE9yMVBqNVpiNm5rY2JXQTFtaytRSER0SkNwMzNF?=
 =?utf-8?B?ZEhuenRoS2FxZVlPdGUrNFFyUzIxOG4veExTZmxackNGb3ROU2xRbExEWGs4?=
 =?utf-8?B?c0dMbjNnbkdUK1REekRxZHFQNnNWN1RaZDdoRDlvKzV3Y2d4Y2lHaHJZenVG?=
 =?utf-8?B?RkZKeTl3SkN2emlDVWlCeUpzaUVPNi9hdHQwSFM3UEluZFZENC9neTlMdjAv?=
 =?utf-8?B?UHNSRjFJeHY5VkRtakdZdjFCVnJ1bllJWEhSanI5WFZjcW1ydnRTSWpBeHpk?=
 =?utf-8?B?ZFJCWUlkT2YrUEdwL3p6UEc4OVZudTNqTWhmd0ZZSkZJT0FqYnBKelRHNGxp?=
 =?utf-8?B?ektoMmo0elc3L0NwdGtKLzRLS0ErR2lSUHlxT1lGMWNoTDNFZmZQSFF2Wm9r?=
 =?utf-8?B?eUk4V21Pd2lNTDNZa3NkODFOY0Q1NkY0MkNJbDF0dzVYR2dpa2sxdjgwSm53?=
 =?utf-8?B?Q3VnS0gvT2tIWG1OOHMzdElQSWIwaGlXSldjV2dybkgyaUdhdWY4bitDdFUv?=
 =?utf-8?B?T29pTGk2MGR0YWJvd2RKaStKYm53PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae72a57-6480-4e56-bee5-08dbe43e490b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 11:47:16.7262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZchsWnDd+AjDM8hxvl2k4KsNDwLRNWfFHPSxc+6JFL032Ru7jFksZJEDL4SA2VVd57/8bveDmUcM4VNenOuYEGBZC78jMoF6syY8YcZJl3AKIlLP/zNYNm1lFLM+AOmC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5856
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mLXNhbiwgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZl
biwgU2VudDogTW9uZGF5LCBOb3ZlbWJlciAxMywgMjAyMyA4OjA3IFBNDQo+IA0KPiBIaSBLcnp5
c3p0b2YsDQo+IA0KPiBPbiBNb24sIE5vdiAxMywgMjAyMyBhdCAxMTowOeKAr0FNIEtyenlzenRv
ZiBXaWxjennFhHNraSA8a3dAbGludXguY29tPiB3cm90ZToNCj4gPiA+IFRoaXMgcGF0Y2ggc2Vy
aWVzIGlzIGJhc2VkIG9uIHRoZSBsYXRlc3QgcGNpLmdpdCAvIG5leHQgYnJhbmNoLg0KPiA+IFsu
Li5dDQo+ID4NCj4gPiBUaGFuayB5b3UgZm9yIGZvbGxvd2luZyB1cCB0byB0aWR5IHRoaW5ncyB1
cCEgIE11Y2ggYXBwcmVjaWF0ZWQuDQo+ID4NCj4gPiBOb3csIHdoaWxlIHlvdSBhcmUgbG9va2lu
ZyBhdCB0aGluZ3MsIGNhbiB5b3UgYWxzbyB0YWtlIGNhcmUgYWJvdXQgdGhlIGZvbGxvd2luZzoN
Cj4gPg0KPiA+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1yY2FyLWdlbjQuYzo0
Mzk6MTU6IHdhcm5pbmc6IGNhc3QgdG8gc21hbGxlciBpbnRlZ2VyIHR5cGUgJ2VudW0gZHdfcGNp
ZV9kZXZpY2VfbW9kZScNCj4gZnJvbSAnY29uc3Qgdm9pZCAqJyBbLVd2b2lkLXBvaW50ZXItdG8t
ZW51bS1jYXN0XQ0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXBvcnQhDQoNCj4gPiBUaGlzIHJlcXVp
cmVzIGFkZGluZyBzdHJ1Y3RzIGZvciBlYWNoIGRhdGEgbWVtYmVyIG9mIHRoZSBvZl9kZXZpY2Vf
aWQgdHlwZS4NCj4gDQo+IFRoYXQgc291bmRzIGxpa2Ugb3ZlcmtpbGwgdG8gbWUuDQo+IEFuIGlu
dGVybWVkaWF0ZSBjYXN0IHRvIHVpbnRwdHJfdCBzaG91bGQgZml4IHRoZSBpc3N1ZSBhcyB3ZWxs
Lg0KDQpJIGNvbmZpcm1lZCB0aGF0IHRoZSB1aW50cHRyX3QgZml4ZWQgdGhlIGlzc3VlLg0KSSBh
bHNvIHRoaW5rIHRoYXQgYWRkaW5nIGEgbmV3IHN0cnVjdCB3aXRoIHRoZSBtb2RlIGlzIG92ZXJr
aWxsLg0KU28sIEkgd291bGQgbGlrZSB0byBmaXggdGhlIGlzc3VlIGJ5IHVzaW5nIHRoZSBjYXN0
IG9mIHVpbnRwdHJfdC4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBH
cntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+
IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
