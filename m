Return-Path: <linux-renesas-soc+bounces-30381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K4gKmprxWl1+AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:22:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A36C339181
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D741A300A389
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 17:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5E9349B0F;
	Thu, 26 Mar 2026 17:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="B1sfRVW+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF8C2ED843;
	Thu, 26 Mar 2026 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545684; cv=fail; b=j+M018PuVHoskVXlIxjnfw+OGaEw2GGHptcWgQJJRzPLwFyLd0ODpjst+I4TMyYoMGjusNGybzlz+XEi9bex8Kw2NndEAHWjmVGN66K5VjR4GDGJagK55GZaLtUeVMcV1OrYUVBKdbCCAyworpdeMLpdt2zDSS14SFy4Fc8dfHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545684; c=relaxed/simple;
	bh=+kcuMiXaRvHYxyTAoCSsttB7oUomyJGhepKpPODBAWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MfxzPEIANA7obMUwervhRWNOak1QRgCsD7x9wv9MFPnjd88636T+7a+xFG2K9FhBQh0JNjiemXmcKWdei/csrK/m10FAYMJQlKGk41u5dVspBGI9mW5Jqpd4NYEctTJ9+jGqbIODCJXxYs8j9+6zalHxIBc1a9ajjVx/dcM0bZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=B1sfRVW+; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHWyPMtcrto/c+5P5HLXGUtA4p60Vp38rCmxNiarShDIMJEGvAJKEp+g3aubbao3lzNmkd+YilxQl74WO2Tyvr23M5YslD2tTRT0/Sf20M9wLalmQEd9ZJNRYQWmle3JE+L8FIksHZDP7MnpfrcozE4LVoksBw0+k/1/kBWFMBVB89t/qkJYYGrleBm5k7uvvcCv4dSlohCxLrjf5/60NdX9hvQuWtIj7GQekq2eaGcpGcG1FRwmlW53bRsw+i4Ki8xdAq/DkgHsk2UQjYgkwGVxvYgtYXkgQwfKUyVODA0uUUvZeXcFWBDwdrPjd7rlmh6AR5sbAY5X4FUTkEiPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEG0oF8P5vm/y7ArNyQdhW+6yPZDlIRo0JPmX7cmXH4=;
 b=DOOSLU/HkAHzYusFXKQyaITURkmW6pTvB1S0crRAt2ysHfZZyL03h4FouS22vvaqu3cU5wpO830DJF7gOycPTwoDzZPlxdZBMnnSKmgBG/AY7m/ZJ/EQOnsGnENg6Ob4twTPq4lJksLi/7juOTM8XW+9BY6UOFtT+xm7uDHgmCBvpKKxwHpASnuEODGENf7yhqsGqaUK/MjpXYkqHNoghZbFiWmRTRl4qO3HAAzCoPj7lirhIQhE3P4Bh+ZvFt9m/UMP+3McgRTbc/h6fr0QzYJizBFGe9C8PyufuRvhg8UXV5VNosBlqEuxdX1O3BlruymBFKixZXLQXc8vhv4MSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEG0oF8P5vm/y7ArNyQdhW+6yPZDlIRo0JPmX7cmXH4=;
 b=B1sfRVW+WOIAD0of5QVZzAe475zzENJ+nXbBSgs1n+VGLH9i86Et8i8cKVdPVFJt/vdPTfDe1kWZ/BZDUl2Hee7wklEvRSkbJ67yigXRK7+awTgSKePIAAy+Ho9Go11e6Yo3FUfR9fzj8XRPmpMwlTZmbsLQQhD4QtK2eEMjfcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB14964.jpnprd01.prod.outlook.com (2603:1096:604:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 17:21:19 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 17:21:13 +0000
Date: Thu, 26 Mar 2026 18:20:56 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: tomm.merciai@gmail.com, peda@axentia.se,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>, Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/5] mux: Add driver for Renesas RZ/V2H USB VBENCTL
 VBUS_SEL mux
Message-ID: <acVq3skGavh_yytv@tom-desktop>
References: <cover.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
 <67a38e592551e1a8ac4f9810fd4cdbab729169db.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
 <eae7dbabeca13c023dd253fe7c1c1d588c585d94.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eae7dbabeca13c023dd253fe7c1c1d588c585d94.camel@pengutronix.de>
