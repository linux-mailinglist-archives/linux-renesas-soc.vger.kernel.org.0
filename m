Return-Path: <linux-renesas-soc+bounces-24161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA85C3685B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA3CD1893218
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB370330B08;
	Wed,  5 Nov 2025 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="r1bFd99Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7F3218B8;
	Wed,  5 Nov 2025 15:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357262; cv=fail; b=lv9/7frZKm8OiCZmcjutWMekLzMlwgupKfO8/0ivTL4xveK9+lCEWe66pHO2av4sDPrSTZm82/Xc3o+KdZhJuNKO/IDz9XUtlnpB5NrEtr+e5hsSwzmz8FGAVVkxalPpPi0u2KlvUTntZ0DCuqsO+PlXCw6N3z7LLH5LN7KBm8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357262; c=relaxed/simple;
	bh=YIjYyqLqa6qYiZP2fAwzb5M+/gsSq/EhfRlyFkZa3n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tUZk9U5iya1EKG1SrBavWLMAdsrvUtX1tqm8Vd//o6imY8mgrssr8TRB0kESbPhpzq2iP56ABz6Z9pXIs/ptsHHjYzv+J5g+KyzsSIRtxGBZeelYV3yToDOOWh/0g+PZHlnqfP/8f0upairGN7hWmOLKM22+D7su/5gW5DzWNiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=r1bFd99Y; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRCRQDsbaEsSr5a96hgmJCNODzWxF8brD/Volln7X2+l7hdgEwbL0KAUQAGVw3cQN8TThDrLOUdRafnVZjUfNgGsk0jSvXWUF4g5e0+Cb+y0fflRP9pCwpC8Iyho0A6vSvtjBBUECR/gcON/hObD10YM4gald4JuQqahkusBlNL48oEkBl9Aav2Imncfl/tFgRX4lzwpBKOl+P3W1XZ8ExqzfnScxBqYRvzGZf68Mubcc5k7sMyGwD+2ZKLnDmWSMiVfEot21sizVpZ8VKKeRed18EWd9czspUV/5Jg120ySN5TZAqS6SAVUs07ZN6LkCMV/J5WF5D8aSWBtleMVlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjmPla3JraknYgQTH5j4lW647gaSfPO05/b/xugPdr4=;
 b=aQwvp1X6wnb7n5x5TdAgWw2z4W03uppJuZgwLmey/5aH4otWJrgDVCxG30dn6SDwUScz17Io5RGFXOXek/fWrZ8wRsw2Bhhe+iKtN5RT2QARv4UTYbjdQKHA+ocdoMZ52C8pE5aLYN+Oh47GI2vA+1vd5SdgJvGfFE8yIW8ChDqSCfdFnICxC4RaFmNhdtuoINHf4cTjJJVDjK6looGFGTGqs9KRWNJ17mSDgNeib47i6R5yQEeMLuZTcjHAzZHhAtDb9IOI4GDCw0oLHzwn8bYo9dFumJBRzo/TJVLseS4ygbmZOFTjSQdp2etq+DaNj7bIjWwYEsKLhj7lR3LlRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjmPla3JraknYgQTH5j4lW647gaSfPO05/b/xugPdr4=;
 b=r1bFd99Y9aIkpYb3PDNtbNx9RxPxMPgahMpPqFtbjHdGvSAEuI5oFdDrG5fUnHZvAjE1l+nNX0tRgrdyfV2Xj6PA/xrY840j6Kle8Puufq9Kbu03YXoNBU3Y+KYsl7FHDQxsYl2T5okAfJV0F/BqYbgqxW7OS5Ko1PvfnL2RUUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9329.jpnprd01.prod.outlook.com (2603:1096:604:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 15:40:58 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:40:58 +0000
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
Subject: [PATCH v2 08/21] dt-bindings: phy: renesas,usb2-phy: Document mux-states property
Date: Wed,  5 Nov 2025 16:39:04 +0100
Message-ID: <2d279041572809680ba295ca3f12f03f11e598f4.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: 179a05cd-6ce4-4dd4-19c6-08de1c81b700
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g/AxnVPP8Jg1DPgWBe+S6tYInbMy+q/hyP4LQNjKpw0ACqEc3mqnRYkt/6Wx?=
 =?us-ascii?Q?NbSZGXbAZ7dBm5PBwcsi2IRA6IO43IpQFw0MtncjZUjkXPwGLsopfjb2NM9U?=
 =?us-ascii?Q?7h+hlLrcb5acj2vlZeM920gi3RY5t18Vq5wOBNgfULm7I50pLTD0peOlMQ8Y?=
 =?us-ascii?Q?Fy3Ph9+gICFLc7GsWsMmP64/tvYux5wqokNhQ82ZfoU4jIkQajua2nmcxAaA?=
 =?us-ascii?Q?Yw4b6DL4WGjL5fZdcyXDlqUHdlo2Btkj4iDwqr4onUuBz6ZnFa+eB2g9Z9FO?=
 =?us-ascii?Q?UBlzsvyg1gwdY6yfHSJwgPxRvSjkY7EwgC8ZSxtUtwwiirWebe5IEfkiYiui?=
 =?us-ascii?Q?Pmn/gqHweIBQ6COzYWm/uFiguJCW7vG5gT4eJVsH+jD8hAFIKb+BW4IXGFpu?=
 =?us-ascii?Q?Bvx2IYsG6GV5Ry0vGJ6LVSncFmHW9lXzkmfx/bhZsnJk1pR7+KabcRY18V3i?=
 =?us-ascii?Q?VHMiy5LuphGpDa/BLhiP+N4ZppykdzOmYOE3Qwsato9oBO/JrItppsxs7y7v?=
 =?us-ascii?Q?4Xi3oMB95QhxioHbEgQ0tS/pKgnXf2JVtotM7jC+IkO2E1mutKr+T8dNlje5?=
 =?us-ascii?Q?pUifDbQYARdRXxinuq8ZmDxgqSa5/8m4yjzHKPf3Pcf8QfcYG5E3lR3e5Nuf?=
 =?us-ascii?Q?Jfx7QkjWu9lTNYSYkzCsB3g8Y44gSmhpkDh/HVFndUrl0TAu08yreh18ULtK?=
 =?us-ascii?Q?UcKUsemN/Ito3GqND9+z/9o0RnXG93Ybo6T4nN6NxoxLvRgIFvBXy+4lmz90?=
 =?us-ascii?Q?RvnUlfIwqtWlrdkbPlhLQJ4VNGhujbAAydfiJyvhisRIClff8EzohqIO0OIc?=
 =?us-ascii?Q?WCStvCBjdds/m2ga5CjZHpXkZku/EPNKR5DgW7Gr+SbBFl/gpRsj7FG7d1To?=
 =?us-ascii?Q?cNXsKtNq5K511QVGN2aTfBUM4loyVNP7+XRXgbi1ie0NpO5LZapbjesjrmX2?=
 =?us-ascii?Q?CXTVaoENxFTgPVp9tnNLY0QewP31dH1ZRAfbIKSdlOYnH/vS9bsQomcfUup7?=
 =?us-ascii?Q?RXxZBsuMJa5HaDXY16gKHIrzeo22QbGskauTA5/sX6P0ZCxOCVb3TlimFq2c?=
 =?us-ascii?Q?IPGXLD1SU+HZOlTla2TVDDsT8fMuotH4DUPuT3/z1T7nSEK5mF59dH3HG1Y+?=
 =?us-ascii?Q?NMXxLeoSoJyGleQIHaq6IQBI9T9OBugwjNPNUaY+TAOAESBWfvOG3whV7Y0b?=
 =?us-ascii?Q?NgZprxi6xLjadBQ0LkWAOIPW7PqY7kyPMuARbE34Spm0xKoTIHSnfx8/J43z?=
 =?us-ascii?Q?SFVeZIkt6S4UWwPqdNaDdwXoCIiROw62jqpqyWc0FyiznduEtJ6q8PLfurPB?=
 =?us-ascii?Q?Yk9grgJ1rPHQYK7EGrW4igegehrOLvMD30R6Tl9D8U+yfOZ+Lyv+BHPEnhWU?=
 =?us-ascii?Q?oAevbkUVQNiyn+vhyfq5c9Sb423gCnsoIO4aKriacTvtanVB5NSiQWalLh1B?=
 =?us-ascii?Q?AuG7LkCHA121B77FYfAH38tNz4A+/4Zw/OpuUqzemtVj6FNGN5I2Ldx/4+DT?=
 =?us-ascii?Q?wBD7XSkise8Jt9ueVaVoobvhk5ML/m393NB4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?81+k5nDHnh8pHsWLNmfEwBxM/EKHXTU9fRG8gthsbweVl7IE7NdNVjzBCBOs?=
 =?us-ascii?Q?/3Yt5S0qhnUgCgcClJVTzSH8VwRCs8k3tMGaKifXu7+v+UjoyKM5FAEBFtES?=
 =?us-ascii?Q?cceS5/ZQNRqPj6D/ZucSstlbvyrFmx5EkoUePZP3uleiAbLqapGqG9k/Ysyf?=
 =?us-ascii?Q?Lx/U8XuaDrPLcs63uV0B+Jw/UkuOGjnoceK7EeKBQqx7g5wo/sZ/nto0NDgw?=
 =?us-ascii?Q?NLo4wU924MONkxqNE7GHZ1cbLidmf4pShorb3ouq/VDMHrBrgp8TqQ9xguar?=
 =?us-ascii?Q?8IwgtFx+SlPJB9Tl7mM8m4JDh0JKGOXQ3/jB2RNB/xwgCekYTfgVil9b0EX1?=
 =?us-ascii?Q?Ihhap5WTC138GMbIs0zoqI4gOGFNq0gDYpGinWcaM+on92cvbzuwPSsNqTtM?=
 =?us-ascii?Q?+QpEi8IOnt+HylgwREgDj2bkU5+AashiqOylsnCwn3MuDQ0Q2FPwW14RJ/4R?=
 =?us-ascii?Q?7s9wZ/7Tyae76ab/vLUXNAh2pP0v6NDn6R8nmju7zeXPuEKZk+C8JKffTktV?=
 =?us-ascii?Q?Y16EPyS7CcgHo+bcW0Cdin0rdk/1+TWsNanOMF7f+CFZ09yfWFzQii/1TMOc?=
 =?us-ascii?Q?oEw5Nz5VqE6x4wm0BLo/7MRBq7gH5KwTFrXJEIdUYT5QEhuh8avSY6TbOaKw?=
 =?us-ascii?Q?b644QwpWue2jgneC8GvOJdV3KCEXWCkBceJmMEna4lDKDzVnU5bgV29BCA4P?=
 =?us-ascii?Q?ADXO10jPHesZVL7BbWs8piptQI1Gh3AhUMTmgYGrr/CDxic/ESBpOJ7g0HVS?=
 =?us-ascii?Q?CEqmCgY1x0Qi8npAKd0YONsgAuTv5guqBmNZ7s+3mYurtHDgXVcHofTYmlQu?=
 =?us-ascii?Q?x7HMmPHqdGvWzG+SaLfDyaOsRUcAxUa7/C5Yu4TIjYB1i6O9+MsgQSpEaXPw?=
 =?us-ascii?Q?+iTRexphpM4YeSykEnng2gBQzTgfyRHy6+LlDnqV1DDnTWn28LfqQHx8HR9f?=
 =?us-ascii?Q?pKn5fRwuyxhEdfhzGRRN/RMsAW0gCe/BYlwso1vPQHSwLY6WOeXSxC9v6Bwg?=
 =?us-ascii?Q?L6IbcQavFU66uH/APuLkOKEf5utwdOJK8/O+VY+iC0+gJTzt/+ghJbU/HIZt?=
 =?us-ascii?Q?1VPE0lSHFsB2iQ1fD4J3HM+m2KuPnGDzgEFOSkJGg8ewlIbojvD+ZmlBCDjD?=
 =?us-ascii?Q?bOrvDPYj/EmF51iig7YYAkJQLmKvLycHXBEI8TWm5kJXWECTGT1ByTDm/6Tx?=
 =?us-ascii?Q?KE8GL+yJDjG8qGNjZaRlIo1fiKtzikVuhN7Vxuoxs36k8dPygr5u/I+cgRYu?=
 =?us-ascii?Q?biwoELKJUHJEawIJGf5tkndVSA67WYpNRyDeEG38D+Fka2c5VGYGHCV6vn3X?=
 =?us-ascii?Q?Q2pqhsWZ7EGkfutq2YfebO6Pg17cTrcnMHn/jONoffGRj5e49dPiBU+L3DCe?=
 =?us-ascii?Q?7x2Bo5pB5KIWPKJEb+/l7K/K/wEPtjX0YQPUnlN6T4NefrklmP1hetaL7uYf?=
 =?us-ascii?Q?CTEKrW6MPVfSCFvluS2bns24UNx6bV+d1xgjY70n51ocRqENg63mUtgsaSDx?=
 =?us-ascii?Q?hDe08V24nJ9RMEmivqSGkD0jJwc2DQtGQSFf/+AbeSTXaMjQnf3WrC+inaTW?=
 =?us-ascii?Q?PtXLvBQQ7jld1DhMR93SRq9jZHQ7wx42PhMb0Qdx8FSoygsR/YTt0DV3rEWM?=
 =?us-ascii?Q?xdZsqKFsBsQVrLmMuqUiEE4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179a05cd-6ce4-4dd4-19c6-08de1c81b700
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:40:58.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBCoVgRlxMsz9SwOGpEUU/1ZaqLNLnE2PPDtIEYJrCMZrqYDQDvSKf1ha6vUEFf07yZStPr4sv/EoM8oB/pAUlnmfCdgal+rCVZSJ3DZaItm7sAKlfUZv7VidXzAEve/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9329

Some Renesas SoCs, such as RZ/G3E, provide a USB2.0 OTG PHY with
configurable VBUS control through a multiplexed hardware register.
This register allows selecting the VBUS source via a mux control
line exposed by the PHY.

To represent this hardware configuration, support the standard
`mux-states` property in the Renesas USB2 PHY binding.
This allows the DeviceTree to model the VBUS selection as a mux,
consistent with generic binding conventions.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2cd0efa75f81..899a20797bb8 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -102,6 +102,12 @@ properties:
 
   dr_mode: true
 
+  mux-states:
+    description:
+      phandle to a mux controller node that controls the VBUSEN signal
+      for USB VBUS.
+    maxItems: 1
+
 if:
   properties:
     compatible:
-- 
2.43.0


