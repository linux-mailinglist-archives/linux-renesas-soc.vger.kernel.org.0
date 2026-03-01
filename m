Return-Path: <linux-renesas-soc+bounces-28613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKkkGRQ7pGlnawUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Mar 2026 14:11:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 001BA1CFC4C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Mar 2026 14:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 667CE30071CC
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Mar 2026 13:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C50B3242D5;
	Sun,  1 Mar 2026 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="K7KV2Dms"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020131.outbound.protection.outlook.com [52.101.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7A42517AC;
	Sun,  1 Mar 2026 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370704; cv=fail; b=f+CLlu6WeTzOVVcaDaYv9rf/lR5g2d4tXckJdPZPZAaRA3NipYG8SFj4c1VYZDepsg8Os7kBIcw0uifJQ8q+85BkYY0Sr6kVFxVuEHGIPvInvDBppJvQBUF/uMxNb1ikDhEVIRvTZENNS4MG8Cb+MLMZhPUFyIYpaG6vpJXjGNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370704; c=relaxed/simple;
	bh=x2IyZvmF2k1ApoT8CPcL6b6HuTdwjyXDvIBpIw++0vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y47ZSV6tCAqx/YJm814a2G4t+vKYlBS7c9rahjeJYrhspvltF4dkNn/3WwRIiPAeOsx1qjpHgtdu4Rtnn6B67RzOgfdM871jwXwVRTM7VUoFaLq7oJ542Vk7rNZcNsnwTCM+9hj4H0jHBEHbomb7dFBJ3Xs9vFfb27Bzzf8wAfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=K7KV2Dms; arc=fail smtp.client-ip=52.101.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iA953Qi8nZGzKCoFmU+IT+D28PlH5Hsms34VJihHgDSNxpe+XDH1JBjpHImWbm+K2AYENaaq5SKsw3Xjr8PKcJO074zNPkDEOsOdP9HcrM2RjSgKcCmQXgZhQYiUQ7qII9Hl6DnKcaXluMrOjSDGlTP/UIWDxQVcw+gNezv8U7EtfXAPSA7dapQkPcEiGYziyA40aXaoeXmIWPt+GFgCJDWYrdM4G89RlcSXzQzh4PJjzhenRgnwxZ1eYLbvMb3SZG0cq8X/S3WfhlgQG/XXnSL96QUBVBYCJmpvb5D/LKCyNIzFZlCEehMLbcWfVq6ALFiFOeGmikB6ur1B7B4w+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRn3hLWnV0t8CvqmNX5PjK1vXzRtgscYDbSGX6uXHOY=;
 b=JVc9EvmneUN1n1R5iMWeDMmYS/DKhMAOLvAnPYoBJipejtPavsTEfnam8y3/ENxaEwUk7aabOhi0tScJe7e7MMsb21wvtRN4Tpi/5wL5sa1CBHWEUwFhevqnMxTfG3i282/hVCOpHARXXrG0rMqI4wtm36oVsCVDd4cdRhSAJyg1TJkdtgzsE7TpSrDCg+/QNTd52rURAg9sLKQUC8sMrlmbdGNnZd7b+cobph2+YTnt/BWrNsKIEqPrXcXGPrhoLUzNAs/oL+Dw2zqzl9/zyriHIp5nj60ehH6dyntZQbIGYDVyLLG++VexzlHo++IHq5OCMS3JbQYRbOyhJXe2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRn3hLWnV0t8CvqmNX5PjK1vXzRtgscYDbSGX6uXHOY=;
 b=K7KV2DmsR6I629TLY1WQ2o5Wi4tof54hSVSUX7lbh8+OJNoHh3mfcDxjsAqqoRVN08OQYRby3VNPW3V2jaCwpdE79Pc3/Pe8CcfU1jk/QmQ+VEzjXvNfuWAwoOsIvRDExb6sH/qEHtjtbFsKLLD+yPLgxdQ1Ksg8cOKzgayKmpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6207.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:332::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sun, 1 Mar
 2026 13:11:38 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9654.015; Sun, 1 Mar 2026
 13:11:37 +0000
Date: Sun, 1 Mar 2026 22:11:35 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Christian Bruel <christian.bruel@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Manikanta Maddireddy <mmaddireddy@nvidia.com>, Damien Le Moal <dlemoal@kernel.org>, linux-omap@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 6/9] PCI: dwc: Disable BARs in common code instead of
 in each glue driver
