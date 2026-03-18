Return-Path: <linux-renesas-soc+bounces-29718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN35Lr5QumkAUQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:14:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2916E2B6BF5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C6B4301DB98
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 07:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189D336895A;
	Wed, 18 Mar 2026 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="I280uN50"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03C718DF9D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818029; cv=fail; b=XrDicTLuNxm/18l0eeG3wgkk7ARY2Wrc5uhn2mJGfpydMubik91Q0eLU8UVZ7QTmA962XpXvTMXRFV4Xyom8clol7ZJlIo0MJ4i90yKg3PL1bkzoifrJex06gm2VO3Uvld4tOvBSC7iBp0bnTH9mN8FrTGcchRUXuyH5Lxjt6RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818029; c=relaxed/simple;
	bh=ktXs85z6FKze+1QtKWCTAFHq8vKd+7Xzyz+EIZSpWso=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LitnKg0kExvffTEkGmIuhdCHK1qraLVCt0/YHCpFXINZCBhrTcA8zFkAnoKC9tUU3jKcCyGwirqkogeWc1AARJxJIG6DIACWqpFfqNSv7AynwFK9tC1mLbLftG1iT90yj4or97+FLToM2gPpy58jJxzKTTRkL0E7HDQsDAmbeUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=I280uN50; arc=fail smtp.client-ip=52.101.229.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6pSfkOiSa4EPv7zIZjeHyhf08SZ2yYTDq9tnZMLtE+LS+SfcZrboWZe+VSnx/fRHJD4PhpWydj648+bddF6tGdHUNP0UvxwIt8WAeiEvcGXgRf0rRNzI95F14cWSftfYy/z5bhMJ7Ib4jWksbu6XC5dc3RsYPkUGearLvrFBDRtKT7qeFlSu48YvYdWj3ikMhhUltKiDHlq9KYkCD0DBPEdu6X7CBzmCsA4xnq6Q87udyuolK4BiV7+htSbYYu5P8KLvm8FFCEsjW0HZuPdJTQjUSTC7lAkvrjlgmUJ6rkPbOcTrsdgta0NJiBqgJiTKF2gqgtd6c2GT3oXhaAUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HcmjdGEBbmxeF2l2D0ZmKar6jrPMkrxkgnRPd3bapE=;
 b=UfSue3MFj+I9/4TSbaHTin6pwF83a/aVfCtCPNiaeFFNrpWPHSReeX06KN2J94bGxxNg8Rt6X8+7noAfVtIBzYZUmQnJnzEUri/lpmHe/N0KxO+bB8jJ7a0F8wvkl68o+wuigHO3A33X6xh9TM/uFZ0H2ResN23pHaf1nVvcSAtw4yC+HZMCUx0Z0y+g0mjCJPuUD0j1K8LFmjCIvE4bm7appFox9bGpldOjlwMPJWqbQGri1DGhiMn5Thwn8rjgXYsVWa0D4L46v6JbEgxmfaIXnL2nJc0UOMF8KPCPTbWxleFfWgUFgnNWozuqQ7+zylKPJ0yRZUGWyXaSxFCPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HcmjdGEBbmxeF2l2D0ZmKar6jrPMkrxkgnRPd3bapE=;
 b=I280uN50aO8ZQYM69e1t3HwbkgVKR9fg3ERtGSe2dF4DI2j29Qx5EzHlJX24DoPLwNoWlsgJSOEFN8AqTNKcnOYOpeh8EQP1g/x2Oay++xffVeinYpwTsvq0PlfrIYT4B5IjA+v9P65BB7IKApbv/t2E5qdQvcCW0Yt0d1Q1otA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8820.jpnprd01.prod.outlook.com (2603:1096:400:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 07:13:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 07:13:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	tomi.valkeinen <tomi.valkeinen@ideasonboard.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH 2/4] drm: rcar-du: Store CMM device pointer instead of
 platform_device
Thread-Topic: [PATCH 2/4] drm: rcar-du: Store CMM device pointer instead of
 platform_device
Thread-Index: AQHctmSLhESXtiws406kB56tH3GJ8bWz4Bdw
Date: Wed, 18 Mar 2026 07:13:43 +0000
Message-ID:
 <TY3PR01MB1134608A5C98A321E1032FCD4864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260317231930.595719-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260317231930.595719-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To:
 <20260317231930.595719-3-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8820:EE_
x-ms-office365-filtering-correlation-id: d86f8564-90cb-4ddd-42a7-08de84bde37d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 y/Xwit0IEuj9eP4wD2aXTOJU/NxHqGs6KNQB92AyOAUYN21UV80W6Ue8SyJ9PHddWL5sJ9EFDJexC0ioHU1sn1w3Ja56sK1bSXkTzeTw+Ak4alGi66yCY6iOjryMajfjcMcyigZBQitT9Rrk+BshH2DoQ3paiC+49fCI054M2/G37KADisi+TavU+MjtQSIkkK2HehlC8bEuSJiEQdTJWW1DAzS14becCKoXWiHWsBThc7wmkhHJVDPMd+wRDvhayLxhsPs5cw8srpkYl0IktsWQmhMB1LUS6R12/kStMIwjqxV0ABcCrQbHa1uPDDjNut6bhZc6ffkPlcJwzjHDyCnwxc3E2o0L6io/gHQRVEyuvfC3jQOqnpHmEfn+yJI7oG760hDu8jG0wAU1vCKydTOG5gKMpuI1Gr7oo//hRYuDKC7HUL7izpdeLwuR54giHz3G6UQe4h8Nhv8rHGzD5/1hF+krvV3VPlgLnkRf+H4GEg7UfOex8WuslkiGZeW6ug5tCl5wbzxdamLsICluNxjdOj1CYhXsXY1geT6Z21p1ah04ELvz5VXTOqQyrn813nl642yNr3MykW8yTmQKGnN5aXg8Exj3nE08rrey1gDol/k7R55G4mANyTkGRNSpQX4LGxLwuFB4hv9Tf64CBvjs9k82nGnhfSncmkX94aa4rpuIZi5wIW+HKnqitWMeg4C8Vewc4mOVPt9MSyVSpZGVkBlRaf5UmAhutMJxctBEk9EyEOjboSS3NuRqA5puQ0VlMRBT7rnSwgedlbVWagFUMYQgkkqa038GYbZML+M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gKfFWbBeXaHMHCiNKWMxENORuAHU/3KXGnxPvvgjtkxhRWo4qXLK0+C8Xyg3?=
 =?us-ascii?Q?HW2Z+nSPo0Hri3yRLu7yCvcaOY4eVAXsj3ZgUFOMpGdwBh6r9EDeo6f7EiPt?=
 =?us-ascii?Q?rOwN8fFqiUE4LF21Cp3NFNQpoxZBngpmgsrxePLA944xTZl6kyfKT13QyeK/?=
 =?us-ascii?Q?sArpUzCN7nZDGuDbvaA9TsDibHVsBYA+0StHnKxt7xG8MCXCvOsW++X+hSvv?=
 =?us-ascii?Q?FKSFBnVhkAChouXJIDM3grkcymVE/uxKjqNqKeWZC+jkc51VzcXec9hEd8cQ?=
 =?us-ascii?Q?jtch+ogaY/GWTOnUfrIL/iI4MZilUSfcRFUxOMcqx9K++CuKRQiWywOsqjxx?=
 =?us-ascii?Q?whk//ceDhaP/X1movR6Pbchs392/IHUAqJw8YHBCbF5XjIU8YehFfaS+gqmL?=
 =?us-ascii?Q?aOvYSGJ1GmODBC0rqwRIKtZGBaPqp1ZP1z6HHVYXU+LTU7anOLvP7jbXNtgq?=
 =?us-ascii?Q?4dsCBYKt2XCTi6LRJh0+iF7htv8m6WnmQyOTWD6/banMC+hUVg3nh9LMgfw+?=
 =?us-ascii?Q?OWipbmiLfz8dZIZ9n5AMqKcatKy7nZiT1oF2SC3nNOGBUhcKd2xk22/ywu/i?=
 =?us-ascii?Q?MbOIDvRcR8YRYndZUxaLTq432jvts5KHl/8bFn+XTHuahDuUW2zq5ejwdE21?=
 =?us-ascii?Q?kAqyrlS90UYxHm2V702cnsWmNmhG+yPoEGTxVS8ImovVsAgjEtXJ+AtUqlbc?=
 =?us-ascii?Q?W95uAe6LsYhQpyUZCOqb8LTVZ52huou34FHfQbKzj3T2Z1UnKwSGGva0kkMU?=
 =?us-ascii?Q?YZ6d8oxuLyhRbGhnfA2Xh8KxI1nBPyIBrteHq7AeCE8K/qQmCTpn1gMeYlje?=
 =?us-ascii?Q?+HdfmJVOLtuULKQn21EOP00ptv14268nTvk/wOi0cx8J7Zap7k3CDD7jO6o7?=
 =?us-ascii?Q?nQ0bKth4kuufIWT6O0gXQSZBKOoevQM//tgdst5Gm30TcsayD5muiCoBCHYY?=
 =?us-ascii?Q?Y+Z0CfbyjKMViF70+zWm1BCQkeBg3y9/0puInRgo+FXgyFfJpQKfjYfeqSOu?=
 =?us-ascii?Q?dwIVBMgFDpXq49ughlftYXj+SIYV8Lg6emdNUoReXu+CNiumkDIVycTIkqib?=
 =?us-ascii?Q?U7/EQolzsy4M582duyg+tUMMgoA61sgZ9G+E0Rzt9w8BJfoqeQe2GkXEoa8y?=
 =?us-ascii?Q?x/YueDyhvdos4U8Y3RWu8bazyVA3U+jNX2n5E1HhwrSTORy4mPxIHloVWZEL?=
 =?us-ascii?Q?vAYIgkh8xeanAWCb98T0Q56ND0oElQmXnHdBWzIM+lP/MV4QjtBrCQviLRpj?=
 =?us-ascii?Q?b+YTxngBBkWpQVn3pVt9eYgEVLH5riru/6QfrPGHp+fHzCXIUdWWBYuE4X+4?=
 =?us-ascii?Q?eOY8bVWEnr9bik0VzNQJCl8wDdGKqlttN54FN+IbCCQDmvZgMNA0L3Rq5Cno?=
 =?us-ascii?Q?SqS10umUafdvSK1jlwnDOcRJtNz1OOqFQjzb+MtN/fSanAbtbLovVJJJnNo3?=
 =?us-ascii?Q?ksZ1ppGIzN2+Yxkz5HPf6HQwEeaHmDY+GcygQADa9mJr5bPKBbmVPX9XvvTQ?=
 =?us-ascii?Q?YNv573pp0ijYufsEmd/KOg9HACINgczR1HyZY98OBAEcjSz58AYy+bWjdlVi?=
 =?us-ascii?Q?Os+/TOChJL6Pf1Gh1ZqZQevYS5TmO+mq4QOEg/XHvb8sXXsOn737QY7H7vfC?=
 =?us-ascii?Q?BPXVAply1FsWF06eH8oG88fJ+qtNQwSFUof75O08Yu0MAc9KVC9V9QttF4u8?=
 =?us-ascii?Q?u7MQIVupX9Oxv06/1O/9ckCecO+13zW8hbJGBthsXNU0l+F3Lm+VWdsu2y2T?=
 =?us-ascii?Q?rvRt3bmiYw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d86f8564-90cb-4ddd-42a7-08de84bde37d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 07:13:43.2988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+o5lPTsZQ1CUZseKevnRSSZYrX9jHbPa0w4B4ZfhNZ7LV5svOQCyvik2kqpCv4mLmPzY+y4okD3gTrLAozaUnmO1rkNIEfo5b8TEIabS/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8820
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29718-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,ideasonboard.com:email,lists.freedesktop.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2916E2B6BF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

