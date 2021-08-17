Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589C73EEB67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Aug 2021 13:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236465AbhHQLMp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Aug 2021 07:12:45 -0400
Received: from mail-eopbgr1410092.outbound.protection.outlook.com ([40.107.141.92]:19808
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236657AbhHQLMo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 07:12:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/jjkSmNO4fkBYHu0g0ofVb6wTlEvCbA9IuiwwvYtOJLycmI+bhBjOd8qRuB+bRarzJqWI4oDQ7R+/rIuAvY6p1GN7KB9R84PmTD73SEhqB9e9JgXdDTL6jVLLMmmR/oVpJ7AVrRpmr6JO0pQ13IcH0vUqxXvgiWh0MFPy4LkqjQBOZx783Uuh/h7yrIj/0GJXUWj+AHkjo/2ljMw05KE0PKXoUL6TbTeFkkiu6IA3t0bZYt0wttP8WlYTPTCTrYjLMdS5Jcm1pz9JUq+o82B+0ZRVQzk83zH98R2SwF+7FfkyCwoUEHHTtWlkVKEbDcohz8gRj0biA1qDP8PDmD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsVuzDuMhZgPYovBMtWo+iYd5zpeN6ai2mpUA4g5JSw=;
 b=DW465lWXeoTJ5d23DfmO5sbSRcbQOzz9x1jtZzdvs5gwthY1FDoIDvJsONLzyzSiLMmtWGGnaDmfRiq3av3hf4WICKyGYioftatQloQZlayU2l6wy/MkXZKUUfn3SgnzUfL7IvOdRO1aTT9vCF4Ret3ZiMaFYiayf+cA5Pmcp/Rgaj2UXoYnpwq9JG6SK/KHyPgozPb9E1mAQbllAzLG/8Wt/g0g5tDIwsVTrSYpBFdYQVbdUo5oebTlaPqMsujV+BbYoq4z1ouHm2+7a2rX2ezO84UtUekSA3NqiAilxjacK6xtmuOs2KH7tM+U55q7a0D7w2K/3bIPv/lFOUlskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsVuzDuMhZgPYovBMtWo+iYd5zpeN6ai2mpUA4g5JSw=;
 b=arC4KhSpQoUOICr/vojG6SjcAkfanaXkUsFXdUERz5XTZKtzlaMNxEI3IpEWoMfcc35eUiRTnJ5GS9QcBVKgFeTdr7Z4t/3m0z+BjCVUco6HHgk+isG8lEYTlUjvFvJKD6dBfvn88Ev6j0l42qycuf/3dJ3GG/QFOY8fhl5KEXk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5925.jpnprd01.prod.outlook.com (2603:1096:604:c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Tue, 17 Aug
 2021 11:12:08 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 11:12:06 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 3/3] arm64: dts: renesas: r9a07g044: Add USB2.0 device
 support
Thread-Topic: [PATCH v6 3/3] arm64: dts: renesas: r9a07g044: Add USB2.0 device
 support
Thread-Index: AQHXj41M1v2ebcOZT0G+vnpjVRwsHKtwBicAgAAMDFCAB2IQYA==
Date:   Tue, 17 Aug 2021 11:12:06 +0000
Message-ID: <OS0PR01MB5922205202921BA8EC12C26686FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210812151808.7916-1-biju.das.jz@bp.renesas.com>
 <20210812151808.7916-4-biju.das.jz@bp.renesas.com>
 <2f5f8999-260d-e9c0-731e-df644b528b61@gmail.com>
 <OS0PR01MB59221C4884E0667F75748A1686F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59221C4884E0667F75748A1686F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 203ff444-ce1d-4d51-37d0-08d9616fd963
x-ms-traffictypediagnostic: OS3PR01MB5925:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB5925D478966436F3AD9844CE86FE9@OS3PR01MB5925.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J62Nv6igyHFT03loqjadC+x+GZkMt3zbEg2jBYTo+Fxdk7K21ldFBtnpdb9zfg1GW5zk5nKXWaQrQ94ELgwcE/ElA31gZN9qZuGoCh2H8FiiGNp05Qy9bMWpwDiiOo823WyMeFxY7PR9B2/lhoq5XGzfyd/RAT8etRFquLNMsaPM4JAno8zTk24r35DH1hZMJjGFwE85jyf3Nl+PIXaRhyyFhQ4JRb6axW3kgKGDrbaSMN4ClYDe0klxn34NkiQl+SciNyZU2z23bgVp8DFEtKHxTByu9dMfYu81qL/7ysd3pd5/vEgFrzmaqpzN7vpGxb2nzZeRQuiGcwTlVRJ14JwmfBE82/rWFFN2DcoJ9ujL/0VtvkBXQOiiH15og3bpLfG9MobWywew9QL64n3fuDjr3bH8aHpD7bcHP1wsI0DQWxzr4zhyM6xWN3m79XOfdBajArXvUvyU5q7jumgw/BEjjWaGdqqZ5qZGVL8IaOdxk21/sGLAVRM2FclX36b+3xGM3i0zNdPF1rLgmeWCt9IkWYw2uNBWWULLWMQqZfmmCVyuuHRCqYVToIOGGWcaSChuKew8XjY3++3IPV4yZr8gG62k8fdmut5HKLgXSMZew483h+jtFr330813vQ6sxM4Y3WJbZY21IG2crygoNuxTpNiVDux9YgRbfFi90FG7WAPuQ8sStyCFfGkxMNHSnxCu0QBD9DE7pi44tKJ57LMpZzY1hFDLhoupWtAlzLHytnTMfs8BqD9LcqIgk8vPsBiENPpCbX3aje9xR8N+kVBuRaOxbZ557Guxb0V3GPA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(33656002)(7696005)(8936002)(66946007)(110136005)(66556008)(64756008)(66446008)(66476007)(54906003)(76116006)(8676002)(4326008)(9686003)(316002)(52536014)(38070700005)(38100700002)(2906002)(122000001)(478600001)(966005)(86362001)(55016002)(5660300002)(71200400001)(107886003)(53546011)(6506007)(83380400001)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YytxeC9XM2pjb0F5TnczSStnWTMyUnZtY2UvaVNZWkljU2ZUSkk2T0pSZndo?=
 =?utf-8?B?ZDBkN2l2M25jdWRGbzB1eUtWK0plRWxRUE9IajFWYk01Mk44K05Fd2w2WElw?=
 =?utf-8?B?cDArRGI3ZGxjazdxeVM5d1NsU0dmenFYcjRBbmJQbGdsZ1pDRjh4NnNCU0xl?=
 =?utf-8?B?ZUJobjZScC9JVnNsbmRlOEk3R01DQk9JdW1zSVM2ajcrVzRFUFhHQnhLZGRN?=
 =?utf-8?B?djd2S2lNVjZBeGtZaEZ3ZnhCcVBSdlRlN2NPOHh3bm13L056YnorWXcxZzd1?=
 =?utf-8?B?andRbmhQcWNVVEJUZEY5aVkyWDFrUnVSMlErNXdFUUxnNkxmbWtLb1prVEM2?=
 =?utf-8?B?QVpqc0NHYTlncWJXbExMQm05eDBlbGMyRnU0bzAvVHpDOFBBb1FpRlFHM1E2?=
 =?utf-8?B?ZGZ3a2pPRkVuQlhDY1dHN3k5TUNucTExYXVwNXppZi9tR3RnNUxxekk5M3Za?=
 =?utf-8?B?WWZIdktnbFJveU10SzlSc2dQRjkzVTBDWFgzSXZaY2Z3TDBpU09ydEtTZzh1?=
 =?utf-8?B?cUdSNTJHSU9IOVltbm1rWWw0cnYzK3dUZUZHUDJFSktkRit6SFgvVi8zUDlU?=
 =?utf-8?B?TmlDNXJIbW9HR0RGdUs0UnZMR20vWVVsc1BWcmsxR1FGNVhLR1pRdlo4UVNW?=
 =?utf-8?B?dU9BajFWd0oyNFJLVjRHdHNmZjJQbU9hU2h4Y3U1SFl6OHdhZjVJSHZtTzVv?=
 =?utf-8?B?aVNWa1ZEYkkxODN4c2x4M1dnSW50ZG5zTzNVYk0vQmpxSzI1SDJocWlTZUtp?=
 =?utf-8?B?TjdqUG5QRUN1UnZBb3h5b0RTc2FNQ2FXbmxaWFU0bnovNUdvR0ZaMEtMejNN?=
 =?utf-8?B?bWJIMXhSVkZsNkhTaTFGVkIwUlpMMTk2MlU4bFA5bFl0RUVCcmtQSVlTNzdt?=
 =?utf-8?B?aGU1WkdsUW5qWnI2YzRJMjlNbXhTR3o5ZG9RWnFRS0JFVXVMNUR1MWltQWp6?=
 =?utf-8?B?WFoxTTRwMVgxMklEdHFIR1Qxc2x3V1JuZCtyL0JCYjJFUE9KbXJFUXBrdkFP?=
 =?utf-8?B?VmduQ3JFR1l3dVF3MlQ1V3hTdys5Q281SlpsMjJxd0IraFYwUC9kUFo3MzRw?=
 =?utf-8?B?azdWYUNuWllHVThIVFZzS1k5d1V3WEdCZ0RUTXhJWlQvLzB3V3hNdTRMK1BH?=
 =?utf-8?B?TkR0Z0MxQzBuUnRwVGt2amJIQWNLYkZLWGVSbVBsODg2bHI4Q1N6RjNYdWhI?=
 =?utf-8?B?Q0toNWhhUFRzT3Bsa1Foak90SEt0L0pPd3d6a0o4bmJaWHQxczRDZUhKTWxz?=
 =?utf-8?B?TkdEZzQrR0FtQzFWbUlhSDFNMU93QW04WUVpbkZNelM1c0Z5T3hLT21MZHZt?=
 =?utf-8?B?Z0lMSk1VbEp0Y3ZLaDRYeW5xZ28wUytJdFd1bm5XbGNWN1JwYW81OFZGaU9C?=
 =?utf-8?B?K1R3djNSem1xNDBXMDhNTmxLcWVudk9KWURhN2NzU1R1UWRGb2NVWDVzKy9Q?=
 =?utf-8?B?cWp4Wm1WNU0vMWJOSHR1ZWJQdEgydm8zdStqSHFydE1aeXNPTnQxNkFMOVpx?=
 =?utf-8?B?UW11YUdsd1FjdWY5ZDFIWlBPbmlBVXJRTExUcllWbFFvUGhZa0xicGRLdFh0?=
 =?utf-8?B?bmFQU1VPR3NzNzZOVTJud0dGNXM2Sys2LzJvQjBnSlNGbTlhdEVRdlRrZlcx?=
 =?utf-8?B?RUJ3dXJIUnZRV3VzTW9qcHNvN3BBREgxdDdlS0d0ak5QMTMyaW15blZvOU14?=
 =?utf-8?B?bU52OTU5WWVTRlgzbDE1Q1VWcHphd2dwdTJuZnVpMWtVcER3RzFDMjd5UW1O?=
 =?utf-8?Q?z85HkzWFDPcITOdCPYnDEZ0k7l91u8BipqdbwAf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203ff444-ce1d-4d51-37d0-08d9616fd963
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 11:12:06.1368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /hsGpr2p/Rte+9TU0NycakgEHov7+5s2E3USL5DNYQEAok9F3RrzlVCiEZqI18qscmo2cAecQ7wgQQKVzujU34Og6Kg5PeUZhPJzKmsfvxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5925
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQWxsLA0KDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjYgMy8zXSBhcm02NDogZHRzOiByZW5l
c2FzOiByOWEwN2cwNDQ6IEFkZCBVU0IyLjANCj4gZGV2aWNlIHN1cHBvcnQNCj4gDQo+IEhpIFNl
cmdlaSwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiANCj4gPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY2IDMvM10gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDdnMDQ0OiBBZGQgVVNC
Mi4wDQo+ID4gZGV2aWNlIHN1cHBvcnQNCj4gPg0KPiA+IE9uIDgvMTIvMjEgNjoxOCBQTSwgQmlq
dSBEYXMgd3JvdGU6DQo+ID4NCj4gPiA+IEFkZCBVU0IyLjAgZGV2aWNlIHN1cHBvcnQgdG8gUlov
RzJMIFNvQyBEVC4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gUmV2aWV3ZWQt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gWy4u
Ll0NCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdn
MDQ0LmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDQuZHRz
aQ0KPiA+ID4gaW5kZXggZGU3OGM5MjFhZjIyLi4yZjMxM2MyYTgxYzcgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0LmR0c2kNCj4gPiA+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDQuZHRzaQ0KPiA+ID4gQEAg
LTM5MSw2ICszOTEsMjUgQEANCj4gPiA+ICAJCQlwb3dlci1kb21haW5zID0gPCZjcGc+Ow0KPiA+
ID4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gPiAgCQl9Ow0KPiA+ID4gKw0KPiA+ID4g
KwkJaHN1c2I6IHVzYkAxMWM2MDAwMCB7DQo+ID4gPiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LHVzYmhzLXI5YTA3ZzA0NCIsDQo+ID4gPiArCQkJCSAgICAgInJlbmVzYXMscnphMi11c2JocyI7
DQo+ID4gPiArCQkJcmVnID0gPDAgMHgxMWM2MDAwMCAwIDB4MTAwMDA+Ow0KPiA+ID4gKwkJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSAxMDAgSVJRX1RZUEVfRURHRV9SSVNJTkc+LA0KPiA+ID4gKwkJ
CQkgICAgIDxHSUNfU1BJIDEwMSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiA+ICsJCQkJICAg
ICA8R0lDX1NQSSAxMDIgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gPiArCQkJCSAgICAgPEdJ
Q19TUEkgMTAzIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+DQo+ID4gICAgRG9uJ3Qgd2UgbmVl
ZCB0byBzcGVjaWZ5ICJpbnRlcnJ1cHQtbmFtZXMiIHdoZW4gdGhlcmUgYSBtb3JlIHRoYW4gMQ0K
PiA+IGludGVycnVwdHM/DQo+IA0KPiBUaGlzIGR0c2kgY2hhbmdlcywgYXMgcGVyIGJpbmRpbmcg
ZG9jdW1lbnRhdGlvbiBbMV0uIEFzIHlvdSBzZWUsDQo+ICJpbnRlcnJ1cHQtbmFtZXMiIGlzIG9w
dGlvbmFsLg0KDQpGb3Igbm93IEkgd2lsbCBnbyB3aXRoIGN1cnJlbnQgZHQgY2hhbmdlcy4NCg0K
TGF0ZXIgIEkgd2lsbCBjcmVhdGUgaW5jcmVtZW50YWwgcGF0Y2hlcyBmb3IgZHQtYmluZGluZyB3
aXRoIG9wdGlvbmFsICJpbnRlcnJ1cHQtbmFtZXMiLA0KImNsb2NrLW5hbWVzIiBhbmQgInJlc2V0
IG5hbWVzIiBmb3IgYWxsIHRoZSBTb0MncyBzdXBwb3J0ZWQgYnkgdGhpcyBiaW5kaW5nIGRvYy4g
DQoNCkFmdGVyIHRoYXQsIHdpbGwgc2VuZCBhbiBpbmNyZW1lbnRhbCBwYXRjaCB3aXRoIGFkZGlu
ZyBvcHRpb25hbCBwcm9wZXJ0aWVzIGluIGFsbCBTb0MgZHRzaS4NCg0KRG9lcyBpdCBtYWtlIHNl
bnNlPw0KDQpSZWdhcmRzLA0KQmlqdQ0KDQo+IA0KPiBbMV0gOi0gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC0NCj4gbmV4dC5naXQvdHJl
ZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3JlbmVzYXMsdXNiaHMueWFt
bD9oPW4NCj4gZXh0LTIwMjEwODEyDQo+IA0KPiA+DQo+ID4gPiArCQkJY2xvY2tzID0gPCZjcGcg
Q1BHX01PRCBSOUEwN0cwNDRfVVNCX1BDTEs+LA0KPiA+ID4gKwkJCQkgPCZjcGcgQ1BHX01PRCBS
OUEwN0cwNDRfVVNCX1UyUF9FWFJfQ1BVQ0xLPjsNCj4gPg0KPiA+ICAgIEFuZCAiY2xvY2stbmFt
ZXMiIHRvbz8NCj4gDQo+IFNhbWUgaGVyZS4gSXQgaXMgb3B0aW9uYWwuDQo+IA0KPiA+DQo+ID4g
PiArCQkJcmVzZXRzID0gPCZwaHlyc3QgMD4sDQo+ID4gPiArCQkJCSA8JmNwZyBSOUEwN0cwNDRf
VVNCX1UyUF9FWExfU1lTUlNUPjsNCj4gPg0KPiA+ICAgIEFuZCAicmVzZXQtbmFtZXMiPw0KPiAN
Cj4gU2FtZSBoZXJlLiBJdCBpcyBvcHRpb25hbC4NCj4gDQo+IFJlZ2FyZHMsDQo+IEJpanUNCj4g
Pg0KPiA+IFsuLi5dDQo+ID4NCj4gPiBNQlIsIFNlcmdlaQ0K
