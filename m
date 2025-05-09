Return-Path: <linux-renesas-soc+bounces-16831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A5AB0DF4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 10:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D91113A63E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 08:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77415275863;
	Fri,  9 May 2025 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="f/BVICso"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82598274FD3;
	Fri,  9 May 2025 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781061; cv=fail; b=KuocGQuJ6ON7cOZvO3bdliX/bEAT0ChORtQO5AH7grtR/qevRvL4wT4K1+AwNfwdNhCq0u2uHKoC4mFBsvvs8/gObUf90rojH9tgELftAMTS2sCHno5aVn4NDaujzWNW93KYWgBR3HZiSNxA+uu/T+yrHY36NGtdRkuvaoHe1NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781061; c=relaxed/simple;
	bh=AOYJiKT5fbKbTty5qxhinAQijCci7boD1EE9bkPOwLU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P54m4toMAYjNNSQEQuLKMf9AUz6VWxbtk7phXlh/J5jgDrT+xDXhJJonR620EQO6/LRbBG5aCPJFZQg0yn6pIzKig3XggcsPfBhAzDb+Shi2pr50ZkrifsbGyBBoaHCEm6JEphONFTLH2kJ0YpFo5SXaj0UxszSExv+V+v45Tqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=f/BVICso; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9YL+aAcLSRNn49NMewHvb3FI3FTDdyDohAAYXboBu6Ufk1BThRP/H5DXgUwZdgSiMgANfXdNQqD6Rwv1jsjm7UsHQnuX0S1QVpL7HzqFGYH/uywr3YZV+gkkuicZX45ZCRChg52t8fpRBdo1rU9klmUDj62hU/b5lVM8PkDzqZKs/rHMt9xGOLhA5mX+BadRpsyRF71rX0iC3M56W3S5pDL1i1mT/Lb86/UjGU0ozpvHMaf5T/xY7Cr62A3wrTuYkXVsBgdP+MhHIHCkmms7TULEtukwn7KrrpKPiCOpiTl2lc9tc9oa0MU5/iK3jSoHUDKehdULFzoHLridJVhgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRVc0MeVUw+JEXo7aCVFwsT4UKCAf1w05Na4gV7BdUc=;
 b=SKaruJtjBiSeZts7Pu+xEFQpIEKsAiLFmncjKFhRdAEYviEApaRqOxEE/nzFVtm/AAWACVKJPKgkYTQ4Q3Z6Msd/AizzqMojrGTOmkdPR60CY7lGdsh30Azx0r4Ysv54YJgZUpIATN+stFMHxB1aHWRqttWPxzVqmc6dCRudcVjC+Kfk9PH6PzhO7u8Ra65ClASei2x0CoKF8c942/c0O34GMLJ16+loOSwFxW2nLNEKKkDwQ59q9bAZqNfJq/w/aJRoG8jfl46hUyyMKsJF+2+GqIgbmJRHPCROer15aXP0z0NedoLMoB0ZPAEclWGnJcY8mvwE5jKYhNQ8P0Jy3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRVc0MeVUw+JEXo7aCVFwsT4UKCAf1w05Na4gV7BdUc=;
 b=f/BVICsowQq9pCyhovPpmc7Df4aPLJf/V6V/CjD9SC7TeA/bdAnjyUHEEWVUfOulSOqhB/3W8OVgP0AMK19940icGXvKIIAgHdPFQfpukwbk5/19za5API11DA2FJaRyqt3+VAlQxdy446RYj/l6i2wkGbMg6fPiZiHqHW1FrrU=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYYPR01MB12676.jpnprd01.prod.outlook.com (2603:1096:405:15f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 08:57:35 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 08:57:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
Thread-Index: AQHbwEdkfEmibOiFYEqFDXg0xw3l6bPJ/CIAgAADDdA=
Date: Fri, 9 May 2025 08:57:32 +0000
Message-ID:
 <TYCPR01MB113323FCFB291EFA56EBA09E0868AA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250508183109.137721-2-biju.das.jz@bp.renesas.com>
 <202505091649.PuAhqb0T-lkp@intel.com>
In-Reply-To: <202505091649.PuAhqb0T-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYYPR01MB12676:EE_
x-ms-office365-filtering-correlation-id: 8f7d9e4e-aa2f-4f49-5266-08dd8ed788e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Asqg1koSzmQW2MfDn1to8YFzikx53RaIt5QWLXzL18PU3iugU4fyBpaKpVQv?=
 =?us-ascii?Q?Y9HRAL2zzo0NclralL3eFWpinHlqQk8cWHNTj/tnUpZlCdYPI2sM8ExJZllQ?=
 =?us-ascii?Q?+ZYOTfHyTdYQP6gfAI9i3mG56sw+bzitLc7tgCRbRiuTosJ6DmIfOUU1Unmy?=
 =?us-ascii?Q?L27G2zVjZif6FLaSPePfcI0kN/FZen3d/m9G2jrNnhyLnRBUAZNhSP5bsRvr?=
 =?us-ascii?Q?YdVGkB20HJSWUmjECVhlNNGPrltxB5Ek/ipK17ChdmoWymwhhgpWmEaTrAQo?=
 =?us-ascii?Q?zWQt2pnmIedS8ygH6KhYNnSUZJKIg1bvQtkTzlu5HahMoxO1faOPhyT0SAqs?=
 =?us-ascii?Q?IK78tY6iczCIKdVJl14rx9JxJ8Z4Aq2hnTmB0dJg09NLjCtI+czOGaNzrKpv?=
 =?us-ascii?Q?TuzTc+OvmwTYtBn4IrKyAQRZlwfTHMMCckQwBJwyqWIB6o3kA8h121Gch1O/?=
 =?us-ascii?Q?MjrRWcGtXVkyVzHmsoUp3HSPbxQG/Rw/EDivH+8XqSZWy7TKEPiUt9ASkFzp?=
 =?us-ascii?Q?V3uq0rmC7BdIVVp10izgBCBNyY/dDQ5OjcyPRbG777c0kd8TXPfFeyrvLXPv?=
 =?us-ascii?Q?XHZ/H9eVaVu90Fx/0fH1meeXGIegaN/mmBYt2/mHOefdOMhUhiJKAtZocPDr?=
 =?us-ascii?Q?zuI7Kw4U9jhIKzLj8pQSR/6RTn6I6gvPYWs/9FQZ/9V475i3hIub/OfHtRL1?=
 =?us-ascii?Q?4F50zlU1ABOPxKlk2Oxj8CCH7ASV1Tn+93xshanjsa9HtbDbr73csP1cIzBi?=
 =?us-ascii?Q?n18maUqBn5xQmooFDCec7WNtjCNF1boGbDuIrZdoSMPQkUkYP2UIPWclQhqK?=
 =?us-ascii?Q?UoFzEjrhoWXOYTj2RgpBNhFbmLehphFv7swvLe/STNnNQZWK80B2aJFS1LID?=
 =?us-ascii?Q?x5/36CD3Sp7fWuecYdG9O2xKObkyyC13qVuRnn3RdePEADa8HGh+WTR9vODf?=
 =?us-ascii?Q?TpUFRcmujXidHUP20LgdhNo70DGicudhRmRB1liQl04vkV8HnV5L42Cq4Avo?=
 =?us-ascii?Q?wDbKohNJSbH5D34rh71SjcIANZrLgYkPJuKbcvMHgYcKrQGxQ2/HFIPJXs8Z?=
 =?us-ascii?Q?1ZWZVbig/tC6JP7ZBeWPUjaNxhluTcHooUY2oy1/LsPL4xwfWygCE1/lYJHL?=
 =?us-ascii?Q?KpVTw0tlAZh1xF/XTOaRQUxMPlgSrGz/KECnEkO/sOHkzodwQSFkN84YKy/J?=
 =?us-ascii?Q?CxmJ73JjICxwlFt1tww5CfE0CEUuAo8owmhkBQ3XY7UXHHwNlbut42XSniSJ?=
 =?us-ascii?Q?fn0bEZpbkkY4+xoLq3GyM6UDUiZCb2Z5dd8iAAENAQlpKUVKdK9J3Z6DJMMt?=
 =?us-ascii?Q?d+7+hpMQrPVItWOQhAIytH0dmKroeHzMXse2K5bOHBDnhEX0lp5yfERFIDas?=
 =?us-ascii?Q?Bs2bLFkbTUfYaIrgBxoNsx9kikdlVJcTgxVvSIZE1iHsSsxdWTrApxIfw8eW?=
 =?us-ascii?Q?Lf1NHP3N8hI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jpd+WDohM2QBD+kDldXvJoOuSKZg/7Ro246ShIXY92UHwtufYDR+QAywmKO7?=
 =?us-ascii?Q?6jGvFOkNRuFrC8z81wvw3wqRIRBI9DDAU1nmnRbNCBo97HCf8Kd1ZLvhh4Gr?=
 =?us-ascii?Q?xFGdsKRyQ0hy8JIY3EzMnTEl50aqovRjkzjkAwTzo3K4/1iKNWuTY3zz5apR?=
 =?us-ascii?Q?4hz9SxbL1htppZY8zjiR9Kv2BMtGgyMMf9nMx462T7MYMlrLosQIvyFdADpa?=
 =?us-ascii?Q?PlWanTR5tZ3EsCX2wqFV/zjkuPVjd7o1d5UV3j5Tbb7kJ1cD6jE2XXi/Bxqj?=
 =?us-ascii?Q?qe6l5Pb/xHKM0v1AbtQdv/vohMfn+d8dwNHBlDxxlCxwuJQjS1noxd9TLtf9?=
 =?us-ascii?Q?0ZatTDzSFQ5hzUt6S9mLKpA7Ze0bx17B2kDP7KM0324lMjH8gxZHYkqXD5lH?=
 =?us-ascii?Q?CftNpKwZKtpa4MiQb/UynVFrA2gk7HxcMCu89jbVseEyuWP8U17HpxmkegY+?=
 =?us-ascii?Q?lmVrWHkxODEe/AJKRgb46AcTX/Zj3kUC/5shxR+4bnoauRDR5yJnBIzAI4EJ?=
 =?us-ascii?Q?8eD3hk3S0IT98Q3dBe9zH7tcqC+x4YUs47w0Q8ARooF8fk4JlI+APUzeru/W?=
 =?us-ascii?Q?8fvwt8NrITcaLuVO0QjuE1OuAFAz8NTcAEYVYBr94UEXiS71f7BhUX8Qs2ne?=
 =?us-ascii?Q?eJs7V9STBc1cbHNUOHlOvBW+vaoEzY5qkC0ElK4WZc1JGbKqsJO4wz3enV3F?=
 =?us-ascii?Q?FKPfNeI1m7uTRgZnS+n0xfG2VPyN4UqXesA14KO6rMSG5texV9Jt2XsbWIn3?=
 =?us-ascii?Q?0TTkMrSn+s1ax0HWq6szr6il96fTpHYWUz71Zuiuz6Vp3BEz5eG94ZMx6TS3?=
 =?us-ascii?Q?BNZbqxsVxfs3NIbLJ0Gm+2rIb80VFpNBwn1nNOJkBhTDnnjxYQRLa30JYgAu?=
 =?us-ascii?Q?fU2IeyNirG2iHpzycJuZ86GAW+K6vQ9IAvEdUHj/9R+x8yuEZG4Iv0VajXhB?=
 =?us-ascii?Q?HEsG+KYl8bYzMTHI+b2z2ZWWZ/SZi13SwGiOGh6CcJe2L9/T+OtXn5KvO9Gi?=
 =?us-ascii?Q?GtAliVqM6EbGqNhYqnMLCqhQwNnL0BbaPi4wgVtvKOmVKXAvDVpGq3ZUZ7GU?=
 =?us-ascii?Q?phHYj2cJuUaN6zZUJx+nGJfTQHs4pn2izIiGSdKE3Npfsjg9W1Orb3mCtBip?=
 =?us-ascii?Q?LRSes85zHr52gzmqmb2Rjo6DEAGNNz11dfeRHDzBdoEmm/IH+bqdIZxzHipg?=
 =?us-ascii?Q?EAJHmNKgZRqQh+4Ta/Ly0Hir8CeQ2KD+WmaKIZDk0MBUoUsPnXUMWt/ZXpzp?=
 =?us-ascii?Q?JRPM13yiuVJ23Ft3aBcM891+86Z1NdVun7vCXGdie3PqrAny8unldyTQDdcb?=
 =?us-ascii?Q?DJvxNtCvi0e/X33JD/7FfyZp5fwnurQtYX87Obwa5/CSFBCLezuEYRVsyEAF?=
 =?us-ascii?Q?Ao+pMOfEKHtpjA9or68t/YaT0BlmfE2zy+eRrXHusVV5yBQ5ld6B3MoM1iV9?=
 =?us-ascii?Q?GnVR5GJbjUo1IYQn4P6hm7qilIhyVpX5xrJudSbORShP0HLA8UhOCkzBo3ZP?=
 =?us-ascii?Q?07FwdnoIzVyBXwIz/tNgcipxdO2v0EJ8RCU/bnz/lRdmeL0NGwPLn5KflzND?=
 =?us-ascii?Q?mp9H5REyjp4AVo6+meKmo0R762ymzQaREWPA5E8maW1smEwWigtdk8d0ojyz?=
 =?us-ascii?Q?mQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7d9e4e-aa2f-4f49-5266-08dd8ed788e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 08:57:32.2107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3zKi6OM4565ceKhBuDQmbpVHLk5s7QrzXj7Eha+Okl2Abgw+NkiytLAAAh8L5GGM3gT//09owZcu2ibkikjPodgQoWAQHfhX7ot73FE17s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12676

Hi kernel test robot,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: 09 May 2025 09:43
> To: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven <geert+rene=
sas@glider.be>; Magnus Damm
> <magnus.damm@gmail.com>; Rob Herring <robh@kernel.org>; Krzysztof Kozlows=
ki <krzk@kernel.org>; Conor
> Dooley <conor+dt@kernel.org>
> Cc: oe-kbuild-all@lists.linux.dev; Biju Das <biju.das.jz@bp.renesas.com>;=
 linux-renesas-
> soc@vger.kernel.org; devicetree@vger.kernel.org; Prabhakar Mahadev Lad <p=
rabhakar.mahadev-
> lad.rj@bp.renesas.com>
> Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
>=20
> Hi Biju,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on geert-renesas-devel/next] [also build test ERRO=
R on linus/master v6.15-rc5
> next-20250508] [If your patch is applied to the wrong git tree, kindly dr=
op us a note.
> And when submitting patch, we suggest to use '--base' as documented in ht=
tps://git-scm.com/docs/git-
> format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/arm64-dts=
-renesas-r9a09g047-Add-XSPI-
> node/20250509-023503
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dev=
el.git next
> patch link:    https://lore.kernel.org/r/20250508183109.137721-2-biju.das=
.jz%40bp.renesas.com
> patch subject: [PATCH 1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
> config: arm64-randconfig-001-20250509 (https://download.01.org/0day-
> ci/archive/20250509/202505091649.PuAhqb0T-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20250509/202505091649.PuAhqb0T-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same
> patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202505091649.PuAhqb0T-lkp@intel.
> | com/
>=20
> All errors (new ones prefixed by >>):
>=20
> >> Error: arch/arm64/boot/dts/renesas/r9a09g047.dtsi:293.14-15 syntax
> >> error
>    FATAL ERROR: Unable to parse input tree

This patch has dependency on [1]

[1] https://lore.kernel.org/all/CAMuHMdWhTirA+WYxNxHwAgaH6RDfWbhKaji22T_hhi=
JYUkFjKw@mail.gmail.com/

Cheers,
Biju

