Return-Path: <linux-renesas-soc+bounces-32330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGjwHxI4AWpHSAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 03:59:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F30507166
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 03:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D3733001FC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 01:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF4B242D6A;
	Mon, 11 May 2026 01:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IS7yQRFm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61817555;
	Mon, 11 May 2026 01:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778464784; cv=fail; b=IrF2ImNf0/UQvhTHuERZ12D0CknduCyTq6Oh5t33K/41oFlgO6HEqmh7VhYV+OMF+h/7DmOA+GfJgTe1RJp6Gnibv9su+xcmN5GEKuwibKbcRjx6IbJVwlJ23lTAwjCnXmp8f40sXKWzG/FWcYqFdIN4A5aJx2b+34LGPKF5ul0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778464784; c=relaxed/simple;
	bh=JXKj9JUgSPHA36AhdSnKoYCjuEYRFF0ezTZOyOmFNlo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=r3J+i+2JeT+aPrRnvkZcLUbFPVHqdf4y8STyWwxBoUR3V8sekk8ahVzG4KfpnuwXwsg3/PLoteHY5h3B5SW7Y8oMRZfYF8ilZa8fDlF+iDIPuQu0GR1vXf4fnXUY/ulDM6E8w6CTQiRIeoygnyLQpeGDtl618xf9jriwPdhQB6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IS7yQRFm; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G81XReqn6HtKpuDd6Cdb0IJtTq19pPOXZEP7EPHueKyZrqnrWj017yZZxCzApdq4B5F4idt5YcIwmOTy7XgY0/QJ4fkr+jLf5QYxX6A2OE0oZuf/deHpZXhxkq6RMdkvfDZkEpyLI7psTAh0ZeXAV2ovm6r2X1gWUXn+aIfANn3YnLy+coCYt4PqqfXcKsTsuRa0xHAN0NHrztf7kfiQXrTMJDjdqwhvb8rn65UVDD49mtF8dQ0XsaSca08V3gv+MgOKuQYQztUDFy/9DSFHQATKq63xfcAeQ5uDRpuztB4HOnffV4dH0Fh+MfHt+BM9Jx48oR3Mo5skD1XVo2NOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqVTpw2Uf7VV7qp3ojKw58rSV0zGTYCt+DwbZHbp+fs=;
 b=QpTKACHfsUA505ZHRQ2qOCx5CEmDj/ttEEjARh4Oea7Vbib+Q+5IDZSzExTp+ewbfmHkideOUf3DYzZmfbZg9EaTtCqN1UsAzouFz5WBw3gpQstPI+vr/yLr8k3CRaYmOgf/I1FEeSlhG/WUn1BkaB8vRBFugSA1QDSGmU21IA4iiOsyDPATSK1Lu5oSe2ya2mNd8Hnvo6Vx+T6wTcb/FMP4kzZXHUi2yHW/Tx0zkh9hoazEguKNGtVMlbxvLn+8vBlulOZzgEtLFOcTmkaHHtBxv1s+Mj5B9cp+Z841gifvJyk73oGpZmx0kJ+4PTzbyDFQAsaPmJIBJguEnNcgFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqVTpw2Uf7VV7qp3ojKw58rSV0zGTYCt+DwbZHbp+fs=;
 b=IS7yQRFmZbyVeKXuvgJZ7bzM6KHcomyCJBs2bFcX5QgdV+qiiWvqjZkT89gzDz0Z7jDhEt4MJiP+HnzftFhgdZeJ6iBRpJx74Ql196qON/zldhN8IoDg5LHMEz8MTVVcsBG944VMDj2S9bo5iw+zoVrEE7Avp2h7cu8BGQUjhPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OS7PR01MB15007.jpnprd01.prod.outlook.com (2603:1096:604:39a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 01:59:40 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 01:59:40 +0000
Message-ID: <87a4u6n1tg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH v3 07/10] ASoC: renesas: fsi: refactor clock initialization
In-Reply-To: <20260510084303.122426-8-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
	<20260510084303.122426-8-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 May 2026 01:59:40 +0000
