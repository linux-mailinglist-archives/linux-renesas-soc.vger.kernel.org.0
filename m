Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCBDE59CCA9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 02:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237790AbiHWAAE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 20:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbiHWAAD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 20:00:03 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B394B4F646
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 17:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JosYrLXvpWaUKtBHcumrjfW8T3AFdzn53sA3vy6FtEAjO0fdUMIL4dPR+gk8LMHiU0UaOsj1vGuJoiWdq6PaH9qEoFDIIlxGA0OVgTXXuz5zdTexSHs75A6heAUfGWoVYW4h4nxWGEHYQjCWxopqGgFPa66UiWmdp5IsdA4EJtcT2S0CkzaJtR+Adtnv8YDPF5AmORRXX6LpdamyvmOnEFV4lp5YzU4CppG15C4KW1yEZDKFsuCoIPlZDXnuqFWH3czFitK+FabFLEQnuwGNQPcHarOHk1beycuAforMSHG76E60aUqd7vlAsveTkdPand94wuCkwRMr69yi36yorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKEvZ14aasLsWJx9lBgSrWS8LBkkYtWiB4bOtOEVOEE=;
 b=YV8pvCV6k2l9uVyrMlbozlOrqqleEabv622XUsr7rdJkR7n7kWRoAaevLt/eb9yaRSS8UKMLSKIbvWS9ucWhmX16T9+0DFOIPcsjT9j0BqhvMvY6BX4fIfsjj/J7Q2hjB8xsdo0wPXiwtP+IdTnLCI9/Y8KCf2/7OS6UVMSqMxDvKH0B/pKPAj7Nc5YyoGXlzOA3+eAOE+KsPAQ8zAqL+0YIyGRt0bhrSiHhHUgW2pkZbloMvZIFXQjY8bqPpu6XRy6hvOwU1g/vyBwwbQII6EU5A17PseRCOf62weJ7tGhEwGkAc4lOLw/CzenejhzNewO76FaoflzqsvsUNwzf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKEvZ14aasLsWJx9lBgSrWS8LBkkYtWiB4bOtOEVOEE=;
 b=CVr2exxaGdNA/nhaI6ur26ETeYe6OI/MDReBcSrL8N20iSMdIch6EAC8TfpQSIhQOye+6TxSdEaA2aoIvcXXXk+jxEw9R+MWsxZqIzPhH1UEO2bldU5EgMWgTH2lYxJUG0dVQKL6MAaIxD49uDHdfaMXvVEQ2PO3DZ1/ps2ed7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TY2PR01MB3210.jpnprd01.prod.outlook.com (2603:1096:404:74::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 23:59:59 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052%2]) with mapi id 15.20.5546.023; Mon, 22 Aug 2022
 23:59:59 +0000
