Return-Path: <linux-renesas-soc+bounces-26221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73648CEB86A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 09:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1573305E711
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 08:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5DF312814;
	Wed, 31 Dec 2025 08:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="po4kwGkz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225653126DE;
	Wed, 31 Dec 2025 08:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767169432; cv=fail; b=cf4NXEDP9bOanc95aJByC87s65f+FwkB4NNL3m4Yg0tP08usNdZxUUGuEPLe7xIfa0MF4V/JARFNHlq7pyvYyUq0bPt7zSvmWAAyM5lD8ALxSq6/EXGsziZn+i2MgTi4zIE+lN3cBsvawdwHHf0hTXQIjoV7Ykw4PzHnsU8YhSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767169432; c=relaxed/simple;
	bh=j31xolGav77WLeDAz/rucjcQ3Z+OqMsDbI8BjXQoKSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jFVJiVyJwzYMkYDBk53mZUp9OWa/dUMpYtXhwUTiKV3JxXGgLsH5eaYj9ErLH52RyQzzEXNk27p6ZCbvdnhRypPiraxtf2LTjQlpnG9J7sw8j3CxB7ILp2+yzScChpeeQVfm1JiNMx9b8Wym0uo0FRuEEQgooIxtW40VNqBaLeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=po4kwGkz; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wutYjzTuRd8s0wnzF6MHcc4k1r8iNkSIPqdX5GIyvAQZHQBjy3Zyt1tasNpr/tZ1Iw+uSpxDiqZf2/MtQ/Ni1mESDQq6F+ZGSV6OGMW1woj3U8oo39h3VraGQdexMF/uMYWuQ0TU8bv3TZe2pzvDkjuFw0QuAyEW5IHgh9M4Ph/gbuA4EpgkZZzyUU71qDjequxitWNghHkhYhfwjMiyihUrfPgRx/vjjUnU8iTI0bR9iqlkP/gVZMGFs2t5fGOTmMyuKIkNkkMVymD228vDcevYcJesDb68LeXvfpA5lLZosmMu9MUYTzql/kBJ1UvqZa6f5lj0fllvMrtj4enErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhQav2p7b1d58O2LTyzyx8PjFdHQf4g02g6mqwe1aGo=;
 b=XdwwIQa1xnqikgxpnFT88wjEhrJ+1XjbshedEeii7hDes6DKtqfmkcldJbd5xtz/pQQ3Z6Xpbd4Ov5T1WVR2sXoTvpijSZAvFG4XYlUme2PVS9U8YEZiIr1E5yiMonEZ04vQsA642ajkVt1RNh8yfV51rrHnN/1wFPvTvc4G6ZElEFlV3BLrXphmn0VB4jeSXKzXY1r+IdzrBOg+P1YOANaCPBIJKG243StCZpTu2XCL1CtXL0W5zkVHc9xePqZedyCZM92VfEyyNtrbGUlj++VDKIlDcWdbmNs3D39O+Il4eVt5lmtfMaio6Ve3lzlm1Zqz/7qqRKb67uKP1PpGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhQav2p7b1d58O2LTyzyx8PjFdHQf4g02g6mqwe1aGo=;
 b=po4kwGkzaCB9W83KjDReRZLC85aon0oC4AH9wOjPv6M67IL1teB4IwF/wbe+22BNNYdVacyZB9D9ALQujQucCIEDh4ylqLL79CxHdI4oeWHTdyVofJxdMBkM8MSzzL2ljQxALRdw02YVIclyVynMv/czhbnvPAjPjgff/IA0h1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB11751.jpnprd01.prod.outlook.com (2603:1096:400:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 08:23:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 08:23:47 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
Date: Wed, 31 Dec 2025 09:23:01 +0100
Message-ID: <bccb1a911e76d771dc457012bcc1b943a8c1cdf5.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB11751:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d314b2-bb14-4add-78c4-08de4845eb58
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+O+7EYMatUL5i3azeM594+w9OyTYw+uaxwwYTyZztoF2kyzah4NLs2hirUvM?=
 =?us-ascii?Q?WlYTRI3ftYO3bH8/CqQJIbsxk6rtsGsyLPdz8HARTP2OpKtiZcpzSgnElGeW?=
 =?us-ascii?Q?T9OH+Vgigxoz7w4ikhcBCkM83MjVGEx10Bv1YKW0sa87pvEbR6Z6nH5Nucc1?=
 =?us-ascii?Q?6nDp/F3D2IjRqzSntePFc0aS75bynq5NyrtTHVLnn9jF7ljJlqvCvnEVCOUU?=
 =?us-ascii?Q?9kM7gW3IB0Pp0y3PED8c7MCXBO5lsox9nrXUpwV0O9JPV8SbOOQzJcFYbhth?=
 =?us-ascii?Q?8EaAAgh9mv3JnrGU6568RSvY4yn/GUtcWpmtu9RwFj8+fCx/e5eVjtCd/ysa?=
 =?us-ascii?Q?Wtz1Mx6AmlfTTUak+Ht5gPDO5g+mciFv3G0Lfbzmujm/wAZgqkjXRF5pEmA+?=
 =?us-ascii?Q?EHNoO83NW9Xaexb6QlUHO8tFXp4URJQREWIeUkhYypzZW09tKj1YVb9/uY2c?=
 =?us-ascii?Q?p/+QTN891MefTLvYQ5vwjzR0LXuDAhkRRciMqD2sd55MT+Dwcwcwq7PU1qev?=
 =?us-ascii?Q?i4k0gzfURRO5SDRpT3FjggifG87fZJ++c5piNsyrXdjH14GiEgrO+hUmQx+a?=
 =?us-ascii?Q?akQlUdhsgTWuAZvZtZTNgeD1ERdwch9AkFBoWiBZC5sDibKzKwZs3fwgAogD?=
 =?us-ascii?Q?KAMYE64JBBsPh2OaM3jzcIFlUR4gpPkxVsSCQz4mlYFbE+GWO9SzaI3ddttU?=
 =?us-ascii?Q?Jpt8h4+m5OsEPGP2EjS5izab6ySzUHH3XIhYQPKT+spF+e9CV1uOpzoRSIST?=
 =?us-ascii?Q?tXOrSiWKw/zlw7TakMyKLKq5wb4coxHwSePq6Z3cbiE0fsLYkE5ccfrMzyNy?=
 =?us-ascii?Q?o2R1w7tE2+pfje9CNH4A8fX/w73v4I0kjZKvV3vOXcBG91e7cBmeczs08+vA?=
 =?us-ascii?Q?X2itRNrCEWanW7GfzHhCAA4SXqMqNHUBk+pOAs6zrmkkrBrnXzAXmBkAHQne?=
 =?us-ascii?Q?4ywpliFyNzZDG1MfPVWwYz3BQC8SAJoVjbGk8fF3QW6pGw4UzN1t93av3tJ9?=
 =?us-ascii?Q?t6e+Leqrn1OCk/FzeXujL5YpgWQrXCCkayBC2QcL4g/yCxIqeqWfOuN7Lndc?=
 =?us-ascii?Q?a/GlEYOa1qSSN3fDueBYoue1LRmF1ievewX1dXg4qLjxNs0ZaKl1ovkeqCEI?=
 =?us-ascii?Q?HBkxx2hOSgy8fPE37qwjfOSYv9csp6ipiZTWsxYlOCdEK9WasUj237E0F7Yc?=
 =?us-ascii?Q?U9hUmGPfkqUPNQjgBktncHIfIqHgusvj2JuPPxE8+uXpMuaQ/c6nTz/+SaqT?=
 =?us-ascii?Q?QG+Gi5ao/LIaYHzm775gg+jsTcPQf8/JjyRrmV2uysxfXxcHYZHmpvH5MzVx?=
 =?us-ascii?Q?nsjqi264WxDG7BIDjGwueHjSQuLPBeD65abs1UgVI+K+8+k+bCezw87ei3nI?=
 =?us-ascii?Q?bLxKCWlJ+XgfjxgOOzViXqgVhmi+lFvzbQlF8plb8/QkWeEFrR470Z3QmaUJ?=
 =?us-ascii?Q?zQlj7nHnh1HefU/Cnz1uXea0DYqlCQ2XirTAFsnQ3JjX/3XHREyTg8imG/RV?=
 =?us-ascii?Q?nvav5U3lSEE/XCe9aomZ6qPtDFTmyROPUSzx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IJUr+NP+0bTA89L8rxA087yPVtmPF7KEEXlSVgRRy1w2Zjw94qayXdQIjfR/?=
 =?us-ascii?Q?XGrT0e2qoRFacHQPAxYaBgxst2Ch72NSgb3LNX/7D3/V2ZKRRKJ0xA9d3YBP?=
 =?us-ascii?Q?hTGqcKegONxK/bHEJMT44I2cnfcTglI3hPC1gDtuEkwkoxdfNMuDUxLSOpeD?=
 =?us-ascii?Q?hApRQqotQ9NJKJcjItRIzffHtote81lc4E7F7yyhlpi5meVGpsc2n37HDMZh?=
 =?us-ascii?Q?oaAP/MXnvY10VK9YsQCM3QTUfeX2VUvGs8/b/JT3PJPgMqK3CkqP4GXcATDG?=
 =?us-ascii?Q?3MHZOdQkPT+HFuNYUFIQEA7cpK+RF5WsTbiyv9J6RpE4HoVdOadNbP6SxoJF?=
 =?us-ascii?Q?JEiTDnD4/+dPr2iotFmsAJtSi6qqzZt+7eC0EE7Jx7MbhTpmaLh+0dXJHuNp?=
 =?us-ascii?Q?TODiT1Oe/jBF8VJ5iTKhvxDXrzNZpo8ERntxXHkDGY4Mm4NI/zdYg9Hv2FvU?=
 =?us-ascii?Q?TVRW41pxbZ5hosdbYPfBzElVxdcOfEPbwIpZL8wBuFMIAF21LNMRWiVcEMhX?=
 =?us-ascii?Q?KXY2k8xPMSeBNIaYgvgkdjh6AlDS19et1aAaIx9gOwQ5sdCs70apegSy5KDM?=
 =?us-ascii?Q?dOwV2hhRSmIa47r5F1dqZRep8Q8ZIkumuUjSZsX3b+Mha8URZku34Q4n2vN4?=
 =?us-ascii?Q?dVnsBs3mpDUx/530/3EaoZPvhLDB9RmPY4y8DY+1pk6jbRIU0FAlmQ6hZgQ/?=
 =?us-ascii?Q?cqFVuTeE+YpHJtPomTrHp3cQVL934j05m8uKkU5AzLesRmB3Es+mKyKipaZQ?=
 =?us-ascii?Q?CMxsSLFGzij463a2WE8Tpmw5cMGOhFAGBIQBOFpmng+4POJhFn6/nkA+eDqA?=
 =?us-ascii?Q?YyiARigBgPLGhG7BrBWxvSYeD4Jlfn+gfCMZ/Oj3z7y8i/2PhwmzZLdLyKfj?=
 =?us-ascii?Q?QcDD7xXL1Xmj/FZFQd2s5Vj11ow6X5gT/VZp6SIfMnzL5+5nHeumJYsbpanY?=
 =?us-ascii?Q?mXt9XFoxwujI50+HsgO5AZbLAYa59yiGcppzHWyO39UcHWoJSr371FshrGYa?=
 =?us-ascii?Q?bibp21RMY/R1rI1VG2t42Q9/Yzo3xLEs1xg1bVbBelOi2pIhwARAJ0nTCTGN?=
 =?us-ascii?Q?W9//WyXenDbb4Vk9kI+vXj+vR7yrD35ie+aRm8LXcbyupMVnRApYpytYQ4gp?=
 =?us-ascii?Q?hE2/cbJgxCp+09Ic/XdFJAgWav9KhPMmtoqAiNQGan29Q7ZvZGVlsDajN+m+?=
 =?us-ascii?Q?H23T5G7qI5iLQTFfr06hu/HmE6U59qI3BKxN0fETPsh6eGugJbfxBv28o3gR?=
 =?us-ascii?Q?cWRnqk693EFlEeW4bfj8tVTCy0677bT+NtooMPQc5eb6bSrPv4/5YQW6+ilb?=
 =?us-ascii?Q?qqIVHvWeswwfxZivyIH9tQ/+RvmpQlV4MnSeu+qFGqxtCHKgzxRUfWshssD4?=
 =?us-ascii?Q?dJi+zsANv2rhSkxewZn0KPqCmv4nKqvrxpOAauB/iJxRjzUwzPU/sg0YYelm?=
 =?us-ascii?Q?I4kOxzFqN2heo4KWbhRe+1rvEFg6OZqU8FYa6gle85ZuKobsKRh5ZD1YgjjD?=
 =?us-ascii?Q?ExmwFnMirEFWiwFsLJ7Bujgl45Tyz1A/d7SaOUhNmdla+ZK/2DuJ5wtuj3DE?=
 =?us-ascii?Q?87Q9KEgEZ4ptFAmV50lxd4d5IlrZGzW8nPkcTVVnMYJklN80D/aohrtwWA7i?=
 =?us-ascii?Q?FaZRgQJ7kw5nTBfnyTvUvzstQDANUOuYIxCyhKd8DZVEYB1fj4q/KGhhC6wc?=
 =?us-ascii?Q?tIY4DjWiCEoos5gnbhIbKhWSxUo/Dse17T4zpGfsph633WxD7vyxTcxejzUY?=
 =?us-ascii?Q?nyr+XEGMKO+XeCSCf7VASsbEtaUydr6Vu4uLkhuHhrkindmbDlcU?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d314b2-bb14-4add-78c4-08de4845eb58
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 08:23:47.4566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZOZv7g9SFYxEX192askkEJQPKRWDp8FF8R70pwAJ5pY/lAsQY4RsLccKSgq8hiC+3fLCwv3Spl6ANk6pJTs0onmnfbZT0dSDQVAaz+atbHmyPchvxLaEe00PlRTXcN+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11751

The Renesas I3C controller does not retain its register state across system
suspend, requiring the driver to explicitly save and restore hardware
configuration.

Add suspend and resume NOIRQ callbacks to handle system sleep transitions.

During suspend, save the Device Address Table (DAT) entries, assert reset
lines, and disable all related clocks to allow the controller to enter a
low-power state.

On resume, re-enable clocks and reset lines in the proper order. Restore
the REFCKCTL register, master dynamic address, and all DAT entries, then
reinitialize the controller.

Store the REFCLK divider value, and the master dynamic address to restore
timing and addressing configuration after resume.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Fixed error path into renesas_i3c_resume_noirq() and
   renesas_i3c_suspend_noirq() function.
 - Moved up one line sizeof(u32) * i3c->maxdevs into devm_kzalloc() call.

v1->v2:
 - Updated commit as v1 has been split into smaller patches.
 - Use clock bulk API into renesas_i3c_suspend_noirq() and
   renesas_i3c_resume_noirq().

 drivers/i3c/master/renesas-i3c.c | 89 ++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index b065b8d4b138..e33ff16efdb3 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -256,16 +256,19 @@ struct renesas_i3c {
 	enum i3c_internal_state internal_state;
 	u16 maxdevs;
 	u32 free_pos;
+	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
 	unsigned long rate;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
+	u32 *DATBASn;
 	struct clk_bulk_data *clks;
 	u8 num_clks;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
+	u8 refclk_div;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -609,6 +612,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 					   EXTBR_EBRHP(pp_high_ticks));
 
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
+	i3c->refclk_div = cks;
 
 	/* I3C hw init*/
 	renesas_i3c_hw_init(i3c);
@@ -617,6 +621,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	if (ret < 0)
 		return ret;
 
+	i3c->dyn_addr = ret;
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
 
 	memset(&info, 0, sizeof(info));
@@ -1362,6 +1367,12 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
 	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
 
+	/* Allocate dynamic Device Address Table backup. */
+	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
+				    GFP_KERNEL);
+	if (!i3c->DATBASn)
+		return -ENOMEM;
+
 	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
 }
 