X-ClientProxiedBy: TY4P301CA0125.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::18) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OS7PR01MB15007:EE_
X-MS-Office365-Filtering-Correlation-Id: 94142c56-a18c-40cc-24bb-08deaf00f686
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dvVN/5IqrH6vZFcZF/VD1YdxH6rm9FWXRwzl69Q+GjXtIjGqyPwV8V/p4EZfaoq1SgaFoYtbvgYKqrDS40pjai5Gwfl31gzsNerz/VEXHiSsEmSsFzML0/OHEtm8sP5VjxTPOSo7bjbv27Rj+jZYxwi3W6+wn+UdCw/fawtO4GQ1Rha1p/XpAUz6bfmCPiFAp7ZzMFZhxI/f/1Wo45u0YOasY7R+AcF1oX2uyc0UlS8UooUuk1xsJYSkLhiZokpy7kWq/KKGH4PpULOpvB6dS5Om/ZBg83/LYVxi90us7EMl7676Ue4bIIZG/xn91JEsbPzBVbsWwWPBPnwhIi0JAO8zbgVT84tFIxKqbnihauxU/GtmQvKb1MRt8HSxo+Ne77HrCrg4yRdmU98w5Mu+yO6rkBMlm85o59AQUkLkaUp83WnUb5BTSmplsddZieWvLnx/fnliamDE89VS1s9yMofU3HmwMWxcnA4TbKXQ0qUmqAsGYUnZYP4qdI7GvHXSu8CiQfs9Aeoz2fHaddkpO4wzL+2ycF+0v7guqDntFgEdj1YkIKgxcN8Acu5jhh5+CPU8cvXg7ZvuIyywvYw9J4lCi4XiKntiQt4ZJutgF9knW+43qL8UvWNdmiw8/S3RZcL4wcY4dte4D6yz22xMPqJica+mRQ8EVJRwMevnVu7CYlyL5LJl9Jz/kF83EehBZp8MyMLx5tWWNTv0XXt/eL1rHYcPetzW68EZ4FUDBcRmmosxsBuUhEwWnHYpxTYr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tRdreZiHI1KsYsT1/O7bd/UdroqW9rbCpdLQ9dkVuPBSmNIQp8uKo6gCmtlq?=
 =?us-ascii?Q?ULFmOpXEteixMBDvTu+meyb0IodQbxds60Qkz6rdfUI5wud28tXVM6ooiSXM?=
 =?us-ascii?Q?qoDHMPf5vfd+JCvbQ5ub8yz1QeLcf11MFR6cg8YFKpAJkZTGZivp9NCsQ3WC?=
 =?us-ascii?Q?Q3KaDUWnwvtCHK9rtMuA2SZ7LIrkYVORfcrUajdUTQtQczOsIcZo1g4lmX/l?=
 =?us-ascii?Q?m2cd6bv2j2/+mnbVgTi3DUbroLOnBKLXlwdqw3iMqTvM7EvPpg6/drFxIfgx?=
 =?us-ascii?Q?7RFCiNcjwhhJ+Vqbf9qaoxkkyhRvRLJUBidVJIjlOFvXnB7iIBJbGjI5xic2?=
 =?us-ascii?Q?aAifnP9+lJxBea2SfXz6gdPlKuMvTqEQfMeJwVdv8kLKD3TMtngyyzyP1Vgb?=
 =?us-ascii?Q?VG9Z4meganrfRFZYM6ZMespb/+AGo75dtm8kZiM/BoFWa/qnbJolKEUFEQwu?=
 =?us-ascii?Q?TTY76mNOmnhi7sYDGMmdGnhsq2wSZFN/2E+qRqrQJ07iTgY+Lc4RXsMfGlPp?=
 =?us-ascii?Q?AITbDKSIkUkGlkgHd2Ec+/EVAAXbVCPYfva5eFvvIStnBcYXZm0k5el5h7lr?=
 =?us-ascii?Q?8qFwD1ii57QLObVdqLyYBDEoqE2FPERBu1U2kSDFc+EiXhrKzNASSPaEu1vc?=
 =?us-ascii?Q?o5aZljYGTSCUC1F3lvE4deDjCKSkPG1Ps/prE/9FfgitUo2+/pJsoDS4j5gD?=
 =?us-ascii?Q?VDIvfX/RMywKOpz2B/qPnILfhM8xhtmn7fKnbi1jIZrOThFOJzMt6lrZ2oJ+?=
 =?us-ascii?Q?kFnX/yTe0IRA4jSeRTC9AclB31IueASl/2+Tkt4fdcRqCWvM7+z9V+AhIA9S?=
 =?us-ascii?Q?Sb3SfOxUG8azMzmW0/ITfeMqJa1aSqDJkKYXVjhiINtDj9sbQztXzKaYz8sF?=
 =?us-ascii?Q?9YnrXVHCg4abCzTnsAM0DM0CC/PmngqFIFcLoF6M3G5DOFzuCZwX/PZr+GQX?=
 =?us-ascii?Q?+61mSVyJdYEVQikHE1yEgEAlNGRl7FkwHxLdVi8ZWJgGVFScVJYyCEP1X6EK?=
 =?us-ascii?Q?SFm5GPFgpwSBxkeD6aixfRl31BcETGYeDe6TNAejvJvsjTvmCzBD3NhV+lUG?=
 =?us-ascii?Q?pWpbDczHFPjEH/DfBse8WB9MzEZppvcWFukIlKShpLmNqehvltzWITWmgW3t?=
 =?us-ascii?Q?ySjufPUdCAI4R1WGqAGC9bjtfv1ZI+3sBvHbO8lvaL1uLa9R1ea1RzPg8jHI?=
 =?us-ascii?Q?Kg8QXYJ0f0ZKkD7PGAkcM0rGaFTiQVDSsyJTiQHLKAHpZe6UnFW7jfzUGzYz?=
 =?us-ascii?Q?a9zdeHkfvkNZzvsotTVI0v2VjI9cMGT6iHs6TbwkUpIVvqzmY91/db3ZS1ml?=
 =?us-ascii?Q?ywr3QQnm7NlDubYjMDSMVpuF795qBXmXOF1mytzmLzGHZ5iFXc02JzcIJ7rv?=
 =?us-ascii?Q?z+kbyTi4oQIs4/7BvALe6hsRY77uHPqCeHYTffvAANHan4mD2GzobStMYCQq?=
 =?us-ascii?Q?NryQCPq9ap0Ux3vQDyVvuINmTnpMbZDHN5YoDA9YIlgKH9D+DnUvwax7j9si?=
 =?us-ascii?Q?mkw5xZBNAUg2qLWZjaVAnY+e9pcaAMNujgMVmKKMHKgcoSLreXMl/V6nCL5x?=
 =?us-ascii?Q?4SQ/GyCRt1B+Ao3/KJH2AcoAZEZUb6cJqYHIRns0S/zDWbzuaNraXK0iHHFe?=
 =?us-ascii?Q?zxBg2IVgafoVA3bflfWufQmJlgQebLjzd5HSffeNVlyJefzVXOcYaQOOPAKi?=
 =?us-ascii?Q?uaXQgyXzmDPxsiHrtLE9fvLQ6/xpWu1Wxu6JE1horTETLJYghjxl2+a50IqE?=
 =?us-ascii?Q?apDFrpCO5il3brnbftcAidevUUmGu34mRDht1Mrui8v5cKtiOraa?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94142c56-a18c-40cc-24bb-08deaf00f686
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 01:59:40.5989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jxg1ChLhkKkAkyQ2EUbJT7UOVADVwwSO1XAjHy6VffdkhJUXaoVh3aP7TQAwlen+8sB+ZmiJEHtZBFJhI+eMreC2GhvAY6L4O3OgWAcmhmDIR2nn3otm0TkCHT5M5r9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15007
X-Rspamd-Queue-Id: 23F30507166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32330-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid,renesas.com:dkim]
X-Rspamd-Action: no action


