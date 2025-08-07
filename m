Return-Path: <linux-renesas-soc+bounces-20105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1681BB1DC81
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 19:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2697189BBE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 17:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86072272803;
	Thu,  7 Aug 2025 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="k37sKLwa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8158013E02D;
	Thu,  7 Aug 2025 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754588098; cv=fail; b=JUmSnNOitOslxEXGA2UFrVwqfAQipV+6QvbfTcKXYAc7CpA+RWYfSMrBZgaKkuW+m6D5+ls9PTzFWaaUryVTHv5BatnI2NOhqaTWop7lYxZoCesh9v80zmONTd2sl2LByRSNRsrOxGNsuL5TaFc6STeKNfWO+tUcVGGzRZiCWyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754588098; c=relaxed/simple;
	bh=msT+pyLi5np2oWCkzmj/S0rD2j1XTdXOvR2JKw0qQUs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jK8lUyTgo7UnCdgsn4KCC6bxq4O0g8ALE1OB+8i9awBe4yfFRtD6FrrpVPtjqRhDsrFZfou8YnYI6sj6wKiUxznnpopXVlW/Sc3r+8XOMFAsM0OVm1e60r49JB1pnQ1E5Lg74IxFv6QorJAF5jT9kX1yYyEQZjOn+es8w/AbDTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=k37sKLwa; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcgHtUQyxizD7MA3Cd4u7MsknSOxWEwNZ4OTz48rXYTo5g2uqy8hfVJWBzATlzAO0iS3eQEEgqZtrpAcrDOn5m3R3X9H1hugzlCU8YwqxdP1xa6zM0PbYAUP541CB2mmfxIz0+d2kwEBkkJUTG82eA5TbbojJ3e1U4W65Tyz6mSez0oOdG2R6qMWCV+k5ada34hZ9iUCtraRQXF9d80GdF1WRJF1fHSj2/I1lyhMUOp0oTOWSmY91pC+lJGoCtBPD8u9hCB/rNLZebSYSrxFUw6PeiKwpyIMmofuI/x+nf+OV64WkRWYceVOtm/uZuL31d4fK5rDwuJwuC8VddjjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msT+pyLi5np2oWCkzmj/S0rD2j1XTdXOvR2JKw0qQUs=;
 b=CqtDyss88kxkGRaLLp7uimJva0HfIuyy/HY1J6Zhv6L09rnliF3o3uDxB1GR/mL7+Mav1FDO0JDuKhneO2VMj08NuDAF8rVm9dfaIJHg93U2yb9HSpLqG7YIumnm73conlchAtRWAYQRVFEPgN/R1yJ3KdkokvdlSkI2YQzOaSZShCbu8gfTOK9o1c54jV1z6iu9bl2FRi+c209ZqDLdtlPlzNBtRJwMFP8WU+Ye13dur1gLjnP6UB8koqtUIKy+f9s6RjWAzJTyo9OxL+8DDfGbynPaTtMjxQJihXjKAWn9m9FkHS7Lr0Ya5YzLi7u24GM5wzNAHZUNpGdFhd2YdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msT+pyLi5np2oWCkzmj/S0rD2j1XTdXOvR2JKw0qQUs=;
 b=k37sKLwaCxmESbOnwIddej8XvR9wOX+kDjHsvbWlbY3hyWtYG3zhn7G/XaZaTluNIOPnP5bQxjqS/9VtEwDprGlm+2PkoJtkm2VpbG7vHI2871oGsbYKyyOkWtXkuPC/BcSHq0HqQRxOUyrkV5zJ2CeMsEo0aIgupPOb4PX9PO0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7083.jpnprd01.prod.outlook.com (2603:1096:604:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Thu, 7 Aug
 2025 17:34:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 17:34:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
Thread-Index: AQHcB64SgansaqhVLkmqdmQQ2H+QybRXVi5AgAAT5gCAAAmEwA==
Date: Thu, 7 Aug 2025 17:34:52 +0000
Message-ID:
 <TY3PR01MB1134686EEB15A98266D02D5DF862CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
 <20250807151434.5241-10-wsa+renesas@sang-engineering.com>
 <TY3PR01MB1134633EEEB64A0F24711E522862CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aJTblGZwYSBqzavm@shikoro>
In-Reply-To: <aJTblGZwYSBqzavm@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7083:EE_
x-ms-office365-filtering-correlation-id: 5e46d8c8-8a03-44af-5aae-08ddd5d8b7a7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JxjPDuyDiqqC3yc1op03ajvooAG8pTWZ45kiuF1m6AoPpR9I11MWN0enh+li?=
 =?us-ascii?Q?pjRUOmUaL7Zpk5oc2qPuoHaxfRnn1jW5iEqpRw+OOInKn7LZcSK9h+EuZWvn?=
 =?us-ascii?Q?MzA5a+WMDOy+sspFuuo/4rQ2TBh5WI5aOBnDgOqL7IxRDtkW1hX5JuWM/1aN?=
 =?us-ascii?Q?XQBUHCnyLqbIIxZjLFshajGeRO+oOprSPB+wOtGwyQOvLU+/uSJwlhX6wLf3?=
 =?us-ascii?Q?mQA7DS7JbIScHXjYCP9Q/eSMzHgjSLA/0k150k9g6dKNP8m2R3hJqlW4pNwx?=
 =?us-ascii?Q?48XfMeEaNrlAYBGp/jtwZqKDquqZOchRsXHzAwAwPcUXPDz0+9ONXxvsC/xk?=
 =?us-ascii?Q?bRlaPBMYArE4LxS+LGbJK5l+TKbDmKEpSA7lpb4kv3pf100RJQTeOATD579h?=
 =?us-ascii?Q?wdowky+r5ASqpZN1+BPEjwnkiO5dRfNUv1X5F6QwmfafCxJZ+cW7iSf6WSf7?=
 =?us-ascii?Q?ADYKQc2b8T2y7T9psRR7Ed3IR+4vnOhEeP+QHCzki8OewhPI9sj9DfnsQxT5?=
 =?us-ascii?Q?2bqraxm19niux8uSF2VHzBMRCroLnbFeK9TNloi4iEG69rtD2b824qq/0dAi?=
 =?us-ascii?Q?IQn6AFTjosah2LQiSYv8AmqA0XnYxle/iJpCjG3mwjtPpe7xVxMzHB+1OWjA?=
 =?us-ascii?Q?HEzQ2VLdfRLTzX/zfe/XLojwReYNUG2YDT5sj3jNWYjq6caO7QB0ZIXBunEG?=
 =?us-ascii?Q?hTAq94iCv5IwGVIVauT4Y/vRedlOMmDr/vAdBOC5gl34RTM29zva3OZ0OI34?=
 =?us-ascii?Q?lZl25iiFh6Vqp8jEI4dTFBC3PVf6xInPtJQgRU7ZSlb3fm4pJQnr6u0jXgLH?=
 =?us-ascii?Q?4WcF0QmfwG2WNCSLWTbzvTp3om0PVn7LPe+F+BWr09RQQxEhe4yKg9AYBUMA?=
 =?us-ascii?Q?rpBM6a5TTf0+UTB/TuoH3kTyyw4BikH6A/y8XEJe5u08GPRgXCSjElEkwoM4?=
 =?us-ascii?Q?1MTBg/+zCMqB2cr45oLPi5BBkgp0iZY+fOB5K/9L32NaYkxDmCUQ2lfrJmYu?=
 =?us-ascii?Q?nF8uE9rrD4F2xZbV+vFrmZuRqHEKgoPow9lj1p7usZk+TmgUuA++ggLNk7OJ?=
 =?us-ascii?Q?NHwCpZjrxhn5fzJR32dFgZOKgIboBFoyGMs5XMzK8cMuUppCWdXIHT9QL2+t?=
 =?us-ascii?Q?J6CSQ2WRA5DAsrOWrgOV+L2TvMjj3qcohGtrx6QaUa92G3t9hxRKiLbP1yzC?=
 =?us-ascii?Q?kvX0N9lGzxHSTaPI01TYT+a/EQi+n96Dlr8kzxBefghpP+HGB3AEzD6/samg?=
 =?us-ascii?Q?DFYXIqlcn93ANlMi64DILBUyntgm7V0wH2FygjVCLcuupBkW6KSpJzOSmwxH?=
 =?us-ascii?Q?EEDHyHwjcAVbk2er28FVr9ObCCk2spfsC9V8/LQBbajm6DvxtfKFdUmDgJR8?=
 =?us-ascii?Q?zqRZpSfRfVXjB3WtO7jxDd1LXHkhQKOXIIsoo7gCFHiO3pxt6oOKSdGvv6C2?=
 =?us-ascii?Q?G2k7VXM6p2qu7RG3mSAdDRTi4KCUeQPa9tuT0EUpRsMx8IJv6ogxuA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?O6rQUt8ctp2hdzlOhqZ0EQvidd10acRWF3F9SJdMNiobRY9TgOjU5z1LoTN7?=
 =?us-ascii?Q?RZaAwpi25KvQUjXFIWTC/gIz8qZN2dQd48K4Ufoi/r/hf1poquw7RYutxHs5?=
 =?us-ascii?Q?wUJNKUoatgUtLtiucVFYrXcWIJ5hCSW/naXbUXfOmrXzjvdSiZDrFQm8UTzb?=
 =?us-ascii?Q?FMW9RhYiHHGa0URe/qbJFQxE2wW91qy2bG41ui3o2enltXwyzyoVtIJ6UWjD?=
 =?us-ascii?Q?SBsaOIWt5oGyaqPphAz+6bvwgzjcK9E97hjLulEuWqpuKrxEEuiZgrSFsmSe?=
 =?us-ascii?Q?4kqVW+NA4SDF7mJZXrR5RlckdpXaNd7cL3s1JB5UT6tEmiar94Q76mlwzDTl?=
 =?us-ascii?Q?WgdQH1e0+zx2dJxpjt18nZ8MP/fr4LU19dCNzEl7Rvwf1Q1QGu9e4j/eeue0?=
 =?us-ascii?Q?YjtGmBH3lYwByLAMG2bngZAa7R/50utkcy0RM2Y4xeA9fux+lG022THmITFd?=
 =?us-ascii?Q?p8PEM3kMxmF3fB2o2lORI4zj0rfN0B0ckN63Z0Qe5fLjxT50GJONAtVhoIbM?=
 =?us-ascii?Q?B4YWKDQQ0woI4zWCXnUsvXLFoB9C+zU1U+tfJW1VaHWdAhemD7Tbv+7fTMib?=
 =?us-ascii?Q?LUv6JCpHgOXdGPDRnGu/yv0VrExaNvydTXLLQk53CUj4FH0TX5ULr/mqnDP3?=
 =?us-ascii?Q?YWwSCQqXGka1o1QAxg1GM/ZPQkBkwxphxLgAyAziFrskfndrj2jlEveSs7Fq?=
 =?us-ascii?Q?732bHjcbU1mjBFiJ/VyJOvXXLZWLcfvqQOtCGf27f4fCPoOFfbhxaGHmH0MU?=
 =?us-ascii?Q?4IOrSdEa2bV2Zwmymn8d3LINqOhnMZTmeeAJtJC806gS9946+tuQUv0x+uqI?=
 =?us-ascii?Q?sgwnLfcp6uj/7Sw7UxPoZkBGQxpBg0lPHaZYdcBk1aklp6o5B/wJ2/XjwBL2?=
 =?us-ascii?Q?mjteg6xLt2afEHQQ66IjnirhQWdPVbnPw8gV0XCd4iH7YOkoDFyY3YBPiUwu?=
 =?us-ascii?Q?iPMi9pwd/ORXgivqPVAnhEurNvsufA3/gZDUK7Xji/YA+2g2kVzXqXJVeo/J?=
 =?us-ascii?Q?Z8s8PAND2NUYPwjlpwjfpb4NUk89B09wJcpyWtLLk7lwxoa1CROcsCtoWtEH?=
 =?us-ascii?Q?Fb+WrrR/xfybfMF/2XT6V60jQGxfy484E2F9rAx13eNuW1gVPfiQok98mlrT?=
 =?us-ascii?Q?3h0znB8inD0sZVHPs9pAQhSv9Mo++UwFRY5mYHde+aGV7nstUZvTKR73Gnpx?=
 =?us-ascii?Q?/2SXnMbYpkYYczpQHclwHUz7iI4mj9naxcup+q8mRy0KqhN5JrI9AOJmtX1I?=
 =?us-ascii?Q?5f5eYKQ+4r/DJOgnzNXOg1Qd8XmRZo7Me+uthldOClNyCAU8FOxTy58Z29LM?=
 =?us-ascii?Q?G3QfVh3pDHKmlHPfwNILglZdkeZb5Z9BwYcTeUkUzCZycL4jLsVZh8X4yxJm?=
 =?us-ascii?Q?lZKRRYtQ8Ap2OvjIRuD7AeHVlKs80liW4D2Gs/CpJIfKwtm31jEUonOtivQM?=
 =?us-ascii?Q?a8BHrwxY03teGojOj3iESG+KYn3cLFeMjXymx6ityEJxusO+6G0FbcHiXc4G?=
 =?us-ascii?Q?DRI2BSUpp0vhNBqjVra8/bkfMz9qasEMuoH8YLuAMw7p8JLiVExMINKVtBM2?=
 =?us-ascii?Q?bCpW2N+F4msoFArEtv8KNtZUAuKvi0iphp4rIYkiLeyOE5e7BzEJshk9FZb+?=
 =?us-ascii?Q?vQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e46d8c8-8a03-44af-5aae-08ddd5d8b7a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 17:34:52.7012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NPZIFkj2ELr+oQBvdhwzvZ68R8QYndzrjgSduTIQWcXs5v+veO+8WaeiBP7nFnZc/sy0IURXAY2fz/ZPZ4Np1BplkJakJYiFcH2Dx1K5hlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7083

Hi Wolfram sang,

> -----Original Message-----
> From: wsa+renesas <wsa+renesas@sang-engineering.com>
> Sent: 07 August 2025 18:00
> Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
>=20
>=20
> > What about pinctrl settings here?
>=20
> I overlooked them :( I will let Tommaso handle this because it is not as =
trivial as on G3S.

OK.

Cheers,
Biju


