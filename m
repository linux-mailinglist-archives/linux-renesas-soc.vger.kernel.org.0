Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8B8F704837
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 May 2023 10:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbjEPIwy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 May 2023 04:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbjEPIwm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2023 04:52:42 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA824C11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 May 2023 01:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATiDPz5kUwV/owtowEi1B79/SUW00VYKVUBfRgXlh2dbLjbUKLFZBj+ok1JxpQu6tvcN1/mZqVtEwKHnWiG4ZKhQjH4QKOkvXTxhASSHMFoleIF7hFaTVaojMIBv5PSprqpBT09lEmChEmuu+oZ0m6A1oMaHS+vuvJ1UlIp1LrFzgx1rjMNsjfMrWKYVW/poABzpcQHDPcdRNbGR986B8UnnDBCWvJqGzi3IuadRmavucon/xeiUR7hNIGB5ncFFfyY0c6TlrDoa7MsIxxUQiB6VasJlh361eylOH6nI7VgDjrJwt1wEKBhTsM19WeaFKr5wj6kY2PjTnmeWmyHDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urwqMu/gzx0TgWQWPKTcFrJSvSymd8FSBsNsSO4P8IY=;
 b=UcsWyueu0E3iylltIlebhW0mFtVU69xeK4JrIbyyvvmDv06VQ0lretfHIIvdkzy4luIAL/Piao7tM7jGvVaJaFTkeGxFhFWPSyPIpzKe245R2pGURAs9GwhRiZop8xd9rTMHQGuS1R2c2Jzgv8km0Bv0LHbigHi0e19zG9DmxTQWCKHXeyL/pyrYMyplxirSO71k+ixhiswF9hmexIKUbCs7Jr7KDN9p5pd2xaSJOvPIVN/HZPfPWmIIdjndTbOGSpqUESHow70JGrbvvObsCYf94QTaalVi/jS0DlS5QOutAOnrv6l5Ku5z4/DfGNf4ahQRmewy0oiqmaATj7qFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urwqMu/gzx0TgWQWPKTcFrJSvSymd8FSBsNsSO4P8IY=;
 b=L1lMr++exjggUXjmM4+EMr2Z/Dm3qOKXZ/jwdCWbknKxoI5RUAfopuy4DZqsI7XYA4N0RIyWQ5xfPkRKzciEpeuGLeq4QDT58MD7OABoWXq6yx1tfUtqzb/Nc3KV0JRYsL2bUertX+NVJfOSxzzobI7SG4U6fYS2BMO9WN3/rBk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9820.jpnprd01.prod.outlook.com (2603:1096:400:224::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 08:52:25 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 08:52:25 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Lee Jones <lee@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v3 4/5] mfd: Add Renesas PMIC RAA215300 driver
Thread-Topic: [PATCH v3 4/5] mfd: Add Renesas PMIC RAA215300 driver
Thread-Index: AQHZhbtdhLggSV9820WaRbcx0Ic7s69cjiAAgAAMrNA=
Date:   Tue, 16 May 2023 08:52:25 +0000
Message-ID: <OS0PR01MB5922D8584AFA3C9A33171FEE86799@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
 <20230513165227.13117-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdV7D_jh3ERjKA3uXSwYFwAG61ztu5mas957dt4TBU_Bgg@mail.gmail.com>
