Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8A23D595C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jul 2021 14:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbhGZLmv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 07:42:51 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:51046
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233876AbhGZLmu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 07:42:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXYiVuqw/zYRewwHictQFxmUFb/qcJz2BBne2of8tqRQJ6Dh3+SDN/S8DTthxNnQoGoGh6bnAAnq6J12f5QINkogjo+uNvHKLAhQRT7Ut9Moo0AwqvkCKSdegaXJUDtpPPlurUBJfbSBGXmJABmNOUoTAtr5/+LiyxqrIgl5mv909G3o1kNkJGMzEMiueA3Gzf+haRce2MFl9dUloVox5rfanrqogukq2Z5cTYMxhYuJG2gXNC7rPMQhgPdgA9kdZd+mATcZ0rqJvJoBBgJdqOaBip5xgi7l+R4Hn+dCFe5bNB/r3QY04DfcxFgEjvm/mOsWgvrGhwUTcIcPBnJGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCJLeY9tdgw5w7RRZgad8En0bC3Qn4x99BtolYbNyFA=;
 b=UidgcKQYo8pTfaM8WLRSc3as28y7FKnptG5tKkHvaDEoh9vNeMI/lnlWy+qJ9NVEncDQ5dj9rSW44wJU5BFp0k5bBaarhaFKj3bugwfJn8PoRow6tu7DPeiuwZLRrRVmkNlgLc0Zgk9lpLRZcoabDov8RO880UOPEr3dXGt1aMtPs7kHyeB0+e23ePM35f12KuRedynx1Jr9mYDjtTiFFQ9cDr0Fr5Sb64XZ/BFZEFzFDMqVyH4PAVEkEu/+cZpMGqh8zgVD9+RXxsXLDE6kF3+vVZ0miNWyn2Sn9kx3GsTsBUTdJLPIRo8c11JYF0W6u6XZpzqiiaaUFTCN4eI+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCJLeY9tdgw5w7RRZgad8En0bC3Qn4x99BtolYbNyFA=;
 b=hnkoXe9E8PYabUYsPMjx8GMMwEiwU6Y3akolOwmXgOAqKErMDLag83N6GZOtJPHGBI82uy6J4HbRJndQr6PnPrl8d36P0okfW8ncmC148F/hDPVGSCA3ik+LHo9OfA9av61dtpHz2GvNUG7Q9ERpgK8ucHaj8b4hA8KEGvWsizg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB2134.jpnprd01.prod.outlook.com (2603:1096:603:26::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 12:23:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 12:23:16 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next 02/18] drivers: clk: renesas: rzg2l-cpg: Add
 support to handle MUX clocks
Thread-Topic: [PATCH net-next 02/18] drivers: clk: renesas: rzg2l-cpg: Add
 support to handle MUX clocks
Thread-Index: AQHXfwPWYriT4pGmw0mv0A987jqBtKtVGwmAgAAYpbA=
Date:   Mon, 26 Jul 2021 12:23:15 +0000
Message-ID: <OS0PR01MB5922D173DC5961099F8E91BF86E89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
 <20210722141351.13668-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUSe3gkOcU9rMOyQBwFzYJrS0D9PosWDxirTmKbc_xx+w@mail.gmail.com>
