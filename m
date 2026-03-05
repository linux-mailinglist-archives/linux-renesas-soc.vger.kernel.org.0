Return-Path: <linux-renesas-soc+bounces-28832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI/fBK7iqGnzyAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 02:55:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A120A0B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 02:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5824301D059
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 01:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A5B1DF254;
	Thu,  5 Mar 2026 01:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Ya/XP7ya"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020074.outbound.protection.outlook.com [52.101.229.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED5A33688A;
	Thu,  5 Mar 2026 01:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772675688; cv=fail; b=j2s4ll9jcmNdKCMQMZBwqn8ZeMofZcAjvUgam2MWUT7sFku+i54sp2l0E6gH+D67TghiJLQPCzNDwO2BAMbnvXQh2TZ7/BpLY3O5P3mSd+gs4+v9cpGY74TdoEkSytIzXbyoQH3uluNKKOcwE0RxbPp6OtDwNS42rZgJo7zeYe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772675688; c=relaxed/simple;
	bh=PiqyezoO7HBOXoVtCR6Cw3PGiVEJrr6BOOJJJIzt03w=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OnfiZt3aC8Nv4ZYtq6P5wO9twrwpD8fi7QCGupbfsI9k7k5wCfl5f6MoGJN9Yx+h12gGvGm/UpEeEsVlj8ky69j9pI1a3RZ+5jfRFzQVfuJtCRxeOSw7/eY6UoFiDsuMxXt0HuaWd8gU9FONfHA6ZdG4VUmitEKt/e+R4VddbMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Ya/XP7ya; arc=fail smtp.client-ip=52.101.229.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJa0CQsJgtEhIH8nXGWN0a13V3AHb8LBImqhf5exaG+cXwXs5daMsA2RuSAHtH9Gv9i2O/dW/2Omply18FHuu93HY5I4kG5x3OXZn2lg6h5GBWMbpSol3GOALIO84AmqP602VwEH8EYimDTRNRwzElYu3NCg2V8PJdUnVCSR7TZg2zmiwOnQeucb88xkrNt4g6LYaxwbm0DreaK9q4hlY6yxnYwzF8kgsPRccS3W1U9QecWzOoWTnk4YxK57GMlq8bzTHFcUBequA/NKgdCU2ozFqqgBpDmEog11mnvbui1x/cB127kJ8md7iYzFzAUQqwgyaFeFdIDxr8jjSIQx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEEfKSyGoXwZIOYoZLexCqzgl2apRwGKsc2HAYGDDMo=;
 b=gzpzu4FnTGuJQbTN5RpPZVzi42+OIUCh8TlM1u7ebht8jszvd2bgQcDPwrW/IGk4fUwYIkNBsViIbOXi4nnZv+f+kjDI9rmbYxoT186Hv8PsGPWZNAWFFUHjbjG7yyzSgXeghSay9GRXEFRW70XKlQQDhhcw1FKeEQE7DjI3ecrULK5IUxLRZ+tp3LaeMIz7g6Hv5JV+DfLvQ9fa9jJS/xtCugqn1knRC+PSnmRvnEj7J/u3Vduu6SIHXsGf3tcQzOK7Z9yrQ27/02atjkDBfd/L4UqnYWwRsnmpo9jZO3zkZS2ai55cZQZG97q1JGeTifuWQ0Z3BQW2CcA9C9g8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEEfKSyGoXwZIOYoZLexCqzgl2apRwGKsc2HAYGDDMo=;
 b=Ya/XP7yap6WENZxXH9VsqRte5YCn7h2SASHaS3OlPZq9I1DdRXBag97Vnh5tDeXkWFXqks+AIop/eihg0HYCe9pGOs7BXDv2VLYV8dSe9CZjo85Xg7eQgFVsR+iKwb7WmOYcWI6zZOhWnKBL4tJd6CD9SFjs1XbR4iFmezK9hGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3011.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:30a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 01:54:44 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 01:54:43 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas Cassel <cassel@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: dwc: rcar-gen4: Use 4K EPC BAR alignment
