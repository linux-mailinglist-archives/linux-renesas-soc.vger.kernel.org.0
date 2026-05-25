Return-Path: <linux-renesas-soc+bounces-33089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA7RNKAtFGpYKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:08:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D109E5C9AA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96858300BD50
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E701A37DAC0;
	Mon, 25 May 2026 11:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jeRLpNZx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D85537D100;
	Mon, 25 May 2026 11:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707240; cv=fail; b=qTLtJiPijGijnRBHzLbwqX2K8+l6+VEQtDOUqaZvq0hK9/zhHgPc6bZs5FB2kwrcbo2mS3PQRIcAIHC2HvvDh0lUGf77IvG3vauoI3JxU2WdkyvVNYypnQqL79hFUSTWbAjXJiSC6UPraeZ3k3TcK4bNpJLiIfwgwrMNzbjystQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707240; c=relaxed/simple;
	bh=FS7XHjxT5wKf3Baax8JvrQHdXp2ijF6Z7HXiWX44Cxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hvIXPiUTSDzy96aF4rzZuAoMoBel5ZnhpI9xbxAldtuvUaPwU9ff3/63M9XeRY0FK3ikZ6Cvc7RbDZ4AzpB4ZMMaLOkZjncbKDaOWsVtWxgqrH8VSm2ejf1tTHNN6qCeDPAaGLT0r7SKRIuoW1ZgVeeTD8Yqzbuh79SlPnD/g+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jeRLpNZx; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSej6D2B8UMGlx8yEZK5kHEQ4WOMnzB6sNaDjgKqAmJIRf+JOS11QaniWW0eU7y9NR7OoPCaU2ISAuESNaIV0vG9y/la0VD7HnjUSE1M6ymVyNuDM5ZbjwFour4r2J2dJCTXbDeR2kjdyr9+kZKGeDsNLdA9EbmjIv0MrvAjDdYwDB5+Co78DAzxUJDEshmFgcqWoGH7smtnQcyRA5cAsTwZe+A7X9CROpHpnRSa1b5NxUQYIfNWauLL6p77S53aEwLd7X9nC2TIwqnaSxvSBCRY5X4KlDMhWNp/awclZ8wPx8F/RTGQdUzERdoc9nTuCCOJBjoTaJoMdFjPerVpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvNJgLpDPGfm+QSZXkZzNVbsWIz77doyzMMf4qT3mSs=;
 b=fkB8VcyIBC51htnhMN8w8vP2KeJhJY0uzRqfgkk6EJUcmhIZfyLGd3lf0Sty0wBV+fyd7qOinPDAnNyog5RyuHmV41FFEFdfiY0gmSJtms+FBu4v/TcQl5Xoqr70QwzM5l24YS8EjJr1MKAuiHnS0FlnWyBCg1AZgpzUJYdiQMDW6Un4KIp74SN90HVL1h7586KiUtKtRmbWHSY3XrX+AL5i76JmonNZyZRbVAouYb071kW9alJgiGen3UjhQC5CYybcUFE1WRZqEi3HlPhPMWQBdrpHcy6Dv++C+pA3Mh4Cs636jn2ozN4+UtIQfunPmGh10wtPOZWZ0HFXmAS1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvNJgLpDPGfm+QSZXkZzNVbsWIz77doyzMMf4qT3mSs=;
 b=jeRLpNZxhcZy4sPPuEzQ0C1CuWUHqNPwjpZ+iRXXYvbIt2v4XUzoE7QWuD6SU6Jkm89nMd29Km/NJbE7lNenE4xj5PNBvKfoz9J+Vd0FVy7yzxIok1+xEuojVbksB+75/EHUHXfDAY+shP1bBQ4rVUn0ErMdK9aOlORthTA6Oe8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:07:16 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:07:16 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: bmasney@redhat.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v4 3/8] arm64: dts: renesas: rzv2h: Add audio clock inputs
