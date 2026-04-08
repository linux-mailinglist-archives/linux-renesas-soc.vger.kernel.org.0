Return-Path: <linux-renesas-soc+bounces-30973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKd7AQQw1mlZBwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:37:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FE03BAA28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD1D63003608
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2DD377558;
	Wed,  8 Apr 2026 10:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BThh7p+d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593BF2D9EDC;
	Wed,  8 Apr 2026 10:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644672; cv=fail; b=Id7CscNwe61b5yqRxoJKNyXoD3wX4zf64gQydUq4tib6OerFKMq6bZDb3+LKsq+BnwWGyPo0W/iTAmEtuLn/AJ1QDvb5pAOrr2cOSowOqwkkKS0JOiPLhgFubTYujN1LLmDePC8GVvaZ5aFPFeCEDRSeLLYtuANMIhTPJLUUyTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644672; c=relaxed/simple;
	bh=3Qqtk+cgRv36gCkrR/iYKxfUAdNAwvsrmklN3xokJvw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sGxG5Gg5HoQKhtX+5831klQ7dPMwndBROD682hZPapIuIfzKojyMft4IgdFGfPlRFFD66tbVrChVZb5cFGeorBoMJINrGoIEmSTqCW+mjFwNnHhotGfY+ycDEOLJoKq8/BIsdlz4oAuBqN3B9A+nHybSQR9mBV5vTIVWri+O16o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BThh7p+d; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etqFBYLb58ZZTJXzAU3aXNzRvNp+LAm3reC+3GHn0RMEeYpldOcTf4YO6TJMHrR+IUqIiowRXz4Cl5j8k8wBjpHheS3CyMygniYzBi1OLyzgfIZ0oY7cDSpZWRLfY1893gmULGSrQ0T75CYX8DX9zZj9I5YgWWPKwOvZdWcvQ71TYrvosHjSM7zS+iCik8ygfQPWTehqpBnuEtxT5tmvqwaGJw71+2/pSVLA1eiz5ZPoRYZ1YqSi/aJHyp35Fs1mIH0sCkAnvzv3SH094rDz5Fx6OljphRLTfRa7y/g7NmLHGbzwedlOoBSU99ubyW857yZaegeOu7LZfASYYFB+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eW19/+Wox3LjFxbrBU3q+T/9DNO5Ilv/N4mUQYCMCoo=;
 b=uvA+H9GkQtOan5z63e6EMSluAPqN/SFfEj77ad4RqbR6sFFeVPOrZP8eSs3z6NbbD+ldxj8MreGT+a4XHiMp4NcXW7+MaW3HrY/s77xGAm6aGFb6/RWjXzmxVMno9reL/rt6tJgG5uyT3f/Pp/Kt+b5SE4Pj4Eqfhr1juf5sfql77scBd8gixxniLabZV3Ii6jhTvIQCTJPwMFGFdZg29p/UxNXcAJSrU6KWT7ByVj8fgF6/DC02I9WjGlAjpmCFEBFQZK287eHw+/He7X7I+0SzJ5Xd5yYht3wrloQUmSWZ/C+gFFqw7/VO4rYY7XpmzQ7VFrV/cCTDMu3i0lioTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW19/+Wox3LjFxbrBU3q+T/9DNO5Ilv/N4mUQYCMCoo=;
 b=BThh7p+dEkVNXWwLQ61k6pJyiiejwWYkzBEFZMtejwFSsmnxMIUo35X8iKev+LdxeuvO0+elb4i68XnkogFHfvUj/DjgYZEQyUE7xhwoj161UHycH3lhgFGKNSQ23+VjhVCUxr5vjdONIeiu1VUaQ2Rj/Nx5cAeeFM41u3VNs00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB13668.jpnprd01.prod.outlook.com (2603:1096:604:35d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 10:37:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:37:47 +0000
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
Subject: [PATCH v6 00/21] Add support for DU and DSI on the Renesas RZ/G3E SoC
Date: Wed,  8 Apr 2026 12:36:45 +0200
Message-ID: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB13668:EE_
X-MS-Office365-Filtering-Correlation-Id: f7321b02-aeb8-41ab-867c-08de955adfdc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
 l/SDHQNCqzAr3aOiMVckoHCdph12gmx8HjFDYlJweOZKXHpDtTyHgwB4QpOHlj6ttT7gGS0ASI4/xcBQWx73KAT2jMpmqNBzuno2YObaIpsTsMTg7OZR+qtOb6sFoXrAJjWf1C1j8MjoPb2Siv8C2EJ5OatwEEkBRbLmt7T542NpB4wNEEa/JDpDyN/rEULzQDIFRa7pokmGnUcNlto+6lAvXJE6vbNuz5fvtY/yEc9yD8qfFQhkW80T3LMwqmX7OgrbAYgGInNVvucsm5lN1PAwZB77m2p0Cu1htGETuups5iyzwI9DnA5spGOOdZaNCskAnBjmRYmpXmWA9yp9lY0ZfedqpgJrNSLOzLRtl8HUMHZtrN9YEPVHm6J41LS5QXHK+oUcdEJm3OH/8gb7OIxXu0hGNxel9++OPilCvOxOYZaShDk34JB11X/Bno8MRPBahveQWx2ZP57dvMIlczLDNdBgYXp0ySS1T6bmYBG6N3ZkVFKZgmtGCDImv1BCcXM4Oz7U+MK/0shggPCGEFsH7kyTpjJpG+CAvsLoW+RVfrJSORM6k9Src5paX+DrwriTygRpVU0jXN/kE7GFhjTQS5eoAkYRazIyQhVudNWLk+pmtkg4X+AtQBJ6TgU3ew1+TUIc8nq6mal1rmVFkEsLUM7KqiydwIkJRUg04Ajrtasre8Qz+AO7S6gjxAAshpeHUZpamFCUl6fod87fU+aMJ10YnA28Mv0k7fgrwZLS4MbWD/bhxYv1Ap1vzasRrFJ3nUCjjd89unL1TY4kqLvlmrLE576Y/eFUVSzCThM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?eyoKOqd9AAAG65cZ3ZbqniWFmePMXqKwLBfir/IGTgOfhhFbgbfC+GhtbokO?=
 =?us-ascii?Q?50EaoBh162OjfMVZW0boULVt2a/X7EtysFvss3FOJKq4LfEqRa7g4nlg1XNR?=
 =?us-ascii?Q?ldGTGL7+WIn3mNbVXqwTxPBNVq/rvV/rOv4zCplVwqiX4IgzJ8XlIBsYweb8?=
 =?us-ascii?Q?K1mB73irSstam0ZjHf1okLChq3Iot6NYbrFEWLiEaPKEwwaDwZ0OkEnFLoTQ?=
 =?us-ascii?Q?48CHVGgrKh/CxBQ+jg0A2VXeJjTmK/IhaPwgHWUh/tgGp+xtwk9VLrVd1FcS?=
 =?us-ascii?Q?Qb9dUwz4RBUsVDdjvMC9LeLDqlwc1WWCTX1Ep0Uw79Gxl/8lo2x2zjmqPZHv?=
 =?us-ascii?Q?sm8EMq1ehoDWUj7uX274RVNzuO/O7m5gGE1txVX7T5ACCdYI1sOhmxk4c9Q9?=
 =?us-ascii?Q?+VxocOkZVmCXvpygh+MZGn2sHg+hZAv34oDXCO9dbvZY1AUSa+qJ2DhkJ/KM?=
 =?us-ascii?Q?jLrWLBCdZ0l/GU3Spi1RWnfriZ8B5okm0WqA9Dg0HgMQlr6xanuz3R01ZybB?=
 =?us-ascii?Q?Z4WpBvlEeAPqmwsNj+TVSivTrFHDWR3dD+1k4RdyLPaLWL3zJMa8n0eTUpR+?=
 =?us-ascii?Q?YbO5eGHQXZHzuxBQxPCTlQSS7Y7sud98GNxSoehBX2A06tPRyap+GP9/zILc?=
 =?us-ascii?Q?8rJeG80lkETXetmgK0+pORm17TKM/ARHO1HipjiM7dMVVBv9nAiRkySLxKYe?=
 =?us-ascii?Q?9gwqMA7FO6b40eLLnnxvyzuqRQVM42DH1TjZStA7hxnq0v8eu1ta66HUpnaF?=
 =?us-ascii?Q?9jQGznvti7EhkFID11tVuIK1rloCbuvtqjlePHMdHeIR+hfIGM04iww2oePn?=
 =?us-ascii?Q?lgH80K7E+qDU5cWIWYOJQgOZzBp+vZVsk+fXmNaDiLXLZ0NJ3e7XxYB5pRx6?=
 =?us-ascii?Q?RAp1yYx7LzjRcwieSKazPrZ92k50Bfn3rQ9n3xhfRbYkarhrwDa4qVBCcAsW?=
 =?us-ascii?Q?GMwswwyPeWa4KHJShe2JrwkcI89IRqztLgsiTEdx6SrMnO+n8jIdMyOhUdNl?=
 =?us-ascii?Q?paBTVNp5J7tEsDtGiFj3dvvRj+WdBDZNpGqbwOGgFfai4bbt68wu26QWNd1r?=
 =?us-ascii?Q?dYjfS877xI376sUfLPbGK3KjqC5YuTAgSdrw7H5z0u0uJrjUG3hu7OFCN5Sd?=
 =?us-ascii?Q?xbJQ3BSydX2dEQ+lGpT5IPG/EqFP8EYEgzDuziSgPmopvNAxX/cm/ScT3ATg?=
 =?us-ascii?Q?o4d+oxKHPWiIiJFF232MZ0sZQmv4MwjKm+ESGup9JPd2TTZw05j/rM5ufwYM?=
 =?us-ascii?Q?0UTutMZxjroKRRWQV4UG6Oy6bkNVlgKjNahagbKlX7gnmQJhIU5t6RmeM0yA?=
 =?us-ascii?Q?ClueQ4h7iFqnJowFAJP3ONUSxNqCM8e3IpNO91HJr+bsp4Mxx0SftyOkX6No?=
 =?us-ascii?Q?gspM0lciT9EpAMElpAtsZsx6R4Nb0V8dRbVjmLtlDl3BJN0W/Czi1djDFeRM?=
 =?us-ascii?Q?rbhxRp/KkVo+GF1IS2OTGdjIwTzQ2oFoJyq86D7d9/NuiqrxRbC/HDQdCbJj?=
 =?us-ascii?Q?axIu6HXHuwyQ0RBLH4tUVJy5JK9tIZUsgGtDNjFPXR3iEYLuY5pQUucvH5ow?=
 =?us-ascii?Q?RczbHsA7dJE5XlZ1UNWrpkl+NRPCDJgeV5qR8hdH9Eq8CR4KR+G3jC14oduE?=
 =?us-ascii?Q?HdM509lHT8t5I3z0xN+LPkCxOnNIqBv72q6cGFnFbXrCQA3iOUmSLT7J4Us1?=
 =?us-ascii?Q?8D4X8w4b88I6OQbFQWqu0xVizHTod/ae5P9Y/0AMNoGYiBv6WA5zriXmQcfR?=
 =?us-ascii?Q?T0s8iJEkhqblVNYQJ0Wy0DVkRU71c3y3xAKmH4tYaaj85aO9wf5S?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7321b02-aeb8-41ab-867c-08de955adfdc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:37:47.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6OlbEh8FLWn73HhsWrHue6SOsGoBA4MImOCBf6Y2EUP0Lt96uCvNwNuuOWbLuRDh7LPiPTsgJ+7vQ55g5z3Es5nizpVO3IaWq6L8CVGwAJ0TZnL027gTYHSqWVUKICy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13668
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30973-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.3:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: 39FE03BAA28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear All,

This patch series adds support for the 2 Display Units (DUs) and MIPI DSI
interface found on the Renesas RZ/G3E SoC.

RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
and Display Unit (DU).

LCDC0 is connected to LVDS (single or dual channel) and DSI.
LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).

