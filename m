Return-Path: <linux-renesas-soc+bounces-26164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B2CCE7415
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Dec 2025 16:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E10493013945
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Dec 2025 15:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86863329E42;
	Mon, 29 Dec 2025 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VA/TWD8A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013030.outbound.protection.outlook.com [40.107.162.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64C6F06A;
	Mon, 29 Dec 2025 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767023484; cv=fail; b=TSMd1ZiwT5KfYb71BswxdHwHWtl2nBZzpyrTNr9BPVPU5Pujemj1cEeX1kcLjFI6gZX1xF30GP4Vk0PD3i6M+iEElvtncN+HEFhVC2+cvrPMW2CX12fVneFIByPSPj3sqn4+QGTIt62Gg7GTkM5KI+NIld3oqJq9pok/b8ZEvEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767023484; c=relaxed/simple;
	bh=lwSzo4KMH6UkNyNpp796vu4vFlW7W7EFD9XgCFmiYLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bH34UZuuXlTAM2xhVEP9GAqnZSDhwprDaMBM6+9w6H4f04ORknCXcHZGqC6ZERaDiOKhqRZ9sbruIn+G1UrTqXwy8YxkKqzz1VzwVuHDRnJTd1AtYc5I4exd5eRiHxVtKM4+WjOXKbPUWMpUlWFy+91zpFE107tMFJEP3cXiwa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VA/TWD8A; arc=fail smtp.client-ip=40.107.162.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+eufIfgXsxSlsxxHqSQafNJaW2936q6IDi3kB6JKl04/KytdoiCJQh8jTioh+dHl7Y4oVVGXteXY2TPjr4vjLkNjoyXw+obLf4y0LWxLLObX4I23pGJ3L665vfr8Xo6jGJnyuXN/EoQCFBpqjZc6c4jc6lHn+RJ1qsNWjuSzvHW8Eok4BVaOLfogtjetw2ZmFlkoML8rFMSJjBVcOOn07sVL1d4PBDrQmtcs+MSTQE2YDT4TBj0gzkI6KzL9UMSmbZ+IIQNA0zUeGK9WD40jScs7jBXUhw6viQS5ymvQ++XjZNqk3hWtLqwKMEUCtBwTksD914R6kVFTawH86cODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVMhx9bn85dW21nz9y5pHJ4vMS6ZsEYt2VWsSKgvb5Q=;
 b=BQwXwX7KjVnMa701YMpxa1GEzM8DO1+vHNmLhQybluHSyi02sy+LulnhP8UjZGhjoPvwOp0x81pHkdC6BXHJiFTX73ssnQF3JrQkeEge7ZUj9s7JrowjAdrAmsAM+HmVgGJIDGCMvS+eJziB+zs66cz+9rTP4cDdRGaGll6ZI6kfbTvPa2EynYjjzvtAHsCh2PVBD7tw6sQl5+lqGNNjZ1IsvNxphPJ7FOA20niF/jttWLA3IyaS5F3bTJDBlnqd7L5B+NMofIR0fEi0+hEbPE6ryr2m9i960PKKWksz6XzlTsJ95Ju/R38CLNrmditwRwYg+ji7yp+q6ptL0eatig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVMhx9bn85dW21nz9y5pHJ4vMS6ZsEYt2VWsSKgvb5Q=;
 b=VA/TWD8ADLoEuHAksN/IIj3OmXJEtR/Utjclq8JpnXgHIbidFT1qnE9Ais8BWHw0QTfbU2CcsIV59+D/rqIj5CEtpZ7/qOZnLj2syZbUGJvCtc8qZL9LTDYiZqZiW6X6F0vgLhFC3jGauz7DvJGwF047tkWvpQUNCEkULSAl1JcbG0vePaM78CLAUZxpmv/9FhEjK04Z6TauiWNuoiFzKGUYYkf/k+9Z9XgTJpkxvDrVYHMWGhXC9KmvrqeAk+dz4PWHk6uFmBjGWjNUEoshqS9vnL4YAlNFemKEO9DIR8bbELvqmGwVcL0RPQ7G/fWsq4//lVSUDSoBhniQxEN63Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DBBPR04MB7723.eurprd04.prod.outlook.com (2603:10a6:10:20a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 15:51:17 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 15:51:17 +0000
Date: Mon, 29 Dec 2025 10:51:09 -0500
From: Frank Li <Frank.li@nxp.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, wsa+renesas@sang-engineering.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: renesas: Add suspend/resume support
Message-ID: <aVKjbYTLcptpERZW@lizhi-Precision-Tower-5810>
References: <20251223165409.746777-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223165409.746777-1-tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: BYAPR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:a03:60::22) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DBBPR04MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a72028c-ae5d-402c-2042-08de46f21a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YhKV7PFN6dRO6SYtQLFSX34SRdAaQ356TpOoaRcLq5XIW8OmVjaXn1jvqw58?=
 =?us-ascii?Q?fm41L+YbZNmq+RJF87s++WqffoU7HmXvbH0b5ch0ZMfePJq2RPVvMtGjNvsa?=
 =?us-ascii?Q?m8I2xW+q9yilYXk7oYlOfSKulqwPq19vdlL4q1ROw2EYtVxCevbI/0Ll5bk8?=
 =?us-ascii?Q?F7cOtDbZU8mj8EQTKqc3cXZcpKtuGz/9p8MxiJY3yPAr1UqlfNtHz/4b/JDV?=
 =?us-ascii?Q?rtoEquxie0LgEhzTEI3NyKs1wOvJP6hjp5GyGnUfAAcZLneZ70Tg8O38K01g?=
 =?us-ascii?Q?fZ9wAwtFvYyHGlaKCWhfWWDucURgIUrAn3B3NOK/PSk+zT7xcj7l4+wSMEhO?=
 =?us-ascii?Q?e2YxxcJmdJKPgqHi0Y0J7YkX+6JreliEGOTCIpnYG7vEmMX7+Rt7u18JZMlH?=
 =?us-ascii?Q?5rTx7zXQ8k/KfXY6Dp7LPpu1s0fQ5D7r3YgyZnJ+3dzW82w039r+KMPzW1h0?=
 =?us-ascii?Q?hg84UL8YsDIWWZKt75j6ctLHd7WEGqGtulWGJmjiO+czleJrBNpar7QbIrA1?=
 =?us-ascii?Q?QfDQtcHV7YC9CSZdsSK5pwB8a/UdQvzVoNccIB5uMXFjy6BWYl4palMozLdM?=
 =?us-ascii?Q?1g5ApfjwMVemeg6fMsvIxYLNr0mr4VL6kFwVKS4D3G/sYBgr++RT6KzBui9P?=
 =?us-ascii?Q?/GMIot6JIp9DHVkKfK2bf9pEmPidrhFuPeDoNRraaUFWxd2CLqhIUmSwM1+I?=
 =?us-ascii?Q?NWvx8Q/Yr3IoxV4WUvsycnQUcp99lFcvHF7Xd/zAsPn1kFrMp5uUrGJEkv+5?=
 =?us-ascii?Q?zzAbmMrR5CZ4V2nz3HKqP+ACDbJ9imDeya/6kmTDRfYRjX6gNfrifN5I1V4W?=
 =?us-ascii?Q?lGk7dMAGxFlz7rRCb/6Sedm0qgCVGFqKcWJwSc+1dIvW0dy6JWkfH8IVNYso?=
 =?us-ascii?Q?W3mgcH7jdFSckBHIlEIzAyO/EfzfhKZClPK0VKhIjbqhcc8c4UwuqrLMNLfS?=
 =?us-ascii?Q?oZpcHj6lzo6Fts+5kJJMGjZhX9gxqobyrRuh9e5qSKRmTroBx8Ip4szc3RtD?=
 =?us-ascii?Q?SoUUx/u40MZRmyM5SuqNbNcCmBJmYl8Xz9a74wboC6H8NwH7oWpk90WTkYhW?=
 =?us-ascii?Q?ut0U335I0c6XO/WlpTg3Ff+Fp3NI94JWRCQ/o2SIl+uKz+6SzyywQlOxV+4i?=
 =?us-ascii?Q?yACvidpgh8rhQhYosm9EQKbcUwYGm6xfUwsZiS8bW1cx1q9Avix1UBPuQpjz?=
 =?us-ascii?Q?1kJBwTCpMnF7QYuY+Rc7GZqi2cFjUddzDkJnK7FV30Wy3UuY2tGDtuJVIIYn?=
 =?us-ascii?Q?UY/keFxJTJNLZOYQ3imrtK2oLdFhpWcs2bX668uu1ZCS4u14FKf0LG2q+VJr?=
 =?us-ascii?Q?Y/Z/sjKyPHnToZmJ/PdHKZ6dRvrvzL/jCNJqGAcQ5XSNIKpsMPlW7fugxazY?=
 =?us-ascii?Q?uQ4MAwx4YX48T/a3erdcF4vzMHerp+BHthGD1yrTuKYVKiiAciaSjTWGJIeU?=
 =?us-ascii?Q?Er/+SOSS5I/aF4wyFPRw0U7fqBfJC4Pv/HQ9e9cGBwMyVeGTmhc9872dOvnj?=
 =?us-ascii?Q?e9zG8sFX9qe2+//y5cPbKjVieq4+s9XgHr8v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YC83rCawYturgCSnOHNdckV5h1ta0aomp1ui4QUZ3xfVjG6AVQRWy62SELPQ?=
 =?us-ascii?Q?h/Bi9B9N+kVlufQJWf6DhS0oAV++UxrnpGFjxD8049skeuZ7G3Z4dA3sRg9a?=
 =?us-ascii?Q?EUb4YIAz0SEW9mSXis3iD6eaSqhEIkRTFVepjnHnC1rPrArUDUxsVQskMA/f?=
 =?us-ascii?Q?5ynIqdIfy1yc0wqG2WncIm2C8jCO34A6W8e0+40xMRXC4ctS2uQQrAdlXTHp?=
 =?us-ascii?Q?mlBZNii2TIRieOABxoSLrMIBmFE16b5hl5vFcr/Vm37ixJNpeJi7/hhmMUQ/?=
 =?us-ascii?Q?5yzCGj/OuLm/LJQ8rGQw4nZewp8aWbsh6kTfdmRUAcFyEDXvp/ahExXBi41s?=
 =?us-ascii?Q?k2bHcn47A21BlbVCufOFl/byJJov6FIZ8UM2zl5Vp3AfBiqAbJTAiYWyPf5B?=
 =?us-ascii?Q?3hMAVoUgSfsfHPSJH1rjEcWE5r8i/QKgSNz88F5smuFiP0PqIzCDYRQ6ooxK?=
 =?us-ascii?Q?HST9cBDV7ZDvM4GTUj1pwvANM/y5XIxzrcjYFx24bfFcGJGw2lj3kk6/bLOq?=
 =?us-ascii?Q?JsbN3Lpn1t/b+9Y/Z+UUhED/lbw4vh0nBieNTiLd0ign+ireCLrjev+K8NbD?=
 =?us-ascii?Q?mAY6MueB1+lBD4etjqJ1l8ZqsiciLMv2TbD3hfv4840znnC6OJ6oGG3e15OH?=
 =?us-ascii?Q?n9WpSRA/imdc+RIbx62Ez34t1jO4VJsDBATzcnKWlrkoymUJZ2KKX59zihvl?=
 =?us-ascii?Q?/wurQ3yI/BmOx0c5FMVM3Db7w5uZ9gkFWVtT7MEIcQYNMOG3T6PxK7tBRj3I?=
 =?us-ascii?Q?uBIDu43ykE8OLPjFeg6BrxRBAkbsDciY7h6cZsw+trOfSe7ngmngmVm2QV2f?=
 =?us-ascii?Q?L3eXboUAOt0PV2IpHzXmpwp9g0mdRRAqtLqKhrk2uwOHETPUvKRHi/bZxv8B?=
 =?us-ascii?Q?HNQ/nSOUg1QVLSdIJtuYT/DU+wMb1KVc5FZmGXG7J1LWZydaxFuiDAjKi6+i?=
 =?us-ascii?Q?xU6lVVOJx/kcUvzJ5Icvnyp4MW0xaMdpllTQssu13CCYKlbZ3ovRVFsW52vi?=
 =?us-ascii?Q?w+ZXS8zDlx0G9QQHM3IWGWGii3YYNie37k3/uhsBcsfRGi7zAQYGSiap1Twt?=
 =?us-ascii?Q?ZQP51g60Hw4kkIquVlliNbQSVRfjklo4PqcJtT3x0tog+f5GVf+4IFB/Ro4I?=
 =?us-ascii?Q?i2EKx/Xw7iIU62iBNIpyZVpb7WSEIks++YLgLt59T8aQ5SX1KE6g8tu8QmPe?=
 =?us-ascii?Q?7KXf1ors6alnccITl2tRe8TlHBuFv954yAgMFx98XdIEAobuOBW6imBBObdP?=
 =?us-ascii?Q?DcJeETk/Et1+ZVKXqi1mMsYUgoesW7cIPYN0HIdcnhjbz9mBZXRFO0dxG5MX?=
 =?us-ascii?Q?zgvI9w+DAQpgdIP5M05Uuw6qor2UPesMbb/HmgLxQLeVdzwXnPatexzf3WXs?=
 =?us-ascii?Q?lSBYhrIVxf7zxNY1eC7w8q54c7Q+GuBjFnSLErnQoWU66jnlnw1fUVxYAE8U?=
 =?us-ascii?Q?q/wVYj+vbK60W7MtD+7NebnQw6xx87qaJn815hNGUq9Q7K51B7N3YZx2Kxuw?=
 =?us-ascii?Q?4oqpMJWEvi0+Wi8tDPSSDD1nQIeYM6zmnxdxzC1LOWdA6U7FTP3pCqfIvVhS?=
 =?us-ascii?Q?78jR2RCZ+CbVrP6dbbDHTXRJJp4WpSMn/GPf9KnEIeer8sVnZwFYU8aDud/u?=
 =?us-ascii?Q?lemQDeUEsXZMdbrV18KBn4J79FbVxr7lE45K6vbRRRwaRsH0IYcB/OMEDlmj?=
 =?us-ascii?Q?81EPBNf+kqcmvzzFQc7fGybRxk5SlIuvuI/asJjLs0AhBT4g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a72028c-ae5d-402c-2042-08de46f21a7b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 15:51:17.4984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKUN1oPGn4H5KYvthsgGH6itiHhJQr/VbtTayQO29lE8q340sgmS9JPouAPZNvSAc9QFHA4XQWHieRcaSG9lbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7723

