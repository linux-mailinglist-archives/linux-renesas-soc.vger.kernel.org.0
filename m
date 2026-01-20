Return-Path: <linux-renesas-soc+bounces-27159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPaQAxr6b2mUUgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:56:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E94C9F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD14482DFA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108293B95FC;
	Tue, 20 Jan 2026 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PjNxWCHu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011050.outbound.protection.outlook.com [52.101.125.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DD93BC4DD;
	Tue, 20 Jan 2026 21:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768945644; cv=fail; b=AIzBAGIIUpRh13gzHyNWw7/dk7mZIM3C1EzFiM3NGYE8Ktrb9HiCIYlju3XyHxW1o8r2NK/p5Dg5l+EmK+ugwP4mncMy5hWaA/MlzDlVIXVk/D3J1mmhDmPc3h03ggsRcG9lv3KUgCDkPmO1N3tVr5QRb21BX2qEsySjGwXZx8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768945644; c=relaxed/simple;
	bh=C6PtsN2c8DC0UqoZ+i+GkQXmNdQH9MguR6jiQlT86S0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BJE+jGQCxnJU6KoN/VlWaqo686XyotWeT1ZqQoBxlQd9CpNstJirFllGAI0QnGDOlMT1Qh6wHuIFmksqM6XUeptAKrOVfdiJahe00b/9LowLaWzdUEKLb5YfAlCwEKg2roa3YIYiISbpjA0aNU9sKj2IPNJADQtk9Ry8UsQscE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PjNxWCHu; arc=fail smtp.client-ip=52.101.125.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkXlHndWHeKkGfoJG2Kij0W5dXBkO+kyamWveQy6LeQuDOWZEYsIgsExR0S0tHO5j2hwzHuu1yaODmaBmgxZPm0yTZTCD7iVeWWMcJY1NWk8O9n2xtGEQ5chJIgnZAExZelS4JJhxcGAkuF7RuFDfVXlM27ej6xYgw8b8qrVthEXveFMEqBa+IJZLLXzTdQTKtljWFs4XXUtZwUn7HtwE6ZhPovJN9Zpt48+nXr7gdcsbqWOfn522Dzh7ztNLLbQlVwmg/5TGh7kEPWYZO8KDyeODitOpSsRjKIlkwvLBnfCEgAPoHPlMHduaC7l0MM04u8HMtVaExulP6N5JA0xeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDtZvRsMj/fqE7I5Zq5ClXK/+aLUq8yatH+Zx/LDK34=;
 b=Oq942SyJybSC570Vfl8LlSMIir9OlmGPLZJL7euzZOMIWJLVYnMGTZGz8ILcldJEVH3G5gmsDQnmYk92eHFC4HY9gOxzCIJ2omaDbC5kB5v/ZzazMOrJV+ZpjGSrptAFK75ZmiyglrKsLlnD10KOdzI42RdJo8Y3povn5KlsGFTQSpvGATrROH8nrYVYITCOTwNCDF+yGUFJIS/0i2fhQoBDmWZXJaPGj9Yi2+Ry/ty668PZ2D1YtQnSNZkoYc2/zIz/yoyb2/ElwBXo/ZdS0FDRBkD4SCnhpXT0cDw0JPrczM8tuLtBC8o7pueXyF8wgXqg3XWJbYupuw2XmADWoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDtZvRsMj/fqE7I5Zq5ClXK/+aLUq8yatH+Zx/LDK34=;
 b=PjNxWCHuCD3NWcge6FzUim//Q3shl7qrf1O5o6znAQ9mXUTFYD5GOO2AdisisrJNcX22J7rKDYKVRfPxdd9/0AjzDsom3fGxXug5mv3SqDGZQ2eNpvkDt+rUkOhHZCcl/OyfeCmElBDXNAiyek/CE69gEC3MXuejon3x3juTtEY=
Received: from TY3PR01MB11241.jpnprd01.prod.outlook.com
 (2603:1096:400:3d6::14) by TY3PR01MB11241.jpnprd01.prod.outlook.com
 (2603:1096:400:3d6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 21:47:12 +0000
Received: from TY3PR01MB11241.jpnprd01.prod.outlook.com
 (fe80::f96:7720:1105:8218%4) by TY3PR01MB11241.jpnprd01.prod.outlook.com
 (fe80::f96:7720:1105:8218%4) with TransportReplication id Version 15.20
 (Build 9542.9); Tue, 20 Jan 2026 21:47:12 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:41:53 +0000
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
Subject: RE: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L
 SoC variants
Thread-Topic: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L
 SoC variants
Thread-Index: AQHcihBStNj6nHFXQkO8G8TIy+vh+bVbUu2A
Date: Tue, 20 Jan 2026 17:41:52 +0000
Message-ID:
 <TYCPR01MB120937A6E90F5014CAD069CDFC289A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260120125232.349708-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TY3PR01MB11241:EE_
x-ms-office365-filtering-correlation-id: c25539a7-e611-48dc-d21c-08de584b32b8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?19YzoWdFZyonpRaQ3f9YqfAatd5IZnwvylWeqj/VndMx5tlvN5tAFhU7DgB0?=
 =?us-ascii?Q?0v7ERhvWS/6YK2ueemIuUhsuJXY7o4d7wPtK7MNwci73v/FF3uFL3/41aZ9W?=
 =?us-ascii?Q?x7nOtnRBzyYE8BHfmyu5vPeTxCTkUjTIORrYUaA50WMo/mnfCQktm3jqGaq9?=
 =?us-ascii?Q?F0N9w1uFrCp0PjWSkuSq/rqcZsIUAy+j0/dFZcUAWjREt38+Awn7TZkihQJQ?=
 =?us-ascii?Q?3c7XgBpHPscQuoKRc74mWL4Jz9YtTukqU/f2BKZWY7djHG9AfEEjrSm98bYR?=
 =?us-ascii?Q?DrhZfDotA3PaeYCeTjEhlzQdiZVmHfNBiD8EAEYP1dOif8JHJKHhwlT/76gj?=
 =?us-ascii?Q?6tIlPi7RqJf/amXbga4O3oPkkQlXykrrvFE47nHLLfEQqMYKC2NBELoVTHv2?=
 =?us-ascii?Q?R7IHLcKeCMzkxFHAGvt1Tr5NR4KJCMaCI2mgVTDJPeg1qB00BntjA/6iIR1k?=
 =?us-ascii?Q?wfgehqXdAsn9CtcnhbELFPjIa4gFXLO5C4AY2cBDUSjlGk6Kh6g7ixqYQKB4?=
 =?us-ascii?Q?4Z80C6G3Sstj8YR5yHIUcyYJsx7Yc7poY0aoUw2dWHEc8teEzQPBZuOdnqGj?=
 =?us-ascii?Q?EzyoRK7DMAx++brF6VeB9vDYqF3jbz/3rciAUGWyYMmDSpTXLYKmw7JMb4/Z?=
 =?us-ascii?Q?qG2rFggZF3tyjA1jk2SkJ+VvVRRnvJ8pXAk55QxpNYaplv1dr4NYWIGIRln5?=
 =?us-ascii?Q?tFcxzBtCkM4eL+THyc4EsVL5EclReGkxRVkBLVn/DvM3U9abebQKkCX+/7qE?=
 =?us-ascii?Q?uMgBKT3hZdM7HbpCOdGnUfsqTJpRUezj3SwIOkXAVkVR3xZjm+s91Exg7Pcy?=
 =?us-ascii?Q?3Y+Jx3KP08SDgzZnDYbPVFYmMDntTFE0PPTl7HR0det7hXWZrHAiJa+MXPzc?=
 =?us-ascii?Q?4BvilLRoNvOkr+W//tgkzhEYYQAbt7nsY2ARXhDAXR4jijVOVLwbBprekiMV?=
 =?us-ascii?Q?b3BO1MMRlgb1fdIN+rx1bFoEYGG94vx4vv+f3mRG1+6zJts6fuXCMRz7JXxi?=
 =?us-ascii?Q?iHIHIenOeqWOIZYzmI4DsmmyO2VVomxIMuBRCImuX6jrqLAxmuZ2P8YtOcLq?=
 =?us-ascii?Q?xxvgO8pLe74cf5KbYW/FmmSh5zMjWCLl4KpZGiQ9YNErx57HhqbKGMZlvESy?=
 =?us-ascii?Q?UE83Z+PUUiqmAwXr3QsPboOUJC9vZrrmXKw76EINCqN1ceffItENAo1ixlKs?=
 =?us-ascii?Q?HAgic7G3Q2jukqypJ2JwhzBgJmskxKyWO9t17huRsAHiHT0WQZ0zM9sC+s56?=
 =?us-ascii?Q?8E5LaPp1ZtLk4lckSLexcrC5Ufn/9wYdgL4cQRXohV5s2l+GKrbczzzBo74Q?=
 =?us-ascii?Q?LZqDcrjsJnuXi6wCzibJeRY3QjbLHxIvNx/TOKBLMxfGPA+hU0NnYlaCMFB8?=
 =?us-ascii?Q?C4y7TAylti7TvSIwGey7X2rWtM6h1HJgirSol1NM0gMaBb1DIzwr8QwVRTem?=
 =?us-ascii?Q?cv4ltLrU31uPehH1Xp03uRorma3iHg0bMyekCAhbhjxg0N+g6sPrINQkN1o4?=
 =?us-ascii?Q?jEt820NjfmOoUL368V0CaOxWUuE+BmckZjYh9f9b+tfO33jyFRf9ifAzSbn+?=
 =?us-ascii?Q?wBmGaYK69AyEW8CK/UMpci7r2iAuyBW7SE3ppo9ZMn3fExy6d1x7YeOT1RXt?=
 =?us-ascii?Q?mbmAmIq+xfCIIk3fRuiKq8c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11241.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BpYK/e9AGO/2Gt4Pfg/NWkPWxb+rQeXK2MYtqG/YQ1qtZ1UjvaeqpPGwhRl/?=
 =?us-ascii?Q?mu2Gnq64UMO2xttrSjjjBEdc7pzC8kKNHWsA2zmtQG3lusVJMb+TIVtpugdH?=
 =?us-ascii?Q?4dQ0UthfVqmHCo0lpVuHh8FeDbRLr3MRK8mT+/o6Z4k6x+XPhoy5c7/M1PMl?=
 =?us-ascii?Q?IOdUA2Yrgol8ckadnrlL7BY0Y8NQPFqf9R8uBb/b/AoD0dn9Soe5eAbm5c71?=
 =?us-ascii?Q?wJwVmjs3yijKnOnA3vxlAw0gdJJQC82u+fjRk6rQg0oSMpxiAONAieGOdO+g?=
 =?us-ascii?Q?uWwhBNU0+2mAkdaRLSWf1/GuSt85xWgmoFYEsyIJXrQtyRsVoE981APCQ4PN?=
 =?us-ascii?Q?2LlMs+jFvvZQdWERgeA+lF8E6HZv9eJAgCyR/kTzPQkh6LDh9lUTZThFrM6j?=
 =?us-ascii?Q?85S3nX2BciIkOAgbuxnIh3EaA/knjkTT6srdC4gWWK9z1Q5GQJi2ikGtTfjN?=
 =?us-ascii?Q?v20i3UREiokQ+tBBaVzCrZA6RqObP84Ne04NUn6znc9TnSyH2awIm/8GISQI?=
 =?us-ascii?Q?FF6bfN5Z0REW6eBSY+4NCNBUX92aQ64/PTGdClFY1WCOKm35J7fdPhYbgQPA?=
 =?us-ascii?Q?W2qxdPw+OXqxrmq2jkNofWVhQtPsZM3d5+EohcYAmn0Ujfgi8Mhv0tdgNrfw?=
 =?us-ascii?Q?bEw6puXUgJbqM1pkL3yvVnmigPea6mU9r+k6SUmSvRzJO3JvnNKDbzSn2Sxn?=
 =?us-ascii?Q?ixh5PJZsGe9X7in6ESCkj85kK29GBP+oWwyGRKiY2pZyKYeIeBaEaEW511ss?=
 =?us-ascii?Q?KdUCJ+hjgG3BkwCVIqHI2Sy/bZhQUmg7UC9GJDSNJCjylZaCchtnN8L1Gypd?=
 =?us-ascii?Q?pj6jisc4B91+biXH9Ou5+X12naMUxQfpA4nS73NvJaqlDhhOMndLvB8Ly6tE?=
 =?us-ascii?Q?ChCYgZc6TXb43fiexMOQr02+Ev0wjs3Tvxjs4CpMUveRK7q/Q4MUW8hDvpeS?=
 =?us-ascii?Q?nUcDE8CaGAViWJ7nS14FMQoSIaWt7pKNobXZ4IA5mW6Lxd3BIu6cN8Cq8HRx?=
 =?us-ascii?Q?NEXPx/j7noV/pfmKDc691xA2jVUK0kg83cYwazexiSp3qHolIy2NyrNbnojq?=
 =?us-ascii?Q?U+uGyUZ2qaS1d3tznZ5dbr44RJ4+kIvtQ8ogEYncweMk4QuZk/wwPVIyyvSm?=
 =?us-ascii?Q?brXb0n92CgBfL8RFw+9QH7/3n4a/g0FdeTEKj1EfAEh4IN0xfwpaG7gCVJEB?=
 =?us-ascii?Q?4N4AggWi5iDr48vnnzmQFj9w8i4fMkJJqwNDExyn3K0m+xNgVqFfdO62PgB2?=
 =?us-ascii?Q?ntYim7/cDabuqq9HlFTvgphLZnCsMPaxzNc0rCuDBCg5NjAJ6Bkuy3K5IFPW?=
 =?us-ascii?Q?kWZL1Y0paFO/CQf5cjAsirjyXlhMpDWzxzviuGT+1FsaDnJJS5dvasnIC5JK?=
 =?us-ascii?Q?egJvbmqWORsx7r0hXdkPnv/jB/wnxPHJtwsX6j/0kcZGxEc3G+ELKeB0EBg7?=
 =?us-ascii?Q?PGm3oOmhrF44oI9fjQ5QAeR70pJZW49+LQZ+8b79iUUZHnnevUGO6s02MEJx?=
 =?us-ascii?Q?wO3lsp2ZONKM16R0yqJfcbR2ZnQCNH/kVvEkGiJYKA6bh1Eo4Rx4ihYo/ZgR?=
 =?us-ascii?Q?49RAiAy87doeTSUMtE0+rBPqC8qZ/9GTlq02obypRfZxFRCpcys5b462PFEu?=
 =?us-ascii?Q?xK9f1Dk/zBiUPXEWp5Yffk6PDc7iEluollnEU9JLyy/AyXgiguTW/qI1sqmb?=
 =?us-ascii?Q?Q/kk1StXYLvLHfJsacyuah4rS76QJwbZj0tS+cagtuvW1dzlihDC1sxc/bbC?=
 =?us-ascii?Q?AqXTeB7Y3yjWfC8JkkZD5EUMhqJEMbs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c25539a7-e611-48dc-d21c-08de584b32b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 17:41:52.9341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gc6j86xhIDx4sQls8Uy27Mjhk76yfU0uKm59QE576N5z9oobYyOjMO7RH7qS3yv9LAL6vuko50wwwacNQxelHbBYdAM5C//QkOLsVgB7OKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11241
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27159-lists,linux-renesas-soc=lfdr.de];
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
	RCVD_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,renesas.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: EC1E94C9F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

thanks for your patch.

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
> Subject: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L=
 SoC variants
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document Renesas RZ/G3L (R9A08G046) SoC variants.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/soc/renesas/renesas.yaml         | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index f4947ac65460..be61a71c7305 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -548,6 +548,15 @@ properties:
>            - const: renesas,r9a08g045s33 # PCIe support
>            - const: renesas,r9a08g045
>=20
> +      - description: RZ/G3L (R9A08G046)
> +        items:
> +          - enum:
> +              - renesas,r9a08g046l26 # Dual Cortex-A55 + Cortex-M33 (14m=
m LFBGA)
> +              - renesas,r9a08g046l28 # Dual Cortex-A55 + Cortex-M33 (17m=
m LFBGA)
> +              - renesas,r9a08g046l46 # Quad Cortex-A55 + Cortex-M33 (14m=
m LFBGA)
> +              - renesas,r9a08g046l48 # Quad Cortex-A55 + Cortex-M33 + GE=
3D/VCP (17mm LFBGA)

The document I am looking at seems to indicate that all of the above parts =
come
with GE3D/VCP, but we are only mentioning that for the last part number?

Cheers,
Fab

> +          - const: renesas,r9a08g046
> +
>        - description: RZ/V2M (R9A09G011)
>          items:
>            - enum:
> --
> 2.43.0
>=20


