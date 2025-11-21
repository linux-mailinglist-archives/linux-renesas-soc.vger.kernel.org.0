Return-Path: <linux-renesas-soc+bounces-24965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21866C7A813
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E44B36565A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F4A350D60;
	Fri, 21 Nov 2025 15:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ef24zs1t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1754350D4A;
	Fri, 21 Nov 2025 15:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738049; cv=fail; b=RQ1E5w7Xqc0Ax7xmxic47HMpxyI1u81nfnB+a8W96M+eE8HS1NHbDD54uTppP5msWeifKY7fDzkbuOc8jg5B3ZDVI0HpfyWvetpSQ4AHxhOGfmlH4+RbvwNQ+Ox/5wvE2PukxwuEVpipf3VHZzLLzWxnoS9JeRyCW2sIYLcfyPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738049; c=relaxed/simple;
	bh=voZyrkThP/V4JLm3CTfgu3CQlB6Ca2uo4j4/DTHksvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ouuYTdtV+f8yk7zF9/f8H+d3WHWvNk0MvTC4FWQ5pN8ldOjTNopyu/aSIh7gblPfFD1gG8ovIht9fBGGqgEhskMJxQN+bKnu6MVfOrESi4o9QW5bus8TtsQ2io7fMEs++XQJe1r3RsULCEdwB5hs42/zkzMYowxm239MgyCLJNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ef24zs1t; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3ql4MrubFLXhIfqLfs4E9nbJIWEjhISNtpS3s4TFN5IhyYC80j8reZB3TxheLmmJhVrx9Qx0/C490r2hz9W9VjHIeZ9QL7zml6Sx4oZEeU3Gb/Tvn9GnXKQd8iEM79TmoH0dpLpO1HWHMERE9Qp4qQAyejQCIEm0YrTq3mKXiLClqKlGg1sx2w4wnn91lx+xhEuQRYVO1+2qh8+EBbEvz59iS1BS27ZeDoUwILLnkclCWxiZ3EoSlO9zOc0ZS57ZnOX3PejPZHG14LaL5swGanaKG+jnT/Tm+PvSkrgbq6nCeoFGvTxExMKKY/5no7dxyAriuSeCvsroH0I6KUsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMDkd/89+1OP/U1JgWSk6DNaN/Z4rgNBFHK39Q+qrHc=;
 b=rDWNac5d9KAbb5Sl6DY5wEW0UC8IEXgz/OaGHQoiA1fxE5vW0OYCyLST6pzSHfYmKg8Jf6T+WyLgDN0TeQiwF4S1Xzf1TwpLELA4F11VNynI005tWkhNy9zsn1MIRmnSKXk/PrDkbWtCyTImYCiwNB2fq0f6axAYNhNuNoNmeMnff0l5VpDp9gTAI/eZOwiyp0QK6SM8TlozG7Qyx9HNivye4EeAc3h8s+TPnTqdS0sxJZU8DeITacnwApZbjdtrZBigrEneJ416wrjyivuKvhlJ148MSQygpqVtr6A3awV3SeaCyrkTEvHaBOH5wYPfPiJoG7gfDYx7dzOgHrR1OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMDkd/89+1OP/U1JgWSk6DNaN/Z4rgNBFHK39Q+qrHc=;
 b=ef24zs1tpcA7tIODilBD+RrgMcDXCdmHsZCMA4cdRhu5MnDQR7u7N5+5v7vFqFmSQ682Kq7ib+FSz+hZ4YLk5JztCEq0eGYuKchXz63/O2mj8kqVuqJ41Uoig9blKjx2SgMEGWaLFfyZyR3dCe/bquTPP5xcGy1nky+0piQDlog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:14:04 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:14:04 +0000
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
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 09/22] dt-bindings: phy: renesas,usb2-phy: Document mux-states property
Date: Fri, 21 Nov 2025 16:11:58 +0100
Message-ID: <b86bdc6a5015e0265732ac998ffa50f940bdbfc4.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6e2e6601-901e-441f-fe82-08de29109bb0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OvqANr9JKhzm5dXeXW3jBcWyPXKGnMBq3Y+IdJ3HKAYI/J9NIUUhSiCG7g/e?=
 =?us-ascii?Q?QG3KbDDGVpCigzB5VwdeCiekAZNkQMrPzgIvjebWQ7gVH4trfN0l+T7dV2Py?=
 =?us-ascii?Q?TTUf/8RbpTMA4Id2p4M4xiQWNoJuSIAYuNXK85wkqVfDmQmg0qBcoY61/AjL?=
 =?us-ascii?Q?CcGpf72iIUlkdYG/aXorWs4BJ+hsDh+BltE4AAQgqCdDQSoMTCgi90k7dMry?=
 =?us-ascii?Q?tioVy2E/QVYwVPoJwzhnpsYFXdit4S4UxTIcnsjYwWVjQ+0aOtszN90Yniu1?=
 =?us-ascii?Q?17HUoZnBbALaBsl72uiBDRgiS2zLmsu6UMND4K9Vb8dQzErtLT3sJEOGVJp0?=
 =?us-ascii?Q?u09/wjOZqyFgJ+OlisvCaD7YyHzmri3nFJkEyv2+0b4QAGzw6P9i0/oS91L5?=
 =?us-ascii?Q?4kH3mu0XE0IkxVS4H1rb0rK+YMhbHUr7oKzr++x3dXmIHSj2r0soeoyDjFIG?=
 =?us-ascii?Q?bbNTyBctT62Xl20PaIahvO5GRi1KH9zO5tUmJLJEjlsBywt94C9NUR3+bQz8?=
 =?us-ascii?Q?ccKswiz7t9wtIUUnR2AIPZbjcO86mYpbv3EWn3jbZAXU+hIJBEo1RAPRHJsP?=
 =?us-ascii?Q?rTGE5FEVtpdjKOIqPaHQuhdw9jzokdnZTX0TFC1zACenE7WjN86cKAiCpvmS?=
 =?us-ascii?Q?RIn+gIpM2PcONqhdC+YDzGgPnL0bnpcFT/aWJ/OLhjAZtyR64uleMxXvVh13?=
 =?us-ascii?Q?TRDPu7oZyMK16+ZEx1DdFO9OdvAokn3TynclA+/QSA/+65HUafeU6es7NtJM?=
 =?us-ascii?Q?Nx9qxMe0lh5d9HZC9q0l7m83mjxxBQS4myhHIsLRhIobS9Wf28gMR/X8VY7N?=
 =?us-ascii?Q?d8zbL54JfcExaBYehew9OTrsOqax6+NUcjseB/mU2uQX09TgzSbkhjabncWE?=
 =?us-ascii?Q?3W2F4ZtXU1TnD1F+wpezJJueFYu57/vrzN0EccE0S/oZuZp+2zMBtufvEgjY?=
 =?us-ascii?Q?tVZRnDFs3Vsu9qMbmhAAF5AEcakBF2M94/0MgmiOjJU0V44E6ZM/nbAW4tpa?=
 =?us-ascii?Q?ABoVVXxHY2MGhhiXcbNWLMkbDSFft6mjQv1bbwJ/oVL5YIW4gwD3dnkphPF/?=
 =?us-ascii?Q?6fcIMB233WFn2T21+CKeYK+Nm12jZwXVZT36avN6Ax3OkRGGh34/MwHS5vM+?=
 =?us-ascii?Q?qibOW8kj8WgeD9fF9ne49x7bWPTSBkUTz4LS6yqjb6lOy2tbLCt3MSslgAAh?=
 =?us-ascii?Q?DsH+4UX2om5uLrEfO9T35NBRTlFAvZEY4Q1eHbn9dkcNvBpxTOx/sO4dh4XF?=
 =?us-ascii?Q?yCqPN5F64hatzv6RzsEauavvbiOFDZLh4KPZuZ5O9mXX3KVXWAuukNrAaFSh?=
 =?us-ascii?Q?wbv0Dvm2kRYutxCdClbjKcMeE5IYmpEXkiNB4M7AAXegg7dIgxKA8rvDsUIX?=
 =?us-ascii?Q?EaScH3jyNBOmZEm6BlKLcK/yPB1H08MO5xZh+K6Br6HX+ea8DpYxnkPwibb+?=
 =?us-ascii?Q?w20A5DM5TYFxytfOk2KbbarCcZXA+bZebupkrMcUhNBWjyPyw4WxXKnm3Odi?=
 =?us-ascii?Q?fGfc6F/Trkek+f88UJOxjP/CDknU2yaAZJ/E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F+tkL5nn/i6ck2x85EGGfDJhukL/DecGjeTR6eekdMarJROI9E2GiJI2z/eB?=
 =?us-ascii?Q?vn6gCEWakRNK6X10WRhYhVd8x25r4rGs3mFaDkvEopL4fS1MKFv4dqTrdaGW?=
 =?us-ascii?Q?ko1wGrBVo22dlA/PJhlrxcLtnSWa/nZxaS8uJWZUA7nGU45mTd0qXs4MNSgV?=
 =?us-ascii?Q?V6EqwjJJ5+i+J1jvTszEI4iGpBruS2QOgEA1nxGRoxnDy1gyxJIRmcEELTxG?=
 =?us-ascii?Q?JPHvsw7by1fH0VyUjv6sQq3DPRCdIRHbsV527uVVBPR9Xi2h7JZs9ZYa+WQB?=
 =?us-ascii?Q?aA+neDPto4HNiI3rCF1juS3ixezeh5d8LupYOsjKmweCIsfgJ/2gftp1ealO?=
 =?us-ascii?Q?csPc7sbtQJtOcsm2CLwDszAdMOrJ9tCtOv8KuuNQNnDiPQhJBHdEdY/dUwZf?=
 =?us-ascii?Q?QfUM/qkLoMobXKn8wmxpT7/6LTUkdB+CjIohgqknxlzA9BIPo2KBR5wWaIcR?=
 =?us-ascii?Q?kmNjFZa/Us+p/JLegCoBRngvSdCykTReFKmtrO5M592prDBabZSF2E421vd1?=
 =?us-ascii?Q?IghJefwYl1M6VjU9R+isreNsumwDbuxWxvXW7JMdWgLPzs/sNi77TbQloQPU?=
 =?us-ascii?Q?A/yOx0MlHsQw/cTRVgP7if3tT66OtV+La1lge8kSlWi1dpSlUpJZECgJWcP1?=
 =?us-ascii?Q?QcDbYu+6rV7LqdNgMAH1rbzvh8790MchSiNep8fdQtk+dEO501qKfK6Qu5Kh?=
 =?us-ascii?Q?0n9gfED5cTPCa/NpWDi4XyWrU3tswaRR+6kZhDPu7SdB/CS2MSubQD0pPzom?=
 =?us-ascii?Q?ORiIt5N42HwFf02/psmq6uqq0lZkJxvs0iaoPTbt2IPIT2BQyp51FaX0sMnX?=
 =?us-ascii?Q?S1tgbEDD0YxtPfPT9EOKU+VjujiBl4pUHDjtL2riPxms53y+Nf6oimwREP0D?=
 =?us-ascii?Q?sWXV/n64B0Q1IrVsw4+bUUlPrw/9hzdFGg0EqsZehLt6wpoZE9XJkDHUtXEZ?=
 =?us-ascii?Q?l9GZjmntcOCNb+zAW3lCXBkOi3RUngsArVDDA9kiAN/zD2Oxxig+ulhBUG8c?=
 =?us-ascii?Q?n0N+UawA5sWgE03/C+ch0qrGStP2HAALwfv56zPRqQqn9Rv0VOFa/9CQSY1c?=
 =?us-ascii?Q?Zm8+/q8X3mmO6T1sHw9Y54Q3HF3tW8m4wjTk/y+e7FusJWELbqfWMOa6FqAT?=
 =?us-ascii?Q?LtS8zJbrcP2LljDX/mxTIXnE7BCay4E/JFGgAKdbgfUt9Igqly/OvFl/7Tyn?=
 =?us-ascii?Q?NRSxAhXUDQmvKiS9hakLDMvI+1hB7VRyNmJKX8Dl64jPD6lrv+gOJKGigf48?=
 =?us-ascii?Q?yLd2JhR/t5TGOX35O/82ruMZB3SracDJVjc0A6R3wEsRwiIkB6YkkqtGMiJu?=
 =?us-ascii?Q?xjv+5a2i1xkgO1nE/G1THEgfN5O+5xK6VafEHutqWZEvhYxV4F+0SWnDgwzi?=
 =?us-ascii?Q?XRnJCJQZ7ZvTynRMQAqm5DIAbj1EpMw0S6XM4KuEl/gnzpK05Dm10EMRAwlc?=
 =?us-ascii?Q?pDUaR67GmxyzNnVtbRvwRqTfSXf+d2N/MnkEd1T21RRFORCEE1nJRYnbTqqj?=
 =?us-ascii?Q?KWpLrNPoRecuXi7j+YojkVeK4VdiAFV0kKeMstbHe3S9QxsYmgq1kHpuTYoe?=
 =?us-ascii?Q?Fx0SFLAQKFFDaoApThCGJDD4aMsv3KhNUkYi9mJJB5tULEzf3B+zJqzojAf2?=
 =?us-ascii?Q?tpYgx8w0HVsbYTXgD9KgIdI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2e6601-901e-441f-fe82-08de29109bb0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:14:04.2440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gb3TOdlWORFd/byQ51P3hwkUjxhyywpoh469dC+fhIS3piyjcBRPlqyGsEeqzNtn5pEg8Kf2sQ/TpTOoJ+c1m+UWqGFhJcqtViu5bga5kJtlrZf4RP9VhNylXXRy3PZv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Some Renesas SoCs, such as RZ/G3E, provide a USB2.0 OTG PHY with
configurable VBUS control through a multiplexed hardware register.
This register allows selecting the VBUS source via a mux control
line exposed by the PHY.

To represent this hardware configuration, support the standard
`mux-states` property in the Renesas USB2 PHY binding.
This allows the DeviceTree to model the VBUS source selection as
a mux, consistent with generic binding conventions.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Collected CDooley tag.

v2->v3:
 - Improved commit body.
 - Improved mux-states description.

v1->v2:
 - New patch

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2cd0efa75f81..448da30757f2 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -102,6 +102,11 @@ properties:
 
   dr_mode: true
 
+  mux-states:
+    description:
+      phandle to a mux controller node that select the source for USB VBUS.
+    maxItems: 1
+
 if:
   properties:
     compatible:
-- 
2.43.0


