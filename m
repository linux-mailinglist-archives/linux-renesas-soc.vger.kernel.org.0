Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBA437333CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jun 2023 16:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbjFPOkH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Jun 2023 10:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjFPOjt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2023 10:39:49 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2097.outbound.protection.outlook.com [40.107.114.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4C92D73;
        Fri, 16 Jun 2023 07:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsYZC7ibkIfTNz2YxlLmFZAkw6t/8app7nx78sCWhY9+sA54ycl94yfPUCL3kNwWlhhuXUkVNHex5MEAuizbKiuOwiCSsewD3A79qV3O6y02S7rYlevpU5GepE7gGI+TnQpC+cbwR3hZ2gn/N0Mnn+iBL2GwDMm6V39FkCTAxwyi5Vbaoc4F/J5UjDmXjYFXm9jeIJySm+vQ/tq/ClBVzpgqpWMshhGpRpe6BbpeRrY3tCanm4bFHtwx8d2H4nf7d9QweJm+oOMcNevvG1mPdsh5hYZ70dKJUhitfGj7bC2zecL6R5DpI+rl5Nqj0dmwqb5t9WdZMjEvXiA81h8oqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J39yp0F4JlDNpGeRUwFwztDTn8Ws6Yal6rp+zDoDETE=;
 b=lUiGxPe3dGgVtgVxy6GSYIfgC9jIw86avbTTvFjF+hJftIl2ujxLTgLDhUbfULLDHJv+2/QpYocSeApy/SmBoiGFinc18/cqOoTU/h6RQhl4DbE/UJK/iNu8qRgTAOa097/8xhmaJI2sxsuzpTzdUHYa+HdNebky7v1qtYU8C44bffD/j9yyoUpJ8Re5857X+OAkKHRmrdCft8GKeTg880H1cuy189e4iITBJv45iB6oMA7knlygp7LjgT4uiK9/jcBZwbq9i0DCyfrH1EG2Pwl0AdCu76AwDsFSMuTVfPc1jmCUkDwKZi0I/vioqvrBe/x2teBDhUuPKzwAFyA0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J39yp0F4JlDNpGeRUwFwztDTn8Ws6Yal6rp+zDoDETE=;
 b=Fvai7kiU8ztN5etZrRwo8xUFTrZ2JGgAHO/sifeMYKroJjfgNI3CqHF95t09m/gg+Z/FG4/EMmo9G3Fy63iNkeXcTj26bzCb28R49ng6R2YAg/fsNvfWEecbRH85avuR2SOzbJQwGZongVbB3PJ5SdrdfTeBmFAMdiIpo52H87o=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8910.jpnprd01.prod.outlook.com (2603:1096:604:15f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 14:39:44 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b%4]) with mapi id 15.20.6500.026; Fri, 16 Jun 2023
 14:39:44 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Adam Ford <aford173@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [RFC/RFT PATCH] mmc: renesas_sdhi: add delay between tuning cmds
Thread-Topic: [RFC/RFT PATCH] mmc: renesas_sdhi: add delay between tuning cmds
Thread-Index: AQHZk420vzTI1Tm+AkuS1cC5buUvxK90cbUAgAA2oYCAGPAIAIAAAJIw
Date:   Fri, 16 Jun 2023 14:39:44 +0000
Message-ID: <OS0PR01MB5922D0CDBE265AE59695B8428658A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230531070049.11806-1-wsa+renesas@sang-engineering.com>
 <CAHCN7xJxROk6RU66PjbGH4M-R7PbUG-4y_2BHyCeGx_hTeUprw@mail.gmail.com>
 <ZHeHx/rUE7ORf3V2@shikoro>
 <CAHCN7x+hVSC=uCtaQx0tLZ6UdkYvf8B0DGQJ52Xr8WjWU=jGpA@mail.gmail.com>
