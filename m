Return-Path: <linux-renesas-soc+bounces-24173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2A8C36831
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B676642412
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95360340260;
	Wed,  5 Nov 2025 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PkW9Rof9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA0233FE2A;
	Wed,  5 Nov 2025 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357352; cv=fail; b=VfQp3RNSpakzxFV3jm5gY6jUP/WBZe7kt4qp04S3PtMnEjUaUmLn2fUsjtiKGBe6+WHcwUZtD/Lb0eOYXeo25sZ653sNbegatJxfW7GAzaiF7i0GNOeGa5ycRn/caHKJjb1BEdeBisozuG0BQjNfU7bKqTQLYxI4ztXlJqIrz4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357352; c=relaxed/simple;
	bh=09BwoBYj5Rs4MeOPwrQouEgpQ5sqM3cdbjv16bOR+Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HBSjf+FqmBqRrOgYFAI67fu/hwXuAN41fLgY9WhPGSieHSzQESMqifQMCWln//wLmVFmvJHoTm2WbfqWwdFi+Ave4vZhx1MLz9IXWMHdObjTC8Uz4exAQl/nH4Mm9frRADrznwLPfDAoOrAT4j1GqCe7BhVWQ2uJdlMe+PnB9Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PkW9Rof9; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2vHACSDM0TAKze0MgTYzBXKhgt5a+rv7u6lQePGPD18ISQEft39bK1vUSBrEqj3m8MUfTGdrKSz8RWTtcpAhMURcjP6wwr6WRZI0QKXFw8DcvCMnZR4a6UAszF5lKcB2zX3Ulzwg7lcuv31WyFfkXYcGBzSUPLxqWTP/rMVO0P77K+t9D5f43kQqiawSyvaF0cj4ivM0GpFZg+uaQ7zJ/9wQgwTzXpqIgvVr2zzdoeA+rfe4BLeqSvv/Cy2qyRClr72Jr9mgWZ7XGAUWKokuXaRMKYRn3LxTdob0/VjSo0vU0Ns8215sL7y6BNJLEdCHwbeUwezg7j4Es5oJ7OtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbkm0F84TtDoGDHBSQQrVqNm041pAnT9CnXS5+m3fxU=;
 b=iOEP6AQvgfd7IjEaAAinQAWezs4HWOdj1E0ewwcCszVK79fPacXAJJFBZ9QsjHdzfO/POn6YvFfflhOW3U/EM3Q6F2UojnP87R/7/CDFb267AcMWhdspB4SRKMKusYrH3NWcvpBgwbRHRPseHaXFXJI3viJKFpx2BMEnObPDoOyqccQKmJQwknlrkIwlLUgx2u5u0g/ewnX+BpymyWSBvBdh7MGPbboucPjke9rQHSQkTushBbsOYlpRcEBhZfU48fpdMN1kRpmboky/rYPTnmlNOeA9Q/D4eAcYldbIiqb8FGG7KT6C4LgUIwz4mE9SxuFOt/4RgBpwyDP2wiXO5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbkm0F84TtDoGDHBSQQrVqNm041pAnT9CnXS5+m3fxU=;
 b=PkW9Rof9OhFUPPScCF/cUTAFrAS0DAAUsR3u4JPcDP6d9XnqQuSDzVW3yl4b6gESW8nOdLxIsSPXtyWeTPrjkNAzNGR+JgDqSXoPQqvgpvUbbr3xvdqqYBMeeHOLsOzE2TmBJq94ZOz3DH/bysmpvDc06jBtPaDM8wYIvWwzzUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:42:28 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:42:28 +0000
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
Subject: [PATCH v2 20/21] arm64: dts: renesas: r9a09g047: Add USB2.0 support
Date: Wed,  5 Nov 2025 16:39:16 +0100
Message-ID: <5b8e13e227dd0e965125bfdb486f1ed665e0d8f1.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ccc3ce-82f7-42a9-70d8-08de1c81eccf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jPR14+ETTQ2McVIQNrh3sDWFrOPJ790/3mcyWAv4P5OIOuHVAFKRb18BKpla?=
 =?us-ascii?Q?Bkw7X0S7O1ppPvdYA5IjNwfNZMG72djWe2y7IUAqs/elxKfoztWH6+13Vtia?=
 =?us-ascii?Q?qdPjpi6WkkcVUKfge1Tn+3ktMd5gcR12iWQV8TT287dEnTZlFKT94XBbu4o3?=
 =?us-ascii?Q?zLknJUt6cgR5PwTLaHFTcauF4jbkeQJ9ypM6Vz4ATRjoGMPR0jl4pdTJpIoN?=
 =?us-ascii?Q?Ooss0brry8vzQ+pTGscHlvLhN3soZE9GcdOtD3NPRcrAS7cnLfNoLj7v9B+N?=
 =?us-ascii?Q?leUWBu7XlslNLC5mUPrwK0DQPTKiA9CBjjqPxlIFAxpUbGhk4Z0rX5PsOdgq?=
 =?us-ascii?Q?dRpz/8facSq8KqtoCC7TtcwDE4npZfTAxqYp29UUBwOz3016HbosCFHKzgWT?=
 =?us-ascii?Q?fNNSpMzepsaDvNdt48O9ShR1Pla3x1Yr7qKRyZEiYpVB7lLXMxDffIORz3om?=
 =?us-ascii?Q?u1f1DtVM6IkfmBIV7ft/AKLWgiY1jx68mLKMsgYDoA9Qx6xkBn+gzyC50F4E?=
 =?us-ascii?Q?+mPKTUfjyTxxpvtyWnE5vjSH1VKucQPB6lBuZFXM+ZI+vwOL/bOcmHMBhxjQ?=
 =?us-ascii?Q?mUNSwHmfLVVpzx9M0hKc4hscw7sO/1+NcETWf1HHKtlcUtPZOHj2LXm8X+PO?=
 =?us-ascii?Q?+pFFJkS4U6SLjSatYNn5ZlggPmIHTYt7BBwMSwmTCfGEAaWArYKMUXJVfpw5?=
 =?us-ascii?Q?ykMvdH89xrssFIigSydSxzB6E9dmN3BAgwtpPnnZBCpwB9jgAI5Eyf8gFOnD?=
 =?us-ascii?Q?GtRal3u0GBLNv2TziedcP+wAQb4L4T0mwkhudXau64s8nbe5K5ggOZNwiF0N?=
 =?us-ascii?Q?D3ZVxGdBjAUjD8TIRLT65ZMy3Ejvhto/HGS+/TkQ6oAGEHE5VWDslfHW5APY?=
 =?us-ascii?Q?c8ms4MiCwgQGKxE+dEn2yPT3xTxwvQfPXhH+4xkdo85PjvpbxCZPsOXcxIAu?=
 =?us-ascii?Q?xD197zg0Sq7mqvVpxQwO5O0z6kz8IdTSphYfd2+7sY2RhTJkUxwc0CVM9m/y?=
 =?us-ascii?Q?zsNoA/bqpB0+sNo0bFsh5aDcJMcNuRd1xpuy2gcvgK2bvkx2kRT5HLQi7MLs?=
 =?us-ascii?Q?qSYE266KAjTTkrVNf6iiZyiZiwwu/gz5GHvWqr4PlSOxcDyjoezzX/MP4Opy?=
 =?us-ascii?Q?2Ch6+mDjkULDpAkmFMI7tFSLS46IipLjVWwRsziirgGy4rWL9xy1ot4N5W5z?=
 =?us-ascii?Q?Q7ht/ce39yLSckeeD/xVAvpGEzbLNQG+tsV7yRTqwkZQUKVfk9EmfCRKGCBg?=
 =?us-ascii?Q?AUYd9aismMzdxZ174kYJI9NwuCw9dCl11D06zdpkEgHFhaypD0uOPanXxGcp?=
 =?us-ascii?Q?v8SjMOwmNsWXqtZ9tnuH2nnTQmID0uj3EfrFyiL4Owh3lxRw8icnBSI17DP8?=
 =?us-ascii?Q?6EuunzhvR2C22S80p5iv1vbF3CSlSGyMhTqokI3Cre4r7RtqW52ALBJMCzZi?=
 =?us-ascii?Q?3ZzVa+0h4ghJ5fB068QhrrAIzOuTWxeMUoLncD60aI779QR8IbgJFKsoGSWS?=
 =?us-ascii?Q?rDX6REOdNVfU/duf9tIndlL1xSh0N4HDv9i5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r1BVtv4QTZ2w4LySTwXaZTas3uUZPm7TTk4Cez9KlXta0q3CgHvnWg4l9PUU?=
 =?us-ascii?Q?Vc2YcJz2jVV0Hnb6A6pqMllgtMUlsBsNJfG8337bW4b+n+qxRdm/Drwlq07S?=
 =?us-ascii?Q?O8KDzSZQdGAGxncenMdt8yx9EuI5VnsOzCwYK/UtJQ9qlcWvd2vV82ylBrLK?=
 =?us-ascii?Q?Xl5CbqUx6SSvcqgcQx/su2SusImOcWOQpjnPaFFXyj5vzbOS0DfWkiQmyq6J?=
 =?us-ascii?Q?OWSjFvUpOzuz/k0d7dZWNMwD6sDg+L9rVus52fU4JSY2Blz9lFtwAGAosJ/A?=
 =?us-ascii?Q?eKGwhzneQdocYDbv+yxIvQs+RQs8/sDuLoqtb7Lc4ZfgHIDTlgH0Ujl3RwPp?=
 =?us-ascii?Q?ayaCL1hJhnBwSrx9xiF5Q8amf6qw/4Yd5GGhf/fbnSIh2d4vXz6jMe0wC8Rb?=
 =?us-ascii?Q?BT0umeZFpks/D84F0Nk9f0BmEL+Kpk84Z8s2FTWJD+nDh+V+TPe/CzWRlM7z?=
 =?us-ascii?Q?n18AfYnbGii8QUHiK5qbN91YVEm/6u71Vu1DLLOMWMUPDEUPpfcjf6OsWq7j?=
 =?us-ascii?Q?hBGl/suB5cfb79TPpxr4GO5mwymZDgnggTmiyodNkrtn0QK9VET5lXUkZB8b?=
 =?us-ascii?Q?GVw0uHNfWzg7NggJKMp/tJND39L1FJnh7GSwXL14kuHjH3K/oY/unFBqmx53?=
 =?us-ascii?Q?axbNhjvH194yxmbtdwDtI7DmkOFfv30l4ANkgGv9cJxAmQ7qgk+9vS7rlqqe?=
 =?us-ascii?Q?PESJCdsE3YrZ1IYX23+yIzDuuRDPlrrqUUsFDzGb9xT/j0FK/jY3HX2tJfsf?=
 =?us-ascii?Q?jLVBrZnTvc/ZSvVXRpOOe/4wyUc6Jm+t+HX34bj1vQvxUNfww91oLDEm23eW?=
 =?us-ascii?Q?e1Dha7hV2EVKB1ctAWO1HV13uur0MbNF3XR+8ZTC9KDTICuMOtxvtPGUVVS1?=
 =?us-ascii?Q?+Eox7NX6juYrJrnnYAUDcRfGLRmU4xFME/xz4uRMaSEdcornQ1gkCPiV0G/e?=
 =?us-ascii?Q?Bc8anaW8UFA5WaakOEHIxc0J7Pqcu/hh+B0KPKonLBO28rCwRnsReO1Xg1nc?=
 =?us-ascii?Q?uHSpXV+J1u/sZlDK45L1yxsKyE5btsabVtJIy8/hn16x4hBzPQ8VDbvqcTbm?=
 =?us-ascii?Q?ujfZWea9QKUhPNXkOBgHgc2iCMfxp56KfME0MseTK4EPhO3Y99JCdKsnsomY?=
 =?us-ascii?Q?0KK8FLeLC77nc9ne9RLIrU7m2DjMcYKN8o40HlvgWZ9f5Pv7CiSdaBSt5KSl?=
 =?us-ascii?Q?kIClWLy6Y8GcItsFhiDpVzCMA8KTkXU5o5Wb8esvAjx7Pedq/PtwLZWnUcBF?=
 =?us-ascii?Q?jMzwbSGGv5WBgDebprxxtSTY9thnKaJ9T7rHoRRiQp3jcQprcODXfMsv3JhO?=
 =?us-ascii?Q?hEjU5NhfgD1GZ7jVw0w63y4UHSEd6utCzbl7gMM7oIiN7lgevKL/nrO89x9m?=
 =?us-ascii?Q?OKNuw3tr+86KQLYlFGeYGnO1JgZELvAS/OJvt1+JsdNwnewONXQEyD0eiwoM?=
 =?us-ascii?Q?5bdxakzt5JBGMIxdxoLo9m466do654ucvgOvFWdKHZ0UUD0UVzvCIDweV14D?=
 =?us-ascii?Q?xPaRLgxKi4bR+ud2wScVP2fCwnQiSgP+l4d07wN57DgFMbbXPOBGyknr9Im1?=
 =?us-ascii?Q?gYd4NLLHqjlUX5Z60lFd+uUFjULRYRNkh1XlXiylgjNpCxS2/7bjNrz3fBI9?=
 =?us-ascii?Q?WD8MHUp4kut1LAoyDSqnmbM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ccc3ce-82f7-42a9-70d8-08de1c81eccf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:42:28.3374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+d9FpsFsS/95SfoN2TnIS6oSTJLzLweCurPMeg76cQ/qCWwPxrT8OtjB52acC0dJvrudAkVgmF/2RZkyIaBGngcD7vgorofWy4mOOcPldkrEpoANLZ3a76GNB3S2svo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
