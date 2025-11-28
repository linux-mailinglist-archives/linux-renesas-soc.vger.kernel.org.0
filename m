Return-Path: <linux-renesas-soc+bounces-25332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF80C928CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 17:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 83F2A34207B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0201728468B;
	Fri, 28 Nov 2025 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="EB/sJl01";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="EB/sJl01"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020141.outbound.protection.outlook.com [52.101.84.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BB6285C84;
	Fri, 28 Nov 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.141
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764346576; cv=fail; b=l+FlOVWVXJ5gnpmF0a85pnZ9eLDnfsRAJFi135+zV5uOATypOiAjkzA6zTCB8fKWQAmwRQVzxU33IY8oe00OyA67gAsgT0h4uI3jMckcB3zRHHynamVJ8/rGGFE35FNv4YSdBUBboWKclfRlRs+s7nVDmux+JzlHrLMIIWDZAg0=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764346576; c=relaxed/simple;
	bh=djgPNK0BHt8kGndYs+CbLehJyrG6LcwaMTkzUGuKv2M=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Xoni6iYmjLFr/z1TGwcM35mpz3NBDszZYBWSJfQGheAvnxNyD0IPaPxGv1a497+ABaBGPRVIuv0ZGyLpCYii/QHGbmbXJKLN4G5cqCxPWYvV38VCIWH3azopJhmKYSi/Vi1cIVhDyJsrpfmEW7uzcX8G01+BePuFa7UU3O8LFJw=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=EB/sJl01; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=EB/sJl01; arc=fail smtp.client-ip=52.101.84.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OEvFrXCNq4Rg089B3b6iFuO3FONBMuua7rp5WuEhMyhoWUNpVgBo0FKBxqiGLCL7sqZs3xo5KHHYpZ/91XGJpyKj3KckeekeUUvQU//hW9EzIK8+EXHT1QC5AUXIyxiUrrrs3boHtyLepAjNt6U4Vx3Fc2gm87gkys30sA5PPIUDLHHKGaDCNMyrqC8z0tdjowlvVcDzqna17gadQuWhYBK6Y5+wruJFfOGA1PqAwi6wIsEeHwycnNZWZYVLK8Jtyxv6lXPkFG296NS8KVOjNgbdLNfdKmDfPiYDN6Yw0mEzuaoCZsePfQ9MRi4UckU7rnAyDLjUcUhAumsZZTchTQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5Q9ppEOgQ4Rmb35eoipzr35POiQdOmtviOq4Yku9uM=;
 b=hrMPQhhDbiZmI5bavYrNUKg7YORCKfO0w0N9zl0vLQCZVVXF/5Vr7B+tXZXi3TEz2+2AFmmiBQHX3CjhiUC10Pc3gjtESkd2EmaTaeEgvgjSwvHo6eHWDqYizO3Ehwo7p2+sPB8SRBgLlh4g3z4iOapFNc231ebWBCZXwIN09mXlSMsDxr1UoXV756GvKg1rJLoIkFMTJWagQuOq6kLjnlVExvUuL7TTDwfpSiwQpTOkhMSHfcInXTG3ExWp/eRJ/S/2om/ki0SakMPdXEvjSHfWlcMbsOmot3Mf0EMpdKfsURUK9SThREyq6qwY3wgRi1gPzay/05ZSwYNEbpjlHw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5Q9ppEOgQ4Rmb35eoipzr35POiQdOmtviOq4Yku9uM=;
 b=EB/sJl01WEckUBWARq9KVWmhslYdHo7RqRpwIQPvo2oVILmiMmyy1n54uYS/2A5p+ZImFsfJc8n0t3qBm3XzmdMdWaYIqnserZNfhYdGomdSyUCjrTb1l0KmcZ4IS8DOTpix60vNC3HQd1wlDuASsnWLJxudoNAT+Y3GE2ish5o=
Received: from AS4P189CA0068.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::23)
 by AS8PR04MB8072.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 16:16:09 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::39) by AS4P189CA0068.outlook.office365.com
 (2603:10a6:20b:659::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.16 via Frontend Transport; Fri,
 28 Nov 2025 16:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Fri, 28 Nov 2025 16:16:09 +0000
Received: from emails-9804211-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-66.eu-west-1.compute.internal [10.20.5.66])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BBE108072E;
	Fri, 28 Nov 2025 16:16:08 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764346568; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=q5Q9ppEOgQ4Rmb35eoipzr35POiQdOmtviOq4Yku9uM=;
 b=msioN0U9mEe4ZhsA/46LafU0/blnA4dG4l0oesgUN+FHfU/WdM+8hZnwrHcw9QjpHeND2
 MCdHbQyfeZtGxQ5zZ+Q9ct4IrUxwrru3yOJPkD9o7LhDUOL2aBUs+ALU+TuowppLCCHaLkI
 JGwR8sH5qkld0a0+1+wCIsjHBPCKHHI=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764346568;
 b=LEdLZx2hsaEsuwmjCynok/2n54a7J3tH62+xRJPWt2VctTSxdp+Ek4DfIZUccCF+4/4jU
 OdJ3f9rgU7c+BxMIEUkbOBns3PyZO4dJ4oB8J2lIfsjai4wwB87TWIdLc1BtcCjI0QIocbi
 2gNj4ERcnqEX2hNU2aO6VN6jCbBrQzw=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTCi0mDT/HjnDbODOhguM/BiCWJmrJcshInt6rF0RwpOCBXuV30KcUmJRG77WNGNVjAUeAo+e8807pSAqP5UPpUGkzFWXFNrc2ferungZQZwe1UTLbftqbyFmTLVecksUiuHBsieKQ0wpScm201F6oP68jU38Z6dn0nElgzoZ2ZpgYOEX7+9uykuPQjORyansuC0Q1j/h35hHkvpswN4+OZ4SKcBoQbmletSTJ1m9tEUmnz81Dv3a5xPJFW/wz8kcbo+ukoknKovpOHMkoayGBHIDAElxWY4m+kn/eIMHzi4drMgAv0AfXA9GRNqrVkxGvpH2MJ2AEFKculAcFS+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5Q9ppEOgQ4Rmb35eoipzr35POiQdOmtviOq4Yku9uM=;
 b=Y+J/9+2XkqvOgruhlllXjNwOgns8toWB3v7WNRcbaxW/P1NSvC8BbDcANvhswN+YEmN1sU5BE2O0ZEk4x3mN1wLD/N3moPpn35qSCzqer6Gvlfu0P4ieFuUi5cbwjMw2BffaKfr/KniwtLD2f2xjFUEidmdkJQhsVBo/tYrgUBhC39FMo58zUrboiYp919eUaBdqjRj45HQVySZidM+rUcQUaU8jSSEiDbctYBnoEQtrU5nh6QZAMj4oKG07myA4sb5wMB9hcrCg6F5JLX7T0HRbVCuRAbrhBP4pXrd4YwVCFm116Yx0XgDNJ5InVTz1CBuNZ7DncKWXzC3eNWBTAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5Q9ppEOgQ4Rmb35eoipzr35POiQdOmtviOq4Yku9uM=;
 b=EB/sJl01WEckUBWARq9KVWmhslYdHo7RqRpwIQPvo2oVILmiMmyy1n54uYS/2A5p+ZImFsfJc8n0t3qBm3XzmdMdWaYIqnserZNfhYdGomdSyUCjrTb1l0KmcZ4IS8DOTpix60vNC3HQd1wlDuASsnWLJxudoNAT+Y3GE2ish5o=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU7PR04MB11210.eurprd04.prod.outlook.com (2603:10a6:10:5b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 16:16:01 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 16:16:00 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH 0/2] mmc: host: renesas_sdhi_core: support configuring an
 optional sdio mux
