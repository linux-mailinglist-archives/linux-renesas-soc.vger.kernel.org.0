Return-Path: <linux-renesas-soc+bounces-32581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8L/DIs+TBGrULgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 17:07:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F967535C4C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 17:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 098A6303645A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 15:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AB8481FB2;
	Wed, 13 May 2026 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WgoP9C6V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B38947ECDC;
	Wed, 13 May 2026 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684735; cv=fail; b=qio1mOzcSOc/AXsyzcXoCH0Nna3Qrsh+AXmVH8H7xy0Y/4MWAh4Zs+j3eykV+buiXw3Ec1r/DoNy1VgscPyQKYYNtJ0HasGEoF1298qs9+ifDuYIsLIVhtnS4p2xP+tQKUAEbLjjymDC8adLQSk+HhK4/tYwnUAowVnbrwzGvDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684735; c=relaxed/simple;
	bh=TgBZcLif0hhXGXA1V22Ef4vKv+xedKR3nr1NN9aHvko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N34uF7kLV35fWUoe4DV3sAJjEHfrqYy8+QBvPVkl10SwQ/7yEZhqHnrhuRv6rzeV1C2ax5zhWkXy0+ZOfQHvAg6NDzmv/ZrfRc3Ti2+XFQDDIODGJhG7xfq7GzvD55rCQrjiZc8XcCoA8r7pAPQhTI+9txQXh4ovfsaXJT+SXug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WgoP9C6V; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lf+QBQBQtW1KG9scmjAr5pdqLkldsp523GTjY/hO6raOs3cz+nRe01oWnpZkYdhUJROrCxa86yQuS67ioGagOk6xmU0lzMtyOlWhl6G2MxSpfDqOaJXSDIJpcJGLtIxJSDqYbqxM19zCDHaPxhzd77lJphL84PMQqTncNlGVikSn+CK5I2ZB3HztjmVNKnerM5cFpNUFGXzl5vqclQ4R7rsTxhzXo6kymOkgkh2RXpP4Ro4VuGJpe2r+dV7ARD2GDZM3VE5vKBfYlRuW9fDTqgcBj7jeQ+q+Gynv5fwGKM0B93fDqFHeReBsQSXrZbJWms6VZubEyx37f8AXkharKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXwBuTNKac/ijeDOICYQdqGAdzGhH9wx8RjX4MOyYGQ=;
 b=pCD59kBP37VGOj1wJ/THxPhwOiIWrYfweWGBmN31vZJkBdVof3FhpFMoDff3BHkkUeM+vsQr98HNh1p7dLIJUS8bJRLZYnd08AbEM3zcmpw7i++viefzjlHmDf5L1dGG3aa2fIhgB7xW78Vx+oo6i53GHvqJAoAR6UX9zA1t5NbLYizcbpYSOv5RYCD3eY8NaZMEv6d+dmROKIAClRrgUUo+ZzQxLyay404rvWc/PQiQjqqDq1PkcVa3/1xeoCKTEm5RfIzjIG8UIal+Ia35KXDz40sm8pLZA+AUkXtp2TUKLmVzAgWTjKSzfO3HR574gxcGE0eIlF05SqA842O88w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXwBuTNKac/ijeDOICYQdqGAdzGhH9wx8RjX4MOyYGQ=;
 b=WgoP9C6VUEzLHbY1vRf059Abthd47D/YLgaYgJgapkDC73AS0bWh9xMpj/YPw5Ytrj9LcnB0b8xVEmRl0IUfqopaVtpuZ532L50fEkkT16nZjBdfZfZ00mLxe67HK5LyjSQKgFt1tEco81Ou78g6KW6vMbx94/rcS/xiWfcs/bI9dOKXM5asQ+iZDNEccjm19nm8xLZxhhUMPRcLTOW5uPc1Awck39jw/gWEQ80gT0T5bmpVBM8E9AVG0NtiD0XCupZ08Xxul++7951hE7QcCiRR2BJSkiLIfGTd+ZC7sgvmCPWJRrBf29VXTU6alKJKZnqpU9iFcbBs9iNR6B3TrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10248.eurprd04.prod.outlook.com (2603:10a6:150:1c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 15:05:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 15:05:30 +0000
Date: Wed, 13 May 2026 11:05:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 10/16] clk: Add support for clock nexus dt bindings
Message-ID: <agSTMqZc__I3y1fI@lizhi-Precision-Tower-5810>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com>
X-ClientProxiedBy: SA1P222CA0117.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b45347c-ae25-4949-86fa-08deb10112ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|18002099003|22082099003|38350700014|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	J2enm9sWs2nMQB38O7NO2ALyUGflWTOb9AU2uEtY7JrRjLMYnHOk+nf9sMxoJFvTrzztsWT1NyD5GBC5rvgZyZpUkEhMx7Vpk9L2jUIzGeXlOhoHDEJ5rhZOC22X6PkMNyKxIkwOUmwVcsQhQlEBNfdgmPnzSCsCGRP8J9B0MP0Dff7UPAEznLXdHUWVYTY4+Z+Kzey/oAdGIK6+5+6R326y6B7B+ggZY1+N33s8V4fql+vZVID207M6bnDEg4C+JcnVsTuC5Z4uaHTYUvKHryCr8sCYpmGeeOsZ3u5ls2evYvvQHl64hSLAsNR6jgDZbDDz2srx0/ZrziteGdkj1tD6peTAjjHkrZMKJ7dp/Gj7jLikUuJDUzPWme0Ed2LoNMxSo0abwoVMy1X+4kb/eaz28lTir8pDjCWHHfIwYZ05nsQDaOWcSVGmNHUBeOTBRfHNj/biI1KE/KdFh5SYeloXfwNlw/GagvpLq1+7UpHK9GF5/f1F7GOUHh4pGjGBzo+TeZE1IsKJ1yHwOsKlTRnND+swF7NWL+dZa/Cz/ubNW4s8l8lOKFmskUrkvaon/je2r7J5D0vta4pX7lv6sJYFGtnNJ9GUGjB7cSmwDgz1ejilebVlVhx0tVv+7lWab8JIT4jE21JT8qrkJSop6jYIsbUkii2ddwxeOXCbCt+xUGSuQ8zD3a95yCISndS80hxUm9/afS5LVsbevkgHRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(18002099003)(22082099003)(38350700014)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yvuRAJtIUwzpJa249E2pbYsXWhLtreoSbTCXIJV+j40xy90Wua0GDafvpDsO?=
 =?us-ascii?Q?RxvwHYXL9Z6dGCrf4DNNCqpbZYUxubkbgrwOyMxzb7p0oMCA0i3IpuCNTOM2?=
 =?us-ascii?Q?/AoNxGQyFrx3WmhOVmirP9yhXO21HURKKPRjkai25IZK54XJwlBjW3V6jieD?=
 =?us-ascii?Q?K8BG6kdnDdg9FoPKRwKHEhjslBeivsa7HjPRFcvSNduby8RYQg4mdQ5V/7UP?=
 =?us-ascii?Q?+RU4NXDEKIIQf7XFQiCtFbI4DVRWCldvTZ5oUyti9qds0kM6y6yQg1+x6UAR?=
 =?us-ascii?Q?K3TMvrYI8E0HaxthESQV8r4z7tWwvOa0fLaCSjOIzhQV1chnia1fEDtd0m/L?=
 =?us-ascii?Q?B6iqMhGIxf0mjUUD7khZiny4wN7nT7uIuGtBGPSO/e1V6ejt4E2nuW+7R7tj?=
 =?us-ascii?Q?6Mc8IfjHzE3CWV9vWQaD15r+GUccA3qOJMcFLy1DQv+a5KWrB9pUOurZdZ3x?=
 =?us-ascii?Q?fqy7GvWVf+TsqF8R4zXVLI/2r1CTLeoI2O8ZLdu84RnplICETnDLVGtKEhDF?=
 =?us-ascii?Q?maIz9Uc/VQ7/3V27i9cIFXVYlGG/QjNkhvKQzpJ0oFYT27btGSHIChuNFoQW?=
 =?us-ascii?Q?ao1x1GPADfF5Y+qE0tQyUuEvCDwWzlMosKGFXAmTgtQMjs1eWzc5jLqYKeEF?=
 =?us-ascii?Q?9cC8+FtPh2H9UbO1dbCYC/Ysq6IOZRmxM5TQJJ97nNmVHdiM+Dax67SRs3UR?=
 =?us-ascii?Q?avsGVxKJAcrDonviRKIY6bQzIZTDGa1wf0m7tX5YaJSB+HbGZTsJ2I8Eoq09?=
 =?us-ascii?Q?fRwtDUHJKQGrsuydEX/0AIIR4gf3LmZUFdsEMuNx/EEQgqifu36MjfjbAK9W?=
 =?us-ascii?Q?3DfDgQU/bQebA1bY/ui1eXLhBg6hdqHmOjYFfww7pYPbzuGRiYAcKYhIZ6eJ?=
 =?us-ascii?Q?KjeNzSound/PBYXc6YMUlWcgeBFiE9TJ2v7jrAHc0XKmdcPR0bH5y7mXf4jz?=
 =?us-ascii?Q?YIxhJuei7Z1ulryXcgnJD1FEYabDD2Od/LQyJ3hLEbIFSnCr3iqTVc1VKRKJ?=
 =?us-ascii?Q?Y4Ca9zB0RI5H9QZWpDiaJGfpBZcAnBw+zC6cHQbHXNy9WCIkC880KfJ3GnB6?=
 =?us-ascii?Q?ItefvbpE69qybbHYreXAOe859n64eEvicyVaQmkuJAZJmfQyKjHpJ/3d1lSt?=
 =?us-ascii?Q?f1FnHpinF9tiivKPthOCab/dfYNdG06ZDY8+Qix+CdTjU1RQWYde+EwJx3WL?=
 =?us-ascii?Q?o3LNhs606bNe9j7RzwGRbb/VSZvTzwb/HSpPIgMmNJ1XvnAwNwkVinNrnQVf?=
 =?us-ascii?Q?AaRPpBN+rJNpFYXTi4CbbLZT3ABir9eofwtfCzqsHOWGI0+noUSW1bnUDK+U?=
 =?us-ascii?Q?dd1PNzM7gY4ZE0nzqEX6bPWK/0DCSlLtxFKjyWVwQQX4nfD8SIL/lUDy9dP0?=
 =?us-ascii?Q?a5ZRJzJMyUh1wGfivVSPoJzIpPxR768t1BQaKoyb/LOutmPgZiH5kk9Uyhsg?=
 =?us-ascii?Q?5c2uPL05drcaTDCcydC1+YyBjyEcOUG2eYfl4TS4g+F/0Ix1/Q9jlTZamUln?=
 =?us-ascii?Q?nVHEcb+nFv2vMtlYBeAwFXQnCMTgKTjOs2+O0Ng+UIj9T0E3uq9Csm7w77qc?=
 =?us-ascii?Q?uUKqxwvqHgss8W/G8qqp4Thcc8RgScvD0C/AUgsALTUxE2VqXncO8Od7GKWU?=
 =?us-ascii?Q?g9QIrKL77WLaZvGifqcq1eUUTXuOtIUIJ9p3BcsdlzjlFSH3BhEnnPNOP1ox?=
 =?us-ascii?Q?FfylcJwBOpXh2Pu4EW/fEbZrwWyFRTxleyZslaoekZ76IEqk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b45347c-ae25-4949-86fa-08deb10112ac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 15:05:30.0935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbQVt2HC6fzM9iZDy4GSBVWnX2sEMdgwL+e2mw9aRkLqh8VyPq0RcKLlQHr0eAU9MF/Lr7w9ZHwsLESLcnIThg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10248
