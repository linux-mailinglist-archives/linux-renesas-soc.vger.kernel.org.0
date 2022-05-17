Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2F4D52A38E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 15:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347907AbiEQNgY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 09:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348137AbiEQNgK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 09:36:10 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E294CF2;
        Tue, 17 May 2022 06:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gO6IAw2L+A8J3QhMOXloKTTqgUlzO2Mv7EZDmkcCpI16oe3JsF74mDBYaeLRHF+9eLFoRTNLWFoQS5kRV1r6FneT/F0y/WdvtEtnIDNxMVLL+Bcr1AyjcWLaJ2zzVjI32aXdyPAkPz2ZCP2y0VEyc3ka/9vAZEuXrKnGteRg4fB2Szk9lq2sboaW+4/WImoadocmLOS9ovozpw9IZyvgbyVSqR34laFc4gCfIAUAxe9ZT6fql//H+XHtfiGZG8tQT/HuO+um4oj9IKURq4IgWihK4xu8B95W3kTvvgxb/vUSr6DCt3THwy5ixz1xttMHfcWQh8ykxkWzhguTHDCDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvJ5Z2UI2SZEM2O5wA3RRnwvAJaGA/0G5WktnUqurCA=;
 b=SVS2AuUUZnji/ORJfUJYYot9ITred4BDqssKXkltPC2lFixx3HWNXn5v57MSwUDdDdLeTpE7YBGPoWYWroUkomqzayZUObNcTUSQ6ffkNVIKPNNEHIcl97oJ9Qtb0uHCNcIZcCAtbd1xRDoSWQvTnz0ucwDw5sZfnGdYukqCVAL+28LDV3SjqWDDwEhINTfwhpJIu844j6HYwzttUQKN4WMzLVCOdpYiDiGv3fOaaiv2c5R+MMWcLypEqIF/zRhno7PWUlO3TAkCQ1zFxO9oMUQDTG5Oww8+hXCeuyTpaetID5eEVX6nnOy1JySLyn8iPqkJma+EL2TWcnPyBPIFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvJ5Z2UI2SZEM2O5wA3RRnwvAJaGA/0G5WktnUqurCA=;
 b=URDD8YZBAhTiPBNixifiQPc7rRxiZDa4aXADJkmd2wpf+wRxgVTxa4jTqC8ED1oIq44OZ1tZcAsSe0GuOr6kC0gTdvUvNFkntSHFmsxbdh9GKHzeq4HEG13H8CvS7LkTIme3uL5d6hDNC8TDAfFXbaznyggTbiec1GQTBYDWBZI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB7458.jpnprd01.prod.outlook.com (2603:1096:400:f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 13:36:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 13:36:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: RE: [PATCH] clk: renesas: cpg-mssr: Add a delay after deassert
Thread-Topic: [PATCH] clk: renesas: cpg-mssr: Add a delay after deassert
Thread-Index: AQHYX+bzJzYgcOdHs023qA1K4buvQK0P3WyAgAAvvCCAExOzAIAAAbRQ
Date:   Tue, 17 May 2022 13:36:04 +0000
Message-ID: <OS0PR01MB592211288197B1923D452B3986CE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220504184406.93788-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUh69grzYVsMwdZLgv=KLy5-_FVjeMWx37qGsqCxz9Y6g@mail.gmail.com>
 <OS0PR01MB59224D1908A7DBB08DAF444986C29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVqj6nr5h5G9w3wTDHCDbDK_9fJW4d7cvc1c1LC9D2roA@mail.gmail.com>
In-Reply-To: <CAMuHMdVqj6nr5h5G9w3wTDHCDbDK_9fJW4d7cvc1c1LC9D2roA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ed56651-065d-4337-5916-08da380a308a
x-ms-traffictypediagnostic: TYCPR01MB7458:EE_
x-microsoft-antispam-prvs: <TYCPR01MB745891DEF43F198E4337BEF786CE9@TYCPR01MB7458.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gu1r167fVxulC84HcTnvMjaPlURKq3um0it1vLPFW4zJGLnIhKhhJlwwyuHr6EF2Q5reDAE9y8lCiKhERe+4z/epp/NNWbOavrOBVt18gkqg3Hr0CkqJh7q8b58bqcK7k49itUZnEXaC8I8Gb+jcDj/iTFnWV1772mphlJo+IRgm5UFsc+Fg7J5s4+65/4278A+g3kleOZ+VxwogvIANfr6RlaUsuKIuKdlr2oHPznAmbRif9UWJZntSPwdjUef7oJlkS5zdGUCg6pCCfBFOlK/5dWBcEZ1uiFYQqzp7iTFIjX6guatXYaHmKOzMRz9YmZOyKw2QCz04Whmxe/SG/QOb32+1Ub0iiSpqKNObSfWnQg3Xglz91/QuK/zLYeoydt9V0lHNX9dx7RkBvNFs1eEyxlih5jWK3hjOo5bCz/7Eo1JSV/MiWhNxotU3iIbKKXvCmxPZSIkx7CWKpD4lMPtxtYu2XsW0sVtIV1WrfEKswrTIJqRNmeYaDAX/GMjy1d/p0AoeuOgceaNjloqaWy+GchoZa2Xr94ESvED6nHvThiAUka7oWf9YObEIeA2UPE1h706GjrV3AQwWdrsMYSFmRZ1gUAipT3BXQNmAHfs7OZuTjTiEKO9CbuFCG4r5z9RUiBS6ADssdJRtXMtIq/TqFwatwa8k87T4M/n9PeSCH5FhlamyZyTE3d9WIgznmXdONg8WTbsgVcQDtPKsZg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(7696005)(38070700005)(122000001)(33656002)(9686003)(26005)(71200400001)(2906002)(52536014)(8936002)(508600001)(316002)(66476007)(8676002)(6916009)(83380400001)(64756008)(66446008)(4326008)(66556008)(55016003)(86362001)(54906003)(66946007)(76116006)(53546011)(38100700002)(6506007)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEdyd0d1WXhWVXY1Wm9CVVBWY1pkZnIvQ0tWb0l6QUQwL2xKU1lKTnAwclY1?=
 =?utf-8?B?cC9POUhsZjZTcy8relBSOTFoODRKbjMwZkJhaXB3YjBTcU1mV1ZSQ2tleEZB?=
 =?utf-8?B?dGV3ZDh1TmZoUERqM0ZSRDhuR3NKbnNXWkhWMEZ6akpUWVZMNm9MNGNPc3Ex?=
 =?utf-8?B?dkVDOTQ5cWRpaW1JK3d1MlRqek0zOFpQNkN5Vld5RFI0WUlIQjVtZmg3dHZj?=
 =?utf-8?B?TDNaRzRXUUtzZjZkZGJaZlUrK01OMmtPWUNNZjE5cWZsMFMwS1ByVVNlUkt4?=
 =?utf-8?B?QWR4Rk13TExicXU4ZndoRzVWOTlQdFI3RHQ2K0FMLzRxSWE5dUlzUGM5Tkor?=
 =?utf-8?B?SXZ5OE54dy9vbU5CWHRKWnJQQkYxQVFKZzdOQ3pUSHAyM3pVNmdkN24rYzVr?=
 =?utf-8?B?K2NSWWk3UGkzUGl4L2F5SkwwM1RsVDJBWG5Dekt0TmR1aGJETDRlTmdRSU1Q?=
 =?utf-8?B?d2kvaGhadHpEMFFURTBzTU9rYUFoZXgvKzVYRktIMCtJTkNFZzBia2pvVlZR?=
 =?utf-8?B?S3ptYWUvbm40L2ZzQ1ZRS3psYndUVEVyN01zZWUybmV1U0VvUkNnY1VTWWpo?=
 =?utf-8?B?VXNKcmpZZ1RnY1JDOFFocmJmSWR2eHEzcjBZZ1ZkZU1WcHFlMEN5cHVLSTBZ?=
 =?utf-8?B?TzhELzQ5WmpGWUNJU3pSWEdkYmdFaUxrNzd2c3hpeGV0V0Q5V2ZZanozUStK?=
 =?utf-8?B?RDZnUUxVU0JhOXljSUVhYzkwZ3ZaOWJzQ2RDeUF2cXMrVUNTSHlMUk5tWm9D?=
 =?utf-8?B?bGtXREg4dlpiWUtISCsxT2wzNFVEMldzWGNkNlk0VUgwWE4yUnoraWhKTmpU?=
 =?utf-8?B?OGVjQURLYjZSenNEU1kyazVFdmUwV0VBQysxNEwya0ZlMTg0VlJHcEhISmxu?=
 =?utf-8?B?NFk5SVBPeGtvcnJIZHduUGd4c1FBb2R0eDRDTHNVLzRuc2Q2MGV3aXhqR3ph?=
 =?utf-8?B?UXFYWDN4UzZTeE82cTZVNlNxYko3UVQybmVXWGRXQm41NXQ2alh0L1IvUFA3?=
 =?utf-8?B?Uy9JVUNqMUt5Yk9VYXd5Umw0TXRNblhSZ1Flak81b2NYQUJuajFaNFduTkx1?=
 =?utf-8?B?ZDRqcXNOMDZiK1lRU1FXc2k5N3dGWVUvbTlUdGtYWSs5STYyamlUOFZEMVdy?=
 =?utf-8?B?a3J1eHZQREwvc2pVUmRYd1dpcHBJRWJDWWpsVHdrQkF5T0lLZHNra3V6eEc2?=
 =?utf-8?B?ZlhCeUdLQ2txZm9paHo4WTA0aloySVRLdXR6dkN4QWtLOTVjcmFQZm5XUnU2?=
 =?utf-8?B?a1BETzdEczVidVpwc2lLZDdxMkcwRGQrYkUwREQvNmo3K2IxVXdRWVdHWHRj?=
 =?utf-8?B?akpVUkt4bnlMOUlobG9SSWVpUGw0RmxVVmtJZUo4Z3BsZDUvdFRnaGxRVGJu?=
 =?utf-8?B?MGpJSFlyZjRwSi93aGJqVDhKUElLOTZVdDB0NzNYb1lvcldVSUF3N3NoSE9s?=
 =?utf-8?B?K3lhdU95WVpBTEMxa1JGM29xUm5sYTUxb016ZGhEVkVtWnVmakRmcXpmb054?=
 =?utf-8?B?QXkvNHJ0ZEZMRE13SVR4MUptSkdEWUFOMExoWFQzMTFmdGZIOTNVWFBOaXBL?=
 =?utf-8?B?eUl6VHlBdnRMUU5EblowL2xUTFVVbW1vaUx1UlJRTjA5RFBNWFcvNm1DRDdo?=
 =?utf-8?B?emh0WWJvZ2ZqZDE2aHJjVVdhWkd3bXRiZkx4ekFsQktnb1pkOElvVDUweUo3?=
 =?utf-8?B?ZGYxQ0ZVSWRBcDlDSUJWQ0xFR1U0L3lGMm1EdTlveFVZdGphR1JnUHFqSS9u?=
 =?utf-8?B?YTdua0dLK0tZb1N3WG45bFRQQUVsSXBDb3FYdkI5T2tudURLZzl0T3l6TW90?=
 =?utf-8?B?RlJNVnZDUTNUZFc2TlhDSU41R3EvbjYvd2pFQzZIRStwcEs1a1E1ZUdNUUVH?=
 =?utf-8?B?TTdMa214M1ZVbytaYUR2RmJhSUZTRFN6c1JDcFlUcXdKRnE2YlI4cHZOaGpK?=
 =?utf-8?B?ZjlyYXZsdld0M1RJa1p1TUdFZzRSOEwwSHRHNXB1TGRoU3lMdG10Ym9wZGhB?=
 =?utf-8?B?M2NDRmRtNnJzUmlyQU55YWVCMC8rS1p2cWNBcVhaTCsxY0xBRG9Zb2prMGtO?=
 =?utf-8?B?VitrSFV4dWQ5eGp1T3lGaHNmOUZwTk1lSm9RTStnY1pmcGpiYXBWT2pSZzZv?=
 =?utf-8?B?NUFlMkJDN1NQMXBGdXIxTExOc2JsNnZnelA0am1OSTJmMzdpb3pJdkhSUm1y?=
 =?utf-8?B?ZmpTejladmJDcmtXb0ZLWGs0bmdqOHVkK2pWRTkzdVRJbG1rbE5TU1RGZ3Jq?=
 =?utf-8?B?WXpMYnNybzRua0FIVUN4ZHQrRkU1dnR4Rnk0TnpLOWphUTNjbGQvLzh6SGt3?=
 =?utf-8?B?VGR0Q3l1ZVlKc2pBa3FKd1pIbUJhZ0F6ODJFMmFYNHpYckFRQzlCOTZnSDZz?=
 =?utf-8?Q?n9site0NOWAUYQyI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed56651-065d-4337-5916-08da380a308a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 13:36:04.1065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0QICdDMk8V3pUz5bMBGvBkiisIibxhu6lJg6uRbF3nO2aiua37fK9uqNr63eyOjW5Dkvv3SoiUK/AYgs0s8V2rA/RfPVoxxVF99ILpQfKxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7458
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
UEFUQ0hdIGNsazogcmVuZXNhczogY3BnLW1zc3I6IEFkZCBhIGRlbGF5IGFmdGVyIGRlYXNzZXJ0
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBNYXkgNSwgMjAyMiBhdCAxMjowMSBQTSBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gY2xrOiByZW5lc2FzOiBjcGctbXNzcjogQWRkIGEgZGVsYXkgYWZ0
ZXINCj4gPiA+IGRlYXNzZXJ0IE9uIFdlZCwgTWF5IDQsIDIwMjIgYXQgODo0NCBQTSBCaWp1IERh
cw0KPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiBBZnRlciBh
ZGRpbmcgcmVzZXQgc3VwcG9ydCB0byB2c3AsIGl0IG5lZWRzIGEgZGVsYXkgb2YgMzINCj4gPiA+
ID4gbWljcm9zZWNvbmRzIGFmdGVyIHJlc2V0IG9wZXJhdGlvbiwgb3RoZXJ3aXNlIHN5c3RlbSBo
YW5ncyhkdWUgdG8NCj4gPiA+ID4gcmVnaXN0ZXINCj4gPiA+IHJlYWQvd3JpdGUpLg0KPiA+ID4g
PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBzeXN0ZW0gaGFuZyBpc3N1ZSBieSBhZGRpbmcgZGVsYXkg
YWZ0ZXINCj4gPiA+ID4gZGVhc3NlcnQgb3BlcmF0aW9uLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0K
PiA+ID4gPiBBZnRlciBhZGRpbmcgcmVzZXQvZGVhc3NlcnQgc3VwcG9ydCBmb3IgdnNwIGJhc2Vk
IG9uIFsxXSwgUlovRzFODQo+ID4gPiA+IGJvYXJkIGhhbmdzLiBPbiBkZWJ1Z2dpbmcgaXQgZm91
bmQgdGhhdCBpdCBuZWVkcyBhIGRlbGF5IG9mIDM1DQo+ID4gPiA+IG1pY3Jvc2Vjb25kcyBhZnRl
ciBkZWFzc2VyaW50IHJlc2V0LiBXdGhvdXQgZGVsYXkgaWYgdGhlcmUgaXMgYW55DQo+ID4gPiA+
IHJlZ2lzdGVyIHJlYWQvd3JpdGUgd2lsbCBsZWFkIHRvIGhhbmcuDQo+ID4gPiA+DQo+ID4gPiA+
IFRoaXMgMzUgbWljcm9zZWNvbmRzIHZhbHVlIGlzICBwaWNrZWQgZnJvbSB0aGUgcmVzZXQoKS4N
Cj4gPiA+DQo+ID4gPiBUaGUgMzUgwrVzIGNvbWVzIGZyb20gdGhlIEhhcmR3YXJlIFVzZXIncyBN
YW51YWw6IHRoZXJlIHNob3VsZCBiZSBhdA0KPiA+ID4gbGVhc3QgMSBSQ0xLIGN5Y2xlIF9pbiBi
ZXR3ZWVuXyBhc3NlcnRpbmcgYW5kIGRlYXNzZXJ0aW5nIHJlc2V0Lg0KPiA+ID4gVGhlIG1hbnVh
bCBkb2Vzbid0IHNheSBhbnl0aGluZyBhYm91dCBkZWxheXMgX2FmdGVyXyBkZWFzc2VydGluZw0K
PiByZXNldC4NCj4gPiA+DQo+ID4gPiBDb3VsZCBpdCBiZSB0aGF0IHRoZSBWU1AxIGRyaXZlciBp
cyBhY3R1YWxseSBkZWFzc2VydGluZyByZXNldCB0b28NCj4gZWFybHk/DQo+ID4NCj4gPiBNeSB0
ZXN0IHJlc3VsdHMgb24gUlovRzFOIHNob3dzLCBpdCBuZWVkcyAzNSBtaWNybyBzZWNvbmRzIGFm
dGVyDQo+IGRlYXNzZXJ0aW5nIHJlc2V0Lg0KPiANCj4gSSBjYW4gY29uZmlybSB0aGF0IGFjY2Vz
c2luZyB0aGUgVlNQIHJlZ2lzdGVycyB3aXRob3V0IHRoZSBkZWxheSBjYXVzZXMgYQ0KPiBsb2Nr
LXVwIG9uIFItQ2FyIE0yLVcsIHRvby4NCj4gSSBzZWUgbm8gc3VjaCBsb2NrLXVwIG9uIFItQ2Fy
IEdlbjMsIGJ1dCBJIGNhbm5vdCBydWxlIG91dCB0aGF0IGl0IGlzDQo+IG1pdGlnYXRlZCBieSBh
IGhhbmRsZXIgaW4gc2VjdXJlIG1vZGUsIGFuZCB0aGF0IFZTUCBpbml0aWFsaXphdGlvbiBtYXkN
Cj4gYWN0dWFsbHkgZmFpbCAoYWNjZXNzaW5nIHJlZ2lzdGVycyBvZiBub24tY2xvY2tlZCBtb2R1
bGVzIHVzdWFsbHkgY2F1c2VzDQo+IGFuIGltcHJlY2lzZSBleHRlcm5hbCBhYm9ydCwgd2hpY2gg
aXMgY2F1Z2h0IGJ5IExpbnV4IG9uIFItQ2FyIEdlbjIsIGJ1dA0KPiB0dXJuZWQgaW50byBhIG5v
LW9wIGJ5IHNlY3VyZSBmaXJtd2FyZSBvbiBSLUNhciBHZW4zKS4NCj4gDQo+IEluc3RlYWQgb2Yg
YWRkaW5nIHRoZSBleHBsaWNpdCBkZWxheSwgSSB0cmllZCBhZGRlZCBhIHBvbGxpbmcgbG9vcCBh
ZnRlcg0KPiB0aGUgY2FsbCB0byByZXNldF9jb250cm9sX2RlYXNzZXJ0KCkgaW4gdGhlIHZzcDEg
ZHJpdmVyLCB0byB3YWl0IHVudGlsIHRoZQ0KPiByZXNldCBpcyBjbGVhcmVkLCBsaWtlIGlzIGRv
bmUgaW4gdGhlIGkyYy1yY2FyIGRyaXZlcjoNCj4gDQo+ICAgICAgICAgcmV0ID0gcmVhZF9wb2xs
X3RpbWVvdXRfYXRvbWljKHJlc2V0X2NvbnRyb2xfc3RhdHVzLCByZXQsIHJldCA9PQ0KPiAwLCAx
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxMDAsIGZhbHNlLCB2
c3AxLT5yc3RjKTsNCj4gICAgICAgICBpZiAocmV0IDwgMCkgew0KPiAgICAgICAgICAgICAgICAg
Li4uDQo+ICAgICAgICAgfQ0KPiANCj4gVGhpcyBhbHNvIGZpeGVzIHRoZSBpc3N1ZSBmb3IgbWUu
DQoNClllcywgSXQgaXMgYmV0dGVyIGZpeCB0aGFuIHRoZSBleHBsaWNpdCBkZWxheS4NCg0KPiBB
ZGRpbmcgbW9yZSBkZWJ1ZyBjb2RlIHNob3dzIHRoYXQgcmVzZXRfY29udHJvbF9zdGF0dXMoKSBp
cyBjYWxsZWQgb25seQ0KPiBvbmNlIChib3RoIGZvciBpMmMgYW5kIHZzcDEpLCBzbyB0aGUgcG9s
bGluZyBjb21wbGV0ZXMgYmVmb3JlIGFueSBjYWxsIHRvDQo+IHVkZWxheSgpLg0KDQo+IA0KPiBO
b3RlIHRoYXQgYXQgdGhhdCB0aW1lWzFdLCB3ZSBhZGRlZCB0aGUgZGVsYXkgdG8gdGhlIGkyYy1y
Y2FyIGRyaXZlcg0KPiBpbnN0ZWFkIG9mIHRoZSBDUEcvTVNTUiBkcml2ZXIsIGFzIHdlIHdlcmUg
dG9sZCB0aGF0IGkyYyByZXNldCB3YXMNCj4gc3BlY2lhbCwgYW5kIG90aGVyIG1vZHVsZXMgZG8g
bm90IG5lZWQgdGhpcy4NCj4gUGVyaGFwcyB2c3AgcmVzZXQgaXMgc3BlY2lhbCwgdG9vPw0KPiBP
ciBwZXJoYXBzIGl0IGlzIHRpbWUgdG8gcmV2aXNpdCB0aGlzLCBhbmQgYWRkIHRoZSBwb2xsaW5n
IHRvIGJvdGgNCj4gY3BnX21zc3JfcmVzZXQoKSBhbmQgY3BnX21zc3JfZGVhc3NlcnQoKSwgc28g
aXQgY2FuIGJlIHJlbW92ZWQgZnJvbSB0aGUNCj4gZHJpdmVycz8NCg0KSSBmZWVsIGFkZGluZyBw
b2xsIGluIFZTUCBkcml2ZXIgaXMgYmV0dGVyIGNvbXBhcmVkIHRvIGNwZyBkcml2ZXIsIGFzIA0K
aXQgcmVkdWNlcyB3YWtldXAgdGltZSBhZnRlciAiU3VzcGVuZCB0byBSQU0iIG9wZXJhdGlvbi4N
Cg0KSG93IGRvIHdlIHByb2NlZWQgaGVyZT8gRG8geW91IHdhbnQgbWUgdG8gYWRkIGFzIHBhcnQg
b2YgUlovRzJMIHBhdGNoIHNlcmllcz8gT3IgeW91IHdpbGwgcG9zdCBzZXBhcmF0ZWx5Lg0KDQpQ
bGVhc2UgbGV0IG1lIGtub3cuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gWzFdIENvbW1pdCAz
Yjc3MDAxN2IwM2E0Y2RmICgiaTJjOiByY2FyOiBoYW5kbGUgUlhETUEgSFcgYmVoYXZpb3VyIG9u
DQo+IEdlbjMiKS4NCg0KQWRkaW5nIA0K
