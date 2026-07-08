Return-Path: <linux-renesas-soc+bounces-34874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CD6bAnU/Tmp9JgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 14:15:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D58F72631F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 14:15:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=NEeqBsNi;
	dkim=fail ("body hash did not verify") header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=SC5LDbjA;
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61382302E93E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 12:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4390F43B6FE;
	Wed,  8 Jul 2026 12:13:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B607435A83;
	Wed,  8 Jul 2026 12:13:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512799; cv=fail; b=hH8dl6HNo7RUlwUtxjKCIk9cuAiBQqfgqrmjWK7VG5mkEn6/+E9NQ496kUSGbZxEnl2ENGLpxndaQlGjP6fiTKe+30+GVearv1t8Nancxmee57HlQmpgjMYJ3z3+9Wd6RoDj/Y+e3KtifdYF7Zgg1NOSwuQxBsSwwcWwBGfCVTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512799; c=relaxed/simple;
	bh=S6Pv5GXsatl2O3YU54DzDA3CMML/bxjpitNktgHGnnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqYmlEBwxSNEx3/IKJ0YcogPvOX+yf9cY2C+u18pPEtFc+ju7lnudB1zj2i5h9L7Ww/Jo7gj26vqzm3DW/lSrvE6O3A4YRUWtnYQAXZ6NRkGNyWpEHE+W/OmcOLizfxhtxeT6wH3b7fpiLMO269cBjxGOYl2X6QaRFT67z1WIKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NEeqBsNi; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SC5LDbjA reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6684m76q1629049;
	Wed, 8 Jul 2026 07:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mPiJLzDy5wCVrssyWPG+1Q+mzAwuM5/ksgfu6bEPf+Q=; b=
	NEeqBsNipzyb92BkIy1K9L0W7uL0itG3v4/ltelKXmSPjKM741zhz8erdjdhWU9s
	WxhzOC3sdLMTsXJA3AsPYifNqOkgEpwh+uNSaDFYHeNuIARZxEKJzowOs+i/D5OD
	d/IOQY7yeVCMKYFYtY9jND8+q+vjoLpNBNDrhg458Iar54KCnH3KaJ4b5v8PzjL3
	WYMU6XDa3nm0LtdAe9OiWtlhUL/FYMe94jOlaXOtkZRd6ZAbCrhb53g9djLus6c+
	yYxt4uvHwdepK4ihWhFgCyAlRUkFTfU8xaUbz3xVHWa4ysGCdXZB4LP4r9tF73E/
	m6iFO9JFwhT1Q8U8Vr5G1Q==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023090.outbound.protection.outlook.com [40.107.201.90])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjp699-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 07:12:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkbYx7GfrIvnFfmhxG6J1LuNxKracKPBjr4ROUv8TJ15JPl6tGZWJ6A8TfkhqbcLtH6CvvK8npET+44vsJZuEUUgebvr9YEnSAApIqMl5+e//IB4RcRpPENE1ZaZhxWdrJ29FUVsQheEhZrG1fU4b662g1PU6QVegT3YfQB7ppLTC8tGZQuK/f22CtqVkaHxEBIZGN8/KU+H1/2BkriMYMvKV3zmuCkSc+to61g/7KwtKpFMg0JP9pzCub86ZasRoeI+IsuP4guPsYRIssG1YpuFDwEDYvMC2iF0UUZe5woykH/GoX4MdokidauztJ1Jw1Z2GAQY1vmEv8e2dXw2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xt+HEVbiRucuRSlUuND8Ll0TzQMdxcMD5FWInv8pXMk=;
 b=BUQR19ucS40HaNufg9S+CxlUj0IYZUOi+RzQ4Jv7tpnlQv5nhq5yMpD5APs4/zSpsNZerWaeLPyajHdOsSAgzfpv4jkhFsSIaqyB3a6dAmdn0fViw7vVVlAD3KSXIiEUQA4guuiZ4Hal4YI26XaIy2m62vKc+vIcXNS/p5s5qg7wbd7zQyizaph4EiYo1XX4qv5ZD/Vlrc9rAB3SnhVBvBbfGjW05YoQITm//H5xWegO1XizdsLSqHmBwt68CuXpIn3x9tYZSFWOsg2LRjdXyizjPf+oRYRb8gzLdMkuJcgqTRDmgRuOvndk5hLCBP4OtquosFbvfEF3sw0l4N7/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xt+HEVbiRucuRSlUuND8Ll0TzQMdxcMD5FWInv8pXMk=;
 b=SC5LDbjAZtkk8oFLT6F+rUNb5XPpPvTl4y/gDVhb/XWfT+3VE3YhJBX+//r38Z5ld9+14YxxqOUSPcSgHmPbBiyqL6oL+1Ch9HWPh1yrQ+8W3LHDmzdEUbXvHLHgBvc5uobhLoWQW82XEiDu6kYwB6DueBCpknEYhGVcYosEneU=