On Tue, Dec 23, 2025 at 05:54:08PM +0100, Tommaso Merciai wrote:
> The Renesas I3C controller does not retain its register state across system
> suspend, requiring the driver to explicitly save and restore hardware
> configuration.
>
> Add suspend and resume NOIRQ callbacks to handle system sleep transitions.
>
> During suspend, save the Device Address Table (DAT) entries, assert reset
> lines, and disable all related clocks to allow the controller to enter a
> low-power state.
>
> On resume, re-enable clocks and reset lines in the proper order. Restore
> the REFCKCTL register, master dynamic address, and all DAT entries, then
> reinitialize the controller.
>
> Factor out the common hardware initialization sequence into a dedicated
> helper to avoid code duplication between bus initialization and resume.
>
> Store the target clock rate, reset and clock handles, the REFCLK divider
> value, and the master dynamic address to restore timing and addressing
> configuration after resume.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 246 ++++++++++++++++++++++---------
>  1 file changed, 179 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 426a418f29b6..b980e2a84fcd 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -254,12 +254,20 @@ struct renesas_i3c {
>  	enum i3c_internal_state internal_state;
>  	u16 maxdevs;
>  	u32 free_pos;
> +	u32 dyn_addr;
>  	u32 i2c_STDBR;
>  	u32 i3c_STDBR;
> +	unsigned long rate;
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
>  	void __iomem *regs;
> +	u32 *DATBASn;
>  	struct clk *tclk;
> +	struct clk *pclk;
> +	struct clk *pclkrw;
> +	struct reset_control *presetn;
> +	struct reset_control *tresetn;
> +	u8 refclk_div;
>  };
>
>  struct renesas_i3c_i2c_dev_data {
> @@ -477,28 +485,79 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
>  				 0, 1000, false, i3c->regs, RSTCTL);
>  }
>
> +static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
> +{

Can you split it to new patch to add helper renesas_i3c_hw_init() only.

> +	u32 val;
> +
> +	/* Disable Slave Mode */
> +	renesas_writel(i3c->regs, SVCTL, 0);
> +
> +	/* Initialize Queue/Buffer threshold */
> +	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
> +		       NQTHCTL_CMDQTH(1));
> +
> +	/* The only supported configuration is two entries*/
> +	renesas_writel(i3c->regs, NTBTHCTL0, 0);
> +	/* Interrupt when there is one entry in the queue */
> +	renesas_writel(i3c->regs, NRQTHCTL, 0);
> +
> +	/* Enable all Bus/Transfer Status Flags */
> +	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
> +	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
> +
> +	/* Interrupt enable settings */
> +	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
> +	renesas_writel(i3c->regs, NTIE, 0);
> +
> +	/* Clear Status register */
> +	renesas_writel(i3c->regs, NTST, 0);
> +	renesas_writel(i3c->regs, INST, 0);
> +	renesas_writel(i3c->regs, BST, 0);
> +
> +	/* Hot-Join Acknowlege setting. */
> +	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
> +
> +	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
> +		       IBINCTL_NRSIRCTL);
> +
> +	renesas_writel(i3c->regs, SCSTLCTL, 0);
> +	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
> +
> +	/* Bus condition timing */
> +	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS,
> +			   NSEC_PER_SEC / i3c->rate);
> +	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
> +
> +	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS,
> +			   NSEC_PER_SEC / i3c->rate);
> +	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
> +
> +	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS,
> +			   NSEC_PER_SEC / i3c->rate);
> +	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
> +}
> +
>  static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  {
>  	struct renesas_i3c *i3c = to_renesas_i3c(m);
>  	struct i3c_bus *bus = i3c_master_get_bus(m);
>  	struct i3c_device_info info = {};
>  	struct i2c_timings t;
> -	unsigned long rate;
> -	u32 double_SBR, val;
> +	u32 double_SBR;
>  	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
>  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
>  	int ret;
>
> -	rate = clk_get_rate(i3c->tclk);
> -	if (!rate)
> +	i3c->rate = clk_get_rate(i3c->tclk);
> +	if (!i3c->rate)
>  		return -EINVAL;
>
>  	ret = renesas_i3c_reset(i3c);
>  	if (ret)
>  		return ret;
>
> -	i2c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i2c);
> -	i3c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i3c);
> +	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
>
>  	i2c_parse_fw_timings(&m->dev, &t, true);
>
> @@ -511,7 +570,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  			pp_high_ticks = ((i3c_total_ticks * 5) / 10);
>  		else
>  			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_MAX_NS,
> -						     NSEC_PER_SEC / rate);
> +						     NSEC_PER_SEC / i3c->rate);
>  		pp_low_ticks = i3c_total_ticks - pp_high_ticks;
>
>  		if ((od_low_ticks / 2) <= 0xFF && pp_low_ticks < 0x3F)
> @@ -519,7 +578,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>
>  		i2c_total_ticks /= 2;
>  		i3c_total_ticks /= 2;
> -		rate /= 2;
> +		i3c->rate /= 2;
>  	}
>
>  	/* SCL clock period calculation in Open-drain mode */
> @@ -540,8 +599,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  			STDBR_SBRLP(pp_low_ticks) |
>  			STDBR_SBRHP(pp_high_ticks);
>
> -	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / rate) + 1;
> -	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / rate) + 1;
> +	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / i3c->rate) + 1;
> +	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / i3c->rate) + 1;
>  	i3c->i2c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
>  			STDBR_SBRLO(double_SBR, od_low_ticks) |
>  			STDBR_SBRHO(double_SBR, od_high_ticks) |
> @@ -556,55 +615,16 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  					   EXTBR_EBRHP(pp_high_ticks));
>
>  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> +	i3c->refclk_div = cks;
>
> -	/* Disable Slave Mode */
> -	renesas_writel(i3c->regs, SVCTL, 0);
> -
> -	/* Initialize Queue/Buffer threshold */
> -	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
> -					     NQTHCTL_CMDQTH(1));
> -
> -	/* The only supported configuration is two entries*/
> -	renesas_writel(i3c->regs, NTBTHCTL0, 0);
> -	/* Interrupt when there is one entry in the queue */
> -	renesas_writel(i3c->regs, NRQTHCTL, 0);
> -
> -	/* Enable all Bus/Transfer Status Flags */
> -	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
> -	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
> -
> -	/* Interrupt enable settings */
> -	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
> -	renesas_writel(i3c->regs, NTIE, 0);
> -
> -	/* Clear Status register */
> -	renesas_writel(i3c->regs, NTST, 0);
> -	renesas_writel(i3c->regs, INST, 0);
> -	renesas_writel(i3c->regs, BST, 0);
> -
> -	/* Hot-Join Acknowlege setting. */
> -	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
> -
> -	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
> -					     IBINCTL_NRSIRCTL);
> -
> -	renesas_writel(i3c->regs, SCSTLCTL, 0);
> -	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
> -
> -	/* Bus condition timing */
> -	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / rate);
> -	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
> -
> -	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / rate);
> -	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
> -
> -	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / rate);
> -	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
> +	/* I3C hw init*/
> +	renesas_i3c_hw_init(i3c);
>
>  	ret = i3c_master_get_free_addr(m, 0);
>  	if (ret < 0)
>  		return ret;
>
> +	i3c->dyn_addr = ret;
>  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
>
>  	memset(&info, 0, sizeof(info));
> @@ -1301,8 +1321,6 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
>  static int renesas_i3c_probe(struct platform_device *pdev)
>  {
>  	struct renesas_i3c *i3c;
> -	struct reset_control *reset;
> -	struct clk *clk;
>  	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
>  	int ret, i;
>
> @@ -1317,28 +1335,28 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i3c->regs))
>  		return PTR_ERR(i3c->regs);
>
> -	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> -	if (IS_ERR(clk))
> -		return PTR_ERR(clk);
> +	i3c->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
> +	if (IS_ERR(i3c->pclk))
> +		return PTR_ERR(i3c->pclk);
>
>  	if (config->has_pclkrw) {
> -		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> -		if (IS_ERR(clk))
> -			return PTR_ERR(clk);
> +		i3c->pclkrw = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> +		if (IS_ERR(i3c->pclkrw))
> +			return PTR_ERR(i3c->pclkrw);
>  	}
>
>  	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
>  	if (IS_ERR(i3c->tclk))
>  		return PTR_ERR(i3c->tclk);
>
> -	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> -	if (IS_ERR(reset))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
> +	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> +	if (IS_ERR(i3c->tresetn))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tresetn),
>  				     "Error: missing tresetn ctrl\n");
>
> -	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
> -	if (IS_ERR(reset))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
> +	i3c->presetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
> +	if (IS_ERR(i3c->presetn))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->presetn),
>  				     "Error: missing presetn ctrl\n");

