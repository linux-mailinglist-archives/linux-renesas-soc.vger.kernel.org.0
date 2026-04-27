Return-Path: <linux-renesas-soc+bounces-31683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCY/MJhf72mHAwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 15:07:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3C9473254
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 15:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A601B3014793
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8243BFE4D;
	Mon, 27 Apr 2026 13:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RP4pLYy+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C793B95E3;
	Mon, 27 Apr 2026 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295075; cv=fail; b=lLOrRbQvCusH/Xi4k8+Xz4CgNrsZ01ANt9QxWpEKJnEkCtByAiVpjdLmN4A5O3fv70WR/BB6X02fRWB2OO2Rd42sknXb+DsAYEkLsc0S9MkhX08p7D0xeZAqWCbWOi27DqQ25sAg/CWHOor9OE3IV3enqgMP7LzjLvKvVh0xRuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295075; c=relaxed/simple;
	bh=2d5cuF12CoweuwSGY1TlOL0Mmwfc1IJK+UByqm3rAyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JaJ3jRQWF2oWcKHw2FA3oWzjbBFRTHQvEvI8Zl7qgImqjEAqPQP/izHE50cxsAw6QqgkMnLtECeIzlG238Z2Yx3b08u+hx6647tMg/hIManOdQmDfmVQX9CpL6AEOaFHxFfxL6kOHRn/0oO5rOfh+pv/DYyHtxJ/ECqlcgTVZlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RP4pLYy+; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1TuTSokXrJr3AW1qTOTpVKz5UxsrCvrhGxvSr2PjHGa6e6aTcwdZTJhWZ7l0pPmy1HFiUkJmsVIh52Ql+RaIdyuOmcGkzhrV/zcQ8AC6EszwMpDYpmZsksqU69zlbkMD0Nfp8f96ZWc+zLSkhSQhpaxcumr3dMkyBVulkLAT8N/GXhsQD5ZSuhUTRCel7eDXaFpApZ+azXmdoub0VqNw7RmLXoKwMYIW6gPM+wLewcmlsfMiCZrR6Zb5lVAFTvAla6VAtYIjWYUzbnI1OWjI9m56H9xgvkDumSwR7VOEBYWtY5kC8uCpmfOrMPZqwpGqyPRkOHZJY8Cd2eiRykT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NgQyiG3ilwjXoev9rZHgxbg0lxwm8Yysz/i4hI74MA=;
 b=OiiJumvFw+zN525wnNkztunsAfy8zODz2B914bz891cBW4Gl3bA1kd5vZpxORuxQjog0ARnYVC37PeZ7o7UXRTd5F75I75p1NfjW3b5BtKHKxwEUUkMdOgBDulwaGWsIoWxfT4Wo5/4sS2KOQhpqP7SXX06La6Ahe9nA8jKUfsZ4FxsQfYyCFF59cbjd/CP5Suz343LXKHYDIaJuthqm09JuHZBMf4+wSGeGReOnVE0f2n2yA7ZI2theBP9TKY2Ve6vkuEZf6DyTWipmXoWzM18xanjLL62seZRjY3lYucLviSKiKmKCQQDu1ZAKVJUknVBSBNdYGJzzG7n1raEhCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NgQyiG3ilwjXoev9rZHgxbg0lxwm8Yysz/i4hI74MA=;
 b=RP4pLYy+ecTfmJ8MS8QLcIwSHJgg2spzi0ZLnaWfdQwnwEyP/EIUO2EMTlDCl3d9TaNxQ9mNDYa9u3qIecDEuH7fal9qQCuiMeHN3qgDJPj25DCvsK0+WVOUVoM50yGSzHJxhaxNT0yN4Pb4+6P7bab/n2PkAK2BMDE6GUKe8gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9376.jpnprd01.prod.outlook.com (2603:1096:604:1d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 13:04:31 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 13:04:31 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Josua Mayer <josua@solid-run.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 1/1] mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
