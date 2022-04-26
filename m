Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7D105104D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 19:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346423AbiDZRHR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 13:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244226AbiDZRHQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 13:07:16 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C5F12D97D;
        Tue, 26 Apr 2022 10:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwzBt0b3F7b1xf/tQ0fW6Mivw1BsQ4yQXCD275Zwt+r9dXlyyqpof3rbtQYzxB43rDgACcCkBNfYrOq9NKor7Dje5PyCt9dY6OtXLuaC6OEsRFVlIDF8HjppodFKoCF3mi3u5W1D8xFerXhdJb/f33Y5YUIuTGlEpaAVEncukje4WqOD/b4gp3rH+BKgM7E9xnKqbEh0MU5Qp480tNxKhHD2cWYUzjJ+zGaByNiPrzmwlTScoQmQnwIEvync7jZdEjahcgbGI0tDpYhg/ZhcsyumpmrK65abO2wkTmiSh6h9EEWTotEtfmJx4UInZRdyiv3IiN6JdHfaY02DaK3H6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBT59uI0zY6NPVCAMi/IQxLT7v56TX7kQCgfeJGFeW8=;
 b=dJoG5nXG/K/GENDWcLtrKu44ina/Vqj+QFHurpgW7+f9dpbU1ROYxFpIHoNPKZ77D8CtPKrpLsrFpska4F/7aKjPYUNl+aTQg5pllw4U6qAMeZeKeibHLn8JdKl9+3LPWbhOMKCMXqnSFz/KYpYkR89evxv1RsdILgH4Y9kgumvmiHMYjLJFodJpNNS/B0c7B1BawIV50MJXJLkssktLiGO/S9kQnfxhdGpJ39BrtCJTYX674bflboi0XdOHTNZUFk3Tihb2vxDGvfj1lOi6swvy2HxOnzOu1ErdCfV0ERkFsGhWJkQgX495i3uZenORzhJRhAT59Ge1GydMg/fNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBT59uI0zY6NPVCAMi/IQxLT7v56TX7kQCgfeJGFeW8=;
 b=JJ30Mi0Fe/nH5+OZl/2UDjThWnt8Vi5lJ9kXn2SWIMnymipMuxE9MlzyvLLfOHX8aQjXCptRTOPXJtY6Liu5WlEklplIhLqywEBEWcwHCyw431NwQPeQePNFTrxcjjjv5rkkGuHHCTAGdhlBOH8iHHRlzzOUPkUrhzDGWNnnTFk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4343.jpnprd01.prod.outlook.com (2603:1096:604:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 17:04:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 17:04:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/9] clk: renesas: rzg2l: Add DSI divider clk support
Thread-Topic: [PATCH 3/9] clk: renesas: rzg2l: Add DSI divider clk support
Thread-Index: AQHYOvDKCq9hd4IZo0qAvrESkuQ746z6Nm8AgAHHRNCAAEKMgIAGaHZA
Date:   Tue, 26 Apr 2022 17:04:04 +0000
Message-ID: <OS0PR01MB59225924509A16EB4FDC705086FB9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220318175113.8956-1-biju.das.jz@bp.renesas.com>
 <20220318175113.8956-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdV9Rt6_VQ4oU-FAAM=vdrG22Qc2yBHTrEd-NrAu3FejWw@mail.gmail.com>
 <OS0PR01MB59220A6CE01D617EB4F1A29D86F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXaYHBDm5TmOskMgQGg2bPVgx4RmQVEJ3d5nXjS3s8wvw@mail.gmail.com>
