Return-Path: <linux-renesas-soc+bounces-34171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EoJMGUKcMmor2wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 15:08:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B29DE699F85
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 15:08:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=C9hWQPhV;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A87A303A8F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 13:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0073C1400;
	Wed, 17 Jun 2026 13:08:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A83E227B94;
	Wed, 17 Jun 2026 13:08:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701695; cv=fail; b=R7ueWq6MtyItq+9gglkK+B1FML4Grf02LuvUO5/rJhBGxPPkyjVRDyY/Chf9uuxUYd2rmKgR4uL5mGG+l98bNYeehgKOHpk9I6oRieiyd1TNEihv6n1ZNali7jCeH4Ffvxay4aDNOc387CFYvV+vO/c1FmnfD5gXcAmztiG3FLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701695; c=relaxed/simple;
	bh=rJmCKloiminH4Xov6g7Im3ZkdXrlpvt/fW2W2KUuYU0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YZFzsuv5z2plR2HxE79YqiXzu4eQ4wajfaKC3QGbXvK7VcsqebEIu7ycwfVtZxZcE2gpUJwh4sOzm4W8NwmFF/+c4DEC92ktu18DEO2IGZkgn2BHFQQe9w94REXiKnzDqD/BZawZfLS8WZ9vo80Ugx+nDlUBraQOqrKnZG5zWHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=C9hWQPhV; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUjWHLO/gKY4cAQMxBJBQ3Wwk4ZaYWm58Pyom0Zghx3tEZnMLOGgxyfDXuEVpSIg3xmqc0LHsjovSdK30QCfak6gltonYnAtf3gm83wa4zo1Ub/AYrmFMIzvSwhSK8+SKe3dp/Xw+fuuuTvUm/hPtJqXN3AuB2SMo4iiN3uDlpkD632707sFHKYSfCsT8pxnxJ/btme6dcqN1SbA3V6Sfx0oUI8ckRcTV6HtR2zgR/Q9ilByK1QDuoDbJkOZ0WRKP0vCUoekiG5P16j2bMhX4X4tX+rC6vXmNfsHinrMslh36g43yZmuD+JaLMbCyRHV1a/ZkKybMSl8aVBE8D9+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJmCKloiminH4Xov6g7Im3ZkdXrlpvt/fW2W2KUuYU0=;
 b=RvKtKimssPbQEXtii4NifaAwFf5kF4TZeqArp+TLeg2QqL22n8ALZfts2WtU1ln9viikpSwTBdYA9n2juK9lxsnf8QtA3Zyjc7Po6I6nRvZeapuoFybKWJY3wCSuvzfwp07GySmrprZ9z38opyoz94Eorg7EExEHm6SsHKrc45m+NXEshRzlbPyF72WtREdakDuuF8lPGlGADbpWOu85/BBbNxbC5L5Pf5BrTMsAr8r+xRucvNiIGvah8Q1VNYjMg3heuBbmkbGyLGT75l2mSa0GRnimM51UstnDIhkCSg3FTJgKhdkoMRQe9bGGj/DWZz60AiiMFIEizMOKiHym0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJmCKloiminH4Xov6g7Im3ZkdXrlpvt/fW2W2KUuYU0=;
 b=C9hWQPhVJYj6SRuTI+Re9J8IKy7yhsRZCXqAJ8CYb6iygj8rUM722lNvAs7keBSi35rBTYMfMrlUgT2uW13veoAoCWlKgaTiwxyg5h/HDWcbtgCd1i59FY8uosSWU7Fg54bwLQR/hs9t1n5zt73WT1st5rQpYQJcIxZe/qOh0gY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14371.jpnprd01.prod.outlook.com (2603:1096:604:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 13:08:11 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 13:08:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Ulf Hansson <ulfh@kernel.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v17 05/17] mmc: renesas_sdhi_internal_dmac: Fix whitespace
 alignment in struct initializer
Thread-Topic: [PATCH v17 05/17] mmc: renesas_sdhi_internal_dmac: Fix
 whitespace alignment in struct initializer
