Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43FC051BCBC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 12:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239308AbiEEKHW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 06:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiEEKHW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 06:07:22 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2115.outbound.protection.outlook.com [40.107.114.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE743FBE6;
        Thu,  5 May 2022 03:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IP5DsHogE8beN5oi+MTCNUp79Gn5UcSzy6C9hsu6IeFd9pPDyr2OeUQAUD6lymCPHq78/Ryk/WKENI92DNDFgU+Dhvo5XWPDA8O03dVzH8kPHB7kWOD9Ex583zQfPgZzOq4N+o3W9PBEMHnvBdyIwgiLjOJxXNybuvbZzSRan3Q3QJY2yxZAcqWKRtb6w25xh6daEmT93zrAneNmOC1ePjxf/wvWNA9kAfixfyxGCpmZgazD3GJOO3B9+OQx5Yk41l4qdnQXSyMp7R3Bdi8dzZgF7kHSf5bYn3h/xpZo3LDXBFKxLtFz2PHRz6hTsaCg4BhgmNEKhQgtK6ONZHQHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8exUE75vUB1LrnHpwrAB4JatU2S4gp+41p1X4Ev52c=;
 b=SCx26IOEN3YvjfFsy972V0Uyse2AYddCtbJ4pIgJvcEsyeZ43SJ4JXAC/fKtt15BRVDdM8jWP+8NZRUVdGT1cHL/J7JWAcrUXrTuU0y/fpgWKXjc0xiICbfqVesbKecMEKy7GxrlgwjeS3+usJ9hQcTa/3mH5mKcKiIyYrSvQrv/mkLjos1S7SP94MCE/49O2iTXgC4ydKw+vZC5I0nbtMq+92SA6MhfNGyOQW72o32xhks83bvf1Bduxn41TJ6a/1mS4xIDgS3rY0GNB3MNkZ3MaZhxdpCICyR5H1xfe/+vjkjNhUZGvXQpu4fWPfu3xOFfcnJtU1Gobm7GiYhysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8exUE75vUB1LrnHpwrAB4JatU2S4gp+41p1X4Ev52c=;
 b=VT6ghvngcwrYVSSt1y8Ak1GEnK/LUHPTUtmH2wMjMxBhBxeAoM3a67G34h+cFAAGfDcKTnN3s1KcxylFjR7pofIqW8lz0U6TcxQSz1BBOo+crsrcBKeRyjR4WXfOnNkh2SrlLZu5ESaBoS0fpfkMOs4zr2GnUhMMAMkIMTugOvU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB2006.jpnprd01.prod.outlook.com (2603:1096:603:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 10:03:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 10:03:40 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: cpg-mssr: Add a delay after deassert
Thread-Topic: [PATCH] clk: renesas: cpg-mssr: Add a delay after deassert
Thread-Index: AQHYX+bzJzYgcOdHs023qA1K4buvQK0P3WyAgAAvvCCAAAGQEA==
Date:   Thu, 5 May 2022 10:03:40 +0000
Message-ID: <OS0PR01MB59226ADFCF83BED9479BF5A786C29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220504184406.93788-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUh69grzYVsMwdZLgv=KLy5-_FVjeMWx37qGsqCxz9Y6g@mail.gmail.com>
 <OS0PR01MB59224D1908A7DBB08DAF444986C29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59224D1908A7DBB08DAF444986C29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b044c901-3432-4805-279d-08da2e7e87e1
x-ms-traffictypediagnostic: OSBPR01MB2006:EE_
x-microsoft-antispam-prvs: <OSBPR01MB200665381B27B6CE5219EA1C86C29@OSBPR01MB2006.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: alzdkzY5JjeHSj955K5Oji6oijpBNO6VzcgLIXSFuFSXndPTjILwidWVFF6rB5lT1nU9Bh8VvLI3zq5Aw+1RleVeyU0prQDpD13mXbAFgK1VuC/MWS8qS5+V5UxFuZvXL9lSqmF7j/TBzXO2rPsO+S4mTu3Gnc+FNoG3GVggtF/1rwaQYr5Y2S+qatOQEwc1ThN0dScZA5KhDIyZVZSxtjx80L4cp/KFXRW1JJ8sw4liXvocASdHbx+jFXbeCDPG6doll3LD9Qsz5k6G6cZdQY9D3YYq1qemfkaCXEmdmwL7A8+hvw9yTMrySoG7lK2WMvSk2ZLj6dHpVgDF3DsHPbXy6/4gEmQjUm7Kaw00vRBWi8z588Er7RzEaqFNK4Y+Pg7gEyb/QAT/+Znr7Nx94gRYfsKyFO2pdzZcledMjwc9tJVfceBKRGZI96EFpZ2Z4manH+hyD4fdKxjQHgwxvpJd5gZvw7AtOpdgspJ22ItZ1IGAV0YXvpLr/Zgg9IJPSXkrMt3PtJx8O9RiJIRa2zzBxo2d64vAKJtroFnjHApZw94K1r8XBzgXyIkiCNdN3xpFJl7xRbb2YuLAwe+eGnkR/cfpAueNN1qSThrHpca/xfxzj70rMGIMdtzfL9OR9r0LFUalcr0LK4s1540nESE1GyUK5XuoQwCb+xrEcnBeLtGDHdcQP/hggQrEXmRiTDNkwwmsfkKRfZjCeoNzRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(55016003)(122000001)(7696005)(107886003)(33656002)(2906002)(83380400001)(71200400001)(66446008)(66556008)(66946007)(8936002)(52536014)(508600001)(38070700005)(38100700002)(64756008)(5660300002)(66476007)(54906003)(110136005)(316002)(76116006)(9686003)(8676002)(26005)(86362001)(4326008)(6506007)(2940100002)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVBFcDFoYVE4eUZ6czRSVXZOVEVQUitiMHZrSkVDcG9KZ3ZpTjNLZWNHVnM3?=
 =?utf-8?B?M2QyeVNRcEYzc2F3RXZwRVBZTy9OeU81OXRXcWtQYTdXRE1PWVZhT1NiY1VC?=
 =?utf-8?B?YmJoY3FpT0ZOWDcxTlpaYXAxRzJaVE80WUIyS3F2alF2Rmh2YnFUeXp5VjB5?=
 =?utf-8?B?ZnlXZ2EwUjFVblhsRkN2TWJKem13eGt3aHBmTlpqejdrL1VQaXNwTEJ1VDFE?=
 =?utf-8?B?SnhlZ3Z5aEVEeWh3emZDSDR6NEVUcUFwalltSnF1Zmt4VDI3RW4rMDltekhF?=
 =?utf-8?B?ZUpMVVpuZWY5Q1FMWE54TEVmTkw0MGdhc2Ria0l3eXhUNFBacXIwbHpGdDlz?=
 =?utf-8?B?SjhVTGtBdmZsdzhid24xeHdBa1E5UUlQWi9rMDljdW9sRHk2dHZEQmNKL1RM?=
 =?utf-8?B?aXFQRWR5SDdpWU9wTDIzS2FZV1dMVkp1Y2xzOVJ6TVV2ZXZKSU82Nld0QVhZ?=
 =?utf-8?B?R1lLbTZhUkNaemJvRllRT0JpdURrREVtZk50My9RQ0FGL2FrUmZXNHhZZWlO?=
 =?utf-8?B?NGoyVHZjaytINndic1ZwNmxaTW51UnRPOWd4Q3p0dzd3ZTNZN2p1SWNONkNL?=
 =?utf-8?B?M3BKQ2lZdXcwMGNud3drM0swQ0N2U095TXhBcFJaZWJCc1dlQVZISmMxbk9s?=
 =?utf-8?B?V3pmbU5Sa3ZrSU5sdHdwTzdaL3I5QmxhdWJ6U0Qxa3YrTlFVbVUxSHQ4TVpj?=
 =?utf-8?B?WWlwUmgrL2g1c3pkS3pNN04zL2RGc1ozeGpxVzVJZHVKNFEyblZibnlocWVZ?=
 =?utf-8?B?RjVQQmZLMnUveTBjZnBNNFVmV0kwUll0dHhPVC9zSmdTRVdITWdNMUxYSEUw?=
 =?utf-8?B?OGduR2tVTDdRRHR1TEtJdWdJWi8rcHlIWC9Ja1IwS0U4V2RxVVg1MHJXRE11?=
 =?utf-8?B?bG5RNlpvcktkVzRFcHFob2I4TDlrL3Q5Z2ZXd1BxTFJkRWp3OWpTZDlNeG9D?=
 =?utf-8?B?VkFjaW1JSVhkT0NONGVGUkNzMlFCUEI1NTZPQmhqQnpuWGlkbUdGMHk1NG16?=
 =?utf-8?B?MTZua25VYnNRNkpCVmpjdXdYRktNdCtlaVM5QkdWMWtEdGtUK2cwM1g4OHZB?=
 =?utf-8?B?bTE1SDBPUFRqdW1haUdCZHN0SU1GYVVaMEFBbXd4RnM5T3VLNEIwL1JtWFZp?=
 =?utf-8?B?VEtDNUJheWZ6TGhhamdCaUhLVzJ3YzhrUmFERlh6YWZ4TjJKaWxDU0txMmY2?=
 =?utf-8?B?UWRudm5YRUxQZE9qQzhzc2ZYRXppZWlldmN5SkhBOFRXeXZRckhFSVEwM3hj?=
 =?utf-8?B?WS95ME5EWGdwTmpiY0RlbStkNU5iTVk1TXdNZVQyTGZ5dFgrN3VaWVRka25h?=
 =?utf-8?B?QXRGMld2OFhDcC85eFA1RE5USW5oMkVCMThtNEo0Z2tMaXRIVjU3TUFvUk5W?=
 =?utf-8?B?dU54bUcxZ1pwMTFEQW9RSEh1Yk01QVZSQnlqWkd0S3pUWlF2UlBRSDdLZGlG?=
 =?utf-8?B?aEl3Yys5REovaXRmcEdEZHVURWxEOFZBWlkyaUJEMnlzMkVaY2ZTcVNTRGli?=
 =?utf-8?B?YjhKNVI1WWJBYkx4cmxSbW9TUXhPcXJ2UzRyTlVxWlNzZnl6VTlPcjZYNmFs?=
 =?utf-8?B?VjJBcTR6VVVxSVl2K2hiSlJPTi9WQmY3ZXUvZDVBaDRhSWVXV0NsRUhucTY4?=
 =?utf-8?B?VCswQ0lvbm5KbmE4N1J5YUd1ZitER3hnbldDRk9BMUE4Z2JXdlFVQjFuMnU4?=
 =?utf-8?B?OGpTaVJ4QXY3M1BEcE5FM3hKQU9SdGt4TDR1SFRHc1luakVWeC9UOTNLQTRq?=
 =?utf-8?B?NFlYQUZCSzkrQy9xMloxOW1keGhVTnVDQ0lQYVV4S0d6NHF3RWJYV3JJVFFw?=
 =?utf-8?B?cmx1SXVtUmxtQkhqSjJvd0QzenhGTjhZODVWcXdmSHZ3ZW9mZUxhYmlyZ3d2?=
 =?utf-8?B?VlIrbjk5Y2g4MjRsOVVieEZ0M0tuSnByQlpVOHNibEtPUzV1dE9hM0Vpd2V4?=
 =?utf-8?B?ZFBPdDc1dVJQV25SNWYzdThNNDhPc0VHZ284bEJISzR3cDh0amw1dUl6Sy96?=
 =?utf-8?B?NVRrYVBaQTR3MWFoLzhTTzFrN3NONnJaanhCVmFjTG4vMlJHMHRDV2RRWUtt?=
 =?utf-8?B?RnAyVTJKUHdqcU5JSDZBazJ6d2FrbVd5L1BKL2RMNGt5VGhuT0xlRmYya2U0?=
 =?utf-8?B?QWQzZU42aVJYYXFNWFJ0clE1RFJrRHVkOUFPa0xQYlUrM2h2eGk1My8zTnpN?=
 =?utf-8?B?V2ZnYWdsWTJiR0ZvWkg1U2pzWnFtb3NzTCtkRyt2UEhkK003OVFHYU42RWlY?=
 =?utf-8?B?MUtTS2VIYmJ3UFZYYzYwdGJOajFEaFZ1MnQ3TlVxT1ZGWmNaR20yQU5YSEZD?=
 =?utf-8?B?VERKbVlkOU5TVUlBZTZtOEcyK25taytSbURaaTY2ZGgramFCVzhESlFVN0Y2?=
 =?utf-8?Q?wADWkeNZlJlWyIzc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b044c901-3432-4805-279d-08da2e7e87e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 10:03:40.6627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUqVC91Lk+a63u2jbeo0GI3MBF1yz5mSUbYW4SFoXfzH1dv0I0HjjUwQKlSw2Y8Z34/HUj1JROPAqJy0Yv0GQqFo1iyTCS1kCffWg3s1XT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2006
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpBZGRpbmcgaW5pdGlhbCBsb2dzIHdpdGgganVzdCBkZWxheSBpbiBkZWFzc2VydC4NCg0KPiBT
dWJqZWN0OiBSRTogW1BBVENIXSBjbGs6IHJlbmVzYXM6IGNwZy1tc3NyOiBBZGQgYSBkZWxheSBh
ZnRlciBkZWFzc2VydA0KPiANCj4gSGkgR2VlcnQsDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBmZWVk
YmFjay4NCj4gDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gY2xrOiByZW5lc2FzOiBjcGctbXNz
cjogQWRkIGEgZGVsYXkgYWZ0ZXINCj4gPiBkZWFzc2VydA0KPiA+DQo+ID4gSGkgQmlqdSwNCj4g
Pg0KPiA+IE9uIFdlZCwgTWF5IDQsIDIwMjIgYXQgODo0NCBQTSBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gQWZ0ZXIgYWRkaW5nIHJlc2V0IHN1
cHBvcnQgdG8gdnNwLCBpdCBuZWVkcyBhIGRlbGF5IG9mIDMyDQo+ID4gPiBtaWNyb3NlY29uZHMg
YWZ0ZXIgcmVzZXQgb3BlcmF0aW9uLCBvdGhlcndpc2Ugc3lzdGVtIGhhbmdzKGR1ZSB0bw0KPiA+
ID4gcmVnaXN0ZXINCj4gPiByZWFkL3dyaXRlKS4NCj4gPiA+IFRoaXMgcGF0Y2ggZml4ZXMgdGhl
IHN5c3RlbSBoYW5nIGlzc3VlIGJ5IGFkZGluZyBkZWxheSBhZnRlcg0KPiA+ID4gZGVhc3NlcnQg
b3BlcmF0aW9uLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4g
Pg0KPiA+ID4gQWZ0ZXIgYWRkaW5nIHJlc2V0L2RlYXNzZXJ0IHN1cHBvcnQgZm9yIHZzcCBiYXNl
ZCBvbiBbMV0sIFJaL0cxTg0KPiA+ID4gYm9hcmQgaGFuZ3MuIE9uIGRlYnVnZ2luZyBpdCBmb3Vu
ZCB0aGF0IGl0IG5lZWRzIGEgZGVsYXkgb2YgMzUNCj4gPiA+IG1pY3Jvc2Vjb25kcyBhZnRlciBk
ZWFzc2VyaW50IHJlc2V0LiBXdGhvdXQgZGVsYXkgaWYgdGhlcmUgaXMgYW55DQo+ID4gPiByZWdp
c3RlciByZWFkL3dyaXRlIHdpbGwgbGVhZCB0byBoYW5nLg0KPiA+ID4NCj4gPiA+IFRoaXMgMzUg
bWljcm9zZWNvbmRzIHZhbHVlIGlzICBwaWNrZWQgZnJvbSB0aGUgcmVzZXQoKS4NCj4gPg0KPiA+
IFRoZSAzNSDCtXMgY29tZXMgZnJvbSB0aGUgSGFyZHdhcmUgVXNlcidzIE1hbnVhbDogdGhlcmUg
c2hvdWxkIGJlIGF0DQo+ID4gbGVhc3QgMSBSQ0xLIGN5Y2xlIF9pbiBiZXR3ZWVuXyBhc3NlcnRp
bmcgYW5kIGRlYXNzZXJ0aW5nIHJlc2V0Lg0KPiA+IFRoZSBtYW51YWwgZG9lc24ndCBzYXkgYW55
dGhpbmcgYWJvdXQgZGVsYXlzIF9hZnRlcl8gZGVhc3NlcnRpbmcgcmVzZXQuDQo+ID4NCj4gPiBD
b3VsZCBpdCBiZSB0aGF0IHRoZSBWU1AxIGRyaXZlciBpcyBhY3R1YWxseSBkZWFzc2VydGluZyBy
ZXNldCB0b28gZWFybHk/DQo+IA0KPiBNeSB0ZXN0IHJlc3VsdHMgb24gUlovRzFOIHNob3dzLCBp
dCBuZWVkcyAzNSBtaWNybyBzZWNvbmRzIGFmdGVyDQo+IGRlYXNzZXJ0aW5nIHJlc2V0Lg0KPiAN
Cj4gTG9ncyB3aXRoIGp1c3QgYWRkaW5nIGRlbGF5IGluIGFzc2VydCgpDQo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBbICAgIDEuOTM4OTkxXSByZW5lc2FzLWNwZy1t
c3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRlYXNzZXJ0IDEzMQ0KPiBbICAgIDEuOTQ1
MzczXSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGFzc2VydCAx
MzENCj4gWyAgICAxLjk1NjQ0NV0gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1jb250
cm9sbGVyOiBkZWFzc2VydCAxMzENCj4gDQo+IEl0IGhhbmdzIGFmdGVyIHRoaXMuIEFmdGVyIHRo
aXMsIHRoZXJlIGlzIGEgcmVhZCByZWdpc3RlciBjYWxsIHdoaWNoIGhhbmdzDQo+IHRoZSBzeXN0
ZW0uDQo+IA0KPiBMb29rcyBsaWtlIGFmdGVyIGRlYXNzZXJ0LCBpdCBuZWVkcyBzb21lIGRlbGF5
IGZvciBhY2Nlc3NpbmcgcmVnaXN0cmVzLg0KPiANCj4gTG9ncyB3aXRoIGp1c3QgYWRkaW5nIGRl
bGF5IGluIGRlYXNzZXJ0KCkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQoNClsgICAgMS45Mzg4MjJdIHJlbmVzYXMtY3BnLW1zc3IgZTYxNTAwMDAuY2xvY2stY29udHJv
bGxlcjogZGVhc3NlcnQgMTMxDQpbICAgIDEuOTQ1MjM5XSByZW5lc2FzLWNwZy1tc3NyIGU2MTUw
MDAwLmNsb2NrLWNvbnRyb2xsZXI6IGFzc2VydCAxMzENClsgICAgMS45NTYyNzNdIHJlbmVzYXMt
Y3BnLW1zc3IgZTYxNTAwMDAuY2xvY2stY29udHJvbGxlcjogZGVhc3NlcnQgMTMxDQpbICAgIDEu
OTYyODc0XSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRlYXNz
ZXJ0IDEyOA0KWyAgICAxLjk2OTI3MV0gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1j
b250cm9sbGVyOiBhc3NlcnQgMTI4DQpbICAgIDEuOTc1NjU5XSByZW5lc2FzLWNwZy1tc3NyIGU2
MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGFzc2VydCAxMzENClsgICAgMS45ODM3OTldIHJlbmVz
YXMtY3BnLW1zc3IgZTYxNTAwMDAuY2xvY2stY29udHJvbGxlcjogZGVhc3NlcnQgMTI4DQpbICAg
IDEuOTkwMzQ0XSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRl
YXNzZXJ0IDEyNw0KWyAgICAxLjk5Njc2MF0gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9j
ay1jb250cm9sbGVyOiBhc3NlcnQgMTI3DQpbICAgIDIuMDAzMTA2XSByZW5lc2FzLWNwZy1tc3Ny
IGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGFzc2VydCAxMjgNClsgICAgMi4wMTEyMjRdIHJl
bmVzYXMtY3BnLW1zc3IgZTYxNTAwMDAuY2xvY2stY29udHJvbGxlcjogZGVhc3NlcnQgMTI3DQpb
ICAgIDIuMDE4NDIxXSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6
IGFzc2VydCAxMjcNCg0KPiBbICAgMTIuNTM2Mjk4XSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAw
LmNsb2NrLWNvbnRyb2xsZXI6IGRlYXNzZXJ0IDEzMQ0KPiBbICAgMTIuNTYzNTc3XSByZW5lc2Fz
LWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGFzc2VydCAxMzENCj4gWyAgIDEy
LjU3MTYzMF0gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1jb250cm9sbGVyOiBkZWFz
c2VydCAxMzENCj4gWyAgIDEyLjU3ODQxMl0gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9j
ay1jb250cm9sbGVyOiBhc3NlcnQgMTMxDQo+IFsgICAxMi41ODQ3MDJdIHJlbmVzYXMtY3BnLW1z
c3IgZTYxNTAwMDAuY2xvY2stY29udHJvbGxlcjogZGVhc3NlcnQgMTMxDQo+IFsgICAxMi42MDk4
NzVdIHJlbmVzYXMtY3BnLW1zc3IgZTYxNTAwMDAuY2xvY2stY29udHJvbGxlcjogYXNzZXJ0IDEz
MQ0KPiBbICAgMTIuNjE4NjY2XSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRy
b2xsZXI6IGRlYXNzZXJ0IDEzMQ0KPiBbICAgMTIuNjMxNzM2XSByZW5lc2FzLWNwZy1tc3NyIGU2
MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGFzc2VydCAxMzENCj4gWyAgIDEyLjY3OTI0MF0gcmVu
ZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1jb250cm9sbGVyOiBkZWFzc2VydCAxMjgNCj4g
WyAgIDEyLjY4OTcxMl0gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1jb250cm9sbGVy
OiBhc3NlcnQgMTI4DQo+IFsgICAxMi42OTcyNDldIHJlbmVzYXMtY3BnLW1zc3IgZTYxNTAwMDAu
Y2xvY2stY29udHJvbGxlcjogZGVhc3NlcnQgMTI4DQo+IFsgICAxMi43MTI3OTZdIHJlbmVzYXMt
Y3BnLW1zc3IgZTYxNTAwMDAuY2xvY2stY29udHJvbGxlcjogYXNzZXJ0IDEyOA0KPiBbICAgMTIu
NzU1MTkxXSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRlYXNz
ZXJ0IDEyNw0KPiBbICAgMTIuNzYyMzg5XSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2Nr
LWNvbnRyb2xsZXI6IGFzc2VydCAxMjcNCj4gWyAgIDEyLjc3NTg4Ml0gcmVuZXNhcy1jcGctbXNz
ciBlNjE1MDAwMC5jbG9jay1jb250cm9sbGVyOiBkZWFzc2VydCAxMjcNCj4gWyAgIDEyLjc5MTMy
OV0gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1jb250cm9sbGVyOiBhc3NlcnQgMTI3
DQo+IA0KPiBJdCB3b3JrcyBPay4NCj4gDQo+IA0KPiANCj4gPg0KPiA+ID4gLS0tIGEvZHJpdmVy
cy9jbGsvcmVuZXNhcy9yZW5lc2FzLWNwZy1tc3NyLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvY2xr
L3JlbmVzYXMvcmVuZXNhcy1jcGctbXNzci5jDQo+ID4gPiBAQCAtNjM3LDYgKzYzNyw3IEBAIHN0
YXRpYyBpbnQgY3BnX21zc3JfYXNzZXJ0KHN0cnVjdA0KPiA+IHJlc2V0X2NvbnRyb2xsZXJfZGV2
ICpyY2RldiwgdW5zaWduZWQgbG9uZyBpZCkNCj4gPiA+ICAgICAgICAgZGV2X2RiZyhwcml2LT5k
ZXYsICJhc3NlcnQgJXUlMDJ1XG4iLCByZWcsIGJpdCk7DQo+ID4gPg0KPiA+ID4gICAgICAgICB3
cml0ZWwoYml0bWFzaywgcHJpdi0+YmFzZSArIHByaXYtPnJlc2V0X3JlZ3NbcmVnXSk7DQo+ID4g
PiArDQo+ID4NCj4gPiBVbnJlbGF0ZWQgY2hhbmdlLg0KPiANCj4gT29wcywgQWRkZWQgYSBkZWJ1
ZyBtZXNzYWdlIHRoZXJlLiBXaWxsIHRha2Ugb3V0IHRoaXMuDQo+IA0KPiBDaGVlcnMsDQo+IEJp
anUNCj4gPg0KPiA+ID4gICAgICAgICByZXR1cm4gMDsNCj4gPiA+ICB9DQo+ID4gPg0KPiA+ID4g
QEAgLTY1MSw2ICs2NTIsMTAgQEAgc3RhdGljIGludCBjcGdfbXNzcl9kZWFzc2VydChzdHJ1Y3QN
Cj4gPiByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsDQo+ID4gPiAgICAgICAgIGRldl9kYmco
cHJpdi0+ZGV2LCAiZGVhc3NlcnQgJXUlMDJ1XG4iLCByZWcsIGJpdCk7DQo+ID4gPg0KPiA+ID4g
ICAgICAgICB3cml0ZWwoYml0bWFzaywgcHJpdi0+YmFzZSArIHByaXYtPnJlc2V0X2NsZWFyX3Jl
Z3NbcmVnXSk7DQo+ID4gPiArDQo+ID4gPiArICAgICAgIC8qIFdhaXQgZm9yIGF0IGxlYXN0IG9u
ZSBjeWNsZSBvZiB0aGUgUkNMSyBjbG9jayAoQCBjYS4gMzINCj4gPiA+ICsga0h6KQ0KPiA+ICov
DQo+ID4gPiArICAgICAgIHVkZWxheSgzNSk7DQo+ID4gPiArDQo+ID4gPiAgICAgICAgIHJldHVy
biAwOw0KPiA+ID4gIH0NCj4gPg0KPiA+IEdye29ldGplLGVldGluZ31zLA0KPiA+DQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gPg0KPiA+IC0tDQo+ID4gR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLQ0KPiA+IGdlZXJ0
QGxpbnV4LSBtNjhrLm9yZw0KPiA+DQo+ID4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+ID4gQnV0IHdoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3INCj4g
PiBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMNCg==
