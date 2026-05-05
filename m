Return-Path: <linux-renesas-soc+bounces-32004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NpQKriM+Wkc9wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 08:22:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CA34C730B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 08:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BE22301A164
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 06:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A583C3439;
	Tue,  5 May 2026 06:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mbMPepZi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013045.outbound.protection.outlook.com [52.101.72.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32883C3430;
	Tue,  5 May 2026 06:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777962166; cv=fail; b=EYZMx7PDpz79flG3OdroHyjPO5OgumFWyH4qo/fg+5A+c38eNk3WampKdqDe8Zr/QZoTlmppVI70zxiKxm8RijwW0Z0XoUDxgnch70SHNeJsD+PHBFC8k+pbHByvmHsZF4dn39ePTTpVof4GtYHEfbkkdcsm8s465MwIEm48EwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777962166; c=relaxed/simple;
	bh=IW4NgpOHpN6rolQeJd3XS/CVDiCTHQoFRimxwL+r370=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=t45r0BR9YLFdzJ+NIWr0B68C3598JQOPMT1A1mRP7FFsBxd515zKOjhdavUdzuphI1v/M4mkYCZRNo6cfP69e3f7TmeOMHKysKbvvTrDawtJqqNcRAzZQzQVIHYkrhxggE6Gmlm+ZYRFKywNnmux0Cgq0M1TDZ2eHwJDHGGrosg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mbMPepZi; arc=fail smtp.client-ip=52.101.72.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpK8VYkRkpDKvvl7PP36WGTPUKEJ3YIvFkl5fhSX9RAwpr0eBZhIw2+yB4sCYr8UCCJOAq+Ud+whmQHajh/ohKAdD3KBRHiuSyGBcCRhBKbZBmgJanbUKfy0f22Qf8YT8u39Rn3FT2ywj6iAsqGu5qewjdqmuQ+chohfIHhVOjF87Jp33NHgQ1oh5dblJt3CxhKvsLsEcen/yjJuBLaYkKK4Ws+CUIfdBszZGrB9C1vJub2UYUOn+l1+e8LhYlCsU+VGbX3vVpB5cg48wDJS4O1yrTYsRanqNpovLyALzbG3BVuFgvlt/v67V1rp4sNMl52yjZ1sBfZdTAfeJMKl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQMlQBGQhloadyC7AvPSnTnNwI89q7w6XLmj2q9B/2o=;
 b=WcbAwwGC/X3/pydZ1Vs9f5ziZeLoBUdzXqIL6QQgdv6+9s1w4o7p91w7TmOPU2L/MLUi9YpOYk7PgccfNuV7xgJP3wMG5ckGsOHUaF/5YhI9Xe4J0uApN6F1smhBFDb4sg39nhGs8ZO0YnKXhHKFcq3rN1vevncDACtMbUIGXrkiI9y0D9cLVRp3dvZCddpTpu8I3frSijiSfqJ9KcHBXpwFufUWKj7tzcajp9ynBacYv5f+x407CagLGhOlOD702wmICnyMSjTWrMfA5LFdiDWF98TWhLq81dRKo1fz7t4Z6Hh/9XXsW574HU6rD/nil9RpjBrk79VcenG9FNAp5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQMlQBGQhloadyC7AvPSnTnNwI89q7w6XLmj2q9B/2o=;
 b=mbMPepZiCxGEesjBSXEXB62iaYJN6cIYBpiLRqpk2QHAzGlP3QkOlzLEAfH3LnShVeQCz/pBceg5ee71yLwq/IhxhJb9od3a3hut/OOJgo9d64WPy4orsVJE9tAxi0BKhjQMYvpAGuZZ7N5ifJny/z8PkOpWa0YAYKcWWtq4tUoHIUPCDT3heoMbIP3wtSrAf2zDCqbpTq0ZM/Av2VFeRxxXV7heTAAn+iicL4zZRAa4oqPlD5I6dIOLFjYtym9ASv3/iMTFOY4DS4p/Lwz9K94WN508jJXbMbqBYt5fOnEEJILQaDnR78PLQ7xa67e8wqKTt0XsGxcKsUVSfWyk8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by AM9PR04MB7667.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 06:22:40 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 06:22:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] drm/bridge: ite-it6263: Drop unnecessary blank line
