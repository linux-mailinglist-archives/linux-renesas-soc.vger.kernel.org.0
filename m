Return-Path: <linux-renesas-soc+bounces-30597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIT+EhaTymnF+AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:13:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE4535D951
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13ABD30D663D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 14:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8718F3271FD;
	Mon, 30 Mar 2026 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="l5UtPOCp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F001431F984;
	Mon, 30 Mar 2026 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882049; cv=fail; b=pCQ/q3/VVjZ+c8C6zK1WwnHRvNM43kpyLVFSJc8ZJH5/MIHtJdy68qZTvo0kMiRCA/RHp0Ab/37tGxsXpeC45xIlLYqC9p/u4+Jd8d4mouOrXiSZJN9NCFmfbT8bFojXiX6Zst7mPoXS7zXRKV1ytthIk0HPBrvZV1Xm90Rs0Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882049; c=relaxed/simple;
	bh=DFZSrKrsECTUfBPfL0xPJB6/Og/FXY2CkCdnkdlu4Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=b93Ew/7ZX7dkXNSp5qzhIg92f59lC9w50rHEpkWMFi9QpLzjYm4ctWXqfOgsaoZGCsXiRwKSkGjNI7MWLLk4/h49h56CIPb+L6KHJ6BgmCk+MI9q3eXuOI0WwLzRTB1spWBqYU9sTVR5U/0ahmGxg111KQKxq6dLRc+1cmBxwz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=l5UtPOCp; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyuHqsvkPQbNiSZvxvMBgXEf0WBgmljR6GtR29ugbNL4nwrx6EDRSKW1DXN3DI7PzhchdXBwSoPlz+VkP55F7QVqYyMPBkEPQ7agSXxvD1N6Fw6T4lkJOHOwAK7I33ZSC9mzr4fIQ4Rj6vuFW2KNmiujii8V/nowlAcp2htdGIIPQbVDlOfVqmx0ykSzjHngxMMuqvIW7wdUNzfrBSzU5Q49uiJxFRypnmYZPKfMc+9OGH9iPIhRnxkVjRR7EUc7A7ZJbKhsBb8cvyaFWyKYaq4oE8nB7n8a98Lcl4D8aoPwWWziw7JJiKodD+IC5lX/E+pu8piBOsLIj27wCrKb6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rwti3xDulfhBsqdQX2B6FQPNrGbFDNHazu+SYXII8fM=;
 b=iVyeSXXz94ndEWKk6CnghYSeTIscmyz1+SHMKddyWTVBgt9Qlzpwyz6KYbCwj12gn+lmMwOOjnr7JVmo4+auPSyayKK7dMwugecVyIqvzt8KsX4WIKv0HoXmTDxopJFyJfY70LVp3EQuw2KUkXRfverHzPY6WgIBMItbIO2cxer9F86nGVpxhULfBUSioS+ElYB7vypfvlZ7wKOr/XvZe6cpxH0lmNk5zKFNNlZ/cffNaQcljupg/ivmvP2FxtjFlMNWapu/pOHoNSchXzS/XFqvIpCZjQvyQdTb+SSggVSC3tdS4bHAbe/zYBaLPbIrTr16kQsCOu8GsK4PNbQ/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rwti3xDulfhBsqdQX2B6FQPNrGbFDNHazu+SYXII8fM=;
 b=l5UtPOCpJKQMJ2SOomOFEpW7Q5/UVVCgfDWI/xTrNy+fx8976EJ9BN1EYKYoGfQctsQ6uTdWLIc3mQODM+e/L3x8KuZXYQ9a4DG6l2tJNesxzrdpbhMxwKAwwx20aXyqDBkFFfHEBHchGQR/BaHHgc3BMaPQ0DJGIado+ThkIcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYTPR01MB11067.jpnprd01.prod.outlook.com (2603:1096:400:39a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 14:47:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 14:47:24 +0000
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
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2] drm: rz-du: Ensure correct suspend/resume ordering with VSP
Date: Mon, 30 Mar 2026 16:46:47 +0200
Message-ID: <20260330144651.817338-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYTPR01MB11067:EE_
X-MS-Office365-Filtering-Correlation-Id: b04f8f8c-8c23-43eb-5b3e-08de8e6b4167
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 SuKNazvisGgEToj9j5PEoMC4o4t7ffw+kbeg809LOx4qqxMm6HMZPIDIH0zFLOcVCWLfWYCUOa3f5SBUwyc4mCNcx45SE4scRw3f9Xe9oMLyi7rIGkibmzrSEbyrgEL41elu6+b7Z6pFIF/ervJstf5POpm6ItxhCtzucEvKHfJN3gFGwQlWsOnpRdK5jgs2UglHndsWfeM3xcqHVgoeljzT1cXfUjk57PG+Bz7LERQuC0cY8su822p79JqQ9cwgBNazSRq+9qz9NkTiHIaWD+MxiY1BAu18hsTRRio1bFUstCdIddEV10oLVj1lgwhPfgm1GgVyqIGXeOMO+Nsdyytt+8oUt7NNVDmcZjUN7OW/3GcV9JkrKGCvu1HAzs7udi0eMtsg901my4umf/9hwoPYrqXw+DBjIvzmdXkeGJUbDWbBe8aDHNv8DxdeMtt8eByN4t5B4D1XJtexuYvjdzHOl6dgF/cofWCXvT8gBgTz0DJSPukLukDMNoTsvD64acC9ubjxUqnBh0CPJvQX3LzuF5kyvmGHAoL0HqCOJ55Uea+jplCKDUM6jlwc/Fobsgy1ck2C3KxJ0pImoRaDUmnBoz0vhOuzFt4tM9AhjWUOdXXSg2feXBBzryYrczf2wpeSd97GT+Vgl4wb0EcCHKs9vfd7pPpSb/N8vG1bmzVz8GmTNXr4moYmm42i/gO2mKTu/1XU9mq4v7/xfMpDQQY/hprYRrDXJLaPCER4RorOPkBDVaPjXMej5o78bQ+ytCv3xwpkfp085TvRgIaG4eKehswCrVX/V6yTzwqKopQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ia6wgK82cp0dlg0ADhGWYtRQFEgv77VKk4lZVNqbQGT1lMALNdCVamnx9hWN?=
 =?us-ascii?Q?zlZX1KC5zoDGEtwsEIiWqFpstEdcwpiJQHIUb3cBECnOJ8azorfRWCLzLb6s?=
 =?us-ascii?Q?dEBu3hZCwzsrHCRQFP64lT9m1Pp/fLRRWZpffcayIbMHN/lPThJeeITjfbbd?=
 =?us-ascii?Q?3QZ51/McWCvMwDfMIJAQzxCtPmFpJMSoehPby6/QskAUUL57hT2odVFstEhq?=
 =?us-ascii?Q?5FaS0P1+rDygvMkRaE36RYoqDx/tmr96XOmTx5A8Szk6oAvTH3HQ+2DpXEfi?=
 =?us-ascii?Q?TF0/Vcx63gWgCp3YwPaXJ6POAJd8O6j3gpn9DCBqrC0EU0KWay76G/wO2Loq?=
 =?us-ascii?Q?HgkW+c53c8ReWs5fLNsWWy/1SNGZ44b9wgnLsrhJeZasJEKmVvO4aTFdBnr5?=
 =?us-ascii?Q?9LlD4HGSjQHynt6k+AkmPYbAnQaiT1OHRpUpnJ4pCcYb21cnPLg1u2j50a53?=
 =?us-ascii?Q?HEnAnIGXCg2OV2SymtdOJ7ZTRbsxCnIDrNUbRiapxUGFHkHk8gFvPaUrx1IU?=
 =?us-ascii?Q?BR6AOeabxWBJuI/SZRRW/XfJM+Iy0lficTobM7/ipJxjITDGnEBmtWxMij0k?=
 =?us-ascii?Q?ZyiS+EIZKe9KfXZRgG7SANGCoBJVCoMy06MZgMJw8e1CkQjZMVtTH+7c8dvq?=
 =?us-ascii?Q?OR1PVHZliGOjfEKw3FQDGLTCbv+pmHKb/9M/NtkZkDSemeV2WZodxb+XVSfv?=
 =?us-ascii?Q?6CZn7m1W3OIFtXbCx6w3uLSkxKiDeD1bsXEtP2+vGVpXl7E1oDehg7Bfz4e1?=
 =?us-ascii?Q?SjBIjllY3r7svIBig4zX1AjhZtoNpH5Aq2MP5lXyy0+XMuuapjGyyzPvw2Uu?=
 =?us-ascii?Q?099p5TPfQaB5C8uexjghkGh0jCstbzO+B9vrc2M644nhPGM2e5TeJvNHAd1U?=
 =?us-ascii?Q?tot9TiWy0sN+brRBR+Wtxrz/y9jDUw9QGuc8W3H0OEHIW0eFWffPuKrXLSaP?=
 =?us-ascii?Q?NU0WjhwMKHRzoxJy8PlYKMQ+TzVBM+BAZT2oLbCUkwg7YLhcpxrCzi6odr5I?=
 =?us-ascii?Q?ALzMTbwnTZhEXcRUOB33sQlaYsVYfDfZQvVLVpq2YDd3Y/VNdBWfnbuIzR2m?=
 =?us-ascii?Q?RDZsRIIILXRldtulR1OiMsqNmKqmoWHCyHftkhFzAqLlvPORo4l6Hfb42OJ/?=
 =?us-ascii?Q?r9IlfAtX/61xrtaAZAMd9rGxoyR8h8DlLfm20phLhhYUrI28/bvZRa5w/7og?=
 =?us-ascii?Q?Eieh19LvbSP1xk+Lj7V3To2QOXE5LJS56IWORogcc/DfuiOQveb/hGbCoqWM?=
 =?us-ascii?Q?ZFgCu/3kwiUzF0OpEwteTF/D/+t6lyXiIFT17Dmr1otpBG9+/yBeN/YUPkEe?=
 =?us-ascii?Q?CET0S8CwztZGcQOyVRCGmpHXpYNe6PWXltA6x9jqiFwFEbXmP/my9iUu/4/l?=
 =?us-ascii?Q?O9tGtDjZILfM3uHW3GhJSxIcLy4v7OmJiLtzYQyBF5wJh+ELh5YEgtsaKpc8?=
 =?us-ascii?Q?W7vTK8hqs5lA3bFjhSWlrM/5SQti8SYVRDWU2/WsCbXu88aF8i3adH+epiJd?=
 =?us-ascii?Q?3oiZLeOz5RXbWGIHgCSEGAhDy1OokMRyQqs5x9Gcy3G752Lg9QsiEK4rRhLr?=
 =?us-ascii?Q?vsvXPG7KbIYgjRFPCyDu5G0XqtxuTuC9bkJrEFneaHCmnKrlmbFtfjrojBaI?=
 =?us-ascii?Q?c5/PaBQ4TxE2U0mbY7gLCGfznibaWFBa51mhqPwe3Ewz8BfcMqiyV2a/6JYm?=
 =?us-ascii?Q?/OkZNVqbi/nmeVL+0XVEOyLOU2mTfChC5C7doFTdcpqBOLdKXBpro/S+WEj4?=
 =?us-ascii?Q?fqYm5vAtU+6ix17uJ9dP4kVVNEvL+RAygAu+WVescxlvON/7m5qn?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04f8f8c-8c23-43eb-5b3e-08de8e6b4167
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:47:24.7189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGP+LamC3IJ/3h/GtpjSlbN1EvQ7Il+7KzUMgI17DfnDsGc/u2sG3qST9wFmCwvMFjqwF4phS89P20S49bkvyZnptWgYHefLdCmyBS/GckUzgf42FQJlnRJ+WJ/WXS73
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11067
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30597-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,ideasonboard.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EDE4535D951
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The VSP serves as an interface to memory and a compositor to the DU. It
therefore needs to be suspended after and resumed before the DU, to be
properly stopped and restarted in a controlled fashion driven by the DU
driver. This currently works by chance. Avoid relying on luck by
enforcing the correct suspend/resume ordering with device links.

