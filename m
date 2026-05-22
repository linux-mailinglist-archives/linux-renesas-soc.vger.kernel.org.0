Return-Path: <linux-renesas-soc+bounces-32922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEEhHgEVEGphTQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:34:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9D5B0A20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE63D3002A3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 08:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5936D25B09E;
	Fri, 22 May 2026 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mUmG4CVn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914BE81724;
	Fri, 22 May 2026 08:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438846; cv=fail; b=USIjll5hNZW94ZwzjMHYB0HPVftCb4EZ3KHNtHK12H1XtFDQd8rTntTfVgAxkO8I/gMWPMPtfnrCTMkdmbiipgCDbrOebpVmWzPsAk/I4lND2CendbJ0Qty6EWKanZAiYSiy7C+PYavn90xlAvrRmM5PtlIlEJZfjM7h+gXoWSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438846; c=relaxed/simple;
	bh=uwOt+UHcCXUMsNBaL1C7zXdjaHO+Xa+OjVcGYFSgAaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F1myrkz1yeOo5sly/4nnx8jf5AqAeG78HQ8Ecmi3OrODRwVZ3WWopMkk5ooczugrZI8iGhEfcmrmFkYI1nKwwjZaRfAa/MOApCCMK9GUqpc5n6njqDcEJw6TfNvu51RUf0SAYNezieskjBAeZYA5cYMvMn8Wb3dO77pRPUCq6zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mUmG4CVn; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brVZDKvI1qwCIQVDzpj/Lf85GC/zukl0N5yzWAR395o+Our5vWvi3d/c5G6Ooklv3uIQS0QkQazctk3XYvbC3jurTxMf9Rs9AenskQr+krp6R1ZJObzRBvVyjjAXqqoomEZ9mrsgKMTQKFJc43NThCL/Nl/TQfhNz2BbkAAOHdpjA5Wk3Z5Qb1DN3+d/zD3e3AzP+7j2anWKjsv6dkJuxsxHW3fzW4Oxz5PJelsh5Zf7kWcdNurroKLtVxroa4fexbI8Bdmlbl2Ka+lDR9lYcmTd1kwDSsoSfrJ9gGgWmL/WIXxnIUUQse+rGuOlBt0pyKUP7RznMw65PSiAG0hu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zh8QQStWq3MQ3Zo6o5BM14CJESs8D2kSnT3PfgMHs2I=;
 b=IEILwGIpva7W57qZJA6UpD+QHOw40BpK8h3vnEqattIaV7Tyz+4qLEHOAWJCBE7C7/q627Hu5/AOk3N0jNgVQ0Lk7TojvCzpVdQXxTuOFr+c8S8wYWTg2CZvKOAu9Vr319ORnrEm+QpCQsbFhvQEI/Wo+Zd07BVkKnnmtsBu8ynyIQVJeZLkYjfBFt/geMkje+T/YGykd4kvSG0T8gwxU1/WiUAdBmhzkTfyUTpz0OQB0d9JDbpeHM3i2PQdyZWEyA/QfbrZBqyv6TgBucmvW/TFDUU+05y6wS+KvopJ4OvnUp8vvu0ukY56PVBItpkv3YYhRMZUIk07j0/1XsVHFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zh8QQStWq3MQ3Zo6o5BM14CJESs8D2kSnT3PfgMHs2I=;
 b=mUmG4CVnBkSfJexBpdRjuxb8i71SfpjLzaNNlnWHOCThLEwRky1nEmS0e5BcaPGSzo2DKwEoixJZ0eGSkO/KpMxDQ8WnPv7X+zDn6WoYEGMn2feRHwMxnkim8+8Se2REbDx6hgXv3oVUMiwbRMzaVV9RjNRVdPKZ5cv+3rrG30Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB8682.jpnprd01.prod.outlook.com (2603:1096:604:151::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 08:34:01 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 08:33:53 +0000
Date: Fri, 22 May 2026 10:33:35 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, peda@axentia.se, p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Ulf Hansson <ulfh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Josua Mayer <josua@solid-run.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/1] mux: Add driver for Renesas RZ/V2H USB VBENCTL
 VBUS_SEL mux
