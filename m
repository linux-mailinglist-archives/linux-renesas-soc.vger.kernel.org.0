Return-Path: <linux-renesas-soc+bounces-29541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iG8YMYQEuWmEnAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:36:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F89B2A4E6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36A6A303B940
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 07:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C1839150B;
	Tue, 17 Mar 2026 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XR0FcuhR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F3037C921;
	Tue, 17 Mar 2026 07:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732992; cv=fail; b=d99g7RFbyCLmT2KQLsGKqVunheBQDPTXTBcyNXu4eoxmShN/Dte2iXyVplblAAb1ympgRA0/Q375+VuZrN+y2hErQwzV0wRkuEaw6sVYxrmAtYw0YH7PVgXctCVXp4aiPOWUDOZlBKPG8GWpP5vV4mICsjZyrG/ddeYBI5sUilQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732992; c=relaxed/simple;
	bh=7HYAExPsXAHiLWa6FM4cRayQcK2aAAtd78KEy6TzPMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T6F7agI0c//Q9REjbMpxK9ZMy/85qcGqNR5VPDuQmJZGBsoPG4mer0tFe3+wgOppVMPf7yd3Hkc0aKbgvlDGHFn/Qq+fgZG7y1m2NkjKCuUx628WBfRyNtjKBkeeFQjhQw+RWOjwnKvTfg8dpreeeq8cNESSmxyNQUCiWIAHzWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XR0FcuhR; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVOlhkfNUihuUw9+bMt4CLDy/GZ73KeWYrKKKJHyhLCr62Zsfq2iXc/6NrFueUuzoXw310tQ6eGh3h0GYM8seqFFA6YRjoabTRf6mR3r++XOvfVLIe/XYGqGP5LRt4FoQoI9x3HVk65eiKgeW2AzDRd8AXXybmiLneZFQ/NaZk0EatmLaow9Za2zqUTzRANyX1uktY629a0iB7lJs/yYxsro6xTwIIdNkJizZbuoroC6OZfA1fMhMdDikmX41044IrtTAHAToHF+eufOeQTmRAUVrnMhO/596JSH2NTc+EZNw5NrwqHn+IZNQbxsgcbtAHA95lA1tY2H1A59LmhaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HYAExPsXAHiLWa6FM4cRayQcK2aAAtd78KEy6TzPMo=;
 b=c6x1WUlgPfAWzKW44UbvDIDEV4TQQBdaQYWGX9kYzQSkON93JQUAeHoKroaiH6wO8Jen9mWj1bA2O+1wfst2YCYcgQ/wpNWf/Dop1TZPskTnGqmwcuIGjmWLXgrhvQjhMFesMHXtMu4cylH2rx9GC8ZhMwfmUNvlhyiVYe5szYX5NAc5IgApmenip5TM5fkXbh4kDekHOnJzLBXbbsJ7tmM7POQpSqpiT+U+PgB/w3pvj8JYU4btZifx3jXnhfVrttfutKp9hIy9GlP81UAPx/EIwLUnoz1aBx/nKlmfE7gYkIPpMzxCc5fTEH6dwqDLAjXKMgDU3mIsODi493OlNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HYAExPsXAHiLWa6FM4cRayQcK2aAAtd78KEy6TzPMo=;
 b=XR0FcuhRErOCabQCdxywRk5S1YsLYkAZbbSnc7E/seReu0N7KC1roD4wa0Sm/hX6ojyY7dctp24c6aKIOpNY9Gn4CX9ZkT3SW4dfdCJO7jtkuvtTN2TWYasmjOi1XZer4s51K1f9wstMgyv5XxVpiZQjIfRDQc6O6Q0wXvXhHxgDfEGk2ofb/z1Fn4nK/RGfj/J7HqEkO/mTqjSOKXyj0mvDQ7L7SSnplpn2SN5DNBa5P4aGZ3JkJpTua9M5vUeKxTNP7g5XmT4GQ3bAUz4DXUne+Yzh5OuB0+n4NdAViFXhPt9DIw4SrcCpV9ui6BnJUCiaRXG0KRJa+YLMrVZEJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AS5PR04MB11371.eurprd04.prod.outlook.com (2603:10a6:20b:6c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Tue, 17 Mar
 2026 07:36:05 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 07:35:57 +0000
Date: Tue, 17 Mar 2026 15:38:34 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 04/13] firmware: arm_scmi: Simplify clock rates
 exposed interface
