Return-Path: <linux-renesas-soc+bounces-22542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63167BB1D18
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9425D1C616F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D06A311C39;
	Wed,  1 Oct 2025 21:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SowPBjyC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E33126C0;
	Wed,  1 Oct 2025 21:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354103; cv=fail; b=doohp0fqvjELXnBlED5vH0K3dRgbSpZYcA2KnkMwY5TqkCtukFDyRm5Vq3ILEbPcLU7EKVBLi7Tgu1nK77dGM8eO664ii9YgtHflpFTY2XUaQz5eh1ofNuPId7V0v7iSG1ElV1Y6dtX0n26ayTC4GGrI8amy8nUYD1lxXyCOPQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354103; c=relaxed/simple;
	bh=Ji/ec6nDJzHnpQUvs7bKLrLwUwSlIp1BeUVvnI6z6Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hAPcqn/9NQWM3ZZt6zB/BFieVjYaexGcRqiStVPMBU1yPji/t1xUKFVcc+gEI9yqpf4NEMxv5Z8DMMe6Ll12WkXA90klzOxbOarcjG6OtOAgYaAGS3Z5V0ECKc1LiaJ5/aauZlYcw/OlY1vQD+3IUmlh4x3KgRntGBAz/roSC6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SowPBjyC; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyL2Ld30ng2bi2Ift/6hY7E0DU9vZTUPqrnAnDr5SsI81tJA/REDBIR3G1Q8MRyOWdVJEOFh65eQjOSMl20iq/A026/7qvfp+isvJXzhia/xhXzXaXeVILoRvcsdlSn1WBOpz7XJHu3hjA2flN19v3zjj5QxxTEkvx2TDJSNdxCSgrfw2DwhNQTkE/O0rKTSsbeXxUGZHDx+1Q+/6nw2W/aCYsw/su8JXWZ68RCuODEx5EP1OTmgNUMGUE80jP0HaCW8Gh/ufMvGQF73ee3lYZJm+wAz+6Qknx95gPezzYKYn/Y20ogcXT+jeZzgKHPAQlS8t4R1E8lmXlEut5PyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXHAaXlAUEjfWjT4lQaQtyVQ9SU4lghh5hiNFeLnrNU=;
 b=EA+ckTYhlV1AAADLCd6vdJUsOX1jeAnfIPWO94kblU3kRaKFkJqKK/1f8vl4eDnvCWvnDw0PZaSCOCKT1pMwCUUprzjzIpEkqBxLx56GFKU48CYudB+ISwtU0sBD2lin0HjVAVWPbfmpUod/qObTJBr5b7wf7LpSAwjv461wfSYIlJMlmwVRsQ7FMgWy1QTZ5pBWoZi7lz6KdNZCLMyG2yu0XnLduVh/Qm3duZoGxMKXdvD7hxOjXaS2cdQ+EYzwpccTyY/5I5nPDlZLpjgWdRnFmLtU9dzGNv2f6atKDFXHtVEHRU0DIiqsB0CVRmPonZ3vsulbW+/aMv4yS1Y/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXHAaXlAUEjfWjT4lQaQtyVQ9SU4lghh5hiNFeLnrNU=;
 b=SowPBjyCTb+HlrHQnNHwEt4W3RY4jL1g4jd3WuFA9D5CUnP1/O/jDBIMuTxrUjHGeKc7adowPYMYbZRk7l8OpZ8EMWM/GgcI6sbAQ3iOrsCOIEsykfzjUq86UsNXGWMKKFWiAtNJbsrFn/DZejatr7Kr4+91PP6Y8qLZDD3u9+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:28:19 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:28:19 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/18] phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
