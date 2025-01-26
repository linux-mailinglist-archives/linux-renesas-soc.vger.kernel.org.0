Return-Path: <linux-renesas-soc+bounces-12530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A941A1CDF2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 20:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDC0E1884A0F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 19:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE9E156C72;
	Sun, 26 Jan 2025 19:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OqMJBk4l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5868189F43;
	Sun, 26 Jan 2025 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737918134; cv=fail; b=Sdry43o3d53CNmqObocxyCOJchui1J+leuJwD8WoPll97G29BMm1jv00TsqTR4cDEKwVEnbuo//TA4XWtLab19VErQAQoJPYQuR0WnU8zegb7RUnYxA8iK9oGtUL8DL7LRgpXvXXQwjliaPgznFnp4ipfLmPZun62aLuMmXM7oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737918134; c=relaxed/simple;
	bh=iZko2HiNJbnwGeNYdwitHDgR1aklWL2Vz+T0m9s4W+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tHjjHB54KygF6c5T48fglJY7TLl3/j1vtL/+7gJNWKG15BlcM7CZ45cM4+Yn26Az1IOUqi3FYOEretaERYoDZAVHxGnTK2vHLPlgWLfF2xgPMYqlyPJkdXa046fCTBqAE5yXLY87aFoX0/huzW6T3ul1+k4Af8ctuBkB2yfbAL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OqMJBk4l; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOHJb7cNmE41TRy3+iJ6zI9T8p9fwNXuU+3wrxg1m3RGaqa/WbxE0qlOsLIZCfWJyTUvBP9m7BxSw2aXTQJ/HPwmkiCBr8rtW+rddLLkBC6ywriR1P1HjXZ0ssb0ZkGreqEOPglq6eRswMQpwFpoxnOKS5akK/MbQel1LCJaU8JcMWU6Q+4AQ+FnelTgKDsmb/xD0dH24DwEYrTxyCGzFHQUwfXlPxsHAQdvn0ZO1zBrFu126MJsZAwflf2AoSg95aT3yMkTqHVstwbJqJCEHrfyalS2YAZq2Y8QvY71VtRemS2c6RwTBYdARO7FLtUwaybY2j/GEyU2EaFoidaF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f29rSqQbdlEBTVbfOc7i5cS0NWi5tX5bxfV2cUtbAdM=;
 b=nczOQAYusLjrw95cB6AIeGQTXqaZGNh5a/ZspPigX5ig8pWIZFFTvkS9RLNzBmGzvz4DmX44gTTeh5JYDzwlAMWtkbewty3xblej4+ttifoTuHZ/e4petHg6HiWGl4ljSTdcfksNo4zzRheWWgvv/8VbURNn9qilZGRjzktU9ZHnj23KjGtMddrIgffeyFMwAdozeXyfi4DWXbh4uyY8MNwbUZuoYWWXyU5JEcWczGxuIFF8jHUPIeLnl5ruKD7XJkpiYrKsr6SE+ekayjSkp7soOQhjYWGIAlnG9ZmFyFj0Th4kNDoyJ2q8t5M7og961RI5aF90vv1iAmzDe4BUmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f29rSqQbdlEBTVbfOc7i5cS0NWi5tX5bxfV2cUtbAdM=;
 b=OqMJBk4leI8RxRva3kXkmiRxu7XXy64YIfZITNjoJP6MKfracjJkCQdWPrEzKi27hMm2AJ6LIklL1D6kUqRAayKnDDFjiitPZjP1nen0L3T/GOl+da0RqLzM8Qkk2wCPUQl6FA2R/rw0Px3PZH/eBorE8tohtBJDC24bSWSAWqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS9PR01MB12308.jpnprd01.prod.outlook.com (2603:1096:604:2e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Sun, 26 Jan
 2025 19:02:10 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 19:02:10 +0000
Date: Sun, 26 Jan 2025 20:01:55 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: renesas: rzg3e-smarc-som: Enable
 SDHI{0,2}
Message-ID: <Z5aGo3trdNhXpa7X@tom-desktop>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-7-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126134616.37334-7-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::9) To TYRPR01MB13941.jpnprd01.prod.outlook.com
 (2603:1096:405:21c::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS9PR01MB12308:EE_
X-MS-Office365-Filtering-Correlation-Id: 941ce9ae-06bf-44c3-0889-08dd3e3bedd3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jm6pDMa3xKzkH4vl9rzOHlI/OXIn/DLRRK8uPdxei0AKLm7S3+nLljnpghJN?=
 =?us-ascii?Q?TPSS5UbF3Xw/jgFYx3TTinbT9HyunfE8amw46gTcQayEiO4R1ADy93flGXYi?=
 =?us-ascii?Q?YKXivVMsTAmOx5SZE5aUp5Q3itFlzxHZ/dSaQgrDDF7tK4IKcRbu+8i/sutI?=
 =?us-ascii?Q?q6wWBINlTyLGyLhYhBNmfx4fkVgIq95Co/+qbgvDL+7SnLygZ2ZX/er91VU9?=
 =?us-ascii?Q?yKUwH6M0jZXgid2G+mS6r4Vp2mxz/cpuAq6aNiCOVxKLRtq1hHxS8K7V/sts?=
 =?us-ascii?Q?vgdwciLeS1aIhg/5b229Qy8yev0uL+AeEsjT+tnoixA/TcOGrfD6q6knz1KU?=
 =?us-ascii?Q?81sjQTikONu0HcAVNk/bnUJcwMkDTUxqsf5kFKe1mpyM/cmiGCIuVEmuacnY?=
 =?us-ascii?Q?dOE59/C6n6zwQXDEPDeznfxOwpK4hnyIkj2jpIYtRHNXtClGkUoiqm2hSX2i?=
 =?us-ascii?Q?GP5gbeBI6UanhzZOH/4sstrOZp6Cq4oDpwrBdSHGmCTx5W/X8IlUgP8W4bti?=
 =?us-ascii?Q?IuZqrvbiegGYk4aLZOh3nq/GRvRUSLrw3SS6Mx8088qaClwckA2ykkAgK29O?=
 =?us-ascii?Q?kn6kodUFs1R/aIhZCMIRDAoCoUSii1H4LBb8b12mLRmDUJFcJYXOXqGOIXTz?=
 =?us-ascii?Q?SkN2Dw8vieca6wfp2lY8ahEqz3XIXa7dHIdpDrV03f6in9JJrUtMQC2+Ohr5?=
 =?us-ascii?Q?G9zHQWwZJCKecPg06HxZ65r8GBh4PkYeMaKgsmvBfW/BSaU0a8Vz4qm751oZ?=
 =?us-ascii?Q?UKw7LIKPQ2s3ed1xsxeGly7ybE25hVeAla6AfVI/YDc3loyzyUg9fn1UQIjp?=
 =?us-ascii?Q?wngDndXFSnpGjjtTzfw7oAi3mBYX7gLK/oPEWZ38YQJbypufDUYhnF5IVjfH?=
 =?us-ascii?Q?lqSyCzzhENUCpDsr3oXcm29lvlBQ/3RBwX3SHKBh91TKk1VuaF21Ww4RcEz2?=
 =?us-ascii?Q?rvUXvKWXIDwEaePmCDWFjqyPtj9VH1WJIXbepRU9PLcBBHA+cchT3/XVtLaQ?=
 =?us-ascii?Q?tKhP8dZTDyzT3RoOZsrqXCHpinuzNYanUwtjJAbwj9V5a3hamUyHKUjGuAoU?=
 =?us-ascii?Q?6VVFL3OEHfXusLhUkHpQXLlva75x+gTvRMWPTAOC47giP0wlbYRKWRNQ0JtC?=
 =?us-ascii?Q?cCE3OqE18W3T1CMrwrkYFYk4o4HpQ7efqnZVICoJxMvwxuJjk/XWWn4VtElz?=
 =?us-ascii?Q?7hInxZKRp3+2GniGPRnMV1lg62ypOMydaKhfUpkYt58z4TxiGM2lWSvRNXEb?=
 =?us-ascii?Q?UxCOdPtC4tqpSFiq1z84ysaSrU2Xl8oY1xDofIKER1HAk5jIYgyG+ReKH3MV?=
 =?us-ascii?Q?RyCyjdxYfDb2ujp2S/QP/gANkoaOpKTQsx6nv2mTJY681gb9kVyhIiG1qb5o?=
 =?us-ascii?Q?w6KnygKTrsbmrs7AUGOTfOhDGIQvJbcP90vJzOsouNGHnNYj1jX3p50nVUgf?=
 =?us-ascii?Q?88475BwDHWqTyubXwIEhg3fcbvFHkswR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s1G79J4vzBZZdsKPwpRQBXe0CHQH0ZmX4piOREG9TfjtLv4zBGMLsIr/CZZc?=
 =?us-ascii?Q?04XZqvJVvAXfSL4H/3VuBHetoccIzh44BUGPFQ18M19crZsDP/WDdb5VDEGg?=
 =?us-ascii?Q?ku/+4Ksl7u55THTlPNpL/EUMSxjhOPyO+XK/a/RSklKxrzZncKu9VRiGETT0?=
 =?us-ascii?Q?HISw+612hVEBfdJwymbTpXFZHmHd8xxaMmZk10v88m+IGdvQnWyVXFctAvd8?=
 =?us-ascii?Q?Ge7sYTLsTaBJrTEQdQQ7u0tgk2NqCJGAxv/zpwd6CrjU31wJZUeJNL6GXYLI?=
 =?us-ascii?Q?6weZj/pS6IRb8BG0AWZGqiNfRMYQ4xh9M/pypQfgyiovHRJMUD64fk2uDnIm?=
 =?us-ascii?Q?kAlGsUP5+udMDACYZl1AYt1WTPh7t8SSwLF0YqClQLCLfVIV/g7YsPmexu2A?=
 =?us-ascii?Q?sMWiobeFSnnrs2Ftjc6ekuw8EwHQo/ifZN+IexeBaCaS0K3FrcJIZc2hDrv9?=
 =?us-ascii?Q?Q5pLch6tLxMZ+cCp7ONMbf/m42pNqE7OqEANRLwJAK+Cg4kQHAvrCxc7BjhY?=
 =?us-ascii?Q?fva0F1LYSt8NBU704QvbeWjFYU0BYCt0Vb9QSVM+VOaZQja+3DYlzjhHxX0Z?=
 =?us-ascii?Q?XphxGIZMN/kSPM4gsX1E5MghYixfceXSTUYzwBsx9mxPhIXv/QOFxCTD4xZx?=
 =?us-ascii?Q?wOn4pBX+TNshlCiWd9otHZ6k2dZQ4qG+lno9r2lZVeAh/vt7JGgdpt0WzKmw?=
 =?us-ascii?Q?Ek4ZRThSayXK188DYA4vStRvDm/JJlnRy673oMnZvX0Slh0FlBt0ed7MfhwM?=
 =?us-ascii?Q?zC5YGdEzTp3CM47KQ2+T1p2cGFuetvl0WLDzelShAAYf3sldWfsrm+XPSj52?=
 =?us-ascii?Q?ge3KcMwRb4qTD2+jdc1HsnsIHt9ySSMmlykEWhzfbLJMC71MakfZFXUsjK03?=
 =?us-ascii?Q?rAZw8dbe8LyV8FmX6XkpFMYv5kv12cDZUihGm+MrYcGzjtjQeDRbIB0J36rZ?=
 =?us-ascii?Q?F1DzDQNzBEVJ96zIWUx3rXmjHs6mt8RLaAocTFko+/mhDie3sfk+rCPPYvdv?=
 =?us-ascii?Q?xkZHCvunoDuux1RkJzryY326djIMIqCPoPuxMnqghd3lv3Pxa2sFJ+aDCPHX?=
 =?us-ascii?Q?Bny4vpfniDVyBnh3nlAeVRMEo4NsLmRTN3spHgQ+qGhpRPPl5dKDtO+YZKyQ?=
 =?us-ascii?Q?YC/kHWc7LNse9cfKYhlhP8OJyLBnhyyAbjTL6n86DmrlyVaeDIjUf0j2jaoc?=
 =?us-ascii?Q?zgPeKSxpDRhgG7n4CL7js6KeTxytJeY479xdYo4hsA0sX8ggKB1+uppcWWaK?=
 =?us-ascii?Q?NMoeCHuPAet6UyRLzqHSE0KJocxozm9Bkjl6Ni6JmbXMu3LY+YPtPa+7eRXo?=
 =?us-ascii?Q?BA2TRTY++tRKSwEisY3LCKLC+809JEi3P/Vt2S04nBSQvZo1ncamMYrmLbhk?=
 =?us-ascii?Q?XvrG3ZiizDAg7LDPXmqb44oJJfBB5cFWyx2sC4/FPa9wFKdEOXvaUbBTet48?=
 =?us-ascii?Q?MqywjSfYAAxv1p1pIgmW0w1KzwFeWu7Oxa7Ry9C2v5v5yz9/VTtKl10OthdH?=
 =?us-ascii?Q?NSRak/CEIIsbE28nDqEElgoFiX5M4rGWovdkvW7zThE3Kt8T0a69lSHeZYWE?=
 =?us-ascii?Q?PVx3J6ZRtRfV243FgkrxPpjIrRTGpAEWgGGOOnvcS533cNP9j5On37Woh92L?=
 =?us-ascii?Q?kMWLin3DWjoQIx9jUC2rfrY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941ce9ae-06bf-44c3-0889-08dd3e3bedd3
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13941.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 19:02:10.0137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bysu/dFytWdVW9Svrn1583oECTlNneZB8FIdjd9tVi6qYMqR0I7CkZK3kS7RFvaD8suWakSaoJABtpyvcgbEAw/fjb+Ozbesmw8LG1CTfeXzfKDI0Lw7hPV5KqgXy9YK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12308

On Sun, Jan 26, 2025 at 01:46:08PM +0000, Biju Das wrote:
> Enable eMMC on SDHI0 and SD on SDHI2 on RZ/G3E SMARC SoM.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> index f4ba050beb0d..81f4f738482b 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -8,17 +8,79 @@
>  / {
>  	compatible = "renesas,rzg3e-smarcm", "renesas,r9a09g047e57", "renesas,r9a09g047";
>  
> +	aliases {
> +		mmc0 = &sdhi0;
> +		mmc2 = &sdhi2;
> +	};
> +
>  	memory@48000000 {
>  		device_type = "memory";
>  		/* First 128MB is reserved for secure area. */
>  		reg = <0x0 0x48000000 0x0 0xf8000000>;
>  	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>  };
>  
>  &audio_extal_clk {
>  	clock-frequency = <48000000>;
>  };
>  
> +&pinctrl {
> +	sdhi0_emmc_pins: sd0emmc {
> +		sd0-emmc-ctrl {
> +			pins = "SD0CLK", "SD0CMD";
> +			renesas,output-impedance = <3>;
> +		};
> +
> +		sd0-iovs {
> +			pins = "SD0IOVS";
> +			renesas,output-impedance = <3>;
> +		};
> +
> +		sd0-emmc-data {
> +			pins = "SD0DAT0", "SD0DAT1", "SD0DAT2", "SD0DAT3",
> +			       "SD0DAT4", "SD0DAT5", "SD0DAT6", "SD0DAT7";
> +			renesas,output-impedance = <3>;
> +		};
> +
> +		sd0-emmc-rst {
> +			pins = "SD0RSTN";
> +			renesas,output-impedance = <3>;
> +		};
> +	};
> +
> +	sdhi2_pins: sd2 {
> +		sd2-cd {
> +			pinmux = <RZG3E_PORT_PINMUX(K, 0, 1)>; /* SD2CD */
> +		};
> +
> +		sd2-io {
> +			pinmux = <RZG3E_PORT_PINMUX(K, 1, 1)>, /* SD2IOVS */
> +				 <RZG3E_PORT_PINMUX(K, 2, 1)>; /* SD2IOPWEN */
> +		};
> +
> +		sd2-data {
> +			pinmux = <RZG3E_PORT_PINMUX(H, 2, 1)>, /* SD2DAT0 */
> +				 <RZG3E_PORT_PINMUX(H, 3, 1)>, /* SD2DAT1 */
> +				 <RZG3E_PORT_PINMUX(H, 4, 1)>, /* SD2DAT2 */
> +				 <RZG3E_PORT_PINMUX(H, 5, 1)>; /* SD2DAT3 */
> +		};
> +
> +		sd2-ctrl {
> +			pinmux = <RZG3E_PORT_PINMUX(H, 0, 1)>, /* SD2CLK */
> +				 <RZG3E_PORT_PINMUX(H, 1, 1)>; /* SD2CMD */
> +		};
> +	};
> +};
> +
>  &qextal_clk {
>  	clock-frequency = <24000000>;
>  };
> @@ -27,6 +89,33 @@ &rtxin_clk {
>  	clock-frequency = <32768>;
>  };
>  
> +&sdhi0 {
> +	pinctrl-0 = <&sdhi0_emmc_pins>;
> +	pinctrl-1 = <&sdhi0_emmc_pins>;
> +	pinctrl-names = "default", "state_uhs";
> +
> +	vmmc-supply = <&reg_3p3v>;
> +	vqmmc-supply = <&vqmmc_sdhi0>;
> +	bus-width = <8>;
> +	mmc-hs200-1_8v;
> +	non-removable;
> +	fixed-emmc-driver-type = <1>;
> +	status = "okay";
> +};
> +
> +&sdhi2 {
> +	pinctrl-0 = <&sdhi2_pins>;
> +	pinctrl-1 = <&sdhi2_pins>;
> +	pinctrl-names = "default", "state_uhs";
> +
> +	vmmc-supply = <&reg_3p3v>;
> +	vqmmc-supply = <&vqmmc_sdhi2>;
> +	bus-width = <4>;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status = "okay";
> +};
> +
>  &wdt1 {
>  	status = "okay";
>  };
> -- 
> 2.43.0
> 

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

