Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56C8D50E469
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 17:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242850AbiDYPbe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 11:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237719AbiDYPbb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 11:31:31 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340E710FB41;
        Mon, 25 Apr 2022 08:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGnVvKgpTh4yGCBT7oO/r2inZ6TyOcO/46zWY694uTLEe0fojFS2jjXnR32sL5GY7PtRlULJjZmIHvnv2HOjK9Dws82WPuTqgDCodzkQZD6qXjmAgLn4/omYt/u4O9ARwJaKWZnD29mLiBSqfx5Ppkw5e9n5QTESbJtxmY4gaviN9rVMDGXpZoJFBUvLyGTUG9ep/3wtINUgiWU1plOe8bdobOt1a+TE1UfHdutJvZ5y1umKqfihmhMsC9Pm9mlg+7AbP9HIJcBkXaW61Q9zJAh2ZvrKO9v0R5MWFJdwSWonMo50kXRmtXLR2r3l0cCbqIOgpkLdtcBoN7hpgcU+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mf0eio4+BRSror4xNPNtQ+BSokTyys9T/GP7LPbAUXo=;
 b=l+kTkJihYvJrygh1R8NfBVmwunVeW2/ReTekRyg1PNMgo6EBXh125SD5ZFzDWZ0ONIjsGjMiPN02BNwckIz+S9Hpw2vGMSqtXt2RbvNW8jsymJQlR77jCqnS6I8jlmTwd/0wwC758gb2eTFTlJNuuaKiWAfm9m9/G4mic08apPqhe2s3anYadiLYIijxdoHdYtQ8tSENEaJUt+i2nPy9xx0/mbnpD0Tbr7zMNZc9WecZQyRs1xbd7WmxjGUJJfZL9yi2CmKnCzprFjsG6q/4OM24lN4fMqUQZhRjNTonJJyT8SEJMWLXGASwGz25xiiycUnkLNJNJ1MtzF29NGEH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mf0eio4+BRSror4xNPNtQ+BSokTyys9T/GP7LPbAUXo=;
 b=HgZxLZhOd9SB8L4flZHlVmaNYfusaVZWUWE0xkF+vUUEeiKFhXTb2giXPYkE6/4/Y0COQRzMeBWvCJqkOuHlHnxbsaPx083BqNdZ3UbqCcRfjYZX/HUnkonVMyJrSpW3yQI/k4TnixSOZaNaXtozT+hBDbhAm9BH0hmKm9nz+A0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10373.jpnprd01.prod.outlook.com (2603:1096:604:1f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 15:28:22 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 15:28:22 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Thread-Index: AQHYVxtpZzDNpS2cMUqYhuvLl0rlk6z94/kAgAC6McCAABNF8IAAJb8AgAACQVCAAEqYgIABnhbw
Date:   Mon, 25 Apr 2022 15:28:22 +0000
Message-ID: <OS0PR01MB59222BF5C0D4749C8AAFC57F86F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423140658.145000-1-biju.das.jz@bp.renesas.com>
 <f9c6e5e2-c819-d309-0c11-b87deb772858@linaro.org>
 <OS0PR01MB5922CFACC8FEC6D67E6BFC4986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220968EBDF76A16F7E63A386F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <7bd2ae6d-c55f-4ab7-0c98-72da0d5d4050@linaro.org>
 <OS0PR01MB5922619EE8816DA1676BAB4D86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ddf78c65-7cac-04cf-9f8d-e19335815473@linaro.org>
In-Reply-To: <ddf78c65-7cac-04cf-9f8d-e19335815473@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 078c82c5-81e2-499f-1633-08da26d03bc6
x-ms-traffictypediagnostic: OS3PR01MB10373:EE_
x-microsoft-antispam-prvs: <OS3PR01MB103731C62CFFD45A2214D6CDD86F89@OS3PR01MB10373.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WKukgdlrgEufbYnI9aZ63JeAspeL/9aITonIinKZB6qb2BxQQ0I5lL92iuM1ldfAEkVNJll0KPp1LH/pjPwOA1bOQZw2raxnKQyI2WcgbUipA1YxjTRhn1Z7I7BIGJearWADF2J+46xvt0VieI/vbLopmfg9IRUKTnsOgmqmnPcKoTUWX8lgOctRgDI8Wat2oCGVc09UU7+mSrpOkriGFq2v5NioW3w5JIepgwx8FLqNbkYRi5dqfrdzqtuKTLYhiHH8jDkw53oc2Q9fhHqRsplvX//IMzansrMtDLzejFa+dU9rb/f9wUAocILrg8qy+PX4JIG5fJNXrJB/ZYpnvlPkYEsOP2Nhwol23KcCe6wL0ZkTULgVHeElLgJ+axQwve7pUio6WmfaYlq1tyA5TaVOBHT8DMXcTga42//R0DOGIkE6U0QbrkHJNn0Bvedq7n+wVK2t5V09nv5LSmm0BdExQTfcw/inYiyDioT2IiFZqPB41kHnKDRqFzFzpVwg+p7dBJlLRKZGCyq4cMORzss2vTl0NRA72/VIEbGigzn4W08Le6j2MQPpHXb09TgIR+pD9VHAfxd+l6eSn5OEY07e1TDmAo+wczEQVZhTwCr8y+RlebwDdSypix0tnoJHdUeDQh/X2ePDBt+xtjGy4I3IICYHahYU3mn7TS+awUR7D7zuCX6Fpb/bl/UsWSvozWsgar677O5OlQUhdaNaLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(2906002)(107886003)(53546011)(4326008)(186003)(5660300002)(110136005)(9686003)(26005)(54906003)(76116006)(66946007)(66556008)(66476007)(64756008)(8936002)(508600001)(52536014)(66446008)(33656002)(83380400001)(8676002)(316002)(38100700002)(38070700005)(7696005)(122000001)(55016003)(86362001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0NNOWZpOTMvbnhPMVY0N2VMWjdUUWVQbVNZYitiOHFrRWxnSkJIbXZrelEr?=
 =?utf-8?B?T202OFN5SDNyQ3hDeHFqOWVaMDJnaDF5R1RSOGFpNEJETTIyUG9mSENZbFVv?=
 =?utf-8?B?ZVpQZXFEUy9vUFNXWDcvMTRNRDBEWUVNWVBzdTlFK3B5YXgxM2JoOGh5bGM4?=
 =?utf-8?B?emVTbU9PbjNMYjk4bFM4dkFaQkswMTQ0L0VpZ200eDlxSU5SdjY3dERPNWYw?=
 =?utf-8?B?clRFazdJK2EvMzJLNGhITE1BNE56TmFhKzBZa1dkNjRtR2JvSlhSL2w1aTQr?=
 =?utf-8?B?TFlMT2srSWRNWmNVeTVDa09qb1JFTEdqc0djNjUxY0F6S0JIdEJYclZlUzF5?=
 =?utf-8?B?bzg3TlNHUkVobHZGYzEvdkNoZytZa1dxRzNYa001YThMUGE1MXRSZVRZNjZ1?=
 =?utf-8?B?M0VTekpCLytNSjZhQ2dBMVcxbkNJakV0Q21rQTh5NnpwRzJzaWNnTm9qcGJE?=
 =?utf-8?B?OE1BdUU1U0tBcGd3aC9ZZDRmZVcwRVoybVlFVlE5dExWZDRqUHkrUDh5MXk5?=
 =?utf-8?B?NDhJUXZWM2RXNktyNk5ldUhnWGtSbXc4UEZRbU1XL0xHUW9WcVFXYlJaMnRO?=
 =?utf-8?B?cGt5c1lhWkNGeDM0Q21rdWRIQ0RySm5yNjZFdit1cGRiZHlNRWNkVU5FY3do?=
 =?utf-8?B?RWJQU0NQcXlBYkJ5OFFEY0Z3VW1hOEsyOHhPbUNNTW5jUEV5ZGhZcTZsMmsv?=
 =?utf-8?B?VCtCaGcxREpteHMzcXFwRi9mZFFwQWNHNGpoSzIzL3BidWNra3A3aHA5cllk?=
 =?utf-8?B?eERlbnFOelYvZVFHZ21QVHVRamNtY252QjB3eTM5NXp4VWRSaUU3NDhqRmgx?=
 =?utf-8?B?NU9HUGNLWmE4TEN1UDg1cUs5a1RjUDMwZDluM1E2T0FLb2tDQUdFS3N3WXVu?=
 =?utf-8?B?TDRwR04wdFQwbThud3c0UXhucExNYnJzWlJ3NGlib2FTR1psRG9uWTg5Z3FF?=
 =?utf-8?B?WmpBWTU0NWFNMGxia1lqSEwyaVNFR1hSV2ZyNCtWa3ZTa1lwM2RXdGlRNjdI?=
 =?utf-8?B?a0JGWmo3OENTQlVwYjd0alRZVGZOQzZJZ2piWjJtOHZ5dmZDUHVWaVpidERB?=
 =?utf-8?B?OS9CMTJtelN2RmtkTWZ5TEVwTFJsem9lN2NtL1g4UUtGemoxclVHODNWWVJU?=
 =?utf-8?B?MmdvUjVNTUU0THZacGhzTnYxdlBQU3dzRnF0UWx2amMyWUhwd3VzVDhSZlZk?=
 =?utf-8?B?cXkycTk4Y3hsbEVSbjE0aStDNGRQVSs1cUQ2emZZby8vUkJNekc4RUNFN0Fh?=
 =?utf-8?B?WTBjbll6MW1uNnhLakt4NVpaUWgvZ1ZxL3ExZkx0bit2S1B1R0M5eXlQeEpN?=
 =?utf-8?B?eFhtM2wzZVJWWmxyQ0lnUVp5dU1EN2lMdTVpQkJ5YXAxQ1dnLzM4S2VQOFFP?=
 =?utf-8?B?N2ZLSkQrcHNOMTRuVnlJbWZGeDRiQlNrcG5FYm5YTGt4QmlTY2RJSzQ3TW84?=
 =?utf-8?B?M01hQ1VIZENsdTZ4MVhKeE1kaWl6SjZmL3JwWVhvOFlkYzZGbEhhMXhPb0ts?=
 =?utf-8?B?MVpvWXpMV2djQ3hhNmxFQzEyMGI3dmY4TWRka1p2eFJ5TWQxWkRnQ2hzdUJW?=
 =?utf-8?B?T2ozNkc1dnhqOE56SURtaVlEd1RKNFNhc0tod1BlYm5xOVRqb1RsUTI4MHp2?=
 =?utf-8?B?OXhsbTBaTUhROFRmNGZqSjBGNU45aStrUm5zLzQ4bEJGQTRFelJYbTVXaDZn?=
 =?utf-8?B?VVYwN1Z6Sy9KMVBtSmx6WVFOUXp1UWNoQWVvenhPTjBBRlFnZStkZ1loU21R?=
 =?utf-8?B?TDJjc1Q3Zk1RUlNncjMwOVBXeDFxUjBvMXhUTXRQb0YySzRISGpTblRDN3BH?=
 =?utf-8?B?eWZzd01yZWFUcHgyUXdqOHZvWEpHR0VtdjlPWFhYeFI5N1JMbnJnN2d5bmU0?=
 =?utf-8?B?QWlLVm1EMTVxcU9FMjlielhQUVowQ0lTTldjS3E0bS9Pck9DY1RlZjlabmcv?=
 =?utf-8?B?cWN6QmdoVk5TaVppVEhlVGNNSHdtVmw2bVdTeS9LZFJTamw4Z0Q4SmlRc0dD?=
 =?utf-8?B?TFcyMzdzOEQ5QU8yL1ZYS1VBZXhtS2ZTb2t4cmhtY1NacTZRb3VLZ3Y4bk5V?=
 =?utf-8?B?VDRSbExkWDlDcDVVZk51UnN3eUd4MmV3dEdBWUc4Q2UrbDRJTFZONHdvUm5F?=
 =?utf-8?B?YlBYakdUWSs2QWl0YU5ONEJleEsyNEp2WWRlM0lMeXl5QWhjUjcwbFkzK0JH?=
 =?utf-8?B?V0o2djl3QlhtSUU1VWhDYmdmZC81QlpaRUk4MHNJN3cvOHVxRnpuV3pEYlNn?=
 =?utf-8?B?RHNRdEVuVDA5SURxdnFpYUVzQUYxdGlOSTJ2MEN0RHFCNENIZjMweVNkbkVu?=
 =?utf-8?B?Yk9TSm9aemVRVjJZWXZSZGNGODZTeHdEeTZxR24zTUQ4Y2NMaFZ5Ymd0bysy?=
 =?utf-8?Q?O1MpgI8S15K0bDEw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078c82c5-81e2-499f-1633-08da26d03bc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 15:28:22.3768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o8lqXe1hGRSXaGKpO8JkEebRL39hWAnSDgmMEKQuoIno8q21MB1wGMWGkSRoIFzB56xiO3ease9YMH9WBokudOe1h8TpAcSwn9fIQU3E7oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10373
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0NDog
Rml4IGV4dGVybmFsIGNsaw0KPiBub2RlIG5hbWVzDQo+IA0KPiBPbiAyNC8wNC8yMDIyIDEyOjIy
LCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KPiA+DQo+ID4g
VGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAx
LzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0NDogRml4IGV4dGVybmFsDQo+ID4+IGNs
ayBub2RlIG5hbWVzDQo+ID4+DQo+ID4+IE9uIDI0LzA0LzIwMjIgMDk6NTAsIEJpanUgRGFzIHdy
b3RlOg0KPiA+Pj4+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMS8yXSBhcm02NDogZHRzOiByZW5lc2Fz
OiByOWEwN2cwNDQ6IEZpeA0KPiA+Pj4+IGV4dGVybmFsIGNsayBub2RlIG5hbWVzDQo+ID4+Pj4N
Cj4gPj4+PiBIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KPiA+Pj4+DQo+ID4+Pj4gVGhhbmtzIGZv
ciB0aGUgZmVlZGJhY2suDQo+ID4+Pj4NCj4gPj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJd
IGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0NDogRml4DQo+ID4+Pj4+IGV4dGVybmFsIGNs
ayBub2RlIG5hbWVzDQo+ID4+Pj4+DQo+ID4+Pj4+IE9uIDIzLzA0LzIwMjIgMTY6MDYsIEJpanUg
RGFzIHdyb3RlOg0KPiA+Pj4+Pj4gRml4IGF1ZGlvIGNsayBub2RlIG5hbWVzIHdpdGggIl8iIC0+
ICItIiBhbmQgYWRkIHN1ZmZpeCAnLWNsaycNCj4gPj4+Pj4+IGZvciBjYW4gYW5kIGV4dGFsIGNs
a3MuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4+Pj4gLS0tDQo+ID4+Pj4+PiAgYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpIHwgOCArKysrLS0tLQ0KPiA+Pj4+Pj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4+Pj4+Pg0K
PiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cw
NDQuZHRzaQ0KPiA+Pj4+Pj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0
LmR0c2kNCj4gPj4+Pj4+IGluZGV4IDE5Mjg3Y2NjYjFmMC4uNGY5YTg0ZDdhZjA4IDEwMDY0NA0K
PiA+Pj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNp
DQo+ID4+Pj4+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0LmR0
c2kNCj4gPj4+Pj4+IEBAIC0xMywxNCArMTMsMTQgQEAgLyB7DQo+ID4+Pj4+PiAgCSNhZGRyZXNz
LWNlbGxzID0gPDI+Ow0KPiA+Pj4+Pj4gIAkjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPj4+Pj4+DQo+
ID4+Pj4+PiAtCWF1ZGlvX2NsazE6IGF1ZGlvX2NsazEgew0KPiA+Pj4+Pj4gKwlhdWRpb19jbGsx
OiBhdWRpby1jbGsxIHsNCj4gPj4+Pj4NCj4gPj4+Pj4gSG93IGFib3V0IGluIHN1Y2ggY2FzZSBr
ZWVwaW5nIHN1ZmZpeCAiY2xrIiBldmVyeXdoZXJlIGFuZCBtb3ZpbmcNCj4gPj4+Pj4gdGhlIGlu
ZGV4DQo+ID4+Pj4+ICgxLzIpIHRvIHRoZSBmaXJzdCBwYXJ0PyBUaGlzIHdheSBvbmUgZGF5IG1h
eWJlIHNjaGVtYSB3aWxsIG1hdGNoDQo+ID4+Pj4+IHRoZSBjbG9ja3MuDQo+ID4+Pj4NCj4gPj4+
PiBKdXN0IGEgcXVlc3Rpb24sDQo+ID4+Pj4NCj4gPj4+PiBZb3VyIHN1Z2dlc3Rpb24gaXMgImF1
ZGlvX2NsazE6IGF1ZGlvLWNsazEiIC0+ICJhdWRpb19jbGsxOiBhdWRpby0NCj4gY2xrIg0KPiA+
Pj4+DQo+ID4+Pj4gSW4gdGhhdCBjYXNlLCBJZiB5b3UgcGxhbiB0byBkcm9wIHRoZSBsYWJlbCBp
biBmdXR1cmUsIGhvdyB3aWxsIHlvdQ0KPiA+Pj4+IGRpZmZlcmVudGlhdGUgYmV0d2Vlbg0KPiA+
Pj4+IGF1ZGlvLWNsazEgYW5kIGF1ZGlvLWNsazIgd2l0aCBqdXN0IG5vZGUgbmFtZXM/DQo+ID4+
Pg0KPiA+Pj4gT3INCj4gPj4+DQo+ID4+PiBEbyB5b3Ugd2FudCBtZSB0byBkbyB0aGUgY2hhbmdl
IGxpa2UgdGhpcz8NCj4gPj4+DQo+ID4+PiAiYXVkaW9fY2xrMTogYXVkaW8tY2xrMSIgLT4gImF1
ZGlvX2Nsa18xOiBhdWRpby1jbGstMSINCj4gPj4+DQo+ID4+PiBBbmQgZml4IHRoZSBwaGFuZGxl
IHJlZmVyZW5jZSBpbiBvdGhlciBkdHNpIGZpbGVzPz8NCj4gPj4NCj4gPj4gTXkgc3VnZ2VzdGlv
biB3YXMgdG8gbW92ZSB0aGUgWzEyXSBwYXJ0IGludG8gdGhlIGZpcnN0IHBhcnQsIHNvIHRoZQ0K
PiA+PiBzdWZmaXggImNsayIgc3RheXMgY29uc2lzdGVudDoNCj4gPj4gYXVkaW8xLWNsaw0KPiA+
PiBhdWRpbzItY2xrDQo+ID4NCj4gPiBGcm9tIEhXIHBlcnNwZWN0aXZlLCAgdGhlcmUgYXJlIDIg
YXVkaW8gY2xvY2tzLCBhdWRpbyBjbG9jazEobXVsdGlwbGUNCj4gPiBhbmQgc3ViIG11bHRpcGxl
IG9mIDQ0LjEgS2h6KSBhbmQgYXVkaW8gY2xrIDIoTXVsdGlwbGUgYW5kIHN1Ym11bHRpcGxlDQo+
IG9mIDQ4S2h6KSBjb25uZWN0ZWQgdG8gYSBzaW5nbGUgYXVkaW8gQ29kZWMuDQo+ID4NCj4gPiBC
YXNlZCBvbiB0aGUgc2FtcGxpbmcgcmF0ZSwgdGhyb3VnaCBjbG9jayBnZW5lcmF0b3IgZHJpdmVy
IHdlIGNhbg0KPiA+IHN3aXRjaCB0aGUgY2xvY2sgc291cmNlIGZvciBhdWRpbyBtY2xvY2sgYWxv
bmcgd2l0aCBhdWRpbyBjbG9jayBmb3INCj4gPiBTU0kgYW5kIHdlIGNhbiBzdXBwb3J0IGJvdGgg
dGhlc2UgcmF0ZXMNCj4gPg0KPiA+IFNpbmNlIHRoZXJlIGlzIGEgc2luZ2xlIGF1ZGlvIGNvZGVj
LCBJIGFtIG5vdCBzdXJlLCBhdWRpbzEtY2xrIGFuZA0KPiBhdWRpbzItY2xrIGlzIGEgZ29vZCBj
aG9pc2UuDQo+IA0KPiBUaGUgbmFtZSBvZiB0aGUgY2xvY2sgaXMgbm90ICJhdWRpbyBjbG9jayIg
YnV0ICJhdWRpbyIsIGJlY2F1c2UgeW91IGRvIG5vdA0KPiBjYWxsIGEgY2FyICJGb3JkIE11c3Rh
bmcgY2FyIiwgYnV0IGp1c3QgIkZvcmQgTXVzdGFuZyIuIFRoZXJlZm9yZSAiY2xvY2siDQo+IGlz
IG5vdCBwYXJ0IG9mIHRoZSBuYW1lLCBidXQganVzdCBkZXNjcmlwdGlvbiBvZiBhIHR5cGUuDQoN
ClRoZSBoYXJkd2FyZSBtZW50aW9uIHRoZSBuYW1lIGFzIEFVRElPX0NMSzEgYW5kIEFVRElPX0NM
SzIuDQpUaGVyZSBhcmUgMiBDbG9jayBhdmFpbGFibGVzIGZvciBhdWRpbyBpbnRlcmZhY2UuDQpJ
biB0aGF0IGNhc2UgaWYgeW91IHRlcm0gaXQgYXMgYXVkaW8xLWNsayBhbmQgYXVkaW8tY2xrMiwN
CkJ1dCBhcyB5b3Ugc2FpZCBjbGstMS1hdWRpbyBhbmQgY2xrLTItYXVkaW8gd2lsbCBiZSBjb3Jy
ZWN0Pw0KDQo+IA0KPiA+DQo+ID4gV2hhdCBhYm91dCBsaWtlDQo+ID4NCj4gPiBhdWRpb19jbGsx
OiBhdWRpby1jbGstMSA/DQo+ID4gYXVkaW9fY2xrMjogYXVkaW8tY2xrLTIgPw0KPiA+DQo+ID4g
V2hpY2ggaXMgY29uc2lzdGVudCB3aXRoIG5hbWluZyB1c2VkIGZvciBjcHUgYW5kIG9wcC10YWJs
ZXM/DQo+IA0KPiANCj4gSXQncyBub3QgY29uc2lzdGVudCB3aXRoIGNsayBuYW1pbmcuIE5vZGVz
IHNob3VsZCBoYXZlIGdlbmVyaWMgbmFtZXMsIHNvDQo+IHRoZSBnZW5lcmljIHBhcnQgaXMgImNs
ayIuIFlvdSBhZGQgc3BlY2lmaWMgYXVkaW8vYXVkaW8tWCBwcmVmaXggb3Igc3VmZml4DQo+IC0g
aXQncyBmaW5lLCBidXQgbm90IGJvdGguDQo+IA0KPiBUaGlzIGlzIGV4YWN0bHkgdGhlIHRyb3Vi
bGUgd2hlbiB5b3Ugc3RhcnQgdXNpbmcgc3BlY2lmaWMgbmFtZXMgYW5kDQo+IERldmljZXRyZWUg
c3BlYyBleHBsaWNpdGx5IGFza3MgZm9yIGdlbmVyaWMgbmFtZXMuIFNvIG1heWJlIGdvIHdpdGgg
dGhlDQo+IHNwZWMgYW5kIGNhbGwgb2YgdGhlc2UgImNsay1bMC05XSIgYW5kIHByb2JsZW0gaXMg
Z29uZS4NCg0KT2sgV2lsbCBjaGFuZ2UgbGlrZQ0KDQoiYXVkaW9fY2xrMTogY2xrLTEtYXVkaW8i
DQoNCkxhYmVsIG5hbWUgbWF0Y2hlcyB3aXRoIGhhcmR3YXJlIG1hbnVhbCBhbmQgbm9kZSBuYW1l
cyBhcyBwZXIgRGV2aWNlIHRyZWUgc3BlYy4NCg0KUmVnYXJkcywNCkJpanUNCg==
