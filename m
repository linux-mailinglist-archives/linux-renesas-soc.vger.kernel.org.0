Return-Path: <linux-renesas-soc+bounces-16724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A86AAC64F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 15:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCD6E174D5B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 13:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8096628153D;
	Tue,  6 May 2025 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="idmQRogM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D6728151F;
	Tue,  6 May 2025 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538250; cv=fail; b=qkLDo5HhjCtC4CxRur3Q5HRuFpYo2VVQ8FrNBsEMAQPEIa6oP6V/RFGSIZtRmUufI5D0LnrjICoMoXrUTAG+0j3ixdUdMzR4jJs7+3Y7mWQHpzfkKMajp36V7qNTc2UQzAJW0gboAAYBImO/cYBSeCCPNu+FDJ0Wx9HLaMWKOb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538250; c=relaxed/simple;
	bh=z/b8stmRagH7i+Yw0+ukIh5ORirph2j93W+5bjHcCuo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PqvabH2w0BiRU+UmlCzCOZZkYV5F1uNk/NNKwjutGLMmruykb1eCApVhNRR+XwVrbcrbyUmXWIKJmde73KhoWeUfYZEpbW30Dx66EtoIvrvW5UdykmpG50pGYAgimCh5NpODP03ybLzrJJrww8vaGVvCylEa89oTz40ln49+DrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=idmQRogM; arc=fail smtp.client-ip=40.107.74.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOlIKVnSSNLL8Sm5v3Yz0l0ZtdJezSNJZVnmdLqLxMWvHXsZG5pG4DhKVKM1xGm+Pk+wa+KTcxMdwn+HDgLtzHO479bSnwaGFfTtRzZipdZ8h7x8gUK4jUg9zb/iX95immL2PAe8Xoee3cdg7fCjp0oxiPa5L8YXVbNTQgeHrx8obmJaXF1hNwr6T3M6X6nCCcnk2PnA2Fb32gAB08aczQplayNwyhqfkYJS5XlQpLX1FeP9b6TqjHFfwkvZMh18vXjmfmfhq9D4SlDG05VAbJ9NwqRa9HNso3Vom06jyDaAw3XPyV1ysrNHo4TkC00VtpBaq08bqpeyrNcFf8aLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6ZQ9A4CJSZwk02ZVr3mAOfN9BFWYQHehSnb2DX7ZV8=;
 b=LtHTcBcERDg//+G13RplgjrDLEx7O1beM7vLAumqkUq42ssy9nG8Ec+ubtkapeBWdny2zxLHfkRsQMpEAHGrD46jUSg7bbQPhNWn+Iitw6Zhbg78iIXt1HRQnydqQiDHvr6EEE7Jur6M2ur2jZi2PCQKH8KWd7oyUQ+VgcwRS8Jhj+j9mazVzeLSjHvt822jxvQWQsA5iuKBKV5r3KTc4DZSZBJIChrPgRiLyLOcGgSyO5k1saJjfSJE9T+6sJ6/4JNDSprK176KSY67hvUvq8cDgPx9MGWDpg08RLNXEeYgH4roeVr6r7RYsI72D/+ZtD0RHN9+1PiHEG+qXWFvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6ZQ9A4CJSZwk02ZVr3mAOfN9BFWYQHehSnb2DX7ZV8=;
 b=idmQRogM8qqJZL2vhTS0Y5alJdMLV4okoHWl25BtKjhLNKkAutL2WSAJoOhLS6CSDKZDXGJ0M53+zmC0GwcxXf/p2DbBSUTF/h5TXJg9mS4HuDLpapXaHaTOZNzzWpOo6XCzQ/IEWOwylbxKUkprS3QscabzsFhck+CxxxJOcWs=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TYCPR01MB8533.jpnprd01.prod.outlook.com (2603:1096:400:154::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.32; Tue, 6 May
 2025 13:30:45 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%4]) with mapi id 15.20.8699.024; Tue, 6 May 2025
 13:30:45 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: "geert+renesas@glider.be" <geert+renesas@glider.be>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>
