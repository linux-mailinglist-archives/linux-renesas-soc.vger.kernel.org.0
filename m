Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E55679164D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Sep 2023 13:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241340AbjIDLlZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Sep 2023 07:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjIDLlZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Sep 2023 07:41:25 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE461AB
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Sep 2023 04:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kl2zUIiC9J/BK4k78+D33+y2DInA+C8KszaRoLpieew268LuVcSQaFPQdn5U9KjZ+aDFPFHKKBbyo6gUBxP6oMkDJnfVI25zv0rD9H7OCAN0lnh9R7jaaylQ+ei24Uzwt6t3JgHIO/dgg2e5gQZW/F1UW0kTjXr2QS9s3tAaVZ006NB+5qGsq83bPVdm62BiBZqnkjy4dnk1PYsdkLHWbpFTn+NULMlhcc6KFYkEdNxU6bOnxuX+/CQNgSTFHN5/lmI3Zk5c0hlUFHfbZFfrAEhsAMSXE4nl5x0I3DQzP2kDPL+iaXs2wKhUpft3yxPIPEbnjbxrhIPwP0hgG7EIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61FsVYqqJ88oR9JVfJ81gy03V4McJlgLHMNYfk/ZmYs=;
 b=CWwuRIKkJf3BQ1OVg9UjziNFv3FCoYTwyRmLEO7dUdTSQnykWu6R+DDhrB6bdcq6fmPMtXcEinzJl0FS5f+j88rK5p/BKPhJ1WqCoCwIiQFxloAfbJa1WcpGT+vDLs6rTzaTKG7MGLpUIw2yFiWBqlnWbRxJxWb48I87kGm/OIch0qIXX3EpgaHYxjQST3wgl+2K1y6EXlyMWf082yjcldQysWUgsSKEyGsE7VGOC6P0L56O30je+T5zB+UpLKY8c64CxCpheVlqwCKFSs45k4haP6oCtli4pyUnsFWhuNDC8VyTFBTR6R/vqpO8y+hJrDCMycxrJ0f5e0CmZ4ciXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61FsVYqqJ88oR9JVfJ81gy03V4McJlgLHMNYfk/ZmYs=;
 b=TwzpYrbDEtOneQkbZtgHBT350qFG8u7bYZK9DAqPU8vsJ1+X9lnMQ6/4ooCSLPfcQufoziv9cPXG1X10qk4SdCR4RHF9BG5ldMj8mMAEsZ/tPksANhExP/gRh0njgHmIfDtKzlgONUcMOJlHXWKyb0Xp3ftpyEITNrJ8/oeg29o=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB9276.jpnprd01.prod.outlook.com
 (2603:1096:400:1a0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 11:41:18 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 11:41:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] arm64: dts: renesas: r8a779f0: Add PCIe Host and
 Endpoint nodes
Thread-Topic: [PATCH v3 1/2] arm64: dts: renesas: r8a779f0: Add PCIe Host and
 Endpoint nodes
Thread-Index: AQHZ3NgRJLfrN1WbPU6Hfb60Yu62DrAKX2kAgAAu4VA=
Date:   Mon, 4 Sep 2023 11:41:18 +0000
Message-ID: <TYBPR01MB53416FCF058FF9CA98CE442CD8E9A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230901132730.2861451-1-yoshihiro.shimoda.uh@renesas.com>
 <20230901132730.2861451-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXsx3zN1UhF4twJGyaj+LDunV+c=FkCTQ7nhoqtLdeLGg@mail.gmail.com>
