Return-Path: <linux-renesas-soc+bounces-27619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPJWLvSQe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:55:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FABB27F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F31C303AF3E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 16:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3513451AE;
	Thu, 29 Jan 2026 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nfhEcxYs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1A833ADAF;
	Thu, 29 Jan 2026 16:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705609; cv=fail; b=evZui8RAyU3Ls86YNmIy5sQ62wks+KHItMLbub7tx6ItemkpP7TSy6/BLn5zr5eBWCZe9aSNNCkD2sVuf22Ylzco2y7Ouw96fZVMfblGWSt6fSW9ECANmrAb3yPfIarYwcjuGlblu5uROtCTvb3OhzyIruBPjeQmPW4NxbbHOIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705609; c=relaxed/simple;
	bh=uaWEqxAK4IV8WNfvvDrPwWOs3AAECSzUKT+XwfMwbKM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hD8XLv3q0gJw+hYz6qAY3A5V+ONd8hEW1SnUlE7V04Rm3P+9m2J9QpVOMtOx3Kt324AJUkKGsV89D0g9dc0Sc6bh0Amh1T9wWiURTtvrXzkA6KUgZvNA9+TiUylscsZejra4GYtqFjgk8JNKOY27MSmiP2TBE4l9OAuN5P9PNEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nfhEcxYs; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQWd21p6mM9cer8RvmxNRGW08Vdw0M0NOeOgScEiqDHVrcUM+TPDIwVtStA63U09F71SsFPYzcUacm5FLq06DupnXWE09vqeX8lpyjXgge5Tcu7SsYncmfYpn+Fzhe2SzxFmPZUyJ+4xHJxHJQKoMX74LG48HdHG2x/QjSHmxs90SZQAJSfhIB0hFfwt3WqX+svhmizf1CGwUrIwFYs82LbPzeK3ULtLGM9CNPX6IpB5DdGRL/rhrnsq5tA3wVZxLKPRkfxPwZCv+NWfsHZBBZJ4n79SHlzoqewH0QvDSba6bWDYz/zcMb+mjbBbF9/sPtbjWOpS2OqPYAcI5qCUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxQwJGeMl988DDQtMF0JixsZinG2F319X6uKOyrExjU=;
 b=Tup0/gi8ThQa7jmcAr0vEsXbv/buVFD6e3J5wslAn4zkP/8/4cUqh6v4h/vc9AL/fgm1anXOQKLrg8uF1KFFJjmy02UZCuJO+B4v8/TKp4bZZln9OPT0s8YSn71KCJQkt5IXUgBwLP4wem8pEtq9VH3FzYjirsBdqFYhP66cA2G0TEaViop41lQXdTyCJsd/zjAYopiOjVPMMpLuBAiNs51cW11IQN7pe8exlRF/nX8tfXZZwkyhQO2oG6pdoFo6Gmk6oQegDeUY2BMkmMp0ZMcRP3GswVXBAaGcsgz3pIEj7qAxWV5WgXtFGA4c2uhWU1Pv+bJWRaZWw2kE+1UYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxQwJGeMl988DDQtMF0JixsZinG2F319X6uKOyrExjU=;
 b=nfhEcxYstpZPETGqqWbCUwM22l8TwQ4VvWr0gF2z1PKEDPH+VEhUiUtg8ElI8Xr08SlOTJ2qJSGxVJsDAIRAK9L3LLjFF/Wuwq6MEFSeRN28zxX7iKiPxcJam8LTVA5H4rBrZqkqr6jK2tA0Wll9W4OleBq/XgQfEXoKV/qB55Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13517.jpnprd01.prod.outlook.com (2603:1096:604:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:53:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 16:53:25 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/4] Add USB2.0 support for RZ/G3E
Date: Thu, 29 Jan 2026 17:52:54 +0100
Message-ID: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13517:EE_
X-MS-Office365-Filtering-Correlation-Id: 566f5fde-cfb7-431e-729a-08de5f56eb26
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3ZybFdhya/89Laf4e+WUvA5VVf5YPY/UworKD49r6o/xV3PgZnKFLCevtCHf?=
 =?us-ascii?Q?t+pHwp0ofgmqz/d551MM9/+UIyS1lTaKigO/INm9q+Hf7o039ESi7h+BA3Uf?=
 =?us-ascii?Q?XUZ2tobe901To/mg9E0qOxdnCq4s39HWGP6ghfIkWxxjGmeETr57wkzwvoxx?=
 =?us-ascii?Q?N8QRlaI12MYDLk9IE+neXb1qqXsigyLU1g7ODUZ1Zmy26NecmxTJqy8P6mTy?=
 =?us-ascii?Q?dA4fed3lAj2/9drZkEupoKSyclp0lb3Yn2sUc25IAPbbG+tMAQ81A58Av8Cy?=
 =?us-ascii?Q?uyNU8quNo1wB67dUHdihf0PkzAT5u8vjknh7rIxdEof9xlEJ5epp75wBIYK8?=
 =?us-ascii?Q?WnuG7AEOu7HBRQYZObpQGU/APJ7VnI/z7/EzMdZq97pJkUhnobtlj7ul2QmN?=
 =?us-ascii?Q?nThCh6nArRNewgT+xZhYesicP/471GKMGXH9s2rqNN/NCu90Htm5KntPPsoV?=
 =?us-ascii?Q?xMUEmoyoi1ig2nX1jPQmu3levOI5bUoGsHdDfM9X12vJ+vtk6lp3fcOPJkjS?=
 =?us-ascii?Q?wL2hPiZcemQKeetYZnnhflZqlHZVwBZ6JUCOsC/MVHuEUPeEEHxhGeH0Ug30?=
 =?us-ascii?Q?rAYF3ho92dc6egWYqu85/rVwtBAqvODZ8kZf4TDEQvrIsVK0MV9EBaHroqZX?=
 =?us-ascii?Q?Ts7uIoYlFhwshQirh/bOvTFKB4J/jex0eFkVnLuMvO+VCnQSp+DrBLAwx870?=
 =?us-ascii?Q?iE5kDwDZMXiEXDBZ2mlDGyfFMkNUer4FdkY5tBH6YjHWMo4GaTVZWB96kfIZ?=
 =?us-ascii?Q?198Rh5s+1vslxA4kIQeCNaycuwO/vAx42l1UDXnoMEcb/CkN0TDKQdFsiOmq?=
 =?us-ascii?Q?RkkQIcbrrd9VLQD1pY151mGnbiOvFl6JyRfrb6GGRU9aU1RB6e00RnKmySwP?=
 =?us-ascii?Q?P31jszbpNsojhywY3IKsiAKOCnt2K0kK8qtxsqAZPpvDVBKJ0i3Q4TEkIk6P?=
 =?us-ascii?Q?FQSDxcKphhmvTAwGCRYtwk3HdNcIb3GL+T/uGVu7qb3DuhqpTydCYPo5qwvS?=
 =?us-ascii?Q?t9kZLAw7rJo8dwvXrGHA0TUysfxEFrBMyqCk2Lx0adOc/9vfYv7S9rKEK4jl?=
 =?us-ascii?Q?klkRWtiyPAtL14KfKRQngg5qF8YU2kn0kPlZHFvDcUMtHFiWw6OOGR5HOH63?=
 =?us-ascii?Q?PZgO2ruQ7d3lLSTl8+YMZYSvzGgPV9ywak3vUAI7QCmNmcK2LAAphm/3opjw?=
 =?us-ascii?Q?ac1Xctzk2lLGxD6mAusDOCacYfvYKoul4Pns8rH3fGUx6GPw3sPGwcYqHRVb?=
 =?us-ascii?Q?wyRU8Yuw5wFM2/L5TxKSuc3b9pEIqcz8OI0aNMpO/cSNBhG3l6HeVt75JmcD?=
 =?us-ascii?Q?BkrQ7So8hl7paBfMOwhobdz+XD4PfbD9AvO/tubnvkzI+tjsJ5KK6SRG7fpd?=
 =?us-ascii?Q?3b9q1djffpI8hqYl/8zML6YJ/+KqYhJCwBs/Rvah29icxIPVfkrBosWhDqFa?=
 =?us-ascii?Q?rZqB47DuaIKMgp6Hs7HS+nByjOw8fYeZBVWHAoC1ibM47Rv7rLQlLgX3p1xp?=
 =?us-ascii?Q?7B7hBZ0/4lyIEpKujHlNrsKx+zunr3rTNkVC14zAitZxFWg6Q2Mg3kWwElNf?=
 =?us-ascii?Q?A4sok3A+lvvAUa/LNIqzenpFdMmp9bxlb8K2dBh+2tNpBcYq2BMhElufXfFk?=
 =?us-ascii?Q?+CFQMzG8BbLthlhu1X5BhiU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qj77x/T4I3D+CK6VzaloWjayz6jOcSP8DjAqko7UF/nhnHRFnt5xN4UVjhEd?=
 =?us-ascii?Q?E3J8twzibb9H67nL7l6medcd4e61wqHZh8xaFxOqUY2GJHPOceVkS11yTKTH?=
 =?us-ascii?Q?CLJ8wLg4ZUzYDTGZ/gGbJFvPTIdUSSTdFEaqVnYkgh5jcEDCP+F787mbg3dP?=
 =?us-ascii?Q?7qgaiWvRILeSbeNekHkhxE7OR8juC19VHhEDJmqILuHKHkB7oC5Bk/NzxZ0t?=
 =?us-ascii?Q?UDsQSu3KKem/JLjrmdnIiHfU4Cm5Vg0a5sjuapMw8SWNmhbGsK44ssBDXZu3?=
 =?us-ascii?Q?s94NKEIwfLHUJje7Nc/xwluv47OaBu+XaLncLeP3xoNLxznzptLAWEhEBcjC?=
 =?us-ascii?Q?wRn5x/3Sv1V1sZwgOfFyF0cevRCEQnOOQkb4eV6gumNnuKHD9yc2kDGRYOmR?=
 =?us-ascii?Q?2KkwXeEqICrHfhGxgSWPa4VVhqKUlUNw0/a3c4feoBB4CFnjOBBMy/qF0pCO?=
 =?us-ascii?Q?XT+rhmyZ3knyXZvhuvIzDxztvHlEnumtuZohBU1Plz+/qPai9odLDi41ZizB?=
 =?us-ascii?Q?RUmFITEPyLcw/rI4YvxhS2zJModAd+BH+XWvEVWMrIfAMwRZAnFHiOo9BpIp?=
 =?us-ascii?Q?wwyQLm3x4LkOgEeiSUcK/hk6Zq9BhRr/gyoXXZRtcY+hmPrZcz1IJrdqHA9a?=
 =?us-ascii?Q?p0PzfoPNBBj9tVKYooqLRsWpHYkP9FKDpsgP0ae8X2qey2ghhJ25f3UwMVk/?=
 =?us-ascii?Q?tceebH37NzFJNpVUkS1BNGuLotAtp7xSKXEOvLleB/+Funs0RPb8VjLYzquD?=
 =?us-ascii?Q?tZk7tZf5wgZQl9aUmSn4GNxrPINzSOHSBKhEelqK6rW7ykcUC9l4P5qxi4yY?=
 =?us-ascii?Q?e7pAkvuH2Gdj8Zxq9HoeARFwQ8WNXYQ5j4inZLhKhQHMJ8F4kwzuH1eRXSne?=
 =?us-ascii?Q?xL6Y5h/kHZD72t2HhBofJiOsYFrvNEs8cTxt6J5K+fgNr/AMBVQ12VJKGRef?=
 =?us-ascii?Q?hWbz9k1deXiZ5MganZslU0seQjKWQ/dMQCm6Ls7EEpoizUYbJBhH2TfcHN+g?=
 =?us-ascii?Q?u40LzEzwfGHhDOzRXg+MvLKhJQ9+4/Qt7hrsHogQK39CLL0UhBQ71AM+WnAX?=
 =?us-ascii?Q?tUW1w3jMCaz8EXX0/xJ8SkzsTYCdgtJEig8JwedtaCRQtSdSET+Dnq7SA30F?=
 =?us-ascii?Q?Eq9EqJEyMB7PttuhK/BNmnUtmM3CKueNI0/vEh0kL4+fy3sMMl/u9dllz5xI?=
 =?us-ascii?Q?HSXDk9Ig0MRT9kP+RwpeItWlwcbhZV5S70p0awPskyxzsj2NozhyBFaKwl1E?=
 =?us-ascii?Q?v5h3FZ8gleYYjcRUK0Ib/ErF7vNZChxG6y+XFM/yg5g1+2S7pHRWcqX8Neza?=
 =?us-ascii?Q?BHhDzFU4/Qc9SzrSe0b2JFwzVvNRHE1q5WlXovW+IjCV8hZqbE1P2OWDoqrY?=
 =?us-ascii?Q?NppEWsKVdYRMRzAnMqCbt1vu7KIpvwTXj86yqkrKBSXOmSBXKw0KiOZK9bMN?=
 =?us-ascii?Q?WgcRA5svusC1hus8K+vFWboiDdImFFOj5Mm5IM/Sl5zgpg1D5R+iXZbMRCud?=
 =?us-ascii?Q?o6e1HTTH7xM4Iqfs/0tMvy1+ZFGMnqVtRQhOFcImfGwnQc/GdIP4/XFmCb9c?=
 =?us-ascii?Q?AB807NshYcIv2uzxIpVNiCIcIxdfbOB5JY8SLqcxJW/1dGY+nHrN81CaIjiq?=
 =?us-ascii?Q?Qrh2hJbtfgIqb/qDiR5jFXwwixP5X5ChM7AcWWcVi7oYOp2KCtpIXUCr+RPo?=
 =?us-ascii?Q?sNVl8TPKDTHJSpp2IEllWkCczWkcvPAgp+QnPzQijbDv2FpDvnUQS19W7iWJ?=
 =?us-ascii?Q?EAH/kw7kIO+EO0EOmDA3Qj0y8so+2PFD2XlVDJkQLbYfxtSSDEsi?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566f5fde-cfb7-431e-729a-08de5f56eb26
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:53:25.0977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlKJ/p9Lr8zvv2ftntl67yCCgWmdrJHS9wWYNJCwhMWo0bcMjUpgn96Px0HYZIS1AZUciSbcJ/w29QqJOdmSl8F1Dr5xu1rtyQkoTgnvVto7CalxcFhzsG1RZeVJfO9m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27619-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,pengutronix.de,kernel.org,glider.be,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 19FABB27F1
X-Rspamd-Action: no action