Message-ID: <6hth37ppnarfia7vudzh3mw7ftq2hzqyfupq4yn75xogbyuu7y@jjkhirnmiawo>
References: <20260225170324.4033466-11-cassel@kernel.org>
 <20260225170324.4033466-17-cassel@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225170324.4033466-17-cassel@kernel.org>
X-ClientProxiedBy: TYCPR01CA0067.jpnprd01.prod.outlook.com
 (2603:1096:405:2::31) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bc0c9e-8e7e-48b3-e291-08de779411bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	5QavH8rN6gwtI85b4lBxD9osOwVk9zVDxVjd4r6Pit+jk2t+ZmbpgL7CvJmaBr+zhMKK3LrUTjuCqfjBticBYlqXCXpM24WhnBdvFQLI8KcHF7n/KUF70HybMYEUxmfDaKpK8ZPVWRApOjR1IUETg/QCh9jJJ2zTFsYOH+niRxBdiDOXYt5iQj6YYz0gtIyGgxM4kr6vyVdwWLKhV5VO6oSUbnHR1UHAALmBmCfD/c2EkdLVa51v1R2OE4H84Xq8y+d9iDOVCYhZU4Na1tWEGPy/197HYdwbqg4/DAfBMRaCVagQFY/SruMketHLHiAwtst2cmbhTQ3vpOHjR8yQUvBzFM+dElAzoKdxlmcFTWV/dDg94x+Wa1TvVqEOn8UykgNpG26iZK7kplQA5c9NLZXUajY5CTRpIzM0zV6wbyvkoAsJWwqOk4k3HRYrUgkYbGzRj/y3kp7QKhRXdgGFTwPU1uffKaEEQp3dvnyMdCQI+7uUZp0X7gZnFULesGBmoPGCRL4i8oPQwdsNJ3/PKBq6U3oy+CfS2qaPaAXd6kS3Nx0xBLSpBsDuz68BQElwcxtOvrUhaEZYOyzPwopiXxMZBdgtOah3r75Gm6heGz7wZNxyM3OuQPR6Xmx42Okfv8UkhpDRltN9LPUGdQwTUdkNzHVIVMGpWY2z9K0tyktasjqDdGWxsDt+uIfiWgnqs/H+EtLIeujh1xKtNNgn8MTWuUObEbdNbF1rdnziWic=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r7uH8E/caIhFE272UhDb9AjctgTbA8mHSxAuG2P+MsEwG8W6Bi57okrs6V4m?=
 =?us-ascii?Q?QKSLLp7lEgPryspeW7FhU/AjdFfNxXtlXa5N+xcuOcT5ZyeHgL9MdTiNvcQG?=
 =?us-ascii?Q?Qd/9gOaQVjZZ9d+kvUxiB/zuWAA8cKIsvc1/l0C8PojDHaHlO51hwAw+i+hF?=
 =?us-ascii?Q?Metr7FX4W/d45ZOPQ1NGyiXcq+jGYCRXom3cTZTLbNcliAHculGEkqBZkEO3?=
 =?us-ascii?Q?XLD/SKus7WuePmQoB2tMdt7noRWYwtuads0k0RldklHKHGkU1udONuqp+gnj?=
 =?us-ascii?Q?hcpzrG28RvtYWzTaar6ywvbqzaKZKV0Oem8AdB0FGnq/ezrQB8Rd2IlchIAX?=
 =?us-ascii?Q?h/IL2gZd84QHfZ0WZSbGMRtlaqxr3sZh+hAwA60zHBGwrakoMo4kkoGYGxyk?=
 =?us-ascii?Q?+v4j3af0/gCZs1PLmLqS36h5llRg4TsnejOYXmU4u7W9c/CV6A5CdloTxNNC?=
 =?us-ascii?Q?0v5D7JSXYixdZy7OSazx2saAm/19SnbNTTvMQFPPqkop5UUJmZ/uTPLrsPSF?=
 =?us-ascii?Q?PBbpHZ9+cpLoSuqljcu6lBn/p3M6B/80PkwYxDcpWDJNu4eAjVQxPF+8Rf4+?=
 =?us-ascii?Q?qnNkfun6DxyG8nhwo2+dVMLCILikUe+pOHiOtv6CSrmzyp9GNv1HMY8VQlcy?=
 =?us-ascii?Q?WzzsIXR975HS94uJ2KEvx0/54ZZ/bOkWYm76T0FYSh6xtYInaijBnqfx0/XZ?=
 =?us-ascii?Q?uPyrfUQqGoPdjKw0Cx8ggEB5ING4xxo2Qg68P+4Hc8DBagirFmE5LaM4mcbm?=
 =?us-ascii?Q?1d63KQ4Z5V/28OZQJir5Zu7SeamqB40f0IJSmAR7iJuCF9zpRr+MWOIZM7HD?=
 =?us-ascii?Q?2eJLjNttN2eGBPIuec8CBUQbgJ5ODeu/iv1Ixj/VjpyjrcnyzUWDjtbWPO1c?=
 =?us-ascii?Q?UTxFnvkMz8r+H28FwQmOpYfQYFkB6xyBQinZREB8wMXOk9QWLZ70KW3Ht1aB?=
 =?us-ascii?Q?cQCyLZxtyNKTBC5MT6sa0xGG+uRvNt3PkNKsjDegzWp2WIuXrUtC9V9rYP8J?=
 =?us-ascii?Q?6V2zp/EDuYOZaFSFHMkhHYDzwYOgjRKfNJcQ828YI7Ia8cG5zkS3TN6rSkmS?=
 =?us-ascii?Q?XvALsGyz7fhybWaVPQ+VdP5brIf4hIhyXovKP5QFHkE/VpmYcmcsF8x8CD/s?=
 =?us-ascii?Q?RjLWJQopuKAycuCJfBObLPm3wVn5MBfw/IOkv+EpXsLP0M+gZTZ57SV+SFZN?=
 =?us-ascii?Q?ULeRwWXzo8smgsfQCUjVQZno7DResgw4IZLG1kN4m1NKUMgOPVXVdQIzhhXo?=
 =?us-ascii?Q?IqAkwcKvo8N1ldgETMkvgYXaFRxcjuSXgI1lKaScjUBD5Kz0Z4gZEm17ujWT?=
 =?us-ascii?Q?kVogbVuSLiF3L/ufKsLXbkvGBUSUveVLGTUEmzp3XuzNQVkQVsqthVG2GAqg?=
 =?us-ascii?Q?mu4mHmmTG+vBUGQ/vhrGo4+2qaQPfHGUmb6cvlUScpZH8rF3e1SPfXVvAVPF?=
 =?us-ascii?Q?C2bcNHrPcCXbgyaUm6tDSGPUBjLl41dt0XHrUq2g8DjeaCfdQ/Cjh3h3+dzY?=
 =?us-ascii?Q?GTtnTsXgoaOYEBUyN1JD8OajYNHOJ6qlF1BlaHKQyZbjrEjjrVTr7DvS/3aR?=
 =?us-ascii?Q?3SHLksxAN4LncxgG19qws6Bt0x5+bLcVJ0yL+GcGuySY+mIGz3Jbyyf6S7o7?=
 =?us-ascii?Q?5Pc23fQdQgAHRN3gBz/5mkkFpTR1iMntZw5RFAhoKAL5QVgEbwoTvUiqC7hr?=
 =?us-ascii?Q?7KQRrVngRC9FfXA43F0ov7bXk8fp9qGW5JP0Nd+PZslxAETQ0tOokiq2TXv3?=
 =?us-ascii?Q?i8FaV0X0BcnRlTfJfQKTgivt8yU6gzZZEuDrSJZZSCpP0Evn4Zp+?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bc0c9e-8e7e-48b3-e291-08de779411bc
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:11:37.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTtx8PlCaaBojOOGgCQ0duvpuarMDE29qEb2trOY4Fo61lsR9tPAZikZcDWWVf7pTu8HwUgmDs1E19lj1U2kfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6207
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28613-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 001BA1CFC4C
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:03:29PM +0100, Niklas Cassel wrote:
> The current EPC core design relies on an EPC driver disabling all BARs by
> default. An EPF driver will then enable the BARs that it wants to enabled.
> 
> This design is there because there is no epc->ops->disable_bar().
> (There is a epc->ops->clear_bar(), but that is only to disable a BAR that
> has been enabled using epc->ops->set_bar() first.)
> 
> By default, an EPF driver will not be able to get/enable BARs that are
> marked as BAR_RESERVED or BAR_DISABLED (see pci_epc_get_next_free_bar()).
> 
> Since the current EPC code design requires an EPC driver to disable all
> BARs by default, let's move this to DWC common code from each glue driver.
> 
> BAR_RESERVED BARs are not disabled by default because these BARs are
> hardware backed, and should only be disabled explicitly by an EPF driver
> if absolutely necessary for the EPF driver to function correctly.
> (This is similar to how e.g. NVMe may have vendor specific BARs outside of
> the mandatory BAR0 which contains the NVMe registers.)
> 
> Note that there is currently no EPC operation to disable a BAR that has not
> first been programmed using pci_epc_set_bar(). If an EPF driver ever wants
> to disable a BAR marked as BAR_RESERVED, a disable_bar() operation would
> have to be added first.
> 
> No functional changes intended.
> 
> Tested-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  4 ----
>  drivers/pci/controller/dwc/pci-imx6.c         | 10 --------
>  .../pci/controller/dwc/pci-layerscape-ep.c    |  4 ----
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 ----
>  .../pci/controller/dwc/pcie-designware-ep.c   | 24 +++++++++++++++++++
>  .../pci/controller/dwc/pcie-designware-plat.c | 10 --------
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  4 ----

With this patch, the source code comment above
rockchip_pcie_epc_features_rk3588 should be updated. It currently says:

   "(rockchip_pcie_ep_init() will disable all BARs by default.)"

I looked through the other glue drivers and did not find similar comments
that depend on the previous behavior, so this (pcie-dw-rockchip.c) appears
to be the only place that needs updating, unless I missed something.

Best regards,
Koichiro

>  drivers/pci/controller/dwc/pcie-qcom-ep.c     | 10 --------
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 10 --------
>  drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 --------
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 10 --------
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 10 --------
>  12 files changed, 24 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index d5d26229063f..cd904659c321 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -378,10 +378,6 @@ static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
>  
>  	dra7xx_pcie_enable_wrapper_interrupts(dra7xx);
>  }
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index ec1e3557ca53..f5fe5cfc46c7 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1401,15 +1401,6 @@ static const struct dw_pcie_ops dw_pcie_ops = {
>  	.stop_link = imx_pcie_stop_link,
>  };
>  
> -static void imx_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	enum pci_barno bar;
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -
> -	for (bar = BAR_0; bar <= BAR_5; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  				  unsigned int type, u16 interrupt_num)
>  {
> @@ -1478,7 +1469,6 @@ imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  }
>  
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
> -	.init = imx_pcie_ep_init,
>  	.raise_irq = imx_pcie_ep_raise_irq,
>  	.get_features = imx_pcie_ep_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 5a03a8f895f9..1f5fccdb4ff4 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -152,15 +152,11 @@ static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
>  	struct dw_pcie_ep_func *ep_func;
> -	enum pci_barno bar;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, 0);
>  	if (!ep_func)
>  		return;
>  
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -
>  	pcie->ls_epc->msi_capable = ep_func->msi_cap ? true : false;
>  	pcie->ls_epc->msix_capable = ep_func->msix_cap ? true : false;
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> index e994b75986c3..55cb957ae1f3 100644
> --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> @@ -340,15 +340,11 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
> -	enum pci_barno bar;
>  
>  	artpec6_pcie_assert_core_reset(artpec6_pcie);
>  	artpec6_pcie_init_phy(artpec6_pcie);
>  	artpec6_pcie_deassert_core_reset(artpec6_pcie);
>  	artpec6_pcie_wait_for_phy(artpec6_pcie);
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
>  }
>  
>  static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 295076cf70de..386bfb7b2bf6 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -1114,6 +1114,28 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  }
>  
> +static void dw_pcie_ep_disable_bars(struct dw_pcie_ep *ep)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	enum pci_epc_bar_type bar_type;
> +	enum pci_barno bar;
> +
> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> +		bar_type = dw_pcie_ep_get_bar_type(ep, bar);
> +
> +		/*
> +		 * Reserved BARs should not get disabled by default. All other
> +		 * BAR types are disabled by default.
> +		 *
> +		 * This is in line with the current EPC core design, where all
> +		 * BARs are disabled by default, and then the EPF driver enables
> +		 * the BARs it wishes to use.
> +		 */
> +		if (bar_type != BAR_RESERVED)
> +			dw_pcie_ep_reset_bar(pci, bar);
> +	}
> +}
> +
>  /**
>   * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
>   * @ep: DWC EP device
> @@ -1196,6 +1218,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  	if (ep->ops->init)
>  		ep->ops->init(ep);
>  
> +	dw_pcie_ep_disable_bars(ep);
> +
>  	/*
>  	 * PCIe r6.0, section 7.9.15 states that for endpoints that support
>  	 * PTM, this capability structure is required in exactly one
> diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> index 8530746ec5cb..d103ab759c4e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> @@ -32,15 +32,6 @@ struct dw_plat_pcie_of_data {
>  static const struct dw_pcie_host_ops dw_plat_pcie_host_ops = {
>  };
>  
> -static void dw_plat_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  				     unsigned int type, u16 interrupt_num)
>  {
> @@ -73,7 +64,6 @@ dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
>  }
>  
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
> -	.init = dw_plat_pcie_ep_init,
>  	.raise_irq = dw_plat_pcie_ep_raise_irq,
>  	.get_features = dw_plat_pcie_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index ecc28093c589..4e9b813c3afb 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -361,13 +361,9 @@ static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
>  static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
>  
>  	rockchip_pcie_enable_l0s(pci);
>  	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
>  };
>  
>  static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index e55675b3840a..e8c8ba1659fd 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -861,17 +861,7 @@ qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
>  	return &qcom_pcie_epc_features;
>  }
>  
> -static void qcom_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = BAR_0; bar <= BAR_5; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static const struct dw_pcie_ep_ops pci_ep_ops = {
> -	.init = qcom_pcie_ep_init,
>  	.raise_irq = qcom_pcie_ep_raise_irq,
>  	.get_features = qcom_pcie_epc_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 9dd05bac22b9..1198ddc1752c 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -386,15 +386,6 @@ static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
>  	writel(PCIEDMAINTSTSEN_INIT, rcar->base + PCIEDMAINTSTSEN);
>  }
>  
> -static void rcar_gen4_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
>  {
>  	writel(0, rcar->base + PCIEDMAINTSTSEN);
> @@ -449,7 +440,6 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
>  
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
>  	.pre_init = rcar_gen4_pcie_ep_pre_init,
> -	.init = rcar_gen4_pcie_ep_init,
>  	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
>  	.get_features = rcar_gen4_pcie_ep_get_features,
>  	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
> diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> index c1944b40ce02..a7988dff1045 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> @@ -28,15 +28,6 @@ struct stm32_pcie {
>  	unsigned int perst_irq;
>  };
>  
> -static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int stm32_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> @@ -82,7 +73,6 @@ stm32_pcie_get_features(struct dw_pcie_ep *ep)
>  }
>  
>  static const struct dw_pcie_ep_ops stm32_pcie_ep_ops = {
> -	.init = stm32_pcie_ep_init,
>  	.raise_irq = stm32_pcie_raise_irq,
>  	.get_features = stm32_pcie_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 9f9453e8cd23..3a6bffaff9ea 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1923,15 +1923,6 @@ static irqreturn_t tegra_pcie_ep_pex_rst_irq(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> -static void tegra_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -};
> -
>  static int tegra_pcie_ep_raise_intx_irq(struct tegra_pcie_dw *pcie, u16 irq)
>  {
>  	/* Tegra194 supports only INTA */
> @@ -2008,7 +1999,6 @@ tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  }
>  
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
> -	.init = tegra_pcie_ep_init,
>  	.raise_irq = tegra_pcie_ep_raise_irq,
>  	.get_features = tegra_pcie_ep_get_features,
>  };
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index 5bde3ee682b5..494376d1812d 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -203,15 +203,6 @@ static void uniphier_pcie_stop_link(struct dw_pcie *pci)
>  	uniphier_pcie_ltssm_enable(priv, false);
>  }
>  
> -static void uniphier_pcie_ep_init(struct dw_pcie_ep *ep)
> -{
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	enum pci_barno bar;
> -
> -	for (bar = BAR_0; bar <= BAR_5; bar++)
> -		dw_pcie_ep_reset_bar(pci, bar);
> -}
> -
>  static int uniphier_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -283,7 +274,6 @@ uniphier_pcie_get_features(struct dw_pcie_ep *ep)
>  }
>  
>  static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
> -	.init = uniphier_pcie_ep_init,
>  	.raise_irq = uniphier_pcie_ep_raise_irq,
>  	.get_features = uniphier_pcie_get_features,
>  };
> -- 
> 2.53.0
> 

