Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7512DEBFB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Dec 2020 00:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgLRXYM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 18:24:12 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:47346 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726011AbgLRXYM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 18:24:12 -0500
X-Greylist: delayed 3886 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Dec 2020 18:24:10 EST
Received: from [77.244.183.192] (port=64434 helo=[192.168.178.24])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kqO5D-00G3A9-EN; Fri, 18 Dec 2020 23:18:43 +0100
Subject: Re: [PATCH] clk: vc5: Use "idt,voltage-microvolt" instead of
 "idt,voltage-microvolts"
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201218125253.3815567-1-geert+renesas@glider.be>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <0b3f6954-273c-d15d-94c3-a80c7df23f56@lucaceresoli.net>
Date:   Fri, 18 Dec 2020 23:18:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218125253.3815567-1-geert+renesas@glider.be>
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

On 18/12/20 13:52, Geert Uytterhoeven wrote:
> Commit 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to
> yaml") accidentally changed "idt,voltage-microvolts" to
> "idt,voltage-microvolt" in the DT bindings, while the driver still used
> the former.
> 
> Update the driver to match the bindings, as
> Documentation/devicetree/bindings/property-units.txt actually recommends
> using "microvolt".
> 
> Fixes: 260249f929e81d3d ("clk: vc5: Enable addition output configurations of the Versaclock")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> There are no upstream users yet, but they are planned for v5.12, so I
> think this should be in v5.11-rc1.
> 
> Thanks!
> ---
>  drivers/clk/clk-versaclock5.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index c90460e7ef2153fe..43db67337bc06824 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -739,8 +739,8 @@ static int vc5_update_power(struct device_node *np_output,
>  {
>  	u32 value;
>  
> -	if (!of_property_read_u32(np_output,
> -				  "idt,voltage-microvolts", &value)) {
> +	if (!of_property_read_u32(np_output, "idt,voltage-microvolt",
> +				  &value)) {

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Now the example in the bindings needs the same fix. I guess you doing it
in your "Miscellaneous fixes and improvements" v2 series, otherwise I
can do that.

Thanks,
-- 
Luca
