Return-Path: <linux-renesas-soc+bounces-32507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKr4LAJyA2q55wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:31:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE13527B2A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14F6530E80B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC1238886C;
	Tue, 12 May 2026 18:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XiMhV6K3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD34F386557;
	Tue, 12 May 2026 18:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610493; cv=fail; b=WEbhTwrka2GugXhNyJgE6U0X1CfQoYF8U09ggryQy2pfFFRHxW5KxXpQMttwtyw9n/JZWTMlHXHiSC+1aS1hwEsbgoQLYXZRX+pHFUcuBRhvmiPAx54HieT1Onxr2RKumk+aEhTu0k27WCfEn28UyMKsKtHs4ipvFFXO63JqoNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610493; c=relaxed/simple;
	bh=SgqqiMyAduDBn8adFs/s3qGvMra+yWyd0F5KjDv4BPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eRBbeNe/YvLGEXN8O6SdsYRTzgIOLYmrgnNQKtQtIaRYAGXIEqd53HyHg7aRfpAgY7X7UI0c1hQXcqJFJxjUKudp2N39l09Do1ju+Iz/JE5mXyXGXUSJXPI1VuowSSakkh75yKc8wFkV1k53mLvYBvZ+2D70XOrCDw92WgzhvUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XiMhV6K3; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+ib44xSOnNWM2WwVF+l4da5ASv+T7Zz7pgPCQcUV76Dp1PH3/SWx9Vstn4xy46D+hPhW/5WSXBKa+IEbvD0ZEVhpQ43hUe5mZ6KihPs0a1Jq6a18Zm2rpLeM85ccfGksiE1RufKSlXYcxZy9GPuAPAA7haeSq1k7GH+N7yC46dwz63i7ddi5Dkuj2hEdKl/7XFaRtn8ddQe1KjvgjXJY8vhM8fFR9+jRYFTzGjoonlL9KvgAVeDGRSafjCma5adBI312sXNkicMCF3oHP8l6mx189Sm3bQc+Yje4CruEj99eUI9V5DgYHxfj9QISLvSHGyRwGTlf3ZhR9PFuV4iVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmNtBuCCwcBYBX26iaYAM6VlufsSNeAsYowWDRMdyeo=;
 b=F7aCGH+DIIIylGkmcvEJMI1NDuD3YeqVCpm4qxwmw2qvFIlcUDLz36/dOoZZ9RgKmtHNHm03BbImkFDuk8w01uPHiQml/7lUigdP4mRL3AMIxvafdHmBMFYB4clv6g2dBAmbuVZvtTFQRKacwy954s/sftyaHSEUYGiidX6st1PP/J3nKMOZt7hnuFK3/labr1n4psSWr9eYv7gXx15OS+bvDzHrWp6Iqum/N6gmAuRiAbMvsG2jGByIcFGSk6SZ0zod4tPL2OVgvoucxZoKYBL/79GoBZc5s4ynfxPc2t4T1FNZWQmqzuBXnJyV1OmTvjewLg4yrXuVOEw1ljMP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmNtBuCCwcBYBX26iaYAM6VlufsSNeAsYowWDRMdyeo=;
 b=XiMhV6K3vFWiUwLSpJzRghWyZ7Lf8IcYp94t/rSEq6k1k/3AL6whA8HrQK3G9dMIYp0h468F58PizCmO3aVFAvHcj1mxJRe7IWF66ec5eoWKrHys0Jryyz5LtC50Dd6cKZOMqAyzQ43NRSu5y89PiPeNaOxHyRlyK910KjdDoys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB8431.jpnprd01.prod.outlook.com (2603:1096:400:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 18:28:09 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:28:09 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH v6 04/16] ASoC: rsnd: Support hyphen or dot in indexed clock and reset names
