Return-Path: <linux-renesas-soc+bounces-28614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGWZF05BpGkgbQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Mar 2026 14:38:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B990D1CFFBF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Mar 2026 14:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06C3E3010D84
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Mar 2026 13:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDFD32D0CC;
	Sun,  1 Mar 2026 13:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="XDz+ksVB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021129.outbound.protection.outlook.com [40.107.74.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A734328635;
	Sun,  1 Mar 2026 13:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772372288; cv=fail; b=kTrx6gMD0Q/lYrkHQb2fkMz/inr2Qi8blELaS6D0HWyrnV109W4uKizyCkzUPGILYtQM/sn6iqX60BJPMD6CQBC8SplS7nmjrJRE5AR+XE/6+qwIIH80Sn78FarJe5RErHaCjNfwr15l53o01eW6rBKato3N/PpyzSuJoOwMxd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772372288; c=relaxed/simple;
	bh=/tOwpXSbaMmgldEEnbgYSvHFP9Ekb4GYKOVp7gHkUtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HNMt2Mm62JYybC/ytyXhKO3koChbADiLzBNt3ekNO554G2doFYKEB8inxADVTH71l8tO7eeek9CFnyj+FRWWYt3wbtfOkHzddURMYVwHEX5BA/NAkoHKkYXkN9cjFDZt+Br7wz2YP1FdHpZIGoREnq4KpkHfvCBq84FgHobVgA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=XDz+ksVB; arc=fail smtp.client-ip=40.107.74.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNmduesqti6koRRkH8e40e5MHIlaOzmKLAYG6AaodYB19B8BnEjvcxbEY3qKxBvxXMY6p9J1mzTKnFyd+8Rh5+DcY63dPYVFCDysMFuwwHaWLowEfeIv50qhTiMRShetz9PaheXHW/ARqT2o4YKRj5maj/zljOHOusRMv4GFJnH1KpwAf71geWBu/Q40XYROcZkaF+MvAWlh2oQqcIyjRbZAqmMui/neDZnZoWp7Z6XPKlyz9wrqPddKU5lVhvJ6+XaFUNZ5Wc3Z9oD5/C+5smONDC4L1PMblIah8ZwZYU8LRT21UH0zoPPZhN3nes/WfrH0zIjimbqSWlBDtAX9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Zh1YWQefFEIXTG4YMjcBJSXaRmW0Hpy+qI+xzoRWSI=;
 b=lkd0dfcxtfi7C9hNvHRe1QiHvjdGauk+UEjjoEemzZw2JVCpyoqMT1AvCryIvM4B4DHonjZocC336A8u7LusRMHr0uMm6Z2wvHamFjnGRaJaZkDhRdtHmAQ2Fd/bK+jAZMml6VrMBt0NgxAmGqZz9z0lrBK5ez0+e23KhM/uogmPY8lsQYsMEEHjkzbawC75y0gsHs4Di/MO7NlIuVO7Wu/YPnzNQYUb2xEVA58KabrsNgp9f3ZH71RmHnA6/SPDjPFsfeo0YdmX830aeVllmVxz+eZSgNaQ5ag1BvZn6760smK4O8eYmzAgcpbSLAIob4l4bPNmi6NdXc0n5HAMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zh1YWQefFEIXTG4YMjcBJSXaRmW0Hpy+qI+xzoRWSI=;
 b=XDz+ksVBIUCRisdqMzqzfJF7TC6aMxbBJRjWT7KIOY4lgNbpZc6Lqnm1N8R5QyilKmAWlQlW6Ye1GLkPMDxK71NWpUlwRmWTwkk1zP/3I+ZRLlg3e2chKmIgW2jKeQ+QleoCusH65t174kvWKv4xV/HXmGvjQRt7IVfVgNcLXZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7053.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:343::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Sun, 1 Mar
 2026 13:38:04 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9654.015; Sun, 1 Mar 2026
 13:38:04 +0000
Date: Sun, 1 Mar 2026 22:38:03 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Manikanta Maddireddy <mmaddireddy@nvidia.com>, Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/9] PCI: endpoint: Differentiate between disabled and
 reserved BARs
