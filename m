Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6165376A522
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 01:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjGaXuL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 19:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbjGaXuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 19:50:01 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63FA1FD2;
        Mon, 31 Jul 2023 16:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8dT3ZlQ2XKgFyZO86iOUqwRw8P5o97OZBtewTMVq7tygoQ7bLOK2Avwtm3BTqfNJJG4JygDmRjHF0dzbqyhsW5IB3qS4vQ2jyJnAQ0jcu5xS9IzwjPH6tfKv/6QpwjKToufxeDNq2El7+Wq8M+cXsyvRnAwEM6QBpaXfLnIm+M9JMr7sraPbZolYxGtZ0pwz/pBPfMssqv4ON1lxvggBK9fS/M9Z5OI7UCO00Wh2DX0Mrn7lPsaGwh5h+yGmi2jt5UgJHkFeicDbuhP3Mu8U+8ce/Opz4aePAynKSQjG+fogcyw9gMF1VPc2GdzTKfVVhQXwaHFlHv6rnqD4bUzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOjt1qgd5Vqr9Q7N3PmwMyKHVhkoXYDPKBLEEQx8IyE=;
 b=b22Rr3/RL99AZuMzXAdcKu0EYRPd5gelyiOKUb2CRyvasy19kEjCytug5gYdojZlxEuOP234mT/ILLI4m7Cfn2E8uWuLIWqxuiZ1fzb76IA3wR4gKglkS52JIM6727PAs8GglXbMuUlXizvMExXwmPNkKTkdWF5Rgm1FBzV8e+IDoRCCnxVviDUJXZybpG5FUwvzzDyEDYLhfT4y4EZJS7Inuymamm0b+qn4nCIkhdAnxVsOGM5ssJD/npc4CSKpns0JBbM5Tw18AC7DqJxNW7guomKDsaruojhVOIJOJNx1w5LE9aHoFy7d9OaWiBE3KbCw9yOzZyjimnlhYEbbgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOjt1qgd5Vqr9Q7N3PmwMyKHVhkoXYDPKBLEEQx8IyE=;
 b=ASxQY8/RnWgw/vgPssociT8yyOsEajqRdowMzTqjj3olcu1ikGgMsTalb4mVMDzzW2YXmuTHZG3aF9RZDUdOJxn5Ud60NzJ0quaGzC06L+6I0Xqv3eZbXd/SOYRGetS50caYJHXjcMHYG+/XTZWMFWlihK1QdTNqXGpArV+Ilvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11995.jpnprd01.prod.outlook.com (2603:1096:400:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 23:49:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:49:50 +0000
Message-ID: <87leevproh.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/9] clk: renesas: r8a774b1: add 922 ADG
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
In-Reply-To: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 31 Jul 2023 23:49:50 +0000
X-ClientProxiedBy: TYAPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:404:28::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11995:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d72298-55a3-487d-f08e-08db9220d483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CI+dHx+3lJEKNGgjEBcH0NdIIge7QNv8daS8jj590b1wiSUVynn1KHFC3kLezJcWAxAvHqvE/49b04tOTll7D6x7mcZOWAQQnshEf7DhAGVCxp9lcu1IlNFNZjxtxjEFVDjz9KohBKfiF10zYIV1l7aKHR7coqDRmW8/GiRI20NNHOcrb7Rtn+19mCdjao4Bi2RXxHxIVyTXmZNJmBAuh5hC2kvyF6x3v0YQac5Ovli4qG++OehGQ5Uxa4W6cQalzEorDcMBdlZU5MEPaJTh6DxcwUUF7KOZvU0ShjYrsAISVDphT6fdBjmxTJH5jadGxk5lVqe++U0w8VZaqIcaDJDsGqOfBmrrIWSMZQCMVlg3PNYXIdnqxtOATn/2KqShxT6ML4kM105fC3FWgGfwqTQqYvy407mOoKFZyXMmA7r2oekqIf7lvmzZy/Oq5si3eVqXWUsDHXHZOukeGqlr8HdtuFeV3MEc8nv/3HBfEwdolIhBmLixlnD45YHgYmwILPoHEXWb+NAh06rwALlg8vO7A57SisqM8eScRtE9ydVyRUUTm29aOOJKl/goRtU3/ZgrWFv+FoKHegnjKyGG4KBXziTe3MB1L7rUtLZrNTiTKINiISxX6wPNsjT5iLIQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(478600001)(6486002)(6512007)(52116002)(66476007)(41300700001)(26005)(6506007)(186003)(2616005)(316002)(66556008)(2906002)(5660300002)(66946007)(8936002)(8676002)(38350700002)(4744005)(86362001)(36756003)(38100700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e00HHI4zIg7O/YcdC/neI1ZfPqxPUgbeE98vtjArw3i+TrDBfw/teF2QylpG?=
 =?us-ascii?Q?k/EytZxf7jwtn5XjBPIoKGLnyGhddRWwCCZFiQFZOGeGOiRrgthN1ssMTI8E?=
 =?us-ascii?Q?dijGB5W6IqvIoB2wVaPAW3jJ9aSJ4r0UkezWtQZgx1VF3g8wLwRMfRNi7CMl?=
 =?us-ascii?Q?JoyH4XPLGbAQIu00jbv8Yijlto5BHOKQtzj+1rGki7v1VDfY+6h9ltuS0ghj?=
 =?us-ascii?Q?hMIcQFzYz/gLW/4uKzw1AiROdWPfZ/td7fDXofdA3oNWrVeYH54qz6d3mfxJ?=
 =?us-ascii?Q?RPitW5g0pU67gVp/cFmigHRNVleFRyGAfl37OCiHEHdp7PeVtcWE7VgpZWdB?=
 =?us-ascii?Q?ERXJYYxQv6MiZbJA655GR5KrNRMhCj3F11o764d3W/mBwHWzrLzRkpFc/969?=
 =?us-ascii?Q?DyhlYpnYnzeFGe+PIt2eV5JrwGljtzE9MhCRmzlhYC68uNFysuHJgE0NDBPb?=
 =?us-ascii?Q?tXvvEQ+IEgcA8z4qkKnnMPSVTbjUrZyWLH9Tjj8hsdXnKzi8mKUF3RlyPh8V?=
 =?us-ascii?Q?D8mMCmEFU2pTGGzquJNbno0OT6R7xxL4tKWhg8TlvXaHbJT2qtL5ETS2vDgx?=
 =?us-ascii?Q?ovI1ldOa//wyFLJVtUTh2LduFlNJwvc/UmLfJUQEWPgvvID8YHJwx2R2MP7b?=
 =?us-ascii?Q?hmBijvRponH8GKGuz0/pB5NLAHWm1/CgNftkMemhgmcMW9QJ+l54CeQ34bfy?=
 =?us-ascii?Q?BIpA6GaTGQUp7MKcm/aHUhqPC7YTtXocgpyyYSDiEHX/qOuFzVIgA5PDQNr5?=
 =?us-ascii?Q?GI0HZ3uIwgBetNnEBRCz8C4SM0OYs1H8aImtQLc7ui7kqYNRkU/F6Qp0w9Tm?=
 =?us-ascii?Q?xuf3QrkiQlDMluZrtKUoKUtutyOdk5Cx4B045Z8PNh6rmVzm8XhdGVYriZpQ?=
 =?us-ascii?Q?YK9NioQ9K0T6j+T4rF7MYVK8NXCfgxKbwJXIeEvTjUYXzalj4KmmURYiyV3I?=
 =?us-ascii?Q?nybroqe9NkQJqHLR94Sd2cGOyNw4Xnv8TDGvQi9q1mOZK3q8Ev5FedVPHQEI?=
 =?us-ascii?Q?irNf58vhAD3Hd55Py8cxeai0w7OBrBVC4Oop2pdkGYcrxA8N76huceMwJEi2?=
 =?us-ascii?Q?dM+rDIYXcY6MkvyU9y/ZpBOO/hVoSAS/31qEveXvR2KEuSgW6+7KxN6c7mZ4?=
 =?us-ascii?Q?U6IpWHZCIYI1e+S2KhvzwsIw/w32xGUPdtCjXKYp+7/Pw0RSV5GBRzgUoOY2?=
 =?us-ascii?Q?dzcI5nfDsi8j5a8fDHLqvdBCgpqtXPEYeQoUHg6WJUv4uV1DDHWnNabOiUZE?=
 =?us-ascii?Q?emFAH6Z77+8SB50iGwVoOa4+ws6qbadGEqyU0CGWsHimGhVLRQFUDkfTpPeE?=
 =?us-ascii?Q?sOdIMbrGdW0JMtygf0DRjGGrnsvVPMlwiSdIYN0cN/AGsYlvfvWos/XE2ax3?=
 =?us-ascii?Q?QkvKqTSO8WsIVxxwmU4Hw59bN07kM702Hi+SiBADkWjkBOq++K0k5ljGof4k?=
 =?us-ascii?Q?mgnYRXZryFK0Awn3jlirQN3fuY2XMFsf2R48Rto52VYxssQRvUYpMZgmHIYo?=
 =?us-ascii?Q?XaWeCVWaSX7CbLzBiAmxgWetFzSaaSAwrBZhuXF1HdEh4/bsPnKx4pUkdtJf?=
 =?us-ascii?Q?VbxlDG+y7aA5bD9BdVzQedhI3yR7MgtoOsiiEJuVC3tKHN78nso6mbj0rBtw?=
 =?us-ascii?Q?5Y0SBxKj8efiW5VyeiF/25c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d72298-55a3-487d-f08e-08db9220d483
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:49:50.8435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6NFrZ1fmcOTVFHyDhIFUe4FQbTDF7oX6NwYewllyowd0xHwIu/e54C9p9X/YlyiCBCP/i893TcT+YHwbOt3vM1E7z+bzJAslA7N1O2Ufl8on3qsc+ktRY4PAZ0yiYAm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11995
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Sound needs to enable "ADG" on RMSTPCR9/SMSTPCR9 22bit to use
clk_i which came from internal S0D4. This patch adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a774b1-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a774b1-cpg-mssr.c b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
index ab087b02ef90..60ae4df7f033 100644
--- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
@@ -209,6 +209,7 @@ static const struct mssr_mod_clk r8a774b1_mod_clks[] __initconst = {
 	DEF_MOD("rpc-if",		 917,	R8A774B1_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A774B1_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A774B1_CLK_S0D6),
+	DEF_MOD("adg",			 922,	R8A774B1_CLK_S0D4),
 	DEF_MOD("iic-pmic",		 926,	R8A774B1_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A774B1_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A774B1_CLK_S0D6),
-- 
2.25.1

