Return-Path: <linux-renesas-soc+bounces-17113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F499AB713D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 18:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82A0F7ACAC0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 16:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B817B280A57;
	Wed, 14 May 2025 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="t6ARj6Hj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92060280323;
	Wed, 14 May 2025 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239912; cv=fail; b=tdCP/TVdsTF0EnoTohVg20AgZrVHy3nrC45IxwGTEb74D7wwTPWW6LDNA8k2r1Kyaag1AOih6shGQ0g3746XGAJHEcwogGSb7KaPC02XiAfznyrcgIayZDiipHMtzkA2s3UTH+P6CgwCm382MRQdK1JGvFUsbH/nu0GCDa4uYA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239912; c=relaxed/simple;
	bh=Su5WqaTawe5k+ydsmOsTOO6iZetNEYYUPLd06qWbrF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hxtt9R1PoyqswrNZawJDdAyzigYdgYvNlvOwwJ3KPK1UtIEmUc1eaEtHrE+adrUJBVfmpks/EB79RaER2R9TepEAim++BLDSsrLRWclHdJkTJb170XX5RnHQPaNstTJgxynIvzNungIEHz/NG1GAX2HowjkWTxe0ZTt4DxnFjC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=t6ARj6Hj; arc=fail smtp.client-ip=40.107.74.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCZNhmi+L6zsdEkStx1wX5YTXJtR/ZZ4aX2WR/tan3gAPUqlMlnNCN8gCTL+b2UE12Hdes/IeL4StO54tYjaRya2YJk+f8sKY6FYSQ/AIZiSrrDtfVcij1EKXvMUB7widchTkxWh0s9jbY0Esur/A8MujPgR4pFdTq6rA15E30sixuyqs5oft7QNRcJ4OZC0Hibr86MV/1AwZBzNarZ2AJB+/4rT+CVyIyR2Q7/w8ALtx1xe0JLoDmrINmCw20bFSJRjwA/4jl2k/bCOfKE8Opg4+4cmATEnl6ewn47cmAuko3SxXLfH0WjfIdeFNYr51IUiq0jdg5DznatrZLl75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9LShqfu5f+ZRWGxdeQ8F/gT6bUGlphMfUwWp4efwlo=;
 b=D/AIcGpDbpWS8e1cMbdLNzqnAedfVy6KUdZsO4hTS4ZwdQQ4E215nUa4n/UQdRnvRao+9xBwgxZAuvm8uu09sgIL6cT1D2CpP8pQqGcHv7K0PcBohuT07OQqtoCS+VoyoarmEmw8RXt6Bxj62c396MBrbUq/ci+RAFkeJZTTNtQqousCs4M4MRz46LyQlZyIk4LT3VR2Y5Kn3lHDFoQGD1L7OcLzY3GZUHkI/M3al7Y3C2GpDabaUEp0TTfcN9FZaFUztSCdT9h/M4U9pykqFoXkfKiMZuqi5qDPrJqsl6Rj3kHFJfWb2bD4HL29T07YXsgI4HDdetMzBsq80t4+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9LShqfu5f+ZRWGxdeQ8F/gT6bUGlphMfUwWp4efwlo=;
 b=t6ARj6HjbMY+fOXsVwYsWJLb8Z73yp91ETsSbUGvx7P2+WHTS+MkrOIRJ3dXYc2lTZD7spBigQjwXM8SN1s+S0iGWVAhYIn/U1ZGTTR55dzWxBN0WZjcztjI0fwg51eajIomIQcz5nedo3qmHers0hrOQGiwcHvWMZQ+92I0GFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYWPR01MB10520.jpnprd01.prod.outlook.com (2603:1096:400:29f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 14 May
 2025 16:25:07 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8722.031; Wed, 14 May 2025
 16:25:07 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: renesas: renesas-smarc2: Enable I2C0 node
Date: Wed, 14 May 2025 18:24:19 +0200
Message-ID: <20250514162422.910114-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::8) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYWPR01MB10520:EE_
X-MS-Office365-Filtering-Correlation-Id: bd79e98a-a01b-408e-64ec-08dd9303e395
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PZky7wPTDOBz/1aHoGTOt+ZdrSNenyzQesSbk7KOA2ygXgNbzsCM8j9j3vdU?=
 =?us-ascii?Q?NbrEMVwbDA+M9s4qwKXBKCxtW/KDBTR23u84xkitoDZCpYYcwkbeTU8A8Cbz?=
 =?us-ascii?Q?AWDvZ1nwfg/B/lBaOZMWtCtrKNMSRAFT0MZsqGvILGdzWP1B2eR0zm7+DlgG?=
 =?us-ascii?Q?x7YkhOs5PpOw7z3ADpJQk+BHpY7WR0L/CqkfWbrFOxb2s7SftW8NmAWzJfJY?=
 =?us-ascii?Q?xQcgxVBlxzIVGOoAv6Ho3Vou5hrOIss8xIyO76UZZoBaQvx54rX0fGt7JU2s?=
 =?us-ascii?Q?TNBwpKVrLrqS1djGzeQc8p79AsZ6CAHnx98x5LGHWdUIunckW5TDZ40CjVmQ?=
 =?us-ascii?Q?7/l/XU4re40eNNSCyrVKzL8MdWjHg+xEdRzPZVIZtlIV/b+rB9YF39F0M8RA?=
 =?us-ascii?Q?JFC6oH4TrLqFcpSAa6zgk2tCGbjEC/S+rLYBtFdqhQWarwByxDGVXmc3B2Cz?=
 =?us-ascii?Q?7yTH5mM8VFaxZHxP3O73rfFZkSSzHxiDIpT7deRvw/0WArILQUpGZZmbT4cq?=
 =?us-ascii?Q?jvynBr5iKdxpHOOOQSfRB+dObZeggAYR6Aoa+xxlat1OlN4hqnaeaEXHwNq6?=
 =?us-ascii?Q?hE8ECJusbZeWQvRQiwUhQ2st4v3s+pEPNBT7iBVemShSVgjpOcq8QY3RVtUk?=
 =?us-ascii?Q?WvwcxQFGdmdEQJFXrA4LW0aLPlBzzdD71qsIaUbHS94t6rAh6IQeOrsx3qoz?=
 =?us-ascii?Q?h7w7RuPBwIJZUkTCTfQPB/pcOegn/uaB76eBalEpuwqUcISNou/ZYPXOxYwY?=
 =?us-ascii?Q?mkPQ/dUN7i365G/6I9dUJ+daSxxziqNEBaLSrkYqEX84zX/+FHrD5gx0ItFi?=
 =?us-ascii?Q?Lt3OLMDkVURST0l+kjSkGo1y9+tdrGdATn+zAoQxzh4G37QqzYWSJd++qlX4?=
 =?us-ascii?Q?3zeNzAFqtUC17wH/MMEUvc4n746EYpC8SM2+mtDwapnMGvOdgDRNCXMbd5Zj?=
 =?us-ascii?Q?qbLQgu0jcP5gV8Yaj4L6H8Fd9xUB2spHLKo1Ub9Irv4G9Qt727YMaQngB1m6?=
 =?us-ascii?Q?CK4l3EBuCtwjkHsAXrvG29YW8EhBES+jc1yxlb9vnXsnsv3EuNeDGWntriWB?=
 =?us-ascii?Q?G5dwSge76R5GWAzJaZSNUHy16uV9JZas5WmCYl87ODYjHXNTW7TlB62+ZlmE?=
 =?us-ascii?Q?QLNaJwJawSF5p5rkU8vBOQx7FJEJf1DoC0bMbbqgcvoxbDOFNgtqwycIvvE/?=
 =?us-ascii?Q?hMpTi7kTr/b7JOZu3KgAcFNH/mi0012iOOVtrX3h1KrWmGVs3vCxeah4ArkP?=
 =?us-ascii?Q?F3Q1aPxujrVZ3VlpMMvK9iiGR6eQUOA9QpL7pKtWwGZ+QYYuSBuUwuCnFe6n?=
 =?us-ascii?Q?Y4blCyTp4v24nVzz5ZppfFRHMOBA6TJcJH9yu2ndR4anr8GzLnecCoENuH8A?=
 =?us-ascii?Q?Mz3jrLk2oQqpgwfdSUYwr7ZliZX5mGlU8gPB6oUas6npuUR0AK311TJpvCzG?=
 =?us-ascii?Q?ViahmxP/brVux3T3gmF/CtH1rb0DwaItF9QXU8uE7Y2b7lPssyqGFw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2UBO4BGiZiMVhPHnM4gPmMyOZNzdjfUXDDMxMA35WcWsTtOc9NNFC5FJdCdy?=
 =?us-ascii?Q?6v9rv/+jZOf8qW000HixCLsIOO2gsXrskwH0kNDzJ9848bABJMSFun3K3VLT?=
 =?us-ascii?Q?QdckbyJNJsfJ3kYPjdfpMNa1/4scjUcUBnPiDpeK/zylPkd8+bP+VPydm13g?=
 =?us-ascii?Q?Yit1DBSrZ+PMFR0JUjBzMDhGrc5cVz7axsyXo1xS87BVjlSHXCeS9aBMYvAA?=
 =?us-ascii?Q?fSYfkxvjVBBaIItW+3KCqmo+k8672wW4AZHYPSv5X7d9cZWC4Zt37h6IPzNe?=
 =?us-ascii?Q?qeLA+1I6Zxw0vR/pHBJuOM8/dnhxZQbAhe16qkjrpyLwgkrRuk8ZWUBLFeHo?=
 =?us-ascii?Q?TAw24UWpq3BMKDHcy42KlZe9ypHgcunemoTK5zLqNq+SUn0h73kkM7jug/8c?=
 =?us-ascii?Q?3076ItiaxxEYMerCcmhmMKQLW1DBz2Qs8pvuC3C7hCIVNDjfm0mnscYORDw3?=
 =?us-ascii?Q?p12ga9eF5uE/n6f3mO09mZrtTu/87ne5ytWmmIQVSjAzB0x9MRGzU4MxkORU?=
 =?us-ascii?Q?ekXdY7Zivzgx88MbCXbkz7Ck7n7+xj937nTr43GgKJo8H7ySMKU4UKj2bb71?=
 =?us-ascii?Q?l7Jvnx3cUEZa3DgZSlf8GQhANgFMBdzk5U8TP0f4+OOmDPN/nWxLMMoxc9Nu?=
 =?us-ascii?Q?s3GxfQUBVoPzXJ3pDBY/QyOtQnRIGvF+G8G052n4YakLgjyoSlkwmaJvooZu?=
 =?us-ascii?Q?pqigLLZP9f1lq7jIfZpToD3/VT7BYAK+K6+Z7sQR2o7F3+vaTM7Pb1A8GR/l?=
 =?us-ascii?Q?cg2jiGP7tjVpoRC3qS9N1Ld/YyJXN0hER1qW9jxh3IZpXLJ6yU24WriUD/5u?=
 =?us-ascii?Q?FPPUqy5qPLEitSTDiaBxwCK0MTdgs3AS+E1Ruc6JHUBK/7ttLJJKCxoolLRf?=
 =?us-ascii?Q?hjPSRwU1sLAoQW4lW+umNq2uALn707St/IuaigMZfpOC9QR9S/HcF36IEk1r?=
 =?us-ascii?Q?IZoSt2NzEkmvB+W/ovILD2pA0CLzWMb78UeYUkkRepYAG0Nz/SxPE960sbU7?=
 =?us-ascii?Q?VuaN8Wbjo2/e7HILnEDuR0vdfs+SvloOkeVdhCJB9nKXNMWDLXk28M57KrAE?=
 =?us-ascii?Q?sRxukKMoSIS5JwNxkLunc0itTzOL/iUmmWiG7YsUUqVsWuRKOadZJWliBOU8?=
 =?us-ascii?Q?3Eqbh3+td4empXvamqet6k8lDNI8mgOqGGGV6LmHUi8ugWNjOwlT9a0aSxt+?=
 =?us-ascii?Q?/++8H9AeT+V/6bxMk31mbeRKrdIo344pyxnoJn8i4nmCCo7pV1hG+faLT7lV?=
 =?us-ascii?Q?ZbRzB2JbgTTti4IKz7gYHWL0qK7PKuvZGU0fqzZyYv2NT+ZJc/UP6fSdawhV?=
 =?us-ascii?Q?rA+BCD6ZWhPKZFYTn5XWwswXSM30fb6MvWuHRwFE3s4q+e6yoV4lUM6tG6Qn?=
 =?us-ascii?Q?opL0BPy5eSfyDxWATnKBehmlPblzq+PHLSQOAJKSCLKJMWyeQdaPoBWwOawy?=
 =?us-ascii?Q?jaf0lwbhzi4sZyxhAouhyQ4f2hfr0o/uaYsUMwXLQXxptjaXnZre4hRdj5ax?=
 =?us-ascii?Q?aklppn5Tgeawx4XiO8TiIVDMp6ajy3zmo9pN3ZGaSE08s6vLAhyScX0Ixwof?=
 =?us-ascii?Q?P15ACQ9D4Kj0UmAQ/s15MYqgHaE7x63PKM9pEappROYBWSdPUQskW/Mvxwl0?=
 =?us-ascii?Q?yEzqA3bxgXdYiOiw1+hnqBU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd79e98a-a01b-408e-64ec-08dd9303e395
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 16:25:07.2504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mi6uadpuySteToHpN8lVAtk0ztnANz4qIn3704KaCsp49JQBzn2hZYbMXP7rp3Hu1n4egyoIwusYkngYMOIEbydKr9M9JS/etjWCbCZ3Uk7MziyoYLFQ9nUNqzYh5JQd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10520

Enable device I2C0 node for the RZ SMARC Carrier-II Board and set clock
frequency to 400kHz.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index afdc1940e24a..3cac292f20b3 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -35,6 +35,7 @@ chosen {
 	};
 
 	aliases {
+		i2c0 = &i2c0;
 		serial3 = &scif0;
 		mmc1 = &sdhi1;
 	};
@@ -58,6 +59,11 @@ &canfd {
 	status = "okay";
 };
 
+&i2c0 {
+	status = "okay";
+	clock-frequency = <400000>;
+};
+
 &scif0 {
 	status = "okay";
 };
-- 
2.43.0


