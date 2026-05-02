Return-Path: <linux-renesas-soc+bounces-31874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ0AMloh9mluSgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 18:07:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD234B2C51
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 18:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DD1A3015886
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 16:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D829B382F10;
	Sat,  2 May 2026 16:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="XjlvEh2k";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="XjlvEh2k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023102.outbound.protection.outlook.com [52.101.83.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83FD36E473;
	Sat,  2 May 2026 16:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.102
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777738055; cv=fail; b=ebzHdFETLtRIqxXENs57ZMQKEp28hAudk3OfF+6f+sBy8lLMY1053tER/5bs8ol8YQcCmUj9J8ztd5dsuej3jbJ+ZY5Gd4sNheLj/vgtP6wQw5xKdlaZzanZqyNBToKz256p15x1wW6yA78ylJOzOGYjaI29N2pQbAeirhaf1k8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777738055; c=relaxed/simple;
	bh=JXkr5f/Z8UO23dQyGMHOpmE5Y0WKAp5HDT0RuTFGBGQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nxevXXrXzYsn44VRsuy702DrD12csr9q4rgLVa2PnQij6qpW7RE5djmUZxLCkS3R5sZNO8v1iClPVGBK2uS9b78dKEBSGrV8jS9PldfH9yKdgHxwZlMStfaj2CC/izrtHkmlt33vtsnt8Mlg0vKvGxG5KtBN1EAe3x0OeQGUd/Q=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=XjlvEh2k; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=XjlvEh2k; arc=fail smtp.client-ip=52.101.83.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WKfdmL2B+NBoV0OdudYOiZt/i70i8zZOT76xVOv3GHleb7PHCfuoqaI1Q3p26j4f7w7z+/MYZ2Ox6iATewg3zWQLFcNEw33crvMHsKRiFFVLvU9ec9+XI0v5OdhW86EwJxX3/9lcT217i/u7ysLjY5nK1Dg40W0KxbssDUr0QKBcc94TwrMonoj8WTwzmUQOvP36lZ9G/GAhfseeYkV1t7DTY9UPhRhl9X3xgtXSss/HyIrQxx08Fr/X4Xn+k4+n1pjndVZYNsCHrIyOXNx+9OyqiHQJHN7VQtZFtG9qN66jlDssH+7E/LFDuIzbabY+34DU6pCF/z6rjVeeruhoaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNgrwTV7u6aOrJYgHD7SW72awZ1vl5fWt8bh6LpYb1w=;
 b=HIZI9ylkZlUfE6/N22/URLLIEh0Pc4eiTmpYwgFH3JaUI3XkdWTU4ZZnNIlxBpcXJUTDfDkrq4NnSU2meTU90hc6haT6h/isBtKi3irOGRtXsS7BLga6LRZMMGCKvhnjMwEUT0e3QB+TUoDm8oe8324OXg9np4E+3mdTebdy0BtDqg81NQX070rW/y0BA7RR8As8+VGlD4quF16ZNFgGuwiYH3Ds6THP3fgmB0j7SukktHRNbCaFEaCgGRwYWn77ygVpGJT7Y75A84J2tMCWazMhyedRJfDfkpGjXfplRNiaUCUTP0iu20arEYIzbC1Ow1Y+t0sea81Kz101TPg0TA==
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
 bh=KNgrwTV7u6aOrJYgHD7SW72awZ1vl5fWt8bh6LpYb1w=;
 b=XjlvEh2kp61azSMGQP2l9Wxd2akQZ8duwo+HrcWaxCS1gbnygV0ThlvjBgYY5QePENdeNmMfnnursFUQfdb97W+llmfgVc07wHJaZOfxfKNil1UW3v5xnQ7znRw8Huxj/cVc+sfyryWYuEUshmhucfNo+J4EgdzCW+7Kao+1ek6Elg72btMeWxQHqvdzZSa7VEOi/vfAW04OuPf+e2wwC/tRHr4ZPFOmQoEDNf9bmITAQUmVRu7L4s2kCUIHq4JMQcMq3uTvo/xwOQq3fwIBRTIX64kfNj2OjC/C+OQKOIXascP9Ax7PAhX79Dil4t1GJq2ChHt9/nnKvOoZBUYy3A==
