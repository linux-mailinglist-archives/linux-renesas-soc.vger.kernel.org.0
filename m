Return-Path: <linux-renesas-soc+bounces-27622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOWnJFORe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:56:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6CCB286D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7FF7307104E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 16:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACBF3469EE;
	Thu, 29 Jan 2026 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="j+zTp6Lr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD7233ADAF;
	Thu, 29 Jan 2026 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705625; cv=fail; b=rEEnR+Kc8lFLGPmB8iADRIGNnTbLaB9XDkH1WJLTQhGV6Bm81rmUCETTpUCoo7aGhMyKwf7FHSY/3I+bi24Aq2i7CfN3FMP0nBXKYGifWf0dyvp6vmq7OeJ6YD8I0Uy2lPiouLqfoVsvOTwplSTiQc5hf2zb4KAp5+Uune5lt30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705625; c=relaxed/simple;
	bh=ISriG3NUGRauxPlb27qAmb2oRBDFwPfUKrP1XrjUoOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sahO79o5tIseqJiCBW/eumEr6mABPjWF2q/hMUuaov8XiZIj+b8UHZjRm2VgX/ej0vHhOZlLxNEnaPCKB+/YwKsnQjUH4sXeN6YVRd8T7epqL1jzeJgLxWNGdJwpqBIkH/Le8kNYURbF71N99QC1KNE9USGJ0gGu5m8/Sf1qdiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=j+zTp6Lr; arc=fail smtp.client-ip=52.101.228.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cibdvEL9eAX6u1XDrj5gMb1Ebi7hCD3uxA+Io7n0/PbAFpTmLu9R9B3egfdPUy7nHpAon5GIhuLS9BPZsB2WeHGzm36FgstrOJXFB8XyV6mArdzP1tNVwsAKGPKNAsI6xOF4K+r4gTSDUir4X67FzI5rkdo1+z2f332/Jk7FkE+S+JkFxHOzxZUgD1eyqqVwVP8eZQ+H1tRdNESu8Yl7E8Sn+42OxbAxi7ZYbxM8WsFqyWwVLpWq9gkrbj+PF+v/arwl4fhE792xAeYREbPSroC6S2bE1yGk7wJG1PolyuYiTJeDkivRTX+mBqdgJDb9JDa6NPrJRk24P8p8saOjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1ZW09GpMQaQ90fV9QJraBUnG6JldDmSBzRpTZR0Dak=;
 b=MtP/cKappX1BxnraFg2o2G9DaK4Xf7+W36vjEgqCxwO/x7qxgpmTO7qCSKPSWSEi1JXk/W3EaE27JZUMGLIEO+GXSSR9kWDDuAaio93UVGz1S3EhBY7rRRMfobNlLenpZve13IAM8/wxU9e+3yDRbhfG2gV7uyXs0iphpLMDJjwO2W6bWkaUxGH7f38gGhS533GsvR76JmmWrR5U9ZQLnpRm9YcbE2TP4NdvBrbAa56Sr0P4M5eEAUupNiNaAG6aau3rw8PFUtDPENtu283YpYVV7NxKNSOIDnqCU41f+kM/TfnIyxT1Y2MWQHSEGgz22aa6p1Qs7JzkZDJh/HgSGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1ZW09GpMQaQ90fV9QJraBUnG6JldDmSBzRpTZR0Dak=;
 b=j+zTp6Lrm0s+C0aCAzuJGueTDoyxtcpPKP8Hihq0IELR5TbBejlU0vD+mmY7y8FNeBGn3eab3S7Rw9oj8LFByUD6EE11RKH00stwlKBKmvEDjxr5LO4RP8TpEUB0VyWifc2oVjjB2USPCBf+edzhI3UYKD2o8zMMe6i5PjEmLL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13517.jpnprd01.prod.outlook.com (2603:1096:604:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:53:41 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 16:53:41 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v7 3/4] reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device lifetime
