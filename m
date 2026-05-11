Return-Path: <linux-renesas-soc+bounces-32371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBmgCBCyAWppigEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:40:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E62650C049
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CB0C3041A27
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097B13D9021;
	Mon, 11 May 2026 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Mb3i1zZz";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Mb3i1zZz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023074.outbound.protection.outlook.com [52.101.83.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19363D8117;
	Mon, 11 May 2026 10:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.74
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495902; cv=fail; b=sN+7VcO4Fj88/KxlqdWy6ZZcGcCGG+v8oFmqycHAiX4SJa/PsMa9bxNm2XjtuJBWHY6RxTav9tkuAiQzOkLsR767BlbsZ4gG54qrsIIpe6n6/p2c14H6wVaDQIqdYePKvdKstqupKtMXI+oAeAs71BRHMFj3uw/wC6geK24EUx4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495902; c=relaxed/simple;
	bh=qj/MuODsukVI8jIg+siFSh+Zlu9h0lwM/9596TTmxW4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t50NDZnPI6F4IQmMCxDrgBT2kYFolGPv4eBgB6W0uCXN7YakFlPZc47A6mE0HhtpfOFtarapOQAirZZ01iUly7cFx6Ftor3dhNIehNpcdqd841ABZFfePo8DrcjhV1REeb0H8Q3sSW9OupiebO8gt4Gu6OfMgbdGIVdB0qLcsaY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Mb3i1zZz; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Mb3i1zZz; arc=fail smtp.client-ip=52.101.83.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Hr01YBc4S3oOAdLqOOGaWudpNZ27EPR3zPWVsJR8Gr6VyEgCzHem4vFEq086lskX1DwdIIftG6uJWV80K8CShVm8utJoKIeMD3jOktgUTTDjq9zWoVDOt6febJE3QLdahqpmX34Wj9d1oyaq2hBeb9XYGUbZCp0vSCbSl8sMLmI2b4m9rT7vw22ZCkKAyZjVhyivHSQEoJ7plDQ13WTL3sJVdazq36J5Jnfl+p81py7FK8lqLInQ0NWeKrkteZZg8eHxZ1sYNw8/CEIXejOfk8+HWv4eUdqL8VUHCmDTkdybiw0zOoozoyV3UQdOJEOjwmHDO3I8cMPl/LHVVeFMOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDUdW2ppVMSzuGZ+H3smVmyaHMlXU6bY70sue7B0eDA=;
 b=hmjxb1Q0CSo4gmuvi+gpA9pCD4JcGCPcbth6dDUhmXPtGWz4Ed2oG+MsqK6nLNR1UcraVEv4s6iJHyuFw9AqlsKsBAZN+ACN/TmgSuWLKUghgxsVzqQZT8u2xAkC+1+8x7hQiKp2vBcItP3M+xd11nBJutHp7BbEdexJw46LiOxxvrh3ueDiT1RDhKHAlF3dqZkmJk5ZyNqKu4jbvjUbbjaFaQSKTHOvpvh9UM2F6g6gThJ+y48AC/kNmttKv0aR9dfnDGb8x44KPNHRCSAssAeU89VxJ0TmiOmdV+Z/ZRl10YjZe2R649b/1RUUL2SvsXMP9sFu7SkhOSKezqE4qQ==
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
 bh=YDUdW2ppVMSzuGZ+H3smVmyaHMlXU6bY70sue7B0eDA=;
 b=Mb3i1zZzDUDxqNPlO8nMm9+djUzinjQhxkwY721kl08p7JykiKLcDVuHB+JY1ASU5S5mQIxg0/K3BtfIhdHbPiSxr0zFDj0XJTRWeW9zTQ1lg/Dy/90OUV6OW5RPwrZPmLqwVkr9GWaSTFumPuXEzDkos+Xs3H8lq3gllqEHWnKYmEYswkbPGk9vE0w2inh+yN4adQijvYDwhn2W6RGQ8Fzx3Q0YG/XU4MTX1Hd+qnC476yo+TS/XlWHRFj4GK4fK+plMXSvghgboIoLt5/4NnroaRRwn0CRHbeg0Kvcc+/HRl3N+n+5N823UNcMfJV7brB3Xu5VnG8nMHfiTBrLuA==
