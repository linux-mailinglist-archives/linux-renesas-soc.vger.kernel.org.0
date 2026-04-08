Return-Path: <linux-renesas-soc+bounces-30994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFZ9EnIx1mlZBwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:44:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF3E3BAD0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76E5F3048F07
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17E53B774E;
	Wed,  8 Apr 2026 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MNJbu51r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A153939D7;
	Wed,  8 Apr 2026 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644843; cv=fail; b=nR/guxgY+pnrj0twjlktcioyTYxfe/PWYPyEjeg0iKupwjlgaF7yxdKqgy/jBz3hJoH0A/4yNEmk2BKSfShvhw8Arrzx4x3VOOed5CQAeONSIglJaha21Wdqw0K2WAk6kjlVqHuLNhSNVFMks+t+AgEMjS11HlcWJ8h297NtC2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644843; c=relaxed/simple;
	bh=zz4TlmMDOubnwra9Uq1ctwBJto4Z3topXXYIEybzakI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HKKUyWO5XS+ZHzmuowEKClCXrJTgB9bo24ogC3lyQouT+zDBhyVTbj6+EKj+OZUt4YeA1ox+IpbDFbYkG+tYK8wJl86zhhe3MWl+Gh7rvwyPlUNp1Xt+sqxbQaMxmNbWb6gAUKFCHJf1+uPdd1E1e3S8+Q9qV3JTaUracR3M15E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MNJbu51r; arc=fail smtp.client-ip=52.101.125.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abU2C764SwCNbTSxdAlhn86+g/z+CCbn7CCKlmIf+ZFq2U/mQOS87THv9xHULVI3RaG3sScdWXZp1s2InWIbGopZ2HS83CfMqmbId5MFeXoGDmh+WWl2K+h7M+wLhmciWfcxX5JLXWrkrnblgEDkyB55M9QQWvHo9puGwOHNCM0OPY+t5nYfvj1PvJwdEsOb8DBQ679xmccPvRsCXntp56lF4aKTGa6TWCId7RgWWuVov0GidYtHpUYRyFD4ZtNB8FkxDzDMBaK5cpjhJxyM4N+Az8HdPZ8iU5kP+saJftOkk65zJQpV+EIg4MmtuagFAjFskjQTcG4cByrTvz1m/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+F9ffduK/zyub/BZUZFhtag6tz4sRBeSWs3LQymGYs=;
 b=J1cq2MwfzPUg6GzCTVDj9rqlrOv+I9MithXZwSwfyZsAzkkZ1pEThRvsTpTkWa1AsEooeRsllLb+vn+mkQpe4JSfoGP4CwPHhFvpFZE9qYnC2hKIe9t84NYmx8lrStEDP0NpvMWyYmNm4NrqgoJf1mRICqNBd09iRGRVLM7LCiQ76A5cVA2HY81AnkecvWQEOslwEXM59o/AYr1SjGxuO+3YzUb7/2PY3aD+/ozUgD8YKSy0xNV6GUuVbrgSFZrCERPQuEWs/vtaY+fNr3g7P/7657EcCgV613nWZf/k0UgUzfvzZSQSAh9PY0ny1H31aBHuZCpX3/N1CIyLLBr/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+F9ffduK/zyub/BZUZFhtag6tz4sRBeSWs3LQymGYs=;
 b=MNJbu51rWFBYi16G/4pth9l9f4tewvK20YOhrBHcbuOa2SrnhesZxB2ogM9/q4LUv/S4QlxW6xCKQbJ8Z607QVXaFlx8lmlJ9ch0WQWrCvlv/ncBzk6e+LG2JjXoHKqgK5exxkDqq1imgja5OE4apjPg+nT1nHOv5nqY4HsPexw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYVPR01MB11293.jpnprd01.prod.outlook.com (2603:1096:400:367::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 10:40:39 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:40:39 +0000
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
Subject: [PATCH v6 21/21] arm64: dts: renesas: r9a09g047e57-smarc: Enable DU0 and DSI support
Date: Wed,  8 Apr 2026 12:37:06 +0200
Message-ID: <481fefa0c9f6f0629a663fe3da1fb17e7f4a1a05.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 69295f56-a299-40ef-9dfc-08de955b465c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 dcT+Nc9QjYP8sXbO3jIhVjFmyXCXJgze4UYulyJFQOAROtpiRkMpvvZtr4LLMwBJaUE4/jIa+ExiCFls0qYUjkzGhuhDAznGUuI0y5/3e1lefjOHPlgIqVdcRoaGQhexPC+77SaC9LmAZxz2NC/bCWZehU3EhSqDhfdHgh/uK5nX2zxFj6LwdU/4m1wPZpjCywi8rMHrJd3lF4Bv4YDjxsoITtMJAkEidwr5PMP7FWuhdWpjzZPUqZzMB9qXW3geFgBGsZXrnWG2+OQ1O7eRjzqClkgrZtiK2d2wsXJIj2ug6tbVGfXZ2SzCHmeHIlCS9hqp7BUTn30FYRa7184QhwgdqXbi0v05lcPgGomNciBrplGFWxXkdZyrxjAtI9lLJEdai629MQoxdKmUoqkTRxlnWd+sqWd4SHLAE5iRwXLGER7U5WtJ5jh/D2tkzJLxc2QVttq4Ixs6odp4ab5yCnoM700AebQTz3GfjcHuudyQJhyujLGVQOHxuUVNos5zaNOgj49JnCU9kT0gFzzAzUnlcVb7aeugivQoyCtRjq+YWSglBNZ7rwRwK4dMC6VYKZ6BTvBRSrUBQzJ3driNO/3mnM1Elbo9Ct49thLilAxsR/LKzQNVkDN/26eR4wtYA2glqdOa4gt63Az04Jhm2fqi3x4509g5hCPwcOZvmvIlP3d58MuuSJ+8TJCdSjXfQqUWedUhyiwXH1JjD3YA5oVpl1Or6p3p6y4k0KBjsYxbF34FIpF/9TEkaPMsI4oeW2JwfauE5DsB7Ap6S1iG6BQcDTrAEK3Fn7qVgoU74Gg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?C4pU1eHTgOTFKVlIsh3xh6LI7UzKyH2m+A7UJrxtKtFKijqFkJi796N8QHBH?=
 =?us-ascii?Q?tKfAeK6MyoSptM8ywi7+6jE3SF4yrXBpXorW5CS9UNfr06JPRh6FqBvV6vaY?=
 =?us-ascii?Q?Qc1oKtkU75xEDzSxkLDva0sNyb+kD4cpcHrknn2YJfHXsC7rOWmi8khhfujl?=
 =?us-ascii?Q?ChIoBcHi3tdathXQihBBWDgc4kRtkhzOySe7GQYdJLybVNT9NseozGuhXa9i?=
 =?us-ascii?Q?46ISJFbAua4qRrTx7AmvX0PSrMlt9vT45RUJa0r6I6uA7nfdFbeWEtYaCy+q?=
 =?us-ascii?Q?+FYebE86PVNX4gVoFTzG0Vd+jYHdNAz0RsgzZnugEdwsv3BHZF5iyCaCxU9/?=
 =?us-ascii?Q?6hrrIQJ1on0GYrAMzgwNOIoXUT2rvWzmKUU1VCiIKDXREfrJWJ8d5Uq9mwRf?=
 =?us-ascii?Q?X0TOIY9E1EyhXcEAq2+ZZLAqBetgd/xvSmbCXxD4m4PpXdK+LjFII3azuSZE?=
 =?us-ascii?Q?QxD9g4QsS6FADhZTmOTdcFh4XyX16wEx3PJ1DFfBuMr9fMtJx1cPWPAj6DQL?=
 =?us-ascii?Q?o9+wM+gl+8uQaudybSqMcp/CeP4nIHJVIYPMFeeE9sfdIY0X9679paBulv0H?=
 =?us-ascii?Q?KcmWSX7RM+edJPLdjEjjXcjjipq67O8Zn2jNeCX3XLRZ7RChQN/cnallIG1o?=
 =?us-ascii?Q?egErTY9fzV6V2PgboLS3Xl8ewAHYS2HTMAr8HETY2rbSNqMjdcCBsMwKrVJ9?=
 =?us-ascii?Q?2GVRUss6qlmLb/FjjzQOxpqakicIRsXixpyiq6HBBUPFFVGf3yGmYW34BWY3?=
 =?us-ascii?Q?VJaK4Yx/nyb90kq/Vfn6ctNffp0uI1Igc2WKZrAFrZWsL/fDgKhKc4yHEb5L?=
 =?us-ascii?Q?Q7aK3z7McCtmO4VhdWR8Tmvre/chuStQHZIxZ4lRRZeQsB/vI3lrzI/XuqJ2?=
 =?us-ascii?Q?DspTmpXym2EAwA3bnuO2dnnVT7rdexlZ89eAVEeHNkwyfGA2DBikvmczKV8Z?=
 =?us-ascii?Q?vn09sD1s7zeV78FazFn4ztG6LhoRJkrmSlsNMta248+VGkLj1gBhZqhDvp4X?=
 =?us-ascii?Q?ceQd+K4caaH864ZPLfr5wQ0RfJz3G3jkJk9UAV75QD+3sXjXDxgnmMYA0P2Q?=
 =?us-ascii?Q?eUGObgmI2c/0ohMvqa+AqfzxtscAUpfiWiQykHRLLcgycymk403dVos/kznJ?=
 =?us-ascii?Q?RUfPCUCNG9AFIlSuOID2rzOS1RLEGoxqm5VMElV45Pi+zxZem9yRLOHWJo16?=
 =?us-ascii?Q?Ieos9dAM2puoZG6WA3317Lpfz9h/PhMp/1X0MuxB/u3WFbJKJIxvn4Flcxwj?=
 =?us-ascii?Q?CEDW6cZFVmZCEbBAcG+jRbL6NJz5R/nIsLBs35Fi2CG21HB8ldkjUtYpeG1J?=
 =?us-ascii?Q?CkwdWoqvgGQ7MSYzxW8b8ATeWDF4P6gQVvV1PzPRDgVBS0JhEdPJtC4gJTfh?=
 =?us-ascii?Q?9M+C+IPmwISyB/JqVMRHDafx4IYmz7/9LHeDx/NYGj4zOPu87C8+tzOw4tIf?=
 =?us-ascii?Q?l13XnVjs+UlV4OyobPfA7EDcaYR8pUv44QifBBecJcYXxSvf0zn/qvW9ktDP?=
 =?us-ascii?Q?NCjma26t1nK1KoXbeq50izKf6EOJpMM9bXo2KvMN5yBdD4Ryp0+cz7WUs44A?=
 =?us-ascii?Q?JY7omq2t/sfNdibPH+DV1SNoegZk4bz8HOAh1mcYttsvlucVi7A6oVDgMOWc?=
 =?us-ascii?Q?kmzT3pfGfIm94QRyVSytrdh1ugbUikut0rE6+E+ivn0QXSfJbOBzfNCBI7D3?=
 =?us-ascii?Q?xDrfQx3AAR93Zpz2163jn0fUyOleCn1pTX6HFduh/ufqSXHF296OKCiqg62l?=
 =?us-ascii?Q?oD9pOMTY7KMNdUiSQ0QXwQF+oqlKPmhmbChfbocUSnYT4CLcHGQA?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69295f56-a299-40ef-9dfc-08de955b465c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:40:39.1863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPu4YhxRy2gHTCXsbTpiKeBf4hfCTt7iTRcUOPkMyUo1qR4FcqMa8Ek+ibgsFuGWn2i9mz8w4wSlR5VBmG3v188JNIO8LSIAbwwEhYdCuYSdYajw+A7x+5ecucVlXHX8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11293
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30994-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.12:email,renesas.com:email,0.0.0.0:email,0.0.0.1:email,bp.renesas.com:dkim,bp.renesas.com:mid,3d:email]
X-Rspamd-Queue-Id: DBF3E3BAD0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable DU0, DSI and ADV7535 on RZ/G3E SMARC EVK.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes.