Message-ID: <87zgfv96dc.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: Add V3H2 Condor-I boards
In-Reply-To: <CAMuHMdWT045t7yOyASaq40JDuRCkMmFAY7GQXS5nb9P+70T7FA@mail.gmail.com>
References: <87edx9gg6f.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWT045t7yOyASaq40JDuRCkMmFAY7GQXS5nb9P+70T7FA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 22 Aug 2022 23:59:59 +0000
X-ClientProxiedBy: TYWPR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::22) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eff287e8-fb74-4e7f-0203-08da849a6bda
X-MS-TrafficTypeDiagnostic: TY2PR01MB3210:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mSkp1TQ0khN642PjiIGD1Xvc/i6CjFN6TFDAzuJGp1h2ZxYweHI/vuhVz0xUSiulSAMRPGhyCyb6Y7nrN1IEku7CVSQXVHGHISxI+dhkvMN3tVO5cm8oatvoGeTH/p0nPsitP32XUm0ESqZqAO4Mzix15H8aHgpjyP3JA6Zi7XjIVxvwuH8jCMP9/lVsOzz6vki0he749cv3wReFsqkNPJ2dJA9i/ABuVSgdk0NDR+FSQTN90fAhouHaclmow1c3zEpYRcCGxVrRUGOKpwMiEwzqlyiuAckoTMR9eZMyc7XMhVs1YxE3S3fEx1he81CtRHmjuTwM3n+WBR8tDnWhbCyVu5K2dfIp7Uw/mMPLcs8gBJU6pnlWoeiGx6srwmr775uQzUNm0O5g8jPSqXsc9FKIx+VsUZomYB4tLposinlx1aA6hXT6B2cJqOY7CyEbeREROI5c3fJRmzSlCEmV18anOiRPVrZGB+FZ6YBRp987aUURAPpT9Mx0noIVCSU/kP9eIBF7kzfkrfk87SCqIjAZCPk+NKa1XhuCfCm07mKaXPNrBQHNVdNggRFOOIVYYO3PffJlf//iWFzFjpQoapHBvRvgft+Gg0CVk+Hy0E4dCvhMXJ1XjW6IFen2G1Y9dBDttUFRUgJmrtxpI7Ip47HCJdw6EtzNeKBvb63003owtvPFUmWYE6X1ZljjrSL+AqudEPOISK4F/18kiAAK1cBq6fGu9ej0VJOgnN6zfRbu1SKBp5A06RUSEBUwO351p0ZIZwvqRFe/CsPbmMk4kQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(6486002)(316002)(4326008)(66476007)(66946007)(8676002)(66556008)(107886003)(8936002)(5660300002)(54906003)(6916009)(36756003)(2906002)(6506007)(52116002)(6512007)(41300700001)(478600001)(186003)(26005)(2616005)(86362001)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f94ChoybS5tL/eGFzC0xEMPhfc3z0hW4sqTst2p4OgnFCdNOHe+M5+S8D1c3?=
 =?us-ascii?Q?d+fwXXgYA3xKQC9cQ3dLxE5i2WPtO+xv4sgUt4gMOmS7c8NsFlmBIleeynj0?=
 =?us-ascii?Q?/4EDbBEZlcKpnDwGF5tuutJEted78th3rlXKqEf2Nhpg2GHSzlsWJN82nNHG?=
 =?us-ascii?Q?Gm2vgRvckktLKZsvSdv6LbnbKRwK2AJee1+bMW1WyICa+egXCWftujirMErt?=
 =?us-ascii?Q?+sThdAxlwm9WQpt4DUXScDFQG+i73YZOCh0OKl3iJ+BduyQLePK2X25WOMIR?=
 =?us-ascii?Q?m02BONvJgbPoGazffmc55BkvNUsZufQrkU9bhVXq/PYNYbmjGwwo3ZxQuIIA?=
 =?us-ascii?Q?/kIdOt3/RCcQ5CE9x2rqdi7RsqNxac9otYwRvWoZn49yOdvIA3B6kgPWdJ1d?=
 =?us-ascii?Q?E3B91k65ElQlYDbff0HyVkEzgI868qgaksgB5LliI6IPebfJ4Eo6UAcGHm8N?=
 =?us-ascii?Q?lMsICeaQKYGnLPhw9+pxPJ5fv2pPcjcu3eHZ/wDz+GOLDFeD1fLlvcr3GDq2?=
 =?us-ascii?Q?KOTbem7/4uRqCheY2TsBmqwVCD9bCrCKPiPyENO2VbvSNEPvbs2cmVi7LLyF?=
 =?us-ascii?Q?4C/4ttE7GjiqNPs5Nu5ONa9/nor3pyUq9wzpPJpzKs84+j8YokNhyMOWM3TI?=
 =?us-ascii?Q?5j9V2PCcwCHc34Of9RgeEKmCl4upVGFdMgkZZHtzYrcbVs942JeSw82Yqp6H?=
 =?us-ascii?Q?mhFoaBoBlJ0z9S6EGtBw6+FeHfJkyf10jDT9NsLmdX+A2/mHinuvs8R0tGny?=
 =?us-ascii?Q?eRFsEoRNkYsexhf06s11LDBeAuEB9QdsMYbuZMOQJ47K5LRDE92pN/+2jyMQ?=
 =?us-ascii?Q?PQALJ4BetKygtOYPxqekAFSZuBYEdu2F1lTB4nyJejk1TvH8+1t5WjqPW6wy?=
 =?us-ascii?Q?TaGuLqez7TqipZCpuw4yke2aiT5s4XpPJLabGk5KXHcjcQk3fGoMO+YKbQCm?=
 =?us-ascii?Q?rnh0GDmdbKo844YhRhy7bgyMJ1VdrfI0BDPqJXYoS5fGKkuTQtzijmDrjpIi?=
 =?us-ascii?Q?azf0ICbVvqRFuSoq3VqlH+6xXd/A9SE/9l94uXp7xdWptX7iwa24YvREiGJ9?=
 =?us-ascii?Q?rqms5Tb49eYstro2lOs4ccxAhbu8mEswez5Sil26F5VZgYKn4XAOaF5MMTkV?=
 =?us-ascii?Q?/+vgvF6jT2mRs9Wlh2HkkfhL+3o1CoA8Tvye2b9CEoX0TitbBaT7kFG9Q9pt?=
 =?us-ascii?Q?d6xQiC2q6Nr1rU4zG2UlYKq960SozSLzjeI3wczHGsJL1NzWw4PWqsK6mLrz?=
 =?us-ascii?Q?o3OeG3GbtUl5mp05IJP9H7wDrzUPbGZsBwgeCjWZ/5b1EyOGXv7ERqxO0TA/?=
 =?us-ascii?Q?dSnm2L1yFe65Kw2pIYiQgQK2H1apqUTLxrTf5I9/zpMMzSP5R0tkeGY7Thq8?=
 =?us-ascii?Q?OBxS4aCOeq9p7R70MvTVYBYUd4SJTr+ElRGfxY9xAunWYKpNt8reW+HRch0N?=
 =?us-ascii?Q?BWsnCLOyqAdF5yqo+G8vT4j3lqeyG0XeY3Vi6jHa4M25IrumdyZRaS5awo3h?=
 =?us-ascii?Q?5zS0cvaeNHA4GYvDtiTZt3rFx0cIqxkKSMmECeALU1wcgzUAvh99dxv2q+g0?=
 =?us-ascii?Q?H0RYbQCheE5sMqTgmUAlPl5PIMAXDmLd9YAFltxNYTVOggFfUhy964k/NkJp?=
 =?us-ascii?Q?g6usIru/pXIIOE3lLPC1B0E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff287e8-fb74-4e7f-0203-08da849a6bda
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 23:59:59.7344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRIkPpxwIZJU6iwt+IFiXQA7ofAxHDGNUTCmtxH36cvFfwd3HTKmdrY7irYfskk6u3EwxczWPLFiW5V0US8q/o9HA0Gw5ILHvEwmThjxkY5mgEvshQUCoZqg2wkFWgDJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3210
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a77980-es2-condor.dts
> 
> I think this should be "r8a77980a-condor-i.dts"

OK

> > +#include "r8a77980-condor.dts"
> 
> R-Car V3H2 is known to differ slightly from R-Car V3H.
> Hence I suggest adding "r8a77980a.dtsi", which includes
> "r8a77980.dtsi", and adds/removes/overrides what is different.

OK, but because this is very 1st patch,
it will be very simple and basic files.

> I think this needs to override the compatible value, too:
>   1. Based on previous discussions about how to handle R-Car V3H2,
>      "renesas,r8a77980a" should be added to the top-level compatible
>      value, so we can distinguish between R-Car V3H and V3H2.
>      All other compatible values can probably stay the same
>     (cfr. R-Car Gen3e),
>   2. As the board is different, "renesas,condor-i" should be added,
>   3. Depending on the differences between Condor and Condor-I, the
>      "reneas,condor" value should be dropped (or not).
> 
> So I expect the override to become:
> 
>     compatible = "renesas,condor-i", "renesas,condor",
> "renesas,r8a77980a", "renesas,r8a77980".
> 
> or
> 
>     compatible = "renesas,condor-i", "renesas,r8a77980a", "renesas,r8a77980".

1st one looks good for me.
Will do in v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto
