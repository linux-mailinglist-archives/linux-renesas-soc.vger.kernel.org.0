Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC5CC6B0D29
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 16:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjCHPoX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 10:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbjCHPny (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 10:43:54 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0C43E085
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 07:42:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCSK2V+YTS82v5H/qND1PlpXR1iMyiTH6Iff5ZJkyeGy7LJFo2rQpvpbvBBwOiHgg1soCFCbMFDdts2gzjQmw9pBIszXW2oeEEesIco1azKYTjulZ+wF8MXIxzLNQWW5J3S7xugSD0wNGboj5TsIu6rodeKdruqYLMc08+Vcv4w9kc5N5o3PaHJ/LKUF2DvdC/Yk4ROgoKEPkixrLFjjCGJSaNIPmE9a7wHb/hEtEQzqtEFkkjtMmd+H6Hapi9kvHi/4kGmNLzPZqGETv642AO4jQlGF0URVZ4A4PavbEGWP6q7ighYsExiuMjoQcJkufm+q65om6u40hcSufs5kDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOTGcviFHa0/Zhxfs7etMstM4VRJn/Mvd2XMfOiRqiU=;
 b=kJvXYnMP7hAKmFFVw0/dkeOnD1+bz5xpR+ugTvyzzrlChXqib6hxvQZiHj0tNdALvT3wGJFP/Kpy23IUeAVAB7Ijdx7i6R5XiaCCwNTXrvWOWlzuZ7hDiVEDJtxd5+yUbZF2YmZyH6K4lyhdE1Mu92Asc9Xbyz+q169AvMWwsurCeLMs00aK+6TCqWii8HnFuauAkx2N9jKNPhx+jukqgM7pLu2QH/sEuj6wUQwJCNbpY1//2E4WZ10jwgpJpHQHoFaBvL6GrUxT0Ak+Czu84y7xVKy+5OIUMdiEu4o+iOLypZ/rZrrZWm2vq6FKaiksWEBhhgz9tiyM6saey6YpxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOTGcviFHa0/Zhxfs7etMstM4VRJn/Mvd2XMfOiRqiU=;
 b=wmhnvGAwn/sGiuGx34NneYdeXvh3DUi7RE5Gs7vqLJZm/kebRgEYAnlIbRo0omt5S9em6oh/nfhTN1vQ0/ePQcwmlHQ0nzoc9qI/1S3tfZilwbZ/UHvUrZPCxXJAS9Au2kK5NFaaceDAyB/knPz5lpOe5AJevwStGicnoKBRycA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY1PR01MB10769.jpnprd01.prod.outlook.com (2603:1096:400:322::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Wed, 8 Mar
 2023 15:42:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.016; Wed, 8 Mar 2023
 15:42:31 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        William Breathitt Gray <william.gray@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v13 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
Thread-Topic: [PATCH v13 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
Thread-Index: AQHZQkatRWA/pEQLxEGWUdoxs5QyVK7q5cgAgALDb1CAA1eDAIAAF14wgAAKHoCAAAHqgA==
Date:   Wed, 8 Mar 2023 15:42:31 +0000
Message-ID: <OS0PR01MB59222AF14C31F92A942F905786B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230216203830.196632-1-biju.das.jz@bp.renesas.com>
 <20230216203830.196632-3-biju.das.jz@bp.renesas.com>
 <20230304162000.GA2574592@google.com>
 <TYCPR01MB5933B070FDB6FFCD60B2FEB186B69@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <20230308133400.GI9667@google.com>
 <OS0PR01MB59228C7F4A86DFC8A58C71AD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230308153351.GR9667@google.com>
In-Reply-To: <20230308153351.GR9667@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY1PR01MB10769:EE_
x-ms-office365-filtering-correlation-id: 997d200d-1e02-4384-7a16-08db1febba97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H3c0kQfmEb/HIHNS512LHAGGkM3Zz4KE/BWjUO0wBjZ7gi3BpWD8p/D22swK9BmwtQyrF2JUmAKo7mlWAKytNwNybEVsUyh3f9wryYjZcq7T9rhxPAZn+AExbykpR5A2rXDguAgi0NXlxovAoroXzAwaHK/JYa9Wmnyk6OKA5hr/h0y+e66SIshVGtv5PDCXIw3nOoVEd+IBx1rZ9m2Q3COdl8Q8cj2HQavVBbB3Ia0Zboiy2p77pn2poLEl0vZ6ykGL8Ah1EQiE8eV1BjzOVZsfaChQ2BZpHdiT49UIt8LnWqWoaoMaOSoUXMHorR+dEbu5bXjbTS5V5i7C/fKtAzlm8XVCy9t4F+eS9Iy1pVCFfCgbr3egP3XkOaILQmHDR3CqnDgqG2vRnZrROvKe4njuX5CYMYu3HZrrq1lLEn60y4q61kmUtZjMaM3MZmJXLxuCMh7zACJ4tJLS7jDkx3YfiDdPrXjmLYcyitrsGdhO2R3aEM6dlu3zH0ozHws7biBVVmPKgwWgnK0vnqqLNqrlYmKJb0zPmb9C7h9zx8kO/+CUfKc1k09qlAnW1tw2fX4pbYefYJUv6xvh8amL/b3O7N770TxxZD9M4tzUKoFNu//GX60Eiyi4wa/fuGZuQyNWbVIi9mbuaUVKFYEe0lxOmPJfTTtiQjCT3RqJ9+qbd2q4iZEdLtRo3iZZJkvppVCP3cxLmbFzyhv2DAzzTFYjxVPEDZa7EaSQR9R4yZo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199018)(83380400001)(33656002)(478600001)(55016003)(54906003)(122000001)(38070700005)(316002)(38100700002)(71200400001)(186003)(6506007)(7696005)(26005)(9686003)(5660300002)(41300700001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(52536014)(8936002)(8676002)(2906002)(4326008)(6916009)(86362001)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0ZlYjI3Qk9xYldzWHR5RnhpOXBDdVJkWVp1VityOXpYUmV2YkJJSDY2N0VX?=
 =?utf-8?B?S0YrdDRoRkRWNk81RnVMbXF6ZnRLNjlWbWk4L29wMUJBSjQzdzEzQit0RzhC?=
 =?utf-8?B?TnJFVXpCdjRJK2UyT3lidWhBVkphc0NqK2tQb2dXSlFLQ3laaVBFVC8wSXNH?=
 =?utf-8?B?UWx4bGRvNzBJNlRhVEFhdk8zeFoxZjFmNjhrNGFLbFJsTFRVZmtHbllYelA5?=
 =?utf-8?B?TEJrVGQwNXlrUEZkQW1NVC9WMFVuTTdXNXhyc2lSdGpxQ1JEeEdlNVlhWEhM?=
 =?utf-8?B?V1BPcEt0OEErVnA2M3lIaDR0RmVKZ0N3Mm1NQ1l1YS9QRi9RVDIwTm9zYlNr?=
 =?utf-8?B?NzVyWEFaQ3ZpRGNrQzcvWDZhT0F4UmJ6bGN0VE5FUWY4Y3NMa1ZJMy9XTnFS?=
 =?utf-8?B?eTRFU0d3b1hvbHRwb0lxb3Rsa0dLQTJtOU9aZE1HSzhSR1NCZlh2N3FaUVRW?=
 =?utf-8?B?UHdlU2NvUzdQZmdhUEZzUCtLb25vNUtZL1FrYktKc29VQVJiaUhZeVRUVENm?=
 =?utf-8?B?czNkaDhvR3FhTjdOK3VsT3hCdjA2VjlwdGtzeUpsSjB6cUFSdFhOc0wzVFkx?=
 =?utf-8?B?dTh4SlZYN3lkWElVQnQwV0VEZmlYUGYrM2xtMUlRWWdFdHFkcW9takxySENR?=
 =?utf-8?B?VkRabUFHL3pabU5zR1NJUmhDdEVIMHducEJHUHpmVzdGQWczOEo1UDdCR2Vr?=
 =?utf-8?B?Yk9oaXZ6QnNlUi9ZaGJqS2ROc0VodEVrRHBVd0ZTejZLWDRHUTRvZEFLMXVr?=
 =?utf-8?B?NE9NbGlJWHRzSXVucGpkV2w0RWtCTkZEZDF1cVVBQkhpNnlxK1lEOVVNdkNs?=
 =?utf-8?B?Mys3dTc0WDZOYit5TG9hQTd5V2dFR01EcUpBYVFOZjluM0lXdmVtNEhORzRX?=
 =?utf-8?B?REtQdm1VcnQ1SXZQRUtEWVMzcm9Nb3JmVDRzcjZEa3BGaSt3TzF6ZGl3bmNV?=
 =?utf-8?B?eVI3K2RNdWdYcEtSeW9sQnE2V1NwUnB3UUxkS3hQNDN1WGl1Q25uV2tvZDFF?=
 =?utf-8?B?V3R4OFFTVWJ0czVIdGs3Wk9iV1FIMHdTZU5sNkJLcFgvRHFRbHVMTjMxRStE?=
 =?utf-8?B?bnNPY1BtNEI1TURzczhFWHFiczRndnpEUEFHY0VuL0dTUVZFNy9uZGQvTTQ3?=
 =?utf-8?B?ekx6RTlnQk9lTGJTOFVHSE1GR1hBdDN2NlJmL2d0cXNhK1hRMGpFMkY1TXdj?=
 =?utf-8?B?a1ZCWnZTQnlFejluSzFySDlkN3dXcUNaMmJFekcxNTQybzgySTZIYzRpLzIr?=
 =?utf-8?B?bm1MM1F3b29UYzhiUWhWQU9INWQ0VEg2dDVudlVSQ0NwYXNlVFVnY3ZocjdG?=
 =?utf-8?B?Zy9FbUltWFVMOTVLOUFvK1REZkVxOWljandwMUtQWUNVOTU0TCtDbXp2aWh1?=
 =?utf-8?B?dkFjeUJiUWVnRWl2Qmt0SER2ZTRCVDI5bk9mbzU2ZVhLMG9RNnJqZmZQN2VS?=
 =?utf-8?B?TVJHYnUrb2duaFJPNHUyRG54cjZIa2JOUUs0WTMrUmFnTkhXUnpSVTlIelNY?=
 =?utf-8?B?MTl1RkJ1K2xiRDJPSlU3dDhGaUltWEhkN3d4ZDMzYlBBcGxmOWZaNmljU0t4?=
 =?utf-8?B?Q0lHUjRrNkk1ZE91Z3NRNHY0L0Z6ZERhR0hyYm05MXFqOEttUCtiek1UZU80?=
 =?utf-8?B?dmliVEJDaG5sKzRwRXBOaGQ1QTc0dXRYRVBGdzFEdlNZWWNDTmw4dXFFMm1y?=
 =?utf-8?B?cXJobktWN1ErdlBIeGN3b1Izc2ptVVUwTjk2Z0s1U1cvbkplRG5ya09yaFVk?=
 =?utf-8?B?eHVlV0pzZk9RL2R3d3FreUxLK05Ud1dwTnlteHhabkZsTGFoNVJlTXdhazc2?=
 =?utf-8?B?K3Z4Znd5VkJrZHdCTEQ2eCtoZHUvSnpnOEtKdU4xVmt1VGJjT0t2dDNUekZu?=
 =?utf-8?B?YloycUk0QzdOQStsdDFxY0RUTk9FekpHQ3pYUUlxWkg1N284Y3AzUTBWaTRQ?=
 =?utf-8?B?ekpKbXREeUhUbm90NXR4Vzg0KzlkWmYzRG5CRCtwOTVzWmNhcEZRK0FsT2c4?=
 =?utf-8?B?LzFoNEU3U2l5N1ZBNzI0NndjQ3MvM2FyQ2lOVDRtdVF5Y3JIVDM1Tm1LT2cx?=
 =?utf-8?B?YTNRbkZ2b1lIWTdaenVzc3FVNW5TVkYzTTM5MUUwMHBmR2d4MnhjUnpVSS9M?=
 =?utf-8?B?aFFLcXlDb1JGYXFwd0hkVmF5RExYd2hYeW1XWHJFNlN0N1FMMmR6cXJGeHJa?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 997d200d-1e02-4384-7a16-08db1febba97
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 15:42:31.1009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NlZy7lLxuCDiPHmvxWSYMJarevC0O+gJgFj+91NFct9BcVJxQB6C7Oh+6ROIG8G8IiLjsBACBzWjyWueD5nssaQ3B8R7Kv9qUgYycN8mRnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10769
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGVlIEpvbmVzLA0KDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTMgMi82XSBtZmQ6IEFk
ZCBSZW5lc2FzIFJaL0cyTCBNVFUzYSBjb3JlIGRyaXZlcg0KPiANCj4gT24gV2VkLCAwOCBNYXIg
MjAyMywgQmlqdSBEYXMgd3JvdGU6DQo+IA0KPiA+IEhpIExlZSBKb25lcywNCj4gPg0KPiA+IFRo
YW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYx
MyAyLzZdIG1mZDogQWRkIFJlbmVzYXMgUlovRzJMIE1UVTNhIGNvcmUNCj4gPiA+IGRyaXZlcg0K
PiA+ID4NCj4gPiA+IE9uIE1vbiwgMDYgTWFyIDIwMjMsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4N
Cj4gPiA+ID4gSGkgTGVlIEpvbmVzLA0KPiA+ID4gPg0KPiA+ID4gPiBUaGFua3MgZm9yIHRoZSBy
ZXZpZXcuDQo+ID4gPiA+DQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTMgMi82XSBt
ZmQ6IEFkZCBSZW5lc2FzIFJaL0cyTCBNVFUzYSBjb3JlDQo+ID4gPiA+ID4gZHJpdmVyDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBPbiBUaHUsIDE2IEZlYiAyMDIzLCBCaWp1IERhcyB3cm90ZToNCj4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhlIFJaL0cyTCBtdWx0aS1mdW5jdGlvbiB0aW1lciBwdWxz
ZSB1bml0IDMgKE1UVTNhKSBpcw0KPiA+ID4gPiA+ID4gZW1iZWRkZWQgaW4gdGhlIFJlbmVzYXMg
UlovRzJMIGZhbWlseSBTb0NzLiBJdCBjb25zaXN0cyBvZg0KPiA+ID4gPiA+ID4gZWlnaHQgMTYt
Yml0IHRpbWVyIGNoYW5uZWxzIGFuZCBvbmUgMzItYml0IHRpbWVyIGNoYW5uZWwuIEl0DQo+ID4g
PiA+ID4gPiBzdXBwb3J0cyB0aGUgZm9sbG93aW5nIGZ1bmN0aW9ucw0KPiA+ID4gPiA+ID4gIC0g
Q291bnRlcg0KPiA+ID4gPiA+ID4gIC0gVGltZXINCj4gPiA+ID4gPiA+ICAtIFBXTQ0KPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+IFRoZSA4LzE2LzMyIGJpdCByZWdpc3RlcnMgYXJlIG1peGVkIGlu
IGVhY2ggY2hhbm5lbC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBBZGQgTVRVM2EgY29yZSBk
cml2ZXIgZm9yIFJaL0cyTCBTb0MuIFRoZSBjb3JlIGRyaXZlciBzaGFyZXMNCj4gPiA+ID4gPiA+
IHRoZSBjbGsgYW5kIGNoYW5uZWwgcmVnaXN0ZXIgYWNjZXNzIGZvciB0aGUgb3RoZXIgY2hpbGQN
Cj4gPiA+ID4gPiA+IGRldmljZXMgbGlrZSBDb3VudGVyLCBQV00gYW5kIENsb2NrIGV2ZW50Lg0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gUmVmOg0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiB2MTItPnYxMzoNCj4gPiA+ID4g
PiA+ICAqIE1vdmVkIFJaX01UVTNfVE1EUjFfKiBtYWNyb3MgZnJvbSBwd20gZHJpdmVyIHRvIHJ6
LW10dTMuaC4NCj4gPiA+ID4gPiA+IHYxMS0+djI6DQo+ID4gPiA+ID4gPiAgKiBNb3ZlZCB0aGUg
Y29yZSBkcml2ZXIgZnJvbSB0aW1lciB0byBNRkQuDQo+ID4gPiA+ID4gPiAgKiBNb3ZlZCBoZWFk
ZXIgZmluZSBmcm9tDQo+ID4gPiA+ID4gPiBjbG9ja3NvdXJjZS9yei1tdHUzLmgtPmxpbnV4L21m
ZC9yei1tdHUzLmgNCj4gPiA+ID4gPiA+ICAqIFJlbW92ZWQgU2VsZWN0IE1GRF9DT1JFIG9wdGlv
biBmcm9tIGNvbmZpZy4NCj4gPiA+ID4gPiA+IHYxMC0+djExOg0KPiA+ID4gPiA+ID4gICogTm8g
Y2hhbmdlLg0KPiA+ID4gPiA+ID4gdjktPnYxMDoNCj4gPiA+ID4gPiA+ICAqIE5vIGNoYW5nZS4N
Cj4gPiA+ID4gPiA+IHY4LT52OToNCj4gPiA+ID4gPiA+ICAqIE5vIGNoYW5nZS4NCj4gPiA+ID4g
PiA+IHY3LT52ODoNCj4gPiA+ID4gPiA+ICAqIEFkZCBsb2NraW5nIGZvciBSTVcgb24gcnpfbXR1
M19zaGFyZWRfcmVnX3VwZGF0ZV9iaXQoKQ0KPiA+ID4gPiA+ID4gICogUmVwbGFjZWQgZW51bSBy
el9tdHUzX2Z1bmN0aW9ucyB3aXRoIGNoYW5uZWwgYnVzeSBmbGFnDQo+ID4gPiA+ID4gPiAgKiBB
ZGRlZCBBUEkgZm9yIHJlcXVlc3QgYW5kIHJlbGVhc2UgYSBjaGFubmVsLg0KPiA+ID4gPiA+ID4g
djYtPnY3Og0KPiA+ID4gPiA+ID4gICogQWRkZWQgY2hhbm5lbCBzcGVjaWZpYyBtdXRleCB0byBh
dm9pZCByYWNlcyBiZXR3ZWVuIGNoaWxkDQo+IGRldmljZXMNCj4gPiA+ID4gPiA+ICAgIChmb3Ig
ZWc6IHB3bSBhbmQgY291bnRlcikNCj4gPiA+ID4gPiA+ICAqIEFkZGVkIHJ6X210dTNfc2hhcmVk
X3JlZ191cGRhdGVfYml0KCkgdG8gdXBkYXRlIGJpdC4NCj4gPiA+ID4gPiA+IHY1LT52NjoNCj4g
PiA+ID4gPiA+ICAqIFVwZGF0ZWQgY29tbWl0IGFuZCBLQ29uZmlnIGRlc2NyaXB0aW9uDQo+ID4g
PiA+ID4gPiAgKiBTZWxlY3RlZCBNRkRfQ09SRSB0byBhdm9pZCBidWlsZCBlcnJvciBpZiBDT05G
SUdfTUZEX0NPUkUgbm90DQo+IHNldC4NCj4gPiA+ID4gPiA+ICAqIEltcHJvdmVkIGVycm9yIGhh
bmRsaW5nIGluIHByb2JlKCkuDQo+ID4gPiA+ID4gPiAgKiBVcGRhdGVkIE1PRFVMRV9ERVNDUklQ
VElPTiBhbmQgdGl0bGUuDQo+ID4gPiA+ID4gPiB2NC0+djU6DQo+ID4gPiA+ID4gPiAgKiBNb3Zl
ZCBjb3JlIGRyaXZlciBmcm9tIE1GRCB0byB0aW1lcg0KPiA+ID4gPiA+ID4gICogQ2hpbGQgZGV2
aWNlcyBpbnN0YXRpYXRlZCB1c2luZyBtZmRfYWRkX2RldmljZXMoKQ0KPiA+ID4gPiA+ID4gdjMt
PnY0Og0KPiA+ID4gPiA+ID4gICogQSBzaW5nbGUgZHJpdmVyIHRoYXQgcmVnaXN0ZXJzIGJvdGgg
dGhlIGNvdW50ZXIgYW5kIHRoZSBwd20NCj4gPiA+ID4gPiBmdW5jdGlvbmFsaXRpZXMNCj4gPiA+
ID4gPiA+ICAgIHRoYXQgYmluZHMgYWdhaW5zdCAicmVuZXNhcyxyei1tdHUzIi4NCj4gPiA+ID4g
PiA+ICAqIE1vdmVkIFBNIGhhbmRsaW5nIGZyb20gY2hpbGQgZGV2aWNlcyB0byBoZXJlLg0KPiA+
ID4gPiA+ID4gICogcmVwbGFjZWQgaW5jbHVkZS9saW51eC9tZmQvcnotbXR1My5oLT5kcml2ZXJz
L21mZC9yei1tdHUzLmgNCj4gPiA+ID4gPiA+ICAqIFJlbW92ZWQgInJlbW92ZSIgY2FsbGJhY2sN
Cj4gPiA+ID4gPiA+IHYyLT52MzoNCj4gPiA+ID4gPiA+ICAqIHJlbW92ZWQgdW53YW50ZWQgaGVh
ZGVyIGZpbGVzDQo+ID4gPiA+ID4gPiAgKiBBZGRlZCBMVVQgZm9yIDMyIGJpdCByZWdpc3RlcnMg
YXMgaXQgbmVlZGVkIGZvciAzMi1iaXQNCj4gPiA+ID4gPiA+IGNhc2NhZGUNCj4gPiA+ID4gPiBj
b3VudGluZy4NCj4gPiA+ID4gPiA+ICAqIEV4cG9ydGVkIDMyIGJpdCByZWFkL3dyaXRlIGZ1bmN0
aW9ucy4NCj4gPiA+ID4gPiA+IHYxLT52MjoNCj4gPiA+ID4gPiA+ICAqIENoYW5nZWQgdGhlIGNv
bXBhdGlibGUgbmFtZQ0KPiA+ID4gPiA+ID4gICogUmVwbGFjZWQNCj4gPiA+ID4gPiA+IGRldm1f
cmVzZXRfY29udHJvbF9nZXQtPmRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlDQo+ID4g
PiA+ID4gPiAgKiBSZW5hbWVkIGZ1bmN0aW9uIG5hbWVzIHJ6ZzJsX210dTMtPnJ6X210dTMgYXMg
dGhpcyBpcyBnZW5lcmljDQo+IElQDQo+ID4gPiA+ID4gPiAgICBpbiBSWiBmYW1pbHkgU29DJ3Mu
DQo+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAg
ICAgfCAgMTAgKw0KPiA+ID4gPiA+ID4gIGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgICB8ICAg
MSArDQo+ID4gPiA+ID4gPiAgZHJpdmVycy9tZmQvcnotbXR1My5jICAgICAgIHwgNDU4DQo+ID4g
PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiA+ICBpbmNs
dWRlL2xpbnV4L21mZC9yei1tdHUzLmggfCAyNDMgKysrKysrKysrKysrKysrKysrKw0KPiA+ID4g
PiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNzEyIGluc2VydGlvbnMoKykgIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiA+ID4gPiA+ID4gZHJpdmVycy9tZmQvcnotbXR1My5jICBjcmVhdGUgbW9kZSAxMDA2
NDQNCj4gPiA+ID4gPiA+IGluY2x1ZGUvbGludXgvbWZkL3J6LW10dTMuaA0KPiA+ID4NCj4gPiA+
IFsuLi5dDQo+ID4gPg0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZk
L3J6LW10dTMuaA0KPiA+ID4gPiA+ID4gYi9pbmNsdWRlL2xpbnV4L21mZC9yei1tdHUzLmggbmV3
IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXgNCj4gPiA+ID4gPiA+IDAwMDAwMDAwMDAwMC4uNDJlNTYx
YTk2MDNjDQo+ID4gPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ID4gPiArKysgYi9pbmNs
dWRlL2xpbnV4L21mZC9yei1tdHUzLmgNCj4gPiA+ID4gPiA+IEBAIC0wLDAgKzEsMjQzIEBADQo+
ID4gPiA+ID4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8NCj4gPiA+
ID4gPiA+ICsvKg0KPiA+ID4gPiA+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMiBSZW5lc2FzIEVs
ZWN0cm9uaWNzIENvcnBvcmF0aW9uICAqLw0KPiA+ID4gPiA+ID4gKyNpZm5kZWYgX19MSU5VWF9S
Wl9NVFUzX0hfXyAjZGVmaW5lIF9fTElOVVhfUlpfTVRVM19IX18NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IF9fTUZEX1JaX01UVTNfSF9fDQo+ID4gPiA+DQo+ID4gPiA+IE9LLg0KPiA+ID4gPg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gV2hhdCBhYm91dCBhbGwgdGhlIG90aGVycz8NCj4gPiA+ID4NCj4gPiA+ID4gSXQg
aXMgbm90IHJlcXVpcmVkIGhlcmUuIFdpbGwgcmVtb3ZlIGl0Lg0KPiA+ID4NCj4gPiA+IEl0IGlz
IHJlcXVpcmVkLiAgUGxlYXNlIGV4cGxpY2l0bHkgaW5jbHVkZSBhbGwgdGhlIGhlYWRlcnMgeW91
IHVzZSBoZXJlLg0KPiA+DQo+ID4gT0sgd2lsbCBhZGQgb3RoZXJzIGFzIHdlbGwuDQo+ID4NCj4g
PiA+DQo+ID4gPiAgPiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfUlpfTVRVMykNCj4gPiA+ID4g
PiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgcnpfbXR1M19yZXF1ZXN0X2NoYW5uZWwoc3RydWN0DQo+
ID4gPiA+ID4gPiArcnpfbXR1M19jaGFubmVsDQo+ID4gPiA+ID4gPiArKmNoKSB7DQo+ID4gPiA+
ID4gPiArCWJvb2wgaXNfaWRsZTsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsJbXV0ZXhf
bG9jaygmY2gtPmxvY2spOw0KPiA+ID4gPiA+ID4gKwlpc19pZGxlID0gIWNoLT5pc19idXN5Ow0K
PiA+ID4gPiA+ID4gKwlpZiAoaXNfaWRsZSkNCj4gPiA+ID4gPiA+ICsJCWNoLT5pc19idXN5ID0g
dHJ1ZTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFBlcmhhcHMgSSdkIHJlYWRpbmcgdGhpcyBhbGwg
d3JvbmcsIGJ1dCAuLi4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFdoYXQgYXJlIHlvdSB0cnlpbmcg
dG8gZG8gaGVyZT8NCj4gPiA+ID4NCj4gPiA+ID4gSXQgaXMgdG8gYXZvaWQgcmFjZSBiZXR3ZWVu
IGNvdW50ZXIgYW5kIHB3bSB0byBhY3F1aXJpbmcgdGhlIHNhbWUNCj4gY2hhbm5lbC4NCj4gPiA+
ID4gSWYgYSBjaGFubmVsIGlzIGZyZWUsIHRoZW4gb25seSB0aGV5IGNhbiBhY2Nlc3MgdGhlIGNo
YW5uZWwuDQo+ID4gPiA+DQo+ID4gPiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiBhbnkgY2xhcmlm
aWNhdGlvbnMgbmVlZGVkLCBvciBjb3JyZWN0IG1lIGlmDQo+ID4gPiA+IGFueXRoaW5nDQo+ID4g
PiB3cm9uZy4NCj4gPiA+DQo+ID4gPiBJIG1lYW4gdGhlIGxvZ2ljLiAgUGxlYXNlIGV4cGxhaW4g
aXQgdG8gbWUuDQo+ID4NCj4gPiBsb2NrKCkNCj4gPiBnZXQgdGhlIGlkbGUgc3RhdGUgb2YgYSBj
aGFubmVsDQo+ID4gaWYoaWRsZSBzdGF0ZSkNCj4gPiAgbWFrZSB0aGUgY2hhbm5lbCB0byBidXN5
DQo+ID4gdW5sb2NrDQo+ID4NCj4gPiByZXR1cm4gdGhlIGlkbGUgc3RhdGU7DQo+ID4NCj4gPiA+
DQo+ID4gPiBGb3IgaW5zdGFuY2UsIHdoeSBub3QganVzdCBkbzoNCj4gPiA+DQo+ID4gPiAgIGJv
b2wgc3VjY2VzcyA9IGZhbHNlDQo+ID4gPg0KPiA+ID4gICBsb2NrKCkNCj4gPiA+DQo+ID4gPiAg
IGlmICghaXNfYnVzeSkNCj4gPiA+ICAgICBpc19idXN5ID0gdHJ1ZQ0KPiA+ID4gICAgIHN1Y2Nl
c3MgPSB0cnVlDQo+ID4gPg0KPiA+ID4gICB1bmxvY2soKQ0KPiA+ID4NCj4gPiA+ICAgcmV0dXJu
IHN1Y2Nlc3MNCj4gPiA+DQo+ID4gPiBXaGF0IGRvIHlvdSB0aGluaz8gIEVhc2llciB0byBicmFp
biBwYXJzZT8NCj4gPg0KPiA+IFllcywgSSBhbSBvayB3aXRoIHlvdXIgc3VnZ2VzdGlvbiBhcyB3
ZWxsLCBldmVudGhvdWdoIHRoZXJlIGlzDQo+ID4gMyBhc3NpZ25tZW50IHN0YXRlbWVudHMgY29t
cGFyZWQgdG8gMiBpbiBwcmV2aW91cyBsb2dpYywgYXMgaXQgaXMNCj4gPiBlYXNpZXIgdG8gcmVh
ZC4NCj4gDQo+IFBlcmhhcHMgdGhpcyB0aWNrcyBhbGwgdGhlIGJveGVzOg0KPiANCj4gbG9jaygp
DQo+IA0KPiBpZiAoaXNfYnVzeSkNCj4gICB1bmxvY2soKQ0KPiAgIHJldHVybiBmYWxzZQ0KPiAN
Cj4gaXNfYnVzeSA9IHRydWU7DQo+IA0KPiB1bmxvY2soKQ0KPiANCj4gcmV0dXJuIHRydWUNCg0K
T0ssIFdpbGwgZG8gdGhpcyBjaGFuZ2UgaW4gbmV4dCB2ZXJzaW9uLg0KDQpDaGVlcnMsDQpCaWp1
DQo=
