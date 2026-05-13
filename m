Return-Path: <linux-renesas-soc+bounces-32542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJlaFX/JA2rD+gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 02:44:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8061452B9D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 02:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9F4C30015B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 00:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73A42512C8;
	Wed, 13 May 2026 00:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P4RiheCN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446BE1D798E;
	Wed, 13 May 2026 00:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778633080; cv=fail; b=JPyzbsOBxzt6hG0ur5hZ/TeqUzL7zVb+UGan+3+lkH+R/6O93+hykP+Nnd+thCd1guVwVEtdv8J18PokTFAj5jjYBhyp2hGlNFuSMtHULWeEP7xG28aAWwBOAVeCkNZ/Xp6TdIT/wj//TBaiJk/87vnaPCpVYk8h5AChWVJTo3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778633080; c=relaxed/simple;
	bh=gzwC4770AJ5g1h9P0frk6hFpzsAKQ8o69DNxVX7Kt48=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PgzBzZ7e+69PLnNRS8k1lHz9R+nnUnpW8rGmL7sBlJLxdqN2Q3k8DEryrwVc1Oq8/CvxzH6API6YjieiRk3jSKyKWSexnS0GwR8/dNimVhZOTEYkfMW1H35vinDtI+Dqw3uqlG9W0aRcpaWv+RraiFBIWK+PPJZGwOrH/dvBQtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P4RiheCN; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IookooDesiU7eQ/7ONnChCB5x8QBBBklaq/40wTNzc9DPfeZigoUvHi4TzTgkyP4+81pT1yqQXCQLRcXHHoq4LeAc2jvUGxd7/rXkg0iyG/q1BcxvGOXqIpYH6GKZ3ZNvtILyWPlqB5Tkg7tZANymOZ6RzsOftmMED6RRTC4fbnE17aL8YB8j2lbS1y5wcAd9bIdt54rmSV49osW8akDt2FGWzpM1ocGO54SeI8ZNF1W2lrbBrsww8j3tOd2iOMR7tCnkJcs9SdsXe8XpwnYu7sHo9ExK7utCraRHF4t+RSVCF/3O1OAdO/KRn5kX1+M5TcBppIkS/rll0KEcS78XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqxv2XpISV4/SpLZmST/x+0FHFBw2JFNhIVjrnr79dg=;
 b=vonQ6sI/z/0sddR1u1bJqZqq31y459g1+nSVSDqGQej2KFDHiJkj6AAL0fVmvjbz0jXpzQQrn1Y7RziP+M0U77Mp+QVlAfcsNkWYBT09D03CiSZVdavKrlFJdQ+A7Vvl9pYqfWLgCFJhBMzpR1lDRr0CZKNTqaiMWgHcAy+jcqHJ1Bo4WgJhzBOotmCbJNErSBXkL96ZPEWCov8EKTnPMaxqxlzEyNQnUfjj2ATWD0PhjA6z1noiW44wXMtkL5J2FaZ6chjwr2LkRsHrhN8oBocpGrLVtQ31jwfNCfBTnk1RLewwObspGqzgSSQtGRizME3qwagBUH1sFwrOCxQ2wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqxv2XpISV4/SpLZmST/x+0FHFBw2JFNhIVjrnr79dg=;
 b=P4RiheCNrxvfr+JcwbawzXpR6nlVwfDiRoDjCtTPq7kBXb8x2ph6PI2qxzvL818ljqB8MU9ykAXJSt2Z3UfsUvAnurgGf+J6H2vsuVJ20IexSCR507dmf357xWJayXURnHYaYYL5OvEHi9lmbITh7Dh03IZbO95SuvK9toGgj1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13006.jpnprd01.prod.outlook.com (2603:1096:405:1cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 00:44:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 00:44:36 +0000
Message-ID: <8733zw6suk.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v6 14/16] ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
In-Reply-To: <20260512182631.3842065-15-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
	<20260512182631.3842065-15-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 May 2026 00:44:35 +0000
