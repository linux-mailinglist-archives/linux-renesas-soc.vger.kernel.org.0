Return-Path: <linux-renesas-soc+bounces-34103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gNCbJ8fXMWoDrAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 01:09:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C8B695AEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 01:09:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=dsFKPDLu;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81994301708E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 23:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFCF3F54B4;
	Tue, 16 Jun 2026 23:09:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876BD39768C;
	Tue, 16 Jun 2026 23:09:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781651396; cv=fail; b=pi0oCDR7oSkRSLjtPjysMlFIDAtJ0tedszSxVxv44JHXq39wiwll7RtPGIKqqvIuLYm+JPfNOUEwqMwdza82fwGLcO+W7aoFN/eWLM+1eGszT3Ba41m+v1rSKZI0f/g3dVlGMRoZg0nRp2irV6L3vW7hZuuQ60rcBUDf0gC8w3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781651396; c=relaxed/simple;
	bh=ePlUpb+5hSy0SqPvjEUPTtKskHFBXJsJPeHBbviS+No=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=orDE+h/EMmLmsFHF2oUO/kLqPpSGcW8eSgZBYZCDKLuofLM0yQsBSTE8F50gHPNPjDSxiXYB70BietTo0L9V5+jgfybIpNTkGNnZjDRencsY6gi3H0EqeKXXOhGfu3VaWt6HpyV9/S2gu2/1ByjRuUD/KW61gfRZ6CInb2ooOJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dsFKPDLu; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbZwnV7nvh/BkaWHc221e1S0zY6cXcubQd7MmklL7WuqJYK/C62iBZo54Q4xKSi6R6xxz6wjfJYD8kxzYYgo/yACrCV+aWHQ4bcnkqAKk8aMZiCTlWigAEWZcF7FjlIzOaKr3RgRV2ciqD0uT3wCnDnE7scAXLYpGd0E4FKx70g9BQtzehnopqgmrbW71ihZ1Y7L7+G8y0ZoadzWkxG9+sVPM/T4N6QGdcVYnGSrDm9YhF3HC6uk/+DcbqpZM47ZXZ5229XYjE1HTdZGAHercUoG0ponIUBa0Onoo/n5o4pbaidGgbGDGdDquRFgvNFFDRwZtGhjpOkDrmfrJ2Yc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thuOSP2xYeOBKRlOu/ATJS3avuSl7HUXuXm8Yw2nV3E=;
 b=x5RSBv7ZUMtvQkNkX6Yy0XHoEywSrMPOZc5/Fy8uxmPZG3TeIY90XRFcUpMKumN6K9eCLOD8CfiHajffiNUBJiSM8Kfkjvn2smdfqfvsVviwk3NGc3TqCFSnsMwGSxsGrt9z01tHCh/4cIfJNLdm5tGnJO7WnR5KZQEB9onqe/0Hq4+qGUVjY7HNOKAx7K4bZmuQg+pvJP8e/UIojJ+J9JYGrua45wuLxvrAivYIejyosP06E9jEdvREhV3NE9Iwjmv3yKBoWmaLA0psfX4a9NkimtxNTYIWohSv7ySYbVy1JNrcW7DQa7/jjxwPzi7++i+INNyWO8Cby+DeHrdTyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thuOSP2xYeOBKRlOu/ATJS3avuSl7HUXuXm8Yw2nV3E=;
 b=dsFKPDLuDxCmi0g6DFp2bqOvS7QEwplxfasxnIOd06HrLP69IvyG6BhLVp8uWu34zGNqtqfL3rt4OwOR1Td1INCmUjsQTYeM5oOi3v5+XzpBUCkiabsgWr0Oj9mOdx+Zvg9iG1VFDs7gRp+IJJ7XU4GoYpVjqsBm3MOkaIDaeQk=
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB13009.jpnprd01.prod.outlook.com (2603:1096:604:332::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:09:51 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0139.009; Tue, 16 Jun 2026
 23:09:51 +0000
Message-ID: <87v7bi13rj.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <TY6PR01MB1737795DA5F4671C634CCD766FFE52@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260610164704.2211321-1-john.madieu.xa@bp.renesas.com>
	<87ldcmovp0.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB173775D8E134C9A90BB069334FF182@TY6PR01MB17377.jpnprd01.prod.outlook.com>
	<87pl1rmci8.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB1737795DA5F4671C634CCD766FFE52@TY6PR01MB17377.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Jun 2026 23:09:45 +0000
X-ClientProxiedBy: DB9PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::28) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB13009:EE_
X-MS-Office365-Filtering-Correlation-Id: a3332d01-288d-4825-ee20-08decbfc5ed4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|23010399003|376014|52116014|1800799024|11063799006|56012099006|4143699003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	UVfhGOsvvgO+2jiUuAG1W8vndvIlcryc7L+YKSg27XAwqNQQFF32TY1mUmEauK/vka6yn3Qp4Gu71yXcOkyR2pSMnzHrd5KNMmd1yVFqOO+PRoqwFF1gWk3U3CJ2dR/m9yefX0ePU/a+LkAp/CToFcGrgFQZ/9iaG8toNeQ8asQP6VyvB6zz5xrJ7ExYh5k+z9Dm/bOeR8Rwn6nVI2ahfzpQOyVKaP0K3j6wf8w+2ezBunRvTWxMTv1VpRaU5NCvJV/oYlFpipjSAwmljaeAPTul754xQ5nCpLDbGcs9Mlxvq9a0GXq3MvlAQAaebSDdoqf/ZCSgBLYXN87GzdYK4rF9im58ctHzfRO0r63tZ6nhhu34Lff5STJZz4FJrwRrqlGlhypoRYKenQGm2Am4mfQxIqQSpRfQWApcpkVHpoXRexFQks5d/FDKjUIKsnLl3UUi280EpIHJZCNpbKYhEBH51vXUtatxJT7zEbser1nGZYdQhxf/eq83qucwfRRKPD+IVaTBZqauAL5kshYMrusaWtuoVZCVUN5d0kc+3c1KmbFl5aV2d38gyEfTzebU6ps+ien5YhUaqLyxiJS80dAmcQ2A18vax/Cc047R1qtKZhIeYf7jIgbOiSuQL6sxjB1mzZH8Pl5u58dV6bK9n9+rnudOw4Ybf47ZpnSYV/4zZtOBKsASlKyItH1rHIkUz7MTnfpfKTBitjrBIXeL/D1lAWgtJclYEqmN+GHyy/9fd2GZIFWUzxFfdfJRBLkO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(23010399003)(376014)(52116014)(1800799024)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+TszfLlGiwvmVn7c5bDaMqm67MV5BLIyC6N9FfWRQRjEJUSTVuEfDuVbMG3E?=
 =?us-ascii?Q?qxAebgQc2TZoqeViyJJBWvtVVsx3+gio+tQOla3+B1HuzIeg72l7vi4+ELb2?=
 =?us-ascii?Q?1AffH/NoZfAhYHGaJ3/UdPnBdD9MZpHuaL0dP0L7tmaW2lZBAvC9lVezT86o?=
 =?us-ascii?Q?UJGMcHQayi5yKfEtqwWBtMICxAY61IVevz23L5bkP7+/5viIyh8Ynk0w4JUW?=
 =?us-ascii?Q?OjfjLqq412uRgHi0oWQfvOX6Y3YOF4PUIHZJY1+i0X7qtzaTnRUaLUbWY6zI?=
 =?us-ascii?Q?oDY9y44GxS/5kQhCPevC8+ypZMpJloYsoh99zgeJnuuEOM4yWZBpKKu8E6u1?=
 =?us-ascii?Q?VZyxIJDWyWVzumOIet+G+qd2JLv693TsRKkr19gC+oSOtuxgE8X1ajrDe7iX?=
 =?us-ascii?Q?JvNfR34EVhbCBZbozCS7478ebtRIfLd7b4xKSET8CoZK5uOOa3Vfoha8U3Q7?=
 =?us-ascii?Q?J66C6gLugyrKCQpAMBOfM4/Fr+WuyhA7XfE/V4ZoghO6gVeB13PVPWbU0W2f?=
 =?us-ascii?Q?dzT0JYhiIclfyVC3P6eByZeinUKcyN53yNB5ejxNDoFo+OZUKFosOa8Amnhr?=
 =?us-ascii?Q?7VKhRemq0WOP4tRAFyn5PO89FC+ee1kmgPSFH/AyaxLCwK7lqZEMrAv1tyUk?=
 =?us-ascii?Q?iYpUhj7lmYBOwFXD1/cyhkTqS3Wgz1MbK5B+V0vx556XoRVVB+dYnNc6+vX0?=
 =?us-ascii?Q?k3kGrNkIp7+iYAMGswkzL+GCV47CHeAfyndXqU71kSZVqFVR4rBamd7Q93YW?=
 =?us-ascii?Q?BHh3NzPO7Vlf0UAsa9t83nFFIuCFfnBqGxTACJaT3emPPMYRXlEcfpoabSI/?=
 =?us-ascii?Q?IasftB5FWMVETQpFs43KftDQffmuQPJ2a03+a2fEUKr09MLipEwmDuXmm2uP?=
 =?us-ascii?Q?XwyUIyh+SIypcBr21NyLIX+HroZKqdDm9KG5304n7eONlHBofazI8EqILu8X?=
 =?us-ascii?Q?R76FpTJnz73q/C1VT5LoiXppszamNHglTg07NbS1YxH48QazgeDN9W0HtBLU?=
 =?us-ascii?Q?OIbHtYMyPmpjAgcGqIEt9biv74nauoZivkyVGm+CvnpjpwS81ig5iReEpFLg?=
 =?us-ascii?Q?pG3WNLYmVUltX5Xu3D8k/fAeb5GJQTqUUtsO4hwRbLh1Gf9Tb0tCSgpDjUQH?=
 =?us-ascii?Q?GNeqayCOEwxMw3705rnmf8oKAFC8ioMEUnoRuE913huPbqufXSBPIJ21OEN9?=
 =?us-ascii?Q?euqyH/ATzPWCxg8ePG2P/LlgletTFFvNkwjE8oHzX6Lo3CBrXRh2l60APGyE?=
 =?us-ascii?Q?5pzfwgTplKBahLszoGpuaK20bfrpOG+Ibmw5yk7bz8n6eFEtH+/VLs5oXbC9?=
 =?us-ascii?Q?xTvTeeDWzdlk6Ez8SAiJcA+LcoYuVKuqANtrWmfQw3cmAd4FN7/MlN43EyBJ?=
 =?us-ascii?Q?nBhDJTeRfjmctQNZ8JwFFMRh+9Siw3fWpuhBB4DJ0fC3B8KcoV6jhO4vawoG?=
 =?us-ascii?Q?DLuB8JJmdvVQkqpeDouyQWe6/cROhieMXEmMDyghYsqC76NbiQMAAlhC9W71?=
 =?us-ascii?Q?6so9fmjrI7oWDZGIU0kNqqVK/4bJDVUr1OwksDYJ61rsVU1h2IMKZiitnYYX?=
 =?us-ascii?Q?P0XtaL9hOZSGZrInVhkKkl4kY7StLEDpIr2+KFtk8rIaYoIPyOzaHRIUWKxk?=
 =?us-ascii?Q?OBP1Md1S90+5/Cgc/NI8TWOdjjel6T3vIXszFFY1ioSU3ur776mZ45+MMt/a?=
 =?us-ascii?Q?cY3nT7iKOfDfw8RxId10fD5nvQk6AiMdIqIc5nynYrB2MB0luUPr0d2VwAEs?=
 =?us-ascii?Q?1tR9sEHHqWY/ZDTZVJq1IrZE0XZ0k1Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3332d01-288d-4825-ee20-08decbfc5ed4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:09:51.7518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGOzpdFaFazjxBo34qT6jFHe6ji4BOUmrrqcB5XjUI5mMfJxIJ9g/xjolOgj7dqXlfsGVMw/SIG45LHZdiFHWPPBEUVFu/eS/Lr/459BKM2LgW/p6I9Vlw4WVsFFIfhb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13009
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-34103-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:dkim,renesas.com:mid,renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39C8B695AEC


Hi John

> > 	- #define rsnd_adg_clk_enable(priv)	...
> > 	- #define rsnd_adg_clk_disable(priv)	...
> > 	- int rsnd_adg_clk_control(...);
> > 	+ #define rsnd_adg_clk_enable(priv)
> > 	+ #define rsnd_adg_clk_disable(priv)
> 
> Agreed, that reads much better. Splitting the two directions also lets
> the new flag handling fall out naturally: the enable side sets the flag
> on success and the disable side just early-returns when it is already
> disabled, so the "set clk_enabled = true before the rollback" trick from
> this patch goes away. The shared teardown moves into a small
> __rsnd_adg_clk_disable() helper used both by the public disable and as
> the enable() error rollback.

Thank you. But, your original patch-set has already applied, and it is
merge window now. So from your point of view, you want to include its
solution patch as much as possible ?

I think your this patch (= ASoC: rsnd: adg: make rsnd_adg_clk_control()
idempotent) can be applied in -rcX, because of bug fix.

And, the clk_control() separation patch is new feature. It can be for next
kernel ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

