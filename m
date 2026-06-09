Return-Path: <linux-renesas-soc+bounces-33730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VdL5LXm5J2qv1AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 08:58:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BE865CFF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 08:58:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=f91ZYE7z;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F90A301586A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 06:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6811C3C4B78;
	Tue,  9 Jun 2026 06:57:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCF8CA4E;
	Tue,  9 Jun 2026 06:57:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988278; cv=fail; b=A9x+1jVaLSeR8WHgBQMAFlZ6cz9Mi0oBTswTvN49PaEh6Cj2wLzAhwxUmAKOVapsrotA2w6E2Ta24CVQf7hclx1M7jRaqAPMZtKYSHDXRjcA+eE+oz2kcktGdRzOrXLerAGjsS2OBjFBvCH49xr/qVJ2E2kfAP0djy18qP3ZiW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988278; c=relaxed/simple;
	bh=sNnUOq9B8E+J/GyEOeRDCUKypKc5ZWBS6Wx4l0KIxtk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YBfdRDl3oqawwPF7c/vfyDpMawaquEBJ+4rCLahb/1fvvCxqDJ2kWdiaQ+h19ZUbTEdWdUcqG62jRSCjtKl7SnpCHprv1Sf9xEJjEEZFo0ENADClxwy9jCzpQ3oZkAnUlF+Ccyl8kbqihoIqA7oDNJ+UlssWTSubFsICGxrLM94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f91ZYE7z; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOeXtMe6HFFmUegR+EO1OZNsD0k9CRbvnUp7gSbBVnNLJJ414vXFLcLhu+7bVeVeu4ZkoZb1woccm4UsRor9jWsI1FhHyVKLlj/UiU+JeP6WG86onw3P6WhbGwD3UZwUcVC/bLGzGvVOIJi/08SclXe2XWDDAV7Ul/pazTtKlFYEA9ExXeqh7vPHXRtwrBq4vL2/MbxRh1ChxP6clZiavbpZGj+lOrZNCdIOlwS+/hWDhrZ2occZAyAtWRfMXoifzafxioJ4Tw1ghEo4Yo8tNu7wI5TL//LpkpUAAAI+8R5q2rJkYzifZCGMnXYB4Vax+STiAyxD14rMsD4DuqljHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXQiuIVbOPbgVOJgKTdLbLexHNifA6jxGqjgoYK1DyI=;
 b=MfwkiwXBYGlqfeu8/ejj/MrJLPqB+4iFo4P8ov0C4v52RDfEtuwaRNaUbkyXU0KrSrX8FV/yb1P3MlHtdMYVrPD0m5JMmp4TTB5PTXhNvEEnUqsEdFvWE6PJNJuRtfVKo32NnI588c+Sk+aMAJBS81Pfe5aFFS1gHk93mtGXDnGP0UR+68t6i9BNtf0ijGG6Xawx7VhCyywdWP9sW9YZP97tUqZWE1Zbg3ioUtZox17Wr0PLgAh2c2jfQvGvlduBcdzrAk+nz+KiVwVgVb+i2noPXMlQuv6gzyVlO0GEeMII07ibvFC7SSIoSma5/aJAkc4omeS7YSQb6UsBl4+hYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXQiuIVbOPbgVOJgKTdLbLexHNifA6jxGqjgoYK1DyI=;
 b=f91ZYE7zg0PdjEhkDykX9AJIOAZS/4Mx8Zq+1zzE5RKn9NIuVCoANKVItfFTO3p4Tte86ZlLDT+6kQJPc2VZ4oFg34EEEkhpoUCFkznAmXoSJtauyykz80Wf3C7vziWyYzMwu8DzS4X9pjRYvPnrflynAOii72IMlF0oPO00s3E=
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB15652.jpnprd01.prod.outlook.com (2603:1096:604:3c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 06:57:54 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:57:54 +0000
Date: Tue, 09 Jun 2026 15:57:52 +0900
Message-ID: <878q8o2ob3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 00/11] ASoC: renesas: fsi: Fix system hang by adding SPU clock
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TY6P301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::9) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB15652:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c8dcac-a7bf-4a03-3a7d-08dec5f46dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vmlt7yDvbE6k1Zinagho2bsBXLNaKNdwUiAbsQta6UNLQjEL3eWWv6QusF41XG5/A7DATYxMKbb1usGCc5OR1+rFkTtYA8B0URqByN+GgM7JKze9uwNZV/8GTmcyXsp8T46refH0ntCrp88MSCk1iUYocAwLX47hdtk9+q+dtPqSaBB7/Fcaw9Ote/Miph01cjkqIgfypVACV9/ZPH7Lh0Mq3n9p6+xSTMzyeCbw6hR/c2ML8A3sWF4S2Xm8hanjX8kmHDovNeXH8aNayuf/5DvicHx766RYmB+va3GPz9Jg3XjHJF3Vef09VFNPJ0DNR5DgesmB7MIRyvztTDnwrmffXpDd/AciR7TtjvvtoG6MUHyL/DKehTZVd2oGIB3oBjg+jQvnMLTRZ5RpW3uB02eQQZmkZhSZ0U99MFc5Gg+U1jzj02UtTGeyLZdBbsvuf76haxpRytt1/L+28384+3zClM04CzMxwC5Z66gmTS3ppbm8txq3Nv3dJ3zcl0pTuc8amzS9MWtFX+gnmrNLt1DCIIZ+WZhJIzizztrTG1SCbOyJKDyx8bUQ6Tm6Ia3suQKin3b3gppf33z58iXmNh5JiEE4fVHoIRNqaTTKYCBLffmBkJVWCcynqXKYDwEUk1tOi6G5JrRSnwxkCscATg7fajZvIdNtQLTMW1tCqe1iH/uZJyd/98QGsJaEB8/L5U8b2qEUgOfwQHhCYtcILgKOWei9hpFbh3KvGK5hQ8AEDAJqRydWM8uXEooel8H/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sH+BlBWzlYJN58UFC4p+kL/CBVz+ZVSW8U2vWhYC3EVYwV/PZE69FUv7/gSJ?=
 =?us-ascii?Q?vCz0HVKtu5AdECMcEADxT9GaAnT+/EyiR1vRjt1nKkI+OCWf6TqT8ZnFwSVc?=
 =?us-ascii?Q?TIfqwa97ByxE0aWw6dqDQL+Smpmow1wq56XZOon1eFyp9XcX/lN5/hO47s8J?=
 =?us-ascii?Q?Ea3HBrwFM1CF2Q31h9p7xW8xWoIw5wFyG33gVno6ntuaSlrbDsPjwZfurmc3?=
 =?us-ascii?Q?ZNogEb4EeAnzZxfIOeSBCrAPIYa8gPX22ePZsqRo0GdK2gM7Vf5Ry2EvYTba?=
 =?us-ascii?Q?D9rOuMN9L+ycwVlhWAdnPuTrkTMj0HHsYNnyE11BUoOeZUNRUw97NOoOA2OD?=
 =?us-ascii?Q?MFDre5W0QgPIZDrpNzjMpMeH4vU0ZZzkGDt3ypOd5163gLJs1x0GYke+AP6J?=
 =?us-ascii?Q?eZW50kneWRQu3VLXyh9tq1T/DAVVsi3GWjRmMwE/8wswqnDAC/bwBd2+cY9z?=
 =?us-ascii?Q?u4/MbPOPNJznmz9oHHKfMfwhvyCbgpIFQ14wWClOjhrvS3IUfW8W4ZUtT989?=
 =?us-ascii?Q?0SSZ9MncRh5utxvtMKiwyzKfewjUD0itaLyf3T1TeqB9CwdHDF2zUlFTAvAl?=
 =?us-ascii?Q?d9vWkF597Gd8sWpAC+kgoIssvflLJK6KGVkRNd+dMy7N7G5auJ4v7uZqUCbC?=
 =?us-ascii?Q?bNry2o/rYAQFhBVBQ7mUoI5pc1yG9XddqwMpOGVcviYjIBHXvsHA6aDIvgen?=
 =?us-ascii?Q?Ua/NjrTIRyCjcLbXT3KeoerN7T7Cf73PYVv9hoViiNXhRuOc1SF2lrRCSGbM?=
 =?us-ascii?Q?cDwxSP9Z1PwU1hzZyRZlE36ZQGedOSsCGh/EzhLA2773WFF+qLI5603+VmJB?=
 =?us-ascii?Q?xqUZObTUvkkCXGjPYyinwOc7uQEkH7b/8nSG5kPqMq1owDGOIuKzTckJVFSM?=
 =?us-ascii?Q?tzVG0nXsPJbIBOtxaQH4YsKfuOfJvpRul2mudZyVSxGqTmYxIsb3hAqOVNGi?=
 =?us-ascii?Q?MZhK/uAxYIAXeU/Gzli6rP73yakQ/fdTvuaCKlQuR3ZXCCmTA25vQ1GxLkpX?=
 =?us-ascii?Q?Xu4pCSvulnvDvzr1UjBgSCvVVDadS9gqFMgs4fugTzJ015ZhjjmRWoscTcBg?=
 =?us-ascii?Q?dri7sMu2toYkrHhsW3xTYj+4yFHIRD2rZ38RLOnd7ZHzOwxv3S7hIf5HkTPz?=
 =?us-ascii?Q?HHJ9YwWGoc3bzaVpLfbsuuDBO4p0tkTWRrh6PC2TzhNOSKRX97GaHk67IPKv?=
 =?us-ascii?Q?9n6+80MnXfP/jABjwxMWPENfH6CuUoaZZ/CR8xrEI6+jUCTFGO6OfZttWqFZ?=
 =?us-ascii?Q?+4i4GVykZXBpahkMgMrniW8Iv/aVQJm5ScUWgKlVzV0i+ToBGroOZOIP9hcK?=
 =?us-ascii?Q?9b8zdp/XP1sehtn7gQjpFkcCBYZ3MUbNOkQtIj9+YtuBNjNm2y5U3oW9j5IZ?=
 =?us-ascii?Q?4RUCHvUih6YN3Nphq6DOqXGelZVCwjp6vW4D0X3OnrZGtbxDtdYA96sqG8cV?=
 =?us-ascii?Q?qHhbTL0iPZFikDAd0Sd3pDNE7OaoIvBjQzr3AIjRUfpQnZxyrQ5FmVNSq77F?=
 =?us-ascii?Q?7CU6pv6nwDthHI6LnGhat3hz4rBRWy4NhESK0kjsYSvpnd7gOcAvq2/naNIA?=
 =?us-ascii?Q?c8lpG+V1zt3tqRPDxQDkQd8bO6XbcZa7hmxO8eWZP+/TzV9TJmkV4wo+vtoJ?=
 =?us-ascii?Q?L8R1aHxkGkw/EPxMZsgSKF3PgfbM++8ZorRMpeqjgFKzC6dbLR6bmUy/GexB?=
 =?us-ascii?Q?JnOTyZRQw7ihNrvvME+hS4loOIF1NMjU164lAMiGDW8mdP7Iywcos8+k0MYI?=
 =?us-ascii?Q?deUpRzkB6oOyjJYpR2kCtZZZVnfr4/2B2f71kqVfrA6sND1VzPBt?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c8dcac-a7bf-4a03-3a7d-08dec5f46dfe
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 06:57:54.2601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxX/5Wzi96Pg79jEbowho6G88Nr07Dxd0+JDaa4cCDK5Luf6xh5D5mB4BiBcU+41+YhhAJH79Jg6RLRPOASGAwWeJ5B0qwCfD/48dPN/mUKV751npWmZlhiS9R2sr3wI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15652
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33730-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:phucducbui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,perex.cz,suse.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:dkim,renesas.com:email,renesas.com:mid,renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57BE865CFF2


Hi

Thank you for the patches

> The FSI on r8a7740 requires the SPU clock to be enabled before accessing
> its internal registers. Without it, register accesses may hang the system
> even when the FSI functional clock is enabled.
> 
> Previously, the SPU clock remained enabled because it was left running by
> the bootloader. After adding the SPU clock to the device tree, it is
> automatically disabled once system initialization completes.
> 
> This series adds the missing clocks and aligns their names with those used
> by the driver.
> 
> Following feedback from Morimoto-san, the driver is also refactored to
> improve stability. Clock initialization is moved from the runtime path to
> the probe function to simplify the flow and avoid redundant setup.
> Additionally, the shutdown sequence is reordered to ensure the stream is
> stopped before the hardware is shut down.
> 
> The driver currently uses clk_enable()/clk_disable() without matching
> clk_prepare()/clk_unprepare() handling. This series adds the missing
> prepare/unprepare operations and moves them into startup/shutdown paths,
> since clk_prepare() may sleep and therefore must not be called from 
> atomic contexts.
> 
> The series also fixes a race where in-flight IRQ handlers may continue
> accessing registers after the SPU clock has been disabled during shutdown.

For all patches (except DT)

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

