Return-Path: <linux-renesas-soc+bounces-27139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKfICQHEb2lsMQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:05:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ADD49168
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7E6C158D69F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C9A429821;
	Tue, 20 Jan 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fCHy1Not"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08AF3396E0;
	Tue, 20 Jan 2026 17:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930967; cv=fail; b=N5UXf6t0aZFNWjE79Nwmf9N/EkJLa0MyOTEN2hXcu/LJEx2dzg9QgRmSQVNzLWskP3GXCvWgr6doW+YcJ09rNu5Z27GZh+7kFhX+DFk+QgMOgCs9djuoMbydQ/YgHgDUWRB+SDVuddn83f5EfxwbA6ZPDvb8pTaEPEJ+msAcDCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930967; c=relaxed/simple;
	bh=oaaY6EYfu/yXEQZEsT3k89oinOc4Lvn+Emv5XbLlHbE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OkiVOmTwSQY+Qty1/WkVQWlgLMTcddAUgeK5X5xw2gXPGM6CFjj5lnT6QcL0/iTnx0yPxNOzHbvaFgD6TidEofVLAinE17DUa7KdxgSM9oCgC2UOqdSbPD80GTgg/jZiL+0EMZrV30gIeD1nN74QdSyk+afJPtFA6ttNyUxTK0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fCHy1Not; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yerPBE0uwosesz24CSjmJPA4dOou3DE5hndowlDvdP+p3/ao/vG0vd2Vx/YaDeh3x6UFONpNNG4TSdyuLez5H7oDL69+6VNcB0p1dDiO3kWCDpijhrQhfGe5ScEIIPqg1FGNBWkPnmkMKDy46XdwckCWEvLudd7HBzC0LgNrtfhdEZlOskM2YgWqkCtdRGyPJ21ujmFV3DkXhDU5cwKqAl18p168TEGB8cbRU5kJlyPU1ec3ecftTLorGBPKCib+OeWjVlSJE9N5wQlWvKg1tr1ll7g7bQlXEWJcHizpGAIu7bS/Pt4KZC/pQ6mkDmz6Zj4GOAyQx6HZB7g944X9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O848MoPk0Ym5j/aY0USJuDO0dFcsYJfe2uiy3wthC7M=;
 b=v79YkZ8/mhs55bkowKczeHw7E9K6aMW5oq2o8k0qo1Vt21GAoeudVZxUYr693BqDzfIWufIkneb7BicSV6zVK7zOotrsARTDa214Wvpad52Mw7wi+IU3qqRrb9PNrna0f0D+5IBx+WgBWienCwp2cCB4axUamAd0wjanl6J3b1Jdob3yIERAEqLZMJAzirVWPhw27YKqxuTnnQUm1QQ2Vs/LvvAg95+zzyk011oloesAbjaz8c78x0posVs2rVtsfueBkpZrqFxFSrdWFa7Q7rP/9rpO5rXNTy5ETOfhePQ9M1yM9tKIcHOC6hG/vDcLw5bkF+HNpilHriipd81Q7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O848MoPk0Ym5j/aY0USJuDO0dFcsYJfe2uiy3wthC7M=;
 b=fCHy1NotQvSqrVaMu/SD9WGd188mf1fm/wPx2aiZ/QpOIO8ItAZkKIZozGFa7LheoiEAW4ire/G5qGD+GyIYpsG4zv7bLj9qISqfwyVYGf7kfkzaQlRdc4V+Kyq/tQZ9TaKtPhsRAoFt6nuGIIbZPmil/UX5PyW5lBHxXX29Yj4=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYVPR01MB11247.jpnprd01.prod.outlook.com (2603:1096:400:364::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:42:42 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:42:42 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 04/12] dt-bindings: soc: renesas: Document RZ/G3L SMARC
 SoM and Carrier-II EVK
Thread-Topic: [PATCH 04/12] dt-bindings: soc: renesas: Document RZ/G3L SMARC
 SoM and Carrier-II EVK
Thread-Index: AQHcihAMral9FwOeZUuBAp3YeuINdrVbVCvQ
Date: Tue, 20 Jan 2026 17:42:42 +0000
Message-ID:
 <TYCPR01MB120937C9615232CF674110715C289A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260120125232.349708-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYVPR01MB11247:EE_
