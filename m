Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93EAF4EDB71
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 16:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbiCaOLo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 10:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237350AbiCaOLj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 10:11:39 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8100C18A3E7;
        Thu, 31 Mar 2022 07:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlzCBqA9atBdo96PM00zs+vHl5yWMerixNYF1AsED9ZnOtawvJRpk0UCTBdvgi9VHfvFMcgxGZeqErpEHhG5nDri/fCH64Aj2jS2BQpFJMhg+BlGDq5FpKmasE7cwp2fN940Ypbukd8Z4KWvVt0/96+zUmzvcwmob7hB4ES4WJlHKGvv/PtvdhoEu278YdoftTq+gSAY7xGAGlKz7HsgPqlU42Lo+kvmu9iHO6PVptEumWfJGUrzLdzPby+B2DNLyOaGo6XGo9ow3CqgSVVQE2TALFPSslQTile/NfjFi+ov6COw58RUvFfEW4YJMnXXRLoRNPX8/7n/3YCGDX1aRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHGQgRyweF9erKx3l/s6Qxh5677DdkrlZ6c4nwNyo5g=;
 b=WFdqZ5adlnfKLBAYuczofPb/qWn26LU9SVh6dbpIqRTyH+4mBviKH2t8zH24cXycxWDApaAyeBHyLd/wujvx7XVmHno3L1cknZoGGkLXNWNmli8RgVo5FgsDOehF0GNQLJIR7cFIMqmboVVcgbXOdCTrCBAssZK5xqMot91xtcrXG9rZdSRfkFDiS2uk/9n8KWoNp8yt8+t/2CTh52GrqoC5zmgX2PUBNvw3ozwZnIZpc0TOObkskwjpP27TDUYBqx+nJZMHAD/V4fRxyJA42ajRnjf1mYtVip/ELvcqkNZ3+zMkJW6x3tG9si/KO2Dl9rhi+Y2Jgaxn9G5MJOByjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHGQgRyweF9erKx3l/s6Qxh5677DdkrlZ6c4nwNyo5g=;
 b=OnltLYYX7R9ap/dcO37wQyWyEiuo7QVeO8WJP9XfUER7V1trsEbRbDRcXVhoGVspPIu7G3BzhFUs1UDyu6SUm6l/sz/tF5nhdKMrSOTaixchPnVTN0urtaw8+z7hb0mZ2pHZtMLgc67hfRviWaD/wXCY/xCKaiBbescj8605AVA=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYAPR01MB5119.jpnprd01.prod.outlook.com (2603:1096:404:11f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.18; Thu, 31 Mar
 2022 14:09:48 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::2c9d:7128:8d19:7a24%8]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 14:09:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on
 carrier board
Thread-Topic: [PATCH v2] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on
 carrier board
Thread-Index: AQHYPSt80/B8c9hobEW9AGFlcZJkkKzZkXiAgAADMYCAAAKLwA==
Date:   Thu, 31 Mar 2022 14:09:48 +0000
Message-ID: <TYCPR01MB59335D82B8A70CE5AAAFA7B786E19@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220321135629.16876-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXyMd3Haqbg3wh3o3jty6aqzZ+f_-59tvwyEOzP=6cuew@mail.gmail.com>
 <TYCPR01MB593313B46713822594C0887086E19@TYCPR01MB5933.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB593313B46713822594C0887086E19@TYCPR01MB5933.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cba8fc7-a6db-4605-5795-08da13201d7d