Received: from BLAPR03CA0063.namprd03.prod.outlook.com (2603:10b6:208:329::8)
 by BL1PPF75D1B5ED6.namprd19.prod.outlook.com (2603:10b6:20f:fc04::eb8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 12:12:38 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::36) by BLAPR03CA0063.outlook.office365.com
 (2603:10b6:208:329::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 12:12:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 12:12:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B1736406541;
	Wed,  8 Jul 2026 12:12:37 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8EC9D82025A;
	Wed,  8 Jul 2026 12:12:37 +0000 (UTC)
Date: Wed, 8 Jul 2026 13:12:36 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Fred Treven <fred.treven@cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andy@kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Werner <andreas.werner@men.de>,
        Samuel Kayode <samkay014@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-omap@vger.kernel.org, imx@lists.linux.dev,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 13/23] mfd: Use named initializers for arrays of
 i2c_device_id
Message-ID: <ak4+tEBnZAhohI1n@opensource.cirrus.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|BL1PPF75D1B5ED6:EE_
X-MS-Office365-Filtering-Correlation-Id: 978338dc-3f64-42a4-dcb4-08dedcea33fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|23010399003|61400799027|18002099003|16102099003|22082099003|11063799006|56012099006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	NaHGl+PDpkkXJtvjKW41PH/jE0ylBuu5v/uCUrioZ2uwn+H+DJgGiVncFP4nHB9XqOa0JIIfVa0jY6skzCvqfnzDdOdPtF5vzC8DHEqPLRBB7+0aSSXzSe791hZtryCgmNw3g1ZENUjm9wukFkSOUcW3Z9ZP/7GVDhdUrFIeuiDJly6xNSe4cLwqGLBqCWL3UQygXFz8L7rOJUIs5oJZzG5CKRrQHgiwRm08CUCFa1yGkUxqY2UznlouuZUJ88ZWQk+RvTOwZTTXMpo6cHlhYhmj8Dga6ohGjbCQtZJM2/wwubUtGauIiHS5HX8r1gL9ZRAlfRdorUxv8jjBSs/nczh9cZUVH/hbStADP++anL5cNISh0RZC4BQ+qKZR6iSmchQj0OKFI7K1gOtVWp1c0uTS1BK9ZumTH699gL9lPvNJmqWuUUo5qdqTsY5gELCQgc3WlUHIvaBTvQAEAQWbvLb96+x65Xdwq25je1h8h0DTzwIVjl+l8kNrSrLy+VGi8xF5OGEzIoS6uLfy0Wx7OUTjnf1Uaxn6lhJdmRPXhU5mavle/aOh3IKf580MJ1rGV4zVIFyLYbvL7ncPvgV3HC2AKy88W83iIO1bL9ew7K5XE4USu2icK1O7KFsdeHmT71XOGjC2FYUKDkFeqOSKmMdh/I7DYTtBFNrJ8vWv6Qu6aDHolz0NjiIl3rayX7wXh6qXVA2NuUtsNE7pCaw46g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(23010399003)(61400799027)(18002099003)(16102099003)(22082099003)(11063799006)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MiZb7vDO8Nf/eMjB72nqvyGIORwPxiuVvOIFGaQeXNt4WP4xCrYiwagyREoMq4xX854orAI9QNvndnHGbv+lQC1tYivzy36tQ2TKgEKDyBUR2tYWBf9DSFX4+NTgeu5+C0mz9LxLp4IJ+ontXrmvP7qvfw5ZETwSWymt8Md5wGVD+PTwftNTWuF0D754X39/SQITRh0IISP2O6aovvpnAvX5u8yTquQfn2TsSe0B2j2+RG/7p6xv3Q2sNteyY4Xn/O7FUUCuuBnGNHyt14SCP+QasHcQzxK2NFRWjoQVoUOYC7ttHA0gUzKkCjasOITP6QN3Qaak110LzUYv3FUAp+EPgJ+eIiZOa7WLwN150I+Jk+pP/XWFAOwaXjQiUF8gj9yNNKmLHfvIMIn0fDlLMuXoGd2zRj9RpileDTAERmPCtkzAdmcndnj1J5ubhvM1
X-Exchange-RoutingPolicyChecked:
	ZeJrDXOm8A0kX2L8jdcEpaMhqbjpseueAkrkrB6ljFQwAUq5OLwYO6q5YjylwEJbeWuAXTBFsrR42nHzocsRwO90CKze1RJp7lWFnKbJzAMqYTw/lWOiJJeFoMN0u0QSY+q9aqeUCcSmxGxwGvAoVo/Jsjn2i5TX210fJKNo4ulWW8nP0zMUnW2lTto8gpKuQ5sLqmbtb3li5XfQE3jABZSFH+71725ymtpamFpzax5nrr7s3i2sUsd8iJhTKAZhI77X3I529ihUPrtysOb/SxcE1e7+Fdf1Sh+NoF4eB6Na31KkdNEB5FAqwDqhG94JC6CM+lIPylfQ0H20ao8EtA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 12:12:38.4962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 978338dc-3f64-42a4-dcb4-08dedcea33fd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF75D1B5ED6
