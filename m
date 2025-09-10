Return-Path: <linux-renesas-soc+bounces-21683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38BB50AA4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 04:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C62C1C6240D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 02:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5A1226CFC;
	Wed, 10 Sep 2025 02:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hTtlF5ng"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5421F3B8A;
	Wed, 10 Sep 2025 02:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469706; cv=fail; b=HZF7/gEURkZFgXdfGGnWRvSGUCN1p9BrJlm1pqKXFEiFiQMpfzj5XjDw1hfCTOx/OfXLDxj0FPi7sdArgiauoNzfDyO3yNB48huEGXRwACvLiA/UdIuG8yvfPWRGgQqXLcoM1Y8XhWydch3QcO+HIJ5yiZQur+wsrhmrce7CKzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469706; c=relaxed/simple;
	bh=orEti6UFnh3Vy4Xxwx2cANt+9qIW5y3OLZlrpU54S/w=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JNFXG6crHAMRrFS6rNx54cu6ZCoJofxkWeIZAHCKowYP3UAdcVpBGsjD6AzXlV13TA3QTba+T26DlAjMidLcMa0xOdeu9in6VthOwz2UJ7kvo7t/CL+ZcdblfGuJT0C7JOx4reRA+vGP1X8/7XOoUJGxiPu3uY1EiJmNyfwlhk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hTtlF5ng; arc=fail smtp.client-ip=40.107.74.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZp7P+f+YeiIEEaotVi7gxCtEYjswYe7DOgAU7OcTRQx8ZSmUme3UWRMYbkv36RCH2tyBCITO8mlbnOg9BcvenHOtnLAvN5Ib3IHmAkKVs+j9ihyzR0xspMWr0IVdhBYW81BwNc89dhweBv0Nt5NO3oUz/mhlIYRf4h0k6JgC0WfS/83pq020r3u9+o7rLDA/NpVtzlXln3i3A2a34TR9g+azvuuaF7HEMzz79Y0CIABoqUUnLFlE5RUz5Xpsv/+1QNxOpLhnr2jzfCS8CMxzsQzNbQRB3LW0ZTsF92YCnuOfzIgu+VqCaK5/IirRA8jyQEDJeq3VCuNzzqdngrKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFulX4+1jylpM+MYZN7I3MYvaLKrWUQAkcGZhIQaSBY=;
 b=HYGsBOAftoxUgUaJQpuhinxd/Gtct3DNivDPfILaNGmnPssNAS4xZDvlee0i01HhXFoS3z3WDVbyER70SNeydurUYFDeZ5+G+YP9RSWjE5BndRwPsijknMuI/1WcRqarf7WtkFkNQx9/fs0oCI032YNXR7F7jyFMo5lxEGNwgsUXEeXayHlKvH4iOK4OO1ZxUEwDeJYuo/EPXOpEej9OUVp8qKwlqWQW4fcyLKZ0olLlSAn1cvrg0yUeBaIVWSKqjBAHaSj8rH+s20x5Ut8GIfahLtag1ELqjWvUrs6IJD7rJEzMKwV3T4EEWgb+puvWwbkLcRCBBvjzFPPUKsxOkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFulX4+1jylpM+MYZN7I3MYvaLKrWUQAkcGZhIQaSBY=;
 b=hTtlF5ngo9gkBUSj1xuFy5rUb6RGzWCcfE3gc+gHlWjwwixpYoVZi/EUDqvFNlQb4pZo7TGUKcjs8xv1JNqfG0drwZ0j5YZTgseKJ3mOHTPKKYNbhZyJpW/9lE9zl8nAyibeSNtH5C0/XhC3AsOnyPsYddMEcJN+Nke7PytJcRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8282.jpnprd01.prod.outlook.com
 (2603:1096:400:165::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 02:01:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 02:01:42 +0000
Message-ID: <87ldmnvzei.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/4] soc: renesas: Identify R-Car X5H
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
In-Reply-To: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Sep 2025 02:01:42 +0000
X-ClientProxiedBy: TYCP286CA0154.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 62345e75-bb01-40bf-d1b8-08ddf00dfcd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q7DRSUMwm7Fjfiu3EUYfsgTE2Jz+ZW9U2k5pKVq7W2KiOQXlwu39/QR6JFro?=
 =?us-ascii?Q?Lb2+cwlRSvAicqa76Lc2FdQveJfkdZwjVmcntkfQgJ9YG8A50H+5xbY22ebV?=
 =?us-ascii?Q?reCHWaZd9s1bTqC5ZOqCJTD+3GBDWmYFZz5HpGbVelELijn5yF+trEC6ZXTn?=
 =?us-ascii?Q?7y7VPMVZQWOYxqpiutxIbqnZhDDcluAHxBTw2vs1cfC7TvGChccrDT26yWtu?=
 =?us-ascii?Q?m8xnHaQ4c7jlT9A2QaWs9GFSSYRMiBvTzACIiABbl/GYWpAB83yplPoDgJbm?=
 =?us-ascii?Q?+lW0CUtZe8x854voFuJ6yl95Ld8GCo0mQT80PVXDFeK7r1zpf1BeCiysX1uc?=
 =?us-ascii?Q?GNQkD1+EasASe4FId/y1ngyZhlDxIXyuGYcx220G+DV/OdJ7xORF4q4uN5UE?=
 =?us-ascii?Q?TOzdmoYqku+/NarVbtSa2Hdy2r38SV1MANpQjmPCbl51WfAGgNIj4baGOk+h?=
 =?us-ascii?Q?wLsEvYKILLiTpbLXm8++OmdsLVCYaL+oNIINpbTOb5V/1zAhrF3djdNMFQph?=
 =?us-ascii?Q?Vxt1t7SmcdmHgJiJANitPKiFwbYIpJb4jZS6pV0AX52V6jtzS9LxBP2JPOJi?=
 =?us-ascii?Q?Q7+N9pIkF2hXrCdMmknMot2UXaFP6fHA8jl1hJLfw0dQ2frnFRYilZD9M4D0?=
 =?us-ascii?Q?+i17o3TkSBmVXeCJMZWBOF2N2mZxnjTRtZDYnGOQXk2rsFA3v9PexWG6fSB7?=
 =?us-ascii?Q?/lYOWoTlxIHyb5eU6Y/+NiwD8dyEszT2WeVRTv3ICP4nZZSAPwU6BcpIU7Yn?=
 =?us-ascii?Q?TCKf7WXdJP3T1EMqcrgPKQYdghQUr07rutZtgmJjGnMw3rDx5puXuyN+cgoc?=
 =?us-ascii?Q?lSg4q5epVXk5+RsNznAe0CLaaHNKJfofMZ5pFOQ4CxhpsJU06gj66QD3gGR4?=
 =?us-ascii?Q?rX6WRryGDsdYEYSafrQF56SXqjDJ/cUNKDkp/06ZGuHuUq1tWCOHxq7Pchc2?=
 =?us-ascii?Q?H5cGh/RiABiMLa/Q6hgH2FAMrJymr7s3GIMn+4uDAesLwFqi71lwqM2RFHbR?=
 =?us-ascii?Q?HPA/xQZiKmYiZUtrF1Qa2nc8M2RzclfVC7+tDGck8/1C936kt2XeE6pCHyMH?=
 =?us-ascii?Q?RI0Rzk9pTnmIegOCTdbdQWxYwyc5VSbZ5nSITQFnud/DelzqMQh9XIjfpZSB?=
 =?us-ascii?Q?g5iS1zYkqINW3ybf16nksAzaBbsnq6U0HGZGLnUzjykS5qTeYMFy6iELY6Dz?=
 =?us-ascii?Q?t/0abixUDN6zIkryiYpQql2JoDoPKVQ7iU3UI7jFeEXnvHQKj1knNtwXByU6?=
 =?us-ascii?Q?0HzBtD9v0jN+M0QA6f/lM3gYkCMPlVlN7pIcI28Qjsmm6fD6XdfDz86BJ/fg?=
 =?us-ascii?Q?PA13jFuxcZ4a6I/XdZmaVIS2YI/LUqXn0u7MOmT9R60vjK2EREgNTmHsdl9s?=
 =?us-ascii?Q?3GbcekU44JpXX4scB/CYRTdS3wdAz+GtJgA+LhHHv2xDm43gbiV5+stOSPi6?=
 =?us-ascii?Q?jLPo1CPzc0tzMRkkkrVA1gdE44hfAqiioLuL2tq60eekFjVkmhMX/buR6oTp?=
 =?us-ascii?Q?mXNttYDg+nfHTHg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8jR7Ia6mpuPsr02sHGTto7vPJZLGL8x2TwprtM8Weetud4c+r3Iphf87IUHW?=
 =?us-ascii?Q?grRJcIM0h5cAfOLgpd4vVz+e+GvbgDjYLgyCN9hBEYbUrIibrNDL0zSa7IRU?=
 =?us-ascii?Q?FmyHkBi35ap3FTTl1I7vvqcbpZ6lJak6litHdtfa0AEza6Qo+MG3LHx/OFhn?=
 =?us-ascii?Q?22L/dcBlhhf2W7W+WqJSO/qjNLNDBEzweGTKptgWyMqRiATQ1zK1kntAq2t4?=
 =?us-ascii?Q?eKkWcQqjNzNDip+miXrn6hPqNueN7WJx1LROIQ1J+GDoJj9ydSbvxVcg+hXh?=
 =?us-ascii?Q?7XQVJeKS+FujoQW+JtsNUvktjZvuLjSaEkVI7Js1no0HN9uTEbjD8S61FA6W?=
 =?us-ascii?Q?PT+t4SYDIWx1XCfcFj3aEECvupSGA8rHrw12JII2KV5kTe6R87AXykp6v4Gv?=
 =?us-ascii?Q?wvv43j0X0IUnUg3pw3g7yBVGVj6ai9N4SLciEs6Xveek99x4cbmbUfajc9tk?=
 =?us-ascii?Q?60LFN+62ll1Hb4iC3j4PBFg71XNPBIk9b+c+aeqRMu3RvvVs2qk+KLzUSOp8?=
 =?us-ascii?Q?nQHQOFv8YElpanMz2nG46cKvmWMuBKFO207GcydPB9ZC+r7NjIT4g31PaamW?=
 =?us-ascii?Q?EYfzrh+oL9OGGG+842jIkqR6fJW8IlJULVjxPq8uWd6tNHLiJxqIuMY/VOIi?=
 =?us-ascii?Q?+oQXIDHhd6yvYm9QSXl5cOLerQjWQV1xmwg0KeMqQ3lY/GIw3O3p8+In5g6O?=
 =?us-ascii?Q?hUnPjh9fZC5mTTwLZzcVqseQsnKMPIm48KeImcBo7NHJNTPDuA8Ii2XjCY/u?=
 =?us-ascii?Q?K8MtAl6jH34cKaj0fub8+vQ60qtttaN+adS4YsGxs0B5HxVnqYFB+ViNcCmk?=
 =?us-ascii?Q?kZ+cUrE2n/nZQqXHuUuld5Odl27y7G+a3Agewx+2o8Q9EHDn1/B/0GaMJdaL?=
 =?us-ascii?Q?cp4DGMJZoEGS02qvPLkcR0J41Edib1P+ivcBFOQ1G1vNTXARvvID+ntkur9A?=
 =?us-ascii?Q?Hd3nTPDB4O6EMSbhjuzSUBReIJiS/YQvi8yKg4FMRnqWqLOCTxg05APvSs4l?=
 =?us-ascii?Q?693NYiVML82CmPjLJKDCYtK+onQfQHlOTnKP3zQDoFJzQNZV3+Hu2sWbdsvX?=
 =?us-ascii?Q?MOuLnbGYfIIKLuk0plaIl5PTBnr6Qe0ywkvBqIMI/awXuCu/zT8A0X5L+C9K?=
 =?us-ascii?Q?10XRhz9rSuTId94nAVKxFq22iXELJU3LYiQPkKEv69tT2hm7NFhsPyg694it?=
 =?us-ascii?Q?fAxmerzkAQehGg4CVAUiZdp/X0PtV8PhN+EfSys0Vm2FB4MKswDIgluos3CI?=
 =?us-ascii?Q?saJxZpF5P9oEQipskzGJBOqG9AKdbYzOZaxkOq4BGYzRZ3G17xub2kVOlRQm?=
 =?us-ascii?Q?QDhRm1zjHSOBas3ugQ09g0LMROk4Ilxw/VftLxkbwRVtkMKVJeWJapiwJeZw?=
 =?us-ascii?Q?8uu5TFxOjkLzlEhaT5i8MzQhQkxn0Ray81kbogt4Dfa9tBbFKQ5U8X4GRRLC?=
 =?us-ascii?Q?S7F/J+AahIXt5SJfs25+dOwB/UUrlqzimTPtZFMWqnqaHdXM54X3HAMS1XWi?=
 =?us-ascii?Q?i2HYcFl2y47YEC7YzQ07YKenc+bhZnbtBB+Odyhg0gNrTqbNT3tbMw4KUoY6?=
 =?us-ascii?Q?u29JQoq7drA46dVLwB5vN6UrR5AQC2AOUigcZYaTLQ3D2BZ/0sfyb+GUOSXe?=
 =?us-ascii?Q?VmqPoh2xEKyEFmMf6hEgYHc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62345e75-bb01-40bf-d1b8-08ddf00dfcd4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 02:01:42.5247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JFiLowqJ3ZRH33hav8ezddDFjFGiIHik5ilIMqdlPtuRbxYsZDT+RZFkjPiTy/b5QBygy9P/f7Gw5rVjQ7dpJYGkyoEc6mnGjAlDvHsvsCEdhFf5AW8aNDcT8XsOTry
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8282

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Add support for identifying the R-Car X5H SoC.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig       | 12 ++++++++++++
 drivers/soc/renesas/renesas-soc.c | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 719b7f4f376f..7229f4afb3fa 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -39,6 +39,10 @@ config ARCH_RCAR_GEN4
 	bool
 	select ARCH_RCAR_GEN3
 
