Return-Path: <linux-renesas-soc+bounces-24547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D75E7C56DFC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 11:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28C813B1B44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 10:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2C4330D24;
	Thu, 13 Nov 2025 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lx+EcBYx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E228F50F;
	Thu, 13 Nov 2025 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030017; cv=fail; b=LMPqxv9FPQe9LG1MW+7XC4OgP/r5b1WmjGDJ1u1IqCt2tRc2KHfDStz3VnXPZsycBbGYygrfGCrsE8rP72nv+3AXgfTqiXB7efnGWYKpTjOWTE+xh+j0z21amd1wnze/+pdgK03PErnjwQsw7b8YCjv85euNh5TQFl0YbLMj230=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030017; c=relaxed/simple;
	bh=jKmIuh+xbGTwWYjgX7rEkCO2SjLKSgNIywWNijUsvuc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AzBRmpVuedQTqvoFD1fOj4JgMvsYlSLpc14UnIQPEEIjmTFw+YUHX+wNxt8HxELjS7dlgf2hH/F+8G78lD3SaYR6H4jY+ZBIWex9MfrOHvNgv6Pz6Q0IsQ4VQd2i9CU8NS+qGdcrpUkXTO0oMNNYiwJdDICElmMVHMcTrpG9+0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lx+EcBYx; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4xf9zUrKC7nG6jggyLe4orlqK+No6EUEEwjNRuo1pe1gybiOhk24bDl1uOuYatVu1addtrIgmEVuLGIKDQBaLXb9a7p1gcfnv8MKRZUvEKCHZ4Yi80D9+MfSP8LMBL8buqnumajlWc8ltSDdEQ/ACw6Ovs/CKV5r9i+wtzBe3zbhToW5+5VVOqj5HYPGdQJR2Ip2SV+xFB7fyjQvo9qOArMCc9QJyE1UloNKo71vTsWD6vi3subY2vBQ3b6PNodXanRIrlY7vv6P3+aZ4CaqwRjehlNX1LyuEX3TCQmPHEN84TP0yDJSiz/WmIXmcB2SFJ2wTfIMSsNOGs+ezJ9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKmIuh+xbGTwWYjgX7rEkCO2SjLKSgNIywWNijUsvuc=;
 b=l/CF8Ht9iERCcvD8stnAnOzDPI0eWGqeRnWRSznJ9hSGrGuO4K/3C09es1+MNdMS6IHLBNv7dubEHKs3OXZGBD/osy3m8eLMVsIBTPuVkhv3lc8NjSRfXLR2F+U3g5Ia03LVOnad/fotDFXTUc+oB2gbJcQKdEedMY1fnXVKmE2aZA0ild1yF3o9lfJGMaesa1SehD7FNSHkBpp3/EB4Pl/4ns4O8XfDJEIppSYYlqKHjMOT9G+qevkQFUg8mAMj7whQvAU4aYjiTfWGGkj3pJlLzJ7zipa//CzZFwSdLS6iOIE6YKuo/RoKed2n//d7yZ/3pExw8w6D7SGzQE73zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKmIuh+xbGTwWYjgX7rEkCO2SjLKSgNIywWNijUsvuc=;
 b=lx+EcBYx6QLGgA9n4ZDo15aA+4ZF8w1OWVHWDnG9K2ieBbyjsEVlv4aiPBTcXz7grxrNsWDGEFjP9CEyzj5vqnjTZOPlRhOljN1lmoaQWNK4rbVQHtTUL2xLu9kxvoM71djcsxUnB+TZs1vfOrfF6fDd8cUUTzZ7AxGRtlZehaY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11984.jpnprd01.prod.outlook.com (2603:1096:400:40d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 10:33:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 10:33:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH 3/7] ASoC: renesas: rz-ssi: Use dev variable in probe()