Subject: RE: [PATCH 3/4] dt-bindings: clock: Add macros for RZ/V2H ISP reset
Thread-Topic: [PATCH 3/4] dt-bindings: clock: Add macros for RZ/V2H ISP reset
Thread-Index: AQHbvoBNkh3iNaoHRkGfGWJ05XDY3rPFmEdA
Date: Tue, 6 May 2025 13:30:45 +0000
Message-ID:
 <TY3PR01MB12089B3E015EA9DAC001706EEC289A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <20250506121252.557170-1-dan.scally@ideasonboard.com>
 <20250506121252.557170-4-dan.scally@ideasonboard.com>
In-Reply-To: <20250506121252.557170-4-dan.scally@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TYCPR01MB8533:EE_
x-ms-office365-filtering-correlation-id: 2306f52e-0f89-434a-8761-08dd8ca23498
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bHoE+aE/2Cwg7C+Lx5OdQD0gCDzawLj0ljYWdpKgHBgtPlofBLmDJJx9/shC?=
 =?us-ascii?Q?7vFuC56YEfn1F8xaRD9NeVbqljQrrcesw2y4b4iXk2o18LnvURzKKTvhh6bl?=
 =?us-ascii?Q?9PKgv0PD9jv55dxdjtuaULMAd75d3RCLni1rfzcf+MWJmNhT5PMWOrJHDdj7?=
 =?us-ascii?Q?qCigG27ic+kAjhIm/gYCupijK45qox+QmWIPLGh/VbGY/I+ZV4vjtaiMoURB?=
 =?us-ascii?Q?Koq64u/HYiAqpM+wRTAXsiuhJvbYeXdLBaxubcJaKp4ES3eMzYL/svwcujJq?=
 =?us-ascii?Q?evZcndT8AGvkqReyeMZf6IHO2kKFL1Bl0PYhVa2ACmiFJL+ywTcRtHyUt5S4?=
 =?us-ascii?Q?v23vLeagHzl58uXlWuwLSod/iHzQI/+MyuPyEFvt3XoNaHQSoYQa1diXUtmP?=
 =?us-ascii?Q?VC9S5ZldJkpjjVEtHXQ+UxaxgqxhZhJnIivl7TKWoAF6tCnXYhkDffS4fN3+?=
 =?us-ascii?Q?eCd9GL/1cLyTIjMFqTVuVPuhd8baGZ+J2X6I5j61t3cYfWqKPbHhVmPARdRM?=
 =?us-ascii?Q?wBbXQKxotCT1oAxt52/P6cHPVtJsbAw0wDj6IsZOABZS3noM+BGay4EPKTU4?=
 =?us-ascii?Q?/OWIgMzG/6fDNrkAaYbn2/0aYT5R0NJgJhXWV/aSaGUOqfN9hoy3xxrQY8yu?=
 =?us-ascii?Q?I5RUFqmxElquLhyyuMSJfSG1eDYR6C4mr1V1NlIoX53ilwBaOlp3QAY2wVI5?=
 =?us-ascii?Q?zn0zm6WakCVA2X2ofRhhTNYx3ExHWXMSLu3hOZP88qGV0pDzHPipNjUVSCnQ?=
 =?us-ascii?Q?PYlcezHgjeEPrqSG4Ufjsj8yx7SMTSnbtvzDr9XDxZx0hYft6+NaDLqcjpZ+?=
 =?us-ascii?Q?zkDYJdUpuC7Dj/5wMjCX3PrDJ5GfsZn8v2nlmcoOZsEQ5ZDOvyGG6KJ0iBr+?=
 =?us-ascii?Q?umTpTQemesU1a58K1qHim0OuiCYhCKOuVeGU0/EppF4CaA0jM7B/dKK6l2g/?=
 =?us-ascii?Q?MsENgbsH5auJq8fj8thspZ+29Lefk47dULBkqgciuL0qdz0jX3jyv3759+so?=
 =?us-ascii?Q?kht8bQ2Ve0Nex4Cva+AJCfX4uAJZSb+XaryxL1PkF/MI/PB1pdvp3Y/RNCOp?=
 =?us-ascii?Q?/x375tJWeOIAuPp4Lvc2ZsmKsPMWGwCxgkNMsyx++EioOy09tzOWr3zwVvt/?=
 =?us-ascii?Q?MgxqSordJ6MmPW69/9yfdGhWx3gcdz6JDaznnBLETqwhHPN52adgikcXT0ht?=
 =?us-ascii?Q?M1ahVtD5XRDHC9oa5Jdqp7hHGhnBlrgIO8K2MMWn1zFZVp+sHxO4pkilYasG?=
 =?us-ascii?Q?3BcuDcVeabD7rPpiO5VqtiM8dhjVAy4AYglwOnT2AKiJ/Rwihj9Wzv2LjM0R?=
 =?us-ascii?Q?1wsaNADAEFvbm67EnVp/f0Qv+c2SEkdiOu3H8XKBlafj98LxM7x9n54+8ijA?=
 =?us-ascii?Q?b0RqSXrVk5zCQW6MMtRtB/22hIH8633NRY4OL+WH//3RNYcwCDwCV6V3tJPr?=
 =?us-ascii?Q?Fatf/b5XL0fLWttguXu1RA8dRgI0Rr8JojChjgs1q1N5u6CpLnQvdLrVgDPZ?=
 =?us-ascii?Q?41DFfTXIsOtP7GY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kNhJcrNpJKkMKOn11z5qiU4NVMTaNgwaafujrwCbF7SpVZn9MWxEJ/70Clqy?=
 =?us-ascii?Q?zN9DQglGyKSFkpHnsumho1g+1nbB9t/ztOKAWrtHvmZjGEMaV5xJ/vSkJj6z?=
 =?us-ascii?Q?sjMJVI5HdG2kyto2NOnNTZKvW1ekV50MfJbHl5xxwpm6cLmFe1BJ33YNlL5h?=
 =?us-ascii?Q?2MT68wUrifayV47aG1PyeCZ1Qm3GZc+AVpp7Wfs0ODTIZW6tztbIydKBsJp1?=
 =?us-ascii?Q?UO+rcwbBcOWbngrJPZpT4hCY0uOxM/XUyhxhvlrj+SpwqeadM2B/srIV4ko8?=
 =?us-ascii?Q?kgNiCbubvBdVmG1LSX8Y1SV2aSRqeurCAGkKNSMMErPkkA1wpKYXM98co7l2?=
 =?us-ascii?Q?xUxuIBAwNsCpoAYmAcssqcxuV3JJh8q1A6WHZI8VIhqCN35cxPa98tBBjJ4v?=
 =?us-ascii?Q?knhRGCkcr7/bPDxB6zyJDUHiUnnUPIHvrB9puvU8heFwB22GOr3Mm797UAV4?=
 =?us-ascii?Q?S4D2bubk4LBwJG9B52i1pBKzny4E+w02P5wyjchTTX55j14iqYNeV9EyTQ8T?=
 =?us-ascii?Q?KC/obVV6OKxkduPp6ixLsD33IW0B30fPRyD07/Naskc8easkn0ZSvbW+OIPT?=
 =?us-ascii?Q?AXCrp76owNwa3P9ogelyDqbismxkoSF1HGzm+hU+dx4+6ztrO//yr98mCMIB?=
 =?us-ascii?Q?+3EVPjaA1gHzS/VvNdEp9KjWrsSAe8cw7k7nuevBXdpISBCxHIdipXEU5lKq?=
 =?us-ascii?Q?Z3ozOcaS3lrvKDhXrPuJgs/K6pBelEE8Ueqhk/4xzZUS7zlSoC2/T119leAs?=
 =?us-ascii?Q?u+bDLUy8iekSghCQXf94e0N6g+nv3VumLhlmpQgHzvZzDQsdVYBxpG5vyAH8?=
 =?us-ascii?Q?ksLBHlMuo829rqdD1SRdgPqKIkU2f1ctjlZaTVlFKMayb5Oew4MYkXYUZ3sf?=
 =?us-ascii?Q?xzFoDsRBkRYJBcokDtj35HZ5mkchYHePqDkGPhtOCorrheCpz8GUtJV9WRg6?=
 =?us-ascii?Q?g3h9ehCDMujACzSZHHFRfMj+lJLV33vZ777tzkaoM7AG43AahGYo+MHsqWBy?=
 =?us-ascii?Q?wf4NC5pSZPSlga86my0ESTI73gjMokGTqq3Eo7TJRDEnFVE99erhIoBRv6AX?=
 =?us-ascii?Q?Bt+D9TiiUB0VgjALCxRKh+DUIrRknCk2BVisaicfMSI5wx9yCfyLqOvIzKHk?=
 =?us-ascii?Q?ZhdYreq5DGxBeYC2bQ4WrrVrCu38VPshm8ZBFJlFp3L5iEOfKHsJvb3D1gs9?=
 =?us-ascii?Q?R7XuWrNOuzdoheksoOT4m9KSf+Fv6V1VnLmlhM+1hloj2w3sMPD8KvlEaZ38?=
 =?us-ascii?Q?sI0x1IKjBPCFJyv+jouLsVsZXDGp3AGaN/7HSOo4y7mhtySGaGmY+x8wSYvj?=
 =?us-ascii?Q?OUwM3HdJ6RBSZCZ8Zh+Ycg0+SNFIMpId+8AMDcMc5AcM2HBaXMH4S+ZGqCIt?=
 =?us-ascii?Q?kb78TLxTo4mYPa+qawiBIBD70CRfqj2FMsapg5+3jAo5AIKRzL3Il5ZFaBxI?=
 =?us-ascii?Q?iEkqBhOND9zpyW/Q1XcMs0rzlETQy8u1r7Btte9o5MJky5kzjoM22LokjE+s?=
 =?us-ascii?Q?xaCyFZzTuODVNGMUhUL2hl/zOlxl2/vROHKagzb9kS+rAMXTgMJShkqD6IHQ?=
 =?us-ascii?Q?KwCwPuvzaNhkawv/jaNv1J8cpeCFWH1vBFUHwr0TUVUV24hP2Vn7kuNciYZa?=
 =?us-ascii?Q?wA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12089.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2306f52e-0f89-434a-8761-08dd8ca23498
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 13:30:45.1185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 72ccCCOPIF9I7cPSrdlqiu0Bk8xK6FBrtuDf3EMfWVqIg1qTDVBPAooIBvYDCkhYlw0+P9T1pWxk8uSKP+XV/HaFjyVYvtseHLxBQCdNiFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8533