Date: Wed,  1 Oct 2025 23:26:50 +0200
Message-ID: <20251001212709.579080-7-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a7f00ac-4c52-407a-ec7e-08de01317098
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dwu8dqT03P+Rivg0Mqr3Exz4WqfhFRdrtm2WiAxpdnd1jDgelMfJ9hZFEZ+w?=
 =?us-ascii?Q?RoBf+c4xaX7z0GuZfK0XweQQR4joMBVgEHwtR54H2XgAynvzQdpJ4qU3Eweo?=
 =?us-ascii?Q?BHTXqI5KpXrLx+0L9d2v3weH5V+WjQzDkcZ3xN0p1xRZE4wChWNX5mGdOrN2?=
 =?us-ascii?Q?G+KdQUiNNGIv347O2rNmMSYbuxWalJxHDF8dWIRfB7JOzCt2CJMMiLe/Nxwh?=
 =?us-ascii?Q?hANadFQOIDIxSuRhqxLXGWbn09XpYznPovj/xkGds9zaQoW/QDWOiTqbGGTM?=
 =?us-ascii?Q?hMce1k+Oh+ZXQEx1FEqZn898AEabWNSdHXJyqaHSu+HLm6ac92AgIbvOw7KD?=
 =?us-ascii?Q?wA4pGAdF5Zaa1Jxv2RiJnY7//0qzZgUKOQkf9TvSyjxkaG3JiqucwJ73Tx4b?=
 =?us-ascii?Q?zamHKa8AVQLw5mpjuSLVo85Cepl9CyLe2JwbshEMXLOF+tqJAoVuf3kb151l?=
 =?us-ascii?Q?PMZAR7hihqea+kPKBWg2PYlo2I5nfmr8CSaIj6MtldNs7fytKT3lap64Rnte?=
 =?us-ascii?Q?AdSGaIZMloj2eAcgoryNFluKjFHKiE1NN+78eTKXT0AEjwQaaEpmrR6/L7m8?=
 =?us-ascii?Q?lG0KYDo2t3qagIYlxGNl405cKFtGFEPwh1Z7kVzqPvJjf1C1p/CAL7+fgYeo?=
 =?us-ascii?Q?57q4YBGnhYKfwIuulfr0Iajq/xb+U9w7HVdyZc7meb2OdxBliuCR/AwaF/f4?=
 =?us-ascii?Q?1dt7B2I2+C4R87Nk0bmDAgARZoYRpb8MAWMX6Yt7LdoihByyoLTEkhE19UF9?=
 =?us-ascii?Q?kpDwRp3VK4fYJsHHoPtQ/yJGMIRKMXxKj70OKNJzYyjpons11qayVi3AQRlz?=
 =?us-ascii?Q?ZsAVCYRl0IREpCnAmvdYHzYhS39toap7/LulMCkwH/LgstKnPvI4B/O1CR0j?=
 =?us-ascii?Q?pqMqjOEh2kqCqF3GguGTgO8SzuWoV46pr2ncE1Y3GXgGp0ZsSuiYic2qTeNk?=
 =?us-ascii?Q?5FgUtRFne6n3DOE7TLjNs6gfpnPvFtYo39TqpRz8akMOAlbsDM+1UXmmU2aN?=
 =?us-ascii?Q?pLA7NSlytLGkKn3KduHgkEZscyQT7w2H5EcvFCqEfFCCG3T/u3SglVmTP5Ro?=
 =?us-ascii?Q?CN6c5dtF9q0FB9CeDojiKUJpZyGxAiDm/goHzMW490OOutVffdb1QOIs+S6H?=
 =?us-ascii?Q?+O/ngH62DAbcyOwRO0eqvWBpNOlbmyFfvg6t0xuq0IH+eapczyWbLLoWDFaN?=
 =?us-ascii?Q?0V9GnHuToYGexOWMu8v0F1A2fz7AKdlwAQxMgsJx9C4zFafb6f7TQ5ChEs0w?=
 =?us-ascii?Q?fY+dLiVkHnpnQ7+dowrd7U8rt2lrP2i4Nw3nSgA5zmlaJa+IwSim4QgYlyOR?=
 =?us-ascii?Q?wN5mBVxWDs1iY7tLm8QzxRyZUqq2lxKOYEwm0mCPHGa20Qr8lhxG7sibxB/o?=
 =?us-ascii?Q?cEbBKfXmrXct7DLgNHmzhebfulY3jfMUUdXj3u2VkqGRE7Shtxjfi/+11y4+?=
 =?us-ascii?Q?WEAvP9YdmQyVZ5Q0SkTn9QI/2k+IYnE/82lICH3+jltq+iqXN0B3mAM+DaX/?=
 =?us-ascii?Q?CluK3eYnlZtNxRt7oBWUqdOaDxdn2uJZPYxw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D2VkaasXx3s/qEyqUx8xK4na58ySmwXMbxGP+f9LEmvBnj+8jME+IvxcL9cp?=
 =?us-ascii?Q?p7mn11fsNZaXyEG0/chnTmqN1L0F/sUSoUIB6h4mkgeDW/5UlFlJeUQEPTtv?=
 =?us-ascii?Q?8jYlIm7MBQA27+fLAePcS2yTlyAaxVx6t3S9Kgs653BhsofBdxO6tj5JuOII?=
 =?us-ascii?Q?WIuwoIH64vn02exOr71VfR0X6ie2VtLdlJLN2vSDbIz5lMyrnKGnvNMPIclb?=
 =?us-ascii?Q?DQh8rcd5RBL8qjDABfaUkHf2TvILJ6S136W5gBkSE+QZOYHi55LEp1TkwLYD?=
 =?us-ascii?Q?xbLOziEo4c2w1Yjlq+TRbrVosn1x7XwNO9dlJSxY9IrOSi4KkrMQmUUQluea?=
 =?us-ascii?Q?l7stEtGUIX8ybEH/tjIWw98prSI7QhySHtOC6pwxs0Bk38MuhVR5yhMHTSmB?=
 =?us-ascii?Q?6I0lrn2N7KSmc5Lm2nHyZlBvSYHg6vWHaLi1Um1bsxkB7UCOE+goewjg40z6?=
 =?us-ascii?Q?p5Db+7zBiOyHHobGsyyIAsrSJhsfGpafc9dljHjC/wSH41H53FS6g2HaI/fP?=
 =?us-ascii?Q?ncT8PS2oWOE1GZxQn01BHGm8ryEuYZ2PDtXjs6dxkRy1DYJtNOgAGVcaocQX?=
 =?us-ascii?Q?iQJ6ZrTFgcHiQN2Uq1gKAojQRKD+CCd+mzkr18A1zm9P4l730WvQbms6YoAB?=
 =?us-ascii?Q?VQq9o8W/UYt8LeLeM2tEyEXk1DAv7JH1ITP9ue6xl5aLdip3XNtHBkDToJoM?=
 =?us-ascii?Q?gmI82UE8tvmOeAzxKYc0JdQ5mLbk4SqFjRqhgTMKXgm8K1w/h7s9ISzOTERN?=
 =?us-ascii?Q?z++sSiCZx6wZIbqmy+FCvAMB8O2eCaZblo6MKZRmrYTpml8zkghMoIIgw5sF?=
 =?us-ascii?Q?rXbfF8cNyoG7ok4su4F1lKl7fzBLjp4OeMz8k+3QgfI6XlIsgT59da92VN0j?=
 =?us-ascii?Q?AS+9xd0t+Nh1l2bqJKBL5uh/4/7w85NrqcSB/U039/t3Yj3U8Wx1g20M6bJU?=
 =?us-ascii?Q?qT9s9Llp2bzNpKpiCVFKXMdncW0Y1tNuSHXDRkmvynT6S2+bW1+bYlNsWJ2c?=
 =?us-ascii?Q?oQv1P3EN/EA2xicnbMroxva+BNexNIlyRkf9ti+nez9W9dw57kmXiWD16rsn?=
 =?us-ascii?Q?vUMNnGHU5F2wb2V7iojsNNhlsFAPNox50phFPPDg2eKv0KiENWNmjPPTUuvi?=
 =?us-ascii?Q?ci+jcOFarYSB2KGeOH2gog0b1Er8ks3Bv8qC97na1vMJtigi3qhtsYvjbzc0?=
 =?us-ascii?Q?wdqPEoiLNmgybk03WkMdb8vlTXH9Q2RMLDlLwkYNjHzR1CgqpZwMOlDXQuxl?=
 =?us-ascii?Q?0aCChzPw9SIhNNS/9NP6bXC2/N/aDFn3URWggyqgiKm6C55JrjoCL9mIc+Se?=
 =?us-ascii?Q?24C2IVM5XvXWPMhmCMA6r17bu3EZZSdHbz66QrExcNjA9jzsXX2eqB2mg/Y0?=
 =?us-ascii?Q?Koull7cVuuTz4cg35EFuGaW3mYQ0t/12EgW2oscRBlxl2DUCboALijyG8IkV?=
 =?us-ascii?Q?MRqrfbo6Q9uhYYu5Q+20yqJ2tlYbvHPTw1XOhFA/efRWAEsbQo7VdtqX2PGu?=
 =?us-ascii?Q?td6EkFpH85pxXtWPo/L8/aOhK0Ad+aK7HC/NSLvv1eS8a0siWq0mvKzRiYcM?=
 =?us-ascii?Q?VFPYKgTlIAdy+Y+dX1NYSua19YU1fwLocOePTpePxCu+HYIuHhO6kbkB/T1y?=
 =?us-ascii?Q?2i88p0nmgx4WAi4OMWsY/cQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7f00ac-4c52-407a-ec7e-08de01317098
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:28:19.0685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEdcF163IJaXgs4q+69Mbo1+KxdsRIQb6SqI68JOFfmKBwaHfdhvTiSkhM6FQEb2MkZwQlhTEk67DOeP8Uj+hU9EG5py/aJ6REs26Zgp0gqfLNjVN6pMvDl9PPeDuEEI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Enable OTG VBUS control on R-Car Gen3 USB2 PHY by registering a regulator
driver that manages the VBOUT line. This change allows the controller to
handle VBUS output for OTG ports using the regulator framework when the
platform requires hardware-based VBUS control.

