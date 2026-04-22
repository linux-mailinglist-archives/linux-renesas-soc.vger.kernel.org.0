Return-Path: <linux-renesas-soc+bounces-31507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J09EsXR6GklQQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 15:48:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4089C446ECB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 15:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 145C0302214B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 13:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F07244687;
	Wed, 22 Apr 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bEsRIF43"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011040.outbound.protection.outlook.com [40.107.74.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0202B200110;
	Wed, 22 Apr 2026 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864894; cv=fail; b=HW8JRTj4vVE/siZ7c85+kFeAYYikuJMMKMu5xNmP1KdTXHjURAoZeoTKpTVHVTPQiBKyFnLD9Gawf2wAAJhSssDXijD62VaA8xgVJh8HI55A92240w/ftIUe6/hcZMMTMjEw6i3KNI1hExcG79uPhSBgpEjEUzsavPL37umnaKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864894; c=relaxed/simple;
	bh=NNsOQIVzxO8wd8Iw5x91Nzwuv5IVH4C4hv7wsgzjZb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gWUeOkcK7OmBzD7wKp//QQjbYTDQGyKCqGBn9HJx/c+lgxwpTznhpq66Wfr4nc2f0R3yFO3tobeKiwIGK/U2kJwhCXOv+tI5Hzgor+P8iZj0ZhDzU9WeE32Q2oITgLZno8N7dsDMIlxWNT7EVf4oD6NEKiE/RxCr8U4emOhQ7bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bEsRIF43; arc=fail smtp.client-ip=40.107.74.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1XrE2k+ULc9FvUwkh5muwJnjEf7otuJkWX0+k8rUNEBLEwe9AC/f1qPGYY/PzhXwxzvGT3UL+wdfwJuFXVjNK/+5wjwZfsVBsTzgmE9eafUJkYjAEfpyug3C7nJaMa+oNnoUlTGLc5ED4q8bNgv+noVaOm4V+vnRutaHM98zMR1/U269FnI6n0pJx+a0q8PyI/fWGOuBejnhQKTIoHjFAT2cwdvMFZrA3/3xAZ3QF4XMaGEzlCTfAv7IGPqmsN0xTrmmUsu2ATtx+sv/nRHZRq0Mev1EZLRcgWTvHG83w4gl5wV0C7RlJQbb3P2yDiI3SIqSN1ZySX943X2QZRjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcT+7Gx9JIj7wseVOz3pXlr0bPozW4e+Bzy6qyzIKFY=;
 b=HTKClQBySOsaP3QN4UWxKRaaIHoAw6xZ9Pjxakt9eOsrHkOvYIVrxh1Itpk+PqfOWVYZwfVPUwJ7XvnyAuBFmn9EiuypNoOXcJhYzYPrISFl3yjqbffNRTWsTBLNxJ+JsVJk2jMVm4s9tdEHVRO3+DeJXExyeezXJYhiXu+1dTHKDLhyVdNUbPphWUtzshtmuHkaJm5NrneuZM8a4iSizP1aOcGR+IyiGfZUzafUO3g84MvRHDn1zlTBFP8tAocG2rq+rcGYVdNWePhdI3vC15nWFDWFrxa2N4QQ7DtMuAUq+ab+4YnZBr21mBZHPFUmH+2GEa2XAez6hLT6SVVNRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcT+7Gx9JIj7wseVOz3pXlr0bPozW4e+Bzy6qyzIKFY=;
 b=bEsRIF43e67Ga1sFCFL8ySZGvJTME8mucv6ch/LuXtL0hjidl2LiYqxjYWUimMSDw874kTi8QNxcErWWGeOjPMNIdjBp4815tTZesxGbbz4IPw+Omyj5QJMikONMCnzn5dPMyNLsYac6oOZg7AyErK7S9NE9eVREFsgSkp7N/bY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB8279.jpnprd01.prod.outlook.com (2603:1096:400:15b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Wed, 22 Apr
 2026 13:34:48 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9846.017; Wed, 22 Apr 2026
 13:34:48 +0000
Date: Wed, 22 Apr 2026 15:34:28 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: adv7511: Clear HPD IRQ during
 atomic_enable()
Message-ID: <aejOZBNWwo5yjZDD@tom-desktop>
References: <20260422121457.166780-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422121457.166780-1-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0357.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: ff280a0e-479e-484f-e091-08dea073ec58
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|52116014|366016|56012099003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 5ROEuTvl0Tw0GVxaAy1+uf+vpcu/EZbPy1KkRV8qcMjtYEsLkH99Ltlg9FfrhnMVsL37RXlfaIW+30M84wUOTF+F/CmDQoj9Li5d8IZfUEP9h4zcamVwOB7GMZGZgnOwzJ/1IneqaFriqJMjYJlxG74MdgojU7Uv+Rs5Wcid+0zY2hvnKa5P3FKEBkJ8eMuJjGyZZ22kVNbMGcxUenPPHP8eESnrBnYmtaJ25H6UeKv3W6i47IgARkgdXruLSn13XWLV73vgdo8nfJnK/zaXf1ISQHDPfNLaf/jtDCh/nHHTQNR1Wcp6Y3EF3Owbv9OV+HFbolN4aRN4yqVTaUcNckvArHyvBAop7betm94fkwzFFsAT/lwhl5B0KIQ6yaUrzmCrID15NuJHFT6DjBWLDSH1GOXITgcZ2Ei4K8vYCfiaAFbQqnAUCzrFEhOplmJl9wYPjwS1+t29CRuizgU4Eu3xX5XvmKs/V2zG8hO29SaGqFFuWhSUKrxS469OvoVSck8MdX5+PGYzQGbBUYelLIM5v1kmmMI6AVvXZ202rSYSn9jhw+7RUPoWdHYg6JZ9Q+D6BPTyNUzS9Zx8O9hVYNctcJIblcpZZRfCT3WuMyKtSMJ/UJXQf4a0sEEjJH/ZBqWEjacvEJGDBN/UHjxU5qCimUkCwrjfwVnq33xGdR6zyUk2i2QquPMBN9COarfnGER6uCVflYezBCt6IYJdfHB+j6NWkhZE3jktBRyxdlPUV0uONqqW5IGLgfL0kyzrRLKqbi30SxJ5ueDGRfj0rJDhusyD58aNOeRKJGEBzfg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(52116014)(366016)(56012099003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?IjFb7FMdqY9weQ1jsNw3LLKQ+w2aqhql3GrujHAYkLBXoy8kmke0OFO+Nkgn?=
 =?us-ascii?Q?EpOsLx2SsRn93wp6n7GqXI+iJ9IesuldSHUhH8hjeyJfuEVMa4m3oy2p8w9H?=
 =?us-ascii?Q?Mn8YWe55Od3ST3dA8EI2MzR4zxlmaLhOrULQX7Nry//WXWKKD0+LtNgD7+ur?=
 =?us-ascii?Q?HcGKr57NFsu6VihDgZYJkIteYKudEyzvqkxhEcpcB2rvk9SK9l9a1Uhh4Fvw?=
 =?us-ascii?Q?3RSanoCnDDMeoHSBEUFXGTgRwqcMTsalWN96D1HLmJS54RyH0l6pahv7t1KU?=
 =?us-ascii?Q?zIm+ixDXkGfPDHQRviD0Clumn/b+Lm37mgbIOGOChkh9kiEItLR7hHBZ78Tx?=
 =?us-ascii?Q?Ln3x0ZkICj3QjOu6kswI5GGoJ8h1vqVVSny4ntBGsAktjX4DBIUnI2KdqXCk?=
 =?us-ascii?Q?1DHxiKGMh7AmH/qEZmRPBz1ZlHQLsiKEazB0LXz5vf5trsAXfgnrJvNQfcUO?=
 =?us-ascii?Q?BIKLiQS8rXb4ZOY4I3nBvPpuKOIkXxsU/iYUAufQOrN2IUFzjuJfOyzJx05O?=
 =?us-ascii?Q?P2RBMoJFc7vOOtj3qqMUHrkOpF+P8Dkszr5YAlG5xwx6PXiJ5mZKwh3tQ8v9?=
 =?us-ascii?Q?dJyT/h9BaXjvEkX0kFdmkHmBSx8+DCSb9upBRscqPGNGRD0xq/sM8/8FalEC?=
 =?us-ascii?Q?55VJvtk6eMP3ZDcms7IkNcgl91weYmnXlJTLas0MYQubhFKzO+dZiNXMTaMI?=
 =?us-ascii?Q?edAgYG8P4BQYjhBg8bdCTOTYMFklrEHkCdywex/2JwlBKF4cbjvNEYdJOXgB?=
 =?us-ascii?Q?s951BBiAIWiKJuPuQJ8N6BrfQbvzx5k7rG/1SbTAQI2QvbuIzfF/aO+GUWmp?=
 =?us-ascii?Q?DN42XAwN5m/eBp5mQayZIWqXvm+7W3UY460Js2wd4cyAf8irPatLp+DuWUZ2?=
 =?us-ascii?Q?xnXTWYhsTKWehI4SXU6f+08pCoDxRGsRUVy9W4b9g8LlhLEtcSKoYGIZaP32?=
 =?us-ascii?Q?wqPWZoYRCVZuwk6b4J/WyFGSH28N5ljbQ9HQqSqw+reVjSNYzyJvG/0Yds3X?=
 =?us-ascii?Q?DYcrIhtCDb+Eq2/fg9FeqyGIWdehgJfGdR4P1+eCvcFmdbKrptZHfTD5v+XE?=
 =?us-ascii?Q?E4qD2JFXJ5AC/AFvMyUrh7o102NpdmhPRs4r3TrfLqzb3kTUMDJaJS/cArd2?=
 =?us-ascii?Q?lJ5Ocx46uZrqENCNrHZR/UAKEp8H48OjP2av+gpyUCfYRE/Y7tzLaRmsswBq?=
 =?us-ascii?Q?Pdgfl3j8uz2VFPzzCAC+fHN1UJ0hP9ckjduK8fUXX/w64gOtFbXZj9pTE3So?=
 =?us-ascii?Q?E/JV+wWpJ85jJb6paQkyFMlU+KQgdRsbXusVMc2aX6HU1Klf8zuv4I5wpCjk?=
 =?us-ascii?Q?L96GAw6QUvrsauTMdvvcPBNxG577M2gCrHkEbjf37oVoISI33Pa7iNePTVIc?=
 =?us-ascii?Q?tzTN2Wtuzl1LrcK04RrFZCzC+shmgsjQzkwMBWxIpyuvts/CMbhG3Y388LqP?=
 =?us-ascii?Q?scYo+rM3IvkDOr0SbiH94a5vAbRSahfal2dRLUMFyf8c1ilwVayLMqM3pkqr?=
 =?us-ascii?Q?79an+YYbRoFcrc/Um7crTjZ5J0n4JHnig1esPN1iW4n3WAaYm3E1u5zP/DdQ?=
 =?us-ascii?Q?LX3dhDKch3MH3PMPqy1EaZ8kq1GA17X7Q4INsV9tKmvJOtijc9nytiGTcmr+?=
 =?us-ascii?Q?2sAmAUiBUbDP50ffuSTiEv1IwAND02ICmaogrmYVyB6hU6nLrsHdl5UBWrqf?=
 =?us-ascii?Q?bDaavW+wPCocxzIbNhtkvnxNOn2hO6GwAWi0CACPYF+NU/CIMz18ZjdhWKnw?=
 =?us-ascii?Q?kMkal5yQIrzVDe6rn7CpFTuUsDmXLi5dgnXFoxur45TeYyB8GDz8?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff280a0e-479e-484f-e091-08dea073ec58
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:34:48.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXa+Bax7v3pDSdon7+4QXSYPeIwhlCVinBHo8AooHhxqhZI6l/YKmbjWmbjDZwQrrCraq7MA91nWY8adStF6CKonwKLgjNlbpe4DkQKQErLC2V1KuzdigdaULUO6oIxJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8279
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31507-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,bp.renesas.com,ideasonboard.com,kwiboo.se,oss.qualcomm.com,microchip.com,collabora.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 4089C446ECB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,
Thank you for your patch.

On Wed, Apr 22, 2026 at 01:14:54PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> On RZ/G3E SMARC EVK, suspend-to-RAM via PSCI powers down the ADV7535
> chip entirely, causing the HPD status bit to be in a stale state on
> resume. When the display controller driver's system PM resume callback
> invokes drm_mode_config_helper_resume(), it calls the bridge's
> atomic_enable(), but the stale HPD IRQ is never cleared, leading to
> incorrect behaviour.
> 
> Clear the HPD status bit in adv7511_bridge_atomic_enable() after
> powering on, so that any HPD interrupt latched before or during
> power-loss is dismissed before normal operation resumes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Patch LGTM.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso


> ---
> Tested HPD, s2idle and s2ram on RZ/G3L SMARC EVK connected to ADV7535
> on both polling and IRQ mode.
> v1->v2:
>  * Dropped PM support instead clearing latched HPD status bit in
>    adv7511_bridge_atomic_enable()
>  * Dropped suspended variable from struct adv7511.
>  * Updated comment in adv7511_bridge_atomic_enable().
>  * Clearing the HPD status bit unconditionally as there is no harm.
>  * Updated commit header and description.
>  * Dropped the tags.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 6bd76c1fb007..7663814b4032 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -792,6 +792,13 @@ static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
>  
>  	adv7511_power_on(adv);
>  
> +	/*
> +	 * Clear the HPD status bit (ADV7511_INT0_HPD), so that any HPD
> +	 * interrupt latched before or during power loss is dismissed before
> +	 * normal operation resumes.
> +	 */
> +	regmap_write(adv->regmap, ADV7511_REG_INT(0), ADV7511_INT0_HPD);
> +
>  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>  	if (WARN_ON(!connector))
>  		return;
> -- 
> 2.43.0
> 

