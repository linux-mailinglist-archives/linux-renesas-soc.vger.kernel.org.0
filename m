Return-Path: <linux-renesas-soc+bounces-32220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHbUBd1m/GmpPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:18:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF84E6A09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDDDE300D1FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE2F3E6DED;
	Thu,  7 May 2026 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jh5ONXdW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1327C3E6DDA;
	Thu,  7 May 2026 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149081; cv=fail; b=mak6lpVXECTW0I4ygOgPPPWF1Q3FKRRclaIVjQy9k8xrX4jMVDvAw6GG386/zxhN8RfeRYf+isXCZUpABy7HBgFlJo5XFzdzK3PGCiQ88Ia/D7NNbmZ8pCAz9OnQNCZRV5zxKoPKF3ICDNI5JS0FWJOGFr5L9wKoivyyIn4C9pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149081; c=relaxed/simple;
	bh=rc6/IlAPWjOMdsA+XEWmZGwiFe+iZigS+Vk+wAQkeX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NZ/zX56QoDk3008HFB3CorzbyYAhwIBI06nUcR11UQdCKz36ni+211LNRXqesLG94YCHZ4rWV6g5y2T9tEm+ttVst3SMLgFdb1T5akq4aFwL3oTW80cOPASQljtQk5kxDmTbEJJK4PKwpHgyxQ/G6VCBGWRZiX3DWFJp/zAhTZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jh5ONXdW; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIXqC3MEDHkwwOPhOUUD1Dy5AimJlfDVHTM7ZWhnHka+JBE3TISY/oQhXHiB9zOpKemFPNlgYgrFJqufJo3wKeGWTSfjUzVwe3Jivdnb/utB9MeUvWIWMlFQK045dAxFYi6Sos1Qx0FgZ+VgRYzvhSQIGmxZ/7imUV1ZvHUpAye5KXvK2lOfynknsxl/5cm75qUWB2qQvZ8ikNCbe8Q4ZFAXp+MrOv9XzYALLZAk6jytuzrnyJP9pNah/pfLQgZiZ572FdxSNdkW+AgHIAVJlOiFOhfrYYvsKTKnc/DX2YBNxVfjHHaqny4Tbu6UdcFBlWAFamCGHnVTyin8Dj6Q2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nehv6ouQnd17sSNi0NrU8H9bEuR4mUEcgMQI/m0R0sQ=;
 b=GELq8dNG+YXvKAbJaKHa8rV7pE//lU2HFtrYloSY5TbxuvVYHU+Wbmer04MHJPm/wzOjxTuQooTXJhtCfV/Vfo2O7jAEgFAoIqhwAbIWtzg1aEe8Ntfu3pMVVDyoQLEsXjm7TfC9SHt+7I4vFALp5n4MsCXDky8G1785nZ1Qy+Xhhd2czjQFraOmquTHueXWCaWfH4d7CK6tfuT6u6guVOAbAnhGB5cNjmt+odqh1JhEYRZCh/jcrO48uVFsjDfGh/7nJvn/70v2X+PHRjl6vLg6tQj7Zz/+V37gT0p7feDq9d+RjoEeVfRhlUCFugdVgPUcwmHUIKpSiCjXrw5f5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nehv6ouQnd17sSNi0NrU8H9bEuR4mUEcgMQI/m0R0sQ=;
 b=jh5ONXdW3yWVH1VMkjmm9QUd9iaeLjuttvPx77yqPpQwcvOOPMhy8LrRbiBjfhGhK83SlsdZa69itG9Q9V9M3TNb0Urs0//+SYP94Bkn3QiLtHZnyznPo8p7/I8smkjQGNQAETfNIcshLU2kc44dbflKjdO5oMguz9VN+AxRIy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSRPR01MB11490.jpnprd01.prod.outlook.com (2603:1096:604:22d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 10:17:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 10:17:57 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v7 2/4] drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
