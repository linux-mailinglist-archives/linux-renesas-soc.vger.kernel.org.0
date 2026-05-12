Return-Path: <linux-renesas-soc+bounces-32484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yABxNNcnA2qw1AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 15:15:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 074AE520EA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 15:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 192AB3153778
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 13:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462893E1714;
	Tue, 12 May 2026 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="EJ2vtzpn";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="EJ2vtzpn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021101.outbound.protection.outlook.com [52.101.70.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E34D3E1706;
	Tue, 12 May 2026 13:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.101
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590830; cv=fail; b=IU1tP1SS9WFvuSoH4FRustP28RtESBjHSYk9PQkr8tEVQFNIVTjLAhJ9aUtFtFT7VDD4C9C4aGQ2PnaOZNdWrcXUaqtTAt6OYe39O2ZniDn75GqflFTz9/Aw+/YZk8RY4f13TR1GX0CT1znv/5xGOVZ4+A624+M8Yus8g+3i/jU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590830; c=relaxed/simple;
	bh=Dc+uPP78bABY5UKogbJFOL+mm0Jvm08sOO4N/x+G5aQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=uYZwQT/Jp7IkcXfKtl4WQKWwUXMraMCSumDwg7jmZuJWLjOzC6uIQgZ6yEM0GSonpqXIwqfvaiioRyGMGvwA2dn9OFPrrVcFIkEqxAPPVSr63EhPVcLO6H3B9J12m1SeGuaAP3NxiB092pQuAkXER45LBUBDoGSoxZLd5Bt0PQU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=EJ2vtzpn; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=EJ2vtzpn; arc=fail smtp.client-ip=52.101.70.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TAjU+/pQKIfD3dLsKG84mmqkIYY3EkEg2aRzmr0S0T+/P7PRusQqlNGB4wnNYKxq+dMDPmYkYF3tMbKvbZ0Yz10FwVqEwWePMy6HUOM1pYjF3bRSkwjNkWG/G9Lkb/WTWTOlUqps0hd0Fmtb9yIcQAk+EJJlrYWkqQTOXygLy9n90DXGjw4AHNfS0B5JnRkZHf2qa0o/NgY1wvCZfOvynKucJncKiULsNqQsWhss87uVtziJJGCPUNiw+thKO0P+DdKqGz/br3zSBaIJ9IWhmio/4M+nh4D3FOJx1JSTrLQTrCA/8qjKeRKTIW4bOe9zkYlTY0LRkjApYGVz8ratgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jdqbI3QBpTrNXMnDd2IHvkhKPq9ELGt3lnBxg75T6c=;
 b=ZYgMU1JxWSqw4SFFrWmegPWgUrjMfgUf4pFmMyevsoYU/cqKmhmdjI6BBmhQUYshdTXiQP511wjojP4JzEE3v0+MfktwXrjqS5HgIj/4XnUCYyUzYQ88CmRAWUHmLkPGsufIhMWSnY/6ADiA+1H2ob/acVqcyXait1s+6i586aJzYSeI4zmx+ZOGbSjMlcICJXiR7Zf1/4LD+ZCRMhqXFBYlsnWa31GrIjL3yVCTeuYJuFKNXQsHJGPSOH/8HWxbkXDwBsSvf5i5IAHsv1jm3+QBfD9/2/uVhNZvUpZYEepZIW3F/NOQhBIHB5s3KfUYzJvioTyI1/Yf4nMlJl2f5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jdqbI3QBpTrNXMnDd2IHvkhKPq9ELGt3lnBxg75T6c=;
 b=EJ2vtzpnlPmdXI9LqEHOlOZ26FR1o11zRQUTxQbhVe3zJc6RWtHbN97qAGGj1rLJyHqUItMZdtRl0kiLC6ICmHkDcZm/eh6fZnv8t6gYP/a/3nVVEZmIsdUAFM9P14kco59oRzgdFFLuhPdKxwn0tFTqRhmznLXxVdddqK6n01gyfnHj7E2Htlarhovle4xntT+fwhqBlrGMQXbjKtTMoXkCMfbsZX1muiK/3jKxlUGaYf2wXOen8gfSr/hR0lQD8i30kSkvgDVcLuXvhUI3EiXjbGAYVTL045nDRFXreY/uHUtMG2LXscNzDLS1u5jLYvhqnmCoystVfOce0ZNWmw==
