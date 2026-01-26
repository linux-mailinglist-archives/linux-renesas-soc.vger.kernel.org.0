Return-Path: <linux-renesas-soc+bounces-27452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHwNGFypd2nrjwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 18:50:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A48BAFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 18:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E9013028016
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFE2330B07;
	Mon, 26 Jan 2026 17:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OKNEdoks"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011063.outbound.protection.outlook.com [40.107.74.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B83446A9;
	Mon, 26 Jan 2026 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769449790; cv=fail; b=KcgmRYefUXkWgH5SBts0m+sLtpB4axFJ6Bb39Q4ssF6jAugN+PPFPmeAy+EHtekX0+m1EsAI2GykKCzvuu1Kn2NiQ1tiU/FQiyXhdUd7jSBHtA2EbHhc+ap5YjwEioXNL+t0Nh6XWaX+WAhhPzykRT/Nd6ZZ95sVIE5Ca5/6gto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769449790; c=relaxed/simple;
	bh=mDfKM/PYcchFjutuN7tv5Umo/q7YKtQjYavFuL5pnY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jPMS9FaKaZaYJ2d7KPx5Bzn/tmm3ghE1RqyshmnJe/ulSJZGv1YcVy7YEDCo3nPTaRQX+ti8CR/cIXAT6+4qKmHq5kCXun0IdT3aYYe4e3mcQ9/cKRfMC9tPgtOmYYPEppHgn7lJJ06+x1htf6R16Qpy2wbDal54nc9mDcR9zGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OKNEdoks; arc=fail smtp.client-ip=40.107.74.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytZfsL6Sud9XfOc1CHGeyzXPT6Q0W3yQreKPvYYiSMJwhazX88CKLBWkXJFNEHyJkvGCTr4WxmV/vuFTRiDVxIyBG4MnokZtFFDj+MwXgqQautiSUhuLCczvudy2WyE8af4nNuc2fRS6pQwwROmoGYayB/kVD1grE2+9AqRNyBjzgzQn8nrJ/nR8aIinfUtlyyIngGpHRG++m64gvbXpRZwNQOghUHrEx8QZDTwC1atBpCOEUq6zD/bNr2x0M/Rv1IOYkWeGF3V4eUO1a7yTNFOP8uzW4ywQ23h76LSHOf127wq228GidfNyNZhsPJ+LS6Gn1F0dFyODVH2c/szHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSNJoOY0VGct53az45Ln3NNse5baDi8jjTTBxvN0XW8=;
 b=Jkz0uBB1NM02tKcA0Q7VgVwGkqpGGdYSxdKgO7KM5EhnIiKRSw/9nvhZGGghlJVRQyCKZW6X1aY7sj2r3ppouE2DLCRI/xJWiNoY0s5UctNDRj3vhMt3oiziMdwfqTqN3+XB0ZZFkNjQorqL5sEHILiw0SFUyODySOU2zdX9evMnPH9Yc1PNmzTw6R+2EnObLPAL5DTh5+8xlpq29SwoRce++7p29AcgOWpIQ52P4SzHu9ClMSRaAearccQUlgbXA+LnEMtdF/UAM8VciHYK+4Je5ZgIwsEP+HpUtb2uPT8A+2SPoA15XLNESth2weqwF7fWITuUQYURtWCscLGq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSNJoOY0VGct53az45Ln3NNse5baDi8jjTTBxvN0XW8=;
 b=OKNEdoksC/LP5otyq3Gr+YwIAvOrpDkokFrxCz/pEgcvGR1NrzKT1JIe1E+0NT8R4CKpzTujU6Ak5+P4mRkInvOJ3eVY6lHo9mNRTqFh2HNT1oHQeeF/l8gjQtnhorrxmsFExFu77u7rBvlF4GpKsqp/LAmDoTLHtIhatcoMp6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY3PR01MB11151.jpnprd01.prod.outlook.com (2603:1096:400:3d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 17:49:43 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 17:49:37 +0000
Date: Mon, 26 Jan 2026 18:49:16 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 15/22] arm64: dts: renesas: r9a09g057: Add USB2.0
 VBUS_SEL mux-controller support
