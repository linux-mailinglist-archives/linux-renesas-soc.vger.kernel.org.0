Return-Path: <linux-renesas-soc+bounces-8435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C7D9624C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 678FF1F27AE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 10:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08B916B74F;
	Wed, 28 Aug 2024 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RlPLMErf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D88E16C870;
	Wed, 28 Aug 2024 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724840584; cv=fail; b=N9+aGV6yR/CVIgghY3hlCOVPsvXrzZHytoQzgA5EHMAJqP8GKzSDZpj+X4Z3a7gfMGi3Zpph/nVqFrmvZo6lmKyFHODAbFYJesciLigeq8hjWr7OHtE+ef2O3pHfWqwqENYNqjZsQ/enPkSwObS+zQU+J9wWuKekqw5w04eTS+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724840584; c=relaxed/simple;
	bh=5hE3bsZ8dYGVz10gyBZO1MdnFC+g8ES1Mp1DDtmiE1Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e5c3zBUzEMrOKxncL9Zx3d27t77XrMDWmg5RuuoOi4tFuz2V3TLcezn9riyx8BvWUrzD3zn5yXyECBWuVnNo75rvO8Bststq7uZNWAAihhJEwen6NGiowO58sfKqd91lmFO6K0xdBT1I1LAB824HM28tCDyVlbRgpjmNTwifOdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RlPLMErf; arc=fail smtp.client-ip=52.101.229.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aH4ntv+5D7DhEovpJK2noF50jOoO97dlqlLaUWVcNqfWgjET7B5Nenu1YAhOdfsX3PunW2DLcNfMnvTWJTtJV02//fFVEdvPxgE9mXAJp5HnFxa+6eXukuizmvsi165wyklMc6YQZnhH6SCuMxxvOdD5UpqhZOHR+ts0frYOOSvyKlrah2lXj8+MixMeudu7rbcl9Cswx9liQYzpFZm3YsZ3H/BJDsyQ4IoP9UbxSITpTVxvh6sCrSnm35l308oNMwxzS+UiKNitfZGyhW+kZzgWUHZ7qduQpSpG10w6o5AalT4Fgh0gcNsCvekQcu8hGGhPLeyPJTsQZf6vCC1Cyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hE3bsZ8dYGVz10gyBZO1MdnFC+g8ES1Mp1DDtmiE1Q=;
 b=ASJyUQwz2Zqsc2KZ1jZl7v/jLPfGkPvJ4rnab6h4D8c8hZ1F7O4YaKr67NbDvMMhyrALMkkpHPOujByCOT1mJjWCt28zp9Goz9PuJedqcaWl2iBUOeWPcRWnY2pcXJp8GdR2DMWMrjKN8Tk0N4DnV/sN6UwjFsdz9oOqf8GA7TKghAb0vQXcP6F9MxhsBxpxZgYS7AtIOh3b03JmPrZWVpXOIBtKMGp2Z+/eq4P4IkRaUQhS9olHp9YaMU3rj+btC/0C0wS8vE7zPl/LuLbN0oLWQdT8dxlVw2PSsO091GiiQjy7818i+QpX16l/O7oxqQFS4QhCx0Oit7UNiHIfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hE3bsZ8dYGVz10gyBZO1MdnFC+g8ES1Mp1DDtmiE1Q=;
 b=RlPLMErf+QJUM+TAgIwYU1F/t3nM2K8CiDQVXGVJKZyeeV1P7NwECDSOyFR2Ff82mAlbrXaiJq2oOljU0jQoY7Bwh34NJ2qGgJ+oz6J3a/pXFm1xInSlpaqQe4td0+bXxE2/zjMRiOfANFHs4ZOXAuu8OC8bKn4F8Op/W6G7uTM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10235.jpnprd01.prod.outlook.com (2603:1096:604:1e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 10:22:57 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 10:22:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for GTM/RIIC/SDHI/WDT
Thread-Topic: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for GTM/RIIC/SDHI/WDT
Thread-Index: AQHa+S4N8exrBf+5L0Ks2gkmNjakEbI8bVcAgAAChoCAAACnAIAABNOAgAAAUNA=
Date: Wed, 28 Aug 2024 10:22:57 +0000
Message-ID:
 <TY3PR01MB1134689EC1D553252D80C127686952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240828093822.162855-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346345B7FF1DBD4DA60273286952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vPisCVCX0jLYJGrozabRWpBV+xmU5ufu4Ke9Rziis1XQ@mail.gmail.com>
 <TY3PR01MB113460F2ABA56C89E8E9CF09D86952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tW0wmpu807Vxi_e49JraoNry1Anb_Ys7rM=CpODkpKeA@mail.gmail.com>
In-Reply-To:
 <CA+V-a8tW0wmpu807Vxi_e49JraoNry1Anb_Ys7rM=CpODkpKeA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10235:EE_
x-ms-office365-filtering-correlation-id: 13068ef7-4096-4d7e-1dff-08dcc74b6307
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?anN3ZXR5SUN1K3hsVitsRWJERUxlUnpWVjRsNzZ5alVjOEtRZzNuaFgwc29Y?=
 =?utf-8?B?Qm16S00zZnNMYXlCdnhmRmw0ZDF6MGFvakQyN0UxYWRRY1NCWmJBdmNjRkZG?=
 =?utf-8?B?OGJjNXRGMHNSRDU1QjR6WWttNm9JL0MvYnFDWi9CbXVCRzFhaElYcTVSVDRL?=
 =?utf-8?B?Tk1FQzdoRW15ZGdpMGpUbVN1RmJvUytxU0JZQ2lhVlhTREMveUY1OXYxa3hh?=
 =?utf-8?B?YUx5bThQN0FSS0JCd2Rud3dtOUlaa0NaQ3NHL2Q5Z1g0dzZsMkhna2ErVUxx?=
 =?utf-8?B?Qjl2RE8vMHBDd1lFSFBqQlZYL2d5TkIvcGlGUFJFVEVrQzJPWEtXNlloMWVN?=
 =?utf-8?B?b3lMSmtwODkxWEZPZENhd2dHVDhkTnlhYWRRZkVzQTVZQWh6U3pQdnROelEw?=
 =?utf-8?B?V0Y0NmZZVFNmME9TWlZzRGM3MEREYjNvVzMzb0JkRnhZZnhvaml5Mm9TV0pG?=
 =?utf-8?B?SWZCV050cWhObzhacU9CWUtvbFB3ekJYS0FrNkszL2l0em1hNFZqdE92MGFa?=
 =?utf-8?B?T3BJRmRaWFVxbHVZRWJuVDJFdG03aW84M3kvVWNrU05sRldxU1h4WHVvVjk3?=
 =?utf-8?B?TjhPU3FpaUNwOVQyamo2bkhyZEQxblU2eVZQVGpZRnhIY2xWQVhiMnJheGhY?=
 =?utf-8?B?QjlRUDdCT3FnY2VCQ2JGTDBtdUdlWXlqaG5BYjRjb1NNTnh2Tm8zd0kyM2pG?=
 =?utf-8?B?N2lwNkNvd2k4aVlJeHh2ZTVpQkJlMlg4VGpCYjQyQnZEQkhMYWpKQ3o0NzRW?=
 =?utf-8?B?TUpXSnBqRm55M2YvS05wUGd4NVZWc1JqdmJZR0hBMlB0eEpwRjF4MGpFcHRn?=
 =?utf-8?B?YnRFRXJkU2YyeTVxb3N2MVFuVmdPVXhmbTNleGpmSm9VUjFQcVhtVG1IMS9D?=
 =?utf-8?B?L2ZsbXhhNC9QOHF5Vjh1cUhuOWNLV2czUWQ1c1BLRFNwNnNxNGtEM09LMytX?=
 =?utf-8?B?U3ptcGlmaWRLRTQ3aFN0RGN3Y1d5S084V3Z0Q2VmK0dESHFnQ0Y4QUova0NY?=
 =?utf-8?B?N2E1eHI0SG9GN04vd0hzOVBORnZoRFE5RlJjUUhUbXh4Y0toYUtqSm5kbGhP?=
 =?utf-8?B?UmpCNDRvbGNINGY2Zm1lUTIrUTJFcHhNUmQ2aGc2amlqZC9BaSsyTVA3VEpB?=
 =?utf-8?B?amxwcnNlcUs0QkJvSDcvRjhFVnBndm5nVDAxZkFjNXEvNzUrL2ZGR2pFc2N5?=
 =?utf-8?B?cmZpTCtodUpybkthelMxWUU5QVBzZXRjYkFNQzFGUjZoK1l5QzlKQnNlWHlL?=
 =?utf-8?B?QW95NFdOamY4cDJ5QVVNQllkc3V6TzVjNllBQ2hvSjlYVy9CMVNlSXdTc1do?=
 =?utf-8?B?OXZjWEhqMWEwWWxqRTYrc09YcDJqQllIYldEcnpEaC9LQlpkaDAwZGxkajE2?=
 =?utf-8?B?S0xsaW1Yak0xeVQweXN5QlF0ejA1cFFBcjI2UWNCa24wRnFpNXVOQUI0Mkk0?=
 =?utf-8?B?YWJCUklCT2g2V0s0d1NwcTBKam5NMUhDMTNBRkxLZVo3UCs2a2FFNjR1bm5J?=
 =?utf-8?B?TVRiTkZtVzgvb0hDZlIvVnNIazFrWmU1L3pIdkxITjBrSk9qVzBiR1ZOM205?=
 =?utf-8?B?TTROWFpmZFNMY0FTRkhUNEhadG1xVTBOZk1SOW54cjVlTGJ3WXdBelFOVnVk?=
 =?utf-8?B?dG1hMjVZU0FXWGlzblZFclhqR3ZFSUpOZnlvbXlzNUZHUy9SZEw0RjVEMWtq?=
 =?utf-8?B?eWd1QTJoRGxwOWVwbTFSeHRlODhYMlBIVnExeFY4bUFrYWVmZ2lpc1Mxc1Fs?=
 =?utf-8?B?V3hGN3Q3ZEp5MTJrbnNZWEJlTkdzd1lEcEFYRFphYVY0K1pJQTZ0Q2J6ZE0r?=
 =?utf-8?Q?tws1/fp9HHslCeu2OIbm0b4mOh63un7aPU+3U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFd0TjQzTll2eDNKMU9pU05SZDJyWmsvQTVPK3VKbWNEZzdMRWxhdW1IQ2JN?=
 =?utf-8?B?Nng1SnZGa01CYlZuNzdIbzhhWDVjekoyQm85ZGM0WHVFK25PVXZDUUVBdGl1?=
 =?utf-8?B?ZngzaGE0SngrL0QxN0dCWTlzNng4cDJVMUVCOHNNMTUyYktjcEFvQzZjR2tr?=
 =?utf-8?B?cFZ1RVo5VXhpUDJldHdlMGZaVzVjNUhuNjdITVIvNlgyZmpNWUhsbFF0NU5z?=
 =?utf-8?B?MGFDSGc5Q0x1Q2c4a2ZXMVg4aUlPMThSOWxFSVJkQVVIWUhLMWFFUmRnR3B1?=
 =?utf-8?B?a2NhL0UxcW4wdDY1ZzNHbGEva2tTcHYweE5HUnRWNEk1TDJsVkNBUG55ZENS?=
 =?utf-8?B?SkNKaUdQMDJCQWxWd1B0SUNoY2JZcFE2M2FNMDliOFFEN0d3UFVPTk1iMVhP?=
 =?utf-8?B?UU1lbUhhdUU1ZlZRK1FHR3NVNmxpNXY3eDNPQzJFSS95NWdXOFpZbmYxb1hq?=
 =?utf-8?B?b1oxWHh0bkVEcDM4WWN4enVDRmdiZmsxdnJETGZocUc4TzhWWUdzSG0zVkZP?=
 =?utf-8?B?QlZLTUZHbi9xdCtKeWhMdFA4dW15a2xmb0FUMTEwK0JQMDJBWVVsWGtiY0VD?=
 =?utf-8?B?YjBEdithN3ROVkU2RSszMm1rb1JMR0dvSDRMSXp1WHpWbXBHbFlUUCsvNzZU?=
 =?utf-8?B?akZmK3R4dGdGZjQ0bm85L092cGJ4dDBoRXBTdjkwWXF2Z2g2eUp4OEhXN2lB?=
 =?utf-8?B?MjdDMEJ5RERVU1J3L01vZGgyblp6TmsyeHlCaktNSmRxVzRWejBqK3gvRGNa?=
 =?utf-8?B?dVpVUldKOFgrSCtKRm9Wa0tuWWluNmREYStBSTgwODNXYmFaeTJUb2FQem1F?=
 =?utf-8?B?UktiN3hsRVViSkZlQndpTWlUMTE2SGdDdSttNWV3Q0FaakJVcFhmWmgva1Iw?=
 =?utf-8?B?Znk0WUpqTkcxWnRoTURDR1Y0K0RSWGVNOXJsaUluT2k0MzNEVk5zMTdaeGFw?=
 =?utf-8?B?UGZqaWVZSXY2RlV5dllybkdJTFRSNWUxd3JJZm1kRno3cUZ6UXBYam8xR1Ja?=
 =?utf-8?B?VXpKbGpsd0xkc2tyc0J1REdPd0ZTMnYwcW1ER0FTTlhPV1VjV3JVNUpFVkNj?=
 =?utf-8?B?NzRxb0NkSzA4U1dkUHZiZzVOM3p0Vk9IRmVXUnhzb1BoU0NnRkEzdFhuRTNp?=
 =?utf-8?B?emNyOFl5MDlGZEhBVzY5NXBsblM1WElIWE44am5vOUs2bkRDdGNFVzJTUTRF?=
 =?utf-8?B?ZXlIU0p0cU82UlNiSDQxb0hSUmxmQlRoNEY0K2R1NXNIOFptRjV0VDhjSWVs?=
 =?utf-8?B?eVBWL0g4R3pUdnVuR1Qra0ZwZFFjNmxTRGJSbnBEUFZjOFJRVzBjNXlDbWlB?=
 =?utf-8?B?UkJFWlhoMlhUYkJKa0llaHVlYXdtRE5vWC8ydUpoc1EwdzVOV1RMMUVHTTNn?=
 =?utf-8?B?bk83aElZdy9CMEYzQk81VHc4WTBTS0I3V3NCMEsxZVpsckluTWtEZmRhdUNl?=
 =?utf-8?B?QXl6Y1N6c0VYMTdMSmdrbng5SjlMZElGRFF5dnpwRkt0Ly9HK3E0dkljbWFw?=
 =?utf-8?B?VFlXZ2NkWU8xZi9GVFJCRnY4aTZvYkZaVXFoaXVPM1lLQkxETlNJYXZUSmQ1?=
 =?utf-8?B?OVVNeGZTbjcxa2FNWFp3OUNXYmtQYnVZRWhTVkhGVnMwdDBmYUhNRFpzSjV1?=
 =?utf-8?B?OUpuMjRNaE1vRTlkTTFLYzJxaWhWclJ6Mmp3bFMvaUNZYyttbEVvYjJIS3ll?=
 =?utf-8?B?dGxtL1c2d280MDRVQTRmdTdpNnNRQUtrRXRKR1NBVnpWUW5Ib1J6b0JTTzRw?=
 =?utf-8?B?NHlXWFUzekN3NDgvc2QzRnFnaXZteWNJYUVmOVFUKyt4SXF6K2czeEZTWUw3?=
 =?utf-8?B?R21sVm5pRDVmQlFKUVlqWFo3SjJEdHNuVGFzSFZxdXBNQy9wWjM1V1IzeURK?=
 =?utf-8?B?UmhqK3Q2MEpwMUgyQUpNTjI4Sm1aSlJ1WGJ3dzV6Zmd4clV3bzNTdHJvT1BN?=
 =?utf-8?B?L0dYa1RqTXlZb2VEV2sraUtndURqYWR5NGNRSUp2TVVyZzQzK1NwN3ZqNm4x?=
 =?utf-8?B?cm5Vd2IrQ2NDKzZMZ3kvL1V3bnFnMGtuNVhZSThaZTVjdG1ML3hpVE9zZU13?=
 =?utf-8?B?UjN1YmNKa2ljSnpFNkZlZzRZNVg4bFVVWHZYUnhqeDhiSDdlbCs3M09RSlVh?=
 =?utf-8?B?WG45UFEwSEE2Q0tFalNjak01YUlBS0tFMFQxSnlkdTNWc2ZmemtVSFZJTFE3?=
 =?utf-8?B?SkE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 13068ef7-4096-4d7e-1dff-08dcc74b6307
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 10:22:57.7085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vHnAMwNwwXtZfNODloaHxz1/sbaOBd+lAQi61dtwpOgkc64htYcl6cqc8VI6Bftj5UAvBDPgICcL7+zyKuHQbL3zXR83xE2gS0kLmPGQ4NA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10235

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAy
OCwgMjAyNCAxMToyMCBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvMl0gY2xrOiByZW5l
c2FzOiByOWEwOWcwNTctY3BnOiBBZGQgY2xvY2sgYW5kIHJlc2V0IGVudHJpZXMgZm9yDQo+IEdU
TS9SSUlDL1NESEkvV0RUDQo+IA0KPiBPbiBXZWQsIEF1ZyAyOCwgMjAyNCBhdCAxMToxMOKAr0FN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0K
PiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogTGFkLCBQ
cmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+ID4gU2VudDogV2VkbmVz
ZGF5LCBBdWd1c3QgMjgsIDIwMjQgMTE6MDAgQU0NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djMgMi8yXSBjbGs6IHJlbmVzYXM6IHI5YTA5ZzA1Ny1jcGc6IEFkZCBjbG9jaw0KPiA+ID4gYW5k
IHJlc2V0IGVudHJpZXMgZm9yIEdUTS9SSUlDL1NESEkvV0RUDQo+ID4gPg0KPiA+ID4gSGkgQmlq
dSwNCj4gPiA+DQo+ID4gPiBPbiBXZWQsIEF1ZyAyOCwgMjAyNCBhdCAxMDo1M+KAr0FNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+
IEhpIFByYWJoYWthciwNCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+
ID4gPiA+DQo+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPiBG
cm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+ID4gPiA+IFNl
bnQ6IFdlZG5lc2RheSwgQXVndXN0IDI4LCAyMDI0IDEwOjM4IEFNDQo+ID4gPiA+ID4gU3ViamVj
dDogW1BBVENIIHYzIDIvMl0gY2xrOiByZW5lc2FzOiByOWEwOWcwNTctY3BnOiBBZGQgY2xvY2sN
Cj4gPiA+ID4gPiBhbmQgcmVzZXQgZW50cmllcyBmb3INCj4gPiA+IEdUTS9SSUlDL1NESEkvV0RU
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBZGQgY2xv
Y2sgYW5kIHJlc2V0IGVudHJpZXMgZm9yIEdUTSwgUklJQywgU0RISSBhbmQgV0RUIElQIGJsb2Nr
cy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXINCj4g
PiA+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4g
PiA+IC0tLQ0KPiA+ID4gPiA+IHYyLT52Mw0KPiA+ID4gPiA+IC0gTW92ZWQgRERJVl9QQUNLKCkg
bWFjcm8gdG8gcGF0Y2ggIzENCj4gPiA+ID4gPg0KPiA+ID4gPiA+IHYxLT52Mg0KPiA+ID4gPiA+
IC0gVXBkYXRlZCBERElWX1BBQ0sgbWFjcm8gdG8gYWNjb21tb2RhdGUgd2lkdGgNCj4gPiA+ID4g
PiAtLS0NCj4gPiA+ID4gPiAgZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOWcwNTctY3BnLmMgfCA4
NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiA+ICBkcml2ZXJzL2Nsay9y
ZW5lc2FzL3J6djJoLWNwZy5oICAgICB8ICA0ICsrDQo+ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgODggaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xrL3JlbmVzYXMvcjlhMDlnMDU3LWNwZy5jDQo+ID4gPiA+ID4gYi9kcml2ZXJzL2Ns
ay9yZW5lc2FzL3I5YTA5ZzA1Ny1jcGcuYw0KPiA+ID4gPiA+IGluZGV4IDk3MjJiODEwZTAyNy4u
M2VlMzJkYjVjMGFmIDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMv
cjlhMDlnMDU3LWNwZy5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEw
OWcwNTctY3BnLmMNCj4gPiA+ID4gPiBAQCAtMjUsMTYgKzI1LDMxIEBAIGVudW0gY2xrX2lkcyB7
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgICAgICAvKiBQTEwgQ2xvY2tzICovDQo+ID4gPiA+ID4g
ICAgICAgQ0xLX1BMTENNMzMsDQo+ID4gPiA+ID4gKyAgICAgQ0xLX1BMTENMTiwNCj4gPiA+ID4g
PiAgICAgICBDTEtfUExMRFRZLA0KPiA+ID4gPiA+ICAgICAgIENMS19QTExDQTU1LA0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gICAgICAgLyogSW50ZXJuYWwgQ29yZSBDbG9ja3MgKi8NCj4gPiA+ID4g
PiAgICAgICBDTEtfUExMQ00zM19ESVYxNiwNCj4gPiA+ID4gPiArICAgICBDTEtfUExMQ0xOX0RJ
VjIsDQo+ID4gPiA+ID4gKyAgICAgQ0xLX1BMTENMTl9ESVY4LA0KPiA+ID4gPiA+ICsgICAgIENM
S19QTExDTE5fRElWMTYsDQo+ID4gPiA+ID4gKyAgICAgQ0xLX1BMTERUWV9BQ1BVLA0KPiA+ID4g
PiA+ICsgICAgIENMS19QTExEVFlfQUNQVV9ESVY0LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gICAg
ICAgLyogTW9kdWxlIENsb2NrcyAqLw0KPiA+ID4gPiA+ICAgICAgIE1PRF9DTEtfQkFTRSwNCj4g
PiA+ID4gPiAgfTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNs
a19kaXZfdGFibGUgZHRhYmxlXzJfNjRbXSA9IHsNCj4gPiA+ID4gPiArICAgICB7MCwgMn0sDQo+
ID4gPiA+ID4gKyAgICAgezEsIDR9LA0KPiA+ID4gPiA+ICsgICAgIHsyLCA4fSwNCj4gPiA+ID4g
PiArICAgICB7MywgMTZ9LA0KPiA+ID4gPiA+ICsgICAgIHs0LCA2NH0sDQo+ID4gPiA+ID4gKyAg
ICAgezAsIDB9LA0KPiA+ID4gPg0KPiA+ID4gPiBJcyBpdCBvayB0byBoYXZlIHswLCAyfSBmaXJz
dCBlbnRyeSBhbmQgezAsIDB9IGxhc3QgZW50cnkgb24gdGhlIHNhbWUgdGFibGU/DQo+ID4gPiA+
DQo+ID4gPiBZb3UgbWVhbiBpcyBpdCBwcm9oaWJpdGVkIHRvIGFkZCAoSSBoYXZlbid0IHNlZW4g
aXNzdWVzKT8NCj4gPg0KPiA+IDIgZGlmZmVyZW50IGRpdmlkZXIgdmFsdWVzezIsIDApIGZvciB0
aGUgdmFsdWUgMCBpbiB0aGUgdGFibGUuIFlvdSBtYXliZSBjb3JyZWN0Lg0KPiA+DQo+IEFGQUlL
IHdlIGFkZCBzZW50aW5lbCBlbnRyeSBhdCB0aGUgZW5kIG9mIGNsa19kaXZfdGFibGVbXSwgc2Vl
IGJlbG93DQo+IA0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L3RyZWUvZHJpdmVycy9jbGsvcmVuZXNhcy9yY2FyLQ0K
PiBnZW40LWNwZy5jP2g9bmV4dC0yMDI0MDgyOCNuNDE1DQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtDQo+IG5leHQuZ2l0L3RyZWUv
ZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwN2cwNDQtY3BnLmM/aD1uZXh0LTIwMjQwODI4I244MA0K
PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xp
bnV4LW5leHQuZ2l0L3RyZWUvZHJpdmVycy9jbGsvcmVuZXNhcy9yY2FyLQ0KPiBnZW4yLWNwZy5j
P2g9bmV4dC0yMDI0MDgyOCNuMjAyDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvdHJlZS9kcml2ZXJzL2Nsay9yZW5l
c2FzL3JjYXItDQo+IGdlbjMtY3BnLmM/aD1uZXh0LTIwMjQwODI4I24zMjcNCg0KSWYgaXQgaXMg
c2VudGluZWwgZW50cnksIHRoZW4gaXQgaXMgZmluZS4gSSBqdXN0IGNvbW1lbnRlZCBiZWNhdXNl
IGRpZmZlcmVudCBkaXZpZGVyIHZhbHVlcyBmb3Igc2FtZSBpbmRleC4NCg0KQ2hlZXJzLA0KQmlq
dQ0K

