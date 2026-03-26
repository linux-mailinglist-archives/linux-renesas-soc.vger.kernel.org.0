Return-Path: <linux-renesas-soc+bounces-30382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACvGBHdtxWl1+AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:31:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8393392A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61831300D0F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 17:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70641377ECF;
	Thu, 26 Mar 2026 17:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VhRIs3t4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7B32ABCA;
	Thu, 26 Mar 2026 17:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545787; cv=fail; b=W21x/KXjRvzeSY5DUN3+V/gUr2W4i/bZjkZtzL344XNaYHfNzpAZqlUWnxRlmGRpkpuZwt71mK1xo+RRFMej651NF/7UmojWX5j0bjMzrgZN4JTEmk54BDiZO2zXok2e3IYCiYix6yIJ29Kqa0TUxE1vQ+LEEn1WfDa1xNwFD8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545787; c=relaxed/simple;
	bh=OXIRk+VAnUDtinRdsyrxGyObsSavw658MqOCcHiOerg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fe1XLf9NS9qTa/X20j2zfizPaiRfyW7VnQ8VZ+5kjBNnHSuGP0UmS4SunU9wyy5YurUT1EKl/suMUtpLL635I1qA0eMe+KJaqG9dbz4NW1mGFoEepgDiuLD7VHlTcu6FN8kIWadn8L4MiChWcj9p093YZaW1T8XE5taU6cJl7TQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VhRIs3t4; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyXJPJ9e30i6bYGVwSUrdKnmZwpaaLN7z46WkzbepI8AJKgmKHk1Kihi/D3jdiPnKvI6LClHSEyy9tM/9tMapjn5DNxSWl0gADl8WZJ52qi8abNsJ/xq5HPHi6ZQXwCUHgPSDRaqY8VuO2OIQ/p4n5WmLqdhYY5wmbsyZJUjkdRxagllBtLpU77O3mJjsYG0O0rSDiBdeY4siwKu1+Y4UVoYDOOOSh9Jy7Vw+N6yvdVBUpBXa31cDJr3/+RdyvTdAuCwfpdGFjs1UUf9eNPySnr/v6fSJXS6bm4+l7LjhxHQd3Iu+aV7k4aTi0Bk/FLS7oz/m9R0cAjXWesZP2PT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQh5OmcEa/p2aBONn5Qy5XRksrg3ro4UzHaUWKX9stE=;
 b=md41HoaUaabBScKyvk5pRUqHupG3k83JH9lP6re5yE9V1NAyhKNrhietRP7+GfIfKX2SWyP4aBsYJ1rITZL3SHtM4EQS1BcH/wTbQo03VzX90N+pGzL7PlNoTs1bynfw65dLiikNV05g5QNxbNmeWz6lSpnCQvDfR3WmTjQhzc2TeSyILPvHLNQxZoX+75tCg2o5rj1+R3hKtMOh/GyaiBZs52QTc6+K+YhWVSl9+WPczIxHY+GamBsT5/cqE9gkOM23jtpWghHt7i/c0lEns91NH3qjl4+/co47jqttE5pIqmA8E5EFn7KKTQXf/tfrsIIccyguPustpDUul/EhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQh5OmcEa/p2aBONn5Qy5XRksrg3ro4UzHaUWKX9stE=;
 b=VhRIs3t41yNM9p+4fP75QmMSplHYgDtnOa1rEONgXDmoblX5/m9AXbecJ++n/N70KvJLyUo1PnMBmOHXy7lwDX6XHYBaw/HHDyileRDuMMt+AucXOgqTrtXhE+nCSzUWfG4M6DJNyj9kGMRXCm1K0r+Lrn36KM1+awDrgX5TtS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB14964.jpnprd01.prod.outlook.com (2603:1096:604:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 17:23:03 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 17:23:03 +0000
Date: Thu, 26 Mar 2026 18:22:50 +0100
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v8 4/5] reset: rzv2h-usb2phy: Keep PHY clock enabled for
 entire device lifetime
Message-ID: <acVralT-c-IkIbSI@tom-desktop>
References: <cover.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
 <6584aed8dc4fddb28c2184c83b92b4f3b419bc31.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
 <37f389274e5c0e33c0e8fad8ffed0237b0127b07.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37f389274e5c0e33c0e8fad8ffed0237b0127b07.camel@pengutronix.de>
