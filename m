Return-Path: <linux-renesas-soc+bounces-32191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPxeM6dc/GndOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:34:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C49E4E6069
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D1453049E2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6AE3B8BC1;
	Thu,  7 May 2026 09:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FFWiux6w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160C23822AC;
	Thu,  7 May 2026 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145751; cv=fail; b=PGw57dBUOkElyaantdUR9aeOCtPtAda/pWWI8cJVrE+gzKYySJnbmcQlWuCW+RCzNRGZSJoXCrmAetaDADcRydrwMsvqg7fogsyPyqMZIMTP1J0QvM8mYRLHx3hxYVm5gbLAVlVfj5nGmm3IqFArvn6GEeGQocD37mpOsPt3erw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145751; c=relaxed/simple;
	bh=LnY2GW8QJUQjxcXrjqVaEhEPwIDKyU+P9l+1ZO3wwm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pU3sKMed0uW4KpnTvCOEhUrBFevczZKZmIePFoWPsiXSN+Ma+rb2SZyPZrRvlYFlJAuh8XYfV0zKRUAKFvRkuohoZtywsbmmpwF7wdcT9BmKnfLF772TgwSYcSCQVLL0jOiYlLfgu2sX8UMEBmquCAmMJyI07R/l4DU67wZepkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FFWiux6w; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TR+XPm11O//gZRfQxHIeP2HakwMv3z1L2Vnp1n9rIE/VSgOASiJSYCj093mXJgCwbfjMCXzH8SCOD6e8EGUhFtnYfPR6tA6amFduxu5y616+jfzYzAQZQGLPWpg2x+VlabRQzMfBEOsIZDMOqbJ/u5QquQ4XE/R6+mhfpUHQgzKUcSlGQVJDlnv+rqslrK1Fq8CBHnWkn9spbT+AMnb+8qvXHiNZ/LXAVP9gW9PsvypIPKUt5QRJXeM/STITt5HaZ1jdwKhAUz2uA9MVSMK2OuaYLFU8+XYo0ZpeOWmTu4S4yOwWPnOZgcHtyCjzjoH35teIhkzG2gWc0+NjNt2YkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bclOfj4CfmccxP0fIkl1fM8vmyaBOVnnlx8nwAdHuWc=;
 b=TTFjZYsG1gnjsvQL+6FcCdcI0AtrsLdYyDWe1V5+4I6OgRSiq56ayNTxmKjJBuRAGapa6KLg31TcKsIPIKOqo0xyM4vEI60eeOG9XtW9XHTJihaNfiLK+hgy7+ZnR2CqgKeJ6HWjjrWJUrR3MPO+i+mLGNSnAJtFewWmS0h3VUQxkSS4Da1+jKzZU2XkWbX6YY6TdcuvxGkiM8Jm2KB+SKrcwSTeaXiUPQPhlRkeBfF0vIe/wCq1v6kOVR5BZHU2+Vxcgpf1NJFE/5VCPBMa8TR0sTxVkatC5jO0Iw1+UnvozzrfT3f/mYZw+mMyD+Y199ARzKxuoQj+HZcNa4+AHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bclOfj4CfmccxP0fIkl1fM8vmyaBOVnnlx8nwAdHuWc=;
 b=FFWiux6wfC4Z2aWi3Jook1VK57y4sAwrxjc0Xemtl0yy0fmaysRTdgDuiep+TPGqJuVEsht2gvxxBOmeFF/XMjcIFW5wTw57+c7cZSt3yejTCpML4d6FolQ0NNS+35DCqakrgSdS11QW1KKNawtzRTgtPNXOvRB9GO6ydwJ0CQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB13787.jpnprd01.prod.outlook.com (2603:1096:405:1fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:22:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:22:24 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/13] dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
