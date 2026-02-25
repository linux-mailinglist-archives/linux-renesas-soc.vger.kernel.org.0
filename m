Return-Path: <linux-renesas-soc+bounces-28447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHAhI6OqnmntWgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 08:54:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFC2193C44
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 08:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D638630131B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 07:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB51030C35E;
	Wed, 25 Feb 2026 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kMJUDRi4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9000E307AD6;
	Wed, 25 Feb 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772006033; cv=fail; b=EZ/TyXAG+ViYQUpVZb9A2/a/J8BnTLu8EidMCoDhiqCnBY9gBetUpD1hglFYX99en+si1H8FAEsOrmZ/WJKzYI6f12sU/PR2Xs+WVSoZcd9nzrkw9kvzS7CpwUhpIKFDsITSWZrONTHJTkQ19KlHfZF0V3Xa0ZO70CRQMizf7dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772006033; c=relaxed/simple;
	bh=M3+hZPGm0Pkp449OwrQkAQ5JKTuceovjlftenT8atwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZMhHZoqLoMGMlxO6BgO14mK5lX+vn5nvRqq4TSUuHvt9spyooNpcEVGRv1mG2/2JGf03q0GbAxwQoZPRZDMAklWRH/e7VdKZ1YFKkC5KgQmSmlvF31rMO8Hab55ZkQdvUzk2VskPxHJS0vQsX0jCC761KQxDr1HTTU+piAhqP58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kMJUDRi4; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqe3/Jr/plmvQLdWXvwhPZYF4z86uY1buT+DvLVkEVhE2KSz1BEaG2k0KBdDbZbL/MdPNJM6pTvQjMPrCx9ERvRcCgXwydZiSAglLG+i7cdjBi94i3layXunoeetiY/FlUHzTzfxX4LJ5nOIRYQkyXeFVJHYrhZCySBcm1wN8QTuYu+oXHjhywPS7QrzlTzxD5v4nHEmdhU0zHredyvsJrcRZieDuFIrFtdqk1WO2Uaf1UKGtcBiwrnTfyBVbaMTFqUyGmribEkQX34UmsxiQJzpWujcXTPjELECyN7zapgjbVOdArwtia7D5UCzrBM3PoifwcT3mF+wI0YZwwhFag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3+hZPGm0Pkp449OwrQkAQ5JKTuceovjlftenT8atwQ=;
 b=g+35mKSQEKmH0XQ3jsG8zYVlIJ6knihQI/Fl+b4vJXC0b9cD9MsHYOgOTgiMBl49ZmLAuVt18trTyID+L3jYEankzqdyTWxSdJ/mgy3ePlNY/cbv8Z+s9J6ffDguQV9JpoXrrgmZ5JeuuA4y2/7PwMeWF/qoMbiRI2daDLlLvIWhZxfB7XGfkN7LLV86B7T296igcGqznroqHnao3gYczOK2AjQKr6fZe5IDu6VhIJTCAU7QIfvD1YLHP0w6scYOSGSEyz2dHINj5B7QiJNw0VWU84PPEJ0AF6f26AoAJW5UbMsHrHZwHlzCzYQrYCp7bpx1ZetAFei6UcqLrw1b0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3+hZPGm0Pkp449OwrQkAQ5JKTuceovjlftenT8atwQ=;
 b=kMJUDRi4tM3Z9S+6W0cS+F/36qC4mt86nujH+SBYpzAWYRXaDYuOE6YDnQfp5KCUQPSLbZoxput7BjQ48xW8deEmnUK7hdt2lzmWpLE4qy8uaQMbIxT/kjmoYwFCzUtAZy2Wlk4SIEgOhIgXN0l4cuzz1orB5zUfQ/lW6zrAhFJuVHl2ABqGbcbndDIKwMvHcl8A903/rBB/e//vFAv/pwv95Ni5qB0hPNEu3e1lcAs1dJo2XOSfinbctIVK0xqtDJz5fwK3B9oAbOJRLnDE8EHfsO2dbGxIjYZhy/cvicSy3afMhi+F3R0ewqBzZjDWIObGggEo57ckQDF/pjfHtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 25 Feb
 2026 07:53:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 07:53:47 +0000
