Return-Path: <linux-renesas-soc+bounces-7442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF08939F00
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 12:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F155281F7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 10:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3311214EC5E;
	Tue, 23 Jul 2024 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cQp7bNzI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD293D6A;
	Tue, 23 Jul 2024 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721731897; cv=fail; b=j3Eb/CSinfo8QFz1ol2OwhEUxbSMbxIhr2JHi6IotEl1lBstqzKSjvmjCMhZm+RsroQ9ECTnJ3+fWs8ZnbFab90o35tTBDYxW1KAEUbolQRSYiOW5tp98QOLUUJ2ESvkuf+1jxkLKFj7q1DaTAJvEvQrr1bRfgDoao6kVkVUi3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721731897; c=relaxed/simple;
	bh=saeyYtJsEruL0zqwjr04i0ky6erwhiSmoYrXzUTWyeU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ICDBja7H9XZGjxM3Zp1X+vb5YmAUWezTJpr5qQUPPB/BrcXC4tHOpsTWig7c074vFDALGDBsSZTN0Q9asa7vjhcnNWUcrXoo8hJMjKwp3wIIuvzEd6aacK7nJ1VLHfhGkMsS+oH8hqChDf/jTY7c/6IJ1udpawQS6ur2OBiZq38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cQp7bNzI; arc=fail smtp.client-ip=52.101.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJLogtMfM69+V70dpu5bHe3kuFhuhWJ8O6ABfKMf5SwN42fBKAbDI9gkjS+wWjBEl8ZugNo85QDC85StbqABJlL/eHPwhWjzvrre/7/yrYWJbxRZzoW/exP4Vm2IU3alKRLgzXbWYqhGcNsQ0VXFjyfPCBbpwmSxx6LbS6yXbmsZQ6HW6q582EhISJRcqBEohbiQmcnekYzV3fsaFKFfRdAqhp8INuYewjYtdLxNYpmqtp1tDzucZJY7vGw7GH6CRLG1fLgs5xJWk7WCLkOoyJWOw2nCS4S4FTpddWyGfBKzwB66tbaqyRMqFI734h71tRYChFzi2hLTobCoC1xCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/AGXdHONYi5kxQYZKvmfsts5cXsDD004xCnNvqZXlI=;
 b=u0JObl4LMcT7EKmgAb521D7KHQVYpOGVWy2K+b6PQPv1C0pYpSXevEx3WRwEuOo0Hh6eQ1C8H39cIllZmyp0VtUGLYi/SuUiyZH9xvXhivS26COTfVtWf2GY3KF60bJ9L/qFxETZTufrtbuecOwaqSTseCHwdcRgiFiXVw+3gRpDxQbl1Eiwpa1CGVi3AmF3vOmZ4GC3nfz+yPpklTpsXW9tGr7YT4CeIfRYXSGtx+DZ5X53Ai4ywFZ/vgRxrwOkKs2BP42xQQDRpqAKp6myxgmsQi1WBpRaWxqz3qEcoJypizv/7tZzKxdwItFO+8wc5f72LbnqKgNvhB5Dr83eCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/AGXdHONYi5kxQYZKvmfsts5cXsDD004xCnNvqZXlI=;
 b=cQp7bNzICHEKyVeAYzr5n46FcCFFzOdi2/cXCnf7ZKC9l9ZgR537jXNaHo4oQE+XlkCwOYMvGdwJG80HoQM4jixSOME3rxVJqfw3rIiAgfCwQAID0+5cG8EwcRM13CIE8WIs4aZR7NH7C5nmUZvGT7CQMxbercf7K/P4+VEFmzA=
