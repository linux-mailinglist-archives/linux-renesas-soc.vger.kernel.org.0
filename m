Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60AA851367D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 16:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbiD1OPT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 10:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242833AbiD1OPS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 10:15:18 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB647F206;
        Thu, 28 Apr 2022 07:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbJ6Ds2nMxXcWu2U+Nb/U09t/sI/E4dFnCVXrTlnmxpbtcfZB2/R1XCtNVWB0Hq5ZXRhGPOfKAYMO7+QgP02Qo4wWDqsutjS9AaB11BxpohhUoI+OUVfqLS+SYjGfLcQNqsG3BNbo87/pkPvEVopNuyjkJqY1qL6XaTXXSzESN02Wrl6ADALco7ogU0zifCqBqxyH/9qNFFTQ2iNkSs4/eQPCklph8p5UMbcw3LSlmFq5OnXLwKhbbQEiUH1dPaBdGsZql6uAj5vQYlLrwuLjgbiQu9kLvIpq3tBzrjnAgves6VRIAnTddqLeBE6rHll7m35AFVUvjvfmWumqW1FdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjXBe5ceRbmHRa7SZUOnJeQGZL/CtlAF1tATEKPBHFY=;
 b=Kof7MKuaZ+O491/vZrEdZEZ1/fkJLV2Q6kPKk0ikSQL0pHcGsjM1G/NVvpl7ux/6nv7LuHJ9Rx7BkaQ8FBqhwlcnM9J4KT3s41Z6ylH9LxzNsb3n6Gj+CriwJp7HgDqH9tqlSOJWMloKkUK7te++iHu6nM8TwE5d1B5P8MC3WszD12UQruxw4U5y1teIgIsybZKqbKw+CSVHCkLvXSugnbNUmpI0rVcGgv/WD4Raxgx0SJ3RKv88K0Oqw0/K1DtXi+QTf1POL//mhPtBQh0REYfMpOCJTvEqlbGjCyhjsvcDHPfOkBQ2FfvPZHgbPVKF6mQyALa6o6+aHielU2RykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjXBe5ceRbmHRa7SZUOnJeQGZL/CtlAF1tATEKPBHFY=;
 b=bnhqtzayR/sJTHjpzGPvu42jTdqVM28F0DDGVB7WGFdM5cmeP58eywmcUOQV8iifPonTp4hAxvEDVktx2QALhXQgZXZNX6Qvt1LJHMwmQb24MB4/upNRZkAYLL4XD7kh8a2gXqzC4sBW1apWeY2l2T/sLbg4QS9GsVeF3pDFC7A=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYBPR01MB5549.jpnprd01.prod.outlook.com (2603:1096:404:8020::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 28 Apr
 2022 14:11:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 14:11:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 08/13] arm64: dts: renesas: rzg2l-smarc: Move ssi0 and cpu
 sound_dai nodes from common dtsi
Thread-Topic: [PATCH 08/13] arm64: dts: renesas: rzg2l-smarc: Move ssi0 and
 cpu sound_dai nodes from common dtsi
Thread-Index: AQHYWMbBAaDZxpKFSEmSLxmO6zG7W60FW9mAgAAAwmA=
Date:   Thu, 28 Apr 2022 14:11:57 +0000
Message-ID: <OS0PR01MB5922125E1C9A4C3ED7AEB09186FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
 <20220425170530.200921-9-biju.das.jz@bp.renesas.com>
 <CAMuHMdUC+iBEri0eg-eR2DEFBFiX_dmbsKnHp-NF6WoymO76Nw@mail.gmail.com>
