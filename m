Return-Path: <linux-renesas-soc+bounces-23562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B9C047BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 08:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E3F544E46DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 06:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF5926CE04;
	Fri, 24 Oct 2025 06:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jEM7Xd3c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C241E51FA;
	Fri, 24 Oct 2025 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286897; cv=fail; b=BH60yPrQ/NGt3dXUOTXTFewBdt9LNTloD6LUyqLpUlnCDHqUAesibYP6O54FX96iE/07b+T9+Gn7fFSE/pFE2qEfRXNGloOB7aOJnT43VdGUwmsTmn3BxSizrCwcb8xl3EQ7GMV3MLXf+Tkm9RagOOZ1u6FgAmyamgdenm/6b7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286897; c=relaxed/simple;
	bh=BnkGnQr8qyXEA78tlIBMias1UBjDGL1CEU1+kH+D1Zc=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=Mr0YnPfx6F1mxzNREhcfgKKSmcKJF3uxf0E/Jv6It0f4ogr4rCPiwH/9Utt5is/Fuo3xbH4aaTYzZ1yOabFJBstIGFD25RkOpm7Fu+bcPBz7wLmCU66Fk08Ovc1BeKG6ZD/5KQGkg4jLOmkHIEAcsmxR6b6we9WOFRuMPw1UIBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jEM7Xd3c; arc=fail smtp.client-ip=40.107.74.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZsGdM8ZaO7kTZ5GmI72DRvrBZF9twCHVWnbVFoNLg0hwoyx4aDIdix8ImQZFxp0SPzJNGc7CHrRdDinT4TzAw3UEyOVZz5D4Ziaf9I2Js0E/Ea7uAAE4YrUMPdI8aZ+mJw5tgj9cjmPqQwEdiAtw46teM7ZeVt+mfbhWXugGd+xMlrOdKeLBWzP1dTmiBEa1CBqUIyvtuW2X1OarYUCMpcJ1T1jqJrqAoMKgtbMh58NFfpp0LIszHZI6y3nHjo820pak/7Usf10rqYsuCf0dzo0gK/3jS5oDsTcvQj7qtNAGMcjOMUycmcHbZJaePxQnyh/elIKwOy9C6mPgu21osg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLO5nuRfMKsohVeveafiEAOxTcdxOx1NFVCRJ46ukBk=;
 b=e6AduQjIuo1YEQaUZj24SijPkz4SqEXG8St9ozkDUiZJUsps9+7gIE2HdbicJcxWhP6D630cV/EwoJYyS8BS2k75e4zP+W4beegADSZQFjGkx8Z1+af4FeTb13Y3+zyC84Vnnz5fxikRlhmtJUJp0Crv018ODLXDp58A33+jYsoEZhBsT3ZvqXdwfxvk6Crslb6U7CssFWJeUIqa6xo8qm0LwAhifXr2pu+gBlGEVVt2ZYaDnXw5tBQAKT4qEd2o9+PVFb3yFmwenESej6zb8DjGzVYgMgz8R7nZ+vDsQUdix3WfTAvMZ3VfwXGb9fMtahE6YQ/ueFZphJEfSKmMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLO5nuRfMKsohVeveafiEAOxTcdxOx1NFVCRJ46ukBk=;
 b=jEM7Xd3cWWWxVG1QgZK0kxZY5Mhf65yITprJ0zeIHIICE+uS8w67c6W7ZtSQOS7pyDmdjH/nHo4BzZz/XWnlEOK+sQCAIHak9PfhWNlNhI3BcZxSDqAR9NodpzWxMBjqbA2G4hKLxFvsORdoIrPdNuEVX1GJqrHBKrNuUI2rkqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10774.jpnprd01.prod.outlook.com
 (2603:1096:400:2a6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 06:21:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 06:21:30 +0000
Message-ID: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] mailbox: renesas: Support MFIS mailbox driver
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 24 Oct 2025 06:21:30 +0000
X-ClientProxiedBy: TYCPR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:405:3::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: 51816c31-ae5c-46ed-30fa-08de12c59259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/c19B7CTxAnYreOC3i+egEjqwIc5lCtm6NiTgw6rsLyQ8HkLqAtxp+j7uImk?=
 =?us-ascii?Q?E+w9U+6URF+Qz73LxISAn/xsxvDfN9conxhS5O/nY8YsltVzG7jBc9arhDBJ?=
 =?us-ascii?Q?eQSqN5cPXS7B79A0uK5uT5IiGJ8qhCBOfZSN/KPBsxPiZWUWpDQiT7v1zFdB?=
 =?us-ascii?Q?nlABgPGml9JdchmKNVcvPYqL1gihxsw7UMDf+HkvDJQBLd1+Rrq83TfjiDBs?=
 =?us-ascii?Q?2gu+IC5TWkMiDJjf1nzJu2HmS2IeHSYqlJasxi4noqC4omD1oGSUtDFHQ4I6?=
 =?us-ascii?Q?VAKiGjzqs9G3hOekxzVPq6DzYmkRf3HprCHDLdO7DipX+JA0ITVbYkaQPbcS?=
 =?us-ascii?Q?72caU00JSbkNx/pMAlaYqmHCCojvMb68PE/04B0DppmN217ZYpPiFZeqAFZV?=
 =?us-ascii?Q?9zyh5OQtAX9SIUd4KrDTUsA4rBhrrwLjGNXo/AosA7RuJkpekaYidiOKvYqh?=
 =?us-ascii?Q?fdWS5k6/lgVbS7T7nmoN3ZppGcX05Z4v2IRf8pbFlHIPlhg0fQXcVxcFT7vf?=
 =?us-ascii?Q?eydsrwz5bL28y+M2N3mv5DqKlM3YlYr082+r1Zt3pDL9DU18imtFu+6PYIHE?=
 =?us-ascii?Q?xAjINKF0uGkdJ32c70uESnrj7IlpjOn5eDXXIx7T9BMrSHmug9xJGGc6bBb5?=
 =?us-ascii?Q?S3I1shtjvEFdvE9ljHqrPUzgHUc6ukkDZoJX8a/vmUGLms87P0Y4HBqi2uY5?=
 =?us-ascii?Q?WmiU5svcw1C6QcLhoWaHyIIma2wi/bd+07NNwyNTxCV1T4pcMnRDgvBS/Wkb?=
 =?us-ascii?Q?1mYa/+08Nw+g4IGtlsifN7fC0kbYEEJGFp7IrlJyFigqpqXp4gSX2qIg1Ecz?=
 =?us-ascii?Q?Eor6i6QnSCP4ehDToN5AHhjp9AmYnjVDXckmp7fliHte8XeXmd+NmoWRmDJH?=
 =?us-ascii?Q?22ndE69+FB+sDHT4oBl3Ym+ahQ5ALTpbzNCgQFAifJjSY5jo7qo9oHmtJaJj?=
 =?us-ascii?Q?rYejv5ogRnux4lAmw0Nn3pLejBRHUyH0i11+jRYI5H+ah8Y09PawmWzOHwez?=
 =?us-ascii?Q?JLzp29HaA7dUxMziaaLDaC6U2bK4+7NXh+CH9dDbbncT7RrEDuRVDnG7r2gr?=
 =?us-ascii?Q?rfR7xJHUEU7K2rlESffvdtbDDWPK6uxsb3AduiO4YsO+RuBHdo/7G0tKzxXN?=
 =?us-ascii?Q?jE3jabnWBpH94w3l+fRNtJXnMhkY3Xr3idXsevu5c/8JgLnC7sFU2Kh/86z2?=
 =?us-ascii?Q?1hYKD8Z0cEmD6uo/O2njgFYtP4yaOYwxBqMW8pcb0XPwsc8BfhkLjC1S9lAb?=
 =?us-ascii?Q?mOO3coGARd/+cBCqULFKlF3uvWlcXaa01e7QB7+JQThPCirjqGdKui0ZMzIA?=
 =?us-ascii?Q?ADtCHa2HoeRLoD2ijXwaTsHkZE8IK62xfqrmigzkN764/hHUZUS2/Xe322bj?=
 =?us-ascii?Q?NVc46ZOynGjaboMNSa6Ep47qtNLEvFOr0MTxcWH51OV0MCIPk4Sy9z3fyp61?=
 =?us-ascii?Q?CNabljwU2AzITvwygh7AjmeVeIqlb55r7EPLmSNCtUhtqxC94gz4yBmW71IE?=
 =?us-ascii?Q?8eiNm9IhsNxzRSpehvCX/Gk6WYFmrlQwwUHO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wBDSoc9zF12Djz/r8Mts2SC3B/Vw7yTwNnX5P7hZrqw6OePTt4ozvwEpMtnW?=
 =?us-ascii?Q?UX7lcJxUa77VOmG/+oZ0Hu0kRogXXwX8qME8TfP2LvroxcesuNj27GeE5v5H?=
 =?us-ascii?Q?oWm11mMfwa9xoWCEfiZSK+FP7YJ1IhwF7WjAQzcE/YdeowgiSSi3w44VXVyS?=
 =?us-ascii?Q?qZEghy2rFXGXXr+Idx/HXuxIAiyx2xxsFgla6PLHfq0AZ8DZmh7zY/9K/wN3?=
 =?us-ascii?Q?6SylIc/tQwmlZnyKpj8jmKdQpaRUt2HRyJZHwr5tiISFD9PmSwhFV6D3YkXj?=
 =?us-ascii?Q?XPM4oLRntwTVFq8fZy7n2HyBVQFryEl5j+tUjsi45PoCi+3+46dm7YZjK699?=
 =?us-ascii?Q?4baIphk4b42wyJcSGsWTqjH5DAKAGRnW+6FXFtgqA+IJd1S8gkq6kjn3E9GG?=
 =?us-ascii?Q?Uo1clW2gqZTWCmfaKmPscr0QSCSKRItbeoHaDrLDLAY0RnjamXsKTgSaB1dC?=
 =?us-ascii?Q?zQihf+vKxrmtoG3laoqGC0dFFrKCYT5LzXRdGRdfT/nBT4PBjMva0bHkQxGV?=
 =?us-ascii?Q?A5LeH0jkcAa2o2xD1+zKVGR5U7axerHrTRMIY+JeIWOTb+vl+UYXXqqBvJjm?=
 =?us-ascii?Q?ait/BrQqhrwgWdtYDH9bpIuoo3vDqOvcQP5OXDcXE9lB+mFDvukUPahUN2R4?=
 =?us-ascii?Q?uSsOvFMrVZoGs8spf49M2rXsS/G+/AbMiSVngb7/SXaiH+Y5wI0PdHJN6NoF?=
 =?us-ascii?Q?fP3hMte7Ap/uMO+0QwxZHhVC9YRqQLP9p/493ugjf0XHDqRkGcKMGkXwxqmm?=
 =?us-ascii?Q?E4wJqAlGQNAnd90BLpihWI8WxqlMSXHDzHSLBgvT5nEnxoYLLROhwlaB4ugl?=
 =?us-ascii?Q?kU3psZb5oI5VmdNgny5xcACPkm/DGU3KfUlijeXP3LfuXIr50YO+LFijN7km?=
 =?us-ascii?Q?+SyVoxGWK9fQDxHr5On3agCOnARRM0D0HacAV1ytGSYno1Db81BdRB5Rr7Zp?=
 =?us-ascii?Q?WRlkPnvCJSdNtY6g804cbjj9/cMlBm3lAyrUDLf2CsqWcP++81IR9fZjpNXm?=
 =?us-ascii?Q?cYK5M9DS10ZexcwPEYhttdslQYWhcc/AoK0GV9uo83ItWMVuRmoTDPwULq36?=
 =?us-ascii?Q?1tZSZRUhqiMHeGZynfhuRLjY/C/26rdswK48DepTheVOLVe3aJz/dpkQ6OrL?=
 =?us-ascii?Q?ePlBYdROC9kez/sPfU8JB/zoXYzSGGk/pNH3izvv0/LUgXj7Wp9uiI+TFC28?=
 =?us-ascii?Q?gBvrx17K6sMPL00pTpmyt+zPW9tdIPNW1qCMkFsXIUgoN9z/gdbuoTQzpyML?=
 =?us-ascii?Q?xchja5b/ujB739uq20K/bzIweMIrvn9Nj8VmS5XdxTqTzyefnqcu9QIX7wlJ?=
 =?us-ascii?Q?2iQqr4fWh/JHxpmqjzjpKRqjkk1Hrsy/mzgTbOEoDE/MYvrdXHAk0SHuFzcs?=
 =?us-ascii?Q?NvGhXHkSkfoEACYwKn3cpQHaitzjRuiWpYuuSeI2xrX7HeP3xCnmi8JwO3fi?=
 =?us-ascii?Q?+3yJvc2pgMg2IzAjA3W8PTzfWT+uFEqpDvRP40/gELu3p6rqos0LP16af0vQ?=
 =?us-ascii?Q?zTumrQ+CZAtWUgzR7GFf69d53ICphFLdRuGmplxlniq6FAKbVkFqGKyI2OAz?=
 =?us-ascii?Q?tPSyEJOF9XDlYgYV0Upb1m7qPBvKvQwQQkB+uFnH5zATwosyrAxX83Xl0ii3?=
 =?us-ascii?Q?0JjSxgakckMbprtT/5VAoIo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51816c31-ae5c-46ed-30fa-08de12c59259
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 06:21:30.8445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQ52V1teM6t1jNl1j05kxpudkbeB2x8c2LoWIpIxtyLvHHp+j/+uurf+U6u1L0gt1BuF9AE9QjzqCLQ8nDVQ3Pbcz5ZfSDJE366BXNLNHZDB0Ss1hiBerRcKzHXoeMlE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10774


Hi

This patch-set adds Renesas MFIS Mailbox driver.
[PATCH 1/3] is cleanup patch for Kconfig

Kuninori Morimoto (2):
  mailbox: remove unneeded double quotation
  dt-bindings: mailbox: Add Renesas MFIS Mailbox

Masashi Ozaki (1):
  mailbox: renesas: Support MFIS mailbox driver

 .../mailbox/renesas,mfis-mailbox.yaml         |  49 +++++++
 drivers/mailbox/Kconfig                       |  12 +-
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/rcar-mfis-mailbox.c           | 137 ++++++++++++++++++
 4 files changed, 198 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.yaml
 create mode 100644 drivers/mailbox/rcar-mfis-mailbox.c

-- 
2.43.0