Message-ID: <aXepHJTJr7A-Bcvc@tom-desktop>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
 <63e8022438eb0d485505c262cac383d76c804403.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdVfsO1NVv6+N37C8ss3thKz+sANCtO00PRhgnD5M1cs0Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVfsO1NVv6+N37C8ss3thKz+sANCtO00PRhgnD5M1cs0Q@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::7) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY3PR01MB11151:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ec7de0-db41-4eac-f0ed-08de5d034607
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9NSzbWXrBbOrgfNUp9sa81+zvEY92zUfeFPbn6F7Z7/Mud7SJg1kiI1UBgIL?=
 =?us-ascii?Q?HiA4CbNog2JtNkUfTKBEhm+OhIZLNMlfsiHswRjdQULDQMBuJpkYHd7YR+FP?=
 =?us-ascii?Q?YwAN7jL1WNtmSuPCv/CU1JI9LGuKJz3hrB/V1EuEj3x2i3spoBePR8m8CIVt?=
 =?us-ascii?Q?4pDqgBQBYZmo7dLFcl6okTlU2GRrUAH+ydBjWRTXggiBHUcbOjDDkTYxlS0F?=
 =?us-ascii?Q?WbuEiB6/Z22dEjntCYePXuTVjMq9R1npl0uncbu3QrvEE5Ou7R/v0GKFhD5E?=
 =?us-ascii?Q?TxEZirqr7ezycWYXaQcipepxWJ4kAzt2DG4OVajGNdem4DW3SqhGayxwaUXZ?=
 =?us-ascii?Q?kg4Lpv7WEugDti4BajqImLRgtL7lFFHqsS97saLFMvi80KzqMQ6QBPjIc+Oy?=
 =?us-ascii?Q?VoA54ocuUiCi08Tr+KNtBm0rddYYRVLvcHoAJF/p5a1ED0rZXwcFuoCvGeX0?=
 =?us-ascii?Q?iRCVJqllIPWqGF78QqohQZRuNczYFMGjAzIdiMwPOcDaUQ/VLglCFzM/YQZF?=
 =?us-ascii?Q?nfIlXhBferDOcM/0fBNTNnJxmojwBimgxITzwUYsemk4zujDVaZ/qSd4KesY?=
 =?us-ascii?Q?X0K3fANAVG4ktqqqkTqVp6UCqHJa5Duc9AkyP3e+NmlXb2GlQf6Yxd1TOhs6?=
 =?us-ascii?Q?rOPQsl1N2LLndUqT7CdiUyUEqYSJHd/b7qaiHb/6wS5dihw4eKG59htONt4p?=
 =?us-ascii?Q?LNIxMPclzCYo45AXHtKNaHVnaWqwvP33omhUcFjoe6tNbkrKjUxMfAJEP0v8?=
 =?us-ascii?Q?tpwzLTLQv/yqhF5jT694GSaeSG+QnZXZDqFRYk3Si+O/ansn6Pv2MUNLz2zM?=
 =?us-ascii?Q?PVr4wrG1KYLsJRK1jcNPiTfc0Sg0w4LYlxoQ2+MqFzATlbHLWvqf6Q98OwCc?=
 =?us-ascii?Q?iHMdWCtmjuq5x8UWJpBuAVYA9gpkyMj2xZ7lroA8wuSUfyA/SbBTN2TxBC0J?=
 =?us-ascii?Q?YorIzeWQFzL6AvfkiquQhheQQWhLYkYqQ8utifxjkfEmvM5xKxB1palEXr3Y?=
 =?us-ascii?Q?ztlW8ViXhu+XYvyphTr2caD3R1USkCd398xZOqoIEpi7wIGxXPvY94/dF5ju?=
 =?us-ascii?Q?qhEC2b8nNEc6ORo+AktOWAbjSo95LLydY5Eq1UdZfskxhyDcRnfZMeRbjqnW?=
 =?us-ascii?Q?PzFm6nk1ga31zC7ksBIIPztpusVm/7vS2hN0Nj3y6jJ7g7akpl23AfJRksmS?=
 =?us-ascii?Q?Q3eYofAV0S81/h2m52LhQwHBlobzwwlyX0fkkkaP8srl6+k+y0ErXeZ/I8IJ?=
 =?us-ascii?Q?emO9KKzW/e0Zqo4LiNMTO/c7JoVPULM25/txUSMu8eN0+4eBIYviTrcGLtkl?=
 =?us-ascii?Q?DEi193+7ZIqm21i4b+G5Eb6KxFgVScnify5mNNWGFSDIfdrINMec64BM2+/p?=
 =?us-ascii?Q?2a19EZ0bi4GGYsTzlklnBCs1AB9xUrIvJ1hDCmpsCFfQ3G97PJrLv0iUtG+K?=
 =?us-ascii?Q?OTFooYNMeH1am9RKssXckIbKw3+FCUJovugLoBd38twbQyJtWWsp0VjsRKO0?=
 =?us-ascii?Q?VInDfD+EFdjySGIMV7/AKjEzi652Fopo/yvbZ7NCxUYQIIAfaRzSDTAhNrjN?=
 =?us-ascii?Q?oyBie56kwm7o1oUgR9GPCCRZW0b0bGbzesxPXMpL+AKAPrlHbWInBBSgPr+q?=
 =?us-ascii?Q?1vTfkCUUi8MwEg1tsebC/Jw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pxx61M+mhv5e6nFeg2FY5HiFha1pIfbIci8yeajRxzBGKO1XAnl/X9pscarP?=
 =?us-ascii?Q?WXq05YSjWU0ZYGTaGZxG0cQ8wbFPrbGTKC1VuIgvM+MGppU9cn4FY16QAm/W?=
 =?us-ascii?Q?31CrvKQ7CI3aSW/PlotjpQpC0PJ/wkmBgqGY/iV3ASVjf87OFE1l0VECpq6/?=
 =?us-ascii?Q?VOwSHxe42pZOjoN+H4glyKJ/4Pyb6D3NszeZOQs1e0ODyr1XoFSCD582EwgN?=
 =?us-ascii?Q?Il3f9Yl1UJXIobAmsuhrmLJNIqURFLFbt/aoZGTz16NmxOJUpnWvQgvTO7vn?=
 =?us-ascii?Q?CO7uiE0mXZ3q8KeP+wFfNnT2NcL8Zhp91xQGx3Y8DhjdD2SP+VyQTAfJRfzY?=
 =?us-ascii?Q?VohPtYMTH57XWOkWTRRGYkg4xfkYw270SiFZslS4/auZA04g5irEKJqH1arS?=
 =?us-ascii?Q?Hbz8gZyrJKMxj6lWYJQt4qiYc72PhFKzXPoJd5TY2uDapy+p6/Lz2/Tb+IGl?=
 =?us-ascii?Q?s0vWSsAEL9kP9NpS3z6IgXRAZjKJAZG0oz96wwzdZRtm/nTAU5SpKCDv6eH4?=
 =?us-ascii?Q?wQfrsQZyXSWt1KeImPUuN2eUrdzBuR2KKa8yX7BMwDenvTFZLAWo312KEoo+?=
 =?us-ascii?Q?tsOpoIJUbsSQJ7vj5xrT+bPuM7Du2mhPVJ3J4GbpRXKuIKcoosIJ4URdEVEW?=
 =?us-ascii?Q?PsoJyR/Ym2n69KhnORreQKpzGmkMC+8T1oaEwYhKpCFzcm24tMf9ox7/LT8K?=
 =?us-ascii?Q?cUXu35PtdwxcolyaBnCR0rxz2MBQ5zK7q2wNTm1g7mOU9qEnNboTcZmLG0h2?=
 =?us-ascii?Q?9S7dVZsiGS7SrLeM3CIaq8r152cM+rQfgGNO28YeZujUFZ9CbBtxW4jL+YRd?=
 =?us-ascii?Q?UsqNiMjw+EvLwgB/JVBGsh1esNxnCRKtaAkPwAPpTmAmOpYWzY2m8giN2cKY?=
 =?us-ascii?Q?o0P+zqJZkZnHeOPfCOv0q5b9YZV0L798Cp8YZ/JRsOI3deChTaQX9OFmPVC+?=
 =?us-ascii?Q?jZ5Y7pNlucVy2SnJqBHNaGboig59K45GIRtuYHzi93bLYaNOeLiXC7E4pct0?=
 =?us-ascii?Q?YENgeTR1vqWIrEZt8iRQ1O0QMRQR//xbCzjkP76/bfYG62jnKH98LgvW+g05?=
 =?us-ascii?Q?zmLPl8IJkktdUqS8g0Ul+wDR1TEa/w9XbC/hUjvDw16kzl1UgFrWOniGq6BN?=
 =?us-ascii?Q?8kPTNpvmfV2kO07IDgfnMllwQ//NMOT9UmVzuFW49k9dpUheMUla/U6KUrQP?=
 =?us-ascii?Q?MiZfb9/1HnQvfj0xrFdT9Srfn+htEns4WRbqcrd52QLt8DMkBqjt7vxv5Llh?=
 =?us-ascii?Q?QZO6eITmW/187li3AOjohYYPloFPUBxM9KEcwcNZW1evWbIYCeletzzgwW+t?=
 =?us-ascii?Q?CjFOB3HYcKoSNdpt4eFXgdBUK7GoGlTVAYlbH2MUnkHSNOjrzvCUnVt9cJMG?=
 =?us-ascii?Q?4ZKLx0EsibXBHkCE0QVxWFHL8uwX8BXu/sYiZsRkXrDAmfUjntuS6e05KGv/?=
 =?us-ascii?Q?9dbdbdEqAKw4AE+bgVvYGB01l7XY43Ze26vfYA9rDj2r9Qk2eNKXyHOzokoK?=
 =?us-ascii?Q?HR02v0adJ6e0Cvm4pZNtOpyYC8U/B6xPi7IOXhDwvcB9+x6E6r/s87G4IU5E?=
 =?us-ascii?Q?LBSjRE92oFs0H26IM5S513QiL+GQKG0OPT0SuQA6sWre6IvTbP2yFCVg2RL7?=
 =?us-ascii?Q?NQLL4Jm71vxZaMYtUFeGgljuBW8o7iJDnit1p76cKEtMyxHuS8rd8OEDUVVR?=
 =?us-ascii?Q?070uJvoHMK3cTWOtWCgyYu/tQyCIeJVrV5hGJzyGDwRbAKsZs3Ea9nyy1sNK?=
 =?us-ascii?Q?0GUfvWSEY9qAh48KT0AoP8xdya0vX7/R89PgfEf0bilN+//6cfHC?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ec7de0-db41-4eac-f0ed-08de5d034607
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 17:49:37.7794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJOXWbxqbkszIS7GUvrDYXYU1EjmfOg+SW6JbkEiXgIIkx9HQCwfrWn6M3rRGwjIpvtJaZ+WDSxcUZOAjsAwFdGyukA4h6oHIeC+nfbk8fy7UoI9e24Itdh3mV85F8re
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,axentia.se,kernel.org,renesas.com,pengutronix.de,roeck-us.net,huawei.com,linaro.org,arndb.de,linuxfoundation.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-27452-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_PROHIBIT(0.00)[0.241.62.152:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,0.241.23.136:email,bp.renesas.com:dkim,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB5A48BAFE
X-Rspamd-Action: no action

Hi Geert,
Thanks for your review.

On Mon, Jan 26, 2026 at 05:59:02PM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Thu, 27 Nov 2025 at 12:51, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Enable control of USB2.0 VBUSEN via the VBUS_SEL bit in the VBENCTL
> > register. According to the RZ/V2H(P) SoC hardware manual, OTG channels
> > require VBUS_SEL set, while HOST-only channels require it cleared.
> >
> > Add `#mux-state-cell` to the usb20phyrst and usb21phyrst reset
> > nodes to expose them as mux controllers.
> >
> > Set the required mux-states in usb2_phy0 (OTG: state 1) and usb2_phy1
> > (HOST: state 0) nodes.
> >
> > This enables proper VBUSEN management for OTG and HOST-only USB2.0
> > channels.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -1034,6 +1034,7 @@ usb2_phy0: usb-phy@15800200 {
> >                         resets = <&usb20phyrst>;
> >                         #phy-cells = <1>;
> >                         power-domains = <&cpg>;
> > +                       mux-states = <&usb20phyrst 1>;
> 
> I am no USB expert, and didn't really follow the USB specifics of
> this series, but isn't the selection of host (VBUSEN = 1) or function
> (VBUSEN = 0) mode decided at runtime?

usb2_phy0 -> OTG channels -> VBUS_SEL = 1

For peripheral/function will be used (VBOUT bit):

	usb2_phy0_vbus_otg: vbus-regulator {
		regulator-name = "USB2PHY0-VBUS-OTG";
		status = "disabled";
	};

[0] Will drive the VBUSEN signal at runtime using [1].

> 
> >                         status = "disabled";
> >                 };
> >
> > @@ -1047,6 +1048,7 @@ usb2_phy1: usb-phy@15810200 {
> >                         resets = <&usb21phyrst>;
> >                         #phy-cells = <1>;
> >                         power-domains = <&cpg>;
> > +                       mux-states = <&usb21phyrst 0>;
> 
> The second controller is always used in host mode, so 0 is correct.
> 

Right in this way we will have:

usb2_phy1 -> HOST only channel -> VBUS_SEL = 0

and not VBOUT bit.


[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/c67fcdbc2c6d1694b785d7240d368490037a82fa.1764241212.git.tommaso.merciai.xr@bp.renesas.com/
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/4618b939734fcfe1f153e725ac178844b44d9a3f.1764241212.git.tommaso.merciai.xr@bp.renesas.com/


Thanks & Regards,
Tommaso


> >                         status = "disabled";
> >                 };
> >
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

