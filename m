Return-Path: <linux-renesas-soc+bounces-30904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hdBIF+s01GnasAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 00:34:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D683A7E20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 00:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54A18303FF33
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2026 22:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8814438F929;
	Mon,  6 Apr 2026 22:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PMvsU8Te"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98862E6116;
	Mon,  6 Apr 2026 22:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775514856; cv=fail; b=hO/FFhvpRZ006Zc/JMXPfJDp57cCwzVR2bJX1Mds8pvtdsxg9sf50ndDGvWU46/bBTavmkW0zR8iEpqsYw8tPP4sXeVEK3qxWlh4q12JOX8mCNBVf1RFC48yH1qOwizNVr0mgA4xdJotfgzQm76acsSwY9x44VuaJWIoHZMoTBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775514856; c=relaxed/simple;
	bh=tbZDQJvv6Kywk+wQ/ZQlfj1ABBUDdaMpfKH+D9qGNIo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gbM38eX4tRAUAGNc0DfRNWj+JSXcOW6KvEBCjoYRtfzwXKF4wEU1XwpFHgIecuOxgO+epYFuRBtGO4ZBZetnX+o/hP44OBmm3q3ZiLwdk0ezIKeTHO5913Mbtrsii+qidEwsvlwOm2pqDyJvQ4J7T2ymcGY5WwEdILo/fm/uUqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PMvsU8Te; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GL4g3N1IlSkhutrGZr8Q9Vd0VtUiBfND8R2VESbsG5zn80ehIU3nZi/CyC4PPtPQLnHSJn1S5132L8GY2vNEdETZHdErfmBcp3R++c9Q1T7w/t1b6RmHdJu9jLsNda+Wnp5W0NpPpnt5A1Xl4Eh+wKuTK3BoT+mmKM3xOmMjGL2TaDBrUrKn5FI0PStcO4KWeoZvMVqYjNN1apSwSBTmwZr7H3WAirEUIw8hvvaYapzlEhpJQpbbVNLzm3tjC5yNs/qlgFldN04OJWTsbRT1gDfoFxu4sC7l89qXBnYk/orA1ckd3xM1/w+clV8Q5JcjSMb+5FrQ3beUpyQqv7Xybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agI5RpHXlq2DAts2aQ6GphpBDmC8oxFIcbzGv19Milw=;
 b=W2DeIxpCvryFKwT85ZNVkMGmq1OyIQCvAqO6jcKqkCCf5tvefWSrsbv5IWnFNY/APYv7Vo9iLTEiiSBeVSCUX0iKmstviiAOatVMtwLJ7y5J7HeNFcMuVutTsO4VdbZtb8H+/w8wxXlrUMjuRH59OS2bMkW7tBf+/IRhTmLsrc8ch2Yu2DZYRVPmmJ4tSgAFOCE93R22zklGhkyY/NNQxI0GmijNX3yxJq5D44Y6QuoRzWrwgEYhNp5KNjpZbOrKVAE7DS0Y+UX9XD8mpA8WW3VkT719MnAMVSOVXwH3h3EqUDdgWfUACt3f2qwicmUAXAUcl1R/ruqGPBEXmX6iHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agI5RpHXlq2DAts2aQ6GphpBDmC8oxFIcbzGv19Milw=;
 b=PMvsU8TeEbJvlbDFMj5x5o5OlehdXVZMXuGBANAfqxcmZikRa9kYJ6kRjeXMQhpCx3xcMNGH2ZNdDSRHAd8Xbnngopzzezh5ZY2fT3RzV+1UL4UdwbrnKSb7bLbyIqUKJx+XhJv6BsUZLysDOhmmx45fNZ7TRT2YkO7zeG1YWiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB13697.jpnprd01.prod.outlook.com (2603:1096:604:37c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.29; Mon, 6 Apr
 2026 22:34:12 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Mon, 6 Apr 2026
 22:34:11 +0000
Message-ID: <87bjfvu3ae.wl-kuninori.morimoto.gx@renesas.com>
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
	magnus.damm
	<magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das
	<biju.das.jz@bp.renesas.com>,
	"john.madieu@gmail.com"
	<john.madieu@gmail.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
In-Reply-To: <87se99t04m.wl-kuninori.morimoto.gx@renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-12-john.madieu.xa@bp.renesas.com>
	<87h5psg6w9.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB173772234146C4A8970EE404EFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
	<87se99t04m.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Apr 2026 22:34:07 +0000
X-ClientProxiedBy: ME0P282CA0027.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:211::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB13697:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7f5da9-35e8-4f42-6f90-08de942ca000
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2LaQZXrNwQGLIQQO+CNnY8VysFr6pP2B7T7i8aaZgyrG1qqFpJQ3eab5LYCad+AIYPlEC7RM2+GuCiBvWILGj+CDuUHr3dWyXUKidv1ZFXWcqTpGTZC4wJvg3HxX4mZ0DzyMZWAdpWEt3od28Qfv1xXUpcWfKx9mqg5KXRwFSeyUoNRq7uJt7vas3Z8/ffY52r2vCQDqnqxNe5Amfp1FuMYV3XgjB0zry58G6JckugNwUaItXfql3fkzuoha+5CpuoQqkGIwbH7DhTiRYHlJtgOaCcIKk1CMndnwtcLu5heQiuDyo1UpaLcxinXUzZ3XxFYljwYt8dtU6ie64yzDoHYkj5m+gZLPWHm7XZijijVBWpdCnuTfKksJJgnApaRejyvhKrz9ByriNw5KVLguTUle1kyvLfe0cHIYvRRdGB/VeMM24Jf81eOtQRHHMThToWHSze8FZ/utL6WM1P53TEDDJxpTsLpy8DOpsvKA1f1Ow4fTUQBr/opvmOumRn4DZk+rUc7fmV3zSTwhgMYkQErTXhmJFo3g/Kq4VuDU5nul96uGAay6sMULOWLaMcsAgxZSksARDFmDGyMvxPd1D8ufbvMJbhOv+W9ZJvJtKavJSNl19ovAt7YMQYK+kbs3GbvUcAfqEnEhsPJplzRx7uWAr9wj/N9q2m08cgctYtceJhWKfnKes74+ZByrPtkiRKCC8TddRX6IFiQzkskUa/HCXoY/FRqjo047/C0Ihe6zsFy9p4AmhWdXHn4QaCIupOzukEzpS/fV1c0Wb4gZ6+Ef9pDlWPdGg2iNCvfweoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ImImKJ5XbI0TO4nYJkWpu93v+PMgqF82sx6JPx/q1hS76tyMVzTpPfyX3F35?=
 =?us-ascii?Q?mLWiCQyF0gHMnevA6H42Rrm+NFveoBxFuGLDRhiiOfbW2hVanP3/mgdieTiT?=
 =?us-ascii?Q?US9Te8XRBuJnXX1da3k34UWZ7wyNY0EkihODkAKP7tpsJeCqzD3E9Jcdd7+U?=
 =?us-ascii?Q?sU0WYBp0VUF1K4VapSpLUQeTwI+zfOOYMXj+OKnOb0PT1eI5PNcJL0HtyOaS?=
 =?us-ascii?Q?RUiCZeUeREQ4ttupfVCcximNZGBvsZiw0VWtcyaCRtDXVEu+73FJWcz6XAHq?=
 =?us-ascii?Q?O8/WAFDzIUnnbWFMHMriNmBcX+SBagxUVH6xKIhrlfPUuwaV63RIy3O324Z3?=
 =?us-ascii?Q?7v5MTjF05FOuGUw+1kQRVdPhDRVyMBkRr+Xv4b2pmNCTHRaHIL6uSz2W+0OR?=
 =?us-ascii?Q?bpUH00k5/klXDbaaypcDX7VxMPBHqGGLcfEJSx+lnKQtX1oLVZXRzLk2vJu4?=
 =?us-ascii?Q?WOiQZDVUpKB09P12WDKZjaOx+yTDYM43OnEahyzfT+yluXQDCcOFTf6fyFXJ?=
 =?us-ascii?Q?d+oydYgQWZYZB/nZxC4hC33YIzw5HCp7ucm944WH3tTAsUSu0uatdJ21MQYt?=
 =?us-ascii?Q?lsppWuf7cbnFZIsXKPODeeAAGqgPTFw/3xYT3128EXD3qDZXQP4LrVdQDa41?=
 =?us-ascii?Q?cYdB9qCQ0vbR4LudoH14HrG5EzB/ofWU4kmqBDxkVTpL4HLr5DDJ+lRDS+TE?=
 =?us-ascii?Q?2cJs6W1Rj+Zh8KHF2yp1MmSHmRiwm3MeWpPtRx07JLXha0qV3Cnd1U52STzB?=
 =?us-ascii?Q?FhCio4wmlLGs84/qFEwNFkVgR/mOzrphGhEuCAYkwbEu5fdMLJbV4Og2pzGA?=
 =?us-ascii?Q?IpBs0mY2BfdfeSLxymYyQ5zJ3Vtz5hJIeX7Exl0tMo2vbTYXNxOgR49bbucd?=
 =?us-ascii?Q?gdWV0XN+wjzwrMKxwhUKOyrLLoyKofqQu/a3Ub7AqHZP+3Svy+OTiEkzaEKS?=
 =?us-ascii?Q?yyi57LD4jkBdGpD5mEfRc/ptQQuIUcwBbD8f7+YrimUTL3z5wDW3oDAV8Nj2?=
 =?us-ascii?Q?tcU6khN8C861f3xOSZKd6lBGKbRLNqmwGVWZUSqUC5SOBIKzuxvRsGSWQS5F?=
 =?us-ascii?Q?dz+j7zETPLcxevRuI943tvCFJ//cM9FzpnRYT/J8kRWPnGDIzxEqkjYd0FAE?=
 =?us-ascii?Q?2X3lsS8KDLwOpkwq4COwecRJRcqA8/2biVdM22ModIi2v9YM/2RN0R8oTdTR?=
 =?us-ascii?Q?b2rGoVJ+ValKbMQS11bVGA1K/qCJ3NYQqByd3nZz6nVHVhAPJhvRYBQd2Axe?=
 =?us-ascii?Q?96uLWWN/fQvKOY/PicE33qkxgUCLAh9yxErbO46W9CCCyo7Sv4jstA6zE7Az?=
 =?us-ascii?Q?rHcN5DJS3YcwDi4LwhDno6q2KTSvnxb+q19OnBu2OYtgd+RJMd0EwRNlf+MB?=
 =?us-ascii?Q?zmwlzsyz8hcZ3H7WRQY0THp+L62z0pkoRApYhpVprgV9lCANc/f+G1hrA5zU?=
 =?us-ascii?Q?CMal7IXlXLwwwP4sOiukmZaUSpcnZCHKW58MQ4CVe4W6MIz6S07aaRAf20aa?=
 =?us-ascii?Q?Wm0KIqGZDuau3mv0ebv1apsOpGhsT2LQyzAD2vpPaug3nrx/XEo5BIK55UE2?=
 =?us-ascii?Q?QMNzI6Y5m9ShYJcsIYcCTyOIbOBwEoOTUcLpUOBj66pHG4jW1UQtiVakBP2j?=
 =?us-ascii?Q?2NymfbcYdFe4i2mT0tXJcAteC3KZFeovElmbnN7dlHtcRzvPbl/MV+FaGRKi?=
 =?us-ascii?Q?0uvEYG3MYwjmkf50g364dUcXhsF2OheFpIaR7YCEfCvnLoXRxFxqFVdbBP3x?=
 =?us-ascii?Q?YdZMinqbjCr5f61L2rOghMXi483UmY1AQdqddc5wfXuwFcgntmhi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7f5da9-35e8-4f42-6f90-08de942ca000
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 22:34:11.8590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwSQd2DnSD1AdMcO6GoXGyUjpQtwNGqQPazGzvxph9szymqRm1ocEGpxQWHXisQjwWaZNyx1r9Cn3XeIPy6vShdItBJYUo18CWjrkFvcHcGoN8JhqSwD9DRkrteOrKD3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13697
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-30904-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C6D683A7E20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John, again

> > Agreed. However, since rsnd_src is a per-SRC instance structure,
> > I'll rather have these variables static in src.c, as the clocks
> > are shared across all SRC instances but used only in that file.
> > I hope this is fine for you ?
> 
> Ah, OK.
> So how about to create new struct rsnd_src_clk or something,
> and has above clocks, instead of using file-static, like below.
> 
> 	struct rsnd_priv {
> 		...
> +		void *src_clk; // I'm not sure the name ;)
> 		void *src;
> 		int src_nr;
> 		...
> 	};
> 
> +	struct rsnd_src_clk { // I'm not sure the name :)
> +		struct clk *scu;
> +		struct clk *scu_x2;
> +		struct clk *scu_supply;
> +	};
> +	#define rsnd_priv_to_src_clk(priv) ((struct rsnd_src_clk *)(priv)->src_clk)

About the naming, maybe rsnd_src_base / rsnd_src_master or something is
better ? It has SRC overall items.
Maybe same comment for SSIU.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

