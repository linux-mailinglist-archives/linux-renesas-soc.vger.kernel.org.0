Return-Path: <linux-renesas-soc+bounces-32562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPG4GmtCBGokGQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 11:20:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B620153087D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 11:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 198DF31FAA81
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 09:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E7B3C3444;
	Wed, 13 May 2026 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="jsLFqVm5";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="jsLFqVm5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023074.outbound.protection.outlook.com [52.101.83.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE43AC0ED;
	Wed, 13 May 2026 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.74
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778662832; cv=fail; b=QOEEulZPGczpWzLgJDSpTBm/vg5xNtviX1mO4Cu9Uo20PrqaKOm6lAnHqXvPyU4dXeWnCKYwaDv8CEYzTz5kV75aThLFxB5ehXTSr6xAs5o4+o9mc5F02tMTvitpK/K0bcCLFYKb0QJ73i7Q/gXHLeVNQNhBRZupkVQG+wUItcs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778662832; c=relaxed/simple;
	bh=K+Y+6ElWZSw3em1ZgFyuVFUu+O+SsiY9GXkBMiht0GE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e4hxEdH/2C3c7ZedHDWPNO2W+AS+InPh0kx7IH6wO/RS8mSDrb8OGE/+O/S/MtGSUIm15euH/GFG4ws2m26RCkvJ6mTP5rOhrPntpEJTdGvOh3AV7d5QJXTvBcNz7OfyNZhyyp6J5c9HKpBH6bErmssiR+fsyNySExvbFrB6UGk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=jsLFqVm5; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=jsLFqVm5; arc=fail smtp.client-ip=52.101.83.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qjtdNzx/IYyoPffZJE7eYygl4ZA2cGyTg7Wtk/iY5pt6ZAnjFfpcaKgxSGSrVXri9Kq5G2zl/pZk3cg+NWIrhVWGtD9kt/l4BoSSZgNxKZ4EhRi+Bw5akYEy9RRVnMxs2O5s+/KCKjlUe9GgPl3wQ0XbKcPwHcYKd6C8go2ApcvLeP3oq1l6/Aw5w6WgkmdcFqs8Cle6DAzyIVSpwawLaQE2TWrGIWwx38+lkTSFzO45K6SLqFSLxFFH6FdgViNrhz567H8OavgMIKNB94cJQIzdagdpgqLP8iIzPibAsKTse4btsTiYXFJDNocetB1FYLZnyMb3X+wVe9xShUjylA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+Y+6ElWZSw3em1ZgFyuVFUu+O+SsiY9GXkBMiht0GE=;
 b=UT6E21h/76hx6Bi5lwLzZ9jxov9dXd+2boP75H0YGa0xn2HNwhnE9dOzOZjHGIL5ICu+CvDpy3VU02zvs+mDSHwQCiNfwLCiYk/wEFwg+7mZ7LM8ZDY67hu8Im8UxJVDp7p1I2G8oXQgjibeUK+39IFef90hA0qt9hk/o5ta73aWEFyD1+PvOwEQOIWfwxqtE9S55uUHpPM9O4udhCow5MXztA2/NHgFDgEBg4Nv0vJ+Qoc85WDUbYxDIhDGMUx5GDhDI2ryDjGDXQarq3/B+3s+ERuD11Otu1ca8okp0q75u6pEGubOsty0wjTxg57S0Y0zC0UYLC69gVLWDejwcw==
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
 bh=K+Y+6ElWZSw3em1ZgFyuVFUu+O+SsiY9GXkBMiht0GE=;
 b=jsLFqVm581eWKhLsovK5Ri8lOZwFLaPrR/8g7QecnUMfi71UCib2aALSLF7t1hZU3EHnhayvYMWxobkEVoFHqxa7X1+cpQh9WupBtH9UU8utAITZc3LZBj75sdhRUyp88ZIpIBPAbfo+VZkbPsFMyLQ4Yzw4bzYGk0j8dHddombMHPduDVOJ7lAmH/ZYfDXN6IMCFvnmrn3Edb/LtH054AcF2r6gzi+YiYGij8iPw1ze6bjk+8YikayG9gIvVX+dp0QxWQc98QB3HhIfw0YhkmDdWSEIBH086GDLM3A1suQDSaEk3YA1/R0RvJx6HDDMmAJT3Cf+2TVBcoiEZrLDeQ==
