Return-Path: <linux-renesas-soc+bounces-33885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5xXKFuDKKmphxAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 16:49:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F24672D42
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 16:49:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=VmGuuLfz;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D37843048F0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 14:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9962F1FE3;
	Thu, 11 Jun 2026 14:49:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0131422A4E1;
	Thu, 11 Jun 2026 14:48:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781189341; cv=fail; b=T5pVt3lzMVtVBw5L6imdQmwBXaYB2a6D/Rnr0+3lPZ4S3UU0PGZBqufcspu8HM7RAoIXBOMZNczeedeKurtu2jPfWFoXj5kU+1OpLJ8t/FRyl/pFeDLZhwHiD46rIvHf6mHs1AWIcLB4j4hY5ZF5cSu568YEzGz92B1OhIFGT9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781189341; c=relaxed/simple;
	bh=6QB5fK7Eq3+EaqW74KxBwYT9vqyEkbSHfBDQ/F/gbgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mEC17O3XlZIWRjjMpIzMejcxfXI9YmELGz2a9YTCCj17MSpR612l8f8J6ySAuhdHjxkySmSMzeFNZX5Ro6QLtjNezvlzlAeoplqbWB06QN9kX349xY1tUn4YYxxY48TrCvsnFpH7QKejODGVVcVF8L/stR8aSN52Wi5G9ciXOlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VmGuuLfz; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDZGftFsQA0JOfiAODeUB3fSZ54AwiTDs4YfSa/kfM6/v9r4Y8XhnH/jIL1+Fxc5fvJDvL+AiFcpAa9IurKemtJxF+Gl6csL9fohFUJ/WubD6mu7V1kQBD63kQTbAOo+wMjnJN8lOm+XwPNFdVVqAK2gGZGuSjMVyMfGE/XYHi3eAWD3Ce374xj/Xw6AHUKp93z/q6c6ziUrQ96qdKI2N43HCjylwbT2NprQEzv1ivIPYXm3a1itYQ9bVP+ymAgckuFaGCpAMrayP291Cl+OVmoBFRrDXw/Dk86LJfaZqAVWbM6XfOjhjjlTv81Nh39zAkCcv1HQGaU6+IOS/mnu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRQhlUE1T5hH8Sj9nje8pbFKlftD2U+NsG1PXkQF2Zc=;
 b=T4SfSFIDO2Ikjl5zA2ygibCwlBcabo29F/4pmJQRqIGm86OeY+/AKOllWzLQU0XbJ95LPuXbdfPTrks+q/tQpKwV4aNjI+gw/0K5eB6gxzAOnDNmGr/1BqusB9sjJTEzSm4NOtq/VirRn+kwKo2ba1qMttbkgAp1a0GuPiTNVBrgFHOywHMGaKc68HKOPxBZxGxOgrnrarOR+CtyWjue0XL2ZTFQymSqElpGB+8LaX3zTOHkADSopE7PrOaqoHuzLiGDhYURtPRcEwwfb2Z9zK88WcPSVd5t+uKdD1/txliAGir6RLwXQlhvb8u87TGH3Mwc537ivi9BnawjMOsCtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRQhlUE1T5hH8Sj9nje8pbFKlftD2U+NsG1PXkQF2Zc=;
 b=VmGuuLfzDLzOrQSxhr+pKIWeaJWkGQuvUZP4Z6/cxycrk5GLLDjZWxD5yL+/2uBkjXNIEE5GqPCfITssZHfxaxLCZEYc6b1/WrBmuTJqeFQyH7JSUQWwgM37CINL84oIvCdgc4ChuXj0+NGUN8mlf5rZeFQmbskubck9OSoPO8c=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB17306.jpnprd01.prod.outlook.com (2603:1096:604:450::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 14:48:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 14:48:54 +0000
Date: Thu, 11 Jun 2026 16:48:32 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 14/20] drm: renesas: rz-du: Add RZ/G3E support
Message-ID: <airKwNu_PMrkpHjj@tom-desktop>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <152f19a068fcdf27c063e845fe04a48a46c5b47e.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <abq6ohQW-LPcmXgy@tom-desktop>
 <20260610212234.GA1632628@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610212234.GA1632628@killaraus.ideasonboard.com>
