Return-Path: <linux-renesas-soc+bounces-24170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF5DC3683A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BB381A22787
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83CD33B6ED;
	Wed,  5 Nov 2025 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QnIkNNmT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18A32E748;
	Wed,  5 Nov 2025 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357330; cv=fail; b=YufU8qfoSpTZwHJ7UIwTrMlt9BZPjIrSJW5D/eJLRcmoRaedxQ4gzuBwVFJuiM91tyCU4i3UYEQj2qMWkxsH0TtwLVscklPUYLya/REY7+9MZyY2TYTzAywYKXv1e8N9dagmUtq/lSf6F1X0JqaZyr+/sDL80/8tQZbqaWJerys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357330; c=relaxed/simple;
	bh=ZlNs1CIDAMAzKfxs57xiBROLRAzeLdvIs0ska1lo9LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aJjn2R9RvapARU5Oo+gyF6kyS2UoCB5S4sAlTxoDTAMa5W0h53MbhX2s5oj3k7L/FUcGeb4uXsA6OIRTa3d/TWCGoDPmCPO2Xf/b6SRouYv4aTfkXi/JIAcbhzd/MpY17MAFvmVQ0N12vMn8yWlz3DN6NYrQV/3rTkj6YcD5uLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QnIkNNmT; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpDsEmdiH+eXEXolGU7r9yBC68qQpbio1l2J6TRZd5bGMkw4Pf5ihO0gYbd7iQC6F1ZeOVu2ZgxBdQ77YlfKuQMpYKrWGZNuUKG1M1WMYLpdWJCzY0jBAxb2hIaZ1iso5VL8oPA+509GOd+Pcg2TO/Et2/NlsNFOLyJqfnIkxDukD/PmlBZ9oQ/QwIWGrxNRlb/YQ3Wr2PaT1p3NfZkhy6LpUhKdTrGORWCBW9YfYLHVaUbyYwi5bJ+iO+Yj47URoTh6SytY6rLx9kzUXJm07ZlvJDamq4VR5BcEwtFFtF8NWC4PQaydhNbPXIjUplqJYYw0Ea65wd1sjpfvgLzLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaSrXFnBqqYPgepXPsfF+TjBmB0naDQlDLexgBGdJbg=;
 b=GTEGbJssO3h8xKfg7TvUGM3vaFW2SA3XOoJHG3YGUVfcEmaYtxNJVPi3zTJ9HXu3dP/ytFm+Q7/2rryhP9sFNFMma+mDFTLVG+Zwv25OlbuU/WyEgwxmXAQRYGxhAzs2TTpb9kpM2qtmK1HNKls7QPtNDyLiu399+/uQzmOyDNBUmdirH4hjlNyv7yCn17SQZ8PYdDbg6i/jmB9GPulIOxWBK2vPPCvpm81AoCRo6O8eaHmRlj49lQ+88fOCef8rE20fT29BrtxY3mNaGSccapOKBqCJNcVx8sKAEZO7U1xkuZSAYTUREg8znIa23U7u6xUMw12vryJ7hWeVOEJQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaSrXFnBqqYPgepXPsfF+TjBmB0naDQlDLexgBGdJbg=;
 b=QnIkNNmTa2zKUcFqstKEcu8Q1tE7NWIM1atWLEc0mruMXEzr3X0N4j0DrBHLsLFAe3VAk3UOy69LHMsFo53slPlQvTR8hzlN1h0mYvAJCxO2sY9MK9epNEFCZv0d8mfSjF/bZAH17s2QtFLVOWnOUGhGRKdUmQ4eqnYSDUG2zSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:42:06 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:42:06 +0000
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
Subject: [PATCH v2 17/21] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2 PHY0 VBUS support
Date: Wed,  5 Nov 2025 16:39:13 +0100
Message-ID: <653efbd610dcee3f93ce3ac165dda6311fde8a98.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8d223b3d-421b-4ecc-c121-08de1c81df7a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ZgqTrij4o1f0FE//bJuaqQKP8jjp3RukwrqD6EsWCB0ghGT8dBkvPvBOTzj?=
 =?us-ascii?Q?N/dq8Xl+HNUTvmyhDZgXzB7LIOQZzY2eZZOTTbDApRP94ReqQ4206mQVd3BC?=
 =?us-ascii?Q?Rv1YXCxugZSbbPIBYgmtZJIp4kxvDD39xeNVwcxjrkVfD7bPbTS2AAqQBzlD?=
 =?us-ascii?Q?e81eRjPM0sqay1WRwiDUWfCpkfPT9n1x1mb4NF9dsbMQlCJfc9Tp0aFHsqa4?=
 =?us-ascii?Q?gM1wn6E5DJktCRHT9WtaqUVzscYiJOuAaT/cWoLMyF7Z86nT/3rhndGZ48qy?=
 =?us-ascii?Q?yQsnx6H4XKoWLZbLvJFP2+dBlmOC4y6FNtyc+utDz+nboV1VIpsdgSaXYsYC?=
 =?us-ascii?Q?yX0yayTRRTUVd3WuYTgph7R/z91RTFi7cmI0BCLeh73LGTIxGwx80I1MUAwV?=
 =?us-ascii?Q?wR/8lKmozw+QaS1bJ1Zd1eHKBOb2lV3fKMzeE83SiV7bT/s4eqSzhvIJN/zC?=
 =?us-ascii?Q?0XX/w21T6Ha6CSv8uiIVVA7hyO6CR+e2+q2bsp/uy97slMR+3Quj3bMe9tvT?=
 =?us-ascii?Q?OLBkBJ4FsNJgxsdxMES33zXdueMXkOx8ufJpy5yJrw7t4sUC+bkQ7VmUT5rt?=
 =?us-ascii?Q?LkHg3GI54JLsVXdunEUAmIbg63Qyy7UAYOWmV172PATh7aOM4HBPkN8jJzgW?=
 =?us-ascii?Q?DlQcJk9fcnC88rAw56RaakikZcsE5NRe53Eb7sI9RUxRDhG3Yzjcdq/l8COS?=
 =?us-ascii?Q?FxkSmHRrArxP0jefSK8ce6NxemcNw+1AbGfxcNK7chsJUTRUeYE8x4gjdftT?=
 =?us-ascii?Q?ybOCiGu2VIYqP3mpWKys5W62WFiddF5HF0rKBrkYVmmudrcti7/sGnhsAZRa?=
 =?us-ascii?Q?CmdBjFSwpcvvHch/nZLLWOzzNWhb6CcCgnR/IeLIyw+KjW+82qQjv7Q51Kkq?=
 =?us-ascii?Q?9sz7CogAH5GJHvZBivNGYugWdu2hxVIymmijANf2TbPaxoIzUtu0mKkMVRxY?=
 =?us-ascii?Q?GkwZ94iaHVd+pdut4wbGAAIKbG8hFkNhZQ+e/WqsRjxS3AnXDMqFPju6CSxW?=
 =?us-ascii?Q?u1vLUcCEj+vI/z1NLa+L/HC9LOkyPG3++j4cXmcLmguozMpakMdlm8WBtY+p?=
 =?us-ascii?Q?2UJC2wt07wNUoXN9CktmGzItd1sDiltWQxDRrRYCQe05QBjGai8Jw5/0N6u8?=
 =?us-ascii?Q?0+VsMq5qv+sKhuAtCFGZX+xdODGKJmgqs2jEkRHxq1o37hLq7KZVs+2enogw?=
 =?us-ascii?Q?+3gA2h+9kCPoPP/tXFuEv3uiiRfEiAfh9Wqb+A+Y8OQ5rGzVvztbbyn6i6xb?=
 =?us-ascii?Q?0rsoMHVMNvoOcQq4Wq+P0Q4GUIS7TcTR2aFjrQBtNPf5+7uRxbcQ0uj7gGdL?=
 =?us-ascii?Q?k7115QxShpThO9EQ9rK3Y/XqtDMOYBU83gtYBQ//dVLl8zYImW/XAqdDGgiI?=
 =?us-ascii?Q?+erEEKiMThxIxtuVRpizbzVH7NV8v9dsBkgCiOaOLw7FHC/AKQiVbsLV/2qm?=
 =?us-ascii?Q?zTKWb9fN84f803ZRGO+877LLBSPsyGRs0xePTLJwFWhfnTZyi8it+nQH82wr?=
 =?us-ascii?Q?usGa2wTTezMUhkvKoSZWyOIDN8jx5W05hSal?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8PvDRcoTrJNSLzh+MjShRk0F8PJ9I+O7olw5+AYsPyDhCGbZ6Mw1pMEH3Yzu?=
 =?us-ascii?Q?wQ2TwQFg44l6DMHpK/Qdn/KXywALW50uR4Tj6E9PumgzbxQ6Zk38xEXRb5FQ?=
 =?us-ascii?Q?hqRz4tlz/Y8GtG0RZG9MSYNaVtQzc7+jrWPpIZZL+XvjG7898OKdJNKCJqYy?=
 =?us-ascii?Q?g/Qh8ASFN0/hNWlkvCjI/rz/ZqiLsP7rfT7XzlTbYPkdkKJkIehTySP9sx2j?=
 =?us-ascii?Q?Lq0cXXD9JBsZy+uwspD27qmXAcR1jh+IV7GP3QPAzpFeZj6isjEwyDnggobw?=
 =?us-ascii?Q?BXpkSuNVgkubPexofJDftiVjJ5cgN0ltjdJP6s0HlZJ7zmMtn5w2yfUEV2YX?=
 =?us-ascii?Q?szxpzxt9unRKsmqM5cv3kArqR+AgD6Gsv/lQF7Ln1PiR+r1X6WZzOtfxm0nf?=
 =?us-ascii?Q?ly9+OERlMTY2BevbNasgcT0lr1ImYUw0NcW7GjvbG1/lEVfulr8k+hXr0qww?=
 =?us-ascii?Q?rPJBPNX2AqthsD9fDU+lM68x6TXZ4Rk8N4qyM3CQvps+fETFZpP0KFXh2EvU?=
 =?us-ascii?Q?Nr4HKuC7V0rSs3t9COura/whLZAWAJ/zvP3xMo1yUMIEKei54eXUjhE8hlC5?=
 =?us-ascii?Q?vZDUtwV/NqMaSsC8g6zfd0aWods8bjdJmXHBhhwtxNXnK+Afm41kZTBN5DcN?=
 =?us-ascii?Q?+03YwdCFI6dCj2fujN3SYsuAbIPKnG7vCLWlfYFW27BEVfKsW1H2zMqHUZQ+?=
 =?us-ascii?Q?upG+W8Wbi9f5aUhUybDT7F/tTp21hKai39iglpJ59Sh1jWNngejeJ0WJ9g5c?=
 =?us-ascii?Q?N33jNet+yprgugIfq2k6l6/DFuOISZrtV/mnb3KjqETF6sWN7rSwJxPeR0ip?=
 =?us-ascii?Q?kpwosypZdUMyQzIRSbRubuTUa7UGBrSvv451tIRGaTmA5tiyJ7BxCz/FsIIj?=
 =?us-ascii?Q?wiFalMhp6cHEiWTJ1C2cBh6f816MPAISb8E3M6VXNgzgG8OXvIO+OW2kgShA?=
 =?us-ascii?Q?iO0QMO9nYX2oYGh++WQbeJ0FhWk1TAXt2e4jpGbS84xukhwTIs6K6QWmaPVd?=
 =?us-ascii?Q?XAR4kWBblGAMHFe8dT2wH+qa0oTUgzgItNvq10Gq23fFFscpfyT5vmAtyKtA?=
 =?us-ascii?Q?mfAHGlwxZLnr41rpMXKcX6Xd9RGCGchKdAMcmIC3h6FO/cPDQAeLj8Ot+3wM?=
 =?us-ascii?Q?HpffmtcQ04RqrZuv1KbvxVqRhEJjsaWtHgDY/2Jdb6ridv5+t5QP5KJeXkHV?=
 =?us-ascii?Q?DmiENBCUoYid9wiLBQ6FfvggB0j+jp9B4UWGWDS5jaxLNd+qq5XZigJi+nTf?=
 =?us-ascii?Q?7xIdgMiV2RFp2Rc842NT1dvfINXR68aBDdSfPwz7k9jEArc3asd9JH318SWf?=
 =?us-ascii?Q?A7CJ7xWT0qOqfTFQLNG8bRF9/lFogzUan/JESojdVqPI2NaL4oOYpWcf0Jgl?=
 =?us-ascii?Q?GB0NPgQg2ykyGPkCYdZXpumABy5nHp9jNpt+MmlWMXu2rHDjpadMiN6sR9hb?=
 =?us-ascii?Q?Xuab4ZYCPLicvy9oPg414LKvNVmnRMe/SeHFxiqdyGdZW7HN4tz/hpJG9/02?=
 =?us-ascii?Q?aaK2RRhPLUPzQCfoOs8ytjQUiE7WUMNmumO+CxQL2ZhOlYFVo5NjRiuwMyaO?=
 =?us-ascii?Q?wSWLvLJmtqwQNDvaQSpxCQOPSasoS2cNsT81zToSln7RcreKK2g+PtmBoSD8?=
 =?us-ascii?Q?13tvuNj4T2tcws/xvxa2kS4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d223b3d-421b-4ecc-c121-08de1c81df7a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:42:06.2782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/UON0603j9H46isFdNFK0WvOo+YenCy7NXoTMfsd8FQoNC3maM6uUTbS28JxFiS0/yxL9Y8MrVQ08PmY5vZux/ux4/ru1FMRmfg8HaAe6y1hTNdMAq58BYfKe8VLsCu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Enable the vbus-supply and status properties for USB2 PHY0 and its
VBUS OTG regulator in the r9a09g056n48-rzv2n-evk device tree.

Enabling them ensures proper VBUS handling and reliable USB OTG
operation on the channel.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 066e66b5d51a..54ed7cb2d73b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -389,6 +389,11 @@ &usb2_phy0 {
 	pinctrl-0 = <&usb20_pins>;
 	pinctrl-names = "default";
 
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
 	status = "okay";
 };
 
-- 
2.43.0


