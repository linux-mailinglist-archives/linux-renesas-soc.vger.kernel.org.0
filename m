Return-Path: <linux-renesas-soc+bounces-32199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM1gCa9e/Gm7OwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:43:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 980A64E6307
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DD8030053AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699273822AC;
	Thu,  7 May 2026 09:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NUJSumbU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD643254A2;
	Thu,  7 May 2026 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145799; cv=fail; b=fYT8TwMCBqxKqQ5+dSTKkMyggF6ZInuoJIcVyr14Ii74lDhRTziFtN+FtQ/hKw/+jOAeOAT5BzFJF9gbHGhW5bBbZ0e2X6pXUfm18NIS2x2ePTHYGdPV1JHGbAuLocYQ3/5w4dRpPvbc2SqTjUZrlKZ+JWK3xH54tQJgU796oQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145799; c=relaxed/simple;
	bh=1ah+vHqQzbQ6vOUIQ9Ksu+HMY1kdXPAqvZW84H9xSIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hIXRsZtsEbjuBSGpYkke0LTl3ersZgTiVYM2fPO2FzJ2w9FNodldYzxTIaOveCnoeGSf0chaN5V5hdqwGB7sH7KjGnRrvSW8U4PzBH/3nPLx4+YvfH9gV4MKhaqwfTzJviSb7H8I7ovPk7OrzQqY0LhlN9B9uWGeDTMnNeYUq1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NUJSumbU; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYC4ovoOPW5a0fze17oFVp8lG8c2dYS2Bni5+MfXgXxxrwZiHkFm+9KgI/TvTYrEOEGforsHMaU44rFs93QGot6swrmRMFbi2oCWhkFKg0GnGY2CSaMY0akthPCeHnA5TbivvZwo+44aAHUMZwI3A1HFWdW2ovts8bRjhnGFUDoZ+Z7RmBe1CpbGqeCXV1dkwTnT5DTIbVU1h+ZtIm8Cm92arnvSjCluZ7TuGCPjDvPc2Gd6TgnQ9HY0sQMBknCHU6irsMex/q1FZBk7BjEQqMc6F1t3CRLwUsdROtSVnoiwTvlrrlis4KB5dXVVGVV6udFULLxixwGGoFd4ynIaog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgSMLeli4m8cAfiS4dWXeGbCOy1IR4iXtNm2HfLHYYM=;
 b=kvON9ukFG9KZRijBsYl2pyqKm3M5BJZ08igpH5JViBFgvJaKN5cqvhKpH7pA1TzTU3Gzj5Y6tGWjBx01tBtAXQADE9WhE8W9v1syeTpCxNv15cfHBXLC43sOBy+PcZ3fGRusGPMKAS+YIsjFN8ikYQBRLnTSMlDDzRmC+wiXdOycpQoaJFfqPloXxp9mFLh34WTgyb8Ci0jqro4SHGhaKlSODPBXBanIz7XKkuM5Zrza0VQ0B74pbQJnvY/IGGQGdtzwe/16vjT1MlfpSkTxehLBJPaK/jljA6dWHNSb5A3QYuyFbgjVHt9BfuesCa8wR6AsFz398CERr2tZbFyaaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgSMLeli4m8cAfiS4dWXeGbCOy1IR4iXtNm2HfLHYYM=;
 b=NUJSumbU5ZUFVAqQFvUdqzPwxbqNsrUZtXEaXpPJGDCmhXgSGqC2ufoeV2xoEgcgO14aRzyHzW2uS3/XJ0iRIDX18rjE6ziufPiqJ2kIr5ncC8t1BijinDsZdRPqnzcjhoyqnmlok9JVOrnCDTn+l4KLkX4kTpWQDAvC5CC9CCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB16094.jpnprd01.prod.outlook.com (2603:1096:405:2e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:23:15 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:23:15 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 08/13] drm: renesas: rz-du: Add endpoint-based output routing
