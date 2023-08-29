Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 662B178C8D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Aug 2023 17:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbjH2PnZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Aug 2023 11:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237365AbjH2PnF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2023 11:43:05 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2788E43
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2023 08:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbkR7Ja+sjIlD8XKcyAL+Eclw95Dw0QTfYyxFF/ARJtMisgU5OF+FaPQkWlZfOqVh7z0cR4jEqjsGjBvd4ldFwvtBtk+dt/K70ihtMC65qgtWazEoDaVLXCLRUuILFWdTO7lje/zbDPU/S5MzDbu0MUvexTijvzzGBjOclhoG9T51BCYRlF+R4Cd63ILOkFNEwarsQ+70HGxmyJaZUuQ+KnwxCO5fxaRNzLntz5wRDCWffGR8NzlLhxTe3Td21HRSGwiHJCdtC6QdrbVe68N5a5LLFPhAl7uZXe159OV79uRWj3CJkZzazXN06l2NJnxHeOOEuRqSSFgkI9mlp10kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDdGrBEJar8ksT6Xr7TiOs6X+6D9NdS0GoOl7UO3N64=;
 b=ah9C3rBkS8OQhlw8QjqSkEGsAQfFsA8VkwcKHpzcQ5bJOm131Zv0Lk77Fd7GCKfeZyUkqU0tyLpWLakMCHUadYcONcN9WLROTLAjm05HyFW8TLIoXDuuqO+Y+rMc7qXrmD99PfXYk8qL7sZQPs7EXHzz7ZSjKlxHmUAUd4gpeK9xSPGtCnZM7LcRPFGGILe0STdEZICZJZbWkxpfLIyJYra4IdaC6fUGKyrd/vXuS1wpTnnRoIP+KxqJFlpJ4+MAUyPYuMZ/XyZE4ZKo7+kn/ij9HJK/sqVbNuZ6wozj47WMSqoTKA6Zy6D6FGicZRwSEl9pK6stW52qEOxUehY2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDdGrBEJar8ksT6Xr7TiOs6X+6D9NdS0GoOl7UO3N64=;
 b=tazHcEP0WjFLbzMpMzc4WL+Vnvn2C/ieWQsNUG3FictXHMlezQ3anGxSX/6rzndDNrOHV5ylI1x9QEVuKrOYBzOZur2TOzrgIPXqy2SZCGKb3e0qgiUwbsAuvzO07AABgqHecRZSVRnLo26a9kWRO5xWD6bBxSM3p1uimNwaPLU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSRPR01MB11775.jpnprd01.prod.outlook.com (2603:1096:604:231::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 15:42:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 15:42:40 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        Adam Ford <aford173@gmail.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 5/7] drm: adv7511: Add has_dsi feature bit to struct
 adv7511_chip_info
Thread-Topic: [PATCH 5/7] drm: adv7511: Add has_dsi feature bit to struct
 adv7511_chip_info
Thread-Index: AQHZzhDNRooR6Y68PEqAs3TUYFzfvrAA+T+AgABvdSCAABgPgIAAAKqQ
Date:   Tue, 29 Aug 2023 15:42:40 +0000
Message-ID: <OS0PR01MB5922682A64BA4EAF0B86344B86E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-6-biju.das.jz@bp.renesas.com>
 <20230829073031.GA2302@pendragon.ideasonboard.com>
 <OS0PR01MB59227849D7EAA27F0DC6AB7986E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230829153533.GF4698@pendragon.ideasonboard.com>