Date: Thu,  7 May 2026 11:21:29 +0200
Message-ID: <d1e0d4e0fe74e60345a3d043fb4f9128c1057638.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB13787:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c72fda-b0ca-4d3c-505d-08deac1a259f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 E/H5wry85BAXdlUhI3pw3m9mHeEK477a30TxsYS4+fQGevfU34qroxXXsgxyZ8WeEYMNSXhMaOMPjv9wHYJDCPIBJPfM75BLORspay4nkosgLkW5+uZSMHwjEm/dACMceg5hKM/m7VPaa/tiPFds55oHoBAeo+AAdUcKUsJlUFVPZw8M3Wx6CYXerO4n9j/14K5irVGIYoQXVoSDQp9nf6TFYIZvWKZaJ9jx4nH278oo6QYbiXjJdUO1uWQ2pdYlSRnJSKWWZhSq1vaWkw18eVbYAJCoFlK/z8aNRHtFWZTwHI/6jdDZ1a5nSTt3KdSpN5D0/cGQ+VYT3pDnQ1BeWyJkZCme1eryGclbZ8F8OUH9clSEtCCq5mFxlbT8AOL0AQxOOOu8avussjeGACdLWrUt7Vtd5ssJvM7dauLqsV0zk6vSEJnTgKXMJUN1/FXOjl2UywHRz38ovAAy4FnKgfvxXh/eNybfr1HpwH1k0c7X4ZQk1El4uJRgx8/gHbrw+X0uF/yK/5m+clgTzlJoHue+804KkmHnuqAdOHIFtZDKnsET9WAv5nhXIpErHoHW42LSlOARWPkUTjweD8KJgM692j1okk+j6YuXetddDg5J+cUc0XL4BCPcf/sD7J1hwWjdFifem1wGSAp8BCr7rXdQ5Wlhou/3Onw6a61x+C82MxnRiVduur5WNvQcYLr4SkmCz7G0/whLJ05hQ9bZaj5YWOghcZSYb/B/8KyzOvUR1IjiQVq12M4evFcgvFsA
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?igRlVVvEb/wITwr1t946NT//ATXrXfNtACcYsq6A8iiMfJsU9w+/wC4w4M0p?=
 =?us-ascii?Q?7XpWj584LcJ9E8YGRfSro8hn7tlWKA3X3dxGHZGXllPXjOzEmifG2T2l35M5?=
 =?us-ascii?Q?tyXObSMl2LNyE5igpNJWsmvJMqwQdmKGJ3Tv4F+Z57VYokUktn2ofbYAl4LF?=
 =?us-ascii?Q?Z0l8gTbARXxbM0nHcGZTel2MxgqKQROWYPPw9fVzHVSidt7X2/glMhy4LPh0?=
 =?us-ascii?Q?sezvcNdVFfmZIVmpU9AFBfUo5dT8f93zPWSHbP9u8jDElkWl5jCZLBPictXI?=
 =?us-ascii?Q?uUB29xB2F1N5KHVYnDM1gdrsY2KkzgMFVVihqQouB7V0Xv6QbhSEZFtTVr1t?=
 =?us-ascii?Q?H8uzZ+a/HQVkoWsahSQNJmoEk91a+IocawdkPM5i1x2DhiEBmsOeEj7eYrUC?=
 =?us-ascii?Q?DIHixBwF4hLcA2/M4uk4oE07kQnZ60mDnsATaljZC2WRLy33NiRXOnoy08nu?=
 =?us-ascii?Q?pKP2kl+tBp/KnN6Tmgd9Q9cb05NX0exG0rDvmu11xz/+1vM1cKXnFgxLtVjD?=
 =?us-ascii?Q?ffTSLOuCs3pyQ7dnZ7DK6pabiO6c3d7kKjM0NbcU6A0uJwYq+8WVt8wNaxQa?=
 =?us-ascii?Q?nHhJm5BeJY+xYCau+0OIFmL6qqIEu0iXw8lSxSDnFucFz0XKDAQQC8rgkADe?=
 =?us-ascii?Q?tKcrjU60i5xYmAL/XEpdUCTfPRwCA95zPHyXJzHPW1In4Gdx8JT1WEo25kox?=
 =?us-ascii?Q?SGi6mPxhE6cZMQwsmiaWKxIV6bF0w7Ai2qnmqQDnmzJvqNbY91RhqYjkMZxt?=
 =?us-ascii?Q?l8wsk+vxhcHqSWpLBUKz8rPlimMvymvF/BX+BW4KM+blq6MWJlONE2xk6igX?=
 =?us-ascii?Q?fUvqAT44LU7nbUtEcKWTPDSvRSRp4hFbzv2m2/RAZZ3yLHzJRtDbIoMIk7PT?=
 =?us-ascii?Q?NKGpNaD9QTTJ2uijlsuZzzPrE5OluJD++DQg1aXMIjwcKif7m5B4q+dgoTne?=
 =?us-ascii?Q?dzV/4z24pVeiid8IObHOBIuNYwN4IG2gnZZZfrIcNZlyjnktVBen2A+WWdq/?=
 =?us-ascii?Q?NDdbxouoiO9VT9epTJA0UjzNcaqswIQXujgUVx9F+1m1FrCdww6kyEtDXAo7?=
 =?us-ascii?Q?Wm0cUjYjX5PxMs1+GfiamncZs8o3T/HWLe+W02FhHV7n5aZTtlDFU/fHWNs3?=
 =?us-ascii?Q?SSlUBkakt8gs3BbVfIIqq6wiWwFUL6xoE4fKvm19FcePDN8D++N8JJH8pvmj?=
 =?us-ascii?Q?NBmq+fq4XwkklXWmF5PO/wgvW/JOEqqU8OO5Yn7mldtMBfKVtonOoSV8CHBq?=
 =?us-ascii?Q?VGP9KDrRVsuQgxbMnUNnWuYyv4S4G1JQYE/uHq8DKzF0SNH+WmFPSDtSdhMr?=
 =?us-ascii?Q?orfPssT3rn+rH7nf4ZzbkWkrU4xAhHGdWE8Ja2ez0Rnf92u4xRXj8MijuCh1?=
 =?us-ascii?Q?WYu3eSBjey3c8jmWGnqncqhJShPmEknwFiCHhEYeoxYJcR0qYguS4ssxWI3J?=
 =?us-ascii?Q?dHrZU3i7B6j/A42j3SRlxsFJQbOyZWSF1tCXBY4VNNRKEng5hrHnu5YNOfeM?=
 =?us-ascii?Q?/GaOOoIbfYjodi7bQk3CkXXKiB5hnmXIgTVVjV3QwutO0Ly2sKxOXufvLNeV?=
 =?us-ascii?Q?Eu2GEFmyVbdISt2bsq52+Tt2DA0TXx1WUIx19QX72BdhcxEl049ji+Lo2qk7?=
 =?us-ascii?Q?Edi4mrPIJOPvoa6Ea51rUVzeTWTm2/yrZdrVWAMMmmwChCe7nyTLWPtzMhmu?=
 =?us-ascii?Q?PKQyYTOPoc3OSlcX2YZ4/+9vyaSjzGHdw6hEM+s3VVorbE1v1pqNmD3mr3u5?=
 =?us-ascii?Q?bZEJH8jmwI3bDO4RTVsvCIoS4LAUJvXHQWy9HnOUKtOx6MQui5/g?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c72fda-b0ca-4d3c-505d-08deac1a259f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:22:23.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP/5nEpO9PfVNgPHLfoC6lBe7OEdYtmedp6/a+t4e9bo5sFNq3OA7lDciuoljsm5ts6jkSri2079K+4pTDjf7xQuM0MfHsyC49QDGiTVE3VTkVkYz6IwTs4dzACtTajD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13787
X-Rspamd-Queue-Id: 4C49E4E6069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32191-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[21];
	R_DKIM_ALLOW(0.00)[bp.renesas.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.958];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,0.0.0.1:email,renesas.com:email,ideasonboard.com:email,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: add header
X-Spam: Yes

The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
port@1 in the ports node.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - Collected LPinchart tag.
 - Removed wrong fixes tag.

v5->v6:
 - New patch.

 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 45678d536a75..0d7df210407b 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -108,6 +108,7 @@ allOf:
           properties:
             port@0:
               description: DPI
+            port@1: false
 
           required:
             - port@0
-- 
2.54.0


