Return-Path: <linux-renesas-soc+bounces-30178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDgGK2OpwmkyggQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 16:10:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA968317B92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 16:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F78B3061512
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 14:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8973F401A0D;
	Tue, 24 Mar 2026 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BdTUZynH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386A5388E42;
	Tue, 24 Mar 2026 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364205; cv=fail; b=e++LiBTPmhc5h1oLRO6NQxETeeRvFpB1Br1O75QplufwcETOL0K6V772THLkdqeUvCiGh5WLmnXmUwYCda/MslO0fneMkL875iFqaMAGCoS6ONVCDjtOTmZJDnOVYySjE4vOzoo7a7zvrOZ75sTdMrOssbZcDiXOCyOJ4MgPV1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364205; c=relaxed/simple;
	bh=259eO7DH9/3r7vyuiBjd896f3VOTLtWZO6xp2yE4XeQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=Y9TMM2x9qlhoHh2CS7FG/bJQ2g1naddABGIXyy/uv+L0vL0qmnlZCmkGNj/ZDs7qodp6JEDsVig0kRDC3lwGW3mAmauA8qNXwJwKNrfuuc17Sz2gdmZWOwvs2Gy0fff1A7rpbb9yxvwghkcYdQZKtWwVxrhmU124dIgX96o4OfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BdTUZynH; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzD8Z6E92p7/k10SwFvRxnSiL7b35dCOWUeaFa6rSuQ+nU7D5GOQGEeUVz6WHjPNZhYB2Q9cNQjep25capauBYqo1eR4nWjZP65pJWAtKBsTVy/vMo0ZUmbg2axitD6qlc31pWRddTcl9AX6bx7FTiDsuRoIc7zvNM1/rsHd4Os4WPGqHM6JBZ87zFGjmmFdhnEHaOcp38bfdQVI8y7fXLrAG4M4bedZ5JLjm+slrtWkIKIVasRegKfJaimGsVQfDdQv6Gf9SLBa3Jgv8ShBNsEBqpapYBxkC6bKQ9H3VTt7x5JsVWXprInNxjdoVAp9xa5hQ3twVjImFDLzi2pETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3JbLRBYQyguxD+nNKHFeiLRthIUIqllXhNyPmNjmSM=;
 b=hqqioFrq1xR7S7nPaF32bsAjAv0I8/a0OjgeV/sES5TVGINVusllNeZGU5DeQIO2sJctkeDEyYwjfFf8d8dBTeRa9JHSHttOVjq3lrIjCpwBdNypojMq7vcPgybhmKvospWx01xbI8yLKv96qEdp0kkhGHYEFDmC/cwERL8S+CjKPg34SZuNYU24L2ayQw/FNpKly0oIu3Q/cJvlYPIAFfK86mJrC2ljHZ/pjN2u0i+EU38F9fn7vnU0Nog+/mic1xqveygvylweJovJqBAK52ljkHgNceBgG09O6p50N/OgKWZjDbuCPb8P/sVzu/eCQj0PtyoSajEFmQbxAJlu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3JbLRBYQyguxD+nNKHFeiLRthIUIqllXhNyPmNjmSM=;
 b=BdTUZynHSH7SOe7DPr8NAhS6tPzuddpiGLDMa/jMxh+kd8KbIN4HCOVisK1Dp7lpBIU6q0DmDNBl9hSd4CoFnYJK+zTOR7Gux7/6nbqJGNR116OZw8Ms06vm/au+rF9xnqpfKCbKiwsB0wILBx4wBuKQOPBWgROfscsi1CFhDyGmTPJRhiw7lqgEW5DK0T5XwzIj7RtAyJBXGezY8VIKYrwk0r4npCpWnnX2VgUrwB0JNvSFJN9024Q+bCepFFFrh2TyH3WfW/s1TCNtRCtqsqFbSPLGI3LHwMzYXf8CBVVYCRlx+IqtSXv7v/GMuLuz0fuB6j2KXOu1TP3vgnbjAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10694.eurprd04.prod.outlook.com (2603:10a6:10:582::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 14:56:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 14:56:29 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
 Marc Zyngier <maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
References: <cover.1772643434.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI
 interrupts
Message-Id: <177436419151.2084305.2011108468596679341.b4-ty@nxp.com>
Date: Tue, 24 Mar 2026 10:56:31 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10694:EE_
X-MS-Office365-Filtering-Correlation-Id: 785ac9a7-bf53-427b-432b-08de89b58770
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|921020|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 ldVf5LxgtwMjiqCZPyJoLt8WWdZ3vUdbL7uQMkfx+xQNIeGg3M7hryh43YjomRMkUnP0YM9My2y5k+VSvqtD+UcAkEKVYFUx4QFsQQbnfnGlN/Yqs1+GYYtx22qGIj4BZkL5JZQ2R/3IDmCs5C4okeafEo9qU8hDQb8vCkNB3JDmff/no9DKSr/Tks22oPxAompS0tWUsC2LEk7vESf7rVGragdrDSHpqd29ugVuYc6gWrYYPfrySNNh9t+8WHzeNmUeQNnAja0XCmKbbu2DF+OuTnKVw44Gk2g5B2tX0jxc4PU75t9NeXMQw4b5K9DSBGYoJqJ+GfTQemtCJPAcfcXIsI7Hcs0rpsZ7zcdfs5rC+qvsk/GAwchzmSqGF29Uflwr+ABhOBDeyfzshlODpp+UL9mtvC3gXm88xUjgLO2vpAsHjAVrxnqGaD+l96ELf9FzmHokNSqvuwF4KpCHfDkMAs28peX+g68n52/Pu4UtpbsNk4Nyn9mxPQcW4DUNLIgXX78OyEbBch7yLHcSXgU+M+iZdYEl7B1CgYMxAOKsR/PZtqeBc4XVwBjq3ftIpLvh29UPvvEEXG4dIWGXzHCKGK2P7reYyuOn6ZUuVnKjRljUll+ZBwxRcrZkvhDcr76e+hjJPzdWUsxsLa78GtOGSUWCm8PiYjGZEj5zqj/0P9C/QlgC1w8y5vvgmQCn3NKWtMHrOIfaO/GAYmML9idHxbQ5d3YrwqVfO+iBRtjoErWMy0NZekSzcq/FuYwuuUymDVnC2VCC3E/za//QNuDJuYY/QxP4L0Rmdp4nkSlPwqeUnIi8QXM/bv7SByoe
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(921020)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RVpJWERyOTcxVXFMSXc2SHdwelZucnRNRCtCc3ErVXI2cXFDSncrczNnUFlt?=
 =?utf-8?B?bUg2MTNzNTl5WXBlTk1WaVFDTmFuUEo5R2YrZTZESjRRY0tKVzNNNXVJRGZI?=
 =?utf-8?B?MlZ4bjBMUXo3Qk5oUzVXZ2ZhY3pWUmJxWlBZUXcyZzR2NVhWOE5lNzFhanE4?=
 =?utf-8?B?cUZxZWtvUVVkeFBvWFVKNFN5bkplS3FNNGhhRWFRYm5nL21YODQyZjMvRmdh?=
 =?utf-8?B?bFZGOUMxVHdjU0xPckZOa2sxOVZkRTJHN1pWZWl2SFVEdkI0aG1vWCtPNmRS?=
 =?utf-8?B?bzV6SWVjWEtIYlRjcVlpcm1jbHQ5MnYrem1WUVltU1hXZ1ZZMHBhU0NMdUdp?=
 =?utf-8?B?dWk1UGRVZnZZSzBtQzhVL1dSa0NOcjRIRzF2aytkNVZVN3RmcWdEaTNBMjVH?=
 =?utf-8?B?NHVkaXRQSExUeGoyNlE0ejFXdkpCNlpqazJhY3E1cFJ5cm1BcDNUZWJjeUsw?=
 =?utf-8?B?dXdyanMyOUtDcWc5SkNydGtVaWtQaWp5VWVUdHJ3dVBCOUluVTg5SFNnVTV0?=
 =?utf-8?B?MmprZ3YyY1dETlZEMUQ3allwb0VDVTV0VlhGSFBMd3o2bXEvM2NXc2lNSUtZ?=
 =?utf-8?B?cWlBdGlscnN0RFNJem9FelFvdWZEazVvK2l6KzZNRk9WdmNSVDVMNFdUc1ZY?=
 =?utf-8?B?bHl6RXhHRkVtWEJNK2xaNGNUTTRmcUUzRWxRVm1FM0ZQMjBjT0lRN05QM05j?=
 =?utf-8?B?bTJjd2dCdnJZZzBVV1pSVSs3S24wRWpzaDRCOGNKNjMxK3liOERUVmJ4S3Y4?=
 =?utf-8?B?c1ZZU2RtN25FamdUTCt1SFhUQUVhcjRyazRkNjRFOGNBK2JwMUwvQ3hmR01u?=
 =?utf-8?B?Q1ZUR2pkVkdBUnEyTThiQVdtM2x4blFwRHJBVUVWUGVISVd4L01ISWNVKzha?=
 =?utf-8?B?SlhLdElidDdQbThUVVVJVlkzV3lvb014R1NpN2JXUCtMUjZNbGxieitjWmww?=
 =?utf-8?B?R1FRcXJoN01kUWQxYmw5NmRZNGtPU0RwZk8rOXVjc1p1YXRhblFGOE5EUVY5?=
 =?utf-8?B?UUR2SW5wVUNwV09TT1RTQWZZSWQrU0hRV0hETTdhMHJiODIxaE1GNGZrME5x?=
 =?utf-8?B?R1B5RFlpVUdEQUtaNytXMHFMTkFCNjNNNzM4SmxvdndXUW42WE9WSTVSQ1RS?=
 =?utf-8?B?eFRXV2tKZUxKOVRjMXZGZWNnUnZyOTFmWlVmbG5NSTJxSkI2RlI3ZGZNMk40?=
 =?utf-8?B?YmRIaTBXSWNucnQxTWZybVpXa0gwakMvNEFqeWhZaCs1U3dRRUtGK29WWUJ6?=
 =?utf-8?B?QTI5TDgxV2lZVWZoQllIdmc2YkUzc25Hdk4rUG5EYXdITmY1dnp5aCt1NzVn?=
 =?utf-8?B?d0hXOUdNbjAzU1JKS2RJMjIyUWJOcDNaUXF2L0MwQ0dTa2FEU1Z2YkkwRTNO?=
 =?utf-8?B?YTFzbjJyTzlVTExvb2lPS2Yrd0N4bGZrQ3NmUndyaEJIMmJ5aThqT1lQaFJt?=
 =?utf-8?B?RENlSjZQMkpKYU14cWgxYkh5ZStVRWxtejhtc1ZyY2k2REgyVm9LVGRPa1ox?=
 =?utf-8?B?ZjE3ekgza3VVZFhkZ3NOSks3YkdmTkl6VDV1T2hqcmJISzN4dnJiU3JwTkU4?=
 =?utf-8?B?WHhYMnJFR0lXNHc5VkRQb1MzSktuMjAwUktCNjJYczJmRVViZmFqN1F4SldR?=
 =?utf-8?B?bmJ0SGxZdyt2V2ErTE1YaVRFMFA5K0k1ZFE4RFRDRVJjTTlVbCtNTnhaNnJq?=
 =?utf-8?B?b3o3Y29ZVURHc2djempVQ29RZm8vS0k0c3JZV1RLYllFOWFpNDhtUHMzN3lK?=
 =?utf-8?B?SWowaGlnYlduRjlkdkd2NUs4eTNKQVdtSjFXc2FFUUgwZDFjc3ZSNHBQbHpz?=
 =?utf-8?B?Q0ZUTm5vWEtFYVNhVDhYcXUybmZXeFJ5cWx1WGJyN3ZqNlRpNTE3YXRCSS9y?=
 =?utf-8?B?WHgwV2Q2dnhKbHlzMWlUVm8xdnJHbTVRZVl6S1pwd2xRK0lUTDVIQUtzMjA1?=
 =?utf-8?B?ZUkxMHFkTncrcFN0SUgwVFZOV292VStGRGNEL2FxRDhram84V3JDWmtDSkZ6?=
 =?utf-8?B?b0owbXIwZkZZYzNET0tMcEJGOE9FVHhLL1NpaHNpVTR6RWRVcDRPR3h1WVVC?=
 =?utf-8?B?ZUtZc09kOW8wYWFaZjdubHhpS2t0dHdrN3JFeHNUS0hYZWdzeWJQeUZNYWRP?=
 =?utf-8?B?Z1k0YU1vK1lyQlN6NEtyeGhJQVEzZ0RCTVhhREI2VzlDdVN6b2R2WXhPbzNM?=
 =?utf-8?B?bEpYRS9mdncxZ0V6ZjR0cWJyT1NKMzcxYXpZc0wyOTlmK1pzelIwcTkyeGY0?=
 =?utf-8?B?bGVmVndXeXVOMXhmNnQ1YWwyZGRvTEpEM21xWUhnbTJoMlpIcTBLdDF4NE92?=
 =?utf-8?Q?kTgY/eUZgIS8MYqK6/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785ac9a7-bf53-427b-432b-08de89b58770
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:56:28.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkB0zXhuCZM50T0Z8l4q60G5KrIVuCoT1hKS/jwhYgY9QJUQpjwFoTYev6wtiwd4yj1pH+xFLv+w7ZGSQ/3a7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10694
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30178-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,baylibre.com,googlemail.com,samsung.com,pengutronix.de,gmail.com,kernel.org,nvidia.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA968317B92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 04 Mar 2026 18:10:57 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.
> 
> This has been compile-tested only.  But note that all such masks were
> removed before from Renesas SoCs in commit 8b6a006c914aac17 ("arm64:
> dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3
> systems")).
> 
> [...]

Applied, thanks!

[3/7] arm64: dts: fsl-ls1028a: Drop CPU masks from GICv3 PPI interrupts
      commit: 7348e8d71c593792df4ebf653d98a576c04c851c
[4/7] arm64: dts: freescale: imx: Drop CPU masks from GICv3 PPI interrupts
      commit: f6c18c1c4ba574005d3b95faab0e8a3796cf3346

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