Received: from AS4P189CA0038.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::10)
 by DBBPR04MB7531.eurprd04.prod.outlook.com (2603:10a6:10:20c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:00:24 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::a4) by AS4P189CA0038.outlook.office365.com
 (2603:10a6:20b:5dd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 13:00:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 13:00:23 +0000
Received: from emails-2489745-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 9221080483;
	Tue, 12 May 2026 13:00:23 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 13:00:14 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnSiIUl3bJQNczFusYWOPZVNbYkGpVrIUuEWm3hZdXLZeuY9K86fCHkrLPY9wGGOxdi3r/wFHPUkBCvT74TeFS1uTNDd5/OwlrdcYDKfyXLH+KDvlobtqUxeNXu+Idwop08gsSfbyhtvsEMRV6z2wCtz829WagKibpxPiIRLSPHOL20F8jlyE1EhoGR0TkzceWIX8IiA5sKUAvTcM8QEAZPTId+nWMskQx7e7jacw/psoxiU70SZTp/A36tQ2y6I0Pqd0YKXwJE8wqqgbY7QzpsXKJlZejWzFL/zzBweLie5oStmaTv9R5VU+zzg9jEnNcsStQ+g833i0xI0T9uCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jdqbI3QBpTrNXMnDd2IHvkhKPq9ELGt3lnBxg75T6c=;
 b=jkxcUfZfJsnXZs7RkTwulrM85vy7ooHQHKxjROEmM4L8nICfJ5QN5IPLJpx6dHOfFvCog6IKSp6yytbMBaFV28ET08UyZF1wxrjxDLQ+PzFTZ0+fOZQSm3cUaC1IYcKAhDzmjSCUzUZy3+MT8FG6SVNISklZniF5nMF4tsdOPsu3IXAH/PqB13tFcu9FubX4QNtGnOJeoqRqDK++JQ8DTVaZ9gZLU4uHTq3pNqrh92Tam9PoNdM0GBDB/ZV4UrztuA6in9EojFWQRmeyWIsg/SFm5w1YUnjKlwNlS26n7B8zDuv5FAtH/36mIpemC0ex9+p7DMgVXcQ6584dV5GqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jdqbI3QBpTrNXMnDd2IHvkhKPq9ELGt3lnBxg75T6c=;
 b=EJ2vtzpnlPmdXI9LqEHOlOZ26FR1o11zRQUTxQbhVe3zJc6RWtHbN97qAGGj1rLJyHqUItMZdtRl0kiLC6ICmHkDcZm/eh6fZnv8t6gYP/a/3nVVEZmIsdUAFM9P14kco59oRzgdFFLuhPdKxwn0tFTqRhmznLXxVdddqK6n01gyfnHj7E2Htlarhovle4xntT+fwhqBlrGMQXbjKtTMoXkCMfbsZX1muiK/3jKxlUGaYf2wXOen8gfSr/hR0lQD8i30kSkvgDVcLuXvhUI3EiXjbGAYVTL045nDRFXreY/uHUtMG2LXscNzDLS1u5jLYvhqnmCoystVfOce0ZNWmw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA4PR04MB7934.eurprd04.prod.outlook.com
 (2603:10a6:102:ca::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:00:09 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 13:00:09 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v3 0/4] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Date: Tue, 12 May 2026 15:00:04 +0200
Message-Id: <20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQkA2oC/2XMQQrCMBCF4auUrB1JJiaprryHuEibtA1oIxMta
 undTQuC1OX/4H0jS56CT+xQjIz8EFKIfQ65KVjd2b71EFxuhhw1VxyB3i1CIqiiJZdAGqeU1rq
 06Fg+3cg34bmAp3PuLqR7pNfiD2Jev5RcU4MADqXaKW1Ms5e1PaZ4CQ7o0W/reGUzN+APIcQfg
 TOB1leVQ1PuxZqYpukDNaRBZ/MAAAA=
X-Change-ID: 20260502-rzg2-sr-boards-37d556668a2d
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR3P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::18) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|PA4PR04MB7934:EE_|AM3PEPF0000A795:EE_|DBBPR04MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d6f5cd-3228-4cce-ef16-08deb0266e53
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Iu4RKDx/l2qNp0nI4O6XtJP2S4wTyBpWzBfEd+zC0xFngN6bNEnvkpvgvnxRLP5yxO7/kzKUBX5iaCy8iO8aoxzDasv6Oy8WAp5ORo05zIqlRnInmOmkjO5VoQTKFd16mKjKUUVU60aaVKMS6sYPb7Km01JjsOT4QOm9clex48FlcyN3XCHW42My1nZj81KHsaWIduRVFXG28M4mAfUl4x5vWgNII5pw8SeWyzYy699eYmzGoaqJpzniBSFCaHDN/2UD17SZSuUr5OxfGXaur26DSmHnOyUx1GrVrQgV1C51K8RkpK6QEUwc/EiHDXJZ8IS8fbzqYLGq9RQ8nu49SSzBe2nHHMD6ayWqqMFLTRe/UHGZNvtnnOX6Q7ZDo6XFbsvE1e8o3ehY0MUkU5CXgv4H3vmlOEUONOPGLc1iEQ0+ttBa1P9uefM1BGyfC9yiJUmLcBFP2m9LvE64934AINF3brKI/eXRIAHl7kEoDgW+2FbrTVLG926fVh3Am4GXnhym6zPTrQ3Kwbf2CPII5IiVkas639cH3DnYuDCLH1hKhPlXSwQBbxc4Tq8jVDS2BIXl2Ac4/kyhi+b8kyHmDNSeA7jczqJwQhx4Oc/OkvUbzhUJb+pkZJlDAoBipX3SKmPpO2ApAhtxTutvxswWkI7vlUq/eDMS1cEI0vRfTIuQgHCWcE0fHhLri7SMDNkepL7rn09IFreYJlhvt3GhukdaIOKwifYkOMOWi6KWg2z2rjyYlzen8HfwWbWBA22E
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Th3+s6Tnw8UI6DpCE+nixaNdb+t4gP6XI3S3zicmEYtlLRz7wk+vQjChYf7SkAjm5lo/ZyW+eZwLH3IrP+drb3ICzxm7MN23HfsoRehxb7AbIyIideJXVMkqHWs4Qtuw2y+rvzADsFyUMytJpU1JIVycrBasYg+rLWFkkhZ+vUMK7Xic/l7RLj4phmFWYJoXUeheIU6PWiTlaa9AmxsqVx25/nc8R1Dmys9afXSW00iJTj+Gnpqa2EKIlBFJqlyTd2vUl3wQpgy35TsXN35WbgK64Xv7i57jylifZU5TtxX7yWK3D+LoYqHhE0FSywL1hUpJhEhfvJChLVh9490bJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: cab11be497cd4c64a7ccf796e6a22964:solidrun,office365_emails,sent,inline:7a8888ac466080aa94ee14b06e0b315c
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6982a4c5-d339-4d50-3824-08deb02665c4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|1800799024|35042699022|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BEc8eY+DGK95zzmXir21OeC7wH8vbVAnJAjkYDeh+g2V5Y55LXHSv/uA6/LDUZQV02aPuAdVx0jCQEYb7axqQ66HfotEs8mu9ac91NBAh8dTGYIFyJlprMBn3w31uOf8lwSspafMSlHaYEoUpnNCJb496Qb5Vy/MGggxENkvCL5eK3T+OAx9Kvi2IgP9EFAwcqR4tn+t4Am3Lfh1BCE2yODK59DROeyBY0glS/wH0LOI7jOYmCvVa0EGXSLSxiW3QkudcCVQvkl59m3/6Gp6F+Afka+oTeK1/7pzgFQfwyBeZXI8SROe4ERmdzM6zEQi0ng5JrTYT6noakPfgTvYXwLfT0rzQY+OsOQeFTcLJErL503o6k9TM5Z1SrURxBaSVUAzQ+OMM7b50evXf/6K8tn28wQs5eWBvi3BHCGdHM9H3uL68VLbsNsWjKNJRIr/4Kn5qZ041VwnMzspGmZQMMdDAC92a0AHGoVdecwQ8YFYJtleG5kZcOYWZODNXPX7krDmRtFe5AdeW3vhKXTBIQBCFYFwh0X1UlF2srqPvJCQwFX3WesHOVdmMWQSl41JstAxCqdsJN17UYdvdElqmeMmp8OIN8YyQV/IY+PliG6rRUSDErFcIZD0KHENqT/wtnxXGTbT4AroQ7H0PK0D+xrTM5ztE5HE0nnx1OLKGdFUFIIu/BF6DbogHC15/GDFi3MWbdL4njbE2KzXaZIh87PSHfFWvne0TDLRk84hl1k=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(35042699022)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pqYafbOZ+cSXdsOVwyIHBaejqfFDXi+QM6Egt2jIAwEDSKjMFCPcft7yAmWQRu42k8s+M9y5+Z2VLOVmOnJUpqjNqCH3K5MUA8VDVyxHVovmhHAJ9PLeJFElM0TzZr1R/k0fGPpqrAeebMcInFTQg8aZHaGqiINozQL6Tb5mTBPJcpWQ7A0p9/0VlQPtWEyERtdWCnGNK8glUtZHlOooBRmBnifvxgqsPTpruNKbmEHA3YKoB0CAdZ8yNafoShWoWUdIXGOSfQzqvG0JENqnMuoKM7CLL094oHLMgJoGYIrix9MhwpWB7gGqh6Sn7cj95E92I1L36F7k6SoidstYgKA0if/Ux1xGSba4oG4UvISeRP2xbbvf93r4cIF7IIYQ4wtcyCCY/Oscb+JF6xKIjNO1u9XTXss2UNLVPjM6N0X71sfSM0me0tRMFB1MEY3N
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:00:23.8635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d6f5cd-3228-4cce-ef16-08deb0266e53
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7531
X-Rspamd-Queue-Id: 074AE520EA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32484-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,solid-run.com:email,solid-run.com:mid,solid-run.com:url,solid-run.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add support for a variety of SolidRun RZ/G2 based SoMs and the
HummingBoard IIoT Evaluation board.

