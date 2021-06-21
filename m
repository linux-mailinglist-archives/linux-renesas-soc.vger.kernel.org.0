Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9905A3AE64E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhFUJqF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhFUJqF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:46:05 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC62C061756
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 02:43:50 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a16so2709956ljq.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Sm0Lp6dINqoZXGOoGrE9UkgpSIbveZOVAGO/5YEr9hk=;
        b=b9R8rgP7FnanRni4GCtZnM0xmpADAFMbu7VgeLkvQWGiV5Ar0fdjvjc5Bbz7rQouXP
         o8PiXPyZeFOdT0hMVjM4rorSMKUoJp/PlIJQDtneImtsyKbI8ficTmkn1hKgkw4l1aXQ
         LWoX5KxsP0aJpsSEi1IZBGtGzJZbSuyFD1k48HCWgauNqhbYoYL9e5FfVOO0Pvq8ZRh4
         ckV7Pp0W4pD64LGjRJxYOE1h2B3y3wNYuw5uzpopEygJqHiuLuIEjQz+/O83TKlExsnh
         FiOzsYmSQ92mHgQd6g+GxP8LVQ4AC8bSI8KlJYl9Oy3TrVrXQ2IICd/Iew9KAC1Bx2/F
         Ry4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Sm0Lp6dINqoZXGOoGrE9UkgpSIbveZOVAGO/5YEr9hk=;
        b=If8o8oVgy5570noqE0kJPCffTGjM5xhTLcXaxi8LZLCiNsPYxGhbx778oQH6uyfxQV
         IC3+f1MZq7onDtoIhGlMOAQDv44/MQieUVi4hjtF9KvrwE9+4I3B4qkBoj3g5AI6w1/Q
         e7+uI+4/8IaESF1MPrARpse12TuE5PP2rhuPhHAYW88H2NOEcUQwnS7lz5k7gmST8FAu
         XIRdiq3iJvDxfihc7yfT1VsFi9PWq1yZ/uZo66M0VBBDqGBqvugxdEM4b/wu61vSwlv7
         xQTC8d49hSoAsH6DqOHXXKtlS9JrchtLWrvd93m+BD/A9qskPg98bTw1js8fL4Q3Mg+/
         KNRg==
X-Gm-Message-State: AOAM532bAAb0p63dexCzmcVFIDOr0/mLS2W+A9pnU5wlkAWiHt26tEzp
        IhwILQVdSC7TeTIYy+kV7cM7Rw==
X-Google-Smtp-Source: ABdhPJzfS/+HLprV4W9nlcZ1i6AvgaGeSH4MS6jiCIGPPzGJTlG0P6M9vzARI113kHHaHAtIaV/I5A==
X-Received: by 2002:a2e:858a:: with SMTP id b10mr20562700lji.445.1624268628517;
        Mon, 21 Jun 2021 02:43:48 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id w8sm505246lfq.27.2021.06.21.02.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 02:43:48 -0700 (PDT)
Date:   Mon, 21 Jun 2021 11:43:47 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] mmc: renesas_sdhi: sys_dmac: abort DMA synced to avoid
 timeouts
Message-ID: <YNBfU1MLIjJJxmw3@oden.dyn.berto.se>
References: <20210621070009.13655-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210621070009.13655-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2021-06-21 09:00:09 +0200, Wolfram Sang wrote:
> When aborting DMA, we terminate the transfer without waiting for it to
> succeed. This may lead to races which can e.g. lead to timeout problems
> when tuning. Remove the deprecated dmaengine_terminate_all() function
> and use the explicit dmaengine_terminate_sync().
> 
> Fixes: e3de2be7368d ("mmc: tmio_mmc: fix card eject during IO with DMA")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Geert, this fixes the issue you have seen on your Koelsch board on my
> Lager board. Can you test again with this patch please?

I'm not exactly sure what problem Geert is experience but I 
unfortunately have tuning problems on Koelsch. The problem is the same 
with and without this patch however.

I'm trying on-top of v5.13-rc7 with and without this patch and this is 
what I experience.

# Insert card in SD0
[   57.794238] mmc0: new ultra high speed SDR104 SDHC card at address aaaa
[   57.801363] mmcblk0: mmc0:aaaa SL32G 29.7 GiB (ro)
[   57.820427] GPT:partition_entry_array_crc32 values don't match: 0x9ad84b1 != 0xb110df4b
[   57.828456] GPT:Primary header thinks Alt. header is not at the end of the disk.
[   57.835901] GPT:11526300 != 62333951
[   57.839484] GPT:Alternate GPT header not at the end of the disk.
[   57.845514] GPT:11526300 != 62333951
[   57.849093] GPT: Use GNU Parted to correct GPT errors.
[   57.854306]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12

# Eject card and insert it in SD1
[   70.261657] mmc0: tuning execution failed: -5
[   70.266377] mmc0: card aaaa removed
[   77.769959] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD52)
[   82.889951] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD52)
[   88.009948] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD0)
[   93.129966] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD8)
[   98.249955] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  103.369944] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  108.489946] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  113.609921] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  118.729885] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD55)
[  123.849848] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD55)
[  128.969823] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD55)
[  134.089817] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD55)
[  139.209774] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD1)
[  144.409755] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD52)
[  149.529735] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware 
interrupt (CMD52)
[  154.649720] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD0)
[  159.769709] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD8)
[  164.889693] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  170.009685] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  175.129729] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  180.249673] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  185.369656] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD55)
[  190.489650] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD55)
[  195.609654] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD55)
[  200.729631] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD55)
[  205.849630] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD1)
[  211.049615] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD52)
[  216.169621] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD52)
[  221.289616] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD0)
[  226.409611] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD8)
[  231.529605] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  236.649600] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  241.769580] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  246.889543] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
[  252.009503] sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD55)
... timeout messages continue ...

The experience is the same if I directly insert the card in SD1 after a 
reset, I only included the SD0 cycle to verify the card itself is good.

I tested on v5.12 and there the card works but is identified as SDR50,

# Insert into SD1
[  102.667405] mmc0: new ultra high speed SDR50 SDHC card at address aaaa
[  102.676211] mmcblk0: mmc0:aaaa SL32G 29.7 GiB (ro)
[  102.695241] GPT:partition_entry_array_crc32 values don't match: 0x9ad84b1 != 0xb110df4b
[  102.703312] GPT:Primary header thinks Alt. header is not at the end of the disk.
[  102.710754] GPT:11526300 != 62333951
[  102.714335] GPT:Alternate GPT header not at the end of the disk.
[  102.720360] GPT:11526300 != 62333951
[  102.723937] GPT: Use GNU Parted to correct GPT errors.
[  102.729158]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12

Maybe there are more then one patch needed to fix this? Should I rerun 
my test on a different base?

> 
> I noticed that Renesas driver are quite an active user of this
> deprecated dmaengine function. I will audit and improve the other
> drivers meanwhile.
> 
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index ffa64211f4de..6956b83469c8 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -108,9 +108,9 @@ static void renesas_sdhi_sys_dmac_abort_dma(struct tmio_mmc_host *host)
>  	renesas_sdhi_sys_dmac_enable_dma(host, false);
>  
>  	if (host->chan_rx)
> -		dmaengine_terminate_all(host->chan_rx);
> +		dmaengine_terminate_sync(host->chan_rx);
>  	if (host->chan_tx)
> -		dmaengine_terminate_all(host->chan_tx);
> +		dmaengine_terminate_sync(host->chan_tx);
>  
>  	renesas_sdhi_sys_dmac_enable_dma(host, true);
>  }
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas Söderlund
