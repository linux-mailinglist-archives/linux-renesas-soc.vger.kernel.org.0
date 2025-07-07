Return-Path: <linux-renesas-soc+bounces-19302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59BAFAECD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 10:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB4047A3087
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 08:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A16028983B;
	Mon,  7 Jul 2025 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B4mqMEND"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30816273D89;
	Mon,  7 Jul 2025 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751877740; cv=fail; b=rgma+Vl8W+dUuA7MjypZdsxvKhldgrHSgTosGfUnnY95Wyc7fY+MYbUWHIk4vIXrbgsf+DMi3JXH0cESbVh7PiM4fCa1VPfrVWwlgsql4aEwEvqzi2eBeUjNh/0njS9UB/WDp1aehkCDWcNucnxb8XGg7Y+dm5n9ifSRZ6eSUSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751877740; c=relaxed/simple;
	bh=g2eEBA6AeaDo547Od9BidJE34/+ad1pb5igD/6texEg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lJ9VeZQROT2EMtpYWYAOXYs/ujqntSbR//z4IGLjtujnRkru7dMHgaiV/lwAUwLnbEdPLpuuoYTCNlbgw1ewHygXCtcvlxqQu19OSwZ/Jb72Dj1A0GmKZ4QMMi0+LUmBWjNJ811dsOLO0nLUwWRJRyc3GDJo7DIj5oHqP2kTGBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B4mqMEND; arc=fail smtp.client-ip=52.101.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXPQIebfae3JPa/vbeSyW1c31bPSB4tWJVXxXziOeuclYsTEoOikLbcKr4Rs8VWX3jvGXhKVm9w735CVeBy3ehrAC0vFINqRWTWYwj4JT8NEbS4DngX8pu+bfC1dcXFgyTurVFpCTE9k7Q/7z4WMwvOXDPYiT/vmKZMKVGnwUXAXGaAYFBXX4I3Cy/PY7AkSjFNiis5CG2xv4NUesz3n7OY5+IjweY0clzBg7bAZ7quXZUMI34I9wdYXWItnaNfLQJe2wYJkCSuPlfadV/T+KXQjyKdHI6EOtCEhWfrgsFTdcWCpx/uVDb3iuqupJhQ3sEaEWq76b+MjG3Lt2mAzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lE2X3NJOl3mW9Uyb8DrNN3a7rsQ2CUIq1PjX5WS16V4=;
 b=DouCPvqU74Puy618DaLd5eyNxolGZjBkTUxYuBNSyHpeRQjJnq6kBeQbQ/gHyJsaR7+DVInJ7eW1U+v5gvAiu+Hk5ZK98hlf5AAT2Mn/wYi6FctjTPRUBctuphuEkbFrxMNwCQhFt/5PB3N1tmZWzhtZhN+hqxT+HM9G/BwF82OXdfVAaP6bEwVK4ixatlJwKQH7ZkPpfC98038ggi19kBqj+EaIVBsBFO/uz2zRiYJj/bBA4cLj3aluqHpreg96YnklCorOkvDlNyLsnNlMxENpWE3p4lLRrIXNcMTzEUHTwjUmhMo7WhEVZpodAtDGw1Xz1nAKcQc/4dSl0FxY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lE2X3NJOl3mW9Uyb8DrNN3a7rsQ2CUIq1PjX5WS16V4=;
 b=B4mqMENDVkBH9Ou0nEar7UyZjlQhndlT0x71f99fAlvUxmurAonxhbBlBeor3FAfv88hJsheaaEPheH/WxwaKEbVLZWfcO2b1OI17MGB9gF5aqU1RGa9pwyqUGz7BbHg6bWrKp2Gh2ZcAlZBpaqVVHvfz4TZECJQLKl5pU5INTc=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS3PR01MB9512.jpnprd01.prod.outlook.com (2603:1096:604:1cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 08:42:14 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%7]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 08:42:14 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Paul
 Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH 2/3] net: renesas: rswitch: add offloading for L2
 switching
