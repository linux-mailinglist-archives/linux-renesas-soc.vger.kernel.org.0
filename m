Return-Path: <linux-renesas-soc+bounces-32108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PdsEZHY+ml8TQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 07:58:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 496984D6696
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 07:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51EDE30015BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 05:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70FC2FE074;
	Wed,  6 May 2026 05:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LC/eU3iN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7055C2F745D;
	Wed,  6 May 2026 05:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778047114; cv=fail; b=H6xzmeVbJrXxCCNi++OKOSxsyq0NFQ93CwWaA5NKkEd8OwnmS/842waxFbS3HpmEnuZEMnPRtAP1W5q57O/6WAPORsjybaMOeR830Pi5ZHEm4H9dGWKROUtqzVQvLPv/vjfr7Qv+Cac5u62uQOY8y9s4scoGXoqa1icF3GuoCBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778047114; c=relaxed/simple;
	bh=rxvuFBRsYTemwg486uo2W6ganZRRSJSxwsKnTIYU8Ck=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=kI1LTBNc2rV7MBRvLTkj8paTp2JPwj3tPeGuTMUVxT4eDUu13qIzwfJt1QY2U8E133HJAcExCca7Y45Yp4v4FcySI49ctPOlTUtc9RfnOwnIBhD0mhFQMTacXD0HoelV6B8dihnOZ9ya8CVRSjZg4JkoiRXaqhYz10BHFhPhnm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LC/eU3iN; arc=fail smtp.client-ip=52.101.69.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rgp7FALEZaeX6Ik0rfM4lL7Tir5wRSAJruheiSg6Xwc9EqnhSHINyQX2Iq1xRwvT+GkB+XellEgHzbnZUgJfGoRITCxCvWiyCYlth9Q6pt0j2UKy1qxLLKeuVN2vwSyN5O1yJffJo2xe1uNWlat8R0Ln2E9BUDY8svi6UdxB5Yptzm1wkTPoiyQ23aM8dh50OHuXoU0OzuKKoM9B10RWGX9aA2eYlJLcF5OtZqUdaIyNjYCA/hIPlMVDzzM8PnpgQ6XFJRlU2gBauEWzsOXHosl885K4vLMxVp//JTM+xABvKgk701Emuk8ISeyiIBP8YOOq+TLAhUtc/F/zROAd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1x69wVbtMbiK7PuJRtjq+jdCyvKnoeteP4YRN9nBRc=;
 b=NTIJLbV+2QoDSf3vX49f9v6eROMA3wxEIhkW3eaiWlswGGO3DNgs2ZSGRMjXInJMaS2/7+jvdBsP24ubRqoJofWEl5ry8aBE0TT95xRVpMYVLnEOrFTI6G27YYB2p1DKlEkMeRGNtRIOpHH+6w+80hxBQbytSdfKSCdgKt5nICDFUs7F211QtXB4XPo41TN77D9W2SqFupUbLN8CWZ1HtIYHHBeBGs67AeYDR4gM9zC1Jo54QA951DSQ5YKAJyvR2+EEf0npU0RaQVGMlTPMBnuCP1Ip/jK+xu5rsRqGe3vGbMHuzjEl70wqHywFUCC0kUBBFnWj9TdA/E5q8AL00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1x69wVbtMbiK7PuJRtjq+jdCyvKnoeteP4YRN9nBRc=;
 b=LC/eU3iNe+ktoTJQdO8kajNKYwjeIJx1/MLrNoxxF+Zw/n6Jxeaxd9iYSMvyXJZYyfxu0MAN8hekkELfMXMotUFb1H6kmBmmzwOQrWeMNb2OqVsyWO62JVrwNPsSfVUHKMOW8Vdn7a1JangjhvTe2Lcjx1IM2Lx0BFYk9p/7nvtOhebmNgpXmI7/+jexWiHtbKcNQ8u5zhmsa4i6aR2H+3Kua+hMm1Ay/nIToVJwrQgTPBDk8gkYFoFIQycXZ2I/SgEQUoq9csnUfwgbOuHtOU7xOyFCeXSWNyCMkNPEr05VNtjL0fHHz0Auv4YmOcS7QnVl6ThgO61t4c0sIZuFfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 05:58:30 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 05:58:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260501061200.20129-1-biju.das.jz@bp.renesas.com>
References: <20260501061200.20129-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4] drm/bridge: ite-it6263: Move chip initialization
 code from probe to atomic_enable
Message-Id: <177804719907.3480610.4892499987758652557.b4-ty@b4>
Date: Wed, 06 May 2026 13:59:59 +0800
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::7) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d3985a-6b30-4f17-d72e-08deab347f2e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 aLYUytwUZxsHnmSCMJXGGKV8afaNjylndgxLFd4XkvA8WsixiKwcT64J7J83f6wKKvT8O6fZzmhdUZqju8krAMTPeLB6QjYnBNdlKVc6lUd3D9Z6EiKj7cTmcfczQNE1i9VZWRY4bOXNNRhhC0x8G/FMZN4kR3hL+DvJsQj8G6Ny5+evjU557av+oLnI3OcUdnn0qXYpoRaB8lpVX4VC10bNDlgZn07spw/lHQ1pm8M4uvvuc8TZaZB37wX2T2lWdST/HSa+B6TVm1jlaHxWnNUAqytxDRnpKY8Cc/nRiEiZ+OpBKhoxN2wi/TMaoFn00yg0HGPoktX+r0WEMkAH1EgCmgKs9xYCtsz0F7UA/fwajKFrbeHOOl9QYqmuWozXLYmY5pUtqhE6BsK9KGHME6qbx+9IIBVGZ6GSTt9+34sZkGu+/SBr3QyMUtadbNnZvnFEadZH3SrQkaVEX13x59akfQiRfjxFrkFBc77Gx33B5If8yd0E7rvQmbrHb3JyjHe1XkI6XFuG+OsZZZAlbmqCQzTikAH6lGqs3vXw4XwONDFgFZZ9HyOupmjBSwWBlbw1DPR5pz/KyEwIs7nq5Gc99fnEdiAyY2Iq/RuJYXZo0eSI5omnIWqq6iPW2W55Mz1Z22G+hcG3NaLzzdyuCZK3cKIvTNNf2n/VD9G9Jqs22ko1jxj2jcRwBAWHRWRu8CvF45dsnq3nwVf7me1f7VL55Ku6BkDnTZNESltysQP1nmSEOW6nqduBissrPng6
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q1MxWUZYNTFZYjUrVmRCTUNJSzlZZ2xlaUphTWYvRHRTMWE4MVRiRjBURGdL?=
 =?utf-8?B?TlRLNnlPT2ZIZXhiQm53eGxORys3VjhVWXk0ZnVtcGpFTzRjQjdJQWREUW9j?=
 =?utf-8?B?OTNkZEUvTzVyck40TFFnaTNSanZTbXA3SFIybVh4bUtSMDAwaERHaURiNEdG?=
 =?utf-8?B?bWxIUVBUaUhMaGk1RmpBcGZYQU9IWXpwOXJxbzdyV3FkSE9LUjcxeHRyU25j?=
 =?utf-8?B?Sjh4M1dsUEFkaXljN2dMYWpqOWdLS0UreVlabUZOU05mbTFwb1VFK1plNFdu?=
 =?utf-8?B?SElJZHJyTlpuRURoU0g2R1NOalkyRGJpN1R1dmNoTTNQTXRhNThKLzFJci9J?=
 =?utf-8?B?WVo5dmxNbmo3VkFOZTBQL0FNTHR1NzNJWldrYTBrektKQkRwUE5ydlJiQUxR?=
 =?utf-8?B?b0VVMHN4T1NDaWp4OGdtSTdWNHZtVlltTWYrTW5QcGtsc05Ca1phR3AzenpV?=
 =?utf-8?B?OFd4N2t0aG9GNG1XSUNWMC9xSzkxNGFrNGZVc2JPU29mMjdYVnJ0VS81QWNl?=
 =?utf-8?B?K1hzcDExeEJENXlOai9OUXMzWVFuZnFCQlQzK21wcStKMVVaV084SU1qalMv?=
 =?utf-8?B?T2oxQnFtUCs0cytDQW1SVTJrR3ZKMjJCQ3AyU01neHJGKzNmdkNqVUxOK2dE?=
 =?utf-8?B?dFl0dWZSaEJJOUZWVUNPVDFNNzIwV1VqbHdYUGw5QTFGcmVLUHhhRnFZNXBy?=
 =?utf-8?B?TUI4dkllcVZVS1RYYUovbXdHSnpBdXlHVmVrYS9mNkJxMGQvWE4wNlY5aTB1?=
 =?utf-8?B?TWFYMGFQM004MXJHNjJ3TThkdWltdWV1YTJ4Y2hCd2xtalY2Z3FNV3VvTm0y?=
 =?utf-8?B?OXlvZ25OVTVndU1QaU90aWFneTZyT3FTUUVrRzFRaDduNEIyZmRNaXVOdWU2?=
 =?utf-8?B?aDZLbU9tdHBFYnMzekR6UVFaZnVqMVdYT29DeUgwZWxXZDhxZ1ZKcVVxbDRu?=
 =?utf-8?B?RG5XZXg1dFVvQ3ZNbVNjQm5jaURJWWplOVBwQUYydCtRSHlwWXVUeFgrbWpV?=
 =?utf-8?B?VVdadGdNdGtabFV6dXZDci9UN3JQazJCbmltWXQ0OW9ZcDR3Mk1TZGdDdUNv?=
 =?utf-8?B?c04xRnlFSWFGTkYxalZWd3RxUXZUZElPZlY4UThyUGhLZkVPWTI2MWFNY2Jm?=
 =?utf-8?B?TkpKVXl6dEs3aFA4WU5lN2d5bHVxYklVQ3BHWldFWnAyRTVxOFdRd0pyWWtI?=
 =?utf-8?B?cG0zY0puTlVoWXFTc0ZEUmhXZm9GQXVNc0dQK0ZEQlJnUEZWYU1hZlRFNlJ6?=
 =?utf-8?B?Nk5BSHdOdGcwTzNYOUZWUlA0aVpGR2hBUlh2d0d4bWRuVFltWlJBM05VSWRa?=
 =?utf-8?B?bjduZjhKRS9WYWNTVXlBcFFkSzZ1Yi9RMnU0Zzd6RU5IbFJWTXQzU1EvQjJF?=
 =?utf-8?B?cHNleFRYL1FlM0p4Zkl1cTVUdUVaNWhmUDl6S2tIUHNXZDdnME5aVXkyY3ZF?=
 =?utf-8?B?Q1V0U0ZEZE1JRHY1bmpFd2psYlpaMnNRTkw1YWUrK3ZVdDVhRkZlckFJYkpt?=
 =?utf-8?B?anBjM0lZcFRJcmxscXRaM1dkM3k4Z0xjRzJoblFOdUZDSSs5azJuSDZvL1Az?=
 =?utf-8?B?clhDQjNMbVhqRVhUVHhnM252TXBwcXJwZm1aeDNiYzVjU2Z6SlJQZDVUaFdY?=
 =?utf-8?B?bG1heTRWSG5WekdHNGt0QVJjL1hVOHpldHhTS3dsUlB2TDZvRTVsVEhtMVda?=
 =?utf-8?B?NzdReHdHOHV2TStsV0NMWHZ1eXgzQ2V6cU5MV0tMUTdobDBaUWh3RWlCdTRH?=
 =?utf-8?B?a0U0VG82N1I2aFdvMkRFZWpmbGhWQ0I2cmRnSkdySis0ZmdMYnp5VUVITjBs?=
 =?utf-8?B?UVYwQXl5UGthVmZsR0ZBVDM1OTlRQ2RFVFNwaDlvbzVvc1YvL3RyaVgrYjU1?=
 =?utf-8?B?bWphYW5RQjkvTUdTV1kxMmYvM2FZQkUvK0drUVJOdWR0bmsvS1p5UEV5azJY?=
 =?utf-8?B?bzhKMHdrZU1aK09UTlRnK3RlUHhCUGJDcEk3YzJKNDVVU29UUVZ6U1BMRE9X?=
 =?utf-8?B?UVFYdmMxd0tZUkV1V0hoQkdpYzhjeEQ2QlJXQmg0VUJCbkNXMzVYeFZTclFj?=
 =?utf-8?B?dUo2cVlDM0FvUzRab2F4Nzg0MklyMnZuZlRhaUNmeU4rb2IvZVJ4SW41dHhJ?=
 =?utf-8?B?K2VUaEUyQXQ4enpYNTVEZjB4YTZMeHJvZzIweUNJU0xtcTBTQVExMDM2Mjcw?=
 =?utf-8?B?UTY2Um4zNzZRa1hleGh6RDZWaThzbzdHcXJaVlZTNjZCME9jYUxpN1Y5Tkl6?=
 =?utf-8?B?ZGRQM0trY3J1VzFhcmkvZE8rMWkvajg2M21qaGlna0JnT0UvWTYzMkx1dUox?=
 =?utf-8?B?SE9ncEFMTG1KenI4dFNxbFJoelhYcnJCalFYNW5OWGRkK1p2bFY3Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d3985a-6b30-4f17-d72e-08deab347f2e
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 05:58:30.0568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HM2y1qqYzRfvw1iX4150AoDJHf4nMfAFp38cKDuqQJ+/pt4y+Wj1Nhz1ns4iDqJWjw+vDFpvAcwX+qd6W8Z6Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
X-Rspamd-Queue-Id: 496984D6696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32108-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:dkim]

On Fri, 01 May 2026 07:11:58 +0100, Biju wrote:
> On the RZ/G3L SMARC EVK, suspend to RAM powers down the ITE IT6263 chip.
> The display controller driver's system PM callbacks invoke
> drm_mode_config_helper_{suspend,resume}, which in turn call the bridge's
> atomic_{disable,enable} callbacks to handle suspend/resume for the bridge
> without dedicated PM ops.
> 
> To support proper reinitialization after power loss, move reset_gpio into
> the it6263 struct so it is accessible beyond probe time. Relocate
> it6263_hw_reset(), it6263_lvds_set_i2c_addr(), it6263_lvds_config() and
> it6263_hdmi_config() from probe to atomic_enable, ensuring the chip is
> fully reset and reconfigured on every enable, including after a
> suspend/resume cycle.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next), thanks!

[1/1] drm/bridge: ite-it6263: Move chip initialization code from probe to atomic_enable
      commit: 6d0cc72b3ad5a631d7ecb2c14de82ca0c2a1ceda

-- 
Regards,
Liu Ying