x-ms-traffictypediagnostic: TYAPR01MB5119:EE_
x-microsoft-antispam-prvs: <TYAPR01MB51191C6AD63179CD4A19F5FE86E19@TYAPR01MB5119.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 51hX67A7QOqGKDVxWzMZ/tSkpJ39aH7czUyC7HT+kF9GfBtmLAlnUwva46Bc/E02toHtaXtvDq8tU7W9q4hqHKsq1rCZNdeYIZo73nkYPKE78Km3Wh6k8TrkmDcduP+kcoz6lTjj9kZv382EoKUM5z5hLx2Bud17AZEwSdErsdZJzmkOAVEuZSJPJ4GvGhg+ne3j1vtpBaQYA6+GpQ8o0bnf7nDlPsZEkgVvoBZmdGefL+tXgzMsMX/DHce3pM8q7CA3YzJ0lNkAzGN25drataP+OsT3z+CXwsIR69FYQcoHUETmfGxPzCxRwhydVvgwJ6zNeiaKNzHXaagKUb2T2FQr+7tFBNRQROhmSOIzXfXc/M/l3su1ATjOCR6oBAs3C1S/1LvXUtMM3vADE0U9q3h4wXOOgmlfH/eMzEmmG8BCV4jtPHSDsrAHK9gXWqm2t4GatQKUBhWrdm4DYhwZ5aD5tik4VZey47gLhgSaEA5A1fXO8UoUBHhRQm4A8UKtPbr+uJmOPAzCdNmIft5zewPrhRW05SDrS3oLxt1lXZBw87gcVdRvy/33yRkFD+bYOeNuKFTL9AZNnNP7M49DDfDwhHGSzZLL2USSjJKho/qLvZLi0ZRl+tKfhEmz8nslztwYR4/bZV1/E2oL50UWU4OM/HqjX4zbH8qBhYcxe7g27BeT0NlshKUo+RZl/kKWu4/YX2pXQ5RsU3rsz9sSxg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(55016003)(83380400001)(6506007)(8936002)(71200400001)(122000001)(107886003)(186003)(508600001)(26005)(52536014)(54906003)(9686003)(66556008)(64756008)(66446008)(110136005)(53546011)(2906002)(38100700002)(316002)(66476007)(76116006)(4326008)(66946007)(33656002)(8676002)(2940100002)(7696005)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGhGZmhCNWlKSENNSEN5d3RVQ2p6Skh1azZRTWdOUUg5SlZFZ1dKeHF4eWky?=
 =?utf-8?B?eE5GTEI0TkJDazM1L0RReDZVblE4a2ZLNTNqQnJzLytvdnhESmg3aXVJNzZU?=
 =?utf-8?B?SldRcnBlSTQ3TmhwQlVrbHkyN1BnTXJmWHZicHFVN21XSDF4THhwY0JWWFU5?=
 =?utf-8?B?WFNrR1RCMzV2MGZpNitId1Axb0d6UW05d01sYWVKMVcvTmRsQWVibmxLZUdD?=
 =?utf-8?B?NXozS0g1TXA2WXhiUkZmRTJaRU5BZHVUR1VOMFhZeERORCs1VHg1MllvY0E1?=
 =?utf-8?B?OGJJNFZBMTZ4bW55OTgvN2xESlY5eE5icVcwSXdWbENEQnIwM3FDNThXTDZY?=
 =?utf-8?B?cmh6YW84b0lncGpRR0JXSUNGWjY3aU5GNlF1UGNCVUlQVS9PcnhIWS9HQzBq?=
 =?utf-8?B?TTZhZFpwWlNWZXU5TkxkNHRoNnVnTktTK2xpZDIySjlDeE5EaVdnMjFvb1J4?=
 =?utf-8?B?MVBKRUtUdlF6TldXUnJVQlk5emVuZXgzQXNiZ2RBTTVyWDJjbFcxbEM5bHVS?=
 =?utf-8?B?Uy9zU0p6eVZCVEV3cDBnQTArQXlQbE8xeXFiZ1ljQThTeVlqdnZ3ZnFqWC90?=
 =?utf-8?B?UmsvUUdNRjRDcFBEVnpYSHluR0VMY0hlL1ZHZmxOdDhqT1J4TTdqSDNSTmdE?=
 =?utf-8?B?ZVpXa0VJYUh6SzZoT1l6RitoalJ1V1ZjUWtoOXlDV3ZoKzJNcFIwRzlwbUto?=
 =?utf-8?B?T3ArVGcxdm85Q2ZIK0huZGlJZXBybTlNMVlIWTBlbUUrN0lKWjd6SThLZm54?=
 =?utf-8?B?eU9hazFERUM2WUNXN255blJsQllNUnpGd01kREhMN2ZmYnk3MUVKYS9kV0NF?=
 =?utf-8?B?anBaTytUa2h1Qm9zR1F0VktDM0pNc2ZqeWFyQ0xVMGpmc1NLU1dKN000djk2?=
 =?utf-8?B?QzZ5VTg0cldDT0kyQkZFNWNRVnMyVjhRem52eEF5eUlFWHI2azk1MytPTDhh?=
 =?utf-8?B?YllyU0ExUm50cDlqUHFyRndHdmJDd0NsejROVTJiUFNraE9GRmNCT3ovcm9V?=
 =?utf-8?B?SFdWVXBPa0xJak04VmRxQTkvalNvRTFtZkxJOXZOTmF4NXNMS3RCY1I1N1h0?=
 =?utf-8?B?WmhNMnVlNjY0NmFZRlhTb0hzaWowaStPRFMxNlhXUHZyQnBST0xBdEdhVmRS?=
 =?utf-8?B?U2pqaHNRby95ZkRiOHA4bjFtRGo5RllOSDRYcHpqRW4vYVRtVHlseDhBdmFw?=
 =?utf-8?B?L0NzNzROblJVTUVnR2E5UTRQbkgvOFZYQUl0TSsyUm9TaVE5aXFQWFBndy9v?=
 =?utf-8?B?d0FPcTFUVUJEMTdiYTdMZThtN2dQVUFBVlZnMm9VM0VRS052K2p4V1gxdWVm?=
 =?utf-8?B?eG1pNVBxZjAwUGsxTS9DVlgxemg5ejNlVU5xMjZ0WGhPY295MnNDZXQ3OTJM?=
 =?utf-8?B?RU1vWG5QREk2Qk42RzBEazZsc3ZNcmFRRWZpTVRGZFhYOVBFY0hDOGVvQTFG?=
 =?utf-8?B?Sm5qd281SXVBSE83NG1sT1p0ci90RXRpRDM1dThrRWpyamFseCtoMWV5QXg3?=
 =?utf-8?B?b1ZqMEVrMEhYWkZuZWpUeHZwMlIrUVBndjdzMVoyemtNZnJlNnJWekFhc3l4?=
 =?utf-8?B?OUhJRmlmZU5yWmFvRExZZEpFczZhZFZlNlRkTDJYbmFUUEdGUGpnYURUZWox?=
 =?utf-8?B?WURqYXE1aHBpcGZ6UWZWdHFrYWNBNit5ZDVVYVZTWENMY055T1FsQzEvRnRV?=
 =?utf-8?B?eG5sVHh5dHZLMUNlR3FlclFTbXNteElrcFdPWG1tMVR0dk8vZDluNTBTT1FE?=
 =?utf-8?B?L3BDZ2NyV0J0Zmg0QVN3T3REamxaMU5UbXVWTlJ5OWJSYUEzaHNaSkVHVUJB?=
 =?utf-8?B?UEhWaWdnSFRDa1IvQ0w0a2lReHFDMUUvTDhMTkhURGd3R0RnL3ZybEJMVU8r?=
 =?utf-8?B?Sm8zYVk4bE1Bd2JCYjZ3enpkTGQ2dVdnUUFLYVg2MGJlMyt1Ri9TQzRFbDNT?=
 =?utf-8?B?NHdBc3RHSDlseHVVUHRTM0tZSUlNYXpkeWpDOFByUHJKMmN1N29sWnk4Tnl3?=
 =?utf-8?B?cHc5a1YwMmRjQXB5QmlxYmpmNG42VFVGT2QzL2dGWkk1ZnUzT1lYTXNoRkRu?=
 =?utf-8?B?aUUwbmZpam9rSm1NK2x3ZzlDN3c1WmU5RW9NVzJhdFlZSFp0V0xxWS85RUY0?=
 =?utf-8?B?Tkx3WkV4eldpVittb3l4UGhIVWV6MVovdWJnWGFDUzg2Y1h5SlI2dklTRVJZ?=
 =?utf-8?B?ZUowOHVwc2xqVUQvMVZOM2s1amVmQTR4ZzhHUVpoTjFyNW51bWpxK050WmJY?=
 =?utf-8?B?cEZpZjNTbDB4Vk8zeGovL1BTMHB5bVJhaWMrc3BvV2dSc0RWQi9TdUpJVDhG?=
 =?utf-8?B?aitDeVQ3eGorSGE2bVdJNlh3NjJmcmtSWllwVWZTVDZMcHhLejF3M2ZmMmlw?=
 =?utf-8?Q?UNvwe0PVlvRerx8o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cba8fc7-a6db-4605-5795-08da13201d7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 14:09:48.0356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bj9SKjFDDLRLfXHwMsXtUdMzZ1F8RKn/tQn8JXevLqsaV9JauNso43MwjGNJP98P7TgWOLjkiH2Qewwd671THg3MIJ57Bdy6gbolKnGb5SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5119
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2Ml0gYXJtNjQ6IGR0czogcmVuZXNh
czogcnpnMmxjLXNtYXJjOiBFbmFibGUgUlNQSTEgb24NCj4gY2FycmllciBib2FyZA0KPiANCj4g
SGkgR2VlcnQsDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gDQo+ID4gU3ViamVj
dDogUmU6IFtQQVRDSCB2Ml0gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMmxjLXNtYXJjOiBFbmFi
bGUNCj4gPiBSU1BJMSBvbiBjYXJyaWVyIGJvYXJkDQo+ID4NCj4gPiBIaSBCaWp1LA0KPiA+DQo+
ID4gT24gTW9uLCBNYXIgMjEsIDIwMjIgYXQgMjo1NiBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPiBSU1BJMSAoU1BJMSkgaW50ZXJmYWNl
IGlzIGF2YWlsYWJsZSBvbiBQTU9EMCBjb25uZWN0b3IgKEoxKSBvbiB0aGUNCj4gPiA+IGNhcnJp
ZXIgYm9hcmQuICBUaGlzIHBhdGNoIGFkZHMgcGlubXV4IGFuZCBzcGkxIG5vZGVzIHRvIHRoZSBj
YXJyaWVyDQo+ID4gPiBib2FyZCBkdHNpIGZpbGUgYW5kIGRyb3BzIGRlbGV0aW5nIHBpbmN0bCog
cHJvcGVydGllcyBmcm9tIERUUyBmaWxlLg0KPiA+ID4NCj4gPiA+IFJTUEkxIGludGVyZmFjZSBp
cyB0ZXN0ZWQgYnkgc2V0dGluZyB0aGUgbWFjcm8gU1dfUlNQSV9DQU4gdG8gMC4NCj4gPiA+DQo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFk
LnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiB2MS0+djI6DQo+ID4gPiAgKiBT
b3J0ZWQgdGhlIG5vZGUgYWxwaGFiZXRpY2FsbHkNCj4gPiA+ICAqIERlbGV0ZS9kaXNhYmxlIHBp
bmN0cmwvc3BpIG5vZGUsIHdoZW4gU1dfUlNQSV9DQU4gbWFjcm8gaXMgc2V0IHRvDQo+IDEuDQo+
ID4gPiAgICBUaGlzIGNoYW5nZSBpcyBkb25lIGluIGNvbW1vbiBmaWxlLCBzbyB0aGF0IGJvdGgg
c2luZ2xlIGNvcmUgYW5kDQo+ID4gPiAgICBkdWFsIGNvcmUgUlovRzJMQyBTTUFSQyBFVksgY2Fu
IHJldXNlIHRoZSBzYW1lLg0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiA+DQo+
ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmxjLXNtYXJjLmR0c2kN
Cj4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRz
aQ0KPiA+ID4gQEAgLTE1OCwzICsxNTgsMTcgQEANCj4gPiA+ICAgICAgICAgc3RhdHVzID0gIm9r
YXkiOw0KPiA+ID4gIH07DQo+ID4gPiAgI2VuZGlmDQo+ID4gPiArDQo+ID4gPiArI2lmICghU1df
UlNQSV9DQU4pDQo+ID4gPiArJnNwaTEgew0KPiA+ID4gKyAgICAgICBwaW5jdHJsLTAgPSA8JnNw
aTFfcGlucz47DQo+ID4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4g
PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiA+ICt9Ow0KPiA+DQo+ID4gVW5sZXNzIEkn
bSBtaXNzaW5nIHNvbWV0aGluZywgdGhlIGFib3ZlIGlzIG92ZXJyaWRpbmcgcHJvcGVydGllcyBp
bg0KPiA+IHRoZQ0KPiA+IHNwaTEgbm9kZSBpbiByei1zbWFyYy1jb21tb24uZHRzaSB3aXRoIHRo
ZSBleGFjdCBzYW1lIHZhbHVlcyB0aGV5DQo+ID4gYWxyZWFkeSBoYXZlPw0KPiANCj4gRGVmYXVs
dCBTV0lUQ0ggc2V0dGluZyBpcyBDQU4gZW5hYmxlZCBhbmQgUlNQMSBkaXNhYmxlZC4gVGhhdCBp
cyB0aGUNCj4gcmVhc29uLg0KDQpPSyBteSBtaXN0YWtlLiBPbmx5IGVsc2UgaXMgc3VmZmljaWVu
dC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiANCj4gPiBTbyBJIHRoaW5rIHRoaXMgYnJhbmNo
IGNhbiBiZSByZW1vdmVkLCBhbmQgb25seSB0aGUgI2Vsc2UgYmVsb3cgc2hvdWxkDQo+ID4gYmUg
a2VwdC4NCj4gPg0KPiA+ID4gKyNlbHNlDQo+ID4gPiArJnNwaTEgew0KPiA+ID4gKyAgICAgICAv
ZGVsZXRlLXByb3BlcnR5LyBwaW5jdHJsLTA7DQo+ID4gPiArICAgICAgIC9kZWxldGUtcHJvcGVy
dHkvIHBpbmN0cmwtbmFtZXM7DQo+ID4gPiArICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+
ID4gPiArfTsNCj4gPiA+ICsjZW5kaWYNCj4gPg0KPiA+IEdye29ldGplLGVldGluZ31zLA0KPiA+
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gPg0KPiA+IC0tDQo+ID4gR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLQ0K
PiA+IGdlZXJ0QGxpbnV4LSBtNjhrLm9yZw0KPiA+DQo+ID4gSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+ID4g
QnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3INCj4gPiBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
