Return-Path: <linux-renesas-soc+bounces-33071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IVoFwEtFGpYKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:05:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0BE5C99AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1B143019F35
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B11A36A345;
	Mon, 25 May 2026 11:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="huVknmqd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0587356767;
	Mon, 25 May 2026 11:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707033; cv=fail; b=Kf9YFZ9rseiXjxIG+FCf/MTAW+eC1U6JPfpNIrKhYI9nTpl+XqYMiMQIrpfLg/jFsEVN9PPxKbnnb4n613YHalJavIRYPVerpOoFTSiSo8RlKN5451lXQcFga6qVjTradtxneAVOB/j+N58tUOSdVqYrwULekfVZfQHT+OwwpMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707033; c=relaxed/simple;
	bh=afjrOOJcv/rwzAJdRSsqMg8R6t2e3KZW+7mpIZTLZpc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ewpjLnvhXXTn1d0d9e3hyyThrvk+qwvvmE4KEjtgINrZxBVFcIwalTJG0RJHShn25pp8szaN0nYE8HW34e66sXQHRlxXIurxVYqWW7zSVSV26iyGzG7H/Odm9Q7/JypnbUp+c6yKVteEoqUFUCAGUNHQZABPPL1b0bri6+y9fzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=huVknmqd; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfhQGxL9iMyxw6wAh4egDAwD6o75ZLzJfHqlJH9Yu1bHU5L5apvShwjH/QHSZlBDPaCYTZxpt2rlxxePabe6+8EGRzWmNbdHBDz/1qhGjAulxr6Z2oZ2bLibN1pZyFlL6fZh3gkSpyl+1DdBxFTNUxZse1w3fHnCtGFOoYkVVeXUh7FfP/0SfBYKtzsTweFhNFvb0ykbhq46H31iFQJVPHkNakO8U3vJ/i8gcgYc321+8gf1n2OMTHWNyneWhoGuB8nwqswdiEKQCuUsc+aFiL0oPrVJvN6b56nrLsNWzO7NIz0V7z8INg0lfWgbzhvb34OBcawfGmYUY7VXzuYhmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFwMKpt4oa54eHvw9rdUyT0BmDDebiBTPi8DCflltVs=;
 b=gRyeitZ68bo9FFuYz7JVdaY85dW40hDMbi71znFxWwOz2tIzPABixP9Rgi/Gp9/wxJ/uTLGReUFucTurwKyn9H5sVsaKoQbcCvIreCRcJloq35LnyoVDEa4WcCvDFu49oDyoig5ElKllEHEF95DW33Kcan604Fu0bKp0R1UZBwsduJaTJD/Y10Qn3humD4wUHRpon6trfd5TN/S5oasg68qUpZ+LTfz44HiotRAp6842Qx7DWHD+pu02B4tQQjvFJccYsrNrwNICQdWka1Q5bR0DaTOxBLCb7/kuuu2qY/RxjmweOK3EG3gYwQdscjC0xLdoKeQFI4ZL5j7D1p81OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFwMKpt4oa54eHvw9rdUyT0BmDDebiBTPi8DCflltVs=;
 b=huVknmqdfb/mrgYa13JghtNXo8ad4wOHB+p56p1JE7XtLFP8ntJpEXRxfsMzptc3BtXkGoWs0WMa1ftmbo6Zs6Tv/Zx8M+XwEYhAXhy4X90OfDfSkzZ61nOR/yE2tdCm7hNhWkVCJbW+z8tMg5ixB1530bJBKj0Soit4UF+2z+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB6982.jpnprd01.prod.outlook.com (2603:1096:604:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 11:03:49 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:03:48 +0000
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
Subject: [PATCH v7 04/18] ASoC: rsnd: Support hyphen or dot in indexed clock and reset names
Date: Mon, 25 May 2026 11:02:16 +0000
Message-Id: <20260525110230.4014435-5-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 93ae0ee5-b5cf-4f96-09f6-08deba4d4c08
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|6133799003|22082099003|18002099003|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	IS/zlQ1KCuEPIb680HCFn7CjeL+KHsuK8YfhKziUfivVm2ez2glKai0CL1NQSjw04Zsk99uAx0hqOLZccL1mz0ishMpIEuyT5+NQKvtCG+DVoMP2KF0wmAu4T2CSmSPGyAkSn3KOhO+Rn3XBBFxxsZ72865qxKI6Ap62vzTaEeJ7wKme5bKckB/YGrnigpsiNMqGFvnK4swxJjaW4u7iyeRh6FJjIxpUQ8EoCbH3R0lTQSOyZuD3i/U70MA4Jjj98lo/HM30PV+eEdWSVkEmi++uGn/uI+mYYeRHiYtZiVSI9fcVJu+LnRbVA6w5Qc9ALxNlxhmWzqhk8wUxszWdVNNEO+3T3h2Bm4XxvqhKY9AHpWYWY2hyeYyf+GG+AW1LbzWmqrhcfbppzq71OkdSNA8Vijgj8WCoI/6E0k8bhQH/O2T+rW7LyNnvBi+Qa9UYQ6cpamisqlTsCzKbRLMoERhaSpXCZw5153S+cu96M7lv5EsLhPqJn8r0ExyRA2VTioW8Peb3+I+icu5n87sNWOB4BFeer+7oDTM4so1snQil25lnCHrwBVOUSBPSsC2r9UBmbC1PT0U4u+yioTlt9XHPtLTPhCV651IeRSo3brZ8EGqshN+4HKJmcIl/HTV6fbcvzB0ejQg5qVMIlSz8kTj8SmSb6AZQ9w98JHe0US+zXewx9tYh6ZWUsorziEMB/DD/r7yOPPdyChzHglepxvr8IzAUpihNKZstrgf1rfjU4W4w5Cyh91ye922r+H5x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(6133799003)(22082099003)(18002099003)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0irNdlxkeekSUsFmWaY6eoenLkqxI59WBibcXHT+RSau8HLwupNp/TpFjpjX?=
 =?us-ascii?Q?lJaLwVggRAMoz7o3OtxhmY3MU+OWJH2mi+zBlLaAMPU/kapCrl7NR4ejzu4g?=
 =?us-ascii?Q?x8jJmJ8HHq92MQyVdFzw9l7gMB71Z6214IMH8tGhPdDKEyUOz1+n0Xoxouz1?=
 =?us-ascii?Q?OEQsKsxzxZQOojSghMqF9+Scrps6uAV3h16IUKGmkCS2oFxvyqnVAIINDL8a?=
 =?us-ascii?Q?/+3yOQjZYiDiAQ+gbRAYkAvk/vf1KPS+XRWDHHgMtOHUCSXASWmE7Rjx2+LQ?=
 =?us-ascii?Q?wWqVczUZEPWc4zRTasH0n8X6nUFQN4C70AqYL8ArbOQiOnXiAFM2fcmrZGHK?=
 =?us-ascii?Q?1Vc0Vo36NcHf7dr0TYbNevocsMKKy5v+HzYuR683H4W6lnsHsyKXf4aMaugC?=
 =?us-ascii?Q?RozeJjq1xZNr18XDNQBqYZRLAGVMniEqEKITpAXR00vqJ6/jmLilfkFBMncX?=
 =?us-ascii?Q?+sGVPR+3yRD8hqJldaJfq5EV2I/fes/Mp5u+mQe3KxMtWvM1mdlJe052BWkO?=
 =?us-ascii?Q?o6CM9gXuChAxjEm2PFUeYb8sOZdeZr86SxSSxexXl8akcZArdm52wo//MEJD?=
 =?us-ascii?Q?k1TCq2vYQLRe8NCncZF357K7oeXECDZDCGr2z0L8gbrUc17tq+8BzncHMAlg?=
 =?us-ascii?Q?oGIYIwtkIJwjgWeVLujQ4chybt+IvAX/6EYpffwCqKEmnfTcka+uEKuDFvKx?=
 =?us-ascii?Q?Q00QJBb31yrI3D2QObDBNv/o52uI8n19liStAImqJVfba6xwmi7NCQU4j4L8?=
 =?us-ascii?Q?8y6YKVoY0xRHCH9KroDkc8hLDMQ2OQcTJz/GNq/8fYO3bHXgSYgMyPi1s+YH?=
 =?us-ascii?Q?gSMm7a62wR6ZUb41EfLBUqiHLTMUEt6IPfwJk2JgxUNWrK+zjloEbVqNvK7q?=
 =?us-ascii?Q?Vs6AOu5JHSRDcDc3Y2FG/tWYYbmHiVqaVky6+7X8dzXu6wougfvBzAfVJtev?=
 =?us-ascii?Q?pkGhTFeKTNHK2aLsKcTDswXjjQzdR5m3ZFp+IZjo/2VE6RmzKvD1BNSAywH9?=
 =?us-ascii?Q?c7VImRZ9h/iT4IPLdQ4KFL4vbUiXDsUx67MybpQWlfO20y0fj2CUpFqF1ms+?=
 =?us-ascii?Q?QR+pCD+rlfA29ZtNAWql1uOiorEPfPe6TkveaMnKkHldJaoDPlnAdIzVxEOJ?=
 =?us-ascii?Q?i0Ow+bD3qhoB8jBR/fvHl45455e9ztcICy6ylGsYl1xYAlI0Eqy9aSrBtnNw?=
 =?us-ascii?Q?tTWR/0nnCoNY0HEtX9BqK/s7KRa/+5bKWDi3UZkvyeDqfgQPt5JGko+xP1eT?=
 =?us-ascii?Q?FpPnvEviDfe/088OoDFXkCI28DDxK789bz/Wx6s8HLtMA06AevEo/QPorbua?=
 =?us-ascii?Q?P3EAI7aH10tbzBQ9j58Xd/bFr1+3cmoCUyboQ6vV78ijZetdeki4YRd1O3Zy?=
 =?us-ascii?Q?le1rdoAkBAJF/7Bf/RS385kCuzo3NdToJFzxUyrT9CCR33wu/My/o8t6RO19?=
 =?us-ascii?Q?FjaqwiAHoRRhqtJ3dF6tlNi0AgKsONR0YU+KpVbGiOsDVt3MlkTbhxyEc3qY?=
 =?us-ascii?Q?q3WQ5G0ZF7uXJJnp8DlVdyvFjR+c5IJZNDy2t9dTU7uj4p5KSsf4lRWLhnEY?=
 =?us-ascii?Q?LIaTm3/pXJ9h2U5j6+vkBZeW/aQgsKsQAc0PeKuevZ3KnqrNo7qIRGol23Qz?=
 =?us-ascii?Q?KHbflVaGjy3cMOEVSkVhiEWOOqnSQzJAzjO/q6JHMSjCq33fIZPHqG7XRvuu?=
 =?us-ascii?Q?c98krcS7pmPNtQVaWB0dfO0Zw+eaMjFcEPoySEcbffOYFv96q04lyIbow1b1?=
 =?us-ascii?Q?+4b3m7URNkOTnP20NvTWi11hea1FC/k=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ae0ee5-b5cf-4f96-09f6-08deba4d4c08
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:03:48.6370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5IIV/X0T8XJLnHQBXduudbp3g8tp0RIRzIzPkXRv6O0+qoo2uQiZnbniwZ0SEYA7HSmu2Ovld9esgXlwWZ2aF7EkLSFVPqyu7gAOgwhKZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6982
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33071-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9F0BE5C99AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The rsnd driver historically looks up per-instance clocks and resets
using dot-separated names matching the ones declared in R-Car device
tree bindings ("ssi.0", "src.0", "adg.ssi.0", ...). The dot separator
is unusual for device tree clock-names / reset-names and newer
Renesas SoC bindings (RZ/G3E and later) use the more standard hyphen
form ("ssi-0", "src-0", ...).

Rather than force every existing R-Car user to rename their DT entries,
add a small set of helpers that try the hyphen form first and fall
back to the dot form. While at it, convert the existing indexed
devm_clk_get() call sites in the SSI, SRC, CTU, DVC and MIX probes to use
the new helpers and drop the now unused per-module name buffers and
NAME_SIZE defines.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7:
 - Fix the kernel-doc comment on rsnd_devm_clk_get_indexed(): the
   fallback to the dot form triggers on -ENOENT, not ENODEV, to
   match the actual PTR_ERR(clk) != -ENOENT check (Mark Brown).

v6: New patch

 sound/soc/renesas/rcar/core.c | 67 +++++++++++++++++++++++++++++++++++
 sound/soc/renesas/rcar/ctu.c  |  7 +---
 sound/soc/renesas/rcar/dvc.c  |  7 +---
 sound/soc/renesas/rcar/mix.c  |  7 +---
 sound/soc/renesas/rcar/rsnd.h | 19 ++++++++++
 sound/soc/renesas/rcar/src.c  |  7 +---
 sound/soc/renesas/rcar/ssi.c  |  7 +---
 7 files changed, 91 insertions(+), 30 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 2038e3079a9a..a60b7a5d90ad 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1232,6 +1232,73 @@ int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name
 	return i;
 }
 
