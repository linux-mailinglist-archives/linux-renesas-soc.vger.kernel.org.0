Return-Path: <linux-renesas-soc+bounces-30974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNruMSsw1mlZBwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:38:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C643BAA75
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49F633007359
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC87437C929;
	Wed,  8 Apr 2026 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cUwdQ1e6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E092DF717;
	Wed,  8 Apr 2026 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644679; cv=fail; b=UriF7yABnPLX11MefiYAz9CHvzw5PghP3dgcyX2Nm5Z48xyWxrvNn2ycp6nbSB3GdOQSni9u38MB6+mMgN78pnuQpxM32xUOriWocnSdAHf4nwkP85nOCHxlfky0PGh54D0XZLxKSX5jPdwY4DTi70HBoOMkzyO0u0R1qFDUwoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644679; c=relaxed/simple;
	bh=YZguF0IK+1sF/fCzmKjXl4BiQT2W/7rFiyDMJLghFbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bKp7tLO5jQYAH+grqjC5Q+zmOnZI0/u122tVbesQ0N1h5c/Rnz7u6+q7Q4Lk9ah8sbnKAn3BamtOr4UB7dyKEWcn54/nWYidG9GqBKP00Ed/5N4SNGSg3Z8gz5pQnTT4qrS05abWQtY9f9hcjVnEToY8H+ZwtLN+YPiH3+vnX1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cUwdQ1e6; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gs7V7hEJkTyvgtwWLsPdTF+dBOBs6KHfGFx3Rx4qAVBw1jqnnOHRiHJxoIC8cF+d0CWq+zMpeXsQ4GolKuSUbjvvRNZ9v4+3gaWym5zbeER7qjUHwDWkDdZPBivG0EN8FJnfJAJThftbe8B9Nv2RHIr1bbCU3S6ZoZRkyuVvsUn9s9ozhV51GNHpRVJVHjU1HbVefSMphZb0tD9rv5w0C2yAYh/dLnksKBVCONekY2pYnd2MuouaGNyJY7iMl4Jd+Zx5DuUP0XweWRgb91bvJOnfoiNBD0f8SU9neScRQcqpU3g00Lzw4k986jlbDpBCO3RSElFdlnsyS9kPWES+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTGRFz5lH3531R4fMIlLmOwenSpzxLtQ7G2waON6zMw=;
 b=yfdeBZ0qz+kmGYHuL7yk+lb4ScpdqUPFn8QdrwlYackixGUNCOMvkuO4TxJY3sGKM1cuWwP0VrmO2CatxMIPtlH0Y/ezcaFbvlkp94BomPc0OW0KBvqpgj5sqcYzDfsHEpRvjgaAoLOVr+vxo2gG/pihZMj63vfwqOV1QkgqqUF1mR6JQIwheqjv13E9rSZDeMMGM6ea8JAFxMFZjAK1glH/EmWZHtkNLSSMDvfL9Spc8yZi2fYHCA4zSAgdYrBBXFD3Go4xocPM3XqURQQCrH3JCfll8bDZNfWkDb5IJ14nNQ6hdCJUNZmdX71F6VtimclN4DMzK0ro/avyvLa0tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTGRFz5lH3531R4fMIlLmOwenSpzxLtQ7G2waON6zMw=;
 b=cUwdQ1e662Ut0yzs+wRhLePp3qIjh0eY84BKTIRmvb0vTTzvLaGIVPGp9sjiddL8PBXCnQ1dMFR9IXYCEP1OGMvevCq5MqDTw/e4Q1bQ6vhCAKbmXliK6ZYAxbG0ORh+OU4d7IjDqrX5+egcu243KvUeLhPkToRwpqfPhOu9ols=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB13668.jpnprd01.prod.outlook.com (2603:1096:604:35d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 10:37:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:37:55 +0000
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
Subject: [PATCH v6 01/21] clk: renesas: rzv2h: Add PLLDSI clk mux support
Date: Wed,  8 Apr 2026 12:36:46 +0200
Message-ID: <24d3853ca2522df21e6a071a23e23ba4ca4b7276.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB13668:EE_
X-MS-Office365-Filtering-Correlation-Id: 0563e8b8-7e5a-47b9-4aae-08de955ae4d0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 8u7QoXhVBhBV+BQXqZEZ7vwVeg+WYwGyAZlrybstBrhNIde+gBgRMYi89Y6fY90ropDfHy9uqO4v7yYbDya58WF8oeILhEM3NU7p0HKVeZ2I2fltTT8sN9GLc7v/7qtk0bgP7w9zhfpVNRdBghcjt5BvyKr98wV20BPPYGAuUKzdWyHBXjWO/bspSwXAWRxLOAn/k1FcWfwOq2Cyqd9lDEMmRvY8p/RmeNWHQiHiA4v0vlJGrkyruYZUXoR+d91d7+5VOi9gfXy3C85lM2PhpvokSBKioNQxUeGoNtSKNOzwRiNdbAthfKAB2FoKqu95F6DdIzvjHI38dmtr7gNuZJsxwX1MP6u9d3a6G59NnQnVYuZ6Ue7xzr2aUHuwf2gIIDdKERxVftlydQBIST1HTVvJhDVBr1OBWfI2MokBgtgaKH6XAV8JawagNVOGbGX1vgxtLFj+T9xNuTWZwNwU6UPPF1AKn+ae3RJd5e0dHcE8xtAPqP4SecSdYRlUyaZgLscCkHpPDugBQFHO3IfTduZHIqR2LdZMfQFxvbXD6glqJmHSrCi0qy+h/Egm4wwAstk6KEgwnnELLaFdKCJLDi24+DBVQxd+kCBX6f52J0CXr3+irJv+AfyuiBMDfk52BNUUllCpew5yjwwLmML/JU4hhYiPI84IfRUABDk7V4Efpobj5dbm4NAHLxtMek+I52Va1ucaOEsUfvQTm124YYXv7vU6oimInysR/589/NVUjqwJPu42aUP87Ow1LdBkNkxlk8JT1rRni0U9HXs6+K/cfmvx8lPEizi15j7puas=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FX8SX0iF4Y+b819HM0cDrMgJiB4U9dtfImAhIkAfpMPbkIORxQfE//887u12?=
 =?us-ascii?Q?V/uxCIBuxCq2JvWqpx+cv5P/b0N5JbUNwH7a3N0dkqCQ/1rjzh48+kBQWiEK?=
 =?us-ascii?Q?XR8SMcNBVkcys/ExWAvZHivxNts4947+TC3GbY96QbSo+JdEG0ZaFkGU1riO?=
 =?us-ascii?Q?GVbaf9cE8SoHA0LIoffPPDNRPmi5AGA7H1yZ6B5zkHLKtXp3Ww+KG6nxN8Ef?=
 =?us-ascii?Q?iT82X8UYeMGt8pDi3ku8cYhtziS7uRHL8ThXQb+fHL1Edbepp0OW9RmucgMv?=
 =?us-ascii?Q?yrEy0Xl8XpVIRasvP8Go9wmFourX3pihhkybxf9wXZWQA1uxBjAorwyfFNnp?=
 =?us-ascii?Q?ge+S+XCGyKLbgnTTVBp9LzcX8Uh1B1AEX3rrk1g8dd/KB5Lv8pSqbKQMEwxr?=
 =?us-ascii?Q?qnGdPC5rWazFTfhAK/VxAOb1bALoKbZxm2ljuHMl5f2rjx2vs32KMg2RP6QZ?=
 =?us-ascii?Q?sQOT6b6FItKGqFss0XrqODNY7wRmSR9n1gbhTtXGPVMbrrHKHzKAUnqZ5zQk?=
 =?us-ascii?Q?QwFeK9TUqcBDd0jyFw2Yut1qNu7yLy/yYF1+symMr5XBSyl9vc8wroVFExUi?=
 =?us-ascii?Q?mKGGbx20UF4Awj+YjcGAi+cEA0AppliWNFFkQp4ETyvtyDu2n7YU/NBALQ3Q?=
 =?us-ascii?Q?ka2u/JPC0Ea/H2SmVZ4WGqWrD+ar9XA6YH8Gp54Ok4ImqQ1quuYYu3svUjC9?=
 =?us-ascii?Q?yP7UaP7EqlOjLoLbxHCibfATOkz3wfqpJFdpXpsR2tGfXdd2RDjC1LSov/Tv?=
 =?us-ascii?Q?e5YBTMR62bSiF9H1jaJDMNCsp661yh7pX2yHL7blsQrJeeEtRCpYKzhorx+x?=
 =?us-ascii?Q?k7ebZjMAyh48KtQ7c4fl6HbkgySMlqCu2XRNcwKh6F67IcWjP3QezFb8JgXl?=
 =?us-ascii?Q?xJbSuc3R9qYOnoJ6tKx2+qxPgoi2tm8gyKaCeJTvDspe6ei4rj80q768pN9k?=
 =?us-ascii?Q?qS8Nn4S3iCweUC40Ynx+7rTWO8XFA6leshZpr+mawMD43/YbSUYDTFcECV20?=
 =?us-ascii?Q?KXEuUVjRLCR947o8/TCs2ZGZF6JYAUnMuuIN8nS3XBvpaR+J0pz1Qis2n+Z3?=
 =?us-ascii?Q?v9gYdrRm2dfK6AoPk6V1ylwAm5+/xStb/Zvk43RohucwCaBcuWFrig8gc0f3?=
 =?us-ascii?Q?EXkV4ZVMvVkg5eotQYIgUO+1K/rIW0O/y4LezD7LuCxQ9J0KJuI3uxIaPxDg?=
 =?us-ascii?Q?AdLOTAA7YjyZSoUgJkHbGXj2QHzgUgGSCww1kGrbxRkNPqtd4fFblGXG9Xb3?=
 =?us-ascii?Q?Hb+x1SxxK5OteJp/5SJJ2IT9uO503ylsWJfaenPs2d13kDBj8hCtY9SOCi/X?=
 =?us-ascii?Q?be/UzINJUu0SLqEBJFqx+p4bGto2pSDd/cSvqOc+MOeBM3AbWX8YicoYvPJ8?=
 =?us-ascii?Q?BdhRWYLST3vx1RBeEeuDrR+QORhws8WczJLILFzxk8hRCB3HG1vZ+vIsDzMg?=
 =?us-ascii?Q?HiLmZvu0rmtGlSJBGYp+OI3l3R2W8/2S98qwW3fvcSURCgXqwBZPDhRv4qpO?=
 =?us-ascii?Q?p/t53U66uAgiVkgTTRB+TWqFm+ydBkUBP9DvTMwfoF6Qhnivu4caP/WGOo9F?=
 =?us-ascii?Q?sq6VDlm0496w/iyC2kHlawkwpL52trHagJAgeiY15kxP6hSyNb7gNNF15pfa?=
 =?us-ascii?Q?r/4jw91CJnYpp5H06udB4DPU6l3pL57psbXkLDz/vYWe0uay12oZwF843eWF?=
 =?us-ascii?Q?AvZqXR4QYC+3mYp6dOP1cOhku24juk1gtqLuJjVjdehuatvMEg4GzxiHWFjr?=
 =?us-ascii?Q?xKQ3hUOXewIRSX9fjVdBk4EqGwBSmRF/ZnP4nLIxHIV17qSPxn9w?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0563e8b8-7e5a-47b9-4aae-08de955ae4d0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:37:55.6010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3n/c9oCipdOjNzFcdTjaGrh7vz4G2eRkJuGN/+4nXhQ0ZELY1dherXTQMboiwvyyE7WuArGH+Bh8VKIruwYkg+dux4bxYHSSNuAqxWNeBE3Exbt9+GkTSXiTnlvr4uPT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13668
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
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30974-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,init.name:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35C643BAA75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PLLDSI clk mux support to select PLLDSI clock from different clock
sources.

Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
them in the clock driver.

Extend the determine_rate callback to calculate and propagate PLL
parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().

The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
with different duty cycles:

- CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
- CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)

Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
allow the DRM driver to query and configure the appropriate clock path
based on the required output duty cycle.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - Fixed rzv2h_cpg_plldsi_smux_clk_register() removed u8 width, mask
   variables and replaced with direct use of smux.width and clk_div_mask(smux.width).

