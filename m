Return-Path: <linux-renesas-soc+bounces-33073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ItzIz4tFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:06:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BD75C99FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7E1E3021B2C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8588036999F;
	Mon, 25 May 2026 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XGsWhvNW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1148B36F8EC;
	Mon, 25 May 2026 11:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707046; cv=fail; b=g0rm1S2tXT17nD3tl5fmOqv7hMy0htKRZKkBWaKIZc1LgZFt9WYkKEDWmpq4npEpkyFZ9uuyFOvNIF419QjuWJXegAOW6r71qLubyRw39jogiIbrobOXNs/OYw6RRJn/9/JytKcyE80u5m+anF44kZCzourNeLF3N6GrhNPGd1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707046; c=relaxed/simple;
	bh=2DHAfhCcqUwGYQ4sm2WboBDO9cx4XwtxDZXIgRawBzw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g4kmfu8BvEO1iVzhMD8Y2t24+H0DcwHWjE5RUhLObG8VPmjnjQ1gWq2Fg+BLyez7ZX2zWkBBv5jxoNI73Ng/eu9FOi0+C/E0T6eSN2phCOCND4w2qCTTy60mmvMhITN67ipzsoOzojtg/luWiWzWtdqDh3VdliydNv+yeBl9f1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XGsWhvNW; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVqvSnPwiMllbGH1QVE0GzXLEu1tyMZXmaW24C3wKuDyqAnqwwLCd/pc6mC4YEOC/G9fajSf+YpFKyxbiELiIzxzbHYzdIGlTudoh/cBl6XrWvjdf4waYCrihgYYDUGeERTtnLfq8+vpiOzRXIx4NpUP+cAREeZE2v2Cj+gTS5YeLxUx0x13yvG4c1onYS/uqY90BMGim0kyXOrn0mlGRtU/pmnhVwEg/9p8gJV82843QfPo3MADopEEdMtTb59TZEEjxdoUxg9h0DUGjzmuqhHkCzghH3XDILenIFuUqsRt0ZzpmDMzRMWqpSCEkbhgIKFCIYBkJbmiK3Iw7VBL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcC5a2Z9tZlPhlVTpgKnwI8x/tcBmvLSs+e4ADeOhXw=;
 b=QiqhVRTGTzXh1pba0cHdINyEMcFzE+MG+rJFPPOe00Wnwyww+aWagyGo7/rJpbYKsqXeeIMBtQ5qN8RLywJB8oo6CmzaZf4pwmi9V6DG0cXhRXeaLRT2Er2TEO5yJ5YeQDU6Kfktl8Hw8j6h1gss0JC/A1kbaDqXAt6/lNsBTbY49Gf2HXgJ8d1cezxa9UpcNnZ7TsG0TuHWcp2uR/pQNtTwDHjOiJKcIDkn2G7STLQ1bdPwKBc3qEK9F2f3t94+NcB3dyhRAuyj8+IN3g2ORtPTq6x3NVwhONPObOmFBZwkNgsee8VhLOV0CjLL8UNueFpXA6miCXqyuD0zEeNTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcC5a2Z9tZlPhlVTpgKnwI8x/tcBmvLSs+e4ADeOhXw=;
 b=XGsWhvNWt5y6WEZVCdJu+vGmeHYgFwDdKyIrpLYEnpCKuUsAKV8sjUjEdvxxgn5w9JST53avuR+6SQ+ZwGzL9G2O0QL4lfhIs4JLwCRDx76DiOQ7dHhkBE7QMBXiePV0pQedWxxbj8z+4IDWSAPsWnA/9zgy8SXdpiALqCXMcEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB6982.jpnprd01.prod.outlook.com (2603:1096:604:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 11:04:02 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:04:02 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v7 06/18] ASoC: rsnd: Add audmapp clock and reset support for RZ/G3E
