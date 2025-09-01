Return-Path: <linux-renesas-soc+bounces-21099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66086B3D614
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 02:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2881D1733C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 00:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6D415C0;
	Mon,  1 Sep 2025 00:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AQH5bMuj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A492A31;
	Mon,  1 Sep 2025 00:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756685169; cv=fail; b=oWh6A9M+mo5/VBrvOqaNRB+l1bxIwKeuag5NtVU4+Vdql6sCFSVbxbUbM/5HR4UBJ7hyRcfhkDv4F5KfZUR9j3y+JIu8jrF14eX0gg9iTwqSE8ZPP3UF+X3kkW8NyVItbk03lMy36AOLD3RDobjKNKtD25j+jkL0+5CbOX12Ees=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756685169; c=relaxed/simple;
	bh=G4PIIUGDAWfAANycMvI5llsZH9UGm8erusij9ZYH38w=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AT7elT4EjXYmDtnvJQvZmhKOqVAWA5VpK+SD4piZsE+mBWYGzXItN34AvEWeiycT2vlI1M2aOgLxufMkhNtiz1ZaSb0bJYEyjHtT7EZ5x/mL4Dihxa4wc/pfDuw8E9l3GJbnnWPyjOxkcLicfxZECjPy/Mtt6iwgqbFX0sV8V6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AQH5bMuj; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfBURRf5ip5UiorF3dFw596aslRLP33oY3AMePT5Mr9QJFtNoOEAkz0q8hFMgwcV7bRxC5tFDpWod4fbPojDecyTOvyAa3eemIAKvQUciCwqYA6X0SuEKQH6mdlnLtLxmL1s1H3smX+GWppv8t9u+PloDGxwn5C33dAFdHHiyQnuUnaGdFlpA7HuWPz+cwVU1CnU5RPXuOfScAwx2tfIg1TQS+Gs+sYwv3IO6EewnGXKJkLrLa2FNEOzu/LgpPorIpZ1zls+xab1qaBMGIXh0bhTzYe1uFcxjBlxRDUpI9zuljAhCSW0ANBfy8BImP3pyqZu+C27KndIRFWVne96RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EpEFbz/ZH+dL+oeZEUkdcP1HeDHj5eHH+nIrXwTYGE=;
 b=JaFx8WfVjWvDUqqn8It47EIN7oEznPrcBcrX1oohWuOFHqQgcTbJ8bW5tbYxvSikxnZCjNhKuTcs3P7hhIzoagNcxN4ncHZegowKIzEKkus5f/POseqBOnwBKWCXtUnPBBKff9G0WYRpaUa4RV/MTeH9Z2+VfDaL71oU40R85sXHBIZFw3RrBDc+Jmudal8RW0bUCcnU9L5e85IgKfgJl73IZDF5fDpEioTH6JhKzf+bT8QLVw8z21hSpCxdQO0susJz6mhcj5Dn13gNGIzqbK4qjkx5Zrac6oFAhf+ewrsNa7i4RN6n110GbXJlOEd/moPXmGOh83plJtlo3QKM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EpEFbz/ZH+dL+oeZEUkdcP1HeDHj5eHH+nIrXwTYGE=;
 b=AQH5bMujdcNimBOsJVGolCSI+wrxC5RnaQdsuiuMBQJgcN1ASNHORaNiNBpBQI9DMuV9A1pNl3DroZtsARr3YtV5dQqhi5LCqZwWv3IOXgkkz1WI8hgK0GjAc3RphE+Vx4ePwgMchrirnkulilXtXr1ZBuRokExFREkhdyOtAk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12976.jpnprd01.prod.outlook.com
 (2603:1096:405:1da::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Mon, 1 Sep
 2025 00:06:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 00:06:02 +0000
Message-ID: <875xe382ae.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: soc: renesas: Document R-Car X5H
In-Reply-To: <20250828-platform-counting-6578d06e3526@spud>
References: <87ldn4uyof.wl-kuninori.morimoto.gx@renesas.com>
	<20250828-esoteric-vivid-raccoon-a86c9a@kuoka>
	<20250828-platform-counting-6578d06e3526@spud>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Sep 2025 00:06:02 +0000
X-ClientProxiedBy: TYCP286CA0172.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12976:EE_
X-MS-Office365-Filtering-Correlation-Id: abd32a25-fbf2-4f32-ab7d-08dde8eb567d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YTfiVbnQcsOE1thv0n9g9LgRRMfCJKjFtUznuUKIRD4Bks1J8WJ0rnMtcO6z?=
 =?us-ascii?Q?ZrRM+ZvX43TIT0F830l8hp6DhJEdM0pgJCX1iLWkDRt/2o61ODvnTbX/yr/y?=
 =?us-ascii?Q?pqkpFHPEs9IdeJc8UnpC+pZLhzpL3h12mPNt0OEudfVLQI6w7SmKDzkSduIf?=
 =?us-ascii?Q?PgMpuS+vniPBvQgihVSyoBRAlN50UCUsvLtcGtzSZGBV1l6rI2vrKhdOqVCY?=
 =?us-ascii?Q?706/s/ARj23BYSt22qUBl2BAXbkwWSkoGREWDW1XVzDwrjg1tWecuZnP/kz6?=
 =?us-ascii?Q?/V38LGVnOgbIJVtIttWvhaIYGVjncgSffRCpNALhDxtEpuaxEvhgKEPbOfJc?=
 =?us-ascii?Q?bP0AkLGmQiHae3OfrLu4BBNeluR07i327UOfZH0tivpacxsU3WukAB5kIuJO?=
 =?us-ascii?Q?ZCfmDJqvqpcHni+/hntn1Ihkt5yu19USQFlUqkodqq0CjHwBI1qSdBxwd70q?=
 =?us-ascii?Q?nTRdLoiETPj2v9xcO1t0wiUA9yd/9nKQw1rkqBrKuGit/0TfHFjdj+9fqz22?=
 =?us-ascii?Q?L75hMQwRkbvdVei6MtAZzqMryT5uGvJEof44f8qumwtPDaEDncQgSyb3NXS1?=
 =?us-ascii?Q?7d3Vm7DOcnDFAArCpAqh85tgZq28fsvAfhS9gTY0h06nFYAVlOAbu/h6ADim?=
 =?us-ascii?Q?XEWCU6wCcid22rkqp62D8OzBhat6s++X9YHd6q4LlUcr0gyO3a8YSbaZ+qd0?=
 =?us-ascii?Q?X3l7RnA/iR1Ht9a4qFDlvlxXpCwpn/IlQOWVudrK3yQ/vy+hmcHEbWcMdLj2?=
 =?us-ascii?Q?KetUuovCBYKtZCRU9WfKJtxOKuRVDzg5n9hqAoFbrIlFoC32zkaApPqzmUe0?=
 =?us-ascii?Q?yyCAo00MZFsDzXSLgbVVOyi7nzL4GSvA3//3QDUY2QePa23bbnkbjLBOnO6l?=
 =?us-ascii?Q?79V2VgFjk2YNoAbZK1BcQVvvDeYRgzbB5K/AqwWVAZxzh4lNKeds+21kSNgi?=
 =?us-ascii?Q?/+HpBvplUPuzSKD5u4J+KhSgemFI4peSULdBmnlshYzgSGPQa4Mi2snfboTB?=
 =?us-ascii?Q?4XbBJA0SI1U5or4ygV6x5pS6BA7Y11RYXLZoKfpUnl6kYLRf8eqz1GuzNyKn?=
 =?us-ascii?Q?jTcCzh7dSyRHXCfn5MVQS/aWO4x0sht0oI2+SuVwqqNQg4LR/GwK2JNmUZu1?=
 =?us-ascii?Q?6Msm5GV8JXGOktq4xwpCbiylTfdHnerAEHc/wm80KL51ZraZRaArkyujO3wM?=
 =?us-ascii?Q?UuwwVDjJXAmI8f16xxAaMizPA614l0hHc26iWSNSjxsEVpyOvfCVqV+kHS4/?=
 =?us-ascii?Q?dRET1zdVnkAnMPHG5Oc1NZbNdiTASzlcKEE0BQGM+80kljuK7kRA6XrEB54p?=
 =?us-ascii?Q?2mrUyBJly5F/8YObURCKh28jAkKGWM/cmnpVTeh0M/HQN6tWeNwCEb1hwDqd?=
 =?us-ascii?Q?4iC/M2g0C1hZL017AdT/LtLuXFHzne6AW+KxzpkGx2ExY/A/z84bGvezL68h?=
 =?us-ascii?Q?ZmwmYnMaTp25UVYWsynIqZamSZ8Ta+ckE6/jcGbdmoKPemXJ61KGGg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzu/Rp7aWMqEpI+YteTIsvcUIs7EYfEcGmkEBoqKVsHqCIPL+PtegcMUPWrj?=
 =?us-ascii?Q?k0OB+EwpGMnyGS8jPVIEng71qBdhf/zboSWkhFtJYliy3EILgLLy47yn+Eu9?=
 =?us-ascii?Q?VonuZpeEIHBkl6pT71kv2mG2kgEF5pMcljonVX/k0kptYnCGZagQ+q3eCLaa?=
 =?us-ascii?Q?2d+/874uyGjFLNrCHutMppO+vgLrv5AcwSil9zg4kAF+Gq+5D77+tTZIF4DI?=
 =?us-ascii?Q?rSnPUW/D6Eu47xoRZC4wMvNTIrR+UUB9dJU1OLL+CqD8A0sUySfW4bzU3yhC?=
 =?us-ascii?Q?3lbuY+4JSsFwNW9zrzHSL1ep3HFvnqltD4Y9N+LUD96kfKw9pBHbu76A+LNG?=
 =?us-ascii?Q?SJUua5iMmc8PZj8/G4RKFIV4QO7AM0a/JO/wUads3hkFUKyQCVxWw+RPXFpE?=
 =?us-ascii?Q?/cCArtVQ3Ra6H/SA8iH9ITVgK6138xomO/1zEy7QjJbLPhtklI+Ol/XiXkNv?=
 =?us-ascii?Q?E2/dXyRokRw9McJA8XOjnAxGgW/xzXgJfFTKZBzdjprmgp7VSbx56MruqKV3?=
 =?us-ascii?Q?BPAOaXl0cWJwGeLuUnFJgHQigB+/+3E97lGZ/pWuNaUx631fK/WpYk3h72RB?=
 =?us-ascii?Q?pzKlbH4VIkKg8T0F2KSg86GlDR98Vd9koXfVeZ0YeFq4Ef7kcDJyoXw4XHDP?=
 =?us-ascii?Q?p2wer9U0WKonXPH3ocoaqnPIKvJnuN5N1hIK6UOV+DVMMdFrROhW8l3YDbCN?=
 =?us-ascii?Q?zauGPlEDS53P5rnpn3PgM1tlSx+Q2jTu8vWqAE//be2iK1SAOGT4VAQMsY1t?=
 =?us-ascii?Q?PPWA35HcS040jrHtbU/Bllwzs1okxb6JEtOyLzq8i0B+BFRtoyjQGuqykj9J?=
 =?us-ascii?Q?dY1qgsursAG3yiMmIIS3fySPQnsUJeDiRdtLVK5+RGe6k/KPJ86TeuyqZtmz?=
 =?us-ascii?Q?KZigyQ+lJJAZqoavB1Yf4UXzq6SQyoJ5zyC0C2Ink/Nxd1gNu43oQ64CHjky?=
 =?us-ascii?Q?Dg2M2bDnu7gJ1s2P0vvdCqBosZGphBix4697P6ag4XMBswLlCo3mRenPXuN0?=
 =?us-ascii?Q?Wqx7/Diz3Y2OQ+8ikoNYK5WBvN2bHVVr/LqGf2SEU/t6kD+nd42WVvTrbY5/?=
 =?us-ascii?Q?gAnP1IAs2+FNly5WQTFhioT1CSF5QlkwMlJsyRV+ofbxllL3mXfQgc2y7OdG?=
 =?us-ascii?Q?rhxjlGJ6F+RW3yFb4ufRevBE1Q8ae3REOcq5iMthGH3Mg+hnlC8SI3f9sRqZ?=
 =?us-ascii?Q?WWSD6XZAiUv9OwE6CCd3weCq717alkpsegxecIswG/WT3btGKfoVLD+qTUpK?=
 =?us-ascii?Q?HU5L6UGzqlRA8MrtZ68EfC6Ffxvfj2Uu22RR7tza69YnkR4iRAoqjGOSgPd/?=
 =?us-ascii?Q?QxtN0meEoF9KlcoJiaEQrwFndutk3LAV9V256koSXVNh8a9UJkdSJJnTmXX7?=
 =?us-ascii?Q?xaDgmG0cKrZpVQQtL6QKEKf+Tk0tovKGsBCNDlQBNG9SM864NwbqWpmo+ngB?=
 =?us-ascii?Q?TuXV8SnxefW6ZumLtYIcmNIRUIJFmAfKzQAgFaUMUpGoYSSvl5pcoczyiLSe?=
 =?us-ascii?Q?IzfQGjdJRfEv1IBrRkaQVdk+48fOe37L2cpW9qigtBbLjyZ+u5gbcERvyUsV?=
 =?us-ascii?Q?U3vv34QYkofW2z0G5xxhiOGw6HpT+1dMf2MdtTmEzPJg8Cs/BrwjLx0YSyM6?=
 =?us-ascii?Q?W7G8KpXPFGZozuTi7xgmBv8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd32a25-fbf2-4f32-ab7d-08dde8eb567d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 00:06:02.5324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7oOrnk79aQPlIinXGTiQc12uvbMc0OM0ieTc6T1sN1YJeEqkVsPV4Np7vWqZV8rr+16aSoH2x1GwNOOj8rHbZcLLW8hefppAe4NP1GMY7272RtmGELHhiT6wfr9MHQI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12976


Hi Krzysztof, Conor, Geert

> > > v1 -> v2
> > > 	- add empty enum to avoid allowing invalid use.
> > 
> > I don't understand why do you need this. Where is any user of it? There
> > is no such in this patchset, so this must be explicitly explained in the
> > commit msg.
(snip)
> > We don't allow such cases because it is pointless.
> > 
> > Otherwise explain in the commit msg why this is needed, why exception is
> > justified.
> > 
> > You have entire commit msg to explain anything unusual and if you look
> > at source code you will not notice such syntax for boards, so clearly
> > this is unusual.
> 
> They have a soc driver that binds to the compatible, which is why I
> suggested this rather than refusing the patch. I do agree it should be
> mentioned though.

OK, let's skip this patch and post it with both SoC and Board name.
Which was my original plan.


Thank you for your help !!

Best regards
---
Kuninori Morimoto

