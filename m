Return-Path: <linux-renesas-soc+bounces-27376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ72H0LcdGko+gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 15:50:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF77DDB4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 15:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4842E301324F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 14:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C478A3242D2;
	Sat, 24 Jan 2026 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="m7mFwJKy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020140.outbound.protection.outlook.com [52.101.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05C31C56D;
	Sat, 24 Jan 2026 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769266222; cv=fail; b=BuFMPSU+5ttB4o+rBG6a+npw3V7d+qZL2IExAZHv1WVDbnEwrX3/W+y9ahQf5fNtk/GZvWOZqx+4W9AkigBkGRdfMJGvFOSJ4E1DLfTWntmBFxuoDsE1VhQC4RrMzBGeNzGrwSIydrifcFKYHkM/HTU74sruIT48cC1dSgIxT5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769266222; c=relaxed/simple;
	bh=hCBGilHfDFdoRdnbbfetuzA8hVAIJKht2PUZdgcxmnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tB4VY/U4HJVU2n2J7OY4rS7e0bSKSvY1y6tYCniAG6HoOdC3QJAug8g/9Y4pStaxGAt11+E3S7gP7uWlHiYhNrkTZlAY7GXqCqCwkny+1Ig3x/CintTGNtBGfaEGNb3rbPCm2CD02xmqiPr26+Jn7mhZAiPvXIg+dzvjlgtuJ+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=m7mFwJKy; arc=fail smtp.client-ip=52.101.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3XzGn1On07XbwCoGj1tjFxZiaexfNH8f8owzjhGmMHQ45oaTlv2JWHkBk71DYsiLVVhcLdi1y8ZLaYtXLSk1LAvLrsQLBiLZueox1WIjPewpbyOGpQ72yVI4vosWY51qw89Mv2MSy9EbOTBrrwfjPcfL1ljmB82IsdNiN2JBsukvTG0Rns+EGddBhOoscT9/66tu/00XCmYlfIjlcA/qQH+Wux0gu6mCGuhy8Z+tmvnCNEZn3OxfhXJnlY3nEOrXuqBhQgxpPxJ1qn+nBZIu/rx4nqNfxO0UJLwB3seDyQlJJF4qXAc66VScOY3pcHX/vB1lodOr8vPdy+c6yxlvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSOa7lwvYj/v8UXgWdEwkRWBMUl1vIwFnICJRAYmAgE=;
 b=eTf10cbjfEBBBIWNN7fDeFGLE+gzroBSp6uNVkggSLyxfwnPqPAcKOZQt1lQYmAdlR4MalqPJmvDLm4b/wKSKv3e+vFnXuJoz6dTUqB0PLPwDbkg3U+Pqskwy1eaNH6VNsVQGfqL+L/fxFOWLe6kyx/UExxDYLu++CQrOhI0dbPNQ/Bd2VVbZpP8Y08Q4jJTSy+RVfwyI45+Jhi49H0ZgD/1QcdoZTxmJrpdNdV7/cuF2tzbCPEslkFy8L8ekk0DNkCJDmkcm3btYur6ZfoTHwc9qCt0ASpyRJtL0VdXne1QZUUUHdC5P+HVX8JDauAJsUsO+DlE4vD3pTT4f1EdQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSOa7lwvYj/v8UXgWdEwkRWBMUl1vIwFnICJRAYmAgE=;
 b=m7mFwJKyWpDneNcTJBVkkacVQly5Wg0apMlluwMoJcgvIvdpha3NmY91xEovhzfRCISwKHUU3XD7Sp6eYTDwaWZprZxldo+c+oVOW/wemGYG1TZuIAAUeMMEWqpkqxMaFQOIBbF28soU2F/kTFC4LDBjI2zumRf5IT6eDLXbBLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:16 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:16 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org,
	Frank.Li@nxp.com