+/*
+ * Build "<base>-<index>" or "<base>.<index>" and try the hyphen form first,
+ * falling back to the dot form if the hyphen form is not present. This lets
+ * the driver accept both the new DT convention ("ssi-0", "src-0", ...) and
+ * the legacy R-Car convention ("ssi.0", "src.0", ...) transparently.
+ *
+ * @base: name prefix ("ssi", "src", "ctu", "mix", "dvc", "adg.ssi", ...)
+ * @index: integer suffix
+ *
+ * On -ENOENT from the hyphen form, the dot form is tried. All other errors
+ * (including -EPROBE_DEFER) are returned to the caller unchanged, so
+ * behaviour against the clock and reset frameworks is preserved.
+ */
+#define RSND_INDEXED_NAME_MAX	32
+
+static void rsnd_format_indexed_name(char *buf, size_t buflen, char sep,
+				     const char *base, int index)
+{
+	snprintf(buf, buflen, "%s%c%d", base, sep, index);
+}
+
+struct clk *rsnd_devm_clk_get_indexed(struct device *dev,
+				      const char *base, int index)
+{
+	char name[RSND_INDEXED_NAME_MAX];
+	struct clk *clk;
+
+	rsnd_format_indexed_name(name, sizeof(name), '-', base, index);
+	clk = devm_clk_get(dev, name);
+	if (!IS_ERR(clk) || PTR_ERR(clk) != -ENOENT)
+		return clk;
+
+	rsnd_format_indexed_name(name, sizeof(name), '.', base, index);
+	return devm_clk_get(dev, name);
+}
+
+struct clk *rsnd_devm_clk_get_optional_indexed(struct device *dev,
+					       const char *base, int index)
+{
+	char name[RSND_INDEXED_NAME_MAX];
+	struct clk *clk;
+
+	rsnd_format_indexed_name(name, sizeof(name), '-', base, index);
+	clk = devm_clk_get_optional(dev, name);
+	if (IS_ERR(clk) || clk)
+		return clk;
+
+	rsnd_format_indexed_name(name, sizeof(name), '.', base, index);
+	return devm_clk_get_optional(dev, name);
+}
+
+struct reset_control *
+rsnd_devm_reset_control_get_optional_indexed(struct device *dev,
+					     const char *base, int index)
+{
+	char name[RSND_INDEXED_NAME_MAX];
+	struct reset_control *rstc;
+
+	rsnd_format_indexed_name(name, sizeof(name), '-', base, index);
+	rstc = devm_reset_control_get_optional(dev, name);
+	if (IS_ERR(rstc) || rstc)
+		return rstc;
+
+	rsnd_format_indexed_name(name, sizeof(name), '.', base, index);
+	return devm_reset_control_get_optional(dev, name);
+}
+
 static struct device_node*
 	rsnd_pick_endpoint_node_for_ports(struct device_node *e_ports,
 					  struct device_node *e_port)
