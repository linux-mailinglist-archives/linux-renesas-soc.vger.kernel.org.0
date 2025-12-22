Return-Path: <linux-renesas-soc+bounces-26000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A2BCD63F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F282304E152
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D72C336ED1;
	Mon, 22 Dec 2025 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XZVv1bUj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A672335550;
	Mon, 22 Dec 2025 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411161; cv=fail; b=ksXvOHflfJ0bomNDi/3oPiOjxRNBZDhZpIb9rcCFdt6GVjf9pWc5OY1hr/inZnX5sdkDT3tJKBtDBKDSYCwxVeVckSr3xpflKl/CyncSUyHaMtiLBrEgC8spHRvtDgPSRTuZWry3YRubAciw+pi58M2MIxs3F6FWpxtFdH5/qrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411161; c=relaxed/simple;
	bh=GZ/zVQ7SfqfvRlBGffHqP3s/bOdi/Oo2lIAaGAwJPe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D5Ugch9ELXK2n5faY07fIcAmIUiBHRsahKbKpODkJ6FcHxPfdwiVz5R9meKhfb19hWMHGKBYP69fD9ApSpwWewf0UH5IvMxtG9d/Kbby2oH18OuqFFcaXz2yr2w7oDqW5a2v7A93WrfAApjb1vvqAiBOVpB46EBud1xJTEfG4IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XZVv1bUj; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtoqfgD5wM9u8U3sXOiEo3KtOqMklxTQQRh5ci1Li6xdkb2JzuS/uN1Xi/inks592kx583TQQcKurAwqR2wtMlXCa+6G8X/yyaVmb7/BIFWKCYsalysar1jZY3uXfCZhe4Pu6XgReVoqlbwJtpZuQoMedKwtZQ+rNBzRrGtwiUxnOJjWvubx14pr/396Jx/4gmC+ZKGgw2Jvl5W8zPdPgFFZs0Pk7JrO8yMCsTdo+G9SnPQ/TQJ13d8/4uVdwsmHrywJsT6XrU1x1AJRR/RJMckTEMhCzz+R/Uc6RfAfYQ8KF+LBLlLK4QNzxgSydHKUZrZSSvQolggqPzxiE26x9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNdu29Rp2D1rWT8ilSrOq3FE7dwSwOy2fVmVROUqJbE=;
 b=r1+VoYYKHNBIwOEKbMyaJbL3nmvptUF2aBgg0r6oQc362t7bALcxHeKa8Nnq1ZXB2DVbnefMSvKV1UC2TGDsE4v/rV/15SpT6sjMFv/TtQzWh2xQEQTcbFO/LhpUIBHuELqTwn5RDO4dxDyxL3Y108JkiC5u38LfuOOkfyaFzbQHWs6dHOYRkmAyMfxaD2XrOOc8u7mSnlwS3U9ZdIgPN7pNyyMb+BsX/dYH0Mkybp6eQ1NFfssz2uOXXT9JCCfwgw1v85h11tCMCFfAMz8tox0xfVFTjizI8Q1jz8dHGQmUesq9TEHN7gJ5N8DOB5ynCs9zHjGOOaiv8At7IwXC/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNdu29Rp2D1rWT8ilSrOq3FE7dwSwOy2fVmVROUqJbE=;
 b=XZVv1bUjuWlR9IjpFEKhGlIzsOFYQ4acpvfO3/UNX9KngKhVmYbCsaoX0IdP9j3joP7TG4FafNbcCLIf3SFmjmSgIXSHACcJc1fHQuC3heZWBSBFkWrs9xmB1VZ9FPH6wLqo5Qm4H7sawkpVGDlVFgMrUqLiu8wePETp6uoOkh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:45:54 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:45:54 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Georgi Djakov <djakov@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 12/14] phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
