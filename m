Return-Path: <linux-renesas-soc+bounces-30179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCDyJXixwmmRkwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 16:44:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E72B9318499
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 16:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58EBB30AE992
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 15:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DC63C5DDB;
	Tue, 24 Mar 2026 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UmfjWHQB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6D392C50;
	Tue, 24 Mar 2026 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366743; cv=fail; b=S6Dw8BEmYE2ER+bxkQTwzogG1sO8sRgq7H26vi2q9sBY5LZH9O4Ably7g3gWaAhREWBFA4PTyiSs2HOS4jY1WJSAIvjzTvPYaAm0dS5W1RN+kJSn/2SQTjZR9ZOKQ/ME9nWoHKcPZsH0chLdh1uNPnsJpuoyW115eoYftEE9vK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366743; c=relaxed/simple;
	bh=TUdH9Eyiejs1YiRJxrNSfhT/CgdADpSrXNdO20bJRi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bZrnC5gxnJUdegFhSN1N/Q++ULkNpCMwQ9WD0LqiBDGQK01Py+k/GtNm3XC32o4e+TzaLGwY/DSU2Ef6ydyGc1euziVqxrnLT0VaCEzdYWZxgTXJGQW6cimXF34GbY+gTa33LVCtNu/rdCNsgfQjsdYGkeFy5M+o52rPxevioyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UmfjWHQB; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sV2w8ysM3vEkLJLF/GnaGUtM41yjHqvoHkeOmJKoB2UDLMYZXiUDq2TQ1Jni/9jSQa6WE/vF82h2g/yDqH4FK9PVoxqSWzP/Tmd+tFqitlkYLwGuz+RKtoBlx3sIgO6t8C2Or9Bwkx1rRmekUrvFNIQYY9WUo9FuxvzDXWbK/hIVA5Rx5I4R7VhzllS8hIGMXap1wvFd7vD5CpB4j/izPGXxDKN02eCQfv9iSZehaa8ZzWCN8bkvWT07sw2sFuzekBH2xOyiBuLbUl+Ou0QJ8KmsllLtFnOj+mbrW6TzuikOHBkEsWXlIeLOe3wcPqY3vi+t5e90SKyIp2lz2gxNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yftBXwjgAv7t7Orm6yQTgOCAlicsRXOPSaKNhy15cb0=;
 b=dlApPMPkZM4a5yhVZtsGgg03r1gp0k1WHiAycydynkQBrZXaYMdiwsbSaDTe6UY7I4bYXkM/ymj3Vg3LMZDhxvVpX4GiRQJCshLhZKmBk3TKq5opibDcL6pMfE8f1EheRsEliOFRC53mtLjLW2Pz0qp0ESOdbRpHI8I/Efny+Vs+s/eprl5cQ2phe1Geu9lhFui7ZbSuoBPUDyTxOiTXgY0IL+At6pwcFdEFOpwBetpiMLQRlNV2fKB+NeugaUleeLUpgdY+YG3c+H3OX4tqa53UL4sFHWsYGgFQgkxZIYwRBPHk0RvN0GtTtb1zos88VvBMOfuSdypSUp/xmMZwTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yftBXwjgAv7t7Orm6yQTgOCAlicsRXOPSaKNhy15cb0=;
 b=UmfjWHQBELrkmyXLFzN79n2Sbw7eRzURU5syn2i4LstgzPXP77MSF8//6b7rwlRxK6REa60NZNDG6gwOi7fs3YXFNL2u4RedmeYh8dI6ndIXQ78UE3565NAX/2o/0Woy3Dg1ATcYEuKlyrSLjlqgDMA/f/y1GHdF1uWhodekkF7TMhZjGY5gaV5UqjfLcgMCi9xpQppYIJhe5cjnvNvEISF4i+YjKnIQUimI0mAKDg/+uah/FxpdL5MgtjduqgkqHf1zGJv2gv/PW23voM5EJPEos+G2OFtm2rkovNrsdGDLHkCDcz9kjifQgqofaN/r8XygbXOCrNH4mCh6+Jv63w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10794.eurprd04.prod.outlook.com (2603:10a6:102:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 15:38:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 15:38:49 +0000
Date: Tue, 24 Mar 2026 11:38:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v3 4/5] arm64: dts: freescale: add initial device tree
 for TQMa8x
