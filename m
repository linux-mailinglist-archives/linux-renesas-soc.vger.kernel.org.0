Return-Path: <linux-renesas-soc+bounces-32674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DdSLQX4BmpUpwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 12:40:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C9F54D81B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 12:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50748314B04E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 10:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2858B3D1CD2;
	Fri, 15 May 2026 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XvXxMM9Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tPbWhXYR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A423CFF6D;
	Fri, 15 May 2026 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840491; cv=fail; b=isGrUDXvQIbsAH+5DqOfRmMUA7mbP7DDE2A8Zcgbm6Ka6mN86kdCqfzIlLViyq6wxX1cnJAcKg2/DtIX0oUrrCMRCqNdjYsGl4CiScT0yDwnU078s1jKJfcpECz6UmOExcmOmnuXwXsYTtrQMgjpdGaPnIawbZprEU29WD1MogQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840491; c=relaxed/simple;
	bh=HvDoaPWGqw+eSPwTJ1bTevP/KUvjP6B7oOqp1kwhMe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBYnL8Z7wlyzUsHrdCveo4BiQJFwKpWtD/4Av1rdw9bWsFHD62PxNzqkJNyiAJxOTXr13mv6A8YhGwKpCsvX5Xzta/q9/nk7I5uAHU8ug8fbTvKg7DQZLdTjoAbP/sjmNB1JoVZBrKouUP+36lsvOWVnxnqpulpR4grb4H9d4PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XvXxMM9Y; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tPbWhXYR reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4mjVE4154599;
	Fri, 15 May 2026 05:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=RgoWYkcGGjfBn5wZL7wufmaUcaSv704l001ZnXQy8oU=; b=
	XvXxMM9YZdFiUPHAico5QvYRY742QaOTxJHyVKAtNBL1eWQD70OwJmC99a/A7wfn
	PWKM+eHg2r3zQ/qQyGemPBGUNacRwGBgfqZN8nj8t4YLJn+0qQYVujyZQPZZgyHJ
	PWHHpybHx+nWbEPuD6X76bc86118LwOQofo5R2DCV2npz5yVHPEK/EembiP20ii5
	r8/u2BTtQ90wTC4b5UpdveqLZ4zbF9638PUD10/nZPtEVBGm8L6L55vzo08iYX/T
	CRe7K/rO790OnPAsmI3HXvvcxwOgHgZ+X4uEIKKGqbqtpOH4RnUC5U9kK950cO9m
	FwByXsfuDokOsV6ioX9NnQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022078.outbound.protection.outlook.com [52.101.43.78])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e5m2krsve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 05:20:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4XsjLUUqyqHg1efeMEhbE/ZrXGdj+W1GZe/Hbb6Fxgvs18+scxG+++ZNol99iAHSzEcLMwtF+CrLpdGrGa5qiTAIrxj685pEhgw7N1gv2pU6PieNA4OxXQnPjIzztR7nJFEAOhxg6eXwOCO7P8fcqpn/a2qHIZRgjkArQzxqxXwSKLvNEGZ0dR/CmgagXWb/Zc6fh2sn+LYHhtNUvDePshKNvEas9FQN7fZSO4sVSYML5M4+WMWTQdhXbV8+OOBP+yaTHp1lgm3BxMR7NTjL8f96Cl6TfN99mOB2PizU49ZXQfPjc6Qydz1SRGCTIvdBFEZ7DPyEzKYQH+TrASmHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK8IkeVbbb3SnM7m7A1eUSz4c5AnCxWlJcks5US2QTs=;
 b=cKsAJo3lQw1S3+Qu3znPpYo+cR18YiIipqBkWuj3RSmbLr7oueHqhfk0CC+PtXLp9ZfpRUeFR8AEIoaBRn5n0UxJPJBDhPS825dIz7sB2YZUBaAbhHjqaPhLvpWKFX040ZS0uziccL5Nf3dcaq7RSg553N4jm9m7YrhvflGmxf7Yx+PnHM1vgJaXAgq96lEorTypIvcZlhVnRmS2xuU7QcarqkWRNkikK8iIlEfOJQRA5P0QnbHWl3jjtxZEsTF7lNvmbnXh/RZMWUYj0fB1lPNE+HtMYBBh+r3eQD4tgDdRvYvfSJRQPzjeIUGs7pXTtsNgd6CvCQdO9zQ46jtK5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK8IkeVbbb3SnM7m7A1eUSz4c5AnCxWlJcks5US2QTs=;
 b=tPbWhXYRP+0j3k5KJQswv0a3zDF0lH3YvFYHS1UEKYv/oP7oo8oYtBqiLgYwAcrzIz0MT1C++7SJ/42c1TckGKQSdt502N7fwH+JfoL5BAPQGUvO0MQjS885UAS3rCGgK5nrocL75suHqOfHYtwFz+5H7Hi+SsI32ABQDMdBUjI=
