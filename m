Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C622C3A1E62
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 22:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhFIU6k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 16:58:40 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:56132 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229527AbhFIU6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 16:58:39 -0400
Received: from [77.244.183.192] (port=64840 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lr5Fi-0003sy-IX; Wed, 09 Jun 2021 22:56:42 +0200
Subject: Re: [PATCH v5] dt-bindings: clk: versaclock5: Miscellaneous fixes and
 improvements:
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20210316162643.2442885-1-geert+renesas@glider.be>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <4d2edd16-2ca5-c732-d075-5c913e13114a@lucaceresoli.net>
Date:   Wed, 9 Jun 2021 22:56:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316162643.2442885-1-geert+renesas@glider.be>
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

Hi All,

On 16/03/21 17:26, Geert Uytterhoeven wrote:
>   - Remove unneeded references for "idt,xtal-load-femtofarads" and
>     "idt,slew-percent", as vendor specific properties having a standard
>     unit suffix don't need a type,
>   - Add missing "additionalProperties: false" for subnodes, to catch
>     typos in properties,
>   - Fix property names in example.
> 
> Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

This patch seems to have gone MIA. It really should be applied. Geert,
would you please rebase&resend in case it does not not apply anymore?
(or tell me if you prefer me to take it over)

> ---
> This depends on dt-schema v2021.2.1.
> 
> v4:
>   - Add Reviewed-by, Acked-by,
> 
> v3:
>   - Drop references for "idt,voltage-microvolt" and "idt,slew-percent",
> 
> v2:
>   - Settle on "idt,voltage-microvolt", cfr. commit 4b003f5fcadfa2d0
>     ('clk: vc5: Use "idt,voltage-microvolt" instead of
>     "idt,voltage-microvolts"'),
>   - Drop reference to clock.yaml, which is already applied
>     unconditionally,
>   - Drop removal of allOf around if condition, as it is unnecessary
>     churn.
> 
> squash! dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:

heh, should be removed, but is's after --- so not a big deal.


-- 
Luca
