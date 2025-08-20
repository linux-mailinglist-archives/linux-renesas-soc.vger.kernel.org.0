Return-Path: <linux-renesas-soc+bounces-20753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4AB2D9A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 12:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D087B3B72E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 10:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C14E2DECBB;
	Wed, 20 Aug 2025 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vaegu5lU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE1524339D;
	Wed, 20 Aug 2025 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755684302; cv=fail; b=P6FwrHjcDJLCVfeSZ1fF/5arxg9E93N1OELzUrbCBbB3Yc8p2uijsd4TgbGCvO+BFdF0gjLUMYlbzD9UZ26ocorLVkHsZat18kJbYcUfVKXfNFy3y7nUQqz+mlGLUpO1DWugPuP4S5QO39k+m6nOippS1MJ9Wll788sqUNTfD08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755684302; c=relaxed/simple;
	bh=tFXlK0bX8YdHASQBuzzGAHZU+No5r+ulU5o+/GNQblQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OjtI7QaSbX2fyq1Kc3tKBr4T+6GvaCxWL7pJfF1VVIsWlCVTmBtV/zK5L8qTK7g8r0pfU2xI2OllMKUFX9bTnzHzkCK5Awtlx+gSf5Y4dYXgNIL1ZhmSBDHuxluD67QKCcetYO+RyydIB7IHHztRbXOLbrBWcporGHljvYbQKGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vaegu5lU; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCpayL0fkSG0uvW+piqeF1IskBIX8Bsa3k8HkLwAfufTeM9o30FsJFrpWXP1CaKoafpxEHbd8RIQ8b4uCs6zJhVTkHYyp1TB245MWlRPrNvQ/Pi/iRXx+RqiIbP1oK8FDKIGk5NB++Ngnc2kIZcbULw85aJj2tCnk9oOL24KVA3AR0AlUd3Jmy3mJouvqm3Lt2A0O0cjjJ4RdeVIFe+4DqKlwlD4TRrx4veS3BPOf5NNRBmrpRMVkJ49R8ZUNlF0LlEHhzYPWVUu/aBdpzQ6Gd+g7QnFKu9LMWIkBz44f67qbTG2reRbAXmN7wal/prHyMyPnnR5E3gitwM+sTm6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUYd5z0v0UL6k90hw0km/2QuMgn275DNiIwDJ4hT0nU=;
 b=Znit/tTJx20eQf0LFXD6jbKwREluU3t8IGnweKfKjO2UGpnT+NoXINi+kxiFyI0wihahLyVhbD04cNw1LveQkz92CQo00ah2GTlkfojQm6XYGeb2edLe1xNte7ZkL1a31iJE8SutazMrC7l8ipuGjGLRW9JcBWrY51AmE5kYqozZOdLblObRiWdzKl0N2vrhKf4QZDFLATEwu/TxJwYc1d2fKbW4+3kByx3CqbcbmWahp6N2fN2FFAznB+okoe2BHzkVhNXdRgJhCBM8tPaTwSGg5JGCPEu/Rbhw5V9dmp0i1hdZ2BXTngetGIijmrzuC8tSJM0BRvN2V5Ip9HaGhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUYd5z0v0UL6k90hw0km/2QuMgn275DNiIwDJ4hT0nU=;
 b=vaegu5lU8I2PRQyiUst7EM7mHZEIkaixvxPGhXhSK0S+PtrbZcTX6BTNR4DoCTepoP/42YazdMF7IcJGJHoCH/KHQBkTOmYY/WM59YeQ0stIT0t2i5JcmQzLwlryzNz+5tROetYR2wOg5RMDIwSUWoDd1fTzG+2V47MK5tGMmnQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB8109.jpnprd01.prod.outlook.com (2603:1096:400:11e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 10:04:56 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 10:04:56 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] dmaengine: sh: rz-dmac: Add runtime PM support
