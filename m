Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF653D39FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jul 2021 14:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbhGWLcQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jul 2021 07:32:16 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:47184
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234670AbhGWLcQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jul 2021 07:32:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1o22F0p2leBW7AjCC+fU6KxQoCJFRk9dOBO3yOhvXQWWDoUu6vlcoP1vu7vziYXe4vW+uzHlJW10WfsBXkApeabOTM/HOSTm5Teg2QRFtsCQprizP0IHR5aWNj4tnc+1pPAoQ8aCZwxoNzRcxIRqDEqtivx3D2rbxQugPvZ3kPFKlo3Tp8i2f72XaExJ2HsKUB49mU+xoQ73TKTKDrcLtzaStNEKKAKnCDIlTHphDUFmqcx4ma/Y69rW+cFJKD/mKaY1khFJlNIThACoPAx6ZJdFFMp8EHkMq6Sa1IeffzAyJqaKutXAcblujdfABm3M5ZwE2qXxKx6x6fLaRk32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP7z1AQMA/EinGE7hXrVck3WtWLp1aCjcA+6r/f+JW4=;
 b=GDyRwsfdD0Ya5FQzffMjsd/Bt8AQQzrurmvLAG1I5Oh9bOxdtRzCE3zqvOQgk++2kgCgH3TdIdy6KC1jt/4PHfpZ42CoPuINKZ8e7iNW+zT1lFe+Yxe5a06hHFOIovPXAxBX+henA3ji9mKBBJol3EMsuCZQm44jxiVMNllZM60Q9nDs8Xm7VXxI0ksvlyGCsXQrF7C1nR9peoyPeOiho2vgSimvIZ6ysUNAYLmkT3fEHODWsUPua+OXye3Hwb5X6hTuwqb4REbf41V6iahIoTFORko/uzcUgDWddMYUBq5uRi0AuTFQYoxIMD20F8LW7tnbmKWFwfrkxngh3IY5jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP7z1AQMA/EinGE7hXrVck3WtWLp1aCjcA+6r/f+JW4=;
 b=qcnTaK1WYdu5dkBRvzJZn7Em5WdLjC4NTW77swPp6jMpYb7hO2zhLvC8Uy3ZVzK+2IanWQ0jh5N1Lt4E9UDuOdFSrvXp5SQkJufEA8TmfeCGhc2ftDLG0p+DpM/d8F6/hI45f3PGm9pjFXCyN4VPcYRaWOk/ZmH7elYCNsHb8G4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6967.jpnprd01.prod.outlook.com (2603:1096:604:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Fri, 23 Jul
 2021 12:12:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 12:12:45 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next 02/18] drivers: clk: renesas: rzg2l-cpg: Add
 support to handle MUX clocks
Thread-Topic: [PATCH net-next 02/18] drivers: clk: renesas: rzg2l-cpg: Add
 support to handle MUX clocks
Thread-Index: AQHXfwPWYriT4pGmw0mv0A987jqBtKtQXHsAgAAdGUA=
Date:   Fri, 23 Jul 2021 12:12:45 +0000
Message-ID: <OS0PR01MB5922CA9C7E6C8341B0A0D31C86E59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
 <20210722141351.13668-3-biju.das.jz@bp.renesas.com>
 <9871f557-0088-bc51-d793-58c410269de9@gmail.com>