Thread-Topic: [PATCH 3/7] ASoC: renesas: rz-ssi: Use dev variable in probe()
Thread-Index: AQHcU+rS4kOsewXAz02dZeNXIygPcbTwGvcAgAAkq6CAAAzsAIAAHRew
Date: Thu, 13 Nov 2025 10:33:29 +0000
Message-ID:
 <TY3PR01MB1134642CDDC50ACE32250020686CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
 <20251112154115.1048298-4-biju.das.jz@bp.renesas.com>
 <87bjl6wkf6.wl-kuninori.morimoto.gx@renesas.com>
 <TY3PR01MB113468318B32BF2E23953198586CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdXqBOpczZ-Kw64AQODSh0Q8HEAzBseUjwD7TO+dKq9==g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXqBOpczZ-Kw64AQODSh0Q8HEAzBseUjwD7TO+dKq9==g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11984:EE_
x-ms-office365-filtering-correlation-id: 4307edcb-c50a-4ba2-8ffe-08de22a01652
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OHU0TnBOd01EVzNrWHc1bTUrZ1p6NzQ0bmtlbHE5R0hLWEw0RTBGczA5TEk2?=
 =?utf-8?B?SEFJdythOHlSeDdCa0tJMzZDbXdBSVdIT3ZNVzNtSnhVcXZ4TDdWSDZ3a0NF?=
 =?utf-8?B?ME1MRStkdHp2cHNTdkZoT2NqcHJDQStvZ3RHNWY5SU5OaFpvR3Z0d0k2ckJF?=
 =?utf-8?B?UDVDcFRhZ0w2SDVGTVV3K0ZpbHZNdHFsMHFxL1NjbnZPWjEvWDIvL0pPbFho?=
 =?utf-8?B?aXM4Z1UycDZJRk1ITjc3cG50eXZDczNaZkdXRGNpSWFGVkw3Snlwd1dvOTNr?=
 =?utf-8?B?UTFzeGVWc05WWFlNdVI4Ymk1UDJwbDRySnJQbDl2MFU2NDMyVFlxUmNuOUtm?=
 =?utf-8?B?VnV6UDYwS1RDQ1MzWEpIREF0MnFkeU5oRDV0bmFjVlVyVHdjZ0dlQWZLK3c2?=
 =?utf-8?B?c3ZvQWd3SHBSSVI3ZWphOTdiZU8wcFJOcGdnZ3B1cTVqTlo4YThLUWdVTkxO?=
 =?utf-8?B?YXNDcEdZbUIyV3NxSzlrT005eStFc3JMaHpacDhZeVA0TmIweUU5enFYbm01?=
 =?utf-8?B?ZGp2S0liR2JFU1Zkd29nekl5Vjd5Wk00OTM0aElYS0Jjd0tzeS92QnZBZFlG?=
 =?utf-8?B?aEtvVGVNK0lBQ212WFZJSWZXekZKVzFvY0t0bXNLUU12YlJBQmwyN1psd1Ra?=
 =?utf-8?B?MDNLM3pHbW5OcndhUmdZS0g2QlBSOWR5bVVaRmJYMEtkSWZ5N2RhcDlzLzBx?=
 =?utf-8?B?N3pjWmdOaDZNM3VFdTFmb1R2OVZyS3JRQXBuVlplVlVDNTAzSGVLR2U0bmNR?=
 =?utf-8?B?Mk44ZHdmb3IyTjRYM0hKQ0VucUY5RGl6WmZyaHd0ZmFLNS9uZDUyTUdPQ1Mx?=
 =?utf-8?B?T1RoVGp2eSs4OXl6ekMzcm1UUWFINlEvRmxGRm9PSVNNa3B5SjdIZFFveDM0?=
 =?utf-8?B?Tk9VNVUyT01zMHZxQXBPa20wOUlDeWVNWVNNTXRBZHNiMUJQaDFObkplMERT?=
 =?utf-8?B?dk1yNk9jVEowTGNSNzhJN2ljRnZ5d3hxT2FRdTJpTjg1dS96NEJrKzBaK0FT?=
 =?utf-8?B?bGFpT0JzMlNwNFBWcmVYQ3Nib2g5ckhYM3NCMDc3Wi9KU0dmMDBoOVkzYW9U?=
 =?utf-8?B?dC9Vc2RqWWxKWFRZU1V6a05NSzRRb3oyZzNaWlZwZTZieWhjQjZSaGlhRjU1?=
 =?utf-8?B?cFRGM3JRUzRhOUpaVGlwbjhzcGZaQlpNbTVYVTVYUVNCaER5VElIWGQyWWxY?=
 =?utf-8?B?VW5UYVRZNU5CQUZmQkFVQmdWL1BTWnNvaTNZbkUwYVJHcU5xSXVjVTg2OUh5?=
 =?utf-8?B?YnIrZmIyNlhWN2kvUWx6dEk4YXFBSnc5MFp1ZmpkQmtob3pRUVQyQVRqbzdK?=
 =?utf-8?B?alBOWE1EaWhuT09STzR2aWlZZzZqR0dDSVBKL0JPK2pEdk1WZmUvN0Z2MCtP?=
 =?utf-8?B?cGg5MWhlcEFVamhqNThaaFJWWmhpdFBIREhNS09rTmtXUzFPRlVzZlIyWnVS?=
 =?utf-8?B?SGtJUXd0WVhmZjdoQkVqUW1LRVprbkJNSjliZXJPYzY4Vk5jUDJ6eFlrRWUz?=
 =?utf-8?B?UlhnTTR3TFJHWlRUNERsWGJ3YzhoMWU1MTlBaUxjU2lRTXR5cllxeDR1Q0Qv?=
 =?utf-8?B?dzEwdCttMExrblUwZklsdzZuZ3hIR0EzNkFHVkVjM0dDU0lsb1NOM3k0alJw?=
 =?utf-8?B?enNzVk5DNFBYNXh6MWNTZWpzUkxLZlVOeEhIUUwyYi93SHcwazRQN0N3akZ6?=
 =?utf-8?B?a1dHcmRjWkhLejFKeDBINzVrRWpiaklLYXF0eC94bG85b2c5dEpaVzhoYSsw?=
 =?utf-8?B?ZlhqNmhkOWdUNFlkc2NPMEphOGhHakZjTkZiUUpPd2xweEF4dGZIYmZhMFZJ?=
 =?utf-8?B?aGh0eHI4T2NpL1JSaWQrUkxRb2FVRHcwZnlmR2tEeUR6bURSRFlkaTNYamlS?=
 =?utf-8?B?Y1RPd2hHQ0MwSElJQ2JtR29yOC9LV3RoQ3ViZVR5cE5FNUN5WUVsSEZJbFQx?=
 =?utf-8?B?S3ptbk9wanhJZGlITWJUbXFxMTdxRWptTUNmd0M4aEIybjBRRFBlNmJLOW9Q?=
 =?utf-8?B?dklzT2ZlMXRiVGJ1eUNiS1pjUHN3QzJHQU93M0FHM0RSUkZJZjZJZWlHTWVS?=
 =?utf-8?Q?OqARgt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anBDMXd2dTFPUWxzc1ZuUjlDaWNwUnJxd2N3WUdFRGZjdldOdEJUSmFFOFNQ?=
 =?utf-8?B?QS8ydHVEQ0c2Mm5aMWFsaFVzYmk4MlUyMGx2YTFFemtGZlA1YVJOZ0tudWxL?=
 =?utf-8?B?Mkx5T21ta3ZBM0ExVFRNK09kdC82Mzdic1dscy9hSEg1TEh1d2NwMXVLdm1z?=
 =?utf-8?B?RmM4QUl1YktGNFZLTHZxQlpTcEpkQXliRVEzM0c4dUpmYWxaSnR5WnFFMG9h?=
 =?utf-8?B?ZC9kZzZmVjFyeEhPeThjbmJzZWowRHUzeUk5clhMM08vZk5wR0J0NG90dnAr?=
 =?utf-8?B?Ymx5dkQ3OHIrYTg3Zlo4dEVsbFMyZDJTaGhHSXFON2dOUXlxU2pDVEljNGN0?=
 =?utf-8?B?RXBIL29GMGZZLzIzTFZoY054cXdRdVYvcER4aUdkRXA4ZUxCazVlNHlHYTRy?=
 =?utf-8?B?YTVMakdHN2grbDY4QzQxL0R2VGRBdGFQY1owS0RpY1VRMjdETGZKV00yTUVC?=
 =?utf-8?B?R1JtUU4xakpTWnJqNkp5bmdsZ2FDSjJlbXpsL3NkRFh2SUNFTVVveVJPWDQ1?=
 =?utf-8?B?Mk9KNURNSFJqa3FFTjc5YUJXdWVXMGhLanRvbE1FQm1jOEpkUUNXZ1RGNnl3?=
 =?utf-8?B?K2NBZ2U3N0wzMGxKamZjY2M5TldzZWpKRHBKSHFaQjFadThEb0kzRU5HeWNm?=
 =?utf-8?B?aGNhT3ZhOWoyMVcrdjQ2aU41b1ZUMld2R1hCbkxYNGRka2V1T0xEUEl4OEJI?=
 =?utf-8?B?S2VJSlY1bkZiT2Z5alo4cHh0MlNxeStKblk1RDBRZjZHSHFQUXhRdlpkR0RC?=
 =?utf-8?B?TEt4ckp3cmtvemZPckpDT2VPTGhuTXFHYUYzUk5DS2IxS2VVTDdRd1hwdlFV?=
 =?utf-8?B?UjRJVGdhZmo3VmM1SWJqdDhoYjZVQ0lUK091WDV6UXhpVTdzdmpmZStzdFpY?=
 =?utf-8?B?bkVuSU85RUF3WnBkZUNQcmVma0JNbVo0cUFmRWZNMU1KVHlPV3RNWSthem5Q?=
 =?utf-8?B?WGRwSjVxRitrRGtjMWdMeUtOa25LM3NZVU05RmpyWXFyMHVNeU9RVUkyR1RI?=
 =?utf-8?B?cFV3Ry9CZXArSE1XNWV4bFJBWDMxRzQvanE5ZEwrTnhmcVRoRkZ2aEhzSVB5?=
 =?utf-8?B?SHFvMnNJN0RPRkFrTGM3UW1xRG1GS2tWUTA0ek5LNGd3TmpBSW4xQUw5bDRu?=
 =?utf-8?B?cldkbldYYUc1aUZpYXB0dW1zWkRUWjdrQnBidFlwbVVqeWxwTURNdlBXalpk?=
 =?utf-8?B?Z2RMbVpqMzcxWTZqbjJJZ0MrbElmS1FNRDlFdU1SdzVqcDhOWVRCMnV4MEQ4?=
 =?utf-8?B?L2svV1RnZklUaCtva3RXaDhnRzBhRDN0M2VCTkl6SnlFVGZXNGdKOVdBdUdP?=
 =?utf-8?B?RWlwMDRMQ3JRd29yS2RCc1J3ZjNaS0s0VnI0c3VhSXUwdXZxRzg3YkVsTCtq?=
 =?utf-8?B?QU82eUNSRTZOV2psUUtqZFFPV2N4Zm5LY2JuTHFHY3BhZXFHbVp5dGtpMmRi?=
 =?utf-8?B?dGFWVmQ2OEFURjFZbTczRHRUNW9ISU9RUnBVcU9EMW1vNklSTDJVclIrWjdI?=
 =?utf-8?B?SmNvV3lNSkRldnpYUzE4R00xZ3hFcGhOa0wwcmo1bVVrZ2xsdHdOL0xOeFlP?=
 =?utf-8?B?RURyOE1BbFdLdDM5eDRsYThzQTdvWEtVQm9ib2toWTZ0NFNFWENZeisyelQv?=
 =?utf-8?B?REtIZU56Wjd0VTlES25aNUJzV0JtR1FlZGh2NXkyWTl6SlNZamJrZmlGQlhu?=
 =?utf-8?B?Z3k2cGpGQm5yQTlZNEs0blFKdDhkTHNqTkRkbHBvWjE0SUJ1U0xxSGNlQ0xz?=
 =?utf-8?B?ZCtkYkhmNVVYV0xqZlprbXlQZWhtWW9oUEhwWnpqZnlFci9GNXdCMUNEYnk1?=
 =?utf-8?B?RkhXemJVWWpCTWZUOTB0WWhKeVdmZXk3NzlHSVhHSTQ1NFZ6ZVB0clg2UGNz?=
 =?utf-8?B?MVRmaEhrRFNKWEI0S3hmWm8wdmd4Rnc1N1NtS3cvNC80RUJzUnJTRHBweDJM?=
 =?utf-8?B?NG1ld1NjSFNNV0ZHeE9jTlRYWEdtcG1NaE9Sd3V2dTV1dEFFOGR6V3pRam1S?=
 =?utf-8?B?cm9vT0hDTXJVY1docW1iVmlQTHRHalhtbitLbSs0YUQyRDJiUVEwcWxvQ29R?=
 =?utf-8?B?SDZ2T3pQM254Y3Y4M0xnelhDc2VnTkYyZkVaek1icWNvZGVNWlVkeXJWUDAz?=
 =?utf-8?B?T3o0VW82cy9GWi9GWDlPME1DZUFlSkkxb3Z4S3JRcVByRXlTazdqTFZFYTJM?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4307edcb-c50a-4ba2-8ffe-08de22a01652
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 10:33:29.7535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sj6IRFIWWa5j5IxPklsT+VPy711zbzbcAaPDg3fgLe8q6ow1xPn4F8mc5Up3iTq2zTGMM+GcuXZf4CEExh4955kFC6p7IaBe13v0jhMdkZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11984

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEzIE5vdmVtYmVyIDIwMjUgMDg6NDgNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAzLzddIEFTb0M6IHJlbmVzYXM6IHJ6LXNzaTogVXNlIGRldiB2YXJpYWJsZSBpbiBwcm9i
ZSgpDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCAxMyBOb3YgMjAyNSBhdCAwOTowMiwg
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206
IEt1bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4NCj4g
PiA+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4g
Pg0KPiA+ID4gPiBSZXBsYWNlICcmcGRldi0+ZGV2Jy0+ZGV2IGluIHByb2JlKCksIHRoaXMgbWFr
ZXMgZmV3IGVycm9yIHBhdGhzIHNob3J0ZXIuDQo+ID4gPg0KPiA+ID4gbml0cGljaw0KPiA+ID4N
Cj4gPiA+ICcmcGRldi0+ZGV2Jy0+J2RldicgPw0KPiANCj4gV29vdywgdGhhdCAiLT4iLXBpcGVs
aW5lIGxvb2tzIGNvbmZ1c2luZyA7LSkNCj4gDQo+ID4NCj4gPiBPSywgd2lsbCBmaXggdGhpcy4N
Cj4gDQo+IFBsZWFzZSB1c2UgRW5nbGlzaCB3aGVyZSBpdCBtYWtlcyBzZW5zZToNCj4gDQo+ICAg
ICBSZXBsYWNlIDxmb28+IGJ5IDxiYXI+IC4uLg0KDQpPaywgd2lsbCB1c2UgUmVwbGFjZSAnJnBk
ZXYtPmRldicgYnkgJ2RldicuDQoNCkNoZWVycywNCkJpanUNCg==