X-ClientProxiedBy: OS0PR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:604:26::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13006:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3cae4d-59c3-418c-27ef-08deb088cebe
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	wF/Hw6O2VGXZCL8oTvTT/ST3u0wkfjnRA/aAgWdd23gnj7t5fTCsigA5fsErshG8780STmlyQhDFeSLjeAJZz1UUkk0fDEmGju1QH2Xt24vfEfCXs7BGaS/DTtvW92S/olrLvT4sDB92UiZ4gW8b+lVxorwrSiEPaqy3OA727jpgqGUFLbk+N+lPPA54RsLr3pm4JNhNd04Ze/7jGOV+o9/PI+P2eprJqjjkYqRV7Qz9IUvJ20GlPfMFTpjwtFoYLV9hW5lrk/uVmj1EdKwIaL3hH9lPhOYWg4F5cRhIkALEwUJ3+h/X7slzQ5MBwRxpm5CWmD+WosJsBw51pE8JCEseTjPgAfW7V2/hes4p2vJScrwBhOX6/72fIBzhVsOgHTx5s/Ba+ZUYX4fxjcpOURZ390JGG7KeWyrwXbd3cHzB2GB34wjKC8Xs05B9OXhUiqM+SD39WXd2rTgeuSAIFeO7nhLPqvz7asZLgy9bHQeMYR/LTmJPjpDOfdGgh8mseiOuMEP2Yg/gIHAzInsDk6dPFitSug0zXeM+YINy56nhUjOJwzu3CSt1vmrwNJMIlslwHfgEBciAVYWSXxdupUFet2GTVnF3sIMvK6onkIeZ8zvwokDDBM6JtfdimzIfhEYpgult6sBGhifcOQsvfwSAZdlXb+T+JMXhYM9v4/JUbK57koJ+iO87n1Av2gMaP3mWqXtXswF03q9/3g+szHkjsXdiJcubafW/bDw5DYEIDoCW3jLJziKBo9gRVAAI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hUAz2wv9cNWISFDXBUAQ1It7UQrrVVkbLcraJ6GkOv+t0LOiIdsmLdYB2v7v?=
 =?us-ascii?Q?WrR0CEWSH/dpHQyrMyyxmP5SX5RHYduSF9moCz0vICDhLB3ljlY7oZ8d8m/S?=
 =?us-ascii?Q?ON9LPnzxiBXRaPpK4wVzpBk/n+1+9Jdj1BmhTv+P0tTo5nXeqSL5e82xqlkI?=
 =?us-ascii?Q?b1NIbFiWeO43oBbINrsSLoMllNjzjuhIY490y6P2ymyKrzqgQd/17Y8uaJfz?=
 =?us-ascii?Q?dloTsr6Pyt66ryDYOpy4ZwR7K8+L8TD9WEZf+TqU3xhbySCLs9vKWJrYl/Gl?=
 =?us-ascii?Q?jI4xY4zQqdqfwRX5iIQ/rUygv+4RGp/2jasyw1kedUBVzD+qfr2wyg8Qc+3A?=
 =?us-ascii?Q?V8nL22vUQPuV69p8Mf4yeaWOAPSS50ZwqUJzltCFuqepveMs+zASy4Dlmwgm?=
 =?us-ascii?Q?SHFN9N+/gY31xeJ7TpSEJz+3opTYjPzZVztqJh5TbWEhrcGWrq9PeoovbbZ6?=
 =?us-ascii?Q?jcu2XMRdWTsSuPeHopg8OVo0SBUKGR1mEWibqJXs2LaztZgLOSdep9ulaA8f?=
 =?us-ascii?Q?pnxF0MYLU8kQv69XllvPZNx0S1i2ohAVb68t++tjyf1HBRqUZZHcCeCD/qwi?=
 =?us-ascii?Q?E5FlrjlMhsU7OueHHwkWdlVymbnvRlM5IGOvwlO0wPnYfIB/4y5EXt7hAlCo?=
 =?us-ascii?Q?q/fbwejlzEWcX9N6G9Fwc1uh+afGSy4FB07EfQ5edN+p45Vl7MS4z8PlScPp?=
 =?us-ascii?Q?5s9DWNb9TZagbB33PA6qKA33xCi43Hqz2RLgZeJPa7JlnMwDFze7OHL+1thQ?=
 =?us-ascii?Q?KGQZwwWwuaHWVTlQw9ngIAVaufXtLZffOwcDhttGNks3oaA61nfiZVphmKmZ?=
 =?us-ascii?Q?sA9J5fBs02BHkhSbV940O6nQ+bmjsPN4X5ufi171iX18mh9j9Vy1g3YUPDiB?=
 =?us-ascii?Q?r9cSZ0csP2rP4VKzDkRRbQP77REGUFjXJ9CkDHTZM+sWggs+Z3oO4+Tdhm14?=
 =?us-ascii?Q?R+tuLR5D4DJnIfCoSae8+TpW2GkLOfeA86PJe/AuOv3nxohOPGxzPfNWF22k?=
 =?us-ascii?Q?kIoTEhqQZO6lU27L/3VPg2I6ekR59JWuM9wZkKUpJIDMmL/eahhHx+LhZXtc?=
 =?us-ascii?Q?/Qz/rw1wUHqCatVwaOIGq3ujx96axxQWLTrhlkj8nApeR1LNo5/tymaHPner?=
 =?us-ascii?Q?p3px6XkmzQHOmvTHe5EqxNVThMjVPCcclFquCdxS4ijinFTlZK7k871GlvgJ?=
 =?us-ascii?Q?K1bh3Msu7OqZno8sBpJ4f5N0FwXkoyzjJV867sB0RPrUUh9sN6yZt+fj8WiQ?=
 =?us-ascii?Q?4bQKyyx7aT93YkC5bSJrKMN4WxrXJncnIka24ppC+2gmCBTbsYYrj56WayRn?=
 =?us-ascii?Q?WcF4YdEaqKLVPiEygrWoSnDh67kr8PJ2frxu6hym/zPMhhFL08esOD3UHg/w?=
 =?us-ascii?Q?2HE+AvH7Qe9yumRa2qsUcMt4ZNkf8emdVOvfMDbPCOs1IkSo6MBKeBesBzCP?=
 =?us-ascii?Q?gImqQuba3RqEH0DHaVxQ2bkvW5R4O/vFYPadc0oHw9kui6vDi7fikPhh3/Rd?=
 =?us-ascii?Q?K39UiNR2Vpi5poxHYI6NRILJ4ylUbKTce6s2lLayjLIly+iurez5rt31P8ep?=
 =?us-ascii?Q?NpTTzfgYbYBobhy4qFLd9zw9J9h6xHmwCzsg6tMPQ2/4sD/nMef8aRqdYgQh?=
 =?us-ascii?Q?Hyn6TBWLv/Ae/biInFahviEW6K+O4OVbYxyHrW0p2x1OoY/kmiGL5NeTOg6c?=
 =?us-ascii?Q?AN2oOicnOOSd9VpvP+JzO7YMiGRb7CCAgIjAodGPdqIYOBxfZJulQ4SlFCSe?=
 =?us-ascii?Q?kixmTMiaJO3VBv6ppjxm/DIbO205kmj57a5b75oaMb2En10sZ7bl?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3cae4d-59c3-418c-27ef-08deb088cebe
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 00:44:36.5282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5uWPjtfwf7veE5OtIv8FVp2XeFBcwklvwiKQt8B1WT1k0HkvF2MAeMuEK/Zhz0Hw1+H7HJpoVVf/kVsFg5lWKxPEk3tCHxfF2d0k2ph6HvsonD3fqtIpC25jI8hvZdF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13006
X-Rspamd-Queue-Id: 8061452B9D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32542-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,renesas.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


