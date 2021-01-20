Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654612FD52B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jan 2021 17:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390572AbhATQNF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jan 2021 11:13:05 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:49813 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391280AbhATQJe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 11:09:34 -0500
Received: from [77.244.183.192] (port=62062 helo=[192.168.178.24])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1l2G2I-005oUX-7K; Wed, 20 Jan 2021 17:08:46 +0100
Subject: Re: [PATCH v2] dt-bindings: clk: versaclock5: Miscellaneous fixes and
 improvements:
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Adam Ford <aford173@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20210114125650.2233045-1-geert+renesas@glider.be>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <6d7a8180-b10d-481f-a3ca-05c37c17cb1a@lucaceresoli.net>
Date:   Wed, 20 Jan 2021 17:08:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114125650.2233045-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 14/01/21 13:56, Geert Uytterhoeven wrote:
>   - Add missing reference for "idt,voltage-microvolt",
>   - Add missing "additionalProperties: false" for subnodes, to catch
>     typos in properties,
>   - Fix property names in example.
> 
> Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Settle on "idt,voltage-microvolt", cfr. commit 4b003f5fcadfa2d0
>     ('clk: vc5: Use "idt,voltage-microvolt" instead of
>     "idt,voltage-microvolts"'),
>   - Drop reference to clock.yaml, which is already applied
>     unconditionally,
>   - Drop removal of allOf around if condition, as it is unnecessary
>     churn.
> ---
>  .../devicetree/bindings/clock/idt,versaclock5.yaml       | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> index 2ac1131fd9222a86..70239f992d714ae0 100644
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> @@ -75,12 +75,15 @@ patternProperties:
>          maximum: 6
>        idt,voltage-microvolt:
>          description: The output drive voltage.
> +        $ref: /schemas/types.yaml#/definitions/uint32

"Vendor specific properties having a standard unit suffix don't need a
type." -- Documentation/devicetree/bindings/example-schema.yaml

The rest looks good.

-- 
Luca
