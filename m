Return-Path: <linux-renesas-soc+bounces-23617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CEDC0B8E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 01:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 225D43A605E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 00:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC192D2495;
	Mon, 27 Oct 2025 00:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="CfeVafro"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010023.outbound.protection.outlook.com [52.101.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4DD1A9FB8;
	Mon, 27 Oct 2025 00:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761526104; cv=fail; b=ge6nR4ftUaZ6FzCCQwsT4jdkQOJQiosOj7KOcsM+jRSa0watRiqDmWZnpmFgc3k/1Tz3dzqZXvmomH1VO67VfvKOThbXyXu4hHHoqVP/IJjQJUE+41RvjlWAjSdSZLyeQd9X3lcVBx+quFRotgU3kijT5yNXl9sBFgkqQLOfIvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761526104; c=relaxed/simple;
	bh=7JbwqClfpLxgOyVV3g8EzFIspk0VMK5gEA/LMiPJ/JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RlCYkbfq1PvWRaAThF7ttl+W2ogFQcqDlYS1mR0XpQb8ZdWhKUGXQrmH8hIYUs2bLik8VogjGbs5xNaJj6O+57eCKIJhGBYrnS9xgNeunICqrLM2SW+/TN7iujY7eiZn+QjrxkWatJ6SezBDW6dt0o1MKxDafCWZbdttCMdcqCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=CfeVafro; arc=fail smtp.client-ip=52.101.229.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjkWnRvg96SeHKtlvTKRR2BMwf419t6gMSp+NwiL7yWPIvmbXEnArMGk5SG9/8powDJ5fLHL8ebMGJGKr3Djf3s7NAGjQC6emQ8cV1elc8SYVBYhqnvsMuR0S3f4QPmzyBbh09ix0hgrCz9neejeUl9ycXZ7XS/NR5+mh0d8cN53kIFfrjQ8pODll1ozMu3HqsTCjotVllHybDCuaXlDNY+5krRR0Ybsh4c8sjc3XlhEFn/wSTn3M/QrGElc21HspaByuW1s+M4H8uFCY4arG+WuvRrKnLxKRILvRYgauAiMPv2WK1smnQ14y3Lh/gl3CcNz3Y60ucZSefn1O8Qe7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnwCXbiOK/UJTozYAynAgBMdF892kK1HtTzlBAJcX5Y=;
 b=oFzNEmuZCqK23k3ssh6Wtdsbb5Ee4XwQJRXT27JuRElfQhzttFD9Yd5kUbW0wPlhDX7i0wfL13NXrw1Qq4lJWh2Nes9aHuyG8be6ln4iobXAZWkyfZXHDp2JBGHA2nrlaOq3BOaxaAjLS9gxn88Dh4x2aMLnOCF4UXxBPHxlduNcqjQq2pN66JTjEETSVWWv3ASopRq9VuRTyllKv97uw+WmjDNMRrdssonc8l8ycWjg/U5FaNbj1d2ZfqcWPSGBmK5fFR6h/uAd6MqHVN5nRby0y+8oHcdT+lzBSmco1BRQAhv/ZHr0XMJd/bdyHADy4aXGCZ3GMovLX90po8hqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnwCXbiOK/UJTozYAynAgBMdF892kK1HtTzlBAJcX5Y=;
 b=CfeVafroOjfIIc74+73GTBX7XZWwnuaipnfSFITTC1y0Ttursw7f18W51HJBRi/RzF+2Vy/KVmxovhvwHnsLfyDy9ko7MMOtMqj14gQYSDPn/MNFOshiu4sCIelhN0F6zUWnkq2By60w0H3AiRSTyubowElqr7d/Av4Lg45ewLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYRP286MB5349.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:191::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 00:48:21 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 00:48:21 +0000
From: Koichiro Den <den@valinux.co.jp>
To: iommu@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com
Subject: [PATCH] iommu: ipmmu-vmsa: Add DMA controllers to devices_allowlist
Date: Mon, 27 Oct 2025 09:48:16 +0900
Message-ID: <20251027004816.562965-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0056.jpnprd01.prod.outlook.com
 (2603:1096:405:372::15) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYRP286MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: 243baf57-d268-4fe3-b422-08de14f286e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hVOflrfo8Se1zJNiEt2PgoTm84a3G4lWi2xwtwo1CuMeHviuCc+1oZ2s0QwX?=
 =?us-ascii?Q?sd+FyRkC33NL077yid9Jhz1Q6vIkyIC1KK58YYPnOFvWzy+Jp0/jGsDt1X5n?=
 =?us-ascii?Q?g/l9nSa/n05xDPKaZuMz0DNO8+6exwKrf3/Ci9JZVopv6BJZN2Xnz2angBqN?=
 =?us-ascii?Q?mzgPBG/JmBwi0IRyZC5dvVIiyN98JV9g1AVCOp7sdkJi0RBG6hUD81fKKvzZ?=
 =?us-ascii?Q?aW6mG6THwJ61l7vwNytm3fNBK8m7ZxeZhhhOG6gUU/c1qVCp4ZYrsMYCFXuN?=
 =?us-ascii?Q?1wOdsnjeweAFMwvej7EZczxmKYwlprVB5VQ0C4HmDNDzffVAltVF3FA5f5AX?=
 =?us-ascii?Q?Nb8sQfoaoIE0ielWMmUo3rJdvP9X+czUBSyEHqGJ0G4R23gtOyAHqxcEn5Wx?=
 =?us-ascii?Q?cWiUGZ40QSKXeyz36VmEk591hgPZ0NPhXPxp67D0bFLv7x1kwiS3hgGW2nsv?=
 =?us-ascii?Q?8PUohQpYo6eigbrZp8jRHRTFu1vM85f/tvt4X09QsVaUiVwHPTAED6ySJ59y?=
 =?us-ascii?Q?n9Ijyzptw1irAqsOYKIVe6Q7FlhsZcFxpV/7W6fNQbyHwvdI5FT8lxannwgV?=
 =?us-ascii?Q?B/W4w214xyqJq7N4fcrQo3Q0iKoqftf1KvB7Odev78b+g3akToXt9IuTjK30?=
 =?us-ascii?Q?yfhur4tkB+v+3M8SfJPFhwu7qfIblDekOcQoUz9DweGC4qHuylAE9ExAp9P5?=
 =?us-ascii?Q?FqQtSN3UsO6Q2Z3jDzxgmCcna2Laf9prh6bTJe4UCJoq5yE7+npdKr1PgqK2?=
 =?us-ascii?Q?rwamJZ0IhHCrxVpz+52k7qGct6C0UVNVTON9vvVzq0XcsAX/mWontp5yAOwf?=
 =?us-ascii?Q?JOSewAdku7D28MnnDRND0Eya/9kUED8m9x/2o9br9ERlUi4eJVt34z+yAd9Q?=
 =?us-ascii?Q?37QUjOKYtEdsglyhJox0wGoEKww4gJCjjCFluBizMN3+kcfITTiuM+Wb5BRP?=
 =?us-ascii?Q?waaMYWcM2hqHJ6AZ4hXs7QAzVIHCXQt9BqYWFTdkuhhnbxoyXqVly/5aUPbH?=
 =?us-ascii?Q?+JRAAm8dqzNgDECL90D+obxO7vTHmNt4G23ewk2RV8rtOSHJZMMKG2V7q6i7?=
 =?us-ascii?Q?Gl2WiiqngYhhDmpn1le7f3S8wN1tRkvUHs8C0hnany+67PLuHjzKaFbKesRO?=
 =?us-ascii?Q?siRq7iyZmfJRO2Qn2dHsmMLYKN4HWXNLMGXLapm4rGr2B9eyHFXddOklkPMV?=
 =?us-ascii?Q?yzvEtSXYK1S8QhnRhLpRBh/kc3Q5TfvtzRnjEz7QD7QHMeQQZeSsd70to6J4?=
 =?us-ascii?Q?FvNY98/PNpWhikQb/sAQF3DYZ940aGHvr03HQ5WxGM7m1FhDFVIvSgnPszVz?=
 =?us-ascii?Q?IT17TJ6GgJEJWez3F1mVGfwC+euxPXvJsWQMJjk+ZyS/KGr9KT/gRwo3oZUj?=
 =?us-ascii?Q?vXLq9eAPoqrZnk1AYs26PZ1EIYb6cxdt5haN0NBE4affQMJCkzqfvNn7/0JD?=
 =?us-ascii?Q?QPfXt/mc3+KdLy4Jiz/iUW6cmlpLsOY+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/EUypmG1qI9+zAOZzKmWMODeVop30gw4Yx50kPQdO5KVvd7EoGSOULc2wzlW?=
 =?us-ascii?Q?hB+DteiDobuNIfZ71lLvm1L6A78n77mSto3ZZktA82/Hb0oXEZDUdAdu8MGO?=
 =?us-ascii?Q?prPwxrYFqKbps4v3F7h3Vx013vaHDWb9lpSFbJ1FQJ3NNiK/uNnr0hoNrOS6?=
 =?us-ascii?Q?rRIXlRmjsccEb81spBq1xh71qmrC0hpPM7ICIMTp1GaapGzJ3KKcXc5pReSe?=
 =?us-ascii?Q?bp9LHKFH8zUb3p0ovYMR7vcDE9OuKuOTz4Lq/X0nl/c9dxSd4fz/nCHKjl5x?=
 =?us-ascii?Q?kVN8MCdSgVf3EKFVq3s26Nk/++wYP/3WixYTobnJLhZjnXJ2xW4kKNKRL3OI?=
 =?us-ascii?Q?faWlT0y8UQLzoUT1C+JaQNXrU60pGZ5JWwxTj7f42YTVs+L55IW/FH6VysLt?=
 =?us-ascii?Q?xQADizhOgBy9Q7HDegztbaF4XuG3cHT2vBUvUoIC7Fm2n+EsWzwyxoBvQ8Rw?=
 =?us-ascii?Q?ZO7GimgPT68c5+XZX0LvNrJsoYBUXmIrNP6mwsZUG/5ZpSg5gA6CqISqk811?=
 =?us-ascii?Q?/3vRFPKr9Fa3RP5edO2+XvVygYlldfgIQaGET3HUZBtlhbgzsWaaDK6dFaiW?=
 =?us-ascii?Q?t+wbTpvlBN5AngPkavdKQ6EtMtdTOeYEmafGl2q9Vdvk+cAI/oijbPkFpILO?=
 =?us-ascii?Q?NpodskN6zCRLgIJov6/mtNNt0ms8GyGL3wu8HxFAmbZqOs+QI3HQMW4kCO3y?=
 =?us-ascii?Q?dfOYArZ58XREq8iUynJ1RVcorduaqU8fDt+Vk62DLJ8C9ES5rH96XDDhFuqP?=
 =?us-ascii?Q?4B0vWUMHaJwBr8VH/fOzOeNaNa+o3WdloWCOet3+xP4jqkkQa2edExuLvKNA?=
 =?us-ascii?Q?96hGmqsqQEiqljPOzhfQgnoa/z/lTRzlLQuobrxC5kBq0wMtElBKdSpyELrk?=
 =?us-ascii?Q?aLQshXoTrhfdrMRX8cLIE8djwEx987XaABhBRC5SKyqvvQ/C6h/HBlHGMdsl?=
 =?us-ascii?Q?N9Bd82h7cCbdY+JZZxYDOjguAdMx8Tm7hI+kZD4wapSAGO+Og661T8PFsAWX?=
 =?us-ascii?Q?3KCZNQOXSxjKXndsMKV2crZQXShUnRpcl7ILdJBSnOGLyKviKXNHlnF2DF+E?=
 =?us-ascii?Q?OEY/aQ+lshZgy8KIsNFVRzlK9S5IMxiSmZUz6yTF2/OoDOgEwKrJ9f3GnNap?=
 =?us-ascii?Q?W3qb4YKGBMfP/7wjMpQ62aXolte+24gAPWsNol+w/USFV2pSY2jKBfunnU1+?=
 =?us-ascii?Q?Ml0BCcTokdA6s8TBPNEVMYyavVx/BajJYhW76KiThkQa6PtUMc6rTax0U1VQ?=
 =?us-ascii?Q?YK5yR80FJfUBGrfcbtWL3ygL1BJcqBI+64RYjG2piGMTt8oeH55CKI68zHVg?=
 =?us-ascii?Q?8yPL7fUrPTrmnCdlq7v02/P2jotGPj7eZ4m5LzHyuuw3b6p9b5GYDw0Cp4B9?=
 =?us-ascii?Q?bFRvO79PF2pgIzVrwWZlTz8CWmwNeqnQA4T5QNGPgwmUC2bINP/kMh7ii241?=
 =?us-ascii?Q?7gqqv006vSTGM1jjhDJw8xK5qenOx1xSzTLjMemkJF1b9ubLk1kF4D/n44L+?=
 =?us-ascii?Q?HV557cj7s51/WbTnH04Mqana4xSf3DMSm0A4x1V/lzbsQCNek7pYWq9eIR58?=
 =?us-ascii?Q?deLzBkvf0n70LL5ExoM94N8mmfL9sQE8paBf181UMamv5V6wn/0Y8rDOJHr3?=
 =?us-ascii?Q?Uey4fvhBuq1ZoKiXFzy6aIQ=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 243baf57-d268-4fe3-b422-08de14f286e1
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 00:48:21.1849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjhoESE0hOdGgxiApLn7Y015dZDqcI12xMXyvg5tvlLtwnZOrBIGwva5PX/hvXEg7lx2nMNCIAbOgG1ArzvKxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5349

Add Renesas DMA controller devices to the devices_allowlist to enable
their use with the IPMMU. This allows DMA channels to operate through
the IOMMU when enabled.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/iommu/ipmmu-vmsa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index ffa892f65714..88c4fb6424ed 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -741,7 +741,9 @@ static const char * const devices_allowlist[] = {
 	"ee100000.mmc",
 	"ee120000.mmc",
 	"ee140000.mmc",
-	"ee160000.mmc"
+	"ee160000.mmc",
+	"e7350000.dma-controller",
+	"e7351000.dma-controller"
 };
 
 static bool ipmmu_device_is_allowed(struct device *dev)
-- 
2.48.1


