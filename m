Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399B145D1FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Nov 2021 01:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345505AbhKYA2U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 19:28:20 -0500
Received: from mail-os0jpn01on2120.outbound.protection.outlook.com ([40.107.113.120]:37454
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345391AbhKYA0T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 19:26:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5vjH++vCgDsvvYiO8eDHAYVSJ6LMn20mlwihUNM4qGn6JLUHgYIDOm5waGnex5sjMZ3rs3HhsfEFWekjmyUSxHsDVJ/g/ihVwgvC+Dm2Cya11c8lRvX9BW0OqU4+rExV614oFUrq338ETxYC10sDUa7Yk7q+O/THTegvza46Cr1NNkKcqLmqF/mw3QCXns/vi3ZQDWAxBJkor5NtJF6+gOo0WSKwXeePWEipvTNQHZjJpM7s8642zX3gbgU9/U/JnXe5HzvnFHSolKEe74lwM9EawCRN9+kBD7Hs9X74YwQLI5TLsHxRnVAdLAC88DAX/ykmnJKzY17eXHH4CQKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lGSsex/CwZ9JX8qBNsN9lcRgCqu1djcopJ6xR0qhWA=;
 b=HxlBA6axSgO4MvF9HCGRm3idat91zTjzpILg1yEnV1yAL6IJT58PJmeAvhGEBxIJaWvQI3duRVn3HbecKv5H+sHSAN4YORNAhDLa+W8qp8UlDDmL0lHFSLzoM+O4wUB7Yqkl+v8xPubM0RqQOwJ8eSfmPo7uBpEq7M74o8bg6vIA3gXMdeWYjDqYn70O/Jh/yWUuvYcLUpfhq6r4ffjMau8X75iTfMdgR3NYGrvQXXXZ/6bXqulnPzZQSKs4lGGIfS5sFdKPonmF+xeqqZg6bvoRXHDOYdHIkLCzliI9DBbx0l8ZiEN/qIVEIECyl58QZLFKQefmOqE7kU+Q4s1GvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lGSsex/CwZ9JX8qBNsN9lcRgCqu1djcopJ6xR0qhWA=;
 b=n687SDHXo1OqthVwT3rBHjQsxVyOL6FblzNghmm0Ha0mLjNhvWQPWbMm86Yssbg0mL4q7ULE/W64pJbeB1UPl42W2QrqdRsPxda1e1aryfZh84U4Hlp25O7yENoDnxckAFyUeKS9RAJ2wcHwRtTY0aydVCb/QzrhB5uQsaFuh3E=
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com (2603:1096:400:a::10)
 by TY2PR01MB3868.jpnprd01.prod.outlook.com (2603:1096:404:d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 00:23:06 +0000
Received: from TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::d5f2:c948:3e2:ff6b]) by TYCPR01MB5581.jpnprd01.prod.outlook.com
 ([fe80::d5f2:c948:3e2:ff6b%9]) with mapi id 15.20.4713.026; Thu, 25 Nov 2021
 00:23:06 +0000
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: HDMI isn't probed on v5.15-rc1 on ULCB+KF
Thread-Topic: HDMI isn't probed on v5.15-rc1 on ULCB+KF
Thread-Index: AQHXumBA9Ogm9LZ2+0GY63D7tblfOKvHf6qAgAAQHACAACsdgIApOr0AgAJADICAH8mPAIAAsMzQ
Date:   Thu, 25 Nov 2021 00:23:06 +0000
Message-ID: <TYCPR01MB55810D57110CD65672646EF2D4629@TYCPR01MB5581.jpnprd01.prod.outlook.com>
References: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com>
 <YV5vB4c8J0xu2mOd@pendragon.ideasonboard.com>
 <87v929moad.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUxXP86Z-2Tb8t4bK6aBfRT1Toj0jpruEEd8YbeDL+h=A@mail.gmail.com>
 <163585809096.275423.10804585086979279969@Monstersaurus>
 <87bl302598.wl-kuninori.morimoto.gx@renesas.com>
 <YZ5CuiCyNDE7IyNm@pendragon.ideasonboard.com>
