Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66AEC6FB0FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 15:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233074AbjEHNN2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 09:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjEHNN1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 09:13:27 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72FA1FF3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 06:13:26 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-55a8019379fso40201887b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 May 2023 06:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683551606; x=1686143606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypP1RaD2v3JaEFIwqh2HQLG8afiKCDXmEZ3MsLg9oNE=;
        b=gE1m6LetXRsAffE9W7oM6zZ1Zjwza6TD38T7FvOE5CNf5yrXGqMU5Tv017bnk7QZoA
         NjRJbNIMjRdZhXOHqUURAZUulyrTehQBFuu5TUNd383+yM2jDYtOnsPM4TV4aEi01maO
         1INbv0fpP9BK2ChcesRa4kOU/c5a36b4TOQ+9KuF1JRsOVWpMObrT5JnW0UJX2B6TyTi
         YauGx4Pe71ZKIDekA+Fyi31U5feRC/g267qWa754dowA/XxT3S4NqsGXWhJ6KErziB8Q
         OuXHd7sEg2DE0UyQElQP/yTPxktIgiHrIiUOC0/gO7Az7RvfWnBL0eOABr82CJgxfal9
         Rv9g==
X-Gm-Message-State: AC+VfDyhNlKqqro64rpauJ/UrNvua2lcff7xA0Kq8kX29J538USEcUEl
        crU7Z38LD0VBYAk+x3pE75RtiSqJgSpN8Q==
X-Google-Smtp-Source: ACHHUZ5lYLiksM2zngGOGOr7EFbA6yRiSnOg1tb22ua4gRvoRi7ZASVKNZz21Fmjlf6Uu4+83PZfqQ==
X-Received: by 2002:a0d:dbcf:0:b0:55a:e0db:98d1 with SMTP id d198-20020a0ddbcf000000b0055ae0db98d1mr11146794ywe.41.1683551605677;
        Mon, 08 May 2023 06:13:25 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id m63-20020a0dfc42000000b0055a1cd96212sm2525067ywf.33.2023.05.08.06.13.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 06:13:24 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-55a5a830238so39999107b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 May 2023 06:13:23 -0700 (PDT)
X-Received: by 2002:a0d:ca51:0:b0:55d:6757:e975 with SMTP id
 m78-20020a0dca51000000b0055d6757e975mr9230569ywd.49.1683551603615; Mon, 08
 May 2023 06:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de> <20230507162616.1368908-40-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-40-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 May 2023 15:13:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZnBhh9dxQG1yA=8_DE_m7b6a1KD+GZLy5SxKY9H=ZAQ@mail.gmail.com>
Message-ID: <CAMuHMdUZnBhh9dxQG1yA=8_DE_m7b6a1KD+GZLy5SxKY9H=ZAQ@mail.gmail.com>
Subject: Re: [PATCH 39/53] drm/shmobile: Convert to platform remove callback
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
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
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
