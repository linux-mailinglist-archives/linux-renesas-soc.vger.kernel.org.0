Return-Path: <linux-renesas-soc+bounces-30905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ryaAGE9C1Gm6sQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 01:31:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AB43A8309
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 01:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67E4830094E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2026 23:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC9E318EE6;
	Mon,  6 Apr 2026 23:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="k/nEQCHc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46F3BA21;
	Mon,  6 Apr 2026 23:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518284; cv=fail; b=c7wDCJmkprI5U6FaYCwTb+mkq/bv0EXRwXg5CaInuZ1SeZximYhLMqA58MDTyb9eZwBoAglp+HOPriCNQnhu92TPPhxE3rJqP0jGPLzsX7GYf9E3B/eKF7/hzvpsK5o9zKcFjXMMyCaoIZJGCn0LmVLTh13atZEzpN+1t7U7Hes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518284; c=relaxed/simple;
	bh=ZPXq4aKi9pKnmwJvHR0G5VjfpgEB75zk4QKX6IgRc0I=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Y9luivGlkmORV5AWqj12+CJNm3e6m8Fd5EHjFtsqx+Yy8ewImsKH74GwTHQ7kmnZ3mGxiN/Y7I2C4UOG3uPCu5nLp4bqB5kIvlqTfdosGDn77DudmG3vfws/liPDH6rVGVHWfGVcr1rqAzqOU2u7HdDINhd9EJlztembpFttCQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=k/nEQCHc; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbaSjwxsiW7DA+wOCz5GMAvyhhEi7Y/dBTG7grjFcJG/bYbLHcLMkL77nSwUiB0hf0HQrEp6xWEAQqSGGM/U36UozbGGdCA4ka7GHCJLe4cJ4rRlNYQnsmNAxkPasITnf5esxtKIcyu+Ia4f+leEN6pM49VV0Vk2Ly61QJxcDwXVrNkdaWqqOq6SkTE7ULY7pedG4GrfejeMu2t/ckeSPM3RebAta7CCP/FF9zOwHC+E10mcRefjtVMiPTYEaXCxv9EWFHYxtFhqN4y1OIrKYOCqMimj2Ut/DHcLZ6CwWJA5aObzQHMjESNn/P+v6TScz0SOlwBX6eo26CryRFwQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWSuwxtnLi4hfxkx2GxBUVY5Yt71pUktUYbpJ4EBCEM=;
 b=RR+xnvg+8MqhV73ZYr/t/CfdI3Wqq/iSUcOcsOaiM5WkE3Aertehxs5iTHphYJr9hU60MpLB0kRLasO9pF0Vimi54tz6oHvRRN+OrPEp40geWTlf9LiY2Q2UwF0BDH03tWL4djRaPjEqw7WLoztsFpPBIZaKC+lf4B0aTQnx/spueCXF2+v+wgNg3nXBoK1oJjOf1qQ4AQrjivvd7FoNl9dSrii+7d3IPP7R1buKbmMYq/5EiaNwcQY1MSZ7/5NwSN8jHtEDpHlZciF7IP5bEtOt2tSiSQsulBpVD3DBmYZ4UIK7Z+8q7uLaoTk/eqc4kVaEea5E2V8ZiBsawbkNmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWSuwxtnLi4hfxkx2GxBUVY5Yt71pUktUYbpJ4EBCEM=;
 b=k/nEQCHc5YW8O8XhRzYmFGQ7Q2Q2YmOsPAoii8g55QK8rwhz4clKYiaumzjrItQAeiYQwHXXy1LdNdrE2gj3d9MOpe9Ik1nWN37TYt43nK3SixxtugXMxv7zHATE101jkBN+6RYjdhK8Pqs69ONhrS4PKNr07hXqRRUl82w5AI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6851.jpnprd01.prod.outlook.com (2603:1096:400:b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Mon, 6 Apr
 2026 23:31:18 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Mon, 6 Apr 2026
 23:31:17 +0000
Message-ID: <87a4vfu0mz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
In-Reply-To: <CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
	<20260403112655.167593-4-phucduc.bui@gmail.com>
	<87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
	<CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Apr 2026 23:31:17 +0000
X-ClientProxiedBy: OS7PR01CA0303.jpnprd01.prod.outlook.com
 (2603:1096:604:26f::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 134a3392-2f40-4aaf-aa5a-08de94349a04
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7416014|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	rRbI12iqtfuGLVVSb98/WXSNvYiBC9eGRvvMyWovSbasFYiGpXuypcrJsP8wIrpgPHAzA+zSmO/oWXwMNA6go2Ux16j8EsqoXMEeOeuZ2ApWc8L0TrI/FlFQmAri+7TIvlc+z1sxrDHSpvH93d9FK2QtdmBlPEGLnx12ox/4T/rmMcGPpPSULCaZzsOtJM3AOjrSk3yD6zrSe3Uz3yVyMY+ceFplpdy33YalL3Eg4hLOaVdp/kCJgsar27dmWWdWo2rhC79k6mp9a57tkcqmvvdT1W15+crOzaK8gJEOXmsW08EKr3hVgf5Bad6sYXVPX+QseU2aX6TQw+ERR0KcXpD/d7ZkKq30DcJFNuqi3u5Dcm54nueie6lcUMXEmSVpFY0s/3ftkDBAvpKWcOZ53JKpMYTwIPPBTGjFUzyN1Mjqgad0rtbm9lYuVeHXxQtB3ebYV3H5hEdDfcuNBQODrZdIxzC/ECW2bFdENqkZYAnL7YBcZksJO4jb4fkQjyZYSLJLXhIIxamaqm+35Cas6j/b5JLS1QOsZm0qgAhNUyTSQBewub9zQXPBmrpNgj5CCVGe2s1BwgBNFVo5qPknirB6dkTpe2I+7VZwfGAkqf4RijwFOu2vM2bzpSrGwHSzqYn71/lS5+7KiV8W7kcSdwBfSwoh0pY8HUEt4nvMhhktYGM+RINHgBNDatngR0x5UdmtLvMWV/fbuEn68D73WyZTa6rGQzsxv70KUa2VET7xlWJiniVKg3/rWLItNu8iKFTsf2by8oIcenW9RQlcsERixoViA+XY9JN6Uv7t2NM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7416014)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tlM5qhvrxzCfAfBcUkrPC15wjsnkBdWuj76sdyV+1vVwTTvf9ApMrkFJE8M9?=
 =?us-ascii?Q?iiTfm71VcOjnSOwe1x9PuEH6GgDW07ly00BIvpE7iByQaososXls2ySGDjkQ?=
 =?us-ascii?Q?Fh/0RjKuGb6DlhAnLDuo6CRehoxIri3ax6XQknXyrwdvVqK0zpSkRzlLQrf/?=
 =?us-ascii?Q?ooV0Go+2iCTH3jQIeppb8c3rpMgasiXgQYdmCoGtLik2B2T2zI4VZRldZZB9?=
 =?us-ascii?Q?mr/wXWBP7VT8VFSo6eTnzN0WoKOup410mWC6GdYKoYDgCDOPZ24mcmdLeCsD?=
 =?us-ascii?Q?3SloQtNdNfnTJ0oSdO4QP6t0cTEb8bowOjMszsGFG4wv5anyoEurAdkB6/I8?=
 =?us-ascii?Q?Lhf/7kc4F7vJfz2nQNeI+uHFz6UVc0jMrGNTKsg5RWViBh/mE7r0oiuddMr6?=
 =?us-ascii?Q?7ayoJAf8QR9lvk3YJRhLtnVUREj2AcDeFQbKfu7tbsxCKMCHIjVNvQZIoEwl?=
 =?us-ascii?Q?r7uHhnsXZTSNAYgCGZQwddAIzaeEx2NsuzsOXXH1tBp1yE6m6Vmj0nR+ewWg?=
 =?us-ascii?Q?iVrL6giZemoq7Egm3EMC6Ifns6uXfWX1JQUdc+8rSrki+ykkW3CgnnVcVb51?=
 =?us-ascii?Q?PhY8IFcxw+9mhZmzsfpVQDea9jl94L3mpBoMZ0BTMOePRrzwUDmDboq4Gnoz?=
 =?us-ascii?Q?PZTiFf4VFAAQK9A8THyo9Z2OXgNp8xFAfvwyxJmu6rXNC2Ih8AUmXCNPv4Fp?=
 =?us-ascii?Q?oXS+Bgd2ucwzCiiKFk9pExTqD+VZrF8mnCGb2vJFm+K/i88CXhsfQmM8gaSQ?=
 =?us-ascii?Q?iL1tC+T2yFnG6Q8Xd2EjrZocvKVTjCye+qvKtF4WHb97OF3sWhtdo93dlAgc?=
 =?us-ascii?Q?W/mnmnlq03HYE2c3sBlg899R1XwRHRVM1h/2PNGhWpuPy5zqkWdoPBpYQWtf?=
 =?us-ascii?Q?2flXyH427pNX2vd4oAMEODmmfkVfB6YVqh2xjQqsp2VJJa1OWYLHPlOpPclM?=
 =?us-ascii?Q?UYplCazME0zTfpHLc3NJRqBDdfHQtE9iUvp2xU8MdAIoU98V7GQGOnP0x1hb?=
 =?us-ascii?Q?UOtnGqEiJQ+ytAN4Qgk4nqGDd0TCzFZyjwlPyBYfPMox19cN8qYBbIuh8YOf?=
 =?us-ascii?Q?/RD4vguqtkYT5M5VaTbZZq70KZp+YWFqwX8Ps9z7U7OrPie5rs67JU+OVtr2?=
 =?us-ascii?Q?MoTTBWTsarWHhWlsp2Qhdd4FpOpn5mhSRQZk00vR5nXuEliR0yFvVvnlEbET?=
 =?us-ascii?Q?LBt7dUrHk41UmM23pW/z66w+Pq5d+ZbLHd9qU3IF9XdUBxc92/Wm3b73Ss4v?=
 =?us-ascii?Q?DG78YNNqbTIlQtvukMKJdkuOh7BubBB+WFcMEBuxUCbovB8r5gbIFyQnLy0E?=
 =?us-ascii?Q?v7YZfrIR7ymW4YlO2PVOVY7Mq9JmLtWzQPUjVyC7TsoFl4aZjtddQoSy0/4a?=
 =?us-ascii?Q?q0ecystnh0vRlIfI/CZe9zUta1Na5qIdQrpYW5qPDBIfS3jicdaL0ShFqdUZ?=
 =?us-ascii?Q?k2q8jp01LtwOTDvnWcw8ZKKr4EBMDbztrAnr9Fnw+pcFxVzHmG8FkcM/JKAF?=
 =?us-ascii?Q?GWMHGTJ62Jscgik0u0bVQQ3nk5K+kDP+f7YnYksPWjL8fcH3Z0EPmfxgRsk0?=
 =?us-ascii?Q?Bb5SI8wHlt8D5RgWA20dT39+cIm67lf2Q3FI31ILeMtg4MCzmLPgBP554pWT?=
 =?us-ascii?Q?x1Cg369vaJgRLX3XF5Mos2SUqvPb5sQu/qtVQDG9Sg3GSAbPvvKB1L438yv0?=
 =?us-ascii?Q?1xLxM+/scxgg72YsPL8r0hq25IqZTCoebdrslXwaPl1qQdHgO6pxNiQm34hQ?=
 =?us-ascii?Q?2ebxkhWG7h1JFd/9LO6xd1s/ZHl8cKxFE/8mEMR+uAJ/lx58K+D7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134a3392-2f40-4aaf-aa5a-08de94349a04
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 23:31:17.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lO7qxbe0VT1c3ukJPIxbbAlKAfxlWonBuY9EKVw71k27NVZYv4WaUrNoGjuKY2n/VUIJogQiRp/sDmAMOMQeR29M4RtYvWnqyLIFr6rW3pDwcScg5JyEXHGoa+u+f9FC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6851
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30905-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C3AB43A8309
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Bui

> Yes, enabling this clock is essential as it functions as a bus bridge clock.
> Currently, the SPU clock is still enabled by the bootloader. In legacy
> kernels (v4.2 and earlier) using the Armadillo board-file/defconfig, this
> clock remained active after boot, allowing the FSI to function correctly.
> However, after migrating to a full Device Tree (DTS) implementation,
> the kernel's unused clock cleanup mechanism disables the SPU clock
> because it isn't explicitly claimed. This leads to a system hang every
> time aplay is executed, as the FSI registers become inaccessible
> without this clock.

Thank you for clarify the situation.
I didn't notice about this.

> I previously attempted to manage the clock within fsi_hw_startup/
> shutdown, but the system would hang when stopping aplay
> (e.g., via Ctrl+C). This happens because certain cleanup operations,
> such as fsi_irq_disable(), are performed after fsi_hw_shutdown()
> finishes. These operations require register access, which triggers a
> system hang if the SPU clock has already been disabled. Therefore,
> I moved the clock management to fsi_dai_startup/shutdown to ensure
> the clock remains active throughout the entire lifecycle of the stream.

Hmm ?
fsi_irq_disable() is called after fsi_hw_shutdown() ??
Ah... is it because PIO transfer ?
I have 100% forgotten, but FSI doesn't support RX DMA...

Hmm... fsi_dai_trigger() seems strange.
It seems (A) stops clock, and (B) sets register after that.
Is this the reason why you get error ? I think (A) and (B) should be
reversed. The balance between SNDRV_PCM_TRIGGER_START, and with
__fsi_suspend() are also not good.
If so, can you use hw_start/stop() ?

	static int fsi_dai_trigger(...)
	{
		...
		switch (cmd) {
			...
		case SNDRV_PCM_TRIGGER_STOP:
			if (!ret)
(A)				ret = fsi_hw_shutdown(fsi, dev);
(B)			fsi_stream_stop(fsi, io);
(C)			fsi_stream_quit(fsi, io);
			break;
		}
		...
	}

> Furthermore, my testing shows that using dai_startup/shutdown
> eliminates the need for explicit Suspend/Resume handling for this clock.
> Since the ALSA framework typically invokes the hw_ callbacks during
> power management transitions rather than the dai_ ones, the SPU clock
> state remains stable, preventing any illegal register access during
> these transitions.

Basically, concept of this driver is that power/clock is enabled/disabled
when trigger() was called (except suspend/resume).
While your testing may be correct from an ALSA point of view, but setting
configuring it in multiple places will lead to confusion.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

