Return-Path: <linux-renesas-soc+bounces-10880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 836989E308D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 01:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF7E7166B83
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 00:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478FA2500D2;
	Wed,  4 Dec 2024 00:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dPQs2glQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B9E4C6E;
	Wed,  4 Dec 2024 00:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733273759; cv=fail; b=PDz/fYQdHMR775QnMmvVZNm2LULn25bQ8jKpRhv3P/5E7F+2cVQ5O9EXG4FqyLxx420f7sqWHD/SULwffbPA7oiOok4pKKnIZdf1jiIKrdpk+5REAJILT/DgbfwVFF9fB85Q+6sXwmEqJ9BvXgvbmLOS/1GRwUf6xXhcUqWQVTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733273759; c=relaxed/simple;
	bh=Ht7ZR8RJ5EeRAZ9y1Zq77xvA0RasMhUwj5Xi+fpH9ws=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ody5ldvlqkrX3sSW6IDVwSyeg43lH4Gxdu9xFKnhdLCxaO33zFNtQsKLVlwMcee+MLXY7xc4VAF9ZCK+6E17Wm251eir3jcBKcMhVLmm/XIZYZoOKqYx6yzzj/ax7WSgD3Wt6ICPTLFgf6l/T3FvwSvB7qeuT8hfTx+jc6F9Ing=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dPQs2glQ; arc=fail smtp.client-ip=40.107.74.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7gpxvuSyKY6YOuPEUJ5vWLITWxdVEY6jw7irzXydTOUhVpor081/jUHvwLJUlmAXucb2oWBfhs2I64a4F8x8cxQuUEZcohkjTEp1071eYwKU56MQgNw46RqY4TGFYN0kDROBobNGhOffdkv4CZgH6vdUkfIFsLd9vjZuGSjqy7jL/OqXCFZcO1LvPOmVoG1k6kXKeobRunKFh7TQDo7kAh+nekW8X9ORWMgyPC6ezwnbYKfQ+J76dqv4V7XYAGDhkZqBEiRlSnfG+ZBQHwkOTScvEYRhv7QUOAEUPzVMrIXkRl2UrM1TzS5zPmlaFXsHsTRJLasB3LW+SDxoAV2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHq/CueBPZwmW+MN6Uj7TVhc4dkCyWyMu8hFfcVqlW4=;
 b=sqx9OZYeUk2E+lgR+6hGWR129CTkZcGjkMfQwA7jlztALFC/e/EJteyeJsChokOS+m8jrPKCDzS18k81DVCBzZJb+//k9YcqVUijYjPOxb6l3ag98VBJ153s4m124m/28UcHRzsTouGBFX2+qtuVPrafexcwHYVAiD6qiBjicgTCy5lWcajDBW37FnlXCLOT3KTm8ISVhq7BhvbcWj8U/fDqh4OdrWtCv+9xG4Vku3MF4/5eeiiTzb46qyET7rO3tkZ7q/U4QW4X0zDa16bJDwjWdwF3UHEjwad4xW9ngubG2Kbz2X3uOpnQkxNst4qL3OnQdS4nq9/uu8Jjq5fc/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHq/CueBPZwmW+MN6Uj7TVhc4dkCyWyMu8hFfcVqlW4=;
 b=dPQs2glQKsBmD0Ghz8Uv6GOJAJY3wFI7IPLWRiKNshScWH/Gf9MeharIF4ji+uxj20rCMGyA18LXvzVWpQtrkdo0hjK8CXx5s/9EQcaiyyF8JfW05hgPLkopwnOXReCNlQhCTRV9CqnM6rG9mQHIOQLPNBwON9h2aDbkcZMSU5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6146.jpnprd01.prod.outlook.com
 (2603:1096:604:ca::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 00:55:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.008; Wed, 4 Dec 2024
 00:55:52 +0000
Message-ID: <87jzcg1d2f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: renesas: Add R8A779G3 White Hawk Single support
In-Reply-To: <cover.1733156661.git.geert+renesas@glider.be>
References: <cover.1733156661.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Dec 2024 00:55:52 +0000
X-ClientProxiedBy: TYCP286CA0331.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: 438a768b-6088-40f8-29eb-08dd13fe66f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xGt6orqhOLWW56ilMI1ygfPTWaNrORepKpjPmWhkUp2zXP8fIVCUNvqBCo7v?=
 =?us-ascii?Q?SXFiCFB4oZxnUrmABjVFEbJexCwPXWVbtmU4WY/TNZ1Gr7icuAoaiNADFH46?=
 =?us-ascii?Q?abiPHhFTPNh7MD00hiLxfGABUMOll4dk7VjJBjLt5nUexj9rqN7VflTyd2e6?=
 =?us-ascii?Q?D8fw/YjBW3FhkToWN+iR+QV6ifAx+Y/b7rXZjeTUmlMX9bdAG67i2WCnvEyg?=
 =?us-ascii?Q?IjdIDoP7u3tR1/OBSLGJsoWx6Tqqhfc1hcUD7KrVTJ0OS3piIqOSOQPAJlPe?=
 =?us-ascii?Q?OUONsGZcT/N0jZHs2c2PHfIZgFCaJWWoCHHUYA4zpl96MBwNxEw+nq6MvbdR?=
 =?us-ascii?Q?hLzmlUcorC/3E5+bvMNJWpjQCNipJGZARK0Q99pkkL0wcL3knTBPBWcQye6J?=
 =?us-ascii?Q?zF7YBfbYmhsDIFF9bz9AoodF3prLPm3FGs+nMrpN5MjEbo9lysK93DsVaTkP?=
 =?us-ascii?Q?AlSv/nMVot7C8W+eNVyqzcEKd1e+7qK9SH9p+3YqCaGiZDwGIfBGHfpCxVi5?=
 =?us-ascii?Q?BXBvVVgd4mLpm1kAOyLHuOtxv1EEloqXwPTG6Y+Ed3UkdhUBbmc7hgT38Y5A?=
 =?us-ascii?Q?Vkgppu8HU1fs8KzsHUFPkkfT08t76dROR0falilGlAlycFhGXzfcmL5eeDXf?=
 =?us-ascii?Q?aYNFr+BnntttQC4sKf+JAQg7X/KgFoKUC0ikrp8YBtqSQI0Uhc1dgGqGwQJr?=
 =?us-ascii?Q?YBmMzPlzqe6gHEx/ii6hAswYkG5XCm2BwLUItpMPsimnLDDfGxpVqwhdYhNC?=
 =?us-ascii?Q?HBEyYEc9ooyTsDNb86vkFZfXqtTM5w7CK8nfKpDeXhx7Jm7DnRjjbsKLB8ND?=
 =?us-ascii?Q?7FPLB12MMxrs+szKWhDzu/EM5r/cKrs8wt6JDk0OzLZ2wUCQ9HfzJvua3pEb?=
 =?us-ascii?Q?AKeUU0SjBoSPKBFUolhew1tY6cxs/l1e3scAtW+edBI8DUef/oy0qBNZJzK9?=
 =?us-ascii?Q?1FzWcBy3ZI4r6Sys3sclymhx1L29hXeLpjJr0ROU3IFQBPgbxsnzOAwJCFPZ?=
 =?us-ascii?Q?plz+5NHuAGWcyL93OovY9UF8QBKj9FAXI9QICY/QrFmRwzWNYla784DZZ1hI?=
 =?us-ascii?Q?ogfEA7+huPY6Y/C85DAGHau/Kj1mng/ubqRGJWC2yph1g9xe2c++ZI2J17na?=
 =?us-ascii?Q?mFTk2c3JSuWtucLDyptyYRTW5gz3HeB334NgutDU+eyL4xbVHa0qaROd1ExX?=
 =?us-ascii?Q?IYJlXDqcb5ZvbCxFwgmRL8aFgTmcDj5VzVggjVrFyEtNQE+yBDdk3D1wjyka?=
 =?us-ascii?Q?FWFNfnW86TpkU1N7byvnLT/W0PwMTUfnc0Mxe+OYSSzsGa4scbGyDYBeLxZc?=
 =?us-ascii?Q?LwK7Nl12eht5YyRXToBpWe0RBFaEr0FqT4F9ApF7iIZn8nJzL4QT/mjUTVN6?=
 =?us-ascii?Q?707Xir3GOT6JCr48MgmOECKC399VqEY1vXqdX8Yq4FJNdc1zAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GEUAOn2NFprBM6ZozkyrynymehoSaoYXlUvhlg/hh9Op3CyfVWaGPdaxrXvd?=
 =?us-ascii?Q?YJYXS3X+f24Au32vU2dNreBCrzKiwWGT4Lw2C1of01kj3ENIZwi0CGxMiQ7a?=
 =?us-ascii?Q?3cse/YuyftnE7Uhqhds4uZYE24VaK1Cij3zCNswwjUyFvGMYeOKwXTR1RqI3?=
 =?us-ascii?Q?pyA7dkPyIf2xuAhPW0Rq4MqhbrTSmy0X2hShAZFbNyigJv9/ik+Np+zGCIQc?=
 =?us-ascii?Q?OM3g4G4tBLbR6CyZKtJMDhxNp+JOW+aXehwFuS490z/dz+whxX0FPauDMuRv?=
 =?us-ascii?Q?3ZF5C53LOwcvmOPH+dqnN5IhO6WfZH/ZVHQ63eNdkgD+GnKJge/90A2YrN0L?=
 =?us-ascii?Q?SSkz678v8ku6EaQg3E8Uua1gViCIfh0f2p2iwawF4viFhkMn0WyND32zVsJH?=
 =?us-ascii?Q?//q0n4A2g8TAPDqHQGTa6dBZORO/kpYteJBlA/hGePIWU2g8uVZq2T4T0EWT?=
 =?us-ascii?Q?D32zypAPKibi9AgDR3EweCskiisonFy3JjG+ExCfVx4Tzx0JyKflVtEjdoiy?=
 =?us-ascii?Q?An1ChIo8zupp3l8f5kZASq1b+bvj5ZzKzXGzaY0S9BSgVU2MKRvftUdefbdL?=
 =?us-ascii?Q?VmbBrTBtEiXFhS8YgNX7CSZgi/SA/aBA58wxUDHFgmyahtDXT7OQCwuAct94?=
 =?us-ascii?Q?/CEhYoWT5KyJNCDGh/Or7DcXnb4B/fwrKthMxvmAcCj/dp1YlHZcqA5JwJOv?=
 =?us-ascii?Q?kBumyHPmN5NawoqCN5BCqgID6ptmXy2bGxWlmQ24gw8h0mIy4xZrOCLW3xxv?=
 =?us-ascii?Q?sQ3idlFSafwkn3larKlRH31ARf5JFd9EHez9GJ/iY0GjwfDiD9sDFO3jN2re?=
 =?us-ascii?Q?czaI6bbSei+/w5QNPsPV4S/zsb1k4g8yE8wBbV9HZo87fE1VEOlm498lWq8s?=
 =?us-ascii?Q?tkiAN76iHaEb6LNRKNJ1q+fF6OFKRW/OseUNuyhB5MXXLJ7Px+JqeZSRqQuk?=
 =?us-ascii?Q?906YHYkxe0JPwbjOa9gNe/itHH0s0dBplieI8h2wYc1J5AhBCkpa40m0bVM7?=
 =?us-ascii?Q?zRF0RswxzyNrFTsXpDtkZq7s3bjY1nS11rpmwUyhXZqgOPGHThUpWLABQOMF?=
 =?us-ascii?Q?jofx6pwqKH7ydne0Rm4BLzHxBxMZ6EVXkXBnyqAS8Z3CUaCHjUeiGcNAZ/hB?=
 =?us-ascii?Q?mKs30OvV1e/sD8w13ljKMH0S76ri3si29cZbr4retNoLLX10fH9U0WFat9Dc?=
 =?us-ascii?Q?6TacNtMWWGUZ8OwD1EMYWNZ0nrLJ1ArCZHojLnv6K1qWMDxJ62tuNhglTgO5?=
 =?us-ascii?Q?TgU39YKYr2byRjZzGGhLyvdAQ4quHCmPDcJ7dpYwPIyRVjGMlZPyqeY1g5wL?=
 =?us-ascii?Q?Sw4VLqLpc4fs6EpekbDtn6HZUE5WTTlr3WVT9e1wOxA41GQBpniKQknj/lf7?=
 =?us-ascii?Q?GJKJ4G4m82K16+zRddJwottbWmnb+YqwgzCP06HQW0UeDhze91yA4AksdZhm?=
 =?us-ascii?Q?jlqW9nSR47GrhPS++x918v13S7zOAKEsUsqgcEslbMleuDel0/Z7VHdc5JZT?=
 =?us-ascii?Q?FUmpS++v8R7PyNZdvsbaJVYQIm3ey5swht8XonkKiE0vz3br/RvahViPwzWH?=
 =?us-ascii?Q?1YyanG6CvIElCULvaVLN50OhDyS8kQBOzPZzBBFLk6m6pKe0QCehwkBF1RAf?=
 =?us-ascii?Q?O0YWZUhWfVCASByiANEFqkI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 438a768b-6088-40f8-29eb-08dd13fe66f4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 00:55:52.8028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OMKRuIgGzk0sHdt+WzX/x23x9HZZmTGOBgFmeCaRm5NnV98s7/aEIbRICKCAxj7YRhWROSJqOZGWWP/9019es7Tz4dGnxy5H9MFK3YS4PBOhQzvnDK6gV2tW4sk5DzR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6146


Hi Geert

> This patch series adds support for the Renesas R-Car V4H ES3.0 (R8A779G3)
> SoC on the Renesas White Hawk Single board.  R-Car V4H ES3.0 (R8A779G3)
> is an updated version of R-Car V4H (R8A779G0).
> 
> I intend to queue these in renesas-devel for v6.14.
> Thanks for your comments!

Thank you for the patch-set. For all patches

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

But small nitpick is that R8A779G2 is not only for ES2.0 but for ES2.x



Thank you for your help !!

Best regards
---
Kuninori Morimoto