And another patch to save clk, rate and reset to into struct renesas_i3c.

>
>  	spin_lock_init(&i3c->xferqueue.lock);
> @@ -1364,6 +1382,13 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
>  	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
>
> +	/* Allocate dynamic Device Address Table backup. */
> +	i3c->DATBASn = devm_kzalloc(&pdev->dev,
> +				    sizeof(u32) * i3c->maxdevs,
> +				    GFP_KERNEL);
> +	if (!i3c->DATBASn)
> +		return -ENOMEM;
> +
>  	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
>  }
>
> @@ -1374,6 +1399,92 @@ static void renesas_i3c_remove(struct platform_device *pdev)
>  	i3c_master_unregister(&i3c->base);
>  }
>
> +static int renesas_i3c_suspend_noirq(struct device *dev)
> +{
> +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	i2c_mark_adapter_suspended(&i3c->base.i2c);
> +
> +	/* Store Device Address Table values. */
> +	for (i = 0; i < i3c->maxdevs; i++)
> +		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
> +
> +	ret = reset_control_assert(i3c->presetn);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_assert(i3c->tresetn);
> +	if (ret) {
> +		reset_control_deassert(i3c->presetn);
> +		return ret;
> +	}
> +
> +	clk_disable_unprepare(i3c->pclk);
> +	clk_disable_unprepare(i3c->tclk);
> +	clk_disable_unprepare(i3c->pclkrw);
> +
> +	return 0;
> +}
> +
> +static int renesas_i3c_resume_noirq(struct device *dev)
> +{
> +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	ret = reset_control_deassert(i3c->presetn);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_deassert(i3c->tresetn);
> +	if (ret)
> +		goto err_presetn;
> +
> +	ret = clk_prepare_enable(i3c->pclkrw);
> +	if (ret)
> +		goto err_tresetn;
> +
> +	ret = clk_prepare_enable(i3c->pclk);
> +	if (ret)
> +		goto err_pclkrw;
> +
> +	ret = clk_prepare_enable(i3c->tclk);
> +	if (ret)
> +		goto err_pclk;

Can you use clk bulk API? Just for reference, clk prepare have mutex lock,
which may cause dead lock, such as if use gpio expendor to control external
clock gate.

https://lists.openwall.net/linux-kernel/2025/07/01/139
https://lore.kernel.org/imx/87pldsd1tq.fsf@bootlin.com/#t

Frank

> +
> +	/* Re-store I3C registers value. */
> +	renesas_writel(i3c->regs, REFCKCTL,
> +		       REFCKCTL_IREFCKS(i3c->refclk_div));
> +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> +		       MSDVAD_MDYAD(i3c->dyn_addr));
> +
> +	/* Restore Device Address Table values. */
> +	for (i = 0; i < i3c->maxdevs; i++)
> +		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> +
> +	/* I3C hw init. */
> +	renesas_i3c_hw_init(i3c);
> +
> +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> +
> +	return 0;
> +
> +err_pclk:
> +	clk_disable_unprepare(i3c->pclk);
> +err_pclkrw:
> +	clk_disable_unprepare(i3c->pclkrw);
> +err_tresetn:
> +	reset_control_assert(i3c->tresetn);
> +err_presetn:
> +	reset_control_assert(i3c->presetn);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops renesas_i3c_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> +				  renesas_i3c_resume_noirq)
> +};
> +
>  static const struct renesas_i3c_config empty_i3c_config = {
>  };
>
> @@ -1394,6 +1505,7 @@ static struct platform_driver renesas_i3c = {
>  	.driver = {
>  		.name = "renesas-i3c",
>  		.of_match_table = renesas_i3c_of_ids,
> +		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
>  	},
>  };
>  module_platform_driver(renesas_i3c);
> --
> 2.43.0
>

