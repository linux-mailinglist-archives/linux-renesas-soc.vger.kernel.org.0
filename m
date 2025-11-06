Return-Path: <linux-renesas-soc+bounces-24218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D994C3B1A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93E63503E6E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E19337688;
	Thu,  6 Nov 2025 12:56:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF4D3375B9;
	Thu,  6 Nov 2025 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433790; cv=none; b=qa44mLEw3cQCNTUC3CeCHVNakK+TL2vQPAf+dNgWS6x/PdLj+v0z5jGShpG/wIc9VujyrTtyaCLb/Jc9q++20sed2TaOSvcvmmRc/hSUq88cDMoLnUHKCgWEzvyvKkkPcZpULJA+VhjvXZEHPQ+pGAz2YsiObXnR4dUSnLOQjiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433790; c=relaxed/simple;
	bh=asL9Rjm69b8KRnY3qG762veqstwbTEKClyMltc6JB/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPRJlyO4i1GGpmXlzhXsdssIzIlPjvT1Oo4eO16aP+/mXrqLkz9OsceTOWAFUI/OD1DRfFlR7340lABOpwTUcH3oSnDLU+r1WL2fnIp1gyN7Cn7fSn7pVpoTqBC5c5bAU8J2afKH9RKDPz+adz1whv3B2hBFuax6utIULmxyCXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 49yrYiBWQZ+oKmAo2W0fdg==
X-CSE-MsgGUID: sj74x/ubRQqRbTQEs9HUog==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2025 21:56:28 +0900
Received: from [127.0.1.1] (unknown [10.226.78.121])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id F12D84006DE3;
	Thu,  6 Nov 2025 21:56:22 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 06 Nov 2025 13:55:32 +0100
Subject: [PATCH net-next 08/10] net: renesas: rswitch: add bit access
 macros for forwarding engine
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-add_l3_routing-v1-8-dcbb8368ca54@renesas.com>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
In-Reply-To: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762433735; l=4570;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=asL9Rjm69b8KRnY3qG762veqstwbTEKClyMltc6JB/0=;
 b=VuZybZnYpZ5pqIGliufbbFXLYtqljb844tPHYVowdNAZFohFiZxt+bwg6DvCBjQyimnJYSB8B
 V1KflA3kmBaCQ4vP1Zkh/v7TBsTXSDTKmLMVMZj+RwQ4rIioQ5x3baM
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=