Thanks & Regards,
Tommaso

v5->v6:
 - Rebased on top of next-20260406
 - PATCH 1: Fixed rzv2h_cpg_plldsi_smux_clk_register() removed u8 width, mask
   variables and replaced with direct use of smux.width and clk_div_mask(smux.width).
 - PATCH 9: New patch.
 - PATCH 10: Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" and
   explicitly disable port@2 and port@3 for existing SoCs that do not expose
   them. Reworked ports numbering + improved/fixed ports descriptions in the
   bindings documentation. Improved commit body.
 - PATCH 15: Aligned ports numbering with the bindings changes.
 - PATCH 20: Update ports numbering accordingly to the latest DT bindings.

v4->v5:
 - Rebased on top of next-20260211
 - PATCH 9: Dropped renesas,id property.
 - PATCH 10: Collected tag.
 - PATCH 14: Fixed RG2L_DU_FEATURE_SMUX2_DSI_CLK to RZG2L_DU_FEATURE_SMUX2_DSI_CLK
             Added features field documentation.
 - PATCH 19: Rename du0_out_dsi0 into du0_out_dsi.
             Rename du1_out_dsi0 into du1_out_dsi.
             Drop renesas,id entry from DU nodes.
 - PATCH 20: Use DU0 -> DSI instead of DU1 -> DSI.

