Return-Path: <linux-renesas-soc+bounces-29357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN7gOO4mtGl7hwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:02:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 689282857A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4766732B45EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7352D3A8759;
	Fri, 13 Mar 2026 14:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UeZxnHgJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C193A8758;
	Fri, 13 Mar 2026 14:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413799; cv=fail; b=JR/2hD/GNyLzNNWx/bb3upT0XWR4nwiw2B7Y1t2UEPY2qekR1SYMHsnaxclzWbY+4jrvHSivvY1j3jb69t71ZC4YWd4SY1htw8TQAYO/bB6bWSmkuBERo43eU7DP2M7r2UNDt8HfX8/Rg8H2pnSlDNumgZRvL31DCpc97puNNs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413799; c=relaxed/simple;
	bh=YYgouJ0CmbCx9wvzIykjD7XzzJm4nJVlx1vtg/KlGu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A7KF+byIQ96K88Q7RfkBBnOC/EQ3Vo/G9NLIF27EKdovEDlVy+Q4x69brhUiDIN6ar6IDEF2/cTO5FO1PfiImS/QuVEzhbaA9sB8tJi9JZwRdxwMfX9U1ziFbQeLHgj/xLW9q0D8MFor6CkWcjywpDkH/ZMVa2sSx1e/l/PNZQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UeZxnHgJ; arc=fail smtp.client-ip=52.101.66.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qERAEx5jezYPrjjrCQlpnBdbAdjDv1XGUKley28aixOwOMpm94/bWx0Np7363rzt11fjZ+qs0oFywreV4TdnKRJlnbjisY5ovPL38omlfOgK/kbRQVIVvVU0CbMX3amKrZOUfOIXVaZxxfgqRsrWkVkBLhyjaC+rA8GvlK+ZqsOGh6WtY2htDYGm7Vjh1XmCvJ4mc1SOTk18foYbD82wa5ZdmhQN9YEImIJ0VCUZ2fe3xg97Jh9wtCOzR4/1dc4ZKty5dZhZ6InFdPfAkjcyV2BW/oTfDRy1+8s+tXqVO8Qm06OVD4dsTJH5tOlSlnHL6cFZznWr6QzwaFrGGPw9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veboGhZ3exR44ZZc0YxVjiMvl60oSLMYC8a4Rk2RFss=;
 b=SZTT7UeR7TkzoaLm9IM0kFsi+LDps5gr0Mrv4Sb3oPb9v3s+Pc/BhbPDB5Y5mPIliXazu05DsmbZUun7WuYz+O2yxyXeS/WPw7wuA7DsEEFZefY7QyHn5MyTZ1OhBNT8NWB7kFd2VgeNP+TaDgOv6IyupFcZsWW1E1/NrEcY6GCcqXgivO5hIFIKBqWvgC7MWhNjCsKPPOUSzhcxz7LjCv4+k36sH2//qihNCY35449P7S+0fLbO2xhH3Q2uCwppBBOvEnKplpV7tmd4Hp+oo1QxU8TMhDHHClkvjuMMIVEZRn+sEgcr9Pyagb9Yjnnh9fGl3Rlmk4iE2QnfI49n9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veboGhZ3exR44ZZc0YxVjiMvl60oSLMYC8a4Rk2RFss=;
 b=UeZxnHgJ5on6L4NVEZWdJ+mAuWnRadgFghnr6hL34Vvs5cWDWhTO3aNlk7r/xT+gkPKCw2/P4+mmC/7vupOlJD45TYHKO1a0RHQh9wr8MNcrGHs1PHfBeUxSTX4GQdM5ySRG3t2q06yJ7p4FqzwKuuza6yS7B8f/VAIsgVG3uO5bt65FI9Lj1Q9xkPz7D+laHpTd1JHFTvSkBEk5jx726c5EJ+DE2hSxsaEWU4gtXrpZuMkcjhv03sasQGzrMMzWfAgNi6P6uYmzTSFcwf5tJxV0RkQf2hZHwmRLscxq5av/Mko2grCt5GvSXdtB/M2ghVpyUjWUb5yRLfgz3HQr9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8632.eurprd04.prod.outlook.com (2603:10a6:10:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Fri, 13 Mar
 2026 14:56:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 14:56:31 +0000
Date: Fri, 13 Mar 2026 10:56:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: touchscreen: trivial-touch: Move allOf:
 after required:
Message-ID: <abQlmqTxfZ2s0rHa@lizhi-Precision-Tower-5810>
References: <20260312224925.186077-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312224925.186077-1-marek.vasut+renesas@mailbox.org>
X-ClientProxiedBy: PH7P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bdb1319-e14b-43e0-0cde-08de8110b679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WQ1zJQGcwjie2hDJUhMiYiRMN+CcmsEr5oIDpZs7SFdYWga2ItWwCMnaIkFLdv45zAiaV2ppnBpzNjjGcaHcMtfdFPiRW/zyKfQSIaAuWZInCz6nD8ns90J0ji3RS2jYvHOANKu5hc4vKJwRZUDhSgnNmnREXCkTd+OKikWzFhJCroNVuP567nUYeNn/udgA98Mj3uTbv7XPABKuGLHJyvhO8J4/cj9/bk1CTkwZDQRxxeQwcFItkwfE9ZwdA8Xhpo0OX544eK9dOlyQJAkFoe6IsbjjwrYXs8+6uWHArrbCxWwLVDsQCJYLFbUV0cc0vHR8bFOOFmh5/2vGQrXn1c3KaN5Z8E6YBAlaBVXiX6TGDoYiPeA7Dp4v1zi9sdgxNxJy65H+U7FipgTtjd5mFtsyc4YAZzHgpaSCBr68StZbbwJrMrYpZexwdCd6Gj+J4OgR98Q9a8E5faVr1eyge5BzHxe0nGcQ6lJcs7I1Zx5VaPL0WSeRarw9+ZGsipps/1pucduaJsJS3134BFJhdbn4kd1V+8RjZu10p4Ib13pfVMBn8lBjqH0cydR/RFQvcZkFHuMVWJsHa3rM1MWQ8xfuithVva8ZnTYlgrBPTg2A9RrPfTtX5qlH4bV89rz+iUaYtE2muY5MhD0tabFXtHY6EJuVujDRlLHBpVoR0vqbBBUPhiqfecLS6PSs91CuQ4q+s4Ju1C2k7p/emxubyRshiGD2rTfCOm60HpP6a0ddLhDiYqrqtLlFyRMLX8Oi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LkFGABkqPzPJo34XoiFWza4TWuiXoO2UDS8SCFRaeIyEr73T2tFBvUuYHwhc?=
 =?us-ascii?Q?wb7xvL1T1seBBz7pSrEDTQVMaLjE9yXiea5nEuxJgLtvR2pYUJZjNhWRaxKH?=
 =?us-ascii?Q?Zj9L6eYODVFN5CbWn5poCVw1CD9FcCn9cFPRN/wnGcaRqr3J0IPAwNeLu6xE?=
 =?us-ascii?Q?fsrvD2nCWGW76xKAYfJ1PD1y6fWHB9n3ZKc/rOz2DDlqNywQOoErt/xDIAZL?=
 =?us-ascii?Q?6GCsH8s1hETqKOanRIWnn7rp5/GoEQop3VlB6qeyGpOs/n1WIoS2/ZUuCBKt?=
 =?us-ascii?Q?R2x4ybMJUq8w/Wx4sv2vlfzDIcGRmyYcC7M03CfqkC5mdowq1ncJKrZLt7Vs?=
 =?us-ascii?Q?vdWtDEhiwZ92Xn/GLMaGrspVTb/FJCoNP+f5hpSVl+At8837MeT9dWuJNbo4?=
 =?us-ascii?Q?r7ERcv9VsBR3tI9zDpImYISehIpm6q0bkTzHgKYXNbeC3MCN0dlSZxkLHBoH?=
 =?us-ascii?Q?1/h+mkVCY3mIeyWNsNqAaxFfzvvefOQmzzh8z1yq7wratxOXwlzEYzELdu9A?=
 =?us-ascii?Q?/Ku3Cr/H0DWoEalNbR7iv7x2a8H7fZH3OcE8A1D4ay6AYzlirnJQzzrtJyuo?=
 =?us-ascii?Q?NODQKtIOr/tuOkfw/lUxMwgHSiUrgtl+jUZHsWsiMqBGaQKk9zyT15dfHnTM?=
 =?us-ascii?Q?MA2woh7J9oNapwVrFV5fInQR2SgCk6zAyKguQNURTqB3Pkxr3SypIDi+a2Bu?=
 =?us-ascii?Q?6U5XcSmLKzysmbHIbezjMM5UxX9v0G2V70y45l1xum0ncIZD8SceDI4aEcPq?=
 =?us-ascii?Q?Z+H/KclmvWfccH8/cUGBK2iWrm7D4L8ownQkFVzMaMS9/6s3dnSlJZBncYZR?=
 =?us-ascii?Q?u9SlJ06+rACekm9UlwRcK5ul5H6KLaEy2jj2FbK357ugi31iuGeZ1G1stF0k?=
 =?us-ascii?Q?qaAE+mhuce0HgwGDfnCjnQ2sXD/AQYVyQ6N6PhP9/o0u2GHVMNe/ItRfjdCS?=
 =?us-ascii?Q?0K+gov4uUHlCVRQIfAe6MXRI1eHGRpPQEiJoXPAPK8Ws1WfHBkRtgH7Tm8zJ?=
 =?us-ascii?Q?typ/bx0GM32puXicVyCzCgueImfOY8kC0/LuPeGB5lnh71EE3M7g0wSjpoDA?=
 =?us-ascii?Q?VGVR4c/RGg22rcHZKHpeRrf2stPdS+P8Mp1E+dw6IGsx/4Kvu6oLIXvSHMwq?=
 =?us-ascii?Q?/qtFykF4gB0GiGKokN37438yWjvmBtcS0JZEU47+pFMdgS0fY3WAUS846p9R?=
 =?us-ascii?Q?yKaPqxvO21sUfqaj/7gowG1egqP9YXfbz1RyoZNpFZT8UvNHYz7JwjzyHrlM?=
 =?us-ascii?Q?SllE8S9u+C0g+8arsWtDzquMsSeeAg1H5REg2qxdxYvBUvKyK1iOOT0Gtvty?=
 =?us-ascii?Q?PGzYdB404EzfcqTCM6urVgwZiSTyfMyECYwK0B+MRbWIHsEjBJvEOE3SPwyv?=
 =?us-ascii?Q?/Nhqsv25sw0jiQT7Nhs9H5XS8yXb3+TwQBwnnA1q7SqIdqJrG/YQaI0ef7YU?=
 =?us-ascii?Q?fEz3pK76eIWTBJvnuSfCSm8WQWWxdulCyF4681HgnhhUd//Zy6dKbNIeMAxk?=
 =?us-ascii?Q?LBzcbVoqr+kVEbtTIR2hxG4AjWV7KJJHkrfN8qLLNK7ljyrHMt4VskiJXgXz?=
 =?us-ascii?Q?015T3H+JcwOXYQqSrqzo8nkh8NuPjm6/rRnk+Lgzg3PnBHg6ycjFhC8UVJsj?=
 =?us-ascii?Q?ygfqthkGl3gEDoL5wG35IiwVL2RjxOIbQPFC/U3g5o6xgJ5Yu+O0Q6axg6pS?=
 =?us-ascii?Q?u9U+IFhiwBDydV7iFljktp1BPVu1Tp5lQN0cXQ5rdBopUpWR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdb1319-e14b-43e0-0cde-08de8110b679
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 14:56:31.6137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BAZamaOE3FofQAciRWdwvNh5WQjXOZftSk8MqX4MkN6GbRuQiFaHlk6+W+1af3uhhSbj7b5l+0X4hsP4wtqhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8632
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,noorman.info];
	TAGGED_FROM(0.00)[bounces-29357-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,mailbox.org:email]
X-Rspamd-Queue-Id: 689282857A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 11:49:01PM +0100, Marek Vasut wrote:
> Majority of schemas place allOf: after required: . Documentation

Nit: If there special char, suggest use 'allOf:' 'required:'. "Documentation"
is reduntant.

Just said "writing-schema.rst hints this order".

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Documentation/devicetree/bindings/writing-schema.rst also hints at
> this ordering. Trivially update this schema. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> NOTE: This comes from https://lore.kernel.org/all/20260117-grinning-heavy-crab-11f245@quoll/
>       where krzk comments "allOf: should be placed after required: block."
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Job Noorman <job@noorman.info>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../bindings/input/touchscreen/trivial-touch.yaml           | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> index 6441d21223caf..6316a8d32f39b 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> @@ -53,14 +53,14 @@ properties:
>
>    wakeup-source: true
>
> -allOf:
> -  - $ref: touchscreen.yaml
> -
>  required:
>    - compatible
>    - reg
>    - interrupts
>
> +allOf:
> +  - $ref: touchscreen.yaml
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.51.0
>

