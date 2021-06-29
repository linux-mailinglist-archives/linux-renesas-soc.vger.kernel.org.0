Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8923F3B723B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jun 2021 14:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbhF2Mpf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Jun 2021 08:45:35 -0400
Received: from mail-vk1-f181.google.com ([209.85.221.181]:46726 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbhF2Mpe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jun 2021 08:45:34 -0400
Received: by mail-vk1-f181.google.com with SMTP id j22so3505379vka.13;
        Tue, 29 Jun 2021 05:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2lzgA/wsbrr6eZNe9W+RHZOh2v+Uu4exjNbNfHqsk8o=;
        b=fq04FAyLQeWyQA8AZQLhxCNx0reMiHamcKf2U83D9qGP3ZE/ViY6ZwUYxY0KOn6fVb
         smWyyRRhYdZB4xAhJYjstzI6CryYpIc/yYHe9siGid+tFmAsEtSrHDkCBGIDnaVR+LCy
         38MZY1GcxUw2FYJ0BIop77y9/FZbkpRunkkS/2knzwf/imdGHbvHBgnka0qbaGhxfyGj
         MuCMj9uO4Uk3RFDXTijntxZalSuUI8erMJENueOkaXs0S5JjJHUbkv9avksTTeAg9rjD
         F8TbUs6vzsBZmX8WXCfzlLR+W+3Nvp/iIXw41pBVKMalqy59mNfC7lfGscTuedEY+B+D
         ssYQ==
X-Gm-Message-State: AOAM532W/UQ2baVkvtMW5elwZOj78uKBN8U428QRn3j8Xiu+bB6on+RW
        6A8urcG157U37v0WuxscRLG5CZ5x3DqhdC5gs9c=
X-Google-Smtp-Source: ABdhPJyf8UAFHpIQZtc4dzO2R2G/LvSktIL8LANnB3R5dwdYexMwq5dOKYiIkSUX/qsjewPY5UDmi2o79cbzGyV3/JM=
X-Received: by 2002:a1f:1a41:: with SMTP id a62mr21399293vka.5.1624970586455;
 Tue, 29 Jun 2021 05:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210614155437.3979771-1-sean.anderson@seco.com>
 <20210614155437.3979771-2-sean.anderson@seco.com> <47b37414-6587-0792-201b-e255feeee9c9@lucaceresoli.net>
 <3174eed5-1078-68c4-4d98-95c448cd0940@seco.com>
In-Reply-To: <3174eed5-1078-68c4-4d98-95c448cd0940@seco.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Jun 2021 14:42:55 +0200
Message-ID: <CAMuHMdW9LMuQLuPEF-Fcs1E6Q7dDzY17VZqu4awKDj5WSTRt=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: vc5: Add properties for configuring SD/OE behavior
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kieran Bingham <kbingham@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sean,

On Thu, Jun 17, 2021 at 4:53 PM Sean Anderson <sean.anderson@seco.com> wrote:
> On 6/16/21 11:41 AM, Luca Ceresoli wrote:
>  > On 14/06/21 17:54, Sean Anderson wrote:
>  >> The SD/OE pin may be configured to enable output when high or low, and
>  >> to shutdown the device when high. This behavior is controller by the SH
>  >> and SP bits of the Primary Source and Shutdown Register (and to a lesser
>  >> extent the OS and OE bits). By default, both bits are 0, but they may
>  >> need to be configured differently, depending on the external circuitry
>  >> controlling the SD/OE pin.
>  >>
>  >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>  >
>  > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
>  >
>  >> @@ -914,6 +915,15 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  >>             return PTR_ERR(vc5->regmap);
>  >>     }
>  >>
>  >> +   oe_polarity = of_property_read_bool(client->dev.of_node,
>  >> +                                       "idt,output-enable-active-high");
>  >> +   sd_enable = of_property_read_bool(client->dev.of_node,
>  >> +                                     "idt,enable-shutdown");
>  >> +   regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN,
>  >> +                      VC5_PRIM_SRC_SHDN_SP | VC5_PRIM_SRC_SHDN_EN_GBL_SHDN,
>  >> +                      (oe_polarity ? VC5_PRIM_SRC_SHDN_SP : 0)
>  >> +                      | (sd_enable ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0));
>  >> +
>  >
>  > Did you test all combinations?
>
> No. I only tested "idt,output-enable-active-high". Though I also in
> effect tested the default case (both zero) as well.
>
> One potential impact of this patch could be that systems which enabled
> the SP and SH bits via OTP could end up inadvertently disabling them
> because they need to add the appropriate property. Maintaining full
> backwards compatibility would require a tri-state property of some kind.

And that seems to be exactly what's happening for me...

I've just discovered a failure on Renesas Salvator-XS caused by this
patch, which is now commit e26b493f3495e8a2 ("clk: vc5: Add properties
for configuring SD/OE behavior") in clk-next:

    [dm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:76:crtc-3]
flip_done timed out
    [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
    [...]

Printing the value of VC5_PRIM_SRC_SHDN before/after the update:

    vc5 4-006a: vc5_probe:945: 0x8a
    vc5 4-006a: vc5_probe:951: 0x88

My initial bisection failed, as the register contents are retained
across a reset.  Hence booting a "good" kernel after a "bad" kernel
still fails, unless the VC5 is power-cycled in between.

So I think we do need separate "idt,output-enable-active-low" and
"idt,disable-shutdown" properties, and not touch the bits if none of
the corresponding properties is present.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
