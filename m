Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E56350B5D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 13:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447001AbiDVLHn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 07:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446993AbiDVLH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 07:07:28 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0720C25C5B;
        Fri, 22 Apr 2022 04:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtNRxlP3myMXxGQzdNo8WmKWmAOMReu6PB3M1sMIJ4qAAEDisOgclqt969KiJbKWy9phSz3rLpFUFEUi0Dsv/8X+PHzzX7H1mINv0IllhodM2bjq4kj6gCiPIy91xChms6UBlyIqcr/ViZUAyLqeKmkvcDDbv78nLln8ahxJCY6SlIcISfx2+yyz2kn8Fxfzu3oHT1fZTKqUZql3AEASmLDcrTI7jS1mUGyhzzU+xfdPDxupn8u7bb+RAG6fE4zcYVqKt5yGAfzxPGm1qmI6JFxD33ySzYR2eNgrOZcFCaJD1MqX2Am5uk9AB+O7pKVgm6iasCkGYfWD8IGABChEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKLQfXZQv85mxGWbNxIOXmYRcU/IvVQ8xrxFUxl4DdI=;
 b=ngJPyGbQnzi2TK0QXOuCw7usuIvdRWgWppTiKc9ecp+5y7cG6P5O1tbiTsMboLqDnWGFzQ50QfeX38BscdqOQaEXt/ugdLliJOMjijdpULGTse4ueDYeez+SCaSGffEc/ltDImFOi8q2y5Ik6QhVnyzsvsw1+Kya3IyXJTNtxgiV+HmMCTALpIEiHfZCzsUtOvOXFa4Fmsw68D6K5SRgU8AdQ61rndv/FskwmgsEUJLwYlMyMaqes30WwN5I53moSaNrBXOBTACE8lerZYI3aw6Xsgbdb9tvg0hGmxPykJNOOwEgnwgeL/jspzOvm7f0QHFSjM6FbXjYxg44TM6+Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKLQfXZQv85mxGWbNxIOXmYRcU/IvVQ8xrxFUxl4DdI=;
 b=tFKL3uj2WkDQ5sfRV0fiEEVb/TnvON4PpcLsdbIg+0syeyHEeCL+CRvx4RMxb7PnmrEb3rkyEFZSWzf9CQjnd1AGUGum8htxMfKc6vZGG0ZoCm8bsKnvIIL4k8WIF1PpYosf4GnpU1YtiQE/SSom4yzCjGZHHoXM9UGY18gGyI4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3669.jpnprd01.prod.outlook.com (2603:1096:604:49::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 11:04:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 11:04:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/9] clk: renesas: rzg2l: Add FOUTPOSTDIV clk support
Thread-Topic: [PATCH 1/9] clk: renesas: rzg2l: Add FOUTPOSTDIV clk support
Thread-Index: AQHYOvDHtb6AxaHNP0+oUhHfM0J9zaz6MU0AgAHIXIA=
Date:   Fri, 22 Apr 2022 11:04:30 +0000
Message-ID: <OS0PR01MB59229D3646A621084305047C86F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220318175113.8956-1-biju.das.jz@bp.renesas.com>
 <20220318175113.8956-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWvk9_Lr4VfGERrV4L7Q78v_zrZN-iS7p5ioxUUBGdT5Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWvk9_Lr4VfGERrV4L7Q78v_zrZN-iS7p5ioxUUBGdT5Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1dabb00-ce6c-4160-7a1a-08da244fe01d
