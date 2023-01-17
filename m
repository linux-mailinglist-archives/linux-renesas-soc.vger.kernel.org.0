Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 986FD670E78
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jan 2023 01:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjARAPJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Jan 2023 19:15:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjARAOo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2023 19:14:44 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2072a.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D12CFD1F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 15:32:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx1Dglr3k14MwioWHTyutsWdJm/DIyDMZMKpPownCZzkJTHBzXYwgCDTlrpO278JTV580FsTbXwW4f7/1kZcWXoefJJAoSQOF/MVBf2ktwYalO0CNIP7XnhbHDM2FtbESUpNKg3TYyHI8M9V7K5FZW8N1cdbt/V3bRCh+Xmt7ryL8adg15CNpe5qhbg53eIRkXPSfSV6kjfDb3dLdnwLg2AHPCwV3WbJJgBmiuSOnXV6ynFvzyHol7kAi3pMatsT6sqKzzJqPt27/WZZ5QHH5G81AScW0VV5V6Ji1saweqKFcvMGEwYAtIkBC1cHCiWCzRw2Fq21CWg5yBbc5Llo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSTJ7A6UP0V9FBKM/0PhtI1eYNqSHrM5SeDqKEiCtuQ=;
 b=O64khMkjzPkOq8ZVSteuKoThi6gkC5fhwTFVduUnJH4b7yZh2AppgBXkVb7rBkxNOG2sRa7sbWyhJKFHhh0MioqKITACKRU2Er+whrGUuykABFrWwyvCsIU+tljYHfKjCzW9vXmkiOIRwsiZOddXES2Me9J1iCdXWq/z/FyS1d8dH2nluB2mbB6LduWFtE4KgmFhLouA710aQpaLBuIzCEq6V/eo18rGnGefg9jYgJsphHYckFdyy+v+a96GbpfFySSUf5zkRupXs0AR0ClSxmn8Lihjjig4lbw4KxNIF4gjDVuuE92x1ndctjUhBvuKvhuu9gNVyt+Eka8wJTZ5lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSTJ7A6UP0V9FBKM/0PhtI1eYNqSHrM5SeDqKEiCtuQ=;
 b=lDwbrwonM2ZlR1aq3ql2bsQvcyUeVanZUnhqynMJsnMbXXHOJ3Wn528KlkVg0bz4kSv9JC6aGoypGOXZcP+pPvJx4yn4KAh+0MAHG9OGJGrSJZejKTxQRqPJVM9ew5+TmwnS2CqFH0YIMQ/AeOgFZJ2MypbW/K3ORaclAxAqF9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10888.jpnprd01.prod.outlook.com (2603:1096:400:26e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 23:31:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 23:31:39 +0000
Date:   Wed, 18 Jan 2023 08:31:38 +0900
Message-ID: <873588d9gl.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
In-Reply-To: <CAMuHMdWuzu3EpmFQM9CnVYMz6At715qarXj5=EX+JU-OxmDLiQ@mail.gmail.com>
References: <CAMuHMdWuzu3EpmFQM9CnVYMz6At715qarXj5=EX+JU-OxmDLiQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCP286CA0171.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10888:EE_
X-MS-Office365-Filtering-Correlation-Id: 269e1dd9-5a69-49ad-9d51-08daf8e2fbc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uz56E6VVhOAICxKMq2dTzLvfhqSyQQpAcPZW/SJXNTUudgbO7zuEu+oJeOHz7tipSUcZRINZyh+0kEu96uzFsz3xvu1ib9SfcY20BC9Q1qX/PpLcIFRRR8wS6xh4XXf8pc+7IiLLs8Mf2nz7ZWt61hLbsaBjEzFEp191YW79GjKPW2RaE4/M3GHlVsVvSz/pDEC1w+lp0CKTQQXZw5HdFQjpFzeAvsMMz7SmdnfUjPW9QdlsaIOGQ2H8mcQx66Ki0aVGZqh1iqtG/Onxzyqh6rv7tuQkAGlLOjOHiwApxD3ZOJHbfzbNL6sknretu51KqxY31vZsZpH7jqcw0Ey++7hcNwloRPIbaswBAnoMliSPTw6C1kWdUk6CzznFF0fER7NSvQ4bp1ZCqPbPhXHE+ddppxs4uhqopZ8E3tFdGCrrnv9wPSQA1R/R/jpD1zlt2qU7Dxxn8RpDRR8EWC+kF+76aKmRk+3mdh21P3EkjbxDnq5e87/ZU+F7DjglBwnKC4XMTu0DQiUAtowm2jv2NyTdwXplmuEEEIKczvoTfSATfHU3Ok7ew5TOQc05pgJkA5CmBAEE6pLtSZ+mavtJhNMI8oGl1S683zvvzg+D4I/d/DvIjsbA9JXhLVu9aafn34v9vvL8QcrW3YDkfhGJFadBLAAuhjXX+y1KGNAj8XJEZX9cEEZAeu0sHQB3AMnfs5iFQ76HlbPpaN41Bj4peQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199015)(36756003)(86362001)(8676002)(8936002)(66556008)(66946007)(66476007)(5660300002)(2906002)(38350700002)(38100700002)(558084003)(478600001)(52116002)(6486002)(316002)(110136005)(41300700001)(2616005)(26005)(6512007)(186003)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M3JslIAaA0oud05kRmYCabXFH9gOjfVc/IPBsabEF2O+9XsTqWLFnZAtmRF+?=
 =?us-ascii?Q?+iqoa9tXyYwjCfUOzqlvIc1t1ob8NpGBCDznddR2MHpNis3Z/iCHqfuqNZuM?=
 =?us-ascii?Q?sgEcs12jkA8SMWikuqX01OsmVsadH/cch+v1sInbYkUn5Eyc6k+jl7QpSCM4?=
 =?us-ascii?Q?5qvZ08XZAtQmMT+yRbH4vp1Tqklct18rlMuOQ7r2yeIXJeCdb2UoD72mhzQI?=
 =?us-ascii?Q?0r533SctJwUyJ2snQkeMkz480UHo4Cqn8KXZ6OGcQ5jePR1fAhdDG3FiE3sO?=
 =?us-ascii?Q?gNcs2M0P3H58XYr+ADk0QVCzReVY65JAaXXc8nLI6/yaDaaKEConAr4P4syx?=
 =?us-ascii?Q?N4LxMj/wWw3W6NE1nncUFy8tWD0P9BZSWHK/rt7Q9sdOCsmz1OHtvHJLf6dv?=
 =?us-ascii?Q?izjbyCI3xVwQucENgcqmDpqJjD/h+wu1BFX20NgNgIgbvnh40PVy1ayNonj9?=
 =?us-ascii?Q?Sk0UgId081yAhNkJgWCcKiMFir1BXg28sVJbjLPLzOOYNeRsjp8/sYanqtzn?=
 =?us-ascii?Q?VhcRa75RP2vTknGtjmJ1OCZInbrr/WlOYTkbtTEdMHUWz0WHP/e4W1e42nrA?=
 =?us-ascii?Q?uGjVsjSklpufza62AQjalu3fPqIZuCJmwmTF2rV2Kabt/ifouD1evzBBZqc8?=
 =?us-ascii?Q?MTmgGqIS2no1VPlXaWKSPtB8/AzfxvdKhbciZEEeSqihsBEoUHp6rkWbhL/K?=
 =?us-ascii?Q?WCfTVSmuoYEz6VQFpEo8Qou9YuHmI3RVMXa3ENMDn/WemdcsH4DW/mswjiuP?=
 =?us-ascii?Q?ee0LeiZvrfQn991L3hGombBznLuII41XNcz1IyCmx+04YNng4of3Vckg930s?=
 =?us-ascii?Q?DjiLtKlxc6RCkdjF957YEiRpOXscaPsZ5QUWpLee4c0o3EmZhsP4SGSCkyNY?=
 =?us-ascii?Q?2eMJhfGyGEGG5tsgYES44jYZsDlR8CWlqUxlsLOOjCO+U6z1RkeCDz6f1uQf?=
 =?us-ascii?Q?SbcmLfJFyPgA8GowiSwuCuyMYvEbN/H/mAse4WsUEbSGnVkqI/PSUDNqa+1U?=
 =?us-ascii?Q?fBuf0Nr7Z+LRCZ/ytLQoEHKdjFGQnXvMAhwvhQXVPoo/sqp7eB0G3bkIUfyr?=
 =?us-ascii?Q?dtDdgRRjhZOWaNNkU6JISB0I7mAupPKE8L4371IFE7u8Mn4i5mHzoLNBUf9P?=
 =?us-ascii?Q?U+F2Tx0wFscnnfno5otbZXgRGw/22VcS2sOpILdV5Rl4rLZxPaD0RMfp52dY?=
 =?us-ascii?Q?6IY7n81UtES6ip8pyrYdh0crpJJcSAF+HVUwdVwhdZ6uZRqzFpYyDwJgbbjA?=
 =?us-ascii?Q?b7Tpgt6dUvJ3mg6r2MQui/v856swgwAc3MPIep8jLaT0MNTgIOL4REgclMCy?=
 =?us-ascii?Q?G/kg3dy96GtfDIGGu/iKgelR9qWaiATrjF8jKco4Oqetdrd++NCEWIFXXu7h?=
 =?us-ascii?Q?DkA7p18b4R4ySdGPaTUUJK7qu4+BL598/VtVCWx16aekeH/lx6fqR+1dshwb?=
 =?us-ascii?Q?8RI1jp1mz3Fa2LIjmHw7iPRj0WOl8Quym8KBMBFJNdKTRKvRlHMXBrGDr3Kp?=
 =?us-ascii?Q?iqknJSA2pVQkhI5eDEc/K6cxbMJXnwX2sLUNgoUrSVh9EhTvITE2vGYREGRm?=
 =?us-ascii?Q?N/klTd07f7fZKUhup2r3PekfpNAd1WBY4piIwSh5yibOP2WtOzIpcPVbi+HR?=
 =?us-ascii?Q?+1fbH8+sa1YH1ADe+/BOvpk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269e1dd9-5a69-49ad-9d51-08daf8e2fbc7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 23:31:39.8056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrMu/8MR5AcmJGqBgTk9Xc6D1F3MBSJUKlo3M1GzomwbROIfR0Ua5b4199PrsDKQ4b3xFNE0duU/U6S9ei4AFfvszgqVEhmyD79dRq91e70PJ2ifPsHClDDL2XC27K9S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10888
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> > > > +               /* (B) CPU1 <-> (X) ak4613 */
> 
> So the above arrow should be "->", too?

Oops, Yes.
Thank you for pointing it, and thank you for fixing it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
