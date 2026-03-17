Return-Path: <linux-renesas-soc+bounces-29614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN8lIEJuuWm8EgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:07:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B69CD2ACAB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2BA8312CD05
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 15:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358ED3E867C;
	Tue, 17 Mar 2026 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TlQHH5lV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010059.outbound.protection.outlook.com [52.101.228.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E52D3E8C7E;
	Tue, 17 Mar 2026 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759668; cv=fail; b=KIeIAlaNskd4VNRvSx/UAU0y5+cZ4HHMmdgW5Y16MpNYs4C/BLRbftgtr8sVt4ahGDcxSmCAum1I33CnsEwOLiR0Ebjn8KYXc1grTA5Y45oG4y5cYakifliJ0YKGOekiNUGHwslyAyxzL+IdkC130fgKaswnT7M9UXJ7E5E1FHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759668; c=relaxed/simple;
	bh=ySCxFwQCw9j7ZlK8Xt1MJiy3pERl4k171AoiftAPkWM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CGUJpddazNB1mTMmcw50Y59gCDzvCpJGwadyba7o6VBnIiGa3YZTTZrCKe/kHawQGLmKnfiCouP0HoyP+7JmhiCmUx63JIqIzmRB+pWZKc+05KlVJ6PoF/fLvNXqbLId2YOtBdb30U5tVG3sCJne9giB29cY1OzR9l9TryJQV2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TlQHH5lV; arc=fail smtp.client-ip=52.101.228.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEKk+QvdOsLar/xHNQ9KpNfbmRLyc6C8CvGkec2qIOYx8OX6s7mECAPtJDgI5WdRuJEp8XqLGxiqCLulOVLixLLh2yR2UX/HnqwBV9ekQiokV6b86CnoCmvVuAF6kY89jMPZ3y5EIrl57ZXaw14WKMtZhImt6iKKm7f04L3ZrGuCW3IUcRJMU4ReFeFTWf5XBPZB84574ng0RuAYGvMS91n2lZIrp/+Vyhm3ZFB6EfGSLUzLFA3LuloeRDosM0N0nqQQWM/xgK6z7ZvjNTBJW5yDQEgO9P5zqI+yd9Lnky8rj1A6H2+7CYbVKTyndAqgSCWUhjTnEHZk5bPuoIT0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySCxFwQCw9j7ZlK8Xt1MJiy3pERl4k171AoiftAPkWM=;
 b=c2G9OQz4jPJA+b9WiwB8Dzusluf0rXUcG3VDnhLdTVM69gKWfZ2wnFtXQIrDKuCK19gStWAqWgNVsdGBIWqOUv0DEytJGAYY+JHLjddTUY0N0pA8Z6EJqG/UkDcSyxD51np0YRhRarDG4tWIrVCoZwtNqVrg8LVzb1KNpd+JMfg8Vzu4p3kF+2DAqwl2Pj0Ufko3pSgPbUpn/PjGsRlcDzQdBUful/LEa4nHCxhDVH5R75JccGiwvzQoeUPt77GkwZn/ZJdYHGBNUjz0Fqr9+NeLZ8toqr3HIw9OYbhWdqD4N3sa29DUuIMSxU8RV58SQu/G1OJM24twSRqCzueyCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySCxFwQCw9j7ZlK8Xt1MJiy3pERl4k171AoiftAPkWM=;
 b=TlQHH5lVHGoXVllUrY/ZN+phICpngvBotMifp248ZIkkG39h5d6WkhGmapStmZkHisRBwgm2GbjawDMwdtiXpOsENQMsc7hFvG/aXiQpPPp1FObWzOtkZFLjt7ELDcExvdqW0NwLqgL+VERWFqL7ccvaCIHAo52PhrTR9ncBuF8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11915.jpnprd01.prod.outlook.com (2603:1096:400:387::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 15:01:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 15:01:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, biju.das.au <biju.das.au@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Chris Brandt
	<Chris.Brandt@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] drm: renesas: rzg2l_mipi_dsi: Use fsleep() for 1ms
 delay in D-PHY init
Thread-Topic: [PATCH 1/2] drm: renesas: rzg2l_mipi_dsi: Use fsleep() for 1ms
 delay in D-PHY init
Thread-Index: AQHctgqoRUPN3p2KdE6QwNezekwI17WyzdOAgAAC/XA=
Date: Tue, 17 Mar 2026 15:01:00 +0000
Message-ID:
 <TY3PR01MB113462938CC04F72C5970ABB88641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
	<20260317123610.329630-2-biju.das.jz@bp.renesas.com>
 <20260317104719.e251fb0feb2e99b7569c2dc4@hugovil.com>
In-Reply-To: <20260317104719.e251fb0feb2e99b7569c2dc4@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11915:EE_
x-ms-office365-filtering-correlation-id: e35991a2-d53a-4d97-2ff4-08de843600d4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 pELL50HaKPwHGIb6ZGNrRknGxXquJkht5iBmIqrSx7Mh4kyHEErh4bHr0B4WA9oJsgQzNfvBCO34ZsRgUsxfiB8DE1jSzf6w1TzLZxb2KSiynpfHpVOdZDhZIKXR0YWW/o++8zrb7vlsrMgqEj9RniCy4xjGEl5y9VAS23kFHJHMGwUoo8sQL8S5lJJUR6zuQNtct1hWaJRPjUHCJlsZ+eyBRpgOUeblgCyTLq+sD5ex2PUsbza+hOjRm/TUGm+yENDRUOE59PfjP2f0MueAZX9fvu8CzuAld12CuM1bJ9MG09DH8yE2Ml3sm/c+LVV2uyiCVhHIKBePDV38UPfRirHwX1mkba69WXXf1l6wyDSXC0ne6HWyB9UK9zeJjW74FVCAgfSCaILEjHmBhrvuYpB0PKq99tvsGSgL7qVT/ge+hAep1hLcqFj5HL019/Nvq82U8lGVBAMdLw99gLhqA8ut09pVMNq7nYlUy6/B82fNVHTINk1q8JHGOjajzjYWrGhgci/mLmUuHkmRuUfc4Xz0Y+USHmLDq4VnFfJ6/PePw0ACmsHPWSqB3jeHL5xAEruxpj/t1mdpkdQbAol4pmS4IoCX8vaM50mJgimLcqR5TaEf6N7CF1lQoClZwWCWDuAd9zJLfZD37z9lwtgooc2xHFN3XgkNd4+xlY85O3/fJBf/yo9fsshQ9FkvKFE/FLnx1SzyWHI2PzN9nzcnPzN9tH/ntXbLpSUL8Mr/O3vMrAwHdArrCVpqXPK1ZrZ5Y8jgNHFlzxFB5w+T/2E4v1OxlB2kMFc3xpYFkpGx5W8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WG0Ua5EMo72nWt2FhsSOqomOLlfiDAlOMaa5gIbD1mhdlg9rfHu0dQLlj4qH?=
 =?us-ascii?Q?klbBnph/ZJ2cjzF3nr/r39UskMFKRGs08J46qi6XAm9Z/z33Wkptq490rLET?=
 =?us-ascii?Q?bHB0RmmGUPHp2kaF+8QrnizhwAcXqko97McHe/bupL6m1lXrNSfvklNIMhUZ?=
 =?us-ascii?Q?gHKgwSe1BtpJx1d97/88KFGeUkWxYdMh0rPM7MmLuAXcW0DII71ItFGH1KB2?=
 =?us-ascii?Q?6PkiGdIuUj/EBstqd7YyS3nbf6Jewt8X5Q99WQRuyvE6/vKEKRrOf0neoVU2?=
 =?us-ascii?Q?+gwjLiIF7wo40yWUhOKvh9bGJbtmi2pQ/p1fczeMXCvXeLrvhgaN9cthOf+w?=
 =?us-ascii?Q?NrQdhZ4ZFSocIoCscwPK/9kSwIHhiGx9oPR8mPcI3ukzRHxAdb+Uqr5YPrVb?=
 =?us-ascii?Q?TgzNEJSDC1jnyJKzcjmoCQaCdFZy38lotsUnaWdgmP0AA3l/26xZ1nMjCZXV?=
 =?us-ascii?Q?n9/EZIkAEvE44VVHnk6t2t9u9EI/L/UaTVVwMCMOhWASnGkjDU6w9Das8JmF?=
 =?us-ascii?Q?rV/NLEE7CUugKEuhcD/wsOubj3gPC9Mm5bZG5+I3PXEzoSI5HN51gG0OAbge?=
 =?us-ascii?Q?StjCdsjCK/ATGJm8OioChfZRmQVbAf6f9I64s7H6h+2T6onaYSu6R3jJzpVP?=
 =?us-ascii?Q?5n3rWsh8NKjt+zBzfGlK2XDAq6CqT27KS5an7WL1wBt6osaYylvxj6kPADZK?=
 =?us-ascii?Q?kQ0mx1uv29hDZFj2bhc9qD+z6t5PJ+bOuu7vGL58eklPVhtjqyv4w5/9izfw?=
 =?us-ascii?Q?YNmGGzzhqxYHTltpByNXUW4hmg7NGSxKHotg6t913KheM92lsbZiHwjSYL9n?=
 =?us-ascii?Q?/ciP3MIt0WXJKJ2kvVwARmPYzTr8upmSqEXZIeUfxneqwyR7EBbDepXp6Gug?=
 =?us-ascii?Q?G47JZM3NUn4yIVf3TZbrJq5R9KebIjt8vrXOo5IpX5yAqB6cwxtkYGOiFY9h?=
 =?us-ascii?Q?YJIZkciDnKNP40vNTK4VRnxeaSVbZGJkFFWu/oIkhtxdfrZY3Ee+1GoOxUfi?=
 =?us-ascii?Q?f5ioXOFBfFmBBuSl5ctZcMWdxgegOvq0Urn3Z5Gxz27CBEAIYkSLCc50cu1S?=
 =?us-ascii?Q?QwZaNEHQbBg5oUwtCB1MEha3gAkv/VmFHRWJ51Se4ZtLtjNjpaVm0L3yL900?=
 =?us-ascii?Q?2QXG3W5fVmQKUl/FjZpJqhmMH76EtEVdM0uvFmbDmHhuL8tV+tvazpQZdCZ0?=
 =?us-ascii?Q?8X/eRC7CLEvFP5veqzP2YU8Q4dx7oFNpCrS5bL6+Slf4l0OjykUfRK5jDWRt?=
 =?us-ascii?Q?U/fGwKbMhocl7mw8BChi8xiZpwE9X4LBLZQ0v07AyCRdM+xyS7zF1b0Odq50?=
 =?us-ascii?Q?GY3iZ19Wqhj3XBVElp5KJL16TfT0UQEGaymr+1RXJYM0Q488uM93O52xdZ7Z?=
 =?us-ascii?Q?qqw4at2bT4SZpn0Rbmh7YvOGovKJ6PVMer+FyWhF9Yau0yuPut+vfsJ6yok9?=
 =?us-ascii?Q?hqkXRDyroVOV+BjGKPLPHl9EMb357clb2MRPiEjUZBuULnCmGNUcgNf2FK8G?=
 =?us-ascii?Q?dMK/UxU3xB6YtDeAE0Rh45SoavaVbDQHVxr7D2cuVcEkxCTqjbys8mJgSL5D?=
 =?us-ascii?Q?UkfC+cU1WpDO5yLfG7bZSDXOYAI0fA5K2kr9m66UD5+W749Trgg+NJePhXcw?=
 =?us-ascii?Q?MFFXot7Z9wA40Ce1mPk5DhJnGM+xTAc7MTVjS9HN/mMR12qu07cMztWk6+sh?=
 =?us-ascii?Q?QPE/L3rP6IbulfMqldwiy9Fh7zRGroM1YMkk2ICbA/6G3IOhLE1ESMLR3vag?=
 =?us-ascii?Q?Dve2DzB33w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e35991a2-d53a-4d97-2ff4-08de843600d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 15:01:00.9923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ls9x5zkGJfZHnXVCrBhNiJXZvhHXSBW5F/1JnKBnfsO+7UVYz2S/OImA/GjZNxOWcK9HwXu0chcULITtfv94RlGD2pGF94Tpksm/6t2toXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11915
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29614-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[hugovil.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com,bp.renesas.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,hugovil.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: B69CD2ACAB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hugo,

Thanks for the feedback.

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 17 March 2026 14:47
> Subject: Re: [PATCH 1/2] drm: renesas: rzg2l_mipi_dsi: Use fsleep() for 1=
ms delay in D-PHY init
>=20
> Hi Biju,
>=20
> On Tue, 17 Mar 2026 12:36:00 +0000
> Biju <biju.das.au@gmail.com> wrote:
>=20
> > From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The commit message seems confusing to me, indicating that you only change=
d fsleep, but did not change
> the delay? Maybe change it to indicate that you increase the delay from 1=
us to 1ms, which is the real
> reason of the change (why).
>=20
> >
> > Replace udelay(1) with fsleep(1000) in rzg2l_mipi_dsi_dphy_init() to
>=20
> Same here, the real reason of the change is to increase the delay, and th=
is is not obviously stated.

Agreed. I will update the commit message for increasing the delay from 1us =
to 1 ms to
match with the hardware manual.

Cheers,
Biju