v4->v5:
 - Use DU0 -> DSI instead of DU1 -> DSI and update commit body and commit
   message accordingly.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Fixed: dsi, du and adv7535 are part of the the R9A09G047E57
   SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
   of using the r9a09g047e57-smarc-du1-adv7535.dtsi.

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index d978619155d2..74a5e4a9f312 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -33,6 +33,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		i2c2 = &i2c2;
+		i2c7 = &i2c7;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
 	};
@@ -77,12 +78,47 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
 		regulator-always-on;
 	};
 
+	reg_1p8v_adv: regulator-1p8v-adv {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v_adv: regulator-3p3v-adv {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
 	/* 32.768kHz crystal */
 	x3: x3-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 	};
+
+	dsi-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			dsi_to_hdmi_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
 };
 
 &audio_extal_clk {
@@ -107,6 +143,37 @@ &eth1 {
 	status = "okay";
 };
 
+&dsi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			dsi_in0: endpoint {
+				remote-endpoint = <&du0_out_dsi>;
+			};
+		};
+
+		port@2 {
+			dsi_out: endpoint {
+				remote-endpoint = <&adv7535_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du0 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			du0_out_dsi: endpoint {
+				remote-endpoint = <&dsi_in0>;
+			};
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_vdd0p8v_others>;
@@ -132,6 +199,48 @@ raa215300: pmic@12 {
 	};
 };
 
+&i2c7 {
+	pinctrl-0 = <&i2c7_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	clock-frequency = <400000>;
+
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
+		reg-names = "main", "edid", "cec", "packet";
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v_adv>;
+		dvdd-supply = <&reg_1p8v_adv>;
+		pvdd-supply = <&reg_1p8v_adv>;
+		a2vdd-supply = <&reg_1p8v_adv>;
+		v3p3-supply = <&reg_3p3v_adv>;
+		v1p2-supply = <&reg_1p8v_adv>;
+		adi,dsi-lanes = <4>;
+		interrupts-extended = <&pinctrl RZG3E_GPIO(L, 4) IRQ_TYPE_EDGE_FALLING>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&dsi_to_hdmi_out>;
+				};
+			};
+		};
+	};
+};
+
 &i3c {
 	pinctrl-0 = <&i3c_pins>;
 	pinctrl-names = "default";
@@ -240,6 +349,11 @@ i2c2_pins: i2c {
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
 	};
 
+	i2c7_pins: i2c7 {
+		pinmux = <RZG3E_PORT_PINMUX(A, 4, 4)>, /* SCL7 */
+			 <RZG3E_PORT_PINMUX(A, 5, 4)>; /* SDA7 */
+	};
+
 	i3c_pins: i3c {
 		pinmux = <RZG3E_PORT_PINMUX(2, 0, 2)>, /* I3C0_SCL */
 			 <RZG3E_PORT_PINMUX(2, 1, 2)>; /* I3C0_SDA */
-- 
2.43.0


