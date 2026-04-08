Return-Path: <linux-renesas-soc+bounces-30993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kALuJKcy1mn1BwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:49:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 908693BAEAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03A0F3090DB5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488E13BA246;
	Wed,  8 Apr 2026 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Gm5AMz7P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0803BA245;
	Wed,  8 Apr 2026 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644836; cv=fail; b=lpnOibPgzUGZ/skAOT9WR+ddjg3dQyiO6hjbwyNq86i4zsaIVZ+yBynjZY98FIOqvXZ+e95Puzxn/6D9YDftDEncJPmF+2NtZ6hCJB+url6oRneLqGVfyoMgcFord4qcYlko0uFZyGY/xkaHl6fxtYEXFqgIxaVFVd4uAXAwmK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644836; c=relaxed/simple;
	bh=ajQjXCJOQta+xFxDzvXXlfe9EgZtFD7VVbayyWed+mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p+6mcOHCGnbAYriEtK8wDIkray0MXKykxmjYMEAKoVK+HOdI1G87d6elFND4ZXc0eBDufOxwYIhHCiOp6xDHMUeoSQYpjTP3GwE/imVJBadYe4qLRtU0E0DkLiKSJD0ua5OOOlNIZBcnwa+3redEggkSiUb+rr3RYcydRKxQYC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Gm5AMz7P; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxHyYAsYalx8CxzkP8S9ZY0cBN+4kbIN8rZzNZPytAJoIdptg2w1AkFMfJMJor+9EhTigjBlF7Wwrxi1SosjMlZ6FWGhV0Ib6N/jMY1fe1Ln6GKxBwXUuvcOcvqtS6diuk19Mjp79tBrtaby/sQP5C7lpBKCTphevVqrsjE+kWuJ2DN5aL+N0SHFX5Gc+6fQZtea/4VuNW/0CS28xbY2vXZfmYBJeb5jH/DyJw04Th3aq2jAJLvftmlhyuPeAgg+crdnRWJgeuiOM2asquUxkf5q21UXnP99YEKNI8d52XsbNDH+/izO1b9Atzkvs5R8JZKHyIACUVXzLXRHmLRXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t20gaT2D3ThJAJLcn+CTxAN47QofJ6Dya/VeLvznaKE=;
 b=r9OWA2U6zsLMa02A1nxEOWAWn1Bz8DwTIS8BXhXhAk2QovbakZDWb/57okY1eJSG+4aqaLlvF7ozrIERwnp6OwM7XpRHdGlSCGSAtzdkiX9IG7uVhbE4lxquHe8CPmUdO5GZxfZDB8ry4n5mOgty/xBS3hYCuyGSRCz5vCLx8Qn1YzRapmHxrWuEs6NPX9uAFQDBg1Kr4p4QP2ARQ0137+lrgKKXZJGHPN5v42JopVScRyPW3PSwcCnpd5JCwIY88bS1Ge2u5kR3YRzm9Zyg3ugXQJQ01DWyEV0j7t48f6eyXftj/cfOPWeiM/0sesGnx4P35fGdrsMg2KULdOPZ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t20gaT2D3ThJAJLcn+CTxAN47QofJ6Dya/VeLvznaKE=;
 b=Gm5AMz7Pu6ozyYpGa0EVur1b2HQeppxjxtyq7NWUNnLNAjyeZY4mJTuxkjhJPQgcKn9bhRrza/cM+VsAd/5+Xt7ua/skbKrcpl5LtqBCrg6cg8IyOEV6MboRc1/kuX1zEcdnV3OFMoHQfnLsTDE+xBky8wKKjcdYAFIp9d/r+Ls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYVPR01MB11293.jpnprd01.prod.outlook.com (2603:1096:400:367::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 10:40:31 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:40:31 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v6 20/21] arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