Date: Thu,  7 May 2026 11:21:36 +0200
Message-ID: <1fc6fbe8500d5f375634793fb1df6dbba7e33de4.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB16094:EE_
X-MS-Office365-Filtering-Correlation-Id: 395c6173-27ef-41ab-89a9-08deac1a4433
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
 4atROzV6gT1vSAKyXDyJDQrK8eXa6LmlJJrxMnl27+XqlwGqJ1lutSiuFGTuXSc3iRBu4PzeCjt/fu4kdl3KjUWKP+/VOl/q7uBw/KCPCeaTFavQrFsMnvfqjSJ+21FC5ucZgEzfhFvhVNMty9zy4+CWhv1QCPNjom4LXNfoa0j2jHpQULiWo6X/kKAtU2xBWIxHr8R5d8L/XpTF9PKkgq1zpYGoxNEI7pEqvcSGY1BdBAXx2WtZ4SDjSBmQ0r2tz8lXnH16Q/AQZci6Q6rYbE5l4Ny5jAtc87HUbOrUjwvPqvnk6pDxRXpaYzhQo+njCj/6U+Qqblnc/qnxRDhe8VKs/fcBq0wgomraoE0bYuMend8uTJj6wfTkVUwmOibfCKoWE3/uhIYUALHJZBkRZtUYCWJlpIX8S2pe643HlhAwW8ZYZvLq75zg7XiGgBQX8TZTHQKtVGY2/eNEcis3Sd9R7uTqvqd+ElL/1MCSuoK6Rr0l7HN9dT1e6mGYnQeLmQ6V9N/6sg2aTtaKj2AlPxa7pCDKR4PyfizHz+K3hZl28qWLuB/z7dBPJaFkQeyA3MTPVwzwlZ/a5uco2Xy7sachq/B+w3LbPwzHHYokVYINHs11HJpeT9WR6CcRdAdSU3+YSxJfXd+B15gHkEkyu28xBKtnh6BNgWRCfzwSIf0y6g20/yQ5GhiJ4VeDg+o9yDnHOOjrxo+N+I/d1MUHowOwPBgWQ2dAGTITtHJgrpiXI38EtHomz9Q9SGKJ9NQp
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?fSpTaeP7Ls/5l4bHIBUQuLhbNVasH/8HWtCsaPFDOaftMUvJuzugQFK3yweE?=
 =?us-ascii?Q?hFhZGo36Zc0kGQByGj9lDbvxFjrWc+laJy4+hID7m2nu9Lo95VEn5VvGSs44?=
 =?us-ascii?Q?SQr+s3VRlFHkLx2d8DP1D6NwQfKm5di7KPPTN91R0mUGB6YYEM/VM91wMhUy?=
 =?us-ascii?Q?3QL956tBLA4oceDLkaHyXKRBhSXx68pHq4MfOzfCdDQsMOpteqfm+TjYW7LI?=
 =?us-ascii?Q?FNzxqr7q8L/fOZUbqW4QAtnJVSK5jZX4sFS68OhjCR4m6kE/zLtjAvdkIFtx?=
 =?us-ascii?Q?QZbFAWKvi0asMQLbFOQMJLRCq/35BsLY5eGJoXA6et9xTV2J4q80JElz0CQy?=
 =?us-ascii?Q?18L8LqZF6lLpbBkhtHJ1hoFSnHou3Grb4AWsCJbNmQHo3v9jDOgMVlQqA944?=
 =?us-ascii?Q?hNzQ+7IgsMZUTzDwmn/6fmakqpJC7tLE6avcGAyLGKz6qaziUbiUo5jFTjye?=
 =?us-ascii?Q?C/Llt6VSYPZadW6wffU5ekkG7PUpfF/fDo59Tqe+8HX1loleZ8ETHVDCmH0D?=
 =?us-ascii?Q?XYGRfnWnptO0gCr0NyJ7YC79AMo2b53yJjFf1qPLdTfHET4/9Uc3zicqBKj/?=
 =?us-ascii?Q?CR0lk0/A/yjg3CNuJoqeHKbTToKTIcU1uFrExW6lQIgNDeIJgaSugs7lUI+H?=
 =?us-ascii?Q?Ol0q63qWo2EGbc2TaSsCE8lRElRITnmsFkkzNn2W/JeCMtm5NKeEYeBF89gG?=
 =?us-ascii?Q?jnSug+qcstSmiaYa7HiU89NyYkjc/1S1jfMIff+171qfLaAuYJhTQOcp/Ki+?=
 =?us-ascii?Q?7vlp8hBTH0nMkp0RxCnozri6qRYzTLT2fknYef9RQXfGtmOFVxDyGoDKuVQV?=
 =?us-ascii?Q?UwVGlNZW19ugrRSiT5OiTxSBH2IQoopnMzEVKCgviZvdNZy4zIOcP7/Q4TbY?=
 =?us-ascii?Q?ODo9ukC8RGmTxfjpBrSII5o67gdOeerqjhKARYkZZqemS/b6g9jCHhJ/j+Sj?=
 =?us-ascii?Q?Z3FbQ43DRVUIHlUKwikEEwptnhKPHYynyulpLq1rAlbs156PyQw9ThX+3ZtD?=
 =?us-ascii?Q?+4gC6/TnvyzKkg6EHHwDB4x+kX4LF7XCXTES3iwu3HFenuAXxTG+ZYMaWusI?=
 =?us-ascii?Q?YFK1qufwv1/jyoKEQ7ZZs5iH1MU/qe5jUqDdV6ujZKBv8vPmyemoGP6URQjB?=
 =?us-ascii?Q?XTttEKe+v9SytYMXPOKcf/Ryj30+XnTsLZjPG1HYGVO2MbF9X73YLKGCWZx5?=
 =?us-ascii?Q?X3ZwvrV/sVZf2z2hjU5xhzQqr1LFBU5mXU5USb4THGr45+rkAWIJYBqHknow?=
 =?us-ascii?Q?PDIQRPQqM+Cj2p4vT//0co0VV6m1GxXyqOcV6qgxwpBpuK4hJ76Xqi+/0YKm?=
 =?us-ascii?Q?uijg8J1247IMcUJXSrX00DbZb24ii5YsgrHi6YpAd4kqNhsVARNBIrm0pjuv?=
 =?us-ascii?Q?qBFzQZFyhVbHedo8peE4qcx9BTKZbI32iUhWwz0MKBBwI0OpmtFuGiUEJvUh?=
 =?us-ascii?Q?xgnxFP3LZRBs4l7SrrizU/Mp/g9pK1LFVHawg9DYd4jMye44QgSUElv/J+7e?=
 =?us-ascii?Q?txzBigpwB5LC6LvzEd3h6Px3AmONwt79nQlqsZY18BG7s8kDJzGShpk4EqjS?=
 =?us-ascii?Q?GdSF6LbFi6yvR4klTJSPtSqDFz+EdjJIKc8g7y0/yilc5Yz0R21moZIc10Km?=
 =?us-ascii?Q?7nSmBpeLrgLuwXF4p1tncAcpmGJj65i+WEZCJjXFAsYHvoO7wEX5vnhVdQXO?=
 =?us-ascii?Q?CbAL4lai5i/c6uoHq8CjW7ivNvuWeNqEAhg9aIVef71jokEXPWe+INBUxamW?=
 =?us-ascii?Q?A4tIunshfMYE9vXiMIr7EomdJ6P5GrD7SFr2cesXukC6waBN0YQk?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395c6173-27ef-41ab-89a9-08deac1a4433
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:23:15.0087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGDWiM01n5mxfToAMo8FmAc7AFlYt/HbeeuaaqdkIdN/L3ox+ZE1V4eQfLAie20VehDAOpAoYTlrkejgNAYAJ3cvoilGvjMCcOE6ERt0DffspO7eIvQXhno7p1ejBu9V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16094
X-Rspamd-Queue-Id: 980A64E6307
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[bp.renesas.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-32199-lists,linux-renesas-soc=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_SPAM(0.00)[0.958];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,0.0.0.1:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ep.id:url]
X-Rspamd-Action: add header
X-Spam: Yes