v3->v4:
 - Rebased on top of next-20260130
 - PATCH 1: Fixed build error: https://lore.kernel.org/oe-kbuild-all/202601311423.gWtJuxiU-lkp@intel.com/

v2->v3:
 - PATCH 1: Added missing defines for duty num/den.

v1->v2:
 - Rebased on top of next-20260129.
 - PATCH 1: Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock
   operations to allow the DRM driver to query and configure the
   appropriate clock path based on the required output duty cycle.
   Updated commit message accordingly.
 - PATCH 2-5: Collected tags.
 - PATCH 6: Moved clk_ids to match enum order.
 - PATCH 7: Collected GUytterhoeven tag. Fixed "dsi_0_vclk2" position
   to match order.
 - PATCH 8: Collected GUytterhoeven tag.
 - PATCH 9: Use single compatible string instead of multiple compatible
   strings for the two DU instances, leveraging a 'renesas,id' property
   to differentiate between DU0 and DU1. Updated commit message.
 - PATCH 10: Removed oneOf from clocks property, which is not sufficient
   to differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L. Use the already
   existing vclk instead of vclk1 for RZ/G3E DSI bindings. Updated allOf.
 - PATCH 14: Instead of using clk-provider API to select the right parent
   clock, just set the correct duty cycle based on the output. Updated
   commit message accordingly.
 - PATCH 15-16: Collected tags.
 - PATCH 17: Squashed fcpvd0 and fcpvd1 patches into a single patch.
   Collected tags.
 - PATCH 18: Squashed vspd0 and vspd1 patches into a single patch.
   Collected tags.
 - PATCH 19: Reworked DU nodes to use single compatible. Use vclk instead
   of vclk1 for DSI Node and set to the right position.
 - PATCH 20: Fixed: dsi, du and adv7535 are part of the R9A09G047E57
   SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
   of using the r9a09g047e57-smarc-du1-adv7535.dtsi.

Tommaso Merciai (21):
  clk: renesas: rzv2h: Add PLLDSI clk mux support
  clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
  clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
  clk: renesas: r9a09g047: Add support for DSI clocks and resets
  clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
  dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
  drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
  drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
  drm: renesas: rz-du: Add RZ/G3E support
  media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
  media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
  arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
  arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable DU0 and DSI support

 .../bindings/display/bridge/renesas,dsi.yaml  | 144 ++++++++++----
 .../bindings/display/renesas,rzg2l-du.yaml    |  31 ++-
 .../bindings/media/renesas,fcp.yaml           |   2 +
 .../bindings/media/renesas,vsp1.yaml          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 172 +++++++++++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 +++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |  84 ++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 181 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               |  12 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  48 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  28 ++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  12 ++
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 113 ++++++++++-
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   3 +
 include/linux/clk/renesas.h                   |  20 ++
 15 files changed, 919 insertions(+), 46 deletions(-)

-- 
2.43.0


