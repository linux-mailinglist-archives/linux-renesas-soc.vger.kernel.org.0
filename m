Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 180607828F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 14:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbjHUMZo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 08:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjHUMZo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 08:25:44 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3798ABC;
        Mon, 21 Aug 2023 05:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoqvvvJFsk+qzGp2ZskcWI8FDB9h4tSZGJfKC7p7+yJsiK558PYTOMA0q66sIe6ho+So6cts4dQrzDyvdidPqBfT26WKqydZFKAEylIyt8OXIk47xBH+SOi62Fe0SNv39SWFEhDuVx6zIveavZNJjVOXYbDMa+oBUO6R6rCADOUOjvk5ytJo5SOI18/ozKecazR6rmh1EPDWQV0YbnVqKcVmuptd3/CEFYewV4fZxDW3FLbjgjVq8Tq2hQ6YK7rID6DbBoB8eZ04RJXR3FfgpdONXQcH7wzmEzaUgN8iMKVbtK1sISlxudnlIHy422Og6/vOQB1m+Y9U5zvR1NXS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIdzMFLw6ZeIrylkDligItEZWg48yKhFm+G3h+l1x1k=;
 b=Jgp2hBJxMDKksNJN5BJ4Was4kiD2NixUDW6ZGC8PDqu/LU7rgGBzC1HLSLSamZVBJ/cWR/3z1vn900kNgdyIKxRn8kuZ+uTBAqG3E7Wp0nTgpn059y29FizDnXrT15f29EKAlCK5VfrzkyVB+NfHFlKQ7HrYjf3F9C9TL/eMPJssCMyKruAlQDtQMms1ZoCQr20Z4ms7xupaseMc3sIKMnKVWZVYy6kHGPb80mqg0BaUUrsy67/FpiKl/Xu7N0J9Bt+FBjdVcD/OyTiSPKSC0rK7efRphDJf4F4euuGaJ98epGGiXlhvy/ItmO77eKvPSjUa1C47qQsfxPjqq+bnbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIdzMFLw6ZeIrylkDligItEZWg48yKhFm+G3h+l1x1k=;
 b=h9CgT7YD8py5L+6L7y/TcI8D8G/6omZkxa7qrJyMqBQdHuUhWgHZByOO5BkxtQiqrRasNqDNxnxKzqgsseD8xPYEa5YX7G0BxRR2DlsecC9roiVv9DPDZaNHbb1QxfJMvOphD7rwCvdSqY1hhOHBO0f6rlCG9NGziz82FaMHKRc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11668.jpnprd01.prod.outlook.com (2603:1096:400:37a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 12:25:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.025; Mon, 21 Aug 2023
 12:25:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] leds: pca955x: Convert enum->pointer for data in the
 match tables
Thread-Topic: [PATCH] leds: pca955x: Convert enum->pointer for data in the
 match tables
Thread-Index: AQHZ0z8kv9KjU7Awp0CLK9RcUh98aK/0rN6AgAABJeA=
Date:   Mon, 21 Aug 2023 12:25:39 +0000
Message-ID: <OS0PR01MB59223DD52B12A9C99DE9B408861EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230820082005.55124-1-biju.das.jz@bp.renesas.com>
 <20230821121907.GI1380343@google.com>