From: Liu Ying <victor.liu@nxp.com>
To: Biju <biju.das.au@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260504145906.155198-1-biju.das.jz@bp.renesas.com>
References: <20260504145906.155198-1-biju.das.jz@bp.renesas.com>
Date: Tue, 05 May 2026 14:23:53 +0800
Message-Id: <177796223304.2945775.255562511721356947.b4-review@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|AM9PR04MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 3519b504-3e5d-48ba-f820-08deaa6eb58e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 j7YDPTjjAZgfXgaUTvt1mlAp/ljyKzd2t1l0CL5oYS459s+S9hkEwLLuL0vZhGMDrh+zw4H0iAzN01tTECK6ONcpnvX6GwTt0IkY1dkOmBBsnwKPube4kHlTY1L25+VnUFCoCZodlh1YO5kD/cXwDvcN6fWN3O6Q+LzpWXA+sNCwtGZGutARGxuDe127mVEoiB5xnTV1GE7PIEY0UlGtCcGoyUFLQlC99Pu6ZYYxVtffaQD0vhVo+7bKY3dUbZYBTsXDRNqZD/W0gZPmvPSZG1WS7+7BGg38DvCQNjn8jWfCMPFXKHtL9yful20mw0Ec59ZncMJDgKyXLbXDyrMMreUIR/b9uRujcoP42Si+ShxJeBD6DgD8LneveYPMBLXXvCunqXwmGkK3KXPjKebvV03j1i0D+QBnRrjXTxs+IUuBEo2CH1v3M+JV4SoCtXXsqWOXC96Eb2sE95vkOkxAUZsSQvFk+P3nxK4saQ9lAmSQa9G2aojAyJKx145XeAVnaj6grnL/Mu+ds2bpNBegDGRRTtW2erNEzqJ2CNLU8W2C1/RWOvh6JxMDWblVIldySRJWRyYt493PskY/SHaEJRYpXsU2cBrgFwdIk+w3GTVQvFgMk5a5brZ7r99FFHX749lLFXsvrdRosLfSvDdHPOs6D9bTeS0qKo28cLKaZxX+gND4NchZakOOA5xnFFCM4NkD1LL/m8ghkUN1cSWZ40o0/H35WF/nWZbqZMTKAt/IA2uLnuwsrND1DsURQErn
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cHZ5ZmRLMjJseXJmcm9QQWJFWnhFd0pUM3F3WG9TbWpRVW5ZV3E2NXRDV0dK?=
 =?utf-8?B?L2NUVlVsYkp1QVdsaTlFWDY1eXgxY056a2xBeTZ2Z3RPQXFWUlhSK3ZKWG9p?=
 =?utf-8?B?U3QxZXhmNy9oZnVLVVFYczd2TVhSTFVRK29zT1JOTkx0dVdnSHFqeTZVOFNm?=
 =?utf-8?B?OVM4TTNZNjE3SEtTNDVJdHhEMHpPdUtaYWRwUHZuUFNiaXJQVCt4YUhiN1V1?=
 =?utf-8?B?Umk5ZFpqMWNzVU80UVNEK0lhM3pBVlF5Yk1QZjNjZGZkWndWK1U0N3RJOENQ?=
 =?utf-8?B?cW9OKy8vSUZIZk5kVkVvMkNkMnQyWFlTOEZKQzg0NnZESXJtbzcxRjJ2ZXlo?=
 =?utf-8?B?SWFEdkVidnJKdUlLQjR5SkRsZmM3SHFMUnV3M2dCM2Z3TWRHUklJTVNvdnB1?=
 =?utf-8?B?RHJrK3RPOGorWTNHZEI4bU44d2NJOWZWTWtMenRaOFFjQWNxZUFWU3RNbFMr?=
 =?utf-8?B?RW1HTllMMTNYUEsrK0hZa0pPVFhSdXhwcC9LajZIeXBnS2FnK1JzNGdzelRl?=
 =?utf-8?B?YUFZKzNtYXRwOXNCMmpUSlludG1KN1NGOUYvN1JFeldZMHdsZHhKY2dKSnhU?=
 =?utf-8?B?YkpJdmljYjRQR1B4cTJ2a3g4WFFqYTNMYnIrL2Q0bGNxZ1B1QjB4WXNVOVds?=
 =?utf-8?B?c2dWNlAxVnl6SnZjYnFseis0NkNPK1A1bjdpWU9vb09NcnJtZWs2TytEaTRP?=
 =?utf-8?B?KzVBaGNWdHYxVXBEL3dMMDZPaFZyMk8zQUFnbS9vQy83YWszcmxsekw1RFdx?=
 =?utf-8?B?citNZXJJVGc4aktjL2pBVVByNGEray9VLzBybUxjVXRxL25sVnBIT2krM1ZP?=
 =?utf-8?B?MWlGU1lBdWlDRlg0R3JhaUpPOE9aWlVXYkxQazZJMXZ2VlBIeXZNREFQdWQr?=
 =?utf-8?B?NWpZRWtqNmRnU3ZDT2hKNGtsc0dPQ2I0cmFzMkNnb0hyMXIzZHJ4WHhDc1ZK?=
 =?utf-8?B?eWtaRW4rYjRMQTZIYkVxM1ZXaGlrY3J4RDBYSUhCdG9leGhTbWNEUjczS0lG?=
 =?utf-8?B?QXJlZE1CS1FNRlN1ZDJLVFl5SmM1ZUFkbjRGL1puWEpYcXc1bjRzRWhuRzhq?=
 =?utf-8?B?dGJkUXNwVVVoYkVwMmtXWnEyUlhwdENjK2U1MCtmcVh2NWZMSGZmUmwzK1dL?=
 =?utf-8?B?OG0vOTNyYnQ3WFg0eXZnNlpIdkV6TFM1aFNRdWJiQlE4SVVVTDk4SDhCTlBW?=
 =?utf-8?B?RE43LzdEYkhVVDFPRnFHZzY4NncrVzNaQjJ1SWJOZVM2eDJSSFpTZktpVUZD?=
 =?utf-8?B?UHcreEpNeDRUMHNseUNONUJhZnRDV2F5QUpxbE1BK0UrQTBvVHdubHJzajE3?=
 =?utf-8?B?YTgzYzA2TVlPa2tYcG1DK0drTGovdlFySWhrb1ArN21nOEUvbzFXdVJBTGxJ?=
 =?utf-8?B?K0N3OVFjS2s1QmlmbkN5Ynp4ckVGYUhOVi9EYTh4OE5SK1hZZmR0dmphQzJK?=
 =?utf-8?B?cXJ0RTN0VlFOTFQ0M1JsdnBQbldEVTgwRlhwaDF5TFVTNDVxSWgxSThFTkxZ?=
 =?utf-8?B?Tit0MGJKOXJ4Z0Q5TDVvdXkrb1dETVYycFg1UW1KMzFxdnhxZnFUejNIaGdi?=
 =?utf-8?B?dDkxMzRTVzNSOUhEenNyMkkrN3V5NStHemQ4Z2hFR1NVSmtMd1R0SmkrNGht?=
 =?utf-8?B?eko1dlV1R3VhU0JxN0diL2R4STF6VmhGOTlCRmhoYTdNZEg4Zm9JMjFrQzhF?=
 =?utf-8?B?cytJb3AzOXBGU0dXU2hCYjhlTzNiOTBOY2MzWUx6RU9XeHcxNUVFdEd0MjJV?=
 =?utf-8?B?cW12aFNtdUxvQWlNNmw2Uy9SdEtBNzY4SzA1OFJFTTU3RDNiVmRZVXVWSG45?=
 =?utf-8?B?TUZJR3hwOTZHeC9VK3lxVUJPNWMxc1hBRWpsaVdLYVNOZmgrSkJMbUJRQzdu?=
 =?utf-8?B?MGJHSWh0WVk0alhtMUdGVGxlVDZoSWVxR0tYZVplMTlmWldoWFR3NE5IWGg5?=
 =?utf-8?B?d2dKdmV3bHd3bjRUMkhvQXR3L0E1Ti9nS0hyZXVkU0ROVURtOXJyZ0ZQRldJ?=
 =?utf-8?B?eDRmVWR4L2pNa0R4REhmeFJsdTZmMzRqYzhRTVptVVNCUlZOa3dXRmFxS0Nv?=
 =?utf-8?B?YTZaaVQvRWJoV2ZBVTVBVGM2TE9iOTJiWnphSWlTaUQ5UzF2eWhQWnlndjVY?=
 =?utf-8?B?UkhmZDJoTG5JbUROdUJVVEc2SGt3MEtKTytLVHRNY3VUVlpUa2I4anZaT0JZ?=
 =?utf-8?B?dFJ0cFp6amVvaGkza1VEK1BTMzc4OHNObHFEQnphK1FxMmowV1dSbG1NTjVB?=
 =?utf-8?B?UTFLeHFxMXVJRlBrVEdKaEMzQlFxdTBoYWhEdFFRcDAvNXkwTVNscnJCYkVx?=
 =?utf-8?B?MXA1VTlVL1dEVnU1eU9Ed2d6ZVJJczdyNnJiSTlRSnNuMVlkWER6Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3519b504-3e5d-48ba-f820-08deaa6eb58e
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 06:22:40.4509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DV93GoTQ2+WjKTy349ZrGwTAO2d9FkZxkI3FVZARQB2iCBzUi4fsRE8qqyIz5SE9Mn5sD31Q2chgew73oZiouw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7667
X-Rspamd-Queue-Id: 26CA34C730B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32004-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[nxp.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,bp.renesas.com,ideasonboard.com,kwiboo.se,lists.freedesktop.org,vger.kernel.org,glider.be];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, 04 May 2026 15:59:04 +0100, Biju <biju.das.au@gmail.com> wrote:
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> index 4f3ebb7af4d4..8a7fb5b2ef07 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -815,7 +815,6 @@ static int it6263_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
>  	regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
>  		     ENABLE_PKT | REPEAT_PKT);
>  
> -
>  	return 0;
>  }
>  

LGTM.

Reviewed-by: Liu Ying <victor.liu@nxp.com>

-- 
Regards,
Liu Ying


