Return-Path: <linux-renesas-soc+bounces-25997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD27CD63D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C107B302922D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B9F32E154;
	Mon, 22 Dec 2025 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="O39/yzDN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3C932D0D0;
	Mon, 22 Dec 2025 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411135; cv=fail; b=V5BjjYBVTXinlaYeK5wuLmHCLmTIcRl0xVoelYX/M69pVF9Cz1NHSHqgIPI96ghNhENOJ3ZKx/h9TX+OXwTFvqMjQ5ns1DXMdVar9L1VCR6Q22Hc7GcBtSAITNXjM3qNr3QqX1N1zGREi3f7AvSvjz9KuhNXZ5oUJ/URc2wo5pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411135; c=relaxed/simple;
	bh=v1Wzxa96avNsplxyyPdONsO59vHYk+eD+vKtqlBG7QM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aa2izRAgafNcPXJ1edsjYepH0Eu0Pq06sfPqWy+3i5sfY9HADTq3i+BSYfSloJKFcb7N4u4B3wsxfaVqp09ZGgvRcuasEqBZMIzshts6cg52uTjm6dRpEPNJwx0sup5vTXdAZ6cJ7Z/MRP4cvD9cgIWSIlYM4v5kI8TqkfoNiPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=O39/yzDN; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6pSLvn5DS7zbasG1/1ProswyI+gxDaCIOqwQRP4rh/O3nplQ0C99vj0K1+pU5aeiSKh37YWczjnxIFPoqqkK6MKCVDP+NEQPoqEYSNYjt3MOCCPIFwlcT9mbRPci6tKHRliX6CA+x/3L+4BsiS7p2dzqspyy3jjDHgRIIDBJFYfELyAlPsIcD28SlMM9DTJ6OEwoUQtlg94PuLRIogwrWc8ESdbpHyzNXAiDpSXfeTGGz6sM1qyQvM6sla9+fWtYAGtN1p9NyoIc2IfVj9cuibznt3xf8/xKOrb4nNm1ris9h5earPv60KLEAmzuXLjHYQsYF57i+2tZSmrj6YYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/S1eKdTZ+a3wqWCF4Qu6MoynPQH94cJZ9KDNhzshmFo=;
 b=YyUKNDVMqmvZbSRcZzxsBZjSmfNJLEOkfif9p2Z/HDmdYGjGyoaimwygdBMW4jZKxwXtrYIekmyBmSirG6O7JSC/0TptMm1fTh/tOYmpothp/ZWKDJSnKUUz6LnLhodZuCTUegzhTVbMMU9tridPjw3zNjCGjHiELxCrdqhU3eW8FoWmrxWqzUN/Ll3nK9vV081NCjmPv6R/1X5vjr4DO+/zX5ZooeL975LYquGuBpGTSHVJrj5NnbyNREPofzOXwVtSfZaLcBhcInw5dJKfkyz/JQ9CcaHCqzvd0VaFT8Ry8lmBt7646+Tajt/UEhfLq/DXQI9SOalZa9TVFkdEUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/S1eKdTZ+a3wqWCF4Qu6MoynPQH94cJZ9KDNhzshmFo=;
 b=O39/yzDN/T03JXlQmrEL05STGYPNR8XgX9BOm17S906E1EUfiGJGAxSmqIgPc+fvZj61YT4l0tIc9k276fs4Zedl6h8/Q0wm9kMz73AsloAOQ7DfaR8+bxJtqrDow1lsTUVl2R8UOmaX0zus/AUaDsB0noYHtUp7Qkt8lfuCAhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:45:31 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:45:31 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Georgi Djakov <djakov@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 09/14] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
