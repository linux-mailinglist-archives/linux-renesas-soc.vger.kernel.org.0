Return-Path: <linux-renesas-soc+bounces-28280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIrGC06WlGneFgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:24:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D6414E201
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DEE7B300693A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 16:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DD836E48E;
	Tue, 17 Feb 2026 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pUtO5hcV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03AD36CE16;
	Tue, 17 Feb 2026 16:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345479; cv=fail; b=LP/PQc4cY57HC+C5GQFnhc2EZUeMg3SDLZzXR+sZUlOBWyukEkMvegXxTvVmJ5bNp6tVVUIcuW28R5tos+MtMdRuOciGaz+8j0sifhAkIyQfywAstFekilAX7T06+VQg4ygtAQpTTQ/O8/VSI46Ffw13OmS0NPEQ64sKrinjdys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345479; c=relaxed/simple;
	bh=jsajz5rEOsiLFrXZRVfUHnQakD7/prftFwgkMstyX08=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tZwGcQwET2U6uuAUn00ckvPpRGnPkk3yMkHGidYVWGZr0t57q5lM7AOHGaU9iXCD9Hp1aWZaYZeriV7PUK2uHj35zM8HGyBzq5LwxAIfev4vcULj1bkd0rbYaiBuw1walVwCST4nT5UqQC5alYvWUVD7b9JSOAt6GpFcpCBhdls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pUtO5hcV; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZQ/JTnLxr9jxwjHXZvS9owKhposdF5KvPkMVm8fNIqHLt7nVPVjJD/C7fdkVw2kATSCKq+x5CNx+ZvoP/6fFrWVFIrDcsIOueBWM1S4Fr7pI2yeUmJKmmqA5xhjSlUZn9hhVHmLVUNZ16XZangc48gDUsxlZWNv7BWYx0+2DumCmr5iQJBHJb3O5WGd6mLhZzocg4HRbys0dFvH+bZBAHz0KetGcrNiCNK8IfVP7Kauc7YN2UM1HGaEAVgmhm6ws4F3BCw91kmHMkpnzrkZOCTcoiAnbyAQM9h4FCa5Pk9NJxw6h8ijUGNtZHQj8wW2zu3mFYu2466bSlbAlS4vLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAMoNPyKtkVxNFq9LXfS42uTHY41bMovbqkfbTvG/Yg=;
 b=r9J7hs4I0Qr4+HpQ4waFIdt3Kf5+w1aaPdK9Nin5rhVammp4dnQdyiinA8pgJ3XpM2gRE2JsUdoTjYy0ISKlCr3DPQoYvWUf5ShHmE2z/htWwW2fG89S0pBfbboKBS+MmBSTw3XF38P52KGeav4PYB7PV8iTm1Ep5uoQA8VFecuAewHiMH5OJ4qPQqUjmY7OvcwmuGUnidi/7fOmw1XsNKG9hZDSLTc8zEGJDu8rcizhkXk94mZtDX578kR3kmXKIimtFukyNpq/8H0EoZzklhSIAuHSPP58hAN+XSdcIeq5qyS20Z7RV3AzAZPy/0dNtnuE63gnv/VTZKjnoVL8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAMoNPyKtkVxNFq9LXfS42uTHY41bMovbqkfbTvG/Yg=;
 b=pUtO5hcVDTMJZirJSezHHL8Whfe6Sy5WDc434zpw+F83Oovs3PUAlA+M6n2oEfjKxQkHAyYu7f/PkZGpo0eMAU7N9d9oXREmuiuaaMlv1imgK+EConm6ZN6n+HJ5CwoSTf/su29hwK5hsrcx76lNfuLFtEM1udKJw97kkEPBQSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB8581.jpnprd01.prod.outlook.com (2603:1096:400:154::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:24:33 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 16:24:33 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/5] Add RSPIs support for RZ/G3E SoC
