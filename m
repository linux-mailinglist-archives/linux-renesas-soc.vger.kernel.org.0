Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762A03EA8B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 18:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbhHLQqt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 12:46:49 -0400
Received: from mail-eopbgr1410115.outbound.protection.outlook.com ([40.107.141.115]:6631
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232081AbhHLQqs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 12:46:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxihL0/DQ7AzruYQVY4ejWLFimsCHt/f0cw5OvY0Y27dH/sQtitiGZEHv8mojkBJuKov9JWrYHqwHn7t70okwGIhxjSA+MYGSxM5a04jVmpJtcljugLHWBLUfYjHJa+Az/A6ciJKELRa2irLDS9Mk40FryEbzpqhGe+j4w2BO95vsINhwEZ7MotTWghnAzB9BmRNNU4yLhfOMTq2tmHvJi2v5avPVXr5eN2qAsSuSJ5Cn0UJRKi7nrH/5PjlwqbYNQ/fflI5U5YttVpuytCgzWmc9BzFSMGCxNf0EAhChpl7WxcSlj6TRzcnDv22wOtePvPGgX4ipj+/0e0RfTxhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ld8heD9ClMjb5olSVCLP+sBkK5r8K3xVmPm4WYjVUo=;
 b=UyNs501vPGYzB11B6qeVwoBfokVCDPSUR+cbEwZlY5dBidBv0lwLACatTSXpk5woCIyd/D2DcSfmKXWgoQonn/4hYPqDWLxDXQIHQbCxLtb9Psyv7F9UP2XF1bp10P/bs6FnBpD3CbUS5a2o/EhNdW1y+TmYIW6qCmEfNmpnYIrk2PmZJpkfLv/oFM+HRZ+H1QqtaNcDXGvdCHVhuE7JNJMBARdOgncFdf51pMq2DUosmG9CKaT9giKJEN9aRfH4kqIvJgNTpUkAa6wQBGp34jVTL147VXcH2dxLmftx80e+f5GAs8wHH2F9nU+QSYCg2HKuL5pFp5f5wTOywPmkig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ld8heD9ClMjb5olSVCLP+sBkK5r8K3xVmPm4WYjVUo=;
 b=lsA0oapXW6e0RaT4GfI4Vs/pYsHm/KphnaETx/136Ly+mbLH57gKP7Y2/E95g+L8E00Cu7Cf6pQ5nzK0/BNwo8BUgoaYLssfiJ65fUBgWWGAEuu7RnjawujpZRlTKlKu3yAPc9DIOvfGfBrYotsBVK6RsNbTzw7mPjtWMyw4jac=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6863.jpnprd01.prod.outlook.com (2603:1096:604:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Thu, 12 Aug
 2021 16:46:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.018; Thu, 12 Aug 2021
 16:46:19 +0000
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
Thread-Index: AQHXj41M1v2ebcOZT0G+vnpjVRwsHKtwBicAgAAMDFA=
Date:   Thu, 12 Aug 2021 16:46:19 +0000
Message-ID: <OS0PR01MB59221C4884E0667F75748A1686F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210812151808.7916-1-biju.das.jz@bp.renesas.com>
 <20210812151808.7916-4-biju.das.jz@bp.renesas.com>
 <2f5f8999-260d-e9c0-731e-df644b528b61@gmail.com>
In-Reply-To: <2f5f8999-260d-e9c0-731e-df644b528b61@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38b22ac5-65ad-4fc6-4bc8-08d95db0b60e
x-ms-traffictypediagnostic: OSZPR01MB6863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSZPR01MB6863C935772B97D7F347DF6686F99@OSZPR01MB6863.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RkXyLCJmeSR19GO2WNlTyMrsZblM/NXueZenbou5CwvvQRDTAlh8+yeS524dYLGd9/VPcEj89T2BMr6Nrmc7f6CJ33LmioNM2lWW7IMd1+6rlQfJwovTPAC+CDS/zpj7gGK2FYBjROA79GHvgd8+wDDgpw4fBXtSm9FwobNl2cId4HwgVecul3w+jzPAQ0fsgsGvOhWIISJfeh1cR6yVJYeIIW5uwC82RqAtro9qZuJngHcuv6Er6HXk8dqYmhwvLbgWnxa8RZfXAoNzMTs+DpePpiU/OsUw4V83ST8kWsB363WnLpyHjbGzmn6CENtzt/FaC+BLG496PALtL3sMhTUdJBiYVOx2hzBvmLS+llDlbowBfebnGVdQTDWbCF39hQgPhwum+kieHOsE1lGZGTMJn7lxE67uh+cnH4WQ5ZlZcZbT/uKkHib9QR04tSituWPXoyaJ6BR6xNd9N8r8MPq3TKIVwzFiXDRSiWtnEDFVlY+1achsfErxPDOcBNcQrcVhWuqEsL/y8O9+NEKwZ2IlJ41UUy04krbkZs8GuIdd49YjRLldjXb21MfovqQYELSbMhBVfnhfdYMCB2Q9waXCSKicwikf1xJIXVOadDjN8/feyAMTqD1RXCrHKDR8ORO3gAEsDy2df17e7vcNgr714wkR446hzpVer8ZU39K/UXsmXZfIYyhVCIBy3UjA6p6e7AYblQ6mK3qNbM9EI9jCaBthTEXtmVkuxO5pr/nDB2LwutrlLAtBVmcW0qdM/jY4ZPQ06ybuHVT1lcPKqParVjdLHVIVOqEdne/xaVY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39850400004)(396003)(376002)(71200400001)(7696005)(55016002)(9686003)(64756008)(122000001)(66556008)(26005)(8936002)(54906003)(66446008)(66476007)(8676002)(86362001)(478600001)(316002)(4326008)(5660300002)(107886003)(38070700005)(966005)(6506007)(52536014)(110136005)(76116006)(66946007)(2906002)(33656002)(83380400001)(186003)(38100700002)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1VMS0s2YldRZ1JMTDJzdXRKMWxEZ1A1cis1Z3hzc1hrbHlYUHlhcVphcVl3?=
 =?utf-8?B?dDNMZkt6WjFPZS9vNWJSZ3hOd2hiL2N6ZDI1d1dOYzVGVXl0UXNZZ3kwTmJV?=
 =?utf-8?B?Mmc5TVNkQXU5Q3BRK2xMajdJMFRDbnZ2SlVMUjl3MDN6cEUyS21wa3JMa1dB?=
 =?utf-8?B?ZjVrVUcrdlJBeXJpejNhR25pUzhwZG9OcEg1SG4wSlRmRnhNcVV1UzlFbTR1?=
 =?utf-8?B?QUpnTnJyNXZGOW1PS1lLKy9UR1IxMksyV2VOVXgxbTNZUWdDK1FzZVdCaWxE?=
 =?utf-8?B?OGYxWHpOeHZmajJXalBCQ2F1YjQ4ejdQYUtjbkY1UDBvRnFBRlU3MHRWZXFH?=
 =?utf-8?B?MnZMTnpIWEZuS0JaUytDVXR4TTRYb1BySmk4WHFqUWNNdUlNZ0FNSk8rWWVi?=
 =?utf-8?B?YmJYZktJLzU1aGpLU2MwRkQ3aTM5SGlXNytrTGx6R2E4Mzc0YS9OWXRUV0dt?=
 =?utf-8?B?aHNBUFBtN0RTUDZDUmhEZENJWUlqYjJ3K2JZZXpmRncyc25BenY3UTZHV0l3?=
 =?utf-8?B?aEVKM3g2Ni9yOFliQjRrSTRVU3JpaEh3MjF3SXVFOXFOSzdsSVJmdXY0b1lt?=
 =?utf-8?B?VkxJOXhCZFk1dXNOL0ZUVCtVa0RidUFla2xwSmtIUHdNQ2RRb1hqWGhZRGto?=
 =?utf-8?B?NVdIeTYrN0VWL3E4T1dzYnY4K1g5K1NkUHpUYjl2RjNnRS9aVUY5ditLU2pP?=
 =?utf-8?B?ZVpnbnVoWW5hanpOU0hNRmwyQWc2L1N2dm1kUnRhSUs3OHJSTG1RRUNIR3o0?=
 =?utf-8?B?UlJIM0UrQ3lpRkpMNUZNQVNoSE9oVk50Z2JzcmJPZ0VRaGdGWmR3WmNvTnBC?=
 =?utf-8?B?YUE4ZzI4V0V3M1lodENlL0JrMjNNOVBpZ096V1VtUlIvS2p2bFFBV1JtM1No?=
 =?utf-8?B?azk2RkNLcHNwS0JwS0dsd1h4QWNucVJCK2xMRW9uUFFqSWV5Ykk0UUZCQUlZ?=
 =?utf-8?B?MG1vMy94TWpkaUtyNjZYaVBhT2JMK1RPY1prcUsvMFA0Si9ZYUhrWit6bDVx?=
 =?utf-8?B?dW9ETEdaeFlKRTFYS1I3dnI5VDB1dHJRSER1RlNYa0NBT0NPMWEyUGhNM09G?=
 =?utf-8?B?cHJjYlZ0b2dLbHhMZXdMbjZEbUFkY1IwZUo5OTFFeXpjeG9nMmFyUE5JRHcy?=
 =?utf-8?B?TVFlc3BucnlScXBMZHAvVHgvakg4enNpRFFLTlNLOGxuMFljWEYyQktUSktY?=
 =?utf-8?B?VGl6WFlpYmdWb2VEUUdTRmhWN3FFNGFNdGVqb1Z4bS90SmVwZ3NCNSs4Q3FF?=
 =?utf-8?B?bjc4ZXVnZW5tcGM5M3NNR1NiVktnQS95MUFKbS83QXdpMHB1bExUQmtzRXE4?=
 =?utf-8?B?MGdXVS9IUDZrbjJ0eDd2R2UyK2hhTGhicm9YRUc4akNlcHJHeDF4a2ZXaU9r?=
 =?utf-8?B?dExHVHJHcUxPbkQ0ZlJFN1c5dEV0TGlvTktkc3h2UTJFa3Fsai9YQXk5MmlH?=
 =?utf-8?B?WiszWmxUQmc3VUdPMFEwYXFHSUlxVFl6SWovcUQ3MUF0SHFTa0pQZUVHakJS?=
 =?utf-8?B?WlY1RUpwMHV1VHlteW5LYmdTOEVZM29VaEpybTY5NUV0dDg0MTQ2MmtFVTVo?=
 =?utf-8?B?dUlpM2JMUngxWG04dFA3ZUp3cWxPWXRxMnpPOCtueW81UHNhTEtvcmZVTUx3?=
 =?utf-8?B?S2E1YmNKVGxqUjdSU04yVUJtWlhsR2hjMHI2eXlDNFpEd2JIOHpmUlltMVJ1?=
 =?utf-8?B?dWdOVmphRmJtWWVEUVBmd3R1YUxZYlBQWXpsSDdhSDBqVlVVVlJFaDZKZmFu?=
 =?utf-8?Q?MZMyuSlKH8dmukjcsv9SKzkpoEgf1LHO5NZDr40?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b22ac5-65ad-4fc6-4bc8-08d95db0b60e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 16:46:19.7756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jxYfw7p4BR3dTKGTx5pwig4I6scf1dNayVIKC3e9Mr9fq5ithAetRo+0rmk8bIEdt5Io0ffN0s6MRONaOow5hfMUSszfzfI524y+yAkw3Dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6863
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2VpLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY2IDMvM10gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDdnMDQ0OiBBZGQgVVNCMi4w
DQo+IGRldmljZSBzdXBwb3J0DQo+IA0KPiBPbiA4LzEyLzIxIDY6MTggUE0sIEJpanUgRGFzIHdy
b3RlOg0KPiANCj4gPiBBZGQgVVNCMi4wIGRldmljZSBzdXBwb3J0IHRvIFJaL0cyTCBTb0MgRFQu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpDQo+IGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpDQo+ID4gaW5kZXggZGU3OGM5MjFhZjIy
Li4yZjMxM2MyYTgxYzcgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA3ZzA0NC5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I5YTA3ZzA0NC5kdHNpDQo+ID4gQEAgLTM5MSw2ICszOTEsMjUgQEANCj4gPiAgCQkJcG93ZXIt
ZG9tYWlucyA9IDwmY3BnPjsNCj4gPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAgCQl9
Ow0KPiA+ICsNCj4gPiArCQloc3VzYjogdXNiQDExYzYwMDAwIHsNCj4gPiArCQkJY29tcGF0aWJs
ZSA9ICJyZW5lc2FzLHVzYmhzLXI5YTA3ZzA0NCIsDQo+ID4gKwkJCQkgICAgICJyZW5lc2FzLHJ6
YTItdXNiaHMiOw0KPiA+ICsJCQlyZWcgPSA8MCAweDExYzYwMDAwIDAgMHgxMDAwMD47DQo+ID4g
KwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMDAgSVJRX1RZUEVfRURHRV9SSVNJTkc+LA0KPiA+
ICsJCQkJICAgICA8R0lDX1NQSSAxMDEgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCQkg
ICAgIDxHSUNfU1BJIDEwMiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArCQkJCSAgICAgPEdJ
Q19TUEkgMTAzIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiANCj4gICAgRG9uJ3Qgd2UgbmVlZCB0
byBzcGVjaWZ5ICJpbnRlcnJ1cHQtbmFtZXMiIHdoZW4gdGhlcmUgYSBtb3JlIHRoYW4gMQ0KPiBp
bnRlcnJ1cHRzPw0KDQpUaGlzIGR0c2kgY2hhbmdlcywgYXMgcGVyIGJpbmRpbmcgZG9jdW1lbnRh
dGlvbiBbMV0uIEFzIHlvdSBzZWUsICJpbnRlcnJ1cHQtbmFtZXMiIGlzIG9wdGlvbmFsLg0KDQpb
MV0gOi0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4
dC9saW51eC1uZXh0LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2IvcmVuZXNhcyx1c2Jocy55YW1sP2g9bmV4dC0yMDIxMDgxMg0KDQo+IA0KPiA+ICsJCQljbG9j
a3MgPSA8JmNwZyBDUEdfTU9EIFI5QTA3RzA0NF9VU0JfUENMSz4sDQo+ID4gKwkJCQkgPCZjcGcg
Q1BHX01PRCBSOUEwN0cwNDRfVVNCX1UyUF9FWFJfQ1BVQ0xLPjsNCj4gDQo+ICAgIEFuZCAiY2xv
Y2stbmFtZXMiIHRvbz8NCg0KU2FtZSBoZXJlLiBJdCBpcyBvcHRpb25hbC4NCg0KPiANCj4gPiAr
CQkJcmVzZXRzID0gPCZwaHlyc3QgMD4sDQo+ID4gKwkJCQkgPCZjcGcgUjlBMDdHMDQ0X1VTQl9V
MlBfRVhMX1NZU1JTVD47DQo+IA0KPiAgICBBbmQgInJlc2V0LW5hbWVzIj8NCg0KU2FtZSBoZXJl
LiBJdCBpcyBvcHRpb25hbC4NCg0KUmVnYXJkcywNCkJpanUNCj4gDQo+IFsuLi5dDQo+IA0KPiBN
QlIsIFNlcmdlaQ0K