Date: Thu, 29 Jan 2026 17:52:57 +0100
Message-ID: <e60b88432d010c83989e2a37ca548ccf9f746514.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13517:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c35557-b03d-4462-2e07-08de5f56f489
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KDOJMUtN/Hmg+PiEeoNj/F2NCMKUs587R9UsA9yG8EUbAiRUbjTXCWA2sJtF?=
 =?us-ascii?Q?ZNpFrJ8+1OhNiPoXvJ2KXX47P28wsmrQIxm0XEgkuFmVBJ/Cpjl6nEkiXqSt?=
 =?us-ascii?Q?kQKNxKU7jyHuWLS5rvlpzgKrgfO7aXEaWIlROQvr1GM57oeauHibgTEZXeBf?=
 =?us-ascii?Q?raYLwDlItTYhoHU3wTJP14dQ0OtimyYKVBolQYdNzh4dT7O2Qx0OmpIOlJmk?=
 =?us-ascii?Q?W/LB7kV1SzjPpk5gz9LOf70HZ9Rdky0Vt1na3FzYFhGg5yR638xVP1A8njks?=
 =?us-ascii?Q?7ONiyrrsIdAoBEUc2AX3SD4rJON4JcdLo75VZIArexo3BAYyWBusimav7qiG?=
 =?us-ascii?Q?12O98MtyEyzC4SKTBQVMYPy1pLiZJkpGzyr+YLX5WYARbSbw/BTG/dNUTW+c?=
 =?us-ascii?Q?/Il9yISW80J1/lQZxIfkWTFmeV4eDvy+g3xAkTPfP79Geqt7EsmLcZM08mBR?=
 =?us-ascii?Q?z5fToXEX+R0Aav+ea3DTaYBjrPURIO7llIvHkVmfSx2GflWSAbjK6tgqfOoi?=
 =?us-ascii?Q?0DANXkztlkl7v8Cjy+uTXqOAX3ycMITdVfQqhKQIHrgcUQow6sKlRwSSohuN?=
 =?us-ascii?Q?KFL0hu1fjz+rMKv65mutt2/AVKQvSVVYuC+Ca1QAff+kAFTuZJBdR+g5La2C?=
 =?us-ascii?Q?1jcvSefCEUcrlQlfz6vJ7FLENkpZHpMAbKDOTLrnHG0FI+ugqU6j+ane1HCe?=
 =?us-ascii?Q?gJFuSmFhrIzwT4fjvfpZxmD1OkzBMa/+xLR92NscTdXWKwj2RW4ubW63qd54?=
 =?us-ascii?Q?7XuSLVatB/1juRI9wYHOlFSR5ghCtIiIJKSNY5Dxaj3SvpfPqDi6CRlzwd+a?=
 =?us-ascii?Q?Fla5KvAxTeCVGUHHFM0gkTQAYaBWDj78owXjZxpXIyD9WNEUNq734tY39FnJ?=
 =?us-ascii?Q?shNBpJiU4dqP8YfS3hx810rQXn8Gvb7jnIO+iDA5Vi4mAPIo/taaEixsTmoj?=
 =?us-ascii?Q?MaXk5EagKxA5notBP8HR1HY1vreKDWR+gSrqpFq4EknOjxW7UD7X1xhoZ+mx?=
 =?us-ascii?Q?eJMQea0p/ArlgjEZDMkXixaRUL/QKajwBnQ/w8/o4ibp95V96BvVEsRQcrhg?=
 =?us-ascii?Q?WCzQHR74FPdkUCyPaIX0Ba14vTvmyNkEPGMbPbWm+jQwlPPzedmQ13gfcEt1?=
 =?us-ascii?Q?GpDvpJ5yfS3b76EDgL2RllU6ZBj/tGY8K5Kv339v4G37O0m+RHTrZjy0XbLC?=
 =?us-ascii?Q?namTHKI2vsylcDdqcCJcW5a+vF2RvEBY/sQzSslKvo+Hz/MaM1K5L8/eP93y?=
 =?us-ascii?Q?UlzXHGzgo39TbGcVav3RQOcwhSpICnS8AQu3M3YrjjNh5jninsT4NH6TfW+Z?=
 =?us-ascii?Q?xopZlIxnVU++AiG7iW8J6TEDf1s6lFqIOX+w6yxKyh9dyrpclbIOoHJ2IHT1?=
 =?us-ascii?Q?fngO0iuVDEyNvN5Y3xzrqT5CkIpnUjxTG3lKBuYUrvW4LXYq/RW0EskWOuJs?=
 =?us-ascii?Q?rCvT71DVShIwuIRcCcSFAsZIH47xlh6GmR6XF5zXlOglA4FIwb4srqo8ZLnH?=
 =?us-ascii?Q?FOn8PzwVW2wD9aRIvIrSzqsSDKo7JND9bF3yJRkvCb+P8nD1UjhpspAATYw/?=
 =?us-ascii?Q?s6fKB+4rxBKQdG7S0AfjPqPs/OgDvkJ7ogBPFBV0LkbufYo0JbaERGOIAX//?=
 =?us-ascii?Q?jpMGX9CmyfX+7NFCyiUYmxc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9mj92PWZlDfHqzSsWxFYFFVaPhkMz731X4J+J9IapjBxNVF73I/oesRzfla6?=
 =?us-ascii?Q?l/yd+40uo1Nlrus/V3UHS5Pt8GiyKg7e/Jvicx+NyrOCs/qpJ8NbuFeXguVl?=
 =?us-ascii?Q?fmwLidoNvAbLDiv1zfVNjPspMwkr/pjcWWS4cr/CukOobqXFhNzouF/hN+EG?=
 =?us-ascii?Q?304LOStsPEyW7Z4z77x2HennFIZsGRoHPkJeb9XTFsJrNGaX7nbcFaq1nKwG?=
 =?us-ascii?Q?xIsDfM/orT6Eis9iEbG5oR/dcyj+v2gUX0E7vKbeQdFZByRzWkoNEZRgoTIL?=
 =?us-ascii?Q?/DNJxy7M1oMgvB2jRj1DvlkHaLmJWoyTUECy1d3ZmMPi1kobAmSTDOUD/m1A?=
 =?us-ascii?Q?lY+ba9RlcHoFshWcXneErBrFHrFPI6fWdxWZTsr58EutxM1Puf8aE/ohlDX+?=
 =?us-ascii?Q?csvoPxowt6yWwYaslDy2v2sE2q+1QKet1//KC3C8nFTnKF7tTOcyffh7I97E?=
 =?us-ascii?Q?ytuqNKmaYM/sGsmKnF3xrB5qQcdkLOwDXJQT+tnZQ5YAB1dkOLbFYYtPxNPy?=
 =?us-ascii?Q?RlczXiaLwfd7H/9aLzF4wx0tl5DNicotwgHVnJ9tPkoNALZCPNwV2QMS8d3q?=
 =?us-ascii?Q?KH49yPuUh0leK6Otb5vXZ4pB8NPAzj6usAvnbKJsFBD3VM2T+fOoyN1pVvp/?=
 =?us-ascii?Q?9ovHRE2duDfbsPhS2rM2utm2c7L2ZcTWxvbgDLXEDlOGTEIFAwspkJMUEbbq?=
 =?us-ascii?Q?5Tm5BV60Lq8WQt34lYPx+X7ijMEN0PnQno0O4oYfgjum0fP0Rl/TNGMTHrZ5?=
 =?us-ascii?Q?4kF+1oCLsxSqGwPfUpcG4wKvF2chwTdL349AEEAK2ilK3oLykUQW3TNnrVtD?=
 =?us-ascii?Q?trYrPCc646G/UX/vzcjv0RCWgUzg6iuZT8f2bTK0nuDwLk12eujlCduppmwn?=
 =?us-ascii?Q?NUquuEeoqQBdWrUD2tL7/UpuKUxtpRAz/M+qygC3I5cjsJBR0XHcz/uI0DjL?=
 =?us-ascii?Q?W64I47tFZ+mNzxrT2epd256Oe5eUTNBhyM0v3NNaNIQbNx5qTgk3PJyYwx/k?=
 =?us-ascii?Q?dfIpx2eUEa1QrS3YaYewp0ViigLivM2R+xpQchAySODjVWhhoi4pDSI6E8Sz?=
 =?us-ascii?Q?fXyD2tS/DxqZR1rYEKk9oy8eHM9xq0IyFYgOpuTof4ygfhghOkJkccrgHFLX?=
 =?us-ascii?Q?jNAR1JbdWADfiR6Z4d7NEd3mCTRB6rvb5QWA9OUpEJ3tt2cGF7K9EGwHnHAT?=
 =?us-ascii?Q?gUIDDySTgl3jJX2h77TN26CMHFb0HiPbKfKvB7lBS0L91+xt1X5GrqKII8a4?=
 =?us-ascii?Q?+tU25XZeRPJq3foSo8NgsGeyq0K1ugTvmxvfV+NifWRc8NrObW7LDCmQqlri?=
 =?us-ascii?Q?aNMDyFcgqHU58PTYKdZki/hL/c7GZQoSYWSrbR4p367xqgLnvEcLr5+ViH+k?=
 =?us-ascii?Q?NDupkVhfCq8C9S9Mk2JHwEr0+pwSiLbDY1VhalfjKLLl6fV1DrqwC2AxQa6A?=
 =?us-ascii?Q?8p1s1j76IAPmpjOiAiZpbY11paFpesTVyxWsy+TJ59r4Vg1kk4RiwpS4u7yc?=
 =?us-ascii?Q?W1DM6TWuKl5g3ApM+DnhG6zsWQGr15sBkdpU81JDCs3CCGlDX5syPvm6I+ge?=
 =?us-ascii?Q?o0N2T1cwqnkiAczhfWy1emdriuc8tb+JWhpVIJPQwu0O02WOuDkTjBTb8gxA?=
 =?us-ascii?Q?yqZU9PosQZqF/65YagqKiKGLCI/506wFm5vRgdPjWdXGzoMAz1AGk7vIwbd7?=
 =?us-ascii?Q?gon6dvGxi4R6fO1CnQzOXmvSu/rVfrZ+uONsCcn1fFNGdlqNXOZzkT7PIAdi?=
 =?us-ascii?Q?f5BvQunYDsVOUtVsp4PXr61BsTfqBge6WwHT+QsrOChY5/kl8bNu?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c35557-b03d-4462-2e07-08de5f56f489
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:53:41.0869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjjcoOG3C7cHcDNNzXuTxr5XrDZss9uOGpPj7PoV7lQsSPRxuifuR3aDFUWXlMnIkI9wvYMlGEjfWUKiBSm89eSxDYt26tWiK4DuUW5PoQTu5BZPGTQ3DHDIugXkkMNg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27622-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,pengutronix.de,kernel.org,glider.be,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: EC6CCB286D
X-Rspamd-Action: no action

