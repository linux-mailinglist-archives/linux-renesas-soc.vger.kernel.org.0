Return-Path: <linux-renesas-soc+bounces-7469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AF593A353
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 16:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21C5E1C22408
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 14:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C01156F37;
	Tue, 23 Jul 2024 14:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FtAvM7y8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24BC156C70;
	Tue, 23 Jul 2024 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721746659; cv=fail; b=HKanotvVINkoUY6qyMhZBc0mqpgRWZSxxAHUngbar4vbTv8CtbvRYPK5ryyITf2W3sRWoc+y5lUpNNCp4se+wL30P05ugwMqAEi+DvWS+KXf9Pk7lrSmUQpbH/1YBD2Il8f8i3ff6AwIkE0+GlXtjezCCmo/vtr6H46MPeNzIuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721746659; c=relaxed/simple;
	bh=M7sFDz6bcnDSeVk3Fxl2Be7/UDoBbSE1V2XeYn6wHZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gbMaAcMqyjk6i3jdfjiywEnctG9SebLwht8HLr6t0XK+35dcAY2ZKa3CkABDB/2jA44VSPSSmQ+aQqOh7ooG9ZOSuzHoEEWJ8cGc/9zU3MwzNy6F5ipVu3hkCbyCx83pSE5ae8ehaVFAcaGD02nmuQonUm5vkrYI29M1krKHHWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FtAvM7y8; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/uZa0nMpgZ/3z1THm3WMdYmRjuScy5GVE7zH/B2SvdXwY5NU1nslxSUKO4nZG+nPTUcjvPAJmjT5dAnuswPi/myFUxqO+ghlD+kpmKxeBJSWLf0V5VhHFMVSBIeMuKljpupZLXxCPF6jDwTFY+0fghnATnLH/TSYKq3+pwcTQZG5hmKHMvTC7mHsEGqNyKB1j0tBuVmJ2NexJoDXsluWhmIDGNj15NvNGq3lwbA1n5KQoWfYYtGLdvZGGIFNJ257glPOtdalyrnIS4eqDl0XkUYoB6jaDt1U+nepAHgUCPOz2IRSLoUnOoL6aDD5loVUwxBAmcO2Xz8OBPcxGi+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Co5dk5LfKgx7ib81Rbi8gT/lysPZiENgH9bbaII7yY4=;
 b=cekBWyL9TTcIZ0CgUGAAoJFy93Aa7R4p7qg6UizKLOXZ0ZV5zlioONCbKLeEA2fwSBbyEhZL7mqz7ss2bGYCwOzhx7sWKVzf9oSuzqp5aJezXYcS+x/F/ixZPmB0FE3Fngts7+mdQDQ6vHo/Em3e44h8XMrAm22hl0FPTXHuCiONF7DdT7azBHAmDNL5GxQNEl5AAZK68w0wpMD+hG4RhRMAa7+DY3OGXp6EiAEZaCz7N7QODNoKVTv4Vfmf51Ig5lNZ0HZOz4nQXYlzypnX8N/9mjhrqOvIUy+PR/T8xSg90fDOv1nVWJVJvee4Os4hCy3tZL6GLxqMS+GbysN1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co5dk5LfKgx7ib81Rbi8gT/lysPZiENgH9bbaII7yY4=;
 b=FtAvM7y8v3PjuFojfQxu+ygvssvvLN+iJpH1DcmOu8GxOELP5K/aaVKGp54dtAtHA5nY9aPgKWQBbe0yXDiex93pwxn/OpStrW4ITP5K4uI6tTPqArzSV/ZlFa7DAi2ti7CsQJx5YES/rvAOvhtsXmM7z8OULP3pBHG859yHyzw=
