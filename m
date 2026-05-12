Return-Path: <linux-renesas-soc+bounces-32485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAC/EKgmA2qj1AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 15:10:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF9A520D09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 15:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A74130BEEE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 13:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32693E173B;
	Tue, 12 May 2026 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="lWe0tdqj";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="lWe0tdqj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023075.outbound.protection.outlook.com [40.107.162.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9543E1730;
	Tue, 12 May 2026 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.75
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590833; cv=fail; b=H11NTAixIMsmeUrfvhHaa7EvhD52J54nlw28Bax3VElaQWqpfLJmvf/QHiepxqwGNUDTuMHv3xt6xMjd+qaw/0pMM7QgJIalWHWJwubh5+NaYCIs6bGM5MK8jthD+UNoRu3D3HnmENOMCHzBrQ6DHpJaOYOHWMw+Gze45c0IV5o=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590833; c=relaxed/simple;
	bh=oRk4bC1VmXu8sAbC/B7c3E82keZAQVo9nO7MwI06oX8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PjqzKYcignmkXGCooQuT/k3TE1cz4SaHgxJf/2QW9O1nrlbN4DbbKJm475QHl8czmGvMoAGKYboMf9OuhWFTpvvn2rsKXFxP3pAhq+9Dcg4M3KNIPn1wA+BgpcZ+GXs/IFvEDXcG2D/defGEiA17D6ACN6ksBkW+YZrwrxUSpLo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=lWe0tdqj; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=lWe0tdqj; arc=fail smtp.client-ip=40.107.162.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wafYK5z7RJm28fjnCTIeLlhQO+L0OFQjX6V6p3RsJcQkHBvDxKyy1BxVQfRdTm4dy58mOi91jZdlkBSFFTlL20SCGoH8JTK392H5x2A6QCjk1z6xlrBco10m48eaSq2pTOric85sTR54t61zbMeIDgxEwJ4C9KjB0qLcAY2zjRpgNjzwWExP3th9Sw6t0eJRxn1fk2Dxy6GD9UN9PWmHTkqSr62RsK5MH7Zx++RzJp/pEZCaK8WorOxCWt87d5sRsvXBKGDrxud2kR3T2FlBLf6R32dI3NJYaZa9veyCR4u4B73Hm6Ub9OIsddJ6h1cIFxxG72y0+KWY+qRmM4OMeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SZVID+VHjZEP1+H69YfJupc01p6fFrbnK8v/Trlso0=;
 b=R1Lveqx5cAfkpOwSIvgSdzJ5cGz2FJuQPyFQIYd65F2GBNhTetDTJbQIeldx98ZOMGcareaEOVz2mgMR3a3zB6TLlk6Hh2zyWIs8NVLmZmafxzxjMB39/n66oAKcnAlGf5q2xP8vOW42g1nfoFSGTVu2qWwsRP5MJXbNWw7TflIcOONi9dii9p2oj32FlAc7MqhF21LQcJwtE1GXaGGT9oDUNd+PHTXtScqW41TDRHJosgc4xW7FgP3dQ6K2tbZ4qDbui23Hl6nlFPcYO767HHBN9230c3X2OdwXYBQM8pVip9agdi44yn/3YDDplN8S3aHKLrny2Koh8PTkpxVxkA==
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
 bh=8SZVID+VHjZEP1+H69YfJupc01p6fFrbnK8v/Trlso0=;
 b=lWe0tdqj1quK78+bQrba8URJGat4PvTufqZvqZxDThGfqJ4HvX2dH5mswRPcUJZdGj/yV4wqNWXze5wBzxGl+Vu9tiQ2LO3EA0NXCYluOlONBu1d7GisLJZpZiWCGJvguQ0QQ3fRu5LGYU5HqMO9Ab749vj7S63sZclu3/HYYxRKoUKwblunMOAraubFxG0JyZFMVnG6/sRYQPxdOjrKWfTroFsVMUiulM7Mb6F5G/RrvIGG+AId1KMD7jzFsH69Ku7+5pV7HD0K8hB3t0zqmF68/vYwEU0ULxn2mlowG1CE0RBTV5u3M/qTy6KvDoQmB0jhZHymq0ZWZQAY8DMeYQ==
