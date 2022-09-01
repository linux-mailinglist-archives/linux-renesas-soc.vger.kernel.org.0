Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92AF15A984E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Sep 2022 15:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiIANS7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Sep 2022 09:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbiIANSa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 09:18:30 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FD47A774;
        Thu,  1 Sep 2022 06:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF9kLrBXg2tO75Rzyz+hD9jpCRoopaKDbWpzlYg6W6DAt8fONLmEMEKPSO1stUX4kexJMkegOqkKF0n01MFyG199pijIOu8/5FpQgMrVKdnYhOkMAgsazYBU/0qzGmFsJDuL8DjeaRZ+srFpnZHOK6Bvn8172Z/FDCM+BGWbqwiogv6MRME3Ou8Mw2Jq7k5cw/yzp8jj7n/Rg9JEMjI5F+/rqidEs96JR6fWYiHT6atsD6F2cLPmD5mznSYPskqQ0+41j6OwfqdN0oewIJIW8Xf9AE+89hBEFcd98RbYuOmL1kk6dxlAH43tOyDWfcOXpp0fuyrD+StMkYmAaImf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7tYdpwPd1zFtMMWY8oXBlFqCzu5GFh2S8io8kyU0Gc=;
 b=hS6QEuB4Uw1zS7/GwGxb4m38lKchPqWltKUJJrfkejAEcvdao7NhEoy7kBHRAsWl6y4XFC3WTjp2aeRD9KU8oE7Wzzs+KmHniNXYrO1qm1yEVuBcFt9AkLekPK8lWtPTIJr8wiY8RRAt5Zo5gEflVC2j0cWzPhCBYeabr75/4zjgKEX+v+iQjhZBekRxMOy2OS5hYsLoO+CQxXZvBQABn7SLUZyNvvwWp33I2ajrc5blF9fIDflUCodTGdEwmKriFQ/944h1iOrjuzoa7TrM0qOMuA3y1A773GjHiRsCwcJEYHsoWdH+rfkMzeulOw9hfVvJpIGHr6Mz6Ij7BUE/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7tYdpwPd1zFtMMWY8oXBlFqCzu5GFh2S8io8kyU0Gc=;
 b=sw/WhK6UWQjACdaJqgM4sSO5ZrSyVTy5QANq1oS+RiQQe1XfDs3lF55gnnD65w6l4DzcH93C501gs08lsVztC7UgmrGuhmrYku+NxxcpXgchm49+1v22mucEicyjjjBQKnWLTrzCQVJNL3SvFnKAi5k4r9iqGvyqG5mKVOD33cc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10520.jpnprd01.prod.outlook.com (2603:1096:400:29f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 13:15:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 13:15:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v3 3/3] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN{0,1}
Thread-Topic: [PATCH v3 3/3] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN{0,1}
Thread-Index: AQHYvI/xwwoQLfdpd0uJ7SnkncZ0563KiFyAgAAEIXA=
Date:   Thu, 1 Sep 2022 13:15:20 +0000
Message-ID: <OS0PR01MB5922F1B7FC6D7C6249EF22B9867B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220830164518.1381632-1-biju.das.jz@bp.renesas.com>
 <20220830164518.1381632-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdW_+VSbTj1qidjiHZX+0ryCSFj3AQskM3oX4PKjHD-9ow@mail.gmail.com>
