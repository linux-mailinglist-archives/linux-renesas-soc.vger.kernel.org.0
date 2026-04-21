Return-Path: <linux-renesas-soc+bounces-31443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMQANhft5mnF1wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 05:20:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D35CB436064
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 05:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA402300B46B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 03:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74AA37CD59;
	Tue, 21 Apr 2026 03:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FK3S3l6l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84E4366075;
	Tue, 21 Apr 2026 03:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776741525; cv=fail; b=kG0lzNtQ+R0746/n8gCTCXUwg47sVGIiOEMP9k0EacONFXHHeNCXLF4YRtOMtYYWZOO5CsgdNHVOfjQF7ZP8UaBPWucKLQCpf3nhILdc0Y1takTYqntnrTA0d+GMJeKvwxvxM/Kc0X53Myz9T1ASmMKH4OVu0FkSZ0DzuAr1nLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776741525; c=relaxed/simple;
	bh=nkkwFdm7nzhZ6JgZBuIPGR+3IfC0NCukF7NOHuh0zhY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o2G1Rwbw+UDqsTzsFBEgPaYts1MAUYNr3EcM8T6SJVte5CvIx5H9mVEin6B7Va7KSUN9w367Lsul/B0EWEzvpVyiEC+/aLzDSRxf798Q3a75zL/6FvAW9i68cFRU6sDEqtnUIoRa826s2BFM6IM0bDox+GPIGmknRgoDjhb03xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FK3S3l6l; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOa1dKJAxhBqrin66yqbhU+f1oiNLJ8feCE21/bB+Jn2dk2TJz5Jt4OyyWRinSQ9MFp5yEdupA8rTpqYveTuNAlncEKBya1v1m04viKKyWZkD/XK7DGEZSPQv9Zo+R1+fb9/JZA8N94okrehUdAB9mptifOm65BXh+Wq2b2OASHpFv0BSel0sq8lY4ubWXHQ2J1d/6Fy4cSKHftmEGj5O1PEENHOXaBLZ69YrUN/X3xvZ5zJrml0hqY5Ds+V0u0cmP989c7+3ZROyzLhw9iXmsl9Eeox43ri/SjzOIXwXTUbxmzOKCU4/B0+KdadHFV1jo4PY6IFQVSJK8s7XkfF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1PySWuW4jkSZ05/VFS+J7qhmTe4Frg01BQDc4Ldhjk=;
 b=YAjy/BEQsp0eVNIDAI0qEgjgSnxDSt2DzZYJfBf0+MG9iq510Bbo6ghHGapsK/nkXSYEWIJE/SRkX+52bGg37qxtzIcDKkFsbeSJCV8RrLVH/EM7PuVSnsg4DUutWArvGsICuzuS6C9AvyPEg7ceXWtYixmS7QQZn/WnR9YY3kgZgwmLPcAsN4VF5VzR4YkqS8SlPXjH02i7DcHwa5oOW22anmA/oRE7YZevRL61gPtQpVZOkxEQDMRL3md/fP+A9JMqZXEUmI11DIsMiPoiZ6qJIoqG4xyuJfH5MjNcKxY7kksDZ5kDxqbOqTByrtqnbBAl3gOYlZYKgQdHke0pBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1PySWuW4jkSZ05/VFS+J7qhmTe4Frg01BQDc4Ldhjk=;
 b=FK3S3l6llKLcKpW8QOqmXMHOc0mZ0FN0+kFwEX5Gqy/VyGWmDUY7OS3/x8HQS/EbPLr5tDBMI0Vo+d9OxqZtkLlt4C/y5QPmGd9yuitiGmW8/DICNL7MbK4yofgODmRyusrSy85D0mKCVMT0upX4F1RgT+q0cte4xuutYglAkP5OKFJgU5+/CMEqic+PWkuYOgTVu+iz90aQvdaA7/KLhOJZWZMDRgfCWEGY9JaM2I215uxya/Nbo7GaQpZAybb68Bv20CWLeh9Y46XISPdvnHplBzYVRls58KiattjNFmf/TypcOMHxE+k6xnYWHxt0O+nOEhNQrn+zDC7dRmIQSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7940.eurprd04.prod.outlook.com (2603:10a6:20b:240::19)
 by PAXPR04MB8800.eurprd04.prod.outlook.com (2603:10a6:102:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 03:18:39 +0000
Received: from AM8PR04MB7940.eurprd04.prod.outlook.com
 ([fe80::1fa8:cc0b:b501:6bc4]) by AM8PR04MB7940.eurprd04.prod.outlook.com
 ([fe80::1fa8:cc0b:b501:6bc4%3]) with mapi id 15.20.9818.032; Tue, 21 Apr 2026
 03:18:38 +0000
Message-ID: <4c6e3f5c-a568-46c8-b9ea-69a2fff4b744@nxp.com>
Date: Tue, 21 Apr 2026 11:20:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
To: Biju Das <biju.das.jz@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260416082928.169347-1-biju.das.jz@bp.renesas.com>
 <00e2f34a-c488-4a61-bb87-0f0431990c3f@nxp.com>
 <TY3PR01MB11346B5C92803F6A3D174ACCF86202@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <d6dcdce0-6ff9-433a-963c-5f0ea9f2a9fa@nxp.com>
 <TY3PR01MB11346D957ED7C6A2BFD1EF79B862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346D957ED7C6A2BFD1EF79B862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0095.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::16) To AM8PR04MB7940.eurprd04.prod.outlook.com
 (2603:10a6:20b:240::19)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7940:EE_|PAXPR04MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba20ff4-a96b-454d-ea3c-08de9f54ae21
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 xuMHYmFBIkcoyJQneVF2pxFJu4bq8dRMahcRv2EvVnbU8V6agtBWMW0pmHEdZwB63K0x42/SkAgh5rm4jYV9snHXxudki9RTLenViP4uTJH+KlxFecoqgbddUkyh+UohAPcyYCSJ1RwknoMf8R6dy7Qr/VcWm8uE5cHAfQMEamz191TB7HJIKGoIk/qR+iFHl6U3dcnu64FlSrsYAsES+1VB82PFVCtdY7YzhmnzL7CufKfl8xqbDWN5drItwVjOnhmhU0GeRJ9uQtM//GarO9Qn5Uzxlzp8S+x4KS0SxCuUojwD6YoKvy3cx+XO/fvp9jskr6Yqrb61vLaYLPy++Sttwhrt4ztTtycSxuTWtbgvRHUAB06iPmLcxggnj/mvhNmU51u6z+Vj+9DI6x0nDF3wOWr0R096ElxwRBPE1WkKmuPh3sYkJn1Tp6QtuEVukH8m0K+wlgidhzrSQflb2HF5h8puIIhMEB9sgH6kYvYa4iHN3w2oEdLLOOSSCv3ZgYKy/jk9nRB/6oI7mQ6MNF08uREM0ym3UlOfvZBZPG4k8hdL+ewhduFzt+uwmHWXkMC9mMMtDlbgViEvu6r5FS8m4Orips+92+cD2atDL6PWs9IhRuLJ7BNnf3xQ1TZ/0PeN6MCGLUNmiF0HXRwi7oP7Apni/5afuBr43hBBV2JEFrDovwbKFZhGLdoc49SyAWeebdVnz/djb5Js9JjOPpCvkL9Kuzkbv+reVs1ZWm7zLZaEyt/w0PxImwE/PyYznsaCsFeb0P/Se+M8kD6f4w==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7940.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QU5jbmc1ZG1CMFJoaHkxQXhxSlNiMno1MVk1YnJDWGNKamxlN29rSWk3MTRl?=
 =?utf-8?B?bXo1dEtxN3NyUzhXR0haby9XL2JyZkZRVzd0ajFjOUZSbGh2NEg2M05SNGhj?=
 =?utf-8?B?TXFoRDh0VVAxVzZ2OE1EVjk4UWJrOEI0bUYzSTNQY001K0Rpa3RFbGl2cUtH?=
 =?utf-8?B?akd1UGJkQmkzNlZzTEhlUEhxWWNGcG01cEZwSloxMzJiZnNFWVl3NHc0LzZa?=
 =?utf-8?B?OXpTelZjOGViU0cwdnhoSzNlRWFtL040QVhWcjJKSVU0SGt0dDlMSStwTzNY?=
 =?utf-8?B?eVdCcDdiOEZTL24yb3NGbXdSSUtSbWNJYW45djdqUm1sbHZGMTVjSURxL0tZ?=
 =?utf-8?B?eEJtcHNOcStBS3BuVGRXZ2diS0tkNzROejBEclhCYU4zNzg1RU5VUmFjRGhy?=
 =?utf-8?B?TVRKZ05IOE4rWkZnMlBJZExtcFlzZHowVEZaMmg4ZFNiNExPd2dXOFJ0NTht?=
 =?utf-8?B?MkpMNHdKQS9Wb2RUSTF2Q2dnbSt3YmRKeUppQjVFNjMxM3JGNkJqS2UrRklY?=
 =?utf-8?B?VHRWY2NmTUlMRC9ZRERFYUJVZXNFNzJFLyswdXdmaXZrYURJbFU0OVVZdWwy?=
 =?utf-8?B?Y2loRHdSaWMxVUJYcS93dlB0Tnk0TlhnZnJBWVgvMlBiQkNGWGdVeVA5b3BG?=
 =?utf-8?B?MDFYZS93WmZrVVJYWDA1eEZBd01Fanhsb3pWMTRWTjBZVTlGcy9icFdXeUdE?=
 =?utf-8?B?Y055MVNGUldKc3g0b1o2eWVOUXZCMldkU1pzcEQwcVpVK2RScTJtOUFpUllC?=
 =?utf-8?B?UFJVM2tHckpQTmh4WmlGdEMxeTNuT2tZSUwvcFhtbk13d0Y5TkxaaVd3ZnFL?=
 =?utf-8?B?UHlCTXdZVVM1eXZtN05PMEJ3dS8reTJ1WUNwSVBGZ2Z4a1V5WC8zNzNrbGsy?=
 =?utf-8?B?YVVnaGxCdXlPNDBabys4dWtidnlnYytvUlF2WW1DZTlSUUpxM3RuNlBqL2sr?=
 =?utf-8?B?MWpSb0sxbkh1MFU1b0dYVGNpMDFmRHluSmlGZFh3Q2d5SzU3NW9lRnpKbnpK?=
 =?utf-8?B?T0NKc3M0dndvSUNhVitmZVV2QWREQlgwVnNQSWdnTWVrN0krUEkwZ3FCRWRQ?=
 =?utf-8?B?MmtGazZMZFF4RG1xeEliRWR4ZldNdnFIbGljVktBYjlRS3R2dmhoUVhnUDBF?=
 =?utf-8?B?MGREZmhiSzY3a1U0MkZXdEdWbU8xa1YyRTJqQnhMT1RFR0N0TkQ0eFBISDZa?=
 =?utf-8?B?VGZtTzk3TUxjQ3hYQ0Y1dGk2RjNBWGNyb2JaMWlVL2RPc3pwTzlqUHJpWXJG?=
 =?utf-8?B?MHJkVEh6VmVERkRkblBHejhRb20ra0o1NFZ5S1ZneGlPOWYwL0ZCNm5rQTYy?=
 =?utf-8?B?K0ZQRmNnYi9rTzdDWHVYTCtHcUprU09EVlNUU0NjcFlEbC9SUUs5bkE4NHUx?=
 =?utf-8?B?VEFSZm43MTl0YXRVQ2lKN01QNDVYRWRVUUE1U002Tll6c09vNG5qYnZITmRS?=
 =?utf-8?B?UWs2YUx6c096ZnZwSHQ0Vmc2OUJqdldBUmN6YjZxQUUvZFhnZThUYkpDcTVQ?=
 =?utf-8?B?V2JwQTgvUEt2YXMyWXFRQ1VPZnEyeE8zWGFmVzNVS2hZUSszZForS0xPdjA4?=
 =?utf-8?B?Z3Flb1h3a3RBOFkvM25CQzc4aTJqSEo0blRkWVZRWmxQaGUxcmhoSmFmN2U4?=
 =?utf-8?B?eG5oVUorcHJNSURNRDRjdDVuL1BGbW56UmtOMFozZHJiVXVvQlhPUm1oYUFH?=
 =?utf-8?B?aURVRDFzRS84YnpGUkgvWlVJeU51a0E3OEFvb2R0eTVCaUNZOUZuRFRTWFM1?=
 =?utf-8?B?bjcrZ3llazcwSXNJQ2NwRzhNRi9YdTVXY3lTdTlNVUI4SVdJci9vTmRlZjcr?=
 =?utf-8?B?UzNBNTdidStkaGhpdGNJd0U3STI2ZWFDaGhUVWdGYjY2SFFVZEJtcWMxSGVs?=
 =?utf-8?B?bDRkYWJzM0wyNUtRbFRPSXd5ZDJOaFBYNnJnZzd6c1BFOUJmTlRCaTQ4OEVG?=
 =?utf-8?B?bjZKQ0FnTEFLQmIwM3E4bEU3dEcyR2xFbm15WUFpNkN0Q3htSGs4RmpiQ3ZN?=
 =?utf-8?B?cUI0SkJaQ2l5WEdwREc4cHF2dWZHN2pKOUl6VVBoYi9tK1Bab2E3NEtLZk5O?=
 =?utf-8?B?aUs2WDFBK1hzdnlxN2R5ZjBvVGlPOVd2dnZWaFZiMDRrYURUc2lYTXZSa3Yr?=
 =?utf-8?B?NUNzNTVMd0ZLRWVOV0xjT3I5QmVsb0J4dWgyS3RBMWFlaUFiNTVtRzY3ZS9t?=
 =?utf-8?B?bUhrMUt2Y0xSZHpwVWJpcENFaVA1TndadFkvekFPaXZHUUorSWR3bGxoUjU0?=
 =?utf-8?B?NG55eXg1ZjdUYWlZZzlqUHFjblRQOUVYQjdRQitwWG9Da2NuRldPaUJQN3dN?=
 =?utf-8?B?bXYreWMvSzg1b1BHdkJBK1ZERU50K2xydWJDajdqdDNQMlhxY3ZTdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba20ff4-a96b-454d-ea3c-08de9f54ae21
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7940.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 03:18:38.7419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNppyfAFQexhqszJk2CQJWMlFyge4EVblrjc4QHWUbxH61UhUYgvU6ToXx8K8nJ4u+2ob32jNuj++zlIAEQNhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8800
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31443-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,aka.ms:url,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: D35CB436064
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 06:15:46AM +0000, Biju Das wrote:
> Hi Liu Ying,