Received: from AM8P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::29)
 by DB8PR04MB7033.eurprd04.prod.outlook.com (2603:10a6:10:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:00:28 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:219:cafe::25) by AM8P190CA0024.outlook.office365.com
 (2603:10a6:20b:219::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 13:00:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 13:00:28 +0000
Received: from emails-9597773-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D75D780483;
	Tue, 12 May 2026 13:00:27 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 13:00:15 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PT7YjgG6aNgYFZgc9AgzclDR+01a/d3ytH61TOxWTZFhOesboTLI5GJYjV0Aa8z1fujuUoE29xEL6/3/KBAolhGJIRrWW89Sj9rB40pAQDDx/QO11eP9qKhZqB3cnXD2Lp6CD3OokZUm0tIqoRDKOLAvg3L6zNnG7DFhFeqaEppsv0rQA0yBqvgr/AJGQzgkkIjDLxsKBLPcTqZCWyVKBcANBS/fEoMZ186gyRzGTOG8uQGuf24oZ2vQgdIhV5jbPMm7ZNcI1GJOyF0XDXLElT6HWBDTAc8G++Ml6bAxKOo0yit/YBKzUpGz4gaAJAi6J3uTb4txE6tIbOFix8UQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SZVID+VHjZEP1+H69YfJupc01p6fFrbnK8v/Trlso0=;
 b=QC9uV/+daCup+5vbX1LO+r8VwOKuRqfHD7S9NsDSduXyiI3UOy8tW3+2nWBV10qVhijobEwwxTj1M1+DcL1I5s/lqIdopEjzXvcPiLLYQE8EAZCWcgEM5whgnBgUdzCUKR8EzfpTwGOBIslPLmKcApxDtLyV1YW5louF5Jps1HHZWTan4CtzPMXRPO7GElRPmtapQzdQKJHmEgjfIe4+v441RxG2uGQozorndkJzleJiRkDRYFAeLFspOvuJuIAJBj6JIG4w23VOJ889YxEoMlLpmCp+meniGuzwW8AfsRTirMspDQEVspuB7kxAuWk9o503Y17SdzJ2d0C+ieWt9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SZVID+VHjZEP1+H69YfJupc01p6fFrbnK8v/Trlso0=;
 b=lWe0tdqj1quK78+bQrba8URJGat4PvTufqZvqZxDThGfqJ4HvX2dH5mswRPcUJZdGj/yV4wqNWXze5wBzxGl+Vu9tiQ2LO3EA0NXCYluOlONBu1d7GisLJZpZiWCGJvguQ0QQ3fRu5LGYU5HqMO9Ab749vj7S63sZclu3/HYYxRKoUKwblunMOAraubFxG0JyZFMVnG6/sRYQPxdOjrKWfTroFsVMUiulM7Mb6F5G/RrvIGG+AId1KMD7jzFsH69Ku7+5pV7HD0K8hB3t0zqmF68/vYwEU0ULxn2mlowG1CE0RBTV5u3M/qTy6KvDoQmB0jhZHymq0ZWZQAY8DMeYQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AS8PR04MB8229.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:00:11 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 13:00:11 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 15:00:07 +0200
Subject: [PATCH v3 3/4] arm64: dts: renesas: add support for solidrun rzv2l
 som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-rzg2-sr-boards-v3-3-f033fc96c906@solid-run.com>
References: <20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com>
In-Reply-To: <20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com>
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
	GVXPR04MB12057:EE_|AS8PR04MB8229:EE_|AM3PEPF0000A79A:EE_|DB8PR04MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a38826-b420-475c-1d62-08deb02670e1
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|1800799024|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 i26vD5qL1d1GIj4NHkUU3zc1VO9dmwXHgNF9Ijjfs/pkfs6UhknBbx0C+atG+abOIBU5ce4qZcUOX8Ft9SnLIEwd6/V87U71x3YKWcoJ/pzrndx/3XP+mg0YNRnyQ7N+mQTSkiXE8kGLbqFTGSEKC75Boo6jEbBuLnU0pSOxz3AJ0BDAD1S40NhNiv/Dhwz2yWwsSd2MRtMU1vrOyYwO473vc5IXT2P2nn7HDM7eXb3h/3U5nSKkxmCpMZsKNlmg8ML64Iv1e4j46fj1B8RrQRu4KOuFOkCpsV80y97m+n7JnetCpWgEe/gOm0e4LLNY05waXByEAH119HM8uQ6rYCV0VL6mOvwMhE7xFINWR6OSNSm1wmjMT1Z6IiAHNLYTxf/pYcGWeN3NoSzxkPtAiLkh53f+/wpWUax7alMbiDgkjGL0KbZF8O9RQOs5Q+1myaTdjq2S/O2RFAZwwWLOnbHXTi7HtPxdcmnHAyzMWK2rKnvC59X32vXWq3rTwUnI2oEMMbPXVzci2TBge908oMYto3wTdVZAwqPu0MOed4mpANArevwdjinwtxJF1L/e/OJ45HjxiAnfbqCFtWNmwSrTXI+bx6GoUW/TjVz1DVCIBFsQExuePBwlaeoXarSJyb4OUp5JbVeLQ9mwDNNSS0yqgXD6YvzLnsAMCgyoJE2OSTTG9N1ReEMz3h13ycNbX7m3HuIGThL1aYAGWrpgWcaz98RFJpGNwmuSmciOYxxDfD7jiclg0FydVtj6QHx7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 TjTnwIMELZY5Jwq7BwKgC855u769TPBfwgrsqu5xth1Nlt7M7BkwtPjRQ+6faNIGAldOvcfdNWK0HuPsAPJOcGNz/05I7MkCrVQf9GuWJI3D2COKjj678joEI68Y4oHxRg45s6P8JpBvds3D9LZKKwm14WZpZBqiM/lhG7sMbnDPZ181f+O2j9zTq3ylYOI7e7H8lmhgntVjJLCcuiiiiemSdcRTWYxFFjSQk5lOBX8ucdt0u9EdawYlfzFdwlIobdGBFkPFxczTElb7HopUvjQ6Mk9ch6QHlpGfyvyZTyl7DCqgh6EfjGZNyvLFM8tjPldb/0hEq4A/EwqmOLKgDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8229
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1cf8c014f4784438978112fd75266f1f:solidrun,office365_emails,sent,inline:7a8888ac466080aa94ee14b06e0b315c
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	79d79d9f-b777-45f0-e17f-08deb02666f0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|1800799024|35042699022|36860700016|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	tFuQjbjVSzGlPf/X4qGrhw069d6lprE75+t4GlWjmedHxJn4TL/11PcDTBjnMNtycTHmep/JtuquaQbB7aJCxbug3jMPlRv5BpbsYaWepTIUSAz85PkgURmL1rqemDmNzNkPTlu06uP/clRIIqDuOfj0qBUzg1WdVidpPRBf3bxqtqH5f6gagohwJpaVvDb6bD5ZAK+LziYP+5i/dFApZsqUj2/07Z1kOWm6HaX8ARTnUllpQhRf9GHiifefbbAuQrvVhtWet5oqblMj0zJM4IGGkb5PzYdtu0d3efXHuvR8ZmGyqfnzCEL3cgPTwbLXoXKE6pffhY86WpQvX0Cm8jSKUX1bfIL7I61dqDzCqcz07k3rcAIAqnlqpu4AZ3dIFBX1392+ehszR58psQrrzwq7w2hyV5IDoLvYWDYkJehLBrUEc0Na3/XcNQovbuAJXbKB/HbJG/MludCb3dZUkqiVJpctfYjLlHL5FXYhnTSE32bGhO8F+mYKZZCOiFP+iD77rcKAvaeomvKoza/rZ2NFNcwRSLfH6grgC0mhJeA8gpb+dUSMBEQFQ236cmhAhBFVU7Lnuo23DkHCwUpFv3qLQEDYiuxqhghTCZ8qTSR6fg+EP+s6WHhLF4CR25sCYLsMZ6ccfxgMt3eaW0oB1CAkbzpzyEzKAv1KOOjYjqJbsxcQr6QWimF9fMHVTKqp06F9SndneLQgB6D2weUnNVIaPeFiiiv2tHuMhIu2Phs=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(35042699022)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8TF/v8sdIzc+R4k79Nj+bHZibS/WG0VOh9QDQ4SeTreXXY+MxODXYAQBzU5PqW/0wykB+LLY09tRI9cGOEeHAxYaXXpkREs9o39TNaxoEap1a8ZyWRGa7JJoy+PK9G8H7O6ul5+VKDjbatxvpU8Anw6+esXThlD1HZwqlHmn/Ww3f1IGyGWjuDT+oDN/rh8KwxrizFTpRM8fcBxcENr7D+rWCdUT7i2ugk+VW4CvnzNx1ugRLq4BBSzwaDJEBQ8sFU58J63zg72i8a9CSLSdl+8dQ56AKnVbYrAVWOlV99De1SkOquAClurIoxr43NcTrjQtQ4h7kBbIUDhD9soQA4Y1pL4PApgsr0YwYalcLc9LQ8PirvDwkFTjp9SnQiZQz3IMVbtO4U58IjrwkFL1IMuj2PyaSO3TMx7P8B8vBatVGS8uIebVXwkWOWWdUsjG
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:00:28.1199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a38826-b420-475c-1d62-08deb02670e1
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7033
X-Rspamd-Queue-Id: CAF9A520D09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32485-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,solid-run.com:email,solid-run.com:mid,solid-run.com:url,solid-run.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add support for the SolidRun RZ/V2L [1] SoM on Hummingboard IIoT [2].

The SoM features:
- 2x 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 2x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)
- 2x CAN

