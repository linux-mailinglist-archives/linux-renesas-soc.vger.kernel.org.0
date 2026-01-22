Return-Path: <linux-renesas-soc+bounces-27265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG58MGXmcWkENAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 09:57:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7758D639AA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 09:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E23DF5E40B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 08:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B430D3EDAB3;
	Thu, 22 Jan 2026 08:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="cJo54ECG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021110.outbound.protection.outlook.com [40.107.74.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA203933E4;
	Thu, 22 Jan 2026 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769071767; cv=fail; b=HRW8JPYtipNGAVbMfk6DhfN8jyp/toxf4yS6Vr0u50lZ1KiCl3qfe1wbp64KchS5XBF6vN/RGRWN3ETmucwHYIpCRH6LLmyEE01ahghsz3fNaQJaGw9Z0JwxhDJRuEfGfQzS+nvsv4odHga8k+G2WWCdq7a0XuWWmEW5LRZHAXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769071767; c=relaxed/simple;
	bh=hCBGilHfDFdoRdnbbfetuzA8hVAIJKht2PUZdgcxmnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gAAth0IsGVCjX52o8eerfR7lr/aWGZubRFwxTmbF/zYVm2b128Pvm4jXfIp3YN5BHgMvEgMUtFJDdbYJDWELpBJhIV9YhEqrTBVtOzCtp6uesWO2bZhNc2BOzgmmPFGy/uMO8cMTSFqoeEX9vjGFT1kE+AMm3koIGtTsd7JHvoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=cJo54ECG; arc=fail smtp.client-ip=40.107.74.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ejd12EKBvsjKdGaLy43eJ93eBAe87NQ24pKpSpHlMr+RHkz4RUeGKOrADlf0N15GXqlO6Xe+/w1d8IY3hOLecZQuaVz93MG1HrWTq/ogD5sWmZVHinOetp1wgWI8/jkCLM0n96YGW1yxoG757yVTEi+Et4q0JvhAm8S6DgZb3n4i6UYLRHp/xjPQCw1drs1PXpmS2Wxq+o4u3wQdImub2WeiO8KOQDeiJL7+FHvsWiahlBQGDtPCwcFToreJNqG4yfig8QC/NOze8RV+bqFH640QJBCX1wUHFu/PaYUnoIdSDpbtW/k5eVQy4Pcs7p53tRla5NJrg+MVdw9/0uQtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSOa7lwvYj/v8UXgWdEwkRWBMUl1vIwFnICJRAYmAgE=;
 b=j2uT1zJnZic6+FmZjH5eP4HVk6VhlGh59IOCg2QSuVr3Ms47EdH/yMNkSyZ9eBRag3ZwiHYP36pNXJtBjIPyhse3mYODjTKC1vapfcg+aTcr97TzlSZrekZpf7RgDDURab7ZEeqau9mnqOI1LDjHQ6h/J2ftQpvPTfR9VYZUSgeAHyN4x2v4yQICGjsh0MNgR8hmzJJQLT+/U4ENnIAEs1I9Edo5701mCFsFvg/RuwgAISz7j1T363QSu5JvuzJJkrnlrNG141m+bVBpQmcGmuIClkseyOR4O284SFBfHJ7LF4vSSKwCO5+Aa1RBRXB1SwNXCId3wPjL3FLRX8xXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSOa7lwvYj/v8UXgWdEwkRWBMUl1vIwFnICJRAYmAgE=;
 b=cJo54ECG9mj7zQCoDLOZzO6kapyy247Jug9fzCMxT5UNE3eOU95awDXmQjMVeUP7EsIYmw3YxS0POkeSXDoPGWGub/cIg2RB9R6tq2HFGrISH1fwEqanVtW8a6TPAUhQzi3LQL9WyUHm0gXETbq5+z4Qcs2ZHMroPLNxvF9C8iA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB6581.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:419::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 08:49:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:49:18 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org
