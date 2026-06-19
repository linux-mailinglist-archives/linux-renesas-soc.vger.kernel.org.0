Return-Path: <linux-renesas-soc+bounces-34249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 33eLKINONWqrsAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 16:13:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED226A6524
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 16:13:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=E8z4HLkw;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8EC1430011B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 14:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A557B367B65;
	Fri, 19 Jun 2026 14:10:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3949133121C;
	Fri, 19 Jun 2026 14:10:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878257; cv=fail; b=ZLUJwfv6Lc0czlNDOEMlK5UM7xdZfaFTDuTs6dmsZmZuhWrnjZSsCUAsbVXQ+X+uAxHEfAA6wfg3/Y9eWe6ipwi4r/JtdEssFx+yzs0GuXCi/xh4JRslCchB7zcccYDn7io3u7rCvZrokA15HN4G3t7g5VnmYCpqMKUrRTw9iJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878257; c=relaxed/simple;
	bh=2XeT1ecSuGQmGZRqQv0pDbXxsWolQVOkRReNKZI0FM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DZ2IulGxlSbGSohdgf7kTJyN3gRA/P67N/4UWZX2MTkzjywtbxs7RCPFlquAV7nt4zm7Tk4jbQPyTT7SZRxK670SvFfKhf872NHV3VtiH62zqBQ98GoUov1Zpsc7Ua9788pAiBhgOHkCkDUIJKkObQLc+Mu/gFIqvG20MC1l14o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E8z4HLkw; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDgAc28d1ulfOyYlpaAQl956uwUvEaFbD+jGCQI7j6ecyye40KbiibK4tHJxtGgSHVhviZ1DjjWXqNbYUu6nE1tF8OJhOWNKp2cCy7K9sCqyqiSZRMvt7wEn+mU89r7L1ZXSb2vNyVUuXsKhJK4KDQQ4wcg6V3yZpCNImBItS/Eb+bbehJ5xJvug1lMHYBoisziBmNMxIXeDkmy1ganuoElPnxOEcgdD9OCQf8DhJwSnt30RLnIgYY41l31GXVnkxNxtPf+SyH9zcoblNSeJEDNgGUmJXBtjkE7fq7sqH7QcTgMYykErCqTwhdP2s5fHR5ubObAszruHj+PhoefH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R20R1dx4BnaEjBOSzmLbOwrKnAtXUtPEfjK949kRnzI=;
 b=VXWzBK6QK7ZYawkvI8S+mFhRqpfoEQC6zYCFHOCWXcmfaXybQlqTlzUVHZlA9xHmKCOIt697M1H63XEby56kwXnSDcZXlyAU9jHOwk5EIbry/n0+eFJIvluXZYvYXeXCSMsOkN4vjftPbTy3KsCU0UELOnZxc0ktTGh79pkaxYX3cvBFpS4h1zXxZQFrv/UKvidgr805j+JsOg4SoiLwQzZl6HsqbcGtzx4IuH/rjv1MbfRlen1AXVOU8uJcFSfymI+Y8dryXT8FG/PpxAJFPiL+vAlRiyuptNti+heEeF7/fmSWZUuyXN8EZk1ChGKRg52cezccYEKhAGXT3CdLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R20R1dx4BnaEjBOSzmLbOwrKnAtXUtPEfjK949kRnzI=;
 b=E8z4HLkwwA0LSA6gbHMDinHEFnPm2qpWk+kQZ0jKyVfKREMu9P5yiFoMLSd7suvgyDvJYj0RJhpTDGvJnQDf2L6RSndQR0MQOEalfNcCa96PFB14e0LSIFJtLAgd5xeqhB+b/AjIX66clQnU4izrRRYvVuylfvq3U29mr40A6zuJiKgoyKpizeDb/UI2DZVxSalmEHrS2xdMbRLBRUVBaU6zNTuOy+8TNErCfG606f9kDL+zvcNV+SffW94jT33S+wEvFDAnwOltNxN8SQlXJm4w1i8SUjNe/pMgfJPHlrhad0dDL4VzjbicKB4Zb1as1I0hY+8P1Bsj2KfapYIZAA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB12566.eurprd04.prod.outlook.com (2603:10a6:20b:77a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 14:10:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 14:10:53 +0000
Date: Fri, 19 Jun 2026 09:10:42 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/1] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <ajVN4nbmOW-D_Ec9@SMW015318>
References: <20260619112434.1121610-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619112434.1121610-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH7P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB12566:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7c30ff-9b7b-4b32-c504-08dece0c927d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|376014|23010399003|22082099003|18002099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	x6aZfT1RFhgZkSOVBq2uNa6yn3ud68JcU6iwj1vuZ7LcAyiGZEvOQ9mqa0O1hjmV32I/MzTt/YgMABf9lLAqasnFeybTIqF0zWseRwB1FL4Pp/mTVfi+48cnld90DmLr2eDt6uK8E/UoRcGAAPYNBp3YrYncmV8Ef2Mel8OiW71VZWLv0c/KlbrgcKWWa7QY857xHF736RlTSTSy6xGgOHFvpAqiIH//N8losVRUBdKmKuelR49a4xZsIQtYG0Mm3SParjPILqbZY0o3sQbhs00OxRvNm8BlcDPCXWwk8EpbFXfhftmA4VRR5a1KaatL6DD3zHcUdOztD5XIVZeXoisOPyXJQXm7v7GGyiH+VetcbPajsVTtmbUDe2AS39L5utqn1qxf4F/e4wJ4TbnWoibyTr3EomJ5bdrK7VLwahl3UdaJWQR1loqu8og93wDqQis6HiWSqGs7zUa718MUyRloIDBnSPJbpfZp20yZNDytsLVRTCV9iZbhgrWoWmy4ZnMZMqgq9evJniKlwUc5qw4Lq/1GswEdDyqy1OQBWvNM1kfxB/2WRIqf08nBoXN/E3aKuirnCvqzTiltgzwor7tWme5/xbPSS4FeWz4VXCeNd6HmTenv+wBWyC/ns/iUpnxjlTHlAt+8GOC1WNwB405VeesXcJsRcRXgIEIZSo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uk1yfr2lNnyahfASqV7lKDQpsdLVAiCl9uhH5ByASkU26DWunA9+7ahOVxlf?=
 =?us-ascii?Q?KMAOdfcf2kteFfcMHcU0iQmNq0JeCsyHSyZnvXZDhjY9X3X7ipz2iGiqFxR8?=
 =?us-ascii?Q?AVlHPFTmLRSkeAN1YJD3kjyQRJeZGhoDi0JcXogCMkABx9fqtTudE/CzAYBZ?=
 =?us-ascii?Q?0O/0dsqnDMtvqGqubZZ2W8QkgzpNFoer9p7Mr8nnKLwpAjcEXURaiHc75DDy?=
 =?us-ascii?Q?FVLgamgb52M5jwC8PaOBJprd07M7GH+mfC6Q9RjOoyFu9eoI0XVmHs+51Fb7?=
 =?us-ascii?Q?ymULrGr0Uu7qUDeMy+Ke0SMHTkAdaxIFgNwJ4TKidO2za/HGbCtPIvg3RGVC?=
 =?us-ascii?Q?r1zEWdDcOa0iFouRQ71z5fZs2sopikdSyB9OL/7DNOW5/IH9+raG1YbNdsoE?=
 =?us-ascii?Q?4Gh+ZuixyAflFLg+Gghw4kMC+30GUH6taQXuPyQOi7eS5Sx++IwG7KyxqFHn?=
 =?us-ascii?Q?2Vov+Sglp5ZDZAkLd0bZM+Vre4mvOk8SnAVZZGUX6GsSr4MR7NuC2n+Jr6sD?=
 =?us-ascii?Q?PcD5oj3ByJFqb2d/uAJZoSR40wo6ifNTTfm4obRwcgCbauMI+pbR3+e6DWsD?=
 =?us-ascii?Q?u8RwIwj2Yj736bzghHZ6d4Le1Ua+xGZx6jYW4knPdgSAajDLdNhVqYd4dNrq?=
 =?us-ascii?Q?UuQeGjWZLV0S9t6gOgNbvs0632Y6u0pdGx9VBjqHTKCApfm34SSRBhXlLV64?=
 =?us-ascii?Q?KBE4theQTndH6LRFPwmHf8HO2pPA0/AEbnCzwILtT7qO+Q3uYnFjpfSABWnX?=
 =?us-ascii?Q?2VsAKiCUBq+LEoGXqpXVHOu9PxlQ7X/Wki/mD72syMCMt5lhXB9KeW7uNMyq?=
 =?us-ascii?Q?t9WjvEfZZfrOyxbVKCes9Whoq9vA1xpXvY5XKa0QJ3o4N88svoV9DMl4i5QT?=
 =?us-ascii?Q?7ZeG6ddfHPbKuxOQvIG5iog81ygmyIKEuqNuT+HPHFB74dCmzDD14AxrEQ6U?=
 =?us-ascii?Q?4GyREhAdh7C067BKyYdfOgEyTGWzKiApuj5/C+QxImGOooyG6jCsJWu5isEW?=
 =?us-ascii?Q?Y9R56eNN9oOmShmO+sK0opXPibEHZS+Q3QQkvU7RlNjS9lb/2TVVlGzf7Su/?=
 =?us-ascii?Q?pHXrSOb3FceMGHJT2hrJ8zNhdoCrR1IHvp71kANz1GntcYML5wjhojqrv1Wi?=
 =?us-ascii?Q?Xszngv4+CmswPeNS4l+8MSCpn40s17q+1cPVwkJ5LyQQQCI7io9AwTWi+GE3?=
 =?us-ascii?Q?MJWjL59yfyM02bB7/8VTwXj4jZTgVYzW90vh+L3y+KG8gBbCIA9KXebqAlDG?=
 =?us-ascii?Q?qgdYnI67wSTymiXPeQCbHLKQ9KIUaDCPvIoJhSAzPbI6Z0uo7b2mToODXxXT?=
 =?us-ascii?Q?5ue1PQMiu1cW9PhSsQIgeCVQHkU1sxmdduQlvMHtFKAb4h6dKrjO+QHA7lVU?=
 =?us-ascii?Q?qPfRRkRQBkwJ2Q/wSz+6qhEuUGZSyaez9Fydl4E9e5vjZgBx3N5cxjpHfRiK?=
 =?us-ascii?Q?6z/KfZuRR6VLAUhYMJfaTwopbUaJoVCbGugWDMritwfwrbMZBPLW5vfW9gBs?=
 =?us-ascii?Q?VkZEuhNYY828xPC34PRofAuoN7ndJs7kr8CE5tHq2YfWZFtDqAck6J2kCELd?=
 =?us-ascii?Q?XeWIxa4sMqL+/N78IhzpjDSVxWhQzqEj+Kc9VpW8LY8b1Y0atW7bksqiGEhM?=
 =?us-ascii?Q?h3/gfBtOMFlNxN8ZfMrBiJ14gI+ElqRkzNu9rVxVmLPsWvrLQW6abEXAzGES?=
 =?us-ascii?Q?733Oi2xVcwEsulWIsc56goAgJNVmFxlE5AT35ZNsV8w0nhqL7XiAD1xFfbpU?=
 =?us-ascii?Q?G/DVVcqbkaBH+/vW0F3MTlnBLLWWUio6U1vtpoCaJXZbZd3XOsgh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7c30ff-9b7b-4b32-c504-08dece0c927d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:10:52.9419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bs3z6hBnAIf0J78B+3ZJAARx2gwNMXH7oRS/J2P2+Tvb0fTcK0PFIBidHw1051x6b9UbPx/j7WxsUPju8bszZFuaIsetSKku+FhfKM2Eg8dgIIsAK4ZD3+mfuVM0RMAu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12566
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34249-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexander.stein@ew.tq-group.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:Markus.Niebel@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux@ew.tq-group.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,kernel.org,glider.be,ew.tq-group.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9ED226A6524