Message-ID: <ahAU3ycGvZbhR3yM@tom-desktop>
References: <cover.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
 <582eb5408684786577e5fa85b80f585c8739be15.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
 <afxe8Ki_4fpcahFc@tom-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afxe8Ki_4fpcahFc@tom-desktop>
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 55aea28c-339a-47d5-2a26-08deb7dcdb2b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014|22082099003|56012099003|18002099003|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/hA19+JsCmXzyPUeMh1N7qgozTDlt0GSXKEEAHCV57nuJWzTERi8y5MKHyNkpFMX59yfV7ipVgIc5J59nir9/y/OSYckiDZK2lWbvRItIG1jJL2RvYgsbYN/CF1qnFqweb7CBw5LTdN94IRJAnWjLTzAp5tYfL82HtD1JPAQ/JPefHdaceZUGUYHCavWXEm7y6UN76nqCOPg6AVCyMa3ewCsNe6ARsTSjChSh35Zjuw6MNsTjy5SJnPRE8eeMJdgafVzOGPojurSLvgShaxvJR1UDIQidqX+thrzt44czEwtTxA/oE/mTDtL1fd6snu5XmUrSoOy/apU4edgSWzBSSh+25yfK+mh/aQ+G8zCB8N7yNcNr27cK46YoyR8Oe6B9TaXFeLpSUkJ5Apxymz6xOZEn6Q6mv45k0t+V6rmRTLLjKOti9UZPv5z7T+D30dQtcutW+0RBcCKSyKU2O0zWC8lDpj4x4J6/i4hDjwiR5jKgYPrg08Jg0awZmaCHXg4WZmRJHeM6DT89USIsWDEMl44z3dbjq5S+zJ1kumHcaqYXSeLY1z21uP+pWvF2ysgils9rRo9CNRHvnTyi9vkaoJ0ZqyXALXdvWMbkuhQphTQtd7jbKSv4W5+hD2qj7qulR9PDaOJjkKUAWPyNXkXLna2ZmHIRtVxZD7AT+N+qeCgBCbyrQUNE/qr1FV6AbR9ezJ6zibQgRFvOmRnQ+ff9bxT38VlBAOahTakUgpZhwuLdMnmf9kmZUzuaT8mtFsP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014)(22082099003)(56012099003)(18002099003)(6133799003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mFr9YIPLJ0n5XbOlYV8uh6gIVvA4KCUDRrgA4wAntjEkXXAu6HSuMHrT9RTL?=
 =?us-ascii?Q?wz9dtTcy+C69hDWozqbUjy1bkecuLItUbDuMDfVQ8Ll1ANM4NKWUZFj51iXY?=
 =?us-ascii?Q?WjWJWqdX7K6qUUyb2gn/wwEI0nVop/QVUmsSWExbLgLwYLMADMiPKz/Z6NQD?=
 =?us-ascii?Q?QZsOclmlGYeMHtxS5VpS4DF0hNclh9ZgZX7fNZoCGbl2NHNE0qPANSLPJNI9?=
 =?us-ascii?Q?eEa2h9nu9w85cQ6SAtc6CRn8kvQ/8Yrqs22pl8BSfpEgbBIWzUe5VapYzktw?=
 =?us-ascii?Q?7rQpQvaVLNtBR45r903+Kx+i/nlGq4qEo5kq2xDKw5UTNy1LWSzEwh8OroU1?=
 =?us-ascii?Q?1QIzbStWqCBtF2/GXfTcLQwYlGu7gPhfkE79cSElhFYcSJIzVtLW3vJaUqr+?=
 =?us-ascii?Q?HTbJ1zBZIL3lU2Mw2qER0XhP6h7tiiEDH77F6D6dxz0zavwd0+MdYlEMiu8a?=
 =?us-ascii?Q?MgvHr6SJWWSNSp/mQnGYp2uYfJkCYO7gdMkr+5bZ+ydLiFueaWEd+K+vv6fW?=
 =?us-ascii?Q?NJteauqPLPWc3V1exojWjtO7OHjH0s34ka03fLrOYH9JvwWtLcACWqru/Xv8?=
 =?us-ascii?Q?XtGlyxcnesdaBkot8up7tCLHcGT3GwZP9975wf2TZVNt9vYXjujDsDRvbrF0?=
 =?us-ascii?Q?nU2QoAcpm3z3JUyIZ7jsuGKRGAuRwcYKzCR5SJuWUBSy/NOjUCtX2a3wCKol?=
 =?us-ascii?Q?eR8VXA6SuWr0QeA1lak/DoAHsSP+K1QDXocO8HzxbDlw59nWVlYhDRsA+15A?=
 =?us-ascii?Q?iwmzxeBtb92zFzS+Rs9dG0MfwXjuJ90o9xVmAKgh7eQEdMhJgt+4ljttQ9ll?=
 =?us-ascii?Q?RyXfLzWOX7d0j3l/QXyQXlK1ilg2WUHYFWaLJFHWZRV7UE9EOzoMY199D5jL?=
 =?us-ascii?Q?2xS/jSAyT3ezn/Ie0DC1UHFKPwbsKyQfvmNGfEWpdoaQQBq8VenaNfXMVdGX?=
 =?us-ascii?Q?vC5YEdAgf62cncRc6fL1/7LVt/Y3mHzDb/GDwQ8vjVBjqhGC1q86UGPdKshF?=
 =?us-ascii?Q?UuHbI+xKmmpCTsNH/eYNZyHkD5AzOvwlbukLbG3lKaGND8wVRxJrpuqSMHI2?=
 =?us-ascii?Q?gmCG7DkMpQrgeOHzMDdLyrbyEZxcDdN3Isdbpn4jyx/hQtCYPmTAQEpfuiIC?=
 =?us-ascii?Q?94L/OMYaU/QRsksVgf5K572vXvhoRywF4koezpGJ13eN0wDFlGFva8togREW?=
 =?us-ascii?Q?vAkuFWiJpf9qGHLtf2TP7aBa04ONsY74+V7QBPQag/nsdJJKYo2DMEvrJYAz?=
 =?us-ascii?Q?ZIrA2gnlLXtjgLHOacUIvmpVCrMGXy2k0XcSSrT7ak215vNKwaaH7jeoyGbu?=
 =?us-ascii?Q?ucZvC50q97nyNwBwYPBbQ9taJalAkFkE7Q6t+Eb7sYLQslNBtGRVhuZUKVoQ?=
 =?us-ascii?Q?/XePDhqbcCjg19cyxF1ZSruagoLgtTlG8s06UsVWE1Pa7B6ZLOMfS0SiEQYG?=
 =?us-ascii?Q?f9BFczj5y3gn1Oky7+WDRx4+3lkhBCw+nG7p7FHx13YyP2IkWk7FZe4sJ77c?=
 =?us-ascii?Q?Ch0gIHxyQWNCIq8JYx/7cmWWvwC16QXEZP+XuRqc91zkwRLM7H52CvduJ0Hd?=
 =?us-ascii?Q?4sqT/ZuCDoHEp34xcrY3uT7F3LLayz5w8+E3qvu33D7xT+zLZQer+xjiYIiB?=
 =?us-ascii?Q?JgP+CWwRu5ixuKmknKz1WnMdY2RdbKOt4QgClDn5Jh7yuDVvXlEtiriC4wzX?=
 =?us-ascii?Q?oWr1pOkg0euXR4iUO+4NOqP/veLCwZ2vSItQ/rPQK/28jcPL1Jkm7Vpxse9w?=
 =?us-ascii?Q?+Wo29azqokKwNcmF50hCxdOyOa8vRfaiilibVnddE1lHiiLCYiSq?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55aea28c-339a-47d5-2a26-08deb7dcdb2b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 08:33:53.5887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDPqkDpi9OhZs351HcXtKGT1Z8pjg/AZCpaG918/amzHMBaKri/ycNFU2k3BkCzy+pV55h7Y+D9V5hPMMXQEkxmZXVdlUIjEuF2LQZ78FwmCxDx9DUFzClrySgLMPWOJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8682
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32922-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:email]
X-Rspamd-Queue-Id: ADE9D5B0A20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 07, 2026 at 11:44:16AM +0200, Tommaso Merciai wrote:
> Hi All,
> 
> On Mon, Apr 27, 2026 at 03:03:37PM +0200, Tommaso Merciai wrote:
> > As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
> > bit of the VBENCTL Control Register. This register is mapped in the
> > reset framework. The reset driver expose this register as mux-controller
> > and instantiates this driver. The consumer will use the mux API to
> > control the VBUS_SEL bit.
> > 
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Gentle ping.

