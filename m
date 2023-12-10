Return-Path: <linux-renesas-soc+bounces-863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A152580BA0A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Dec 2023 10:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 990261C2035A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Dec 2023 09:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470C6746A;
	Sun, 10 Dec 2023 09:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TdSERuwG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2113.outbound.protection.outlook.com [40.107.114.113])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3DED1
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Dec 2023 01:50:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpzhuZYhskLj+L+pBj4SkyDIFIMqc8vjhNPsMa7CLCLSrL+fvdG69hRF+MIQTv5VDRxIbCtrgTdx+YfCvW0gDTZDk4YeScsCAg63Fg4+gyJSyc3vu3BvfqTDTZxZQNsAHB08oI8Kz8gwtL7iyNR8d8l4vIZCxEcLhhViGx2jc63c61auFIC1kE7xNifCWvMJmik/CdHN91pGepY1R+2Ig3NxrQ1+rVjIcwkGDgtkebG2t8Lu1RaiMvfR5lPUwtaImDIbolc1YGZPPfz33zR61+HPm+5td1/DF14GBodrO0VqYuSdzsxFFI2eL4vad9pBL5QDupUHpXlPTu/C6croWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHVEDJGKGMnkOswNB64385xhSRPJhJAL7sWrcF0fUiQ=;
 b=VGdsvqvKhB3zDBMM6vVXLttnle2PQ2IpFryUjx4vl9BA0XAc+1J0ckv1dT6mLEiweOMNjceX3D/EUSSKdV/eVQD0sbNftDzsXymIp4j/z26upgsESm2c/Ad/NK2H5b+t5BWHtNr5lyjgpwf6D6XWY56FJzXc/Y+JD8dpweNCnJwDUY5WjRAlbJN5Hp6+ViiPfdnekWQxCS9y6Y1MpKGCbuQC7zFVnBHRFbRB7Be58ohdM3qcCoOcIlJX0YN6qMcYKuIDB+aSHgyb7ZPKGn59Q7vWvrFu563VzgcnM4fWjvcqRmsNQsLUdzWTSNnJO51D6g/jUrkUyL4j4quOkvdkow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHVEDJGKGMnkOswNB64385xhSRPJhJAL7sWrcF0fUiQ=;
 b=TdSERuwGDfhpkPnOEgt37UMuZY8zm+595UsLErqpOmCHJDjiZxIzsqOxKgm7pJAirM/Teu0irAv5G8gMHdb3/TOetJb4i839TxOuuizcbNW/hGRx8qaOkGlUYx5r+QfiYz5WmbSbeYdsoQGy5/eFEtW/Wc4dDJsV++zmskPuBls=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYVPR01MB10767.jpnprd01.prod.outlook.com
 (2603:1096:400:298::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21; Sun, 10 Dec
 2023 09:49:58 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7091.020; Sun, 10 Dec 2023
 09:49:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>, Konrad Dybcio
	<konrad.dybcio@linaro.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Neil
 Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
	<nfraprado@collabora.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Udit
 Kumar <u-kumar1@ti.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 6/6] arm64: defconfig: Enable Renesas DA9062 defconfig
Thread-Topic: [PATCH 6/6] arm64: defconfig: Enable Renesas DA9062 defconfig
Thread-Index: AQHaJEbR2tmw26FlxU+RAXf4dl1/ebCUb5gAgAAWQGCAAAtwAIANwRXg
Date: Sun, 10 Dec 2023 09:49:54 +0000
Message-ID:
 <TYCPR01MB112693C2B72B6AA28766FF8EA8688A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdWh3fTzQP5+mGF3u8LACg-5tQDZcyExvgREpxKd6iee4Q@mail.gmail.com>
 <TYCPR01MB112696C301D750A915F2661688681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAMuHMdXHpE079eLAJjcdsbz6=Y6hux267AhqJow6HESCaf7EXQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXHpE079eLAJjcdsbz6=Y6hux267AhqJow6HESCaf7EXQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYVPR01MB10767:EE_
