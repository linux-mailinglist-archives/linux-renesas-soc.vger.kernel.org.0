Return-Path: <linux-renesas-soc+bounces-28421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK6GNTtfnWmxOgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 09:20:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B818386D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 09:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D91A3006B47
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 08:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E31536657C;
	Tue, 24 Feb 2026 08:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jG5uwvWU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6881F099C;
	Tue, 24 Feb 2026 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771921085; cv=fail; b=LtyZERBXW4sUizdNVDxcCggrVZouOtx9ANL1Edbg3I/HQdo0PMk5N0TaNLa1l8ESig2Ktgb2uML13qfa/9UC2Fz9GqtgsO0112wATesRKRQK17FpPKoQ2NAhx+q3x/rIgv4KOADBUcSnxR9+BEKGQlKOiCjIR559xSDKecixth8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771921085; c=relaxed/simple;
	bh=7iVxFltkVqtVW0U/njL/dZIz7eKGsBCdzvELqj6NOTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M/vfcmJjaP+S2FwYc59TNdWvBteE8PNGYBkVZD1k+sOQT+YxWzW7D749vqmt6QQ3z9s/jVQlQGXMjiRjsAi26ccyhvMVxqH0tG07ZVqA9ATOEhUgocpYSWb23zgCvlZDq+f5k8Qg01lALeFz2GdNmp4dZiLi8NcYRv/8WW0OHN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jG5uwvWU; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxK1lISG9TM/9+UzhANCkE59WQ6LxBInmoOJFWhrDzsZxp2rWJx2KfjHls0lqETdD4qHzhkKroOxmQk5DY7YoPh9BZF5EdflXAiKr0xsY514GB/AP++ONA+nWHcaQP+lo7yIcRxkMT5LMp7v8kDkHYYL9qwVa0tOyPmM6YDJUV+9MURv7Hg9SqNh5hsEIjwExDIYuYtsa5QfgCEgkVRMeLYmei038vcTTBoLztjc4Ku6dyxzyRPlSPrlrLh0Qz7xskAIYWBC0kKSoDf/r8eTOuAB5nj1TGEu1J1fNXzipqbzkT9GrP2HCwuFV2AOzv/zAxEC4w48S1OlWBHTy1NUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euSUNJSUULE/coreshxYk6+M1SSHUjQQhKW5ZRU/rlg=;
 b=blcWNSR+UN+GWIafE4HJf4GQhNOmLuFFwjJWOvq43Tj+ogjL4YOo67pgJC3bnvdDECYGzJ0RkYjlopxZlMZ6sN9Vg1rHiyCdNDXgVyX24o8lXIgGHOJJD/jg+IGBkPcq/wlv4I2hpvlfPqSjTg+aeKrPthC8khqfdegVJvSSyYbxlJWzz1vCiTY4ciGnTC/tFrwEPWoCU/xaND22ccCcQB9yk3uXI0nQlxTcAc2Q8WcvfSQ+O70N9MykpZfZxAP81bPMH91DkAE0oSeK5TvUHgMdZTRv19X66Ok8ktcpjwNG41mHB34czmYElPvHS9DYhtggdpz+0yrAOYQlTWW8lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euSUNJSUULE/coreshxYk6+M1SSHUjQQhKW5ZRU/rlg=;
 b=jG5uwvWUvevTWQV/bFReYix/4QNz0kU03x3IKAHJisJj9jzCimH5HEVzabGWNpDwKPcroxlsCIKfrAG+cPcf1Aw49cvxDFRqWKeOByudvvZwNjebCCFLh+eCj+jwLzICXlfJQFkx1DJZproIWf+sOEZdsLvOL6lnZLPuE6Ula/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB8746.jpnprd01.prod.outlook.com (2603:1096:604:152::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 08:17:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 08:17:56 +0000
Date: Tue, 24 Feb 2026 09:17:33 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>,
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"magnus.damm" <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v5 09/20] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <aZ1enW9PpGn1tEMZ@tom-desktop>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB113460BED5F6F944C0FD4DDB8866FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113460BED5F6F944C0FD4DDB8866FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: bee2bd08-445d-4571-cc7f-08de737d3703
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?w09vdcMgKPXoZKI9yoMnsrDt/WXEHGU3wP632RMbdnLZF37LfeXWvKo8NzFK?=
 =?us-ascii?Q?Xpz3FamMsFtuR0p7uYG/1/JzAhTAFilio1G+XbRZHlxlO1ojj2GsV0o6gc33?=
 =?us-ascii?Q?SJ/072EwI/IMqq5JhRhFUW68KlpHtPevSh57j/FDp/3j8+Ib11HFe3w41zF6?=
 =?us-ascii?Q?+nHo70suM0d/OjhFfmP8Py2vxK3lFavidXXxw6QZ5YQ5hp8AvQ/fZvQ+3bNF?=
 =?us-ascii?Q?aDP0HqlGfYR3JQxEIRxVQoGR9k7+bZFRMfaQJaaY10LAVlRhyLmD7JT3h3WP?=
 =?us-ascii?Q?TNdyhi5A1MwJ80aMPCFkecmI1JQZ8sp50GvrOfUec0BK5J0G1KIgsjeV0yT0?=
 =?us-ascii?Q?PZggtdcFnXVTAcivLvQxws6IR4mTjdi6ZmDTMcLUW6obSLgkNR0pReGpUwFO?=
 =?us-ascii?Q?viAeDmziG0zdUEmMMQAgOq90A+UUzk2Sz3Id+9zokQzgZsE/IddPSxmJ7jgf?=
 =?us-ascii?Q?FYM+yFPHY83vLkzwtzMCeSdyNAtXc7NIvavUwVLcCbSOHby7Kgj9t7aid3ry?=
 =?us-ascii?Q?mXhHLVZCg7jyuQXB4HgIvzlGF0Gn9jW6P4zg/kpzCxSJYD4KeEHjEQWH4jBW?=
 =?us-ascii?Q?2r05dYlgI4psEEp80bUI3tiFveF96wtcMkcg1Xu1DkZiGsOM2wZEuOHxsdzL?=
 =?us-ascii?Q?CIZo9NaPSwjioaNcbbD28ZomnDwPIAT9S28HkvBfp27WJWssVHeS/MAFtIY1?=
 =?us-ascii?Q?mZh7B3GCv2amcoYga4kcHqGo4K1cuyVJ7JTcT6aB/BkESscqqBeRO2g804MO?=
 =?us-ascii?Q?tUM3zcPIWotInfUWehz2zlqcaJ4m7gA8mIUSi2fUyFwBqVutPHKA7BWpiTMk?=
 =?us-ascii?Q?WPxwlk7LckH08kl1t3NpAogDx/xw/MHUfkOcPzqhVqdobsdsw3SzslYQ7aQN?=
 =?us-ascii?Q?bZbPLKFaFzimufCgNNT31H6CIvzOiKV000ACyP6ulFVXv9LNTbH+rqd+FhZ3?=
 =?us-ascii?Q?20h4FIC0Nngk/bj6OIvuGqlJ9aOFR46nqmYU15wTieWsIYu/5WPXKVJr7MwG?=
 =?us-ascii?Q?cOPnyZ2IyPdXww+yik6zA4MCxNS884c4e6/A76hUpn2OuyluuXmAR1+nWfUE?=
 =?us-ascii?Q?RtAlwM8RbnyS7A94bEs69KfWSYlT50XX593nboL2WuOuQC8p2NF/l+4MY8UC?=
 =?us-ascii?Q?b+dPey0wHotYpDslXTTgZOtZvNVQR22CBxUdhSAQeYOkmJgYJB8KdAXG7jJM?=
 =?us-ascii?Q?9PvipCp0In0zdZcnmXwKiS9DkT127UOHVtJBfhCvOQNmNlSPXv9ZDcMV9nNP?=
 =?us-ascii?Q?otvTNjyhaME2TaYV5rESz4qMiBihXinYKoOLiCD8LdkvNwYGRAEQpxTh2PBa?=
 =?us-ascii?Q?S20Azq62wWvuDQH+zjmvO2Vc/9WU57u6C1V+RTR3RnBlMFVNCmLLfZJ41XCD?=
 =?us-ascii?Q?gebkIcwxpyPAu+mgk255u6Hpcgoe3kL2B3znNCWdbA9gdteO3SFSOdVYKvZ6?=
 =?us-ascii?Q?FZvVDwp1cEQvAQwvy6PZJGQUCX1pYLRxeBzXcIfyvd/dsfzF89m+TUoCySBv?=
 =?us-ascii?Q?QcWVR2cBCO03VT2s4EaU8fvPMa7b3Thki1uZUOicaNW99C/dY/omMOqqztmI?=
 =?us-ascii?Q?MmWylq/9+zQwNUGlu2e41e8PGWR9sLKKlATHfvUduy5jeAG0Lv1CC5LCOKQL?=
 =?us-ascii?Q?yg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?J+Fs3S2Lwi3Du5cJGiPp9mhLUu1wduwTeRFuEeydl66s9VN7OLM3dnn3+Bqc?=
 =?us-ascii?Q?Y6PeMpq84/454FLfup5ZPPGqoPYAPZX07t8Jqg0ju255ENrCl+0xAUgScYrl?=
 =?us-ascii?Q?If9ya+dfGS9Wm4o7N2hCoKcaMcL/cz8/SDE+/H2/akBQHKKvBK1EuZENgvDt?=
 =?us-ascii?Q?ObcjLODjG+iD0hIzWunPfa/pzTl/pgIa0eNxE6cPjkz8tfNJ7hgZNyc+hHUu?=
 =?us-ascii?Q?8o1mpLnq4KCQQmWFi0aNsfdRWNDUJkszFQ/TvGHAh0RH8ezVQJcBW79RO4EQ?=
 =?us-ascii?Q?avS2YtX9+4F9EEBGet7Z/r/YRGdACG8XEOEan/RlzC7vJIiNo5t7gOjz/aME?=
 =?us-ascii?Q?GUsJtpxw/Ko+sinLMhU8wtkyOgw1AmW1kKGNmTKnwZh2g3TQyzFRnJNwLuBY?=
 =?us-ascii?Q?7S6j5VTXZE5JJ+mGDID9i1YGUAXVD1ytqL+YMIjsCNb2ywbGfaPXRTmiCyBj?=
 =?us-ascii?Q?VEYqrHiqK7Gu4+56Te8P5hy0kfWuI9sIbiqHaFoe6wAjf6hDsmCfZE6uDbkv?=
 =?us-ascii?Q?gLlklBATTAhUhXBHtIdORwIVBvTVfGA/zpKEeldMnhKeYz5wVCGN82QIfKPc?=
 =?us-ascii?Q?hAp+MgyE2twqh5F2tI6XykCkY/8odFE4o4kzWB/JNCi1BKn9gQPpWHWmucMC?=
 =?us-ascii?Q?G5Qc62YQtNm9v5NuUyh+iIHdZ5YKgBZa/qYWUdbQJSZkv7cPV55tsBleIBFz?=
 =?us-ascii?Q?rLodE+Wj1bFIIzzvBAwHyUfao+a6MJiyTEeiqEBBbmyfUdxwGOim4hDIZcFL?=
 =?us-ascii?Q?3Y04OaCqH/5cFmMl2Popk3C1xgylr0QlBiCTvDzRsJAaRf3Zi81nV+ACUqlJ?=
 =?us-ascii?Q?Z6cBjAdcVM2W5e0r0XXQKmU2iL5O5buuQWdU3Acid96yVDYzHUP9J1XtZVuY?=
 =?us-ascii?Q?lun0CUVBaDrM24PV3h4SAMl7UFRjcKvQjiTAbTBTJ6CO/cJB8DFdBlJ+x6Ug?=
 =?us-ascii?Q?5YAFIidGu0krBKyCI866Ywkd3mAOHDgNdvjXhy+XO8QPaHw0J9zuujLxhJqc?=
 =?us-ascii?Q?pShHue7gioy4CFNRIWO/XN2yWvLIABUWisiOm/tt1RQq6wPq81lwzP3dzJrb?=
 =?us-ascii?Q?LRV30+GNh7NkbWNrnLT+HkGA192RF67whjztPYh0d/DONFfr6ET7c0gZXxT3?=
 =?us-ascii?Q?25kPNdqhtc2uZYtkTvHpHnpCOCJx1UAfuk8CmJbwUlD0f0ZW93KF5m4F7r9I?=
 =?us-ascii?Q?gvoETvMfq6+d60Mq+H93jN5osJlqMRMjst+u2iesvCNLKxKBCfcsp26d9rmm?=
 =?us-ascii?Q?DiOZsvVhccK2Ba9RtMVRUuV4w0MozzSDjFFDkIdBmfj2hwYyU2LIIQcBsKUz?=
 =?us-ascii?Q?tVEGp6OJrU7LqFjf7ec2dVdkeSTPRsB4FIS74db+sWV7lncTdT2Q0fpF+2wq?=
 =?us-ascii?Q?T7ABgYanh0NDHtjHm6I/AvhoEKtuXDubwc3f6OEHaVKy+d/KKTrmRTk5Bo2t?=
 =?us-ascii?Q?M7e7rduhaPBU1d5rkn797VWw4fkc06ADl4dzL1odhyDuj0LNhRbuHJaVWlHn?=
 =?us-ascii?Q?pZ1+E+7lOxcyfcgLHFevTzAyEAjev3S7ooesOBoI7OCDnYhXDHTTSH3ePjek?=
 =?us-ascii?Q?XWTLZ9nusC3nfbqJ7I6vKuBPjdiFetyRMg/4V6c55nQHOelDGxiTx7dhSEjL?=
 =?us-ascii?Q?YPHz4VcXwG6ehI4JHlsKr8ssj9MoFA0yJTgiOfYwYZgeze4gc7dw93xAU+y2?=
 =?us-ascii?Q?xImxgjawSWKTSPJxkLP/2ytDz1NXHvxWf0yl3Md7OjE7AvwMDR0Z/peAwepY?=
 =?us-ascii?Q?ESfdA0XN/8PRO8NeZ9stiP37mZu3/rDmcj89lStFEaOSRuYdeWGw?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee2bd08-445d-4571-cc7f-08de737d3703
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 08:17:56.8837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7HGuuHuyAb1PStsU+qJ8BVw9kAfNHJP6IrcpL9AGhZ5IURgvHrotZsyxB1tVJCovPqqBVADolQBZWWDNBxLfLotlDWOf1IB7vTtn4SFHDx515z+1u1I5/AHpEsmlULN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8746
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,ideasonboard.com,vger.kernel.org,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-28421-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,0.0.0.2:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,renesas.com:email,0.0.0.3:email]
X-Rspamd-Queue-Id: 280B818386D
X-Rspamd-Action: no action