A polite ping on this please.

Kind Regards,
Tommaso

> 
> Kind Regards,
> Tommaso
> 
> > ---
> > v10->v11:
> >  - No changes.
> > 
> > v9->v10:
> >  - No changes.
> > 
> > v8->v9:
> >  - Fixed driver comment year (2025 -> 2026)
> >  - Switch from devm_regmap_init_mmio() to dev_get_regmap().
> >  - Drop unnecessasry include bitops.h, of.h, property.h and
> >    drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on regmap.
> >  - Collected PZabel tag.
> > 
> > v7->v8:
> >  - No changes.
> > 
> > v6->v7:
> >  - No changes.
> > 
> > v5->v6:
> >  - No changes.
> > 
> > v4->v5:
> >  - Changed file name to rzv2h-usb-vbenctl.c and Fixed
> >    Makefile, Kconfig, function names accordingly.
> >  - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
> >  - Updated commit msg.
> > 
> > v3->v4:
> >  - Removed mux_chip->dev.of_node not needed.
> > 
> > v2->v3:
> >  - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
> >    is an internal node.
> >  - Fixed auxiliary_device_id name.
> >  - Get rdev using from platform_data.
> >  - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
> >    as it is needed.
> >  - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.
> > 
> > v1->v2:
> >  - New patch
> > 
> >  drivers/mux/Kconfig             | 11 +++++
> >  drivers/mux/Makefile            |  2 +
> >  drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
> >  3 files changed, 98 insertions(+)
> >  create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
> > 
> > diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> > index 6d17dfa25dad..7f334540c189 100644
> > --- a/drivers/mux/Kconfig
> > +++ b/drivers/mux/Kconfig
> > @@ -70,6 +70,17 @@ config MUX_MMIO
> >  	  To compile the driver as a module, choose M here: the module will
> >  	  be called mux-mmio.
> >  
> > +config MUX_RZV2H_USB_VBENCTL
> > +	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
> > +	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
> > +	depends on OF
> > +	select REGMAP
> > +	select AUXILIARY_BUS
> > +	default RESET_RZV2H_USB2PHY
> > +	help
> > +	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
> > +	  RZ/V2H SoCs.
> > +
> >  endmenu
> >  
> >  endif # MULTIPLEXER
> > diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
> > index 6e9fa47daf56..3bd9b3846835 100644
> > --- a/drivers/mux/Makefile
> > +++ b/drivers/mux/Makefile
> > @@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
> >  mux-adgs1408-objs		:= adgs1408.o
> >  mux-gpio-objs			:= gpio.o
> >  mux-mmio-objs			:= mmio.o
> > +mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
> >  
> >  obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
> >  obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
> >  obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
> >  obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
> >  obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
> > +obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
> > diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
> > new file mode 100644
> > index 000000000000..79197fddbf74
> > --- /dev/null
> > +++ b/drivers/mux/rzv2h-usb-vbenctl.c
> > @@ -0,0 +1,85 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
> > + *
> > + * Copyright (C) 2026 Renesas Electronics Corp.
> > + */
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/err.h>
> > +#include <linux/module.h>
> > +#include <linux/mux/driver.h>
> > +#include <linux/regmap.h>
> > +
> > +#define RZV2H_VBENCTL		0xf0c
> > +
> > +struct mux_rzv2h_usb_vbenctl_priv {
> > +	struct regmap_field *field;
> > +};
> > +
> > +static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
> > +{
> > +	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
> > +
> > +	return regmap_field_write(priv->field, state);
> > +}
> > +
> > +static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
> > +	.set = mux_rzv2h_usb_vbenctl_set,
> > +};
> > +
> > +static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
> > +				       const struct auxiliary_device_id *id)
> > +{
> > +	struct mux_rzv2h_usb_vbenctl_priv *priv;
> > +	struct device *dev = &adev->dev;
> > +	struct mux_chip *mux_chip;
> > +	struct regmap *regmap;
> > +	struct reg_field reg_field = {
> > +		.reg = RZV2H_VBENCTL,
> > +		.lsb = 0,
> > +		.msb = 0,
> > +	};
> > +	int ret;
> > +
> > +	regmap = dev_get_regmap(adev->dev.parent, NULL);
> > +	if (!regmap)
> > +		return -ENODEV;
> > +
> > +	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
> > +	if (IS_ERR(mux_chip))
> > +		return PTR_ERR(mux_chip);
> > +
> > +	priv = mux_chip_priv(mux_chip);
> > +
> > +	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
> > +	if (IS_ERR(priv->field))
> > +		return PTR_ERR(priv->field);
> > +
> > +	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
> > +	mux_chip->mux[0].states = 2;
> > +	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
> > +
> > +	ret = devm_mux_chip_register(dev, mux_chip);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
> > +	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
> > +
> > +static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
> > +	.name		= "vbenctl",
> > +	.probe		= mux_rzv2h_usb_vbenctl_probe,
> > +	.id_table	= mux_rzv2h_usb_vbenctl_ids,
> > +};
> > +module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
> > +
> > +MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
> > +MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.54.0
> > 

