Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11BC16988CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Feb 2023 00:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjBOXjf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Feb 2023 18:39:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjBOXje (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2023 18:39:34 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B502E80D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Feb 2023 15:39:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQOMJc3we0ey7i9lahbL7hmqoyVDDf/TurYWnaZQx3sNBQGy4bYcoZ7GrJ9lOwwzff4xQLWbLRXEoWwEKBBQlnJmi7E5Dljd2loZ/v+2MmVEO43tDY3XUQoDNlUyN1QKQJlg3iLdVO459xlu6FZEqCP+shHHvAVLUck2ASqbgN+57YxI/Md4zQfAgrM+ELhFXdwqQNzx+SRpBvqIjJgCtpxayrQQMj0g4H27aXQCCiL8owltZjYfMY3DtY1tMrwXiO/2RPkx7R8w1hAgl2pegPh9bPBhERX+eoFF+AXYvZo5XFiG/XRujUQlsdqlOdzJAkErM5gIWMNnHsArMf5LHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTZFy/W/uCfPP+BAdwi0zBhtVjdLng0r4KgDQHoqFdQ=;
 b=bnXZfQcYwS7xu77VraF+/k5NzS0Z/AktDuzL3Nlzk8kswmYxh4k0HmDmtN8TbrGoo4Q2RgLVodAvgdNtdahllMt8SirUWFNxn+x5ssyjzV+A8gVwEyOMUZQedA4bmqLxZ8kBiN56xcvXBGRk/odQVmqNbU+7ugVzvFhoB8r49lQTnBefzmPfG4tugODbv3+Ea+Mp9zVgNocG9VchEHetZOZt9SIi+m5ZWwdlys2AFvqjyE1jMaXbVLaXelcUe6g+zckuKmkc2GxXG+NVJsC0rXy5iItl8Wb4Znxe8g7IBJ+uwcqYcXvMDYQnX7TvBaJdNNnk8LMWfdQeof67pWGpoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTZFy/W/uCfPP+BAdwi0zBhtVjdLng0r4KgDQHoqFdQ=;
 b=hnKzWTYpfmpwROJhqz+rlL7fajvhP8C0Hpd41CKiN+4wpgTxO9LjzsZjj4PH/8E3jbJhoWX7jMMXDFBL76MjzwT6b5v+0HVU78EQDf1d5j5HeUwijku9TiaTvKxt3t/8M/LhhnbjdGEfwJuYGnZjiUieTjOKTJl82X3ApWeAoz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by OS7PR01MB11967.jpnprd01.prod.outlook.com (2603:1096:604:23e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Wed, 15 Feb
 2023 23:39:29 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::c012:df4d:8ba9:3291]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::c012:df4d:8ba9:3291%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 23:39:29 +0000
Message-ID: <878rgyjy6n.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: rsnd: adg: Fix BRG typos
In-Reply-To: <ac6365c17861d71fbc89d823089db4aafdb763ed.1676470202.git.geert+renesas@glider.be>
References: <ac6365c17861d71fbc89d823089db4aafdb763ed.1676470202.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 15 Feb 2023 23:39:28 +0000
X-ClientProxiedBy: TYCPR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::15) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c32f3e-c795-4856-a8d1-08db0fade16f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PZ8xr+3oPbTj0gen+jIIt0Mn9o3WtSCUZvFPnTVsaz5kGVCdSxVw2pmQxj45xYXHHDIjdqVmwkeUgmSiyEpuz51UmeBW/tlpqLEl2EecYUQzlHzJuiWT4TITUphLQ8+GM+wI8ctv2uLy4Utlbj/nYeSGZHwV+EmO9tGW57OpMJIsFDUqsw82LNDEXT5IUaT52P4iwIJVpFFKNMuVnf0Q/NIGH39A5rCgbAhXHiGYseFf5tJuWzZntc89AGyn5kJXcKP0xC75r81mO8LjQmJpGu9BAnQwn7OT6YdroCb4xXSSgS6GnEyGn3+nomCzQeXFxcscm00QianML9JrIkGLnt0VcOU0jqUoPJMdCZEXW2ps/txXH/uZK/vNaEzdUYQ6WnmFgREm2RbLXvYDHvg8/2jiII7vx0h5gBjZIui00U4ghwolMcycFgxhueSCX4p5YFDa9T0H61T4nEss8zjyeGqXbJBaE9SZrWeotBqnZXdLjo98+5XqurTS9eim3gvfztuq9EExJmRQa6/FSSOx3+dneQrEX2ga+2DgRxZGj88pn7/X9YpSHspakHaaIpc8j+k/CLybRiSHEDBWxqpwUbd7YNR9hjGRVSddKu+DRd7gsZkqj0hDNSYOyM0XfcvGNUrznZ//MkDSjLviFyV+gWsQ7PVrJcYl+p7/hSVqKRZjZ856oqmLro4jPf+yHg1sE9R6IKJpttPZaMHMZG/CKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199018)(5660300002)(38350700002)(4744005)(6486002)(2906002)(6512007)(36756003)(86362001)(52116002)(6506007)(478600001)(186003)(26005)(2616005)(4326008)(8676002)(41300700001)(66556008)(83380400001)(66476007)(54906003)(38100700002)(66946007)(316002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5AWBRGqBpbIW7Q9c1aGkTrqkvPzTciTA4rtVdM88gMB8hKBp0nK4hVlQZtQU?=
 =?us-ascii?Q?pUb5z8QSZmeJaJ2FB4fJjuctflXigsXpP/VCG5BU2EcHlq/YTYPz4xTtOa7X?=
 =?us-ascii?Q?FqIsoMziP15ghEon9xWLQSmbrDHnSUCHAP6uONorZeEnZas6+EGZVoqp96+f?=
 =?us-ascii?Q?e682WlmxXTXS2RVpwy7sT1P09t5MzusmVkEUsdpPByCxbbBn82zajhpeYH36?=
 =?us-ascii?Q?9XRdvjZB6JCPPup9h7uZMJNWAraZebI9IBS8X8GwtgAfXtTKAmQGyiPXiUFC?=
 =?us-ascii?Q?WAPe1sH5AwWdHHjMreVVa9Ao91xPdCyzFhkLh+05vcmqTkIlttK5QI+eb4PT?=
 =?us-ascii?Q?dOc81rFbPPYA7Qkz3JhbJhMIuJgXP/7smK0YScMceeMKMlo4aBDOJ/Y+u8Iu?=
 =?us-ascii?Q?3xUVrgLS3tEPAzh4rfaOYoa4AsPzax8zZ8WGM5HVss7mDurpRQQ2grJzQFFP?=
 =?us-ascii?Q?jtZedd20FNY884242fFWC509MCkNI/dtxtRrNOyOsR0AB9Wf7TFzCvwFAD4v?=
 =?us-ascii?Q?IU+TzaNVvbDXSM+DMUyWo+F+uYnrTLGTW3BbpirqsFdE2kH05FZ9j/yGYVJS?=
 =?us-ascii?Q?3DnWzPJ5vRaMbbOrymgECtTqEqNfsOTm+dWxu/cYzIk/Ci+RkVvJOKilp0dp?=
 =?us-ascii?Q?gh6LiGH8KA/wgbKWxVPBTkqLWDeJvV8/2MuRv7dRiVOC8qWJqS502olWDYox?=
 =?us-ascii?Q?UrDaXi6IB+GVksJ5fHsMYn7MPUWw0XEW2DezZ9MIr9R1gtveTbvnQx6kRr67?=
 =?us-ascii?Q?myZ7cVVzTcq1hhT+9x+VgOmU57tzUjAGN4F/6oo4QA7aeN+ozQ9aGEtzp9rD?=
 =?us-ascii?Q?+hFTKspMMFGgC5C72nWgwc5QpDBMLgRO2+dmz2TszvQ92EI3NG+LKkmrjV14?=
 =?us-ascii?Q?yTl90ARx6zZ59xIQ9ZEoASVLMGIcLKwIuylSvodZs+xI68uN7eMjWoKeLvu+?=
 =?us-ascii?Q?MeHo+dg7HWFBiXCh6NUAlJxGSnw8k5S0Ezg9qXlJAqQabsjJv602iqlTDx3F?=
 =?us-ascii?Q?u0cgXjt7rQUqWfd+dBOaDiKSMJ4EYvhuPYhh5eFdGV05h6xKdVwdJjNuFILy?=
 =?us-ascii?Q?K+hdSo29iyNYPnBrPVDHMyoWggiyTbQmDnKuqRnevFV4HOusQmb0cqYEzIv5?=
 =?us-ascii?Q?UkxYPePniwEQj+IgB+qjAyinh1hI9UqII9t4QxBEeyo+xRzdLDUJQz9eWyj0?=
 =?us-ascii?Q?Yngl3EFZajiVjk4iWt8yLYqUkQts+l8p2woiZvn4sn2deSexh0wT1JUscKab?=
 =?us-ascii?Q?oINYU0v9ek/EPkhuQRXo6L4+QcY6Xe5zf8dpYOajJOf4rF3LmWR6X7zqg/qB?=
 =?us-ascii?Q?wsvuaIlmu8iEIc10rhpjrpw/qUFwC5ytolv7MKEsMfGxPaL7dwEpEodYaVs0?=
 =?us-ascii?Q?Faz31i1YgyX2JaKSLQ06i9mbvud7nwiawD4vbRN9coWM0GJ7x3mZ6OFmcUq0?=
 =?us-ascii?Q?UCLegeBtO7XExtXKGzfQXVvrqdPQS9iLi5uOy01CZQZ9evtSp/80Z3hhotdQ?=
 =?us-ascii?Q?pUNikNvkV4tNVQ5QKVFzQBnkHZwD6tcD4kwTK1Coll/rNpBWBC9/m/m1AkGP?=
 =?us-ascii?Q?/LsXE8ctpqNH6lqTUYb0aQaZSGVTeDCxWC4aimKLaT2c+/41feDMm7TljF6b?=
 =?us-ascii?Q?FAS4W0z4TVgj1IWCFQAbk6M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c32f3e-c795-4856-a8d1-08db0fade16f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 23:39:28.9788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KShOL3qaUj56RpLKLT3IYa31sxGDlAoVuFVox309qzdh1v21Y+hXnAvJm4nCQM0eYHHcK2VTScEdY8ege1FTn1w5/FZhgJNOfaxETbFpgaAuxmJOsXIDI2RhMEnWVZKW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967
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

> "BRG" stands for "Baud Rate Generator", but is frequently misspelled as
> "RBG".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Thank you for the patch.
TBH, I have been noticed about it, but did nothing ;)

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
