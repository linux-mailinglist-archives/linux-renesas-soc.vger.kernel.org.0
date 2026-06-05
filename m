Return-Path: <linux-renesas-soc+bounces-33635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RIHTGKwAI2pSgQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 19:00:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC57649FB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 19:00:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=AoyuQRO+;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9184F3002A34
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 16:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB69A3B42DE;
	Fri,  5 Jun 2026 16:49:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E14B36CDFD;
	Fri,  5 Jun 2026 16:49:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780678187; cv=fail; b=NZYT5UOuNHaN4Bu6XJKcS8DtnB8kLIQEW8VKooZxmINVutVJ0qim3nQweMbFRcNtnz3ewLUkVCeiqfe+siNRrE/Z0/fWkbsf3Etya0aKlMI3C7QTogBNIEZ5sWW9CDV/iLmzF2nmf5dxwAehfM2IQGHCrOs6n3GYAFjCSvzn6Y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780678187; c=relaxed/simple;
	bh=+qkLhY0iZ5fidQvYlV83xDe8/6SLJLdpCMNDpPRjJN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pVvHQYA5i1IvaaTUJ3LGhH5OablKsHIs9XSXudcVV/Ys1Y9YqESBaL8GOF5I8efugkeUM3AjA/qOqKIlphJgs2yxzXRI3lDr97wqb6472kMQQZh3vwH6XLr2W7fjGQbfiYkNU0gf9pw/SJfHCRnaCEYR+fu29jVrgRd+hLKYgMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AoyuQRO+; arc=fail smtp.client-ip=52.101.72.41
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bb3ZtVFfa3G9pEvE/8PdCvXD30pvUFIHKVs5wGEGpouK+atXwoBfibpnICody1el5UFOaR6oAGPSplbio15CAWRLwtWCj/OhIzm+ZQqNNFof+3YJUg40vV8fy93uH1fis3hWiolV/DnROQ8if7PXh8qd4H5/R8+f07Fw/K6GjHhsMQR706qhQIvtEvesevWnmGsE+r6vE/ajp0Bu5v5ytCtt3v1cRKXkOR6ji00gYeChYKV8sMx/NHBzV4n4Vgu2km23CjdagY/4WqDOlBtHCMHWgcTpmLvEnBjBuEOW2xhYik6/rltZ8J5ZM/aLLFwo/jFlcd1F7cPngtrnWZCgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7SmCg1kDhnK18NA0ev58hjn4Xzn3V1mmcHKhyYLlug=;
 b=N/otcRJoC5SKVldvAEO/6EuP2Dc22FDhik03u5Fvl70bS8YU68X5nFJdxPWtxS+HVyaEJ6XYFt4coYhaajlxp1sk6XQmg8q45qmMkkRmo23+214yhF0jZ6hD4DIruVJLEWrXu6FquzRV/lR3DeWu0zbsNEx06oZwROLCVxtGHZEO3wCtRu3UDfkptRYv641sv4TlM85YqAekq0AGervZctT8QDIQmyGpOCePfPnWWZd+oxYuHjuk2EAM/I4JN6myaOHontYUoXeWSNatZ6mP0L+qb0KY/SNdWnBViq4wVRg3Js2513wlPpEqtiWA56PLYf2oSWlVyg3DxmnFNpTisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7SmCg1kDhnK18NA0ev58hjn4Xzn3V1mmcHKhyYLlug=;
 b=AoyuQRO+69FZVVbJPpZNzxDzvDLBNFH4a+f7YHNVr+6n7TgcLp9heAEdLPFxdfxTxLwZf8yT53QUzflFyeK+toA1whn5+h7rb5kTzgUK8CLLLv+3yD6vrCx/aD6ofVJYvu/YYN/UTLfXyuy7hw6Uchzuf4g+DN+jwkjT+7cvJGyySPzThwsP/6Vck0+h+mhfExTHU32CIulXcCTMhpPvHp1ERmpYuCd49RdFyquxNaJogsnCSEqhEOrTcB1Zoa57MNQ+V//bzY5XzONMjvfe3ERju4bBM02W1rIly4TiliRaqgrJxIYN8/yjNt0+0Ug1znIsKkwxZFevg5y0099zaA==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7747.eurprd04.prod.outlook.com (2603:10a6:20b:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 16:49:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 16:49:43 +0000
Date: Fri, 5 Jun 2026 12:49:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: freescale: add initial device tree
 for TQMa8MPQS with i.MX8MP
