Return-Path: <linux-renesas-soc+bounces-16201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF21A95537
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 19:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D516F3B0504
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 17:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABCD1E1A08;
	Mon, 21 Apr 2025 17:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NvJmY15y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CAA1FDA;
	Mon, 21 Apr 2025 17:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745256347; cv=fail; b=JcEdF+CmiUqvoLn/PA2QHeXM4iUJnnAo4hobHe8jC2L43pK/gO9t709dLqU5iWFwWmckmzqt5+O6E0/jzrbd4WNNAOk8j8bsFFJ7TH6QeKxPB/aKE7hasyB+sDZVrgVdj5Hcltok5gvv57Tc6wc3CrxBkvhZhsTMfOp7bgEA0ME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745256347; c=relaxed/simple;
	bh=Uzrb9i7RK4Sr17dpHhrGinhNaQuFVFmQ+LE76Cpcyt8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A1fHuobz4CWseMz6NwLuidy6cvaqKfCZV4bIEBjLYdsehsf4fAzAXIuiZlQ97B0A88d7Sx/3T6LeOu5/ggv34s2qeGrYzhOLSmlhJvT589Di7XkOgP1VXTfTBuZqn3IpmUYwEdYeb9F41TU5AT8HahlofD+RX5OjtfIbBm8UZP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NvJmY15y; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQKiBUDBfPkHamJOrJyueCwAl9KS/fhcSoDvkWEXL3kUDUC2oilUb2ViA+8NA9hZci1K5kDiGb0IktjEPlPkpKf7XNu8DSCgSC/2oSwoDioauWtmBTpL3rI5NxyNHNkbv/m0VzYNFSbwnBRxIopm0WoIrjp5egwvrVf5bWiZu3DhHRDIl4Nf4+7wzwUgP7jC9s/dZdEeCNHDdTmvcl5akMHRrPJcHfNIyQsxPdUjaSm1tnmAdxfe+2mI6rQkoiy7NI/m1Tsxq/vYqGeXgf3SJ+Zm9iRFDJbb7YNEYbcAOgobzul1E/T7I3Hr0jUDFbrc80bCIm7bCVE4OyGcqBn4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uzrb9i7RK4Sr17dpHhrGinhNaQuFVFmQ+LE76Cpcyt8=;
 b=CGcr+DvEJ3e0u9FW/udjrYNWEERdNLVehDL6I/hiYxd0EeMneYH69W5UlU01XY+CgPN88mA9WsfbvHeiTygVRNXFfeAl4T/SfnOpJzahfp8/uyGL50tgW6GoBBEWquUoIh/vDS9lVH7Hbyt6dylxP7f0TlMHAEUMcF3gdECU3NXELcn2XXoBGkAveHqkRJgMhxv/i8NmKG/eg6+H+Pgo84ZkBN+SOdCmS1w2uGIfbzqj3SyG6XJfMDTsNyL6LyxBn2A/ysJkrUTp3KY5A2v4yuRsCxN2/OtQ+YNUlGaOCXxAhYqq1xhUAlazeYACblaPH7kcgbKuTK+EXCHMC4eqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uzrb9i7RK4Sr17dpHhrGinhNaQuFVFmQ+LE76Cpcyt8=;
 b=NvJmY15yp/wRl8ZdwqHHnoqUg3rq8oR/93Eb4KkKsEElMchdLS5B1+EJEUBmlm/Yy7IJA1w9guaeA7/K1RN1EUs9B0J9G3SebnuwN9l51BC/bDzc/ePbEBSsumbFfO70mJxFJqXC2fbpG2IWHuDEFwFMmY79kkaxzbBxPL60Bm0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB6695.jpnprd01.prod.outlook.com (2603:1096:604:111::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Mon, 21 Apr
 2025 17:25:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 17:25:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, "Russell King (Oracle)"
	<linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
	<richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu
	<joabreu@synopsys.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Topic: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Index:
 AQHbp7UXRdTsn2oCYUWD5qYhUQGHu7OjbUQAgAAVgQCAATLSgIAJgP8QgAAGBICAAAEN4IAAEkSAgAAhbNA=
Date: Mon, 21 Apr 2025 17:25:36 +0000
Message-ID:
 <TY3PR01MB1134652607E0CB04ED520EDFF86B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f27b0531-11dd-4074-9c79-172953d28292@lunn.ch>
 <TY3PR01MB11346FA4767B74B2CBB2CAFB786B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c27a2359-ee55-4d20-907d-314eee30ed4f@lunn.ch>
In-Reply-To: <c27a2359-ee55-4d20-907d-314eee30ed4f@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB6695:EE_
x-ms-office365-filtering-correlation-id: 0bcb956e-ca8d-42b5-bd4d-08dd80f987ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ddSAQuFKbjVaC7xbRXm7UGeLEEs+egin6qQqt4sapxqb0UwRAJX+mBxC9J/U?=
 =?us-ascii?Q?Z4LKSYo+5i1SEaHf0hnu8JkmZo8bHT8m8P5+q0mghZFhmOxmBiUdKDq/88Hv?=
 =?us-ascii?Q?K4fBTADFx43FKs87g8Xlo2uliKCA/EB4Xf8PXvU+ryPaIxuMAkCu2b5j5p1k?=
 =?us-ascii?Q?3uCk5+vYGC7a27JYpyK3gm0fGnYHCB59jHjFP3aOBxlB9GrP78Jbk3QrrzKM?=
 =?us-ascii?Q?X180mm2LIjMv/ZmlIMz3Qe8M1GlYSS64yqSIHEnII7W2bJOzEU3hSrxOQigr?=
 =?us-ascii?Q?3EfN0s9CTPxr2Ru9gcGVC+pUJ1+h28cG/z20wMcC3YHj/aSU6Rkk1I68J+l+?=
 =?us-ascii?Q?5+P2uyfNfcgK2b0wC+Lz3hdYGWLoV4Bep5cy5hjpgS9snbyZZFVFR4N4hi42?=
 =?us-ascii?Q?7vU25cE9MCVW+xyJsbJDW3AJgdkKPk4sLU4eOdQkkay9FbWSFZXwevl9W9r0?=
 =?us-ascii?Q?v3e2OtNL0vXsMMqC3XmCd/2LahGCEE0BTGRfyodzU1M+J/1YH6IdKrg4q+Uw?=
 =?us-ascii?Q?irWq0Mo05FikvBmFk1qQ/GCIdvGVhiTVhB6ta73auLfP/e0BsJOr+CSyJSXq?=
 =?us-ascii?Q?+qMueS6MV/SibgDXAaGN0yiAPtQxesKu5zZhm6Ca/jdsIb9EsRL9MYyFvMi9?=
 =?us-ascii?Q?Q0dQLqVlJM09Ojn33vDnloz6gCP5RDSP+VMTMkXd8sXBYDypByiz589YAAOj?=
 =?us-ascii?Q?lddIiqtJOYccCn4+xRhhIqbNu3Y82k7ugnE+h7dREvC7A8YdTClMobUbhh5q?=
 =?us-ascii?Q?0jOAP9fHqoVP5KDfr1qbfdNHn1+T+ueQ3FdlI0y90t08tq49Bh2brK8luSYw?=
 =?us-ascii?Q?vv9R634iT6xn9MT5LWjRzrkUzrSvOr8ZcEuIkJcBX2LlOTcbc3fn8zic/FXA?=
 =?us-ascii?Q?SrYqfNhlyXtWvbN8JQL4vuJkM/eDFqMG5T59g/KU1MxXmT3V8BXXQoQJKKnF?=
 =?us-ascii?Q?tL9GnoFWlu2YC1pxnBQIpgRuKX9ztE3ZucYVlEf9QsXttetZraJMkYNH18qm?=
 =?us-ascii?Q?NeqV4jdv9Bk5rCX3pNyoyT2g9SsXnwFzH/e+n0JruNNDs+Iq4T9rqmWx846L?=
 =?us-ascii?Q?Om+Nhmx/63UG5OthBVWAoiDXo8IXt1+NgH0898jZvQE9dkwUtgjDQkkXrHAr?=
 =?us-ascii?Q?CzDncVtALRu1Bc88rGriN2kajINuoTrnAfZRhIUihHmEhpm9NnPlyFnE0oV3?=
 =?us-ascii?Q?eOMxpCZTHeXP48bQ7sbyY4tDs/wG7Y88hKyGeS9h7+jvTdM4QiEMDrRslf9E?=
 =?us-ascii?Q?625j+N92xSfUNir9PDxaSey8USANCudgoXZzj0QfALaFtQ7RfsuW7DQFaxOJ?=
 =?us-ascii?Q?IJ2MoaHS04dODeAuRz8Ug5uRXG8Cu+QgvfiBc4UX8vrcl2VfSMVXdv7pkbvn?=
 =?us-ascii?Q?ZixnF1V5hJ1mmzehhL4O8k1/p3djnESeYj+i8apKDupK0lNC/nVoreXaWQBa?=
 =?us-ascii?Q?JC83L3Ki2zEjqma1V4DRbHXMb9v6YCzx/UM6/y5bwk9KBchLznV6vA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?84zeO2PgUSGzwsQAaZdyZz+o1ZXgN2C91zFm6q6a18juhNmcBV3X3+lpuDcD?=
 =?us-ascii?Q?lIJMVtfvg9n3fdW+/f8rtvURf05GkZxkV2v1izz0Jl5w2WeaoW8bn9iLMhhF?=
 =?us-ascii?Q?kwPAx67/yQx4LmHUSWsxuznRWyHW97aGkkY7FCWCHm00jzPdSxsKZsAftg1Y?=
 =?us-ascii?Q?YpDYhHH+TswaEnbWiLV00M9fa6qq3gj/jk7dRdldViWGElrA2EGlfuIHztHp?=
 =?us-ascii?Q?tWGT+cd6UvBh8ZIry4KTaO35a07TWqBzZNCtjv7WOSdC1+NsNnS2B5EEusoj?=
 =?us-ascii?Q?uhbsehsLlaqUPRxysAfxS8wyZO5KMAOc8sRynL8o30U7Tnd8NB86tuJV/NGy?=
 =?us-ascii?Q?hmLctJIHe73HlvvWwxiBSya3lmIWOJPQErsqX5knPJGaJ0BvbzUW9b6K7K7i?=
 =?us-ascii?Q?wIoge0MYpcFe5MJSXLltkWFIYr2DiMeAPga0o+mXmFRT8eSB1niWCmKnIfvu?=
 =?us-ascii?Q?/KCsGlW8jSY6EnkHZZuN7zKw84zDt8t1CMso/2MOX9mo1W0GJhHpAhAmKXbo?=
 =?us-ascii?Q?zJYu+1y3JehJyktQOR4YezyJpvLUJblNerSDcuy9jFF9hbkuXgB6kUboObu2?=
 =?us-ascii?Q?EO2HzTVnjm7ZWox5wFBsZGFxymDtiBHFNSKEgw2veTSlYCK6kMrbq3uP3V6W?=
 =?us-ascii?Q?W29RLYURzMwKqg41sIezV3sLFNS+zuE3O6F02CKOCsfu2JuXBpCmd+6bPngI?=
 =?us-ascii?Q?Anv/37L26JOGDBwayNpxW/QAjXyg9aPR7HSlnBtW6kbVYhYeuYsSBBmQiz2F?=
 =?us-ascii?Q?QivYhCzFI3ejgXMxJEYzw19mHYWvgF5VtQX5JAzrbw+Ou3OxDrSwPk2NNCLj?=
 =?us-ascii?Q?KzE9TY7a87OuUT0jPajKis2vZABwA4wCKLYbm/43e6SmmEG0cuuul/Ehtj71?=
 =?us-ascii?Q?l4cLFaj/UWSQforzwXqJ6YJbcWggRQo2jr4nbAcCpmd/ETpAqmi7JDEPVlF6?=
 =?us-ascii?Q?TBEBX1Nrd2gopAzpVkaFJ8Uc6C5bsLuX1eOxtuYSaJf/KtfH8I9DPD2UXv4N?=
 =?us-ascii?Q?veCuBN1ZJk7qQTlNG13DFop+6hWFyPJSEemgJ5k4sNjxADgRj9Q1vaxjUnR8?=
 =?us-ascii?Q?9lrmxCoojHaR/T8iaLXFBu7DQiJ3WsUjbtwjSNsH8FIewjWWnEfr1LFmJ+l6?=
 =?us-ascii?Q?GbB1XAOHQM5tRHQCmYdnRPQT2a3/uUVdqYiriF2V1xCb4ZHfUu7PTAeoTgTJ?=
 =?us-ascii?Q?7yRKiynVDR/C/I+aMx0BgupGzyt2fnyj450JKsR1wNlrVPJV8QjAcnx/G1kQ?=
 =?us-ascii?Q?2O0iqsIov5KfOD1wS4vr/ccRKdMAqEV9v75vHkD0l22wBiN7N6BwuOZVdx9V?=
 =?us-ascii?Q?MQhyccQXZPLIzONPzqpyphickQOP+ED+DSXRywQNgti1RgtnOneOogspYnYS?=
 =?us-ascii?Q?+qIXD23CHRWI1sXFJYQFFK0BkT4sutY4qIjzfyEG9OdbGWHH6zUoQLY3Dcbu?=
 =?us-ascii?Q?fsh094A1bVoyHe9w1DHzyT6BhLmLslsu5WEDIuFW05fCEkRhRExh2Zjv6Xqn?=
 =?us-ascii?Q?BDq/0vWHtOUn10QkFSHHnm2qiw5U7D7kKQTpL2vYTazaexqK5YBQfXeOVOD6?=
 =?us-ascii?Q?+kiUvAhwp1/8GPUoATkGOE6XW8bsj8l/7AR5Q7CPTwVecLlCrdyEk9xdDRfO?=
 =?us-ascii?Q?QA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcb956e-ca8d-42b5-bd4d-08dd80f987ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 17:25:36.9877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kLBVhw1yMEdpZy+Bz9Q7B9xvU4lU8BFwwoy83dXH3ziqZoVbOPyT1fwVmXPv65+XUuICQX3Cjgw5OibqVuxQ5/T/OeTe4aTpnRedWJOBacE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6695

Hi Andrew,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 21 April 2025 16:12
> Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer fo=
r Renesas GBETH
>=20
> On Mon, Apr 21, 2025 at 02:22:01PM +0000, Biju Das wrote:
> > Hi Andrew,
> >
> > > -----Original Message-----
> > > From: Andrew Lunn <andrew@lunn.ch>
> > > Sent: 21 April 2025 15:02
> > > Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue
> > > layer for Renesas GBETH
> > >
> > > > > On the RZ/G3E, the upstream support for testing S2R is not yet
> > > > > in a usable state. So for now, I'll switch to using init/exit cal=
lbacks and drop the PM
> callback.
> > > >
> > > > FYI, On RZ/G3E, for STR to work with mainline, we need to reinitial=
ize the PHY.
> > > > I have done below changes on top of [1] to make STR working.
> > >
> > > Can you explain why you need to reinitialise the PHY? The MAC driver
> > > should not need to do this, so something is wrong somewhere. If we
> > > understand the 'Why?' we can probably tell you a better way to do thi=
s.
> >
> > Without this change bind/unbind works. But for the STR case, without
> > reinitializing the PHY, even though the IP link is UP, I am not able to=
 talk the NFS server or ping
> the host properly.
> >
> > I checked clock/reset before and after reset everything set as expected=
.
> >
> > Only change during STR is, on wakeup we need to restore direction
> > (MII/RGMII) of IO block for ET0/1_TXC_TXCLK (IO attribute) in the pin
> > control driver. After that looks like PHY init is required to talk to s=
erver.
>=20
> When talking about suspend/resume, is this with or without WoL?

Without WoL.

>=20
> If WoL is enabled for the PHY, the PHY is left running while the system i=
s suspended, and so all its
> clocks and reset lines also need to be left enabled etc. On resume, there=
 should not be any need to
> touch the PHY.

OK.

>=20
> If WoL is not enabled in the PHY, it should get powered off. On resume, p=
hylib should be
> reinitializing the PHY.

OK.

>=20
> Which of these two cases need the reinitialisation?
>=20
> The reasons i can think of for the PHY needing a reinitialization are:
>=20
> 1) It lost power when it did not expect to loose power
> 2) Got reset when it did not expect to be reset
> 3) Clock not ticking when it should of been ticking.

OK.

>=20
> So you cannot just check clock/reset before and after, you need to look a=
t the order of events. The
> loss of power, or a reset after phylib resumed the PHY would not be good.=
 Similarly, if the needed
> clocks are not ticking while phylib resumes it would also not be good.
>=20
> I would also suggest you check the datasheet for the PHY, and does it doc=
ument anything about the
> clock input TXC_TXCLK is connected to?

It is connected to TX_CTL on micrel phy.

> Does it need to be ticking while configuring the PHY? Any action which ne=
eds to be taken after this
> starts ticking? Is the pinctrl resume being called before the PHY resume?

Pinctrl resume is called before PHY resume

Previously STR did not work, because of not restoring direction (MII/RGMII)=
 of IO block for ET0/1_TXC_TXCLK (IO attribute)
.Because of this, the direction of IO block is set to IN (input) MII mode i=
nstead of OUT(output) RGMII mode.

Now everything works. Thanks for your detailed pointers.

Cheers,
Biju

