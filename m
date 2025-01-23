Return-Path: <linux-renesas-soc+bounces-12371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F00A1A0F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B9A316DD60
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 09:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EBD20C49C;
	Thu, 23 Jan 2025 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M00ZOoz6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76DD20C028;
	Thu, 23 Jan 2025 09:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625306; cv=fail; b=MSJBs/RPQoKV4Gtr6IEubNKrjmNjQ0WIM7+NXhcPPSKGOdj26rMQPo0s4zxbM10tVpPmt61jZrMk9EmQTz9jrp9w169e5yaL7KS1LuolS7ONF4mmvIU/sBeiFbrOGgeNZ9+HpByPzCJ9aeWyvooZZ/4yCrjS+5mg0dvuyYh7zY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625306; c=relaxed/simple;
	bh=rf9QEAxvINtBOM0sKIO7xPI/gH4iWOEFQ2SVspzsspY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oOKu84YaYfCJYwud5MrVyfTycD4hPN53E5LFsQTaQ5o+ahtXuT2zigcLYhaB86YL0iTOaOmSli9xLBa8Vd+OA2XrliC2TDpUpUQIul40kRuM8rr0tWyde8nKrmX7rgJbJHd0X3wctIURicKv5mbR/uy2m1FpvcSAVcMW0PzOEjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=M00ZOoz6; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYdX90My8GMifBm4RObA1+Msjcnx8pC9etlnijWxVQivhYViyXf+3HNVNfFot2cIhevRJRi3159wdgvqqcx/Jc5VqUaf42tSk+Ru8aYYxnga0HhO+4KixxhsQUaQaYPdjl/RK7BgdOcZePXBhhBvQuuuYoRunDFPHd96DPGU40qdpx9F97Yo7w7uhYu2jRLntd4E32HnG1BaacIDZgzKhrNJ+zQy3YgS6IQCmxw2MOzw/P0mHZbbMiaxuKbZgiS7TvU4MP4Gcq3vSCRiLkeO72Wn0u5UVYELRxJDNNSGRoaoWHbiZBtK4/JWm9FsgpbtZbZWsPlkKoA/0LRO+YMDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiJ2Bexzyre6NChZLQEAQe3/ANOa6vIukxuwjAdep8g=;
 b=EBQ00CwemD90DielaQ6sCNqZpGcqHg8B7bkjTabJZMMiBzPb7uZCL/hQlxMsqsyzP3kgEcDnYW7QoN3AwMDKVnmoU1l14agwglIHWaa0WbQYjv+OwQsfF5YhuS/MMkFIYanhxL3Se3TfTGCVXF2WfWNnOmtf7XsmRpUJZgdG6ezVUUZPD6jWdHQrMLhUUwmu8nJZaIRFTjROKksJumCAQtDzMmq5yyEI94YP22dvKr1RUSNYPWF6M8Uo0omO6NeMZdVRecWfYFTF0CBS6wLMds5DR9jwGFCIFta6QhPmszbTOeKJzixKadRzVX54fAgmDrcMAJA8xkFMckTNM3OciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiJ2Bexzyre6NChZLQEAQe3/ANOa6vIukxuwjAdep8g=;
 b=M00ZOoz6GWDYyomwlpyUG6umuEAdN9IK2n2fznvHiUpPVEDfL2t2CDkAA9+GSkDgBfbO6Gr+8Udzh+dfMedZ8DFe2TS2gsKpeJm8GgJ+ry3AoGrCtGM+B+dQrnaNCDp8Tz191B+3bTct5/yI6srqUoB7mERefiK49AhWK3Wg/iQ=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYCPR01MB8157.jpnprd01.prod.outlook.com (2603:1096:400:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 09:41:38 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 09:41:38 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 01/11] dt-bindings: interrupt-controller:
 renesas,rzv2h-icu: Document RZ/G3E SoC
Thread-Topic: [PATCH 01/11] dt-bindings: interrupt-controller:
 renesas,rzv2h-icu: Document RZ/G3E SoC
