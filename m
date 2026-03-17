Return-Path: <linux-renesas-soc+bounces-29638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ+SKZWduWkeLQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:29:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 249322B0F46
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE15D305C8C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 18:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7706937FF6D;
	Tue, 17 Mar 2026 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EiwAcr0Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010035.outbound.protection.outlook.com [52.101.228.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA5A37F73E;
	Tue, 17 Mar 2026 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773771857; cv=fail; b=QBk8f+rnnTJOUchwjOunGReZ7qAaNXj7oiUP0MaT+al8sqMkeBHGAOdRSZf6UVdoXRG6HeUqESqlAlQREXzRjbm7x4tF7bTjiixA45n9+bmIfgx6H7yAS/YfUwN84f0W6Lu2/1RLXdXvy5byglNiPNysCtb9TrWb9B+vCc7MS9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773771857; c=relaxed/simple;
	bh=Wl4rfKrgW2iLUqVABD0KJJbnvSgJKmzeZKeaQT03we8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QIPypiuXlUR4M+Edodv2LdGqbtSqlYXdoQcoUIdm3HXC3jCYAdRg8HJqkdTV5NgoYyD9P6CRCdhFB3SxD6RYO8JYJwAUT/qH77Zxnz7P8TmfYZYzFGkyecn3YLUsRew59mut23t3Pa2M+1UIjFcVQBtpDfro/iNku47Wm4H9L8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EiwAcr0Q; arc=fail smtp.client-ip=52.101.228.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrXcdRO+1pnXCe73Jp5Yd/0BMgxgGyEVF+P6hv4lHCVQkU4vViJ0e6S5eCpH1Po1ChlWglZySv1+zE2zgDkmBQAiQ2QtijHUljLkFnznK8TbjUQihVMZ6aXn8z6XxS+R4669ioqttQIcJThXSuvLYcRh4qyo4wzCg0XOMJvdxxJ2Y1A8KFNIowdETKiVKoOSoanIi5TlA4CgLF4/GW4ytmNiMA0xMGU8Eaa2tae9WU37/bcaLJMWSg40nnIOqoEUGQHSumfUQ/lOrlXgZZ6w3HBE8YlDTKXSwyc9KtOZSswkE2IbUh3I6GzBXuXFRJmE9LJjHRQwBHctc4AFTRELSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmwfkHo/fjyZuoqiNOvxrdRYjt/+VmRFBrhXYjNU6qc=;
 b=H9FoRFf39qtlkkmZD9huenGGhtGpSAKcqv/Arp4k8HjfJoKrrcSz+Sx7Ff98RiVZcy0XEmclKJBrr4LETxSR0Xh1wxkAAVrfboU4mNZx7pTEe7cIqVgTCSST1O0muBsveHygrHYYlG660o2r1G6BiM6pyZGSwXTcvobYb0M/Y7N2DkO9rB+8yBEjVhiClia251AjAGWQI+IjF0NSVxxSvnj50FdThSno2f79vYjKAhqx3WTfNuuw4UnHT8/Yj2OZehNoPUQixiaWu36Bs7347p48noNzdrGrMoHAu1yMBJgeuk9eS8nHkyJ3TuHwHZEjEiT2DYKIN2qxpalAKBImww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmwfkHo/fjyZuoqiNOvxrdRYjt/+VmRFBrhXYjNU6qc=;
 b=EiwAcr0QaOBxVlTy2Z4SxebyId5/83FQvQoz3CkIcUpmtyXIwBJ5yOqtb+V7J/pdDIfRmj7EkrcaNwHT/HVmaLLBTBxOPtOixYhWcqgSDxze2Q5iqgURtLX2iZht3C1Y+PHk7HDBs18vKcEJIiGAO02nlJgABNxGxt2C13un1sI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OS7PR01MB17720.jpnprd01.prod.outlook.com (2603:1096:604:464::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 18:24:12 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%6]) with mapi id 15.20.9700.025; Tue, 17 Mar 2026
 18:24:11 +0000
