Return-Path: <linux-renesas-soc+bounces-31873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANfeF1Ah9mmPSgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 18:07:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B25BE4B2C35
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 18:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BE303012271
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 16:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A90382F1A;
	Sat,  2 May 2026 16:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="sv3y0g7D";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="sv3y0g7D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022087.outbound.protection.outlook.com [52.101.66.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02542366DB6;
	Sat,  2 May 2026 16:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.87
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777738054; cv=fail; b=nfqFqdjsdskFyXoMhUzeewBUzSRLqJrjtU69HJZQ7RwiGI5WDZLQSvXNasP8vJzrOgqzU/i/5wWRnpzC9qkOwDCakmZlpbJ4YSn2FK52F/2YfRJuBsq+yrKcHafFfzlBja3xcEXOg5OXmvPdl/8deBM+uHR1apdFGN7iZHSyoO0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777738054; c=relaxed/simple;
	bh=GHyx26FRpVYx22ktJuwo3rEOHRvWgRdkKE5ywdghdkg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=jnc7pCkCUJ90zq8rvluWt9KL584ABtHfTGyQXjFkZFIDgr96vj2rrOrGMpBLHAzSW/qz67wt0R28ohOGH9il5HmiVZhIangk7qAMkxYq4Y+jhpXTT5NDaqaR4FS3FdT3XBIh82UPbfBBy9/+ioR6YGly3904pNTs2dFtFEdVMl0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=sv3y0g7D; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=sv3y0g7D; arc=fail smtp.client-ip=52.101.66.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RiJCp8vWdpZViLtD7hIAP0i94FNJFmU5wa5Wo1h47VqJ+LzJVn/GIQgk183QndMDXhLZ+F0+ea/+Jil4d3PKAjtJzGUbaRy4kOPzeRHuHcBc4lMtM4faLTleD2d2/Qhn8C7FuzuYmdDDWqxZo4mnbOF0/Tonuf+Tynr2rwEjx9Z5rfRfZtmFrsEE1mB4vhMBUX1FYnUYsDKLO3hlvTtj3rEOdciuAABi9oxQ8BZ34p6mBLXLUN+lJtvVG5DHFbJs45f83iVGZ4pFCpMXiIw0ZPiNq63+VL8RwabjqRe9qwP49faPEAtB3BOFoD7BUGwZZ2hn6+NDOr4+64XKwL7Chw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeBirqYT2uJyqQNeFvhp3jY+1LFyRJ7IP1nsMwODDAk=;
 b=EPc3fGpZ3eXOqoBYthsOafiscwqA44g+paqvvl1jVFHHQm2k7LUEoWRR9BYYRTZ7Eys7tRnPzDOT4WEcUaynmS1OwnzoH6zz/aptNw1dOA85KmxxWF151yIHMeH5dA1MaLqBmV63iJAvWzqJNkIQjXOQHdiaLInusBpKeuF6oPvqJIhlkEfO4UGFiKjw9Wgpx4cHa9+dejNqktGDBCs4Yw5Sn2DIomclFLr5QrBmU6V7/GdUOUiQlNcyJwa0sOfj9efAe001VOisn/4CWQIwcGbQWKTw74vtqRXefM1G9EFS4X4jqtMXWd+bBaXPfBsTvd+kPsXdhypw+IlOrt8sOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeBirqYT2uJyqQNeFvhp3jY+1LFyRJ7IP1nsMwODDAk=;
 b=sv3y0g7DuPz99Yr6DTNsUd4ht5k+LIQFTYGdORxaEPzc26hJf0pVSwAky9RH2tDAEUI7kJ0wMbiVJhLUNYlZ5MtzuCCaz5pMD4+SBYcCy94ckmx4EuxGCFh7lYvi1aFQS16BFCLApbudmg0PiEJtpDCYAhJJstPn7IwkBW4+WA0yhjhNpQBlKx2gsVT0PVSx/oR4n5RxFWeeIkhFRIu6c+x8hTlSHzinjFIHodHhj1sEFGgN12c4EYFqA0kKTxWe7FroyrFylSqv75WhkPRgA1ue6/evrsjZcEG5E5WEaAkLTwfFLIY1ktAB6jACWt+DqUuTJnBdQjq8hjZ9fzXhgw==