Date: Wed,  8 Apr 2026 12:37:05 +0200
Message-ID: <ca31352b03689fa9902660be5cb4d0972ce04304.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYVPR01MB11293:EE_
X-MS-Office365-Filtering-Correlation-Id: a039f904-7aec-45f3-0c3e-08de955b4182
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 /2uyP2BEpOUXz17up/u4Ni6xl03uaqshmdMe21K8YZSlAwpImIgNJJ+Mo5IGHh8tws5Y2umZMM9+ddQx0TBBTrnjtMTgOowflesS+WdkXxzb2zK1rlF9XSqPBCL/+En0//PmEj/nZ+NiQGbq2xT2ina1e1J2J6gr917Lx0gebE/FMULtDyT1YYu1kAzByG6pYIH4DZ1dS3KcHmK9rM5oU4biKjvysS8+f14gXx33qw6NKxvYNwehzera9EBWXOKCWlNcd+3CpJwXb2cSTBm1IFObft7hIrZTX1lHAXB0TqV6CNMg2X19gBuxC0xQq5B6OVR9F7g/oBS3AV3KbvYQpMFX5JOE9f5QHTK26dkbscQNvYwi1RYpt6AHT7UwXRLOcvKMiyfF3t6cXDcP+VUyuEXbFmdMuMTNKPTtanrwq2gJ49xQlIcf4DJcjYSTLwRgg1Nu/IBnkUJiaQneCcLNXWS4sIXwLw9gGp48Dw3SQ+nPtYNtzaw4fwYcI8XN5unFIIPLufZ8Q3McW7XEscqUSiZ/duyC7uo5uqE/HskoRNlro5tfCG7+oXGBQy+DiJ3/Kn7BgbgTqiBkmbAL3YvjZj7f6Jt+9e5bCDCOgv8Eq1HqSrih9cwJHBbQVWRR16b4wYkSMdHTNp4JAymBA/aWI9xI1cX3g+lPs8kNkNJAXXlwJ5jmZ3gXkzUTbtnV9XzTiNg8t2sJEr1eIraPv52QcK4kWu+5uzsay9S2q9BouY5k0/Ip6Dv5zA1d5nxkbjhBbIH6rAqxW6CApqv6HxT69ivhixwCshASL4xUgZpIY1M=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?PkbkfSY2A9QDR+KwJd7OiYlv+matKiMiuFO3aY1wBnVB1494sv58tR8StSzv?=
 =?us-ascii?Q?aTWAXGSidRxVD5h7C0FkBTyr0SDQPgajAmQXgIVQl7WMeLucKFvC0Fk7S8iC?=
 =?us-ascii?Q?aWG98BzgAr/RkUs0fasE3UXSWgKoZEiDc2OwYFKa0zzKqRCFdmlinUxV4Xnv?=
 =?us-ascii?Q?2O1yCtSJvIB54fT1VswbNS5iNK7Uu6b0gJvMMIRq4QGGljrN17o2RRT9f0d6?=
 =?us-ascii?Q?mkKJ7xSRZloTgFK2gR7gg9DrB/LnQP7KfGqAkqX4S9/lbRaN/2IlUrbc+5xt?=
 =?us-ascii?Q?WbGjXJbQ5LykWDCCZfeyJJbbJbZ8bjONB3VdG7sZw3plFbd4eoRRaU8qHoCK?=
 =?us-ascii?Q?mBD0qVX2OLLN1xBqAmXDFOA/nEPgynYmA/dKd9u8Po/F11VZmfUZmEdIhBkQ?=
 =?us-ascii?Q?dxCeT4qK6WjmErXI29GXnGm+rtKITzdfY9owQInMi4dxqFidwE4mmHqviCUz?=
 =?us-ascii?Q?IgfYwWE4nJq/33FMtRMIx/vC+Aun/pHEWPRnZOmTSQSIv+ksSVGbklaMIsPn?=
 =?us-ascii?Q?aUSFkTHvSTeFEHHZgZlwKNoJrTOkhvFGRpnFV7yLYAj3RzFOLT5FmPPZWaj1?=
 =?us-ascii?Q?oBCB+BDKp0/IyhLK5hhQM/OvZk1/sskog/yUi0RBwoMHiwS81WoO+SZbmrWW?=
 =?us-ascii?Q?WYQb7BFOIY+Ag2xJ6iesOUfcAr0/BR0bh7ys10E5024bsUCo9EA7LAyGswda?=
 =?us-ascii?Q?V+mfZGxIMEOa2M6HzFaWKJHakty3gIyc9yLVSaamz9k8oMU9LaTxooNbh09S?=
 =?us-ascii?Q?3n4Bc6LcVnCb2haGDJXqr10fhVw2jG1aTiRnYROg0iG1Taq+fCgyPH7kaA2j?=
 =?us-ascii?Q?uhThFv1HXnqi0IYheztoZi720mQa8mZqhGRsFquq6a/GaU6fpkjk+ERsvg0R?=
 =?us-ascii?Q?4jvvq7TzBprooUlPftrjz6goreCXC4XeHK2H+NK0jJjfFMG7sajeDHLH48BF?=
 =?us-ascii?Q?Vo/fi0C4BOfQ+fS1CmOqN+lGK0jaHMkCJg3UPr3DANx1I4BRtRAIjDyEI5y2?=
 =?us-ascii?Q?MjG7sJ/gJckeAqlmosTDQG62vvaaJkUwSB//IErQ3PdeGzzd1iNrblbdfnvP?=
 =?us-ascii?Q?z71YXwZheAL4gIx9cXXkzSoEPIUCjM5//HMGT00IdYQbQxAj1qSdueRUokZa?=
 =?us-ascii?Q?KgLRqy0aQu2oEzTN6QqRjfvUSJ+iK2JcASe7vlDdFYDuQgBwEe4qU5z/iwA5?=
 =?us-ascii?Q?uWt/0Xkrp2SFF6ohkl+q7yr1KoE2fuX1DO510Hv9fd1Vq18+INtOeQPkfEpl?=
 =?us-ascii?Q?R+Y8uEZefUCJqpRrKoWpLyLLgIgb5q2abempUF6l+Xv/Y7e6VEB8QLr1WnBC?=
 =?us-ascii?Q?7ExLSFFbBXJuFk5WZ6EjHeuS9bDJ3vGOAqz3XidBjIjCbCFfqF/jQSofrGel?=
 =?us-ascii?Q?N1H6f4iI7nYVtzGumGsO+IqvSb2xr1b09zANz5dMNGyUTXd1HSwWr8SpgSHv?=
 =?us-ascii?Q?LGpZCfda3JacUhGeqDbB0b3MInnAvs99J5BDJNPZVR9GkmMM95hFXl+WMyAl?=
 =?us-ascii?Q?SlkLiTI18+brO5mL4WuUKFFTwna4MFO4Xhg2//JCLhfyDOituLbhJksqGdKp?=
 =?us-ascii?Q?//YxljmHL8kV25skXkBx68XulW/dxunP930rT/UAClUszV3y7UATC3U0FOSj?=
 =?us-ascii?Q?sr1H0M0KhJx7Ov6N7N1Xf7NxQSz3aUvvuQ6uxLQNCVfrQC1iNt81YzuSTU5a?=
 =?us-ascii?Q?Q9Mn0bm+nOWR2xNjVS9sSVBFhvMgfy4CBFbFdFzlqEB8A9kWyD1nCSv3UWzX?=
 =?us-ascii?Q?BUDP6Tpx+Eq0fS8D4/uw7sd+7k+GsJxsna8kdweXudLm8SFcrXSA?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a039f904-7aec-45f3-0c3e-08de955b4182
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:40:31.0819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0TpaG+82yjsm3sXxD0LGauLaA1Hoz84O4FiBsozL5EDM5qlwlxPwB/KC/AxNvk+qACrFo7zRvRFHAz7larZiIEgWzboTSgPOZP4nKGiRQnYOb70YRYCkvZbO4shWFrF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11293
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30993-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.3:email,0.0.0.2:email,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 908693BAEAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add DU0, DU1, DSI nodes to RZ/RZG3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - Update ports numbering accordingly to the latest DT bindings.

