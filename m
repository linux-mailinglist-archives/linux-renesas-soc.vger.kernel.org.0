Return-Path: <linux-renesas-soc+bounces-12359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C31AFA19B91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 00:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89C593A48B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 23:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840721CBEB9;
	Wed, 22 Jan 2025 23:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Y8QLEU49"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C61185B62;
	Wed, 22 Jan 2025 23:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737589418; cv=fail; b=P34M6DtSv+Cwv7Zzkkqul0T6dmBWcbBL9sqM4SyA08VsyJ/3bl7gX2VQACcuRVH/cqVrw/WHQy2LeRwZrsFd3yKMTbGY/7mwRomTR9RzglCuZASCDE4ZLfrRGyMhq3BU0aRCUxPSdpL9K/cTRK+tb/Gv+/VVR0y6p/bnMSiFhe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737589418; c=relaxed/simple;
	bh=OpFNEOTvP2kFbiDWjdThp7cvS7h0Oboejs8h3WlszBw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DphLTTz20LHDNws93+8n0LlZv+0Rtx1R4EayOSA8lpCy7cjycFL9+N0FcCbW4ooKDvyyM493EpEBrvuzDthzE60Yv10zMFDtDSwsy1XXg/hFLbyPsdYW8Pay7Bl/5ztej7OAzv3CBJ3ShDN9tl6rx77gWlQklNuezmc3tbVz1zE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Y8QLEU49; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlkfaY5L3+KxuwGOGE2LlFlM3XdaRIjD9pwg008RFdgYOdSG2sPvfSaTf84h9J38AG50EhEV/cKW9TZAcOhpz96zCZozjCV1AL7Tdwdnqa9dd9M6k1yPcxszsg91DetGdX8avFRsoucP/hlec1XsydZhfWPxLRLBTz2V+wffwnAgB58LRtawmBrCm8t1XGD05/vtkoAmjhm0ZGsr9b8CS2F8C34QKNLJJrbcc/RDaL+alCCSGI30hDbA2AEQ6gtrIDrOzCzNPYwU0w6XlLQgRe6Wh7tfp3DXt2ehhRKN6gBI3kMXMhMF8lD8I/TRpLgDZ4HvDaknS8Qj3fgvuVwrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7y6Ht1oQoKJUWbI320G3oYsNuVcEeaLTDOzee6sFWk=;
 b=B407CQqhjdBuFPtW77B1z/+5hmedJsnPmcWvq4OVhEoEYQCVFNRTg6LQ4Q7t48B0Ppcl5q2BnP6YaRj4eGcQFMVhrKsKjI5YHHC8X12xtbBkl1+HhD+ORt75++4uDZAH7LMYioedLnLtLHCyGFdDQsAJNd4tu3Csylj7x4XVUAE+aswiMKgH/uuo36T+EWIgWdm2iIZklDq+jR71msR1h1C73lsouCTCA1EeC+M4K++sK3n0aiDOEHqd1E5Lcrgo4Bu8VIoCsxr29RHZfs9oMtOUvC02TFMQWjGL48x3Iwdd5T7FYAZ9X1fvlifagBwAVVPoAWf8VVx09ggxdEDvaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7y6Ht1oQoKJUWbI320G3oYsNuVcEeaLTDOzee6sFWk=;
 b=Y8QLEU49pYTXxlBrHvbxg9+f/eW3GGZKOIXliztzxWt2vAQZt5/3TSHWkluVrmzKHApXzzfTJviYegl0HiTc+7cwTqgtcfk5qtM7sNnU9l3xHmcQ9+v0bLt/1ijrsJFddvvquZAPGAXwD+EGljgsB2tgrQXyjrwZHBtFhkP/PEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB6571.jpnprd01.prod.outlook.com
 (2603:1096:400:e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 23:43:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 23:43:31 +0000
Message-ID: <87wmem76u4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: Stop using of_property_read_bool() for non-boolean properties
In-Reply-To: <db10e96fbda121e7456d70e97a013cbfc9755f4d.1737533954.git.geert+renesas@glider.be>
References: <db10e96fbda121e7456d70e97a013cbfc9755f4d.1737533954.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Jan 2025 23:43:31 +0000
X-ClientProxiedBy: TYCP286CA0332.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc67f3c-bfbd-42fb-8a23-08dd3b3e9449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?by2UO57NM6UASzT408s97HrwzuctzLV5x1j8u7VdZ2vkdq1TIgY592ZcEZcd?=
 =?us-ascii?Q?bnhOLFzW413mmYpWwkhn+BmmzkCKVReuKpmIbkTM7yERHKhdG3W5B6wai8eE?=
 =?us-ascii?Q?DzWstN3jkw4iEjD85jQrVbAOEFt4kFIYM/gjObX6pnh7s7P6mxKWz9zN3xQ3?=
 =?us-ascii?Q?kb/35vqtPIm8vM0c4m+5C3jBhrC2ZgprEnOn2sdxPTR7pN0PuqTuJ45ZwckV?=
 =?us-ascii?Q?T9Dqh3ruuh89wotMrByDYfWPpj9K2LQ8MBcnSutwAKPaV2ZSN1kGghvyC6qp?=
 =?us-ascii?Q?D2RXOiAKlpS1Y3SBLh01lwIrtJt47Z0s2mdVLHYYZp+PYnoDVCoLXu8LsUU+?=
 =?us-ascii?Q?wNe6FWtHHlYNsjbsKJNh0KXX0ijw/SLX7j0yODROtPo2gUG30StRuINg/l/9?=
 =?us-ascii?Q?Jjm+TypjLgI87+9H4N6/l5nnP1w6axtzUwxXysnodPW3G9VD3/zdMtOBKmKv?=
 =?us-ascii?Q?30k9u/RcLkai3nuhrElTGWNUjjKjxzjvRnCU9DTgmH4bg2fjgsPcMxVRbcBV?=
 =?us-ascii?Q?6W6pIgD22WeLKIDICQ4A7SHxOjIDIUlg1LxnCDocVwjzvc5Bc1eHk0+siGeg?=
 =?us-ascii?Q?nlj1f3aJvX/Qtv9VGZzIqrzRt/ym7JDh1Ty3R+tt7W/Qc2+R7DeuejhdPmFC?=
 =?us-ascii?Q?3BYjfajJsLuoD48g97eJUSsAo4ggt0puLvBC36UJ8UuCcLsId1Cng3fnuQke?=
 =?us-ascii?Q?emkerPejJm6UyLpvnmZHfUhhRhGDDmaYu3s3E8wvQ35QkMZ0fYBF9j2aJIM/?=
 =?us-ascii?Q?ce1+WSgy5xvgyuFDkNKHPt2Vl3eaUZeFsqel3/XG70vCBBI+AI8XiHz+Dc9j?=
 =?us-ascii?Q?IziWSM0yewe4P+qapLnCRHN0iW12DL0Tf9PmPq7V7/z+6QOiNfUJJjaO3HH+?=
 =?us-ascii?Q?jE5KEccA+9KUMQhQzJV+SzXuwhYjBztDZDY6aZjd5HZjcxbi/8KoZnvpIEWc?=
 =?us-ascii?Q?WEi3OOpcqqb9kveU29Fy/yRKUmNTF9j2DRMXV7plLSv3v0VKAQ+0/SmcQDry?=
 =?us-ascii?Q?IBgyUptQ0sEtcBCA0XQx0VCrzqj1hmnwyQJszZ2OcqEZpjFPrPbxDA42gFac?=
 =?us-ascii?Q?kNOJSGPeE8VNQysp7r2EVmMmKsct5oMX9rZm2KCqydJfb6xi6xaUOB/2uraj?=
 =?us-ascii?Q?tl95H0ppiKJf9EVEMV339BGtg1OJcxIfmsShnc4Lb0HnRIHGS1+wbelYF7Lo?=
 =?us-ascii?Q?7jzr4uFDqpdjqPqzDEcAK9FboIvLRaGOOT1lD8Bh2/km3AA73qZ2jqvInaNB?=
 =?us-ascii?Q?GbZQRRXvX7XeEbHTuRF3DNSesDpcjlvE/hAtiAeX/3KzNOS4SwvT+sKcGiW/?=
 =?us-ascii?Q?5qOpF2gemVUB8iAJDEZIYPqSULiM+8WwVtsSUyr3S8UQFvt0AyXzLB/M/yhN?=
 =?us-ascii?Q?YFaycj6LFX5NVzYlF5J04YwO1cmUCvUj0fwI7MOW3eobKzXWPFPvGSsqxK2R?=
 =?us-ascii?Q?MnAtyIKRSannIFAqdaxyfDM7s3OuMf1j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OsTN9JCouGnQhTYlmT0ZfhvITWlwGDTE+V2heLHF7oQM2apwklN3RVZEQbjv?=
 =?us-ascii?Q?Vt/HK+9x+yd+xoJhWG+yVBvSIwba08p7kqlB9oliTq7m9MQjdg49ENyaIy5m?=
 =?us-ascii?Q?nwRBFZFsHxapvfnmd5CHpkjQy2bIbJ00O3HFvEaClUmYGq5qPUglalXUuLYJ?=
 =?us-ascii?Q?oAfZdTXGCC+fzCPXj3sDzH9JWwfJqaW/h+hvEfPHLHNgEB3DqDyQR8a2PToC?=
 =?us-ascii?Q?KOlmn3Vp4ZAhtSQtwbJKQ6KN9QBXoZT+zyx/6OCiiYmE32Hn8DDJvtB8t8XR?=
 =?us-ascii?Q?ov3oT0/XYZDUhFXUpHA4fsatgU7JwxtdTGww1hF7fUltC+fRZeHvJjy0qH73?=
 =?us-ascii?Q?pgmq7S4bA+gRLefP5O9hIvARr+EDlrEhoqnM2VSzh9iaTiPzp6+O0U7stopm?=
 =?us-ascii?Q?EqHlDIx5C8w4sONkRWja8WO8rhat0y/Ng9Ov4m9hMPG3vIuFpmEBRV8Gfrhn?=
 =?us-ascii?Q?R+EAexs/G3Xl8tOZIl4tij2z+AlKBkWSQ+onFhy294U7Qoh18kTsclqIf47q?=
 =?us-ascii?Q?s82njcP6vDbX4EvHP581X/iuaWF20Ls07Fo3M3A7U/UWztxBhCCxsNdVpUuh?=
 =?us-ascii?Q?fSMzFI4q6GQs9gT9ydoD5f4oOK3aOaIrUWZmfSsPwUJIoAIsp5xl6sS3t6V0?=
 =?us-ascii?Q?lRQKNsiBkaSFWbSIgQNKLffUl6TGsSgPzxnNopErLHoqEzIqgQx54NhVaXnN?=
 =?us-ascii?Q?iHBZNZKtbGm1HOgB0+GjVHF7IY+frQqeq0A6SLTaZsCns/0XPTXXys99j50r?=
 =?us-ascii?Q?83fmwmIBOZXew0j4A6ai1vFN6FYMGNxJF5a1SABRM5FWxDTNKEvHA0OFi7GS?=
 =?us-ascii?Q?KagNdbIAUOY/ybWQeqINnG45l4P9LMYWwCCGCA/S5VbqH3fRXWAjIaMUHxga?=
 =?us-ascii?Q?I6oI7lukuFGHuRxI6Rv0QhoDaD/K+KPdxho4DIBr40bhLwRzDCQM9ZW28yay?=
 =?us-ascii?Q?MNe4qIWckEBs4iixzAJMECGY8tH8szyU0hzwDHI3bd8oYm5fplGDuipgdGdp?=
 =?us-ascii?Q?tMuGHXMjeHLwc7FBhMBNMJ5tLhVyvw0HKVgpWA+x9k5pEJSw0PV0TCjDfpl7?=
 =?us-ascii?Q?OjJARfbKPFkNwOyzEBvNq3N5q+E5aQ4yA6TwEgvS1U7GUKMeE38PqATKFwl9?=
 =?us-ascii?Q?xrbeRkoHVFj9HXStjGB1GtAnb5Jc3R37NkHsOm/hngNDEl5n5GDTFpEp0+ry?=
 =?us-ascii?Q?hJQRK1fftq1Tuu/Ntl9FUWDQfl4BAzAb+zkyUf+T1Se9py8jvkk+dCpvc5nQ?=
 =?us-ascii?Q?39b9QQWhP7ZPXlSssT3HRErd95mXZpSQXIsLgGIYcx9h4ZsAk+3jvxTyeQbs?=
 =?us-ascii?Q?uK66FKtp6e3UVT84LQn1EeZO9EwtU53IyXX66NAbdaw3nOzvXQQwJ/IS86D+?=
 =?us-ascii?Q?ZGrd7o/MrN7rdFFuo15qgC6srAiY67SsSnJfL0QH0r6GQ3JbF7UrgNDJ6da3?=
 =?us-ascii?Q?bA1FGtxyqmAkprMfXyeFkVdV3hfjnWlvn4wuOY3H2zZnzcBOTAf+f56dNrE+?=
 =?us-ascii?Q?U5R6fNmWIILgfPphuzUhIz7kcTjVPsWcVqrkMqXP5pJOU9mYI7dQJRPfIwiw?=
 =?us-ascii?Q?79B84FxK1qFF8L9dTHw+nh/tMa2KeleMQqMmoCt4iCTtuzmTqbTT9TtdMLRx?=
 =?us-ascii?Q?fSx0bmF/mmdvUUkNdXFJkds=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc67f3c-bfbd-42fb-8a23-08dd3b3e9449
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 23:43:31.9534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZaBster+IUr86K5qzuTSyFHg9WFHTJ8bEs3QxT3Z/OK4Uos5nbmX+Z4OylUy1Ei7D3wZO4x88xT75XN3z+rHWCK19AuUaVHTHuFdzcO0lYDhmaNE1+PQsx7tpAdAe+1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6571


Hi Geert, Mark

Thank you for the patch

> On R-Car:
> 
>     OF: /sound: Read of boolean property 'simple-audio-card,bitclock-master' with a value.
>     OF: /sound: Read of boolean property 'simple-audio-card,frame-master' with a value.
> 
> or:
> 
>     OF: /soc/sound@ec500000/ports/port@0/endpoint: Read of boolean property 'bitclock-master' with a value.
>     OF: /soc/sound@ec500000/ports/port@0/endpoint: Read of boolean property 'frame-master' with a value.
> 
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Replace testing for presence before calling of_property_read_u32() by
> testing for an -EINVAL return value from the latter, to simplify the
> code.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
(snip)
> -	if (of_property_read_bool(np, "dai-tdm-slot-num")) {
> -		ret = of_property_read_u32(np, "dai-tdm-slot-num", &val);
> -		if (ret)
> -			return ret;
> -
> -		if (slots)
> -			*slots = val;
> -	}
(snip)
> +	ret = of_property_read_u32(np, "dai-tdm-slot-num", &val);
> +	if (ret && ret != -EINVAL)
> +		return ret;
> +	if (!ret && slots)
> +		*slots = val;

Looks good to me

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


If my understanding was correct, old/new code should have same behavior.
But because of the original code, new code looks complex for me.
The case which this function return error are

	(A) if property does not have a value
	(B) if the property data isn't large enough

I think "DT checker" will indicates error for both case ?
If so, we can simply ignore these 2 cases. Then, the code will be more
simple

	ret = of_property_read_u32(np, "dai-tdm-slot-num", &val);
-	if (ret && ret != -EINVAL)
-		return ret;
	if (!ret && slots)
		*slots = val;

I think this should be extra new patch (if people can agree about it).

Thank you for your help !!

Best regards
---
Kuninori Morimoto

