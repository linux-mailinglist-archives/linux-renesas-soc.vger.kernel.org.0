Return-Path: <linux-renesas-soc+bounces-30695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAkKD304zWmxawYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:23:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F0737CFB4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C7DD30B2322
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 15:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1B73F1655;
	Wed,  1 Apr 2026 15:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fw1YmYXc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBD4472790;
	Wed,  1 Apr 2026 15:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056616; cv=fail; b=kVThTZnSAqnWDEb5N1X5H1Os0nsPK4uTUTE8P1/B1EDfKIx/TcUqwCQYWiFGezzBZhLoUDOThbbGQ5XyAUC4DNq7GiYR3h4KMKBOKj/hZLHEs/aE7ehuyAf49qrmn4QYJaD+r2gEIGaONOvj3zYZR9/kguCfOitYLmmA4ulRHpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056616; c=relaxed/simple;
	bh=H70R3q+bgS8LpwfqGx8IbvRd95jJTPEXbmnPqqQ+SzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u8B6aG0D6tbZuNLJ4Wnex6frwhTsK79B3+K57pyH4ichyJoyznHpCFPKPgyNiRvOzethdHeb6PasdfGixLAls/hsGS/StlWoS/4b94anLj6WRjF8Zxl4kk6UuFD6YSWoGodXYEgBiQbZwkYgK0Z4qtO37G767F/P7mIY1BXO98M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fw1YmYXc; arc=fail smtp.client-ip=52.101.125.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emZlxGinu6yD3bxZMrXahI1jEqkpKIRY8ZAysfcFBNAdqBFk/+FrW1GuzFfH8hbF6vXcFOcetex6qDWdP4uhIEhvoxgyjlkUfU3f5GLsSeWjbWVJA6CzQ1TLsqgQn7MZZCNnPkY8rcmm46pVTCplxFU/DNYL8iumX9RsNY+nY7Ek463oBqkFSLKNzy4iTNat06F7hK/1PC59oepl/mwKUAOusA6ceS84i87QzVRDTB0PUMRI20ygLlWScGhTCGeK6YE/Qd4/7eBmxiLrR9CuZA1IoX+dDrw3332x8CSNTGnca5d/3JzzMMhY9MHddI7ji/lxnZ3Zs786Xa/plvQ1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qACIzYR4ekKzneVIuDHgBLU2m62ir9gRXkgNDPmKNUg=;
 b=kTeLIiNjGM+Yi5cReC+0AUB6UEGUIhyyyBWHcoaW/g+Id/GvWkj/Ai2mMKFK0q6vu2+4rQGLdERyTtZHSC2IV1nWJoZi7E7bx0Ig3z1iA9qGNgKN30timaaRy3KsaKwgBD6hw30trqbgS3LDdBdIFxhxVg9oxji6UVyCFiWqxy/7wawVU+6oHYeH7fhHrItc2Ac+iTVxi2RdGSD0umoFVSnZrV7UQCO/U1aEc4n8gnoTJ9//9o4XSX7LdPTgQQqcZbG9Rwaj6dQJYKVjPY16SuRX1juF9CROOphYpJo5MAeZVNfQ76j1mKRUb9Kjrx9l2crLyh7hkyyHlzFyQVTyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qACIzYR4ekKzneVIuDHgBLU2m62ir9gRXkgNDPmKNUg=;
 b=fw1YmYXcQxLw2WIziU2xg2Y7lcQeWJ2tjUVjCs5/8BQTgl0ugia2fyRgb11Voby/Uz2cTDekvi9PAPSKMLZiMFKhMu2UZ106Bui4VT4G12PFTje8k5XwR+LOTDNF5CZzOtW6kDGAVOQCe4URqJswqLEnV6udKCfMuR8NRSytPI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9993.jpnprd01.prod.outlook.com (2603:1096:604:1de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:16:52 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 15:16:51 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 2/5] dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property
