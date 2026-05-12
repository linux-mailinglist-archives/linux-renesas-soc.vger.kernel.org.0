Return-Path: <linux-renesas-soc+bounces-32460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFU0MLD2AmqvzAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 11:45:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD8B51DFDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 11:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0A6530156F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B6C4BC034;
	Tue, 12 May 2026 09:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OMd/Zy4R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA14B492501;
	Tue, 12 May 2026 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579106; cv=fail; b=Qz6oLVNQUjfpfjEzK+esfFCcPZ5MNSXPXKsbzig3sHkRYcrns2N5qmOfrd00FD5Co7qBRgpFRbP1TDmLZuvByfrM/ORRxqSDmWEHH2GVpxFXnu2Z0DohJud/DInrjLXAglE4ktHsKt5BqkYbmv7Rx0itspf8UVbagZk0M25YKE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579106; c=relaxed/simple;
	bh=cAly8H0Cyl62LWR4sW9pU+59yFq3FxN8Tp5rONX16AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OLer5temfxYZQX5X0yxP/7wu/EQw43r5Lm50vIFyfqXllgNa5fZDGvJoFSwU06v/4+uUXjmR5sctoWHBDDZwVEI0Vsoib7mRzb3wpxmrjQnckr8SNY9CoykA9RyPHImmq5r/+7yvM3x5sDQ0u7jn/sFVaPga94pgbpVmtExIoHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OMd/Zy4R; arc=fail smtp.client-ip=52.101.65.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHSQ4hJz4XQ3tsNhEP6VQuAqpT9RFa1YCD0lqOa+wKERODF+RMfvFSauQDwPFXAs1dZhyH8BYK+ODfwyugO5o30dNzv7p077dsaFYS9l8zZEPNBTHnT7hF5pAtNPtEkDxYH3/OC6uET0MCYwa2RlANotX+Dzj34x1qNxpuGAgi+mAYMS8MOmqYSVm8LNDf0W+JeKMhFdaZi1m8F59p2izQnFCqAPdHK7jtrb7+NeTGaqJvRZjw8ZXimtC3mG+tc4XvCHjdB9t64bjfSjRLG8+K7Ftet7qQ7hM3xw9kfC7wTf27yAn3MQ2aU6cBMX+jnyy7dYdQY4zbDSiKTmjiLJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caca8GU8qvluGruwqlDcszdlFEOYSaRZLYNy0czE9lY=;
 b=EgZnEt57aIJYl7hdnenGWeMWPL4F0m9ERPgQyzY5WdRGyAundA3ne+TXAArgFwo2Skwi19lzFLrXfknh2VgDo7KU6djEEUwSJpIdEDj9C/ZcpK70D9WmOpcIE5QBPb1j/RTlfG0cJo0Is9pQd/uO89W6QYvHrUf/PttUx0k8NguRLhiH7xpfSjnJs+KEunfpYgwt5zBsjOwRtdOnvJ0O5bcxzoijVHvCnzdrkQmwGVZ6BEI53ic3cy912Jt/fVg2wvJjEAL0hxY8PUIPayG25zxppdtQGI7HOUcjdVVTaiNStNbKSAr9Ay3BMQo9S/zYthgjicjCP0nx7totFGQ0vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amd.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caca8GU8qvluGruwqlDcszdlFEOYSaRZLYNy0czE9lY=;
 b=OMd/Zy4RkpTsQJg2CykRplMIUMC/m9jVCfSUZOL/+sgmZKK3O8bf25dNyd+XBgYwnEXSmnQh82+dGlIo+ulJa3IbQVF05UIGRDoiv4Mh/2jW46UmhS/fgTnMLPg/GfUplK2OW7OOxij4CGzbHtRG/ShwjhedGQFBf+a4btzx1dwKcP4p4uBl9+vvm5o3GlP1KDTbFEs8OaUhmCK1CzNP9IV3bn8uwzKN/I3mNFd8aDIr58FjLzQ/eKViENrK++fLKOvjeG1xDp64QQG35Aet7Md6/GiW5Qr8xGUWi6cWp5zLxLD5yKPOyzei3qx0P790jpwkFQMvkbg5VRWpBLxD8w==
