Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C41CA677DFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 15:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbjAWO2Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 09:28:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbjAWO2Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 09:28:24 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CC7233EB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 06:28:23 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id j9so9750444qtv.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 06:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZK0Fpr9f2TEACSrFPa83bSO8lfj9h12PaXO2n6BQdo=;
        b=UD2J7kedfB6LsgD7JGWmFqjVLa3VHrOFbu+MP7GE0PadTjcoF2OuyMwh4g2ytQ/To1
         FLKW+evY/LDV197G2bYzKvsihYiv3BC81D8eQFjxPzcI4fu+0LzKFoll4wAK9NV0ObiR
         JhMTcFFTGk6vKMvLkZlepnRYt0ybTPU9wuk/vef7OX6aew/iOGBazl/zZyrl/hTQ9O1P
         N3bkhUG2VDqFtsLpo0PV9nq1/ntd22Y0rV7QSYbPbWWMEy5CHTPQBEWZrMkctV7YvDkO
         9KIYPRpqc5zFLqAvpw3E0uR6vq92NhRDkbakHH96e5DEcTsLJq94zqGU8Kmeg0WoXjyW
         ep1A==
X-Gm-Message-State: AFqh2kodgb5TQX9OoMuhwWzj6vJt8GsiND2xEVp0/5WbZMUP++EiXTWf
        gSCaF1k1NAXDoA3FAxvv0FMZZNONH38ILw==
X-Google-Smtp-Source: AMrXdXu/4LXyQLAJgWTcVmLe7NUrTVCUfgz/Z5BcLzQrRLx9wtNawOYRS6SLTT38fHXHF0odUjksIw==
X-Received: by 2002:ac8:75d4:0:b0:3b6:3471:6c24 with SMTP id z20-20020ac875d4000000b003b634716c24mr30813275qtq.55.1674484102530;
        Mon, 23 Jan 2023 06:28:22 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id a19-20020ac81093000000b0039a610a04b1sm24769308qtj.37.2023.01.23.06.28.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 06:28:22 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id b1so9717840ybn.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 06:28:22 -0800 (PST)
X-Received: by 2002:a25:d505:0:b0:7bf:d201:60cb with SMTP id
 r5-20020a25d505000000b007bfd20160cbmr2004334ybe.365.1674484101740; Mon, 23
 Jan 2023 06:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20230123104742.227460-1-tomi.valkeinen+renesas@ideasonboard.com> <20230123104742.227460-5-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20230123104742.227460-5-tomi.valkeinen+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Jan 2023 15:28:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkenq=2PH-mjodFzAtEa5ss_Lx11B26x6tE2Da3DbmKg@mail.gmail.com>
Message-ID: <CAMuHMdVkenq=2PH-mjodFzAtEa5ss_Lx11B26x6tE2Da3DbmKg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] drm: rcar-du: lvds: Fix stop sequence
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

On Mon, Jan 23, 2023 at 11:48 AM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> According to hardware manual, LVDCR0 register must be cleared bit by bit
> when disabling LVDS.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> [tomi.valkeinen: simplified the code a bit]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your patch!

> @@ -544,6 +549,27 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>                                      struct drm_bridge_state *old_bridge_state)
>  {
>         struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +       u32 lvdcr0;
> +
> +       lvdcr0 = rcar_lvds_read(lvds, LVDCR0);
> +
> +       lvdcr0 &= ~LVDCR0_LVRES;
> +       rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +
> +       if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
> +               lvdcr0 &= ~LVDCR0_LVEN;
> +               rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +       }
> +
> +       if (lvds->info->quirks & RCAR_LVDS_QUIRK_PWD) {
> +               lvdcr0 &= ~LVDCR0_PWD;
> +               rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +       }
> +
> +       if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
> +               lvdcr0 &= ~LVDCR0_PLLON;
> +               rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +       }

Please add a comment explaining why there are multiple register writes,
to avoid an over-zealous janitor "optimizing" the code later.

>
>         rcar_lvds_write(lvds, LVDCR0, 0);
>         rcar_lvds_write(lvds, LVDCR1, 0);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
