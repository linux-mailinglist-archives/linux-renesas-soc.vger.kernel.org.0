Return-Path: <linux-renesas-soc+bounces-14982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4345A74BAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 14:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A10A1B63E96
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 13:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008D11A5B9F;
	Fri, 28 Mar 2025 13:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b="b8D+vudY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4C7199223;
	Fri, 28 Mar 2025 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.153.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169163; cv=fail; b=j5Kw4O0Vtk4eN8+EJbvTv+kyTs0UyB0h3XxO8NrTOXrsAW2mQbDWZdlfLLi580Chr3peYdlynASp+1VP/MN1QiX4CHrxN1eQG8VFl4vc+7d1ydoCJqzO3x87d6ilMUWX+BM351bJia6vwwzkJHmww21Rg7L189uKSqSJwgrkedw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169163; c=relaxed/simple;
	bh=MNoccIdKaj56vf/xB0XH8MiO/rLjCT56ULahH12uvp8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EYZPHMoindfDQh9aKgrfphfSGAIZWk7lIC4fTjdWFfNjzNjeEtX2g8rXaih29DYYMiwaLUKVpi40CwP3PlqIkgTDc6l9u0bvMpbtyqeaSG8w2DqXUYswqOkllwaCETzhpEEQUaGTPSiq7IU6Y5BcWu7cA4TeLtgqROzFqmigSt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com; spf=pass smtp.mailfrom=sandisk.com; dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b=b8D+vudY; arc=fail smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandisk.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sandisk.com; i=@sandisk.com; q=dns/txt;
  s=dkim.sandisk.com; t=1743169162; x=1774705162;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MNoccIdKaj56vf/xB0XH8MiO/rLjCT56ULahH12uvp8=;
  b=b8D+vudYjbftnJM+lwRX56b2VJU8RNFk302qpnxyozoKFiu6w345I7N8
   NRt/aiUtmPBDRDu9XgHc3WhP6dGLcVB2KMZ0+pUZIEumAhTQqnTdaySX5
   nd3S6p5taKbT5ZwtKRwtYiDpSx/5vcbgZjfk/syRt3u3rhDmLrxnZyaI7
   JXMNHjd1MlEVKEb3HAW3LVK3ZJQZ47ocCX2aWyj/1QFI049K2nuyIxNx+
   2VV+z1QcWNxmde/rxynAscgd5uI3+qh5rUqJ0Qy3Z7m2Rl/+L3iwXDncY
   WnL1KUyQ4hUiK9Sv9cfzs9wN31Dj/p23UqB2LgG9X17XO8ZWR8pzXIWml
   w==;
X-CSE-ConnectionGUID: a3sdAXVhTBqgCaeVfFLKZQ==
X-CSE-MsgGUID: yA0u2jMwR4OnoT3v5rla3A==
X-IronPort-AV: E=Sophos;i="6.14,283,1736784000"; 
   d="scan'208";a="63021104"
Received: from mail-mw2nam10lp2041.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.41])
  by ob1.hgst.iphmx.com with ESMTP; 28 Mar 2025 21:39:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOt2hmkLHAFVItPWBl78zxMyK6+jhESgvDa94Coan2cYuPH8f8uFMQfBSuAHHUQJonYWcQyKGcSycSs9iHcEPIhmBptvBwfHx2U+oguzyWgJGlXMD3hu0LQHCYlUWmf48AupeFbmFzxLPAaRVSPLggKDsZCijEXZxZNixltVSF2yON5X6z87PqojBUxeErIHzWGNrmYdEy7S4uU6+Sm2MeK+hXgT1c7bkJ4GHGtsUywzRaRuniOe3WlEW3IYi5rAU68B3MuC8IgRBaNxxxvggcABSzyXcI3/Aw+Uy7Tg2NptfbS8DpWuFqdhh+6qtGYfJdJJ2EZXlx8fISEuikH+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YoUbuR2YWxMvP5o4iGPqgy4ooB3sKglGHQ2dlN22T0=;
 b=gVwEqiSlY7gxsouier3uW3Abn/xKyOZARdm5Pqg3cXLvW9sorEZoIt37BMT83b2WcTho2mazWaCpH+rMuiBIDzs0K8KxDUMNmsyYOqRp73siJ+ryNy9RgOfHUwss+seI1u7rZ9DvFkCV1tSoTyZ6xCpcXMdXcE1EG5B2PlPE91nqkWQBK6Qnsm/wN0pHB2dv5RXyR1xm6rO6JndB0J0UFh12ysZ7QnUvx9vDwxgzyQCgRb2rtQcjERfsVvcHSaQ+SJXhqbFwr+IJ0FNcVk7mThUguQKq7nvXdUVFvG9P78ActNcV70ppSsNECpCOV0zgzBxcdI0fckCLYBFr2QaxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandisk.com; dmarc=pass action=none header.from=sandisk.com;
 dkim=pass header.d=sandisk.com; arc=none
