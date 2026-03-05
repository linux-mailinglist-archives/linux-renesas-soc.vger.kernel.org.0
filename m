Return-Path: <linux-renesas-soc+bounces-28897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DqzJQWfqWnGAwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:19:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D99A2145B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A39A305A2D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 15:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9E03BE14F;
	Thu,  5 Mar 2026 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="rTDiYZt/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020130.outbound.protection.outlook.com [52.101.229.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F3B37FF5D;
	Thu,  5 Mar 2026 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723482; cv=fail; b=F15hdI7wU6WkAA+YwAl+lBYIAXAw6ExSi30/Xbk51xTXi33U8qdN2MdtAxkD3PxB/G1+4F+3IFE5q0asj+uTS+rfICa3r5nlEsjZQJnDgoZal34rgAMQ5f39L2XtM43EdvEm/lNrOnRyRKVNFM/dZ/nCoybp+eTk0gZw+Eo7fPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723482; c=relaxed/simple;
	bh=+AKLlLJtZzcRU/v1OMRvRt0fUzQVro5IEn5/3G0M0ho=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iSpafEgjLPiwUznlYO5I5e/AQ8oZ4fBqWJtABC7B61XIW/w9r9fcp124BLZ/PRUMT5HECEeTqfH1CwEINJycD9U48RZ0SZd2lpdqf/jUe2vVeIJ/TgYzpYTg9kctjmw/DIGhCkYgfaDscbMtlkT0x+EUdFmmzxAs09M3hZtCWI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=rTDiYZt/; arc=fail smtp.client-ip=52.101.229.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5Asx9rVYSyt1U4OQ/JPWhGXL6BNt/Zc2ScnhWuIOg1wHCJ/ROlL/2EpYrSdQV+n46/41bXxY+ra7+/0VdiporTxxzkr2zvLSToyEvn2ey9C6qsEwrdkQOyVHfGRir9FfUpmkbe5+4Ceopoxh7TLvnSIcqPnHRSEUI3WMHuDOQf5DOdpilR8YKOwn+kS2/6RBWTWSLP1tv6o8vPXLDfCxbQMfLm59UkdA9CpBEMIkfd1YJHZw3/FSzNh24HMxJaYULTMNHXHsV0UKIuDojN4Ehg1461o3Eb03LmUnF/rL0hcsUEXnu5yBB+9bKXHzg2d37Wi55c7gL3ttlGzPAZ0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHELnCwP4zhUrzFDMZ3ETVkcMagdIdT9180rH5l2Vls=;
 b=oy2ertqrDwdhU8+MqvVQ0ddEoOEM4iHyzUB536ugKB4twdiyQFeteMFuMNzqYMu6WVPABHCj2mCcmK0vdVsLeQdbHFGSETyDOmaTbylK4VVFa/7gQpRcihbQKDnnVYcyi63ILJt+LC6pORXeaZV40rpu1Npt3zKjDdSspRrt1IZ5DIsXlb409oeoP5Qtt2mtxWvA5rgyOz7NfNSbf2f6vZQTvcCfq7csTjSdOa3UxefeEj19ETAErJ3VlQcxvgGBLKH/E3mbWfPjq8DbeZpBHJheK2IkLx/T2u/Igf877TVdfc+aW/syVvtI/QPlsOU5yhKwKpcqUh94fAFpC7q5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHELnCwP4zhUrzFDMZ3ETVkcMagdIdT9180rH5l2Vls=;
 b=rTDiYZt/K0XXtxRCab6MDqw6VmtqTVOXPqANdT+mK7IaaAjSq7ht6cseHK1GFNHBj/ZXF7GUTvB+adMr6N2OcSPehW1Uf4fwH3sUeU/GNY1OQgrCiie/bf2ccszzxI0bKy4NNCT3an25kLSvpv4YDL19vRuozvG1468v0Ib5cNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB5255.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:311::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 15:11:15 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 15:11:15 +0000
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
Subject: [PATCH v2] PCI: dwc: rcar-gen4: Use 4K EPC BAR alignment
Date: Fri,  6 Mar 2026 00:10:50 +0900
Message-ID: <20260305151050.1834007-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: dd619fe6-1f26-49da-f1f3-08de7ac971f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	st7Hie/rv7Sl/s4FUiaAMULZfBBv1+PONRz517TRdyXNOhcC3SwTkX4gp1A4nYqxAUpa1aCbO7lD6VBn0YddNd/9uUTghrsxvp/PDFF0QZGPBgvmVex9XEmQmw7OyYMixirxGm0oXWilrajXdfzr4s3qHK83vQ4CyPpO+r/rHsRUaZoMH2qYPOTH5K1WXvw/hserqLVv1rd0djOUmjXArG5rU3DvZl6OONgzuDuggimXcr2dHTvOUpJ1Uwhc7XwGx0tz6XeMcCR6/eBC/whWBZxtXlkhqjrVABbmIa50uIPQInwssP5I6DZ4lVw+OJtzIgpJebIfBZqxbVlGTkk0o9xMczLxZqEMzHWIKcsb/mh1/zQSkbJX7qIOvexEnEcWsJyFsjlRy1xfkDjQa/1JaSJ+GmKsljL+9AR9NrTBMNTESuZeUS6jhl/4i3nYeZpGzO8XzPOkdFFgOB0YPpaSu0kQzDRWsKKDfzfZnuBHmkXPtGw4ozlSAP5QDyikFOnRzfbbtzbKzBnb73oVaxYVcwhPNSgMduYibBMbOdBdZcYjY60zkubBC4I8kk3U9yMpsTUSKkZ1ckRaZ4YRtCKDQcwjG0sQlQJbhqeBXVtZjSTN2Vncv3C4/oBtCHN1uA4gmhMtx3fE6UeApNr69uB/ujgQNYOD7iTiJBlrbe0HeqioudfTO0Rn1TJ8YQ4+7wWzlGP8Fl09GQQvz2bz20acPriisKHKZ6lsmw3Rp85QUfhuYbEo/LjyvJQCH5KwV8rHNLFdt4+xhHtJaeS9UQE1FA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u80gbREPSQhYpTZdjDVxl0ZUc+jz/ZGyobkh+E3jUvi25lGCIKFj7AzYv1cG?=
 =?us-ascii?Q?QrW259+6ovLQ/KDVgYtPjITrsuTOcYLLAD5cOMeLmxkpHQYTSvr7F0HXvpbP?=
 =?us-ascii?Q?rihxE46dEF7L9X3Jae/SwvFiyvIyMCm2BTmy+gvZnOzQW5XnTMJOWfeYg8SU?=
 =?us-ascii?Q?ipaJ2CMaNy4fl79d/Q1gnGbTTahQ47gzKnADEU1PaWJOrJFi/+I4N7u+J11c?=
 =?us-ascii?Q?W/VHxUal5BcvehqyTzZq8JBjLrxHqhG1zPySfdD4HCfiuy30I0S4cMlHxu72?=
 =?us-ascii?Q?NGNRbLHlv0G2KGbcylOj8sA7Wd4hgDUIQdwpeRM4qFWb9kkAHYWCjhGp7zi5?=
 =?us-ascii?Q?TiqPoqntHCSQ26WdC6qPhFPMtVP1cdeftgnUe1cuspBR4Xpl9yhHzG1gBWbb?=
 =?us-ascii?Q?QEF1+TKWi2qq9tEbmg88gm6xajXRzMetAq/gMvW+HPCJWqPseySGwTBZdWBO?=
 =?us-ascii?Q?sLXVBerZKSAGGz7UgY6UoBCViWVFfp186RDtlDsQ9n696cW0m/YIppxW6oj1?=
 =?us-ascii?Q?JsuxM1qZWUsmDglUeaUkZyk76TqWsg1HPFMuNL4cOsB5ias9/d2EzJb9EA2w?=
 =?us-ascii?Q?bi2vKnQ8kGhbTXv6wKmru86yYUJniHIpUPzqCk+Rj+d0xXFbdqYT3WK9WeI2?=
 =?us-ascii?Q?TDp4AN2G00OYVRlGtxGGw/07VUaw/H6jtJJT+ZjbD5RroeAjt5BlIeRZkqAi?=
 =?us-ascii?Q?3gGSTCBD3iSVULbNl0DrjBsrhchKF1tREtoDidoxfvZGG1hy+awdKBgmuu5s?=
 =?us-ascii?Q?lWGo5wimSEaqjtKFxJThsUkMN6IMJcJHVbZb7fGqyfeDdDTs5bkKiXE2rs3Q?=
 =?us-ascii?Q?LAXTk+t+AIt83xm7BtnqVyg7+1vC9cMOK/A9upVDrLmOLLPIUScwBnwlvDPd?=
 =?us-ascii?Q?puRnUkzuCl1LM/HVlSvWyjzhaIKLv3DG7D7nwFewKgFRNbHVuLrV/fXqiUgS?=
 =?us-ascii?Q?96ZKdJxWWYUAUpChd4sq7R6PddY+yx/jhxiQJwmrLOSl77D2kQayNwTQCnNz?=
 =?us-ascii?Q?1oUmejNvKM/4SUHMwyBfa0WFcjdREVzGysdPkR3C1O9G4q/xMt0toSShJNJE?=
 =?us-ascii?Q?4kfUH1i29dr/aVApvtG5qehnMmhqhylgft5yrP50AGptH5JyjUUU53QaGyTb?=
 =?us-ascii?Q?5BOMYwsgSf6x4ASuHXicrQVy8qqgBbNTpWJFPWFHb70TYaB/+wRTGszKcH/+?=
 =?us-ascii?Q?d7VJzVzGuKqyKS6gHwCoUccO2aErQl4k0To4mXJtWwChAB5CiWoMBNBRAXHP?=
 =?us-ascii?Q?l5TMP1yDt64b3a/lDqNOUPOZwrurxYKfq1imvfFC9pfnXs3KXIV1+lNNcpKt?=
 =?us-ascii?Q?GosPWY5ZQLLgcBg9GRlsDK9TmcV89FN2D3W2cLOc36rj0pP4VmDqWuF53rju?=
 =?us-ascii?Q?Xrq57RQaWnhM8CnPd5k0vhJ1OFkPpUKhT6y23vL+6Mob1grNT9xEECWWqmbf?=
 =?us-ascii?Q?6tAbw+IGmT42U3mdRdyyT2XCUnxUym1y6eTD/I51KpEsqe7/BKW7bosbxm3U?=
 =?us-ascii?Q?Hs1O4Oh7tR/u4P/8eckDIiyGlXobs1hD+ufrHxKaHs85yyoqQLxRyiL4ei78?=
 =?us-ascii?Q?CSEyxkdky2ec2SYbNw/8GjUrTcj3Wd4XdAdTybAi15C1nEBEXhjootMXa5l2?=
 =?us-ascii?Q?8VTkkw58YOfrNwI+t6wSDp0gfa9q93Z54VuyOZsMsebKR/0iUaEgD4CRyh3E?=
 =?us-ascii?Q?/5buFXjEGp0/70tAYda3jMScvmlWdG/qbuX2L+OmnU3kx4DkRubZc5VQVQCF?=
 =?us-ascii?Q?PxIdDLjUbETO2GJHg70TKQCcSPnSiNG2C/09VAjK6ruaHrkpN41p?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: dd619fe6-1f26-49da-f1f3-08de7ac971f1
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:11:15.2554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4s8FwiSRNQO8pyidILr8v4oyOLZmBsVtMFbjkM1aT3E8CYZJ+tD+vnmsvQt9ZvXS2vzG2cbS92nilM92u6o5Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB5255
X-Rspamd-Queue-Id: 0D99A2145B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,renesas.com,kernel.org,google.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28897-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

