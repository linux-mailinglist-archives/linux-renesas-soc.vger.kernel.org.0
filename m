Return-Path: <linux-renesas-soc+bounces-30977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHKnE54w1mmrBwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:40:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8093BABC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D1413013A62
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E91339B97E;
	Wed,  8 Apr 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="J5Az9TnW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2795B37CD24;
	Wed,  8 Apr 2026 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644704; cv=fail; b=jyELfQ7Sr+gJhnC+d3IvajN5OjiTaHbxAXEE49opMIC9DVt5/J0yRlVUqu/hz6SoPDuKkOgCUBXPevdZkwjHx1T7l4y6b7CZHUUz9D+tYb28cuCr2E2zvGfWH/W6mxvcCQOCOl9PxZtn6DtACUNxa9DUXYYA/ABv1lsGXX8lts0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644704; c=relaxed/simple;
	bh=CPMsmiQ1oXvQc4aPiF37NP9guYKPundSMaB9n6EF/Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FepjEoSzxIsAC9iMVeBbp7dWEUYUnTcCwlPs76468gZVmiMK4tII5qW9o7vVN8qX6IiViPisZXLR8raQmdQh+Ny5XQZdFuReu9n4lEHMIBEkLyXMwuxVBB2Efyqet6+i8xqXf+UuLRQvcuafzPf5cmpBFIVSCvpOoBYmkfKrlrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=J5Az9TnW; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qdfj+CQGHsAkbFplgSl4zFiXK8tjbLjPBuhA7Z4BvYyhRiPtQhPAeCWWGpiETcGQCOSM3n+90bEmVfWI7cwzWIU6lEu5hY6DTwdnK+2PhBsagMrrCEVw0mzeA0iyC2NfUF8KyuHlCTWyeCf0oGLn8YyURmD8cQhRPd9TQutZm5gd9BxY1Mph2clIQiHqaq0wRRl/4JElQSRxnhNqr2tCwjS0ZvUjcNwFydv4NQyhtRe+hZBtvXt0jhmm2keJcoeef7/a9FJQTtkYzvfOaVsQzro4wQYQG44iiymMgdnZR0iMb8u/N0MKpxytj6EMHknWy+/vDGtkrVai2bDVwMrvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9as/1H4WYXdYTtNqKElklpCauQOPgoZ82kQsuopQIc8=;
 b=uiEtzkh6+rBgH8HLw84IcuIgYkkXjJyutAs2pG9RaP9mN/Vj42Fvrf6khvX3xLZXOMuLU3UP4b0JfD48tYv0yLtETSHtsRbc/xMLIqBEUfvKOwNJuk4BTeZl1oukPIAFsHBkvbGiNgj+XJLQCDPo6HGquYSyvNQ8ozCQOMWpNn8Z7BIsgIfk0KJPvCCb8jyE4FEem9sWXtL/tTXkIGXa4tv1slplu7oxc74lFnL2UDHEZQAycilxQUGKX2AGolEW4c/+WJlF6/2G7hvytu+41CEG5cKZs3Ccbj2Z2gg1/vG8DcL2FQiadOKhvPrPgB1DGgo2xioPgPKXLB+2Og0v9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9as/1H4WYXdYTtNqKElklpCauQOPgoZ82kQsuopQIc8=;
 b=J5Az9TnWRI51ca2By9nQeHpZ2YS+tIj1Uus1qIJEwDnQERwhh2SnvxtL34UvJdyKXxheYmSYu7zVwg2qEl12JPVwjDNeC6U1tzq+fBuoDIuWEcIRnbF51FmX2vfHQGEk+d1fxA0T27ttYHD35+CYUhzcHC0Ck1tj85Jop159MN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB13668.jpnprd01.prod.outlook.com (2603:1096:604:35d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 10:38:20 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:38:20 +0000
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
Subject: [PATCH v6 04/21] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
Date: Wed,  8 Apr 2026 12:36:49 +0200
Message-ID: <e50c1721e1dc160e8b4518e8c5172f10cba4b58b.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: fb712401-c56f-4791-7005-08de955af3ea
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 4JhzQxf6CcoMzsJP2cF1sqiGomayCjanje+SyKIZzuWgrLCnzaRquRzUcgj+p0A6V5ngZSxcU72n7tbuCoBaKIYh1ipQ4AwDtjZdbPUxR74XdyZDIonIYWHXNsi8H9S5VlM8gp3IMn1hkkGuPiEauy55ICElzyGvlUt4PwtL//gbEV+aO5PqkV/ubY9vnyxp1spE3tXi3udre+m7zTOYgjWomfUMVFtOdyq2qCJ0r8yF7uOckZTBQXU1/RNN7uEIm4go/PzKmcS0ivusVURErfpaWhihpu6IdZ+9VRBy4QaMixJrtViKQNucQ0y4/V1uLsPey0Lj9ihNxsk0fIiD3ce+nLA1btclOgJZQvIHwqOUqmvjFFoTTj8QVuUepmB9BAJ0K2UyODHbd9nTVP4lysvLDQ3+LnUmejTv5soadi7EWV1EpDvzrNiYQbLjiuWesC0X6nvxu7e5ROLGnn/JGIIlxNLXaJVyAkraiC4/w71vBGL1rsxSHnkoEN36CO6v0TomnFowRO47L8ouJKmkAQZ0KIIuSncSmFS+m21RM9lsJLfOeDsIPdi/kpPHv52Qx+C7pYCJLIDpqBEZElXIcfhNynugp4l7aBgR3BQE8m6i8PqG8980i9Rtk9ESyuqa0dvIaqdt1WlisevPCM0aY+iZz59H+suCWPaWjptP/cocfZmIICRbscgVom+XVXF3fSvZmZU/jmqRI0cfA/e/Mqh1xpsNhktYJZwDM5u4Poay6h6NhbFW2V3vsu79MJ8etTO4QECMMaZqtrP+H7JCKHg2ZF3dvN1IlEdJnJZjMYQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?tvgMisEQmLbKG7Yc2pB6sZ/gpV0oeY8GkqAldSfOoDjz/s+H982j1hzZIxgx?=
 =?us-ascii?Q?98riZsda7YO9iujz7fnojt1gdNvygAubdrTyRbcqFSCkFmxeiVlExXwnG9Ae?=
 =?us-ascii?Q?dHslABXd0vU8lJee8Y9Z/hglKWDCTv3kihq7TMjR0SzLfP9NEakKksB6gNla?=
 =?us-ascii?Q?2Cnc3vauqWkrMBR6dsallk95ICSjcLzoRXHAqbzziszawutAUWe9BcQCfvXd?=
 =?us-ascii?Q?heBoZa+8r+s/+4Cb7YW6+2eGbJnezVmgzrNkkDO7gRrVdU/hFDsOSxPKfg2q?=
 =?us-ascii?Q?HFgacen6IIEWQA8ItRBbOVuFzETpzDXSojCv2U8NnxiF701FD6RKEPkK6SIu?=
 =?us-ascii?Q?NEHu6oE5/bC5hy3Nf1qUymoHvorh1abQC2ZKJG0FbRNNV5Ej1zZIN5gFuVKE?=
 =?us-ascii?Q?OfUbSfIGzATNx/KehmoluuXZtNIX3F2LAw0RuzQg/Qa2QWvRl2TlIaHRpuL1?=
 =?us-ascii?Q?tZnbE3gjz+YuMiFr523wGtMmYjO5elIbiZ70ZsxlTlEJOzBi+y5d+tG+tLQZ?=
 =?us-ascii?Q?kR5IQBRPWeTZT140TlEDGcdmqDGxhH9Arswkd812IzF9XE1C5qLXzTLrhre/?=
 =?us-ascii?Q?457fbquWDR9JIrTmCw6yf8bX34ktQdk4C2681be/II3rNlzJL4rPCun2QIb2?=
 =?us-ascii?Q?vUj7O0QxigwC/rZ66jjZkFxFjR9V5CZ6v1u+8tG3xtyFJpA6LABg6OpNnop2?=
 =?us-ascii?Q?M5Vsx8+hAfewnX61gjAKlQ8wxsgB7/WNVt61Msp0l7+SvniXH+mYO+K8S5Tb?=
 =?us-ascii?Q?cDfQyVO15sOn5IS4FtCoT+AckFdFNX6aPNHskiM4JE2hPUwbG0wvLgJzAYzZ?=
 =?us-ascii?Q?7w5J2UVCSAHQ5KP0sGABU0uJMIZisNgHfM30iL+qkLWCfDp1CBKEpHQatnPK?=
 =?us-ascii?Q?dijMPVGCylY4I2z3gFuw2c14dl3YodAXoYbhkGQS9DMe8RUUViVHZuvSrbdV?=
 =?us-ascii?Q?iOlBx2ZSdpokWpExIcCWnDrmvoHqZVzdVr0KbouxNDItjkoeC9IKsgmhv/+4?=
 =?us-ascii?Q?y3LZGFKF3dqBUH8NwFixeM/BwuCrKfYJjQ2JBtEjF4dfhpGXF97lGX9fw3cb?=
 =?us-ascii?Q?ThnZM1R/asyPPoegRjy1osYDfYsaJfstLdb4ae/zemQmomS+U1BfxseS47j0?=
 =?us-ascii?Q?FWOvYG/4aQtvhO/8YcShMAnstPEXD4CO982bAaWKCYs7k0imlhnhnsrShKjV?=
 =?us-ascii?Q?FOpglTBANO0BithY6mlqdCIgWpR8L0DQRodkpWyDsT1BSLBBsY9edcuSV1fP?=
 =?us-ascii?Q?nHKbFNgDPGqs5MmM5RsU4tELWIij0CydoghePIuPn5lqHTHrjCKYZbZ6Lxij?=
 =?us-ascii?Q?Ai/GkfYbb9NHYKX8cpSCD2nnG4Qb8v2Ly/JCv4EFGZo84/dtnyAzMgdaBDOn?=
 =?us-ascii?Q?rx4o0nj4FNKMXNQ9R/iTPVqVuJeLjV2zYIvnlKieCaXSHB2Fh7esMymoN1uS?=
 =?us-ascii?Q?/Oawketb6cv6hx+4L+idp3ECI8g6P48bTRxlc+BPdPtfygsEaq7wOgnelUK3?=
 =?us-ascii?Q?GXfNWPXrlbq3R8cEoLmnojE+xgxRFgWXgw9gCwe7OpdErpdkoWt+mt5AkrIj?=
 =?us-ascii?Q?KjMnaZcXJo/xnaWSySDhoJJPvrn9qihGRivhdINjaP3rk8pglU8Q4NUUFaEy?=
 =?us-ascii?Q?a2ONmL+6ezMIy1DangFdemXBA6hEUhk97QmBD7pCld9lyDN1Z7HHMyqrwkfz?=
 =?us-ascii?Q?mpLGoFFfJmpuUdSddYB9Js03DzIdZN9j1own0GWTz8Y4DlV4wXNzfIsJiloD?=
 =?us-ascii?Q?HY73caDbLJDHL8ypttVFOUuIRa6PrX+lAokYYEqRau1tca7WZb/U?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb712401-c56f-4791-7005-08de955af3ea
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:38:20.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVJiytO4w4qoCdjc7GeGXstkrovzpU5msnjknM9JfKptGT4ymsYcWVMwW8DLT0NCpyHdDptqxdxqzFIIlWuWRWz7oXDPW6+z6e2o/s8HhfrFQ0hqRosnC5mRnGx3WhWH
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
	TAGGED_FROM(0.00)[bounces-30977-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: EB8093BABC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the CLK_PLLDSI0_DIV7 and CLK_PLLDSI1_DIV7 fixed-factor clocks to
the r9a09g047 SoC clock driver.

These clocks are required to enable LVDS0 and LVDS1 output support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes.

v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Collected GUytterhoeven tag.

 drivers/clk/renesas/r9a09g047-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 87d5924f7e79..fd9b49c39dac 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -69,6 +69,8 @@ enum clk_ids {
 	CLK_PLLVDO_GPU,
 	CLK_PLLETH_DIV4_LPCLK,
 	CLK_PLLETH_LPCLK,
+	CLK_PLLDSI0_DIV7,
+	CLK_PLLDSI1_DIV7,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -196,6 +198,9 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
 		  CSDIV0_DIVCTL2, dtable_16_128),
 
+	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
+	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G047_CA55_0_CORECLK0, CLK_PLLCA55,
-- 
2.43.0