In-Reply-To: <CAMuHMdUC+iBEri0eg-eR2DEFBFiX_dmbsKnHp-NF6WoymO76Nw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a16b7e90-fac4-4f51-5b86-08da29210e22
x-ms-traffictypediagnostic: TYBPR01MB5549:EE_
x-microsoft-antispam-prvs: <TYBPR01MB55499C8594B3E8E21381ADBE86FD9@TYBPR01MB5549.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Y2xtOa9mv/RN8M95WugPlAQAtkaGFmuTQj7cn3MTX2oAmIXimCNGp15fZvgALq7/CWTbMDDg/eGo0f094wqAVKjZSq/oQ1Op3E2nlR4xSchwKXWXJdVC4//5UQt5BDiV+gobdpmszZv2+W8y99nmBVkyUfVPoWl+TuxMt7U85vzi4Ci6CXVWn+WT3gLaqkNp1nDF5FcthtUXGCKt7hHTsc9DdW8o/jsGGW4JScb56PChtuOMRrs1pJZuO5UaTnFpr76HUyxS5t3fVxRBGWCmLa5wQXJWjOFRI2xBu2uvwoe1+E48PyqmscbQOz4ZJ11Vsb+7tvEjXZeIdUR8Nj+qSj4sb0qLd3+ClWFiqWFmbF0iD30gJvzNU4zM0gh67s/XU72rayAqGnflI0+38t4XiQdmVD9yelYUiK5V/vvCf9I3ybvyXiElF5nh0YOpJOFwhMXtSh7ZJLmeYjrkQBJrRuDI4dOBDKW99c9Qgc5XzKp8+REjFLinz/w/8nq7vBIrtdWk1hU51ZJJGML+kz62lr2pFbc1wi/GPR73WC4d/lI7cwga8wdJKWpl404PhCITljG8Rj0BRWCfrNGANCSPMauhymQfHwDcDINCIFLVcGh9/YC5woaa9sO+SPch+cIovZFXDe4Gi10kRu046xBnbylN8LD9yLGSpqgrrtHZuYY8dhNSqpCpsizmM3f0T8kAcGmUyZg588a0Y2enSDSdg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(316002)(186003)(6916009)(107886003)(26005)(71200400001)(83380400001)(86362001)(38100700002)(122000001)(55016003)(2906002)(66476007)(66946007)(33656002)(76116006)(5660300002)(66556008)(64756008)(66446008)(52536014)(4326008)(8676002)(38070700005)(53546011)(508600001)(8936002)(6506007)(7696005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1N2a1dRUTAvWUd0cDVtWVlWYTI0cjVPUGtNMVgrSWFKYjRNbmZnbGdjV2ZO?=
 =?utf-8?B?TjFTMFNFeVFvRmNSa2lmWktEcGEveWQyN3V1ek0ybnhWaGwwRFBRY3RaSUVM?=
 =?utf-8?B?d3FoWlpCVTNFZHUxYWxrQ1Q5NUpXZTgyNFBYMWlMKzVRUTNGSkdoYkFML1hL?=
 =?utf-8?B?VW1mMjFjUDFscGVydzZ0VGNzNjlETTZVaVlaRUVuVFlLK1BNemlDOGdaZDRO?=
 =?utf-8?B?Z0oraW5JdmlDc3lmRmJwSXlsTGJjQTJadlJWakV2Ykt1d0Q4M2RGNHdJNUNp?=
 =?utf-8?B?TUFYQkxqUk5jVStNcWNvdTgyVEZwOStEVFYyTHFmZEhKYVVpZXE0UzFwWmlj?=
 =?utf-8?B?Y1Jld2Y2R09WajdoWHZhL2tRRFBYK1EwYzZJakh6dThQWG9HelVwMUFva00y?=
 =?utf-8?B?MTYvRFhjd1lOUi80ZUk3c1NxR3JOTUxGMTArV0dmcHhSNlJFdDBxYkszdHJ5?=
 =?utf-8?B?MGV0VXVKS2N1MnEwQ0R3NEpaWjRyT3NBZXZvTUFLSkxiSUt1eGtsaHo4SER6?=
 =?utf-8?B?c3BjakNlNnVuRjdQdEcxd3pqQVJoWjJDaXJMb0hCSXFSTDVHS0VibjJ5UUFE?=
 =?utf-8?B?VG5VK0N5bFNyUWpZUk14MzMycWJNRUdmNElCeTY4VXBTL29tNERHbG9TL2RN?=
 =?utf-8?B?MUd0YVd2OU5EQ3RGdXZoQ21NZGlNcDFDMjNoTWI4SnFtM3BSYVBOcEZ2dC9z?=
 =?utf-8?B?K2x0NzQ5OGwwZHpGZU9LTUN3ajBEV2YrQlNHd0ZMMlpUWVFEZEx4c3pXRS8w?=
 =?utf-8?B?eW1oUEVwVFIrbW5qZFVLSU5HZzVRdnZVMVpjdTgzbzc4ZEc0ZTBjTjBLVDFX?=
 =?utf-8?B?UVZBbTU2UWFQdzR5MitxREQrRlB0c0ZvNDZnWlUrK24yWXpjcDlnQ2FXU3Bx?=
 =?utf-8?B?bGhUY0RjRFVSNUpzbkFteUY1YWxiN0ZxVGhLQ3F0allZNFBBRTFhQVkvWmxO?=
 =?utf-8?B?aytpc1FNVEo2OFlDTjIyQVYwd0MwK2xCMWNuK1JvWDBPV1kvUG5YZ3Rxa3Zh?=
 =?utf-8?B?TFZob284b3p6SGt3TW9LSjh1WHg4Nno2RnpBZTVwdWZhWllJSW9oNGFKQzA3?=
 =?utf-8?B?UWVwK0h3M2ZEZkJobEs4OUU0ZHJ1WFljVDdWN1hIaHZzdm1peU54YmdlRDln?=
 =?utf-8?B?LytxK0V0UGtoVitwY2xQNmJ3VzBNcTJ1QmpicnJLT0FsSjFTUnRjSUU2eUlW?=
 =?utf-8?B?RmVyVlR5dEI2WU55bkcxVmxvbDU4VkJldSszYnJoNU92M2I3bnk5ZDd0Rk56?=
 =?utf-8?B?VGUzL1NTS1Vlay9lSEJOTC82NklZaXFUc25NbHA5VkpKZXZvaW1rbGpSekp4?=
 =?utf-8?B?NEVrWkdhOTNIZGxkZmFBYjBvT0VOZ0NnbmhHTk94ek0vMWxxdEduNnkyaTRN?=
 =?utf-8?B?eTJCUGNPTDNDcHRlYy9jYXhSNEZrdTJjVm12YjJVU0QrdVp2QmtOYnBvVkE4?=
 =?utf-8?B?M0k3ZnpkVzd1OVp5K0hxd1FoSEZwWHZOeG03T2FMWWhpaklMdDFMVmhkZWs2?=
 =?utf-8?B?M2lPdEhrVVQ1LzdTTUptRDFxalFudzZHS2g1MENsQ0pLZHduOU42eUk2S1Mr?=
 =?utf-8?B?VXNqeEZCcVRDTi92dHRKUXlNSEt6RlNLUG9xcW9wU2JzT2ZRRUVkZTJya1hN?=
 =?utf-8?B?dUdVdzlTNm5oVzNCMHkyYm1tcEdoQ2VQTDI2VUE2N3pYOC94a0FERWl1ZkJx?=
 =?utf-8?B?cm00OUl1ZkFPOFNISWRjUGJhTTNiYXNENHlpYW12YWp2enp4aGZHbEozNG5W?=
 =?utf-8?B?SDlkRjZpRGtUN3ZqSG1DU09QRVF2VjU0YThIdyszZ3NvWDM0eDJKRjRtYnF5?=
 =?utf-8?B?ZHhmeUhNbllaQlQ3MzVDUVZHQWEvWWN6Q0t1LzdOTUQ5eGZpYlJaTERhWDJU?=
 =?utf-8?B?NXZLY3FCL3lITzNFNGNITnpoRkdyTk5mRWNwRlBiM3NXNVIzNmZLN0lPTmNs?=
 =?utf-8?B?TDVVUmFlMTE5Smx6RlVsRW94ZTFUU2tSK21vUUNsNTdJSnBiTlhzZjlIbFJ3?=
 =?utf-8?B?bUVmRjljNTlqOGRNUWNsNktvTjFKNnlwdDl0YS9KSk9oZllySGZIWnJWWCsz?=
 =?utf-8?B?VlgrVHQwT0FwVFQ4VmpheHh1akRaVW0xcjNzN0x0eG1VKzF4SEJiQkZuR2dS?=
 =?utf-8?B?ZG1PekU2MnRoOFlTc1owNmQyQnY1NkVtdlpTbVR3OFMrKytCQWg0cXN4a1N6?=
 =?utf-8?B?aVo5d2JPcy9LYkZjb2JZejA2UmM1b2daSmdua05RbUhFK0MwaWhpWThuWlU5?=
 =?utf-8?B?TjlEN0JackRubDRPc1NrSHdKNXRyaGx0YkxucVc4Q2ZlQ3BLZVpDWTR1ZTBj?=
 =?utf-8?B?b2Rsa0Z5MVorMXhMbU41TjU0ckZZdGJuNGZ6OXo0QVZBQVdndHo2Q0lrenZz?=
 =?utf-8?Q?Phfd7hiOP5sVHtmc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16b7e90-fac4-4f51-5b86-08da29210e22
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 14:11:57.3670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7BJUKI6vFeniyfjl6vu/z1FiDqpvQki06XCs2UFy6uHo4CZBod/Knog3YpAu/9hrDZZ8BJP3NQIaHmuAVSXEVABw8070svZqPtegc/BDzR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5549
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQpNYWhhZGV2IExhZCA8cHJh
Ymhha2FyLm1haGFkZXYtDQo+IGxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAwOC8xM10gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMmwtc21hcmM6IE1vdmUgc3Np
MCBhbmQNCj4gY3B1IHNvdW5kX2RhaSBub2RlcyBmcm9tIGNvbW1vbiBkdHNpDQo+IA0KPiBIaSBC
aWp1LA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24gTW9uLCBBcHIgMjUs
IDIwMjIgYXQgNzowNiBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
IHdyb3RlOg0KPiA+IE9uIFJaL0cye0wsTEN9IFNvTSBtb2R1bGUsIHNzaTAgaXMgY29ubmVjdGVk
IHRvIHdtODk3OCBhdWRpbyBjb2RlYw0KPiA+IHdoZXJlYXMgb24gUlovRzJVTCBpdCBpcyBjb25u
ZWN0ZWQgdG8gc3NpMS4gU28gbW92ZSBzc2kwIGFuZCBjcHUNCj4gPiBzb3VuZF9kYWkgbm9kZXMg
ZnJvbSBjb21tb24gZHRzaSB0byBzb2Mgc3BlY2lmaWMgZHRzaS4NCj4gDQo+IFRoZSBmaXJzdCBz
ZW50ZW5jZSByZWFkcyBhIGJpdCBvZGQuIFBlcmhhcHM6DQo+IA0KPiAgICAgT24gUlovRzJ7TCxM
Q30gU29NIG1vZHVsZSwgdGhlIHdtODk3OCBhdWRpbyBjb2RlYyBpcyBjb25uZWN0ZWQNCj4gICAg
IHRvIHNzaTAsIHdoZXJlYXMgb24gUlovRzJVTCBpdCBpcyBjb25uZWN0ZWQgdG8gc3NpMS4NCg0K
T0ssIHdpbGwgZml4IHRoaXMuDQoNCj4gDQo+ID8NCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3J6LXNtYXJjLWNvbW1vbi5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3J6LXNtYXJjLWNvbW1vbi5kdHNpDQo+ID4gQEAgLTUyLDcgKzUy
LDYgQEAgc25kX3J6ZzJsOiBzb3VuZCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJNaWMgQmlhcyIsICJNaWNyb3Bob25lIEphY2siOw0KPiA+DQo+ID4gICAgICAgICAgICAgICAg
IGNwdV9kYWk6IHNpbXBsZS1hdWRpby1jYXJkLGNwdSB7DQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgc291bmQtZGFpID0gPCZzc2kwPjsNCj4gPiAgICAgICAgICAgICAgICAgfTsNCj4gPg0K
PiA+ICAgICAgICAgICAgICAgICBjb2RlY19kYWk6IHNpbXBsZS1hdWRpby1jYXJkLGNvZGVjIHsN
Cj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNtYXJjLmR0
c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMuZHRz
aQ0KPiA+IEBAIC00OSw2ICs0OSwxOSBAQCAmc2NpZjIgew0KPiA+ICB9Ow0KPiA+ICAjZW5kaWYN
Cj4gPg0KPiA+ICsmc25kX3J6ZzJsIHsNCj4gPiArICAgICAgIGNwdV9kYWk6IHNpbXBsZS1hdWRp
by1jYXJkLGNwdSB7DQo+IA0KPiBXaHkgbm90IHJlZmVyIHRvICZjcHVfZGFpIGluc3RlYWQ/DQoN
Ck9LLCBpdCBjYW4gYmUgZG9uZS4NCg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICBzb3VuZC1k
YWkgPSA8JnNzaTA+Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZzc2kw
IHsNCj4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwmc3NpMF9waW5zPjsNCj4gPiArICAgICAgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gKw0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9r
YXkiOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgJnZjY3Ffc2RoaTEgew0KPiA+ICAgICAgICAgZ3Bp
b3MgPSA8JnBpbmN0cmwgUlpHMkxfR1BJTygzOSwgMSkgR1BJT19BQ1RJVkVfSElHSD47ICB9Ow0K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmxjLXNtYXJj
LmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRz
aQ0KPiA+IGluZGV4IDc0YTg0NGVhNzUzNy4uNTIyY2ZhYjY5ZGI2IDEwMDY0NA0KPiA+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRzaQ0KPiA+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRzaQ0KPiA+IEBAIC05
MSw2ICs5MSwxOSBAQCAmc2NpZjEgew0KPiA+ICB9Ow0KPiA+ICAjZW5kaWYNCj4gPg0KPiA+ICsm
c25kX3J6ZzJsIHsNCj4gPiArICAgICAgIGNwdV9kYWk6IHNpbXBsZS1hdWRpby1jYXJkLGNwdSB7
DQo+IA0KPiAmY3B1X2RhaT8NCg0KT0suDQoNClRoYW5rcyBhbmQgcmVnYXJkcywNCkJpanUNCg0K
PiANCj4gPiArICAgICAgICAgICAgICAgc291bmQtZGFpID0gPCZzc2kwPjsNCj4gPiArICAgICAg
IH07DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmc3NpMCB7DQo+ID4gKyAgICAgICBwaW5jdHJsLTAg
PSA8JnNzaTBfcGlucz47DQo+ID4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0K
PiA+ICsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArDQo+ID4g
ICNpZiAoU1dfUlNQSV9DQU4pDQo+ID4gICZzcGkxIHsNCj4gPiAgICAgICAgIC9kZWxldGUtcHJv
cGVydHkvIHBpbmN0cmwtMDsNCj4gDQo+IFRoZSByZXN0IExHVE0uDQo+IA0KPiBHcntvZXRqZSxl
ZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0K
PiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1
dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
