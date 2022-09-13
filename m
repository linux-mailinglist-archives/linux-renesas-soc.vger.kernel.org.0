Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872965B7948
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 20:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbiIMSUF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 14:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbiIMSTq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 14:19:46 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2115.outbound.protection.outlook.com [40.107.113.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EE4D7A;
        Tue, 13 Sep 2022 10:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIO5hgrxuPSXq8m2QCLlU8lLv0QEGu9xXScl+PKHpEH3O8cowwq0eA20U6KClSEngHFidjTPkTBKBFwPxHqF1HVpejstZNPQVrPlLS+8PO9g93Ryitlek1r0BUu4PX2DoSoK1GYXOZvq6e8xWoujQu2P628Tpo94GC4Tm8ou5LsO8Pc85Espy9ATCkeNAVvd/nKEw5jW97arO1HAgf4LPkC/+7ltWL1Ta8k4UgGg9noc3wn21c2vu1HziJ6ZRFt6/gXLRMSMQOQ9eyqIPHbnO/Z2pfYhU2cMKRGFSoY3BLorFemCECCJM7fEKnE1KbjkIWd/vr+PgistQeTs5CRZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTg7l1HnCqHKQaWK1uukk7+KImdna9OicdSA9lL0LfE=;
 b=a0VQzf77jEvZ1tKyQT4eys1WGWYu67Gk/I5uDYDEvSWPYIGPELR6UT5lTgF6slaySsTuAfMUTzk/TqmCDO2/SKe0RLIHUHYAYuTcv83BbWjkuOwospbzjSegP/81WdndKFABnQnAuQZw1rev1ik7KORlyVgYHzcykWdICHLkCkWqpkTI4soyDR5ChHz7JUEe9vMCG/+QGVT4n6wlCH8Y/p5/mCOayPFpSOTws6dfAZ4h6fywQJ3p2OEk8a9RBzE6+yAtex2hjQ052ty7vT9tJoOMRi5SRepSQkmIURVl0p/xOK4TgavVbfbnezMf0MhI0ZVNK59xJM1eBf552H0SNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTg7l1HnCqHKQaWK1uukk7+KImdna9OicdSA9lL0LfE=;
 b=ecj0IZ24AdhMhvgJa8adqGK02ECv405psGyFOkNaqYePdwS/e1I9cAVBFWY4ofTL1KPLKbPhI0Pv0n4XHTtOP8vPcioUqeOzlRHDT9xcdeUm26eZh2hQKiNXhS2bPHxA7KfbvZobjNUmrEoBER5em0Tp2IbWVvcy8RTyDkv5INY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10811.jpnprd01.prod.outlook.com (2603:1096:400:26e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Tue, 13 Sep
 2022 17:31:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 17:31:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs
 clock
Thread-Topic: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs
 clock
Thread-Index: AQHYx4wC10b6ZMAwoESpl81Rqm30zK3dmNGAgAAAmPA=
Date:   Tue, 13 Sep 2022 17:31:20 +0000
Message-ID: <OS0PR01MB59228767EFF2C9FA75D01B9486479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220913161506.1817432-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWLRyW_6oTxK1eWXoJ0e=XS=p90yQPHB7kJANTj5Xk9vQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWLRyW_6oTxK1eWXoJ0e=XS=p90yQPHB7kJANTj5Xk9vQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10811:EE_
x-ms-office365-filtering-correlation-id: 2357d0cb-e353-4a85-2296-08da95adc5db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: drL0f3klitNfAlCkYCoIhgIoJmI+uEfhOXqqfW2mqYtPv3NWbPkmKEp359FyWZnUkasWHC2zWDKSIYYefcz7oWzHadgB8wdkfII8K8Qkvl4kIcd6cU6ltt4W7S8qL5jpba5evN9xKqpWhMS/N3LOZjd14QzPj3F9Zzp58Mz9QFFL+5R5pvnSS8evP265urddZkgDMdbrVjtdlKuXOtVoYPIWqLfJvxAdQxkPQh6/miIz1qzVGXxxm8WZRfpmk3eLddq+EY5tIVI+IHkUaZ89LFLCAbCHB51iVvbzr/wZxwFrE8m1TTzEKmoP4eNiM16LO+sb9VyzD4UjzZqUWXEuj/il3uuTACl6XpweCeSNd8tUemYfsGSpRX6LEbzKQClY4dhRiSfX2sTQCwYdY+9oZjDamxCoBm6/c4j+wsnjFGwTciUbRkSdcOGs8BOR4yI/oKUgQJGQdqhs4v9pcP5FMAMO6mnlvh9xmNmJYQgiWF5JqxdGAo4mVg5p5w1/5U5TSWperYhUAPYkE5YW7tsQDRpKLqMTDbniDhojt62qFizMrZxaShiUIxtb+1no6xOjEWZ7WGsJVoleNlBFC8g1QRQycHs4eN/GBG808tJ9i3WtvAManO0/0vYuFSqWG7RPk/9VFTXcXTLKcSOomnn/cdvcjKZQaPxEMK/oCDzNH2uia9adFc5ujsJUZdCU2JccZeQzzErdhD3+KyH2NzXf+dlcwraKxcU1MxxjBfpUuqAu8OpN/uTBLQDgVbLVjzgjdsA8ONq8aEvuhn9A263opw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199015)(8936002)(66476007)(122000001)(26005)(76116006)(186003)(6916009)(38070700005)(66556008)(54906003)(71200400001)(83380400001)(38100700002)(2906002)(107886003)(6506007)(52536014)(86362001)(478600001)(66446008)(66946007)(41300700001)(9686003)(53546011)(55016003)(7696005)(5660300002)(64756008)(4326008)(33656002)(316002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjhFbHlKbUhRU2svZytFZVdzOGhDYk13NXhCc2VnNnhGN1R6R3dwMHRrbCt4?=
 =?utf-8?B?M0w4bVJwVHdNcm9nU25BT09OTnFmb2JHREZtRFczYlg4QlBGZWVIamlxYW9z?=
 =?utf-8?B?dGZnVDZGa2lLNkxNZFZJNlBycUVMRHpyclN0LytxZkF6VWZDSmRMTi90cDRt?=
 =?utf-8?B?VHdHUmlQanVFT0UvMGpZRnltK3EraU1tWVFhSCtPelR4K3VPUUVhRjY1VzRn?=
 =?utf-8?B?cElMQ0p1OEx1dzNWZ2VOZENOQzU4dm5ocTBPMFUva3UxcTRGVXNWSDRranls?=
 =?utf-8?B?R0xOM2dFVTJlVTJITnNGZldHTXhITDJkY2JPc2VqODk5MzAzZFhpRVVNcWNw?=
 =?utf-8?B?UU9qNnNEb1ZReDJDSzhkcExvN3NhWi9EV0xVNThOSEREcGZ0aHRIcloyNzhD?=
 =?utf-8?B?RzVDMjFSVEhvN1hzWHdyRTlCaTZZRWVzMThONkk3RGF3MWRVazJtMFE5Kysx?=
 =?utf-8?B?MVNJR0gxWFFJdFFhbmZOWmw2SzNhOVh2OVF1d2Z5djJpbzl4bjI4eE12eDdz?=
 =?utf-8?B?TUJ1YUVWalpMOTBuZDJrT1NOM2ZYS2tYVHhVRm9kcnlRMkRGSTYzT2JmNWV0?=
 =?utf-8?B?VUx2YW1oZUkwNFlWNG12WDZoOWdNcVpTVm9ZelVuSWhkOXdwWGNBVW1GZUhl?=
 =?utf-8?B?RHVaNlZTUVppVUdlMWcvVXhucGd0TW90bUo5Uzd1V1c0eThTWEE4bjlpTzN6?=
 =?utf-8?B?dWl3ZWJXRnp0SW50dWlqOUhmdHZ0Vzd2YnpOem1lM2ZDWkZiWWRCa1gyUEtj?=
 =?utf-8?B?TDNCcXBsZVNXd1JxOExrOXdWWUVGU2RDOGZUOGlldi83WUN6RzN6L1VnZ2pa?=
 =?utf-8?B?OTZCdkVMbkl1dHBabHdjYWpYSVAwT1J0NmxneEJWRjFmb3NTY0lzNEwrTnFj?=
 =?utf-8?B?K2VYc3FUVlBWVEcvSFVrWjIwTEZDSHV3cWh4blYxcWR4R0lJaTcvMjdlelFW?=
 =?utf-8?B?VEI4RzIybTRWN2RpQTNzN0UrQVpMWTh3NlpoRWVPNnpSNndPeFltQXJCdzAv?=
 =?utf-8?B?WFNZeXNXeGNZTmE5RTc0SHhvbWF0T3l0Y0Z3ZDNoSkU4SWd4dCt5TUhjTDNm?=
 =?utf-8?B?ekdFdmJUVmlNZ3JXWEp3TlU3NHp1NlVsdEptcWlHS1lNSmpDTDVlb2dCcm1X?=
 =?utf-8?B?bEQ5ekJOUlVLKzB3L1h5VjRvQ3U4d3A3dmh2MmJFU3ZLb0hmTk1OSnVXVzdJ?=
 =?utf-8?B?LzdySXE4SHhGS0FscVpMNnNpMFhoWDVmOFEzR0VSVU9qVkUxbEMxTnErTGdi?=
 =?utf-8?B?cENxcER2QlcvcWY1RHczZ2FMQUFBSlpxeHdHcmcwWGF5b2dJOWIzNWtUZTVU?=
 =?utf-8?B?eHY2WmdhS0VqcThtdTg5QmNjK1NVbnhQcDk2dmU3MVlQN3pVdmhTYWg4OVNT?=
 =?utf-8?B?eEE4NDc3bE1tczRiemhZOVAzRDIvUDByMGo2d1FTYmdKREs4dlRZa0RXVXBi?=
 =?utf-8?B?bksyb1U1SlVQUWk1dkVtaFVBMS9BYTU3RFNrQWFoeXF3U2JsNU12UlJVUmIx?=
 =?utf-8?B?QldEMXVaVzVwc2ZTK3NnV0tvMmU4cWczTXBPazcvUjdQc1J1UUZkcURqVzd3?=
 =?utf-8?B?ZFF0VEpJNkNxL2pydlljZ3dWSFdHY1dQOHMvYUw3UTBSVTV4SXp4eUUwZCtF?=
 =?utf-8?B?S3h2aTZzc25lN1RkRW5PTzVFVGRmTVQ1UmNRUmpLWDBsZ202NDNnalZFN2VM?=
 =?utf-8?B?dmhhTEUzOHQ1Y1NpZlJCU3AwdnRwZmFzanh6US9tRms2bjBDUXI3UkFoamhN?=
 =?utf-8?B?SUxPc2g5OVlCM0xGTXpPWTRTWUVqWjQybkRWNnRQRmZtQkUybTVCSVNDSlIw?=
 =?utf-8?B?YmRNbkxkWUQ5S0lBMWk5WlV0YzlPdUdQWDBvS2RQZUpiS3hEeVhnSFlkekFM?=
 =?utf-8?B?Z3YvWE1LaENGV1p2SmcvL2J0eTdsVmc0Z3lTWUhobEFGSEZOR2l4N2JYZkVW?=
 =?utf-8?B?UEpjeVVoTUVyd1NaNC9seG5BRWdnajNiVG1BdXY5b2ZrMkxTdUpoeUt2NkF1?=
 =?utf-8?B?cjZWaDAwVmlZSVE3aHQ4ZElud0IreVJmTmdpT2NBeXAyWGk3MDJ3NTczdlB2?=
 =?utf-8?B?b0RnTmhGK2o0Z1Nkb1Fyd1Q4NktUUlZraGlONHJ6ZU9LaHhWa0ZJa1RvNlU2?=
 =?utf-8?Q?uSAGh1VSTidrklMwZf8BWEEnM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2357d0cb-e353-4a85-2296-08da95adc5db
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 17:31:20.7387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X0Hv7vf2vl6+T4SYtEdQ+dYA0sumY+PJuvXnu+YRmHh6HhiJQ5bvvmsme23Hwb+hqOEZ27MIXsbVXt9TZL7o+HUofHkJiex9Cu+Ow3xa+BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10811
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
UEFUQ0hdIG1tYzogcmVuZXNhc19zZGhpOiBBZGQgbWFyZ2lucyBmb3IgbWFpbiBjbG9jayBhbmQg
aHMNCj4gY2xvY2sNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIFNlcCAxMywgMjAyMiBh
dCA1OjE1IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6
DQo+ID4gVGhlIFNESEkgaGlnaCBzcGVlZCBjbG9jayBpcyA0IHRpbWVzIHRoYXQgb2YgdGhlIG1h
aW4gY2xvY2suDQo+ID4gQ3VycmVudGx5LCB0aGVyZSBpcyBubyBtYXJnaW4gYWRkZWQgZm9yIHNl
dHRpbmcgdGhlIHJhdGUgYXNzb2NpYXRlZA0KPiA+IHdpdGggdGhlc2UgY2xvY2tzLiBPbiBSWi9H
MkwgcGxhdGZvcm1zLCB0aGUgbGFjayBvZiB0aGVzZSBtYXJnaW5zDQo+ID4gbGVhZHMgdG8gdGhl
IHNlbGVjdGlvbiBvZiBhIGNsb2NrIHNvdXJjZSB3aXRoIGEgbG93ZXIgY2xvY2sgcmF0ZQ0KPiA+
IGNvbXBhcmVkIHRvIGEgaGlnaGVyIG9uZS4NCj4gPg0KPiA+IFJaL0cyTCBleGFtcGxlIGNhc2U6
DQo+ID4gU0QwIGhzIGNsb2NrIGlzIDUzMzMzMzMzMyBIeiBhbmQgU0QwIG1haW4gY2xvY2sgaXMg
MTMzMzMzMzMzIEh6Lg0KPiA+IFdoZW4gd2Ugc2V0IHRoZSByYXRlIGZvciB0aGUgbWFpbiBjbG9j
ayAxMzMzMzMzMzMsIHRoZSByZXF1ZXN0IHJhdGUNCj4gPiBmb3IgdGhlIHBhcmVudCBiZWNvbWVz
IDUzMzMzMzMzMiAoMTMzMzMzMzMzICogNCkgYW5kIHRoZSBTRDAgaHMgY2xvY2sNCj4gPiBpcyBz
ZXQgYXMgNDAwMDAwMDAwIEh6Lg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBhZGRzIGEgbWFyZ2luIG9m
ICgxLzEwMjQpIGhpZ2hlciBocyBjbG9jayBhbmQgbWFpbiBjbG9jaw0KPiByYXRlLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL21tYy9o
b3N0L3JlbmVzYXNfc2RoaV9jb3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3JlbmVz
YXNfc2RoaV9jb3JlLmMNCj4gPiBAQCAtMTQ3LDYgKzE0Nyw3IEBAIHN0YXRpYyB1bnNpZ25lZCBp
bnQgcmVuZXNhc19zZGhpX2Nsa191cGRhdGUoc3RydWN0DQo+IHRtaW9fbW1jX2hvc3QgKmhvc3Qs
DQo+ID4gICAgICAgICB9DQo+ID4NCj4gPiAgICAgICAgIG5ld19jbG9jayA9IHdhbnRlZF9jbG9j
ayA8PCBjbGtoX3NoaWZ0Ow0KPiA+ICsgICAgICAgbmV3X2Nsb2NrICs9IG5ld19jbG9jayA+PiAx
MDsNCj4gDQo+IFRoaXMgY2hhbmdlcyB0aGUgcmVxdWVzdGVkIGNsb2NrIHJhdGUuIElzIHRoYXQg
cmVhbGx5IGEgZ29vZCBpZGVhPw0KPiANCj4gSXNuJ3QgaXQgc3VmZmljaWVudCB0byBjaGFuZ2Ug
dGhlIHRlc3QgImlmIChmcmVxID4gKG5ld19jbG9jayA8PCBpKSkiDQo+IHNsaWdodGx5Pw0KDQpX
ZSBoYXJkbHkgZW50ZXIgdGhpcyB0ZXN0LCBhZnRlciBpdCByZXF1ZXN0IGZvciBwcm9wZXIgd2Fu
dGVkX2Nsay4NCg0KZnJlcSBpcyBjbGtfcm91bmRfcmF0ZShyZWZfY2xrLCBuZXdfY2xvY2sgPDwg
aSk7ICBhbmQNCml0IGNvbXBhcmVzIDQwME1IeiB2cyA1MzMuMzMyIE1Iei4NCg0KQmFzaWNhbGx5
IHdhbnRlZF9jbG9jaz0gMTMzLjMzMzMzIE1IeiBhbmQgaXMgc2NhbGVkIHRvIHBvd2VyIG9mIDIN
CmFuZCB0aGVuIGVhY2ggaXRlcmF0aW9uIGl0IHNjYWxlIGRvd24gdG8gcG93ZXIgb2YgMiBjb21w
YXJlIHdpdGgNCnJvdW5kIHJhdGUgdmFsdWUuDQoNClsgICAgNC4wMjA3ODFdICMjIyNyemcybF9j
cGdfc2RfY2xrX211eF9kZXRlcm1pbmVfcmF0ZSMjIyMjIyMgcmVxLT5yYXRlPTQyNjY2NjY2NTYN
ClsgICAgNC4wMjgwMTNdICMjIyNyemcybF9jcGdfc2RfY2xrX211eF9kZXRlcm1pbmVfcmF0ZSMj
IyMjIyMgcmVxLT5yYXRlPTIxMzMzMzMzMjgNClsgICAgNC4wMzUzMzBdICMjIyNyemcybF9jcGdf
c2RfY2xrX211eF9kZXRlcm1pbmVfcmF0ZSMjIyMjIyMgcmVxLT5yYXRlPTEwNjY2NjY2NjQNClsg
ICAgNC4wNDI2MzldICMjIyNyemcybF9jcGdfc2RfY2xrX211eF9kZXRlcm1pbmVfcmF0ZSMjIyMj
IyMgcmVxLT5yYXRlPTUzMzMzMzMzMg0KICAgDQo+IA0KPiA+DQo+ID4gICAgICAgICAvKg0KPiA+
ICAgICAgICAgICogV2Ugd2FudCB0aGUgYnVzIGNsb2NrIHRvIGJlIGFzIGNsb3NlIGFzIHBvc3Np
YmxlIHRvLCBidXQgbm8NCj4gPiBAQCAtMTcyLDYgKzE3Myw3IEBAIHN0YXRpYyB1bnNpZ25lZCBp
bnQgcmVuZXNhc19zZGhpX2Nsa191cGRhdGUoc3RydWN0DQo+ID4gdG1pb19tbWNfaG9zdCAqaG9z
dCwNCj4gPg0KPiA+ICAgICAgICAgY2xrX3NldF9yYXRlKHJlZl9jbGssIGJlc3RfZnJlcSk7DQo+
ID4NCj4gPiArICAgICAgIGJlc3RfZnJlcSArPSBiZXN0X2ZyZXEgPj4gMTA7DQo+IA0KPiBDYW4g
eW91IHBsZWFzZSBlbGFib3JhdGUgd2h5IHRoaXMgaXMgbmVlZGVkPw0KPiBJdCBsb29rcyBjb3Vu
dGVyLWludHVpdGl2ZSB0byBtZS4NCg0KV2hlbiB3ZSB0cnkgdG8gc2V0IDEzMy4zMzMgTUh6IGNs
aywgdGhlIGRldGVybWluZSByYXRlDQpjYWxjdWxhdGVzIHJlcS0+cmF0ZSBmb3Igc2QgY2xrIGFz
IDUzMy4zMzIgYW5kIA0Kc2luY2UgYXZhaWxhYmxlIGNsb2NrIHNvdXJjZSBmb3Igc2QwIGNsa3Mg
YXJlIDI2Ni42NjY2LCA0MDAgYW5kIA0KNTMzLjMzMyBNSHosIHNvIGl0IHNlbGVjdCB0aGUgY2xv
Y2sgc291cmNlIGFzIDQwME1Iei4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICAgICAgICAg
aWYgKHByaXYtPmNsa2gpDQo+ID4gICAgICAgICAgICAgICAgIGNsa19zZXRfcmF0ZShwcml2LT5j
bGssIGJlc3RfZnJlcSA+PiBjbGtoX3NoaWZ0KTsNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0K
