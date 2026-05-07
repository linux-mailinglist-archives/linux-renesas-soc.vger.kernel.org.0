Return-Path: <linux-renesas-soc+bounces-32194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C2oGMFe/Gm7OwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:43:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851B4E631E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE92230728BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F16370D5A;
	Thu,  7 May 2026 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Yxcrq0RR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EBB370D70;
	Thu,  7 May 2026 09:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145765; cv=fail; b=FXSvzE/WQwd6pXGxuVAsUIPCaFz6vKgeAfEcyiMEjsmNkJkWA8bQSdmA/0xETnx8QsR7p8v85eEHDiDP2yc0yF3IqZrFK4M+/LAFAdsNyai18ggQpDA1RJ7OBvC82ICArVl90fLQATksbBKp9/X+RRVLzeCsLrPRX7XZXhdiDjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145765; c=relaxed/simple;
	bh=4ynxWyrmdEbdI8hnqDoJHgZN0kMcWwi9KDvgji0H1lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JnnGrLJrA2myMpTxZKWsdOvVDPOXO39AtQdpywpZFYVNPIp2pU0B1wYNqLkzosobJ8LnPGeQm6If47rBK4/HbTNod+r4C2o0THJtT5DzQ4zuljLKZLoQmTUyaPqIR+bNxxCcNCDCrvadY6zbi07cK4Sj2UlIlcuSF1tT94C8pUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Yxcrq0RR; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBIN7Q2rMyVtTN0eI1bIwOn1eqgJgufAxyPPZpTVXWz/fSmjsKNoItEQu6p9aqQB5gqZxLrURtlXaRA6ViD5VwTg6TsmsPkdve2QqLA9MpHoRnca9ysvbUpp5vpup1de3DsltguCT1+CnulJLOkUAW0Demyh7Lcs0gcKKDW2jL3Y9TH9slYmatqwxM3DkbchztMlCYUZjhL7yQt9uf5Y8Z7utFHflkiMNbdjHz+KUDrMAOqFeBd0QfLAA3OglL9cR21kreC8fiWyKOAf1ACyzUxYSFhW/BU4GBXk0bPAybYlC6V+/QJ78Fxaca+AraPvTZvptGZjI5TFJ+opi3cuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnvNeYDpIS+V0Hy3z3ZTUXuN0bnepuJRR4fEQC4gejM=;
 b=dn6vuWdinaxImUZfHoCWVHq0YGVGf5m+W4RWJWLTTuFNV3/gw/sS0KyOrj8TEIRcLjQOVKsBOA6UHtvzDKltVS36gVwrDeSD4Xv1RNMLnEQ99Loe1LiJOkKx9zns0RlcwL5rYowgSsEcs4BlX718XhoL428ShIFbzrGJ8wInQCmnRMuSDsvm2dROEYDA0zTFQ5GQ8657bnn1EukSTM8p4XoeU/I8xmS2ZFZEY9mmTLK/lWdkI9ly92/SVi9UNxYlBol5CfF5cFoabtpTFT2o2qVa1oTlGN9u8U+0QDv+tM4mVICbMg+5ZoKLEZRzNgvu6gtomXqVJZ+H42e2gb0/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnvNeYDpIS+V0Hy3z3ZTUXuN0bnepuJRR4fEQC4gejM=;
 b=Yxcrq0RRfmIeVK5XJyKYLqoR9G5/EYJj5gGG3umoibMHQ76KPFKs2N/vxIcdU8QMhZTbevnHe3jNc4IIcS6fMVWywjTWzH5SUOvVpm9Zrv1+Jmt6AmISz/KP83lq92reZ3EM4RKdKt/9M+EltRmp0F9Fa1thZpfWCLMPR3+Z6Vw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB13787.jpnprd01.prod.outlook.com (2603:1096:405:1fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:22:39 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:22:38 +0000
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
Subject: [PATCH v7 03/13] drm: renesas: rz-du: Move mmio from rzg2l_du_device to rzg2l_du_crtc
Date: Thu,  7 May 2026 11:21:31 +0200
Message-ID: <3e4817b379f2452e488ebad976fce6d9e5e090af.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8de04ec3-cad3-46b5-f171-08deac1a2e76
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 58hlTwQsc7YQEYd6p3PkVGZTRHSaAFTl7d5kVJCGoXLxT8e61jV+RBG19+0UUMXMwCfG//sSoC+C/Y6rvH1vsyFGnPVvCQsFuMbi4BMdXOSukpzMPM3bLgw2cFBdKpbnhYgdoV5t0EJK47ExP+9u/33u/N5MMRne1H2Gyz9AIn5BvqfKLcjJOODkTUBzFeSUuyPzkEDVncUKDkaL/kcPo6trjGDIHWJQuBGkCJyzAW2SK3ptPiiOcHehHqOz3C52u9ZaU+eKVPHZGv8nYISlV3449DrPEddCQ8dtUMenADCGKMIm1+tsWy8YRL9zqvFc3Z18zNr2/V7zG0Q4jvvVakAOjX+xLgX819yPl3mOilV3PMyNjAOqMsuDB/ip/mWpHlpIID3HwO50n4ANjHkcZCrnuok8+PGErgiAb0TOomi+z9pieSXIa1HLNsBKZFSjB0koo9L+4OyBXVgAf2/ESXP3MTgwedfC3Cp2CK8zsYafhOmGQ5Ic8kAcjmzTcwP11xBN49oApaXDNkMyhGpdnNhMD3KGPdnVmEhAi9TaAVXkedtvNtjqdxgJ9NUNWEkRYPFiQebyNbcsYfED0QBX6EtJAECKDRQ1Z/I/HB3irqlILjiNqxD0VGNTfuDdL+28AchiqLCTPVt1+WmZoS0ygvrf6iekMFwHQ1EWIHJlIqx0qGCSXpU5q3PNbZBZS5sv50AQFLpWkD/UlFjLVWImLB8Wd3A5j3S5Xc3//5uaKOtsuZnonDST08cQgYKFfqz/
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WnTd0f4tFUC5VapXe2PBNW/kJLdioTLJY821oN4P0aGW5Wmi8BOZXbNiCQBO?=
 =?us-ascii?Q?ZzdoR48a4LXfG4VG4XSCRiIRZ070Ykb8/zWSQtHEkvhonnrIXjUQ021ScxO1?=
 =?us-ascii?Q?EXHLKcm4T5oLCTugOl5zbFU0sDpi14LNA37rlIaxasBVGav3WruTN2aOSbDH?=
 =?us-ascii?Q?o44LSxDZ+3wrxlRfxhbaX5k0AMzXEJHW+TPUBR1ak2RSWXHi6edX/kalDeMQ?=
 =?us-ascii?Q?ivZiklrBoSXWXxt6gMx/idqKZY1cjBQ7tRczpNIaMc9cDkb6YL7tH53ljNWK?=
 =?us-ascii?Q?NyUC0Jt9oGGoraQEtyqjYkZYw/D8ClcBf9A808k0ydJMJxza7Oco8A8Okli7?=
 =?us-ascii?Q?O/plVQ7757f6Tv7xufrndbEKE7f+2jEvC/G8oBkrDBFP9Fx+Op4B/OEeFee4?=
 =?us-ascii?Q?34MjH5it7fyRDvdnrU+VJcJZ9rs0dbTEXg71PEZn64vHFzGcAzj6/i0r6FWK?=
 =?us-ascii?Q?c6dKrQk8PXYzCoW0IJDV3CJ2dB5G/TMGMDzLj8Re7U7+fvLDoQpTnzO8xolu?=
 =?us-ascii?Q?qaxQc8jIRgwAUMpjzurDfC+gC9ypAS8kF40a9hWcPxauEbFa4DESO1deb2kP?=
 =?us-ascii?Q?W0HLuznNzi0cU7X258wLWOJun2ixNGqeb/6nmPwLBCCp1t+FA3Lm+7kHMalz?=
 =?us-ascii?Q?1W2jh25YSjnW3khZjTjGn4tqsu8qIRXuXwOf9PHXL25+JFnbidvFeGACorVe?=
 =?us-ascii?Q?5+wA06+ajNGncHRKmeLk0p4dSuJA4qYgKAU+G/3c8at4FegAHtKUALHTqt+8?=
 =?us-ascii?Q?opa5c75cztmP9mMJ6nHRo3JUULHUFbx7pWGQ3igpR4pkLzlHK4cE+Ffh97iz?=
 =?us-ascii?Q?fyuiQ6QeoQdtvgAYLNLJNZrTpVn8zOFN6vcjs/9os2eH9gArintTMyqtWkJs?=
 =?us-ascii?Q?aBGFdOVqHvHyZise9v2VwFbv90kbP7OBwfk/lH3obOiFgWzlz9JR86WPG2jk?=
 =?us-ascii?Q?h4eo1S6Pu5VzRd1Rs4kb2s8ohMSm3udOALAEbIrnf9LQb1VNu8PnteU3bWoX?=
 =?us-ascii?Q?9vfVGjW3lpwidVYB4hBTyaRasZxcZcfKAr9YwqGVUQ/53URAHqiuKdHKDqjP?=
 =?us-ascii?Q?i6onz9rjJRb+zVkSUKMwx/6wg3ac6jZTqCJBYboMbx/sTnMrPD4CfY8NzWbW?=
 =?us-ascii?Q?fAMiZbUprEqyyiyRoOQFcjMRum+VWE9+bD1lwskQ2UjeECkrfDT/uyd9YVay?=
 =?us-ascii?Q?Ht2+7tGQ/CqZbSV5Z5T3nwhdYrKXBUNuUuenD8p1uzKU/lPOvkTAT8iu7yvG?=
 =?us-ascii?Q?q+Zb/BV7jwU5KWTgz13H3PxXX5TvtggYswJEUE/3DmoRfHokS4UaHuxiOrzQ?=
 =?us-ascii?Q?Y9bURtGYJ1CTWoz7YfCHnJzT2IAO8O+5tzeeorShq04J3ZaEKdEgF8QdlI41?=
 =?us-ascii?Q?Rft/ESz1JN8RsDewF/Sr+5cMHYXUj2cDnyF1uYL/Qx+ed0dVeyJtHpHZEo5R?=
 =?us-ascii?Q?tXihrucy7ARxZB6HdnGMcaN5gftmlfMM4j0MPg7z+dMKjPYpeTwHiRiQR/sS?=
 =?us-ascii?Q?o+PK55rQQ5xCojwLkPl1AlS+rf8fkSxGzOUhWKS6WJE5I89XO9AB8880oqLv?=
 =?us-ascii?Q?d454e2vgtnCcALs46TTE9vMl1pxjRItzZNGjRhqH6QBuVTZUuW/br+zzbz41?=
 =?us-ascii?Q?gifizkRQdnrLQhZYVvSvmI9jfu7+ER8b1htqGTv6soNcdFm4tHFjqgLW28lC?=
 =?us-ascii?Q?jShaWL06iVU3g6IKMNfaKgVg+qRqp+K4PoEtPYWIGO4Cd0qBj9DOnbcn74/z?=
 =?us-ascii?Q?Hsyk2vBv7t6GLcQD9kU0++uB30AiBfXlNkVQ1eG2y1+7Hh3Vr/U3?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de04ec3-cad3-46b5-f171-08deac1a2e76
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:22:38.7196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7TjG+iZa6/emZdnsGtV7qA7bTPnBXQFfo1XDNYngKYpl9Y0GBP+9YqSg3n7PIglN41gAFx0RRNyG72mkuzOeLbuIpvdLNotkWeeTQmLtFgF0l0VYX34dsNvS2KVfcLH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13787
X-Rspamd-Queue-Id: 1851B4E631E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32194-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Action: no action

The mmio base address is currently stored in rzg2l_du_device and the
devm_platform_ioremap_resource() call lives in rzg2l_du_probe(). In
preparation for supporting multiple CRTCs, each with its own register
bank, move the mmio pointer and the ioremap call into rzg2l_du_crtc,
and update all register accessors in rzg2l_du_crtc.c to use
rcrtc->mmio instead of rcdu->mmio.

No functional change intended.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - New patch.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 23 +++++++++++--------
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  2 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  5 ----
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  2 --
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index d0f01aa642a7..88915babca12 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -67,7 +67,6 @@ static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
 	unsigned long mode_clock = mode->clock * 1000;
 	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
-	struct rzg2l_du_device *rcdu = rcrtc->dev;
 
 	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
 	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
@@ -90,15 +89,15 @@ static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)
 
 	pbcr0 = DU_PBCR0_PB_DEP(0x1f);
 
