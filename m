Return-Path: <linux-renesas-soc+bounces-31112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPd7Nrmx2Gk8hAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:15:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 338DA3D3DD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1646330512A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 08:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79993A5459;
	Fri, 10 Apr 2026 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="B+5k/4oy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C33AA4E9;
	Fri, 10 Apr 2026 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808641; cv=fail; b=oQ7eCA6UDA5kKHRKbNnTJarNyL0wp3eJOtVu1e03U3CGl9WZ+3Dy+lTwGTfQ0MMfSV33j5HKRDCTIgk+tNNMbTAntdpWIQCr5DqkTMW9D/65jQfBaAnellVI4hnNewwzrriwreG2ijHkEVJHtTMKhGDt28RpIiziTQqymqtmzRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808641; c=relaxed/simple;
	bh=gZ5tbxRUmgl5gXbhSkDeRhSgwhTAcrikwd9n27/q6nE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cO7OoWyrCMqgIRGfm17Gb+VD2rq7KJb3FDDc6Uk/Y5Q34yyq8MjUS7G98o71Uf538JDD11hVSGyZhDVgieCnmwz8KFfPjZKuf2RJKquOPd++deYOO8Dd/JAll++Ck/sqXKdOfuIYDnyvrmoobHW0ZAFkyXE+fTYoGavx0J6l6xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=B+5k/4oy; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuWmF3HNgXxkk7Y4CbVVRX/1k1XdCQPcP77o4byA5BK7aGTyV3Hru7UsAptAcE9AhoLyBiDlnfmNn7AZZ9L1Fw4TGuY3SKA7P1pf9ALgZ5Z0ZIdNfYjCbPL9WF1QPc0MooohEqkPB7lrYj63J/R2oY7kychO7vtaRwTIjTkHsU/nTDOn/dUMW0JArT5qR1td33T1YFoLlTZYXj6NDPrCMSvv0wDnFXeYIQZlU+CgWPmOO1yjP5ehVbQPxk33JxJL++BFgmvQVV0Mh9rhOHFr3UvFgoLMfPm9nQ/+yyDPy2xWyKcY4MlaAunr4+ZcTZbDkNGE0wHJWKBEKbZPhO7ZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHTDzM4oDRDmShWT+yDZW4nb7yecrrV4GgaAIeWersw=;
 b=s2+IJlBquymLXtOnNLgb/ykZ5SCO7vA8Td03yTiDlE+PGR08t5C+M85c4zl8/gYIC6doJL5YjSu4u7nT9ogCVaDsoq0sa9GUfE16FzkXnL657tt0lmsuQZbNuQsDUAIPbwNK1emGAD3YCDwK2YroBFhm4+srDDX6oz6+5EA4yNVtmln9PznxrMfXktqjIB5uiz5pQw2LSQ0pcq+nb2oBiSnu2j4noSaNAJAKffvOYjcAGtPND8K6dKYvL89KK8lzkffh4fDNQrl3FARgosKQwi66R0IjU2LeYxi7DZKSWHtwQ4+scZZx1waV0ZzDtNI/d20cxyK8V9GvrzhAftTV2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHTDzM4oDRDmShWT+yDZW4nb7yecrrV4GgaAIeWersw=;
 b=B+5k/4oySA30IAvevknqw6+9xQUwtVky1C+3Ss6nDb1Q1ZL9Ih0QTOWLsA9Luik/yOO5Oj+3MCyGrUdUc1A1d0b2KNsbCXfmQPtBUHjAQ0NJ3gkge00Qb1vFpiyZEcF7Dt0D3lsa5NcHs9vXqa9SRCNG5ozI7z4KJui0KCRYWfM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB17262.jpnprd01.prod.outlook.com (2603:1096:405:334::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 08:10:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 08:10:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: RE: [PATCH v2] drm: rz-du: Ensure correct suspend/resume ordering
 with VSP
Thread-Topic: [PATCH v2] drm: rz-du: Ensure correct suspend/resume ordering
 with VSP
Thread-Index: AQHcwFQgtY7iM5DGnEmNoMcLJJmk8bXYAh7A
Date: Fri, 10 Apr 2026 08:10:30 +0000
Message-ID:
 <TY3PR01MB11346A9F516651EE71FDC57A586592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260330144651.817338-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260330144651.817338-1-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB17262:EE_
x-ms-office365-filtering-correlation-id: 4f8e7f65-60e0-4930-e825-08de96d8a206
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Ll9oLDp0R1Lld5HxjBFOU4utx6utLzqQlWqln4pPrRQjDMczZUq2jfjrt/9rKinfm/VuD+KsLz7G/3g9crbaFXqEpZxI1lOKpWNsAOWrqA5+hJNfDq92UjHHSdm35I8AQ9v0tBjpO5BROw+ruthIWFFCBHooyhYpzsu0KwobW3jMDgesBj/sFduDMF6YoveGdDkoLufRQ6U8apGneeWGjMediQyrsJ+m219bFmLaAVCUtvU4qPgWkrjuy8hLFHFSNtEHg7ZBsv7zKuKZsZrRKDfya7jbLJVYceGvBnoBfbW/FBDbup3/JsklFdT2g2ckr1o1yOZoVOS+aFu9E+Al1Pv9SBsKLtVwZ35L7NHTMKYW5Ye5k1AQ1w0CbuhXTP+afVoUjOpZAr603uXyYcMIjPRvJa4mcyeKAKmqVkcdgDURvWuKtgQGjy9ToP+DibEz11Jt8XvlTkq6ysqKtdqhuYsp5Q3F9n5nP6DDG7dfX+Hnj22rgVmpmMcKpMP1raWBRA86aCpshrhfVpmRkK2lcuyzv3mbCtOp1ZxD8FVNpVn43hxgdRq+7pL1Wzw9T91Uj75d67R11i86zIxnOv8LI6TFdXNO+KytzMGbQstz4gkj/D6lG2JaaP0gy82Momuja9LEBffL0Hdmac2l06GycbmlGsHSjx2ai7iYUzwj8cSICy5FImvlFjW6M1IoGL1ffA7G8qF1tEwa0WrmuywCnwDcPFxSL/QlK/TQ0OyI5p7Hw69LVkHWqMX04NaPdl3gKS+C91kU2cB4zykBDIA53qU3Vl4mDLoQfBYoCu5QI8A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WF6hTR9a9hySQ0vQSnseAopqtpRzMbhH8STXGps4fOAil6FOmj1Y6kzftxRS?=
 =?us-ascii?Q?fO5oNmiSWkemiNGCHFPTReFXnMPGzpPA/eWrMfl65b+GqvlzMwxHlv3PWA7S?=
 =?us-ascii?Q?KM8PL17sk7S9eZRFa7knrzmLQ/ulGEIIg/EDjPBY4uCMeT5Je8nxWQPmWvyS?=
 =?us-ascii?Q?tPRx8OkkogeQGcIVjhY4K3F3XqC2EfpBtsmpVcT6x0cq1R/hPlROuUj47rIT?=
 =?us-ascii?Q?dKs0iheWag6HCOHwY8MQVQefwn+UkfAJw1I8byaE+FDZBL2GnAMwXpIg5F+/?=
 =?us-ascii?Q?A1NIzILwIDA1u5M2D7qsMJ3KqiVKf/H9TDDRyzaYK5ZACGZjdWhyvvg0oKYt?=
 =?us-ascii?Q?OWYUdvwPoq8C8xWW5KrsG0QCLCEXvgFYSXNiomAYSvlCFBSi6OOwSAdIgX6W?=
 =?us-ascii?Q?H7/Wrm9/ub5HoaD2bSNEa2PZDCk5dzuuYQ78428Z7RgC4NNN8jt+cByMBP98?=
 =?us-ascii?Q?zHa4PeFDfcCEM9xBSW8vzliCFOMV5E+gLZ7bhyjF8uQioErBJ/HGRLhP3ROf?=
 =?us-ascii?Q?/afGmzV1KZ0HbU7YsoxERFTrdlI7efRpUTE3n3rQMaayy7vpZTtohs4NptDk?=
 =?us-ascii?Q?k8MGGK+Ep1Zwdf5wABA+pASl3EClNcNmPY9SuTBuOmfd9+H7E+SdXdIDf2yw?=
 =?us-ascii?Q?ibUSUx6sYkjfI8T2vC2NLcY6IsJb3t7e5PiMfyhToTEs2bkMoQmRUVFWYvUT?=
 =?us-ascii?Q?JN4ki4oioc9QTt7UP4C41vzkiJ9SDZ2d5nyQU4xPpSS3C6SowF5b82P6dJnY?=
 =?us-ascii?Q?dMezmyQSnmxOLbKP38BB0AckdZSIIDtvFTgqZGD4xEY+gTo8+3KR8M8gOjNq?=
 =?us-ascii?Q?4dpKBQUf/PUtH3ZHEi6a0cFCYPE4bYAatJpwyVZ3uutmG6cKK0bAnzqQWUZ2?=
 =?us-ascii?Q?lYvapzc2PfCho0p40QilbgqF/NLz9N7maSZjWSQQY2RMzrm7Sksqa7yxWKbA?=
 =?us-ascii?Q?9LmyT6Mzv0MUqoZfv9pIth1e1bNOmaOB4fh795cxiaCTQ4sSLNc5U0aTTZQI?=
 =?us-ascii?Q?1KR1zTgkT+wASgFtqfNoVKrWWnSqUYtocWtfDCNbX+UY6zQGNlt4yj9G+P8z?=
 =?us-ascii?Q?N+wGXDp1PDlZ/huoMCkKnoBis9xOjASKaDnFCGa0yjVh1RcfiJ007aGh8fZa?=
 =?us-ascii?Q?UfZe91/NhAzxI8HDVKb7CFrvU/5afYs7/WlYQ4/3JUkV6ME70z506wr/rZwU?=
 =?us-ascii?Q?UeuC7axWZmT46ux8tHN15rJKcoG47KEjex01kg7ugo5uDkxHumCuuO0OU5mR?=
 =?us-ascii?Q?IM5ptxkqZLvHPepEmUXmLL13tFmMg3Lk2WvPliubILOasla/lANTeiLLvuD0?=
 =?us-ascii?Q?nHkXuNRBlna11k/YAfCdwnIbiHixRe3wflDA8yT4wNXOY1ywXuo4dMD9AZg2?=
 =?us-ascii?Q?qNf4BenO/PGbo/9G5MafcUwlk1ZBJ9V4kV097rjoT8xmNyDMICaDbmqQStK+?=
 =?us-ascii?Q?mNaJ6Ax1asxxLlDfXxu6ScM73WQPt8Igl6ztndU6Y2yN66l2wmWdsh6AXVG/?=
 =?us-ascii?Q?2V1RoEsQkvEvvWZrCqr8R2ZFg+SIEekaJDMSX30a2ROdl9+LsFLcBwlKDNXB?=
 =?us-ascii?Q?MluOhX1/XDdTJDmy86Bt1J+Gn/2LWH2QVstvYO9HKqC+daRLKgsu5BpzBLK3?=
 =?us-ascii?Q?Ia/N8Cry6NWU8NeVpbC84VOqlJJFktmdEy7rEb01pvKulV+GPoUd3z+GKCrt?=
 =?us-ascii?Q?bbjB8zV9cyiyT6Mf5wtr1eSIvuJLG88+/5ZAMBnOhIwS2ep1ak/INXTWVt4m?=
 =?us-ascii?Q?aAVqMGDekQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8e7f65-60e0-4930-e825-08de96d8a206
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 08:10:30.8301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cOCZTT8MwlmPNgQ8TytPlCngp9i61eRxDXi3zWxgx3CY/iX5oHxnOw6LxkJ+nBLm0uKYrE2za22R3+UuZfolQfNfRE7XtVL4a0E8rCZDF64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17262
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31112-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,ideasonboard.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: 338DA3D3DD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 30 March 2026 15:47
> Subject: [PATCH v2] drm: rz-du: Ensure correct suspend/resume ordering wi=
th VSP
>=20
> The VSP serves as an interface to memory and a compositor to the DU. It t=
herefore needs to be suspended
> after and resumed before the DU, to be properly stopped and restarted in =
a controlled fashion driven by
> the DU driver. This currently works by chance. Avoid relying on luck by e=
nforcing the correct
> suspend/resume ordering with device links.
>=20
> Based on similar work done by Laurent Pinchart for R-Car DU.
> commit db5be3a7d6bd ("drm: rcar-du: Ensure correct suspend/resume orderin=
g with VSP")
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Applied to drm-misc-next.

Cheers,
Biju

> ---
> v1->v2:
>  - Collected Laurent Pinchart tag.
>  - Added commit id of the similar work on R-Car DU.
>=20
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 16 ++++++++++++++++  driv=
ers/gpu/drm/renesas/rz-
> du/rzg2l_du_vsp.h |  2 ++
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_vsp.c
> index bd486377f037..eb626c3cc421 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_vblank.h>
>=20
>  #include <linux/bitops.h>
> +#include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> @@ -293,6 +294,9 @@ static void rzg2l_du_vsp_cleanup(struct drm_device *d=
ev, void *res)  {
>  	struct rzg2l_du_vsp *vsp =3D res;
>=20
> +	if (vsp->link)
> +		device_link_del(vsp->link);
> +
>  	put_device(vsp->vsp);
>  }
>=20
> @@ -317,6 +321,18 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, stru=
ct device_node *np,
>  	if (ret < 0)
>  		return ret;
>=20
> +	/*
> +	 * Enforce suspend/resume ordering between the DU (consumer) and the
> +	 * VSP (supplier). The DU will be suspended before and resume after the
> +	 * VSP.
> +	 */
> +	vsp->link =3D device_link_add(rcdu->dev, vsp->vsp, DL_FLAG_STATELESS);
> +	if (!vsp->link) {
> +		dev_err(rcdu->dev, "Failed to create device link to VSP %s\n",
> +			dev_name(vsp->vsp));
> +		return -EINVAL;
> +	}
> +
>  	ret =3D vsp1_du_init(vsp->vsp);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_vsp.h
> index 322eb80dcbaf..a22aaf0843ed 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> @@ -15,6 +15,7 @@
>  #include <linux/scatterlist.h>
>=20
>  struct device;
> +struct device_link;
>  struct drm_framebuffer;
>  struct rzg2l_du_device;
>  struct rzg2l_du_format_info;
> @@ -29,6 +30,7 @@ struct rzg2l_du_vsp_plane {  struct rzg2l_du_vsp {
>  	unsigned int index;
>  	struct device *vsp;
> +	struct device_link *link;
>  	struct rzg2l_du_device *dev;
>  };
>=20
> --
> 2.43.0


