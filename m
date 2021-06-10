Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979F63A302B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 18:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhFJQJT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 12:09:19 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:59105
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230117AbhFJQJS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 12:09:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0k5nIkOuUI5vsffjTDiRujqcUmPHWpDFeuLa8pAnGCTg32lXH8AmVzqpNuo4uSMbXdQZ1RPJpShtRO2Flh2z3BqK6W++9uckoDDACcOgSqphhZatHcYeCrqYw/g2ymE07xNssuPN5hcG8K3jGVJv57yRNcdfNZZUhyjj1PMoPG4ReXY/1pj1QjXj/2jn3K8U5tDAGNKMnbOjQgpjWD3PUdrykYNMKieq2a0uy+SobikZVGagOzrM5RGENGoGXPJBOncv7iw+E9KQc85Z9Z1RKxLENvxzgeo/PL1Am1f5lnDkmvevtp7yONKUrH0EpYkA1vGz0oq2GuvacYh5ADPbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdWzEfQfKcI2CmYDEyKHyd+jPw+4/vxMDL4JYPbGPDI=;
 b=dpxcfUSKJQn+Hj6ymLpKPF5DcZglUAHrYQuSRdsj5t4Fzb8L9AeDhlNfkjZMtmWuw92FSRVkCYaBlwasNLvTsm9eec2wR8yrdrMIaxJhBV3Nbpwy5b/iwuNj7Fk5bOsuOuJuSrGMKjOPLEomU0bo3hMfNSbfpucJ3yB1cEe5XhO6sOjj18gXxNFAh7uOu42kTdLIMYTrPpx8HPiyPB3J1lADfS2h5wrZduVQPqi0q2UEljbkiRXTpm1kRNJd9VJ+/6DGNhvWbZXvPB1DeGNzq52f0bK7HMWL097BGSi3EQdC/3Dk+sb/qroOumw8PmA4crnlTcNEs5Vq2GQwJJctIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdWzEfQfKcI2CmYDEyKHyd+jPw+4/vxMDL4JYPbGPDI=;
 b=Zto8EcnSFkrCAEum8ob7q+DmS0ir4mPPlcW9jjGccI6jPvkJ1OBhOlD6cDvy5hEw1pZMipGJS6xJ0Kd8ZJH7IvXDe5s0EbG2ViXbbUQj+Y7NbpMwwW8Ex8piXo84pDHzRxl9eHAbKv0fZnK0gVguiXIMedkrZsB0BAT2cZHdMFk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB8PR03MB6203.eurprd03.prod.outlook.com (2603:10a6:10:140::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 16:07:19 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 16:07:18 +0000
Subject: Re: [PATCH v6] dt-bindings: clk: versaclock5: Miscellaneous fixes and
 improvements:
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <46310530171886c6ccf4046518e07510274a506c.1623308843.git.geert+renesas@glider.be>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <cc489743-1228-9f4f-5c2a-1763e9b40431@seco.com>
Date:   Thu, 10 Jun 2021 12:07:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <46310530171886c6ccf4046518e07510274a506c.1623308843.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL1P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::29) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BL1P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 16:07:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c937e143-8cd2-4a42-8e1f-08d92c29d26d
X-MS-TrafficTypeDiagnostic: DB8PR03MB6203:
X-Microsoft-Antispam-PRVS: <DB8PR03MB6203300A974F9B5D6AADE4DB96359@DB8PR03MB6203.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mYIZJegcV7/ejZNZHkjLcQ9HwNcGO7bHPD1Wvym9LrdoNdosDjlQRTy084KEMQC/NQrTc8o3l/mlUPpLfr99mQY7leMmSzAfkjlQ6TexnfcLGlUVzY6SOjjSMUxEZ49EGg7uNmKok9Y2t8NhBSk6ZEEWijLg6NnyuvasG1PGBILvtYu+FYH7mLzBHb4f9FFC0EhEJwcQMJjrSWUQ2DgX0dNAU+sGAl772Mck2hli0sSrrr3/SsXHPdz33O5AtkwmVbIaNByDeXd1N98dI8le6OOtaKurUEdOPQINY8wOv5uXjd/XxzpkoN1N1yzEjtIqajr/2HDavIuk9M/kihYJGcRmE72YPCV+OL6THjhYLzjwq5NG6m8Ue80+dgM2c2a2vJEovEJyHvHj9vnUWhMiq8o+809vn0ky8vYWhZX4cQpp/Yjh7jB200rnudUjRYe/i+ck+evn6H49uWa3U3k/C4Kr5Au5az7dx+Z+mranydbDQtbjoLi5Mgl44X6V5LwddcafxsEM2IeauJL5FDFcaqSWBT2gB/ga+O8GPfcPU14vwJ9mxpWo058mgUrPQSBf2u30GCrxqaJgiLCIP4j3K3j60tYQXq1vw4ajGR/wUQwf/6z7ZvyVBnfq8OPPbvSDh8w38lR3FyK8hzHGPKdDDpcRjMxFkp3NR3e+THLiaPR4dZIfIkU1toLzy2C14952EYMXJ2fOzMvsUNI88bqpJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39850400004)(366004)(136003)(5660300002)(2906002)(31686004)(52116002)(8936002)(186003)(86362001)(53546011)(16526019)(110136005)(16576012)(6486002)(316002)(54906003)(478600001)(38350700002)(956004)(6666004)(4326008)(26005)(7416002)(36756003)(66476007)(66946007)(83380400001)(66556008)(44832011)(38100700002)(8676002)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SktPcDhpYzM1bUMyUDkxMXc4SmNGNkwwRm5WWGoxdCtteHNyTnprYkkzV29N?=
 =?utf-8?B?SHp4OWFpYTdLTk1uUytIRjVrZ3lzZ1NxM0lPRUNHVmpMb09oc25aeVhPTzZD?=
 =?utf-8?B?QVFSZHRBNEhSV2ladHJsNjhJY0R0YVQzd2t6aWtQcURTaTcrTlBJWmI4TWs3?=
 =?utf-8?B?VTlWc3BNWmF4ZVlueUlvcjV5SWo3RVp0am9MUTBJRjBNa2YvVGhnSjl4M3BG?=
 =?utf-8?B?QzhWUlUwR29PUm5zL0NLbjZFYUVhQ3NkVnJNWTgvWlZieWdaYjY1TDlrZitC?=
 =?utf-8?B?SnlFc0JrK0JuWDRzSXlyeUlyZkpyK0krZXBFWlZLSjB2SWU2UENpUmxBaXR4?=
 =?utf-8?B?cGQxS3JhejlJYUtqQ1dXNzNLYkV0OGhOSUQ0ZTRzcUVXM1ZkYjhSejk5MEJ1?=
 =?utf-8?B?QVE2dUMyVmVhbHJ6T20rRy9YS0RKREZBYUFPdElEZkZMdWpqdm5oYWkrZFl4?=
 =?utf-8?B?dXYwcnd6VXR6Sk10RHdQS3BhZ0d4V1ZZc2FXbVVGNXZwY3plUTVYRXA0M2hp?=
 =?utf-8?B?anR0a3krNUdvNEJyMERJeVl2VVpEMzVSb1lzd2xoODdwUnMrb204dS9YbXlh?=
 =?utf-8?B?VnRPbXVLOWErdEgrN0FtbjcrSXlMUzhZU0xpaDBGWVhXYndIejdUWGJwSWpv?=
 =?utf-8?B?N0ZrZ3p0MXloaGI2NVhJMVpHbE5WTlZ0eE9Ob3dpbHE1NnljcXBnYVZjQ1k4?=
 =?utf-8?B?bzVJOEhWVUFSVnZTSW5Kai9zbCtndGFPeS9tdERiTm5GSThpTnZnZmcydnlI?=
 =?utf-8?B?eEROSmlQM3QrMkdKRkpVYUFxOEdlVlR4MS9KMENGTkdNVlppNnluejhIK1B4?=
 =?utf-8?B?M3pad0h6VTNFTzVYZ2ZNcVRZYU9CZVQrL1FtVkp4Vlp6TXl6cE9rMW1uQzB1?=
 =?utf-8?B?UWM5RGtMMXNqcTJOczhwTENGeHRvSS9tUGlPcm1oUnlXSFNNcmM1dDlJSW4x?=
 =?utf-8?B?aTNreUZhdjhTcFRMY1g3ajFDaW9zaGM4d2tsc0lnRG5SOHdoUE00b25OdTdh?=
 =?utf-8?B?UVVwSFJSMmN5L2VlYzVVdkN0QTdXS3R4ajJGREdOYjlmTERoYnFEaElMbnU5?=
 =?utf-8?B?MVFtaGdEbENETkY0bFllWkV5Y0hUMFIzeFY0akIvZ25BK1N3M2s2d2hBMkpB?=
 =?utf-8?B?VHl4VjQ1dXdRa2ZwdmREb1lzTmRhMFAvTGRoKzlNWU5tdHVCRUlvcitLakZp?=
 =?utf-8?B?SElxTHF2RG5DYThGMmZyTVJkVHJ3Smo5RXhqNGFFS0h2UWp6ZkVtcEErQmFV?=
 =?utf-8?B?RjU0ZVhieC8yZm9RUFhKS1U0cU40czZ5dzBsVVAvYTlCTm9vMUNMaE1valVL?=
 =?utf-8?B?SFlXUVROQlhPWlYraWpCTTh6anlCOW9UTFhHNzNab3h6ZDNzdkV2YnJhc0NW?=
 =?utf-8?B?Z3hBVjVlcVdxeFZ2YnZCcGluelc2RGt2aW9KY2l0TzNzMFJUMlM1M3AxNVA4?=
 =?utf-8?B?eGlSd0c0T1JxUGwwdCtSVkhYK2tuemdTQ2xNNGlxMTk4OGwyWFZZTkhyUjF0?=
 =?utf-8?B?cGdyM2RyWHlBcFU4ZHJPNS9YZnh0ZUxyTEpJMStWd2FGWUlVZElVWG5FNUV1?=
 =?utf-8?B?anJNbjF1NTZmVXRwMjdwaFRjeDhrTGp5TVhZV043d012cmxRRmE2Y0NOYytQ?=
 =?utf-8?B?aHN6Wk1RS21qVURDWlhyd0ZvM3BWVkdYd2lSVXhVbTZFZmk3Y3N4eWtFSWlY?=
 =?utf-8?B?K1RtcWppU3dlRnIyRE9rRi9uRGp5T3ZTbjc0bUdocEp1c0RqdFVBSVhRaHkv?=
 =?utf-8?Q?RUoKPyaBQjJUyd7YVmEt23WMJ2xKSDOYcPADBdx?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c937e143-8cd2-4a42-8e1f-08d92c29d26d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 16:07:18.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgbqGGE6NG3qbE0KmD3f3ci6ViBQLZHDmbwOQttBGgw2INwueC7k8GS36ZuGtcrjyaGAix1PrSPDqa+MpL3s/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6203
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org