Thanks for the patch.

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of La=
urent Pinchart
> Sent: 17 March 2026 23:19
> Subject: [PATCH 2/4] drm: rcar-du: Store CMM device pointer instead of pl=
atform_device
>=20
> The DU driver stores the CMM devices as pointers to struct platform_devic=
e, and passes them to the API
> exposed by the CMM driver.
> This is similar to how the VSP is handled, except that the VSP uses struc=
t device pointers. Replace
> the CMM platform_device pointers with device pointers for consistency.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c    | 26 +++++++++----------
>  drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h    | 18 ++++++-------
>  .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h |  2 +-  drivers/gpu/drm/r=
enesas/rcar-du/rcar_du_kms.c
> |  6 ++---
>  5 files changed, 27 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm=
/renesas/rcar-du/rcar_cmm.c
> index 93ba115d654f..5bced9d778e8 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> @@ -59,7 +59,7 @@ static void rcar_cmm_lut_write(struct rcar_cmm *rcmm,
>=20
>  /*
>   * rcar_cmm_setup() - Configure the CMM unit
> - * @pdev: The platform device associated with the CMM instance
> + * @dev: The device associated with the CMM instance
>   * @config: The CMM unit configuration
>   *
>   * Configure the CMM unit with the given configuration. Currently enabli=
ng, @@ -73,10 +73,10 @@
> static void rcar_cmm_lut_write(struct rcar_cmm *rcmm,
>   * TODO: Add support for LUT double buffer operations to avoid updating =
the
>   * LUT table entries while a frame is being displayed.
>   */
> -int rcar_cmm_setup(struct platform_device *pdev,
> +int rcar_cmm_setup(struct device *dev,
>  		   const struct rcar_cmm_config *config)  {
> -	struct rcar_cmm *rcmm =3D platform_get_drvdata(pdev);
> +	struct rcar_cmm *rcmm =3D dev_get_drvdata(dev);
>=20
>  	/* Disable LUT if no table is provided. */
>  	if (!config->lut.table) {
> @@ -102,7 +102,7 @@ EXPORT_SYMBOL_GPL(rcar_cmm_setup);
>=20
>  /*
>   * rcar_cmm_enable() - Enable the CMM unit
> - * @pdev: The platform device associated with the CMM instance
> + * @dev: The device associated with the CMM instance
>   *
>   * When the output of the corresponding DU channel is routed to the CMM =
unit,
>   * the unit shall be enabled before the DU channel is started, and remai=
n @@ -113,11 +113,11 @@
> EXPORT_SYMBOL_GPL(rcar_cmm_setup);
>   * It is an error to attempt to enable an already enabled CMM unit, or t=
o
>   * attempt to disable a disabled unit.
>   */
> -int rcar_cmm_enable(struct platform_device *pdev)
> +int rcar_cmm_enable(struct device *dev)
>  {
>  	int ret;
>=20
> -	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	ret =3D pm_runtime_resume_and_get(dev);
>  	if (ret < 0)
>  		return ret;
>=20
> @@ -127,7 +127,7 @@ EXPORT_SYMBOL_GPL(rcar_cmm_enable);
>=20
>  /*
>   * rcar_cmm_disable() - Disable the CMM unit
> - * @pdev: The platform device associated with the CMM instance
> + * @dev: The device associated with the CMM instance
>   *
>   * See rcar_cmm_enable() for usage information.
>   *
> @@ -135,27 +135,27 @@ EXPORT_SYMBOL_GPL(rcar_cmm_enable);
>   * state shall thus be restored with rcar_cmm_setup() when re-enabling t=
he CMM
>   * unit after the next rcar_cmm_enable() call.
>   */
> -void rcar_cmm_disable(struct platform_device *pdev)
> +void rcar_cmm_disable(struct device *dev)
>  {
> -	struct rcar_cmm *rcmm =3D platform_get_drvdata(pdev);
> +	struct rcar_cmm *rcmm =3D dev_get_drvdata(dev);
>=20
>  	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
>  	rcmm->lut.enabled =3D false;
>=20
> -	pm_runtime_put(&pdev->dev);
> +	pm_runtime_put(dev);
>  }
>  EXPORT_SYMBOL_GPL(rcar_cmm_disable);
>=20
>  /*
>   * rcar_cmm_init() - Initialize the CMM unit
> - * @pdev: The platform device associated with the CMM instance
> + * @dev: The device associated with the CMM instance
>   *
>   * Return: 0 on success, -EPROBE_DEFER if the CMM is not available yet,
>   *         -ENODEV if the DRM_RCAR_CMM config option is disabled
>   */
> -int rcar_cmm_init(struct platform_device *pdev)
> +int rcar_cmm_init(struct device *dev)
>  {
> -	struct rcar_cmm *rcmm =3D platform_get_drvdata(pdev);
> +	struct rcar_cmm *rcmm =3D dev_get_drvdata(dev);
>=20
>  	if (!rcmm)
>  		return -EPROBE_DEFER;
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h b/drivers/gpu/drm=
/renesas/rcar-du/rcar_cmm.h
> index 628072acc98b..1454605b8100 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.h
> @@ -10,8 +10,8 @@
>=20
>  #define CM2_LUT_SIZE		256
>=20
> +struct device;
>  struct drm_color_lut;
> -struct platform_device;
>=20
>  /**
>   * struct rcar_cmm_config - CMM configuration @@ -26,29 +26,29 @@ struct=
 rcar_cmm_config {  };
>=20
>  #if IS_ENABLED(CONFIG_DRM_RCAR_CMM)
> -int rcar_cmm_init(struct platform_device *pdev);
> +int rcar_cmm_init(struct device *pdev);
>=20
> -int rcar_cmm_enable(struct platform_device *pdev); -void rcar_cmm_disabl=
e(struct platform_device
> *pdev);
> +int rcar_cmm_enable(struct device *pdev); void rcar_cmm_disable(struct
> +device *pdev);
>=20
> -int rcar_cmm_setup(struct platform_device *pdev,
> +int rcar_cmm_setup(struct device *pdev,

struct device *dev for consistency and same for below.

Cheers,
Biju

>  		   const struct rcar_cmm_config *config);  #else -static inline int rc=
ar_cmm_init(struct
> platform_device *pdev)
> +static inline int rcar_cmm_init(struct device *pdev)
>  {
>  	return -ENODEV;
>  }
>=20
> -static inline int rcar_cmm_enable(struct platform_device *pdev)
> +static inline int rcar_cmm_enable(struct device *pdev)
>  {
>  	return 0;
>  }
>=20
> -static inline void rcar_cmm_disable(struct platform_device *pdev)
> +static inline void rcar_cmm_disable(struct device *pdev)
>  {
>  }
>=20
> -static inline int rcar_cmm_setup(struct platform_device *pdev,
> +static inline int rcar_cmm_setup(struct device *pdev,
>  				 const struct rcar_cmm_config *config)  {
>  	return 0;
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h b/drivers/gpu=
/drm/renesas/rcar-
> du/rcar_du_crtc.h
> index d0f38a8b3561..07a40b305be8 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
> @@ -65,7 +65,7 @@ struct rcar_du_crtc {
>  	unsigned int vblank_count;
>=20
>  	struct rcar_du_group *group;
> -	struct platform_device *cmm;
> +	struct device *cmm;
>  	struct rcar_du_vsp *vsp;
>  	unsigned int vsp_pipe;
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h b/drivers/gpu/=
drm/renesas/rcar-
> du/rcar_du_drv.h
> index 5cfa2bb7ad93..9e160dede4e6 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
> @@ -106,7 +106,7 @@ struct rcar_du_device {
>  	unsigned int num_crtcs;
>=20
>  	struct rcar_du_group groups[RCAR_DU_MAX_GROUPS];
> -	struct platform_device *cmms[RCAR_DU_MAX_CRTCS];
> +	struct device *cmms[RCAR_DU_MAX_CRTCS];
>  	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
>  	struct drm_bridge *lvds[RCAR_DU_MAX_LVDS];
>  	struct drm_bridge *dsi[RCAR_DU_MAX_DSI]; diff --git a/drivers/gpu/drm/r=
enesas/rcar-
> du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 60e6f43b8ab2..f38e45d38ad2 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -806,13 +806,13 @@ static int rcar_du_cmm_init(struct rcar_du_device *=
rcdu)
>  		 * -ENODEV is used to report that the CMM config option is
>  		 * disabled: return 0 and let the DU continue probing.
>  		 */
> -		ret =3D rcar_cmm_init(pdev);
> +		ret =3D rcar_cmm_init(&pdev->dev);
>  		if (ret) {
>  			platform_device_put(pdev);
>  			return ret =3D=3D -ENODEV ? 0 : ret;
>  		}
>=20
> -		rcdu->cmms[i] =3D pdev;
> +		rcdu->cmms[i] =3D &pdev->dev;
>=20
>  		/*
>  		 * Enforce suspend/resume ordering by making the CMM a provider @@ -83=
5,7 +835,7 @@ static
> void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
>  	unsigned int i;
>=20
>  	for (i =3D 0; i < ARRAY_SIZE(rcdu->cmms); ++i)
> -		platform_device_put(rcdu->cmms[i]);
> +		put_device(rcdu->cmms[i]);
>  }
>=20
>  int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> --
> Regards,
>=20
> Laurent Pinchart


