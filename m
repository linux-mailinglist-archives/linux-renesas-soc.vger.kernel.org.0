Return-Path: <linux-renesas-soc+bounces-31313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC4ZKD564GlahgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 07:57:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3702840A83C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 07:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4953A30D06FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 05:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF96346E56;
	Thu, 16 Apr 2026 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V50n6nTY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013038.outbound.protection.outlook.com [52.101.83.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8786C3793B4;
	Thu, 16 Apr 2026 05:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776318720; cv=fail; b=NEskoBwuXmEx/l1m1yiOE9HD6VMG9OIX0IC7X2Z19zIU/X4MQ9GKS1/hkOf8NCiXgg+67G2h8whqYa7N8hTcKB8Tr6KIRaYynGvG66CK+K539ClxL9Oa1zE0r+6rSUtassH4XcjNxSCx1x9pgyupbrRlPx52KSZ9Bn5LbIwj80s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776318720; c=relaxed/simple;
	bh=Z6Qxz5cDSovFK5vlYP7sOrpYI9Cms3Zp+7dMcw12EWc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DCYqN5ud6lYYf2YRSpd7fmfYWF4dnirvlyDM4+L+G4U+zxRPYRUIogUasTXy9rBT/dKO6uhnBYbhz0I7eJwqK3HJoToesykR5HjIXlxH7DMPReiSfcWp3xTO93+b4GfdlNafIPpBYCMlZn1z6jDmAcBIQ+IHUq0A+lUS+tO64IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V50n6nTY; arc=fail smtp.client-ip=52.101.83.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gm5phyntRkp6LEQsuSvgnGnCT0oi5LsdWDb4U6uAhPVYGt20zj7WQn5AfToZIxVjew4BeDWt3FkkKjKxHI/EnBxg22s9Gzv6QZSHNXBgbNX4pcNxV2P190GdcAZh1362mA31F2ObVdnesaptsydQXlw9sM7nzOB8Wvy/P0+J8M1WGBq8xgFmbB43SyK7RSxpezN4pVpG3acxFakWXvSp6DPg2ZQMF2Gc1wgUUNetTJ9vvuFmxcc4KzGWdYghZeG+SNhKvR60xUCCcja5l+RVAdErgo+M2BVTyTyrFW4U+2Lv32c2ljRuLB9ZZQch4f0EHFQBUUNlD+OTgDXynOahMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxhjXNxh1pRZO6YGBy4b8Qrog19/e4xYH3JYzdU2f1k=;
 b=GP+jGtbXsDHNCFeoueyWb9scUIliMsSk01Fzy+nejhRnEOye1myGSEKzuJrmt/sPNtipx7I+IxYpiIwlhCuKQMaenqCz3Dk5jhB7osSBzDwiB0WQJMSUlqxXAnbWrdxA2lUwC3rUdZfx243qfqWON9jNx0dyglsQ3OJEHOrix2H4UwZzlpwTka16PN9WvQNh9eFrXCx1R0V9T5myRQX8NYE58855rL1SDbHsdQxe/nYgWUeZeQU7jOCkJqPq83lVM7fXpsvOwQuaNLngzaQVEilWEa5PDwXBQS6Cs9yr8sPXeQxcuqP3jW5agjsE6WSWAfy3CwK6F+fc0aCGvRQ0PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxhjXNxh1pRZO6YGBy4b8Qrog19/e4xYH3JYzdU2f1k=;
 b=V50n6nTYHJLQJOQ06yig7mmuWeE6FwbWfjGCDyIMyTHT89y0A2bflJK0DeeedoKJOwb8tUFZc01sxKCPTLuOIqjdGRyya4rKjnaBK0IuOabM/kjoxXKjU4fKOj7yRq97TDsnbNXrj4ERP3QAxaZum+7h4DnJPPQLLvuVKmpfTi1NSH7gTTuCyP1mGy9aICuY52kj5yKy5t76yyj2uRlpZ3ztl7IOaH41ACxLSgdme5bJQ4oKaDTxTbEqDqiejstpVVcwk84LQeltQZhguZ62LeCw7hoS7oqtFB7EYgODrQ5RmZBAj+UzgEmlFwJxeWh9okeMvNF19cQVLwLJSIV/Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7940.eurprd04.prod.outlook.com (2603:10a6:20b:240::19)
 by PAXPR04MB9092.eurprd04.prod.outlook.com (2603:10a6:102:22a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 05:51:53 +0000
Received: from AM8PR04MB7940.eurprd04.prod.outlook.com
 ([fe80::1fa8:cc0b:b501:6bc4]) by AM8PR04MB7940.eurprd04.prod.outlook.com
 ([fe80::1fa8:cc0b:b501:6bc4%3]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 05:51:53 +0000
Message-ID: <69e04806-5ad5-46f4-b65b-c88af477fd94@nxp.com>
Date: Thu, 16 Apr 2026 13:53:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ite-it6263: Add basic resume support
To: Biju <biju.das.au@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
References: <20260415113954.179006-1-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20260415113954.179006-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To AM8PR04MB7940.eurprd04.prod.outlook.com
 (2603:10a6:20b:240::19)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7940:EE_|PAXPR04MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e0aaf6-f4f8-42da-5886-08de9b7c42b0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 PIfgXc/6BMOD76OL0uB8d5bcFLSmUn99+muwc8NzYl75medSmoDqRgxereTS5FdHGegZsuO6JGX/xm/OaC1qzmJus1C5uFewlYFMtEOuFn2xQLZL1iz208AA4kSjoUGMg7Ze7cQJljPdmMWZHdScjtGBOimkcD432iQX/qkG2lgzTOBXSFoOm9WN8bKBkzD6wKI9oeiZXeTynzN2eUgj9V356SOwMwc7/Np0u1T1LWlxZvZ+unkeyQXj3b2WIFrABc9vj7788F70BMVfoXjQbEIFRB4wgI7CzLiTDWmAMa4fk0JDOwy8UIt0Nn0KOBlWuHjIM6NpGQuIwc68wdig6bCu6Gfzx0i7fuoZ3zJcOGq76cBCXDPdVHdqrK0oeXTRaYS2dEUCc5GEU1jyowbutZUvWDqxlusARzXk4ROiggRP3rgY9pUwPj7mfXJMuS/gsQ4lha8UAKiUuVi8ZvdbnHTSBMxBnp7j5to6JYDDlBXmCUPWgrNpjVe/RYdq1smtaM2eLovc0fO8GJ0vap85dhJSDGrBe0fpVd9iU6FiYD52VjoPX/SLI46L/12xrJX5sJWfEKd9VuNfvhz7ieD1JynD4RmOFuG868aAxx4LfMmVuz3CimsvoAoZKjpRkpbnZN431j5cb2B+rt3gnlanEKwOtbGftGWLnUo8Aj92K91jXH0MxPJeV4jG4Jdr/8LAim8qIOBaJ1joQq5RP+SnOWgrm/ep9sYMQrnWQsqFJYU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7940.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MUZQRXdLaVJCUGEyZkZabTJKVERNZGREcVVEeG1wdkMrUGtDanpBY0Z4WFZD?=
 =?utf-8?B?dXpKMlEvNDV2NkJrMnhjUkFQOTZTTWw1UU9tcHV2QlRWemhxY29TMWJHanJS?=
 =?utf-8?B?aUUvZzMrSE9Xbjg5SithYzI1bTJkSEtGREdDejQ3aXl2bFlPZ2gvVzY3YjNi?=
 =?utf-8?B?REQvWUVUcmdQOWd4UXdwVU9SMm0zRHBXTHJrNGQvNzlNUGpVWm5FdmdBYTdT?=
 =?utf-8?B?VnpETk9UM2tUSlNrWWM5ZjlZOWxxR1JUa3hrbytpN1NoUmlKOHNXaS90b3R4?=
 =?utf-8?B?R3B6MWNabXREMUFMWVBGSngzLzM0ZVQvZlJ0b3RPU1ArTTA0UldMSjI5TW5J?=
 =?utf-8?B?eUxpWXp5WGVFaE5yVEp0RzkrelVyQ0tUMFpYTzVheGdSQzdNZGZBd0hVd3VE?=
 =?utf-8?B?bUVBOHc0Z3hQUytpTmpaMGoxckxmNXNEUjBneDRiUGUzMllNbS9EK05FMzZ5?=
 =?utf-8?B?MjRoMDBFV0FQaHRIVFdjV0xMcHBTK3AzNEhvNFFDUnYwb2ViVlozM25YcnQx?=
 =?utf-8?B?SG1aekxoRkdEMjc4WE9INmtDbzNaQ3JRSkFPWjFYMUs1UHdBWC9SRzVwZzRR?=
 =?utf-8?B?WUlqNDZaSHBjMTY0dDdFVk9jNndmb3NJWW1QSDBjRGFzbWFlbTZIN1hyVW5q?=
 =?utf-8?B?TDgxNGthYmtsNWRUcEwxZlUrb0FmSGl0c21SeDh5K3liL05vSmxGZGVRTkI2?=
 =?utf-8?B?VkM0Smc5eGdNaGFKYXM4MGFwd1RXOGQ5UDNTczFHWFhPZXpSZzM2NTY1bXht?=
 =?utf-8?B?R3BQZGZYclRQREtNWkZhTlRHR2FLbEV6bkhpYWpvT1FpWEUyT2hVTndhU0Fl?=
 =?utf-8?B?ZUNQOGREdkNvWWFLT3hseldFWXpwM2FmMkFWOGt0MlphelUwTGxTall6TUJ3?=
 =?utf-8?B?OXdBcWIyelYzSDloa1dmSGFNcFc0SjlpWDhlY2J0cnBsekxxWmxDTk9nTUR5?=
 =?utf-8?B?alRHMFJVMlprbkdNb0kwYm0rRnNzRlV0cHZlSzJxYzdrYXRjWnI1b2t6RFFi?=
 =?utf-8?B?UDZ6QnR3RWlzZFgwL3lGSWlBajFCVVlYZkpjeDFXZXpBZlBDZ2F2dzZDaXpl?=
 =?utf-8?B?REdFSGNuNHZnaTBtaFQrVzc5bnR6ajVBMy9Md1VmazdYYzlzM3VSSGRGMHVR?=
 =?utf-8?B?OXBqVUIrWDFTVGc4SWQwTDNWZGVHSHh0MzFOK2xudGRTRkQzSFpsZVVvOVZH?=
 =?utf-8?B?YzE0bGJla1RsOVRnNjEvWUU1ZUhNeFhLd0NjcUpiaGVwbUh2U0xtWVJQRS9V?=
 =?utf-8?B?SG9tdkJiNTRFLzd6THYrQlVlbTRyYVoyTWh4WGE4S0kwa2dJQVExdG1Ick1R?=
 =?utf-8?B?QmVRNDhYd292ZXB4K2MwUTVnNDhWTlhHN20zQVJYMGpQbVBaR3N3NCtoWkMx?=
 =?utf-8?B?UWMyWFZDOXI0eUR6dEdaZGEycHg3SnUyM1VjYjgxcGd0emhlSER1QjI0K3RT?=
 =?utf-8?B?VTZKSU9pTzZZRUJoOTc0d0N4TDJITGNTS3o2cHFCTUxjSWtoemIxYnhMRE5F?=
 =?utf-8?B?WGpTa1dBekd4RlRuL3hINmJpcW5jbnJsa1htbWZVSVBpMThOREtESC9VcUJn?=
 =?utf-8?B?WmhaUElQT01yMm03SU03eWRDcGZSNFErbm93YUE5UVBVZm1KRnhzRXUzUWxR?=
 =?utf-8?B?ZmFPU0Z2US9IbFhPeXVVdnlKSHk1R2JSdlBYSllCdlB4eTA3VU1aSExsaVZR?=
 =?utf-8?B?QU9ROG5zeFh2S1hNWTMvNlBFU1FreGt0dFc0dk1qeHpiN0RObUdHcjhtR1Fo?=
 =?utf-8?B?NE8veVYzVll6eFdSUjdHTGs2Q2J1blZuZDQ0RnZJOFJBcW5lZ2tqZTY1MVp6?=
 =?utf-8?B?ck51TWhYOWdJTEFuWXBNTWs5WHA4eUR5WXBTL25oc2NRa0JsNnEvYkdZd2o3?=
 =?utf-8?B?RUpNdVlPWGx0cXJiRDlaWHlBSVE4ZDk5SkJwWlFJSHRTWVE1bkk3Q0N1Q0JL?=
 =?utf-8?B?bXErNW1Mc3AwWE5sUlRpQXdteHJpMzRRUmtLWXlVSU1MeUR1YURIV0Yxd1Uv?=
 =?utf-8?B?STF5cEg4SXVjSVUzQ0FXNWtiTHFjV1FWeGpJbCtrSWY4amNYdGRMdWdhUEls?=
 =?utf-8?B?YlZ1S0VpYTNpZFgwZ2NGT1JjcDlLQkZzVXZxN3pmbm9xZHgycDFiZkpGNGNo?=
 =?utf-8?B?VXBnUURaSk1IV1RCbGwyazNVZ1hHVERvVFlSUGdiUThlaEdKMW9EY0F4UU04?=
 =?utf-8?B?L1NTaDdqOGx5M0VUZk03d3BkY05IWmo1T1hBdXVGZ21kTFVLVjRSeU5qZXJS?=
 =?utf-8?B?dHRrSllaMnhURVlRQjk3QkN4QXVRbzJXZ1BVVXQydlUxdzlJRjRDeXlZTHFU?=
 =?utf-8?B?Q1gxSXJFeTJVQldxWTRXUnFlRldPdGRZWG5CSTRUblFsN0NZOEQrUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e0aaf6-f4f8-42da-5886-08de9b7c42b0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7940.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 05:51:53.4395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKyjBKS3z0xz/WBrxEMo7+PDhgAYJfChNS1e1nG1FVMSskZPhStODYTs+lY4P+LcJoBcMIQH3fLCE9/VsQKL1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9092
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31313-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[18];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,nxp.com:dkim,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3702840A83C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, Apr 15, 2026 at 12:39:52PM +0100, Biju wrote:
> [You don't often get email from biju.das.au@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> RZ/G3L SMARC EVK has a single-link LVDS connected to an ITE IT6263 chip.
> On the RZ/G3L SMARC EVK using PSCI, s2ram powers down the ITE IT6263 chip.
> Add a minimal system resume callback to restore the bridge after s2ram.
> The it6263_resume() callback re-establishes the LVDS I2C address and
> reconfigures the LVDS output. Wire it into a dev_pm_ops struct using
> SET_SYSTEM_SLEEP_PM_OPS with no suspend handler, and attach it to the
> driver via pm_sleep_ptr().

drm_mode_config_helper_{suspend,resume} called by a display controller
driver's system PM callbacks should be able to kind of provide system
PM for this bridge through this bridge driver's atomic_{disable,enable}
callbacks.  To do this, regulator enablement, GPIO reset control and
bridge initialization need to be moved from probe to atomic_enable,
plus regulator disablement needs to be added to atomic_disable.
The bridge initialization includes it6263_lvds_set_i2c_addr(),
it6263_lvds_config() and it6263_hdmi_config().  Make sense?

> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> index 4f3ebb7af4d4..9727ebef48e8 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -906,6 +906,24 @@ static int it6263_probe(struct i2c_client *client)
>         return devm_drm_bridge_add(dev, &it->bridge);
>  }
> 
> +static int it6263_resume(struct device *dev)
> +{
> +       struct it6263 *it = dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret = it6263_lvds_set_i2c_addr(it);
> +       if (ret)
> +               return ret;
> +
> +       it6263_lvds_config(it);
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops it6263_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(NULL, it6263_resume)
> +};
> +
>  static const struct of_device_id it6263_of_match[] = {
>         { .compatible = "ite,it6263", },
>         { }
> @@ -922,6 +940,7 @@ static struct i2c_driver it6263_driver = {
>         .probe = it6263_probe,
>         .driver = {
>                 .name = "it6263",
> +               .pm = pm_sleep_ptr(&it6263_pm_ops),
>                 .of_match_table = it6263_of_match,
>         },
>         .id_table = it6263_i2c_ids,
> --
> 2.43.0
> 

-- 
Regards,
Liu Ying

