Return-Path: <linux-renesas-soc+bounces-29489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPukCM4KuGkWYQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:51:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2672729AC12
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 523FC300440D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 13:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7342C399341;
	Mon, 16 Mar 2026 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="tJh14C+4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021086.outbound.protection.outlook.com [52.101.125.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D97D2874FF;
	Mon, 16 Mar 2026 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669065; cv=fail; b=Gejo9agQzslMV4hDB1ydkZGAumfBE4sMov61/nVaxaKvDtTlonpdenz2N5IwsEPIC3W5pkHs6UrkAZfU1nBvALC6dg7hwAaqao+NuVGpk6Q/UavqrUpTb0C69i5Zj75cQ6TijJ1rCMvvCu+hF40phsVT7MGwPUM12I8uduD/Fc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669065; c=relaxed/simple;
	bh=YIYrzHtKGn5F9qdtY87w4tK7OStVomAl6f/fFTC1rFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qv+RK6z/UoYUh1WsG2+S1I5nTIULVC9EzRu/y0+zS8IBdvXplJSUAJ3clFk80Pnbsw5uDD9iK9IPmxcKh6hosZxKoAGOM8w+eXfgAkAJPWPaXGXWsHmVqHmEB0qJypS+1XumssGeXDEaLcvCnvBxQyEMkhO32DiipAE6cpGTAco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=tJh14C+4; arc=fail smtp.client-ip=52.101.125.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxZYcYZs/XxFbP2wsjEn5Yk8WbJ5c0Cf1HOgBEvHBSq90116oF1W6Ax4yIoEwIVRFW7ETHIPaaqdwO8lMt4uu6AAOPk0Z4wo4yWoXQMkozHap2fVtk08f9CEhtfY2wOfXoLMs09uuj/idr507JCvG4qrWZO6GF/2xYT5GWuRnyV1jf8Z4t7zXhgkrwktJPGti4BG2y8/CxXsg20MVn5B6TWc7L+Ay9nzQ0qYc1SOabFmuMfmwh2lycH31HyLKoWbKve3UXfjZbYp7+EtbmNoziBZFJF3X7mfB6vrP3lO4Q0V6mDpWr+k5BFg7hs0f265zmSE61tAtC+DB4zEYcEGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xz9qD/SKsAlsa+wqAgGW40WZZRz4YGvxjtS94F4GrWw=;
 b=CdCNST2DwdiEDCWpTfoniNY6Aq6jvkGCQo/Zbtc8gg2A+c9WkvS3vzskrxDxx2jsRDpaMWz7/q7vvNmQ7s23QzWJNSmW7dNyEUTju3lJJidMxJMq/2/pPwzP9UxulPv8OvE15vebvF0mhMJJ63ILZkzPqSRroCRKUe8TfFo335BcnVDa1pdWj5Hg6EsHBau8QvkCWVJyVkdEEbZgMmxMq7ZyO4tiRlP4TqlX1TtgAjFiIL4rijq/scJslbG5NVOFPXVmliEPL7rH0EGVMxNuhS3zcxjX8T1gbEU4uxen8NIWJK7YG3oymC/fdiT6+GS2QAa21L2PdWBhBxP2uwUDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz9qD/SKsAlsa+wqAgGW40WZZRz4YGvxjtS94F4GrWw=;
 b=tJh14C+4mC2xoPJy5uNdTfWRwHmoxNpnggm4XxSuz3COVludEGXtwDxmCMcw7Y9jl1uMVSJULBWDne5/teS1+7MF9+1YG2TSgWGF2oRRrZpXM9tXOZw83iwRRc3iaBI3YKG4K/EqNFdiWTprTFW+B5rQQSMYVAzo7aGc9joNgw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB5707.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 13:51:01 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9700.018; Mon, 16 Mar 2026
 13:50:59 +0000
Date: Mon, 16 Mar 2026 22:50:58 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Christian Bruel <christian.bruel@foss.st.com>, 
	Niklas Cassel <cassel@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, Frank.Li@nxp.com, vigneshr@ti.com, 
	s-vadapalli@ti.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, 
	jesper.nilsson@axis.com, heiko@sntech.de, srikanth.thokala@intel.com, 
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org, rongqianfeng@vivo.com, 
	18255117159@163.com, shawn.lin@rock-chips.com, nicolas.frattaroli@collabora.com, 
	linux.amoon@gmail.com, vidyas@nvidia.com, shuah@kernel.org, linux-omap@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v10 3/8] PCI: dwc: Advertise dynamic inbound mapping
 support