Thread-Index: AQHc8yZLxDP2jyj0SEuVhiyroZvbbLZCwVwAgAAMsPA=
Date: Wed, 17 Jun 2026 13:08:11 +0000
Message-ID:
 <TY3PR01MB11346A7CA3863BBAD92B44A7886E42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-6-biju.das.jz@bp.renesas.com>
 <ajKRTA6JunfWTACv@shikoro>
In-Reply-To: <ajKRTA6JunfWTACv@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14371:EE_
x-ms-office365-filtering-correlation-id: 782f4c78-cb5a-4ac7-6956-08decc717bd1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|4143699003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 l6YUZGOqKiulhUvbcxu4gbmeas1j27QF1My6+Qe4U0Ok6HHGICqqeKSmh1fHhzMQskSygiW251xZWOadPUvDpGKecxkw70CR7ZBpmPo3XudpFzk2Uz2vPtI5ozn/7M4DTP3xMYvhj4HwMHGGxQGYUkVcVrEOvUaxZ3J6aolzY0sZMlJMEVMTfuHWX8sZ819bEB0elvkBd+ggU1MTQ4nIsrDUsaIs6B48F+uCsKSyzzjejl59eMbdUc8gfn4uQGkkh89XAvgTbKjfF2ATjI6mSCO+8ctDBIC6Fy8tjhb8cZ0938eLwumT8SCE1+VvIYm55wCgoYyLI+IifrD32eUbC4anL+urt8xyVKVuNvTnd9Nd2I550ojdu1U1sfc/ApPI/thIFQFvaNaNV5weinMJ7dpKMbc+F13iHygvxDIgvAYt/ArQWQnbDzTMBSOgW09zhp/9PUj4UJhCixllFLFQlsqaphJzpyZWM4ZXoHjykXYO1va0yl+lM/YQ4VmGHqDDdh3kpmd8sy09IJUYgNH9OLfVnh/VnA7hc74Zq2jrn+DTq012o8HXKVJjjC/GsVacYVOHxqKL/5X8lxFS8CxXCYPqgUEkOk8lbfxuT8uvytfI9xiPywATg9PypKpNM3/WqD6mdmiFccrcN7SypirxpG0zNLLd0xEX2KXMyLH+mtu14glyHhnJN/22TNuPsbl50dzXD9AdWQ3O/ffwGOrmZT8D37vk6erFxTTZys8Ml5JwJm8XmeM/DpIJbDlje8JA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nBU2kX0aCgurscOKlHJ/5wo8NGPblGiZzfURxdqA5PFOHJTW3X2wh1kQFkPV?=
 =?us-ascii?Q?id6tRk9EbVaytE6DSqPcI337DqfqiykWPNZtTpb8+F6lOHp8O4yDAhKLPGzl?=
 =?us-ascii?Q?718U5mtncPsUJYIl3qcZ9JwdeNBIpf+zSifYZZUUvzWZVyqpaBX+hF8IrzPg?=
 =?us-ascii?Q?rc3yxHvpD0xmZta1+/a1z3FZ856Mss44RLp8mLW07wp24vw3jWwH+ojBaQhE?=
 =?us-ascii?Q?4mFKj/0mbdMgE3zYaihQae5UXBKDLwZ76kn563/9/nc89NRiIQDXh3y9RQk7?=
 =?us-ascii?Q?sIlrPANNkrQDWgvdjFojC6IGF7hJaeljqgkRcBoApQEM+kRsfyL/M0hOQgTg?=
 =?us-ascii?Q?/4ARp0Susurc7ZwwfVDnrMsGC/rZvihGYPjClGuDAnOzzggmISoFTP70H1a3?=
 =?us-ascii?Q?N68XI3uFtRAoA/aLu32pALVlz0O72ImdeGIL3tck42UKcaVWe8/RDFxcPBEO?=
 =?us-ascii?Q?RWBjf78V2vk/WCuSCy4b1FnD1OJYTww0D1fhwfiGjliW2qnV4KRfUOMGOSLY?=
 =?us-ascii?Q?R8AFwR/AvhcqPOXRwVVT1eNLS5/hhVKdS/BgRmrwWckAl5UaMcJrEWXJzwI0?=
 =?us-ascii?Q?lNOYp+i5rITxh63bXhurYybib9dgLDAWxcQkzanR9jLORWJJDNwIVna/e3I9?=
 =?us-ascii?Q?QG6okkfnIUS/dX9nEDAaZtupAEtDjisJEqKiGzhvps3JDNJ2o68/nQWrsKSv?=
 =?us-ascii?Q?HfuHqLG06mOS+53iigq3qGGAh1tvUYPYf9gQS5+ZynWs+dez9D/yuacbWJ/b?=
 =?us-ascii?Q?B5e5E4xUhdQI9PjZESOyKfyHilOYmQl06LOPExuuAvKYf4sC9KmyNqTnOwaq?=
 =?us-ascii?Q?rP0oc0nMHxocA8w56ZdO21ESsoufBuObvB/DUn5W1TNoUo4KPlP56yJAV6TM?=
 =?us-ascii?Q?Y8SYf0rKkp+XUwjsfFaRc8bmzOwqnTB6R/w66esse9XdulQXsmitcj7vs3OF?=
 =?us-ascii?Q?cApUb6HitBQC806qgpwD1Qy/SfD5s3rkTRbeLIaKnOb8AnITNoqX+s3E3k3c?=
 =?us-ascii?Q?lt3eVy1iTWvlUBC7B2uubRWuCuAB5B0OjKXN/Vko+y9j0MMuLzqpIEvfWxFx?=
 =?us-ascii?Q?EP7OIhWEzFiE5xJE64i3U6Strd+1cMdRzPN1aRjyZJfWW3yiEt7x1cfMyZ/7?=
 =?us-ascii?Q?luUJ4dGE29rpic8SMbj7pHtd5X5PDyYrbn/pcPui7xyd160WYtkDG8FWcqA2?=
 =?us-ascii?Q?huuOPtwaufUmUWe/sXTtMpkaF7BOYIfbcwHAkLxU14hz9vhjuSqfMCYmNlp1?=
 =?us-ascii?Q?pPYR90GP7V0pzJIK5Lcur1wP/7SEiA22rLvFO65feJNx7DGNgAaRJnI3pHCw?=
 =?us-ascii?Q?5tiCwDPGhYXbr6zCtPE1SaSh4l1udDp2tzZmCvkut9q8oc0iiNKiFwpyZKim?=
 =?us-ascii?Q?4nq8JdWyzqgdY2cTUVcLJTKN1IgYCxQffvwud9nQ2912sKlJ5GC2r938ALwm?=
 =?us-ascii?Q?YKhgvhH2sTJW+XAebu5uJqvDuyWthRIv+IuD/bK2kWGZhZzIywpPmmyDaUt3?=
 =?us-ascii?Q?TpIaIMpzgAT03cz3PeafBZZOacshwcjAXbjPCTk8t9W1G03jJDCijGTdDAkW?=
 =?us-ascii?Q?vCvzb7o5ynchp7A7bQG3GftNYkO0NXz4+YaJ288TkDvRs3zzx1qoFVgIedjh?=
 =?us-ascii?Q?9cwFlOqdEcGdXHbl8Cmg5ePu46xfgy7QAc+qN+z8f0ED94C2pxiZDM7egELs?=
 =?us-ascii?Q?TCHlOQMwn2RUCLfwjUtHUn9Mo1LK7rYsW9h0CbpD3WrtM3EiZkOBx/xlZXns?=
 =?us-ascii?Q?W5xnG7+7zQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 782f4c78-cb5a-4ac7-6956-08decc717bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 13:08:11.3639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m+RWhYHxklz0KWHZFjc8FJ/DWYuc0c1R/QMtaSDIVyP8gWPkpVwAcgIndSQ3Px8Jz/VgOH8jMuGSeFCI8IxUfBzQX1lPqR3hjXPwIgrMnwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14371
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34171-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[sang-engineering.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,bp.renesas.com:dkim,bp.renesas.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B29DE699F85

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 17 June 2026 13:22
> Subject: Re: [PATCH v17 05/17] mmc: renesas_sdhi_internal_dmac: Fix white=
space alignment in struct
> initializer
>=20
> On Wed, Jun 03, 2026 at 07:57:05AM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Remove extra tabs used to align .of_data and .quirks fields in the
> > of_rza2_compatible struct initializer, replacing them with single
> > space, consistent with kernel coding style.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Should be merged with previous patch IMO.

Will merge with previous patch.

Cheers,
Biju

