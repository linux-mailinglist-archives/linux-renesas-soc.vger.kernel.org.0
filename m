Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 606885B6B3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 11:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbiIMJ62 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 05:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiIMJ6V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 05:58:21 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D04C5727B;
        Tue, 13 Sep 2022 02:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZo5C3VI7tdRrHEneS663Ii01qPjrA4cyINekkjATKO55bwD1p9TS2iLuCBLHcu3bN3dZi6oy2xjVyv4iZHqb7/AMikYTksnLxh0w7Yg6Jv+bqrCFwpK62NG+aeoXRUqesL5LIrsDuXiotXLbbys91NIN+cKzRMpsq7Z5pHpbzBYc9hzB8J0gGB3fwdSgIjAq4DO9nek+vJm2WPyVaHhi1TIOqX04bBGrJQ0axwv9RjAq8L1OwfdUYqXoHkdZ+bmFTyezLgm3i/1oKkbWsXgEsSmiJlRlgvWA4jNFM0dCqBb41N4rSHB+bhf1wi00jD/6+In0okzynFVXXfSfYfx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQ09u8fIuUHiJXQ77UPsJN3KNeZoNyy4Mu3i3bMKibU=;
 b=WhDSxbfqb9IXQlAXJrvhRA6+37TO//sZNgkS8WvD54jfxqNDn90TlAuyU3hU2PcPajUAKgiaUF+Zu5Y9K9ikcyYqsI0LiJF62z+vxxifk2dmzXnYt/fPB2iEHRdltLlwSSYxpwWe+dxy+chTnS80AvVVX/p1s5XMxrBbsP2qxTCVuNEP2ZaIeIYuC0Zg9FJOhPuY246AXjupOEYNtCsBaT4hXnmHQlgFc9/EYHbA/dDBgNUqTz2LSeqWoi3Ns4zrrMUTQB+dWszVLhj22+KGx2aRQE0jS4lLvLd+ZaAkrRlzR10yIWPZROxdnpRJUY+tAVOCIA5O4NBly0yQtMRHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQ09u8fIuUHiJXQ77UPsJN3KNeZoNyy4Mu3i3bMKibU=;
 b=UiCJPgRmwrjA5A53xr93pRZz2W/8YVXZuj8GrM6OrYfGQs9XiSPk8gcR96cXayVawxaG5Wki9NmClZDhRHGEn6NAVa0x1fkMwIqFeArHSXxkhP7MzV5c4CthnqNvWzu2yL0uKCXHK9zk7izL3y7XuFiI9uQWuoIxcDnyKUG330M=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB8120.jpnprd01.prod.outlook.com (2603:1096:400:fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 13 Sep
 2022 09:58:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 09:58:13 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Topic: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Index: AQHYx00SZzRJbu1f4Een84uOmb7F263dDxQAgAABfCCAAArXgIAAAUtQ
Date:   Tue, 13 Sep 2022 09:58:13 +0000
Message-ID: <OS0PR01MB592232E7F1F06F53463FBCC986479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com>
 <OS0PR01MB5922F5F3302A3AF05820229186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXdAt5kfgPbyY-ragOL=abS_GUg4U_E1ovA3Ps0sZqHhg@mail.gmail.com>
In-Reply-To: <CAMuHMdXdAt5kfgPbyY-ragOL=abS_GUg4U_E1ovA3Ps0sZqHhg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB8120:EE_
x-ms-office365-filtering-correlation-id: 7aa046e7-f5ae-4615-a333-08da956e78cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sWgog8KhY+VOAHrIilfWMS899yNKI7sBYMzu1K4DwHMvwond9H34Zcv+xwuWsjGd5IKbWFCpe2KwA27KEKplQBSpkhQ7a8Lx0Dnx+OJZkG0GjPNzGdTUkkcvJll29dxQcaEg11TuQgQ4vkht0BnoPh2DmOQRrxn20SN7B3Y+Knvcd4hCnkgZxt+/meA8rOg775nyds4BIA7gl8EPSXbwCTBFBGpssQx3cj+pwoipbbHgfbdL56LTxThEAlJ6xt6H2lORd19JHWcPSmNG2h99d8F3YQS43pbIBUHTjnQ1lNxK+/Ko5+QkwtOQsPLtOcSasqQn9ZMOIyvVVnPLzrUtOwiTkNrEde17PD+qQ2fIKK/LxjRnVGAi/qQiAX5rhYzLHas7Okus0Y7KUG73oZNZAqxJZIyDHn/m8jaUh/CiQQ0ThOYDfrnwo1gmb3Haanq8S/itKPCY5IIYnLHTqyFKJ3+dIaW1LyewBXQY0KIy51HkOETgS0wphXXa1U+PMVahhOLoXqKUybvV+FllLAxtTotQxWSQ8pRDsvNbCcSBFS+4JrA6YiO+PE5nmF7FZy1tndAHbwa/ER0KRmQFgazxri8wyIJGTZyHK6o/f0LCHeziSC71WwDtHtYEwlVjqKUUqpbbj1wSJ5HATG7b1V0gZ+IQnfA9rtE2HMs13rUHrrY9msBvTV4La2cA7dF+ap2Hobe9/1EulkUypOpFEK7SF7y8gCpfPxoVYMTrxNFKg9O8Id8u486CfJwkU+23xcq3srTfa3ACyy+xqaUP+yLwHQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199015)(186003)(2906002)(6916009)(76116006)(8936002)(8676002)(66946007)(53546011)(83380400001)(52536014)(41300700001)(5660300002)(478600001)(38070700005)(54906003)(66476007)(55016003)(4326008)(64756008)(122000001)(66556008)(26005)(9686003)(7696005)(316002)(38100700002)(33656002)(66446008)(71200400001)(86362001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3pBTTJnWkN0bTF5QXJ5K1NNZDhqc296TUlSQTQxS3JlUmZ0NS9mak44MnNt?=
 =?utf-8?B?cHRkZk9nWW5hczZjQm9VWmxCbjJ5UlRyRENKSmtuYWZFMUI1YURSL2Q0YkhH?=
 =?utf-8?B?R3MzUml0cHRTYU1FQSszMVFpV0RjNGY1NjRMTkFleW40WmRQelYzQmIydFNK?=
 =?utf-8?B?TFdOQTRUa3FMMmM5MzkvL0syTkRkemRDREZIT1F3QWcxM0E0ZGJ5dUNzSThE?=
 =?utf-8?B?MjZoME5tMWVpKyttYUpMd3p6WVVIUVdxK2JQODQ3eGI4R0VKRjE2Z3ZBTndo?=
 =?utf-8?B?QVhubXMweDhWMG9yVzNhRFhSYTQrQkVmb1lsOVJFcUpaVldlcnpiY3RnYlBy?=
 =?utf-8?B?U2pvdFFxQ1RwNWU3cDI1WUJQRGM1YjF4dk9JZTN0R0t0b3dMY1FQL3ZJNUh3?=
 =?utf-8?B?YU1Ubm51WE9tcXF6MXVnUHpZakIyYnNYanl0R1FVclN5QXRNMUVtUXI5eU1w?=
 =?utf-8?B?aVZNK3VmWnB5QVlYUEFrQXJJczZkSU5EdUcyOG9sRldZdjdWamRHTDZWZGNR?=
 =?utf-8?B?eENSYkNIOTBIQzhzYTVoN2hkQTAzV1VLbUlRZnByMndabEVsVUZ2b1JNMXgy?=
 =?utf-8?B?Z2N1YWFDbnhyZy9ua1dRQk5qaUpROFl5QTJ5ak9vcEN2cGFnQ0grRHRwcUFj?=
 =?utf-8?B?YnNqL0U4dlpMY0UybEovN3JXQlozSmV2bm8xM25xT1RGcnRTcjJIckxXODBv?=
 =?utf-8?B?SGV4WjdhRzlBbTBTWmdUanZwQXhrekVkQjNxelYvNnBEM0xzOGVWNzA4L2Ez?=
 =?utf-8?B?RnQ5QVBmZGVycExRTkdrU3JURzFDNXVOOEJLY3ZCcFNuM1hKWW55ZFJoaEM5?=
 =?utf-8?B?NUQ4TzQ2VzBiYzkvYXNQQUpsYXAyN0FBbitjcDJ3M29CY0wveWxmRjd2ZGMx?=
 =?utf-8?B?VVN3VVRla2pzYnZyeVBrTjFGUEJMQUg3U1c2TE1kOHI4cHlONStXZ0xUckJW?=
 =?utf-8?B?SThkbnFGUWxsMElnUzllSmRvc0tKR2FudnZSMGRCL1Bnc0J1eVZpS3k0V0Fz?=
 =?utf-8?B?MnErQzdNSFZvT1hsL2xpT092bitJWUFoTmlIRU9jMXk4Y0RZZ1VzWVdMTDdT?=
 =?utf-8?B?MFRFd0hzUm9HVmNsc09tNm1PMEFIdWpwTE94UHYzbnB3YXp5ZmFFeklUc3Vw?=
 =?utf-8?B?THh2RFFJSGNxN3VISTl2b1puN2VSVlh4OVFEUlVwZXhhV0c0OXNaYnFMbksr?=
 =?utf-8?B?MG42YmRERUJQdzdraGJBWWtCemdSNFZpRlNUeGFiM3FvelBDd3BtWW1ZRTVi?=
 =?utf-8?B?K0luQi9pT1FGOHJvUHdYS0RJczVFdnIvZ1BjblN1aWFDWEcrWmxVUjk3eCt5?=
 =?utf-8?B?dUN5eXh0c2dySi8wQ2srL0djb2ljZHQvSTROMWJreVJqczNyTVNWWldNYys5?=
 =?utf-8?B?Zm4yY2FKL2I2MHhjSXZYNEYwWHdINUtXa0E3TDlMSFhnTWNyTndnRjlEdFFX?=
 =?utf-8?B?RDdHeUlUYUI5bmR5V1cwekVuYXArR0k3WGU5N0dwNjZRbHZOdzAybGtSTFky?=
 =?utf-8?B?UnMzdWNxWlB5Mmh0M3NWTktIVmx5eEZHeThQcUJldDZhTEd6aUpodkZsTlE1?=
 =?utf-8?B?NjVzMDJpSm5rcVBUTHU4T0ViSDlqOHpBOExGWjRnUHI2Y2VrbG9kVjZvL21q?=
 =?utf-8?B?NnpWOGtrMWl4YkN4VTFCMmFLMy8wR3dVd283UldFRWV5TVhUYmU1aU5tL2VR?=
 =?utf-8?B?Zk5Da0JFSUVSUStCOWV3ZGtwKzd1NFZrQzYvMVpGWnpwSjV3QnlEUGE3OFRD?=
 =?utf-8?B?SXg2OGdBTkJYZnJkOXF5d2JUWkRhR2llMzU1UjZqM0pRT2pBcjhqOHlySzMv?=
 =?utf-8?B?M1hwcklnOTRJN0llVUxTR2R4RjRYeHZUcGhwZEJuTjBOZk9zNGp3MXRVazQz?=
 =?utf-8?B?REppalVvdllPVWhTV29mRWM0UjdTMkNQeTNsZi95QXZ2UkV3eitJWVhaV3Rx?=
 =?utf-8?B?cVI2NjB3NGdrNFhpZFBncTJGSFl6Y2FDTS8yZnZ2Y2VVNFBVZHNCeTRKdXhy?=
 =?utf-8?B?YmNwb1FzMmJ1SzYxVjhybjZyUnVvSTJaaWNONjh4SVRsMU5jL1FQWVA5QVp6?=
 =?utf-8?B?b3hiSzR6MkhsUlMyQ0xhOWJtTGN4aHIrMmZyOC85anhvaE13UWZvMjJSSldM?=
 =?utf-8?Q?b3acrcTFun54Zepysk7iDRrUo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa046e7-f5ae-4615-a333-08da956e78cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 09:58:13.1652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: godNIls/wgEhl//I9irzsx7FKc+QBoD/OnAcLwbufoIdV0TBaAdC44S01+BUNff4jSkavzZXOHYJvi1188K78rd18Qo3W5jP0HO/6BdYV4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8120
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gY2xrOiByZW5lc2FzOiByOWEwN2cw
NDQ6IEZpeCA1MzNNSHogUExMMi8zIGNsb2NrDQo+IG11bHRpcGxpZXIgYW5kIGRpdmlkZXIgdmFs
dWVzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gQ0MgV29sZnJhbSAoU0RISSkNCj4gDQo+IE9uIFR1
ZSwgU2VwIDEzLCAyMDIyIGF0IDEwOjExIEFNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBjbGs6IHJlbmVz
YXM6IHI5YTA3ZzA0NDogRml4IDUzM01IeiBQTEwyLzMNCj4gPiA+IGNsb2NrIG11bHRpcGxpZXIg
YW5kIGRpdmlkZXIgdmFsdWVzIE9uIFR1ZSwgU2VwIDEzLCAyMDIyIGF0IDk6NDQgQU0NCj4gPiA+
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+
ID4gPiBBcyBwZXIgdGhlIEhXIG1hbnVhbCAoUmV2LjEuMTAgQXByLCAyMDIyKSBjbG9jayByYXRl
IGZvciA1MzNNSHoNCj4gPiA+ID4gUExMMiBhbmQNCj4gPiA+ID4gUExMMyBjbG9ja3Mgc2hvdWxk
IGJlIDUzMyBNSHosIGJ1dCB3aXRoIGN1cnJlbnQgbXVsdGlwbGllciBhbmQNCj4gPiA+ID4gZGl2
aWRlciB2YWx1ZXMgdGhpcyByZXN1bHRlZCB0byA1MzMuMzMzMzMzIE1Iei4NCj4gPiA+ID4NCj4g
PiA+ID4gVGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBtdWx0aXBsaWVyIGFuZCBkaXZpZGVyIHZhbHVl
cyBmb3IgNTMzIE1Ieg0KPiA+ID4gPiBQTEwyIGFuZA0KPiA+ID4gPiBQTEwzIGNsb2NrcyBzbyB0
aGF0IHdlIGdldCB0aGUgZXhhY3QgKDUzMyBNSHopIHZhbHVlcy4NCj4gPiA+DQo+ID4gPiBEb2Vz
IHRoaXMgbWF0dGVyPyBJcyB0aGVyZSBhbnl0aGluZyB0aGF0IGRvZXNuJ3Qgd29yayAod2VsbCkg
YmVjYXVzZQ0KPiA+ID4gb2YgdGhpcz8NCj4gPg0KPiA+IFllcywgU0RISSBwZXJmb3JtYW5jZSBn
b25lIGJhZCBhcyBpdCBzZWxlY3RzIDQwME1oeiBjbG9jayBpbnN0ZWFkIG9mDQo+IDUzM01oei4N
Cj4gPiBTaW1pbGFyIGNhc2UgZm9yIFJaL0cyVUwsIHdoaWNoIEkgYW0gdGVzdGluZyBpdCBub3cu
DQo+ID4NCj4gPiBQcmV2aW91c2x5Oi0NCj4gPiA1MzMzMzMzMzMtPnNyYyBjbGswDQo+ID4gNDAw
MDAwMDAwLT5zcmMgY2xrMQ0KPiA+IDI2NjY2NjY2Ni0+c3JjIGNsazINCj4gPg0KPiA+IE5vdzot
DQo+ID4gNTMzMDAwMDAwLT5zcmMgY2xrMA0KPiA+IDQwMDAwMDAwMC0+c3JjIGNsazENCj4gPiAy
NjY1MDAwMDAtPnNyYyBjbGsyDQo+ID4NCj4gPiBJZiBJIGFtIGNvcnJlY3QsIHdpdGggd3Jvbmcg
dmFsdWVzLCBpdCBlbmRlZCB1cCBpbiA1MzMzMzMzMzIocGFyZW50DQo+ID4gcmF0ZT0gMTMzMzMz
MzMzICo0KSBhbmQgcmVxdWVzdGVkIHJhdGUgNTMzMzMzMzMzIGFuZCBpdCBzZWxlY3RlZCBiZXN0
DQo+ID4gcmF0ZSBhcyA0MDAwMDAwMDAuDQo+IA0KPiBJQywgdGhhdCBpcyBhbm5veWluZy4NCj4g
DQo+IEhvd2V2ZXIsIEkgZG9uJ3QgdGhpbmsgdGhlIHJpZ2h0IGZpeCBpcyB0byBjaGFuZ2UgdGhl
IGRpdmlkZXJzIHRvIHZhbHVlcw0KPiB0aGF0IGRvIG5vdCBtYXRjaCB0aGUgaGFyZHdhcmUuDQoN
ClRoZSBuZXcgdmFsdWVzKGZvciBTREhJLCBTUEkgbXVsdCBhbmQgTTQpIGFyZSBtYXRjaGluZyB3
aXRoIGNsb2NrIGxpc3QNCkRvY3VtZW50IFJaRzJMX2Nsb2NrX2xpc3RfcjEuMS54bHN4IGFuZCBI
VyBtYW51YWwocGFnZSAyMzUvMjM2KQ0KRmlndXJlIDcuMi83LjMgQ2xvY2sgU3lzdGVtIERpYWdy
YW0uIA0KDQpZZXMsIHdlIG5lZWQgdG8gaGF2ZSBzb21lIHJlbGF4YXRpb24gZm9yIGNsb2NrcyBh
cyBtZW50aW9uZWQNCmJlbG93Lg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gRHVlIHRvIHRoZSAoaW4p
YWNjdXJhY3kgb2YgY2xvY2sgY3J5c3RhbHMsIHRoZSBsZWFzdCBzaWduaWZpY2FudCBkaWdpdHMN
Cj4gaW4gdGhlIGFib3ZlIGNsb2NrIHJhdGVzIGFyZSBub3Qgc2lnbmlmaWNhbnQgYW55d2F5Lg0K
PiANCj4gUGVyaGFwcyB0aGUgImlmIChmcmVxID4gKG5ld19jbG9jayA8PCBpKSkiIGNoZWNrIGlu
DQo+IHJlbmVzYXNfc2RoaV9jbGtfdXBkYXRlKCkgY2FuIGJlIHNsaWdodGx5IHJlbGF4ZWQsIHNv
IGl0IGFsbG93cyBlLmcuIGENCj4gMC4xJSAob3IgMS8xMDI0dGg/KSBoaWdoZXIgY2xvY2sgcmF0
ZSB0aGFuIHJlcXVlc3RlZD8NCj4gDQo+ID4gPiA+IC0gICAgICAgICAgICAgICBERUZfRklYRUQo
Ii5wbGwyXzUzMyIsIENMS19QTEwyXzUzMywgQ0xLX1BMTDIsIDEsDQo+IDMpLA0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgREVGX0ZJWEVEKCIucGxsMl81MzMiLCBDTEtfUExMMl81MzMsIENMS19Q
TEwyLA0KPiA+ID4gPiArIDUzMywgMTYwMCksDQo+ID4gPg0KPiA+ID4gSSBoaWdobHkgZG91YnQg
dGhlIGFjdHVhbCBoYXJkd2FyZSBpcyBub3QgdXNpbmcgYSBieS0zIGRpdmlkZXIuLi4uDQo+IA0K
PiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4
IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkg
InByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