Date: Wed, 25 Feb 2026 15:55:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Subject: Re: [PATCH v2 6/9] soc: imx8m: don't access of_root directly
Message-ID: <aZ6q+tVoJFslHIcP@shlinux89>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 3649d7b0-9a1b-4fda-decc-08de744301a3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|19092799006|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?83Y14lvjQKUqWFyIUcPHqzNt4fcDk+6y6vq6WR0RwXxfvg/2EOlC0yJTtbV2?=
 =?us-ascii?Q?fWlpnC8dsLYUfj2Tc0/n5sgdmL6KwGGH8AM5VzqStpOS2ohOE0+8af9L3L5R?=
 =?us-ascii?Q?PnqBn1USKIhcM+tCmeR3+sOEtVphrajyfFNmnX32C0A14QtggsgEAp5ZGGmc?=
 =?us-ascii?Q?Y/sVtqXkX9xsbh5UvVnz8Ga+8fzC3gajnxiFdblCc3pUfmUEHkcgkldOUuw3?=
 =?us-ascii?Q?4fXwN21Drcu8NfLgDDtX8RmamlzMK88ORGR6z3BnYvo2o5fJvEAzxiqLkh9P?=
 =?us-ascii?Q?XPRX3HEcvcVV5r4dJ1VBdMaThfS2w/LnXGVyn5oOXJa1tKP2EZWvc7aG/bBY?=
 =?us-ascii?Q?FEvzijLXZEXuSfAXHjfaSX6pR+5s56spTg4KXmnXJRpBlmzy/5YCche7lkX9?=
 =?us-ascii?Q?hHqFv18KQ0JLKGe44+cOPAcR8QGzbLdbJgn7jVl9E5TWOvHh9DuMHlAP2/WZ?=
 =?us-ascii?Q?8M7BYlZTrcX8wPoqYo7oOtxUjp+OpTcALtMqibrqNpriSLkKK3PGDQz5UMFW?=
 =?us-ascii?Q?WBssa6Ad67KXNlfVsUpz8O+NhsZcx678/AlYQqPGU3nZOqFkWR9oNrPE/t/7?=
 =?us-ascii?Q?8ItvyLV1xmUGrCfNbZv5XWGx4khCI0cZM2KwBm7HtL3Jo2/ILTDcoWskoNLi?=
 =?us-ascii?Q?e/CYpN0TniZVe+ApCgvFUk7fVskrSOPLKuJumYqtgEKgoCR58E32bOCQsx0V?=
 =?us-ascii?Q?4KnoTIyJoVEsV345y/elzEIlmQtvHTkI+LDb7+pG4KU6KkrJ35iXoRY1qL3O?=
 =?us-ascii?Q?sSCod3CayzdFCw6F0fdpS/aMXHIDkBwesreRYaVCzdRztQ4ABWRtDsbrfjFA?=
 =?us-ascii?Q?pUpp5LVAAITGiLHr4HwbfGptIOdun2AyZOa8hlWjeSQoj7ij9QvMjZmHYaS9?=
 =?us-ascii?Q?yRm9tE5IWXiMptaQxXY/y7yJF5SCfZD8YWkLGuDrpTnwuHIM8KGJwfqvjRFj?=
 =?us-ascii?Q?Su5JteznoFga8d5Zd4ULGq2oDfS50tPTPkv9eLw5N+Fh50QRqzkDPVpt5Qy+?=
 =?us-ascii?Q?O81AnTFGkakFcb9yMbkblJIwIvOj7d5bDt+ueaYeDaAqmDg01BWavwDiqj7Y?=
 =?us-ascii?Q?fxnOSMWofwb5qnmY8CepcjFX/pEUbhM/qzf2Ce6AHbcwwBTXFYcNWQS6OLI8?=
 =?us-ascii?Q?SnxrwUZArXu0di8AHtPxVkQVQahDhQ7ZXfatt8teudwSv/PMDu+zZO4dVLG+?=
 =?us-ascii?Q?IwiAym1Hg9XOoEt6VjPyeaBeaR5dWpRSLzfLq5wBj3t2AgMr5WVJaJiwqcIM?=
 =?us-ascii?Q?Pu3Dz12gvboiAvhh0pTluWa0IohKStWEreJDhO6Aq3QggoN0hGIgK3LF5Idt?=
 =?us-ascii?Q?tCpw6x9dDwK/r9YKo0CKwOlRYW2P86ES1hLmCI7A29zmCd56gB7PsCOjGm20?=
 =?us-ascii?Q?aqvmuAB00SCpLXeapXHjfNpAprH+vTuxOTr9O/CunS/4jwiNjHzwp/i1Rny4?=
 =?us-ascii?Q?YnXcUna8ZrwpLOhP49nRbkvHkPqtatYA9cowyfF5mLaZZjGbiF00v3QVGZmI?=
 =?us-ascii?Q?LPhMkHdJMBGtL9tZuy8khFZPZ77da1nXamf9n70PBBb3jfHFOaIgrA9ac3KO?=
 =?us-ascii?Q?xb7OwoVMzjf/A7cK4U5WrQNnyB+GdIa55cVO/b1c3+R8aiiT89dnQsALukk/?=
 =?us-ascii?Q?MwYxJJAdU7gdfE8XIFIxxE4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XQwZbRbLd5ZMfYbE8awsc1Ifk8jjoufYdkCnjHzolNMISXpq8hD3qPaL/wG0?=
 =?us-ascii?Q?rrukLGl3TbT5Lu1iSaMW1mhocicW3ktkVxM9VZ+inSvILv6G3u8mOhCOnfqg?=
 =?us-ascii?Q?ye8VrmA5zk8anuiYjTrrKHFZuZLIgLjG8JMhsFA0Tr3fzK9oKxBtDhWryffB?=
 =?us-ascii?Q?5pVF8F6CUtgyApSgXOgTb0PNQCX7CZ823wsERUhw1DLX1B9OfYg9tdfxXY5g?=
 =?us-ascii?Q?A6Qw/iXg7J57V7G72nu7yxjGlHQo5JZYnnRP7wGsHp61vGys6hByVKmsymX3?=
 =?us-ascii?Q?UX7lPgcy0FxEGbsTCn12SohTugTHbyMSbRzmipYC/oFWrRPmfATKuaZ9sM5d?=
 =?us-ascii?Q?raAhmBEw6mH0qy2U4eFeOluaAc3kkLvtHTYJXUBtgf9QDEEGHYLpVHzWCBIw?=
 =?us-ascii?Q?k4QuzrM5mv3dGDE7vFswN/rOE0ySU3iQEFyTrxM7eCWpl/HuXqP8q7gLcjeA?=
 =?us-ascii?Q?x/ZdPIMMojI0wZdFErfvrs125R0OpZfgkGTtHTe90FT07V0Ss27JJD19BeZt?=
 =?us-ascii?Q?uc0bUVQU4yYCAaNYgvz0vr2spfLdLRipcHgRbODtW/rdvMMtNH3Fq2NG6Lkf?=
 =?us-ascii?Q?Y8UcTaWbGDa16CgzO8cH6HcIHhcUAyRcfRdK0YtB/qlFgfE6mXDJVbGTiuFd?=
 =?us-ascii?Q?yCED/hhWXx8SoQPzPtDWy7grzkyBUtqu4VIQhrjgzOEDi+VGulManwPMU/YS?=
 =?us-ascii?Q?IVfiNqICV7kWHocH9aFpWPuglI32IIzzoSdxtDUULHK2i0FgUIWMcHsyPM9X?=
 =?us-ascii?Q?91tFLecCriNeb/DpChcxJetVz6Weyb4rf5sHtWpwcHqfCMMqUG3mO0xEMBhh?=
 =?us-ascii?Q?U3Pzsqto491G2H11zaug/MATGFCgn0zxQIdS4ORcWeCRO8wUpJH9rn4o/tWh?=
 =?us-ascii?Q?EQNn/XF4sWroRpodqZGXXyiGANxgq6N9gPiIYjn2ifbZChDyT7ZmlroxOTd4?=
 =?us-ascii?Q?Kez/AB3ZJEKRdoVVHXZdQxKFnplRsnFQnG1sv6SEAg8geLhKfDVEiFv5Hf++?=
 =?us-ascii?Q?dHxS0riR3hXJPDuNRZLmNYfAjVzpW/mwRUI9RJIPl+sHBmqv1fcLYi1eEdZ7?=
 =?us-ascii?Q?h16fEq8RWTwn9GKGRLLoy5DyFkrDnAEMR97wHwdz1FaoSHNVgQ2Veg6++dFy?=
 =?us-ascii?Q?bJqWjACbbt1+tpwgB/7eYntXlaS28GvVYtkNvNWYSY5JEvwcqy16OjLR+TMp?=
 =?us-ascii?Q?q6EbbUV65KX4sgDNJ3BHmlXXx+fP3WZkNtcDGTYeK3vGTCWE24o+br20KRCT?=
 =?us-ascii?Q?rBfE2PoQ0WFn6J3yRxVoQDcywllmOhfmffXLHZmWCBrAzply4wkOKyuZBmvJ?=
 =?us-ascii?Q?yNaVfj6sOCDeR1SDYIjK9GAau3CcDIhW2CIFcochRhENHb9mzbXlm8UrbYVV?=
 =?us-ascii?Q?BNf5VMvY0IOeOIMTUGiNimXeeBtj3VQ3nP5IH636hipU66/TKZX/b4MT1Ljj?=
 =?us-ascii?Q?Hf9jMn+KOFQbKI1X+10qG1gV82ECsNuyOfmRsIgteU2rZWa9MHfpyTnWoiNH?=
 =?us-ascii?Q?U1VpALc2WH/LcVsVhvdZ/t+vBY8HZz5FU+v1oYuplQQ585e7C8VYQ5A0V2L8?=
 =?us-ascii?Q?421kpOCm15IKrgikjjG8XY5AjT/3F6kORDrqSwH9MYOrQSQ9+jHDbxifypXS?=
 =?us-ascii?Q?THcFrCIyDWeV51lubdC8YSTj7rjJGY9Z5SSdpBfd9aoRiJDBoFfkhy7jp4h4?=
 =?us-ascii?Q?0F11MSYboLcpQfydZk63aF6u0csnZXZCOaYRgdLGtSwwVhLgxF63EbHiGjPR?=
 =?us-ascii?Q?AUekt2FD6Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3649d7b0-9a1b-4fda-decc-08de744301a3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 07:53:47.5204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 882pbkHIOZlFN04X6CRhM5HiQpa7m0OgTzKmulFmof3qVqVMwqIPl/i+BvPzoNk2LW6H9tH95kqP+068oUTx5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28447-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 9CFC2193C44
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 02:37:21PM +0100, Bartosz Golaszewski wrote:
>Don't access of_root directly as it reduces the build test coverage for
>this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
>to retrieve the relevant information.
>
>Suggested-by: Rob Herring <robh@kernel.org>
>Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