Thread-Topic: [PATCH 2/3] net: renesas: rswitch: add offloading for L2
 switching
Thread-Index: AQHb7Ke36EG/7WihdkaygD+7FM6lAbQhpj+AgASrcpCAAAkOUA==
Date: Mon, 7 Jul 2025 08:42:14 +0000
Message-ID:
 <TY4PR01MB14282D10FE4B1AB2CFB3525B0824FA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <20250704-add_l2_switching-v1-2-ff882aacb258@renesas.com>
 <64e7de61-c4ed-4b42-83c6-5001a9d28ec0@lunn.ch>
 <TY4PR01MB14282FF28B33F6A0EAD5251F8824FA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY4PR01MB14282FF28B33F6A0EAD5251F8824FA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS3PR01MB9512:EE_
x-ms-office365-filtering-correlation-id: 5bab1a47-ce37-46f1-3608-08ddbd322c20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7uA35CwavcAseBDl5oJkHNA7TrZhj5ReQ0F+JT6mMfKIf3y2UyMKrooIeN?=
 =?iso-8859-1?Q?XSh+wZpn7qmOz0aKoDUcOMDBMkeRq6KN8E+fP8aiiaydQYEk0+Vj0XEGs0?=
 =?iso-8859-1?Q?N4HldKbkExV7lkcGMD4miroGZVuU27lICLlBRo1u2XCTuCZCtSm83PPokN?=
 =?iso-8859-1?Q?WaxkJw9U4v0sx6Ywvj78SdX/KtHIx9VKIsD1ykar5+rhNWopCdkAw2pcGf?=
 =?iso-8859-1?Q?QRXLLBFrm5bY/I0lEgQ8atm/x/l3T8+uMkdl1TANESgRWlsKr6RJ+MILL8?=
 =?iso-8859-1?Q?9hrMsuhnQqmkcXenmGR6Pa+Pmo1RpY+nmPqBe4nEV4uxlWJWEG1LS8wO95?=
 =?iso-8859-1?Q?l6iQKNoYXOHoiOvFQA6gqYF8BxnCjuorBORzcQA31otLhy8G74SfkiP9/Y?=
 =?iso-8859-1?Q?0xWfGcJLDdsGwkcSRadLbV1FSMHpXay1dRmbq1n+ac+O+I8V5x4iqx6SME?=
 =?iso-8859-1?Q?mrT6eTdwf3JvQ5OLOE/TS5aMqbt4Xvb8V6dVJCv/lM33fvR/KlVbdCDB/L?=
 =?iso-8859-1?Q?EfcySryBNzwOSqb8Z4UC14waA4YbWo1PcyZwQIRQ705/FVKzr0QqueDeM2?=
 =?iso-8859-1?Q?bluxO62vRI0ncK1EX+6DFfUcSkqfs+lgxo7Nmzo2wPtER/BFMu5K+WsiQE?=
 =?iso-8859-1?Q?vloAVek+eBCWqiiKxIpB4tLPS+nPjrmiQYhfZZs208Oj4DDLQx81RMPQ8T?=
 =?iso-8859-1?Q?i5HfqrQA6UYH+CH0G5x/DVJAFWpRTY550gzx21SeebZHuVqNlHPHFRXNXX?=
 =?iso-8859-1?Q?Ku3VWxbHRk99OTKDimroadX8WvNCaQK/+MhJ/0q56o51+paVwjC8Jva0D/?=
 =?iso-8859-1?Q?Xca8QM4AH2/tKcSSWi1d51qJgbRpZxLBGLnKiQTmFYvoIBABqHe7M2SIOs?=
 =?iso-8859-1?Q?8Yfj484WrIGqb9om7uey5bzM+G3lJOrq5Y0ADOI8fMobGJS+IU/9lGdB31?=
 =?iso-8859-1?Q?Sl9vXO9kVCNkT30UhCVm9C8htIdsazZbV8turvMUk1e/ZNIQSgo7LM+FOc?=
 =?iso-8859-1?Q?9B5d/tzzJozkbt6NfrZmBQDKmiJVUSW3NhXpWk0HjxW90hWUsPaVRVaehI?=
 =?iso-8859-1?Q?XhQpWsC/gQAwJ0n2NOreQ00WJDtz+23wmtwW3Tw133r3yGOhOMNvdzJJ0M?=
 =?iso-8859-1?Q?5GNIRWity/qZrV9G7uN8c28YQ9VQBgrgrdVM1B84MFANFnCPDZBqLcXEPm?=
 =?iso-8859-1?Q?IK3Mt09u1iU8dfHsrndpSOM/VwJzqbwBbBa4/qQJJQrU+OOXouWDeP3lVV?=
 =?iso-8859-1?Q?Y96FCscliHPwvAgvZnwn2PKkFFSDQRPhLY6E4m6krgkroQr9haMjfD+s2V?=
 =?iso-8859-1?Q?E1E/WVQMldLsuU6u4tybqc0dp9EPgFreDYcE0oCo8LUFf0ujquyCod/yB+?=
 =?iso-8859-1?Q?v0WXCXEe6OMirrycuCdTmMOMWLcDdoD84Ryhi67wp7Gk9jd6fl97O3njTA?=
 =?iso-8859-1?Q?q88C6Nf24P+e0HVfIrrUq0KCcxAK1l2keXvwo0YKk46BJNtAkCMxkIqPt8?=
 =?iso-8859-1?Q?DzW8iNFCUph/lZqghWqe7kFsAdYaOdAFlu71yDZ5DQlg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?p5ohwtwOYjlZG8RmSik0daJIbt1TqbjXuKq4Vwkvjm/BcNPtU26QgTmTQD?=
 =?iso-8859-1?Q?kJ/d0JG/mZX3N4sQ6VbhH/J4CViDW0JGehgzS9Yh5aZBVpUbxVMo3BRYJK?=
 =?iso-8859-1?Q?O0QQ/kry4b/Mv1SpYItfCRLQVn+K8GC7Py4uLxMFgZM57o+DTRkLEINTms?=
 =?iso-8859-1?Q?W68WlM7COaxeagSNC9jkg+Giynu1QxGZI5JJQPbky5N+/MJeRs59FZsvMu?=
 =?iso-8859-1?Q?gvaccTKsVHjoKb+2LktBYFaMblpV0HCopEP9YX2Gj/BJxP1dU3gmoJ57SS?=
 =?iso-8859-1?Q?Phq8mXjfMssAcnKpPVkcm+bmI7laTjlARqkKDTOYDCvrP78zWb4lZEuvCs?=
 =?iso-8859-1?Q?7C+gscMbW9oKHZJu1YNDGOPsBfr1WmhcYduv5ql0EaECuvVrV7LWY3QdQ3?=
 =?iso-8859-1?Q?h0P/5/a5737ODFBkvYdXm1aWdtYi87OX0pBCiyS/QhpC5GCISmzYG4GTsa?=
 =?iso-8859-1?Q?cyObnOCt2BaSSVgXGkUfg7B+Je4x8m/egJnK4AGtfeyi+1uK3WhurVDirP?=
 =?iso-8859-1?Q?gJ2qYwsQ5gP4+kWy8NUq5B8tyj/8oImOGiTm20pjZCq2y8/C01CbHrtqGy?=
 =?iso-8859-1?Q?0gfc450xbpXG6fPlHNVpS5NBRG3zkfYdwMV524I0+39tNl/pw1rXAAy0Bg?=
 =?iso-8859-1?Q?43lX0aiMsWREQYtfo4r7w2BvawUgzL+EVBTrRW0Y840MRIvu5nZq/H3xJM?=
 =?iso-8859-1?Q?SzeHp77/hVG4sUYtF2zGY6qkDuEaM2fNns6EMZQ9uLDf1NlC+kPlW+7Ked?=
 =?iso-8859-1?Q?+4tCcmOJxGbo1kdk0DTxUfjgs0GT+kuSedLCa9aqkizLAy2Bx/CT3unAaF?=
 =?iso-8859-1?Q?GonJ+tnmyT20iv7IE9diz7gABJpO0aUdweYoJ6szCbQu+uhkPG03psDoIU?=
 =?iso-8859-1?Q?2wKc6RSjO49TaqKhqo1M2TIh4tNYojz9J099BKSpwXWd63eKJ2L20W8v9p?=
 =?iso-8859-1?Q?pYRwDmK3Wsqmhy/rfci5LndUkLNXR15zENg2OhS52qYnJb9nqjMhc8wCo+?=
 =?iso-8859-1?Q?ucbY2DUtnG4w94KrmH6qE/HisPX+YtNaKlegOadREJKmW2bkHhVtPnFOdB?=
 =?iso-8859-1?Q?tkNfPQVVhUqE1cWuk9bgbsQh2eFwj7fsKsThsXlccljmzT749F83HrH9NC?=
 =?iso-8859-1?Q?B8jsebjqdGi/LgKrrGRcNyPdxVQYXX8052bAAT90EEADLmLXrbLuCf295M?=
 =?iso-8859-1?Q?3ONuqChm+Y1Dh1Jxf/gmEp1/Et4q8+mjwSxcANgzMr84r88rtjFi9XVBG+?=
 =?iso-8859-1?Q?TTEDCsrPYJjMw9+BsGA4Ejixv0OzW5aZJnDxtzsVcCJDIk6aQcgAEyvzfQ?=
 =?iso-8859-1?Q?KCeO8vl6hUVJkUee0HDswM0q2eyVVt/yaK43LojOPBkc0YRwfAnnZIuzC0?=
 =?iso-8859-1?Q?zW9YVeyyFI0gS8B+dBfcd7kRqhZL1bBjNiLzY2Ycn2erroQKulSxoATDQE?=
 =?iso-8859-1?Q?D/Roiqaa5OtbVh54NnAHAYZQY6K0AUdqlSKVGgDQv5gNvaZq7e/EPIRxT+?=
 =?iso-8859-1?Q?eqldg9lAuJ89BYJEg/CgjlSPJNNE5HghTzSjmenbyUttHJxpuO8cp3+2hj?=
 =?iso-8859-1?Q?YuoE8+Xlx8xFOmfCEbQT1wLpx58dCdfmM4yYroKeuYlTHVSKHeTxrePcZf?=
 =?iso-8859-1?Q?5C4g9AGHrPyFOZJKVIoFECGe3D1v58PkeW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bab1a47-ce37-46f1-3608-08ddbd322c20
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 08:42:14.2516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZhDcwvD+NyR1gxkjj+zmOWjAn/eDQe86xG9daZU8SAZqzyBd+vkg2KpBzrvmtzMLiPb8y1ZIXIv67OF7ifssyVEBtj1uUpZCg9UWvrKZYvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9512