Hi John

Thank you for the patch

> The RZ/G3E SoC requires explicit SCU (Sampling Rate Converter Unit)
> reset and clock management unlike previous R-Car generations:
> 
>  - scu: SCU top-level module clock (CPG_CLKON_15.CLK6_ON)
>  - scu_x2: SCU top-level double-rate clock (CPG_CLKON_15.CLK7_ON)
>  - scu_supply: SCU register-access / housekeeping clock
>    (CPG_CLKON_23.CLK14_ON, described by the HW manual as the system
>    clock for "function modules excluding SRC0-9, DVC0-1, CTU0-1 and
>    MIX0-1 (including the setting registers, etc.)")
> 
> Without every one of them enabled, no SCU register is reachable.
> Add support for the shared SCU reset controller used by all SRC
> modules on the RZ/G3E SoC and manage scu_supply with the same lifetime
> as scu and scu_x2. This matches the hardware description and avoids
> unnecessary clock toggling.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---

I guess this patch has 2 features.

	(A) add rsnd_src_ctrl
	(B) add rstc

These are independent ?

And in (A), I guess no one is using scu_supply ?
If it is just for lifetime, and is necessary, could you please add such
comment ?

(A) can be merged into [16/16] ? or be as "prepare patch".

Thank you for your help !!

Best regards
---
Kuninori Morimoto