On 6/10/21 3:09 AM, Geert Uytterhoeven wrote:
 >    - Add missing "additionalProperties: false" for subnodes, to catch
 >      typos in properties,
 >    - Fix property names in example.
 >
 > Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
 > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
 > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Reviewed-by: Rob Herring <robh@kernel.org>
 > Acked-by: Stephen Boyd <sboyd@kernel.org>
 > ---
 > This depends on dt-schema v2021.2.1.
 >
 > v6:
 >    - Rebase on top of commit c17611592d9635c4 ("dt-bindings: More
 >      removals of type references on common properties"), which already
 >      removed unneeded references for "idt,xtal-load-femtofarads" and
 >      "idt,slew-percent",
 >
 > v5:
 >    - Drop reference for "idt,xtal-load-femtofarads",
 >
 > v4:
 >    - Add Reviewed-by, Acked-by,
 >
 > v3:
 >    - Drop references for "idt,voltage-microvolt" and "idt,slew-percent",
 >
 > v2:
 >    - Settle on "idt,voltage-microvolt", cfr. commit 4b003f5fcadfa2d0
 >      ('clk: vc5: Use "idt,voltage-microvolt" instead of
 >      "idt,voltage-microvolts"'),
 >    - Drop reference to clock.yaml, which is already applied
 >      unconditionally,
 >    - Drop removal of allOf around if condition, as it is unnecessary
 >      churn.
 > ---
 >   .../devicetree/bindings/clock/idt,versaclock5.yaml        | 8 +++++---
 >   1 file changed, 5 insertions(+), 3 deletions(-)
 >
 > diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
 > index 28675b0b80f1ba53..434212320c9aa7ab 100644
 > --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
 > +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
 > @@ -85,6 +85,8 @@ patternProperties:
 >           description: The Slew rate control for CMOS single-ended.
 >           enum: [ 80, 85, 90, 100 ]
 >
 > +    additionalProperties: false
 > +
 >   required:
 >     - compatible
 >     - reg
 > @@ -139,13 +141,13 @@ examples:
 >               clock-names = "xin";
 >
 >               OUT1 {
 > -                idt,drive-mode = <VC5_CMOSD>;
 > -                idt,voltage-microvolts = <1800000>;
 > +                idt,mode = <VC5_CMOSD>;
 > +                idt,voltage-microvolt = <1800000>;
 >                   idt,slew-percent = <80>;
 >               };
 >
 >               OUT4 {
 > -                idt,drive-mode = <VC5_LVDS>;
 > +                idt,mode = <VC5_LVDS>;
 >               };
 >           };
 >       };
 >

I lost an hour the other day tracking down why my clocks weren't
configured correctly because I had copied my base configuration from the
example here.

Reviewed-by: Sean Anderson <sean.anderson@seco.com>
