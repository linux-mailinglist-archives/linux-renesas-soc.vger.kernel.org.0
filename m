Return-Path: <linux-renesas-soc+bounces-12833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBE7A26DDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 09:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC61B3A6830
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 08:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB3A207665;
	Tue,  4 Feb 2025 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pvIsdHHj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010010.outbound.protection.outlook.com [52.101.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C6F206F37;
	Tue,  4 Feb 2025 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659554; cv=fail; b=CKkptM4xmfNG1z7jHYvXg8e42DAeA7CTiuDX7azQwE3vC2sb+0uIIRvmS9uxttGh5EhAfLMdaHYR9h9biFwpDcaSknS0P+Cuaok/NANBkctzrx3qZXn4Ivye6n0zKPXr0L0ECm115IPaG39e7I8WlRQPTitdzziuE82MjMgnV2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659554; c=relaxed/simple;
	bh=5dtLwUX9INaaEJXhqwBYykIke7f06e6J1u/aJHtB5gg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rmvvntuHkOJiApIx0KnUYpetCGkxbL7eulpAdyDCF+Oh9D0vXZtO4hns2pbe2b0B0bLVBArm4z6MmBNgDN/30QWshNm37c3saKjv1CbhG50zkHA/XHGumK7i5tNiWPru9+eQVfWWBrWIObvZ5C5tR0JWlzpv7Rvlblty856mnM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pvIsdHHj; arc=fail smtp.client-ip=52.101.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4XmHDwP/vpaTClg9esXSjWJP19EQaHRIIbIwLjlUX4hSVlCyrDwtF28tevvJVIs4bbe8SU+LyrmGVaD1X4uY3bE6b4DCDZVqVbKSiNWrCEHA0s5LUTb3gU1ext3Gh8GmOGXT2OtbKLjhShqMXypBKlrF4H8iSAfcNUazuvPYf0XepGG8wS8jZXtJyoIM6TgSQqDBqyurK1pszVNFCySKjJpqKu5Z59iOI7I8LW1IpcbIkkHSnrsUXepkX5Fu4ag/8HZ6oBnVtsi6ky3xgvDCcvgi/SbLDltAlo/d9xHiYwSesXIe0cF3CS7v9AUY8q3svbVJ7nWfDO1lJ5kGB/jYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dtLwUX9INaaEJXhqwBYykIke7f06e6J1u/aJHtB5gg=;
 b=dedfe1uHx5sP14QkJ5+Cu7vhjbsbGU4T3C1khpl07GCXv9TZKRlWKpN3ZVt6XNwTp7lh1HtxqUGSJxDYVJu9iMvLUB+agT1nDlWwYzIfBrrJx3M2A5PcGYjI5eWgmxkp7M0zlFECd9nHCYA2Tjefyns03uS1hm/W91QLH913Jrs1Ay/iwYLXiOR9WA3Kr5uPp7enqPNXnwTNtN+vYWnOGpWz+A0LV1f1kaRLG7Hy1y+E4fW4dA6Em5E6iSiSpXP0xUkVGMWO9EfaUQIh1hM3mI2qMz77i3tIJfq28F/yISoVaJBH19aIs8I6O95LRHSJKXBJyGeGuQJKYficQvSC3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dtLwUX9INaaEJXhqwBYykIke7f06e6J1u/aJHtB5gg=;
 b=pvIsdHHjZrTkozW9jXa6Lxm29ovjcz+U9tQ1k1IkpTGJHwf0LIJkW+cSpWENoYRBvqakUU1XrWeP7LNE3VMhm21vT9NdbM/zYDCcs9o4JWWfKmxqFihOqLvaJCrKT6mecoBnnWlpdt+ZITiZvZL7Z1Y3hWHkyG9+j9RliOVGwis=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11070.jpnprd01.prod.outlook.com (2603:1096:400:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 08:59:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 08:59:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Network Development
	<netdev@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK"
	<linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
	linux-media <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2] of: base: Add of_get_available_child_by_name()
Thread-Topic: [PATCH v2] of: base: Add of_get_available_child_by_name()
Thread-Index: AQHbdIwcOx1+V0CX+UGSZ6o9QaMC3bM1zvSAgAAD2HCAAELygIAAxH4A
Date: Tue, 4 Feb 2025 08:59:06 +0000
Message-ID:
 <TY3PR01MB1134656CBDAF5FFCEB6C8D20F86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250201093126.7322-1-biju.das.jz@bp.renesas.com>
 <CAL_Jsq+dn5wyEKbvAT8M2V=nM-vV_eHiRtwO_0h6EiJ=8OkHSw@mail.gmail.com>
 <TY3PR01MB11346E1FA592E731E0D32E96686F52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAL_JsqLo4uSGYMcLXN=0iSUMHdW8RaGCY+o8ThQHq3_eUTV9wQ@mail.gmail.com>
In-Reply-To:
 <CAL_JsqLo4uSGYMcLXN=0iSUMHdW8RaGCY+o8ThQHq3_eUTV9wQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11070:EE_
x-ms-office365-filtering-correlation-id: 7604e979-3f1c-48dc-6e7d-08dd44fa2e30
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dEJYTlVCYmZsZS82ZmNxcEdVVHFnSXlSY0RYLzFicFlvbmhJNXhIeUpkWklX?=
 =?utf-8?B?bXZWamQ4bGdpUysybi9ZMWFUQUM0T2Q3YzFhZ1ZzcEk4dWpvOGNGUEVrMFh2?=
 =?utf-8?B?YU5kL2xXMUoxdThCT2JJdWFpTTQzMnFYSlhVYStSVDh4eWdhLzJOcGxEYnNW?=
 =?utf-8?B?Nkc3eGhkc214S3BoWjd6eFJURGtGSUZYUUN2VWpsdktLMlB0bUtXRHlUU2pL?=
 =?utf-8?B?RUlnTVJNL3NyQzBGYWxva3FHTGVmN3hhSHJUZ283NnBBZjB6bzU2dWg4eU1U?=
 =?utf-8?B?MFZTcGV4NWViWDhQNmgydFY4NitmQ0dCSXBUdHg4QnB6MDRzS1FZL0RkdFh3?=
 =?utf-8?B?anJHTTh6NVRGV1FWMXRjOTdxK2VTUEFLQVNqT2toSjdHLzdGc0x5cWRjV1Vx?=
 =?utf-8?B?QTBqcnhpOGVXV1RhcUxxWXRuc0hGclhkeExiWWhpRDczVVFYMnBKRXlhVDg3?=
 =?utf-8?B?WGo5cVBPZzUzeTRJMjRLQ0RkWjVCZzByOVdrVEs0NGZsUnRnMFlxRytjVUxN?=
 =?utf-8?B?OHoyMmFBRVhrcUozdW1PVEZtK2VmakMwVDRYRUFmbkJnSjhLWHdFNzlIZ3J6?=
 =?utf-8?B?dHhTTkVlc1JKV0pHdFBSblpBTzUveUMzUTZ5UEtRMmJudmNvRjR1QWdEOEZv?=
 =?utf-8?B?TlhYcEhQenpkbmdMMmNDVVh6YlhVRGltcmJBM1FZSmtYTkpaY2REUUd4QTdD?=
 =?utf-8?B?MjJwZ3VzY0hOZUgrWTlOR3hEdTRnZWJWNmlLRy8rUkJiWlBYTk5IYUd0K1Ay?=
 =?utf-8?B?OHdyTktqc29YR3ZUWnN6dDNqZHl2ekhEckJoT2R1QW9xODRhdWVRS2lOQ0Yw?=
 =?utf-8?B?dTQ3aVd5QWl4T0NvUU5peEtVWm0rSm5aUFZYYTBSZEZnT0NOTWV2bllBVXVk?=
 =?utf-8?B?K2hOY05lZlZ1RHVsWUpBK2p1YTQ3cVhManhZOUlhdDVyVTRTaC9JRXQrVDFY?=
 =?utf-8?B?MW52MG41S3VmVk1YZldxaC84blQrZ3d4Y2FoTXlkQmdqbXlnK0w4UFVSSUk4?=
 =?utf-8?B?NkxYbHpENk9VMFBNeWRwT0FxNVlQRjc2dzZCRUNSU2ordnFRUWJPMnJjbjVm?=
 =?utf-8?B?dnF1VHAxcFYyYTQ4VGowRUpoTTBuVnV5cnY0QjYzWTFPdmlIQm1aQ0I5cjlt?=
 =?utf-8?B?OFVLazRQaWFRT2R2R1FsRmRUZUxHS0VjMVFPNVZWLzFwOE9xWmxOZlc2T2VN?=
 =?utf-8?B?K2YvWGg3MzhCd3Ryd3FMWWppOUhEdlVwM0NCR0NYNUJpb1VMSXZuSzk4TlFB?=
 =?utf-8?B?WTh2cDZmRzV3eFlrZ1h2ZzJiTXpjUWlzeEFXYURHclc5dWwvbHZwRUo0Z3dj?=
 =?utf-8?B?UUNvaEhGNzlhditoWVdpb1BVQUdCd09ndnB1T3F5MWVFVjlEU0d2WkV4QXVY?=
 =?utf-8?B?ZndSRTFhUXJhbnFENEZ5USs5di91U05zd3RWZTdtaWxXc0V1VjhQOUJGUzBk?=
 =?utf-8?B?WTlGUit0em5OM1U2NFVJclhhVUNuNDkybitEYmlpTUtlVTdDaWZ0T3ErcWZC?=
 =?utf-8?B?RVJFVHdmN3g4T0tnei9pQXNaZFNoNkd2VkdhUkEySWVNeG5oemNNWmVOVytx?=
 =?utf-8?B?NHdNMHNRK2NkZjFjQ1dqdldpazBFQThnbUVjR3BIbVdqcmw1V0RqN2pEYjBG?=
 =?utf-8?B?YUtVZkpneFFFYW9RdXYwaUxHMzdZSXlRcGZWREhkUHVtN042OHdpU0VXbUxt?=
 =?utf-8?B?N2h3WEVVTlRKanRIQkVyT091TmFDa1BzRjZpeHpPOHVYck1GU08xSjJadnFB?=
 =?utf-8?B?TkJNbkV0eFM4R3B5bzVZYkVNekFSYWpvcVRNU0ZBZGM1aGRXcUUxSGwrY0x3?=
 =?utf-8?B?WmFOd2c4M3ZEYnZYNDRVenVSMTdoSERJS1JmcDZ2dzNuSnpZblJGdnQ1WXor?=
 =?utf-8?B?NGw3aS95c1RaZXlsMkE5L1d3aHhhYmxSa0xrYWF2eU50M3MwOVhYMTJ2NGs4?=
 =?utf-8?B?WDV3R2NUc0h6OHJiR3FBUWdjb29Ya3VPWlF5eTFvL3lubzJRSlR4ZlhPWU1w?=
 =?utf-8?B?NFhwRVYzcEVBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDYrYS9MU09ETHFjWVdNUHN3NWpiNjRwR2RiLzZHNkZuZDNDTDgzVXc5Wjdr?=
 =?utf-8?B?eENYeUlHVW9RSHE2anlpSUJzS3lHTHRZVEhNWVNWenhUSnlsREIzYlBOcVRV?=
 =?utf-8?B?bm9yQUNKNXdkQ3MwQ3RDTzh4dlpnaXBhbnFvZ2Rxa2dwb3hxZlNNN0pVT1lV?=
 =?utf-8?B?R0xLdVhSOHluaXYyR00yZllzNUh1N09XYkoyU2hiQlZEZElyQWNFaTJEZTlm?=
 =?utf-8?B?YytRSkpLTWdPc1BYbEVZSStrazE2bW1yRzZaVC9pa3JWS24yVmxZV09vYmdj?=
 =?utf-8?B?ZVJHOGRCL1FYRmhEMmRnSDBsWWZ3L1NSQ3JnQmhwSjRmYkNxUXpKc3BsR3Jx?=
 =?utf-8?B?L0JHUFVPcmR3czBtYytNM0RxR2w5aHo3TEp3N0xtNVYvYVpNdnBZcnhjNXRt?=
 =?utf-8?B?WTdFL0VrZnhtaysvbStjdHN3YkkwMDJQaWxHc2lLUGEwVlo1L1FNQnlyQmZu?=
 =?utf-8?B?VkhMa1dQbmdvQnEvblJ4L0VGNTVRSzhreHptREFYUUNzOUVHZHl0SGNWa0JV?=
 =?utf-8?B?dk1wNStPMkJ1R3pJbFZyTXdvd2pzY2V4ODRYeXNZQXBvM1dYa2hJbmhFUHJU?=
 =?utf-8?B?Rlp3R3lEWmlBTE9UdW9mVGw2QjFrSUhZN0tWR2JRdXkrYzYyUEhabTVtVTRM?=
 =?utf-8?B?Q3gvRzVaa0N1cjZWNGtxV2taV0VpNG9Qb3loK2lOczZXZFNqZnhhVG9pclFP?=
 =?utf-8?B?T0FIby9OR001cmtpa21xOFNFN2RqZWFYMGZ1SGtHUEx5NFNueHkzYlY0Tkcv?=
 =?utf-8?B?L055SjR5MFk1NWd1dEdmM2FGd2QwRC8wSG9HeWM2Y2ZqY0REWTMyS3hqQkRk?=
 =?utf-8?B?R0ZwNldxV05OOWJnV014bzlVV1p3UkpBakZYbzhpQWRrUkpYNnZOa2JpZE1D?=
 =?utf-8?B?eUJ2UHV3VkZHYUFUNXU4QVVrMkZET1Y3TWJ6RlpyMG9BVCs3Wm5jdldOOE1x?=
 =?utf-8?B?VEk0UWFoSGVFTzZWRkg1RmdnR1kyNXhIR3NTV3ZGejRMV1VWN0Frdkh3L3Rr?=
 =?utf-8?B?UWM0U1U5YTFueG1NVmxDTFhIeU0zalJwSVZ3NzhOY2NPOGF0andwNHpqSW9v?=
 =?utf-8?B?ZXkzLzJnV0V5T1ZvMHlMa0ZHYlg3ckZlcjU0M1FpdmVpdXpPWTJSVGxpNDRB?=
 =?utf-8?B?Z3M1dmRTUmVuNUxjNGJsUWRkcmxHSHVRbDJkR1dEekZhejRlMHdscThybm1B?=
 =?utf-8?B?V2hZb2s2ZnpUSC95SUMzRXUyUkV3STZyRFJGSGMxTHVCbVY1czV1bnNFcFBi?=
 =?utf-8?B?bzZwTkg1VG1qLzhWSDF2enVBcTRzK1NvZjhLemJWSnh4ckpHTjFscENUZ0Z6?=
 =?utf-8?B?aWRLcjdjSVRjVVJuQ2JsMXdpS0Y5STR5YVZnMjJ5RnhkV1hTWXRwL0N6VDZE?=
 =?utf-8?B?dlUzMDJGYTNOQ2xkWUduUmpOVWNYclFqYVNXWSt0SG1XZ2hEWnBzazRUMGZU?=
 =?utf-8?B?aGZmZExCeXhxVFFUYTZGbkE0WldvQ2FDcG90cG4vR3hRekxQcC80SU1YQ0pv?=
 =?utf-8?B?dHRuZEdwRmhzMVFNc0VTbm5LZ0V5VExjWDYrZWhiemJGTldmUnVHMUtUdFNh?=
 =?utf-8?B?QllHL0FDcG0wUTQvSzZtYXVhWGtHd1VYRGFUUzArcmhxbklQT3d0Vm1PWTdh?=
 =?utf-8?B?Z0p0OE5BSVIyODVzc1U5dWlDSkhNM1ovYk9qUi9ZTUVlSzh0VWxWTE5mZFMz?=
 =?utf-8?B?SU1jeU5KVWRyaUhwYlBBRXN2NjM5elppMkd6eGdlY0x4ZU0yUEgyQWFoMVpY?=
 =?utf-8?B?UHk5TjlLZHZDZVVneW9HcFp6MUdnRHJPRHJWOGVEMGpDZVlPQ3lwK0V6TmtC?=
 =?utf-8?B?b2pyVTU3SlYyMXJRNzIyVGE3ekc5dCtsUi9GaFlCWWJGenJYZlBFcklWSlRn?=
 =?utf-8?B?dlZjVW5SSTFxZkFlaXljQnV5S21nUHZnMFBoSXNsVW9ZZUlsY2VqR01NbExv?=
 =?utf-8?B?aU4vN3phenNRWkIxWW44anpqbFNZQk9SUG9WN2hzNmxLUlE3ak5HVGFwUHlw?=
 =?utf-8?B?YlRFZERUMU0rdFlWb2w1Q1M2eVluNHN2cTVieHBjMDQ3UkVSa0s3ZUY4aTlD?=
 =?utf-8?B?NytzOUZONHp2cHpsa2Zra01tN1dYOFl5cm1DM1dlR1c5dFkrZEd5dWQybTNW?=
 =?utf-8?B?KzB6UnppSzY3TzVUeWZmNGVjMWNIWHZ3c1hQOE1Lcm84WWF3UVNkS2RUSi9r?=
 =?utf-8?B?VlE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7604e979-3f1c-48dc-6e7d-08dd44fa2e30
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 08:59:06.3864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vp5fymgDIWXgNSYkXpjC5LnufI6WYCAhhWWros1V5s99tgeP5y7fKK09gAOXZo7a8sNTdpng35NQcMtz/mS4YbYEZmMSo3LLy2UEWgSNOns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11070

SGkgUm9iLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDAzIEZlYnJ1YXJ5IDIwMjUgMjE6MDYNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gb2Y6IGJhc2U6IEFkZCBvZl9nZXRfYXZhaWxhYmxlX2No
aWxkX2J5X25hbWUoKQ0KPiANCj4gT24gTW9uLCBGZWIgMywgMjAyNSBhdCAxMToxN+KAr0FNIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBS
b2IsDQo+ID4NCj4gPiArQ2MgcmVsZXZhbnQgc3Vic3lzdGVtcy4NCj4gPg0KPiA+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+DQo+ID4gPiBTZW50OiAwMyBGZWJydWFyeSAyMDI1IDE2OjUzDQo+ID4gPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYyXSBvZjogYmFzZTogQWRkDQo+ID4gPiBvZl9nZXRfYXZhaWxhYmxlX2No
aWxkX2J5X25hbWUoKQ0KPiA+ID4NCj4gPiA+IE9uIFNhdCwgRmViIDEsIDIwMjUgYXQgMzozMeKA
r0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+
DQo+ID4gPiA+IFRoZXJlIGFyZSBsb3Qgb2YgZHJpdmVycyB1c2luZyBvZl9nZXRfY2hpbGRfYnlf
bmFtZSgpIGZvbGxvd2VkIGJ5DQo+ID4gPiA+IG9mX2RldmljZV9pc19hdmFpbGFibGUoKSB0byBm
aW5kIHRoZSBhdmFpbGFibGUgY2hpbGQgbm9kZSBieSBuYW1lDQo+ID4gPiA+IGZvciBhIGdpdmVu
IHBhcmVudC4gUHJvdmlkZSBhIGhlbHBlciBmb3IgdGhlc2UgdXNlcnMgdG8gc2ltcGxpZnkgdGhl
IGNvZGUuDQo+ID4gPiA+DQo+ID4gPiA+IFN1Z2dlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IFJldmlld2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiA+ID4NCj4gPiA+ID4gLS0tDQo+ID4g
PiA+IHYxLT52MjoNCj4gPiA+ID4gICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24uDQo+ID4g
PiA+ICAqIFVwZGF0ZWQga2VybmVsZG9jIGNvbW1lbnQgYmxvY2sNCj4gPiA+ID4gICogQXZvaWRl
ZCBjb2RlIGR1cGxpY2F0aW9uIGJ5IHVzaW5nIG9mX2dldF9jaGlsZF9ieV9uYW1lKCkuDQo+ID4g
PiA+DQo+ID4gPiA+IE5vdGU6DQo+ID4gPiA+IGdyZXAgc2hvd2VkIHRoZSBiZWxvdyBmaWxlcyB3
aWxsIGJlIHRoZSB1c2VycyBmb3IgdGhpcyBuZXcgQVBJLg0KPiA+ID4gPiBJIHdpbGwgYmUgdXBk
YXRpbmcgdGhlc2UgZHJpdmVycyBvbmNlIHRoaXMgcGF0Y2ggaXMgaW4gbWFpbmxpbmUuDQo+ID4g
Pg0KPiA+ID4gTm8gbmVlZCB0byB3YWl0LiBQbGVhc2UgY29udmVydCBhbGwgdGhlIG5ldCBvbmVz
IGFuZCBzZW5kIHRoaXMgcGF0Y2ggd2l0aCB0aGVtLg0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUg
ZmVlZGJhY2suDQo+ID4NCj4gPiBTdWJzZXF1ZW50bHksIEkgaGF2ZSBzZW5kIHRoZSBwYXRjaGVz
LiBIb3dldmVyLCBBbmRyZXdbMV0vS3J5c3RvZmZbMl0NCj4gPiBtZW50aW9uZWQgbWUgdG8gd2Fp
dCB0aWxsIHRoaXMgcGF0Y2ggYXBwZWFyIGluIC1yYyAsDQo+ID4NCj4gPiBDYW4gaXQgYmUgZmFz
dCB0cmFja2VkIHRvIDYuMTQtcmNYPz8gT3RoZXJ3aXNlLCBpdCBuZWVkcyB0byB3YWl0IHRpbGwN
Cj4gPiA2LjE1LXJjMSBhbmQgb3RoZXIgcGF0Y2hlcyB3aWxsIHRoZW4gYXBwZWFyIG9uIDYuMTYt
cmMxLg0KPiANCj4gTW9zdCBtYWludGFpbmVyIHRyZWVzIGFyZSBiYXNlZCBvbiByYzEuIFNvIGFy
ZSB5b3Ugc3VyZSBldmVyeW9uZSBpcyBnb2luZyB0byBiZSBmaW5lIHdpdGggYSByYzINCj4gZGVw
ZW5kZW5jeT8gR2VuZXJhbGx5LCBuZXcgQVBJcyBkb24ndCBnbyBpbiB3aXRob3V0IGEgdXNlci4N
Cg0KDQpGcm9tIFsxXSwgbG9va3MgbGlrZSAnbmV0JyByZWJhc2Ugb24gcmNYIGZvciBmaXhlcyBh
bmQgJ25ldC1uZXh0JyByZWJhc2Ugb24gJ25ldCc/DQoNClsxXQ0KaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL25ldGRldi1GQVEudHh0DQoNCj4gDQo+
IFRoYXQgYmVpbmcgc2FpZCwgaWYgdGhpcyB3YXMgMTBzIG9mIGRpZmZlcmVudCB0cmVlcyBJJ2Qg
cmVjb25zaWRlciwgYnV0IHNpbmNlIG1vc3Qgb2YgdGhlIGNhbGxlcnMgYXJlDQo+IGluIG5ldCwg
SSdtIGxlc3Mgd2lsbGluZyB0byBhcHBseSAibm90IGEgZml4IiB0byBmaXhlcy4NCj4gDQo+ID4g
WzFdDQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzk2ZmJjY2QzLWZkNzktNGIyZi04
ZjQxLWJkMGUzZmRiMmM2OUBsdW5uLg0KPiA+IGNoLw0KPiA+DQo+ID4gWzJdDQo+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzdmZTlkYWQ5LTg1ZTItNGNmMC05OGJjLWNjYTIwZmY2MmRm
NUBrZXJuZQ0KPiA+IGwub3JnLw0KPiANCj4gSXQncyBub3QgbGlrZSB0aGV5IGFyZSBzYXlpbmcg
dG8gZG8gdGhlIG9wcG9zaXRlIG9mIHdoYXQgSSBzYWlkLiBJZiB0aGUgZGVwZW5kZW5jeSBpcyBu
b3QgcGFydCBvZiB5b3VyDQo+IHNlcmllcywgdGhlbiBpdCBuZWVkcyB0byBiZSBpbiByYzEuDQoN
Ck9LLiBBcyB5b3Ugc3VnZ2VzdGVkLCBzaW5jZSAnbmV0JyBpcyB0aGUgbWFpbiB1c2VyIG9mIHRo
aXMgQVBJLCBJIHdpbGwgc2VuZCB0aGlzIHBhdGNoIGFsb25nIHdpdGggb3RoZXIgbmV0IHBhdGNo
ZXMsDQp0byBuZXQgc3Vic3lzdGVtIGFzIG5ldC1uZXh0IGlzIG9wZW4gbm93Lg0KDQpDaGVlcnMs
DQpCaWp1DQoNCg0K

