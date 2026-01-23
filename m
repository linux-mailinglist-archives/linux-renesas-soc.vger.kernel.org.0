Return-Path: <linux-renesas-soc+bounces-27355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC4cJgCGc2krxAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:30:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F8F7713E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F47530488BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B98329373;
	Fri, 23 Jan 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Zi/Gxgb0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021073.outbound.protection.outlook.com [52.101.125.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF3713B5AE;
	Fri, 23 Jan 2026 14:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178514; cv=fail; b=S6Ke71sv9PrZkSGgDIhx066+XIi56yexP24JfGrOeaSIZMUEhT/Y08sOFdCCnVty5W027J7Zw7yzJoDDDlxgOI4LmZkeqwBcb0eDO4EYlYUBGwN3cxG9IcZY/ovqwfQl2oRJ8QoBca4YlzpHYNVVlV64LCtiyKKZC5WgtlVKqj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178514; c=relaxed/simple;
	bh=0lQfHdcocpUvOzF+ahqti2+4TAfQYg7znF/H1vgUBa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XDhIhjMD/UJXSqy6t52TC7k1+RxFd9qKxz2KkAIaT9Jra64sHaLYastvuuLuQFwrzLIZIxZ03mAsm1ixv+Z/mqYVi1zQJ0hTDy2ATDxDz/qUxaTariWD/mFmrGTXzEoWpdI5kXN1dLtW4xpe/WprHUXgQSZS1o2NXwEPP5AN8+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Zi/Gxgb0; arc=fail smtp.client-ip=52.101.125.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JC7N19/BRTxZYOBTx9pdcb0oIc7/PAL7ipjh2K5iSkizKYiP26gzZIaZSSNTwuQPuMEYw4YHpOZ0T2dNLKQbcDUg2PVR4s7x1ty3eWtGYNj9JUfTRkapzw2wrTeEC7gm3ZlZQLAFHAWZpNnZEZwnrnyPRBLqMBqLACUoz0xEayWNrH8MjJJE5kKLF5Fj2L9FOS+RQBiMzDwIxO7yWoitsr3V5nK14wT6AlkMVgGtCm0ZHmjqb5UlaeNAECcUVYTKIYrLWg8yIQUQHjxXEC2zTdfVQ/dXjqf6IkI8GArmkUZ/grjgaPQWNl6GAGoPh5gY5kg1CRAWZFy5oIgQFaWLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytnkaAICS/2Id7jXbgU8CoJYMoDKfH/xTA0PQeJfwkE=;
 b=hDJRkh5fDd4+57Pp9Oh6rwvQKXGzLsuvV0ITY+9UUczN4NsKHKIeigA3U+xEcCYEuo5ylj03iBJSOJvVy6MWauvgtKqnbeN7CSRVuxlyLSneHoBPbMIlWHU2MdZdfOlr2k318T6OT0U+qu50Lnm6qH9XoCwVwTCswXL0yPE8k0dmde5Cv1yJSN7O5pdgQiOY98tVz5Hw1ngN1G1A/Op8wIMsHj8+nV4Oeebu8zlKb4zIIOa7Wj1Sw0QZ058Gg6F2CrpHMuUbW3oRdI/VieBAeYjPFrMR6r1Q6iEkpO6QDTkKRQ0Zrp9YgtHSebQjn1Q591HJe5KDJWt4SFKhQLccCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytnkaAICS/2Id7jXbgU8CoJYMoDKfH/xTA0PQeJfwkE=;
 b=Zi/Gxgb0R+b9EsSKv9hT3kkZHJe4Wb65YFnhMb6A1ORCF/nIg/4enwWmkqgkGTCkt+FC9odBc/LwBxa4vsnda2z429H8W7kY19K0bL50bDWA/WgwQcCpJ/NS6RwzVML+P8leooJIBU96TmAi8rJljvBXiwTdFOnexNKW7RCn3uM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5430.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:191::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:28:30 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 14:28:30 +0000
Date: Fri, 23 Jan 2026 23:28:28 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, vigneshr@ti.com, 
	s-vadapalli@ti.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, 
	jesper.nilsson@axis.com, heiko@sntech.de, srikanth.thokala@intel.com, 
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be, 
	magnus.damm@gmail.com, christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org, 
	rongqianfeng@vivo.com, 18255117159@163.com, shawn.lin@rock-chips.com, 
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com, vidyas@nvidia.com, Frank.Li@nxp.com, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 4/5] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <tyudbsfjh2b7rzcascz4blv4uhkesemxqby6r5mmvgyfqrms45@mshhj53p53pt>
References: <20260122084909.2390865-1-den@valinux.co.jp>
 <20260122084909.2390865-5-den@valinux.co.jp>
 <aXHsd7-WWAGyhy_w@ryzen>
 <s6bnqkbuugi7oio7ybekdbk3dokpbe2bui2wjltdwajxix2app@wosgmhrfsriv>
 <19D609EC-F850-4B43-A83C-0B8C70E641B5@kernel.org>
 <l7wknbayighcczjkqfwhbaqrepjtbgxxstgkntoqvnrs7dnm6g@wvmy67ky37pv>
 <aXM2hwCrziK2I8OL@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXM2hwCrziK2I8OL@ryzen>
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5430:EE_
X-MS-Office365-Filtering-Correlation-Id: 085d56e8-448c-4ba3-5caa-08de5a8badfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?teFzt6ongHxglH4Jao1c+WGnHlNpaeP3L3J4xRGbakyLOSXQvEq8DHI2frKB?=
 =?us-ascii?Q?4A6pGE+v5nFX1RVEHSNhMmmSb1Ggg4htHw/EHkbni3fGfYXYSCKgTNlqHs57?=
 =?us-ascii?Q?IR/R9RW8f4zzaTvz8SyMLpvr+U3OjVVZgBEVMhaLyFHvqdfmYdUffURb5xIg?=
 =?us-ascii?Q?9HD/UzRbCG9ju/1PbO1rfrhke0UB1hn+cFhThfjqv5XnOpwec/8kB9RYrwqN?=
 =?us-ascii?Q?sn076+sm4mfy+svM/5GLtBfMFD65PINpAFLhjluXTohyFH9ZOUrsolXzBG4u?=
 =?us-ascii?Q?UTFSMaxBsmHU/iUEfojQFWcobgXLoclnn/l5SJCZ1XP8A25hLp/6G/gpO87h?=
 =?us-ascii?Q?l3W3iJ5AXnZprg5iu80FpaNhSK2qexgKGoCmb55EY+PPtDWDWK8OGJ3FbgS0?=
 =?us-ascii?Q?u6WRGHWPIrrly7cfA9jz+YPhxgpcbDT50xeQlh4bLXhSkgvw9GEl5mOXcEbV?=
 =?us-ascii?Q?JiKHL537V1uGQ+qJ/w3SIu9rWEZuW9dFdG3XkxpeBfTPQ7yWU2W/gAlbmKWE?=
 =?us-ascii?Q?29BeeNHX77KuG4UArskukdVKWkljEOR/7ASLs3h+5SJLbxHb4GNffG+V/9LV?=
 =?us-ascii?Q?/4j8bsuz4SHsVU/itA1PK5Xda7I4nX+vb/mFLWyYhUzXb4wcNKdVTpgcp8OH?=
 =?us-ascii?Q?MUB22J90zL90vijIB3S73GeF0lRnauHtox2e+vGz89nw2IvnHwtd4LAJB7CM?=
 =?us-ascii?Q?dUl9FkxfFE2UBJrRJB6tX4B4p63IA6iIhV05WkVJp6dHjmWY+BN703Rf/Q0o?=
 =?us-ascii?Q?IS2aozGT+PtxP7Ds0tb5pcBqnFMLAKmQliQtDvDk4LjJJFm4K/VWRkLdDFNu?=
 =?us-ascii?Q?f1m7WYPGd1bPT/Wi7yC9LjmPcxFXkSf+TbK9ZaMneOSlF01HZg2//pI1iGX8?=
 =?us-ascii?Q?nCeeBDid8ZRVPZsdRP6RtCjmjXp6b7SyZ+HpTD/t3qu/oLlMOqCRVf47pv3V?=
 =?us-ascii?Q?I12paQ3gqRyciiJouJHp9w/yJTMEsPSOB6t86WUnQQH7JDumOsn/Y8hHdmMI?=
 =?us-ascii?Q?WsUB60Eb1qZv6KoZKNUlAY1C7UC6GCB42qjd88c/yAjCYCK78iF8bp6GV6Hk?=
 =?us-ascii?Q?BbZ6x0Hdp5NNsIcX5gU9OUj6dNR9t2rNDkPEvIVyXOcWf6+3JIAzsWngT39B?=
 =?us-ascii?Q?A+NYBjybImAZ59wcSNqf6xq0e0qrqh7p4wKj0ZtZvGcbnTm5b3cC+PNv+4ay?=
 =?us-ascii?Q?b9Z5/2MvMfDAdYpev6/NOQ0FSR9To2k/DScVVvhL9i8aUFQ1vuDGGEW+Hkt0?=
 =?us-ascii?Q?dM3X6ND96l+1O+przXfB7GgHAct80tpj1ONPxK4pay+MlEcAqTDu08AIUxMz?=
 =?us-ascii?Q?DFA3SoOooa4ecNqoJzrk4rRF5Sn2t5OuSq91/rl+828IsjGBd/libvINpLDD?=
 =?us-ascii?Q?uYIXm+v9zbrgwnbymTrbXib5+MljrzNHk/u1FhMfdHr+Ygx6vMrdlmt7UWau?=
 =?us-ascii?Q?HUdq2LNidVtKdVJ9vCBK7jlcVEjIB/x9XlRClXdmyM6xtwD5UKslS4WHUwVR?=
 =?us-ascii?Q?cmsRKUxECT1H7N3S7Q9hMpFHXS2xEOD/1H8T/igEV2z+r53RLqxOmipj5SwN?=
 =?us-ascii?Q?2y8+0Ubk1goyML7M7SytUk4d5PVOkhBKC6JTB/hz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+yWVREqRY2nbvDcwzGyoD0OOhdvQ/c0V1015Aof8YRinZxmeOOkKjpv+3soo?=
 =?us-ascii?Q?YMoZO/Nsw2VRv2I24Mhc0t4KAAFp4OUTkvI2zbKimAvjmHIhBw6GE5hMsIFp?=
 =?us-ascii?Q?dj1adkCIxZNV5fso7HZ6vm5k/B49/wVbhJ6dTpWjWHkSLVHslaoLS2sZkexT?=
 =?us-ascii?Q?K77OYfBin5JRzPbSF1YXlOrmXAVcfydDS8dYY2GLOO8EmSM2rsExb9q0JEfy?=
 =?us-ascii?Q?Shtzebxzc9XpaQ2aCsCKC8GRadtKNBXJZ/9fPCmhut4yX73ADhLsQ+sGyaKG?=
 =?us-ascii?Q?KT612o1iiecxtPGcu5zHqJWaHKz4NO4WWr5F13sjx1KUUt2vER9NFs1S+fCL?=
 =?us-ascii?Q?wiwZrBaSie36DX0YivXeo1Yxh5mR9sv1sYEiQd+3OS+yTP6doAzc8ARouoOx?=
 =?us-ascii?Q?v5LRHqjaxjEOHCnvPszcDDMQVvRZ+354n3QVAOPK4vs9S+aJPB6qf+/5sF9V?=
 =?us-ascii?Q?MahGEWubG8KGlHsO1q35sBi+/4EpnFyq0DhVuXdRIqMNJX0sXSvxyr93uxWg?=
 =?us-ascii?Q?wIZ+ncNWDwZAokAg13c41hrz/CfUzNBocVeFwOymeiAqy/zmkpXRL8hphdpZ?=
 =?us-ascii?Q?h0H1alwOUNtOrU1lNbuQn+B+FBygVx8QHmvjVg++FLAYEulIML11aY/Szwbr?=
 =?us-ascii?Q?x2edHytBBjgCN1vNwKW4jxlSP1lDlf2ItcsgpN22J7YEdsWd1hRg9b6ilR7F?=
 =?us-ascii?Q?ATgEKBXIU1wT350L5dEWTdt2sswEosaP9T+p90iAolan7CHW1TxL6JWqwdPz?=
 =?us-ascii?Q?VHzHp1hbaIxkWmAlHOTLqSyI3LnuwfWFn4VQvjXrYtax4LSCpKdwGt7tTutE?=
 =?us-ascii?Q?kdlYxSsI155x5cVzTIj8URV8NQJ9vvRFG6mYyZpGcyMd3oDBKKqWmA87P51E?=
 =?us-ascii?Q?Edy+ITk+KRIdjpEUB8nxLsUQ38li3OFj25HBFysYEoSXuW/AjEddMSzZzd9l?=
 =?us-ascii?Q?fRozVqCE1Ow1D9INYnkXLp2S/T6U13Rv1eMoLd0krqFYgyq+SNqSTwcc5GhA?=
 =?us-ascii?Q?L3/xmM7QcYouvwlBUIPoMwZsVbra3wAY7L40J4yjZV1pjsAGc21G7Zyj0D4b?=
 =?us-ascii?Q?sNBICXD+RajmbjFnfses0J88GMYny5/W8wwtwESNaVS0XCgUENYPKmQ901kX?=
 =?us-ascii?Q?7U+l8iQkyrvPyaa5JoSRAWsT4OCJvBZGtPRn9JgxRIGgiyd+89X5Sjjks7VI?=
 =?us-ascii?Q?LecUzJOTniCYA4FpOM3JqZAlZf+zWdCGG/wbZl4o2vGknqts4yCzN9N56ITb?=
 =?us-ascii?Q?ZOg2lF41w3YX5ydmDY8n7xCIilVhlbIYyk1pMvCCaE7NDyeQ6VLXLoESmKXH?=
 =?us-ascii?Q?Pxu0j+5uKTlbVKBIqqRL/hDb/SjgmmCo1JR4e+tQNcWovlR0u7Oix4j8LMfA?=
 =?us-ascii?Q?jOXRk7x+u/xWY3z/TtmVUtKMz/Eld8U3EiVSh5Nms4acvlZazk9B0r9nKJwK?=
 =?us-ascii?Q?w9PKLnRF8JAuyWUfNV+OJ8baWDPULLmw0nKNA1lM2UnoFDjgasuGJeXpnmI8?=
 =?us-ascii?Q?e4x0gZGxCdaKrM5k40e+3jN66QuZ2Jev5QyG8+IpFZmR8Ls2rJdLMIBM/RTq?=
 =?us-ascii?Q?wIPbziB/F5ZOfG6L/ZSXZGlRancNjPgJXaG4p5gMAnyi9rHnUACnU1qOTUVA?=
 =?us-ascii?Q?BecMiJ7IHjvFB9qIfXqiXNkgUHkGXYdYx/phfPBVCSdELni6xnMxyDf9D4m+?=
 =?us-ascii?Q?qSAXIp2IkXDNGlg96Ixk2FYvcv7A0UglaikzaanfUmuWRrRQjdkFbXM87NNd?=
 =?us-ascii?Q?EP7+gbVFWYfZsb8sPTIjH42ILJHFeGqSg+XDWibTUi0OmXn6w1PA?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 085d56e8-448c-4ba3-5caa-08de5a8badfa
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:28:29.9571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InOf8FpzC3J3dvoe1hHhzNoM5Em6OjsdSgQc/nLGN5jLulc3OUmT7PcUJ3G3qOwFi+YO0gH/JV7+JpnGpuxRZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5430
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,ti.com,nxp.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27355-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.991];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,valinux.co.jp:dkim]
X-Rspamd-Queue-Id: 11F8F7713E
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 09:51:19AM +0100, Niklas Cassel wrote:
> On Fri, Jan 23, 2026 at 10:16:21AM +0900, Koichiro Den wrote:
> > >
> > > There might be other EPC drivers that don't disable all BARs in their .init(), so I would say that simply checking if the BAR has an address is not sufficient to guarantee that an EPF driver has called set_bar().
> > >
> >
> > Even if an EPC driver does not reset the BAR in their .init() and some
> > default translation is left exposed, wouldn't it be safe as long as
> > dw_pcie_ep_ib_atu_addr() succeeds in programming inbound mappings for the
> > entire BAR?
> 
> For e.g. on RK3588, the default HW configuration of the DWC controller has
> all 5 BARs as enabled, with a size of 1 GB.
> 
> There is no inbound address translation for these BARs by default.
> 
> So for it to be safe, the size of the set_bar() call would have to
> match the current size of the BAR, but how should the EPF driver know
> that when it has not called set_bar() yet?
> 
> dw_pcie_ep_read_bar_assigned() does not return the current size of the
> BAR. So you can't verify that the set_bar() call has the same size as
> the BARs "default size".

