Return-Path: <linux-renesas-soc+bounces-28285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLYOLe+WlGn4FgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:27:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3386314E2E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBEBE30614D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 16:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E9F36EAB1;
	Tue, 17 Feb 2026 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AhA4kVlb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E078036EA8D;
	Tue, 17 Feb 2026 16:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345509; cv=fail; b=Wel5X/VBKu/xUiomi/50deJ2sOWTb/fcKpQ0076cFSCmuaMPM+/jgqoWBBvSWXP2AG3pdf6vyTP8Q8SUrR/wio+YmRuluVHKyPRQHSCjdP2YSEFxyXg7xVP7fgR0XJFQdhrv/L2ZwBt1Uw+UOem0rvZNufyaw587UpWhi8ze+rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345509; c=relaxed/simple;
	bh=xp2+rMNmj/3W+7tbZuSXJB7p6ex+V936iEWR5/wSz6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VLK68RMlL79bs0j7aig/bVCpGkXdn8MZuZHYhHSVpbj7lIc+UrPq4V5AJB/fqZF4xWqIlieqo+LjfvZ8ha92p48RfFSP200mlTQ0IrrXRTSAgmPeLPBxQbufWm3rFSSbKUQEn405fet9Zl6K8xigFHmnfyd6EHyg/0PJS7s+Z7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AhA4kVlb; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggLwVP5nRBOxZ65d8JFkl1xyPSSlOjv34CCRHpqC4iJKh9HGCJra7aY8s2/ThQDG0P4VifYISVtrYxQBfQ7jDGyPqQQND4E8eFuD3amZiUfvnrYQt18jguhi9GpyoHgsS3TD0ZBDi4DYdLwBpheEhCthcs5IEP8l4QG4eHuE1ek0exMwAvvXKqihs3VLSJH8Z9DvcBuln9rhPWvtKCho9VNde6eGkQhKOqa1DVj7yT2Z0Lxi+68UrM7bSK3NvWtNKQvFhRWnOdMw6X5pw87849d4gtjazzG2xeMvuJqxJ8Ygff+5O/PtE+636iiMPzFKRbJFZXVBhZT8qxqAhe49Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UcLoBAPwV2S6VwDXljmAjzsR06Qr5PqjihuffKpCj8=;
 b=Xdhi6rV2/Ct7PfABxVTxcBLuVOXXylMhK9nyxKXQOziDJEkNqUA/rCOzYtXqz2E0gaMWqAu7PRO5sJt30SaI9sTm9AGGMUxYB0kJqP3xPY1eX4R7q09dbe4HeCsK9h//dg6Spi/4UPZDoBJbve7W5CqdcIFtvg4SA8lKxiQdhxKmaY3YFxbP4KrIcYN1bkt4U4yikm7I66+UVHX1QCO1C0Xtv8zXj2as4Oa4UtRfnaB5UohNwW0cnHEasj4U6WuC++WVQNjiZiCnaK1t66B8ATshHpkPcA/hkvwB8cJtBMxvKAxJDhfLJVe/xTRoooidWCqr1Cub2qI5+9LWRmvXLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UcLoBAPwV2S6VwDXljmAjzsR06Qr5PqjihuffKpCj8=;
 b=AhA4kVlbLJOTgxuPXX9bazpqdr03F2QSd82wVQuVD4BKhdc7DtF+Mashd/zm6rDwv+UqeCR5l4o/NVBVj9F2DTOkAp6EPxcy785Q42gYsGJIO/D1HMG4e06TtwWoSm/n3m4LfGagIA70oSkTos9DhLW9KyjIPF5lCufV52gVzfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB8581.jpnprd01.prod.outlook.com (2603:1096:400:154::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:25:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 16:25:05 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable RSPI0
Date: Tue, 17 Feb 2026 17:23:49 +0100
Message-ID: <b634c10e632fed07b5652c11de060deca27ead90.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0320.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: bed89ea1-9a03-4b4e-640c-08de6e411bf2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IeWNKv/TiCZW6e8IZ26/YDHWXTHKgjD8G3HRG6J8xILC+cEWTZpX0tuBsjZP?=
 =?us-ascii?Q?TOB0Djq91XbNVejKje+5TcuZFcKQjmfwFYz3ZyobBwhAbCShJyHY8RvGqkOh?=
 =?us-ascii?Q?VKcEYhGhCdYwyT0lHNX6bQakCmjCLme8sMFCKNYSMdXgnus5DIecuzQopSVa?=
 =?us-ascii?Q?JMObfWvt/g3FuQVyStjDr/G4ESB6FIh2GUs6NAPrHTSJ5m3oQi6wPy9UPi2J?=
 =?us-ascii?Q?967rqc8LvQ4ThV7KTuG7mjXL7ZgmKgQywfcd84VkpyfmS6XhF3BrRymqF5yW?=
 =?us-ascii?Q?QruRv2dBF9sH1qG5R7Zidi4Mn21g6dDZ92vu/D/WnDTKWGV0nkh75yZ/+SQM?=
 =?us-ascii?Q?rrbY9I/eEE3PN/eSqhkJNJ9R2zME36hXU3z9vYbtX3IL15BRXxvJ82l36X/B?=
 =?us-ascii?Q?AO2kTeCLBZACCBiZj6R+dnSKV01c1mhbvvvsp4ztD04Ah05qBcbdf63W+Pw3?=
 =?us-ascii?Q?V6uZ5Z2thokmo1fxGQr+sfHkg/++/Zb+sWhUQI3XPtJ3PpeYdBEI3TJGYrOH?=
 =?us-ascii?Q?PNMbyfnqmNFQzVKdKoXezmSCT0kCaOugKrYOyOfs2C3LRY+5kbIkTmMLSBNE?=
 =?us-ascii?Q?qw8MwENOq7Pnv8YCJ0kRap91MoqN4G5UjjBv4ehUKJ69oJZPxE8dUVTwXgTa?=
 =?us-ascii?Q?BVqi/vNwY7Yk5oEZY+DnoVzSqThjVUEgEDYa3nqB7uPvQCpSniKRYfJgB0Lt?=
 =?us-ascii?Q?+abJOx7NiUymGRqqhev0VpCw4fo5cf+Hk57/iQzv3swVWlFN/eT10Q1bTCBM?=
 =?us-ascii?Q?eGGrBYnmwmAaUmo5EDdF47kwN0QG0COEXGN9K/tvp6m53wNpkJepL8PpkUq7?=
 =?us-ascii?Q?6lt1/5N+m2vaBJ7GSMPRgMvFD1hZl4bTsW1mH1iztA6xJssV35CUpZw1NTgS?=
 =?us-ascii?Q?QDwrTidpYkm7/BFf8yLHVqrDuG6DouaNFcgv5hAWyT2IeJwU3s3hbN0/QE2j?=
 =?us-ascii?Q?BanXB1RsmM4I9L/g4GN+wtiSaPGcIZQbyTuyge4Z+S/00oXpkNE7qLkS7Ouy?=
 =?us-ascii?Q?liddhqI+yG4tAzquj8leNgNlagzDSoocumxX9QbsYSawem/WUcvMtPBUE6ub?=
 =?us-ascii?Q?hUeztJE8sGqYFFqGv0C2zyHn0+YY6h2YdXIgYosMCtXZUTpH8AxOOoRFzzmM?=
 =?us-ascii?Q?jajckpe41NEZzlSHTCOYc6crkC6aXbvNPA91F1uH8z3v1i89MTfWwAMXdyhx?=
 =?us-ascii?Q?V/HJQBibQ6PoUkhpakzUQ2kAQfUtBgZ+6Nk6C3aZKCI/1+UyFnll0QJ8wa50?=
 =?us-ascii?Q?QK399MiZ82Xf8I1RfxNiLr1u2UloLKxyQWkO710+jLOy57P6I866JgI8IS1s?=
 =?us-ascii?Q?uOM5myGf3sTOU2lfYivgkCoUVVeLAtbawt8RMcL8CYorKx4tyV2og/1Yo6vi?=
 =?us-ascii?Q?If9s5Z6CWNdFgRqJ6S/1PEir+NghmhkPhAgWrICN6qcqq7a2cvNy3Lb2yqbc?=
 =?us-ascii?Q?jfGnD2OOo9fM1jhqeVOo6oHrK6n/bXmUDUjA0GyN+mKC/H/R0R2DJDALdMPY?=
 =?us-ascii?Q?AoLEYmF0TQxyqrcLA9T82SHKX11TQvj8HYdzOKhJ55BhBk3TuWd4m+sbdvB6?=
 =?us-ascii?Q?5Hwt6Ln/JyTENNbmtXPH2Losyn+NQd0hPJ04bEX/sR0QMF7oJMXHz+lmiV8l?=
 =?us-ascii?Q?xACtVffVrWlIduucXInKIC4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FDqbBzYVbDcuyAx7lDa/RW7bSI/wFxr8UsTUpV3015IKlyMOX39Dhx0THnKM?=
 =?us-ascii?Q?37MCqi/u29KhzLcJ5Spoi6e1dOwIuiJY/VVdVDcS9o1JPk0DaQEhVS2yjKBL?=
 =?us-ascii?Q?vBU1EZ086uDH9Pye7MHgVgFpBd1q9rqoD0q2kEf+glB6jmpZljJHrX6CrSIp?=
 =?us-ascii?Q?+ku7TnKmxVOllQawW/DBnXy+jglZLA54I/F0ZNVMriI66/5FwVnNyoSPeQD0?=
 =?us-ascii?Q?AXI83CwIVSqOLnrUy2HTDNqdwqExHQhSItELSowOZ6sHUD4oZ7v6KyLUTL5D?=
 =?us-ascii?Q?TXSQ1zXdHcvRQLC3cNPAedFa7FQ8YfkVAcMAR15Zi3jWFEXVtcVMe1/wBDWD?=
 =?us-ascii?Q?GTIXl80deOUuj/ydProIPxXvTmWHEanwdeYP/8+MgYfNXqwNqr62IAx5knt2?=
 =?us-ascii?Q?+BjbxcOZYuKNIxbGC/2xty6Wm73jJ630m2pPVMea/DjRK1XHDiXdH9gurwfo?=
 =?us-ascii?Q?RDRAPlAfu9u6Jy/0KDS0CEJ4bkqffeaso6hLoOVqv8infmv8yeKT/pqa2xly?=
 =?us-ascii?Q?XQ+83iwCsWcGnYFIgmqZn+OqRyh4/Z0F8o1I0M/YnFRZ25uvS1idyv7+/co/?=
 =?us-ascii?Q?+6IL4pQgSNocbYNoyMMjATQJbF0nhk397tM4keTgsbDMB0G/zRrNQNnPeqdn?=
 =?us-ascii?Q?2TYxrUmktKkROTZ64fg1qjHVETMAAJFH8/zxKAahjvFlQpO/Nzo31Wy0Ud6z?=
 =?us-ascii?Q?mqE1Ym+ZcrnTjhGWATNszPHNDVYZkiRmHuhhC/mXVD5aeJGAZpDmOG8wtaCN?=
 =?us-ascii?Q?33Bu/9T2c9j+oQNTMonieCyJwn72I281mgoehdz+xWm9XUvw+81udPrKzk/j?=
 =?us-ascii?Q?0EQd7fJeq8564yzuENKWX0UAEIM65vWqbsygRWskuQifxrIB9Rgztmx7yPxo?=
 =?us-ascii?Q?Yz32ESMq84Pu4iyloe6FO03c5nqbWG2TQUYeq5uNFXdiruTieQ6WhQ9hwJ99?=
 =?us-ascii?Q?iCVHqNYH51xTw+0H0sQNDF9Xiy79q7Uk37VmiQBKPcP65InGlegx2gimbZ8l?=
 =?us-ascii?Q?YTZDNj/Aukuy88M4b2+RYwZJHBbD51x5+UtK76F3CUKfmOjClTh9AWACfv4E?=
 =?us-ascii?Q?baygOJCJ2/pa+LlmnYI6EAqqUDxgqW8gpjt3ZGzdMdNdGK602Yw79qHryfZ3?=
 =?us-ascii?Q?DeGN+JVGCTKaIfFKP0epe7wGqQOxkup9+wVNMDOTy/x2vpGP9Jcj32+V+V3M?=
 =?us-ascii?Q?QQh8w1S/9nQ642HqBlP6xbvRTtTTJWJ0VHgJtOIXmNiigvWtE13l3B3KBGMw?=
 =?us-ascii?Q?Se9TY90tFy8vSGlpzI00cw0kKBpQm/tO/2CKSE/PXeAO3Hauk1tBJ0vMLLYp?=
 =?us-ascii?Q?Y7i5N9BtQH3AtR0xCAtTxQPbxS+2g3Tr/14s/k4XzKJkA0qw5wctovMY0yAq?=
 =?us-ascii?Q?oQlJ7HgoOSswPuPtRof04WCGKH1+ehn5x0m5SwEP9BTYlCgSwo7WEvJ8LKwF?=
 =?us-ascii?Q?zZZANaxDIitfypPlR5kQJrz0m0f7TaLPhNVjVZpLjaHcF9gcW5QFSv1+dMtN?=
 =?us-ascii?Q?FeouUQF9LZcNIVq+ZUQDGn22XOX+NgLXSWckX6xLj5UVSBG+uwzyf9qsAXsL?=
 =?us-ascii?Q?pkZ63Xjx/6qeshJWxUmIbnd9nIu9/b+CNyyisErQz7SaIck0FMwxiUb/CFh5?=
 =?us-ascii?Q?oON6Vq6wJyQGTMgfkqVo6bbIklKbQmV1kiwMDHlFaI0Ji4V8pf+zhhvtz48Q?=
 =?us-ascii?Q?PbIrBqJ0pdRoxOblEHTaFnKEZI0W8yh89lmISxwrp5z/OmqNz1d4RV4XuMXH?=
 =?us-ascii?Q?qObrQOtHB5Vlw8GKpc7k7Au3zHTD9UBlld803q9siM+cJIHHiAQY?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed89ea1-9a03-4b4e-640c-08de6e411bf2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:25:05.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdISg7cszo5WBkPwZ2EnA5wwTQa4qY7b7KAaJBCr+5O1gi4NoNgYXflRnTkTiUnOaVXzGSt8Sdj/lvNv30wC2iv0WUOOO9rWEG5Cmks2ZQg5ROtIBEfLVDXQ4zRe3Diy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8581
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28285-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,baylibre.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3386314E2E6
X-Rspamd-Action: no action

Enable RSPI0 on RZ/G3E SMARC EVK.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 696903dc7a63..78dcbac8f4e8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -167,6 +167,13 @@ rsci9_pins: rsci9 {
 		bias-pull-up;
 	};
 
+	rspi0_pins: rspi0 {
+		pinmux = <RZG3E_PORT_PINMUX(M, 4, 2)>, /* MISOA */
+			 <RZG3E_PORT_PINMUX(M, 5, 2)>, /* MOSIA */
+			 <RZG3E_PORT_PINMUX(M, 7, 2)>, /* SSLA0 */
+			 <RZG3E_PORT_PINMUX(M, 6, 2)>; /* RSPCKA */
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
@@ -234,6 +241,15 @@ &rsci9 {
 };
 #endif
 
+&rspi0 {
+	pinctrl-0 = <&rspi0_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+};
+
 &scif0 {
 	pinctrl-0 = <&scif_pins>;
 	pinctrl-names = "default";
-- 
2.43.0