Bindings are added for all SolidRun RZ/G2 SoMs:

- RZ/G2L SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
- RZ/V2L SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
- RZ/G2LC SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
- RZ/G2UL SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/

And each supported carrier board:

- HUMMINGBOARD RZ/G2L IIOT
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
- HUMMINGBOARD RZ/G2L PRO
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
- HUMMINGBOARD RZ/G2LC BASE (Ripple)
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Device-tree are only added for the first board to reduce initial effort.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v3:
- Added explanatory comments on won't-fix sashiko findings.
- Added cap-sdio-irq to sdhi controllers used for WiFi.
- Drop redundant addition of common device-tree overlays to install
  targets of G2L(C) SoC.
- Add common device-tree overlays to install targets of both G2L and V2L
  SoCs.
- Assign kbuild composie variables with := operator.
- Link to v2: https://lore.kernel.org/r/20260511-rzg2-sr-boards-v2-0-82aebbd27891@solid-run.com

Changes in v2:
- Added relevant product page links to each commit description.
- Added product page links to cover letter, thanks Geert.
- Link to v1: https://lore.kernel.org/r/20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com

---
Josua Mayer (4):
      dt-bindings: soc: renesas: Add various SolidRun RZ/G2 based boards
      arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzv2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzg2lc som and hb-iiot evb

 .../devicetree/bindings/soc/renesas/renesas.yaml   |  37 ++
 arch/arm64/boot/dts/renesas/Makefile               |  33 ++
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |  16 +
 .../dts/renesas/r9a07g054l2-hummingboard-iiot.dts  |  16 +
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    | 572 +++++++++++++++++++++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |  26 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |  17 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |  17 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |  49 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |  44 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 421 +++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 374 ++++++++++++++
 13 files changed, 1642 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260502-rzg2-sr-boards-37d556668a2d

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