Message-ID: <abkE+jmDqVk5FV9t@shlinux89>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-5-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310184030.3669330-5-cristian.marussi@arm.com>
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AS5PR04MB11371:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f20b4a-43d5-41c3-f242-08de83f7d462
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|52116014|38350700014|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nMgeKQGaDNsZjh/9wPuYh7IazNyraWAcdf85J/i5rk9C7ZEi4bT4pUfVqzTZEs4axQk4jUrF4+L3t4GcmGNUhS2HNbtgVx0buA++tzYrMozT4RTOfLcKltM1gnnzfcGnyPPt2pb5K9QO3d0FJgfh4/PIKMLcBxHS2qG7Kw0FwW5213SzvLvwI+syYiy705iHquUBHHes0jLPy5y/zNDe9PIAelshe2hxXc6Cx3gZISejmVpMSB4gOMGg88QA1yvBARCdN79BLn6GTNTtZ0c5Kg50rK8gDiYzSTb6LvkWZ6sS6mimrFM7UMrfErRmOB+lx4W97g2F3MM8l/p0/3AC4g72BuNQQdePdqsg8fRZVlqM2uoXcb2LxCk0Y+eq5K4BisBVVPYqfI9WePb/1lhc7uIQfTvaOuiLuu27yfw6a2WISv9rRE+A6pdeQRA6CBP9lg4lm9HPNFdFG2eqPNs1VFFCLfYf9hpb8zmhqIkbOyH9FVCYrIJKEvboC37wy2X7HcKSBNeXC6MB81tAdnTpQYBH8TrzFGGBwjSviim9QiXHR0vYYl3ahwtQxdG+vTL4iCLY373jE/Ltf6s7oClSw9ZrZCLwH8EhyC7Qnd0+Xtqjh4/wFxDJYj3AbcfuzlQnsbc3QLbIny2w2P126tCwsEP8vEdJgMzuJlRgXUbViPne3U567txccJnoOSAIHpHLd6egNjen02JKu+la9F2GtMg1/B9HXOvabJ6WAUxk2najbHC5JVUGkPwakaOw5Cp7gQFYIqjIO0aeCDmIIQenIqLZm4Rj2Rb8rjjJnTYurUU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rEDfqWbfilVPJ50VbQndoZOtu3p2Ox478xQuBAscOvdFbOTMfTBnpJgYVVID?=
 =?us-ascii?Q?/LLkI3+/NCGfUE4pVzIM5Au8JdfhsAbt+TeJhU1+EFGvbYZfOpKZ9UBchPvT?=
 =?us-ascii?Q?VexbTs6BS6yqippsXPd7pOv5E6AA5OmC0Z3gru13nN1AEGjU/Xo4zkZZUhlf?=
 =?us-ascii?Q?PT/VLT+Yb5fSn5PQDLKEL/EnXfmd1RoDP31OvsOIcLjuTOwCG8GkUmZMTP+Y?=
 =?us-ascii?Q?eSih4sITnLQ5Btqtdb43iPgQ+LHNPgEqBbDFjEVBLsfogNiQxzmWuOpZ1Yfk?=
 =?us-ascii?Q?8dJ6r7jdQhcwVXLFKwfGlkCHCbKL6Gb1viqUfvL0vgmdxfxrWPnyV+BeqGsD?=
 =?us-ascii?Q?BkOyIPU8LSCs9dbFzuyRRpb8G6WgQc0NckBzFMdHi3TY8uFphyU7DUVIsUJ9?=
 =?us-ascii?Q?JZJgLmL2N/44d4s7QBnC+Jzl0NFO2kXAA/QxsQlP68Q0cWuM0BX9Gm3HG9Au?=
 =?us-ascii?Q?kItu/JC33wvl2DzRebcKaU54Skgsgii80Cu95gLpgyMmwwHCY7es31/jkmh+?=
 =?us-ascii?Q?9KhFYNtw1syzzXcbEKrFUYK2BTcrA9ygMJp6BH5K95fan+69jsiWCcCHKVje?=
 =?us-ascii?Q?EtFQa0Hxxgml05mKgL81ta/W4QD5JKadk3cXwy0cKhmX/iTgfOiZnQJyIOM3?=
 =?us-ascii?Q?ZheeZKE/wOFTYO69RZ9Ni9sp1S6auZSdyhrEDvD+N+bMUSs38SjNv16l/cBg?=
 =?us-ascii?Q?IPbjaoBjOr7sPhRjgfc+5F84M+K9PowYZ0VPznj1HPs7aXjHpwqElKjFdsIR?=
 =?us-ascii?Q?vV/1UyRX8EE9r9sPOwKudKWf7Qa8My6tt9kmpRnYNLGS5YGTbZyHogYlLMYs?=
 =?us-ascii?Q?dqTln/xOkjDQHeRjwu50ZOodkmdmLnre7HT9Hue3nmExqKO7ppAC411IkhNd?=
 =?us-ascii?Q?4w9p8JlJEcA8Vsi2JKbD/7tMq6Fgjzr6+Y1ylSTgnBiB/ITSVc2FgOv0/NxK?=
 =?us-ascii?Q?530RCm0+ahm2MYXiXNB7773pNQGvlxXLa++fcUlzc2gx9xWwMw0O7ShGQRjn?=
 =?us-ascii?Q?qoDsuWZrmfTT/ZZwWEHYsYp5ox6ztd0KHlf/+AAtDN+I1j/JV1okNrifvgpa?=
 =?us-ascii?Q?xqD/HnIGZwXNp8eWbPSPzAIaqjnWl6PSpLdxJkwMWeCJhzfwGl2+k8vGsQ9A?=
 =?us-ascii?Q?mwbk/NND0ZzIx1ptWn6nN6EMw9FyEHNhjFZVdP+brGXZaCsk31+IverWo2/N?=
 =?us-ascii?Q?WHYfm4+XJ4G6j4flEiBLhn0JFDt2sTb9GvqNtDshkn61UqZsMe41lWG5kNMt?=
 =?us-ascii?Q?SKwgD0BidGBOSbxTWr5DsOQh+2his7hW5VfCW2EU7Gg+jzJiPUFqED+7NBTY?=
 =?us-ascii?Q?j7qv4B1HcimppJjD+QZW8OLCbn+uYbQsvj4/XEoesvGDUFBKyLUoEqHOKtNV?=
 =?us-ascii?Q?YWdgdckbqB0ykUlmcESLfv47+GblkBCh3E5gMlGDQ7kezyPdFGJM9Ty6/w93?=
 =?us-ascii?Q?HChcS4Qle0a1DehdNdPNGj7K8Yv2aWwqOG+LJh2krRu4ScThbrN/Q8ykfRpC?=
 =?us-ascii?Q?vgs018Ci0DNou9kNUSLvd9wCVvc0Ce9HW5W3z8HqXMStozfLOiOpwJUk4Tar?=
 =?us-ascii?Q?0aBvXqDNhtu5kdyXl5vh6gRysND09Gg5AeCh6b3yYV6Mgp+KvJMNN3OCbjX3?=
 =?us-ascii?Q?mODbQxlkjqf+V6R/ccinsiC/UUd4LKL3wXRblUxT3QnZfJtBucTe/TOJzarV?=
 =?us-ascii?Q?UgAk/HTcM9PRjnoWmkTSI1T59Hw+8OOv7OMneLTKUcIZb99Lj9NKWwmDiGT+?=
 =?us-ascii?Q?22Wm7rWb0Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f20b4a-43d5-41c3-f242-08de83f7d462
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:35:57.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HW+vuLhc3KgmhHqCcONXBC+9JridVmqSdQF7B8r4tKv9BRv0gBt7wAukpeLcLpfS8i1bUSrpwJMv2OyatLQIjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11371
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29541-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 3F89B2A4E6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 06:40:21PM +0000, Cristian Marussi wrote:
>Introduce a new internal struct scmi_clock_desc so as to be able to hide,
>in the future, some of the needlessly public fields currently kept inside
>scmi_clock_info, while keeping exposed only the two new min_rate and
>max_rate fields for each clock.
>
>No functional change.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

