Return-Path: <linux-renesas-soc+bounces-33111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGZVDzPRFGoxQgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 00:46:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D67205CF0D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 00:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4116E30089AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91192322B8F;
	Mon, 25 May 2026 22:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EDKJyeD9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62061280335;
	Mon, 25 May 2026 22:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779749168; cv=fail; b=Tjionnm5KcGaZWDHmpBKPN5v4XQ9t9/OG5brta32oKlc/LnPUWP4Qvbfj2zR5wvbpcXncpxmXZJ0UWafws0vPC1kpuMPtgOBjvUcaLhKfOp41gzxMVHOds6C0XNRWgdocKLQ7j8Q5VeDKWl3qCKt0HZG8F6XT+cjR7/pQGFCeC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779749168; c=relaxed/simple;
	bh=pAv6JHdwi5EUuiyDHcFdF76rVR22eK70gEmmHZEGPds=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=U/nnJ5fmP1E4UG8ciB8Eu8qoASazojb6sBREsQuApUcRQin+lrgyHas5OKkttxsidEzcpog4z6wLZ9Q6AZGCsQA9ftfx9uMFwDYj+SS6piUGXV3NwnkATkUNJv8NXwjYmS2+d8r4HG9w3PUd8RLqLnmzOXEk6nEmn/mVdDMz/K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EDKJyeD9; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j81ii3NZMYy1oTF/O4cqpYC+fIS2hj3q69H4kw+2SN6PAvUoTUIxYdfZgfQu3X/4WdcTMEsWsG+Kuzs4CVVP/d+kVGwUeo7UYffahg8Ta1EB9G6je/wfZ8lWK3ZELdHwa4NeWpYHpTU+4EsUNyheoeH53ok8ywPR63dFqVh/d5rYu6bxK1/nPdCtP/o8zHkFoaq4qoVxS5NnrMzyHgvyoAbUAFTVwn/T8KuNRXGF9I+vb1EZy8RxtTbB5ghqZFPbvVnGAWzFmgrSckq+gMIrdrai+CADg4Wpy9T/PfOw+X4OSzUfPHRk1H6yAzk+9wLlriEruG0kqWeK18vFuuL8xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYKptlnMDIIaXXm0iM9UV1G04Jm/L9BWkOEPMrcDsxg=;
 b=jT5ngmKRum+irGqQ5UoydGsCUgqLe6mxeTUa1AWQeMmEBxPyq6Uc/2lHikhtC9UzMqD6J8EC+Nprtf9xTcGwwyBLJnBOJkAKxjohhYqD4nW4EJsOH2Q05HZXJwxk2AAiqhP/xm7v7klIKxOKLHkbA1Q0Aiiqp4xP0IORMf2wdzV5V8M5C8VOsWUMmMsNVWLBdHeIdkUnT4eRlZfpmqoIzuzD3U7vpdMO0jGOlXOOJilryXh2avWeZnFbNPey9g6XH3QuUHHvHPI+gn/ZpFxjCf2goZXf1unjpC8qLWbuz31N94w9qj720m5mNpKnB9darLZliP+FEWVM/C/JkKllzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYKptlnMDIIaXXm0iM9UV1G04Jm/L9BWkOEPMrcDsxg=;
 b=EDKJyeD9gQ/GU8T6qboMm+Vo2y2iQRhrbd1wnF8w6zujcREDFZGC/PT5EljvxmeEdWKAzHse5Pp8KgqpAJhxb6Btfb68dvE5eizqKgcCgXOAzHXdAlz3Pyb5dPe9pp8sjSAHtXCHnO8FkfUysnso3sG0esUcHIMqeKyGX9j6ahA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB10085.jpnprd01.prod.outlook.com (2603:1096:400:1ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 22:46:02 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 22:45:37 +0000
Message-ID: <875x4bjegq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/18] ASoC: rsnd: Add RZ/G3E audio driver support
In-Reply-To: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 May 2026 22:45:31 +0000
X-ClientProxiedBy: DM6PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:5:1b3::23) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB10085:EE_
X-MS-Office365-Filtering-Correlation-Id: f81f8516-0c78-46c6-dd43-08debaaf56f1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|18002099003|22082099003|56012099003|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info:
	zVF5uwC0BzgOBHX0qXo+y+yrCuDfj1cY1mz8Tp7PIasDBbg33Be+6bUw8vDjuLen6L8Lryy6ruly4Msq3CHC8Qr7RmAKfnUPZdKhb0vbOwwo7uciUEk0oyiuCEk1dknX2Z3g7wNLv6EQBlpTh3uEvmnt52CDnat4o0njkBeAeLI6eN7Pj3hxx5U04gQVfgez7t8Q/W8OYqwsOnY7m3x8p1cmu3KOHlkAOCSG8Qx38aNHC4/SfMYHDV7nBqprcVIA7rotERiXhk5BVMf1GdNoO/6aBvxCO9q1kG6hCtKm2fjlvYL4iOTozrOzFFzrpxUEDACexXSAfLWtqpjqgg4sqxY8YPAe+gExy9VeSjdtRmcnPgLUwC5XFoz+KTGWHkJ5StdL6cXumMni7jyWHJBPuhT69+Ff/KRkvJChr2/gUG2oFfSflnW2JtiYJkWYoL5NhGfgZfa9BVQFKGucdaKLd7tOTKguPk8d0InxjfozrY3LlqBbPI7LAoPycS+IUJ1Vjm5fnWOet/sR7gjsooj7O645A1Yi00j7eslh9trLrDxrv437o3vC749AF5J7CvI5/vuXHHyp67PhkZvdkkoiQkbvGbtn7FftnkfFJWeHfgQCSeKrISsT0FNOR8uxQH4zMp23tbCqfZt00ySP/hnrZIbnE+Nh/PbGzeT4f6QOKevXI0qqM/z9LC4nMoQIxKpjGyGqXrxAbEU8UebLU+leLWJGDaySfmPRypWLP34JOR+M3Uu3Cny/3eDKEeJUxvIs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fIUfKp/k0GjWfcXwNysITJWNztAro/40bmt6N1P2yRhUbJIZ2DITC0ZBlZAD?=
 =?us-ascii?Q?IFwzvQNbMNKTkz7eOoz4RK6GVxbs9pwuJ2WdGlFYmnzM5FF+C695oVBIUCmx?=
 =?us-ascii?Q?jdGOX3oFrISeEnMSrTq1ZovDZ9RQINu+Xp00xdSMpSv2ClmB5zVTkTb7Ni4T?=
 =?us-ascii?Q?nMCdQ2+mwjwqLdg1tDCwtA+3VaJwfUOApDqF5ztSEZXNDHQe40wpFlwyU+An?=
 =?us-ascii?Q?f+LrhE9UEWIBPomjtQiOpsi6CCBn4YDGnANxDefcLeaLcLsagRFrc4WqLf76?=
 =?us-ascii?Q?82TyP5t6uGs9ok69KZ/14QPx5j0hObK5t/PEWfAeGUqdihm0f6rz+juG8zwz?=
 =?us-ascii?Q?ukzoCL+SeM1mV1zmUbDbRZIRwPzdABUS69CyNiNYiXROlz5hwSgv6WjfKz1L?=
 =?us-ascii?Q?M+c4cGycCwSijCsMYux9RKoei/DS5kD1UkNAXcKqz9yYxPOH7hZTktDe/ruI?=
 =?us-ascii?Q?T2bvaoUm9t1JoMzwuI7nlYsA/OLfoxMHhiMSkfPoRBg8YG0Vrvuwb9jnoMbA?=
 =?us-ascii?Q?+u6x8TJEOF6YvTkn4yNq5E/IbJLqRreRL6Ko10KQJREfx2WX7ZxD8pIzxwBj?=
 =?us-ascii?Q?TGvUZWJUIEf0NdeEEURJj7A137Kz4OAqzkANz3IYyUPsvCk8WHkfM+H6XLyS?=
 =?us-ascii?Q?zOborJ3x5S/gaQgL5mBzXpWH1fcTZkI7NRkCIKlAfMBHJIVbLErAo0DtkRK5?=
 =?us-ascii?Q?0daytEzdpYxb7g77xWaiMgim1Ahv8wOkKQQImBZVhcUOP2DpDU2XNbj6T8Oj?=
 =?us-ascii?Q?zjHFsyiWE3C78qM795KfVqNXzn8a4tVTifVwIL0McLBxLcx467DUcDla6HnZ?=
 =?us-ascii?Q?K3f5nIu2CebnkcWWVhLdkHBY8WVZDvYGOjxUhcOGijbla6twoMrcE5U+5R/w?=
 =?us-ascii?Q?ifpbKT8bdBoD6sZaNOI6b4Ycdg3V1FT3u4Q7yNVPcKovQHBL6/XZEOP92lc5?=
 =?us-ascii?Q?J7qit99B2ZvvRVQ3qIi+VEDdoCsCTQhjiTLIXMbXU2FXBuwpXx3pA9KSj/PM?=
 =?us-ascii?Q?G96SNEnzvnI/ay9rkCT+iWYIRTo/z2I1xDBjP/oC/9ALlRvQ3OObfgWiSZA5?=
 =?us-ascii?Q?GHdUCopInY6K+0pbKhYQFTIZfCwtlUw4ObpcuT7u+rdSDghg/3IP26VlyVPu?=
 =?us-ascii?Q?t9tfeI61OJPUmP4sfsO8y7j93I6XukvJR9sDxeoVMdBkmTL969c/L5faM/6j?=
 =?us-ascii?Q?MdRH565+N/muuXxbIBRA6zokmBk6+7PTqPrr93sqyfMj4DM6X2YAlLNTy2dw?=
 =?us-ascii?Q?JQ/JLUAT69NsrhLZep7ePMNRgJKWzeWvzmgEGB/GW3g/kMF7tGbT6IQCoRY2?=
 =?us-ascii?Q?mgvRh87qfiC6CQD4A3dly4ve1drMJq6i8MdShnr33BspT22tDWMAe2gNh1WE?=
 =?us-ascii?Q?fvUHXNubc6JZLYzrsMSQG5tycE/KHrmHMRuZYpw/AYOhKZ8cElUcVfa98G1Z?=
 =?us-ascii?Q?UU7Zp6Zw4Q0BkHZ56TZbZxVA1628qHIhh/zdbs53T1C2NiwuvYmyJQywLJw1?=
 =?us-ascii?Q?OLpk7+TT9eGh3wyGz1cVcAFLiJmJbRMWT/FATIG/YnCzBPLKamGbRBPG1LAv?=
 =?us-ascii?Q?0ZHbzRNWLx8pGj7s9TpQWYzF71fdq8LyM0uVnesFkWBI8d/e84uzibpvf9Jt?=
 =?us-ascii?Q?XJ/GU3YHAXcngl1jqdZeU4xkdTbvh74yemzftZemzKzQNqCqh3KrDJBQRvJW?=
 =?us-ascii?Q?18gSHIvgJAWVnxiU8N9U92D1ZuobY7wp8PqGFYwp1MxETDBdJYOKMzS86FNA?=
 =?us-ascii?Q?z+U+flLRJKUsMmH4lRevjwNZ6vGZjjhZKHcQj0+6v7mblyA0ZnUJ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81f8516-0c78-46c6-dd43-08debaaf56f1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 22:45:37.5249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ohavghr0z3l1R+1nBNMxlAbzlYQYOlyH+OXIT/7QvBgNeQ1hl59VdZPZ/dUMYcSHRySnIskhoE9A5r2ORfZ6NOECjX497KGG4cTTAtCUXTrsFZh/cY2pCkBd6rIt65hm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10085
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33111-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D67205CF0D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> Add audio support for the Renesas RZ/G3E SoC to the R-Car Sound
> driver. The RZ/G3E audio subsystem is based on R-Car Sound IP but
> has several differences requiring dedicated handling:
> 
>   - SSI operates exclusively in BUSIF mode (no PIO)
>   - 2-4 BUSIF channels per SSI (layout differs from R-Car)
>   - Separate register regions for SCU, ADG, SSIU, SSI accessed by name
>   - Per-SSI ADG and SSIF supply clocks
>   - Dedicated audmapp clock/reset for Audio DMAC peri-peri
>   - Per-SSI and per-module reset controllers via CPG
>   - Unprefixed DT sub-node names (ssi, ssiu, src, ...) instead of
>     rcar_sound,xxx
>   - Hyphenated indexed clock/reset names (ssi-0, src-0, adg-ssi-0,
>     audio-clka, ...) instead of the legacy dotted form

Thank you for the patches.

For all patches (except DT bindings)

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto

