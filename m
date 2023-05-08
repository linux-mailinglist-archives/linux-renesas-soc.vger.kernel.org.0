Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150486FB049
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 14:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbjEHMjc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 08:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234626AbjEHMj2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 08:39:28 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CEE394A0;
        Mon,  8 May 2023 05:39:17 -0700 (PDT)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id DDD051BF205;
        Mon,  8 May 2023 12:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1683549555;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GBpPTSvjJBodq2hEUh+TCqSl291LoN170O0uNswowTg=;
        b=FCdBkLtYMFXKTLIhxQidLZ6ZHTsZ4TgPd/ccHxlEhAcdICE0SIW0g/RPUj2kPEFw8nh/M4
        Nt0FKUIkaVvWSbYoOWyZwEQbrswQR/X3SD+PClP8jLGNG4mZSbCK9kzrPbZr79ptYHDqMJ
        y4TFe+9thtFdWV/pcYYNXyjInYOoF1PnUUnxCYnkpfTXhMA/LeANAyEQEXKwbRfS/QCFX4
        n31XOIg/ukx2n6TBPsBTVACavfoJ+eP6XntZWeATLnhCpH3+ucqYkHgXtfTJ/yUzZPyGRK
        aXVlSy+tvkEQq2qxFgNB1/3fFO7ySzfZP+2Tpxa2g74XQxeX0GuF66iYd/XhuQ==
Date:   Mon, 8 May 2023 14:39:12 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc:     linux-clk@vger.kernel.org,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <sboyd@kernel.org>, Tom Rix <trix@redhat.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: vc5: Fix .driver_data content in i2c_device_id
Message-ID: <20230508143912.741e67a5@booty>
In-Reply-To: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org>
References: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Sun,  7 May 2023 15:39:04 +0200
Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:

> The .driver_data content in i2c_device_id table must match the
> .data content in of_device_id table, else device_get_match_data()
> would return bogus value on i2c_device_id match. Align the two
> tables.
> 
> The i2c_device_id table is now converted from of_device_id using
> 's@.compatible = "idt,\([^"]\+"\), .data = \(.*\)@"\1, .driver_data = (kernel_ulong_t)\2@'
> 
> Fixes: 9adddb01ce5f ("clk: vc5: Add structure to describe particular chip features")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Alex Helms <alexander.helms.jy@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tom Rix <trix@redhat.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/clk/clk-versaclock5.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index fa71a57875ce..5452471b7ba5 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -1271,14 +1271,14 @@ static const struct vc5_chip_info idt_5p49v6975_info = {
>  };
>  
>  static const struct i2c_device_id vc5_id[] = {
> -	{ "5p49v5923", .driver_data = IDT_VC5_5P49V5923 },
> -	{ "5p49v5925", .driver_data = IDT_VC5_5P49V5925 },
> -	{ "5p49v5933", .driver_data = IDT_VC5_5P49V5933 },
> -	{ "5p49v5935", .driver_data = IDT_VC5_5P49V5935 },
> -	{ "5p49v60", .driver_data = IDT_VC6_5P49V60 },
> -	{ "5p49v6901", .driver_data = IDT_VC6_5P49V6901 },
> -	{ "5p49v6965", .driver_data = IDT_VC6_5P49V6965 },
> -	{ "5p49v6975", .driver_data = IDT_VC6_5P49V6975 },
> +	{ "5p49v5923", .driver_data = (kernel_ulong_t)&idt_5p49v5923_info },
> +	{ "5p49v5925", .driver_data = (kernel_ulong_t)&idt_5p49v5925_info },
> +	{ "5p49v5933", .driver_data = (kernel_ulong_t)&idt_5p49v5933_info },
> +	{ "5p49v5935", .driver_data = (kernel_ulong_t)&idt_5p49v5935_info },
> +	{ "5p49v60", .driver_data = (kernel_ulong_t)&idt_5p49v60_info },
> +	{ "5p49v6901", .driver_data = (kernel_ulong_t)&idt_5p49v6901_info },
> +	{ "5p49v6965", .driver_data = (kernel_ulong_t)&idt_5p49v6965_info },
> +	{ "5p49v6975", .driver_data = (kernel_ulong_t)&idt_5p49v6975_info },

Apparently nobody even used i2c device ids, otherwise this would have
gone loudly bad!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