Without this, some platforms cannot properly manage VBUS power on OTG-
capable ports, leading to potential USB functionality issues.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 112 ++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index f6026b3b95e3..81de01410c19 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
 #include <linux/reset.h>
 #include <linux/string.h>
 #include <linux/usb/of.h>
@@ -140,6 +141,7 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool otg_internal_reg;
 };
 
 struct rcar_gen3_phy_drv_data {
@@ -224,6 +226,11 @@ static void rcar_gen3_phy_usb2_set_vbus(struct rcar_gen3_chan *ch,
 
 static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 {
+	if (ch->otg_internal_reg) {
+		regulator_hardware_enable(ch->vbus, vbus);
+		return;
+	}
+
 	if (ch->phy_data->no_adp_ctrl || ch->phy_data->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
@@ -592,7 +599,7 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	u32 val;
 	int ret = 0;
 
-	if (channel->vbus) {
+	if (channel->vbus && !channel->otg_internal_reg) {
 		ret = regulator_enable(channel->vbus);
 		if (ret)
 			return ret;
@@ -633,7 +640,7 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 		}
 	}
 
-	if (channel->vbus)
+	if (channel->vbus && !channel->otg_internal_reg)
 		ret = regulator_disable(channel->vbus);
 
 	return ret;
@@ -819,6 +826,98 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	return ret;
 }
 
+static int rcar_gen3_phy_usb2_regulator_endisable(struct regulator_dev *rdev,
+						  bool enable)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	struct device *dev = channel->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	rcar_gen3_phy_usb2_set_vbus(channel, USB2_VBCTRL,
+				    USB2_VBCTRL_VBOUT, enable);
+	pm_runtime_put_noidle(dev);
+
+	return ret;
+}
+
+static int rcar_gen3_phy_usb2_regulator_enable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, true);
+}
+
+static int rcar_gen3_phy_usb2_regulator_disable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, false);
+}
+
+static int rcar_gen3_phy_usb2_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	void __iomem *usb2_base = channel->base;
+	struct device *dev = channel->dev;
+	u32 vbus_ctrl_reg = USB2_VBCTRL;
+	u32 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	val = readl(usb2_base + vbus_ctrl_reg);
+
+	pm_runtime_put_noidle(dev);
+	dev_dbg(channel->dev, "%s: %08x\n", __func__, val);
+
+	return (val & USB2_VBCTRL_VBOUT) ? 1 : 0;
+}
+
+static const struct regulator_ops rcar_gen3_phy_usb2_regulator_ops = {
+	.enable = rcar_gen3_phy_usb2_regulator_enable,
+	.disable = rcar_gen3_phy_usb2_regulator_disable,
+	.is_enabled = rcar_gen3_phy_usb2_regulator_is_enabled,
+};
+
+static const struct regulator_desc rcar_gen3_phy_usb2_regulator = {
+	.name = "otg-vbus-regulator",
+	.of_match = of_match_ptr("vbus-regulator"),
+	.ops = &rcar_gen3_phy_usb2_regulator_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.fixed_uV = 5000000,
+	.n_voltages = 1,
+};
+
+static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
+{
+	struct device *dev = channel->dev;
+	struct regulator_config rcfg = { .dev = dev, };
+	struct regulator_dev *rdev;
+
+	rcfg.of_node = of_get_available_child_by_name(dev->of_node,
+						      "vbus-regulator");
+	if (rcfg.of_node) {
+		rcfg.driver_data = channel;
+		rdev = devm_regulator_register(dev, &rcar_gen3_phy_usb2_regulator,
+					       &rcfg);
+		of_node_put(rcfg.of_node);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					"Failed to create vbus-regulator\n");
+
+		channel->otg_internal_reg = true;
+	}
+
+	return 0;
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,10 +989,15 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
-	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel)
+	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
+		ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
+		if (ret)
+			return ret;
+
 		channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
-	else
+	} else {
 		channel->vbus = devm_regulator_get_optional(dev, "vbus");
+	}
 	if (IS_ERR(channel->vbus)) {
 		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
 			return PTR_ERR(channel->vbus);
-- 
2.43.0


