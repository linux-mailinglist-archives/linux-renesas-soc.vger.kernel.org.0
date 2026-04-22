Return-Path: <linux-renesas-soc+bounces-31486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEtOBNd16GmVKgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 09:16:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D3C442DBA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 09:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 129333010611
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 07:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594B23612E7;
	Wed, 22 Apr 2026 07:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mHqk4/RT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAE917BA6;
	Wed, 22 Apr 2026 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842196; cv=fail; b=YuX6+Yqal249KTYMPY3u2gG4mxQmlMmJaPzDErX/mrHizVbqziOC7Vp3k05cd4iba5TaPtuEHer4oEgWpY966rF/0+NFnxlo0Hooipz5Cnp+E+VttFBXZb1Uk4axPT5tHz4Dero6e4kdTpUTWEu5jkxXJubIMwkgPFjdk914cPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842196; c=relaxed/simple;
	bh=vDNUIjGW7VnBFiiTzvpNIByqtGlAps5l2h4/6D4XIHg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lO/JRxUzZ2IJd63ehMj30epCRrtoAZPxnXL3ssIyMcIzM98Rnu+Tt7wjFn49V84DCk3G/TFm+8b+TWz9YJ0KfF5FDl+4MjW/wynijPAMvJD8ls4rj3nNTchYdk5wBq8uGK5cYvA6fah24axkbBghAwHcwByTzhUkToCtStkfUJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mHqk4/RT; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xb6HTK+ADIgbu/2VrIw2QOCuy76rq/8j3z5+Ac+Al6XzsBAxL+h1dyPk4+3/sBe/d3G+lbXkL4xbVfOuGZYZoOL8DopuLaNn6qTu0it8GTl5Q3FHT/6u1OMjSj1skW0VaKQ9Zxx5Z1+2VIpKVStJqxNbQwWooz23tnBFJK3Awgyao1kJnbJjjtCI0qFakA5PhCYOHKUdgyaPKxWV9bgcaomyg0H4V0eAM/x2DMN0V6qWNLXZ3okeLoB1Xwmf6vSBzerrYH77Jv2XJIkVisyX2/roEzJUe/72gDOZw8z+xrD3znPGO/YcakZJ8V8ultfkjf3uk9n/prwP/B6PakXfFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAEm4m4pk42L/N1A0k3L/Qb76tCealkDhTIyguBCvFQ=;
 b=gkr6AdDSsGic7P8wGLsejpGeupySmRY4Mu+CwitZnFhECgsmxTjG/b1yyXxAQqWfKTTTiy3yHbV6Nw7DAc4kZVgHdONxS5Qf5jS3X6EIrZAI8oz/J5TGH17TL1FdF043T/8W2FbZDU/t66TteElwT6mtpBaKAGRIvjLfqY54eee/1eQmXajiwJxTTcksXDcs+9uUuiUe6S/JiZAKFIlIJJSaW+bDPqE0iOwcmJVgrRTHZNbgZoAsb4TMSAB/lpSfZDsUNgCasSNCZ3v+qf9nITvX0uoS0FfccD9tq3Zsmk8ty65FvmEq78dktlpD2Sb8UDrjsAMBcgejAGBQSz4Whg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAEm4m4pk42L/N1A0k3L/Qb76tCealkDhTIyguBCvFQ=;
 b=mHqk4/RTEhg8kHLhOdmCFXJmRn811LKabHENXxveOJRtqSA4w+dosUZgxtiXdmjLPyDZ+z7RoZavxhrZBAoJ9cJ3TRTbpVSFm+cYqb0nIsXIozUsWvTFr3Y8inmtTVMA1LZZbyuF3S2wOWjOrPQGGzyi2t8CrHAtRc2X5UYuoIw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10344.jpnprd01.prod.outlook.com (2603:1096:400:248::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.35; Wed, 22 Apr
 2026 07:16:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 07:16:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, biju.das.au <biju.das.au@gmail.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] drm/bridge: ite-it6263: Support power cycle in runtime
Thread-Topic: [PATCH v3] drm/bridge: ite-it6263: Support power cycle in
 runtime
Thread-Index: AQHc0X0eSMZaBj7/tUmOMhRIJ0Xb0bXqmOCAgAATkjA=
Date: Wed, 22 Apr 2026 07:16:31 +0000
Message-ID:
 <TY3PR01MB11346F231B8CFC149677CF24E862D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260421105334.43411-1-biju.das.jz@bp.renesas.com>
 <aehlASc3oWS47aCM@raspi>