Message-ID: <03dd3c13-5915-4682-a7b7-08e70336e906@bp.renesas.com>
Date: Tue, 17 Mar 2026 19:24:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/20] drm: renesas: rz-du: Add RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <152f19a068fcdf27c063e845fe04a48a46c5b47e.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB11346E0B218CBFD8A403514918641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <TY3PR01MB11346E0B218CBFD8A403514918641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To TY3PR01MB11948.jpnprd01.prod.outlook.com
 (2603:1096:400:409::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|OS7PR01MB17720:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d873ec-4174-4c11-a138-08de8452630c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 zK05QnvByFEa5bCwecakZmQP4euQZ699RLqJrWX1MHGzu1aPVGW6/wldbW36UjOGs3hBPuhtfnKf//2MD012TwkwVbzTdhaI+2ebZr8bCVP7yVRNl8xvCeZ/rRq+Llqlnh1ZkLx2gzGGv2SAlp/vYWKJrJ5sf6gVcJOBZ2RnBjP+2Uu+oUIVznAZ751dd724UhP6xD+ClOIFL353uemE5utVZFzz6ortj9doSlJegC+QE0nVMVOYXBRZo7l8+UOkxxK9QusMd4K+NHISwv8dAHjJoEe7g0RxuF1b/RXIJFbc1ffoPCkFOpVNcCMUxHR93hB9uiiMwL5jjIFwt8loxdbOY1CWFJAQ34mGjJDKuCd6Mg/0N0KarVuT1/DzxkL4Tmp3JkhFL/qHsNwXmge0k/i2VTHAo4/sq4Ct90rRry1qdhGQ2ROjz5ejyDzTpp1TkX5y4xtlvqFuKTkicYNhYAujXCVPoxYUUoP5wJHRcggI1754gb6+gBLAXdFe6kFVCmvTULHEIX/wIx1Vz5KHCdutsKw33S5gsrEVzJMCCblTxjqmIdoncEWIbOIFsqWx6kacKGQBC3DWRKb0KcbB6d5awTe54gdwfAUsYH+4/7BHGQ5+hG5Q2oHx93Xm9dDqNFqu3cKl8GBpcp1c5fyVuKfS0rNxvxGVfIDIXLjzHfCbmLDUQ0UQ/ZCmiSytlMMMv74emfy0MtJSH/ZyhFGiyfkoqJVQ/k4KNASiVKjg1ys=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bkY1ZWxFVUZzaTY1cGFaUnVLeTk4cHpSQVZZbWtJV256OU14YzJvK2dmcEFj?=
 =?utf-8?B?TUt0MmdPRTZKVFJLQzEvRDB5TTJqZWEwWmlVbGFqMDBFNWx4NG1QT2JDRWxS?=
 =?utf-8?B?Ry9lWm5vM1dWTzRnT2M2b05xaHBJTVhSYk96aTNTNncydVkwbUYvYkswL0d2?=
 =?utf-8?B?WkVRZTR0akN6bmVJdjZtWUlockJCcmJ6WVBSRUlLNHY5eVpVVitWNWNHaXg3?=
 =?utf-8?B?MVRzSlVRYjdEcituZVlzOTNmeVJ2ZmpPTTlSVFFScjcvK0doU21Fdm90SVJh?=
 =?utf-8?B?WnhWQ0FEdmRGbGRwd0JoVTFkbWVxY3VxcHQ1eVlOM1ZyZHJZT2ZLYnpLbVNr?=
 =?utf-8?B?Y0kvcHE0T2hvTUp4VW02S1FRVWJCK0ROK28xU1NwSjVFNVJLSSsrRCsxS2NK?=
 =?utf-8?B?L1hTakF1blZpd01VR0w0NW9vQW5PWVUxM0hMbGNzbFdXQWw3dHk3UGFxTkRx?=
 =?utf-8?B?dFFybm5nS2xMUkFJUlJJSWsyZDFHNS9iam1TRkVOSmlidmxIMXlIcDJuUnY0?=
 =?utf-8?B?RWR2RUVBTThuKzNRd3JCUmVHVDA3a2RRQmxqOWFMQzVCeUJlWXQ4TEI3NFJy?=
 =?utf-8?B?TWFFTjBkaXNPbjRaajdieXFEeHdQaW83R0pvdTRSbHZ5cy9NcWdoZTJCM2s2?=
 =?utf-8?B?cXFHdlBqNi9BZEVWMzlmOXBpTmVuS0R6QlZ2c2Q3QzFFczdYRm1RQkRLQXA1?=
 =?utf-8?B?MzFPN2xrTlpuRUJxL2xUeGNzVnBMVmhTc1g2NWo1MTB4ZEZEak5jUkF0Uzl2?=
 =?utf-8?B?Rkc4WlNCQ0dTZEE3dXdCUWFEdDNiZnNzQVBGeS9OT3NzYXErcFlZYXo2eWJD?=
 =?utf-8?B?R3FYZFZwNkU3a2R1TzFjZkcrMmpTYzhWZjBJYytxb2tac0c0Y1FBOUNuQ2s1?=
 =?utf-8?B?TG1JQm9zRmFGSXhPSUtkZDFwWS9Gd2JSUWY0d3p5WExsUlYxeC9sdEsrTEJp?=
 =?utf-8?B?TmhEeFRmSnN2a3AyY0VUZE1tWEpHaW9XbmZVanFFZTBWcDVuK3AzbzdBaEtS?=
 =?utf-8?B?dk1mWm1OV1U3Mmx2aUFKWmtuYU10V1o1UExodzkvemxqWG9GNlJEQzdZQ092?=
 =?utf-8?B?OEs5UHlaSXBZOTJLY05menpXK2J3bzgzVzlQZm93N1Y3MjVpV2Q5NDFtTkpB?=
 =?utf-8?B?Uk1NdUtONG9ObDNFOENsZHJNZ0g2dHRibVRoeWtZSVFibEdZQmdQK1lEOWRv?=
 =?utf-8?B?RXdzUGZLNHVicVdNc2ZYbUZMVmU5QU40NkZOT1NxMGJHeWMvVnZzbkVyWkVv?=
 =?utf-8?B?bXRuRDRTWWMzZjljSlo5SEZsazRyN01TZXpQUCtQM21PUXd6b2lnb3FIOVJL?=
 =?utf-8?B?Qlg0SHVxVUVwaGt6cW5CeTF6Nk5pb0RzWW1iTS93WWpLMnRUYWJKUWc0ZEFv?=
 =?utf-8?B?MDRKa3B6cTA4NWMyR2Z5TDRXeURJd2dEeDJpT215UHNBdnpHZGd6MGtEMEN3?=
 =?utf-8?B?ejhPdnd0S1RyMWJwS2lSSU8xSXJDN1lnRG5GbkFTVjJMVE9uaWxnUnpXUVVP?=
 =?utf-8?B?MjhBdHY4MG9QWVpQcVdMcDBENi84QTNxUzhLNWFNRHlKTDFGV0V4OWVucGVN?=
 =?utf-8?B?TkY4SldiUWNFNGRUYTBjbERjZWs1QVBwQXpzcjJQZ29JSFU4YmFDSzNwV3dV?=
 =?utf-8?B?Z1JOeEFUQkFHcEY4OE5YdjhkQTloRXNFeHZxcVIvMnBkNVkyWDlXZ2JIdDlp?=
 =?utf-8?B?MFoydXVaN3VKT0J5OXFyYnowQ1JkSzhsU0w1S0RsY1AyU3VoUG9oQ2h2ZHg4?=
 =?utf-8?B?Z2tPK3EwT1VHNHI5TE80QXBoZmMyNGx0VC9mK2szM1dIWXBscCs5TjZJN3FF?=
 =?utf-8?B?UHNDeXRuOENCcHdXWW41N2k2R3h0QXZXUU9TZStLcE1Ydng4YVZCMmlURHBw?=
 =?utf-8?B?M1VVRkZMTzd2eUVvVG9KZkpsQ1E1czZHN2RFeU1zQjExSDhMWFRCbUNVLys5?=
 =?utf-8?B?YWFINEhSOFdSZzhxMGcyeElRRncwcDdTWkQyTGZ2NmVLSyt5Q1pMaTV6b1RI?=
 =?utf-8?B?aW1pUFNjMkxjbzBzS0pOakRvY2dDSnFuT3FtdzhWbnlkY2RJam0rNnl4b0I4?=
 =?utf-8?B?VytCd3RuV1N5UCswZG5seHgyVWc3SG50N1NaUkpkcmNBSHpVSldRbEc0V3RH?=
 =?utf-8?B?KzlubDdxS0psWU1vN1o0YkxSM3dTdlppeE05VXdjeDQ3RnFINTlCWUEyOE9O?=
 =?utf-8?B?WU1GcVhKb0lDQlVEcENJWWhMZVhabXg5ZjJGc2JJbVBvZFZ3WmRJNTExRjgy?=
 =?utf-8?B?VUJQUVlEQTVlS3Z5VmhtcWs4YVlrUlRWck92aGlFeE83L3pzMXJSQjFkcU02?=
 =?utf-8?B?OVVkZklhbFJWRWNoZ21ZYmdlaWZRc2hJb3VnRDJjeGJMR0l6NTFVNDROM0wr?=
 =?utf-8?Q?0H7MSYeslqhK56lYKbLeG68sm/835ot1k8MDl?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d873ec-4174-4c11-a138-08de8452630c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11948.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:24:11.8379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FafxhLyH1xoK6/wtF1TkKXvWLHZ4FuuVxvUsjU+i7jOuCJnLyH9/CYqKQNypGLdbkXgPlbTvhOCbl3XpFI4tv2rodBPiOB/QZM6Rnl4jUnJNyKs3Z+CH+Ik5hfqmNGU1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17720
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29638-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 249322B0F46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On 3/17/26 14:35, Biju Das wrote:
> Hi Tommaso,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> Sent: 13 February 2026 16:28
>> Subject: [PATCH v5 14/20] drm: renesas: rz-du: Add RZ/G3E support
>>
>> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression Processor (FCPVD), a Video
>> Signal Processor (VSPD), Video Signal Processor (VSPD), and Display Unit (DU).
>>
>> LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>> LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
>>
>> Depending on the selected output, the correct SMUX2 clock parent must be chosen based on the requested
>> duty cycle:
>>
>>   - Index 0 for LVDS -> CDIV7_DSIx_CLK (DUTY H/L=4/3, 4/7 duty cycle)
>>   - Index 1 for DSI/DPAD -> CSDIV_2to16_PLLDSIx (symmetric 50% duty cycle)
>>
>> To support this behavior, introduce the `RZG2L_DU_FEATURE_SMUX2_DSI_CLK` feature flag and extend the
>> `rzg2l_du_device_info` structure to include a features field. Also, add a new helper function
>> `rzg2l_du_has()` to check for feature flags.
>>
>> Add support for the RZ/G3E SoC by introducing:
>>   - `rzg2l_du_r9a09g047_du_info` structure
>>   - The `renesas,r9a09g047-du` compatible string
>>
>> Additionally, introduce the missing output definitions `RZG2L_DU_OUTPUT_LVDS{0,1}`.
>>
>> Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from the CRTC output to the DU
>> outputs.
>>
>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> ---
>> v4->v5:
>>   - Fixed RG2L_DU_FEATURE_SMUX2_DSI_CLK to RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
>>     update commit body accordingly.
>>   - Added features field documentation.
>>
>> v3->v4:
>>   - No changes.
>>
>> v2->v3:
>>   - No changes.
>>
>> v1->v2:
>>   - Instead of using clk-provider API to select the right parent clock,
>>     based on the outputs. Just set the correct duty cycle based on the
>>     output, this reflects at CPG lvl to select the right parent.
>>   - Updated commit message accordingly.
>>
>>   drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 48 +++++++++++++++++++  drivers/gpu/drm/renesas/rz-
>> du/rzg2l_du_drv.c  | 26 ++++++++++  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 12 +++++
>>   3 files changed, 86 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-
>> du/rzg2l_du_crtc.c
>> index 6e7aac6219be..cc35dd409e3e 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
>> @@ -64,11 +64,32 @@
>>   static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)  {
>>   	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
>> +	struct rzg2l_du_crtc_state *rstate =
>> +		to_rzg2l_crtc_state(rcrtc->crtc.state);
>>   	unsigned long mode_clock = mode->clock * 1000;
>>   	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
>>   	struct rzg2l_du_device *rcdu = rcrtc->dev;
>>
>>   	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
>> +
>> +	if (rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
>> +		struct clk *clk_parent;
>> +
>> +		clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
>> +
>> +		/*
>> +		 * Request appropriate duty cycle to let clock driver select
>> +		 * the correct parent:
>> +		 * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=4/3, 4/7 duty cycle.
>> +		 * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50% duty cycle.
>> +		 */
>> +		if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS0) ||
>> +		    rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS1))
>> +			clk_set_duty_cycle(clk_parent, 4, 7);
>> +		else
>> +			clk_set_duty_cycle(clk_parent, 1, 2);
> 
> What happens if clk_set_duty_cycle returns 0 due to clk_parent is NULL??
> 
>> +	}
>> +
>>   	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
>>
>>   	ditr0 = (DU_DITR0_DEMD_HIGH
>> @@ -248,6 +269,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
>>    * CRTC Functions
>>    */
>>
>> +static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
>> +				      struct drm_atomic_state *state) {
>> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
>> +									  crtc);
>> +	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(crtc_state);
>> +	struct drm_encoder *encoder;
>> +
>> +	/* Store the routes from the CRTC output to the DU outputs. */
>> +	rstate->outputs = 0;
>> +
>> +	drm_for_each_encoder_mask(encoder, crtc->dev,
>> +				  crtc_state->encoder_mask) {
>> +		struct rzg2l_du_encoder *renc;
>> +
>> +		/* Skip the writeback encoder. */
>> +		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
>> +			continue;
>> +
>> +		renc = to_rzg2l_encoder(encoder);
>> +		rstate->outputs |= BIT(renc->output);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
>>   					struct drm_atomic_state *state)
>>   {
>> @@ -296,6 +343,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,  }
>>
>>   static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
>> +	.atomic_check = rzg2l_du_crtc_atomic_check,
>>   	.atomic_flush = rzg2l_du_crtc_atomic_flush,
>>   	.atomic_enable = rzg2l_du_crtc_atomic_enable,
>>   	.atomic_disable = rzg2l_du_crtc_atomic_disable, diff --git a/drivers/gpu/drm/renesas/rz-
>> du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
>> index 0fef33a5a089..3c20471fdbea 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
>> @@ -51,6 +51,29 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
>>   	}
>>   };
>>
>> +static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du_info = {
>> +	.features = RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
>> +	.channels_mask = BIT(0),
>> +	.routes = {
>> +		[RZG2L_DU_OUTPUT_DSI0] = {
>> +			.possible_outputs = BIT(0),
>> +			.port = 0,
>> +		},
>> +		[RZG2L_DU_OUTPUT_LVDS0] = {
>> +			.possible_outputs = BIT(0),
>> +			.port = 1,
>> +		},
>> +		[RZG2L_DU_OUTPUT_LVDS1] = {
>> +			.possible_outputs = BIT(0),
>> +			.port = 2,
>> +		},
>> +		[RZG2L_DU_OUTPUT_DPAD0] = {
>> +			.possible_outputs = BIT(0),
>> +			.port = 3,
> 
> Maybe use .port = 1 for DAPD0 for consistency with RZ/G2L.

Thanks, plan is to update the struct into:

static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du_info = {
	.features = RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
	.channels_mask = BIT(0),
	.routes = {
		[RZG2L_DU_OUTPUT_DSI0] = {
			.possible_outputs = BIT(0),
			.port = 0,
		},
		[RZG2L_DU_OUTPUT_DPAD0] = {
			.possible_outputs = BIT(0),
			.port = 1,
		},
		[RZG2L_DU_OUTPUT_LVDS0] = {
			.possible_outputs = BIT(0),
			.port = 2,
		},
		[RZG2L_DU_OUTPUT_LVDS1] = {
			.possible_outputs = BIT(0),
			.port = 3,
		},
	},
};

> 
> 
>> +		},
>> +	},
>> +};
>> +
>>   static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
>>   	.channels_mask = BIT(0),
>>   	.routes = {
>> @@ -64,6 +87,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {  static const
>> struct of_device_id rzg2l_du_of_table[] = {
>>   	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
>>   	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
>> +	{ .compatible = "renesas,r9a09g047-du", .data =
>> +&rzg2l_du_r9a09g047_du_info },
>>   	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
>>   	{ /* sentinel */ }
>>   };
>> @@ -74,6 +98,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)  {
>>   	static const char * const names[] = {
>>   		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
>> +		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0",
>> +		[RZG2L_DU_OUTPUT_LVDS1] = "LVDS1",
> 
> Normally new additions are done at the bottom of the array.

Ack, Thanks will go for:

  	static const char * const names[] = {
  		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0",
		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0",
		[RZG2L_DU_OUTPUT_LVDS1] = "LVDS1"
  	};

> 
> Cheers,
> Biju
> 
>>   		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
>>   	};
>>
>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-
>> du/rzg2l_du_drv.h
>> index 58806c2a8f2b..480a7bdfcd66 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
>> @@ -20,8 +20,12 @@
>>   struct device;
>>   struct drm_property;
>>
>> +#define RZG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(0)	/* Per output mux */
>> +
>>   enum rzg2l_du_output {
>>   	RZG2L_DU_OUTPUT_DSI0,
>> +	RZG2L_DU_OUTPUT_LVDS0,
>> +	RZG2L_DU_OUTPUT_LVDS1,
>>   	RZG2L_DU_OUTPUT_DPAD0,
>>   	RZG2L_DU_OUTPUT_MAX,
>>   };

Same here:

  enum rzg2l_du_output {
  	RZG2L_DU_OUTPUT_DSI0,
  	RZG2L_DU_OUTPUT_DPAD0,
	RZG2L_DU_OUTPUT_LVDS0,
	RZG2L_DU_OUTPUT_LVDS1,
  	RZG2L_DU_OUTPUT_MAX,
  };


Kind Regards,
Tommaso

>> @@ -42,10 +46,12 @@ struct rzg2l_du_output_routing {
>>
>>   /*
>>    * struct rzg2l_du_device_info - DU model-specific information
>> + * @features: device features (RZG2L_DU_FEATURE_*)
>>    * @channels_mask: bit mask of available DU channels
>>    * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
>>    */
>>   struct rzg2l_du_device_info {
>> +	unsigned int features;
>>   	unsigned int channels_mask;
>>   	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];  }; @@ -73,6 +79,12 @@ static inline
>> struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
>>   	return container_of(dev, struct rzg2l_du_device, ddev);  }
>>
>> +static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
>> +				unsigned int feature)
>> +{
>> +	return rcdu->info->features & feature; }
>> +
>>   const char *rzg2l_du_output_name(enum rzg2l_du_output output);
>>
>>   #endif /* __RZG2L_DU_DRV_H__ */
>> --
>> 2.43.0
> 