Date: Mon, 25 May 2026 11:02:18 +0000
Message-Id: <20260525110230.4014435-7-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0180.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::6) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f9e38d-6688-4d41-1696-08deba4d5452
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|6133799003|22082099003|18002099003|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	aHtOiSm7mF6uCifoxoTtE3KB2UyedyYX7NYbTDF8zCnBD7qDGd7EwATMUloWSHmPkgJqofL1Wu5ezZIPmd2ozloUGYjIJAeF/ftZ4BcYt3FTxdIX/Jm7Kdja6zPc65dDoYel5aWql64EfRccDwhAHqUDsf6aCeZvXY68CE4ccgsI7BhCYuPhOLsu3GIyOdRo0bWdRhDPlUxszCQb5EwYzPCdD3/GWHdNDFmJ2+gdJIcOuXMK00PEY5dVw0Zie0gj7zr/aWyiDOOGfVl5fnJ1mfFDnZOMepC4Eep1h/LgBkhL7I9LvUN9OZvCqdoW20zwU3clD62HJDh0gv3KMcVihrmrCXuUbDs8LL69rmFU3c6iNbX7Uf/Qn7TlLXU3VS/JRCTDhylYPSBSmMzTBF5+AXuWQEooUrGQa/FuMlFltI1NtLxhmqJ1Nme1CE0/gDCiMfwUHgdnP4aqDNfH4hbSX40hPOrqWnX6NILuubcAdd7Qq9MieRswpiYKfqVJFEh6O2XEwx2CLsvSbvNbRiWmqgYKjBoy9IP7sEtnpw5JP/H4GpigX6QKNANQRDYCzbF1cR5N6E145XtdA+XEf068cmzwqwimGQR4ruhgUMZiZbKurrqOeh0pQhmuQQK+yYdllLIjkgG+1oIGX4JxiHxRqkseR0kh3+P+G7ZoJucRI/4WqOrMEfy7usx9+80h+wl6MNRgX+EccOQw12QnCQsExm4Ol1a7BrAao5kibjHPOLBlT7bJ+B5BRav1+NW4VtwM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(6133799003)(22082099003)(18002099003)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?086OB1bA9loQ1fw+jD2T4Tzn6yYFK3Ebe8LMw/vY2JkOImR6M8rQAipZSeam?=
 =?us-ascii?Q?lRz2Qk+wNG09QyuLnsB4pqf0UyNP2tzo2cd/tloRRPbbx6ZWXtLnk6/B/Z/L?=
 =?us-ascii?Q?AFwKo+UAAtYgBM0ERyeHN3pMEoghIYlRPgwVfoI4XsxGXkUvsfCInpdJGjZ1?=
 =?us-ascii?Q?IRB5k6Vjaplv+TphdA0mWWOpSyXXv6xD/Ffvn34xQmS2bhN62scjoz6yqM21?=
 =?us-ascii?Q?giccwzA5m5Ol/B66pbqrq+EBhO/SIr770LZQyr3VGipHfn6RHhsGcjoz0uPb?=
 =?us-ascii?Q?IY1Vq9bZ3pgQlDoDM82hAfyjMi3kjF8o6Mv9x+pPJhvmbhPzLmXVgwmIxfDz?=
 =?us-ascii?Q?wUN9Ncsf7vvHUA+YZ8yMM0OX/0wCSaubYWUwAovIGBAayjo2bX+k4yCkKBwk?=
 =?us-ascii?Q?2AbIY+9UVbrXTi9bFefjxxOHYHqNpoBWpqAtqXY1IUbn4Vyh41wtSVAOo3Ch?=
 =?us-ascii?Q?VlG2TDgcnqF6hOJDwPYWST+Zd+yhZrUgzk8qY0a5H/tJsf3wq2W+7fHHDfck?=
 =?us-ascii?Q?kHJ/zLDpo46370CKaH6KdVkKY9pIZEYjURNK2gbfGbUmxKTiP1DyZGNuxbNy?=
 =?us-ascii?Q?lZtEFgfrhrU1CWdmiO6sDAIySOY5R/UIV5eh7PIISlpAV6hb87VRUnp8k6+F?=
 =?us-ascii?Q?K6ox1pwejVkd4fQSEnY1te1+KQ/BfdC7uieKsoZhKyUbsWfguG5m/WRpqjDc?=
 =?us-ascii?Q?s9wjoVL4gZaAkDbRa4NJbfXiAa0mxNfkxl+4/dt6r1O4exbS1HG9McoaIIhO?=
 =?us-ascii?Q?+1avdjCGY6q5djvblH+l2ABifurVsqMhYwkv7kGIKubYznYQGQMl+iypefD5?=
 =?us-ascii?Q?CnZ25wX3w1LX5T/mNgbkXC6h8/gy0j+vcK8FDhccJ6VjBqfrPdT7K1cU8K7B?=
 =?us-ascii?Q?cfao30Bo1T5KYjK/GPbalDw4VfkdtsCymljv8CY4m5hoG58FZAhbw0wZzhmo?=
 =?us-ascii?Q?v6WBYspC6lmjYul9THX5folHN8WbHePABxyDa8XrmRcJrSlaVT1KpBWYzE8a?=
 =?us-ascii?Q?g4IM1+mXCaTkU5wNIK2zEEg5AT5qNlrXu2Xl7LIqiahmYrF3zkqd0ta88iPw?=
 =?us-ascii?Q?NaJc+6y1cLHaxoBhIv8SJ9qvpppPIMwac64bGpuSU1TU9D/yc1iE1A98zMJ6?=
 =?us-ascii?Q?p1VsA0aOnBkG23rftku5NSF/sWVBXAua2sP332tI43FJCCMrsOqVfn+rB/vq?=
 =?us-ascii?Q?ex7WARUpGlLim730Fvi+5kMQJ/UqgLzLMQHF3e07ZlzFj9E9Vmm5kJvO9SUB?=
 =?us-ascii?Q?1wVu7qkZTXkQqlVuZjusaDRPwF4/zplRMGthsY46loKtnikBvWpQF02RCGef?=
 =?us-ascii?Q?Fbo1tdBgBS79I6rv2E1KtyQO3yugYxiDKelBP+9offSrj6/HsOqRo/DOiPJO?=
 =?us-ascii?Q?URbC079MI0Nnuogb4612ByDnvlJMlS8Hyn19qBVNpz7hgm2Ds/FcrruX4l3O?=
 =?us-ascii?Q?olQY9FpCti1a8gmsWapOq8uYPYFO8XXQaSVbNJALNb/9jsBVSMta5btK5kv/?=
 =?us-ascii?Q?3sum58Y57KsZ79t0+9QbEzgb+KmNk76c2LiJfrBA9ZxD9nzXsB5CV+P1XJmr?=
 =?us-ascii?Q?Om+SHQA816W1mmPWsi7CXwuiRZQ7PobEV6d80QYvt2yXzwh0y2fP2rMuQ7IL?=
 =?us-ascii?Q?3YUhjOijxFprN1MUdIQIqcqmvy5EaJVe73UgCftQtbCg6aZPd2e2GP8xqHNA?=
 =?us-ascii?Q?kuoZ8UtV0XiTqiwlJYaNgSv1sZHUdE+x57mxIwjC3wpgJXCRiHna6z9sAmFY?=
 =?us-ascii?Q?S2cz7NXVDqukNqE9A7pa5DcoAFLsMeE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f9e38d-6688-4d41-1696-08deba4d5452
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:04:02.6010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vF5u+hbuf+5S2nE9VByWp9cn/BRCG9LHcWiMD8kTadzUYasFb7O1m5PXRXCPOojTUdc9R0dQ2hy64ld5BvUSLak6He355WM2N0igxREz9hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6982
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33073-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F3BD75C99FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E requires additional audmapp clock and reset lines for
Audio DMA-PP operation.

