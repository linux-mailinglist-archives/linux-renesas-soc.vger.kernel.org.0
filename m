Return-Path: <linux-renesas-soc+bounces-32204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCJnJbFb/GndOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:30:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F261E4E5E96
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AE0930C9160
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D5B3BED76;
	Thu,  7 May 2026 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MbOQeZFE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDED372690;
	Thu,  7 May 2026 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145837; cv=fail; b=gjBRW+MXBgodFTMAye9/u+Ws5mD8Iz7XiywYmVv8n0eaVbnhgQ6ZOZlJsFTQ7aQiOL63wP0Acu/uf3mPTlTqnYIK74vr6dnOCzgTeFha+56qnAcbWkS6HJqmiBzW6gu04wMpFptGLOSX3WcaoN6VNqTNxSsGYHSKJDljqY0PWIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145837; c=relaxed/simple;
	bh=y7wVeK0aNSuWqiFSDcZQI2vOG1r0zZDwsgXkpINVF04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BrmfQkau5grie4RUE+KFAsRne03pKLW4I6NluUjkWzCXcBy7z7trTz695/dfVh2hTOi2ZS7TzIjSOsD0TSTHRQKuX/Z7s9v+8pQ+NvOdzftXyEf0ZGfejTHL1WQK9sXoNEd1H1hpYYrJv7NZgYJXXLTDXoXNNW8HwZp1MzUn1nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MbOQeZFE; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I79EDRmR2NShu6sQo/1d/CRjOQ7yyS9/hb+VmQV9cm3vhUjLFGfVNePZ0xya/2nfeLW4AtJ9J+HboG/UisnEx3tNtDFvgjIPyNgUC6V/tjB0fc/j6fiodvpLZy4zBwUPmw8V0HaIrRJpraH27qI0dclBwQuI95fFmBosCxztrNvHXRY+dkwdUcADlZlLAoQUKAogc1+XbPRAFrQwjEoYoDJ+hrmJ3pqSKQv424Kg8YlCwrPxFLIEo1KMJCtE0e7+WN9F4jGlReeUObDfMO/oPRCZms2wkcuydPkYkPQ1sBHngOQ6/C9shWIEpna80qS09SBPlPeH3xK9kdnIbhrTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGmi2mtDK2Fl2cOWP6o3/BF1hgsBzANeKE6oawqxaYY=;
 b=Dc3KsMgwV9ElWjz23dR2l9tOQ7zm5hTGd+cPoTFv9WFCVVw8dhYmm/oGAPTciG+aMEvZwU7oCAq5MpLtZF5e+gOpo8tnqAeAu6zDtopbfxc5EM9J/FqSH4ORIP3ab+KKFUZEuwjcvK30um482YXqqtNter6aWhdnmjbLlJNDAZg3mfVnyRJ2FBaWxV9KigOqDXal1AdXFmftlEFj3Sy7GWkxd3felxkJ2RYO5Q8eDXAbi7Y3uc/S7Y+o8hKE0OyFfxQkpJyxHQLU9noJgq+tMDD5GF6HNLrdNOrTWd1CaX99g1Q5J5lob3Mv/gqU71Tisr/vxqgfBftelRRwNqxzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGmi2mtDK2Fl2cOWP6o3/BF1hgsBzANeKE6oawqxaYY=;
 b=MbOQeZFEmVO/FeAFIKJb27Cc7V2nRuz3Xm30jF7wEWiG6q7+BEsNg8cdB9Po0Ta1a4zUTIhN7Jy4468aIk1u1H7MeytGzVG7dxKM7njUiOKxWC8Vyor0GYylAbbUG6WNs//TKs7Fvdu2vmUt4kYoc0S6KiWaOdytcB3xdINGAJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB16094.jpnprd01.prod.outlook.com (2603:1096:405:2e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:23:52 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:23:52 +0000
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
Subject: [PATCH v7 13/13] drm: renesas: rz-du: Update output routing comment to reflect all supported outputs
Date: Thu,  7 May 2026 11:21:41 +0200
Message-ID: <1b420a0117a756d5aba688b01f6942fdb1db9cf3.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 26ac183a-dad2-4151-5b45-08deac1a5acb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
 KRZxUUGwGhJnp+5dSkIKcuDEk/eF+y5yrVALN4BWOrbeWZxN8XnfgiMGsGb1MzSzmCu95eRjCD4UxZ2L7L5H6qp14lw7L89bipPARYYQUU8z6kpRYw5vT5pN3RGVCAveRnVy4JMYoo8kzdDAjiB0Ws0VGzbMnooU2yQZk2VTnRtY6nsqU5FDTkbZHDuXeJ3sdNI24igp2l47hJS+OPx6CgjWX03DBgYQld72ZxZzDMEfcwz4KrhsqpI07Ddxpt16LsIfojvQfR+GzZcwe0Bp+kaS/oBA3TeqjPuYNb2G4hPkO17x4pkLKujakLj73uaw2tre4tAQrokX16Zbch354vo8vLSjvKCsz5GoV5QZkSJWYbLSt9tpwpjVfxWA3UmV4POMhlpKkeYXpXkI8V/0K88H0lppBJiswsmljHPJf4XrxUmPVmUCKirrfMMOuZz80XS9J/B1isYhcQcmbby9Tt2S3O4WxiUrepDakqp09Qzz2tGqKTltEX2NJt/Lbdp+GP7vhLucBSzbJDApNN2/KymKZZXdSXa0uqFOpn6464Nk/H5GSXTIaj6RGkBm/iiLhJ/SGWiNUe9p5/kWFmQsbYOZl52jDkSC5kGuMW2+4zo9uQ3oUqRkIwO783Kw8CLqMcK4pgUk+MeUVWZqYb4D9514Ledei4Q/UTQ/FqpogN2pxCwjnwsF3sgw93Kyd4TBYEXKYsG4085JcsrDV8le5S30FHhPS0Q1mel0IkY1x8xDA6v63g8IHqXB34VUHHNR
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BVwpCf1GGeSTp2GJtsaAM5Mavp8ilS2ZUqm/jH4a8ramNjXBHEk8f7aHNcZv?=
 =?us-ascii?Q?ZIzmOQPXrKiiPsL1Ve0qTxG3VX+7O7Qd8ZFmTRiffxe4MwLsY/XTOpeuvYMY?=
 =?us-ascii?Q?CInx5bFf7aEPrwtP6SIoaH9BBMVYOm1AwS+oC+1YTdfKsLomwqqXfp3b/Vov?=
 =?us-ascii?Q?I8j9OMEd1uXJkesmnLVB315MNN4SS8WEdxcF3mRGRHPkjUUBFS5Pu75OZoTJ?=
 =?us-ascii?Q?2TkamNVleCH3d+DSlBhxFJN2nj189nLu+tGjZ7jpjP5xEAlFBjyO55PtbaGy?=
 =?us-ascii?Q?1ou1wZ9i7aplsb2SCCIrw8gT/s7YH2mIDqeb2gmU9tl8lBYca+sAt+yibCff?=
 =?us-ascii?Q?V4ONrbzFcPBSvPWcefe0kr8A9QdDNwV6dg63ZRzzJA9lniWRDGl/8WhQIHfj?=
 =?us-ascii?Q?cDFmywrumFxQLXTk8aTofIJ44JogyqM95g1rXOfmb0TgNbcxUtYPCHRrTuNY?=
 =?us-ascii?Q?kzVzWpD9K5LpV7Ik4SjFz7Up7JFhAEFvXAIG6hVZiUxIJ9NYsmbnR+CjT0wa?=
 =?us-ascii?Q?LfGWzkBBA8UJwcV4dSC0Z77x7vCk0czxr8Nw/xIpyDq0B8kh3LimhBlXSrfK?=
 =?us-ascii?Q?Bq1Hs4yKKwJ89TGkzlxseKpuGwKX0zxBnADQOUAwyvhTxh79HRawt0DvJPS+?=
 =?us-ascii?Q?AbX5n+xenNrObGnmBcjkhBHn0IDldkDLc+jFKJaeRDLUMPW/GkQB7mkaP8VF?=
 =?us-ascii?Q?9Siyu/Rr+GU6C9rnurU/2/zzWDfL53/E4y+Wn+22LeqQlnRB2xu70qIE0gDZ?=
 =?us-ascii?Q?SY5CA8mTPrEF9KTh+RmQMQdGk3UI7IIwP2bBc68rvhlfJ+wKYR4qj6z7tw8c?=
 =?us-ascii?Q?3fyyG9D0gTHhGyjvB13ny2KW/GXHAezechJ5JmrCnBReBarMELef5Gha0mWr?=
 =?us-ascii?Q?CqBPk9dwbPobWa9zBtYzWHnA3aCqRBLOYmf32Y+Rn36Rq+5H5BOC/4LV7Yzc?=
 =?us-ascii?Q?dK/btQ6MBgEeJ98ha0bWX2qtXrt0qgLBuOhpwegYJTtj8lsd69XHI7ge9JGb?=
 =?us-ascii?Q?wX/AsHFzA3Xd3eKUadtCfHXFF1y4Kp0zse+YB2hIeYsa+qgRWJe/Y3TshDO8?=
 =?us-ascii?Q?QpFMvBvQhRjCg34GvpMd9km1sKOwScSiT+ZOMLDKKmCjiGHFREhTndbi9bFj?=
 =?us-ascii?Q?WCzWcirZVtkuKp994KNaFLAAXa/Oz3m68qBSCsmOmgY9g/zh0ibNSDBpi91n?=
 =?us-ascii?Q?vci2MlcnWpZLZmyKN9E/zyOApYZpwQshFDpK3ir+0m2CGpm1lF7v9DjcVuZo?=
 =?us-ascii?Q?BIYhLAu5fvxuYs6zG5av/bjDvO9tfPt4znBkYlHZsKewRanH50JBCagaYfwl?=
 =?us-ascii?Q?jP8HIDKHlU4BfcFVnJXL+72AHQlSfPwJhPNConV0XBeLOBxlshi1UlExTEPj?=
 =?us-ascii?Q?prY97Hs+75WukSlyFgmj42O9rUiMk7fPIv1Y/E6zEfGrbzk12qO+3n82r3bO?=
 =?us-ascii?Q?zdfF2VrOterKdij4Wrm0fmMhNr6uJVNGbT6OHklQ/GSu1QbTJk6JZs8odDY3?=
 =?us-ascii?Q?GlG3Fh4ufNIrecKK86lTkiNP6hpsDplXq9dS1zabLtWbx94KSoMvfwMOdxpz?=
 =?us-ascii?Q?UALeRuGQM6u+JJW0ujymWa3OpZ5MAktTvq4We0SrBJxPF+rpOhAnBj94xdi3?=
 =?us-ascii?Q?hPn6QfR2wMKdno/jWKrJxD2rJcOLbIKnUY3FwD+e8C5JDtkr3ZUVvmTaGAuj?=
 =?us-ascii?Q?N9CofDzBgQG3XXRgW5qyqBdOYIVzA+Iiyg/8kotW00ul7Oq5i0Vfg9Hv9WNz?=
 =?us-ascii?Q?NQMVWktLOaaEWdAn0r0J2iMT6fMpxSIgZkGIxohMqc0nCBjB/TSK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ac183a-dad2-4151-5b45-08deac1a5acb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:23:52.6778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ym2ST2M6ruwD+M9/awmg3MdggfLYygYVRsdUDz0/PI9Qp7/BlH0Qy/DcXEaTVowbybn4fcWLzdoYORc2yVlTMoTHr6wRU3KN4KzSozFyXG+McYIF0W4pD18u1Le+TLjU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16094
X-Rspamd-Queue-Id: F261E4E5E96
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32204-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Action: no action

The comment describing the DU output routing was outdated, listing only
DPAD0 and DSI0 as possible outputs. Since LVDS0 and LVDS1 are also valid
outputs supported by the driver, update the comment to reflect the full
set of possible outputs.

No functional change.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 649cd9b70223..dc1e5c4cbeb9 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -37,9 +37,9 @@ enum rzg2l_du_output {
  * @port: device tree port number corresponding to this output route
  * @ep: device tree endpoint id corresponding to this output route
  *
- * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
- * specify the valid SoC outputs, which CRTC can drive the output, and the type
- * of in-SoC encoder for the output.
+ * The DU has multiple possible outputs (DSI0, DPAD0, LVDS0, LVDS1).
+ * Output routing data specify the valid SoC outputs, which CRTC can drive
+ * the output, and the type of in-SoC encoder for the output.
  */
 struct rzg2l_du_output_routing {
 	unsigned int possible_outputs;
-- 
2.54.0


