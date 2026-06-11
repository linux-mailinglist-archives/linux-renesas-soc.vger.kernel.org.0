Return-Path: <linux-renesas-soc+bounces-33874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dvYMKDKuKmqLuwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 14:46:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBBC672001
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 14:46:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="G0/oiEx2";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C239E3018A29
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 12:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A943F8252;
	Thu, 11 Jun 2026 12:43:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF50F3B774B;
	Thu, 11 Jun 2026 12:43:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181800; cv=fail; b=GtvPiNf0iqBq15FIBKAsLcGVTj9LglJLumLrDH5D1vQq8sMYUItZMMSyYilXF9BF44nCOjIOm9ZOKMkOYfmnsYkhY9LjPsFEhAlnMRwAh/EgKiphfZ2BkHkNM7OY0OBD57X07RM+bAsUAgUXNIFb4uxn6fKJUzfZ4/uBHc2V8yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181800; c=relaxed/simple;
	bh=65QkPSEi+CGYg3bvmL9MifV8PyXrB4cdY9ExZnRRuG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s+uYM6Rilo9EGvrp+JkCbXDp0I5uK/lc0269HSJ7/oXa35t1SqcBdbkXgge8Mdul5NkD1EoBVbv1zEhzmCEx+tDpAapRciEDXUq4bbEolafCK6wEYclYEQ2yG+ZBs5rt+Z0oUYp9bWWSaaWHXBu999jG/99dbqQwwZkZtgBbP7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=G0/oiEx2; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwBh/pB6t4ruTf2ceZrjBlRkKSpGq/Zw4bjs4EGM1mEAytoVQ5lsiIXDmHthp1ix4VDWe4GL3u+aPClbKM1mKLW28+Z4fcRHv2gsJkmBy0y22IDSPqu5Zy4s2jxfZASLEiDITjM5C9MPyED6UTGNWx0+X7RBVMjixsZA2YbzsXcQX09YD4ShkyEIGRkUah7yHde3Iu0/JohvjRW9YtFTQ7KJn8RHkKp2S0UIPMj6fQjqhyoMG/hAnJaTYcxDYsbUGXzsj214YC34NmJ5rDBTo1/EwVJZGP/TPV9nOlUkHtH1wAFGRsxmTXTDPjrqdLa4GpC09H3qhOIPmXG/HkIqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5XJXkVNrDm17OfAlSFpeuC//UpaUBrCtDenLrkd/Yo=;
 b=X5uh7N6FgSQ4jAe/5dB0i8mTRQ6uSrMD2fBMFiKTi+gmfi5Oq6aCVKwJTFxIRfbl0apfnfTntwD/VRv+8ZBxpO7lBvhfIinusc2jyB9vVxV64q5UAnJgdf0f24SieZtfQTxnse7SaIcEphTA+1btly7VnmKt6MNZhd0R7hEKiOtf++6LK+fPxqzk1VTXa6DqFSDHORCIVcnNguZZElLW0Ayt610Y2/ezIWcoZyAe6QhZW1LUuK+mZ2fQxgR6Q0az6ZrRkixPDMVxbz3XqrUyQlYEtHST9EZq2Y6hFZuxmumfDfj3bcBuG1ERz1ntQKt8DAp+5ol2DbcHHj18nLD0lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5XJXkVNrDm17OfAlSFpeuC//UpaUBrCtDenLrkd/Yo=;
 b=G0/oiEx2mKrOQxCVUHv0FPcU6KqZjvmdZL7vVe72vdWEAcJFpt8mKx4HHVm4xoTVTkPrC/i5uQ4pJ2Ph79jO+eioy6Mwk7+VWBieXByTX6tDVm6kiKXkZ5gVVo7xQSM8KjYImZWqkG6OgJ2/elqTxUmXU8y/C8MFp57QBeKZfP0=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB15413.jpnprd01.prod.outlook.com (2603:1096:405:274::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 12:43:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 12:43:12 +0000
Date: Thu, 11 Jun 2026 14:42:49 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/13] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <aiqtSWTTa4ZIThrp@tom-desktop>
References: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
 <ff8e401a0667970a42a55420dcb071e34730a923.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
 <20260513222725.GA2069022-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513222725.GA2069022-robh@kernel.org>