Date: Fri, 28 Nov 2025 17:15:37 +0100
Message-Id: <20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKrKKWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyML3aIq3eKUzHzd3NIK3cTkZFNDY/M0QzNDCyWgjoKi1LTMCrBp0bG
 1tQACsDo/XQAAAA==
X-Change-ID: 20251128-rz-sdio-mux-acc5137f1618
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|DU7PR04MB11210:EE_|AM4PEPF00027A63:EE_|AS8PR04MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 28287d87-b14c-4199-d4e4-08de2e9970d6
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UGtiZ2tJdTJ2T0k1a25RYnVxYUpMTW1KWW44MUMycnZuV2JLL0dSQnlaMmgr?=
 =?utf-8?B?NHJhS1hSZ20vblNQOG5pYzBwVlM4SWdCMXJ6dmwvVDR2bXhqanNlU1lWQ2gy?=
 =?utf-8?B?N2hoUU03NkdHcDhZbkFhMytLVDgzeWQzY05kRW01R3M4T1BFMDY4OUFqWTg1?=
 =?utf-8?B?TWdBbG9qaWtvRC9ZR2tMYzNkODQ4b2NVT2NiaDZyZllOSnQzak1UYktaU3Js?=
 =?utf-8?B?aTZvdmF6ZjZTVS9yQzMrSjhTWnE5MXZacFk2R09pYlVoajlHWm8xUitOUnV1?=
 =?utf-8?B?eHJJVXhKZytqNzRCZGwrSTBnYk5jKzcxWXZlMjFUWnpBMS9wSE5mQ2tGbzNu?=
 =?utf-8?B?cHA5b1FEOE9Tajh4ejk0azAwVTJuQmpKKzE1WG1XQ1FwdlhHYmpsbnF0c1By?=
 =?utf-8?B?aHExSkRJOTRrL2VqSTh3N2JWaDI4b3hXWWN3QWRoOS9YUVc0aHFsODRUdWND?=
 =?utf-8?B?REFlTzFnc2JUMk91cWFmbTFlSkE3aHJhQTJuS05Vb01Pclo5MmpEYnJQc1cr?=
 =?utf-8?B?UmxoZGZFc015UUduRjZpWG1XZ2FCdnN1bEhGSGtrSHRCN3p4Zlc1aTNRMXE2?=
 =?utf-8?B?M0diSXBMTFFJRTJINStJZ3BZMjI0dzFqNmcxMUhoVjdRTFNLek04Uzc1T054?=
 =?utf-8?B?aHVNWkRSaU5mY1JlWlVoZEdLdWIwT2pSdTdQbGtsRjRnQ1dUK3Jvc0xTL2xS?=
 =?utf-8?B?VmppVVUxVzBDbE9xejNyUzdWMjEvYkdzY2hFNHI0QmlXNlMwUDFpMDNUb2Jx?=
 =?utf-8?B?UEo3bTV6VlRmeEFOOGtYNFJ6aGZZWVZNR1hMcmlOVHhZeTdCY2xxdnBiMCtX?=
 =?utf-8?B?dlBtZ3d2cytJT2tNVU8yU0YvaWtVNkhEMVU0SzBqWjJ3bmQxZHZRb01hUzlm?=
 =?utf-8?B?b0o4OW1kT0tvSjFVOUFUaUI2Umc3Nm50UUE4dlZvQy9RUFp1VXVaOEl4T09F?=
 =?utf-8?B?YlU3d3VZNlRQN3B4RDliRmU4cVVCeFJhN0dYU1VpQTdHcnBNV2lRQmdBYW9o?=
 =?utf-8?B?eFgvbjd0aHE4S01qd29BREd5Z044LytMTTJKaFhqSDhheWZqRG51YnE2RmJX?=
 =?utf-8?B?amdiRSsyejFFTWNHS0ZNTGU3UlBqL2prUWtJTjU1cFNuOHRwZVNEWFVaVjl1?=
 =?utf-8?B?U3AzbjAxSXg1aDR5di9RY01Uamxta1JwcGdKK2JWYjhpM0Y1YjhVdlZQdTB6?=
 =?utf-8?B?WHpPYXNkKzFieWdEa0JvZUV6SXBPYlJ1K1h4K2xJYU4wanIyZ21WK1ZjblpX?=
 =?utf-8?B?MGFiZ2o0WUM2VXh3a24yUGNhN3A3eE01QTlQYUNoajY0ZmJIT0ZlM3FMWGdm?=
 =?utf-8?B?VktCY1FFY0V6THZLNmNWSVZVTjRyRWdhVjhIUnZLcE1OdDVwaXJQbm4zZ2w4?=
 =?utf-8?B?RWtxN3BXL2hKMmRHcnlMZnFSeEh0MWd4dXpnK3pObEsrUno1dnNVMjFaeEJy?=
 =?utf-8?B?c05EOFpEUERHNGs1Y3FTajltQktTMEJ2SGVjV3JqVkRySUJKeE44SUhBRUhC?=
 =?utf-8?B?bnRhZTAvdFdUN1d1Vm9SWHlNcmJjSW41MUtjZnhhcTRuU05zSXNkZHE3MDF2?=
 =?utf-8?B?YmJhUGRMci9UemVaOEVHdzM4QUUwY0VrVFlLKzZzWDRkcmF1aDRhTlU2Tk5B?=
 =?utf-8?B?eml5TXB3MDQrRWdXa1BkTmFWSEcrdkZoZnpJd1FLU2FCZ1BvR3Ayd09Md0RV?=
 =?utf-8?B?R2hOaTVtblQrTmxSUmYzRUY1OGlMRHJBRDgxVUZYSWFwTW5Ed1VNQ2pIT1JJ?=
 =?utf-8?B?dFJMU1pSSW5GYkx5U1ROYWtmbU13cDU2NzZSU3NJb0s3eStvR0t6eVdQWThJ?=
 =?utf-8?B?VWZ5bUlRZ0g3YUpLOUZsRktGNTVTRzJ0Wnk0YlEwNTlSRGFlZEoyVnhPSGpF?=
 =?utf-8?B?U1I4YVNwZFVQLys4MGVSbGpYQVNpNG5rZkRabVpDZGNrZzRJVEQyTDZJeFlx?=
 =?utf-8?B?RjJYalRaK2l6Myt2V1BDam5zQUxUUUJXNnVwMmZJTnVnYThlc1JSM1Brb1Vn?=
 =?utf-8?B?ZFZ5cUE5aHhiaHZzWmRGeUdVVGhkcmpKZXBlQXEzOEdxV1I4ZVh2dXpScXRU?=
 =?utf-8?Q?ZrQ4oL?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11210
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 06bad7afe3f04df1abdc5ad8236994bb:solidrun,office365_emails,sent,inline:b648773eeb86d04166af9a7a9fd888ff
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec0e59b0-dbbb-42d2-71d5-08de2e996bb1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|35042699022|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3ZuK2MxalJ4dllPY2NZT1VZaXVueFNOSjJHeHJ5ZHZaWlJZbXQ3RkRJOUJK?=
 =?utf-8?B?anVJcjk2clpCNXFUaWhobHdKa3JFNHlnQTVUSkpZVGhwOE94aGxzZC9DZ1Rj?=
 =?utf-8?B?ZU81ZWRuTzRhckFBM3gzOUFPV0xuRmVYTmpRZ3VWZG0yNytLd1V2Q1JBVVRl?=
 =?utf-8?B?MlFJOVEwTHYxNUFCQ05DUUtockpETzVSYjV5c1hmREF5MlZzWFExcDBhQndy?=
 =?utf-8?B?UjY4TlAzeFo4M1BJbVR4ZGNwNC9VTzZnYW5tMGx2cDNJcFA2RVM1aHExSW0v?=
 =?utf-8?B?SnN3bjhhZzNUMzREUVVJK1lPSWlYWXZNZG1rK2NycTVtcmJGVlBzNDFlRnZt?=
 =?utf-8?B?b2ErR3VDY01WR2x4ODNPMEF4dW5CVGxTTHRqRDlpTkpHYndoTy9hRDloTWpj?=
 =?utf-8?B?Tjc2Unpldm5wQTJvZGtrSTZJSUxmajV4bFZIdmFZZWpCWXZpVzRtOWw4NllW?=
 =?utf-8?B?ZUl1czVJZHEyK3ZQem1GcnBGY1JsOVpFQzhOSHJRSXMvdTV6U1hiZEh4b1lQ?=
 =?utf-8?B?dGY2bDE3aFlXczAyWkdXVVlHMnIwVnhCRllwTjhVTUMzOTNTNHdITmtEd0hn?=
 =?utf-8?B?K1lSRFdlSU1zQ1YwR05YNmVPYUsvN2FXWGprQUxyK1lKc3dVMHZYc0xsa1NE?=
 =?utf-8?B?U3Q4L3A1S3ZXcnVMbWRUOC96eUhrUTNLY2VLaDVhOFJub3liR0ZzYnY2ZjFM?=
 =?utf-8?B?VlQyTkdVaXc5Nmtla0Npejh2eHNZUG5qR0NtWTdMZTFlYi9pSG1lRXFlK1NX?=
 =?utf-8?B?d2wxL3VHVjVKYWxieDJieTlYNE90Z2pSbGt0aVlGbEpSTkhVTnNxZVlTYlEz?=
 =?utf-8?B?SnFzRnZRQUpkTEdLNzNNK01EWFlJdFdxNXBET01YTnd4WU1QYm41V040bU9x?=
 =?utf-8?B?cHhzMHB5YmtWaWZLcnFwTVV1RjgvWnM2ZXhCN0hucEIwdFhjVmVBeDM2bjZM?=
 =?utf-8?B?MVFhQnozbTcxSGhtdEY3Q0RyNWlBL1UvRTFobWFnNUVENU0wNjdlZ0QrRDhC?=
 =?utf-8?B?Y2ZZTkxqMDcvbklOOG0wcU1pREZnak9iT095QThwTllNZWtmZ2FxSXdZelo1?=
 =?utf-8?B?UGNEQ3dQMGJPL1JOSUhKK2lvZWN2S2h5RS9BSVRuRVRES3dac1B5MlhXT3Zq?=
 =?utf-8?B?RlMyVVJYYWVEaGtNOW9IWU1vUUFFT21xdjVKYkR4NkE2S2tSVFdkRjVyQm5q?=
 =?utf-8?B?a05wVUhyckZJOVZoYVJOYzFHS2k3ckwyRm9vOUhlbXZZZ1V2YVoxTEpvSytZ?=
 =?utf-8?B?N295RFlMMzdiM2htS2owVjl2MlFVUDFDU1M4QmovVW9DaTlhemdXditnVFR2?=
 =?utf-8?B?eFdCSW1KdDBmR0ZaZFFYZ25NZnByT01WRzBzdXZ5UERPWGo5RGhXSmtWTktz?=
 =?utf-8?B?U1dIc0N3UTc4S1Q5enlQNzBkbVJLNWFIclZvejRhNUNxVVR5MktNSFcwdFZE?=
 =?utf-8?B?ZmM5WDBpZFpwa1lXQWxKS0oveUhGOWVxM2QwbWFzK3RkMGxIbGZlWmtjeXE0?=
 =?utf-8?B?ZXZPUXE4RDAzTlphNk15Y0M5TjREVGt1Wmc0azZIM0U3UHlucEdCVEhERHNG?=
 =?utf-8?B?Y2RidE1abWpsQnNjb0JTRFJBZTY0R0RMZGtXQ0hhdVBIQmJpSUY2dlplaEpE?=
 =?utf-8?B?bzVDaEtwOUVFSjJxVTUyWkZLVjVIdGp6V29CMGM1c3JwenN0aVNWOWorZWYz?=
 =?utf-8?B?ZmR2TUR6SnE1cm44Z1QwOFVwazI4OVp4MWdsSS8zSzJmaVlJQ0NFVncwaWVh?=
 =?utf-8?B?MUQrRE5LOTJYeUVmUXZNbld2SS80RTdQL1hJWU00ZktHTUtpVkJUdWpTY0ZW?=
 =?utf-8?B?a3l0YzVnMW9hOWZKN1pxS08zWFNwSGlCL1B4dTYxUkxCSFkySlBiVk1kWVFS?=
 =?utf-8?B?RFgydllSVVE5dWFKTW04WVVRcmU3OHhEU3c0T2JLUFdKaFNSZHdIeWJCb2hS?=
 =?utf-8?B?ZGdXNitZNFIrbzdvbnJCdXd2bGpERkpIQ0ZuZlk1bmxtaUhmZWZzMFlHU295?=
 =?utf-8?B?cWtwNnFZdmNWZUs4MENJYVI0MVVpWW1jUENWRll2cXlpNXdhVmJ5L1BTaXUr?=
 =?utf-8?B?SzNpWUJYVzZtbER4SlNGV2FVNVNGNDdGSjdXRkhHT2xTUElUWHcxd3RCTlVV?=
 =?utf-8?Q?uSEI=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(35042699022)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 16:16:09.0171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28287d87-b14c-4199-d4e4-08de2e9970d6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8072

Some Renesas SoC based boards mux SD and eMMC on a single sdio
controller, exposing user control by dip switch and software control by
gpio.

Purpose is to simplify development and provisioning by selecting boot
media at power-on, and again before starting linux.

Add binding and driver support for linking a (gpio) mux to renesas sdio
controller.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Josua Mayer (2):
      dt-bindings: mmc: renesas,sdhi: Add mux-states property
      mmc: host: renesas_sdhi_core: support configuring an optional sdio mux

 .../devicetree/bindings/mmc/renesas,sdhi.yaml      | 14 +++++++++++
 drivers/mmc/host/Kconfig                           |  1 +
 drivers/mmc/host/renesas_sdhi.h                    |  1 +
 drivers/mmc/host/renesas_sdhi_core.c               | 27 +++++++++++++++++++---
 4 files changed, 40 insertions(+), 3 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251128-rz-sdio-mux-acc5137f1618

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