In-Reply-To: <9871f557-0088-bc51-d793-58c410269de9@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1612a68-7b1a-447a-4e9b-08d94dd32dee
x-ms-traffictypediagnostic: OS3PR01MB6967:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB69676DD9DA12BAB33D1CB2A586E59@OS3PR01MB6967.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sK9uDng69K3Yc1839OnPkwT997iUa0T5p1uFkuqT6veHO7sKT17yNminp/cT9VmXQys9agdEIHLDaXGmVvKETaXKz2HEcmJU57hQRzqE/2ebhMivjFEi88VckmcTPpU1C1G9QQ7zgekh/pS+BMtjEHlri3Q/zPTQv/Ov+Er43IGvyPsZiRh51SzcBjXBsppmCzvCrOZWbnLzN4VnlnKbx3rRnEK+bRan9nFbecvml8yzJiNgKjJS8T4XFxGzKjjUk8xOukQ4g/4FysjoUyg6ZDQwTj8rrRnsS1lC96XgtbBbwnXMNaxV+UI/pHxXpno1OvmCy5eJuZpnRXKp5EvfWeiOb/Z/Jdju/IReJqogs68L9ihqZN6Tm/+sb8aiVGYKAzazpV0mujtUfAHs5TYVEPKtd0HRVpqjhWWniL0M3U5P81pmxhvMFTJUAlWiNRp1lEIys3atvXKtRsjI5g6blqA76XaVJr6qwHBkvsyWr5Vte7uXXkP5/ibmOaRvgkU8XXQ4f6+5qEBPDE71xlORhvKzL7Nr1KkodxOP32cMmZMwY0RyTMk0gdY/6O7wh7ym1mqwc6yJNSUTpsPoY01SlbeD/JTifda33XOykgOOWzDLaagnRaKWPkScSfhWkbWIMVqJ50KUqTTS0hQt0kLCQqE27zKGuX53xv2ugnwW/VMAPSeyuYvTkYf933ddzDyoO4l1YdchIJ+i3c0UGOqrGQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(2906002)(9686003)(66556008)(64756008)(33656002)(478600001)(7696005)(4326008)(110136005)(54906003)(122000001)(316002)(52536014)(107886003)(26005)(66946007)(55016002)(8676002)(66446008)(186003)(66476007)(83380400001)(71200400001)(5660300002)(76116006)(8936002)(38100700002)(86362001)(53546011)(6506007)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWhsaDE4WjZIK3ZIQkJYSXF6RTMya3h4bHlyUnNRM3YzV0pTWDJHY2J0bGdx?=
 =?utf-8?B?VHlRS3E2dE8yS0FBNDhVZHZpRStWV3dGQTQ5ZXVoRkVHSUhCOHFuT1YwVUJK?=
 =?utf-8?B?NkNWQmRjT0VGdHJzQlVkUlpqOVJpdEZGdllPZ2R0UkNwVGJUNnpUd0VVYlJn?=
 =?utf-8?B?YzlBUGppamQwMWQrZmFBZTMyd3RqRnp5bThwcTVnNnpKRlB6b045MEs2SkMv?=
 =?utf-8?B?RWFmYWdBSm5OY2ppQytUcFNxd0piODBSVGVZSHQ2bWdOKytDQzQ2THNPaFY0?=
 =?utf-8?B?NUhBaFEycy9hcUxsSWNhQVJ1QnNQM2R4bHU3b0xxbUs0QlZxZjQycFkyS0M1?=
 =?utf-8?B?RHNmK1lhbW05cFdEMjE4R3h2cTdNYmt3NVdoWlRCbGxRdVBsT0wxUUc0eGRO?=
 =?utf-8?B?STlvaWxHSUcrbzJ6QWVhQkdHRFFDR1ZGNkpWWnFhUjNYMDRzTFQ0bWllK0xM?=
 =?utf-8?B?di84WGk1WmxUY01Rb0JhRmR4bU9PUnJpZFI1SVhHQ05wVWtTRE40ekRJdlcv?=
 =?utf-8?B?c0JmcWtLUFNaSmJ1dTV6NzlSSjkvMDM2anVWNUNITFNRTnNjTDlEeHJUQWtR?=
 =?utf-8?B?UDhkVGRHQ25VVUJVTE03NFUyMTRwTWZQckFUVmF5R0thR1dCNzBtbTdRc09J?=
 =?utf-8?B?WCtsUkZsZC9TMHZGSU0xd0hlZ2hTUXpoNGR5RUM0QmpLaExXTFg3NVFoVG5Z?=
 =?utf-8?B?N3RhUVBwWEZydWNFT09DdGdzZkxtMmxTRHpmLzZDMThvSXRYN1ZqdHZJb3lX?=
 =?utf-8?B?UHdQSHI1M293ZlM2ZFpFamNueUI2cXY3LzRwajlLTVBpRjA4ME5MOFpJR3RN?=
 =?utf-8?B?ZkVVd0sySjM5NzFwQ0MxS0lSNmZHTjZURVVmd2tmMTlxNDFZNzhkd3RaZUxk?=
 =?utf-8?B?TjRGOUwySUV3VG8yVjdWYXBseXJCVXVRWGpyUVhXWjFzZWZtU0o1c1IrKzVH?=
 =?utf-8?B?MXVnT0xlS3hXOEdzcWl1TWsyUEc4QWw4Tk5sd0ZHdG5aZDJjM21obWdJVks3?=
 =?utf-8?B?dU85RWQyTGRaV0RMOFJLdFRocFhROEw2NEYxRWNDeWdpYldsNnRsa283NmlR?=
 =?utf-8?B?VWh1dkthZ0k0TzZvckRJZW9MWWxNR28wVGdYbE5IQ0VTYzQ5UlNma3pSdnVZ?=
 =?utf-8?B?MXl0SmZyVlV3Q3orYXMwZ0hRdDBrZGtsV2FFdHZ1MWxOWmNETDlQOWFEdTBa?=
 =?utf-8?B?MVBteWVWcVVUKzJwS2VEbkdWd0d6dVNTajJ5MUsxMG5Ib3FJQkFFekV5bjlt?=
 =?utf-8?B?UE1GbmI3K3JJS1lKcVdlZjNaSFpDOFNWQ3BqMzhnU3BWcVB6elI0MUdnL3hV?=
 =?utf-8?B?WVVoVit2ZFZ1dEhuTFZMSFlMSXJVaUc0NGJ3K2JRVTFNMmR5N1o3VHZicGUy?=
 =?utf-8?B?ZVljUnhGWUI3MGV4bGFXQTJZT3JpM3hIYXFiZS9vM3BuQ2NueDJsVmFBd28w?=
 =?utf-8?B?aTdwRjlOMjFMUmJaSG0vNktVWFdUV1NMVW5EcXFuMU1xd09FaDFwd3V2VEJJ?=
 =?utf-8?B?Rk9FSHVMTU5GVHc1aDBBWGRkR1oxdFpnVEhncWtpbmlFeDJzR3FYN3Rhb2lt?=
 =?utf-8?B?Y1htNERCN0d2VUxYdmYvSUptdm9TSjJ5blM2WnJybVVhT2RQZjhqcmZ2aVJE?=
 =?utf-8?B?dkt0NjVhb09sRERkelhvZ0s0S3BobHM1YVpWS1hwamcyb0o4ZjNtSGRHY1Rk?=
 =?utf-8?B?Rk1zeEVlbUx6ZXdZVGwwa1BWWU1ObE45dlNCcm9DUS9lZExsTjZMdlR2dThB?=
 =?utf-8?Q?KhUsV3UzHGdvNF9BC0dC2x0MOcYZTBwrfexztSL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1612a68-7b1a-447a-4e9b-08d94dd32dee
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 12:12:45.2133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cv2xyBOcmqbsMPjisLz9Y28fjL05+OpPW1fULkdf2R46wN6wjL/Ma6rEhEBS/6xeY3C16FhQtwfYgEUiO2DArsBr9vpUO5bseeYwboBhbao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6967
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpIaSBTZXJnZWksDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIG5ldC1uZXh0IDAyLzE4XSBkcml2ZXJzOiBjbGs6IHJlbmVzYXM6IHJ6ZzJsLWNwZzog
QWRkDQo+IHN1cHBvcnQgdG8gaGFuZGxlIE1VWCBjbG9ja3MNCj4gDQo+IEhlbGxvIQ0KPiANCj4g
T24gMjIuMDcuMjAyMSAxNzoxMywgQmlqdSBEYXMgd3JvdGU6DQo+IA0KPiA+IEFkZCBzdXBwb3J0
IHRvIGhhbmRsZSBtdXggY2xvY2tzIGlub3JkZXIgdG8gc2VsZWN0IGEgY2xvY2sgc291cmNlDQo+
IA0KPiAgICAgSW4gb3JkZXIuDQoNCk9rLg0KPiANCj4gPiBmcm9tIG11bHRpcGxlIHNvdXJjZXMu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvY2xrL3JlbmVz
YXMvcnpnMmwtY3BnLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIGRyaXZl
cnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmggfCAgOSArKysrKysrKysNCj4gPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwt
Y3BnLmMgaW5kZXggM2IzYjJjMzM0N2YzLi40OTFiMTBkYTU3NjYNCj4gPiAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+ID4gKysrIGIvZHJpdmVycy9j
bGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+IEBAIC0xMzAsNiArMTMwLDI3IEBAIHJ6ZzJsX2Nw
Z19kaXZfY2xrX3JlZ2lzdGVyKGNvbnN0IHN0cnVjdA0KPiBjcGdfY29yZV9jbGsgKmNvcmUsDQo+
ID4gICAJcmV0dXJuIGNsa19ody0+Y2xrOw0KPiA+ICAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBzdHJ1
Y3QgY2xrICogX19pbml0DQo+ID4gK3J6ZzJsX2NwZ19tdXhfY2xrX3JlZ2lzdGVyKGNvbnN0IHN0
cnVjdCBjcGdfY29yZV9jbGsgKmNvcmUsDQo+ID4gKwkJCSAgIHZvaWQgX19pb21lbSAqYmFzZSwN
Cj4gPiArCQkJICAgc3RydWN0IHJ6ZzJsX2NwZ19wcml2ICpwcml2KQ0KPiA+ICt7DQo+ID4gKwlj
b25zdCBzdHJ1Y3QgY2xrX2h3ICpjbGtfaHc7DQo+ID4gKw0KPiA+ICsJY2xrX2h3ID0gZGV2bV9j
bGtfaHdfcmVnaXN0ZXJfbXV4KHByaXYtPmRldiwgY29yZS0+bmFtZSwNCj4gPiArCQkJCQkgIGNv
cmUtPnBhcmVudF9uYW1lcywgY29yZS0+bnVtX3BhcmVudHMsDQo+ID4gKwkJCQkJICBjb3JlLT5m
bGFnLA0KPiA+ICsJCQkJCSAgYmFzZSArIEdFVF9SRUdfT0ZGU0VUKGNvcmUtPmNvbmYpLA0KPiA+
ICsJCQkJCSAgR0VUX1NISUZUKGNvcmUtPmNvbmYpLA0KPiA+ICsJCQkJCSAgR0VUX1dJRFRIKGNv
cmUtPmNvbmYpLA0KPiA+ICsJCQkJCSAgY29yZS0+bXV4X2ZsYWdzLCAmcHJpdi0+cm13X2xvY2sp
Ow0KPiA+ICsNCj4gDQo+ICAgICBFbXB0eSBsaW5lIGlzIGhhcmRseSBuZWVkZWQgaGVyZS4uLg0K
DQpPSy4gV2lsbCBmaXggaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQpDaGVlcnMsDQpCaWp1DQo=