X-ClientProxiedBy: BE1P281CA0246.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB17306:EE_
X-MS-Office365-Filtering-Correlation-Id: d33fad2e-72a5-4b72-4350-08dec7c88f22
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|52116014|11063799006|5023799004|4143699003|22082099003|3023799007|18002099003|56012099006|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info:
 4vsl5KnEGN3OVG+tAjbazo2E7yREfV4XEFdOKLPMh00kSSqOqJlgohtjK+OdgQmIy6CxpsdKFyO89/V5lVIkG45RVNeFsYEhorcK6PK5lB2P8qAL4eWV2weHI+9mYuN5ZsbjPrcZdBLoGPE16SUCQMWlJHokxVpmBNGgVqGaHwbbr2id0RdKOCdT3bjr4ibqj3UcYjKcPYbPrwRz54gi0+gU43nW0ZSJ2GR3AEC1GlYKPWvI8ynbKAHEQDZHqIstHezf583WoXa58IGB0Fv29rRe78yMeCDBD4pn5jsbl0ldXusllgjgWBIhLHmCJj75H7ersfIgziJN31UlbIANWCyCGOmjgD4YUmKfw3RnUQ7ml1dvsW1rf/rq7OM2krxHLHvuzlX2pviBJC2GUtkrTbMgQRKXVLMUgC3hEgt5sZSZm8ww3InDQ1Wxjd6Nk9Vuu7/ImIK2bLsIVmH68nSj8eJ6WeNmHTf3Wg++YJr2ju4ybbhbMk2YsJPNYqzni5uQpbSbXs1Y0mRInN2fzqoTknamq69HTValtQZKDMFs1CtVIcUie20tafBhIcfCaN0P/1QuiEdONlegXPCZ1akekkM8o0DT36g5PgeSP9nIsKuLCcuf8e682je9Uwu71PIKppqnk4M5ehPWS9pb86w9oPVe9m/wu4kJQnh9gaA76s5eUWzCXFWjfUrYkWRjvPHQrNr7FO75lPfQu2pV7BkwzLZ4/WBJDUbzQ/iM6JWRJfZ0O5Y5o4nBJOHma2HJbEoX
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(52116014)(11063799006)(5023799004)(4143699003)(22082099003)(3023799007)(18002099003)(56012099006)(6133799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WEZNOGVLcGpQR0U3T0FUeWUzNmMveFQ1TWx1Qm1RYVN5UjRESW1KNW0yTktk?=
 =?utf-8?B?em5oeEJmbGc3ZzFTcDRDcjdGcUg0cGx2ekNVTUUxdUxZWXF6WDlVRThwZ1VH?=
 =?utf-8?B?dFloZ05jajUrUFlWa2NUTlVKYTlIWWJxNWpzVVZuRll1TlJTajg2RkFpbmdp?=
 =?utf-8?B?UVAyWlNtQ0NkMDdWTDkwMEFsZzMrTW1WMDhGanBvbGtlcUFwWXNZc29Oa3Rk?=
 =?utf-8?B?QkFvYlphV3BPWkRRdUE2OEJYaEtXT3k2b3MrMHFkUFoxNkpyTlNOYzNkeEtN?=
 =?utf-8?B?RXBQZlAvenIvTGM3YUJ1b0RJbXIvQjY1SjVCaVptWTFQNkVGQXYxQlBwZTJv?=
 =?utf-8?B?QnQwdTlSTWdaZ1dFL1VHd1dpbXNnRGJWeitSSCt3TEdMbXpITDhPK3dFdXR3?=
 =?utf-8?B?V3c3MGZIMVdMalNPS0g1QmJQdWpzb3cweWtLVWwvTVd4Z3J0SFYzdnVMaWNi?=
 =?utf-8?B?MUdEK2tCckZPdUx1TjhGaU96WUJpRVNBTHBaekJiK2FtVG5MWTJUUFJsSW9E?=
 =?utf-8?B?dmZCSTJiTm1iQ2FTaFBMZWZmT051M1VTdS92VURiZlZZd2xhSlhyRG1STFZL?=
 =?utf-8?B?aFkwb0I4ZUpuSTA4UGQvb2NWZHpxdHhzQ2huT0szb3B3WkUwV2VOb05LWnQr?=
 =?utf-8?B?NVZTcDhRb3J2aXNudzh5b3J2dGJudlRTSUZIMklsYVhhWUtPcW41b0p3YURX?=
 =?utf-8?B?TkRXRFNlekRpd2dadlVDNXdqaDNuUHQ1OFpZR1BLQ0E0WmVoTmVNbHhic2xh?=
 =?utf-8?B?Z3U2Q21XU1FLeklFSFg3WUxpdTlyd01URzU5ZW9QeE9yUkYxM0NPZHpzNnNx?=
 =?utf-8?B?L2xxbU15L2xsYkdpSThiTnpveHpodHJUd004R3hLNkJOYUdFcmwrcGVTM0t0?=
 =?utf-8?B?cXI0V2RSbXZLekszNHMveWFMbCs1dkJra2VlcVJzbHJDL2ZXVEF4OExmTGQ0?=
 =?utf-8?B?cmcyY1NBTnlwL3NrZ3Zkblc0eXpIR1BsQ1dMQVdWckJlVDRGdmRKa3o1VmtT?=
 =?utf-8?B?R3Q2MllMRWhDbDk2UVo5d0pQRER3dDFMYlVYTytOQWZkZW0xZzRWUU1EWFAw?=
 =?utf-8?B?Sm1za3M4bHE5MUFyV2U5VDQ1a2QrZjErcTlWNmY1RE1HL1AvendKZkJPOHJa?=
 =?utf-8?B?ZnYzNlRRc2c1VzdDNHQybzJZQmNUMVh2MXUzU2N1dzNJQ3BjVUo3SUF3anlv?=
 =?utf-8?B?SEpJTEFIUVd0bGNtZ2V5dFg0TTE3Z2ZobGhmdmRBQ0FpN2hBYkxxOG5kWGtS?=
 =?utf-8?B?RndYbFRtSi9lYXg3RGZQaXIrcWdnQ3greStkbllPYUY4QjhOd3hOSUo3dUhI?=
 =?utf-8?B?dmtvYld4bU9wK3V6ZEZIenhDOERVQXc4UUl1UythWXZLZmlNaHBEdFRzTW8z?=
 =?utf-8?B?OFR3Sjg2cWNYZWVLV3ZmdmIrcVUwcW1KNS9oa0tMVEdlNGFvNDhlUzhoNHY5?=
 =?utf-8?B?ZGkzNmxhMFc4czZjaEVWWWJIUmxhdUkzRG5jRzVMV1ByQ2xmUFNzWUcwVnRu?=
 =?utf-8?B?SHhYQXpBa2hBeG42ZUdQd1NEN3c2RkZMVlRDeFVTWGorUkhCU2VLeW9OV0l6?=
 =?utf-8?B?QkpkVStsbkY4TWt1cVpuTzNlKzZSdlhLdVkwZ2hGVTJpNjh3TXVlbnFxZEcz?=
 =?utf-8?B?YTI1YjBsbkluN2ZtTU0wa3dNYW92TnpzTUlyTTNlSEdrV1ZiQklibUo3bzBo?=
 =?utf-8?B?L3M0dlFoRUVjeFY3RXlFb21UVGw1Z2kxdmsySzBCQ1d6dG56QitDRktWSFY1?=
 =?utf-8?B?L1lRRHgxSnl2R3VKZXR2R2ljVG4xdG9kTjlrdzJFbDNJelhRbDloTHJJUmhR?=
 =?utf-8?B?aEZWMGxWTGlnL0xxN3BER1g3OWZ0aTZhaG9ra1RpdW1HOWJaaElhNk8vK3dt?=
 =?utf-8?B?N3M1SmJIWGZKNWJBQWlXalg5eEt0WXlBWVdIVHdOMG56cHpqdjFpdU9rRXpx?=
 =?utf-8?B?cXROU2pST3kyUEpaamRCa29nRHFMdmNyS1lFSXBlY3VoMUM2Nm9GNnRtZlUz?=
 =?utf-8?B?UzdmeTJ3NnI4R0NGRFJkVm5ERzhmZFJYWTRRSzI1WnVDcGpUdWUrcW9URUhz?=
 =?utf-8?B?SHltakNPZjhnMThwZ0xYQ001cXZPM245MjYrKzJXKy91S2xQZWNuWjZHZE8z?=
 =?utf-8?B?cmI0VkFNV3hhL3QvaEpVZGRmelZQcUJrVFdMWlM5QWs0dDYzM0RISFNSNXp6?=
 =?utf-8?B?bjcreUZHTXNpSGdHTGV3TzZqL2kxYm0xQ2sxTDA5ZnoyekV3MTZzYkV0L2dr?=
 =?utf-8?B?QnllSGtjVkkrSkljd0FpdGJpajZTN05ZVXcyc1lmTS84bFVjWVVyNzRWaVZv?=
 =?utf-8?B?U1pydmc5KzVCQkJnQm95cEVVNFQzU1pxdEtXMUJRSVMxSXU1bXhOaEdiTmcy?=
 =?utf-8?Q?ZRVbZUOHgbo2XLQYmJMr1wtwxaxZQScc37kGD?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33fad2e-72a5-4b72-4350-08dec7c88f22
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:48:54.4969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Tq+4p8ddMnbxZcmZ/ln9aKmBSdR25Q4NqqOtRV4smi7561aES6ma8p/0NYZyvqoOWClTPxlG/YXxBsKLquclOyJDa4LyxdcqjltCJ2tEWDL09+kAf9mnMzOcpNwrk4x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17306
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33885-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5F24672D42

Hi Laurent,
Thanks for your review.


On Thu, Jun 11, 2026 at 12:22:34AM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> On Wed, Mar 18, 2026 at 03:45:54PM +0100, Tommaso Merciai wrote:
> > On Fri, Feb 13, 2026 at 05:27:40PM +0100, Tommaso Merciai wrote:
> > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> > > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > > Processor (VSPD), and Display Unit (DU).
> > > 
> > > LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > > LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > > 
> > > Depending on the selected output, the correct SMUX2 clock parent must be
> > > chosen based on the requested duty cycle:
> > > 
> > >  - Index 0 for LVDS -> CDIV7_DSIx_CLK (DUTY H/L=4/3, 4/7 duty cycle)
> > >  - Index 1 for DSI/DPAD -> CSDIV_2to16_PLLDSIx (symmetric 50% duty cycle)
> > > 
> > > To support this behavior, introduce the `RZG2L_DU_FEATURE_SMUX2_DSI_CLK`
> > > feature flag and extend the `rzg2l_du_device_info` structure to include a
> > > features field. Also, add a new helper function `rzg2l_du_has()` to check
> > > for feature flags.
> > > 
> > > Add support for the RZ/G3E SoC by introducing:
> > >  - `rzg2l_du_r9a09g047_du_info` structure
> > >  - The `renesas,r9a09g047-du` compatible string
> > > 
> > > Additionally, introduce the missing output definitions
> > > `RZG2L_DU_OUTPUT_LVDS{0,1}`.
> > > 
> > > Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from
> > > the CRTC output to the DU outputs.
> > > 
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > v4->v5:
> > >  - Fixed RG2L_DU_FEATURE_SMUX2_DSI_CLK to RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
> > >    update commit body accordingly.
> > >  - Added features field documentation.
> > > 
> > > v3->v4:
> > >  - No changes.
> > > 
> > > v2->v3:
> > >  - No changes.
> > > 
> > > v1->v2:
> > >  - Instead of using clk-provider API to select the right parent clock,
> > >    based on the outputs. Just set the correct duty cycle based on the
> > >    output, this reflects at CPG lvl to select the right parent.
> > >  - Updated commit message accordingly.
> > > 
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 48 +++++++++++++++++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 26 ++++++++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 12 +++++
> > >  3 files changed, 86 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > index 6e7aac6219be..cc35dd409e3e 100644
> > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > @@ -64,11 +64,32 @@
> > >  static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)
> > >  {
> > >  	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
> > > +	struct rzg2l_du_crtc_state *rstate =
> > > +		to_rzg2l_crtc_state(rcrtc->crtc.state);
> > >  	unsigned long mode_clock = mode->clock * 1000;
> > >  	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
> > >  	struct rzg2l_du_device *rcdu = rcrtc->dev;
> > >  
> > >  	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
> > > +
> > > +	if (rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
> > > +		struct clk *clk_parent;
> > > +
> > > +		clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
> > > +
> > > +		/*
> > > +		 * Request appropriate duty cycle to let clock driver select
> > > +		 * the correct parent:
> > > +		 * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=4/3, 4/7 duty cycle.
> > > +		 * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50% duty cycle.
> > > +		 */
> > > +		if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS0) ||
> > > +		    rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS1))
> > > +			clk_set_duty_cycle(clk_parent, 4, 7);
> > > +		else
> > > +			clk_set_duty_cycle(clk_parent, 1, 2);
> > > +	}
> > > +
> > 
> > I’d appreciate any feedback/suggestions regarding this.
> > Thank you in advance for your time.
> 
> Sorry for the very late reply.