@@ -1372,6 +1383,83 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 	i3c_master_unregister(&i3c->base);
 }
 
+static int renesas_i3c_suspend_noirq(struct device *dev)
+{
+	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	int i, ret;
+
+	i2c_mark_adapter_suspended(&i3c->base.i2c);
+
+	/* Store Device Address Table values. */
+	for (i = 0; i < i3c->maxdevs; i++)
+		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
+
+	ret = reset_control_assert(i3c->presetn);
+	if (ret)
+		goto err_mark_resumed;
+
+	ret = reset_control_assert(i3c->tresetn);
+	if (ret)
+		goto err_presetn;
+
+	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
+
+	return 0;
+
+err_presetn:
+	reset_control_deassert(i3c->presetn);
+err_mark_resumed:
+	i2c_mark_adapter_resumed(&i3c->base.i2c);
+
+	return ret;
+}
+
+static int renesas_i3c_resume_noirq(struct device *dev)
+{
+	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	int i, ret;
+
+	ret = reset_control_deassert(i3c->presetn);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(i3c->tresetn);
+	if (ret)
+		goto err_presetn;
+
+	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
+	if (ret)
+		goto err_tresetn;
+
+	/* Re-store I3C registers value. */
+	renesas_writel(i3c->regs, REFCKCTL,
+		       REFCKCTL_IREFCKS(i3c->refclk_div));
+	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
+		       MSDVAD_MDYAD(i3c->dyn_addr));
+
+	/* Restore Device Address Table values. */
+	for (i = 0; i < i3c->maxdevs; i++)
+		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
+
+	/* I3C hw init. */
+	renesas_i3c_hw_init(i3c);
+
+	i2c_mark_adapter_resumed(&i3c->base.i2c);
+
+	return 0;
+
+err_tresetn:
+	reset_control_assert(i3c->tresetn);
+err_presetn:
+	reset_control_assert(i3c->presetn);
+	return ret;
+}
+
+static const struct dev_pm_ops renesas_i3c_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
+				  renesas_i3c_resume_noirq)
+};
+
 static const struct of_device_id renesas_i3c_of_ids[] = {
 	{ .compatible = "renesas,r9a08g045-i3c" },
 	{ .compatible = "renesas,r9a09g047-i3c" },
@@ -1385,6 +1473,7 @@ static struct platform_driver renesas_i3c = {
 	.driver = {
 		.name = "renesas-i3c",
 		.of_match_table = renesas_i3c_of_ids,
+		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
 	},
 };
 module_platform_driver(renesas_i3c);
-- 
2.43.0