Based on similar work done by Laurent Pinchart for R-Car DU.
commit db5be3a7d6bd ("drm: rcar-du: Ensure correct suspend/resume
ordering with VSP")

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected Laurent Pinchart tag.
 - Added commit id of the similar work on R-Car DU.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 16 ++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
index bd486377f037..eb626c3cc421 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
@@ -20,6 +20,7 @@
 #include <drm/drm_vblank.h>
 
 #include <linux/bitops.h>
+#include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -293,6 +294,9 @@ static void rzg2l_du_vsp_cleanup(struct drm_device *dev, void *res)
 {
 	struct rzg2l_du_vsp *vsp = res;
 
+	if (vsp->link)
+		device_link_del(vsp->link);
+
 	put_device(vsp->vsp);
 }
 
@@ -317,6 +321,18 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * Enforce suspend/resume ordering between the DU (consumer) and the
+	 * VSP (supplier). The DU will be suspended before and resume after the
+	 * VSP.
+	 */
+	vsp->link = device_link_add(rcdu->dev, vsp->vsp, DL_FLAG_STATELESS);
+	if (!vsp->link) {
+		dev_err(rcdu->dev, "Failed to create device link to VSP %s\n",
+			dev_name(vsp->vsp));
+		return -EINVAL;
+	}
+
 	ret = vsp1_du_init(vsp->vsp);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
index 322eb80dcbaf..a22aaf0843ed 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
@@ -15,6 +15,7 @@
 #include <linux/scatterlist.h>
 
 struct device;
+struct device_link;
 struct drm_framebuffer;
 struct rzg2l_du_device;
 struct rzg2l_du_format_info;
@@ -29,6 +30,7 @@ struct rzg2l_du_vsp_plane {
 struct rzg2l_du_vsp {
 	unsigned int index;
 	struct device *vsp;
+	struct device_link *link;
 	struct rzg2l_du_device *dev;
 };
 
-- 
2.43.0


