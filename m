Return-Path: <linux-renesas-soc+bounces-24171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F47C366E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7AE4F34F52A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7D5333731;
	Wed,  5 Nov 2025 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="j776UvFC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011015.outbound.protection.outlook.com [40.107.74.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5A322DD1;
	Wed,  5 Nov 2025 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357337; cv=fail; b=jT1CpqaxkWXr99zZVmAx8uwHlDR0rJIUPWCT29W8A9eV7dyVA7rjMMfbnMGtQb02aFswl46pbJGBhZdslKzrK2vdcXKhCOEIN6sjfh5werLqnpuOysZEax7WAau63XNIukKFYSZDFedsxq0zwGxMP9+U2cKL6X2sqAskzpipnqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357337; c=relaxed/simple;
	bh=D/4gKzalwG5EI095AaSikXytKWjgFd0Ky4VgYPO1B10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e4Xwm9Y0eFOqnsGEkK0tHFVLCF4N1RkKeYX8Uq855Q+YcIZe1Wot3DdthS1NMsZSa+vULG7O0pwk1eUAvghZMFwdnWXmoWz1SLKvQoK1Ypi4dGaYlQjp4XRuvykBHqiFXYWuCqcaltLHHbOiB4Wk0XeAReDZmI0/PeX1TBzuZAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=j776UvFC; arc=fail smtp.client-ip=40.107.74.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCIrNNtCW2gY955Z5qYdPy2H97lgsAb3CHJPIuKzP9S2fWz02dZ9SVvuJOl87cvxzXTIdhna5tetUhHFLCxUhfNVxqlNFmQqFaH0Cfgiu903BiJn44A+9fbzOOY+TMERyGhdGgz+SYnHVQBGFgmmoDVkrl2XIIs22ww4ALoH2PXyn7DNBpYNRSrTZm22jHAZg0tHlWQcgM5gz0gOfsyrkhn+VeoahS7Csau6Tv9i70/M7ixfyFY9vsOQ1jd7LI6rdXwGQHVcWlcsNrUKFvI0ATYsNmeQU/vIYzd7ImeLH5UBMuC+kk9GhQqDpACOTEILzPwdobwRFNWwjpywBJcNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPIu2B8K5DXJkhQKl+wor2m0mxJL7OZ+4bkYwK3sSAY=;
 b=RlhhIVhv+MTtL0e07CeIH2mqqE3QPCLtobXC0Q2fMSPBdpeG/hD0xObz/jYg6adaXazT3NQb201Wm2Kg/e6quk7YKs7yZHtnyyN2Sw+Wi1cV4HAWOlwa3wMi3KD+b/ffz8q8K/CQtjD4z6UEFr2yovP7OX7luVRG6jtEPWOMN41L0oJZuU0ARXuHpCcjd4/2mgvRZNt2joNj+1ATVUXApxcvfGchPMWh/ZTEwekCTpZ5n+G8/Z1iB9V0Wse+cyXkcg/v78IUHM+cRuGm3RjTQFeDCDwyK6t3oCnetDZeG/j7dh8gdHfii08HcNYhzvJr63KYSjvDBYlF9zTG3HE+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPIu2B8K5DXJkhQKl+wor2m0mxJL7OZ+4bkYwK3sSAY=;
 b=j776UvFCIExDzRWM5w/C6Fnjohse8a7xfsA56B3N9n6SUeolBChmDS21dzzRhJY5dgpOnunoiCO1ZajEqgK/1wIjHySFXjyyRNu0GC3gvexxvwDlz8FLaafK+cdk/4aNgCks1CyGBvqcA4x+mYDFcIr2zu/bxRMmQOUDGaF7S40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:42:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:42:13 +0000
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
Subject: [PATCH v2 18/21] arm64: dts: renesas: r9a09g057: Add USB2.0 PHY VBUS internal regulator node
Date: Wed,  5 Nov 2025 16:39:14 +0100
Message-ID: <78808a8eb60f25a1987dd786800f2fc7ae276838.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: e43f5932-1bad-4e05-276d-08de1c81e3f0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VJduFQLPBWgQz3tggyHxjtWXh+5gp3QRjNZ510Wkdwh6u25q8mJNHayYW5GR?=
 =?us-ascii?Q?wFrX67YXCMe0ZFY9MgLj9cHcqyu0kMC6leNK8FMkyi9RlK+let5+pJc3rbLb?=
 =?us-ascii?Q?wuOPE0F7Kk3Mpzu7jTkRfCQlCtEeqy8wrHvJZNwOh4nbaE4E5v74eb3cem6X?=
 =?us-ascii?Q?5XpNZ2VuJcH7BJTqy01j66r8mTtKTz3ul8fJjGT0KoEWzIsAg6aAAIE1wiXQ?=
 =?us-ascii?Q?wmL/8A5GM4afAAECzn+LG4RZkehRbRl0DaeumURsCbZ7RgBjsnM3sLQ+wZW0?=
 =?us-ascii?Q?YKLC+v5MMDD+bXabvMOi8IBVypX4UQwsx6CNPVPBBMJYB2MNPqJdctMGuly4?=
 =?us-ascii?Q?nX0creIzEGPYtWgJO3olpD8ngbiS9lkDPuyEduz9T1j5heKcbepEscZVCK55?=
 =?us-ascii?Q?Y/eIUi+9kU54pYNPflVRvclO3lmMBbuGy3odqCSIddeYQRBuN3qkVVzv299l?=
 =?us-ascii?Q?aLRTI0dVS2F0GSLHO13sHp5bEa3MYlQsXdpyOA3ovEpsjJnNt7SrlL3TaGc6?=
 =?us-ascii?Q?Ryx70UibWp9+QShA5QeSYqu7MwkuTHuBzlj811n4wUXsAGKa3Ei++oxl3LKL?=
 =?us-ascii?Q?6+Eld5LW5XzY3/99jQw+TlWATHrXN2z51EfgbWqZfRBcy4hKB4GonV5+6TZU?=
 =?us-ascii?Q?mfvZ7O/q+WE700IGVoyBCKzNs6DcdT3Wbezd319LMpl7KQTqPv4Sj5vk+JC8?=
 =?us-ascii?Q?U1g6DNMJIuonPIeUOR4GyHIV8i0sRgz1t33y741pjMFtelyGkmi64d2OyAFK?=
 =?us-ascii?Q?Q/hY6t1kPKNsBmyK+4I/nITZx7IZhFeZztICN05l9Me29rhus1+g8VR+BPSu?=
 =?us-ascii?Q?8LXxKiNwYpWajk0Qt+hJIf7ZdECa82hMOxefryY/PK/TEO1K+rddVFkXQXwj?=
 =?us-ascii?Q?EY4sM0GH+mco5eYGhoS92Lrg5PBCyF76CvJx6NWmqJP4C6sKEzP+ZVC+lY7C?=
 =?us-ascii?Q?2lAnO09O0dow6fCRRu57ZboiydLJC08jm8RXHkyDhlaXySbCDkY10aRKuno8?=
 =?us-ascii?Q?CXmuexlEmuarp/8n48xHAPgDSK448U6FfrvN1sVkHyYR9CK+t8ulhLL8BrKm?=
 =?us-ascii?Q?IssF6lVb9eFzIaCfAg7Nbaf3ck6PJkZ3thyt96s5oWT2i1S3v78oy/DzQrhR?=
 =?us-ascii?Q?4FXe9hUoL0ecXNPq0EM/kEgL+Q+MVsfNtFYe22GYngQ18Njo0+U3v3O+a1rO?=
 =?us-ascii?Q?3ibcYCgYlb4P6doA/KJS6oFOCxkiF4jPxAU4XMCF6Y1ivA+XMgC10GluRumt?=
 =?us-ascii?Q?2BjlTwsgb9HyJ3ZHWk5WuG1mlFirYq9GhN0AGnAV2QN5/vWgLoOmgkyK+iOg?=
 =?us-ascii?Q?mbJJqg1iVdb9PTZXkhR7VtH+yN65kPQaIJBhw2mEHSW0qB4zjEV+iO/BrhKK?=
 =?us-ascii?Q?nfbGGVuFdFs8uAxeKOpBjvF3j49YFrPYDkxmOEeP0AtjEkH3P/amV3IQQkyr?=
 =?us-ascii?Q?D4yVQFExU0J59/uOZvE13/JSTWF+/1vyn8VWy45DXWNrT93BbCPHabkFhmzH?=
 =?us-ascii?Q?WuK2lU0K0yHvq/AXWdcV5O3+c/Qv+tNfUyGi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YSegC2I5+r7Ghvvn9TXo+nLDYpebFOH4ZANxlF1vqK2XF0l0rNr4meyM6qUD?=
 =?us-ascii?Q?dGAQI87mbVo3euFLSFkIcJmdN9k9u73pGOcoIjerkG5Ise1skkJauXMjHk9I?=
 =?us-ascii?Q?dWlaWlwwtsbJFL/vjdOrAJEyREylsCWlIy/oOW5ua8IAdv6hPenlwqBDuiQ5?=
 =?us-ascii?Q?/nj5APonyu1LPbxa23ShWqACwzoQTzleniuOlyc5TEmjO7pj5625334v0jf9?=
 =?us-ascii?Q?nMQcXQA+nDJC/ArEHQzNjC7vHOVllCPQBzoS2tz18XtrQdmrc7wuzqdqrVae?=
 =?us-ascii?Q?6bN+pBRC3adKXNp9aVdNVNmUMks9kNCfGrovrGpL5IeT9tvBmneXWBGHBF7g?=
 =?us-ascii?Q?TIWyhARlGElXUmkTf4sP+vfNIEug1CiwWyKvCdUy+TD0XrrZnitB2J7SPK4l?=
 =?us-ascii?Q?RKbRijsXXZREGMfUs0+z5ezpcyRghiuKAXGBYGLRUnNCnveS02KbcwmOpB3u?=
 =?us-ascii?Q?uDJ7oXHh83WjmrWEqqs58q219KQZifyslpc5C6RYgCBKFR6WM2qTvb9G0oQ4?=
 =?us-ascii?Q?C/evvTNrlL985LoZ7tDjeLC6Nyp+KQy1l9Yo2OmIQxorvTAuSzB4CQ7LL3dk?=
 =?us-ascii?Q?FAjIUoyjeMrt4Pje8HSYiE4f/MVWWFAa4ykWE0Y6CdhiVitO7WDU2KZBO2kS?=
 =?us-ascii?Q?kKG5+2jRGG0Q7gtT9ifaHCtg3L/k4Jd9E0mnTBkfnEoP9Wc92O+N67zvxBqs?=
 =?us-ascii?Q?YKE/F0kmHSQzvlfrEb6KyzLbP9lWz8iV718Q29e97J4HgOOV2F13hncuG6cV?=
 =?us-ascii?Q?1ccy2CaYQJB+BcVEUew9su09BpOX0ITrN4sywCMpOAO0QQsnHeCpIZAZc7PK?=
 =?us-ascii?Q?aSwcnTAVFizQuMcXSSRYZLL4O4urfiSeLz/eL1x66dhsoOqEIfAGHl3ptYcD?=
 =?us-ascii?Q?P0FaWsNor1Tw36WTnwAqAzoikBXLCB81GJvwJ9Pxqmmg8r2yxlqIQpVTijGQ?=
 =?us-ascii?Q?0hSEXPNWzcNube0eZXeix7fT9WUOgN3bUv+XAosLDNepnKMTAC/zd9wd0j4m?=
 =?us-ascii?Q?VftziwRq9wMw20EIKOImfUQSXwvtMcWCiyVVCwrx+VJx9eE3G9+/3d6HQCR4?=
 =?us-ascii?Q?6RuJTw6qtpNyD1YM+AEE9XSIchl9xC7/qUgh4oCGZ4IH884X/7caxxsGBhsm?=
 =?us-ascii?Q?6a+UbudWwFxSAqkmV+z3BQhJKTSALoXGkKtAD4ok8sLPhaLTnlOriZnI54xv?=
 =?us-ascii?Q?NLxm+PTMoC67el07rYpiBMXnV8R/7JLS21E/UqVYqH1Ee8Z5EBY5Qm9hcxCU?=
 =?us-ascii?Q?kcluZckVElD3pvxa+ehHjbU1hVqdgX/Hc9whUMdfaibEsDSGnObW/Ge5+DpP?=
 =?us-ascii?Q?dWCHglAradApmmDkNzc6uC3x1Uem7Dw3pWxBFKQulUYES0E7GZed2f0aiMDo?=
 =?us-ascii?Q?UZaXRg/Yo50EEInMj/8q7KgdEwY5lp1sS2W1LUwEltBIjMKxAloaYpYUi5KZ?=
 =?us-ascii?Q?B90nOMlvHHYu+fu9VdhKcpKi2cEwgIzfGe01GcajBv5XO4Y05lRWtQ9RPv8z?=
 =?us-ascii?Q?VtdlYMcaSlIIRJ8UpYmigu00OgsCnrRDothed9SROflhXkNc6QQCKSB82cXl?=
 =?us-ascii?Q?HNS5RI2uT5NzBE9q6tw8XxDRGYeciLk8aUQdVBxFgusPUHdiObaTUULq87hd?=
 =?us-ascii?Q?8zJ9drxLoNaHzNOIFefhctQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43f5932-1bad-4e05-276d-08de1c81e3f0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:42:13.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7JEE7RCmCmRqwM89paYgAdKaAEryiB2ncKx1uBzj9DobR7yHsDApPeti8666W9sw333bXbreYZo495L5lEneRjaMM2mz+ySo4RR/GgbKq7keO3NM9monIopDbTvu1UG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

USB2.0 PHY of the RZ/V2H(P) SoC can drive VBUS line via the VBOUT bit of
the VBCTRL register.

Add VBUS regulator nodes (usb2_phy0_vbus_otg) under the usb2_phy0
nodes to describe this hw functionality.

This enables proper management of VBUS for USB2.0 OTG devices and ensures
compliance with hardware requirements.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index b94a06b6f83e..cedddc19b935 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -991,6 +991,11 @@ usb2_phy0: usb-phy@15800200 {
 			power-domains = <&cpg>;
 			mux-states = <&usb20phyrst 1>;
 			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				status = "disabled";
+			};
 		};
 
 		usb2_phy1: usb-phy@15810200 {
-- 
2.43.0