Received: from AS4P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::10)
 by GV2PR04MB11446.eurprd04.prod.outlook.com (2603:10a6:150:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Sat, 2 May
 2026 16:07:28 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::30) by AS4P195CA0014.outlook.office365.com
 (2603:10a6:20b:5e2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.23 via Frontend Transport; Sat,
 2 May 2026 16:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Sat, 2 May 2026 16:07:27 +0000
Received: from emails-5445536-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-243.eu-west-1.compute.internal [10.20.5.243])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 5552B80515;
	Sat,  2 May 2026 16:07:27 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sat May  2 16:07:19 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOScQ/6sixF6tzcHxu+nycYkLnvS/bc5fDwA10JYjYg31OZYMmI7n4K2C6z4pe8PGb3iMWIDe56T5FFem186qFVw5TN5CTbfw4VlpHWLGSPrCxXg14RcUqTOiDOdkO64b7Vk3ORoXB2pbsNhlNmNZzLSg1ZNy08e8ORUNiMw3jzqofb7pF9Qu9AwfcalWulnS0yYSQUQSZSh2TN6qSYZTWe5zb9Lsce5hDNyCOHStT9kIKn7T8XNhZRGU+4/chv1MreeCkxQEYRBBPThimaHbFVBRLW9J5Hn1GM0v/i/6E+/eBP9ZdS9id5T0Puaity0cbSkLLC+IVC+W/la9TFrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNgrwTV7u6aOrJYgHD7SW72awZ1vl5fWt8bh6LpYb1w=;
 b=Ih275AuzVhdSEGwa6pdmDzH5KPEt7Imcqzy3pVFpFV0MfwJTqyu7zEoZJMtktE3KSjCYrKupoIg92XZpPrBFgz/cOBzeLNIoqTqDNyWLGJ5gg6F/Xznp8f7griIo74rdJ7n4BdBdIIFOU1kQ4U4q5UTh+5Cd7WHgVqB2mj9aoFElHehsdhCTPYtL9zdltpFft255bQF8qWPaASBALF1RtfbFMaNTd+v3IE8BAJvaEIzqJtlKHZWb242th7NMLl7qhyiZV5F75Fn/ATXT0jpWgbovA2Z7QLaSy8L/DPzyYewJHYzEG8YgGjPaSRNRjNtVr1MLo7Z++i+70gralHyYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNgrwTV7u6aOrJYgHD7SW72awZ1vl5fWt8bh6LpYb1w=;
 b=XjlvEh2kp61azSMGQP2l9Wxd2akQZ8duwo+HrcWaxCS1gbnygV0ThlvjBgYY5QePENdeNmMfnnursFUQfdb97W+llmfgVc07wHJaZOfxfKNil1UW3v5xnQ7znRw8Huxj/cVc+sfyryWYuEUshmhucfNo+J4EgdzCW+7Kao+1ek6Elg72btMeWxQHqvdzZSa7VEOi/vfAW04OuPf+e2wwC/tRHr4ZPFOmQoEDNf9bmITAQUmVRu7L4s2kCUIHq4JMQcMq3uTvo/xwOQq3fwIBRTIX64kfNj2OjC/C+OQKOIXascP9Ax7PAhX79Dil4t1GJq2ChHt9/nnKvOoZBUYy3A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU4PR04MB10552.eurprd04.prod.outlook.com
 (2603:10a6:10:58f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.24; Sat, 2 May
 2026 16:07:14 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%2]) with mapi id 15.20.9870.022; Sat, 2 May 2026
 16:07:13 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 02 May 2026 18:07:05 +0200