Date: Mon, 25 May 2026 11:05:58 +0000
Message-Id: <20260525110603.4018170-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::11) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 180d5622-92f5-45b9-de63-08deba4dc7a5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|3023799007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HkuEID6Lx7hc8aXpCW3YM6ACqR2z8oJ2jaMaJFuGGDlGS7cfkqjlDLq9K4+9jknWaYWqTrg/i5y2cvcRaiFmP4ANoen1q/ev9dYMOkMY4p2it7tzbPLl+jPYjhN47Ihnq+AncILfh2s3Rj00xNSB0+xn55F6DVCP0Sj4aKXtntUTWUk+/b6Hb4fPDGbXB8U+0z4di0PDGYIK/50Ln6NOiQHHn7AyXPWCHEbyW4kFvAPCrzJrfa5awB688y9isu+PMl6R73vvWHp6Po4PMuB7C8SyH+TAKkdMcggTW6JLRTj8cG4CB1ufSbK1KMCppKuCikLl0e8I2odm8T6DJqPwgb9Z7uZVwonZKgRPeL9MMTCgHCNjIamLVt09GgP5Krplu1C4ZDWPBAXSTnZp4pwa4PVT7rL0l4U8tffzYXmTo0R5ty4CJAbdtaqLIrR+o4Hp3U14Ar1TZPIOjsMUSrb3lpDGjIJGfgzVuG8JSo8bTRtqwm67auxN+NMz5EW1BooK0By/oLsATSNssZAyheSihjMKnfLLF/CLj+ascOt+ARz8UrVtPuK+kN3Z4Cs3wuwknivJdjZ3MB54gYFf//SbAAbJG52bI9iztuVKWbwVc3KN2J76aLuaWUJzzD8jVDJ48vjMjRZ9i5R8j2cAmrtf9sBBul3Cq78zxws4+Cnz+0v3yvdsmzjKCJEtnupPHdtn8AzrMp9aN5gx8qWZGsVytXphgTbMHhrZ+B6Ghu6F93o1A9CzFefYw/PhgENjfurw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(3023799007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PULiviiK8tl//r5DtI1Pr2RImmek8uWAGZXI0Kx7q+pAxZqWgt/g5EFlLUBc?=
 =?us-ascii?Q?tRqT1bIzehfJl+DruWO5z1OCd8MVncZianWtdVAr1+yqavOHkDnZ7BpskEtF?=
 =?us-ascii?Q?eCwXha97WU1FYqIG000F4YEjOu/0/QARiDhDhXjqJUnNhfUflRuD6TAEDw5K?=
 =?us-ascii?Q?FTqr74GE9vPe/wrU895wgLB144CFiGPKbCLPaLknM27El286ACNcowj1oKe5?=
 =?us-ascii?Q?6i+u/cqFOQaACQ2ESA6M/ETIscOI3XRFxEwpVHnExKRqpYG6RdIi8AvqTB0+?=
 =?us-ascii?Q?AHKRiybXmQlS7MHIlQQnf1Fl5EAiLrj4o9fiN5uA695X/oxMX/7mdjRkNjD2?=
 =?us-ascii?Q?4icHEbNiXX9dfT0oBHB6rhf6HrF7FYPe6eCJNUnurwM+dqRWgvTR1bst6wLy?=
 =?us-ascii?Q?oKCzibH7BPIV6yEVf00+BjGOx1zRBg2rIjB5Yyy/B8JUFmbTysm4Pijs+lsE?=
 =?us-ascii?Q?RclteGlk2SO/EKsPmk3DVOwSfLfTBXac84p5mbd83nLk1iAP5zcF7IOmAwdO?=
 =?us-ascii?Q?TdY0n6HoNCZdgiK3Z2qx2yYYFTmZA9Cj6Xwc0oQairs/Wy8Dt0o/lZqP9gP5?=
 =?us-ascii?Q?LGZ3NzohDVGA9lT72zzsdArTysrZ8M5HnDRL3rp6ioA9FZa1fEVj0CX+ZWnV?=
 =?us-ascii?Q?w1sjWO4fnQR6dxRDsvv79okIhgixOHC1d2cOq+RCtXfkl8u2njazsl4R80mz?=
 =?us-ascii?Q?wLbIzubY4OaaO1UERHiRNu4Tw/k2URbCZ+St3wBeBC20QRX1Ax0pjY6Rhza5?=
 =?us-ascii?Q?MzM4DoEhC2So6hylwX7bjevYhs9+70fOCJAY//NhIUxkjcgT9RoAjVBNNft3?=
 =?us-ascii?Q?aekE+B/lxIFGHm0JDVaLRz4M3eQInHkkJKRhuwiIQIsrWAs8YtSV0hNUscSa?=
 =?us-ascii?Q?62i6yAsY+Cfu0m+c5arak63xNsqA0NWqdvABdU6wAb0knva/jLAnv4YkBLTV?=
 =?us-ascii?Q?cVlo2uEPmdFFtbgaQgDujncTQFhvPNbAVuwZZuwBBXq/itwmcNRptvsyk64s?=
 =?us-ascii?Q?oEVEfYGmXV9TuVfSzEwahfBhVkOZPP2ABAA1BkADCAz2hrIaZ24YV4kLn1Ao?=
 =?us-ascii?Q?EJ0iFrS9KdynS8oTgqmGpCor/uhp7tDhcFw9palZKNEEK8efcJWgz4rsU+Oy?=
 =?us-ascii?Q?eySaySGTBEtrpm840MqmOZukuDAI5+dEWJL43NdsGLZkC1pDa8/1VmQnZq91?=
 =?us-ascii?Q?Swvzfllx1fw8cRTi4+HFbuehbK2QiYTFThvHgpZtjuzNUwQzRB7CAYkMj869?=
 =?us-ascii?Q?16s5GcwVt/D8mXUyKjP2/yrMeLa2Tls+8eGN7inJVWKJJFYHpr0vUiqd1H/D?=
 =?us-ascii?Q?JZkCmdUC+e9Sswx5ByFk53GnGLM0E+Ael5OdW+xrK3YA0gECqyfvQUW1fZIR?=
 =?us-ascii?Q?NwEtlZORivm96gIS5wUhBiaMxZlfAN9D022O5obR5gCDaWAUFxm3GSJTbMLY?=
 =?us-ascii?Q?u0DWMzsjjhbjgdhhCqIZxBkFIEFUFBhAB+IB1uO6P+9q+kINlw0Rj4MW3rBB?=
 =?us-ascii?Q?ON35qz2ROvYNTDA+0uEAqf0X4+jCRRLSq/3IhxiaZEkdRKoQ8YpixCYVO8OW?=
 =?us-ascii?Q?Yb7H6lz43b+AYxa+VjqslWQwpoDvnaR3gHDjuNBVxhk525hnrKe/80LL9q1I?=
 =?us-ascii?Q?1+BNsNEV+KSBcXLUrb6zwqa2644xwr8/GDVvuITE5bZksUQEwvXVHrAwI2Fq?=
 =?us-ascii?Q?ZwgOyGJhbk8crgxjpfB3QQv2nnpzF+Ocr9TxsrMhZT0Gwc1DMD1jmgtL+uKq?=
 =?us-ascii?Q?MqxskqfaKcExOqYxiv5J3gIjFXFpQx8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180d5622-92f5-45b9-de63-08deba4dc7a5
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:07:16.0960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pbw+DyVdd2H7K+wV7x62Exi453UA7nRLd7WCAWn5jz8EqyH872kooqCPg5BDzKVei5ox7JA3QEkUh47bu40purNMUIEkL+aydpHIUFpya9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33089-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,bp.renesas.com,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D109E5C9AA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Model the optional external audio clock inputs as CPG input clocks for
RZ/V2H family SoCs (RZ/V2H, RZ/V2N, RZ/G3E), allowing the Audio Clock
Generator (ADG) to derive internal audio clocks from these external
sources.