Received: from LV3P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::35)
 by SA1PR19MB997369.namprd19.prod.outlook.com (2603:10b6:806:4c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 10:20:54 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:234:cafe::88) by LV3P220CA0025.outlook.office365.com
 (2603:10b6:408:234::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Fri, 15
 May 2026 10:20:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Fri, 15 May 2026 10:20:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7F484406540;
	Fri, 15 May 2026 10:20:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5AB99820244;
	Fri, 15 May 2026 10:20:52 +0000 (UTC)
Date: Fri, 15 May 2026 11:20:51 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
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
        Tony Lindgren <tony@atomide.com>, Samuel Kayode <samkay014@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-omap@vger.kernel.org,
        imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] mfd: Use named initializers for arrays of
 i2c_device_data
Message-ID: <agbzg9W+p2x391kW@opensource.cirrus.com>
References: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|SA1PR19MB997369:EE_
X-MS-Office365-Filtering-Correlation-Id: 09dd09d3-9a8f-4c69-4cf3-08deb26ba526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|61400799027|82310400026|56012099003|11063799003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2uZj3ZOtI7NqgR26VjaqtpwY4cBRNIuI3/yjepgCcJlfw4ZffgZbn9lcREYwD0Nun0qKB5zh2MDO4U8l5JKwtMtMpSjyqzVDIY8qOKFCriDAUgYtb++YjsXa3hXsriFhi4EySTTGlrd/7txJ6cgi6e1+QyMNKnMEnIUvMpaqo5NspH9U+3FMCarM/K9MpKMYvoUXynRKfG9dMAedWct//7z3NEzfch+ycF/gllUSUVevddj7Oe6tx7xEZ4DO38jgb8sS/Xtd5azyuz+2bYoeH5j0Hqjc8YeKREXLYwoJOIEah2eO0Jgmes54w99CPTUgt5qNvzWY0DqMs07U61yhrztOzRXQXB3ruLtTGzRyCGBsDvxnqW7Vaz23xlV2ImNspRIncXAKqHvlUr3mPTrcY+ss+/HD5fCosy3Pia0uBQajlAMGwtXxg/uh9pgdKghWO1bnzlWktWxyqpDF+PmMy1XsPktv+s12yZFOl+NZ2O9PEi9Ty6a3xCPWL81HWbs+aDXdB+bnXYQXOHntBB6+cGBTfZ1Qil+94z1eb58c0twPeM2CuG5sbbEtaJLDY4rvpOKdUsU/VX47t6t16R3nXf8zuoEmxX5UJKg3nOhOaAj7xmtccMuDjxprgR51E279atkKh2hw+XmvlCHCr67boRi7hzDNt10nOdIydlD92KD8Te5bmtX5K6TwhU5X/mRmuaP0aqVyfXSgDCjGOi/Mij0dgbIQ/EYRNBptm0oC0BY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(61400799027)(82310400026)(56012099003)(11063799003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a0v01sc8huhj8GZTosj0jXHe+6oRSlZEX3efZ/+98BMDzQx9l1Un9TtJaK3v20A0XoB20TMitB4quVRc2AJYk73VDMQo8ca89AQsIhFgzZYIjMBtiTL3E8iq38Fb8EKQdCS5HlMp/B/gXyG/Nd6tgpukOhC7VIBWcRtrSA+ZD7v0Z2Mj6toFOAYhFino+qzWfM+gmJ++ogn6ZrHJ9354ZptLXIMqE/opgTJm3bOi8lKKY4qDkjMqpHVk2VKjdcZLe4LaGLGavmB22cHgpTX3bDBsmVZA7VurnLl4GmD5w2wgfz7Ro++181HP3AIj28FW50Fi3fsUCh/pxnS6ErHD3vxpAvRSUZmNosnfDe0AfsjwjiRpinvNQmQbC7179vBCeeWzufNWczAYkWe5rAi2ob5udMXAL8g9V4T9V4yvmJ/je6iUwkWjCVp86/42yD23
X-Exchange-RoutingPolicyChecked:
	n48JFZQ9XkKqSF9J6ccwoYQcoB/YNdT31+uqvLQmTZLmEEnVOOjNgiAbCMthd1tswZ6KontousudC8tlrCGMIKZWhpQguOXS8kz6ClwHEnx/1aocc8creyLZgXhr/aNMwOIzX9U+u+V1dlNe09thozmr69O0TdyEEWfLaA4SP+nRhUj9PAXxH4OjFEQ1KaCICdgOF3kP/Luy2TZS/A6RIUgOzgyUNzlvLPCJlZBwHGXvViB/NB2QA7qd3NqmUWpKAodgUD6ikngiKVE9hJQeH7NdAoH8IrCDdSBJwz6+TCy21teOdXPaA86UYaoy50A0ejiqBTJrfySvAjyyNf8hLA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 10:20:53.3055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dd09d3-9a8f-4c69-4cf3-08deb26ba526
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB997369
X-Proofpoint-ORIG-GUID: SipCwgKzMIkOMOTNkVqnfi4_GdMr9PzZ
X-Authority-Analysis: v=2.4 cv=KOdqylFo c=1 sm=1 tr=0 ts=6a06f389 cx=c_pps
 a=hJoePaVs+Aefu24hhViaWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=HCcUUyVFpx8XlB7MacwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: SipCwgKzMIkOMOTNkVqnfi4_GdMr9PzZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfX5NEKLcBSCOkL
 4g5KeecBOjqZz7z6jpHo8kMrw2ebARVjXCRUCiqFU3a/AemGicmX1Qjul62to2n5fULoygigM1A
 kF5QI6W0fOI8EmL9s+IiETy0HrZQi39Y4qme0sRFbArmasTfs/ehFJzfBvXuBup0+1Dv2d7EgFG
 892SED8rR3VRH1o9l1hedG/Rum8rNpnCggUo1rFaRvu90KSIb9ttpvpvzcztQWGUhykOnzPUZbd
 73vm95UKlWar+Oh8xVMu6XtX+UhSm9Mey3wy0HafHQH9mUpjlGIQZsRg3f529sRujI24SxRd5tk
 kQXRl1/ATVA07BGV271yMTkTtcWLUAFcAwsPYxAXX5hVoyyXib38A0IDIF/AFwcFAhFrr9zN20B
 Lk/1J5Xu5KF2aEk1kfT38ZnZlbvg8uH6gmPP/HS0H9eHE5PDmI2zfTtTfpFQBPx5PnfZaRXi8Wv
 pVrc1KQR5L4mnDZIWnw==
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Queue-Id: 24C9F54D81B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32674-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,opensource.cirrus.com,cirrus.com,diasemi.com,samsung.com,linaro.org,iki.fi,kemnade.info,atomide.com,foss.st.com,vger.kernel.org,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[cirrus.com,reject];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 11:58:39AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> While touching all these arrays, unify indention and usage of commas.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---

For the Wolfson/Cirrus bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