Date: Mon, 22 Dec 2025 14:43:43 +0100
Message-ID: <4f2454708428b48e03faabe79e383999fb1ab458.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB14304:EE_
X-MS-Office365-Filtering-Correlation-Id: 52db34b1-18e0-431f-a4a4-08de41605f73
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NG95Kt0JKv+09w/3m7TVCS2PPzYC3McsBZIOXj+FZQARb6bQ4iU4QaGPXipX?=
 =?us-ascii?Q?Huapzn8m00HQpdIsaiQ0Zic7ZLSSKIZbenKeYntfH1l9TZgNVJ/7RLIVJmKn?=
 =?us-ascii?Q?HYl8bcle+lLYukwIcW7jF2Nd+a/eCQ/3BAfjqc9wJEjsspOk19y0R40miWxr?=
 =?us-ascii?Q?APRAlWocXSEu8zCUQ0COXGng9I1TGq9/UrskxofsQF9MRlmKiLEH49VDmAz0?=
 =?us-ascii?Q?Lm5rbL3/Hcrp56ZWwLouyGkYNyPE2vzhpzkX1WATvTNgZo4JTwAbHp+Ug1S5?=
 =?us-ascii?Q?G724Tm5tWFzy4mGSQA+VsNH6KfRoCO4IsK0SHwvpJpRVv/mFix6VZ95cSB2Q?=
 =?us-ascii?Q?ywk5icLvm+mpnEB09E4Hvcs3MGZ4HWNrG+Nvc6xLDrdqYXHh347yGm3CT5ql?=
 =?us-ascii?Q?yE7scqUrHBk3Q5KqUwxMliXZQE+h6bnoymUflz2eU7sxGTL+AkaJb0VsCm8d?=
 =?us-ascii?Q?unVg8K8CMqN55fINPrpxcNRICFMG+UJAxj0XSt9TzCkaYN4heAmlGWU7xebV?=
 =?us-ascii?Q?IWCip+7H58pjsQ/i63n0lL3hO62k4TPj+eM0R+7Q0sjKIpISirN2fDKJhwfS?=
 =?us-ascii?Q?FHTLkgAIptK9uxBbuvuP8vq2Kmy1vcJ1oD1n6agpglITsEZ9QxM6Hb83BjR2?=
 =?us-ascii?Q?x4xP3zqHDvvKNoKGpZorf0mqdkQm7p+LjOjolsAeR5RnXuHcI4JxMgceQIL2?=
 =?us-ascii?Q?TzNxmNKUGz9wbQ6l+r4x6aZv4ma41xIC0KjUiEcgGwL9WOjvnhWg7fZOHMKr?=
 =?us-ascii?Q?nW044qOE6HfEeEkd5zme4MHYVtMEQg/XghnzpTdMYxWIS60Qjr7v2reUo9sf?=
 =?us-ascii?Q?pB6UHYZYIIOj9xSicmeuNwgSD3fnPdHVsktsWhLSlVojE2/VHzwv03aQ2cCH?=
 =?us-ascii?Q?mpmi8UQXLwuiOtV0l6SqqDamJOq8PdUuANSNKJYcaqZpT+8fdYOHI3yMbr+z?=
 =?us-ascii?Q?V1L797kPb/1YeCBMpJpXiuFBCIDt0MmC8G4yDY3ElNFagBk3SAw3m6urAqxg?=
 =?us-ascii?Q?bLNOFXPfxAN1u3z6FvxEecQWc6OdChpZnEvhHpavIDgG9E4b+B5YeVeqY1y0?=
 =?us-ascii?Q?LLx1Wx5Dxp1x2C1q/iy6hpn71KgFbFHeDs2dveY+ep4jiIO7Sxy4ZVCdZkYZ?=
 =?us-ascii?Q?eVMAfc716LWYdKLWJhGw/QzP465sAmDoQepgrwwwvTUcJcq+cFrR0xBPLFGu?=
 =?us-ascii?Q?x01XkLbj0TxF5vLh1fXbaCBcdWegv9EXkXXA0zxGo6aEyZTqcrWajIOBDk37?=
 =?us-ascii?Q?izUL4rNQ0peuG8Ciak10mZTSHyllZrQV8v+yDWuobePsyye/bahilBTwC3jh?=
 =?us-ascii?Q?NQHmSDoajRoepWOxhp7U5rh9bv8jdfcVDDc4aHX/5DlXhHykA9Hr/XZnVq/n?=
 =?us-ascii?Q?iKUcId5R6Pk6GjJ6z6udwX2YjseddZDFYYkltA4/gNmqQeFvGLwgRX1QCWvU?=
 =?us-ascii?Q?GaM/IfiN9KCE8VwSc0uXgbBUAkaZY37iyjA0DjJYhqOHSu4LpXdvbEh75cp2?=
 =?us-ascii?Q?Jr/nBOevdfy11jDtrs/ezUFKBNOwr0z7r5Nr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qPIgRvgenNhwhoDMkWvLvAXMO3uP2dwtufVp8zDBaR17dslBIQU2+XUp+Cbh?=
 =?us-ascii?Q?WU4VbTzUuUh5+Z388Tumodzr2vsV+LfHDtVOdt1Onu9looyeogEqhz1d3GDt?=
 =?us-ascii?Q?BbuQgyCo9KT29vLxvXF4zeP366ukDigKOOUkYhqd8gldIoxRDsHaFWMEPAz0?=
 =?us-ascii?Q?LZElGzmLcESdlhiRDsIiEDIPmriVeuIKwWHrtt5NuLuri/R1xxKTJuuVJkx5?=
 =?us-ascii?Q?NiGAyj10lmiv1s9woBQg/8M4MAJgoROo6ftUCM9VYRK+FGsP7qgMnK4BZ1cm?=
 =?us-ascii?Q?gxMbII6heA1sTWjn3k/lkTIrxswoDI1C7X0h/fqKlmsdG000pdmphVITuHi0?=
 =?us-ascii?Q?00naq+09j13cqY0VacSjIzqHIEsACN4xw5hsaOIL+iXtGGEE0A5XBQePd4KC?=
 =?us-ascii?Q?Ie3OfI4+QifztNTW60Amw8OjBCToipi0n1IY4zcxNIGWQxf755Y01lHVao1/?=
 =?us-ascii?Q?NbJmJtclJ7qfYsMRGlBjArtSXeku2UwiBrp5GPXAZd3RwCwQ98P+H9yLg3eR?=
 =?us-ascii?Q?odaD91uCekz987RqaA8zMztecBYy/Ilv/MRnQrzxZ3SilwbE49Y8qRiPpoBU?=
 =?us-ascii?Q?SIcqmeIqHwaAzN5itjsPoSiBFKjn4rLTdAzOAAXqJfby/NKiqv0hBjEvbGCh?=
 =?us-ascii?Q?NLs5g9p8amxMuiJ2fzCXZTLTjsp/5hpOnyObR/1/Y0c7BXMef4bkHW/4RRLd?=
 =?us-ascii?Q?2wiOrXbkOUfdm88AIdawedAV9opi4KufRnA7nLgI43nQ0/1qG2OO/arNdSTL?=
 =?us-ascii?Q?Neh71J8AVS+6G39cHuiKmP2SVh2rWe3fRyY7w+JrwlyWeko4f6pWeiceDhLb?=
 =?us-ascii?Q?jS0JK0kOVe8RPb3wEwUxheYFkyQ64zoPPi6YHem6wmiWGRlOL7sBWoQeH/pM?=
 =?us-ascii?Q?XVMpfLnKgHwp59kqWnAI3SDNZk5roi87ZrV22ql8V/V2V8GGJCa/z6syP0+2?=
 =?us-ascii?Q?sqOxasBNP8tnmKwPpS3D5O/PYxaR8Guy4wOY3X8T2ymLcX9+6wX6J0h1zgUH?=
 =?us-ascii?Q?RlYTNWx1MuKx5zgh4nlN1uOHE/hWWSZWGj6vANW4rh8pz5LGiWjK3Oo+wMJb?=
 =?us-ascii?Q?vbuaZ1Ik01IWDKChpvp1dDxETnMGDrERd6JP3SaGwXvQaIzwEXTh5vF4u2Uo?=
 =?us-ascii?Q?ZquEupWWSWEijXDpz/AFCsmsmY5M/DVryCbrmsN4oOv49lhIbLxs8FWnMjZJ?=
 =?us-ascii?Q?gR/pFV5SEkRthtDGfvRBBXNp7l3xmAUirankxomrqk63yqmCygkAT5f8y9LI?=
 =?us-ascii?Q?0khNl7ZZ0MUl9WE/vE+byFLYkmwpuJQ21ScXg6ikzbNPrudiRC6oklAZPfRd?=
 =?us-ascii?Q?Nufo+bRe1UX1nNsHcyL6UbuFPsXByJ+SrB7YckH7ap9Bg4oxESpx9UFsXJuS?=
 =?us-ascii?Q?eEe1KcveH6N67Hb1KYe/zizxNhG5slOBU5GtHfr+Lm5fC7exM+Mhi+4vVO7y?=
 =?us-ascii?Q?SspPERR+/IwB4TceomLlZHKxan227J9ABvA1K455Q7FyIxVelcC39K69pH/B?=
 =?us-ascii?Q?qHhOw6BVZ5UYFNe+L4N+td2XnVVKnWVkOlATwGo2Hwxeyvfv6UYUZPylpiXD?=
 =?us-ascii?Q?igEXuZLkjJQzsNAqGbDErPF2Ft/6Ox5F6V1wcnC3CWfDYyIcxYSTAOK1tlD3?=
 =?us-ascii?Q?RRsGpJzZne5hKcrqAxSaY1aRegfE18ieIfylYBbbiiHrvy/Mm+e3GfRRX5on?=
 =?us-ascii?Q?wr9bk+OYGxur4fxFY0YmxiA3mzAcAPkq7/mKvxHTjo4d7F9u8vzN2B2+ssoP?=
 =?us-ascii?Q?GBXproPocC9VZIya6ebDYBOqylDnHjr90li5lVkK/pDIlKGrIqnl?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52db34b1-18e0-431f-a4a4-08de41605f73
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:45:31.0495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38gQgGNZ9VhgUu1rrkHSE4d2wiyDcS9J+42Xm18exunulmhICpSsQN4DWdQ7A/EWgWHjSQzh45qzFAtWvztV+cPr5+QRZ25V0ApLxuY7V20uR4Gk55RtF+1cK4L84Udx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

Document USB2.0 phy bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2.0 phy is functionally identical to the one found
on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,usb2-phy-r9a09g057" will be used as a fallback compatible for
this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes

v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 448da30757f2..9740e5b335f9 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -41,7 +41,9 @@ properties:
           - const: renesas,rzg2l-usb2-phy
 
       - items:
-          - const: renesas,usb2-phy-r9a09g056 # RZ/V2N
+          - enum:
+              - renesas,usb2-phy-r9a09g047 # RZ/G3E
+              - renesas,usb2-phy-r9a09g056 # RZ/V2N
           - const: renesas,usb2-phy-r9a09g057
 
       - const: renesas,usb2-phy-r9a09g077 # RZ/T2H
-- 
2.43.0