Cc: vigneshr@ti.com,
	s-vadapalli@ti.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	jesper.nilsson@axis.com,
	heiko@sntech.de,
	srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	kishon@kernel.org,
	jirislaby@kernel.org,
	rongqianfeng@vivo.com,
	18255117159@163.com,
	shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com,
	vidyas@nvidia.com,
	shuah@kernel.org,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v10 1/8] PCI: endpoint: Add dynamic_inbound_mapping EPC feature
Date: Sat, 24 Jan 2026 23:50:05 +0900
Message-ID: <20260124145012.2794108-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0044.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: c6152090-1354-4208-5131-08de5b57e363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YpqQj/k4tpfQJ7v9t3wV/hKMIjVuHwiFkv3ZYI5p2TC+66KD7JCxbk37YqJ0?=
 =?us-ascii?Q?5PZGKwr8GAnoWQ3otQ6e4gkCklBLuBwwvr4T4NsKG0seFL5sYg87sxf0L/5/?=
 =?us-ascii?Q?MzZcgZCPeWvKqUDi6HGfrypqVuD4XxQ+upvn81UWLnTRhgmQcH+ioP2F3E4W?=
 =?us-ascii?Q?bvFSYX6bS3Yho0hfc0GolQTHNRzn+47nvsCXutZaWOw6gDPmoX6UVNTqCc4J?=
 =?us-ascii?Q?VrbRnn0YnpBjisCsBF96kSdWQnqKIyi/jtA/CLC5ToulLyBD9B/lxVJBL9mL?=
 =?us-ascii?Q?9gyzvx2dbdZIlyS06y9I99XYpOJR48GGRMlbDbL42iD5Yy2q4mzapfKDpffH?=
 =?us-ascii?Q?JFuZYxFfbq7mr8J8RAsQtQFaRT6M4QXiG2nJGE8wmY179RbEphdiQ3dA9Zka?=
 =?us-ascii?Q?tC8CY7yUfsRbsFN4VB7f61p6aQ+vUErRkFEbRkmZNgaxZAcZstFLsZrO1mo0?=
 =?us-ascii?Q?dHeouNlixxnqOC0FoobhGITY8duxbZ7uK3QwftzvK7XpVy3EXt4nBcKIhdj4?=
 =?us-ascii?Q?eQAGdHVmVx+NnnFdTWi86eif3IsD60wZA/nVcpgexEjFie/uv8yHNvdykHXm?=
 =?us-ascii?Q?VzZDTgaxkpFHFMvfLpFO7KUBqbB9VDgaYrW4C0UT3BlVdowhg2OVfzoVJCz6?=
 =?us-ascii?Q?vTgTnBZ4VUscSCEj5zqNJFmYsRULaXq7bz+5uXImskQZBboKM5tSx9d0lA0T?=
 =?us-ascii?Q?J1rVtMiSPRi4QrnyT/RU2macnFRHXLrqezJf5wmktpZdtzHsNgYThfYotsuA?=
 =?us-ascii?Q?5BK2PUR+aSnXba5xyZP8mhrlgMLR8KmyqNase/Bck3urcfP42wQ8dUE/oFRo?=
 =?us-ascii?Q?Xgf2IUees27x93MPWhiuAwfdgi5Um8wsHiP+GlwERtRnuB4Tuty/aPFtTcS6?=
 =?us-ascii?Q?LN3xt1Fr1DQwdKxjNdVJGQahp/jYbyHqnXCfoZMcXJOgEiTPZrDNHltXUrtc?=
 =?us-ascii?Q?xcDDsvxfNuVszrUTiLaA2OEBG9B4JCzlVFqPkSlLsoF2us2kDSwh+OvnI9mU?=
 =?us-ascii?Q?5lyIsPTgPZKnnfZ5VHZA664ZGs4jH4e4vB9xdfB0ueT+Qp94VvB6bCEbtoUg?=
 =?us-ascii?Q?rG6nnDyGcxesEAnhzlbrFRe9B4D9QCYomIoA9Sf0w4/Fkl/e/+WltcPistm7?=
 =?us-ascii?Q?9Q1e7U80LsMXb9cLwbUiiVghTqQ+rtCoVWjXOtUOYheC8AYWyRNqSDZRQEp+?=
 =?us-ascii?Q?VifImowR3tIhFlipp1afHK1ns3JEW5jo/fvfUPmiJUXQl+17XdT/s/rUDAek?=
 =?us-ascii?Q?MGF50H8J2+tGC7KmAljYycKWwNiGZlH1LkO6AAGKFeiaEZ3jDBit3zvPryT6?=
 =?us-ascii?Q?IV8efuuFL/cNWhvrdRdqEXyRfoimaqe7MAaM6tkf0N+4BYlAwwsV1qWeTjx4?=
 =?us-ascii?Q?DBKCxxPx57HIcaLJkEblGtQ3xhnjVMxLOpPNMlooT64elcwVkady3wPYVydT?=
 =?us-ascii?Q?r5q6HrT3lydTqBuVB/jArjlbIQ7GT0ulRmWSunOU9UhqaAX+HO5/G5ajtA7l?=
 =?us-ascii?Q?ZBDjMyHtGH84NCUpFKOTcg5jXSDdXpokVwzNPTnwrApnLkIDyrTrawlI+S3G?=
 =?us-ascii?Q?ly5OwstPVBlcPL+AnWA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+W5M/htmI9sg531YUvxKMwWjIeD7e/oyp1fbw+3ii3GLPpa6ZlY/LkHwxcQa?=
 =?us-ascii?Q?pVTc2fL/i+83zw3aSeQaxTAQTDZUHBm0skQV8f+Y8oxG5uazCTcDCoJ94Hv6?=
 =?us-ascii?Q?wLmARWkYtuC6ljmfdrnYGGEf8uiFO+2p7G+QAhQknfBimHb4wR2uMIOAcwXi?=
 =?us-ascii?Q?PFIZoqUM9zBYRX/3QyIsAo9wnvqoE3TpldNqZzvwtHe2DOVjgdKUWV6sq3QZ?=
 =?us-ascii?Q?wLN7iA1TI3hxo5c01jc4QXeeJHgNGYy/iksbBNV1sLHKJDytG4KoDbKv3stS?=
 =?us-ascii?Q?ggIkTDWzUhp7Tnp6CWlNjL+7+ruOU9t7/diHxHKg6+tS4PNrCI5qB4XjNzVX?=
 =?us-ascii?Q?2R7W0ouEYV5jGxcFnxJ7cdAqi49E4U3nmjeIuN5IdpTcD+LK3OJb378thw4+?=
 =?us-ascii?Q?PUKkBH71hs6ws/cAty9EavTFOcN+Bcl7DhNkZdvZgJR0+5asFpXNxnXf76ft?=
 =?us-ascii?Q?25dG6RxBukI8bBITbFye7uRUqiWQc9wxwiYG+ZMbE9ZrUbddFr7B9DSRhk/x?=
 =?us-ascii?Q?b67pFIAJErT/DYAP747WAby/nh374NuucCIhUkA+5BaMqOx5xgJeJaHIVNPN?=
 =?us-ascii?Q?ADGetL88fxJm2CTk680cLRFh+9y6LTYcCaOHair1tEWBsqyML0Kl+Art4KWO?=
 =?us-ascii?Q?tUkY84HwQpyN/+xpVyUbn/9UMscSjodqSSiud5zR+FZ+HWy0W50eDG+nUCKq?=
 =?us-ascii?Q?gYhY87/WnlkmlLKedoIzZl1vUfZUOZgYOnuQMQPoqn2w9UBiNn15MXJkNVt7?=
 =?us-ascii?Q?+38FwaSrOQDix5m9M+BGTzPJrCoLW9NZf6OFQavBUrqykIm+sC9YrfoAex1k?=
 =?us-ascii?Q?kLkUMBFxlZjYv/UF8UQsuxb3ee8xCbgUmD/k+31xsOptpJY8PgU4ZboUCuQN?=
 =?us-ascii?Q?6esn1KydKZRtajvkz/MHGpIz0jo8ZvTAXIo/sj1RhZBr5e8EHZFdAOWrBq8D?=
 =?us-ascii?Q?/z1jBmP5Z2hSqH/qLuVyPy2A27NsqB0GnRNb9zIL+Dl7dX8ofid5LJ422CNC?=
 =?us-ascii?Q?m0PgfkAZoJOMXBuvdWQEl01APGnHQ0yHy+sELm4z6T/vMH1vhYDiRl4NxMit?=
 =?us-ascii?Q?a7emsWvkcefDGsNQRQyqv2Jw4tqAQjmixsw8jLBAv9Crt2MsCYjJq0eimc31?=
 =?us-ascii?Q?eH8kmSg2dLCEqVZEeJJRwjy2GL9fUXGevc37zmaYfz+5puWtAv9bZCeWW2we?=
 =?us-ascii?Q?qvvFOVg6TGRLnOCvR+Rx+hplmxMY9XwgbYkEqSdqx+kLWE4cxbfPCSzR2lfb?=
 =?us-ascii?Q?xEGr8mgAUbaL9Xe60pQcDDPaoJWSUJNmJTQXvU+9fGksIThKruo8CpfKJimB?=
 =?us-ascii?Q?GASRHDhMi1uI7WNQTKi+X4e5X1sEZaGmjF2SnJEphUmKe/RVXL105dEw0T61?=
 =?us-ascii?Q?AMOpLDwkDjJJN2e/fxhEQrFc3LhQv0H9Tlk5KvFZ+9gFoHTzupLEBd1217so?=
 =?us-ascii?Q?v3IvVVubvG2eagHovSakKkEVTyml89BsjmviOQd98x81q0st3f7+BlEGNBu4?=
 =?us-ascii?Q?rNRfS2mMZGWF16wovszFntKtYpN80a9Wo9MBb9ri+xrfJawpwgNNOgh/NG+H?=
 =?us-ascii?Q?3MuOjFmX65QN6dq68P0+Ys9fs77tfLv5odtSpbxmqxwgB/x/2VwIuvC2MG94?=
 =?us-ascii?Q?oo0bH1JYxk0cFFJ2vME5RR8TfQCJE2+NMhAsjr1q5CtXOcTOJpr1/fhCpeKF?=
 =?us-ascii?Q?xIouPawouhPohuykxQ+pMZX1VWhWQA6l3JVuLQmOPSW/7rHx9LSBptaLKECG?=
 =?us-ascii?Q?Lyr24Bg2oryD6og3Fn3NZl1xnqqtiA2uyieUbRx4KdKEFI2sehbF?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c6152090-1354-4208-5131-08de5b57e363
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:16.8857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CPD0O4UvAhVBQdOqwYNtVPyEHGpZ0wZqoeHvEH04ohNLm2jbjLU7f8qyleonI2RLyclHDLKVQVJYDl2Y2B2bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4692
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27376-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[55];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:dkim,valinux.co.jp:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 2ABF77DDB4
X-Rspamd-Action: no action

Introduce a new EPC feature bit (dynamic_inbound_mapping) that indicates
whether an Endpoint Controller can update the inbound address
translation for a BAR without requiring the EPF driver to clear/reset
the BAR first.

Endpoint Function drivers (e.g. vNTB) can use this information to decide
whether it really is safe to call pci_epc_set_bar() multiple times to
update inbound mappings for the BAR.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 include/linux/pci-epc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 4286bfdbfdfa..4c8516756c56 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -223,6 +223,10 @@ struct pci_epc_bar_desc {
 /**
  * struct pci_epc_features - features supported by a EPC device per function
  * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
+ * @dynamic_inbound_mapping: indicate if the EPC device supports updating
+ *                           inbound mappings for an already configured BAR
+ *                           (i.e. allow calling pci_epc_set_bar() again
+ *                           without first calling pci_epc_clear_bar())
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
@@ -231,6 +235,7 @@ struct pci_epc_bar_desc {
  */
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
+	unsigned int	dynamic_inbound_mapping : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	unsigned int	intx_capable : 1;
-- 
2.51.0


