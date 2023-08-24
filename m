Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E6A786B78
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 11:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234792AbjHXJVR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 05:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbjHXJUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 05:20:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433F21FDA;
        Thu, 24 Aug 2023 02:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwvUOJNgCa2Mg0cVSlUe4LJ3I3r4zEypqeT85kiSPYUmuKkp8NU5uyPMOBZr48/46algaNHKqMWrIAarIBjpWVVN1TO4Ab42iduKftJIqmAFribp0LnT9wu7Pwy2zxJMAC5JH5oD8w+6A+eLBgG+2QM7SjNHzKHKjgiKGvzCqrEJSIa0AC14Ik7h+pRKLZyYXvkvytbdqGw8w/ZEjpVd1dZvkVmLUKphigDzoYjKgZRK5TEasFsZGELY+lGhxCmZjUH/6eJg4bvH0EiotDrADshnqaxdd5RazADkPiMyljSaM90MvrTWgV69v18s54/6ajE+e88MuMIMMo8wp17o+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/QqqFC6jALnTsbdJUNnH0o+RWNQkcmmv/Y/cjNlW/M=;
 b=feakVrmJY83yaVGZdAzKEA7zZfwZ+OnnwBK1e+62jKJtwADOAv6r/bNqF5riQh0MNJEljN0qMjxyplQ+0rZa6OnRGiR4ihLjxCDJKR8+US1c0V1W7kTTgTr1zwdVcKekll2my8+UWit1jAqQN44slM1hHErlDj6CPBI+KMO2ZyuB3BWxbSmrBoWqwDLcAjq0m1hqkYPADIIb1cQkpMihK5g/t1d67lStzGwt1ZAKHklhGdaJ8mxa8yk1RLY+0vgErMc9ZyuLSWCvOQ9qUYFGT3/SUXI/vVkmAJqtmrlRLC5Tqxa+fzdtCD9uJF2cWVMojZNVMJIsa6dt1Ny/JxD3lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/QqqFC6jALnTsbdJUNnH0o+RWNQkcmmv/Y/cjNlW/M=;
 b=tXjtw+CXpGJ2xvJpnNDxpz/+5VX9BGYr2f8XlpXR3X/zXWcwpAN8o/Qeb+GzqgDD2L3BNpV/BT7CJYd6vssfSSqZqeEwEMPR2epN7JqgWnLZ3utoh5SCDEjrYLO2xpAfSlBKyJn1jn9p0uwaEEVhRwmNH2kg5zWtnHXkmyT48Gg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9374.jpnprd01.prod.outlook.com (2603:1096:400:1a3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Thu, 24 Aug
 2023 09:20:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 09:20:06 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 3/4] clk: vc3: Fix output clock mapping
Thread-Topic: [PATCH v4 3/4] clk: vc3: Fix output clock mapping
Thread-Index: AQHZ1mSFL5p7PNApFEqpyrj0ENw8/6/5HvqAgAAL16A=
Date:   Thu, 24 Aug 2023 09:20:06 +0000
Message-ID: <OS0PR01MB5922249F5000425F44B6A075861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230824082501.87429-1-biju.das.jz@bp.renesas.com>
 <20230824082501.87429-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyb0rt7T82h_wS1jCt=U-1o6tS+B0AgMTHgyBbkEi5eQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUyb0rt7T82h_wS1jCt=U-1o6tS+B0AgMTHgyBbkEi5eQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9374:EE_
