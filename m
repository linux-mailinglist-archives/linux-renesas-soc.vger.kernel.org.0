Return-Path: <linux-renesas-soc+bounces-22554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A61BB1D97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BF341747B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0508313D61;
	Wed,  1 Oct 2025 21:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EthAISji"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A053126B7;
	Wed,  1 Oct 2025 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354180; cv=fail; b=FRl4C2FS/n5fb28LpNvMHGdV/ccuJ/CY5p0t4Lug+eruf65OMNThkpKfrm7ezo9ykXhRnB/BUrfRmzyds6J5EfI7lK4tvhjnbP24fed5b+/I/R5NsoleFQEsjKJklyJwLCXUfmwVNnE5Y7/2f2d91NY7TtJFBj3HgcP8aCTYVXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354180; c=relaxed/simple;
	bh=jKZ9En1VYBA/n9jxqszpKOb13tWmRjuWTAM7UmYs+7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KvtJBRYyNVqhPNGDiQeXIqn/EbPgZlXsgV5o/llUpQFDfQ0E3rh+Sf2wML42r0ZEZrVaUVrAr3ApVaHAL5OCaYEaTQgbCxc2PUNScs9+y0mKr0FOPkf6bq+B2XW6eCgpn7W8N4KvwT17BP2o5iUY/6nf+mHUdz29q3zXokZWFsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EthAISji; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyBuGZ+C+5AvftyF1waLfG0scxdhzIWjnKBxGR8d+uNhTk+5iaqHrvDmpU4rhy1dHpMxmVX/oFJYjBd1J+JhXQhSdGed+xP8KUbKOJPdPdi+rADHPZQ8ssN37dsDh6K6Faq12uBpaHD4qPHevsHjWZNFmcc3bZxa5PXoQwOFCo/CVrTv7IcZLTLWZ1R4teyYEsG0tg5qbilu+3+j6dIuNNBt1B085QYAbWlfyZHGRmA/s7VO13BVF8CYBY2k0Rn53+uqLdilZ5z5gHdKjaXPst/OWnBgZCPUPQfG1nOBHFzQbb18+dK7cSNmh0Xl45rMRRlrufUkFd3GBdhqYAzw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbQBhcyEpc4jyS8ol7J78NY1uBxyz+8B8rvtFiwPJ1A=;
 b=cAUL9IZo3fCnaCtAk9ys1KTYjMdoXiwvnpvJDI/xsSOXBIfKfwKTiPcdVQCG7JBSBkp6SsaecCn4izpQlbxBJq3H3HXYcr6MJeoC7Wc6GtDtxgQG5KV8bjpABZHmShyAreAKsgUmQriW8pFSY1KRcoZxW3L2kBYic2w+Q57+kxvaeb7FK+nOysN9lOAWCFxYVK8OE52/tY8p9AW0BpEv0rq/CtoZaTMiX9wIKP7YQ1cSaEhatuIFAA2R6znlxsdxMpg/8omNG0MlGO9+RbIkVMtISglfhcf3CmUJEHKhjukZkKpf+fgkRZAKgi0jqeZFNiwDvy8RIC6qlz8Yyo81VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbQBhcyEpc4jyS8ol7J78NY1uBxyz+8B8rvtFiwPJ1A=;
 b=EthAISjidhUAtHoxO+s2O1TfbjZHi33NuntOqVPL+Nbn1L35aE4boUTBB1EqJCQkr7no5fYapJ5T798ZDyhqDg9e/vjzC0/ymofOFfoMqaaemxfW/89VwXfZEnWReiKwCmSy1obhibCFPfAh6Y1vFdHcz/n+FSU/CEk8mVFYU38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB13012.jpnprd01.prod.outlook.com (2603:1096:405:1dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Wed, 1 Oct
 2025 21:29:32 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:29:32 +0000
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
Subject: [PATCH 18/18] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
Date: Wed,  1 Oct 2025 23:27:02 +0200
Message-ID: <20251001212709.579080-19-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8c7f430f-0c65-412d-15df-08de01319c6a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TyhfEDr1p5xcTaWK1W1kyDWgIstFcCfgPeQzwbWSfD9Qs20fGZIVd1FWdeT2?=
 =?us-ascii?Q?G+t0QkKTXCBNw9q+lgKR+EuGl5ZGItD/uxEe80dxmMF4thrrwo6yxCru66Sh?=
 =?us-ascii?Q?F64WmZNl5h6r1Pf1WQ1kbjed5qurnWwGbZS4Dkr+U/CWQ+5/FrCGUEg3Lp90?=
 =?us-ascii?Q?DE/NqSKGAmxL97/mqI/qfqJQVvIQRyYzOzg+kJcGchz6vcPdPZypp8GKbgdV?=
 =?us-ascii?Q?uBaqHoXNXnGZu9XPENWmpanbGxQ7zOKByd+4aYwL6t5QvzYN3bNoRev0RTT4?=
 =?us-ascii?Q?WwoyYPhZzVp4Zyz8OFHrrDBdA+LXnpRAU1dc/Zf+Caiiu/zl2AW9e5ftoLdd?=
 =?us-ascii?Q?KnJiC31kmyPL1y54s0NA5MFNiiQ2JEs/RndLj7plBVrWlveVUTiaU8oIc3Hh?=
 =?us-ascii?Q?oOqKEmxp0AUYM9Mk4lq7qlPWGSihg8JXKkHvcrShSzPvQ7jIoZVNUxVCc9de?=
 =?us-ascii?Q?AhgH4fIA9Lj5/ZW8mjfwyiGVvycBOnt+pKNjJg6pKpsWObsxozSxmOEUbEAj?=
 =?us-ascii?Q?dny7TPWzv+uzxoKhHm9J6PXhKLb6V9hYxwN9VNen/hTRzO9NCfmugonGP6tx?=
 =?us-ascii?Q?A9mH0MIpfAN5apwQcnsm0uydE3zy+KaFCXuyRni6vgFdUHRhP9D/pMNNcOJH?=
 =?us-ascii?Q?CehlfAHecHfyJQSgLTiG/Ws1J29E7K/6/JR58GhdmtvsqJ0uV/G/wf2Qy5pl?=
 =?us-ascii?Q?5c/Xbmgqlr5wh9fNfj1vF/OY8OzJoNC7x5lqvub0G8BIT0cDMK5J0HIoVMVl?=
 =?us-ascii?Q?RBMwEjzZSA71a4FszWpq1JKXbyHwaSpdpFvhwoP5PHXhVgbTqXMQQTvvUm47?=
 =?us-ascii?Q?kd3tEWkof/uQKzSk/cWnVWjws5d64Vpn3SIsPF1ub1zOsGDPIympQWye2OUc?=
 =?us-ascii?Q?/TaXp4QxNn/YMIMzxcaVSiqH94fkX/uuixWvNaN9iq35u7HoDjSQ/ZWALL1U?=
 =?us-ascii?Q?zDlEay1Ho4jl+4Zy040wqLMG20IIGqmCnLLDEEmBDzWdQY48QjKLoMMai+yN?=
 =?us-ascii?Q?B4EPYfI4Ed5F0x7NXT8esHw/WZd1gyNe8cXwJsltOnxaCRei8ZNVK6KXyL2b?=
 =?us-ascii?Q?SW+WnhaqxIKOFe/NoUzGjpt05XuqVias62mq7vc+ZnmI9zuJcl0cjQXX30rw?=
 =?us-ascii?Q?K7sqjgyAqcAcIh1G0BUYXCbeweumYZkPUTqEMmhUH3sFYFtwMPaQwYGnqgzN?=
 =?us-ascii?Q?kZmvA9/aUEyezVMizQLyUNwfjPTOWD1Zo7LiBleO7n4Z03jPLduekDd03dF8?=
 =?us-ascii?Q?3vO4MknvNf9wbZUiUF7isWZwvNco75Mcw9UCWuHhWZhRJ6UR3qNHgGicgXGl?=
 =?us-ascii?Q?ggzH+pNwBAKBuW/cWg/h5GuUR7Y7njj4VKFJIECY5GedGC62DMDJWpwrPWt0?=
 =?us-ascii?Q?JNu2Kv/co336/SQ5QpwkeVikMvBDeoZarncjhp/tIUjBKY7ZQb6rRZHUGKRB?=
 =?us-ascii?Q?ff7MqrKs9otuLFXMNjtNfnCr4I4aUWoDJmrZiM/9GJZmic9oNh34hPakqMFJ?=
 =?us-ascii?Q?SVaioyZj0Ct8ijLx0mgRObNwaZu4U6CyQYB/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jTUu8taxN3kzGdI66HHbs5RHwO/pek/+hFHNkV2Km0MUj39m01ddG1W1p3zT?=
 =?us-ascii?Q?dHj9pyuujT0IVeRg5RMIu+j/BBCrIuZdllswGvY1Z6GvlW/LhapjpLolvoR7?=
 =?us-ascii?Q?glNB1tSZkxjSV6bt0UmUuls/r+0sIaTI6Obc2Da6WiRc5Qrm/N3p46dy0Rwq?=
 =?us-ascii?Q?VpKOCskR6h82k/3hk4cqWdy+B47hyG+B+Ogd0Lzt9tgpsRrBee7PFEKX7ocm?=
 =?us-ascii?Q?8JcwOK94VFt3zFuzgxsEB7o0NbbwYdGXH/FxMFYjXq64HeXiiF6DpI/VBOBA?=
 =?us-ascii?Q?PKugLoPEnWdxAAvXQv7GAdCKgGweT9voGs5je03BxeUFaomBnG2Afd9NtJLS?=
 =?us-ascii?Q?X+7xcXGx2HArlYcFexTG3dDN4LURE7Z19D+7l3YfVwDisNqezP8VLZ95rVGu?=
 =?us-ascii?Q?27cYSxQS/c76hpzdNmy5QB28loIqxMBkC5tXYba0WmLVFI7tXOkQEyX7a7xu?=
 =?us-ascii?Q?0c95jA7AT6ilNGSqQ2ULau3YKuwPMfmGqxx6lKGd8ryFvvodeedhg/N7TM+o?=
 =?us-ascii?Q?dv+D5df0c2gyRYI7X0J79iRO6uUrFy8P8VINwHkDyvwGPHjDY3wBakyvtPzR?=
 =?us-ascii?Q?FJ7Wm8F7tmsnGRnKBxFbflL2TuceZAdULVWhPOZyJMx9k/HBuXeupYkCP3aN?=
 =?us-ascii?Q?JAJ3h7pxGtkGdNWYaqwnrqYr/M39ArTBuqUNcrdIbREZOLv/OwXW8rbmSi5u?=
 =?us-ascii?Q?Gxj4PEtyYpgOn8W1CT/mgOp8Ynbc/hjHA08zKZtYazq+4GJ4HTDHtpG33rCS?=
 =?us-ascii?Q?bIENhuje0F41kXMga4LFQ0ePC+x1B6FIH5q9tCEZQh0NxEoE7JN03wMyWwfE?=
 =?us-ascii?Q?am633i/KZrE2ID3R2bTFUKJla/XmaGVhVaIsrnN55POpi8d9p6PkMQ3pwfZC?=
 =?us-ascii?Q?bLjkbJ5pG0uQsQleboA6g1BgowfMDC++KJN2VJYOWNPxazURqTGfNItsya3G?=
 =?us-ascii?Q?o/z0501cPHlpwocMh0brTqI7Qb658aHDPDiDaWOhtsMZbCmT3jRqar2R2gNU?=
 =?us-ascii?Q?jjUOpXFZMD2hUYtORf3z3e/z7KtQM8w8n0VTg36apmP3o4Oj6UoSN9DjkTxN?=
 =?us-ascii?Q?Hy1Wm8csFxQP2pjYlhpduPDGavDgXfMXRxKJAqgRaL9IzfuiNg/Mj+/PAOcD?=
 =?us-ascii?Q?5bAaBFcKVw/6FSpHpqWvDGZPZ8O6dynJKXJG3LtT6BKQYy9Fx2Ic3s/q8aqx?=
 =?us-ascii?Q?oZXfq2KWb/8BfWeiQV1YTKj60WRAEzz4N40h8D/cDiESJGgE9lPWwy66E9j8?=
 =?us-ascii?Q?Ep5ER1xSy4VCMBP+oCbZlNpWEe6NkXQRWir2c2gKFBa/lFxSZJAbvftYjFLY?=
 =?us-ascii?Q?HMCQO5y7JBy358+5hP0zPtA8FmdOGZHCRTgpTIosf29fkPEaT1yEUqYAzYaF?=
 =?us-ascii?Q?E5ivvdE7Ss5afyThHmHdj01CmAYIXj1M3DRNO5pFPLnX2cu7+Vz6MQ4po1Is?=
 =?us-ascii?Q?SGuJztT74ZhRBNK2j6qxHZbs3AnNV3T89GVj1PV4berwHX1YKr1gVjQsLkU/?=
 =?us-ascii?Q?n9k2m/tAFfOL6lRJqVH+VfH4j+XXy2JpT53X1YTMMBbwRp9YNt9sVNpWT+fE?=
 =?us-ascii?Q?WADD+qK3nNcbeJu/7h+hMq50W7YoDDGHSJ0eNSMqjPuoWj6mLPsh2Uvxrihd?=
 =?us-ascii?Q?IvWbSUdZmMPTL+hDozDHAxU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7f430f-0c65-412d-15df-08de01319c6a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:29:32.5653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+SDFAeY2DX6dEXEJhm6CjWrE+y1aiNq1TnC6WdKW1RswExVRVA+elbXgZReS4qlbuVczecRQbyIwK+fSxqJM3VQZ7zEHbJG+C8iFx1PEXERPXDDYBwqa5nw9na4twXy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13012

Enable USB2.0 support on the RZ/G3E EVK board, USB1B_1A_HOST and
USB5_4_HOST connectors support only host operation and USB0_OTG
supports host/peripheral operation.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 49 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 23 +++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 08e814c03fa8..ca19e8628c80 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -164,6 +164,28 @@ sd1-data {
 				 <RZG3E_PORT_PINMUX(G, 5, 1)>; /* SD1DAT3 */
 		};
 	};
+
+	usb20_pins: usb20 {
+		ovc {
+			pinmux =  <RZG3E_PORT_PINMUX(0, 0, 12)>; /* OVC */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(0, 1, 12)>; /* VBUS */
+		};
+	};
+
+	usb21_pins: usb21 {
+		ovc {
+			pinmux = <RZG3E_PORT_PINMUX(G, 6, 12)>; /* OVC */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(K, 3, 12)>; /* VBUS */
+		};
+	};
 };
 
 &scif0 {
@@ -179,3 +201,30 @@ &sdhi1 {
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
+
+&usb20phyrst {
+	status = "okay";
+};
+
+&usb21phyrst {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb20_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb21_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 58561da3007a..2daf437abb82 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -90,11 +90,34 @@ &canfd {
 	status = "okay";
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
 &scif0 {
 	status = "okay";
 };
-- 
2.43.0