Received: from OS7PR01MB11537.jpnprd01.prod.outlook.com
 (2603:1096:604:245::11) by OS0PR01MB5810.jpnprd01.prod.outlook.com
 (2603:1096:604:ba::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 23 Jul
 2024 14:57:31 +0000
Received: from OS7PR01MB11537.jpnprd01.prod.outlook.com
 ([fe80::b98b:2925:d3c7:b4ee]) by OS7PR01MB11537.jpnprd01.prod.outlook.com
 ([fe80::b98b:2925:d3c7:b4ee%4]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 14:57:31 +0000
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH V1 resend 3/6] dt-bindings: clock: renesas: Document
 RZ/G2M v3.0 (r8a774a3) clock
Thread-Topic: [PATCH V1 resend 3/6] dt-bindings: clock: renesas: Document
 RZ/G2M v3.0 (r8a774a3) clock
Thread-Index: AQHa3PCXB+f0I1+ZKEKxXpB7AWfR4bIEWHmAgAANeuA=
Date: Tue, 23 Jul 2024 14:57:31 +0000
Message-ID:
 <OS7PR01MB1153763B417481DCE698C98D4CFA92@OS7PR01MB11537.jpnprd01.prod.outlook.com>
References: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
 <20240723110733.10988-4-oliver.rhodes.aj@renesas.com>
 <20240723-blooper-twine-a83b8b39a9ec@spud>
In-Reply-To: <20240723-blooper-twine-a83b8b39a9ec@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB11537:EE_|OS0PR01MB5810:EE_
x-ms-office365-filtering-correlation-id: da3298aa-b0e8-4c09-d087-08dcab27c745
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fAZs6ywMcbElbsWs1MXti34oIRKGfciRa+V6I92840BrxtRnXnOR3KRsSULC?=
 =?us-ascii?Q?EbxUYuIXdh4QzAQcGtrtsC+Wa+DyiG5g2PENRFV7gkkw1Ea5DRue5hUMZNmH?=
 =?us-ascii?Q?uJay7t7BzjqWUbvJBXUPTmMrazM8+yaxu+U0FcQwlUra37JPRCsZLVS4+tAE?=
 =?us-ascii?Q?0F0I8AiI3hVAzv/iE1xZRfx96/EZUG7JsSblKHuGFKVnFfkcqkjG1QEhlhBw?=
 =?us-ascii?Q?3/684dsa38OM3+AtgNBNJ7Wc8qWnW8R/LR1lrglPoL1WmHACWwjvjpSXdksv?=
 =?us-ascii?Q?nzMadD9q6+/9pbz1D7LD9dPHky94szgBI7HA40QSgMIDqSsTDCvO1OL8bEGN?=
 =?us-ascii?Q?zUEOspRKIoWNTvUWf2A8U5wDPBR5zXyWet35dWM8Q1GVjMDmBfKgeXMr/TSK?=
 =?us-ascii?Q?pdJzF2uK4c7vs16eyLPo1ABtV1Bpzz4G+Ug0rf7MPbrS4U6SLr6YqrCZvvnh?=
 =?us-ascii?Q?LA+IbHZxORlVNLcDcATCAFLNGparMqCqj6rUsNpRBu2/Eo1JalWQ6fQPBZuW?=
 =?us-ascii?Q?RqV34jGpeXg7yB20jCdRc0t2F5b3i2UCqf++9JupK+laBopqlBi5HwGSwHVO?=
 =?us-ascii?Q?0wEKm+Mq2FVdd/Ptb5ttRR8Vsf9jzOemHvetDAtB7OTHL5hzb4cL2UdtYXpb?=
 =?us-ascii?Q?bgVkpbI9bfLocPqcnGxd8xIc/V9BSNcPuigej1CDL2UokZ/EHNL7xRCOmp5J?=
 =?us-ascii?Q?2jR1gmiLKgNsJ1vv7gIZ3B7BRikRQ3SUhrs/07cPhEzfZu79riaBgTVYQv8Z?=
 =?us-ascii?Q?sVDbLji4FENnBlQ9kxqc3K6P5lSIrwSYumbWAhDpIS9csUYEwzAEa1DwG0NT?=
 =?us-ascii?Q?m+ytOR2xsyDoi4GGtXcZWKkPeRod10iO34+mLVZNyw8EYbYpN1S4UT9E4cVL?=
 =?us-ascii?Q?XauK5Zm57N7XZmvC6Nfc/B+vcCKYZCwzHLR5uvfyv001U6JQuRxQUH5EHGur?=
 =?us-ascii?Q?gZ/cSY8CKJXFJ90VJAXCW/5D22eRFfbegJnFEklsw81Xt6qJsGmBnyq2KgW1?=
 =?us-ascii?Q?dXNdWpijgK1nslOmALFTopyXZmkNw1qN13Hxvy8cUwlYbLH5hJruXdI5KYd6?=
 =?us-ascii?Q?PckjRGG0kdb0Icx8bWPAbhBkFZHNXYU8j6KKh42Ctqk38p3XlXxbIl+0J6Jt?=
 =?us-ascii?Q?r/1jN9dQKnLnbGxZAg1xhuRii6j/GP+Wg7P/U11VoejP1RLw47WD1vh2Ggwb?=
 =?us-ascii?Q?5nzpU4GQN2RiEcrWQ8FUOYnw7PAxLwDc+fHivlrqyt/xlYSXBLUnlKO0AZO3?=
 =?us-ascii?Q?pqU627pmzwaTgSvAiysGEPsHPDJNW0XtGs+n6WTLaLhKeMo3TGXGt2o8iAYG?=
 =?us-ascii?Q?Iq69dpTlWwSULRkMTCf+MR7nk6ofoP2eFCxIiI3EexC0EqyOrP+JypiSAdcR?=
 =?us-ascii?Q?TczLv8flV3/5B/WoqmzG1veTWDfc4FMAHnhTqO/TOS8TF8obVA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11537.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uRIGO072JrTfoH8P9Rhz+oZ+cI2OyutdQrnkuukvcmKCSGd5KRwbJ124o3BJ?=
 =?us-ascii?Q?nUnrQay7UVhV9+kRk+SDN9AnAqZJJNIfYhfXOqVTAxDm6mGqHnOZcqI5CTF5?=
 =?us-ascii?Q?uOpZPBBfZSf0bdMTJEeYnKGhnW1AzBajnQYLxR0MMs5Oe/O0GGaNNpgtlFbg?=
 =?us-ascii?Q?20uCfgtH/ATdec6qBCGo16HC7YtJ2DxhlQSfBtXIWd9LnPV5nHyHvbfcwy6N?=
 =?us-ascii?Q?PL9FHaFVPLbJfM+xfjBVetgwjl2c7xiSROLcblHLEn7Dz/fNauX+b3+Wd/ja?=
 =?us-ascii?Q?B6AcJ+BrjpsN8Cs37PqjO0FYh1lUP7t4rlA7snQSbxhE5aTNM5X5k6Uqfsp2?=
 =?us-ascii?Q?QUroZkMtnV35f4Bh6/VVrfU1XQzikKKTK+a3TcdK36uwg8dY9dpmC9Ct4owC?=
 =?us-ascii?Q?3ZRSsa3VDpL9pDBLgG7mL65+sHrKewlv15218tYC7YuO886B/w5xeYy4toDI?=
 =?us-ascii?Q?V/XmPxUpgOeJM2e2sXlE2EdQp+xhjwGRn6t30fM/ri9a323htTEruoLZQA8M?=
 =?us-ascii?Q?8BCV71JIRKjXLLpr65niJUZ4pjkwaKylr/+zwdlzU9SpjkUTZ4yzm2ZRuB5R?=
 =?us-ascii?Q?IhOr9D3jU1e4Z8auwxKwOLw/SeqaZQWjPb7JGfmNKypEfIP9Mf6fa37HOeL7?=
 =?us-ascii?Q?5iOgbTzUSGp7N31jh7XHPemUn2OP4eeNmRBrHcqykGdXu/EemMRWVcSJxM6V?=
 =?us-ascii?Q?8++WUx6qufZoZIDbOuyy1o8ve4mUmzwD+QEdUaeLaJ5FKcAvYbjgJ+76xg9I?=
 =?us-ascii?Q?EQLT265zITGBijj4XcN2hIKrPlTWo6jbtoQ0O0FPpsA3qQM0RkB3esTNPiQU?=
 =?us-ascii?Q?ag8YIlKcOS2+YMUYwzLBDvjxPnUALb+7CITpUcqk47TGgNHvz+UjWl5Xl6Hz?=
 =?us-ascii?Q?Kam/IjP+uylXHrcywJRNhQ05v8EVa3xFy9UF5ndaHFo+w9bjaZ6g8fVNhFcd?=
 =?us-ascii?Q?5TyXh34+jLCHrXb+oj/CM9EY7KahExx2mpFkz6Wp1VnmFqsrm9WibKT9m82f?=
 =?us-ascii?Q?OftbxjBGNPCX2HgtBekoTwZZV2jRSqg9MxXj0ulltQW/fkkOY1tYXAoaHT82?=
 =?us-ascii?Q?fmPHDonWacRGnK2YBnrqkBtOHtMyx3/EmitiqmBWAUoU5P5cM7C9k0Wmcp0y?=
 =?us-ascii?Q?g056p3NJs12l3FWyzLKbL19Y7c/ahe0mTeQ2tUlPaOfu9Y8Jt0A3vRUUmMSC?=
 =?us-ascii?Q?przMQiPaVadOi6L/aUOAJgfLS98zJ0Ev2kEA5OokHv1+600uZhcHNAPx+Vux?=
 =?us-ascii?Q?it8aHpWvzoCRWxPegB9CT1IQmikb/jT4+tNiw/4QzjKztoXzi+utILugX3bH?=
 =?us-ascii?Q?/agdB2ytwpiM3CbGnO+JuLgIhLETr8AoNjUAmqiiEyEHI0cNBxfqv9M3G4ea?=
 =?us-ascii?Q?/vNYpf4TCUNYrxLbE5WDFVA+vkZ+GH31PbsxdEjcvIdqz+JS1m6y5bepEyHl?=
 =?us-ascii?Q?+LaveMivEOY3LJSb7UPnpWp0q9UPA8e+ISltLEoA1TKKLzkS9Y+XzWvhcVfP?=
 =?us-ascii?Q?Kp2qeJYUrkGbKosl9iXEai3/78E5IChz2rS5XJqcq20ofLBSCRqw5SqjP5JT?=
 =?us-ascii?Q?gK/POLnkqRtKdL4gmiuaMLJakSx+Yn7bh00xPS0izXi/KAiw18prA00mLY8S?=
 =?us-ascii?Q?Gg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11537.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3298aa-b0e8-4c09-d087-08dcab27c745
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2024 14:57:31.5063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nt+kMRw1f2Fp8C/j5FMnUiMdiWY6zISBwJb8WxehAIpmRg4d4Gu2g5W6g3J7BKGJvfT/Eo6jgPemNd8wkyZmPIEnv1aCMD7Rq6yWffZTBLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5810

Hi Conor,

Thank you for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Tuesday, July 23, 2024 3:04 PM
> Subject: Re: [PATCH V1 resend 3/6] dt-bindings: clock: renesas: Document =
RZ/G2M v3.0 (r8a774a3) clock
>
> On Tue, Jul 23, 2024 at 12:07:30PM +0100, Oliver Rhodes wrote:
> > Add binding documentation for Renesas RZ/G2M v3.0 (a.k.a r8a774a3)
> > Clock Pulse Generator driver.
> >
> > Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> > ---
> > v1->v1 resend:
> > * No change.
> > ---
> >  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > index 084259d30232..77ce3615c65a 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > @@ -31,6 +31,7 @@ properties:
> >        - renesas,r8a7745-cpg-mssr  # RZ/G1E
> >        - renesas,r8a77470-cpg-mssr # RZ/G1C
> >        - renesas,r8a774a1-cpg-mssr # RZ/G2M
> > +      - renesas,r8a774a3-cpg-mssr # RZ/G2M v3.0
>
> Please explain in your commit message why a fallback is not suitable here=
.

The r8a774a1-cpg-mssr is almost identical to r8a774a3-cpg-mssr, but it lack=
s
clocks like FCPCI. To handle this difference, we need to use a separate
compatible. I will update the commit message in the next version.

Thanks,
Oliver
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