Subject: [PATCH RFC 2/2] regulator: raa215300: add support for configurable
 32kHz clock output
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-raa215300-clkout-v1-2-fd1c2a240963@solid-run.com>
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
In-Reply-To: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
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
	GVXPR04MB12057:EE_|DU4PR04MB10552:EE_|AM4PEPF00027A68:EE_|GV2PR04MB11446:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7196d2-7727-4e82-a7c8-08dea864e814
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 I5i266MG+GT9JElz7gqLASaAAAXcl7DVoUPCcZvXagLXskdRSQ5rUFPKXdVKDtf2V1G52juAMvF4vDEUvE3Pgg/Vv/XB+8pBjiHTf0e2vjrZXjFvzSMJERbJh4/1EdU3K1nY/TynX2vDyzwTe50RyAVucrN3S//KtWSSspN/yOhI46JfXYVZpS2GQPgBpLbIcrcD8dql3AO2RmW6AS9607shKa0X6s895zDJ1CMPvl7+fSRWqE/6Z1hJEL2lbOes19YzTqhgPUMJ57WkQeZlfwqvQYgqFzVthcXF1zeUrBYNMvKRJfUS5XxHe+n+xBWYgFzmBCAIMG6D7xMHuwi4i7uOy+0VfodWcINNPXCsRY5NstMaWnVWyKMRB1ll2p1zCLrmaA+FA+4iggqC/hQMXwTCTOkZLzNz4v6ClaB2cyKPCmvaS/PynSZb8bFDf0UvBcxq2XaG83PH79N6/FbEH9XoAeTYJbYyZvPzxJPHat+bEPudSXcAB5baQih2GRKSt2xmZ8241O5Di3Dopw8yKrD3Q2J3OmRe8y1x7peaHIQzGnF/SFby0cLbA1CNO7EPIZUPcIhB+NEEBY2eO9L57i4zd9eSdKPUcaoWWXaSU6jNoX6Iv5xmk3XJrWpQGrftQjLksmorzUrtZdCIZl3Yvywj5/ZKt/i9FmDL+fNewJ7gmDF8eVQME3o7hqIvgX+ChiwIh9dOmORTjYvl50Bg7PeucqkONvAZevjSx+uDjeNAfhFHFry7kHTMNxYUu83Y
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 cL04ouylwXhWIrIoRWiGvTVdB5jA8pTX4Fd4OkJwdxJdft4w7VH7wPK4kkertVE/6JJhgNui5sZFuWNhmOJ6jUVYoubSwl5ryHPUcCC+HCAq28HGP/szIRCsYOxdMVO3dH/ewxw+JA+sxEm/LisNNCBA+4APtwRsZI5J4WhiC6QWUt/6a3khB+zFveg3anbtTGgRleJjSduB63Ko8iDnnX8d2XFIf/eRWz7xLgSKA/FnGXq3ScLQJXokuF1RpbT4gA9DBNCDuxbkjPEnR5bu2LjMNOBgvz5HN5VGB0LK3kgh4rvWcqiVkBJN8muZExR930ii3jU6yH5ToCERtgtEAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10552
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3e96f58512c74f60b9eb523230a51db3:solidrun,office365_emails,sent,inline:f38cd5633cd2c55ae12c4326183bbac4
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3dfd1cb-6e8c-42ae-ec6d-08dea864dfb1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|35042699022|82310400026|36860700016|14060799003|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	LG2MNNsOCSqdWZkNUAh8oPAXeUvT6I/DH4StOzNd69EpKG3rKy56nMNT24T4MttK0asze5sYf+Sd1u9t4uonMkgnSLfJYSjFvZMFmUx4g7AbpEb7YI2AWXfpPI9actVdEBllqt8OGPZQ6yoT1i7WGrazLiGFhc2+u3qZk9t6f71afz0BGknOYmL0DZMZAMKP0ONtwjypliJ/F9xTbdtogUzbQkaUeFmKsi5A/qUqosb6c1dm9A4Enxo4icGunA6tqSm84AXEjMEzS2E2YSpLFffyziHmXix/JRnYqAkUkA2v8SS+iwHOnGdOWo/UIC5MeZOwnLxqYyjmFP+7o2pShqxQLwQlzV0tXrCPnBkKQLZ6zgw1JqzR2u5YnyKRHzlKZwiAd7XEir9kl/mkZn2dE/KcV+Nodglt6+quvJ+y7tB89P6fWppw6ypZ4fZPUcZXOo4Vqr6rMio0KzfXdcixko6Xwe6ssB/NG44YJVGVc0sNfCepl/5CGsB0sYbcFXhukWQVie3io4eQagL1OdKTfJoWKJWiV4pUgIpD9+MpKQYrOtHwZN73w46o3LUztLeOjpRQLuK6ybWBC7gdGVTFLTXVeu9dbn3mhOWU1d25D5yVELQkfgrttsMn0pQ33OIRfMmXfGASyOIY/TfVH4JFBkkw0BVQS6t0a9O97+Vl94D5NgVAWcRAQi3yd9h2E8MFe8IzmmbF6srhNnlNpFuk++JBxid7XbeNPkVQJYYz8Hc=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(82310400026)(36860700016)(14060799003)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	753+eQighOB/b8imWJ3oR00Uto83NH/0kcO439VA7HiTDcMePnxwDf6j1MH81FaIgcHxDVzqZIdsE/tp3/JSZUyeUja/myuG4sPlzKdXtHhVRgPXjbp7WbnvYre5hTtqet0T6OW6/fYoWP4hjx3erv0eNzCfxo1xYn2371mwuZi8DNcXkIFUTV2tW1J32M7V1MXXb4aUiQauc4sMIFY6Q2qiPda8f8IaFIR8t/uRWH5g28HvuJw5DKXscYqqLupfkTVS5VTWCTCEypNDusrEFREZYzKmZLQF5sRa7BJB+b9OJWhW0efm0RhdsEGLpXTSM+PZxIIFaROGlHkSfGp1MACNVt9cHPMoMR5jJTiIFWiKaNhoWSDuUQ+/bcte5/XOEX3BM7QiXFI4Rc7BXAmjR/hNWG91DWCGw5mUfiIVA6KmntEb+ef+JXjNwWVRdDHJ
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2026 16:07:27.6299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7196d2-7727-4e82-a7c8-08dea864e814
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11446
X-Rspamd-Queue-Id: 2AD234B2C51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31874-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,init.name:url,solid-run.com:email,solid-run.com:dkim,solid-run.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

