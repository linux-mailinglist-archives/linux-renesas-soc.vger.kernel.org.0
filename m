Return-Path: <linux-renesas-soc+bounces-20723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 750E6B2C9AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 18:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A050B3B495C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 16:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8471C2580E1;
	Tue, 19 Aug 2025 16:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bDwClyRe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7AC221F1A;
	Tue, 19 Aug 2025 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755620727; cv=fail; b=HPS7fYIL2rJk8kTPt4n5uKI9AguFCrR63ipZ5Oqo77Wj5ka2TvUWGHHvkpHZIdDPw+D6d8y585RBB5j7SIdokq2+iIPbO1Xl1JVqAqzvuppQ3UkCwmU4yws4iFNiPHX/JgM/Ju0MjdKVM3B9u9hWH5+AJi79ZjwQG7Gy2rrujsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755620727; c=relaxed/simple;
	bh=0bCJqf+JCq04w0HqQ625GbVbmy5l6PQioFwi6qiyjHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DcbLBVlE06UYnYwLSSsCaiXNUjy5kgK8XIwCzlnXWEIXTSLJcngEZwsecZfLyMIH5L8jxNwqOO14e440HOsmyVqqIvxEVMXfnRfCwxNTlnsGC4SHTuq2kKjQgJwua4WdL+b80PxwNFILNIoFAxrtLpN8H5TJBej7N6Iy9mqHKXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bDwClyRe; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnM/2IilGbM8sUvgxtXttVXzowY9SlC9BWPMmPZPKhX2N6zsoMGCpHbqhXrf6+YZPo+oBIIxwfjuFJmrgaS5P3DwbrAXmHz/fWzTVP9PO0lYx0b6nfgsANj+90ggEPbaoGRFf1hM+mCFlSsmWMlkUeYMfpxmqBwnezsDhkAcAozho/ZWafFSQB5zKvDQRi2HrhkzO4fTx/CI37pFxMgkutS5naNV++Te3wFF/zWV9irdGmz9mAr/tfnE8bqz+aO+rq3hF4OJkK5wEgNnKhn6ko0+1L3EnBp0rEIuFFEJKfPqPJhbgU/qHkEPw1vOdMac4a24qOEZOQIKsiCtQKplew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMCUxbaSXTuAhpruK0QlIiOKARSAl0KHPDLECZKgI9M=;
 b=mRnQNN1pepxFytV4dsMekH9Crv/eaCJsZtEOTVnyeAFeQYbxzbaYpDJkAgBCZ/7TAOB0B8wZs/nX9PLnoAGTi8anqWpAhsq+SZXbM8M1n/y8xp9h/YKl7xFW5/YwBnDRPnryYw9KYkq7E6V8mewZcpQ9fsE73HAvEd2S+YQkcwQGzBZsp5xBMdOd6RQGmem7a6tYvqaF+3piNWO+lZYHgWzQ1iSaN7eywJpo7+LzIPl8sYc9Rjzw2d2B+tQ20pN2R/MQy2MNZDfrm5M0AG0GLIXwCijpnv7CAuPvA4NVNy1juDLdBWWLb4lrMOuviGOW+JNgxVlDhbLqJVmr3+uSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMCUxbaSXTuAhpruK0QlIiOKARSAl0KHPDLECZKgI9M=;
 b=bDwClyReI2MVAZzX5WDKS0Yt19j40hyVhwVF4xHZ7xvs/0YTE+GoSGHEi29kgDOgMvKxdhEcL/xWdrfljmlRfx3pppHiDp1Iov+QrzIq9r7jeFLeOHZVAH9Po2JnzVDzWJxOE+Xd2YtZGEwZ9vkm4XBvCSVkMlk2oDUJ1AVlg58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB7049.jpnprd01.prod.outlook.com (2603:1096:604:13c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Tue, 19 Aug
 2025 16:25:23 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 16:25:23 +0000
Date: Tue, 19 Aug 2025 18:25:13 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r9a09g047e57-smarc: Enable GPT
 on carrier board
Message-ID: <aKSlaQxFL4t9rZLh@tom-desktop>
References: <20250814184115.192930-1-biju.das.jz@bp.renesas.com>
 <20250814184115.192930-8-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814184115.192930-8-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0266.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 6afed62b-68cc-4d5a-89e8-08dddf3cff66
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uuFkIjOHHjYXNwj6WINsinkPjLOogevBW6HOx/q11r86ufGAzBdv+xQ5iKMt?=
 =?us-ascii?Q?ZNBOpO5sv/phEwyC6nOK10NcB3kCpLHVDcQo/NBKDv3/2HC94UDqEgsPZeqK?=
 =?us-ascii?Q?ZB0BlgZs33pZZZMi+fz5q4WExtv1zpSVzf3uSd0t84mAidAVKKOSa5W2lY1o?=
 =?us-ascii?Q?5PHRm9eCtuXGC9ySW5cOblMsOSnKC5qAsHtMorHHgmt5v/mn/M1XUG9/jRlf?=
 =?us-ascii?Q?HEWaPBKtcwmO+vhQz5jcHQPP8kwhT2CzFLMioc3xaWf2gDrJKG+xdL9OU6LZ?=
 =?us-ascii?Q?zPu80Qitgse5rWREGtEWnWFxK/4EJzqKGUfs0JidcmSipDm49xQvbHsMp1Q0?=
 =?us-ascii?Q?u3q7Cly2Cc9x2uzkMSooZZnD1SZxScbJrqujRZpaBSyUIziCz1Qm425xkVcX?=
 =?us-ascii?Q?cpEWY9VgRvUVMPGMGpioxVVdi7juOCQDjuTvEyBFENUc5KCxnKrmOykAPqzF?=
 =?us-ascii?Q?euRrIqxFFPiggXolAw6/HsoY/PsItc8TvtJhP6cVhvkskAhF4pzBT0ZOAAj6?=
 =?us-ascii?Q?3J9KMTOrrIKJuJ3HvgKCPF70EIDK/t/41IbnZJ+5Ig82vG5rOWzxDs1phFYD?=
 =?us-ascii?Q?HuGlMT2f5Ak+h1snnIcS6roLVi2A+Amsnogu3zpBG1c5z1dWCpK+SQYoR/IV?=
 =?us-ascii?Q?QtEKxZnTS5JhbcVwQCsyDOoOWB5aDHG1hTY4DtT95u+vzXh4Y0H7jypmOJc7?=
 =?us-ascii?Q?YAVyoobwQAls/jU6xXZEgfJg51FwR3tjpAO3dJyc45lkItai2c5eqDAxK3xt?=
 =?us-ascii?Q?g1dhCw9le8+QcFvmDq5RM0mN+9EpB3Q6L3/JuCmvvak1vvVMEU1YsT49OrQc?=
 =?us-ascii?Q?cGYG84dgYn14wX+dmjqrWOhqWqSSpYWgootJZ389a6TKL/VanbgzVM7hAzTY?=
 =?us-ascii?Q?cnMPnoa6iWa8Uce+nzIkbLzrMIQi159ZQovnhdU3G701dQFzo3PpsFlbO1mz?=
 =?us-ascii?Q?j3v3ZHTtzx2mUcxfmmo0H/rybclbBpX+G5xW5eZw84/Tso2C2sRtaldST+53?=
 =?us-ascii?Q?2LOumzwTFncLrs3KI3FyzP0RknmmXYGw4RsA1k/YX69C94BNJ0pfTgj9KXE+?=
 =?us-ascii?Q?l9xNGKj26nRjFzf36QnATMwQok6KcaemhwqCyUueQaIrcijvjJswT7bGLWZR?=
 =?us-ascii?Q?W5DPCkO48P3usvLYGTGiN/Ke0D/IRbm6jxWglPdQdfXqrDTLexI48aRsZsUJ?=
 =?us-ascii?Q?IR8W1qNzSo2td8HcCZ8Y8rnpUdQkTVZVQW1FQitX0XBYOHvHnjg8QjarMeBB?=
 =?us-ascii?Q?TWHs+UAZ1+YdfHJXa6VLenRTC8DrtvB2CMG3K7iJbPyFmkAsjDrULCU64YZY?=
 =?us-ascii?Q?YMuFt/a0HVghuo5YF7bVnO/Bxymm/TWfZwEg2tscsh2xKvZZdHlCuzp7zaE0?=
 =?us-ascii?Q?ewwS3WKXKjNy8rpPgvU7JJAJcV48VkgVoFiByHN+xgoq9actkwCLlrYJDcgJ?=
 =?us-ascii?Q?fuW8PuWgUYY33z2GY/hAQ1PeRL+eTtW3ypyKIozigWQPMXltVcyrpA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vdlwJFB9XQvjqzUOegiUWXSNeEHpzUz0S0NUVs/wQxv/zdUl22cJQhysdvOs?=
 =?us-ascii?Q?4Mzq9rFYKUj7FCNFTowmFLpJlwVkX93aWtQxQDnvYaUb48N0VUVdbiat7WQs?=
 =?us-ascii?Q?TkXCZ9P2qgXHRHXcCPE5ujOXdTRoH15OqHQyDIeq3MmvKDYHdha8RBAFwtNW?=
 =?us-ascii?Q?6zxXZ0ITg+89ohM8y2tI8G7ZyqRotC5lYtUKTTGpLczcmcaMm1WBXMfmqwx9?=
 =?us-ascii?Q?I/M3o8VOEisagDXa0cP5gC2+j9JheqCMShAJWfScljj8R+/qeBb6SVi6MWx0?=
 =?us-ascii?Q?Ax/6EfVY2x04VvrYqXPi4ypeMrq4i6zlykDUU4UpKyjCFmjuN7kNjOBRMVau?=
 =?us-ascii?Q?xLWVjrlOPhcHj2yZf/9GGlnZFKZ29Tu3OtbY/czbisx5HiDwR+Qjd6n36qE9?=
 =?us-ascii?Q?xThb+0e9QQ3rplXnG4P5Cfnwx73Dg1ZBbw3Qgmete03w5qp2AxzXqYcaCrQg?=
 =?us-ascii?Q?CQ2wLXM/Qmj3yc6zD2aQAYfUqvu19G8L34Twnv5N1kHIoHxKmunY6Vx2RkFE?=
 =?us-ascii?Q?Ae17gyZM9lJZkV9CeDvDKSnpVSL8bd/0CmsOGoGtxJYNy4L+2By/DevvQAPS?=
 =?us-ascii?Q?5seJbrYOB25JTq6yZrHZzm8IS4mjgjqYZDPUdhRvgormPe0oJbSYo/mqkJds?=
 =?us-ascii?Q?n5pRdLtUUS5ZGtU2m9gbqoQVijjk491/Exp9tuxpekwRzTLJIT8IluWBd1Pf?=
 =?us-ascii?Q?L6b2PHxIughQRtHyOnTPyJuxcfiSDSDXDO03JuXmJdqsUmy6WTswe/mqWYY9?=
 =?us-ascii?Q?XPmZ6V74jtRteXQ2VK8/r1itu2ab3akKCBgFIN57DaMo7AeBFEWKpbR2q2jv?=
 =?us-ascii?Q?rpdjDVdyqFLaLceHPa/tIcAHkroPqgla3eDVsXuIiAFYIs5UR6b0nR2Z35zd?=
 =?us-ascii?Q?GtIqlXDnqYr9pakZthCXfXMQ7OV4T0dQfmM9ZUc0onB1fBv3+ZoXINUF+mLR?=
 =?us-ascii?Q?iYRlzsDVZvPMIaKWYwSeHGO0UuNr1GSjw3HJOPz6SuCdX6uo/KXMgpz6r4QL?=
 =?us-ascii?Q?Y5tQ2zW8+fQykptaTooYYnA13AUjQIHdz5HVPsxyxk7+jAWbFgqqr8hdcUZF?=
 =?us-ascii?Q?lvlZPW1bwdlJhI8k+lJlGce8W7N6LMbhn+gqHN4onD+hUKr3/RMW5IX2NoRm?=
 =?us-ascii?Q?M8NGY4EeT+k+WcO3jBGEPVefK+8Hm+YoDqEWzHC63NVVvKlJ3iHOm9AQZp0u?=
 =?us-ascii?Q?QlrjnbArOzcfKJnZCF6tJV20haKaVqa4ufJhxjPB0kerPqB9AOo0aryLt1d+?=
 =?us-ascii?Q?R1Wvcxctm2IMxQlS+JDpmR9DtFK5jg3wyA0ZKrnBz5yPAmB7c4t9DgLuWbiC?=
 =?us-ascii?Q?CW7THuzYd9WkLnV/FWBI/pJELt9zORcgtF0w6M9lqmJtLKYDIpG9tfvqgY01?=
 =?us-ascii?Q?m9WWqb2T45zNHA+i7R09EOovQBn76v/GZvFNOwYdimcnyzqLcpTu9Gp5Rxkw?=
 =?us-ascii?Q?C6avZcuu2QShGAZ6Kr6h9i+u5gd2Fc5Zm90kyL3fTRCG5fug844rwChn/mxJ?=
 =?us-ascii?Q?rrE3lYeV74OrLEdZAzxENIavGuSuU66mPwEUzyavf4MmhcEPt8xIr8N8uq4D?=
 =?us-ascii?Q?CqYYDg06BdfWMbb2XY7BGv4a4ztTrmZ46MUnr6ARLRjfZA1ouAfyARH10BzC?=
 =?us-ascii?Q?mf9CYD2Jda39ltc0OOLvX5M=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afed62b-68cc-4d5a-89e8-08dddf3cff66
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 16:25:23.5889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5rucP+CaMj4aGHIcpFLN+29sTYdXilT/XGfwRHmaE43fgxULN+tvp4tsoD3y/KI3+BVUenZUQ4UTmkyQu5IoicJLQAHbUVCCGLQqfVqHah8eM5+RBF6uR4lI8Slqszd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7049

Hi Biju,

Thank you for your patch.

On Thu, Aug 14, 2025 at 07:41:11PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The GTIOC4{A,B} IOs are available on the carrier board's PMOD1_6A
> connector. Enable the GPT on the carrier board by adding the GPT pinmux
> and node on the carrier board dtsi file.
> 

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index 1e67f0a2a945..093c0202b4f9 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -84,6 +84,14 @@ &can_transceiver1 {
>  };
>  #endif
>  
> +#if (!SW_LCD_EN) && (!SW_GPIO8_CAN0_STB)
> +&gpt0 {
> +	pinctrl-0 = <&gpt0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +#endif
> +
>  &i2c0 {
>  	pinctrl-0 = <&i2c0_pins>;
>  	pinctrl-names = "default";
> @@ -125,6 +133,11 @@ can4_pins: can4 {
>  		};
>  	};
>  
> +	gpt0_pins: gpt0 {
> +		pinmux = <RZG3E_PORT_PINMUX(5, 4, 10)>, /* GTIOC4A */
> +			 <RZG3E_PORT_PINMUX(5, 5, 10)>; /* GTIOC4B */
> +	};
> +
>  	i2c0_pins: i2c0 {
>  		pinmux = <RZG3E_PORT_PINMUX(D, 4, 4)>, /* SCL0 */
>  			 <RZG3E_PORT_PINMUX(D, 5, 4)>; /* SDA0 */
> -- 
> 2.43.0
>

Thanks & Regards,
Tommaso

