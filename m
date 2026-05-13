Return-Path: <linux-renesas-soc+bounces-32541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFOdDEnHA2ob+gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 02:35:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E571652B923
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 02:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 560843041883
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 00:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841A31D798E;
	Wed, 13 May 2026 00:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DRt9ig/R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC181519B4;
	Wed, 13 May 2026 00:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778632518; cv=fail; b=td99mXBSsLFlMPEbqjBefzMYR/Z5spN9mNnHhi7owyZEDznRIreGLqcCo4ZDn17MR/a2EDnB5gsRtgCQ9C56VVuzaW1Ok7sE/0TZRkK9TA4+GPr2mAym4SkY4Z8mmlfBspDiH/6e+bKs/N1U72f2ZwPWeLZ5GucWh2ryWiyGhPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778632518; c=relaxed/simple;
	bh=FXIq2B4UG5uOOMmazvZwcMal+LuFWUtrMUfaLKq1hwM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ihr820jOhrJ6Iog8DlGiaYyepzQjyvU8DmyRysPW7MLB1f/KlWHcf305eXfbXspL99LSAWb0I84AXrH2wskLarjT9HpyGh+osyngJSLJo5VW6NEpRG3KCtQefnUOfjEC5+ga3tWDErRV5xol69+sTqJmp3pV2pNLdNUCnvaoub0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DRt9ig/R; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/v0ZikEMVdImlf9jQ23HURrTuMHPaPVThqhbfvZaH2TEjwB4MXIaNOn6KSFL1vnp4KdD11pAOvyQJMNUsQG81Q34XZIVwN2ygEQoXCt/PmBbdOdutbUon+xvlxTa6SZHWuzOr2E4aeCirfu2g06RmKdajDS7IVQRHkP4iz30bICAd7W/KGzQcgUa755BvfhGIUNXtwoadbC2UxqGM2kmHkB2Ryu2kDiUnQ2JJCb2gycTcqSeDXJ4D2JMjruGeZQ15qzrbLjrwB2ot/6cinCqt6ah0mxbiceWpeAI76W06i+U6xL9CMO537gnOP9d+GundqIi357yRsCvzwGlp/3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZKNmgEBaD/35Nxt/fDa7a7Y+4Ca00Na0bNSETJwjLk=;
 b=nk1P3Rbt30tdDCGLAw2Hs4DLaBV7zcbGfVYnZ1w068mEh7J30Y6rk3NB55DOBXcuqr09zEXL/ZJQFsBor9eCuAoVkCC44ZDBpw73xqbk/PKa5AsJA5TSiWWqkMVCqGjJPXsQPfxk9A/KTEdvs2Id1RNbT50V55VyjXM/V8vy8ih+4pk3fDtAOX67B+Wu/kUoRRxKVYKEJdB799zC9eytwy9H9QGl5heuUhN4RTmjvCJifCURSLb16eY5m8+YJE7anaA3m9TSYaYDmRvGcntNBh5M66Vn5ZBGpVeYMf3Ma/ZKSfY5NA3eSkY+zmMTlYLDwHLoh2tR7KKudTTLGdwA5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZKNmgEBaD/35Nxt/fDa7a7Y+4Ca00Na0bNSETJwjLk=;
 b=DRt9ig/RPnBHAlNcxvb0xiG9lPGlUsD/4+TmWXf4xdm/iuSohQLBBvJJ/DFQuO0uSaJCUBzPA/itrI/jeljjNMO+6umqC9GKddCHsCKOfcmbBaZnmLWbAp36SqReAtG0YlUDkUfF+WsQlAYy6+81xUPd9dm7bmvjDvA3urrTRm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10984.jpnprd01.prod.outlook.com (2603:1096:400:3b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 00:35:11 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 00:35:10 +0000
Message-ID: <874ikc6taa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
In-Reply-To: <20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
	<20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 May 2026 00:35:10 +0000
X-ClientProxiedBy: TY4P301CA0051.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10984:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b4b770-3fb4-4ee1-b65e-08deb0877d94
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|22082099003|18002099003|38350700014|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	N5nkHwTmSR75R2Dfep7JjOtRQAfIi6ebM6KZWOuqF8wc8yc7zM1XnlW0SPDJQSdRMikgNDPoWIgavdandWAG24BQmxCZdGNjjU24E43SaiOCUSXCjAWOIyzwaddM8xDliRCxANa+8/3AGSBnh6cKquDmwPN3AZAt3ElnWrnj8TbUqRN35r9PywfHuu1ziknM/NvsiqOAnZir4Jd6VoP1fXF+5T7HiW+CtT6zLl9qhujAyAOqSPWYOMmDt9AvIAC5bg+rVuAISTOr0kluZsZVfDQ6pEZMzHdhV50v8Rgn67sZ95RPOEVYJHmJiSaJFlVGWvVJzaWjsPyf8ZWcDgpPCOtULOKxupvBY8yJdPta4VoJ/0NjnlGK2jblDhNymucYWvdw9+mXTx8TnVxvNGWSV/GOyaSapAx44A5ILs496se0hCt9pMENKqBp40elSBuys4OpW8DRV3S9IXjARLunO+gD6xJ2V8RzFgDco5MxmrMbE21kl6b731BW/k/EZuYQ/4S6dyrQVzRJkpFc1S2n8LNhFpOx/N1c1b65dxRJ31rYmzwT2cRt0vmTu0MMWO5mFP/CKB7Ex/oPuG/RknVwnJSOD4NNqeYlx9DYG7/1e8LI0FnailVjcR6pB+IFYj6MaLRZnyrP5nxaRA5Mg4JlcbD7nUr/vreVQnPdFzAgoiOSr27SSZcv07NRvBgoMD8K3Im0m9L8lgBI3CGQ10Dmfbhcq3id68re8vFs/gN3zTZzIreML/y7cDO9ao3txHeU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(22082099003)(18002099003)(38350700014)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+AC6e4zljFLMgJY1gtzjDFbVq8u+zgmOWBfAi4nNGkKjZMOkJwBVfi/LABnh?=
 =?us-ascii?Q?dqOVkzjVXNS9Yb6DDWMH/28OYlXQrpN+IKaxY3nOuzKMiWI5QJgMQZAKxnX/?=
 =?us-ascii?Q?6ORlbLeBriIVMFJyE/HsnkYdk5SDObYRDLSfHqbB5n1EI8jL9zW6Sz+8nEyh?=
 =?us-ascii?Q?0iq9bdhzmHPlNWqi1cFthv8k9Q3wICWrM1DQHP0QAbHlRvIXtFibolf8SqGA?=
 =?us-ascii?Q?QfCHnaO66kBdbTxjoyyTOFYGC/RKl570LThejMbK+r+c5Q5mXXP4CpXxbDVv?=
 =?us-ascii?Q?5Zn0svL75snp28ookpQtaJfV1pUbzx5fX9Rq2JQFTMe8//c+XZMoxuAq5ayM?=
 =?us-ascii?Q?H9Ch1XQ/u0e+cl9tiVneGF3tOnV7PvSqJkmgJyWLAGlN1wysDk8dNmqxZJ4z?=
 =?us-ascii?Q?B78DI3ol0MO27U4F3wjzamHDnaBWyr9qstLelvbPuKXe/LSeuPfcE/8g4Y4w?=
 =?us-ascii?Q?4oWuVpRQlsloxNtmsNzqg9t9ik41Sv1KR2hdM6smqeO9WavIOppY1Szu6elj?=
 =?us-ascii?Q?iaFenRdsJm42rTYz6Rye2G8/vVcsoTFv2j8VWVr1SQRNTPvYnan8cKj4yqSW?=
 =?us-ascii?Q?Jyy99SqqPglC3Haz69v+NIaY0qgFTEjkTm6Ufs9/R2aOQmj896KSgtO7FGm1?=
 =?us-ascii?Q?vK1+QphgVrRIZqzz4ue+X1I5tlS8qBQgUN4pEx0MAdGqUE0Xqo89ftK5oaNr?=
 =?us-ascii?Q?6opKcEJ0ruEHACHim+rJw7BLCl319UYR1Nq/sjI2vd6rwSsMk4FNpSOfjjo5?=
 =?us-ascii?Q?cvc7AzeO7dN/2sNnB3Ji6uDeZS29uhF9fMPg1o/FVy6G914U8FZxqVpqQDzv?=
 =?us-ascii?Q?K2Jq26M+Yh8DPO/sFcmk32Zh68Av1dvZfh13KlU6VyNpiwWHFPvqUuRz0exk?=
 =?us-ascii?Q?TEwRlGZyG5ncprWuGoIZUFqj07SlK3rqw3yyMfGabk4ZlXnw3pDw4ceHFdT2?=
 =?us-ascii?Q?PV6t1ZdwbAwFZ6RbWIgz4RrNiCah8fRHJU0EMxgBSCZrdsE8tYwy8Y+MLbuQ?=
 =?us-ascii?Q?9fzI0cF9RqmPD+eYIiNFlg97T3WsL0FYepfNSI0Lh9xQZaG+poDwyy+jL3Cr?=
 =?us-ascii?Q?hIdTT0tiTqVLoyJAhzpwIB/RFcGCE3X0BkRBqydBr5xjd8bqgq7i83baKy0P?=
 =?us-ascii?Q?sOAIY7ST9VOl2gyh/J5lYTK40gzXSEHv5ox3EZoDCuSbhhEWCc8PrcJFk6Ik?=
 =?us-ascii?Q?IIbsEowi9Pk1166KxkKG8Glun2zxkThree194uefCWQ/TGjQqgtoIGRu1QGd?=
 =?us-ascii?Q?oxarv8/LhqpUhjn/BiI90mn1GyJCEIK4gO0oiMM3EBw7cmqGJXEFItWl8vBn?=
 =?us-ascii?Q?C4WRthoO1kPbQqLP4sFRIcY8UDX5GZWcSkHFqlLb6aJ4LlxMSNYyWoVK81rq?=
 =?us-ascii?Q?uIDGg9volXOxK5jPdq4qtLqnJRXZY3ZBOdB3aKz6jsAt5+Tfl6mbis16fVjh?=
 =?us-ascii?Q?m3KvuvLySjc8GQJmF+nTxXMtbSU+59rzr5Sv9MehN10NaLLtRFBy0X90J3Ax?=
 =?us-ascii?Q?7nvqSdDFYGtvl+JTHHOFGcKo3+J/k9Jan9v9gxGHwxGiaYPWWl2r9Kz3OtEe?=
 =?us-ascii?Q?HyyeVJy5kShaiiyneVeeFFYxBGk39Xp1g6DggKySpGJUwBF2upQbIwRTXpi7?=
 =?us-ascii?Q?kOV9Yw/xkoNFosqv1wahBid7vIUyQah8c6HCYlsp6k9/AmVGTWq15PBpkaGo?=
 =?us-ascii?Q?vWakrLolVLiw+umBCGLgF7fl0VMc8GlPsMHRSq/t+r0dRADrIT8BVebmdXbi?=
 =?us-ascii?Q?O6E9bjSagEfnFyFrXUkHE7emDeSktRifBB2iMn12Z2272JfWsm1v?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b4b770-3fb4-4ee1-b65e-08deb0877d94
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 00:35:10.8836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZBLEEd6XLH/RR/f3VL5c6tqvIOIuVxbqzv0TLeraCnz4/gaIZvMkOAmDWHk95zljiEO5QXRLSVU1FuxLUDvA9gOLHsnNztHqC7YisuZkIQ994dB5dxToemA0ynY1vYr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10984
X-Rspamd-Queue-Id: E571652B923
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32541-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid,renesas.com:dkim]
X-Rspamd-Action: no action