The clock frequencies are board-specific and must be overridden in the
board DTS files.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v4:
 - Drop the audio_clka fixed-clock node from the RZ/V2H family DTSIs,
   and drop its reference from the pinctrl clocks and clock-names
   lists, consistent with dropping the AUDIO_CLKA input from the
   binding and the CPG driver (patches 1 and 2).
 - Reword the commit message accordingly.

v3: No changes
v2: No changes

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 20 ++++++++++++++++++--
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 20 ++++++++++++++++++--
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 20 ++++++++++++++++++--
 3 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 4267b10937f3..3e9354b7411c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -14,6 +14,20 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	audio_clkb: audio-clkb {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	audio_clkc: audio-clkc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
 	audio_extal_clk: audio-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -271,8 +285,10 @@ pinctrl: pinctrl@10410000 {
 		cpg: clock-controller@10420000 {
 			compatible = "renesas,r9a09g047-cpg";
 			reg = <0 0x10420000 0 0x10000>;
-			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
-			clock-names = "audio_extal", "rtxin", "qextal";
+			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>,
+				 <&audio_clkb>, <&audio_clkc>;
+			clock-names = "audio_extal", "rtxin", "qextal",
+				      "audio_clkb", "audio_clkc";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index dc5b116679c0..1783182ff1ba 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -32,6 +32,20 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	audio_clkb: audio-clkb {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	audio_clkc: audio-clkc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
 	audio_extal_clk: audio-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -294,8 +308,10 @@ pinctrl: pinctrl@10410000 {
 		cpg: clock-controller@10420000 {
 			compatible = "renesas,r9a09g056-cpg";
 			reg = <0 0x10420000 0 0x10000>;
-			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
-			clock-names = "audio_extal", "rtxin", "qextal";
+			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>,
+				 <&audio_clkb>, <&audio_clkc>;
+			clock-names = "audio_extal", "rtxin", "qextal",
+				      "audio_clkb", "audio_clkc";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 1e94366bb7ee..28562c1377f2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -14,6 +14,20 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	audio_clkb: audio-clkb {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	audio_clkc: audio-clkc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
 	audio_extal_clk: audio-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -276,8 +290,10 @@ pinctrl: pinctrl@10410000 {
 		cpg: clock-controller@10420000 {
 			compatible = "renesas,r9a09g057-cpg";
 			reg = <0 0x10420000 0 0x10000>;
-			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
-			clock-names = "audio_extal", "rtxin", "qextal";
+			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>,
+				 <&audio_clkb>, <&audio_clkc>;
+			clock-names = "audio_extal", "rtxin", "qextal",
+				      "audio_clkb", "audio_clkc";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
-- 
2.25.1


