Return-Path: <linux-renesas-soc+bounces-32372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMa1NCGyAWppigEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:40:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D550C068
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D3D43045459
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2268A3D9030;
	Mon, 11 May 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="WkS2UBn8";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="WkS2UBn8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023110.outbound.protection.outlook.com [40.107.162.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495F13D75AD;
	Mon, 11 May 2026 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.110
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495904; cv=fail; b=t/VEc+XNw/9HXgSExtDT6zZ6+6rpPfvVfV+DtEL0IXvbng3dD/H80ydkpw5msMR3ixwnCdLFnZTFwrt0WwGqzdnYg8IwPp8vm8NAIAyZ7GaMf8RpVMSFPhvlDXuoekvYUYAOKwuGZ7Rpo5jtJ2PBKHIECmViQZWdahz5MY3/kPU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495904; c=relaxed/simple;
	bh=mi0/3EF84TCZOKUOoPlFRu3hDU4cCwzeRVrBkrHJP8k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=V/7LsfSEiASqvP8HzsJNj8b08Zfp0ENyOB1xOYjAIDCEya+ha/llAwMniSn5bm4AesFWI/EDW3AlaIuJqvm4ZGkdiTYegoLnnFBv2MYRgJeQiJXx9NzTLFPxIeoq85B76KVHXgzgFKKX5Km7hMGaUrpSkSRTE+FpmcvKxhQcKn0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=WkS2UBn8; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=WkS2UBn8; arc=fail smtp.client-ip=40.107.162.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NSVrYKlG1Ooy5y/HvNk5CPjXhbU5aovNPOgFPPTQEvYChlqrMlI2oKoBr+aZzK0RbO5y8/r7Mp88r7gMdUTS862LyqZwN6deSls/Mr/oKqSikncoikoP5CU95U96u9aYES0wwOXaIsJyBp70JbYRV0/jzMtKGxjYNpa2zAMNFFVE89oAA0x0aGiXKrjmNArKk1kXaK1X8YJn447j4j3uCyMosmn+/CA3KZUQyHw3vgGa61OUykToeaGiigB0jmfjwtcY0QOEfBPDUn8dRZARWhXM3TOgJGx1LutaIBDulQN0YEBQfKUxtSpYqKdWyxb/So6xSy0iQ5ee8g2587yogw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AErEhhSpBDMpQpOakCLzFEfQlH/QUP8t0f4NQ56epBk=;
 b=jOD/MQBgA/LkSDVFHQzrfrHLhF+atil/9q4DJkLkj8tpY/iUMNJyDsvNYk8PbsNc5ynzcmwYE5N78MCdZ/Uac89V/MgvpTsdrp0jgV7tu5FhWop07h9cd1GR7ZTAmf5onTBPamYYNXmD6XOcNjDCiP9Hj/HIatOMBfveqZbOczw+6+v538g01sqXk/WPegGB4PLCDp1V6iEDO4tj8BcVsaFOCvXJTxxID1aayKFz0tsCEAMCDQxMSnY5/mGt8qkvODe/kVgZtFqoF1EffcisF0ftTV2uVqasZh2iouhUtyKkkleYjvjW+CyeYwhU9cIjZm2waAKAYFrS2NpHI78OfQ==
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
 bh=AErEhhSpBDMpQpOakCLzFEfQlH/QUP8t0f4NQ56epBk=;
 b=WkS2UBn8lVh6WjrQGoarp61wicyV1hJ9rJuBRaCXrXjU6porF9I8uvLRxzaG8KtX57mAm3vfQ6eRJWMt3gKPBjW1XnKcw96h4EizLSIOBfzDZHm711Fggc8kP/pvZqMVn5vt2kFLnCSWQDfw2q92cFDLJvllTGvfT/6Aj08g6IOkng+U0IDxuVoOgZCCJFTSr17NgbkzjHBrvX8zNNxfrwvxGKtxQoLp9F20ISOhIopnEbmK+vXboShHgGUm/K9ClLQ+KhLRLoNDv4XswOe0icejAuhFBhTHDLXWQuB/TDCU/7eyAutTeS/L6kSsq97WLJNZDCBdVZsKbhC/rDUQWQ==
