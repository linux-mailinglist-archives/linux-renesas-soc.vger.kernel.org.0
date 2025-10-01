Return-Path: <linux-renesas-soc+bounces-22553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC35BB1D8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03C354C2967
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB46631354E;
	Wed,  1 Oct 2025 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CKd9JNJE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87873126BC;
	Wed,  1 Oct 2025 21:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354178; cv=fail; b=Y2wyytpypvbZxfFVVTfGb97x0vSg+NTKSwagiC9CYWiAP6jYzSb1/6SUf5A9hm0NjlGiE5JMSLUQlBsPwjDxW73SOAGA/gMJxqpiZw6EZPBdtOcpBUZ0bKYZkPj3ngFBrdUvrQ513r5VAzbvxqoysW/HRhYlMdKyl90HwPBCXJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354178; c=relaxed/simple;
	bh=mBeDqQer1GergzVsp4AV3Yi0FkbWwI4IEnGCsZyjpLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B8gbIxjwaz5gFKeaFNdvQgGa1XniIJux3BQCet5jyweua41vu3kqyHTR52vdTAzcJZOexfT65zDNjkwlEewk5X9HPyrFagS1bZy+Rb9oVqCweP9E/YJIL9sHg3NZr1cxbMNqZxuPQ0UnbdbWvjHfUOEtluEgfO4Qwg/yDVw33yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CKd9JNJE; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phxNttI5z1HYGnqd37kw17v4EKKYizfHN94gkAMEC5qrFuzK86U7eJaTVRh2LBUgUgTQBvvoXIhF+r/7iTdl0ReHshZD5E8qHZzn1ochdfwaTCHxrpeAU2Afwaf04Ze9WQGJxCTJvHsjUZ0tSiPBYhyujbj37ljH3BagVZf76pvnZ5bf2wjDQJKGwy5Eu+I2Iaaqb9zh+OONjNj/+S85QSUt79ziy2wsEHfvQdHiRmau3UHr8+wniJ+/KJIGUWop9DJymHit2ucgtG24jcmSPXIiiMNQw+Uhs9qaJjHTo20lRWXBLnT50CcN5D5aTQ9ZhKgVSE/ygoYj+3u0RxbvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqOcpyP311ksqm13k5teP5iv0+aP4oKXVnjjtRD7g1Q=;
 b=PpGW/aJS8YIMSno1cyw7iPgphVMtWsgUMj9g3AxDiapK7rkLzKlHRRroCx9rPNZEeV8kcHYVY+ADc6qiLyLbXP3w8+mLvL+SgcfjGTgHcB5vaL6xF/YvQzqZWsMgaHrhoFpK8WqeVFoKPBULnQ839uMGNynVpgVbNfCEBvyufwsMYf4sQz1S6vg13fkSjS5GX5wNHMpl/9lXA6y34php9Xj5jVcvKBhEDZKDp75XrwOkZVB5yJA3QrCFCbZW3TEsi7rEaa5xd0tBcxD7xOWrQrI+3NLHs0pKfYFz83iwfUy0Lg4VV2Pd/uhNim4MlIPiGv5K+xqbst8F8xMVeqhr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqOcpyP311ksqm13k5teP5iv0+aP4oKXVnjjtRD7g1Q=;
 b=CKd9JNJE/XPmHk/WcAGcOsbIXitwaSF2dAPVDGzD/knr0vPYKOjSClP1frsJyzJjoXKXS5Zc6wr3O/9n9ABeBFW+FuHsykyZbIVwh6QDWr4lSWpgD6Hjix8WkaalGLM2GAdI6Ts+ObqZZD4qrcYjAltKpeyG5mV1LEmXiYrlWUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB13012.jpnprd01.prod.outlook.com (2603:1096:405:1dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Wed, 1 Oct
 2025 21:29:26 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:29:26 +0000
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
Subject: [PATCH 17/18] arm64: dts: renesas: r9a09g047: Add USB2.0 support
Date: Wed,  1 Oct 2025 23:27:01 +0200
Message-ID: <20251001212709.579080-18-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: bffef726-80d9-44c0-7884-08de013198da
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qcufWiRXQyKlQqqNTosBv2w9nHY1vdSNpyQcum1UrBwi4q0j9VqkilygLN7t?=
 =?us-ascii?Q?adHEwppfPvuVnzqzqOrh8+YdeqbnNEsJzXhiE60BDmHsFq9Un4wYLcdLzROp?=
 =?us-ascii?Q?LdSrWvwDnCn+kDXx99U2rppEBG2bz0kjhDEmb/+MjBDN3MA73kFJb/a/zzb6?=
 =?us-ascii?Q?jQcZ21TKtzLZfZk/pntW8+6jowLT8hUBpQhnQBejVwViHTab3jtYe6F8akGt?=
 =?us-ascii?Q?5ZtxNXs2B+OxEJGofYQxmlZ26q3FwGpXh/MmOy2LjevclhwCMHPIMHlJjbmx?=
 =?us-ascii?Q?3IgLX0xYsMBMRM/IwK7IhB/aquWCJnYn0RZ/XpMea94C3b8yuHZ/D2jHiziR?=
 =?us-ascii?Q?oTR7434mKtQ1nAFq/KSagRiidnD7aTWzA/KtsnwTruJ0WFmK2DuWCaMbEx8j?=
 =?us-ascii?Q?L/UF7v6nBiwDysoPbqMLhfns9Pk/h0Fy0EJqv9CqNT1yQ2aF1eRi0/vsfhn9?=
 =?us-ascii?Q?sfhW38xaqPNU0uAn+RVvN0NWDET3YUoOyuOVPeepkKznf5Mlgz5Uj3t4QDAK?=
 =?us-ascii?Q?rOKtGaniavPU8YJGVm3BUKqeMzJh7ifEROmHrj5OWrmQ8eb4g836KFCknwDO?=
 =?us-ascii?Q?53vvvARpDZqt38GzhTn9ZmS0F2CD/dj4vrNta93ujoVC5ynth66N6mDmvJwk?=
 =?us-ascii?Q?iCBAFLdlVXBa5ariBUNX5NxC/b2wi02ht3j5ozPgRACHlz1uV0VHE0/BW+yF?=
 =?us-ascii?Q?ufOu8eyCGWW+TUyOIdMgOqvkQdfiqoYXS9ciAbx58RqgIOkO71L5fbQoh9U1?=
 =?us-ascii?Q?6HhwWmR5knQ0nQDoEpU7OuLY2/ZAJH2SZCmZFeJjtt52LiJKKSzH1nM4tfx6?=
 =?us-ascii?Q?mseNxEmmYIeG+zdInlZTCv+qqHieFFA/1L6RcWu/+gNKthqUh+Bkins9bna7?=
 =?us-ascii?Q?gmAVauW1rGsv6RKov8DGlDodVA7BldNn8W0ahRE3LrY37+lyUn3kYTmri6pG?=
 =?us-ascii?Q?uXy/sSahlxgg68GkWqIJJzPVrAxeS6j+GqbdUYUZpuxNXAFexxjf4jorjQbU?=
 =?us-ascii?Q?6oe49MC3oTCusB3Ap2mqZXf0SLgKf7YeM47jVxdHBEK+LMZNo+jLdiW6hNbD?=
 =?us-ascii?Q?eCvm0+MbKbRFSMsYXKcaSRC9oQqFFGyLmJvD28Z7Ypw9Hv6ZDrEgMJGE0gMO?=
 =?us-ascii?Q?NZaYMubkpxQ18nZ2Y3bGI7h65ohzHXMQm6UL6mmOcNHeFZZTeoRuYS3DXi47?=
 =?us-ascii?Q?mkl3yKeL4bUsAXSkGSiRWoFqjAhW2Jod6D/PwCugDDXpBNgG5QTADbMkvQur?=
 =?us-ascii?Q?z9VpupVSTzGpGgMuYPcB3iY3eV/9hdO72ecGDKlx1u5c5CXt9/uhNMO4798i?=
 =?us-ascii?Q?kEhqzYD12j/bLxb7t4hAqzxdgYs5q4tzpgu1sWYieUz0h+Gv/754/ko7I8jF?=
 =?us-ascii?Q?1YXez4EH+Esa5nXSbGczkCA4s86jQXH31FjSWVOwxXur64zDsILy7+u9q5o9?=
 =?us-ascii?Q?jhnL1SEo0mwkRs9T7kDSUjyRRMbH1Vyu7knHYn9thTiNvIeBzNQt1Swjjyqm?=
 =?us-ascii?Q?y2s8HZJcd1axKHPrx/eRVQ3BHJuCxeW7OJ0d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CJ0Fh2JkrM5yrd+wRofA7QlyorX/+ofXapr4rW8DB+OLHGewNRrpEJfW7pcR?=
 =?us-ascii?Q?N6fnwp4391bPy832g45dNgJn88eyCNwdZvBef9Pn08CXRc3uRIcgFStbP2Ph?=
 =?us-ascii?Q?zzVg262fcBl61RLEW8P3+wot+pJo0fG0x9RYn3zNZU5kafZrGM9bNOJNOxdM?=
 =?us-ascii?Q?uBm9KWYt4+n2vxoVdwx88TXF2XCkXzs+BrKmIALihEzmbIwewK1ZOJ0Gil3M?=
 =?us-ascii?Q?2KjMBvMdhbbFJeRD5MZh5pF1DR28CDVDaFJeoqYlZd+QU60UxFbyVfXNhFPb?=
 =?us-ascii?Q?QoXYy35FQvYpQA3XLZTwLGdQs5m3QrWjm9ILyDoHEj5vf1LyrS5DnEFws9nH?=
 =?us-ascii?Q?/+NqB7qWBs4I/DkIbIgLnjfBSvejww+VaEo6HlNENMA1M0YK/v0JLtPqCoti?=
 =?us-ascii?Q?LHIm2tDHI/MAwDBXV22V2A+BzQG5kU2fOfyGby5z/IkfTBJH3TW3XobP0ZCo?=
 =?us-ascii?Q?tOlt7YPjWf4Mo5wTVLFUhe9IDcs4S0fwMxdsAbTF8PU5zR5YNNtN0kJhZkqm?=
 =?us-ascii?Q?brJsXwWTPZSQoWcwtwbd1UZXxXwwj6yejt7wyQCSlyrfDlf8+Jd0XutLHxPE?=
 =?us-ascii?Q?ss8yGb7CDN//faKPr95nss4d+5n0TjY8ce1JxsWJapz+9+m3l6KhbtgXoeV4?=
 =?us-ascii?Q?LUpHxfmj+Erk6wheOi8DahYGx4TFJV0o7e7+QUmgO7HeNDMTqdlJVz5bWeYr?=
 =?us-ascii?Q?2UlCVibcBKGcZsrBgxQdQYJy47NAKlkKJI8H9PE33VLYMrm8cZH2aE7SyUV3?=
 =?us-ascii?Q?MTfXrlGs+rehrvIWVEP3vpEBUl6xUR69F5WV99+2FzSllIUFDh0OWB3qb3n+?=
 =?us-ascii?Q?M2nlSh9dG82Kj+mCbzbEGcaTv/Bv8cVZTkGV0IM5k6dKUHJ45ElzaQa6Nefs?=
 =?us-ascii?Q?eD7fD1QhExlnwhasfmQ1MSSRdP9w0X8EiUFfire8jWwWD6CqaMxJAX8S5BKg?=
 =?us-ascii?Q?v0xF5rxUICA+Dvoa4n3n17jDi46+jq0L1Hhso8IBMTUvsE3cGKVR0ifyGWZO?=
 =?us-ascii?Q?coutNalQMJV0CSswiMGbDVaVd0Ks7u+2B0mnNY8XZj8Bb40He4P7tzQklf47?=
 =?us-ascii?Q?2ajBT8orN+sPlDCtfE1rTEGSl3WHpVmq3FohF7zk4jeh6InbL9+MXLsd/qfa?=
 =?us-ascii?Q?GCnaGE+rmpmKQadHkUMk1PyjBy5Xb2MxzijXNIwo5tPGfxCQ5dcx5MqaOC3Y?=
 =?us-ascii?Q?3wQgSTtV9hx7HlG93map1ohM7OXot4q4fHQoGQ9f/yQGxkZ6gaTVC/4nCFZk?=
 =?us-ascii?Q?lk5KJNBTPZ0/yGA9743NX3c/ZKHZGA30N6BBvKNShBim9TVef+VtTuazp36p?=
 =?us-ascii?Q?CsYp59oBNR4sdDLeFCaD4LxxiylsJtFTtJpg8rE/SO2qg7tHJlRaDC7Wrnko?=
 =?us-ascii?Q?EDlKojfD0ofCXCV2aSdgaWCRRYzNHV+5//jbWeT4asKuOzSZGLJUWMrTfu1c?=
 =?us-ascii?Q?ovopJ+LO2bqhvuyQ4Ki+N4LtpPVcgP98cXVUdgcWpN+eEjHUwqshxhBHopTq?=
 =?us-ascii?Q?YNduOu39Fmjr2/EHP0xCTp+1C2CzeshmmXKTkCduMCDTobvFmU3ltlvNGSQ7?=
 =?us-ascii?Q?3CPJLhSew5lvmv0BABkOM9uU+FWpjdjvq4PAK4b+VgV2PfIGpixg+9vhSxGu?=
 =?us-ascii?Q?ygGfm/HH2jy3ETO5rqy0+qg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bffef726-80d9-44c0-7884-08de013198da
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:29:26.5717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90IBQIytFyibZ6WGcmOAvtcff4lkvZ4WkHIiXegUjg+U5H2bW5qQN8F/oV9El4GUZAJiPr10HNsnM8TNLZy6zTEvZ7xemHwBEBROqoYs1wITdo1TEcElFU1fhK4g9Xc+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13012

The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
and 1x channel with host interface.

Add the ECHI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
in R9A09G047 SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 122 +++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 47d843c79021..6c48ef5f4188 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -836,6 +836,128 @@ gic: interrupt-controller@14900000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		ohci0: usb@15800000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15800000 0 0x100>;
+			interrupts = <GIC_SPI 742 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@15810000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15810000 0 0x100>;
+			interrupts = <GIC_SPI 747 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@15800100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15800100 0 0x100>;
+			interrupts = <GIC_SPI 743 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@15810100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15810100 0 0x100>;
+			interrupts = <GIC_SPI 748 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@15800200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15800200 0 0x700>;
+			interrupts = <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE0>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb20phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				regulator-boot-on;
+				status = "disabled";
+			};
+		};
+
+		usb2_phy1: usb-phy@15810200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15810200 0 0x700>;
+			interrupts = <GIC_SPI 750 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE1>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb21phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb: usb@15820000 {
+			compatible = "renesas,usbhs-r9a09g047",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x15820000 0 0x10000>;
+			interrupts = <GIC_SPI 751 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 753 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 754 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb5>;
+			resets = <&usb20phyrst>, <&cpg 0xae>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb20phyrst: reset-controller@15830000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15830000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb6>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			status = "disabled";
+		};
+
+		usb21phyrst: reset-controller@15840000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15840000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb7>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@15c00000  {
 			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
-- 
2.43.0