X-ClientProxiedBy: FR4P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB15413:EE_
X-MS-Office365-Filtering-Correlation-Id: f324dddd-42de-49dd-5ddb-08dec7b6fffb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|23010399003|6133799003|13003099007|18002099003|22082099003|38350700014|3023799007|56012099006|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
 zZMaqHpmok8xASZsgS6mvs96tK55EmKzrmIb+OCY/lVZwFd/xHfPsu02F4XPJs3pvbhYpBdTfnWIIQ3gWx97Z/Ifw8J1DDM96ShNn9bNfgmzabS4ZW2ZmWpYuT74QF5WLuiVIuQlqrNWaL1DsEw+VyfETnUOjHtSGqCpUHz8GAzVbVQwYmdx1IbOucGz5nUhJl1Du3TfSo+F6dUJ9k+aHJe0kEgJvCdWbHTYAdiyy17hBUS4cVs2CmyBdXgkft1ZbVAWoXwC9uHZ7I2dM1B9fM2ScpOFGE5FromfdMd4k54gs4o8Xrh2yMVDCeL/R/Jx4vHbqp7hxIObAjMC/8XIV119HCFunJgyZjihBUNen16P1Ynw3M5aGGeywYxvhL4mxZKZ/5AXn2+WkbAgdvT/8jCNvh4afvLUqjAqpf0r9H6psy7IVQavKJsawwiLlNmZxCWg6lrvwX0HtZ1rYBZsVsbNWIK6rZmCIcUemyHCHV8P8oag5bwkPweL8mCHPhjX+0laaaVJ1/IEFvYuz9s2LPipefm0D2akbPmat2fAguwt96Y6UOzuHoopgPh9E0oFmj34nLG1MAWmRt5fvjTDgK2xSPDoHb4F+IbqcjmqZtxuPR8XmnMcgiz13qvVuXMv/wFwFtlD1c816O7ogRDeA3v4GvhULBJyvPYn8mDESYcUelVtTaXbE2CCnLym/YQQRQ1bF11mTTd8g18ofOnk/Hs2mtqJdsLuF5536qVbCpi+hwqfKfya5i/giY7Bh/DV
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(23010399003)(6133799003)(13003099007)(18002099003)(22082099003)(38350700014)(3023799007)(56012099006)(4143699003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gF+o49d/2OueZIMJLplMp2lJ+X58wWRtCMVMS0Ehwj4kQXEutuLiF9KEDuxk?=
 =?us-ascii?Q?QrXDA04ChQLHcV4iAFqE5YWG17mZiwFCpk56y9xYfknydQ7d093hIiG6zMHu?=
 =?us-ascii?Q?G199LXxZANUhcAOc8z+AvCpiS+zQHTt/6sJVOKgwenUSEJkzpWU5Rjyfl2jt?=
 =?us-ascii?Q?SgksC2qqZJcC05HIJKC5eHUdP2vOxNCKMKnIgxNPivPopeuUop+tP54wZuKF?=
 =?us-ascii?Q?znMMddeJO025jLUCOoV1EUUH7WBfdnW+Y78W0ovghPO06cnjUnZle8lL49tO?=
 =?us-ascii?Q?cU0cLsVzabg1X7KYxHL3WSZT+0ZAJbbmiKtfqQmLQRyOhxW+tG0ulrLLyQxp?=
 =?us-ascii?Q?9K7JAdGy+G+hCrqfsz+5dUXhnUg1auHS9PYDuMZ9LoSVTqaiaLoR/0AB54rg?=
 =?us-ascii?Q?2du94E3sjhhd9vGgnV9EIgvdF+kyLekalRCEymcgys6P7Ci7fUq9MKo+Qy9e?=
 =?us-ascii?Q?QEsLs89BYmwve+sBvdhb6dBJVmeMRZjF8qBWOFl8/Pzf1tC0kOkW+9adKCOr?=
 =?us-ascii?Q?t8v5TVWTOlWYnUTh+wmAJXhrMSbxiQsLFrNzmrSXerosybu5+VaDrIFUVIcI?=
 =?us-ascii?Q?ldPrfjzfcRB7CPpIP0Z+R/z6SqNCO6cbYrLmxg8u1NaQN/hCs8P419pCJSY6?=
 =?us-ascii?Q?6bqKqLRhGfrkEImB+uo1RhF+04pqQmwI3xGji6KY1HuH0ufgotgbz9FBUw0p?=
 =?us-ascii?Q?6w3QNhGt+Bfc7mQe+SFNq2PKljlUtBNjxvKO18i8cxkxjdcuJ79gb0fG5XMJ?=
 =?us-ascii?Q?G6nhRwPETbVdyvh4IHaGmi3Dup9LNrIyj9Rs6zse+CG4iWkxPQuzUupVtZx8?=
 =?us-ascii?Q?H5C2oOXkx3d3ewD86vhNs9llUOToUdVDH5+NnlG+JBYiFeqklb+VzeUoOBcU?=
 =?us-ascii?Q?3qg7rfqCrR70luSAoUGKsx4wXJ4aKstaHQvhXpnZapoRMIMNKW6qNYfeqmZX?=
 =?us-ascii?Q?WS4imTg5O5REak040sV/oVecSvgVfc0WnTDpOB049wQoPrkJAiVNKnNp8AHq?=
 =?us-ascii?Q?sbp9ztAKq4QJhz0AV3Gkw6xfR3X6h1wxhyMDiY114RwINDlrrqe31IPspg5N?=
 =?us-ascii?Q?j1hizoyLg8sLtd44dRPJDx4pvEOWlbffd2V2S9WElvl3TnUVntLP7WcVHjKF?=
 =?us-ascii?Q?99wJQ6uQ5dbeclthdm39m2BqDWOc0HjwCk7ulAdXkSZKcjkyEiRWlZhLU0/Z?=
 =?us-ascii?Q?+ORLQtz0w+gyZIOLn+DNeQYCn8istFka22/CKtCYeF9jtdpY2HrWyPGdlZpr?=
 =?us-ascii?Q?XxjCPFvhgINyfRNTiBP0KNsv8+I9tfx45ugUXbjD3dyt71Bspc+WW3hcmusY?=
 =?us-ascii?Q?bOL0+Pw+nkSpY7ScDaGWfGyflyTfAgma32lg1RgzUyyJuOPKkETE1h0FN/iy?=
 =?us-ascii?Q?QUtZ+5zucUNEHKeUI+HwrkUZBdFpSsU4heQSsNXsCS0su9bpzki81hGwQqOw?=
 =?us-ascii?Q?Tz51lOyPY0z6xT5iP0iUCVwNPNfbpxZiZrvivdZhgavj6Qw+jBlaOCEO8bwY?=
 =?us-ascii?Q?HYfMHu1DP+Edx7iqQYQ841IDZnxFbnBV/G32BWG5PQ7Uk2nmLf/t/Y56qjMm?=
 =?us-ascii?Q?b3iFl8zKv4cBtG3BJVAJ7Elg+gu9JGWsb+1QGTtpE3tFtdPhYjBO0CeEmSPu?=
 =?us-ascii?Q?tjIRBe1hZx5yfsYbKwAcfP0ZcSk6UvQK/xWAD1lG8DDfZgucNbWZpuFxTUl/?=
 =?us-ascii?Q?Ki3aB7WBW8mXcDrs4cJuRd+Co7WLFn5DGShkvO++WtRM4B8cZbtxsji7vkZc?=
 =?us-ascii?Q?BfR+OJeiT1KT+vyd0HzJWnAFuQ4zPwZ8Myqsvj9nABG4FYVZYo2Y?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f324dddd-42de-49dd-5ddb-08dec7b6fffb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 12:43:12.8311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLtpbgNufkH9OfADrndUFZNCdgVX6PZhfNXXGH0zCCE7QhLvt2R7GnKmdYRvNVKXD6DKwkMxJVo8fURtzvcAhC+kMoOGJf6hhulLuis7krE9X4MF0iXlLvUVM3Rtce7T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15413
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33874-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,ideasonboard.com,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EBBC672001

Hi Rob,
Thanks for your review.

On Wed, May 13, 2026 at 05:27:25PM -0500, Rob Herring wrote:
> On Thu, May 07, 2026 at 11:21:30AM +0200, Tommaso Merciai wrote:
> > The RZ/G3E SoC integrates two LCD controllers (LCDC0 and LCDC1), each
> > containing a FCPVD, VSPD, and Display Unit (DU).
> > 
> >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > 
> > Add compatible string 'renesas,r9a09g047-du' and extend the binding to
> > support two DU instances: add reg-names ('du0'/'du1'), extend reg,
> > interrupts, and resets to maxItems: 2, and extend clocks/clock-names to
> > six entries (aclk/pclk/vclk per instance, minItems: 3).
> 
> Don't write what the diff has. I can read the diff for that.

Ouch, thanks.

> 
> > 
> > Drop the "Each port shall have a single endpoint." constraint since
> > RZ/G3E ports expose multiple endpoints.
> > 
> > Add a RZ/G3E-specific allOf rule mapping two DU instances to two ports:
> > 
> >  - port@0 (DU0): endpoint@0 DSI, endpoint@2 LVDS ch0, endpoint@3 LVDS ch1
> >  - port@1 (DU1): endpoint@0 DSI, endpoint@1 RGB (DPAD), endpoint@3 LVDS ch1
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v6->v7:
> >  - Rebased on top of [1]
> >    [1] https://lore.kernel.org/all/20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> >  - Use single DRM device aggregating both DU instances (1 DU dt node),
> >    modelling single port for each DU0, DU1 and multiple endpoints for
> >    outputs.
> 
> That seems like the completely wrong thing to do and you've given no 
> reason why you think it is the right choice.


We had a discussion with Laurent at [1] about this topic.
In particular:

DSI ip can select at runtime input data path or DU0 or DU1
via DSI_LINK_GPO0R VICH register. This can be done by managing the
2 DUs as single DRM device aggregating both DU instances that will spawn
2 crtcs. In this way at runtime we can select the output for DSI ip
via the following commands:

modetest -M rzg2l-du -s 58@55:800x600-56.25@XR24 (DU0 -> DSI)
modetest -M rzg2l-du -s 58@56:800x600-56.25@XR24 (DU1 -> DSI)

This can be done using option [B] (single drm device that spawn 2 crtc).

Using option [A] we will have 2 drm devices 1 for DU0 and 1 for DU1
that each will spawn a single CRTC and the above feature will be not
achievable.

In the end we need a way to have single DRM device that spawn 2 CRTCs.

A) Two device tree nodes rapresenting DU0 and DU1 design [v6]:

