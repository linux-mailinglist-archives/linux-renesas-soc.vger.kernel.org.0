Return-Path: <linux-renesas-soc+bounces-29721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOAMOOxeumnFUgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:14:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 201482B7A74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C1D0313BF67
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5F437FF52;
	Wed, 18 Mar 2026 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rVZ38BO2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428437AA68;
	Wed, 18 Mar 2026 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821221; cv=fail; b=jUtDLFNj7jBEroplO2RVG8CCVrBu77YvJKUBqBHQQSoJ2xKs6BSIJgY5vLaENxLzvSDdnAn2p/78eEIA1wRF6jBCeYw/bSrqDOwMqoEEwE2O4yclfTPpEYKfioOa8hggxH3Tkq8CRH1MECPRKNZNk2GUkmfw1IyDhHqKe8tMvxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821221; c=relaxed/simple;
	bh=BXxOoHLaIuWa1nDmYmU4caNHPjGDLUYL4g6WO8qzpZo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XCMgTP6TRlwPsKiT7Ksneud54avE+G3zP7abX7QM0oycWzg79gpv9qTee+oZ54lvL/CAC6A/bCM8DRWZrWuE3S7lHY7+BzyOfkhpNINGCAgYNo5RuZx04N7Y5NHi0Luz1nx38D2CSj1rXqxJE5eNLQNdySVJxoUE/aIazTUjV9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rVZ38BO2; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hsnx4/i2w6JtUi4aFbvPoCW8baOHsDUcLfa6La1JRgm1qkinfwPTIIuDUOVJMv+gTF9grvRfFUSkK1Q5BBFbCdPV/wiXuzHiBxwZFc0ht4UZWxq5ZUBbZ//wJzX3whNZo3+yBxzQxKTsVOEpBKdaEcdJxWOdTpJw17SNOIXI2URva+H7KXkdN1d7m3HZF2jzAU1O6iIYDCelwyHc5dYrxjElOd8SMkn+dsLiG2Fr0140aP+XaMW/+bjpJUreGoE6N/qVVS1o9cY9sCIr5GYiRUa6gbTMQkhlAu+Wuk2WGAHsIjqKZU2TiOToN88Z2LLp6AJehDT5DyX85Ghin8oxAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXxOoHLaIuWa1nDmYmU4caNHPjGDLUYL4g6WO8qzpZo=;
 b=b9KhLpYUtgb24eXFk48GFFQeQ+hOBIjIYq4FEJmdvhFSxxdVu7Mp8B8c28q/kF1lWDWa799sEgAj18GP9pntlGzGTnzJ8Se4Y4lYJTWU/NjwIPInHMc0gvKtKSHo6wE3Ej3eXw4cjq+4RdhznNW+Ex02Ks88/6c4RaYq0roicWLfgojgbjdPaJdbaHgjy4PP5oF0R6vnegmw9LRhBfddD8+FoKBf517x6qwPu+X38F7DCSnho97x7gpdQ+af65h2QE/1nkIQYQ3kPxQYppSGQexXg2e5MceOasH9YCPNXKLwZ4YxiEBUc9aUGTln2rxwoyU/4sSQF1BmTkhjW0RFeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXxOoHLaIuWa1nDmYmU4caNHPjGDLUYL4g6WO8qzpZo=;
 b=rVZ38BO28K3V0IGooUiWyr+d09DWTYeemPSiiy1BY7GNDPTA7NjsMgPhxVy/8Qc/CqzPbWbZ0Nl0V68eaMo8lL6+rGZKFzGgSVqFHVgXo9FzfdjoDUc66Tbb59AMcUhzKF/Uizwe5ZuWu69NaZelHsMto+Jya6RpFGr8FgoPYas=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11441.jpnprd01.prod.outlook.com (2603:1096:604:245::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Wed, 18 Mar
 2026 08:06:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:06:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v5 11/20] drm: renesas: rz-du: mipi_dsi: Add out_port to
 OF data
Thread-Topic: [PATCH v5 11/20] drm: renesas: rz-du: mipi_dsi: Add out_port to
 OF data
Thread-Index: AQHcnQX6QRn9VDLlIUu6i6kMHzIo37Wy3jzQgABPRYCAAPSq8A==
Date: Wed, 18 Mar 2026 08:06:55 +0000
Message-ID:
 <TY3PR01MB11346C024654B8AAF3A877F04864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <54edf1fa30f571686b55a4d67a2b100089739d10.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB1134613D59A93FC741A3715678641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <361e3831-d2aa-4471-8b19-34af661fa351@bp.renesas.com>