Hi

> Move fsi_clk_init() to probe and use devm_clk_get_optional() for optional
> clocks. This allows probe to succeed even when some optional clocks are
> missing, while set_rate() performs strict validation to ensure all required
> clocks are available for hardware configuration during audio setup.
> 
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Below parts are clock->xxx cleanup code, not refactor clocks initialization ?
Please separate it into cleanup part and refactor part.

> 	/* external clock */
> 	if (xck) {
> -		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
> -		if (IS_ERR(clock->xck)) {
> -			dev_err(dev, "can't get xck clock\n");
> -			return -EINVAL;
> -		}
> +		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
> +		if (IS_ERR(clock->xck))
> +			return dev_err_probe(dev, PTR_ERR(clock->xck), "Can't get xck clock\n");
>  		if (clock->xck == clock->own) {
>  			dev_err(dev, "cpu doesn't support xck clock\n");
> 			return -EINVAL;
> @@ -1010,11 +1027,9 @@ static int fsi_clk_init(struct device *dev,
>  
>  	/* FSIACLK/FSIBCLK */
>  	if (ick) {
> -		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
> -		if (IS_ERR(clock->ick)) {
> -			dev_err(dev, "can't get ick clock\n");
> -			return -EINVAL;
> -		}
> +		clock->ick = devm_clk_get_optional(dev,  is_porta ? "icka" : "ickb");
> +		if (IS_ERR(clock->ick))
> +			return dev_err_probe(dev, PTR_ERR(clock->ick), "Can't get ick clock\n");
>  		if (clock->ick == clock->own) {
>  			dev_err(dev, "cpu doesn't support ick clock\n");
>  			return -EINVAL;
> @@ -1023,11 +1038,9 @@ static int fsi_clk_init(struct device *dev,
>  
>  	/* FSI-DIV */
>  	if (div) {
> -		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
> -		if (IS_ERR(clock->div)) {
> -			dev_err(dev, "can't get div clock\n");
> -			return -EINVAL;
> -		}
> +		clock->div = devm_clk_get_optional(dev,  is_porta ? "diva" : "divb");
> +		if (IS_ERR(clock->div))
> +			return dev_err_probe(dev, PTR_ERR(clock->div), "Can't get div clock\n");
>  		if (clock->div == clock->own) {
>  			dev_err(dev, "cpu doesn't support div clock\n");
>  			return -EINVAL;

