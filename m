Return-Path: <linux-renesas-soc+bounces-29358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJRtNvs0tGn4igAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:02:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7332868AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 946C530CA58B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 15:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304D938CFE9;
	Fri, 13 Mar 2026 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gpKJdbeR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734822E093E;
	Fri, 13 Mar 2026 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417583; cv=fail; b=oVi2w3y/iUmhvzh8h5Y+Cff9bHhUJOsTJF0WSxJslHzpoNpYbNS+jZ77TZNiolcjimXJ/fU5hNMv1eTae8bJ5/UsSbb3J9cO+xxza1vitsoxisqL8Xqvq86kiXogVSghUM9R1KTX8+mNyyMq2DTGzxpruIQgQLUD9WWhM9bPQ0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417583; c=relaxed/simple;
	bh=TlcahFzEnWiwmMQ0Xk4y3N8StEKBKOgmeht1mjDKBbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q8iEfMqcvUM4Q3hDBKB2bbdtat8Mhkbh7TPFAChWiAg0bOraXhkdSqFcnJ5zHQDMkSTipnj0zUElwlBtGG2SXvffNT7Os0dn8uPMvYwj/09a+qUFeTlvYBCwLzPNKy108VHpt1DRkuV2czGwNvo8rzE+ou2sHTY7tWERL4KG5VM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gpKJdbeR; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kb2x55vBrTYcc2Z8cQkLBP2JBxckso1Vd/XKmsxuEs9jS60Pwz+HUIyrioi9EiozhaToGXZPSFA3/LexDzG2FTKZ4rSj24unlNpb9ChtpXz7GrCBagBTQpnOSSKWJEml/VIRPZScPr8qkghc+K6GoUd3qwYGvc0hyqXZ9yPKk3SbMnuj0DccHkrrHgqC35z2EuGU0uibNJXpIJivS7XVHVA9NsKLXj+ivglYoMxF9QzAqOGeC7cBHcIHXDDtVpIDD5u3qXWEgLE4iN29Oh6elDQS8xnENRhkemxVvlR8ztk9RyccAGI7lsm7nX8ZEzZdanm5HFLBBdEv5kdabb3g/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fR2dh5GSPHSR2HP3TQPobfR4vXyawiK37BD3N2AYz60=;
 b=Rb/qXHaRRy6G3izSZRn9qcIZj4KnSpVJDsvdmlA5oH5MllcISK9IMxBsek6LUGF8HcL1gSFHaxO9THhp3xJAzJDf1LKdTzpit+Yz3odec5XmqOoZP+2eGqThz+9hm1Fn3Vut+FEO30r8TwO6SvE5J81QSC96tSSBDe/CUFsBRriB0oYcosDgLXGhtvM0kQvUZ8zED6yyPfbLyEad4zE/elFTH9SL3Es5NWER8NjZ41IVh3vixAi/oPkHuEFRtG+LDy8jpfW3hXu39YPIn27a8o9JoEJOdnyAET7dXVMBho9J+2mYdHzyAPxhrE0smMLq2+yNog+t3uuv6+dC9JyOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fR2dh5GSPHSR2HP3TQPobfR4vXyawiK37BD3N2AYz60=;
 b=gpKJdbeRfkT4L2/Wj8/QU3w6hl73nu1DQsr30U+niIAI+lWJzghnjO9wRZfm0QHyk8xqLnYA5w73dVx3ub3bGbTGvf8iJrLT2tc5Pd5NN54bm9cmwErIrHgdxt1yvfcMhaMC5ax8gOMcgo3OojElHxj0/YAUro83gSZSqVcxXg22dZohLVWLbf07EMOQURQcyXewaUKm9mDS2H2pRXrV+N4nmN0kxT+ualyFWldTyv/Rt6if2nfbDmYGxyswbHja0jI/UNAD4nD8AD+RBFwQoTGNbrfoW4UgNmpoIbCjAkYveGi2eyNg5wJMRNNdqcwQYS6E6DEhUbXtSS0ckMnoRg==
Received: from DU2PR04CA0283.eurprd04.prod.outlook.com (2603:10a6:10:28c::18)
 by AS1PR10MB5529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:474::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 15:59:35 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::89) by DU2PR04CA0283.outlook.office365.com
 (2603:10a6:10:28c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Fri,
 13 Mar 2026 15:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 15:59:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 13 Mar
 2026 17:02:05 +0100
Received: from [10.130.77.120] (10.130.77.120) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 13 Mar
 2026 16:59:32 +0100
Message-ID: <b2b03ebe-9482-4a13-b22f-7b44da096eed@foss.st.com>
Date: Fri, 13 Mar 2026 16:59:26 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] PCI: dwc: Advertise dynamic inbound mapping
 support
To: Koichiro Den <den@valinux.co.jp>, <jingoohan1@gmail.com>,
	<mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <cassel@kernel.org>,
	<Frank.Li@nxp.com>
CC: <vigneshr@ti.com>, <s-vadapalli@ti.com>, <hongxing.zhu@nxp.com>,
	<l.stach@pengutronix.de>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <minghuan.Lian@nxp.com>,
	<mingkai.hu@nxp.com>, <roy.zang@nxp.com>, <jesper.nilsson@axis.com>,
	<heiko@sntech.de>, <srikanth.thokala@intel.com>,
	<marek.vasut+renesas@gmail.com>, <yoshihiro.shimoda.uh@renesas.com>,
	<geert+renesas@glider.be>, <magnus.damm@gmail.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<hayashi.kunihiko@socionext.com>, <mhiramat@kernel.org>, <kishon@kernel.org>,
	<jirislaby@kernel.org>, <rongqianfeng@vivo.com>, <18255117159@163.com>,
	<shawn.lin@rock-chips.com>, <nicolas.frattaroli@collabora.com>,
	<linux.amoon@gmail.com>, <vidyas@nvidia.com>, <shuah@kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-arm-kernel@axis.com>, <linux-rockchip@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20260124145012.2794108-1-den@valinux.co.jp>
 <20260124145012.2794108-4-den@valinux.co.jp>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20260124145012.2794108-4-den@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E9:EE_|AS1PR10MB5529:EE_
