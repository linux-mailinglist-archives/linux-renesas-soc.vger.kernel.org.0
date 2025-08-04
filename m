Return-Path: <linux-renesas-soc+bounces-19954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1E5B19E0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 10:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40CCA189A501
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 08:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C30242D87;
	Mon,  4 Aug 2025 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Eu1DrT+b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73AF242D6B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Aug 2025 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754297898; cv=fail; b=eCJ95rLSTc2ghAxPT9nde1jdUKUYgft3iw8qS3cdQWpe/QEozLQH+GBF4jeQsdBVJuk4F6wNn3RwiDT5re+Tp8ifzfuZkR8TdEsuD9zm18h/9/tTxBk6pUZ8zm4Plr+MOC/zZmdeA+2bkLZ46SxtXpGTFEkvtkb40qulp1JDVYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754297898; c=relaxed/simple;
	bh=mYpNM/y78H7EdvJ1OeCkekyg8ZMqFYo7niEAZgWv8gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Plb8iJB/l6bVqPknPZFvdvH61n4T+ulXcexFDiOSvabrdl7Pfm131jjPGb4DywFsSPTbXhCy9tVGSuwFo+APmK3tx4VRu7+/b7vSGB0ziKi67LF5wpp3urkyw3+dXxA6X8qG23s0lBT5p4TsRe8BM9OHhuAvJL862oWVIOR/vjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Eu1DrT+b; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcyEVCKe1UhGSyJu7ddDET1zu9m6uQjpBmHnnDwnqmcwNcBWVMxvE8r/fyhsDGvcxG5ZzVbfOzWyOj4HgSmkOYq2SeoEl4IXNh0V6tSYaao+qrXhZsyfCEKrJY6O4sgulk/ds/Akl0wMnZkbuoTHTwbBlODhkFSCD9greBoygsiH7PLJIk0Il64rSSdXhzVHeMSGlVUiS5zR4UXOtAjfaEU2GTcDpqo59mDMpvF41uLB40jXKxy8Lf1b7Ixtf1PWZutoPpBVkCNvXrcTIZ/OIoLzHEHWMjFfU+JNUzXflA0dRLVhwpBWnPC44WaO2I16jyCSweHEWujmSHRJYHjg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHzb/C1XwMr15rII0DoKrDqJZRAtMuHv4Pj5/4Ychf8=;
 b=cSAC5KOWkdbgoQQbOCdqy0x2lz3pKHcKT97y2rht+nc9j9SQC43zxQB4nSHA9c/8im2LjYXceT5iCoWsDbipX/0+P9sYCBYnRZnIp04wnoqLg3Rff/gecamJ6egI1XKiPYXkz1y7WeeYH/TVS2O+PyPpkTfGpu1UB03DZ1W31CxQmlOKXf6a0uJ11Fom+Rffku29xyS2pZrc9CgXwtY/hDGkmrctoOT4pMA/4MMKn0zWeIi5DtUkEhExtM6IvIs47piTfHjimiHV4SaQz7XlB6xpLGHGS20qw25lOemmMhBMJZFDYrgxeIjUJqbVRFRuqrrvd2153d4zAGHb71GpYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHzb/C1XwMr15rII0DoKrDqJZRAtMuHv4Pj5/4Ychf8=;
 b=Eu1DrT+bf/QoIgoNjL20R5+WVCUuu0jkvwaOFVWdLn6Ntw7J0HU53emnP1R7gzA2mIzhsAL7VJKtaYPxBkVbfT58WtTtAbLLRpJGa8PiSf1VFgJlSxLi9JRoqicSlHCbKi9D+Bey7cUfUeYMD4INAs+S9wQ/y3PKCfv4keRdNt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB6670.jpnprd01.prod.outlook.com (2603:1096:400:9b::8)
 by OS3PR01MB9463.jpnprd01.prod.outlook.com (2603:1096:604:1c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Mon, 4 Aug
 2025 08:58:11 +0000
Received: from TYCPR01MB6670.jpnprd01.prod.outlook.com
 ([fe80::ac12:5df5:dde8:96b0]) by TYCPR01MB6670.jpnprd01.prod.outlook.com
 ([fe80::ac12:5df5:dde8:96b0%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 08:58:11 +0000
Date: Mon, 4 Aug 2025 10:57:55 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: renesas: Simplify return statement in
 'renesas_i3c_daa'
Message-ID: <aJB2E5wJ0gtIOy0f@tom-desktop>
References: <20250803211256.18513-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250803211256.18513-2-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: FR4P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::19) To TYCPR01MB6670.jpnprd01.prod.outlook.com
 (2603:1096:400:9b::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB6670:EE_|OS3PR01MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: 202407d0-b2a0-4e8a-793d-08ddd33509e6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e+i7l+NMZ7C+D7GZmhASONSScSPwXpwZt6le8klkxjO4IPxF+6+0F02LQC4A?=
 =?us-ascii?Q?Hj7wqE0XiwjujqNin04c1o7spAvIMlCRSwsrzdma7I9peaR40hf69P3VKwR1?=
 =?us-ascii?Q?fjVGIsTpTCGmb6X9JKV76JnLFxWe+Sa2dtLwtt+YaiukidwVTPuPz+YX6lcm?=
 =?us-ascii?Q?Ouehq+mJ8xIybHVOX4CSFEmNPiVMdSj4suqYhLIr7sTGe1qKMc5aEZsmPjVt?=
 =?us-ascii?Q?WnfTwWDGRgejju4iHVuAoTun02Ee5OzAuMOKTY/sVpLuT+42AGfz6Icm2cQP?=
 =?us-ascii?Q?E0tCpKlkp24cxVNN7TYM92qmcFQEv8NkECXivk/tbdQeu61KORxtSRXveFGc?=
 =?us-ascii?Q?m/HVq435yLCHZs/fiY9WhaDtMQAfPm4N9DYhpkzragNdnkQLwMijA3VROgFy?=
 =?us-ascii?Q?SLNEtHECVmz+rNlJ05hsi6Z2fyDVS0akvSBwum9y1fm+R3whSTmbH9V97Dqq?=
 =?us-ascii?Q?9T+AOzBool7pSzjYWpKrc0atEKyfj01BBDX2maw2lWWIA8+7Ol0hqnIuOwai?=
 =?us-ascii?Q?T29tEOMxw/98of+EMpii//uYvrSRCKLGm4FkMp722yAgGhC8sJkhVNCN4HW4?=
 =?us-ascii?Q?4Jla0XDjUcTKxxkXM/bxdpjRc0FjCCwICB1f10rpmPh1AjkA2/vkGsfUKMAe?=
 =?us-ascii?Q?vYAWjFVvYa/wiA89k9CYPIjk21QRrH6NPfgQx7owXDrH8RSV8MDe4LnCjLqD?=
 =?us-ascii?Q?UqmOPOZDOjAbG9jUCKHYAMk51ODGgZSlbad+ktKleWP6gzNP5wJslTrJ2Xt0?=
 =?us-ascii?Q?83437R1UpSKO6WoGfcCBEByjadZOs4B9WC3OHbf0BNR/FHM7ODeitiPgew4B?=
 =?us-ascii?Q?t+GpdY+W+5yK0M2BfZD54X+vZTaNarkUrkigV28ymOSWohHAMw4w6r95N4wk?=
 =?us-ascii?Q?f1J0TihqI061fH1T6D836gEQPdqrBdU/TPVIcdkNAoLTb+DsH07Z8p68jVju?=
 =?us-ascii?Q?IrKwzWq4x/fTuwXB6ulnW6Jgr7y+s6QInoXeAuD7ffqnqINDXduuZO8tL0fe?=
 =?us-ascii?Q?Gzab3pla+62bZm5BiQ0JKOYjyC8hqXwZj+56DCJsz212WaHknCX+Q17T/SU0?=
 =?us-ascii?Q?RTGBVu+LjIZPbOlfqk/KFMrHYsAh8yJF5IVMkPCzhKX2PILa2hDbKTdvbca6?=
 =?us-ascii?Q?XQHmNXoa9cGUgm/m/oUFbiJQyzqp4BUk8Btz1y8coG1JNE6+NAUPGWQKlxLn?=
 =?us-ascii?Q?ErXlRShS4pHdYNl+DejMohtxc+NAx+LTwOTDp5xr5Vmbt+hlqwfwLIrLe+Hi?=
 =?us-ascii?Q?MRi8jANulvQhV3428ZMdFMJui21k0rwtRPmHc8m0GuakBXQsjWCu2IuHIrbs?=
 =?us-ascii?Q?DZZGwwP7NlqoEJIeyvaehvLsVRJEL9AQbXoPveW5MhuXdkZUw57lxD6B1hx0?=
 =?us-ascii?Q?BjktyRj6IAheq6qZGNVW/4PEcG6qk+LuBIo5d38ta1Gy8hxLH+cbWy7zDLFQ?=
 =?us-ascii?Q?7SEXTUfHzVQjaTYfq46eZ8jGFLQ4Bon8puzjvU6BDJM/bw8LmSQnWabydW6p?=
 =?us-ascii?Q?ZlVZPKBU5lXOL08=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6670.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k94To6kXhCdm5xxbY1rhO/CR6Qb8higvf1GZ4lvUWS2WdqOaepfkGyjY0/X7?=
 =?us-ascii?Q?5KUfUKromBoC39ATq2B9GPCS5tKpYtMlKYvYBYCkiy7TnauFhn5lIJUvuBgu?=
 =?us-ascii?Q?6X/hFKnvE9gcnxfF1PL1fQM+teJQ+ZB/QYJGIlSvZmTMPKx1IizIYO7kzHTb?=
 =?us-ascii?Q?1MjjyICQBi6jpZWogmHHj8ZVZeBwa137YiRQTNySOOBY+I5ZNyJDEmFY3oe8?=
 =?us-ascii?Q?Xkrdit1FuHlUqrT6AayoOXuvusMZdrLNxZs0SgNoteFd7uS9qlBXPzY4/0Ev?=
 =?us-ascii?Q?3KRqjQzuTh0culcqyTE8kq0tePaPMwtFCZq16MEHt6AgDnxiEC+CHdO5Tlbq?=
 =?us-ascii?Q?8UA5PS6aq3je89H/7PBMD1IKFR0O4b/eH7/E3XlmKbsqedsvnMnb9/HCoHk8?=
 =?us-ascii?Q?18TaQRjjQaSQn7DdHRYHWc7GjXbfNi/DgrXGRmAiVSciuQFRsQNS3qNKJ1qn?=
 =?us-ascii?Q?fk8FzUjEXqWm3yYFUxNlWvGVrw5TAgugLkE7xnjPqwI192DVUqNVZFlp/uGU?=
 =?us-ascii?Q?0B4rB3dSdLguQZlrqDwLrETKN8m8/qywXNxpobbJcAwLBu0cHghsXMdBM4hV?=
 =?us-ascii?Q?i+v1MWgkhtKvaRoVyEWfTL7XHvkIS4rfZdQLyv8Wmvw04YBvq8AU7FxzrhoL?=
 =?us-ascii?Q?FRMNZ7eJp+IZNYKntB7jF7Id1QIDPoEE77YMi9/2Q7R6VtR2MmssFRsSHlJ4?=
 =?us-ascii?Q?PL0v4HPblKIc3DOQathnTySC50WB3oyetLLXaJAenfTrdIsI+W/oIpyjXMSQ?=
 =?us-ascii?Q?suZR0y1BQY0Erm1MFeAhC8fkmit0kCFhfQi9vPcKF8CE9E4QpvI9E8YUdXaN?=
 =?us-ascii?Q?JeOQBTaGaeLMeoUKw7yp6XAJjxFP1+QaLfGLQpNYtyieyb+yHgjBf/sYCQaU?=
 =?us-ascii?Q?Emtn3tBVO3rtse2d58HsKGlsHc0A1vF7rewFt/85zoQr4h9wTiYHag4exsGL?=
 =?us-ascii?Q?z94yPAWgeWJu3qKQZcz2yNcUZ5hc86r8jTJxq8RuMsb6CizN5iHhJlyfuDyu?=
 =?us-ascii?Q?g5TWZfp3DHUwWw9WNoKXEeoxKTmXdS70xIGTIMwDRgGsExDJ+1WK7Aj+ZSZG?=
 =?us-ascii?Q?PNsE12FEK497wA3KdUfn6hmPZDJwxj0AKlWQPcsOVswrMcIsDYcKXzkk2adr?=
 =?us-ascii?Q?3Z1g8nlUrhJwR2osrmVuO41YY5GBE5SA3Iqb+z5XJumFnY4wwMw4Ctsox7Ea?=
 =?us-ascii?Q?XmeKEM7qJ5kFF/pk9AU6KWtQbuAfQpM8XDFjQ+b+TQuCLtG+ZLmzQo6tfXgl?=
 =?us-ascii?Q?oxITWsFpuY7DCPyZ6iwEV7HL48p+QjPuJNVTCKc03H+8AYg1yynCpnxMkHRC?=
 =?us-ascii?Q?eJWrKe+j7OdOW8PJEFAby8BGCKjCQ8XETMEqW3SFwhzeG5WzoV0fTSTkKUWB?=
 =?us-ascii?Q?6UpgL/rDRVSEO1EkL+jZ5fgnPlVZ8I4lRtP200PXihxhfaF8lPV5Jq5b7amE?=
 =?us-ascii?Q?OMEoCGklxb4WRoQkNuFmgJy10uJifLW4KGq40EGO86jh4kabLSrBQR40B8G8?=
 =?us-ascii?Q?/2QK7v5gff5sCiYuy7m2ToQE3FaHASSGu2slO0vsIKlD1bkhBEVo7jIbXSfG?=
 =?us-ascii?Q?c2lHansqd/oy9C0B96LDkbtdvI4kNjLAXCytdzlPbKOUbDITFCGxGvKZez+N?=
 =?us-ascii?Q?Z+erFsOixw6FsSwwJ03tr4Q=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202407d0-b2a0-4e8a-793d-08ddd33509e6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 08:58:11.1468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPEs+XbCAYgn0JSq0BDu2QhX5POtSTEkYFTWTKd4qXrhsmnB9NIg96/MqslkXtwte2i3JGG/R80YyXcm1SOx03HRweOMwNp2ebWfoVNWYLlz7r3tjI7yW0yeObgOG5gG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9463

Hi Wolfram,
Thanks for your patch!

On Sun, Aug 03, 2025 at 11:12:57PM +0200, Wolfram Sang wrote:
> There was already a bail out for 'ret < 0', so we can always return
> success at the end of the function.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/aIyzJ7HOENL1qp1l@stanley.mountain
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> ---
>  drivers/i3c/master/renesas-i3c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 174d3dc5d276..275f7b924288 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -679,7 +679,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>  			i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);
>  	}
>  
> -	return ret < 0 ? ret : 0;
> +	return 0;
>  }
>  
>  static bool renesas_i3c_supports_ccc_cmd(struct i3c_master_controller *m,
> -- 
> 2.47.2
> 
>

Thanks & Regards,
Tommaso