In-Reply-To: <361e3831-d2aa-4471-8b19-34af661fa351@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11441:EE_
x-ms-office365-filtering-correlation-id: fdcb7cd2-991d-4f7b-d223-08de84c55250
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|22082099003|56012099003|38070700021|13003099007;
x-microsoft-antispam-message-info:
 IqNkmgKBi6bVJxv6tH2E6OXXPCT+hnomV7v5vGYm+MqROzAozgik4H9PVv9ysszq7jnmByJwQZp9LIvubS1YQYY7cJYVrDPzIzgWO4MzmkmYX7sN3J9/ADVGlnzo7LUgfWif2cdS2m88OKzLNUWoEZBymHc51iPIhJiMrMdeIy52o2irz/TIDCXIG6CfusXoNAb1Gokn6BkeuMrEQKWapnXu0It7B5upFsNzytE0xuk7TPd3UjDEY+BGeAAqbTV5IPnkLs4FakAW4FtgTHQ779vIchIk3XyUFCepcweH4fkvFgfZeCOmH9eQ8SuKd0lNCdyFEb6VrCqMtJDvNPDLitJVW6GzR3mA2PApSj2fqBrqxwRqLIt31NWA+/Xz89LEJ+f1erE8LrwWF6PU+XTaXchzVvVIeWwn0wSRb8XtGv7q7d5T9xRKy9Yk8qabfHEnGUadKxWKfIMoBcSJsQwb1cq5RFXeI4MhhwIVVn0qkaU7j+Hk5EBndNO+Re34qpaXEQKI/zavoMUaYIn0sQrKfUHXyMloeFUS1pdMpxcH3ifyf+sRDftva9RttTbK2ENvGYKUPDqL8aAq8FeyP4cGJy1vUZ4AnUDQSiNd5nnzkPr4r6abvfXM4yTM36iSmrjAe27Xckw+OPTadRgsucD9CGsX54Dd+5aC4aAgPKRDasIgBpibg9+s6lBwq127vOC6Bx3HQlz3n5F/Ru0i2tl5OxoQqbV4iWjEvxgs1qMI+MuksigZIHk71V5bLnj7XSS7IOF0pkFHLt7JWZlhJIixO7nKk1YY3u33vD4UuvsrRKY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(22082099003)(56012099003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjJxdW1CZFVjM1Z5czNjMENLTDJ5YzZhMUZ2Wjkvd1RyTks4MEZzcnlGb1hU?=
 =?utf-8?B?YUpTUG5KcFdaZFZlaVZDWlpQU3A2R0dSU3ZqWmFiVUtqT0x3Yk9WNDEyeHJv?=
 =?utf-8?B?T1ZhOVg3OTVsRVVRSkF3cndtNlN6VmR3SjRNWTl0bWVkY1U2SUlsU0FFVTBh?=
 =?utf-8?B?Q3IwSWFieXJ0SWswK1lyTC9MUUJ0dGxubUZhOGlibzh2L0cyaXRYRFZmNWFr?=
 =?utf-8?B?Mlp3M3IyN290cjlRRklvaGsvdWtNMlBrYjdHa2gyQzNBYy9hUU1SYVRCckIv?=
 =?utf-8?B?ZjJLTDc4M2R5OGs3cUVSQXBZSzlabUxIVkhLM3N1UjZKaENsdXFuY0M3S3ky?=
 =?utf-8?B?eWUwaFQxSHhNOWl3YkxBYlpLN1dkMXJaMk43Ukw2b2hLNWZscU16ZTI2anM0?=
 =?utf-8?B?MFEwMWFSOHhwcTIxSFNDTS8rNTVoaXFTV0h1UmZPVnlkWUZtS2h2Vy95MWVx?=
 =?utf-8?B?dGtSUEZtcXA4ajBwRElpNEpna0xSeHBhT1k0TmhRQi9jQ3dOOWtRNEROOVA0?=
 =?utf-8?B?bTV6bE1XZkJ3aWJmdFF5WmhWQ2gvbS9TOVNLM284R0pqK3RHS21XYkZzOVBJ?=
 =?utf-8?B?UlpzWkdHRTYrSW5tQVYyY2p4L1JLYWJCRDJxUUV2S3l6dkN4ejV6UEJVSnEv?=
 =?utf-8?B?N21yTHFzb1R1YldRYjZ2ZU5aaDkyRkJKVGRLeU9jRGIwZzhPdmVpM09zM3BR?=
 =?utf-8?B?aTFMcnFsbmc1dm1oUXNEbDFicGVIK2NYU1MrU1lRci9mYUlWKzBMK3gzdFE3?=
 =?utf-8?B?MzZtNFNidVo4R1lCM2d2WUVNNk5rRzVwNzFvMkVUSHVFODlPaTgzbm0xRnFa?=
 =?utf-8?B?eHI5MFR1RFhPVzBwc0NLUkYzTzVZT3hIMHMvS3NGeWowbnlsaXV0Q0FTc0VW?=
 =?utf-8?B?N3FqaEswSjZYSXpuZ0U1MHA0Rk9MMEFiaGNESG1IeUE4Zy9aSWJ2cGR2bzQv?=
 =?utf-8?B?ZG9hcDQ1ZEZ1ZnBCRU5XcFRiS0VqYlFpNUtnOHc4L28rbTBwVEo5bXdzY05X?=
 =?utf-8?B?d0ZYMUxObGpwWkplRWpKYmIwMzNHb3VEZ3RYTVRtK3hIS2txZ2d1YzJwaDB0?=
 =?utf-8?B?NURIdWFOQVZkcENpbklLYzBMUU1XRklKcE5RWGh1b2k4bmg3UFVta09uUXk5?=
 =?utf-8?B?RlR0R2lZeEVydW52dG1iUTJFWFU4YThrZmxnNzdQUkJObFc4WWdybnIxL0R2?=
 =?utf-8?B?eUNNbHBodGZaQy9EdEpWRGFabWtUS2h3TmF0OGNZcU5zRHMxL2VucUtyRUNY?=
 =?utf-8?B?aHd6c1A0ZUZVN3FrcmVxQXlnMjU2ckcram5SL1NBS3ZSYnFiMmc4Y2s3OW9k?=
 =?utf-8?B?VE9lNzMvSGlPMnU3QmFuYVFCUnBuVTc1bGorMGpZdUtTL3VoRWdyUmZJaWlp?=
 =?utf-8?B?TUg3ZHV5bi9YOWQxbEJFK0N6V0YxNnlNOWN3elh1S2Zob1dLOWpZOWsvM3Vk?=
 =?utf-8?B?aVh1S2VLalNobWtqRUtzekZsTG8vT084eTNZUDJjUmk5M2JFakNYYzZUVkF4?=
 =?utf-8?B?VWNZemxRMHBDZTZvUWk5UmVIMWJVKzVBQTNoUUlFNjM2aWdiSmpPaVhjemNH?=
 =?utf-8?B?S1pUMUhRSFhlb2tJT1FZRUVabXAySTkwNFlxcnpNRFdDek9FWkVobVhjVmNM?=
 =?utf-8?B?VUJBeXRmbXJuLzd0ZHVTakZGOEcxdjQ5SkVYYnovSDNVTWVZM3RxNDJUVWxm?=
 =?utf-8?B?RURidkppSml0aFpGaENaSzlZa1NlTkVNRkM4V014M1l3T0VUdzlXRTlUbEF1?=
 =?utf-8?B?cWVPajRnOGJYanlCWk5uRUxONjhCdDhtTDRDV2pFMjRZU3IzZ3ExRTJjR0dC?=
 =?utf-8?B?VUpnUkxTbnZnWFk3L3JTSS9CUEh1emZKUmFpRWR2OE93d1ZrblZERE1kVm80?=
 =?utf-8?B?K3pkc1BRMlV1M2dUVlpqUEh3OEtaci85VUgzUkM5cGlSNUFCdEZZcHE5dlBw?=
 =?utf-8?B?b0Z2S2V6QS84NkU3WlV6YXNWUEJmSUpqZzNycm1Na0dBZFFWNUREY2xLRHFP?=
 =?utf-8?B?dTAwKy9qSWFxcWtsWEZ4US9COWUzMUprMG05cnp2allrbjFBOTFBZlZIckNT?=
 =?utf-8?B?TExCazkvZUZUQjl6YmZuOXA0Tk42b2hZZWZLcnJwQ01TNEN4RFdwRHF1c3BM?=
 =?utf-8?B?NkFhdDlQU0xlWWZTcHNUeWRTNS9pckFGRXhYcHA1aHhoZ0tOdFkvcDh6ZkZH?=
 =?utf-8?B?M1NCeGV6WlorVXE0b1EzcC94cWhGWEJiU2cwQjV5dTBzK2haRFQva1plWWRZ?=
 =?utf-8?B?Tjd1RmtIN0ozU2RiYXg1dW5LRzgzb3U2ODhMWU9BZ1dvWlp4aVV6ak1aajM2?=
 =?utf-8?B?R0Q3WDBjUFJDWDRXU2dFSno5WURZWEM1UHMvVDRyRGlmRmNWS1hwUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcb7cd2-991d-4f7b-d223-08de84c55250
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 08:06:55.7616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfe1rm5eq3h9UYUKaWeESziVWJm9GwTvttHqADkhU3PGHTMQP/aWKB/RsGYgzyiU/npOtoRsbDKG0JvJgAOEUUNfDUGkRxTSmwNKFaNOAmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11441
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-29721-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 201482B7A74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgVG9tbWFzbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUb21t
YXNvIE1lcmNpYWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4NCj4gU2VudDog
MTcgTWFyY2ggMjAyNiAxNzozMQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDExLzIwXSBkcm06
IHJlbmVzYXM6IHJ6LWR1OiBtaXBpX2RzaTogQWRkIG91dF9wb3J0IHRvIE9GIGRhdGENCj4gDQo+
IEhpIEJpanUsDQo+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQo+IA0KPiBPbiAzLzE3LzI2IDEz
OjUwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBUb21tYXNvLA0KPiA+DQo+ID4gVGhhbmtzIGZv
ciB0aGUgcGF0Y2guDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4g
RnJvbTogVG9tbWFzbyBNZXJjaWFpIDx0b21tYXNvLm1lcmNpYWkueHJAYnAucmVuZXNhcy5jb20+
DQo+ID4+IFNlbnQ6IDEzIEZlYnJ1YXJ5IDIwMjYgMTY6MjgNCj4gPj4gVG86IFRvbW1hc28gTWVy
Y2lhaSA8dG9tbS5tZXJjaWFpQGdtYWlsLmNvbT47IGdlZXJ0DQo+ID4+IDxnZWVydEBsaW51eC1t
NjhrLm9yZz47IGxhdXJlbnQucGluY2hhcnQNCj4gPj4gU3ViamVjdDogW1BBVENIIHY1IDExLzIw
XSBkcm06IHJlbmVzYXM6IHJ6LWR1OiBtaXBpX2RzaTogQWRkIG91dF9wb3J0DQo+ID4+IHRvIE9G
IGRhdGENCj4gPj4NCj4gPj4gQWRkIGBvdXRfcG9ydGAgZmllbGQgdG8gdGhlIGByemcybF9taXBp
X2RzaV9od19pbmZvYCBzdHJ1Y3R1cmUgdG8gc3RvcmUgdGhlIERTSSBvdXRwdXQgcG9ydCBpbmRl
eC4NCj4gPj4gUlovRzJMIGFuZCBSWi9WMkgoUCkgdXNlIHBvcnQgMSBmb3IgRFNJIG91dHB1dCwg
d2hpbGUgUlovRzNFIHVzZXMgcG9ydCAyLg0KPiA+DQo+ID4gV2h5IFJaL0czRSB1c2VzIHBvcnQg
MiA/PyB3aHkgaXQgY2Fubm90IHVzZSBwb3J0IDE/Pw0KPiANCj4gSSB0aGluayBpbnB1dCBwb3J0
cyBzaG91bGQgYmUgbnVtYmVyZWQgYmVmb3JlIG91dHB1dCBwb3J0cy4NCj4gQWxzbyB5b3UgWzBd
IGFuZCBSb2IgWzFdIGFncmVlIG9uIHRoaXMgb24gYmluZGluZ3MgcGF0Y2guDQo+IA0KPiBbMF0N
Cj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJlbmVzYXMtDQo+
IHNvYy9wYXRjaC9iY2ZlODhmNTVjYTQyZjQ1YWFhM2EzNjRmMjkzYmQxNDliNzIxNzAxLjE3NzA5
OTY0OTMuZ2l0LnRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbS8NCj4gDQo+IFsxXQ0K
PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmVuZXNhcy0NCj4g
c29jL3BhdGNoLzlhZTVjMGQ4MTdiYTY5NzA4NGJlOTAyMmFkN2ZhMjBlOWUxNjcwNzMuMTc3MDAz
MDQ5My5naXQudG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tLw0KDQpUaGFua3MgZm9y
IGNsYXJpZmljYXRpb24uDQoNCkNoZWVycywNCkJpanUNCg==

