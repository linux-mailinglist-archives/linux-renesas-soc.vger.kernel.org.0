Return-Path: <linux-renesas-soc+bounces-31391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAlqKTLX5WnWoQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 09:35:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA04427CA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 09:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 233B530151D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 07:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40032EFDA4;
	Mon, 20 Apr 2026 07:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CuIGDn3X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7525C28641E;
	Mon, 20 Apr 2026 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670325; cv=fail; b=h4mS+An80jETaUf864F3bh4/SZX86JhU5aTUyGlpmWVaJR/Qoy+X3YLNUTevVp1PWET+ZKVTxcq6IyYNUlro52rzm4Px3aM3//JmmVj2a1EpBL+x3x1Rz+ipXkgt+isCvX7N+LMk1krOVXa5IHyFsYXyB44yklfUC32l/4b51Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670325; c=relaxed/simple;
	bh=P0u2yYwrnDpuxAEqLJhRhe6xOJFOllvy9M+rABcCQwQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tlYK9nZ4rrdospGtKXNZRG+FFnnhlGsSuVtSUafutf8vDbP64S3qjeLM2vYIIsuAN3Wo0zS38DkHQnBUhrBLoLKvgAPHo5oF9L4UI8pBsUFVOCNk8Oym7FWDH/CeZKpvTY5czftRyowDgQIF7iwyW3H6J9pqkPgHIeL4YoCqzoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CuIGDn3X; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUItT4VYnI5kCxPIA/fXxm/u119k0f54g9fK3D+/POpfJcHKWgGmn2a69D86x4t7XsNXLczertmbgp6eo50ikl1Gsi67l0SGD8xss5vvUIFD9umUTXcdaADfvPAvHA3JLnPBlE94L1kWSHlRMD7NRq9kh+2roHTql2dPeYk8ZNcoOp5RLPB4owkiuMQyPs+4NqlaFotlJ9lvMbuwJdjJEn6jnpYtXIPb5Od/PZatquUBd1j0C3Xe0ZvcARLX31HzdusQg+Gt7DoSua31s0kE5Z8p1lfhlTzF1+k4LQ6UtlUI5I/Vuy9FEfvqHRmPt39ELG5a7Tnp67msimEj4+uYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoHia+Bf4+6pQuv9CZ9OvLMTPLLCsza6JckJ5Jf3L4E=;
 b=W38Av3MCKqq/g5snjuBvszKU5+ovKXT+lioUbyaZIA63GnaocIQkLHSgvBURa/zK7OvVUUZNhlfwPTTHCQHDO+uW17ujCr84lNZ9YMAqY2o/Sv9SXRZVvZ5Ld5+U2YtB3fhf6HBoXNqE6zGzx0rE1dVgZGdBWcXerfv2427+OTAqGsjcbs6an2msG+hkR5hgXCk/JaBMtwU6bb+EkJ3cJkLOFdrB+XpiAHPsmFJSUnIUKWpmt5YjKNmV+bHZ4Rza1VxLNl7dhT+kSE5mYb0a95p5dmJlVgzAuF+oJ42VgYiomwtmtk5vT03BkE6L8PhW8TI3PmNyhLe3UjnKAPYPMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoHia+Bf4+6pQuv9CZ9OvLMTPLLCsza6JckJ5Jf3L4E=;
 b=CuIGDn3XdpSGDpYV5KvRa0jaig05jbOgEDZDMkh9jADMHC/AJjD06AZq/AQKkFNjOVE5cH/r+LW+Jg1U6aybZ/RdXDlDwtCj+/99Er3jlhETniryHhOJEdZf5TQdVZDW5n2LO4LvEAsapiZO/hFM7O6fCOxttQmK+XXFXvwCozc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9703.jpnprd01.prod.outlook.com (2603:1096:400:209::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 07:31:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 07:31:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH 3/3] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
Thread-Topic: [PATCH 3/3] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
Thread-Index: AQHczpL/Ukn6EchJEUKwiqN+6dKGQLXnkeuw
Date: Mon, 20 Apr 2026 07:31:58 +0000
Message-ID:
 <TY3PR01MB11346A2CCFB936D6AFAA323E8862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
 <20260417175235.224809-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260417175235.224809-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9703:EE_