In-Reply-To: <20230829153533.GF4698@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSRPR01MB11775:EE_
x-ms-office365-filtering-correlation-id: 80d7a88a-2c52-46dc-65fb-08dba8a69418
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R9KbzRdrFW7Hy6jj7w/6m/2BvGT7t7W2W2gBM+/+c5Owc2iGZC2ZNF8GQpxRVTqCK46bMl8JBjvGvON3h2LxPB5BLYZ0f2pt1fomuj4CXFTJY4m0E2waDTjBlbZvEvJN9Kda22KfrTQjB+zit7F61SOw1QeGlNV9dXF/QkMZa0SOB48nByXRxXLZrSoReCZplRsdNIEGGhEJ2O0OoO3XNRsbBjIWUW4aFPrJ13xc7yq+IhjhcHkARopSTZqdQ0vFxNQbwKkdCygWFly1me8ri85oscC8Nw/+bq0kHOP/Vle4gwZkKjsBqVQMIRYN2Onzw0kQTsTkJZVz1j1LINmYpuW+uIyWdgikSGtFkWyY8Z9SQnN9LGXRyVeyEKwdYLepvGQ39pF6NRVr91WHXvzWqXotBnbS4zixbLiLAhbs58gHIDfDMr0JREdX8AHx1kJR9Y0Kz73QaJLD8+L3blwrvq3WutvXlbnxtnQjnLpYFNgdKZtciQ4zczN1d2tQ7SQl7PPrJuBnL+9BSXrf3Pb999IQ3JvZFH2nS4DQ7i6nlOHqyVjtwBFxldI4m0TEL2BCz/94MtVIVfH3mm8cm+oU/MKHNb6MMgInXBDawOfnyVUAVKmy2Tk/9aUfqAzHkgGI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(396003)(346002)(186009)(451199024)(1800799009)(71200400001)(6506007)(9686003)(7696005)(478600001)(83380400001)(2906002)(76116006)(7416002)(316002)(64756008)(54906003)(6916009)(66446008)(66946007)(66476007)(8936002)(52536014)(66556008)(5660300002)(41300700001)(8676002)(4326008)(86362001)(33656002)(122000001)(55016003)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjV0czZMNG9oWVdDRHUyTWtlMzYvUWNBcGhXUW4zQklLMEZzUTdKUWh0YlVF?=
 =?utf-8?B?aCtRcDM0WG0zVnBEV0drck96QmZlYVRONnoyMk1LUmFuZmd5TGU2bUpSL3Rw?=
 =?utf-8?B?NmpyakxoYjhmOTJ4SlFVS2hUeVhCWWpYengyUUp2QnRKYjFseDRpMTAxYTFM?=
 =?utf-8?B?ZnA3Q2YrY29PTHBwVU1meW1keWdwcFA1eTNFcHZSV01YK0I3aGV6OVgwVXpa?=
 =?utf-8?B?bmVWRDRqSTNsYVlleUNVQkFweDlXOWRzYUs1bmpHWnJlT2x3bkRPSDdpN3lQ?=
 =?utf-8?B?Y1BPY1NBWGcxMWVpbzBhbVZ3UnZTcTVvQ1lsQlhKSXVNVElpWFR3TnA1bXFM?=
 =?utf-8?B?VlpXdm84VnBWY29iOVFlR3ZUWmpnUW9ac3d4cExKcHA5M2J1RFBYS3loNEhh?=
 =?utf-8?B?cExXUjEzenplN3NvcWo3MUtkcjArQUs3ZExoWkpjZitFR2o4amFOMXFkVlNU?=
 =?utf-8?B?WkMraEZWTy9PV3JjdStQc1hERkpkbnVibEFzMnBtTVcxL04vOFR5ZGRaSjBL?=
 =?utf-8?B?Q3FwK24wQTRlOVBIWUJoSE9pVWVsSHNreFBMZ3pLNXFxRjEwMEJnOXZGRDdy?=
 =?utf-8?B?M3VUa1hjbkMvaXBCZTU4QzNkekxuRi9YcmQ2RTlhbW4rUTBOaU45Z0tzbWNP?=
 =?utf-8?B?ZXlIZHB1MTN2Z2JHUFBDTmh0RDhZakt5dUxXUEhzRWdyQ3QyRUhvTXdOQWtI?=
 =?utf-8?B?R0RyeUtSbEdvTHhoTlJOcFJxZmFFNHpJQTVnYkJpVTUzaSt5SDgwaVBVZm1K?=
 =?utf-8?B?enFKRUxQVitDT1U2Rk1NTnpwdlMzUU1EQlpCckJTZWp5UHFabHdxN0I0QlZ5?=
 =?utf-8?B?V2xyMmVRWU1nY2FXYnIwZ1lPZ0xMcWxKVXVIQVpXM3B5UURXL29mUkthb2Ux?=
 =?utf-8?B?M010ZzZhbFI3Y0dGV05YR01EVFo4NHpuUFBxWi9kclNXVU1lRTEyU3JkRW9P?=
 =?utf-8?B?VWdCZTFreVdIRUIzWEF4clV3eG5tSStkRjdKcm9Edi9wNWU5aFZqb2w2ZGNa?=
 =?utf-8?B?MHA2dTFrRnNDU0gwUXNKdkpuS3RxZ3ZNRlFMSXRJTDBvMG8rQ0QwMGNJck8y?=
 =?utf-8?B?M2Vqckl3SGRIVmdmMUplY1NyVG02ckxUVnBVM3dXcWxQMTRoU1h2aGRKaU5o?=
 =?utf-8?B?dDEvTk5pUVBsOUlXTDBRU2w3NmhpV0k3aGs5NThUaHA4VGNxQjNMQ3dPSUxm?=
 =?utf-8?B?NUtOSVlNODRxTTRJMk56WTBoaVBqQUtvdUdKZlFoQjd4NW1ZREcyMytmZGNG?=
 =?utf-8?B?cm9UTXY3alM5WGhNd05EMHE4Vm1NTWxKSlg3TytLMytvL0JpY3RjRFlhMFRl?=
 =?utf-8?B?a3JLeXRrOUxFRFdLMDV3ODRqRk0xRUp1aHZpRjhUMzBRZUFTZjVBdXdpYnhn?=
 =?utf-8?B?aVhFQmk3MUkwWUVnMG8reWhpWnJ4aVcyYVU4b0NnSmNkdWVZOFV1MnUvWHI3?=
 =?utf-8?B?eVV4WnVrcTM5bWozdlAxcGhxWFpRZmRnMUo1REVaRHZ1VWFmOUhBNXlsYkFv?=
 =?utf-8?B?OTRQQkRLWVB3a013aDkzbUV5aEd6NXZ5NEREbytPYmxNK3BTR2dIVlRzdmsr?=
 =?utf-8?B?dGhBbHlSVDBnMTl2VXQyRENIenhxRTNRRnNHam9tVW85RXVvR1R5YjRKakYx?=
 =?utf-8?B?dDFUa3hkM1NxYjVmcW4vcWtNdy9Yb3pFNFpLUmQ5ellYYkNJQWhiejA4N24z?=
 =?utf-8?B?d3YzbEZJdjhOTmFPblAvSE94Z1Y2aUdwYWllQTZKUy9BZGNKSGpPbC8zNTB3?=
 =?utf-8?B?YUNOYVB0ZCsrSU1PZkZERlBtQ1RPVG8vQXBZNFM1bnRQVXZUMTNNYUZQZXpL?=
 =?utf-8?B?c055cUNPV2RvUDNqZjlwRlkvc0lWRmM2dGRBaGlibmd0eTc0bWk4TE5ENkdt?=
 =?utf-8?B?UGI0bHp3aDRqOUsxS0phb1JHYVg5UUZjMHJXYzJEOVdSWHdVS2xmNmZ5M04z?=
 =?utf-8?B?SFZQaGdYZHM1eW0wUnBabWQ2Y2RrTVM5bWlFMWNHWk9mLzVocXlFZytvUTNK?=
 =?utf-8?B?SHMvN0MvTTJDbzBSUnI0bWVndlBLRzhjNm5FdmtvZndwRDNTYkpHVmtBSjdn?=
 =?utf-8?B?L3doT1RLWlBrRUxRRjlucFVJVC9GS2w0eTZZbGthcHlXSm9lbVZ5WDFucjVG?=
 =?utf-8?Q?0zeE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d7a88a-2c52-46dc-65fb-08dba8a69418
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 15:42:40.5396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2owHiuB3I2+Xm6Msm7CwAoZs28z374ObXNruzaJIskMVDe4dnjOPl8c9K3WxnzqPAN5N7GcTRO3cPtkgj5QveSl2qVrtV+5yC4anFgha2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11775
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCA1LzddIGRybTogYWR2NzUxMTogQWRkIGhhc19kc2kgZmVhdHVyZSBi
aXQgdG8gc3RydWN0DQo+IGFkdjc1MTFfY2hpcF9pbmZvDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4g
T24gVHVlLCBBdWcgMjksIDIwMjMgYXQgMDI6MTk6MDJQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6
DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCA1LzddIGRybTogYWR2NzUxMTogQWRkIGhhc19kc2kg
ZmVhdHVyZSBiaXQgdG8NCj4gPiBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8NCj4gPiA+IE9uIFN1
biwgQXVnIDEzLCAyMDIzIGF0IDA3OjA1OjEwUE0gKzAxMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+
ID4gPiBUaGUgQURWNzUzMyBhbmQgQURWNzUzNSBoYXZlIERTSSBzdXBwb3J0LiBBZGQgYSBmZWF0
dXJlIGJpdA0KPiA+ID4gPiBoYXNfZHNpIHRvIHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyBmb3Ig
aGFuZGxpbmcgY29uZmlndXJhdGlvbg0KPiByZWxhdGVkIHRvIERTSS4NCj4gPiA+ID4NCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3
NTExLmggICAgIHwgIDEgKw0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTEx
L2Fkdjc1MTFfZHJ2LmMgfCAyMA0KPiA+ID4gPiArKysrKysrKysrKy0tLS0tLS0tLQ0KPiA+ID4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+
ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTEx
L2Fkdjc1MTEuaA0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3
NTExLmgNCj4gPiA+ID4gaW5kZXggYjI5ZDExY2FlOTMyLi4yYTAxN2JiMzFhMTQgMTAwNjQ0DQo+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgNCj4g
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+
ID4gPiBAQCAtMzM5LDYgKzMzOSw3IEBAIHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyB7DQo+ID4g
PiA+ICAJdW5zaWduZWQgbG9uZyBtYXhfbGFuZV9mcmVxOw0KPiA+ID4gPiAgCWNvbnN0IGNoYXIg
KiBjb25zdCAqc3VwcGx5X25hbWVzOw0KPiA+ID4gPiAgCXVuc2lnbmVkIGludCBudW1fc3VwcGxp
ZXM7DQo+ID4gPiA+ICsJdW5zaWduZWQgaGFzX2RzaToxOw0KPiA+ID4NCj4gPiA+IEFzIHlvdSdy
ZSBub3Qgc2hvcnQgb2Ygc3BhY2UgaGVyZSwgSSdkIG1ha2UgdGhpcyBhIGJvb2wuDQo+ID4NCj4g
PiBPSywgd2lsbCB1c2UgYm9vbCBoZXJlLg0KPiA+DQo+ID4gPiA+ICB9Ow0KPiA+ID4gPg0KPiA+
ID4gPiAgc3RydWN0IGFkdjc1MTEgew0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+ID4gPiBpbmRleCBmNmYxNWMxYjA4
ODIuLjY2YjNmOGZjZjY3ZCAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiA+ID4gQEAgLTM3Myw3ICszNzMsNyBA
QCBzdGF0aWMgdm9pZCBhZHY3NTExX3Bvd2VyX29uKHN0cnVjdCBhZHY3NTExDQo+ICphZHY3NTEx
KQ0KPiA+ID4gPiAgCSAqLw0KPiA+ID4gPiAgCXJlZ2NhY2hlX3N5bmMoYWR2NzUxMS0+cmVnbWFw
KTsNCj4gPiA+ID4NCj4gPiA+ID4gLQlpZiAoYWR2NzUxMS0+aW5mby0+dHlwZSA9PSBBRFY3NTMz
IHx8IGFkdjc1MTEtPmluZm8tPnR5cGUgPT0NCj4gQURWNzUzNSkNCj4gPiA+ID4gKwlpZiAoYWR2
NzUxMS0+aW5mby0+aGFzX2RzaSkNCj4gPiA+ID4gIAkJYWR2NzUzM19kc2lfcG93ZXJfb24oYWR2
NzUxMSk7DQo+ID4gPiA+ICAJYWR2NzUxMS0+cG93ZXJlZCA9IHRydWU7DQo+ID4gPiA+ICB9DQo+
ID4gPiA+IEBAIC0zOTcsNyArMzk3LDcgQEAgc3RhdGljIHZvaWQgX19hZHY3NTExX3Bvd2VyX29m
ZihzdHJ1Y3QgYWR2NzUxMQ0KPiA+ID4gPiAqYWR2NzUxMSkgIHN0YXRpYyB2b2lkIGFkdjc1MTFf
cG93ZXJfb2ZmKHN0cnVjdCBhZHY3NTExICphZHY3NTExKSAgew0KPiA+ID4gPiAgCV9fYWR2NzUx
MV9wb3dlcl9vZmYoYWR2NzUxMSk7DQo+ID4gPiA+IC0JaWYgKGFkdjc1MTEtPmluZm8tPnR5cGUg
PT0gQURWNzUzMyB8fCBhZHY3NTExLT5pbmZvLT50eXBlID09DQo+IEFEVjc1MzUpDQo+ID4gPiA+
ICsJaWYgKGFkdjc1MTEtPmluZm8tPmhhc19kc2kpDQo+ID4gPiA+ICAJCWFkdjc1MzNfZHNpX3Bv
d2VyX29mZihhZHY3NTExKTsNCj4gPiA+ID4gIAlhZHY3NTExLT5wb3dlcmVkID0gZmFsc2U7DQo+
ID4gPiA+ICB9DQo+ID4gPiA+IEBAIC03ODYsNyArNzg2LDcgQEAgc3RhdGljIHZvaWQgYWR2NzUx
MV9tb2RlX3NldChzdHJ1Y3QgYWR2NzUxMQ0KPiAqYWR2NzUxMSwNCj4gPiA+ID4gIAllbHNlDQo+
ID4gPiA+ICAJCWxvd19yZWZyZXNoX3JhdGUgPSBBRFY3NTExX0xPV19SRUZSRVNIX1JBVEVfTk9O
RTsNCj4gPiA+ID4NCj4gPiA+ID4gLQlpZiAoYWR2NzUxMS0+aW5mby0+dHlwZSA9PSBBRFY3NTEx
KQ0KPiA+ID4gPiArCWlmICghYWR2NzUxMS0+aW5mby0+aGFzX2RzaSkNCj4gPiA+DQo+ID4gPiBX
aGlsZSB0aGlzIGlzIGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50LCBpcyB0aGUgcmVnaXN0ZXIgYmVs
b3cgcmVhbGx5DQo+ID4gPiByZWxhdGVkIHRvIERTSSA/IElmIG5vdCwgSSdkIHJhdGhlciBub3Qg
Y2hlY2sgdGhlIGhhc19kc2kgZmllbGQgaGVyZQ0KPiA+ID4gYnV0IGtlZXAgY2hlY2tpbmcgdGhl
IHR5cGUuDQo+ID4NCj4gPiBXaGF0IGNyZWF0aW5nIGEgcGFja2VkIHZhbHVlIGZvciB0aGlzIGhh
cmR3YXJlIGRpZmZlcmVuY2UgYXMgZHJpdmVyDQo+ID4gZGF0YT8NCj4gPg0KPiA+ICB7IDB4ZmIs
IDB4NiwgMHgxfSBhbmQgeyAweDRhLCAweGMsIDIpIHBhY2tlZCBhcyB1bnNpZ25lZCBpbnQgZHJp
dmVyDQo+ID4gZGF0YSBsb3dfcmVmcmVzaF9kYXRhIGFuZCB3ZSBjYW4gZ2V0IHJpZCBvZiB0aGlz
IGlmIHN0YXRlbWVudCBhbmQNCj4gPiBkZXBhY2sgaXQgaGVyZS4NCj4gDQo+IEFzIHdlJ3JlIG5v
dCBpbiBhIGhvdCBwYXRoLCBJIHRoaW5rIHRoZSBtb3N0IGltcG9ydGFudCBjcml0ZXJpYSB0byBj
b25zaWRlcg0KPiBhcmUgbWFpbnRhaW5hYmlsaXR5IGFuZCByZWFkYWJpbGl0eS4gTWFraW5nIGl0
IGVhc3kgdG8gYWRkIHN1cHBvcnQgZm9yIGENCj4gbmV3IGNoaXAgd2l0aG91dCBjcmVhdGluZyBh
IG1lc3Mgb2Ygc3BhZ2hldHRpIGNvZGUgZmFsbHMgaW50byB0aG9zZQ0KPiBjcml0ZXJpYSwgYnV0
IGFzIGZhciBhcyBJJ20gYXdhcmUgdGhlcmUncyBubyBpbmRpY2F0aW9uIHRoYXQgd2Ugd2lsbA0K
PiBzdWRkZW5seSBzZWUgc2V2ZXJhbCBuZXcgY29tcGF0aWJsZSBkZXZpY2VzLg0KPiANCj4gV2hl
biBpdCBjb21lcyB0byByZWFkYWJpbGl0eSwgY29kZSBzdWNoIGFzDQo+IA0KPiAJaWYgKGhhc19k
c2kpDQo+IAkJaW5pdF9kc2koKTsNCj4gDQo+IGlzIGdyZWF0LCBidXQgY29kZSBzdWNoIGFzDQo+
IA0KPiAJaWYgKGhhc19kc2kpDQo+IAkJaW5pdF9jZWMoKTsNCj4gDQo+IGJlY2F1c2Ugb25seSB0
aGUgRFNJLWVuYWJsZWQgdmVyc2lvbiBoYXBwZW5zIHRvIGFsc28gc3VwcG9ydCBDRUMgaXMgbm90
DQo+IGdvb2QuIFNpbWlsYXJseSwgSSBkb24ndCB0aGluayBwYWNraW5nIHRoZSByZWZyZXNoIHJh
dGUgcmVnaXN0ZXIgYWRkcmVzc2VzDQo+IGFuZCB2YWx1ZSBpbiB0aGUgaW5mbyBzdHJ1Y3R1cmUg
d291bGQgaW5jcmVhc2UgcmVhZGFiaWxpdHksIG9yIGhlbHAgaW4gYW55DQo+IHJlYWwgd2F5LiBJ
J20gdGVtcHRlZCB0byBsZWF2ZSBpdCBhcy1pcy4NCg0KQWdyZWVkLiBXaWxsIGtlZXAgYXMgaXQg
aXMgZm9yIGxvd19yZWZyZXNoX3JhdGUoKSBjaGFuZ2UuDQoNCj4gDQo+IFdoYXQgd291bGQgaGVs
cCByZWFkYWJpbGl0eSwgaWYgeW91IGZlZWwgaW5jbGluZWQgdG8ga2VlcCB3b3JraW5nIG9uIHRo
aXMNCj4gZHJpdmVyLCBpcyB0byByZXBsYWNlIHRoZSByZWdpc3RlciBhZGRyZXNzZXMgd2l0aCBu
YW1lZCBtYWNyb3MgOi0pDQo+IA0KPiA+ID4gPiAgCQlyZWdtYXBfdXBkYXRlX2JpdHMoYWR2NzUx
MS0+cmVnbWFwLCAweGZiLA0KPiA+ID4gPiAgCQkJCSAgIDB4NiwgbG93X3JlZnJlc2hfcmF0ZSA8
PCAxKTsNCj4gPiA+ID4gIAllbHNlDQo+ID4gPiA+IEBAIC05MjEsNyArOTIxLDcgQEAgc3RhdGlj
IGVudW0gZHJtX21vZGVfc3RhdHVzDQo+ID4gPiA+IGFkdjc1MTFfYnJpZGdlX21vZGVfdmFsaWQo
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwgIHsNCj4gPiA+ID4gIAlzdHJ1Y3QgYWR2NzUxMSAq
YWR2ID0gYnJpZGdlX3RvX2Fkdjc1MTEoYnJpZGdlKTsNCj4gPiA+ID4NCj4gPiA+ID4gLQlpZiAo
YWR2LT5pbmZvLT50eXBlID09IEFEVjc1MzMgfHwgYWR2LT5pbmZvLT50eXBlID09IEFEVjc1MzUp
DQo+ID4gPiA+ICsJaWYgKGFkdi0+aW5mby0+aGFzX2RzaSkNCj4gPiA+ID4gIAkJcmV0dXJuIGFk
djc1MzNfbW9kZV92YWxpZChhZHYsIG1vZGUpOw0KPiA+ID4gPiAgCWVsc2UNCj4gPiA+ID4gIAkJ
cmV0dXJuIGFkdjc1MTFfbW9kZV92YWxpZChhZHYsIG1vZGUpOyBAQCAtMTA4Niw3ICsxMDg2LDcN
Cj4gQEANCj4gPiA+ID4gc3RhdGljIGludCBhZHY3NTExX2luaXRfY2VjX3JlZ21hcChzdHJ1Y3Qg
YWR2NzUxMSAqYWR2KQ0KPiA+ID4gPiAgCQlnb3RvIGVycjsNCj4gPiA+ID4gIAl9DQo+ID4gPiA+
DQo+ID4gPiA+IC0JaWYgKGFkdi0+aW5mby0+dHlwZSA9PSBBRFY3NTMzIHx8IGFkdi0+aW5mby0+
dHlwZSA9PSBBRFY3NTM1KQ0KPiB7DQo+ID4gPiA+ICsJaWYgKGFkdi0+aW5mby0+aGFzX2RzaSkg
ew0KPiA+ID4NCj4gPiA+IFNhbWUgY29tbWVudCBoZXJlLCB0aGlzIGRvZXNuJ3Qgc2VlbSBsb2dp
Y2FsbHkgcmlnaHQuDQo+ID4NCj4gPiBCdXQgdGhpcyBwYXRjaGluZyBpcyBhcHBsaWNhYmxlIGZv
ciBEU0kuDQo+IA0KPiBDRUMgaXMgYW4gSERNSSBmZWF0dXJlLiBUaGUgQURWNzUxMSBtYXkgbm90
IGhhdmUgQ0VDIHN1cHBvcnQsIGJ1dCBpdCdzIG5vdA0KPiBsaW5rZWQgdG8gRFNJIGFzIHN1Y2gu
DQoNCk9LLCB3aGF0IGFib3V0IHVzaW5nICJoYXNfY2VjIiBoZXJlIGluc3RlYWQsIHdoaWNoIGF2
b2lkcyAyIHJ1biB0aW1lIGNvbXBhcmlzb25zIGFnYWluc3QgMT8/DQoNCg0KPiANCj4gPiA+ID4g
IAkJcmV0ID0gYWR2NzUzM19wYXRjaF9jZWNfcmVnaXN0ZXJzKGFkdik7DQo+ID4gPiA+ICAJCWlm
IChyZXQpDQo+ID4gPiA+ICAJCQlnb3RvIGVycjsNCj4gPiA+ID4gQEAgLTEyNDUsNyArMTI0NSw3
IEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiAqaTJjKQ0K
PiA+ID4gPiAgCQlnb3RvIHVuaW5pdF9yZWd1bGF0b3JzOw0KPiA+ID4gPiAgCWRldl9kYmcoZGV2
LCAiUmV2LiAlZFxuIiwgdmFsKTsNCj4gPiA+ID4NCj4gPiA+ID4gLQlpZiAoaW5mby0+dHlwZSA9
PSBBRFY3NTExKQ0KPiA+ID4gPiArCWlmICghaW5mby0+aGFzX2RzaSkNCj4gPiA+DQo+ID4gPiBB
bmQgaGVyZSB0b28uDQo+ID4NCj4gPiBXaWxsIGNyZWF0ZSBhbm90aGVyIGJvb2wuIGluZm8tPmhh
c19kcGksIGlzIGl0IG9rPz8NCj4gDQo+IENhbid0IHdlIGxlYXZlIHR5cGUgY29tcGFyaXNvbnMg
aW4gdGhlIGhhbmRmdWwgb2YgY2FzZXMgd2hlcmUgdGhleSBhcmUNCj4gc2ltcGxlciA/IElzIHRo
ZXJlIGEgc3BlY2lmaWMgcmVhc29uIHdoeSB5b3UgdGhpbmsgdGhlIHR5cGUgZW51bSByZWFsbHkg
aGFzDQo+IHRvIGdvID8NCg0KQWdyZWVkLCB3aWxsIHVzZSB0eXBlIGhlcmUgYXMgd2VsbC4NCg0K
Q2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ID4gPiAgCQlyZXQgPSByZWdtYXBfcmVnaXN0ZXJfcGF0
Y2goYWR2NzUxMS0+cmVnbWFwLA0KPiA+ID4gPiAgCQkJCQkgICAgYWR2NzUxMV9maXhlZF9yZWdp
c3RlcnMsDQo+ID4gPiA+DQo+IEFSUkFZX1NJWkUoYWR2NzUxMV9maXhlZF9yZWdpc3RlcnMpKTsN
Cj4gPiA+ID4gQEAgLTEzMTYsNyArMTMxNiw3IEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9wcm9iZShz
dHJ1Y3QgaTJjX2NsaWVudA0KPiA+ID4gPiAqaTJjKQ0KPiA+ID4gPg0KPiA+ID4gPiAgCWFkdjc1
MTFfYXVkaW9faW5pdChkZXYsIGFkdjc1MTEpOw0KPiA+ID4gPg0KPiA+ID4gPiAtCWlmIChpbmZv
LT50eXBlID09IEFEVjc1MzMgfHwgaW5mby0+dHlwZSA9PSBBRFY3NTM1KSB7DQo+ID4gPiA+ICsJ
aWYgKGluZm8tPmhhc19kc2kpIHsNCj4gPiA+ID4gIAkJcmV0ID0gYWR2NzUzM19hdHRhY2hfZHNp
KGFkdjc1MTEpOw0KPiA+ID4gPiAgCQlpZiAocmV0KQ0KPiA+ID4gPiAgCQkJZ290byBlcnJfdW5y
ZWdpc3Rlcl9hdWRpbzsNCj4gPiA+ID4gQEAgLTEzNzAsNyArMTM3MCw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8NCj4gPiA+IGFkdjc1MzNfY2hpcF9pbmZvID0gew0K
PiA+ID4gPiAgCS5tYXhfbW9kZV9jbG9jayA9IDgwMDAwLA0KPiA+ID4gPiAgCS5tYXhfbGFuZV9m
cmVxID0gODAwMDAwLA0KPiA+ID4gPiAgCS5zdXBwbHlfbmFtZXMgPSBhZHY3NTMzX3N1cHBseV9u
YW1lcywNCj4gPiA+ID4gLQkubnVtX3N1cHBsaWVzID0gQVJSQVlfU0laRShhZHY3NTMzX3N1cHBs
eV9uYW1lcykNCj4gPiA+ID4gKwkubnVtX3N1cHBsaWVzID0gQVJSQVlfU0laRShhZHY3NTMzX3N1
cHBseV9uYW1lcyksDQo+ID4gPiA+ICsJLmhhc19kc2kgPSAxDQo+ID4gPiA+ICB9Ow0KPiA+ID4g
Pg0KPiA+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyBhZHY3NTM1
X2NoaXBfaW5mbyA9IHsgQEANCj4gPiA+ID4gLTEzNzgsNyArMTM3OSw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8NCj4gPiA+IGFkdjc1MzVfY2hpcF9pbmZvID0gew0K
PiA+ID4gPiAgCS5tYXhfbW9kZV9jbG9jayA9IDE0ODUwMCwNCj4gPiA+ID4gIAkubWF4X2xhbmVf
ZnJlcSA9IDg5MTAwMCwNCj4gPiA+ID4gIAkuc3VwcGx5X25hbWVzID0gYWR2NzUzM19zdXBwbHlf
bmFtZXMsDQo+ID4gPiA+IC0JLm51bV9zdXBwbGllcyA9IEFSUkFZX1NJWkUoYWR2NzUzM19zdXBw
bHlfbmFtZXMpDQo+ID4gPiA+ICsJLm51bV9zdXBwbGllcyA9IEFSUkFZX1NJWkUoYWR2NzUzM19z
dXBwbHlfbmFtZXMpLA0KPiA+ID4gPiArCS5oYXNfZHNpID0gMQ0KPiA+ID4gPiAgfTsNCj4gPiA+
ID4NCj4gPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBhZHY3NTExX2ky
Y19pZHNbXSA9IHsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0
DQo=
