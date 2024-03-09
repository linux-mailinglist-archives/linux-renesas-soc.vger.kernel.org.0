Return-Path: <linux-renesas-soc+bounces-3641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA6D877204
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 16:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5020C1F21525
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 15:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1404503D;
	Sat,  9 Mar 2024 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AjLQaImG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441E3FE1;
	Sat,  9 Mar 2024 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709999627; cv=fail; b=s6MJr/kGC9f7sUbhIed7py9vPf7w3i7z9rbivF13Ws70qpr8GtylJIrXhHg1pGhBVhe+QsN+GvG9IZJVG86SNFhwfsxEZrjnrX5kWCjX7T29+mO5aK313pAI3f4zhN/AtS8CJwfhs9yvL4hXRxFWw2DYTTNQRkqPB4W/Zu+H8hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709999627; c=relaxed/simple;
	bh=zp3NFCi8uOZEu0rE701NQSfAzmhPhutz9qhinagEMbY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iuZXvTcjhYAyCvNG2HVUNNQPb70cSK0y+Ta/tClf77J4qkrQoK+iel0/dt/IJXKZ7ljn6Nfo/v9Cgdo9vEHhDKEo9ugN2eanGCIqVDQaY/Vv9qbV79Iu3x8BICI8zLSX5k/klJUpSqjsmPfjqu08Wny+IIUHD7ckODwtw4tzzrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AjLQaImG; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oT0tjZgQuIv9JFSK98EL2azyWezao5zjLpV50A2yPgDFHl9nFlh5EWAjyuOH3LZI7uEYVTg8xSsgUzEcmrRNeIxhliOW+vjcfW1esH4uK4VrcoWdywNyLyTZNUgETl45wQwX0uRMMqwrQ6RK+cDTOKMCEhdSNBdzRXa9iwhrM/0I3m64hBZrGHUpqdqhdgnkX6m6pxf0AQMFCP9r0cQShzKnechNz+OP3FwP6wWkPbsgrp04cTLpw40xDLaYtj2vlLFtAIRWGBMo/UlDftEL36cDumtbrfOpNTWBNOcNW0hCU96ANZlX4mq4jyowCvfzR7IyKJaUEahIODQdZEbzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp3NFCi8uOZEu0rE701NQSfAzmhPhutz9qhinagEMbY=;
 b=AGLrc8f3yVAxQY/qYawDzp1+JBNcU1sARMOQifb0EwEx0oe1aETnMPYp/qSjrJ8dNoX99jsyawERZOE+9cjQQm608lPrwehyYIiaOLfqENHVYmf6MDmYmpwhIlwnlXGLTtSRzdilJH1w7Pp9UdRstat57b3n3moWc6PCcV9DWz+SQ0uwKSc4ahkXAZ0vAXMSWdiWLqxFigHZP/nYyIPdarWWD8CKxyvzqcY4KtMYj7Q7WVu8Qq67SakCV9NaHb2maTTNEuTGJGrAISARsllMVDv5pC+FxvglRVPVZDII1LpB97PTxhKLEOcVq+HPmfjqgo7gO/BDdZeEflQ3HwqFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp3NFCi8uOZEu0rE701NQSfAzmhPhutz9qhinagEMbY=;
 b=AjLQaImGRRcN20/WK1DWI2DlARh/N2SBc4X07oolxkcKhgZAiI4kuV7DJMmiOLK5vUyQMN1XhOs8pHUqfQKkNIq4A5o4/FzDLUUwFadCErLZDPmZBESRXuMWQ02K4hIVRLqPeRADs+AEbP7MVvJQ/CK+69zrAjWVMR6L0bE1c54=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TY3PR01MB10452.jpnprd01.prod.outlook.com (2603:1096:400:310::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sat, 9 Mar
 2024 15:53:39 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Sat, 9 Mar 2024
 15:53:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
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
 AQHacYPMGWKOfJ8WCEqHUSv4i74FdbEvUfMAgAABIyCAAAOtAIAAADSQgAAR4gCAACQ3AIAAATtQ
Date: Sat, 9 Mar 2024 15:53:38 +0000
Message-ID:
 <OSAPR01MB158700437A1D57805BAF349686262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
 <20240308180919.6603-5-biju.das.jz@bp.renesas.com>
 <67819907-4366-483d-b71b-2646ffb076fd@linaro.org>
 <OSAPR01MB15874E48DD2269C2593DB55A86262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ff569d52-f68f-410d-9897-9e1102171a1b@linaro.org>
 <OSAPR01MB15874A9DB0CE13AB0440242186262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <2821f23f-aac1-4b12-ba60-bc60da153d8a@linaro.org>
 <OSAPR01MB1587C505F324B11824AB6AB286262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
In-Reply-To:
 <OSAPR01MB1587C505F324B11824AB6AB286262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TY3PR01MB10452:EE_
x-ms-office365-filtering-correlation-id: ffc2571a-7c44-4d43-00fd-08dc40511605
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ManqNd7zMDnT34oDeGDDXX77cinsbWtVKWrKsMXgcCDG0WPMytjpQzFRuNW2uADLXnxxTjBXLz6skY+U1FzW9xordj2likHdpMri+S+IfrU4C70/VTgmbwxbSyE2zEscfvl6Tf5fQSW4+bp4Y+wgjJdRuL/YN+zopYmWZ2M6nVop8p5zUZx0Pw5PlwiO4GebgCLbccpku775LQQaoN1eVBna6SPP+9OloCSRVVmsfb+tBJVesS6TgM79g4oiRaC00hseT065K1uYmn91dWI4QZlb10XZMafPRMUydh1oDzMnUrXRSX0p3jQ9PQx2ggmKmb9icLtUCWcstbubLfvXrovc0sSYoiJO0CDWlWPH3afOFSbGd2NuSW2P9Ot7wyLA+InsOkCj9mDprI3sYFvMQHyqgFvsJpdJlv+acoVENijnuEwt74hnl67uCVZ78+vMPB3ayi8wvd+jahoD12VS4g/S8uTQKA9WO/a83ng11rKLy6pDnOklv9XvqKjqZT5p3PQop/LSGU2W7ND7MP1iP7krmz0JrTb8EJpLPitiTJ1+ageLbnj2GkNLwl66y+CQsOCqKZZ1lmf2AC0s3fSVEKBl6SY1Wl8hcVzr/qLwG6NkE8IQfZNkl/XPfV6e8Wz1JQ2KTJsBj6dobsfauvzfOJ9zDxRGozfzBe1Migub6UWLo14dyGpDwUdiHBSPuPT/OHFH1QRvqUQrCJqFSNenSg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1IvQzdQOHNEbW9FdlJiNWs2VHAxbkliN0JYWFZKVGlHdzc1azFmSkJFTDJW?=
 =?utf-8?B?UWVWRlR5RkVmcG9xUG8zdHAyTlNLOHdZa3FOZGdTQXp0NVlIVmM4OUZVSWtB?=
 =?utf-8?B?Y0h4MVpYdGVmdTRYZUp6WXNORUpycjhnSE0rbEpNVm9GYVRqNitEc1lCT1Bt?=
 =?utf-8?B?dzJLUmZlaFVaekUwSUhia1phZ211eE05ZnVGNXh1U0FYQmUyREQ4b3JDeGJj?=
 =?utf-8?B?cWU1WU1nM1M4NzUxR3FTK1Vxaks4T2pIMGlFcElySW55bXlaRjh0dXdVajM5?=
 =?utf-8?B?dVYwZnY5aWc2TkVERSt6a3l5Uk5oZlJ1VVU5ejJVVFBqN3ZjOFJjUitZU3RK?=
 =?utf-8?B?UGM0K0ZjTTZ5Y0k5SXdId2tjdzI3cmoxZERoWHpnNFpFRVYyVnhONEZqYklV?=
 =?utf-8?B?aEpoSzkybFhjQndLWGFUVnJvYjlyWXB3Y1FiWHg2OS9GQitxcGZKL3FPSnhk?=
 =?utf-8?B?RzEzeVY4MmlwTEhsZVNjQUUvRGoyRlMrR3RiRDdKNnNIem1GZG9RQllsVkRm?=
 =?utf-8?B?YWJqSDVpSm5JaXB0V0Rnczc2YTl0eDhZb3hobkJacDQyVUYybUx1Ryt2K3hF?=
 =?utf-8?B?V1RoRlY5SThwUGd5NU9QMDh6SFdpdG5ZK0VUUDBCUENUZ0FkRTBCcm1QL2Ro?=
 =?utf-8?B?SjNoWk9MWHhSRElobWk1ZUVteEw4aXB1MGtobXdsM2JCM2YwdzFBa2NvdWYr?=
 =?utf-8?B?NnBzMmwzVGJmR1pJS0lLQ2NPQmNnb3ExUHlYa2NFM2Y2cnkrc1p5NFVyS3Ry?=
 =?utf-8?B?Yy9SNS9IQ3ZWY0xSeEdtOXZYd28xUkt0QzFkRTBKbDVMMWlGbnF1T1VPWWRt?=
 =?utf-8?B?TWo3YzBnNVdOcHNDMUJHSTJOSjlTNXRROTk3clJlMnhrLzJMckFtbm5kc0Yy?=
 =?utf-8?B?WFVjN01sQ29FcmRmOWI3SDAvaXRsQmdIYUdxSHVJdXpoOHRGMjBvT3cwaWtM?=
 =?utf-8?B?TmJjREt0cEt2eVlkSTVFS3k0M2lHYm1QZUdDMzhxU1VLOW1XV3UvYWoxUVlB?=
 =?utf-8?B?eW1oYXFpMEdSMHlaQkxzTjVZNWtlM0xXVGZSOGQwKzFXRllUUUlYcXRNM3dw?=
 =?utf-8?B?RnpXYTBmdkRqMFN1WU02SjVNUVZQaHlNUUloL2x2WjQ5ajY4MFRNZ3FBL3lB?=
 =?utf-8?B?TEs0SFdyN0lRT2dkZDNra08yYllqcjFteXc2dmdBUnd3WWsvTWdNSUwvRVlV?=
 =?utf-8?B?Nm9TOEkwN1J6MEQxYnFSMVZ1Qlg1OEYvWHZCVUNrUEsvMFA4OXZzWVJ5OUJM?=
 =?utf-8?B?clRmSXZzaFVOTWIwMElTcVlZZENEdzdYWXJpNzR0NUphMGJONDJpdlVYNERF?=
 =?utf-8?B?blFkTkJwZ2dLeG1kNE8zT1E1OTBPbTFWUVRzaGNERzVicEkvbHNjOThIWHVY?=
 =?utf-8?B?ODNFMTBZMjVTRndyY01rTFQ1T0FvRlJ6dzRrUXowMFhWenZGTWZFOUswZmJO?=
 =?utf-8?B?ZU5GQmp5Vk1DWW9vNFRKNlpGV1VZeVNIYm5QSlV3TFRTZWpvQS9TRlU5dnB0?=
 =?utf-8?B?U0VwSTZvL3FCNmdwVHR4SW1wUmVkUHpaNFpYVnZqcTdrbUxkMDM5YjAva2tW?=
 =?utf-8?B?MTZRU0lMRTRacG9OZGJwVkJTK2Q3dFhnYndmbzR3MjJ6ZERMWHlYQi9HbEla?=
 =?utf-8?B?RndwdVZjRm5HcXNsaGt3QzIrTlJna3hCVWxlUDBrTitUYUdYcGxvQjhzakVV?=
 =?utf-8?B?YXlRRjdkeVIrQmVyNnNPWnV3VnlxS282c3dtT0wzSmQwYVBOU0NlQ2ZNWndJ?=
 =?utf-8?B?ckdXUnp4ZlZGKzJKRVlVNlMvT1VrYTBIa1k3dUp3ek9IWUFncTdOK2VDSEdN?=
 =?utf-8?B?RkFEL2lJTWhEWm9jSXFYTnNGMTZXUXUwT0ZkUk1udER1dkE5dlBRanhMeHZx?=
 =?utf-8?B?dVZwdmdqMkt0VG5lVDFmVXJmcjRDQ0F3d1JPOEZrNUVleWIrZ203ZVU3NkdO?=
 =?utf-8?B?Ui9WSlFYTlNaZ1ppN3hPWi9vZDhWOVdQMWVSYlBmbHB3WGkvRTNrK25yWUVK?=
 =?utf-8?B?MTlRS0VIc3ZqZDU4U1BNSi9JTWpCaU1lVEgvcjFvd3Q0cFRhWlZlWjVQa2Iz?=
 =?utf-8?B?Y1FvanhGQTRkcXdrYk0ySzBkbU1ZVWxxUG9lM3h5dFYyeEVvUUQ1blg4TVkr?=
 =?utf-8?B?amlDUFhEdHg5cFU2U3VuWGRsdkQveEFUdHFwUVhIak9JSkhEUFAycjBKTjgx?=
 =?utf-8?B?OVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc2571a-7c44-4d43-00fd-08dc40511605
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2024 15:53:38.5205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adcCTTq71X8ey8t7zbG4FLHihau+f0io+Nw8k0MEjZql9XAMX73mlN5SzC0Sr7geBbUvRyeaFO0UCQaKLTu4t3+6r8bK4k82ciB4AJbjmJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10452

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IFNlbnQ6IFNh
dHVyZGF5LCBNYXJjaCA5LCAyMDI0IDM6NDMgUE0NCj4gU3ViamVjdDogUkU6IFtQQVRDSCA0LzRd
IGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzB7NDMsNDQsNTR9OiBVcGRhdGUgdXNiaHMgZmFt
aWx5IGNvbXBhdGlibGUNCj4gDQo+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+IA0KPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+IFNlbnQ6IFNhdHVyZGF5LCBNYXJj
aCA5LCAyMDI0IDE6MzAgUE0NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNF0gYXJtNjQ6IGR0
czogcmVuZXNhczogcjlhMDdnMHs0Myw0NCw1NH06DQo+ID4gVXBkYXRlIHVzYmhzIGZhbWlseSBj
b21wYXRpYmxlDQo+ID4NCj4gPiBPbiAwOS8wMy8yMDI0IDEzOjMyLCBCaWp1IERhcyB3cm90ZToN
Cj4gPiA+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+ID4gPg0KPiA+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+ID4+IFNlbnQ6IFNhdHVyZGF5LCBNYXJjaCA5
LCAyMDI0IDEyOjI2IFBNDQo+ID4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzRdIGFybTY0OiBk
dHM6IHJlbmVzYXM6IHI5YTA3ZzB7NDMsNDQsNTR9Og0KPiA+ID4+IFVwZGF0ZSB1c2JocyBmYW1p
bHkgY29tcGF0aWJsZQ0KPiA+ID4+DQo+ID4gPj4gT24gMDkvMDMvMjAyNCAxMzoxNCwgQmlqdSBE
YXMgd3JvdGU6DQo+ID4gPj4+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+ID4gPj4+DQo+ID4g
Pj4+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+ID4+Pg0KPiA+ID4+Pj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+Pj4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gPiA+Pj4+IFNlbnQ6IFNhdHVyZGF5LCBN
YXJjaCA5LCAyMDI0IDEyOjA4IFBNDQo+ID4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNF0g
YXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDdnMHs0Myw0NCw1NH06DQo+ID4gPj4+PiBVcGRhdGUg
dXNiaHMgZmFtaWx5IGNvbXBhdGlibGUNCj4gPiA+Pj4+DQo+ID4gPj4+PiBPbiAwOC8wMy8yMDI0
IDE5OjA5LCBCaWp1IERhcyB3cm90ZToNCj4gPiA+Pj4+PiBSZXBsYWNlICdyZW5lc2FzLHJ6YTJt
LXVzYmhzLT5yZW5lc2FzLHJ6ZzJsLXVzYmhzJyBhcyBmYW1pbHkNCj4gPiA+Pj4+PiBjb21wYXRp
YmxlIGZvciBSWi9HMkwgZmFtaWx5IFNPQ3MgYXMgdGhlcmUgaXMgYSBkaWZmZXJlbmNlIGluDQo+
ID4gPj4+Pj4gbnVtYmVyIG9mIHBpcGUgYnVmZmVycyBjb21wYXJlZCB0byBSWi9BMk0uDQo+ID4g
Pj4+Pj4NCj4gPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+ID4gPj4+Pj4gLS0tDQo+ID4gPj4+Pj4gIGFyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yOWEwN2cwNDMuZHRzaSB8IDIgKy0NCj4gPiA+Pj4+PiBhcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0LmR0c2kgfCAyICstDQo+ID4gPj4+Pj4gYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA1NC5kdHNpIHwgMiArLQ0KPiA+ID4+Pj4+ICAzIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+Pj4+Pg0K
PiA+ID4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdn
MDQzLmR0c2kNCj4gPiA+Pj4+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cw
NDMuZHRzaQ0KPiA+ID4+Pj4+IGluZGV4IDg3MjFmNGM5ZmEwZi4uNzY2YzU0YjkxYWNjIDEwMDY0
NA0KPiA+ID4+Pj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDMu
ZHRzaQ0KPiA+ID4+Pj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cw
NDMuZHRzaQ0KPiA+ID4+Pj4+IEBAIC04MTIsNyArODEyLDcgQEAgdXNiMl9waHkxOiB1c2ItcGh5
QDExYzcwMjAwIHsNCj4gPiA+Pj4+Pg0KPiA+ID4+Pj4+ICAJCWhzdXNiOiB1c2JAMTFjNjAwMDAg
ew0KPiA+ID4+Pj4+ICAJCQljb21wYXRpYmxlID0gInJlbmVzYXMsdXNiaHMtcjlhMDdnMDQzIiwN
Cj4gPiA+Pj4+PiAtCQkJCSAgICAgInJlbmVzYXMscnphMi11c2JocyI7DQo+ID4gPj4+Pj4gKwkJ
CQkgICAgICJyZW5lc2FzLHJ6ZzJsLXVzYmhzIjsNCj4gPiA+Pj4+DQo+ID4gPj4+PiBUaGlzIGxv
b2tzIGxpa2UgQUJJIGJyZWFrIGFuZCBjb21taXQgbXNnIGlzIHF1aXRlIHZhZ3VlIGFib3V0IGl0
Lg0KPiA+ID4+Pg0KPiA+ID4+PiBPSywgV2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGFz
IGRyaXZlciBpcyB0YWtpbmcgY2FyZSBvZiB0aGUNCj4gPiA+Pj4gYmFja3dhcmQgY29tcGF0aWJp
bGl0eS4NCj4gPiA+Pg0KPiA+ID4+IEFoLCBJIHdhcyBub3QgcHJlY2lzZSBoZXJlLCB5b3Ugc2hv
dWxkIGNvbnNpZGVyIHRoZSBpbXBhY3QgdGhpcyBpcw0KPiA+ID4+IG9uIERUQiB1c2VkIG9uIG90
aGVyIGtlcm5lbHMuIFlvdSBndXlzIHNob3VsZCByZWFsbHkgc3RvcCB1c2luZw0KPiA+ID4+IGlt
cHJlY2lzZS9pbmNvcnJlY3QgZ2VuZXJpYyBmYWxsYmFja3MgYW5kLCBzaW5jZSBpdCBpcyB1c3Vh
bGx5DQo+ID4gPj4gdHJpY2t5IHRvIGtub3cgd2hpY2ggZmFsbGJhY2sgaXMNCj4gPiBjb3JyZWN0
IG9yIG5vdCwgeW91IHNob3VsZCBzdG9wIHVzaW5nIHRoZW0gYXQgYWxsLg0KPiA+ID4NCj4gPiA+
IFRoZXJlIHdpbGwgYmUgZHJpdmVyIGNoYW5nZSB0byBoYW5kbGUgU29DIHNwZWNpZmljIGNvbXBh
dGlibGUuDQo+ID4gPg0KPiA+ID4gU28gLA0KPiA+ID4NCj4gPiA+IG9sZCBEVEIgKyBvbGQga2Vy
bmVsIHdpbGwgaGF2ZSAxNiBwaXBlIGJ1ZmZlcnMgb2xkIERUQiArIG5ld2VyDQo+ID4gPiBrZXJu
ZWwgd2lsbCBoYXZlIDkgcGlwZSBidWZmZXJzLg0KPiA+ID4gTmV3IERUQiArIG5ldyBrZXJuZWwg
d2lsbCBoYXZlIDkgcGlwZSBidWZmZXIuDQo+ID4NCj4gPiBZb3UgbWlzc2VkIG5ldyBEVEIgYW5k
IG9sZCBrZXJuZWwuIFRoaXMgYnJlYWtzIGFsbCB1c2VycyBvZiBEVFMuDQo+ID4gVGhhdCdzIHRo
ZSBlbnRpcmUgcG9pbnQgb2YgeW91ciBicm9rZW4gZ2VuZXJpYyBjb21wYXRpYmxlcyB3aGljaCB5
b3UgZGlkIG5vdCBhZGRyZXNzLg0KPiANCj4gQXMgcGVyIG15IGtub3dsZWRnZSwgdGhlcmUgaXMg
bm8gdXNlciBpbiBSWi9HMkwgaXMgdXNpbmcgbmV3IERUQiBhbmQgb2xkIGtlcm5lbC4NCj4gU28s
IGl0IGlzIHNhZmUuDQoNCklmIHRoZXJlIGlzIGEgdXNlciBmb3Igc3VjaCBjaGFuZ2UsIHdlIGNv
dWxkIHVzZQ0KDQoJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHVzYmhzLXI5YTA3ZzA0MyIsDQoJICAg
ICAgICAgICAgICJyZW5lc2FzLHJ6ZzJsLXVzYmhzIiwNCgkJCSAicmVuZXNhcyxyemEyLXVzYmhz
IjsNCg0KT3INCg0KCWNvbXBhdGlibGUgPSAicmVuZXNhcyx1c2Jocy1yOWEwN2cwNDMiLA0KCQkJ
ICJyZW5lc2FzLHJ6YTItdXNiaHMiOw0KDQoNClRoZSBmb3JtZXIgY29uc3VtZXMgbGVzcyBtZW1v
cnkgY29tcGFyZWQgdG8gdGhlIGxhdGVyLg0KDQpBcyBsYXRlciByZXF1aXJlcywgMyBwbGF0Zm9y
bSBzdHJ1Y3R1cmVzIGZvciByei9nMmwsIHJ6L3YybCBhbmQgcnovZ3VsDQp3aGVyZWFzIHRoZSBm
b3JtZXIgcmVxdWlyZXMganVzdCAxLg0KDQoNCkNoZWVycywNCkJpanUNCg0KDQo=

