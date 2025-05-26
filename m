Return-Path: <linux-renesas-soc+bounces-17478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14336AC3787
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 03:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D06D93A7E77
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 01:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981E142AA3;
	Mon, 26 May 2025 01:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h4mtSNLI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D998E163;
	Mon, 26 May 2025 01:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748221440; cv=fail; b=ilonXxTYa5inVmNgEItF9Krl//GmfhhTY5cPCgxTKdA8bf0sPJxdVVonKhiGkZvdl3kM79eUnIBXuhUfZDQ1LbY3mr+8agd5zrYU0OAgq6PgCMiy4sY/RlPsbWrKF3L8aa9GapWvg6sfOAyT/myhpfsP7TSYcp1HuqhT7bkWeos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748221440; c=relaxed/simple;
	bh=N5OCw6iK4tR4Ve4BxgRa0iJmezpGb3kuncx12q3XtWA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XdNbOHyaTVjX7t3v1Gl2v5DbRf3i+J3EuHvnaZr3mYL9GFfju6IHTEhUYEDpSVfQXPfCZU7aJs2bC7VCUO/oNhjz1zbPs4yCAH8QjHJYHXAfHwSabyqLzskYAivlhNiJJTx5HhbvyrEEjr8AGf1LrZhoRzFjE1dkfmSxCHCne7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h4mtSNLI; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgKGywzZL9VkASUt96ZicuFnw91uPQmlxz+61+4wO0EoLMVbsuJl3xHVUeWGT/cWw1ituXPZRgLAhOecautKEt0KcpRilF4cEot4ACZO8Bx5Uhb9D5IVlL8L06caQSacFTRu3XshLLZcBYsKljq2TJUvSrS6Rr0L9WSUNsdAHr727+/TEP9/CjzuWdfkMVxHB/W+nKKADEnGylDiLJaNT43WPJhycQFD+BPhzaGfdhYTn7BwlKwyhbWftcqt1WxpzQBBtkx69rNhUotLBaYcAWK3/zAqhn8lRpYMi2lq3ZzE0dTYg1+LWmLv2l+TbY+wI3P1UbeYGIx4fNJt66JZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TPqY8WHC90hNN4g80evX8vT2+XF2TACEJO28JUI7+c=;
 b=MF2fOeIBfB8XDWEHl02JBgSArJ7OfumJs+t3r5ws75fZwAjqAFkYxw7EyEXzrHirTAc4Cnp/Weg63xMdcQz8cVkxMcbuGOC1xcaxHfKClBjmAvSTgXHAZVySGijLNXm7bTRAp76wo30mYOwdGXm+C2G4BFlS9zBnumRtBmg0co3ExYpWSih+6dBbJhfM+25qtRpv5mGmqC/5em3TQVSjk7KbOzA4jJZZYQhDWEMkE/6E+a7UFVWOtEpoAJXgkowUHKswaPRtz5lQ+TAjJdx27K8w+Dd9dz2KCHXqJUiaRQ33R7gqGpgDPvUhZSEl7wLqnBWsNZI2ilce8rr2DcqceQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TPqY8WHC90hNN4g80evX8vT2+XF2TACEJO28JUI7+c=;
 b=h4mtSNLI1juzc3pUhhANLpS453R+VTlly2cPFLqjqRh6uNS8TRb2H70u7NsFGN0myeWpUiMduYc3B4sdRlYgOjJDLbKzZNiKXb/lX5JqiNi0Z1vik4daxAiPZFXuZpJYVwHRNhkBGODH0BR+e0ZlGSV7w5jND2qayHoFukpdqSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB13673.jpnprd01.prod.outlook.com
 (2603:1096:405:189::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 26 May
 2025 01:03:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 01:03:53 +0000
Message-ID: <87cybwb2ti.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Sort DT on V4H Sparrow Hawk
In-Reply-To: <20250525160336.82960-1-marek.vasut+renesas@mailbox.org>
References: <20250525160336.82960-1-marek.vasut+renesas@mailbox.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 May 2025 01:03:53 +0000
X-ClientProxiedBy: TYCP301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB13673:EE_
X-MS-Office365-Filtering-Correlation-Id: de9b8845-e7c9-4f97-c0f3-08dd9bf12f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nWiL3IawkdMsTd1BFIJ+r4/uxFL0qeqQF5AuPpPam7FuVPFX6qIt+MihKWYm?=
 =?us-ascii?Q?xsn2VEwBC94EGXmH2LtOOciDcF/jbz38FvJerQfQGoxA8FcYoCeqGiu7MxwR?=
 =?us-ascii?Q?cBrwX14kg+QJ6XAmfXR54aTo981A/K3fG40nYeQ6v+kEMHOnOy1Spw+9mE6e?=
 =?us-ascii?Q?pw3Ey7fIGk50vkmY1NP8ipVPqr713cIlGIzd7Ilrl5g9Fvta5/LIP+QHygby?=
 =?us-ascii?Q?quJ3UxPGM3J05KF7jCEYsDXkeWPEVvay2pt/RfFwhOeEgYqeYpV0C6qYypAQ?=
 =?us-ascii?Q?cY4H1kWmiIISUV8eLm6DUSRJqg5gHMmjNGxktxvZKv5bx/AWqfYJNqTBAtiO?=
 =?us-ascii?Q?TDyQ4c3BfJeunTFsjZZ5X51VXqhkTYbqUG2iSUFDEeoFM8HZhGlqHl6dMmF8?=
 =?us-ascii?Q?TsK3CyqRKq1YTE7sQkHeEkFazxMaa4RMTeYC3v7RH3M+ArSHtss7abGIOPrw?=
 =?us-ascii?Q?QSVKx/Ma4y9ra84p4bWE4QaeBfa0ukhWSmWIFQLMM8kG/yD2mbTlfKGoe3zW?=
 =?us-ascii?Q?0k7NZKb3jVD9AEcoUDjdSMrJuSDQBDMheCdNYyo9qliutXloS+6lOa622FVb?=
 =?us-ascii?Q?7TifPK9gLeFHi1DyPXjNBnNu4OpiM0TEwWYhuRI3WbZrjg1qYDkC38Rz/wia?=
 =?us-ascii?Q?UbuKG5k/NojrFsosGtlrCCBQ6DMKXUbBSNwKNfXtE7H+9sZrN1He97ycf9hF?=
 =?us-ascii?Q?fD6v/LCHvr+FvWWEJI3yvpp65QaQz+DfLcyJ1nkVjOzWdqeindGF+REVYK5w?=
 =?us-ascii?Q?G9JUwI4QZ8QiCXGAgoZNI5k7csPDt5vaHdYHcPZmqk9hxxbZR9FNAGBgUTWn?=
 =?us-ascii?Q?SfabAPpicgNB242MAyO+i20Ev1xcjwLOqhgd3BdY2FmQxoQeH8SS6A6MwvSR?=
 =?us-ascii?Q?uz8gXjOeRvoqrbuUrDgaKh28L7r1o74flJKo6h5NjocgFYihrealT58L+ESo?=
 =?us-ascii?Q?0W2Sg/vaefx+aASlDnAK7nonnsHmiynl9jR3WVmTWXlrHSLv11gODkdudGO7?=
 =?us-ascii?Q?g3xtYCwaZWtVjI7e0MZbWyR5tkuMy/F+ApEa41iRLBc5lAIPWdjHHz62yh93?=
 =?us-ascii?Q?0cCnpf3Hh3WCHuCqoMOY0gMDVgnSHDrXELQNETXuSd/RgE+c65Ju52IFwWuw?=
 =?us-ascii?Q?sxY01SBTJNQyrw0YS+HRbkuHuyWU2L50fz0sRn/09v14qG4pcIsYOh/38JlF?=
 =?us-ascii?Q?o1EYzgIDhLJc06VRHPoRcxjzR5AQMSiyaDN36aqvk5CcTSHzTDrBOnPpGhvs?=
 =?us-ascii?Q?i4D3iqeHOF7WJXAXkg1NYQEQBwrk0r1AbHyjA15tLuiO1536YAy6sfBf/CH5?=
 =?us-ascii?Q?2X3JyAQuSvTqapeI05F+5k7jXcmE91o/I6HpI8ngyQe/ojA1sC8HBD41Yfab?=
 =?us-ascii?Q?cJTMY0zf2YXBpf2db5L70IUXpU9q7c2J4fPLzz9UC5PMj+zTA8Whnm6f7Nsd?=
 =?us-ascii?Q?m4cX2TB8nr7lI/4PTzDDJmLV3t9NcKCLd7OgFaVfn2hHhenJIrySkfXs0uO0?=
 =?us-ascii?Q?jIUigSMzvnBnFko=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yG0lDkijSLxsUPb3PZ46jEpG0/7ghtYaeyGAnsO1Wy8wjZc4wgszaa6Cd1H4?=
 =?us-ascii?Q?IsxQCjfsbwNwdiu8/LV7JykiYYL0u15fOw50GERXjyHo7jwyxuI3GSFlLDJG?=
 =?us-ascii?Q?xv+x+SgOuCbWtcYqSUG6ut9Jtzc8abbn0fNzyVCBDOHmGxIvYNqcjt69a5sr?=
 =?us-ascii?Q?mDE7p02+vdr+6E+TxqqLcWB8hzIlJQBpDPsg/ghcs44KYRi3TqLp2HAInAuk?=
 =?us-ascii?Q?kzY4u0cXM6XZffanuPKzmABJTlavRiV1JtKLZNCB1Sm6tBSa+71zk7scvbcE?=
 =?us-ascii?Q?RA71epGVNSY/NlBRb31er6EmjhUTK1WRwSG0m4A7JMh+hKDYEVjfnBrDNKQ+?=
 =?us-ascii?Q?hsrEZSiOAHeSuLuiVjcda2noyoM764ijCxL3D6HufUkk0XkYutkroi6YEEgj?=
 =?us-ascii?Q?ElczPzkMHsc49I8Y7G0XixLYFoJ0XLTq5zWO1vW+D1acRw/UNIMFM/BshQEF?=
 =?us-ascii?Q?PSkPgtGFO2aTuYSsW6pYKKsSN/k3Pke0S+vXBvCrM2219vave17Ci6w0rx9C?=
 =?us-ascii?Q?X1JGwtxcTSe03UXEJCpFp/V4bNNAgsGjsJACu0+x3UiEumS/E8sm0pD9mNbk?=
 =?us-ascii?Q?XzLiP9laJ+u/LFhMDXwzSahgTJxe/YvoLL+dloSyByrb8KljyDVvviPKmjd0?=
 =?us-ascii?Q?baB1Fka6kejQ7jEx9Isc6wQR6qalTXYlQkKYHLXaSsAYWm00xXbb+N5gPUO/?=
 =?us-ascii?Q?i01BuG+sdVYIcjDrJFbZEIvlLfzNcGQMeNCkjRabq936YOlcceLH+b1tvvZS?=
 =?us-ascii?Q?H9Jx/DmhTVbe6n90gO0lwQ+wppbCJJICnD9go9wKFsd4cNL4O/YbQdT9pHk8?=
 =?us-ascii?Q?hpAKASPxq+OF214P/BKeaa8qH9hPfmFHQQn0KYoALzgoa7AzPkp/Zb7oJJ6Q?=
 =?us-ascii?Q?L0ERCE1/wPOJxwH8niBmh766j2jrEqpfLmyAlO6b53nzZG+CoeZNeipqQkkT?=
 =?us-ascii?Q?ZGVzVrJ2gO4ISI7YCO+KAQXkYmWaxZil+liFBkMJsJapPPDerfVOWLnz4E5B?=
 =?us-ascii?Q?LzYDAC2BzhxlPNUyOis607s2fzBQ1khw8FjZ+FjKWfN4vWq8dZ3LjR8sBF8F?=
 =?us-ascii?Q?gj2qH3MqYPP48ffdUcqtxtma2CksHtN1yr5toVVPm8EdCf5hirWwJ5Bf9S5a?=
 =?us-ascii?Q?Ghqo6W/XSBcLY5aVkMS43zS6icsZr4of2D2bdl5fy2hqEFahDJnXZ3C/V2nQ?=
 =?us-ascii?Q?sg/jPHpdmRqMoqkEDfl4pmJ8woMRr670vIcidiFMGNCpV4a35Pwc6QjWZ4ja?=
 =?us-ascii?Q?rZVf2u7Ix45upT0GTCT78ZRxYV1V83sYmVqiV06CvrXzvnTrXQXTq3XkbXPp?=
 =?us-ascii?Q?LZD5J+zzQzLkbpWKuTUzqGH5ywv5y4t8v0amoX2169tkbpqagHLwUG0c0UDk?=
 =?us-ascii?Q?yNqMbhXx+s4h4dTPa3z6US8DbNp3YUrRFAgcO4197eNis0sdgeGfYOdvyqWb?=
 =?us-ascii?Q?ZlDluWV4TqDOwlU4fa4Ia2lNgIntU6ocBN4doEp49RVw6/vBG4EjRhxTrSyg?=
 =?us-ascii?Q?z5h4yby1ChfoOvNEuhZePCQVlTS8r4F6EZpsN0dSgf6gM4iOHYIfYpK6Tu3R?=
 =?us-ascii?Q?fjdB2VORfhcV+mOajM3pEuxvT9OnhNFW6/ihtye6HzET8wu0hloqNiS6sWiu?=
 =?us-ascii?Q?hhABWg9xxUYN1KJbh2z6jck=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9b8845-e7c9-4f97-c0f3-08dd9bf12f03
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 01:03:53.6178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwfqOPPa5nH1jFJw1XH8835J4VkIWZWw05vFtZCYcIvzoCbTw3wTpydSEQEpghuKEta26GAXNl0stu/6AZypD6gsRtKCHhLpY2frESDlS33+FDP9Km8M3ZN4P4lSYMEi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13673


Hi Marek

> Sort DT alphabetically. Fix up the placement of &rcar_sound {} .
> No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Yes, indeed.
Hmm.. I think I had sorted it...

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto

