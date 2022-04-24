Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4FAF50D051
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Apr 2022 09:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236428AbiDXHx5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 03:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235287AbiDXHx4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 03:53:56 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB0E50E2E;
        Sun, 24 Apr 2022 00:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FafJRfupPGfdLsM9gdPmZqUl5208MEI7zdm5iEByuVEtVifQEP6w4fi3DPpXuUJ6PkgZ0RP9BN8iv8MjhiRnY2BolRQVdA83E4bvLn86encll3ySF5v7omSC7HMXVAsIKU3gV3xIB+NrvXgPLCS9X50KQ94v0OPO2lGVVHGj0ZYk8/VKFiXRx+X9KEnMuPMyhvbluZlUXTSGEfMa4wetuWXEKG7rLCoZqhxTIYRlNTaon6UDGxuTKb7apryM2WoYPt4CssLDAjTUriDyG1nSz9vk7mGpiTPr4DjGmavOZ+Hv1KRC32rNUx9/10Oozvh0g+4TC7xt1s4e1UWI7jbTnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXn0a58JTFUMJO328BlATlv8PhCNUZu5QtgwFuG4glo=;
 b=i5MoDRaQrCqgz9isVbVygScInIEq6RMhYWP82Ry6MfSAq8KctO6DnwwHDeY9HyP/FMezrFX8ykH4PMuXH8YLamTAHfOo9npl3KomUtJMi95loaFK0hC+lX4oKZ7CEE0MCPjCDsba9nUaUtCLbJ4HuroP+LrimFjPqLdrGsXIk0cRUXw6aNXlX4MfTWRILV2bS/NJ4gC1/iU7jOfkaLNMfnNadGYH4U7qylkOPV0H+dslcmtQlcoOwqZaA+NgAuXowKriJbpquzJZqMGnpsTeTA/qvB/IVyoUp+IJhPixeNMz+9u/3OC/EsDKwPHAw03Jdgqk6FWxf5hEOXV++h/Oog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXn0a58JTFUMJO328BlATlv8PhCNUZu5QtgwFuG4glo=;
 b=d6ST/k69ybqOKkDbU/K58Sa7sS+WNd+1TOsjgwY/YcMApb8DT72W0jIeKdiw639SQqRxnQOmnF98YQB870o7nQVLCTL/EYNlP7n4aHNaocZU+jkfmpzu+afEuOEo/cXbmh0I1pfwzz66JkkyXedSeSOoYX2me2c3Tgc+AP/Bhs4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5380.jpnprd01.prod.outlook.com (2603:1096:604:a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Sun, 24 Apr
 2022 07:50:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 07:50:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external clk node
 names
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external clk
 node names
Thread-Index: AQHYVxtpZzDNpS2cMUqYhuvLl0rlk6z94/kAgAC6McCAABNF8A==
Date:   Sun, 24 Apr 2022 07:50:51 +0000
Message-ID: <OS0PR01MB59220968EBDF76A16F7E63A386F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423140658.145000-1-biju.das.jz@bp.renesas.com>
 <f9c6e5e2-c819-d309-0c11-b87deb772858@linaro.org>
 <OS0PR01MB5922CFACC8FEC6D67E6BFC4986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922CFACC8FEC6D67E6BFC4986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a2c1870-5ddb-4254-ad12-08da25c7279d
x-ms-traffictypediagnostic: OS0PR01MB5380:EE_
x-microsoft-antispam-prvs: <OS0PR01MB5380A917E7CE30F58731CC1886F99@OS0PR01MB5380.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s0FoWB/jI73v555ZyWCYGDBzGkSShe1XEj24CTkgGObKmbTcW6H7HLiwM4bd3Fovixc8/jL4cq1HODI8j5f5hwdTbOFqlHW1Eg3ZgcwfVza2Hlo9STZHRu4lJC0AZnxNShXWQkPC0+8fEZequ2DLFkOsOkJN5iA99guZA4y3L5roFmKw9m6F1ZkTGooYZt/uAatfhe2ix3JbGtOHZ6r9iMkF4BsPJ6CJbf+O92GHYcSR9O8OzzyV9E2AgykE4sgx3l4GRQXTsF2LDC80sf+A0goAxrrNYECqJEUSkk25CQ/7P6a9cw/w/2tlIhEXtDpjxIzZLskvg+jmzis/6/iB9iu3Re1ayrBFLg1tZd734t9DgeAN7tOcFo/DaL61dsIaXotsh0vxFTS0Qm/C4po6z8wmOwLcZsBXvQymc7W8euzzxj+AiPLQ/2vwzHHEshCWDHyqpCByGESh3DiWQ27hxkNws8Th2tbdl1cmz+437Nqe3cJCR7VawfgNVfew15KaD4tZDj0MZ+mFamYU8JguKXCb/cG+LZswMdZ9KUG+4a8mMdAEX1YzBgz325a4QyreQyKTdG/KVr4iryPvwwDsU1QO+CLaS9Ams3xW2GYIzPA1uschgxYLwB2rnctsK1PviOyMHGHUcyMLFOBbFJQtEWL6ViCtfYQ2TjMtaP+ioly1qJKv4/8P9O3LJxnjW+gwVsmfeNNHstWLkhsHbJsasQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(71200400001)(316002)(83380400001)(26005)(55016003)(33656002)(2940100002)(53546011)(7696005)(6506007)(9686003)(5660300002)(52536014)(107886003)(186003)(38070700005)(2906002)(8936002)(54906003)(110136005)(66476007)(66446008)(66556008)(64756008)(122000001)(8676002)(4326008)(76116006)(66946007)(86362001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEV4LzZJYmhRTVJDYnZSayt1bWtEaVA1RjUwaHBUVW4veDQ2VGRPaThoRzZO?=
 =?utf-8?B?NStKVlNaREpsbUxVQk5LZFN6bnhqV2lLTWhvbm5hV3NpT1ZxdkxHaEVlajNt?=
 =?utf-8?B?cExzdE5rZWtsRDU5dFc4Sm5JUW5jS1lSTzV5ejlYZkx1SHhIWGxxUWV5Uk1U?=
 =?utf-8?B?bU0wcHVPRVhBMVVrNmtrL2lUZlYzaU1vTzBXWUs3NklyK1BLYUppRU1aR20x?=
 =?utf-8?B?Zm1qVHB0Ymk1cXRjdVNPQnJGaVUxUk9yOUYwLzhIaHBrWldDaVZocm13TElB?=
 =?utf-8?B?bFBhZXBSbklLQ0lQaHpCdU9HaDloVjVMaTZ1N2pOazg2MTlLQVBwSWhnNk1J?=
 =?utf-8?B?ZFVJQTlENWIxbmhiRHVvNmdrVUF1S3l2RnptVFZ3eHFzajB2TStJWlF5NnNu?=
 =?utf-8?B?N1RZK1Z4YyswaHFwN1BIdGx5a3hhRjNVOFQ2NTVTUERITXNvL0thNU9CSG1N?=
 =?utf-8?B?dUpBL2hXWlRwMUtHSDJ5OUNMaDhBTld4N212aVdUN1EyTjNWUG1uQTQ1WGxr?=
 =?utf-8?B?MkNlZTJWcXZJTERZSnRUMFJIc0NiQmpxTWtOMnNaMW41WE1IY2VTTU85d0s4?=
 =?utf-8?B?ck5BUFZhSWNRWmdSNEFMTWZJQWtsL0pSeTViQ3gyUkdZNDQvaFk2MTVaR3lQ?=
 =?utf-8?B?SDZqVWxYT0UwaWlINEUvTEFSaHc0aGR5bkxYd2F5OGlJazRjcXRNRTk1Y0Nz?=
 =?utf-8?B?K0M1d3dhcmVxeW16WWJWeGNtVm9mV0NxWGdXWnBzT1pKQk9NRFV2U1pYV293?=
 =?utf-8?B?ZktnWnh2b1M4bm44NlBUYXZtc2RDdnVhYk5kSHJ2b0QvVDE4bmNFMklqeGNp?=
 =?utf-8?B?V0k4TEd1ZFM4K09XMzY1WlNHQzVmNEJtWXBKVFlDRnY1V005WXMzMThKNy9B?=
 =?utf-8?B?cldUdkdYc2Q1UlRNV0Q2b05MLzBQVVEwM3MrcVM1MjY2Q0VEd3JnbXdQUDNH?=
 =?utf-8?B?S2FnUnZjdTZLdmpwV213eTZQclhHN29YcmJGVm5TRzVqbTcwT2lmQTZEcVh4?=
 =?utf-8?B?akw4bFVRYXd2VTYwdFFxa2tjNVdQMnFLRHNhLzd0V1VuQi90OWpGdzFRcEhr?=
 =?utf-8?B?cmxmVmdGeHF4RDRXMG41OUhHTjZFVUVLc0hhZzI0NW44K2VhZmNORTUyMzFG?=
 =?utf-8?B?dGJBMHM4WjE3MDg3OEt4N1llRUVpWTFaQm1RdHNMSngxUENWSTNLRmFoR050?=
 =?utf-8?B?OG82Y2JaWXY2aGNsOFk0dlRLQnFGTWlFT0lycTBRNzEzTW9nRHlTTGp0U3Ri?=
 =?utf-8?B?V1lGS1FKNkptbUgrT1BNK0N1MUh5QmZzMHhoTlUybzR0d2pncVJIcGsvU0cr?=
 =?utf-8?B?Y2JIWUNiNm1OeUQrMlYrLzJ4VnptRjJwUlN2UmNGeVlYZjVkK3hpa2dONzVZ?=
 =?utf-8?B?SkRWTmMyRW5ySnZ3NXJFb0NMYW85Q3c4c0h0bVk1dzhSWjM0cGtzVkpnYk9h?=
 =?utf-8?B?aUowRzhONnpUNnl5aWJkWjlNbEpJd09rd1RncUkwbWV3Y3ppaGFKbGpUY3Rv?=
 =?utf-8?B?UXJjUC9HRTBPOFRvNXAwR2FPZm8rTjV3emZhZXY5VlZ2cXJDamlPUEw5TUps?=
 =?utf-8?B?citobzA0dXFheVVGODJTbmw4UnRLMkw2R2MxUWFsWEtCWjhTZjBlN2txV2hU?=
 =?utf-8?B?T2NPdTFRV3BmNEx1MGVxaHVUU2VrZXJreWFNKzFJRXNBV28zZGV4NDBKYmxn?=
 =?utf-8?B?LzJkMS9xSFlvOFBVOWdJRkR1UkozUmRrMWwwRWpwK0FqNDZZVHI4SFFFMnVU?=
 =?utf-8?B?eGZzbHJIbmN4ZFhXY1oreURMV1h3VjlmZGtlTlFoOThtK2x2TDBaYlhIYUxM?=
 =?utf-8?B?UUdHMmhaOS8yam5rUm02NGZEQ1hmb3FrVXFuY1RlNUJ2bURKa1J6TVFLOHJY?=
 =?utf-8?B?V3ZXSU9LMHpBWjdiTTdsUWxzdnZWczFXOXVNMDB3N3hBQ2JFVUJiek0xQVJh?=
 =?utf-8?B?V3pSazVFR05LemRBLy9CWTAvdEoya2FSVVQrbmRBOU0xSGM3Wk5kMkFkOUZy?=
 =?utf-8?B?OWdzb2Y4ajlYOUw5RC8xclVIT0p0SFJiVjBxWDl1MXVTKzNMQmQ0dnpocm5X?=
 =?utf-8?B?RUdnZ29FeCtkWUJUTVBmUmtSL3hIaXpaa2h5MVdiOEhicWlDUnB5VFVFNVQ2?=
 =?utf-8?B?a1R6V2taNXlWN1QyZzhic1M5VmpwMVVVcHVSWllka2phcnZiOFZwWTlIVzdZ?=
 =?utf-8?B?aEgzSTFZT1RuMGFBa0xERmUrelV3TnFBYXpOQ2ZPaWZtN2l6b3kzTXFoZDg3?=
 =?utf-8?B?UVRMQU00VXVqNlArL05CbmplUE01N1NoN3VsRDlHMzhtMm9tWktiUFk5M0ZE?=
 =?utf-8?B?VWFTSUdkZEZxN3dFWG94Wm9KUEZtWFJVMW0xNVozMVMyNlhibytRcVQzaHpn?=
 =?utf-8?Q?49KeDky/mtXxfDzY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2c1870-5ddb-4254-ad12-08da25c7279d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2022 07:50:51.9398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oRPu8dw+WOMpXSS8qqnsgSlyUPsQNPNZKRAGHwmd2nMPvUfLwTHXZ841TF9UHq+MUkIMEgcMfbOZ2QHhbPY422ymJt0GiIsoa8aBk3s11sQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5380
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBTdWJqZWN0OiBSRTogW1BBVENIIDEvMl0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDdnMDQ0
OiBGaXggZXh0ZXJuYWwgY2xrDQo+IG5vZGUgbmFtZXMNCj4gDQo+IEhpIEtyenlzenRvZiBLb3ps
b3dza2ksDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gDQo+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCAxLzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0NDogRml4IGV4dGVy
bmFsDQo+ID4gY2xrIG5vZGUgbmFtZXMNCj4gPg0KPiA+IE9uIDIzLzA0LzIwMjIgMTY6MDYsIEJp
anUgRGFzIHdyb3RlOg0KPiA+ID4gRml4IGF1ZGlvIGNsayBub2RlIG5hbWVzIHdpdGggIl8iIC0+
ICItIiBhbmQgYWRkIHN1ZmZpeCAnLWNsaycgZm9yDQo+ID4gPiBjYW4gYW5kIGV4dGFsIGNsa3Mu
DQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I5YTA3ZzA0NC5kdHNpIHwgOCArKysrLS0tLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDQuZHRzaQ0KPiA+ID4gYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0LmR0c2kNCj4gPiA+IGluZGV4IDE5Mjg3Y2Nj
YjFmMC4uNGY5YTg0ZDdhZjA4IDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpDQo+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcjlhMDdnMDQ0LmR0c2kNCj4gPiA+IEBAIC0xMywxNCArMTMsMTQgQEAgLyB7DQo+
ID4gPiAgCSNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiA+ID4gIAkjc2l6ZS1jZWxscyA9IDwyPjsN
Cj4gPiA+DQo+ID4gPiAtCWF1ZGlvX2NsazE6IGF1ZGlvX2NsazEgew0KPiA+ID4gKwlhdWRpb19j
bGsxOiBhdWRpby1jbGsxIHsNCj4gPg0KPiA+IEhvdyBhYm91dCBpbiBzdWNoIGNhc2Uga2VlcGlu
ZyBzdWZmaXggImNsayIgZXZlcnl3aGVyZSBhbmQgbW92aW5nIHRoZQ0KPiA+IGluZGV4DQo+ID4g
KDEvMikgdG8gdGhlIGZpcnN0IHBhcnQ/IFRoaXMgd2F5IG9uZSBkYXkgbWF5YmUgc2NoZW1hIHdp
bGwgbWF0Y2ggdGhlDQo+ID4gY2xvY2tzLg0KPiANCj4gSnVzdCBhIHF1ZXN0aW9uLA0KPiANCj4g
WW91ciBzdWdnZXN0aW9uIGlzICJhdWRpb19jbGsxOiBhdWRpby1jbGsxIiAtPiAiYXVkaW9fY2xr
MTogYXVkaW8tY2xrIg0KPiANCj4gSW4gdGhhdCBjYXNlLCBJZiB5b3UgcGxhbiB0byBkcm9wIHRo
ZSBsYWJlbCBpbiBmdXR1cmUsIGhvdyB3aWxsIHlvdQ0KPiBkaWZmZXJlbnRpYXRlIGJldHdlZW4N
Cj4gYXVkaW8tY2xrMSBhbmQgYXVkaW8tY2xrMiB3aXRoIGp1c3Qgbm9kZSBuYW1lcz8NCg0KT3IN
Cg0KRG8geW91IHdhbnQgbWUgdG8gZG8gdGhlIGNoYW5nZSBsaWtlIHRoaXM/DQoNCiJhdWRpb19j
bGsxOiBhdWRpby1jbGsxIiAtPiAiYXVkaW9fY2xrXzE6IGF1ZGlvLWNsay0xIg0KDQpBbmQgZml4
IHRoZSBwaGFuZGxlIHJlZmVyZW5jZSBpbiBvdGhlciBkdHNpIGZpbGVzPz8NCg0KUGxlYXNlIGxl
dCBtZSBrbm93Lg0KDQpDaGVlcnMsDQpCaWp1DQoNCg==