Hello Andrew,

Short update on a few points.

> -----Original Message-----
> From: Michael Dege
> Sent: Monday, July 7, 2025 10:14 AM
> To: 'Andrew Lunn' <andrew@lunn.ch>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Niklas S=F6derl=
und
> <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Andrew L=
unn <andrew+netdev@lunn.ch>;
> David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>=
; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; netdev@vger.kernel.or=
g; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; Nikita Yushchenko <nik=
ita.yoush@cogentembedded.com>
> Subject: RE: [PATCH 2/3] net: renesas: rswitch: add offloading for L2 swi=
tching
>
> Hello Andrew,
>
> Thank you very much for your comments. I am currently figuring out how to=
 take them into account.
>
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Friday, July 4, 2025 10:44 AM
> > To: Michael Dege <michael.dege@renesas.com>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Niklas
> > S=F6derlund <niklas.soderlund@ragnatech.se>; Paul Barker
> > <paul@pbarker.dev>; Andrew Lunn <andrew+netdev@lunn.ch>; David S.
> > Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>;
> > Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>;
> > netdev@vger.kernel.org; linux-renesas- soc@vger.kernel.org;
> > linux-kernel@vger.kernel.org; Nikita Yushchenko
> > <nikita.yoush@cogentembedded.com>
> > Subject: Re: [PATCH 2/3] net: renesas: rswitch: add offloading for L2
> > switching
> >
> > >  #include <linux/platform_device.h>
> > > +#include <linux/phy.h>
> > > +
> >
> > It seems odd that a patch adding L2 support needs to touch PHYs?
>
> I will figure out where it was needed. Maybe I can get rid of it, or if n=
eeded I will move it to the
> File that needs it.

