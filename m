Return-Path: <linux-renesas-soc+bounces-7298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 475FD92FBAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A1C71C21782
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 13:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E263216B390;
	Fri, 12 Jul 2024 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bBhJzwoI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070B71442F7;
	Fri, 12 Jul 2024 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720791925; cv=fail; b=O4xMcDZIjfEFxGQ/W7FxoFcXyVfl5egtrrrpaHCeXl7GymeV8/5XDRtM6l3i4tumco/sDxXGygs7WWKDIP06rjGrUWo403DP6LDa5CqooO5S9jkNsvxReiAgFWF7ruF7MmNX+wnMTr9GkdOBmDl0ojYj4VCv7Pp44tjoLpWEfwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720791925; c=relaxed/simple;
	bh=CkK/PtKuGhHvnB1RRTrydBLVknR/vezV6k2I5O3fcGQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dXWnMM0040zqMxlu68ofsIXdd2vU5JDJHT4SsKp8wbLxXcHkRru/Q4tvl6/8N4Acd35c52h5XJUG79XvZwORm03u74sp+0HUY1gS20ynV1eLSxX1AlUQvF2Y5chjJVXChG3jZOTUM5XFplxir+zx1qMsGtvwh8KNcauAxMwTzoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bBhJzwoI; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZV7r4soHsPUdFvqeqChZ3nLv7MUZJ3PsGpngruvtwG22ryvsoV/v9dFLg3fT3AhSbTwdjfN1eaDJptCjKVkW9CmAMUMY7aFKbikvljJMg7J222r/rKgBDt9nd4yCFIOs9B0dVJ7ugNAeJDhvHzDU20tgGr+Y36EFd48GTnQPYP/9jWOhMYvBoJ7TzccOnskwVzLX8s7PnzovPXod8PsUlS8U8Ebor3FfnU4nkDYCkU4sBPPTE2/3f+38qs8r0gA14W9yrKKMIntnmcsbxyqLody5iugZ8gCNcE846DFpTOYGi0GI19L6Gt0tUiblpMi+ALxOh5y4kOQCBC8agnFmwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkK/PtKuGhHvnB1RRTrydBLVknR/vezV6k2I5O3fcGQ=;
 b=X8k2Rjy0WutgBoraYZhVemmWrvzQMJRMsn44GMCmZxl1Gq3c0Fd5wNfs/OzFBiK6t6THo4CpSwN1jiX/hhkEmWql0hpPgNx5/V+NEe9v4js3MjMPSYgilRXbSM0+9f+O3bcw2YSVpaPTvx9v687M2H3tIziZBrrreib3bmNZB5ymtfc0o/tFxZVrAj/KSzGietrsRUOSCIbz1r50613rgQ1YBenaqxSzMclKAT0v2hRhLpviGCga6gArvogK0eB1++LHLq1Mz8cyl/AWShsi0876nMxw9HPvSFAZ77fiG8mYxi3Ew8TVGw3kn++MKinA1jNAqsgO0ZCmz/d8i6UVPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkK/PtKuGhHvnB1RRTrydBLVknR/vezV6k2I5O3fcGQ=;
 b=bBhJzwoICaQ1z41b9ckKU67AXyOe7ZNGdTpOLSlJf8hE+RLFKJurc99ODlnk/avpbActB/FNgOjK2mpxk2W4N7nGI6hb4tAQWEMgPkM9djLPLd2FpoRhduVXxmtNhki50lEcdklhJfdXuWQeCreOheUrwd0ZAVYmYaBDJvBzPug=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSYPR01MB5526.jpnprd01.prod.outlook.com (2603:1096:604:90::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 13:45:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 13:45:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 4/6] regulator: Add Renesas RZ/G2L USB VBUS regulator
 driver
Thread-Topic: [PATCH v4 4/6] regulator: Add Renesas RZ/G2L USB VBUS regulator
 driver
