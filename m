Return-Path: <linux-renesas-soc+bounces-21204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3DDB406AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 16:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9BA348783D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 14:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD5A30C37C;
	Tue,  2 Sep 2025 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XW6bOr9V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5E930C342;
	Tue,  2 Sep 2025 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756823175; cv=fail; b=GqbJSzHHcknC1RL/ma9bdLhu360FhNb1k+rmzVbVh03WbfSVefKOCGvJapLidCUT1P5i+9JKFhOAm9tu9TTMfmfZpq3ZYB5wnXFg6h19iCrfb3eexN/EWT+0WbEq5HvC8d5gutfEJv1Sekn+V4tGFFQTiu2yxMhAVrNb3c9Vo6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756823175; c=relaxed/simple;
	bh=jxqeaoGKspqGb60EtwGc8CPxKp9g9V2xvLn4RklNpkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o8oOaqp29VynIWSG/vEoMhErZe85ocJ9AvV11IqNnxx3qkokhh35UuVh/QqbGAH5KOBGY6YE9EU3kBsO7DofidymlCisKjURgmR1RkIcQn36+I2Lhu96WEh3tl2cesuyijhWTa8QPVqOpkSBcAuWmSFt/Df63BwEuOKocBsvFJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XW6bOr9V; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIBnJgjL97+I6cMPOiE8fzWYHWIbxqJHPI8Bb/w3luYLRHfjpO8ZTJPATnHSPrdce7q0VZJqaYSqwVAzSm4OWZCMHHOV3uo3qxqCbmCipXN622QfJDRhiTNgUdcR1aV9M7nelskDzCm1/YcKi+2CIMBOXt9W/p69rcaBpvCy4eGxJnWh6czR4hArVr6gwZrKNG7Z7bHypCZe6aIjJdcxikLZWiE1Ypzebi3hXtRmuIlBHOkFWc0uzSoJKaWz2h1pYBDz4x/GA0wyTA2vIFSeFLidzOJqKM8bdQwtL0WQasXa804Kh4cBSe1oTFGeUbursmz2i3ER8CvZg71XTnmtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1OqQFrTy9OKSppebeTQ2XfbqPSrANGEOkartK0LUsE=;
 b=L86IidQXHg5jOXQ6Cj5oq325s/sfKg1/8QdTd4+gNX+UUkxHU8AGmxgsDYDD4ilZVyz+vFNU+voWaOqndWJFRNeHV6zOx/ep0wNvShQ03ZXba3yiXz2ONEdUiT7rBgDv4hr2jYDnIrZ59s3p4WBl68zIeZKwCG/mtwdWHjHJnThA0P3CK85hDTTulP/nQr0clPr+IHIK0gOczAY3YR3z/mCQnK84qEv4PssERj9r9gmJxVLgxtLSU9BShUXaHsHvBQyJwSq6uLlV3+dUmCuImXP4+cSfkld7sn6UZKT2cCFtbbDGaewy+ExwThs7vUdPltPEmH0bN3wddGH5hC9qVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1OqQFrTy9OKSppebeTQ2XfbqPSrANGEOkartK0LUsE=;
 b=XW6bOr9VKIJ7hJF4wFCJ8Jih2D2/FwoMcr6B61NMSkwmsUkElNd3WfilgEM/dhjScZVVwADVl3L0XavPt/ncUWDIFVzJJVQ3zC+fyrxRJmQceuCElSrk52pwYQ8FHB5g3JrF/9TlD4qOkYvNqteVHRoAjUE/gegxEiq3vyNZzGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14065.jpnprd01.prod.outlook.com (2603:1096:604:361::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 14:26:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 14:26:09 +0000
Date: Tue, 2 Sep 2025 16:25:56 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: renesas: rzg2l: Re-assert reset on deassert
 timeout
Message-ID: <aLb-dAiVgFk1LsXR@tom-desktop>
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
 <20250820100428.233913-3-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdU_grYXJF_L77-6np9iiVGvo52Z7TXN=ft97BuPX2BGxQ@mail.gmail.com>
 <aLb2Zh3ENS6B_ik4@tom-desktop>
 <CAMuHMdXUm4c0RSQ=pOz9dC7cuHA2STJaQ_d4ded9-rw3orcyGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXUm4c0RSQ=pOz9dC7cuHA2STJaQ_d4ded9-rw3orcyGA@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB14065:EE_
X-MS-Office365-Filtering-Correlation-Id: ae39e0e9-2750-4231-54e7-08ddea2ca903
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEVibkV0NjY3TXQvcnJhYzN6Q3N4SXRsTFluZTZaSGN5OVl0YVFqaUdSTFJo?=
 =?utf-8?B?SzNGeUN4T0l4TWVXUkNicHM1M3RMZWlTM0VQWnlGOGJyajJRS1dRcURxbXdh?=
 =?utf-8?B?QzNuZmZYZVh3eEt0M0JqbTRCNWVCbG1SelBwdVV0cGMxVGw2aXlFZ1c3UUF2?=
 =?utf-8?B?VzlJYldMbFhnUVo0MG9HUHFXYndCSTBJTlArcEpUQ2NjeGw1YzF0b3dwOFpr?=
 =?utf-8?B?YUlPYjVrMVM3NzVlTy9aeG1YbVhlQW5taXNBNmo2NklGTmtPUThuUURrN1Bi?=
 =?utf-8?B?THBBRTh5ME1XeThIdWlaVWVpd0ZMZTF2dnduRDAydHdyQ0JFOGE4N2hjbjQ5?=
 =?utf-8?B?R0k4TXVaWXJzdnNGOFVTQVpLSEgycWFCOHZqOEZaWHIzbzlKR3dSdVp3M21R?=
 =?utf-8?B?YllVdkZ1cU9KRVJEUUFQY2xCMUVzVEJXc29IT3lpcVROWmUzbFV2Y21xRnN0?=
 =?utf-8?B?ZGlKZUo2M2pHQVcvL3UybzNCb0dkS2VjaDY1SGFpaVBTWGIwUE9hbEg1ZkUy?=
 =?utf-8?B?T1ozVzBUTXZITjNVU2l2KzNUS2dFZXRONHdBbk5JWHhuZDlyeVlYdWxnbmJx?=
 =?utf-8?B?YWNQTTdLS1VMRDF1YTBDYXZCZHUrU0M3ZHh4L3RiSHBZNnFXUzI2TGEycHNY?=
 =?utf-8?B?aFFUMTRvVGxLU0VzWUd0K2RnaDdHWktjU2ZFdGtIYnEwWWtkaDc0NmlFdzVY?=
 =?utf-8?B?WWM3eXJpY1Y2RDk5ZXhTVEcyUEhPajJLaFJieGRPQUVTS0FkeVM0RjFpOWFa?=
 =?utf-8?B?N2hXUkxtMnZEVmFjekRpbEFKZTg0L1hoaURCMENiTlZvRHgvMExtbkFicjR5?=
 =?utf-8?B?eFFvRDA1d0l5R1VIWEdtbk1pcklaQVlQL1VLU3ZTMmE2VHJ3NXBqUzBZekdI?=
 =?utf-8?B?czVXTWZGQnRuam5hc2xkYW0rOXhDdnN6Y0l6dmRURGhEd0h5MnUvTEdCTng0?=
 =?utf-8?B?ODVoaGYvZURTRlhWZGdvNkpwOW9vckxpV2pjWlBVL1JSMVZyNUk3ektqRkhn?=
 =?utf-8?B?U25NNm1ZSjhYeVdzUUZHZ1UycjZPalBubEwxbXVCYkltZEpSZnhQRkErNHZk?=
 =?utf-8?B?Sm81UUp1ejRuUisxc056Sk5kSWtqUFZTakI2bXZiUjY1ZFZxbGJ4VFh6aVU3?=
 =?utf-8?B?OWNXMFcvOXErVDcxSEE2c3NBWkpSRElJMXhJaWNYN2xvQ0YxMGF6cGttU25N?=
 =?utf-8?B?SU13Vm90NGF5Z08zTmIrR0ZVSjM1UTRRdm90OXVXWnJtWkxoWUNhUkd4ZlRP?=
 =?utf-8?B?MGgza1pZMXNQay8yTmtMOHdmazZnU0dEUDhhR3AyMWZ4L1RxbWdBZUFZbHhl?=
 =?utf-8?B?R0QvdTVJQTBHb3pnYWYwYWNOc1pucjM1aTluVldYeUhad1lhdGt4ZG9tcWo3?=
 =?utf-8?B?dXYyeFVSV0VaVEExdkZHOTliUks2N3kyZ285bWF3QnJMalRNd2lYRXpJOHY3?=
 =?utf-8?B?WVhGazYwelN0NXBXUVNIUEpMczdsVmt5TnV3cEtNcytHZ1QwTDlvTUhDRGlu?=
 =?utf-8?B?dDRiamZZU3g5bnhlUThOMUd2bzhpcGg1RzFtOUMwcXZ0TW53OWpzRGhYRnVT?=
 =?utf-8?B?eXdDaWdLK3ZRbk80dURmcmpNZlBSRmtId2hDQ29BUFVMVGdvQXFEZlRyaGdv?=
 =?utf-8?B?V3hweUtwYXlVSmNmc3dxS3JUN0R0SEdxSGR6QTJNYnYybjR6VUhiOXVtY2M2?=
 =?utf-8?B?WWcvS1A4K2hGM0N0dEIrbkY4R0dmemkweGhTZ2crVHVSVUhuSzk2V01YOHRU?=
 =?utf-8?B?cDAwWWNJbkVZTHFMeEZGNGlHN3kvQVJVRFRLSnNwdnhJQlFDNktmVFB4UDBZ?=
 =?utf-8?B?ajRabGs0dmplc2I4cllhTllTRHpDUVY4TG1NQlJsemdHTzdKVkxkRWJyWnhx?=
 =?utf-8?B?VTlEVU5GYUNhZVVCeDdvUGF5OSt3NjA2Z0hGZlZIdm5KRFlZVEhHTzhMRmZP?=
 =?utf-8?B?aCtJWmhmbFZjZjg1RDgwdldwQXd2Tmk4a2tIc0FRM1laSGNKTzVPLzh4L1Rv?=
 =?utf-8?B?cDVTK3JsZmhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHFQL1VGZVNCbWpySG01blpLMlNtMnJ1dFE0R3NHTU4yWkRCNDJneEc1bWR5?=
 =?utf-8?B?THc5QmJvcHhweUdEb1A0K2FBTUJSMmQ5NS9BWStkNGRSRTdNaTEwOW5iZ2VI?=
 =?utf-8?B?RGNPMGN4aUNvMUU4ZkVaZFNWZGEzd0NqSEUyQUJFNy9Ua3JLMEFMbGtOVmts?=
 =?utf-8?B?TjlNbmJwN1NzWE0zTXU5R0pZVld0WUZqUndTYkVUTzNnQWhZY0JNUWgyNGJC?=
 =?utf-8?B?bGd1NnNpQjVVdzFlWVhxRE03bEpVNHdMYUk2TjM0c0FFZUxMVTk5K3FpZlhr?=
 =?utf-8?B?c2RjN0EwamZscjMxa05BTUhMWlVJVEg3ZkFUNVlhNEI1SWVuOUdWeGV5dnFz?=
 =?utf-8?B?QWd1RFJHbDZzQlJxZWJsS05nbWhJYXR4dGFFYlkrUXdpODR5UzZzRFJ0MWxT?=
 =?utf-8?B?NGdoRlBrR2t0dllXZG9FaFZobmRZVmlVNGpoQ21ZUXplUllvVzFMeW16T3cy?=
 =?utf-8?B?ZDNzTWl4NmJibzZpVXNrM1hJOVQwUi96WDhuRHZhOTltVVZpQnRqMDdJck5L?=
 =?utf-8?B?bFVxYy9Bc1h2TFJNVHd0OVcyaGoxODZXRzFKcm9CUXlxU1hwbE9lYWY5dEVX?=
 =?utf-8?B?K2pQUE90QkdmKzMxUHRRSThwRU81cndYeWtDT2JMdFpVRkFRZUl3YjBYNXRZ?=
 =?utf-8?B?SzkrQnpCbEkzcTBpc1Y5alVVSndwMTNVL29OMXFQcWFBOUl1anJDNlo4VUZn?=
 =?utf-8?B?OFFVRGhSL0M4SjY0Vk5kcHJWSS9OVkE0TDk1NnNEY0s3SHJMQVpMT0kwNjFM?=
 =?utf-8?B?OGJTWWFabmdibHE5Y0UxN1hQdkwrQVV3MjYrdnFsTVRUN0VvVE0xUC8veElH?=
 =?utf-8?B?OUxreDUwejdEMFVObkRQOWoxV2ZhTGNqb01paytLUDY2emI0cGhWRWtvQzdr?=
 =?utf-8?B?TEM4cEYyalB1aWZhMStreHc1TytqYkgyaURnY0dnanY2SnZoUkoxZ3pCYy91?=
 =?utf-8?B?YzJNZUZ2d2MrdHNCU1Z6S2UzdmpwRzEyY2ZWMzIyUjVidUQxYmttbmEwek51?=
 =?utf-8?B?akhld2FCOVJMdnlRU3hrZVhVRVlFY0hyaWlvRXdNWnJtallKN3dJdnVtVC9D?=
 =?utf-8?B?bVZCVjVVNDNqZCtIRFdUNmhoQVNHRVJKR2k5bGx5OEJlL0NpVm1NaHpDNFZY?=
 =?utf-8?B?ZEhYTHluUUpuMzQ4amxlOHpoV3lUbjVlNzM0L0x4L1Z3RVQ5cHB3WDB4UHd5?=
 =?utf-8?B?SnJ4MnhQd3RoclphYlE0b1hGQi9yaXNXRGtvaW9mTHFpdjFUWDRVdnZCNUdV?=
 =?utf-8?B?YUNsNDRraS9wQTZwbFkvWFJlWU5iU09vUnNXNlJKZUFuY3hMcHRCdmhRaWpK?=
 =?utf-8?B?ckdWRGwrZldkVmd0ZHltNzVKRkMvWkxPeklJY1BQZVpiYUpRZmtkNGVNcnJZ?=
 =?utf-8?B?ZXptK0d5NW9aQjVXdERjSGpCdTg5TTYyMDBNelJKTDM0WnRRNmZDOStENFpm?=
 =?utf-8?B?SEJjNCtVdzZzWVVHWGxMN1RXOVk5Ujhya3VpZXZLWWxid042QlFhRktONUUz?=
 =?utf-8?B?b0svR0c0bC9VdlhhS2xBYXkyQk1hUlBVSHFNcDhjSTJSQ1F2RFBDcnk2T0Ft?=
 =?utf-8?B?Z3Vmb2IxeG5TbmNxb3JnMU5LMnAySHZNbnNzNlhYaFo4U25VcVJtQXFySWxM?=
 =?utf-8?B?cmtsNW9ZMU5FS2Q0ZksxUkQ5V05pdjM2S1dZWDI0aEU1bXg5dkxEeW9ncnRj?=
 =?utf-8?B?ajZVMmtTTUFmbUs5TU4rZGorWS9kd0RZc0NReWRJYjUzL1hYUE8rMk43MDNF?=
 =?utf-8?B?NVU5djBSQWxJQUdJODRRNjNVY2tGRnozMWozbDNTVzNrSWpra3ZOaVZWSXFl?=
 =?utf-8?B?Y0hDVnZWc1JGWGtnaE9rU1VYK2JCd0RPWVJoL1QyeTM3R1FQNU50aGJCeGlI?=
 =?utf-8?B?aHVzWEM0QVJaUlBjMnlOK3VxeVNIR2Mwajl3dGZaWFEwYUNCRmlqejFPSEpH?=
 =?utf-8?B?dTRXSk85M3JiWWZQcHB5aC96UnVHZ3dWNkhha3B0dmxGTVBwcW1DNVhyRS9x?=
 =?utf-8?B?QVJ1K3lmZ2ZJcnFiV0t2QURWQkk5Mnk0YW5SVGM1ZGdPWm1KaWh2dkJoR3pu?=
 =?utf-8?B?dkp3Y2pvY1dCSGpoeHNXemsySm4zR2VUTlFLUnAySUNCZjVHMjZjcmRjK3Ri?=
 =?utf-8?B?Z0xzZkN3N3MxQUU3dUtmUzZFVmFrUytJbDM4a0JNZDlUbmlxSmdzclVHd1Zv?=
 =?utf-8?Q?1UI8K7CUsB6w/K3qzvRu/sc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae39e0e9-2750-4231-54e7-08ddea2ca903
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:26:09.4887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sv4b4TtffQyQ7lAiPxghfo9sWVzpcBmxZrUbOnn25OOmBBM90kWHb7eA/qGWpwvni8VrEVpzZ41/moLT3+dKKRDGIbljnnIACBEL+MlPG7mkrJ+bKoQ5bUSJcUiS5DiZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14065

Hi Geert,

On Tue, Sep 02, 2025 at 04:16:12PM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Tue, 2 Sept 2025 at 15:51, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > On Tue, Sep 02, 2025 at 02:18:17PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, 20 Aug 2025 at 12:05, Tommaso Merciai
> > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > Prevent issues during reset deassertion by re-asserting the reset if a
> > > > timeout occurs when trying to deassert. This ensures the reset line is in a
> > > > known state and improves reliability for hardware that may not immediately
> > > > clear the reset monitor bit.
> > > >
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > >
> > > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > > @@ -1667,9 +1667,16 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
> > > >                 return 0;
> > > >         }
> > > >
> > > > -       return readl_poll_timeout_atomic(priv->base + reg, value,
> > > > -                                        assert ? (value & mask) : !(value & mask),
> > > > -                                        10, 200);
> > > > +       ret = readl_poll_timeout_atomic(priv->base + reg, value,
> > > > +                                       assert ? (value & mask) : !(value & mask),
> > > > +                                       10, 200);
> > > > +       if (ret && !assert) {
> > > > +               dev_warn(rcdev->dev, "deassert timeout, re-asserting reset id %ld\n", id);
> > > > +               value = mask << 16;
> > > > +               writel(value, priv->base + CLK_RST_R(info->resets[id].off));
> > > > +       }
> > >
> > > Is this an issue you've seen during actual use?
> > > Would it make sense to print warnings on assertion timeouts, too?
> >
> > I haven’t observed any assertion timeout issues during actual use,
> > so maybe printing warnings on assertion may not be necessary.
> > What do you think?
> 
> Have you seen deassertion timeouts?

I haven’t seen any deassertion timeouts either.

> I would rather not print a warning.  The error code would be propagated
> up anyway.

If for you is ok.
I will drop dev_warn() on both:

	- __rzg2l_cpg_assert()
	- __rzv2h_cpg_assert()

in v2.
Please gently le me know.

Thanks & Regards,
Tommaso

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
> 