Cc: vigneshr@ti.com,
	s-vadapalli@ti.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	jesper.nilsson@axis.com,
	heiko@sntech.de,
	srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	kishon@kernel.org,
	jirislaby@kernel.org,
	rongqianfeng@vivo.com,
	18255117159@163.com,
	shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com,
	vidyas@nvidia.com,
	Frank.Li@nxp.com,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: [PATCH v9 1/5] PCI: endpoint: Add dynamic_inbound_mapping EPC feature
Date: Thu, 22 Jan 2026 17:49:05 +0900
Message-ID: <20260122084909.2390865-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122084909.2390865-1-den@valinux.co.jp>
References: <20260122084909.2390865-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0328.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: eaff7ca9-9541-49b8-503b-08de599320d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gciRnSpJ8l7j7izlH5aXezItivk9qWuDYHHqNxaA91YsnyEW7gAzaQAckF/s?=
 =?us-ascii?Q?bqnfRR5WAvtEl6/aB73O3ihD/zMUMayd21ltI95cidqajDFDyjKVqwK2MkE1?=
 =?us-ascii?Q?AvOMGznZTwWYiyOSIBTKGYZBprTrzST3DnW3FtAICTan12BE51UPAN+gybA9?=
 =?us-ascii?Q?Kk463X7EB7CZVBHAKHFNaPaYSlmpbbdpgief6INED+AbkUkt749ix3jha9te?=
 =?us-ascii?Q?Dgb3Mahb/56dRTr6a4PzWbChlpYGQ8mJYUlKgf2R/t+zBL9iOL7Klk519lRv?=
 =?us-ascii?Q?TB9tODx37NqT6A2DHrZsL5aH0iHzf0VJTFXYAXSp63J1HoL/hFEuUtC/8dmG?=
 =?us-ascii?Q?Xzsicl/bZs/K/sx8EezlM8tKQNo02UyY6TIE2iD2P037KarbwQk1EyIoMNeV?=
 =?us-ascii?Q?wX/7VjJa+0TbHJw2TK2M//jRCSzXmi0pq1x2KJbnAl+etsdB24FXvfrBn7ts?=
 =?us-ascii?Q?s+nKOTlMXoQreEwnU1n7mqmz8BNGCTy4lYfmL8gcLl576ZqH7bIXq/DvklHc?=
 =?us-ascii?Q?Kj64PZ3t0srj37TbmDSHHdmVewibLvcHhVqpEi1b6IE1Tdh4coiE13P0wL6o?=
 =?us-ascii?Q?IuqbaepHALDyP3BpwEYj5Jxap/Wgl/IWuWIVhhO4hNEPV4ahpXptDeYsKmx6?=
 =?us-ascii?Q?1ZMZhSoDB91rSXKI2i7uDyJOJtsnTBk3sCah6ltXi8bM53J54klTG5zrZgR+?=
 =?us-ascii?Q?D4W//oDnfiATZsgxssabiFJhYQ6mX9cLH12/hTd0lR/iKIone67yPjU7EBkS?=
 =?us-ascii?Q?Gj2Y+DZeqNfWkwZZ5ffo+OIgwDz8cyCwoNXrS4nJseV8jAEGZ4bFPxAN1CQU?=
 =?us-ascii?Q?cfuGgkws7+SpztslJmOzwmRUu2vlMWq9hPnvYOPU6xWxN+mNp2HXq2sE4ess?=
 =?us-ascii?Q?yQAY36Qmc3UO694kltYWxe2FrLA/ohnTL7vxOd6dCCXY2qD2E8q820D6+Hag?=
 =?us-ascii?Q?i3/n5nNpb79+AhstpdHQYW+U+QXn7TudUQix9tkw/CEZJr0sdESIf50zjPgQ?=
 =?us-ascii?Q?DsL1rFCzFfpVbJ8QUf0LtGhvG1uZzB6sh3Sbto3ZxRpjVhljeEChJly+fdGf?=
 =?us-ascii?Q?hOM3RhQIyw6+cmiRrB//9IdQfsUUGYeI2p77vxtyqm3p7bvkb3zFgOqJsM0o?=
 =?us-ascii?Q?X3HQe+bntSC8XZBsV5qdRIIZm0AxTJE3aqo3/zRm8hZza3uFDs5yF5eIOuSt?=
 =?us-ascii?Q?wSXRpXBB9czmqYGST6wofJSSZlkG3qzLGK/RU11ErKezKPI46h4bRRPZC+TF?=
 =?us-ascii?Q?O4y4uXyhVn+/2MfSCVsglRWGCs2pxZ3K8pOpjpSJhj3a1ZUfaK0/MOcd0Zxs?=
 =?us-ascii?Q?6Hkl6/1ydDXuPYCKYxeXPOKDbVXHTvmqolc2ahkmU2PcpxdP0/1UmwZQ/br2?=
 =?us-ascii?Q?XYrlINQ21p7K2mS3cuYl9Gk9RiezrlIZmi4mRC5Ql+pRm4THVsO2mcT4tsAN?=
 =?us-ascii?Q?0muT6i1XduRpZu665J4NYSXrMNlqTX7Gwz5d9RtpGqT62UgC5aS7cf0HvjT6?=
 =?us-ascii?Q?dbM1YyqOTxd/p1iwVD8h+rpT38Fx3vkAG8SziB4QssIMOJhj10zRgvTMKkFH?=
 =?us-ascii?Q?m01Iv0jK2LfKnttQHko=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YlmzZa3c0H9Ekv6m6S4Tj37cCelUdToepAgzmSGqdjY2iv0guBNyCcHHAeXr?=
 =?us-ascii?Q?O6IJwSEHZjLaBFjm9TTedJG/Zz9rODcXPbAWWhyEGV0R1upCwRGCLUFXRAoq?=
 =?us-ascii?Q?44rPwuDYeFI3ZF597s6sBlGFNh2AOQKr3xe6tvqxTfHDkGO3uVdvAiVgqKqU?=
 =?us-ascii?Q?x6w70PMoH0Y55HYXBBrlI3XC9AcNAuuXT7sFKiyFSwiMOMLQrbP753YVwvVp?=
 =?us-ascii?Q?LXUf2XrJ+Ep8g0+F8mIu8fQ8mO937pQVj9X1c+8i0WAsl+sV85sOc4a6mDgB?=
 =?us-ascii?Q?HmzUUWH0P7Kxo/pMV2p+qlM2OdDb9WVtWwXW1iYWkrTDKeysIlxdYsBZxVJ0?=
 =?us-ascii?Q?UOF00Hzf6lJ56+rWYnE/KXKyUTyx/hqThbH+HZS4kbFXYSswhp2O5SZ6qqrB?=
 =?us-ascii?Q?ZC2jJh+qrrGDu++ZLwcaX1XPkRWp2ocNhSEMk33mNXdTbWYXtUVYHfwrWBAE?=
 =?us-ascii?Q?9n1HQXPK8Cq3buei5q9oPShvCdLJxLMxQ9Y+4enxo7BK7r9dgbMbxOhHY6Hp?=
 =?us-ascii?Q?juaGh4f6exRPS6VoQLg8atdhLEPjsoLAnGMbefjQieefOqm6SbQEL3iOphNu?=
 =?us-ascii?Q?wh8GSPo/PAHoIiwSd+SY1FOjzMKPH/Wd9dS7a2Ff3tFVq8HFhthqxo3FjGvZ?=
 =?us-ascii?Q?hSCClCnRecfWEGyCXMCEhugfIS8PYRUPteKFVhgClJxD0Jur2e+yFbvF9mYi?=
 =?us-ascii?Q?Rw1HKPD/2Ki5cqwvuT/y5iJYWDQM7U1+g2g/fL50tcfw0Yl0Qfli0xpN9hh8?=
 =?us-ascii?Q?NN1xvlWNlUA/wAy+2ue5AmzK8ccpLwXLhodcibQX5keuME2IU3MlwoMcyIpj?=
 =?us-ascii?Q?sUJ02lmt3QDu3McgDv0Fl9x+1B3xYOdLyVullc6UBgKI/cpdh2FUDYOxc8OM?=
 =?us-ascii?Q?m0TPRrI90e5ssFixoUnKKhbTBK4VdxxzDdjSvMaS/ipxsky1mSWW88MgBiaJ?=
 =?us-ascii?Q?trl3pBoqPvlwff/kL6TMUgPkpyv7AirtPFufdXggwJ9UDaYPPr3fQ8beNTR3?=
 =?us-ascii?Q?9fQ/GWWW9GhsqgJRnqu6bCZKtTfj8Q9S/bbTp6lylc3YQh8Si0EnEg+QhA8X?=
 =?us-ascii?Q?H/+femF4kXrS24RatAff1C8yUf1PmMOq85Wj1j8DWxYVYe+m+Prq3zXTsbTL?=
 =?us-ascii?Q?lkXk5pnwSsUUq20SwwGdgzYTU8yY4WPFlopKzIKtHPNYt0m5rhi0INlsUv4l?=
 =?us-ascii?Q?yIqHYYTOu/tWbuc/UZIw8fEjagutz86xJWwNpFcFVfcfbZBdoCpLy++PTGtS?=
 =?us-ascii?Q?rJXPYAIU5U9pIJJNCyY6Y0+oxXRgsk3fUkjrZLIW3UJPPu7QhZCgEG5BePhV?=
 =?us-ascii?Q?HHX+zwzSoDB16ma+NXjcQo2wwJVsTpdnALv/nhHRquP6aY0r5OuUWpvDhVAn?=
 =?us-ascii?Q?0ZBm3wr2V6/kfrdjh8d41uye4wxVuYxL6tt7hPZ/lwWeSxnkwN3TsULepi/E?=
 =?us-ascii?Q?rWCoP5B5fIEefdndW8kFsf33DTz98y24rESHWWuc8XXYTf5QVb1tnmtMHGG7?=
 =?us-ascii?Q?hIkwT55OiCtqxQdlG9iMpvdkS/JD1/+5MN7GXF6g9imPwJdfIeYMO7cXg8pn?=
 =?us-ascii?Q?ZzaOiknPueRo5kYbdgqc1tulszFzBHCvtgkhDJ2sth8q0YS8EiC9c/e2PMnL?=
 =?us-ascii?Q?psiHXg8/lMd1N7JevE86VCF+AeMx7mjwj8IsRlCr4Me9x2Sd+zKpccfIlIND?=
 =?us-ascii?Q?Ege5NDK+15Zj8k1sGFe0Hp1nT4p4W81jMZogvsZBVjyeiIxFnYiigD1/JOF2?=
 =?us-ascii?Q?vGPXeGuaSHUWOe/WtVqPAj/smpkFnel34EY52fl8xhlHhBKLJhX+?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: eaff7ca9-9541-49b8-503b-08de599320d8
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:49:17.9861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Kz7T3QV72p5KpcOaqtijPt+QLOqN/OWiEmZww3N5cyAhON/ZWnw9Ouxyi/8LZaLHfANJFagitQFyin4FihU/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6581
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27265-lists,linux-renesas-soc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[valinux.co.jp,none];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,valinux.co.jp:email,valinux.co.jp:dkim,valinux.co.jp:mid]
X-Rspamd-Queue-Id: 7758D639AA
X-Rspamd-Action: no action

Introduce a new EPC feature bit (dynamic_inbound_mapping) that indicates
whether an Endpoint Controller can update the inbound address
translation for a BAR without requiring the EPF driver to clear/reset
the BAR first.

Endpoint Function drivers (e.g. vNTB) can use this information to decide
whether it really is safe to call pci_epc_set_bar() multiple times to
update inbound mappings for the BAR.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 include/linux/pci-epc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 4286bfdbfdfa..4c8516756c56 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -223,6 +223,10 @@ struct pci_epc_bar_desc {
 /**
  * struct pci_epc_features - features supported by a EPC device per function
  * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
+ * @dynamic_inbound_mapping: indicate if the EPC device supports updating
+ *                           inbound mappings for an already configured BAR
+ *                           (i.e. allow calling pci_epc_set_bar() again
+ *                           without first calling pci_epc_clear_bar())
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
@@ -231,6 +235,7 @@ struct pci_epc_bar_desc {
  */
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
+	unsigned int	dynamic_inbound_mapping : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	unsigned int	intx_capable : 1;
-- 
2.51.0


