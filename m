Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 657B666E323
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jan 2023 17:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjAQQLd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Jan 2023 11:11:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbjAQQL3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2023 11:11:29 -0500
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F293EFC8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 08:11:22 -0800 (PST)
Received: by mail-qt1-f174.google.com with SMTP id q15so3675733qtn.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 08:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3UAyVMyM/yDHTatNEnR18gPOWu6z3DIA5bneSXBq48=;
        b=adt08OdYuk7Cx/un6vJv5ruwrUckGPlYvdJ/mQr+ZvoNJ3oOunBizhV144c7lQyOSG
         aNi1EKEzaqxLlqSZ1p01tnDJzppQaflidXEtzmWXjK22A530HEwaKBsp/SZIovHbfKRA
         ebuZ9gdcpG1OVwyAvuX7/hqSFlhgbcHmlaehRahC39Fcn2HWKXhTEStQt6AlnAn61OQn
         0EgNtBCGESYOx8yCT5zPM3F6HI1GvVYrIUHFjsd6QXDypiwYFPDIoH9iAl+bx3kuvSLQ
         vvHYWmHoyNuLzQphxaTil+OdMt8ACZZmPSIiBxZ7uzrNf3LTea/SqgZ6dYPyUO4pYc0Z
         SUsg==
X-Gm-Message-State: AFqh2krwxUY5LcVzBxwbeOaQMk37BptFCsOA08hqqnQdSzpEUrv3u4Es
        J/MR9ceLtKXlf22gUnJOBK9doTMBYuIxpg==
X-Google-Smtp-Source: AMrXdXuY5sYeXxaZpd9NWR9Lw9h6kIJhN93MATsixG6oRd1BLdYn0ivMpwqNGk5u+p9TPnci8CFx2w==
X-Received: by 2002:a05:622a:400e:b0:3a8:15d2:6e8b with SMTP id cf14-20020a05622a400e00b003a815d26e8bmr3753706qtb.33.1673971881451;
        Tue, 17 Jan 2023 08:11:21 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id t13-20020ac8760d000000b003b63187dbe1sm3049708qtq.27.2023.01.17.08.11.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 08:11:21 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 203so34618102yby.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 08:11:21 -0800 (PST)
X-Received: by 2002:a25:d88c:0:b0:77a:b5f3:d0ac with SMTP id
 p134-20020a25d88c000000b0077ab5f3d0acmr398785ybg.202.1673971881009; Tue, 17
 Jan 2023 08:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com> <20230117135154.387208-5-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20230117135154.387208-5-tomi.valkeinen+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Jan 2023 17:11:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+Zh3cDm4h8m7xYOee+6O7RLTdUSmR+gnL_ugGzsmTiQ@mail.gmail.com>
Message-ID: <CAMuHMdU+Zh3cDm4h8m7xYOee+6O7RLTdUSmR+gnL_ugGzsmTiQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm: rcar-du: Add quirk for H3 ES1 pclk WA
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

On Tue, Jan 17, 2023 at 2:54 PM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> rcar_du_crtc.c does a soc_device_match() in
> rcar_du_crtc_set_display_timing() to find out if the SoC is H3 ES1, and
> if so, apply a WA.
>
> We will need another H3 ES1 check in the following patch, so rather than
> adding more soc_device_match() calls, let's add a rcar_du_device_info
> entry for the ES1, and a quirk flag,
> RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY, for the WA.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c

> @@ -681,7 +724,13 @@ static int rcar_du_probe(struct platform_device *pdev)
>                 return PTR_ERR(rcdu);
>
>         rcdu->dev = &pdev->dev;
> -       rcdu->info = of_device_get_match_data(rcdu->dev);

No need to remove this line...

> +
> +       soc_attr = soc_device_match(rcar_du_soc_table);
> +       if (soc_attr)
> +               rcdu->info = soc_attr->data;
> +
> +       if (!rcdu->info)
> +               rcdu->info = of_device_get_match_data(rcdu->dev);

... and no need to add these two lines.
The idiom is to set rcdu->info based on of_device_get_match_data()
first, and override based on of_device_get_match_data() when needed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