On RZ/G3E all outputs of a DU instance share a single port and are
distinguished by endpoint id, unlike the port-per-output layout on
RZ/G2L.

Auto-detect the routing mode by checking whether any port exposes more
than one endpoint (rzg2l_du_ep_routing()). Add an 'ep' field in a union
with 'port' in rzg2l_du_output_routing to cover both conventions, and
update rzg2l_du_encoders_init() to match routes by ep.id when endpoint
routing is detected. Track a linked_outputs bitmask to skip duplicate
encoder creation when the same output type appears under multiple
DU-channel ports.

No functional change for existing platforms.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - New patch.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h |  6 ++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 57 +++++++++++++++++---
 2 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index d0e59b787cd7..eed8e1215f08 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -32,6 +32,7 @@ enum rzg2l_du_output {
  * struct rzg2l_du_output_routing - Output routing specification
  * @possible_outputs: bitmask of possible outputs
  * @port: device tree port number corresponding to this output route
+ * @ep: device tree endpoint id corresponding to this output route
  *
  * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
  * specify the valid SoC outputs, which CRTC can drive the output, and the type
@@ -39,7 +40,10 @@ enum rzg2l_du_output {
  */
 struct rzg2l_du_output_routing {
 	unsigned int possible_outputs;
-	unsigned int port;
+	union {
+		unsigned int port;
+		unsigned int ep;
+	};
 };
 
 /*
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index fc5ce8c7eea0..01b037594926 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -266,15 +266,37 @@ static int rzg2l_du_encoders_init_one(struct rzg2l_du_device *rcdu,
 	return ret;
 }
 
+static bool rzg2l_du_ep_routing(const struct device_node *np)
+{
+	for_each_of_graph_port(np, port) {
+		unsigned int count = 0;
+
+		for_each_of_graph_port_endpoint(port, ep)
+			count++;
+
+		if (count > 1)
+			return true;
+	}
+	return false;
+}
+
 static int rzg2l_du_encoders_init(struct rzg2l_du_device *rcdu)
 {
 	struct device_node *np = rcdu->dev->of_node;
+	bool ep_routing = rzg2l_du_ep_routing(np);
+	unsigned int linked_outputs = 0;
 	struct device_node *ep_node;
 	unsigned int num_encoders = 0;
 
 	/*
 	 * Iterate over the endpoints and create one encoder for each output
 	 * pipeline.
+	 *
+	 * Two routing modes are supported:
+	 * - Port-based (default): each output lives on its own port, routes
+	 *   are matched by ep.port.
+	 * - Endpoint-based: all outputs share a single port, each output lives
+	 *   on its own endpoint, routes are matched by ep.id.
 	 */
 	for_each_endpoint_of_node(np, ep_node) {
 		enum rzg2l_du_output output;
@@ -288,19 +310,39 @@ static int rzg2l_du_encoders_init(struct rzg2l_du_device *rcdu)
 			return ret;
 		}
 
-		/* Find the output route corresponding to the port number. */
+		/* Find the output route corresponding to the port/endpoint. */
 		for (i = 0; i < RZG2L_DU_OUTPUT_MAX; ++i) {
-			if (rcdu->info->routes[i].possible_outputs &&
-			    rcdu->info->routes[i].port == ep.port) {
-				output = i;
+			const struct rzg2l_du_output_routing *route =
+				&rcdu->info->routes[i];
+
+			if (!route->possible_outputs)
+				continue;
+
+			if (ep_routing ? route->ep == ep.id :
+			    route->port == ep.port)
 				break;
-			}
 		}
 
 		if (i == RZG2L_DU_OUTPUT_MAX) {
 			dev_warn(rcdu->dev,
-				 "port %u references unexisting output, skipping\n",
-				 ep.port);
+				 "port %u endpoint %u references unexisting output, skipping\n",
+				 ep.port, ep.id);
+			continue;
+		}
+
+		output = i;
+
+		/*
+		 * With endpoint-based routing the same output type can appear
+		 * under multiple DU-channel ports (e.g. DSI on both port@0 and
+		 * port@1). Only create one encoder per output the encoder's
+		 * possible_crtcs mask already covers all channels that can
+		 * drive it.
+		 */
+		if (ep_routing && (linked_outputs & BIT(output))) {
+			dev_dbg(rcdu->dev,
+				"output %s already linked, skipping port %u endpoint %u\n",
+				rzg2l_du_output_name(output), ep.port, ep.id);
 			continue;
 		}
 
@@ -315,6 +357,7 @@ static int rzg2l_du_encoders_init(struct rzg2l_du_device *rcdu)
 			continue;
 		}
 
+		linked_outputs |= BIT(output);
 		num_encoders++;
 	}
 
-- 
2.54.0


