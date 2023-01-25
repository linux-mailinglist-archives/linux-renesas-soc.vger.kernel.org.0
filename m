Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DED8867C000
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 23:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjAYWj4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 17:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjAYWjz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 17:39:55 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2103.outbound.protection.outlook.com [40.107.215.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D3E5A830
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 14:39:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkPLaGl4ME28pM6ulDU+t9DK1O5EHTViuXFVFTK0goQ/lsQKKvJVTP9wu5ejP9VuGCm+9RIDto24G/HVhRxvd2VU35HJ4FBBMGPeo+s5h5n0fYhfW99xf/QNrw0butX8Aj52G8Zavhnn5jq2esRhf8M5X/TkPYZ2zLT4MkZLTcP8vOkbbiRQu/b5SGIIjMSgA6TpuSPrhVDr371nte9F4Z+vJXbI6DPiDJbMeC1OeZ8oJt5RbV4pa5kmD4cPL1NlcxQmgAMl3XyzrPWG9b+U8dxa4AOlfL9AtWtdyd+40unBSDVIRAFGDPzXCAWuYnA8RH521KVGIQADgw/OXoeMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc348YNvLPDmAJffDYz0a6IvPz7ejfw35oT04Q3/uPk=;
 b=FJ+pFuKhXV/C0St+9hm0oGJMsun4A/cAS03Ltec3frylbSxbe4g8yvnPX1xb6p3JrIVB/h0bi+Q8G7QWtuigAIM07CC2aPU1XLmdpVaIEfuYKRAZgD4hvp15R/Uim9j8fAZx295eu9QvoYD1KQaOFKX6sGxCq4Ca0IpS8aICADQOfs9lODegsK/5CVfdR3IkpwECXo9h+qccEH+WJewCbjLQ2zTjiDrJ5Z6xjNmMxTyrY3wqltYLx82aiye8G33T/Dnb+Gei5SuAJqdMqIvwqcTCn26Lp17gHJ9m0ZkVA3ZiJxD5TL1vQM/LpggTXqi+Bofq6/tNyrjhUIYM3tYTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc348YNvLPDmAJffDYz0a6IvPz7ejfw35oT04Q3/uPk=;
 b=CkZumlk1qM3fENyvuAEV9Q2nj4KUhlmg2MATqyWFpNoNLM9/fEGDAi0sDO9Siz3FHa8zEZHf1nWkZExjyjvqklXmNH5UtZOC9y7ZqswuZrba+H2wTtFt0fpfbLLzh1CWwCKHcIX3sIP1mLEtSXlZ6F9oYpiIXQu5p5ITL6ES7r8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9661.jpnprd01.prod.outlook.com (2603:1096:400:231::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 22:39:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.022; Wed, 25 Jan 2023
 22:39:50 +0000
Message-ID: <875ycuutli.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a779a0: tidyup DMAC name on SYS-DMAC
In-Reply-To: <CAMuHMdUTrtpHzPzPNMWc1GQL_7kYOX1x72OzDiNy80ujsvFRWw@mail.gmail.com>
References: <87tu0nz3xr.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdUTrtpHzPzPNMWc1GQL_7kYOX1x72OzDiNy80ujsvFRWw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 25 Jan 2023 22:39:49 +0000
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: 1365f1d4-764c-4278-472b-08daff251192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dLh4Z630cKMC7Efngn76PJgXt9BrkRW3+OAV0bplcdYDRQccDubeAru57wf1a7WY6jFwNVeHQqo/8mXDWsNQCwm5hhXSIHPtW8t/qFECpCxSHi+8XqbQfVyjFR0KV8qv9naTzbKiobBLoRr9iVf6Y/0cF3F7n32VggiS6SgylCkkgoju82a/LfVxnS2UouJd6QMGJx/Poc3wsspVNrBAJAlJVmA2f42Nm8gLevResUE2M2frl4pbxFqfgxr75AXP6FNYkUYdLrqpAHF6J6127046/RF69yqLEgxmlcABzeBunR5f9NtHnndI0ZiLtzvBtK3spVRQPjNMj+9yqzk07NuyHoo4vY3sWB0LK/ufC9ddL4bA/yB7K5G6xPONToLn9im6sgv+NDx2CQq0gN2JIkQ49z8t0pjP3Lr2a8b0mncZQcc0Ag5gaVR+3nIgsqEPYA8F7ZMxXxYpjAFl7zmmYsyGL/swp14QJ4d+PHUz4aUsh4v6SOxaitC1NtDDySrWYMDBtJ4UUBWDb2mq2IqbRri/x9atdR/7BM/t/v4fPNBIqlubKZO8G2Px3xrmC4F3ZRKfrphOqDeFsGarkEkTxR6pW2E5PWpTwegyUhnDxejnoy7iMdyl6NTkjpLS4h5A2Ygi5f5NKfvKsT/g8s4oKiEYa0lcwgniTsidu9WuD1P16khRQM/0Z+2tpOqGZ5dSy+N7Gm3w/DdoK2aBqKw9lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199018)(36756003)(2616005)(41300700001)(8936002)(38100700002)(38350700002)(5660300002)(2906002)(4744005)(6506007)(6486002)(86362001)(186003)(6512007)(26005)(478600001)(52116002)(66476007)(66946007)(66556008)(4326008)(8676002)(6916009)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I3us3pBcxbDWqpvblL53odkzNV4LRIoDCwg2HRju39pNWZQoLLBp5UILB/ZN?=
 =?us-ascii?Q?yrwas5AZP6HZ6XP8gg/eqMfM8/66zxSnhL+n3w7C8NMT8Mj0/PFLEY8DCdRk?=
 =?us-ascii?Q?grtlaR/M6BxYY0uoNhTKXFJXR2K2608Yw8OeCjN5FZU5YH5acLKhLiaqH26C?=
 =?us-ascii?Q?tT+bIsd0XMFeJ8M4aMWMQR5yWNx5WvdUeKvP5Ci93yK3QJ01cQC4jGlyV0Ps?=
 =?us-ascii?Q?aiz6WdlxK/KhaYzXsPt/oMll0xq5h6t+9qFMid2QYoUdwWo3+id8g3ZqIbTj?=
 =?us-ascii?Q?Yi84gj6Z37jEPE2MBuOBWqio2fBxilIOaabYi3IQZGnMBQ65YD1bAxZC/Nzi?=
 =?us-ascii?Q?rONgQMquc2teCAAFvnvR22oWOe6Keh5ym1YIq9KpR+XfUlcaN6od3kX1xCuH?=
 =?us-ascii?Q?2tX+XiHGNiYKhozJcVBKSne/UV5L+j7jJ4h/g+w2/SNWAPIkiw9SaLM5Xnxs?=
 =?us-ascii?Q?6hnPen9Dt0bMbG96uafuNwHAC6JlGfzR9EoFopOhox6GIfaLDBNGTV5c16ed?=
 =?us-ascii?Q?I4rfnpcK8v3YLtCvS2Haq4GE+LUegP27uwUtvG+w3d7hxZGub2v0o6kk2A95?=
 =?us-ascii?Q?8s8JzKKV07aAF9BazAej2t2crSQn6/UcEhY0zqSlqzkdj3KIVm8CE/53v14t?=
 =?us-ascii?Q?k1sRQ3hDY09gfN9bogBTjDDFS0FH1IUhOg/Z5U2Z7hA6WgxYoXC7oIjQeOrH?=
 =?us-ascii?Q?1PAk8JLF7SlxYz+HsYdcB2Prw2rVnHSuLhinsW2bNKnh2z/ohlOt1x0J8NY/?=
 =?us-ascii?Q?CBgu9avFDUIK4gkAvbOgHVnkYtFALvAqm8VYU4dAsT6TDTyCmBEpHT0BkJ16?=
 =?us-ascii?Q?Nv3hZbbRGEuzj5UxQFWPxjiBHw7ax5iHqQhAk5hdBxgmU33uaV+8bz81eDiX?=
 =?us-ascii?Q?KKeIktUTFG1Fc8GxGK050VZTAaKyaSN3H0KgMiBsKNu931w4WPXULzodXNEY?=
 =?us-ascii?Q?Rw+/IuRUywqcIRU1sRnBEBnNfA8JV8yoUm4uKLVNwe6wE4VkpuagUwViW/wq?=
 =?us-ascii?Q?bU4UxFROUzd9HFRQwyDOEKqlGQgDIAxvjpQmUuSN51o7IrNxGz6BoevJbCgZ?=
 =?us-ascii?Q?XOdpcJ61DM5TeY88bPpjqCz7aN5BbYOyXdzyTtRnCALDk7MddSy8qFUAnNNU?=
 =?us-ascii?Q?TDcNCi/MUTYqpb0lDQOoBBVv9ugNWg57uSl7Qm9r+ekRt92hJ07aWALDWr/d?=
 =?us-ascii?Q?9BzwYLPev0F971x9zOn+nctQMAf6ADQZbLTCPIYnnC4JEaNOxWE37JOYjCgr?=
 =?us-ascii?Q?d9xnK4e++cYVc0CTCoe0b27ESArk+wBX+NfvuYTlQtCAu9KzW5vrgK1XXhmm?=
 =?us-ascii?Q?d3M61MXFJsLjD6Wq4exY+tGM1OcKlAt1THu7G6UShEtU0C2nr1t6igmmQHtx?=
 =?us-ascii?Q?nhTi32M1JAJ0b1QKKWcCgR7nSEMKqdAIHF45I70JhwfYy8iFWju90Q1DbCp4?=
 =?us-ascii?Q?746h2j9I2P2lceCUgPBbYbR/rvfatzlSvY1pFrFknuHolIiBL2Ko8441aoba?=
 =?us-ascii?Q?zX+j6/VNnLzfL5Sfyxx4JYgnll4AtjrKjZN3zdwVU0HVGPCfLuDPHhyrw/hs?=
 =?us-ascii?Q?7++KHX/zdAgq2v9yfVdVSNEO9uKhnNuiBY8WUpbJFIKq7Ay42zUd2X8Mc5Rx?=
 =?us-ascii?Q?r4mIPvfUMAdpgw4ZQAqGta0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1365f1d4-764c-4278-472b-08daff251192
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 22:39:50.1423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoGjUtVvsmy6Ty16WE2IbnvOdVHyv6hnywSAOOsvo3NQk+yPEHyuiLnYkWM2Wze7RWJN8kNxWwit7VDlJvJukFeGuo7CCTd5R4maqxU3T6T67cS3QQ5VKFFC9SXd+gCs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9661
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

> > +       DEF_MOD("sys-dmac0",    709,    R8A779A0_CLK_S1D2),
> > +       DEF_MOD("sys-dmac1",    710,    R8A779A0_CLK_S1D2),
> 
> Actually Rev 0.5 of the documentation does call the channels "SYS-DMAC1"
> and "SYS-DMAC2".
> Shall we use that numbering?
> We also have labels "dmac1" and "dmac2" in DTS.

OK, I see.

I'm happy if you can modify it.
Of course I'm happy to post v2 patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
