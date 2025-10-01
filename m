Return-Path: <linux-renesas-soc+bounces-22552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC04BB1D86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1B954C2FBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0C43126B3;
	Wed,  1 Oct 2025 21:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cQF+Qqzs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74C13126B8;
	Wed,  1 Oct 2025 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354176; cv=fail; b=mda0XOVgqT2QrqaSa85TG0zcHMo+b0lvLIIUHyJz3QY8tVTwlN8cbTofxeze4zaRR6aMo8vKR88AAo+1dHrPfX+FW8gcrWOuaKQ1EnIp7NMdF1ul188/i3KzazNgy0ul2j0Xfpue/OP+EovTX72eEv/i9C2q654v6vEjiiR9Qno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354176; c=relaxed/simple;
	bh=IxBcKYSX9evA8OHqZZDrV1TVK7edAuiBMjjF3WVJMpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LNuQCGF/jbxaMllRc+iF1AdZ1/XyZMOHplhR54amJZz43TSjuv+wWx3sIHojA3eRHUXSy4QPN/B3/EDoNktFvWsks64jhgzuKoLPulnmw0XOHrFGeviJZemyZLFzFQpBeH9ebkh+ZFYI9WKZ6mNg6JcyXrhoXgEixzfngLsjj1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cQF+Qqzs; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xltl4g3gLNk2iQnxtZdYDwH1FqhrbojYqUMSdqLOqILyfsB1KRU0D9m5Hy1ZtmKkv3l36T4JXc3gi5kGeYNfsO0J/tjwLaTkTsf5ErEWwD0gMBodQd0HbdksNPx4wfJEuLT4sZAZ2ToRukeiFgZUV9qHyJC3TTsdKvqW/7+AuSrl4zJN9AjQiLHvYdyE8NOuYJQUaZI2ZoF0kOY4JMFd1ZyqGzeLK5ZCLzBe8mI4s4X4s3WME4cRXgtT45H5gpTxHhYuuO6BMhuUPcx3/e7GWMNvEquMCD0nejpi6eFrGR93kupRirdKnpecS+93y1g0TS94D1dViD+QFXTn0gNp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dI3YsStwUsIMQL0FBog6FdiuaYhWVv6ltoVj/3rxVw=;
 b=RxkrZ88ND6795YL021/wokBqeHqobsrVx7Fpo27ay4GLpNv/8uswuU9WtT60VRkOLkvJlwbBXYz1o5TydrtsyKd/j7R7s8o0MqrTHwQDnEcObVpqUiCg0UU5gP54Fwz63ZotSwzzvaXQ4PaTecTAU+yYcdyEFOv8wKq+Xndy9RrAP8xQbuK2i3dolPd6Y/fzB5WYsAm5SzINv2TqE60xiZ1p0XZ/Ma3Bf/V0k548pg/Pn/h8MPudWaUB5KsEfvOhLDkCBdiDF7AMZpW1sMt+IyrznOK+RuxY2/eV/JIMBNwh5MeCP7NQZEqKzi5ijqyum79eCfNu7EDNS8nZGKjasQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dI3YsStwUsIMQL0FBog6FdiuaYhWVv6ltoVj/3rxVw=;
 b=cQF+QqzsVCZC0+iJlgfTlr11IbDb/KrW86zv3Qf2bLYSZ4IXNs2l6Vh/C5kDGgpO4aj1UMVqWVn+ox56joQO1+P0FqLzwMJ5KMtOGnXg5ZEmG4UZkp2k1imU7JfOiwUx6HYmPRtbspcRB30B31FBg5j6YpCoDLF2fapEoeuX6A0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB13012.jpnprd01.prod.outlook.com (2603:1096:405:1dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Wed, 1 Oct
 2025 21:29:20 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:29:20 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 16/18] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2 PHY0 VBUS support