I wasn't considering either of the following cases as unsafe:
- succeeding by chance in programming via a one-shot set_bar() with submaps
- such a set_bar() failing (due to incorrect size recognition)

while as I mentioned in my previous reply, the first case effectively
becomes a loophole that contradicts the docs and git commit messages.

However, since v8, the second case clears any existing mappings, which
could indeed lead to an unsafe situtation.

> 
> 
> >
> > That said, such usage apparently contradicts the documented usage (1st
> > set_bar with no submap, then with submap) described in the docs and commit
> > messages in this series, and allowing it would make things unnecessarily
> > complicated. So I agree that adding such a safeguard is the right approach.
> >
> > >
> > > I think the safest option is my second suggestion because then we know that we will only call
> > > dw_pcie_ep_ib_atu_addr()
> > >
> > > When:
> > >
> > > 1) If ep->epf_bar[bar] is set:
> > > https://github.com/torvalds/linux/blob/v6.19-rc6/drivers/pci/controller/dwc/pcie-designware-ep.c#L363
> > >
> > >
> > > 2) All the other requirements to dynamically update a BAR is also met:
> > >
> > > https://github.com/torvalds/linux/blob/v6.19-rc6/drivers/pci/controller/dwc/pcie-designware-ep.c#L368-L370
> > >
> >
> > That makes sense, and it ensures that the behavior always accords with the
> > docs and commit messages in this series.
> 
> I think it makes most sense to put the "use_addr_translation = true"
> 
> after the check:
> 
> 		/*
> 		 * We can only dynamically change a BAR if the new BAR size and
> 		 * BAR flags do not differ from the existing configuration.
> 		 */
> 		if (ep->epf_bar[bar]->barno != bar ||
> 		    ep->epf_bar[bar]->size != size ||
> 		    ep->epf_bar[bar]->flags != flags)
> 			return -EINVAL;
> 
> 
> So we know that dw_pcie_ep_ib_atu_addr() is only called when the size is the
> same.

I'll send v10 with the fix, possibly adding a BAR_SUBRANGE_TEST to pci
endpoint test as well.

Kind regards,
Koichiro

> 
> 
> Kind regards,
> Niklas

