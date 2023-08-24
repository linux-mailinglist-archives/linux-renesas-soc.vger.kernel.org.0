Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF18786C47
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 11:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240424AbjHXJs5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 05:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240776AbjHXJsf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 05:48:35 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCCC19A0;
        Thu, 24 Aug 2023 02:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KR/MH0vkFgTOkgbg3qtWQAFunAJJL298ZDtvC4MZihT3+gRCqVJTPKWjG3Ig+reIQDkwfnm7XDchQZSg9FjMkisFuEhZXqTNERUdoAPpXaxAZBOaoofW18mgBTQWGej6Fshk14MQmjuuFIE88W1EtTasvAlNlGD3KwB1p1EPakidgHlDxbdZ7+qPhNoqkidywNtx4Hwej/o3P0xl4ZpbPM65qwJiRYp+yXY6HVNJ9GEAqMsh6gKcBpO34hy5SIEs/MbAP/86Lstrjqn2m5uPhZeCC/A4vpxbp0WZh+UBObyW0QZOu58QHeAhpjQ08UQM8tPkdWYrrLPHJiI3+DnFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weCW3LXnIcoBUc8LRVMWTsdqtrFEghJ+9+zhqRHz8Nk=;
 b=EPf7uvZGQBe31059rsMZ8ipkpRm3YNT08kWsH5drbK1MTPWhLDxAA6EZv8NMU7cVBntbHs/jSUDGG+hGBFZgoxEjAWQrYNvwH1KUi9PZrBTBLAO4ZT7A1w7bGGct3hORQmgnup/TfC+sH3xbYnzj8sfZpK/MUf9xuj9AYypwrju6Qni1iSOdeW04P3QHVOMSluxRwF5vyglEjPZxkEQG0dls7e2ryn/R/xbUMVbeKZAvANvJjQCAQm6ahLfkpBPmeyl20y6rjWkhsAoEIynFT1OmLOvm1JMvJA8X4x73cjxPsLpfQJJbki8MEc93AQ/pOi0sWhObsYBVhvABATDDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weCW3LXnIcoBUc8LRVMWTsdqtrFEghJ+9+zhqRHz8Nk=;
 b=KqoHyhtqr0Cc/u3zkPazESb4kMMKC+CkdFsCgiCv795OVa8C3oqHTjTYxfixaw5cSU8MGKaYOFGiO51ob/ZLfCcDxB7Sn7M0h9fK053Kdhg7LawedS3kykWepb4EV4GpO8HyHhx4+KB9NIniSAxN5Tmrn2B//dXn0yadF1PHGCY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS7PR01MB11612.jpnprd01.prod.outlook.com (2603:1096:604:247::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 09:48:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 09:48:29 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 3/4] clk: vc3: Fix output clock mapping
Thread-Topic: [PATCH v4 3/4] clk: vc3: Fix output clock mapping
Thread-Index: AQHZ1mSFL5p7PNApFEqpyrj0ENw8/6/5HvqAgAAL16CAAAXLAIAAAl9Q
Date:   Thu, 24 Aug 2023 09:48:29 +0000
Message-ID: <OS0PR01MB5922F2A5E303B9E194B829F0861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230824082501.87429-1-biju.das.jz@bp.renesas.com>
 <20230824082501.87429-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyb0rt7T82h_wS1jCt=U-1o6tS+B0AgMTHgyBbkEi5eQ@mail.gmail.com>
 <OS0PR01MB5922249F5000425F44B6A075861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXCnP7ErKYVtyfsxsABjUTgZDFRuWnSPtRoL=9m4-ciSA@mail.gmail.com>