Date: Thu,  5 Mar 2026 10:54:39 +0900
Message-ID: <20260305015439.1529006-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0056.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3011:EE_
X-MS-Office365-Filtering-Correlation-Id: 4101ac5c-cbed-4581-19d0-08de7a5a2c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	YVZ03RDitDbmasYm6nZEFNh+V2aY9lW01v4qHHZeuAIN+judkYewp2+YlEmohkHJysLzVfBoHWUJmvQPo01DPVPPzbqmhXOI8ZqGPidM0WtBlVD7GNf0ggzePfMhVwXosNEJIihffsSQgZazFwo+Tcbx2KgUhbKkCUiMddYYB90C7xnXcXERR8mKi5VPWhY8ySKYxTGNED1AzXa/jgerxhDwqVHlbWw7ecJIoZJT+kFqn+r1KnWA04U52VO3al9LeCN3UTt2rg31edCT3bb5MVzhiO9AVDA3PEflpiIUTP/6A4ni5y6SU2CnKPEojxq8ATkAm8b3239ArPOeKJJ/XFKNvHQn/+NstDDzGOS+elBk4Au/agWc/LNVv9U/kgLakp0dZMm74Jqaz37E/vDKcZqIhmZ+S56zNPEbewTLhaeOz0YLdGJhRhnM3phdqkXepfDKrQcSiRMUtj0PRgQgylF/mLWOT68GHgQpF+YwDkhHrhDB8JxQEPtxkcG+4xb84WuAeWd7vNhqS9nUa01QBMs75U/rJ6qtt6fvu5Pp0wPPPQnb5B3jncZ1BZifhJ1d/xqP07XiidrdfAZi6/R26lxaYvoTBgbrprNLozakdn9sBaEqzTuEZJ702AqGw/XiQmRvAuXFo7O8TeuK5URgMr6lCpQ92vHywRxxoWcfCyUOcFZqh12tKTVgQW4mrgreuLLbN98pbfMtO/6ZIIIO8jresPpv7TnllHgvrJsPo1rF+lT7Z7ii5B2rycx/vDMFzUt0ddK4VPfXcMlZq40tIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ASRs6jQbHMnpd3NWzQmdU5l+VtQeoQggO1bqnHRlDKfgXWDQ3NjkwC87OkC/?=
 =?us-ascii?Q?ssDY3i14AqW4SeZHKFeLalxaS3PbTSqQjeyWP7uMMjGnZwF+lNGviD+R55k3?=
 =?us-ascii?Q?QAsfdW8h40+X8856ft9t6+1OvCEwY8kvloPyJzO78uSiTpfwhIeAZIgWLPsq?=
 =?us-ascii?Q?oVebrE7O2m67t0egMSmUBYmysGgoeSAH/wrseBVOf9+yvR5M6wV7Yo+gFruv?=
 =?us-ascii?Q?zppYDocwlQ+hwIEgB1chmqce+Z8BERYciwmHvyHmJ6F0TYeiyUuTSCRb+NEm?=
 =?us-ascii?Q?kIuFpz+kLslkJvv0w8AOvT8axmKGFLdxtVKhtfJ/gSpMnmCOwOaEA3Ivk1S2?=
 =?us-ascii?Q?JTHIx/y18f05P8Gw3KxE2CQ2ZN+KFTii2qht5aYn6NKWKfMntIhKeVk6kPhy?=
 =?us-ascii?Q?+DaMlSzsuI8Khp4/8WP0WlDTFpMemgd9SqLsoV05d7+kYYqpY/16A5Ioy51Q?=
 =?us-ascii?Q?7IoQ5XtxMFeliMt8PuOp7QxpBvtplzvI4AhkDgNVMCbDRzFxTafzLIKymmo4?=
 =?us-ascii?Q?5G2c2E97KhNedfTKMLf5DRd0QcSGjH4wTJUtun7/hB+jHfu23M6i96dVCNY9?=
 =?us-ascii?Q?+0kSgUbY2MLbEFay2CCPxjLhSM/G3taBsPOspVHzi9YdTle4I/BVjPH9ki9G?=
 =?us-ascii?Q?ZgZkUGXHUdw3rTZA+O6IpVxLJl1SkY2WBacvp+jrre2wEZx16Lb2Ky6F/icK?=
 =?us-ascii?Q?QEE7oDEPsv0GRazGBRTbTufyAtVHgynJM/chuYE+JVJcW1KJlGB+IcnRVbBX?=
 =?us-ascii?Q?a1n7H3PlzGW25SGBpImWIqCfqKcXIOu0BHxGc9pIRQohIK2KthIqMsTq8BJb?=
 =?us-ascii?Q?7tgP8g+O54uu/gann298ZOyj6oqkCseXu+hRbiB3dJbg+ZTd5AjIcg4beCO6?=
 =?us-ascii?Q?u4zWJwpUCAH5yhe9jFib9zrXk/YmWjDi2nHgddHeDhw8HWBOzFF0Paz5GM31?=
 =?us-ascii?Q?1tmDc0L2E02T0bNNRn28h+UJeHbmw73PbtmHzdYw5YoIq5r3q+cBYmVcj0R/?=
 =?us-ascii?Q?cmOfA+TywKczsGWXbRdE4H2TYahZNeyqqKPZFH5/65sirjc+BImfVrnnP4DA?=
 =?us-ascii?Q?faWGh0RygJO4WrcDVFYQRnCN1Q1nefzgOjL8MOV6et1Eq/KcxUbBXFzkNMx1?=
 =?us-ascii?Q?I2DxAIXZJV/RsHfHYRvWeVoQCAM1uGFFkexYk/UXFrO+vaciG5ZSCJ7+m9Mv?=
 =?us-ascii?Q?EBlbQ2fJJ0iIbx3ig9g8zQFchq5OgaB2XFS1lo2KBeEJDB6w77IEP5BfJ2nj?=
 =?us-ascii?Q?wd0A5WCwQAcG0uhimgZBJ6InMPkkI/9SNgYoOTkjoo/OBFb7UC3y5ZLTaLaV?=
 =?us-ascii?Q?E/b+HlxdfP8W0n0SK0bIlUvdTOZpffBlvwh1BHleIgtUc4al9shgIJ4K7Zfi?=
 =?us-ascii?Q?xA06lawXZRs7WSaW53/1CRu4iCXa/sxlJPTlK+XVG4FnWn8kr9CY149TgeDt?=
 =?us-ascii?Q?w/K0B8m8tOTpKXnZgz3r1Slrx7mFzZRxMXtxgGEG28zfjr8YKk0kWSh5bAYH?=
 =?us-ascii?Q?j9NJEuiRjin1cG2b0pQFVJ5KuySHeVRMGCtCfXFL5/DtYkViK6rjsyHfGeg4?=
 =?us-ascii?Q?vD7SMtPG5LR+7fKTywKtkwYzmNodjJWP+vTrbxuXeViaQT+0hjd2jPjL+EvK?=
 =?us-ascii?Q?K8OkT9T1Z7GpM4U8GEkQA+/9SofvtjYSuCF6xx8iyTIzYrV+AaOJLoEb2xOt?=
 =?us-ascii?Q?gjZJd1wjDMSVoxejac91KmMXFw1wYYF6e59v1+dP8fcj6DXIEFF6dSoVEWbW?=
 =?us-ascii?Q?II+GHrygXmu85ZzMpAlaq/ATMYAQa/HB48yLJpG6NWLl1jRHFRJG?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4101ac5c-cbed-4581-19d0-08de7a5a2c14
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:54:43.9274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTTF2ylhlMTwVWbiZzyJbf4itm3zq+50w1OpMs+O7tGO4kheJ/Zq7afPS96GJHl0mkjR4p0PULtu2WBtD2k65A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3011
X-Rspamd-Queue-Id: 654A120A0B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,renesas.com,kernel.org,google.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28832-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid]
X-Rspamd-Action: no action

R-Car S4 Series (R8A779F[4-7]*) uses a 4K minimum iATU region size
(CX_ATU_MIN_REGION_SIZE = 4K) as per R19UH0161EJ0130 Rev.1.30.

Update the advertised alignment to 4K, as described in
commit 2a9a801620ef ("PCI: endpoint: Add support to specify alignment
for buffers allocated to BARs").

With the previous 1MB alignment requirement, iATU programming for BAR4
on this platform often cannot be performed, since a 1MB-aligned target
address may fall outside the tiny 256B BAR4 window.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 3d4a889e38cc..396ef9432299 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -428,7 +428,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
 	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
 	.bar[BAR_5] = { .type = BAR_RESERVED, },
-	.align = SZ_1M,
+	.align = SZ_4K,
 };
 
 static const struct pci_epc_features*
-- 
2.51.0


