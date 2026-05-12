Return-Path: <linux-renesas-soc+bounces-32488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFKrNHAnA2qw1AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 15:13:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F25D520DF8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 15:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73BD8308A6EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 13:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E266395AC7;
	Tue, 12 May 2026 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="N6fI22XM";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="N6fI22XM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021112.outbound.protection.outlook.com [40.107.130.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D344372064;
	Tue, 12 May 2026 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.112
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590850; cv=fail; b=pznGxm6DLTJm+pkUrCTM/NziSKb8nq99z4UUgIk0aSviTt7AAdq3GYUsHwzDqU6sIPVDCINDX/8wnbIO36ISlUTL1qYW0PtJQ+oILBgY9lyAP/LxXZUEVD/n/kg3PBaBC5FKiliZ/Ft8qB5h8F9jUpcK4fw3nMec0tk9AnMM/8A=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590850; c=relaxed/simple;
	bh=MjAj/uaikIohzziTQ5vXQSq/0zK8wtWZiuHYvhtCs3g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uuu9+9T0wVVfxkGLMHUiBC6vec4rAAU+0Fy8R1Jcz+POySoIRyxK6htcwj1GjFzDd73TJo9GxmJC5b9/c0p2Lz2bqvLbjTUIggNxi4N94L352HF3nR1rxgpaGgCm62ywEp1/9AtVBlSoZcA5ZlYpyvSjP/R47jkYNpsdR06hwfg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=N6fI22XM; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=N6fI22XM; arc=fail smtp.client-ip=40.107.130.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gIIi+QD019gwtIBJr1kuEhx80Zzu4CjjqtYumFKlEtct9wuKX9FNCfEgtaZjWbsiAfxVOzz05q1h6id71QPFM2BKburdQoEjIdrlb8DlisyB8UuQCgJJwNYhj0ceIpjO7xc+OFTjQRIyzGNxBX42tCAeXMGK/T/3s336OYVVtRfi/KvMA2Wz/bn3WtPClinToLL6yNwYjNWNXrJD6cIlt6rw6lil7tNQRTRYwN+cWYKhLAoTxqHCVtfCHIttXmVQbrjkpWspzly6wmQ0LeL/0yIuSlzMQzeEdWumxmxOYnX6xUCRRLUx5Ib8CeLCGwG4pfr/NHdTX+FGe+X5VUJdEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1u/Q1LI1yfEYH6loh2w38e/iyPoOHyQ8wKWGsCO0fUE=;
 b=Qpx9wVcKZM/MpwTj5meH7Z3vQ5JPNNynK6MQQdJESMC9/Y7paQ/RE6SSmE8AX0hX03Y4DQ+rEvMTBL5TVmQEuCuDialncEG5OKCNHYrsADQ/58Yr4CRScUXU7pxv2efvn0wSplS0uwIbQgeiT8xD2riU75KM9oDQps4Ve6KS9xMiAb36pUMxK4Bo6jav1kWSkPtVeQc8AgOYJcwumriqj7pPwp5Bvc0FxZER8JFt2NyrFsvBNYr/PzCQfyjuRTXddMi7fB5ZK/bWbiiOAeH9G95Pt6MI9auLYB9lw3fm4po8e0lIgWx/hlISTkTkYOhKrLWpEY291YSPYK6tRDuKbQ==
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
 bh=1u/Q1LI1yfEYH6loh2w38e/iyPoOHyQ8wKWGsCO0fUE=;
 b=N6fI22XMx+GGIezc2N0qWnXl7ID4dn01xf790OeoagTo3FlvE2xy3wEK0vg9cTkpfqSFBXBJVQ6VPXY2CIz/tjalRUcI7gInJ1OG/f2gXDJGKHONbfCl4UOZs5JfNDiilLiL8vsE3OmNEWzHTGhpjLTq7xtdsbe7H2a4Sx5XlCx3J1PVC13OinvkhJrEjWRY26SdsLxKWvjQTsUKsAOBpxWLHeZDSZykgrywAbJfbYKeQfQXSdSPRnqo45o/BqJ/F8xnMx++qS2mrJ46/vBjQ/UA6zUvq2xVkMhE//KsT4xounHjCCou4i+uAGPGg2AyRpedqZuG2mjTzG2XtArQpQ==