X-Proofpoint-ORIG-GUID: EhiErDDWciTEN6GeePdQU2jPXppFnCu3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX+L+BMz3bhoEx
 xM8ccIClQWqyk8gK7CkR3+3gkRkyP3pXiPTeuL5/2BCPYpn+ShmLeyuFnEb+ZHkG4vNm6RmYOkh
 CirH6i7ocESmpPqts81nZP5DUsE8nm4=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4e3eba cx=c_pps
 a=1es5Iy7n+cWvltLRflzOuA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=iIrBw4RlzRzBrTmksMcA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExOSBTYWx0ZWRfX8xJ8JhG8nVuE
 Y8t8utLiRoAp/OcoyE1CfbYK0uwsqSjgXGM37+s81htqHmhqYQl50IEuBymUPloxvdkMzAb5Dxe
 wZQRnHUlOrr9LQhTIWsDU/8dB9ZE1lcNJhMiqk8euRvESHcvjZvBKX04TZesESNHjogJlDttH8M
 b2O2qWkeny96ptzGgycsWpl6En/47V1/8MADiJCwHdrNTQY8DdjoG7iSNA6naAIqHymO868p1Nr
 4DsdRxZMUEKdnM2btWgEMeBC6osY/yLEeYpCsebnYwm5GTLX7yqrzLlxjc7HjlaKTBvY1ZYtEHd
 wrVG5dfJBEAds1AfN0+wWslJFYeW9bVKaz977D+jfOV1EtGul70ZytEkW2px4GcUVs49Hopu35F
 QAoKgAF+yKkZbfYK/TPNIXWsQWeflgZSJwqHkDZTu7mw2BZgfkMA6QxvE8n8vatcCrg99HlkFuU
 rNOrJqJ/emZZ9spo47w==
X-Proofpoint-GUID: EhiErDDWciTEN6GeePdQU2jPXppFnCu3
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34874-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[opensource.cirrus.com:server fail,sea.lore.kernel.org:server fail,cirrus.com:server fail,vger.kernel.org:server fail,baylibre.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,cirrus.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,baylibre.com:email,opensource.cirrus.com:mid,opensource.cirrus.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:lee@kernel.org,m:michael.hennerich@analog.com,m:wens@kernel.org,m:marek.vasut+renesas@gmail.com,m:jogletre@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,m:support.opensource@diasemi.com,m:andy@kernel.org,m:rf@opensource.cirrus.com,m:cw00.choi@samsung.com,m:krzk@kernel.org,m:andre.draszik@linaro.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:andreas.werner@men.de,m:samkay014@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-renesas-soc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-omap@vger.kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	R_DKIM_REJECT(0.00)[cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,analog.com,gmail.com,opensource.cirrus.com,cirrus.com,diasemi.com,samsung.com,linaro.org,iki.fi,kemnade.info,baylibre.com,atomide.com,men.de,foss.st.com,lists.linux.dev,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[cirrus.com,reject];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D58F72631F

On Wed, Jul 08, 2026 at 01:15:20PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  drivers/mfd/arizona-i2c.c        | 12 ++++++------
>  drivers/mfd/cs40l50-i2c.c        |  2 +-
>  drivers/mfd/madera-i2c.c         | 18 +++++++++---------
>  drivers/mfd/wm831x-i2c.c         | 14 +++++++-------
>  drivers/mfd/wm8350-i2c.c         |  6 +++---
>  drivers/mfd/wm8400-core.c        |  2 +-
>  drivers/mfd/wm8994-core.c        |  8 ++++----

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

