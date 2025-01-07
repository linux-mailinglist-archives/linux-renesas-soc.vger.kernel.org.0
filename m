Return-Path: <linux-renesas-soc+bounces-11913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B91BCA03FDD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 13:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35CED1888B3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0075C1E22E9;
	Tue,  7 Jan 2025 12:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="M2ISv/Ml"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE7F1A4F09;
	Tue,  7 Jan 2025 12:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254263; cv=fail; b=q3+d7b2edDP0sg2hO2J84lTqf17SSPIgxK5oMY57dKRFUM8KjTkwaBp1jZ7jvBOE1YNlny83A5npTABRRrYBnvxb5CUv2ENiz6uz8r8s7a1zLWS/7BMD+frRolcA2yoX0iRs7vtgFavw5lUSNnrGVNq584yymSIRXXoFgFonnE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254263; c=relaxed/simple;
	bh=IQY7RgtuxElehpjHD9Zofzt2rCSA0Q8gTMz35t1cRX4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KRkPnHgWmO/2eMQh1fsjjdR20M4Hb5yhbH+uXo/tTqYe1WFYpeNAsKCqa+m2wnm0F6R33txmjI4V/d4LOj9OoVJqqGXx1rbeL5ylocQgPaP502IcfU6e91MYpTSYLyKmmsNRtO02Tmj5uspBEyKMvLH0pUzvCjgJm2uJ29P9Y+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=M2ISv/Ml; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJZ4BxrvArsk/lcscVTS3MUZiUZxhJoml7+vHwO1e3y/88dzX1gQCEQdbbP33Zjlhb0GzlLoBQg8QxMXveo7KhYlhwH7mgS4CfSj50cxQIOLu9Bl8y+qa0uOawVzFStD679651HelCV5mf9N6rteXYBnscOBAAetc94H0kTUwpO2ebPkZjPi+YeTIlbHEzBAd7L3CuczRJIKbQNqcCQB67wfjbjQ/3NA88UshmrDTATFK5YrdP2DZZhinspqP61ZntB8KFP5opp/z68BO6zc+AZ5g79ll5RpQNkm+0ULMbNQ2kPUbSK11rp4RohQZNhBxvsejd1gBlIwSqyix41A2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQY7RgtuxElehpjHD9Zofzt2rCSA0Q8gTMz35t1cRX4=;
 b=oq8DVDu9pBKZ3bYIcPIVP1lljrjTecAgy0T015yF5jpka043LNXnqQYQgoIuOy1od8JumtkhRlgy7aBYKJhB+2E68CHWYkL8JNA214Nw/eI8WqorUpwnWHvgpTFveU9LpYIiQoBUpw20dJcW9pE0X2rIxwTf9Jfp8c6XIJD4OmvUflXrZlwcZlUyo91sYVITsCIotXZdyvbcPZXreWEpqyeUuz4HSJe9i+0P1EPtiz+A5D5tBDMQO5sVh0vperm7CseE2GcFJ5v509osIYnt+UxMRKE3HIEaJBxE56BNNpDMYYOZxh5tSwFHMxyjsrw1zD3l3tGi7BiV6rxKnvJLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQY7RgtuxElehpjHD9Zofzt2rCSA0Q8gTMz35t1cRX4=;
 b=M2ISv/Mlxq/vs0xL/Y30fAu9zqI62Wt6fc9GcnaUkPXKS0l6YgZSh34ydD6CQf9zT9vozlYHJ3RtflfDHjHgfdc3X6OV4C8MQFNDYYGf3oTKyEkuplE97HYW53ym33CB8+Hny3Dvc51EGFLMPnq8RaNbNKII54XuF9lntp5sCwA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14909.jpnprd01.prod.outlook.com (2603:1096:405:252::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 12:50:57 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 12:50:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
Thread-Topic: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration
 to per-bit basis
Thread-Index:
 AQHbXULKeQyg6OXyX0+NSgiIE5q337MLMU7ggAAHlgCAAAnwoIAAAssAgAAA56CAAAKjAIAAAbOA
Date: Tue, 7 Jan 2025 12:50:57 +0000
Message-ID:
 <TY3PR01MB11346DD387E860FFC4E51265C86112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346C123E18F61A009F6F0F586112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tO-d35+aPLYoCmC4xKW4cMoNyzM_Vmyw6CzOJjyjj=_g@mail.gmail.com>
 <TY3PR01MB11346C6E247A83F6835F0C7A686112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v3wdwEk9zu26MeQVmOnWKm=RdHJzdH6tLKrvRLeoQ2DA@mail.gmail.com>
 <TY3PR01MB11346E9B6CD4CDB6EF93B99C986112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8uekQ=_KyTnm4vOg+DVXfXm5q9BrEb4Ms1k+je7a9aiDw@mail.gmail.com>
In-Reply-To:
 <CA+V-a8uekQ=_KyTnm4vOg+DVXfXm5q9BrEb4Ms1k+je7a9aiDw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14909:EE_
x-ms-office365-filtering-correlation-id: 4e62dcb4-d0f9-4b28-0b37-08dd2f19ee63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U3RORElQb3dKdHpGYWthUDc1bnN4eDU1RWNjckFydm5CeEJpQnRmS1ZCUlhF?=
 =?utf-8?B?ZTY0ZkQxck8wR1Z5VzRrQmJGUXFKVHQwNGlVMmNNU0MzMkozUTlSNDJ2TDJj?=
 =?utf-8?B?Vmx0YnNJa0l3WitZaGdITStkbkhSUVdueFJ0MmR1Vk9TR0E5azBZU25UdlNi?=
 =?utf-8?B?Vnh1dTczN1djNXE0OUpaWFBxVVBvUVY5NGlnWXBTVXIwMnNScjJyRlN5Z2Nu?=
 =?utf-8?B?SUlKbysxVXFXZ0RzZXJWbU9aVElBYmRxVzNXYzdrU2F5dUNKMzVsdVI1WFpB?=
 =?utf-8?B?bWFPMnNVNy85SkY3NFg3dTl4MlFTMlBvVU50aWhIZXl0SHBjbXNPaDd5dWhD?=
 =?utf-8?B?R1hhWkhvWFR6eVlaVEcybzRtUDNTVWJ2SWF4cFA5b3grYlNERXpuSzRLdUN5?=
 =?utf-8?B?UHlkT3hiNjhTdU5lUlBOMyt4MXBqSHB3bE5heXlpMWxXUEhDdnJmRXdTZzJo?=
 =?utf-8?B?YkVmVzdBUWhrMTlnS2FibGI1cURjbjdpUmVtS3ZvRXBOYjBTVWF0Y2RwYjhX?=
 =?utf-8?B?TG5KUnYreE5zSHpWUnZnNEdxakxNWTY5RG1BWGRiSEZEU2REamFDYy9HYzRZ?=
 =?utf-8?B?dXh6Q1ZhaVpoT3dQbFNtcTBPbkU1dTBTL2xoazJYMTN1V0ExTXQvdUVuVDZU?=
 =?utf-8?B?U0lLdkpQQ0lrQWk5K29Ra3Y1QXE5eTY1WGVlMjRDa012TDFkUlZza0pYWVFo?=
 =?utf-8?B?TUQvRElockVxOW9EZldkdm9mZjlGTVhQSUI4R041T1RFdlFqQnBYOGxqb3Ri?=
 =?utf-8?B?dm5SK0VWOHpud1o5bzR1QW5hT0psRmR0eWZNYVNLc053OUp1OFAvTzV0WWdZ?=
 =?utf-8?B?S0xqc2w3ZWVsZWJTYnhQa2kzMjU4RzFzQ2FRWURNa2dvRGFGSUVLejU3TWo2?=
 =?utf-8?B?VVRTUE5uekp5MVFGOVJNa2ZMd3VCdjRoTHBwTURxajhlc05RWGVwOGNadTJu?=
 =?utf-8?B?WVh1djhaVFBCNVVFeUtEUnBpUFdqeWF0OHRGekhkdlFlNVJ5Sjdsb25qbWRC?=
 =?utf-8?B?VzV6VXlQdno3b3BzV3U2TFJnQ0FFNEN2dHowaVd6SHpvcExsbWhjN3pXQkxN?=
 =?utf-8?B?Vy8zRUdOSGk2aVFGa3phZHhhRjRLMzRTdmNFenFuaVpxdzVyMmpIOTVnV0pL?=
 =?utf-8?B?NThVVWN3TkJPQXVvNW51R1ZBOGFmK2tmMEx3UlFqeWtmcnM5OTFxV0lpSjFR?=
 =?utf-8?B?NTVwSEZod0RiZmxiMThwTTRXeFI0VW9jalUxOHdVeHpPc21RTDB3TGVpQUVn?=
 =?utf-8?B?NUw0Nzlxak05bkZTbzNQamdtQXc3N2dTVTJ4eTMvaVNPSENMZkpHWEdIUXR1?=
 =?utf-8?B?aElQTmY2b1Nod1c3NHplTEM0VFFRbzJ2SXhoOXlGekFIZ0l2TGQxOFZKSDMw?=
 =?utf-8?B?ekZxMk03YmNOUHJWMW9OQ3ora2VtR2NVYy9CYkYwbUJJYzNUWnlacW42Uktj?=
 =?utf-8?B?Vi9TTjN3UlNiLzU1SE9SOHdQVHp2MnB5bXJxWkd6dGs2YzZFbHhVN2JFNGhZ?=
 =?utf-8?B?OG00aWRtdWZEMTdJRm1XUWNGL0FpanRTdDZJZ2VOcGw1RW5KdTE4VlFVRVNH?=
 =?utf-8?B?djQ5MStCbncwUXA5dXNkTWFUUkRxUnp1WUg5MDdmQ1I1NFJ3dDVaUElncitt?=
 =?utf-8?B?TnpKd3piYjI1MnNTRHhLdFIrN2xlaVJYdVJjZ2FreHFhb1loaDA5a1g2Rmww?=
 =?utf-8?B?N3VvcjEzbEtHdGhkV3hzME9GQit6bTY4dnlCTVJwWnZwbno0TmhSWlFFOEVj?=
 =?utf-8?B?c3F4c3pBYlFyWGl1SU85am1vZzBuZWhIdTlmbjlJaVR5RlNWaVpNVDZlZ2pS?=
 =?utf-8?B?TkRjRUlnVlZJeHV3bnV1S0RaaGhQRmgrZlZxMGZzYjlKWUJRMjZFKytXVjZq?=
 =?utf-8?B?YmNPdU5HUXllZkw0cG0xSTVrZ0g3MjlEcDc0WlRLdGZwaXFINHNmQ2RGL3hD?=
 =?utf-8?Q?ZpOG2g0sna73/uuFUVMhEFOg/JXOXvfx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Uk9SK3MrN1NkNUNoSVYxYlU4anZ3ZktLZ2YxUEo3SXlLU0JqVC9hS0tGOFZo?=
 =?utf-8?B?emt5Wk9Nbm85bWVqTk9JUGJldTFieVZmdjZhNWI5c2tVRWsrU096dGV0OGNN?=
 =?utf-8?B?ZDNmbkFhK21GZ0hFaXZFT1JteXRXbDZ6RWxvVzF6UTM0cExnKzlyb0gxa1Vl?=
 =?utf-8?B?Yzl1dmxMSFFrZHg1cVJzV1EwZGxrZVVOd0dTZ3lFSVZqeEhGNHhpNHNkMWZz?=
 =?utf-8?B?WEg5ZW14Ym5DeklUd1VYZ3lsbUM5NG02enprZ08vREYzb29SOGxGWWNBSlFk?=
 =?utf-8?B?K3ptbkRiQzVHUVdMUXAxdHhHWHlwZkFPRlZtejJyVTNJWmFKcUh3WkJENzB2?=
 =?utf-8?B?a1oxZk11QjVXZm1PTFFja0lnVnlWRWtKMTF1a0l5dmJjRDV3N1pPa3hFMnNH?=
 =?utf-8?B?aW9XLzdMTkF1NklqM2ozTmJ1amZhMFJkV0JkaEc4NWs0TEUyMXhVTGd5Wktr?=
 =?utf-8?B?cGFnQ1dKcENkQWdJcDBVYzgvNmVneEZvRlRDWFQyTkY4bXFTYURNSSs1TmMw?=
 =?utf-8?B?ZGxJS1hMOSt2QjdDRkozOGZick80UzA4NUxtNTN2U2RiTEdDVVB4UkVjUGVo?=
 =?utf-8?B?VU5JcndHSDlxRWg2b0tVZmNqNEhGa3VIU2hsV2pKWGY1a0ZWVjl4eVYwVjVq?=
 =?utf-8?B?cWlvbm5tZ0lqUFZ4QkFaYnlmbmFNR0RJUG0zS3hOdVFrUnFBZW8wYU93YTBq?=
 =?utf-8?B?OUltL25NQjFoOGMyYW9rWVk4b0YvOEx5RmhsS1Jyak44K2hFSzJ2bjdockVO?=
 =?utf-8?B?dEZyWkF6SXpFZUZPcGVuRm1DUWFtZ1dqc1ByQjZ1MXZPeThHbkovZ0VCYjBX?=
 =?utf-8?B?dU8rbXhMaXgvWGMwUkVnMmR3T005UEZ3ZjI5VmwzbzAxT20yVjUzbWtjOTJM?=
 =?utf-8?B?ZEF0S1pBRVgzd0V4a1d0N3pjczhiaGhUVWRDTjlGWndod1MzNTNjOSsyTitm?=
 =?utf-8?B?VE00TGtHV1FacjgyNGtXZ0RYK01ONVRKbGM2Mi9UQXZaSEdWTWNjUHlFY3cv?=
 =?utf-8?B?L3FQVlVqMjdadEpQVXNUR0Y4akk2cGRlbHpzK2hDdm9kUDNEcTRCNFhPcU4w?=
 =?utf-8?B?Zy9QWDh5STg4OFlaNHZveFp4aDRlV1FrVFFGbDVWRXdYY0RaUVp4b1pxL0tQ?=
 =?utf-8?B?Uml2R1Y1cVd0azF6ektTekc2WHNoMzJQWE5Na3dYNlBaU2FmbTlCOXZqazcy?=
 =?utf-8?B?U21NaUR6UlJMTE1WTExmSDRSMnpiTjZVcXNTUFpiaDlDMjY1ckpWNUI2aklW?=
 =?utf-8?B?NU5KbUxkOTQvK3QvcFlWWG02enN2RmFyalVKUmhIbEFuNmxCK09hMnJqbW5k?=
 =?utf-8?B?QUZ1bWYwcGJJZVdLK0NTTFZTdnN0c3pSZmJwOS84eEhVZFdISEJ2TStTOStY?=
 =?utf-8?B?RWlzM3BFUkN1c0pTd00vYVdhZFhnQXlSUWN3dFRYelVoOFRLaWFxWm1IMHBE?=
 =?utf-8?B?aTBqay80UjQ3ZnVDcHZvcGRkbVg4c3ZPU0hUWGxBb0tGTHZILzUzOGw3WUYw?=
 =?utf-8?B?WUdKZ0VSMThJc00zYUtGY1pDbm4zdGhhd3dJbVIxempOZnhoSS9PM0N5UXBX?=
 =?utf-8?B?WlFPeVBJYjVZSkE2dTdLWVo1QkE3ZjhXc2djVVAwb3p4U0QzTFpXVmkzYjc5?=
 =?utf-8?B?RTl0emV2VExBY2w2RUV4MGp6OXlaUmZXVmhWZDFJZy9GeTVvVlpPOUtWeits?=
 =?utf-8?B?bFVKWnNJc3lRcFloV1IvSFNpbG01VnljL0xrd0JsYml4aFl4TnZ2Z2pKYzQw?=
 =?utf-8?B?VjhnY2ZNd0ZJSXdrSjA0Zkl4L3lhV1R1K0JUc0FIUXcxWXdUMDJqV2FOZFZU?=
 =?utf-8?B?QnpoY3JxQ1pIQUpMYkZLajF4d0wwZXRKcjhyamZEZitOOXo5bllTM2MxY1JX?=
 =?utf-8?B?MmJZY29OdVhvUVBVbVg2Z0prVERyNW5pVFVMQ1lhVXl1VEl5MlRKNW56TEJl?=
 =?utf-8?B?eGg5SExxQ2wzUVY4clRPbHRzb212QitXSDlEY0E4WUFNWTF0OGN2a0N3UkZQ?=
 =?utf-8?B?K3VqdkxMcUZUZWQ2ZlFKeGF0TGdBUXpxZVhOY05GTXZLOEMyZGZLYkZ6ZzFx?=
 =?utf-8?B?MlFqWGlYUlc4bWk2YzVXdSt2cDB4bWJiTWtWZzNJWjhRbzV5UkUrTHp0SUx3?=
 =?utf-8?B?NUlhS1FIbkd6RkVEK0N6ZGlFT08zN1RNWTlQMThqMDdTM3padVRpSWQwM1l3?=
 =?utf-8?B?M2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e62dcb4-d0f9-4b28-0b37-08dd2f19ee63
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 12:50:57.6603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NZtGTYtIEOEuwVcWsPbMC32KvF066pHo1NvSLMbjl0PXUtmmJO8wHmbeYzoheQu137642rF+jTdb588NlYtH5WxSBEMlAzDM1lGspFg/oc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14909

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMDcgSmFu
dWFyeSAyMDI1IDEyOjQ0DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNC82XSBjbGs6IHJlbmVz
YXM6IHJ6djJoOiBTd2l0Y2ggTVNUT1AgY29uZmlndXJhdGlvbiB0byBwZXItYml0IGJhc2lzDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBKYW4gNywgMjAyNSBhdCAxMjozOOKAr1BNIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBQ
cmFiaGFrYXIsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBG
cm9tOiBMYWQsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiBT
ZW50OiAwNyBKYW51YXJ5IDIwMjUgMTI6MzENCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMg
NC82XSBjbGs6IHJlbmVzYXM6IHJ6djJoOiBTd2l0Y2ggTVNUT1ANCj4gPiA+IGNvbmZpZ3VyYXRp
b24gdG8gcGVyLWJpdCBiYXNpcw0KPiA+ID4NCj4gPiA+IEhpIEJpanUsDQo+ID4gPg0KPiA+ID4g
T24gVHVlLCBKYW4gNywgMjAyNSBhdCAxMjoyNeKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEhpIFByYWJoYWthciwNCj4g
PiA+ID4NCj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+IEZy
b206IExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gPiA+ID4g
PiBTZW50OiAwNyBKYW51YXJ5IDIwMjUgMTE6NDYNCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYzIDQvNl0gY2xrOiByZW5lc2FzOiByenYyaDogU3dpdGNoIE1TVE9QDQo+ID4gPiA+ID4g
Y29uZmlndXJhdGlvbiB0byBwZXItYml0IGJhc2lzDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBIaSBC
aWp1LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gVHVlLCBKYW4gNywgMjAyNSBhdCAxMToyNOKA
r0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gSGkgUHJhYmhha2FyLA0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPiA+ID4gRnJvbTogUHJhYmhha2FyIDxwcmFi
aGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gPiA+ID4gPiA+ID4gU2VudDogMDIgSmFudWFyeSAy
MDI1IDE4OjE5DQo+ID4gPiA+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MyA0LzZdIGNsazogcmVu
ZXNhczogcnp2Mmg6IFN3aXRjaCBNU1RPUA0KPiA+ID4gPiA+ID4gPiBjb25maWd1cmF0aW9uIHRv
IHBlci1iaXQgYmFzaXMNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gRnJvbTogTGFkIFBy
YWJoYWthcg0KPiA+ID4gPiA+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBTd2l0Y2ggTVNUT1AgaGFuZGxp
bmcgZnJvbSBncm91cC1iYXNlZCB0byBwZXItYml0DQo+ID4gPiA+ID4gPiA+IGNvbmZpZ3VyYXRp
b24gdG8gYWRkcmVzcyBpc3N1ZXMgd2l0aCBzaGFyZWQgZGVwZW5kZW5jaWVzDQo+ID4gPiA+ID4g
PiA+IGJldHdlZW4gbW9kdWxlIGNsb2Nrcy4gSW4gdGhlIGN1cnJlbnQgZ3JvdXAtYmFzZWQNCj4g
PiA+ID4gPiA+ID4gY29uZmlndXJhdGlvbiwgbXVsdGlwbGUgbW9kdWxlIGNsb2NrcyBtYXkgcmVs
eSBvbiBhIHNpbmdsZQ0KPiA+ID4gPiA+ID4gPiBNU1RPUCBiaXQuIFdoZW4gYm90aCBjbG9ja3Mg
YXJlIHR1cm5lZCBPTiBhbmQgb25lIGlzDQo+ID4gPiA+ID4gPiA+IHN1YnNlcXVlbnRseSB0dXJu
ZWQgT0ZGLCB0aGUgc2hhcmVkIE1TVE9QIGJpdCB3aWxsIHN0aWxsIGJlDQo+ID4gPiA+ID4gPiA+
IHNldCwgd2hpY2ggaXMgaW5jb3JyZWN0IHNpbmNlIHRoZQ0KPiA+ID4gPiA+IG90aGVyIGRlcGVu
ZGVudCBtb2R1bGUgY2xvY2sgcmVtYWlucyBPTi4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJ
IGd1ZXNzIHRoaXMgc3RhdGVtZW50IGlzIGluY29ycmVjdC4gU3RpbGwgaW4gZ3JvdXAtYmFzZWQs
DQo+ID4gPiA+ID4gPiBtc3RvcCBiaXQgaXMgY29udHJvbGxlZCBieSB1c2FnZQ0KPiA+ID4gPiA+
IGNvdW50KHJlZl9jbnQpLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiBJdCBpcyB2YWxpZCwgY29u
c2lkZXIgYW4gZXhhbXBsZSBzYXkgSVAtQSByZXVpcXJlcyBNU1RPUCBiaXRzIDgNCj4gPiA+ID4g
PiB8IDkNCj4gPiA+ID4gPiB8DQo+ID4gPiA+ID4gMTAgYW5kIGNvbnNpZGVyIElQLUIgcmVxdWly
ZXMgTVNUT1AgYml0cyAxMCB8IDExIHwgMTIgKG9mIHRoZQ0KPiA+ID4gPiA+IHNhbWUgTVNUT1Ag
cmVnaXN0ZXIgc2F5IE1TVE9QMSkuIE5vdyB0aGlzIHdpbGwgYmUgc2VwZXJhdGUNCj4gPiA+ID4g
PiBncm91cHMgaGF2aW5nIHNlcGFyYXRlIGNvdW50KHJlZl9jbnQpLiBTYXkgeW91IHR1cm4gT04g
SVAtQQ0KPiA+ID4gPiA+IG1vZHVsZSBjbG9jayBhbmQgY29ycmVzcG9uZGluZ2x5IGNsZWFyIHRo
ZSBNU1RPUCBiaXRzIGFuZA0KPiA+ID4gPiA+IHNpbWlsYXJseSBub3cgbGV0cyB0dXJuIE9OIG1v
ZHVsZSBjbG9ja3MgZm9yIElQLUIgYW5kIGNsZWFyIHRoZQ0KPiA+ID4gPiA+IE1TVE9QIGJpdHMu
IE5vdyBsZXQncyBzYXkgeW91IHdhbnQgdG8gdHVybiBPRkYgSVAtQSBzbyB5b3UgdHVybg0KPiA+
ID4gPiA+IE9GRiBtb2R1bGUgY2xvY2sgYW5kIHNldCB0aGUgTVNUT1AgYml0cyA4IHwgOSB8IDEw
LiBJbiB0aGlzIGNhc2UNCj4gPiA+IHlvdSB3aWxsIG5vdyBzZWUgaXNzdWVzIHdpdGggSVAtQiBh
cyBNU1RPUCBCSVQoMTApIGhhcyBiZWVuIHNldCB3aGVuDQo+ID4gPiB3ZSB0dXJuZWQgT0ZGIElQ
LUEgYmxvY2suICBUaGlzIGNhc2UgaXMgaGFuZGxlZCBieSBzd2l0Y2hpbmcgcmVmY291bnQgb24g
cGVyIG1zdG9wIGJpdCBieSB0aGlzDQo+IHBhdGNoLg0KPiA+ID4gPg0KPiA+ID4gPiBJIGFncmVl
LCBEbyB3ZSBoYXZlIHN1Y2ggdXNlIGNhc2U/DQo+ID4gPiA+DQo+ID4gPiBZZXMsIGZvciBVU0Iy
LjAgb24gUlovVjJILg0KPiA+DQo+ID4gT0ssIHRoZW4gaXQgbWFrZSBzZW5zZSBmb3IgcGVyLWJp
dCBjb25maWd1cmF0aW9uLg0KPiA+DQo+ID4gPg0KPiA+ID4gPiBDb25zaWRlciBhbm90aGVyIHVz
ZSBjYXNlLCBpbmRleCAwLCBiaXQgOHwgaW5kZXggMCwgYml0OXwgaW5kZXgwLA0KPiA+ID4gPiBi
aXQxMCBhbmQgaW5kZXggMCwgYml0OCB8IGluZGV4MSwNCj4gPiA+IGJpdCAwIHwgaW5kZXgxIDEw
IGlzIGFkZHJlc3NlZCBpbiBjdXJyZW50IHBhdGNoIHNlcmllcz8NCj4gPiA+ID4NCj4gPiA+IENh
biB5b3UgcGxlYXNlIGVsYWJvcmF0ZSwgdGhlIGFib3ZlIGlzbid0IGNsZWFyIHRvIG1lLg0KPiA+
DQo+ID4NCj4gPiBJIGp1c3QgcHJvdmlkZSBhIHJhbmRvbSBleGFtcGxlIGZvciBhIGZ1dHVyZSBJ
UCwgd2hlcmUNCj4gPg0KPiA+IElQX0EgcmVxdWlyZXMgbXN0b3AxIHs4LDksMTB9DQo+ID4gQW5k
DQo+ID4gSVBfQiByZXF1aXJlcyBtc3RvcDEgezh9IGFuZCBtc3RvcDIgezksIDEwfQ0KPiA+DQo+
IE5vLCB0aGlzIGNhc2UgaXMgbm90IGhhbmRsZWQgYnkgdGhlIHBhdGNoIHNlcmllcy4NCj4gDQo+
ID4gTm90ZTogSSBoYXZlbid0IHNlZW4gdGhpcyBzY2VuYXJpbyBpbiBoYXJkd2FyZSBtYW51YWwu
DQo+ID4NCj4gWWVzLCBuZWl0aGVyIGRvIEkuIEZvciB0aGlzIGNhc2Ugd2Ugd2lsbCBoYXZlIHRv
IHJlLXdvcmsgdGhlDQo+IEJVU19NU1RPUCgpIG1hY3JvLiBMZXQgbWUga25vdyBpZiB3ZSB3YW50
IHRoaXMgY2FzZSB0byBiZSBoYW5kbGVkLg0KPiBJJ2xsIGNyZWF0ZSBhIG5ldyBwYXRjaCBvbiB0
b3Agb2YgdGhpcyBzZXJpZXMuDQoNCkkgZ3Vlc3Mgd2UgY2FuIGFkZHJlc3MgdGhpcyBsYXRlciB3
aGVuIGEgcmVhbCB1c2UgY2FzZSBsaWtlIFVTQjIuMCBhcmlzZXMuDQoNCkNoZWVycywNCkJpanUN
Cg==

