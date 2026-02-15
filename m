Return-Path: <linux-renesas-soc+bounces-28208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIZMN81/kWl9jQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 09:11:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05513E48C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 09:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6BB4300D930
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Feb 2026 08:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D4C2BEFE7;
	Sun, 15 Feb 2026 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TIUHd2Zt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8512BE639;
	Sun, 15 Feb 2026 08:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771143109; cv=fail; b=ssEZ4SNaNo0YlpAyZueCirN0hkq0vTYKE1UGCH1mKvZ8n5dJN3Ex46DNJnIjnGeiw031+nlCtfHcRVoYIWCUXBs+88gyHV+0X4CF2I/3TXnEsDF2FrDUbBX+1IEFJPyB4gtSkztUGM36BWe203z7Rk6U5MSvLsWr4NrI0FLY1Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771143109; c=relaxed/simple;
	bh=Kz6AHMhhSAtlljstQ99N6ro44/xKyWZOcHgYcA7oAcA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OPEKpjgEQE0Wb/0N8ymQleLyeN2w+ESzDcXqoNLrIbnFlIpKN1HpczIws6sLqN6ARQGnbvnvlie2WRN2CQNjo3xI6T85bKQs3fBHlCVlrA4y5oHKJlsntqWKXCjo5MLqmgLG7baXx8K81ZwJjl6ovY1WtGkC6Hw0N4MSgLPMTVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TIUHd2Zt; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ip+hDVJtsZXNW5ecB7UH3ew+PQNUIz0WygQx83ISFLZRmJtGrR4dG6gtV25DMnMfKTrpfO9XVF3qj8n89Asu0eaVY0LmYZBIa4SyOupsV9fH2r8WWmiPLKIVZgOe7GSSkXYp1yhF1p+kD9Of99uvoSwMHufM7PmtqoMtm+O3Te82CZT9u6f3hkqEsgCuU3//str5yWI147TNYpUb87/sz3FkK0LQCydDhq25NJA2CDKhvkL3M9r+/88a4txLBzS1tASVaWHyHg5GguIgldkx+cQRCJjbFg0bQpNaLsKGQdG6VXW42HRDKc/Ick3U3RS7rJI5XuOtpUdP5KnAGpi6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOvaiyZ9GFLOrpOMmwiADOXcMGl1FQR7vw2BLxiULjI=;
 b=c0ULLC7eXn/Q88kzDvO/L0fBOruMssflFqfKrHNscbanGQkqh12BUuxc2+qMGejF1pUAi3Y7B10BjegkJN8ubzAvpTFOF+t0ZD+jtJcNCYDpsT4VtcnYZ83IcQH/QhsEc2piRG0ubyxWU7guX6zimKDXXZHc75JNEzuEoN87g+Gy7aGbIjQI0exbd/cDYb0r7Ja4oQG2ALsrDX9tIc4XLJh7Nyx98HW1oOfcoq5oKQSN1fNuIEErdRtkHnAsFGQPx8JZFT/iS6F40XDP/wcR0p4caK8KCMcjcHFgK+IXHWWDtv8LPj68s0RXRcxvddgStgqm3T43V8iJga1MMNGVzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOvaiyZ9GFLOrpOMmwiADOXcMGl1FQR7vw2BLxiULjI=;
 b=TIUHd2Ztqqk5tRXs0KEDmHQP4Wl2r7hhMgTX0s6PV22FmrLGhvwE75x2Zm40mUqorSvl47KpomTMb/ErGQqvvwRa3BU7NMPURnzS93fB1zDFc0tyAvXyrqPcTK2Jar1nKt8Nr1awPCSinW6tVkYToBBlVbVWJz/qbCcybLNx7RA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB16885.jpnprd01.prod.outlook.com (2603:1096:405:329::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sun, 15 Feb
 2026 08:11:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9611.013; Sun, 15 Feb 2026
 08:11:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v5 09/20] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Thread-Topic: [PATCH v5 09/20] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Thread-Index: AQHcnQXxMzM3EUraMkKoWbnYkqyBArWDaewQ
Date: Sun, 15 Feb 2026 08:11:37 +0000
Message-ID:
 <TY3PR01MB113460BED5F6F944C0FD4DDB8866FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To:
 <ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB16885:EE_
