Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF6263ECF4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 10:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiLAJzM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Dec 2022 04:55:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLAJzL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 04:55:11 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22DE89ACE;
        Thu,  1 Dec 2022 01:55:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBHBedbPFukUGXD1Z78KcIH5JDPfPiTU22dag1O4wAt7KCtNPp5zH3+U6rJ/iIMbPyVlMOsgABEpSk+n3Kz0yB0IGbsH3SwW+nxqjZKsF5Mjjgn0t3HO/7zX+MI/kWR03/nKaF4ciB0BWl1mYlGawfBpOVF+s7CdtNDQDYXbg4E5ngjGZDv4neuGPr2p9V2+MTmlY3/3zmxvKBUsd6++mRmKj9s+JDCaFgwBM8uiM3aLrpE/IvabBP8wavp507I6Gg5tGrJSsqx1V+B3Iq671kffUvPovRpefxJWMT5Ox+KIlfP2FipCod7y0/xJYF7e+ZMAAxUuyAr4EFx3QfBx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9vq3Q/vSb5/Q8+m2JnPlTxECyaeU/FAD1A5t8WC12g=;
 b=ZLisBlDaOx1KojJBBf9gLbVNx5ShMlaoJ7t85MAZObbNtkgq2xerNKOrhYnM6Ym0J69BiiclPqJxaryJb2ETqepjYTN+erwZw/H6b5gbGM93iCBSBM/MuGfnCBJAwOJ4k8jWsEJeRDWVv4VWoIbAsxTvaGKeK/vIZF9p2CdDhjHevyb/ko5BNJ71VSfwLlKQBc6iUtyi0wIUrU0BAIcHpmieTa3J5Wk6uzWoiEpWQ5p0Gzz3jrpeNqu5waCRBUx/FY5VG51qH+fqj2h4bSwCpd/jFUTpxMy1l4wtoK/ZuSYF48h5sDZP4pPOIMU2zBLgcMTdR+o64yRm1KS9NODNkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9vq3Q/vSb5/Q8+m2JnPlTxECyaeU/FAD1A5t8WC12g=;
 b=kFrqrPkY3cFCcoBrBKvZ65b+J3vtPwCJthXo4KmahObzJDf+68nMcLivkJsO4klj6b1hTQALart+F44CPkBVUFoLf5tWqOsejv0rQhFKCfOgsTEVHfaDkOF+O8Vqp9s0JSno4s2nzhHz8YFl+WaiYUcz79/splwxafaCpuqUTww=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8020.jpnprd01.prod.outlook.com (2603:1096:604:1be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 09:55:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 09:55:06 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
 carrier board
Thread-Topic: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
 carrier board
Thread-Index: AQHY/qRdHnnq9f6Pjk2Z6VVJLbhAZ65LVS6AgAAAlfCAAAWZAIANbl+AgAAAwQCAAAdKAIAAAoBggAADXgCAAACT0A==
Date:   Thu, 1 Dec 2022 09:55:06 +0000
Message-ID: <OS0PR01MB59226504C57B772A0DA0B8BF86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221122185802.1853648-1-biju.das.jz@bp.renesas.com>
 <Y30j7Q6Jc/y8mGTu@pendragon.ideasonboard.com>
 <OS0PR01MB59224A76B83B9A2318A8D4E9860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y30pHOylptuMxFgX@pendragon.ideasonboard.com>
 <CAMuHMdUjibk0FO0+Su5NbV-pgBhiYqVsjX6XM5Sg2nXyybA3YQ@mail.gmail.com>
 <OS0PR01MB59227AF03E84568B443C053286149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXL1pN6mhpYctsS+Kc8HUe=HCTn3yTxgmujOMNyxGBm8w@mail.gmail.com>
 <OS0PR01MB59225B4A413B6977B67CF97F86149@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVRnnoLqGD_X+6BsUwWn7TNVmKU+b=P_p1=czTkvCP0Gw@mail.gmail.com>
In-Reply-To: <CAMuHMdVRnnoLqGD_X+6BsUwWn7TNVmKU+b=P_p1=czTkvCP0Gw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8020:EE_
x-ms-office365-filtering-correlation-id: 0ce7e93a-f8d4-4d30-9507-08dad3822064
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iNDyY8siJqrVZrWgvVBMzQZrQBhogbIZpLmLzArKDqcTT8MxlK1ZW9vnnQiBXyja5eXrfyi+e/EylYwbnP1Hb83wBzj7kqR/VPb3V/oO0IE1k2/6j/8vqki5kQ6jyTaRSLyfuRNmDNJD18R/7kqLlU6xNvGg+PLuZikTXNsKIs/8JMVSiz4/f6F9639bYlDmHgHx29IVBLLhM8zGLA80i3/GcZbZ6F4ShCmDn/gVmvzM3W8UlD1uVN5lCFf9Gd/3rbR3QmjMOiLOKW89AgOgVmR974u227yj6cJy+gW3dnkLjLw7OhxXrmbeJzN3vgYHXIl1VnisuWL925VH+95M+vS+bfW9cZp0igD9LLG+hUlj8Y7oCknTx0XT0vF6nVi3TeQgpXtZ0iFnXiViv3zfWNi9WKTdE3mOj98r5W318e4f3ZoH1lkBhe0cfjkoq1cIPVlGaV+ayfqq8FKQuNTab9YvP0H+Qg3MEOTgdDpJZNEXbe/T94TLkoxtnLpzRtIYsq40ApfzsbQ6LC+kWlETlKfdU+TBvrfkunHP250+eGmm62UDNWXtX4+CZ+0ehskEEpylYf52YfJhRhEvHSepzBfjZuwzYfu0eDz2JyK7NtgcL0G6JTc5WLld44faMc1g/ptl1ZHlYLPG7ohrCJA7EFLsycQjWNUvyROFqEfCOCI9IbQbS+ok6mKfSG/O1fjQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(38100700002)(86362001)(478600001)(41300700001)(38070700005)(76116006)(2906002)(8936002)(55016003)(66476007)(5660300002)(26005)(7696005)(4326008)(6506007)(53546011)(186003)(9686003)(71200400001)(54906003)(8676002)(6916009)(66946007)(66556008)(316002)(66446008)(64756008)(52536014)(122000001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cG1tcFJ5bUFmQS9wR2lqbGthWVJHMXRrdVRTMFBqNVhyYmh6VEcxMWRhZHJF?=
 =?utf-8?B?THVnS3JvS0JZRExBQ3dQVGx1S0doekZnWEFTdDdQQWFkSEUxUTFvaFZwaE1l?=
 =?utf-8?B?UHFWTzRSZTAwTmw3MkovakJmU1dxRmd4ekxpOTdtY2pBbWsrcWhjS0U1L0ZK?=
 =?utf-8?B?a3MxMzdreWVWK05XRXZLaEl0RDNUME9aSTc1ZGtwc1JJSE82RVpZNTI2clNL?=
 =?utf-8?B?L0o0UUZHMUJkU3Y3Q004UVhMQ3pyUEJwU1V4UzI1VFcybW5WTTNzcER0V205?=
 =?utf-8?B?cG43Z3NBblJ3dFI3WUYwVkpsTVlzbmVjSUlKUHc5TGEveUFDanJDdVJsKzV6?=
 =?utf-8?B?NlBzaXdlZEprTThJcDBQSHJJRWQwOVloMXhOTHlDOStZYjJSWUducWZxZzEv?=
 =?utf-8?B?OWpja1ZEOGRSYXpsdXJtaWl6RlRqekltWVd3UVZTaUR0SXhrcE9sZmxHOXE2?=
 =?utf-8?B?SUJWNW5Vc0xmeWtkWmw2N2JQQXpabDdYcGZDaGNKM00zTmk3Mk9lck02ejNp?=
 =?utf-8?B?ZGJkWkJ4V01qZUtYMHBKMGlhcjRBYUc3MUVMd0NkV2Z3SXZyb0RmV25JVFJH?=
 =?utf-8?B?aW5hb3BVQkJXeE5QSEx2R2RRYzViTlQxejNuNmxhWDBJTDZUYWU1em1ydTZH?=
 =?utf-8?B?RkpVMXpiTzBaSnlHWXlGanVGUGpWVWgyajlvSVhGRXR5RkJic05EWlFnUzR1?=
 =?utf-8?B?WTE4eXVuemVoYVBDZTllWHY2VEpMelBJSkFielRGeEQ0R1o2Vlg2NUU1YS9a?=
 =?utf-8?B?c0VSamxqb0JnKzNLTk0wVlh6WHA4R2JwS2ZHZzRCZkpkL1E4VHZLWFlRVkdv?=
 =?utf-8?B?NVhZSEZuZ2NJNjN3VmtmS3FCTWtvRUhpYmlMQ2dVd0ZQSHFwU3VpSWxveUc1?=
 =?utf-8?B?SXBBTHR4cWVwbGhXUlNZS24wVTMyOVJ4aHAwc1RWU1JOU1lGbWdxeThkVFN2?=
 =?utf-8?B?aDZIVFhDanV2YWdCZXJnUk90bEljOVE3bEY4eitLa0N0cFlTNmREREdWYU82?=
 =?utf-8?B?WXRyMFVLeXA0OWRUOGVKZ2tGNVJmZkl4emRlRUVQaDEzbGdQLytjZWZycFhx?=
 =?utf-8?B?ZEVDc2lXVjRyUXdhRGs5eSt0VDBkMC9rUTc4em80U01iYkY3cVJtYmxIVlBn?=
 =?utf-8?B?Y2xVYlVHYTR6U3RwOWhxOG5VT0RodU04VU9PY3N2M3dMVlhXMHFBTnc5THJJ?=
 =?utf-8?B?OEQvUEQ5U3VwWGtKd09DVjYyTk5XVnNXOEl1a2NxdzNyb0w3TXpCNzlxcjR2?=
 =?utf-8?B?bklXZDRaTDl1Szh4bEtEWTI5dnppKzZzcE8vUWZwamVLckhzUi9aZzhDQXI1?=
 =?utf-8?B?eGwyOWhMVjhaNlVISFlJR2dHZEZvVGhsTDBGNmcwdE5kK1VCQXdNTG5FWTQy?=
 =?utf-8?B?ZmdwamVTbm9QVkRmWEFtWU83aG5zR1lWU3A2V0FBT1M4ZTFZam1JREU5cUVk?=
 =?utf-8?B?Y3ZoL2JzT1d6NGlta2tIOEZmN0Z4UW10U0haOWJFTTJlNk8rd3BHajJTaEFv?=
 =?utf-8?B?OEJjdTZGNlEvZVlpTEZsdVpFb0htbFZyS3hzVTg5cTJvOUIwbzBzVUl5QzNH?=
 =?utf-8?B?MVRpZ0pKbVdvOHJqcEQwWVM5Wlg0NE1BdmJPcENSUVlaVUF6OWFYTldkbzFE?=
 =?utf-8?B?eXJGVFZTUlV5Zm91a2hWZEhaU2Z5RTVIakc0UlpyMnBXRXZIUXNnR24zSXJt?=
 =?utf-8?B?YmZWL01NeFRnNzdSMzBPdms2RGtJZEJpRk5SaERMenNqbFRYeThrVHFRZzRG?=
 =?utf-8?B?bWVBbmc1VEtlSVVlZ0k4cklEbHpZdlltdmdDS281d212WmJWcFczQStOMzJn?=
 =?utf-8?B?NmpmbFZNcmY5ZUcwcGJMdldsRlgrVy9jZUJZa21KcjRrcHRkVng3UlgvY2ZZ?=
 =?utf-8?B?N3dIbFBLMDlGNWllQzBjSjI2eUtGVnhLUGI4b3hCWlpVYzF5Y24xQkpzbXNF?=
 =?utf-8?B?N3dyWHlkRTU4QXpRM3hWaVYxZHN0SXlIREVGK25MYmt2UHRHSG50RTdLWHNx?=
 =?utf-8?B?amRIMTBHUHpCT3ZWZ1BRSGFxVkRUOGx4UkQreTFBT3E2L0ZXNnJ6TDVNMnNK?=
 =?utf-8?B?ZzBCWVgxZ3hLZmtGSnBRemhMZFF4QnlCNERLQmVqakcrdFRsN2JiRWovNnR3?=
 =?utf-8?B?VzRLUFdCenJySW5xOUMwN2NoU1VtTGJlTkN4RUpuRzZKYWJlWVgrbnJzaTFX?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce7e93a-f8d4-4d30-9507-08dad3822064
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 09:55:06.8392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kgOM2aYULzN8enIfEvcoyy6tcFZyUn78twZLKUES8grPACSOczrPOLT/6/WjZAcx/Ur2iX4FS6BSoA2N5k/8dGNNwl8eU3Hv3VkTbzeibj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8020
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gYXJtNjQ6IGR0czogcmVuZXNhczog
cnpnMmwtc21hcmM6IEVuYWJsZSBBRFY3NTM1IG9uDQo+IGNhcnJpZXIgYm9hcmQNCj4gDQo+IEhp
IEJpanUsDQo+IA0KPiBPbiBUaHUsIERlYyAxLCAyMDIyIGF0IDEwOjQ1IEFNIEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTog
W1BBVENIXSBhcm02NDogZHRzOiByZW5lc2FzOiByemcybC1zbWFyYzogRW5hYmxlDQo+ID4gPiBB
RFY3NTM1IG9uIGNhcnJpZXIgYm9hcmQgT24gVGh1LCBEZWMgMSwgMjAyMiBhdCAxMDoyMCBBTSBC
aWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6
DQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gYXJtNjQ6IGR0czogcmVuZXNhczogcnpn
Mmwtc21hcmM6IEVuYWJsZQ0KPiA+ID4gPiA+IEFEVjc1MzUgb24gY2FycmllciBib2FyZCBPbiBU
dWUsIE5vdiAyMiwgMjAyMiBhdCA4OjU1IFBNIExhdXJlbnQNCj4gPiA+ID4gPiBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+IE9u
IFR1ZSwgTm92IDIyLCAyMDIyIGF0IDA3OjQxOjEzUE0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0K
PiA+ID4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6
IHJ6ZzJsLXNtYXJjOg0KPiA+ID4gPiA+ID4gPiA+IEVuYWJsZQ0KPiA+ID4gPiA+ID4gPiA+IEFE
Vjc1MzUgb24gY2FycmllciBib2FyZCBPbiBUdWUsIE5vdiAyMiwgMjAyMiBhdA0KPiA+ID4gPiA+
ID4gPiA+IDA2OjU4OjAyUE0NCj4gPiA+ID4gPiA+ID4gPiArMDAwMCwgQmlqdSBEYXMgd3JvdGU6
DQo+ID4gPiA+ID4gPiA+ID4gPiBFbmFibGUgQURWNzUzNSAoTUlQSSBEU0kgUmVjZWl2ZXIgd2l0
aCBIRE1JIFRyYW5zbWl0dGVyKQ0KPiA+ID4gPiA+ID4gPiA+ID4gb24gUlovRzJMIFNNQVJDIEVW
Sy4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zbWFyYy5k
dHNpDQo+ID4gPiA+ID4gPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cnpnMmwtc21hcmMuZHRzaQ0KPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgICAgICBwb3J0cyB7DQo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gSG93IGFib3V0IHBvcnRAMCA/IFRoYXQncyB0aGUgRFNJ
IGlucHV0LCBJIGV4cGVjdCBpdA0KPiA+ID4gPiA+ID4gPiA+IHNob3VsZCBiZSBjb25uZWN0ZWQg
dG8gdGhlIERTSSBlbmNvZGVyIG91dHB1dC4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
WWVzLCBJIHdpbGwgZW5hYmxlIERTSSBub2RlIGFuZCBsaW5rIHdpdGggcG9ydEAwLiAgU2luY2UN
Cj4gPiA+ID4gPiA+ID4gYm90aCBSWi9HMkwgYW5kIFJaL1YyTCB1c2VzIHNhbWUgQ2FycmllciBi
b2FyZCwgSSBuZWVkIHRvDQo+ID4gPiA+ID4gPiA+IHNlbmQgYmluZGluZyBwYXRjaCBmb3INCj4g
PiA+ID4gPiBSWi9WMkwuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IGR0cyBQYXRjaGVz
IGZvciBlbmFibGluZyBEU0kgZm9yIFJaL0cyTCByZWFkeS4gQnV0IFYyTCB0aGVyZQ0KPiA+ID4g
PiA+ID4gPiBpcw0KPiA+ID4gPiA+IGRlcGVuZGVuY3kgb24gYmluZGluZ3MuDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBUaGF0J3MganVzdCBhIG1hdHRlciBvZiBkYXlzLCByaWdodD8NCj4gPiA+ID4N
Cj4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBJZiB5b3UgcHJlZmVyIGJvdGggcG9y
dHMgdG9nZXRoZXIsIHRoZW4gSSBjYW4gZGVmZXIgdGhpcw0KPiBsYXRlci4NCj4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiBJdCBjb3VsZCBiZSBlYXNpZXIgdG8gcmV2aWV3IChub3QgdG8gbWVudGlv
biB0ZXN0aW5nKS4gSSdsbA0KPiA+ID4gPiA+ID4gbGV0IEdlZXJ0IGRlY2lkZS4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IElzIHRoZXJlIGFueSBhZHZhbnRhZ2UgaW4gYXBwbHlpbmcgdGhpcyBwYXRj
aCBub3csIGkuZS4gZG9lcyBpdA0KPiA+ID4gPiA+IGVuYWJsZSBhbnkgd29ya2luZyBmdW5jdGlv
bmFsaXR5Pw0KPiA+ID4gPg0KPiA+ID4gPiBDdXJyZW50bHkgYWxsIGRpc3BsYXkvZ3JhcGhpY3Mg
ZnVuY3Rpb25hbGl0eSB0ZXN0ZWQgd2l0aCBbM10NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIGFkdmFu
dGFnZSBpcywNCj4gPiA+ID4NCj4gPiA+ID4gMSkgSSB3b3VsZCBsaWtlIHRvIGJhY2twb3J0IGdy
YXBoaWNzIGFuZCBkaXNwbGF5IGZ1bmN0aW9uYWxpdHkgdG8NCj4gPiA+ID4gY2lwDQo+ID4gPiBr
ZXJuZWwgWzJdDQo+ID4gPiA+ICAgIGFzIG1vc3Qgb2Ygb3VyIGN1c3RvbWVycyBhcmUgdXNpbmcg
dGhpcyBrZXJuZWwuDQo+ID4gPiA+DQo+ID4gPiA+IDIpIHdlIGNhbiB0ZXN0IEFEViBkcml2ZXIg
dXNpbmcgaTJjIHJlYWQvd3JpdGUgY29tbWFuZA0KPiA+ID4gPg0KPiA+ID4gPiAzKSBXZSBjYW4g
dGVzdCBBRFYgaW50ZXJydXB0cw0KPiA+ID4gPg0KPiA+ID4gPiA0KSBUaGlzIHdpbGwgcmVkdWNl
IGludGVncmF0aW9uIGVmZm9ydCBhcyB3ZSBjYW4gdGVzdCBmdWxsIGRpc3BsYXkNCj4gPiA+ID4g
YW5kDQo+ID4gPiBncmFwaGljcw0KPiA+ID4gPiAgIGZ1bmN0aW9uYWxpdHkgd2l0aCBbM10NCj4g
PiA+ID4NCj4gPiA+ID4gWzJdDQo+ID4gPiA+DQo+ID4gPiA+IFBsZWFzZSBzaGFyZSB5b3VyIHZp
ZXdzLg0KPiA+ID4NCj4gPiA+IEFuZCBhbGwgb2YgdGhhdCBpcyB3b3JraW5nIHdpdGhvdXQgcG9y
dEAwPw0KPiA+DQo+ID4gV2l0aG91dCBwb3J0QDAsIHdlIGNhbiBvbmx5IHRlc3QgcmVhZC93cml0
ZSBmcm9tIEFEViA3NTM1IGRldmljZSB1c2luZw0KPiBpMmMgY29tbWFuZHMuDQo+IA0KPiBXaGlj
aCB5b3UgY2FuIGRvIHdpdGhvdXQgdGhpcyBwYXRjaCwgdG9vLCByaWdodD8NCg0KWWVzLCB0aGF0
IGlzIGNvcnJlY3QuDQoNCj4gDQo+ID4gRm9yIGZ1bGwgZGlzcGxheSBmdW5jdGlvbmFsaXR5Lg0K
PiA+DQo+ID4gMSkgd2UgbmVlZCBwb3J0QDAgZm9yIGxpbmtpbmcgdG8gZHNpDQo+ID4NCj4gPiBh
bmQNCj4gPg0KPiA+IDIpIFdlIG5lZWQgdG8gbGluayBkc2kgd2l0aCBkdS4NCj4gDQo+IFRoZW4g
cGxlYXNlIGNvbWJpbmUgdGhpcyB3aXRoIHRoZSBkc2kuDQoNCk9LIHdpbGwgY29tYmluZSB3aXRo
IERTSSBhbmQgd2lsbCBzZW5kIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0K
