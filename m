Return-Path: <linux-renesas-soc+bounces-33075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMJzEYMtFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:07:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD65C9A74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 396A0302297B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DF0372051;
	Mon, 25 May 2026 11:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Pg0/juPC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9136999F;
	Mon, 25 May 2026 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707060; cv=fail; b=d6fNn11u9IFIyVkNM41gcB40aLX3MiyAwCR0TEndp34lR1FlHPldM0vIqrTMe1zeI4ty5n9LFQRTsBtUmQAWt/CZ21ykX46joSuqZIVCMTd6Fr/wTIXIFCvA4cZyoQq4sUmLzbidnW46qoe9QcP/pX1hW5vixKrkAEhcDJO7Ja8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707060; c=relaxed/simple;
	bh=1OTXJ3Neu9o4aSqXZGEibBpdN0gDlZdBbkmXJheEJTc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L/k2xhDMGYbJf/XB4DouF1Jhy3t637OfFsV9yRrorxXb/5EODh8lJR/biV8eekwcrz1iixVXyApfiiTbQsahzIpibjJfW7TRxUwoyVnW62hbexAXV46kISSHQpRNCOD7XcxsNPsaFheW07SaqM0hQtRWfSVs8/fJzbhJGbrMWs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Pg0/juPC; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHxqjRAs5Tz1kYYS+YY/iwEkOm+a8wBQ9DUKHg54X0ClGVwiwtmK5TR91B0t6IuZZkR+d+QtxSK48zdjUanuNTowzp5bs2BpirZjxjEP9/pzAAX5ZG6yjvIm3WX0YdsZ/rEo2T3NuyKqvMddz4yTmg8/xmCbywZ9yh8MNirSuiDcUpjpf1ke8wERVYJ0m/jKFokdFDzHA7c/eLOtarzZl9M7wUPdoAH5LZb5Pwd69+UW2m+JDoTSoQElHFf67r2dVXdH/mE2JufwcuFCYUhkJz9NvNEnOZaBLQMXWw79bC+jioQTEbB5/F7n4GO8sAf/nGryG0Xd7GdYRzvj8ma59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbE3vGm1HgRqLiH7YLHjegDidLPk8rgEZpjef6hu16Y=;
 b=GmSwxHwjXknq+1plDiPg0s7LcWS9mZAJ6hgqx3ftBM4vXQH5dyPURuB9q0B6v9tCXU9GzgFrDLbbRFAkm2iyb0j1c8i1Tnfcho0MQZa8dMMwU8JGGv7K7oxK5EVlEypXGaNu8dP6tSAUoKBWQau9iECq1Ql4NA9zB6CkFs/8oyDYL668LbutzeI0C/++UURDOGCGF6fqSMjmMm2HvHPhCz/t7qm63ZQ+VNbDMSWChSWPiHYOvR7dOn9Nf9GkztdcBoa9ND2g96qtwt90NcKmMscjtO4lCeOY7CDoOySmZSR4Dyhcp0J5ZbASTZOuj31FpzHvM+Io+3EqASHHxSl13A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbE3vGm1HgRqLiH7YLHjegDidLPk8rgEZpjef6hu16Y=;
 b=Pg0/juPCe7A0RbCz7Obw8ZAhrJjgqdyBXHihfXuiK/Jv+9VesT+IMGdqEdctlrp4/9ACXXDQuRjA4yde2+GJwk4IBjcyC864ZReH1E1H494ru+C1DbasEB3Pb0mw/zjEghfX91j1YrYqTQ/40BhuREBu+QNWJst+Kc06mcAnhfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB6982.jpnprd01.prod.outlook.com (2603:1096:604:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 11:04:16 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:04:16 +0000
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
Subject: [PATCH v7 08/18] ASoC: rsnd: Add RZ/G3E DMA address calculation support
Date: Mon, 25 May 2026 11:02:20 +0000
Message-Id: <20260525110230.4014435-9-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: b486ec65-ae67-4568-5a52-08deba4d5c82
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|22082099003|18002099003|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	2khmVYWTj4Hdg8DworTwm/PPLc5rh+/ycj77r+zlD6ELSnQW81nwhRMjAMXXtLejTx2a/BdarEUqEkjGZmM2Le/mwPWI/FV+DvIIqsJLQnWdxdjk3wOAZn8eg99G2DF7hlNiYTmIbKbTKBq+uTtTRX9KE11iN9H6zS4XfAy4zxxeR8a8HSwSRCB/lrMZfHatjGirIRhqjzqh7g31sQ/lzVhgnYsVFZXufZT4+PjiAKcbeKxp6iqVxFXwCeGzBlL/vq0HWsViCXZZGnwzl+Bzt+LJu7MsO0UoQDiL863D8WRvHqPggV5z43SOyxZrOtKxmdDjQjQwSqqj1kl3bmyDrgjMybVvAguIWFHt5AVbIb1JE734HXwSCsKE1whSiJSBQiK9dqFMumTQEb71okAlq6eebrmRuT35xjPemqDudK6janOUbHVqPBkJ+U6Sa4Ks1K7lzm8+Gy8BpqRbT3f2EP1vNJHMxDEGs3r/WdOCJoj3V5Y5iaBnuVW872ZLGQl/XlCnrcLC1xBfXCWv5fjg55ktvgUI1srT0lz/Ndd+zhe9C/I66UBa1tL6cksIg0xbEuV2n9MbmyeBsWRf0/HQW8m+vTbHZu7F06hoPcT5y0bYxUG3MF3g2lX5qan5iwjhFi/EbRskXBO7ukf2XCMVUkg/SjL4Cu1XvBLjSnmMhc+TlsYJm3eHJ5guIW+HQBxUimH2UiTvM/TUQ7U5I5i5HlmMJvvK1M6+6Ih8MEJFxKtfPSuB6PDZQuI8v9oisuGv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(22082099003)(18002099003)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4vjdHrXhNl9YyT3dN3iMBjkOtJSa12guMLlEa1l86yM2otFqSeS/ShuQ33hQ?=
 =?us-ascii?Q?PEG73K3Ev5ljv2VXRxBy7xbZj+guHPrzL85BXL66hQtqOQnvvHXSoOI2iGSz?=
 =?us-ascii?Q?1VCOORj9wMOEvKZ5hANTP3iu9HlECXGiZOsbob1hi8aA/37tNQhhlYB4OtHr?=
 =?us-ascii?Q?CbX/E0SnoTvAaIhGlFv/TI48aywgd0QvLJUCnRcQSY7FjLbJQb4F1R+DTGeU?=
 =?us-ascii?Q?BpavcI55n1rjjVXB1DLUvRRKI+HM518uOaqP4Ky8wMjK+Xq0rvAMHuMNI0cy?=
 =?us-ascii?Q?bG3PGD8lnK7g6a7ESToIDA5xfaMZLkoRFHa6jchi7oZElUcvfthkM11Qo/bw?=
 =?us-ascii?Q?lAaQ2/cmLEUq0fj1KzVq57IQBFneotLrdjFnVF+DC8pLKnzYFjMj2o4o22i2?=
 =?us-ascii?Q?jejVVNw6xYVnsW54WH+ZwIVrp/of/zhd6xW7o5Q51dKEAzLDm9AmYUiqRNaP?=
 =?us-ascii?Q?XTDu7WAsBwyxVAYsDeYgvQyTCoRSEBCzoWyI0Rn6NeBd3jENi0Xf0qjUEG0g?=
 =?us-ascii?Q?kd6ITmayVRhu1NWxFb47F6iuPgR89h2ZUR2xXzZJdT2UXHB+vf38ZMp0gTUr?=
 =?us-ascii?Q?QcsmQ+vPmyaQ+3Dj1pKfGzINbLzv2pe3zbBIkIJvMfYpt/QKFMEkRptdr4Eb?=
 =?us-ascii?Q?DIVnxV/slhab9RrBdpg9XL24+AKDKqNlrE6oddf+VeVg22QhrEmfgJD4Qs+f?=
 =?us-ascii?Q?99/wq6RBPMzUVo6lk+HIDtYQCT1RD+sC8TX3Ku5AYGUfoX5MJklL1RoIE8Rr?=
 =?us-ascii?Q?qhZcJl4W27cF7CKBcHViq6lYMRQWvkYrg0iPhU43aAKLQ7PBQtXaQybfBduq?=
 =?us-ascii?Q?wKsn8ed4Ljj+tmzAOWbyXsnAbM5/ZjQ4BmIGLP4jffeSRFgA7OpzY2WLKMP6?=
 =?us-ascii?Q?ecc3upH3utoRLBiPbG21vFf/XPEobdj6vD5nbTCori/XHl5uk568TVL7zswo?=
 =?us-ascii?Q?tYmK3kjn2IZJ6ZWMdNMwhWhcQS874+pTnf+kLegZjGOQSnoOsY6Pl7nU/Dyr?=
 =?us-ascii?Q?1/Uw4Q02iBB8HQfRpaRGHx6PUKVxnYfYGq7NfxCe0eDYXlTU8Gc9LiKxU+IY?=
 =?us-ascii?Q?vziDhmcgmJAU8SJemI6oEl9Y8+HBasKZTWilqx+K49qR/55BUkW38q/KXCIN?=
 =?us-ascii?Q?q0ugy+BAXl+1o2WM50mxTsNPmlYil8u5L7QL3PMhmY05JMN3tPe7voI16jw0?=
 =?us-ascii?Q?6TkBXL0RNP2slUOFEETIRtOkMRzVs2LfnQrozuKf/xBqP5wCjz5jdHfKREOX?=
 =?us-ascii?Q?7IVaQ56PZ65wQosMHTfbPbAPZKLkCeGiDS41jhUohAhaekOj+ON2jU5416Uv?=
 =?us-ascii?Q?ao73CpzTdNsu1pXL07hIWBHi11R9s+moJBzuYaxMGNlb4Rr/Ylb/YE+Y+EyC?=
 =?us-ascii?Q?S7zp5KcCuD+fza46izqFIWJ3Pi2jymR7fEMXvBhUT0Rgrqs5u8tNZJ3EMuzI?=
 =?us-ascii?Q?xjJ1F3UuDbt6kOmJ0vMDjPotcG9DlpGRkqqpyuoQhTv6oQJyfZ24y25XVenA?=
 =?us-ascii?Q?+AuwEk/nap6PTFT+0jdvgBlj9M0BEUeLRsKSm79p631IKAwjromZFbHlvwil?=
 =?us-ascii?Q?gdgdlqfyq7l0CYUEEFd9wFQ+8lWMK+qrLIIY7Q5cm7APzyfKWSrJovHbWmUZ?=
 =?us-ascii?Q?Cq8NXgbQQRiQk5ShZQqycT579X/zyfZ1zW2jnMxcVGjIMCZSW+++De/Z3UsU?=
 =?us-ascii?Q?9T6bSz/eAgR0r6mJxbjq0HaTbWbEuswfSdRZdlnlI70XdM4gcwrAuJdvwbF7?=
 =?us-ascii?Q?cpxrbmY62L/qfi5eWKkKnJOS15LYpSg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b486ec65-ae67-4568-5a52-08deba4d5c82
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:04:16.3693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xG//Hf1ulfUnrOXI+GnW6qKuoJsrHTUkSJ07hOejhZgkrxtMGu8eE/wIhiFHGxCFRieYtsac5+bLHiGKxno1Njfe9PTDldG9MJjfogddjqk=
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
	TAGGED_FROM(0.00)[bounces-33075-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 8CBD65C9A74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E has different DMA register base addresses and offset
calculations compared to R-Car platforms.

Add dedicated rsnd_rzg3e_dma_addr() function with dispatch from
rsnd_dma_addr(), following the existing per-generation pattern.
The function reuses rsnd_dma_addr_lookup() and rsnd_dma_addr_map.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7:
 - Wrap the i and j arguments of the RDMA_SSI_*_G3E,
   RDMA_SSIU_*_G3E, RDMA_SRC_*_G3E and RDMA_CMD_*_G3E address macros
   in parentheses to guard against operator-precedence surprises if
   a non-trivial expression is ever passed (sashiko-bot).

v6: No changes

v5:
 - Split from v4 patch 06/12 per Kuninori's request.
 - Move G3E DMA address comment block into rsnd_rzg3e_dma_addr()
   per Kuninori's request.

v4:
 - Replace raw [3][2][3] DMA address array with named structs
   rsnd_dma_addr_dir and rsnd_dma_addr_map. Use designated
   initializers in both rsnd_gen2_dma_addr() and
   rsnd_rzg3e_dma_addr().

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/dma.c | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 0ce77eee338d..92974610ac15 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -644,6 +644,85 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 	return rsnd_dma_addr_lookup(io, mod, priv, &map, is_play, is_from);
 }
 
+/*
+ *	ex) G3E case
+ *	      mod        / DMAC in    / DMAC out   / DMAC PP in / DMAC pp out
+ *	SSI : 0x13C31000 / 0x13C40000 / 0x13C40000
+ *	SSIU: 0x13C31000 / 0x13C40000 / 0x13C40000 / 0xEC400000 / 0xEC400000
+ *	SCU : 0x13C00000 / 0x13C10000 / 0x13C14000 / 0xEC300000 / 0xEC304000
+ *	CMD : 0x13C00000 /            / 0x13C18000                0xEC308000
+ */
+
+/* RZ/G3E DMA address macros */
+#define RDMA_SSI_I_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * (i)))
+#define RDMA_SSI_O_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * (i)))
+
+#define RDMA_SSIU_I_N_G3E(addr, i, j)	(addr ##_reg + 0x0000F000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
+#define RDMA_SSIU_O_N_G3E(addr, i, j)	RDMA_SSIU_I_N_G3E(addr, i, j)
+
+#define RDMA_SSIU_I_P_G3E(addr, i, j)	(addr ##_reg + 0xD87CF000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
+#define RDMA_SSIU_O_P_G3E(addr, i, j)	RDMA_SSIU_I_P_G3E(addr, i, j)
+
+#define RDMA_SRC_I_N_G3E(addr, i)	(addr ##_reg + 0x00010000 + (0x400 * (i)))
+#define RDMA_SRC_O_N_G3E(addr, i)	(addr ##_reg + 0x00014000 + (0x400 * (i)))
+
+#define RDMA_SRC_I_P_G3E(addr, i)	(addr ##_reg + 0xD8700000 + (0x400 * (i)))
+#define RDMA_SRC_O_P_G3E(addr, i)	(addr ##_reg + 0xD8704000 + (0x400 * (i)))
+
+#define RDMA_CMD_O_N_G3E(addr, i)	(addr ##_reg + 0x00018000 + (0x400 * (i)))
+#define RDMA_CMD_O_P_G3E(addr, i)	(addr ##_reg + 0xD8708000 + (0x400 * (i)))
+
+static dma_addr_t
+rsnd_rzg3e_dma_addr(struct rsnd_dai_stream *io,
+		    struct rsnd_mod *mod, int is_play, int is_from)
+{
+	struct rsnd_priv *priv = rsnd_io_to_priv(io);
+	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
+	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
+	int id    = rsnd_mod_id(mod);
+	int busif = rsnd_mod_id_sub(rsnd_io_to_mod_ssiu(io));
+	const struct rsnd_dma_addr_map map = {
+		.src = {
+			.capture = {
+				{ 0,					0 },
+				{ RDMA_SRC_O_N_G3E(src, id),		RDMA_SRC_I_P_G3E(src, id) },
+				{ RDMA_CMD_O_N_G3E(src, id),		RDMA_SRC_I_P_G3E(src, id) },
+			},
+			.playback = {
+				{ 0,					0 },
+				{ RDMA_SRC_O_P_G3E(src, id),		RDMA_SRC_I_N_G3E(src, id) },
+				{ RDMA_CMD_O_P_G3E(src, id),		RDMA_SRC_I_N_G3E(src, id) },
+			},
+		},
+		.ssi = {
+			.capture = {
+				{ RDMA_SSI_O_N_G3E(ssi, id),		0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,		RDMA_SSI_I_N_G3E(ssi, id) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+			},
+		},
+		.ssiu = {
+			.capture = {
+				{ RDMA_SSIU_O_N_G3E(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,		RDMA_SSIU_I_N_G3E(ssi, id, busif) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+			},
+		},
+	};
+
+	return rsnd_dma_addr_lookup(io, mod, priv, &map, is_play, is_from);
+}
+
 /*
  *	Gen4 DMA read/write register offset
  *
@@ -690,6 +769,8 @@ static dma_addr_t rsnd_dma_addr(struct rsnd_dai_stream *io,
 		return 0;
 	else if (rsnd_is_gen4(priv))
 		return rsnd_gen4_dma_addr(io, mod, is_play, is_from);
+	else if (rsnd_is_rzg3e(priv))
+		return rsnd_rzg3e_dma_addr(io, mod, is_play, is_from);
 	else
 		return rsnd_gen2_dma_addr(io, mod, is_play, is_from);
 }
-- 
2.25.1