Received: from OS7PR01MB11537.jpnprd01.prod.outlook.com
 (2603:1096:604:245::11) by OSZPR01MB6847.jpnprd01.prod.outlook.com
 (2603:1096:604:13d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 23 Jul
 2024 10:51:30 +0000
Received: from OS7PR01MB11537.jpnprd01.prod.outlook.com
 ([fe80::b98b:2925:d3c7:b4ee]) by OS7PR01MB11537.jpnprd01.prod.outlook.com
 ([fe80::b98b:2925:d3c7:b4ee%4]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 10:51:29 +0000
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/6] dt-bindings: reset: renesas: Document RZ/G2M v3.0
 (r8a774a3) reset module To: Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Thread-Topic: [PATCH 4/6] dt-bindings: reset: renesas: Document RZ/G2M v3.0
 (r8a774a3) reset module To: Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Thread-Index: AQHa3OxRBotsk/P7jEKeOaF4r/lcjbIEImTw
Date: Tue, 23 Jul 2024 10:51:29 +0000
Message-ID:
 <OS7PR01MB115372ED19B17D040127291F6CFA92@OS7PR01MB11537.jpnprd01.prod.outlook.com>
References: <20240723103705.9774-1-oliver.rhodes.aj@renesas.com>
 <20240723103705.9774-5-oliver.rhodes.aj@renesas.com>
In-Reply-To: <20240723103705.9774-5-oliver.rhodes.aj@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB11537:EE_|OSZPR01MB6847:EE_
x-ms-office365-filtering-correlation-id: 516a8d37-5166-4c3e-68e0-08dcab05689c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?GZYk4uy/OWaeRd3A0H08UtaOTmRrJKOKebhAIXlK9Q58lCVB2fYhCA4soyny?=
 =?us-ascii?Q?WFUZN3khHO47oi7Cxo16k9T7STOrIKyu65KtAUC5v4PYoAkodLZWnZvVW0kM?=
 =?us-ascii?Q?CouQ4m73P4mnjL2WLVh2EG73hOM6Y4negcgy41iSiRuG3MURzNq0t493Qxlk?=
 =?us-ascii?Q?islyY3D5AO+I/h0rnrlt3QBEan6K+4QKFsZPX+4fzAlCy9opw+31Xk0+YQdX?=
 =?us-ascii?Q?CjKddwOeVVJ7CwPJ1D0xbYk6/yCoSCo89viGCeYPUDUwWsCmwjNuUyGPoi+v?=
 =?us-ascii?Q?AmgVgAclrDzCAE6qQY3Rln8xX+04yiGCwm72HqxZ9Dwy6yKgtCQ5SENKF0UY?=
 =?us-ascii?Q?V8+RRG1xaenslHhaYO/wxURQvP9ybUIhCwbAYdUYJ/LNRRHQNoNu6JOJjrl0?=
 =?us-ascii?Q?UIKcvuuvGxr5+Mcb9vLhKae0eu7fsg3xxmb+f93AButHkjaf1hfpwIL0by14?=
 =?us-ascii?Q?lZK1e+P2XLZnaEMXw7wTRx2eRLvoMBnt6+amPMrL+r+y32e5EFG/WdedZoRy?=
 =?us-ascii?Q?I4p2G1L+e/4H6nw1p0s4Biw+llQW92/BRJaIf8cwxzGTTSclgH3sfCGbZmIE?=
 =?us-ascii?Q?JjPxoidm7ZtLoV1Kan8GWXIHkUV2pnBrz4lmk6uUBRFw886v3RDkmp3I/g15?=
 =?us-ascii?Q?4p7zx9PjiOMVdjIb8m0zErHMv5TKsqkorHYSbXtbRqwWVYZh6P0P5vnXgr6d?=
 =?us-ascii?Q?Sa6cleK+W6wGnejM0kR3NgE6qagr+uHJMxInW8V7xr8EQsyGDpznrMFDgPSw?=
 =?us-ascii?Q?X+yb1BT1fDuG+EBZ+WnYTmmb5iar9vjrXLeng68Zv51I+Gys7vIgnZXHf5qO?=
 =?us-ascii?Q?VUJZ8+JGILLMdsIS52gEHILmRhgs7PwWWR05oAtMegIQeJrb0SUBbbuYf7e4?=
 =?us-ascii?Q?Dc2FxmYGRAyrSkU1xTkkzEG/40Rm9+wKiJ1lrWb86ZJoRsg5CHY2lIen7sAH?=
 =?us-ascii?Q?6EWwpye+JV+nV63o44/4xRrG9Uouo8jp1mTkp0iJbNK9GuFSDhSoRIcgh2bx?=
 =?us-ascii?Q?FxJ15L7gBuB8wyeQzaUp9ccYqyHxb1bMR4LG7d0sLeiMmU7wArQhM+yaWUCc?=
 =?us-ascii?Q?Rh5HFGQBDp2Z16wDci9PdYWQ6Avf+wXz1UhOhmuFnCX2eEEYGLy6NCzAQxzF?=
 =?us-ascii?Q?LsnJHH6wvJoMgbJz6Jr60BRuPwQJw9/k3tAShiEMaEtfOZPaQJgqkfRhypXX?=
 =?us-ascii?Q?Y8KNFg4Ts+UOas5XN1a7N9JhiV0k1rmklSK15iOTFAPPOb6J74T1umMMtHeb?=
 =?us-ascii?Q?fTGpANU7pmVplhSGWgV+CbIELa8lsjokMITMkuA7chaza+TDmMijcQxgDs5Z?=
 =?us-ascii?Q?SeDo+C9aA2nCBo0fEkToT6/QFL6vwLSYMO8zBxPJRCSOe1HXdpat5X/Qi3hu?=
 =?us-ascii?Q?yIqkfj2n6HLwNev2J2eWwa/JJKFK9KgDzHLXOxYHSSJpScgNfQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11537.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jbas8hXmO+8v7HcJ07CMqr7laRQKAwyBw8Z6TgaSKJqgAbM5aq8fbgZYvT2z?=
 =?us-ascii?Q?d7Lj1UI+yvJCyMmmpwOkwY9UUNuwJNpw0962EokYulkNCAQF4l3xlYyMX9yD?=
 =?us-ascii?Q?qr3GManTlfTDpS+8LhX2Q0fEP3ZyhR5VTETni/N8PayTRZS5xticNRjUn6hn?=
 =?us-ascii?Q?Yb12bSbpKTnmDcbQjaPf5aJwHAxYUfXJFncfjBmvK1Pe8Q1deLMDaN897u2u?=
 =?us-ascii?Q?5ynKxjwTkeDeLsc2liltLjr3xIKp+V0Dd68HgFzGfTgs2B9lDQQzPTX3kWZT?=
 =?us-ascii?Q?lqBQr+PkXjMStBruv+EOpgp7+0z8YBB5R2KymGpzOrDYDO16YGKfoldjzmG3?=
 =?us-ascii?Q?ltPLXbqMRjfwHG7Yi8+Q3UH7bXLrCCqxbYS+7u1mgNb+ARa/2+YOYb6jynO1?=
 =?us-ascii?Q?nce92CFcW5qb13Ou1RSBPtv4HDUef8A2whuhXfMwaMHVFuLqb8eNDLpQML2W?=
 =?us-ascii?Q?f5H2aCLviqEnSVGgMRMGywIN99IH8GOrqiOs3y+XCWdvpdIcGksyvXU1Y7s2?=
 =?us-ascii?Q?9WeWyH6od93b8PFwT67BOU4m/iIIonBjpo8PZk69FPtmp2OLDXrOpyt64d6m?=
 =?us-ascii?Q?T5DJsMYUz3mlEbc6KrPMmFh/Kvz0yT5nY8gJ78Sw4e9eDLHdBhkzlnotTUt5?=
 =?us-ascii?Q?k4f3ioABr872yoO1/div+xabUCzJtBe2QCf+SMuVzb2mG3HpRLovzOyy0+ja?=
 =?us-ascii?Q?ROa/gUhMCS095yFUBCrMPITwk5foqoqW8WHeNNrw7rje/2xFaFHgdu5riogS?=
 =?us-ascii?Q?I2V1y3WvywvlpO9ZmPZdWkCHK1xI2UYhZDAmkwoCaAmP7D/zjcqIjlpMCiLF?=
 =?us-ascii?Q?WxlOqA38ZPudJArsZOqkCBihygsiFJlh6T8wQlG0RMLfg/fePhbgD7ZPQp50?=
 =?us-ascii?Q?MpBWQICbkdM/ANbl09iGhC4JevTDC+yK7Sjm/AmnSdAn4mnUMnbf9c2hxpp/?=
 =?us-ascii?Q?b9G0hsTBVKaNEGjbvEJF4Ga6AN0+aiQfhMxA0hbm8B1gGK3JG/8laO1rtwv2?=
 =?us-ascii?Q?DK9lqJSppVFrGEIKZzK5yJ4b2LfqZp8JCU53zgwJKSpIM9s9Yq3eBHsc4XuC?=
 =?us-ascii?Q?XiQUX+i4y/T8mju86VUt3Wo66yKkfHae/MOof9eDaRC+1ec4jUDW6seYzFN1?=
 =?us-ascii?Q?B9EFKqqKM8b+ZH3azTXFIC4NTlU3f3Z7JxCZ3AgWKAgdF7dqdpv8ObJZO5OX?=
 =?us-ascii?Q?Nw4XgsijjSRkD2ZIdLMdVPoSlHg2GUD7COkohrutd++yT0fJnPr4MclzdkX8?=
 =?us-ascii?Q?tB67Qouoq4u/UwhCHZ5gpI9VDPnEB6YoeoLzml4PlMJ5cflWdQfd0+bpl5+j?=
 =?us-ascii?Q?3ETJG8ieHQ+yeU7RBKcpkmJssTV4wbd2v+u2kh0clUvRFU9rzJszwV5KgpHM?=
 =?us-ascii?Q?tIdQC9m3IQat1emvQfJIOgdm/ju4EONaEaKViHj5o7kRcWULBMIwc+IeqpBt?=
 =?us-ascii?Q?mxjq0uYBzZujI2CJRbD7pebKSy6B+qVwjDojlx+5PdmhDuqlRpLt9+TQZdA4?=
 =?us-ascii?Q?VehAnqPEJg/AkW3AlIFNtx5sxrGvP+yOYKME8OaTZKfZxmJnhEvY91w2E8EW?=
 =?us-ascii?Q?0Wdlwq7dJ1z8sbDQAlmozIwuGOqPfhbJbfRdeOLneWQvHOvAndfFTDpOEy0v?=
 =?us-ascii?Q?0g=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11537.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516a8d37-5166-4c3e-68e0-08dcab05689c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2024 10:51:29.7671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vRapG6JLSoOcXmPIDvlL4rLm8IwTum0eQI0NiOFlAbk5N8e5pkaWfYOh/TCWYiGzIjwrfmixvV0Ek1sEDksmMKLNpT7YXf6ejR/+/YoHWHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6847

Hi all,

Something wrong happened while sending the patch. The patch header was inco=
rrectly indented.
I will be resending this patch series.

Sorry for the trouble.

Oliver.

-----Original Message-----
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Sent: Tuesday, July 23, 2024 11:37 AM
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>; Geert Uytterhoeven <geert=
+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; devicetree@vger.k=
ernel.org; linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a=
774a3) reset module To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring=
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley =
<conor+dt@kernel.org>

Document bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) reset module=
.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
---
 Documentation/devicetree/bindings/reset/renesas,rst.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.yaml b/Doc=
umentation/devicetree/bindings/reset/renesas,rst.yaml
index 58b4a45d3380..7a81491379b0 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rst.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
@@ -29,6 +29,7 @@ properties:
       - renesas,r8a7745-rst       # RZ/G1E
       - renesas,r8a77470-rst      # RZ/G1C
       - renesas,r8a774a1-rst      # RZ/G2M
+      - renesas,r8a774a3-rst      # RZ/G2M v3.0
       - renesas,r8a774b1-rst      # RZ/G2N
       - renesas,r8a774c0-rst      # RZ/G2E
       - renesas,r8a774e1-rst      # RZ/G2H
--
2.34.1

________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