diff --git a/sound/soc/renesas/rcar/ctu.c b/sound/soc/renesas/rcar/ctu.c
index 81bba6a1af6e..293b0eec1ded 100644
--- a/sound/soc/renesas/rcar/ctu.c
+++ b/sound/soc/renesas/rcar/ctu.c
@@ -6,7 +6,6 @@
 
 #include "rsnd.h"
 
-#define CTU_NAME_SIZE	16
 #define CTU_NAME "ctu"
 
 /*
@@ -319,7 +318,6 @@ int rsnd_ctu_probe(struct rsnd_priv *priv)
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_ctu *ctu;
 	struct clk *clk;
-	char name[CTU_NAME_SIZE];
 	int i, nr, ret;
 
 	node = rsnd_ctu_of_node(priv);
@@ -350,10 +348,7 @@ int rsnd_ctu_probe(struct rsnd_priv *priv)
 		 * CTU00, CTU01, CTU02, CTU03 => CTU0
 		 * CTU10, CTU11, CTU12, CTU13 => CTU1
 		 */
-		snprintf(name, CTU_NAME_SIZE, "%s.%d",
-			 CTU_NAME, i / 4);
-
-		clk = devm_clk_get(dev, name);
+		clk = rsnd_devm_clk_get_indexed(dev, CTU_NAME, i / 4);
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
 			goto rsnd_ctu_probe_done;
