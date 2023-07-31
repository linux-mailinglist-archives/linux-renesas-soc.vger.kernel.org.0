Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C851176A500
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 01:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbjGaXtU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 19:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjGaXtU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 19:49:20 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2115.outbound.protection.outlook.com [40.107.114.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A284310CA;
        Mon, 31 Jul 2023 16:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E32DkSCDZs361RXjtf0aLK0rKgdB2YV+5OU0xPsmAvOzW5AmsrIJkwqvNqLqR4OEC9+oj38f0l7pMTjXc+EDqknCPULZrif/hq5L+MVdeo6W4CNcejquV0k2YgsEkpemd4CW5LNDA0NB+RhZXxId7p3btwPZVKHdr/oNQm7z1VWtUkGNHveuZnsXagcNaFiEYOAh6eTTAt5CnhOMgh3iUzvpD9Jm9S5aW4fHKftfPL2A1Y4S/8AK5xTa/rqswA7B2YoZMIShvV35Xs0AB0QjFBckTZrwLR4+PeTsCEgOs2I5ru7P7Q1qTeniC+TwW0fD9JP2+ZR6425fxAdcc1mytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryQsomgTzmwvSq+/AiPv3JWiBHslErf7/wSrdRlp1+Q=;
 b=kMiM0pNxJfVdEY+QY4VodKcQbtJ4zuz2hxYlnf4w5li0Q8Zs7wCiMvIG7FXr/phZtOTB9zF/dJ18gmqoVFtiVv+E9TQN7QYyrOts1XNk3+agoKoFzqjU5k3lPxVNTedNUWqioe09Ys6wzeIL1LlqCid2/98KwvKvoaK3ompSz755DiZDkR5xEDRRslaB6gEZocIvmhCHdCjwXU8VeBtr1F9jd71auga/s//B5XGwEFGyQhy3r76x6WnNXQduA+ueYyUme21C85eQJ1Jn4+1J9l19LA1Hg7buDDEWrdi3tbKAU5E230N0r22ZemTqr0PiQFK1ihEmMK3jFVsyeZ5Lzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryQsomgTzmwvSq+/AiPv3JWiBHslErf7/wSrdRlp1+Q=;
 b=hQgRrd6deWKHCfA26E6+8ePh6CVIyzuzLwJfwMBqJtpSjPH4ukBa6/D98FZb9s+NFBmbqHG+4Op4zUbIBy3GHX1i4PsfsHVOR5kKQzkBt76LdAjKqPixqd16jBIAsDvFBDJUwJE0ShBxf4MaDqS8+up8X5EXlsv1+/JmBWURdmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11995.jpnprd01.prod.outlook.com (2603:1096:400:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 23:49:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:49:15 +0000
Message-ID: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/9] clk: renesas: add 922 ADG bit
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 31 Jul 2023 23:49:15 +0000
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11995:EE_
X-MS-Office365-Filtering-Correlation-Id: 6405d8b4-2e18-4e11-eff6-08db9220bfa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ho8+mogPoG6y0dGxJpD8g80WRpG4Q3LTcbsWKEu7ry02saeXoqIdKg+UP9AGRN7vgazGI+lL/pHLQm2HBC9gsn7KPiMUiv1Gm27Pd1wPC631isgfvr7kEYmDw0FAQ2uLEwxhyLAZW5PVF7Q0pBPUvOXfMKt6c9cEpPJHNgfbwwrgRSlV2wIuALVaP6N4hCxW5GRF33DcIJVyFg1RJk4ZRdx5IeMb31XhbbWLxgykcCrNrAqzOmV3Y9c/cDo1b1DpH0MfMURMlvsGMo80pWiqXBmQEn/+YV9EONgQ+zacYXlWzw1EhePmMbw1Er862kQqdtrof7Z2Xz0hpNml1+EC2mnpjmYjkFppi/NSUza2MFGfptFbrf/wO9NH6sAXjhlVZbFj0SRG6BrQAeO8qANKN/uoijqkwA4VdhHQEUJOC3chy3OzdJPy//cah/v0y28TvyBO7bRRPN8ujD4IlS7ZdT1n+tgUy1+K77lRRWDbgrA8pdoZsuE02DlXdghO/YVZJNhCqxsiirRbp3gIKijknfzu18CVLzHjMGrY80/pjIF/tlbcJ7MXAIxe0kzxxxeKCOs8s5aBxKrURkTZbIKhEbMGsNguikH914VTUX6J89FTF974aO/Zi7L8K3hJw/k
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(478600001)(6486002)(6512007)(52116002)(66476007)(41300700001)(26005)(6506007)(186003)(2616005)(316002)(66556008)(2906002)(5660300002)(66946007)(8936002)(8676002)(38350700002)(86362001)(36756003)(83380400001)(38100700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RziNc1fYvCt3ZuCX/t1q1lz2HwEzNHmSISzyOzL8SRW8wfZau0F4OZXlWHla?=
 =?us-ascii?Q?ecXsPSHu30P9zChFZysvnVs3Bqupn33PCVI3M9vPrb82RVdLa5pxhINbAdKO?=
 =?us-ascii?Q?tsLe+pLT+rM4iLjcIiGRq9EZc8gPbvhRtrs+FKBB3f1DYkdOxEvSJ7+ytUrY?=
 =?us-ascii?Q?bZZU1dMDSyMKyUUoBtV4EG4+SKZ5a5/MhQjvEDxzWZzz6jxP0gY6Q8JlHr0q?=
 =?us-ascii?Q?4A4kwocwnjpdaHgxaArYF8t0f+IAtySPe1shfqnu7qJg5h3mhCP36fm9EoP2?=
 =?us-ascii?Q?vLcMkTEP1hlZoLob8zLwmpnP+7lWzRabveNvJLqhnX08Lk8B5Cw+RV4LrruX?=
 =?us-ascii?Q?7CARWQixO5Faj9R1/ejEQlYdIOOQ6D3uAfltSZIVRXmWdjvE2OuxiYMJJ8+K?=
 =?us-ascii?Q?WyM0lFHcChJfNtYIFpmeHOI6Xlgc9lCMaTktW3BWgldWDihplP8cHyjSUc9q?=
 =?us-ascii?Q?itzF7x5Sboy8+qz40eZLQ2ZNAZtPXSEJL576Fp4Bh/qHVskN0ANdSA5w925W?=
 =?us-ascii?Q?CCRL1Xv+tGzb4+xPCXSxxhcehuKjLY1wWnmWsfC36lBRpnwTCuPp4fzSv1/j?=
 =?us-ascii?Q?li95edO1uQEJquCRtldQ9KzrjZYqZTIJslGDmCSFfUC+27ozYoPOxd+qzggO?=
 =?us-ascii?Q?h0+0rwXwwyDB1Zf7CLuoIRN4gvtqsMReXtQiPX6FR6oM1JZMObDX08wOaPVN?=
 =?us-ascii?Q?A10gYHJmW/jnpdtUfqJJVL0PAnOnZTVDC9vxQHS7z57tpNelolKOQV0lnphz?=
 =?us-ascii?Q?daLHeoRIScxtGQxCNq1iI9EmdSL2iGPpuN8hIwZ6GGYsNKyEOxs6iyoSXCIr?=
 =?us-ascii?Q?DsFkAMqswFG+lzNCPQNXyG7LZ3sLxXxw7LDWqk47jScsn6lYrl9uk+2yEFeN?=
 =?us-ascii?Q?ffIsQKpWa3n0TCNtg6IRsxaXijDFVwMAKyP2n+34CadFHLGSrGt3QjlQmNzS?=
 =?us-ascii?Q?0Mk8n+yYsCqgNf+A1NJ8xk9HD/0CmfQoVeN7k+6CrMPrB022gxTLXUWrE3Iq?=
 =?us-ascii?Q?pLlAVF4w7pHJ5gowqCo1lpv4AHptM3iiSlNgx7zN8Pd8sBcn7uDodaknrdLE?=
 =?us-ascii?Q?KwlMFBKFe8D5KwZ+JC2Mz/P+bf49nHDjXMu/9Q3LFoMICt9TdY7RV/46M1Sl?=
 =?us-ascii?Q?+5CY7Cfkr+n6a8khXvIt9KSJw5F1ak4fVrt20DTp3Or9Mfn5vDaArpnj3vxl?=
 =?us-ascii?Q?N66DTSq7FZxYpQ58cavDM2zTl0QwlyrbndeGuXFE79htICCkXJTyBDA0gBHd?=
 =?us-ascii?Q?vzGy+BWUkN8Eb8ojTHx0vV9i9khcglG5KWP8nRDp/N7/eLjUpHLZqHr6XM10?=
 =?us-ascii?Q?67wTiOai1L8aiqytPjWg4l+IEi3JUsUktC9lumS5ZD5p2Anni9YyRnQkFuxp?=
 =?us-ascii?Q?n4gBs8NLjJStKvf6lWLPSH29hk0Ae5bCpuwh9pCEB0cekAqssYESjyBzF6ra?=
 =?us-ascii?Q?b7G3ikJE0j6GzlxuTifUefWBKgfiwiYquKgbVVtZ8lIqW21+J0emLB0xPJKz?=
 =?us-ascii?Q?1/pfxnR7HZ7gzTFPt+V3wdNvj3rJI4Puarv+cmKmz1TNnBQw0sZ0jC87tUfJ?=
 =?us-ascii?Q?ux0eyscSOCMFtsqXGXLUYH6lgqsQzZnb/WBqsWvyOYNmRBX7cs5pa1/fzVok?=
 =?us-ascii?Q?POTp6Dy1Wk5MGFtTTm1fSzY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6405d8b4-2e18-4e11-eff6-08db9220bfa5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:49:15.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Jf7Izg6nZ5nGLYUiWOMtEWTRrfyVqqUcOHlTzxyxgRFI47KyExAJB8FR+ykZjSBiEBlUrIYtndKm+OhZ6JcY+Aj9h3fFdWSayf9h6N74+YzRiLlEyzjgX/uLCg5WRow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11995
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

Renesas Sound is possible to use internal clock
(we have never use it before).
In such case, we need to enable both S0D4/ZA2 and ADG on Gen3,
and we are missing later bit.
This patch-set add missing 922 ADG bit on each Gen3 clock driver.
I will post DT patch to use it if these were accepted.

Kuninori Morimoto (9):
  clk: renesas: r8a7795: add 922 ADG
  clk: renesas: r8a7796: add 922 ADG
  clk: renesas: r8a774a1: add 922 ADG
  clk: renesas: r8a774b1: add 922 ADG
  clk: renesas: r8a774c0: add 922 ADG
  clk: renesas: r8a774e1: add 922 ADG
  clk: renesas: r8a77965: add 922 ADG
  clk: renesas: r8a77990: add 922 ADG
  clk: renesas: r8a77995: add 922 ADG

 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a774b1-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a774e1-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 1 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 1 +
 9 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.25.1