Received: from AS4PR09CA0026.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::9)
 by PA6PR04MB11945.eurprd04.prod.outlook.com (2603:10a6:102:51c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:00:43 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::de) by AS4PR09CA0026.outlook.office365.com
 (2603:10a6:20b:5d4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 13:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 13:00:42 +0000
Received: from emails-106719-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-103.eu-west-1.compute.internal [10.20.6.103])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 867CA7FE3C;
	Tue, 12 May 2026 13:00:42 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 13:00:18 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grc2CaeRUjw2l8vhvYOIDYWuFVbnrMsvrnzC7Z+f3P3lWKK7fakdd0TVaqkPUsEgMwK/JWaFF7sFa/2cb8YBjtPrxC2PtRVKoRIayMudiatsp7tRPB7Q2yDsruqkQeOGJka9ZTcF96FdSpdhTG2GYGHTFSiHDFMLxDlbTmi6hPQkxaKyaJgpxH7PWsSilhiK8W9Lt+uhc6KjoT4PDtTFYMzzKi7/VFsjJDCBgEBigtfzZJZSrZlgmgfcYYX9wMsCXrXsVfnsSOhyEJMiY9VfxGPgwTKU5UFDpb20NE+/Vs1d1mgyDb+T+Tai2+Uz7j874oPWGRoPho3BDmvYPyVt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1u/Q1LI1yfEYH6loh2w38e/iyPoOHyQ8wKWGsCO0fUE=;
 b=mvmY7DvVDrlaGBK4ER/l2IUG7wmln9daZ5xseD4LroLUprplPvhXdzy1OgYejTb8hK1fxEa5CANyqB4AP8/f3aytQQSfxs8FXkd3AvCm94ZD+6jm6fmqRPQMLdpQBUskDLEb7HuG1LXHCAcJTRyxxKsmx8zt5adL8/hM52N25SEZc0YcASQHLPlqv8omM+avNC4QBw3XSWGEVQEIflYy/2kUArCB6mX+vCky4mIOQYEpT4zPq9dGMiG0Qi/RmcCFEFlj/fprVejLUYsUlEGoeJRsPR6+fi0mefXgQ9vJQMIxfuL+So7DwxozMwPUl6Flv6F7Yxq5dzMGF24xzxqqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1u/Q1LI1yfEYH6loh2w38e/iyPoOHyQ8wKWGsCO0fUE=;
 b=N6fI22XMx+GGIezc2N0qWnXl7ID4dn01xf790OeoagTo3FlvE2xy3wEK0vg9cTkpfqSFBXBJVQ6VPXY2CIz/tjalRUcI7gInJ1OG/f2gXDJGKHONbfCl4UOZs5JfNDiilLiL8vsE3OmNEWzHTGhpjLTq7xtdsbe7H2a4Sx5XlCx3J1PVC13OinvkhJrEjWRY26SdsLxKWvjQTsUKsAOBpxWLHeZDSZykgrywAbJfbYKeQfQXSdSPRnqo45o/BqJ/F8xnMx++qS2mrJ46/vBjQ/UA6zUvq2xVkMhE//KsT4xounHjCCou4i+uAGPGg2AyRpedqZuG2mjTzG2XtArQpQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA4PR04MB7934.eurprd04.prod.outlook.com
 (2603:10a6:102:ca::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:00:11 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 13:00:11 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 15:00:06 +0200
Subject: [PATCH v3 2/4] arm64: dts: renesas: add support for solidrun rzg2l
 som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-rzg2-sr-boards-v3-2-f033fc96c906@solid-run.com>
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
	GVXPR04MB12057:EE_|PA4PR04MB7934:EE_|AM3PEPF00009BA2:EE_|PA6PR04MB11945:EE_
X-MS-Office365-Filtering-Correlation-Id: a09d2d10-04fa-4425-b79a-08deb026799e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|22082099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info-Original:
 055RkkDxoQuIRafl0l2GXCUHVv9IVICMJtZiiEUyyK9LutAEA0osNi/LZz602KBuGOkAMbqrExPdJBQKY6yNlyLekgtKXPzVvFk8mYng0rHGEZJlkaXKvSBYb8fbbd/sVXMvTp8vkioJXQ5CZ78Tn5mbRY/wF1QY77/5ATlFRUPP1/o94HUWnd1rXVid/QWuurKTYXCptpm5McKh9ZR/NBHksSFIUKyh7QqLQbXBw1paGtdMvzzTgUJlgjx4jzLlkdCVDfiVppfI70lx+D6iiXlEuiS6Spu9Bvv9PqhCNh4l+ANJnvKQW/XZOweNlXmUpbjefm0wEXqnaqM04IWdDCepUkDTCfl/RIfgp7oK6DjSSCyQKZK8ngRnQIsi97DDKbamZSHsAGgH3KOGdqWZGzQVJXmz6CT5H46dK4ZeCx/azOGRM/M/2jCDpC67WfJ6I6CqleecdeKaE+4dbiuZ6zFV9qR5UxA6Fbyy9DFdpqC5IldvMt+OtDWQr3ERGt8/rTGD0UV1lfTpvbCLG8cWlpbYGSJWv1z/KPZsSeGOVFjHLpTL3caxVuaWWts+4mrU1o4JF1PS18r6tE3MfPiuKbXU4rVa2kNn5COZGEAF4pja3sCgYtf7nfhhvONzjgu2plbyzciqDFd3Dqp3M85DoQpxkxGuxwYe9V2wS4B2SC2EsbjQbshMKxU2+18vVvHhxhiR3c+dzrWZLddQqseIAbrZyGO4mG0imPDnA1D5rnlHL92JBAPuAnbCrs4B8YFr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003)(3023799003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 QNyiRrdnd1xpe+WRMn1VItJqp4tEDWY50+wEV6upaaTw2L91NuI6k5mt8h10n77ZM+4EyktzSO9D5v8YlFWYDYPjNGV3Xzr4myPcAXj2gaS9UFlkKQ1u/2Ol/FobtZiewiJ5JO1UpjnsY3opN/1C5Q4TMtQTu6jxquGSAhdxOA2QE9fpIdb9uIgohwPt+FmHwMHAEn7zVeO5FEHUWOpqJp0lWMenlXF6nCEOBoyyL3VHxVLLe3KIVJWJw2iMz8DZ9pCCp37WmfuTJ4BHnm3VzqDP622wJDxdebsFAK9y2jc+YHqRBtwDM3HgKFHGbCSPLK3cEwrZEuTDnWXCuDTwmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 926426606a044c0a983054b28a23786a:solidrun,office365_emails,sent,inline:7a8888ac466080aa94ee14b06e0b315c
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	987e03ba-6d0c-4df2-ffe1-08deb0266689
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700016|82310400026|35042699022|376014|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	L8eOOtW0GsVGMq6016eyHNq6w11w+wY5q221rtxazPoVMRMqiFjGAr6c+ld/6kfMM/oHQ4vNUAW7VnQMQONyrO/eeWgzJtTWp6gLv18aS76AhSWNF8vBpAoW8RrJoT7EjaohgzV675dJGwBPueuv1OdBNqGhmHdiuI+3tuHsSjUFZCr3egHaikd6W6et6VTnwDhQOxNWYIoqdEvswz+iQHg1NrIZGIGjbctMFvCDxx0a6AIu1kOmG77Kirmrb3w4OxjxXhJ0xE3vSsgSaU+YpMAOaK/S0srHXSNaOzz/sX/OKZ3YEkntQbHdnlAHttWTQyTyyNFKoNUfyy+e4/H4FVyq0P90dvoBbP6eP1yg8Z/1i6lWqJ4a589t04g4K3O3QuZCLFJZ2wjArWhZwi+YtO5cNTgwH/e68eEElUJDWkJ+k8KYtdx+13usNi+XSbMO3RnR72luBKDhhVMJyY4lHTJ5UvKB6vXsViGx4ZGG7hiZvst9Z9GXmMO9Pp9+2POc++7o1VSpBOiNZPr9j3Fx89IynMLly1v/b9sUpN+YhCYWsQFaJAYSbtSZK+STcYqJWEzYNyyannxZUMwboHVCKXg0+DD3K5JresxkMXHfVe4btwC2ZcZ7FqctPjqbPvhQzy/rNs6n6R63/iNfa8r+Rb+GPeTB7HFqrHamxxCdJkX1QRbY38EzyKM6tGoo8WEx6e5tJXeIw2f+eSkWHkOm60vkkhCm+D/joi8Z4jieTs0=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(82310400026)(35042699022)(376014)(22082099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jE0B81AwSEtyWx4oxnIzr/Jrrh0bs3IP8i8SxjPHaRUgwXidT7LBBkV7tdUvMnUhHE0zYzXbP3LowWuzPJ0eky87j3lb9Zh8GzXyWOmHTTOeaP8HKOpiOvofNlHptfrjoON/SG12CO+CAvcNIWlXu27DO/HaJf8ztWP4in+CPNXUrYhKLVIQITjFI49+OXi2iGk62V9c23t+O6wdYBN3Ix+frlDWi72HXq2iLtBxOBFnzeopGKS5o2ECNNP34M7VXe7BOnSxz9LxKqbeiPyohA9ZNUFaJ/e9PigfTiGaIH5Sqk8juBWovLu1RkjpsWjhMThT+qKAQ9hP8bNqG8B1K0vhmhMThGj1mYGb01qXxclypLYICcgHJfxJH4soK+Gd2qDgKW3FfaVqay24FzMz96p7GzcR3wOXk/f23MOFbWMaToTFFHTm9ERHueXAwM33
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:00:42.7863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a09d2d10-04fa-4425-b79a-08deb026799e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11945
X-Rspamd-Queue-Id: 7F25D520DF8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32488-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add support for the SolidRun RZ/G2L SoM [1] on Hummingboard IIoT [2].

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

Descriptions for eMMC, microSD and RS485 are provided as overlays due to
their dependency on configurable mux states.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  13 +
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |  16 +
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    | 572 +++++++++++++++++++++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |  26 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |  17 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |  17 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |  49 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |  44 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 421 +++++++++++++++
 9 files changed, 1175 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index ca45d2857ea7f..38163ce845e7a 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -169,6 +169,19 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 r9a07g044c2-smarc-cru-csi-ov5645-dtbs := r9a07g044c2-smarc.dtb r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-sr-som-emmc.dtbo
+r9a07g044l2-hummingboard-iiot-emmc-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-emmc.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-microsd.dtbo
+r9a07g044l2-hummingboard-iiot-microsd-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-a.dtbo
+r9a07g044l2-hummingboard-iiot-rs485-a-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-b.dtbo
+r9a07g044l2-hummingboard-iiot-rs485-b-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-remi-pi.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..eba4f423c8f05
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2l-hummingboard-iiot", "solidrun,rzg2l-sr-som",
+		     "renesas,r9a07g044l2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2L HummingBoard IIoT";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
new file mode 100644
index 0000000000000..fbf2e7c393bf3
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
@@ -0,0 +1,572 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+/ {
+	/* power for M.2 B-Key connector (J6) */
+	regulator-m2-b {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-b";
+		gpios = <&tca6416_u20 5 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		enable-active-high;
+	};
+
+	/* power for M.2 M-Key connector (J4) */
+	regulator-m2-m {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-m";
+		gpios = <&tca6416_u20 6 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 3 */
+	regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		regulator-always-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpio = <&tca6416_u20 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 4 */
+	regulator-vbus-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus3";
+		regulator-always-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpio = <&tca6416_u20 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	aliases {
+		gpio1 = &tca6408_u48;
+		gpio2 = &tca6408_u37;
+		gpio3 = &tca6416_u20;
+		gpio4 = &tca6416_u21;
+		i2c3 = &i2c_exp;
+		i2c4 = &i2c_csi;
+		i2c5 = &i2c_dsi;
+		i2c6 = &i2c_lvds;
+		rtc0 = &carrier_rtc;
+		rtc1 = &pmic;
+		serial3 = &scif3;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		wakeup-event {
+			interrupts-extended = <&tca6416_u21 11 IRQ_TYPE_EDGE_FALLING>;
+			label = "m2-m-wakeup";
+			wakeup-source;
+			linux,code = <KEY_WAKEUP>;
+		};
+	};
+
+	can_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		/* default J9-55/57/59/61 to on-board transceivers */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+		/*
+		 * Mux routes CAN bus signals between SoM connector pins,
+		 * expansion connector (J22) and on-board transceivers using
+		 * two GPIO:
+		 * - IO3: 0 = on-board transceivers, 1 = expansion connector
+		 * - IO4: 0 = J9-55/57/59/61, 1 = J7-12/16 & J9-54/56
+		 */
+		mux-gpios = <&tca6416_u20 3 GPIO_ACTIVE_HIGH>,
+			    <&tca6416_u20 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	spi_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		/* default on-board */
+		idle-state = <0>;
+		/*
+		 * Mux switches spi bus between on-board tpm
+		 * and expansion connector (J22).
+		 */
+		mux-gpios = <&tca6416_u21 0 GPIO_ACTIVE_HIGH>;
+		#mux-control-cells = <0>;
+	};
+
+	scif1_scif3_b2b_mux: mux-controller-3 {
+		compatible = "gpio-mux";
+		/* default on-board */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches both scif1 and scif3 tx/rx between expansion
+		 * connector (J22) and on-board rs232/rs485 transceivers
+		 * using one GPIO: 0 = on-board, 1 = connector.
+		 */
+		mux-gpios = <&tca6416_u20 0 GPIO_ACTIVE_HIGH>;
+	};
+
+	scif1_rs_232_485_mux: mux-controller-4 {
+		compatible = "gpio-mux";
+		/* default rs232 */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches scif1 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232, 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	scif3_rs_232_485_mux: mux-controller-5 {
+		compatible = "gpio-mux";
+		/* default rs232 */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches scif3 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232, 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	v_3_3: regulator-3-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "dsi-panel";
+		gpios = <&tca6416_u20 15 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <11200000>;
+		regulator-min-microvolt = <11200000>;
+		enable-active-high;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		regulator-name = "vmmc";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		startup-delay-us = <250>;
+		vin-supply = <&v_3_3>;
+		gpio = <&pinctrl RZG2L_GPIO(4, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J5003 */
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpio = <&tca6416_u20 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	rfkill-m2-b-gnss {
+		compatible = "rfkill-gpio";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 10 GPIO_ACTIVE_LOW>;
+		label = "m2-b gnss";
+		radio-type = "gps";
+	};
+
+	rfkill-m2-b-wwan {
+		compatible = "rfkill-gpio";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 9 GPIO_ACTIVE_HIGH>;
+		label = "m2-b radio";
+		radio-type = "wwan";
+	};
+};
+
+&ehci1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd2-supply = <&v_3_3>;
+		vdd-supply = <&v_1_2>;
+	};
+
+	/* this device is not visible because host supports 2.0 only */
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd2-supply = <&v_3_3>;
+		vdd-supply = <&v_1_2>;
+	};
+};
+
+&i2c0 {
+	/* highest i2c clock supported by all peripherals is 400kHz */
+
+	tca6416_u20: gpio@20 {
+		compatible = "ti,tcal6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "TCA_INT/EXT_UART", "TCA_UARTA_232/485",
+				  "TCA_UARTB_232/485", "TCA_INT/EXT_CAN",
+				  "TCA_NXP/REN", "TCA_M.2B_3V3_EN",
+				  "TCA_M.2M_3V3_EN", "TCA_M.2M_RESET#",
+				  "TCA_M.2B_RESET#", "TCA_M.2B_W_DIS#",
+				  "TCA_M.2B_GPS_EN#", "TCA_USB-HUB_RST#",
+				  "TCA_USB_HUB3_PWR_EN", "TCA_USB_HUB4_PWR_EN",
+				  "TCA_USB1_PWR_EN", "TCA_VIDEO_PWR_EN";
+
+		m2-b-reset-hog {
+			gpios = <8 GPIO_ACTIVE_LOW>;
+			gpio-hog;
+			line-name = "m2-b-reset";
+			output-low;
+		};
+
+		m2-m-reset-hog {
+			gpios = <7 GPIO_ACTIVE_LOW>;
+			gpio-hog;
+			line-name = "m2-m-reset";
+			/*
+			 * M.2 Key-M connector only supports PCI,
+			 * but RZ/G2L(C) has no pci controller.
+			 * Keep any card in reset.
+			 */
+			output-high;
+		};
+	};
+
+	tca6416_u21: gpio@21 {
+		compatible = "ti,tcal6416";
+		reg = <0x21>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "TCA_SPI_TPM/EXT", "TCA_TPM_RST#",
+				  "TCA_I2C_RST", "TCA_RS232_SHTD#",
+				  "TCA_LCD_I2C_RST", "TCA_DIG_OUT1",
+				  "TCA_bDIG_IN1", "TCA_SENS_INT",
+				  "TCA_ALERT#", "TCA_TPM_PIRQ#",
+				  "TCA_RTC_INT", "TCA_M.2M_WAKW_ON_LAN",
+				  "TCA_M.2M_CLKREQ#", "TCA_LVDS_INT#",
+				  "", "TCA_POE_AT";
+		/* Level triggered irq does not currently work well on RZ/G2L, fall-back to edge */
+		interrupts-extended = <&pinctrl RZG2L_GPIO(4, 0) IRQ_TYPE_EDGE_FALLING>;
+
+		lcd-i2c-reset-hog {
+			gpios = <4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+			line-name = "lcd-i2c-reset";
+			output-low;
+			/*
+			 * reset shared between U37 and U48, to be
+			 * supported once gpio-pca953x switches to
+			 * reset framework.
+			 */
+			gpio-hog;
+		};
+
+		lvds-irq-hog {
+			gpios = <13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP | GPIO_OPEN_DRAIN)>;
+			gpio-hog;
+			input;
+			line-name = "lvds-irq";
+		};
+
+		m2-m-clkreq-hog {
+			gpios = <12 GPIO_ACTIVE_LOW>;
+			gpio-hog;
+			input;
+			line-name = "m2-m-clkreq";
+		};
+
+		rs232_shutdown: rs232-shutdown-hog {
+			gpios = <3 GPIO_ACTIVE_LOW>;
+			gpio-hog;
+			line-name = "rs232-shutdown";
+			output-low;
+		};
+
+		sensor-irq-hog {
+			gpios = <7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP | GPIO_OPEN_DRAIN)>;
+			gpio-hog;
+			input;
+			line-name = "sensor-irq";
+		};
+
+		tpm-irq-hog {
+			gpios = <9 (GPIO_ACTIVE_LOW | GPIO_PULL_UP | GPIO_OPEN_DRAIN)>;
+			gpio-hog;
+			input;
+			line-name = "tpm-irq";
+		};
+	};
+
+	led-controller@30 {
+		compatible = "ti,lp5562";
+		reg = <0x30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* use internal clock, could use external generated by rtc */
+		clock-mode = /bits/ 8 <1>;
+
+		multi-led@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			color = <LED_COLOR_ID_RGB>;
+			label = "D7";
+
+			led@0 {
+				reg = <0x0>;
+				color = <LED_COLOR_ID_RED>;
+				led-cur = /bits/ 8 <0x32>;
+				max-cur = /bits/ 8 <0x64>;
+			};
+
+			led@1 {
+				reg = <0x1>;
+				color = <LED_COLOR_ID_GREEN>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+
+			led@2 {
+				reg = <0x2>;
+				color = <LED_COLOR_ID_BLUE>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+		};
+
+		led@3 {
+			reg = <0x3>;
+			chan-name = "D8";
+			color = <LED_COLOR_ID_GREEN>;
+			label = "D8";
+			led-cur = /bits/ 8 <0x19>;
+			max-cur = /bits/ 8 <0x64>;
+		};
+	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29023";
+		reg = <0x44>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupt-names = "INT1";
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <8>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		/*
+		 * AM1805 RTC used on this board has only nTIRQ pins wired,
+		 * which is for countdown timer irqs only.
+		 * Driver does not support this, disable for now.
+		 *
+		 * interrupts-extended = <&tca6416_u21 10 IRQ_TYPE_EDGE_FALLING>;
+		 */
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+};
+
+&i2c1 {
+	/* highest i2c clock supported by all peripherals is 400kHz */
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/*
+		 * This reset is open drain with HW 10k pull-up resistor,
+		 * but reset core does not support GPIO_OPEN_DRAIN flag.
+		 * The pull-up and GPIO voltages match, push-pull is safe.
+		 */
+		reset-gpios = <&tca6416_u21 2 GPIO_ACTIVE_LOW>;
+
+		/* channel 0 routed to expansion connector (J22) */
+		i2c_exp: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 1 routed to mipi-csi connector (J23) */
+		i2c_csi: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 2 routed to mipi-dsi connector (J25) */
+		i2c_dsi: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u48: gpio@21 {
+				compatible = "ti,tca6408";
+				reg = <0x21>;
+				#gpio-cells = <2>;
+				gpio-line-names = "CAM_RST#", "DSI_RESET",
+						  "DSI_STBYB", "DSI_PWM_BL",
+						  "DSI_L/R", "DSI_U/D",
+						  "DSI_CTP_/RST", "CAM_TRIG";
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4
+				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+			};
+		};
+
+		/* channel 2 routed to lvds connector (J24) */
+		i2c_lvds: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u37: gpio@20 {
+				compatible = "ti,tca6408";
+				reg = <0x20>;
+				#gpio-cells = <2>;
+				gpio-line-names = "SELB", "LVDS_RESET",
+						  "LVDS_STBYB", "LVDS_PWM_BL",
+						  "LVDS_L/R", "LVDS_U/D",
+						  "LVDS_CTP_/RST", "";
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4
+				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+			};
+		};
+	};
+};
+
+&phy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "keep";
+			function = LED_FUNCTION_LAN;
+		};
+	};
+};
+
+&pinctrl {
+	/* UARTA */
+	scif1_pins: scif1 {
+		pinmux = <RZG2L_PORT_PINMUX(40, 1, 1)>, /* SCIF1_RXD */
+			 <RZG2L_PORT_PINMUX(40, 0, 1)>; /* SCIF1_TXD */
+	};
+
+	/* UARTB */
+	scif3_pins: scif3 {
+		pinmux = <RZG2L_PORT_PINMUX(0, 1, 5)>, /* SCIF3_RXD */
+			 <RZG2L_PORT_PINMUX(0, 0, 5)>; /* SCIF3_TXD */
+	};
+};
+
+&scif1 {
+	pinctrl-0 = <&scif1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif3 {
+	pinctrl-0 = <&scif3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&spi1 {
+	/* native cs does not support cs persistence required for tpm */
+	cs-gpios = <&pinctrl RZG2L_GPIO(44, 3) GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	spi1_muxed: spi@0 {
+		compatible = "spi-mux";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		mux-controls = <&spi_mux>;
+		/* mux bandwidth is 2GHz, soc max. spi clock is P0/2 = 50MHz */
+		spi-max-frequency = <50000000>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			reg = <0>;
+			interrupts-extended = <&tca6416_u21 9 IRQ_TYPE_LEVEL_LOW>;
+			reset-gpios = <&tca6416_u21 1 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+			spi-max-frequency = <43000000>;
+		};
+	};
+};
+
+&usb2_phy0 {
+	dr_mode = "host";
+	vbus-supply = <&vbus1>;
+};
+
+&usb2_phy1 {
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-microsd.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-microsd.dtso
new file mode 100644
index 0000000000000..aa85054efa0c4
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-microsd.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+* Device Tree Overlay for the RZ/G2L(C) Solidrun SOM SD
+*
+* Copyright (C) 2024 SolidRun Ltd.
+*/
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&sdhi0 {
+	bus-width = <4>;
+	full-pwr-cycle;
+	mux-states = <&sdhi0_mux 1>;
+	pinctrl-0 = <&sdhi0_pins>, <&sdhi0_cd_pins>;
+	pinctrl-1 = <&sdhi0_uhs_pins>, <&sdhi0_cd_pins>;
+	pinctrl-names = "default", "state_uhs";
+	sd-uhs-sdr104;
+	sd-uhs-sdr50;
+	vmmc-supply = <&vmmc>;
+	vqmmc-supply = <&reg_pmic_ldo1>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-a.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-a.dtso
new file mode 100644
index 0000000000000..4bcb22d518f05
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-a.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port A on connector J5004.
+ *
+ * Because Renesas uart driver does not support rs485,
+ * users must manually toggle P41_1 between RX & TX.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&scif1_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-b.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-b.dtso
new file mode 100644
index 0000000000000..6f460b3e0b256
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-b.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port B on connector J5004.
+ *
+ * Because Renesas uart driver does not support rs485,
+ * users must manually toggle P41_0 between RX & TX.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&scif3_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi
new file mode 100644
index 0000000000000..22f066079e69a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include "rzg2l-hummingboard-iiot-common.dtsi"
+
+&canfd {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can0_pins>, <&can1_pins>;
+	status = "okay";
+
+	channel0 {
+		status = "okay";
+	};
+
+	channel1 {
+		status = "okay";
+	};
+};
+
+&phy1 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&pinctrl {
+	/* CANA */
+	can0_pins: can0 {
+		pinmux = <RZG2L_PORT_PINMUX(10, 1, 2)>, /* CAN0_TX */
+			 <RZG2L_PORT_PINMUX(11, 0, 2)>; /* CAN0_RX */
+	};
+
+	/* CANB */
+	can1_pins: can1 {
+		pinmux = <RZG2L_PORT_PINMUX(12, 1, 2)>, /* CAN1_TX */
+			 <RZG2L_PORT_PINMUX(13, 0, 2)>; /* CAN1_RX */
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso b/arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso
new file mode 100644
index 0000000000000..c59c7e7e70bfa
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+* Device Tree Overlay for the RZ/G2L(C) Solidrun SOM eMMC
+*
+* Copyright (C) 2024 SolidRun Ltd.
+*/
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&reg_pmic_ldo1 {
+	/*
+	 * This ldo can switch mmc host controller io voltage between
+	 * 1.8V and 3.3V. The eMMC IO voltage however is supplied from
+	 * reg_pmic_buck3 which is fixed at 1.8V.
+	 * Lower this ldo maximum voltage to 1.8V to prevent setting 3.3V.
+	 */
+	regulator-max-microvolt = <1800000>;
+};
+
+&sdhi0 {
+	/*
+	 * Host controller and eMMC have separate io voltage regulators:
+	 * reg_pmic_ldo1 (1.8V/3.3V); reg_pmic_buck3 (1.8V only).
+	 * Link to the switchable regulator ensuring that it gets configured.
+	 */
+	vqmmc-supply = <&reg_pmic_ldo1>;
+	bus-width = <8>;
+	cap-mmc-hw-reset;
+	mmc-hs200-1_8v;
+	mux-states = <&sdhi0_mux 0>;
+	non-removable;
+	no-sdio;
+	pinctrl-0 = <&sdhi0_uhs_pins>, <&sdhi0_rst_pins>;
+	pinctrl-1 = <&sdhi0_uhs_pins>, <&sdhi0_rst_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_pmic_buck4>;
+	/* emmc io voltage is hard-wired for 1.8V, disable sd modes */
+	no-sd;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi
new file mode 100644
index 0000000000000..297256299e7a8
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2L Solidrun SoM
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
+		ethernet1 = &eth1;
+		gpio0 = &pinctrl;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c3;
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
+		 * 1 = connector, 0 = eMMC.
+		 */
+		mux-gpios = <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_LOW>;
+	};
+
+	clk_pmic_32k: pmic-32k-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
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
+		mmp_reserved: linux,multimedia@68000000 {
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
+		reset-gpios = <&pinctrl RZG2L_GPIO(23, 1) GPIO_ACTIVE_LOW>;
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
+	 * instead delays are added by the MxL86110 phy driver.
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
+&eth1 {
+	phy-handle = <&phy1>;
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	/*
+	 * ravb driver does not configure mac internal delays for RZ/G2L(C),
+	 * instead delays are added by the MxL86110 phy driver.
+	 */
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy1: ethernet-phy@4 {
+		reg = <4>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(42, 4) IRQ_TYPE_LEVEL_LOW>;
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
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
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
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c3_pins>;
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
+	eth1_pins: eth1 {
+		pinmux = <RZG2L_PORT_PINMUX(37, 2, 1)>, /* ET1_LINKSTA */
+			 <RZG2L_PORT_PINMUX(37, 0, 1)>, /* ET1_MDC */
+			 <RZG2L_PORT_PINMUX(37, 1, 1)>, /* ET1_MDIO */
+			 <RZG2L_PORT_PINMUX(29, 0, 1)>, /* ET1_TXC */
+			 <RZG2L_PORT_PINMUX(29, 1, 1)>, /* ET1_TX_CTL */
+			 <RZG2L_PORT_PINMUX(30, 0, 1)>, /* ET1_TXD0 */
+			 <RZG2L_PORT_PINMUX(30, 1, 1)>, /* ET1_TXD1 */
+			 <RZG2L_PORT_PINMUX(31, 0, 1)>, /* ET1_TXD2 */
+			 <RZG2L_PORT_PINMUX(31, 1, 1)>, /* ET1_TXD3 */
+			 <RZG2L_PORT_PINMUX(33, 1, 1)>, /* ET1_RXC */
+			 <RZG2L_PORT_PINMUX(34, 0, 1)>, /* ET1_RX_CTL */
+			 <RZG2L_PORT_PINMUX(34, 1, 1)>, /* ET1_RXD0 */
+			 <RZG2L_PORT_PINMUX(35, 0, 1)>, /* ET1_RXD1 */
+			 <RZG2L_PORT_PINMUX(35, 1, 1)>, /* ET1_RXD2 */
+			 <RZG2L_PORT_PINMUX(36, 0, 1)>; /* ET1_RXD3 */
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
+	i2c3_pins: i2c3 {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 3)>, /* RIIC3_SDA */
+			 <RZG2L_PORT_PINMUX(18, 1, 3)>; /* RIIC3_SCL */
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
+		pinmux = <RZG2L_PORT_PINMUX(48, 0, 1)>, /* SCIF2_TXD */
+			 <RZG2L_PORT_PINMUX(48, 1, 1)>, /* SCIF2_RXD */
+			 <RZG2L_PORT_PINMUX(48, 3, 1)>, /* SCIF2_CTS# */
+			 <RZG2L_PORT_PINMUX(48, 4, 1)>; /* SCIF2_RTS# */
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
+		pinmux = <RZG2L_PORT_PINMUX(47, 0, 2)>; /* SD0_CD */
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
+			 <RZG2L_PORT_PINMUX(44, 0, 1)>;
+	};
+
+	spi1_cs_pins: spi1-cs {
+		pinmux = <RZG2L_PORT_PINMUX(44, 3, 1)>; /* RSPI1_SSL */
+	};
+
+	usb0_vbus_pins: usb0-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>; /* USB0_VBUSEN */
+	};
+
+	usb1_vbus_pins: usb1-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 1)>; /* USB1_VBUSEN */
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
+	/* Murata 1MW max rate is 50MHz */
+	max-frequency = <50000000>;
+	bus-width = <4>;
+	cap-sdio-irq;
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


