Return-Path: <linux-renesas-soc+bounces-30409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMRgDz9Axmm7HgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:30:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C964D340FEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 587C53029C38
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 08:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04483D6CA9;
	Fri, 27 Mar 2026 08:28:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308953D666A;
	Fri, 27 Mar 2026 08:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600086; cv=none; b=r+4BZ9BuUu3rJhZzsk7K7TG8f1yUN6FM/fv7250D4iZVUzp76/68UGhDGPyKADgi2VqIvcTPJtFHYpBILAMQG6FEHPcPjuNqorGaC/iyvNrXwBGDByZ46wXRqxLwT2gr3dQr2rFojftHDhza6CrpBPqjvgFIbq+WxOENi6XKa+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600086; c=relaxed/simple;
	bh=rcTOSka6tP/lYSG7IJtOBUcaxYoJK+gaZ9DeXg39u/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mfpxb5XVTCh1tt4j4LMF1odG6PT4wtZCgoff2I7QstDYTNK1nsQiUSeKooLXkfOUtgy1yw0fIfUcKCgy0NC4baNRvCxB0CNqIbgoyD/nl4F5KfODV/UUuBMbycOsvF9Jx5fqbMROcCx0X1phWiJyOhSrxFGsNWv4x7MTfRfmjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: XPWeV3TTSbKDDuVOlgbBCw==
X-CSE-MsgGUID: Xt8p+yZPS/mdnTebNiEL5w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Mar 2026 17:27:58 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 85571401225D;
	Fri, 27 Mar 2026 17:27:55 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 27 Mar 2026 09:27:34 +0100
Subject: [PATCH net-next v2 04/13] net: renesas: rswitch: add register
 definitions for vlan support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rswitch_add_vlans-v2-4-d7f4358ca57a@renesas.com>
References: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
In-Reply-To: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774600062; l=6161;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=rcTOSka6tP/lYSG7IJtOBUcaxYoJK+gaZ9DeXg39u/s=;
 b=24aYL3yZDcmGE6dSeJ4Mepg4rA8ij15OCLTD/bnpGDMjPbol487fA2PyUlMZw1G3rl+hQQqMR
 FO0PnxUGRtBDrAtylXFyZQU4pM/ly1HdqFXedZ29gBAywGA7elagPQQ
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30409-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C964D340FEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing register and bit definitions for vlan support.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h | 156 ++++++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 340524d995ac..15d3fa48b0e3 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -7,8 +7,10 @@
 #ifndef __RSWITCH_H__
 #define __RSWITCH_H__
 
+#include <linux/if_vlan.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
+#include <net/switchdev.h>
 
 #include "rcar_gen4_ptp.h"
 