x-ms-office365-filtering-correlation-id: 3d4d8510-f0d3-4dd9-b01a-08dbf9655c98
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7fkN7jCy2OlQ+MKO73waMgcFiurSg1fvmV/P1kRU51QBLGZIA3tcx/AqOyhm926wnLpUMjSnDChyHnpqiN4QFZ1lfVOW6AAxuekZJ8dfC9XpMLv1xiZ9MQP28TY+nyC1PwdDGpGjGAZUtrIdo+RFFheFZKOgq/anGyonpRxcDsW7URMnIiiOmYIJPfTsJcN9F3pIYt82bnButDbgyeJ4V+c5j7RAo8sZyehP/5MfZEZ/H8a+BkiVqGbvmL02E04s8Y8Au33b4l4SLEHlNHDxzHWDNGIOatJu5iDUTJJiUFNTE2Uxxv65cKRnPOnpf5fWM0rmy9PKv2MXh1KQTuoeHYcq90I/DzZvwJBdE389KOJxtow8M/8kE5v7nzvbRM4z6aSG+Hq9NBYtFcluQWusyVfTTlmWDaAatJ5wEnL8CSx7QIBkgwaR08huBcl+1bvNJwJxFNlnq+hibeMXF0RaFGFrXEQ0aAoaUGaCD1nc9tbH2ePXkbBAhpyDua2AojzEl6eVlHKJQp4a10npeCCULFAVIC+gMLr5zwoYfUIq6FNZEd/843rYrksg0lXtvuj8//JBKk+rp2l+MfLyi1tU39zbftk+u5wh/+5XKGrsbienjVP/EbhuMc/cLfCUtjsi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(7696005)(53546011)(6506007)(478600001)(2906002)(71200400001)(83380400001)(26005)(9686003)(4326008)(8936002)(8676002)(5660300002)(52536014)(7416002)(38070700009)(54906003)(66946007)(76116006)(6916009)(66446008)(64756008)(66556008)(66476007)(316002)(33656002)(38100700002)(122000001)(86362001)(55016003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTBzN1dNTnVYaCtnRVFLMWtJQ3Q0Q0lGNExjQ0s3VGVtWk5yMWNsY2JJT3VI?=
 =?utf-8?B?c3J0aVpmNDJyZDVvZnpOdDV5ZzVoRi9OVzh2dStQZElJNmR3MC96bU40QUc2?=
 =?utf-8?B?VjRqczRMTHB3OE1QWXpvcTg2RVAyVnNoZnYxVHMzNDRwUG9YZXhYSUNYMmwr?=
 =?utf-8?B?VFAvdEpxaUZPYlU1ZDBwb2pJSzFYUlRPcERna2xCZEpNVjFkR0lVaUFqek9h?=
 =?utf-8?B?SlVXRFBTR0RUZWk2MWtJc09UaDVBeGVscm8rcnQ1VGlIRHRBd29COGNsYlpq?=
 =?utf-8?B?VGpxSmJYRExNVGJSUElXUjg2OW55c3hiM0wyL1dySjFxdktzR3A4N2w5Yzlv?=
 =?utf-8?B?TWxVdDZEd2h3WXZONmhxemVBWU5zY05ITDRTUytUQitRalFGZWd1UlR2V1o2?=
 =?utf-8?B?Yk1OTjFWeklpODJFejNaNTczVjcvK0VnQzY4enVIQXh0MzdiQUk1K3dESjRF?=
 =?utf-8?B?NDhkTmpzdUkwdmVlMHU0Z3l0a3h4Z3FCWTNkWFFOSFMrbUdsRGFxbDNDQVFC?=
 =?utf-8?B?VHpJMHFDd2V5WjR5eUIzdU1vbnlBT24yNVdWYW5sNDQrNXpGNDQzWjhFcy9D?=
 =?utf-8?B?eUg5blpiS3g4TmEvMHkyK0tFdXhmUVg2UTg3end3dlhrUTFIMW5lbnlocmFF?=
 =?utf-8?B?cUlVWVRIT3QrL0xkRlBZMUpSUHB1Sk11SmVuenI3SGlrdVF3dnFUaDNockJC?=
 =?utf-8?B?cC92VmJKYlpGM1lMVHhtUndxTGd4azdnN3FLQm8rLzRNNE5DZU1EV0pxTWpC?=
 =?utf-8?B?WEtzTC9MRTBnejZ6UWszUlRocGVkVE5jdFkwOWoxVy9Kb3d5Y3BwTVQ5cDRZ?=
 =?utf-8?B?OXZNTUxlY0JKSkFDRE9qcjZtTXA4UFhGaGZmNG1UKzM0UHQ0NHU2WjNpS0RL?=
 =?utf-8?B?KzJQVEVDNTJHUmNwUFJidjRMdFFzd3pJb2w4dk1ncHRVRk9BeUZ0eWpENFhZ?=
 =?utf-8?B?NDhCdUlFNzIxSGJ4SjE5RWdkS3IxalQ4WnhuOHg4TDRrR0d2VmROc3RqT2dj?=
 =?utf-8?B?b1lTZy9xWklqcVFsZDl3aUJ3OGFSaWJlNEt0VmRhMnZwbWtNQUMwak84YkMv?=
 =?utf-8?B?eXdDVEYyMm5BZk41MEJ3VTN0eW1rRm5ORHZleldzMXB1M296a1RHZWJZbWJJ?=
 =?utf-8?B?clUxa1FoblU1aWtJNlI4NFZLTTN5Mko3YlRUb0NlMkFidFNoRXVMQVV1clJ1?=
 =?utf-8?B?YjVWcnVJTVZESHRRMk1pUTZVL2hvTGpCUVo4QmFWWjJFRDVEMnRraHZoNUVn?=
 =?utf-8?B?TkFUd2g0bXF6YmoyY2pnUjA4Kzh1M0hHblh4Y1kvdk8yNWpCaVpGcHFzQzBj?=
 =?utf-8?B?Zk9HZ08vUFRYOVJkQ2RoQ2w4dzZaTS9jZVNEblh0RjRXMXB6cEhUMnV3dnRm?=
 =?utf-8?B?OW54SVhMZUtmU3JqMHUwTFU0aHJQUjlOQXdjVVpoZktyT2Z6a2haTE1HZnJW?=
 =?utf-8?B?OXQrZnlUWUZ3Sld3K3I3V3RtOE9LWlp6T0xIUEtYZ3prNFkxWXpOM085U3JM?=
 =?utf-8?B?VnhnbDgzNHV5MWo1dzlYNDlkSndXRXhQRFgvQXZCemFKV3RycVRjL2dDeU5O?=
 =?utf-8?B?YzZZUkE2U0xleGlVTE5GUkVxa3lTcXp4TGZsZTVVZ1dSbWNkSUlYd25Ib3JC?=
 =?utf-8?B?T1RFZGF5bnVJdVlCODZubkdWdWp4OW5JK0w4ZU1MZFd4TmdPdlpqNnI2c29m?=
 =?utf-8?B?VFM4WlM1MkRRSVBJME4rNHpUQy93SzV2OWUrWnlGWWRvM2FzTmVzM2d1MlFI?=
 =?utf-8?B?cHFsa3Q1cUwyR2dPbE9iWk9BSDYrdWhtbitOTkhUUUY5dFhRQ0xzZEFja0lP?=
 =?utf-8?B?UEJyZ1JrQWNGeG9IbzVvd3NZMkZHaHlNTjlWeVVVTS9EVXBJSWl3MnFxaUpu?=
 =?utf-8?B?QlcvNUFvS0VGY3ZTVTdBa1cyOEMzT2V5WkU5ZHhFNXVnOTdyUDc1eExjL2Vh?=
 =?utf-8?B?UFRQMUtzM2FFcno5bU9oOWtrQ0NhQ1NuZzZxa28zZ1NkY0hLYjZZd2RwT1dW?=
 =?utf-8?B?L0ZnK2NablBYZFl4Wm5zTlIrYW5FWXBtTEEzWU1POWFjQ09FbUtheElmOCtB?=
 =?utf-8?B?MWsvc1I3alAwSjAxN1pJUnI5cGMvOVRtZ3pXcUlFSVVSa0didlZIcndSNW9q?=
 =?utf-8?B?c0UzUUUxZjNLNFJuR3NPaDYrZFgrcjJWNWpvZVZWbVR5V295d1c3VDdyRUxE?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4d8510-f0d3-4dd9-b01a-08dbf9655c98
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2023 09:49:54.3427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v86cQwsRz9wK1x49wusAElflcMrrF9di9ZfdwGkq/gdGFo7PXqVOa03rOze7FHVMgvqvBBOku2gTlfDZO8d5R6sZCIdk78OKZmffw/WeGOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10767

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiBGcmlkYXksIERlY2VtYmVyIDEsIDIwMjMgMzo0
MiBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDYvNl0gYXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxl
IFJlbmVzYXMgREE5MDYyIGRlZmNvbmZpZw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwg
RGVjIDEsIDIwMjMgYXQgNDowMuKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPiBPbiBGcmksIERlYyAxLCAyMDIzDQo+ID4gPiBhdCAxMjowOeKAr1BNIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4g
PiBFbmFibGUgdGhlIGNvbmZpZyBmb3IgdGhlIFJlbmVzYXMgREE5MDYyIFBNSUMgYW5kIFJUQywg
YXMgaXQgaXMNCj4gPiA+ID4gcG9wdWxhdGVkIG9uIFJaL0cyVUwgU01BUkMgRVZLLg0KPiA+ID4g
Pg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4NCj4gPiA+
IExHVE0sIGJ1dCBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgKGF0IGxlYXN0KQ0KPiA+ID4NCj4gPiA+
ICAgICBDT05GSUdfSU5QVVRfREE5MDYzX09OS0VZPW0NCj4gPiA+DQo+ID4gPiB0b28sIGNmci4g
bXkgY29tbWVudHMgb24gcGF0Y2ggNS82Lg0KPiA+DQo+ID4gSSBoYXZlIHRlc3RlZCB0aGlzLCBi
dXQgSSBnZXQgImRhOTA2My1vbmtleSBkYTkwNjItb25rZXk6IGVycm9yIC1FTlhJTzoNCj4gSVJR
IE9OS0VZIG5vdCBmb3VuZCINCj4gPiBTbywgSSB3b24ndCBiZSBhYmxlIHRvIHRlc3Qgb25rZXkg
ZXZlbnRzLiBTbyBwbGFhbmluZyB0byBkaXNhYmxlIHRoaXMNCj4gbm9kZS4NCj4gDQo+IEluZGVl
ZCwgY3VycmVudGx5IGRyaXZlcnMvaW5wdXQvbWlzYy9kYTkwNjNfb25rZXkuYyByZXF1aXJlcyBh
biBpbnRlcnJ1cHQNCj4gdG8gZnVuY3Rpb24uICBJIHdvbmRlciBpZiBpdCBjYW4gYmUgbWFkZSB0
byB3b3JrIHVzaW5nIGEgdGltZXIgYW5kIHB1cmUNCj4gcG9sbGluZy4uLg0KDQpZZXMsIHRoYXQg
aXMgcG9zc2libGUgYnkgZWl0aGVyIGFkZGluZyBhIGRlYnVnZnMgdG8gZW5hYmxlIHBvbGxpbmcg
Zm9yIHRlc3RpbmcuDQoNCk9yIA0KDQphIGRldmljZSB0cmVlIHByb3BlcnR5IGZvciBhZGRpbmcg
cG9sbCBkZWxheSwgc28gdGhhdCBvbmUgY2FuIGhhdmUgcG9sbGluZyBzdXBwb3J0IHRvIHRlc3Qg
b25rZXkgZHJpdmVyLg0KDQpCYXNpY2FsbHksIG9uIGEgcHJvZHVjdGlvbiBzeXN0ZW0gd2Ugc2hv
dWxkIGF2b2lkIHBvbGxpbmcgYXMgaXQgdW5uZWNlc3NhcmlseSB3YWtldXAgdGhlIHN5c3RlbS4N
Cg0KUGxlYXNlIHNoYXJlIHlvdXIgdGhvdWdodHMgb24gdGhpcy4NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQoNCg==

