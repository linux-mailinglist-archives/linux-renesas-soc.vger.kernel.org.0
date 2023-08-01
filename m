Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D2676A96A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 08:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjHAGoe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Aug 2023 02:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjHAGod (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Aug 2023 02:44:33 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E45BDB;
        Mon, 31 Jul 2023 23:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1FDf+ysZMzk6IdN7Y0jfWf+J6trsMTcJg7ydejnEr6kBcvJFDeUQv7Zs63wRiveE1P/glY/FsvTAlfeklv8qE+esi1bLWm65qTh7Du7gBSug7HLKxyDhcaFQWDXPvzSSpfRRUe+64ylbdSHj60iR0fqIogdJFrhFXUscp0Hgwy1VVOD4Dp6xUC2CqR4lFdM4XlVwfM9ewth0zsMbp7k/WbnCZqHnnHOeVm2syNefxpuGkJRJZSRHmDnLs+uJJYC7UbK1CIBksaHg/jnbfh6fMIXTvXIYilNKV1Sd5bkLc6QLTgFwbsJaWQ58gyIkrCBzBRmxaXstD2FalJQDBNWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfE/hfBXdSgWIBq2CjMQp1dnH+xrC7qKIzF9n67QOnE=;
 b=RLrCj5ljAV09Q4ZTkud15uSENqnuo6eGVofB0YDTgv+sBAyhKqY29TC+A1kks76GzcF45iUcljLUIkF0SWiPO0Jlx/IHWJANFinG1lv1BvY8Zhqx/sRul9tFmTFQLYbUjv6t3q+PJdRS+FkL+ZfKJCx5akaLNSzu9+jaxCIWlU1H1zLN+66ZgLDpurSAPVqCDnNS4ntrlTJpUeVRMG91NeLdzNe35Odc0N7dyoMhXBo6Gg7hSM8FB3+6ij37ZJcECUIU0S23/A/nzg4PCMncdlywF1g7XYfvRT/nSjrypN7vC8sX+408aJAt25jF4u2TCI5lw1RJtqQZPlR4M0wJBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfE/hfBXdSgWIBq2CjMQp1dnH+xrC7qKIzF9n67QOnE=;
 b=cSGml4HBKxM7SW/1S7HwPPivIYuE1JsEFWYx2FfoYEguJKKtQ+HZ/4+r3AImIxflRf6TY7KhlppFmR35oWgZ80juJZM4FEyaoNgfJWqWB5NkipyC7nNpY+o4RJE4NL35gPehS6v+aGrrRnRXpmmzFCnW+fOm9IG7cs6ayKaLSaw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8672.jpnprd01.prod.outlook.com (2603:1096:604:185::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 06:44:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 06:44:28 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 2/2] drivers: clk: Add support for versa3 clock driver
Thread-Topic: [PATCH v6 2/2] drivers: clk: Add support for versa3 clock driver
Thread-Index: AQHZr2OSjaWjE9ag0kChn/ripxu2D6/NgHyAgAem5lA=
Date:   Tue, 1 Aug 2023 06:44:28 +0000
Message-ID: <OS0PR01MB5922F5739833FC26F46A988B860AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230705171000.85786-1-biju.das.jz@bp.renesas.com>
 <20230705171000.85786-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUHD+bEco=WYTYWsTAyRt3dTQQt4Xpaejss0Y2ZpLCMNg@mail.gmail.com>
In-Reply-To: <CAMuHMdUHD+bEco=WYTYWsTAyRt3dTQQt4Xpaejss0Y2ZpLCMNg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8672:EE_
x-ms-office365-filtering-correlation-id: 578eb690-cfa3-485b-0ac1-08db925ac0f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o0lpEiIKapkMFPDEGkDXvDDrUNvNVtOM1Xb2C0YeNfowQF/2DUkOfJuejEEsY6ekg070siGjCykSwQgrckYJnBBqpezb7Hs0YPjmCoCwS0TSwC8yGVxFw2YyiVlld/JjjMhHW9bBqkAcRlUvY1Wd+OH4X63OTEfDvmumW8mbT6AmCgKM/YLDDNuLtA1OrIo0PXirKuNig0ZnShnD2SyIJbgzSmS6t9eHY0zwNLSm8lDmbhk0BWlAPsKly/i2PqvZuiZy50JmiJ0xM0Ma0gAZeUAHze4ZU43NOomyHv9tP73o1Fq5cnUoduyM9slpbX1lfrbV0woqejsAohaYEtXXT1KMEI1vDGf2MfecdD9jVpHa2B1VO3nOdUOVxv17Ft52Lqmla9pWJjkFSTbZrk9q7xFlbBMqH8fQrpIRdBMLwl5xBGORN44ZgR51WdmhHw9k9+AY0foqFSztewRyjwR4TRvQzvxVT/tq6I9255YG0DdF9TAkuCJF3SJHSX6dWVJhHBsBdV7gM9vGSA3M/FeCZWNEh5MednDgGQ6Ozm9wIAO+6MlhtQwelUbuHr0Ljz7Alp0NADPN/PftGxbQxWvGklc9Ic0jpmeNRLuGTIXhXJc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199021)(52536014)(54906003)(122000001)(966005)(9686003)(26005)(33656002)(6506007)(7696005)(8676002)(8936002)(5660300002)(55016003)(66946007)(66476007)(76116006)(64756008)(66556008)(71200400001)(66446008)(53546011)(4326008)(107886003)(6916009)(2906002)(83380400001)(38070700005)(478600001)(41300700001)(86362001)(186003)(38100700002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NG5sRk03eVh0Q3hpTG84cG4vUGkzZUg0R2FOaDRFOWhtQkpVbzNxVVc3Z2sy?=
 =?utf-8?B?NGcwK1Q3OXluR0QyV1BhVG4xdUpkcjNsYmJXTUYwTUlVci9ndVFhOUJEVnV0?=
 =?utf-8?B?cXlRelk0TjZ1cm10elBMU1pjeDI0YkZ0U0c5b3I0S0ZSamw0NjlLd3ZlVEpB?=
 =?utf-8?B?VUhKdTV2NzJIQkdhcHRDTGU3bHV0dDBQTTBsNXNxelUwWXlkSVNzNHFTMGdh?=
 =?utf-8?B?QU9KWWdCc2U0bGVJdXFCRjBZazY3YmJCRjQ5THQvY1dGYyttanZhVGFqNU01?=
 =?utf-8?B?Yko2Kytodkw0RWZQd2haNlgrR3lvNWNRRG5hUGhOaTRHcWtuM1VMMldoRTBz?=
 =?utf-8?B?L1RTTDV0YUhJUmM5L1NJKzQrNndoMDBpUEVlWFVoNVhIL1BTVHZuVjIyanpu?=
 =?utf-8?B?K2FpNU1GMlJVZm1sNlNIMFd4Um1qakN3TWE2M01LMFkrdzFuSFhVV1hBMlkv?=
 =?utf-8?B?N05mNFdCTWRxejN3amZpZW51amhvUmdJVjBBNXUwSzVSaWVMNDMyVFZaK2ky?=
 =?utf-8?B?UjRSbDJ3TmVTSzBCK0hSQXI5dGt5MGRGN1dKS3k4RzFnbi9SZndlYVhxZXlj?=
 =?utf-8?B?SGltM2RVK2IwZk1FTEViU0xuMXJBOTI4NklWQzJwNWZ5cXBQM2tLTnI1Y3V5?=
 =?utf-8?B?RU1OazRWT29yTmNHcGFONEptUkhXOTg1VTlTTjNxRW0yS21JZStlaDNBU3py?=
 =?utf-8?B?K2FjbWI4S2VxWWxiazJwbG4zcXhWamgySW52TUlHbWtTVW1EM3JpWnd2Q2Zl?=
 =?utf-8?B?NTRJZXg1bDFVUzR0Q2VOekZkTjFRQ3RBVTF6d0o2U3g3TmhhMmVGSlp4dlRB?=
 =?utf-8?B?VmoxenlFbUIwZ2NmcUFOeFA2dEVJaGpVS3JnTzR1VlVIME1oSlhCRWt2K1Nq?=
 =?utf-8?B?NXp5L2pxckV4NWVjakx1QTFWZCtPaDRGTm8vZWdYMGFCUmswdjh5ZTVTL3Ri?=
 =?utf-8?B?TkNJaWgyZDdJeFJoVkNIakNPT0E2dkI4UjFJdHpENVJJc1ZHcTZ1YjlWVG1X?=
 =?utf-8?B?Ti9IWkNKN1dFMXNIUG9XS3pKOHNVYTFqRXo3UW9NMkFsTkNwcXNsemx5SUNC?=
 =?utf-8?B?RlByTXlvS3ZMNkNhOEVWNFVOS1FBYlBRQTZHRWxweEh4UXJncGpKR1FBM2xV?=
 =?utf-8?B?aGVLdmxKbDBEUEtoVEVTQk9vUUhnYkI5cnVOeXZMNmRUL1JOVzZMSmdHS2s2?=
 =?utf-8?B?a3JKK0R5NXRYN2RKbVJKTExvR1VPNDFsaFg2VFNad3ZRUXExTzNuQXRkb2Rm?=
 =?utf-8?B?ODhPNUZhcXRmSTI3N3RGa1hFYXJneFVRS3VsRmhDeGg2OVZLZ3lVUlZUcW5j?=
 =?utf-8?B?SldDNTRNQ0JzNDJwZ0MxaGgwYU1iWS9SM1c0WE9nMERndjJsUkJwNW9RSGgr?=
 =?utf-8?B?K2NSZ3pvd0c3UysxSUhYTmxrR0RSN2o3NzcvMStqUXJlRFBlcmpkM0VjM25j?=
 =?utf-8?B?NjNCbWcrVHluSmtrVldha2ZubURPVlRLQUJXeUhjYWZIVkp3R0FIR0V2MDlT?=
 =?utf-8?B?dG5FVm5Wa0REZVhSbC9IVjlNODMzWXBnMHhLTXBjbHd2bUFUY0VTRjhJOC9I?=
 =?utf-8?B?Z1llVjVTM0tsdCtYZFZwdjdSM01NanorOWtKRC9NU3cvbGlaMjBJb1BDOWJL?=
 =?utf-8?B?OTNyT0RQYUhDMzdxUjF2bjF1ZitrWTlwT2ZVdlNkNEVObjFLUWhaQnBuWUl1?=
 =?utf-8?B?T3QzZ08rZ3N1dWREaWE2a3Nib3VGaGRFV1grOEdKQmlrZVFTdW9VRG8xL2FJ?=
 =?utf-8?B?RTVwZnk3Q2VWdS9QZ29uZkhuRkIzRU5TaFpiaXlDcVN6RUhVQTZzNG9kVGda?=
 =?utf-8?B?UmphWlExT2FHZVVFNEx1UVpmSzQ4UVJNL3lqTmdocGo5dmhJSmtjREJzUDlJ?=
 =?utf-8?B?TkNjekpoT0R6K0RtQ3FZeVFmaURodGJYdzYxMVVEV25ONGtleFljcVZRR2h2?=
 =?utf-8?B?aVMyRVNEVjhBNnNoV0RIcGswLzQ3c1BxMEVXeDdEUVVNMUE1OFFOSXM5ZnVz?=
 =?utf-8?B?WVJRcHAxSjJOVlhRbHdMVlFFajFGeFFUZUhPR3JNdms5TUlmN2t2azlsWk1l?=
 =?utf-8?B?VVhGdS8vdlNidTh2c09VbTZuS2dOUnhvbU9aOFMvRm5Uc21vcGJFZ0djRUEr?=
 =?utf-8?Q?tz8xu2+3J9mBn0TTvTxfNTH4I?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 578eb690-cfa3-485b-0ac1-08db925ac0f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 06:44:28.4778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tTzqWCJiL638A5hml7r88RpXiLV7rceIGllbVlrS70x4EAiBsReQbkjdNcYOaFkrw3YpYUlka94O6sZCAM29TrUY7OWU2I2RZkJKrOYnS6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8672
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjYgMi8yXSBkcml2ZXJzOiBjbGs6IEFkZCBzdXBwb3J0IGZvciB2ZXJzYTMgY2xvY2sN
Cj4gZHJpdmVyDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBKdWwgNSwgMjAyMyBhdCA3
OjEw4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToN
Cj4gPiBBZGQgc3VwcG9ydCBmb3IgUmVuZXNhcyB2ZXJzYTMgY2xvY2sgZHJpdmVyKDVwMzUwMjMp
Lg0KPiA+IFRoZSBjbG9jayBnZW5lcmF0b3IgcHJvdmlkZXMgNiBvdXRwdXQgY2xvY2tzLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IDZlOWFm
ZjU1NWRiN2I2ODEgKCJjbGs6IEFkZA0KPiBzdXBwb3J0IGZvciB2ZXJzYTMgY2xvY2sgZHJpdmVy
IikgaW4gY2xrL2Nsay1uZXh0Lg0KPiANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJp
dmVycy9jbGsvY2xrLXZlcnNhY2xvY2szLmMNCj4gDQo+ID4gK2VudW0gdmMzX2NsayB7DQo+ID4g
KyAgICAgICBWQzNfRElGRjIsDQo+ID4gKyAgICAgICBWQzNfRElGRjEsDQo+ID4gKyAgICAgICBW
QzNfU0UzLA0KPiA+ICsgICAgICAgVkMzX1NFMiwNCj4gPiArICAgICAgIFZDM19TRTEsDQo+ID4g
KyAgICAgICBWQzNfUkVGLA0KPiA+ICt9Ow0KPiANCj4gVGhlIGJpbmRpbmdzIGRvIG5vdCBtZW50
aW9uIHRoZSBtYXBwaW5nIGZyb20gY2xvY2sgaW5kaWNlcyB0byBhY3R1YWwNCj4gb3V0cHV0cy4g
IEFjY29yZGluZyB0byBUYWJsZSAzLiAoIk91dHB1dCBTb3VyY2UiKSBpbiB0aGUgNVAzNTAyMw0K
PiBkYXRhc2hlZXQsIEkgd291bGQgZXhwZWN0IHRoZSBtYXBwaW5nIHRvIGJlIDA9UkVGLCAxPVNF
MSwgMj1TRTIsIDM9U0UzLA0KPiA0PURJRkYxLCA1PURJRkYyLiAgQnV0IHRoZSBhYm92ZSB1c2Vz
IHRoZSBvcmRlciBpbiB0aGUgQmxvY2sgRGlhZ3JhbSwNCj4gd2hpY2ggaXMgdGhlIGludmVyc2Uu
Li4NCg0KSSBkaWRuJ3QgZ2l2ZSBtdWNoIGF0dGVudGlvbiB0byB0aGUgbWFwcGluZy4gWWVzLCBh
cyB5b3Ugc2F5IG1hcHBpbmcgc2hvdWxkDQpiZSBiYXNlZCBvbiBUYWJsZSAzLiAoIk91dHB1dCBT
b3VyY2UiKSBpbiB0aGUgNVAzNTAyMw0KZGF0YXNoZWV0IGFuZCB0aGUgdG9vbCBvdXRwdXRbMV0g
YXJlIGFsc28gaW4gbGluZSB3aXRoIHRoaXMgdGFibGUuDQoNCkkgd2lsbCBzZW5kIGZvbGxvdyB1
cCBiaW5kaW5nL2RyaXZlciBwYXRjaGVzIHRvIGNvcnJlY3QgdGhlIHNhbWUuDQoNClsxXQ0KaHR0
cHM6Ly9pMi5wYXN0ZS5waWNzL2EyNTNjZTdjZGM4NzIwYzNiNWViNjk1M2I5N2IyNWZmLnBuZw0K
DQpDaGVlcnMsDQpCaWp1DQoNCg0K