x-ms-office365-filtering-correlation-id: fb8672cd-5a16-4300-b661-08de584b504a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Wuh8DyjH/tzNas3hwYvN7FgqsxrRL40etOmV4McUS7u/QAummv/CYV8miKK7?=
 =?us-ascii?Q?1yBvrEx2+UAWSUK6Mrpm2rL7WCSfJJZdSGxNuP8uZD4O5IWG+mBgCIf8fydx?=
 =?us-ascii?Q?kejjvhT/1y47Vku56DQTou3huxZ0FUBQyGBAALUGBde9uCgPZXzMww4SdrPs?=
 =?us-ascii?Q?c+zXKr2LUC6rzklFfyEVA5+bHQCSZXmAwf473A15XDDD2kgj81Az8Yod0j4f?=
 =?us-ascii?Q?n2yuWEo7Cg6dbqPGTXnMhrlFxBtIzi0JBz5fnJrYkzN0eUIOw3NCiM9E5x2/?=
 =?us-ascii?Q?HtjqVYV6zT60j6H85/kiR9CWabyPqfzVCorkxa9iWG5CWGzksLgoVsQwyVQT?=
 =?us-ascii?Q?X+auakPTV3Hzv2IBRvKtb3afnoo8LvaLdZiQCAMF+HN9psRcygoa48Ka8lym?=
 =?us-ascii?Q?pnoTLWusPrrZu8UVFVI8gyXundI3ZBhJzimt6pB3cnHgrAPeqwYtLk1kRDEf?=
 =?us-ascii?Q?/E0uuj19xoJnU4Z/vmP1YzlEl+C77IbP2GjyaGi/bY2bOasAGLicJutri6Fo?=
 =?us-ascii?Q?00RjWnkgT/V5zg1U/7YjvYwxoqq8BSG0E3dhPdoIdfxgBAYzjojcJaCrfAgx?=
 =?us-ascii?Q?f6OSojo6ekqdQ5v3ZX7P2/5XDLzq283zlscAKpzKoe9ZDWGbH1OoS4f7U58T?=
 =?us-ascii?Q?Y2ZZh2sCKJs12jHK8fhFudfrSOFER+497xHnOiL31iyif1roNjv9+cEGziXl?=
 =?us-ascii?Q?0nP7FQb4AnowmQ5oCnNGD9f2pYib+wt+gTP0HiS6dY3+DFmQhWM5QdOBFMon?=
 =?us-ascii?Q?g0KfQG4DWQDk/bBkHJKUDOO0P8yDAakMAVhD5h/bjojaB9ccOAagQWyt1gay?=
 =?us-ascii?Q?UCFWY2HQexm9FHDveAsPZKaPYELS+MY4vRLNJH7JkPGfuB98Wj4K0EeGX2sD?=
 =?us-ascii?Q?VnsUkd8vbQuiUSSSHQrNid6cld8pN71oR0VQe9nOGHQnIN0V1zMHsrpTeX/i?=
 =?us-ascii?Q?fg5zJD2TF5ai/vNBoT7l00U0XV+/nj7yCz7b1c2DmEN20WvJOGxJ1bpNn+OJ?=
 =?us-ascii?Q?3Mkb+71ypdpXI94DsST+DmKzQkWc1gy5HUcRhUL09qYY81/JeG1mCAQZHACP?=
 =?us-ascii?Q?RA33d5LJOL7B4qIvZqqX2Z6z6qRtQMXCUgGwZk6pcDVHxxb/4Gmm4tXLzMoI?=
 =?us-ascii?Q?BtSHJ7t5FM9jWPwvWk8gK4ARkHdFLj3BXhTbMcdmgyYM3Qb2RaDDJVQCVICd?=
 =?us-ascii?Q?YAsPR9o7sJTU3z0Mluf3Z3V9XXWRFBa//m0wndi3RctzMrlMY7LU40RuKMEQ?=
 =?us-ascii?Q?Rdq3C5c/Bm7s6AK8+1NnERh62oXDlRF4PWPL9hY0X5EeqPXdimqSfHiOMtdj?=
 =?us-ascii?Q?yW8cOkQ8276PIF/6/U3sPiOHfZXfSgOEMqnJrBlClxqNdC2NAmfBLkhpClgM?=
 =?us-ascii?Q?OwzDfTj1adyg/Wv30ZZdNK+7upSIkQF8OX5iKGAVNrZrrmgBjgH3AdZdTGvZ?=
 =?us-ascii?Q?WHuXpJyiIEEYffSJQPFR3Bhim3HMB1fcJ59fGLch7YfAbXR/BgTAkQXmh9Gb?=
 =?us-ascii?Q?Vy+AMZ49OfYNeqmD6Y1liG7alLLa9BOgDcrvJciB81QY1A/wHEY7P1HnFJrr?=
 =?us-ascii?Q?tMttm4FepahGyHa8RB/hHo2opElsV/Muz7WG+vxi+l1fr9oztOdr7UmtSLCU?=
 =?us-ascii?Q?bCIDuvsfvX4VtSFhGV7Aqa4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8klUdAHOlmBJEcWewVhBrKPTExteNfznvwDQFLtleTiHedGwzeaCzm4Rpa3q?=
 =?us-ascii?Q?TiBNgYulNFi5SsMN7N6KWhAU7WmBHgZcZjKg+Q5pVZcsN9WDve/a9fdYg3kb?=
 =?us-ascii?Q?lJ+e5ooDq6N3Fas+/F5RxJ69gf8zWoyHB8hke7vcDEPZmqL+ji/cm8i+BsNu?=
 =?us-ascii?Q?+6O6XZdS23Lw0HfSXAKZd5bPLggK8XYb3l8KBZqOVWM6Zmy3VATv+0qbiosq?=
 =?us-ascii?Q?4U3WQ6b8UY4UQO8Cg3kf4qRkxUH0SLMiQMsmYhyRiCxYrCSruJLs/v+0ZSVK?=
 =?us-ascii?Q?rSWzM0kRlNiIl6RkUJzC5Z25o8vIWO+ZCtl0Na4Cc1isoywourUZQ/HXMfFV?=
 =?us-ascii?Q?082jAJWbCLdJMW/iD4W6DiCPVxXgabUq3dSrpzlR1Pxe6M+zbocWSZTK67hD?=
 =?us-ascii?Q?cyh8O4r/FOZiYPmSLZAhXdH72yG6Cdms5ZuiojogXxXwfxmfv/8R5SIlwYkk?=
 =?us-ascii?Q?u+KyRB5LVDM139ngeV3KZv64oDTjcSMR8qm3ukfRfPfy6gRlq87V63yrQ/r5?=
 =?us-ascii?Q?aoDszuImoy7dLmBB2gBP7LA5Oz6LXb46iKCMeMLqji4U8V424C+r2BQEYRWv?=
 =?us-ascii?Q?xilqeJ0BvUrBuJxifaaIO7VJC4A1Mp/K+NS8JVGQmstigaYzWnrKmMsYZGFM?=
 =?us-ascii?Q?+b4y8f0YkdPxVHBPdZmA7EqVcdECL/g3kdRywmeDeToYywnAj4G52kBWNUtA?=
 =?us-ascii?Q?rv0EK7ZierDy+D7j4dYKCfTMT6FKeXzC7tqGBRrv/TTWW5DTTTjwWvWtZElL?=
 =?us-ascii?Q?eb03wkrZlG2MjESZIm8C90BRxoWFly2jiyekV/x77cMISOkIQ0n/9VHGxo46?=
 =?us-ascii?Q?YNVOHzV/gTfKqj0Y/WLFeNF5hvXQIhpGy8IIp3bQnRuQp7bdwTMhvRSWKCC8?=
 =?us-ascii?Q?QKDsaa/wQ15bpL3NOlPFkfdGb0uhnZCd5Ul7Ucdz2HDGIk+WYjuH0dv47P1v?=
 =?us-ascii?Q?fXSzMEb5CSrj8RDC4ky6SUl1/4s9QwQ1BHOHL2aXEsmDl/xB25VNDRuGdiwY?=
 =?us-ascii?Q?1y+EzMYKbSRIi2Ak8pOJ5fWZez3r9thLTNdMYM72rwvsnVekJU510vzYGcnb?=
 =?us-ascii?Q?Ve3/ajL2toWrk2JO195ivHRZJGxWMJY6AZqTyCNIXTttsVr7lZYb28juu5Bu?=
 =?us-ascii?Q?CEFBRyLyx3x38tAIGOkViSZeTGhaeM+LUWS/GtNslY/+ntEgK5MAKu6YE9Kr?=
 =?us-ascii?Q?HRJkU017Kj79T0pdhnp7IwpRArGUgVOjR2rLy8Bnc0ePEcS+Nbx2LfCGOpXA?=
 =?us-ascii?Q?vposudx3sAcQmtHpn6wWd3/gCCRk3yXviA+U1pgde0nae0Qmef/9Qps1saIm?=
 =?us-ascii?Q?7B0n6Esxgv1NUNI6tgiC1aeRSoYdYIt5VHK8UEw9P1xgW4qf2gS5UwbA0Ku6?=
 =?us-ascii?Q?lLLp1tIKZqWx2VmYceWuJorx/+qGTshdHJYAaww6Lvekal9Z9s9q933Rg3iH?=
 =?us-ascii?Q?b13+SpLmBMzGgmVvN10TO6DI5WMAlfEWhEM/qe4FfEqpqSRJikzNsw8Alb7f?=
 =?us-ascii?Q?UGlFHrqu+Jjsizg3Ju5ndFZNpnxJawdF1mXN5N+jYSzT4SoSoLVTkZlgq6t1?=
 =?us-ascii?Q?CK0b6bE0I7MTiRtc5OorUzSc2G38gLYVOTJMO751OOv0vsPXHS6yvnd9yeK9?=
 =?us-ascii?Q?fkqxtiTbLUzcDJyOhhksVI5atjD/eXUyU2wnjfdnhsNUMQanmUP46cCy5KbM?=
 =?us-ascii?Q?Q+E0ZaQ8c7SrjQqYsMpbvUPbc3vB9pTrAuGauAUUQV3G2Q2Y/fZc6KmU1a4Q?=
 =?us-ascii?Q?xFQdZwIIgNvaQ1enQiolbM3uNJ15GRI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8672cd-5a16-4300-b661-08de584b504a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 17:42:42.5675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nwT2Q7WN/hDdGSreLz2Xc/OzN2Ha78jJ8SMAzgn3zlTO3A3DSXy/lfYWRdqRy1SSNBFKvA2J7wgNfiE0qRRX+YAcBD9s/fFu2lI5ItC8iEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11247
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27139-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,glider.be:email,das.au:url]
X-Rspamd-Queue-Id: C1ADD49168
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Biju <biju.das.au@gmail.com>
> Sent: 20 January 2026 12:52
> To: Geert Uytterhoeven <geert+renesas@glider.be>; magnus.damm <magnus.dam=
m@gmail.com>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley=
 <conor+dt@kernel.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; linux-renesas-soc@vger.kernel.=
org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Prabhakar Mahad=
ev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; biju.das.au <biju.das.au@gmail.com>
> Subject: [PATCH 04/12] dt-bindings: soc: renesas: Document RZ/G3L SMARC S=
oM and Carrier-II EVK
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document the Renesas RZ/G3L SMARC Carrier-II EVK board which is based on
> the Renesas RZ/G3L SMARC SoM. The RZ/G3L SMARC Carrier-II EVK consists of
> an RZ/G3L SoM module and a SMARC Carrier-II carrier board. The SoM module
> sits on top of the carrier board.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index be61a71c7305..201d15dd30f2 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -550,6 +550,10 @@ properties:
>=20
>        - description: RZ/G3L (R9A08G046)
>          items:
> +          - enum:
> +              - renesas,smarc2-evk # RZ SMARC Carrier-II EVK
> +          - enum:
> +              - renesas,rzg3l-smarcm # RZ/G3L SMARC Module (SoM)
>            - enum:
>                - renesas,r9a08g046l26 # Dual Cortex-A55 + Cortex-M33 (14m=
m LFBGA)
>                - renesas,r9a08g046l28 # Dual Cortex-A55 + Cortex-M33 (17m=
m LFBGA)
> --
> 2.43.0
>=20