Message-ID: <m5wembfzeyyk33wml3r2kug7l27wf7bvxq2ymkxgky6ieoy76o@d7oxiqjoluat>
References: <20260124145012.2794108-1-den@valinux.co.jp>
 <20260124145012.2794108-4-den@valinux.co.jp>
 <b2b03ebe-9482-4a13-b22f-7b44da096eed@foss.st.com>
 <tkfhaovpmaoodo35attvmbnpukcqgmwyrxmfgiwjy2dga65cgl@hmj4mx2n44ki>
 <5e485218-becf-499b-8a07-d25358504807@foss.st.com>
 <abf-LKj8V2MpJFEE@ryzen>
 <ba3ae9a0-11ba-4000-b2ed-08aeede0dc54@foss.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba3ae9a0-11ba-4000-b2ed-08aeede0dc54@foss.st.com>
X-ClientProxiedBy: TYCPR01CA0177.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c13086-ed56-4d0c-3df9-08de83630ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PuuYAtyXFeaZLri1rNI8o1u3vReYEPbg4MWVoylY+qE6Lar+XRqyO5GfRTWoMFeeFQDF67zZWmg+IxxePJAVXnkR4B1Lskh0hRcbR5gQ2sS802fRSWzyWYasJDJy2RjD8MMqYs0zWBSPUq9RWfxxWNxsBqBlOt6vIS0NUEWDr68tGY2wVVNwjdcxB0PL4Tf2WnvZqQDNCmOkR/ocHOgoPp/aqOm4m1dmHexW/G1Nrs5Ccog9I5YcC+WzInehfzTk/K6BW9FzMyhU8WogMR95LyOOaKXvA9ogJbWJfpL0k9+8ebRhS8BRLoRspkrQAju4Dr6MyFGsyOV+iKAEpkxu0MZmpYcIaQ+6Jw4VU0EFs9TBoipsk61YQVyH8WiC747BMVculqRvSiIYFIuc/CazSmrXgmTT8rPI8gRg0pSoMC7hD9dQTQYX4qc6YbxPCWeqcljlsNNxqLTXtiN8d6iBKksKAi5XVZ/vCeCeN9orXb8yeqQHkLrVHqU/DrAFqu8G9p6biRKTZS3kIwlG+wrOAfDm+MhoVX0bzrx4aTEUQRFi0Krv7WVYDDFK+eGUS6d/hyXk2TrrxDl+RL3no7Njj5y3GZj3h6VSqe9V5W3tehGzF6/L9w+Gf4McTpFQLBlPj8E4siNiThZXPUpZ0CpjFj6broJboTQBthL5DNs+fvxMMTtq2HL5fIbUpjni3XErC3sQTLpET9lMHFP4y6QobWJb4WNXC3LR92iskyY+0/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MdTesi1NtNVzfhoTREixlQ/aftNUuz57gYdRA4yO0KerEdkTL0ARLT4+OXVG?=
 =?us-ascii?Q?IA4Nyt0INLal6M4toY49lDoSZQDk9fRgD4kgPbgETd7aGTfjRZ5E8dtrZcN5?=
 =?us-ascii?Q?p4FIwsICw4kVjo/OCf66EOGUJ3LjswyoOYU5p6kkFzk1qxoV2g6s1ZehojSf?=
 =?us-ascii?Q?d+gMgxNX+f3t3IjoiTlKiDjoSsASwnFXU+rqGHE9K+Rm0ZbaONLzUtCoED6z?=
 =?us-ascii?Q?UsYlwXpBBMYGjKU0MYkOMK7FfZ6SbHc0kh/5u/4kZVyYdOCBt7+b0TQxHigf?=
 =?us-ascii?Q?OBKgsWCPgnwlWHOhwHxHKWcdt+ZS3odNJeWDlYXfBJWjyV5frrrTZffCC9Bk?=
 =?us-ascii?Q?WP2rG73ywgKVJZ91YkEfQVYuWtmEwcX9wNKQ7PNhhZjJUG0eL2xXvh9KGo46?=
 =?us-ascii?Q?hASxHOXt8XV5nY7Z6w9yMY2Ilfy2/OtbRv+YHVJsdfWpesHqtzWwSlj3T/oU?=
 =?us-ascii?Q?goT+KKJjGa4U99wC00yBt5Zi5fKz9onCqQdzUrMmZD4fmNDMJcVIoVsWHp0I?=
 =?us-ascii?Q?YL3c9iIWWgSpRi6ElWQ4wwlav2m9RlI032SO3zBdMPtBA+BvUN3ycW3i14QM?=
 =?us-ascii?Q?6oDKgmCY5lMtIHqNr8G62/bqX7YpnHCQke/iIbtBTFE63U0V9a7gjVMLYzH2?=
 =?us-ascii?Q?zAukRFNhW5dmiG1hr7nCd+Rne/RChb+DSf1SLvjp76x/IOKG018UHCC266Qb?=
 =?us-ascii?Q?3KlV1sRldLiDNngbq67IEAZDcryeBL3sQuDPqikpYp1EcKfHKuObWfVyKEjr?=
 =?us-ascii?Q?NuMRAA1+kdS7frPD2NzR/BblSFAAnIl4LFaDaHr02OS+7+0CBAn8wukjetC6?=
 =?us-ascii?Q?uTvhwSbJ3uzO1w9ThyWPJ6pe8oHziCgOvm6O2+mHS2XsvrCtAWB7+GtHu3pU?=
 =?us-ascii?Q?06pDq0ZQ5dqqY4qr5sFnWUr9zKyv2kj5TTb/BSg2E7f1/HrJ37JVqZ9pzyfi?=
 =?us-ascii?Q?obAwdA26+Jqe7rHZ1tR58h0TR35TRTlvhDan3+hQfh9cU2RoQgDwceYQJYIQ?=
 =?us-ascii?Q?xMLZmdEGFdaFaK6yO3k36F/mroB0ZJh8PUsNMCxs611yuEpvUqT8CALrSLKW?=
 =?us-ascii?Q?eOafb2XgtkfwlrRPyasK1OH3aXDTyubKA3iMpZnn2qS1/1OwiPC3PjCJcnv9?=
 =?us-ascii?Q?onqATUyJ+4T5Gq0YOB0gg+p+wUzvZRHbX7YPN7KFLuXzgH+Xjt6dWRvY6zqX?=
 =?us-ascii?Q?hnBrxQexyXzYUv5KOC4eccS8ivCGQE6uQPuTqgoRYUOBiP1zKuRNnDwsNsPj?=
 =?us-ascii?Q?GJYwaIQ4wcqzVdCy2sDmAhTkU22LjnS2enM3oCE7XUqlYaBdn6qlLOLkkgZn?=
 =?us-ascii?Q?7JxRySD5hEI93hrkALGtk3V83N5nhVpaC9pKm5WgEkEbeHC9vgsXddW8i+nB?=
 =?us-ascii?Q?WkQ9M3aNpP9b+O2P9dy//PdngMjZGxr5xh5zGTqPwJk1YIhOUBxKP3jkxLp4?=
 =?us-ascii?Q?4xccTWCTWIehQyEePBLfLNW+abKXJnuReELZHNtp/gMnAgbT5ngLmIwBRy/T?=
 =?us-ascii?Q?57E5+QW+r4cpe/3HIc4+YbvapguWW7GAaOj2e/CylypJ7icxq/eio6zpw9mq?=
 =?us-ascii?Q?nQ2Z/7VOaJiTEY4hmRsrkkO+APonN2TuzsWfHQ6M2NVNHoNRrE7ccJyWL8cx?=
 =?us-ascii?Q?FzJQO87KxAb8dJBLwJ0FmwPX5WIDg0BobM+l46lWN6QStuKZHFvHMlF+D5n0?=
 =?us-ascii?Q?/kJ7xi5nuh3qzQQyfWURU+ixvrXIcTqQxnF9mN715HKWwnJiWokxK6SqExFJ?=
 =?us-ascii?Q?9y1FYxsTR2BTRJIp36pLruAu4Y2JLhDcVIqqjMHiTi8Z5zThwAlK?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c13086-ed56-4d0c-3df9-08de83630ddd
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 13:50:59.1812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wk8aSj/PzRo/b1XzyoE3urFxHjU/VAdFLPGiA3qqrxXciF3R3RXjkDAOrHI8Vd39q+t7V1xjc1RZzKbsWv3hMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5707
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nxp.com,ti.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29489-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	RCPT_COUNT_GT_50(0.00)[55];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,valinux.co.jp:dkim]
X-Rspamd-Queue-Id: 2672729AC12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 02:29:54PM +0100, Christian Bruel wrote:
> 
> 
> On 3/16/26 13:57, Niklas Cassel wrote:
> > On Mon, Mar 16, 2026 at 01:41:03PM +0100, Christian Bruel wrote:
> > > Hi Koichiro,
> > > 
> > > > 
> > > > If I understood the problem correctly, would something like the patch below
> > > > address it? My expectation is that the subrange mapping test would then fail
> > > > consistently on platforms that do not have enough free IB iATU regions.
> > > > 
> > > 
> > > Thank you for your patch. Yes, now the bar subrange tests fail consistently,
> > > so that is enough to say this is not a regression.
> > > 
> > > However, I think there was a clear BAR missing somewhere before running the
> > > tests in the EPF driver, as the BARs could be reallocated during the other
> > > tests. This is not due to the subrange tests, but the EPF test driver
> > > supposes a 1:1 BAR/ATU mapping. Now this assumption is broken. I'm wondering
> > > if this could be improved to make the subrange tests pass on all platforms
> > 
> > Normally, you want one inbound iATU per enabled BAR, since you want the host
> > to be able to access all the enabled BARs at any time.
> > 
> > If you are thinking that we should somehow temporarily disable inbound
> > address translation for one of the enabled BARs, such that we can do "steal"
> > that iATU to test inbound subrange mapping, then I think that is a bad idea.
> 
> yes, I was thinking something about restricting the iATU entry lifetime
> during the BAR test duration and restoring after. But OK I agree, not good.
> 
> > 
> > I think we should just let the test fail. Possibly we could call some API that
> > tells us that all inbound iATUs are occupied, and then SKIP instead of FAIL
> > the inbound subrange test case.
> > 
> > If you really want to test/use inbound subrange mapping, even if your SoC has
> > a very limited number of inbound iATUs, then I think a better solution is to
> > mark one or multiple of your BARs as disabled:
> > https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=endpoint&id=33642e9e36dc084e4fc9245a266c9843bc8303b9
> > 
> > Then you should have at least one more inbound iATU available, and should be
> > able to run the inbound subrange test case.
> 
> Yes cherry-picking the BAR_DISABLED support, I can now test the subrange
> with Koichiro's fixup.
> 
>  ./pci_endpoint_test -t BAR_SUBRANGE_TEST
> TAP version 13
> 1..6
> # Starting 6 tests from 6 test cases.
> #  RUN           pci_ep_bar.BAR0.BAR_SUBRANGE_TEST ...
> #      SKIP      BAR is test register space
> #            OK  pci_ep_bar.BAR0.BAR_SUBRANGE_TEST
> ok 1 pci_ep_bar.BAR0.BAR_SUBRANGE_TEST # SKIP BAR is test register space
> #  RUN           pci_ep_bar.BAR1.BAR_SUBRANGE_TEST ...
> #            OK  pci_ep_bar.BAR1.BAR_SUBRANGE_TEST
> ok 2 pci_ep_bar.BAR1.BAR_SUBRANGE_TEST
> #  RUN           pci_ep_bar.BAR2.BAR_SUBRANGE_TEST ...
> #            OK  pci_ep_bar.BAR2.BAR_SUBRANGE_TEST
> ok 3 pci_ep_bar.BAR2.BAR_SUBRANGE_TEST
> #  RUN           pci_ep_bar.BAR3.BAR_SUBRANGE_TEST ...
> #      SKIP      BAR is disabled
> #            OK  pci_ep_bar.BAR3.BAR_SUBRANGE_TEST
> ok 4 pci_ep_bar.BAR3.BAR_SUBRANGE_TEST # SKIP BAR is disabled
> #  RUN           pci_ep_bar.BAR4.BAR_SUBRANGE_TEST ...
> #      SKIP      BAR is disabled
> #            OK  pci_ep_bar.BAR4.BAR_SUBRANGE_TEST
> ok 5 pci_ep_bar.BAR4.BAR_SUBRANGE_TEST # SKIP BAR is disabled
> #  RUN           pci_ep_bar.BAR5.BAR_SUBRANGE_TEST ...
> #      SKIP      BAR is disabled
> #            OK  pci_ep_bar.BAR5.BAR_SUBRANGE_TEST
> ok 6 pci_ep_bar.BAR5.BAR_SUBRANGE_TEST # SKIP BAR is disabled
> # PASSED: 6 / 6 tests passed.
> # 4 skipped test(s) detected. Consider enabling relevant config options to
> improve coverage.
> # Totals: pass:2 fail:0 xfail:0 xpass:0 skip:4 error:0
> 
> Thank you,

Christian, thank you for testing.

Niklas, thank you for the follow-up. I agree with your assessment.

Bjorn, I'll submit the tested-patch shortly. Sorry for the trouble.

Best regards,
Koichiro

> 
> Christian
> > 
> > 
> > Kind regards,
> > Niklas
> 