Received: from DU2PR04CA0176.eurprd04.prod.outlook.com (2603:10a6:10:2b0::31)
 by DU2PR04MB8917.eurprd04.prod.outlook.com (2603:10a6:10:2e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Mon, 11 May
 2026 10:38:12 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::2f) by DU2PR04CA0176.outlook.office365.com
 (2603:10a6:10:2b0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:38:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Mon, 11 May 2026 10:38:11 +0000
Received: from emails-8214872-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C8A8B7FD43;
	Mon, 11 May 2026 10:38:11 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon May 11 10:37:58 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyEP1aX/nVxaplim6Y9euUdbmrWZo5Exl7ZFULpBbAHAzzeBQNgURy7hTKNEmon1+4itt7rQ5NUArKS5URFQsitDfFZH011BRKz0LH91JGQsX8Doo517WOEfFo6Bbk6B060S23q3CQGWUdZMr5AxGFiEL0L0ACV4ii9l+d4RaMqC50ld+H4EVKXT3nK+H77DSbRBnqeDpwAaDTp6Rtb+l25TQRCJIiB+Ir4pvr+rbRFjgCZQwEIG1ZUq686IMpmbzSBngk/H0QZDC55nd9IzHGGQ04gI/YwZoqDTd4hkiVH2zHIMUKzM0Nxhaup/sd3rjOqZMQEoS1k4rsUSKyxOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDUdW2ppVMSzuGZ+H3smVmyaHMlXU6bY70sue7B0eDA=;
 b=NzObj+c7oJf3rpSgy/fQbmstRuSDNzj2deUhOfBHVRWhmV41lZOERf7gYOlHTRr2rlB1LZgmBuFjCo8+VK5zMEpgkcx9X8FUEAifotmOnpDmNQTPlk1JArjqpnrtYsWnVaTiT4kkr3tGGKv4OIYyKiQWaDXAdtSXJs/09lNbwXYVIBLHVJAAe75qN9sGvoYmGH9vtIpnsjP5UJvj8KETYVNuMFNb3saB0Qm2DJKleRxd+4qIXQWFd6oht2uJI8q3TXYvVQhpntey18mtbRDwCXuhVIhIoEXiAnn3LBn4o4SDJtvL4adHHIR4PN1P1EFb4FZQTl+fwtlkWuBmr7C1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDUdW2ppVMSzuGZ+H3smVmyaHMlXU6bY70sue7B0eDA=;
 b=Mb3i1zZzDUDxqNPlO8nMm9+djUzinjQhxkwY721kl08p7JykiKLcDVuHB+JY1ASU5S5mQIxg0/K3BtfIhdHbPiSxr0zFDj0XJTRWeW9zTQ1lg/Dy/90OUV6OW5RPwrZPmLqwVkr9GWaSTFumPuXEzDkos+Xs3H8lq3gllqEHWnKYmEYswkbPGk9vE0w2inh+yN4adQijvYDwhn2W6RGQ8Fzx3Q0YG/XU4MTX1Hd+qnC476yo+TS/XlWHRFj4GK4fK+plMXSvghgboIoLt5/4NnroaRRwn0CRHbeg0Kvcc+/HRl3N+n+5N823UNcMfJV7brB3Xu5VnG8nMHfiTBrLuA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA1PR04MB10357.eurprd04.prod.outlook.com
 (2603:10a6:102:452::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:37:55 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:37:55 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 11 May 2026 12:37:50 +0200
Subject: [PATCH v2 4/4] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rzg2-sr-boards-v2-4-82aebbd27891@solid-run.com>
References: <20260511-rzg2-sr-boards-v2-0-82aebbd27891@solid-run.com>
In-Reply-To: <20260511-rzg2-sr-boards-v2-0-82aebbd27891@solid-run.com>
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
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|PA1PR04MB10357:EE_|DU2PEPF00028CFF:EE_|DU2PR04MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d44cab-43bd-48cc-590e-08deaf496689
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 m/taVsKnm0IDOU4SmG5U7CzZoxMHB/Xph4ed6A6x7u1AKf67iEkFtkA5LsXfVmo12LdEHkdAchA5P0AtRAEZHKKF+w4i5fpKALMcD63wD1miKqkRmP6wJSakqbAI37Xkt6x4RdESqX6mynNA27h/lLO+6sHaY/KWOXadIMpAE4nmWAwxSy/1C5gkz5d+ugXKIl4jY7IYGJyib8GUCseC+kY8WIS/lLfEvrH+D6fKkX7K78YWzkjFWEBbr9Uj5Ja8ij9zHdv7/Tssi+KVtuaeJS7kXGisHdqeYezF7tH9uiNPSVDe8AzW3Ud2ozDPLC8DfFCyD6S8YkmZ7WviPB4jlMtLdRq6HY+kOGe1ze5RwgNUMFh1gaqeihe/Y2tbUS5uEQrIel2TQNOjwvlWeXLOsiDZECSEmPtCaBp25LiCmDAH0va4cTJBIRaBB8JhIeHS1GWYxJ6vl4uCkYLtixhcp82Sy3hubY0bCJz7ejSkA8TXEHyIELTvyKlTQKlNmXiFmsDC+VWf5l7uH0YONXegj/W022Aem40CaoOshxldPpgmtb/kl4Wz4Y+sEPPhb7bAcY4V4bTx2dVbTrMS8+tP0qfg6I3dlPRI2XEzDfJy9ZUxqGZUXflSn8yh7ROj8xyw0iC1LV46A+Uww84Y++/1LbKNqLKTWsl8T/JaG+rbpPI6+idAyvApoVwN6YGwHJhOjVJt/hsU30csu+SpNMDGQ5TsqVZYCx0o8EfJcbNFf8fF2rLi56sfGoSF2w8gdc1b
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 bJ+XkX68N26JNqsz81x1Ghio/1DUOU9OUyfujx//uJkKbGy79P7E8sKuWJ5Jq4YUOSWqDP7sXCEPz2oKTVJExOMKVRLUxu85SrrQz8M2NTCxnpYPOr4o2/eU1n8z04xicNQ5lQgcJI5CFWetiSMIpWxcfSJfIliQhyYO6pxrzUFbhG7lj6NBCHZqUi+uNx+/VELYe8ROpKzXoxgb2EWGo5kM7cLw3wt89OfnyZiBickegTEZFMl9diRq+0zmPBwiU8+lyvXBHHgRQ/arqdtfOPPx+YEBpa+ts/1hl0f9jqQBVY6utVHQw9lOCYToz/HZh6tHotlcIwDijMJBA6rtDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10357
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2b6a496298314116a50ad68b9713f9f1:solidrun,office365_emails,sent,inline:5e585910611d2837dda89d7e66cbf95e
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	194391f1-d004-4834-6c8e-08deaf495ca1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|14060799003|1800799024|35042699022|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	EIKe9hhcYPw2jjLmJZmvlCP6cCTYw2fAfL/rYO8Szfcu226o9sJBHGDeHMUGbUuVsF6hGWTHDA5+9DWpKJfIrb4Ji03bSzobpd1eSBjAeDnntZ+zhG2fCyVSxV59D7MPv0tf0DNmfQ6ZTgujgrU0pTdVnFdWdqwWDk+UmyGN9CwzfyNg5Z4flSpdSd+rEMGaGbKqA5wWVVPswy5PlAyYoPW3kANYmOXi36PARp3OePCB1+Yz5wIsoplANk35NI8lPXa7PD9kHs0eImIvq6WT3xA1LIpVMfwrxIjrFQvZNdfV9v7KPeBqEVTArTSxmmktnfoPFiSD5V2ohulp/6eXovvjCRopnTrBRB1e+riXyY/ON8rq6Gyyv3l9fu50dbWtqVFsw5PCw0f3QBuHYl3V2MquJ8iDVX65P1ZU0OeN5mCdtPxTN6BflquNBq9BMeTdHgJMyN4IZitf5bumitxmvGVgMF0HRaWZKK0AuuoHJMbCJMn7rVNW7ucjhydLypIMjQKgp+xB5xbVnpFjynMx/i+630dEsxGgE1VdBhzhqJvAX1Yqok/RSIuboupY4FKQYON+C36ju4HroTIokX3MiW1NC+VIU3P1ty1S2xm7XZd847/X4bi2JxiVAbvDsHlRhDdRjH5Xj3CjHg1ZerfrLSKEK5+gljsNzQ7UDqJkHFoQ1HQhGklb8A2mwpKdOtYmeaGHGnj7JorErM/7Y+S4fICObCH+qUEZDE8Z5GuCM18=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(14060799003)(1800799024)(35042699022)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0V3XN8AfvAuH4lW09K8g5eqk6XEMPph8wfqpWWIUR7E2WyhEFIuXqILqLXsj6FzZKuQ8AmwJUn6Kf6b6smfqJ9MBVxBV/fP7cieIUAEfjfoNA6RR+WvdGBucsostqstSY+6ouEx/9NlPaoHmGu5escTCpDHyGdTz/zzrl2m/jNcVYD+UtjuX2qBdKguvBBXq1PgFGFmA4JE4Ciz/klGNJSceYJqtVzXrzzrN4W6LMy1ZPuT4omuYjGMYEddVKSwWlZ9+siLFlMv6OG4fsH53ur6XsJYMMYbXbwgk/IYYazE6OxdpQv1wwQvv5Yv5OBBJvLz9n0LlWDd3kapPtP3EDpBJj4ABqCrJTbNnmFLt05mdv8Q+qgaeyMge8T+4JA3gzE7AsST3Yre5+KUC0bCiB/5ThV/O+GpV/vFYGGMThgVLF1z54ENK4QNZEVl8iIBy
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:38:11.9197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d44cab-43bd-48cc-590e-08deaf496689
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8917
X-Rspamd-Queue-Id: 6E62650C049
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32371-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,2.98.90.0:email,solid-run.com:email,solid-run.com:mid,solid-run.com:url,solid-run.com:dkim,0.0.0.12:email,0.0.0.50:email,3.117.2.128:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[solid-run.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add support for the SolidRun RZ/G2LC SoM [1] on Hummingboard IIoT [2].

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 1x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)

The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
slightly reduced feature set.

Descriptions for eMMC, microSD, and RS485 are shared with G2L.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  11 +
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 ++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 373 +++++++++++++++++++++
 3 files changed, 404 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index cdf59f3240e27..adba304a9d767 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -164,6 +164,17 @@ dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtb
 r9a07g043u11-smarc-pmod-dtbs := r9a07g043u11-smarc.dtb r9a07g043-smarc-pmod.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-pmod.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot.dtb
+r9a07g044c2-hummingboard-iiot-emmc-dtbs += r9a07g044c2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-emmc.dtb
+r9a07g044c2-hummingboard-iiot-microsd-dtbs += r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-a.dtbo
+r9a07g044c2-hummingboard-iiot-rs485-a-dtbs += r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-b.dtbo
+r9a07g044c2-hummingboard-iiot-rs485-b-dtbs += r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 r9a07g044c2-smarc-cru-csi-ov5645-dtbs := r9a07g044c2-smarc.dtb r9a07g044c2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..06d9d031cbe91
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044c2.dtsi"
+#include "rzg2lc-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot-common.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2lc-hummingboard-iiot", "solidrun,rzg2lc-sr-som",
+		     "renesas,r9a07g044c2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2LC HummingBoard IIoT";
+};
+
+&vmmc {
+	gpio = <&pinctrl RZG2L_GPIO(18, 1) GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
new file mode 100644
index 0000000000000..e244836f5ec39
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC Solidrun SOM
+ *
+ * Copyright 2023 SolidRun Ltd.
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+/ {
+	aliases {
+		ethernet0 = &eth0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		rtc0 = &pmic;
+		serial0 = &scif0;
+		serial1 = &scif1;
+		serial2 = &scif2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	sdhi0_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		/*
+		 * Mux switches SD0_DATA[0-3], SD0_CMD & SD0_CLK between
+		 * on-SoM eMMC and board-to-board connector using one gpio:
+		 * 0 = connector, 1 = eMMC.
+		 */
+		mux-gpios = <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_pmic_buck1: regulator-pmic-buck1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck1";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1100000>;
+		regulator-min-microvolt = <1100000>;
+	};
+
+	reg_pmic_buck3: regulator-pmic-buck3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_pmic_buck4: regulator-pmic-buck4 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck4";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_pmic_ldo1: regulator-pmic-ldo1 {
+		compatible = "regulator-gpio";
+		regulator-name = "pmic-ldo1";
+		gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		states = <3300000 1>, <1800000 0>;
+	};
+
+	reg_pmic_ldo2: regulator-pmic-ldo2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-ldo2";
+		/*
+		 * This ldo can switch mmc host controller io voltage between
+		 * 1.8V and 3.3V by assembly option of pull-up / pull-dow.
+		 * Default assembly is 3.3V.
+		 */
+		regulator-min-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		mmp_reserved: linux,multimedia {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x68000000 0x0 0x8000000>;
+			reusable;
+		};
+
+		global_cma: linux,cma@58000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x58000000 0x0 0x10000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	sdhi1_pwrseq: sdhi1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pinctrl RZG2L_GPIO(23, 0) GPIO_ACTIVE_LOW>;
+	};
+
+	/* 32.768kHz crystal */
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0x0 0x20000000>;
+		device_type = "memory";
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&eth0 {
+	phy-handle = <&phy0>;
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	/*
+	 * ravb driver does not configure mac internal delays for RZ/G2L(C),
+	 * instead delays are added by the ADIN1200 phy driver.
+	 */
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
+
+&gpu {
+	mali-supply = <&reg_pmic_buck1>;
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+		clocks = <&x2>;
+		clock-names = "xin";
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
+&pinctrl {
+	eth0_pins: eth0 {
+		pinmux = <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
+			 <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
+			 <RZG2L_PORT_PINMUX(28, 0, 1)>, /* ET0_MDIO */
+			 <RZG2L_PORT_PINMUX(20, 0, 1)>, /* ET0_TXC */
+			 <RZG2L_PORT_PINMUX(20, 1, 1)>, /* ET0_TX_CTL */
+			 <RZG2L_PORT_PINMUX(20, 2, 1)>, /* ET0_TXD0 */
+			 <RZG2L_PORT_PINMUX(21, 0, 1)>, /* ET0_TXD1 */
+			 <RZG2L_PORT_PINMUX(21, 1, 1)>, /* ET0_TXD2 */
+			 <RZG2L_PORT_PINMUX(22, 0, 1)>, /* ET0_TXD3 */
+			 <RZG2L_PORT_PINMUX(24, 0, 1)>, /* ET0_RXC */
+			 <RZG2L_PORT_PINMUX(24, 1, 1)>, /* ET0_RX_CTL */
+			 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
+			 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
+			 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
+			 <RZG2L_PORT_PINMUX(26, 1, 1)>; /* ET0_RXD3 */
+	};
+
+	i2c0_pins: i2c0 {
+		input-enable;
+		pins = "RIIC0_SDA", "RIIC0_SCL";
+	};
+
+	i2c1_pins: i2c1 {
+		input-enable;
+		pins = "RIIC1_SDA", "RIIC1_SCL";
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 3, 1)>, /* RIIC2_SDA */
+			 <RZG2L_PORT_PINMUX(42, 4, 1)>; /* RIIC2_SCL */
+	};
+
+	qspi0_pins: qspi0 {
+		pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3",
+		       "QSPI0_SPCLK", "QSPI0_SSL";
+		power-source = <1800>;
+	};
+
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* SCIF0_TXD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>; /* SCIF0_RXD */
+	};
+
+	scif2_pins: scif2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 4)>, /* SCIF2_TXD */
+			 <RZG2L_PORT_PINMUX(42, 1, 4)>, /* SCIF2_RXD */
+			 <RZG2L_PORT_PINMUX(5, 1, 2)>, /* SCIF2_CTS# */
+			 <RZG2L_PORT_PINMUX(5, 2, 2)>; /* SCIF2_RTS# */
+	};
+
+	sdhi0_pins: sdhi0 {
+		pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+		       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+		       "SD0_CLK", "SD0_CMD";
+		power-source = <3300>;
+	};
+
+	sdhi0_uhs_pins: sdhi0 {
+		pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+		       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+		       "SD0_CLK", "SD0_CMD";
+		power-source = <1800>;
+	};
+
+	sdhi0_cd_pins: sdhi0-cd {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 1)>; /* SD0_CD */
+	};
+
+	/* SD0_RST is only routed to eMMC which uses fixed 1.8V IO voltage */
+	sdhi0_rst_pins: sdhi0-rst {
+		pins = "SD0_RST#";
+		power-source = <1800>;
+	};
+
+	sdhi1_pins: sdhi1 {
+		pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3",
+		       "SD1_CLK", "SD1_CMD";
+		power-source = <3300>;
+	};
+
+	spi1_pins: spi1 {
+		pinmux = <RZG2L_PORT_PINMUX(44, 2, 1)>, /* RSPI1_MISO */
+			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* RSPI1_MOSI# */
+			 <RZG2L_PORT_PINMUX(44, 0, 1)>; /* RSPI1_CK# */
+	};
+
+	spi1_cs_pins: spi1-cs {
+		pinmux = <RZG2L_PORT_PINMUX(44, 3, 1)>; /* RSPI1_SSL */
+	};
+
+	usb0_vbus_pins: usb0-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>; /* USB0_VBUSEN */
+	};
+};
+
+&sbc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "winbond,w25q80bl", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* WiFi */
+&sdhi1 {
+	/* Murata 1YN max rate is 50MHz */
+	max-frequency = <50000000>;
+	bus-width = <4>;
+	mmc-pwrseq = <&sdhi1_pwrseq>;
+	non-removable;
+	no-1-8-v;
+	no-sd;
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&reg_pmic_buck4>;
+	/*
+	 * Host controller IO voltage is provided from reg_pmic_ldo2,
+	 * WiFi module IO voltage from reg_pmic_buck4.
+	 * Neither is configurable at run-time so either can be set here.
+	 */
+	vqmmc-supply = <&reg_pmic_ldo2>;
+	status = "okay";
+};
+
+&usb2_phy0 {
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	status = "okay";
+};
+
+&wdt0 {
+	status = "okay";
+};

-- 
2.51.0