In-Reply-To: <aehlASc3oWS47aCM@raspi>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10344:EE_
x-ms-office365-filtering-correlation-id: ee075635-c584-4a82-50a3-08dea03f13fb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 D6aO2F4KyRIDMZAAi6dMwg6z7HMBFMQ4plH4wcjeP8RFX4Lb5L4/wfPzVhDZzNZkrYl7IHHrFFsMwD6vHx09sZROoeEbdlFZfCFQJOegtwc2RsfVfdqaE0xhmVys9Ubiz61bPICYywkucvjdVUY0eLNe5teL1OtImzxz2fYTZIaq5OvHLHoKhkhjbt+HSei43/rEj62C8o7Qohzi74nRe02ad12sMbrPhFIOysDNM7gzm4e8PtSeFgYqoSzE6R0CEHomMQNyzt49TOPWIpiwaw1MZvZbf6/ybdAAuXDysvM3wyPDDrwwzFljiFTrzagbmNVzE3zjZlqXa7pDMRuLZAxjPVcmP97z0/WD6+sYXIYqdqaly0NN6uXwJ9IaBvz0Gi1gItN5wbHYQyjG79MyFNN9Y+nVrDJMLMLWoJlRpXqpTRTEMCedDpggI4km+OzZQNggZgTBNNZVI6PJK6tYAWyeX1esmuNzGrUinmJUPxuvPG2g7ofVs1qNSdLPGpCeigRYfGzWsVFytYy7lNl1vPncHr5SgjGoUhIPNovXZpx0xjXU5nOqBMvtenKXE9t0niwa5mA11p8XbbenGTJeyjSFbOTZu6Y0nOkp7fKRH4fOgXwk/UFyuuNCFrRMZDTn1CQne7UgY50w30nhXFxX1bf+z6CnIKDfJUvNtEqFqcgVxshWjh4OG4u4FFJZ6yaKv6fRzYma7tKKf/3usWNuYit+C6fiRUw/ug571CXxLQEzfLw3ortUnu+gMALHig9Hgt375t2fuUeVTn7zLif1q8l8/FNdkDfXmxwbS5HNCrk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cf7lQaBp4xc7WQIaWnY/tARfm3yooaxg86ZW36UsaJQxYSykIaG/p/CD9mnd?=
 =?us-ascii?Q?+H9DnqnNh/A3sKZgJDjBXuYnyV2PDI6t3jkMSWyJLyFeIeXPj0M4h+2WtFhU?=
 =?us-ascii?Q?kRYz5C/AsEgQiLR6VkmJKH/HzG2xBTtzR2JWBODRzd7k+J9HBP3OCdquqEYU?=
 =?us-ascii?Q?ApZeLi//iXHjpM/C2FOeQDJzuR7c45gRo5xnOCmONs3qzZGBEPc+GcgMKVM3?=
 =?us-ascii?Q?bf21aPN4e0J2DtV1XUIWfUxkrQGfDCIl9f2cKtQOAuq2QDbAUgrtASsthAva?=
 =?us-ascii?Q?eoRisrXpmgQEsU5erkqISBSmhnqk0NX48/jbkPIXklahKGGCj/r3zOiH75GX?=
 =?us-ascii?Q?aXBkBrAEp5YGCftgBEiPaERZIATh8XMupM7uTPP8zjCs40WWXL/ikgT3J54F?=
 =?us-ascii?Q?uffiyzM9LmV0jeYwN5a9SGAY/7WKsmmSb/znlPjwE4Eq5hKihpPLQVROG7vs?=
 =?us-ascii?Q?5ltNLZE8JkssufhWTiajPeCoE6npxx2Q1FP5Xy/HAflTVQMfHe/qav6VB+PA?=
 =?us-ascii?Q?K6wGPjhIdklEha3p0+RstbHijZbd4Z4iddItCqM8lk/w24iBbdFZZ+OXIL+/?=
 =?us-ascii?Q?Kl6EHKrxtZBYThKhmRH2HJCGW4/MELq7nKWYx237jKXG2D0Pt+FyhlBiD/3g?=
 =?us-ascii?Q?9B3Iv3L+v29SiWsU8PI1oLxn44au/G9kQ9rUqAymfkKwPN5DsE+lkuybAw37?=
 =?us-ascii?Q?NXJ4Jjv33nQd6JCQTl5kKARNLT388ZsiqwrSBcBbtbhIKjOEFJWv9qJSa/HJ?=
 =?us-ascii?Q?eSRVpQnFW0UudFGuXiLhy8aV1oOd9RnT1v2QdZ5bt09zhzfzovRla/vDlrG+?=
 =?us-ascii?Q?jBeLm5eXsJ9ueVJ3AhdUAqVYm8DjOI1w6IUDGVpN/ncG7Pz1abSVH4FNfEo6?=
 =?us-ascii?Q?WoSaDoxeQ795PnoRgeWHUZ1hG8+K61/67TqyeGIwxQl6ZY/FEQTzwiVNHXkr?=
 =?us-ascii?Q?0+9x+D4mmVe8dO2NUVv7UkyLfdqSjenJrPtQT9OAhFtOuSbuUel4U8mdMUEm?=
 =?us-ascii?Q?MRI8tqX0TuqAIuqMyG+w5ZJnpzEeEWkg7Zuesr+lSLNQQxY0c7XLb8DNMrqa?=
 =?us-ascii?Q?GDBVwjzJXgXGmSAKcR2RIFFzhosz78rXQ5K2dj+/rOcb5umRIT/nlgbGI9UV?=
 =?us-ascii?Q?4fWnFbOBbADnWbjG/OysZIrX19gQGHg/fl+9jtiH5b9zhZv2GM1zPbT1rE4I?=
 =?us-ascii?Q?t59981OraRwolQBvm8UbqnVldbW+PGtaswIcbm4Obyv1QcJZ8CJeq2shcmcg?=
 =?us-ascii?Q?y8CQ+J5SfNJ+jj05CWAMObUV6nJzMROSN8uM8XoOiiNo2pFp5XARxvRwFvGs?=
 =?us-ascii?Q?lMH4Z/HF5PBoLx4nvEKta3qTov7LbWXm6kIeiX2zGoW3iNbHwYS2kB/KXwhM?=
 =?us-ascii?Q?z1/i+hpZ7xBPRyuwLR41wy3nfRW+o/LZ6Fh8H4FhMtOljlRxEq3JgbNR11Bt?=
 =?us-ascii?Q?56Ta/neSi0tLf+osqsFuVCNy6XbNidb24GuI7D3jizJ/NUxGIMBYlE34drsC?=
 =?us-ascii?Q?c15l1Ujd6/P/GC5sHuxLXgWRQeCrfD3fIbcGQjsb3gniJfBFNcKgqzOqTgtm?=
 =?us-ascii?Q?IuvzbNqjsrUMXDXPUU4gcDiUhEswEb2qIROTxF8ffQm6PlMD5MyfgYeDHzrQ?=
 =?us-ascii?Q?20dP2aKQiDSt56yoQDb7rm2q61KiBSwWkEm8Yo02kTZ4yqxW4BX7NQcdI9yA?=
 =?us-ascii?Q?cZ4963AMDVmZWV+4cXUYIgrM5aUflmesMSQWm8vgZQUg0pYvMz42iT5onIda?=
 =?us-ascii?Q?msxai2CWWQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ee075635-c584-4a82-50a3-08dea03f13fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 07:16:31.1159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0LyRjJO2fqfyHxaJhCMHKxNH/CGoXlQItIqb4iLhydbSmLRoCoyBwLdQcp12FIsZQqBdumNUpDOBAPFN2iF8qgmwQ7GLmHQnA5mgb45lGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10344
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31486-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,ideasonboard.com,kwiboo.se,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: A6D3C442DBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Liu Ying,