X-MS-Office365-Filtering-Correlation-Id: c8426537-1976-4da1-02e9-08de811985b6
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 fw2s3TSC4OSqWB3QSZGwaozOdRgLbvywUwgpMs4/8C8noz+YqHSBbIk0xvKn7FDYLV+/7rDpQPaRj9mzp/+5nJ0M9+irRlN9HlqIru0wjxOnhfi6/ng0fcD8MvhuxAZZfmxZzFpSFBeD6l5Rx1BZkcI8OH9IdD9oDZhMMMvdH4qkEcGONUeos7qhxS3Pm7kwMFRQdKMRcM28FG2Z3/VsESf0e0S09FAC5R38EEulZdO1A61DWBIUVj8Cj04xOUt70Ef2QqO/Qn3oSFbE33Fsbnt4WTQ5LkFUXXgt1XsfmLvRlkJ4d2BJIi8m5+DGPIHXOLoreyYVBonUVAJZrCV0c8Mimg+DEcf+9MbjF+kYSDl+jJHk89xcmRqCIeNrWIL7rLa0D/ZSEg8XkYuVKb6HILjktp9tlmiSbmB7P1cM9xfKT17m1ic37wqI2Eli4+D1DP8L2kzev01LbIYZtQEjjrMTBQ3X2f4QI21IbuPJHqlNQG0XL8Kv5l7iBhnRTr4onyJGIHwywo7Ts/Jmol+61A27irVIgQh17r+VqUUm+m0SRPuJWebSl+M7zIJe7D3+scKVXZfwRFnnjqqKE7Yw+plGOSSmrJ7SAQ1W9gTt3PDuG9evFIHKoKdBw59C1RlTchruEKoycqPPHOzxs1eBFwySto1fw2QUtDwa1y+bb/NRjGA7SoVs4ShNzCXr7sCT4fk6W3zE1aqGvA9gYhp25kINGwoBqrZ/T9MJmEloAtYKAZ7XbE3bGsveIqZ9Aa4HmBTUMNKPW3UE3YuAv4Sr+Q==
X-Forefront-Antispam-Report:
 CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 TCChnitx4bv7GwJxbg2co3WJ1o0/vLzxAZ+5RWjFIj9Fi+VADGhjsGJ8wL+BXhF1Zrkfc0QVyUOEBn8OA5F4CCvXUHAKGFytDzYgfkRNaN7iU3nri9WaRnkWiYG4TZkJBSvx6t7jztw1cf+6kRsBEzZpkyYJRIPemkL7AlQB7JAYkE4vHJrh2bEdLblFDJH3kSxG+1ZdZi58LWTr/dTK8/itfj80yDV1a2wC0A1cwrcJDEzA8d3VAEe34YJC72HjHXmR8HJxwSIzQH6B/wDLVd3aR4ysgjJhz2IYU3+hNZnPzulF70Pg16pKF24YPXqVKQjBsW1PVDVHMAo566SBkUq0TdloOvBfCohZEC+nNo9T078fY3EinexDbWyG8KB4AdAxERHYJnRYYL6UIhCOwolidheRqRKmVrImhRtFNz7BNGkiMTAbob3djDiIXc53
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:59:34.9843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8426537-1976-4da1-02e9-08de811985b6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5529
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[valinux.co.jp,gmail.com,kernel.org,google.com,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29358-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.bruel@foss.st.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	RCPT_COUNT_GT_50(0.00)[55];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8F7332868AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

While testing after this series, I encountered regressions on the 
STM32MP2, which I am unsure how to fix. The failures depend on the order 
in which the tests are run.

The STM32 ATU has 4 inbound entries. After enumeration, the first 4 ATU 
entries are allocated within ib_window_map.

On the first run of ./pci_endpoint_test -v BAR3(for example), 
SUBRRANGE_SETUP calls dw_pcie_ep_ib_atu_addr(), which frees only one ATU 
entry (BAR3), because we were in the bar_to_atu case, for the first 
submap but fails to allocate the second submap. So the test FAILs.

On the second run with a different BAR, SUBRRANGE_SETUP test calls 
dw_pcie_ep_ib_atu_addr() again, freeing the required ATU entry (BAR1) 
and successfully using the second ATU entry (3), which was left 
unallocated by the first test. then now the test PASSes

Therefore, the first invocation of ./pci_endpoint_test on any BAR always 
fails. Other invocations are fine because the first one has left the 
missing necessary ATU entry free. Whatever initial BAR number is used

I am unsure how to fix this. Always freeing all BARs before calling 
set_bar() in the epf-test seems overkill, but safe.
I am also considering modifying dw_pcie_ep_clear_ib_maps() to clear N 
num_submap entries even if ib_atu_indexes was not used yet, since only 
the full BAR is used during the first invocation from bar_to_atu. But 
the question is which ATU entry to select ? BAR+1 ?. This seems empirical.

I am not bothered by test failures due to an insufficient number of BARs 
(this is already the case for BAR5,6), but the fact that the failures 
depend on the test order is frustrating and show a regression.

But I'm not satisfied with either of the 2 possible fixes mentioned above.

Do you have any other thought ?

thank you

Christian