In-Reply-To: <20230821121907.GI1380343@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11668:EE_
x-ms-office365-filtering-correlation-id: 877e1eba-5f34-4d76-c885-08dba241baf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j7lL1erQ6zu/yRvLyYEzUKLBlTss942xetBzMMrKeyd+YQTe+859PrfpQA7W+l88Sa9wf52BFj6aE2aQunaC/m+pcIHbb9qiQbPfCceTXEA8MnPl8fLtplYvyfTBkBgKZOVI1Lmc0kFLrnpDQjRePzZEfJ9GeB/63cZiFdZTyerc0/b9dId4vlGkfaebWWn17VnZghHX1ftb6FZGIipCCSHgm+ZXCLlDV6ha8+8mDLz557cG+Ho+gFRf03q3GDXc9yDFgUrboHRoQnhwaEq4ynyYZPF5qds7mpfdweDMZB7jNAL5mDGIT8UHnIp4kV4wg/9hcBNcZIwE6YoY7cK8o6pT+F0eBfeJtDIKV2XSSk1j/zzeE19SiOofkKeOuNe/ezfC2hzFhb7qh/ZZjfI2LfWfVjtbkkqPNEOshNx0cCdeWeRqNXeT0p8Edhe10pt9uevuD1HEz2wUD7qqNoX4sSadsHQymg+pRKDzJgugptG06hh+1aEBx/uOsxdqrScsyHvEBEBxv9hwHDj5suX5xk9zuU7OWoe4FuZrnFyfchSj1oE1v6Woh2F5i2H6hMPGhpai23p/tpf+0PM4jU+CpAeKQVoOdtrzbGqmCoxGaaxNdMNNmx6LSmiYrtrazMmP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199024)(1800799009)(186009)(86362001)(76116006)(64756008)(5660300002)(41300700001)(33656002)(66476007)(6916009)(316002)(66946007)(2906002)(66556008)(66446008)(54906003)(8676002)(52536014)(4326008)(8936002)(478600001)(71200400001)(9686003)(38070700005)(7696005)(6506007)(38100700002)(122000001)(26005)(83380400001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TThzOWxCVUJXNjNOUERUT3J0UlFTeSt5MjQyMjk1TFB3L1JxRU0rZ1hvVGxn?=
 =?utf-8?B?U0dJL01Ma3A0SnQ1QWNDKzNrcTQwWGdudEdlUjBySlNnRklPdklDNHR3WXZQ?=
 =?utf-8?B?ZDBRR2dqbjJKdGNVeUpYVU9MYU42U2ErZmVwOHh4S3BDSUMxTmgxcVdiSjVv?=
 =?utf-8?B?VkczczZLdldRdWV2UGg4bngzck4yMUhOWENkaHhLLzdQYThSVHVxOEc1NGx1?=
 =?utf-8?B?ZHBzTWRzTGZqZTh1QzBvSEJ0RUc1cDVDUG5Rcm9OWXc0aEk4UDlKZnhIK1RG?=
 =?utf-8?B?eTRObGNpUGZhY0hpTG1JWGcxekFhK3p0ZlZVdFVabFRjSGxQaWJSdlhFM1lY?=
 =?utf-8?B?TXIra3Uvd0xiZXh2RHB4Mlh4SHBqTVUrR3pzMjVtOWRwODdkYXJMSHNsM2Uz?=
 =?utf-8?B?TFFBQVdSa3loSUp2TkwxZnhnQmxYaVJJeVBqWnlJeE5tb0hxZWoxemZzNkNp?=
 =?utf-8?B?bUxXM1RLaXNhenYvOW1tUU53Y1d6T053c3JOVHRkdGgvTEdHK013aUlFZDhq?=
 =?utf-8?B?K0pWMVhORGU1TSs2WWVQQ3c3SmJnS3lJYk1TVXFwOWZuSHVXdjFMckZjS2JV?=
 =?utf-8?B?RUpscGszbjFCUkZKV2ovdlBZZk8xb2o0SW9wWXFjRDlRUVJ1K1RmK0NNTGVS?=
 =?utf-8?B?R1RqbEltTDMxQjJvV0VsY2hleGNYd1JibjZFRExFekFBam1hcUdhamgrQnVJ?=
 =?utf-8?B?WVFKamw0ZDdYd0hIbUtrNjJWRHpQNGlUaWZjT3RRRks5U3RBOWFLS1JqSGQr?=
 =?utf-8?B?QnhRL3FZd1F6ZklZenBqMFJBdmlsUWd2ajZOeGpwd2tpU2YzbzZhWmdSclc2?=
 =?utf-8?B?cE8xN2JyVU5CR2NvbTQwN05TbmVXOHorUGZiOFpDKy96N09HSFcvbTBqd0Qr?=
 =?utf-8?B?U3diQXBrdEZ6NmxYbmVFZGZJV1NHdWJOakNYbDVlc2R3UytWS05YSkpzRVhk?=
 =?utf-8?B?cVY3UFZ0RW5ScVZsL1I4T25rdUMxSHZzZXZsVS9VRzZ0UkxxYTdNNjFLNHR6?=
 =?utf-8?B?dHd4a2JPcE04QU5vejk0dE1DN2ppZUNSK1FQSWFEa0NSdjJBUWNuU2tlYjNS?=
 =?utf-8?B?TEFQL3BoZ1NlUURMZk5VNTZZWFQ5Z0Zwd0IvUWRPa1FLSWdQL1hDeGRSbUJn?=
 =?utf-8?B?ejBnVC95amEramZGVzViQndGY25vL0Zodk9mOE1yckJjN2U1TUJVT2tQeHhK?=
 =?utf-8?B?SndyUTVmemYxLzZJcjVTZXNZN0lHKzl6QUl1YTBjdHBhMzNQYnFad1A4bVJW?=
 =?utf-8?B?a1d0Q1pDMWVJdERVdmZncUJpT2Z4dTlRQWVteXdIMGRSZ0piVEc0ZmZrbTcv?=
 =?utf-8?B?UllDOVJ3VlBqdW1rMXRHRjVPYlJHb2xYWDgwTUNvdnpqeGJXQkw0NjU1aVJ5?=
 =?utf-8?B?K0Nha3NTUEg2TzdoSjg5Q2hUM3AxTFM4NnlONzlRTlV5eFN6UmNXUkxIZDNj?=
 =?utf-8?B?SW5BSVVQMUJlOXdHeWRtMUtzYUFQUDd2UWVoMk81S3Q2NHVVb2VNdXJ5cUJl?=
 =?utf-8?B?eFNOVmQ5eXFMQXV5MVJEYXd1ZSsrUVNXSisyTTJYR2Q2ajkyK0V1cEtBYjh3?=
 =?utf-8?B?cmh4RWtTajNCZk1yTGZBSldYb0QvVWtwSHNVUVRyUm1LRXRPRmRZd3VWSmN6?=
 =?utf-8?B?SjMwQk1DLzgwRk4yc0xGN3BaS2h6Ull3ajVPZDM5NklXZUN1ZWVibHBlbGtj?=
 =?utf-8?B?U0NYalZwa0VmcmdFUjdINjB0b3RWNG1iczNBVUtadVpzbVVlQ2RFRTU1cElX?=
 =?utf-8?B?bVVIZkZrZjhjVGx2N2R2M0xsQWJYSnNpU0dUVEdDVktlVXA2WDF5a25DY3li?=
 =?utf-8?B?K1c4WHNzSHFGc29TdktBTGd4SWMyMktoa2Y4eXpWUi9Fd3czbHJnOS9ZOS9u?=
 =?utf-8?B?NTNTbG0vUjNUQUROSE1jK0tvU0dERnk3a2hVLzgyRktRdi9oQnJQU2RCNFpX?=
 =?utf-8?B?djZvWStpU3FDUWQ2ZzBndXlnVUNRdnQ3RUJaMWRFUVhxSXQ2TDJhNm9ia3lL?=
 =?utf-8?B?eFVVTTVTQTJvQy9YSUJhem9OaFpTNWVPQTRRWWQ4L0xTckd2bm1LbzMyd1ky?=
 =?utf-8?B?b2JiUjgvNE11Q2F0SEpBbjkrdXZ6c1hLZ2VvWGpic09uck1BK0szYzJLUk0v?=
 =?utf-8?B?UnNUdFBGRnhSTGZhVXBhNHIzVmhGc2JkSWw4ZE1tSDNESVlmVGNCSk1HY2dV?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877e1eba-5f34-4d76-c885-08dba241baf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 12:25:39.5482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8/+Ah1ffBgFxaK1UL6VNcwLt7PVjxnG/f2FwU2CUO/o8avGHSIp9ZGRvBwTc5HZVwExHDwQuaQt7FS9J+eOp5fUCNorGOz0Axh45J/tS6h8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11668
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGVlIEpvbmVzLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGxlZHM6IHBjYTk1NXg6IENv
bnZlcnQgZW51bS0+cG9pbnRlciBmb3IgZGF0YSBpbiB0aGUNCj4gbWF0Y2ggdGFibGVzDQo+IA0K
PiBPbiBTdW4sIDIwIEF1ZyAyMDIzLCBCaWp1IERhcyB3cm90ZToNCj4gDQo+ID4gQ29udmVydCBl
bnVtLT5wb2ludGVyIGZvciBkYXRhIGluIHRoZSBtYXRjaCB0YWJsZXMsIHNvIHRoYXQNCj4gPiBk
ZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSBjYW4gZG8gbWF0Y2ggYWdhaW5zdCBPRi9BQ1BJL0kyQyB0
YWJsZXMsIG9uY2UNCj4gPiBpMmMgYnVzIHR5cGUgbWF0Y2ggc3VwcG9ydCBhZGRlZCB0byBpdC4N
Cj4gPg0KPiA+IFJlcGxhY2UgZW51bS0+c3RydWN0ICpwY2E5NTV4X2NoaXBkZWZzIGZvciBkYXRh
IGluIHRoZSBtYXRjaCB0YWJsZS4NCj4gPiBTaW1wbGlmeSB0aGUgcHJvYmUoKSBieSByZXBsYWNp
bmcgZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgYW5kIElEDQo+ID4gbG9va3VwIGZvciByZXRyaWV2
aW5nIGRhdGEgYnkgaTJjX2dldF9tYXRjaF9kYXRhKCkuDQo+ID4NCj4gPiBXaGlsZSBhdCBpdCwg
YWRkIGNvbnN0IGRlZmluaXRpb24gdG8gcGNhOTU1eF9jaGlwZGVmc1tdLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0t
LQ0KPiA+IE5vdGU6DQo+ID4gIFRoaXMgcGF0Y2ggaXMgb25seSBjb21waWxlIHRlc3RlZC4NCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9sZWRzL2xlZHMtcGNhOTU1eC5jIHwgNDUNCj4gPiArKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkNCj4gDQo+IFRoaXMgaXMgdG9vIGJpZyBvZiBh
IGNoYW5nZSB0byBiZSBhZGRlZCB0aGlzIGxhdGUgaW4gdGhlIGN5Y2xlLg0KPiANCj4gRXNwZWNp
YWxseSBzaW5jZSB0aGlzIGlzIG9ubHkgY29tcGlsZSB0ZXN0ZWQuDQo+IA0KPiBQdXNoaW5nIHJl
dmlldyB1bnRpbCBhZnRlciB2Ni41IGlzIG91dC4NCg0KRmluZSBmb3IgbWUuDQoNCkNoZWVycywN
CkJpanUNCg==
