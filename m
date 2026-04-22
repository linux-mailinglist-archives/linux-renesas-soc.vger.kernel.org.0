Return-Path: <linux-renesas-soc+bounces-31481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBn5F9xk6GmpJwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 08:04:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A06442431
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 08:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48D12304242E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 06:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF712DECCC;
	Wed, 22 Apr 2026 06:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XAi8kn7w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013020.outbound.protection.outlook.com [52.101.83.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556142505AA;
	Wed, 22 Apr 2026 06:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837820; cv=fail; b=WU+OSCZRYYcn3o8x9V1xv+tc99ihsuuPE5RMZ1dxr1H3iOvMzTS1EFIp3pwTMzeij/1a/uaj7VEKcvNQZU+anKMwdp7NVx6OsSWXFor+qiFFazskYfPxfOda3WE+jg05KkuIHEq8rHB0fGzBWhY8fgWMlnLp+/sScxhKozX3ilA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837820; c=relaxed/simple;
	bh=8Pyb6nTZrP3eD2i4ZccqRZkB9zED8X4D1LMSiTqbJBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XPxNNkfzrhZdxB2YHye7Ox2q71lG+sbaGj9B+EyHggd/vH22woOtGvHiYVoAWKMjP7fp937zibPGxSsM2oSupNM6e9waEJX7GD4M7Sb3Cpe4uCo3AOXDx6z0Magc7uZ3jxE2frspUgigZpUxKqLvf0I8e5rJMP2TtzkDvlwKBac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XAi8kn7w; arc=fail smtp.client-ip=52.101.83.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAuKF+AAgvIIQ4l5k5L1lDxgNifTXBTGPvfi/FNqOjLypKG16WkIE0ow69DJ0GRVtGPLxs7Mgqq6vUPwLBm0JOHY6HMER5qX1RqkdsuFGLwSuXRtHN57XcdSVh4JlC3Tn9Iupf1Y7gs2LHgXp3q8Az6tUS62IvSOe08RUHSlMOjEHoz/mw9ZQ/m4oQ3NKDpXtLipBKpC/hd8RmQpNHwuEJNJxxxBdJyhANwadano0VgIUEjH58zwIfZMX6txj7zfB57cI8pXYDG92KqPVXSYTlw804mcZnxGoncbkTMP3Hyj5gE7FuvQB+JZb8QtitkNKiAgf7f5O1Rxjo2RJvsurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1CSYw5Md3jb0iEwfXQKdVY2Gmx/aDXLJ5inpQ3rX4k=;
 b=rP9hWZuO2hJtz9xOFGR0vus7QMsdMppNm8LkKYCbTIOSFmseTrEJ/08di4Q5MeDVhiZdOtoZIFy+0nUvF+FtAOgk3RyscADiJZF3fzJ6aeAJWX+bTDZI0bbjWmwORVVmtfEIE8stjIWK5cqinzaP33I988DG6Qr1vb8JhBynGI3rFUv7RZWrBJi+bCCqW2fxg09SGb7TcWWOA1B+4n5l1R9KKDq/mDReEgrCxqajwDy50+h5qlvZV82ymUUdo+h8GFzuiGefmXP7hfwXaaib7s1ZhJI0wRavvflWnQ0Qmz4G5Iz272vs7cojqbvLE9IJpPgnm6Yia3E/1elFVBGA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1CSYw5Md3jb0iEwfXQKdVY2Gmx/aDXLJ5inpQ3rX4k=;
 b=XAi8kn7wS+fxrpspVb+Nd9HNCGWoiFotuLs2FVrS55EZ9FC3dXjPuq46f7ZGEG9PMPIYTIOmCzRl92c9ZyaFuYeGWrkTA+M1YirpbsU3INuZ7xeYHJny+CfP/G8N64ZOMsGuA1V2cCfnPBRo0fYGTssRZcOsNbDuJlyT70uU8g8WZQ3Fj9F8lhblHzV9oYZ4I0Nga1TI/vqHeEcsMw/dC8cuLpbIswhSuX39/A3HVdFguZ/3/y77sJUs3vU5tQEuKt6d5ofEkpK6L98N0nkecJlWL8yLuy+B7DRttR+dBtQCuBR3YzH9flRkwGR57tDTMJ4382G8QfsZPifavwOx2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7940.eurprd04.prod.outlook.com (2603:10a6:20b:240::19)
 by OSMPR04MB11293.eurprd04.prod.outlook.com (2603:10a6:e10:93::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 06:03:32 +0000
Received: from AM8PR04MB7940.eurprd04.prod.outlook.com
 ([fe80::1fa8:cc0b:b501:6bc4]) by AM8PR04MB7940.eurprd04.prod.outlook.com
 ([fe80::1fa8:cc0b:b501:6bc4%3]) with mapi id 15.20.9846.017; Wed, 22 Apr 2026
 06:03:31 +0000
Date: Wed, 22 Apr 2026 14:04:49 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Biju <biju.das.au@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge: ite-it6263: Support power cycle in runtime
Message-ID: <aehlASc3oWS47aCM@raspi>
References: <20260421105334.43411-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421105334.43411-1-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: MA5PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::15) To AM8PR04MB7940.eurprd04.prod.outlook.com
 (2603:10a6:20b:240::19)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7940:EE_|OSMPR04MB11293:EE_
X-MS-Office365-Filtering-Correlation-Id: db546573-9c71-4456-c5d0-08dea034e0ae
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|19092799006|1800799024|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 Ydv06YuGMXhMs94mIS05tdgFpeBHDm4Vf+d/OclsPiNxam1yezb+YaV1C5HOrOIIzmjqiR57y98P2kP09xlh2rdr+ITYcE3DrCJFf/FxXXfo1Z93Y3742VjveqiOlhyVg68szOqlfEfUBTJgUlQFt0Gq7z2hayCyK0V7lR7xKroVJvRyc/bfiAnJIMOzYZlNlUthSkPIVAG+8n/vJUV5q3opQEsO++O9/ERe1h6v3MPWFMvE62eYXScHhDdgHNc/tTRKQLnVhG1HI08REwGS/3PMe2m4XKLBbB3SOKsA/9+e+W9LkMVfmySGpdeV8BF8HTPVdvJAy8GG5+piSikaB40oIPPYTL01rfraLnFuCSKYQBNxuivJJibWI08RKzZ6X+mHVLhKQtEzOm4SXn4JIXb3Kpo6ExL/1aYPwfoYlfgMmBhjEiwCbCm7Z8e3tNcm7pWD0MN5ZWdFbGhymikFQ9MWFViH7JTv3zg5yi0ZKPkG3mnSys9u9Z8xM3lJjaMxH+lo1bITZY6MC+rFtbQPptBB2O1sLZC3NUaWGvmqUYsP+9IXS380tsUnu2VHZ6yb9U4bCuaqjSfRUVI7/XtgFrZgEZAQ8S73zdSFqdsMgW5JK3Wp9vcMm2fj4hTPgLzkSvYZohu26C7AiDRoxkas3+oAFvUcBnGmWtsvKyxpvL3Y+E+ukPK4f/hKH8eIgOiS8dKCVjHVMqFVwMJu+TEFY/HNaGarcImAURodFdWIIs8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7940.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?uFxsmn7Dyv/CLClJLs4UY0U+Vg0+ceG5dIJ1wbd5wxbaRL+I8S8o0myHz0QR?=
 =?us-ascii?Q?upefG42VgWJWDbb/gJLrarg3hcdKk2vvZqzgGpQdM1Szhf6sZQ0mLzZb3aAp?=
 =?us-ascii?Q?6DRbfUYUe12yDs4heY7vIHYVjtEY/sEs28zRR/qd+Pd+nflh10S9lggWtuvB?=
 =?us-ascii?Q?tTMfEBxcFGqnsOvfIdRZl/CJzs5ME9kwyumIbpPYWhd9UgOFr1Pfe48hvl1Y?=
 =?us-ascii?Q?Gl/DHixqhp0k8tEbjJ9I+h1YZ5I5L6+24rDlfqExQ9L+hAeSo0Eq2xIPnCqh?=
 =?us-ascii?Q?hTOlKWGfeYFU1NLyNpyp6jwoAJOrCJuSN20qB7u29acLv3CJrixp3Rh2M0WG?=
 =?us-ascii?Q?DT7kr6Eqqfsz5EYPibe/Fcm59rhJW6CNbhzxwqTllAqVBXogXDZzpgmVxsR6?=
 =?us-ascii?Q?hJeFlS0D1vlJSYIaCgIImuxS29+PsJ8vBy02TRaSsQhCEIzpXgU5CMiRvZ9h?=
 =?us-ascii?Q?Y/YfB9H4fhPnWhThQA36mTrKkIOto43v9kph1yelVSnGg62w3bTPlKHwBqtS?=
 =?us-ascii?Q?eKi9tBOFduu2yNp/IyyhPL1Xs+TJxonTsKnIQI1xRXqxgnbAJ3r75Y1YnLWg?=
 =?us-ascii?Q?v8elIz49beFXmvwjTcqN82l5NaMxgnyezcZ13kcx69ZQ5fXop0lqy5ll0peK?=
 =?us-ascii?Q?P61CjCAJ6csuQVd80GqjqWXmtvYQlEEIEUXM2J4himM0CJO+5WbogNHbP/8+?=
 =?us-ascii?Q?HJ0R5G8KvfUa4Rv3eHEYl5q7jvrCTaWHEvcTenompl8nrF+CKmj/S8N7EdOS?=
 =?us-ascii?Q?t/1OD7CiGjl03lYdFs0mmXIZrIyq+mgGSEuX97MkTHJ4aPgi3lEHfpx5Nz0Y?=
 =?us-ascii?Q?DzLlFfhSEIiys94slRDixM/lKmX7xNm9CANIovthUimsxKviwvn56V/ZqyPC?=
 =?us-ascii?Q?mxDqULVUqzH7KWQJmlzPl3zrsvoc+tC091cmyzq3noHV/ZhicC5SW3qgQgjf?=
 =?us-ascii?Q?oq5kqlwkB4BvCar9xmQK/rGkTCgIDsOYZc1MzrpgMxRH2ePc+tcvR8gfXSOV?=
 =?us-ascii?Q?q4hrkfecb6YQsFNCwDiMSw98hiMqfLP/c05cAKTRPNYZAsnoM7vt2iwcjx03?=
 =?us-ascii?Q?ek2H3OUo9ICIcI1CZTSTHSNU3VPwD04cmbqAfpIxKUygIuUmVk0lruImdXyU?=
 =?us-ascii?Q?bYN3WI4NR05M2sdDUc6RGESReL8WF+g0DGVT6EXKeVwY3dr13u0QiiwflC8p?=
 =?us-ascii?Q?SEA68EHPfJIvsiGgNkm941rpTHnhNIMOMZzlFR1BtYJPQRUc955QpGDGltaF?=
 =?us-ascii?Q?vffKmwpaxoA0QQRFk1qFfaxURbOxxeLpfOFhtk6kUZaYnVYJfbXiChComC1H?=
 =?us-ascii?Q?YRzUTnoB5kMIm8T/c/wrlMOJqgymg0Dn+48w0n3W3g3WJE2MKyrmVrG9O48m?=
 =?us-ascii?Q?gWRAh6Ycc+8gXED2AyXMtdopGIXHejt10e2TwNU2O4+3wuyr+zqTqkN9nJqY?=
 =?us-ascii?Q?sHllAfmhXeTbbhsL5/WFwB2oEFkbXTWaVzJRQIEfOtDjnmuqvWCKUCd9BUnK?=
 =?us-ascii?Q?hLF7w1wXTqcn6+60gq1O3FxvLcvf/oC4bPus6pfdwrcOe3jQ/wMzXyoHnl+X?=
 =?us-ascii?Q?U/2DFMTXyYwAPdGWFgitPz+ygu0B99EeY3f0HXu5+2VM1by5AABCYe3xCds/?=
 =?us-ascii?Q?/unbZw4Q32sRD7oZjzGn87KcqX1aAwoFMh+pzf1OD9bBJU1iovtMcwz8Kpi3?=
 =?us-ascii?Q?AbpfXf6wZLRHBi3MQl8US98pPpOQZfYOMZKD8NaIbnxdZnhAEi3LBXQz+i4T?=
 =?us-ascii?Q?flqQGRjy8Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db546573-9c71-4456-c5d0-08dea034e0ae
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7940.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 06:03:31.3513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZ6wwH9WiAVDP/9PWwCHEj9+uneA3XMW+PzLnYbvOvr2nwtlCBB6W9K/mvt4KMj9Zgq0mkb9rS86ZYzycNiUtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSMPR04MB11293
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31481-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,bp.renesas.com,ideasonboard.com,kwiboo.se,lists.freedesktop.org,vger.kernel.org,glider.be];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 09A06442431
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, Apr 21, 2026 at 11:53:32AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
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
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Tested s2idle, s2ram and hotplug on Renesas RZ/G3L SMARC EVK platform.
> v2->v3:
>  * Updated commit header and description.
>  * Dropped it6263_bridge_{init,uninit}().
>  * Restored regulator_bulk_enable in probe().
>  * Dropped the variable powered, supplies and num_supplies from
>    struct it6263.
>  * Added reset, I2C address configuration, and LVDS/HDMI initialisation to
>    the atomic_enable callback so that the hardware is fully reinitialised
>    after each power cycle. Correspondingly, remove these steps from probe,
>    since they are no longer needed there.
>  * Dropped the remove callback as it is not needed.
> v1->v2:
>  * Dropped system PM callbacks instead using bridge's
>    atomic_{disable,enable} callbacks to handle suspend/resume.
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

The subject no longer summaries what this patch does.
Can you change it to be something like:
drm/bridge: ite-it6263: Move chip initialization code from probe to atomic_enable
?

Otherwise, I'll provide my R-b tag.

--
Regards,
Liu Ying

