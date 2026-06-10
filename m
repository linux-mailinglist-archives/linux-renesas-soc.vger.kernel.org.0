Return-Path: <linux-renesas-soc+bounces-33797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T6RQJsgXKWoCQgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:52:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1783666CAE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:52:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=CugvQnzv;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19095315623A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 07:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA44C3932E0;
	Wed, 10 Jun 2026 07:47:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643EB3749F7;
	Wed, 10 Jun 2026 07:47:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077662; cv=fail; b=epgOn4N4mKgKjCI8pEZPeeWU9GutXzVydCuNFzbF9w0VvfkaTorsc4/m2FmnZGskZiMmsqpyNyIm7UlwsC1adcTKlnAZELKVlAT42K1QZH/MNJc3jTXiX24RUHpwlJehnHEk7rUMOrZxK21MDvqGe17inBrIri9eXetvRiow8l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077662; c=relaxed/simple;
	bh=3do3XCpTYdPyuUN1WJ7QOnrnRMaWFGDdrJziGuYUuno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GwGjRyOscIoMGiEEJvZZnrJjh//u421BLnHfiiOYihuS5yxu9cX0o5I8zlMhoO1PTTJTy4hYKVAKHKtezAjsATj4ksXUnh8wONi7Mw/knEAvq12wwZABf66IOdMuDmrJP5cIu5mRqY7HfoWtJteKrdvwt4MfLufgyodb4PE60aY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CugvQnzv; arc=fail smtp.client-ip=40.107.74.27
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3Jki9XiHaRv/G0JmwR/mYrWgEgbUYvfGF1Qf9325/a5zsHVKxqpnK3jpLecMdTppFuyXwUjzU+2DcafBMLpeDuVDxN/BS7UxVTgX/ASN2TeO1/0Z2tkDhiWNKXar+N/UXABf/6jc906UUJgrfRD8D0g8AYL8xGsbQuZIgZ9CSQ148Y9fxlHkMvTGVG2FRxWAYihhMbC1qYw/SgsDTLdFDzls5h6eb9HTjO4mS3lfFACXtRURLmJVJ5uPVPjMHekLUb0LDiVx0eIBifs+7nuH1mfazFoZ/P6gnM5rHumD8BIfdLvxBGoPuilasMVuYHdhBI/PNuU/MekaREHLWUuQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h35lcCClnX0xtq1IqgrPV2F1p5mO4F29tnIhLNuWIvM=;
 b=VoUAtaCGGPTev4lgP5KJ1FD8btZecwt+po5gAZRw/ZrJ0gk0LIxSlPMG7QbPovZE2loPWn3T9SgPPMDHFym9DvfGJokoV3F4g/9QtksU8RjJ/kVbgntuVkQZl/N2VlbcxoXeW8t9uKIWozCyxsrHvrfqHjP4Lwo+3J3IKQDLFI5xnUxFRgd+wUxCRSmh99KeSBynjoA32UWwuiRhFWAmTy/L1TvejAnflH6vV3XQ9uhSVLLjn5AAmMwT2aKCP3n0KXLPtvingmALLNmj99lu+dUbKBeYF+zp+ccrlbeUyeJsO1UJvPITOz6iL8PAzabHyb8pQFfyn3ZePEmoX8eWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h35lcCClnX0xtq1IqgrPV2F1p5mO4F29tnIhLNuWIvM=;
 b=CugvQnzvxaqeTUbT4dWKWAQD81RyppFmjt5VKIR97dRnkzrq6HW+0vGEIzYRk5lOOKZwQtQll02jZZYQhPZSb+pQKBO/A1sXHUtNJ4CRqOHTFc1Ye8uOYS0UZ/XSy9MUbE7DI05E/ls1fTl0iJJrSdB/XYveRa1Xy1gL4cJS7a0=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS7PR01MB13812.jpnprd01.prod.outlook.com (2603:1096:604:368::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 07:47:38 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 07:47:38 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 2/4] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
