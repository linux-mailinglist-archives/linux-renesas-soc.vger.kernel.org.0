Return-Path: <linux-renesas-soc+bounces-31896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAWFAjEv92kwdQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 13:19:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EFD4B53B6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 13:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F86B3018285
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 11:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7A4317145;
	Sun,  3 May 2026 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="KRh7WyWD";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="KRh7WyWD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021113.outbound.protection.outlook.com [40.107.130.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13A223DEA;
	Sun,  3 May 2026 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.113
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777807114; cv=fail; b=Z+NNLpVWsdgP1xIwBll0Mlys4H3SbCmMFdzQLImhoW+yN5KYNzGhlduG8lKCcHJE/mziawxoW2lMalZqNOUurlfdRvc8zyiF3+mUXwfOh1a/o7bgGlhGqoAAt1LEXBPgFAbSBLpUe0ILDUDzqNg6ABuH5buSoLc89STv0ZGQBvc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777807114; c=relaxed/simple;
	bh=ZTWCGEQ4MBqHZrARI4LYuZIvEf4Smlyj1OSton+MgOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EQ9PllPM3shAIsyjTgd/07jwfHaeqM2pK/cr441C5MI6B0r+QeCYmYZoh7tSS8bSXr1x4MDAv8tSl+ca5Le7hojRZ/QZWX0nO0IoVniYbCQhD0+3mKAFUYSpHb/U/6Mg0dBsM0ks5ldcNMsGs0gIoq+1rRt6Rj6FPZQCTIhGKNA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=KRh7WyWD; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=KRh7WyWD; arc=fail smtp.client-ip=40.107.130.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tYBR0RFmHAuidQZ6bpVLD8ttSnN83m8gwMregUmTr6o/2ytSsmY995Z4aRZI4YyBV327KMkqRxreSIGpM8l662oORD2oVbJxXQgm+DC2MT1i0zylXYExUnqvLdzagoEk3g4GpYD2hv/tjP6Uo29OtRjmk9wA1KXj3kRZzV6DfbOnh0iz8lXSCrk9wxrO8iI5eY7Nc3AehiY4D2akR6SGLq53dPTKVcJhOr/ovcn/brbxDnePE480xXmcmv3T7G0pSCJXxfpunb8lvScdBJ4RYzHxBNpuqQvWvXoCzkoc5ypI/7tJQtQb0EHpZomfRsqPqTNnWqL8jAe1FTZpAJAy6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPnjL9r9KWhQINNUJx4Zq9IKw360S1pzfQaoXn8nyaA=;
 b=WYxYzDITcxJrZUEn20qkUCj11pt3RNKG7WhiKYz+y5/2jy4pxfi8EKJZsS0JiYHrMvbLg12n4BYv1rqmDP5gpIkyo8S2LGts+MoY5dcp+mHIvv5IzqWWO9KWB4/5Py92WmJqi3Jk1vDuwF6EMKDWAA16zSR/hVHasUaRBJ1bE7Xgifz+2ez1jGBoSGwK6jRgVSM6xuCZhZQkiRon7qwue/cN/rwDtDDZNvO4737kqHrHkt0iLhmF5NnxSogps5QvzyxBVxHfMK6CvvgL2lVnu06vDIUsNSceCntLFzjErDcHHMGbvbHH9TBnvGbZvz5AfcXvL2f98mkizk2r17Q2YA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPnjL9r9KWhQINNUJx4Zq9IKw360S1pzfQaoXn8nyaA=;
 b=KRh7WyWD+Hhj0tqIkPiXCW5I6oNlO/rVJc/sWFjGcMBF7GGlI3vnTQ6axjVe3097IIthMd4PJvNFCLoQriFDpy2PpGcPAC+OGs1k+VUeTWTlUkNOVgi2CJWMC2EmskmadPwwb1faWo6uUdEym16b643xKS7bivEfQ6LPZEd/Yrd3P7YtNOvkj81jIngNyhMWU3TpSv4hhd9Z0tf+epEJ0v6emP2OtAeY4dCO69ByTtNl3GPgapWIzBIe2ndKtoX5Lh1I2dLGuy3v5t+ubdsJ7Em8bbuD9CuOqTivexyBFPBCqUuk9hymf1Y7XlTM+flsYrvtWKzZkK1bMa6XH2nydA==
