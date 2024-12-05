Return-Path: <linux-renesas-soc+bounces-10980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8889E6133
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 00:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6670F169E2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 23:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0311BC099;
	Thu,  5 Dec 2024 23:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RzAJvlGQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011022.outbound.protection.outlook.com [40.107.74.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99F118FDDA;
	Thu,  5 Dec 2024 23:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733440704; cv=fail; b=Jf+wZISA0bSAp8uhRYkReLnY5tWcqx+WMYQKnUDgQLenH7MNsmCYFi9IhK77we/w4+pq6URG4KCeTV2x79WER/gGnSuYzrpNrFW+TXLonn74q/MF2Di/K72hAc6H4UtIKspCOxGuo33krmpwKANSKlUS4Xx0nlUW6vbTlLoWzDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733440704; c=relaxed/simple;
	bh=ykR/8c/K6gEViXo2xwz4JI858OID8qU6AGLTj9MAAzg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XMy/DVD3TSCaZHcQjbvAgu/slUA2Qa5qp5FrKFV09jZeESLMn58mDSz+N3YZw8uRIoaPbWViXvKzn9KF3i3L2snpPLANfBdCLSRFK8FI08mdCW1uCS5Zi//c+1OkXZDA0PbrfS2AU4Ed8Shwn73BvMuIq14sdOpKKSCMMrRQ3FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RzAJvlGQ; arc=fail smtp.client-ip=40.107.74.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDWX8o0abo2+3YAwu0crUaVGhGznNp06p3STnFrvfT1vY6Kg7raATfFFrEuh1Ko7Wh6Qz0Zm+MN44UWvdy+X103OLToTPB8C0Ds+tJgazBUPUoLE5IGuFA8cPyL88kOtMxQccikPtm95Sn5iXqvtUwxwfxAYlGj6VZAcyGMzXCl7xlsJYDh3HDOyyeS/ajFU23Huh9rTVPGrq/CTTrPUm5INT8o2QOXasv7vXo/9nQOpbOwyfpFF9vicHsKggMdyQOUJsfD5fbh9n/lFIzRG4cPOvrn7OLYmZlCD0bBo+E0axSm+OgD84ixWcN37DrNDq/OwY+qcM8deM615Co4jxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Wq6q5Kj2k+D9FA2tPJAXmuK0ikUDsJ+KrfyE3KcXCk=;
 b=s6hsRxZlMSKNH35OyU4u/wrv+BX9S4Yv0GsD4uYydr1lFdLurtGRv26q9a9DmAyecZJahmA/79RvwH7sI05gTDTaGTPGj4sE1kZ+Y+j3x7Vdpqq+/1ce4nI9EHxUXR8a3z1VtribzesNHKnVDk3iVSLAsSg8deXgwtJ8Kt780VB1CwmVbe180dTN5ry2YSfaRnXxAgFofeqtKXk51kpVQg93wllvRSS5Vlh/0IM39CZx2AIWfcVWch8PiiSxBA0SWTthnQaHKOsugg/PNzevgX4SjyhWfhu9aoWo/i1PiqKlTDaGvO7xVUcPBGyZPuob4HydYn979F4oUdjQ02anoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Wq6q5Kj2k+D9FA2tPJAXmuK0ikUDsJ+KrfyE3KcXCk=;
 b=RzAJvlGQU2vdQZttdEPn/cZo3bjs0XnqwDmcEyXXsJJUxKf62sA4cQNa76u8VAh4Ak8c3rpf7rbb6S6x3yb4Gxce2+7mTtJBlH9ANLB4mlgNI/GjFpH2XiNSm4KoDNHPky5SYXSxhAwhzivWZSZRYDlROxQZ0HZbWaskXV+XR50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13614.jpnprd01.prod.outlook.com
 (2603:1096:604:37e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 23:18:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 23:18:14 +0000
Message-ID: <87y10tvhw1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: renesas: Add R8A779G3 White Hawk Single support
In-Reply-To: <CAMuHMdWF7NcmKYzvF4Dfjh3S5MccbJrpSphK5BhxXNnhxgtmYQ@mail.gmail.com>
References: <cover.1733156661.git.geert+renesas@glider.be>
	<87jzcg1d2f.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWF7NcmKYzvF4Dfjh3S5MccbJrpSphK5BhxXNnhxgtmYQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 5 Dec 2024 23:18:14 +0000
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13614:EE_
X-MS-Office365-Filtering-Correlation-Id: fcfdc504-222f-4e74-c800-08dd158317e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vh9DsK7+Npg9HUZlV2Hz4kq3trC6j4NgVCiCauciHW0hWjcTq/Aw0ZoSJHaA?=
 =?us-ascii?Q?70/t+kqIZk5mcTbGMJ1MVA4msGJxLelIFBMQN+olZdwOspCEE5ufWhIjIyIF?=
 =?us-ascii?Q?MX8skps3oA53nEdmM7jpakj9Y6naZAsW447mPqw+nmXGzlmHRjCxj+uw6nv0?=
 =?us-ascii?Q?Odf/ne+b1aQOCKZOZA+dD2UPYz2CFXacEme1FAZOr12yJjSHPJGEXnAf+wtJ?=
 =?us-ascii?Q?v0flig4saV88TxRULirxwLGVpmjwwanSb1mxDb2nZHw27AczqMij2fO8SvCs?=
 =?us-ascii?Q?dMe3SHPWp3KFToDXk5HKvO9HKWw/Si3In+kzKrhHWHtABmtrVnv8luWlOmmM?=
 =?us-ascii?Q?GwK3Hz7nRt7qReWEFVnyvsG01NMpTtBhbZVUwqOu83hN0GeQ04YK75OGjnS3?=
 =?us-ascii?Q?YSxg7PSXJfbmimBUsaMtvUCNt4oFaUn/OD3uXNw/2GapDKS1HQrmzMkFpYq7?=
 =?us-ascii?Q?EQWM9sTGtxVBPsFterI9S1KLC6pq7dCd+1iJTdoC0EYnO6jZWaj/w/05Dqno?=
 =?us-ascii?Q?Mwh04LycenoxWNx6y6LLg9T5SI07ObJ5ohRpOr55hoM1hGbOg4mWYdpGvfcs?=
 =?us-ascii?Q?VxorrYWnlxS9Dx9i5uhQaaLNJvDIkmvArbqqb6N3J4/VcIR/5vE00I2isCGc?=
 =?us-ascii?Q?6nTckA41cMei8lK05kNIhJv1QEieohA87WFMaJfnSCNnBxqFq+Ambs6W+V2T?=
 =?us-ascii?Q?ci6JCpGu+K++Bb/XQS/xwQqctv0tiVxHMoRkQ93Cgff7HZVEKeO/auZbMVw4?=
 =?us-ascii?Q?HQbJD2H+MAPFJa67zY3BHDUi7YzJ6O0WAiwuz7+f9+PPKQPvwyuaxwPf0rr7?=
 =?us-ascii?Q?hA5e3Dpcy7ONOSp5apeUQ+Zr2COprI5fjW1zE6ux7Df16b7Ul3NDpTRU+Hg0?=
 =?us-ascii?Q?OqjLLmEHgI9bf4/vBnErsFOHJQgYJBYFsVWp5m6+Lu+hfS0e8pIjt843QUB+?=
 =?us-ascii?Q?On4C4ptvye5qpyi2K9Z8i42hnwV5hmNJG43yZWMf/gUpvIZ/IStmPmFhmvsW?=
 =?us-ascii?Q?6sELX0xWl4zJEWX6Rl02ceq8oUHmnV+Th7TH4SN9X703cTQItqhsuhl2tc5o?=
 =?us-ascii?Q?Ex3h7/JRf8HcqAVuqIJFGNdKVWND5HHPAb53kgfuxRwz/+WJ8zxg2o+6mFSN?=
 =?us-ascii?Q?XU99/GXTR61wIx3PBLrXsmhP3PwQTHfaPx+9fTBPoH5eFVr6X8TK9ohFg/hI?=
 =?us-ascii?Q?8dGxBSZRok+0QshNtTGwqOCiDvAz006B9i6mn537af4eAgW7R16l8MKABQGf?=
 =?us-ascii?Q?jB3p13fBAK0vGKicOKlD8FScQWlg91AtefMIN6vObLMODv5omh0GlJk5W1AR?=
 =?us-ascii?Q?hajGrsciCwltWwcy0FZwHkUKBoU2OoID2Dl0n3BkiazL51E/I6ILnsIxuVHY?=
 =?us-ascii?Q?3fyWFRvEh2ge0m0BiNFlbI2205fpIj39/6jQNc6EDySJ+PHZBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GhRvR1u1Mf9x9ZnUGOp0MGBg9EKT3UnlH7fHJAD3rKM+47ddu+Fzz+PueNwV?=
 =?us-ascii?Q?4n3TA+RO+B+rD7oUuMW21xsbEeb6lkU1t2XP1jH9cs7To85kv85/2R75JLjL?=
 =?us-ascii?Q?S/QR3si89xOpZ/Ckd2xKta/W+mdRIgmFAxBbkmsyVamTIW7TuzwN5Cm9C+aA?=
 =?us-ascii?Q?WSFhxaJujeIlg7T8SBsmrkk0N9TAVRThfE47GSq2mouzVSiq2qpqzlBZtAIg?=
 =?us-ascii?Q?wsZEMYh0AqLEJ0de/COLYGWwQ/CwO4iitCh6NGVuFSKRr6pi23UBHwZEymZH?=
 =?us-ascii?Q?Y9U6DsHpZsF4NFOccSB2A2sae7S0tSKEzR5+mImsgOxuhBmzSG2GShKelNT1?=
 =?us-ascii?Q?dj2HquCebNsBGk2cs4Fc7wr7cDpiG6fJS07NuoMUKY0JG8dwA6N4Ebt4WJOc?=
 =?us-ascii?Q?cfu9S60A70fKUNPNgVdAjFsAyhs78/St9UGqrwnMYLAQLpVLHRfUAHVkZhJX?=
 =?us-ascii?Q?0YQan5LXbfVhyt1fDGlMR5T2VvzzCl0TmvRMMv4sXNpFCdZazEuSRlGl5+MN?=
 =?us-ascii?Q?3qSB1lxclvXDh1M9isO9DfZvdUQ42ZB3KCZsyWSN3SexyLZMlcDiTB+qsawX?=
 =?us-ascii?Q?kJ1XVUgi6zdtYUutixKbUTkAgcgas/lAa71JWG0BqgzmO3tvfrWJhSJ+hhE8?=
 =?us-ascii?Q?2t/T+x+3WZbLvaeixd1kGkN4aZ1+5A3SEO7ZMBwFi0AosJ5pSWQCu9dw8gUe?=
 =?us-ascii?Q?jiStGiOn094v2+D7Fvx+r6nQiiKUQIM9HueDor9KNyVmJD5q59PBzv5XX42p?=
 =?us-ascii?Q?FBfDkbl0dRBbIYuiI4TmZAMabd0ieZPqCG2jkwq8lObtVq2mkMwwTgqVfbLa?=
 =?us-ascii?Q?PGjcB8xQltGano2+A/lpvmiNt9+mXvqp8MKcOr02738RHQLjiktjz464xIgA?=
 =?us-ascii?Q?UGRr0NbD1FGs6hrw3mYhJS3Ff7xe0NTB8B4zDbGIPxXkyi460e7V6tT+C0qU?=
 =?us-ascii?Q?pi+yb5P7dpsbvIHBigrM8vBt4/31KvGBvaYteuE8ZxWaYb9TMHCO33QSf7bH?=
 =?us-ascii?Q?UcfNG/56yBko6jPmMv93DYyXnonYsKTtogvT0WfnpqnYEF3zdGkeFLgyvrK7?=
 =?us-ascii?Q?dlx0fek+DJGbOWZ1+BJvipeKunXIKTBYF6ElrKVbxlc6C8Jg/XeMDPVF/tUI?=
 =?us-ascii?Q?6ZIC+1oOI/4VE8Iqp3ryOxQP8eKFmMb2GI19ZuZrkUyrBzD7i7/W38r1R/zc?=
 =?us-ascii?Q?Oq419nQE1f2RDS7gkTtrWZTH9bMNTdy6QUyFEbbzYayIT0STAhIW0vkNY67F?=
 =?us-ascii?Q?EOle+3ktwYMjSXqzzLelX6Q+MxH/RxFezZn73KBSPrYnFRdz1S8RgRQX2uY1?=
 =?us-ascii?Q?bQHy61jADiEHX85/BMCG5wC8PVB6QijVqmm4AMFixZqWxsmNL8Lmfbaa9Con?=
 =?us-ascii?Q?g/HMaXbAofp/30wJCctsRMaicAYMWoGvRkNRjbsOgxDlMKYjf0o3zAHg3KvK?=
 =?us-ascii?Q?GZ6O1tXjeG2jMqmdjCP5GyWqhTq8VqEzL6S6jq87J6vXNis2AQBj2PUtJYCM?=
 =?us-ascii?Q?bkqniCdWLdynbHo5LstEFOEAF2S81yQ2QplrCz7rSCp0Fdc4gqWBFieulup7?=
 =?us-ascii?Q?gOQA02yE+Z7H6w0V53ay08FT8jdGQfjXtUF9iRoMUxQiUK+/LyhQcob/bY+K?=
 =?us-ascii?Q?c20PH/VNrwq1GRYwVPwLZBA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfdc504-222f-4e74-c800-08dd158317e5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 23:18:14.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ox1ATyxf9AyNHAwkB3tlb58p6t0TKhVjYQLIS3g/i+dtmkE3Kl4hKro4FQ17ksJXTB3PqdphgjHN01fSQXgx2wiRr2ukbPVbBinnfiln9OAsS0E8fe1EtK0OWLwMAGnO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13614


Hi Geert

> > But small nitpick is that R8A779G2 is not only for ES2.0 but for ES2.x
> 
> I didn't add any occurrences of "ES2.0" in this series ;-)

Almost, but we can see ;P

	[PATCH 5/5] arm64: dts: renesas: r8a779g3: Add White Hawk Single support
	...
	For now, there are no visible differences compared to the variant
=>	equipped with an R-Car V4H ES2.0 (R8A779G2) SoC.

> -              - renesas,r8a779g2
> -              - renesas,r8a779g3
> +              - renesas,r8a779g2 # ES2.x
> +              - renesas,r8a779g3 # ES3.0
> 
> but decided against doing so, as "ES3.0" would become stale as soon
> as Renesas releases "ES3.1". Alternatively, I could use "ES3.x"
> immediately.

Yeah, maybe, but will check.
Please wait.
Thank you for your help !!

Best regards
---
Kuninori Morimoto