The driver was disabling the USB2 PHY clock immediately after register
initialization in probe() and after each reset operation. This left the
PHY unclocked even though it must remain active for USB functionality.

The behavior appeared to work only when another driver
(e.g., USB controller) had already enabled the clock, making operation
unreliable and hardware-dependent. In configurations where this driver
is the sole clock user, USB functionality would fail.

Fix this by:
- Enabling the clock once in probe() via pm_runtime_resume_and_get()
- Removing all pm_runtime_put() calls from assert/deassert/status
- Registering a devm cleanup action to release the clock at removal
- Removed rzv2h_usbphy_assert_helper() and its call in
  rzv2h_usb2phy_reset_probe()

This ensures the PHY clock remains enabled for the entire device lifetime,
preventing instability and aligning with hardware requirements.

Cc: stable@vger.kernel.org
Fixes: e3911d7f865b ("reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - No changes

v5->v6:
 - No changes

v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - Added missing Cc: stable@vger.kernel.org
 - Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().

v1->v2:
 - Improve commit body and commit msg
 - Added Fixes tag
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function

 drivers/reset/reset-rzv2h-usb2phy.c | 64 ++++++++---------------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index ae643575b067..5bdd39274612 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -49,9 +49,10 @@ static inline struct rzv2h_usb2phy_reset_priv
 	return container_of(rcdev, struct rzv2h_usb2phy_reset_priv, rcdev);
 }
 
