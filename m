Return-Path: <linux-renesas-soc+bounces-30808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HrPDGITz2nXsgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:09:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C6E38FDC3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6087B3014A1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 01:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B3A26E142;
	Fri,  3 Apr 2026 01:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h0Bs8uui"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEB122FF22;
	Fri,  3 Apr 2026 01:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775178556; cv=fail; b=WrKpoW2uJLW0LywvVoHx8BxvMn3AOv5GqPhUrGmGnTyKdkJIDxRCCjnA+LQUJq+CB0nacw67EtQKg43p8aIFKchi9mpNMMgbE07hiNoAqMFnsac+k9inb1SENoSS7CPZ0nI/4EcT0Kxh1xh4Onkhk5PzL2Uze6/ZzBEmD4D6bsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775178556; c=relaxed/simple;
	bh=ChxR29wn0ZQhpyaO7KLsXSyKMftrZVdfvQpAysUz/q0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ao59mZ6hQ9IHiA6+lXbvZykNlvgegvC2V0+tC4BGHorPP1KUp8Ml9e/2dn4NM7QewIr480zP6C0q8WxRylWYyFftYrIj+McexHP1TvwI/dLwpTLakZKs/fjTLMUCj5AAhMRlDWdKNaR2McUl0iv9xlN5QFuHu4aL4Jt3JbX1UDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h0Bs8uui; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNCx3uo4p96A5bEQC+FxCbSfamqq1/hbDZ8EPID2knYmTR4q8nbf7A7Rd3/bpCX3zXnBpZhXjzm0B+rgwrOmdB4gPSIQHbq9EXz5vL4QqYJ4YvNl2f0JMdQuASmOqDoVgwVuk8fAUEaSe366A2rKKjzvz5rrLa/e795ittyCFzPNCxy5sZXsL0qEXxWi5lLmRrJ1F29K9uzDqzNJQQkJV50b+8K1zFHlKp7uRkCZBfRgkJKM3zOi2p2mI1O+xcOmPlH8P3g9TwztGqfNr57iK2NjGZRN5qrx3oNjSWN3fbPZ5X+ys3UdkVwtydeL3tqW3dvdr0wny51sBgg78RJPXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEEm58zUBoFxcQeC8AQ43bRp/B2w1DCbXq3wyBDkKqw=;
 b=VX61UBIekK6Rv4ScjN3d6WGm/ZuH1Pstl7hdDZvEkYJmyex8bbO3DDWscq1v7psBzfoM+CdzVKvbnO1E4lCRwlo/LhZICQZpVRAhkwspLlS2sta4/aP4WaWSWoVHoyeB6gyMwAhLnzbXFs2stLK1Sq6/Hi6NL3DiWbf6wR6vld2EntXyC9RrrH6lVOhldMPQKVpY9VzbfTLBAInslKIzgzmI8eNOE51TK6F4cLzlGqOz/gd1QWxSnEMHvlRfRKrRKMObMUsVF97eIOxLjJ+PqY0NwvbeBc2E4H1/wRr1jiJp9Crep5lUVdz2as3LxEBLGcqFdYUCLVM+5ak1vC5Glw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEEm58zUBoFxcQeC8AQ43bRp/B2w1DCbXq3wyBDkKqw=;
 b=h0Bs8uuiC/gMpFyndTtDwCCXB/kQ8ANFBP1KmFkRUyT6Xt0zCiHx+/+wsbxFHNeDEA1QqHIQ0rSDYyGZXmtLIDLqgDrDjRAbJ/6Gz0rd16qznQl+3/HkgAC55uOmUM4p/HTdL0iNtehI3i0Vju43YX9k0oD63at9S8xaJh13POk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYVPR01MB10798.jpnprd01.prod.outlook.com (2603:1096:400:2af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 01:09:13 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 01:09:13 +0000
Message-ID: <87ldf4g893.wl-kuninori.morimoto.gx@renesas.com>
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
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCh v3 07/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
In-Reply-To: <20260402162436.12059-8-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-8-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Apr 2026 01:09:12 +0000
X-ClientProxiedBy: TYCP286CA0071.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYVPR01MB10798:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d9f161-afad-40ca-3f3e-08de911d9e41
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	NBEXC5CIGQt2HFGxGsr9sP+tAbfV4Mn5KcKFXTtLoG64ZN9deTHXx6snnDG3eu8xgpCQcWBp08PaCDYwLR0fpVcQ7LPiCaBFzDwQ6MgNTSYg7ZRA0fDkM78Uwu3ELJJ8ozI3icEU4Ru5KxY+qaGYzmWNXgxtKNTskVtYJxzVGkhHlT0/dpegxI0xuvkADUlDkrbhHy72xMS33O+MIs6BsRscDKWDdnda+fCtfRml0Rb+gK9ISipxcQIL1XCKxQkKnAXnKdwWr4OxdUWylFREQl6wHShIfUAwRf0qqzBEPIA1EB81Tu19ISkesZ1qVZ+HxoUgBs8Z2miT5hDCskeKYKHug+u+BjYoL3gu7pa9vIKoyT4yXHsFlWZS5bOTh4aYNyjX+nk3CVl+V8bUgZgTNHO+AVW9L5IkUjDaB9O6Usm3dFfobaDlbKOz9Cv1WGcGQuwxpQWBkoBi2qGLfPn+AWXbXXM45bJDkW/DkdIjaHWAPH8IUqfiLST81k+dchloUGMPTB3HJF55boJCXySEkYxgqSub8l54Hlf6NsMvyDe9oud9GNNP8cx8FC/ly8D+RByJxKuM/t0PlR8vKSMmJpY/IyhDz2bCFZ4fiFbTz4kdlwB8Uh000tSk7ub85O98M0GU1WfE64/8c4xIg9/CxOrVVebIevvKD8ownCiqh2/mPvSRofVzpwijGISoCgC5mEgh+dW1M8Apzfe24IEtjJd5SRt6q6fYlBE6ZQp6OnFvT7yaj+n5al5kdlxGO0KkPYiDG5n1ihTeSO7s7xNfXCVarjPeeucb9ukFhm+3FB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oyojoJeZSq9n1okI+nfp4/3xmpPxC9YtP3kxe+6b6EulN0Z47C6zWsEWgho7?=
 =?us-ascii?Q?MtRxvgCZwFRfX2mwtYnXM8zXQbg/r6ELZtbCbuaWOcPHZTbnOLsn1+7h25UC?=
 =?us-ascii?Q?4TocA2sNbjLYoVtlvNp2u/xAxo/juKXzEV56nTLsQjDclK3LISkoRXNb4bGI?=
 =?us-ascii?Q?/ba9Ow34UD13Ne/X48pqGD3FrySgspgHAk1tdqDHDprVZJWEM23cGUj4XMFo?=
 =?us-ascii?Q?2PX8Jw0MIx2vecTmA4zVNJ9z52IOZQ3hxMd0O4eh01vVcEwjM0RufSDlyohq?=
 =?us-ascii?Q?YE+KIsoCSmaGdFH79aEWUGHQ+maWfEBiT+XSt0okH1AbjjVmeFEZEj4Ajfg6?=
 =?us-ascii?Q?Wx3xozTRI8h6MtTp4v9NI8qS77CcKmDPBIWzHPuRfvHcRUd2f9JSQkbrxWu9?=
 =?us-ascii?Q?le2AAz003PK9BmkH5drNJE5s+YT4FNs8ZogBcX4QIFvWnIlZl0+6kS1sLg0a?=
 =?us-ascii?Q?x+PjF8+/uHGlABTq8ndifky6aOt9QMs4ULd7Nnqdt/HnTxwihjXgUzZuGT5e?=
 =?us-ascii?Q?sPUYJBSLpjnziNsEOYvW+13zpDklwDoO0khRQbZR9ciuA5XQlMk2BpEC3QAr?=
 =?us-ascii?Q?KGzJjOHHuzjeAflD4IESmTe4eXHwSswh2nIxuCCZhkd+8yhXp2pelGAvXPpm?=
 =?us-ascii?Q?Xq/FRIopnnZHq4ME8skwEaQE4p0zMDqAIkJBtHLTjrDeFsFuZxwKryClg2bx?=
 =?us-ascii?Q?nf77/gWdhyoEpfNg4PSX0VQnBqJ2/+q6Uj6rQLEnb/HQfAj0lc8mrp5SQ7+u?=
 =?us-ascii?Q?RuaKy4TbStO5AAt9JZn6Sa3VUYZAPuRYGlyab4hW4/XFTw1Q0neHlckBnaxT?=
 =?us-ascii?Q?TSt0WcsuFAit+bUI3M1nS7zpfJrsqWfC6P+Qj1w1s2xLHt8ieFs95w1wOsu8?=
 =?us-ascii?Q?TEp0FzL+7Gv6OA/mogsA4e8sXKBU2GoRZrFto3drCZ58YLQq40RDSxsFv/Tr?=
 =?us-ascii?Q?fiGJeOfspjHUx6ZAYLOHf5375jJx7654/Xgn8H80LZQDf1n+tzNLTUUAv2GJ?=
 =?us-ascii?Q?kmUc8iiKublosErUoC5xcwY4TFQazks54i7JBhSA1YqnowaowUuFpUctPty4?=
 =?us-ascii?Q?4QxVkMH3sJszAPaHjSRaiD59Xyfn3JE/Q50aI21GBUjPVrocI51B3GZfwfOH?=
 =?us-ascii?Q?m5s3t7zCW77iZYRqBT+fyM+fuBbcoxZ0s+HTedfQK0vy1z/o2Zf0scYrVzHb?=
 =?us-ascii?Q?CEmGeNGyhX7QHuedMir5NReEuirVmccGRC0BuWWkoWhw3MZ+Iw8xxLOpgyqs?=
 =?us-ascii?Q?mt0sVB8RqW0ngJSAZQoGw8VNveDu8CG9bGHlTG08E3+1unUuuT0sh1P28nOz?=
 =?us-ascii?Q?Qd/XU2kKLoMunY33dB9Z/p+Mg3AZjQMS0aU8LzUJtwWzIq/3030uC26/fXZv?=
 =?us-ascii?Q?1Z3e3XSbzQYUHyL8Mf/cut1HjRwJvWidRZOWO3nHOA6n/ubsdN0Ak70jcO/J?=
 =?us-ascii?Q?nSzRbQ6BetIQ1qqf+dPg7rsGXTdGyoE63cPlFZmWFOpucxYgUDBtqVRaJoSB?=
 =?us-ascii?Q?kidx9YcnfI0r1aQE0L1JWL1GVRSJPIfiLH8big/rp4a3Wr3bPOz+phSP3zcD?=
 =?us-ascii?Q?MrD1EmhTeD4+5eHd2e4dSkNEAZg2f6BFcqfPw5QxPNht5X94mQKyHyQpnJyD?=
 =?us-ascii?Q?6yDsaENCG37BxWOjg0WVE4oNZ8Vr9r7odSKvJMhkSEqEWmQJ1PvczExOyWiD?=
 =?us-ascii?Q?sAhOzDDHp9Z60vdkNs2zUFDBpi4FZatOolY1Jf2MHRk6jRr65IFcMdx8zoF3?=
 =?us-ascii?Q?m7QGlifcqrDHlLdhFdvxd+LiyGh0mvChYKykVR+4Mze4mbo6ckgc?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d9f161-afad-40ca-3f3e-08de911d9e41
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:09:12.9757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kyLw5giCS7vZYOVvv6itaLkHISeJDiwMEoZ4Wh9Lo8NXaIDPJBTzC00qU9/7vnLOj7Le0Y2gvV5w0EOjZIwbU9HLzf27ZwMF8anGYWYmjlb2enTw5pTYsZwKRzWE5Ml
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10798
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
	TAGGED_FROM(0.00)[bounces-30808-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40C6E38FDC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

Thank you for your patch

> Add support for the SSIU found on the Renesas RZ/G3E SoC, which
> provides a different BUSIF layout compared to earlier generations:
> 
>  - SSI0-SSI4: 4 BUSIF instances each (BUSIF0-3)
>  - SSI5-SSI8: 1 BUSIF instance each (BUSIF0 only)
>  - SSI9: 4 BUSIF instances (BUSIF0-3)
>  - Total: 28 BUSIFs
> 
> RZ/G3E also differs from Gen2/Gen3 implementations in that only two
> pairs of BUSIF error-status registers are available instead of four,
> and the SSI always operates in BUSIF mode with no PIO fallback.
> 
> Rather than scattering SoC-specific checks across functional code,
> introduce an extra capability flags in the match data:
> 
>  - RSND_SSIU_BUSIF_STATUS_COUNT_2: only two BUSIF error-status
>    register pairs are present. Used in rsnd_ssiu_busif_err_irq_ctrl()
>    and rsnd_ssiu_busif_err_status_clear() to limit register iteration.
> 
> Future SoCs sharing these constraints can set the flags without
> requiring code changes.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> @@ -72,7 +73,7 @@ static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
>  		return;
>  	}
>  
> -	for (i = 0; i < 4; i++) {
> +	for (unsigned int i = 0; i < priv->ssiu_busif_count; i++) {
>  		enum rsnd_reg reg = SSI_SYS_INT_ENABLE((i * 2) + offset);
>  		u32 val = 0xf << (shift * 4);
>  		u32 sys_int_enable = rsnd_mod_read(mod, reg);
(snip)
> @@ -109,7 +110,7 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
>  		goto out;
>  	}
>  
> -	for (i = 0; i < 4; i++) {
> +	for (unsigned int i = 0; i < priv->ssiu_busif_count; i++) {
>  		u32 reg = SSI_SYS_STATUS(i * 2) + offset;
>  		u32 status = rsnd_mod_read(mod, reg);
>  		u32 val = 0xf << (shift * 4);

ssiu_busif_count is for SSIU specific, no need to have it on priv.
Please move it on rsnd_ssiu.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

