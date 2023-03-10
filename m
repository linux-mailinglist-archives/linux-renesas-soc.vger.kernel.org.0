Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 973566B41C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 14:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbjCJN4a convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 08:56:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbjCJN41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 08:56:27 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645AA10FBB7;
        Fri, 10 Mar 2023 05:56:03 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id l18so5714563qtp.1;
        Fri, 10 Mar 2023 05:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678456562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ5Y0Vp02ojFUqpW301smfOJxciovGk5YxkUDH/nsVQ=;
        b=K3Y4PKVu4D23ZUkShGVjcQd2XrppzUTesltSenbx9VZqZc2FCjYvmTQsqCZcsK3nth
         roa3YOeW3z0rhOanoIew3nmIQ7pDmjLHx4eeru453960JOAEep9XuXeoDfX3X2iLfyxp
         JQo10J5/l7r8dyDJanQHCMz6qFJXTkSTp4/Pprsr2+tJYywbj6jUQpDhL9N3AuM9KXZQ
         I5Pwg35DGe73SNDH1jFJO2x5H3cKwhs5oebb+yEg8NmlD0FNyKGtHYqcsd3fcPAbsnLt
         hzsvMd7OwHMaWib19Urobhpnvu5YH9Pql2+mGDvf5b9daOaR0tJgEZS4zaVdfC73Gook
         iFTQ==
X-Gm-Message-State: AO0yUKXv/Zr+9mZgUSeWKZt+tGvTiJhiXVfzqpifSKwYYSDpV895Kcsv
        6jEO4RrnyriYNkXxHQhs7UnD6nac/NRMfQ==
X-Google-Smtp-Source: AK7set/DQZrOYb9SpIaLJVcaOLGQNmRPDzENIegHhKyf20bgkodYNylzcc0qmQaM7VsBO/EFI0WdAQ==
X-Received: by 2002:a05:622a:1d3:b0:3bf:c8f9:def4 with SMTP id t19-20020a05622a01d300b003bfc8f9def4mr17740435qtw.59.1678456562160;
        Fri, 10 Mar 2023 05:56:02 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id d9-20020ac800c9000000b003b85ed59fa2sm1400953qtg.50.2023.03.10.05.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 05:56:01 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-536c02eea4dso99017107b3.4;
        Fri, 10 Mar 2023 05:56:01 -0800 (PST)
X-Received: by 2002:a81:ae4a:0:b0:52e:b7cf:4cd1 with SMTP id
 g10-20020a81ae4a000000b0052eb7cf4cd1mr16403076ywk.5.1678456560883; Fri, 10
 Mar 2023 05:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20230301215520.828455-1-ralph.siemsen@linaro.org> <20230301215520.828455-4-ralph.siemsen@linaro.org>
In-Reply-To: <20230301215520.828455-4-ralph.siemsen@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Mar 2023 14:55:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-aODKyXZd1BfjNmbqW7vpDXtbjQHttsOd6MdrD+bZ7g@mail.gmail.com>
Message-ID: <CAMuHMdX-aODKyXZd1BfjNmbqW7vpDXtbjQHttsOd6MdrD+bZ7g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: renesas: r9a06g032: document structs
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 1, 2023 at 10:56 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> Add some kerneldoc comments for the structures.
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
>
> Changes in v2:
> - tweak a few comments
> - document remaining fields of clkdesc struct
> - fix typo

> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -29,6 +29,27 @@
>  #define R9A06G032_SYSCTRL_USB_H2MODE  (1<<1)
>  #define R9A06G032_SYSCTRL_DMAMUX 0xA0
>
> +/**
> + * struct r9a06g032_gate - clock-related control bits
> + * @gate:   clock enable/disable
> + * @reset:  clock module reset (active low)
> + * @ready:  enables NoC forwarding of read/write requests to device,
> + *          (eg. device is ready to handle read/write requests)
> + * @midle:  request to idle the NoC interconnect
> + *
> + * Each of these fields describes a single bit in a register,
> + * which controls some aspect of clock gating. The @gate field
> + * is mandatory, this one enables/disables the clock. The
> + * other fields are optional, with zero indicating "not used".
> + *
> + * In most cases there is a @reset bit which needs to be
> + * de-asserted to bring the module out of reset.
> + *
> + * Modules may also need to signal when the are @ready to

they

> + * handle requests (read/writes) from the NoC interconnect.
> + *
> + * Similarly, the @midle bit is used to idle the master.
> + */

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.4, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