Date: Tue, 12 May 2026 18:26:19 +0000
Message-Id: <20260512182631.3842065-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0192.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::17) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TYWPR01MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee0793b-5152-4107-39f5-08deb05437b9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|18002099003|22082099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Qb5rS126EMneZTeqkSldvwh62ngUL5BZBtJJXr5LuK4Y9c4h59w7PjyvktqVc4yhl+qVCIzz3mv5paIoUCFEJBHUWlmA1Iwo8KxkF30jhZ7UztpA+4dSLQHG5C12DgRkL3VdjrP2lSEyHhR9cBLCbbgtHANO549q8ke/VOY9rF0ggwiYVj3cosmNFY8SG5KbpyauR44IaUMlS6IiyEZnWM4Wb/TcXD3KyZBl+ng5YD1maRkAD1jjK/wOtePvDOTtSFJ7Rg+PXh2e+hcOIjxiO6uTU+APoHxO5ks3wXLE4m+w8TwOSFcDWtRnqZ9YF80ruO1x/uV7GvB1//47Sh4tqpEfgeQN6ipqnDSjdQBgaE29WvY21EhqNkHUJZrMdogy15qEoxLh4m6eeFHYkbg1jaf017SaAGZfGsDORDRdC72jZMyiHqnGlC7FXrom3nx6RYmbzGwNFQcLGlNJyQ4xhkCa2a4bEgm5kJ9/7AFftgI6oQB9WUyiQCwgsNPd4TZWJ+m57icxPemWyr3j35wnjTDvcBTsOuBq9WKz3HJhx8cYBgwQpMU0ZEks06W3HIGGK6jc1OdM+ItV9YBzEn62IVdpoXFJjhP1upzMcB5rsst6zW3+ewrBr1hSO4D8S1zTwewTMMBkiQpxvyOzs6LxB1h+8nPEnOsxsvpK6cIdKb9nQF6UbdVHvyUynFV8Oo0PWhquP/1vMogbZKdYDPZm1z3TWHQ3t592yo9seqEBsV35Q/GJdCCkov0/hB27DAUP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oP09zAD2MOQ7C9JFbn5mCiO1HZ17u+97OZeXriAYHX06Tz19oX027XXeeDX8?=
 =?us-ascii?Q?yj/RhRW/eNLdlzSm9GdEMOwzGDx/WCzlCvUDA8Z2nSjRhBgdy3a6TB6EAyPH?=
 =?us-ascii?Q?OQiR2CDua6pVTtKTMZ9f6WGG0AUSGHFW/le1L6wbjDy3fRd+DJ8ZZYFoj3ch?=
 =?us-ascii?Q?XyYb9n7m1Ad6jMQTF6T5jP8BNTUfy3BIUe5meq9J1XrThDyMP1Jl3XY5c9Ga?=
 =?us-ascii?Q?iiHMFBs28iaw4PfXh8iKdRh6lMkQSOWQMIBJuUE1enEZJ4DahWl2mLIEVNTZ?=
 =?us-ascii?Q?gE3yYQ1yg5wmlqWoq0JvreywyW7LVbqv91N36csyM+ljPdF5drg4z/fbVl+8?=
 =?us-ascii?Q?esl3wOmjZ/FllDr3b7H9QBjKVdHd3itHjMXAqVVOUE+/Jc0Z8AD4zkFWd94w?=
 =?us-ascii?Q?QOcIM+84Y4ausXQ70iUk6zV7sVzQrD86ZJlGAG9ax/jzynD0jgXRksg9dEvb?=
 =?us-ascii?Q?68AuHMNgp+aJ77qrj8FPbIIMGoyQE+m2TCUN7lUonk9QSIi1nryhZXMdyJuB?=
 =?us-ascii?Q?S+A5M86UieRDetVHHsJsknFpNyX+lbkgrRUANEj8hhYwNKkSU5fox491DqRI?=
 =?us-ascii?Q?XsoTIH6gXKjdOEQyZDEoPO1tql4dYBj0QufBMME0zsZpVcfjJFs2tyT7VQfr?=
 =?us-ascii?Q?Ilbxm/2pgaqANyuRcbTcR0m/T+Hp+/ITYQvuLGtDKbvqehbQFGiuaTyabtic?=
 =?us-ascii?Q?29eIBDV0x4sPII+r+R8oZFZkJDhhufutuDXHdMBHfLxcwdOVY4zWG2wj7su+?=
 =?us-ascii?Q?6sH0lXLBy1G8CQdfUAVWTosx+pVeDj68x4BeAqDI0R0E+yvSKyp4tb9yJAHw?=
 =?us-ascii?Q?vEertj3Mdt9QnIsTrT7JCNSsQscaljLGFwMKk7CdOS8uD53uxidpbksvpOrn?=
 =?us-ascii?Q?K+plITZDQ3uHcd94eKHtZpsE1xMd+VGRCcdg5jJKPpMHN+a0iGGSd8YrZsSo?=
 =?us-ascii?Q?YJb955NTNjt2EBnoLFoxk2qHg3/xgRFrVwmtcbLicw13v6Jh8oJCD+x0id5C?=
 =?us-ascii?Q?nPK3IF1q5K2aZaDoBXYP8owah5tVwDiaBknF1IcFRHbvOvWzuilXWeFJO7SA?=
 =?us-ascii?Q?Vly88cOtQ4h+OC6R3IGbwzAU2Mepq1EyJLc5aAnkTPm+15tq4/gCfH4H5D14?=
 =?us-ascii?Q?zTENaVFci+hCzq4y//rzSHck79p3BGXScSpgV+cjvPrP+KsYXJFnPdeuqhZR?=
 =?us-ascii?Q?KWaGInnO3sZjxljvRQRrDKiMO/sDcSH8S1dA51ouP6TNjwJpuFm6oCZDUdX8?=
 =?us-ascii?Q?24crJdHLdHZsoE51m84TfiLwkmVFfvS6SyhAAs1UNQfcaXgzVUFKvTwA/Lu/?=
 =?us-ascii?Q?dFxiVy/DMw0YI1UOcJh4r5eH3gVpsuBPfVFE7tFOZJZvAtwGTEjPzfm3XseD?=
 =?us-ascii?Q?f8iv80zqwVh4MrSE1ba5v/nmIYhCptRfhkWT3nhOa25NB1Ibombsl9Xk1U3f?=
 =?us-ascii?Q?k39NOg4uhgCjPGevFi2AOGY89faqXM4akVp0SiekaTRYeLEZHpYWD1+I78zX?=
 =?us-ascii?Q?b7BJu4xizq0Ewo2XkPzQsAZtYDnR+xeXbi2onvwLFYLy8JVEE+I2TLoMauE8?=
 =?us-ascii?Q?jbBIdaZ5A6YzbclNPF8850Thr6BEja9UBavFo22iZiPib2R2YMoVQxz0yob5?=
 =?us-ascii?Q?c6zo5yo/20Wncq2cTQi2JDu/9H2WslIhbW+uTghWTIXDsonu3widrZ3iZALk?=
 =?us-ascii?Q?HGbuR8Cmfp5MX4YybJOgo73WD/N3yUgbou8Z4eLz4O6rQTmdRrUWvlcmaGoU?=
 =?us-ascii?Q?o1s8/IgETfLkceHl5vfRNQxZXxjjAXg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee0793b-5152-4107-39f5-08deb05437b9
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:28:09.4829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3PXZk/qwMV+UiBT9dD5beKXzyqaBG2+yQgLC8GQBt18VJ3VwUqFWUD9fzjlBSKasjOV4vfmTI7q7T9SDVAXXhUztkNfzFeDnMMigETvAz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8431
X-Rspamd-Queue-Id: 2DE13527B2A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32507-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,glider.be,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

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
index c3c139a6fc60..5f3841565d49 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1233,6 +1233,73 @@ int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name
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
+ * On ENODEV from the hyphen form, the dot form is tried. All other errors
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


