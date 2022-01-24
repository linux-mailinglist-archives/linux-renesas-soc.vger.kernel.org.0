Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B5249772B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jan 2022 03:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240745AbiAXCMC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Jan 2022 21:12:02 -0500
Received: from mail-os0jpn01on2111.outbound.protection.outlook.com ([40.107.113.111]:11072
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240741AbiAXCMB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 21:12:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhkgevk5XcCPnj/ON1wGtPXJFgIHNW3ZIY3ZopZ8I5KwxL3oK7japOF3X8m/shxd0puCJ6ef+evuyQavV1extLB3nGIbbn9Iqjn8/uf3JW5LG+FrsUl3ZxrJwdcBit/Y07C5R5ZZHZGKbuMiOBPxpl7GdU6SK73EHu6n0iYIbvhezCLh+P2ZJ77ZcYovFo6t/6uJ9A31a7g5ujiGdzqeTMlqxm1+Ry5zI+TIUsnwn+SaOybEsdZ4YE5dvkkwY8Lfc0SzwVtdU3WghI/3DOt/+hbqyaqLyxqg5gI0Iu5af5+//KixGQJYC+9HsrCDCSx7886+XAwuh9v8UBtKh9XUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iJL/3s+Unnc99WFfN+H/z3/0COxCmlVT94zblfyNJo=;
 b=aWF+gOmtnqa/pohiMzdSvloQjUPjOKMrApnWgbD2jRnWc9l7Nz/nMRV7Auw4tIh++2gKhDQ6msYy71PFpdJRz0T5B2PGPIpZ7Z83aZbPl2QmwWhV9UdesLeSekDh2GmHICCGLzEcqPL/1NcxjoASlWHpv7ZjuKwarrfHoOXB3RenYTn239BSH5SFPBSSB9WUzx1PL0kC+hfDJUq6xZilYSR/3IA4NI9TeL/MC9Y5/S4ge7q3TfZAbAziupcWtksbRo4I4MyHcko5pLkC4wu0v7VEll8f6PnILoq1UEyiXHiN72vn+nv8qmb6uB74D9HDEFimDI3eXqa0g0olfBB4sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iJL/3s+Unnc99WFfN+H/z3/0COxCmlVT94zblfyNJo=;
 b=CfOueDl5MTd2/z6hkfpo2RWt1nN/dfOIe+LY6cawtyvIQT8Xvt/XJzS6cK0uvptI7RbicasKVwMJm8rbjMpG4SqK9VqdwhP7yRuKIH8P90aUXbXssbPpaTgO9Io8koefFlvSu2PkkqLIiAGSJEbCmLYqLYS00jcrFXxpa2iJTZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6657.jpnprd01.prod.outlook.com (2603:1096:604:10b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 02:11:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b1eb:2ee8:fb39:e48c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b1eb:2ee8:fb39:e48c%8]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 02:11:59 +0000
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/3] arm64: use Audio Graph Card2 on ULCB
Date:   Mon, 24 Jan 2022 11:11:39 +0900
Message-Id: <20220124021142.224592-1-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:404:a::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d1c13a6-e17a-4e8c-9619-08d9dedee6f8
X-MS-TrafficTypeDiagnostic: OS3PR01MB6657:EE_
X-Microsoft-Antispam-PRVS: <OS3PR01MB6657A6FFB2A8B80F75A42F30D45E9@OS3PR01MB6657.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YViFsB3y/MVIahqgQEzcogX0WQ3H7dtM+G3+Zol89tNatJggRLl902ZwE5yNUsU0/pAHe71op+hOMv+BKVjqVSKU/mg5RiKENYXXT46XRUtqGCY7+r37TnikLar1s+KsCxyCSwVCEtu+UH9B2dmztUavb3kOtS8/FryQ4w91eQ7N06ir+BhpX+/PWIc7VPtpD/64KBXgvjX+/fnmsPpb3u9UBJjxEmrZOirV/Co+fMVfAVYeoS8pNB0ok5Gimw64+z8x2LDOaUdVLRl2kdn0mRH7a/kzJxWhOdi6uuKL17m/c/IhmO+hEHLwYpXIflP6l0bcBU3LYwSqh79L+1/7Bev6oYG8WZd5KExR3LZDuGMgEBnztPoGd5mcvWlUgxxdG4Ezp/RnmVt/Sa2dXfeapYzTrEFvRNNXQqz9QwAIGA7xUbUKz7pIJ8w60gt+qSvhgZQkbTo/xqU02HtUvQ5GfRLIr0nnD7Hlt66EvtLYrVavXtgAwC9hRu5cS09hRMJDpBlY/e02jioBHaQHGoEEMrqFAtPuEg+x1YijXnIFk61nY9CFIuSRL8BvTyc/JP4VDOHhdcTqXa7iDXrUyuDI+7hoskB+ACkoUZDo4IAQc4bmZ3dN8bhxFZhTm042tciVZ6j/LRRZqR9M4einEd7vmx4VhgeoQJvzYbcqxLyT8sIXPDUuYUovyGHN8ae1+SSAP2IpVJBC71rpKjiwcALHZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2616005)(4744005)(5660300002)(36756003)(8936002)(38100700002)(66946007)(66556008)(8676002)(38350700002)(316002)(6506007)(4326008)(1076003)(107886003)(2906002)(52116002)(86362001)(103116003)(508600001)(6666004)(26005)(6486002)(66476007)(83380400001)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CDIm9kSqYcgOsMxCm31IFR3A9nn2PDrSyP0tBXqs9zRrSfqbr8iOhVY2dutb?=
 =?us-ascii?Q?TTptSKs5+SGpsOZniY4upLQ9sQak6qmz8rRsVNM1mWu/pZLhyjXbsX3NsyXY?=
 =?us-ascii?Q?o+wdAMeHz9HMulgfbEii3wb7FB3kkXDLf0XQR8h3C5KACh93k6UGF6Vo53iZ?=
 =?us-ascii?Q?snVR5bPE2uqInanLoblJ41ok4udoLMjXnV+YqjqVV69vLAwILMfJ18gKuvEA?=
 =?us-ascii?Q?kDN6NG7HUtrp27qeJmzqpCFSXE66/Xw3iiP87Za3YG13Ki2KThfOSxtNFEWS?=
 =?us-ascii?Q?WDd8nwX54hnbheqY4nPj21JiWZWpQittkDgx8Cezjd15Giq/AMdX4heOoXDE?=
 =?us-ascii?Q?mTs6ki/e6tHYMoAum/bQcSnpy9kkYTWT78vIQeIrOKLxH/U05xy3m3kNPmFf?=
 =?us-ascii?Q?aFuOWMb25eJ2aNEGzPlEaJ6ESUqqrw+3mKCdNfalGdloP500OV2UV8PvEMnY?=
 =?us-ascii?Q?i4queMyr4WTDlKLLeaCf9/tvI9VelbGqyhaeHYgX0TlBEuG3fhFMD5TzqztG?=
 =?us-ascii?Q?AE6ja7TZr7x6Vl2Jp1H1BUQa2MWHrBfYwNovrPAJuxA9AD5GOsO5dmkMEifc?=
 =?us-ascii?Q?K/+UpsuplXfJhFph/X524zaQ516eHqyAU2UpWVfsyuKcTrSqk+9nXJiCMLNX?=
 =?us-ascii?Q?ekB7ZDMVlGXtGduJF2B+ir2Whf83viO7AuS1VmSPy4SHRH1NwiJzju7DTSSV?=
 =?us-ascii?Q?I/YYLKIleGT9qhjTM2ShSoNg/3PgUYfcFRcRhOQOPO+lGXh7g9KpuHNKJe89?=
 =?us-ascii?Q?qkhompRIarf9kHxbKcMKyPPQyZv2a67RDPMu3vHdxa1b6w+1qU8r6wD1hYpI?=
 =?us-ascii?Q?qLKVjSne70msUeEmSdRhDsCiI46eS7E37owvLe+sLmI0RQk8bbXo17GQ9R8f?=
 =?us-ascii?Q?7QibXBL7xTOX3h8iOzDCKxgAWPntAHMSZMq6dQ4cmGHfMMNRj5AmoiQ26w3N?=
 =?us-ascii?Q?U5uziqkrlAV+MJLL236KjfXeltaIN8u4jfhp3OtT53DLeSRemO0uTfzIUhhy?=
 =?us-ascii?Q?EwHHvogn38lJyvbwbgiR24qKhq5lSLGZPVz2260j06W9HUsRon+7bl6iZJny?=
 =?us-ascii?Q?20h2RD17oglI1t2+rzpCWCFgiMin3dd9WEhqd2wFqsrBFZH8lL2A/4OtiVv8?=
 =?us-ascii?Q?oUMl+/A+blfStYnrX9zAYIMigwgXdgAaBUFFeNp+RFs7yfrbebxy08ZcsOxO?=
 =?us-ascii?Q?qu9x8Ep19jKEXK0FpDtGIu+Rzt7U7fstKj/ww7jznnyJsurhwLIs863M+jy4?=
 =?us-ascii?Q?bCdnPESlaH22Jk3ZeVBSLr9EoUaoXISYjclN334k+iNdMEkixTgg3ScRM6Ka?=
 =?us-ascii?Q?jfKnWC/fLe8rYycJUA9jeq0EkmhqSHo2hHuPLjuIbaj50cTeNLRCnDzIxuBp?=
 =?us-ascii?Q?UAHSuH87ThNEgR1+3x7wNEYW+rx843yEuw3oZ6LneSKLi5A4eRm5luIUnxzH?=
 =?us-ascii?Q?Q7Q2GWya/Z4WoSISoPVHk7HtYSP5N/na4kR75IEgtxjXALbAbYKuLPnOti1i?=
 =?us-ascii?Q?WgjY27cxSda8JFUl2VcpXzMsLHnjGNIxzr7r07Xon6t7GB7SMMKD6bKCRfWy?=
 =?us-ascii?Q?Dl8Ops3smjk4nV+nXVa90sVv0Q24RfKh7m6YOdV02zhxLNGj74FHg2AUAt3a?=
 =?us-ascii?Q?uMk+prCWGOars00Md7vl05zpF971FD3JXG5Dzzu2N+bw9VpsW9uPgWd5D8m8?=
 =?us-ascii?Q?DOp/jp2kfV0Rr2tFfy0ZMkedZTpc6vhyrP/bDdODR9ts65q160jh2oHCIlfI?=
 =?us-ascii?Q?4sDGZ5BqWg=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1c13a6-e17a-4e8c-9619-08d9dedee6f8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 02:11:59.0042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfEKQ3+8ORpxeS1J+OjoISMUKoBzhNCB9Wz4/gSMGLkgBRGnDPoJfEYlXzrI/Lfb646F0EPWQkA30LICgh/H0ICmJQOukEoj8P0SoH3tc2JB0kiHxxSFkShQ3n5n1das
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6657
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert

ALSA SoC has now new Audio Graph Card2 driver which can handle
sound card more flexible.
These patches enable and use it for ULCB board.

I'm thinking not update non-ULCB boards, because I want to know
both Card and Card2 behavior on upstream kernel.

	Check "Audio Graph Card2" behavior on ULCB,
	Check "Audio Graph Card"  behavior on other boards.

1 updates ULCB DT
2 updates ARM64 defconfig
3 updates renesas_defconfig

Kuninori Morimoto (3):
  1) arm64: dts: renesas: ulcb/ulcb-kf: switch to use audio-graph-card2 for sound
  2) arm64: defconfig: Enable Audio Graph Card2 driver
  3) arm64: renesas: defconfig: Enable Audio Graph Card2 driver

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 22 ++++++++--------------
 arch/arm64/boot/dts/renesas/ulcb.dtsi    | 20 +++++++-------------
 arch/arm64/configs/defconfig             |  1 +
 arch/arm64/configs/renesas_defconfig     |  1 +
 4 files changed, 17 insertions(+), 27 deletions(-)

-- 
2.25.1