No worries, thanks for your time.

> 
> I've taken time to analyse the clock tree, and I think the way you model
> it makes sense. As the SMUX2_DSI[01]_CLK clocks are used by the LCD,
> LVDS and DSI blocks, I may have selected the duty cycle in the LVDS and
> DSI drivers personally. I wonder if it would lead to simpler code (you
> wouldn't need to implement rzg2l_du_crtc_atomic_check()) here for
> instance. In any case, it does not affect the DT bindings, so it could
> be changed later too.

Agreed, we can change this later.

> 
> Do you need further feedback on this ?

Right now the bottleneck of the series is the DT bindings design [1].
As discussed in our previous conversation, I've provided a clear explanation
of why we are using a single-DU DT design in [1]; let me know if I'm missing
something. Thanks.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/ff8e401a0667970a42a55420dcb071e34730a923.1778141145.git.tommaso.merciai.xr@bp.renesas.com/

Kind Regards,
Tommaso

> 
> > FYI this commit is related to [0]
> > 
> > [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com/
> > 
> > Kind Regards,
> > Tommaso
> > 
> > >  	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
> > >  
> > >  	ditr0 = (DU_DITR0_DEMD_HIGH
> > > @@ -248,6 +269,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
> > >   * CRTC Functions
> > >   */
> > >  
> > > +static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
> > > +				      struct drm_atomic_state *state)
> > > +{
> > > +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
> > > +									  crtc);
> > > +	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(crtc_state);
> > > +	struct drm_encoder *encoder;
> > > +
> > > +	/* Store the routes from the CRTC output to the DU outputs. */
> > > +	rstate->outputs = 0;
> > > +
> > > +	drm_for_each_encoder_mask(encoder, crtc->dev,
> > > +				  crtc_state->encoder_mask) {
> > > +		struct rzg2l_du_encoder *renc;
> > > +
> > > +		/* Skip the writeback encoder. */
> > > +		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
> > > +			continue;
> > > +
> > > +		renc = to_rzg2l_encoder(encoder);
> > > +		rstate->outputs |= BIT(renc->output);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
> > >  					struct drm_atomic_state *state)
> > >  {
> > > @@ -296,6 +343,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
> > >  }
> > >  
> > >  static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
> > > +	.atomic_check = rzg2l_du_crtc_atomic_check,
> > >  	.atomic_flush = rzg2l_du_crtc_atomic_flush,
> > >  	.atomic_enable = rzg2l_du_crtc_atomic_enable,
> > >  	.atomic_disable = rzg2l_du_crtc_atomic_disable,
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > index 0fef33a5a089..3c20471fdbea 100644
> > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > @@ -51,6 +51,29 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
> > >  	}
> > >  };
> > >  
> > > +static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du_info = {
> > > +	.features = RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
> > > +	.channels_mask = BIT(0),
> > > +	.routes = {
> > > +		[RZG2L_DU_OUTPUT_DSI0] = {
> > > +			.possible_outputs = BIT(0),
> > > +			.port = 0,
> > > +		},
> > > +		[RZG2L_DU_OUTPUT_LVDS0] = {
> > > +			.possible_outputs = BIT(0),
> > > +			.port = 1,
> > > +		},
> > > +		[RZG2L_DU_OUTPUT_LVDS1] = {
> > > +			.possible_outputs = BIT(0),
> > > +			.port = 2,
> > > +		},
> > > +		[RZG2L_DU_OUTPUT_DPAD0] = {
> > > +			.possible_outputs = BIT(0),
> > > +			.port = 3,
> > > +		},
> > > +	},
> > > +};
> > > +
> > >  static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
> > >  	.channels_mask = BIT(0),
> > >  	.routes = {
> > > @@ -64,6 +87,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
> > >  static const struct of_device_id rzg2l_du_of_table[] = {
> > >  	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
> > >  	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
> > > +	{ .compatible = "renesas,r9a09g047-du", .data = &rzg2l_du_r9a09g047_du_info },
> > >  	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
> > >  	{ /* sentinel */ }
> > >  };
> > > @@ -74,6 +98,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
> > >  {
> > >  	static const char * const names[] = {
> > >  		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
> > > +		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0",
> > > +		[RZG2L_DU_OUTPUT_LVDS1] = "LVDS1",
> > >  		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
> > >  	};
> > >  
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > index 58806c2a8f2b..480a7bdfcd66 100644
> > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > @@ -20,8 +20,12 @@
> > >  struct device;
> > >  struct drm_property;
> > >  
> > > +#define RZG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(0)	/* Per output mux */
> > > +
> > >  enum rzg2l_du_output {
> > >  	RZG2L_DU_OUTPUT_DSI0,
> > > +	RZG2L_DU_OUTPUT_LVDS0,
> > > +	RZG2L_DU_OUTPUT_LVDS1,
> > >  	RZG2L_DU_OUTPUT_DPAD0,
> > >  	RZG2L_DU_OUTPUT_MAX,
> > >  };
> > > @@ -42,10 +46,12 @@ struct rzg2l_du_output_routing {
> > >  
> > >  /*
> > >   * struct rzg2l_du_device_info - DU model-specific information
> > > + * @features: device features (RZG2L_DU_FEATURE_*)
> > >   * @channels_mask: bit mask of available DU channels
> > >   * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
> > >   */
> > >  struct rzg2l_du_device_info {
> > > +	unsigned int features;
> > >  	unsigned int channels_mask;
> > >  	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
> > >  };
> > > @@ -73,6 +79,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
> > >  	return container_of(dev, struct rzg2l_du_device, ddev);
> > >  }
> > >  
> > > +static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
> > > +				unsigned int feature)
> > > +{
> > > +	return rcdu->info->features & feature;
> > > +}
> > > +
> > >  const char *rzg2l_du_output_name(enum rzg2l_du_output output);
> > >  
> > >  #endif /* __RZG2L_DU_DRV_H__ */
> 
> -- 
> Regards,
> 
> Laurent Pinchart

