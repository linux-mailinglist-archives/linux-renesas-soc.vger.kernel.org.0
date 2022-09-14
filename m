Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5B2E5B7DB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Sep 2022 02:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiINABv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 20:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiINABu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 20:01:50 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045F65FAF7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Sep 2022 17:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XR3tND+OBi2BoDOFgTYsfQ8po0ojz3pGsuwE+NjfTMwG49/I299brOE7CV8BY4HlrASCFechL/ygQDZq+QMw0Nn6z1XB7HJA89XREPr8ubGdCOB1EOiusHgsKv8C/gxOHTPXB5uV3Sfk6tEKzoBE93aa1oGccI5OxFoWemEdNvC14F17KZzgGF1XXzKPZY5skZpTwkc0/pjVEWIbEM/8MdinyZh5CwzzLHxxRWUIdSF7g3KWB3XpAhGnoFvoWstV38CpRlCLrP2ajTkGOlpoa+rsRRwIUh1XMQlfWhb1Hpu53KSbHzm6OBWVm/kOBqoHf4pExY7C3MScEBn61BDSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vbw5HKVaKCa9YtWwWdoEIvUiVM9rheb4KJH6cHi5nhk=;
 b=ailxARmjqH/qzAoDdIBnVCo+HRd3S++H6K8MACe9/eObgkEl96NjigelXD0QKS9LXMz9Bej7UyAAZ14Oa6oCb5TFI8/fC6b3e5/AscwzzgDoOQwXhawRHsZFDxuiQzF9zogMmAD2jKQaJctuNBa2VTjpej4BGVJkF+WK3gFIhkaV03US9ZBEpsK7eQe/b1uYJklcHiPr1Ui5K9y9rPxO7ydTxkcKHHqX+/zr7DGZVOJMsRT4MF4nUEZR4QTY9T56PZBgvZlzFzNKdsafqIIMOojAmejxavqwVf9k2sefIKbN1zUx7EoYKfL6Iaiu/2AIFwryjuse/ckTfzE2YuVE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vbw5HKVaKCa9YtWwWdoEIvUiVM9rheb4KJH6cHi5nhk=;
 b=iZUEwtmGciJCwnLGJH89PV4vj1ga1U4qA3YnyLfjszMV4A1NiHH5qB0oTXByBWfPIgKDivjL0rF/G1xxkAlzRgP2lrhKA77tl5ozbGX9gI2i66zFBwzgYMkQNNsTneUt3Tk2qhUIZISYP8HTtvDg8DMLfolUv5Z5hA+8C9T2Ogg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10278.jpnprd01.prod.outlook.com (2603:1096:400:1d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 00:01:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 00:01:47 +0000
Message-ID: <87mtb2aknq.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH RESEND] arm64: dts: renesas: white-hawk: add missing bootargs
In-Reply-To: <CAMuHMdVSnaKGVv3RufYYcERRp148do1pcuTYuNipLcJAp9aeUg@mail.gmail.com>
References: <87k06858oe.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVSnaKGVv3RufYYcERRp148do1pcuTYuNipLcJAp9aeUg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 14 Sep 2022 00:01:46 +0000
X-ClientProxiedBy: TYCPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10278:EE_
X-MS-Office365-Filtering-Correlation-Id: 749aab21-f154-4fcf-f1b7-08da95e450cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X8UwVxFK45Nwl+IALOLW94vhrw+oTPI6eHk6McY0o3DJNbo7qG1+XWZxMGFZlucKI0W1uOC090jYgcOdWySXdOmVBcw5sPHa69m+huse+HhlWPHNV7H5AVZWjf5EuBR2zfCgGjRDwwCh1PsyJHmIne5gLva11SsGXbuSVPYWd6oQijKU39fAtZCr0NNx2HMIZ3H6PJpmF8kAQ403kObXwiy58FHRNxzPpTq753THu7/68bBeKlEBfHpMs2LTBLw8KrjqBjpGoXAe0le24tisZqVIy/IyoGRjwb9hMC+w+xybVPuEjBhdpBtJTLQM8tEmEwK9wtOOuF88psNVGJjSgbfpHFY+uNzziHl/KodZWTdw5Vok2lhfY2dHe8aP15p8KBugrdNvh5hFzaINpo4hlcyHAgVaxnWovyhyqcTJssPFM/PQKMx8xftm6d3mBYgPYOuuU7hA/nuwDc2wuIo7RRKAP5HhZwCR0SDqttS718sXDgTkvifZNdDCQdiHOf43Pcud65skoxDh9lLRFZ9wJVVNi5aiQmD8h/S3WdnRWrLO5IISbSLti6hE/SSwr3RGweAjNqUr3zHFe9ujro8DRORlfUNngGaxs8kIV+r0Aa13KR46g0deKKxo8LEKPbx7DPk0laoEg6dRTZ1DiJ59EDEBoY7tWTWFCv8gRn+qxIQBvDAtSOlaY4Bnnz9S6dKxikIQh9tO5YA7sqsTgZbMZiLU98WTIC00xRWFhxLgDTS+eYTZ19lotbHsGl5OJi62ZnjbgLKn3+D8XFBFtOJ2zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199015)(6916009)(2906002)(52116002)(5660300002)(4744005)(8676002)(66556008)(8936002)(54906003)(6486002)(38100700002)(4326008)(86362001)(41300700001)(6506007)(6512007)(66476007)(316002)(38350700002)(186003)(66946007)(26005)(2616005)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b4wJfIMNwGReQrBS8dTS7aXltSy6Ks9VJZ+NEEp/rS8ii3gsYwQBtcyy38vG?=
 =?us-ascii?Q?iWh+JBpsZVKiku6hMCDJvZDULzD1sSbgws3TgaGc6ixeo+yzIU3vnpr86gXx?=
 =?us-ascii?Q?Sop//lvq4zlEl9diEn0VFb4xsP1pzYDcxS7hLCGEIlqc8fA2wn08HdPz7Uju?=
 =?us-ascii?Q?b2ZSCAjV1EHgb+SA7GXhAO3J9DMuhD624Ozoxk5gQXF1Jh42EQoEhIEA01qN?=
 =?us-ascii?Q?Va2NJzYS3e2WlQR9QaaG/Dhrzn5+lm1fs6VtyNeTFmJ2civb+pPcX43nMgHr?=
 =?us-ascii?Q?UtRhDx9UAiZMRGUbuJoGVo46wku/q0J/flhBV5JrFuMs5PnPJjNEdUhzLDrp?=
 =?us-ascii?Q?+Lmzm9mDSHiHeOH6P6sRA0PpkjbP+Ya85RuVzyQ71aF1QcRxqwlTkriH7DXg?=
 =?us-ascii?Q?YOqEh82cDkVBMbp8tuwJYkaIuXhLliVOCTQ+g9M4gili/0BSHN4kHeF2Ubad?=
 =?us-ascii?Q?c46ShjldlI0D82UkunC26kD+uzhq4y0sAzOPXwXgEXXlwazHwOmR9AZ+bDVo?=
 =?us-ascii?Q?JOPbajeZcpWmkXkcWAp0mXUesmXcfZpvALYg5bpcHVRV18QMvgpFLGebXUE/?=
 =?us-ascii?Q?YWRiH2AZlZJ841Y3up+ZJduBAIolu80f/JXLA/WNU3eBRQ954RJaQrm/BSPA?=
 =?us-ascii?Q?n9pDSJKj6TM5ldjigXqLTLWQvQ13cKrLf5bRQ6Ix6DJVtHpConrdD2w9tnAA?=
 =?us-ascii?Q?m6cm+ptLEMIyCFp/85t27bRqY1ZCKp4xIhzNT+XxR6cc00yFeyfTdKvFjz1y?=
 =?us-ascii?Q?51pHvYi+TIyFxTLAulZ6SDfSgm7Wl0zXhjmYYZmPJDPbFzw/RdSOp8Wp3zAh?=
 =?us-ascii?Q?g+kCZAjvgQ+U5iL+Dino2t4P7c1BxVj1tq5h2CpYiTHEg6fAZKbZxVbaqrek?=
 =?us-ascii?Q?BZqr14P0xMlL1B98wFcYe0JvC5Aart8PS4mL+94XUqSLF/G6rvw1em/4Yfnz?=
 =?us-ascii?Q?/1dQdak3OEy+2eNlcOwHC8NOeNcpOpc5dA+3EKeKpVj9lYnerBcEMK6TIuvF?=
 =?us-ascii?Q?SODK39tSmbpZHy7Gle8S3LSolVV+fKqCVI09xeCUZfU59vdHCsFZBoLPpoq6?=
 =?us-ascii?Q?EXkGtd03DXvsqRpFi2JxnzQdr+bj1cHUPLBuPe30POqrOciaAWmEcbMG+61i?=
 =?us-ascii?Q?n+UJcNxKg7oXr1CFQKuwgZQkhcXiI5fg6p9xavIWJbFxCqsbEIHEUYDzu/fj?=
 =?us-ascii?Q?t4jhIbsMnR118ER0NJllLsLLQ+PeUbd8AdtWEZ83STxAhyMZgZXebZaUYQ4K?=
 =?us-ascii?Q?nPJldkMZWBI7zT2Tp5+fwT9PIolliGV/9nwghW1bLfuofnRqfNUT+6u+woE/?=
 =?us-ascii?Q?LEp4X06es+6yzNkdMemDiaEJ8xYI2GzExIL1Vf8XwmkWbyICMbT8Hkij6iXE?=
 =?us-ascii?Q?1ueHtxTIRcR8aC9VBMXS6eh5nZciuGKkhoFdxv3GNm9RJTV2sWrHU4M3jwDG?=
 =?us-ascii?Q?DzN9XK3zVOIWvpE4LFffMKLFBXjZZpKE6mvtIAW+D13Qzzi8jrqO3dCoZT9k?=
 =?us-ascii?Q?RJMauZam54nCVCW3M+/I1u+pF45xNpp16HvklvnPkY2SVLCXBs9wxRrneqMJ?=
 =?us-ascii?Q?+WKxJ8kj+ihxNW9aaP2JuZieRTi3qoWO9neZwOahvkbvIfXCpkcXycDuO1ZV?=
 =?us-ascii?Q?lgQHr/qp7yO0/yxZDEaISe8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749aab21-f154-4fcf-f1b7-08da95e450cc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 00:01:46.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82TqNDgkgZAd4PvOZo2jpa4DPyTojmVNOd6wTTgq/xTkqvmtEqGJV3/lmH6Q6rFuf8JA9AZj2itqb0OqCV4UsPcw1V1cPxXZ2rQfQ+B1AdKQydj6zeWpicRAIdI3r58R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10278
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

> > --- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
> 
> Do you mind if I would apply your patch to r8a779g0-white-hawk-cpu.dtsi
> instead?

I have no objection about it.
Thanks

Thank you for your help !!

Best regards
---
Kuninori Morimoto
