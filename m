Return-Path: <linux-renesas-soc+bounces-28469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN0cIhpbn2lRagQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 21:27:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD5419D30B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 21:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D251F300E5DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 20:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8CA30C361;
	Wed, 25 Feb 2026 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F+R7wxAD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013011.outbound.protection.outlook.com [40.107.162.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685122DA775;
	Wed, 25 Feb 2026 20:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051224; cv=fail; b=aM44q5pcMR3vOG7Ij/CDEHF6bXLpkyC6IeZwEOzSE+0MVkwymGNErKUGtEiDp/FAwm8yynd841fJhd56JKnFPF1MoqBnaRUJ3j1qN02F6vYzRnZyA73L6kAURWWKt3z5ubgVHA2Eq2s9NtpR7LIF1FH8a291CJmkqlnLqV8ytNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051224; c=relaxed/simple;
	bh=mSVcdU6zCZaKta92R/CYaC9bvoT/RzVzyUnCzR/MCcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jvVGY3Or1gway9iR0PWBhWWywXdqHi2lbrzRTDoWQsolC3k6Q9M1/IePho/WGqfGU0J8D5hxhFWoLBr02jJolUMq5CeyXX4vATgQab39dzpoz06xlLnhWvdYaTJ/cOFRC8PecezIhPVNh4Wkbkml4bdpyHx+gc5DBYWqH4GAghk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F+R7wxAD; arc=fail smtp.client-ip=40.107.162.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAY+GF1y60rTxWdwqOa0VxZpg2gd6WhtPsMFhzdL1OzpajeUY45gj7xA6VSl1zLj/tPmx4U2JzOPtrq2Cbwb5K96ggjKwCXJTYpf/pc6cB4rxx097TXfolYndsgcNKuu/xTFeFjMY6VI8Ny28dINK7/SdIgLzEeweSdKrb23wDitpaUcsaXdUwsh0YatbX0OtsJpLkYQgSI4OQ1Kk4XOLuA/lfpKRT4uagf1MhfHs0wZsbvhpksDnR+Aw/5X+DCgD+Tppogiw7e09ZABlwa4t15ecInhh8zXMn0kGwBWNjoXXAgGU9ll6M068mDulU1emgupbQtbdif0yvi5r7Nx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmWDQ8t0KR1xTsteB4oI/73cR1VaAxkeYefXR/F2ApA=;
 b=O9aBsMzSFOwCLk0kRpN5I2RtVhvhyTjZQ0OssXrn8ce3/ceR2td/m8ASCN+vn0VfViYLxOomg0spcI3vWT4UgES5i6s2bQxgMjBvE1E5pI3qe8SlMNhVur+V7KPCMDzik3xii3T9WaDRPQK/+uF1TRQKVIIio/8x+pHcpvgboVy/RrDvHuuCgcqkLrRmOfDlAClEYjT9fvrQii3EsfdXIMYVy/loDOmVzBM8ylNGOeb37RF3KLgeGfLMASk+klpMIbnJtmekVM6bOKJKmQqH8Lt7o48zfXwHR4ueI1GOHmeU+03RvTX+aAe8xJ8gh+dF8gvzWqoTh7f5h/eLiDy5DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmWDQ8t0KR1xTsteB4oI/73cR1VaAxkeYefXR/F2ApA=;
 b=F+R7wxADX9c+DQMadJpwessnsPfdKi+BNp3QctQZOU3sTTbFb4zhs6HfkFPPaVmTmqk0vQ82pknbrcSEpgiDvxWPnB3OxfM2mQRe7k8f0qVoXmO8gS30M6telbpa2MN/QuRGTeqVtn99YuYWWi6M69oYAXMUsU4ufHVumOQgBRKWWDHdkD+axt5Wt8pm8gm6GdXus2Uh1sriMfX/kYh+KDfC0lGTnsqCg3Y3t5Wl69gt2c+LIGH+xp8IRcMJdbUOe4cbFgQU9TvWrvwLKsvMNP5DF1ON2JF9GWidn2XyZgRinLkWtbxTbW2gvJEHecFOG1RJPtGob7e2rsQn3kW9kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB7172.eurprd04.prod.outlook.com (2603:10a6:208:192::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 20:26:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 20:26:59 +0000
Date: Wed, 25 Feb 2026 15:26:47 -0500
From: Frank Li <Frank.li@nxp.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 5/9] PCI: dwc: Replace certain BAR_RESERVED with
 BAR_DISABLED in glue drivers
Message-ID: <aZ9bB8IvnBmcbe75@lizhi-Precision-Tower-5810>
References: <20260225170324.4033466-11-cassel@kernel.org>
 <20260225170324.4033466-16-cassel@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225170324.4033466-16-cassel@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c31a26-5a70-46c4-8926-08de74ac3a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	SY6V/vsYR+d5Q94bP+b0raadgvJDkrCgtKM5vFWuf7V3VJZYIreHuQyjcNpslD5NDigX50bvQbB622V1avxArFL0UpCMUwjj+EI8RzU+HFq1WlOTIy0GHmd6lBXgddl6JTYsuu1ARsh8d4p3sa6Gsp3vWc1ht6GvU7c95Cw1dFMXQcS1wrb0uPpenTc3H8Ide3JA0wthl7UY2B0ydCGNSpB8WortT4aoO5zq+v1LNh6FDV/9ofwmrmVYmmpy4WqY/pofuLkXjEyNN/gzeUXvZG5qwNvVFH3jqpNtyLIo95a2OCiiHp7JxA2CdM74dHY7/AvJLpTsD5sqNH8a7jWN5ZKY77dxc2d88QLOx8Dbrt5Crbkdh/XYc5qhx8QwDh3v9Bfq7nnwDzkL+6SfNxQg+kF5s/nch4acQhZUS29F3QeF7BZY2rZeLY7xckIpmPJEY9pAfp6opcBAIvkoY41CBXDZWs6n+WR4jFBqg5YvHGm33EqNobWNcWn9DlySnX1wrnoWXwHH88McsS0IRRJ5dpVtzxBfsuUmRemnVAFI0uf+gs/DQpp7rNSdj12swglnDFaPjTmYYq3ClusLbPY60IEQ1/5KNnMhIYtFElUbr8leVpSsvjAeDiC5lundel4tbJmgGXMclTP1CtpDzkA1H6bEVMTmyq8FVkEY2Zf3caHeKtwl6OyuuflKgIP4QmeCrDX/35XnafFVHIZFTb7pB/SYaBKGm7iUudo3s5oAZ2IAVrV/q5V7WXRQg7x54Dciy6Klg2kdcZMYmkA2+NDtafgPkxo7PUkpHbQjt9PrfFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/8jOnGrpSxNR7laNmHlCR6HFzbKbA+vAqxRFbYWIRz3flZGKQkTC70IyG2JT?=
 =?us-ascii?Q?bsuB1OEVBjEV1ZWafs6KwE8ZBmF4XhcIVzoNdKzCtRH9c4yrs3YW//XBAWGu?=
 =?us-ascii?Q?HNyO0KQxGtv5dvP+h/DDhOFodQwrwzf9h1A7n5ZXXy71FB/RN7Ewb/95fs+X?=
 =?us-ascii?Q?GE7fGXX5nc3dkOJX1+qFzvasTQ1KbvrRy+GmnB1fpq48TfczsdNNeXz8T0ip?=
 =?us-ascii?Q?RPIHxb8iUNue68Rdk6GM9Bulhks8021/lorHW2GRbBL3ECDQskHRItDKnLO0?=
 =?us-ascii?Q?4s5E4fBV1MHL66o1ZAlyMQSIf36jJzrl8KE6KxnFUMj8GAOjBNxnDioGDNsz?=
 =?us-ascii?Q?9Z+AjbSnoXEkMcJxRpheP0RHyK0NZEWbfZV0yOr7JeUcQO/U4oMbYhlem7Pt?=
 =?us-ascii?Q?5FHJGRRYkakoNodjWvTD2ZZarFB0Y8AuipqtoaLguTH3gjHupWRfSqPPqtx3?=
 =?us-ascii?Q?6FxDXw0Dbp0fy3jjKxJphCZtvPQR8Yao2Qzb0sRhAX7JgnSktsaSGeycFRJz?=
 =?us-ascii?Q?700cFF/Mi6PvHTFqNnWA9oSSoc30WJsD1p3vEESYKoc6YCncEBkpy0qritZ8?=
 =?us-ascii?Q?WxdkcWHH+N3uFSH9lJfud5Mn50V4R2CP+YvOwZGi8JeWRE95XgICcRQPsQRp?=
 =?us-ascii?Q?nG6VamzU0YT3vPpAy36Jjxt7rovyLem0EXdm1bghk8MFYU11Zgr96EbN8esI?=
 =?us-ascii?Q?UGs1b2Twq4ABsOUCrJ+q7+GSPUQ0IlUD9M6vKk8AfWTFrVP0JcSXDmKFhwJo?=
 =?us-ascii?Q?rzsT7EMwfCByp+CfnBQxEDQQB/bKwo2S4tEv5RPkSPKCjam4+E1q3nx6teko?=
 =?us-ascii?Q?JGvbacvU9lmjIfAAE19yOv/0AJZqNOMFM8DL0EGnkNrvfmHqC3s7Nz18mXsx?=
 =?us-ascii?Q?PytendAb7f0TXRxPn+jTlDXtEMKiCnO+O2XdNN2Xo3CAfoWVn8lYiihMQ1fV?=
 =?us-ascii?Q?b98xTjfrnLoCubiVhZ17QFaT8dQDLX9P3i9p0UaDAecICeM0Pf7poSCDbFPJ?=
 =?us-ascii?Q?/xvdTob6kvMFVuzZxGHNua8n+9XVN9r6kZXhrC5Mdbi+JJpJd4zjIObPzD3X?=
 =?us-ascii?Q?rigUWKm71zBWM7IyJ2z9JcRFb7XsZFc7a5rcNIFtSmHbZtlpO0jYixn2xUXs?=
 =?us-ascii?Q?wsr3Iq8Y3wxC31aBhf+4ie7rtqEy5u79RGQstLC7zrM7IiemPWj4NBH5tHzP?=
 =?us-ascii?Q?aknw1S8n/+i/awXag93RERfPQZHectmxnzdtW5R7NL134G3OBhDExpaimmRz?=
 =?us-ascii?Q?/orzOpLBG4I2U3Uer5p6VcHmtB8RRwnill9fHg7MTn9s3co+9DzAcWFDTdnp?=
 =?us-ascii?Q?mWwZiaXbaPkUbBkmG557S+KWVdh0BXY4/eDjvhRl6/Tb0ZMkEQ5zcI5W7t8p?=
 =?us-ascii?Q?tf1et/oEu4e7XcTObbvZqqL+WksdF6ki8L9Jv/RCJr15ACVjykRI9UgsSC9c?=
 =?us-ascii?Q?OjZvKjrDZXIQvCcnmkNMD8ZO+77if6TkVwIHmR3GGm+Md8PBw/NW+M2sYOtZ?=
 =?us-ascii?Q?p0/hm2PpgLXnLGkIeK0x7JcFD02VnVgOfNTnQ4viD8Jw1lWx3fl2rXIwZcaF?=
 =?us-ascii?Q?AgG18QxMtaQDOHZIcM+Qvl2NcNggGzkOiADuf+pkgNutuCu+Nvx3h9L5DPGG?=
 =?us-ascii?Q?zwXV4Rl9pGSCnat1VNyFMOQZ6z9w2SFquKE2e7LaeSevoQ3IcMAOumgqg+Wq?=
 =?us-ascii?Q?tX4uKEYJMjN4DHiWv4ddBKL8LogMJ3DI5QQkDQQ1FEbgJ8YR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c31a26-5a70-46c4-8926-08de74ac3a1d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:26:59.3915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnBXGN0dl1mK+hV31k5hm+u32Qj4CK0uer1iJ+u2SyzFj0O95rNHTrGsqbgzb8p7U1RcsK/FAc/YZrRuqT8vsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7172
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28469-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,kernel.org,google.com,gmail.com,renesas.com,glider.be,nvidia.com,socionext.com,valinux.co.jp,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1CD5419D30B
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:03:28PM +0100, Niklas Cassel wrote:
> Most DWC based EPC glue drivers that have BARs marked as BAR_RESERVED in
> epc_features also call dw_pcie_ep_reset_bar() for these reserved BARs in
> ep->ops->init(). (The only exception is pci-keystone.c.)
>
> An EPF driver will be able to get/enable BARs that have been disabled/reset
> using dw_pcie_ep_reset_bar(), except if the BAR is marked as BAR_RESERVED
> (see pci_epc_get_next_free_bar()).
>
> Thus, all EPC drivers that have BARs marked as BAR_RESERVED in epc_features
> and call dw_pcie_ep_reset_bar(), should really have these BARs marked as
> BAR_DISABLED. If dw_pcie_ep_reset_bar() is not called by the glue driver,
> the BARs are kept as BAR_RESERVED.
>
> No EPC drivers outside drivers/pci/controllers/dwc mark their BARs as
> BAR_RESERVED, so there is nothing to do in non-DWC based EPC drivers.
>
> Tested-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/pci/controller/dwc/pci-imx6.c         | 12 ++++++------
>  drivers/pci/controller/dwc/pci-keystone.c     | 12 ++++++++++++
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  6 +++---
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  8 ++++----
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c |  4 ++--
>  5 files changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index a5b8d0b71677..ec1e3557ca53 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1433,19 +1433,19 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  static const struct pci_epc_features imx8m_pcie_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
>  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = SZ_256, },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_64K,
>  };
>
>  static const struct pci_epc_features imx8q_pcie_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_64K,
>  };
>
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 20fa4dadb82a..278d2dba1db0 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -933,6 +933,18 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
>  	.msix_capable = true,
> +	/*
> +	 * TODO: This driver is the only DWC glue driver that had BAR_RESERVED
> +	 * BARs, but did not call dw_pcie_ep_reset_bar() for the reserved BARs.
> +	 *
> +	 * To not change the existing behavior, these BARs were not migrated to
> +	 * BAR_DISABLED. If this driver wants the BAR_RESERVED BARs to be
> +	 * disabled, it should migrate them to BAR_DISABLED.
> +	 *
> +	 * If they actually should be enabled, then the driver must also define
> +	 * what is behind these reserved BARs, see the definition of struct
> +	 * pci_epc_bar_rsvd_region.
> +	 */
>  	.bar[BAR_0] = { .type = BAR_RESERVED, },
>  	.bar[BAR_1] = { .type = BAR_RESERVED, },
>  	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index a6912e85e4dd..9dd05bac22b9 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -422,10 +422,10 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
>  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_1M,
>  };
>
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 31aa9a494dbc..9f9453e8cd23 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1994,10 +1994,10 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
>  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
>  			.only_64bit = true, },
>  	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
> -	.bar[BAR_2] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> -	.bar[BAR_4] = { .type = BAR_RESERVED, },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_2] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
> +	.bar[BAR_4] = { .type = BAR_DISABLED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_64K,
>  };
>
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index f873a1659592..5bde3ee682b5 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -429,8 +429,8 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
>  		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  		.bar[BAR_2] = { .only_64bit = true, },
>  		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
> -		.bar[BAR_4] = { .type = BAR_RESERVED, },
> -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> +		.bar[BAR_4] = { .type = BAR_DISABLED, },
> +		.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	},
>  };
>
> --
> 2.53.0
>