Renesas RA215300 PMIC can be configured to output a 32kHz clock on its
multi-purpose MPIO2 pin.

There are in total 6 configurable multi-purpose pins, however only one
of them supports outputting a clock in one specific configuration.

Register this clock with common clock framework, implementing prepare,
unprepare and set_rate.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/regulator/raa215300.c | 132 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/regulator/raa215300.c b/drivers/regulator/raa215300.c
index 6982565c8aa4c..e66bd0404421b 100644
--- a/drivers/regulator/raa215300.c
+++ b/drivers/regulator/raa215300.c
@@ -27,6 +27,24 @@
 #define RAA215300_INT_MASK_6	0x68
 
 #define RAA215300_REG_BLOCK_EN	0x6c
+#define RAA215300_REG_MPIO2_POWER_OFF			0x77
+#define RAA215300_MPIO2_POWER_OFF_DELAY			GENMASK(6, 0)
+#define RAA215300_REG_MPIO2_CONFIG			0x8c
+#define RAA215300_MPIO2_CONFIG_POLARITY_ACTIVE_HIGH	BIT(5)
+#define RAA215300_MPIO2_CONFIG_TYPE			GENMASK(4, 3)
+#define RAA215300_MPIO2_CONFIG_TYPE_HIGH_IMPEDANCE	(0 << 3)
+#define RAA215300_MPIO2_CONFIG_TYPE_OPEN_DRAIN		(1 << 1)
+#define RAA215300_MPIO2_CONFIG_TYPE_OPEN_SOURCE		(2 << 2)
+#define RAA215300_MPIO2_CONFIG_TYPE_CMOS		(3 << 3)
+#define RAA215300_MPIO2_CONFIG_FUNCTION			GENMASK(2, 0)
+#define RAA215300_MPIO2_CONFIG_FUNCTION_NONE		0
+#define RAA215300_MPIO2_CONFIG_FUNCTION_CLKOUT		1
+#define RAA215300_MPIO2_CONFIG_FUNCTION_EXT_VR_PGOOD	2
+#define RAA215300_MPIO2_CONFIG_FUNCTION_GPI		3
+#define RAA215300_MPIO2_CONFIG_FUNCTION_GPI_PGOOD	4
+#define RAA215300_MPIO2_CONFIG_FUNCTION_RESETOUT	5
+#define RAA215300_MPIO2_CONFIG_FUNCTION_EXT_VR_EN	6
+#define RAA215300_MPIO2_CONFIG_FUNCTION_GPO		7
 #define RAA215300_HW_REV	0xf8
 
 #define RAA215300_INT_MASK_1_ALL	GENMASK(5, 0)
