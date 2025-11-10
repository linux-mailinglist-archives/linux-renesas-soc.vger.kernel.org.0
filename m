Return-Path: <linux-renesas-soc+bounces-24384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C782BC467F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 600383BF835
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C472730FF03;
	Mon, 10 Nov 2025 12:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LxsV8qK9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA5830DED7;
	Mon, 10 Nov 2025 12:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776570; cv=fail; b=CiCSjkSX4vO9QJPv1Otb2bmturMlYAXPERGXKC7c34R8nKss/al7xId2o6Ov3K7nZP4m2t7vDYaH8PN8fucqLcp5JyYjdbE8OYZimgpSVFXSM7/kzP2Xk3GyxJZREaDKUP45AmTspYJMvAUzK+56lEEehHkwb35g2F/l5szDxMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776570; c=relaxed/simple;
	bh=HS9fx6C+wQ1gwhdS+X2S2TEnxEJyEeecIG4wjNhrHWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o7gaiT4+5eOFwuKU4wSbtaUaEt0Oip4X4ZxBCfHxYqhBihT8brHY0+mWOy/gcbWa0SCu7K73ysPWgdnlvXTt+KkFl7TEKBxmf+SPyGLmm+Q+1YqmHtkLw4Rpq2WHdXJNXC6hM8/E7scv8ZJPYnNaorfPh9u1s320iFHLxywHZOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LxsV8qK9; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxyTEfD5F1+njMp5CVcpDbkqfURBjpZh8PdGue7a1V4ry9I86MfkkdLneDwVkrt9YktXMHb9YEojiSCkFGq0xfzOUA+o9HyGq0rle0DM8gF1aHJs88qLpZ9ZGpebT9Zb1Iw3Gezm+Gb5o4oPvQEF3m2iq1NOLAUlFDjxrT9a4V1FZrHJBegyg8Z6GrtT39YLUoBnAbJWNuqwLBs/oBTqrEQ6ZPBgqEP4zwoVcK3LamvWy/KhIQIc3lxsqILpWvAh9MqyMSDnkPMdtrnBwrsjZMyJg71DCOlBXScj/TD7dgcewbYOvmhGtOpbhp/mfmHqCAyQogKCZsAUzzxh64HOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPkfC7PpFNQGv3facyEOL15yWMtxUMoH2JjugSuJUiI=;
 b=ZloUAACfUCL+5f6mc9/eT/U86ZXlxHOt73ImYuIg2R8IG+0R2wPdMahsO6C6VkfxgvmuVuRr2vSFzktFDlpeIyaZS+nzVGGgGZ33UrWhEiiOA1fcjvgMq3mvND7DXH4abeHjjVaCGwopJSU4XtKaM9pZG8FSBlEzG5Ezu++yAUV2aVDeZ/UJciU+vumNMxy0pYu6fHyNce/XKRJXpOc24BpODABonWIgfZRXy2F+cvx3wMPbdBvJ7JVjC+3zvuuzvmiY3iXun/lJkbR1Jd2A/96s1NniL8HoKuex9GPfJb//ek+Q+/epAQzgKCAT3iSF3ovG7qDL95xbf2AlsqhRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPkfC7PpFNQGv3facyEOL15yWMtxUMoH2JjugSuJUiI=;
 b=LxsV8qK9mZbutGCJ6hmHxle02YIk5O39bWi+eNmq5/DobqSteKanh02/rQL8P+zYVAeiRzNQAoXolyeuAArRfNqOkmARpwsko6PytVwcE4KXJgITQfFw8V/dR3e9sG8vEPS2u0jhHHkPu6ZiySTnbDd/BAKxbhQdE+l5fsA7h/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:09:26 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:09:26 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/21] dt-bindings: reset: renesas,rzv2h-usb2phy: Document VBUS_SEL mux
