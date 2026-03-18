Return-Path: <linux-renesas-soc+bounces-29755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OcJG2B/ummTWwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 11:33:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A32FA2B9F05
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 11:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3B3930010D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 10:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679C5188596;
	Wed, 18 Mar 2026 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lXwaLNcX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F926361DC1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 10:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829980; cv=fail; b=KxgRolPp7vuYXe4GF0a9Wp1KaZ/+ziK/reVfccJkxqzKCTRA/Uxy54bRg/mA1FB/e1B+/Ri8gD/buuo1yzts8FfDQYewJQ2Ni08Mh3f48oM+4lHFpbujJQRiuS9j2DumggmjLhTOCsBEp3AuoyCiH/wXoi2K68HQjm6DjEvPAmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829980; c=relaxed/simple;
	bh=zJmH0aAJaV7VDBm2izCni2XZZIXyTYY48Ojk7d3OdJk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pSWgrMc7pDuM6N97/HppBbBfIrNEAVeUL6C/S6i1a0x/DVNLc6BclTznmwy89H1WvMAs1yGpWDte4v5DeQidZujUlfFXqLkIikkQEuyapweppcN69qo+8jlT9ObMflgT0GyLvo0K/mS6HPyY795ONXHdyo+GtWroyjD/PnSiaLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lXwaLNcX; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4XAK494Sus+4SEXVg4K3PXVvHbwI4idWuwF4tiXBh0jqxsiZH//bfuEq40D4ubjEOiH4g09rlcRqGSVzkPGcemHwgBXXFSG8BW7f5xpfdcmft/xV2pWHAaDOK562SUfx2iPMi+h0f8Vb1K3zEwqcJfH31DfRzgQAdBQHuptVSoRpEEdpwOqINuQwT7b1qjueLkpCDwzoatYb5HNPjs65T+uekLamyY/RYEekea5k/dtUU28luaU2MPEawI/abpM/nCse1a3oR6I15mwEH7iF9UnOuithU+3S6IUAQ7zpLvo++K3qWosts2tss92OXkF6OOC+lwAttyh3mUxA5YJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3a0S+XxWU2DRnXr0TEqHgwxvPZKg/Gwlp6tKDIWDgI=;
 b=e4glj/F7yLRv+8HovZLVSyONbnp3PmmtT5kWZ0AoMAF3i6B020XX4I2I1loUIhEpfDVYNdiODMC5ibKOBqYd49+2EPwNN696KZX4GTTdLeji8DA4lpYZMCuu99LYPKE6NdLzow6p8yg3c+B4u04uAczda3HQ4GUSmW2A72a9XVAWCysSgqu63oSC2az2Ap+3bulfaQJdkgcZ/HCsp47y7UiKq7GoOzFFXHVvDJRRNPuT/Bbg22xCzwkSX4POpsjCRC4iOchgti/dVp0by5xEyvTDCKLq7F+66IG+swUxWPZHj2lYugX52Akw+fIT+Xo7zBhcXuCMvvWk+FVtmEAeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3a0S+XxWU2DRnXr0TEqHgwxvPZKg/Gwlp6tKDIWDgI=;
 b=lXwaLNcXd3ZwP1TluuwNZ5kDCwk2LUYgWbueIJnMKwMno2GhX3tJ4t8ZPjjR6OEIZaJB/sn2Gy20QKzSoA/hHdOLu1aOrGp+psdagKXvIx42jQHBXyhAla5zmeBzb3oliyfQURN4w+nFYsm3y3e/65S2+HPCq0/01cnP9P3zq4g=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10924.jpnprd01.prod.outlook.com (2603:1096:400:3ab::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Wed, 18 Mar
 2026 10:32:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 10:32:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	tomi.valkeinen <tomi.valkeinen@ideasonboard.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH 1/4] drm: rcar-du: Ensure correct suspend/resume ordering
 with VSP
Thread-Topic: [PATCH 1/4] drm: rcar-du: Ensure correct suspend/resume ordering
 with VSP
Thread-Index: AQHctmSLUUSFYXKdGkaAsKObXbOqlrW0FzEQ
Date: Wed, 18 Mar 2026 10:32:53 +0000
Message-ID:
 <TY3PR01MB11346D728D12D6330033B1E46864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260317231930.595719-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260317231930.595719-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To:
 <20260317231930.595719-2-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10924:EE_
x-ms-office365-filtering-correlation-id: 513fb3a8-f8f3-4313-d280-08de84d9b686
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 4cEiroil+qxQDbYaGMFJUe3useglTvXOyPqVNpgsuUL7BTZj2+yZvn1ZJ+KoCodQ/utMiWXMVAGFjDvytKfXuEJ88sUh63knxKy6Yh8HMmSWoBzf8islDMkR3spbJZSzdIyVLiKu6ca5ZAL+FHtMr3loOgRDmsugrt3txmvRwPTcFl+wYwhU69lXVb2Zh0pjHYhFiqOE00VPqCzpveGuj6PCMbx4uw9WN2C/Xb6pdqRUV8frweYNt9lWfaxeFWEJnKdt6SguSm1hs6UxYw/mo8v+Ql6JWnfwGxUScPrgAX8jnzyOXIPljoAv+qCSXMhS2E2P+goPMy1cH/SYrPNDOaoGYfeqCHdZGGMJaT1V8FYvCp0jr+RfJ/Y+G52DZsEB+ks1IHyjXOYTlTBuxUaH2EJ7xHxPW4KKVFCgqgj1fycf6lws5yEfg+w+LcgeOkuO/O5jy/r0ibimHlr1i5r/F607x9LyMPGEVztewgaHubrDSpB6J9Mgn+laq8NMTMLiLSDuwlvVYum5hoVyFT/vcJIAjcVKRh2ABqS7piqt5cGDAHN/OzjLI0IQkIKjUxjnb5ZHsx2QcNOj4TdptutCYE8on3bII2WnNYn0kE4FFjIkmkG6RXiSsA5u8oX0R1klkMVeYP0VWFzAfKuhkGaZ7ZggM5BeL6HjCpz5MLdl59QZaL55rQRwBbqS+zBbbrvCZtBPDkblIWmjBBWfiBbtrQcmJMEaiN1yTK1rwn2+zN1jigsgIJEpo2n2cQZKUitAID4f3msZIUqfOkZt6lj8xKNEKoZA3iTGjNukSa/p9h8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KKN/7C5RE/5ZWlxilp1fFgy5BagmM3JTew9stc4vR8QvfxBdRYR0C6v0lUdw?=
 =?us-ascii?Q?dqx2SV6fpPPahdx06xpHvMEOVyTzukBFhUbVhHKSBsM5htlsWUPEPUxmZNHF?=
 =?us-ascii?Q?Id5gp4VoGWJrf1E0yOIQRPe/O8tSjwuuJXtKRhQ1C9xsRjYuughAEKdN8FDC?=
 =?us-ascii?Q?bSnUaqpT8/2FYEq8dFdTeZouNc3GAc6Bg2ABFMTdme3cxto4YpAozzw6FAXL?=
 =?us-ascii?Q?yoNa+s9CmEzL0sKSua27faGTgXtELqgltd2iWSvkTOgYjYNWdXJN140FEG/6?=
 =?us-ascii?Q?tx5C3ik+XDWCDcOcMVPnq5I53dpOY6HSNrGE49Zf6qq4SxkyWWhj5VhzAyaP?=
 =?us-ascii?Q?4m6Ed+hEm0cfcz5aGbcMe1Z9Jtkaql4CXaSCP8yrF47WjwOT0omA0RgVirFX?=
 =?us-ascii?Q?+3lIwNFDcdduZ3QEySp+XubGBjFbaTNMVANw2AP4HD5ak9KRtibgB6/+E/+3?=
 =?us-ascii?Q?Dj+Aut41CZEae7kyqQaxSnLqUmYBCwhThBUMCYBfBWzMNNSCPYC5mjqk9bPd?=
 =?us-ascii?Q?GZw7YLh2BDMIUV6c5HLh94BnGRo0aqVzD1cLlsiYEoisnJ51jasWb/H4C8fW?=
 =?us-ascii?Q?HELDKJuiUDFsF7Wghl45ADh1LjeHEX232A2h+pqOvvWRshors20jsm2tzJCU?=
 =?us-ascii?Q?57izJa4h+p1aRvXI2G9YE0O5Ml3Ql8PsKyKSWkzhstWuxl59IkISOcttB5Hn?=
 =?us-ascii?Q?Eq22PZ1JkwJ3PZDMMw+a0L4M/wpk7b2Owy5nXygUEOiQdrgwU5f+oLzEpmyy?=
 =?us-ascii?Q?NXXBZ20/BY8uSvzAbTZXNQ/03KIwXRyhvjwYfkGq3KWNL89HMzObiGyYoVwp?=
 =?us-ascii?Q?poJ+kSQSDGhgUm3t7Latkq9S2nvMfpwnYzsQZUURE+5Agn+vgMbwzyBxvjus?=
 =?us-ascii?Q?udawuvtuNeNoJ55xGKmesNovsXCKkxkguXoEnExNRNOG0vyeuOk0mnYlIOVI?=
 =?us-ascii?Q?J6hYjRp51fHN4opbDtJKWYBRhrvSqXk79y4xIUiJM/Rh+RQqF9Y7rwfqt+jJ?=
 =?us-ascii?Q?yJ9oDvl0kBe3Z/hqM2Euyg54+HlO7A+gYs+mE96P0u0U5eb0obHSinl5tPJA?=
 =?us-ascii?Q?hoVUttwot4ysK8JRwH+GBQWGdKCGKXHXz0WRAII18jkwe5DYsRHA4YFLPJYR?=
 =?us-ascii?Q?Q207FtX/fAR0wOYVSrQs4MOL/bi12hH8zy6b0tBQKSztUW0G3ZVsqk6qbNSE?=
 =?us-ascii?Q?5pmtyE1hhOm0emEM2feBspUGxyOyhfrk1aHNac+99l9OG35RekXfIfVHFctv?=
 =?us-ascii?Q?HvElpiscde7CBaB6wd9OkFzaPmYMTZbJcfgYYTqlRZ59gpJg3TAWiR6DvSsE?=
 =?us-ascii?Q?9Rgeua841ZUOM31ltlo4IjNk9ibbajaNL6WKpORu4w4z2ehB71o3sON7tGJJ?=
 =?us-ascii?Q?vsdRbQ2SZR1YlZKsqH7i8/Mqvovn+sElvj3xhjpN2yeEtfUeYnZ5jI0vb/j8?=
 =?us-ascii?Q?bKhYMNruH995TgNUYmJfweBFb2sM+rT8BrrQa+8KwBM09e6NwcHD1eZTeFK0?=
 =?us-ascii?Q?fVJvuwYvoAH2RUO4Fx/snS4pYTUFe6BLt0sQn8rsCEYbfS2BCbrmlhfsLybW?=
 =?us-ascii?Q?N1x0HNIBR9CjBtQllnE7vtE6flmhRdP9umfk7frjkmVCeHjHsnYP+b++3lfz?=
 =?us-ascii?Q?zsrZhPsjGasodTl2hT8/fZW9Rsu3XskQpbGi2fGlUj2eMQXeqAcAhcHix19x?=
 =?us-ascii?Q?ven5Lbt4ARx8ZmIVOotuaGaKsYK9SEY6xwGce311jdZ5bTsWv8M8u0mu9uic?=
 =?us-ascii?Q?uxEkvrxiyw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 513fb3a8-f8f3-4313-d280-08de84d9b686
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 10:32:53.7692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +JteiWmzNbxYnK2843HqI/XW/XtHP7PfiRMOfZvhtzZNJjsgC38yEaOoiOxPL+wdkblDDd8QOJlROSgNP627Dq5gbji76xJ8RzomGSju1J0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10924
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29755-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: A32FA2B9F05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