On Fri, Jun 19, 2026 at 01:24:30PM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>
> This adds support for TQMa95xxLA modules, designed to be soldered
> on a carrier board. MBa95xxCA is a carrier reference board / starter kit
> design.
>
> There is a common device tree for all variants with e.g. reduced
> CPU core / feature count.
>
> Enable the external accessible PCIe controllers as host,
> add clocking and reset GPIO. While at it, add hogs for GPIO
> lines from the M.2 slots until M.2 connector driver is available.
>
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v5:
> * Limit LPSPI4 max frequency
> * Replace PCIe M2 Key-E GPIO hogs with dedicated connector node
> * Fix PCIe clock configuration
>
> Changes in v4:
> * Fix LPSPI4 pad muxing and control
>
> Changes in v3:
> * Moved reserved-memory to board-lebel
> * Remove VPU reserved memory (unused for now)
> * Fix typo in connector comment
>
> Changes in v2:
> * removed useless regulator
> * added USB PD source configuration
> * Removed unused uart-has-rtscts properties (unused by LPUART)
> * Fixed RTS/CTS pullups in pinctrl
> * Added thermalzone on module
>
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../freescale/imx95-tqma9596la-mba95xxca.dts  | 963 ++++++++++++++++++
>  .../boot/dts/freescale/imx95-tqma9596la.dtsi  | 278 +++++
>  3 files changed, 1242 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 8ddaab127ab9c..43e1dc51b11d7 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -649,6 +649,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
...
> +
> +	ptn5110: usb-typec@50 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x50>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
> +
> +		typec_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "X9";
> +			power-role = "source";
> +			data-role = "dual";
> +			source-pdos = <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)>;
> +			self-powered;
> +
> +			port {
> +				typec_con_hs: endpoint {
> +					remote-endpoint = <&typec_hs>;
> +				};
> +			};
> +		};
> +	};
> +
> +	sensor_mb: temperature-sensor@1e {

please order by hex address value

> +		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
> +		reg = <0x1e>;
> +	};
> +
...
> +		m2-keye-dev_bt-wake-hog {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_LOW>;
> +			input;
> +			line-name = "M2_KEYE_DEV_BT_WAKE#";
> +		};

Now Key E connector already be upstreamed.

Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml,
which already define these gpios.

Frank