Date: Mon, 27 Apr 2026 15:03:37 +0200
Message-ID: <582eb5408684786577e5fa85b80f585c8739be15.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: b649aa4f-4f00-4c00-7ab9-08dea45d855a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	41TaBC6Jx8x9PbQoN00dj8pHd8HLKNq2pGDEhfIPb57LWbUhzbmxR96DJLRNxS49XCUdlZNpMmBNOShjI/n4qM49TAIkTsmjGEPyYha3jUI2bwC7zBneCbtIVCka2AconAh5IfgzsENf9sCapmUl6rAy2kJ3sMsnC6F0UCg/bvlF3Nhb5rtZddw7lok79fvG0VL4N7pnInQn6xwd1Z+G9XuJewCeFp3ypoLEQIwALkKc3AiyAEmmiD1x8vSiRSwbVwkPFFpEtQSUwR/zJNJ1E8VYM2cIm5kcWsOW+T/i+0C1CAgKT7zH3G/WDHagSGr3xBgbbhzxU3Ub3O9Zqxg1gpE14g6+yEQVP7FEx/678vmWhmc5F26PqrOyTAcZt9Pim9zZr2fWeolYW2uS1bS07GDv64ahGjNkUYXFlShHfw/B66oa+fl+ii1wSEHdYziUyw6cD8C8OFPhLDQmd2eSNnhJtOn/3J9OH2XPYffgBWM42uJRdJmOJ5nRL81Cb4HVoSNVPTMlR/n3moXTY8Te4sw8XcBYkCx99zKJudqXiHEBT08gwehYzdZHre3ZmTOMZpPQUkBfQX/HpzSjJBRjxzyGuZx0HJ7BwVzfF+fqFqa3HJWikTVRTIW4r8/fVC3WGgrXUvfEFO4/7P85RWglrPTqbskyvYduWY1zhXjJyI+Pn+tKuo6dpsPjOxFsrBlo6c21YJ0Yj9nqSueZXrn4FDhVL4xgOihTEGX0uMtJLkzhsh5J/OB0rh5FrjHemDTUGJ+BJucf0QfINqUiG/cW8QMtbec+ZE9kCJadaXGnbm4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AyNXGkgWX5fsCk+cgg8zcegAg/WBm77PmMVuo7aPEuYb+flO5rZebhZZqyeP?=
 =?us-ascii?Q?Gxa5H4jD3zocPAm+Qflt39wPN2N3jTKI5K0t7tKw54k4kB4nAAWK90MrhDi9?=
 =?us-ascii?Q?ScqIbiqLL2d0Dq0tLJK/XQTmwmax+GC6fNzzlYPt14Z1sH+PAzJYczAtDMi7?=
 =?us-ascii?Q?attwyhhXHZBYh3w/TgPqEvttSaYwtjdx1BGAy+QuR0qHfq7rTLXS/agRN3l8?=
 =?us-ascii?Q?CDnsEDz5DUEPDMESXP4MfQmXE4ljATGOLzKWUM8VoPHVt6muSQ5AA6nJjE3h?=
 =?us-ascii?Q?Q9ilFp2350s1PliTZMh1hcKhRcKUlG9hzU/eN62ywaYxRvrdeMAS4s3R8Jxj?=
 =?us-ascii?Q?MgyGoZnXL0LJFnxV+vQJTJD8eDB7opaoTnYi+Gwle39TUKxiIXb+lG311Uw+?=
 =?us-ascii?Q?E5QrFcx7ADnQ7HQdyHykDU2c1BRr9te2OLROT/+E5RDCTSJnlvaEzGRWg5iZ?=
 =?us-ascii?Q?QhFSkmSq4fXSA/haC3oAOGlIMtJmkBwZl7MkOdcp1CAcycbrsLdRgBwGF7SK?=
 =?us-ascii?Q?kV3Hj72L0F4BAh4CwFNqVlVJCr9qjlFfPWmSyCqCdM1K7P0eruk+QbVNWzvJ?=
 =?us-ascii?Q?0BXTQLzhCm7ONE6dWavlO3nzqsg2QRZeEqnAEJl/WT5RMxzOKDxud7mYZHnA?=
 =?us-ascii?Q?MU/IM9TWQzTJZjI9h62LcFWZBpbcZ9Bac3z36UX1Gt2Lq5U78EIBL1fTC84t?=
 =?us-ascii?Q?8siJc95hbi5y2LIghY2zY3lOx0OYr8UpgGKHc7QqvIKNT+u5CgSzXROniM1K?=
 =?us-ascii?Q?KGUdOpUN3ImEv913VnzCmfAX7+joEQUGdcSdfd3ueKnC2bKNVGtkZetyIdAW?=
 =?us-ascii?Q?/QYeem5GQzrOfDTmjzDlTkN/s1irmSQNI00iY6UyL4Bne+xEd067Yv4czmhe?=
 =?us-ascii?Q?mGsFGt/eb4unEns0MwevdAAn2kvaq6x/8cS6ShzbPW0TGQlRbryICCBBeTPF?=
 =?us-ascii?Q?zOeREqpRiKawpdq7l81wE1VL32zcnTP8PVnWgQIyTFCs/kWNeWuQQsIlQB/K?=
 =?us-ascii?Q?kNbynXtlO10i3TddVlQyfkvoizqBdr8QbfYH7uoPQYZdYxFhp5xe/LTm3XrP?=
 =?us-ascii?Q?HXIQpfyUpJtw2Uru0YtEZW1ap5IHMr7QbVQkvCxNVASju+a894g1OCD0Rslc?=
 =?us-ascii?Q?ZoCMD49xpvPIc8Evz3xUEn8IN03XGU6aUm990Hk2SGOvmBpDWghmJxlhgcaH?=
 =?us-ascii?Q?/EdOit/ulzVTDfQDa5OL5a8wUtLXyi8trHDxPRJYkFZebdE28gtWgznVSDZA?=
 =?us-ascii?Q?3k+GcJWHNC4ZHirtUtwfZEsEuF4FsMPVoCh+8P9AkRgYVTSqSB0+EVeQOrOC?=
 =?us-ascii?Q?w3h1/JZRJ3Uo+pLcC5q3Yqoi+pecmnk/yztPOD06SjFWwwSk5QsCa8dn+eih?=
 =?us-ascii?Q?GUpbfUAFynDTlw6Qz3dgYKz4UK8l4FistNw3L9meUtQd9V7x+ce7AwARtzM9?=
 =?us-ascii?Q?UM2FI3DvmrGtQFhF6+czO+tF8S9teCHuxzxRNU7ufbpZPo351UNtOgfHT+nX?=
 =?us-ascii?Q?sOtBPt5E5z/1OIcXu1UAEelXcUzgbf48a/4PW2SbGu7c5FS1Uc5jadbfMUeF?=
 =?us-ascii?Q?XqbLOXMe3dN7VAAcSsMDNLNHZng8Ps/SK6UOU0aH+i6j6oQ5PTWKq5DVv5/P?=
 =?us-ascii?Q?r+pTbfZ2LnQh+cDvOkgVfn4R6Coq7j6D+Oe6UJIXbjlDOKljBZy2J+GPXdgb?=
 =?us-ascii?Q?zMxmCiUb+Tec6PwXPPJjGU6IBWWGwlzlYBv3QjZW+YHkytHqcBJ/cFzKA3qv?=
 =?us-ascii?Q?AdJyB+78+VDI7sQTyVdnkPhIPjPMtqimNzw85QVw3uOQ/JwFfJkf?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b649aa4f-4f00-4c00-7ab9-08dea45d855a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 13:04:31.3533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWKf/uv69CxE9Y8Zq6y9VC84Ul5ytIUSxzTccA6rVl14PJIywcl6TAJ7N1y9aBUVsMRugltzwetG769b7QIvWeSH7i+2H7Ww2sZZtrMunFJEa49r1/PsaMDdB0rf48L3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9376