Thread-Index: AQHbayBV1vjwKyroFkajUeWtSGxsSLMkHm7g
Date: Thu, 23 Jan 2025 09:41:37 +0000
Message-ID:
 <TYCPR01MB120937AD4108054D3BFDA2BFBC2E02@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250120094715.25802-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYCPR01MB8157:EE_
x-ms-office365-filtering-correlation-id: d9f62f08-41c1-43f2-4d46-08dd3b922225
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?y58uzOnuaQDS9NbNBnhi713+e9lRiERWsFGIqEvbD96Kqd7aKvNekPLnzseZ?=
 =?us-ascii?Q?DsQND9JAiDeX6NeT1toAuSU5zh3UzA7xXyNs66E7893Vwx/4PyvRr5s2QmSc?=
 =?us-ascii?Q?zZQVpTYppSk01YIkyC3IivT/iAZr7Ry9jn7PNTTH7Wxsmz2/T3urcwFYD9C0?=
 =?us-ascii?Q?n2OjVRCoH3useOvOEAroKTImGkaviAnxSkkYHF7j772kAItHyLfAet7ruI9s?=
 =?us-ascii?Q?g1yqDEH8Mm8cJpLF9k+kh1FxRi80KJIarXuoFpgEUlUQDvekNshIHplaBsAr?=
 =?us-ascii?Q?Xofni0RPbA6LRSdOMkG4DO7IW1XZuuU3x6D1G2wMLYP2kB7YtOnZ4tQDQIMI?=
 =?us-ascii?Q?NSVTTf4HnQKWwFSjWaicfbzLuGS34urP7rWR4dtaBlMqPubZbLRCqlxfBXeh?=
 =?us-ascii?Q?LM8/af6GF/qW3TzOutkfNpDddouHD3W7yMDhJGAjNe8SH7j+Lv/wmr1COsqR?=
 =?us-ascii?Q?LSUpQk0iyWSAAyAn13eClm2cHA5xRa6TEOlqKKbNMZzvjgFqWfXq0vdUrMJe?=
 =?us-ascii?Q?ucP0AvYB5JRLmVt9Ivep++xTPkSJCkrUr8Zc3cwA4NXghec9bp7N2C+OvcjD?=
 =?us-ascii?Q?X7ovP5evuYQqlU1dhb2XMWKoQ5jBD/tG9A4/+nzR/cOckIJGflaXIivW6enA?=
 =?us-ascii?Q?CBsyaVhVH6o2GlMDNRidMvl+RIlGpvxpFwopdF1ChNCRWzJTdW2QOdV1WQQQ?=
 =?us-ascii?Q?LMHg73BOOM1taJErGzhmURShye7DdTRdS/IdMTdLfk+LIiWBSezbEoYplH+z?=
 =?us-ascii?Q?JluOf49tMrEuwCrXwldDUm2feq1a8nyVxIyowMLi6pO4SgqFDr7I2C3ymx57?=
 =?us-ascii?Q?GfjmvMVc5u2o+FOAQvMXbidWgb1UcZfrT9Jz19vdhJ9+Owosu7yQ1mMsB8Jh?=
 =?us-ascii?Q?9HTodLhIe1wS+vRvS9VDWph87n3NbIUTvo3xYKgaL7QnPRn9K6kV8tK5nN8s?=
 =?us-ascii?Q?ZlNTOwr1nyEDlvIpLuOd7Wf/1YVuZrJsXVLc0/x12Euy4AmD4xXL6Do/tQev?=
 =?us-ascii?Q?MZQv6DYSTu8iTrbkZY8rZIlFvxHbYZuatLjFb2AJruJZhUv78ub1A9/GnQ+K?=
 =?us-ascii?Q?r4GeeljiK+cQ8pBVJv6ku2+nPjvtnH1+uOcAvjYq4vA40qH0gFZG2z+dt0X3?=
 =?us-ascii?Q?UXpKFq9lMaY4er1Jgp3/BQyFp8MbfyzoUPu1G0b3D2xqnLmkFYoIEQpeJYbm?=
 =?us-ascii?Q?e76+4fzqYoPh7lOSmR25CQCdUsiLzU04bwslwGLUwtUXlxeN70icN76395u5?=
 =?us-ascii?Q?6N7zEK6cyHT+wOVTyQt21inb6jT+rnPQwf5moq2UwTTId6TPMQDzkn2HT4iK?=
 =?us-ascii?Q?4Zu+NcUi+M5JGH8mxQtVP4TIBsRNtelBJcNcSJ+OeUX1j3u3oUGhNFqa6icS?=
 =?us-ascii?Q?mdfSGYHjf0pbt1Uu1ex8MfHa8t3v?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LwEPfwXYNoqKfn0jmjNr+0l4j+w8F2ka9zCMFJNSlriO8nLjXcjpguhBq55W?=
 =?us-ascii?Q?HpzqAJ7ozpEkfxtvnOfogK16738joFlqER4NhzEA1Ku1WuyKduS9x+ZB9Eu1?=
 =?us-ascii?Q?kRZluBr+pbKostqZ77OcA0zdJ4Md49asrTlc01LLUX4Hv1ukW0ppL4CeHGNd?=
 =?us-ascii?Q?S6oHIalteKUGWEDGGk6JepPI1fI8Yk01WIWlJiYVfVcP82AakE5wtswnhK+1?=
 =?us-ascii?Q?43jp2I/DVLLpntNAQJDqMPe8tumjHQN/kgyIQyA/BziUYTB9kDrLNoSCW7DC?=
 =?us-ascii?Q?3JFlzbw74kgE2A1jBsJBGg9J1xP/45lBrVxCkUgdjZxaMqadbnewLCibyVMG?=
 =?us-ascii?Q?TiZI54m2etE+/F+55Eib3tg2+VQ0EVvrW7qBwKqHlEKQytDpjMdTJbUXpCpd?=
 =?us-ascii?Q?TB7t0mp9YURBSBuK7kvVU6zOxe/YMqISYOrK3lUJqycgGXn342J+BRtKqWnw?=
 =?us-ascii?Q?nH6lyWLfGH8Ly8lYlyx3hwKLRWmRL2+BNNHgenVDPHY5RtaMLXZRrW7kI308?=
 =?us-ascii?Q?IF0ZDuBMi9dn9LCJAEuosfaui20Jhlk5b+q7uktgRBI6x0OuOj2bhMEmm1PJ?=
 =?us-ascii?Q?LCC5g8T7OZUINHZwM5aD6Q3UhXPrmTpZN7D/Vaa+EBQn/QKwbF7maxzokJ2g?=
 =?us-ascii?Q?W7CO48fAB1avVviG1zqfSUPoAY/bNA7rFtb3F3Cx22+VF91JrLmbH5Yv3vOe?=
 =?us-ascii?Q?YVT5RyBF9mbq5+8w0nBBuQv5MYLdI57YcbQBZB+7hYnnIoeosnB7DtTyl612?=
 =?us-ascii?Q?dh5TOCJPQLlQfpzGly8cfKVjPSjuF9/k9FY8ruSfukxc/lTr1lLzUEc/RoXU?=
 =?us-ascii?Q?zZT5WxGy6FmRO2DFPTFOJg9bmQZ9FxNU7mNBdiNAZEIzzBZLKqsenqWUNdEN?=
 =?us-ascii?Q?fCvHzt/aL+2bPEdCULysDO1ZcdKzpJHCr+vEXRCmZgFoXdBfW6Og/9rS9aQj?=
 =?us-ascii?Q?qaXc+7arfC6hepmotTGd6HkRviUo3XUfez2sSHS5kTdcimr3c8OwECrQA64q?=
 =?us-ascii?Q?95apkf4yr1TzEqRVsQPvFoQs/KHIFlJwqBHGDY9KUvIc/vTucVqcGh77ZuJu?=
 =?us-ascii?Q?rzF2LBIC5phHQ4bXl4e4DcdA6Y7gxG0oK4GjCmgQtRGe2VwAw4X2WD8h+Te+?=
 =?us-ascii?Q?yW58bM8cOIooz92BrI32SEMkiR+X6kXrAhcHkavoYGeJ1NYfiU9QN/FLj0o5?=
 =?us-ascii?Q?xuWn783Hp9OPGJ3waDyJWU/KkGUXNJQaRJ8bKomkYiVMf+XHzhXOK9xq3yLl?=
 =?us-ascii?Q?fZVhrRODfV/7q+EwAOGkz/grc2nj2qtwglLGtine+aSe6/qUqTPUqKg3Du/t?=
 =?us-ascii?Q?4ScOUk1WuoWhlpX3Wq7h350LoYFzWK5+9O9wNB+uLsXYgDRvI3EA7ZUq/Hq3?=
 =?us-ascii?Q?q3CP+jrzyBmxvcLFL8NBaiZvZNVJMwidk4CHH+orJNzZdy6smbtHgajti0Kv?=
 =?us-ascii?Q?Hokm78iR23S07WMM9Jsn8sfzIJpDqGZlZwfeuU9OWxXEtgnU7OCDxzSuPCKC?=
 =?us-ascii?Q?iGuq1RgTybipGWhkbVuyNTQCyNH0W5ft5uPh4PQFx+kfFfwwEeCY9EQd7hIw?=
 =?us-ascii?Q?oJIN3/9mjyK/v+fAOB2XtF6qGZjMZM/SwRyZDiK6/KVGpWJNy6comXCecGcF?=
 =?us-ascii?Q?Yw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f62f08-41c1-43f2-4d46-08dd3b922225
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 09:41:38.0069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qTQrTtd0csXgy9LStmbluC2IsjJc50SpVvRabTN6unNcXImJzoa4LrPiEemMmyXafnKVaSPkVThF050uiC1BgJt5RA1YRVF6RtIMIBhxXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8157

Hi Biju,

Thanks for your patch!

> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 20 January 2025 09:47
> Subject: [PATCH 01/11] dt-bindings: interrupt-controller: renesas,rzv2h-i=
cu: Document RZ/G3E SoC
>=20
> Document RZ/G3E (R9A09G047) ICU bindings. The ICU block on the RZ/G3E
> SoC is almost identical to the one found on the RZ/V2H SoC, with the
> following differences:
>  - The TINT register offset is 0x830 compared to ox30 on RZ/V2H.
>  - The number of supported GPIO interrupts for TINT selection is 141
>    instead of 86.
>  - The pin index and TINT selection index are not in the 1:1 map
>  - The number of TSSR registers is 15 instead of 8
>  - Each TSSR register can program 2 TINTs instead of 4 TINTs
>=20
> Hence new compatible string "renesas,r9a09g047-icu" is added for RZ/G3E
> SoC.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Cheers,
Fab

> ---
>  .../bindings/interrupt-controller/renesas,rzv2h-icu.yaml    | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renes=
as,rzv2h-icu.yaml
> b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-ic=
u.yaml
> index d7ef4f1323a7..3f99c8645767 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2=
h-icu.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2=
h-icu.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzv2h-ic=
u.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>=20
> -title: Renesas RZ/V2H(P) Interrupt Control Unit
> +title: Renesas RZ/{G3E,V2H(P)} Interrupt Control Unit
>=20
>  maintainers:
>    - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> @@ -20,7 +20,9 @@ description:
>=20
>  properties:
>    compatible:
> -    const: renesas,r9a09g057-icu # RZ/V2H(P)
> +    enum:
> +      - renesas,r9a09g047-icu # RZ/G3E
> +      - renesas,r9a09g057-icu # RZ/V2H(P)
>=20
>    '#interrupt-cells':
>      description: The first cell is the SPI number of the NMI or the
> --
> 2.43.0