X-ClientProxiedBy: MR1P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB14964:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ab3f3f-2fa6-4dfe-d8bf-08de8b5c5635
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qiLwRxqKBvlIBqUKKsPV/LwkBeKjlFrfEMsQ+XDxcISkhJ0DEAj9WARDcUqPCRVr9iAJmyWMXCX13zBMR0jDA5R6HDX/1kdzlFpAdGREw1i2TVlSHWyzyy0NN4Y7G4DiUNMoNUhCw6Twp1RWQomCM0scJcrMbc8KZdtY7zEeCZlMk4lWEnUT4skS7aWW8q+se77nl29CoX/ceykusarS0OgBBQgQ8CVZWy0vv3gpLn5/ayDgVymn+GdpR4ndEF4Vw/xWvurabXbggXMaPVGCuWIPF7CcyVf4IiReA3HJwZKL8+XHRhV4rTZRlnXz5knuLqxMnMNPz1ERthSQwXG86INUEwqgaMFAhNO2PNRMcNXnRV6bpa6l4to0kMbhBIp6UDRIX07ArPom18dygZvTEMyAu0SeXdcuIUah0vqK06/8Y4jJLhcdetfUL81Hy9oZNMz6Jwp/EiG7KOe+pHRjf+744QWPIWLRyPjDyKvrDicONr1bAnyLWL1Z+e0DAV9YSGjOBh1wzJNtUHqeRw9xo4QeRNCtJJadkn2NGR2oWjYj4zWyAWVykWB/j5s2dgEGtr6OO3EIexV40IoNKsUpM9yuAMY2F50/cmjBerJ9rbRvuFIDp72d2FS2jwVcFLQnVvrIw7k+TO6Ds0ptYWZSk2dQv7V3CJq0C/dSWiybkqgXD7EyHx1PxbxME0JXGDPFFDDlkJH8Ig9AUFEjuyYmByoRab4ZSX+FG1EirdhqE6G/mpVTmnq4VOs8c3inXfvnu88sCdEMs4aQHHtRAZObxQBjtmMjIX6A87cpiMRL574=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?km0j2ycTcLO/AfnUbKtM8cuUyhTejyKZ5HkWPtO14ZJzgsdSONbjVQYN3UN1?=
 =?us-ascii?Q?sZ5ljkeGESBsWNazag75d4GNQUKT/PrwIRSPk6c0qumnp1vhb9KyoAqJZOOq?=
 =?us-ascii?Q?M+39hu/cxk8szubri92TWmzU3nYQBzAUZXGfiLeFLWW7AYIr09N9t6viqFVu?=
 =?us-ascii?Q?99okAniz1wFeD26qnuIDNEYvfeSuxrvhcbg39FL82vEDmaXZupnJRWktqbHf?=
 =?us-ascii?Q?Dc0cmj8ane/C7n6KAuxdQyAZN0AKei01P0v8LvDm4tF3N/y84gYgTev0q2Si?=
 =?us-ascii?Q?keF8ltSlr7Q+42Q+NEFda4tOfVNNl1pT63s6gCo41fv0yGNm9BF8LGy74vJA?=
 =?us-ascii?Q?AdJICRzDEcu6/tE2kXHzwj1/+6pLu/fN8RYgAJUq27ERUfSN7cA+0+QfOJtC?=
 =?us-ascii?Q?ORdw9TjZL+8MnNsHrU6V4hB6FXjTe5SwVvUrvGH00NIKwP5R3aWAAHOfC5/B?=
 =?us-ascii?Q?YBibsqB73nMsYEF704C0CVb23PXs3LkqW6gVycGI0EGPc5Tojddm1CQJjJ64?=
 =?us-ascii?Q?cXRM8i8UMWtfnXwxu206O24LThrF2HoZo4VPP5IIFpYPXqXjywWdF4Wgw6CK?=
 =?us-ascii?Q?yxx2s4Olf5OmwWBsxqLMSFQurev3oX5yzFYTzXYPrllXvkph94Z+AMs7qMe1?=
 =?us-ascii?Q?VOT7UMD24v4CemeBg4WAMM2eGGcWS8sDfq0Ayes1K2fEeWT2VoFOUrTZqqbw?=
 =?us-ascii?Q?F3T8NHNqcgbu4w3Ui5rMFdRRTSbBvvheXggOA5pl5cOHZEqv9k4EU3ZsdY9f?=
 =?us-ascii?Q?eo6Db8GDFLXtfhrepgHtuCvx8tdFhYGHrLGxO6tPwB9ydW3w1X4zXdzxcx19?=
 =?us-ascii?Q?Mn1gybwh4rg7QjUomI1ZDazGChhbzlYes2SDWo3zAQOyUZCkgO8mS9uQ17mG?=
 =?us-ascii?Q?YsgNdStrsyUBDvcfjbxHwXdyZ8+sG69/bA20rNclTfnSj0SqEdtYe2o4mgYZ?=
 =?us-ascii?Q?dEJepxwsrY069+RpuCoqw1JoocBzJv40XXEGMpPM5bJFxJVy80X3f/J1eU0/?=
 =?us-ascii?Q?HgbzPZet/ZQKksOYqfIedqaDYd5t4VEFZyGeLFb5rJd3xTWnlKyPgVGZ3KGB?=
 =?us-ascii?Q?dypf11v1t0bleR9pzvV0P1G3Z0Kiy5uoIQfg3UptftODKK5uow+NsmJF71cl?=
 =?us-ascii?Q?o9+SMuhUIJJkYxZG5q375SOPzhkdAeMlz6VZKV4AJHE9cF9plHuvpKarnu/z?=
 =?us-ascii?Q?Crbo47woPxfStLzj4uvwXPYY5hpJ8B7CW4b341lQG0HKCmJwdHNqHB07U6jB?=
 =?us-ascii?Q?U8pAysTPFRZ92ppLOAxL7lyjNgJnFAVBwmEUnAZ5DBwq2qVEtPT+3dA3Zl6z?=
 =?us-ascii?Q?gjDe9Ot/XYXwHMVjxGjmuoZjUJg43EnufqXNdlD6ypIkl5+JStS1fY2Fl9Qe?=
 =?us-ascii?Q?m3/9ydi2xcFNd9XbeK54Okg6UKgka6BMi9hf/3RM8Wl+IhY/KpdbcyjJbJSA?=
 =?us-ascii?Q?cWSXYiLOcz50beBrjn/1SsYP1y/Lqnc1h2vraq9fFC5xn20pGLtXe2kCTKXk?=
 =?us-ascii?Q?i/lyULWcpbkK6fZq7oaNQnD8luBnz1nuCWm2etjO3fZMc8mQoXfpwMa8bfwH?=
 =?us-ascii?Q?Ka5ONz6gr0WpElyLYhjJIeAAU2o2Q45hP+bSJiE2g2biDoAJBmI+MBNwQaK0?=
 =?us-ascii?Q?QJG1ITzR9Ol2qZEZ08NwB+cJ3Yy7Tc9uctoDWk90hN6V2OITGANR8zQJBFTb?=
 =?us-ascii?Q?iTgBlq+cVlbroTmRDPbJjj+F+AC4cANcsmPFGNdHtkXY5H8ty2kGk1fn29tI?=
 =?us-ascii?Q?X9dPTFIhYOmFBV0hD8o0eEBWveDDOKxqHjOmhH4CRTNB8yl5LFpa?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ab3f3f-2fa6-4dfe-d8bf-08de8b5c5635
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 17:23:03.6323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsjUPBaGl3ucZebgvXl72q9XUjrx/TDneX2o/unjjnhFbi+oZMkrEU82YvFlnM4IHWV8EFbfITmqbh6BolCxBIO3yV4PoJOTwgb3wQf2JPB2OqbJWGQec4kpR4c3KIrF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14964
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30382-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,linaro.org,linuxfoundation.org,solid-run.com,arndb.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim,pengutronix.de:email]
X-Rspamd-Queue-Id: 0A8393392A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Philipp,
Thanks for your review.

