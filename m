Return-Path: <linux-renesas-soc+bounces-23948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95324C2384A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 08:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5C35189BCD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 07:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E81C329363;
	Fri, 31 Oct 2025 07:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bO6UaeUY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA971FF1C7;
	Fri, 31 Oct 2025 07:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761895020; cv=fail; b=W3Z2vKcziyRYpxKcUL4lnzjYIiFjgj3/L4cJjxAHJxn/0uZSEpJ7Wn3a1UwvbTF/njkegKuVFDbYlVcxWPdPsEDi9nDvs9FtG4b/6LKLxRTHzXr4zjMe3t0V5+xBaoxHBcyIriLZyEU4Nq0rq9hw/TOTACnNf5yjibSLeVmb8HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761895020; c=relaxed/simple;
	bh=UPhHKoZXsASD7vYi1AuKwk7NvXr37cJgwTLBJn+KLj0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mrkZ3ccNvbylHcBW0vqPoss1+lXFA/p96KqVbtSWXSZYkhvqX7yMjfu6u/eQZOdnNZrJrmCDDNQjY0oXsejfx/wGCcMsRXewkA3lMW1V50KeYk0XJ3hG9pIntKVOSCgzzziX5GBuMJU735GTKIoiMegQ1bs1VXztChT1m0Tc440=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bO6UaeUY; arc=fail smtp.client-ip=52.101.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0Xq1FDzvEC3kg1iQXpvD9WHpxEPrQK//U50K8jlqmaFC0gBaS/Itb2R5Rf+11jYtQbujSODrUzoGAJILt6JyFxuq0Pjfjyv51M09i89IA+GZGB//+jSKcpo+o6UGL4ozyXw/oO3B6D0F1FJN5VMUj03tou2gLyU3YRYFEu1gq5D4BjnQlA+xBl5gGK9M5NR+pzrOlkc5syVxdH0/Xy50viocBAY9lvB6ySQfY+YD+ji1iGkLjAMIHV/VfUWkY0iWont3tLqwdIn1H/CsIf89afrMCY9t1/MCI5CXt+tvfTtnlRLsCfKBabnXKIdFfYWgEBTe7gp44NU2M+138idKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPhHKoZXsASD7vYi1AuKwk7NvXr37cJgwTLBJn+KLj0=;
 b=bacTSEJ8ovcPWxJyrHCaVyoBi2s7MH6oOFLWb3pM3eQNSOuajnvCt+URZSCriZ1h9BfQpQ/PtL67RJdx81096cuFjRhMYYye4jMSuRSuPtmP8X1a2+0d83KO09fU8gY1cA5/FVvzyDqmoLoxWSLY5CBXAuF+lsRlffKyhIBAAsDI49bDpPdgJFCqzxet7n95W5OZDTsdwEsKcAkH2bNYHC4ZG7jSHBbnpKjOYgOZd3stI7lBo968PnE/4nZBJjZXw5fhz4fHnveFB8C1ARcXgO9REP+6ZnyCEnSRk3oi5VNvHYu5xhwsvJzo2cbdUeB5E8Xc6tkaTeS5T3wofN/jgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPhHKoZXsASD7vYi1AuKwk7NvXr37cJgwTLBJn+KLj0=;
 b=bO6UaeUYW/82kJS7l+y9NMwL3BHL3UvgG/zKQRJoY44hd8ZeYzroUQ3L6KRNlXV1sYvG/J63QX2WLaHn6jvKw6cNRzGL7ui/KtUWbNz9Q3cfN7DdGJk4qNKmYMol/0NiMwpiYi+17FcC0WiozaBIWHBxWdfcy9Od1ZfC3LL4LME=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11904.jpnprd01.prod.outlook.com (2603:1096:400:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 07:16:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 07:16:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jiri Slaby <jirislaby@kernel.org>, biju.das.au <biju.das.au@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 12/13] serial: sh-sci: Add support for RZ/G3E RSCI SCIF
Thread-Topic: [PATCH v2 12/13] serial: sh-sci: Add support for RZ/G3E RSCI
 SCIF