In-Reply-To: <CAMuHMdV7D_jh3ERjKA3uXSwYFwAG61ztu5mas957dt4TBU_Bgg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9820:EE_
x-ms-office365-filtering-correlation-id: e0e74926-5f6a-47d8-3161-08db55eadf21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +T4I/FrbW/V78TSmVVbLiLDMoTwOKTDGq1FYSoX08gKze5jKXYW6DGx3symi/meOLyAtH+Nwr4lkzS+EyRxL6exeXISmzoPtM7FBmpCSRIBKKtp4C2l8eoXhr4bgeJilAnL6/acR1AoF1m3nBx+8qTcGIzK2VCZdHUiv1qbsH7jBeYkn0ASvNNqr5ibKWHVugtZyRkNR63BGTOchdqLy4rakqSgJj8cKeUAyvxKdec7hmSyc/LuG3xQ/xTcPz2pgpiaqaotu1u0+xsiP3MbE2MGk5RvSsJGQ1mT1OrdlHoxXkwbHpYh+bJslG1rLRWPJXb3YgD53Osr0ynxhwqc/hU+SBag52r0YSpozU5t09YBQp8tQdiMfpnSDxPzDdoHqV5vzVUMoubp5atsc9kSLrqQQmjFX9hDtD4D1ESwjUIEV8JKioBicIOsPZeXsTLZRqCdYuBRmpMqBuuHme4o9R0PAub4AViy3/V7EI6vshrPf2Wbfy5l1G6Q1wKIit6IZcCz5EBXNh58XoI7V99oBGcfdKx6eCxye6H6sydohdgCAZlA61PSmgCJbpftOnWfMaZCXl1wp/3O9jxZna3zluSLmJPneSupfnucS1oRcxkJcAJK7Pvg8zMw+46ZUHcAC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199021)(71200400001)(41300700001)(26005)(55016003)(122000001)(186003)(107886003)(38100700002)(33656002)(9686003)(83380400001)(2906002)(8676002)(6506007)(8936002)(5660300002)(53546011)(52536014)(7696005)(76116006)(64756008)(66946007)(66556008)(38070700005)(66446008)(66476007)(86362001)(316002)(4326008)(54906003)(6916009)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bER2dUhoeHh5dnBwNmhKRzYvN256Mll6QmxxNW9EdjdRRUllcDVhZW5FbGNz?=
 =?utf-8?B?bVZiWnpwT2tMSW5KU2dMcEFwL1BOdEVLQWVkamNQbXNRWVB3NndwL2ozSnl6?=
 =?utf-8?B?U1c5aitNUUlvZFY0SWNjVTlBb3hmZnRnRkl6eW9rYm9MZnRzUjZYREZvL2pO?=
 =?utf-8?B?allzcEVNUEptWmtKNkM3Zlh5Z2MvMkFxdHcrN0JYd3dqWTEvbWd2S3hIbzVE?=
 =?utf-8?B?NU5HQ2VIL2RxbkhaL3Vva3MyWlRGWlVIK0RYb0o0M0lsckxFQk1iTGRPazVZ?=
 =?utf-8?B?VGJiajMveDI1dVY1bmNYckE4UjFkcDZvUGdyelBoVHl6ZUxjWkVRK2t1L3V5?=
 =?utf-8?B?QmhXTHZ5NjRtYWFXb2svOEdBYmw2M1d1YlVHcTVBT2NSVU9GRVdCL0pCR1BJ?=
 =?utf-8?B?NFZEVlZ0eXQ2WEcvL045WFN0VlhKVWRUd3pnWC8vc2psNFlXZTRUYkVZRm0y?=
 =?utf-8?B?SmhEKzZySWF6TDQ4MmlvN3JydkpDTEtzQThFTjl2eGIrWE15bjR2VlVnbkY0?=
 =?utf-8?B?aXdsd2JRM3Z2L2p4OXBxSDQzSHZmZ2QvaXB2OG1wK3RrbVdydVRIdDg4QjhW?=
 =?utf-8?B?cE5EdkJ1WEVWQ1p2TmlIU3NnZWVNYjQyWW5YUDdpWU8wVHBjY0FPK0tKMG9p?=
 =?utf-8?B?LzRBMFA3Qm1wT1psZ3RQODRkNTNOQksvWTdZRW5Ia1lWM0ZpUFl4L0t5Y2VY?=
 =?utf-8?B?dGg0enVhTFNRWVZSc3V4MmtjK2c0Zm9rMjdzWGhiaTVKMlZETWNITXQ1Q2ZZ?=
 =?utf-8?B?YVFoQ1M0RDl4bU9scEl2UUNQS1VTeldRV2RqUzZha3RSZ0FNSXhSbERGR2I3?=
 =?utf-8?B?N1NwRjFqamFlTlZ6cnRmMG5zanhsMnR3RnVVV3lwTjJIbnN0am84RlRMSUE3?=
 =?utf-8?B?UUZRR29YRFZlOGtwazNzSjlmSHFyK0Z2aTRIcnk4UXNqSXB2ekhoejdtSmdD?=
 =?utf-8?B?MlI5RXpVRUVjMkRLTmhiQzA3dXFBaG9MZ24rL2xSUG1uc3V2a2hTQkJYNEdF?=
 =?utf-8?B?NUw4RGlXQXB1dWhUd2RuaGxxZWsyMGJ4WGZyUm04TWRMQkdzRVpuNnBBM09w?=
 =?utf-8?B?UHlnanBDV09nQVdXcXJDdXVaVGE2NGsrOFhOKzJWQkxrZ0NDekQxQmhzSWVD?=
 =?utf-8?B?NVpNbVlvQmJzYWJTQjdTV0JPNEpOblJEdjhINk92VVpBMkFha2k4RERmdzVx?=
 =?utf-8?B?MnhPcHpXWnRPTVZjb1FOMzR0NlFPZzgwV2F5THJPYVg2MVFsZjF0YjNCcHNI?=
 =?utf-8?B?SVZIMktpdFBjekxvM2xZNHN6b1dHYUU5RFFvQzdkeFZsM0VmTjZoZ0k5ako4?=
 =?utf-8?B?bDRZcGduczNFMnUxS0VBcEN5ckZzajk2QitqUGJQTk1vWXYyUEZVVXRwaU5Q?=
 =?utf-8?B?bDd0OEpEREhiaGN6OXJCdmdUaktxYUUyanlNOGhDcGhwRVdOMENHRWlTaHdv?=
 =?utf-8?B?VUVpcXZzZXB5LzRSQTRYdTFXbHlrNVJBTXBDWEdBUS93UHhGTWRkak1sTEU5?=
 =?utf-8?B?QmkwQTBKWEdObEVTQ0d0alZUTGo2YlN0dkZWdnNFL0tINHpLN0N5YW9MUHUv?=
 =?utf-8?B?TW56MmVsU3RTZk03L1dFNFhLMVJreGRMeTBjV2dzVDJNTWpvajhiNHBpS0NC?=
 =?utf-8?B?OTN4QW5BVktQR3YreW9WSlQ5ei8xZDRZN1gzdzZCUjRxSnFQR1FuVHRlUEJD?=
 =?utf-8?B?aFRNTjMrN2MvaTdLVGs4ems5SWlndzlHK2RjS1RsRWZFcjFjWFZnOWtYM2JS?=
 =?utf-8?B?NjRqUlJtWWxFRFRpaE9pNHplMDBkRWhLTUlITnNOWkhCWm9JekRPWXdyd1Y3?=
 =?utf-8?B?UFRLQ1JrV3JDMVBCajJOVmtCQXBBUjJZdnV4dmVqdTVvR0QwamZYQXFsS0Rw?=
 =?utf-8?B?T3haZHdzZWRicGI1akxxMWR4K0paYk82K0lxVUY1RC9wRmtkVkNmYnRQRmpo?=
 =?utf-8?B?dUpSSnZHbmJuTXBxbEFCUlhCZ2o4a1lJYTFjUVAxSEJjNTZSL2JJTUJqc1NL?=
 =?utf-8?B?Z21kNkQxWGpXcW0yeE9EaGNoYzlXRWozUWFWa0lMeUl3TUE2ZGRLNExHRUhS?=
 =?utf-8?B?UkJEOWZmbGZ6dnE3czB1T3I1bHBiOUw3cTkvY1grZTVkTm1xRFJFb0Fvdksy?=
 =?utf-8?Q?rUgL1YEyJzFYd1KcZsAqi36WF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e74926-5f6a-47d8-3161-08db55eadf21
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 08:52:25.6916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wM0aI7T/D133IoLoyof2So4QqWlJEsUunWHqEm7705cEgBKlBrMjkUG9/d4KI877Tsll+kAC5FxXMNH7Y2RIDe/ytVfX4eVRFEntz+6fNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9820
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgNC81XSBtZmQ6IEFkZCBSZW5lc2FzIFBNSUMgUkFBMjE1MzAwIGRyaXZlcg0KPiAN
Cj4gSGkgQmlqdSwNCj4gDQo+IE9uIFNhdCwgTWF5IDEzLCAyMDIzIGF0IDY6NTPigK9QTSBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoZSBSQUEy
MTUzMDAgaXMgYSA5LWNoYW5uZWwgUE1JQyB0aGF0IGNvbnNpc3RzIG9mDQo+ID4gICogSW50ZXJu
YWxseSBjb21wZW5zYXRlZCByZWd1bGF0b3JzDQo+ID4gICogYnVpbHQtaW4gUmVhbCBUaW1lIENs
b2NrIChSVEMpDQo+ID4gICogMzJrSHogY3J5c3RhbCBvc2NpbGxhdG9yDQo+ID4gICogY29pbiBj
ZWxsIGJhdHRlcnkgY2hhcmdlcg0KPiA+DQo+ID4gVGhlIFJUQyBvbiBSQUEyMTUzMDAgaXMgc2lt
aWxhciB0byB0aGUgSVAgZm91bmQgaW4gdGhlIElTTDEyMDguDQo+ID4gVGhlIGV4aXN0aW5nIGRy
aXZlciBmb3IgdGhlIElTTDEyMDggd29ya3MgZm9yIHRoaXMgUE1JQyB0b28sIGhvd2V2ZXINCj4g
PiB0aGUgUkFBMjE1MzAwIGV4cG9zZXMgdHdvIGRldmljZXMgdmlhIEkyQywgb25lIGZvciB0aGUg
UlRDIElQLCBhbmQgb25lDQo+ID4gZm9yIGV2ZXJ5dGhpbmcgZWxzZS4gVGhlIFJUQyBJUCBoYXMg
dG8gYmUgZW5hYmxlZCBieSB0aGUgb3RoZXIgSTJDDQo+ID4gZGV2aWNlLCB0aGVyZWZvcmUgdGhp
cyBkcml2ZXIgaXMgbmVjZXNzYXJ5IHRvIGdldCB0aGUgUlRDIHRvIHdvcmsuDQo+ID4NCj4gPiBU
aGUgZXh0ZXJuYWwgb3NjaWxsYXRvciBiaXQgaXMgaW52ZXJ0ZWQgb24gUE1JQyB2ZXJzaW9uIDB4
MTEuDQo+ID4NCj4gPiBBZGQgUE1JQyBSQUEyMTUzMDAgZHJpdmVyIGZvciBlbmFibGluZyBSVEMg
YmxvY2sgYW5kIGluc3RhbnRpYXRpbmcgUlRDDQo+ID4gZGV2aWNlIGJhc2VkIG9uIFBNSUMgdmVy
c2lvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2Mi0+djM6DQo+ID4gICogVXBkYXRlZCBjb21taXQg
ZGVzY3JpcHRpb24NCj4gPiAgKiBBZGRlZCBzdXBwb3J0IGZvciBoYW5kbGluZyAicmVuZXNhcyxy
dGMtZW5hYmxlZCIgcHJvcGVydHkuDQo+ID4gICogQmFzZWQgb24gUE1JQyB2ZXJzaW9uLCBpdCBp
bnN0YW50aWF0ZXMgcnRjIGRldmljZSBieSBjYWxsaW5nDQo+IGkyY19uZXdfDQo+ID4gICAgYW5j
aWxsYXJ5X2RldmljZSgpLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiBS
RkMtPlYyOg0KPiA+ICAqIERyb3BwZWQgTU9EVUxFX1NPRlRERVAgZnJvbSB0aGUgZHJpdmVyIGFz
IGl0IGlzIGFkZGVkIGluIFJUQw0KPiBwbGF0Zm9ybQ0KPiA+ICAgIGRyaXZlci4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgfCAgIDcgKysrDQo+ID4gIGRyaXZlcnMvbWZk
L01ha2VmaWxlICAgIHwgICAyICsNCj4gPiAgZHJpdmVycy9tZmQvcmFhMjE1MzAwLmMgfCAxMDIN
Cj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IA0KPiBOb3Rl
IHRoYXQgdGhpcyBkcml2ZXIgbm8gbG9uZ2VyIHVzZXMgYW55IE1GRCBBUElzLi4uDQo+IFBlcmhh
cHMgaXQgc2hvdWxkIGJlIG1vdmVkIHRvIGRyaXZlcnMvcmVndWxhdG9yLyBpbnN0ZWFkPw0KDQpB
Z3JlZWQsIFdpbGwgbW92ZSBpdCB0byBkcml2ZXJzL3JlZ3VsYXRvcnMuDQoNCkNoZWVycywNCkJp
anUNCg==
