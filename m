Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 409E76AE0A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 14:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjCGNfv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Mar 2023 08:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjCGNfu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 08:35:50 -0500
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDB64614D
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2023 05:35:49 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id y10so14271210qtj.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2023 05:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urULbQUOPfOIWbeWwu/UVMWyxPeVZ3I2kroq681pdYA=;
        b=ISCTJZOsTJ5icBQZVQPmGf1kY/Dpv3a/rmH7YRLNxOOzLLipIZELhV9wh24G4A11mb
         pG3MLZN3/6oCHBiMxxBoKlD/kuvBDod1pBN6kZoyaw7fuDBuoxf02gZm0QGMpCMrH/24
         4IDG3OT3wOFNImLE3LCO8M7yO7skoyH8hQnIY5FdvEx33A1htSVoe81TRq0d6xj0XznL
         LwS8B+eBnknuAdS/5ErpzfXNw46aGr3xkAwYU5z2vC0u3KlnIawAwFxd5e0eVoLlvy18
         6INjKh98qxUM/SYqW+761A6gSDoq0xgD6b3Ffpl/AuCYz1Rz7imhGyHhZWoiGalrfJFE
         QvIQ==
X-Gm-Message-State: AO0yUKU2vLb5FmqtLQs/k6ntrzwzL/4faaRuBt1eGUWvXmNntE7cLLVl
        yetcTzfPmq6Xh1pyHtbBnd0jVQCy+URWaA==
X-Google-Smtp-Source: AK7set8OrHi374b8NlVBLcmvNjfzW8biNQWC/wt61a3q7U2PN2a2EFseULAqaeZTZroSD1MMR/Wh7g==
X-Received: by 2002:a05:622a:44c:b0:3bf:bdb8:c64a with SMTP id o12-20020a05622a044c00b003bfbdb8c64amr25353304qtx.49.1678196148153;
        Tue, 07 Mar 2023 05:35:48 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id fu22-20020a05622a5d9600b003be56bdd3b1sm9418629qtb.92.2023.03.07.05.35.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 05:35:47 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-536be69eadfso245261227b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2023 05:35:47 -0800 (PST)
X-Received: by 2002:a81:ad66:0:b0:52e:cacb:d7c4 with SMTP id
 l38-20020a81ad66000000b0052ecacbd7c4mr9161804ywk.5.1678196147478; Tue, 07 Mar
 2023 05:35:47 -0800 (PST)
MIME-Version: 1.0
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de> <20230307115900.2293120-17-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230307115900.2293120-17-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Mar 2023 14:35:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhawtm1JGQczs4CTW7SUSVuSRwk9bqioPuX-3SgfG22A@mail.gmail.com>
Message-ID: <CAMuHMdWhawtm1JGQczs4CTW7SUSVuSRwk9bqioPuX-3SgfG22A@mail.gmail.com>
Subject: Re: [PATCH 16/31] phy: renesas: phy-rcar-gen3-usb2: Convert to
 platform remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 7, 2023 at 1:11 PM Uwe Kleine-König
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