Received: from DU7P194CA0011.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::17)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 10:38:15 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::37) by DU7P194CA0011.outlook.office365.com
 (2603:10a6:10:553::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:38:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 10:38:15 +0000
Received: from emails-8167671-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8645D80045;
	Mon, 11 May 2026 10:38:15 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon May 11 10:37:57 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdOMZKTVRFqC/8n02oD+629EabJw8jl4+/Hl6TKP70uP+6gkZwcTorPqenPj+jtBnAx9MPsWTTkc0XhuZBZBkT+Py0W3HqeuEqG9y8VnpdIeqenknBmmQLplkBRTUcY9m5++Ao6A8XGKyMD4B23FGKcu+ADMotN1MO/i1zbQAUjHeh5cXTsIXCgK0RW6LqO7RYKqagpmIuMIMeX+dHnNRTyDdbJjgQc73fD2ZbOgSPESn/ydU7yFaEAL4AUcj5i+KQXFy1Rl/jfY1qbqt8DA79CGJFiTqpDk8xvYrAWpZMroPdBQ52SqI4G4yQdaIw0XMFLa7y0w7qZSsboscNY5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AErEhhSpBDMpQpOakCLzFEfQlH/QUP8t0f4NQ56epBk=;
 b=iOJI+7OmKlgjF30L5osJ3uY19ppA1YG8yI1zzUOAHgIJOdKs88XDHZQLfpKfzLtyb53zrBWUcbUayxWUrAESKNx/x6U9Bzd595ZM5Js78Zoe7LnOq7NnMftjGDaMsScLaqG6Fim7pHApLTC6XPvi9mJYV3YlvnsBrMWTZxqFwt7lSNMp0EZ29ykuhcg+CbZX8oieE6Wm2coNhUEWooKFoZAwZUHYSh1DMq+tQrVel2BQz5vmsH0OxPYKwj2oz77LaZaOxyytIw5qJm7xWx2wdyR0+mTp0DTJi/TYwYcmeCVOw1vSWzeHzQ4dH2KGAgpM6Tx1He7fLGB0kQfK3CC60g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AErEhhSpBDMpQpOakCLzFEfQlH/QUP8t0f4NQ56epBk=;
 b=WkS2UBn8lVh6WjrQGoarp61wicyV1hJ9rJuBRaCXrXjU6porF9I8uvLRxzaG8KtX57mAm3vfQ6eRJWMt3gKPBjW1XnKcw96h4EizLSIOBfzDZHm711Fggc8kP/pvZqMVn5vt2kFLnCSWQDfw2q92cFDLJvllTGvfT/6Aj08g6IOkng+U0IDxuVoOgZCCJFTSr17NgbkzjHBrvX8zNNxfrwvxGKtxQoLp9F20ISOhIopnEbmK+vXboShHgGUm/K9ClLQ+KhLRLoNDv4XswOe0icejAuhFBhTHDLXWQuB/TDCU/7eyAutTeS/L6kSsq97WLJNZDCBdVZsKbhC/rDUQWQ==
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
Date: Mon, 11 May 2026 12:37:49 +0200
Subject: [PATCH v2 3/4] arm64: dts: renesas: add support for solidrun rzv2l
 som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rzg2-sr-boards-v2-3-82aebbd27891@solid-run.com>
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
	GVXPR04MB12057:EE_|PA1PR04MB10357:EE_|DB5PEPF00014B93:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: c92faf0e-fbe2-4950-c3eb-08deaf4968b0
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 CKru9efDRKH0F1j4k24aNnK8puDc2uyouOfVLiyUGcQ8hCXxyqs/FD7wessThDdgD8GkJiHdJp8FhRPegXq1/ZSv/R3QjWilfMhVkDnsiPzHPMccm59bw8zZ1jhOlJonXIjAMD67LWEeU9gkKsg5y3ui4eNA2EFCAMCtIQ9t5Oy9pSIUufUxkWxBjivw11Ko7QUyoL0Q66/9KymkDD4rkMNto0OlXoQyunpceL3s3dj6dG2yQYOwwFRddlpNP11y81/k5uHoJf/ZTyUWpHW/egvsQWDDC54tkXdtEQRM/WzJx0F9KpQjJqCmBLvsNvxaQPvlo5DyV/PNU2JRSzNp9vBjPdsohZlgTw41noL8ONiB+pr2ze6FFngb9La5Dc8UBKyHR+qQgQky1kcDQUgCae0aQeEXlKsWZHi14F8ObzH7+ZoIiXHaptYCSWEVfSzQXhnxIyA3JL3iYb1VFTwgM4526fxFVxRl/JGZuferBmVi52TrbWci0WeJ9SAiw6GpGhjBUGeYtBLXeESvFp7dFEb1dVUNS4Y/b9lT2QAtw8ucXQwLFqR9bO4Yk9bT6zPQFI/TogaZkreWVoQETEsgCRX/FMUa3ZH7mrnnmlHLIbYxXe8CgNMxkqS8JickCa6x7t6fQ3gf5yZj4RjoXjQ53ANcQ2G7UVV6kNlaJTQ4uYlgldnMS3A8dyTiZQ97bJ0HnCEzQ/PFTqNsG4U06SKOIiu35tayvruZTCnYvkqsE1SnUdgHMLnmz/uCRouYlzN7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 MFWz3TxyFkE82P7xteESAZ68Zh59RC5Aw1pas374pzzXnDOr+og3z60jEmsc7w+6RkJ4qr7rRhoye7YoSAMD3Iu0B3Veuo3TBBaiek9HOUqicG4gBtTRBDSla+cMcvtqT1mu9VswlpW54UtEFm3HJG/AiPA7WKy2+mMQGhG5VZnf2xpeXz6NfYsxzaEpVws7c4HY9LCGtzbL3w0VXKSbgY8N8o4rh+lozuEVSLE5i3PSKfcp/xSphnc9Y1GGu6M/lcZ//gAdMHrVhzb5NJaT1kryhIq3zPpJ/VxvLrdPkaREJT/GBsNTvKaztW2DTynlE0icgfYqYW8w/07MfmAdnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10357
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: cee989d102874890b8ef7371c7607f7e:solidrun,office365_emails,sent,inline:5e585910611d2837dda89d7e66cbf95e
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4aece501-952e-4ce9-790b-08deaf495c43
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|376014|36860700016|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+WnKENRb+Yvun3vd1rTm9lBvqMRUaKZjmqjlUraqEhImvx16gtO3Sk+8Go/Iat1faMLY5LUcRrcL2RtubacD0l8tFDvaSR0HUGJThgiD1PnWLmK7q1Zns/qT5yRKLU+DZPca+LLoTrAMDgBmd3lKQkNZWVDybWKmXZOX/aK3N4tjxrpoN/yXrxCjXSjcTLo+cRG4Y4kRiObMTCLbBqlRjaMDflLB++bgRey6exKAyr+UgzZeNAW2Y85B/vXVTfhY3Ajt+8fY7ex2hXx/k7jGAR+IzFPbgm3jEm6mBgzYmBd3dDejhdifzQXwm5RWnhAyzt88emCB3D9+jETQQ6CHAJZckx18X1a5NdkHrcMBdJ6DCPnQROFLALdFUENuoNcYT2KF/t33d2ltU7Gemx1e6CBnU4HWxd6XW0NbdNKhSr7ypn+WqCA0CuNSd2jq40LynpfJceKzPdnN6suCl8YWZVpL+A7JADo8Saafoo438aiKkXvZsAL11aVhL1sP+lAEFKVxfCQgEewbiGwq3jdDvrd1vo8F/vvNrRlvaX1paz5kNRYcbcCXmS6n1CjqEgI4Fr5bD0razu7FBz/FSI/x2tyHepPPyD9SKXZGuMiyQaFEFEGsEDsm2/QPKjWN4jSSmZaCWz3dp8CoGIhQdijXbxbYqmyS5Kw3vUPIJSat6V9N3u5fBYPlcwOpgqaUBYQbyjmJVzFqh52OImWIYuVWiQ8h+cOP1+iYh1T82ogB2c8=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xa55ECMrt1ODIq4nK0FyWuZQw/D+MewiCfhzopc5sqXnHGi50qsHwwH0d9HhP0TuPla+cBDfhHM2i0flrm+uAuf3OpCtANqgmpX17HCo5P+CkfU43O/KYzGuGEuyv9k7lx3A7maSr6R0GuBJmmVc81kmJDftl61BrsWPlzwLVWX+BUXWf51+bkHM0VScUig3Yl+2RvLuwUyu/IKIAljFUJGCsLbi7swFi960vN6dakjJuyI0D72Y7CecIgEHae1ibTiUD6L5hWmvh3QYz7orLKEvzGLOHtGSAJiFpnVtaw+CildEukmipyqqNZfCKQqQi5fmS5qfSYQnr9cMe1J9Db/mtLFoag+rIGKQAOnWsgasE8vUlHxjLncLcSiM7xPQ/fqKkhjpPdPkAwQKVK1IRVYtm96ZXxnTYoGP4ggwlmITpLfzwxFSEK0+dmLmHaJp
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:38:15.6616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c92faf0e-fbe2-4950-c3eb-08deaf4968b0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
X-Rspamd-Queue-Id: 328D550C068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32372-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,solid-run.com:email,solid-run.com:mid,solid-run.com:url,solid-run.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
 arch/arm64/boot/dts/renesas/Makefile                     |  9 +++++++++
 .../boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts   | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 37cfefe66a308..cdf59f3240e27 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -188,6 +188,15 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 r9a07g044l2-smarc-cru-csi-ov5645-dtbs := r9a07g044l2-smarc.dtb r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot.dtb
+r9a07g054l2-hummingboard-emmc-dtbs += r9a07g054l2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-emmc.dtb
+r9a07g054l2-hummingboard-microsd-dtbs += r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-microsd.dtb
+r9a07g054l2-hummingboard-rs485-a-dtbs += r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-rs485-a.dtb
+r9a07g054l2-hummingboard-rs485-b-dtbs += r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-rs485-b.dtb
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