In-Reply-To: <YZ5CuiCyNDE7IyNm@pendragon.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d68e4f1-fac3-4007-5be9-08d9afa9c0c6
x-ms-traffictypediagnostic: TY2PR01MB3868:
x-microsoft-antispam-prvs: <TY2PR01MB3868EC6850C289ED9CB7C55DD4629@TY2PR01MB3868.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fcqjQ7LFVMAeHoKNq+xOaeXKzoRIfsgf1cY5IyX9EQAbhRpZPOfb3X6LtJaHUniQAwpCSt+cQY/lRamGe1Lryh9p7i9AGY7aky0DuhWRG0HIFcCy5ivlGpYaEzx135pLK9YmApmeZgwa1i6w4SZm/sAF8/M4asGNlGqf5Eakcd1BNQwPwNQqUv/qiaxyyHWIS3lkAX7y6oL7fY59EVqNxUqr5Mhpwm1OqjyaeSwd3BR0XyHxILZt44loOgbo4QSJJ4PWQISGptgSl/vS15o2Z2iLzuV1nzrbq9yQEnXaX+C7rgba7zrCByeobeeTDdsFnmDplXc4wQOmLBiVcKyBdjLB8PVOOTlCkFROJpLehcllvquBgfWrdhchiV7EhokZTrhPxDNNVKgNDQP9cwjeqg8T/wGMJZ4G3y/uBleHkTdDjW98dvLsQAc6cQq/7SF34ps0MDI4uJoXFbYT6nVn3QJjeo7r8RXZ3dL0T6UETlikvrMLKx7vO53IYFOfKq6+N/YBId4ZH9OrrkIXtn/yZSEDip2TJ39bPX4U8a/VKqmMQT/NIXekgBCUyh7iC8gPZtEWhO7qrtOZxalbac6hO7BEevk9TYjRSiV60WRd/2GfwhzmP8a/yxm9CpHAfI3zf9tASOn2uYwS4KCbQZmIYXzlFxVQPowi1H8bX9n4stkjaUaGzBbnKiQj94FmG88635OJLShn1HwjBIwyK+0eEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5581.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(66476007)(9686003)(71200400001)(66946007)(122000001)(86362001)(6506007)(66446008)(64756008)(55016003)(5660300002)(66556008)(26005)(8676002)(33656002)(186003)(2906002)(4326008)(6916009)(38100700002)(8936002)(508600001)(52536014)(558084003)(316002)(38070700005)(7696005)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bExtNUsxcFR4Q1c4cmtHS2RhRTRvbnZvUDRoTmJjcW04V1dWUDNBYlE4aUhq?=
 =?utf-8?B?UWo0RlN5b1drb1puTnprSFhHZC8xUUR2NlNYRnJZMElSclFXbWkxblBwTEx4?=
 =?utf-8?B?Zk0zeURKMlIzVnRpT0N6VURsdWNFTEFOT0Q0YXNTc3o3eEpEajA5RXYxVm43?=
 =?utf-8?B?THJnajNWTEJTTllIM2dpWnlIRGVrUFZxVzBCRlgxNi9JUUhJdWlLL0k5dnRB?=
 =?utf-8?B?MHVzQUdKR0RKYVNjc0dOaGEzeGszK1BzeDVVY0lwaURrS2NnZGRoZHRQeTdO?=
 =?utf-8?B?WWVkeVE2alI0U05oc0piRmxpRVAvT1I5M0pER05QUnBuSjRaRjdDQzYrY1p2?=
 =?utf-8?B?NWdaQi9HSjZmdnljZjRRT2VOZkhuNTJBV2c0Wm5heGROTm9FRTJpYkJUemwr?=
 =?utf-8?B?ek9JaFFKcUo2N3gwR1NrOU81dTlzTGRtbFY2RWxEL3liZ0MwRDJjbGpON1hC?=
 =?utf-8?B?OHVCb1R6WG1oVHRxMFd0RUtFaU9xWXB4aU9wZUpmTkg0NnhLbUhyMm13VUV6?=
 =?utf-8?B?Umw2UlVwTFFsLyttNlFPMzloU21OeEJ5REVmZjJGTDk5UklDTWZPMmZYUnpq?=
 =?utf-8?B?SFB5aWM4OG9rWTNRUkpoVDI1bWpVVy9VS3BQSDNBaDFUWnNqVThMV05iK085?=
 =?utf-8?B?WVZaUUNCeEhNL2F4K0F1eXVQcjhzd01rRWFmQjFWVy9ZbTFpTTc4aDNmbU1L?=
 =?utf-8?B?M3VEYnJ2M2RXSWZVOGFicDRXbU0xRStGS09ERUZkT1IrTU81ZWh3Y0dSRk9N?=
 =?utf-8?B?aWdXUlc4TWZzNHBlTWhoVTc5SFNmL09BL2RkRC9RMFNIOVdndHF4T20rWkxU?=
 =?utf-8?B?ZUxhenVzaWt4SnhJcExrZXFialo5Z2NJbTJpdThreWJMY3pMdTZINkFRWjMy?=
 =?utf-8?B?bEQ1T0VoZlNpV1BZc05VNTBzTkV4THpkdVg1cjIvUDJDemdkNGEraXNzU2xz?=
 =?utf-8?B?NTBhRDBNU05reTBtSWpwTUsxTGFoN05IRUdiWHByd0FwQy9keE1YWHd6bFBF?=
 =?utf-8?B?bDVFeEJlOHBJUEVBQzY3ODlBTGhhRlBpQzJjOFpwR2xJZ3hXR212WnQ1SDFa?=
 =?utf-8?B?K053bHkwOEJUZWxLQTFZYVJ0Y3JEUjFoSlJYcjFuM3Z6KzZuZ1NWTnVKRzRV?=
 =?utf-8?B?ZVBxLy9rMFg2OU9UaEZlZFloRlFkTDk1TUd3OEhUZmgzVDJZYitkWmNGTzBx?=
 =?utf-8?B?bjdyZ2hERllMMm1ScUxHbGdESUNrOUlXWUJEd1pRS3lYYU5QVUVUb1B0Slc2?=
 =?utf-8?B?N05USVFpeE1Md2h5TDBjOGRBT2JITG92eEx5bjdVN0dPZUFWSUxKeHhaT0tE?=
 =?utf-8?B?OCtmS0M5QmRjSTRuYXBzblZoV3lIVXo1Zmppai9GY2h4TkRscXBOY21Gdm5j?=
 =?utf-8?B?Sk5BcjVTYXJDMWVwWmFuNk5pSDNrTXpjN09qT3NxbnJ0SHhJYjZmUUhpYXFS?=
 =?utf-8?B?bGpTRitaWU1ZSmRlMmJleFp6d1FJdEVhN2VHZ2d6NWVlYWxZZ1dqRjBoUHNS?=
 =?utf-8?B?UjFDbTZCeTN3TThSWXBBVVlKdEpLMWdaM3NaS0tKaXBsdHdRbUc0YWJ4U1lp?=
 =?utf-8?B?UXlTekZ5T0hkVzNNTmxCTGJRN2FlSFo2TEVDZ041ZG1SNVZWNTk1djZXZkl5?=
 =?utf-8?B?R203ZDlwUUhBdEhscndveWlERksweGxXRUJPWHVZcVBBSitpSTZraHpyUjJo?=
 =?utf-8?B?UVI4dTNhUFExejREeWJaMkE1ZjRZTlU3L1UyVDJsdzVpRy83Nk5lbm0zTFFj?=
 =?utf-8?B?U0pSdU9vVE1XeEhZNGhvQk1vY3RUK1Zrd3ZCQ2lvWSs3cTQxWjFnSWNWUXdv?=
 =?utf-8?B?RXp0T2VKYlZpQmp2TThpNkZSTHdiakxOdWo5VjFtM2k1TkxTeW9WRXJjYlM0?=
 =?utf-8?B?bUtodWRib1J1L1FPYXB4OFJJOFp6b2tSMDNnM2FoMTdKL1Z5UFZob20zeGpt?=
 =?utf-8?B?NXZNeWZ6UXR2TUtkZXFpR3gwaXBzZHRRQWNBd3F0VzJaZWJSeWpIWkt1ZldH?=
 =?utf-8?B?THpkUXIvMHgrclRldit0K0p2bnVUQmx2OWhsQmNuZGtjOGNyeUM5UEVGQ0tv?=
 =?utf-8?B?NVYzUjE4Y0JuTDY3Zk10OUxVblBlL3NBZWZJUzhDZSt1Rmk2VlZhZUVqWi91?=
 =?utf-8?B?QWpIaWNiOHVrUlNkdmVFNW9ISXlsRnI4b0JpUEZvNFZEcEU4Ym44YkZtL3JS?=
 =?utf-8?B?Q0kxNVlxVk1KcnhYRDhSK2dZQ3MrczNiN242N3cxTER1WUdqZ0JYa3ZJUlJ2?=
 =?utf-8?B?NWlNQVVTeklmYThYVkRIdHl6SVA3V0lHNi9uckIvcEUwU2pIRjl0c25DaTlJ?=
 =?utf-8?B?V2JpWVVpZklIcFZPTG5paXVZQ2NCUmxsU3gycW9WSThKRTlQcVptdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5581.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d68e4f1-fac3-4007-5be9-08d9afa9c0c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 00:23:06.7278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z/8x6oEEze/9tLtX0A+SEGXWTZt1qNd60RnittW6p/e+WBHOBlYn781a7z56H8oKTVO2CdnPYWcPw2EOm9dAyzNWT4rkKKDi/mZCrUREgu1Cv9OHztYnngeqYgHkQ/G6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3868
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpIaSBMYXVyZW50DQoNCj4+ICMgQ09ORklHX0RSTV9ESVNQTEFZX0NPTk5FQ1RPUiBpcyBub3Qg
c2V0DQo+DQo+IEVuYWJsaW5nIHRoaXMgb3B0aW9uIHNob3VsZCBoZWxwLg0KDQpUaGFuayB5b3Ug
Zm9yIGhlbHAgbWUuDQpJJ20gc29ycnkgYnV0IEknbSBidXN5IGluIHRoZXNlIGRheXMuDQpXaWxs
IHRyeSBhbmQgY2hlY2sgYWJvdmUgYWZ0ZXIgdGhhdC4NCg0KLS0NCkJlc3QgUmVnYXJkcywNCg0K
S3VuaW5vcmkgTW9yaW1vdG8NCg==
