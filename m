Return-Path: <linux-renesas-soc+bounces-21013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0DB39D2B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 14:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1212316399D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 12:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9332430DD3B;
	Thu, 28 Aug 2025 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="qUn7HntB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013058.outbound.protection.outlook.com [40.107.44.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE08C26A0B1;
	Thu, 28 Aug 2025 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756383858; cv=fail; b=UJSpVx+klZlh6n/YrJeutd0Uv26Jacv/f5btw7oYwKb9BGsphZ2c8nlSyqH4hqhUt9GWtFWbuUN6Z2TXYS2VM4WBviv+7dBdYfsQs+rrhvq+/TPoeWV/oZWt68/GxbC6plf6ual3RB92brhjoCc3Q1vtHSqTubSx+pfqfv1SIRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756383858; c=relaxed/simple;
	bh=YEuviFE5sZT8Y8PeolH1Nt00lVRMJjaMcOtPzqfOlJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=F1yyUTsu07i+3VDNfJUvpgTJjNl4jOYB6GsdNIQY/vlUWWzLgw3e+gOFbpqiPY/NDiHwPLFMai+LFGEx8fkewpfKInJwQmK6OWvKYRwiH2APiZvMYSFSBOhzSuMCw+KECtOFiM77GIEQY1SrKti7M6hSOkvobalXyXaPFfXTr4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=qUn7HntB; arc=fail smtp.client-ip=40.107.44.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTwpenFMC3ZMIq3pHkgQH5uwWjt76Y/2o6Ju6vM5KLiMsAG3Eq7AW3Dm5oZdAuw7cjgNv7QXHkn/UnflM+B0NbwaVgJro/PPeW4W0wJq9k+b3mhO9GQOirCDFhFRLkeaNiC6T+h3M6gtfNIqYDNkjyCSvIXjf/4J0Bll2ycUaQo98mCGTAlTAObIzVReKTURMSdQnbA7+eRYCjXbDXAOQKM2cZpv8iSCYQ9Gkk9rPPmS1+MKSksM3YaYrZJfiuZBaHm0bTSzvgiUU9sq9wa9gWlA3Eu1mx3C3D7KU6MT+/1o2aQ/lUG7cJMnM41aVzvfX0tQAY1oibTM/1lW8KJcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNtZ6c31DUcOfn9JD5h6E7WBXWyysh8s3HJ5/E+Vnn0=;
 b=utsvdFtUHkZ8BMwpZRSinPYI0V71eCXqbtx1+7Sm2kAdf60UR+2+jPv9KlJQzGp6Rt8N+XisJd+Nq77TI3KX1awCx6YmrBJrmrwax/B2r0E1X3PO5H/RnplePrx0XWR+U7b9BAHZOMgw3Tpf9y4XLFEC5ccn/mRj20BAyovgE+Dn4sDIC/MF4IXMfod/bDswcdBv/S+6I6zF7B5q5cJ7t9BvOBpx5Q8Ee+WDkz+/kL5xjUw2oOhOlSEOuxRybMaP+ZE6OtI41jl/V4ZY077SXxRykeo/uaV6PVEgrDl9Y8D4Se5Nd7U7cSOPegAVhKmOPSgrx4CN9IE8sD5CQpQ38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNtZ6c31DUcOfn9JD5h6E7WBXWyysh8s3HJ5/E+Vnn0=;
 b=qUn7HntBkvhLydfLCp5CN12DSfOaV1mxLfDSZbDjBB/ZYS/f0pFszz1zhFtVcPdJDuSs1hd69Z148wY8q7oGEoJuYCe0qztwxngPyr9iPXAyZMcwSuB+3swQvdutNCh5chmL99gkPkzWH3Tu5vWuutOhaBLaXmDBxqxmrkPxL0KPtZbm1Xef25gFpZjKrWRY3oKgqupY2TwFojt2nr+mtAPl8vRph5JBhd4NZEWJJCTT+G8RJ31zPkUsdsrh91ND9MQTTiQegVQ4rQF97m6M1JTETioSTdf6m3Hxkvi4mn047tuAYPVL2SrIm2q0f5jJiCq9OTQkQ7s1uKvix8SWPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB7287.apcprd06.prod.outlook.com (2603:1096:820:143::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 12:24:12 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 12:24:12 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS USB PHY DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 0/3] phy: Remove redundant ternary operators
