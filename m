Return-Path: <linux-renesas-soc+bounces-32973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDJuCrpJEGpkVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:19:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7675B3C7B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15AC9304CF7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9E237E2FF;
	Fri, 22 May 2026 12:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FLcmn2KE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDBE37DE99;
	Fri, 22 May 2026 12:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451989; cv=fail; b=UuaVTpxfTl6stG6dE66LSIIOlfTeNBnR3eRFTUuvoNDWAGI1f3Z8tSiS5DC1A1Xg7z0jsMKTw6sNeajj97f/rS3daGT4RKt/5Cru8WdQsOPtT2TXl6ZmjNCGttAamimMkMyKqQmBLrO4lqOkK/EA9muU2jxCGN1xs6C2NIFF4Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451989; c=relaxed/simple;
	bh=jxtflo7pqLz5vv2Og2F+NhedUGaL5nZobcZN5x5IYz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okL7s8lDGqn16dWgmQslKY66P6rgRYFRNm2u5F3AxLu70lndTnUB10VKjIm8/MK54igFkvypW9YSp/AtCEFQiFN0N6N5daCszY08NjLEfX1qwglyZW/LXghQ78XrKMerRij+wkOvrwVL+qsdf0gKmMUa7XXQ7pwoVdoGAgEPlqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FLcmn2KE; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsuJxeSJtOTVW0S+xaqHdoHdgWrLFGnY3ndTHF2UsldTZRffSjv84d0wc6ULQZL49lg/HAcwTumCqXSIBNgfxrM67YKlXt9IOLSk81mEf8p/a8wI/orsA3iDqo+KovYHdV1bi1pE7Rw5+BNzHh/kEz+tAkm/A/ouNQk9tA9kiuc93BZW1IwDOn0EW/NOHh8pR7dDInuClzkQr62p5mSVOgC2ulFGw36/tNQM481HJEIUJiSvaEetzdXy+CZD3L14S6XnCIix7ImrLBEXuSF3Z+yD5dvALt4UoQsEmti4LOqV8w6Hz1Xx4HwARRDOsOu7ozCF9YnDucciBR4atb3hHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEjw3elXQv2BiTljP6bkm5RxvWHzmH6KGBQFCB/YPnc=;
 b=ETIMbQrHHD/V1ouBHJxW4nabWQYT8za9SE8f9WnNX3OvS5RexXX2M+vcrJ+pOJJb3fdaMUjUDfLMWbjjA88GedIFuS/Rwo48d01TNxZq2E/j0FBvio/kHzqZygpC6xNphEq9HYG9m3KPQquHpYOpR+mKzPBC7QVJajHMi/0SojnCLjxaH0pAmBR/O0FXeIegD/FHXQSdO2QgzKP0L42tJy1gqGllt73h1jmiZZNXyY+FdqHT+jhjFyLBOjo2boFIzGASFXoaktMqFQj3EyvLJjJpSs7Gm4VSgzBRBebHHH4gPYjUO4H4yiGbV2+ZxoAPZeBaT9X7AemMnGU2lSnmsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEjw3elXQv2BiTljP6bkm5RxvWHzmH6KGBQFCB/YPnc=;
 b=FLcmn2KEKw/WnmmM8DCzIfC8ZYn0Z7anvHbmKAPTlID+83G6HV9ssRB6ecgUt3DfWhobVnGirKegeDFrobgaaMAybfS03KSGwpQqYLSXS06A6XoKhqACJdYhQ0IBzVe/glvjPGMrMELOdiqmqWVWtA3CrXF4CKxOclfZ68WapIA=