Message-ID: <sutj7pvizlofyr3pcbv2wgc6lned4s33du3g3tkqveaofj4g5a@adfxekkfxeqc>
References: <20260225170324.4033466-11-cassel@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225170324.4033466-11-cassel@kernel.org>
X-ClientProxiedBy: TYWPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: c333a983-3151-4b74-6382-08de7797c410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|7053199007|27256017;
X-Microsoft-Antispam-Message-Info:
	tQrPIpxmMfwcEE+L+teDjVUBO74c5nClUH7517Isb8JzqM+WmDwOZ+0L2ZriwYqXyaa+ibDIl7mraV4mAlVw2DbU/XvkyYU/hJo+AQJued8/2uAVnDIehU0JmmL5nheOng6uLQ3xJsVModYihwTsyNI1Zjk1bD6Jh+p7iM5+QHVDCkx5uCK+Zo5QM5hrvpzcla0BAfZBJo5gJkYSUZgMOTD+mLs6MJp4ySg4xGitOxXloaS3eN3q2+L/zifr9ZAE3EogtfcgVvlelhYjxHH67WmVo8pyEe26cS3b4F8b1Ilovi1huIyVHnFKjARg3fZUvougPPF7H7niUZvPTdsbRdUWz41oQeVwwiyWLuMkYfq2LBWabUDAfoKQpW+ATw8zopL26rQg9tqB4ep8kjpLVeS7QOCVr52VAQRjRmRJwqlrvxd3Mxr3FcBAedr/s6Xk8Afhac9jTWnjTjhY61omOLyRR8XAp1pFkFA8RWVOS4VAueym3vDTJvm89rEfpTXwAC6KWS9IQpVy4CnuT8UI3untRkxMDkUsMgSld+6SR8ToemNlCJRAuBoqnK8sA/Pdsj6X8KmNmYJt4CfSL/GGbKLT6A9DopFYfVbnXIFCoZ6PKtS1u68AzSyT/bi78ufWdwz0xHsrkaEOsWMQ8fWYSpKrBflnfX4880zfDYsrb2u+SsVP8Vj6Q562F8/1DXeZtSsZAsCn7jIB/JoVNOBfjSTK87W638wMPbzL1MO6I155xe1ffHgp+9tQyvw1NUJ46ek6hpkXPYv36cp0gJw8ha7PleDkCi8RLeDIVVwgn3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(7053199007)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7OhTa5t6m1kmN2sju/zf7/4quwAvRwtc0ezu6NQgaulFgOlDzNmUJAsVKP70?=
 =?us-ascii?Q?jzB9nw/qWOmKEpT66Gn9e4DwHi6Cy58X2ueczpVQPBXdnH/eLBTj/4m3J21j?=
 =?us-ascii?Q?X7hFNc+4JHDRC4SIcm5PvdYq/TlwHHUEIHa2VlWJiFDyZ/KEFywescvLLNdf?=
 =?us-ascii?Q?co/SfkdvfnRlutm+OO46SjOH4etKCJn74XZBWBvKs5W0XJnmTo+a4t2O/UMj?=
 =?us-ascii?Q?om6pMY/x/PJ65xN4Xk3yWkUN5QO52CykGRCK4i1rSiUaL3TzMAfkR7fWNQt6?=
 =?us-ascii?Q?GEA61wpPYEhZXpIKMPKCc+urid9VXrMUlPk/aLk2DYyZI8YHvCMGOu8U4Cmz?=
 =?us-ascii?Q?C348/rt0UMUoH9nlK/+3u7eV29RoRsCxeASrSIEBuz5NWlameMEXTdbNV5z6?=
 =?us-ascii?Q?IuBM2MOSmMm3ts5U9E+Lon4sMLYKG7BkA0uFUDu5bALGpfR+/y+3OPGxkMUd?=
 =?us-ascii?Q?kZrNAbq15sE2hYjOO5/nDeoEhBQwW05eZGyPCVUuQAMlgQo8jOPgO3ckCLF1?=
 =?us-ascii?Q?wPC8oOYuUv8gnrowq6fUlNUskkPXVSqeaLoxrfyyVnEi2tfkLb57pkMk75T9?=
 =?us-ascii?Q?P9nqT080YSxARUUJxzSS61dKFe8QsIuaBLWSrB1EUTrmFmc5hZ4QoISe67Zp?=
 =?us-ascii?Q?d+3mvf9GHdOOmB3PgKRAKkSvhzYgWkFndd17VYl0e8+MvvPbjav5HhsHEWe3?=
 =?us-ascii?Q?9VGh1BILA2Gk9fv65OBWYlExC/666Up2/EL3G/kj8dTFguuPL/cHsIZUP7n8?=
 =?us-ascii?Q?HUAQSw5rKnooECtKHlQJaab4T01MTIWfp/LfONmMYgUnTKhVRswSMrE/cZpg?=
 =?us-ascii?Q?lWNJ/0fScQVYxABXeAhKvP8OCWhHfWAecpJbJCSHfTTxfKPogGawq592lPqs?=
 =?us-ascii?Q?HebL/Sro9GTQtjTTZFr9MEVil5uD5Sq38vLlyJCw90sNg7aMxPtYTgjezRi+?=
 =?us-ascii?Q?rFc3YH5kwl5HFAolMrk6XwAyfxNJTlEFYZUQ6+UC4GYO2q6SRsSW6ON06E3J?=
 =?us-ascii?Q?D9DlYH20vCGwCdvvtGKLfKJtjkw3EflRszVY510J2QQR9MtJsArZlkItgcMj?=
 =?us-ascii?Q?S3dggTAieWJljD1EFXnfohR/G80VWPUklh76ZxnQMz2cYbIztkn6xW/NpsMR?=
 =?us-ascii?Q?MsBebyEtkkhkc5FjZyjoEWaRqtzMKwTviwl0gysdfQVnxB4Mcqldmu452mDD?=
 =?us-ascii?Q?/pnHzCBz1/dCHTUwNwpFtuZn+PfmNqKNdXkrUhpBgmp1uWvpzLtAXlV4HSdL?=
 =?us-ascii?Q?DGu/EuHE7b4iZ1eMHfm39BPgwqwMb4Zz69RZ0x1wAdHMoHKdMy8imciTwOnn?=
 =?us-ascii?Q?EzmmEXHRvZhfauMewHdcSW7aDkrsAZzdgpxzcgkZDQALIL5TpOAjdY93FvdN?=
 =?us-ascii?Q?48MDo3IFy/hHiQaVDZroLBCVFT4mvbM7h71mmk3W8Jen78bJI8I8mP+n90tu?=
 =?us-ascii?Q?F7GNDqGNrDgSVDhwS5Qf7kKhek3D5ia0OKXSPl7lRRi8J2aN1cgSMf8IPQRR?=
 =?us-ascii?Q?cEPBB7CUL5lc/pYHtBU5REX++gn0p86LJBuOumKWeqs1L67bJlqXGI6e1O/W?=
 =?us-ascii?Q?KgA1ZZbWaMTPzyGC25OaXIlYzzPMNGExWgDQe7rj58pg3UeRlaN4Ww/2qmaR?=
 =?us-ascii?Q?+EDUs9WpzpOjwJpYrpOVodxE2gm5MHZYBWaG73IWS+SSR3tTMAC1/SqjFW51?=
 =?us-ascii?Q?FI9JPPp5YNiSjdDvsA86jcqb6I09KXHaI82cr3T8LbmirbdyV/CBnl8XeEvB?=
 =?us-ascii?Q?V/PthTOUMUWCw0S4z7H3f6ROd2LlEdPYIfaXF/pK6z/c91TIWEII?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c333a983-3151-4b74-6382-08de7797c410
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:38:04.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lbzo/w4j2oLrOzAxOJ51/onmXlSYGb5B0UKNKwcMbY5evR5ePgQv+8C1+PV2q8I0vdxXm/vnY2Squ0JyoWKzgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,linuxfoundation.org,ti.com,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28614-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B990D1CFFBF
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:03:23PM +0100, Niklas Cassel wrote:
> Hello all,
> 
> This series was originally written in response to the patch series from
> Manikanta Maddireddy that was posted here:
> https://lore.kernel.org/linux-pci/291dab65-3fa6-4fc8-90a2-4ad608ca015c@nvidia.com/T/#t
> 
> Manikanta has reviewed V1 and will send a small series on top of this one.
> 
> 
> Changes since v1:
> -Rebased on latest pci/endpoint branch
> -Picked up tags
> -Fixed review comments from Frank and Manikanta (thank you)
> -Simplified function bar_is_reserved()
> 
> Link to v1:
> https://lore.kernel.org/linux-pci/20260217212707.2450423-11-cassel@kernel.org/
> 
> 
> Koichiro Den (2):
>   PCI: endpoint: Describe reserved subregions within BARs
>   PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window
> 
> Niklas Cassel (7):
>   PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
>   PCI: endpoint: Introduce pci_epc_bar_type BAR_DISABLED
>   PCI: dwc: Replace certain BAR_RESERVED with BAR_DISABLED in glue
>     drivers
>   PCI: dwc: Disable BARs in common code instead of in each glue driver
>   PCI: endpoint: pci-epf-test: Advertise reserved BARs
>   misc: pci_endpoint_test: Give reserved BARs a distinct error code
>   selftests: pci_endpoint: Skip reserved BARs
> 
>  drivers/misc/pci_endpoint_test.c              | 21 ++++++++-
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  4 --
>  drivers/pci/controller/dwc/pci-imx6.c         | 22 +++------
>  drivers/pci/controller/dwc/pci-keystone.c     | 12 +++++
>  .../pci/controller/dwc/pci-layerscape-ep.c    |  8 +---
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 --
>  .../pci/controller/dwc/pcie-designware-ep.c   | 24 ++++++++++
>  .../pci/controller/dwc/pcie-designware-plat.c | 10 -----
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 19 +++++---
>  drivers/pci/controller/dwc/pcie-keembay.c     |  6 +--
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     | 14 +-----
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 16 ++-----
>  drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 -----
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 20 +++------
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 24 +++-------
>  drivers/pci/controller/pcie-rcar-ep.c         |  6 +--
>  drivers/pci/endpoint/functions/pci-epf-test.c | 24 ++++++++++
>  drivers/pci/endpoint/pci-epc-core.c           |  6 ++-
>  include/linux/pci-epc.h                       | 45 +++++++++++++++++--
>  .../pci_endpoint/pci_endpoint_test.c          |  4 ++
>  20 files changed, 174 insertions(+), 125 deletions(-)
> 
> 
> base-commit: 8eaff52fc101c1f6b3215db93bba02c815155806

For the series:

Tested-by: Koichiro Den <den@valinux.co.jp>

Tested on 2x R-Car S4 Spider boards.
No change in pci_endpoint_test results compared to base-commit.
Thanks for working on this.

> -- 
> 2.53.0
> 