Thread-Index: AQHav9uQUUPekDrm4EOwlYUI+Y4oS7HxwLcAgAACXWCAAAczgIABeS0Q
Date: Fri, 12 Jul 2024 13:45:18 +0000
Message-ID:
 <TY3PR01MB113468B35641D40ED8406FD6C86A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
 <20240616105402.45211-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdX5ayWbLEEa6nAipECVB6H9eCpRg21pu3zYrTdiER0F+Q@mail.gmail.com>
 <TY3PR01MB1134692D0F5D291398FCE5F1086A52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVc40j9qvmyFpVpKcd_uSrjFj6s5-RmgXZgp2w8HYCGfg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVc40j9qvmyFpVpKcd_uSrjFj6s5-RmgXZgp2w8HYCGfg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSYPR01MB5526:EE_
x-ms-office365-filtering-correlation-id: d6c5953c-529a-4290-7e09-08dca278dde1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cjY2dkl4MG5yTWx1aERDMWlEd3M4Wm9hZTNUR3BwYVRzcWI4cnlXOWNrTTN4?=
 =?utf-8?B?cGFuL09qOUtSUDU3NDY0TXRPaDNROFBEayt0TnZmSnlEVDlxNnVOaUhOTDMw?=
 =?utf-8?B?eGJEcmQyNmxjUTFDVWRLRzZVSlpocmN1UCtRTzNJdmJtVFEwSGZuSmx4VkJ1?=
 =?utf-8?B?akQ1SmxuL0tJVTJENjdtVUdEUkowZDJoank3NGJ1MDVKeGdGalNReElxMi9B?=
 =?utf-8?B?RS95NVBwcktUNjlJeElrbTVnckNhVFd4TTVQMk9iRkNuUnUxd3BVdHdsK0Iy?=
 =?utf-8?B?a2IyVFg1TGxzWjNiOHhTZEVrNVArSjVuekJFZXMyR0E2andrVzhBQzZqQVM1?=
 =?utf-8?B?eTZnOUlyQkMzMGdtUS9scUVmOGJqZS8zZ2grR1FkVmN0ZmRZNGZ0WStZY3BG?=
 =?utf-8?B?R05lV0tLQWNlNHh1M3grZ0tGSVppOGtucHQ3MG5vVGZSSWllbWVybThnZktC?=
 =?utf-8?B?K0owTWtnTmk1eFFEU0lJK1p2REdneVVXSDVnUzNLQ1poOXk5OFV6MDFOaURN?=
 =?utf-8?B?TXlXRkgyOG9HSzFHakIwcWJ5UWFZVi8zL1NkL3IrSklwUlR0dHRtWElSRHNi?=
 =?utf-8?B?ZlBtY056K2c1WXQyVzRjU2puak1tNnRTd28ySlYvZk01ellyOHQ5Z0lrbXA4?=
 =?utf-8?B?d2RlUlR4MktFaitvVUI4b0l2UlY2ZlVaQzJ2blhNY1BCbWZ3Smd1RG5uSUtw?=
 =?utf-8?B?T0pJNG52dFhNYjF3dkRPMnV1WjA4OHU4SC9Fd0lIY3NLSlZVa0lBMHZ1ZDd4?=
 =?utf-8?B?UEhBMWtIcEE2aUFobUFwY1AzODJSUmRvMmlrU09GKzUvaVhMSEQvQS9qcFhD?=
 =?utf-8?B?Rmx1N0NEN001ck8zcnRjRXZlZU9MemVGSkQ2VkQvUVNURnBpaEludlFOMUJs?=
 =?utf-8?B?SGRsUFdzbzl5TmxsaFRUNXBKV1dLSkZ0dm42QWZZR1Rpa0txaGkwOGJrMFAw?=
 =?utf-8?B?dStkZE5sZ0xmY0pTTTdpa3ZPeTZneXFVemFUaU5aWXZJakN4ckZEam9iQzc3?=
 =?utf-8?B?MVFmVTF4TDRqSTBvS2p3dSt1M3RsanBHTURJUGVnZVJqYnRoTW5XZFJGOVN6?=
 =?utf-8?B?cEVZSWd3TGh6QUdRbTlLZnlvUUFOb0xPNENpNCtNOHJEajgrYU9KR1NtcktZ?=
 =?utf-8?B?aDVlNUZHSktUM3N0Wmp4SnEyaVhBWHB2cDJ4QS9yM2lQUW1Ya3JNKzVGWXFN?=
 =?utf-8?B?OHRxQVgvaUlRZTR3T1dWWGpyQjhIR2lPejBNRm9SODdLRmhqZzdvbnc1MDZQ?=
 =?utf-8?B?MUNTZjJPaDcybUJKekxlaXRnY0czeENaeFEwSnEvb0tmZXVBNEQyNFUwbXEw?=
 =?utf-8?B?YmZQMGw3eExkVlF1c25NejBSYU5Ody9pRTB3emRDMnNjUVNmTVVZK0E0SEo3?=
 =?utf-8?B?dlFVYzRnQjBKbFJSR085N0lYOWxNVWFEMkp2cUtmSm8xL0pLWmdCMFJQa2hQ?=
 =?utf-8?B?ck5UVGlnc0tqank1VWtxL3o4bWFUWlMrRC9KcTc5WE9CU1RYMjQxUWcrOGVx?=
 =?utf-8?B?QnE4OTVWUi9UQ0UzQVd3NlE1V2k1aFRLbmFVQVhXTHVJWVlMMFlUNmpTVTZ0?=
 =?utf-8?B?VVp2VkNmZ2o4bzFzcHhUMThGY1FRZktYeDJpT3JQQURVaXVWcmFkQnpqTFY3?=
 =?utf-8?B?dStIbloySWxmdTBjS0UzVlRtc2IvT2kySWg0Y2NVYTRsSDQ5QTlwellDRTBV?=
 =?utf-8?B?NVVZUXBHRXhMcFRFL3Z4YVptVEUydVhLZ3AydWhDM0NkMko1VzJnVEZBUUV0?=
 =?utf-8?B?UzNOVUliWkd4Ry9hNktIL0NCWkp3VTFiQ3ZHTE90UXVQTm5sWDJqV0ZaMHZ2?=
 =?utf-8?B?dDU4OVlTNnRjUk5IZU1rSXdINlJROHVVbUN1Tk0xS3FWOGZTVXFVaGRjRTNJ?=
 =?utf-8?B?U0taS0YyRHFyY0dQS25oYjRiZmRiVUZOVXB2cDlReG1obFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qy9JYVZ2cGlKMzUySW5BZDFiYS9JSzIvM3kvUnFuU1lpUnBNVnd2dHVDa3Zw?=
 =?utf-8?B?VkphaUNoamRlT2VvSFBjZDc2M1prVFRTWWRQTU9EMjc2V25tN1VMQnFnYUxW?=
 =?utf-8?B?UDE5a3QxUnZiUkR1U2VheUVHSHpoVW9LSjJlSFhEUWJLRTM1ejFURUlKUDFw?=
 =?utf-8?B?cG9uQjhMSlk3NGp2MWNzTXo3ZHBTZmJTcitoZ2RlRVhyQmtDWEZWRUk0WFFa?=
 =?utf-8?B?UitOT2hBVG9lVzd1TVlpV0x6V2NZZUpFQ0thNFJWZ3VIMnFTdy9HVVV4aTlu?=
 =?utf-8?B?c3NySUN0SFd6bXIxc2RTNUh4VkNEWkhtVVIrWElXaTNjR3NZSkd5RG1ZcUpj?=
 =?utf-8?B?cE5BNjM2SXlTaE9DcGVrZHlLRXgvUFY1TnpxWGZpN0svTFpzcWg0Q01qcHdr?=
 =?utf-8?B?eXRiREFTVGVUZUg0ZFBPTEpYQWUremtub21WNjV3TjlPaGwxVjdRcTd6dkNF?=
 =?utf-8?B?UEZzRmQvUDRCUDVwTUFRZDZPaDZ6NlhFOVNzb2ZsTnNMWEVDaEhhMk9ldUJJ?=
 =?utf-8?B?OE5ZOVVlcWpScEpGWVhxZlUxUVFxSHA2d0g1dXJCUVpyL2ZINzFoQUhnUGZ5?=
 =?utf-8?B?clNJLzcxLzZoK2p3b21EdHI4Y1N4WVdlTXJlR2tCU2hJMnVqdlN3OGtDQU81?=
 =?utf-8?B?QVdUdzFsaU9JMWJNcEJaT3l5NE10L1pKUjhIem11L0p0M2t0cnd3Y0JORCth?=
 =?utf-8?B?bnF6aGZ3Q0Z5c1dTUzM3RUJUSmZWMnQvcHk5ckxPY0wyS1R6VUhLWlMxSXly?=
 =?utf-8?B?NlVNM1RaZzQ0Q1BpZDlydSs4REdiSDdhVmlnd1dnVmh5c0tQUlhwSGdaZEM1?=
 =?utf-8?B?VHVmbEl4OWN6YlZKcXFMZDhQWThvNE96Qjk3dkgzWnpMVW8wTFVJMDlsaW82?=
 =?utf-8?B?L0NJMWZGWVhhSXh6VVNjZU5FWGsrcFFNL3lhKy9ML2pabkV0TTA2VUQrRkR4?=
 =?utf-8?B?RFlvQUtBVngvTTN0ZzJOQ2lrL3Z3ZjlKTFJsdXNPQWp4YVVWVkNxQURWclZp?=
 =?utf-8?B?VC9laG5yaUtkbWxZVFM0L0Fzamo1NlQyTEYrQ3RHWXROY2p6NEVtNUdBMXg0?=
 =?utf-8?B?RDZBcGtsSkRuZ3FkdWk1Y1JhazhHYnFvRVd3YVZIdU1FS0FqRWJCc1JHanZN?=
 =?utf-8?B?QlVDYjJ2SUR0aWRkSHZJUi9QNjExaFJMaUM0SUd1QWZhMFlxemEwZFQ4Rk1z?=
 =?utf-8?B?dmVyRGlmbjZiYVNhWS9ReGV0eG1tZ2V1Zkd1Qzl1ck1rN2J0SlkzVTIyS0pt?=
 =?utf-8?B?a1FCdFBFL3gvQVZtTS9Tck5zK0JzL0pZeCtkZmoxeFd2QkExVXhURGVWdUxj?=
 =?utf-8?B?TzIyZ3JwTURoR2FJUHBaUFJWUnZyV1k5RXJBMWJmTmZYdW42UjA5WjFJcFFy?=
 =?utf-8?B?UjNRU1k3eTJwR0k2Si8wTnUxZTlNdFF4dy9Ca1ZRUDdtUDJFZEZ6ZWVEanh2?=
 =?utf-8?B?NlFaL1ljc1VaVitYMElySDdGZ2oyNTFpbG1jVGFOdG44bno4U1FnMDlWZm1I?=
 =?utf-8?B?eDB2d3cvRTZjK0JtODhJc0RCaG9aY2djT3hxeS9kdFZqVmQwaDVNWWluOHUx?=
 =?utf-8?B?dGdTbktSbWNTWENSR01UdGRnSzlNNEU1dGtZTjFNSlRuSG92TjZUWGVPbkV0?=
 =?utf-8?B?ZkRzZDZTMENCWG5ZdXRoVm91TGJqbUxwVGRTcEEyRDAwNFpnZkFxb09uY0c4?=
 =?utf-8?B?Ri9nWG02Q0NuOXZIVUw5cU1zcnZwVEthWmpZbjBCem94MlJoRU45RnA4UzNy?=
 =?utf-8?B?TDVHOTcyc3VNTjZlZ1RiaTdKR09MMitkSlp6aWJ1NG5Nek1FVmpUWUJTZ1dR?=
 =?utf-8?B?UkF5WjJlaDFGM0NEY05EdnNBTXloSVdwZ3FsMGU5N2tEZFBPUFQwVllHb2RQ?=
 =?utf-8?B?ZnphcWVIbTBXczRuY1pCSzJSTkhnV2pkMnRDSWJmVlBYYk9HN0I2ZzZMYzE1?=
 =?utf-8?B?N2NRWVNKOXlCV3FMOTFQcW5PSmhuT3NzZEh2VFE5Qm5hYTNBZGlSSnU4ejdu?=
 =?utf-8?B?dHJZYWx1RjNxUzArZEZuYVBCUkxabDhQMkdFZlZTc3NUQ0dqR29QanlmS3Uw?=
 =?utf-8?B?SmxqNGh1OEZ5ZkNxY1VCTmtpeGFaemFmQ1ZzV3pOY1VwZkNnSys2UFJ2Smlx?=
 =?utf-8?B?NW1PVE94MmwzYVo5T0YxTTU1eGd3ZUVPb2pkZGxROEh6Ui9uL0EwZ3BXbitW?=
 =?utf-8?B?TWc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c5953c-529a-4290-7e09-08dca278dde1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 13:45:18.1526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8l4EmrSoLIecIigdL0brOFpdrPfR5lvQId/duQ7xeA/6mRF31Ixg4xxa6SX5yHNqBOSGVEyPoz5VvYZSGsi2jt5uUA/DlA0J1J2oZcaKcrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5526

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEp1
bHkgMTEsIDIwMjQgNDoxNCBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDQvNl0gcmVndWxh
dG9yOiBBZGQgUmVuZXNhcyBSWi9HMkwgVVNCIFZCVVMgcmVndWxhdG9yIGRyaXZlcg0KPiANCj4g
SGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgSnVsIDExLCAyMDI0IGF0IDQ6NTjigK9QTSBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+DQo+ID4gPiBTZW50OiBUaHVyc2RheSwgSnVseSAxMSwgMjAyNCAzOjQwIFBN
DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDQvNl0gcmVndWxhdG9yOiBBZGQgUmVuZXNh
cyBSWi9HMkwgVVNCIFZCVVMNCj4gPiA+IHJlZ3VsYXRvciBkcml2ZXINCj4gPiA+DQo+ID4gPiBI
aSBCaWp1LA0KPiA+ID4NCj4gPiA+IE9uIFN1biwgSnVuIDE2LCAyMDI0IGF0IDEyOjU04oCvUE0g
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gQXMg
cGVyIHRoZSBSWi9HMkwgSFcgbWFudWFsLCBWQlVTRU4gY2FuIGJlIGNvbnRyb2xsZWQgYnkgdGhl
IFZCT1VUDQo+ID4gPiA+IGJpdCBvZiB0aGUgVkJVUyBDb250cm9sIFJlZ2lzdGVyLiBUaGlzIHJl
Z2lzdGVyIGlzIG1hcHBlZCBpbiB0aGUNCj4gPiA+ID4gcmVzZXQgZnJhbWV3b3JrLiBUaGUgcmVz
ZXQgZHJpdmVyIGV4cG9zZSB0aGlzIHJlZ2lzdGVyIGFzIHJlZ21hcA0KPiA+ID4gPiBhbmQgaW5z
dGFudGlhdGVzIHRoaXMgZHJpdmVyLiBUaGUgY29uc3VtZXIgd2lsbCB1c2UgdGhlIHJlZ3VsYXRv
cg0KPiA+ID4gPiBBUEkgdG8gY29udHJvbCB0aGUgVkJPVVQgYml0IGFzIHRoZSBjb250cm9sIG5l
ZWQgdG8gYmUgZG9uZSBpbiB0aGUgYXRvbWljIGNvbnRleHQuDQo+ID4gPiA+DQo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+
DQo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgODRmYmQ2
MTk4NzY2MzM2Zg0KPiA+ID4gKCJyZWd1bGF0b3I6IEFkZCBSZW5lc2FzIFJaL0cyTCBVU0IgVkJV
UyByZWd1bGF0b3IgZHJpdmVyIikgaW4gcmVndWxhdG9yL2Zvci1uZXh0Lg0KPiANCj4gPiA+ID4g
LS0tIGEvZHJpdmVycy9yZWd1bGF0b3IvS2NvbmZpZw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL3Jl
Z3VsYXRvci9LY29uZmlnDQo+ID4gPiA+IEBAIC0xNjM0LDYgKzE2MzQsMTUgQEAgY29uZmlnIFJF
R1VMQVRPUl9VTklQSElFUg0KPiA+ID4gPiAgICAgICAgIGhlbHANCj4gPiA+ID4gICAgICAgICAg
IFN1cHBvcnQgZm9yIHJlZ3VsYXRvcnMgaW1wbGVtZW50ZWQgb24gU29jaW9uZXh0IFVuaVBoaWVy
IFNvQ3MuDQo+ID4gPiA+DQo+ID4gPiA+ICtjb25maWcgUkVHVUxBVE9SX1JaRzJMX1ZCQ1RSTA0K
PiA+ID4gPiArICAgICAgIHRyaXN0YXRlICJSZW5lc2FzIFJaL0cyTCBVU0IgVkJVUyByZWd1bGF0
b3IgZHJpdmVyIg0KPiA+ID4gPiArICAgICAgIGRlcGVuZHMgb24gQVJDSF9SWkcyTCB8fCBDT01Q
SUxFX1RFU1QNCj4gPiA+ID4gKyAgICAgICBkZXBlbmRzIG9uIE9GDQo+ID4gPiA+ICsgICAgICAg
c2VsZWN0IFJFR01BUF9NTUlPDQo+ID4gPiA+ICsgICAgICAgZGVmYXVsdCBBUkNIX1JaRzJMDQo+
ID4gPg0KPiA+ID4gQXMgdGhlICJyemcybC11c2ItdmJ1cy1yZWd1bGF0b3IiIHBsYXRmb3JtIGRl
dmljZSBpcyBvbmx5IGNyZWF0ZWQgYnkNCj4gPiA+IGRyaXZlcnMvcmVzZXQvcmVzZXQtcnpnMmwt
IHVzYnBoeS1jdHJsLmMsIHBlcmhhcHMgdGhpcyBzaG91bGQgYmUgbWFkZSBzdHJpY3RlciBieSB1
c2luZyAiZGVmYXVsdA0KPiBSRVNFVF9SWkcyTF9VU0JQSFlfQ1RSTCI/DQo+ID4NCj4gPiBPSy4N
Cj4gPiA+DQo+ID4gPiBBbHRlcm5hdGl2ZWx5LCBSRVNFVF9SWkcyTF9VU0JQSFlfQ1RSTCBjb3Vs
ZCBzZWxlY3QNCj4gPiA+IFJFU0VUX1JaRzJMX1VTQlBIWV9DVFJMIGlmIFJFR1VMQVRPUi4gIENh
biBSRVNFVF9SWkcyTF9VU0JQSFlfQ1RSTA0KPiA+ID4gd29yayB3aXRob3V0IFJFR1VMQVRPUl9S
WkcyTF9WQkNUUkw/ICBJZiBub3QsIFJFU0VUX1JaRzJMX1VTQlBIWV9DVFJMIHNob3VsZCBkZXBl
bmQgb24gUkVHVUxBVE9SLA0KPiB0b28uDQo+ID4NCj4gPiBZZXMsIGZyb20gZnVuY3Rpb25hbGl0
eSBwb2ludCBpdCB3b3JrcyBmb3IgYm90aCBob3N0IGFuZCBkZXZpY2UgbW9kZSB3aXRob3V0DQo+
IFJFR1VMQVRPUl9SWkcyTF9WQkNUUkwuDQo+ID4gRnJvbSBzcGVjaWZpY2F0aW9uIHBvaW50LCBz
b21lIGN1c3RvbWVycyByZXBvcnRlZCBvbiBkZXZpY2UgbW9kZSwgVkJVUyBpcyBzaG93aW5nIDVW
Lg0KPiA+IFNvLCBieSBhZGRpbmcgdmJ1cyByZWd1bGF0b3IsIEkgYW0gY29udHJvbGxpbmcgdGhp
cyB2b2x0YWdlIGFuZA0KPiA+IGZvcmNpbmcgdG8gMCBmb3IgZGV2aWNlIG1vZGUgYW5kIDVWIGZv
ciBob3N0IG1vZGUuDQo+ID4NCj4gPiBQbGVhc2Ugc2hhcmUgeW91ciBpbnB1dCBob3cgdG8gcHJv
Y2VlZC4NCj4gDQo+IEFzIGl0IHdvcmtzIHdpdGhvdXQsIEkgdGhpbmsgY2hhbmdpbmcgdGhlIGRl
ZmF1bHQgb2YgUkVHVUxBVE9SX1JaRzJMX1ZCQ1RSTCBmcm9tIEFSQ0hfUlpHMkwgdG8NCj4gUkVT
RVRfUlpHMkxfVVNCUEhZX0NUUkwgaXMgdGhlIG1vc3QgYXBwcm9wcmlhdGUgb3B0aW9uLg0KDQpP
Sy4NCg0KVGhhbmtzLA0KQmlqdQ0K

