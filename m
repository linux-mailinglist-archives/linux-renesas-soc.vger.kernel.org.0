Return-Path: <linux-renesas-soc+bounces-3640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4882877202
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 16:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B632B20FB5
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 15:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879A344C88;
	Sat,  9 Mar 2024 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VHT3Vu7V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2064.outbound.protection.outlook.com [40.107.114.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC55E2030B;
	Sat,  9 Mar 2024 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709998994; cv=fail; b=OCLUW4lbujgFp2qMcHF0HHZFodC1sGMbWpkDaDdpY88rdzTmHmJPgOhaKoIiwnPuvVSgQbVUzG6ex3oyY30mTfRtp+lG2rQLt/MnWLXO48cG+uz4u2sAlHmWrSQkCnvT81ODpnuloH6OKsj6Dv+akON/0CkZPjoiamH8/6Fr9a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709998994; c=relaxed/simple;
	bh=c7oI2BRD27enQiRfmR9bpL3yigYp/K4Zx+bJGU0z8JE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NWySI2tSRh95G54axxKYAfLkXC65vMZqA/UTkeuexTcCtlIqMYklcDUgR/DdLywfIsQa8e6Z1z+j6ZFELCPLSjhDzo1rP3h+ITxZO5z5+fKNxXoGn/8vkmh1BuAWpyYANm4cfKZ0ebWQMwAjYlUi3+89PxQMxkRZbeVtMVsmoa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VHT3Vu7V; arc=fail smtp.client-ip=40.107.114.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UG15Tl6w8A00rWvApWFCEZljDSWNiMNVawtwHUtwF6MzzJMwOAmd55aYbZqADnaGv90mP+EfzXDPJknRcH1EnbZA+GS5oDpWvRfWPnJ3MjIm/NywuHfSPj4qW8dtBcyQrQ8HnQOUlSmBPVWBQUZX1/OAcHyhHQVk/u7fF3vt0by9pttGx1oznsuUKmB+/ciHttWbupxPiM6q/Ko1D07fbba7/1mg0p7hCzkh5CQMgxcTXOGg9DZd/BgiPv91l4XjLDPkXRK2j1bAvvRWVdn0g7K3HYVXaPKC+Fe3J9GgegQkPlbd3EqxpUNP736vI/ud6r5b3AZSmZaHWcugK2tWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7oI2BRD27enQiRfmR9bpL3yigYp/K4Zx+bJGU0z8JE=;
 b=QVBHgZFC7Oz2XL9RpFJRJrm6gP5DXPEgkkW/sBym4EG3yZ8lCkdzfdNjQSfnaEHvg6mswBSLTzyYi9eaj5P48xS83Kn17+qy/jbJTSe6BcA1VEgzn9GMLR7AccdQKW+2SDIF4Eu2hV3t+BOoCvX96AJvUho2o+99OelhAADMUkCOxLxv9ZX2EzklK+Z8ClOBI91vEulqymU9RJxlma/kOo0UNibe/8C+vPUti9BAI61m67qf3X/Ahr6G583GnaCtlyJAo9R/9J+rlmkiAwC49VKRaLIfiz5NPMO8hKmZ91MaqFaeJZn0KDvqzkLnZ3/x1ATQ8DB1NzHgFNZ+zfThWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7oI2BRD27enQiRfmR9bpL3yigYp/K4Zx+bJGU0z8JE=;
 b=VHT3Vu7V2XBqPJMvKQR2fxAb7SyAxVh1PJi4eikcJ8H8Ld1uYo9sXoSUlrC8R2pHXSLYaBtKwoAOuDPj5XJJUrQNDYt/xQFunLNRsVl5agDyE0PPL8lYxo+M4jRzFTU9v6+giVPCMzkFS39GZyk1JLb8pL7O9o0eMwD2/I9YXhI=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYCPR01MB11867.jpnprd01.prod.outlook.com (2603:1096:400:3e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sat, 9 Mar
 2024 15:43:07 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Sat, 9 Mar 2024
 15:43:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
Thread-Index:
 AQHacYPMGWKOfJ8WCEqHUSv4i74FdbEvUfMAgAABIyCAAAOtAIAAADSQgAAR4gCAACQ3AA==
Date: Sat, 9 Mar 2024 15:43:07 +0000
Message-ID:
 <OSAPR01MB1587C505F324B11824AB6AB286262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
 <20240308180919.6603-5-biju.das.jz@bp.renesas.com>
 <67819907-4366-483d-b71b-2646ffb076fd@linaro.org>
 <OSAPR01MB15874E48DD2269C2593DB55A86262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ff569d52-f68f-410d-9897-9e1102171a1b@linaro.org>
 <OSAPR01MB15874A9DB0CE13AB0440242186262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <2821f23f-aac1-4b12-ba60-bc60da153d8a@linaro.org>
In-Reply-To: <2821f23f-aac1-4b12-ba60-bc60da153d8a@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYCPR01MB11867:EE_
x-ms-office365-filtering-correlation-id: 2be7bb5d-34a1-4b2b-0622-08dc404f9dae
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cP4qFPQC12nbuyK37dOLrvbKSQdjB3XY3ZXYbi0prTAOGQ1QtPQuafCaiTLn2s2lMiSsAuMuMGD/4eULCBth1Y7D/x/Xo1UJnI9oJJ/hDOQrCjEA5zwWu79oMA4udUVsh1sB2caiYrcG1tsHCfZwWQqR9LbUb4SBRO8tSdLZQcLRpfTpgRTGjjhRC58vAEf6g32dAjC2ihmAfOcIeKE6Nd0IEr91yBKOBSXsYBqYlMlZaS5N6s/yhW6zYnGrjXh0CyV9dOcE/96nRTuinu6RCbHI6K9AmZix/SXUhQTeXOT0dWpcYnvih5PM86Fl4X9mtuqQFO0S2hMfszr33a54b3hE+YL5f+gwsUe30O0NRG16gMNgwHvAV9tZoOuqOpRExAuk6+26FQl3XJVt/RDWHEtvP4o4MNTDhf3rGk6klgn4k6WbGN7v1YPI+WQGohjKvQYQpyp9r2f/q3n2HaIY9KsDjhzoldCoIOS0USqgl0//9MsIxLVP2ItCs0KtVI+sqDpziwcaorw/PVQca46oFWJO/niTJ2bjl4/M1sDsds/p0zrk+Edzg4iun2Z9L5DQIld5xOHzY0Q2IqAVp3RjlPwzpx/ozTpx5IIa+hgjBJIIHn8dtoyABz3s01P5yo0jrNTFroes3IT5Y6G9uBA+wf8CF6UckAraVHkopOrQA1+5/pfKqvK3Yei/3sBr188KY7eSiuq2ikpYBrutGnLHJQRMBfLqzA8gGufsN5+2kv4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RzBsdW9TOW80M045TzVhWThNWDllVVBRa0JMV3QrVU9zOE1Wa0VvdHM2czNH?=
 =?utf-8?B?ZHpMT05OblJOQmczOUFwT0RyYnh0UjNtdktxMDc2NWNyN29pVW9aUU1yb0s2?=
 =?utf-8?B?M0YxWDRkdUlFWm5CRnpybjFoNnFyekxnN1JmbnREaTdzY1ZCMXJJWVRUQTA4?=
 =?utf-8?B?TnI1bmRNZHJXMTdybUVQdkNHbFVRUWhsU3BXSXRTSS90REQyQWlqWnRrdit4?=
 =?utf-8?B?bkFUamNMbEkyQkVpVW9ZWnpPNkZRcUNsUWZTd0hMYnp6UC9wY3o1TDNuQ0xI?=
 =?utf-8?B?VGhOa2hub2NIc2R3UU5FMU1Wb2dLa0pZSGRTL0puTTcrb3BYYndpNnE1ZG5S?=
 =?utf-8?B?TnQzU09VSVZ0Q24vMkZ5bVFpUDFSWStKbGpadnJqRVlyNXc3SnJ6bmV0RHBI?=
 =?utf-8?B?ZTVKSTIyWm1tTUxJYnMwRWduaDFmV3d2YWNtbjBNZ0NvNEh5TTd0U2UxajNZ?=
 =?utf-8?B?N2cwb2U2dHI5eG9DaFdMTlZON2VaWnFUZzB0a0RaZjJTUUpudWZLd242Mnc1?=
 =?utf-8?B?L0M2ckptODh4WVpDMXRNRHJNWG1lZ3Fha0FXQkdVOUM2RFZxMmlzK3kzOUVo?=
 =?utf-8?B?WFJNR05UcXpkNXZ6eitMZWwwUk1ScmxCUVo1QnJDQ3E4akI5VFo2OEJING4x?=
 =?utf-8?B?NnBnMjNSOW5DdTM5VCt5SnBtMlR4dVFyR1lHNFFoQll0NkRTL2dKTjVWVTli?=
 =?utf-8?B?QnlPMGlKczljd2owUzBkYVhhdFgzL3R6RUMwUGlyNi9OV1FwZDJscWk4amdP?=
 =?utf-8?B?L21zbGFURHBybjZGeFE0Wi9LUWpsUVk5SzcyeUJVemFia0hadVZEd3l1amgz?=
 =?utf-8?B?RGhjMWlsMVViWno2SlpKTGlzOGx2ekVvbVorTmFOS3krRlB2YUJ2UHJ3Mzdx?=
 =?utf-8?B?MVNUZWltQituWWNqOVAweFg4b0tXWk1wSUxTd3Jtd0hsU05ZWi9Fd215eStR?=
 =?utf-8?B?b0pXWlNuQVpLdldYUEFVaWMxeGJOQThFS1BtNWJ3c2I2dkhTM1ArUXJZS3p6?=
 =?utf-8?B?RWFtR1BQODdpTEZvOEJxMCtabDB2QWFNVmVJSis5ZGJEd1NoUldCMXhiQVdy?=
 =?utf-8?B?bTcxdmpwQWtzUzF0UVViZ1FVUjNXSWpvaDROUWNka0tuaG1uVXVnY3kxSkd3?=
 =?utf-8?B?QmZ4S0dlbTd0dzRVcElGR2s0WnhKdzIyZVdYSGx3Y0k1S29DVEtuYVVvbGEw?=
 =?utf-8?B?TU5TU1VMdUZKQ1RUbG50MUtISEFKQWJZT0xDVm1GUDlsb2h4Um1SMkVEOXUr?=
 =?utf-8?B?eEk3djMvV0hraFZVS1N2MVI4VjIwSHNHU0I4VHpHcThiSGVEa01lMzNQWEcv?=
 =?utf-8?B?enNrSVN2Y1VUTU1ON2Q0VnIwVHJWd29lenppeU1oelRDOVhBUE4rK1ZHMkI4?=
 =?utf-8?B?OHJVTGZnRTVHY0JtVVMwVGhZUnErK1dCcWc1emRRanFRWXgrQ0ZmenZ6OHUz?=
 =?utf-8?B?ZnczN0EvN3hiVFBKRnA0OG1WTFFMOTA0MG5OVWl2KzRyb2hQNU1TcEtqSG40?=
 =?utf-8?B?MnZzbnZzb3FrSklya2lXeEFWTXJWZ1RQTldvR1dTd0xOWFRTYit5aDdkc1VO?=
 =?utf-8?B?ZjZzV2VUT3gwNHFTT1Nnc3lPVms5OHhaT3E4OUlJazF5b3A5bURvd3E2QzBr?=
 =?utf-8?B?aWhaYnFySWtGMnRqRXZncTVpVFRxYkx5M0tOazE3b2cwMVc5djgrWkhoYXZ5?=
 =?utf-8?B?ZHNxRUtLZ3JjVFRmVUNSaytMcDU5Z0VuOGd4ZlhpaHV4VFRJRzY1SnBDK0p5?=
 =?utf-8?B?ckljcW9BY1krYjFrTkVESm5DaU9va2pUaUV6Y0c3aUF4QVFJbHJEbTB3ZVUw?=
 =?utf-8?B?SmErYXdieXlrVXIrNHFia0dneW95TnphL1I5NktaajVGWC9WdWtMb2hObEJ5?=
 =?utf-8?B?Vm5hRWxJVGhtbVkvcnFVZWVDcm1YM2NKNFFQRFRiajNoN3F0bHVKLzRFUlRu?=
 =?utf-8?B?MVRpeUFOMk9WWnZaZUhSYjNUMUR6YS9EZENpYTFucjFWSExLVTVqdEdjOTBB?=
 =?utf-8?B?RFVjOEN4a2RDQlRSY1NpM1JPMUtJOTBWMGpEL04xOGk5QjNNd0ErVDdLeThU?=
 =?utf-8?B?VFRlS3NpUG0ybmdhVGVuMldGcllZdXhVeXllOXBIU2JhQ2NtaWxLMGhVdnBu?=
 =?utf-8?B?bktrbGFnSUtnNmdGQVU5blZGT0FDQml2VWN0cGJ2ZTBEZTlMK0UzYUhjYzB6?=
 =?utf-8?B?bHc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be7bb5d-34a1-4b2b-0622-08dc404f9dae
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2024 15:43:07.1365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yWuc7YvbbZ2N46FHpvG6vp7De0NKZ3atDD4QUEgTkwtls1J5ckowbbx8LKEWiguJBjZMewBOp8fIoi+KVh9HaZyoCGG5MtyXaAT4VgIVZV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11867

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IFNhdHVyZGF5LCBNYXJjaCA5LCAyMDI0IDE6MzAgUE0NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCA0LzRdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzB7NDMsNDQsNTR9OiBV
cGRhdGUgdXNiaHMgZmFtaWx5IGNvbXBhdGlibGUNCj4gDQo+IE9uIDA5LzAzLzIwMjQgMTM6MzIs
IEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+ID4NCj4gPj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+PiBTZW50OiBTYXR1cmRheSwg
TWFyY2ggOSwgMjAyNCAxMjoyNiBQTQ0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNF0gYXJt
NjQ6IGR0czogcmVuZXNhczogcjlhMDdnMHs0Myw0NCw1NH06DQo+ID4+IFVwZGF0ZSB1c2JocyBm
YW1pbHkgY29tcGF0aWJsZQ0KPiA+Pg0KPiA+PiBPbiAwOS8wMy8yMDI0IDEzOjE0LCBCaWp1IERh
cyB3cm90ZToNCj4gPj4+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+ID4+Pg0KPiA+Pj4gVGhh
bmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+Pj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxv
d3NraUBsaW5hcm8ub3JnPg0KPiA+Pj4+IFNlbnQ6IFNhdHVyZGF5LCBNYXJjaCA5LCAyMDI0IDEy
OjA4IFBNDQo+ID4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzRdIGFybTY0OiBkdHM6IHJlbmVz
YXM6IHI5YTA3ZzB7NDMsNDQsNTR9Og0KPiA+Pj4+IFVwZGF0ZSB1c2JocyBmYW1pbHkgY29tcGF0
aWJsZQ0KPiA+Pj4+DQo+ID4+Pj4gT24gMDgvMDMvMjAyNCAxOTowOSwgQmlqdSBEYXMgd3JvdGU6
DQo+ID4+Pj4+IFJlcGxhY2UgJ3JlbmVzYXMscnphMm0tdXNiaHMtPnJlbmVzYXMscnpnMmwtdXNi
aHMnIGFzIGZhbWlseQ0KPiA+Pj4+PiBjb21wYXRpYmxlIGZvciBSWi9HMkwgZmFtaWx5IFNPQ3Mg
YXMgdGhlcmUgaXMgYSBkaWZmZXJlbmNlIGluDQo+ID4+Pj4+IG51bWJlciBvZiBwaXBlIGJ1ZmZl
cnMgY29tcGFyZWQgdG8gUlovQTJNLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+
PiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0My5kdHNpIHwgMiArLQ0KPiA+
Pj4+PiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0LmR0c2kgfCAyICstDQo+
ID4+Pj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNTQuZHRzaSB8IDIgKy0N
Cj4gPj4+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA3ZzA0My5kdHNpDQo+ID4+Pj4+IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I5YTA3ZzA0My5kdHNpDQo+ID4+Pj4+IGluZGV4IDg3MjFmNGM5ZmEwZi4uNzY2YzU0YjkxYWNj
IDEwMDY0NA0KPiA+Pj4+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdn
MDQzLmR0c2kNCj4gPj4+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3
ZzA0My5kdHNpDQo+ID4+Pj4+IEBAIC04MTIsNyArODEyLDcgQEAgdXNiMl9waHkxOiB1c2ItcGh5
QDExYzcwMjAwIHsNCj4gPj4+Pj4NCj4gPj4+Pj4gIAkJaHN1c2I6IHVzYkAxMWM2MDAwMCB7DQo+
ID4+Pj4+ICAJCQljb21wYXRpYmxlID0gInJlbmVzYXMsdXNiaHMtcjlhMDdnMDQzIiwNCj4gPj4+
Pj4gLQkJCQkgICAgICJyZW5lc2FzLHJ6YTItdXNiaHMiOw0KPiA+Pj4+PiArCQkJCSAgICAgInJl
bmVzYXMscnpnMmwtdXNiaHMiOw0KPiA+Pj4+DQo+ID4+Pj4gVGhpcyBsb29rcyBsaWtlIEFCSSBi
cmVhayBhbmQgY29tbWl0IG1zZyBpcyBxdWl0ZSB2YWd1ZSBhYm91dCBpdC4NCj4gPj4+DQo+ID4+
PiBPSywgV2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGFzIGRyaXZlciBpcyB0YWtpbmcg
Y2FyZSBvZiB0aGUNCj4gPj4+IGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuDQo+ID4+DQo+ID4+IEFo
LCBJIHdhcyBub3QgcHJlY2lzZSBoZXJlLCB5b3Ugc2hvdWxkIGNvbnNpZGVyIHRoZSBpbXBhY3Qg
dGhpcyBpcyBvbg0KPiA+PiBEVEIgdXNlZCBvbiBvdGhlciBrZXJuZWxzLiBZb3UgZ3V5cyBzaG91
bGQgcmVhbGx5IHN0b3AgdXNpbmcNCj4gPj4gaW1wcmVjaXNlL2luY29ycmVjdCBnZW5lcmljIGZh
bGxiYWNrcyBhbmQsIHNpbmNlIGl0IGlzIHVzdWFsbHkgdHJpY2t5IHRvIGtub3cgd2hpY2ggZmFs
bGJhY2sgaXMNCj4gY29ycmVjdCBvciBub3QsIHlvdSBzaG91bGQgc3RvcCB1c2luZyB0aGVtIGF0
IGFsbC4NCj4gPg0KPiA+IFRoZXJlIHdpbGwgYmUgZHJpdmVyIGNoYW5nZSB0byBoYW5kbGUgU29D
IHNwZWNpZmljIGNvbXBhdGlibGUuDQo+ID4NCj4gPiBTbyAsDQo+ID4NCj4gPiBvbGQgRFRCICsg
b2xkIGtlcm5lbCB3aWxsIGhhdmUgMTYgcGlwZSBidWZmZXJzIG9sZCBEVEIgKyBuZXdlciBrZXJu
ZWwNCj4gPiB3aWxsIGhhdmUgOSBwaXBlIGJ1ZmZlcnMuDQo+ID4gTmV3IERUQiArIG5ldyBrZXJu
ZWwgd2lsbCBoYXZlIDkgcGlwZSBidWZmZXIuDQo+IA0KPiBZb3UgbWlzc2VkIG5ldyBEVEIgYW5k
IG9sZCBrZXJuZWwuIFRoaXMgYnJlYWtzIGFsbCB1c2VycyBvZiBEVFMuIFRoYXQncyB0aGUgZW50
aXJlIHBvaW50IG9mIHlvdXIgYnJva2VuDQo+IGdlbmVyaWMgY29tcGF0aWJsZXMgd2hpY2ggeW91
IGRpZCBub3QgYWRkcmVzcy4NCg0KQXMgcGVyIG15IGtub3dsZWRnZSwgdGhlcmUgaXMgbm8gdXNl
ciBpbiBSWi9HMkwgaXMgdXNpbmcgbmV3IERUQiBhbmQgb2xkIGtlcm5lbC4NClNvLCBpdCBpcyBz
YWZlLg0KDQpDaGVlcnMsDQpCaWp1DQo=