Date: Wed, 20 Aug 2025 12:04:21 +0200
Message-ID: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0182.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7aa242-d3aa-4c33-8e0e-08dddfd103ae
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FlYzJlSOsPTszwBZb12pEyJKS8auYkri4Ockujo8JmnhCi6xExLdqnbidAom?=
 =?us-ascii?Q?Lcpkf/3rK51DQBNC/6HSQZLKFCqBm3ryGxTRlaShEd/WhW2vWSI+QCHjbMaz?=
 =?us-ascii?Q?90iWCosKjH3ofeJdOmy5wCmr0XwMi/+tG/4wJjNNqwkghMOjQ71YlSDY1s/L?=
 =?us-ascii?Q?kF1+i/jC8JEALt78oWlMq8y4c1y/XkJTJ34Dcn31IPdBq0jrw3iRICguQR6G?=
 =?us-ascii?Q?NwtFyU+JscuPnuHA17mpgwVanpyE7AnG0+UPMBNOAJ+HC97b4Epj4IU33UwF?=
 =?us-ascii?Q?MajHxFWF5A5l4xDnRoQJBpyrcebZfG/SYv+kPMsdYBVlVwI8cF5eLP/vCfAa?=
 =?us-ascii?Q?bi+uv/eoplGx36+kWlXsRpuUIfe3CYRUtV+h3p5giWnx92Hz9EMMQZJKRGTe?=
 =?us-ascii?Q?f+rTUBJd3I40jvqFhForzPHGnUvP3cvmgjCx0Tdgxw1nC78rGL9OYdlQd6BC?=
 =?us-ascii?Q?tEpP0OwTsqNA2VhdNhBnLXJwWsRW8ST/W9c95soXis9f0IW0xR6/pG18Pdgu?=
 =?us-ascii?Q?qi3AjrzjOUjorwrT1tsxhWC4FUwUnhkTB844NpgmnWrCjB0WbFuuFO9ENOmy?=
 =?us-ascii?Q?6+8/VZQM1koUOtRLHwZLh65kjMBRbdAX0WhdQJ62oXo9t+Xmn2t1cy1uBvPH?=
 =?us-ascii?Q?FYAPt6s8LtxePd6WLyH59RLD1mjYZfKz/Pn/CXWDQYKajQ+jWAEqIS7m2hx1?=
 =?us-ascii?Q?DhpTuSq5DhOEuZO08zGh2R2id8RNRBy50+OscmyWQR6+XDFwVH1ck/aUqyIy?=
 =?us-ascii?Q?y0W9UCFDDkABCuhDtIvvdEoHMoq40X7hTbsiURUjoWd39DibvIZ4KW2+fkRq?=
 =?us-ascii?Q?hgglNKxFzyVPMwMkIG5q37l5q0NDCjDdw4tM4/XBLTvQOfB4jV4f69JW9m31?=
 =?us-ascii?Q?WGh0fytEA7XBGABIWDl6oA+plcFZSZ2klqC5g4UIGTqSGEbXKQBRcGiNwpei?=
 =?us-ascii?Q?zuUtaRttBJPfa82dZJDURgSJt/jxcrt2NQENB4Wzc8lxt7g+wLt0fSHdnrpe?=
 =?us-ascii?Q?WTEeqRG3OxDkIJNaMIbLfcdDABSNXmio2NMe6xlaMxGhTEWlI4CDzArxkG+q?=
 =?us-ascii?Q?Qsg9RZA+/AXU2bugy7na5kt681pGEE5zpL8ni/F9J544LAILDOmHpMByHipt?=
 =?us-ascii?Q?WliL7H/8OxTUkHEI+albVQSIxJIOoFmPbwy1yX2qtiRogrgapG94KPN678HT?=
 =?us-ascii?Q?NeIvbfeW3GD4wGbXDcS9yoM39RSkHPaY7mMjgPbNCUCD4IhbuehJSsQmEhj6?=
 =?us-ascii?Q?LpW8bJrQqjxk+IRZIUKBzehrPS4Uguto6G/pmmfcKhWVV03mmZU+HfDZBFCc?=
 =?us-ascii?Q?J7g+I3eFpxluT97OWMoSDHBqzSlYgf7ohgr+ksxVI4TDgXi2EbuttxbD8HPv?=
 =?us-ascii?Q?K1KHamW5kenJN8CQiR3MvqvS/OgLBpuErbV+Tgjlcc4xKrC6rsUvrJdbp9dC?=
 =?us-ascii?Q?eVyD/9nEA4MygOMhmbPb4ItReGuoBvUb7e7oIDOP1NVCPA9Y59wc7A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ss9lp/ABvBUoOHveqF33V0+H2WBQ1MktIImP0N0ydKQnl7aj5Al2nQToiMTY?=
 =?us-ascii?Q?TzdE+M9S3LdtAjohJ+9cq9Y9ahIc2y9pjlAwLFPfjRsGq+lQt/LSAOLVvQdc?=
 =?us-ascii?Q?roi5IQwFU39zAQRnT4jvQN74tV2zoXFz1tToUtdoftPjuj2Ixrrd45vPrm6k?=
 =?us-ascii?Q?VQxEbe0EE4X8IlrPnz/sm87x4/PETXCQU80fldTSXsZAGqCjmPC2m0JSvVfr?=
 =?us-ascii?Q?TDV8pXJ/Jh7y+eV5ZrdOq+yyt3vhm8luY/65K73GRfV2VYyaWa06VDWqSKtA?=
 =?us-ascii?Q?IGvQX5QRoIDNK9D6hYmS8HExFKvKovR7PYv8Gl7LAmOd9Pt8fUyCrxpGFLQe?=
 =?us-ascii?Q?Er3T9iAbs261p0nYiyBsAC6WNXpZOZ7P7UsHwuJZuTSdFCqXiemKs+SPwadi?=
 =?us-ascii?Q?/LcoZ6RGlV3ljScoyNioV8ScEKrdu06IiUKj3WB44qy6UTSvkkT1T8bvgLKm?=
 =?us-ascii?Q?AqztLgZC1nZkdYmuJtN6zpHAI41yKAXFUUFxMiOB1sJRV0HABKpu+Aoyjs37?=
 =?us-ascii?Q?2wWBNiYfAqE+B5sR+vRlUPK9JyCc88toSjyO2YdqX14G5ej1lUfsIfRLBOv9?=
 =?us-ascii?Q?PCZAURhEqdI/449V53vUNaAic57NkvO5xvjkzg80ekFCHSlMWQwMCqQVZFy4?=
 =?us-ascii?Q?1k/YCuM4P+PTZqY8M313IuUOgE5/T0Yw0OD5vjtZ+qI2iu9oABMtb83fQKtG?=
 =?us-ascii?Q?wJk2MzD46rRrTKt7cCLaC8AunCNp81xI3WZb64IBMuOioJaQK0mrnmiseIuP?=
 =?us-ascii?Q?TzAcsh2rPOecbddoIzUwa4irphNMoQOQNGb2KoVTiSARij+hlFqPE7/kjPMI?=
 =?us-ascii?Q?nrFwkxG84F1jbrQbtw3uzzeiC+DSWcEMSBN2/rKWOzfji3phtjQokrF6Oijs?=
 =?us-ascii?Q?0V1TFamvZMrzm/HeiCmSZcComdRBPHz1IM2WqAX6Tjm/ejcW99A88uuTV/w0?=
 =?us-ascii?Q?8SOyNS6NN+ibQpDB0yRaQtb3ex+qntSmHEoCUDQW8fSoIzoivE/tD2Gkbz0r?=
 =?us-ascii?Q?7+fuxRnak2mpUrPDhDsY6KpypO43pdJl2DVy/g0eM6iQMR484ogjIptA54VG?=
 =?us-ascii?Q?0VWnBvdsuhRnUIp9D3m+ZcCUeqdkRmjps/6B8jBpy1z0eSM4bfq9mAQPOpG5?=
 =?us-ascii?Q?Gg8sK66VzV5TchSP+PgKKnkTGqVJsSjX6eDZSG/d6BmnCUtRWB5qFUimTMSN?=
 =?us-ascii?Q?sKQQwaRuoz2p4yKdYE1na+Beu3go7ZF9VjjZje9WgEgVLIWhAySL4ilA7Qqm?=
 =?us-ascii?Q?8KuS/txoYfpY+32j0gcRsNJvhpZX6ZvoclA/8XYgJhB+Bkkr/dmRaj32GePy?=
 =?us-ascii?Q?TcRpe76ln36qsMs1Ga8d7J3Es2JgQqVsHMg7JKXl/mb2TPDV+iF8Dw1QIkAU?=
 =?us-ascii?Q?244ys3AtIW1JExA8I69QQTddY/lbO9Ie33Q74PwsZPZePB4C8C0eT9jlaE1X?=
 =?us-ascii?Q?sLbcOa02APj+HryYenc5GGKVYTUVJiHRQritnbicYHWHCq4OmjoZ570Ei5V2?=
 =?us-ascii?Q?P08ShDqdmZ3py9Itjs5mGd8jlF3oQeizgKg8eNWRoshXea3aBk+ZxnfNOkwn?=
 =?us-ascii?Q?+tzAt7KsuPMY+Ry8WhQ7/6rfm7O/bwGmAsFeJ3ltI3mc6nCApu2DZ+GCyAms?=
 =?us-ascii?Q?eaWATUGIEhwyZPZCR6IrhtQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7aa242-d3aa-4c33-8e0e-08dddfd103ae
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 10:04:56.3893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMDuTgidQUKonYuXVnk1WmYr1IyDzMDQ2NBHTfvd6HLgnXffjbEIdT4zkOBJ99Q88F3jN8VoGED5zDrV4Ih6OYlglGfTDTXWuRNOiw13m1UGtOZ+emk3Q1AZjwa9CO7d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8109

Dear All,

This patch series adds runtime PM support to the rz-dmac driver.
It also combines common code from rzg2l_cpg_assert() and rzg2l_cpg_deassert()
into a new __rzg2l_cpg_assert() helper to avoid code duplication,
and reworks __rzg2l_cpg_assert()/__rzv2h_cpg_assert() to return the state of
the assert/deassert operation.

Thanks & Regards,
Tommaso

Tommaso Merciai (4):
  clk: renesas: rzg2l: Simplify rzg2l_cpg_assert() and
    rzg2l_cpg_deassert()
  clk: renesas: rzg2l: Re-assert reset on deassert timeout
  clk: renesas: rzv2h: Re-assert reset on deassert timeout
  dmaengine: sh: rz-dmac: Add runtime PM support

 drivers/clk/renesas/rzg2l-cpg.c | 54 ++++++++++++++-----------------
 drivers/clk/renesas/rzv2h-cpg.c | 14 ++++++--
 drivers/dma/sh/rz-dmac.c        | 57 +++++++++++++++++++++++++++++----
 3 files changed, 85 insertions(+), 40 deletions(-)

-- 
2.43.0