@@ -221,7 +223,7 @@ enum rswitch_reg {
 	FWMACTL1	= FWRO + 0x4634,
 	FWMACTL2	= FWRO + 0x4638,
 	FWMACTL3	= FWRO + 0x463c,
-	FWMACTL4	= FWRO + 0x4640,
+	FWMACTL40	= FWRO + 0x4640,
 	FWMACTL5	= FWRO + 0x4650,
 	FWMACTLR	= FWRO + 0x4654,
 	FWMACTIM	= FWRO + 0x4660,
@@ -249,7 +251,7 @@ enum rswitch_reg {
 	FWVLANTL0	= FWRO + 0x4910,
 	FWVLANTL1	= FWRO + 0x4914,
 	FWVLANTL2	= FWRO + 0x4918,
-	FWVLANTL3	= FWRO + 0x4920,
+	FWVLANTL30	= FWRO + 0x4920,
 	FWVLANTL4	= FWRO + 0x4930,
 	FWVLANTLR	= FWRO + 0x4934,
 	FWVLANTIM	= FWRO + 0x4940,
@@ -508,7 +510,7 @@ enum rswitch_reg {
 	EACTDQMLM	= TARO + 0x010c,
 	EAVCC		= TARO + 0x0130,
 	EAVTC		= TARO + 0x0134,
-	EATTFC		= TARO + 0x0138,
+	EARTFC		= TARO + 0x0138,
 	EACAEC		= TARO + 0x0200,
 	EACC		= TARO + 0x0204,
 	EACAIVC0	= TARO + 0x0220,
@@ -729,6 +731,41 @@ enum rswitch_etha_mode {
 
 #define EAMS_OPS_MASK		EAMC_OPC_OPERATION
 
+/* bit field definitions for EAVCC and GWVCC */
+#define VEM			GENMASK(18, 16)
+#define VIM			BIT(0)
+
+/* bit field definitions for EAVTC and GWVTC */
+#define STD			BIT(31)
+#define STP			GENMASK(30, 28)
+#define STV			GENMASK(27, 16)
+#define CTD			BIT(15)
+#define CTP			GENMASK(14, 12)
+#define CTV			GENMASK(11, 0)
+
+/* bit field definitions for EARTFC and GWTTCF */
+#define UT			BIT(8)
+#define SCRT			BIT(7)
+#define SCT			BIT(6)
+#define CRT			BIT(5)
+#define CT			BIT(4)
+#define CSRT			BIT(3)
+#define CST			BIT(2)
+#define RT			BIT(1)
+#define NT			BIT(0)
+
+/* bit field definitions for EARDQDC and GWRDQDC */
+#define DQD			GENMASK(10, 0)
+#define DES_RAM_DP		0x400
+
+enum vlan_egress_mode {
+	NO_VLAN,
+	C_TAG_VLAN,
+	HW_C_TAG_VLAN,
+	SC_TAG_VLAN,
+	HW_SC_TAG_VLAN,
+};
+
 #define EAVCC_VEM_SC_TAG	(0x3 << 16)
 
 #define MPIC_PIS		GENMASK(2, 0)
@@ -806,6 +843,22 @@ enum rswitch_gwca_mode {
 #define CABPPFLC_INIT_VALUE	0x00800080
 
 /* MFWD */
+#define FWGC_SVM		GENMASK(1, 0)
+
+enum switch_vlan_mode {
+	NO_VLAN_MODE,
+	C_TAG,
+	SC_TAG,
+};
+
+/* FWCEPRC2 */
+#define FDMACSLFEF		BIT(19)
+#define FDMACUFEF		BIT(3)
+
+/* FWCEPTC */
+#define EPCS			GENMASK(17, 16)
+#define EPCSD			GENMASK(6, 0)
+
 #define FWPC0(i)		(FWPC00 + (i) * 0x10)
 #define FWPC0_LTHTA		BIT(0)
 #define FWPC0_IP4UE		BIT(3)
@@ -816,10 +869,13 @@ enum rswitch_gwca_mode {
 #define FWPC0_IPDSA		BIT(12)
 #define FWPC0_IPHLA		BIT(18)
 #define FWPC0_MACDSA		BIT(20)
+#define FWPC0_MACRUDA           BIT(21)
 #define FWPC0_MACSSA		BIT(23)
 #define FWPC0_MACHLA		BIT(26)
 #define FWPC0_MACHMA		BIT(27)
 #define FWPC0_VLANSA		BIT(28)
+#define FWPC0_VLANRU            BIT(29)
+#define FWPC0_VLANRUS           BIT(30)
 
 #define FWPC1(i)		(FWPC10 + (i) * 0x10)
 #define FWCP1_LTHFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
@@ -847,6 +903,98 @@ enum rswitch_gwca_mode {
 #define FWMACAGC_MACAGOG	BIT(28)
 #define FWMACAGC_MACDESOG	BIT(29)
 
+//FWMACTL0
+#define FWMACTL0_ED		BIT(16)
+#define FWMACTL0_HLD		BIT(10)
+#define FWMACTL0_DE		BIT(9)
+#define FWMACTL0_SL		BIT(8)
+
+//FWMACTL3
+#define FWMACTL3_DSLV		GENMASK(16 + RSWITCH_NUM_AGENTS - 1, 16)
+#define FWMACTL3_SSLV		GENMASK(RSWITCH_NUM_AGENTS - 1, 0)
+
+//FWMACTL4
+#define FWMACTL4(i)		(FWMACTL40 + (i) * 4)
+#define FWMACTL4_CSDL		GENMASK(6, 0)
+
+//FWMACTL5
+#define FWMACTL5_CME		BIT(21)
+#define FWMACTL5_EME		BIT(20)
+#define FWMACTL5_IPU		BIT(19)
+#define FWMACTL5_IPV		GENMASK(18, 16)
+#define FWMACTL5_DV		GENMASK(6, 0)
+
+//FWMACTLR
+#define FWMACTLR_L		BIT(31)
+#define FWMACTLR_LCN		GENMASK(25, 16)
+#define FWMACTLR_LO		BIT(3)
+#define FWMACTLR_LEF		BIT(2)
+#define FWMACTLR_LSF		BIT(1)
+#define FWMACTLR_LF		BIT(0)
+
+// FWVLANTEC
+#define VLANTMUE		GENMASK(28, 16)
+
+// FWVLANTL0
+#define VLANED			BIT(16)
+#define VLANHLDL		BIT(10)
+#define VLANSLL			BIT(8)
+
+// FWVLANTL1
+#define VLANVIDL		GENMASK(11, 0)
+
+// FWVLANTL2
+#define VLANSLVL		GENMASK(6, 0)
+
+// FWVLANTL3
+#define FWVLANTL3(i)		(FWVLANTL30 + (i) * 4)
+#define VLANCSDL		GENMASK(6, 0)
+
+// FWVLANTL4
+#define VLANCMEL		BIT(21)
+#define VLANEMEL		BIT(20)
+#define VLANIPUL		BIT(19)
+#define VLANIPVL		GENMASK(18, 16)
+#define VLANDVL			GENMASK(6, 0)
+
+// FWVLANTLR
+#define VLANTL			BIT(31)
+#define VLANLO			BIT(3)
+#define VLANLEF			BIT(2)
+#define VLANLSF			BIT(1)
+#define VLANLF			BIT(0)
+
+// FWVLANTIM
+#define VLANTR			BIT(1)
+#define VLANTIOG		BIT(0)
+
+// FWVLANTEM
+#define VLANTUEN		GENMASK(28, 16)
+#define VLANTEN			GENAMSK(12, 0)
+
+// FWVLANTS
+#define VLANVIDS		GENMASK(11, 0)
+
+// FWVLANTSR0
+#define VLANTS			BIT(31)
+#define VLANHLDS		BIT(10)
+#define VLANSLS			BIT(8)
+#define VLANSNF			BIT(1)
+#define VLANSEF			BIT(0)
+
+// FWVLANTSR1
+#define VLANSLVS		GENMASK(6, 0)
+
+// FWVLANTSR2
+#define FWVLANTSR2(i)		(FWVLANTSR20 + (i) * 4)
+
+// FWVLANTSR3
+#define VLANCMES		BIT(21)
+#define VLANEMES		BIT(20)
+#define VLANIPUS		BIT(19)
+#define VLANIPVS		GENMASK(18, 16)
+#define VLANDVS			GENMASK(6, 0)
+
 #define RSW_AGEING_CLK_PER_US	0x140
 #define RSW_AGEING_TIME		300
 
@@ -904,7 +1052,7 @@ enum DIE_DT {
 #define INFO1_DV(port_vector)	((u64)(port_vector) << 48ULL)
 
 /* For reception */
-#define INFO1_SPN(port)		((u64)(port) << 36ULL)
+#define SPN			GENMASK_U64(38, 36)
 
 /* For timestamp descriptor in dptrl (Byte 4 to 7) */
 #define TS_DESC_TSUN(dptrl)	((dptrl) & GENMASK(7, 0))

-- 
2.43.0


