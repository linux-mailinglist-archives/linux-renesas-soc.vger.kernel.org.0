Return-Path: <linux-renesas-soc+bounces-21237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F9B41871
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 10:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3BEC1BA3F06
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 08:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719122EBDD7;
	Wed,  3 Sep 2025 08:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ba3HLWFL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4888A2EB87C;
	Wed,  3 Sep 2025 08:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888113; cv=fail; b=pLutNDOsnRbuC+ojMPKORpNhu9JyA7ibWEZ2eja+K1ipzn8RDVDaIlmOStAgfDIgIi2d1XzIAF3g1Hi9ni2npvPt6eujzZwGYOL0dIvtRj+MyAt65TmZO38LSJrVpuF6mJqwdytFw7BpIXB5219x0D1THoQf0iMWhI0GGPtAV8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888113; c=relaxed/simple;
	bh=DhY7Ob3fIFOKZ+qprwdLpAndyLlwfpRsj44PZ2QcWK4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fd6bDMZ3MXu3QObICCWuz/wY7NdSbTDn4BF9CdS0IOqVlkaQ0YY8fSutXjwW6/MiIGgz2CX443lJPsymsK26i000xFVJjKmZsq0X15Ss/bzwjy9xJbPtD6hV8e1Iq9ldL11AaYe0HW0AHcI5+kAJcn0QXKhSP7YIxZ8H9+MZ6tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ba3HLWFL; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDD4LYMm7uJzZYTfJBxAEl52BajQNsdT/V0C7Ibmlijst7xKZQQkRC7kefr+Jbz/zGAIR+DGM26HhOQGMBiikcRJqh8NaXUv+BaqNtSgA5ig0lgAnBp/lsyquyjm0v+TNi8sm8Zvyj9doz/zFZpWs/PnSqGT1CsbUWrVnYtk91+ChHyZRXqaiVZFuGTVfiL5sUn2AuCaIiqq6XrKSLZo8Zm1M9BmVqotDRxM39AG5oesfWAmwxBYI9npZAbIRfTiUemi+C/pCrfdUHLrFM9CTbZv+FLsK5Lj1uWPfrVH77pZy+K0CsPAXGpvZ63T6QDYg6B+s2Ndfy7xwz9DeY1Zxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkUkPGUb1mcK4GzaS9uxBGxWFR8DFPfm5LYguJAvuVc=;
 b=y1iicHEqiknWEKZBJmrbcIuetB6eMgQfDdSamQigm/hcyb3hbXONHa3nmq+lkRjCWRloK/BFQSjQJ07MaSCmU1GTGXfSwQvQhXaDiLRU3NmERimpgNf0EVGY/rTQkXT6HRnWT8RtwhyNVFR0YEkMcHjDhFxAfJK9Tft/A1h/y/HTZMdKzXI6H7E+ZElD4xlWxOLz/MuGSlhBeBKonjHhcI3oFzAtqF2fXvEDh3c7ZnVhyA5fqcfUcyuXHXzKMApXNTbf1cATndepqnQsr40PeXimLZx+aUYl/w++z6c7wwBCoDk4ku2ip7t77cNF5WxtgbVyHAgD8myd6peBrKzF8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkUkPGUb1mcK4GzaS9uxBGxWFR8DFPfm5LYguJAvuVc=;
 b=Ba3HLWFLhMkPBskEjgxCVldy2kULzcDtHnlgG4teGhxFEUVnpaZGr6FzyVTeEtaEzDNu61z9mUTILiJhZzv82mPJO7d8PiQWQHTxq723hl951wXFS8yZkhKdoHg303x5CbpXjItJ7yiLUpAmabadOx0w3Z88drVFBtCWLy92j/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB14678.jpnprd01.prod.outlook.com (2603:1096:604:39f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 08:28:27 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 08:28:27 +0000
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
Subject: [PATCH v2 0/5] dmaengine: sh: rz-dmac: Add runtime PM support
Date: Wed,  3 Sep 2025 10:27:49 +0200
Message-ID: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB14678:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1d0896-ae7b-4827-47b9-08ddeac3db03
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?URR2L0M68unCJLZ+NPzrNc63z/+wMsHIl/niQ878B+7JzfDRPcXT0hkZI4rA?=
 =?us-ascii?Q?saBfocEhQQZNjVIrA4VGUe88k2bMupcVefzsy6WRSmUDvBgeQ1BhQEKR9KfE?=
 =?us-ascii?Q?NO5WlPdVgNxHf+jiq2a/dZgauwrF1dIec2oY8cNDy7VA8GzweRmjEQcJD3nn?=
 =?us-ascii?Q?m4vhNuFeMbSv36XjXmvWJYJX3ID4VdSbOTtVeJ8BcEznBrkH0vdycLX6+luT?=
 =?us-ascii?Q?GEweWeWSkR/GKtUTPIuo0E2vaWJgXopHjel6yKxO7CE+WVCpu9wsY/gInaG/?=
 =?us-ascii?Q?iM7EylzvLuS8eHHsZ+aZ1E7QuGEg/dVVFB8p64RLigyohpdoXZCdbBVh8qEW?=
 =?us-ascii?Q?5CPEtBRdFCBx4uzU2K+v042mwbsHiltIW/5KqFnzYvwfJ5QZe+AKfPtjnOuy?=
 =?us-ascii?Q?oD+6mJUMJW00L34Kn01xgAsXHFJhhx8Dl8AQQYBYZxt+k9rJspRM1locRrf/?=
 =?us-ascii?Q?kvCsp9aPcze5K1e5lk9Q2K3n1kGRQRheRjFG28azjYygYhEw/eZcgE6SS5DH?=
 =?us-ascii?Q?EwB4Fgztt02Dq4paO8WZ4BxvC1F/O30cdCUAoGbq4kSPQo3to1zhVPTilZ8A?=
 =?us-ascii?Q?cpPJHFc964GZ/ysjz3dk0AAWbjSIXJQs0MpwETJQyITMsyxhdtP0v1/NTC7g?=
 =?us-ascii?Q?vb+Lbv6FwIxMWUqrLmvkDDLwaqKia7jfZMFXVdkG9HtkIw5xexFhNuZw/LcT?=
 =?us-ascii?Q?NK8gBXye5eZhXb4AIsUzB0z6vjebmEzdNkMjEpcmdZaKoFGB51etUfm0TvmC?=
 =?us-ascii?Q?OBRDjScwFX7+bGzRGH7Gnu4f3q38N60O4fmDamQbKgB3fTr66xLbnKr4hO1T?=
 =?us-ascii?Q?+TYJKGizG+yLMJ5tzoejOtXnQ+/pfgOeIH92mROjl25iGMyJ5JXnh1yCMqpN?=
 =?us-ascii?Q?j9L7rFtphUDRTyTCejrnuQUe4K1E3ScqU3vG60nPOxO6CS6XWSe0ocr/oixA?=
 =?us-ascii?Q?Kq2hilMwUP8RVcsLyu9HJliiRYnA5D+pMRjpel6m4fH2Lym8+Ggs7OyZK/pW?=
 =?us-ascii?Q?bwT/54hbMDW90oHVWudc6Ddhh5FDUeHWJMWLRd402F8uA9W6vtjD1c7xjyuG?=
 =?us-ascii?Q?88F8IO8gOgylck+Is7mMeJZ8aLSCk7yJ28Vdf+41YCzxHfy3pM82CmwrFpFv?=
 =?us-ascii?Q?9FBAY7d2QunexKOzGwC3xWXADsoYd6p6jJ5ngTArzE4EaKT6Qr0HRBPOrnG8?=
 =?us-ascii?Q?hGWUOyywEepDsD+HVihzebgL5JoIFi0OqxwMU1kbJwAd6KDoLngSM4+tvHvh?=
 =?us-ascii?Q?q//Eolo7WMKn6b65QO0V8nA1ATCyXVg0S3E1jWFAlzasGEWejWRlW0JZvNaD?=
 =?us-ascii?Q?TxQXiZlRfPE8FZWf0Qu/79G6UsbpNBYRi7uw12sHtJuJRA28M1vbhJNzZpXo?=
 =?us-ascii?Q?PSxxSA/leJJ0xrI41HiLcx+puhAeA/DQOwt9sIn6v75904LknSm4UpntiyUY?=
 =?us-ascii?Q?GTPrIegcUjbI9wxE2dyypHgIembg/0bb1vhGMzHkAIWypqzstP1Ycg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l4z6HxCdBIwqtz+VqAOExRvnpicuD8iYiSpoVmOp9s6kVzOdE05VosR3B2JM?=
 =?us-ascii?Q?dClLIHxT1p7HC/rjX3bHtz4CSNzo6uNF9VdPYZd83Uoadoz2CifcjWfor1id?=
 =?us-ascii?Q?za4CUP3+Q+zBmUgyaw39r+T8H9l8c2mTEWNp8GnHbJ5ou3sH0PqaaucTVMr9?=
 =?us-ascii?Q?H1FlNb/lHWbkORek2+AAw2qq4sfVnqeaOsmNAU8dsSVKnKSzzXs7UGSciphk?=
 =?us-ascii?Q?J/h3jiqoY0IFNY+txnMCLKVwjw7EFHGdkv+XRs8tmSTJf5F/JRf7EfT9/HbV?=
 =?us-ascii?Q?bRU9oo+Bj+i7POTkmy/sM77DhqGlNLa+SMhYiRBds3pHCL8XEsmdLpm7hb4x?=
 =?us-ascii?Q?zv/DeBOnlNBNSd+bDlbbnn86tKNHh+ThOF0bs989W8qcIc7Qeraiwea+k56k?=
 =?us-ascii?Q?SEB0ZanlSgyzCRIk8M76iqFURGY+VWgk8Amv8mEoNbiD21YO0iJDSzCefGC6?=
 =?us-ascii?Q?OXMd2kwvKaKTRCEGB7lANNoHYco9FlmnlEnSdSSySjXgfnWr5A5Bjvv3MxJG?=
 =?us-ascii?Q?nUtu25M4FbwO6byXQPwql94Zl6UV4iu6H550gdJILO3akd+ypA3t2zlYeSJf?=
 =?us-ascii?Q?hTPUE0CT1Twtud1J/PCKT24fd2Imh1cp+V2FsxswiZzr1v1D1rvFzbQ0R2v4?=
 =?us-ascii?Q?GtEPPlbnEXq7Q1TLo51lPSu53uhiFgJts9vaKRgdm6lt25ycEPh0wPhifKPg?=
 =?us-ascii?Q?lJk17XYSaiW8l1X9dcYd4sX453NoyyglQbTafHQ9vThBiFI3247etz0TB4Dl?=
 =?us-ascii?Q?OKN4OTFje8FuzoL3Z8bg80fcGNIePFfgnpKFKBd/1p2HcKw2XlJ3GtfinhMd?=
 =?us-ascii?Q?jjNZRb7T2IcFurrX1Zu3aw7VD2Kj+u1oID5bJwhksDsZY+28gg724sn7J3nD?=
 =?us-ascii?Q?5jasJ+bhRt53qH3L8/bFJUyhYnsYHJTdmxDVAoVcpTQEkjmXJDsvjgziAAJE?=
 =?us-ascii?Q?VzaReThvBnxTmS2D1Pbs4A8vdjb/4jGd28M9uyuMuTDUPNjnagigorHItxsa?=
 =?us-ascii?Q?8kGsOJ4dqREWiUX16d60ohnOBAVVj2g6zZLx0wpFRipcvgcOwVRq+9VWarnx?=
 =?us-ascii?Q?6diCwzCK89KjSG1dMfhRqr2hkttCqD5+8pn2JDKWl+m8hBh64PJiIRW0LssH?=
 =?us-ascii?Q?tJWDcZocX8lMpCPg+MZdKgknWwZDLA9BB6bShlSvLB5t+sByNi7Nmn3UL42v?=
 =?us-ascii?Q?e4EBElGkvMhkBI+h7bcyhQQzQI+cDFtta1gVHderc6jWNLp1cu1x1BRO8CBm?=
 =?us-ascii?Q?GIWH+n70vAjOQcIDMzGoIaqISJ0yszc1dpN1gUSuFtoK+JyMZs6xwz47tooV?=
 =?us-ascii?Q?9sr5wsFQKl/ulrBltHO8BA3BHNS44ChkfvPIsnBI/d1xYwwz6cdzQRwbz+G+?=
 =?us-ascii?Q?CyuieR5MWGNxbXo9eTdGYdtKxIAqsNqkNdja7BNOCUCDYKFDIRi/VPgiL2t+?=
 =?us-ascii?Q?SpZV6dGn94sl9MDAyaanI2Qo4WKOPKg3eM+dcIL2PRJdPu5Fo1bJM9q6+jzt?=
 =?us-ascii?Q?wFdcEdyT8PVT6Kw1pkJV2pQulu5V/A5EuAQWHU8ueX3c1Hd1dY0X40cF9Gso?=
 =?us-ascii?Q?gyQNnHaLttS5LjJb84iaAvOYrY/SGiEt4OHF3doPBA9FG4Puw4quSP3F5Zld?=
 =?us-ascii?Q?8fOCtuycNzm0jYET3HtoFQg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1d0896-ae7b-4827-47b9-08ddeac3db03
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:28:27.6112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mMkols50hUsTnDqywBlT/wpdyKxccLYm0/p8V6R8ueBTchvySeMQQsPnI72A4hYYewqXF7QvdgrMeRLf98r+0OPy8phCaA4eVZtf89bFyLix0Q7kEYID9l1FjXvQ+YT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14678

Dear All,

This patch series adds runtime PM support to the rz-dmac driver.
It also combines common code from rzg2l_cpg_assert() and rzg2l_cpg_deassert()
into a new __rzg2l_cpg_assert() helper to avoid code duplication,
and reworks __rzg2l_cpg_assert()/__rzv2h_cpg_assert() to return the state of
the assert/deassert operation.

Thanks & Regards,
Tommaso

v1->v2:
 - Rebased on top of next-20250903
 - Simplify polling condition and removed dev_warn() in __rzv2h_cpg_assert()
 - Simplify polling condition and removed dev_warn() in __rzg2l_cpg_assert()
 - Collected tags

Tommaso Merciai (5):
  clk: renesas: rzg2l: Simplify rzg2l_cpg_assert() and
    rzg2l_cpg_deassert()
  clk: renesas: rzg2l: Re-assert reset on deassert timeout
  clk: renesas: rzv2h: Re-assert reset on deassert timeout
  clk: renesas: rzv2h: Simplify polling condition in
    __rzv2h_cpg_assert()
  dmaengine: sh: rz-dmac: Add runtime PM support

 drivers/clk/renesas/rzg2l-cpg.c | 53 +++++++++++++-----------------
 drivers/clk/renesas/rzv2h-cpg.c | 13 ++++++--
 drivers/dma/sh/rz-dmac.c        | 57 +++++++++++++++++++++++++++++----
 3 files changed, 83 insertions(+), 40 deletions(-)

-- 
2.43.0