Received: from DU2PR04CA0066.eurprd04.prod.outlook.com (2603:10a6:10:232::11)
 by VI2PR04MB10165.eurprd04.prod.outlook.com (2603:10a6:800:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 11:18:27 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::8f) by DU2PR04CA0066.outlook.office365.com
 (2603:10a6:10:232::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Sun,
 3 May 2026 11:18:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9 via
 Frontend Transport; Sun, 3 May 2026 11:18:26 +0000
Received: from emails-1631525-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-105.eu-west-1.compute.internal [10.20.6.105])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1CEB87FD17;
	Sun,  3 May 2026 11:18:26 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May  3 11:18:16 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4sg/Q4IyMDq08rV5zkYSwPaLmlxeFAzXsHOQ17u8Kwi8rYnqadwpIAKbi+yScYlcwlxNCiIL27zjMyqnkslps++hqMSZISRCXg0pShBKd6SMoiIWR3dnxYLihW7ZoOO6l1hJgboMqbhnKXnm3GazO2M8vnqGXoNdyw/+USfFwzH48epbN/TKbxotPBuBHETkzeJmZIdG6Qrk5UwvndnBcxpSjrKLJTJUEyGVwMNMXaVJW20jFm3ax9dUCX81L0HtmkiFLw7mcM/sqsc/DuFmqVBlUw3uVk2PQGMr/PYV9TrDHX6FeyGgTnxanzIm5SNQ3rVreSZcT/HVp0PKZaJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPnjL9r9KWhQINNUJx4Zq9IKw360S1pzfQaoXn8nyaA=;
 b=T/8xehGteoDqL97VhtBs/SAivveVyehdT86C9CJsoo76iTBjRCHwfDbO9rhOfHHI9oojG1cW/m5jnfSi6asPWKoi6oyk56pnhG/F8xyLna9zKquOoAU4NqNJO8B09sMqH0oqlsZuF8pxyczzb64zA+3uUTOtkZgE5nkXecMi5TDqrS0J2nixscZaDZCE92DKQTJrm92tFaaXtfxpuX90BJdd4Za1/w8Ko7u1SxGyJu4xVNJJ9pA7n5km9LcqA9j1H4GBT/+BGIAcZKj8zgszyOtxZOG/lKqdOmagBJMTPhMHvfTMkFazQbNzPb6Ui4eV4K09imWGjVTPBPqV1mocbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPnjL9r9KWhQINNUJx4Zq9IKw360S1pzfQaoXn8nyaA=;
 b=KRh7WyWD+Hhj0tqIkPiXCW5I6oNlO/rVJc/sWFjGcMBF7GGlI3vnTQ6axjVe3097IIthMd4PJvNFCLoQriFDpy2PpGcPAC+OGs1k+VUeTWTlUkNOVgi2CJWMC2EmskmadPwwb1faWo6uUdEym16b643xKS7bivEfQ6LPZEd/Yrd3P7YtNOvkj81jIngNyhMWU3TpSv4hhd9Z0tf+epEJ0v6emP2OtAeY4dCO69ByTtNl3GPgapWIzBIe2ndKtoX5Lh1I2dLGuy3v5t+ubdsJ7Em8bbuD9CuOqTivexyBFPBCqUuk9hymf1Y7XlTM+flsYrvtWKzZkK1bMa6XH2nydA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AS8PR04MB8022.eurprd04.prod.outlook.com
 (2603:10a6:20b:28a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 11:18:11 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%2]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 11:18:10 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 03 May 2026 13:18:00 +0200
