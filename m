Return-Path: <linux-renesas-soc+bounces-24957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF9EC7A792
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 923BE4F06B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D533F33CE8A;
	Fri, 21 Nov 2025 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QfMKIAd7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF8D340283;
	Fri, 21 Nov 2025 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737978; cv=fail; b=aTTOBnnyl2u40u9tuzpXpp0K/d4nKXKmq4Ob2NTudK8nW8Y4YzvaQUWV2otRf6gkMu7AzFzIlDX4VYUO9BE5LIWveTuuy2tUbf6wSzsMNbxYy/QkjtmxTreC++zcsSbkqOll9qEx1SSBB4VY2QftrnBDo2h79lpO9S9WLMRKK2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737978; c=relaxed/simple;
	bh=b+2MzwGy/y5jUiGFv4pjvvBuGR9aHBpRJhr7VzdzecA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=alCKemInN1KlCC0HlG/z10DLuFy0Aa7YUjcvLTAuCtIOpGBphRvPMX+xMQB5VWj6UjASnVpmz3G50ZPx/yW0wJvHy7sZoJZNY1CzLjHv4mU6PIyujK1lbo4pdv91Lt1q9jyx6EmYYbW0R0iJemQXEWX5Q0Q/rU1s2YJKE9f7OFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QfMKIAd7; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pxu9PxaJp/iDgqR0SpFb79zC4y6q4Vs16yC8wTcimNZj2F4p6Wlnes8ZJmvseb7bcauntxDZ2MlSvu9yqm1TmGa6PYpCZrkQDRx6vA36vTKg5179ZAC6/3ZKhXtWht5A7oNhPbXbWc2OkSaGud5fI1DCwZ8cixdk3FOs5vAkisl9fPJPVbynzWl1NP6r7M0bGG7Tio8I76x+jlDMAeZXjLGvWXDsn6Qa0L4yZGczYYxpYupfqzda2eM3aQpAh+N9cpored/k7OZD0wDqsiu3D6o4qgn7ah170ID/GKR4lWpE6Im7py+bL22fUquWYiveHAdsUrbPy4dkLf/dQMCCiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5UH4RLXEiTfW9XOWBLbeQVH1rBO27YJQp15hm4MCTg=;
 b=HY/MdRsKaouNDJLxT8fjlSxSeyQhc8hsTyHOwYujhpE+FD70r27JB4C+DPa2VfnFsXbcEDZBwQ0FcW0RWhJLHheaaNBvFF8j5+yv6H42uchgQlcKghDw/wcK7KWxiggFTxzCFCR/xrfTOQNlyylIhdl1QxEgLukJX7lOZEBzNf1p2t+XnLZQyTcAZk6OhsVVE019qeo5tQ3EgyibR6J/K0ZWqJ2mKjXmHDVAzO8AUxHHP+cIqN49V/EBN9tY628sRSFvA0neFKYk0ZStnbM/VposgI6a7wGilC8yptPeoRJnLT6JZIHTI9p1nkr1BdLEK+5YnPhsx/QLblXRsXwZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5UH4RLXEiTfW9XOWBLbeQVH1rBO27YJQp15hm4MCTg=;
 b=QfMKIAd78gRkPz5qE8qhijwaRRAGSKDNCuml1D224lZM24rZrrw01+6Iwtwm7I3TR3oORNN1d8Gt5YO1BZpmgfORt5RExGRO5hMwbcjRWUDNQIRcOA/v1iA8vpjtAUjJWiyPFkfE2r7hE42/eSy/5QrHJqD0GM/pNcKn2/IjdLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:12:52 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:12:52 +0000
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
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 01/22] dt-bindings: mux: Remove nodename pattern constraints
Date: Fri, 21 Nov 2025 16:11:50 +0100
Message-ID: <cb7c28ccf3a1b136e793b48720f816de7d5f75b2.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: cabf41af-1b41-4f1d-3b52-08de291070ca
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bKlzIRx8D1IUw6JyRyGgfixPUls+AOqaJNSO0HYrjhtxu6OHW+LHw6H2lFNv?=
 =?us-ascii?Q?IRxVRnJNHvfjeTjhAvgUmwxfyTE21L/gSj9+Q13SCW8IiHM0XmRKjQkOcsCT?=
 =?us-ascii?Q?xODIPvmyhSg/C9Y0yKoC1tPjGHKsy0WZYr7vqDlSUobJdM3rsbJ69b3Ld8Sp?=
 =?us-ascii?Q?q6+hn82xC+DNdEetOIYGbcz+7M7WnqOz2832Dz6gUlT+DArsB0XfUqsKThwb?=
 =?us-ascii?Q?MaOEMdU6gGg/LdTxInpZoSg5uBDYCMtYpoTYbwi7xX5uYJXKVE8iyjZdTvFh?=
 =?us-ascii?Q?m7XuyJ2wStbJrPO2gVzkvQ6+dRX39JATQwu8STgXU1KEyzfIg5wQHYc5LmsB?=
 =?us-ascii?Q?fATlVPjSvXkoAmaTwP98mheFkciZ39eQMwxpEzUd/YsFzhK5B+GmBgKhPYxd?=
 =?us-ascii?Q?B23KTJilCZO2Bz05Ya7uqZsJB/StlFXSIULhqUCyp718tFaF24yJRvEsNNxW?=
 =?us-ascii?Q?CHDR79rnoSk/a04Bs9bOeOjAtpNnmZYaED6nKzHww6FR6aELLMt8AAUjIcSS?=
 =?us-ascii?Q?LLDg9e5O6yuEHhQAcjttwrEXCMZ4CLcnM/FxBFg/zRGIMaYxZCa///vWi0Tz?=
 =?us-ascii?Q?zPfXmIrz+ZAvv1CNBE9d/H5+zMhOVQh9HQ4bvm9krg6YESNIJRAV4OC8kRcv?=
 =?us-ascii?Q?Kidq6HPjqdqnNDr4TqRG5bg5EiMeIoZPiTNAdyzqnptB6Y4iBOKVIGsq1V68?=
 =?us-ascii?Q?Gyl4Q6yUtHuSvs0As+nTGtfaxYNjU4tGSwIxuYU+YSfqfgHnQultXR6VWi3G?=
 =?us-ascii?Q?ETmjbPg/aCupF5YWc+KACBdwbmc7h4RMih8qBZ6TOrIgxylip4nkN3/5X2NJ?=
 =?us-ascii?Q?dErbeFaIFzCKUtGIy+M7t7wwjk5+u5EpIgDTfvhuCHWfU8ztmur4BFwyfP9D?=
 =?us-ascii?Q?kTbYG5p/VSHd7MKp1LZNgDC6eLCNXfYXgc5HH5UjjWGyZ3oxdJux21s+bxPY?=
 =?us-ascii?Q?agOz+STwOCrguc55RWu4XbTOcKf6EH7sCCTLvjAAS/Jj/wnVY9xohRIlIJ7G?=
 =?us-ascii?Q?D8TNut6uWey3b/3xwXQwZzA3WMCwSB78eb0pI/C2P3TEeC5CzEPvFJMYtNaf?=
 =?us-ascii?Q?9iWY/34wCWXokzHmxtNC9958PCFysw0zjL1ms2Nm1WNMzo2DUn+5Map25JoG?=
 =?us-ascii?Q?jEgnNWz60H9SwIDgYN/mwZGC2iP/UTQJSmp6NiUmreCR0RJtln+eZD3S4OCV?=
 =?us-ascii?Q?8c8Mxfcz/prXj5QatZVWSNxt/CzqYtjHGVMdn83hA70QmMVjMmoMROgRi5dP?=
 =?us-ascii?Q?r02YAkEunAbhAs+W/K0pdzXqDguSbzCb1LnB83pWDLX3mdIQDwN2irf91qUi?=
 =?us-ascii?Q?ySMUNff+vf7wLRxBjvXemMMDCk2Fl7E/dDlVkZKU0z0uOadVsQ7q72waP9J5?=
 =?us-ascii?Q?K3CPukOHta45J3u2ioHLQLvf3KYQBL7f7aAYpZ282nTk2guigrcxLR57eM/R?=
 =?us-ascii?Q?ez3BnKcPIPVg59oM0ydepWxLnBvkMQeqQsKnmtiXs+/xGhlHW0wNNM86UNrE?=
 =?us-ascii?Q?YQLY5MOQBEMxDV1LMtgtZP+h7YrWfvh4u5nO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VUZNNEiNI3+hEdikxsMG/xHYwFEV+pD9SW2MQV3MN57Vzq007t5yCRfE4kcw?=
 =?us-ascii?Q?telU7BYRa+A9bvLhZb4r+4RVDPjRj4zul4rRbm51kXuVX/HRjpSWDcXk7fti?=
 =?us-ascii?Q?krMeIQEpaLS8Jq3HUL/dRcTnDEOloevFyl8V95xgfxVdOrq43aWuM5zHpq9t?=
 =?us-ascii?Q?USP+OztnDDuWv9TLHq/ofCz6npLj/YTL6+qY/W6305ZQtd0EG9XhdNg3Oz40?=
 =?us-ascii?Q?PcFVbbyOSE9jgd7isxCvHEPZpKciyFgB8NsKEzOpq4E8nY1jlJ+ZYH4GJxqe?=
 =?us-ascii?Q?5uBGNYcRva+vQg7RBhxmOuWiiYH1nOG1pmyCEHE+ME8hUK9F1s55i0LS+g7I?=
 =?us-ascii?Q?wSEV/OGwPfQ1ujLgbxBlRYLXAmyRmbaZUNDTEDynPyDClsRk48M0d46H7ogp?=
 =?us-ascii?Q?Y1qb1H54/Y197KE8fSgQO9lvwRom6uxsJ0JNCBl2ubsABRvw2Bnn/iwJxYVM?=
 =?us-ascii?Q?Lv27WLBDhs5GlHQ7PFS/iFa6SWNDaGK/oSKPYGP/Pajbpazt4sdT+otjpb2+?=
 =?us-ascii?Q?BcrjB8Mv1WjBXmb0tpyl5axVXoKLdwKBl0wDiiry9hQqWAMuErg6BgpzxCBD?=
 =?us-ascii?Q?FB45m4QrKCEeIkYt//ISZvgPlU1KWaf1Udy3Suhd2SxnmxoblxvITuLi2wQr?=
 =?us-ascii?Q?bcUF7jti0CqWL38LVNuTAsm0LXxQ4CgTqclYNEyx4fZ/CRfvzxAGjlzrq7yu?=
 =?us-ascii?Q?YTvd3NpUf5cU6NjMBX/RK/1bcndId6y84PATBRfDp7BQm/zOB4Zx5kYBHPG2?=
 =?us-ascii?Q?EHG1MT8uV8lrGyzrYRPP8AL1z2/+ECM2NgarzTcEM5T6mBx+tRlLvNXOi4ah?=
 =?us-ascii?Q?jegDDjNnhwT3KZhe62X783b0ZsXlLqBTLjvF7kNKPlupaIE01IYFNZzmjWo5?=
 =?us-ascii?Q?tzjXFRHrpvv2yxZTOMkzH13IGFUxLhnluwhoXbJur4e8Z5wWPUY+fIpxXnki?=
 =?us-ascii?Q?e9WSzfUgtAFfQK5nrykDcCsZj8gYF9/8hYGQD/umIf97bB5DzBbzBmIAFAF2?=
 =?us-ascii?Q?2W0+Q0hDObJWRzlO7kwkPuz1NTkUOvziDL5mtP9q1KWtTVhXfVCYossd+IyH?=
 =?us-ascii?Q?jnkQMiRuMS7uQSoVm3cykQjkHMJOY+VTiRcfw2Xq6VkD9MB7C8A69lZf7Uqt?=
 =?us-ascii?Q?Uk3SZn2dOlpsgoBRbNt9y84aN1FmlDN453xHmd+LLIAsoFdkSgNVH2tbao0z?=
 =?us-ascii?Q?EGSD1EMDUgJ1RdRUJXjW3i6GrvLspT1BJQrAHIhABONVQy0lADTycSenteiu?=
 =?us-ascii?Q?ngmpp0PQ0lSwzCXyo3I246Rn8KcZ7XVWOgfj16cvU3NB69Yh/Wma9bTL7/HC?=
 =?us-ascii?Q?u/4LmoaK5gEq06Is1dUjpYGq20rAuiIoJYswCemhUzYyVJcWzzvEL0gQl3yL?=
 =?us-ascii?Q?oG+Etk1edc/7TcXohCkWDJGphKFmDPJxfeMFMX3g4pwLDoe/YRYBfRUQP1iO?=
 =?us-ascii?Q?GTwlAdP1wAse2sBNGoMhP422vbPkCOsNNa752X4B9FE/yXhdIJUxYBsXreL3?=
 =?us-ascii?Q?gWLpAvqIJ7n9S065MPJunXulaQjWGtFIq9b9uoCrouu80zFLvUZORdRPh2wh?=
 =?us-ascii?Q?OTFikRCDwgmLzdoqCi7n67YGlP5NBpNiJRbzTbaYxNDhfJQZtyWhzB3hvVE1?=
 =?us-ascii?Q?7qx7ICLyQUz0UbVFmCsOAlo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cabf41af-1b41-4f1d-3b52-08de291070ca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:12:52.5287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySUk+NBhmBaLcY+ADIn73Tm5SasVXsn07VNVHRfLxRZanqR54y8wLfuK+H0T6pRhkTOMKFehiEUGbLXCv37NexcxKC1OBOEo/95N9oePdtZ3N8TFvJtVUE1AMiA5N6i3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

The nodename pattern in  created an unnecessary restriction that forced
all mux nodes to be named with the 'mux-controller' prefix.
This prevented valid use cases where mux functionality is part of other
hardware blocks that should use more specific naming conventions.

Remove the $nodename pattern constraints from both the 'select' keyword
and the properties section of the mux-controller schema.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - New patch.

 Documentation/devicetree/bindings/mux/mux-controller.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mux/mux-controller.yaml b/Documentation/devicetree/bindings/mux/mux-controller.yaml
index 78340bbe4df6..6defb9da10f7 100644
--- a/Documentation/devicetree/bindings/mux/mux-controller.yaml
+++ b/Documentation/devicetree/bindings/mux/mux-controller.yaml
@@ -63,18 +63,12 @@ description: |
 
 select:
   anyOf:
-    - properties:
-        $nodename:
-          pattern: '^mux-controller'
     - required:
         - '#mux-control-cells'
     - required:
         - '#mux-state-cells'
 
 properties:
-  $nodename:
-    pattern: '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
-
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
-- 
2.43.0


