Return-Path: <linux-renesas-soc+bounces-6669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF4913F81
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 02:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34A4A281AF3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 00:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD3D621;
	Mon, 24 Jun 2024 00:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IKo/V6kR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2081.outbound.protection.outlook.com [40.107.113.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50002804
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 00:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719188205; cv=fail; b=D0oK9gNwPKcAsG24To0zlysPPCHifmdTuLq5eIyTiGK7IzZwQ7Y1UkH/iJ8Ba8a8yPy4DAVxsDNnFCSfy6/NLlcvLR3VKNHn9c+TuzU9GFmxUonBrF5fLedwcGywXd5mAY2U6/TqM4+N5ugndOp6FjdlaLNZJ3Qy7cLN3UgO9VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719188205; c=relaxed/simple;
	bh=9jIxrC+s6Ou3pILgVHAiZDG0wbGP6WIg8pQp1J4OOZY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gsNQxPCcJeocivycMo3K3a/bPNYXS01eBU32a6VuQ8GJiDBZMFcCe3ghlcuDepeRayiTCKZPyT6ugB0ka9C2ASqcaRnMiNrzFTxuQ8huB84xO7b2zZE4YX4c/wcEWNB2fKuFknJqe6vr4c9MCG1l8FL1FmzIG2m4mOpc4X8lNX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IKo/V6kR; arc=fail smtp.client-ip=40.107.113.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4VyUJmC+zIEgf0YuWH3vKFlAhUdEBgeF0jHRpR/xGVylISYK5PneaeEMgVvrzsoFiLnMbZVO/ew+GosmC9eLUjCH2KpsYYwvK32olJGah1ya34bDGDExovY5XXV2XIByk2Kwi1QEuJEGN7JVgCM67aFHuBFlJMkuDhd37l7QL9KUjqjzB7qT8HVgW5Xppff2kHUTUtoNGfONIfm8hc+amAws5siNLGqOhX+8yuL9vl7pWwXHCFP9N3IwBHd1qliZCLq/psySWiRVHqfyc7UpaU56WUWNri64ZGUlI0PuzBJkalf9/nFe9fDEvbxhOlLtU1VHTAhPSXydd3UPfzUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIw62Eq2++BixHvKHrxBGrXoORh4RaAvCCUE7zQFTuQ=;
 b=mCa+vjQ/lbozOPZr1aVLw0HHlkpUcxO53rv3P9rf1DkRFkbbtx9IDcIk3MJQBtbx9Jo5Zz5W0rfRBeRe316iVnyau91ldyDBo9nbsCtYGzUgJT5gV9hDjOFmjWPb+UVKlDiE8zpPxXmxGViHqRRa1i9YMwzamJV6ILXXKozg/RGabbtYitpJRA3E9UFxe7bnELVAQUhT225WuvJLEUaTQNXdJalZyvLJpjgInAfk9qmQ/vp7BpxJ4pdKKbEmVPGBhtTYu29IlWixw6kZz7AGmNrXnptbgOKijW073HvbshZXWpu0UCYZBZ0kBUcS8IETni5X19eeZlDRFLH1q9CgGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIw62Eq2++BixHvKHrxBGrXoORh4RaAvCCUE7zQFTuQ=;
 b=IKo/V6kRgBD8C7YHl75JTTwSbGafsvF5OX1Z/nPp5uhJO9hWEzN/cNblEIpHqSU1VNuVaWu9SDdswjeQJ87ZCbrT4w11sOUqjn55uxkcnPXq13tvrzC5J59y3xq/snqBR+Cr6BwKW+Ijxmj+qwgmaYKzz+FPfWq6acRVNn2Gu3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6250.jpnprd01.prod.outlook.com
 (2603:1096:402:3c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 00:16:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 00:16:40 +0000
Message-ID: <87bk3rkxef.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/6] arm64: defconfig: Enable AK4619 codec support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jun 2024 00:16:40 +0000
X-ClientProxiedBy: TYCPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1f4e49-befa-4371-27e8-08dc93e2eba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|376011|1800799021|52116011|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TEf3XQZHtxXuD9/X7VoxG9VBIY3+HPlcxG0y9Ovyd9OfjzwCW+bv1m20fqyQ?=
 =?us-ascii?Q?6X5fw1pyyCNpjbF9dljOK3zjfliMJPptCnMEIScvau2T6lFovdUJgsa3kOXX?=
 =?us-ascii?Q?wejoxe0IaFEhFsnvvQWuA2NPItOn4WmH6Rg3Uvl/nHNSoRcg32TJhgmYIXNB?=
 =?us-ascii?Q?4abiUfb+AWIxKG4DVSp9JrW0eApy2lbMgq2qZ+GJldTH+rJfFfbVMMEB/Chr?=
 =?us-ascii?Q?Ylwhxzv8KNANDnrz8yFNleoVybnlKi/E8iqF8f9q3/ZzAAIxL9cTft53pVDn?=
 =?us-ascii?Q?pFG0FErrQG17+txSKq/jf7y6Rx9PzjeVSpLOJnWsZkrGzjbUhPyRQeAWZ+gV?=
 =?us-ascii?Q?xlLzkepblSX6rxMRht5UCFsXDEQqnp2crraqnaoEKLc0xmuZ/wWrlIGZBDBs?=
 =?us-ascii?Q?0V4MpJ3a5MjBikNPAMM++7rCzyvx4Q1CjDB8Ti3S4sqMAo07dbMm8WGfx6xV?=
 =?us-ascii?Q?WClVyrXZXDYp1R0QucNiC4I4HzgIyQB3w4s/gmxVITbNNu8nDntQkm35O84z?=
 =?us-ascii?Q?bH8MzB9NovOhtHaY9tSkkO6b0ovC6dNCRNKYFu/yFRsvZxsMV3nnryf6UgJc?=
 =?us-ascii?Q?UgPuXJRACOCYyRxjn4T5yJcSAtd+MaQlqxJE+15NpoHjVWvLhS32GU3jtHp9?=
 =?us-ascii?Q?T41HY3PdlZyjMVoXNFOSjWwWo7iNFhlzev2Ho6BMzZNr1LsyPH9zuif66ljK?=
 =?us-ascii?Q?VfH0bPX5aAY4gz5zSbwDFZ1KcJVvLNigGZaEpLzmFU1aSws0BEWdonVf82Ee?=
 =?us-ascii?Q?wr2jwdgVAQjpTm+0MZnMIYVfGZ7bSWGKWOJrRI4dAL7VwpkCizwkq6JFqPqP?=
 =?us-ascii?Q?1X9/k0JzVT1X7o35XUdau1M7Fa7z2wjW/p8EpQR1A+Uk9SsFeaNQG4DyF9Sq?=
 =?us-ascii?Q?AYgqppQUerZD1mLaTNMaRqKqXoSJv8pT4dGHhXrdN4EI8dQK9Coj6ek190TF?=
 =?us-ascii?Q?/xC5OvqvJB7m++QBrXDkcRETfQi3B39+dLC7TvlILOmHMVniycZiRkhiFLGt?=
 =?us-ascii?Q?3sFZDz+eida8TL0IHfgxTRErYq/cli+AmlCFgMbZCsSQZhhDOAXUPogEZ86b?=
 =?us-ascii?Q?El1KYd9xeT1220QD8o+Q/hIa+abCBshskWIfOKSYiadc5UHV8L8xMltw35fj?=
 =?us-ascii?Q?OBBmESIof9FXsfN0U7VrQnbiL+2GirkXGGG+D12d9DtDFhOjPgqQtqKVvS4j?=
 =?us-ascii?Q?8k88EKnospb5SBEilETkmrYmdmbrpJ2CU1+VS+UaNSonPN+9fE76M76tOF4S?=
 =?us-ascii?Q?OxmItISnmlWomo50eNZRxB+8PllPdkUW4CxTxOjw2jsOFFxPFdyds84k4uc7?=
 =?us-ascii?Q?bxwM5LGJSSDlZFDiw2yC+MjEKIcdz/bFobhBmoJo/Ut8bGoErzp1nvnBB5jG?=
 =?us-ascii?Q?zDeOCW4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(52116011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z+0z9nYozCDXJFwGpDttI0qPIat/p5Ug3JGg93WW4Go3vAQo4ABk2s6XsAjH?=
 =?us-ascii?Q?xMX7ZD76TWvfFnQZRj8UyrjVZjxtHJMDmzG/yE/zv9/++DMen1YhbTvERQ55?=
 =?us-ascii?Q?hkyzd0hGIg5SzMBqY6PVp1rFDybZBUETSNEg0JXRpuB+raAzSNstN3kc2XQj?=
 =?us-ascii?Q?I2WGSAF6rxr+2Go7PPQm1vRQVYyaJ+qS2gyCiqVcoNNUQrUsPGOTXMsFOgtd?=
 =?us-ascii?Q?IR9aXswQC1WPuKgwCl+AKjCPV4zLOs6/ja581Nq3mxPIJDB2rEPFC4shqmMF?=
 =?us-ascii?Q?vqDnN3iS8o3+MEgtZKOTH0IwvwA3Wcg74JbNY5ElGoQS7PcTsi8HrnuGS32q?=
 =?us-ascii?Q?s+zcup6p3RYKXbcVXhKKZQKuB23cdtm4pB8NETF0m395QgOTUUYiL41e99/F?=
 =?us-ascii?Q?wqlC6XcZpawcPiVix/YOy3JuqiNLi+VUoT59OnNWLbNI6+wxKGgEV4jlf40S?=
 =?us-ascii?Q?bp1LFN67Vv0B2ujaayApwC8hYQGErORqbyDWNMJ16mCDaX8XWYoczdjtRcKC?=
 =?us-ascii?Q?bTh2/OlBRIW/Ucno9QdN380DTN4/++SJmMUqy8+Vtazp5bX+oGLfHWrW9xzI?=
 =?us-ascii?Q?vNLzzsGFFnOiGYgKt0cn8/HcCJx6EKy0DnAQsSv3qQAXE3Il2xDYugTINMQs?=
 =?us-ascii?Q?AA0gxJItxIhqN+USrUZV60J2SzKH94SfBZYAAdiL9iA8OQ9fiPTSDakB20Xa?=
 =?us-ascii?Q?XxfdZSbEF5aPcrP3gbPymN9ah1cxWKmiGdY/p1NP+LkVjkrqA1olgBpmdmhg?=
 =?us-ascii?Q?4TdX+4aa4tOtJfG/GuofIO9TCbSyWCgF5Am4JmTvTH4+1AM2bo5zpa+cJjBx?=
 =?us-ascii?Q?XnsQtBN3cEVOHsST5ljcQmK/c5UoSSNSpuuZgg6eS/LHvolnjYRUjrF8C/pM?=
 =?us-ascii?Q?8adku9MRx1+xPGtGsI2ib5/VJWf+3k3xwsQb1ScBVXjK3RwQso/Y5cunyHkM?=
 =?us-ascii?Q?6J5n0Tj00SwA1+51/XS5y7bg05DBn0ELSoJ4C0mNbCKCtqEcFQGB6W5owXdH?=
 =?us-ascii?Q?KDB75jb8O7QrktMRCpGOKhHWOa1Naa/pyvuDddBHTVDjwER5lhm/dTYRFbM6?=
 =?us-ascii?Q?1DhGPHYe2OMTFTOr2N9iS6bNDF9irUtvbPs/Krw88WVmX7D/j4NZgOu4y1Jo?=
 =?us-ascii?Q?micZobUJ1qg0I5+pXezJr95cIrz4vj5uAXz3EEArX9nZhvpiBOHSWrGxlspE?=
 =?us-ascii?Q?EujrMhM2UQSf4qahZt1oOerOHRf0S9MYucGXUs/wvocpCjCY9l4eLpIc9lWf?=
 =?us-ascii?Q?o2vLARVa2iDC4xPopfTFt5KrdvrUWunWnd2KtosCx6DFPATBTmljCrJtzRzo?=
 =?us-ascii?Q?enUGva5H82OqViLkx/MZde4ImqlchO1IEGK5t0i3YybgzD9+T5szI/V5G5fY?=
 =?us-ascii?Q?FNQyaHImuIGovRs9p6HXG/I2/PDoqNwMhJeTzuuuAwtuXAtBkov3jOhfKo5H?=
 =?us-ascii?Q?yJkxBUlQ9leLVVi9e9qcCRbzYAtzlOPn9jNTJLZEEH93BCTFkqrbybqYW0x7?=
 =?us-ascii?Q?o1wv/TNCPA3DjjN5TvvIotfHwmQXeZqAsqzc2eR/iuSoDfqfJNzUUwvzODBa?=
 =?us-ascii?Q?m628uvM+0YVW8w8NjGzOl/eQW4KwepddsZrOXRbXSnLxp7esp9wXTD0Y1gGg?=
 =?us-ascii?Q?uPyHmEKMfVmMn6eZy6Y1pyU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1f4e49-befa-4371-27e8-08dc93e2eba1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 00:16:40.5775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nvo2gU0ocUazUHzi5w9SOJ7N5W7BQ85f2mKT5vaFQHyFuWbvk3WKtgumvMvwPxwRNa2PJjDS+p/pCAHZG7oEKgykNZFoKGPtNpU5WZo5gAZf3pEyxsekgPIpsszeDaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6250

This patch enables AK4619 codec support

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 66d779547f0f6..e8b47b07a921a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -998,6 +998,7 @@ CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
 CONFIG_SND_SOC_DAVINCI_MCASP=m
 CONFIG_SND_SOC_J721E_EVM=m
 CONFIG_SND_SOC_AK4613=m
+CONFIG_SND_SOC_AK4619=m
 CONFIG_SND_SOC_DA7213=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
-- 
2.43.0