In-Reply-To: <CAMuHMdXaYHBDm5TmOskMgQGg2bPVgx4RmQVEJ3d5nXjS3s8wvw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 184ac72f-868c-406c-decf-08da27a6c4f1
x-ms-traffictypediagnostic: OSBPR01MB4343:EE_
x-microsoft-antispam-prvs: <OSBPR01MB4343AD0872332F4183D3D2F286FB9@OSBPR01MB4343.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OGF0i4jbtU1kyIQP9vj3/hvji4BC5Xaat/S1fyqo4jE7jVJfoyA0crYDzc7vLzByjs7ITbomcb95v6g94bxx+AhPiEqZ4yhrhzRc/Ks5NUIjovicEDOBlVC4M+YrLOD5JPYbM7qCLbDMCXwgX9YkXw4gAuVBh805nSfxpwtqEwSSi8IqohCiixIoBcOL0Abh3YQ9qNwf5iUIgVjsFLxyGnBBu8rlyIbZ9S20fLVIXpjcODqqnZ0BQwCQtxhd5q0rIzkqg3CMTV/+PJ8xzo3eFH3JkpwA3qT7eTI2NtwGhguDp0tSufDyOEskJsbpIimnySNcdKXHr3DfPYu5dwzzHNJggseJ0PGge3lk5jVJBh9bGFd0BMBu9GEix5Ukfrvd10I5rv51kWJuAqIK2H0hgh8S3V/d+bERSal7GkyEdBCxj1KhFdyToVrFa7E7aXZRrf8bWY0jbBGM+CzZDgRntc7y1pqvE+ycfA1pLzkgW0uis1AHu2c07SC8pY/aQErje8lmqut8+npnyj6w5aObHMYaNBtL7boAChcWV6ABAdqs34KsaTUhANF9Gps1P2rO6TDDk5azaqxU6WSmb6f8JsMDx/xgXwsLI1pF9SJOhVRf4XKBUWNCvzoM19j99ZBFXWdyGyP10A+bKCdq1Ed3n1uNiGvG31I/+f80MQt84crrocgo8oR1QHqoP1iv18lOlKsuQmqavHOpenWybyTS9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(508600001)(33656002)(52536014)(71200400001)(54906003)(38070700005)(6916009)(4326008)(8676002)(64756008)(122000001)(53546011)(66476007)(66556008)(66446008)(76116006)(86362001)(66946007)(316002)(38100700002)(83380400001)(6506007)(2906002)(9686003)(5660300002)(7696005)(26005)(107886003)(8936002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjBBQU42enFsenV0OU51U1M3QWFLb3ZmbFNET29aeHFGczV4SG9hU2tGV0Yz?=
 =?utf-8?B?L1BrcW5RTlh5SCswWDl2YS9NZ0ZFZFBNNXZYTlJmUG5FVnJkT2QwK3pwYmJK?=
 =?utf-8?B?KzZFSEROS2lFcm1KQWdaZ0JkL3VFTEFCcmY3SnZ2UzJ5ZytRZGpmYlBEZnZ3?=
 =?utf-8?B?THZyTE5yeFFOMmlNQnBmcDBhWmVzOFdiZXQvQVJnZDUxVXZ0ZThDamcvbEU1?=
 =?utf-8?B?Sjh6K25jWGwrMDUrZmdsRERWSlc5MVovTkY3a2doUnRJa21vRStaeDdpMkZi?=
 =?utf-8?B?WURiWGhiN2p1VnBybTNuY01FQ1NZcktZRUxQY1pyL0RCcHdjQ2g4aXVBYUpH?=
 =?utf-8?B?RStvWTdOUzZ6bFhaRnJNWjFvbmhndUZpTHdxeVhoYzd3aHA2SXhHZEJEN2kv?=
 =?utf-8?B?bVVDa21vTk44N3BYd2lYSzJOU0RzMUpzNW1LaEU1UEk5K1piUnA2ZjZ1L1d4?=
 =?utf-8?B?MGRqOXNVL1kwdUdvSHd3eHRianMrcldHcFNYUXlhbXovZnk1VDg5VHE3eklq?=
 =?utf-8?B?MXZobUpUMysrZzhWbDBza01qbGIyZVRJKy84YzdJeUVwVDhmRGtubmJMME91?=
 =?utf-8?B?ZWdpU2xDUG1XRXNUUmtBbzN2MGR3R1g4SVBnb0xNS0svdFhXR3BIUzh3N1Nl?=
 =?utf-8?B?WTFseFBHcWpTRmJhNjhjckJQYjNZSThLQ1llOHduSWVnejM0R3VVNXd0SzZm?=
 =?utf-8?B?YlZHdXplYmRVZ3ZndXlRZEIwTXk1bU1WZktlTTBvRFBuL2dRb2NFamovWUY5?=
 =?utf-8?B?M3BQR1A0L3pzVXg0L3kxbFpsYXFoQ1pzMVBzWlFtNEc1Z1ZnS1lLQThWQmQr?=
 =?utf-8?B?YzNoNVppTmlpTzVlMi90dHdVUXlESWp0bER1NjRwaytmY1JBTUF2RnVOU2xT?=
 =?utf-8?B?RWFjYjRVa1kxOVlybldiY2tsTWhmQUZrVGw0ZkFPYnVVdXVsN1hhMmdTR2ZE?=
 =?utf-8?B?bllJQ3RsaG5wQTJ5WkdtbnYyU2RuSEhuWktVcTVjMURRWDErYmY4UjFwQ05r?=
 =?utf-8?B?d21LZFdocFVidFdJNnpNcU5NODkvRDl5bitzNDRSMnpOUjQrVDhkN0k5MnBn?=
 =?utf-8?B?WTNjL2VEUzZjaDlINFh3elZ0MWFaRFh1ejhZWDFhSEIrb3FqNGw2QS91NmF6?=
 =?utf-8?B?VUpHZUh6V1lhOVNTUmFuK2VxYU9qcXBPZVYyVWdQdWxSdWFHd0J3VE5GcDl1?=
 =?utf-8?B?aGJSTzVieFkyUDhvaUpENk1xbnJod3VXcmtNZ0NhOEFETnI1WmxVMHRSYnNX?=
 =?utf-8?B?VER6dEF1UkpsMGN6c09qaVp1cU5nOWhhUUR4SjFpNW9sVG1RZkVVcVc0ZEZm?=
 =?utf-8?B?SmN4Y1g0VEdBZnNma3VnOXBBNlhTSUVjYkxLTXluVUx2bGJDa1l6OFVZRGVi?=
 =?utf-8?B?cGkxdkxKNzE1R0xjV29aS1FHUTBJMmVFREVVK0VaWno3QitnRXFZSm5VM1NI?=
 =?utf-8?B?QkU4WmovUEc3ZU5rdWYyeWFkTGdLVkdkOWt4N1pNZmE4RVBYbTBGN3FpbzJZ?=
 =?utf-8?B?a1ZzUXA2OGJiSWM2WGNuMEZHamlhQnJYNUZvWmdnK1ErVkJOYXdYRUhaMHFw?=
 =?utf-8?B?QndJMG43TmVZc2xHK0dac1lhZWJkVnV1U1BGRGtJemIyMER3ZXl5Y1dWWVFK?=
 =?utf-8?B?THJ2cnpnd1M0eUtxdlphZm4weW1FVytWbk1VYWxjMzJSVWVNSGZpU3pXcWYy?=
 =?utf-8?B?UThPbFJ5anJHWU1vMG50S3dzakZUMGw2QjRsa08zVjd1azRNL09Pd0NIZjZT?=
 =?utf-8?B?M3hhQnFXbnU5bkdUZTdaSlpUMmJ0cjNtQTNkNFNWbkE5SWt0dzVKSktwZTlG?=
 =?utf-8?B?eHAvOHhhY1FjSU9ja3hjS0xDcjhZSFJOOGFiMThMOExNWFFoQnZQZ2F3cytP?=
 =?utf-8?B?SVJNaERYRVcxRGpJUnV2ZWlLMWhVcGhJU3dXVEhodE5NOFZ5WUI0eGdWMURt?=
 =?utf-8?B?YmpmVnEwT25XOEIyaTNFZHpSVThPZUZBODdwYjZaNy9yYmhYdHRSZ3RXcXd3?=
 =?utf-8?B?U1M3SnJBSjRlS3ltbTRGbnBqVUUxWWRpQW4xOWFyR09FS2htMzNGRytEalNa?=
 =?utf-8?B?LzRwd2N0N3MxMFJXWDV5VHFxV1RDYzlTMi80TFpERlRCMjA4N1d4ZnYzL3Rs?=
 =?utf-8?B?aGZCNVN4N2J5YlJuelBnV0E0TVRkazNRWEIwNzRaYjFsVDM0SzgrbldGMDI5?=
 =?utf-8?B?UnpSS3VPL1REb0NvajlzZ3BRVy8ramFRYi9pRGxadDM0M0RNTkQwYUovYkpJ?=
 =?utf-8?B?WmgwNSsyNGxkTklFYUFaOU5QNDZkUU1vcHI1cVdHWFd2Mm5LQms0blkyYXZK?=
 =?utf-8?B?S3ZkTnRmOWE0cm1YYkpvc25MWkRpQSs5YWVaRFZXV1pQbktNbldCNFp3M0tC?=
 =?utf-8?Q?dS9nvaANQCCc3AfI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184ac72f-868c-406c-decf-08da27a6c4f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 17:04:04.8274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XOpsBmok+CXhkeLzqqevBLqk0nk1FoCeJY5Ph1Y1o70UxgECc1QahiVMwarPfYqcmq1zEKqeM1X4tD6O6Z6IQfB4gHkiDdSKu15OEcqDO4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4343
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMy85XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgRFNJIGRpdmlkZXIgY2xrIHN1cHBv
cnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIEFwciAyMiwgMjAyMiBhdCAxOjE1IFBN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBT
dWJqZWN0OiBSZTogW1BBVENIIDMvOV0gY2xrOiByZW5lc2FzOiByemcybDogQWRkIERTSSBkaXZp
ZGVyIGNsaw0KPiA+ID4gc3VwcG9ydCBPbiBGcmksIE1hciAxOCwgMjAyMiBhdCA2OjUxIFBNIEJp
anUgRGFzDQo+ID4gPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiB3cm90ZToN
Cj4gPiA+ID4gTTMgY2xvY2sgaXMgc291cmNlZCBmcm9tIERTSSBEaXZpZGVyIChEU0lESVZBICog
RFNJRElWQikNCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgRFNJ
IGRpdmlkZXIgY2xrIGJ5IGNvbWJhaW5pbmcgRFNJRElWQQ0KPiA+ID4gPiBhbmQgRFNJRElWQiAu
DQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpn
MmwtY3BnLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0K
PiA+ID4gPiArc3RhdGljIGxvbmcgcnpnMmxfY3BnX2RzaV9kaXZfcm91bmRfcmF0ZShzdHJ1Y3Qg
Y2xrX2h3ICpodywNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIHJhdGUsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZw0KPiA+ID4gPiArKnBhcmVudF9yYXRlKSB7
DQo+ID4gPiA+ICsgICAgICAgc3RydWN0IGRzaV9kaXZfaHdfZGF0YSAqZHNpX2RpdiA9IHRvX2Rz
aV9kaXZfaHdfZGF0YShodyk7DQo+ID4gPiA+ICsgICAgICAgc3RydWN0IHJ6ZzJsX2NwZ19wcml2
ICpwcml2ID0gZHNpX2Rpdi0+cHJpdjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIGRzaV9k
aXYtPnJhdGUgPSByYXRlOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgcHJpdi0+cGxsNV9w
YXJhbXMucGw1X2ludGluID0gcmF0ZSAvIE1FR0E7DQo+ID4gPg0KPiA+ID4gLnJvdW5kX3JhdGUo
KSAoYW5kIC5kZXRlcm1pbmVfcmF0ZSgpKSBpcyB1c2VkIHRvIGNoZWNrIGlmIGEgcmF0ZSBpcw0K
PiA+ID4gc3VwcG9ydGVkLCB3aXRob3V0IGFjdHVhbGx5IGNoYW5naW5nIHRoZSBjbG9jayByYXRl
LiAgSGVuY2UgdGhpcw0KPiA+ID4gc2hvdWxkIG5vdCBvcGVyYXRlIG9uIHByaXYtPnBsbDVfcGFy
YW1zLCBidXQgb24gYSBsb2NhbCB2YXJpYWJsZS4NCj4gPiA+DQo+ID4gPiA+ICsgICAgICAgcHJp
di0+cGxsNV9wYXJhbXMucGw1X2ZyYWNpbiA9ICgocmF0ZSAlIE1FR0EpIDw8IDI0KSAvIE1FR0E7
DQo+ID4gPiA+ICsgICAgICAgcHJpdi0+cGxsNV9wYXJhbXMucGw1X3JlZmRpdiA9IDI7DQo+ID4g
PiA+ICsgICAgICAgcHJpdi0+cGxsNV9wYXJhbXMucGw1X3Bvc3RkaXYxID0gMTsNCj4gPiA+ID4g
KyAgICAgICBwcml2LT5wbGw1X3BhcmFtcy5wbDVfcG9zdGRpdjIgPSAxOw0KPiA+ID4gPiArICAg
ICAgIHByaXYtPnBsbDVfcGFyYW1zLmNsa3NyYyA9IDE7DQo+ID4gPiA+ICsgICAgICAgcHJpdi0+
cGxsNV9wYXJhbXMuZHNpX2Rpdl9hID0gMTsNCj4gPiA+ID4gKyAgICAgICBwcml2LT5wbGw1X3Bh
cmFtcy5kc2lfZGl2X2IgPSAyOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgcHJpdi0+cGxs
NV9wYXJhbXMuZnJlcXVlbmN5ID0NCj4gPiA+ID4gKyAgICAgICAgICAgICAgIEVYVEFMX0ZSRVFf
SU5fTUVHQV9IWiAqIE1FR0EgLyBwcml2LQ0KPiA+ID4gPnBsbDVfcGFyYW1zLnBsNV9yZWZkaXYg
Kg0KPiA+ID4gPiArICAgICAgICAgICAgICAgKCgoKHByaXYtPnBsbDVfcGFyYW1zLnBsNV9pbnRp
biA8PCAyNCkgKyBwcml2LQ0KPiA+ID4gPnBsbDVfcGFyYW1zLnBsNV9mcmFjaW4pKSA+PiAyNCkg
Lw0KPiA+ID4gPiArICAgICAgICAgICAgICAgKHByaXYtPnBsbDVfcGFyYW1zLnBsNV9wb3N0ZGl2
MSAqDQo+ID4gPiA+ICsgcHJpdi0+cGxsNV9wYXJhbXMucGw1X3Bvc3RkaXYyKTsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArICAgICAgIGlmIChwcml2LT5wbGw1X3BhcmFtcy5jbGtzcmMpDQo+ID4gPiA+
ICsgICAgICAgICAgICAgICBwcml2LT5wbGw1X3BhcmFtcy5mcmVxdWVuY3kgLz0gMjsNCj4gPiA+
ID4gKw0KPiA+ID4gPiArICAgICAgICpwYXJlbnRfcmF0ZSA9IHByaXYtPnBsbDVfcGFyYW1zLmZy
ZXF1ZW5jeTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIHJldHVybiBkc2lfZGl2LT5yYXRl
Ow0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgaW50IHJ6ZzJsX2NwZ19k
c2lfZGl2X3NldF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LA0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmF0ZSwNCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBhcmVudF9y
YXRlKSB7DQo+ID4gPiA+ICsgICAgICAgc3RydWN0IGRzaV9kaXZfaHdfZGF0YSAqZHNpX2RpdiA9
IHRvX2RzaV9kaXZfaHdfZGF0YShodyk7DQo+ID4gPiA+ICsgICAgICAgc3RydWN0IHJ6ZzJsX2Nw
Z19wcml2ICpwcml2ID0gZHNpX2Rpdi0+cHJpdjsNCj4gPiA+ID4gKw0KPiA+ID4NCj4gPiA+IFlv
dSBzaG91bGQgdXBkYXRlIHByaXYtPnBsbDVfcGFyYW1zIGhlcmUsIGluc3RlYWQgb2YgaW4geW91
cg0KPiA+ID4gLnJvdW5kX3JhdGUoKSBjYWxsYmFjay4NCj4gPg0KPiA+IEkgbmVlZCB0byBmaW5k
IHBhcmVudF9yYXRlIGJhc2VkIG9uIHZpZGVvIGNsb2NrIGR1cmluZw0KPiA+IHtkZXRlcm1pbmUs
cm91bmQgcmF0ZX0NCj4gDQo+IFRoZXJlIGlzIG5vIGd1YXJhbnRlZSB0aGF0IC5zZXRfcmF0ZSgp
IGlzIGNhbGxlZCByaWdodCBhZnRlcg0KPiAuZGV0ZXJtaW5lX3JhdGUoKSB3aXRoIHRoZSBleGFj
dCBzYW1lIHBhcmFtZXRlcnMsIG9yIHRoYXQgaXQgaXMgY2FsbGVkIGF0DQo+IGFsbC4gTW9kaWZ5
aW5nIHByaXYtPnBsbDVfcGFyYW1zIHByZW1hdHVyZWx5IG1heSBhZmZlY3QgdGhlIG90aGVyIGNs
b2Nrcw0KPiBpbiBoYXJkIHRvIGRlYnVnIHdheXMuICBTbyBwbGVhc2UgbW9kaWZ5IHByaXYtPnBs
bDVfcGFyYW1zIG9ubHkgd2hlbg0KPiBhY3R1YWxseSBzZXR0aW5nIHRoZSBjbG9jayByYXRlLg0K
DQpPSyB3aWxsIGRvIHRoaXMgY2hhbmdlIGluIG5leHQgdmVyc2lvbi4NCj4gDQo+ID4gSSBoYXZl
IGFkZGVkIHRoZXJlIHRvIGF2b2lkIGR1cGxpY2F0aW9uLg0KPiANCj4gWW91IGNhbiB1c2UgYSBo
ZWxwZXIgdGhhdCB0YWtlcyBhIHBvaW50ZXIgdG8gYSBzdHJ1Y3QgcnpnMmxfcGxsNV9wYXJhbSwN
Cj4gY2FsY3VsYXRlcyB0aGUgdmFsdWVzLCBhbmQgZmlsbHMgdGhlbSBpbi4NCj4gLntkZXRlcm1p
bmUscm91bmQgcmF0ZX0oKSB3b3VsZCBjYWxsIGl0IHdpdGggYSBwb2ludGVyIHRvIGEgbG9jYWwN
Cj4gdmFyaWFibGUuDQo+IC5zZXRfcmF0ZSgpIHdvdWxkIGNhbGwgaXQgd2l0aCBhIHBvaW50ZXIg
dG8gJnByaXYtPnBsbDVfcGFyYW1zLg0KDQpPSy4gV2lsbCBzZW5kIHRoZXNlIGNoYW5nZXMgaW4g
bmV4dCB2ZXJzaW9uIA0KDQpDaGVlcnMsDQpCaWp1DQo=