> -----Original Message-----
> From: Liu Ying <victor.liu@nxp.com>
> Sent: 22 April 2026 07:05
> Subject: Re: [PATCH v3] drm/bridge: ite-it6263: Support power cycle in ru=
ntime
>=20
> Hi Biju,
>=20
> On Tue, Apr 21, 2026 at 11:53:32AM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > On the RZ/G3L SMARC EVK, suspend to RAM powers down the ITE IT6263 chip=
.
> > The display controller driver's system PM callbacks invoke
> > drm_mode_config_helper_{suspend,resume}, which in turn call the
> > bridge's atomic_{disable,enable} callbacks to handle suspend/resume
> > for the bridge without dedicated PM ops.
> >
> > To support proper reinitialization after power loss, move reset_gpio
> > into the it6263 struct so it is accessible beyond probe time. Relocate
> > it6263_hw_reset(), it6263_lvds_set_i2c_addr(), it6263_lvds_config()
> > and
> > it6263_hdmi_config() from probe to atomic_enable, ensuring the chip is
> > fully reset and reconfigured on every enable, including after a
> > suspend/resume cycle.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > Tested s2idle, s2ram and hotplug on Renesas RZ/G3L SMARC EVK platform.
> > v2->v3:
> >  * Updated commit header and description.
> >  * Dropped it6263_bridge_{init,uninit}().
> >  * Restored regulator_bulk_enable in probe().
> >  * Dropped the variable powered, supplies and num_supplies from
> >    struct it6263.
> >  * Added reset, I2C address configuration, and LVDS/HDMI initialisation=
 to
> >    the atomic_enable callback so that the hardware is fully reinitialis=
ed
> >    after each power cycle. Correspondingly, remove these steps from pro=
be,
> >    since they are no longer needed there.
> >  * Dropped the remove callback as it is not needed.
> > v1->v2:
> >  * Dropped system PM callbacks instead using bridge's
> >    atomic_{disable,enable} callbacks to handle suspend/resume.
> > ---
> >  drivers/gpu/drm/bridge/ite-it6263.c | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
>=20
> The subject no longer summaries what this patch does.
> Can you change it to be something like:
> drm/bridge: ite-it6263: Move chip initialization code from probe to atomi=
c_enable ?
>=20
> Otherwise, I'll provide my R-b tag.

OK for me. Will incorporate this in v4.

I will wait for feedback from others if any, before posting v4.

Cheers,
Biju