Subject: [PATCH 3/4] arm64: dts: renesas: add support for solidrun rzv2l
 som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-rzg2-sr-boards-v1-3-8545677f93ca@solid-run.com>
References: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
In-Reply-To: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::9) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|AS8PR04MB8022:EE_|DU2PEPF0001E9C4:EE_|VI2PR04MB10165:EE_
X-MS-Office365-Filtering-Correlation-Id: 17648615-2f43-4cf9-3afe-08dea905b22a
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 YBTq9sh+o0C/9U4D90qH8RyYei1o55OCePJDM7FTi063E1jAo4hLlVe6D4In0sR0RviWQHqBGwB5PtySTaDLv3sHNriWyIYe33Z2r605kAnAOI91oz/5QMbLPmen4DB0mgz7TgDz+DwnvXeGVma/3uuJ6Q37g7OJvOojhtckSO4R+3H+MKJOx+LuLPcVOajIhOkM9M9abxpSZ3o7j6hRk1YhTI1JrdFzen43YcMol1arlgGXMEXYRIAZVQ17CVZFviyjUZAQ+EdEygSF099R+4s78uswusWVYQQnEIs3h4n+i+jf+BLGH05tqXoUb3e2vrRASCo3vQo56LGrusyI5gZGcRGXFHVP3LOkMyY4rrIWIeszalutnlFvUvffF5HautmbjiH0KbU+DklM01wBcnud4gbOOZGMGRaoIDePX5QBwsSEv1hXZFL+zPgMMWJ0Dj98xe2TOum3jZBts+p5uB0EuoHtH5uyaD71qXdpEWnZSiMa0PG+REacrhoo4Wi7vYMEhk83xWOizRa9Iz4N5+c6EjlbLvWP5jIzaj3tZHzPlyLARhO2wgWgoFpD9NL0xvs4KsR/PDarAsNEF+KGi0nbCiDTmAog1GI3qFSKLxsdSd6axX08uYyZnJ/nr6M96EiCGE1XiVM3NjU67BQxfXdX+0rL7Lgw7aSkiZlSiZbZEo6s7ydw3c4MqxTSejMV23+OR4aGSbrbhCryv/KcAvKSeTpXj27eDivb9DVmNRNmaKRDl31eToYQ6Dx2CRFf
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 kYA+OXfpZwvGrQuHvGGuffpN7zZVSdwm+nZ5HJn3j+AfseSTSt4haezIsXUoTBWfm9Syl9dkZs3CfHhbqfCfyi0R2ZNae71k+l35t2EF8XWRue1Fqo/0xxEvJXwMv1zzcwZNCXuEvfgOvw4SRcnyXXTZoYSy2jcaOTG0TTs1OIEYNzUDPHcHK3oDb+WEhVrw1A3P93p744QwSfJSOB4kR9bbLOAOFRSDtZ3NPDlGNZtvsFME5573QHDVTxdv1TH9IbOGDaIvEtvX1DjREQ5i6/HV04q7uCk5EYwSi+/iVIREqLsgcsfum9w1XXI30kKSdyhFoXeJrUrCcN/pI+dOZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8022
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e88f5f8472c746268f961ca1f41c43d6:solidrun,office365_emails,sent,inline:4d3f30dacdf940b3d93398ab685c33cc
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86d3cb77-6951-4eb4-c075-08dea905a8fd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|1800799024|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	N9tyfa06DTPlJQszBwnEwqVIF5EEXbDaGiv4u8BHmfDkBniGQBD3oAZXbffpcIh0qX4vhzx5D6XI+2L1VFY6RfCMVCTw/xOQkaJK3Pnf/mXS5FRZXQH08nS7siJ4d0i2xbkoeaiFWtRTQQbM38/VTziJKbbmfL+LJPW9dval/iMT2RUHlQIofNbzVtZosFjcVESabvdeF9x6E9AOlxacWLzXBEyipyNV2x/4BH4droYnUlMSR/p8L9M3d6LlKTI7mUY5cxttbZaPhCJ9Es2BvKTxd/lVrpRgZAbtb6sLP0dwidADWqW/dvtuv6VuiuEum3b+j6Yzejqrr0ZeusdBeb6nq4SOWHDkZCon2MLGojk6mg6Kobwt+UlFLq+CFVd506MbLlRY2EkfwZ/QNPyhtBgt7M05mBOUseIW0UCr1tWcSxvmMmmgZnYl9ozn+HoLbJ9LOn/IS+UUER1JalyK2cO9hS54GMa4B1F3o5SmQi7A/l0rPvx5tnsfX0IQyV8NqkvNWHVww/vywAS2dUNnNzctEHMM4Z2P2Qa38OiSz83WFSaPZ48SAbLlsws2GSa98rMI6WZvdqXKpCoyfRZw66zxfiuFQ+V5qfni99FOJsjpd23jRLU1V8cqy45wbVD3IIx5HAh+lfXxLZIv5EWXAPtnFEpDGD0udZsW6AVtyqotEPH8GmogvWNMM26uMAhTR2xhcSN041BXrQ9PLu7cGv45oslcn+Aidxcwm9+midw=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	giPtuCplR4pMHvNcpmHT4G21Gf6yHC42yEhXBtr4XO//WzHV6jM6qeJ35XvRkO4XwsY6FIPIJH+o4Dd0G2M2I4Jmut/zJ8jokzVW3T3zXuAfPvHrMOKzlAmItp49rOQnOUMprHcMBlzF5N7UYmjQF7ACDMboSLWltfz5VLkfwka5+769Szavd+sTQdk4mLkVVIk7+RYunWJMmWkgrZGvTg+f4xrPRZLF910Jn7lCWoeEuRUNdM1IOjbB+oXJVILozKfp08t+RQGZDejJb9bOwQQLuoio82sQpmNpjInH6GWgu9SMVgutmL23mEKwgFwCJXqVbWr8uWkbdw8sdWmmBFXNiiyLv7iofQmtJGNAFwzMJAgEADtwLbBVSOF2itlT2HwLBLxF3qxZphsjgoF3TuReGw030a3io4VHPB1+DNC8b1RgNm3itsFL9YRRLWUQ
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 11:18:26.1823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17648615-2f43-4cf9-3afe-08dea905b22a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10165
X-Rspamd-Queue-Id: A6EFD4B53B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-31896-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,solid-run.com:email,solid-run.com:dkim,solid-run.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