Date: Thu,  7 May 2026 12:17:03 +0200
Message-ID: <1e8af82122281c16201c1497d28a9c79f52c1ee0.1778148715.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778148715.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1778148715.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSRPR01MB11490:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f1a6f1-1ac4-4b36-455c-08deac21e88b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 cgKyTgyU3LdA0q48bmR66TPdwTG+DvP9VP5lIQSLywPyz4bptrKAbr6eKM5Sfb4WiQ23WqPHqs4sN4mftpW5tpJwrEBa9AoLlTTluGqtwgqmWkOwnFq9MuRSwMeu6I9uiE6LEfIWN5l1UTp5fdbthWPAGvff36azIMdcbtnxQd18ojHqqq9Eui7ULsaGTj0aU3aGXTV2IBfUGF/elHIBY0w8Xs+1/bNLtleZs/Kpx34/INfv98cvlZu0TPjZk7koYogoqQO5Ez5Z/k7uIAKYOy9ye6NMGfHAKSoH/wv4zA/44fLE3FuVrhX6IHHC++64e59OjtYpfs/ubjPrXvszz//c13qpK5wg3iTMmN4BHCfqc5kdXECAscThpH08voeiuoARXotf1uYOFybe8P6FdEVMi+ueezZ1MLyHWFPb8NFSYgqKDRy5T5byymEOhU4OJDsiMzUdp+UlGvajzpP54UVyQtouudXcvM7WNMIz4gg6Y3ZF9tbfdQTB3yT8tTGKygqazW6QEe4r3QIlFzDmkpv8RHCI6vdgtr3qok4IsqaYvtJ3bjs7IaNY+rfSdfAexZLqwSqh3FtMbmj4pTp/jO4O/lDVnoJXKUqKdWr+gBl5x3ahdL3m8mMVQ/Ct/kIT/mrFfq7jfd6XZQ9lakKAhVrx+yIEpaC31FXoV7PkthiTJuiR7QfiiYpG6Llct5dAVfvidHoskTgM4czr88KrqO4fn+A3SaqtH3pPhh/HZPWcRWQqxzBFuO725ridU1J0
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?mEEChdjhxafRUhZMMPVvE/5EuqZnnnzB1VhpMonvVXWrIwk7BV1sTITpUDDk?=
 =?us-ascii?Q?MO3kgpdNE0F5BJ/yvumzWrl3S9dOqVPw9mlN+Xr9unFZvNOYbAHyCW7erVWj?=
 =?us-ascii?Q?PJuXNvNxQ0DITKInePuJoQhJiLbj1wqQV3YxR6GxqNams4jEP1lnsfTzB66h?=
 =?us-ascii?Q?UOIoMwgZavPD44FAdhE/QQzVSynhXVR6hDNL74JzMet3ZnnLzinJp64PZniB?=
 =?us-ascii?Q?9oiDdhxOPweqbQTzyeFIyXO/+5g8yLzZdxyQOi+ofaqhnoBgdkdGa27NJ6dO?=
 =?us-ascii?Q?aYdlz3DaguCzb02qSBDWT/d3OsFpAuyXyP3nfsEuqY+IyWN9p8V3I0gVPkJD?=
 =?us-ascii?Q?YyPM8YjDgvqAzT2D93fj78iSVuRpG1weTpiy0GbMFRn6vgS8TLkVJoO7oG9P?=
 =?us-ascii?Q?bEtDe/QflYE7BUzoF2f5SwynAbh1rfs0NRK2SXGIh/9/duWISVjjka6NjA7G?=
 =?us-ascii?Q?fHfQwibXVy8bi7JVO6TQkAyK6neVrN44n2i5useXpoYuQpfSVaTEkE/Go6Z7?=
 =?us-ascii?Q?Qq3tMIR510s9ylx8HvkrESYJ6bSpykZRNtxdW0MqLq7BKCYA7gf2xjbwJK3w?=
 =?us-ascii?Q?WqhS8q1Ctm1culnlbXkZPouaEHaYE7By27d10Tzy9fK/dzkqv5ap8wN14ZwD?=
 =?us-ascii?Q?UG6wskzps07CYowgYc6jpkdKvD56h0A9IrhP4koqT6b+c+0wpJHaUR8oK2KU?=
 =?us-ascii?Q?8A9iPR2Cf9mCVCj0m+oFnhW3CRgO/Xfpu5dxM8TmUlDtFzZkm90C8MpdBUyq?=
 =?us-ascii?Q?VrN9N4KjRtupw9bE9MAIvlbebrr4UgcPGRAgjCMwTOWsxdtjhFkDcXS5b6WS?=
 =?us-ascii?Q?eZA/SQYpafu6lclgBSU4mEJVtEYJSscSAtjoVxijHjU3YnfvwieRxUoSsxhJ?=
 =?us-ascii?Q?JcrMe/w8iYq0lypFcxTshdPN1YD0zGUaswhPTmZp+scE29Y7chaUO9t7pW7b?=
 =?us-ascii?Q?oF07qpEXazplxydK75PjNQm2g/rOKiALOvq+Vvh4UrPtyktAz1CQVgIKv3Bt?=
 =?us-ascii?Q?Q3YWq+X2EDqN3v0FNJATbUE2V0ghQwh4HOiMSJA/9+ohAAzbFicJ37nkQUgG?=
 =?us-ascii?Q?jnTnxcittm9f/Us72M2jmSG1ThAgbIUkVrKVzuNnuRSj1MLE0Jz314c+sgY2?=
 =?us-ascii?Q?WULz87N/hwkDMBPoQyEQ5izAuKkeKfCv/P1afwUKXBNNp06s62QZFs39SoBF?=
 =?us-ascii?Q?QJJZikqvMgTKe9vyGNRDF4ZJbHgkV0vhxsFQCn5M6gYJasPqQU5EBbs3NPv0?=
 =?us-ascii?Q?SPL3STtAzpv+YZAcC9YKG7XopzLAY+T51BrLBmxY5XDgqHHnmczkzUOOKjdZ?=
 =?us-ascii?Q?n/znk0PBVL88vjV1Pylv3fLsB28ltsDg7LMoDzWJpHxAINfusL4+tUDgIBRv?=
 =?us-ascii?Q?pP/knSu8AMcyRPdBNt9oq7GPO6SDRQKJOyzvFMLzKFPYtbVxlU7M7RGAOjAf?=
 =?us-ascii?Q?T6EyjqhVVWUHrL4OSkTo0jctHhM9/tZO09VFcZ2ENksskwUUz/KAVz1l6E7p?=
 =?us-ascii?Q?tXVyyxfjgaNAT142sI4zMAID9NqMVJ7P+S3uBfJ+dSWlquA/pb4AHZP2SsOM?=
 =?us-ascii?Q?r4EDcWX28C1g7tCF77nZgPH76heA+RCKckyVE5rRoB6so+cOywirMyJRqR8R?=
 =?us-ascii?Q?AdikhF8oIL/lUDs6kXZlYIWItdnF0Eu95k27XLiSS1vzn3ghe/EFsoCzWY1F?=
 =?us-ascii?Q?KbQnd5Rrh1KE6gV+9HyJvUMweCrvk6YcSicbp8frKkXTsaMhl3dg6QyxwOrG?=
 =?us-ascii?Q?UUJpxfUQoO6iOmBZAatmA2IyZ/pQ1Ru9ZEsDWicUwZO1g4jfFZzZ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f1a6f1-1ac4-4b36-455c-08deac21e88b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:17:57.3608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjIKQXa84d6Ux/GQNYFyE7Xv4T19sC+RmJ7CSlg0X+G6lpbLdinInDGILExx18y6KB8kEhbJK0m8hwdZELilqql4IidpDGx89qtappGL3BEsxTqfPxknR0LrMobIasrj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11490