@@ -49,6 +67,117 @@ static void raa215300_rtc_unregister_device(void *data)
 	i2c_unregister_device(data);
 }
 
+struct raa215300_clk {
+	struct clk_hw hw;
+	struct regmap *regmap;
+};
+
+#define to_raa215300_clk(_hw) container_of(_hw, struct raa215300_clk, hw)
+
+static int raa215300_clk_prepare(struct clk_hw *hw)
+{
+	struct raa215300_clk *clk = to_raa215300_clk(hw);
+	/* clkout function must configure mpio2 as full cmos output */
+	const u8 ena_val = RAA215300_MPIO2_CONFIG_TYPE_CMOS |
+			   RAA215300_MPIO2_CONFIG_FUNCTION_CLKOUT;
+
+	return regmap_write(clk->regmap, RAA215300_REG_MPIO2_CONFIG, ena_val);
+}
+
+static void raa215300_clk_unprepare(struct clk_hw *hw)
+{
+	struct raa215300_clk *clk = to_raa215300_clk(hw);
+	const u8 dis_val = RAA215300_MPIO2_CONFIG_TYPE_HIGH_IMPEDANCE |
+			   RAA215300_MPIO2_CONFIG_FUNCTION_NONE;
+
+	regmap_write(clk->regmap, RAA215300_REG_MPIO2_CONFIG, dis_val);
+}
+
+static unsigned long raa215300_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct raa215300_clk *clk = to_raa215300_clk(hw);
+	unsigned int val;
+
+	regmap_read(clk->regmap, RAA215300_REG_MPIO2_POWER_OFF, &val);
+	val &= RAA215300_MPIO2_POWER_OFF_DELAY;
+
+	return 32768 >> val;
+}
+
+static int raa215300_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	unsigned long r = 32768;
+
+	while (r > req->rate)
+		r >>= 1;
+
+	/* clamp at minimum rate 256Hz */
+	if (r < 256)
+		r = 256;
+
+	req->rate = r;
+	return 0;
+}
+
+static int raa215300_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
+{
+	struct raa215300_clk *clk = to_raa215300_clk(hw);
+	unsigned int val = 0;
+	unsigned long r = 32768;
+
+	while (r > rate) {
+		r >>= 1;
+		val++;
+	}
+
+	/* clamp at minimum rate 256Hz */
+	if (r < 256) {
+		r = 256;
+		val = 7;
+	}
+
+	return regmap_update_bits(clk->regmap, RAA215300_REG_MPIO2_POWER_OFF,
+				  RAA215300_MPIO2_POWER_OFF_DELAY, val);
+}
+
+static const struct clk_ops raa215300_clk_ops = {
+	.prepare = raa215300_clk_prepare,
+	.unprepare = raa215300_clk_unprepare,
+	.recalc_rate = raa215300_clk_recalc_rate,
+	.determine_rate = raa215300_clk_determine_rate,
+	.set_rate = raa215300_clk_set_rate,
+};
+
+static int raa215300_register_clk(struct device *dev, struct regmap *regmap)
+{
+	struct raa215300_clk *clk;
+	struct clk_init_data init;
+	int ret;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return -ENOMEM;
+
+	clk->hw.init = &init;
+	clk->regmap = regmap;
+
+	init.name = "raa215300-clkout";
+	init.ops = &raa215300_clk_ops;
+	init.flags = 0;
+	init.parent_names = NULL;
+	init.num_parents = 0;
+
+	/* optional override of the clockname */
+	of_property_read_string(dev->of_node, "clock-output-names", &init.name);
+
+	/* register the clock */
+	ret = devm_clk_hw_register(dev, &clk->hw);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &clk->hw);
+}
+
 static int raa215300_clk_present(struct i2c_client *client, const char *name)
 {
 	struct clk *clk;
@@ -166,6 +295,9 @@ static int raa215300_i2c_probe(struct i2c_client *client)
 					       rtc_client);
 		if (ret < 0)
 			return ret;
+
+		/* register mpio2 32k clkout in common clk framework */
+		raa215300_register_clk(dev, regmap);
 	}
 
 	return 0;

-- 
2.51.0


