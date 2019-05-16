Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AACB820714
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 14:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfEPMkb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 08:40:31 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:36011 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbfEPMka (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 08:40:30 -0400
Received: by mail-vk1-f196.google.com with SMTP id l199so982031vke.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 May 2019 05:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=btagSI9Gl2/GwBYAPxz9nOxdN5Hj6wET211aITJqodo=;
        b=S5qhUDQohTOPUEfBGF3gv4PM2hTGzLK/tC2EqCOJGH7G+bDAMVyiz+EDXRWPbzaqy2
         MFKELpGcDWY7CFYkGs51S/YqlG6EMNia84BWwx3EXFr3NIK5yfPqNvBn7HfbOmzbQYX7
         43VwbFTUCWUhfPiDn7FxoNjwQa7scUe3FPLFzoBbUh6adjlKojOCYbyaNbZYJFiUM58u
         cHjAuF4+9TMqLWCT4FTOu9f7aurwTmwL8pi5uoRWTzuTW7K/s8M8gPS5Q6lCmcBn9Kzp
         w0wYm+1f09CkoA1UgptflnK0UfQmOEjDcRto7dFyUnOm7QpjjdzsZDlRoaPCL1vWCYHz
         hG2w==
X-Gm-Message-State: APjAAAVmDf22tzH4697cd7njHz0dWquZnjR4xhC9Xuwv4E1dlv8o9yf9
        FO23tcrEroIlxLVV21rWD9gkzvhkoC/wgXU9pbPR8rc4
X-Google-Smtp-Source: APXvYqyyCL8f4vLcCQsduopGb3kyZKqIXSekfaRxdQEcg5jVshpH4W3aBC2PzClodQh1iYsLgyyWgc1CA77F6+++6UY=
X-Received: by 2002:a1f:c2c1:: with SMTP id s184mr22907966vkf.65.1558010429748;
 Thu, 16 May 2019 05:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <1557927786-29557-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1557927786-29557-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 May 2019 14:40:18 +0200
Message-ID: <CAMuHMdUnMhDyEoFDs05WKU=0PtV2FmAxuGWFhf7ekxfK=Y5gSg@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: phy-rcar-gen2: Fix the array off by one warning
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, May 15, 2019 at 3:50 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Fix the below smatch warning by adding variable check rather than the
> hardcoded value.
> warn: array off by one? 'data->select_value[channel_num]'
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

While your patch is correct (to the best of my knowledge), I think the
code can be made more maintainable by using ARRAY_SIZE().

> --- a/drivers/phy/renesas/phy-rcar-gen2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen2.c
> @@ -71,6 +71,7 @@ struct rcar_gen2_phy_driver {
>  struct rcar_gen2_phy_data {
>         const struct phy_ops *gen2_phy_ops;
>         const u32 (*select_value)[PHYS_PER_CHANNEL];
> +       const u32 last_channel;

num_channels? (which is one more than last_channel)

>  };
>
>  static int rcar_gen2_phy_init(struct phy *p)
> @@ -271,11 +272,13 @@ static const u32 usb20_select_value[][PHYS_PER_CHANNEL] = {
>  static const struct rcar_gen2_phy_data rcar_gen2_usb_phy_data = {
>         .gen2_phy_ops = &rcar_gen2_phy_ops,
>         .select_value = pci_select_value,
> +       .last_channel = 2,

.num_channels = ARRAY_SIZE(pci_select_value)

>  };
>
>  static const struct rcar_gen2_phy_data rz_g1c_usb_phy_data = {
>         .gen2_phy_ops = &rz_g1c_phy_ops,
>         .select_value = usb20_select_value,
> +       .last_channel = 0,

.num_channels = ARRAY_SIZE(usb20_select_value)

>  };
>
>  static const struct of_device_id rcar_gen2_phy_match_table[] = {
> @@ -389,7 +392,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
>                 channel->selected_phy = -1;
>
>                 error = of_property_read_u32(np, "reg", &channel_num);
> -               if (error || channel_num > 2) {
> +               if (error || channel_num > data->last_channel) {

>= data->num_channels

>                         dev_err(dev, "Invalid \"reg\" property\n");
>                         return error;
>                 }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
