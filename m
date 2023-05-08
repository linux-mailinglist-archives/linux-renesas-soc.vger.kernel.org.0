Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F4E6FB115
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 15:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbjEHNPR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 09:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233699AbjEHNPP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 09:15:15 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C82431550
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 06:15:01 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-55a10577911so64765847b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 May 2023 06:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683551700; x=1686143700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5LaiI9Qf78wWAuCEXEQ4PsyMcCaCQGaBXqW3f6eYiY=;
        b=VB0C3CdDi52vXGLIQAG6MdCFKOBq5Z2XwNxIOp8CrGf6AcE3xiFAs7retkInbSXoxZ
         kqRWZoaACiz0L1xG7TqEZublwbkTbbucjT6FJHqX+d3AcNX6xETUHSWW9wcyjLI3B1sA
         fRo7U2KXpwWn3NBX0UY/C0EJu5+s6wKed00hO8ATYUNIFl5zw5ZO44wYfcO3+8G3pU9c
         fxczwHiiEEIs9lhJQ6Ht7bhnMOZg649Uwple9jE5xQ5FRDvK5rqRo5qyudTu2QC1OR+Z
         fwsV1Nf3eTFr0T7FoE2Z0f6B6qPSXO7DyEfb/ypmS0Z/FntAKQ/oX295O78H5tHLiNJ7
         l/lw==
X-Gm-Message-State: AC+VfDyrsfHcAd9ttEUqRGFy2ripDqBAaqFPK+D/eiEfarhzUcsLws9h
        eDmMp3RdTGnG+srLpliWKABxLVXc35TxeQ==
X-Google-Smtp-Source: ACHHUZ4qsLZAybgXSN6pwrNFF5fvwVc0q1zVAtTnpvg3aq5EPDZbjG2HyitgvhjegkCOOww+g+udEA==
X-Received: by 2002:a25:4f0b:0:b0:b8f:4bff:d54d with SMTP id d11-20020a254f0b000000b00b8f4bffd54dmr10519427ybb.63.1683551700089;
        Mon, 08 May 2023 06:15:00 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 144-20020a250596000000b00b8bfb4c4f1esm2308145ybf.62.2023.05.08.06.14.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 06:14:59 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-b9e6ec482b3so5978788276.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 May 2023 06:14:58 -0700 (PDT)
X-Received: by 2002:a25:b315:0:b0:b9d:f4df:b0ef with SMTP id
 l21-20020a25b315000000b00b9df4dfb0efmr11607033ybj.42.1683551698679; Mon, 08
 May 2023 06:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de> <20230507162616.1368908-38-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-38-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 May 2023 15:14:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5se-2pt=WXiXY1K38cVY+BtmNTJAGUXeULrqRAXXxUQ@mail.gmail.com>
Message-ID: <CAMuHMdV5se-2pt=WXiXY1K38cVY+BtmNTJAGUXeULrqRAXXxUQ@mail.gmail.com>
Subject: Re: [PATCH 37/53] drm/rcar-du: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, May 7, 2023 at 6:31 PM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert the rcar-du drm driver from always returning zero in
> the remove callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
