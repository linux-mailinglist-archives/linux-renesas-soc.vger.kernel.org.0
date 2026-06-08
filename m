Return-Path: <linux-renesas-soc+bounces-33643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JplqIwQIJmoyRAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 02:08:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C64651FAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 02:08:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=OkjKVF4k;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 043453005ADF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 00:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC05018B0F;
	Mon,  8 Jun 2026 00:08:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F80646B5;
	Mon,  8 Jun 2026 00:08:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780877313; cv=fail; b=tAky8AauL9EsVWwIOhZ+KbB7qDWAVD82hnmAWTX88j6Zm7pmArJrLWQxQgxKpNcyMHlHO80tYuR7pHmw14PWfYpt7wOwN8WkZzSIfd2XH5BIAHZhNDdYH0wRBPnoAwqnTKotQ3U9fxA/adF+VwIoukjWmx4Iej9bAUdhGDfJOJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780877313; c=relaxed/simple;
	bh=pNKASoyBO371fryUVWs83vcjHbtLbft8219uu6sCeb4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fxmGD5uyzlzNtkG9goxr6XJKDqAO1c6SinL87GZILmRnv5QykJeOHNOJ9S+AF0h4mD3S6+5BW3CUlZoWJ6iTNvbtzWRb+cvufP+5yxEPLcLuZKI6kd+a7N7HBLu4ZPaMlQlCdLVRTJ2QTJpdkr0TXu9tae1lbU3HLWqGhKRnLWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OkjKVF4k; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCHk4k93qlWfbstJA3OQoNgyODlc8aJ92YEi0JPSo6DCuGZjsaK+ocjmItplSaff7eUTXQxcc/GYboNwxTlRzrhCvmcse8mVJFru7RmWyhF6pXCfv0rQOfc/P/A/wuQ2ytGIkVN6JWu1DyOAh1IxBmUuKb1B1vuel0bCZBou8hJ+ro6jSAKBePQq0Q72WBsvlNzhLtJ0UHDAEfSMaxE8zqIusT5ooh2bULlHkwTKFqK7iE48pnr7eVKt1Qo0vceaUCAS9H3IoV29lmhQIN/ut8WZGIsI26spKO/xH6T/Zml16iUDticIXsfPsFqfmjTYnCYoHzdpMRhCLAYZPKSrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uFHlsUZeiMgj8bNQppY5lnEBDQQvxFFGSuKqyRKU/E=;
 b=ynLkfbh+y7q+FoMXVo4JUGmLrrLBP8ePj2r1DKHBVJt6Mgfe1a6EHuKw7EAgk+M75AXV5++xKiQEgHYEEIvXNPXvbHEUnsQGUcbm8UGiiT6l5X65GKfs0q2bXa8vVMOukuW2dw1MP12ewlw3B03Xo82QA8eJhrhXsrRgimzkMf7nmcj74XGVxkUEa0fL/eYRXr88gS+VwuRTHtuj4UKxNgbmVYZgqhl6j/HpYs6HYEOb/i0KpjhaUzhQ4BlHkjMsR7CF3rhj3OrP+n1NLI1sZzuyPISeORl8k7LviGsB9C35ySdEI+ckmZJcaBanNg34nLSYFacHWrEO5vhtLRX0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uFHlsUZeiMgj8bNQppY5lnEBDQQvxFFGSuKqyRKU/E=;
 b=OkjKVF4kBvSTWE2djw7iMDq/Q+Zeplwny3K/gQbENoGlGQ+OCv2/66jlnY19bANd6gG9O6RxvCTnzgMDyLAn+trykb20MrJjeh6u3Av3WhLa56IqqkLgd2ErxMrsJrdcSgxnkJA+mOTxVGsiDRC7D8bpbB2gJBqYHqfNiqjDdx0=
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB14009.jpnprd01.prod.outlook.com (2603:1096:604:364::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:08:29 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:08:29 +0000
Message-ID: <871pehgagz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/10] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
In-Reply-To: <CAABR9nHGNVWuOLyuqvjrsYYJBXOFs8W0ZN5PUs3AX4+rM2RmMw@mail.gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
	<20260605121955.105661-11-phucduc.bui@gmail.com>
	<68a03a72-07f3-4738-bad4-6b92bafec318@sirena.org.uk>
	<CAABR9nHGNVWuOLyuqvjrsYYJBXOFs8W0ZN5PUs3AX4+rM2RmMw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 00:08:29 +0000
