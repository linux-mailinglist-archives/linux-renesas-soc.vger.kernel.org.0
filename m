Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C17F61F615
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Nov 2022 15:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbiKGObI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 09:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbiKGOaz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 09:30:55 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECAC21823
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Nov 2022 06:27:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbbwsWx6iCyNazT2/HsfRpvkXnvLKRyqVEpkCLTWH6lsnJec+yQKR5Q/e5RgvqhpgUjyNPax9E1vkHfEsB9spJqi+XxyYdqTLS18PeB5kgvBu6PcmFFwUFYyvBv1FUZoMZfWXDihc2Q9CAfmz8R1up7P5DplN8nLiRNX04Nb2381kI/6evdIN+LcywcFGhpgMQgJ7uze7JkiXP8/utoT5KjAZTNXk4TjhY6oLwHfaeuERTFsytd9yxg9bQ8wh/t7w0TYSE8s6snugAowiR+V7NOOn7Li5CR0vec5heimcg3od/7tqI17HToVStAtkUAr0YoP8JUKGb5mVk0pnFmxEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6/MEQzA1a4oLzZTQ3Lhdq0Al6QQIC9FH/oDhTlvndg=;
 b=kdwZgd9rszjtPbhDxDYSjnEtTAeNombgr598Njg9FEAyzWAy5FmRdk7hBLu8qsGyxzbsYTQrXrvYUYNC3P9knP5Y1iCLJ9Az1NJDQXeXZfTidVJlxMgU+Y0DjdXn+oNEmmjZJtmsYUphr7YjBv1UT3rZbWqKvFUWebadcMAGgR624HNV0aB1O6LnaezQNNWbZUBiCT/OxpJLSufOKZtE6+wgIgJA6gvqgPHyYhoViIVaMyd1YLXY5VF85S9QOKXd40uKQ2LZ5/y6uRSFC6x5+4M9yAwZcIQxyaMnqBgMf2wLtC9cotUTJbMtl6MoxSjL3qt2nU6LJdAaRs3Hg6jAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6/MEQzA1a4oLzZTQ3Lhdq0Al6QQIC9FH/oDhTlvndg=;
 b=cglSc0A3QCnYd/c7J4s0CMY+puPHD6VX28CoqxfsKELZoCINp1HfSG2cckgYEIAmI0wIRlzq6rN5k6Xe+AD2Vu16lfBztk3jlDHJOPEZgIDBxlPHqlrs+j+tQdCozjZTpfNcmKcAOO9rw8/QX9nV30Z+rlepaMN0qpuTDVseHSU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9557.jpnprd01.prod.outlook.com (2603:1096:400:19a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 14:27:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 14:27:09 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Lee Jones <lee@kernel.org>
Subject: RE: [PATCH v5 2/5] clocksource/drivers: Add RZ/G2L MTU3 core driver
Thread-Topic: [PATCH v5 2/5] clocksource/drivers: Add RZ/G2L MTU3 core driver
Thread-Index: AQHY6hNAJYj9EqHn6kCGVCldveg3A64zkuWAgAAAgiA=
Date:   Mon, 7 Nov 2022 14:27:09 +0000
Message-ID: <OS0PR01MB5922AE3F1A115CB00E6B1599863C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221027144844.85149-1-biju.das.jz@bp.renesas.com>
 <20221027144844.85149-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVghus=mN0PajCsY5CAO+sT-NQPL9NJ5e=3wtqMOcahSQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVghus=mN0PajCsY5CAO+sT-NQPL9NJ5e=3wtqMOcahSQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9557:EE_
x-ms-office365-filtering-correlation-id: eca63bd3-a8e5-4069-ddf1-08dac0cc27bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IzgwAO1wuiB+coWdh6Zcsbeia4F9SkmJGdwnPO/Mwmf5qxILHrYmDvAHSX6YTfdXRUOma7wHbC2ufzKvP4Z/SxNDmAehDR01ygCDhlQmcek4sKbeKbVJ1lB4X8nIz/4URSQ2yE7ex2VbMD+Lrla2NrglANOScV3Tq5GF9eJPzl9Gqty0Di/0yFuSLf6pG6YlIBEpAt01WT+SMfFvIDcgoL8jAX7ewp3sW+zZaInx1FGY+I5OP84aWBXPYu+hsUJx6tWKprDi/8ATyXuIyiCf2vLhpalqN0nd/asSuepHMAATLdv7Dxf/+tPZj55psfyF2I1x2q9RYlQnvFYvR9SLv6ZjJqmB9Tbf/c1IX7skB/ly2un6bZ2L6QqqvfpHiU/lwpJXLBO0ZnWBVzX7rdfGFDAK65By5qpUk1di8AvJ6UwHDt4dOptVJrNekml14h+olws+d6WCtm3iNXn8V2dqD+N+dUaneynxRa+oKggSl+SlrQQwdVbXkVefpVsnZ6cg+TqlfXujzN347msCmVyPXuJ2BV0Lguo9abPvuib8HRtlHP58ByjxMesIpC6Rpm0pmiBpFvI4ixsezWvlflh0MgKAeH1ty+y6Gin721sJr+wkVBArhzpuDt0xfKGIJ8sSUouOOMDbtUIeRAyh8B5k8KwnfIAG6B9G46aRXOhdy45hpLufQcJwes4j40jmn+bXVak2/T8jAy0h/QODSdQYNJ7My3rQQOMrlilcB7kZemtL+kfb/psfXOwHAh6b1MfoixEAT0hAiRLWsiSPmLbeNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199015)(33656002)(86362001)(38070700005)(2906002)(55016003)(186003)(9686003)(53546011)(26005)(83380400001)(122000001)(7696005)(6506007)(64756008)(66476007)(66556008)(66946007)(8676002)(6916009)(54906003)(478600001)(66446008)(8936002)(4326008)(76116006)(316002)(71200400001)(38100700002)(52536014)(41300700001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3IySGJSQmtDMjJ2UGNMOHdEYklGSW5JSWpQdlhKNU4zVFJCcVdzWDE1Um93?=
 =?utf-8?B?bXB0VTFra3BTTU5zblBWUGxZdE1raUFTdC9xZTlKRis0RVpsTUJwb2p0OEZP?=
 =?utf-8?B?eWNoQ3RiY2RWWGNJeWxST2w1Z1c3M29tenBmL1B4Z1FMQ21adU9Za1JLQTVG?=
 =?utf-8?B?S1hiZVFoZGZ4UWcxVDVkKzVHUTJNUEF4SkVoUGdkeUVxRW1PbmthMG5pNTlv?=
 =?utf-8?B?RjNqTm5DTjdqbzlzZ25OcEtkMjQ4T1o2bW9DUHNLNFVjQUtVVFNnNlJvNEUx?=
 =?utf-8?B?R1V6Y2VmUzk3NFZ1Q2g0WlRodHI5TVRIakJIZ0VUNTlIRUx1OThQZlREU296?=
 =?utf-8?B?SVFBYjY1MG0vVklySjFxSDcrc05OdlI3K1hESFhnWmRzMlFBbnlvWlZDR2NI?=
 =?utf-8?B?d0JFNlk2SkZpMG5uNm5pRWNOSkExTUZROG9aY0NXMlE0ZERmVnYyTklNUkxD?=
 =?utf-8?B?VW5Ea3JJUC9LSVJRUVhheXdkOWJUcXFuWmNydldiSVpCNjBvVnI1VWdVUUwr?=
 =?utf-8?B?cGFlSnNmM2lwdTZyRjFaME5LRmowVTFNQS9KQ25LQUhNQVpyUEwwRTdUNEFn?=
 =?utf-8?B?OUNCeXZGc3BGeWZSUHlFK3NMM3RKSWVjNjR4Y2ovazNoRUlJRWtkbUU0RXYz?=
 =?utf-8?B?VmI3VlBLd2FuUUJnVm9ZczdQdUdtN0liQWt1ME8xdG9YSVY3TE94YVBPdWpo?=
 =?utf-8?B?cC9ZeFB2WmtabVZ1QVQvRnRSaVA2WmsybDRKSzY5V24reFFEVG84M1JYSUFF?=
 =?utf-8?B?anlTQndyWWtPQzd1NUZYWklOUTd6cENZNGJnUkxldnhIbmI3dTk3R2tPL0h4?=
 =?utf-8?B?bTNQYnNBNzJUaEJHQ05kTlRZYW5kaFhsdktQTUY2TElXSGR2WmhZcTNrS3Q1?=
 =?utf-8?B?TTY4cHdWblR4S25udmgyamRlRkNBdFVYUmVEVEJBSExKMjkwMksxV21EaWQx?=
 =?utf-8?B?djUxdTFScUwwSDVmVXNXMldYNDFkUjM0bzdyenQycFJpc1g4aTRjdU8rS3hj?=
 =?utf-8?B?WGkyOTN6UmVXeHNVSFhxdVFsS1hZbG1oNExETGtySStybkp6UCtxVHU0Nkx5?=
 =?utf-8?B?Zm04QjA3VnIzNldWWDRLb01wOWIrKytTajRFMnBjcEJZQ1pQSkFHZHpJeksw?=
 =?utf-8?B?bFJhS0VLTCtBNWlISytKdEJlc2pYbDhibWV4dkVHbkdpblNRWm1wSlVzTTh2?=
 =?utf-8?B?NFk3MTNWTTg5Sysyd1lZekRFRzRZNnVzTnFqeUFtS1hqL0ZKZDN3STVmMjBE?=
 =?utf-8?B?SXBLQkdyZ3RTTXRuYzBvMllwa3VPNFRvNW9GNG5aMEJwa2NCWEUyVGZjcFZh?=
 =?utf-8?B?cUpXWVo4ZEF1UG8zeWhDMUN5TmVHTDVsbVJ6Zm9IVWFoQVRyT1RuSHVoaWhN?=
 =?utf-8?B?M3NUT0lyRTZoVkJYd09KOGdSQXVEWldRUWZSODl4VUdkdUtJNmlMWnZxd1pB?=
 =?utf-8?B?RTlWMFpwb3VTRDdJc012YlYzOVdsR2VHeEdhRVZrMjh3MnJmTGtScUtDTjJ1?=
 =?utf-8?B?NmdnYzdFOFhpNUpyTWkrZDRXZjgrS1U0UTJsakpKLzBjUk44RkpXS0wybUM5?=
 =?utf-8?B?QWZyWjRJcHN1VlJQRmNPbHlPNDduYWNDTG4xeWNDZUU3bzg1aU1QUDZkRU9m?=
 =?utf-8?B?dS8rYW5yR0NONzNaVnliOWcvb2xKZUxuTGtUV01raXZpUDRuNHJ4TjVKTEVZ?=
 =?utf-8?B?U1JVMXZYOUVUM3NDTWgxdTBvRmdMaDMrblpseXpJYlVOMS9ma2FhWWIybFVD?=
 =?utf-8?B?b2p5VzNZQklIRk1ETDl6OWdNS3dsRThUUi9KeVlHOGlEVlVqQW9pREtYUTN5?=
 =?utf-8?B?OXdUNTJPU3FYK0pUMUVYa3A0SFo1RzdzS3Uxbmc4bUltWEJpa0hTS2x0cEpN?=
 =?utf-8?B?UmU1dnF2NExxOGtEcGNpM1dOa3lqc0oveVVkMTE1UkVod3A1Mjg5K3ZNZy9q?=
 =?utf-8?B?NFcyM01OMmphYldQTVk2U1VKWjVJeXJ4N25aY3d1bnNYcW1qOTQwSnBNZ3Vx?=
 =?utf-8?B?YW9FZ1Blb0dRZm9HaXhzK1lia053dTgrUnJrMWdLQ0VzTzZxVkdmamNNQU0z?=
 =?utf-8?B?TWcwSE53NXYxZzdIbFdSWTZPZDc2YXUzN3hEcE5aZHRrTEN0VXVUdmpiTk1K?=
 =?utf-8?B?ZHAzYnhQcW9VV0p6UHBDWWk1ZUlGb3ZQS0NuR09lbG1oSTRnNUkvWHpNeFhL?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca63bd3-a8e5-4069-ddf1-08dac0cc27bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 14:27:09.8649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C8/a/KFs+ckG29lzhwos08hjEhJ7ERl6eVAzIKFUaOJhfMXK3IgEIsHde8kjb/vlzRW1/6f2Ir33gHxc2Hcua8BBhwIewfxcWk/gTdQ/5nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9557
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgMi81XSBjbG9ja3NvdXJjZS9kcml2ZXJzOiBBZGQgUlovRzJMIE1UVTMgY29yZSBk
cml2ZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIE9jdCAyNywgMjAyMiBhdCA0OjQ5
IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRk
IFJaL0cyTCBNVFUzIGNvcmUgZHJpdmVyIGZvciB0aGUgTXVsdGktRnVuY3Rpb24gVGltZXIgUHVs
c2UgVW5pdCAzDQo+ID4gKE1UVTNhKSBoYXJkd2FyZSBhdmFpbGFibGUgb24gU29DcyBmcm9tIFJl
bmVzYXMuIFRoZSBjb3JlIGRyaXZlciBhbGxvdw0KPiA+IHRvIHNoYXJlIHRoZSBjbGsgYW5kIGNo
YW5uZWwgYmV0d2VlbiB0aGUgb3RoZXIgZHJpdmVycyBsaWtlIFBXTSwgQ2xvY2sNCj4gPiBTb3Vy
Y2UsIENsb2NrIGV2ZW50IGFuZCBDb3VudGVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHY0LT52NToN
Cj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gICogTW92ZWQgY29yZSBkcml2
ZXIgZnJvbSBNRkQgdG8gdGltZXINCj4gPiAgKiBDaGlsZCBkZXZpY2VzIGluc3RhdGlhdGVkIHVz
aW5nIG1mZF9hZGRfZGV2aWNlcygpDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2Uv
S2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZw0KPiA+IEBAIC01
MjQsNiArNTI0LDE2IEBAIGNvbmZpZyBTSF9USU1FUl9NVFUyDQo+ID4gICAgICAgICAgIFRpbWVy
IFB1bHNlIFVuaXQgMiAoTVRVMikgaGFyZHdhcmUgYXZhaWxhYmxlIG9uIFNvQ3MgZnJvbQ0KPiBS
ZW5lc2FzLg0KPiA+ICAgICAgICAgICBUaGlzIGhhcmR3YXJlIGNvbWVzIHdpdGggMTYtYml0IHRp
bWVyIHJlZ2lzdGVycy4NCj4gPg0KPiA+ICtjb25maWcgUlpfTVRVMw0KPiA+ICsgICAgICAgYm9v
bCAiUmVuZXNhcyBSWi9HMkwgTVRVMyBjb3JlIGRyaXZlciINCj4gPiArICAgICAgIGRlcGVuZHMg
b24gKEFSQ0hfUlpHMkwgJiYgT0YpIHx8IENPTVBJTEVfVEVTVA0KPiANCj4gQXMgeW91IGFyZSBj
YWxsaW5nIG1mZF9hZGRfZGV2aWNlcygpLCB0aGlzIGRyaXZlciBuZWVkcyAoYSB2ZXJ5IHNtYWxs
IHBhcnQNCj4gb2YpIHRoZSBmdW5jdGlvbmFsaXR5IHByb3ZpZGVkIGJ5IE1GRC4NCj4gDQo+IElm
IENPTkZJR19NRkRfQ09SRSBpcyBub3Qgc2V0Og0KPiANCj4gICAgIGFhcmNoNjQtbGludXgtZ251
LWxkOiBkcml2ZXJzL2Nsb2Nrc291cmNlL3J6LW10dTMubzogaW4gZnVuY3Rpb24NCj4gYHJ6X210
dTNfcmVzZXRfYXNzZXJ0JzoNCj4gICAgIHJ6LW10dTMuYzooLnRleHQrMHgzOCk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYG1mZF9yZW1vdmVfZGV2aWNlcycNCj4gICAgIGFhcmNoNjQtbGludXgt
Z251LWxkOiBkcml2ZXJzL2Nsb2Nrc291cmNlL3J6LW10dTMubzogaW4gZnVuY3Rpb24NCj4gYHJ6
X210dTNfcHJvYmUnOg0KPiAgICAgcnotbXR1My5jOigudGV4dCsweDE4MCk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYG1mZF9hZGRfZGV2aWNlcycNCj4gDQo+IFNvIGVpdGhlciB5b3Ugc2hvdWxk
IG1ha2UgdGhpcyBkZXBlbmQgb24gTUZEX0NPUkUsIG9yIG1vdmUgdG8gYW5vdGhlcg0KPiBtZWNo
YW5pc20gZm9yIHJlZ2lzdGVyaW5nIHRoZSBzdWIgZGV2aWNlcyAoZS5nLiBjYWxsaW5nDQo+IHBs
YXRmb3JtX2RldmljZV97YWxsb2MsYWRkfSgpLCBjZnIuIHJwY2lmX3Byb2JlKCkpLg0KDQpPSy4g
SSB3aWxsIGFkZCBkZXBlbmRzIG9uIE1GRF9DT1JFLg0KSGVyZSB3ZSBjYW4gbWFrZSB1c2Ugb2Yg
bWZkX2NlbGwgcnpfbXR1M19kZXZzIHRvIGRlZmluZSBzdWJkZXZpY2VzDQphbmQgYSBzaW5nbGUg
Y2FsbCBmb3IgaW5zdGFudGlhdGluZyBzdWIgZGV2aWNlcy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+
IA0KPiA+ICsgICAgICAgaGVscA0KPiA+ICsgICAgICAgICBTZWxlY3QgdGhpcyBvcHRpb24gdG8g
ZW5hYmxlIFJlbmVzYXMgUlovRzJMIE1UVTMgY29yZSBkcml2ZXIgZm9yDQo+ID4gKyAgICAgICAg
IHRoZSBNdWx0aS1GdW5jdGlvbiBUaW1lciBQdWxzZSBVbml0IDMgKE1UVTNhKSBoYXJkd2FyZSBh
dmFpbGFibGUNCj4gb24NCj4gPiArICAgICAgICAgU29DcyBmcm9tIFJlbmVzYXMuIFRoZSBjb3Jl
IGRyaXZlciBhbGxvdyB0byBzaGFyZSB0aGUgY2xrIGFuZA0KPiBjaGFubmVsDQo+ID4gKyAgICAg
ICAgIGJldHdlZW4gdGhlIG90aGVycyBkcml2ZXJzIGxpa2UgUFdNLCBDbG9jayBTb3VyY2UsIENs
b2NrIGV2ZW50DQo+IGFuZA0KPiA+ICsgICAgICAgICBDb3VudGVyLg0KPiA+ICsNCj4gDQo+IEdy
e29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4g
DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UNCj4gdGhhdC4NCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