v4->v5:
 - Rename du0_out_dsi0 into du0_out_dsi.
 - Rename du1_out_dsi0 into du1_out_dsi.
 - Drop renesas,id entry from DU nodes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Use single compatible string instead of multiple compatible strings
   for the two DU instances, leveraging a 'renesas,id' property to
   differentiate between DU0 and DU1.
 - Use vclk instead of vclk1 for DSI Node and set to the right position.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index f2fdaadd9d39..25d3a503a6cc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1585,6 +1585,126 @@ csi2cru: endpoint@0 {
 			};
 		};
 
+		dsi: dsi@16430000 {
+			compatible = "renesas,r9a09g047-mipi-dsi";
+			reg = <0 0x16430000 0 0x20000>;
+			interrupts = <GIC_SPI 874 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 876 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 877 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 878 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 879 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 880 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "seq0", "seq1", "vin1", "rcv",
+					  "ferr", "ppi", "debug";
+			clocks = <&cpg CPG_MOD 0xec>, <&cpg CPG_MOD 0xe9>,
+				 <&cpg CPG_MOD 0xe8>, <&cpg CPG_MOD 0xea>,
+				 <&cpg CPG_MOD 0x190>, <&cpg CPG_MOD 0xeb>;
+			clock-names = "pllrefclk", "aclk", "pclk", "vclk",
+				      "lpclk", "vclk2";
+			resets = <&cpg 0xd8>, <&cpg 0xd7>;
+			reset-names = "arst", "prst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_in1: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					dsi_out: endpoint {
+					};
+				};
+			};
+		};
+
+		du0: display@16460000 {
+			compatible = "renesas,r9a09g047-du";
+			reg = <0 0x16460000 0 0x10000>;
+			interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdc>;
+			renesas,vsps = <&vspd0 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du0_out_dsi: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					du0_out_lvds0: endpoint {
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					du0_out_lvds1: endpoint {
+					};
+				};
+			};
+		};
+
+		du1: display@16490000 {
+			compatible = "renesas,r9a09g047-du";
+			reg = <0 0x16490000 0 0x10000>;
+			interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x11e>;
+			renesas,vsps = <&vspd1 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du1_out_dsi: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					du1_out_rgb: endpoint {
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					du1_out_lvds1: endpoint {
+					};
+				};
+			};
+		};
+
 		fcpvd0: fcp@16470000 {
 			compatible = "renesas,r9a09g047-fcpvd",
 				     "renesas,fcpv";
-- 
2.43.0