Add support for the SolidRun RZ/V2L SoM on Hummingboard IIoT.

The SoM features:
- 2x 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 2x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)
- 2x CAN

The RZ-V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
V2L is adding a powerful DRP-AI NPU which G2L lacks.

Due to the similarities most code is shared, including DT overlays for
eMMC, microSD, and RS485.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile                     |  9 +++++++++
 .../boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts   | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 37cfefe66a308..cdf59f3240e27 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -188,6 +188,15 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 r9a07g044l2-smarc-cru-csi-ov5645-dtbs := r9a07g044l2-smarc.dtb r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot.dtb
+r9a07g054l2-hummingboard-emmc-dtbs += r9a07g054l2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-emmc.dtb
+r9a07g054l2-hummingboard-microsd-dtbs += r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-microsd.dtb
+r9a07g054l2-hummingboard-rs485-a-dtbs += r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-rs485-a.dtb
+r9a07g054l2-hummingboard-rs485-b-dtbs += r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtbo
 r9a07g054l2-smarc-cru-csi-ov5645-dtbs := r9a07g054l2-smarc.dtb r9a07g054l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..d77a6ff163bea
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g054l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot.dtsi"
+
+/ {
+	compatible = "solidrun,rzv2l-hummingboard-iiot", "solidrun,rzv2l-sr-som",
+		     "renesas,r9a07g054l2", "renesas,r9a07g054";
+	model = "SolidRun RZ/V2L HummingBoard IIoT";
+};

-- 
2.51.0