Received: from TY6P286CA0041.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:3b7::18)
 by OSOPR01MB12155.jpnprd01.prod.outlook.com (2603:1096:604:2de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:13:03 +0000
Received: from TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7:cafe::8c) by TY6P286CA0041.outlook.office365.com
 (2603:1096:405:3b7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD9.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:13:02 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 07DB23000466;
	Fri, 22 May 2026 21:12:58 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:33 +0200
Subject: [PATCH net-next v5 04/14] net: renesas: rswitch: add register
 definitions for vlan support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-4-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-0-53589d944a9f@renesas.com>
In-Reply-To: <20260522-rswitch_add_vlans-v5-0-53589d944a9f@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=6223;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=jxtflo7pqLz5vv2Og2F+NhedUGaL5nZobcZN5x5IYz4=;
 b=0QjIniEvu/sX7ltSpczuUASXE6YmK5H7VjJY5Wjen95FcSWIOjl0UMvQdkMbU11kzb/r6X2dE
 dxbnGEcKY+vDTx9liq6r8qV4kMl0tRhYD5DSUy4c76RnOUum4X7ul77
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD9:EE_|OSOPR01MB12155:EE_
X-MS-Office365-Filtering-Correlation-Id: fed560b2-3735-49f1-a242-08deb7fb78c3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|1800799024|376014|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	iOg/FVwDyrmu57yUPmk8tARXuSKbyl+zdwPy0kq5VgcmwXY0S3XJaIZ1VXkADNbCyvIH8Wn81zKiwIDNKpt5cIeRkk9OAkXdAfUYjxPJRrdBPjwtor3d/O/BD81loIcFbq6g5Cu5pEUxtjAw9FmJokeYcxdHtc4K8NXxCl1XikAHD/grMJo2i+5sTwcpWOqfMFDK/71YTqEHxS+5xET77y+0FU4a6Oe5YQTmJ4AUWO9WrUpqqe5GbweTkHF4qhQoNCY5mtgC3cwFxIiXWhNu9bNb9SrUMyyM8ThSlUvjfVe+eu2jhOM0z6UXlGVSMmhXJm3M6F8lOGZjLe7xR3goWFsoSUAqyw5PUag0EvnGS5lvP7/LWva3BdmFmOosZKcQT71CNrzsVTccUtzscd+wUZlCBc//UGpktYrTaVGGFqiNFQFxuvPpAaUFmkU++McLX4ndx/CROmpCl5wpxRF4E5nYT0KBMhgZPDqpA/DzhAnNea8ZFA2l3ZL6mOIkCiU2EMFcYbukMWtZ7DZIyo56l1XvpI9t60hqhZUcKf6pbf5t6iV6FF5OVWhFn3optbIkWsBm9G++n2u3gJpInNnLu3WpZ8ELhCejycwNmingoFO7A3n7GfhIIK9p4Ilp44kt/CUCNoPvP0TaWJm0/7IB5XXQCeq2+Pm0xUaDoFVuvuZGwSnE1TLPEv1Ul66OAX0t1hOCCnVQxVA/lfcV0NwnZj1W01KvW/7LcwSTStChcZk=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nx4dQBj6wkwZDakO0pUDFINZXDJpIO3DqzMViTVgqsPesjactDTSS03EJ+dSYZcv8zXLyUmk3l7q+Kt7zA+moctRDE5jwJDfiBBVAvUNPC/6z8DNQORn/S2nmpEryFMCDKS8lVQ3mvYkOmg0b9IlNnYQZG0kN+HHwpUFidYtL5NnVnJdfSn9ytTNbz7CmcOVejlnm+w7OKqHyvFyNN0R80wLbNoeBHSxp65M6hfHLYOpw/oB5quQITnQXW4X5RZz4/NhNv1qNSBU5u58tPCANaCDdSiPtLHlW4BObVSBhjvJaid4aUpOnuj14njzEQAihIqRScV4jRE543m2gvZKsv/0HyzGlnsCHJPn317fh/aaA69tPxDXxIhuLnI54UpM8rSxSSTJlwtou4Tz0ywSB2P3k8eHUgA2I/QN59ijd285x4J7CSh4KOHUccC6PUZ7
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:13:02.3442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fed560b2-3735-49f1-a242-08deb7fb78c3
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12155
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32973-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,pbarker.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,renesas.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC7675B3C7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing register and bit definitions for vlan support.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h | 156 ++++++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 340524d995ac..e56c15dd4ecd 100644
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
 
+/* FWMACTL0 */
+#define FWMACTL0_ED		BIT(16)
+#define FWMACTL0_HLD		BIT(10)
+#define FWMACTL0_DE		BIT(9)
+#define FWMACTL0_SL		BIT(8)
+
+/* FWMACTL3 */
+#define FWMACTL3_DSLV		GENMASK(16 + RSWITCH_NUM_AGENTS - 1, 16)
+#define FWMACTL3_SSLV		GENMASK(RSWITCH_NUM_AGENTS - 1, 0)
+
+/* FWMACTL4 */
+#define FWMACTL4(i)		(FWMACTL40 + (i) * 4)
+#define FWMACTL4_CSDL		GENMASK(6, 0)
+
+/* FWMACTL5 */
+#define FWMACTL5_CME		BIT(21)
+#define FWMACTL5_EME		BIT(20)
+#define FWMACTL5_IPU		BIT(19)
+#define FWMACTL5_IPV		GENMASK(18, 16)
+#define FWMACTL5_DV		GENMASK(6, 0)
+
+/* FWMACTLR */
+#define FWMACTLR_L		BIT(31)
+#define FWMACTLR_LCN		GENMASK(25, 16)
+#define FWMACTLR_LO		BIT(3)
+#define FWMACTLR_LEF		BIT(2)
+#define FWMACTLR_LSF		BIT(1)
+#define FWMACTLR_LF		BIT(0)
+
+/* FWVLANTEC */
+#define VLANTMUE		GENMASK(28, 16)
+
+/* FWVLANTL0 */
+#define VLANED			BIT(16)
+#define VLANHLDL		BIT(10)
+#define VLANSLL			BIT(8)
+
+/* FWVLANTL1 */
+#define VLANVIDL		GENMASK(11, 0)
+
+/* FWVLANTL2 */
+#define VLANSLVL		GENMASK(6, 0)
+
+/* FWVLANTL3 */
+#define FWVLANTL3(i)		(FWVLANTL30 + (i) * 4)
+#define VLANCSDL		GENMASK(6, 0)
+
+/* FWVLANTL4 */
+#define VLANCMEL		BIT(21)
+#define VLANEMEL		BIT(20)
+#define VLANIPUL		BIT(19)
+#define VLANIPVL		GENMASK(18, 16)
+#define VLANDVL			GENMASK(6, 0)
+
+/* FWVLANTLR */
+#define VLANTL			BIT(31)
+#define VLANLO			BIT(3)
+#define VLANLEF			BIT(2)
+#define VLANLSF			BIT(1)
+#define VLANLF			BIT(0)
+
+/* FWVLANTIM */
+#define VLANTR			BIT(1)
+#define VLANTIOG		BIT(0)
+
+/* FWVLANTEM */
+#define VLANTUEN		GENMASK(28, 16)
+#define VLANTEN			GENMASK(12, 0)
+
+/* FWVLANTS */
+#define VLANVIDS		GENMASK(11, 0)
+
+/* FWVLANTSR0 */
+#define VLANTS			BIT(31)
+#define VLANHLDS		BIT(10)
+#define VLANSLS			BIT(8)
+#define VLANSNF			BIT(1)
+#define VLANSEF			BIT(0)
+
+/* FWVLANTSR1 */
+#define VLANSLVS		GENMASK(6, 0)
+
+/* FWVLANTSR2 */
+#define FWVLANTSR2(i)		(FWVLANTSR20 + (i) * 4)
+
+/* FWVLANTSR3 */
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


