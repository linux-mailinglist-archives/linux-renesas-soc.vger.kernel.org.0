Return-Path: <linux-renesas-soc+bounces-31077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPHtD/6E12mwPAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 12:52:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E03563C94BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 12:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 478A830089B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 10:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682FA3BED04;
	Thu,  9 Apr 2026 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dh2JgoiZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036143A8FE7;
	Thu,  9 Apr 2026 10:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775731961; cv=fail; b=gB6z80zpCjXyvdwmJbvnLfmUyUQikC+mNGRr/7T93QL4Bxfc2YU8DDMvEualMitbOMXwIIoeCp6ErkfNQO7MfgMquJLjklAeKA/2Jo4yzXm/55bFGkhgpibvtVd6twwc7GPf+R7+MTWitgK8oPqf9YskRIfzYOo9msFd+Nwrq30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775731961; c=relaxed/simple;
	bh=WjmrTUqjp4I7eBL9D9T+LcmP8UjDVofvvntvIvlSuxk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fzTUCFyCXbAYSdchbRxm3+CP7avsn4P5Le+PBmYZVKDRsk5Co9oE5p57tvNZLlpVclMGG6RoGwyqsKNHm0xiVXBcwmhN9ITgQb01YMRtkcf58GRd1B0lx5o2Dp18DlBoRX2z1sa5FqcM/jwmW4lcGuWzXjex9rVGnbQ6dHkhyCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dh2JgoiZ; arc=fail smtp.client-ip=52.101.229.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWtVQvj9SOpLxmZDjTkYmeeux1j1mtzIXno/5IufF+CbBZrEAlhhj9D3+E/vY55azo/z8IkWQlJX8d0wDuKN3Qw/6zlC8E6wfxZqIMwSq+qlgdUJ4GZoXsWzI+T+ZDIbDH0lFFTcWJW3LeyMQKH7LQ70BSue03sxLJud5oYWK3d2pJckMiOYORorcdHqEJbFzV9IuXTgYqfbYT7cX6q+v5uw9l+PT4BMZ3OqDSN2tpCvh5S8xLrab5uMbuoRXZDLdKx7OV1GaT9v1UEM+5TYhzVnWFe5YpUe8XkX8D0gMJfRaIVcF4kICR3Mxxax4qUZnHzr53dik7Ptq43SnLAmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5Wk8MyEsZ/QNSwU7+WiIuLzCeDQSOP5wF2cTi5Um2k=;
 b=oGyZoP5D0+hOBFbnqz6QEoPCdOCxwsPyASl+ayk46H2i0joMZF0mXXmYiw6clZ8fgIYxhU+wiRaW7G/xoI+CmWfx24b3YYOCZxIlQOokOtUPIC7ZqD2QHH6Sqe88XZ4gqhdmdKvsx99MjZIL2SmlvKClmB9/yQR6ms+uHlzCcoXuwFSP0+1U+xFyveXw5FxB9eWC6Q4ZmmyZCeDo9sBk8c7E7PAXxy+6CoO7fkVMUOqvNX8l2Mw2uQV+/oq5G7e8EFyprSQzE2L7geM2tDqFLFf4XSQjKaqHYxkPWsCoH11deDcDpVCHRpeiLkYiKLIZKCBuoShg3z7Fug6xKCzwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5Wk8MyEsZ/QNSwU7+WiIuLzCeDQSOP5wF2cTi5Um2k=;
 b=dh2JgoiZgilgMd6xcO61Z4eL2LxH5W/LJpmJeKgHTfpY4t6Neq/qCOTTq48qSE/vPjCTmj8IqAaecEX7oe5H/fls+MbHLBM+ygXqj7b6EASAY6lRQFqRuEn9RMni63rBuj3DZd7qte2JvBg37o7AEA8bxaCVv26IP4diYFdZluc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10975.jpnprd01.prod.outlook.com (2603:1096:400:3a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 9 Apr
 2026 10:52:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 10:52:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Topic: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Index: AQHcyAc7ZyEBHUmX/kuuIfqJuejTO7XWgYEQgAAF+QCAAAVdkA==
Date: Thu, 9 Apr 2026 10:52:35 +0000
Message-ID:
 <TY3PR01MB113465B215559404D0FBD04AE86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
 <20260409095633.70973-3-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346A0F047F1F7296B8F4FCA86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <add_krK3MC1-SSsV@shell.armlinux.org.uk>
In-Reply-To: <add_krK3MC1-SSsV@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10975:EE_
x-ms-office365-filtering-correlation-id: 7caa3bd1-5528-4668-83a5-08de96261c58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 USzYgxXB3upPlihsRITGLS7+NPXw1vcHRr/GHocRneqzBy1pj59bZTU9EOwaDjqo4y6jHNGAep4n58j0Ly8y2qgli+MI7wzwuP8hYoviIkm2+PXLjQZDRmrNnRnzyX0UiL/2LEqhuoGoQQJXgFuuUDMAyV0MwuV8gaETIsqDKccrbgPtE/9+Kw/iWEp7yUv/PTT/873tSG1xnAexK41wMYJQaXDYWwFcYlW0Uk3bJymxAxWRPyrWWNAHBXyOZYHZvItg3BFBKyGmGNYgUK+6pddeHy9hZhxQxMMga1AOMCL0DtA2ubpOLbVU+7/l9yG8a+kbakCzJvVKZntXm22ia86u7HJTByzFbruf7e3WQThLWTbFwyhbxtvSw8XIEOe7FfOUaGxxb+zilceN2wKah0+bYokaRQp4xWKYsDnAEa//wnYH1MhkML7qi5uAx1uBnKsrhXuzNfwKIwt8XyU4n3RtUCVSKRQrmSLB2MtgAkra3f/URn/Hq+mmWm6z1Vp/FHVOHLnwF27PmYXqSmmSicU8GHFHVrKmQfyY/FrrS2BrVSx2LnlCJYBRKJsihhxHWCeI11nKD3az3JfZ+NuZDB5pX9D7Vu3zE57mkuM36qFVHRZnvMm98Ik3kt6Eo7bm0xcB4Pp1ynGHMIfRo6GDPwoIeSiI98p4dG0lHaGjMQWu4PfUiWsmGe7wslmdlkbXEYDit+Ta1t7wPclXh4Vm8VQ0IZRLkhixc2JMhcUGB8Ewu9IMHskzM4fGB7ykWSQbILyNgC8e5bzfNAUkFC35GgRF8/0SwbrJl0cbSbjuxwM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KXrl4XleHFlM0Nh84EF/9bGLQ5bY6ydjgkYZCqY9bPfkN141/E/EMhS3jM?=
 =?iso-8859-1?Q?GANQva3LdAtgdz4+BQdCD19i9vHq47C6Z0qimLahDS/JIN1mkJap+lLcIH?=
 =?iso-8859-1?Q?pyI9EB9ZB6V/ktfncyErmsfYK9/jYSk7Pgy7jgRJurkBdLnvKR2AB77lCX?=
 =?iso-8859-1?Q?ztEKZrUvJmoH2RJCKbWEASnGQDV98N2qy6ne9fgtjhc/zqG9WYGWqh+V56?=
 =?iso-8859-1?Q?Q7y9FZRWIMjV4S2dfLRW81rkFjR4LieOYruJKZm7hooyDzfIrNg0BmGUnL?=
 =?iso-8859-1?Q?r3QgNgAI4+IetW9IgbYuESNN7C7XFyBNuf5RQWPAlYLRrvLay2ApTrkRK5?=
 =?iso-8859-1?Q?4FUm7w6Ue5/ndFqnCVHCRbQAA3rffZ3ODpArCwFZdHV8mt0yVkAdeR8nUk?=
 =?iso-8859-1?Q?UCyFo65iH33PCETIIdc4Mk6shPR1GidhO+UgePmd9tN071ip5V/AHl6gUr?=
 =?iso-8859-1?Q?sgA4aLwnSswjI8Gk3JpycI1L5bUEy9VVh20o2/nyvSJ0eN+v8dPKn7GLks?=
 =?iso-8859-1?Q?YKjRLbqf7yr12npkudiCiAMySrt00/ao/jmmAzgoXYq/QIHNRuNd28biXO?=
 =?iso-8859-1?Q?EtMDt/4sq/cgcy8sZbLLK/v0nDy9Xi56O6UueOgqfV4FUcGxx9KEdF8QJV?=
 =?iso-8859-1?Q?zac8z9FuQO5Egjp+FTBwbBgoBnfg/aZplbJ7az5Qj4qDkf6SA3JCCS3JB2?=
 =?iso-8859-1?Q?pPfgFhOOmr/QYsLWvS4ZHnzvbDLMcMJMEgQlwsZkgEo7PDaqwki9l4G0vr?=
 =?iso-8859-1?Q?h5oOUIuw66iRrVqXH4CNfy4pLC98/64IkQ4JMGMOEllD3MUxeqo7aJLIsH?=
 =?iso-8859-1?Q?FqnbDu2M8BZV+LrnrwoZEdxn2ooOXwrs0TYBgFOfhgE2OhGbLo809/ULM5?=
 =?iso-8859-1?Q?Dlgw6C0cSvBbTGTMHOV9LTnFj3GQttedMT92zpEcE/6WGXl88IwKj0zIVo?=
 =?iso-8859-1?Q?+5LwRiCX9/q0TQfZ9OnhBHh34ht52xeMmNFS3qOmrPWdYkv4sRR2V/GgOG?=
 =?iso-8859-1?Q?j1A+kX+nT+2yIMblqazqGE4kopWjs8VXjKWJHrsWvYd4qu1QANhv76+3hC?=
 =?iso-8859-1?Q?bm4Hg8YOI2+DXX+2XlVXx8fIXFKxIn0XsyaAPuXbV8D7l2t4HzerhXvW2d?=
 =?iso-8859-1?Q?VyBtngK3yUIsQqu+KsJYTKVn4Befd+/Oxzr+UazbsFZO8sSdqPU/xoOQtU?=
 =?iso-8859-1?Q?pDyJWqqvqlNBi7dZYW8bbi7HGlvVzTD/y2waA7oCqriMsMP3SXl9s7J/gZ?=
 =?iso-8859-1?Q?E+vOW9tw7bvtBA5IQ6A8q96ahaAQuqXHqkgDUeExb8ur+0qQGL4kA/9osj?=
 =?iso-8859-1?Q?ENRe6E6zA23SkqveC/Chgd1mOSGnkdPvg3owVa6dvu+hxBsmevVWS1g2mz?=
 =?iso-8859-1?Q?dGQJGH1+mjNHOEEtTbltEpZ5A32BbsnFUowaesW7hACrR1IwBxbKrWOxd7?=
 =?iso-8859-1?Q?Nrw/TDGje44ttRz8z9Vo6FyPi5IahRhCktSZTUARYcnVmfBuYV/uy4BZkT?=
 =?iso-8859-1?Q?eJbVLVqplaSBMa/b/hHtb+vje8n3Ya2QqHbACRY2llySaAw4qkYcSwk78Y?=
 =?iso-8859-1?Q?K8+7G6JeQRoOtTLcfdZCtG3l2LboU6YU70niRGe2alV01GxH64fH0RL572?=
 =?iso-8859-1?Q?dhOalY8gFrXLWEMpFhXorkIx+GS/XbzyhChXP1Gj4njLmaUQWHRbSAeO8c?=
 =?iso-8859-1?Q?NhibG6t7MO3kcljOtm5jPI3qu/Mhw9V4FD2CDgmFJhIbSllnhSsNbF3BgZ?=
 =?iso-8859-1?Q?KZ/rePtbXia5q8yYkK8k+A+JJY9Seaf9aNhnxfXMnK1Vz5YiPZY5pVB0/8?=
 =?iso-8859-1?Q?QXAD1/DEdQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7caa3bd1-5528-4668-83a5-08de96261c58
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 10:52:35.8623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SilxiOttL3jpKuTRoIxyRpqfHR2hJmpG3B+RASafTjULso1Y6Yk2dcbm2mmj2UxB+/OQIz7svTuUvjuj4a7z+XSZBYQ/v/hGD4s+nzlCobA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10975
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31077-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,armlinux.org.uk:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: E03563C94BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell King,

Thanks for the feedback.

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: 09 April 2026 11:30
> Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
>=20
> On Thu, Apr 09, 2026 at 10:13:10AM +0000, Biju Das wrote:
> > Hi Ovidu,
> >
> > Thanks for the patch.
> >
> > > -----Original Message-----
> > > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > Sent: 09 April 2026 10:57
> > > Subject: [PATCH net v2 2/2] net: phy: micrel: remove
> > > ksz9131_resume()
> > >
> > > ksz9131_resume() was added to restore RGMII delays on resume for
> > > platforms where the PHY loses power during suspend to RAM. However, f=
or s2idle, the PHY stays in
> Software Power-Down (SPD) during resume.
> > > In that case,
> > > ksz9131_config_rgmii_delay() accesses MMD registers before
> > > kszphy_resume() clears BMCR_PDOWN. The
> > > KSZ9131 datasheet states that during SPD, access to the MMD registers=
 is restricted:
> > >
> > >   - Only access to the standard registers (0 through 31) is supported=
.
> > >   - Access to MMD address spaces other than MMD address space 1 is
> > >     possible if the spd_clock_gate_override bit is set.
> > >   - Access to MMD address space 1 is not possible.
> > >
> > > Additionally, only RGMII delays were restored, while other settings
> > > from ksz9131_config_init() were not.
> > >
> > > Now that the preceding commit ("net: phylink: call phy_init_hw() in
> > > phylink resume path") performs a
> > > phy_init_hw() during phylink resume,
> > > ksz9131_resume() is no longer needed.
> > >
> > > Remove it and use kszphy_resume() directly.
> >
> > How to avoid code duplication in this case?
> >
> > For eg: phy_init_hw() makes the phy out of SPD state
> >
> > and kszphy_resume() unconditionally makes the phy out of SPD state agai=
n.
> >       =AC kszphy_generic_resume
> >          =AC genphy_resume
>=20
> My question would be... if we mandate that phy_init_hw() must be called b=
efore phy_resume() by MAC
> drivers, then how much of kszphy_resume() becomes redundant?
>=20
> Given that populating drv->soft_reset() with genphy_soft_reset() means th=
e PDOWN bit will be cleared,
> genphy_resume() becomes redundant.
>=20
> phy_init_hw() will also call drv->config_intr(), so that doesn't need to =
be done either.
>=20
> It will also call drv->config_init(), which will call kszphy_config_reset=
().
>=20
> So most of kszphy_resume() becomes unnecessary. I think the only thing th=
at remains would be the call
> to kszphy_enable_clk() - and is it fine to call that after phy_init_hw() =
?

It just needs kszphy_enable_clk() and phydev->drv->config_intr() to enable =
PHY interrupts for
suspend-to-RAM to work on RZ/G3E SMARC EVK.

Cheers,
Biju