Message-ID: <acKwCWE_oFbLQGmv@lizhi-Precision-Tower-5810>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
 <20260226153859.665901-5-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226153859.665901-5-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SN7PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:806:122::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10794:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a70ab6e-38ab-461d-ddcc-08de89bb718c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|52116014|7416014|38350700014|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	PrSBidNfMGplc80edab2NZKKipAv8USwysutl0MJpz0UsKTrrlFKfB3kvA1jv6uJjKwdD2A1xuioPnHfW6fpzUU1+Wtvftrct5+MVaJv5i8RzlLtlVULS2dDwsYyPQtMmMN6Sh+27I7ZZ/Q5ck/jQCcukVlJ9oNcmHfqf1GYHvp1zD1jAvqBheN93+EUCyicn1ySYzOIu1gLlpobvEIkHvoBNC/PzyTWlQn3PyapwaDpASsSEdXp0tQmX8fpXab7nNjkwRbTVXF323J3NtMHQXn/uWX0kbs970ZlVk4qwUlNhcbDVjEuxsH34r+d0vuJ327vE95Qt0Tt2uf5rkKtyzTdNysY7Y6PZ8aPlsmLnDYG/DDt3hSNmqJEiHU5lYMUnq0cuqB/Bc6mvQWFciqJYfDNNLVb0FmVZhVaGBs0jyHOT9CP2o3GEWKelbro/xr0P4DEv25+vwIk0bEposI2P09+zpwcyEpkDNrYJUuTihe3HlpBluSX49IQlE/7l+JKHHG8/LjAWaIHUVqKCB91XBr1FqOIdm+8BcLeznf7PFINETEVDSTv4E0UigNHgkP5bVUinTfk05s7fIFw6ubdfYbOOyXeCyRJ817C1g3zi+u4jP9DwnYTXPwL5J8cFkB/6egjcSEh4gdUHrHZnFL8da1LLIM8BauObCAu7J4A3bn4PFkKLgJqj/7mNIQWGGJXBm3OSKZeuuQ0k5tHCNK9L9WGIFb6ivM0bdjQFfW1puA4Rs+AkvoV1lZBpR5tP9gMpQOrjjVJ0TIpUD8PEKupHwHfsmZ6QiSdD1lOuYJjD3E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(52116014)(7416014)(38350700014)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XOOGMuo+WUIkGBgDL2W2AKxMsx1CUg1fbIHC64rMB85eVMVG8tem8T3wT6hX?=
 =?us-ascii?Q?srAujdtYFp8IiAvxpadq2CmGS3fvVV5vmXYcTk1QP1kQt0jZOpCocmURTP88?=
 =?us-ascii?Q?ZvMyV5OR6FSmSzI0cktjMnWl7QA4J4cdhzp5NVqIc8E7C62EwuW8p93AjP8U?=
 =?us-ascii?Q?2pWkOTNbfWM2do7JEc3QPQmvyM6si0oJGa4vDMo24B+jKnJDvSICfNhTUe/j?=
 =?us-ascii?Q?v19nTX0Wu+VEg0uPqOpiKkx/4tx6FNQcyUUiKdAd4Fh5VWxIW2GL8w+l+Y5L?=
 =?us-ascii?Q?bbHC75Hvi7nLzetANIsPboQ/r66wjr+JVgQbGWOLozr5g8X1dlhHzjHDWqdd?=
 =?us-ascii?Q?FYNLAbEFJfypp7ZQnOAIDxJIZHQ5BSHL5nljRjci9YGD5bJXXAwf6q1pVMz5?=
 =?us-ascii?Q?eyurFBpupzqua3MJOvJIvBa0RgsB2OTrsnMdK3LeBkaN78iQvSgh91q2B43W?=
 =?us-ascii?Q?hArS6wkfnFRUa4bSGjExH08c+BEMreooA9ba0h6uKCNC/hEyLCaIXrTTL70D?=
 =?us-ascii?Q?dXazSAIRep6ubqWyURBdhGcx4BwUnez0pvAl60n14Ccjy74eNXpAg4rTiynk?=
 =?us-ascii?Q?sOvwZFVC+DWySjAio+aBg6jpVUTWoPfqkyUwQ5hMTs7oHgcYJMThskd+4nC5?=
 =?us-ascii?Q?1/Kxj4D73vGMSJJRYJaFcKEzSnmVX1s69dRjdF9+B9Z8cD3tQnD1NICc0kd4?=
 =?us-ascii?Q?e1Y4pXZpRpH3Jhhep7S+5G3KffLi3FrAROII76LLyDN4IP9v3Lv06Dr9+9ys?=
 =?us-ascii?Q?cb2GGJxtgynHUXzOWVsbIbVoqSWe17R7G49ZP8JRmBo7yQCHhQzFq0Tg/Zqk?=
 =?us-ascii?Q?SQ+9Z8yRlQMiA36S+klsJQiO98VYGV56jCHgiaeLLwTxmkTjUED8GaW1pBMV?=
 =?us-ascii?Q?XibNKAAiTiWRsU9/550k1dy11d6eeoWYHPLTd11xvwjrYVxW8KExP7+V9rD+?=
 =?us-ascii?Q?LQKxUAnMtWy8y7nE4SHIWAz+G+vq/cKJqLkqR9PFo6jf5CeRPd6ks+h4Ga14?=
 =?us-ascii?Q?TYmiLg0pMCmmoXnomZhbK8NfvnHPpjDTsn6ooKN1fLVlaam+ZIo/iZKJCcSu?=
 =?us-ascii?Q?qQ0jrNTFIFtjmMKNr1/4Fa8ox2PVkTheum5EUYU2mwCph2bayaGTwFGtn5Fd?=
 =?us-ascii?Q?D/CqTsijI40Ljm5ZWDH2PY0hh5+h9ZmGybxKOb897w/wvOOUzsuPR4LmrXy0?=
 =?us-ascii?Q?QjT9o9tVX2toDzZLL67Cz3Y8JFj+BBA2mVd6+MNrVvzW420OBuUYRTaGSJrt?=
 =?us-ascii?Q?DX8MXdc8AbX8N3S+9cPcPQsGyk8tqsSfQ/xIN0yeCDf8b/lRJiKDuiw2rPCs?=
 =?us-ascii?Q?J0w1ak5slXXJYbb4Jgt9pzmh2+w28JqWrG3Ekoh0quz5RaIFN8H16QurjwLR?=
 =?us-ascii?Q?Dl5cG7UT5SjzppqtqqG22rcWeDL2n6QAnLv9b5mrWFFV8Lt4R/m5d17Y4nB8?=
 =?us-ascii?Q?e9+O/HPFindTyg6HGXxYoOlZKWASIBnAVD2bMPIOOCHkAjz7pCm111r621oJ?=
 =?us-ascii?Q?yFf5R7Bjm/71zUhaAQLoyTX9Yf9qYtYSO55VrlwHYd808zEfO8jzZ8y21nUR?=
 =?us-ascii?Q?PZD5ilBOkK3kV/6SaaaKJ9Lh15rcbdBURhfEBfZtLWvlMsaVZGVNNEAEF4pi?=
 =?us-ascii?Q?DlXKpBCMxYTA8fBHy0HSeEXcwTR7PWr+e2rKXXNtnsImRjGU3I8EovYTNyMc?=
 =?us-ascii?Q?6lw3PebGLqNoSwLe2xDQkVsKnPsbriWjwj9wllEskcY6KrqrBh6gJ5m5hv5d?=
 =?us-ascii?Q?uNJfnPC0Kg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a70ab6e-38ab-461d-ddcc-08de89bb718c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 15:38:49.3806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zj2eWN0O347d93ODg3k8leFeWvZhduEyIgXwumluIIXqA+a3hp6VenWBwjE2ZJhgyI9F7n/B+HGM0fpc6olkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10794
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30179-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,ew.tq-group.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E72B9318499
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Feb 26, 2026 at 04:38:53PM +0100, Alexander Stein wrote:
> This adds support for TQMa8QM module on MBa8x board, based on i.MX8 SoC.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

I picked other patches in serial, I found missed this one when go through
patchworks.

