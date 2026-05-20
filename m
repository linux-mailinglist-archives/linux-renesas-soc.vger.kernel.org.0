Return-Path: <linux-renesas-soc+bounces-32839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAFlEEdIDWpEvgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 07:36:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 957A0587CFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 07:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 584C3301692D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 05:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D876E318ED6;
	Wed, 20 May 2026 05:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sqB9lVbH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011001.outbound.protection.outlook.com [52.101.125.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9AB3002DD;
	Wed, 20 May 2026 05:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779255364; cv=fail; b=FNMaswWfX4xeyQoxOBE7coA8Mi5cmsEWtbL5othdOaiZgqfosHD+hO1bMS4tnbtWWjZ+coX2uvppK0J4+pqlVKBmeFGrIHcnHqECddEgrF9vai1Tp+NOs8Mcf6asJhCP3/iwrrafBWsp4492ByKb06+Oe/UZ6se+m131kjp7X28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779255364; c=relaxed/simple;
	bh=pRAFOrkEoVDPB8LJMQ42TG9LSQ2dbTD5cd0siPnFoXI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PhDZPHd0ZkDZLS/1nFDxGwm/+aBWILSjqxwzIetVlxqs57WEBsq8UMda1z0vvT+murzNTnSWK1EcWzCTL5/oxsUVRKsanRu0iIv+HyO4McMl+R0krR/PRYFdMnKhNoolIIlZ6X81spyUCutiZEhXi/V8ayysaznngho8sVFi40I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sqB9lVbH; arc=fail smtp.client-ip=52.101.125.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1HWce3xgkOBFFbnHvXzpvveIuhja0KjJ2dQroax9Kf1LJ0xM9bsUbDff558CtWLnDClV/u4tuJjqvGIaiiGmE7vZLATZLDM9FR3GaWu/0HywpB1+UYSm3OvIeteRegQaRMUOsUfuaLp3RT1ydhXdCy1SO2oQyzzXAK0HIZ7CnANhriPbWjMLF2WzXLBze6m69WxQ76szBz47OEfgseFETfr7eEPxbBFvAnRazu7z580FnM5EBne6ORskhtJ2vAYKZKRT7tGHqnQiMTjwF+ASfCuf4X3XylN5SnMkZPJIOIce5etxseZFRpTwGDMnKEBhQ4O7k2TujB0SKO8oNt4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ost2K5+6d6YAFzZHs66M47yZz7OYyk/khOHI8JBhAnE=;
 b=V4PAaI2Vc39LggKw66QQtIQsbtQOQCLEldigFwcW4GM+a4cxQJ/YtcV/reAk3BsH59Z+799Ud0XeodkC+xEdc09J23oz1BUczAeNURgKtJf1uXF50Mc2+LHeTABiL/ayXE+RcQYz9NtkWCMjgX9bmfYk4F3pX+KFufp4U6HNKckfEvbplQCAV8bLcA+AAIVnriLpHmTTi/uE70E+XvhaCDMLfvrYaJBM4vKUwhDCTpiwWqbhD++zjQixpTJqxJvp3Dsii7M7IF9WqmyC/PprBMC6N7NWm6p/aEWSgcArrEgIrKYcN2KhHUukEy4QC/8TkAQFYk8HqCFlkZ8LUrTHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ost2K5+6d6YAFzZHs66M47yZz7OYyk/khOHI8JBhAnE=;
 b=sqB9lVbHO98EhDXMHAF4XPLEiOM1KBSfSw3a4K8tMepryGv8EW0DRGPa/AmgRotmI+okJJnPw1qHcCI59EZJHK5pecXdPz7I9+jg7FXoFMhD5bOvlSZntPoJ6MDYY4w4+n3+qAUnYdnSJrRYNwC2tKi1XjYqThTXzmkHB25kgqM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8687.jpnprd01.prod.outlook.com (2603:1096:604:15e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 05:35:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 05:35:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-SoC clock limits
Thread-Topic: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-SoC clock limits
Thread-Index: AQHc56nK9BJ9tFiG1kiCI4Ue74glYbYWZP+A
Date: Wed, 20 May 2026 05:35:54 +0000
Message-ID:
 <TY3PR01MB11346AD5B7CDBB72EC8FEA16686012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260519160825.4082566-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To:
 <20260519160825.4082566-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8687:EE_
x-ms-office365-filtering-correlation-id: 73686d1b-7c6f-4fcd-4c81-08deb631a93e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|4143699003|11063799006|22082099003|56012099003|18002099003|38070700021|3023799007|921020|5023799004;
x-microsoft-antispam-message-info:
 D/gblkspdyRfIy1jCHe/K3LaN0W9cAgu5bvlA7LNISJNeHoqZIgbfKWj1DYCWsymJRfVsG8K68zUsy6b4V7Z09mOw+Vubib3HQ+fSy/ugHF8oSjEmvtJKy/njeKO5kcSQksm35/tu8Dm2FYOa8QaAOxVsbiQBCqCsLsH6SHratCwZzZRYT9QRB26SGWqLYmPmrTgl7OXCtX/LXO+noyV5VWNum/JCvD6fGrGITq9zCnfPXdLeYb2Ii7/tGBelniDL0ZnO10UQ4kxpDYF1R+OqJjKNTIHGGk1KqnNm/hf3VHRc/gr9BDY66GdgoGkdDAnQaD83MAuhQC6Q8gFjOzGhvaFVgW7X7dSKQpUePYFv2AJ6MxCRQMDwSW8JByWiik7dlaVtos8hQtInoCYx5hC5sbVPPvm7V8yIIVLUGNDYOSAKItYWXpIRrexZ17A+pHZ5fGLT2+3Eb8JTT684zz9nGO+JpAhY3nb/7ClaVbq8hCT0LKK7mIvUl6ADMJvwS6sIl8Zxg0EqslbXA3Z5CW8L9voxqB/H/W4DMJBU/7aM0XXBw4z0uwWlnlXiqmv8kRBN7kLcKF6R/N7zewtlpplj99hRCqUsIGwPvUQvdNdFANi+++oLaWdvPPSXg+jyqz8ojWnE27L8ZcSrclS7nw5FKC41gGL5z3GWZjNK3NS7OyWu94qmDsb24zjSErXyYObadTcCtXrLmPGVNdJ0O5HNviiOJfsAt9+qJIpZ8wXrXfKAhMGiS9c0hfmzOayJPDrsvI3eQq8rCZ/QDy0Kgmm5g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003)(38070700021)(3023799007)(921020)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nwJxiMNJksPFNEXj2OgLUbMXesNBVDpoHzrxNIf3Isf8U/LpOGcHWKsPOLBr?=
 =?us-ascii?Q?4gPmgkRYjPX99q/pZQONsBFLNtmTvPO5a4Ih4IXz7dH5idzv3s1wM8MyG/XC?=
 =?us-ascii?Q?GqX9/wtVp//qMhTh7h50elQJiKDi7ZEWDrLNgj3M3YS6uxNiVnZc2vaN2RP1?=
 =?us-ascii?Q?pw8XtQ937s8PsyTlrUxOAXDs6hn9LV9xTaWbw6EiCmJxpNhTsbB639eWdCsn?=
 =?us-ascii?Q?9K/zaNMAzcWSL94agadwKy3GgjzUgy6/A8nJLsemboGg0poklPWNiyPJLCWl?=
 =?us-ascii?Q?IomVuS2I4FY3EXcnUe7xnUe4gZglSjXcFTx7yH3d56UqQ6oYCNziHrQLQgcu?=
 =?us-ascii?Q?efZymyhrwPzd51V/bkCzBqu2j54Ivku2VYbwUYnvxt+AOEZB+LnUKZapUl4X?=
 =?us-ascii?Q?+e78dV1dQ/RpLlTW+FZEpnSMBTz0XGodQvE1JLLhdugyqCxc9TcNmB0VAcCk?=
 =?us-ascii?Q?bSZNwy4vmQllKyXhX5l4RNz7mwb1Lu8rAElAOsUD7Tz3YrsR+L6XMDA3Ro3Z?=
 =?us-ascii?Q?7hZQ8rXBn3QZvupNjHIjH9uGj8Piw/CspUB5vO6RBYnHMula1cYDFuQHXT/G?=
 =?us-ascii?Q?kaPnno7h2RPJafhUckgZwfBnHNiW+TK5Fn+v6nK3Uv+a/rVuCmuR2pWVrdKC?=
 =?us-ascii?Q?E/xqSY5SrgZF2kUns0C46NN2/77b4W+hR84OOpW5ieU+d2/Z9r+E1mqm0wBj?=
 =?us-ascii?Q?BX63P+y5kyi4HJDkePZQiF3Abt3fr3HZ9wVqaDftQNnx5OFUGWaWW5b8jAqE?=
 =?us-ascii?Q?s/pF8wFnoZdhZwEtF03w5ASlPDHFXJigwfh8Gs3IAUgFrnIQ3LYLcz4YbVrD?=
 =?us-ascii?Q?87MF3FLq5S3lhvWl+gQp3GOt5FHg0N1Y8zoaFMFETqKBz56ygoCJ/o+moQwG?=
 =?us-ascii?Q?ol52wzK4H1HP3qMo4Gj81kbEKxTr4zyZA/ePfpD0f2ErzqWsCO7z3eyKkpfS?=
 =?us-ascii?Q?LrGanvSaACha8R/ZjdCYQAdqW77XpBABuXgyu8gbouPv7WOZc6C/9cjfMyz0?=
 =?us-ascii?Q?8PKStp/pFZNN1tH5jQsqu0yN93qfBV3uKUEBjof7kHM3OWvr57ZE4rmnMUI3?=
 =?us-ascii?Q?xaol3IxH0bSG7gqMcT5dZ9teI3SRj3vfTfQ6g86jEUBt9NRwNpnQt37tXya8?=
 =?us-ascii?Q?IryAH2ZYP1A+200GxDZo+kEwfhlyJWTSBovOBbMiZV0G3GgYHJ/+BAyL5Hvb?=
 =?us-ascii?Q?LuDt/7t6v0hkFw+mAWtvoZzsm13ZaGNDITkdHzc8iBgbIZmTy91w5ghrg1es?=
 =?us-ascii?Q?QyK/xMe2HDv85Wnuq0EBbGzp57Cae9q1hxTpicWN4wRmNyFOQJIqvG8BQxfJ?=
 =?us-ascii?Q?R+pFnCWippYNHaZ7VJM/OkEWbu2CwxrUuoV0L61a6JSCRDWONMpJXF/bJlwH?=
 =?us-ascii?Q?zWf5HBF1kQuc8OEWZ7YJo9KyhNaDJVCNhgwKf/LqUuICZJ+GYG1tNcgL1fsa?=
 =?us-ascii?Q?0HCxVUnpbOH8SltL9hzgWCzjZJrM5okKNKGtbVUUD7EYbEMEqpkty2ESRFgx?=
 =?us-ascii?Q?kc4fALDQqbZYxX/iVh+VVVnxiCqa4YpXfnJtCKM6aW4A1qPSXJCSwa2ZPerQ?=
 =?us-ascii?Q?yQv0dPrt4ieWN9Qszh5QM/Nke0pyh2oOlgtTN5PXQNpcH5Buz8T7v80RZmpw?=
 =?us-ascii?Q?SEPtXtFi5uVzJfPdBCFcRlNibZn3WkOlaFy4aOlghAkZriG81Tt3/EsTlb4+?=
 =?us-ascii?Q?EkWmsU6NS/M2iMv+9GcVaTS0GAXM3j5dL+Wcmw6mxVa6wvRredkwt7z1DBcG?=
 =?us-ascii?Q?QFPVlqIv0w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 73686d1b-7c6f-4fcd-4c81-08deb631a93e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 05:35:54.1383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TtGo1LUw6o8Sz/2jhI6S77EICPyrzxHiCijePRQ7kX0EzXLwe8Sq0RvZtSvxMZkbCkIgOz21fphyqHpzKDf8wey9tt8v3oZA0z7SMLXv4MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8687
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32839-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 957A0587CFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 19 May 2026 17:08
> Subject: [PATCH v4 4/5] drm: renesas: rz-du: Move mode_valid logic to per=
-SoC clock limits
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Move pixel clock validation from a fixed encoder check to per SoC constra=
ints stored in
> rzg2l_du_device_info.
>=20
> Pixel clock limits differ across SoCs in the RZ DU family and cannot be e=
xpressed by a single shared
> rule. For example, RZ/G2UL and RZ/G2L limit the DPAD0 pixel clock to a na=
rrow window, while other SoCs
> such as RZ/T2H require a wider operating range.
>=20
> Add mode_clock_min and mode_clock_max fields to rzg2l_du_device_info to d=
escribe the supported pixel
> clock range for each SoC. Update
> rzg2l_du_encoder_mode_valid() to check these bounds when evaluating
> DPAD0 outputs, returning MODE_CLOCK_LOW when the pixel clock falls below =
mode_clock_min and
> MODE_CLOCK_HIGH when it exceeds mode_clock_max.
>=20
> Populate the pixel clock limits for both the RZ/G2UL (R9A07G043U) and RZ/=
G2L (R9A07G044) variants to a
> minimum of 20875 kHz and a maximum of
> 83500 kHz.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Dropped per pad limits
> - Updated commit message to reflect the change in approach.
>=20
> v2->v3:
> - Moved clock limits from device_info to output_routing to allow
>   per-output constraints.
> - Updated commit message to reflect the change in approach.
>=20
> v1->v2:
> - Dropped storing info pointer in struct rzg2l_du_encoder as it's not nee=
ded.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 6 +++++-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 9 ++++++++-
>  3 files changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_drv.c
> index 0fef33a5a089..1e4b9f38c55b 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -35,6 +35,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07=
g043u_info =3D {
>  			.port =3D 0,
>  		},
>  	},
> +	.mode_clock_min =3D 20875,
> +	.mode_clock_max =3D 83500,
>  };
>=20
>  static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info =3D { @=
@ -48,7 +50,9 @@ static const
> struct rzg2l_du_device_info rzg2l_du_r9a07g044_info =3D {
>  			.possible_outputs =3D BIT(0),
>  			.port =3D 1,
>  		}
> -	}
> +	},
> +	.mode_clock_min =3D 20875,
> +	.mode_clock_max =3D 83500,
>  };
>=20
>  static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info =3D { d=
iff --git
> a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/=
rz-du/rzg2l_du_drv.h
> index 58806c2a8f2b..885558eb9547 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -44,10 +44,14 @@ struct rzg2l_du_output_routing {
>   * struct rzg2l_du_device_info - DU model-specific information
>   * @channels_mask: bit mask of available DU channels
>   * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_=
OUTPUT_*)
> + * @mode_clock_min: minimum pixel clock in kHz
> + * @mode_clock_max: maximum pixel clock in kHz
>   */
>  struct rzg2l_du_device_info {
>  	unsigned int channels_mask;
>  	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
> +	u32 mode_clock_min;
> +	u32 mode_clock_max;
>  };
>=20
>  #define RZG2L_DU_MAX_CRTCS		1
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/g=
pu/drm/renesas/rz-
> du/rzg2l_du_encoder.c
> index 0e567b57a408..56220139a149 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> @@ -50,8 +50,15 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *encode=
r,
>  			    const struct drm_display_mode *mode)  {
>  	struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> +	struct rzg2l_du_device *rcdu =3D to_rzg2l_du_device(renc->base.dev);
> +	const struct rzg2l_du_device_info *info =3D rcdu->info;
>=20
> -	if (renc->output =3D=3D RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83500)
> +	if (renc->output !=3D RZG2L_DU_OUTPUT_DPAD0)
> +		return MODE_OK;
> +
> +	if (info->mode_clock_min && mode->clock < info->mode_clock_min)

I will avoid checking the first part as it is mandatory for SoCs with DPI s=
upport
and DPI check above make sure that this part of the code is reachable only =
for DPI
output.

> +		return MODE_CLOCK_LOW;
> +	if (info->mode_clock_max && mode->clock > info->mode_clock_max)

Same here.=20

Cheers,
Biju

>  		return MODE_CLOCK_HIGH;
>=20
>  	return MODE_OK;
> --
> 2.54.0