v4->v5:
 - No chages.

v3->v4:
 - Fixed build error using temporary variable mask
   into rzv2h_cpg_plldsi_smux_clk_register().

v2->v3:
 - Added missing defines for duty num/den

v1->v2:
 - Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
   allow the DRM driver to query and configure the appropriate clock path
   based on the required output duty cycle.
 - Updated commit message accordingly.

 drivers/clk/renesas/rzv2h-cpg.c | 181 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h |   8 ++
 2 files changed, 189 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index f6c47fb89bca..e271c04cee34 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -76,6 +76,11 @@
 /* On RZ/G3E SoC we have two DSI PLLs */
 #define MAX_CPG_DSI_PLL		2
 
+#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM		4
+#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN		7
+#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM	1
+#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN	2
+
 /**
  * struct rzv2h_pll_dsi_info - PLL DSI information, holds the limits and parameters
  *
@@ -418,6 +423,20 @@ bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
 }
 EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
 
+/**
+ * struct rzv2h_plldsi_mux_clk - PLL DSI MUX clock
+ *
+ * @priv: CPG private data
+ * @mux: mux clk
+ */
+struct rzv2h_plldsi_mux_clk {
+	struct rzv2h_cpg_priv *priv;
+	struct clk_mux mux;
+};
+
+#define to_plldsi_clk_mux(_mux) \
+	container_of(_mux, struct rzv2h_plldsi_mux_clk, mux)
+
 static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
 						      unsigned long parent_rate)
 {
@@ -649,6 +668,165 @@ static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw, unsigned long rate,
 	return rzv2h_cpg_pll_set_rate(pll_clk, &dsi_info->pll_dsi_parameters.pll, true);
 }
 