Dear All,

This series adds support for controlling USB2.0 VBUS source selection on
platforms using the RZ/V2H SoC using the VBUS mux controller at reset level.

Splitting the series [0] into per subsystem series for easy merging.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1035721&archive=both

Thanks & Regards,
Tommaso

v6->v7:
 - Rebased on top of next-20260128
 - Splitted series into per subsystem series, no changes.

v5->v6:
 - Rebased on top of next-20251219
 - Re-arranged series order per subsystem patches.
 - Patch: 3/14: Collected tag.
 - Patch: 4/14: Fixed commit message.
 - Split from dts patches will send separate series.
 - Added merge strategy in cover letter.

v4->v5:
 - Rebased on top of next-20251127
 - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
 - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
   Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
   Updated commit msg.
 - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
   Updated commit message.
 - Patch 11/22: Fixed if statement for mux_state error check.

v3->v4:
 - Rebased on top of next-20251121
 - Added patch 01/22 to remove nodename pattern from mux-controller schema.
 - Switch back to v2 implementation for mux controller in patches
   5/22, 15/22, 16/22, 21/22.
 - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
 - Removed mux_chip->dev.of_node not needed in patch 06/22.
 - Collected CDooley tag in patch 09/22.
 - Added missing select MULTIPLEXER into Kconfig in patch 11/22.

v2->v3:
 - Rebased on top of next-20251110 + [1] + [2]
 - Add missing Cc: stable@vger.kernel.org in patch 03/21
 - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
   Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().
 - Patch 04/21: Manipulate mux-controller as an internal node.
   Improved commit body.
 - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
   then update the aux driver accordingly.
 - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
 - Patch 08/21: Improved commit body and mux-states description.
 - Patch 14/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 15/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 20/21: Manipulate the mux controller as an internal node.

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (4):
  dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells'
    property
  dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY
    reset
  reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device
    lifetime
  reset: rzv2h-usb2phy: Add support for VBUS mux controller registration

 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   9 +-
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c           | 108 ++++++++++--------
 3 files changed, 71 insertions(+), 47 deletions(-)

-- 
2.43.0