Date: Wed, 10 Jun 2026 07:47:00 +0000
Message-Id: <20260610074702.1743334-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com>
References: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS7PR01MB13812:EE_
X-MS-Office365-Filtering-Correlation-Id: 05aa783a-25a6-4764-9c4f-08dec6c48b29
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|38350700014|5023799004|11063799006|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lrUNmy7/hGAcgbTNBbgAxcSiMNophTe5DY8B2GGrvowjdz9dp0GoR+RG7NO7Tc/HbPvH7eO4Y1b8O6Z2L2COTdCF/2bgnUPFoq3gxKs7hbECXo1BWx0WgeVc9tL1UXjS6hibm6MSkhh4IAQ+NZTYClkkXqv8bdRX7DFgD/LzHqivaz0/NgRlH79c0MsJ3cgVYrVofeomFQgka4UWfcg7KWW20CKxwrm07y0ROfUnCkRabnhVWvK4//DbQ7xlIZ1P6XNTZtAyp8Z5d5VnCrvnG9/yWEiPo/MwCSKIsAESOvWUohVlGW43C+tWHVmDZR/XJyQWjihj/h9KCVyQqH/W8y4/l+eyVRiMXurM8a3mT4lKaAX+2M6ccHfaWHlHmzwuVtNmpJM+aomZJtVZy+rDyQcl8sJ3qHPXVu9vXpqQTn1APQPzKpv6XJMrMxM8HeCZpemkQGAHhXf+jtih7FFNAzQQONIdAIt0cwbsXT+3LTAK1hra4YWrHyUt0zVPKuAMyEtAVz/OFEJKCtneGXWYWP/8W8iOZTqVrnzV/I1I+HqQxNYXByvdVlLx2YjfM/01wlXa/Q/dj3GdUju8VJn/iugKqOWt51ZXbXAQJAGXEMu0JLlDwWS+X+srLK6iUgoa3q7yON1f0iChR4343Q59fJJCJqcoLiaEX+Jq3D6OgicaWcuLibiaMzT6ltsYtsqQ044f3jGoe0bBhf6Of1u5w/WYXB5Ton/UzB4HanCc355o9e2p9dM43rfzcRSpI23P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(38350700014)(5023799004)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xUwMTzJCq3xsZ8to/PxuFPab3wFgSbmvV4MDmmWM0JAkHHvVkKWXWJ6dM6hm?=
 =?us-ascii?Q?dfpwOhKO1fD8AQPOCNu/liWLxACpL2xjeLVZbgCsAs5PxobUpf+13I4Iil3F?=
 =?us-ascii?Q?v3UNyAs4uWD2A5N9BxsFebORrD29sDLXYnAHm2k+6b/wVHWJbohzBt2oZwOf?=
 =?us-ascii?Q?1qsIWUfyz3qN4jU3qyPC3xtCMvmrLuZYuHnBGzFOdvFlXYAFIDo+c3OwuVVa?=
 =?us-ascii?Q?K1IdKpuHVfqaIhELIeC/ZQyGBuxu+h1J1KyMy/mW4Km4aHkA9ahO07Q1QFVB?=
 =?us-ascii?Q?n8vFJvA2UzfHMtqd6zeXpDqD82VL93nuhcGsSzjr//Tu3FZrBtwToBrh8wtS?=
 =?us-ascii?Q?U+1PxhldNUwRkVA7QnWQLAER6r8peEi7bn39mm0SJy5Y8qlqr7Z9lvEL51yC?=
 =?us-ascii?Q?zC1Ubee5OpuVfeQGwjGcZ9KVlZ73XLWRp3DUhN1bnSzTrBpL2xZRBQAYddkK?=
 =?us-ascii?Q?93IUnqkAsYOKLk4valM2bgA4hHR9zQnC2zlSwuCcH/Gh4fQUdxJ/BseDgdgE?=
 =?us-ascii?Q?pyZHN0MPWVDDFwMrS0QolBpeRZ4G2+2fC4rJ8EORfydPi299MbnlsHR6Dc/W?=
 =?us-ascii?Q?L2K3ya/oOo975kbPNEe8cJuKyFMI9DdIceenD5qfPt4OqoMCj3q3A18fNhhY?=
 =?us-ascii?Q?LtgDNLuEiUURymAYCWTPirLyhS3XyaLCpTDu+tRqx3mZhxzA6q9sVaJYHiKR?=
 =?us-ascii?Q?e+U3XdQUS/gAziE5zkcA+/gCo8FA/zyBV6kLqu80yfEzBfw9xoM58yhBfuzK?=
 =?us-ascii?Q?6lHl2gQ+UpMfugOWmnf4aCnVfOZVIFU4h67GEn45FQA4Af9CQJj4ZTMk9j+C?=
 =?us-ascii?Q?t/v6EbRwF4mu9rEFJjJ1liujVZe3X9TSXQ7mEK5VHngrti93jW3gOl52+LBq?=
 =?us-ascii?Q?BN90usayTEhBz9DPV8ccFx1rmHpwxSalklCR2L9dE/iIQvgFVIX5nKautGKO?=
 =?us-ascii?Q?ho7AiGFOkxrudSVy0QqN+kO6NNCadVdor0D0R6juRr8woyffCv6nPkjMxOCO?=
 =?us-ascii?Q?exv8PKdbJ7Xs/woADKNHt6WkhBFkZAFG5Ok0SmmkYYJPzpNFn4dxsgOvMiZj?=
 =?us-ascii?Q?07C6FoMPyXEGKT27zHsbgSF2yfXocTdhXA2eCxCz1keQpNUpSEJDiULbVaf5?=
 =?us-ascii?Q?11EQAxaFoeiJckyAJBuk+PMq4a1BPSPPoZ5VPa0WEPKsH9/N79MX3iFw6pTT?=
 =?us-ascii?Q?bw6hqSeg9kFSyM/bK9MltAK6QRcp58x0FDT1botv8gWSbTrH3Q+016RJdhym?=
 =?us-ascii?Q?zhJMYWDVZ3MNuu31VaoVWQQL69UIszZ9+q72dVLlcDpHxpGgXGqxFg1+NUxQ?=
 =?us-ascii?Q?ULspwItrA58OXyshZdfgRe1hI5LLwhxsZara3EdnDSfMFIpMuSgz5BrAaFdy?=
 =?us-ascii?Q?BJ5NPk8KQ90B/zkkQdC8FaD4JCaOmELK8Uw8qmvilFFcVmff8jy0crzSVA3+?=
 =?us-ascii?Q?esTrMbL1po2yyLGf+dro05o3n6L3dY7N5Gv+myB91Icm1FfGpYK8RiHXD7v5?=
 =?us-ascii?Q?djPJ1kk1FQfLqUCsW77v9trPgBjhNQWiYM0dsHM/bQPQugrmiEHzkKZBmNJK?=
 =?us-ascii?Q?KAP/NT8LVbCONVtzMj3ZHO+cotPbIKuLb8PeUUAdC9rXK7wOu7rc4Lu7cYeq?=
 =?us-ascii?Q?QLNAAGyUqBnzWXOjhpKM94bQGd/TJWUQkgKMksVnNHdWUwVwiuC47dLeUM42?=
 =?us-ascii?Q?5KN/luDrKVRPQGYnAtd3lG0nz3G8f6LU7rh/EqiWOA9Zxe6173a43kyRdP03?=
 =?us-ascii?Q?z14+VsLrV2PLhJADNE+AqidEyxL8Etk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05aa783a-25a6-4764-9c4f-08dec6c48b29
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:47:38.7147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVZqzLWm/M0NIicRJo2t/yVaY3di3Z1QZgyBMHleGc+vffFQvEGju0hvwirE/uO/t4Lq4OgjIFIayJ75TCxqZ13cU3gNcE6Kg2Gudivyvfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-33797-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:john.madieu.xa@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1783666CAE