Date: Mon, 22 Dec 2025 14:43:46 +0100
Message-ID: <6c1aebf60b4d8ff0c51a8243c68b397c1a384867.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB14304:EE_
X-MS-Office365-Filtering-Correlation-Id: 36af9b75-1e2c-41e5-5621-08de41606d87
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZVpY8g2GSmjq+rFVuwDvkMcPIS7zNQXQWD2d6XnuL9elASDaD7/hEEVNMw2A?=
 =?us-ascii?Q?T3LGsNBgN2w7UJzZK3zFayJk+mnZBmBQdrziLA5BMh6zTzkcguwzFkXEa+NF?=
 =?us-ascii?Q?TUMGAX3nd50fLpcwWjeIgl8wdDF9/J3D38cDP9x1X3Mt0Av/J/VLfF2+0aiS?=
 =?us-ascii?Q?2BAb1oH1lNNzJDWLilzGJuuhgJyJSJ+5X6/9ZZyhX1jpu5vdVvag6g3oPUor?=
 =?us-ascii?Q?QQSOydKC7z600b8BDvd7GDVFLtE1UbuXpL1m7IXUU5kyWTzkjVs/hM4/grE9?=
 =?us-ascii?Q?br4aF8SRTBIQ7ihbuB0unE0bUAbhXfYj99a2BtGEfoIVTT5UPcyySNPKCXF7?=
 =?us-ascii?Q?Eo3rEtuGB8cZbginvUQywyMmQlR0jF/Nhz7JsxQWRvOjz2nps8OS0Ywh8sDG?=
 =?us-ascii?Q?x9XSficJNthD0SW1bAHOhe3JgK8H2HaZ7yIilqC4IqjgwUm/HzxRrM+6a1s5?=
 =?us-ascii?Q?SqKwQIB533bsKb6H6rxY2a8CBZaQliOeskFS7P/6LdTTrl7lpwmBoDhqNb5L?=
 =?us-ascii?Q?XR046VcAX08JLKte539omRuCUsMxgooe2Upj6fTr9/OD2mJfCmUjoY6OI+ye?=
 =?us-ascii?Q?H+xREIWM/7eue2zBfaRcd+7YV6X8VonuHWZl9MLLXYcW1BWgy6Y4wlQ/VWG1?=
 =?us-ascii?Q?f/srcVtdgud5sogQpmx5awHoIpQ9UwR4UDwevRyTubN+TAa9gPPcS6bufZfz?=
 =?us-ascii?Q?5dI5AGHde9ur/LpQr4ZViCOKAcpPC6s/NnQ6wao8cPHHMYKoT0YSk3CXph7K?=
 =?us-ascii?Q?4n5p8DxM4baQyKonfYNEjLRYTSTIN+Z9Iii3puEYsOCg4hbX8N/oHMK0MpJV?=
 =?us-ascii?Q?Yaj+WFks26ZmF8ImcPDsgbXCEmSbIZA+0nzxSiY9lQ+2vf3KfIqTlLKacJIP?=
 =?us-ascii?Q?nZLaODWwL2nDcgk4O4yIh2PY8A+cH0ejqHu78BhhImPQv5dXF2zdmRFEr+Ts?=
 =?us-ascii?Q?K1j0jijI8jcJ6kyCtTr9mv53BpBAurfvHhvaYcnHV72EpOD4ELXUwLD97W9R?=
 =?us-ascii?Q?1yTrl5KxjJeTHhojgFc7U8Ef9RsJLXKghb86I2tHwGKw45hhMPctNm63R+qJ?=
 =?us-ascii?Q?fyGvvvPDha5bb+kho66g7ke/xcFLdT9AUHYzcW/RgmludHcIfmTOBLO6vcW8?=
 =?us-ascii?Q?mDxCFtN4hN3a1HPKxAk9zIisg2GEEnwvMHYe9R1v41rWm3f0BD41K7T+E4Sc?=
 =?us-ascii?Q?FXazyjPJjZZCgusyRJmpqoCKCagH4aCSxZbVMkXt/KbN1DJTivvuOngD7IJl?=
 =?us-ascii?Q?1OCdb9ax3+Ks7ECmULLu2notiM+4Va0V6R/oFvwATfMNXCEC5CvisqrFIMwF?=
 =?us-ascii?Q?Zw5LvWgTLLPHA43S5UfTXKvRSgEjY5Z/Hsutp5Iv9VTFN8pw0Oe5lgPwiRmA?=
 =?us-ascii?Q?Wkl7U2Cm3db0y0CzY0GzH2jnSXdY/70ZGri3bzLVGYkQzFp971pPPwbigSed?=
 =?us-ascii?Q?CTuJZ2sSFG6DCCJ+4HfflsXtpSRkw6ri8ZAbZkLbqieuzKzwwSWiYktjys5L?=
 =?us-ascii?Q?fcbfYjbKXsdAkt3EMYxmLWjZ62aGl/EFXNuZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IPZKZVX1QcrFrkih8smUF3vz5MpyaBUGNSNrEF0Z/NcuiTgztDC6eMjusgyE?=
 =?us-ascii?Q?pRsB+nl88n0wsc8nPkNyEbaN3psaGJUv+8TlOaLXSFiAv6s3yGRnKc+6Dagh?=
 =?us-ascii?Q?EOx8cWMTokphtrSrvqLx6ENWCJN8UdQ9I0woY2oA0ibFKN812haqrwCS+CZc?=
 =?us-ascii?Q?LkjRT5GMlOYLA6wPtj+CCw6ZDlkbiTHEA5j9FA1XUeznSXmNqeK7fDC6TIc0?=
 =?us-ascii?Q?WRLiJHEAMqcIh+SAEjT2zBUzBE5xjEel+wIgeLsJqKEbOP2yeIeL4tlq3+H4?=
 =?us-ascii?Q?6Ch7qZzxzunql6tDRzVuVY+qFE9gFTcn8wCpEXldwYU0mMTTRWHsS70GYKiJ?=
 =?us-ascii?Q?WRPM+qtz+8lbAA8Zf8YmuFnQrTdfB6Gqz926ry0e2EYTefqs90RHTh90XsLO?=
 =?us-ascii?Q?pGIad2h6F1zlC2Gcsd4v5oZC6qQLi9jYqVWQUGxqumqvR+nXr7K4fimoiU1x?=
 =?us-ascii?Q?Kzng1UH0dyBvhprYuYU+FcV5aWSzyAWYTOg92pFUZLioLAVhA283VpCBn4uw?=
 =?us-ascii?Q?WCShAAwcgsd9it4psBjZqZ74FIffBaZcrB+6neV72gsT5flh+NjgNMlpjjmh?=
 =?us-ascii?Q?Zgw6pCQ1ELhJJmR3oviwkHwC90Wj/SwTL2l3egRKGsNpdRApRjobhe/OTyQz?=
 =?us-ascii?Q?5veQU8fV2E3v8mixL/z+o8GP3I3dXVgpk6+iRuYooVrhahFTM/xiveDKlRJT?=
 =?us-ascii?Q?j5crT8ROEB84loHU2XawpyiS43l9sY8kdMrz37vUJrZSst828OEp0fxl0MuQ?=
 =?us-ascii?Q?fHEgLAMfbuX/qmEWKSfbPLG4/2tkpI8TFrQ+YD+IukzLPRSFz5JeqbXG3dZU?=
 =?us-ascii?Q?95AauXKo6gcVy+L8Yhj+gvqF+1qrbVO0dga3EyE+O93PTF1/Dfcs8ZC/O/fn?=
 =?us-ascii?Q?YmM7uXRTyh6SZJlwRWnWlB04viSEzdKWi1fZkBDCDoXdP/Iu6EMTErvUJCOl?=
 =?us-ascii?Q?2dZ3RxiXiCTqvPLDwqbS1Dt0NDO44F5nK8WIyMipcCNzo0I9wLn0MZlT8gid?=
 =?us-ascii?Q?V6idHtsZ+p7HlP7PMy3LbRMN4i86FnC4W2+Er28bUG1ep37kS7SDoprhnXFX?=
 =?us-ascii?Q?HEx8FgF4//Z/c4qIbTe5F7pH2hQvAX2q2JorE9OhwYRWmjKfBx+2PADQfQ1O?=
 =?us-ascii?Q?TS6h26tQazvZJHT8aV0RmiU18q9M7lDu0ti87QFVWS3A8xWp/GiYfogUn74k?=
 =?us-ascii?Q?zQMri9IwIqsgAkqQP7fg0Eg/fT433/SbbguEoly5gIGqBIuZ/5Mbnlt85f+Q?=
 =?us-ascii?Q?QBlHD3ukxCdLy60q2LBy7JM9aUpXOXpP46xGbEwAH3VbMFuy/rQp/Fzb4h8r?=
 =?us-ascii?Q?4zjoQLqz09pL8yb/a9sk3ityAJk2HpfH3z8vplfqdPdzpfP0W3CDzMgPcUR3?=
 =?us-ascii?Q?WGtJIW364jAgQAxUKfFZYhStoQk+o1FfK44LBZALKhjVRjq6sgea40xg6zY3?=
 =?us-ascii?Q?U8AhffUFdM6TMImYehELHqvWCy5JklBDCsNte25Iz7za7oJruCjgRJTLVh4E?=
 =?us-ascii?Q?JriKHWdYVK551ptc/GPahZPCRkvFaXpSbwzbq70ntr64PcLniHddSdNkpYSQ?=
 =?us-ascii?Q?nfy4zH3pjhJrJv/7iDddlM2PQMKDjuOnnbGUwPpXxoj40EYznW5APhTvsQSP?=
 =?us-ascii?Q?0Yl8RsTpkAlW0g5iTlGpM2oJUIM8K+J3N8OJQsAvWL0ENF2gACEzq+DFvMku?=
 =?us-ascii?Q?rrnKHI8fB6G45LqS38ltmDglbLLUHKF2gvo4vEYHM+YXWkallpvDp3fMjlY6?=
 =?us-ascii?Q?c+FNSSDBnQO8DPOCMy225iJJB1wQR3FTFxtXwgjBtnUcQtifGRZO?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36af9b75-1e2c-41e5-5621-08de41606d87
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:45:54.7111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1L379/v0ZwFHDGA9j3mtgpEkz8uoY77OYlFeg1sRzpRHSuSstyjqmxU1MUxQ1uMU2vF1MXHQMs/XNdm1SRHtaS/CE/HMmmKm7Vmww5azU0Ugr/yJdyzLGDkbpYHOQ8KV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