Add global audmapp clock/reset management in rsnd_dma_probe()
using optional APIs to remain transparent to other platforms.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7:
 - Fix the "audmacpp" spelling to "audmapp" in the patch subject
   and commit message, matching the clock/reset name and the rest
   of the driver. No code change.

v6:
 - Enable the audmapp clock before deasserting the audmapp reset
   so the block sees a stable clock on the way out of reset.
 - Drop redundant braces around single-statement if blocks (style).

v5:
 - Add comment on audmapp clock/reset acquisition clarifying these
   are optional and transparent to platforms that don't have them
   in DT, per Kuninori's request.
 - Drop spurious blank line added to struct rsnd_priv in rsnd.h.

v4:
 - Move audmapp_clk and audmapp_rstc from struct rsnd_priv into
   struct rsnd_dma_ctrl.

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/dma.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 68c859897e68..d52cada711e5 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -47,6 +47,9 @@ struct rsnd_dma_ctrl {
 	phys_addr_t ppres;
 	int dmaen_num;
 	int dmapp_num;
+	/* RZ/G3E: Audio DMAC peri-peri clock and reset */
+	struct clk *audmapp_clk;
+	struct reset_control *audmapp_rstc;
 };
 
 #define rsnd_priv_to_dmac(p)	((struct rsnd_dma_ctrl *)(p)->dma)
@@ -870,6 +873,25 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 		return 0; /* it will be PIO mode */
 	}
 
+	/*
+	 * Audio DMAC peri-peri clock and reset for RZ/G3E.
+	 * These use optional APIs, so they gracefully return NULL
+	 * (no error) on platforms whose DT does not provide them.
+	 *
+	 * Enable the clock first so the block sees a stable clock on
+	 * the way out of reset, then deassert the reset line.
+	 */
+	dmac->audmapp_clk = devm_clk_get_optional_enabled(dev, "audmapp");
+	if (IS_ERR(dmac->audmapp_clk))
+		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_clk),
+				     "failed to get audmapp clock\n");
+
+	dmac->audmapp_rstc =
+		devm_reset_control_get_optional_exclusive_deasserted(dev, "audmapp");
+	if (IS_ERR(dmac->audmapp_rstc))
+		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_rstc),
+				     "failed to get audmapp reset\n");
+
 	dmac->dmapp_num = 0;
 	dmac->ppres  = res->start;
 	dmac->ppbase = devm_ioremap_resource(dev, res);
-- 
2.25.1


