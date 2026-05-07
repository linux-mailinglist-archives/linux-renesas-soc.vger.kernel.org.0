Return-Path: <linux-renesas-soc+bounces-32201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHmEONxb/GndOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:31:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3854E5EF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C8A930A2B69
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACBC3A784A;
	Thu,  7 May 2026 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oPuRflFH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F1372690;
	Thu,  7 May 2026 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145814; cv=fail; b=Bt8O1uEASPWo43gbqF79L1RqOq70Yn5990NgTID96jfwI/UvlMAxWCMd2iiE7+5d98XbI8UHokGpiKi6zT0D4cVm5LrI4B1pRB2J86nlSbFq8t0tvm7knO19ukg3qCJnSzc/fOLLI6lz2NFtaqviNHk4McLSzPotkp4JWxRqc9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145814; c=relaxed/simple;
	bh=kNmx3iJfo9sCkP8QnZ95IDV2ejOn3WB60yVmlN7SJfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ki1lDKVryF3Z+zW8fYQKVZi31o32EXHQJ/HcmLMQORkkxdGpxDKxWD5RpY9Tn0hGozU9AV+2DJU3Qd4dz7N6hMayHRPezQgonAMdSlDJ1+WF4Ycx6GgWYFYZnQvRsqQCiPLP4d8Y19ZS9kYXQGPEtOK56xiGjlo8T1RRTb1vuyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oPuRflFH; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0QVJG9j5Vu4thWbndObZcf4GsGUM57oJlH40U0j3EPuTonVTiQowU5LoRDtpMZLPqHEDaE636C7n1tPNH1axrPXV5UGztg23Yxd1wCdC+978mK+K5NpJSKtZkwHZkT41MkciI1QTGpBiHxG3p7j3tZk0UZGaI2uhzxcOJjpAUIWLZBuBhf85pplClOglOUpF+bMWIjFbGQF9ZNp9XI6ixmCqvqXul09Oe/HSx50xLMRVPKhvR4gnu5akpkcLj6KvS/saretTcl2dBwsrcreiJkpRFSJkIpY2e1d0UqlRyVVN4YJYKbD3i6IOOcfHhRpn7Oqn992S1PkKV5SeUOd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQiMZCDTu/d7oBvTNC77/5lw5w4U6tXkOvld7xR8GlY=;
 b=Zt8dR33v6/qx2bFLRG/YcxF2cqpUEHyVgFqjJyvWGinZ52Y53pMXJvRtiYsT9YDZIHXUn492LUgXekaJijjTmjZcni6gzeiSgh0fLIxmG51NF7vWf1O6IMAHL6ArXD1OOcyDdiIhAhEx343hvwdDwFyO+hGNafrCzQkwcVQgqMuBCpSoWBnnHC/PqyLw9AvPAxKr8pDvoh/7S1mkRQzMfL159nTHc/nlrIN2hpvl3+FyZEi899bC50zrf54+Rnbw+PI/C2R7ibyTsOE0qKwJxr2jcp68mMvS2WlDwqObjB84aBHsjq0OLQjdhDn64DXRhWsFTlBbL+Sp41bUcxXiIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQiMZCDTu/d7oBvTNC77/5lw5w4U6tXkOvld7xR8GlY=;
 b=oPuRflFHikzpX7i65WuGn7tX3EqoB56JeFtGcnmw2GdKEc1RVboIb+/QBY8MpM8paMQcmh+f8u+EgWUYndv6kW77HCIhRZOfV0OjInsgponN9tNbyYaALi0kfg9NUMUb/Ut3to5C9AbJ4Nl2I3mHFJhumL9VWP+2DH8x/iMEr48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB16094.jpnprd01.prod.outlook.com (2603:1096:405:2e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:23:30 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:23:30 +0000
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
Subject: [PATCH v7 10/13] drm: renesas: rz-du: Skip disabled endpoint nodes in encoder init
Date: Thu,  7 May 2026 11:21:38 +0200
Message-ID: <f648f53a6559ab5bc885bc0dc11d4b7d627ab911.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: d7f65541-a8f5-455e-3439-08deac1a4d38
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
 +f4fluiYPGZEB6RM8wtedSz54AxLRzJ/e2ECrw0NsbSq8QYX9ZB9vpeG4FkU6wu9Jf0YJaPOZ2zTdTaJfn5KVRYmhjRaLmx82cDYTIDi6U9jx7vUEkDew331a/1JTutdBwtWPgK2h4S+O4s5k7Faa18RCEgwzc+N2HWF0WbiYrACmMhk9V6pzRny50sfwhwKK684vLZLbW6DAR+9Bp5pyKugw0AkP3/mFe0wa35RJCnukRifUNkAtJXkl0QgnT55FjF2iobp8+91vsU9Sq35jl+LiUlccN3v2U+Gz3fTDdGZ7P9uk41V/bb5DQmy+67b8XL4O9beJem/Z7btrCteQ6Dh50/IzQF25C017vrLHurVFLOqmKMTrknbqY04ZrY8iqCWVR+DR1qu2/yaeVjVf+1XIhInlnc8RqcUOfMs/bcSHhDLM5rw78w2jSvzRvec6lIkEeIyXtNjeQ3xvmlqwwgvI4fan57KOpMUkVf8uZmNNbv01reANg/Cs58oYrRYgn4QGye2G/En+NV43t6gtfsCiAZKKCG0glo2jXLS4VvYuLQaLm0Qt4Tq/cgoaKni8uY1HaQtCUrYK7fwEgoGoYgFIiRw3UKk6uLUbWMN2YYu5Zy03T/8T0Naz2tKyrq9WCbv7eZIXHRxnXhPR13QceHhUq+v7SHZBQLDMkuSBQysiwJxF1fEap1x7acDY3YWCmV+8faem9NSDQCe1rBYw7jzYKPRWyyIJ4btWkH1rr4x6w2qKpxNTD/xFGrnbxnu
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Vve+lV+ijPrVxEDExma5IjxFa1Fn74orGRJvia9WekEQ9r893+AILI/anOSn?=
 =?us-ascii?Q?uA4gCHBOg261zSYz239h13aXusCPjwu2ThCmaLHEAhBNSnkq0NQbbiPSFQUk?=
 =?us-ascii?Q?juISaP7UohLuW1Sgf7bk2RGacRHJ6fujFqENdmo2Au4eIeOVwj6hcOYFQtwh?=
 =?us-ascii?Q?mo06+23YDwPBrwutmu2vifYqbvZhTdqpH1MQwHW86D8vtwfHSQDRsvtkbpwC?=
 =?us-ascii?Q?GE36JotZzErSUOv6Kx7APM2Ts+brbB2j9KeIFiGZhXxzO2+M9YRhRsP6RzTL?=
 =?us-ascii?Q?R66oGVB1pGDlK3sDRHtRnxNTv3OFZCcdWc/FNSo/apt+0FAb4/oUkJBn5SnE?=
 =?us-ascii?Q?VITcKvz9WU8CAvL1lRa0DQg0DUFcpb8qnOcdiIzXVPRPBTtOb/a626kWmRuG?=
 =?us-ascii?Q?6sLnR4IJuKrc93ZRZxJFS1MYbM90Ew8H2fwyEfTbYzFrf/iitG+GXLtxziKh?=
 =?us-ascii?Q?izerAhCSsuuDzzkYgktanhMJx1gR+KH2RBl/4sn8By5YoVQpqJl0DWWDAX5q?=
 =?us-ascii?Q?RKF2HMbyIyPDMPV7r+t62oc9v0quey6K3l31Qa6CvAcbvr5fBrVCaqYMBnlO?=
 =?us-ascii?Q?CDG/P2LAb/wfGTIwG5mrA7j5p5XlpcOnlvz7vE5UTTOpX7VVfqlhGQbloti+?=
 =?us-ascii?Q?SOG1F9wTRn/o+AsBbRcOnh+qBZ5adShEFZBIuOEAmOtrssHRm6qQi+jyNk8j?=
 =?us-ascii?Q?PCoj7zq5nsDRuaUiAX10O8fV4XnJXQPtFBMUqJAkFY2Q/+2MyMvfo6Txz5C2?=
 =?us-ascii?Q?cIf0nRFavY1FGBOChaURrCRTUlnwqPwUUirTFbp1qth1UlvHYqTwb2hLAUJc?=
 =?us-ascii?Q?o5n5/t5wuOlQxojR+XHeLVjn34JjhaRqfAHDpSdLIOMxzZ1aOCdpZmnX7xcK?=
 =?us-ascii?Q?v+CoPa/AvfN4P+9N34yttpSAxyqprmZ7eG8pIZgpmHdTKZbwNQyKLd7dSPgq?=
 =?us-ascii?Q?ccu+0KKWKv+yJ0ZGeera9H6k0QQIHdJpI42egcMUrHbZQd+G4N9OL9/ewxMg?=
 =?us-ascii?Q?6DvHDQrdxD0dP9UPLeYqZbYKqH5rQZS7/Ty1SqxnJeER6u03iKldPp2nxdMU?=
 =?us-ascii?Q?qdWpxxFniINlgTBNeLN6npP+FUflR7QV0wK8bGJNDIWXgSqowuadR9mGCn/f?=
 =?us-ascii?Q?9FTasPh4HSuXKJgXj5OqlZBDDy/JoYDkxJZcfBSIdsD/CGh05L3h983xlImb?=
 =?us-ascii?Q?7mjolHluJBJpDxVfeKIXtB7IuNC2ZIYoE/6wTSUXJfB8iNHYcjnCfTrdp6dg?=
 =?us-ascii?Q?Ic6hc6i5rHnGdK8znkaY+hAaYh+pgGp+MS0eKsIkK1g//BXbDDHyHFoYb7tZ?=
 =?us-ascii?Q?PcrGgC9111oFtR0PPcV5US6cNy9UZixfHQ29rSFwGXRXAQTkMrmXESljq4x5?=
 =?us-ascii?Q?9p9b7ZGCtCIRtlpfutpLyg2BOiHdZdRrjAVNJoloRoLpXkqaq5ESkUdW2TOu?=
 =?us-ascii?Q?xT89fR7aYx10pZOeOTFi2kKIlkjYPxqh6k+rEobS3Fff/BdVxYQfxiAmLb5a?=
 =?us-ascii?Q?CoYnOhj6efMsfN95mDcIvlJVE39Jme0hDyBZYyZvp+MHRCjP7HGLQiS+yAOQ?=
 =?us-ascii?Q?i1B85WuIdOikkpT5mcL2uGrV5JlzYzC04gF2jw3s01DtIwKq4LPXPLOsTCuv?=
 =?us-ascii?Q?3R9tldQSHehzm8qDljJEe3SiAH5EC+9Co9TUdmyfJN2uFn+X1BxX5NNz1DdW?=
 =?us-ascii?Q?liZxcb8I0xZWHFqeN2CvNJPds3uz4OJnQOMsqFRsqOvqtuqmbASE/bcrlndU?=
 =?us-ascii?Q?/Nh+xwWa1ILWoC7ANmHv67rcMwJnp82vZp4ae0zg3g6RzFy5Ac/y?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f65541-a8f5-455e-3439-08deac1a4d38
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:23:30.3483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1CWQmwcPri8p8A4nfI7nh6+S5tXbw+j89STzVibLunlJ87J7pbpADmjCFRPwAKd2xwpRBD6P0zuFeKpecWfiOqPxLsQQoZSg1FFZclEkPu/3xsdjqMSyts+5oeosZxT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16094
X-Rspamd-Queue-Id: 7B3854E5EF0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32201-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Action: no action

of_graph iterates all endpoint nodes regardless of their status
property. Skip endpoints marked as disabled in rzg2l_du_encoders_init()
so that unused outputs in the DT don't cause spurious encoder
initialisation.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - New patch.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index c2cd542a8cf5..9c158f9294c4 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -304,6 +304,9 @@ static int rzg2l_du_encoders_init(struct rzg2l_du_device *rcdu)
 		unsigned int i;
 		int ret;
 
+		if (!of_device_is_available(ep_node))
+			continue;
+
 		ret = of_graph_parse_endpoint(ep_node, &ep);
 		if (ret < 0) {
 			of_node_put(ep_node);
-- 
2.54.0