-/* This function must be called only after pm_runtime_resume_and_get() has been called */
-static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
+static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
 {
+	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
 
 	scoped_guard(spinlock, &priv->lock) {
@@ -60,24 +61,6 @@ static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
 	}
 
 	usleep_range(11, 20);
-}
-
-static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
-				     unsigned long id)
-{
-	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
 
 	return 0;
 }
@@ -87,14 +70,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
 
 	scoped_guard(spinlock, &priv->lock) {
 		writel(data->reset_deassert_val, priv->base + data->reset_reg);
@@ -102,8 +77,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 		writel(data->reset_release_val, priv->base + data->reset_reg);
 	}
 
-	pm_runtime_put(dev);
-
 	return 0;
 }
 
@@ -111,20 +84,10 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
 				     unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
 	u32 reg;
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
 	reg = readl(priv->base + priv->data->reset_reg);
 
-	pm_runtime_put(dev);
-
 	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
 }
 
@@ -141,6 +104,11 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
+{
+	pm_runtime_put(data);
+}
+
 static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 {
 	const struct rzv2h_usb2phy_reset_of_data *data;
@@ -175,14 +143,14 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n");
 
+	error = devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_pm_runtime_put,
+					 dev);
+	if (error)
+		return dev_err_probe(dev, error, "unable to register cleanup action\n");
+
 	for (unsigned int i = 0; i < data->init_val_count; i++)
 		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
 
-	/* keep usb2phy in asserted state */
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
-
 	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
 	priv->rcdev.of_reset_n_cells = 0;
 	priv->rcdev.nr_resets = 1;
@@ -190,7 +158,11 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	priv->rcdev.of_node = dev->of_node;
 	priv->rcdev.dev = dev;
 
-	return devm_reset_controller_register(dev, &priv->rcdev);
+	error = devm_reset_controller_register(dev, &priv->rcdev);
+	if (error)
+		return dev_err_probe(dev, error, "could not register reset controller\n");
+
+	return 0;
 }
 
 /*
-- 
2.43.0


