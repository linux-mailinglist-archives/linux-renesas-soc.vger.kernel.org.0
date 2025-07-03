Return-Path: <linux-renesas-soc+bounces-19060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E01AF6937
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 06:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EF854880BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 04:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA5F28DB69;
	Thu,  3 Jul 2025 04:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ccj+TcnO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FD02DE6ED;
	Thu,  3 Jul 2025 04:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751518346; cv=fail; b=OCZsk4QB+nF348KHyrxXGsGSL1on2/frhCVPLdd/uvbUPrvh3boEfhze3c598EFWYN13gNFoVd7qXV+Q1zNU6k+Xh17aBI94cZ77hZ+6ZSe5sW2K6TamJfzxKhxNd/CtI9o3n+83uFJ1cNFCSnC8dR9Dcbehxe/8MzEAyCf14jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751518346; c=relaxed/simple;
	bh=emUW5yox0a5ngErUY9C/XgbTREBijzJhhgokZgzNIc4=;
	h=Message-ID:To:Cc:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=X4jaDseRh9VczV4rGs5Yzt+5t72kBHLArvzU2CzEfm4eNBIdQGbkwimqHcfv7Vkfyl92oDZn2FNXsW8xI4DTbnUa6XKmATSXu3bLAPJnQHooKp3ldF4Rk5U8KquU+1jw0+dqY/l1utRL+6JvUWlGaYXYWgpcqxiQhPBZHJUmIAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ccj+TcnO; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VufwhSEZqGaa4YDD/JfApOdMBxle1FP2B8dXTTkfIFXaaHgGSCMwdRMlYFR/oZrvBdbcxgf9nenCeHARelKfBoiyPVTdoTAh+4x6TFyEe52YKPMJXp7rd4YzLdSZevCj/wimVRBi6BCF3APDhB3jmLjmbnIzS2qBR9fOaCltt3WaW+lmYQvdUczkCL0Phstse3MG2j1aolFWAOp3BBP5bnzIHMHrK+oF+NNWgDFhpPe1Y4NIkJQJVk6qPhIEqqcJkxFbjzJA0q12FizZCJP6J3f6FFQMGBEyHck1CoTDouoGR9hxI1VAz/Zxrz6jtK2AX67bx/j5rYHU31HHmoreRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjj9SbVjg6BRx+GjIneDkjZA6UuVYFrQM1Ez0y0LfmQ=;
 b=dmg/3d4l2AATKjuMyW1r+41mpBaVBnt1QdBFWg4wlAcFNzbEskPnm4VMS23VaQuX+89GemY4qHqbms47xjTpnU13XfyO76WBRNvRDmbZnHaNd17E6uXUPmb037ycLoFcVYQoItqoHB4FiG1jQj2Shq217RllzkWHB8TihvSc7DQUwTpXlXRaMupLfq9gMQpSGKS1BBaIYOhNhDOGtV/PvzSbIKzO95+PexmUy7nO9aPlJNk61+DmaTi4dW9wandkQ87EahOyQZ3Qi9jcJLDfx4ZV+jyNHIgjWd7V5QjfSWalwjbmIJLwdYdcymHkUyhkE5rVLi/e7k6/SQSfn9LdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjj9SbVjg6BRx+GjIneDkjZA6UuVYFrQM1Ez0y0LfmQ=;
 b=Ccj+TcnOU/N1rYoSQ+J4HxhWhG/UmjcVjsH6l35M+5tflsJQnYoLu3HVLn6L8bHhTGdUTFIhh3/LBWWbeakP5WKwq/zEqoZoMWnjvzFrOIjVP3YB7Gew9j3P7vL5vHYRQmhxz7oM5t+vTJgP5L22bgCP8JeeEROK9Xn/irarryk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11884.jpnprd01.prod.outlook.com
 (2603:1096:400:3e2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 04:52:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Thu, 3 Jul 2025
 04:52:22 +0000
Message-ID: <87cyahdgfu.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org
Cc: Nghia Nguyen <nghia.nguyen.jg@renesas.com>
In-Reply-To: <87frfddghg.wl-kuninori.morimoto.gx@renesas.com>
References: <87frfddghg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] serial: sh-sci: Add R-Car Gen5 support
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Jul 2025 04:52:22 +0000
X-ClientProxiedBy: TYCPR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11884:EE_
X-MS-Office365-Filtering-Correlation-Id: 6134f7c1-f13b-41e7-1d1b-08ddb9ed65c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3zOUEi6UTvAnZCGt/3kX1oux0Y1P4kVjPRxI+hWiWPWay4oTIt3XyFiD1nbT?=
 =?us-ascii?Q?gijL80rk2IUqdVV+wBoQWSudQEBLdyOouQowBg+KB7OQnK+PN3yEgjskTCyW?=
 =?us-ascii?Q?5LW42ffUIc4D4wIZRWEFAVrRN1JrXyq6SPzD1qH5q8Gomyx/aM+P8OAqNhKd?=
 =?us-ascii?Q?AXFE1VlE9JJx/YZV7n2G6ZWL9JJNX+ta4qEha/7D4+9QN51szZWMJE1/thm1?=
 =?us-ascii?Q?5cloDENh350dJ2M9kYn+nwJtidX7kjsM535oq0KpcDnvJ5VTKTh4siLl/vpb?=
 =?us-ascii?Q?XrlRlRaX0V4SLS1hkSTNC+48RPk3D+7grf7fAaLfvXCqURKKqMWWntYOjgWU?=
 =?us-ascii?Q?fkHNm/vmUMi4W/PSVKSeAIm7HZIBB+rwHdhyfucVOrAg4xADbqgiYODNshnX?=
 =?us-ascii?Q?pfcBXTzZydC1ClXqivW8i6OYzExQY5OC42VsbPY3p9aahAeV15gPrAzM33FY?=
 =?us-ascii?Q?F+7OFyF0vLaWbtzR7P5cbdKtHduYgjJnrd325rSOZOsNK9FsVGgSwhPNO9AE?=
 =?us-ascii?Q?lfQWmWyK4eciY+5hWhEMWaG8FzTHa5qRuY6h3eea6JsHOTqqsNoBfZrv0Ulg?=
 =?us-ascii?Q?fhYI0G3NKP7kFOJBp4c9A2pnFXHP5zWd16W4Sg83xAXVn/0dYTX7FRDvuWid?=
 =?us-ascii?Q?IIHj0nft5f7DKx5rfDWYGPqHNZziaIf97Hor8ddHOmZZZpzbi9A9AMpB6B/H?=
 =?us-ascii?Q?sTllRcIw3hiPAV0sToyB9LDWiu8Pq62vXLYp/CpK/IxpFOe1+mvSdJJhvUT/?=
 =?us-ascii?Q?xWAAE1gPnKDMkdXdS7uHu9cs4ff36CwqeZVBEzRdg6Bo5iteYkludc1GaU3c?=
 =?us-ascii?Q?hr6lR0PIjoUEjEiC6fvAIOlPot+xKwyPWaMTvStPXCahQV7Iu7e/SUKIvEr7?=
 =?us-ascii?Q?y42z5qccowSSj/drAHXqjP7g1YQ8fKYeGTr/jbtV4UQu/yzNNuSPNSFheutB?=
 =?us-ascii?Q?6O0PiIASl7DkeBzhyQbunU/9K4lISElFVPHW7NAT0bFU6L2P2icZQsDrDjyl?=
 =?us-ascii?Q?mOM868GRmklP3MjN8t9MtJr/amSM9qviE08+E9043kHkB7Fb9IDqoIzwttH1?=
 =?us-ascii?Q?7P8gWK1jo1DekIw3W4HawV/awU/wmTSV791eWr9/S1+zNmKaNUxFC0By0vf8?=
 =?us-ascii?Q?fCXnzUcH2OML/xRIVZzQ8mQP0JnxaPYCUhozy9K4EziHhMAV5S+L3+sXtUMA?=
 =?us-ascii?Q?7XVyjqLdHgkIjghCYlyv/STQeNF5TafC5gB5glQC5WjCaL9NADotFR4HoZK3?=
 =?us-ascii?Q?7MjByxsfPTVNVEGMBwpASqRHm6yT/mNp05GrR2A/DtwS69DThvRKLgmrVAwE?=
 =?us-ascii?Q?yqehctCh/L7QWWM64ZIaBuf2CSxdoDyfOZeJVuUadw0Hoq4Bo+zTv9sXoqaj?=
 =?us-ascii?Q?Za7j8kUCO7hPhdL6dwXEXq1IVdfKodjbTI40ZHl+zYeoQHb/alhPNS6KjmK2?=
 =?us-ascii?Q?Q+eU96cUhX5BBGNQfPqd+AlhgpZb46Cm0bB7+MeV1zw5UJghSzp2xzVUitWS?=
 =?us-ascii?Q?fKNE/OtBLDA7Qmw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Im1dGb+cwzVM7urTBosGO+JXVg2IWccEMlzl+CabPo5d+HQeImDeNxxgjn5S?=
 =?us-ascii?Q?daBxsd4VPT5khyaFT8bzY0pCGhre0dUwpNvV4JrbrPGFnLll6b3NmjhqVY25?=
 =?us-ascii?Q?NPVCHcJhoH1J33eICnZhfk9N9XCflLUvW9o7VJqdWX6T/eEMy9ReDLu3NzTG?=
 =?us-ascii?Q?b+AS4dXByl+hMtT0H8ihkV0d1bgqS9bXHPB96l50cfTX0+JHlDaqg9w0os4i?=
 =?us-ascii?Q?eFvjbJHfGCeXbrfVBkrhqRpKcp8kFGyEnE6HcvAujGV9iWKDjQE6wenan3np?=
 =?us-ascii?Q?icwz7lcRLcgRMpe5svEhipbbZ6QzTPjupzUN0vHuxfQVwFF/GL8TfxQMnIgY?=
 =?us-ascii?Q?ww4Hg4qX20VBDLW41jp9xVZHYKyCIB84tq4/QyCDHHTR1DrYZvreiZmlPFRe?=
 =?us-ascii?Q?XsJfZHl2jDIfZdao6yPh1w84MJeoT9RIPZJIlyQ8RdoyopdsEejkD9GOpCLR?=
 =?us-ascii?Q?cOYAm1BfxjU7PMMZV6Sp/ZAUgf/RlcE+7HIAI2WfxGK9e8hVJP14EU86dj7z?=
 =?us-ascii?Q?1u2L8y7zVCa1hCC7GZaWovDXpD5cMJ/Xy2oINrU8sXi8tjnQbhRpa8W8HEsL?=
 =?us-ascii?Q?1Enttg/WP6Hzf6573eY2IInWY63JSfCAFoMX6M7OOAi0GVVA7p8oXw/8UFVO?=
 =?us-ascii?Q?lB+Z1nZ4IsJzYcLbWvvjfOAb+TGyoMCvjfD8MDRAxcfj1w2odYdTTY22hW7P?=
 =?us-ascii?Q?MmxwzyExhXyLo8DQkrrxq/UTeoqtBuT615OZG6dxabCMVQzUgwhp+ajBFEVQ?=
 =?us-ascii?Q?Qlrjs7qv1JYJftSuRx2UZAfcELTDT1DGkP1mpDgbPBrQN3XG4bl98PZY0U5g?=
 =?us-ascii?Q?QK54BpR0c0lMX5ougqGk9tuSgrVUTOjkqklF29m3nruOgo4iA1FRBiIaaG5u?=
 =?us-ascii?Q?AU+aLK0ATFwwh3sxwjC1nROsKhmxYbDBgi2a+nSjvaVqdx6rGt5UTCGAUYmY?=
 =?us-ascii?Q?IXP5FRJzY3nhcNPO/2GUMu0xllvwkm+nK1oQ4/7refO+qtB/EIyoy3APULMR?=
 =?us-ascii?Q?0Zgb9t/4UNjPgqSzbaxsarN+cYpExjq01b0bwL5g9WM0p2XQFs3nSIk/11vC?=
 =?us-ascii?Q?hHNoGf5PVSuR27G0cMwX0DGzXTvCFGb5XUUAOEYd9tQOUgzYA2QG1/9EQMz3?=
 =?us-ascii?Q?1tyHWQV2mmHqqrHWSbqUYo0G/mcihSdN8ySQIeoxBrvr6LEn34s4GP0b/hzP?=
 =?us-ascii?Q?rtqO6TLxk10JLO9aVHhJdGlpP3l5fSkyX1dqNA5zI9kFXF11LuIb+rGNuOR2?=
 =?us-ascii?Q?NEJI1LD4JMJpbsiJiCawz+Zoy2bnK52a97BKBk/iouJQuhZe87HHsLSaz5YQ?=
 =?us-ascii?Q?cuslrPa5rWs06KVSPSvA1acK8pVMXgSrjVJ3AUnhwH59qOnlW6ZhgBpz+ZXs?=
 =?us-ascii?Q?/Omq+OiDgPUk/bHNJMPCQbvHFh2GgWvgbYvEU1FQa/36bqxitOSGYos2DfYS?=
 =?us-ascii?Q?MDyyPOymxkRIPhwRJK6WnVnzahTKctrGeVmJh3BN3lFjhSBAsxZ6UYP2quPf?=
 =?us-ascii?Q?KYNuiygLwBvHUtYRASdowyMug2B5Nbv4hXi9NHhlpfjrHn8Xg2jK1IKZDehZ?=
 =?us-ascii?Q?9/MdCJZsclAXOtBacE0J3fqbfp1s9x8yyzHagipADo++suoLUqACRF424oEF?=
 =?us-ascii?Q?iFjXX457EsJ1t2uxwJI2bM4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6134f7c1-f13b-41e7-1d1b-08ddb9ed65c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 04:52:22.3768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5jGcO+RRZ7A4nKXk4FYb3pRjf5cMDT4Ui3aA3V1BMERc+AKEx6JCeSYdPm5gOEjaikyY4QFLrgSlzp7Xyp4yJuzJRx2YMBreeMrYyAeldf3b6fncguMZk+eV4aEBRxm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11884

Add "rcar-gen5-scif" compatible string for R-Car Gen5 support.

Signed-off-by: Nghia Nguyen <nghia.nguyen.jg@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/tty/serial/sh-sci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 1c356544a832..06d674a744e2 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3437,6 +3437,9 @@ static const struct of_device_id of_sci_match[] __maybe_unused = {
 	}, {
 		.compatible = "renesas,rcar-gen4-scif",
 		.data = &of_sci_rcar_scif
+	}, {
+		.compatible = "renesas,rcar-gen5-scif",
+		.data = &of_sci_rcar_scif
 	},
 	/* Generic types */
 	{
-- 
2.43.0


