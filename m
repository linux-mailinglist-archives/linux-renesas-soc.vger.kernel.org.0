Return-Path: <linux-renesas-soc+bounces-22469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C9BAAC08
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 01:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8FC894E0212
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 23:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04C023D7DE;
	Mon, 29 Sep 2025 23:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CpCYwi9y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A017EEA6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 23:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759188524; cv=fail; b=P0A+lBfxotNAnH/bJLuOekQDMeDU916eYG9FBsX2tbQ1e0BbWmpSJ4nUbW29yHWYAYUl3sgZklyzcCvMHI0HE51xviBBxafJVolIfONv4wSSeIoNDOWTbqGJPtDd/GRen+Gp6FkOy+3RPDI/zqPb40nJlnXYu/vaGal3jFtHryY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759188524; c=relaxed/simple;
	bh=SHFS1o4LxVb3xUxDtt+dxO8UbMDPLL2+GZhEtAduofM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GgIhA2C7uK3aoM4NT5HR6cn0SlBpnVXWSyPLR3GwX+roC6HJ9mygKUqJmqSufjQIITsQm0ZY/w16kDU6bwOzUXJ4DUzI2OTDGk8D+7KSpVe6PW4uJIWy7ofcb4o8wYZVt8gAPxOHjsYCWU009v6CyE7cgBpwKELkJbsGBNdff/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CpCYwi9y; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbZZgOmxK9gyu746AXYGOg6H0aTMylvn+VCRAsLyUYyuIoDWrZRb3U6k4OgPo+yifigLmiWgpvUE6A0x7OH/37wgkK4H5Q8i7VxFocXL4MSY+0LDossqE/U7qy/OfBks5pe52CRkYLOzn1umqBYzIfT14iPNzRAu47uwV0PmVCArP8wY51uZPrn9tc6g4pp91s+4Lxy5SZ//5ikknWfu6WAxFfa3DKzN88Twkdih9H3S4NGPUAVQhryiSU0aULmLP7YvzBzcKDXM4ibc7iohAljyv7YyBjglByK0qnyhXXcLjoPn1U0w6x1TwL4IXnqDqU9TxWpiC5aIgJqSk5qP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mEToVt0I0T77c8996j+YOaPzM00u2T9ieDypheYmms=;
 b=Depk8diyE5WGeqGmwNsGPtvL/acqKQ/mhjjk99ZKGD2EgyPY0ksZbgPVS6mxCbKdwNE63n9qnwpmOE8K2fdsWxYFQQMmYnzkLj1jvKMlkjAL3b7bq2hZC7IxLnQAfyUF6k07xdEffc4LYlX0XRQXAzD9fBQ93ghjQspuQRDx6bq0q9B8wAeEB4ERNyE6ZE+eKCxcsva0QM+TRSiENIYphppep4zZbiqOBxcJlkEJDQONcjonBskcAqUDCQnLF9oOjvFgnmBMx6W6uog4Xsm1QN2XDOiOdw5u0KPP+gLL69+i0K7rbl2yoV3Ua/CJC+QIMIA0/2SSboXztrknIi/CSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mEToVt0I0T77c8996j+YOaPzM00u2T9ieDypheYmms=;
 b=CpCYwi9yPTN6WpKTxkdnBivX/lNVVH9vedrkoKpICqZWM676Z5tKUQqhNT4NDMvaFSG7aNUsRPfMKbC8N7n8j8ZGtsbkj33n5JJlW8zd2ityQnskoL+RRqTrE3r8FsSBShgxbApIyyW36mwD44dbS06KfD5wskHbAuzwdoSSUpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8855.jpnprd01.prod.outlook.com
 (2603:1096:400:17c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 23:28:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 23:28:35 +0000
Message-ID: <87jz1gkfds.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/26] arm64: dts: renesas: move interrupt-parent to top node
In-Reply-To: <CAMuHMdVn24vKVSkGZ_F4OHiXvqtKd4Hx88Ct+Lz-YcvFK1Gv2A@mail.gmail.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdVn24vKVSkGZ_F4OHiXvqtKd4Hx88Ct+Lz-YcvFK1Gv2A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 Sep 2025 23:28:34 +0000
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ff005e-1b7e-4596-c3c8-08ddffafe904
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e4iql/WIyZIBmCpxY4OydC9QBd7hdhTpH9QViLfw2Yc7ctrHabRy9tMm3js5?=
 =?us-ascii?Q?xT9yov7xfymCuON0vs6IVDllwOpBsYPPGV0+JLmJ2Ff4KxdV4AVC4Pp3t9Tm?=
 =?us-ascii?Q?I2TBKItVgugH7vat/KvPO9SE+1t5Ed/Fjo/bN7r5DJVUAYgfwjjq1qy9GfPm?=
 =?us-ascii?Q?Q74KryUsY1dvT/j2ai2vtF7orsYSCI2jTZqLc7n2owt+25RubuRGK/vo7EFI?=
 =?us-ascii?Q?xOMvwJblCmLUrEXv23QpEcBI6Nk1ucVl8dFdQM9wC45+FxlMG+0bzFq2Ce2I?=
 =?us-ascii?Q?QfQG3polq0hZfmiJ2ny7t+n3PdXjmlbry5MknhJvL1boeRxwLVY3ztrYX9kB?=
 =?us-ascii?Q?M2KErTnMDHgg5g02QbLWoLlB4Ropopdjv/iRqD1Bq3CihYi6UEI3yB/DEo0M?=
 =?us-ascii?Q?MHyn3b4+2Lq6cg236XaTHi8D1IlSe+87ytd3pr1xsxnTQIc9dJ5q9CdpMiO0?=
 =?us-ascii?Q?giYM+EotV4DXE2JAHLEz11OtCXLhvRgg/oG8QAUXajUSn8WQxXLU1Efe8DL7?=
 =?us-ascii?Q?yEuRKuwWCzMJmbCEuGFIOoYHC+dyF8BY/qX8+jNUK2ElxyM6yh3AEP+7SLYv?=
 =?us-ascii?Q?u2WpogGts8DfrVOGBIZsBkAPa4M8Niu+a1uQ6BNlWNsjdsXFkzQkz8EOel8M?=
 =?us-ascii?Q?1Rk2QWr9/kS1w6N5XVY9Iri7bMD/4sFpMJwK9OeeEb6q6IqJtBghX0iM8Erh?=
 =?us-ascii?Q?52qLDQDew6ooMyMD8VhR/9sqj10v2A4uVESxonFqDCDcgJQ8Xvrl4q1+W4rc?=
 =?us-ascii?Q?Oa4BYggZRLJ7b2LRYXMdk5G4Q0u7IsWFLmDw9aqQan+fyPcTxbpZ2WNhAU9F?=
 =?us-ascii?Q?qf9AAUmAnzVTEBCjnM8HFdOGofc2p2EO4FnmwX5CbyLGQO1o7cXOc9WATx2I?=
 =?us-ascii?Q?C4hCgIfeHxxTjw11exm9UfJZB+C/5k9zW/NpLluBYt3Os+ENevJ6gNfnnzMa?=
 =?us-ascii?Q?KR1DOk9EYiH8wiYJbVQ7AQ0xfjhBdTi9qcIoPLeS4AvsW5CZE6J8cMqhWg8m?=
 =?us-ascii?Q?cNdXe+69I3VS395hYwgoXQ0nvzN6p5Y/CnyABWU+CnKQ1IYR/ORphbi6L+Zo?=
 =?us-ascii?Q?2QZw0CLm8AF23GS7wZDUoRvORg3c/gLFF2BcWnPIhHJ4B85YrVrv6usCCMUO?=
 =?us-ascii?Q?d/6GRElH3iSAGM3wpPyPiNW4JjgxHqsyBvdYwVn/nN3LXUYswGem+zmchJmR?=
 =?us-ascii?Q?cltDlSgl3fIzwM6FqFl9ILOPkLzKg3FYXe63YPbnRlJt+bJ3OKp7lgPUk4LL?=
 =?us-ascii?Q?W2wLJSRFmPDiFrg8RtH8uNoQClWWGOTli1MgKLR50lN4WpgJBxitxaTZ3KpC?=
 =?us-ascii?Q?L8NtPjYqay24H0PMSSLKRo2qdfzItM8n14/Ady4d/Ia+GBSx4eIAXOm3gick?=
 =?us-ascii?Q?4AAi9qIUj6YZG/bURgjp4vDIQDsaxelOBCZVq8AYIl7gkfqVzUsMEwXn4neD?=
 =?us-ascii?Q?2hVRcWeMGnDbdttuZSODyvXuHj26ZYRncoXHXXTMbuFIBPxewyupPQ6AdTO5?=
 =?us-ascii?Q?VaC/sa8gMLYZ7XiKlhHeCT9hu1a+USabhOUl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/ikoXHEzNAF6uWoFTqOgQSusMMBRuExTxc7H+36RQuWgEj9EUjwZ94XJYVD?=
 =?us-ascii?Q?CX1TzX0YySERaUromN4hdDUEyEl6ildq2Eosg97PCzJ4BKIvVUzaDjvPogrt?=
 =?us-ascii?Q?CF8f/AFH77DVaHYJXuP/MYuOR2+z2Gjvl1X5y44HMUelxAjRAp/Pu8FjZ0Z0?=
 =?us-ascii?Q?btpNSlfYMV5jfLLvn1pqmDWRWcaAEFM8CQtauj02qhEsMclAAury28lxVQn+?=
 =?us-ascii?Q?2vGgFvBD0Ce1SVbL8KJ+t3X/BZhVrovPpVXBD5qLSrLTbH2AJWacCmauPl+q?=
 =?us-ascii?Q?+8JggndLAFbx1t6+USODu2Nf8+pVajYOV9UOxRcAPumrFONgbvqGwZSnKrId?=
 =?us-ascii?Q?OSLrPrmPSPb7EW7nKMHhV1IdbSagkLsiWDajDqTQ61ursNjYyD3sQrkAitLn?=
 =?us-ascii?Q?/j9+K4j5oFL/LjHCscBd3St1xktcI5ENM5DK5dOwohbrqpwFlu6ANDr6B37g?=
 =?us-ascii?Q?bDM98+WhDSLYtmUIZ9t0WlByOPkBufi7ZDWxB351PeF0UyElUNeJKMQhGaYY?=
 =?us-ascii?Q?KZ3ttrQX97n1yKXGPoypJlIkLjICoslQZGPSLmcwqu/KQgLLK7uEIsJQ+SHb?=
 =?us-ascii?Q?01dtaQmkusJWMBznvcA5TE5b4L4uoTFl8R8pokSr03YwieKCwHu1MhjuWfDU?=
 =?us-ascii?Q?amBWV2hkUTFibua8fa6mgHq8FiCb8bQzqO6Sc8ZQ70Pqy2E4XIiXTWHQIx/p?=
 =?us-ascii?Q?EHMvSXS/HpTCsWI1rJiUASDSlJoQKdtMnRjYVF/1R84o2FNxFBOdURNJhsWS?=
 =?us-ascii?Q?5wJE84NJhCXvcNQXb/fktCuTS4z/PlDhb5/xvtN08AoO1B62HNpvELdMFhJ4?=
 =?us-ascii?Q?aegQiP/Qx/Af2KxvMosdXoqQp6xEJc0tb8RCZ8UU4wEpzWF1NkXlKrItcwqV?=
 =?us-ascii?Q?mU0Peci0B6yAsRTXmr5xfWalo+SicUFV6W1baAT9Id5u4nOAUQAA5avg3zeX?=
 =?us-ascii?Q?8fAfcd/VeqEet3Piv+f3s+FNEbNadjLUjg08im2ahe6rOwotYOXEMDc+rRzg?=
 =?us-ascii?Q?pMChX2Fm08BwTTcqbUdATYpZKSGZgcpOFEyWWwRbhPjuDO/43WPnKxaY7Itb?=
 =?us-ascii?Q?zCO413cEd6FxRGrhrdKtG538hcadFQ6sSdS2/86tueSBJPCYydKx0u02jDcU?=
 =?us-ascii?Q?QPDmcjLyfmq3nvvm2hhmsE5CWK7W9U2FhpPOcTJAxCeqrWDfgwNmqyFFcxBH?=
 =?us-ascii?Q?EWlzSkCgMQO8pQjpBAbFQ/0ddnqupCgMZFEz+Pg8TmfrVp5GQ+tTDo6Qh0Wx?=
 =?us-ascii?Q?krpfHCX69IowpcpWOUKZklLVYxmlgNv/VHObgo1JB84iT2tWlGRiqtkv4Ddw?=
 =?us-ascii?Q?skQ7Z/4nc+iNdM0rrIScjgwuX30JbBrGe7N2YuInN01ZGlDkjO9BSEHJYyGd?=
 =?us-ascii?Q?RSWkPuKw0q6PpXKbdAy/BVtDJB7/C0M2DrI+cJIepEkYj62C0y41KBA/CqOy?=
 =?us-ascii?Q?An1bWEQFedY/qoJC+VnWdq0zAsdAMTl4jbx8QyzxNfCwGe4vgctXtee298Nm?=
 =?us-ascii?Q?GBk2VTi3rOTZqXgB9+B34jH4eHpy08dUE2Yqb1tjaPb0XGW4N4huY/cWV5fK?=
 =?us-ascii?Q?eWlAII5Y31o0vqITC0QuMK3jYX7xh6GbvbQy3C4pPvZEwOf08SVEJGcYl/kH?=
 =?us-ascii?Q?xL1jGarVV6C6S/Yq8mHTznM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ff005e-1b7e-4596-c3c8-08ddffafe904
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 23:28:35.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoQU6TCe5IT31fRKyZ/DFeeis6z7vfxrEdzA8GReNp8XZoKQDwcHD1mj0TBHd2o6c9LxJ/UAYDpzhF3m0X2jtjb8UGguzoDP8KOzJzT+MVWs+acDXc2KMLn8K4gOxD4g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8855


Hi Geert

Thank you for the review

> If you don't mind, I will fold it into a single commit, though.

Please don't this time, because backport will/might be very complicated.

I'm OK that the posted patch will be squashed into single commit if...

	- The patches were for same files
	- The patches were squash=able from technical point of view

Thank you for your help !!

Best regards
---
Kuninori Morimoto