On Thu, Mar 12, 2026 at 04:24:28PM +0100, Philipp Zabel wrote:
> On Do, 2026-03-12 at 15:50 +0100, Tommaso Merciai wrote:
> > The driver was disabling the USB2 PHY clock immediately after register
> > initialization in probe() and after each reset operation. This left the
> > PHY unclocked even though it must remain active for USB functionality.
> > 
> > The behavior appeared to work only when another driver
> > (e.g., USB controller) had already enabled the clock, making operation
> > unreliable and hardware-dependent. In configurations where this driver
> > is the sole clock user, USB functionality would fail.
> > 
> > Fix this by:
> > - Enabling the clock once in probe() via pm_runtime_resume_and_get()
> > - Removing all pm_runtime_put() calls from assert/deassert/status
> > - Registering a devm cleanup action to release the clock at removal
> > - Removed rzv2h_usbphy_assert_helper() and its call in
> >   rzv2h_usb2phy_reset_probe()
> > 
> > This ensures the PHY clock remains enabled for the entire device lifetime,
> > preventing instability and aligning with hardware requirements.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: e3911d7f865b ("reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)")
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Given the Cc: stable tag I assume I can apply this first, independently
> of the other patches?

Yes, Thanks for asking.

Kind Regards,
Tommaso

> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> regards
> Philipp