-	writel(ditr0, rcdu->mmio + DU_DITR0);
-	writel(ditr1, rcdu->mmio + DU_DITR1);
-	writel(ditr2, rcdu->mmio + DU_DITR2);
-	writel(ditr3, rcdu->mmio + DU_DITR3);
-	writel(ditr4, rcdu->mmio + DU_DITR4);
-	writel(pbcr0, rcdu->mmio + DU_PBCR0);
+	writel(ditr0, rcrtc->mmio + DU_DITR0);
+	writel(ditr1, rcrtc->mmio + DU_DITR1);
+	writel(ditr2, rcrtc->mmio + DU_DITR2);
+	writel(ditr3, rcrtc->mmio + DU_DITR3);
+	writel(ditr4, rcrtc->mmio + DU_DITR4);
+	writel(pbcr0, rcrtc->mmio + DU_PBCR0);
 
 	/* Enable auto clear */
-	writel(DU_MCR1_PB_AUTOCLR, rcdu->mmio + DU_MCR1);
+	writel(DU_MCR1_PB_AUTOCLR, rcrtc->mmio + DU_MCR1);
 }
 
 /* -----------------------------------------------------------------------------
@@ -223,7 +222,7 @@ static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
 	if (start && rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_DPIO_OE))
 		val |= DU_MCR0_DPI_EN;
 
-	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
+	writel(start ? val : 0, rcrtc->mmio + DU_MCR0);
 }
 
 static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
@@ -380,11 +379,17 @@ static const struct drm_crtc_funcs crtc_funcs_rz = {
 
 int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
 {
+	struct platform_device *pdev = to_platform_device(rcdu->dev);
 	struct rzg2l_du_crtc *rcrtc = &rcdu->crtcs[0];
 	struct drm_crtc *crtc = &rcrtc->crtc;
 	struct drm_plane *primary;
 	int ret;
 
+	/* I/O resources */
+	rcrtc->mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rcrtc->mmio))
+		return PTR_ERR(rcrtc->mmio);
+
 	rcrtc->rstc = devm_reset_control_get_optional_shared(rcdu->dev, NULL);
 	if (IS_ERR(rcrtc->rstc)) {
 		dev_err(rcdu->dev, "can't get cpg reset\n");
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
index cbba38acc377..9b2deb3c589a 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
@@ -29,6 +29,7 @@ struct rzg2l_du_format_info;
  * struct rzg2l_du_crtc - the CRTC, representing a DU superposition processor
  * @crtc: base DRM CRTC
  * @dev: the DU device
+ * @mmio: base address of the DU hardware registers for this CRTC
  * @initialized: whether the CRTC has been initialized and clocks enabled
  * @vblank_enable: whether vblank events are enabled on this CRTC
  * @event: event to post when the pending page flip completes
@@ -42,6 +43,7 @@ struct rzg2l_du_crtc {
 	struct drm_crtc crtc;
 
 	struct rzg2l_du_device *dev;
+	void __iomem *mmio;
 	bool initialized;
 
 	bool vblank_enable;
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index fc55dfffebaf..887b840e63d2 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -157,11 +157,6 @@ static int rzg2l_du_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rcdu);
 
-	/* I/O resources */
-	rcdu->mmio = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(rcdu->mmio))
-		return PTR_ERR(rcdu->mmio);
-
 	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index baf076d69cda..d0e59b787cd7 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -66,8 +66,6 @@ struct rzg2l_du_device {
 	struct device *dev;
 	const struct rzg2l_du_device_info *info;
 
-	void __iomem *mmio;
-
 	struct drm_device ddev;
 
 	struct rzg2l_du_crtc crtcs[RZG2L_DU_MAX_CRTCS];
-- 
2.54.0