In-Reply-To: <CAMuHMdW_+VSbTj1qidjiHZX+0ryCSFj3AQskM3oX4PKjHD-9ow@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 021ee6ad-2d7e-46d7-7854-08da8c1c05d0
x-ms-traffictypediagnostic: TYWPR01MB10520:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LzzBjm3+qBwm2tzUBaJKH27e3A09g7D3E73Xqia9Gm04gfUxNGu324RcexQ18pefohMtnlM13Xx2AqM5VjDZNXgx8NC/AoGKK/gYri+2eiwaAOb2qq8S0n5MFZN5G23eRQ/GD3Nnw7u0zJb9NLrKd3hQNJOeWOp+7xZnNC8Byh5N7Ih+fYLOlSNvJAfzIbwQRE0r0ZMXV0GYahHfmmlX0S7vk3/0Yl0BaFiCWfMXRYnZmHOdIVaxOttdFz42D6K1QMj9FAxsfl5aFgN0Q3liaQhHYsWw9OEr8PgOyXPCqoRt4Nu3pAMS2PDIYFTq/i9v2id7h3vuyVWy83imohNEI7Qgp2JudipqL+E/VUF+ms7R5PRpPnGEcuTHfGy9H97Ho2HkaHoXqycx8xmZILOkKohbz/i7xxra6H4YkVeDJMd022cVovhop6aBsDBL7xIPMWxcNhg5f2brpag2XkxdcofsU+Wgs7yzppT2GJN64BiHhABPpNkfTqNy1CGba6aiURCHGdUAo1WY+vVNoLxqMV7W6KkainVt7XKhUHtHuPBaqgvPr7ZLVDcJTNY7RxPwOwE7dVsmX8sbpd50DQY3xGkBt+J58bSCaRXvezn46AQ18ZTUuWu/uKU4Pwbt/fY/KM9oX9ICkCe68Y0eJ33jRqL4G6JQYyr25oD0+65WBTp9ZMaPIVa+tqFEVuMVdAHaWYZV+zq6dSqbMH9nF46MFeU6mfcy6BFXaRauXYxeoSfrvteDdlzl4D6l5lmEdSb5VsmQai2iHKD/08hhXIufvQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(9686003)(86362001)(478600001)(26005)(107886003)(71200400001)(53546011)(6506007)(7696005)(41300700001)(38100700002)(122000001)(38070700005)(83380400001)(55016003)(66476007)(186003)(6916009)(5660300002)(76116006)(54906003)(2906002)(8676002)(66946007)(64756008)(4326008)(66556008)(66446008)(8936002)(52536014)(316002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjByUDZ0N09CLzBzZmZDY2hpL0JjWlgrdE5oS3Q5QlNJb3VVd0t5Y2lCRE15?=
 =?utf-8?B?SWE1QjVGY1R0SVEvaDl6VTN1U1NVMStWeS9qTXNzN3M4WTlvNWFQeDBuVjhk?=
 =?utf-8?B?c3puTitzMUdUakovVzRVTXdWdVJuRmhnZ1huT0NCMGJ6OEFKS2trT3FGWk1l?=
 =?utf-8?B?dWZwMnh1Y29sbHRvV2dWamJjMHdWOCtoNXBBVjJEckVscnNOZlQ4VzI5cXhT?=
 =?utf-8?B?aW11T0xLWTA0dFVWamtzK2NCeWRLSEYwdStFK2xnUDMvMHNqcG5wR1FTdEdG?=
 =?utf-8?B?cTE2UlAwb3NwWkRKdnZIYmFsRmM2TnpldzduTmZWbGhRbzVUbUNaS1FJd1NO?=
 =?utf-8?B?WlJNR0o0MUxGb2c1WkVLUWJGMlFUVHp5Z1BFQUFNRTQxUVhqUDdDaVc5MDVp?=
 =?utf-8?B?OXBIRGI4Mk1ya2xlQkVobW1CZGhvbmpFaHlTWlVJeG1VaytsM0duNUV2VUVr?=
 =?utf-8?B?WUo0VG1XQ1diRzFPekUxbkg1d1FmYUVNUzJmeWVVWHZxeGd0anNvbWU3akFQ?=
 =?utf-8?B?Z2lxRWNUTFlRQ2ZzeFJJM1M5Tm54V1phMDBoNFJadUxBamMwb0ZSSVJXOFo3?=
 =?utf-8?B?TzE1YzBxOW5oOTZleUM2VnlIemhuT25jYmY1VE02M2ovUVJDa1hjTDAyTHdq?=
 =?utf-8?B?d2ZJUWtwYzl6NWFoTlRlajBlaVV0dnVtR1pEQUI2ZkpqYkVGRkYvVDdjNXVH?=
 =?utf-8?B?dVVzRXYrU1I1QzJVS2ZsbnBDOG9Cc3ljWUFhbU4zSW4rcmlTVVZZd1hDdmsr?=
 =?utf-8?B?L2MvcFpiNFlESklkY0IrQTFCdHJDUTJoU3hNV0FGeDQwb1pNaWtheTJKZ2Rx?=
 =?utf-8?B?T1RDWXNRejJqTmloSll5dGUxc1VWVUtDRGExMDVMMnVmUHdtRS9TRE1lbnY1?=
 =?utf-8?B?bmdkdS9iRzF2UjJhTjV2ekludW84Mk5pSDBKQVB0RGRnOEptQ0c2MDZPV0Fl?=
 =?utf-8?B?azI2NnNHaVBiQXhpbzdKL1dkOUd6bXlEUFNUR05abHBZRDFkTGpWOVhHNWkx?=
 =?utf-8?B?RGoweThRcGZIb2Y3cDRWaUtqa3h1UmxNcmYzM3RlTG9SejNqSlNlLzNaZ2s1?=
 =?utf-8?B?V3BZUjdBQjFFRWw4OFBJREhxZGxKZUZWZW16UzhqTFFHRW9yY0dkblBGckNh?=
 =?utf-8?B?a0xHSlp1UU1aVWxLYnVZT0lGNUhXNEZTTG9vR01YQStoWU1FRlhjUlJyM3RM?=
 =?utf-8?B?aDh3UjdxbnZLV0hid2prU2s4RHNIWit5UDBvNWlvRWtKbzhvRmh4WW9Xc2kw?=
 =?utf-8?B?TlQyR0JXMS9MZmtxdUdsQU4wU1dpVlVwZ1ovdzlUM3Rndkcvd3crYis4VUh1?=
 =?utf-8?B?R2NRZE0yU1VCMW9Uc09qZ04yWjdaVWZISXVlQno0YnlkMzlEcHcxbWhNejd1?=
 =?utf-8?B?bG9kWTRKQ2E4d2NjdlZQRC9hMEN1eVdkSVIxK08zQUtlSUg3eFUwYjdjcjV3?=
 =?utf-8?B?ZkhRL1AwdmJZOVlUTjlSRlB0QjllSmFYVThWM1BkR3JVVG9OMzBYUDU2UFMv?=
 =?utf-8?B?RW5nZlNmcUl1MXFxaHdzUHBWb1FBWVU0YXNXckVwSVVHdnlIdjZpKzVRbUN0?=
 =?utf-8?B?VCtsYUFPUG9HbDlFQm9zaTd6enlvbk5oT2hHa1ZhYmR6cFY1MHAvNHRtdUd4?=
 =?utf-8?B?NjBYdmpwT2VQSTV2SGRoRkQrdUlNZXNuM0drbEI2cUk5K1YvUHFkOFFQOTM1?=
 =?utf-8?B?dkJCV1F3ME9QNFVxQng2bDNPU04zUU9SUVViS3Z4WFlLSG8xL3NkUnN5QmFh?=
 =?utf-8?B?T3FoZmhRRFlxdEJNaXR4TkJSZTVzdm0vSGpkQlc4YmNjQXl2Ty9MaVhDOTVU?=
 =?utf-8?B?WFArZmc5UmxZR1RwVnN4OUdkTS9XOWdhKzZyenJVN3VaWitUM1lCSGRsQ2R3?=
 =?utf-8?B?em9saEJmUmZ1cWlDb1B6K3VBNnVBVks2a2NCQ3hEWXV0dVFacTlhS0R6bHFy?=
 =?utf-8?B?T0FTOWY5dk8vc1JvNkJCS3Z6SXV6em1GVWZFTjYxNUo3ZVgvcWE2bm1BeFp5?=
 =?utf-8?B?dndYdU1qNzlsaXpleU9JRTlUS1QwU0p4V3ZsY2FvL0dIYkp6cXp2aWRTeFYz?=
 =?utf-8?B?bnpjRWozQ0lqc05LQU9adzRmcUJoM0xldXR1b1RiVWFZWVpGSjlFK1djSUpt?=
 =?utf-8?B?Z2QzbUJwb0ljMnh2dStTZTRwaUk2MURLOS9jNWFiTlB3RksvSXFZYVc2dW5H?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021ee6ad-2d7e-46d7-7854-08da8c1c05d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 13:15:21.0555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +8z1oUjU+q/jVDljJYkLQpTp5pycr8o2f3Xgw86FPYQtA/PM+oLp+v4Z/c9ztF0IRGnlOx+0mIoTIuYgbooJUI1DEg4T/B5knx4eQb6iAwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10520
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
UEFUQ0ggdjMgMy8zXSBBUk06IGR0czogcjlhMDZnMDMyLXJ6bjFkNDAwLWRiOiBFbmFibGUNCj4g
Q0FOezAsMX0NCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIEF1ZyAzMCwgMjAyMiBhdCA2
OjQ1IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+
ID4gRW5hYmxlIENBTnswLDF9IG9uIFJaL04xRC1EQiBib2FyZC4NCg0KTXkgYmFkLCBpdCBpcyBS
Wi9OMUQtREIgQ1BVIGJvYXJkIGZpdHRlZCB0byBSWi9OMS1FQiBjYXJyaWVyIGJvYXJkLg0KQWN0
dWFsbHkgaXQgZW5hYmxlcyBDQU57MCwxfSBvbiB0aGUgY2FycmllciBib2FyZC4NCg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiAgKiBObyBjaGFuZ2UNCj4gDQo+IFRoYW5rcyBmb3Ig
eW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcjlhMDZnMDMyLXJ6
bjFkNDAwLWRiLmR0cw0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3I5YTA2ZzAzMi1yem4x
ZDQwMC1kYi5kdHMNCj4gPiBAQCAtMjYsNiArMjYsMjAgQEAgYWxpYXNlcyB7DQo+ID4gICAgICAg
ICB9Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gKyZjYW4wIHsNCj4gPiArICAgICAgIHBpbmN0cmwtMCA9
IDwmcGluc19jYW4wPjsNCj4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+
ID4gKw0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAr
JmNhbjEgew0KPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZwaW5zX2NhbjE+Ow0KPiA+ICsgICAg
ICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArDQo+ID4gKyAgICAgICBzdGF0dXMg
PSAib2theSI7DQo+ID4gK307DQo+IA0KPiBBY2NvcmRpbmcgdG8gdGhlIHNjaGVtYXRpY3MgYW5k
IGJvYXJkIGRvY3VtZW50YXRpb24sIG9ubHkgYSBzaW5nbGUgQ0FODQoNClNlZSBhYm92ZSwgUlov
TjEtRUIgc2NoZW1hdGljcyBoYXMgYm90aCBjb25uZWN0b3JzPz8NCg0KPiBjb25uZWN0b3IgaXMg
cHJlc2VudCwgYW5kIHRoZSBDQU4gaW50ZXJmYWNlIHRvIHVzZSBtdXN0IGJlIHNlbGVjdGVkDQo+
IHVzaW5nIHRoZSBDTjEwL0NOMTEganVtcGVycy4gIEhlbmNlIEkgdGhpbmsgd2UgbmVlZCBhICNk
ZWZpbmUgYW5kIGFuDQo+ICNpZmRlZiB0byBjb25maWd1cmUgdGhpcywgb3IgYXQgbGVhc3Qga2Vl
cCBvbmUgaW50ZXJmYWNlIGRpc2FibGVkLCBhbmQNCj4gYWRkIGEgY29tbWVudCBleHBsYWluaW5n
IHdoeS4NCg0KT3VyIEJTUCByZWxlYXNlLCBieSBkZWZhdWx0IGVuYWJsZXMgYm90aCB0aGUgQ0FO
IGludGVyZmFjZXMoQ04xMC9DTjExKSBqdW1wZXJzLg0KSSBoYXZlIGEgUlovTjEtRUIgY2Fycmll
ciBib2FyZCBhbmQgdGVzdGVkIENBTiBsb29wYmFjayBvbiB0aGVzZSBpbnRlcmZhY2VzLg0KDQpD
aGVlcnMsDQpiaWp1DQoNCg0K