x-ms-office365-filtering-correlation-id: de6e6361-aabd-47ee-ccdb-08dba4834e2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6bBK6SnIWz0s+Rkq7kyoGZemTYx3AHM/euR8gDqUnqfoLlN9VjNNxfKstrVkcOQAIUb4+q2YJDdVgTlUuj04Ae9bN/cpXDcsz7o3jzUYemhNqXqATvy4xdArDxL2h5Es41d7AVLHdN0/w66OiVjCdgbSN7DnnwQqMGY7Ds/+/sdq06vgi0nWoU3Q5u2S5NIXv+QgveJWmElN120Tqmk0ykyLHPW31QABW8JQsn46VP3x6kyHys9nZ7XfuT5m2yv4/cZGa+qZStKqxFwtYULQxtD2R4iKaody9LSfKJ4OQtT+3mLC5orkSRg9l2fyQ6MEm/WnH5lNenPll19MWduXeYT/0YyDSlip7+ruKgAj8O1qErFWKuMu5lSU1JkDEqfxtk1O1aUOMP3Jq5pSsMfKs0as9GyMDg7DyNZRqWNcVaUmyTh8AWNPf1+oxz1gZqwqjbdItkV3uPkdsbBnhxRUFO6JfSO8rMjlnyyTQh4QAvZ6QIGlKQNKnNliJ5exGpGuY/Z+KnGPdfubRQQ1Lwd3V6iVyIPAvgRN3ATpU/rpXhSC6zl0/V9zPmqn6wIwTaGoYmy56xOxNdUPxHcAyL81SeLbJ0n3swe5wCRTpsWH0fwKCfPF8vVGuHUBCEh8W7vo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199024)(1800799009)(186009)(53546011)(71200400001)(9686003)(6506007)(26005)(7696005)(83380400001)(8676002)(5660300002)(4744005)(2906002)(8936002)(52536014)(4326008)(76116006)(478600001)(64756008)(6916009)(66556008)(66946007)(66446008)(316002)(66476007)(41300700001)(38070700005)(38100700002)(54906003)(33656002)(86362001)(55016003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGlLeU1td3U0N1JVdmZ5L0ZwK3o5Z2xKd2hDN25QQ3Z6aVR0U1c2cDBzY1kw?=
 =?utf-8?B?ekNlUzJ3S3A1Zm51SmJ0L0ZWeUNvU01Ta3dUMStMSEVHeDNvVEVFRXNOVHV5?=
 =?utf-8?B?V1JCb1A4SVIwQ2NUWllDSVIycVZqZ1l6WVBFa0RON0txbHg1NUJyWVA1bG53?=
 =?utf-8?B?MnlmSkJkQmo0dGJvOFlZakV3blkrelFPa1BYMG15USs4SEd0NGVwRGQrckNt?=
 =?utf-8?B?ek5Rd0ZKN2FackdtRDZGVFRxYnAvK29Ba1VwaGhZTEIxQ3pNRGxiVG5XQktC?=
 =?utf-8?B?M1hlWTlya0x5YUhiLzV6T0pUb0o1M3BxRTA5QytaY0F2bGo0TDhOd1JpZmlT?=
 =?utf-8?B?TDVyVmQvM3JYMkE1K1NiVmpibTcySk5DL01kVW1GMzltR1lZZnZyMGFvSERh?=
 =?utf-8?B?cGp5SDFHbSs3YlEyWkhiVkZTdWV5ZXorMFUxWlFHb2VERktJQXRTOW1FSkJ4?=
 =?utf-8?B?L2t3bUtjeVZGdXJMRzJoRlBUL1BQV0kydnFOdGdLMHo4RjRPZzZ6K2lzdDZ3?=
 =?utf-8?B?bHhlUzY3Zk1TT1haZTF5b1hDQUJ0NUFZM1A0TlBtRHIwcDVrSWtZb2Z0UmVS?=
 =?utf-8?B?TXNiUHdtNHoxMnhVdDZkQUlNdC9yanRKUFJ2L01CSDhWNDZUdkc5NGcwQzNm?=
 =?utf-8?B?eVlJeG9zYTVtR0dRd2tnak0rRy9OTGV4aHo1WUFRZGxEVHduMWJldXZjVGVa?=
 =?utf-8?B?dUhUbitGclRaLzZvTmwvM2FaSlNGVWM5emlOYUY0YVQvdFRpbDlhSzZkSkY3?=
 =?utf-8?B?U05aZ1hCZWFzdjRVaWI5bGRNN004aXpZdlpQcVMzMUpwNGpmaVJKWDBvNWda?=
 =?utf-8?B?ODFwdDdVZm9wS0g5Mk5jU0VEQ2E2ZXVWYm81QXczcS9VQkZYdDdML3Q1VFc4?=
 =?utf-8?B?TVczY09pTHJteXNjald0NWVzeTg4OFdKekVFb3VBeWJPNEVHMTNieWxuRFhx?=
 =?utf-8?B?WUlwZmd0Vkk5N1UrWXVjZUMvTWpEMC8yb1U1N2RjUE9JU2NycFhTUDJUL0xF?=
 =?utf-8?B?YWxXZWNaY1ppMTNaZ2tEejU2VUJlYlk2ZitHMlJRVC8zRHRTaUl1UktZTEVm?=
 =?utf-8?B?a3o5WmI2NTlweEFMVGRiSVMwZ2RXV2pTaHNxK0dSY1ZFRFBsNW9mQ1ZCTW9j?=
 =?utf-8?B?dVZIV1ROc3k3cXpzOWVQNm5qeEhJSHAzdHRFcEhXTVRnVU9XWGExaUFneXZa?=
 =?utf-8?B?SUttcURsZWMxeUE0NjdxWERxQ0tGcy9Ya1AzUHhlTWdxRzBjdkRrTkRma1A2?=
 =?utf-8?B?SnRrbE9hQkYvVkVGekNxZ09jNjRodmkwb2xGMC9ZVis5UW9GKzlGWlU1ejhW?=
 =?utf-8?B?NWJlYWFVS2EvYlB0cEtqc2VjNXl0TnBpYy91OVRZMGNZdmRURzRjTG8zcmdI?=
 =?utf-8?B?YVNNYnR0N0dxZU5mUUxRZ1lHdUFSbUFKSm5Va3gzMndXQmNERzRDaGYvTTBn?=
 =?utf-8?B?cmhCTHVjM1NmKzJsQy9rTzR5RkU2WkR6VjJQNzhWMExuMDRsd3p3MXdVRmwr?=
 =?utf-8?B?VSszRUFuWXUyWDBFR1dEWStaODVUZFpOS3ArOHpOMWMzMzE2ZlNWSU1mNXor?=
 =?utf-8?B?a3NqM3hMamFucnJEMytQWUpaQkF6c2xqWDh3akdWS2M4aWNzUGVXOGk0dzZt?=
 =?utf-8?B?MjU1THFSK2JJanNUN1RXcndVT2VNS2ozUG5icS9rRjFCU0RRMU9BRlh2cEVz?=
 =?utf-8?B?Sno1YVFXRE03WUswL085ZE83QkN4ZFByaEdpTWdqZzFBVnZibWFtNnRSRlBG?=
 =?utf-8?B?WHdIeVdRSnlnQ0RDeURsQjBBZmVLQXNSNjN4NngyKzhrL3dURncrajNxTjNi?=
 =?utf-8?B?N0hEbk9wb0lyanN5dlFBdHJxOE14SXkvZ3YxdlMrN3FYRlFndnNJZytoZHVX?=
 =?utf-8?B?STI5QlRUN3dyVC9YNG5ZcUYxMjVrZzJ0ZVVXUURNdFQzeGZlclFPeFY5TFZX?=
 =?utf-8?B?QnQ2a1djMk9yQlF1U1BhVUpubXhjcE0wMWhDeEJNNUJQN3B0Q0tBUFVMVXJu?=
 =?utf-8?B?eFFDdDl2TFRxTVBuczQ4QmUrWStUMHBjNGxsRUduRFNDZ1BLSHBLM2NPbVJ1?=
 =?utf-8?B?VHZzWUdMaHNLYTBQUWJXd3RoWk43R1ZGYXhKV201Z2d6SXZSc2w1cEQyOVJP?=
 =?utf-8?B?WlJmd1RORVFuMHU3REhkdDZOUVBIVVhITllTa0FWQWRKWVI1TURib0g3T0Fy?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6e6361-aabd-47ee-ccdb-08dba4834e2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 09:20:06.2401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jxHpA8fE6eeuQHoXDfAj0HMt5ZeLJOf+76nNqeCf1s5bYPj31ba7ogU4pwyPYxrhOztqojZYqjpQsflM9Eup45azOzSBSdUsmhYM30ZPwro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9374
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMy80XSBj
bGs6IHZjMzogRml4IG91dHB1dCBjbG9jayBtYXBwaW5nDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4g
T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMTA6MjXigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEFjY29yZGluZyB0byBUYWJsZSAzLiAoIk91
dHB1dCBTb3VyY2UiKSBpbiB0aGUgNVAzNTAyMyBkYXRhc2hlZXQsIHRoZQ0KPiA+IG91dHB1dCBj
bG9jayBtYXBwaW5nIHNob3VsZCBiZSAwPVJFRiwgMT1TRTEsIDI9U0UyLCAzPVNFMywgND1ESUZG
MSwNCj4gPiA1PURJRkYyLiBCdXQgdGhlIGNvZGUgdXNlcyBpbnZlcnNlLiBGaXggdGhpcyBtYXBw
aW5nIGlzc3VlLg0KPiA+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+IEZpeGVzOiA2ZTlhZmY1NTVkYjcgKCJjbGs6IEFk
ZCBzdXBwb3J0IGZvciB2ZXJzYTMgY2xvY2sgZHJpdmVyIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBUaGlzIG9y
ZGVyIHNob3VsZCBiZSBkb2N1bWVudGVkIGluIHRoZSBEVCBiaW5kaW5ncywgdG9vLg0KDQpPaywg
d2lsbCB1cGRhdGUgdGhlIG1hcHBpbmcgaW4gYmluZGluZ3MgbGlrZSBiZWxvdy4NCg0KKyAgYXNz
aWduZWQtY2xvY2tzOg0KKyAgICBpdGVtczoNCisgICAgICAtIGRlc2NyaXB0aW9uOiBMaW5rIGNs
b2NrIGdlbmVyYXRvci4NCisgICAgICAtIGRlc2NyaXB0aW9uOiBPdXRwdXQgY2xvY2sgaW5kZXgu
IFRoZSBpbmRleCBpcyBtYXBwZWQgdG8gdGhlIGNsb2NrDQorICAgICAgICAgIG91dHB1dCBpbiB0
aGUgaGFyZHdhcmUgbWFudWFsIGFzIGZvbGxvd3MNCisgICAgICAgICAgMCAtIFJFRiwgMSAtIFNF
MSwgMiAtIFNFMiwgMyAtIFNFMywgNCAtIERJRkYxLCA1IC0gRElGRjIuDQorDQoNCkNoZWVycywN
CkJpanUNCg==