and 1x channel with host interface.

Add the ECHI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
in R9A09G047 SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Added mux-state-cells into usb20phyrst and usb21phyrst
 - Use mux-states into usb2_phy0 and usb2_phy1 to mux VBUS_SEL

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 7a469de3bb62..90435e5673fb 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -853,6 +853,131 @@ gic: interrupt-controller@14900000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		ohci0: usb@15800000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15800000 0 0x100>;
+			interrupts = <GIC_SPI 742 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@15810000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15810000 0 0x100>;
+			interrupts = <GIC_SPI 747 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@15800100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15800100 0 0x100>;
+			interrupts = <GIC_SPI 743 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@15810100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15810100 0 0x100>;
+			interrupts = <GIC_SPI 748 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@15800200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15800200 0 0x700>;
+			interrupts = <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE0>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb20phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst 1>;
+			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				status = "disabled";
+			};
+		};
+
+		usb2_phy1: usb-phy@15810200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15810200 0 0x700>;
+			interrupts = <GIC_SPI 750 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE1>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb21phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb21phyrst 0>;
+			status = "disabled";
+		};
+
+		hsusb: usb@15820000 {
+			compatible = "renesas,usbhs-r9a09g047",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x15820000 0 0x10000>;
+			interrupts = <GIC_SPI 751 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 753 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 754 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb5>;
+			resets = <&usb20phyrst>, <&cpg 0xae>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb20phyrst: reset-controller@15830000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15830000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb6>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			#mux-state-cells = <1>;
+			status = "disabled";
+		};
+
+		usb21phyrst: reset-controller@15840000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15840000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb7>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			#mux-state-cells = <1>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@15c00000  {
 			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
-- 
2.43.0