+config ARCH_RCAR_GEN5
+	bool
+	select ARCH_RCAR_GEN4
+
 config ARCH_RMOBILE
 	bool
 	select PM
@@ -348,6 +352,14 @@ config ARCH_R8A779H0
 	help
 	  This enables support for the Renesas R-Car V4M SoC.
 
+config ARCH_R8A78000
+	bool "ARM64 Platform support for R8A78000 (R-Car X5H)"
+	default y if ARCH_RENESAS
+	default ARCH_RENESAS
+	select ARCH_RCAR_GEN5
+	help
+	  This enables support for the Renesas R-Car X5H SoC.
+
 config ARCH_R9A07G043
 	bool "ARM64 Platform support for R9A07G043U (RZ/G2UL)"
 	default y if ARCH_RENESAS
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index df2b38417b80..1eb52356b996 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -36,6 +36,10 @@ static const struct renesas_family fam_rcar_gen4 __initconst __maybe_unused = {
 	.name	= "R-Car Gen4",
 };
 
+static const struct renesas_family fam_rcar_gen5 __initconst __maybe_unused = {
+	.name   = "R-Car Gen5",
+};
+
 static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
 	.name	= "R-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -266,6 +270,11 @@ static const struct renesas_soc soc_rcar_v4m __initconst __maybe_unused = {
 	.id     = 0x5d,
 };
 
+static const struct renesas_soc soc_rcar_x5h __initconst __maybe_unused = {
+	.family = &fam_rcar_gen5,
+	.id     = 0x60,
+};
+
 static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
 	.family	= &fam_shmobile,
 	.id	= 0x37,
@@ -378,6 +387,9 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 #ifdef CONFIG_ARCH_R8A779H0
 	{ .compatible = "renesas,r8a779h0",	.data = &soc_rcar_v4m },
 #endif
+#ifdef CONFIG_ARCH_R8A78000
+	{ .compatible = "renesas,r8a78000",	.data = &soc_rcar_x5h },
+#endif
 #ifdef CONFIG_ARCH_R9A07G043
 #ifdef CONFIG_RISCV
 	{ .compatible = "renesas,r9a07g043",	.data = &soc_rz_five },
-- 
2.43.0


