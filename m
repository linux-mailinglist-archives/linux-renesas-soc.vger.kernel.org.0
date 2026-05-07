Return-Path: <linux-renesas-soc+bounces-32196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBziB6te/Gm7OwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:43:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DCC4E62F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0395F3086562
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28754392C56;
	Thu,  7 May 2026 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ld3h4Yrv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0CB37CD40;
	Thu,  7 May 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145778; cv=fail; b=WNI+QFoj6/Efqh44O2fc65stpo4QWPvegIy3MCi++Mz+k9yLAcQ/3VZLbiOAPjIa3sPyTzBTgA7pqhdoiUAEf2Zmc4Th73dOleF9lMUYcVfE2/WkXtLYg6DWl7aT5R0T7YmLaVJSghW2U/EVETFG89evLQ4vMS5CqtGgSDaaqLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145778; c=relaxed/simple;
	bh=YHC2Gsn71NGlY2ZGRJeG5SPc7fbyTvnCztUgVl46BNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A2bIlQJ1YUiW/oG4FMVLTniUpGlgAn/b4eFK/ARN/vgRpvyQJL7UyFTD1isGSRgs55bGyLeLb34860t3aPPU13v0R333KhKZuQLtgjjlb9cK1rBoDOKLla3cgj7fAilZI/4XlGhp5ry6vnCUOhhFIoUD375xsHG192Kwt6yMXmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ld3h4Yrv; arc=fail smtp.client-ip=52.101.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOqrY+BmcC9X2KUr8Y75698/8SrBFwC2/aNubIE767NL9J9l4fRLGbQPCW9/uFR7YliQW+v2Y4i895ohmMVz5sCxgtS0zgpQbmYA6NqOaYZbUNN9vkMY/d+si7U0zebkF89HPpZTjSSyIqqyQDuO2iXQTyJC0PhmZ757SG38P6MU5n5pgNa8aawqV5mJ7wX/HoJXmveLg9z3AItEnEAkS0wdRxNr5KCK1vdNDnqYi3rKV3o8sYqnbGWA89mXVux8gDJwfP3lG4NhnwafdWqOF74dNr8lRGM21dtTk8sseRI1SYgDoaxLr2a+xGlZFyRbdDzU+pmlw/9iUl7d50T5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8gqpN8YACDC9bdcV2z+RUaDgaGD1eWFgxK5VK3r9W0=;
 b=ALF8JLsf2Typ8xHOmikxFF8srX7SlBnhR6V3YqNfrZJWc571CktAw7BSnrwZxV9gZ/wNappbrIC6As2kdq2tizo8qJLFXhjrga6yHczozL5XNj94VX5vgerlzZ7f0zTJHKP5TSlvn7wz33vVQLGCGUk4Z5Rfif8WlXH8V2GYQsj/LNo7m9MtBTxwGx3vuWnqoo1q4oGyPvHSD8kwRPK+FcyKYc3GDp9N38wKHw2/6nhUjwR1+VrYMp/Sc1BKzt9cFM/PnaukBswzc+d52LaY2u5AZCFhsMjQRykC8G/2D4m8c6HdneuVda4CHORWx8La7aI8h2mLlnleF7a929boQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8gqpN8YACDC9bdcV2z+RUaDgaGD1eWFgxK5VK3r9W0=;
 b=Ld3h4YrvWtXrCJpnoAiBm90VljLhdIGwlqBp8L2zc6q68lPHX1Kc1YJjlt8uebQXdELE+M0B9jvRtZxRAxZKtp0+vUKkECCp1LtbA+s733g1wBZCqK/XQXlhJdx4mhaNQdjq1ifSMUymRhqOo28k1iMXtcFvvJqylFtUyIq/uDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB16094.jpnprd01.prod.outlook.com (2603:1096:405:2e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:22:53 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:22:53 +0000
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
Subject: [PATCH v7 05/13] reset: Add devm_reset_control_get_optional_shared_by_index()
Date: Thu,  7 May 2026 11:21:33 +0200
Message-ID: <72334ae433516dd6bfd45da8523936ed7e73f44d.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB16094:EE_
X-MS-Office365-Filtering-Correlation-Id: 4adf6169-d035-4176-04bc-08deac1a3761
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 W71pZJQZ33iCS8vfBRMDQM/tUPBiIpa0a6lM2oZT8jKJfsZTLJ36AS9siL9kTKEPHAhJcHWo8Hk6gO6rwIlb2PfTcWPLjGYE47mXk9ShiuvYKm3cqs7V3GCi8EGNtiKCg2wMt4tz65YNUF63Hb2lTRYSlUYFSAtjAzs1RrTQeTEtRlh2ty3zfwCCe8hRT2mLACl19kFZzPZtQkbTewPj4qMQjegWwumnYw+ez6XAWd6PERVO+fpouH/tMuuS5x0kqi/D0GAgLxWmfLb+9cgXRIVmB6AGspK7HIxHD0c1X205YiHmZ4TxGsN039uet+Wnfy3lHs8Fbz5k0VCWNwsiN5qbEyy1kOwvlAW9zH4wc54j1kQ17/oZ0/B4KufBhsDu9FhWnXpadsoxN2oQnVFdOJ9PggSBhPR14m6NdfmiVEKAuA5fEEj3KkmpZTCjW/6U2aIoiQhGWhWe3smSCyo8SgQRZNChlr97n98Fz60b61t37R2hhZC2uiRaylVwBaDhxFfapfy0vDQciz9uRxXXh4eO1S/43QNbDX1L8ichTitJORA5bdAIW78mM8yRcnVXhH5ZdbBB5totGeAEiNHVS6U72Jz+xCvbxYEygfIykATR8H4wlGw4S3bhf3/8gSJj1iaqZls1c0sHuEBmFz6ZmBgiN4a3gkn7WBKISgjAZW70yrQgIIFe68+xeXTWVYKvc51Pibpf+AEhOwjKM7kjL+LI0Wl/DhuqmANkSXBkI3QEOrLZcRqNAtb5/uMvrMd2
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4TT+j/hZIGUb/5ti99lEzOaTNzWti27qJ6588l7EpLbReX2+zZP5mT1d+pSH?=
 =?us-ascii?Q?MUd2cE5FQJgpqLlgp+5fclnTxvPjWwf5K1ZhPFxPLp25XBLGzUmp143nGSPc?=
 =?us-ascii?Q?YRj/Oabb3TBTVtqxqcYMVF4YyA//6M6bD20TW58CM9nBo3Vy58vxrkeDcJp0?=
 =?us-ascii?Q?kKB2MiM0FzMhtwF+rAMWWXYlUGz35y73A5p82PMf8DonWdZ5U9IeozuHyCPC?=
 =?us-ascii?Q?lXeDPnUJixOSeVtzQEkLiRlHJnHI6aF0JyNMDZ/SKEAdlwtYoa1aw9YRZ3Cc?=
 =?us-ascii?Q?J8HR//qN9Bk0H+tydA2Klzysf+QPCjJHRh2I1sN8F6Yi+DTUbQ7/B2H4OUdM?=
 =?us-ascii?Q?Fcq7involao01ZUAZ90WNXgZ7QiqpfCMwGLphu3D6v6VPDAJGaZBueEm7l8R?=
 =?us-ascii?Q?u1I3mz5q/ZtVC0KWIGA2MxV2bQA/ymaNvoW57b5GhRiq0DWQzdz2xG+OG307?=
 =?us-ascii?Q?B9mu16Gqe1rIjod8dTkBc4cq0n+UqErfX7HseFUWZ9WfRysj723G4IU9gt0y?=
 =?us-ascii?Q?eKE8DW+T50YwmtTo8H5xTzhwENXjoGB1goLbBiKQ4wCg16re/2J4fNeSnouS?=
 =?us-ascii?Q?2patXS+54OighkvJJ6ZTssR4BFz2UdzJBWyYFWSPUjN9f83mpy26S720VBUa?=
 =?us-ascii?Q?vQbhz/pznlPRnyYwZ/Uf4CVD0XSVTZtcZFQh1yGeFFgYPTIFd2iklY2omfwB?=
 =?us-ascii?Q?ONVWEBR5dg8AjZwjl3365sCPjVRHM/p3NV9YftWzWBfm3LETT0r3dbBgqKCH?=
 =?us-ascii?Q?Oae0SpW5mZ8t8YzbmpR72LuMfKbtKeGmCmB6CgEsi8+Wx7sYcY9OVuHZ4uGE?=
 =?us-ascii?Q?PXI4sWdCCOi22PPA+WM4TvLw7+UFSi55Wxtmwv3Rtq3o2okc5963oNpGoN1d?=
 =?us-ascii?Q?+UCEJTIgiOAKxllcL2DxgBBeOqDoW17QnoaV3XNpHUhMsoLFSCEtGUVAHGZp?=
 =?us-ascii?Q?nyYxNCAY2Le4pj2MPRFwv7E/dFJFlMV1z/FWkqK2O9oET9FqrelNm/TXrGH+?=
 =?us-ascii?Q?tLDLi6PuaxGW+jU68L491IG73EUMmI8is32T7GqFDnQKtF83AGoMo6T61MB2?=
 =?us-ascii?Q?GEKy3koWgmGQL5rCv7x7phw5iY4vBI1zmRC89fX7sX0vcthUSVgsvgU02gIZ?=
 =?us-ascii?Q?4LQASIOttopWOyiXnPs8MAA37Yhcn1ehx1mRGJUWFQLkQHH/WzhgjoCBanaD?=
 =?us-ascii?Q?LfvSmwXE9I0lvs9NFvM66xtJ7Lk0meXr5E4JIT98U4CzMaQiSszN1OUGYEBo?=
 =?us-ascii?Q?WmAUZf1aa/4Wind7fRvhtP7pKWRruNQXg0v96vgMnNenA9nTyfEuuLHMWu7z?=
 =?us-ascii?Q?SQ66QXeo0k12jhYwUWXuqxoV9p1MqP9nclU0iajeTmf5E4UEBRS8t0LsfQ3K?=
 =?us-ascii?Q?dlbp981M0WQ5H3+wNAAvaw6mDDnxkwBSTW+CJ+Lh5LBWQBaojr+DNkGXdYlv?=
 =?us-ascii?Q?CA5FM484GFOmRn/8ba7yoheT2BjC+m/02DsWAHj/yNlqmalCMNLy/Bdjrrlv?=
 =?us-ascii?Q?ihjYVWLGvMPzCIQMVPvsZSCxGORDRwCcU0qezqH2hJavY8ESNuYh8tmHUgam?=
 =?us-ascii?Q?wxjPQ85fuEFcCVe2vmauTRAF1nbU+vfCcn4lMT3Q3I+cB88yQvGniHFJSP1q?=
 =?us-ascii?Q?DLzgNuHWgklccMWrRD6RdzsTdcvwYpKzHDzn2W4axIpDHeLBvirQDJ0ClxCm?=
 =?us-ascii?Q?5noc/6Sl4T1NF6KYWFDxDBY4U2Akpjv3mz6TXOEvTaQQzsIuxnhucabr2PoA?=
 =?us-ascii?Q?9+F+1YMRlvhjOnavIY8BwMWaA7CCVoMPqE5Hui9gErVJSJqZ2Au5?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adf6169-d035-4176-04bc-08deac1a3761
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:22:53.2856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vta7AKjhyXpBh7eVTjIC0EVKBwi1TqqzKMB9gXKe9sH+FpdxvrA+kE0KN8UThQRbw+sF73QxEPrUvPNo0Xxwt/5xt1rQToc04dZjHyNob2YjBjVBiyw7bovmXbtAhOS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16094
X-Rspamd-Queue-Id: 87DCC4E62F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32196-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Action: no action

Add devm_reset_control_get_optional_shared_by_index() to allow the
drivers to get optional shared reset by passing the index.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - New patch.

 include/linux/reset.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/reset.h b/include/linux/reset.h
index 9c391cf0c822..d49545019631 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -965,6 +965,24 @@ devm_reset_control_get_shared_by_index(struct device *dev, int index)
 	return __devm_reset_control_get(dev, NULL, index, RESET_CONTROL_SHARED);
 }
 
+/**
+ * devm_reset_control_get_optional_shared_by_index - resource managed
+ *                                                   reset_control_get_optional_shared()
+ * @dev: device to be reset by the controller
+ * @index: index of the reset controller
+ *
+ * Managed reset_control_get_optional_shared(). For reset controllers returned
+ * from this function, reset_control_put() is called automatically on driver
+ * detach.
+ *
+ * See reset_control_get_optional_shared() for more information.
+ */
+static inline struct reset_control *
+devm_reset_control_get_optional_shared_by_index(struct device *dev, int index)
+{
+	return __devm_reset_control_get(dev, NULL, index, RESET_CONTROL_OPTIONAL_SHARED);
+}
+
 /*
  * TEMPORARY calls to use during transition:
  *
-- 
2.54.0


