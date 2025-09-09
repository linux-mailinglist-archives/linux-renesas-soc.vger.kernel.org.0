Return-Path: <linux-renesas-soc+bounces-21591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64584B49ECA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 03:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B0BC4E3C71
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 01:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7542248B8;
	Tue,  9 Sep 2025 01:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dGInSts0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3791E835D;
	Tue,  9 Sep 2025 01:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757382284; cv=fail; b=bx+OG7uNHDDIG5tTTjO2MPD1qRgLBLsj9l4ggXFnuA9mkFI3rWThmPTHwi7FtO41n5HOVr7MNSTsuMG+EGMW+CZa4BmAbFiGGDgEwlJLnmXcTNEgCXjf+xhgMBPuge7LjLpKikaiRhMTZuWLFIct0tWxfg1r+AZu1Df7rdEYc0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757382284; c=relaxed/simple;
	bh=EMl2Z7973AyNEhiQzVV3CH7fMVffDbvC2gu5+cRRMms=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=q4wpiBwALEHkOgoETpXE439U50PxMmdU7BRhmaNAweQxFJ+OGIdkH0hnwCkMp8Vacura4QXm+gha0ryY2pWbaGPdtbKNCrdFg25/dBTFd8cVU0BF5uRvMvZW+QB2WCQ43LpM/GBo4HjZB9+/EfT2mnfOM4U45Qjl8ZIW+LuZ4m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dGInSts0; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjeLfoWsztJ7xdctYw3FueDxMy/US+fDs9n3tqV7W5CmtIl9UZxPTBT/9+NYEPHRtzvFagsxcS5ok+8xnijHl0WordfmKTZzWW8xyYvthrELf671lOsvWZREZsHi5KoNKGkX9kXNskOHI2cwwo9zQLJLo/OT80s6+80EZKu8MHGPMH8pK+MlZvARn+O796fJXZwGcjrXbceJHLeeWEUiJ7XjFMBephWHhNAZg9OYfhYgmg25sSsiEjwF26Z8qjkf6j9BVXIE+wijDg9EjM8VF3n1bhJoep1uZOG3GeL/WByLHVTGFRtCddI9R/To+DqHvmY+tlYv+EKLw3XTovQP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYaV1tfP8fHPtOw8+7FWYoCkkuWV1NiuwyvBKq+Hx9o=;
 b=F9AYQew8FZmwJ1WIFU0YVTiYc/bal6RGWbwaYelVfL92X/aUaWOEUcHkRZKPdjDTIlwr4h4N1ASl3bqCVT6X6AR5783SEas6pfWEJ/HKTwL/22gsWxpVmlkEPuPtwrU93+neKUTK2YdlITP3B4jSb1cJ67MOWyZntZJGEG8BNoXqP82Qvtmw5SsxbZD0Qfm3dm0eUSMKLuJ9iDdtp7+vMgxjYEjHmjDmRVi9jnc1ThzMWgh92lqsT8Gr3MqAbsl3eoKAjtIJZ39jFSFKIRagZkgn7jV0aVYM2dfcJaqExZ60L+LBCgUtauM8cILAJ7rA/Ym1xAdakt5l55twoCsHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYaV1tfP8fHPtOw8+7FWYoCkkuWV1NiuwyvBKq+Hx9o=;
 b=dGInSts0nRBQo+CynuEIxrg0FNtWDojEgWoIS1Bf+PaeILZ4VCqk8F/psMnr70+Dk4RIoyVint/B8vzqvTwie89cWE1IFIanjJ+/mnAJn8zjrwGNFJ9CKq4KHf3ySfe22UkK1QCmjgU5mDiMoL1UxclDENPDi5Pfxu1J64MSzEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11404.jpnprd01.prod.outlook.com
 (2603:1096:604:23c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 01:44:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 01:44:36 +0000
Message-ID: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/4] arm64: add R8A78000 support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Sep 2025 01:44:35 +0000
X-ClientProxiedBy: TYCP286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11404:EE_
X-MS-Office365-Filtering-Correlation-Id: f558239b-f1ab-4eef-bf1e-08ddef426edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fq+NZsjIup/5TAgAA1q+3FWHFzq8DUmlvuFSNBlA+X74skEf6y/gNwV1LEgo?=
 =?us-ascii?Q?cPaN5ymeyQTWlJBuyuZOTPGvNywGr1SlHqBdwg/HQkJWocmuA4PsqUJFYBLQ?=
 =?us-ascii?Q?hnHD+8FoYiBurDGIRknTN4XZlTC5Qnp+nbY0pkyDDHTqlDEj4sFtefuwNolc?=
 =?us-ascii?Q?CORFGIQTrAdaT0V8ermR6W5NuS+S9ZjVn3YFz3Xe3x6rj4cAZTw6Z0CgnBnN?=
 =?us-ascii?Q?HSJpi2P+ZNHRPHhxW3MIO1rNoK91xB1JlOruT3sxdcUqg+YG6BZ1pHal4FBy?=
 =?us-ascii?Q?cj2ueLWtseVXbSU2RaYi7iZj0Y8pxOUTuywm50CDuR4eSqc722EvypI3dFcM?=
 =?us-ascii?Q?deIHmfCFjdqOpbURLQz/j6irZGvwdNnhZ8lfTHcSUqU1cflc96A6DpBokISC?=
 =?us-ascii?Q?j9O6w4cYz/QY7MRwkKs4gZkgNAgr4ZVmNr+JDwYY2oupaukXk6HVwGNk2ATQ?=
 =?us-ascii?Q?VluEwRTG6t0ojXtFiYND2tpL5yNFDATYRTlRUrMcXgEFpEV/qZcGTABFQbWM?=
 =?us-ascii?Q?qlG1lkgon15CX7qFBBKbmr6R3xsmEs6YsI+xyKdOT+5fPnETJMu4Cyon8qRH?=
 =?us-ascii?Q?Ipxy1faa5e9NYCu+/8EeincF2ce6Td81qO2JrNZfLLkDTtj3Kvw0956LFptY?=
 =?us-ascii?Q?o/AYBBRAe8+LlHqYwly41Sk2LO1ExX0KvzHM+pxqPqIC8+32yZs27XV6BPER?=
 =?us-ascii?Q?qbNq55vjzW9jeWnY+LhDc+YaiOAkHKAECbBHn+xPZ/67UwJDCJ6G3mPYgUM1?=
 =?us-ascii?Q?s5PSYArf2AMnNV4ggHejy5E44v/z/I9MHy1ggVm9ER/FsEW5NhGbOBc8eKJI?=
 =?us-ascii?Q?pd6VrsTrzKkZ8QHoC1ezEtPkL8EE8WPPtQwP2xjqrZ76dbR5MXZOJTnBz9ud?=
 =?us-ascii?Q?wP+PwHueP0GZb9kLyQU5yy2ETLX/aoalIrIxgFQ2yO/luWwAUH05IdyGKG3D?=
 =?us-ascii?Q?ytKrKk3FMHy8M7ntBlX4PoMxCQ65ZtMk+IQ09jzsQe/i5vOkElHRpO8BuJC0?=
 =?us-ascii?Q?ACUq2UvrcYg5nALgGhIEqdGw9bucY8Cn+3J5qG25LxLaTmNi8HqbXRO2SJSQ?=
 =?us-ascii?Q?5XbESWDfoGwTlqKwEbzCaHwuFsQVsEcqbBzJuVwWPrD9NEOP5oD6tgujNwXh?=
 =?us-ascii?Q?hEsrnZnQ8VGkQrRioCuiukqVQS51EW/YxScimhDmOJfYESm2ULVWIrHCaQ3R?=
 =?us-ascii?Q?sMxbzL57M0wEVLDdNDX1hz+ZX0L34BK5If5nMwnwRoGQN7s19HhJcZOSUwtw?=
 =?us-ascii?Q?IBeZnDIOvzXc0M9SJFEyffCMsE7OXSGXnPFRA4kve7ZlPDvg3Kxb3m/XaKpP?=
 =?us-ascii?Q?CE/mGdaW2cnePh/PrvdyCr0tRCan58vMGoRDCCQdUKu0p5Et8zfl0xrS+IIk?=
 =?us-ascii?Q?nagwohrkiKTacJzea4QZrAEhEq7J3Mro00gGqXYo1i74Sz1QKNEcJSr3626b?=
 =?us-ascii?Q?Fl4PYPefggaMjw5a+zrYZlzwBWYQ24fq3Fm4BHvxBaezntYwTQ03NR3TrYTu?=
 =?us-ascii?Q?2mkngrVRH+gnLXk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8d4mjdBb8Q7+0nwOqB2tunqa8X1CA+IPwUj6l6CBJRWg92Evl+ksg1yCrNgu?=
 =?us-ascii?Q?FftqZzxheRy1UkQvmWD55oJ9vK+MIL03dEnp1BsDyhG2uncn6T/C/xGHqJ9/?=
 =?us-ascii?Q?TPIAOCKGDj5rw/nFiC2oiWELg2PeA3cvIWGMBHTIXwovCqoe5UWzNc53EOfq?=
 =?us-ascii?Q?JPp+V7B6/z9IBTbSjmQJZsvauF+cI7pUmEPYw9G+6+u8tXGj/haM6+kolVG6?=
 =?us-ascii?Q?hNkB9SetnkCTL8JHR+x54HAp1POKASH9vm0NbaSlHBNiwN6vz6X8Tf4dckeU?=
 =?us-ascii?Q?duDOYbSyQSIq6aEdKTaC9Fp4eiXDRT0lXsf/mNHuqZQ0ON1Y1DjvHlbuEep5?=
 =?us-ascii?Q?LNynO7LKxpyIKZyNj+6xh64Cn0vAN+xcdvSFc78tn6hroeiFnVBgR8c08pUk?=
 =?us-ascii?Q?0Ju63m/ELLe9OSF8ZP/xVDOm7BUv1Yzec1v0wcs9VSK67X40nLoRXCyqjlMQ?=
 =?us-ascii?Q?qoKV+U9ib9tPMooZkh1vOQcG6tynn1G+KhzMZ96yxyxo2/tfFhCfq0yKkqNs?=
 =?us-ascii?Q?3QdrkOGxb3bsBWmNOpAWpH6abkIUfsK6fuqIg7DSvnNhm8l47GksppZWjUQK?=
 =?us-ascii?Q?AQvJLgkiDRk4ATi3tAbB7PSMjKtgkJ3jAJtJmYXRkIr/iMMdVpv31z6biQk0?=
 =?us-ascii?Q?Bgx/DLf1mZl5T0xGyC4rI6jcTvxS7oM1EjMYJ/qlDTotn2cLF0ihiEhesgAn?=
 =?us-ascii?Q?ikvRsJ67ITA0AK1j7Vek1rjr88walkoujVBPBUA12PrnkiwRGuLeOeh2J9Vc?=
 =?us-ascii?Q?FiOOjg30kGHfoezWTwXdw+QhYyticpvlgMj+VErI21ecwm7O8v4crRCMfsmd?=
 =?us-ascii?Q?iXgCpqu63QsQVVB6Y1p4si0qT4lVbp+slpDEp/sFHXITYKGudSlqJXDW8QD9?=
 =?us-ascii?Q?KKVTIMpVWO3BFWGJYfm83pUbOiGdGQuGwZve2fY1lVn59Uy7AlDQVqNEEJ7c?=
 =?us-ascii?Q?bktxxwBRpSIBumbwh+59N2PIviPP+uHcc31rvRI/cXIImNenrnLRRTTMaJwA?=
 =?us-ascii?Q?K5X6bT0+UmuHM14Aj6H5XzK7AOrgWs7Ed6PfpCKabovyhvP4XdqcHFQOzdIk?=
 =?us-ascii?Q?J+I0ubvI7ANAFSNnzTSFR/+txZGgj8Hum3uP5HVUOWiRdRthyQaY8eSlIKsE?=
 =?us-ascii?Q?UwjZVOkaUT0rSPnUs6mAqWCpDiyBu0Qfigz5SDPLmyrEhuRB8/Ifyj2+2oXn?=
 =?us-ascii?Q?BgVGGSyhUYofbWM+jRuu9WM+JKLmLgB7JdryaIEJmn+I3H1wLiaNJ+70x/H+?=
 =?us-ascii?Q?O0pQjRfA8e2e1KQpRhL4HtNstzY6Bjstu9GfIxJPl+jQi3V+Hc+vb5bRsbK1?=
 =?us-ascii?Q?S44J7JGujRKqUF+CnIQba5VBY+kiSJ0imN19JC/TMmZbjks291PWtWG/YTP0?=
 =?us-ascii?Q?6atfL2Qqd23QV7ApBKUHuUndg6r6Ro/AeEKL+RnCfxQ/eGDAvxaTDEeWs6pr?=
 =?us-ascii?Q?zq3pWVJCmfTQ8Y5pw8Sn4e9akkwHrOVWf0nt3JdmkOlh/dFvttm6J4ZQLMIj?=
 =?us-ascii?Q?GokHIkAviq5TNQNGZsitqJgqBJUxUeQ9oSMmdzumXd5ca/lDtZjhU8o9Lin2?=
 =?us-ascii?Q?uWi6K4yd4JP55vOyl5LNsdQ4KAMGTdcs2lCNIYKoYaRyRyCsBXh4jZlayxl8?=
 =?us-ascii?Q?cZJGThBbZ44Tkc/RsPIP10U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f558239b-f1ab-4eef-bf1e-08ddef426edc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 01:44:36.5042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcpVyN4RqJqYkTPAyP8J9IO5ypBAsqzJaftQOs7h1cl9o5GyVTBym7+tWNdvluE28fk6T+//hlYZwf20kzsr0Zb7pdMSZroJ3jpF/0iTXK2zhlFJ0F3vu2ECLVxI3Spb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11404

Hi Geert

This patch-set adds R8A78000 and Ironhide board support.
It is based on SDK v4.28.0 or later. It will be released at end of Oct.

Duy Nguyen (1):
  soc: renesas: Identify R-Car X5H

Hai Pham (2):
  arm64: dts: renesas: Add R8A78000 X5H DTs
  arm64: renesas: Add R8A78000 Ironhide board code

Kuninori Morimoto (1):
  dt-bindings: soc: renesas: Document R-Car X5H Ironhide

 .../bindings/soc/renesas/renesas.yaml         |   6 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    |  87 ++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 936 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |  12 +
 drivers/soc/renesas/renesas-soc.c             |  12 +
 6 files changed, 1055 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

-- 
2.43.0