> +
> +	fan0: pwm-fan {
> +		compatible = "pwm-fan";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pwmfan>;
> +		fan-supply = <&reg_pwm_fan>;
> +		#cooling-cells = <2>;
> +		/* typical 25 kHz -> 40.000 nsec */
> +		pwms = <&lsio_pwm3 0 40000 PWM_POLARITY_INVERTED>;
> +		cooling-levels = <0 32 64 128 196 240>;
> +		pulses-per-revolution = <2>;
> +		interrupt-parent = <&lsio_gpio2>;
> +		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
> +		status = "disabled";
> +	};

Please order by node name.

Can you try run my tools dt-format for new dts file, which speed up the
flow.

Frank

> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpiokeys>;
> +		autorepeat;
> +
> +		switch-1 {
> +			label = "SWITCH_A";
> +			linux,code = <BTN_0>;
> +			gpios = <&lsio_gpio2 11 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		switch-2 {
> +			label = "SWITCH_B";
> +			linux,code = <BTN_1>;
> +			gpios = <&lsio_gpio1 0 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpioled>;
> +
> +		user-led0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			gpios = <&lsio_gpio5 20 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		user-led1 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&lsio_gpio5 19 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +	};
> +
> +	reg_mba8x_v3v3: regulator-mba8x-v3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_3V3_MB";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_mba8x_12v: regulator-mba8x-12v {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_mba8x_12v>;
> +		regulator-name = "MBa8x-V12";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		enable-active-high;
> +		gpio = <&lsio_gpio1 2 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	reg_pwm_fan: regulator-pwm-fan {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_regpwmfan>;
> +		regulator-name = "FAN_PWR";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		gpio = <&lsio_gpio2 12 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		vin-supply = <&reg_mba8x_12v>;
> +	};
> +
> +	reg_usb_phy: regulator-usb-phy {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <3000000>;
> +		regulator-min-microvolt = <3000000>;
> +		regulator-name = "usb-phy-dummy";
> +	};
> +
> +	reg_v1v5_pcie: regulator-v1v5-pcie {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_pcie_v1v5>;
> +		regulator-name = "V_1V5_MPCIE";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
> +		vin-supply = <&reg_mba8x_v3v3>;
> +		enable-active-high;
> +		gpio = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
> +		regulator-always-on;
> +	};
> +
> +	reg_vref_v1v8: regulator-vref-v1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREF_V1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_v1v8: regulator-v1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "MBa8x-V1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_v3v3_pcie: regulator-v3v3-pcie {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_pcie_v3v3>;
> +		regulator-name = "V_3V3_MPCIE";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_mba8x_v3v3>;
> +		enable-active-high;
> +		gpio = <&lsio_gpio1 1 GPIO_ACTIVE_HIGH>;
> +		regulator-always-on;
> +	};
> +
> +	reg_v3v3_sd: regulator-v3v3-sd {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_v3v3_sd>;
> +		regulator-name = "V3V3_SD";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_mba8x_v3v3>;
> +		gpio = <&lsio_gpio4 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		off-on-delay-us = <200000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		decoder_boot: decoder-boot@84000000 {
> +			reg = <0 0x84000000 0 0x2000000>;
> +			no-map;
> +		};
> +
> +		encoder1_boot: encoder1-boot@86000000 {
> +			reg = <0 0x86000000 0 0x200000>;
> +			no-map;
> +		};
> +
> +		encoder2_boot: encoder2-boot@86200000 {
> +			reg = <0 0x86200000 0 0x200000>;
> +			no-map;
> +		};
> +
> +		decoder_rpc: decoder-rpc@92000000 {
> +			reg = <0 0x92000000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		encoder1_rpc: encoder1-rpc@92100000 {
> +			reg = <0 0x92100000 0 0x700000>;
> +			no-map;
> +		};
> +
> +		encoder2_rpc: encoder1-rpc@92800000 {
> +			reg = <0 0x92800000 0 0x700000>;
> +			no-map;
> +		};
> +
> +		/*
> +		 * global autoconfigured region for contiguous allocations
> +		 * must not exceed memory size and region
> +		 */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0 0x3c000000>;
> +			alloc-ranges = <0 0x96000000 0 0x3c000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	sound {
> +		compatible = "fsl,imx-audio-tlv320aic32x4";
> +		model = "tqm-tlv320aic32";
> +		ssi-controller = <&sai1>;
> +		audio-codec = <&tlv320aic3x04>;
> +		audio-routing =
> +			"IN3_L", "Mic Jack",
> +			"Mic Jack", "Mic Bias",
> +			"IN1_L", "Line In Jack",
> +			"IN1_R", "Line In Jack",
> +			"Line Out Jack", "LOL",
> +			"Line Out Jack", "LOR";
> +	};
> +
> +	sound-hdmi {
> +		compatible = "fsl,imx-audio-hdmi";
> +		model = "imx-audio-dp";
> +		audio-cpu = <&sai5>;
> +		hdmi-out;
> +	};
> +
> +	thermal-zones {
> +		cpu0-thermal {
> +			trips {
> +				soc_active0_0: trip-active0 {
> +					temperature = <40000>;
> +					hysteresis = <5000>;
> +					type = "active";
> +				};
> +
> +				soc_active0_1: trip-active1 {
> +					temperature = <48000>;
> +					hysteresis = <3000>;
> +					type = "active";
> +				};
> +
> +				soc_active0_2: trip-active2 {
> +					temperature = <60000>;
> +					hysteresis = <10000>;
> +					type = "active";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map1 {
> +					trip = <&soc_active0_0>;
> +					cooling-device = <&fan0 1 1>;
> +				};
> +
> +				map2 {
> +					trip = <&soc_active0_1>;
> +					cooling-device = <&fan0 2 2>;
> +				};
> +
> +				map3 {
> +					trip = <&soc_active0_2>;
> +					cooling-device = <&fan0 3 3>;
> +				};
> +			};
> +		};
> +
> +		cpu1-thermal {
> +			trips {
> +				soc_active1_0: trip-active0 {
> +					temperature = <40000>;
> +					hysteresis = <5000>;
> +					type = "active";
> +				};
> +
> +				soc_active1_1: trip-active1 {
> +					temperature = <48000>;
> +					hysteresis = <3000>;
> +					type = "active";
> +				};
> +
> +				soc_active1_2: trip-active2 {
> +					temperature = <60000>;
> +					hysteresis = <10000>;
> +					type = "active";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map1 {
> +					trip = <&soc_active1_0>;
> +					cooling-device = <&fan0 1 1>;
> +				};
> +
> +				map2 {
> +					trip = <&soc_active1_1>;
> +					cooling-device = <&fan0 2 2>;
> +				};
> +
> +				map3 {
> +					trip = <&soc_active1_2>;
> +					cooling-device = <&fan0 3 3>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec1>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	nvmem-cells = <&fec_mac0>;
> +	nvmem-cell-names = "mac-address";
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_ethphy0>;
> +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,dp83867-rxctrl-strap-quirk;
> +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +			reset-gpios = <&lsio_gpio2 6 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <500000>;
> +			reset-deassert-us = <50000>;
> +			enet-phy-lane-no-swap;
> +			interrupt-parent = <&lsio_gpio2>;
> +			interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};
> +};
> +
> +&fec2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec2>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy3>;
> +	nvmem-cells = <&fec_mac1>;
> +	nvmem-cell-names = "mac-address";
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy3: ethernet-phy@3 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <3>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_ethphy3>;
> +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,dp83867-rxctrl-strap-quirk;
> +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +			reset-gpios = <&lsio_gpio2 4 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <500000>;
> +			reset-deassert-us = <50000>;
> +			enet-phy-lane-no-swap;
> +		};
> +	};
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "okay";
> +};
> +
> +&flexcan2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	status = "okay";
> +};
> +
> +&hsio_phy {
> +	fsl,hsio-cfg = "pciea-pcieb-sata";
> +	fsl,refclk-pad-mode = "input";
> +	status = "okay";
> +};
> +
> +/* no refclock gating */
> +&hsio_refa_clk {
> +	compatible = "fixed-factor-clock";
> +	clocks = <&pcieclk 0>;
> +	clock-div = <1>;
> +	clock-mult = <1>;
> +	/delete-property/ enable-gpios;
> +};
> +
> +&hsio_refb_clk {
> +	compatible = "fixed-factor-clock";
> +	clocks = <&pcieclk 0>;
> +	clock-div = <1>;
> +	clock-mult = <1>;
> +	/delete-property/ enable-gpios;
> +};
> +
> +&i2c1 {
> +	tlv320aic3x04: audio-codec@18 {
> +		compatible = "ti,tlv320aic32x4";
> +		reg = <0x18>;
> +		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "mclk";
> +		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +				<&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
> +		ldoin-supply = <&reg_mba8x_v3v3>;
> +		iov-supply = <&reg_v1v8>;
> +	};
> +
> +	sensor1: temperature-sensor@1c {
> +		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
> +		reg = <0x1c>;
> +	};
> +
> +	eeprom2: eeprom@54 {
> +		compatible = "nxp,se97b", "atmel,24c02";
> +		reg = <0x54>;
> +		pagesize = <16>;
> +		vcc-supply = <&reg_mba8x_v3v3>;
> +	};
> +
> +	pcieclk: clock-generator@68 {
> +		compatible = "renesas,9fgv0441";
> +		reg = <0x68>;
> +		clocks = <&clk_xtal25>;
> +		#clock-cells = <1>;
> +	};
> +};
> +
> +&lpspi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpspi0 &pinctrl_lpspi0_cs>;
> +	cs-gpios = <&lsio_gpio3 5 GPIO_ACTIVE_LOW>, <&lsio_gpio3 6 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&lpspi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpspi1 &pinctrl_lpspi1_cs>;
> +	cs-gpios = <&lsio_gpio3 24 GPIO_ACTIVE_LOW>, <&lsio_gpio3 25 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&lpspi2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpspi2 &pinctrl_lpspi2_cs>;
> +	cs-gpios = <&lsio_gpio3 10 GPIO_ACTIVE_LOW>, <&lsio_gpio3 11 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&lpuart0 { /* console */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpuart0>;
> +	status = "okay";
> +};
> +
> +&lpuart1 { /* X62 pin header */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpuart1>;
> +	status = "okay";
> +};
> +
> +&lpuart2 { /* mikroBUS */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpuart2>;
> +	status = "okay";
> +};
> +
> +&lsio_gpio2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gpio2>;
> +	gpio-line-names = "", "", "", "",
> +			  "", "PCIE0_DISABLE#", "", "";
> +
> +	pcie0-wdisable1-hog {
> +		gpio-hog;
> +		gpios = <5 0>;
> +		output-high;
> +		line-name = "PCIE0_DISABLE#";
> +	};
> +
> +	pcie-clk-pd-hog {
> +		gpio-hog;
> +		gpios = <10 0>;
> +		output-high;
> +		line-name = "PCIE_CLK_PD#";
> +	};
> +};
> +
> +&lsio_pwm3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lsio_pwm3>;
> +	status = "okay";
> +};
> +
> +&pciea {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pciea>;
> +	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
> +	phy-names = "pcie-phy";
> +	reset-gpio = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&pcieb {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pcieb>;
> +	phys = <&hsio_phy 1 PHY_TYPE_PCIE 1>;
> +	phy-names = "pcie-phy";
> +	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&sai1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai1>;
> +	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +			  <&sai1_lpcg IMX_LPCG_CLK_0>;
> +	assigned-clock-rates = <786432000>, <49152000>, <12288000>, <49152000>;
> +	status = "okay";
> +};
> +
> +&sai5 {
> +	status = "okay";
> +};
> +
> +&sai5_lpcg {
> +	status = "okay";
> +};
> +
> +&sata {
> +	status = "okay";
> +};
> +
> +&usbphy1 {
> +	phy-3p0-supply = <&reg_usb_phy>;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usbotg1>;
> +	srp-disable;
> +	hnp-disable;
> +	adp-disable;
> +	power-active-high;
> +	over-current-active-low;
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usb3_phy {
> +	status = "okay";
> +};
> +
> +&usbotg3 {
> +	/* over-current disabled by default */
> +	status = "okay";
> +};
> +
> +&usbotg3_cdns3 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usbhub>;
> +	status = "okay";
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb451,8142";
> +		reg = <1>;
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&lsio_gpio2 7 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&reg_mba8x_v3v3>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb451,8140";
> +		reg = <2>;
> +		peer-hub = <&hub_2_0>;
> +		reset-gpios = <&lsio_gpio2 7 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&reg_mba8x_v3v3>;
> +	};
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	bus-width = <4>;
> +	cd-gpios = <&lsio_gpio5 22 GPIO_ACTIVE_LOW>;
> +	wp-gpios = <&lsio_gpio5 21 GPIO_ACTIVE_HIGH>;
> +	vmmc-supply = <&reg_v3v3_sd>;
> +	no-mmc;
> +	no-sdio;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gpio>;
> +
> +	pinctrl_adc0: adc0grp {
> +		fsl,pins = <IMX8QM_ADC_IN1_DMA_ADC0_IN1		0x02000060>,
> +			   <IMX8QM_ADC_IN2_DMA_ADC0_IN2		0x02000060>;
> +	};
> +
> +	pinctrl_ethphy0: ethphy0grp {
> +		fsl,pins = <IMX8QM_ESAI1_SCKR_LSIO_GPIO2_IO06	0x00000041>,
> +			   <IMX8QM_ESAI1_TX0_LSIO_GPIO2_IO08	0x00000021>;
> +	};
> +
> +	pinctrl_ethphy3: ethphy3grp {
> +		fsl,pins = <IMX8QM_ESAI1_FSR_LSIO_GPIO2_IO04	0x00000041>;
> +	};
> +
> +	pinctrl_fec1: fec1grp {
> +		fsl,pins = <IMX8QM_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB_PAD		0x000014a0>,
> +			   <IMX8QM_ENET0_MDC_CONN_ENET0_MDC			0x06000041>,
> +			   <IMX8QM_ENET0_MDIO_CONN_ENET0_MDIO			0x06000041>,
> +			   <IMX8QM_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL	0x00000041>,
> +			   <IMX8QM_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC		0x00000041>,
> +			   <IMX8QM_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0	0x00000041>,
> +			   <IMX8QM_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1	0x00000041>,
> +			   <IMX8QM_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2	0x00000041>,
> +			   <IMX8QM_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3	0x00000041>,
> +			   <IMX8QM_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC		0x00000040>,
> +			   <IMX8QM_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CTL	0x00000040>,
> +			   <IMX8QM_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0	0x00000040>,
> +			   <IMX8QM_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1	0x00000040>,
> +			   <IMX8QM_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2	0x00000040>,
> +			   <IMX8QM_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3	0x00000040>;
> +	};
> +
> +	pinctrl_fec2: fec2grp {
> +		fsl,pins = <IMX8QM_COMP_CTL_GPIO_1V8_3V3_ENET_ENETA_PAD		0x000014a0>,
> +			   <IMX8QM_ENET1_MDC_CONN_ENET1_MDC			0x06000041>,
> +			   <IMX8QM_ENET1_MDIO_CONN_ENET1_MDIO			0x06000041>,
> +			   <IMX8QM_ENET1_RGMII_TX_CTL_CONN_ENET1_RGMII_TX_CTL	0x00000041>,
> +			   <IMX8QM_ENET1_RGMII_TXC_CONN_ENET1_RGMII_TXC		0x00000041>,
> +			   <IMX8QM_ENET1_RGMII_TXD0_CONN_ENET1_RGMII_TXD0	0x00000041>,
> +			   <IMX8QM_ENET1_RGMII_TXD1_CONN_ENET1_RGMII_TXD1	0x00000041>,
> +			   <IMX8QM_ENET1_RGMII_TXD2_CONN_ENET1_RGMII_TXD2	0x00000041>,
> +			   <IMX8QM_ENET1_RGMII_TXD3_CONN_ENET1_RGMII_TXD3	0x00000041>,
> +			   <IMX8QM_ENET1_RGMII_RXC_CONN_ENET1_RGMII_RXC		0x00000040>,
> +			   <IMX8QM_ENET1_RGMII_RX_CTL_CONN_ENET1_RGMII_RX_CTL	0x00000040>,
> +			   <IMX8QM_ENET1_RGMII_RXD0_CONN_ENET1_RGMII_RXD0	0x00000040>,
> +			   <IMX8QM_ENET1_RGMII_RXD1_CONN_ENET1_RGMII_RXD1	0x00000040>,
> +			   <IMX8QM_ENET1_RGMII_RXD2_CONN_ENET1_RGMII_RXD2	0x00000040>,
> +			   <IMX8QM_ENET1_RGMII_RXD3_CONN_ENET1_RGMII_RXD3	0x00000040>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan0grp {
> +		fsl,pins = <IMX8QM_FLEXCAN0_TX_DMA_FLEXCAN0_TX		0x00000021>,
> +			   <IMX8QM_FLEXCAN0_RX_DMA_FLEXCAN0_RX		0x00000021>;
> +	};
> +
> +	pinctrl_flexcan2: flexcan1grp {
> +		fsl,pins = <IMX8QM_FLEXCAN1_TX_DMA_FLEXCAN1_TX		0x00000021>,
> +			   <IMX8QM_FLEXCAN1_RX_DMA_FLEXCAN1_RX		0x00000021>;
> +	};
> +
> +	pinctrl_gpio: pingpiogrp {
> +		fsl,pins = /* GPIO0_05 on X62:26 */
> +			   <IMX8QM_SIM0_GPIO0_00_LSIO_GPIO0_IO05	0x00000021>,
> +			   /* GPIO1_14 on X64:21 */
> +			   <IMX8QM_LVDS1_I2C1_SCL_LSIO_GPIO1_IO14	0x00000021>,
> +			   /* GPIO1_15 on X64:23 */
> +			   <IMX8QM_LVDS1_I2C1_SDA_LSIO_GPIO1_IO15	0x00000021>,
> +			   /* GPIO2_17 on X63:37 */
> +			   <IMX8QM_SPI3_SCK_LSIO_GPIO2_IO17		0x00000021>,
> +			   /* GPIO2_21 on X63:39 */
> +			   <IMX8QM_SPI3_CS1_LSIO_GPIO2_IO21		0x00000021>,
> +			   /* GPIO4_12 on X61:24 */
> +			   <IMX8QM_USDHC2_CD_B_LSIO_GPIO4_IO12		0x00000021>,
> +			   /* GPIO4_11 on X61:26 */
> +			   <IMX8QM_USDHC2_WP_LSIO_GPIO4_IO11		0x00000021>,
> +			   /* GPIO4_10 on X61:28 */
> +			   <IMX8QM_USDHC2_VSELECT_LSIO_GPIO4_IO10	0x00000021>,
> +			   /* GPIO4_09 on X61:30 */
> +			   <IMX8QM_USDHC2_RESET_B_LSIO_GPIO4_IO09	0x00000021>,
> +			   /* GPIO5_23 on X62:24 */
> +			   <IMX8QM_USDHC1_STROBE_LSIO_GPIO5_IO23	0x00000021>,
> +			   /* GPIO5_24 on X61:15 */
> +			   <IMX8QM_USDHC2_CLK_LSIO_GPIO5_IO24		0x00000021>,
> +			   /* GPIO5_25 on X61:17 */
> +			   <IMX8QM_USDHC2_CMD_LSIO_GPIO5_IO25		0x00000021>,
> +			   /* GPIO5_26 on X61:19 */
> +			   <IMX8QM_USDHC2_DATA0_LSIO_GPIO5_IO26		0x00000021>,
> +			   /* GPIO5_27 on X61:21 */
> +			   <IMX8QM_USDHC2_DATA1_LSIO_GPIO5_IO27		0x00000021>,
> +			   /* GPIO5_28 on X61:23 */
> +			   <IMX8QM_USDHC2_DATA2_LSIO_GPIO5_IO28		0x00000021>,
> +			   /* GPIO5_29 on X61:25 */
> +			   <IMX8QM_USDHC2_DATA3_LSIO_GPIO5_IO29		0x00000021>;
> +	};
> +
> +	pinctrl_gpio2: gpio2grp {
> +		fsl,pins = <IMX8QM_ESAI1_FST_LSIO_GPIO2_IO05		0x00000021>,
> +			   <IMX8QM_ESAI1_TX2_RX3_LSIO_GPIO2_IO10	0x00000021>;
> +	};
> +
> +	pinctrl_gpiokeys: gpiokeysgrp {
> +		fsl,pins = <IMX8QM_ESAI1_TX3_RX2_LSIO_GPIO2_IO11	0x00000021>,
> +			   <IMX8QM_SCU_GPIO0_04_LSIO_GPIO1_IO00		0x00000021>;
> +	};
> +
> +	pinctrl_gpioled: gpioledgrp {
> +		fsl,pins = <IMX8QM_USDHC1_DATA4_LSIO_GPIO5_IO19		0x00000021>,
> +			   <IMX8QM_USDHC1_DATA5_LSIO_GPIO5_IO20		0x00000021>;
> +	};
> +
> +	pinctrl_lpspi0: lpspi0grp {
> +		fsl,pins = <IMX8QM_SPI0_SCK_DMA_SPI0_SCK		0x0600004d>,
> +			   <IMX8QM_SPI0_SDO_DMA_SPI0_SDO		0x0600004d>,
> +			   <IMX8QM_SPI0_SDI_DMA_SPI0_SDI		0x0600004d>;
> +	};
> +
> +	pinctrl_lpspi0_cs: lpspi0csgrp {
> +		fsl,pins = <IMX8QM_SPI0_CS0_LSIO_GPIO3_IO05		0x00000021>,
> +			   <IMX8QM_SPI0_CS1_LSIO_GPIO3_IO06		0x00000021>;
> +	};
> +
> +	pinctrl_lpspi1: lpspi1grp {
> +		fsl,pins = <IMX8QM_ADC_IN3_DMA_SPI1_SCK			0x0600004d>,
> +			   <IMX8QM_ADC_IN4_DMA_SPI1_SDO			0x0600004d>,
> +			   <IMX8QM_ADC_IN5_DMA_SPI1_SDI			0x0600004d>;
> +	};
> +
> +	pinctrl_lpspi1_cs: lpspi1csgrp {
> +		fsl,pins = <IMX8QM_ADC_IN6_LSIO_GPIO3_IO24		0x00000021>,
> +			   <IMX8QM_ADC_IN7_LSIO_GPIO3_IO25		0x00000021>;
> +	};
> +
> +	pinctrl_lpspi2: lpspi2grp {
> +		fsl,pins = <IMX8QM_SPI2_SCK_DMA_SPI2_SCK		0x0600004d>,
> +			   <IMX8QM_SPI2_SDO_DMA_SPI2_SDO		0x0600004d>,
> +			   <IMX8QM_SPI2_SDI_DMA_SPI2_SDI		0x0600004d>;
> +	};
> +
> +	pinctrl_lpspi2_cs: lpspi2sgrp {
> +		fsl,pins = <IMX8QM_SPI2_CS0_LSIO_GPIO3_IO10		0x00000021>,
> +			   <IMX8QM_SPI2_CS1_LSIO_GPIO3_IO11		0x00000021>;
> +	};
> +
> +	pinctrl_lpuart0: lpuart0grp {
> +		fsl,pins = <IMX8QM_UART0_RX_DMA_UART0_RX		0x06000021>,
> +			   <IMX8QM_UART0_TX_DMA_UART0_TX		0x06000021>,
> +			   <IMX8QM_UART0_CTS_B_DMA_UART0_CTS_B		0x00000021>,
> +			   <IMX8QM_UART0_RTS_B_DMA_UART0_RTS_B		0x00000021>;
> +	};
> +
> +	pinctrl_lpuart1: lpuart1grp {
> +		fsl,pins = <IMX8QM_UART1_RX_DMA_UART1_RX		0x06000021>,
> +			   <IMX8QM_UART1_TX_DMA_UART1_TX		0x06000021>,
> +			   <IMX8QM_UART1_CTS_B_DMA_UART1_CTS_B		0x00000021>,
> +			   <IMX8QM_UART1_RTS_B_DMA_UART1_RTS_B		0x00000021>;
> +	};
> +
> +	pinctrl_lpuart2: lpuart2grp {
> +		fsl,pins = <IMX8QM_LVDS0_I2C1_SDA_DMA_UART2_RX		0x06000021>,
> +			   <IMX8QM_LVDS0_I2C1_SCL_DMA_UART2_TX		0x06000021>;
> +	};
> +
> +	pinctrl_lsio_pwm3: lsiopwm3grp {
> +		fsl,pins = <IMX8QM_GPT0_COMPARE_LSIO_PWM3_OUT		0x00000021>;
> +	};
> +
> +	pinctrl_pciea: pcieagrp {
> +		fsl,pins = <IMX8QM_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO29		0x06000021>,
> +			   <IMX8QM_PCIE_CTRL0_CLKREQ_B_HSIO_PCIE0_CLKREQ_B	0x06000021>,
> +			   <IMX8QM_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO28		0x04000021>;
> +	};
> +
> +	pinctrl_pcieb: pciebgrp {
> +		fsl,pins = <IMX8QM_PCIE_CTRL1_PERST_B_LSIO_GPIO5_IO00		0x06000021>,
> +			   <IMX8QM_PCIE_CTRL1_CLKREQ_B_HSIO_PCIE1_CLKREQ_B	0x06000021>,
> +			   <IMX8QM_PCIE_CTRL1_WAKE_B_LSIO_GPIO4_IO31		0x04000021>;
> +	};
> +
> +	pinctrl_pwmfan: pwmfangrp {
> +		fsl,pins = <IMX8QM_SPI3_CS0_LSIO_GPIO2_IO20		0x30>;
> +	};
> +
> +	pinctrl_reg_mba8x_12v: mba12vgrp {
> +		fsl,pins = <IMX8QM_SCU_GPIO0_06_LSIO_GPIO1_IO02		0x00000021>;
> +	};
> +
> +	pinctrl_reg_pcie_v1v5: regpcie1v5grp {
> +		fsl,pins = <IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31		0x00000021>;
> +	};
> +
> +	pinctrl_reg_pcie_v3v3: regpcie3v3grp {
> +		fsl,pins = <IMX8QM_SCU_GPIO0_05_LSIO_GPIO1_IO01		0x00000021>;
> +	};
> +
> +	pinctrl_regpwmfan: regpwmfangrp {
> +		fsl,pins = <IMX8QM_ESAI1_TX4_RX1_LSIO_GPIO2_IO12	0x00000021>;
> +	};
> +
> +	pinctrl_reg_v3v3_sd: reg3v3sdgrp {
> +		fsl,pins = <IMX8QM_USDHC1_RESET_B_LSIO_GPIO4_IO07	0x00000021>;
> +	};
> +
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins = <IMX8QM_SAI1_RXD_AUD_SAI1_RXD		0x06000041>,
> +			   <IMX8QM_SAI1_RXC_AUD_SAI1_RXC		0x06000041>,
> +			   <IMX8QM_SAI1_RXFS_AUD_SAI1_RXFS		0x06000041>,
> +			   <IMX8QM_SAI1_TXD_AUD_SAI1_TXD		0x06000061>,
> +			   <IMX8QM_SAI1_TXC_AUD_SAI1_TXC		0x06000041>,
> +			   <IMX8QM_MCLK_OUT0_AUD_ACM_MCLK_OUT0		0x0600004d>;
> +	};
> +
> +	pinctrl_usbotg1: usbotg1grp {
> +		fsl,pins = <IMX8QM_USB_SS3_TC2_CONN_USB_OTG1_OC		0x00000021>,
> +			   <IMX8QM_USB_SS3_TC0_CONN_USB_OTG1_PWR	0x00000021>;
> +	};
> +
> +	pinctrl_usbhub: usbhubgrp {
> +		fsl,pins = <IMX8QM_ESAI1_SCKT_LSIO_GPIO2_IO07		0x00000021>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
> +		fsl,pins = <IMX8QM_USDHC1_DATA6_LSIO_GPIO5_IO21		0x00000021>,
> +			   <IMX8QM_USDHC1_DATA7_LSIO_GPIO5_IO22		0x00000021>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK		0x06000041>,
> +			   <IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD		0x00000021>,
> +			   <IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0	0x00000021>,
> +			   <IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1	0x00000021>,
> +			   <IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2	0x00000021>,
> +			   <IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3	0x00000021>,
> +			   <IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT	0x00000021>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK		0x06000041>,
> +			   <IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD		0x00000021>,
> +			   <IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0	0x00000021>,
> +			   <IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1	0x00000021>,
> +			   <IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2	0x00000021>,
> +			   <IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3	0x00000021>,
> +			   <IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT	0x00000021>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <IMX8QM_USDHC1_CLK_CONN_USDHC1_CLK		0x06000041>,
> +			   <IMX8QM_USDHC1_CMD_CONN_USDHC1_CMD		0x00000021>,
> +			   <IMX8QM_USDHC1_DATA0_CONN_USDHC1_DATA0	0x00000021>,
> +			   <IMX8QM_USDHC1_DATA1_CONN_USDHC1_DATA1	0x00000021>,
> +			   <IMX8QM_USDHC1_DATA2_CONN_USDHC1_DATA2	0x00000021>,
> +			   <IMX8QM_USDHC1_DATA3_CONN_USDHC1_DATA3	0x00000021>,
> +			   <IMX8QM_USDHC1_VSELECT_CONN_USDHC1_VSELECT	0x00000021>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> new file mode 100644
> index 0000000000000..d94605c999915
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> @@ -0,0 +1,318 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2019-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +#include <dt-bindings/firmware/imx/rsrc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +#include "imx8qm.dtsi"
> +
> +/ {
> +	model = "TQ-Systems i.MX8QM TQMa8QM";
> +	compatible = "tq,imx8qm-tqma8qm", "fsl,imx8qm";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		/*
> +		 * DRAM base addr, size : 1024 MiB DRAM
> +		 * should be corrected by bootloader
> +		 */
> +		reg = <0x00000000 0x80000000 0 0x40000000>;
> +	};
> +
> +	reg_tqma8x_v3v3: regulator-tqma8x-v3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	/* SW7 controlled by SCU */
> +	reg_1v8_io1: regulator-v1v8-io1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_1V8_IO1";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	/* LDO4 controlled by SCU */
> +	reg_3v3_emmc: regulator-v3v3-emmc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_3V3_EMMC";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&acm {
> +	status = "okay";
> +};
> +
> +&adc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_adc0>;
> +	vref-supply = <&reg_vref_v1v8>;
> +	status = "okay";
> +};
> +
> +/* TQMa8QM only uses industrial grade, reduce trip points accordingly */
> +&cpu_alert0 {
> +	temperature = <95000>;
> +};
> +
> +&cpu_crit0 {
> +	temperature = <100000>;
> +};
> +
> +&cpu_alert1 {
> +	temperature = <95000>;
> +};
> +
> +&cpu_crit1 {
> +	temperature = <100000>;
> +};
> +
> +&gpu_alert0 {
> +	temperature = <95000>;
> +};
> +
> +&gpu_crit0 {
> +	temperature = <100000>;
> +};
> +
> +&gpu_alert1 {
> +	temperature = <95000>;
> +};
> +
> +&gpu_crit1 {
> +	temperature = <100000>;
> +};
> +
> +&drc_alert0 {
> +	temperature = <95000>;
> +};
> +
> +&drc_crit0 {
> +	temperature = <100000>;
> +};
> +/* end of temperature grade adjustments */
> +
> +&flexspi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexspi0>;
> +	status = "okay";
> +
> +	flash0: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <66000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +		vcc-supply = <&reg_1v8_io1>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_lpi2c1>;
> +	pinctrl-1 = <&pinctrl_lpi2c1gpio>;
> +	scl-gpios = <&lsio_gpio0 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&lsio_gpio0 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	se97: temperature-sensor@1b {
> +		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
> +		reg = <0x1b>;
> +	};
> +
> +	pcf85063: rtc@51 {
> +		compatible = "nxp,pcf85063a";
> +		reg = <0x51>;
> +		quartz-load-femtofarads = <7000>;
> +	};
> +
> +	at24c02: eeprom@53 {
> +		compatible = "nxp,se97b", "atmel,24c02";
> +		reg = <0x53>;
> +		pagesize = <16>;
> +		read-only;
> +		vcc-supply = <&reg_tqma8x_v3v3>;
> +	};
> +
> +	m24c64: eeprom@57 {
> +		compatible = "atmel,24c64";
> +		reg = <0x57>;
> +		pagesize = <32>;
> +		vcc-supply = <&reg_tqma8x_v3v3>;
> +	};
> +};
> +
> +&mu_m0 {
> +	status = "okay";
> +};
> +
> +&mu1_m0 {
> +	status = "okay";
> +};
> +
> +&mu2_m0 {
> +	status = "okay";
> +};
> +
> +&thermal_zones {
> +	pmic0-thermal {
> +		polling-delay-passive = <250>;
> +		polling-delay = <2000>;
> +		thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;
> +
> +		trips {
> +			pmic_alert0: trip0 {
> +				temperature = <110000>;
> +				hysteresis = <2000>;
> +				type = "passive";
> +			};
> +			pmic_crit0: trip1 {
> +				temperature = <125000>;
> +				hysteresis = <2000>;
> +				type = "critical";
> +			};
> +		};
> +
> +		cooling-maps {
> +			map0 {
> +				trip = <&pmic_alert0>;
> +				cooling-device =
> +					<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};
> +		};
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	bus-width = <8>;
> +	vmmc-supply = <&reg_3v3_emmc>;
> +	vqmmc-supply = <&reg_1v8_io1>;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&vpu {
> +	compatible = "nxp,imx8qm-vpu";
> +	status = "okay";
> +};
> +
> +&vpu_core0 {
> +	memory-region = <&decoder_boot>, <&decoder_rpc>;
> +	status = "okay";
> +};
> +
> +&vpu_core1 {
> +	memory-region = <&encoder1_boot>, <&encoder1_rpc>;
> +	status = "okay";
> +};
> +
> +&vpu_core2 {
> +	memory-region = <&encoder2_boot>, <&encoder2_rpc>;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_lpi2c1: lpi2c1grp {
> +		fsl,pins = <IMX8QM_GPT0_CAPTURE_DMA_I2C1_SDA		0x0600004d>,
> +			   <IMX8QM_GPT0_CLK_DMA_I2C1_SCL		0x0600004d>;
> +	};
> +
> +	pinctrl_lpi2c1gpio: lpi2c1gpiogrp {
> +		fsl,pins = <IMX8QM_GPT0_CAPTURE_LSIO_GPIO0_IO15		0x0600004d>,
> +			   <IMX8QM_GPT0_CLK_LSIO_GPIO0_IO14		0x0600004d>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK		0x06000041>,
> +			   <IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7		0x00000021>,
> +			   <IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041>,
> +			   <IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B	0x00000021>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK		0x06000040>,
> +			   <IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7		0x00000021>,
> +			   <IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041>,
> +			   <IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B	0x00000021>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK		0x06000040>,
> +			   <IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6		0x00000021>,
> +			   <IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7		0x00000021>,
> +			   <IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041>,
> +			   <IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B	0x00000021>;
> +	};
> +
> +	pinctrl_flexspi0: flexspi0grp {
> +		fsl,pins = <IMX8QM_QSPI0A_DATA0_LSIO_QSPI0A_DATA0	0x0000004d>,
> +			   <IMX8QM_QSPI0A_DATA1_LSIO_QSPI0A_DATA1	0x0000004d>,
> +			   <IMX8QM_QSPI0A_DATA2_LSIO_QSPI0A_DATA2	0x0000004d>,
> +			   <IMX8QM_QSPI0A_DATA3_LSIO_QSPI0A_DATA3	0x0000004d>,
> +			   <IMX8QM_QSPI0A_DQS_LSIO_QSPI0A_DQS		0x0000004d>,
> +			   <IMX8QM_QSPI0A_SS0_B_LSIO_QSPI0A_SS0_B	0x0000004d>,
> +			   <IMX8QM_QSPI0A_SS1_B_LSIO_QSPI0A_SS1_B	0x0000004d>,
> +			   <IMX8QM_QSPI0A_SCLK_LSIO_QSPI0A_SCLK		0x0000004d>,
> +			   <IMX8QM_QSPI0B_SCLK_LSIO_QSPI0B_SCLK		0x0000004d>,
> +			   <IMX8QM_QSPI0B_DATA0_LSIO_QSPI0B_DATA0	0x0000004d>,
> +			   <IMX8QM_QSPI0B_DATA1_LSIO_QSPI0B_DATA1	0x0000004d>,
> +			   <IMX8QM_QSPI0B_DATA2_LSIO_QSPI0B_DATA2	0x0000004d>,
> +			   <IMX8QM_QSPI0B_DATA3_LSIO_QSPI0B_DATA3	0x0000004d>,
> +			   <IMX8QM_QSPI0B_DQS_LSIO_QSPI0B_DQS		0x0000004d>,
> +			   <IMX8QM_QSPI0B_SS0_B_LSIO_QSPI0B_SS0_B	0x0000004d>,
> +			   <IMX8QM_QSPI0B_SS1_B_LSIO_QSPI0B_SS1_B	0x0000004d>;
> +	};
> +};
> --
> 2.43.0
>