x-ms-traffictypediagnostic: OSBPR01MB3669:EE_
x-microsoft-antispam-prvs: <OSBPR01MB36699AA35E00D9A4DC097CCB86F79@OSBPR01MB3669.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wje9Faltx7TKTOmRclSAEsB3l8Q+Lu+htQd9A+5BuLmLSYkmeVB0htxXJNeee7OuZzjrHQWUv8fXUsxcwjIlI0vz0s4uO62CgGgrwCLmHLpewbnDEpNVIwsg3z59KMovzEVHE3Z4XejPmLIbiwaRTRNcKeJjj3ZqlDVUwtybpsoU40BlFexIU5EelSs6cZTFdoSrEz9iFRGDJ/hMXwcUtqJ3iJLgmAv1N7xqbLiaJlbWZoyGzP58IRj90fOYbNecJcunqHFUBbk0R8Hb4cjGk5ekDIsKNxXcTF9ParNnILDSFYCtRv3kfCjhK57LkwMmaW5hSo4Zub04rtMpArpoBoWjDLQnt7g+8SyfltQBzOeNcOYwYYFnVLLY4SxHoepLOllkRoxUlPXw8kY884GWunj1N6nUp3oCZ3gin2RTMNpXTHrbjkG8N4wDx1zwe+2Uvy4BBDT3d0GYmcvKy8E5eLu/yCPnjOen+sRzewJJyEApvjH97SCjF0wzk035iUmUsN/uRMgzwvKPy4MgUPvmcU8HqHhrscl5uDG06+ml+1KIIU0Y0hNsconULgDkhtOEqDKdlhOBcoXIQRF9/nWqIE27uFbUblOLYogZRMP1pHUq9PUsHW6/pulgpALzjxv4gjV6gjqWohb2Dj4AKvoIELmEpgLDiaYgd3rHeC8R+zHTOIYBlSgRT81jmRB4EdDFaQjM2q8lYVUcOIlouUGAPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(55016003)(186003)(122000001)(107886003)(316002)(54906003)(6916009)(86362001)(38070700005)(38100700002)(83380400001)(52536014)(33656002)(53546011)(9686003)(7696005)(2906002)(6506007)(5660300002)(26005)(66556008)(76116006)(66946007)(66446008)(8936002)(8676002)(66476007)(71200400001)(64756008)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXRMbDN1Sko1aVZPQkdqVjB5Tm8vOE9hck1hZE5FTjNsSWVUb1dkcEVtMzRQ?=
 =?utf-8?B?K1Z3ZXF0M3ZqN2w3VDRsRDVHRWh4ZUhaQ2VDdy9QZEpUTTNBTUs0ZW0rVWZK?=
 =?utf-8?B?TXE4RDdBT3NuWVN0ajRCa1VTenpmL21hcVp0TW9Pb2hZVzFZdjBCYWh0QkVC?=
 =?utf-8?B?RzNUQVFDTWZqb2hWeHZveWloMm1JOFRYVmNtVXFWdXJ1MXk3Y1l1RngzR3B2?=
 =?utf-8?B?SzVKWlFsYmJobXhTVFdaTDdOb2x0TnBiRXlyMXJvSXg0aTlSbk1qWFVBWDNk?=
 =?utf-8?B?dXVUNk9ocmV0b2NWUThoWUtOaGhHcVQwK291QkhLZ29xclZRcWRTOU8yc0Fq?=
 =?utf-8?B?VHhTQ0FJTzhCb1djZVE5c1RuSE5wNzlMV2x3cUd2d0FOZ05nR0RmdUZQMm05?=
 =?utf-8?B?Z21rTyt3RkhMSXpqbmt6ZE1RazA0eFlRY1RwQVJicUd2RGIyTlBUVkJJNzFZ?=
 =?utf-8?B?MGhmRFpJMzZnNnFBWXRybi92WE1zTHRRQ3E1dDJyR280U3FYNnRHKzFaalFI?=
 =?utf-8?B?d2IyUlF1WkoyUDFxckkwUU01NHZIL3F4Yk9ibzIzSlFabDBWM1lkWmZvbDlL?=
 =?utf-8?B?ekE3WkJ0cFQ1cTdVUmkxYXMvNmhNT3EzblZwb2JGSjFZNldHYnJzcFZzak55?=
 =?utf-8?B?ZTgrOHMxZWxJNUpTSmJIUEV4SWlHWXFFbENTK3AvVnB5QmZMbjBjUWZTQ3Bj?=
 =?utf-8?B?N0JVN0tLTGNnZXdxYWpSc0cyYlJubmpZbVB3dmJ6TklvQzB2cS9jMXRlZ254?=
 =?utf-8?B?Y2VpWTZwdWtpWjFXTUt0N0lVeERXeXlOM0V4dXQ4cmEwTnFBU2ZKK08vRWhC?=
 =?utf-8?B?bFBvSFNqa0VJMG1oaDVGVURVbnNhTHJNL05xZ3c2RU4xTGM3SFRnRlJ1ZmV6?=
 =?utf-8?B?c0xjNkpxZGEwSVQ1ZEt2QjFydjQ5dU5pdUhSUjl5bW9icmJET0xYRDVjd2JW?=
 =?utf-8?B?SUVxd2FUTkhPOFU3cGhMRVZKcHVZREQyQTRGS3l4UDhKRG9kYTYxdzBQcmZM?=
 =?utf-8?B?cC9lOWhoRTVlTUR5VkFwWHo3RlZGcUFpanFxNVJDZEc0VzdzalE5ZU5taEtu?=
 =?utf-8?B?RVZsYW0rT2FwZU43RCsxZjJ3aHkwUUpDVktIbThUYWh2VVFuNm5HOEdSRnJY?=
 =?utf-8?B?dGFoMlE3VkhWUFhvckRIdThyNzV3Z2JDaE1BY21UTGYyNjhDdUkvOGEzVVV3?=
 =?utf-8?B?OUM0eCtmRi94OXA1RWhBWmVqMkdrTTAyYmZ0a2hDZVh1enlWMDVOcDBibXls?=
 =?utf-8?B?NE5vSmlPN0JDNFcwL0pCWTVXVksrSEhxbG1kTGFjZVBGV3NtR1BBb3hYYi81?=
 =?utf-8?B?Tkh0UzJZeXJkMS9VdHpFWWlBRTdaS0MwUXhmVnhONlYxTWE3ZGZjUVFuWnhl?=
 =?utf-8?B?Q3YrejA0LzcrQkM2S3ZBRENud2RROUozRm1nNFVQMldVNTlDYjkwNkh5TzMw?=
 =?utf-8?B?KzFVdDh0NVAyQkFsemJPYkNzc2NEMmJRQUVUdzUxMlAyWlRqOE1ybkdsbDZy?=
 =?utf-8?B?YTRHdU9nS1FvZXlpL3R5aXAvMnFLWnZFTlprT3MvM0R2OW12KzJiVXhpbHc5?=
 =?utf-8?B?RDcxNkFCSEhYTXBKNVAwcHVpcDc4ZU1mZUI2ZXhZYzRaUFVJYVN0cTRjTWtE?=
 =?utf-8?B?ejlacHFrdGV6MEtOMVFmSVAyRS82TUpta1RvSlVlVjdjemhuYVQ1eldNMVFk?=
 =?utf-8?B?d0s4Rk1abkhsbFI4b3dsaTBHekhIamlqY2Q2dktwTzloY1JXY3FibEdDMHd2?=
 =?utf-8?B?cWZoR0Z5UEVBcHBVNHIwcUxaZW5TYmMxZld0OHhBQzV1WkJsOTYrWVM5V1Jk?=
 =?utf-8?B?ZmJmVDdhZWc4cy9BQXNaUE44U0V6ZlovNzk3a2tGVGxBRFpwRXpnUUlvMzVl?=
 =?utf-8?B?L29OckZWcU9rVHFaTmxHbC9mMFhPVEJseGsrVFlzM3Y1RUlZb1RlcGxmYmh6?=
 =?utf-8?B?c2N6c09FZ2NyTjVXMm41aEt5VXJqbFNnTEpORTFqRFZFZVVRZi9va2NEWU15?=
 =?utf-8?B?dmtSQ1JjSE4xeUJpRmVwRm1VTnFncDdkUCtxS3hEYUhDdVNpK3BYNGFoaFY5?=
 =?utf-8?B?TjNEOTZCZ0tOcStDaDNrcFhST0p3dnpvNnNUWXRBczVydGZ0TWkvWmUrSTYz?=
 =?utf-8?B?d0pReUZpdUF6YmVqZGlZWnM1YmNwUHdtT1hpTGNUczZWeWZzSmMwaTRUR0xO?=
 =?utf-8?B?SHh5bWtHVEoraWhhTEVsSW9OdTJKb0Q1S0VraDlYTHo1QTJVSDU0UzN2TUw1?=
 =?utf-8?B?ZnlLZ2VrNk9Jbzk2bFlxRXdVVEh6ZlBpZ1Jlek5TMXRGeW5lWnFkd1AwUkUv?=
 =?utf-8?B?cDVYMzF0eTEvdEg1ZFpDdHcyazlzZU5iaERKd1IvOWdRalcwbkF3d01PQ2h3?=
 =?utf-8?Q?sFSq7baSXrVYGwUE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1dabb00-ce6c-4160-7a1a-08da244fe01d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 11:04:30.6923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wTrSysffFTmX7Zd1TZrDiulk34EYOHerrnL+ueFxgdS8Cf1pkBo2/xou1X+r8xp0i1Acg2DboshBoadUa/lPQ29LRcgnKmqVBZahvUMZMX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3669
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS85XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgRk9VVFBPU1RESVYgY2xrIHN1cHBv
cnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIE1hciAxOCwgMjAyMiBhdCA2OjUxIFBN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gUExM
NSBnZW5lcmF0ZXMgRk9VVFBPU1RESVYgY2xrIGFuZCBpcyBzb3VyY2VkIGJ5IExDREMvRFNJIG1v
ZHVsZXMuDQo+ID4gVGhlIEZPVVRQT1NURElWIGlzIGNvbm5lY3RlZCB0byBQTEw1XzQgTVVYLiBW
aWRlbyBjbG9jayBpcyBzb3VyY2VkDQo+ID4gZnJvbSBEU0kgZGl2aWRlciB3aGljaCBpcyBjb25u
ZWN0ZWQgdG8gUExMNV80IE1VWC4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZv
ciBnZW5lcmF0aW5nIEZPVVRQT1NURElWIGNsay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiBSRkMtPlYx
Og0KPiA+ICAqIFJlbW92ZWQgTFVULg0KPiA+ICAqIFJlcGxhY2VkIG1hZ2ljIG51bWJlcnMgd2l0
aCBtYWNyb3MuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2Ry
aXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5l
c2FzL3J6ZzJsLWNwZy5jDQo+IA0KPiA+IEBAIC0yNjYsNiArMjc4LDEzMSBAQCByemcybF9jcGdf
c2RfbXV4X2Nsa19yZWdpc3Rlcihjb25zdCBzdHJ1Y3QNCj4gY3BnX2NvcmVfY2xrICpjb3JlLA0K
PiA+ICAgICAgICAgcmV0dXJuIGNsa19ody0+Y2xrOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RydWN0
IHNpcGxsNSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2xrX2h3IGh3Ow0KPiA+ICsgICAgICAgdTMy
IGNvbmY7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcnpnMmxfY3BnX3ByaXYgKnByaXY7DQo+ID4gK307
DQo+ID4gKw0KPiA+ICsjZGVmaW5lIHRvX3NpcGxsNShfaHcpIGNvbnRhaW5lcl9vZihfaHcsIHN0
cnVjdCBzaXBsbDUsIGh3KQ0KPiA+ICsNCj4gPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgcnpnMmxf
Y3BnX3NpcGxsNV9yZWNhbGNfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcNCj4g
PiArcGFyZW50X3JhdGUpIHsNCj4gPiArICAgICAgIHN0cnVjdCBzaXBsbDUgKnNpcGxsNSA9IHRv
X3NpcGxsNShodyk7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcnpnMmxfY3BnX3ByaXYgKnByaXYgPSBz
aXBsbDUtPnByaXY7DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIHByaXYtPnBsbDVfcGFyYW1z
LmZyZXF1ZW5jeTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIGxvbmcgcnpnMmxfY3BnX3NpcGxsNV9y
b3VuZF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHJhdGUsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKnBhcmVudF9yYXRlKSB7DQo+
ID4gKyAgICAgICBzdHJ1Y3Qgc2lwbGw1ICpzaXBsbDUgPSB0b19zaXBsbDUoaHcpOw0KPiA+ICsg
ICAgICAgc3RydWN0IHJ6ZzJsX2NwZ19wcml2ICpwcml2ID0gc2lwbGw1LT5wcml2Ow0KPiA+ICsN
Cj4gPiArICAgICAgIHJldHVybiBwcml2LT5wbGw1X3BhcmFtcy5mcmVxdWVuY3k7IH0NCj4gPiAr
DQo+ID4gK3N0YXRpYyBpbnQgcnpnMmxfY3BnX3NpcGxsNV9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3
ICpodywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyByYXRlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIHBhcmVudF9yYXRlKSB7DQo+IA0KPiBUaGUgYWJvdmUgMyBmdW5jdGlvbnMgYWxs
IGlnbm9yZSB0aGVpciBpbnB1dCByYXRlcyBhbmQgcGFyZW50X3JhdGVzLCBhcyB5b3UNCj4gcmVs
eSBvbiBzZXR0aW5nIHVwIHBsbDVfcGFyYW1zIGluIHRoZSBEU0kgZGl2aWRlciAocGF0Y2ggMyks
IGFuZCB0aGUgY2xvY2sNCj4gY29yZSBwcm9wYWdhdGluZyB1cCB0byBhbGwgcGFyZW50cyAoUExM
NV80IGluIHBhdGNoIDIsIGFuZCBGT1VUUE9TRElWDQo+IGhlcmUpLCByaWdodD8NCg0KWWVzLCB0
aGF0IGlzIGNvcnJlY3QsIFBMTDUgcGFyYW1ldGVycyBhcmUgY2FsY3VsYXRlZCBiYXNlZCBvbiB2
aWRlbyBjbG9jayBpbiBEU0kgZGl2aWRlcihwYXRjaDMpDQpBbmQgcHJvcGFnYXRpbmcgdXAgdG8g
aGVyZSBhbmQgc2V0dGluZyBwYXJlbnQncyBjbGtyYXRlcyBiYXNlZCBvbiB0aGF0Lg0KDQo+IA0K
PiBJIHRoaW5rIGl0IHdvdWxkIGhlbHAgdG8gZG9jdW1lbnQgdGhhdCBzb21ld2hlcmUuDQoNCk9L
IFdpbGwgRG9jdW1lbnQgdGhpcw0KDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gVGhlIHJlc3Qg
TEdUTSwgc28NCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9y
Zw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUs
IEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQu
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