Received: from AS9PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::16) by AS8PR10MB6364.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:56e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 09:45:00 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:542:cafe::a0) by AS9PR01CA0038.outlook.office365.com
 (2603:10a6:20b:542::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 09:45:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 09:45:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 12 May
 2026 11:48:15 +0200
Received: from [10.252.13.51] (10.252.13.51) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 12 May
 2026 11:44:48 +0200
Message-ID: <bd083464-a5a2-4994-ad88-ddf42d2c765e@foss.st.com>
Date: Tue, 12 May 2026 11:44:46 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] remoteproc: add common wc-ioremap carveout callbacks
To: Ben Levinsky <ben.levinsky@amd.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>
CC: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Magnus
 Damm" <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <tanmay.shah@amd.com>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-2-ben.levinsky@amd.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260511211841.284809-2-ben.levinsky@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000197:EE_|AS8PR10MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: b46a41b7-4917-4bae-ac60-08deb00b22b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	UxNAa4Dfv4E2r75dMAPzUrxf3TwLaeMuNgGFBVY7RBoT42SLhNFrAAX/dmNhX4o/BdwoHPPBS882pByCqIugPCIKxsAzrgS2a6bwxrBCJsc2WkMFE2LzRTrYQUt37gNjmZJSCCem5GXtXI5KBS16juoe1gCW29AGXxj+EX23Ch+DVRJqG8LEAUMDXz1pRyLU2pSdyObPvgFizJT7F/82UlVCBFwQulpi+2QmCqOGs8ztHBesWzZb500yFqmxvLtGWMK+IVsFfKuUrv9u31oO4gOZGCVMVYEbScWl1NvbI7hPaOhUliVw2zBByf0CLyqBxZonCCBzfXYoJ1Pm0dBxGXM9aOJzG1qeyOeKr50d/WEA40pluAvoQzP0cxUG/6iy9/f2EpqgfJUUDkjBX9SbPcvw2q9qciHeKPrj6mx1JBxrT1WV4FTARHxxWsY1+AwsoEkFb1ER6bXmyjTnmcQIa91bpLvQIhWFRjCXA7tNp3NXIoYJQJ5bqPtS1rkdatIhKO9TMdnWliSXe5lfFjknl7QjM6QIcrs3RCxbXGa9eOCsGO8feLc3WhVHH14RwXkGkzitmnF8lhNh9WH3QdaFBaEOIj7U/Fs55EbYnSP6EE03EL3ltbN2P+AFbhaLNclQllo0wsLEJ6ukbR8GydWq3QDyqHaW9t/wmDsApuA56aGKFfb0mcOW92AWk7UwiNJ4DJe/B7wY9aet3Rf2hGjumE6FCC46FXAbQwB/kKrmlJ8=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NEhsbyESDbPZeX7F5OEpGX3gIcbXQAIzBpLAW4mOY6Pzc/w+w2RKMT5nLBETwLgwJsqN6Y8wmpPVUgZF0xSnfUmF5dNIi0TKGc66nzS5V5Nm2DZdTsgYuQ8F648Tsk6ImH/mukh9bC7SXD6SHeun87e/cbC6pR6YyKBhzj71u4srM+bddHMC+N1QLAlWAIphF1otxGHI0RkaoWcTcTtuByv16S+0P6WIL6eZ940roUgGJ5hbA+5tMWU5Nf2so3n7vL3kTTwyCLRR2WdErDBrbxLy1NfXCoiSJMfJqKWbxhd074OdoOusVT2pdNKawZ4eOGrb6lUwAw7NxVkOtz2/VV6Ko/cl6NgXkFzcpDOUtYBogajip6eG5VF4Gy0t/Gqy40tbKIcIXUvNRe86ysdbvQn8ZeAalijjTR/q8WNXkkr0k/UogvUbNSW9MEVAlSd1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 09:45:00.5509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b46a41b7-4917-4bae-ac60-08deb00b22b3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6364
X-Rspamd-Queue-Id: 3BD8B51DFDB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32460-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,amd.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action



On 5/11/26 23:18, Ben Levinsky wrote:
> Several remoteproc drivers open-code the same ioremap_wc() and
> iounmap() callbacks for carveout mappings. Add subsystem-private
> helpers in remoteproc_internal.h so those drivers can share the same
> implementation.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>   drivers/remoteproc/remoteproc_internal.h | 26 +++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 0a5e15744b1d..3724a47a9748 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -12,8 +12,9 @@
>   #ifndef REMOTEPROC_INTERNAL_H
>   #define REMOTEPROC_INTERNAL_H
>   
> -#include <linux/irqreturn.h>
>   #include <linux/firmware.h>
> +#include <linux/io.h>
> +#include <linux/irqreturn.h>
>   
>   struct rproc;
>   
> @@ -122,6 +123,29 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
>   void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
>   void rproc_remove_rvdev(struct rproc_vdev *rvdev);
>   
> +static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
> +					     struct rproc_mem_entry *mem)
> +{
> +	void __iomem *va;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (!va)
> +		return -ENOMEM;

Could you add error message here to help for debug

+		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+			&mem->dma, mem->len);
> +
> +	mem->va = (__force void *)va;
> +	mem->is_iomem = true;

HHere, you set mem->is_iomem, but this is not done in platform drivers.

It seems better to add this in a separate commit after patch 2/4, with 
an explanation of why it needs to be set.

Regards,
Arnaud

> +
> +	return 0;
> +}
> +
> +static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
> +					  struct rproc_mem_entry *mem)
> +{
> +	iounmap((__force __iomem void *)mem->va);
> +
> +	return 0;
> +}
> +
>   static inline int rproc_prepare_device(struct rproc *rproc)
>   {
>   	if (rproc->ops->prepare)


