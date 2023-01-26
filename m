Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7FDA67C2CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 03:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjAZC0c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 21:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjAZC0a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 21:26:30 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2137.outbound.protection.outlook.com [40.107.117.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A381F5B595
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 18:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDp82wLCFAXee4gNTzFntMLuaS68ny50etJ4ptYKz7uVTgt5f/mQb9BZ5ILR05aQlnP1LWI2beerF3jQfFAZq8nrSxs9tsQFJc4oLfT/ribfiaSGt/rZQxWAfM3WaaYYjqmv5REl4UwVhg3+hcTS1QjdIuqHo9poliQczrrDDTIykMrtNlZzxVnjYNgcTXNVc5Xj5+fw02KxkyVExv/iqDKbU9lZgr+5SAUbqpPuPcXuQeGmUz3i2g6fTIRA9aNm78xB8FWXCbAYI/Da5aJ3KLE3FBVcQSy1XqMyqu6iReByAQwh9YWEltxa+oQmu6owlpXSXSfy26zGfGOgXX4MBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9zc0XpZJyfDiU+1Ho8cZv37YsSehgQr9m4izl0R1AQ=;
 b=I0Z4V2A41isxgVxPY1Hie7tGhLxupS1L75zO2UwB8MwbPbjEKxgqa7+pBzs482pn4Og0eO9Jtvlrgf2ay+rTSz5ZZQf/ofFm/IB9uosGXuw0DM1hk0TnbKkd7hYSimQA+CWP0OqnREL0Oho/ImPEzVRDLV93tTrOcRHt5GlCCRhDA3NlEIAnPhXF5zr4puUjGyWNmCbbd0ceXCXZ/F4nMjQ12bGncv/D4Wy8jEbpn4fUMYyOG+hvP4yZu9nzeVsqWvfQQwThUHKDEM3PcVho7A3PQGfujFk8acYblvvCzNPUziWqrXERnmvDWf2B6NdOn6j37m8CdCmIRb5JtSQtyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9zc0XpZJyfDiU+1Ho8cZv37YsSehgQr9m4izl0R1AQ=;
 b=fm8aY9iTi0yA7fAxd9LL6ssO3norlzvHQJkPOjeiYOqLQhYwmweyHQ3s/kokUOi1qMU1/RYT0WIuAcArNSBc9XHRcJq+MWxDwY527N/gQqGdyEwGpQbjJrd8Nle+nius2o4Zj3vR5gtHC/OnbcG7ExP1eTmcQWsdg/XxO88HvZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11789.jpnprd01.prod.outlook.com (2603:1096:400:406::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 02:26:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 02:26:26 +0000
Message-ID: <87r0vit4j1.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/4] arm64: V4H Sound support
In-Reply-To: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 26 Jan 2023 02:26:26 +0000
X-ClientProxiedBy: TYCP286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11789:EE_
X-MS-Office365-Filtering-Correlation-Id: c55b93f7-ab97-49d8-d50c-08daff44b9e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bqLWjTj0SrODJ5ORJpNX1Ro3jM2VxbVWjrKWWlVz4NhFQT9E5RbmsSBFBH0U/xcPGkctXTYUVAc26EDNygIkpL9OGYErWy50jT0PRHNleV4X+5FxLJlXFTmDH0mdfWGwEIYwQ3zRB0NqXzbrr++V7hSy2UHlF0dwKouMdXSMU42/GM7haRIfZIcf9SFKmuKsbvWHWULOabPFlplSc1OLPwRQ006rmmAzwAKGFJd7SWlmDnDK55tnf+EeY84P+BNXVjoYBzyU4ZCZoqQMWJtkIlCUhA6PLZOrYXBh4H+OeeKiAYHW4fGOU1czhyhaFAJPpDzb56hWRrZoDJSZ/vnDExNB7HciRlFTz50V6+iQIOH3qlD9rmRoI0hpwE87JrotfbuRMNpFzPKloYJbaHKkRj6mxPLu0hSd56Fk9nuqnDbGMQexRzmisr96fNUHc9JXTVFLoaGtxkwhp2R70dD+dqWZdIgU83GcGYS78UyLigWSvSCSeAu9WSM5bmS/7kmIFkJPF3pgMeNHyMXasHh9DYazSl8VEqNCC35lklSmbN2ZX5UIX2mQVER0W2ilrZL9weUdIkWPVkVmPijhL3gaCs1NxnuW5ODgy3eQxdzVYb64OiRW7z8DZojhpgIp7cpo9YhborgL+Vdvj4QiIZBZ7HCHRqRw2y1bXroXo+2gh8tmSmpt3E9ON++oH+uakiou/weG6yZAcAhJ1c89EiUUeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199018)(41300700001)(66556008)(66946007)(8676002)(66476007)(83380400001)(4326008)(2906002)(36756003)(86362001)(38350700002)(38100700002)(5660300002)(8936002)(4744005)(26005)(186003)(478600001)(6486002)(52116002)(2616005)(316002)(6506007)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f88l6P15G2BALYOyPJZ2dWdUs1nvLUuIOqmcZy5ghIyDWWRi1LhdNHv7nZrz?=
 =?us-ascii?Q?7Dfb0boQuzsSrNvL61JIrdoJlC+raRHDxyohds7GNf2SY78LgO1foJnojGj4?=
 =?us-ascii?Q?gFcEXSNX9barGf0vx840hx6z6EKDvzWTXR///W85pPgjdXRZw1jzocOkgspW?=
 =?us-ascii?Q?ZwT4dNvFrk6JPUDRsKYFQOHVP/Y/zhGab3JLmgc6rA2HtqrRtHpps4O54Zs5?=
 =?us-ascii?Q?rmOA7mHh+EkUJH9ttmZCJdQ7MoXgjW9SC/54gAOr2fOHqs7JluDHMImUD1Xc?=
 =?us-ascii?Q?Dw7VrhdJaI6Bog/OJ8xdQydLoA+PlWsEjf77hjJFXuYVJSXH1SQUiiA1rpVE?=
 =?us-ascii?Q?3VRoYEIZPCufoVepMQqkdj5Na54ptIiI+VRtc0SyW/OMr/JbOkUa3o9bp1ec?=
 =?us-ascii?Q?v7FjFT95I8z9p5Ylvf7nNEkxRxxLWvpevYjEcd0A2EjjSYfkixxhRqpxD0mC?=
 =?us-ascii?Q?/TU2ebf28iLzEvjV5sj8Rl+w4PrMEunmlZGXc6vrRAp+oO8gM8dV6P+NkH+b?=
 =?us-ascii?Q?jmFQotmru1mASA3jBhoUXZepTo+FSs90ENrYwZOjFmSLWwFzKziey3Hw7TQj?=
 =?us-ascii?Q?v931G7g+yfM5KQDDxpmhh2IRnFqKREkUAcvZsfaOYo+kHD5H0gITpSZ2UEla?=
 =?us-ascii?Q?WXHRW04RdqFtFP7PPBEhmFLwZF/D8XzaYMJkIbp1ViW66J9NSb3HrkDxAm1y?=
 =?us-ascii?Q?Fobp2Yxn8GdvRVFroAg8bGj82it0m6X0HzfiREJ4EIWfhQ+oipcw0LCVcwut?=
 =?us-ascii?Q?iea8jZhGydAFq7ZdU7g2zIr9vEDFr3197IM/6a+PFbh2pMMPqFSwUbEDlv4l?=
 =?us-ascii?Q?/dGvEtIp5yrsEhXBaEfdOuUlufpCA9riy/ueC8a+TYq8dCMzJJ3UfEQ1hoyM?=
 =?us-ascii?Q?CHO68WZXtPnKNR01OspH2QUTFnouG6jI8nT4wNseBr1ooLHFDxXZRCO6ztev?=
 =?us-ascii?Q?M82Ry3Wl9z5vwoOb8RE2325joGxRooZzx9Dtv6toNaMUbTQggpR/3M8Ohv7W?=
 =?us-ascii?Q?E/rBUQjcO/V4L4CdkdiSXtb5qAZMJr3/OJ1jagzIdajNpSu8xiGtA4Dsmv4X?=
 =?us-ascii?Q?Jz1JTMDVGeynerI+wL51gCfPc2QXG10FVycQxsmyA0b/m+Kn51z7bW3Bg1V8?=
 =?us-ascii?Q?vsC6DPOYb3otLBfgXuLjZ7RJH0PAwTSOXXUdXn8Fu1B0FWBcMCBJyRF3bUez?=
 =?us-ascii?Q?mInHg37/4H0Nv9J4yhszaetIVkwJ3COcPWWePVXMMC9Au5jcPIj744oJKQrt?=
 =?us-ascii?Q?SA28jA3g7gTMgCWFIB9aycpKIkaBXHalTsU+NzbTna7Iv5FPHBiX77MR+6wJ?=
 =?us-ascii?Q?QGu9ChccL3p0ytzVc2aMZtsDD2OUKD2peF0B32NS3oxdJ3DquUPQVI6oOIR1?=
 =?us-ascii?Q?CND+NroM7CDkLdsuTw3AkgSkTY/92zySYUIoyBTiBg5vaw+Hso380gr/urVp?=
 =?us-ascii?Q?ohgP9rAMxuk+89pzycRCiFoEC2jZPRfqDGUwv66kcYxf6fyMCSGcKq9dAH5g?=
 =?us-ascii?Q?24sxe33Ldx1/pBuTc0kyCzOjKXZpc7k1Rmk8Hjkr80U0Q2b3YwQ5OjGEgFp+?=
 =?us-ascii?Q?wmL7vWxmOzcX/D+8yl5GhDZmx3evsEXt2QfHwfaSY5oS2yW07PubmxLv6FSn?=
 =?us-ascii?Q?cjXOTHQi9aWPIM0hPysb+dU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55b93f7-ab97-49d8-d50c-08daff44b9e5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 02:26:26.9146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYp/2w/KWK7OBBaa7ePnim5+K8IayzW46TgQGY1KrM5PymbBKySwoLZGk5TCXH/U/UxH0pkdQQcK6Bt2p79BBRl10P4bD02NPhLgYPjlg08DRKwKwU7pfgDo9GUemQhY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11789
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> This patch-set is for V4H Sound support.
> 
> Sound test on V4H needs Custom White Hawk and extra Sound board.
> Sound Driver Gen4 part is not yet tested, but SoC parts are OK,
> and these are for it.

It will indicate DT check warning, because V4H Sound support is not yet included.
Could you please drop [4/4] patch for now ? I will repost it, later.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