Date: Thu, 28 Aug 2025 20:23:54 +0800
Message-Id: <20250828122401.17441-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::9) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e55e2db-9d51-4d02-e93a-08dde62dcb7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aUFccPU8Un3qbj2uNJx9BE0A6/jeopVGNWpBMSxQiSnXIMmiFzeso7tiFQVO?=
 =?us-ascii?Q?5YYE+JhslRbzR8tka1y7vQ2ZzMeh8L1K38ISxe6KX4xFmkVRp0R4QidIZuA0?=
 =?us-ascii?Q?zTwAh0g0RgpunWiQwnKo6RJhgrFDWnSBHJ/khnspUdnaEaIE7RMsLIEV7p6K?=
 =?us-ascii?Q?bzVdyd3n+6p2D3Liz7u3QwTP9Ql6+eifkCWTe0IxhHausAt1/S/4rvZTMjSA?=
 =?us-ascii?Q?d98qWyxokladfGoidEWupXEA92BxibEm1KnJGzXhvn6/jzt8li10XuAONaTD?=
 =?us-ascii?Q?iGcsH5wggYTztAjODNDbauKfJtDucADzCN3RDb2JDNQv2JV83DF8vxK3DCaP?=
 =?us-ascii?Q?RZHLCjwhxdAFzNFCa720DWNEOsb8ckonxw8k9pjlaGDCgDtTukBeqLE6u+6T?=
 =?us-ascii?Q?UHlbiIetYVANHTngrqETf9cjd7jKjbBfoFuFkUc1e1QFnmwYRtYiBw+o8+rE?=
 =?us-ascii?Q?tcle6gcVoCstIt/7aowieIgbbNyUMf5/N4n6fUHdegeblA0pdu2xk5IuqdQM?=
 =?us-ascii?Q?QXJ9C0mW1IsU1iFKdU3oIeDDM6D6wmTioA+l6o9j3yzDfeSfsVoW/Sfh2PMc?=
 =?us-ascii?Q?dKFYaAauzbhNbVEHhbmNvfbq4ptybingaXEsABczt5wGgOcC5XKwdxM3d43E?=
 =?us-ascii?Q?LjD2n4ohLgmqi9lSYtyTMm686ozuzCQgD9pHstHFBLsWWLjJ6z354WEwdwJQ?=
 =?us-ascii?Q?A3jx/wtP5XxdKs5RxAhlabJ6AXnOrXtCZv2HZTab/llfTXm13ScKRXJGaxLt?=
 =?us-ascii?Q?/89saa/R36+cZ/byB1XHbClzIr/7355WwX+cm6kaZ+CCkiz3qJUPD1W40e4f?=
 =?us-ascii?Q?1g7fEJVswGphewfPR4Yq1qPMuZ0AtUtbZzs2xEynwAjY+tS1q2JG4KW8Z6Nf?=
 =?us-ascii?Q?D5QA3BdO7CZVj00dypWmP2l79wqytMGWEhs+wea4TkJFoKHQviMfb8OhfrxA?=
 =?us-ascii?Q?Kao1NI3c0BDvuGKvjYifGTXIZbEETpda6//p8cIR0pc76MU5qwNolLYIV1GU?=
 =?us-ascii?Q?m1noFe6wS/WjpkWuEFiECjdycI9bJoNOTcTXZKuq0zfjrNubBh38K3mpoqQq?=
 =?us-ascii?Q?IXVhFHtW0ajDBlX4WlIIT9J2gGxVqj6tO3UwLS6yshohJs8akBRqf8S4rYdY?=
 =?us-ascii?Q?eeMpJk977pj7qOWapzg6t/JnZZfOyWt+Bg/yi6DKw0JctMIH6YV2r+XhPaug?=
 =?us-ascii?Q?pI5ZfCKipJV4LXfZKO4rxtUxFkj6Jkx4lv/bH+diksiGxl6GzK/FIZl+F6x4?=
 =?us-ascii?Q?2TJuXofqGSz9dKKDSf3Y5Ni4l4k0RFpLmznT23VT8I7w0JbBI980INNG6Gz+?=
 =?us-ascii?Q?uCBqAN/v+M7vmf6gRcxi530+wd+LSa9tJQ7ymsK5J6n94l3zm7UubbFETcyL?=
 =?us-ascii?Q?p92XjJ/fghbQtwZZUTERY+4hIVuFZzQE9NycAo+mzptKqbDhb72EkhRXL03t?=
 =?us-ascii?Q?MuuQBeNCVI9Jrm5qHCKVEvi4ASJ+q3nIpPsIDsL1XWiIFwlpQsbT1wyUj4fD?=
 =?us-ascii?Q?uw8Gnsmr06VIhE0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R27eOa2788MxROHQrQmdusSpveXMd+V0cCfSEi4LyjRQ8Mw65otEsg3aoZD+?=
 =?us-ascii?Q?E5yiqNLQ/tUsDuKAHE7hWC0z62hHCij9p91PvISJV3qFrAEw9vABJr5nEF27?=
 =?us-ascii?Q?jI6f1WbQ0HxwikY9UQq7cNIAB1rXAx5W1zOT8A6Zfd/JFyko1VlTLtn9SjFJ?=
 =?us-ascii?Q?QKitdsQy9DEI1p34CwIgCp3B2X8oe4Jl7h9ovPrCKBGZey2RYf2MpOnzLO4q?=
 =?us-ascii?Q?ecTy6Q/z25SQEWZxe2lrmSkxTavRAOVJbzF1HAoU3N/3BM+PSreDcgmnkRsb?=
 =?us-ascii?Q?UzzK9mRT/YHtUuDFkVpOjhrAKLBe5/CrHblVrIBoKe6g4Kp/py+QydfzE5KR?=
 =?us-ascii?Q?YKelz0nSSjErwJD70ZZxs2HGNDXF4jJ8/r/2qiPrPzie9WjgtKhGKNdFX94S?=
 =?us-ascii?Q?pB6bN+CjFWtWX4kZPQCRhkdD5xaBmKG4ai0FGqRbtgEFMqfsBWxxiqJUaRlb?=
 =?us-ascii?Q?vnUrIOcpkcvNU0Qx+c0J2cATU4A/GtpvK9esz25K53sIiG4Oy6hCFZnE61Ji?=
 =?us-ascii?Q?w8QPwve8g1NenW+Q7e3d91PpxmCo8rJE6ZY1LV1E6AywvXFDB/Uw2FpPkR8b?=
 =?us-ascii?Q?aZ3fXjxj/0AaZH363pUZYbA4COLyaJOs138xeK71o6CkKTutSJcP5qWj99yK?=
 =?us-ascii?Q?FGwKxYzSgIGj3/hW/gLL/UWR5JWA7+i51BPopNOCoebsK2BGlvEhbykMLbMl?=
 =?us-ascii?Q?J2BHT2OMTRKjCritPZU/Y07uryo75Y4actd4RSvpO2UzHwA/QPub2BPhmaUb?=
 =?us-ascii?Q?HS0+1/FDqLhnRMoK9LYzi0DxwuAlr/yb7VNZ7dEqpzVwpxkMcD9oZeEOZt8N?=
 =?us-ascii?Q?V+eseL7kFPeJEM3H+DeNxUz5Sj1/Fa4MCK9ltEOgDbgsQrSu2JyzsLr0C7Oo?=
 =?us-ascii?Q?cXF2k1EYyijd+TOM8K5Ja3qTrHbF37HrBLD3j71j0NHv7u4nu5b0tPxSy9mX?=
 =?us-ascii?Q?ui3XfJQBIleZwFr3G8Baf3s7VArtdmECFI7w+HCh2xTsCdsN6f4+VRoicXso?=
 =?us-ascii?Q?U4oze2E4uCHouEt1mGyXicrIw3yACqkd5aNL3VlGbhqgm8+byZJLY4YQvLeX?=
 =?us-ascii?Q?L1T24cdSofbu8+sF8pzxs+U1IMol2qFf/GW8kL2Cjpp1ECuK7sV73aymq2+s?=
 =?us-ascii?Q?a9m9vgVBQGRO8q97mBryv+IX1YPBt6B3DbIumbW6sZSUEz9lGzNbAps7TZkD?=
 =?us-ascii?Q?wJSPQAvjwRnr0q0Xd0DUB3QklCMQHsoHpft9Qa5S8sAtLiykSYcwSiqis85Z?=
 =?us-ascii?Q?08PxsNv+GJLOEIdbNOZ3kEp8LfOVAMewlNuToUwdkK1h2l+0RDogS9J5Y+Ci?=
 =?us-ascii?Q?vYrvgGxBWe/xZk3RSJJbD8P2rkg4iit/OkC3HdaHw4EfoKYeKIBNf4+C0bEn?=
 =?us-ascii?Q?enHukBmOh13yGqeVn3PAnlJD2gTLkuY5L6UGuFZvw9Ro7QFu29GNCPUUmcgk?=
 =?us-ascii?Q?dDxpXWoUMMNw5fefpJLZtyvEV67kH/svoAdWwwLDxCxlboaBHQ2jKbxtu5oD?=
 =?us-ascii?Q?1bkOZZEhQHdJvGWTsoqpt4ylszNM0Q3dDrH1YOsKYFh/vT4/GmQye8RYfW5B?=
 =?us-ascii?Q?jVagEa+JeYpjtVj5M67Y7e2P75ZksA5F/tU2hC5p?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e55e2db-9d51-4d02-e93a-08dde62dcb7b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 12:24:12.0542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCh54dr6v8Pr3hUlten7SZdr9UysTj+fjgNaVrSOX9Pz+XpJ389QvVgoxlphtBi9ghF0bpfperRYL6MIHEA4KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7287

For ternary operators in the form of "a ? true : false", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Liao Yuanhong (3):
  phy: hisilicon: Remove redundant ternary operators
  phy: renesas: rcar-gen3-usb2: Remove redundant ternary operators
  phy: rockchip: usbdp: Remove redundant ternary operators

 drivers/phy/hisilicon/phy-histb-combphy.c | 2 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c  | 2 +-
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1