This include is needed because struct rswitch_etha has a member of type phy=
_interface. And rswitch_etha
is a member of struct rswitch_device. And rswitch_device is used also in rs=
wich_l2.c.

>
> >
> > > @@ -994,10 +1018,18 @@ struct rswitch_device {
> > >   DECLARE_BITMAP(ts_skb_used, TS_TAGS_PER_PORT);
> > >   bool disabled;
> > >
> > > + struct list_head list;
> > > +
> > >   int port;
> > >   struct rswitch_etha *etha;
> > >   struct device_node *np_port;
> > >   struct phy *serdes;
> > > +
> > > + struct net_device *brdev;       /* master bridge device */
> >
> > How many ports does this device have? If it is just two, this might
> > work. But for a multi-port device, you need to keep this in the port st=
ructure.
> >
> > > +bool is_rdev(const struct net_device *ndev); void
> > > +rswitch_modify(void __iomem *addr, enum rswitch_reg reg, u32 clear,
> > > +u32 set);
> >
> > Are these actually needed? It seems like they could be local functions.
>
> Currently is_rdev() is only used in rswitch_l2.c. I moved it to that file=
 and made it static. In the
> future it will also be used in the L3 routing. The function rswitch_modif=
y() is used in rswitch_main.c
> and rswitch_l2.c I believe in this case it does make sense to have a sing=
le implementation. Or should
> I use two local copies?

The function is_rdev() is an accessor to rswitch_netdev_ops which is local
to rswitch_main.c. I believe it is better to provide this function globally
to the driver instead of the whole rswitch_netdev_ops structure.

Best regards,

Michael

>
> >
> > > + if (offload_brdev && !priv->offload_brdev)
> > > +         dev_info(&priv->pdev->dev, "starting l2 offload for %s\n",
> > > +                  netdev_name(offload_brdev));
> > > + else if (!offload_brdev && priv->offload_brdev)
> > > +         dev_info(&priv->pdev->dev, "stopping l2 offload for %s\n",
> > > +                  netdev_name(priv->offload_brdev));
> >
> > Please don't spam the log like this dev_dbg() maybe.
>
> I'll change that.
>
> >
> > > @@ -128,6 +134,14 @@ static void rswitch_fwd_init(struct rswitch_priv=
ate *priv)
> > >           iowrite32(0, priv->addr + FWPBFC(i));
> > >   }
> > >
> > > + /* Configure MAC table aging */
> > > + rswitch_modify(priv->addr, FWMACAGUSPC, FWMACAGUSPC_MACAGUSP,
> > > +                FIELD_PREP(FWMACAGUSPC_MACAGUSP, 0x140));
> > > +
> > > + reg_val =3D FIELD_PREP(FWMACAGC_MACAGT, RSW_AGEING_TIME);
> > > + reg_val |=3D FWMACAGC_MACAGE | FWMACAGC_MACAGSL;
> > > + iowrite32(reg_val, priv->addr + FWMACAGC);
> > > +
> >
> > Please pull ageing out into a patch of its own.
>
> OK, will do that.
>
> Best regards,
>
> Michael
> >
> >     Andrew
> >
> > ---
> > pw-bot: cr
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