Date: Mon, 10 Nov 2025 13:08:04 +0100
Message-ID: <8fba0b7235bd398d41329fd087d68f7e98bbbaca.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 182edc69-3a55-4e8a-4086-08de2051fe26
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zEz0ltyUGtVJB5kf71ah4swL0DjIDV5v55IyKpfMJDuzrDLxqD3M+uuLUP1q?=
 =?us-ascii?Q?Jc7AzO0ait9XneY/LZZdNpmqvd0VTRp2Mbg3WNKdwulmuYazwONQ/6DQacii?=
 =?us-ascii?Q?arnJ2RpGTKY33Zsvjp5lLi4nnUi7PDa7GwNmoaY5mUkWWcKzjNyxcW7xaDYV?=
 =?us-ascii?Q?5jt1igKVsdAH4SXp1oNoQdDXMJUeXzGaB9YBVOxcwCAY7xFm9yLL4etj8iXw?=
 =?us-ascii?Q?/s6d7ybp5sdcGjWuRXke7N3Mru9SOoW4d9jWkZXXqvwCBhc1kA5BRnHnP/gC?=
 =?us-ascii?Q?E4eLOFF49cdxk6+Rx5bv/rpGnKVQ6bD4i7l/Geh9TDt0U7hQT6JI07d4foDc?=
 =?us-ascii?Q?+iF3Gg7LDsoTe0EXBf7PurswEK2T2dxH1irqGDKwvZbh/y1EaS+417+pmaOC?=
 =?us-ascii?Q?RnUWbuLpoEH86q6i7vFS1D80mLY45k+cSEKupNVDBuYXkJTpLqIJp7I7hIs5?=
 =?us-ascii?Q?+haweRPsPeAugWeUAS4kID1VWclLMDFsk/JR+xMV3bCRrjRZMGYo9Kf48mVq?=
 =?us-ascii?Q?SszBrx+gsNy9VKUeXTS0sPKWQnyikQMqJtFl94HlWLSBx59TGqJqugvNqEb9?=
 =?us-ascii?Q?6nkK00hTG1PilOtshltEt8m4Q3zosNsVauJ1KePglAyIQvuOspgIFvZ4PZnT?=
 =?us-ascii?Q?PhvdGHQgsW1rMvIlqihqgGejUvs15uarVnZ3QCfvk/sqFG3cfuJnDg5OOPZU?=
 =?us-ascii?Q?pP47Zb1+CBfzy5ONOuasj4Vuzrj8XHYpDxybQ9nh3OwfaNvHGWSez3HSzmu3?=
 =?us-ascii?Q?jb/4YU5vajEpqpglgVxzbvSCwIuXeg01Ui5Mzl7NdBc57AEFoEZKfftLxRHI?=
 =?us-ascii?Q?EFNnVrT5f46shMuETYV/tbvNTXvXeuW8AR35fB4u9fihLsKoMD6nCviHFp/u?=
 =?us-ascii?Q?JyxbpIw3QY/aRQauJBD8P6zMghmY79GiBPjd5kETz+VSYlmXlD/3mqtm/RNL?=
 =?us-ascii?Q?Sppf5+F6yssO2Ji0c0wIj4d61+vRVjz1UnJIky+xSEPMHz4wiOMiEyA3ypyG?=
 =?us-ascii?Q?g8gWvVKIavIQNQK3FoozHjTQJH6UWrR6omg9QZZ2RIaETZy1r1erXka/mHck?=
 =?us-ascii?Q?D5aNW9Va1ILkcuH6F2dz7Jn+UHuZSHFWiUz+AfI16TTzLEpQ4bOCcpse1qmK?=
 =?us-ascii?Q?LA3rLcOmEaSetNfSZTxp9qD6pc7cOiJs+ZbiAHwR3V9ztLXTpMLzNaBaOmKo?=
 =?us-ascii?Q?ZWOiU+duDRM3ZeRzciBZ+iJTozvtvr0QeQsevSq8lzYG3Ib3rqBu8ICsI1Dy?=
 =?us-ascii?Q?nu3npp6pRA2o05arWD5UIsCg2uKK+XA0e8GbdYAlHqZM1WoadWBfClRXjYy9?=
 =?us-ascii?Q?BThtISFSEktCAYQw04T0Ick6Iy0jJ6d+dfiam9d3d1Onw65f3yzajkBittRT?=
 =?us-ascii?Q?/yBdgR7gO/tZh8157ZZO1otH0plZG0dX5DkDh3ccALwnRIVOZES0oylQq7a1?=
 =?us-ascii?Q?8JkqNY2XlR0r2l4yEu4ucH3QM79hkW6P++7R0kGs804NVk4ebv+Z2fnzHzw/?=
 =?us-ascii?Q?OC/9S1MDqYBLnImaVpPhbwoMFJ1caSmBf2h1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?37OwMlEJ3XhLk3Zx7S+mEprqoNIpVeswt8YajhrWT8gpvDYySsgDEUoMK2nv?=
 =?us-ascii?Q?LJdIGSnfjMjt6FP92t5tOR5weo3XfqdJiW9EuhngCsyQXVJJ1m91ZU50eS9C?=
 =?us-ascii?Q?Tl7Xt9VYPXGsiSFz6w7Rc0hRHh41NfaE3xjT01UvzDoe5Ucl4l/mydkujbQ9?=
 =?us-ascii?Q?afMJFe9DuMyT7CcUtn1qq1dU1RDY9P/47IQrsjmHii/xjFieH4LrLaKp49Vj?=
 =?us-ascii?Q?8OanbAqzjB3wtWptgWKH/DkcrSyiY/j3+F+MF1LLaTkDC2FiWAPsc3qZ3F+U?=
 =?us-ascii?Q?cfDvhSJDb0qXLtZPo87Ey6qUIdxpGpIhj6kVPDF30KOSyh0yWbZOZ+ws+nmv?=
 =?us-ascii?Q?h0yaHNE3hNSyqiWuKli9XPZ9QHE1oUeW2BzvJwy/Y2dEragTyeH0JutAKzpU?=
 =?us-ascii?Q?AjAdECEw4x8c2GFS/lmyZpxlYgn+7qAADtnoRutU0QkQwcVHYOyX63v5tJQV?=
 =?us-ascii?Q?bQQ4jb4+b3wKvADvbgZalbwPNsBjaYcYKBgqaTY6Dy7SbA2WEODjp+Nehwft?=
 =?us-ascii?Q?WPmluAbD6nb+JTUMXR3U32WNNCDWPdWZg+UvzKB5Wmtcg8EqY0J00Rla2A3S?=
 =?us-ascii?Q?wF9TdiPrtF1xOkyeAf01usAsPkqMTtF5o+WgEtuZpfk8VKPb6VAVCUpQyAHl?=
 =?us-ascii?Q?+47ZGSjgWrkZoTVSA9UPOm1fboXvTC6iQ5d74DmTbnvJwcFJDDOrXWFprbGb?=
 =?us-ascii?Q?vmonyjpGBnurUi8KkKNKMAzzjrqBBmN1UbxsnDDhH6jOc8sWGzTJPdlzDnja?=
 =?us-ascii?Q?bSdSzWuJmOsc6ulManCUBkTjZJ1g3ujpFiIUejsgT/hvvib1/+pE2PX8ZMAg?=
 =?us-ascii?Q?NKJV/Hrv0yRNb1BEPxHcBP+5Swhnj7FCl6lvViJmyTKjf540gab48zy2sH/6?=
 =?us-ascii?Q?fovF1Kr4tvMUzKiNY/RlayYBOhuQWIAQzAnpkRwBMHyvg6WEpQWPMkjzXZNv?=
 =?us-ascii?Q?3t2htx9wrstAdX/VqVNLpKeGtBeEF04ALfbHVQcd6B/yIPxKf3KUah6/Hx21?=
 =?us-ascii?Q?gGInmAMhk4c3RPQw7dJolekvojsMrE9ayUwyP4WJ58D9liaC7Fy/AjtIRcTi?=
 =?us-ascii?Q?4Mnw9VVLWqtHqQjRNpgf5n0HdgALSkO9hEwHykzgpTYmBp5dY24pgPBu8RxK?=
 =?us-ascii?Q?lX8b/HdhDG811skBHaYd4Y3JLNTC4zuFlH9Eb5kvD5QvkdS0gDxwgw5w/kpu?=
 =?us-ascii?Q?Ia4XA6ELxqqatyOMoIOoTR3FL4tErS9NnZOuGIKv/cZZHV1j6zlALl/2Tgvq?=
 =?us-ascii?Q?wEFq7RStgg9zFz14gHm8v3i4f96mrc6uJd1ADv/QcWkH0xAZGjppY2v3GEKq?=
 =?us-ascii?Q?6AlqUnCTa39LBrrjNjyAa4+iIOsknpGFRStGTWiawLo5oOy7cK+t1Be2KEda?=
 =?us-ascii?Q?2SsK1sBjytw40p0Q4vzLO+RmhdqAnjep5YevlCdldgvncxC99D0hS0UEGz3y?=
 =?us-ascii?Q?PVEmjPFvBVDJVMGbkCy94cuA5yV8DHQ0sVPYP/Xc5bQPBotWQ7uhmY83dOfI?=
 =?us-ascii?Q?UqFsj3cvEn/0nAoyfc/w8isxHqSgI9mihuGtkq0xaASPvX1tq6Ha6/y174Ec?=
 =?us-ascii?Q?pLN3PD/DdTZkPnaXVg+3RMw2UHQMUfAu0K9EtfyflnfplnEGbl6CjsKRhpHH?=
 =?us-ascii?Q?R7SQ7eEObSTOfqgy1L2odCU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182edc69-3a55-4e8a-4086-08de2051fe26
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:09:26.2808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJl0X1+UMlUgY0Fcob2bIVWhq+fajk117DWON5MOlknYL6LpsdQN4EpY/R4Oy/SW9e5pIMNGwtpo1OgrxIm2jpYbr7mHqRHfwjKVBpBJj9z7eQSQlrEmtbyeiOj27HUb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

Document the 'mux-controller' child node in the Renesas RZ/V2H(P)
USB2PHY reset binding to support describing the USB VBUS_SEL
multiplexer as a mux-controller.

This is required to properly configure the USB PHY VBUS source on
RZ/V2H(P), RZ/G3E SoCs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Manipulate mux-controller as an internal node.
 - Improved commit body.

v1->v2:
 - New patch

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index c1b800a10b53..03da74ff2d08 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -37,6 +37,12 @@ properties:
   '#reset-cells':
     const: 0
 
+  mux-controller:
+    $ref: /schemas/mux/mux-controller.yaml#
+    description: Mux controller for USB VBUS source selection.
+    type: object
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -44,6 +50,7 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
+  - mux-controller
 
 additionalProperties: false
 
@@ -58,4 +65,8 @@ examples:
         resets = <&cpg 0xaf>;
         power-domains = <&cpg>;
         #reset-cells = <0>;
+
+        mux-controller {
+          #mux-state-cells = <1>;
+        };
     };
-- 
2.43.0