Date: Wed,  1 Oct 2025 23:27:00 +0200
Message-ID: <20251001212709.579080-17-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB13012:EE_
X-MS-Office365-Filtering-Correlation-Id: c401e5b4-541d-4df9-4bf5-08de01319547
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AUC2EEHWb+lfRt4Udx/hAmhhgjc4nlh1Iprhtemsy3ChLX8jx8HVAcXGF7wv?=
 =?us-ascii?Q?P/Tdd6gLCE3yuHL/72L+JXKIcqms0nmASCdFbfETmcdKTFqU0qWriRL+IsPQ?=
 =?us-ascii?Q?n/iT2Ns/YPu4DZTP3D5ryYNNvHHyMxPYyXeq1R6VaSReUvzBTJ5YMJBifvhS?=
 =?us-ascii?Q?xutrdpJ1aGuQcQwubh0S3tktACmHiaiyQApp1yYU71/ZY7UWeEOy77mK3cQs?=
 =?us-ascii?Q?xiz9pH4bkVq96K5vkpddhsfDr+QSIOsr+E6gInBJXoyqgWyiV4iuVsfpz/Hy?=
 =?us-ascii?Q?E9YnNrJz2jOYeVnmtpKmCQEib71MCZmWOc8E9pog50KgjpVSNhtWb4GusFRj?=
 =?us-ascii?Q?KRRi78J4iascA4Bz141DYM0FMcrI6ZuDbBDwyXo8V+Tvj0GpwUHF+Ieurimb?=
 =?us-ascii?Q?WjKMhnUNLcwBw5pxUek/BDRnXqLSP9c9Zkf8Nwib32roFjqC8kdiQqcFAFwz?=
 =?us-ascii?Q?35sYlKyNeG3jgFjcZzWvWH2iIpmVvwdgxaox+yfLZCjXnkxhv+a8uyZsIFgX?=
 =?us-ascii?Q?Sa0tLFY5ak3s4sqldcoov8hJ0Szd5OqTeCLlZwjhdVFM5SEycmdnU8iutdnS?=
 =?us-ascii?Q?rnZV/FGTng98MyN1ysJCjpPDZBqLyWEtDNZ5E1IlLqX7x5mzNAeR6K05iz3N?=
 =?us-ascii?Q?bLRRcjiTEvwUbvy5MeFYCz0/JSzMlexw/6tRG3xQ2N9UQmYE70Gs9EyTu33r?=
 =?us-ascii?Q?+UFNc5p+yXn0WEdXdDzmLYIf67rJqUNn72nywR0k+MZiLpADWQzF8vLBM7S7?=
 =?us-ascii?Q?h1C6yT9Yn3x/W2fun8sovkm0WqHqk0SGWBOIZTbwgaSZHNaSWffpwTJExQ3I?=
 =?us-ascii?Q?uf3qHzk80UHXG8EmcTcETSHlM3mzw44oOuxmoDM5JNh6gjIu3PPUNTCUvKMw?=
 =?us-ascii?Q?uihk2pUp/pH2r6sQsJR2S/nnsq1Y4WOtDv76RtqCIVcsWLaBvxJxX+cRNwoY?=
 =?us-ascii?Q?b2nl8Lq53ovGOjNCQ7NevWnbF7ocnGePXS7X+Qfu/Da1U/MVecSUn/A6II55?=
 =?us-ascii?Q?3MIK/G9OSL3mlMtVGEdb1sgz4hivVGizewQReYHMDO7fK+szKrzaAv/HMrq6?=
 =?us-ascii?Q?dfJHkqEameOcOLuUhtOsSelYjhcuwm+MjFc6DbD7nbOdnX4T2MfR2fs6u/wG?=
 =?us-ascii?Q?DfN6amt7MqY3fbzL9hqj2F0QXuEXGtmte9gn9mXqAhDPZ5th31j69dB0Dp6k?=
 =?us-ascii?Q?82qsH9Mqut5Q3hn+/+tCWVtixbtOkhlAupSkMuNHjVpXiZw2sAy2JuiiKudC?=
 =?us-ascii?Q?qQCo2omNCKMe68Auhee056rK4LZPOF3RjpOrHN7Tk4j3NjGO2BE5zYdk5UkC?=
 =?us-ascii?Q?QpT/t/4ZQXyI4wvJ/3v76w21zq9KKy3fNTXgYmYW0IpVXYmDNzMuKWtj716B?=
 =?us-ascii?Q?eE337p/hnvGY+0K7sTaEcF5XRqqymWJvL7v7URe6anPM2G/5lCzrKMXn8qH2?=
 =?us-ascii?Q?7KTJE9hzw8j9dYhJJRhT8V1rO0biEPHJ5SijeMDWWzj5uJOFlE7V1mDPaBcM?=
 =?us-ascii?Q?1IIvJd+uZU3i4vHxzBYpZUCOhlYMuz//8l1S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/RCT2zXcxo3qV9iAtEXsDc4oK1hkpXuAIw5QpPWuSNkcQ+wIr+lrkJ52Mit6?=
 =?us-ascii?Q?0Es9ANTWbwp2QJmJNqMaDkqoSp6LvFkZjEGMVy5RYiioYOpzGY7vDG+k1Kk9?=
 =?us-ascii?Q?Y0sOTLvrVFruW6TOVUaLtn30H4GiJVy5/HqsSwOK3n8eY15ZO4+4A8dWKmXf?=
 =?us-ascii?Q?Qj2SpdnMCrWNB9NII1JT5/KC2UNGKu2t+c0EhPjpwvAFiJf+emfQV64YDjWH?=
 =?us-ascii?Q?bPebv5pVH+Y9HnemxsVaV85592XIwGeOj90Wr5pgoCeJn8ooQQnH8tmZLzMK?=
 =?us-ascii?Q?71NJPhBWD1VcPWGZDebOBWPDMCVZl+mxes6+DKDVlHKkE+IgRXbfIKRR91ta?=
 =?us-ascii?Q?iaAIai8Bt42Tze0OWkzW5MB+S4ZykbrBkT4g8UtpX2Y/eA+2VFR2lxohJPzr?=
 =?us-ascii?Q?KhPNYPp98FGJaexwivIhlLg5YCAe2Vtq6Vs7RPG7RvPQKKTMxODGJbh9NXyS?=
 =?us-ascii?Q?J1dwKFPlwj6BMuqVIGcb9FC4h1g8h1mXBdJDRvqVl0Zqsl08iB5ZRaMZ4WzV?=
 =?us-ascii?Q?rDe42E1aCI8lpRpZIGnfUoEfHz6ABhyO21bh5YrgYV3lSL0aTnHtAJLE9cbI?=
 =?us-ascii?Q?ZLdvC6Qn79reJr/BtUzOQgOcTLdgBkNKSzPYu5kPHxqNgk2fg9kH+UZsfqzh?=
 =?us-ascii?Q?KB1TNnWwi1U8rRQCSamXK81gbPbvJo3YVDHTNAuDacaMKJRQZ8AGP27/SmQm?=
 =?us-ascii?Q?yh+JosEGck/uSMonmtgBY+jQRhYeMUnY3i08UPo2EbUBPuVAyVe+4mPLo78u?=
 =?us-ascii?Q?vva8o8CfoZBw7HWL6TQQuRTcZWsQ12zZCZgQjX+6gnf93B0bkr8VbtGvptjP?=
 =?us-ascii?Q?wu7FZ+u8izytRvWa5i81/Cdcj+p+70D7tI1MwTHZCVZsO+kfDzAKvC4Cacqh?=
 =?us-ascii?Q?7BrZL5GDsdfZG07LCh9JPU2OJ2rNHhb5rD1yNIkub2tMWOsC63pD5Hk826QL?=
 =?us-ascii?Q?e7ilo4VJfAiqX9EcbjTfM1i3leGkyMz9+gZpAlqtA1Y2ImijkYJGL14xxfbo?=
 =?us-ascii?Q?YheobejH9hWswZPVQNwYf2WbscM5eGV9cTKtg2f7NFTanq0SFLA7mWDXTWtU?=
 =?us-ascii?Q?0dzNS9iwVarTDY//P/jYfQpHZwiMdPYOjPW/acRUICe04AOrUGgo2kkqj08A?=
 =?us-ascii?Q?+ajjqHZvi5QgtSDFmA+SL8yYBYnYd4jyxBp6S/pKjLAl4VizfJfEG/ZkeUM6?=
 =?us-ascii?Q?XrYJWtjplI4nKwT6RPXun/rtQIoZfojjdvjPmGPYlUM/7CpLSd0AwJfsOyTq?=
 =?us-ascii?Q?+lpxBJG1LTon2e000cI0v2xiGyffyFcoJmtf13eXdVb6LWfl6V7jZKEvYCq/?=
 =?us-ascii?Q?RS6CqN9s3NXD1IwC6yAbJ56jWTPO3YDncjRwlnVBsu4zjU6Yrk8W9jR1Hjlt?=
 =?us-ascii?Q?AQCwtSHiGvvZwD9MbU+7ojbjYsM/EhCxyqKz6O81XgxTiBqRq2lcp6cQdXd/?=
 =?us-ascii?Q?S4QW+aDiBMH+Bf3krE8b896ETgdkIrPIuRV2W8rTwCHJIDSiFmB+mPSlUYoP?=
 =?us-ascii?Q?7ByOd8F2eCUsTHMBc2i1kXvHm4azcGvgZlyEU/WaKHXQrdBSCo2A3AXln5FH?=
 =?us-ascii?Q?/SNJIXJzdDgE+xN+At7zUUu4JXmMQhsZHJa+G3HAaRSc0ehcPE+N2tUACr+S?=
 =?us-ascii?Q?sTyT0WG5uxDQB6zeWxIuZ8k=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c401e5b4-541d-4df9-4bf5-08de01319547
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:29:20.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/4m88U4hghZQfoI6j3d3X8RW2MLHGe98I92YyB1FWKynmMqYb2mOM0KnLjOdce4Rtifd//V7nQmUVlAnTrmRf0nPi/8xqJeoSoae8SnoL2vUmp++mZLOJmSurLi4QeN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13012

Enable the vbus-supply and status properties for USB2 PHY0 and its
VBUS OTG regulator in the r9a09g057h44-rzv2h-evk device tree.

Enabling them ensures proper VBUS handling and reliable USB OTG
operation on the channel.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 5c06bce3d5b4..69ca9f0381f3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -423,6 +423,11 @@ &usb2_phy0 {
 	pinctrl-0 = <&usb20_pins>;
 	pinctrl-names = "default";
 
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
 	status = "okay";
 };
 
-- 
2.43.0


