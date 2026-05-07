Return-Path: <linux-renesas-soc+bounces-32222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BGFISZn/GnPPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:19:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDC74E6AA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E7723016D17
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006653E715E;
	Thu,  7 May 2026 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jNb3n9qx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011067.outbound.protection.outlook.com [52.101.125.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F02E3E6DED;
	Thu,  7 May 2026 10:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149099; cv=fail; b=rBGuRGRoytp1YTY7n2qpMGCApLoGiScmbq6osynbevS1RoGMCqFx16ARuOVlMJIMFUUa4nrLj3ThBknXsqIO6N/8LPHryvQSjB+rK1sAf4P90NQMFY2X9Ac2VdPBRI+bTgXfcXgvQMm8ErHAuQz8qqF3s+Ey43YtzMLMpGifv1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149099; c=relaxed/simple;
	bh=Hoxf22+gRAZzKSMOhOWIO79mVc1fwYwtD7M8K6hEFqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U06+gFVgqw9/QqffDH/mrdMH4p60MTyaTTVsM1eXqrmqYZInDTBiIiXQKG20D6MbJBJOErWQagiex8ymAN9QWi8vYVFJfjp8oeBgz5v+nINm7f4JbeotHHt8S5sMDXD1oEJwP1HOqYOSsH8rKDzgjMvpynjLKwLh7GLFxW4Tj6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jNb3n9qx; arc=fail smtp.client-ip=52.101.125.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqDxRmXCz9hSYJtTf7j6MBGZPEktBsoK9UNdflClu1UAiYnP4rgaVSbkE72/OT5jbJ3EBbsAyJh4aiww8B7Sn9HlE2C8xZkZXj0yPbGo8qksMZjrR4KLLR4whdcnp1XQUMHd3x3erjP9SYYLlvdLDTZfi9a4AFLPtqh10IiTR15nJo/wk0OEKJrVBghMFhAOrgqDcEPDI8J2x3EOiEKHDaLSsML2ISfz+KvgZBV6pXTi1piHcQVgJ6575xpuHgxy9KTa9sZEosHFKVd2d6R4Obyj5vwqtXjzSZ2DIMHKrQ+0N36s9wMao4jCU2WJJHMc6VBhBvYARucDGGqQzbfdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZ/F/Cn5h87mAbdNf8wyGuK5+MUAWyeFfPAavyHaQt4=;
 b=GX9o+IptRQsiYo0bMCICBIvkYqX0ufy/L35mkgyficz8mmlH5b0J+emdAD7D4amtm2fU2nF6i43yPEQYm17vVcU1fFLNp/60CAihS8l9nFNeLVYNPKo3n5x10V2xjuzMWMsmNoUq46cKckRbNFl8ftZ8iUpqbQ7jhiXSGOUqQeqLV1j4GGA6xopY5YZ9TQKiGW7wO1mVf09jFJ4WT+Qe6dnRX+ri/AD94SdBRg4TiGStmI3kV9KicjakWhyiRA5FTewyf8wf4LB3yCf1mDVGaFEA9MQ7fjhXigFaIj0m6uxr8a1jVmkQwNYRhwJEGV1s/cd3v55sM0mgNICAPokKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZ/F/Cn5h87mAbdNf8wyGuK5+MUAWyeFfPAavyHaQt4=;
 b=jNb3n9qxeMkJpfua5dXrS6u9vuLUzN8kcdxx1GHFVIoMQxe980U+mPEinF2mZA5s0mbtdsrxrDNQ12mMj5jkaWIbDDBgWAxJkoHEFZj7hyVTg7Wj5vzomBl9FgCv8EtvXZrM0KL2ZNLzQFObM6mlEFL4OWdKGczZJarx5jAsY+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSRPR01MB11490.jpnprd01.prod.outlook.com (2603:1096:604:22d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 10:18:15 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 10:18:15 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/4] drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
Date: Thu,  7 May 2026 12:17:05 +0200
Message-ID: <83c59209a182d44001df2dfa46d8980b66edab4a.1778148715.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 35e55040-4833-4739-fa1e-08deac21f391
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 RXcQiuku9V0z8EmxbRQJuo25d34ydbIrPYf36ykcNb2YwLKJN0bWfD8ut5cp+s2zjIuOtWegua4Gt86glVjl0ebGOjqb4UCWIvBIT1pSJmLNHwUQwWvRhpcLCBldY6DsWw4Ah2i82ccBqW9g6Cpsn6k+tqosJnXtCq8bcrMpeRFKtyvjK7WawjhY3dg0AeB2rWQxSSAK9QSTPjrwxxjPbZ9Ig7CTsgdElTlA3H+JKXgeA8eAxZLcsUUnXL1UmpdJzb919avEXA3RA+RfN78a4QnrvURxe2QH1p4ZbxSLj/ntZK9UZ96aG2rJf0YDLyuXmF/JNeg6HS/tVYKkgSsIx+NvUSK6u2JIjcKUn6/7tqNaQy8KhU8UuEc/uKgOb4k+ITbIyPoZ0dazk0w8YEAJY/3kfFoyajctWDO/l3ImlMAwYkzhwPG3GRs6IDtMFON9vtslGCJTtg4u9xOuZp0FIAD03Of84mWNiNPTHmPFzzZYOT5O0vyoLz9iMIMVhZ37A+z9XaM3k+boAfeXZGZxnSgfmVnunRIwTLL0njfNOqCqj8iq3ZxoRClj5i0epatH9Zz0bmmHURJJZAUdx5I5Za64hlLS+Q5/SUK91dlk3QkP3n06Ac13P5uddyl4DNo2/8z/LW4zpjSwSVKkhK0uuUx9hoN6SDWVdFe1Ne5NlLFiKPeYU+zJWjaPwhUhqpepA3DLrrZvL5NlkZCykbeyYdgyeQVwgxu1MBLTove3H34EVIj3hwVwkNvKYklwb5Wg
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1JOLqP0yLKXN36HWZubNOhOmYN7w5YIPciYZKt53LK8E66MxjZ8JlHUhC0dZ?=
 =?us-ascii?Q?xBUEtxXty7jltL/6kjZ+EL2fP/JHOsE1nmCv9fw6wcmhK//w99lKal0JpJXv?=
 =?us-ascii?Q?2qSkxnA0ym/eM5ESaCeQVR8VSNO3F45RoCAJd3E9dOlMsaGjZJy+BdRyDXGY?=
 =?us-ascii?Q?6CStNA0PYsf/TbKsUQgMICanSJtbyiFxsu354KPx+Qbzaezic4dh6v5JYR+D?=
 =?us-ascii?Q?9mOAvJmsuLTtAZHxiHAGQ+DkfDyugEF5amUrRTWmKzBYfHEdPlZ/qBtp4/1S?=
 =?us-ascii?Q?icw0W76lWJrIB+4BMd2VAngnuujr86T8A4S4Qe2w7lHX/zwEdahdGTMEDnBm?=
 =?us-ascii?Q?aEG9Oou4pNMX2yscMw80UAz/73zl3NnEaavEDIbi8ju7Wpd1wDzXcr/QDIVd?=
 =?us-ascii?Q?Tj+FWJf3Ul9Cx2U4fRDbWSXdeOVq2rFMO8K3/+M0J0nV8kYkjW2a6L4LBB9Z?=
 =?us-ascii?Q?L+R5Txq6JJFTgg6/Zveckd0d6aiRAPJBNhHHBYVbVu1EzKlnCRSvtb9nFBbi?=
 =?us-ascii?Q?v5EEvEtyDKCfyteFass1o7s/6IQTcLJbMFY6CyVra+DbhttbbasCVlVTl5yw?=
 =?us-ascii?Q?Kg7GsI0sjyKH0ou7MRDcDKD/FgJryU9mshi0LMS9G4Z+3hUE8zPw0HCE16z8?=
 =?us-ascii?Q?MJOId1Dy3RW7MEYfXT4lARqswuOV6ytN4txjZgBtIRpkbyGBQZSqRpahzrlV?=
 =?us-ascii?Q?C2QWMhpoZiswKNP5okLDdE2OhcsDY3ioO0OzmdERN+700vOVWzProKjX7PGx?=
 =?us-ascii?Q?G44d0YF1j+rmC8to5POgGL+yfpWWhLFeGp4Rtqn+9tPlq77+7NVRpbZj+3ig?=
 =?us-ascii?Q?3auE7I/6NRNdoVZF39t19yk5HT4m5mzjE8AR9W9cFGtt0ZIUPO5JW0j7rVFF?=
 =?us-ascii?Q?2+K0jbd6uyDgtpVss3JtjWas/C2vfKjpoGaj28Hl5mHORZ3UnFzxlLBAlJEy?=
 =?us-ascii?Q?fXEl0bD45SlcX7gA1/Koe0vt+vmBiade4jkjfSY5SKV5k9JYtJbs5t8q7HKb?=
 =?us-ascii?Q?FMUebqMFwLo9r+9YwYAyv5lcTXp0YNPhb0nut5qtjjShmcGu6L8aFsw/4ddv?=
 =?us-ascii?Q?wiW/OnDbV6fEFMrkOltp9sNz6pX01IwBBeBpUFAxAMiqh2abZiL2IlQj+YJP?=
 =?us-ascii?Q?zpxymd56n8/pSfKcgyPU1Y9KSUj9aPRfQP9ijeY0sP2OOcg3fD3Q3i/NO9xS?=
 =?us-ascii?Q?C5+hgvlSUFs6253coE1YBtzR6FF0TRx+L5aE0NENnGeH+prxNXVH623K21ws?=
 =?us-ascii?Q?nFQ52vv/KENUvzXY5J92lwzPfw1Sfs0iYkT+pppWuA/VrpeTpr4GZw/+5IPM?=
 =?us-ascii?Q?QYd6AprWsrn1gR/yBZig0irUK8Pxvw+caC6TsW34j8g5DpjfTUAfeWUH7Gl/?=
 =?us-ascii?Q?581MGj1vQOZ8Mmm0h4lGgXonsyfsd5xnSWDB5hWnnno6vdLyl6klaauoCpy3?=
 =?us-ascii?Q?zSEsPB6T2Zo5W+Dc+vxtwDjGXyouS7fTunGpadT3OWS3HkXaLRX+MkB7ElKv?=
 =?us-ascii?Q?PHSTeuNPOF4Pmx3Eoo2D7d2GziJb56MXGpt00Rir9CwCSJ4ciK/STitS+iU4?=
 =?us-ascii?Q?lWm109pWPu/EUQSUChHvFfLnLHs1FTiuh3IYZZAF/zBKcKb7SQ0S8OP7SaOp?=
 =?us-ascii?Q?CsYsLWy6TtM8P937akH4p4B0Yvva0drhY9m04NYDpct2CsOBUnNAodcaq4vG?=
 =?us-ascii?Q?cXBPu5dMFGd8p7UO6NZ8hnlCvybZ0eWN3gwhZQirGDwkhn99ZyxDeK7t5qsG?=
 =?us-ascii?Q?XrnpxtCmx/SHBMcskUoZl0WeuRkR1sJJ/7nsbRs3AY3A9jvwKW/j?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e55040-4833-4739-fa1e-08deac21f391
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:18:15.4856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zj9P+znqUEi3qN9Hp+XBatXGge+ZZXHMC1ZwSg5/2R4GDtCb0xr0pcEM8sdF86a8ZAZu6rcxdMiSP5sUZ9sC6lWx8ZqzXzEQxTkR65Gq+cvuOAL+Ng6NB7c07J52Crx+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11490
X-Rspamd-Queue-Id: 8CDC74E6AA5
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32222-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Action: no action

Add MIPI DSI support for the Renesas RZ/G3E SoC.

RZ/V2H(P) and RZ/G3E share identical PLLDSI divider constraints from the
DSI PHY perspective, so both can reuse the existing
rzv2h_plldsi_div_limits structure. However, at the CPG level the limits
differ:

 - PLLDSI0 limits apply when vclk1 is used.
 - PLLDSI1 limits apply when vclk2 is used.

To support this introduce rzg3e_plldsis_limits for RZ/G3E SoC.

During rzv2h_dphy_mode_clk_check(), the appropriate limits are selected
dynamically based on vclk_idx, which reflects the currently selected
vclk.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - Added missing const to rzg3e_mipi_dsi_info struct

v5->v6:
 - Collected BDas tag.

v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - No changes.

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 19f8f19e538f..5cdb52b045f5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -582,7 +582,7 @@ static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
 	mode_freq_hz = mul_u32_u32(mode_freq, KILO);
 	mode_freq_millihz = mode_freq_hz * MILLI;
 	parameters_found =
-		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
+		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[dsi->vclk_idx],
 					&cpg_dsi_parameters,
 					dsi->info->cpg_plldsi.table,
 					dsi->info->cpg_plldsi.table_size,
@@ -1527,6 +1527,36 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+static const struct rzv2h_pll_limits *rzg3e_plldsis_limits[] = {
+	&rzg3e_cpg_pll_dsi0_limits,
+	&rzg3e_cpg_pll_dsi1_limits,
+};
+
+static const u8 rzg3e_cpg_div_table[] = {
+	2, 4, 6, 8, 10, 12, 14, 16,
+};
+
+static const struct rzg2l_mipi_dsi_hw_info rzg3e_mipi_dsi_info = {
+	.dphy_init = rzv2h_mipi_dsi_dphy_init,
+	.dphy_startup_late_init = rzv2h_mipi_dsi_dphy_startup_late_init,
+	.dphy_exit = rzv2h_mipi_dsi_dphy_exit,
+	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
+	.dphy_conf_clks = rzv2h_dphy_conf_clks,
+	.cpg_plldsi.limits = rzg3e_plldsis_limits,
+	.cpg_plldsi.table = rzg3e_cpg_div_table,
+	.cpg_plldsi.table_size = ARRAY_SIZE(rzg3e_cpg_div_table),
+	.phy_reg_offset = 0x10000,
+	.link_reg_offset = 0,
+	.min_dclk = 5440,
+	.max_dclk = 187500,
+	.out_port = 2,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP |
+		    RZ_MIPI_DSI_FEATURE_GPO0R,
+};
+
 RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
 
 static const struct rzv2h_pll_limits *rzv2h_plldsi_limits[] = {
@@ -1565,6 +1595,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a09g047-mipi-dsi", .data = &rzg3e_mipi_dsi_info, },
 	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
-- 
2.54.0