X-Rspamd-Queue-Id: 1F967535C4C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32581-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Action: no action

On Fri, Mar 27, 2026 at 09:09:32PM +0100, Miquel Raynal (Schneider Electric) wrote:
> A nexus node is some kind of parent device abstracting the outer
> connections. They are particularly useful for describing connectors-like
> interfaces but not only. Certain IP blocks will typically include inner
> blocks and distribute resources to them.
>
> In the case of clocks, there is already the concept of clock controller,
> but this usually indicates some kind of control over the said clock,
> ie. gate or rate control. When there is none of this, an existing
> approach is to reference the upper clock, which is wrong from a hardware
> point of view.
>
> Nexus nodes are already part of the device-tree specification and clocks
> are already mentioned:
> https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
>
> Following the introductions of nexus nodes support for interrupts, gpios
> and pwms, here is the same logic applied again to the clk subsystem,
> just by transitioning from of_parse_phandle_with_args() to
> of_parse_phandle_with_args_map():
>
> * Nexus OF support:
> commit bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
> * GPIO adoption:
> commit c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
> * PWM adoption:
> commit e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
>
> Expected Nexus properties supported:
> - clock-map: maps inner clocks to inlet clocks,
> - clock-map-mask: specifier cell(s) which will be remapped,
> - clock-map-pass-thru: specifier cell(s) not used for remapping,
>   forwarded as-is.
>
> In my own usage I had to deal with controllers where clock-map-mask and
> clock-map-pass-thru were not relevant, but here is a made up example
> showing how all these properties could go together:
>
> Example:
>     soc_clk: clock-controller {
>         #clock-cells = <2>;
>     };
>
>     container: container {
>         #clock-cells = <2>;
>         clock-map = <0 0 &soc_clk 2 0>,
>                     <1 0 &soc_clk 6 0>;
>         clock-map-mask = <0xffffffff 0x0>;
>         clock-map-pass-thru = <0x0 0xffffffff>;
>
>         child-device {
>             clocks = <&container 1 0>;
> 	    /* This is equivalent to <&soc_clk 6 0> */
>         };
>     };
>
> The child device does not need to know about the outer implementation,
> and only knows about what the nexus provides. The nexus acts as a
> pass-through, with no extra control.
>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> ---

Thanks.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/clk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 93e33ff30f3a..196ba727e84b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5218,8 +5218,8 @@ static int of_parse_clkspec(const struct device_node *np, int index,
>  		 */
>  		if (name)
>  			index = of_property_match_string(np, "clock-names", name);
> -		ret = of_parse_phandle_with_args(np, "clocks", "#clock-cells",
> -						 index, out_args);
> +		ret = of_parse_phandle_with_args_map(np, "clocks", "clock",
> +						     index, out_args);
>  		if (!ret)
>  			break;
>  		if (name && index >= 0)
>
> --
> 2.51.1
>