X-Rspamd-Queue-Id: BB3C9473254
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31683-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid,pengutronix.de:email]

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v10->v11:
 - No changes.

v9->v10:
 - No changes.

v8->v9:
 - Fixed driver comment year (2025 -> 2026)
 - Switch from devm_regmap_init_mmio() to dev_get_regmap().
 - Drop unnecessasry include bitops.h, of.h, property.h and
   drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on regmap.
 - Collected PZabel tag.

v7->v8:
 - No changes.

v6->v7:
 - No changes.

v5->v6:
 - No changes.

v4->v5:
 - Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
 - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
 - Updated commit msg.

v3->v4:
 - Removed mux_chip->dev.of_node not needed.

v2->v3:
 - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
   is an internal node.
 - Fixed auxiliary_device_id name.
 - Get rdev using from platform_data.
 - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
   as it is needed.
 - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.

v1->v2:
 - New patch

 drivers/mux/Kconfig             | 11 +++++
 drivers/mux/Makefile            |  2 +
 drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index 6d17dfa25dad..7f334540c189 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -70,6 +70,17 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_RZV2H_USB_VBENCTL
+	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
+	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
+	depends on OF
+	select REGMAP
+	select AUXILIARY_BUS
+	default RESET_RZV2H_USB2PHY
+	help
+	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
+	  RZ/V2H SoCs.
+
 endmenu
 
 endif # MULTIPLEXER
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..3bd9b3846835 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
+mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
+obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
new file mode 100644
index 000000000000..79197fddbf74
--- /dev/null
+++ b/drivers/mux/rzv2h-usb-vbenctl.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/regmap.h>
+
+#define RZV2H_VBENCTL		0xf0c
+
+struct mux_rzv2h_usb_vbenctl_priv {
+	struct regmap_field *field;
+};
+
+static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
+{
+	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(priv->field, state);
+}
+
+static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
+	.set = mux_rzv2h_usb_vbenctl_set,
+};
+
+static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
+				       const struct auxiliary_device_id *id)
+{
+	struct mux_rzv2h_usb_vbenctl_priv *priv;
+	struct device *dev = &adev->dev;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	struct reg_field reg_field = {
+		.reg = RZV2H_VBENCTL,
+		.lsb = 0,
+		.msb = 0,
+	};
+	int ret;
+
+	regmap = dev_get_regmap(adev->dev.parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	priv = mux_chip_priv(mux_chip);
+
+	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
+	if (IS_ERR(priv->field))
+		return PTR_ERR(priv->field);
+
+	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
+	mux_chip->mux[0].states = 2;
+	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
+	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
+
+static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
+	.name		= "vbenctl",
+	.probe		= mux_rzv2h_usb_vbenctl_probe,
+	.id_table	= mux_rzv2h_usb_vbenctl_ids,
+};
+module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
+
+MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.54.0