du0: display@16460000 {
	compatible = "renesas,r9a09g047-du";
	reg = <0 0x16460000 0 0x10000>;
	interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&cpg CPG_MOD 0xed>,
			<&cpg CPG_MOD 0xee>,
			<&cpg CPG_MOD 0xef>;
	clock-names = "aclk", "pclk", "vclk";
	power-domains = <&cpg>;
	resets = <&cpg 0xdc>;
	renesas,vsps = <&vspd0 0>;
	status = "disabled";

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
			reg = <0>;
			du0_out_dsi: endpoint {
			};
		};

		port@2 {
			reg = <2>;
			du0_out_lvds0: endpoint {
			};
		};

		port@3 {
			reg = <3>;
			du0_out_lvds1: endpoint {
			};
		};
	};
};

du1: display@16490000 {
	compatible = "renesas,r9a09g047-du";
	reg = <0 0x16490000 0 0x10000>;
	interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&cpg CPG_MOD 0x1a8>,
			<&cpg CPG_MOD 0x1a9>,
			<&cpg CPG_MOD 0x1aa>;
	clock-names = "aclk", "pclk", "vclk";
	power-domains = <&cpg>;
	resets = <&cpg 0x11e>;
	renesas,vsps = <&vspd1 0>;
	status = "disabled";

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
			reg = <0>;
			du1_out_dsi: endpoint {
			};
		};

		port@1 {
			reg = <1>;
			du1_out_rgb: endpoint {
			};
		};

		port@3 {
			reg = <3>;
			du1_out_lvds1: endpoint {
			};
		};
	};
};