Message-ID: <aiL-H_kvdZIgaG_K@lizhi-Precision-Tower-5810>
References: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
 <20260603093621.2504490-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603093621.2504490-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH7PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:510:339::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f49e38-3bc3-4bb4-be13-08dec3227145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|11063799006|4143699003|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	JuriPaupA9jYhTc9hgxq/U31b8YiJIViF8T+qUQLkm8fM2TMZmo79dWKcMQGo7iemURaEoJrd4NAYsh4iRXvsG4XlcLgzgx4eyyh46J0+0zO76jQT/aKm3ijU27CPrjh+mDkGzgQWinTZfTTJ927TD20c2lWbh4CkqtsddSiyXjqoEWcJBAKdce966zx7KhEi1p6ZLSliwdGFWNvodHEWTSYtREaKoBUVQk+w9ZkXg9k+YeGR0GHWHDDmUaf/EC/s83nrgplFPAgkSZs+Agfc4cE+3Sqm7v0aAQ17OSiJCSjGWbWer35gtHTcleX7TlCK+t4qp5edi1d1rAZGdrr64ebnlxXVvQpTlClJvl3sq96BiAZJtbiBvh+WZr6yT500XpXx05YC0TvqltfbwJsO3+h+qSR2FJexj/T1uABRJKSwu1V4XJm5Xwqh0ftrza3oV9vIxkIHg7URJm7J4W34EePXYeG8U8G0kNo51wXkfKRSDxnBM9amBSljncKTzii6le+wGeeiHUuEIdi6u68jRdkigOzvi0EfywNiLl+UHvFola3Mot7eFyz9faaxdfj+yPuONl5CW1z1WQkQ8rBizpkguDmI2iqk3sip1CGAbYLwHIlq6JGmGHB/I5Z1KGPoKFRED6Mwp4e1NpnxYOeLaK/LpFpVwMpC4OQmJO7BJETKxKQ5kt/rtYCgfI7CZD48vflQ1WA3vlH1mpdBQWAA/rzGAl3wGO6QnID0FKxbdVC23zc7H0ruEDJ7MxirrgL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PnC0Z4aBa0fjwD91YZGvrgc8p2n0Og7s2Prb6njZtbgN/4dLaFfaojbZcwZw?=
 =?us-ascii?Q?8DMixzQbLEMJmWkS2p+V4AYu0w9m4EDPR3FL0s6XpeQGdlWzJv3rtAtEbiX6?=
 =?us-ascii?Q?uamK1UQ5feCqFNNPTquugQR+GH5FHN3pO8hyeuw19JKP7yGr/jcTLlioUGO/?=
 =?us-ascii?Q?et6Sxa0VqcaF9Q9t0G0EPFj5tKWWnqn/6xUUaCGmbtwBxgA9MiBv9T8kELae?=
 =?us-ascii?Q?XUhe5lPE0Pjmvei9tHHN8WXO7ai30pegMKAEVF4JoWLyVidESqNdB3DBUKfU?=
 =?us-ascii?Q?jIKJZYVV7X85jKdL+1QYMHXYvDe4j8MmAPauBbqWQHOkoYGG71rY8LskpEI4?=
 =?us-ascii?Q?9OFs/f/uxMEKlDJbLFFDBCKTwvVTB2CyVlRrFg6+SCqc7UG7uOtm3PuhwqTZ?=
 =?us-ascii?Q?a2Hm9fpDlRX6ffb5eH87khqBFdQXa+OGgKqH+T6LUqHK1AjUfuoesRMf+gB3?=
 =?us-ascii?Q?hU3gZRzfVIOXOI4BjCp25Tb/1mR/WGkI3niMnB0xNiygtEayG0osswLgPzVa?=
 =?us-ascii?Q?hXUILMZnNboWxc/EGPm2aB35lL743BXEEvc9yWx3RxqH5mlzN1mkAlhVojBs?=
 =?us-ascii?Q?WGKCsNRH4v9IrerxVu2W2h4USqNHVfK5Uorp9ay2mlaBGJXbcXJAHS4mQ4oi?=
 =?us-ascii?Q?iQ29OmIv2rFn10XS21pAYvni4mcz/7D69Wbgk8xLRIm6E5G2VhvTtX4rmizh?=
 =?us-ascii?Q?gZ+t7GldH9zoWwO65BS+QsCpHTchmVPHQzkFlHuR+s5ItUX7f+X1NIoKzN8M?=
 =?us-ascii?Q?mBc9VaLluiOYbjMpNIKHsBERvdxPhz/2iB10EAdSVnPGfJtmdOMhxHounMK9?=
 =?us-ascii?Q?dMetV/FOQ8SjHh9SXw18p7vhT3/z4AdvCWESyzG7+W0IFzB++OmCY5mGq9OL?=
 =?us-ascii?Q?6G1f594iyXoD/g9f7oL2+DPy2SqXKwFFwaN8JervqZO75TIPitDimFNEupNn?=
 =?us-ascii?Q?sQDANx8+3yKL2ODewyPboHWVPuxCPEFqXS/G36l9SVZqDbgk93EncXjJSjg3?=
 =?us-ascii?Q?hnVcsDkA30GACvSwYuAz3d9Gc74+DgxWnYNmDbmDXhl4CSmNhVf+IIM6N6y3?=
 =?us-ascii?Q?/IOzsLEuprT+phRA1P9V/Y6sGCCYzNbuJm+zl6o/eEAVjk5sWKu5pnL/vy9Z?=
 =?us-ascii?Q?Bg/gHSuK/HlHwTycuOwauI7xoFx2qhZBfJpNl/38ngg/14Q2x1Om/BDU0uuO?=
 =?us-ascii?Q?RSZWlCencInwcMO7xQ1H3eY4+wfd9193GUVYvNwJTxD+j5ZgJ8RLvLkj8u17?=
 =?us-ascii?Q?VJIK++ANHEycHswRV7MhmxcVblexfn/yx/d6OFLxOLBWMph4kqTK0txx/7vB?=
 =?us-ascii?Q?ueGlTGHQM9Qep6h2W+odrGYunqIGqF7oPnSM/GuZpyvn/v3MiCfQFbk3Gg5e?=
 =?us-ascii?Q?zE+PxtQ/PQb/7udu5E/+tiY8FkrRdok5FSCTcGI7MEgEvhLrNjD2O9Bw9R+A?=
 =?us-ascii?Q?dZJeLdmmvn6qGl6cUpxTAlGhXh7azQ39uPRYVDOZNs538NmQhcEUD5cQYQGL?=
 =?us-ascii?Q?FCfY/owZIfZktWxuzN4uDd6IUO3cjnincOYAjz5IyTxjqwDEwGFh9pBq5uqo?=
 =?us-ascii?Q?5HD34IUmTJ2kJgtHKocFOVfGGw7zaEyXGe3o+4nXEeVjMcvwfIQbqE6DQmLM?=
 =?us-ascii?Q?H4vQUPaGWjX52loIdMHf/aIgoYmqE/r2SmPuksyun9frFOIQLngQI6+XepR0?=
 =?us-ascii?Q?2qlGVYvwyfqFUlB2gV5uVHjpPDrzD0cI3n9bReI2FyE7kD4/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f49e38-3bc3-4bb4-be13-08dec3227145
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 16:49:43.0663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfKtAt2RJTm9LIIn021E7JsWiydlqdols2+FXPdi0apK2gN4zDCyq6KTfT7kUxt+kRnjGLh3W6DsE53/sat2wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7747
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33635-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexander.stein@ew.tq-group.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:shawnguo@kernel.org,m:paul.gerber@tq-group.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux@ew.tq-group.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,glider.be,tq-group.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,ew.tq-group.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tq-group.com:email,lizhi-Precision-Tower-5810:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAC57649FB9

On Wed, Jun 03, 2026 at 11:36:07AM +0200, Alexander Stein wrote:
> From: Paul Gerber <paul.gerber@tq-group.com>
>
> This adds support for TQMa8MPQS module on MB-SMARC-2 board.
>
> Signed-off-by: Paul Gerber <paul.gerber@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v4:
> * Fix audio codec clock config (similar to commit 6d36cebfb466a
>    ("arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in audio
>    codec as well")
> * Fix GPIO line names on gpio4, found by Sashiko bot
> * Move compatible and reg property to top for tmp1075
> * Remove interrupts for tmp1075
>   No support in bindings and driver, although HW has ALET pin connected
>
...
> +	pcieclk: clock-generator@6a {
> +		compatible = "renesas,9fgv0241";
> +		reg = <0x6a>;
> +		clocks = <&clk_xtal25>;
> +		#clock-cells = <1>;
> +	};
> +
> +	imu@6b {

Please generial node name: inertial-sensor@6b

Frank

