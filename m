Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544F274E743
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jul 2023 08:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjGKGZq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jul 2023 02:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjGKGZq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2023 02:25:46 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2095.outbound.protection.outlook.com [40.107.113.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFE1E4D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2023 23:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eweKpn5/F6IWYeurXUcJOknyTilkVuJoGPX1viHJbUO/KN8StHDeSAU20i9tH4fzTYtoHg3AcEwyv3VNe90Q+xhLqx2V4q0jKjaI2d5HblBQfxT8Aga+S97g5vrdcazBIunFpjLf1dnml2jvWriMXf0ATL5aS1ZD0xxswjvkTILylaaEWA+hkl1WNPEUyS2ovJoFzRygzpHtSnm8h53iWhiRx12Y0t38kYudm5iJGptTvYhybZq3yYSlsxIE0cngvxLcCA9SBYM8A7s3jHTdlDk8b2jFx+UHGQMyJK3QLmc5iNcBXHFouw8ZwPWvnepBuXR5qBGq8CrHyAKkq4b+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye8I+9em/DUAKJKVCvecDJeMk7TYdNgCPfh8QudcGvI=;
 b=IgXJrFog0zRMkQn5mSLE7je+vbGHRNEK/nTZb8F3atzWa8uY4/VzI5m6mr1w5+riavtlL5jBq2jpQYaf0vFXjmtNrt1w51doB6irAHySmD0OgOGeQBtjSWhQWc6p41efefxePwrKmoZz6Kyh5L+3bMzyr/jzmtpKmrIXiyMQNkC052CTciAP+lc1XdteSKeLzIKc6wXFiN/FEMd9iPqSDz8MQpTuls4ARt6ESXdh8UG87GgKuzbezu0zYP3ZKs/ASNAim8PkPDcKUonBZxHBpCsQQzi1PEZNwb7p3lMtvJ9FfnF3ZLSmTStpKZvxX03kMJHO/7+AI/YHHsCajgmG9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ye8I+9em/DUAKJKVCvecDJeMk7TYdNgCPfh8QudcGvI=;
 b=KvtNZuUPnK+5yY/gLculLoaOvBn0BI0nveLpTgyfgBeIXduHh3NwZJiRLYT9hen3h1Lg8n7oJT+Ma91nA+fxWYATlM+QSulGhmeYW4IwDytUq6IGWdiao8RW5T1vrwttnYWbcigGag5YLXy21X7XH+fwtjkHwc9hCqvfAFZbJhQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10214.jpnprd01.prod.outlook.com (2603:1096:400:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 06:25:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::de3f:f3ca:8629:c80d]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::de3f:f3ca:8629:c80d%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 06:25:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Lee Jones <lee@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mfd: Add module build support for RZ/G2L MTU3a
Thread-Topic: [PATCH] mfd: Add module build support for RZ/G2L MTU3a
Thread-Index: AQHZrbGaW+H7hOR+m0Khw/bU1YpnDq+rEIeAgAg0y0CAAC0OAIAAsvHQ
Date:   Tue, 11 Jul 2023 06:25:39 +0000
Message-ID: <OS0PR01MB59223DDFA1EF84F0278245948631A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230703132343.353878-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWj1PTx3Fp=Wn0h+0hHRFRaTKCre=VMvCFCq=BE+HBE5Q@mail.gmail.com>
 <OS0PR01MB5922850408798D653B1ABE938630A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUZ_R1G4L-Sd-KnsPsHCWJ5b+nFpV8ygPjD432281jVBw@mail.gmail.com>
In-Reply-To: <CAMuHMdUZ_R1G4L-Sd-KnsPsHCWJ5b+nFpV8ygPjD432281jVBw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10214:EE_
x-ms-office365-filtering-correlation-id: cfd687ff-070b-4658-fe6f-08db81d7a55e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IlmbMHQAfFoXvYFSBRFS90l1Kq0zQ3pjXJXjyJPEgEqr7krIiOtXlUcGHjWjTMJb+jEpflkW22rt8an3KgQPaLOv6I8dUeF68ze7xtZL5xGT8JPBLU7k+/kSXPflXONxfHevQLwsGnPQWDeyZ7VVIRQ6wl6PMKlYxd9ouVIBeXV3hKa3sReqytMQATmqMgwZIUSEZMeiL/y3q6p2Y/oT05ccjE4eEa+fOOPHDXR608zmNr6KsNpWw5hGkrs/w22gCWoKpVpccfVvDp6/ofo/whKHcOP3gomH6n3x0APaW5iJaexX+7oteTr2btNdr/lugZxdtHBzAWeVNpIHDO5vBkZjlUPgAyTDVKrxFMWRlcS52bJiv8Bt6FBl+otIZ8J2+J4i4BjSUAdzO9ufBH/CoTHghl+QO270owC5BLUSBXcZLhcsv0Wk60JSaLD188p6GtCS3Erx5V77Fgl+9GnLRgxWtQec+13dn4yf4wDTO4yjDL2E8yWp/DXn/dx4RaAl2+eVxO3xappOom5bVps88ReAERuFS6ivCguJQ4U9B0cP+cF4cEZSjxSj8bRZMO6vkVcUTrfm5FRCFMDvzphCPkhhiEvZdSYvfUyU1MXqpBXnQ4mZ8yaotIqzlZvR19t1qhbbx/QH9OP/2ufAZ5RyfA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(7696005)(33656002)(71200400001)(478600001)(83380400001)(26005)(6506007)(186003)(53546011)(9686003)(55016003)(316002)(2906002)(41300700001)(38100700002)(122000001)(66446008)(66476007)(64756008)(76116006)(66946007)(66556008)(6916009)(4326008)(86362001)(8936002)(8676002)(38070700005)(5660300002)(52536014)(54906003)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlJmZzJ4V2hMTmNSRFNlb3NWaENDU3Jib1BvejVUaE1MTVVRdEJLK3lHWkhF?=
 =?utf-8?B?ODVCZi9XRFNyTmVtVjd5MVp6K0pEWGNjYm4zTExsR0djTEEzZnV6alNVcDZ0?=
 =?utf-8?B?U1M4YkFKYzlucW5Pb0xRV2Fnd2tkT3NEaTcrUVJEbTRWUlkvakxLNkc4VmpK?=
 =?utf-8?B?VkQrTVdPU3ZOL0dsTHMyalU5aVZ0SjBESUZhUlUwZ2NLOSs3RkxZRXlmdVhm?=
 =?utf-8?B?aDFzczNWV3ZVb2g5bkgwdUlOR3o3dG5iRHpTeFBkYW1sRmNFMUJOZlpyVU40?=
 =?utf-8?B?LzJqOWNMN2M0T09Pd0tzZ1RPck9IQzg0MDlNVzd2MXlpVkM4cjFxaHJEeGNO?=
 =?utf-8?B?VXJIblFMVGpRZ280bWNlL1E5cGZHWHZiRmQraWlZb204RDI3UmdoVk56NzdM?=
 =?utf-8?B?TnR3d1ZCdGRabURSMXgxSkRmMTNYMU1kK28zYWlTY3hSZDhTOHFlRDcvRURk?=
 =?utf-8?B?TzdBRTcxT0hha21vand1NUpiY2lpbXlTZzdpeXJvUlNYUW95bHk5cEowMDJP?=
 =?utf-8?B?dmZ4YTlDTTNkRGZiQVJpb3VvRGNqbDRBM2h2cmRRcDloTVVSQnRjaE02MmpX?=
 =?utf-8?B?anUvdFBCVGljVHpzY2tHM2tZbXVEdmpGVDVnZUNkY3pJRENjUi85VHhXQ1Fx?=
 =?utf-8?B?QmRsWkhSbUdWWkpSQkluNmhTYzU0clAzNWU4NnVNNlJGRWhHeDd6SkVIa3Ri?=
 =?utf-8?B?YnRCTkRleUkwYmEvaWxNZnUrS2JucHdNMmIrb2k4RnI1RnpLZkN0M05IMncv?=
 =?utf-8?B?WWNHQS9CUXB3UWJwWUFkK1MrejJzZUtGRjlIbmJQM3BEbUx3WDBsUUgwZzNZ?=
 =?utf-8?B?clhNQ0UxQVlPcUN5dGlrL3FHTFJaQmk3Zm44Mk9FbnorcnVab2dzd2hPdU14?=
 =?utf-8?B?NlRsWmRFU0pSaVFSZTBPSnJkSmVYTGh6UmdjYVRBZzZiUlZldUI1aENwYk4r?=
 =?utf-8?B?aHNFbDlOdWNVUjJtVUIyNXZzcDBTQ2FCblE0MFU5SCttT1NDMkh4REgzd3h2?=
 =?utf-8?B?OE1TUEdlM3FNWjVJSEljcUxFc1MxR0I5QjEybDI1NzNIM1diWWc1T25iV3VK?=
 =?utf-8?B?VEp0RWFhc0ZqQytnN2lGQmZFdG1CUnpiTS9mejFhSU90L3VJOE5GYTF6K2gw?=
 =?utf-8?B?ZTJZMFhiVkhRelo5WU1zdFNnSjM3cnNTUWp5MFZUNkg0NUROZmVvSHlTeExC?=
 =?utf-8?B?eFdSblNSbWV1eis3WU16aG4yQVRLZDh0VjNzbzVuY0FCcmtoSllLZTNPaW9F?=
 =?utf-8?B?TFZnMmxQNXVZdDNVVXZEa0U4R3hhQ3FVcGhHUTlVaUtZUWlQZVYwdVgwOSsv?=
 =?utf-8?B?MkRGTVpNL0dmQ28rYm5lT05iMG9hVGJTaDZ5ZzZyMVgrWDNtcjBqUnRLTm55?=
 =?utf-8?B?V3d2K1RyaTlzOW9lUjlLV09Bc1NGN1FCMmlUcWtkR3drckRYM2hpU2h4ZjBp?=
 =?utf-8?B?aFlxNDltajYzK3hrL1FwWTJsUEJYSTRFbHMxMEtYMTlWMlJzZm1TS3dMTkl0?=
 =?utf-8?B?bzdoVExGeURWMHRNeGFJOVZpelVhQ2wzWlJFTFpzNzdIQXd6WWE4ZHkvR2Fu?=
 =?utf-8?B?TUZqcVVSd2NIUFRUaXBxUlRBSlFNSVJmMjIyYys5U2F5NnhyNlhqZzFzY2Yz?=
 =?utf-8?B?amxCNWxuZTNtVDEzTjdTc1l4bXFTRHFtQ0o4SHhIMk1XYzl1bnByTFBWMVFi?=
 =?utf-8?B?bDI3YWxmVWhsMnllNjBjNmlJQXNMUUtqZFU5M2xGaUtnQzU1c0R1NnVpd0pq?=
 =?utf-8?B?UysvOW1PWnRFNUx0dXJhTm5IVkdHUlp0TUUzYXcxOTRtQU1EWUZuU2RFK1pD?=
 =?utf-8?B?UzdsYU81L2Zld1BHVVhBTVhBcGpETGJKSVBzYUJmSlE5N2UvR0s1bGZBYURZ?=
 =?utf-8?B?NmxkSWFocTNyMnJxZUdOeDlXaXpDRGtFU0tCYUdBL1RwVVBqb2FWM1pLcjBL?=
 =?utf-8?B?Nll6WjJ5YzBXOTg1czFDZ2xzaEdzeUN6ZElwZHp2azhzTkhMb2ZYY1hUblla?=
 =?utf-8?B?RklRZGsyQ3E4cldrQjVKb1lGK0xBdWJ1dWc4Yi95T1VwcTVKa3VGNkVSVXdN?=
 =?utf-8?B?ODN4MisvTkVpWXAvT3IzbithNWtLNm1ScU5KOHozTmF3ZG04REVkZTlKNXM4?=
 =?utf-8?Q?GVkFItypofYijxUa3GkJ0T8wH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd687ff-070b-4658-fe6f-08db81d7a55e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 06:25:39.5461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2LkRCnxrnE8PLnNuALNRRNcLaXiCw8ZoHavwKzUPOb0SCNwL8v/hiYAPyJPuLQFp9U4JqtLD2/Wc/2V/FLMXgWfFxPIxgqgm+vEUXXA4i7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10214
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgY2xhcmlmaWNhdGlvbi4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIXSBtZmQ6IEFkZCBtb2R1bGUgYnVpbGQgc3VwcG9ydCBmb3IgUlovRzJMIE1UVTNhDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgNzowNOKAr1BNIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSA1LCAyMDIz
IDEyOjQ0IFBNDQo+ID4gPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+ID4gQ2M6IExlZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+OyBQcmFiaGFrYXIgTWFoYWRl
diBMYWQNCj4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+OyBs
aW51eC1yZW5lc2FzLQ0KPiA+ID4gc29jQHZnZXIua2VybmVsLm9yZw0KPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSF0gbWZkOiBBZGQgbW9kdWxlIGJ1aWxkIHN1cHBvcnQgZm9yIFJaL0cyTCBNVFUz
YQ0KPiA+ID4NCj4gPiA+IE9uIE1vbiwgSnVsIDMsIDIwMjMgYXQgMzoyM+KAr1BNIEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBNb2Rp
ZmllZCBLY29uZmlnIHRvIGVuYWJsZSBtb2R1bGUgYnVpbGQgc3VwcG9ydCBmb3IgUlovRzJMIE1U
VTNhDQo+ID4gPiBkcml2ZXIuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBBcyBkcml2ZXJz
L21mZC9yei1tdHUzLmMgYWxyZWFkeSBoYXMgdGhlIG5lZWRlZCBNT0RVTEVfKigpIGxpbmVzOg0K
PiA+ID4NCj4gPiA+IGRyaXZlcnMvbWZkL3J6LW10dTMuYzpNT0RVTEVfREVWSUNFX1RBQkxFKG9m
LCByel9tdHUzX29mX21hdGNoKTsNCj4gPiA+IGRyaXZlcnMvbWZkL3J6LW10dTMuYzpNT0RVTEVf
QVVUSE9SKCJCaWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiIpOyBk
cml2ZXJzL21mZC9yei0NCj4gPiA+IG10dTMuYzpNT0RVTEVfREVTQ1JJUFRJT04oIlJlbmVzYXMg
UlovRzJMIE1UVTNhIENvcmUgRHJpdmVyIik7DQo+ID4gPiBkcml2ZXJzL21mZC9yei1tdHUzLmM6
TU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiA+DQo+ID4gWW91IG1lYW4sIEkgbWlzc2VkIGFkZGlu
ZyBsaW51eC9tb2R1bGUuaCBhcyBJIGdvdCBjb21waWxhdGlvbiBlcnJvcg0KPiA+IFdoaWxlIGJh
Y2twb3J0aW5nIHRvIDUuMTAgY2lwIGtlcm5lbD8NCj4gDQo+IE5vLCBJIGRpZG4ndCBtZWFuIHRo
YXQuICBJIGp1c3QgY2xhcmlmaWVkIHRoYXQgdGhlIE1PRFVMRV8qKCkgbWFjaGluZXJ5DQo+IHdh
cyBhbHJlYWR5IHRoZXJlLCBzbyBpdCdzIGZpbmUgdG8gbWFrZSB0aGUgZHJpdmVyIG1vZHVsYXIu
DQo+IEkgaGFkbid0IG5vdGljZWQgdGhlIGluY2x1ZGUgd2FzIGZvcmdvdHRlbi4gRG9oLi4uDQoN
Ck9LLCB3aWxsIHNlbmQgdjIgd2l0aCBtaXNzaW5nIGluY2x1ZGUgZmlsZS4NCg0KQ2hlZXJzLA0K
QmlqdQ0K