---

B) Single device tree node design aggregating both DU instances [v7]:

du: display@16460000 {
	compatible = "renesas,r9a09g047-du";
	reg = <0 0x16460000 0 0x10000>,
		<0 0x16490000 0 0x10000>;
	reg-names = "du0", "du1";
	interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&cpg CPG_MOD 0xed>,
			<&cpg CPG_MOD 0xee>,
			<&cpg CPG_MOD 0xef>,
			<&cpg CPG_MOD 0x1a8>,
			<&cpg CPG_MOD 0x1a9>,
			<&cpg CPG_MOD 0x1aa>;
	clock-names = "aclk", "pclk", "vclk",
			"aclk1", "pclk1", "vclk1";
	power-domains = <&cpg>;
	resets = <&cpg 0xdc>, <&cpg 0x11e>;
	reset-names = "resetn", "resetn1";
	renesas,vsps = <&vspd0 0>, <&vspd1 0>;
	status = "disabled";

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
			#address-cells = <1>;
			#size-cells = <0>;

			reg = <0>;

			du0_out_dsi: endpoint@0 {
				reg = <0>;
			};

			du0_out_lvds0: endpoint@2 {
				reg = <2>;
			};

			du0_out_lvds1: endpoint@3 {
				reg = <3>;
			};
		};

		port@1 {
			#address-cells = <1>;
			#size-cells = <0>;

			reg = <1>;

			du1_out_dsi: endpoint@0 {
				reg = <0>;
			};

			du1_out_rgb: endpoint@1 {
				reg = <1>;
			};

			du1_out_lvds1: endpoint@3 {
				reg = <3>;
			};
		};
	};
};

---

Please Biju, Laurent correct me if I'm missing something.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso.merciai.xr@bp.renesas.com/
[v6] https://patchwork.kernel.org/project/linux-renesas-soc/patch/8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso.merciai.xr@bp.renesas.com/
[v7] https://patchwork.kernel.org/project/linux-renesas-soc/patch/ff8e401a0667970a42a55420dcb071e34730a923.1778141145.git.tommaso.merciai.xr@bp.renesas.com/

Kind Regards,
Tommaso

> 
> Rob