Thread-Index: AQHcScbL2JITDi0vh0egfmIXcHsucrTbsFUAgAAoC5A=
Date: Fri, 31 Oct 2025 07:16:52 +0000
Message-ID:
 <TY3PR01MB11346585ED62E65396655EA2A86F8A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
 <20251030175811.607137-13-biju.das.jz@bp.renesas.com>
 <19a08b75-13ca-45f9-884d-f96602336dfd@kernel.org>
In-Reply-To: <19a08b75-13ca-45f9-884d-f96602336dfd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11904:EE_
x-ms-office365-filtering-correlation-id: ef8769ab-2200-4903-5d2e-08de184d7716
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Mk83Z2ljT09XekZ3SWhnbTBoREdyUkpadUU2VzB6R3F6bURZVzVBY0UydXRH?=
 =?utf-8?B?MGFnTmgzYkxlbTZwc1FSemxYRkJybjFTaVVvZ0xkNWoydDF2aFF4cDNMZkM0?=
 =?utf-8?B?bEcrNmRnWG5CMHlMeVRGdUZLOUNFZi9OeE4zekV5QWRwZ2ZLZWlTSklORGFi?=
 =?utf-8?B?bS9NRStrWG5oNEZLU085WFAwS1N3YUc5UjRORjZRTUUwOHJmT3RzT2FHMHdK?=
 =?utf-8?B?WFAxWk1ZUlNwNHhKa2lOSEYzT1k2VzZCVFNQK1FVVEZPMzVkYkV6TVRMeUJv?=
 =?utf-8?B?eUJhRGNzUTY3dXIwQlJIYUp6VlU4eUh3dm1zd0xUbXVZbDJUVmtvSm1IaWxD?=
 =?utf-8?B?Z0tVTDBnbCs1OTVmbXl3d2hRS2VNYWh3ZGpVSEQwOWxUWkErWkI1OVJraWxJ?=
 =?utf-8?B?NmU3SzVJSGJlQysvSDFFVXl3WkpoWmJMSFQ3SXJ2ZWR4dCtFOGhOKzN0MXhO?=
 =?utf-8?B?cFlwcFRocWpibW9tbHZSeGdFSjBQcFB0WmNDNGFDdHNtajZaSEJ4ZlhwekRH?=
 =?utf-8?B?Y2F5Tlk1MHZNa2VvNHlTdGFLWU52YjdHNWxiQVFHY2FjRUV4eldBMmlZdGwx?=
 =?utf-8?B?eW9xQzhEL2hDbHZFOUtxNHF3Q2NMTGlaQTdqVVNWYXFJWDhIOUZiazdrOVVH?=
 =?utf-8?B?YURhc1c4MGJwY3h0UUROOVFqbUtRS2RyQVRYN0V0aU9pV0lDajVVZzRVN1h5?=
 =?utf-8?B?dUdCMmFFa29ObjhHK1c4VllhbGlRUU5RZHRwMlBBcVUwVEZmMmd1MjNQUERs?=
 =?utf-8?B?QU84dFdJMTR1WlJwRkRnSjE2TmMxd1d3UGQwYytxTWJ3R0UxSXhuUzY1eGJO?=
 =?utf-8?B?THJ4QWJmVC81MnFsSndkZE5BVW8xSi90L3F2YXJUOG9ZOVhGaXlWNFo1TEdr?=
 =?utf-8?B?NTEvY0ZiYVFwTVMzbEN0L0t2c1B1Y0R6NFpOV0hvRTNXL2xhQ3FjTnZVQ3J4?=
 =?utf-8?B?TjhuNW56cjhiRnl5NW9OYTNHaGJqY28yMEFlaVlLbkpCaUJ3MS9WMDliVGo0?=
 =?utf-8?B?T2JHQ3VTZ0NyTkIrNXhZQlNPV1M2SUFSWGdoaGVVckEzNDhCcS9VaXE2LzlJ?=
 =?utf-8?B?MU5wZ0V3OGlWalcvN0RPYTdSb09jU04zUVlTa1I2QXprRzVoMnZpanY5Tmd5?=
 =?utf-8?B?Zy90WlppbXVvQVZzVnp4YVdmRlN6MXpLM250SXpZNEwxa2NKM3llR0E4R1Zn?=
 =?utf-8?B?ZEdXOTdPMzRTc1Bmdng1SGtiWEMzNnk3MkxHQlBYMzRkR1ZNZjBOdk5nT09a?=
 =?utf-8?B?bFUrMlZzY0tBUUhSMG5CQ3J4SVdUQlhlQkRIcW5YZm1QbW9lK0xGZGw1Rzlx?=
 =?utf-8?B?Q1dCQ3Z6bEwwN3d6Qk9ZakswVkN5K2IyMHFZeEVmcFo1OWdremZqRGt3NjJm?=
 =?utf-8?B?N29nVUlIU2ZoQmpJajRMSUwySGhEMnFkbGpTeXppaE1jOEpxS3l2RWxqVVB0?=
 =?utf-8?B?c1Z3R2tlWjJkVzdaMW9tT3ROR3k0U3BsNERsNG0zL2t6bzVqQ3M2RlowRXFi?=
 =?utf-8?B?RkVST1FaSHBFbHpFYUlNdUk3MHh4Tk5jRmpUSXlQQVI1WmcwbnM3LzU2OVN5?=
 =?utf-8?B?UC9sZ0R0THA0bXJnTE1FaGhYVzRzRW9CQVVNT1FXcnh0R1NCTkcvRGd0RVVl?=
 =?utf-8?B?dHNkcWhObm5HYlJoTnJUSncwMUtIQ3htMjYrdU5SQ2Vvb05HcGFwa2Rqc3Zt?=
 =?utf-8?B?SWkxbGg1RWkwd0RWeGczQkU1dmZ3Q21kZkVwRHZBUk9pTElvdUprYUl1RnFR?=
 =?utf-8?B?QmlmenZQUTNPcVZ5QTdoVll1QnVNbzFweTZQN2x1YTZGK3MzbXFiQXlVZDBl?=
 =?utf-8?B?Lzk4bE5zeUdJaVgzc0FuUFBrbU9wU0l4SzQwa28xZ3MyMTNDLzVEa292Nms1?=
 =?utf-8?B?R1p6SWd5Yit0U0ZydkZxVmgvWmJnYlU5S3VORjQ5NWhzMjh4OXRLdzVrczgy?=
 =?utf-8?B?VnF1K2g0Y0VPTGNRQ0xWUjN4OU5Yajl4RUhRMXZuYjBhV2MrK1lxWEpmSGo1?=
 =?utf-8?B?L2ZZRHVsZTBWZ0NWS3J5SUsxVkNxa2o2Z0tKSUNIQy9DYlorSjdzQjNFODRI?=
 =?utf-8?Q?bnWAA+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGR1Z1N6YXVvK2kxMXNKL0FuNlNJNDF4WmYvM2pGaXl1ZTlNa1paVFQ0dnNJ?=
 =?utf-8?B?cXV4amJjQ2NieEI2TS9vQjlaa29WSmhBRjc5dWd4MzNaM2FuTEFsU3hqSEU1?=
 =?utf-8?B?QlVyVVdqcVJCTk9RcVhTUkxzb0NuaW9BN3VpeTU1bzVoL09vK1k5S0dZcS9Z?=
 =?utf-8?B?VSswUzJINE9DanFzU005ZGZiZHg4SkpGeVhVeEg5WEZEaFRUenFXZ1BUWG02?=
 =?utf-8?B?T1M0dm5XNkRpOFJKODBKK0I3aDVLaDlHdnRva2M0ZG5YMTBSMFZlQnBqN2Fz?=
 =?utf-8?B?WHRnUFRPYjNiTWtQWTdiVWxZS0EvK3dEeTZhYkdDZ1lEV1RxMW9jbm9FcCtW?=
 =?utf-8?B?bjRCbThIZ21wNkMvWDBhMUNwSUhRczN4Qkpqbm9Td3IvM0RkeWVqa3N0dk1Q?=
 =?utf-8?B?cml6RWtteHpjZGRvU3AxYWxhb3EwRUtrNWdBeFdIcUt4ZU9CWDFhOW5YQlVH?=
 =?utf-8?B?NVJIZ1B5QTdkVG5XOGlCQ2YxaW5zb2k0RmN1Kzg2czAveHprZXRybHNtL1gy?=
 =?utf-8?B?Yjc2TnBnRUNkSzZ3Z1FDUFJvZ2IxaXUvd1RqRDh2QUdKdGtTYWVmNVJNcGtF?=
 =?utf-8?B?cXRpYkUzdGwrcmxOMzZWTDVTZjFMWWlZMmdScUhoUkxiN0FrY2JrNWtpYXdi?=
 =?utf-8?B?WCtQTlJEcytmRDhYcHdFUG5Hc1VkZE5KbTBBc1l0QnZqZmlWaHVVV2NDVHdV?=
 =?utf-8?B?anFzSlFReVpudkpOeVJYWWlLa3FKUHNUeFE5aGhYS2t5eTZKTTJVSjdhbGsx?=
 =?utf-8?B?d3RiVHhvdjVVYkQ1VDZORFZQdmhFb2Vhdm5Oc0tFbW5XQk0zdVVuU1VqdytG?=
 =?utf-8?B?RzFobE5YeHpYUlVwaHp6ODZkc0pwTHpZOWdwR1VDd2tPMkF6cHRmUmlkY1Rn?=
 =?utf-8?B?M2xmZ3FHSkhFekcwL2FrSFh6bitUUG5JeGQ5NHBlcEQ2VmZHSm84UGRDUE51?=
 =?utf-8?B?bytybGVDellaZllNTTEwNUJzcHM5aUxYRjJqZ25SRENoNlJIRzRhSHorZXdz?=
 =?utf-8?B?Z2hQUjBnODZBYTM1d3NqKzRWRVdkNjkxSzdtNlM5M0ZvbEVOczd6TlAwZ2Ez?=
 =?utf-8?B?VzcwVVVjaTJIVTJTYlMrRDhGYXlHNmJkTG45N2ttT2pvZHc3NlFjWTE3YndF?=
 =?utf-8?B?NFA1K3dnaUZZU1RheW8ybE1ZUDF0aFhXenIrWHE3Q2tzZ2V0MkZrV3BwYWJ0?=
 =?utf-8?B?R3o4ckNGai9VbHdPZGNTcldpd1JCeWsxVFBielFGM0UvbnJUV1RuK1FhQWpq?=
 =?utf-8?B?b095L2NTWXRSOHd1Q05CZ3lEbEpUSWpEb0dGQWplUWc3Y1JibUlZVDdDNDlZ?=
 =?utf-8?B?WkVtaWljWllyUU9oR2dHQmtwbk85WHpVenFYTGNwcVV5WDF0eGVNWElwRUQ1?=
 =?utf-8?B?aEFoUW1ZaHlOcElDeDJYVW95Y3hoWGE3ZnVJMGRVL3hhS0xLNXZNcmNyWE9i?=
 =?utf-8?B?VC9vN2pvK3orRTJ2T3VscDNoY1hxNkFuM05jMUg0K092SVlRL0tmMHAxQk56?=
 =?utf-8?B?dTIrZGhFblFoeGtMT0dxMEFJYU4wV05uLzZsRnJGOEtsaFhwQmYxVk9LZDhB?=
 =?utf-8?B?em4xN2NMa3EyY3haa21WMThVN0N6Ymg5U1ZFTFEvM1RrOXpmNDlzUVkwZi9G?=
 =?utf-8?B?aEZidm1YTjZ4bWF5eHVtNWhtSTZhWWVPbXU4ZmF5dXRkMkR4cW9Zbkw4Z2lu?=
 =?utf-8?B?aGRmanZsVFJzclhOOVlDSDJKbDZ5dnI0S1pwenFYa2JPWEZBMEQvcmVkajZa?=
 =?utf-8?B?T0lldk9TWXgvQkxtbXlLVitnOTliSGprb1FNYkxrMXMwTzlsTU12Q3lHZ1p6?=
 =?utf-8?B?ck5hY2l6cUlOZEFzcXBkNk9TQi9DS1cvMUZmVGNhRUpsRWhHOGl5OEU0OVVG?=
 =?utf-8?B?ZFAzcjlIQk1lMVpaTUVsMEhKTzRzS3J0RkhmdkxEQ1BWU1JiV3FhcEF4eFdo?=
 =?utf-8?B?dHhMWlZNeW1PSkppSUxpaFRwVFZqV083bnYwTm4vR01JaXh6SDdVSkp5a2h0?=
 =?utf-8?B?RGZtWm5qc3d6cHpaN3NkQVBBQTV0OXBhTzh0SEREZXoxTVJLdW8vRGw1U1Nq?=
 =?utf-8?B?bDIzMGJEQU1kejNJblNycGpyMXZrSHVYZDRMRHBOQ3dSSlBHU2hZQ2lpZENi?=
 =?utf-8?B?UTZ4NU0yWnJldy8xYTB3aVY5THlKYS9yZHZ2a2RreE1FdGNWeTZLNEE3NFZi?=
 =?utf-8?B?aVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8769ab-2200-4903-5d2e-08de184d7716
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 07:16:52.2608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1tSWASa6lYoWoryvQNd+ylAPo+thd09nvZJWFC5rP5krXnZVV9jH90nqrlyE7UkvmDB4QpPrpDhomxAJRBjcJEmhK12ovTtAPtKzrZLVNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11904

SGkgSmlyaSBTbGFieSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmlyaSBTbGFieSA8amlyaXNsYWJ5QGtlcm5lbC5v
cmc+DQo+IFNlbnQ6IDMxIE9jdG9iZXIgMjAyNSAwNDo1MQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDEyLzEzXSBzZXJpYWw6IHNoLXNjaTogQWRkIHN1cHBvcnQgZm9yIFJaL0czRSBSU0NJIFND
SUYNCj4gDQo+IEhpLA0KPiANCj4gT24gMzAuIDEwLiAyNSwgMTg6NTgsIEJpanUgd3JvdGU6DQo+
ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4g
QWRkIHN1cHBvcnQgZm9yIFJaL0czRSBSU0NJIFNDSUYoYS5rLmEgRklGTyBtb2RlKS4gUlNDSSBJ
UCBmb3VuZCBvbg0KPiA+IHRoZSBSWi9HM0UgU29DIGlzIHNpbWlsYXIgdG8gUlovVDJILCBidXQg
aXQgaGFzIGEgMzItc3RhZ2UgRklGTy4gaXQNCj4gPiBoYXMgNg0KPiA+IGNsb2Nrcyg1IG1vZHVs
ZSBjbG9ja3MgKyAxIGV4dGVybmFsIGNsb2NrKSBpbnN0ZWFkIG9mIDMgY2xvY2tzKDINCj4gPiBt
b2R1bGUgY2xvY2tzICsgMSBleHRlcm5hbCBjbG9jaykgb24gVDJIIGFuZCBoYXMgbXVsdGlwbGUg
cmVzZXRzLiBBZGQNCj4gPiBzdXBwb3J0IGZvciB0aGUgaGFyZHdhcmUgZmxvdyBjb250cm9sLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+IC0tLQ0KPiAuLi4NCj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvcnNjaS5j
DQo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3JzY2kuYw0KPiA+IEBAIC0xMSw2ICsxMSw4
IEBADQo+IC4uLg0KPiA+ICtzdGF0aWMgdm9pZCByc2NpX2ZpbmlzaF9jb25zb2xlX3dyaXRlKHN0
cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIHUzMg0KPiA+ICtjdHJsKSB7DQo+ID4gKwlyc2NpX3Nlcmlh
bF9vdXQocG9ydCwgQ0NSMCwgY3RybCAmIH5DQ1IwX1RFKTsNCj4gPiArCWNwdV9yZWxheCgpOw0K
PiANCj4gV2hhdCdzIHRoZSBpbnRlbnQgb2YgY3B1X3JlbGF4IGluIGhlcmU/IEl0IGRvZXMgbm90
IG1ha2UgbXVjaCBzZW5zZSB0byBtZS4gSWYgeW91IG5lZWQgZGVsYXksIHVzZQ0KPiBkZWxheS4N
Cg0KSnVzdCB0byBhZGQgc3luY2hyb25pemF0aW9uIGRlbGF5IGFmdGVyIHNldHRpbmcgVEU9MC4g
T0sgSSB3aWxsIHVzZSBkZWxheSBoZXJlLg0KDQo+IA0KPiA+ICsJcnNjaV9zZXJpYWxfb3V0KHBv
cnQsIENDUjAsIGN0cmwpOw0KPiA+ICt9DQo+ID4gKw0KPiAuLi4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5j
DQo+ID4gaW5kZXggZmFjODNkYWNlMjdjLi44NWI4OWMxZWJmMTUgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jDQo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFs
L3NoLXNjaS5jDQo+ID4gQEAgLTMzOTcsNyArMzM5Nyw3IEBAIHN0YXRpYyB2b2lkIHNjaV9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPiA+ICAgCWlmIChzLT5wb3J0LmZpZm9z
aXplID4gMSkNCj4gPiAgIAkJZGV2aWNlX3JlbW92ZV9maWxlKCZkZXYtPmRldiwgJmRldl9hdHRy
X3J4X2ZpZm9fdHJpZ2dlcik7DQo+ID4gICAJaWYgKHR5cGUgPT0gUE9SVF9TQ0lGQSB8fCB0eXBl
ID09IFBPUlRfU0NJRkIgfHwgdHlwZSA9PSBQT1JUX0hTQ0lGIHx8DQo+ID4gLQkgICAgdHlwZSA9
PSBTQ0lfUE9SVF9SU0NJKQ0KPiA+ICsJICAgIHR5cGUgPT0gU0NJX1BPUlRfUlNDSSB8fCB0eXBl
ID09IFJTQ0lfUE9SVF9TQ0lGKQ0KPiA+ICAgCQlkZXZpY2VfcmVtb3ZlX2ZpbGUoJmRldi0+ZGV2
LCAmZGV2X2F0dHJfcnhfZmlmb190aW1lb3V0KTsNCj4gLi4uDQo+ID4gQEAgLTM3NTksNyArMzc2
Myw4IEBAIHN0YXRpYyBpbnQgc2NpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikN
Cj4gPiAgIAkJCXJldHVybiByZXQ7DQo+ID4gICAJfQ0KPiA+ICAgCWlmIChzcC0+dHlwZSA9PSBQ
T1JUX1NDSUZBIHx8IHNwLT50eXBlID09IFBPUlRfU0NJRkIgfHwNCj4gPiAtCSAgICBzcC0+dHlw
ZSA9PSBQT1JUX0hTQ0lGIHx8IHNwLT50eXBlID09IFNDSV9QT1JUX1JTQ0kpIHsNCj4gPiArCSAg
ICBzcC0+dHlwZSA9PSBQT1JUX0hTQ0lGIHx8IHNwLT50eXBlID09IFNDSV9QT1JUX1JTQ0kgfHwN
Cj4gPiArCSAgICBzcC0+dHlwZSA9PSBSU0NJX1BPUlRfU0NJRikgew0KPiANCj4gVGhpcyB0ZXN0
IGlzIGR1cGxpY2F0ZWQgLS0geW91IHNlZW0geW91IG5lZWQgYSBoZWxwZXIgZm9yIHRoaXMuDQoN
Ck9LLCB3aWxsIGFkZCBoZWxwZXIgZm9yIHRoaXMuDQoNCkNoZWVycywNCkJpanUNCg==