x-ms-office365-filtering-correlation-id: f7a550e0-8072-442b-0a8c-08de6c69d792
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wzANXy+1HAmTq+/6XFyoBzj7t5TpDx5LsxBeUe5l1x4lAwD7bDsAJ8gm6ww1?=
 =?us-ascii?Q?hnrk6pPoTPVKMPzYypOlHL49rXfLo0X0vu0aMO1H+ICp3t/+8ujkHZ80x7iA?=
 =?us-ascii?Q?Y/Hz65LGRgi3Rq3oE2BkCX3l0ibTn6uMv8tl6+bIDEeppORfImyq+idOooSa?=
 =?us-ascii?Q?9XHiGlAbkL0GtIslpqS7hzS5/LPtp0e3NTdYxKm5S7ZZHrcrYuDK3120ljZD?=
 =?us-ascii?Q?r5P/okcmaLVNKNacngwTLC7Nv/k/g8vQ87nji6mMxFdOvd7jZmpHXwYhB6ob?=
 =?us-ascii?Q?HJ+AzOEKESLxRev4hSfRTTeWcyHE77o/t+Ypj7xJAYNQu34vqcSY3T2Qp5DL?=
 =?us-ascii?Q?Cl9wSIdg79K2fSj+3K4hJW4PE9xAhTNOA091BRmBc9tz587w7nX4AI0/qJsC?=
 =?us-ascii?Q?MkLz66dyAAyzmy3Aadw29xTQqhF19g5GR9+OlMWRKrRGTG6lR9zZMaaY7fLY?=
 =?us-ascii?Q?XadKtRha5k8rYBr6OM7QgxMapwv7M3Fvt6ODKmnJL9kdHU5rG/qHt4uwgqmv?=
 =?us-ascii?Q?L7Q0Ysfvo677PHzdL7n3TwjpTPxO1KxQtWhv13orxm4uI6544Q1v/QsTG0M9?=
 =?us-ascii?Q?k8PRGQwvTRmLMWGkm48018BWX0gbwcohaZlPHalaF4r0t/pZ8rtWFk1ZuZ7h?=
 =?us-ascii?Q?ezOy58LqKTNC0H+9Wcdl0Db26DSpu+f5Y6+hxAOfE0wJuy6ThFSEQyC06kzV?=
 =?us-ascii?Q?U/iYe0mge8u4r31K3mpwoDTjQRACb39c30UH/QwhFODBWNglLEbiDbw/+TgY?=
 =?us-ascii?Q?6t/lT8FddfhNjFKFvURXiKwBuaBe093tlESjBNZsYdLz+UwJQAB9LqV2ZjIf?=
 =?us-ascii?Q?b3CIPwksIAG06jSzPLdLDNbokvdJ/P0ad1qiVVE9BvFXo/uyvKEkWrfXnV4B?=
 =?us-ascii?Q?FlgliFsmsN8whYKXnjRjmKXvmJS6G8rtFTRsaWc+lHpzzdZiSonSbBKCz0OE?=
 =?us-ascii?Q?MyV75MlXmH9+uWKibscruNlmFrUKNZh4RNFyfV5XdywkztaVWoMOagwjM+HE?=
 =?us-ascii?Q?8uCT+C1QkPRsKWsY39K2BulCqB2cmk05ItnFutoswhm8lC8WWXTii8MJrGlR?=
 =?us-ascii?Q?nGW/YCGmUbc66zGetti8S3fb+ddZOJkm+yC7P3BaCwHjr5r2l4x4Jp17rT3W?=
 =?us-ascii?Q?RZR7g9Bq1rrXzjIr+HAsj0zqoys7ZlnsQev06/sLt7ZMwQqG9TLh6uW86Tix?=
 =?us-ascii?Q?zn2j0qXC5lytS+S4XXrcdEsme6YzvDmQraUQM+FXDylHhhiuWbMY4QVObB7S?=
 =?us-ascii?Q?DMz9njPgJVU8VSqtWs9StfmiolJQCtqrojq0g7v8OCvlhPDycTwqR8auYQWf?=
 =?us-ascii?Q?c+yE1JqKZZ/nnn4XWSS7zrE5F+WZS/aI8kB87FJoVKkhWFvn7s6PfQ8Z/wJe?=
 =?us-ascii?Q?SYCxmkhgXSgUqGR3qOhDhyxAEbpBGvFIBNSxOaGDirS+LvP6qcvLXNG9JUel?=
 =?us-ascii?Q?YYi74K+q7hdClrAL97gVYeRc0gMfg6AYzhXxZmPQdj3Tnt0bugl2i+Vf4lDq?=
 =?us-ascii?Q?wogycMvLepgeaHKipIkxyYC5MLSBdVgWznLfyCqR11Nn0/fa/BzoqwFw4vNy?=
 =?us-ascii?Q?tVvJjI7TluhdZZnYCLlCgUZAAWSjlQE8jWGLqt2bAEKhukYc36714lotQTwI?=
 =?us-ascii?Q?aA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UJ1iXtWqhSuQ4rUAHVOofNqm+gfcCgQ3TEovmeKKCRTVaxMPSS3twCQEhOV0?=
 =?us-ascii?Q?c3VvhJx1tKII3lbNyBMCPdYCh2iG66aJvCn+DC4ndF0Wgqc/5FYh/IU0K8Iz?=
 =?us-ascii?Q?0v66OpdMKc42wplGXm/HEdeiMzz2RGQ+aF7yUNLN6flV/3NXP3XOdkwQf2gw?=
 =?us-ascii?Q?sZlzoHVwhNjJTkUwWPlvZOHv4MocCjVSMJIqUt9z3qZE+CeQIh5ZgywpN2jw?=
 =?us-ascii?Q?W/coBQijidnDYJeI0aSvyUc3AxnxXX2OKeoL2kbw1BCVPmjtIvQ8at2MSwMw?=
 =?us-ascii?Q?kXUx1q3iilyVi5lLtJxmVp21r36ttn8CihG+FfM0fZuXNUiW36Gd+NtRhICg?=
 =?us-ascii?Q?Z0Z6MucWTB3BUVhrd9kVGXbQyIMQDy5Cgnga6IZU5nFCpbk8f4SyyNCNKJ8E?=
 =?us-ascii?Q?Fx3w4lW9y8iGRpGL3K3cmVQhN7YBXtscUOOrLqxnE+2foaC9FWFzD23on8dr?=
 =?us-ascii?Q?L6SBp9q9c0Ut0WSQ67nB9QkNTL7MUHW3FK/Hvlk4UjKkruITTVyht7PCz1SA?=
 =?us-ascii?Q?QwV6Rh8xk3yjNblyoeCDkSwF3iK7Ug3EiGDewiRm+2NdxT+8SsU3AF0prs6u?=
 =?us-ascii?Q?OcIfOnIIA65V3SPO0KXh5/53UeyvnDhN5MeXwJUQDOCmTH1R5uqata+Y0hZk?=
 =?us-ascii?Q?tiID6VW/XpbvDY/F/gTfQv5QqVq2M7XRQPGzYKj5preTSFGVSdIcahdNBBlT?=
 =?us-ascii?Q?UAEXEvjV0QB1FK1XxizCcyFGNrrHccd89DzWNTaGdRiool6vQ5SyComCRclb?=
 =?us-ascii?Q?q5t0rAB3yQeqePCXWxWJGJUIkIRLwGGWvi94JeHUYoclZphH8IgXbBqslqFi?=
 =?us-ascii?Q?ic5X5JCpUDu8B7Rgda0B3S4kUW4wj5UgVPxx3oi8UqL87mwHEih6d7Qh+ndK?=
 =?us-ascii?Q?VDoL8FXcaNx0TcsEJBjOecg/EcEdCX1Y3MEwsyLriXpEfcALbjjkhHC68Ynz?=
 =?us-ascii?Q?aHEHDTLe9IUUGvC91TBThs7BwKCdYZ7Quemo3CqaUsn63G7Bl8ZBb1OfyuF2?=
 =?us-ascii?Q?RNwr0LuI8vubkWzFy57mvErCITK0UHtbzb191WOaMrgyd/zMUqF3tRSEXAZc?=
 =?us-ascii?Q?C6uY3XDVdsIfi0hFqzUCgW3g2uxnfb0Y/FhXXDkpIocSJN7LAVSEwdzPitoM?=
 =?us-ascii?Q?UFqUGkxRwhTvTlFuysApsezHcd22x0SRms9/tBdhwDsn3qJ5k6bIUN3Hi77b?=
 =?us-ascii?Q?YZ1HUHhEa+DNc+O8GGYV++M9oWpZuC2sWEJ5nwQeMsDphVuihY2BEqFfUxLO?=
 =?us-ascii?Q?2w+Moanrte1LSTozyUML2TnMPm/N8lFTe+h0V0KYFhfa63+K4zeUkdipG3m1?=
 =?us-ascii?Q?dD8fOStl7DsrA+0pQLmdR/q6BQOfAacSKNys7IGukBJX4Rc1HH5bH+CvI+sE?=
 =?us-ascii?Q?MW068uAzKyBSrDXfaIqOtzrBkLjaRvEtB1YD29Xv/5BjdVf9ESYfgomYyEpm?=
 =?us-ascii?Q?35cHjiriEZtZv97w51moHfMNUL3eoCPySGqjQeHG3wW0fqHwSMQz/NZwcnTe?=
 =?us-ascii?Q?fH7BX1jLlYIm/caRftqMx/umzQn5m3PdErKdbghJeM5Ablh+U4VgzFEDn5ps?=
 =?us-ascii?Q?pI+AW5O9d6DGZJmMksxRSekmN7iueIknvy3jL75ZuH1WZntagO/Qz1Z5k6IO?=
 =?us-ascii?Q?3abIWqyJ2kPpRQCObn8/R/tLFzCTMRYOrwAbD937U5xpFdL7EVI94ZRxQ9oM?=
 =?us-ascii?Q?0sY3rOhoa0bbPv7YsvQBM46d/9Ce+ZSxmUN3v6+Hnw6NbRl4ws48DTDjTIsh?=
 =?us-ascii?Q?Hqzwi1ppDQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a550e0-8072-442b-0a8c-08de6c69d792
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2026 08:11:37.6777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YikoY7Zug0zDLktPOFgTLVBO051i6w+VY9Q2jOEAC0QY5TWYUKDhCbEhxSY4CK9uRFZR8kP8WSmHHpRk6tGeIoNpkSPa/sbZwtV8unJg+KM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16885
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-28208-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.2:email];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 9F05513E48C
X-Rspamd-Action: no action