In-Reply-To: <CAMuHMdXCnP7ErKYVtyfsxsABjUTgZDFRuWnSPtRoL=9m4-ciSA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS7PR01MB11612:EE_
x-ms-office365-filtering-correlation-id: 5242f20c-065d-47c2-1ac1-08dba487459d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RJ0Z2TVqDIGcAzW1B1oD8kuzVW5qD+cQXrkuD210PFQHKHsruSpP0hURi1pEUq4+0xfC8lolNzt9LtYrLHu9QpUPj3bXXFrc51QeR1RhhQIpVRA1duZLglJgjOq7DLpKud7sJZJkav15o8ZBfLZGYvbPo5aG/t8h/oClQs6JcXLocZc8g8chg4br8o1BKHm+7VrD/oOLJYe4GysLnebvrUb5BUi+cWrc1njJZ3PEzxp4RLFoNQhEiAokg2dKy26UBJm2jcLOuRqqYgQGHsR0O91kc+8t3P+nAZjMJD3FxvZAYi5HI6HaeMmrWMoodBycvqJb50x8vykRdgNKVoWnudeIme/XPmZlD0IRtgxNAgKV6LiJADTMgY8+Z4zfA0iytf7eK4nQuaiy6aOlbFcgvy41cBSx70XgbFyWvPwPpMkHvyykNa3C2VAvtMSWEjhkJgBkqnIx2EGJGWqxouDymVOrCib4oK5jExaneJ9yrZh2cY84XjuQoyFk4K+tBjRD/hiC1arQGFn5YklHJBzNBe7Su2zbVUkPZkCIRQd0/lBk/5+8SWOWeCIiTQVcJuLOV3D2KoYkC2z7Bb0QvuDxJgjFYukk+pCT9kac5S4GkKAsfrKddIwCbJwG7zSEULnS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(39860400002)(396003)(346002)(186009)(451199024)(1800799009)(6506007)(7696005)(71200400001)(9686003)(33656002)(38070700005)(86362001)(122000001)(55016003)(38100700002)(83380400001)(2906002)(26005)(53546011)(478600001)(66556008)(52536014)(66946007)(66476007)(4326008)(66446008)(5660300002)(8676002)(8936002)(76116006)(41300700001)(316002)(6916009)(54906003)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnBWT2Z2RFBBNGMrOG1PaFNxekowMTFYMmMvMXpXci8wVWdIZlM2Z2J5QjE3?=
 =?utf-8?B?WWFMQWwyQkVTd2ZjMG54STNhUnpuTUphVlZyNWVORWlYbEJPNjVKemZyRVFL?=
 =?utf-8?B?S3FoczB3SU1rc29zRW40T21GNDFBMkFmN2RwOWZybTJ3QnV6WnN5SlQxNFFs?=
 =?utf-8?B?clBzNFQyTGFBT2RMWjBrdUJobVlJeWFXMjJtZUxiS2tQWTlxQktVUFFGN2k3?=
 =?utf-8?B?WUxYL3FNYkxiL3A5MFNCWFE4M2tMWUNQTktSTzRmcWUrMlZRZVpIVVJPVndl?=
 =?utf-8?B?b0ExM2xMUFZqelNmc2wxWFNQZ3JOekloNE5BdGpGeHJpNjc3TTl5NmIxVUV3?=
 =?utf-8?B?WHE1Q2tvVFU5dHRvVFEzM2MxV2JiSlNzK3FnUE5kcFdVVEpOVnl5WlFhQVVy?=
 =?utf-8?B?UXNzYi9tanpBNGFGdk1PVi9aSVdSNUhUZk9ML0pZQ1VHb1B4MjhBU2N5MWZh?=
 =?utf-8?B?Um9VdzFDM3JicmlLYVZnQmhvZXV0RUZjSGpndUNOcE5hcjVuT1JtTnVKblNN?=
 =?utf-8?B?VUdGejNxZTNyUDZ6UUNkdmdwYWRYSE1FODROSnFTRVJOM2t1L0NDakcwOTZM?=
 =?utf-8?B?Uk5iU0FYa3ZiZ2lpVStWeWlNTGVaZERWbE9WVUJBR2RvMk1RSmtsdlJGOCt0?=
 =?utf-8?B?R2JPRVB4RCtOdUJlcm11NFRPdUx2MFdOK0kvRWFHZXdjUHpTejBjbjVuci9a?=
 =?utf-8?B?eEF6NVJVMURhVjlZVFgvbEp6WHRkcTB3NjYrN3pPVE8wK0FNU1VPQmx5cjl3?=
 =?utf-8?B?eWhTWVp3NmJHR1RHcHl2V0trMVh4NUtUNXA0NDRXSE1keWkrTGpQd3pnUEJv?=
 =?utf-8?B?d3lxdzdqRG5pTjNWVkxZU3MwN2RRdVRkSWovSEVadUlkWXYyT3RjTXJkdkdR?=
 =?utf-8?B?NkxzMGxzTGdyTytDMUNDZE13K3M2amM3SWRZcDdEeEwzTzZ2VFVvcCt2cFFw?=
 =?utf-8?B?WEVqRHF1eC9MNFlrN2ZpSjY5ZEpuc3EySENmQXoyU3hzeWY0VHpFS0xSUXgr?=
 =?utf-8?B?WUVUWUFPWXB6VU82YWxscnNGUCtqRERKT1NwOWYvS2Foa2VZVExJRTlTS1lU?=
 =?utf-8?B?ckliZEx1NG1iWEs0NTA5OTlXdHJ4TFJlcUFyQTlXc3dKejBVYzc1aStYY3Vm?=
 =?utf-8?B?dzRjVUNmTkF6U1MrTEI1RXdVSk9aZ0V3NWZ6K2ozUEo2bkNjLzhKY3Zhazl5?=
 =?utf-8?B?ajljVE5JQytXWEpNSWRsb05yV0ZZL1c5bkxUSVNhNUZvN2JhTkUrNmRrZk92?=
 =?utf-8?B?Q3BZakdhak92Y0d5OXVwTkpzSW90cmRqUDFtTXBtWC8zVUJHUG8wOW4xWFRO?=
 =?utf-8?B?aU92U2ZpRWdqT0dGc29PWHFnNmRaQjk4TWhGMkdVUDhlTUlNcHhIZ092RmZM?=
 =?utf-8?B?ZmppaW43WDN4cC84bVVxM0daWnpUc3NoNXpiclBLOCsrRkJRSGN1OENVV3Rw?=
 =?utf-8?B?eVN3R29xa1o1NktTZm1MbW43ZVhTaFNMc3htTzZzdVQzVW5wcStMVUcxYnlq?=
 =?utf-8?B?YzhPTjJ0emNlNnFXcXBVUUZpR0FxdTJ5TENBcmhHSDZVQkUvcHpBTjBmdGl1?=
 =?utf-8?B?dUxPQVYyRTl5aytsUmhzVWVaZmNzamdSS3VHZHhtdGp0bmo4M2drNENRbTZ1?=
 =?utf-8?B?b3MrVStWR3VUc0hsREN2eEJ1SHBwdW1sN3NZWFdZSTRGRTV0OGUzYlV5cHNa?=
 =?utf-8?B?YlpUZisramp4RzRaNndpcDljZy9MU2YxYmZ3V0tIbUs0bEFFMk9mSG5QSFIw?=
 =?utf-8?B?dTB6T29IUmREeE81UTJUU25hNjlhVDdHbW1DOTJWZFNiM2JsUGRBZVNSQVB6?=
 =?utf-8?B?WmFGL0pFT2ltY0VPM3R4Y2tjVmx0Y3FxY0dVeUZsdHlxNDVEZVN6cXJ0cytq?=
 =?utf-8?B?bGpyR3FkYnhNOVhqSnIvVk5Md2JsS2pWclN1eC9YdWhqZ05FL1FEa1RuamhJ?=
 =?utf-8?B?QmJMZUE0Q3A1YlFwU2JrZVJicWJseW5ycy9zRDF6SnJKMWozeFE2LzhXVWRB?=
 =?utf-8?B?aHI4bEdLY28yU0dhM3BWcTRtYlVPRkFBRXNkRWwrUlhMNVVyZFQ2aE80bFM2?=
 =?utf-8?B?QVhIYktyRW0rUnpiVFgwdkhTVHlkV1R2ZlYrR1V0dk10SkZBYTBUZnJyTFhV?=
 =?utf-8?B?amdwRHNCY2RCZU40Vjk0TUtDSEEvUWltYzlmZ29ZU0pxQ3J6S29DYUpuLzQ3?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5242f20c-065d-47c2-1ac1-08dba487459d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 09:48:29.8311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXbjtHUJz32snv4oOaPlRxxGNTn37NFi+rghWb/oee80bauTlyS3S63LUVs9TOviaYP7DECXR953mAnwk6wEHE8ou1KkA77DZJXHpCq8SX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11612
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY0IDMvNF0gY2xrOiB2YzM6IEZpeCBvdXRwdXQgY2xvY2sgbWFw
cGluZw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgQXVnIDI0LCAyMDIzIGF0IDExOjIw
4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4g
PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMy80XSBjbGs6IHZjMzogRml4IG91dHB1dCBjbG9j
ayBtYXBwaW5nIE9uDQo+ID4gPiBUaHUsIEF1ZyAyNCwgMjAyMyBhdCAxMDoyNeKAr0FNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBB
Y2NvcmRpbmcgdG8gVGFibGUgMy4gKCJPdXRwdXQgU291cmNlIikgaW4gdGhlIDVQMzUwMjMgZGF0
YXNoZWV0LA0KPiA+ID4gPiB0aGUgb3V0cHV0IGNsb2NrIG1hcHBpbmcgc2hvdWxkIGJlIDA9UkVG
LCAxPVNFMSwgMj1TRTIsIDM9U0UzLA0KPiA+ID4gPiA0PURJRkYxLCA1PURJRkYyLiBCdXQgdGhl
IGNvZGUgdXNlcyBpbnZlcnNlLiBGaXggdGhpcyBtYXBwaW5nIGlzc3VlLg0KPiA+ID4gPg0KPiA+
ID4gPiBTdWdnZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlk
ZXIuYmU+DQo+ID4gPiA+IEZpeGVzOiA2ZTlhZmY1NTVkYjcgKCJjbGs6IEFkZCBzdXBwb3J0IGZv
ciB2ZXJzYTMgY2xvY2sgZHJpdmVyIikNCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiA+DQo+ID4gPiBUaGlz
IG9yZGVyIHNob3VsZCBiZSBkb2N1bWVudGVkIGluIHRoZSBEVCBiaW5kaW5ncywgdG9vLg0KPiA+
DQo+ID4gT2ssIHdpbGwgdXBkYXRlIHRoZSBtYXBwaW5nIGluIGJpbmRpbmdzIGxpa2UgYmVsb3cu
DQo+ID4NCj4gPiArICBhc3NpZ25lZC1jbG9ja3M6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogTGluayBjbG9jayBnZW5lcmF0b3IuDQo+ID4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IE91dHB1dCBjbG9jayBpbmRleC4gVGhlIGluZGV4IGlzIG1hcHBlZCB0byB0aGUN
Cj4gY2xvY2sNCj4gPiArICAgICAgICAgIG91dHB1dCBpbiB0aGUgaGFyZHdhcmUgbWFudWFsIGFz
IGZvbGxvd3MNCj4gPiArICAgICAgICAgIDAgLSBSRUYsIDEgLSBTRTEsIDIgLSBTRTIsIDMgLSBT
RTMsIDQgLSBESUZGMSwgNSAtIERJRkYyLg0KPiA+ICsNCj4gDQo+IFRoZXJlIGlzIG5vIG5lZWQg
dG8gZG9jdW1lbnQgYXNzaWduZWQtY2xvY2tzLg0KPiBUaGUgY2xvY2sgaW5kaWNlcyBkb2N1bWVu
dGF0aW9uIGJlbG9uZ3MgdG8gdGhlICNjbG9jay1jZWxscyBwcm9wZXJ0eS4NCg0KT0ssIEkgd2ls
bCB1cGRhdGUgdGhlIG1haW4gZGVzY3JpcHRpb24gYXMgYmVsb3cNCg0KLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3JlbmVzYXMsNXAzNTAyMy55YW1sDQorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcmVuZXNhcyw1cDM1MDIz
LnlhbWwNCkBAIC0yNSw2ICsyNSw5IEBAIGRlc2NyaXB0aW9uOiB8DQogICBib290cy4gQW55IGNv
bmZpZ3VyYXRpb24gbm90IHN1cHBvcnRlZCBieSB0aGUgY29tbW9uIGNsb2NrIGZyYW1ld29yaw0K
ICAgbXVzdCBiZSBkb25lIHZpYSB0aGUgZnVsbCByZWdpc3RlciBtYXAsIGluY2x1ZGluZyBvcHRp
bWl6ZWQgc2V0dGluZ3MuDQogDQorICBUaGUgaW5kZXggaW4gdGhlIGFzc2lnbmVkLWNsb2NrcyBp
cyBtYXBwZWQgdG8gdGhlIG91dHB1dCBjbG9jayBhcyBiZWxvdw0KKyAgMCAtIFJFRiwgMSAtIFNF
MSwgMiAtIFNFMiwgMyAtIFNFMywgNCAtIERJRkYxLCA1IC0gRElGRjIuDQorDQogICBMaW5rIHRv
IGRhdGFzaGVldDoNCg0KQ2hlZXJzLA0KQmlqdQ0K