x-ms-office365-filtering-correlation-id: a752f782-06a2-484b-8898-08de9eaee7e7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 j4dpg/PB1CuJ4cD+pNwj3Uxb0kGvVX9kzGwNujbrh1yEBISB2uu43mAa2i6pbHN0VrCXjrGa7g75zXuvUrls+KcEqfAiLC7bgxVETdluegmszjMgtGFOrgcLrbrzmzKZWMWf81uOrkASHtVCq9pO+my7uwVqoAb87digis6decorCGgKKdbiL3MmCo/riNiGgVicAOkyYyo4QNiwclZVSlLnm3kHRnehLtL1ED3PdjKLU6ZsNe2/IIM30gfer3HGmCO9HSJ2uYmlyCdfEdISyOKF1lsbP3IeClUik9/hTovxlY1Rk0MCJDKCtxBV+s2fWZzyBpxqoJODtucap+j/V78TpYf7N5ecN8w/lt0iNPEddvMoqe3gUdQuOyVCUcBFJEwTUwXld9QKufoMS2FrDdUWVKjyLhRwSzAljc0RialikiaaHLto2rufqHMUwmgyzT3O0kbqgERFPw6qpJ0PtHKyRV3/oDzK67OP2gL7FVb8R16B32/QOJkshWTfD4MJBdLD0ycQZhp6Kpt3LXneYFBKKgZOhBASoQKhudrF4685+dcZyl0D+t1Rl7M2G2FLeB4zBQuJfsPNaXZMq9yfsKRzIwfzzcKZvNKDvNvEUcDITB6/yr68WpfuLCdTh+HDSqD1qjsNhmv1igxf+bTN06fZk6L18nSowTwJj0YPtRdKfM8KN839TeKY/KOAZtuv7NdQrx/JlWjmF4Fk69Ct8L1ndIgb0xP1/sQ3vLo5/xw3Hwj6iHH4LeHDMt7/yU0SrIU0WbeZxG9kfsrsGM6POikRZATfTdxDUd6YiII+/v0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8FfJu1E2PxTS3RNqjdRUPLKIMpM6GrJBs2YSN1TaTp7RtMVnA/AHrR6oYWO1?=
 =?us-ascii?Q?fnm8Qn4PiLtsPQ8pMUX11H3zdQ/lpyzexo7UYVHAy8iJX3UbFLPznIGKg/y8?=
 =?us-ascii?Q?6slkSwU1kSWJ1U4jK3XwnsdktroDVKjrJv2pNlWYbBi6+DCxDihckwYuN7bv?=
 =?us-ascii?Q?OS+/QGjxNTVJtGKrMtq20NChcqz/XoCkJcIUQgAhVolR6bS1GeKYe8HOHO/W?=
 =?us-ascii?Q?SoISqgMBSUyo/4juarjLdGtKRxKbjNDgwaxSFhOmqPIqzacT/9Q/Zi8jTkZQ?=
 =?us-ascii?Q?HIUhxWlodHN//bnZbCg0SKiySIc4nzEflRUWnVzrhDMeq3p+1STeHzQHZgNe?=
 =?us-ascii?Q?Es7YSt5Q7eR/d6MdbEHpMbwogJVCDVa9BwlTAhB2bM1UUOQ8y/CiLc7JBerX?=
 =?us-ascii?Q?IIo6PD5nUJLE4MRnvyQnm05k9l80/xBuQIux9bmWpVe2UIppcZDTDug1/ANg?=
 =?us-ascii?Q?83pJoMQaestHmn382WyoFLYpd7CoAvyaL6WDd8NpcGUazd8e/Rh+QhnImfcm?=
 =?us-ascii?Q?lBThtBHljpsV1yRWHU+Olj/3xjvD03JKU+PZfSPlsvoFGP3nHBrcSSQ5MRjS?=
 =?us-ascii?Q?lL4dR09B2X9+rq5mNn0QY25Fw/OTYcqbKIGO7g/dGhkNsMu6UK76Kul9XcIg?=
 =?us-ascii?Q?NGcxuen+YJ7c2dAiV+syWP2RpkXAxTno7+HXIlPPoHfTkA+QU2nFoZG9d2t4?=
 =?us-ascii?Q?GPvPOucJsXPzO3FUHi+MviXHgkE+W5gO0sTDBWvM1Fszjp7xLWsUSapGy8hT?=
 =?us-ascii?Q?7Vnj3DkSZLFwKjxz6A+p9WA8FZGLaFLwrBXCiDk00HtKyzifvBrRYSEiCqEJ?=
 =?us-ascii?Q?K6od8I/wBvROEhwJO44ch3Gd+OwUa0DhAidhB5QX7OJvuQ0VUfs1E9t0Ls78?=
 =?us-ascii?Q?cJ3WV2+iHILm+YhnsESsWmpEc7VfcFN0Bt9P92ig7fT8ovftiZINTXXM2Iie?=
 =?us-ascii?Q?9XnL9RIJxboB+fzGlNdFsrmDna79Lhw9nVp+PbXTQhBQOEFU1kYY5gOM7P6+?=
 =?us-ascii?Q?DerQRk9UWf41GI8sIk8ErzNMSLJKxxuqM391BtQNxUKZLYmeeRRde1m5KtNA?=
 =?us-ascii?Q?1bZhDbA8SES5C6MAOGSjABmsyDYbw9OcOxuSi0RmHmlqc4/nGErDKFme1C9l?=
 =?us-ascii?Q?jWLWU8ga7jt+8RYJT2ovzLNXCIscVzYhqLm2ZrC6yw/auCQ5KhH3vZJMGQ0H?=
 =?us-ascii?Q?CsBaabNerfV8J4/Lexw5PvYl/dhsVbPw0Zh1qH064MOl7CSoRq1ZVHnAKYs5?=
 =?us-ascii?Q?1rY+/EpWiw9wgZhuJEyQ2/rWLrsn7cA+sCFecTADm/+Srb5zWL4R6Te2aP0j?=
 =?us-ascii?Q?l3GXpt9oytkOKvgcARPTPkpDb5TBQDgpwvDvJTfHPmw0CwhLBDmSKMvjgr2Y?=
 =?us-ascii?Q?CduVSXQuYCLqogkp2eImpaxoyB6H12Heu1CIrgB8SRYYo1ch7WwIqRmAZmq6?=
 =?us-ascii?Q?ewXhsa6pXop3EanLTeaojtEgU/1WMwlMAktLhDMpVJrxxIbfC3w0zWMY14o9?=
 =?us-ascii?Q?I7IWI8iVVVt0cZvXoUlEQ/r3qZdZ9X8hbfIGYMxyZqMPjbrDXkekiBobTj3K?=
 =?us-ascii?Q?FKMR+LmOWkrCpOBM2BcI2V/QcHg+tnUdbxpDwfgiWGiKjpScwEVaBaDqLG0e?=
 =?us-ascii?Q?ds13t70gUAZyOsJPCDhBb7qB9MAY0QkIiMeXGSWrmaqs8DfW6B7Z0meMDwIB?=
 =?us-ascii?Q?6PBN4AvPTSjol5soTztiDa1YBvvu6cL7NpdNkCSX2htpCmMZ1CDM3k8pVK5Z?=
 =?us-ascii?Q?BcYnG2gniA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a752f782-06a2-484b-8898-08de9eaee7e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 07:31:58.4862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z/jJAYhHrpzKHPjtKEkok3Ic0DbvCmiCXAYaRqCg/kBU8b1nxinRkCJb8TfMmUGuW8qZImHLBLbQ7u7hNwZt6E3tG8lVz3Gao0EkE92ueFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9703
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31391-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,glider.be];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,bp.renesas.com,gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: EFA04427CA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 17 April 2026 18:53
> Subject: [PATCH 3/3] drm: renesas: rz-du: Add support for RZ/G3L LVDS enc=
oder
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add support for the RZ/G3L LVDS encoder driver. It operates in single-lin=
k mode with 4 lanes (Data) + 1
> lane (Clock) and supports pixel clock rates from 25 to 87 MHz. The LVDS m=
odule cannot be used at the
> same time as MIPI-DSI. However, LVDS and the DSI interface share a periph=
eral clock and the
> MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and MIPI_DSI_=
ARESET_N reset signals must be
> asserted before using the LVDS module.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
>  drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
>  drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 333 ++++++++++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h    |  22 ++
>  .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
>  5 files changed, 395 insertions(+)
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/rene=
sas/rz-du/Kconfig
> index 7f2ef7137ae5..cbfc7b6bccb8 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -26,3 +26,16 @@ config DRM_RZG2L_MIPI_DSI
>  	def_tristate DRM_RZG2L_DU
>  	depends on DRM_RZG2L_USE_MIPI_DSI
>  	select DRM_MIPI_DSI
> +
> +config DRM_RZG3L_USE_LVDS
> +	bool "RZ/G3L DU LVDS Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	default DRM_RZG2L_DU
> +	help
> +	  Enable support for the RZ/G3L Display Unit embedded LVDS encoders.
> +
> +config DRM_RZG3L_LVDS
> +	def_tristate DRM_RZG2L_DU
> +	depends on DRM_RZG3L_USE_LVDS
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL
> diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/ren=
esas/rz-du/Makefile
> index 2987900ea6b6..46decb7ac4f1 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> @@ -8,3 +8,4 @@ rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+=3D rzg2l_du_v=
sp.o
>  obj-$(CONFIG_DRM_RZG2L_DU)		+=3D rzg2l-du-drm.o
>=20
>  obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+=3D rzg2l_mipi_dsi.o
> +obj-$(CONFIG_DRM_RZG3L_LVDS)		+=3D rzg3l_lvds.o
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c b/drivers/gpu/drm=
/renesas/rz-du/rzg3l_lvds.c
> new file mode 100644
> index 000000000000..bedeedbdfada
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> @@ -0,0 +1,333 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3L LVDS Encoder Driver
> + *
> + * Copyright (C) 2026 Renesas Electronics Corporation  */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "rzg3l_lvds.h"
> +#include "rzg3l_lvds_regs.h"
> +
> +enum rzg3l_lvds_mode {
> +	RZG3L_LVDS_MODE_JEIDA =3D 0,
> +	RZG3L_LVDS_MODE_JEIDA_MIRROR =3D 1,
> +	RZG3L_LVDS_MODE_MODE2 =3D 2,
> +	RZG3L_LVDS_MODE_MODE2_MIRROR =3D 3,
> +	RZG3L_LVDS_MODE_VESA =3D 4,
> +	RZG3L_LVDS_MODE_VESA_MIRROR =3D 5,
> +	RZG3L_LVDS_MODE_MODE6 =3D 6,
> +	RZG3L_LVDS_MODE_MODE6_MIRROR =3D 7,
> +};
> +
> +struct rzg3l_lvds {
> +	struct device *dev;
> +	struct reset_control *prstc;
> +	struct reset_control *lvd_rstc;
> +	struct regmap *regmap;
> +
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +};
> +
> +#define bridge_to_rzg3l_lvds(b) \
> +	container_of(b, struct rzg3l_lvds, bridge)
> +
> +/*
> +-----------------------------------------------------------------------
> +------
> + * Bridge
> + */
> +static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
> +				     struct drm_atomic_state *state) {
> +	struct rzg3l_lvds *lvds =3D bridge_to_rzg3l_lvds(bridge);
> +	const struct drm_bridge_state *bridge_state;
> +	int ret;
> +	u32 fmt;
> +
> +	/* Get the LVDS format from the bridge state. */
> +	bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
> +	if (!bridge_state) {
> +		dev_err(lvds->dev, "failed to get bridge state\n");
> +		return;
> +	}
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		fmt =3D RZG3L_LVDS_MODE_JEIDA;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		fmt =3D RZG3L_LVDS_MODE_VESA;
> +		break;
> +	default:
> +		fmt =3D RZG3L_LVDS_MODE_VESA;
> +		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
> +			 bridge_state->output_bus_cfg.format);
> +		break;
> +	}
> +
> +	ret =3D pm_runtime_resume_and_get(lvds->dev);
> +	if (ret < 0) {
> +		dev_err(lvds->dev, "pm_runtime_resume_and_get error\n");
> +		return;
> +	}
> +
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_BGR, LVDS_0_PHY_CH_EN_BGR);
> +	usleep_range(20, 25);
> +
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_LDO, LVDS_0_PHY_CH_EN_LDO);
> +	usleep_range(10, 15);
> +
> +	regmap_write(lvds->regmap, LVDS_CMN, LVDS_CMN_RST_PHY0_SEL);
> +	regmap_update_bits(lvds->regmap, LVDS_0_CTL_OFFSET,
> +			   LVDS_0_CTL_FMT_SEL_MSK,
> +			   FIELD_PREP(LVDS_0_CTL_FMT_SEL_MSK, fmt));
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_IO_EN_MSK, LVDS_0_PHY_CH_IO_EN);
> +	regmap_write(lvds->regmap, LVDS_CMN,
> +		     LVDS_CMN_RST_PHY0_SEL | LVDS_CMN_PHY_RESET);
> +	usleep_range(100, 150);
> +}
> +
> +static void rzg3l_lvds_atomic_disable(struct drm_bridge *bridge,
> +				      struct drm_atomic_state *state) {
> +	struct rzg3l_lvds *lvds =3D bridge_to_rzg3l_lvds(bridge);
> +
> +	regmap_update_bits(lvds->regmap, LVDS_CMN, LVDS_CMN_PHY_RESET, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_IO_EN_MSK, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_LDO, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_BGR, 0);
> +
> +	pm_runtime_put(lvds->dev);
> +}
> +
> +static int rzg3l_lvds_attach(struct drm_bridge *bridge,
> +			     struct drm_encoder *encoder,
> +			     enum drm_bridge_attach_flags flags) {
> +	struct rzg3l_lvds *lvds =3D bridge_to_rzg3l_lvds(bridge);
> +
> +	if (!lvds->next_bridge)
> +		return 0;
> +
> +	return drm_bridge_attach(encoder, lvds->next_bridge, bridge, flags); }
> +
> +static enum drm_mode_status
> +rzg3l_lvds_bridge_mode_valid(struct drm_bridge *bridge,
> +			     const struct drm_display_info *info,
> +			     const struct drm_display_mode *mode) {
> +	if (mode->clock > 87000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->clock < 25000)
> +		return MODE_CLOCK_LOW;
> +
> +	return MODE_OK;
> +}
> +
> +bool rzg3l_lvds_is_connected(struct drm_bridge *bridge) {
> +	struct rzg3l_lvds *lvds =3D bridge_to_rzg3l_lvds(bridge);
> +
> +	return !!lvds->next_bridge;
> +}
> +EXPORT_SYMBOL_GPL(rzg3l_lvds_is_connected);
> +
> +static const struct drm_bridge_funcs rzg3l_lvds_bridge_ops =3D {
> +	.attach =3D rzg3l_lvds_attach,
> +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> +	.atomic_enable =3D rzg3l_lvds_atomic_enable,
> +	.atomic_disable =3D rzg3l_lvds_atomic_disable,
> +	.mode_valid =3D rzg3l_lvds_bridge_mode_valid, };
> +
> +/*
> +-----------------------------------------------------------------------
> +------
> + * Power Management
> + */
> +
> +static int rzg3l_lvds_pm_runtime_suspend(struct device *dev) {
> +	struct rzg3l_lvds *lvds =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D reset_control_assert(lvds->lvd_rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_assert(lvds->prstc);
> +	if (ret)
> +		goto err_deassert_lvd_rstc;
> +
> +	return 0;
> +
> +err_deassert_lvd_rstc:
> +	reset_control_deassert(lvds->lvd_rstc);
> +	return ret;
> +}
> +
> +static int rzg3l_lvds_pm_runtime_resume(struct device *dev) {
> +	struct rzg3l_lvds *lvds =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D reset_control_deassert(lvds->prstc);
> +	if (ret)
> +		return ret;
> +
> +	return reset_control_deassert(lvds->lvd_rstc);

This should be,

ret =3D reset_control_deassert(lvds->lvd_rstc);

Cheers,
Biju