Received: from PH7PR16MB6196.namprd16.prod.outlook.com (2603:10b6:510:312::5)
 by SA1PR16MB5103.namprd16.prod.outlook.com (2603:10b6:806:336::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 13:39:18 +0000
Received: from PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::58f:b34c:373c:5c8d]) by PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::58f:b34c:373c:5c8d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 13:39:17 +0000
From: Avri Altman <Avri.Altman@sandisk.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>
CC: Adrian Hunter <adrian.hunter@intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/5] mmc: core: Convert mmc_can_poweroff_notify() into a
 bool
Thread-Topic: [PATCH 1/5] mmc: core: Convert mmc_can_poweroff_notify() into a
 bool
Thread-Index: AQHbmaCTUfeXohXjXk+c/eLTOQAjPrOImi3A
Date: Fri, 28 Mar 2025 13:39:17 +0000
Message-ID:
 <PH7PR16MB6196CF24BF806ED8F2B3B59BE5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-2-ulf.hansson@linaro.org>
In-Reply-To: <20250320140040.162416-2-ulf.hansson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandisk.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR16MB6196:EE_|SA1PR16MB5103:EE_
x-ms-office365-filtering-correlation-id: a24b0df9-682a-47ef-78aa-08dd6dfdf019
wdcipoutbound: EOP-TRUE
wdcip_bypass_spam_filter_specific_domain_inbound: TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ewE6OZML5RIb0D4ocV0Tcn0TtJbL1439Wq5dFhcm6PDi2AkOBpzmgJp6bOqu?=
 =?us-ascii?Q?nlRvKy9msIPIJJuNp4upGgvsL2NRd6rkH5fQoPCrQJMhIEpk9LOphEFlYAix?=
 =?us-ascii?Q?8lo+aK5xmUJ6V7tq9Q4a9lqT8DRLfDv976LgltxHW+4hw6gtOzczb+ddYDhr?=
 =?us-ascii?Q?pZloNQi5IXr0ScGakJALDd5Hc0l1WbIWC6+PKCDGVOQRm0my5nV7ON91oL56?=
 =?us-ascii?Q?5pE03cml1qxrPQE1JIR2KPaHtVsqkQ6TuzC+Z3d0S60y/QlqOnIazRtEqUV2?=
 =?us-ascii?Q?dnfFbkKBnY5+FE/Q/HSzSdEr14Pz6yaKnPiyBlcgL47Qour9MHf2/3N2ywXb?=
 =?us-ascii?Q?2i4VVmp6OQjcjx1rKeC3w+vLc4T9alGEpGmvMIfuSnLGjn6PoSvq9gt6n5If?=
 =?us-ascii?Q?ifatuZvo95iKeIlX5yeFTEDsuieHMU4U+saCZXrJ3WEsUIjbFr5jxyKnAThj?=
 =?us-ascii?Q?l7NSe2sOC1eE4ELDq1t2xCK2lde0Xmw0nL+pk3zERUm1GPxPG5l+UH+iCApz?=
 =?us-ascii?Q?simwdBq9kgfdkdDXU8DKbfba22n6LJ5OjCSc4OFoEgiwft4814aqiLQyB4ed?=
 =?us-ascii?Q?jL/03N8M0OxP61NX81Gk2n0bMC96RImKURgJ1WQ+kZsKgVhuAH22GJtAqnPr?=
 =?us-ascii?Q?cDjIcq3Kq9qCd5qckHr0rGWceRoM3DXQ/zs+22rHV9JxcfLnHPAyCzsEyAA4?=
 =?us-ascii?Q?EVHvk+qOGMFxuqP7WVHYXpf6jLCiRXixppO3ZBVYQO0mSJ5wiafBuBlhEV5W?=
 =?us-ascii?Q?G33yST7MW92QzTxvYufc1qjd+NAFUb8KD96//koOv4gG5Bfz2FMeaTyDNIMX?=
 =?us-ascii?Q?VhF2MA8MPN+mQwgzx3b6luIf3ScOVzvzynglKri4ZxesJrOsMekSI7nDC+ZB?=
 =?us-ascii?Q?R0tx55svkXnfRLmN44dj9WBB7YMUw1qH3hOjtYBFH2qclPrNnsxfGdHpNisy?=
 =?us-ascii?Q?bZBUpX08A7JOkmvrBA1EY4kc1kTSXevtKt83ANv50sHXXPZWDiFB1/i+r+j+?=
 =?us-ascii?Q?A6FMk6/uq7BnIq4Eda9u0HagjiKmSoy3tMsrc6qyBFswSudqmMIiSknmThcs?=
 =?us-ascii?Q?Jx0FLi0Dq9c5jw2jlMrL5CqO1DIqIU8E5JJWRml/e/wECmBLCJhIOf68kvyP?=
 =?us-ascii?Q?FHsw6POy0lN7/fu2YkUKRKJBpNBgxC2mY/pfYxQPe976ZxnLfwjen/383yrp?=
 =?us-ascii?Q?bqpTr9Hj0rpLuURs1xmgbSOATk09h52g8CKuu//csy6oE2WFy+n2U+5FAc2m?=
 =?us-ascii?Q?cM6WbLYuifpmPW8Wb3ABSjRjtl3Ml+D5AjswpZHJdpzhMQBF5M6KeDZRbB9A?=
 =?us-ascii?Q?XXdc2uopzJs8aSkRP+URRD+gprGdS/AEMnv97XgVbgMfP2zyBNSUs2YXs21i?=
 =?us-ascii?Q?4a06Y2SIZeiw6IwRJUzg6skdA/ZzP4HM54mYLRuYuRkNvIxG9zDfeBzE7+1W?=
 =?us-ascii?Q?weUVTGYLXXGe+RNwucDuqQHouZ+4YZU4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR16MB6196.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Jk+BG1e1lQGhnjvQBCJUXxJQe3auEyN/ftWsR2WP9KPWuL/Ijk2J2AIQWAsq?=
 =?us-ascii?Q?W6I5ole6XtfxrzwC9RkB2RVPqPSKHQ15z386/bYCXzWUSRVjJ58MWxLCv95m?=
 =?us-ascii?Q?i9R+8QuoFo8+2mWQ1OP+JWkWzd94kjfrRM/a5Y/lSvtIlF4eIGtAYvJoIQGl?=
 =?us-ascii?Q?B7E3hnZsEWt5rqM7fQIy/NQclNjTIt0ClHNg8PFwH1rfrr+Ve+EaOpqVeNuu?=
 =?us-ascii?Q?98V+2PkiJVvYVnOGUXuHRqG+echYFTmvA4TaXBPvvlq0ZS9W/i4pJw7DfPLW?=
 =?us-ascii?Q?v96d0HrQv7nfMURu1+dVobuv5+75cLdzaxFkwQ/+XpaiAFPLKZpbLUNPRC0V?=
 =?us-ascii?Q?9V3A4vQaq+KwEDdXsTNqyWYXQLqlV2vPAZ+WyQaWRohkd0WQfy551bcgnUes?=
 =?us-ascii?Q?MUhojCxZFgZHHgzabvI1dtztJcPaiVBtKH7s+DV502m/TF8eQZL2olz34g8v?=
 =?us-ascii?Q?lYHGg0zJEG1I3jzKnkuN0UiHs5OfiDtnCLFDrobzL28sPjim5KPYfYCNzDSa?=
 =?us-ascii?Q?v1EOJf/9R3QBr6G2XM8se7MlBaybVGDUizD5j+TtPabQOnix9foHke3hpHgG?=
 =?us-ascii?Q?OEg2B2U8Fo4mPz10W3ORxgtMSx4Np0qORwN+KQS4JK7r5T3GqpSPRAUardUq?=
 =?us-ascii?Q?jq0OWKGaBdxmn6XHpbUtdls5Jv5piRthiew3ac0ENSX+HdjyLNnLrZPydyfw?=
 =?us-ascii?Q?l7GDwjxHbcHMh6StU8T+0xI/KcjZGXMH0/cnuibXYm7VQ7yy3mb/V+/td029?=
 =?us-ascii?Q?fsA5/C20dyTjLg8UmVcNRTAP0RlMS1jvYT+SLljWtOrVtgmnRSgJfY+MxeCp?=
 =?us-ascii?Q?RFQfAAydkpNy9Hcb/qbnFhPukOvtXJ6aCwEltTNAUvzftwncxmPqwj5dZBTQ?=
 =?us-ascii?Q?Pgv3+oFNGk0G6XQn9UPfaj8ap7spemtcpOZvSOvlr2vuUGbSmS8YnyZLjOwS?=
 =?us-ascii?Q?A8hdMMJEsH7o8JrOjbvQ8LURX0N6TxufiUJRnphcJFjK5kPsyyZMGbUje823?=
 =?us-ascii?Q?6HttgHZFMs9MUOZ3xkUxZWs7a52xwQXQIKb/NYx6Z3LwQmjwWkD1DDuTNxOz?=
 =?us-ascii?Q?MepWF1LNI1T9zqrgjiAOe8jXVKxR3kaXSBJjYHRcbQjECZB03JtD4755x5Jd?=
 =?us-ascii?Q?3Ftfq01cU0ctUSIxGDb14Dv8PL8xP/JymlK0ctY6Bcv0wKblspvXxLySilFu?=
 =?us-ascii?Q?/r2rkivub+Q+CuEFwPJZ9OBidvLTJnZMZlWFnGV4w4cSqo3wZDbt2bc4igZx?=
 =?us-ascii?Q?IOqpwEc4jdRPdvk4NLkb9hDFosCYC4sHrgjdiHp8DNdddg6N+OFMqqKXaZ1B?=
 =?us-ascii?Q?oZadZ8KLFJRJll+hMDXWn1YW0gX5Eic4iP5y1UyELCEyi5zJIveVN4+xyZW3?=
 =?us-ascii?Q?JAlMcs9pCMVvuD0fUycUjpVqfaskXOygTucj4BurQjYkKHUtgyFGQ1v7ZwSB?=
 =?us-ascii?Q?hVYzF5MAMb/iKqDGTDe+xiYEnx9ZQBJDluOWEJoYLrcIpTVzgMJJVQWgh0g5?=
 =?us-ascii?Q?o4OLQdWwY4VNd4sypSo6+qoSZHZnI0H9bVGz1ci3ZKA6Q5HmrLwR8OubMVCx?=
 =?us-ascii?Q?hYevsn4gbT0/EkIauZ2lB/Q6HeBSWlGvaVD3qBuv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1vVscqPifTvUq888yVk6iG48MaEvLo6ssoZbXJmiGh9dMgDUay4SRYW5kzggqiY6nH4s/3/G9v2JN7x7OxYK/8/nvfP1XnznkNQ7lUu07OGNY5HhzyuX1hIjlyjDnCDEpONPfxjVJU4BQF3TB53LKYHnn6UevrJJ2m4cvSuMuX/cd9rY++hGdBRi4ZWAKWiW2OqwL5vu8EHV3pamwzUccZTiUz9IpXLq0PlarlYYQ+1kGe1PYDZMIThxYtd2HwM3MCCVRV5Lr8oc/UjIP746PTLFartRDU1+ypOJ7/bKLaTngAYXp7ORHQaEIgyveN0bHuClwDed998xs9ZLrXgdIQGO2qtQe4UHhCtilOe2B0zsIpYNEEv2wvE0oS7QfubT3fRKkhok6Vv6rrTtEh0cwrT1peAqtiSxnQbezp+uXl+yWjn8vEGlJIpTinLkue6IJXBdu4rtIBvSRMQvSgRo5a+Dm7FpJU/0GTLWJ94M1eKVmyqYVt1V6/Hi4EfJtP4UhQ5ksaEqPzY3dAF9nlzj/5cjV9NgmR7ic1fA2T7yaJEB5LMW0Inbp2+Jrg/IcFc9TaXaPttrSE18Di27LG6SVOnVIWjlvCACnUFXzgC4rre4lsnQkv3BD/alm5xt4s4/FqMNOhJQIpHC7XORVqr5tA==
X-OriginatorOrg: sandisk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR16MB6196.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a24b0df9-682a-47ef-78aa-08dd6dfdf019
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 13:39:17.8474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ffe0ff2-35d0-407e-a107-79fc32e84ec4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3tScHBGnqazAWMsnr62Jn7kKtMCgUXolg6YNlW7cU5iYQZna7T6PewAz8ruYvIlWoDVbL04Cjl1oM7PEwg6Qzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5103

> It's really a true/false value that matters, let's make it clear by retur=
ning a bool
> instead.
>=20
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Avri Altman <avri.altman@sandisk.com>

> ---
>  drivers/mmc/core/mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c index
> 1522fd2b517d..3424bc9e20c5 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -2007,7 +2007,7 @@ static int mmc_sleep(struct mmc_host *host)
>  	return err;
>  }
>=20
> -static int mmc_can_poweroff_notify(const struct mmc_card *card)
> +static bool mmc_can_poweroff_notify(const struct mmc_card *card)
>  {
>  	return card &&
>  		mmc_card_mmc(card) &&
> --
> 2.43.0
>=20


