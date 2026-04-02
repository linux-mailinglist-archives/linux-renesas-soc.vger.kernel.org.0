Return-Path: <linux-renesas-soc+bounces-30702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAMQAw7czWmliQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 05:01:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1539D382E9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 05:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C51F5301378B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 03:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB6730DD1F;
	Thu,  2 Apr 2026 03:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LIiNGHE6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9700230E84B;
	Thu,  2 Apr 2026 03:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098811; cv=fail; b=hkd5NUlUi0S7dxGd8AUFpMJEw2bqwl1XeUM3WKsGE+ZyDSrIVu5qG08vFN5aNqar0K6hKlnjga+DffE3wh0e3Khnd0Vq+4FFApQqBC0Kx1Gn1kncAdbeQnncb2f4F8WhQ/HSoXq3abyaKBxJpWKIzEkM9/ye0qSpjzUUZ2AtPUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098811; c=relaxed/simple;
	bh=VC4ypnLB8GU2TMPrDdY53f5HkfJdRScEPc1gTNqA4q8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cvIBbURFrd1AM/vMkfJSNf0/B7xx5GrYY8quPU1TOhIxNv+qpWTIwVayglKzC0qQ0kTh7Q+g2+ZI/RK56hi2RDnuUf7t8gjeRDg9NZdk744jlwHl4ToTSG+En/vFj/Q3Lt1/C5+sbbdeEclQRCF+MgAdaKa5Wm/0+odSMYNgNsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LIiNGHE6; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=safZ6scM+V5xnTY1fsuizSVfHAOt2I8cB8WlbPUUPtxJy6yoKZH1lKOOS9ujo7elo4L8lMXFvrE/86rxvrprQ7RMn4tNlVUe+WKHRiEl4C8XsV9QY8l8lYJnQfxjlH4xvcMQIoU5girXM7FfxyNO0W2/XoqL0rvwuZkfiqkpWX4SUUx3ruVyoRRUHxkmFprGyFV4jaQGgVEHEyjfwHZxT4Volz7kKkpak6j+tlrK49IlCG7h6+zuc4BI4qAQ6twGug0Lje8TPwGNWG2Kll27jsSUE6z5rrau15JxA3ITsECsOkF1HgITxuzZTBvto59p0hy6J/HF8OZhUag2rpIoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siL9OtEMWZyXQiwCbKnrje0cFjnFZ0U2/xyxbh6xXTw=;
 b=MBlec91Zl0F1XS84Iv+bqVkjUk059JTE6eQuWLHKpOAbwpX7CkoRX47jtDO7t/gCJ04oyQdHFEckDbsICYejEgJpX1P0JkjBPXhxR2QNYFhSwdHNCVG96RwDFIusS3xEG7lBRcYLzZlQBICNRtbl8BTbeB0kHC9BZhbfEvljhGwNfjM3j4NX2EApnuGFpW1/+sT5iU0aqPY/CYwd/RLkq8vaqPQ4Bh46xk03dKjPx1eSq5MRHsa6Ylb4n1sTqSH19GnzZlsDBkUNEbl8hyBylwsT7aTwsPrSx/8aLaCHkIk2QyX+xMrDEs8S3wj0ZSBbF4Rq5mLJ6FBdOWYuzKsQpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siL9OtEMWZyXQiwCbKnrje0cFjnFZ0U2/xyxbh6xXTw=;
 b=LIiNGHE6FMkJjp7Miq94EqKT1qdsFAStsbQApzgdQw6EoMJJj4wrZ03YkC/DuC8ydPhWsJRftYeiCv/SpaMqV5Iin2YxoBJ9gMsGqzjp4uXHqwBO4VSDOtTpE5b+y2Z0ZU2wTZjoj8s/33cMc2JGN481qym3Uze6G1EY7kdq8c0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB13209.jpnprd01.prod.outlook.com (2603:1096:604:351::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 2 Apr
 2026 03:00:05 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 03:00:05 +0000
Message-ID: <87jyuqxe17.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: gerben@altlinux.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] ASoC: rsnd: Fix potential out-of-bounds access of component_dais[]
In-Reply-To: <20260327103311.459239-1-gerben@altlinux.org>
References: <20260327103311.459239-1-gerben@altlinux.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Apr 2026 03:00:04 +0000
X-ClientProxiedBy: TYWP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::6) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB13209:EE_
X-MS-Office365-Filtering-Correlation-Id: 1366328f-b284-4e7e-a075-08de9063f0f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m8SLaR4bUXmEa7A1IbvE2yuutD3mzc02OThJybaT38Ox0p4LOyVLCtsaBTPhGsamm0xTR+e8W22f18qY+t2b5wqMUIppUFrnLsq/lceT2udvjDoPcuvWhyBCi0cX6+qiIVL5Bz7olHsBV4xZpXjI2AagdX5kJpC10odw2NZ1lVp5T7Rg2wnFUtFchRHbj4EXJvQGjiV60EfY12Yac8y3mxE55vLtWEY8Fmo+7TLADXAErRH9liFjKyX5XJtTQukJXhg1Mao7mFCtQAgWH9D3gzaTS/BU0JA79DsoVPi/BFnll+Yc5ZMpP1IpUd+tT7eYMg5gxkhqMr/Xm+IuzZg1exZ/iYUGpLOZIQ5aLA+sDytOSPhaqmVbLQ11Mkuw3skzOrCgGLWGkEoool9lBC5Ig2PLW852Mt7mCRWodP2Ujn/g+7klrIGqMwT5kBWugkBD6QDLzNkHQ9OgHW5QnrFp3xX3JzspUwzVALmK5cRcY7vDSXjM+5Kc3BPb+zKqigYllnFOVTglg6ePcghtnrs0QFTyuZLeuyDs4ixkMokPAdwcEE5H4jvKOUWk95LVI4ltrM0gCKKnV1wm0kdyi+tGOgWCMQBWSAaaJPpXORv7fVdHXDW+chh1rE93gUNtzurtXJqKhgntFniTchISKclHoxrfC2zq3tlqWznu8SJXpqdDoEbbD3UprLrsWqLmezAY6/g4bTIx0uL1BtWvoJwfZNO6MrJJhZ7J/Bg3E1xnJqohGJbLIXpoi0WFTJV3uHehT7Qx5dxi+pLRltD9xRvEy3/PJwrg98KJEEGAaKXLeRQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CrR0z8pBz/lPoaC+S1cJ6DqVHcJb6IQkJuOTARkD6zOiT9Nl2WvnXAF6H5Ce?=
 =?us-ascii?Q?0AmG8+4PQIg37lLFyBITYKu/E/06F66wupX2iQVVsJg8tcbPsGpm4d5Pv5ng?=
 =?us-ascii?Q?zYIPdpa/7eqxCvBJxJBiFEmeJN5IR0PjnWrRv6ySKvZkiT8XnZ4q/EawVGa6?=
 =?us-ascii?Q?BdHgx7d75MfddMTMeqwpOYZAeWGzf4iJNzND51ocdLNrDH7Wf0RlZHAQBg9r?=
 =?us-ascii?Q?AETS6dnhj5Vnv0PCM8fsH3hN3qJteB8S512TCPAr0AQcquZ1F4O1gQ5mDT6F?=
 =?us-ascii?Q?t/Sm7y7NApzQRVRutoVRgYdbRJ87DUuInV81QRHSJRrMKGbbOIyBrf15uSrW?=
 =?us-ascii?Q?IhMlepioobitAcpCZxzQI6Yqyc3YpM+tZAIg6bbv1OoJ18FyMoyawYGR2vM5?=
 =?us-ascii?Q?HD6rHgL/zInq/wOHvKVkBnwaXlf3xlXSC/PsiRqFPubny7sMoh9EtpZdeSHE?=
 =?us-ascii?Q?vuxkvmd134IPZaubRgn0qK2qGyCgVfa251uD0sjknDwWcWh0XdOtf/fyXB1X?=
 =?us-ascii?Q?a7UIcJ9KAMg4IcglXcvD5i84QN7m+UGM1ZIy9PopahsE8IKpvYoPNMhzEHJt?=
 =?us-ascii?Q?mLEvNp/Bouf90GHRHG02vAPepJAs79cqadxK3FN3/6XdnQzuUXolBlayLigo?=
 =?us-ascii?Q?hxLdFWZHvlVKmihfEQWoXt5DmrY4Ck3H3CuFQ8hNJhwozzrXgLaEYeR+kl3e?=
 =?us-ascii?Q?DzANw+uROGWFyrkqcfqAkEv3c4BcCpLnCMuNaf2rz/QAF8HNRSY6JOChHeQR?=
 =?us-ascii?Q?V7re0xy9JqCiIE+bBvBVXjc7CgFUHG/gySoSM0/HyQgjakwKb7n1WZaCbRzo?=
 =?us-ascii?Q?7wQpz1dSUpHwnSPWT3DYtjK+uM/tN2TEfo377jqeuacZ6fbgdZD8nGgb2jTf?=
 =?us-ascii?Q?0bxoEoUbIpcLXQ/XTz6jUg1/9osylmMmad4wzN3sztFU/eRfGCcPKQprQb71?=
 =?us-ascii?Q?vr8VhNSIvZ71/T9OaKWK6AF0pHZtERsoQMcFjnUq3tRMMZ+fAxysn2l38Pi2?=
 =?us-ascii?Q?q54VQatSoS+NPARbmlKzjthMmzEkFtT5LTLX9WRittYcrJ2x2fl+VyNDjE5B?=
 =?us-ascii?Q?fjzbtUN6D8TMDYNIxFmjoaCXbGAKh8Odpehbm94FJukZ/odfkZecVucsJEfl?=
 =?us-ascii?Q?mRSeU3jNFMS6LWptsL9fvn1Mpu21F8jeRojTrq/BKqNH1h2bxZMkEeSfeQa5?=
 =?us-ascii?Q?D7XCKNe1x4M+JGpcuSgGgn08RFAynnmyRa8DhXFG7CrImeuZuiphX5kG2dNg?=
 =?us-ascii?Q?ewRYvKMl4WdNjQ4c6IVBdD8rPPOQcGxjjX5d2+F2Ca2h8NsUnDL9scYZmJyE?=
 =?us-ascii?Q?8LoyVH7+O4eHhy6xWH1LgUGXY2uryCmdrDydg78VJnnnybdo91+a9Kb47dNr?=
 =?us-ascii?Q?3TZBQf9iugvlpb9lkVewhjD9oXaYcEXqEfVy+HAW7fzO5r5guiR+O4xhvph0?=
 =?us-ascii?Q?DLnrvX6aOZrPpwmGpVpoyQV8O0VtWe+6TYC30oY7G26zXqzHSJwM5mekj+KP?=
 =?us-ascii?Q?VT+kMKmI2QTwt6MuoMOIXhxU64H3UC8sFPhXpN2SKFv0WfJ6/lOyNUtV7Xc+?=
 =?us-ascii?Q?l8gP/eBLwnkllTAsIw/rz2LtIx/nC0pPaae9kduj0o0p6xuRaPq+P5phz1vK?=
 =?us-ascii?Q?gExhv6J27QCneF+1+GI87H9+xD3zSPEz4gUzSDCRj4o6DMvZQMwIAPmG1WGW?=
 =?us-ascii?Q?RmWX8EDwlQGOJ8jYc+Q0H7b5i7XlAqAxglO3GRVpinVAgE3hDUQPVfa27Qqu?=
 =?us-ascii?Q?wWgflhV3OhhbAsVUHQbWV6jYvcwlyUg+qmnIokYtGnPj0CUaSSS9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1366328f-b284-4e7e-a075-08de9063f0f4
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 03:00:05.3977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Tz4V+BAQkNrzbQLkNdsRAMqlAYCM2nGeZ6l68yluN9k5tKklgrRCAGo2F0h8OpGcsQXF1bTiioP0H/ZHV92yMPAhLwJA5fJKnXuT+6ezkjdjiJ/I9pEXqMa0MmeSBwR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13209
X-Spamd-Result: default: False [0.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,suse.com,vger.kernel.org,linuxtesting.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30702-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid,linuxtesting.org:url]
X-Rspamd-Queue-Id: 1539D382E9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi

> From: Denis Rastyogin <gerben@altlinux.org>
> 
> component_dais[RSND_MAX_COMPONENT] is initially zero-initialized
> and later populated in rsnd_dai_of_node(). However, the existing boundary check:
>   if (i >= RSND_MAX_COMPONENT)
> 
> does not guarantee that the last valid element remains zero. As a result,
> the loop can rely on component_dais[RSND_MAX_COMPONENT] being zero,
> which may lead to an out-of-bounds access.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 547b02f74e4a ("ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2")
> Signed-off-by: Denis Rastyogin <gerben@altlinux.org>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

# I'm not sure why, but sometimes the mail is not comming to my mailbox
# even though it has To/Cc to me.
# I couldn't find it on spam folder either...
# I have noticed this patch via lore.kernel.org

Thank you for your help !!

Best regards
---
Kuninori Morimoto

