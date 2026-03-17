Return-Path: <linux-renesas-soc+bounces-29542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCrIF/UFuWmEnAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:42:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4C92A4FEC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBB0E300917A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 07:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5323491C2;
	Tue, 17 Mar 2026 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wcuLZbyv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072A4391855;
	Tue, 17 Mar 2026 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733323; cv=fail; b=tFlsQSYhgyhvuJ0zEjc06vitCyDioDDaTA8qCrQpHR2dbB8FXE3Wp0tcY3fLPb/c9dDaUDyi+Y0a4kPWU1d9yTyI44d2XD+Cq6OuwiRLq0UfN2gY0Gl8jDWTTcrMphhfjDiL+yfEqi7vsyHJfNV4Acr2IUKkuGPT6PICNvFxQc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733323; c=relaxed/simple;
	bh=aDLogj+eK2WZNblHCPs8v+XrO6XbL0FmkUleMyi3q9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E0SX54wmM0R1wStCX7ZdKMihG61zyx1dkZr8r++o6fnlmM8cnTNaNuuXagfqoVjQiHTtQVXjLqbbIligdcZ2ECyC+FmYxtA/X7b8pbcrHI9ZxBxsMfZe4KO3kiZ4x7SG/ZSNKR0iMd2ktWAZwb5LaoX8yZ0EKuVUh0xOjxfuJ6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wcuLZbyv; arc=fail smtp.client-ip=52.101.69.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Drv2/c1rtFafCDY2VH4L3MIBdsRJo/kQY3m2oLEYiQrzTNmrtvpEE7swHjJxrQIVfdYnuZ0azV6xtzzJRM9yJTau5Da1jBX2KJAf+5jfitoTEyvQPVWiKlojtIAhKd2WLBxKefS5n0iUvUItMvOBuOtyoPBFTsVYnjD+1KA8frJpRLXPHo7pg3JMGhZroB9lpna7W7fvTVjE42LxM1HDMOaaYD6U6DwCht/bTRzBql61RcDjGwiSopKriKqVueh4450LgldSxwwvsH7Fe/Kk9y11DOz4mpTBHl3j09o3hegKoGvc1dzypKMz4vqFe+mkENHhsDwkI7yJDMRDjbItzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCrm+w3tUUlM8ch+a2wKJacmlL0DN83WttD+bfCoMqM=;
 b=JZG0HrRwVi78kXYn9ESJ8k5r09xARTwLVv94N75jgpdCPgxrofZZCj1ba9J3Hbth7ZL1HUEgODoJrht7fVpeqZmkx68umyK77ojbSsOaufkcP23wT37rlt8bVjxh3W9ehn8SUgZCQHRYvDyMas/7oUQlXvOruTONJ1Oh7ds+XeS0xIcrbfhlD3L6ASHoV19aW1jDqjfT6juVbzvODED5Vxw84JZuayjFGLBaXtQwDlfbOR1pGzaqWFkVOmDFlEkI5HUZBmms1cAy4+Bjtathuu6q6m0Ye9DFnKsApuzs+lNc9SmmxD5GRCror6+BKDzqaMP19aJaUjHhhU6TWtU2Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCrm+w3tUUlM8ch+a2wKJacmlL0DN83WttD+bfCoMqM=;
 b=wcuLZbyvZQ+8erg13MJr4+1LtiBMTitHpDbX/m3f2IeaKhDi0ail46cTLJHuvPqiUptsheEO+K6ehOF8PLgnH2AppJ+k6DNR88PUmJusWgxGXTfR87sIx5QVPlfDUOR/4zGRFc4p2So0CkSmNlVXadUec6R21r1SiiCpTuYzlQNW8uYCy0rU7OrOtWBw2JcYpLpeKAi9cg8WVRNCpJpHfsZDnI1+0VvjBmHRt1zs96vRy87TUTPkKR+sAhjFdXoRT1BZl7y1KCZFLV0tyQCnHvyR017s6g8hIPmvy8jj1cnd4ml5CkYp5qGB0HrYvrT56KdIvpnuESG86DQScRo1tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GVUPR04MB12169.eurprd04.prod.outlook.com (2603:10a6:150:33e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 07:41:55 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 07:41:25 +0000
Date: Tue, 17 Mar 2026 15:44:02 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 11/13] firmware: arm_scmi: Add bound iterators support
Message-ID: <abkGQn9ODanEVns5@shlinux89>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-12-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310184030.3669330-12-cristian.marussi@arm.com>
X-ClientProxiedBy: MA5PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::13) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GVUPR04MB12169:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a2f38b-f506-4eed-60f5-08de83f8978f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|19092799006|366016|38350700014|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	YIq6TrSqwAn9mNbVs5kX/WrJFO2oPyTvUhrRF/crQHvbIK29tEERA6UyfsLGI2+Hyt9GvZiVLUznKSaqaZ2FSZPNILUXYKVDNIK8zEUaj6JyclM5U6LUD+2tBnnfJuscx+bsvprV6sU/pYz5lZXcPgyAPGxlNU++UVrTIYTuTSfYXJyPjbBem1y0leYtf725rZ8UWjqNjnt34gUKkfsgdYN5Ii6kEM/PlRsEpPHZuQWIlCBsgURSFU5n+PEb6rgbMPq+gle2SPYRzq/YGP05axn/jHxVR7SMO55Fb4J42bJSrUtknrVFfWR1meUFLU1IU8EvGM9ybgBSOz0Lb5v4L+EXUhEgVVF3NzcY2vt2PdvXvU/TwHLOt1xc9vkcjwBK7LcdnCZAB/gMKdYC3hCLzHZ0bDUaIxnYwiKL6qfYAj9o+ejNeU9sikccXeIJkao7LI4exFr62NGJ1W4PKLuZsNxMrqPXOlCVusjOpqr3SwYGGAp96jxWJ2fWewU2Pw4spq/FOzIRlGzQVkwV+csTHhGTwe83mVTZctdf5ebszG8ctwMp4McGHQuHSL2NXVjOdsoWBxSAcPGUuXC/x4u43yHYP0y3dLCW6uB3/zRgrg7DkhUdWjRmKwas6+Dwl5KQdVQKLeycO/br+LfKvA9IqYEnLRGb+mS78/4EJ2qr/95s82AR4+gWwlDotjNh0OdvsSn1X5Gxak8BzAe6odYGL5AW3txp7FNZZXsLcyrikBkK9BMlvp6LdLW5noVMGbdW1mIrxqOgwJMxW8jUfxqoc0A0qxqx04OsMAy5yta1vnY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(19092799006)(366016)(38350700014)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wh29p9viSC0zFFsptlLKTecCnAGLFuGUK1b/+p3dGaik+CJy3I2BSSKAVd6R?=
 =?us-ascii?Q?8CPFTM7sJQGBKvqy+mFzK2yP17uVXBq8ZBfwRLUYJ7tbf8S7H4Fv3BloUbCZ?=
 =?us-ascii?Q?IqEcnajJ4aenhG+4D7jW2QBC2TpujTjz8YADXzrpCcgZXZ04qbVH6Iff4bHp?=
 =?us-ascii?Q?2Daywl8wFBRpwoK72DzQxE7trJ2AISMxOvREOBpIlUSZ2MNqnxQTGV5MXxLM?=
 =?us-ascii?Q?STY4gNTYKal6V38bFc268vf/eJs3CFA/LXDQ/2mL6OSfjgICjxOUZUrfNubo?=
 =?us-ascii?Q?uGQA/vV3yn9aZbauW4o73r0BRDghyBfLhmynaw/bcK6p9VbkVRhLInpwt/Q4?=
 =?us-ascii?Q?O4AG1UhHUBHI7b0Ch3jioOWyu5Lm96xM71Y9t5N3FM7zJ7SA164f0zBxvCGD?=
 =?us-ascii?Q?x0VONKssDyWYm6YQ+WUsQyV0hEU7NdlVYmr4GY5FubGgJNLIFe5SlE0E76P9?=
 =?us-ascii?Q?cwQdOfPXqtSPUsnV/UGIvhNGI4ZR/lu9uREcLILpdIqXCZ6b3BdF5W7xGdRC?=
 =?us-ascii?Q?JZ9rshshEG4gUmUe2r5xiWYjNCag47pMIK/7gsu6FgEusY4orLoxAUnZtxxi?=
 =?us-ascii?Q?d8cFogcoDpH4IREh97HN4ReF19ZyNFBUaMPTk8aacCI6Lau9/5sVvzkHocAr?=
 =?us-ascii?Q?muGDchbB2CoA2yjM6Rde/p36epfOZa1ZW9In+Ph3X5e0aBXKkKFqb8fIQAoJ?=
 =?us-ascii?Q?OO9IXhlTggne0/mYzqUoRIo+3UnWK+vrp6hpoep7t47qsrDwv5J0nh+WuK9P?=
 =?us-ascii?Q?YBFwc4GCqfLtPyTQloceheF7/q7KttvfMjjDgWfXby1iq3meauFIW2n03YIe?=
 =?us-ascii?Q?Xw+CuLiDGdgS1Et5FDm/f8q9Qq+oczTZqKdjdObSmV+JN0uwIvwq4ATLrm5Z?=
 =?us-ascii?Q?VaFo4k+7/ZWaImrko2uJIyGzVN6iaPnsqP2cL/xrPzSXMBIIw0eUiALqa11P?=
 =?us-ascii?Q?YxutuKsEPcbJZLq7EuRYmgJl5bpmFhPJExRpYKcFQU0D9P+tHHv+9qJRZKlS?=
 =?us-ascii?Q?lLgJc2YA4PhtNAxXEvTNS1dzpyvfTZrjIRErbQsNUyS7vxelV+YnqSlra8jr?=
 =?us-ascii?Q?Zry+FxM9HPIIbzaNzukvySQALUqXSw5+7JWdHhWPJOcIIY+KQKSLxQPz0NU/?=
 =?us-ascii?Q?IuZULe31w7ZJDgvfNzutR/7kUqJT6dCQO5CCEvIzp/BlCpp/TxdOodA1zT8N?=
 =?us-ascii?Q?EIvY0wJb4Oh4+ABHN2H2UY40fb0HbAK2GKiZVjL7UOhK0CVHIqqqMz4wJHei?=
 =?us-ascii?Q?oNqhC0JhAnZfqW+MNYC1uwTV2oU7n32s3KZbA5rE1L/u8tYWybxzDttY8RsM?=
 =?us-ascii?Q?0v1wpXzndPAasgnNBiwiIzbHz5Wg1ousjoJm9T3bt5D/C3hFJ8ZDNTVCBitz?=
 =?us-ascii?Q?IcHHFgj0Q8FFe+vwSiVHQyIo1ZtMBmaEPKugttw0rxb9lT8m6MhTTU2U3EBg?=
 =?us-ascii?Q?l0al5qIcBWZ0IuzbZxpG76Y6C2Ndh0os/lklKZ8jw7ziPMVMx8lQYx5A/N0E?=
 =?us-ascii?Q?kSXgAjhgsyfFEUXAxgbYMJ90QzAnxViBG+g7Yaqig9n4Ti/J4melRUmXhNPy?=
 =?us-ascii?Q?0tjeLcWYiwgU5mSyeEZvwoU0e/N2iC4LbSitJY69NcOoBntr393NuNgOgKAS?=
 =?us-ascii?Q?9WgZ8TSiVyvhVe5gEaatkL9RRL5LjNU4DA3ca7kGEx7FwWPvV92htpBU8jhx?=
 =?us-ascii?Q?v5JbmcEJmGpsOgAoINSa8d6E27zgKHX8Z0q1jo1+j3YqLzkLsrMqYgQtlL5G?=
 =?us-ascii?Q?EvUc958Ujg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a2f38b-f506-4eed-60f5-08de83f8978f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:41:25.6407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQRN0ZIYCcUvvZrIuwPvAmQ6oZstVSBOYAlLr2F6U0alhffmaBp4ErL1CT9YzojJ2KyTfUpDbx3CdwsRWrk/9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12169
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29542-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,NXP1.onmicrosoft.com:dkim,st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA4C92A4FEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 06:40:28PM +0000, Cristian Marussi wrote:
>SCMI core stack provides some common helpers to handle in a unified way
>multipart message replies: such iterator-helpers, when run, currently
>process by default the whole set of discovered resources.
>
>Introduce an alternative way to run the initialized iterator on a limited
>range of resources.
>
>Note that the subset of resources that can be chosen is anyway limited by
>the SCMI protocol specification, since you are only allowed to choose the
>startindex on a multi-part enumeration NOT the end index, so that the
>effective number of returned items by a bound iterators depends really
>on platform side decisions.
>
>Suggested-by: Etienne Carriere <etienne.carriere@foss.st.com>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
>+static void scmi_iterator_cleanup(void *iter)
>+{
>+	struct scmi_iterator *i = iter;

I see you use no_free_ptr for allocation,
Do we need to use __free for i or drop the __free usage in allocation? 

Regards
Peng

>+
>+	i->ph->xops->xfer_put(i->ph, i->t);
>+	kfree(i);
>+}
>+