Hi Tommaso,

Thanks for the patch.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 13 February 2026 16:28
> Subject: [PATCH v5 09/20] dt-bindings: display: renesas,rzg2l-du: Add sup=
port for RZ/G3E SoC
>=20
> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression P=
rocessor (FCPVD), a Video
> Signal Processor (VSPD), Video Signal Processor (VSPD), and Display Unit =
(DU).
>=20
>  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
>=20
> Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v4->v5:
>  - Dropped renesas,id property and updated bindings
>    accordingly.
>=20
> v2->v3:
>  - No changes.
>=20
> v2->v3:
>  - No changes.
>=20
> v1->v2:
>  - Use single compatible string instead of multiple compatible strings
>    for the two DU instances, leveraging a 'renesas,id' property to
>    differentiate between DU0 and DU1.
>  - Updated commit message accordingly.
>=20
>  .../bindings/display/renesas,rzg2l-du.yaml    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.y=
aml
> b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 2cc66dcef870..be50b153d651 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
> +          - renesas,r9a09g047-du # RZ/G3E
>            - renesas,r9a09g057-du # RZ/V2H(P)
>        - items:
>            - enum:
> @@ -137,6 +138,27 @@ allOf:
>=20
>            required:
>              - port@0
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-du
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1:
> +              description: LVDS Channel 0
> +            port@2:
> +              description: LVDS Channel 1
> +            port@3:
> +              description: DPAD
> +
> +          required:
> +            - port@0
> +            - port@1


LCDC0 has port@0, port@1 and port@2
LCDC1 has port@0, port@1 and port@3

Looks like from the above port@2 and port@3 are optional??

Also not sure to make port@1 for DPAD for consistency with RZ/G2L??
Do you see any advantage by making port@1 for LVDS0?

Cheers,
Biju