X-ClientProxiedBy: FR0P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB14964:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db98225-6472-4962-73b8-08de8b5c1470
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4cZaQaivlMd6FH0vpghQL9FSmQS4FRGKWPE+vHqR7nhU00sXBcJ7v00ztyOSaCgExHWkhN9mGrQjq+gjbff2hl0IwU2hTE4ZdBXQT4Gb3MAgL5vbN6m9AscaUyOQtSalXKAUKjlqjI6nCKY7jsARQy1+V98ER5YXT5Av5ncR5H0BJsALPrYNi/vrVfE7+HShGXfzh7fDbwGREB85MRLGQouJL142OJoY2Nop+psOHSExhIe+45JG85EkMzOVuEZpyK1gAMF656BBceDP3AGpXkP7UqRkQs4UeCf/PD33uYXlYo58yq+EdzKWIG6Zs1qoAKfj6hmhYSBilie29vg6VxWj4KYwFnd/bhgnJm2wEmV59lleUgP14ZP1FakH7jXqHLdhGucBcaYv4XJMWKZIiqFdlQpm32lJWld8IuCoTd30MiY06TBL3VPJGy63mBnwONAeAuZxPFWkNpqVFis/cLw/78tCvemQ5lp3KYdlKGIUFVaUbcVqieJIvhc4yvIjIrib0sAaUGME0VLJW7c+7Aglkh92pMuofnkOa6HJKP/ahyBZrsEAm3kDBvz+Xf/Jae9xyLaK77VgqL4HI/MTTtP5jDle+XuCkuAOXhRMcYsZRIEXsRdkg7xuDbzaAG70rwVByPFHI5yfOtEuqyPkT9ewXk3a0eYCqRuHqWkPfMcdYWeVGY6BEnJ8dLCmKp8Jq9ehjeXVPL4rRujdklMhaDdWl6Ov5IRWDeO9O341suSC0e5eOInCsFQu8BomVw8UljCMI8TADpCUUzwi1rZJQaR9dMF3cTN/pPFm+e7SZdg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QPzUQ29ewAwMYXEkocerIjLR80sw5Are9lwu0K1zJLGZUY1Nrh1q5mz01r9d?=
 =?us-ascii?Q?05fzBpGy5kAlKLzJvZ9jmhV68ZSxlz4p0FQW1IjdObhABo2vL2OR0M8WKYJp?=
 =?us-ascii?Q?abXycKsnv7v/gG5S5ykTWlF6Ov4sLkFVdhO+icIcc64wLNI+Y93r4F2u0o8v?=
 =?us-ascii?Q?co1vJraMYzEp8wV2Jxm5WZmSeWCEDhdw1yyakQ9P3yTNU9ARU7tSalBXadYh?=
 =?us-ascii?Q?vHWjDK7IoeUEpDU6xo9QPjJWzy8t8jwD4yuhfOvkCP4O85z5TBp5KmGgEYaE?=
 =?us-ascii?Q?pFXflZffw99dq8NKMm/Onfm4C3XBo318HaoBO1CVcmrNTDEYawGSdR4WN50D?=
 =?us-ascii?Q?EKaeqHzLsLVFoTwB1j4KlgA2kjp7Pvc+sUjJaK/nM93lw1w6Km4ms9hlDpcw?=
 =?us-ascii?Q?ZQhJSmf+CpfyInxJIR7jecM98il+RqOE3XuGYs2+5zvP+2SNqdQ/WVUFoLU1?=
 =?us-ascii?Q?pCVK6b6A3ySLa//Sa8JfCgx86rv0D2+tcywecr9ZS+t70uCTDkrUm1yYoj9q?=
 =?us-ascii?Q?ADmr16aCyuzQ/EkonToJHobAjMu6yQgj/xzWgl/X+rKIa3Zs3hNLQFyqvnS8?=
 =?us-ascii?Q?SQTA+Ora1Cbx1Ufhjiq83RH/fubaETCzhx9lc8PnGHu06CEuiJUcIBgEMr/B?=
 =?us-ascii?Q?a+2I898C+lRpMaHMHAutNfhor8g8z8QYd0TUtml2ZXm+elLweve/4RcdRVnA?=
 =?us-ascii?Q?aMpEY4FB1PqPgLZKig12VRimiZgmpW0SHpyaUU8pvBoOAzjSg5nJOFO2Ani0?=
 =?us-ascii?Q?GE5SdmWyUGwV689xFEw6+60+6J/KfwRFhcKAEeqMWQmyXQ6v0Er4qKWnAzsK?=
 =?us-ascii?Q?DJVx2jLUru65mugOW7Y3rWkmwMbDA9umq8z+HSAh8+hPw0PzBuznFqKi1Bp1?=
 =?us-ascii?Q?/A5Q1bzLECWiHs3mfMb40jwpRIUZxDr4YyB9YxEELJRdQ9efQsASN+++xK4i?=
 =?us-ascii?Q?B2t+/MUGRDQZvT6nhi9yrtXuVtA0lkL1GfXyIfYapsrS89yGdCm81Wf4ZkMA?=
 =?us-ascii?Q?vhlqvf/1j578rAfJ9iDOg8CDvM6rwvU1GWx0lTXGTe0t1P8PXPftCfpmV2uJ?=
 =?us-ascii?Q?t2CXXx6b5tdgpHjuutUaICZqFY3DuPTdA6rOOCZkBdTGP13D3dXr92jeYLQl?=
 =?us-ascii?Q?LZp9z9RsfCowvPDNgaVH7874M1fuzdu6MwV1E7Cr3L55W4DHCyuSHGMc9MZp?=
 =?us-ascii?Q?XwWCnwJ98xw2BNn4KOkjVAKzokLAB/VMgJMiWaYA7Umei4RGFitRw4kIKp4V?=
 =?us-ascii?Q?WhGkdNnjYw+22RmJMWYEXYGuc7SkuUYZolVEKaIkwgfNbeztFguRjc8r7irU?=
 =?us-ascii?Q?79oQZL0zQ5/vTl8ZmQsJRr2Rg1mMLHpcR+g4AryiHBS7IaPSQVDw0lrcdpLw?=
 =?us-ascii?Q?FMuyki2hrSJofNZKb4PApsvd1rqGA5XLc7N7kG9y+eMi4veuUTQRJ1HxjQvH?=
 =?us-ascii?Q?O3YnOgKK6aD8qOEBHi8y6zWz4EDwsyEjJlSPGixOa+JUoUundHaMu+05MJYF?=
 =?us-ascii?Q?3k4nZ4nEhewLoKsxZOMbiJbHlWHKWwMsf3ti9e1cEclH6JtCEECjxHz1YHe+?=
 =?us-ascii?Q?8yLVC3CtPkOOnWZDtFLsJLNdqc5MNpWIXJK0Y9rVOut76v9tCCjqmi/cwC+j?=
 =?us-ascii?Q?ugnL7a4m97nYrax+2aV0IWgHYa/nnDQ5ZssxovZMSKREIr2WTDP6rIXMklln?=
 =?us-ascii?Q?nv+oovAVT2XR0a5Bs2e9GEjCEzx70t/3FPsgKWaoQaN+iaI8HOUrmI+xUILe?=
 =?us-ascii?Q?COllQS3ZFGBl6TOt9FWPggtSbhd3VAjTJjdVFOPtRsvY043rP+yJ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db98225-6472-4962-73b8-08de8b5c1470
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 17:21:13.4775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6g29DUh15g06yekdg37jRJdppYfn2HdaJ8RMTZ4wemQ9MZlZjuomxRfXVKHOHtEEtT4SD3iW4aCxsFoaL/yZ5lsfwEIb7+6/LS0kpeaFS6kyxRu+xFx3BrmP6BbHwoXK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14964
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30381-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,linaro.org,linuxfoundation.org,solid-run.com,arndb.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,pengutronix.de:email]
X-Rspamd-Queue-Id: 9A36C339181
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Philipp,
Thanks for your review!

On Thu, Mar 12, 2026 at 04:23:28PM +0100, Philipp Zabel wrote:
> On Do, 2026-03-12 at 15:50 +0100, Tommaso Merciai wrote:
> > As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
> > bit of the VBENCTL Control Register. This register is mapped in the
> > reset framework. The reset driver expose this register as mux-controller
> > and instantiates this driver. The consumer will use the mux API to
> > control the VBUS_SEL bit.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Converting the reset driver to regmap and passing the regmap via
> dev_get_regmap() would allow to get rid of the dependency between
> patches 1 and 5.

Thanks for the hint.
I will switch to regmap API in v9.

Kind Regards,
Tommaso

> 
> regards
> Philipp

