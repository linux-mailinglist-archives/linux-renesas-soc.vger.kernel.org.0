Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D39B16687D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 00:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbjALXaX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 18:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234267AbjALXaS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 18:30:18 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC024087C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 15:30:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKDAKp2SuFGwiDTp2/obEWmmephcZPjL6waESh0IEYlByBGwYdUI52mU7gKd9f/FZYPxbZJx6WTYvNaCWnYcloM7W4eFoqmWT752zEzjmBGqHmG1d1wasW+9Tni7Zd0EqYxeWBajx2Se6rgtZ0/BLA2NL6Z1f8i8Z88vEB5Ty4wDX6g/to7zrzcxjfZP6MGw6qqyZtvSrqcGLcar2G77ota6tKJA02CyDscUWnN0I54IoW3k0SVsFPDwx3urFhKtonhnVbRV6HAu911Mb5bIJurCTAbe34eqeReP5vZWfBhVC0g3wjL1C9s7G0nT15U/zk7BHvNLZQ4HJJ2YZU0FLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OTC/NlVXaaJM06VHVOTxnKviIluwNCwXyzbMHh/j0c=;
 b=BosbHU0m6DnGWmd8BCtONrItyKIxRcp8XOAecpNJWqLEWamYAY6C1NxHbV2j7vCQJFuKbcYOZvpPP221xKo7VWtBG0zdfHQYVyxRlTKgOkd5ru7JP1cB4PhXbGEW3BVtrcfJI5/m7AkDzcwtDAgeAQyiDt0JMQ/9l3n/x6oxywTN6Fkmg4rABlnjsWb5smInPAcBzZYFO3mlA40XLUDldCT4QprVJnZ33rKz5qUyC/DReVPORQt6oIiXDzTaviHv7jDH1SJ6fstC/BQucANMq/XB3sMBlLDMdeQlGa74kByCKBRf8sHILtwglYn4ViiVrtPFXqutWFzOHiN4kLXVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OTC/NlVXaaJM06VHVOTxnKviIluwNCwXyzbMHh/j0c=;
 b=YHgvAooBLaW1eze0TjLfxybQDlu329Fg/CtuUUQxSJvGG1BkLHZxTbVtlkSdJffbJqoTEFy1NWAwJ7vr8zQErMuCEZAoBV9Pgw2rWObpgWJ5F3w4EqwRTQTFDFGxfBZoZ3EvIySd0CoMb1w2yWoq3Ulf178jCtQcAr7HQQmdBxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8658.jpnprd01.prod.outlook.com (2603:1096:400:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 23:30:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 23:30:09 +0000
Message-ID: <878ri7babi.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
In-Reply-To: <CAMuHMdWzyj8hR9-GY5g3ZqVRD3FC4HxxtDEfLAxjiK=iFRpC9w@mail.gmail.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
        <875yeepxfw.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWzyj8hR9-GY5g3ZqVRD3FC4HxxtDEfLAxjiK=iFRpC9w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 12 Jan 2023 23:30:09 +0000
X-ClientProxiedBy: TYCPR01CA0170.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 059d2cda-e655-42aa-31bb-08daf4f4f202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZvjOk5G4mDJZ+Ib5ptpCOUUakZ4vNsPxiJJ/Dj6d/NWNtUll8l79/WF275SURImYWCIS63Wr+tns5gEzXWmgQ0tRbFDItdBLYYXesMxVWW3tEZtc0FURmhTb53umXdCiXBrLPSGGXG/texuFj9xMROUgMOXynxn+Z7nyInw6C92Jt2xFQn+4le/1nlf8VFq+zEy+MNTFc3U3gLrrZAZW7eSCPrFH4VkYA4WPpUt5/I1fYH1S0GdxSM78LKw12NNzBdWRv7IA8b6opE/WNYHjW5D1xEh5S2l+StN4PASHMhQx2gjgNF+/19ZNpOqvjxFw6MwxvMXzno4Lek/rFUc4SiNNsLGAUA0wqaUv8MFkdDebs8Z7wqn+wKBLETPHgyB0sjCv31QfsjPeRay7BFT8lYs7vRcZx5oTe9pSndpPQ/weZ4DK05QjVMwM6WHiklfQpe/L1TDeIVpBDh98W8lPOsgpTSKQ5ptum1iFsunar6umTKoLXLbqjx+l7XUZsmmZE6twXBEdB79AmFpwPNEVvRSJrepsTtUtjREN7ueJzKyHCQbE+FbVcufVxEH/vBYXkOmTzWVPCdAJsfA8V6ON5jjH2/i1uI9GMWXQWkusbdiKnHyQew/1OzNA/P/72+e4km2JxjpFxfkKR8yAMYqcBa7pMIhZVpNKWCEkgsBptMB9P5D35lJA++tS3W00TvWHi3Qoq355KAjzcDMZSRHSDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199015)(6506007)(6486002)(26005)(2616005)(186003)(4326008)(66476007)(66556008)(6512007)(316002)(6916009)(478600001)(52116002)(86362001)(38350700002)(38100700002)(41300700001)(66946007)(8676002)(36756003)(5660300002)(4744005)(2906002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gP4AsjSjgcUIzD3E2fKVzr66Kd1cqRbWg3/LJ+A/rY28RzkNIgwPbytZWyvZ?=
 =?us-ascii?Q?ofgST/CFVpVXluwQJuU13bf1r98pimkDF8uv/9vmIdp8LHUL2oljLeZav6F8?=
 =?us-ascii?Q?rgePuKcG0HwgeTcIRnUWu9/x9l1o1rec0ZHo5lOFAKA8kcXBGX9xYHJ/65Lq?=
 =?us-ascii?Q?qWbG0P6oQW8JKd+oi/Hl22K1f1QE/66MBpKBqTaksvA9ndSO4X2b75uVV8lh?=
 =?us-ascii?Q?Ag/iZnWbtSRbO0PjSxpiTwSJCpcPkKwm3aJbdGvgWBAavhxITJ0OTcrD3GvX?=
 =?us-ascii?Q?3gJ1ThIxtiI+MViTM3Y3LyIvGLTkyAyvtjoUMnZKO+GXZK1JLgHmcqzu9+I1?=
 =?us-ascii?Q?YTyhIhf6McCpAOW6c6A9qi7be5yn6W3hVYe2mUzQWPZJJON52A1oyPLplSDF?=
 =?us-ascii?Q?AOCbiFh96DVUuE+iON8qklNurLpbao5SsSHhhrjBIxzDsAhtUNuP8l2i1ndR?=
 =?us-ascii?Q?9ohH9asWyEGG/zArqdu43ZduK+TaUvd9019Vn0yBzVWcovgpBsYF6tBiEde3?=
 =?us-ascii?Q?JoUED88LqlPF14g9ewOffqx0oqKWkcT86jIHkhBon1k1+H2nWaAVAa/11Gf6?=
 =?us-ascii?Q?09fmY906e6Gd8Y1QnCrYzLiUQ41wwZOsxSA9ROxhxcTY+FZSzw/3IJjoG+hx?=
 =?us-ascii?Q?8aqS3MtBfUSl5y+mRKjmRhkKhvwuK+3nhUqqNca6ez35JythOynksxIPo3g6?=
 =?us-ascii?Q?1+xoneBN6OF1FHV+SYW73tXCIBeUOuzoPX5lltRJli38ZlXGXfGtgKwufJhA?=
 =?us-ascii?Q?9PANUiJr2TI/1WryrvTFwrxRA6CS14kmfLOmLECFVTLyI9MOU9QHV4meqgNy?=
 =?us-ascii?Q?bjSuH7MspjRVA66i+YEJEqiXfr10dtfiACBY7ci4PF6bwFKTv29vYzdReJMR?=
 =?us-ascii?Q?XIB7xJ0LwZJxfDLtEWq+f5KH7pDGeRtLsEXhTpbEiCTZ6f9sqIBsodWqh2nR?=
 =?us-ascii?Q?ab7m0X8MN0eL3Te1PjVG+bWzy+AZ+TRFG/cp0kmr60/Cga6DVZkmtAlVQGck?=
 =?us-ascii?Q?+qR38sT4IT6PXP9lI8mayNnawNIzuAi74m0Je7fEN/1IhTQwvDj1Ooc4hsDC?=
 =?us-ascii?Q?AHZfrQvHhb6S8pmcH2aOui311s3MVsohFWh1xr/P4Tmu8rWyh7suPhRoFGzj?=
 =?us-ascii?Q?w4ykH4YzcPJevJCr3zYnI5v5U9cpx/w2TfY3g5aoY7ohd7DNRrCDKZO9YGNr?=
 =?us-ascii?Q?qMsUYucO4VUQ6Q0gXF+MyFSmNnpZ8zX2J172LAz4hHGZ6/2tQ3jygaj0Wbfo?=
 =?us-ascii?Q?m+P1T8JdPO14tZJWZgExhnIdu9fTKDaifUkZKwkomJuKQkxUkEVYm2B6RRFS?=
 =?us-ascii?Q?QQ8CwwGxUN+MJE+2mHWhRsQdyMIccR6XH1eU9fICAW3lQ2JMUurr1xjhJ3BV?=
 =?us-ascii?Q?wmlP4qlxpNrfsJDHqgAxeJeRGLlHoHRycA4oQO0AwSCprF2RyIl58IWaYFf/?=
 =?us-ascii?Q?ZLEJ4CwDIRj/YrmcuUXvpQna91T8p69TBocnSmPGSNrqo+emWEbz2PLH5rRR?=
 =?us-ascii?Q?IhLXrNj5KF78yjgr6qz5fxEOGRxjbm4BNg6Rm+sxETtZHzii/chiVMR3WkAo?=
 =?us-ascii?Q?QtA8E7ijK1qL1tXfRRYsMWjCccM1lClsJGFU47y5KBPNpxqOgb9tRCTLqcMH?=
 =?us-ascii?Q?reVqZH1tKDB87S23w0epV9Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059d2cda-e655-42aa-31bb-08daf4f4f202
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 23:30:09.7961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5gTFLfPCJPwKJGxhmzLG1wwGdxTK73/G5Dk/dqzFZ3Qj/0fMUOVOQ3VHLHd99gxbvDU751LLAggCxmoN03nriHSRChcqGIsk86wtTGAhwlZPADnsSJopkjTtyPYdNpN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8658
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


> FE = Front End?
(snip)
> Back End? (I guess not Big Endian ;-)

Yes

> > +               /*
> > +                * (X) ak4613
> 
> Perhaps add an arrow, and a target, like in the other patches?
> (everywhere)

It is difficult to explain via text, but on normal connection case,
SoC <-> Codec are connected, thus the comment like
"CPU0 <-> ak4613" is correct.

But On MIX+Split case, it is using DPCM which connects
"FE" and "BE" at runtime.
So there are no connection between (FE)SoC <-> (BE)Codec
at this time. So the above comment (= no arrow) is correct.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