Add bit access macros for the forwarding engine needed for L3
routing.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h | 113 ++++++++++++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index ef64bd6e5a75..773bde67bebc 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -839,7 +839,7 @@ enum rswitch_gwca_mode {
 
 #define CABPPFLC_INIT_VALUE	0x00800080
 
-/* MFWD */
+/* MFWD forwarding engine */
 #define FWPC0(i)		(FWPC00 + (i) * 0x10)
 #define FWPC0_LTHTA		BIT(0)
 #define FWPC0_IP4UE		BIT(3)
@@ -857,6 +857,7 @@ enum rswitch_gwca_mode {
 
 #define FWPC1(i)		(FWPC10 + (i) * 0x10)
 #define FWPC1_LTHFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
+#define FWPC1_LTHFW_MASK	GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
 #define FWPC1_DDE		BIT(0)
 
 #define FWPC2(i)		(FWPC20 + (i) * 0x10)
@@ -882,6 +883,116 @@ enum rswitch_gwca_mode {
 #define FWMACAGC_MACAGOG	BIT(28)
 #define FWMACAGC_MACDESOG	BIT(29)
 
+#define FWIP4SC_IDPTS		BIT(24)
+#define FWIP4SC_IIDS		BIT(23)
+#define FWIP4SC_IISS		BIT(22)
+#define FWIP4SC_ICDS		BIT(21)
+#define FWIP4SC_ICPS		BIT(20)
+#define FWIP4SC_ICVS		BIT(19)
+#define FWIP4SC_ISDS		BIT(18)
+#define FWIP4SC_ISPS		BIT(17)
+#define FWIP4SC_ISVS		BIT(16)
+#define FWIP4SC_IDPTH		BIT(8)
+#define FWIP4SC_IIDH		BIT(7)
+#define FWIP4SC_IISH		BIT(6)
+#define FWIP4SC_ICDH		BIT(5)
+#define FWIP4SC_ICPH		BIT(4)
+#define FWIP4SC_ICVH		BIT(3)
+#define FWIP4SC_ISDH		BIT(2)
+#define FWIP4SC_ISPH		BIT(1)
+#define FWIP4SC_ISVH		BIT(0)
+
+#define RSWITCH_MAX_NUM_RRULE	265
+
+#define FWLTHHEC_HMUE		GENMASK(26, 16)
+
+#define FWLTHTL0_ED		BIT(16)
+#define FWLTHTL0_SL		BIT(8)
+
+#define FWLTHTL5_MSDUV		BIT(31)
+#define FWLTHTL5_MSDUN		GENMASK(19, 16)
+#define FWLTHTL5_GATEV		BIT(15)
+#define FWLTHTL5_GATEN		GENMASK(2, 0)
+
+#define FWLTHTL6_MTRV		BIT(31)
+#define FWLTHTL6_MTRN		GENMASK(20, 16)
+#define FWLTHTL6_FRERV		BIT(15)
+#define FWLTHTL6_FRERN		GENMASK(6, 0)
+
+#define FWLTHTL7_SLV		GENMASK(16 + RSWITCH_NUM_AGENTS - 1, 16)
+#define FWLTHTL7_RV		BIT(15)
+#define FWLTHTL7_RN		GENMASK(7, 0)
+
+#define FWLTHTL8(i)		(FWLTHTL80 + (i) * 4)
+#define FWLTHTL8_CSD		GENMASK(6, 0)
+
+#define FWLTHTL9_CME		BIT(21)
+#define FWLTHTL9_EME		BIT(20)
+#define FWLTHTL9_IPU		BIT(19)
+#define FWLTHTL9_IPV		GENMASK(18, 16)
+#define FWLTHTL9_DV		GENMASK(RSWITCH_NUM_AGENTS - 1, 0)
+
+#define FWLTHTLR_L		BIT(31)
+#define FWLTHTLR_LCN		GENMASK(25, 16)
+#define FWLTHTLR_LO		BIT(3)
+#define FWLTHTLR_LEF		BIT(2)
+#define FWLTHTLR_LSF		BIT(1)
+#define FWLTHTLR_LF		BIT(0)
+
+#define FWLTHTIM_TR		BIT(1)
+#define FWLTHTIM_TIOG		BIT(0)
+
+#define FWMACTL0_ED		BIT(16)
+#define FWMACTL0_HLD		BIT(10)
+#define FWMACTL0_DE		BIT(9)
+#define FWMACTL0_SL		BIT(8)
+
+#define FWMACTL3_DSLV		GENMASK(16 + RSWITCH_NUM_AGENTS - 1, 16)
+#define FWMACTL3_SSLV		GENMASK(RSWITCH_NUM_HW - 1, 0)
+
+#define FWMACTL4(i)		(FWMACTL40 + (i) * 4)
+
+#define FWMACTL5_CME		BIT(21)
+#define FWMACTL5_EME		BIT(20)
+#define FWMACTL5_IPU		BIT(19)
+#define FWMACTL5_IPV		GENMASK(18, 16)
+#define FWMACTL5_DV		GENMASK(RSWITCH_NUM_AGENTS - 1, 0)
+
+#define FWMACTLR_L		BIT(31)
+#define FWMACTLR_LCN		GENMASK(25, 16)
+#define FWMACTLR_LO		BIT(3)
+#define FWMACTLR_LEF		BIT(2)
+#define FWMACTLR_LSF		BIT(1)
+#define FWMACTLR_LF		BIT(0)
+
+#define FWL23URL0_PV		GENMASK(16 + RSWITCH_NUM_AGENTS - 1, 16)
+#define FWL23URL0_RN		GENMASK(7, 0)
+
+#define FWL23URL1_RTU		GENMASK(26, 25)
+#define FWL23URL1_SDEIU		BIT(24)
+#define FWL23URL1_SPCPU		BIT(23)
+#define FWL23URL1_SVIDU		BIT(22)
+#define FWL23URL1_CDEIU		BIT(21)
+#define FWL23URL1_CPCPU		BIT(20)
+#define FWL23URL1_CVIDU		BIT(19)
+#define FWL23URL1_MSAU		BIT(18)
+#define FWL23URL1_MDAU		BIT(17)
+#define FWL23URL1_TTLU		BIT(16)
+
+#define FWL23URL3_SDEI		BIT(31)
+#define FWL23URL3_SPCP		GENMASK(30, 28)
+#define FWL23URL3_SVID		GENMASK(27, 16)
+#define FWL23URL3_CDEI		BIT(15)
+#define FWL23URL3_CPCP		GENMASK(14, 12)
+#define FWL23URL3_CVID		GENMASK(11, 0)
+
+#define FWL23URLR_L		BIT(31)
+#define FWL23URLR_LSF		BIT(1)
+#define FWL23URLR_LF		BIT(0)
+
+#define FWL23UTIM_TR		BIT(1)
+#define FWL23UTIM_TIOG		BIT(0)
+
 #define RSW_AGEING_CLK_PER_US	0x140
 #define RSW_AGEING_TIME		300
 

-- 
2.43.0