Received: from AS4P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::13)
 by DU4PR04MB11927.eurprd04.prod.outlook.com (2603:10a6:10:628::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Sat, 2 May
 2026 16:07:29 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::b8) by AS4P251CA0027.outlook.office365.com
 (2603:10a6:20b:5d3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.23 via Frontend Transport; Sat,
 2 May 2026 16:07:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Sat, 2 May 2026 16:07:28 +0000
Received: from emails-4458981-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-243.eu-west-1.compute.internal [10.20.5.243])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8021B80513;
	Sat,  2 May 2026 16:07:28 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sat May  2 16:07:20 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEF5epGhjp7QJPUsEMkHk+Kcji84CPCUENlWH/bDbZE+5zpvdi8ZWPCsYsu46KlY9rOxT6vVwEUxHbKuf4B5cj5M4NRmPbGMFIvPc8X7gLJtuhhq0AJdvV3fywu9wl9kKmYyuv3J+1pEAxPe1GbemgJe/I2KQx/8rPYlI27zuHRWJfvDgAEL6z+2tc70s6WqecFXTRcO8B6tW1ZoELREDmK8M3OX63HU/e6pEJv1iIYhqcE1UHH9Xhvzm7gO4nYhl9ZZHvfB8Ak/ERYFQb63i9BrUH12rGAtKAKSagPvJwDt/6/lh20lpv6S/OJCmkQRXS8GX19GuM/nErV0VigV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeBirqYT2uJyqQNeFvhp3jY+1LFyRJ7IP1nsMwODDAk=;
 b=IlQazpSsZMQ4bFICJrpL33pNuitR9M7nRdR+3hyMkMANYncbFhLrhYjJrHa63P+9d2jzX/ntvJTCkuJI0rOKVQNX8N3SsyCBsPHVo/O1tT4FVIsmEVni7qYitPxiaQqYEfZu3EueGH1HVTsYCB4yzIErgKiG2Tt/wTXdWYimnRQrVAm75wv1a7pWkfD3bFgzgwHQ8uNg70jaqX1f0kD+mzi9jqpBsruKkSBIM/iTCG4Gnbv3VJnMiYBfhstgLuKnbTi6o9bhOVZ2okujkEdnmZKYURnsKDlA8MP/PJgU2fh7QHBEekY69QUqB3r/l0WHJi9Ul3Rg6QB6gdC3D8jHhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeBirqYT2uJyqQNeFvhp3jY+1LFyRJ7IP1nsMwODDAk=;
 b=sv3y0g7DuPz99Yr6DTNsUd4ht5k+LIQFTYGdORxaEPzc26hJf0pVSwAky9RH2tDAEUI7kJ0wMbiVJhLUNYlZ5MtzuCCaz5pMD4+SBYcCy94ckmx4EuxGCFh7lYvi1aFQS16BFCLApbudmg0PiEJtpDCYAhJJstPn7IwkBW4+WA0yhjhNpQBlKx2gsVT0PVSx/oR4n5RxFWeeIkhFRIu6c+x8hTlSHzinjFIHodHhj1sEFGgN12c4EYFqA0kKTxWe7FroyrFylSqv75WhkPRgA1ue6/evrsjZcEG5E5WEaAkLTwfFLIY1ktAB6jACWt+DqUuTJnBdQjq8hjZ9fzXhgw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU4PR04MB10552.eurprd04.prod.outlook.com
 (2603:10a6:10:58f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.24; Sat, 2 May
 2026 16:07:12 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%2]) with mapi id 15.20.9870.022; Sat, 2 May 2026
 16:07:12 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH RFC 0/2] regulator: raa215300: add support for configurable
 32kHz clock output
Date: Sat, 02 May 2026 18:07:03 +0200
Message-Id: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACch9mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMj3aLERCNDU2MDA93knOz80hLdZOPUFAsTAyMTCwsLJaC2gqLUtMw
 KsJHRSkFuzkqxtbUAiMqbqWcAAAA=