Received: from AUXP273CA0058.AREP273.PROD.OUTLOOK.COM (2603:1086:200:1b::18)
 by DB8PR04MB6969.eurprd04.prod.outlook.com (2603:10a6:10:11b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 09:00:21 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:1086:200:1b:cafe::b) by AUXP273CA0058.outlook.office365.com
 (2603:1086:200:1b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 09:00:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Wed, 13 May 2026 09:00:19 +0000
Received: from emails-1181905-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 7E0507FF96;
	Wed, 13 May 2026 09:00:19 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed May 13 09:00:10 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgP4LZ4LXvyBTCvMhoGSNrsr6EcvoDEqbXTTx/AIUMkE0VQQmHdxfFfFkB/vyLGWyKLnzmic7twRKWTCzYG6UdGh/z7QH/3kS0BGnjYE9vero2uX+GHwz8+OVcZ7c5Ju7jjwOUt7cfOB6wzCgNguKmSVDAK+1Y8bCTUprONQvpQAGpmhCoS3PO4NMY9YHVRuG37EC8HUojf5pGJD0oL+u5avvoN1H8A+eUPW8gCjZnv4/tIHThrfu2dkRjPjb6B0HdUFMs0PTlILBoRGlFvllJnQso0fzJ/3ZNirXpSX5Hytv4+mzbigd/UYNsBx11MQWKNEFez9uddjRxn6U0nUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+Y+6ElWZSw3em1ZgFyuVFUu+O+SsiY9GXkBMiht0GE=;
 b=JU11f5kq0pOR3IqtJcupNVkCDCByjegt24DMRaur9ynubkLqxQ6zQSVYV6WJ2q0TojBfl+OsJsNhki89ei47XyI+y5Q411d7wzkleESBWYCBYm4yB/59HKn0XXYo2C9Xb97Zlw66rfgHcUfYvm1XuJIpf0zqDDhGzFhKYH4ErkjUglx81dte4sQ3DQ7394dndJZjlB7KaAMX/XYy5QswEhqdWaUkkDBmIpxk5tEDD0P4IlFIJKXJz6BAQeuA9EUhNuZWL6Hpm5OfdNDEY2h6G0F8P3IYjJfEm9hrqIrxijmapA2J9YN+lskL63fRc8V7vOtXJVAax3Zhe96R2byqKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+Y+6ElWZSw3em1ZgFyuVFUu+O+SsiY9GXkBMiht0GE=;
 b=jsLFqVm581eWKhLsovK5Ri8lOZwFLaPrR/8g7QecnUMfi71UCib2aALSLF7t1hZU3EHnhayvYMWxobkEVoFHqxa7X1+cpQh9WupBtH9UU8utAITZc3LZBj75sdhRUyp88ZIpIBPAbfo+VZkbPsFMyLQ4Yzw4bzYGk0j8dHddombMHPduDVOJ7lAmH/ZYfDXN6IMCFvnmrn3Edb/LtH054AcF2r6gzi+YiYGij8iPw1ze6bjk+8YikayG9gIvVX+dp0QxWQc98QB3HhIfw0YhkmDdWSEIBH086GDLM3A1suQDSaEk3YA1/R0RvJx6HDDMmAJT3Cf+2TVBcoiEZrLDeQ==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by VI0PR04MB11783.eurprd04.prod.outlook.com
 (2603:10a6:800:2e6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 09:00:05 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 09:00:04 +0000
From: Josua Mayer <josua@solid-run.com>
To: Conor Dooley <conor@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jon Nettleton
	<jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan
 Shhady <yazan.shhady@solid-run.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Thread-Topic: [PATCH v3 1/4] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Thread-Index: AQHc4g9Dd2m2P8Mt906AfPXCywm1zbYKn1UAgAEKUwA=
Date: Wed, 13 May 2026 09:00:04 +0000
Message-ID: <f2fab17b-fd70-4d83-afee-3809badbb748@solid-run.com>
References: <20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com>
 <20260512-rzg2-sr-boards-v3-1-f033fc96c906@solid-run.com>
 <20260512-roundup-graveyard-08846d29007e@spud>
In-Reply-To: <20260512-roundup-graveyard-08846d29007e@spud>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|VI0PR04MB11783:EE_|AMS0EPF000001A3:EE_|DB8PR04MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: fac5b628-d915-4a74-8056-08deb0ce0f64
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 K3nubYgi7AS/xSLWAKyqktuOXcL0iyqx9V8jjHQadFFhPTOns5dU/oTHgMciLtLj1rZe4X8J8zU6vxLtiKsndspWG/nRy5UekaZLlhVuAoFdkjEH8AfILHuWBX+lZ7+r+weormAjJBsuSSInCd8bCpW5CvDQnWdul7QJ1o80r0WqJZKeJXAwygV/F1fEkHGI/DUkmGzG+Vh0/kLMxkfu9KgdZTs3IUOPPdZXvvzYPjYlpO9UueU/7ytI3WKYC+9T1JKS3TSFQqq+xx+7g5PQMNbW6H0Z/2eCKo3CBl5ud7g8Iyi+fk1mpfa9PprmQUfkBIAmuEtNVHm6W6NHFL3Z+FkMAmB+wiWKiKFIwBoL8e4rJBJ52dP7yZ3tkt9M5QzJlyqBjmIy3rCfcdt0O4ewY1nIIEwj79a8w+jGpMsJe+HfxXb7nS+C727xhOP9ykQtD9KT6atBp9sqljeseGVjMFCCkouQFpmAHwRbMN78hZs/LCVg6oUhwS/v+jSpq/OEwCAr+Y1GxcjdlVIpZiYXVd+gN+oKR0M5vXsF+cEKQVTa356ViaACc6CM9MHOP3JU34Wlewwvan9j38MpHERvEuW8Oyb3cmQtfh7jXeaTipCAngEQM5n+vOXhrAyoc7gVb/Pbvo3JqfmrGvzRny4oR/5Rd2POLKXxgO4vuwcKT/TvMr10zeItXkRTv+jVa/PdNCaK6ZGBITyV4UxSiED46Mh8J3O8iqk7zIvCBEVabBWepOSuLyB+dl0XbID6yyrw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AD7413CBE886347A57D967FE8EC2FA4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 HKyhBAjsyYyGF1lrNqMRBT58muiFJEspyhwq6jrIvBb3ais1YlzTSvl0FfIKh7xeM5XAOIYmEKRnOISyqGcXktBfVOz9/2wCslnoXUNKyym2OF4ldVvwqGEno2Shu5bKdJ5jQYXYHmqfcZp8cOsekH3podjGLF6R0wdlUX2KejNSO9WmjNTTWJEjKRBZgy0o6zEX3YeXx5ch4OHTzHJusm5X8Au2JiYk0YQLGaIOYak/KSxX/yei+vB0FxxSiUUsTQM9k4XB2ZuC/ppIGBkVuPhTj3rIVAi1Hs+BF9im3H18nWRraagPjmkgM/Np0SPzi73TDINonav4Lm28ShmZfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11783
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1f1ce7c442a84716b22a92a2aabb6da0:solidrun,office365_emails,sent,inline:e081801026e1114221e793e6fffe694b
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2e020d39-2fef-487b-06b0-08deb0ce0635
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|14060799003|35042699022|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lESWsdRZGXM5LOMuKrIUy6gnwYLzj8w58ebzaUx2G9mkeKwzzcLtCSBJKsuU5zja52EYZwI8VeopBAMBtkkEQE4NpZoaDzjGjewN+L8wpuzcE6uTf9AW+MXeg6dWDbEierpcjJbE+q9c6YEWYWRb6adZKD+DztXnL4JW1+HoRjextFJsrSsDqCTwYiU10GRbfJUih+GLst3KkZtT8YryKmt/yH6ST8XozhnTzgcItUfevS62oj/8yl++9fPAHyIR2QYLTs7R/Up+Ri3lHidlGIBGReSmurmc1aMhJbx1yJvoFMg9aHnxnOguha5MYQEj0aUDDqGm3K3SfOvqu663QF7IGxNX9R9ptkNs/yrWm+Mtlx91okyAL2N/R7i+8csfpXPNo+0oZOoGR9wvS8E51R4L2zbowyWY68tHLO6cFo/zkO4NN/D8UtEMQYxJnk9rfIBxNlE7Dqn1NdNFVCgcfGenKCF7VoMpcvCbZxW92uxRqgNizgxVVUCMMjNP9+GXc9A+9t2RsOvP9h1E8WI+J8KgvoXq/XEEeZ7IttXylEu0mgfqYwAI68bKOz03tdG0BqoFOujGOxiUpvcwBxid0BvvuHEoMaET/l1KWV9bCnCEu5Hrgiy+EoFsklrxYD6EPKXJnON4OKID35TqmQntV6uzlOD7bEK3paaZJpoICKgSP/wCeI1onKidz3ij/PnswfaMh0NDLVQOwrHVR+OKvdgFOD/tHihOUuMvLi4d9vU=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(14060799003)(35042699022)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	emcM310lRG7BW0lv3oSGk4KrhjER/y2ZexKlUeJuWzsHL9eSAEwGHqM0zrbYHacIBYO92JH8ioDsAkUtaHo+qpyTM0cz3fEt1Tk9O3iIiZT6+eHCJ0yoYUbYspYvsC49CnD9jfWDRWxnUnzGHF2OGGhx5X0ewCq3X4dqkS2IM6y9DzHlP/RHIcYzGEZmfxp/c9YO6b42SwNNEk+RV+u8u7eeoVcOX4tf8GhVuQ2WdKDrIVL5oVxWNza5KXKF+8pvaD3kkWKN8mIX2D0A1wVeEiZHMyOLbBJBhA31avrR4pjufQr/GM8rxRM6TijNte7q2eGFf9uTgIUe5rsLK1pFIuj8RoA5TLUztV+kUo77qUQegMvPxBuTcJE1KfVNDNT98fqxg1ThXocxtkW3AElHPtXGl/68eN6l3rdn+kyYf0J8prnuKYK/UROgCCX6jUzs
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 09:00:19.7289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fac5b628-d915-4a74-8056-08deb0ce0f64
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6969
X-Rspamd-Queue-Id: B620153087D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32562-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,solid-run.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,solid-run.com:email,solid-run.com:mid,solid-run.com:url,solid-run.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

QW0gMTIuMDUuMjYgdW0gMTk6MDYgc2NocmllYiBDb25vciBEb29sZXk6DQo+IE9uIFR1ZSwgTWF5
IDEyLCAyMDI2IGF0IDAzOjAwOjA1UE0gKzAyMDAsIEpvc3VhIE1heWVyIHdyb3RlOg0KPj4gQWRk
IGJpbmRpbmdzIGZvciB2YXJpb3VzIFNvbGlkUnVuIGJvYXJkcyBhbmQgU3lzdGVtIG9uIE1vZHVs
ZSBidWlsdA0KPj4gYXJvdW5kIFJlbmVzYXMgUlovRzIgZmFtaWx5IG9mIFNvQ3M6DQo+Pg0KPj4g
LSBSWi9HMkwgU29NIFsxXQ0KPj4gLSBSWi9WMkwgU29NIFsyXQ0KPj4gICAoc2hhcmVzIFBDQiB3
aXRoIEcyTCBhbmQgaGFzIHZlcnkgc2ltaWxhciBwcm9ncmFtbWluZyBtb2RlbCkNCj4+IC0gUlov
RzJMQyBTb00gWzNdDQo+PiAtIFJaL0cyVUwgU29NIFs0XQ0KPj4gICAoc2hhcmVzIFBDQiB3aXRo
IEcyTEMgYnV0IHByb2dyYW1taW5nIG1vZGVsIGRpZmZlcnMgbGFyZ2VseSkNCj4+IC0gSHVtbWlu
Z0JvYXJkIElJb1QgWzVdIChSWi9HMkwsIFJaL1YyTCwgUlovRzJMQykNCj4+IC0gSHVtbWluZ0Jv
YXJkIFBybyBbNl0gKFJaL0cyTCwgUlovVjJMKQ0KPj4gLSBIdW1taW5nQm9hcmQgQmFzZSAoUmlw
cGxlKSBbN10gKFJaL0cyTCwgUlovVjJMLCBSWi9HMkxDLCBSWi9HMlVMKQ0KPj4NCj4+IFsxXSBo
dHRwczovL3d3dy5zb2xpZC1ydW4uY29tL2VtYmVkZGVkLWluZHVzdHJpYWwtaW90L3JlbmVzYXMt
cnotZmFtaWx5L3J6LWcybC1zb20vDQo+PiBbMl0gaHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9l
bWJlZGRlZC1pbmR1c3RyaWFsLWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9yei12Mmwtc29tLw0KPj4g
WzNdIGh0dHBzOi8vd3d3LnNvbGlkLXJ1bi5jb20vZW1iZWRkZWQtaW5kdXN0cmlhbC1pb3QvcmVu
ZXNhcy1yei1mYW1pbHkvcnotZzJsYy1zb20vDQo+PiBbNF0gaHR0cHM6Ly93d3cuc29saWQtcnVu
LmNvbS9lbWJlZGRlZC1pbmR1c3RyaWFsLWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9yei1nMnVsLXNv
bS8NCj4+IFs1XSBodHRwczovL3d3dy5zb2xpZC1ydW4uY29tL2VtYmVkZGVkLWluZHVzdHJpYWwt
aW90L3JlbmVzYXMtcnotZmFtaWx5L2h1bW1pbmdib2FyZC1yei1zZXJpZXMtc2Jjcy9odW1taW5n
Ym9hcmQtcnotZzJsLWlvdC1zYmMvDQo+PiBbNl0gaHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9l
bWJlZGRlZC1pbmR1c3RyaWFsLWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9odW1taW5nYm9hcmQtcnot
c2VyaWVzLXNiY3MvaHVtbWluZ2JvYXJkLXJ6LWcybC1zYmMvDQo+PiBbN10gaHR0cHM6Ly93d3cu
c29saWQtcnVuLmNvbS9lbWJlZGRlZC1pbmR1c3RyaWFsLWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9o
dW1taW5nYm9hcmQtcnotc2VyaWVzLXNiY3MvaHVtbWluZ2JvYXJkLXJ6LWcybGMtYmFzZS8NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKb3N1YSBNYXllciA8am9zdWFAc29saWQtcnVuLmNvbT4NCj4g
RGlkIEkgbm90IGFjayB0aGlzIHllc3RlcmRheT8NCllvdSBkaWQgaW5mb3JtYWxseSwgYmVjYXVz
ZSBJIGZvcmdvdCB0byBhZGQgdGhlIFNpZ25lZC1vZmYgLi4uLi4=