Date: Wed,  1 Apr 2026 17:16:08 +0200
Message-ID: <aaf31185a5c193f9236673fb3c6bfdc19f4dd53d.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9993:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3f5770-3a55-4780-324f-08de9001b390
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Qyknf31/fodmChX0jTrgkSr3GbLfv+X6CnZhB2GiCW72HTY6t9zFMKdt4bL4GSbiacja42Jw8Xm5Ym+DigriVuY+AiOWY1m3QG4isAQt8xKrJyOBCYfhnaEfLa0QTXfqYNTSRFyA8fd2lh1i/6m4r1vnruKp/pr3zmHXSxVUKjiGBvBsgL++ggLNFqp+wn9ynKC1TEf7LMkaaVuzuT9uwSWVepUJwTCaLTUKyun7H0lh4PCmafabiZy+D6hHvHlamzKQ2Z4O/4Kj1/UwKBRRbobGl3RfY1e3nwHTpw5aJ7sGGxc3o5NIAU9yQl74anDcwbl6Hx4nBYqRyZ04awVCK4ZyM84ooRix4lHPW4O/a4CGPgptvRq00/20wE2YsvuxtCvXfuL+wF9cizQDk91wOWehWIaeur+TzNVClD/qgmgOeLSJ7Q9YNEeyBgYeTeq7u9LUEWQOGLQ+r4MI8gLbyiJQOJ93s06SPH8VDz1SVyqsOp7G3oWymcaUCAmnVyBQZbVfCsV6UtdXYajvu9r64BnCBpNxOp6YBQZ82UTbRLs9lF3KXEsPZyyDL4gon5CwwnQd0wUvIxJBe7TWuyl6AsjwLtUN+idDe3Bn4tCZfbu8JrOYdFNyIoeWkzlWt6OpPTf8bG8w8xtGez20C1fGIg0kP2mTD34R9r5ZNv5CF4ZUh/wNG50g28EMwpwcgODPmRkWN8NOWtHZ2a7I8uw60/tentXPeJSE0e/X6Y0pNfRCFqeN6S9NlBL6x/gKjhwQElgiUFOYo5iVG4zqRKIv0fctmbwHW1FfRhTA9/sOwKQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iRCLwaHNjZezR7xSjF2joi0Wt4Vg6e2+kz/Vtt9LXsLwFl0wCqlfWzOLTwvY?=
 =?us-ascii?Q?jPCoGPgm81e9fcJM7Dwe84DQ5xqakMNlz+SR8Cjp8Lssbgrs7Kg8GglGE/kp?=
 =?us-ascii?Q?HEdSns3S4/lARKXP86MLfYvZxfyLX1Q+78HZ2FSp9ZaaJmkLslI06UKz0DM0?=
 =?us-ascii?Q?+Pna7FI5FZFlIkL12chfhpUggbqFNhgQPkoLDnzs5IBplKMz+E85x+KXL79h?=
 =?us-ascii?Q?K7IpHSvySLE8aSs68snADnjm0tgHsXGySGj7l+nVpwCVNVjjppU5UKa1ag6m?=
 =?us-ascii?Q?xwrtpcHniQSUC6wENxv/Qqq6anp2l3/wgMCWyd1Tw4Ji6rhy1ZeqWqU6u9UG?=
 =?us-ascii?Q?ZHwu6/tzBOaUZfAFskTxbiUHbxpIcm4+QsMVMeFEuICdbTdYiiVUP2QJUyMS?=
 =?us-ascii?Q?h4O55maWINCOoFab3RGA0uSFsmM5/fQtrW8EFdTFM6UMU2CRfQg3ORP5ojs1?=
 =?us-ascii?Q?w7HYz2CPXtPqLnKtEF8UIHYfFZ+3sKh0xvbsJJz7lsh6UdmHOjE48RJXW04m?=
 =?us-ascii?Q?PTwMJzIywEz0CtftNLy7PrnEdLXqw7fIXCBEHZmVvXGi6IdrKC+B6gsTEJM2?=
 =?us-ascii?Q?HnxPaOyftR/2aZ6+RYIRnu07vNFGdTW5NqFXcJh/e5K3+CrgfNVX3ms7y+oi?=
 =?us-ascii?Q?Qq/EeXY6OiRfG3Voxa9G46bIaf4Wr6aXP5TxBqWZ54zW1A+T5/ELgGNhCoV4?=
 =?us-ascii?Q?CIEn7mg4JBTwN6yU1TiN20xyHrYiEMLr9kVwExSu46f78qhmmI0uTMcRG/ox?=
 =?us-ascii?Q?XkFd11E6c8XfF9UdThgU0effgh8L1zUl3mSyJuFEDCHUrJnyAmPPpFzZMGEn?=
 =?us-ascii?Q?lWsHNJTF+FSVQgQoLGVHJxbnO2KSbhpiCPcxzC8vKe0JIOvDlEhRj7M/AG54?=
 =?us-ascii?Q?GOpXgH2R1sjfanwHXfuDfTZL3Cyet3PpLGzaaU5mFa4GNhANqtuODIAhxCZn?=
 =?us-ascii?Q?FQYhDLP0tpLJroq4OxQkmejQHSgM8XTi0kIJNlKb/JvmVYqvE4VV1XHdTKpy?=
 =?us-ascii?Q?4++b1y5Xkc+eojAJiA67vpFsY1/T76xMd7kovOX3hnLp8DO8NSHqJNGEPnvG?=
 =?us-ascii?Q?P3EKEyJ/pdsnwgrwTCWQH5uOBQdoDKDT8zZ+JKmrLkMSkgC6m0yZ1pc4iJus?=
 =?us-ascii?Q?yMBCcckj/fgYlafElADUld0oAFSJD+EjIwlVexS5JU97dG741ncmX9q9FsnA?=
 =?us-ascii?Q?3NkeJ89P+1WOd0fXs72DK1t/GerB4rJtupB2LyFRTCuPDQiDov14yGcUpqk7?=
 =?us-ascii?Q?EHBN0d75rGS29+Mex7NLOHF8dEsGTQWY5TyyGKVKLAEEegEnHYnEdtF4PuFt?=
 =?us-ascii?Q?Kmw83Pchu49S4D6rDY2Rd1zQTHhOGgLq83R25YUQE1iGZBO9VJWVukOlhNQ5?=
 =?us-ascii?Q?JnFSkNadTSlHlgnip/DeAUSBVY8tA+0m3ZtXNbHupogzqCGs778Uwfn9rj7E?=
 =?us-ascii?Q?qeX6qYjOTuR+bzHlwhcpMgkorT0EDCp2qL7yBIXMMVbwjXMmxMV2fDDYFRu8?=
 =?us-ascii?Q?17cbOkyVND6/jrc7DpE4rsrRLpQlzmN7MiGvbJEf5cORlcXqtMw6N5hOkiXv?=
 =?us-ascii?Q?UuX0Ri0vx0AJKSEWktBbAQuNZ9e0xYPgjvJCncaJSfPv6BAlErMOfmdsi2W8?=
 =?us-ascii?Q?fHnrCxBxcq0fQ8x/yEQE9F8cuHlJ0SPFxzQ5pB1sByapn9Qt9j+06jKONScq?=
 =?us-ascii?Q?gezrOZ5oH5t9KlhvkXZ1copsIWICcRZ3nrhiub9ccbWEpX5AN1sas4Oj9GD0?=
 =?us-ascii?Q?qKDD8PPo/zTVWNnrO/1dqPi/9bGS9BS43V6GApr0T3KSo5Rc77Sz?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3f5770-3a55-4780-324f-08de9001b390
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:16:51.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0TEoTnYJ7BHQYW058AjJbV4d/E/+8qGLZ4uSzPVJrKnPduUYF9kYJyW4DJufoy9cbti6nY9EuUwD5mEXhUry/Hnicq3kNL4lMSs+EmTBX8LebrJuLQr8dzMqZcMiO01
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9993
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30695-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,arndb.de,linaro.org,solid-run.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,renesas.com:email]
X-Rspamd-Queue-Id: C6F0737CFB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the '#mux-state-cells' property to support describing the USB VBUS_SEL
multiplexer as a mux-controller in the Renesas RZ/V2H(P) USB2PHY binding.

The mux-controller cannot be integrated into the parent USB2PHY node
because the VBUS source selector is part of a separate hardware block,
not the USB2PHY block itself.

This is required to properly configure USB PHY power selection on
RZ/V2H(P) and RZ/G3E SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v9->v10:
 - No changes

v8->v9:
 - No changes

v7->v8:
 - No changes

v6->v7:
 - No changes

v5->v6:
 - Collected KKrzysztof tag

v4->v5:
 - No changes

v3->v4:
 - Switch back to v2 implementation.
 - Improve commit body.

v2->v3:
 - Manipulate mux-controller as an internal node.
 - Improved commit body.

v1->v2:
 - New patch

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index c1b800a10b53..7ed0980b9ee1 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -37,6 +37,9 @@ properties:
   '#reset-cells':
     const: 0
 
+  '#mux-state-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -44,6 +47,7 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
+  - '#mux-state-cells'
 
 additionalProperties: false
 
@@ -58,4 +62,5 @@ examples:
         resets = <&cpg 0xaf>;
         power-domains = <&cpg>;
         #reset-cells = <0>;
+        #mux-state-cells = <1>;
     };
-- 
2.43.0