Hi Biju,

> 
>> -----Original Message-----
>> From: Liu Ying <victor.liu@nxp.com>
>> Sent: 20 April 2026 03:26
>> Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
>>
>> On Fri, Apr 17, 2026 at 10:49:35AM +0000, Biju Das wrote:
>>> Hi Liu Ying,
>>>
>>> Thanks for the feedback.
>>>
>>>
>>>> -----Original Message-----
>>>> From: Liu Ying <victor.liu@nxp.com>
>>>> Sent: 17 April 2026 07:05
>>>> Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume
>>>> support
>>>>
>>>> Hi Biju,
>>>>
>>>> On Thu, Apr 16, 2026 at 09:29:25AM +0100, Biju wrote:
>>>>> [You don't often get email from biju.das.au@gmail.com. Learn why
>>>>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>
>>>>> From: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>
>>>>> On the RZ/G3L SMARC EVK using PSCI, suspend to RAM powers down the
>>>>> ITE
>>>>> IT6263 chip. The display controller driver's system PM callbacks
>>>>> invoke drm_mode_config_helper_{suspend,resume}, which in turn call
>>>>> the bridge's atomic_{disable,enable} callbacks can handle
>>>>> suspend/resume for the bridge without dedicated PM ops.
>>>>>
>>>>> Introduce it6263_bridge_init() and it6263_bridge_uninit() helpers to
>>>>> consolidate power sequencing, hardware reset, I2C address setup, and
>>>>> LVDS/HDMI configuration. These replace the open-coded init sequence
>>>>> in
>>>>> probe() and are hooked into atomic_enable/atomic_disable
>>>>> respectively, guarded by a powered flag to avoid redundant re-initialisation.
>>>>>
>>>>> Switch from devm_regulator_bulk_get_enable() to
>>>>> devm_regulator_bulk_get() so that regulators can be explicitly
>>>>> enabled and disabled across power cycles. Move reset_gpio and
>>>>> regulator state into the it6263 struct so they are accessible beyond probe time.
>>>>>
>>>>> Add a remove() callback to cleanly power down the bridge on driver
>>>>> unbind via it6263_bridge_uninit().
>>>>>
>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>> ---
>>>>> v1->v2:
>>>>>  * Dropped system PM callbacks instead using bridge's
>>>>>    atomic_{disable,enable} callbacks to handle suspend/resume.
>>>>> ---
>>>>>  drivers/gpu/drm/bridge/ite-it6263.c | 88
>>>>> ++++++++++++++++++++++++-----
>>>>>  1 file changed, 73 insertions(+), 15 deletions(-)
>>
>> [...]
>>
>>>>> +static int it6263_bridge_init(struct it6263 *it) {
>>>>> +       int ret;
>>>>> +
>>>>> +       ret = regulator_bulk_enable(it->num_supplies, it->supplies);
>>>>> +       if (ret) {
>>>>> +               dev_err(it->dev, "failed to enable power supplies\n");
>>>>> +               return ret;
>>>>> +       }
>>>>> +
>>>>> +       it6263_hw_reset(it->reset_gpio);
>>>>> +
>>>>> +       ret = it6263_lvds_set_i2c_addr(it);
>>>>> +       if (ret) {
>>>>> +               dev_err(it->dev, "failed to set I2C addr\n");
>>>>> +               regulator_bulk_disable(it->num_supplies,
>>>>> + it->supplies);
>>>>
>>>> I know that you call it6263_bridge_init() in probe, probably because
>>>> you want to enable the regulators for hotplug detect after probe(it6263_detect() reads register
>> HDMI_REG_SYS_STATUS to do the detection).
>>>> However, an idea[1] is to wrap the register read operation with
>>>> regulator_bulk_enable() and
>>>> regulator_bulk_disable() in it6263_detect() so that you may drop
>>>> it6263_bridge_init() from probe.  With that,  it6263_bridge_init() is
>>>> now only called from atomic_enable, which means that the
>>>> initialization code can be open-coded and the initialization is
>>>> supposed to be successful(due to the "atomic" nature) hence no need to do the regulator disablement
>> bailout(error message in dmesg is sufficient).
>>>
>>> it6263_detect() still works with regulator_disable(), see the logs below.
>>
>> I guess that it works for you on RZ/G3L SMARC EVK because regulators are already enabled by PSCI before
>> this driver's probe. 
> 
> PSCI does not enable it. The supply to the rails provided by PMIC regulator during system resume
> and it is always on.

Then the PSCI term in commit message doesn't provide any useful information,
so could be dropped.

Since it's always on, can you keep using devm_regulator_bulk_get_enable()
in probe and just move it6263_hw_reset(), it6263_lvds_set_i2c_addr(),
it6263_lvds_config() and it6263_hdmi_config() from probe to atomic_enable?

> 
>> But there could be platforms which use dedicated regulators(like discrete PMICs)
>> for IT6263, which means the regulators are not yet enabled before probe.
> 
> Do you know any platform that does not work the detection after regulator disable()?

No.  But if regulators are not enabled, detection doesn't work for sure.

> 
> Currently we don't have any platforms to test this. If any platforms that has controlled
> regulator we can update the code based on testing.

If we end up with calling regulator_bulk_enable() in atomic_enable and
calling regulator_bulk_disable in atomic_disable, I'd prefer to enable/disable
regulators in detect and edid_read instead of doing nothing, because
detect and edid_read would not work for sure without power on those platforms
with controlled regulators.  If there is any bug, we can fix that.

[...]

>>>>>  static void it6263_bridge_atomic_disable(struct drm_bridge *bridge,
>>>>>                                          struct drm_atomic_state
>>>>> *state)  { @@ -587,6 +626,8 @@ static void
>>>>> it6263_bridge_atomic_disable(struct drm_bridge *bridge,
>>>>>         regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
>>>>>         regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
>>>>>                      AFE_DRV_RST | AFE_DRV_PWD);
>>>>> +
>>>>> +       it6263_bridge_uninit(it);
>>>>
>>>> Well, this could effectively disable the regulators and hotplug detection
>>>> won't work then.   So, again, the above idea[1] helps.
>>>
>>> Is it not working on your setup? It works for me.
>>
>> My setup uses always-on regulators, so detect works for me as well even if regulators are not
>> explicitly enabled/disabled in detect callback.  But, as I mentioned above, we need to enable/disable
>> regulators in detect callback (also in edid_read callback) after atomic_disable is done for those
>> platforms which use dedicated regulators.
> 
> On atomic_disable(), we are disabling the regulator. So on, regulator-gpio
> platforms, the detection() won't work after that. In that case, we need to move
> suspend/resume calls from atomic_{enable,disable} to PM callbacks.
> 
> Do you agree?

If you mean system PM callbacks, are you sure that this driver's resume
callback is executed prior to a display controller driver's resume callback
(essentially drm_mode_config_helper_resume() would be called to enable IT6263's
video output if it's the status when suspended) to enable regulators first?
I don't think the order is fixed across all platforms, because the display
controller device can sit before or after the IT6263 device on the dpm_list.
So, I don't want to implement system PM for this driver, at least for now.

> 
> Cheers,
> Biju
> 

-- 
Regards,
Liu Ying