The RZ-V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
V2L is adding a powerful DRP-AI NPU which G2L lacks.

Due to the similarities most code is shared, including DT overlays for
eMMC, microSD, and RS485.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile                     | 11 +++++++++++
 .../boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts   | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 38163ce845e7a..cff17cb8574a3 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -188,6 +188,17 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 r9a07g044l2-smarc-cru-csi-ov5645-dtbs := r9a07g044l2-smarc.dtb r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot.dtb
+r9a07g054l2-hummingboard-iiot-emmc-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-emmc.dtb
+r9a07g054l2-hummingboard-iiot-microsd-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-a.dtbo
+r9a07g054l2-hummingboard-iiot-rs485-a-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-b.dtbo
+r9a07g054l2-hummingboard-iiot-rs485-b-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtbo
 r9a07g054l2-smarc-cru-csi-ov5645-dtbs := r9a07g054l2-smarc.dtb r9a07g054l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..d77a6ff163bea
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g054l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot.dtsi"
+
+/ {
+	compatible = "solidrun,rzv2l-hummingboard-iiot", "solidrun,rzv2l-sr-som",
+		     "renesas,r9a07g054l2", "renesas,r9a07g054";
+	model = "SolidRun RZ/V2L HummingBoard IIoT";
+};

-- 
2.51.0