In-Reply-To: <CAMuHMdUSe3gkOcU9rMOyQBwFzYJrS0D9PosWDxirTmKbc_xx+w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67391349-4f8f-41e2-eac7-08d95030252d
x-ms-traffictypediagnostic: OSBPR01MB2134:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB2134C7A6A656C5B57B5960BF86E89@OSBPR01MB2134.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KEeeGWm4ed7PocJs7qrwoigJTkBTffF1J+2ZZg6ik0ulkLLVoyJt2dfIplC87rWDaJqTc6EpVY9QKsK8OFwjSTRIaKJp5XdNALBC1VQG1ZFkdTSVqEEkR4m3r0TO8vJClqhgOSjTgq87kD3s+72mnU0eyxEYpyy2gqaYq8b2DBJS7ZHrbynn8xKmTZnlf5u/VS28uhLoz82XK6U5RKvrqLCurBc0o0DnJ8Gy4AsJZcFzuLHyhC8nE/HHrr0fPG+uLhIUOTbj6MCkUTBj6U3tBznmuSlZD8q7OvH0H8TD7qaW2+o4mymN9e6cz8KbDGI28Tq5+QJNgIZeW7trjkWsusZhTp0yK8G8AtoA17ygoRgNKpd9Ihv+lg9dM1wHJGRdVJyZMLfBu+6xrHIDEP8zbA1ltRa248xq37e1qAzMTgmn+98VZ7MTQ7JxOnwK5ouMAQ+hj7uHV759ekICcU3a4oOkxfv4ki408+6RYGlzCu2+im++dsqz7yCm1HApQDwEjiPvN18HmPe6SSIY8qmr6/Q7deN+uhG7V+v/OKsufpIf4HipTh1v4FsE8x3THfU5tE/uu3Es0/bwYVCywSDs3YMGnf5IW/60lC5GKVthZ0ix8kww8Gpf87dAMzWAQyV1BEAEirC1aLZXx0+M0i0JyovF6YMingcXz9c9CAHsrhQWP8hvp9SzFDtrQUbheg9y4l92ZSmbyxkaN6hz1IzfzQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(54906003)(86362001)(33656002)(83380400001)(6916009)(8936002)(478600001)(107886003)(66446008)(53546011)(66476007)(71200400001)(66946007)(55016002)(6506007)(7696005)(76116006)(52536014)(122000001)(64756008)(26005)(4326008)(9686003)(38100700002)(66556008)(316002)(186003)(8676002)(5660300002)(2906002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm9mcytMbndodWtoUGlZQUN0TGowL3Y4azF6bnhqNGFhSExSaGJlQTVGM21w?=
 =?utf-8?B?NkNEWUtNZFpsdVNNUjVxcnlNN0dFRHRzREN6elhtNDlDcGVQUjg5SXdVWk9C?=
 =?utf-8?B?UGlwamhjK21LYVU3eUlURWppZis3cUdqbHJOR0N2SFF4OE83Y0xOTlNJQ3lD?=
 =?utf-8?B?WmtxMmJqdFA2elJnNys5eTA0ODBkeDdvWTVKQ3F1cHhiZkVvS2RiSW5FMkts?=
 =?utf-8?B?NkhDK2thMU83b01KVy9ZcGQ1Sm5Pdlk1VC9INU9ibUFxVjBDMXpXRGIzMldw?=
 =?utf-8?B?M2k4MFJvMGhqOFpaZk8zclNWL0svcG14SXpKRDk2MmxwNmVhRW1FcHczNS9i?=
 =?utf-8?B?bE52WDgxYURYTVIwMEhIeDdXRkZ1WVMyVXAvRXIzd01QQ21qVnBHMktVeTJS?=
 =?utf-8?B?emNVR3dUbGhvcmxJNVZZakRQTGZCUVFtZldkWWhpLzVBL2F2dDdlV1RqeHBx?=
 =?utf-8?B?cWR0Uk9zVUgwOWtUTnd1K0NKaGFNeFJLdFpUa2RFODJWeUZqTUc4SnRrbU5y?=
 =?utf-8?B?SHl0UHBXWjd1N2JpTjJ4L25IRGMzSUx1MWYzcWpEUVlMa3RWRGpXanJEbXls?=
 =?utf-8?B?amVkbWZ2cmFBMTR5Q1VjSGlBWWw4N1ovc3k4QmxwVDNvenF6ZXpuMUtDSDlJ?=
 =?utf-8?B?ZzBWbUVabWQwN3MzNGtZRjdhd2RPMHk1dkJyZkVOVmlIMXIxWVRSV3l3U2FM?=
 =?utf-8?B?MTJ5VHpWb1ByZ1M5ZkVEc1BIZ095Q0oxb0k4cS9TQnhpcjJxWWk3V25ROFJL?=
 =?utf-8?B?bWtrZU1LNmJFVXdPa0ZQSWNIaUZwTERlSDg4NWduakNFeEpkQUEvd1hXem9l?=
 =?utf-8?B?NnNrUS9rWStOMzA1T3lkWlA4azhVTjBlbW1sY3NDcURZWklZU2txSDNIYkxk?=
 =?utf-8?B?NXpYM291bk9YaklVUG81bWpWSHFYc3RTWXhlcHJxWEZZK2JnalVqMnpCV3Q5?=
 =?utf-8?B?RUlqc09neFhLd3hML0pORU5leVhjT3dVSUx0UTJTakFtKzNpTUMyeGFEUHNP?=
 =?utf-8?B?NmVyYXJra0F1RHBvWEx3dTlmUS8vQkVFK3dUelZRRDVZQVhGakdxd3dTd3Fq?=
 =?utf-8?B?c2VIT09sMkJKeHVRS1ZOU2pKdXhRZUxlQSs0L0ZCQVFsL0JMZUtGbUpZWGF3?=
 =?utf-8?B?MUdMQlFBNFdJUmlyWGlDdkNxTWszak0rRUY1WE5IYWZyWDdYL2JWQUx1eHkw?=
 =?utf-8?B?dytISGJTanBSSExIVlBsV0hRVytGa0oraTVHTGtPU0s0bGNNWnhvSlZHczU1?=
 =?utf-8?B?K0ZLUkk5K2Q1M25zbk1sNjlZcHFRNzJvQlh3Z2c0VHlYVEM4YWIwSDNVVEcr?=
 =?utf-8?B?Mi9kS1Q0VXFmMERXVDNSMFljZVY4T2JWaS9TaWZBQ0hUM0V0RVprbEhBZVRh?=
 =?utf-8?B?d2sxZjJyU3hqeTRudThPSUlFREE3ZUNzaU1JZVhBR2wwZFk1OHRRcC9EYVVY?=
 =?utf-8?B?U0hCbXhDNE81SFpOc3NPSG8wR2hUcGhMOUcyYW1hSmFuL2pBdjNlOFBUc0ti?=
 =?utf-8?B?aUR0UFZXL0hiUDVQUllqa1NsUlRPOEMvVXNPTDh2SG5PVWEvTnpaMWFXNXR1?=
 =?utf-8?B?eU8za3dkSjdpdnNvUmVjNUpObVY1eFEwc0NFNFpzY25rV1BmYXpRS2ZReTkv?=
 =?utf-8?B?eEV5Qi9wMlp4MW02SjFqWHZiWWx5cHQyRjEweUUwdnRjM2pxWkR3eUhNa1lq?=
 =?utf-8?B?QklYY1h5VnJSSTZiV1pYZmlFQlhzR1hMYk1mdnl0WDFjUWZ3ZkpDeThuSkF6?=
 =?utf-8?Q?79GRbbds+nZFG/5PMtoGjXypRv9AvaPOTFK1d5T?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67391349-4f8f-41e2-eac7-08d95030252d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 12:23:15.8041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ce2VG4DhhWyOzks9DM+AAT/27HwkEuD/382yJzX9bTFAoTeJmwN5wU2m8kJ0pfHKKKP1SorNhAKDNYCB8gWIuOgTyGLXvmIspbTQ9lAqW40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2134
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpIaSBHZWVydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCBuZXQtbmV4dCAwMi8xOF0gZHJpdmVyczogY2xrOiByZW5lc2FzOiByemcybC1jcGc6
IEFkZA0KPiBzdXBwb3J0IHRvIGhhbmRsZSBNVVggY2xvY2tzDQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gDQo+IE9uIFRodSwgSnVsIDIyLCAyMDIxIGF0IDQ6MTQgUE0gQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCB0byBoYW5kbGUg
bXV4IGNsb2NrcyBpbm9yZGVyIHRvIHNlbGVjdCBhIGNsb2NrIHNvdXJjZSBmcm9tDQo+ID4gbXVs
dGlwbGUgc291cmNlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gPiAtLS0gYS9kcml2
ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5oDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNh
cy9yemcybC1jcGcuaA0KPiA+IEBAIC00Myw2ICs0Myw3IEBAIHN0cnVjdCBjcGdfY29yZV9jbGsg
ew0KPiA+ICAgICAgICAgY29uc3Qgc3RydWN0IGNsa19kaXZfdGFibGUgKmR0YWJsZTsNCj4gPiAg
ICAgICAgIGNvbnN0IGNoYXIgKiBjb25zdCAqcGFyZW50X25hbWVzOw0KPiA+ICAgICAgICAgaW50
IGZsYWc7DQo+ID4gKyAgICAgICBpbnQgbXV4X2ZsYWdzOw0KPiA+ICAgICAgICAgaW50IG51bV9w
YXJlbnRzOw0KPiA+ICB9Ow0KPiA+DQo+IA0KPiBJJ2QgbW92ZSBTRUxfUExMX1BBQ0soKSBmcm9t
IFtQQVRDSCAwMy8xOF0gaGVyZSwgYXMgaXQgYXBwbGllcyB0byAiX2NvbmYiDQo+IGluIERFRl9N
VVgoKSBiZWxvdy4NCg0KT0suIFdpbGwgbW92ZSBpbiB0aGlzIHBhdGNoDQoNClJlZ2FyZHMsDQpC
aWp1DQoNCj4gDQo+ID4gQEAgLTU0LDYgKzU1LDkgQEAgZW51bSBjbGtfdHlwZXMgew0KPiA+DQo+
ID4gICAgICAgICAvKiBDbG9jayB3aXRoIGRpdmlkZXIgKi8NCj4gPiAgICAgICAgIENMS19UWVBF
X0RJViwNCj4gPiArDQo+ID4gKyAgICAgICAvKiBDbG9jayB3aXRoIGNsb2NrIHNvdXJjZSBzZWxl
Y3RvciAqLw0KPiA+ICsgICAgICAgQ0xLX1RZUEVfTVVYLA0KPiA+ICB9Ow0KPiA+DQo+ID4gICNk
ZWZpbmUgREVGX1RZUEUoX25hbWUsIF9pZCwgX3R5cGUuLi4pIFwgQEAgLTY5LDYgKzczLDExIEBA
IGVudW0NCj4gPiBjbGtfdHlwZXMgeyAgI2RlZmluZSBERUZfRElWKF9uYW1lLCBfaWQsIF9wYXJl
bnQsIF9jb25mLCBfZHRhYmxlLA0KPiA+IF9mbGFnKSBcDQo+ID4gICAgICAgICBERUZfVFlQRShf
bmFtZSwgX2lkLCBDTEtfVFlQRV9ESVYsIC5jb25mID0gX2NvbmYsIFwNCj4gPiAgICAgICAgICAg
ICAgICAgIC5wYXJlbnQgPSBfcGFyZW50LCAuZHRhYmxlID0gX2R0YWJsZSwgLmZsYWcgPSBfZmxh
ZykNCj4gPiArI2RlZmluZSBERUZfTVVYKF9uYW1lLCBfaWQsIF9jb25mLCBfcGFyZW50X25hbWVz
LCBfbnVtX3BhcmVudHMsIF9mbGFnLA0KPiBcDQo+ID4gKyAgICAgICAgICAgICAgIF9tdXhfZmxh
Z3MpIFwNCj4gPiArICAgICAgIERFRl9UWVBFKF9uYW1lLCBfaWQsIENMS19UWVBFX01VWCwgLmNv
bmYgPSBfY29uZiwgXA0KPiA+ICsgICAgICAgICAgICAgICAgLnBhcmVudF9uYW1lcyA9IF9wYXJl
bnRfbmFtZXMsIC5udW1fcGFyZW50cyA9DQo+IF9udW1fcGFyZW50cywgXA0KPiA+ICsgICAgICAg
ICAgICAgICAgLmZsYWcgPSBfZmxhZywgLm11eF9mbGFncyA9IF9tdXhfZmxhZ3MpDQo+ID4NCj4g
PiAgLyoqDQo+ID4gICAqIHN0cnVjdCByemcybF9tb2RfY2xrIC0gTW9kdWxlIENsb2NrcyBkZWZp
bml0aW9ucw0KPiANCj4gV2l0aCB0aGUgYWJvdmUgZml4ZWQ6DQo+IFJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gR3J7b2V0amUs
ZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0N
Cj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBC
dXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVy
IiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