Hi Daniel,

Thanks for your patch!

> From: Daniel Scally <dan.scally@ideasonboard.com>
> Sent: 06 May 2025 13:13
> Subject: [PATCH 3/4] dt-bindings: clock: Add macros for RZ/V2H ISP reset
>=20
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>=20
> Add macros for the RZ/V2H ISP resets so that they can be referred to
> descriptively in the drivers.

I don't think this patch is needed. Please have a look at the below file
(more specifically, the descriptions for #clock-cells and #reset-cells)
for further reference:
Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml

Cheers,
Fab

>=20
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
>  include/dt-bindings/clock/renesas,r9a09g057-cpg.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h b/include/=
dt-
> bindings/clock/renesas,r9a09g057-cpg.h
> index cb2ccd9068db..958a2bd3e679 100644
> --- a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
> +++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
> @@ -22,4 +22,10 @@
>  #define R9A09G057_ISP0_VIN_ACLK			228
>  #define R9A09G057_ISP0_SCLK			229
>=20
> +/* Reset Definitions */
> +#define R9A09G057_ISP_0_VIN_ARESETN		209
> +#define R9A09G057_ISP_0_REG_ARESETN		210
> +#define R9A09G057_ISP_0_ISP_SRESETN		211
> +#define R9A09G057_ISP_0_PRESETN			212
> +
>  #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__ */
> --
> 2.34.1
>=20