Hi Biju,
Thanks for your review.

On Sun, Feb 15, 2026 at 08:11:37AM +0000, Biju Das wrote:
> Hi Tommaso,
> 
> Thanks for the patch.
> 
> > -----Original Message-----
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Sent: 13 February 2026 16:28
> > Subject: [PATCH v5 09/20] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
> > 
> > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression Processor (FCPVD), a Video
> > Signal Processor (VSPD), Video Signal Processor (VSPD), and Display Unit (DU).
> > 
> >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > 
> > Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v4->v5:
> >  - Dropped renesas,id property and updated bindings
> >    accordingly.
> > 
> > v2->v3:
> >  - No changes.
> > 
> > v2->v3:
> >  - No changes.
> > 
> > v1->v2:
> >  - Use single compatible string instead of multiple compatible strings
> >    for the two DU instances, leveraging a 'renesas,id' property to
> >    differentiate between DU0 and DU1.
> >  - Updated commit message accordingly.
> > 
> >  .../bindings/display/renesas,rzg2l-du.yaml    | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > index 2cc66dcef870..be50b153d651 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > @@ -20,6 +20,7 @@ properties:
> >        - enum:
> >            - renesas,r9a07g043u-du # RZ/G2UL
> >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > +          - renesas,r9a09g047-du # RZ/G3E
> >            - renesas,r9a09g057-du # RZ/V2H(P)
> >        - items:
> >            - enum:
> > @@ -137,6 +138,27 @@ allOf:
> > 
> >            required:
> >              - port@0
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g047-du
> > +    then:
> > +      properties:
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DSI
> > +            port@1:
> > +              description: LVDS Channel 0
> > +            port@2:
> > +              description: LVDS Channel 1
> > +            port@3:
> > +              description: DPAD
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> 
> 
> LCDC0 has port@0, port@1 and port@2
> LCDC1 has port@0, port@1 and port@3
> 
> Looks like from the above port@2 and port@3 are optional??
> 
> Also not sure to make port@1 for DPAD for consistency with RZ/G2L??
> Do you see any advantage by making port@1 for LVDS0?


DSI and LVDS channel 1 are the common ports for LCDC0 and LCDC1.
On v5 I mistakenly entered the wrong required ports.

I plan to update this ports numbering/description to:

      properties:
        ports:
          properties:
            port@0:
              description: DSI
            port@1:
              description: DPAD
            port@2:
              description: LVDS, Channel 0
            port@3:
              description: LVDS, Channel 1

Also fixing the required ports to:

          required:
            - port@0
            - port@3

I think I miss to update also the patternProperties to 3.
I'll fix that in v6.

Kind Regards,
Tommaso

 
> Cheers,
> Biju
> 
> 