Date: Tue, 17 Feb 2026 17:23:44 +0100
Message-ID: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0320.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: bb809614-05af-451a-4b9d-08de6e4108cc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+I1F+rPmyBPn3wU/iVO1m71FcNjsd3dln1m8Lrt5P041IpIXT5CVycKFkHlV?=
 =?us-ascii?Q?GAs046GIi78oZa2kKomyMG/nmrztFBqxGlf+oj036w4a/4TO0VvdmdtV+Hp8?=
 =?us-ascii?Q?vMQ5j7NT9pye2OzY+9wqqBRt2fCuPPMIi7NFvIWEqLIU9CyjjM9fu64FuN35?=
 =?us-ascii?Q?5FPJJbnpJtF6mKSFqHGjk11RPAe2dWFfU8kxiOxxh8TAjGP2ohIO9ot/oRZr?=
 =?us-ascii?Q?Av7EqnjKq9b4gaMZ5As0P7uwZXi5pCU54XjLGAHbFRLtJ8+Cq8rvX0nfefmA?=
 =?us-ascii?Q?9tXahv964FDNu8KPmBh2XuqZ9mvbtZ/jZdC0h9NIhzXI4BDvvvto1jU36PYb?=
 =?us-ascii?Q?MJP6vKgXxjBsaR7yCHO1LsC+5bHpzGBGzCUP2WyhxcMpaQrI50OzcijzSAgF?=
 =?us-ascii?Q?ZZZ2aINVg4C5rJzc6V+zPovdBh6K3qHPEv2UlbNcPPEt9GgO9/zkOsG23gOv?=
 =?us-ascii?Q?TjhmickyLlsXaY4nVXSFLH38Stot04HZOcVMATsEQCwRS/1H7bJK2H9MyYHj?=
 =?us-ascii?Q?Xy5zvFlpWcIQSvML96n1GQvnA22w7/gByh6swLh79DSB0uT4BfRmVsydQbTn?=
 =?us-ascii?Q?fGe0E36NP1pY4xkJh1JL6iLAYsndo53f6STnjJxRHeuNx6X8oFfKgHAypKcf?=
 =?us-ascii?Q?mLWl+MOnosvT4Ot8PvQsEuV+tDWFxTlkjjacnTk/TBrETK0iATht466+un3P?=
 =?us-ascii?Q?oGgh9N8oqfFcyXapT0RnYnYIb0gUBc/HF9EiAR8miQ7UH3M4gfAVaUg2mDu4?=
 =?us-ascii?Q?PH8Jv5zIcxNcfn4AaUNrzADe+fUTGIPpr4tjv8Qq4z7vwMhbHl8y/8QtsQUt?=
 =?us-ascii?Q?ujFLItjX29J4JCxwqUfH7UgowVGa1p/yk5GS5LSoLMaf+9RTCxKZRyZeGiYY?=
 =?us-ascii?Q?65XRUd1727eMExdaq0AKCQ5hf7m3fU0q1Tmy62ffCHmFjbkfiLp0abD46pZ7?=
 =?us-ascii?Q?flh2M0iHAONGP/Hn/jg8xokPaJL1EAG1ZbEfigoT4e5qdEOCaVQD8GfSB+AK?=
 =?us-ascii?Q?pha99deu+pWWO1zwU2gKS/SgmhPwr9yRvy1lGFU54XqIgv4fgyv4HrTsg5mV?=
 =?us-ascii?Q?fbQjwByc6uZ3Y2wbEzwKMlLTCdPOXWzIWo3dnyelii/H+8MfXa0s0nSTkpkQ?=
 =?us-ascii?Q?0HPUfHiIns3RiFQof3DGuaUKj5DL2PEubMtD1OT4Zs6Ctan7qkSSEfNpVFDQ?=
 =?us-ascii?Q?Bpe4SyenuvtgCgnReBOunPyPCl08dkA5f1Ikj1qlz8ZOCLyvssacqUjUjNqA?=
 =?us-ascii?Q?ANwNuX/H5DiRpqE7sQp40nFRlGxLi1+tDYqSJxP+kCnoxMfudhRVIGMvAjcF?=
 =?us-ascii?Q?hve7WXUC7KzkjHuT+WDoAhyP4Weoho4Siu+xADTZDUQDP4tIN0C8Z+M1OvOa?=
 =?us-ascii?Q?AjFCK3ZJu94CdOiUyf7He75rF9h8Szpw+gWlng7micsMN/H20YqnaY0Uf2F3?=
 =?us-ascii?Q?KFLTRRh5+w4ceAm9z2/VkNjucTSvvecgan5EmgUi0v9pjP9NlD27iKzFJNJT?=
 =?us-ascii?Q?slGGamWw5bo7oj4waUEeyXrPPP0Rzzcnqm7ifWgTnfiFC84FRuMMPd0ycoWR?=
 =?us-ascii?Q?UUcxa9YTzZheG4MWUBpLKgJMM2TF28g2fZb9zzB8v7G2r3UM1TSEYWOdMw5q?=
 =?us-ascii?Q?1JdX5vlGoNUVre3y1CSnbtk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?71oOODIncy1cCPRUzN822QvCfmn1C6nmSCqaeYH59Wc2DkG1Z6Vmvbq8nP1b?=
 =?us-ascii?Q?OXCCqvpRilGggChksNT2rkY+Xs+fAADPYfPSZqzNAg0k3ln3+mo188C9PiQM?=
 =?us-ascii?Q?msXnAXqFKQL28d2/jUG8njWTWBemUGywR0XxFkHVAB46UlSAsFpXdPEsAMwI?=
 =?us-ascii?Q?XVGNZ4DC665qays9ZaRpL4pmZv/r96aTGK553Ohp1RXdizsT5JszRqDYbEEU?=
 =?us-ascii?Q?LtawNkh2vKxJphab5ZY8Sw8qEz021Ly0ZaldP/5Q2J6B4dZs5GSkrxzuBFPv?=
 =?us-ascii?Q?4XnbUfOYNp4M/8Uk3lW4Y37h115hhOhgU3dYPRa5WG7ceqDPYV34sp/v9TgJ?=
 =?us-ascii?Q?c6/aTzX5gVUtGOlUVwq38By0QZ3cG5awvw3WwVqU0oLnT4k48Tw1AtcBNcBW?=
 =?us-ascii?Q?6+TzBVaNq2ebIQ8Uf5++VAFtKhohLLA53tyr2crVFlQY0KMwQHSNA7szktgR?=
 =?us-ascii?Q?XEU1abja2nNN/MYoF+btb93jnG04DzvP3Kd42sDiJ7V8vhsRN+UpLNq+Lkgz?=
 =?us-ascii?Q?l1r09Fkue2AEMjvtGHn+qwDeM7h/AwKUXhUWYZkCQcCKYopyVrVPiZt0r/Rc?=
 =?us-ascii?Q?auX7ZelGamnrU0M++Mb1NYQBx5VUiezaExYIq1KCS9n+T5HL9DQzMUgMzp4h?=
 =?us-ascii?Q?numQe1/SBgg/qUJrHS+5TPlAZsYI1jDZ5akyjuoNqZceP4ESyOqxiEs5PYBk?=
 =?us-ascii?Q?UffaGNeuASczyOOFuLNpmOTq88LiKiDwTLxMdvAygIgWLzBK23Ms1gq0l0Dy?=
 =?us-ascii?Q?uubjf06j17xUVMvLBWbVbOddMpvarx9uW+IaLrI4pYM5b14dCc/xpbKKsbqY?=
 =?us-ascii?Q?svOMJJvWhgqkPwEc3WrjtBRkpfeROYmA9k6aoWdm82Vum0FbzkAsddxrldoy?=
 =?us-ascii?Q?QOUJCd2PCf86xBpzQIX/cT7bvY5QCk9VEjxK2gCfbu6MvOnGhA9zPBbQJdgk?=
 =?us-ascii?Q?O4HMSl3wM5pqyjmbLub6OXpwCYx/MOo3hKyVfYOFFc3jYUZeZ7mEE9p5DuBa?=
 =?us-ascii?Q?5ziJ6wvOHy2RL5sBBlSL8Xppl9VtpNT0tI/uy7eNUoqZr3AuhlYtHEUF818v?=
 =?us-ascii?Q?b1Mffknbv/6MFAnibRdbhH47xkoE9N9JC7hlRKJaJI+SjeioMI8+l8BetWMt?=
 =?us-ascii?Q?iTbGR6vDYTLdIqzLrXFxgDgqEk7lyJkiBrimXRvVF4PeQ6YUbu1O4DFwUvsQ?=
 =?us-ascii?Q?F0MhbHLss1X0o0KypAqI2mSRKUnKRjDjd0dXUCj5JygVYztfx/AxAZEhtjmH?=
 =?us-ascii?Q?VwjOCmutDmJMInaS1xQY5f3niKB6ZpsyAzyOyd9FspJau6GU9DXxpMoZETSG?=
 =?us-ascii?Q?cWSfVHz7taPcvM4ZE/kZnL2I/vS1/aYIeUKPHC3XuHeVaQHJoDRH8VCjlOmd?=
 =?us-ascii?Q?1Sil42INAk1cK1v3vlcQ+gpizgNAmXANcxYC9TMvG2RNHcv+Ke2PZ/8U0nJC?=
 =?us-ascii?Q?ghLyyoMleBoshnoPZhl/S1gOk5zG3TgF31m8Uig5MU6INTWhm9W3/hhdMgGU?=
 =?us-ascii?Q?E+WkkVhaZib94hd+9oVMpzQ7TxpitJ29IG+0CANIwvQjU9KuV9fGIsjvAzQg?=
 =?us-ascii?Q?Ti3jJuYcTBtmYe+3effQRi+/iiKgdbDXWimEcI4CoEqsWIOXOqQWLhkOLZY5?=
 =?us-ascii?Q?RNdmbHx3ZlWeF09zdfa0bWFMzigf+RQ+QUYfoox5dfBgD/dXDH9vfj/aFvMA?=
 =?us-ascii?Q?+uK38VU6WVVNMB8GWphh/YJqwqf6D5K1GSDgp5/ptWOP9OE2+gbn81BhFCDD?=
 =?us-ascii?Q?6kc4F3HAAcqq5o/LifxpK5eos3bP8v8olDh/6/03h0xW+ihW/NWM?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb809614-05af-451a-4b9d-08de6e4108cc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:24:33.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwcVH0tS2CxTYi96iM4zAMwA+3XICfrUVAn46+AYKIG68M77YbzH95LE20mPMU75WnZ0zskHQ1sXC6NULdTNO47zqgwh93fiPu7/wV3BPJdUAoLxCWUvvgplrWx0MTds
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8581
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28280-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,baylibre.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 58D6414E201
X-Rspamd-Action: no action

Dear All,

This patch series adds RSPIs support for the Renesas
RZ/G3E (a.k.a R9A09G047) R9A09G047 SoC.

Series apply on top of [0].

[0] https://lore.kernel.org/all/20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com/

Kind Regards,
Tommaso

Tommaso Merciai (5):
  clk: renesas: r9a09g047: Add entries for the RSPIs
  spi: dt-bindings: renesas,rzv2h-rspi: Document dmas property
  spi: dt-bindings: renesas,rzv2h-rspi: Document RZ/G3E SoC support
  arm64: dts: renesas: r9a09g047: Add RSPI nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable RSPI0

 .../bindings/spi/renesas,rzv2h-rspi.yaml      |  7 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 84 +++++++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 16 ++++
 drivers/clk/renesas/r9a09g047-cpg.c           | 24 ++++++
 4 files changed, 130 insertions(+), 1 deletion(-)

-- 
2.43.0