X-Change-ID: 20260502-raa215300-clkout-c3ed84024888
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::8) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|DU4PR04MB10552:EE_|AM1PEPF000252DF:EE_|DU4PR04MB11927:EE_
X-MS-Office365-Filtering-Correlation-Id: 688214ee-58f0-4f0d-ef3a-08dea864e8c2
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 3D9DyFY3mYTF4MNB9HGf5ILDkgs4+0GvQ8AeqqpEfAA5GLulwPbm7tK2ZpSLjKB6JUtrVqA4hp0fdt1+2E2NuRm3OYFux+slt4BHgVj0LkGP0pZ76vzKWP/KiDJ9tBw48TIItA6frgXrHvJyA48vRwbkU9jb6/6bmjq+e0GPQoehYbUgixI1z/4KywUqzIU04RcoJoQcjmcxhF3vvMH19yhbhgfrZYjsIdy7SIXEtZZi8C/P1JHC+q1En0aQzrFLMPZzwDQSiKr7+pVLjJ2iSWPz88T987Nmf1JwtafUypU7WdHW/FgJUMnn9lfmVRNeLg9MGsp3ug+aON131OsXzxuCZtAa9NltQ6Y5uXqhGmk7yLsjh+akLWXRhTgTrqpqSIJMhMiwPWxhgWGQkWv8uvyCsSM0ZlT7jfbrNjz5OOHp0Aaub5jajZ3u9+pa6kITrTsMX8Ycnc7pq8T23cotGbvJTefXAJa+CdbQGL+54UQbCpJgG+9HX33dYzHIYT4qxHHf38EtpbEAB0AzesIkVp/SKOVUzTQIhOvSmrzqLt7B9f0NvY2wXTOtZ9Uk0icB3buwriESJEbz5VjRHTk40UmeGBq+DK4vtg63Df62+nklQtBGHeRG8B5zuggWz34BWtWU6Ioqs76hHClqwsaEMzY4oHml1jfg6JDXnedVuHXdZxR9ETDMvxmbdrps0xBY5BjulQ/vuvmCERw8taY3he2x3+0CTa74OAbASUKax5ldYSN8FXrr1H3BFHopuqlg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 i1WjSzvlhG5Zdy/C4KGy0Pca9bVJgKiQXif8yu4PzGk4LdvK9zctCzb5lwEWVpmT8SHajC73bzy+d77G/zVB4e1JYPW3RufJey+oWUFeeZhS/kcQMMAPyJOEgI3shDQbDavY0NyVLmLOHPkNyo7Ib4Wkztb/7mjoB7XEvgUjlIYEuOCg5yg9ebqcDTgZwjYNZRv8wtzcd2/wUHCqJC5kRPV2BsENYpa42KSIbqMk6chv546dhq57UqBIbBAyd24oWCHpiIpCWzFPzck19yu6UwPjgFooYIlYV47RTm2QaUINLSoBKI3rB4YB1Kg/70uS3w+z58BUoU8udPJcSWjw5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10552
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1a73d0b4d168468898228c879c7bc7a9:solidrun,office365_emails,sent,inline:f38cd5633cd2c55ae12c4326183bbac4
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7034215f-cb06-4b6a-e43b-08dea864deba
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700016|7416014|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	olSdxPac9QbhiEOLpApJYxG+aA/j1i5+rPuQ9iMbJdGlskHDGUgAJG9eaLFqmg6AVOffF5F3N+DLIJjbFEX6yRI8qanmqyWMrKa1STbeJdCDjgjNCD3DQJChOyHN3pDgFE09W5IMKM9U6N7ZbgMZ+1i8wXFVmFK7AP7c30pAjAnG9dYbj6q7SphCUrYGFef0Clbd0auik10sYt6xhX26CWBfhnZAd+eLQF124VgSwJQhnOhjfCBXQ9BjioiHNsnhFQKp0j5/dX1i7jUslhK+E+dzbt77qRULgxlfZ+LIZslnoJH1xCORRjYzXAFlOCDFFZME9dGLiLwcl8myhB6WOwneseeQxu9R0elEztJLBM6GhYZpLg/l/oE014GUhr4XX/vRoLc0X4t7d+IhybuVa2gE48lENWKB09sBGlKLanV1IXOsaTe048EtKhZ/2arP7pfoH4xdNdo9YrdO6x4LPxnZgrx7871pENK09MZ7Jyk5rwX9FxdrqI8Xuo4f8U1Vrrw0uALKTw5+qkuW/skGmHpkwL19GCxn7606ZbQwOi3iEktk6M0WrtiVh+uY+pgbz0P7adApxMrEUYb3zh+w14usfLmn76Xy3wHNTcSCGnoOnM4pQI2OPpZU1dxij4YKohXiDm5ElvY5SjyaPeK8KsZxdjmFnolZbe6Y0O1n/Etrn3QRSaEOgjWz7Jch6LCaVecu3IM2kL2tFT132Bc0njQdfQBx1LSbezVVzFXuWPQ=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700016)(7416014)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nLIuuQP/T2+PiUgXhpfD1t9HFBBgS+yVJaYJDUyOMo3QboG7EA6FjmUANY1Yp+cxGMkMO3e4oMv5xzMgYwF9G26zGvIP+4uros05uZsgjbqTyo4+07Hr7eeMZ/1X78CdxQlADjsTzYSZ9Yx9jGoCI5Y2g++BmThXWDC7yuOLHU8s2OShqKYdft+n3Qqe21VSBNPmIe3djvu44lRKEkfhHnxO0wJPsYxnm3Rsd/yiZN+30p7232HNZVlZY6pli791y1NHvN6E0E3VH6yZwq4KZA2dhgLuemVR8KqqkWEFT4S7KvBHaZmfZKFYoTFLqhz6yZkLGzS0VC9q0W8ApySP7j5BYlFPhc+2PvkinPniTzA3Z770d8QnY8D+u57KelOiIHzfpkRV1neZdSTit2PPRxCx5nXss+lnNEQdQZ27bjXatg/60EcyphiRuGiHD7ae
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2026 16:07:28.7557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 688214ee-58f0-4f0d-ef3a-08dea864e8c2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11927
X-Rspamd-Queue-Id: B25BE4B2C35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31873-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,solid-run.com:email,solid-run.com:dkim,solid-run.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

Add driver support and extend bindings for Renesas RAA215300 PMIC 32kHz
clock output feature on pin MPIO2.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Josua Mayer (2):
      regulator: dt-bindings: raa215300: add clock output
      regulator: raa215300: add support for configurable 32kHz clock output

 .../bindings/regulator/renesas,raa215300.yaml      |   6 +
 drivers/regulator/raa215300.c                      | 132 +++++++++++++++++++++
 2 files changed, 138 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260502-raa215300-clkout-c3ed84024888

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