Enable OTG VBUS control on R-Car Gen3 USB2 PHY by registering a regulator
driver that manages the VBOUT line. This change allows the controller to
handle VBUS output for OTG ports using the regulator framework when the
platform requires hardware-based VBUS control.

Without this, some platforms cannot properly manage VBUS power on OTG-
capable ports, leading to potential USB functionality issues.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes

v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 142 ++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 94a4521d7187..d2c03a846b58 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
 #include <linux/reset.h>
 #include <linux/string.h>
 #include <linux/usb/of.h>
@@ -141,6 +142,7 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool otg_internal_reg;
 };
 
 struct rcar_gen3_phy_drv_data {
@@ -225,6 +227,11 @@ static void rcar_gen3_phy_usb2_set_vbus(struct rcar_gen3_chan *ch,
 
 static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 {
+	if (ch->otg_internal_reg) {
+		regulator_hardware_enable(ch->vbus, vbus);
+		return;
+	}
+
 	if (ch->phy_data->no_adp_ctrl || ch->phy_data->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
@@ -593,7 +600,7 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	u32 val;
 	int ret = 0;
 
-	if (channel->vbus) {
+	if (channel->vbus && !channel->otg_internal_reg) {
 		ret = regulator_enable(channel->vbus);
 		if (ret)
 			return ret;
@@ -634,7 +641,7 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 		}
 	}
 
-	if (channel->vbus)
+	if (channel->vbus && !channel->otg_internal_reg)
 		ret = regulator_disable(channel->vbus);
 
 	return ret;
@@ -809,6 +816,128 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	return 0;
 }
 
+static int rcar_gen3_phy_usb2_regulator_endisable(struct regulator_dev *rdev,
+						  bool enable)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	struct device *dev = channel->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	rcar_gen3_phy_usb2_set_vbus(channel, USB2_VBCTRL,
+				    USB2_VBCTRL_VBOUT, enable);
+	pm_runtime_put_noidle(dev);
+
+	return ret;
+}
+
+static int rcar_gen3_phy_usb2_regulator_enable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, true);
+}
+
+static int rcar_gen3_phy_usb2_regulator_disable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, false);
+}
+
+static int rcar_gen3_phy_usb2_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	void __iomem *usb2_base = channel->base;
+	struct device *dev = channel->dev;
+	u32 vbus_ctrl_reg = USB2_VBCTRL;
+	u32 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	val = readl(usb2_base + vbus_ctrl_reg);
+
+	pm_runtime_put_noidle(dev);
+	dev_dbg(channel->dev, "%s: %08x\n", __func__, val);
+
+	return (val & USB2_VBCTRL_VBOUT) ? 1 : 0;
+}
+
+static const struct regulator_ops rcar_gen3_phy_usb2_regulator_ops = {
+	.enable = rcar_gen3_phy_usb2_regulator_enable,
+	.disable = rcar_gen3_phy_usb2_regulator_disable,
+	.is_enabled = rcar_gen3_phy_usb2_regulator_is_enabled,
+};
+
+static const struct regulator_desc rcar_gen3_phy_usb2_regulator = {
+	.name = "otg-vbus-regulator",
+	.of_match = of_match_ptr("vbus-regulator"),
+	.ops = &rcar_gen3_phy_usb2_regulator_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.fixed_uV = 5000000,
+	.n_voltages = 1,
+};
+
+static void rcar_gen3_phy_usb2_vbus_disable_action(void *data)
+{
+	struct regulator *vbus = data;
+
+	regulator_disable(vbus);
+}
+
+static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_gen3_chan *channel,
+								  bool enable)
+{
+	struct device *dev = channel->dev;
+	int ret;
+
+	channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
+	if (IS_ERR(channel->vbus))
+		return PTR_ERR(channel->vbus);
+
+	if (!enable)
+		return 0;
+
+	ret = regulator_enable(channel->vbus);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+					channel->vbus);
+}
+
+static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
+{
+	struct device *dev = channel->dev;
+	struct regulator_config rcfg = { .dev = dev, };
+	struct regulator_dev *rdev;
+	bool enable = false;
+
+	rcfg.of_node = of_get_available_child_by_name(dev->of_node,
+						      "vbus-regulator");
+	if (rcfg.of_node) {
+		rcfg.driver_data = channel;
+		rdev = devm_regulator_register(dev, &rcar_gen3_phy_usb2_regulator,
+					       &rcfg);
+		of_node_put(rcfg.of_node);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to create vbus-regulator\n");
+
+		channel->otg_internal_reg = true;
+		enable = true;
+	}
+
+	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,10 +1019,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
-	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel)
-		channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
-	else
+	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
+		ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
+		if (ret)
+			return ret;
+	} else {
 		channel->vbus = devm_regulator_get_optional(dev, "vbus");
+	}
 	if (IS_ERR(channel->vbus)) {
 		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
 			return PTR_ERR(channel->vbus);
-- 
2.43.0