In-Reply-To: <CAHCN7x+hVSC=uCtaQx0tLZ6UdkYvf8B0DGQJ52Xr8WjWU=jGpA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8910:EE_
x-ms-office365-filtering-correlation-id: 7e894510-1610-47ac-cea3-08db6e7786b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dQETDqVEohTgJeVVntIP+uHRseYYjgUEtpDW+zh6hGZbvdMQnfd3EyOFIVSvwPnSavDhC0EbY0aQ4AcFwkRL7vuFJ4Q0KFWcMrtf52Kk0TXxGARuoHzK3TYP+ZS+GqgGXQAKQ7oZzbMYeu9YQpZDWtBqIu1hCgS+RgCTVGwu16Rg6lsBoL0iYkw9uXs5O9Gdtv/LhPFZ0dKHBXuCaPvaLyziF8Fe9eAWiqSogD9KmzdMa1N21dC3OT3Hc5o4Lm31qz+pu6pTYwAHapWRCVKqi2N428HeQoAJqUBNq6Fql9zyhEL+pcrGIAGZpCBUx6VfHhcdHic13sTLpQO5jfNH0LBEZrmMeX/WHp1jwznz1kjYLRiE21bgA3oEXU7y7vcrCOtcQmbuGVqwKHvzaI1Byl4SiZSacPsyoREEEKNH3G8NVJbFfTVddhX7CK8lKYRcxLHFMWc1HF94zS6l47NXfe01c1UmyyrsgOiq3DurY53x6rAq7vvsf041PImY+3vOhU1HFbpmw+YDgSpTwOuhy/y93VjajXfvRFFECaLBnU6P7AcxynrX8mcr2q2mY7lT2ZUH7vSVoFyagk+lgzxgnQRk/Of3+T2ytUx5Nt6x0Q0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199021)(71200400001)(9686003)(66946007)(66476007)(316002)(64756008)(66446008)(66556008)(76116006)(53546011)(6506007)(83380400001)(186003)(26005)(7696005)(122000001)(966005)(478600001)(110136005)(55016003)(38100700002)(52536014)(8936002)(5660300002)(38070700005)(86362001)(8676002)(41300700001)(33656002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHNjblo2RUJBS01LQS9aWnl4dHVqZitWT0FWRUliZnd5dGZkVG9tRjNzOTEw?=
 =?utf-8?B?S1NROFpiRCtSTU5oR3Y5L2ViZzRVR2x0NUZBR3o5SUc1UVhjZS9zSzB3bDRa?=
 =?utf-8?B?YkRmdGt5MDhhVU11SmcvTWpsR2NJSzNnb1hKZ2l2c29IT2dpam1YQVZ4OUVy?=
 =?utf-8?B?M1VwWUlEUFRmODZ2aVhnSUV0clAyMWN6U3BlUUpmNTFvQk5Xem9UNXIvNHd1?=
 =?utf-8?B?TmV6M2pHeUJyU3ZTZFNML1gvMHN3dml5ay9hZFVBbkpSTFByYVJGNjRaM3hJ?=
 =?utf-8?B?eW5XQ0gyU0UxUGlIUjNmRG40Vk84RlIyUFlKcDRtMTBINkZDemMzTGdqSE5W?=
 =?utf-8?B?dERvRnRCWmQ1OUJFSjB2a28zdWpKNXJEMXp5Mjlpd0g3bTdhK1VlSUM0dlZP?=
 =?utf-8?B?K01xNHZFZlFYZHFrdjZKdmwxMGhXWGhNS3BCN3h5eDZqalZ6VVFrZC9pZytD?=
 =?utf-8?B?M2xnaW1sYTR5OXpHMlNjbkxOckRtcXBuM1lEbEZMVXpvTTVxYXd3WjA2VW5Y?=
 =?utf-8?B?WUVFV2VDTUc3bFZmZThSQkFuMHFzSFY5MmpVZDlwMlhxNXViTElnNy9IYTNl?=
 =?utf-8?B?UTJSclZPNStjaFcvaHlKVW9OaHhqQTZiN0J3M1lqM3RkZmhUbU4wLzlPNGFJ?=
 =?utf-8?B?Z1Y1RmhoRmo3VDJVQ1AwYit6SGRyeW9aZTROVC9wMFV0SXpBaGIyWHBBYllt?=
 =?utf-8?B?MU54RmFNdFJVV0p4TzM0bHhMSGMvaERoTWhwd3hucGc3Wnc5b21kQ1ZTUGh3?=
 =?utf-8?B?My9DNnJoT2VsaWk1U0hBeVQ2ZXAxeURCSFhsNEVmNjBrVDY1Snl0UkptbS9O?=
 =?utf-8?B?MGJJWFNJbW02T2pPOThlbXZ4TlJwTVRDZE14RnY3SWh2TisvK0llYU5FY0JU?=
 =?utf-8?B?Z281bUFSRlZZZmhERDBZVVlpVDZCUkQyVFRMUzQ1UnNUMTV0M2VjWnd1eTNh?=
 =?utf-8?B?cUt5ckZ1Nlo5RmRXREI1d01CK0hYOWNqY1RhY3VwaDBRZ3U2NWRXU1l1WVAx?=
 =?utf-8?B?RkEzaWp2QVdkQjhFWjBZRmFsM2M1QjZLRkliWnRHOW56QXM2NVdPcnY5RzJX?=
 =?utf-8?B?U2NBOWR1S29DTlFhditrOVdDWndENTlJZ1pxamR6OGRza1E2TWpBSFpVOWdM?=
 =?utf-8?B?aWhZbERPQlBYN0FGYmNieFdkSmswMUlnLzlXMW5aZEJvNStwSlpnRU9vZjdZ?=
 =?utf-8?B?ODZ4YlNEWjN3NkJ3dGNyVGxMN3lHTFppaFRoVit2ZlJtV2xUOTZjdWthSWow?=
 =?utf-8?B?d2tvcmpYempOUE1pN0NlWTgzZnUzSkxzOE9HSmxYKzZhUlIvQlVCZXg1UU9V?=
 =?utf-8?B?d0ExY3hlbXhKenhzRHZrRFNlQ3ZmR3hoeGhUQmo5VjNNWEhRZkhsVEx6anB0?=
 =?utf-8?B?SU1neTk3Vy9saklIdU5FMlBhMmpKazE3Rmt0c1RUN0lIOURpMGtnSkt4YXk0?=
 =?utf-8?B?L2Zpa1JQWTdBN0l0dGNLVVZMaTc5M3RIaitoQ24wQUFnRi9TdlJFVTZPV3Ix?=
 =?utf-8?B?MDhKZnQ3NlI5aXdHVm05dUtETkRnOExSWGZ3ZnN6UFVPWGZRNkxzU3F2RVZS?=
 =?utf-8?B?UkZDRXRJbmp4b1hIRjFTcThMV0ZUNGxSTlhKeUdxWE9UZXZvT2t1dGg2VWlK?=
 =?utf-8?B?WXVodUE3TlVac016RCtZT0xuR2RxWVBoblVIMWdtWXBDOWVMMWsvSUZROGlO?=
 =?utf-8?B?eStEVklHc1R2V2pRL1h4RDExSGZCdjFiY2xNTlh0OWZBdU5rMVlvSC9pRmZS?=
 =?utf-8?B?ZTN0bmltRUp2bjJaVDNOOTdRbmlBV2dMOGtMc0xCWEZuaVhLL2twR0M3ZktF?=
 =?utf-8?B?OGcyRmJuVEIxb3ZoRE4xTytSTGdNeGxORS9CdkJKVzQ4ZjBHS0thditYbnF6?=
 =?utf-8?B?MjA3NU1ZSkIvSG1va1lXSElpNkU4QlVVNUpVcWZQZGxzcTFPdVo1ckYwamdw?=
 =?utf-8?B?aCtzdmRVeElsckxNTHZQaUIySXQ1OXdBL0JWbkw5QWFoOHZCOXRPMGtSK0s1?=
 =?utf-8?B?OTVkUzBicklMdW1mVmoySnpLOUVVUm9OL1pTTmUvVVU3cVF2T2dpZ2hJWUVZ?=
 =?utf-8?B?TXNEdFIwbjBUVkJuMDBEM3laVU5xOXN2VEZ2Nm1JSVlDdGEzWitZZGFUdXpz?=
 =?utf-8?B?T0g3a3J3dkFlTFpCNkduT0pYVmZ3b0lQMCt5aDNSdkh3NGw4NGdTMWMrdEpI?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e894510-1610-47ac-cea3-08db6e7786b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 14:39:44.3280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GPJfkH2m1FFd09FLvGq2JO39DTO5jwAcGzFMwped6ikgW47qtQ5warFo/6eMAxukQIO7Tk5EG41OgkytMTrvic26r7ZhSg9lBTswvK8Ga0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8910
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQWRhbSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBZGFtIEZv
cmQgPGFmb3JkMTczQGdtYWlsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBKdW5lIDE2LCAyMDIzIDM6
MzUgUE0NCj4gVG86IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5j
b20+OyBBZGFtIEZvcmQNCj4gPGFmb3JkMTczQGdtYWlsLmNvbT47IGxpbnV4LW1tY0B2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc7IFlvc2hpaGly
byBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtSRkMvUkZUIFBBVENIXSBtbWM6IHJlbmVzYXNfc2RoaTogYWRkIGRlbGF5IGJldHdlZW4g
dHVuaW5nDQo+IGNtZHMNCj4gDQo+IE9uIFdlZCwgTWF5IDMxLCAyMDIzIGF0IDEyOjQ14oCvUE0g
V29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLQ0KPiBlbmdpbmVlcmluZy5jb20+IHdyb3Rl
Og0KPiA+DQo+ID4NCj4gPiA+IEkgYW0gdGVzdGluZyB0aGlzIG9uIGEgNS4xMCBrZXJuZWwgYmFz
ZWQgb24gdGhlIFJlbmVzYXMgUlogbGludXgNCj4gPiA+IGtlcm5lbCBicmFuY2guICBUaGUgZ29v
ZCBuZXdzIGlzIHRoYXQgdGhlIGNhcmQgZG9lc24ndCBoYW5nIGxpa2UgaXQNCj4gPiA+IHVzZWQg
dG8gb24gdGhlIG9sZGVyIDQuMTkga2VybmVsLCBidXQgaXQgc3RpbGwgZG9lcyBub3QgZW51bWVy
YXRlIHRvDQo+ID4gPiBTRFIxMDQgc3BlZWRzLg0KPiA+DQo+ID4gVS1Cb290IGhhcyBhIDFtcyBk
ZWxheS4gQ291bGQgeW91IGluY3JlYXNlIHRoZSBkZWxheSB0byAxbXMsIHBsZWFzZT8NCj4gDQo+
IFNvcnJ5IGZvciB0aGUgZGVsYXksIGJ1dCBJIGluY3JlYXNlZCB0aGlzIHRvICB1c2xlZXBfcmFu
Z2UoMTAwMCwgMjUwMCkgYW5kDQo+IGl0IHN0aWxsIGhhbmdzLg0KPiANCj4gSSBkb24ndCBrbm93
IGlmIHRoZSBpc3N1ZSBpcyBkZXBlbmRlbnQgb24gdGhlIHZhcmlhbnQuICBGb3Igd2hhdCBpdCdz
DQo+IHdvcnRoLCBJIGFtIHRlc3RpbmcgYW4gUlovRzJNLCBidXQgSSBjYW4gZG8gdGhlIHNhbWUg
dGhpbmcgb24gYW4gUlovRzJOIG9yDQo+IFJaL0cySCBpZiB5b3Ugd2FudC4NCg0KSSBhbSBkb2lu
ZyA2LjEueSB0ZXN0aW5nWzFdIHdpdGggYWxsIFJaIGJvYXJkIHZhcmlhbnRzLA0KWzFdIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NpcC9saW51eC1jaXAu
Z2l0L2xvZy8/aD1saW51eC02LjEueS1jaXANCg0KSSBoYXZlIGRvbmUgU0RISSB0ZXN0aW5nIHdp
dGggUlovRzJNIDEuMyBIaUhvcGUgYm9hcmQgYW5kIEkgZGlkbid0IGZhY2UgdGhpcyBpc3N1ZS4N
Cg0KQ2FuIHlvdSBwbGVhc2UgbGV0IG1lIGtub3cgaG93IHRvIHJlcHJvZHVjZSB0aGlzIGlzc3Vl
Pw0KDQpDaGVlcnMsDQpCaWp1DQo=
