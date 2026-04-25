Return-Path: <linux-renesas-soc+bounces-31649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JsTiG7hh7GmhYAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 08:39:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A35954652D3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 08:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4C0B3006B50
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 06:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2638E24BBF4;
	Sat, 25 Apr 2026 06:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="D/3L2X0K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8071FFC48;
	Sat, 25 Apr 2026 06:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777099189; cv=fail; b=mezE1IxLZHCYPP+0WJnUdscbXFr5L93R9sKS1kSKUpdIDrDweXAncXPHNVeRgCUjJ+0C1ojkpGSKw/KEEBkr4M2bZwWrDjUTrWf5OxmeKAa6LoZ2mybaayrOvPou0ysgw53O2H6UXkSIpqYsM2I7beul0Ig5aaZNh+bvjuv/Tg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777099189; c=relaxed/simple;
	bh=ERy7uxO1QgFKItBYpTHF0XIsGit+7kiur5R2NYQgaOs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qd0qacSKtqQLUKTyEY55T5FJD9xLRukSHKhk5fMC6gP+roG9Rknwmls5fqExyuk0MY8MmlY6NKcIDSGO8b7c1NduIvGMaa0udbaOzPBmi/0srniC2hnNs8uDLgTU9xe/qc5NTLynnc/5i48lv+Oei0M1rJ3h7y4VG45aPUriOMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=D/3L2X0K; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnGSmHVTb7XhsbxoorAVJsxtYIWI1UKTZLYmswelQlM9AVkeUaw/mzr9p2HxKKD6Hu1HblAssnQweUJNpcQV1Keqvprw266PZT/hnI0355mslhthnd6HtD2hwSDKrnLtytNzSTVB0kkJLIuaG2hymDEecC2X5ugwVijSNmJaSE2nBqcWMrbevKD0/AvLPwLeaWqyHokGbZ9+MB4qlqDv+jd4nhBff9CiEMM3XoN/HFJUxkYm55c4y9XALhaoCxvB5beTRNV/SJ31IOPaDxNNhYSfi3M/16V3wZjGwvCrRnPnKNkhbituHe4HBN7Jb62SBZEFQH1Bda8u7Qyr4HaneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HZlZjF8BMVc3vDR5+4WvjQfzbxvtvANiKyfQQUJNOc=;
 b=EJZwrE0SEIJW9liq2rdGrwrbiXeV3meu7wQIGxb5jY6lVuoYMKrBo/hJ6mAAsW7rAuhkvYdwV6A6+Sa0zhRMwVhMndA+XZYypsYHqLJa85rCq5bWAMVkYdqrsFPFAGh5z0R8dSvj8qSH/+FCXrovJBCe5pvnD+d+9MlMUZ34pjlGntl9iKlJ0v7KCJWt+h+II+QiCiY1IecyQE7jdDrVeuSZhXnVhe675eJRnfE3qU0YfyILwwaDEbGxuEk52JiGw6oJwOrdbcPkNTPvmVwwr8EYWOVvRQGDpfeq/9qnr/8KanL0yuHjnhkYJQ4Fg636i5yydMMmXwL2PhApKIDkuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HZlZjF8BMVc3vDR5+4WvjQfzbxvtvANiKyfQQUJNOc=;
 b=D/3L2X0KZ6W64L1L6giIY3ajS4HlHP4NKArDWH6BNPBwUaVumJ/obpOHs+IBpI/hIg6Xw8CF0+Xkaebht+RUS072fTsWXKKY/r2WABJY5H8QFjxuIHoB+ywC5QmYsQJ368BXko/s57ANqTPuYQSgxRK9DyGdBSBHf9tddAiPRIQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10153.jpnprd01.prod.outlook.com (2603:1096:604:1e4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.23; Sat, 25 Apr
 2026 06:39:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.023; Sat, 25 Apr 2026
 06:39:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH] drm: renesas: rz-du: mipi-dsi: drop duplicate
 platform_set_drvdata() call
Thread-Topic: [PATCH] drm: renesas: rz-du: mipi-dsi: drop duplicate
 platform_set_drvdata() call
Thread-Index: AQHc1Fth6WAavjC7t0+tqZxtVO5pfLXvU0+A
Date: Sat, 25 Apr 2026 06:39:41 +0000
Message-ID:
 <TY3PR01MB11346EADBA4CCD3950E93A41686282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260425022857.2382603-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260425022857.2382603-1-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10153:EE_
x-ms-office365-filtering-correlation-id: 163c26ad-f404-43d0-e114-08dea2956e0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 KAHgKn73s1kTFgnpfWjw/vBNsWIzOwewqDwgtYuhETP1as+eqcQ+SBe7xNaFJz6AIptJFAOJ8ifSLHsoabJCGFiJQeILVKu8Q+6XktfEkuTNfYAC9py2Ak+EetiwlP4cIX8T7AsTBIEQbUKHATw1WC/6xZwvKtMYpc4IS+WRZ65Qw43qB37aOF7+7/3LdT8q5nZ4D6zvJ8buZfLZLF6HiPWtFfZoYNBE3vWfYcuS0ZcULqQ+jte4UMwiUlsQ2QCb+QooijT1sGhKPjGc76/IrvpIN/RgAPvbdk4KAt74LQ4gPYY7um0Zdt6cYBZrDzf3Qe2+iJjBaCHqWGFgHxrsB+FrY2F93pGpkl0xppFoLmmRitaJY3KywBefrtmC6XD5UzoWp2sCPxmdTmM70ZMbGFhlYKzHBREJJaxAu4W/fsH3SlT5HqntQ+IqLNl5JBRWv8wsScBRNvjWHzITpK07ETMtzwpgeQ01187agmNCNoB+eAnqGC+9yST77gf72mb0KWygoZjBsxJKju4tKx7+jQFcaoDaEqXv6OkNE3AjRx9UAuRZ3NW/j0/1fzkfIMyiOoYsR9EML2HoENY2ZluqF/QHLkNZWPQ5ePF64RjC+gePoHVG1UD9NXQ/TmGfctenxTITU+NxxAKfyuBtLpsrrbNmSeSrGJC33yN5TbcxrRxm3f47bXenYkk20ypzltMH6I/HeT4BazjjsXKznGx4LRGyuP4awoz+zX9w1m1ibPLE8a0WHl5Pr6ENIA2+oaMAPyehS5faGnJKe2ZM3VRJjkVYo31orN09jJy5ulrrujs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JjQ1KBt/HNbMMqe3Ga3iFexDYWCmH9ujZ9ElQeobkiulpF+jD6xQ11Ug6Ire?=
 =?us-ascii?Q?NPkRTqgoPTXo1w/2gHgBcDp//Ty7M6BY0Wa+mzcQ5+pS3ncDkNRsjkU3lI+d?=
 =?us-ascii?Q?2mO9PP7mNGeuL6hc5Q4BXheK5lNxTFGKHtomzl3gdcWmrSfjr0rXFji8Xter?=
 =?us-ascii?Q?HF51CbzCo3N2FVtvmI1aDLg0DpQz1lV6daEZOrxaYe2fm+ZHR1341jTzq6gP?=
 =?us-ascii?Q?SuPF8CMtw/5ECp9aXEy8ZbhighwOqjI9RiCt/OLFsL76Jf2AvZyYdVe4K9YU?=
 =?us-ascii?Q?VfHBOK1uAFumpd8CvSrHAMN01enmYpZYFyZQU0HZ7RdmcXOFQ6zco6iwMvuP?=
 =?us-ascii?Q?ohf5CATj5EmKDGrpJP9Oacst9eb/QUW1qeCJxHZQEAj0nYs4CREYgomKt+sk?=
 =?us-ascii?Q?RJ4ECtwBrUxIpPolh8YWmwRk14I3sGippxwToI5GcBM4glQxeEIhBtPykups?=
 =?us-ascii?Q?iiC19jllXaVYWox+Ue1A/5Tqg1d04EteiRexgxkOacbqwEwFgaXraX5xzgDc?=
 =?us-ascii?Q?Eb1iJKUYDlo7J46E+T2CywK2o9qQXpluet0KM2CogJElF15X1yyuYBDQ7kei?=
 =?us-ascii?Q?MWmMn6Y/qboSD97yekP/JkaAiNxYsg2K/CtWdVHV53fkDTObFGO+xJ5+x7bC?=
 =?us-ascii?Q?CJDRnTnzhcNdUrYvthR3/accTmgPQxJam/HcT+bc56/Q/Gd7bi5BVnMaFQb/?=
 =?us-ascii?Q?Seib91nzDxC2eK92z3mkjOe2H/BjP2dEXY7dHwVqqMuJdx+I3uP6+ldfJ4dS?=
 =?us-ascii?Q?ArqqVoq+3/V5vbLXo9jIAvRWWnWikTQBPzeS5Xlw1G79oALhbHaZA2Qt5fww?=
 =?us-ascii?Q?GDkl2eTwCoO1suZOlQ2ugOAf0dVKqRzH6tC0wdJKCTRIhzTiny6E69ko+OLK?=
 =?us-ascii?Q?4g9emHYXwxMIpPuwujsksE0OxiJkVIRKWMS2y1WgO5yYAfBIqVIuEdFirlSf?=
 =?us-ascii?Q?KYDdNpj8x8osgXn22INTpDIrwe98v76EqfUmc/Ov8hfchLvjlDURSVib8dmj?=
 =?us-ascii?Q?CMzBUh6Pe1SpvUxgv5cd9QPqxVfOkbj0BFEF0JPKFZhHkKTCSk/aE4OrB8r2?=
 =?us-ascii?Q?dSvOuCULRIkF7oJMNGrfvMc5VphwjgmJn7HOlbfHarjZtz4UOIXUbY+mHmJT?=
 =?us-ascii?Q?vwdix/Fmw/fEuwO9lAkGffHR/NR/JURTBqEASAY5VHEjjQ1fXs5CeW7xsobC?=
 =?us-ascii?Q?u8qjxA5fp9iDJpg7a1/h5bpWiPU++SJoAK/kqYLvbzDwtbnNI2VEzAH10vPX?=
 =?us-ascii?Q?liMpE3P4aXCdxcki7YQsdKk96KU3CMCJS+mlgGDed5Y92Sph6llyjbFvZ8xQ?=
 =?us-ascii?Q?5wLa9ay51cUIdAFpTANEyV2MLskjRS/CbjUSvJnBC6QzzAMJogCqqABoVxmD?=
 =?us-ascii?Q?Lza1/LW1AmZlNZ0gPvrwOM5o14dcKWryzP1ucHnovaeDLZL087+YAsSp6ANd?=
 =?us-ascii?Q?kJqmJcLJCAkPhWipX+upTOYt+FTPBem1HmfG57bFdkCPv6Ti6SF56CBVR1oP?=
 =?us-ascii?Q?hic+iSgAw/HGzwGrsL3qcrma+rrSDMt2jpl4KMSea6vdr9HW5CUEnIvghAC0?=
 =?us-ascii?Q?0CYdlnzt64jZUWkxrkz+tsVPjFBudsdHZSvman4HqI9tqtzzBUkmdImtQUI+?=
 =?us-ascii?Q?1asYsfla5gpIA5UULINLrQkdWWFcPJEkYW3pX+wGpKcPiezG5Hf4yMiQD1xQ?=
 =?us-ascii?Q?jyL5xBfIN/ZUvtwr2UOVQj+pYFBRLT+1WwLubQPGxms4NpfVnqpE7cx9zaJa?=
 =?us-ascii?Q?7Kjy3qA+mg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163c26ad-f404-43d0-e114-08dea2956e0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2026 06:39:41.2862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oSR7moU+IhH5kaKis4LLm6yOSmE7dY32dY35pnqK6v3P+NL6kli+3UMcJMK4KFbjkHIYh9p98A3XwZvRyaYoGwu4Eo07/Ld/8X4fWE0JnbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10153
X-Rspamd-Queue-Id: A35954652D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31649-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim]

Hi John,

Thanks for the patch.

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 25 April 2026 03:29
> Subject: [PATCH] drm: renesas: rz-du: mipi-dsi: drop duplicate platform_s=
et_drvdata() call
>=20
> rzg2l_mipi_dsi_probe() calls platform_set_drvdata() twice with the same
> arguments: once right after devm_drm_bridge_alloc() succeeds and again af=
ter the reset controllers have
> been acquired. The second call is redundant; remove it.
>=20
> No functional change.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 0b4861824319..b8527661a409 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -1441,8 +1441,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
>  		return dev_err_probe(dsi->dev, PTR_ERR(dsi->prstc),
>  				     "failed to get prst\n");
>=20
> -	platform_set_drvdata(pdev, dsi);
> -

Keep this one here and drop the earlier one as pm_runtime_resume is the fir=
st user
of drvdata.

Cheers,
Biju

>  	pm_runtime_enable(dsi->dev);
>=20
>  	ret =3D pm_runtime_resume_and_get(dsi->dev);
> --
> 2.25.1


