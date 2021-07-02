Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F47D3BA54A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 23:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhGBVxs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 17:53:48 -0400
Received: from mail-eopbgr1410102.outbound.protection.outlook.com ([40.107.141.102]:36906
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230109AbhGBVxr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 17:53:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWd9OIv0oX6qblbWhSUg2QEDj00oHt/XXZbRzzNrO1qExiUHW0D2jithR5/FhOX9evP3zH7Dhq5gYnWXKdreQ80nuB/x+EjYx+anOsihSP8BYOecpTotmZNrwZPYT3getUwEEbLmqEzVhkikFKC9SFD9+mVlIkO6TQoDQqc+rR3C4XoExzEtAYLoqBQA5KP1D4V6tpPZxwqRH0s27gSZM1ZpOTmaA6R1ZfCGlGqdcCbALK8HVejIbtastnY0ZYyIgUh/qKnAJRarnhQ56b3kuomhHFAH1mAIeMrT2tw+jseqs9yYIOUDmSvJiNMQd+4gy9LkgnP7AkF5SZwHZJV2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n+5SlyoT6KbTlojWWWrkyx4ocbeTa81+2A531CF4GQ=;
 b=FLWxO54UDrD1hLCqho7UGtiOmC8S5sfGJtKiLJ/p8rtL68gCqCkz4Hnsv/dTDe43oQUOCour4JcF6sAX1JWJ+8aRWcxStfHFAcoRd9EN9PXxZq+z+uCsdFNlUIvdVUfBKM8rmLXa/B4d+g5M4FNEQW6m2IK8uRKMdI17OU+F5Z5dKy7VL9zPT/BE1GxMbGdMiTZMl4RYXqg6Sxjj/CjIeco3mgL24/rjirGoUMy2AiYIJyJ4tzYa+DhWatBgOAInp7v0VBz7Qn+zvbrhhGcQC+jwznDQR/Bgd4jeuB2CDxQE6eXxs1XYWSPEnqIIZEPoJnND8/N1e2LLw92gMrmevA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n+5SlyoT6KbTlojWWWrkyx4ocbeTa81+2A531CF4GQ=;
 b=Rz5e7oa4yegFN7YT3VLs7VuynB4nwslU/4MboPiQ5qznN0+YeCnLbgh4ai89BfhV9mBGYnuVhlF7Jg6LNbzd4Svw4WRQe9aHqlVss7IDQICOvub2+Sc5h/1ZUby6DUebBPVG66VikkXkTbgRMZbL92K2OkSBsyUfTc+qrb9e6m0=
Authentication-Results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OSBPR01MB3573.jpnprd01.prod.outlook.com (2603:1096:604:40::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 21:51:11 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4287.031; Fri, 2 Jul 2021
 21:51:10 +0000
Date:   Fri, 2 Jul 2021 14:51:02 -0700
From:   Alexander Helms <alexander.helms.jy@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        David Cater <david.cater.jc@renesas.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add binding for Renesas 8T49N241
Message-ID: <20210702215102.GA20007@renesas.com>
References: <202107020640.YyVoU69S-lkp@intel.com>
 <20210701232258.19146-1-alexander.helms.jy@renesas.com>
 <20210701232258.19146-2-alexander.helms.jy@renesas.com>
 <OS0PR01MB592240DACD7D18609EA70AE0861F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592240DACD7D18609EA70AE0861F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Originating-IP: [68.225.135.226]
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from renesas.com (68.225.135.226) by SJ0PR03CA0070.namprd03.prod.outlook.com (2603:10b6:a03:331::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 21:51:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18d171aa-be29-44de-5a18-08d93da380de
X-MS-TrafficTypeDiagnostic: OSBPR01MB3573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OSBPR01MB35735B42CA9711A8A733499EC81F9@OSBPR01MB3573.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0WT1mrfQ2XCQY8kKqDN+O4O5WEOYo93VXYY+DHwJOOBDFWvP0y7LLFTgp6cigflyfv6hnjl+HusFGuF18V4oxhtwc3TYYo6OEsgIee9Yhe8ffakcD7X/Arml9s31ssCe587fMVMaNdj2+s8PvTjlHy0od8DkddH+Jjd772vIyNPbOL8ZBbiAWW5EJ0CyY7q4z+qUFzdy8pCcKLVh0Wct1DgX86v1ivRSPhejLUEy05RmbLNYL1xEw5Zt26Mp9xKHU2o/vVWoUvZ6MdzIqg5OJCornWQzy6H9gguD2Y863Kod/bBYTyiKxXc251UL11tM8nrBsyGRIwC/9vNeJaQrgn8wD/lsYHKWHl4TDzQQGvs+GsHuxSFtRUK5S2TpOBJE+T8gx2dhuu2HtnbZwgaWOk9ZK2vE6WGN/MZOo4iOEySMNuCREVvB0h1pZ32JTajpZwswwDq3lmgtPeXw+38I+DRXJJ6sLWixKAPRygDS+vPJztqL+IrWo64F9MYlERbHdcOyjliIP39GG5lCoaUFMlpuGzJe4s27sc/eC8n5PPCbIuCB7kAgWkx1fMzsX1FBhYPYg5zOBWttNi/NMud4f5r0VVjl4DKSh1hc5arzg6IvlwcWn9ggOJM2NOnQiDPx82JNIEW+tUV+hg0D+CTgXgxAYPogLjYXEOQHem4XjRoruzAw6FARkHGZ1bEya2nC9mBmrTLLWarsTiwW0sSXj+PO81AFASnS3DANbE4AMO5pmdOVDyTYvegK8nJ6ZSBHqXF8bIYpXQkymxOYYcffcHvfSGc7mcIK8xyVb13PQG98mlg+JJas/NbLSTM9agLE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(53546011)(55016002)(83380400001)(2906002)(956004)(45080400002)(66476007)(316002)(30864003)(66946007)(66556008)(186003)(2616005)(478600001)(6666004)(6862004)(1076003)(38350700002)(38100700002)(8886007)(4326008)(7696005)(52116002)(86362001)(33656002)(36756003)(8676002)(8936002)(16526019)(26005)(5660300002)(54906003)(505234006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/RIqfZ3T+ZxHzh6jAnnI1NeVPJKOU/FD+iiU0jhO3joviA1wftGWdWVtwt5G?=
 =?us-ascii?Q?DzcSbLR8IUSr8X4mU3DpSHaOW8JEnMsqlC3NY0562OzOwl8iLluqPfJKUxsl?=
 =?us-ascii?Q?8euRZoYL5jMDi9OkFqMTjQPgv1VEu39YyqUjEhPF3l5BtrAi/4F89jmKyNtr?=
 =?us-ascii?Q?fnpU2FSfIY5M7/L19cENjAFHaLcJxf9S/yqtKHYYhlROv8nwQwCgYWgEV4sT?=
 =?us-ascii?Q?MMr4Wz/etz4aVU7ROyGOfQR5YG0+qwE2CoRXeJsoSs/VoNQZnoR3T4pdXoYH?=
 =?us-ascii?Q?IcjFuxmI+HC7beSeXBKV/q0rEMAUMf7BUv6LXmIndkdpVuIAsbjq1kfNFegG?=
 =?us-ascii?Q?PFswR0WdsLwiSkYhs4yslvtjZ/tGNFEWse/9G6GU4eDnZQdg5LQOI5OPmIr1?=
 =?us-ascii?Q?aMXbEVthaD3mQTqhHT1cYLfNNPwyuSsGtfVRnXqukqXb/ZHMgnYinU/yQCOD?=
 =?us-ascii?Q?4ui1G7cXXzRQyqYRAgStcZyyCzdP7zOecz2PR5ER6pcM+gMHluUg8Dlk1ris?=
 =?us-ascii?Q?2Bpg2/Wb4pYXQ1cNpQSlwgBIImF4I4OiLny7NI+Y47WnN3sgotXQPNh0mKGZ?=
 =?us-ascii?Q?X2bGjjGnF+FhqN6ZS+iCaS752muvybsjQwwDtopZTLWIa769kNF2mY07eaiJ?=
 =?us-ascii?Q?WYTDvo1FlHJUXWc+KxTlWvlR1vB5lrDN873Lgc1b5fdtQRa3qF8qT+6odXZf?=
 =?us-ascii?Q?vuwzJXqS9MnuqeaW7IRH78bBPbuH4G9dlPfZk1zshjf09dzOioKV0w+ga2GX?=
 =?us-ascii?Q?zvAX0/qp7ptkm+apg2WJtMz0oMMWluI1iOYHl5X+xSPMtxLW/kWEgtKWrWO4?=
 =?us-ascii?Q?ehlzL6xHdBW0eUPkzncweJQjLK7S5KbCzCxcRjZ7hhU0OdWZ1RdBtX+3wilu?=
 =?us-ascii?Q?DVLOje/DLNRvPKs8YCqXasq8ihbbqfbdavGuJkl0V/FPOmwoPocIkKefOuqG?=
 =?us-ascii?Q?LoWTEORHTT1hvnGn1N9fHs32mxvxgrQgsRElyVwXOsP13PHXxAxdUBVTr6cT?=
 =?us-ascii?Q?3+52E9KnLErnX7e8jqpzyMLzIsr21YbLqGK72U6+SMEjJYKNU5pCyMBHvJmx?=
 =?us-ascii?Q?9BgS6I6hMHTAymuSawgWfigC6AG2ruKn6QDbLolGMrPHnOPnzbxEtddjPhTo?=
 =?us-ascii?Q?KHc5Jni5kbBQ760Qk/OXZt7GFaMLjN54L4dann1VLwnmjHeE3GckAmZ+Vps0?=
 =?us-ascii?Q?nUu9tj2C+6jwexO/G6J4+nblM9PQ/QXk4wN5KLGnwDXJO3/Yj6lQelFEsMCY?=
 =?us-ascii?Q?VJc4Swz8d+nDyFiftV6OqNXCDW4H2Aki3cLkxSfN1CWrYgjoXjs/4AhO0stW?=
 =?us-ascii?Q?TITSlFA6K85kHL2/NDxE7ive?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d171aa-be29-44de-5a18-08d93da380de
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 21:51:10.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZfwqDCtizu/F78l9JBHE08d2AoFZ6d3K3r6nm4UjTQatvgzHrhx8QliPoIKUSv2s0FfXY+Qz92CG48YkD7YtBPq1kyhsa8EF/GNAp2eENw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3573
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Please see my comments below. Also, I'm new to the LKML process and learning, please forgive any errors.

The 07/01/2021 23:52, Biju Das wrote:
> Hi Alex,
> 
> Thanks for the patch.
> 
> > -----Original Message-----
> > From: Alex Helms <alexander.helms.jy@renesas.com>
> > Sent: 02 July 2021 00:23
> > To: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > clk@vger.kernel.org; linux-renesas-soc@vger.kernel.org
> > Cc: robh+dt@kernel.org; sboyd@kernel.org; mturquette@baylibre.com;
> > geert+renesas@glider.be; Alexander Helms <alexander.helms.jy@renesas.com>;
> > David Cater <david.cater.jc@renesas.com>; michal.simek@xilinx.com
> > Subject: [PATCH v2 1/2] dt-bindings: Add binding for Renesas 8T49N241
> > 
> > Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> > The 8T49N241 accepts up to two differential or single-ended input clocks
> > and a fundamental-mode crystal input. The internal PLL can lock to either
> > of the input reference clocks or to the crystal to behave as a frequency
> > synthesizer.
> > 
> > Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> > ---
> >  .../bindings/clock/renesas,8t49n241.yaml      | 183 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 189 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> > b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> > new file mode 100644
> > index 000000000..d817ec46d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> > @@ -0,0 +1,183 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevice
> > +tree.org%2Fschemas%2Fclock%2Frenesas%2C8t49n24x.yaml%23&amp;data=04%7C0
> > +1%7Cbiju.das.jz%40bp.renesas.com%7Ce51e24d06083403a3d0e08d93ce73933%7C5
> > +3d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637607786063741484%7CUnknown%
> > +7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV
> > +CI6Mn0%3D%7C1000&amp;sdata=BIKHeHpyG3vloEEO02HzM6TtWqQtDlSGRMifOQVprPI%
> > +3D&amp;reserved=0
> > +$schema:
> > +https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevice
> > +tree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cbiju.das.jz%4
> > +0bp.renesas.com%7Ce51e24d06083403a3d0e08d93ce73933%7C53d82571da1947e49c
> > +b4625a166a4a2a%7C0%7C0%7C637607786063751443%7CUnknown%7CTWFpbGZsb3d8eyJ
> > +WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&
> > +amp;sdata=3XhlKhlwT3hr0KVjynaiMlqMC94tq3sEYgNH6LMf9Kc%3D&amp;reserved=0
> > +
> > +title: Binding for Renesas 8T49N241 Universal Frequency Translator
> > +
> > +description: |
> > +  The 8T49N241 has one fractional-feedback PLL that can be used as a
> > +  jitter attenuator and frequency translator. It is equipped with one
> > +  integer and three fractional output dividers, allowing the generation
> > +  of up to four different output frequencies, ranging from 8kHz to 1GHz.
> > +  These frequencies are completely independent of each other, the input
> > +  reference frequencies and the crystal reference frequency. The device
> > +  places virtually no constraints on input to output frequency
> > +conversion,
> > +  supporting all FEC rates, including the new revision of ITU-T
> > +  Recommendation G.709 (2009), most with 0ppm conversion error.
> > +  The outputs may select among LVPECL, LVDS, HCSL or LVCMOS output
> > levels.
> > +
> > +  The driver can read a full register map from the DT, and will use
> > + that  register map to initialize the attached part (via I2C) when the
> > + system  boots. Any configuration not supported by the common clock
> > + framework  must be done via the full register map, including optimized
> > settings.
> > +
> > +  The 8T49N241 accepts up to two differential or single-ended input
> > + clocks  and a fundamental-mode crystal input. The internal PLL can
> > + lock to either  of the input reference clocks or just to the crystal
> > + to behave as a  frequency synthesizer. The PLL can use the second
> > + input for redundant  backup of the primary input reference, but in
> > + this case, both input clock  references must be related in frequency.
> > +
> > +  All outputs are currently assumed to be LVDS, unless overridden in
> > + the  full register map in the DT.
> > +
> > +maintainers:
> > +  - Alex Helms <alexander.helms.jy@renesas.com>
> > +  - David Cater <david.cater.jc@renesas.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - 8t49n241
> > +
> > +  reg:
> > +    description: I2C device address
> > +    enum: [ 0x7c, 0x6c, 0x7d, 0x6d, 0x7e, 0x6e, 0x7f, 0x6f ]
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  clock-names:
> > +    description: Name of the input clock
> > +    minItems: 1
> > +    maxItems: 3
> > +    items:
> > +      enum: [ input-xtal, input-clk0, input-clk1 ]
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#clock-cells'
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    /* 25MHz reference clock */
> > +    input_clk0: input_clk0 {
> > +      compatible = "fixed-clock";
> > +      #clock-cells = <0>;
> > +      clock-frequency = <25000000>;
> > +    };
> > +
> > +    i2c@0 {
> > +        reg = <0x0 0x100>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        renesas8t49n241_1: clock-generator@6c {
> > +            compatible = "renesas,8t49n241";
> > +            reg = <0x6c>;
> > +            #clock-cells = <1>;
> > +
> > +            clocks = <&input_clk0>;
> > +            clock-names = "input-clk0";
> > +        };
> > +    };
> > +
> > +    /* Consumer referencing the 8T49N241 Q1 */
> > +    consumer {
> > +        /* ... */
> > +        clocks = <&renesas8t49n241_1 1>;
> > +        /* ... */
> > +    };
> > +  - |
> > +    /* 40MHz crystal */
> > +    input_xtal: input_xtal {
> > +      compatible = "fixed-clock";
> > +      #clock-cells = <0>;
> > +      clock-frequency = <40000000>;
> > +    };
> > +
> > +    i2c@0 {
> > +        reg = <0x0 0x100>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        renesas8t49n241_2: clock-generator@6c {
> > +            compatible = "renesas,8t49n241";
> > +            reg = <0x6c>;
> > +            #clock-cells = <1>;
> > +
> > +            clocks = <&input_xtal>;
> > +            clock-names = "input-xtal";
> > +
> > +            settings=[
> 
> optional or required property?
> 

My mistake, `settings` is optional and should be in the schema.
I'll fix this in the next patch version.

> > +                09 50 00 60 67 C5 6C FF 03 00 30 00 00 01 00 00
> > +                01 07 00 00 07 00 00 77 6D 06 00 00 00 00 00 FF
> > +                FF FF FF 00 3F 00 2A 00 16 33 33 00 01 00 00 D0
> > +                00 00 00 00 00 00 00 00 00 04 00 00 00 02 00 00
> > +                00 00 00 00 00 00 00 17 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 D7 0A 2B 20 00 00 00 0B
> > +                00 00 00 00 00 00 00 00 00 00 27 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                C3 00 08 01 00 00 00 00 00 00 00 00 00 30 00 00
> > +                00 0A 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > +                00 00 00 00 85 00 00 9C 01 D4 02 71 07 00 00 00
> > +                00 83 00 10 02 08 8C
> > +            ];
> > +        };
> > +    };
> > +
> 
> One question, 
> Full regmap or just overriding few registers which is better, assuming the device has default values programmed in OTP.
> Again that needs {offset, value}???

`settings` must be the full regmap. The next patch version will have that clarified in the schema description.
The intent here is the external configuration software produces optimized settings and the results are the full regmap.

> 
> Regards,
> Biju
> 
>  
> > +    /* Consumer referencing the 8T49N241 Q1 */
> > +    consumer {
> > +        /* ... */
> > +        clocks = <&renesas8t49n241_2 1>;
> > +        /* ... */
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0cce91cd5..882d79ead 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15575,6 +15575,12 @@ F:	include/linux/rpmsg/
> >  F:	include/uapi/linux/rpmsg.h
> >  F:	samples/rpmsg/
> > 
> > +RENESAS 8T49N24X DRIVER
> > +M:	Alex Helms <alexander.helms.jy@renesas.com>
> > +M:	David Cater <david.cater.jc@renesas.com>
> > +S:	Odd Fixes
> > +F:	Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> > +
> >  RENESAS CLOCK DRIVERS
> >  M:	Geert Uytterhoeven <geert+renesas@glider.be>
> >  L:	linux-renesas-soc@vger.kernel.org
> > --
> > 2.30.2
> 

Regards,

Alex

-- 
