Return-Path: <linux-renesas-soc+bounces-30945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YVgVNLol1WnB1gcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:41:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC3E3B12EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4882630A3548
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 15:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0577B3C2788;
	Tue,  7 Apr 2026 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vgS96QEZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865FB3A5450;
	Tue,  7 Apr 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576141; cv=fail; b=Nx3lTJXXiGkhatio5P66OlIEwMHMNXzuAujRERQaHh+QkmywIa0SscFwWFaXOvsdXc8ug2gJj5Hs3HlJHQqz1LZJCKXsZbq7fzpZKs4BW8rWnYBQd95wqa4JXGuM7yrQnkYEWW7GzStd8bdLkdMc2IIJwSFnevYmzjQCFXPGdGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576141; c=relaxed/simple;
	bh=8a6Z2FEsNuGkiQzDYH2w4O9kyuYNJEQu4aIgFkqaHTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VmZcY7Ax3Ouxx8LgKForOtxfbJRRXaHIreHiOKAYJIrB7RjyrJbsbJxV/3RUClb7Vkyi/So3QBEOiEP5h9/h0GJS6T2G4vlR/GumSj8jUWyIzEtHw7RCBLgRSUX4cqe+VCDQoVnLPnpJZsXHAJ+z8WGhHJzxeIf/sw84r+pFiQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vgS96QEZ; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMOaZkaGSB7Tkb2wOuboHfGnNS6rBoM5gmWtPMhw8qdB+gY6/y98Fg+ihtzH1rgeyJHCEpxyL7xX4imA9ThBH6Yf79ncUpR7Maj8yXbO9OapjJ+4l2yagvWZOEhzYZ7Tbj2kl4HhrRU4CDrI5q1JHy8XeWNAZDeaubIThpyKrGOBl7F5Wi/xrVmtvUdyJAiOcqIVvJSv+VbOZ6xZBfNNgA2JliH2lTz+6PkAG2GuoUU+YpGtEXpWLiohsC8X2B0fnKlOjyeuZvzvWOQ3+TfBW9PPojppsyewaSx6myr04XIu3h+vOZptdax4IPK1itkIzbBxCPwx1asnm0SS2FVSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgKuc/zQeX88azUfnfyOcE0Koo7qf8sfynnNwVQUOmo=;
 b=lROIoLuG31ZkgG7hNwgdXnfkp2I5p4xsnXy4Hqf9FgjzPFF9UIqlJvWujhewcVm8nwEXUlHgTGliRX4zL8/XP/5duEON78bwnEzAMxlSE7G+W+WrJiHSPh6NRSBJXanmWsYXy7MqWbc3iiRBcRDgSPHReJ8ymJB8iAFLZb5FSgsphAP5rZVLvEKN8bydMBDpW9a3LFYFNaQv7CmnzSRg7eMpWz8JbDKXsc13n3X0XQqSbs979ltNr1Zw1Y2VU7Xm6zTs40XYw+BCZsILIVvsBKb/DGRo/6G4+nRalRGOxM7AlnwiESNV459Ao/TF69RjMVXw3tLFm7fOOSfVDVp/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgKuc/zQeX88azUfnfyOcE0Koo7qf8sfynnNwVQUOmo=;
 b=vgS96QEZYhEjI9Poce+uC32eQIOuT9HEdDf/953jvY5o/Ni7a7QS39lb/DxcNZKnrrjFk2mENqoiey7Nfw6TMezrQENJrj4odeQdgjmf/n0j2Hd06pQNyhIfRxLj6lD0xvQAasj6hFkM2cregzCi8ut/D6IOhy90e2B53O/D9c4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB11104.jpnprd01.prod.outlook.com (2603:1096:400:3f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 15:35:22 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Tue, 7 Apr 2026
 15:35:22 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst
Date: Tue,  7 Apr 2026 17:34:29 +0200
Message-ID: <31210e05f7189b466b30eedbdda3d11726dac279.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB11104:EE_
X-MS-Office365-Filtering-Correlation-Id: d81b2429-fb1c-443e-c403-08de94bb4816
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|18002099003|38350700014|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/9Rmu4Lwp6liHz06/Wsjl0IqUwvGaHgLEfet7SUfTuG3y7DE1ez/Ygfgm7aDDGIcYPT9CZ0bGfCoSfrDqDvvrbhdF/IdeGvPPTrPeS/5jMD2gg1ERTol8+NMcrB1K5Mbuv5+FQ8czMCmdDl9YwE169HU2JPifuMix6/fJTcIAw0arGJ3jzl9F6dZIIHnjZNbh/DHISGmwW2xQe8qVARFLFcclLgb5Fey3YBvNjLD1TWRYvxHBRcsa+kBbMQijHFPK3d4TvTonNw3oIZ4kv2/cjDORh3+0+AImMq/+yhXW7kvSUjGpXydlDTX7SpDqC10OmYMjJDuoDnScRJyByLjdNsUPsBqCsI5bYCDZRznVAw6ZwaZJK+pY8cUnjuRzBXfYRDYbbJY5V5a+xInkfQlySDY+LGi2PeBymMhe+OtLu6RF5jy7868GhA97UlNUFOTBGP15nPsfl4aVF/t5hkvMlNH7ol6pS8+5MWunJkSo9i8SoMtlfADzrubygewyxW8PVEDpM59h/L678/Se02PfJKyguDJ4l0yV8Mkv8ZK8VKQX+1k9TRZePRpdZcjzR0/BmFpFhEoEORTZhGXP9bz9HOITau796NwSxdLWrgrKWX44GWdEjeabpMQWEZDly4XsNoqqEFz4vFAqGWpDmOCHf7SBKKxhR889VdQb7yBNIprh3l1heWH/OmqzkeRTUiBJ0qwMsO2QN9WqWWGCVAG+pujea4KXlfRHhZ7+jHR5WHh8fY54DopP2vRi4TzUtwYcz+Hb9NdMskrzCq/z4WdOMiksd4T+2qslQMOMgSPgdU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(18002099003)(38350700014)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YlwNpHvgJVju5YqI/nNtb6Sc9on3/9Tyd2QIDIgHZWnbuB7bQtBe+ENimsx8?=
 =?us-ascii?Q?sTdplsy2PptdnR1ZOHq2cmm4VuyyIS0sKyOu8QsJY6/eMU/o60X7vlliA7cO?=
 =?us-ascii?Q?/6QMcF+TNK4lgDXnfOdklhD2NFMROaBzH4xgr8TUz5FBzWF8USUx8sqs5RHG?=
 =?us-ascii?Q?4FsIIqgg/dcwm83Rj/mHnew7HmEM/l9JOtWbxPajODupiF4ThJSlzvn8NTlK?=
 =?us-ascii?Q?SS20G3XimTJrp2rpb42i4WRl+5mHrdyyRqvqv+xDF3IR1y3fwMpMbb369MF+?=
 =?us-ascii?Q?wxK0y5VMq0hB7zy3jpySplb74bG/aZuAlYtO7qB2zgF3/EmEWeQJo8QhdFIB?=
 =?us-ascii?Q?Qg0LxQHbSF9kCWEul/vImMidJEMSIgCIWHsKs6a41U8shYZO/N3YWEv2FLv4?=
 =?us-ascii?Q?PAhpFuhC3vhxcJUHauU7sCMxme+x91iiRYBtUe1N/PM1eYl+eITIv4OJF+Ar?=
 =?us-ascii?Q?e8+F4S0rUkU0C1Ym0NcKvaFuSLTRN/xTijn0d6iROWgpAanLDSWCOUxTQrOZ?=
 =?us-ascii?Q?WU35CmatJqxnjaJ8RuCYFjLD7TBbuCwXNaGCrxH1wZTIaIEbATu+PUV/V9HR?=
 =?us-ascii?Q?8U4IRH21cGQkSupnv5nJmc3DaCCKce6hxK4zSoX5mQTl+Sr4RBaFVe/EdSNb?=
 =?us-ascii?Q?2tpwnxeMtq2OORUkN5hh4Zh0piO+xEuzD1aVPwBAEACwTFwy5YRQvx/iHU1T?=
 =?us-ascii?Q?OZTVGKbhSK5N28vSVnFu2mul33WI3lWMLCbm/+/+qBXYYoY5KAj8dcM8u4T3?=
 =?us-ascii?Q?FthY/Q82mA2x3k0eVOwWwjvSxQPfat5X2SvRoF7A06NOB+mfe8p0ZBpj5Ywu?=
 =?us-ascii?Q?yk5WuXtw9pOq58v2OUrIZxWSKg+ePS5cIcCMs68i/T68XqF1MuUfSewb9qkv?=
 =?us-ascii?Q?Cww1/F02N1ms/AWdteaosE3NoOb6xD0GL/Q/FWsxrxFqhLzaJR9rIWJN7F7V?=
 =?us-ascii?Q?eH5Q+jaK/DpxLBqJYK4E4adfDUwAbo8kTXF+g6JGR4+f3iCi1MIqXr7Uxehs?=
 =?us-ascii?Q?socqMkxjqmXblyU02ku8vHAb8PNA1U2VjpFoakTGz2ROL856wXE1CJAAd3vD?=
 =?us-ascii?Q?Xh29sPZjrtAU9Et27RPcw/0bR5cwxZIfhTb1m7cmjyrpDrrTP6SrHdczZoY2?=
 =?us-ascii?Q?WfqFVbuVHj5FupZK7sjyOXCf86MNCVMczVUytinRdCsDWjbr7TPsWiwV3VXr?=
 =?us-ascii?Q?qII4/XrHL821MDmFqCmMAA7gxPvx6qHlwp8NrLce6xwsEhDrE9fplnJwMU67?=
 =?us-ascii?Q?tNes5T08AnYioE8kk/khcGA5XIknPnTj6A8bfh9+Y3kgH7d43qlkrupwalJv?=
 =?us-ascii?Q?3p4rV/JEfQVqTOYpqzZCKyBmwJfQ08gUxUPusOwmn8vL/3SmI+5hIsE6sClA?=
 =?us-ascii?Q?FkcpROaTDgSJo9Lw6Z4cO62uCWlN4cT7BIr+UUO0ufjlJYgy0Nhrn4OJCtym?=
 =?us-ascii?Q?CyQDH9prKyt9BoSMv3xDwU5CZ0qru/zFza9fE0N2+cb3OiTXgi06ngBwOkeK?=
 =?us-ascii?Q?C3MGUdE4O6XkfL/M8SKcKzTXD7CwiFCPBsCBvqxT0O0/pbzg/z38KdUUJWEG?=
 =?us-ascii?Q?HNkzSKt77+NAboqGbZYk5s3BTrooXXGMWuaFrKVi8466jRfUhvZf98tLu3H4?=
 =?us-ascii?Q?Wl1ikm9NigS6KIfezNfKsF011J9jsf1LuhnNMEwx265Lcr8vByt6LD1ueNO2?=
 =?us-ascii?Q?B3aLFJ5M4lmCGe2P/la8rbQ71OcbJI5LCsKfux0HM8LDv/AwINOJnBAhZA9g?=
 =?us-ascii?Q?XtqZEG/lXqzOKVSmsXPo3k/0/hWAc/IM2tfTlWQNGeYT8D6cZqEm?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81b2429-fb1c-443e-c403-08de94bb4816
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 15:35:22.3457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpIdcuN6wIGYXlZ9G8ODoj1z9HALFvlJUBnIDd0UG8Zf5bOPgQ2oG9kF7WDslWJfGnuGm0pq3YrTI9dHQwzT01w15+LHJcxo1nPUpEaua8O710VEleLAUtB56S54OtcH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11104
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
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30945-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.241.139.240:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 6FC3E3B12EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells
as a required property. Add it to the usb20phyrst node to fix the
following warnings:

"arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"

Fixes: 6a1b6f7e56dc ("dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 40525470194e..7ccddd6a4a9a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -1327,6 +1327,7 @@ usb20phyrst: usb20phy-reset@15830000 {
 			resets = <&cpg 0xaf>;
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
+			#mux-state-cells = <1>;
 			status = "disabled";
 		};
 
-- 
2.43.0


