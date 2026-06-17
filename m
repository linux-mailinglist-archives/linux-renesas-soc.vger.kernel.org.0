Return-Path: <linux-renesas-soc+bounces-34106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j66BKNv0MWo9tAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 03:14:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D77D695EC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 03:14:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=YORH1za5;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30B8C3038D0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 01:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092402D2397;
	Wed, 17 Jun 2026 01:14:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF5248881;
	Wed, 17 Jun 2026 01:13:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781658839; cv=fail; b=f0uclzRQBOX1Jfo91LhXuW2N0vbmywniST0xEK+91i6yFWYKY1sqz9NpU5wnLz5jMmEjuciqyHX+r7aNrweXHdCuoV016t0mLIn5XG7XzbfQLlDo7731LOQ4qexyMf97tWxpWwWopaU6ffXEqzjgT4o+nIaCuxYs3X1VPM5Hil0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781658839; c=relaxed/simple;
	bh=q0aYX0/3/OLW37cftk3Qd+HQGE3JbAgmwdApnX7LYNY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lbFRZ1ddt5Ye9+78aF6rEuP3Ub4ndQiivHg/rMTTU8hXKcQLOWosiki6kG5eA5ER1tksbTEUWIqCErcSyJINhnQClWilT3J9nfdM3ce5WE9mjkUi36O2P4IsTpCARwexg1+itIIWDaMmlLARbR9j6oo/juC1rUspeiFdlBTjh1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YORH1za5; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EauRfxpQ/dul98qQi+qfjrk4ceIaVe6wmxfr4UJgd7kKC4jMkV8WH+FBL6rKyXUzGp8dYipD6IrxNiff+XK8kJS5f57SjkEcOWnQKU1LLbVLX6WmlWQyTtUxJGwNFjOaryKbsiL7vSAn454YpI8h0QbB3uGpwxJo5AxXGEUGYNJR3JOffroJmjAa/EZhaIq5vU/At4xCboJ/TVx/oVclcqzbBk/HCkIXFtcCK1Hiqxvqoej3WR5oNBlNN4tTyJCsSjKBRNS6JFB7LsZIfbqA+Cvs9Ls+hIK229flTgfK7HJwhnrkbVnAPanTQrFT5Lc2u7giTzwzDpu13xV8rMuOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0aYX0/3/OLW37cftk3Qd+HQGE3JbAgmwdApnX7LYNY=;
 b=AiSFZlidkoWUIWmFMpLaWPXXXtsEW2pBKE2rTzfoA+e21jConUskSve5UlLul7kpVJStYvlbwKD18s4BUhKUhv+i5L1l5nd4wXQhJkMB8pqDnLj98s8XfdmYr7eVY+VjJPlnBqjO7xTaC5Q2sBu9UYO4j4ZkKIXYtpEIw1nWtn+w4DQqo/8OTMniLS3IhaMQpjGMNDtqt3Ztkmv3rcz/oNnjaq+pxO6OtpOnRHm6eXAEqyLMNjaQuNGIfgzq7FzZKDPyHGT+se0+eAZFNxZPGps7ljD0te1HR4CRDF7W0yPO0O/smgBAcfYwUAzfyFdkHs1eGXBnDhNRyEP97I+SKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0aYX0/3/OLW37cftk3Qd+HQGE3JbAgmwdApnX7LYNY=;
 b=YORH1za5C7UoY2gmarjDZ04hqD48Isz6AYCdTd4/kUjJHKSGec5sQWrbt8ZFPdC000x59tOvPArg+FKlyn5ESEY1BeCVxwhSGiAj/holaodlGLcs4aJBpG21F7Po83q2O0IGV9hVnMG3tsCIAoGqXmCS2uinj0uGLDUkI8yQHcM=
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB14876.jpnprd01.prod.outlook.com (2603:1096:405:252::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 01:13:54 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 01:13:54 +0000
Message-ID: <87tsr20y0e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"broonie@kernel.org"
	<broonie@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com"
	<tiwai@suse.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com"
	<john.madieu@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
In-Reply-To: <TY6PR01MB17377402700DB2BB781692AD3FFE42@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260610164704.2211321-1-john.madieu.xa@bp.renesas.com>
	<87ldcmovp0.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB173775D8E134C9A90BB069334FF182@TY6PR01MB17377.jpnprd01.prod.outlook.com>
	<87pl1rmci8.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB1737795DA5F4671C634CCD766FFE52@TY6PR01MB17377.jpnprd01.prod.outlook.com>
	<87v7bi13rj.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB17377402700DB2BB781692AD3FFE42@TY6PR01MB17377.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 17 Jun 2026 01:13:53 +0000
X-ClientProxiedBy: TY6P286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB14876:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1f5698-f7f6-4cf5-792e-08decc0db2a6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|23010399003|38350700014|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	GZ/MuZjJOutg5Ugfo0Ie/yhUatdZfZ7PEXQ0eHYsxjF7be9DKMs5avcJrQAMrU6jCLlhBTFsfcbd027kOFLvDIckl2MiVpp85unNbPakf/+gD4CrMJB/8cqwIBTKmRYihfkYQcBlNpR4rfj62A1wORF4OyntXzv5jQ/FCYqcfaFCUaX2WUzqk1u/zW0FKNS9gOB9Rrg0opAtkvYj1mtN2j71DoWi92cMQRfhxDDnPIw3rEQWKVTA/cIfEan1zuFhDaI8WlIUAhvb57Vu8pbmLX5tpKMQOqkkRDyakZvOVUAZQ3YspK3N+NCrfWbpYtJDV2QmfbDZmDJ7AsFZpQT3GqHrxzTwQ4b+1T1GX56tOW6rmRGAULeWj+SQpnWtVnY4zuCvSi6YrgiH5PGfG0gY8EBBHPikFoLeZZK4NDvE2ozAGHGwzx+Il4IVZ6JRB7k56RjvQQxXF+PvxeW4m87vhP3C21pp1JJ7A4CeRE+Exy4zklbLi+EPs390RT1kuv6joK4OOxp6tLggOxvT+vYvYn3ZStpBxRyHUUpTLz4YRL2oV8ZoVrue6FLmuV/h6O/3cntkWEYv23x0YCEizumyelVPBPUkin2XgjZqh1NCdyP/DyMZz47H56eEvg28KrkXMGk3uNbj7Cnb3XZ/hzj42ZMC+qlqg6Y/zIc0S9ZurA0raGlvCDFuIhHyQCUll3D69TkNHIAyAHQklBxsKTnYyKHHTNRG5Ype7Uhd3EE7lyTfanx3um23vXUSL8CryhvY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(23010399003)(38350700014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZRhVhzhutYgLyhqyos0+hdNfwWagNP+vmz/o3QAlgBkDojfnSSgmjJ3yHrmf?=
 =?us-ascii?Q?JBAEkVeGMBF7bH8+ZfFb8TXAXUPuMG02ehIwZLJgNgmEqX7/tj2q8iz6eNZu?=
 =?us-ascii?Q?ano/ONF9ptoFB+gBbaMQRE29FgMBwE6q3Hv54mFRW5ivOEQ5Q0YT0lnA/33q?=
 =?us-ascii?Q?Su8RtFotjFeIqIq+nVGQfl0i6YvsJ2zTwqHtMz3ht4zLZ5qU8wlJYDPnHmRn?=
 =?us-ascii?Q?4xhzFth1Eq0U4UUMoWs49tKPLA9MaM2GKiYsXPMDBP4RxnlY9tcVEMSzTR1Q?=
 =?us-ascii?Q?6Y8d7T/ffBcG1y0TTB9LNrEfprADaXQx1kUALyy4Kg44jiplxCv3pAzz/RZa?=
 =?us-ascii?Q?NQmDAbiZK4RctPzK//QEcp/UHxL21C/5DB3YK7cSLGNNbQBFPTSfTB4L5qb1?=
 =?us-ascii?Q?DEikjVB/A83F23dLfGXbx+XXGtL7NlmayG2hC7tuOSUoQFezr/aeEKhY2ZOQ?=
 =?us-ascii?Q?JrPETvWuQlfshvxWtTBvNbzjQllGc1Fl1yx1lh4eNG8uQkA0C8c0SbaDdkpu?=
 =?us-ascii?Q?ueXjdMsjiqtKczF6+dMhruV8Gohsm1u6piO2uC3PvEdKkEMkxiT75T98M4yP?=
 =?us-ascii?Q?izW8bV3ABxQAV6SIJkS7D2jDd1Y4fuZU7fAkVKMx4xhPx6TW2Kt9LigJLL+7?=
 =?us-ascii?Q?VhmgjFlAF9LEcDRZmUpEvSXAXYFBXrXt049MXPiWJ2s8PaEDXfNR5C9fsHYw?=
 =?us-ascii?Q?ZZxRkr4kbavQ2NS855BWW2ukWv/rqobfjwoaCwvfUaaO5Wo/OudPfue2aAYV?=
 =?us-ascii?Q?oBhtjAwcna/ocZWjPGlk7YD0dSUB3BDz9sC89reMmo3Hg8pVxmS9PuWVkbf3?=
 =?us-ascii?Q?exU6l57Sy4o50b69OTgE6a8GEx94Gv5q8lvZKD3NRPDQWH8YklCe7EHL4wuZ?=
 =?us-ascii?Q?gC7T7/CYIPybLsjtGRc46BnW0VU1tU+lD6LEjp+1rsPbgwSVk0xhdLW8sD+F?=
 =?us-ascii?Q?RjvkdMxAyXz/P1mPQWtvlDOzMU/BFC2ZboR0T6gDXW1fhAZ6TFCaf19p7yI/?=
 =?us-ascii?Q?3XcCmPcBykPmPy12Gx1hFnkCYey3AB0bIqmd0+2eJxUHS2bSP0gMXSwuH7Fd?=
 =?us-ascii?Q?r6Y7UZgoPwufQbwW0BzSbbuww9YW1lMDcFZLvPQC4+kpmrklGyT/bYfae7nc?=
 =?us-ascii?Q?/1yZuWEuoLGDJdW4zJ7wf0lEeR1sIVLw3iPZ48qZh/0+7/NKgJeYTrHqGnbt?=
 =?us-ascii?Q?sQWFFNFqTFGB7XvFEb/+lBZnxDb91Yn5oDamqHdTBoLtO+B7cFX9eCMdDlOq?=
 =?us-ascii?Q?BKWhLITFWWD1ERXC5gF5hiB7i461qJedfLSK6fF7zyANNQYLje7afW9MqKyx?=
 =?us-ascii?Q?ZyPoTzQmGA5KAmSB+SpFXn6UHeRnMnVyi2GX4kQE/cvjDzy9fC0sTSJbtvT5?=
 =?us-ascii?Q?V5dsmsE1ovszxGVhrinQch9va0I7G5VzRGgg6rUENJSYl9K/+zVnRAKWI51j?=
 =?us-ascii?Q?iV6BZC22vRjCKZ2BLuNayBcNr6n69fnUIfWJQEuLnpXLG68KY/gmTsYViP8v?=
 =?us-ascii?Q?ucL3Jv7zr8omojNQpZPFpF0oCzFbbZdUnXOmV5hw3JMD0zT8v2bAWZWFdwUh?=
 =?us-ascii?Q?h3xcX1a0IEMRg5Zqjf+GYhNWoaPLEHHMFpiCcMFp00vigB8Qi4nKlpQW2UIv?=
 =?us-ascii?Q?UHRfMLGc4rlcP3E+JO12w578AgmijRTORJ/CkndLsVjUdo3TAOqUiFtWseQw?=
 =?us-ascii?Q?Xhh+T10zwjBsCKYTmUhqBsuO2y2qjoLYcO46jHJW1xvF75AO4zMycnobS6pi?=
 =?us-ascii?Q?4i776eK7cRdO+UQNKdyL4lvPAmXwR3Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1f5698-f7f6-4cf5-792e-08decc0db2a6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 01:13:53.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dF6jaRWQ0JjN3eKIwsmuWEDHIIWQr+LfbQTYcjWbUpZGjbah/T7T29/5/hKUpEgWUGYUy+cWz5jy7a3MddzO1GO+dM89kqRNcgoJ0+wlPc6ta1DV304M62/AMs+hvWd0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14876
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34106-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,glider.be,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:dkim,renesas.com:mid,renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D77D695EC5


Hi John, Mark

> but instead, about resending this patch (with your Acked-by tag)
> as PATCH 1/2 + the clk_control() separation patch (as PATCH 2/2)
> together. If however, you would like to keep this patch as
> it is, I can rather send the split patch as a follow up. Which way is
> better for you ?

I don't mind details, but worrying about your situation and/or timing,
because it is now merge window.
I guess you want to have [1/2] patch as *bug fix* in v7.2 kernel (?).
But, I think separation patch (= [2/2]) is new feature, it should be
v7.3 kernel.

If these are posted as 1 patch-set, Mark will accept them as for v7.3 ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