Hi John

Thank you for the patch

> Add support for the SSIU found on the Renesas RZ/G3E SoC, which
> provides a different BUSIF layout compared to earlier generations:
> 
>  - SSI0-SSI4: 4 BUSIF instances each (BUSIF0-3)
>  - SSI5-SSI8: 1 BUSIF instance each (BUSIF0 only)
>  - SSI9: 4 BUSIF instances (BUSIF0-3)
>  - Total: 28 BUSIFs
> 
> RZ/G3E also differs from Gen2/Gen3 implementations in that only two
> pairs of BUSIF error-status registers are available instead of four,
> and the SSI always operates in BUSIF mode with no PIO fallback.
> 
> Rather than scattering SoC-specific checks across functional code,
> introduce an extra capability flags in the match data:
> 
>  - RSND_SSIU_BUSIF_STATUS_COUNT_2: only two BUSIF error-status
>    register pairs are present. Used in rsnd_ssiu_busif_err_irq_ctrl()
>    and rsnd_ssiu_busif_err_status_clear() to limit register iteration.
> 
> Future SoCs sharing these constraints can set the flags without
> requiring code changes.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---

If my understanding was correct, this patch includes 3 features ?

	- adding busif_status_count
	- adding rag3e_id
	- adding rstc

I guess these can be separated ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