Thanks for the patch.

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of La=
urent Pinchart
> Sent: 17 March 2026 23:19
> Subject: [PATCH 1/4] drm: rcar-du: Ensure correct suspend/resume ordering=
 with VSP
>=20
> The VSP serves as an interface to memory and a compositor to the DU. It t=
herefore needs to be
> suspended after and resumed before the DU, to be properly stopped and res=
tarted in a controlled
> fashion driven by the DU driver. This currently works by chance. Avoid re=
lying on luck by enforcing
> the correct suspend/resume ordering with device links.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

FYI, made similar changes on rz-du and confirm S2ram and s2idle works fine =
on RZ/G3L.

Cheers,
Biju

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 16 ++++++++++++++++  dri=
vers/gpu/drm/renesas/rcar-
> du/rcar_du_vsp.h |  2 ++
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/=
drm/renesas/rcar-
> du/rcar_du_vsp.c
> index 94c22d2db197..a4a49dcd8233 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_vblank.h>
>=20
>  #include <linux/bitops.h>
> +#include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> @@ -458,6 +459,9 @@ static void rcar_du_vsp_cleanup(struct drm_device *de=
v, void *res)
>=20
>  	kfree(vsp->planes);
>=20
> +	if (vsp->link)
> +		device_link_del(vsp->link);
> +
>  	put_device(vsp->vsp);
>  }
>=20
> @@ -482,6 +486,18 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct=
 device_node *np,
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
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h b/drivers/gpu/=
drm/renesas/rcar-
> du/rcar_du_vsp.h
> index 67630f0b6599..a6731249db34 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
> @@ -12,6 +12,7 @@
>=20
>  #include <drm/drm_plane.h>
>=20
> +struct device_link;
>  struct drm_framebuffer;
>  struct rcar_du_format_info;
>  struct rcar_du_vsp;
> @@ -26,6 +27,7 @@ struct rcar_du_vsp_plane {  struct rcar_du_vsp {
>  	unsigned int index;
>  	struct device *vsp;
> +	struct device_link *link;
>  	struct rcar_du_device *dev;
>  	struct rcar_du_vsp_plane *planes;
>  	unsigned int num_planes;
> --
> Regards,
>=20
> Laurent Pinchart