+static u8 rzv2h_cpg_plldsi_smux_get_parent(struct clk_hw *hw)
+{
+	return clk_mux_ops.get_parent(hw);
+}
+
+static int rzv2h_cpg_plldsi_smux_set_parent(struct clk_hw *hw, u8 index)
+{
+	return clk_mux_ops.set_parent(hw, index);
+}
+
+static int rzv2h_cpg_plldsi_smux_lvds_determine_rate(struct rzv2h_cpg_priv *priv,
+						     struct pll_clk *pll_clk,
+						     struct clk_rate_request *req)
+{
+	struct rzv2h_pll_div_pars *dsi_params;
+	struct rzv2h_pll_dsi_info *dsi_info;
+	u8 lvds_table[] = { 7 };
+	u64 rate_millihz;
+
+	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
+	dsi_params = &dsi_info->pll_dsi_parameters;
+
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params,
+				     lvds_table, ARRAY_SIZE(lvds_table), rate_millihz)) {
+		dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+
+	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
+	req->best_parent_rate = req->rate;
+	dsi_info->req_pll_dsi_rate = req->best_parent_rate * dsi_params->div.divider_value;
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+	struct rzv2h_plldsi_mux_clk *dsi_mux = to_plldsi_clk_mux(mux);
+	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
+	struct rzv2h_cpg_priv *priv = dsi_mux->priv;
+
+	/*
+	 * For LVDS output (parent index 0), calculate PLL parameters with
+	 * fixed divider value of 7. For DSI/RGB output (parent index 1) skip
+	 * PLL calculation here as it's handled by determine_rate of the
+	 * divider (up one level).
+	 */
+	if (!clk_mux_ops.get_parent(hw))
+		return rzv2h_cpg_plldsi_smux_lvds_determine_rate(priv, pll_clk, req);
+
+	req->best_parent_rate = req->rate;
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_get_duty_cycle(struct clk_hw *hw,
+						struct clk_duty *duty)
+{
+	u8 parent = clk_mux_ops.get_parent(hw);
+
+	/*
+	 * CDIV7_DSIx_CLK - LVDS path (div7) - duty 4/7.
+	 * CSDIV_DSIx - DSI/RGB path (csdiv) - duty 1/2.
+	 */
+	if (parent == 0) {
+		duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;
+	} else {
+		duty->num = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN;
+	}
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_set_duty_cycle(struct clk_hw *hw,
+						struct clk_duty *duty)
+{
+	struct clk_hw *parent_hw;
+	u8 parent_idx;
+
+	/*
+	 * Select parent based on requested duty cycle:
+	 * - If duty > 50% (num/den > 1/2), select LVDS path (parent 0)
+	 * - Otherwise, select DSI/RGB path (parent 1)
+	 */
+	if (duty->num * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN >
+	    duty->den * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM)
+		parent_idx = 0;
+	else
+		parent_idx = 1;
+
+	if (parent_idx >= clk_hw_get_num_parents(hw))
+		return -EINVAL;
+
+	parent_hw = clk_hw_get_parent_by_index(hw, parent_idx);
+	if (!parent_hw)
+		return -EINVAL;
+
+	return clk_hw_set_parent(hw, parent_hw);
+}
+
+static const struct clk_ops rzv2h_cpg_plldsi_smux_ops = {
+	.determine_rate = rzv2h_cpg_plldsi_smux_determine_rate,
+	.get_parent = rzv2h_cpg_plldsi_smux_get_parent,
+	.set_parent = rzv2h_cpg_plldsi_smux_set_parent,
+	.get_duty_cycle = rzv2h_cpg_plldsi_smux_get_duty_cycle,
+	.set_duty_cycle = rzv2h_cpg_plldsi_smux_set_duty_cycle,
+};
+
+static struct clk * __init
+rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
+				   struct rzv2h_cpg_priv *priv)
+{
+	struct rzv2h_plldsi_mux_clk *clk_hw_data;
+	struct clk_init_data init;
+	struct clk_hw *clk_hw;
+	struct smuxed smux;
+	int ret;
+
+	smux = core->cfg.smux;
+
+	if (smux.shift + smux.width > 16) {
+		dev_err(priv->dev, "mux value exceeds LOWORD field\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+
+	init.name = core->name;
+	init.ops = &rzv2h_cpg_plldsi_smux_ops;
+	init.flags = core->flag;
+	init.parent_names = core->parent_names;
+	init.num_parents = core->num_parents;
+
+	clk_hw_data->mux.reg = priv->base + smux.offset;
+
+	clk_hw_data->mux.shift = smux.shift;
+	clk_hw_data->mux.mask = clk_div_mask(smux.width);
+	clk_hw_data->mux.flags = core->mux_flags;
+	clk_hw_data->mux.lock = &priv->rmw_lock;
+
+	clk_hw = &clk_hw_data->mux.hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
@@ -1085,6 +1263,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_PLLDSI_DIV:
 		clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_PLLDSI_SMUX:
+		clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index dc957bdaf5e9..74a3824d605e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -203,6 +203,7 @@ enum clk_types {
 	CLK_TYPE_SMUX,		/* Static Mux */
 	CLK_TYPE_PLLDSI,	/* PLLDSI */
 	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
+	CLK_TYPE_PLLDSI_SMUX,	/* PLLDSI Static Mux */
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -241,6 +242,13 @@ enum clk_types {
 		 .dtable = _dtable, \
 		 .parent = _parent, \
 		 .flag = CLK_SET_RATE_PARENT)
+#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
+		 .cfg.smux = _smux_packed, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .flag = CLK_SET_RATE_PARENT, \
+		 .mux_flags = CLK_MUX_HIWORD_MASK)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
-- 
2.43.0