In-Reply-To: <CAMuHMdXsx3zN1UhF4twJGyaj+LDunV+c=FkCTQ7nhoqtLdeLGg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB9276:EE_
x-ms-office365-filtering-correlation-id: 3b34404a-32fc-4b0c-4a1a-08dbad3bdaa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qp/Z08cs7/Mowma9xeYTkjrhBcYeJ7E9qa0diLiyXtn86uR1mWgHCjkSCu2IU45sZ53O7uygVl/SPdalA0bwKTwmdZenksdBRUXOWsUmgKgaH6au+UCc7x6DoN9W7s9ezyz/sAlZbyDGh5FbNOV+DJ++eEpBdTu0Y0I3gvuPrPqVDfY94+0bcppgXB86oUlhpUgIC5yg5+98WBlDrHrBM4XklGolpAQlgHaWdr4KN9H4/3VZShzFAVk0RkZ3zgIZSkts3vkUhKCxF6KLeDIBJFJNunSLM/rYkPW/MLuE9D6n3dTviO+5v2u+4EH5NTw3IVgNLMZYObK/+aDSuF04GdPqYi4rPn+dUqZ9X+ZJVTUMPE2aQka6pbPU0FhVdOYEDYncncZfb5q5ETB4UTJ4AJYIXr6QFURPpjwVXf1pZaPlzKF6PVH+UhjrEJmE9w6nnm3nXxPEvCBRpV+0sDx9Pb4T0m913wnfGYyc6HIsmkvT+Ti9s8CQtVOsGrtju5R9WKbji7FZC4f6+OWjhD7xwHFvgQwsOMPUjc5gQh++D0Lt8xTpXamOT/B1ZCAA5KsNevqCYJ+EXshLISfGdweTltaD/ChiUXYDIevnvDdmKqw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39860400002)(136003)(346002)(186009)(1800799009)(451199024)(41300700001)(38100700002)(38070700005)(71200400001)(7696005)(53546011)(6506007)(478600001)(966005)(122000001)(45080400002)(83380400001)(9686003)(55016003)(76116006)(54906003)(66946007)(2906002)(66556008)(6916009)(64756008)(66476007)(66446008)(316002)(33656002)(86362001)(5660300002)(52536014)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjZLZnlGU1ZBZDhLSUpvckM4bnlSUUN2dGxRbG50OWtMSFRMemdkOWdkR082?=
 =?utf-8?B?L1cvcG9kMUtiS0lwenRjazJ2OU15OGdsR3FZUW5EaTJkQ0dkRU5keHhJU3Bp?=
 =?utf-8?B?VndtWXJ0K2NpSmIrc1FwYTlGQ3poaEI3VmZYbGIwaGJUN2dobndsVWdXQzRQ?=
 =?utf-8?B?M3dWdGpzUUlOZzJ0RTQ1VHVuTDA3SEh4eVB1ZWZaTkErbytNQWtTY0dNRVZB?=
 =?utf-8?B?citqOE9RZjgzSUFqNUhucXVPbG9JTU1veDRSTVpadVlwWjVxMDlEVXJIc3Rl?=
 =?utf-8?B?dWtVTkdFV2RzaVVib3FuTXN5a3hDKzB1Ui9VOG1NUGJwd2ZYSmZRVmxxTzFn?=
 =?utf-8?B?eWdkTWptTTQwb2JQeVM5K3hHcWxuWEJwNmhKbGNOUUEwVHhRREorNE9LSXR2?=
 =?utf-8?B?UzhCOGRSVGV3a0tMNS9lY2FPbnJSdHc1OUFnZTJ6ckF4alRjSVhzN29jZStR?=
 =?utf-8?B?dG1Ea3NRZzMxTHNLeVhjRnh3cS9FLzU3L3d0VkVMemZ1V2ZBVXJKc2FET1hU?=
 =?utf-8?B?OVRGUGxnbk5tbjFEYWJNQXFNY0pCRmJ2aXJWTm9ocDBtWU4wQ1g3UGo1ODk2?=
 =?utf-8?B?NjgxYXU3OTl0bitrc2dxMTlJUnhLMkNvdXJmWFlBVUxHK0NLbHdZeCtRRyt4?=
 =?utf-8?B?WFdZTU9IdW1USysvWnpEN2NSbDdoaTJFQng2aE84dk5VUUNBOWpUeDhveVVR?=
 =?utf-8?B?UkxuQ0RadFBNMzV5MlJVRUZqNDA4MXc0WnZzdnVnb3ZIU3lyNXFGdTNCaG5Z?=
 =?utf-8?B?T1YyeHBubG1TSkpqeUVOZzZHdGgxemxrclJiSDhQNWJaKzBEakJJUjQzR05a?=
 =?utf-8?B?U0NKM0hub1Z3c2xCc1c4SlBBMWhXd2JWVEs0dk1BTDYwMjFVdEVNVy9KMDRF?=
 =?utf-8?B?YW83bExOcnF5cU10Nkh6K1pwNXptZHlHdmZJblZGZ2dNemFhYzVmVkw4MUpZ?=
 =?utf-8?B?K3J3VWIzR0JuYUxNRUIyanFNN09RUG4yU3JEbG5va3Jpc2w4VzBoRjJEeXJ4?=
 =?utf-8?B?UUpIQmxqdFRiTldhTnVHZ0ZtZXQ3eTRWQ21JQmw3Wkp3Tmhlc043T0dvakU5?=
 =?utf-8?B?bzNTUEptRVhTdFVVWEJBOTMwMHY3YnBzeFc5dnpWS2c0cmZVR3RMaFNjMk9a?=
 =?utf-8?B?WnJWQWtsamVUQ0swU2hwWTVsVW1vdkx3S1M1YnhFUWpGL0dmV2V1Y3dwMExS?=
 =?utf-8?B?bFk5L2hYLzBic3dyTmlNbWhKaURXbnF2SCtsY3FVNmJqRUdzV2gzejh1dTVu?=
 =?utf-8?B?cGhLeHJRSTYrSW0zK2haOHZ0c3ZaS05WR2YrZzVOK1hhNldramd5QnE2cnBP?=
 =?utf-8?B?MEpYajl5eDJKWEtxdnRob0FRK2IrT3Y3NmlPbkFxS21yMzJmNTNodHNnb3Qy?=
 =?utf-8?B?ZEZNTXVnTHhZeHNqNml4QTc5anZkWnJzZnp5WEFHNGhoYm44V0g4bW13RUpv?=
 =?utf-8?B?bTJVcFQ0TjNPazhLczdqM0d6UkUyVjJ0ckRySE43b1VlN0RDYm9nY2ZBaVFK?=
 =?utf-8?B?Q3NDRlY0OVgxNmN6bWtUalM5dDVNVFBjTWRwaml0MUQ3WVVXam01YWRCNFhZ?=
 =?utf-8?B?L01JMUFvRVVWU1NXdzZVRDVFSnk5d1p6TjliRHhJTDhCWGVvQ25iT1Z4ZC9E?=
 =?utf-8?B?MWl5bzRZZEE5Vzd1aHY1bFozQVFBaVBFcEs4UEFSU1FialBUdjFkUis4aUR0?=
 =?utf-8?B?MUtBSDRFdjE1QmFqZ24rYVh0Q3FwTDdmQ1FRYmMzTFVFWVdKKzJvVGl2aVN2?=
 =?utf-8?B?bTVMeVdSaDdKajYxRkRMSnp2MkwyS0tadk5BNmVaZitKZlNEcXFreUFnRE9R?=
 =?utf-8?B?RmtSS1VMSHI3R3VwMnZrcklLU0VvU2ZRWEx6WXo2VTFpS0gxOXVOUGZYbUxl?=
 =?utf-8?B?NVZSQ2xDUFY1eUlhOWp2V1QxcFZDSi9wVGV5MHNsOHcvTEliRkhZcG1WTFhG?=
 =?utf-8?B?OGI2YWV5aGFXK29HZkNZOXN5YlBUYkZ6dE1PeE9TcmtTNFBXMTBBaUpQcWtm?=
 =?utf-8?B?eGNTTTVRZEd0bHNYRFhHKzlGNXlmMEFFQ2ljZzE3NklNZEJ6WDZObE9xK3Fz?=
 =?utf-8?B?THlpRjBLMVVPTUpHY0t1ZXNHbDZkZitsRy9MaFBEQWNRcmdaTTlTWHliOFNP?=
 =?utf-8?B?S0xKUnF1L2oyY0dDdEd1VjZYYnlYVEZ3cytObVpncXFNNzNaTXhja092RmNO?=
 =?utf-8?B?LzNNZWdXUVdqZWE4Q1RFTEdHVkpFbXE3S3RXclF4SGNScWZVMGJDUUw2eENy?=
 =?utf-8?B?SGhUZndVNTJkTWUycUduZEV4YnlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b34404a-32fc-4b0c-4a1a-08dbad3bdaa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 11:41:18.5547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFOCZKK2mzoCqeR66Yi/tVCl3t5qbQGqeFklMLOd+htlVTvuJjpNBgpZXkf1FyvMMMD51wVOzFdF8sRzv+15nngpZa8OK3Wc0OwwIfFu677jUDe2DBWBfBQbdNghX7dq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9276
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5
LCBTZXB0ZW1iZXIgNCwgMjAyMyA1OjQ4IFBNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+
IE9uIEZyaSwgU2VwIDEsIDIwMjMgYXQgMzoyN+KAr1BNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRkIFBDSWUgSG9z
dCBhbmQgRW5kcG9pbnQgbm9kZXMgZm9yIFItQ2FyIFM0LTggKFI4QTc3OUYwKS4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEBy
ZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCg0KVGhhbmsgeW91IGZv
ciB5b3VyIHJldmlldyENCg0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OGE3NzlmMC5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
OWYwLmR0c2kNCj4gPiBAQCAtNzExLDYgKzcyNSwxMjQgQEAgaHNjaWYzOiBzZXJpYWxAZTY2YTAw
MDAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+
ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgICAgICAgICAgcGNpZWMwOiBw
Y2llQGU2NWQwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
InJlbmVzYXMscjhhNzc5ZjAtcGNpZSIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJyZW5lc2FzLHJjYXItZ2VuNC1wY2llIjsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICByZWcgPSA8MCAweGU2NWQwMDAwIDAgMHgxMDAwPiwgPDAgMHhlNjVkMjAwMCAwIDB4
MDgwMD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDAgMHhlNjVkMzAwMCAw
IDB4MjAwMD4sIDwwIDB4ZTY1ZDUwMDAgMCAweDEyMDA+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDwwIDB4ZTY1ZDYyMDAgMCAweDExMDA+LCA8MCAweGU2NWQ3MDAwIDAgMHgw
NDAwPiwNCj4gDQo+IHMvMHgxMTAwLzB4MGUwMC8NCg0KT29wcy4gSSdsbCBmaXggaXQgb24gdjQu
DQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MCAweGZlMDAwMDAwIDAgMHg0
MDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZy1uYW1lcyA9ICJkYmkiLCAi
ZGJpMiIsICJhdHUiLCAiZG1hIiwgImFwcCIsICJwaHkiLCAiY29uZmlnIjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDE2IElSUV9UWVBFX0xFVkVM
X0hJR0g+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQ
SSA0MTcgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDxHSUNfU1BJIDQxOCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgNDIyIElSUV9UWVBFX0xF
VkVMX0hJR0g+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9
ICJtc2kiLCAiZG1hIiwgInNmdF9jZSIsICJhcHAiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgNjI0PiwgPCZwY2llMF9jbGtyZWY+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiLCAicmVmIjsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OUYwX1BE
X0FMV0FZU19PTj47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjcGcg
NjI0PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXNldC1uYW1lcyA9ICJwd3IiOw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG1heC1saW5rLXNwZWVkID0gPDQ+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIG51bS1sYW5lcyA9IDwyPjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBidXMt
cmFuZ2UgPSA8MHgwMCAweGZmPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2Vf
dHlwZSA9ICJwY2kiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJhbmdlcyA9IDwweDgy
MDAwMDAwIDAgMHgzMDAwMDAwMCAwIDB4MzAwMDAwMDAgMCAweDEwMDAwMDAwPjsNCj4gDQo+IFRo
ZSBiaW5kaW5nIGV4YW1wbGUgaGFzIG9uZSBleHRyYSBsaW5lLCBhbmQgdXNlcyAweDAyMDAwMDAw
IGluc3RlYWQNCj4gb2YgMHg4MjAwMDAwMC4NCj4gDQo+IFdoaWNoIG9uZSBpcyBjb3JyZWN0L2Nv
bXBsZXRlPw0KDQpUaGUgYmluZGluZyBleGFtcGxlIGlzIGNvcnJlY3QvY29tcGxldGUgYmVjYXVz
ZSBNYW5pdmFubmFuIGFza2VkIG1lIGFib3V0IHRoZSBmaXJzdCBhcmd1bWVudCBvbiB2MTMNCmFu
ZCBJIHJldmlzZWQgdGhlIGJpbmRpbmdzOg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1wY2kvVFlCUFIwMU1CNTM0MTREOTQzNUVGQTNDNTU0NkU0RDE5RDg2NzlAVFlCUFIwMU1CNTM0
MS5qcG5wcmQwMS5wcm9kLm91dGxvb2suY29tLw0KDQoNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBkbWEtcmFuZ2VzID0gPDB4NDIwMDAwMDAgMCAweDAwMDAwMDAwIDAgMHgwMDAwMDAwMCAx
IDB4MDAwMDAwMDA+Ow0KPiANCj4gTXkgY29tbWVudHMgYWJvdmUgYXBwbHkgdG8gdGhlIG90aGVy
IGNoYW5uZWwsIHRvby4NCg0KSSBnb3QgaXQuIEknbGwgZml4IHRoZW0gb24gdjQuDQoNCkJlc3Qg
cmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMNCg==
