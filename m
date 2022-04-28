Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8753E5136B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 16:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbiD1OX0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 10:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232636AbiD1OXY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 10:23:24 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2115.outbound.protection.outlook.com [40.107.114.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D51BC68;
        Thu, 28 Apr 2022 07:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mm4SiQbN4/ZlR1/rXVQVf/5wA9t4hCDLBNWuv9EwTr2zVE3OIydhBddsXfq7yuaXnIvnSeP6csGs8obnaA8VtFkUS3j8eToU8vV+voxx2Fgp8qWgKBvzDndz4tWNbctSy+o+U2UOjZEF33/XfXD5+qcrrWftXNh4Q7/0uDCmCg7xbWNoVEcRB1ptGq7CDV5tSOeWV+1doUQJnaTIkjnDVu2B8wTp3/ACo/ESy53y7fZmswzeNKI6RSDzsADJfa74zGqg6bz5gx0tPy+7l35Af7Cm3FVo4CwV6EaiwET9IW4mMYxLBbcbGQUmrTEUHGZcUjhUp+IFtf5289KKf8Ke/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdEyrVM7Ztfixpw2GOnLceMjPUwBZ3w/VMDtXSZDRSo=;
 b=QkyNSNxfoMJn1lEn+qSGaomzeoXFeQowoy5G3YRuRemRSldWAw2+tTEyRN+wEaZLiCqHS6HV5KMnHVSj0xhhMp83cw36ASYkab0ymbn2D4LWGuZ8mC/U5BS7q4bTU662u/pwon23pqzIvR8awsJW1/j5mZ6zhRpTq+FXO/kKK56ST3Y1T5ysXMd2dP1u5jzGQqB0PEI5PrUjjtQVHkKrDPeu3QbAtiRu+tvN3wcovmAEal7VnTL+dLBIgeVnOXsn44JU2/Xu+SymOXfgx+aikgRzjdRnayXut1hD937cs9cXD2qWKgnTN8YOHnM7A/r7Jv3rXdrtkqmW2Dmkr7caqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdEyrVM7Ztfixpw2GOnLceMjPUwBZ3w/VMDtXSZDRSo=;
 b=WYhsV/k5zsDgAe1bWDBTD2C8uRJJ5I6eh/kY5EYkGvrGofjZqVmlFwoWX/tiduDtEhNUWPM/nLrBuLzQh0O67KUMi76FJjLeyC+UsxVlC9UITuBLK7SRzEaAeCrSRkwISr5atRuofFDgyM4ftzyJdaiqZQ7V8/MGqn+8aV7FyNE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB3817.jpnprd01.prod.outlook.com (2603:1096:404:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 14:20:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 14:20:05 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 09/13] arm64: dts: renesas: rzg2ul-smarc: Enable Audio
Thread-Topic: [PATCH 09/13] arm64: dts: renesas: rzg2ul-smarc: Enable Audio
Thread-Index: AQHYWMbEJx4Z7EShA0iGXNx3/+Coma0FXVgAgAAFv9A=
Date:   Thu, 28 Apr 2022 14:20:05 +0000
Message-ID: <OS0PR01MB5922483412D55DCA92D4951986FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
 <20220425170530.200921-10-biju.das.jz@bp.renesas.com>
 <CAMuHMdWKw9fEEN-DpmMbQGwrHEx2s5d2yPTDUtKyB5rvtur48Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWKw9fEEN-DpmMbQGwrHEx2s5d2yPTDUtKyB5rvtur48Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afd26bda-b916-407f-ba81-08da29223152
x-ms-traffictypediagnostic: TY2PR01MB3817:EE_
x-microsoft-antispam-prvs: <TY2PR01MB38177E6005F56A0063DEB88286FD9@TY2PR01MB3817.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SavTrabREmRKkpoyMKlBw+Dv/zU3Nsst5dPT95tNhJtX20rPrP667EXdTTMb1b1SGzFUeF2CDnj7orAyHFC/VEeYwSvoTYlMzCRxdvnlFWM6OeMXfZ4T5Q8Er2QfwKRXcMkxOUZIjFmyib4CwLGOF2fW6Zshu0a4FomiVm/8tYeSTtJScgjf+rWqrZjoUtsoiCUAgQ+oEibK/PElmifgJ1klVpYmo+dvP6cZEB+GLrx/KLOOEpCGTNkw91HX7ajr2YAdmcauPWh3W8B8zzqfUwTYQ9A0MqsNy87WIT2YRAL5ucY0mFcNIcsw1P1fK+BlObvtYHo4V5czD4l3Mq7/bPZ9IN2Ps7b6DXtrSgfBhPowCi0vfTWeOeFqO54AbQv7KK0rp3pfMt7Gst/7+WJQZQvM7J0DJ3ItAfTRa34eLwkCkbAFly4RrTtbKxoXitkPaZaI+lIKlWyGxu16eAiII6vU/duFhrNITYcD6+mzp6njWaq9y/2NAeOuD2D072eo3WHzcfMKykNhcwm2oCm2pbmuRJBTGRbYZUFKEbXq04w4DJjCZc2K9RwKhJpTwD2V1jG0lhHmbjOEO6FNmOWjxCps9mmWW6/O6BCADzckfSZD68CWryW2PHmvoLkaXRa69/WSX7dyx3kR3O9tpmAU0DrXdaZmbhM4hSEllQIrOTX8suZ/5jN0uZj348JEum0Rn4+uOV8ENIXrS3x0AAjNfA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(53546011)(86362001)(83380400001)(38100700002)(38070700005)(186003)(6506007)(5660300002)(52536014)(8936002)(2906002)(55016003)(33656002)(122000001)(6916009)(7696005)(26005)(66446008)(66476007)(54906003)(4326008)(64756008)(66946007)(76116006)(9686003)(8676002)(66556008)(316002)(107886003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXdGYTBTOFFieXFpb0U3c0htdTYyTVRuRU5CcVkwVDZrb0wxeS9WdXlQNTNE?=
 =?utf-8?B?dStIcTJrbDVHYWNLNjlaaXZYRE5NbnF6SkVnQTFsZjZVakJXV0Y2bkZhLytC?=
 =?utf-8?B?a1FTTUZBd2hjQlYzSExEUFVkcFBIVDZtSGZQTml4bjJUUXdFYnpNYVdlWE5j?=
 =?utf-8?B?VXBSaXBjM3NXSWFpVHptc2U3ZHBmcEtNNEZCRnhxU2FTUDgrYk15VDI3Y0ZZ?=
 =?utf-8?B?bVhlMW1ua05RcnFlczNuNm81TmlGZ0RySjdCT1RmYmUwbEZMTVRzNWp6V2RG?=
 =?utf-8?B?SisxQWYvbTJoOUxRZzdaL0o5SnMrdHQrZjhla3M0UUlsR21KUndyVXFJbnRW?=
 =?utf-8?B?TXpoSW9WL29PQmdqTzVRUDRUaVpkVmRlSzYweEtYYzFmRS9QQTNGVGc3bndF?=
 =?utf-8?B?cHIwSXJLWDEzemVFREpYY0NPQTVDaGUwVFZBRDI2Mi8rSGJmNTkrcjVxc2ZU?=
 =?utf-8?B?S1FiaDcxVUkvK2kyOG5KRXhKNzhnQmR5WDV4RFhGZ1VRMUdjTktqd01WY3M4?=
 =?utf-8?B?eVRta0pDd01VWFpKMis5TnlqVDV2K1BlWG9QNzNnN3RRWE1oMzdNNmNHTmFl?=
 =?utf-8?B?dXkxbjAvdi9WdFRjN1VrVWFLZ20vWmtKOTFzM1MycmlNU2MrSjZrNlFBeitJ?=
 =?utf-8?B?R3gyU0xWTmw2bkFiUE9BcGc2c0YzT2NWZSt4VzBsSm5qRlJwY1JDSU1BcFJu?=
 =?utf-8?B?Umt3UXI0dC9maHFTQ2RGLys4MVdrei9XOUdHSGVqWlVNSGJOZFduOUZsTy92?=
 =?utf-8?B?WnlMd25BVGVKY3Jlb3J4MXRsOUd2Vk42b3ZlbWZZd3RrZkpsWFllL3l5c09S?=
 =?utf-8?B?cDNPdFUreEwrTDhDcmJnV0JWT1VncW9DTFQvVXk4dWUxbTd4U2djT0crcXZy?=
 =?utf-8?B?bEthclRpMVBUVFBBUHRWT2pHTlo2YWZsVk9HSGFkUlU3TUNmY2ZLSTBlVExI?=
 =?utf-8?B?b1VTRUw0UE1WVGFpb08rTVBld0lEcnJONlJzWlRTME1RY0h5SVV4dFFMNEVT?=
 =?utf-8?B?ZXozYll5ZEFrajJiN2orMFJaZDVlV3RROUJVVFhXdGdqbURMWEtyZGhPRjNT?=
 =?utf-8?B?cTZzRGdPQVJjeXZJQ0huK2RnWDhnOUZZZkZKaGIrN1ZlUC9zbXNTRHc2N2ln?=
 =?utf-8?B?NXNVTmh1S3g2K2IrbFMzVmJEUnBOS0pCNlJIUjJFMmY0M01ramlWN1lORG1k?=
 =?utf-8?B?RXY3MUhYSnh6UGlUVmI1TG4zVUYvNTB4VE1nU0xpc3Jsam50NGxMNUhVSjBE?=
 =?utf-8?B?d240QndEaS8rTFlvbzBtWUQrbWhDbXRBOUtxNFNySXowaGhSRk5jR2V2SzJk?=
 =?utf-8?B?NVhhVTZNY0c3QnpldUt1eGEzVXJmdFFkOGEzZGZtUi8zcG5GaERRb2pERTVS?=
 =?utf-8?B?UmFKSW1OSU9xaVhSL3dqaUc3cWpLT29pUytQSUdyOEJCQnFkNFNaVkNZUklv?=
 =?utf-8?B?TkEyeWFJKzZOVzVpQzg1bE1VcmdWSVlpOXB1cFZETnBjRGNtbVIybFlEcFNk?=
 =?utf-8?B?L2paQnRHNVdudnl6M29LWjJyOWNrOEFQMGw3TENaQ0oxdnl0ZlcwZFZYYmNs?=
 =?utf-8?B?eFZrYlpFMU9hclRSVVZDUFJ0bFlmaEV3bmFyUU9oV1JlaUt2LzM4c1BDUzNG?=
 =?utf-8?B?bEZCbTBSV240c09JUUdGUU1Od0NYWGlTSnBWejNRdFdBWlhRQUZ4YXBPUWlY?=
 =?utf-8?B?bEpmS2FKdVNXdVduYkNsald4Qkd1U2V5bWNyM000aVp3KzNTU0VuenRQMnFT?=
 =?utf-8?B?b21QWnRmdm1yWmNBVEhkeS9Za3J1bEtkNGliU2pVMXJEZmhQam1GaUZrUUhI?=
 =?utf-8?B?aElmUEZ5MDZYTEd6RXNOMGNjSUFPaGNIamhGV1JKZkFYZW9LUHdGVmNLenFz?=
 =?utf-8?B?akFUZHdSbUg4NUV3RmR0dCtPS3NQZXBPeGZGdUNqSzU3c3hrRGZTSTFUQjZN?=
 =?utf-8?B?K0dZQXVwN01vQ01INlhrMDlRc24yVW0vVTVjc2J6dkN1Uk1HdVlNVjl4dEVz?=
 =?utf-8?B?VFZrOFZNa0p2czBaTjlxd0R6anRkWVA0OXRDRXhRUXhwekZ5Y1JzQVNwS0x6?=
 =?utf-8?B?b2hHTUZvLzljbTQ2V0JkeWMvc3lEZjV0SEZlY3ViWmcvRGxBWnFQSUpSamIz?=
 =?utf-8?B?c1dBVUg5VGFjWGkxWmMxL3l6d2RISFBiVTVLcjRLamx0dkwyT1dJQzAwTW44?=
 =?utf-8?B?MS9LQ3BWVFpsZk9HTGdPM1V6YnRWSW45Nk1GazhzMWIrSjZpbDFQWDduSzBM?=
 =?utf-8?B?c1d1VXBBUkJIZWF0WFl3TkEvdDZRQXJLeWk0aFNWNzcvUXJkSm5LWWRFb0lW?=
 =?utf-8?B?V0dvbmxTdTNXWGtUaHE3dEZQZHVRNStmbFRraE5kcjcxVGhuclRPWXJwVlgv?=
 =?utf-8?Q?lzNVtLetArVtdEfg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd26bda-b916-407f-ba81-08da29223152
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 14:20:05.9009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xm+Vf01reZZhv40a7MqX7XQGjHahGr6+o6WdLPuVvYuF1kbBrF3KgTaUMLPp/xYvJPzujFdAVfCUNxkA6LlMItAitJTycQJpSJc46QrgTzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3817
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEFwcmlsIDIwMjIgMTQ6NTQNCj4gVG86IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxp
bmFyby5vcmc+OyBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
PjsgTWFnbnVzIERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IExpbnV4LQ0KPiBSZW5lc2Fz
IDxsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3Q6T1BFTiBGSVJN
V0FSRSBBTkQNCj4gRkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTIDxkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZz47IENocmlzDQo+IFBhdGVyc29uIDxDaHJpcy5QYXRlcnNvbjJAcmVuZXNh
cy5jb20+OyBCaWp1IERhcw0KPiA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+OyBQcmFiaGFrYXIg
TWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LQ0KPiBsYWQucmpAYnAucmVuZXNhcy5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDkvMTNdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJ1
bC1zbWFyYzogRW5hYmxlIEF1ZGlvDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBBcHIg
MjUsIDIwMjIgYXQgNzowNiBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IHdyb3RlOg0KPiA+IEVuYWJsZSBBdWRpbyBvbiBSWi9HMkxDIFNNQVJDIEVWSyBieSBhZGRp
bmcgc3NpMSBwaW5jb250cm9sIGVudHJpZXMgdG8NCj4gPiB0aGUgc29jLXBpbmN0cmwgZHRzaSBh
bmQgc3NpMSBhbmQgY3B1X2RhaSBub2RlcyB0byB0aGUgYm9hcmQgZHRzaS4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBS
ZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMnVsLXNtYXJjLmR0c2kNCj4gPiArKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMnVsLXNtYXJjLmR0c2kNCj4gPiBAQCAtMjcs
NiArMjcsMzEgQEAgd204OTc4OiBjb2RlY0AxYSB7DQo+ID4gICAgICAgICB9Ow0KPiA+ICB9Ow0K
PiA+DQo+ID4gKyNpZiAoU1dfRVQwX0VOX04pDQo+ID4gKyZzbmRfcnpnMmwgew0KPiA+ICsgICAg
ICAgY3B1X2RhaTogc2ltcGxlLWF1ZGlvLWNhcmQsY3B1IHsNCj4gDQo+IFlvdSBjYW4ganVzdCBy
ZWZlciB0byAmY3B1X2RhaSBpbnN0ZWFkPw0KDQpPSywgd2lsbCBmaXggdGhpcy4NCg0KQ2hlZXJz
LA0KQmlqdQ0KPiANCj4gPiArICAgICAgICAgICAgICAgc291bmQtZGFpID0gPCZzc2kxPjsNCj4g
PiArICAgICAgIH07DQo+ID4gK307DQo+IA0KPiBUaGUgcmVzdCBMR1RNLCBzbw0KPiBSZXZpZXdl
ZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+
IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQN
Cj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
