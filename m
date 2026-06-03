Return-Path: <linux-renesas-soc+bounces-33498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FisEIFTfH2o3rgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 10:01:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5C663575B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 10:01:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=Ub6rlW6U;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 124253122E4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 07:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC92038F942;
	Wed,  3 Jun 2026 07:37:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010052.outbound.protection.outlook.com [52.101.228.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC2A322533;
	Wed,  3 Jun 2026 07:37:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472229; cv=fail; b=lEHZC+zKIpDSBVzrE+kNcCmKAiVwfwwsSX7jMBQlB0Mq3bvNg2yFwyx3eOAi9HmMGPP1WQ9Tvi2NSmOovA1BXTaCH67ACFbJjPSjKDnxDMF+53hxArwr75JQC+uhxzSkx0W6P6G+SpazIDGeD4N77QxixL0gicd9LFqYKWS4yW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472229; c=relaxed/simple;
	bh=xFcC20Ey3oN0T7o/J9Cuvp2jwUK8gS8bbUGaAAaO2R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KP0S3Mlr9iOAbZzoRm3SBYpwrqWEe5DSLKKq5WOoUfPdGa0nxVuzk/uK20sMBIRFcG7R9Wr3hVezxNeGm/v3avmWDotoke//uJq59KDVsxF6lsfSBksjwLPalpYGu/vnlkKMT6lXq3w5NNRSjGGC58g6WMmOv12DA405S8wngDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ub6rlW6U; arc=fail smtp.client-ip=52.101.228.52
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/5/1vUAtWNhLwFv2RRRVpBLg+97/itWTJ+aj5h6duazBOZ69Q7JLaMubAHZgzZSQczBuxLznog2KKqbQkCY/rd9CouRgK2Eqcf9GmsHja4stMrkDbE8lP1N5HA4t46PKNk0UXhpYMdwiAOIAt94XtwIK0sQoHUeCmFRoh7g7wx0Yq27iKXqtHgDRx9H8Ze7q5fSsZSqDsrjwaTC9HZ3/YuTe5dmMvcGIjSh+loi4f62YIeFE++gbrFYX7JV8w3sMfMYgh7ORkGksKFYsnr1zLA+eGWyZ3hznV957K06iFGAR4+8D9vhAVlyldEzUZ2+QumE+uZsAFE8vubvchtbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUwBEttn4BmB3EX7u8sAsY9wwL0g7VM4TO2/SzYfT1o=;
 b=W53Xeda+tFlF1dIMgmcBcULGZIlF08ilWUOo+mfT3FaBiOtI+5S/TT+X7iZaLaDlx+n21m1hxRJx1sCp6XRVt0Tncb6fOuNYC1XonbJHBZ8Vpcl/M8dIkPW/qw0FsTiDXBZpDz5wOZIz6HkoLEO9wVOUEH0Gvn+3R/9wZBW3PcOiRpwQdGxCZ9bM8WunuJ/EoQJbOQQneGm0GpMVif2KShzDhsLm7yWKoAEDiKanAgk/s/FHXVEfagQs5uQeAD9M6bhuFrReZqcbuw5fqd7dUWyhsvvX+v9VsyzD38hXJvWTHa2Yhpee+Raj4PapLa9xMCJVJ7NG4UlaSPjZ1ui7jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUwBEttn4BmB3EX7u8sAsY9wwL0g7VM4TO2/SzYfT1o=;
 b=Ub6rlW6Uxq5Zr6xCPK/kVSoQSfcJnpVbu4DXgd5ThLNz6AnrFw75DQIcOryNVfzt1rLOmHL5HffBls2Szk0X6kWS8Z92crR1PsRTkTlt5Z99cI3nrXOWaynK6cnJm8ka4sXBxgYCrj3ihcQoFLhnnCGOW6AlLwEj1tMT8aYNHfY=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8578.jpnprd01.prod.outlook.com (2603:1096:604:18b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:37:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:37:04 +0000
Date: Wed, 3 Jun 2026 09:36:46 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, peda@axentia.se, p.zabel@pengutronix.de,
	ulf.hansson@linaro.org, peda@lysator.liu.se
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Ulf Hansson <ulfh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Josua Mayer <josua@solid-run.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/1] mux: Add driver for Renesas RZ/V2H USB VBENCTL
 VBUS_SEL mux
Message-ID: <ah_ZcW35MYJMtimN@tom-desktop>
References: <cover.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
 <582eb5408684786577e5fa85b80f585c8739be15.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <582eb5408684786577e5fa85b80f585c8739be15.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: ZR0P278CA0070.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::21) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: 79fe8ae3-e27e-4a0d-18a5-08dec142e819
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|52116014|376014|22082099003|6133799003|18002099003|38350700014|5023799004|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6qwZ4lBtfRQTlQsddoGWN3xjjN+gH6zLcAUA6nBIHc+p4Tgp7bdjjwQ9fpm3ROlzW5GAbYMHqLARTPRBGBH7vjUoiW38n/iy7PGof17DnKTalYvspTfJ06vKRZJh2TE01KOLQoyoOWi3Vl8YDUKHVAn4s4svC+qsLy0fj5Wab/D5Jcby9eT4VruN+O8cSatnrbMKgASuEBIn71WiCrcceC+mxwplWI5doJN8BH4EqbFYS2yrYOLdEEQV3GvcpJxcTLj+00nWsexZb28XOnukLXwV/uOjPlk4qFuJdegQvEZkYl03UmEHTIdyL1dijVpu90eoJf1sOFME1H88Wb10WbD5Vo1SoJSa0YuaHRnLURhBDa2YPs6jjm5lbBCh6flbwkC860NHMo8+lju8KJEZkVLc+UntrXAjV93D5i+5KVu/X9hvde3WvSSprsNaAVcS9sbiHS2uUdaQkctxarsW/r+hR5Rn0oV1ixG88VlB8zM3xVo9IC23AOZx464YfmiLMyDib2gBKlwAZRfBGpPNHw2h2TnnaEXTLLvhXaYume9SunEqknnw01b0DIzRWNKxOAXW0Y44EwUkl5Ee8cSgQ2tlFphmkMJtiyyC/jLDWx2H6RCJ0CwLQNbij6GHRN4aa/rbE7ENBcCXGFKO3PKXymalhI+4OJeA/EkNRN+Vq8Sut5ze5P70+MZkm1cNNE97eutVMXmQBA44F7TnJIbcJeLNphJfDSOnZIdVwGdxgIFRnnUjUTuiPgc17ESI6Zuw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(22082099003)(6133799003)(18002099003)(38350700014)(5023799004)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hEIGtWV7strIGE9XWdf97PthfTnHs+hGjdBgy/ZPHKr6kx9cU2afHNANejCB?=
 =?us-ascii?Q?QcYOGl/ZIdSherx6WNcJhFfWPtFUXX3vEwLMfnJf/CgeYDJ4k2+zFmO6v7dZ?=
 =?us-ascii?Q?Qw0J3auaKNYSmhkLmX+Cb/xOXWs0LlwfqUHqWFyMSud22V0+LNK+WEHEpYyF?=
 =?us-ascii?Q?gsRUthAbP9bZffMxtGRc7k446HJK8x9RNhlTvQcR23dn4wbALkX6WxMtRSOL?=
 =?us-ascii?Q?p8GEZItY0HlZNVQBrrgKNzjay2Om+rP+y4oaPYsjgLEkOtT3cGBFQxk3ar4k?=
 =?us-ascii?Q?+aOTgzoY0ZH7ao57DXYM6INGSY1uMJ8/0s/7Tak8YAYa/m8gKUaaxOZbJNuK?=
 =?us-ascii?Q?zNjUYYdtvBiWy/RxVNVhI+0C2TG35clqBjgw3/DT+f1eJpHhc17Qz4kTDJ3W?=
 =?us-ascii?Q?lWHJnBOIACKLxeY4aKAafocKYJQSz5yi8voTc9esALwkmx7HXkNBbwMRCPyL?=
 =?us-ascii?Q?wxbF5omSyD0epPQHxC4hDBdDT6yh5SnwHqaNn9Erw0Twf0q+Q8oCslswdXVy?=
 =?us-ascii?Q?eQT8yZtKj8W41w3ITYH3YTOoiZx5j7ETwcqls167r4ni85vnOw/YKSdwbbMR?=
 =?us-ascii?Q?d6JuXrBeGAr5q079RdESpGpcYBz4P1grjKPgAw/S/1hhyoYqSLLzYJCJ4Yyz?=
 =?us-ascii?Q?HNqdyGwUzZhBJuVuY+q6XOgel+IoL5tJKfw5C0g4sOshOPs22IW6YTHFvsPY?=
 =?us-ascii?Q?KEKQwTDk0bKnibhb/+vqal0cwRZCGUqDf8zteYLwii6iw2zkX0ucprwXUdHZ?=
 =?us-ascii?Q?R2cpeNDZ0VfOihd/BTT7PzHedTujObSCGD3kRUHnGX/PGT0O7urKosRTzose?=
 =?us-ascii?Q?urz9h7zveREWZDb0xLMLeTx3UKwMRgUKZeCChw+WyUq8Rs47of7WhoA16lSI?=
 =?us-ascii?Q?GlY8YTqoakE6FzTAEsZ03Rb+WIexKto3PeBGoFebgvxElJe86Z6PtifSzjxu?=
 =?us-ascii?Q?GR0gdebUxFSXRyt55fxCNBND+VQL38vMBJbBl32MGp+L6xO19A/Gcm64RGSQ?=
 =?us-ascii?Q?kBgZhEjr6dK4k6dHYf5iWE6x+I9SzTd0oKez1F0HENZaOGcM9zL7aKL8WciB?=
 =?us-ascii?Q?UKy7LN8SZMH1Y+cyxY077ARVw0f1Gcmvjaf94Nbef5jcrk8d1Bw+Z68Mxng6?=
 =?us-ascii?Q?lrhrflR5lizb2eX3fS5qBdG34m5tN2bwoXUNZqsrXXzd8y/lS7mL3SwKhUTX?=
 =?us-ascii?Q?X2GxWTr9wRSwNE0EEtiqfNveFx6loiQ2eBSwAjpF4YCOV97slox59FVT3TeO?=
 =?us-ascii?Q?5J4efFIj2fCLiCSmYirTSPi+fuqEN1NHlk6CUgsujsoQ3qTVoG4ALkRSKU24?=
 =?us-ascii?Q?JeNIdX2+H55KsBkZMIvIBefuzXnMd118/i6RVWG8PhJqQDyY/sC0YAQXS8/y?=
 =?us-ascii?Q?fTuQVl2UpUHXKpBeomJWpG2KYLsRKz8I3+n95FDPyrNhgLmY/wcgKePo5E+1?=
 =?us-ascii?Q?DZ/zrjILza1qw1Qxi17ZgxG1riI1aRC1RfHCZe32F2FQRxvRmAfHqE2FOrz5?=
 =?us-ascii?Q?NdY7ZiZT6A4c6Ukyhqc7svJdPEN4R8bicBoM03UpAm4W5F3xATXB2feB2unq?=
 =?us-ascii?Q?466OMMQ7DfECssg/Nq4b3z/0yd+3bhe5m/SSwKikNsdwIubO929VGo4aGTt8?=
 =?us-ascii?Q?6xXH8EyXvCPiA7evTVtLtOowM5WHbg/6mB+m3NwbCcGbBsXtVAYGd/Dd9ryi?=
 =?us-ascii?Q?a9r1ZKg3Hg5wwwRhbKqTZOTf03nGe6C7LzUN4fphi4YLAPB/AzvPPmiWJgoR?=
 =?us-ascii?Q?e3EZ45JBSm+HJ7GXU0O5QDMkAQLqaKnRMAl9Sjs/yEcRBOaP+oVl?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fe8ae3-e27e-4a0d-18a5-08dec142e819
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:37:04.3967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3zsaeax1NN0xfgx4B91aRVMbqGUzF9klmyCMYTDlo2QyBLE0tfsC0jeRTifHjJzXu3cPDjYEX6CWEVYIrbrHopOxSdvbd8xbqcoeKq8HMGAzPoRhe6MKfRF8GSv8itR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8578
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-33498-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de,linaro.org,lysator.liu.se];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:peda@axentia.se,m:p.zabel@pengutronix.de,m:ulf.hansson@linaro.org,m:peda@lysator.liu.se,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:ulfh@kernel.org,m:gregkh@linuxfoundation.org,m:krzk@kernel.org,m:josua@solid-run.com,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pengutronix.de:email,bp.renesas.com:from_mime,bp.renesas.com:dkim,tom-desktop:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B5C663575B


Hi Peter,

I noticed your email address has changed to peda@lysator.liu.se I hope I am
reaching you at the right place :)

I wanted to gently follow up on this patch. If you could let me know
whether there is anything I should improve, rework, or clarify to help move it
forward, I would really appreciate it.

If there is a preferred way to resend or rebase onto a specific tree, I am
happy to do that as well.

Thanks for your time.

Kind Regards,
Tommaso

On Mon, Apr 27, 2026 at 03:03:37PM +0200, Tommaso Merciai wrote:
> As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
> bit of the VBENCTL Control Register. This register is mapped in the
> reset framework. The reset driver expose this register as mux-controller
> and instantiates this driver. The consumer will use the mux API to
> control the VBUS_SEL bit.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v10->v11:
>  - No changes.
> 
> v9->v10:
>  - No changes.
> 
> v8->v9:
>  - Fixed driver comment year (2025 -> 2026)
>  - Switch from devm_regmap_init_mmio() to dev_get_regmap().
>  - Drop unnecessasry include bitops.h, of.h, property.h and
>    drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on regmap.
>  - Collected PZabel tag.
> 
> v7->v8:
>  - No changes.
> 
> v6->v7:
>  - No changes.
> 
> v5->v6:
>  - No changes.
> 
> v4->v5:
>  - Changed file name to rzv2h-usb-vbenctl.c and Fixed
>    Makefile, Kconfig, function names accordingly.
>  - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
>  - Updated commit msg.
> 
> v3->v4:
>  - Removed mux_chip->dev.of_node not needed.
> 
> v2->v3:
>  - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
>    is an internal node.
>  - Fixed auxiliary_device_id name.
>  - Get rdev using from platform_data.
>  - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
>    as it is needed.
>  - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.
> 
> v1->v2:
>  - New patch
> 
>  drivers/mux/Kconfig             | 11 +++++
>  drivers/mux/Makefile            |  2 +
>  drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
> 
> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> index 6d17dfa25dad..7f334540c189 100644
> --- a/drivers/mux/Kconfig
> +++ b/drivers/mux/Kconfig
> @@ -70,6 +70,17 @@ config MUX_MMIO
>  	  To compile the driver as a module, choose M here: the module will
>  	  be called mux-mmio.
>  
> +config MUX_RZV2H_USB_VBENCTL
> +	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
> +	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
> +	depends on OF
> +	select REGMAP
> +	select AUXILIARY_BUS
> +	default RESET_RZV2H_USB2PHY
> +	help
> +	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
> +	  RZ/V2H SoCs.
> +
>  endmenu
>  
>  endif # MULTIPLEXER
> diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
> index 6e9fa47daf56..3bd9b3846835 100644
> --- a/drivers/mux/Makefile
> +++ b/drivers/mux/Makefile
> @@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
>  mux-adgs1408-objs		:= adgs1408.o
>  mux-gpio-objs			:= gpio.o
>  mux-mmio-objs			:= mmio.o
> +mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
>  
>  obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
>  obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
>  obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
>  obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
>  obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
> +obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
> diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
> new file mode 100644
> index 000000000000..79197fddbf74
> --- /dev/null
> +++ b/drivers/mux/rzv2h-usb-vbenctl.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/mux/driver.h>
> +#include <linux/regmap.h>
> +
> +#define RZV2H_VBENCTL		0xf0c
> +
> +struct mux_rzv2h_usb_vbenctl_priv {
> +	struct regmap_field *field;
> +};
> +
> +static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
> +{
> +	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
> +
> +	return regmap_field_write(priv->field, state);
> +}
> +
> +static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
> +	.set = mux_rzv2h_usb_vbenctl_set,
> +};
> +
> +static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
> +				       const struct auxiliary_device_id *id)
> +{
> +	struct mux_rzv2h_usb_vbenctl_priv *priv;
> +	struct device *dev = &adev->dev;
> +	struct mux_chip *mux_chip;
> +	struct regmap *regmap;
> +	struct reg_field reg_field = {
> +		.reg = RZV2H_VBENCTL,
> +		.lsb = 0,
> +		.msb = 0,
> +	};
> +	int ret;
> +
> +	regmap = dev_get_regmap(adev->dev.parent, NULL);
> +	if (!regmap)
> +		return -ENODEV;
> +
> +	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
> +	if (IS_ERR(mux_chip))
> +		return PTR_ERR(mux_chip);
> +
> +	priv = mux_chip_priv(mux_chip);
> +
> +	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
> +	if (IS_ERR(priv->field))
> +		return PTR_ERR(priv->field);
> +
> +	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
> +	mux_chip->mux[0].states = 2;
> +	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
> +
> +	ret = devm_mux_chip_register(dev, mux_chip);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
> +
> +	return 0;
> +}
> +
> +static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
> +	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
> +
> +static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
> +	.name		= "vbenctl",
> +	.probe		= mux_rzv2h_usb_vbenctl_probe,
> +	.id_table	= mux_rzv2h_usb_vbenctl_ids,
> +};
> +module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
> +
> +MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
> +MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.54.0
> 