diff --git a/sound/soc/renesas/rcar/dvc.c b/sound/soc/renesas/rcar/dvc.c
index bf7146ceb5f6..26f80d542da8 100644
--- a/sound/soc/renesas/rcar/dvc.c
+++ b/sound/soc/renesas/rcar/dvc.c
@@ -29,7 +29,6 @@
 
 #include "rsnd.h"
 
-#define RSND_DVC_NAME_SIZE	16
 
 #define DVC_NAME "dvc"
 
@@ -327,7 +326,6 @@ int rsnd_dvc_probe(struct rsnd_priv *priv)
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_dvc *dvc;
 	struct clk *clk;
-	char name[RSND_DVC_NAME_SIZE];
 	int i, nr, ret;
 
 	node = rsnd_dvc_of_node(priv);
@@ -354,10 +352,7 @@ int rsnd_dvc_probe(struct rsnd_priv *priv)
 	for_each_child_of_node_scoped(node, np) {
 		dvc = rsnd_dvc_get(priv, i);
 
-		snprintf(name, RSND_DVC_NAME_SIZE, "%s.%d",
-			 DVC_NAME, i);
-
-		clk = devm_clk_get(dev, name);
+		clk = rsnd_devm_clk_get_indexed(dev, DVC_NAME, i);
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
 			goto rsnd_dvc_probe_done;
diff --git a/sound/soc/renesas/rcar/mix.c b/sound/soc/renesas/rcar/mix.c
index 566e9b2a488c..9ffa591aa4a4 100644
--- a/sound/soc/renesas/rcar/mix.c
+++ b/sound/soc/renesas/rcar/mix.c
@@ -32,7 +32,6 @@
 
 #include "rsnd.h"
 
-#define MIX_NAME_SIZE	16
 #define MIX_NAME "mix"
 
 struct rsnd_mix {
@@ -291,7 +290,6 @@ int rsnd_mix_probe(struct rsnd_priv *priv)
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_mix *mix;
 	struct clk *clk;
-	char name[MIX_NAME_SIZE];
 	int i, nr, ret;
 
 	node = rsnd_mix_of_node(priv);
@@ -318,10 +316,7 @@ int rsnd_mix_probe(struct rsnd_priv *priv)
 	for_each_child_of_node_scoped(node, np) {
 		mix = rsnd_mix_get(priv, i);
 
-		snprintf(name, MIX_NAME_SIZE, "%s.%d",
-			 MIX_NAME, i);
-
-		clk = devm_clk_get(dev, name);
+		clk = rsnd_devm_clk_get_indexed(dev, MIX_NAME, i);
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
 			goto rsnd_mix_probe_done;
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 3d419b31cf40..f3f1ad1180f8 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -476,6 +476,25 @@ int rsnd_runtime_is_multi_ssi(struct rsnd_dai_stream *io);
 int rsnd_runtime_is_tdm(struct rsnd_dai_stream *io);
 int rsnd_runtime_is_tdm_split(struct rsnd_dai_stream *io);
 
+/*
+ * Indexed clock and reset name helpers.
+ *
+ * Historically the rsnd driver has looked up per-instance clocks and
+ * resets using dot-separated names (e.g. "ssi.0", "src.0", "adg.ssi.0").
+ * Newer Renesas SoC bindings (RZ/G3E and later) use hyphen-separated
+ * names ("ssi-0", "src-0", ...) to follow the standard Device Tree
+ * naming convention. These helpers look up the hyphenated name first
+ * and transparently fall back to the dotted name, so a single driver
+ * build supports both conventions.
+ */
+struct clk *rsnd_devm_clk_get_indexed(struct device *dev,
+				      const char *base, int index);
+struct clk *rsnd_devm_clk_get_optional_indexed(struct device *dev,
+					       const char *base, int index);
+struct reset_control *
+rsnd_devm_reset_control_get_optional_indexed(struct device *dev,
+					     const char *base, int index);
+
 /*
  * DT
  */
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 8b58cc20e7a8..43abe13137bf 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -39,7 +39,6 @@ struct rsnd_src {
 	int irq;
 };
 
-#define RSND_SRC_NAME_SIZE 16
 
 #define rsnd_src_get(priv, id) ((struct rsnd_src *)(priv->src) + id)
 #define rsnd_src_nr(priv) ((priv)->src_nr)
@@ -715,7 +714,6 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_src *src;
 	struct clk *clk;
-	char name[RSND_SRC_NAME_SIZE];
 	int i, nr, ret;
 
 	node = rsnd_src_of_node(priv);
@@ -750,16 +748,13 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 
 		src = rsnd_src_get(priv, i);
 
-		snprintf(name, RSND_SRC_NAME_SIZE, "%s.%d",
-			 SRC_NAME, i);
-
 		src->irq = irq_of_parse_and_map(np, 0);
 		if (!src->irq) {
 			ret = -EINVAL;
 			goto rsnd_src_probe_done;
 		}
 
-		clk = devm_clk_get(dev, name);
+		clk = rsnd_devm_clk_get_indexed(dev, SRC_NAME, i);
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
 			goto rsnd_src_probe_done;
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index c06cebb36170..cf98cc9ee44c 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -21,7 +21,6 @@
 #include <linux/of_irq.h>
 #include <linux/delay.h>
 #include "rsnd.h"
-#define RSND_SSI_NAME_SIZE 16
 
 /*
  * SSICR
@@ -1163,7 +1162,6 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 	struct rsnd_mod_ops *ops;
 	struct clk *clk;
 	struct rsnd_ssi *ssi;
-	char name[RSND_SSI_NAME_SIZE];
 	int i, nr, ret;
 
 	node = rsnd_ssi_of_node(priv);
@@ -1198,10 +1196,7 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 
 		ssi = rsnd_ssi_get(priv, i);
 
-		snprintf(name, RSND_SSI_NAME_SIZE, "%s.%d",
-			 SSI_NAME, i);
-
-		clk = devm_clk_get(dev, name);
+		clk = rsnd_devm_clk_get_indexed(dev, SSI_NAME, i);
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
 			goto rsnd_ssi_probe_done;
-- 
2.25.1


