Return-Path: <linux-renesas-soc+bounces-29618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNvYKgpxuWm8EgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:19:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 254FE2ACE0D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B35C931A6CE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 15:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DAA3EAC69;
	Tue, 17 Mar 2026 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="p+j/8Qxw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A043343D8F;
	Tue, 17 Mar 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760392; cv=fail; b=JSoWMnpyUxlmh7gaiHjcoJ+ZCkyzf23HftQqAsY7/QWLbM+34Ebwvk5C6/fh7T9EtMDNba/MWVEU1jvkCF8HIPZJGFlL8TcmHBIbWpagt+r1so5ZxISI8ZAWhvUPK/pYFi29MIMf3V6LS4N6Q6stnwKrnTNrwn2Effz4Qrfw4+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760392; c=relaxed/simple;
	bh=nH/hASQ0gTYCs7laAJ5hyUQPvUhzzDiYUR49ukQwurY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YJd0Dw1Ons7j30Z9xjVaH9f9bVNq93ZfkiCPri6pH0gWp6c0Vv7fLpyv4Hjmb7ON0sebedRvzjw6uQieqtpPcN6KNN+HJodp8b4f8EB5YaV6DuZhXZJjyJ/3qKpMbCockIYJMRvbwpPaZ2i7N0LXmcQL5uuUkZ73cIAJa5d0AaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=p+j/8Qxw; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V71bOGn/HFeBIZIyD+uJ/TLKEoK5M1n8IBx7HOvK227xnQt+KgCBjJHXtdpi9iTk6YNc8sTOiXtYx5zBEprq9nxpa8Z5islQutOMF4tw0tNaNrC3dXmg/2sHBoLRZTORGtEzC4PGa5db2qCCFJtfK525YuNk0Z4EPrD6YOWhTZgys6NUxj7QiJuxqAEQweel1RKC89Kdsbz0yIX+QgIrQbkqkYwzDfqSd7NaaUPlQGmw0GF2qjsvl6Gt11UE42zUjATS/p2oxDLRoiFGh9NhEoF1R5J0pE8UD8MXyyB+3+YZZLDqGt7SbN7B8+cl67hnBYqVHTAzEMVTVrREudA8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5ai1X83Jk7EU75tddptJPhcjUS+RL8W2pB39l2V0+w=;
 b=OyGPQRC26DivO4Oqj7eL3jgUmS+mxIq9kIETeukBudbQ3lrUqyrRw7HBLGDUh8IYqb84BYd16/8QyTqfw89NZUCUE7EiYkKocmJUtFtyu5IurIIf02htUALW3t1A/3mThIPB+AoBTyAIWvbTbzVEBZPOKp4UHLe3OkBRRfqPn1G3cYkxrUTsWzMMsS5WCyD2r5ebCUKWStBicbvYqN5viHZ/kP5L45IVUbl/lVbZITYYeyO5iTMbcZd2QlB46jIU8VgENPFH2aWBlzNiASzuTDE/GtI8m0U2S3+8YLy4DZgOhuSJm21vYMN8U8mepSgUBUztap+JkInnI5GiiI/WOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5ai1X83Jk7EU75tddptJPhcjUS+RL8W2pB39l2V0+w=;
 b=p+j/8Qxw5/NjG4aekE8YdW6g4R66FSvrsXHEe2SmE8Y9Nw7QZ35nAsFOVGCqr0tAccBc47KmCFEXjtktMlEEpr94PAJMr9eETINZYi8qhbrO1l49AAI1Zf3TFgL8D0kKmoCJQTjs1VKH9bRn/IZx4q9DjYWcVDUX0a6/tLBV2j4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB14025.jpnprd01.prod.outlook.com (2603:1096:604:364::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 15:13:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 15:13:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, biju.das.au <biju.das.au@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
	<p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <Chris.Brandt@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Topic: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Index: AQHctgqqun0iZdWPQkGCYHsU3REA1bWy0bQAgAAAR5A=
Date: Tue, 17 Mar 2026 15:13:07 +0000
Message-ID:
 <TY3PR01MB113462F9E8CEA0506984299768641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
 <20260317123610.329630-3-biju.das.jz@bp.renesas.com>
 <20260317110112.338259354289bb60a57fc259@hugovil.com>
In-Reply-To: <20260317110112.338259354289bb60a57fc259@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB14025:EE_
x-ms-office365-filtering-correlation-id: cf6cbab5-6197-455d-af55-08de8437b219
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 b6fx25fw4QvQ4ywyBAIi1W39jcOaiaRR/XXlW3YGXtysDu6J43zcLgz5hRD9RAD6HY2wrx1xGv8T/546eLvm1eIEXO0Uxtq4L2DgZsaJHs0clLrMsg/Xmo90dNNDxlh6721d69KUH/HDc3oyNtRI0RgFczbe/NwwTz1ODCdy+eZ1F5EwHt1Qm46wsGIBd7J/3TB62l+ylIDH0Bfg8A2FZb33FjqQ6A37P+Y4tX6zCMp7WVafp2kbv/Vi31fzFNoBFCEKhIWgjmdZ5gXs5AOWABZIwjqsJEnZwqOnHqShs8GzA9q7VNl6GP7ckIupwwqC4KOQvP+1WXlxFaMoTpdfKj5ISjGmvdooaaoZ0WdheZu8UuMghK6PuG8XRkhCL9EqgywAcHdXus1HTcK/7yXqtbvnPNtJD/ZQVb2FAz2qY1CJDPhusrqfvUHaqBH/jD+2cn1+FQ8cX1C/tg2bal3eXqOfmMSv+SddT1Lg3b+vtui3ID+IRFHWxQ+5f7aKq2LLbVsjmY5+Wj24R9Wyr5z9NL0+f/OGEeDJ4/iiidOHlCfe1YNTgcNkL5d07dO9LpCvvxIy1sezvwgOq8DueKfjFAv+OSebdU7a0We3VonuZ7zk+rN/haO72VQSk9uXcBpmGmIEWoLRpFktaYpxtgANs8DSW8g63BBiPDvBcPuRd9zhM4bGGvdNTYqgPRjtjsllmuWVcYWRjJ6CsMiq/16uY1fpMkItYUYHG145nm3uKz8SRhs9XzI3k+aDNnBL8q49HRcL9UFjy+JUMQgHbOgExDFNzeqCUlKHuRzXfUA3VSU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YX3ctstMbjAqEkWGOPymyL8vJVt5jO3XaHvSsL/7vKVq9mSf5jqtIlEJXjlJ?=
 =?us-ascii?Q?icZJyVNZOnElgh2iyG4CdGzqKDilgPhWOtD/z+3qBwo44HC29WPfn8KT8AKg?=
 =?us-ascii?Q?f8g9GA6Y3iZVdeWfykNF4Z1Pto3wgDV8m0qY6VtpMsZL9/Hw5SgcTwyweQdf?=
 =?us-ascii?Q?LcD06uxd0NR20ac9DICXqtdntpuqe2VkkUwsiiGiB83LdbNMMRJfiEIUHM5N?=
 =?us-ascii?Q?76E/r/UncwkRwHyuz/bDvWG9lE9nlwFx/qhXEj6subXW21fOFx6BvwVH1ezS?=
 =?us-ascii?Q?gBcVzpE9SMicHX4zDj3CvSHxIHkfDpufc7yoYk9Mqb30SjqmFp2R3dhWqYG8?=
 =?us-ascii?Q?zUH669FqyDWJyjRmxVl1z2+d/fHE5nXDgJm1TufYDTcNUcjutJdanHCy4NtT?=
 =?us-ascii?Q?Zq5ScSqVnDY0fQp3VU3f7X4puCopwH8yOLrZwmS+DGfxGvzsLZklJCpTq0xZ?=
 =?us-ascii?Q?xp/z6VHnKPNovo6nEOic/ylk9uaOnuUt9p9ev2ryIY4wEaCZ0AzzGwYEZbi+?=
 =?us-ascii?Q?auLhPMPOYc4XkT6IKJekVcSSAcNb4XCer/zok1gCOLPf1+yJLx26yKG4JtCP?=
 =?us-ascii?Q?bXtJF/MMdCsIfuprB5bWIC+VFgJfPLcUhmiNcZDterVqoVmAjX0GOnTSOCIE?=
 =?us-ascii?Q?5YT230bdFjo0LTv3a7KeqtAIdRWLHBhrvCLatL363J0PeQ/lukmDnL9b8Dy2?=
 =?us-ascii?Q?6XUb1ZT1lKNVAiVOxF6VC1K0+FgunIlJz5+8CA10RskfNJgM6sb36y4PRLrv?=
 =?us-ascii?Q?YZQLypv3XyXXBRwY6bDslStYcgxy3d573izzv66MIabOr3DV4c+Qw3ehYVyM?=
 =?us-ascii?Q?kve4M6GuMPp751jvuF/0QsuSGH8MPI5I+M5LOhqLLQtq3+Vz6XnZXoGZilO4?=
 =?us-ascii?Q?aeGxPUNRBcQiJyddZySVXEVHiOc94/KFH2BlKUj77ZxTNGzzYOHOYTzraahL?=
 =?us-ascii?Q?vxwv5//p2ARUiHelxQCQMDqpwbup9jkGYEa2GNFs9ta+6rHjKrBpBUybHsDw?=
 =?us-ascii?Q?4Ukqfkmn6jUQkdphWlARF2M3W+IOhsAtjI7gVk+FcJbowHuhCCTcJD/UtL2W?=
 =?us-ascii?Q?WXOALeXxhKfoakCzbJgIsoR2zchpRX9tzBGPcHxyUZVzUPCoo3x3CTb0pDfG?=
 =?us-ascii?Q?9EwWUrFALN49afEJr2TvXpEQhpmEkXQ2DiGbA5niqKJT/L9YiQV0ouZg4b37?=
 =?us-ascii?Q?TiJ39NZdF3vs+y7wh0ra9KRl5FwngsfzlpDUUd/lPG7LdTdr5HAf+wOBIIxl?=
 =?us-ascii?Q?vKyY48ABcJfbLN6tiIGgI9TmykCpMrgM1PK0fn1R7OBrsealSC7tRlRk+qzz?=
 =?us-ascii?Q?ONZHHLOax0zke1fpTjvT1zm/qXzVPfbZeX/qJFz4Ctwmq7fpIEDWmMD5qzPB?=
 =?us-ascii?Q?E55aktZudL35KR4qKEB0wjAxKtejc72XIH2Q1S/Mfi5w2e3CWKqQXfbi6hyW?=
 =?us-ascii?Q?AY8ch8kNo4+B+car8s2yO2hoMDjSkeKg1jr/jwSxsewxzmUbLwgLzKWwafVu?=
 =?us-ascii?Q?NGS7Kp2R+aVufES1QFp1v6rtcRG3NeXrqoFbewpZBJ62O+iOM7CjEROzfsvP?=
 =?us-ascii?Q?GUGLM/DUZtNGfMcye41zm7QQRIPfdy4KGVoQlTVIfNfkpoYpyZzNf4R2Y24m?=
 =?us-ascii?Q?8wlBNTj4vMg4aj+O7qs2R3Q5cwgIVIWDYJdKpolm8XN/uO0rUO46vi1KuLR5?=
 =?us-ascii?Q?+jGQc0QLW0VAaClEhIR9EQQgnnTBXWYMG4kUYPEpfpGxJe6ca5+Ev5NgOGaA?=
 =?us-ascii?Q?0FVuzxm4uA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6cbab5-6197-455d-af55-08de8437b219
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 15:13:07.9128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vDun+xCVqviKxleE1ywQuYrZK3+dxHxNPZvjeC+lcc271fHCYeAdI5CXLAqOViSmjDdpRiD0BX8ixePHUM/09PwOuxdfjj89ERhVrbNbQJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14025
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29618-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[hugovil.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com,bp.renesas.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,hugovil.com:email,renesas.com:email,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 254FE2ACE0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hugo,

Thanks for the feedback.

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Hu=
go Villeneuve
> Sent: 17 March 2026 15:01
> Subject: Re: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on s=
equence
>=20
> Hi Biju,
>=20
> On Tue, 17 Mar 2026 12:36:01 +0000
> Biju <biju.das.au@gmail.com> wrote:
>=20
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Move reset_control_deassert() and reset_control_assert() from
> > rzg2l_mipi_dsi_dphy_init()/rzg2l_mipi_dsi_dphy_exit() to
> > atomic_pre_enable() and atomic_post_disable() respectively, and move
> > rzg2l_mipi_dsi_set_display_timing() from atomic_pre_enable() to
> > atomic_enable(), to align with the power-on sequence described in
> > Figure 34.5 of section "34.4.2.1 Reset" of the RZ/G2L hardware manual
> > Rev.1.50 May 2025.
> >
> > According to the hardware manual, LINK registers must be written
> > before deasserting CMN_RSTB, and the 1ms delay is retained in
> > atomic_pre_enable() after the deassert.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Seems to me like this should be backported to stable branches (missing Fi=
xes / Cc: stable tags)?

OK, will add fixes/stable tags.

>=20
>=20
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++--------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index e53b48e4de56..9053ce037b75 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -484,7 +484,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mi=
pi_dsi *dsi,
> >  	u32 dphytim1;
> >  	u32 dphytim2;
> >  	u32 dphytim3;
> > -	int ret;
> >
> >  	/* All DSI global operation timings are set with recommended setting =
*/
> >  	for (i =3D 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) { @=
@
> > -524,12 +523,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi=
_dsi *dsi,
> >  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
> >  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
> >
> > -	ret =3D reset_control_deassert(dsi->rstc);
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	fsleep(1000);
> > -
> >  	return 0;
> >  }
> >
> > @@ -541,8 +534,6 @@ static void rzg2l_mipi_dsi_dphy_exit(struct
> > rzg2l_mipi_dsi *dsi)
> >
> >  	dphyctrl0 &=3D ~(DSIDPHYCTRL0_EN_LDO1200 | DSIDPHYCTRL0_EN_BGR);
> >  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> > -
> > -	reset_control_assert(dsi->rstc);
> >  }
> >
> >  static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned
> > long mode_freq, @@ -1030,24 +1021,37 @@ static void rzg2l_mipi_dsi_atom=
ic_pre_enable(struct
> drm_bridge *bridge,
> >  	connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge-=
>encoder);
> >  	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> >  	mode =3D &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
> > -
>=20
> This is not related to your commit message (coding style change).

Ack. Will restore it.

>=20
>=20
> >  	ret =3D rzg2l_mipi_dsi_startup(dsi, mode);
> >  	if (ret < 0)
> >  		return;
> >
> > -	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> > +	ret =3D reset_control_deassert(dsi->rstc);
> > +	if (ret < 0)
> > +		return;
> > +
> > +	if (dsi->rstc)
>=20
> This seems new and not documented in the commit message? Is this a fix?

RZ/V2H does not need this as it uses different IP. Previously fsleep() is i=
n
RZ/G2L specific function. I will update commit description for this change.

Cheers,
Biju

>=20
>=20
> > +		fsleep(1000);
> >  }
> >
> >  static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> >  					 struct drm_atomic_state *state)  {
> >  	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> > +	const struct drm_display_mode *mode;
> > +	struct drm_connector *connector;
> > +	struct drm_crtc *crtc;
> >  	int ret;
> >
> >  	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
> >  	if (ret < 0)
> >  		goto err_stop;
> >
> > +	connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge-=
>encoder);
> > +	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> > +	mode =3D &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
> > +
> > +	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> > +
> >  	ret =3D rzg2l_mipi_dsi_start_video(dsi);
> >  	if (ret < 0)
> >  		goto err_stop_clock;
> > @@ -1074,6 +1078,7 @@ static void
> > rzg2l_mipi_dsi_atomic_post_disable(struct drm_bridge *bridge,  {
> >  	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> >
> > +	reset_control_assert(dsi->rstc);
> >  	rzg2l_mipi_dsi_stop(dsi);
> >  }
> >
> > --
> > 2.43.0
> >
> >
>=20
>=20
> --
> Hugo Villeneuve <hugo@hugovil.com>