X-Rspamd-Queue-Id: 99DF84E6A09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32220-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,ffwll.ch,linux.intel.com,suse.de,glider.be,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Action: no action

Add `out_port` field to the `rzg2l_mipi_dsi_hw_info` structure to store
the DSI output port index. RZ/G2L and RZ/V2H(P) use port 1 for DSI
output, while RZ/G3E uses port 2.

Update `rzg2l_mipi_dsi_host_attach()` and `rzg2l_mipi_dsi_probe()` to
use this `out_port` from the OF data, facilitating future support for
RZ/G3E SoC.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - Collected tag.

v5->v6:
 - No changes.

v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - No changes.

 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index a2c864860075..15ee402155de 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -58,6 +58,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 link_reg_offset;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	u8 out_port;
 	u8 features;
 };
 
@@ -1158,7 +1159,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->mode_flags = device->mode_flags;
 
 	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
-						  1, 0);
+						  dsi->info->out_port, 0);
 	if (IS_ERR(dsi->next_bridge)) {
 		ret = PTR_ERR(dsi->next_bridge);
 		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
@@ -1411,7 +1412,9 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	dsi->info = of_device_get_match_data(&pdev->dev);
 
-	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
+	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node,
+					     dsi->info->out_port,
+					     0, 1, 4);
 	if (ret < 0)
 		return dev_err_probe(dsi->dev, ret,
 				     "missing or invalid data-lanes property\n");
@@ -1523,6 +1526,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
 	.link_reg_offset = 0,
 	.min_dclk = 5440,
 	.max_dclk = 187500,
+	.out_port = 1,
 	.features = RZ_MIPI_DSI_FEATURE_16BPP,
 };
 
@@ -1533,6 +1537,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.link_reg_offset = 0x10000,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
+	.out_port = 1,
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-- 
2.54.0