Add the Renesas 5P35023 (Versa3) programmable clock generator on the
I2C2 bus along with its 24MHz input clock (x2 oscillator) to feed the
audio subsystem.

The Versa3 provides the following clock outputs:
- Output 0: 24MHz (reference)
- Output 1: 12.288MHz (audio, 48kHz family)
- Output 2: 11.2896MHz (audio, 44.1kHz family)
- Output 3: 12.288MHz (audio)
- Output 4: 25MHz (DIFF1, Ethernet)

These clocks are required for the audio codec and the Ethernet
controller found on the RZ/G3E SMARC EVK.

Output 5 (DIFF2) is left out, as it is not connected on this board.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5:
 - Drop Versa3 output 5 (DIFF2), as it is not connected.
 - Document output 4 (DIFF1) in the commit message; it is needed for
   Ethernet.

v4: No changes
v3: No changes
v2: No changes

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 15c22dbf0ad3..e951609d39e9 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -78,6 +78,12 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
 		regulator-always-on;
 	};
 
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
 	/* 32.768kHz crystal */
 	x3: x3-clock {
 		compatible = "fixed-clock";
@@ -137,6 +143,20 @@ raa215300: pmic@12 {
 
 		interrupts-extended = <&pinctrl RZG3E_GPIO(S, 1) IRQ_TYPE_EDGE_FALLING>;
 	};
+
+	versa3: clock-generator@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x2>;
+
+		assigned-clocks = <&versa3 0>, <&versa3 1>,
+				  <&versa3 2>, <&versa3 3>,
+				  <&versa3 4>, <&versa3 5>;
+		assigned-clock-rates = <24000000>, <12288000>,
+				       <11289600>, <12288000>,
+				       <25000000>, <25000000>;
+	};
 };
 
 &i3c {
-- 
2.25.1