R-Car S4 Series (R8A779F[4-7]*) uses a 4K minimum iATU region size
(CX_ATU_MIN_REGION_SIZE = 4K) as per R19UH0161EJ0130 Rev.1.30. The
DesignWare parameter itself can only be configured in the range 4 kB to
64 kB, so the current 1 MB alignment requirement is incorrect.

Update the advertised EPC BAR alignment to 4K, as described in
commit 2a9a801620ef ("PCI: endpoint: Add support to specify alignment
for buffers allocated to BARs").

This also fixes needless unusability of BAR4 on this platform when the
target address is fixed, such as for doorbell targets.

pci_epf_assign_bar_space() aligns the target address down to the
advertised alignment before programming the mapping. BAR4 is fixed at
256 bytes, so aligning the target address to 1 MB is highly likely to
move the mapping base far enough that the resulting offset no longer
fits within the BAR4 window. In that case the mapping cannot be
programmed. With this patch, it becomes more likely that BAR4 can be
used for such cases. If the 4K-aligned offset still exceeds 256B, the
mapping cannot be programmed and this should be treated as a hardware
limitation.

Fixes: e311b3834dfa ("PCI: rcar-gen4: Add endpoint mode support")
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
v1->v2 changes:
  - Updated commit message for clarity
  - Added Fixes and Reviewed-by tags

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


