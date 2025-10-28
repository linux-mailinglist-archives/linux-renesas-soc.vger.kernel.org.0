Return-Path: <linux-renesas-soc+bounces-23716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7AC12DDE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 05:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82875466E37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 04:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085E628853A;
	Tue, 28 Oct 2025 04:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BM9JwYR5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD39288B1;
	Tue, 28 Oct 2025 04:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761625980; cv=fail; b=GP1CdX521HLfNm0EAr5IHVjf8axDM0seb8e0BgDTHfrSHwAlp4C5eeQtJe8u+yUVREw1f77Dh31v36/ceGFHoKPMcttJRhQ+/Mns/R1Gdd4Uayl0l4y0UdUJNHQkRHh6u9DzjM1N0Uu39JCTrbR1P/okANS65uQ2VGbbPgjQn0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761625980; c=relaxed/simple;
	bh=rRWJFj26gOS5Qn8oVoaMypPiGpophbzlehJkZm2l9aw=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tzv3IcNEaPDRgz9+zPXECXodDcJIcchkWlh5CXDFPEspuXLTAdMg6NbQg9OdvdZlGKh3BBPPazl8S/6I0WuLE4TxMzAIz/SIRioLiBq/pMZ9CoOLHWnvz/NqchX0Y7cGc1WKqWAT4HP3K8A/hmjvu9vgE0DDwtgs6BuoAz8WDQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BM9JwYR5; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7i/+vcwQEqrVsJkL23EwsUP29RdicbjinzxBvk/uroBhHa/ohiQ4zHs9DpZorC/yg5jbQi4mtyURQunqe+5rQdECNeMpeYwKKlb6Zys9Sx8oGSdCymD9s/newTmqNjNW7wqzJdKmZpF8YqobZ95gZ7dWU1rvImKpEfbN/biS2qYmhq7jiJMcjobCddHokhYzGwzEEtXr0SI2AessIwRHwR+ZXlLhIf/hojy+teRHua2eMb9eKzbt/oqet+XOluQGcwqm2kVkd+9REYdpQ3tvPL4kQjPHaoW/Cp9SNg1lKryC4Mxp53vXo6h0S4wKjYjkOOslSKrxrrZJNH/wOxicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cDgn4VTLiRB9RREBBXr8kqurOJcXUC8T2ZpVK7PEWI=;
 b=tVWCWmCpN1kMGWMo5Ue29Rz8sDDeNJkybCwpVIuBmUhL/iS6bcaQBl2ciMvqIi0NFBOT57ZDx77xnlntQZjE3//O6cs1ZGYIR9BemnW2nK3lr8eXGfziUWb8qwZQJVzRMoRpX38B74lzlkTypzEVjt0ekcC/XhzNvpmqEfSSS4IFo4AhFFvyiLIJuFbmlaJUuqh6005sge+m1Z+2h9jF7rSu2jC5CafcKN9VZaPUNGrgOlrQeBInA7hP6adirM02YnuinujV7tj5Law3z3kymGi/Mj7oR8MIg9gNl8YDkfnjyIAoar0fdmJOvD1OGtJdV2gD1GFLEaN4zI6Rt+fPEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cDgn4VTLiRB9RREBBXr8kqurOJcXUC8T2ZpVK7PEWI=;
 b=BM9JwYR5P08Q2drE3gZwmKncluVXRZhHN6YyQvPR/bYVllLG+dt/Oga9zvBpJWckt/DqbJfThQqoNXiEQH+K/G8WzkVTzKy2uJHiUlW7u6nQJ2isGXerRvn0R+Bk3OCKeW5fVbUYYGyr/p+qgQiwh8B948UKJoRF/kxJZJmATY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13679.jpnprd01.prod.outlook.com
 (2603:1096:604:380::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 04:32:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 04:32:56 +0000
Message-ID: <87ldkvsl1k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/3] mailbox: renesas: Support MFIS mailbox driver
To: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
In-Reply-To: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Oct 2025 04:32:55 +0000
X-ClientProxiedBy: TY4PR01CA0054.jpnprd01.prod.outlook.com
 (2603:1096:405:372::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13679:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ab6127-402c-4711-707b-08de15db10e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SgBy8DsuIG+mLdHC1G1p8bDd1yPR1SKPFrhmWp64n1L7ZwBknm6J4GxJYf/B?=
 =?us-ascii?Q?9WzO51IlFm0kGRC7jiKTknkvljmtRxD0HyW8FfGprqnSPnqjTQlK4sCXd36Z?=
 =?us-ascii?Q?Sq+UIcTu1ZWPx91kGxsMUQYmxLoEMu4Aeonz5Vlx2uVMvRPvcwcdDWqNSCr1?=
 =?us-ascii?Q?pRVaLu9+ojWEUqbNO2gGaAy6pJZybzeUxb9EO3WgAGiNMFXP1hWEZuvTAe9B?=
 =?us-ascii?Q?YozwhYddHtgqAjQmPp7By+xUKoyGwRrKDKz0TxdSxj0kvjoF789jpwRm/2Gq?=
 =?us-ascii?Q?gnmAjivWts8l4c6KUYqRvivcsQOzRWcKOJFb+/MbMgKJyiN0rRBxKtMfdgM5?=
 =?us-ascii?Q?qClmi+HnUtc+s0qatrTXxHuXlE/qadJOsbZIi5TFSq4Ds1p07MOyG4pLxoCU?=
 =?us-ascii?Q?EHzMGzNzNNzNW1UO/t5Ium1Le0Qc0Qcw5V/fECkB4mFX9T2WVL17ge+Bmi0d?=
 =?us-ascii?Q?iFV/gUZsEgV+8xYQ0Mr4Ka05haRnrzu/KYhwCxpDiI56aCNgnEpcM+sim/hO?=
 =?us-ascii?Q?TuKLZ9BajxwgDPXxuw9z0ZQHY5HTHydMab79OmO1EpPRKt8oZKGSFfjBoyVJ?=
 =?us-ascii?Q?NuDlFQSFl9LZ472Pyxump0id6h94pqS5dOXhDQDnE0AGUG9D7m8V5tzbwv+8?=
 =?us-ascii?Q?c4f+MreEtYo2tC7kO7dXwi6w+X8fSEzrjwY6ruLVVmjU+MfQT1F3RlIQa7OE?=
 =?us-ascii?Q?Puu+BYNBbtTOboLhQq/fCF6MQ6nCPsgc+vpx46G3vuNhrAEdymX2pbu9RMJH?=
 =?us-ascii?Q?Ph28fvIDcwHb5qhIB/7n/k2G077m0UIdxOJSdbVNvMItrigH1X3/N/Nr4XH4?=
 =?us-ascii?Q?mexu2Sesdfghan19gI7RSMk829oE8reGzsuUhdu+5vR+BP3z6Arf3ERL5GrG?=
 =?us-ascii?Q?veLjhFx0vhCMQ+KO1UpBZK89oE8KuPSzsxuzVYJjkJ2gWSWNAYgHEIo9chZX?=
 =?us-ascii?Q?k9vU2HoBGEKf4XMRviApK5YIu3PBzJeNKPUt4vLMe9qdAu10gpVPxO8DBcrd?=
 =?us-ascii?Q?1hDpR7QU4UQa9S7+dY6NJRejNQPX7KyE4KzWxJelHG3sIWg27MwfKFJgjABF?=
 =?us-ascii?Q?Kl6P4qpyDlJQ/COCQygNodZF6Bm7mA+qlRjuwDCNf/J9rtqyFNnVYZfzmzdM?=
 =?us-ascii?Q?4D3U+wJCUJm0jUZFdL9nXeSck8R+YMaBYsbTzC5ZanxY2BrPPFcRIGbNuGBX?=
 =?us-ascii?Q?lWw2cowcar8lyK2zoA3ZGjAM1VCGflSWXRlq8rOIRyzYRTmOx1fhgEo4RtDj?=
 =?us-ascii?Q?kp1czrTfh/unYZDL0cjkFzrHTsslZ+ACX4c9+/du/EqWjC+lRB6P4efIL9dE?=
 =?us-ascii?Q?Fi/fEchsr1j4YM7NtieVi2S+6xVNt3lnaanBhw70KEIMvo9hLuM4BquMlhU7?=
 =?us-ascii?Q?EaiVDHXzH0HI5bgb8aAqzHDQHCXe+Tc9FLWlGrf0vbgjB6cmReotG58RxwCx?=
 =?us-ascii?Q?WnoDSKNt0R8yWRPcMP3jUAgOt2zfP2lBfewrgVsEtPOReN7z8oPQpDJDTnIK?=
 =?us-ascii?Q?UWaxSv7IkFLmbV8d0V64hFb65ejZjpmTSLGi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d6M9lNNXCGPVh5UWjlScBFRaMtfOi2VgxCGnVP1fB4gc7hOB6HKcpY5twGdk?=
 =?us-ascii?Q?FT2b2QRi3XEpxAJYoJvuUaDEVVvGLTZEoOkfx/Z8q8Cx3o7Kn6exHpM+O23Q?=
 =?us-ascii?Q?MjOhmtqwB9lmjt+49SwFgLbNLmebQdSxhyDdCXZwMqeCMzzog8sjM+Y1RE8B?=
 =?us-ascii?Q?is316xBN0M5SXwvw3a7XuMLLf809tMaCjpxZO2YNeLOzw1Uui0PpkzHk2Qew?=
 =?us-ascii?Q?CjU2F0gK3C7Dx65jPIo2VMBN18aDvXLz2/XdMxrd69YQq9oQrKCrkc9mEO0D?=
 =?us-ascii?Q?WjS28gE0FYrjQV1mhmMrtPkcWEXWXcAVZJ4fYGxQ+ev7z47e7DUvTv2XGe8i?=
 =?us-ascii?Q?SqBNEbUQFJXKVg4Z+HaaNbigjoARrS5Y5Z73A/9jNIiKkUIMI488HLwdflny?=
 =?us-ascii?Q?XvJRPCQGTxqJfILZ4Anw0uEP+ZP8DdrikGG2wfAxjzfio/lNnNFicqoJroiE?=
 =?us-ascii?Q?QvNLdz0YXmVzacdo2h0tpwwuoFOkmil++Jx7SufkjpUkUP2mHTM9s7OE78nq?=
 =?us-ascii?Q?hgWVfSKZKWV9UAhleoeMZYo+0BOSf+xIj4OpWpovR3ytEPwpwYrT/3SgwYbu?=
 =?us-ascii?Q?EbbWcvUW6Hl75B5ND/mb+NeZTZOhjuSg9p3eYCBrWrrl0sc+8jzyfiItxLqu?=
 =?us-ascii?Q?+SrorrsvyzXqFd84t0utHxo0J3J/4siV2X82jF0g2io7YK31R5wKWixr3oW9?=
 =?us-ascii?Q?hHgaWiqm3hdE7oLSrfrUNnwK3v5rfvzELTcsGbMDSj4nYJ2a5unwRV4dwcTM?=
 =?us-ascii?Q?/R9Nhs0wtqUN4f7iH0Y/ZlgVn0BjD9LtvmkS0aiXw7KTe2dM0MVBcRoR4+6O?=
 =?us-ascii?Q?8UsG0gPIzK0LRmZTa5OrHxI/LuwjyD4/ohhWy4V6goQ3ULMjfbAJDTiJptk8?=
 =?us-ascii?Q?a/qeeZ/lxugreTsk8Oo7SK3VZGELl29/Y8+508/Y0oxrrjFpwP5fzHqlcSmA?=
 =?us-ascii?Q?suOmsQd1HxJFoCQFMKEajo12jneaQmYX9Z5QPSd6XU8YAvqYFbFCZNgjHL/T?=
 =?us-ascii?Q?ZHV5YpS1aaMl/IyTUUFgC7gf8XQHS02+rETeocLW/IzftGA3QGzlaZl1fEef?=
 =?us-ascii?Q?C5iCljxWUrUlg7i8Bfzd1hPAD4mGYMnH1SaIcmI6ueUCMLkXzeBVbSivwPLE?=
 =?us-ascii?Q?qQGPcRHk8w1+haWp8049eGVltP2dbqJlnbrPDkuWnKRIb1Aa60d2lemlDB0m?=
 =?us-ascii?Q?w7kWZMFwr59JzSrqzdSaQrlMD7gAmVjMacFWGgWKJKdrZPQ4sjhOWlvudAuv?=
 =?us-ascii?Q?4leCrjGnTx+cGWx4+dKnYAifgXQEJOa6/19qF3kKLE9FSI0XoTFVEcZQ89ie?=
 =?us-ascii?Q?S9WdFwrtwqmCMd01Nz5dS4dTFt7MW9M5CsegbY4QXA+Z4zGJ1WArK8R4bV/b?=
 =?us-ascii?Q?6I406EJe2dZKH/sVkNOPQD1sHEgkrrsmfkXRw4qXz8g5HDWrwjSN3HYFSrwk?=
 =?us-ascii?Q?W+2pKe/TeIxINulyJYuoiH6SxXjsitQwZcwobwMoWKyNJpIlzltULnKi03+s?=
 =?us-ascii?Q?vaONc5FKb7C0TQ8lI+yxdXyh/1CeSOI6leC5NNQ1ZstMF3PnJE3BCi+vr4ys?=
 =?us-ascii?Q?UnfVQZj7lKaTCtRvPLKLNIHHAHrexEmQZt4+IwxNL7VNfFJaDhkZHMq94Q4/?=
 =?us-ascii?Q?OYz3eT0dICbcOL/9cWweqOg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ab6127-402c-4711-707b-08de15db10e0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 04:32:56.0115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bV2iiQaAXSUxaEYKM8MkTm8Le1m41++eFAIYHQdut5tBzuo7+iG3Uqwj7BnlveCPWMFBRAp8Xc4CwMkhPaUW8kTRXK//EoHV3UJid20NNTtlsYO3Yt5Hs43yDkM+cuP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13679

Add Renesas MFIS mailbox driver for R8A78000 (X5H)

Signed-off-by: Masashi Ozaki <masashi.ozaki.te@renesas.com>
Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/mailbox/Kconfig             |   9 ++
 drivers/mailbox/Makefile            |   2 +
 drivers/mailbox/rcar-mfis-mailbox.c | 168 ++++++++++++++++++++++++++++
 3 files changed, 179 insertions(+)
 create mode 100644 drivers/mailbox/rcar-mfis-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index e47cb68989267..0f1688f70ea14 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -379,6 +379,15 @@ config BCM74110_MAILBOX
 	  processor and coprocessor that handles various power management task
 	  and more.
 
+config RCAR_MFIS_MBOX
+	bool "Renesas R-Car Multifunctional Interface Mailbox Support"
+	depends on (ARM_SCMI_PROTOCOL && ARCH_RENESAS) || COMPILE_TEST
+	help
+	  This driver provides support for mailboxes of the MFIS
+	  (Multifunctional Interface) via the SCMI interface.
+	  It is used to send short message between different domains
+	  like AP, RT, and SCP.
+
 config RISCV_SBI_MPXY_MBOX
 	tristate "RISC-V SBI Message Proxy (MPXY) Mailbox"
 	depends on RISCV_SBI
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 81820a4f55285..060a9c7f6727b 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -27,6 +27,8 @@ obj-$(CONFIG_PL320_MBOX)	+= pl320-ipc.o
 
 obj-$(CONFIG_OMAP2PLUS_MBOX)	+= omap-mailbox.o
 
+obj-$(CONFIG_RCAR_MFIS_MBOX)	+= rcar-mfis-mailbox.o
+
 obj-$(CONFIG_ROCKCHIP_MBOX)	+= rockchip-mailbox.o
 
 obj-$(CONFIG_PCC)		+= pcc.o
diff --git a/drivers/mailbox/rcar-mfis-mailbox.c b/drivers/mailbox/rcar-mfis-mailbox.c
new file mode 100644
index 0000000000000..c2de4eb03f578
--- /dev/null
+++ b/drivers/mailbox/rcar-mfis-mailbox.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Renesas MFIS (Multifunctional Inferface) Mailbox Driver
+//
+// Copyright (C) 2025, Renesas Electronics Corporation.
+//
+
+#include <linux/device.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/interrupt.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+enum direction {
+	TX,
+	RX,
+	NUM_DIRECTION,
+};
+
+struct mfis_chan {
+	u32 __iomem *reg;
+	bool active;
+};
+
+struct mfis_priv {
+	struct mbox_controller mbox;
+	spinlock_t lock;
+	struct mbox_chan  chan[NUM_DIRECTION];
+	struct mfis_chan mchan[NUM_DIRECTION];
+};
+
+#define mfis_chan_to_priv(ch) chan->con_priv
+#define mfis_chan_to_mchan(priv, ch) (priv->mchan + (ch - priv->chan))
+
+static int mfis_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mfis_priv *priv  = mfis_chan_to_priv(chan);
+	struct mfis_chan *mchan = mfis_chan_to_mchan(priv, chan);
+
+	iowrite32(0x1, mchan->reg);
+
+	return 0;
+}
+
+static irqreturn_t mfis_interrupt(int irq, void *data)
+{
+	struct mfis_priv *priv = data;
+
+	guard(spinlock)(&priv->lock);
+
+	for (int i = 0; i < NUM_DIRECTION; i++) {
+		struct mbox_chan *chan  = priv->chan  + i;
+		struct mfis_chan *mchan = priv->mchan + i;
+
+		if (mchan->active)
+			mbox_chan_received_data(chan, 0);
+
+		iowrite32(0x0, mchan->reg);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int mfis_chan_set_active(struct mbox_chan *chan, bool active)
+{
+	struct mfis_priv *priv  = mfis_chan_to_priv(chan);
+	struct mfis_chan *mchan = mfis_chan_to_mchan(priv, chan);
+
+	guard(spinlock_irqsave)(&priv->lock);
+
+	mchan->active = active;
+
+	return 0;
+}
+
+static int mfis_startup(struct mbox_chan *chan)
+{
+	return mfis_chan_set_active(chan, true);
+}
+
+static void mfis_shutdown(struct mbox_chan *chan)
+{
+	mfis_chan_set_active(chan, false);
+}
+
+static bool mfis_last_tx_done(struct mbox_chan *chan)
+{
+	return true;
+}
+
+static const struct mbox_chan_ops mfis_chan_ops = {
+	.send_data	= mfis_send_data,
+	.startup	= mfis_startup,
+	.shutdown	= mfis_shutdown,
+	.last_tx_done	= mfis_last_tx_done
+};
+
+static int mfis_mbox_probe(struct platform_device *pdev)
+{
+	struct mfis_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct mbox_controller *mbox;
+	void __iomem *reg;
+	int ret, irq;
+
+	irq = of_irq_get(dev->of_node, 0);
+	if (irq < 0)
+		return irq;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = devm_request_irq(dev, irq, mfis_interrupt, 0, dev_name(dev), priv);
+	if (ret < 0)
+		return ret;
+
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	spin_lock_init(&priv->lock);
+
+	priv->mchan[TX].reg	= reg + 0x4;
+	priv->mchan[RX].reg	= reg;
+
+	mbox = &priv->mbox;
+
+	mbox->chans			= priv->chan;
+	mbox->chans[TX].mbox		=
+	mbox->chans[RX].mbox		= mbox;
+	mbox->chans[TX].con_priv	=
+	mbox->chans[RX].con_priv	= priv;
+	mbox->txdone_poll		= true;
+	mbox->txdone_irq		= false;
+	mbox->txpoll_period		= 1;
+	mbox->num_chans			= NUM_DIRECTION;
+	mbox->ops			= &mfis_chan_ops;
+	mbox->dev			= dev;
+
+	ret = mbox_controller_register(mbox);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, mbox);
+
+	return 0;
+}
+
+static const struct of_device_id mfis_mbox_of_match[] = {
+	{ .compatible = "rcar,mfis-mailbox-gen5" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mfis_mbox_of_match);
+
+static struct platform_driver mfis_mbox_driver = {
+	.driver = {
+		.name = "rcar-mfis-mailbox",
+		.of_match_table = mfis_mbox_of_match,
+	},
+	.probe	= mfis_mbox_probe,
+};
+module_platform_driver(mfis_mbox_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("R-Car MFIS mailbox driver");
-- 
2.43.0


