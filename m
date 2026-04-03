Return-Path: <linux-renesas-soc+bounces-30814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIPdG7Yfz2latAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 04:02:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0613903A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 04:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 516283018768
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 02:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D520D34753B;
	Fri,  3 Apr 2026 01:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fRJ0zDON"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8196A17C69;
	Fri,  3 Apr 2026 01:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775181599; cv=fail; b=F81lxF3TpNYKEueJMF/Xmd5O23dpxkiHEbnsefSgc/xp84bSUW/g+718quHWvy8ErWxmG3sCROXb2tqqIAFq3gnT6rsqZu/0I5Nn1PG5FhdgDoVFjIel5qw3nTn2H76xapUxbW2lGUy8TTw8v/YRrQlPNK6ExVY653iLtIIuPWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775181599; c=relaxed/simple;
	bh=aFJoPlS8aTWvUI5bhgnlwWN03XLMhtEoaZb9iFOLnNg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hNuKikNJkrThUeDwWrnocz0fdSVTomSVmXiZQvD3Sv16G2aLDA89I43O1XirYrlzjYESMnWX8wuL9sxuaptaHqV0snLerHtbKD5ogeVHYhuCtOFYjSwbFbA/cXvW6LDKubSyD5Yp7fqAakOV7vs8YmM/6/MR7Bf4k28X2Ytor8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fRJ0zDON; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIKMM0zxTg0eB8zvHseLUG8ImF37I7r5osNjDlEjPNCLYikMcUtpgCGgsKYXyq6249SqCgkvHCuoKNKMXReGogeQ+mBvxG3G5AUBrUl66Kzzx75PeNlP8/qiYElxJi9m8e8BgXns5xHaZQy2y21stHe7y70rtprqhEbwDWVQLauq0NX70MuyJYOswR/4coKZpqnBW/z54UDWrxfzaNdHil275qg2uN0YixQj9R5ZqZi+tDK/ovKqExg5iQeM9si4iRaIXDtUAdS9DahlVYPFtUOGU5yBuiicwPPGcu3ksbofT0syhbpWoTuKOw8Ove1dn8HPXNX2bO6yFY2QS1ulNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uuz99WJf+rnM2AN05g8AzLgIwT54bA1LASpUnL4vNME=;
 b=IDbdXCXSHiSyuHswsX3HY81MFcmXgKiLi3IKzXmJsmkKTA1zsmYsgeGTqX3GVKcgRFCUl4/KnWTSOeOwh7kChEKxmy8MJhjQSPxA7+XBKeSBz3gsKtDxcESpHOaQrx4sm1gQA3Dyh3i8Ya48eFbTQIr+g7TlXwfcBTAWkGCoyHeVfHXdyuYVqTWPNZAzNMZbC2BVeck5ryAMPCiis9GGfCt8TWc/88XNwweqYHtZzO5Y9WFrZLo8tbmGBp4SYvx0rKZt42gCp+t3Ii8H+XRGNwfh2l/LhZiUbcxLkauVDdZGMkSFMSt0aV2Sx8EA5EW519DPyppHjhiRJaX2Ce8yog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uuz99WJf+rnM2AN05g8AzLgIwT54bA1LASpUnL4vNME=;
 b=fRJ0zDONMLrfAU8jnCSYWU/F/mrIDGPg6PWUHaYJa91ixL6bMmU1wfQHJwCzjh6ozaKm240UBHNoXV2M7rkkMoguQrdTAFvuJ2bmVz7UCEThV37ovyizMlih8+XhWAEzWNLJnghm4r/R3UXugwYLFsB7dlB5ZlwsbRVpZOPs/eU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB7704.jpnprd01.prod.outlook.com (2603:1096:400:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.30; Fri, 3 Apr
 2026 01:59:45 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 01:59:55 +0000
Message-ID: <87cy0gg5wl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
Subject: Re: [PATCh v3 13/14] ASoC: rsnd: Export rsnd_ssiu_mod_get() for PM support
In-Reply-To: <20260402162436.12059-14-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-14-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Apr 2026 01:59:54 +0000
X-ClientProxiedBy: OS7PR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:604:24f::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfe13ee-78cc-4f93-2d3a-08de9124b39a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|52116014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XdhlwntRMPYaVD7cM7vMelnuySNM3HHKWLnU77U+yJeIJprVWu6nVR1a/+Qqa9nG6sopQ8eLFIRirRpexjjZL0uw2mH5jfnFJRXvSbh+XSK/sf141dkvyAM3WMcXaCrrdZ6GAjAYn3zmPCL4X8fLAiBtghxFHoOanbHB9TPSlKZhcTRBZpSE0d0UxWmE7xIMVKqwOGCm2CiMsW0DR85I8b5aB1uB7JVIZN4Cwn9XEJtbzAruw5UF3IlNRFrQzV7PZOTSxuX2qnpOp8Ycu2X0d4RcMJtogIgmmjp9QsniFJ8Y+s4tk7p8ndAsoTTh80MX6DVS8NYobGLeEKENdm20nxR3425prr5fD7X613+s8PTeSWmttKA1TDgIr8OqV1KpY/PPY91Fb1ImrQKpeFctyS17tNzi0+3Tzbu9US7eRouXKtbd+ldqZzJCus6ie7j6Cu5Lsi3gjeqQqXdCBNJCK9btp80I5YTIfe/HLu3A+WpQ9g92lTOGBL6z8CtnFEX2ady6CwrMYa0ZcUYc0YhuATd3fldMoSFxWHtKlsgH0Z2L7M/aHuD4Bk2EqS8uswyN/dfRtGywPGi2tIM4uL7aQIIB6FrsdMUoaBg9lvjzr0pnXtNLT3dHXEQvwulO3oMLw0z0ubF+KMLhvRHXpddk7uOudC4I6AIttMKgME/iAmOSbOftHBDcGoeBV3WoAPcJa4SfCX9eSEwagmMoHySuUy70/QSsYGkDKLWa8LT8tQ3/Tby/gX1b+tLoTA6QS+H4c6m84VLLYggxitXlw0iKg9qoZ6dc25DTxoe0QKU8URs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6XJ/PpxkaBVrokdTu+RZXIQIbjGFmaIzHgmCP9K9o1RluK4XvPqhiKCxPqz1?=
 =?us-ascii?Q?9n5h8pjwuRnffRC/bfQVUmTeSDla98dSTzDVUpWua+nes7NtmMlYA6X07U6L?=
 =?us-ascii?Q?zgsAWevJkf81JroLfX2XTKLJRAabq1+7Nxo0JpGVZwWU1EnPf1c+a9Ea/t4e?=
 =?us-ascii?Q?Gt3ck3173JLVMgaWpJnrXXPZLQwhlATy8y/WanMgm6FNz6PGFrQgsuycxRnF?=
 =?us-ascii?Q?LAjaUdigojBT09uuAP6mVzeOHyerPE7e0DJScVOv9yvClDeIv4NhGqP61LH+?=
 =?us-ascii?Q?ZgE+p3Ey2UjoMN878vX0R6WeqcqVKmf8NiJhBOcGnvJrEqaZlEfnqznvU7A/?=
 =?us-ascii?Q?s1YLJ7s1tU0v/qul9pKVCnQxjdcIY7+bMpbYqGNcwxvuhe3xckgXL4SE5kDu?=
 =?us-ascii?Q?7z/STeocNXGx1f3bhiG0IUA4VrGeWStKpC3+luoQUyFNP1pdT4k0n7iajsLi?=
 =?us-ascii?Q?sy50LSpw2lAZMGTAwgfZ9rj5zzFMvPSyDqFOt+ofHmk/qRcg4bVJdnO23TuA?=
 =?us-ascii?Q?znFGeGgeDMdv4TtyZFVbOJR+6FtJHokSUqtTGyd1ECy+kiCKJZZNUs/79skG?=
 =?us-ascii?Q?SRGx/M74rR0Za96e3J3O/Ao/ld6SHuPhGEt0qpm0khXmT62N6yDjSwlreRET?=
 =?us-ascii?Q?ou05mznwRolta0mXEutl0m0SutGhlfOOcEYuCV/WDBR/2vHkaUl8iTSWi/w9?=
 =?us-ascii?Q?9cnangGRDyBLkes1DNYn/KAUuayN868uXltrmH1qOjJ/vujKlSDj+hGq85e8?=
 =?us-ascii?Q?UChwwdhBecyD+4dP93rdkNzuq6RgWOvrgQsJGm5Eh80Rb/bBIAR2MRGRdscp?=
 =?us-ascii?Q?MJ52BVZeGSfrWYQdKne+eoeEKEaizcCxmqvjgc98r0j3NZ43bsl4NyrepfsM?=
 =?us-ascii?Q?d1caVYJxxKgHfMqhbGAQIMEtukUoRH3o6YkMIqh+as928cPJUeg+91Q4He5K?=
 =?us-ascii?Q?eiGbLOnOcW3SvMAwje9tKdAsVmwNokb3VA1QaJMdjbEhgCFHRsrT62713lfb?=
 =?us-ascii?Q?uSQMXb92oU5uddIYDFgTV2p7MkEByVa+BmfiOzsC3YWQVVI+ynrdpBuKlwfg?=
 =?us-ascii?Q?PeOLICAYzU/XNF1wc6HMOgUTu2XCPdioX6JHF8eEMbk5Y2upUA/rfxt/ZFEe?=
 =?us-ascii?Q?nN4V1nFgo09Ttuyk2PhGuvN5efuqVenDT4UrSCrs2rBvCgRUBt8/IeRKZiJs?=
 =?us-ascii?Q?pkzpANdkASK1544zRxAFm4d9xiIgnvT+L+ttS6z2q+H7FvHvuC69sjVnzwz0?=
 =?us-ascii?Q?tyxyZuSOWmnKqPuA0JRb6X3edwasyGfQOsqHWtpaH7WyqnX6QwHuFW/x3KuV?=
 =?us-ascii?Q?UakwyXAHUjAdrZ8D1s8SRbKHMk0ccyIA10lWocQnx05ZmVUzPdkCCP38XzQh?=
 =?us-ascii?Q?35CfBaLmiSwgObGVTvqI9WA31wOSmKX3/wFBacyFVW2hMSPHtElGaT9HlLdk?=
 =?us-ascii?Q?ACQZ4RksxYeOCPfOJwT+zAodtAgvZuAScd00mE/VM92I9P8ztKxoh4Ib5t40?=
 =?us-ascii?Q?F16GgHg9F0Ls+DEp1mcFhn1g94RjdIiBUFlpfPjaUjcNKhhM0TFTuEVbqAgg?=
 =?us-ascii?Q?wEjJ8n2v/X6e8DOFKN7y0CZXNMVonjpx/XjKSFyD7MnIfdeCLwOTxeTCEkXx?=
 =?us-ascii?Q?XcWssVWiDYiy7ZlmjZLWj5S0oUZtjq8KxG6bqBi8MB/V8vY946NBsPH/p8D7?=
 =?us-ascii?Q?QTruED15UcTuFDid/AymqkX7z4KFHoG9ueIUWMmPFySYifpDsBBFtbbcHiDg?=
 =?us-ascii?Q?rV1VH3MWJqbM9MibTufiOiPKNVgAEuOh09jBXVMUOAPXw89a3odU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfe13ee-78cc-4f93-2d3a-08de9124b39a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:59:55.2512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybR1isMXP9BSfxnvmhKoykenoP1AcWqiwmwJgYqe64JvVRsQNMD3Esxm5pbR8291vrTU/6MQasSApMw6VYaafa3FvPUq1xIoikTOYKpsq/PtTwQGMOGD8T44WQepMYKM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7704
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30814-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CF0613903A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> Remove the static qualifier from rsnd_ssiu_mod_get() and export it
> via rsnd.h.
> 
> This is preparation for system suspend/resume support, where the PM
> callbacks need to access SSIU modules to manage their clock and reset
> state.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---

Is rsnd_ssiu_mod_get() really used ?
I can't find it on [14/14]

Thank you for your help !!

Best regards
---
Kuninori Morimoto