X-ClientProxiedBy: TYCP286CA0326.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB14009:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ebc45b-4c1d-46e8-0650-08dec4f211c9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|22082099003|18002099003|38350700014|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	XzJrE9swjz5DJ2aKv4PnHHbP51qgAuzlJQi/OCC66hMcxyBYlChSHVGqZ01b+2iCpexsq0sjAoN/LTsMYHRSyleG01gVeSnXEkZ3+ScQkXDJFBw92/vPdMkvbmeFUcP7FH4fq71fJ3M2QtgbD8FCm1Q3xO819AqdzKGE4mz18MbtV4qQHfHLb8tG3m6o6P9jsMfx5W20y1XsS8qgXmo3Hn4V60sTLlL0e+mRCzfO36Z3ZP5rTD4Psu5omQDI7OuTP10rdeED4M94nrzcBlqlGAstWVWXw4nst+r1uTWqF4yWL9rxPss1pfMP50PnCn3WM3BHmcF+25dN4RZMecOKczwLjmT1Tmoy1RvFgcwJ8G+zpxjXgpMdpMJUHcyovneI7c0MhnYVmuDRxpbOHGdN9+XFnP83ta8CgbYJQLL0s56/wiMgPfEamf+C5NirM3Q3Tj0xFZN/zNdJs3t6VqLmVyBPlAFzDsEy0ugTqzAG/GIH3Hr2IDWHmBUSFsRtRLjAJex+0dKR10OLQEGddCSn4AeqPm8zTSXtdeThOJhXrrs9+wWQ7zZcslwAftmNTEz9kn2qUJNNYQuth8MPuM64uXO6Z9ytmNQWKoK7TlxWni4izNP9CY3Q1nLjTrX7iTprlIyjuy1LqxBiYjrPwmfR0Lk/AREr+bjBCwHjcqUlg1qWcTdkwEPnw7gtZpX1rQb2YkihCSls+E8CzrUK7289Loytx5CZOT6DdTD6UGdaI+TZGBaPiPBBYW7+pDgZ8K6Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nKgcyRbI51BM/tBVlc1CMqj5F4Ub2iUtt63GbGVzWlFwE7yMpE4HldFBdiHP?=
 =?us-ascii?Q?zYRr/pbqhUlXAFWmKr15umhoUh9f1kDgxqIkk8GFdfLdHvUdpVB9vyQpvksP?=
 =?us-ascii?Q?dgc/zZ81hixW9ymcAqTW9hjrg6eKzSzKZwEgplLtKcUoxHEf98pamsnhxtN9?=
 =?us-ascii?Q?TLGlKfGsCa5LtyyGNpTfv4nQ2/FihpaZOSQU++Y+Wg8WeZ1KdL54Augz2+jd?=
 =?us-ascii?Q?UX7aQT2m5GHB15x0AOw+UhG4rzaj6BotS3MeaL2NQ3sEeFzDG/nE+E6iz8c0?=
 =?us-ascii?Q?BxYheTB25X25bPlEZQ9LPa4nSa+gMS4P4/lqhpO7xBciQtHoiFYQO49Fm+GZ?=
 =?us-ascii?Q?+DvpPf2uRXVLnWUgrN+ppN53w2N9QpwSuVM3MhbEHj+65fufuGx4WoVtQLt5?=
 =?us-ascii?Q?0NrGk6LNmAJs3gNQYQEpbPuZwm7pgYAFtQW4REYAjPvh2voKZkjwTFulpMVi?=
 =?us-ascii?Q?7Y8pn045xI1Q5Bsk7KaHRBQ0vWM0k9fzPTaBcaR6pDO4gJ7zHHKPjZq+aFmJ?=
 =?us-ascii?Q?AMh20uR7zxNhIJfSJtsnKXLicQFWGT1P2/TpMqjviEAHe7hCl+4RHCpRUBAA?=
 =?us-ascii?Q?AVWQG9JZE0qXs9CJeMvzhtLICzofsP6fw1i1gS3Be69UmJ7zO9rh6ZLwfW2D?=
 =?us-ascii?Q?n3vPsHoOSFLhKlh1lwAb+YO4qoU/k3mw5D2rROER4tA2tLbnZX41T5NdEcv+?=
 =?us-ascii?Q?u23RDPwDfHVCNK3X6X4DjzJWOF4k8g3FuterO7To5qrDc7kx+xEXWN21RsQl?=
 =?us-ascii?Q?7EC0cNvNcWcIPwxAuauPhp1lRo9jlGxjaxNvWJlJTaTiONmAvZ8I3QTs/KED?=
 =?us-ascii?Q?iXEFnZ+jOhBk8XsULhC1X39EMRyAGclXtt3M4RGv1CwXsNSImPDL0flZGO5q?=
 =?us-ascii?Q?81bKXHlRV8JaoHkxjH1UM/reZMnKIB+LqLx8oO3AcaEv61YjgZNeVhDUArRH?=
 =?us-ascii?Q?xPQNpHJrE8QHaQlfHXW04IIrArEdfPaRc65hfWiTpvDuCIIedLwb8tmWFM0Y?=
 =?us-ascii?Q?WRqUHFWYylyr1+kDyIvFKf84pVfUxWdh3EflCXOM1EHVqVcXwdQfkscD9GDN?=
 =?us-ascii?Q?1yvBFeLTiEnytvWKaHJ79GGXcTKIqXsqSkjNj7X+hyk/bDUyBiFGm6sG/WUH?=
 =?us-ascii?Q?js3GeeU2G28yHwoKpAousUm0m3Rt0hrGF/QgUObYkWa1wLSlo5YiOcgr+kEG?=
 =?us-ascii?Q?Uf7uVINA1QmHFZO2ZLuccquFC/BStvvewyvwlpsSD1o/3KnSR7iLOnRU7f4U?=
 =?us-ascii?Q?0Z+aIvx0/OYmA+yNdJotROR5GiYDaJsYc5lzdNHNUzpKGD4KRue0aZeSzoRe?=
 =?us-ascii?Q?2zq9s04sU86BpRuMfUVn8ITNJRUfeL1NJIrNXEaFDCBiuT0LVjAZ4TDUChmi?=
 =?us-ascii?Q?Ci78rCWiOzpMcpTe3kbdA9IT2ljnOr+n9X96NUaZQZiEaw3TQUMYC0r6yAKQ?=
 =?us-ascii?Q?tYYukiBG8gKHXMc6TF2hDyfP4eXvbOGJlKNmv+tiPGRrJGTve2upujTHams+?=
 =?us-ascii?Q?xemzlpv04DK+GlNGq5NUI3PWnlQlYWF0DKeGTOHGNSiAoUZOyHg7WI+Crn/m?=
 =?us-ascii?Q?8/++ns80QYir7VrmrYFQn0++YXraDutZnNVxP3akuWhEb9Psd63ym8bnPGa0?=
 =?us-ascii?Q?c8WaTK0bBMWI40KZQGfwWM4sqMeJ3OF1qQAT0R8vADJe7d3Vtssx2JK5OjMn?=
 =?us-ascii?Q?J27EOH3qvxrmG48UlraG5WtcN17fdbuZOuyCmUA0G5d8WAa+IN/IQbP/m2kt?=
 =?us-ascii?Q?bdk2zoKUPHdB0JLc2gG/jwGHz5z0qJY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ebc45b-4c1d-46e8-0650-08dec4f211c9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:08:29.4550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42GaK6B0NkAzG+vl4VjGTnjLd5A66T/24Luq6thy8vSXMf6PpwtlDp+TK2VsA5wYbWDMAwg+k4KGe+XAA535Z+Lkh4MJJUCkRcxxuoaWICOTJ/EtD6bGg9L+lHIeJlGs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33643-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucducbui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,perex.cz,suse.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:mid,renesas.com:from_mime,renesas.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0C64651FAB


Hi Bui

> > The indentation here seems wrong.  We're also using spu_count to
> > separately guard the clk_prepare() in fsi_clk_prepare() which seems
> > problematic, I'm having to think too hard about how this might be
> > robust.
> 
> Thank you for your reviews.
> I think we can just drop spu_count and let the clk core handle it,
> since the core already refcounts via enable_count/prepare_count.
> 
> What do you think, Morimoto-san?

Yeah, maybe

Thank you for your help !!

Best regards
---
Kuninori Morimoto

