Return-Path: <linux-renesas-soc+bounces-28410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E3dGn2MnGl8JQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 18:21:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F5917AAB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 18:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33012302198D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 17:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF42C330B30;
	Mon, 23 Feb 2026 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q/W5+HAf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010045.outbound.protection.outlook.com [52.101.69.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBEF329C79;
	Mon, 23 Feb 2026 17:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867204; cv=fail; b=cGUw6oEZ1clIiqAhaZ9lwVkzvAd3sfHLOe01ZWgHA6ctFmNS1AsLabTpI4cItqcenHJ+EGOgfU8gz6G7b1/VaBxMu5pgSPkdCzRCn/azzgUbzhTkxEPv0RBVZVzfKImrZXijTbifrZ2BeOJw8NaXZlCQf/x/uNcif5o/jclHoE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867204; c=relaxed/simple;
	bh=0I2WtDcG0FiQca7ipXD9X8NqfL1R4/rQU9j8Pc41aSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L4IxFsTJyCXcS0slHlwLHzxTf+BHTtriF3VCE1hbHHu0HrVcX/WY8W1mGNi0a4XSnc9BfNaFNib76eoyTvojM2njgsUzm/jYcGx5amhU70kXjDtF4xAeDbveVHGhKY4TfVdtMHxCVXt4xaOIvcgplM1VIMm1avWvDcrGZ+U2zvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q/W5+HAf; arc=fail smtp.client-ip=52.101.69.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTTVgbpJzLi3EcJM0B1xTppmOZAyTcTkFydrUHm3dk55nI58MZ4oLU0o+zRJDfsLDz1pWatGnyeS1FOjtORH4DRwJJkgUWwhHgIolxY1uYvC42K2wMsghDesxYZSKMysph3BHZRAHTyfi31gqlqJxXs+v6t64Rk5csRbMazwXtd5UN7B1SYW+uck0R+vcY1iqX5Iyjo+iacAOzxqJ5dCEWCg4fjhFYqIjPEth0xn4+eADl2gGWjvlt5QXceEGZVLxZTGKbXJ1HbP6WvVSrnHjX/bXRSZJLKEdK3UHPNxFcLukNsWmegVmM7tCCSxmR3LZ53KS0YrDGOeOXIAFfFn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh93c3jr7iQEEizkTf8026CO+rOOw5Lwa+2MlIckRXU=;
 b=jtOX2RYLnDhnUORPeO/iry7d2i4QX3U2drb8nRL+u8WqlVHtBJruAGwhnZ3T1cxAo18XtlOzhOtz/wXG+w9+vQw7wxj7bcZ/Ste5wbmv6ophoTzhywWXvexlVOnV0JIrn5ldXTqNh7bPVW/VHQXekBaszmvU+PWese9l7faQhQLvVLdy9cC4EygQ4jIRauzUi4TdPOhuvHjpp/CLtnf0lZImxj6eLyEBXxX7qbfvJTTk5hvYaqRO3gmwMDfDwfPU+Wv0tQIJOkb4bzxZYJoRAW0IHNAmvyCl/avLGOpaNeSDk8ZUoOVbmgDSjRgT85MQM8l4C4GeG2rF6KtaNleCmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh93c3jr7iQEEizkTf8026CO+rOOw5Lwa+2MlIckRXU=;
 b=Q/W5+HAf7T9e/iDELCbxEaeJJcOCkqTdj2Ez2grHlZ05LHUq6oiaBk4DXEG/WWN0kMXJLNLOXZ/lu8Xo3G04MKWAfRQXf7tQnLOPxnOeUc/wbJTFOR5jpnerFz73xM7GfRzCT+DF/PgwVkGJL/79Xc0G6m3og5cWm366NJ5X5E6w+ileTCbfWcs2SASsDsuBrAoDOIRxOswYI9LsUObX7kv4VVNlM1H68KgyD8P0+wXONf5Ts2D3AIlR/WnzvDyUAn5if35XTpLpoZhMm0gS0J8sqYt9nzf14Q0f2BQk3hRYaozHU2kqPJULYfXBThmIYBsjdwvtdTqqnO/4MTqZGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB12214.eurprd04.prod.outlook.com (2603:10a6:150:336::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Mon, 23 Feb
 2026 17:19:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 17:19:55 +0000
Date: Mon, 23 Feb 2026 12:19:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/12] i2c: mxs: set device parent and of_node through
 the adapter struct
Message-ID: <aZyMKxTNPyJVGd-u@lizhi-Precision-Tower-5810>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-8-d78db0a6fcf7@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-i2c-adap-dev-config-v2-8-d78db0a6fcf7@oss.qualcomm.com>
X-ClientProxiedBy: SJ2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a03:505::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB12214:EE_
X-MS-Office365-Filtering-Correlation-Id: 14aa166e-9c50-4917-7b46-08de72ffc352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CdX3O99HylI7fLN1nyPR4ILJXIQqphBCyW7G4g7WHh105MzqaN3831+0ojOR?=
 =?us-ascii?Q?HLVnLlmXCtfRXAGpZSB/dfvVjlx3v++oAO5rFx3bGp/1YKMES2lud7wyEzrp?=
 =?us-ascii?Q?b99SmfH5ANphwJigEf9paxin+CMESz+QCVNHEgZKg8d5qrDqIvnfomELoXT5?=
 =?us-ascii?Q?GnI9Yq3flvcRJCmwVfGv2bdzfKr2LoPQDWCWyWEaY/DghmepBlVcUOYOeXdQ?=
 =?us-ascii?Q?1HCbVq7fulkTnGksV8GYKaQYwxKUVR0od8+7rL9mexuFlArhP+6MLorZE+h+?=
 =?us-ascii?Q?3YretHoi2iB0XSu6CeAjAPbboV3ny1cLYlgtsg30d25AfvDLeaGAiv23Mbii?=
 =?us-ascii?Q?1jnBlHr1dU1+CzN7qCrlsw2z963ZfPG/sSxfYr6XYLj1hbAaJlIKViRq65Bz?=
 =?us-ascii?Q?htIV5AU9n/7RL4m64hZyBHmo+aRfc/sp4Di5CQctDicWhSVRt+88FBnYOgfy?=
 =?us-ascii?Q?w90jHxO0o85/rY7m/AV7vjv2Qp3rvRi86nyKuXBYoFgCFid8PYu099xfY3Ta?=
 =?us-ascii?Q?Z6jnt8eaJkK66oajbXwbXpA52sYi7u5ju7pp6mi/6NBHSX6GSBJ9GSVdxSNY?=
 =?us-ascii?Q?tJohp/QyFHxAXBE40QI+VObFnTaRPx6i0cRFK+EvuC4HeL4Ey23UIApgxmTL?=
 =?us-ascii?Q?q3U5bAacaswDG3wU3l09O5ZAYu7gljGvTAGo5cbIcuDJhoktUjQU5JIA6MjI?=
 =?us-ascii?Q?yly1Gp91fS7RvTTwr8feUZEVTtVH76vgt4UmxLDCEWpXiMwcdOP3pa71Kt/5?=
 =?us-ascii?Q?h6CvMhuH4pAHT86KYVDt2MvoZfRhQKqtNl/b0MQ/ouPcAKOH547RYoOaulbt?=
 =?us-ascii?Q?AID/OeYuMn0cI8brrkG2oKSv/cSdJdgFCCsE3MktIPC5TaNUmLsLeLuQTgpA?=
 =?us-ascii?Q?K47W+um8a31fSFPWJHptyxpe6KS2ewJGJU9MzZgUhPGeFQIrGzQDb+4zJKhO?=
 =?us-ascii?Q?YJc99oPA0PP9coWD9DN5VR/f58aIlTU9w5H3qbzdu+pxyHT8Ly9JA83wcmNl?=
 =?us-ascii?Q?Gds9A8+U5pwCSSEjQX5/xWDhXXQYl8v85eA2zN90YTu9eWJUA05m6m/5EB4f?=
 =?us-ascii?Q?6xzle1ofo79ZrrlYWm11/Y6zGycFU9ksU4elDQzY1SIZixISapAo0a72DJl+?=
 =?us-ascii?Q?l4cz/EgK89MyX5+dpqaD4K+Al+h2aXve58pfnxNeY/zxhT1boBK0lytA04J7?=
 =?us-ascii?Q?R3oPa16i2psdNC9YPQyFhqRi0qC9oCapT+PLBSS6pcAdRSKfyjMBzS7hV29p?=
 =?us-ascii?Q?nlK57y8AgXANE94tG69VF9VuudaD47nqWq00X4zohInt6M3FP3AAyiDnuJ0N?=
 =?us-ascii?Q?RN6+aGHm46YhhyHG+qLQtcGEsdNpahNM7xM941C7z20hXoLgX2l+FruFRSpq?=
 =?us-ascii?Q?EH8R91LCWgMmToBaN58hbyBp+rWPsYS1qHqjkf3qLXeo9RZ/KmRjOrdmbp2i?=
 =?us-ascii?Q?KhzdPu8uJuzqeXkfUEJXsoCh4U8ya8FqwXFLPC4wFDgNqf9iD6YadZRsZ72X?=
 =?us-ascii?Q?m47Xx0NRGUMdKXdRmMglE91/klP7Iq3dN9hyQdurn5+29SKoRI3TuwsG45oH?=
 =?us-ascii?Q?B3vWeWbzC5xnw5ati8mbCMI6pzXKikqydVmdP+S+obTuJG+Dxj5Or6LNKd+U?=
 =?us-ascii?Q?G5vMWk2JL32VyoBQ2TZrcew=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tIwQHYYBbRE9vivfSBywNgRsZNcosHrE+rJH3sxmO7Asr9ichqKI5rIMFudL?=
 =?us-ascii?Q?P2UunrB+74HlqRJwLu1sCaq1I6Q5AYNtm7GlD9Lk+2KEYXNYfMWH0BMSXzeR?=
 =?us-ascii?Q?vZGd/xJG0miGRnn64xomnlL4YfI6WjiGvCMpJSan/Pxuy+D/MqUGgkrntBkh?=
 =?us-ascii?Q?fc8ABeMQijCdPVYR1miwiyHuEl6z4hRr4Wmh+b3Dg2dwtfM5/D5OmokZB6oG?=
 =?us-ascii?Q?gnsJ2dQc3cfWXeO9ggOxd97DP9BLh54AghsfX5BuTmS9dyjwKOjxW7ecQroL?=
 =?us-ascii?Q?0uEWhYD8T1t5oeruILtruV931AIMShkjzUYeJsKDaW0JfANa2yNJQdz2kyY0?=
 =?us-ascii?Q?wHcvpoFnfaHnqWtyjo50SBeohDo6dMDghKIsD9pWveCa2kU22fZWT1BENQuw?=
 =?us-ascii?Q?G1UP8nngXwtdeKIGk4qgEBjnoa2JONxBluRbyxwZtZPLdKiS3mth+Fi4rBa9?=
 =?us-ascii?Q?q/R+Q82KO+OAGvi4qSagLGZSyNaXpdIFxQrtnv/14rHNsfvSIt4vUwKTZrIm?=
 =?us-ascii?Q?9JGxaaEDW0fO9xycnQL58go84altW6RgsAhclbYxPPAr/dIPn5qRk2VYqBDL?=
 =?us-ascii?Q?krlaU+T28H1FS3qxDlg3C0zwvL6LL0TnAusG59Uh0rS156RubdXRCFrxtg7l?=
 =?us-ascii?Q?Gax06Gfj8V5o1YCKJFVYx1eA4+xYGFMvYAZ/5mLsMZURpJ9un075WGWI+zU9?=
 =?us-ascii?Q?qK3muA05MErHayciyfeI0hCnCgMi6xjIDzEL4WX1zKyLlrh3qIweEfdyiowW?=
 =?us-ascii?Q?iD4NBLKNw1xwPvix0G3EhOtwRsai/VkVJfpo7fSiO8JMuz82FTnKfpU3HNnk?=
 =?us-ascii?Q?cFkw4XMwehr5NO6i8x9teg29roPMO2o4d9qLl68o++bOYYUwJgNQBBXME4Xs?=
 =?us-ascii?Q?XtbZInM6gFJwz4AcV2ySsgXE9EJyIb2XEOBchjph4AVnGknkdAw72U5rxHaU?=
 =?us-ascii?Q?ELbxKrc5mFKDoUWOE2qCb17BZ60NJs3CPs8eeQrYBL3PZT4iKS/ZRJxLD8O7?=
 =?us-ascii?Q?eiPfHIuqp+LBsFeabBapm+Na4P24x+0cremyj1rnrUxcS5bEiZ4X0IjOfQmY?=
 =?us-ascii?Q?kdfJam8nZ12B3oef21aZQAD3WE7glHFrZqYXP7E6NXNQ4Xqn3dVwNHZlhgY3?=
 =?us-ascii?Q?sHXWov5VKfA2yNR3+RKEEZHZqYxn5dY6gnVQv+MvOq4yXfryS+WhanFJCTSv?=
 =?us-ascii?Q?hTKwWJJ1KJ8d5nIRtxHt3xyGAhiJW/eY+dMC0+7eKX+HsokTQ8CpGElPyc9M?=
 =?us-ascii?Q?zDzCfA64yHyqOqaDE8yX3TaPNqOkVY4HkWEvbzCGMyGTO/93O7ANhxtNqZ1H?=
 =?us-ascii?Q?x6EdHUQwGXt8e9SnpXgEcJLRbgg/vJg7cZhUJkaZ4n516pUXxyAakIjuVsQK?=
 =?us-ascii?Q?6L7qpB6oVOL3o8FAWXrlj+9qBilm2Ht8a0SMtWwQDZSsthfHnLU5D8TQSQyH?=
 =?us-ascii?Q?Cc17SERZRMeiQ/iFpoOnJwPIajkZmXJ3gCfM2LEDfSWVqoaG79aX/p/btju4?=
 =?us-ascii?Q?Wc/TFI3fCwa9xT933o5mR4LWB7xqpKPwpF1WmlxzwFDROohu0fvSEc9vYOEj?=
 =?us-ascii?Q?x+z9HGs7DCMtHi3Olu6ETZ/nBzSsHEID1+t+v8GEMHJh3F1aTTZC8rMbIZf9?=
 =?us-ascii?Q?kwK5UV1HCTEjuATU5spkh9kKR/eDGwexOQM95i00qjcM0wVNtRvqc1jtw84p?=
 =?us-ascii?Q?L0maoxAWKOJ/LoAdAvZ5Lz0noZCM+z6WuVoO4X4cwro+a6zf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14aa166e-9c50-4917-7b46-08de72ffc352
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 17:19:55.6421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCRMt2JlE36zvBOczH5SlYyoOZCxzTnDUIEvHDbJhBr+IS8kviBzPaat6hQ/xc/heYtbaX3J+MmYwPPzPG7j2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12214
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28410-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: E0F5917AAB4
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:05:54AM +0100, Bartosz Golaszewski wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i2c/busses/i2c-mxs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
> index 08c9091a1e35151bac8d4adb80abdbd29a62b95a..bfbd96ee2f483cd1dd872c3448eaa6a17940d70f 100644
> --- a/drivers/i2c/busses/i2c-mxs.c
> +++ b/drivers/i2c/busses/i2c-mxs.c
> @@ -849,9 +849,9 @@ static int mxs_i2c_probe(struct platform_device *pdev)
>  	adap->owner = THIS_MODULE;
>  	adap->algo = &mxs_i2c_algo;
>  	adap->quirks = &mxs_i2c_quirks;
> -	adap->dev.parent = dev;
> +	adap->parent = dev;
>  	adap->nr = pdev->id;
> -	adap->dev.of_node = pdev->dev.of_node;
> +	adap->of_node = pdev->dev.of_node;
>  	i2c_set_adapdata(adap, i2c);
>  	err = i2c_add_numbered_adapter(adap);
>  	if (err) {
>
> --
> 2.47.3
>

