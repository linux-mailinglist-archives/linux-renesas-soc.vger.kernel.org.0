Return-Path: <linux-renesas-soc+bounces-14940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C846A741B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 01:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5091B1898213
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 00:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8783D23CB;
	Fri, 28 Mar 2025 00:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E0pJZpOx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011015.outbound.protection.outlook.com [40.107.74.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874C223AD;
	Fri, 28 Mar 2025 00:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743120600; cv=fail; b=Nd5OS3Snz2hC2W2yYZi8LYzO+aJ/Qk/LQFqMKROt4mdHOWwpIZk8wT/dpTT/NK6D0NjIc+gLFL71j7Eydoq+W2v40geRNd+44CM5986SPYHGHQxbdPlBk5lytaWJh/6G3Z1pYJpK7b+OmLcaSTK8cpfIoKGciNdvjfG1Y8wH8CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743120600; c=relaxed/simple;
	bh=5T7wzwFuooCmAEnuZv21tpvvhrzBINGY8mdbKPLr6es=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PM9O6yCi+wjHPwVd23NDL0LAK0lNQjiQSuNeu0L8DFjImtlwPyEf4kDTQuSnS+ZMUIyq03z+o/xfKGatqtdUw6Us1ZeSDyIjHUYrdbdSd2zhfXyzK9Ymw0TRrIoieXFX6Y82n59LkhcbnulzcNoUQyxoGF7K7oEcc2P70blUxbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E0pJZpOx; arc=fail smtp.client-ip=40.107.74.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qME1yL8qexv57h7Wg4Cqt9pnLnueGOyJyY6KW+0BLmDY8eGQkCGwnBPoH36L2mrgu06jrv3QVfO5E/XajtxV4CZefhLmX9LDaNegV1scIiBfK20T+U3PrX8H0hekY5DZ4G/6DMfHmUv5fCQI+2FN41fnBGoJbH4NlxG/tfc9UhuvBZs3hCWeBApwRAGYBQK/OvAzWc9+3zsrNn6g9CeUZWUCUGwFFNsBSU1REtsMmi7NOKn83AAiyFV9XnDEn+jEp5VA9D+sBNoZfmDqT2objo1s64kZWfZojw0AZEnB1I6NjeEfF86zjQ2yZ4cuxIBch27U6u6KqTNCJxx197k/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orxonOr5zEj4bU0Kn9BGaKcvuDuM3bvEV9bX7lf3ek4=;
 b=CooUYcmRr3/X+HOEbFQy1jPCpuWULqHjxbr9KWuRRMfTPlzV2jSYfHf57T05AUzMyqNvwYSgyZeBnwdfPkXWR3R0/Atzm66KRMcWiygOgOqOQBeawju0M3+prmz8AnqnT4lI60+zqpu9sstBABRTrgIWkSdU6tOnip6uBvAYgQjKsc6YFEhUO4Y2keclkYz7XGTag1EmGGRqvv3O2ETTQdgRL5wDFuzZqfZYMG8T1yARV0VS82oeNJUcb7ysJQ1vHJrkeJ2TuwgWsVZ/UTdu22IInykwyQQpkdqclkYhArXsfGZEjF9PxL0twBMfX+bIz03EpNG/M+JgXAMRB7yUkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orxonOr5zEj4bU0Kn9BGaKcvuDuM3bvEV9bX7lf3ek4=;
 b=E0pJZpOxm6rnRCpo1NxwYuQiZEjOBBFRSVqY1iio9A/UYO/P6KC0Vljs4uG3i3J7GehJfLC6uoITa+FlBcyr1FrjoYdXOn2hMDgUXcBu+aAQy6I2clHA4Ib7yNkhTzl6iyJT+2hva0cRfV4RySMiBCRp/76Lz7qYffiTbtjyyKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12789.jpnprd01.prod.outlook.com
 (2603:1096:405:1b8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 00:09:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 00:09:55 +0000
Message-ID: <8734ey10dp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] usb: renesas_usbhs: Correct function reference in comment
In-Reply-To: <20250327120737.230041-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20250327120737.230041-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Mar 2025 00:09:54 +0000
X-ClientProxiedBy: TYWPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12789:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ca23b8-f12b-4a03-b736-08dd6d8cde59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?izc9zIS2fwCwKCfMnWmCEYl2GVNR/XwmpvAY9oo3AggwoqcjqbUUgZjidmY/?=
 =?us-ascii?Q?dwEj4vd1aqpQDKjMxDOgIQiiFUcHwo5A+p0Wc0Ra5GRcIgh0KNmUPWmkrBrJ?=
 =?us-ascii?Q?y43QX00Z2736+FYwg0HNVkf7n4lR5GEKuDPPN/9zO1ZK1EsUMPo0uzlFC/TE?=
 =?us-ascii?Q?9gZMZl6BKce2JASjs/Pxn95d1Wf3dVkHyb6Xw41sZwpqv+Z6TJG8VhWPz1lA?=
 =?us-ascii?Q?wAbkRnLkEjPJbmHIS02cyVzykMJJKwOXSv8YaH7dNRXLo47zJ0SdGGEXs18M?=
 =?us-ascii?Q?+qg+xVacfpo2GMXbUz6Qi2nmlNsMeqrngSUnKwLoO6buEx98ZSOIpOAp5uPU?=
 =?us-ascii?Q?fvwzEVssfp61cTTwxrZc5wgzyFNCymMcd23a193m4LKAawnQwHqvU1BAAhbd?=
 =?us-ascii?Q?5Z69zyYeTn0o5dCIgI72PvtFFmhFJiVclhBSPIjreRDzfFEco9VvVMxEOnrH?=
 =?us-ascii?Q?SuGIcpngt2mcHQxn0b2A5gWnSfiPwGDU2VCCRCbCmoJj4LVJ4UvxZDvz0gnN?=
 =?us-ascii?Q?2Q8wBOp8wPycL6hFeyz6sw5oT/gJRf8Q+gvp+hLo/dG3ef38aWJ6eJeHMBfB?=
 =?us-ascii?Q?jnEU0wCi5RAQVDWvnOAfDL9vDHqajfql43y90gwb71K9mHfFedgHkuNeOVNw?=
 =?us-ascii?Q?jPYq1NGsSVV1m7cc+36tP5PU5/YWrVO0117odYvWJsUzaP0+/F9eDciGN6No?=
 =?us-ascii?Q?1ZZfjaduVzf3LM804S08wECnTL8OLTlBgOrju8y8ehWI6cifhsrdgpO+Xl6q?=
 =?us-ascii?Q?i/Z1ASGcQ1nqz4KDIEP3+1y+JTLjcz1BqueNczUxKdkdMei8872sXraey5oh?=
 =?us-ascii?Q?fcvJCEdkaIp6A5JAboaXyJrRWqkhd4v+10ZQ3CQC29G1NlJRhVcIGjnloops?=
 =?us-ascii?Q?neghKSTz6B9/XXdt5L127p9YLuggTQsdG1UDRwu8EUxPMFZNd85XyEPDsPE9?=
 =?us-ascii?Q?qYvaK/SHYqVyeT5EQN4/iked7RtB20j9xN1Zpn7uaTx0co2z3hhQ2ulTl0XB?=
 =?us-ascii?Q?+sBCCn+yr2oJ+KBI7pVr+jYGjgDPlIyVug+NIf/YH2BkploMqionkbuaG73q?=
 =?us-ascii?Q?5Rd1hPNXh9AhXuvuzv7Wmd0fg+zkhOXF/rjoI2Q57/8yPq+WtGHVUE/2Fh5f?=
 =?us-ascii?Q?P8jylnXga9SXNI+HrTXPGyMHA01gsPskAs0fLqmCjll5JdaOG89bRCQ/xapi?=
 =?us-ascii?Q?+j/lVc9aaWqs7uMYQMUA/nFXug4ANuzB2YuPwi0E+qcCjgJJacsN3JBgslIE?=
 =?us-ascii?Q?ZE5UpdkRWv7mCJMeIt03/dpJ/bp/dmzdNSKF0+96R426V2hZ9vqL65DcIME/?=
 =?us-ascii?Q?/CbRbpbxd6f0fcEx98P+l7y+42l0E08wrbxtPCPkCJCBLnIaEfzvyFqycPW+?=
 =?us-ascii?Q?/h+tAV3AOR/Y1EmsOXv/RGD+eJd7BLMveCBJxZPaZcoVTikuAGg9rfrGJUMj?=
 =?us-ascii?Q?UzCtWYCSHz3FBW/QynSpT8rPDf32mJp5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uvA9aJ4UHNIVYDn8uwirwDoYc21EVhWGxDG7MQQMp3xcW5aZxS9x8i5Y97wH?=
 =?us-ascii?Q?vYmjNfhDYaEh+1u0dulJcYoVHeNtK4NdYV9U4YsGxvcKy4Uq00LJapmOJzT6?=
 =?us-ascii?Q?IX+Q0kklzhxx8PWJ/D/+s2cJ2aBcXVdSyHIbN1J/Vpe412cm3Gd+FjI31F8J?=
 =?us-ascii?Q?khDz2JaNVEalRzwQmzA3gL4cb72sRq4+H0D2kZeCcMj1DtxQ3HovDFHXvm6e?=
 =?us-ascii?Q?DhbBGBSH/MvVcbcc5vkA4GOFZJmNCICDpx11iT62VEx2+uK00yTcPwu/SpjY?=
 =?us-ascii?Q?eaO+vFmxR5KZjDelZHB85hgpaOPKtx4hv4nJ2JYKhUe2BXlW9kffGKaFcS8Q?=
 =?us-ascii?Q?eK9RRMrLCsRk00bhbj8L7+rAI6/gYVryu2n8mCcpOCYUqcBLhJVZH1hoqYBp?=
 =?us-ascii?Q?fOFzLsgeQ7Nmypu/ElV/AvyYku/BmZDQIFezoBsBYzcRHe1YL+XmQ9sdW7Ga?=
 =?us-ascii?Q?l8z5yBA7sy8mqo3PhUQBojvyZwbyVrXUi+S77P5x2VOZurEdn6iufrUSSoiC?=
 =?us-ascii?Q?wCG4AL1YHZVzpPLGGKUG2i/WM5bz3BgToeTvY2edycBXxI9HQNX4WXEcbOii?=
 =?us-ascii?Q?VsDgKImcE6aTy+K81oE0R8gAozpw5vvhbEkwsaQYSRc7Ld1YJ0TkV41pmk9P?=
 =?us-ascii?Q?Qf6/BnvoA+ump0J1ADggIBmPDxf3fhnvSA60c7cGp8pCtKM/TFHNtCzQKPxL?=
 =?us-ascii?Q?KWfBz5TwM5bgLMeKTv4NSJ2aE4DIgh3sr1HIvFCg0HRc/lH6FA4kbPK21BwM?=
 =?us-ascii?Q?FA1PdTqKobNUfg9JY/uMG4VulxP7e1JIUdr37nwNyKVs4MfqjBsAvSmL3mRq?=
 =?us-ascii?Q?qJiVSu9Rca+yn1k6j64ZR8EAVwbXm/gmn1JFj8Wt/splC5JJxyI+onMhIzwa?=
 =?us-ascii?Q?Ic+XtT6jTIB/5vALBmWQXAJ8FvxcAMhrB2kPDY13kaiIYaz2glXQJCgFwHnL?=
 =?us-ascii?Q?ZfZ+c8ojzwhG7s1y4gAk5zokPLi4KXEVQTc5wjx0Ry4w1JAA4QGGS+JzP/2C?=
 =?us-ascii?Q?poTh7iGpeNmRVJtZwKguJEm+FEELbry541ufXbZsOJH2usKk2RogPD/SSxlc?=
 =?us-ascii?Q?y0/o43IOQ18TnZJ5NviB9dSkRHVIJ8TUuZbwd/8WNHfyk1b4lvnFc/c34S9m?=
 =?us-ascii?Q?V8SxODgwWC+qtPxs8sOkpKmx9IK/mGjX6ipBGqdgqnbORpAk94xlXXrHU9zU?=
 =?us-ascii?Q?0NRECcEgazWTq69fUQrAXpfbHPf/LWFx6hn3xwgST6ikm8PmUAotnANbNzfb?=
 =?us-ascii?Q?/W6fVWkfGibmB/eE9Wadecg9Fvrt570RHpwT3PVaQ7fgi3+wqbw0Rn17dms4?=
 =?us-ascii?Q?dM2uQsc9nnEb0KnPS3PLuQGAm+KGHi/2rTmepqg9IsgdgezxEGON+pP5OyeC?=
 =?us-ascii?Q?k4inCgjVMLhQn66hEnOmRQQxxBBxZ3MwMBuXrmwqr9oXtpMmAW2SeP/hc/eV?=
 =?us-ascii?Q?Tzs0qyvQGiqR9dknb/KXwG55ym1Q2K0Xr/EqhUvrDeQS3ICl/MLrCWglIcSt?=
 =?us-ascii?Q?/1XwpPZtLd46YWjZvXS35zF3PDnzdo4OOcGNUeSS6WbuIwS1ZbJNnoM9D/kp?=
 =?us-ascii?Q?EJfw/JqTAFeP1/LmjlWo746n1/OVpNRv71JjzUJJlx1UAx5729XEPx4et8FA?=
 =?us-ascii?Q?RWnRzCkw3F6eTdsuS9vB7to=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ca23b8-f12b-4a03-b736-08dd6d8cde59
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 00:09:55.0861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXmbk4E+MEvWCu6EyKzkNys9mwy0jEsd0W0ZaxmZZm7RmqoxnLzwis+xXebsDanAtyQ3Nsem6NhtZzOIDKiZTGHhdJ+B+TcReZDJDR1m/mMWgSM+pmc6HPr0HbdQGnZK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12789


Hi Prabhakar

Thank you for your patch

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the comment to reference `usbhs_mod_probe` instead of
> `usbhs_mod_init`, as `usbhs_mod_probe` is the correct function
> used in this context.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/usb/renesas_usbhs/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index 4b35ef216125..15ef246a1245 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -698,7 +698,7 @@ static int usbhs_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto probe_end_fifo_exit;
>  
> -	/* dev_set_drvdata should be called after usbhs_mod_init */
> +	/* dev_set_drvdata should be called after usbhs_mod_probe */
>  	platform_set_drvdata(pdev, priv);

If you want to care about context, it seems we want to care "dev_set_drvdata"
and "platform_set_drvdata" too :)
And, it is easy to understand that it indicates function if it has ().
like below

-	/* dev_set_drvdata should be called after usbhs_mod_init */
+	/* platform_set_drvdata() should be called after usbhs_mod_probe() */
	platform_set_drvdata(pdev, priv);

Thank you for your help !!

Best regards
---
Kuninori Morimoto

