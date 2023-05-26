Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7B6712147
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 09:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242154AbjEZHij convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 03:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242495AbjEZHig (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 03:38:36 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9602AE61;
        Fri, 26 May 2023 00:38:11 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b9daef8681fso430787276.1;
        Fri, 26 May 2023 00:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685086640; x=1687678640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZplzPX/qZytJO01Mxnn0loHjJum7pyoDyw30fwHhRDI=;
        b=LWvRGxSgY3g5prltk3Ms/LU6Ux7Bic0V7SXRkOYf4J6Xrf/0i/BHFvdsdTWIuz2bhN
         7Y/UeqrjfQiNwFJDKfHyDEfFIRYTrszyIIZLP3I90RW1YgBvM1UDH4OOAI+zr/5OG9Ei
         bqXRT9joASJiQVss7LKiqYBPGQwuo7cjZn6nXpKhVcFcTglHvqXcI+J3E8QIDmp/WZ1o
         H3WHqasJnszkOeyc5fF/miOuYz3ZZXW+ii4SSIHc0uCJjb8O9VmsqMqr79aoONcNrbYe
         aVSw6Y08jcKMNMUyTOOzONSN3PY7GG863ia7C60mtXk6Kw8R/GSA8hLuJaIm+1UUl1je
         +8GA==
X-Gm-Message-State: AC+VfDxy4fcRaf/5JXFo5uMTCUzNJcx6N+ip+gkO2tFSo9XeBlMm2htL
        RaFfovxqYtwIUh4m//u0rpnh2x7IN3mqDw==
X-Google-Smtp-Source: ACHHUZ5+VSN5PS5BON9IDesMs9tZ6jn32z4JJPGfGJ8C9PFYy9x/eiD8bcbPf9x+xkXkfaQLcvGQ6Q==
X-Received: by 2002:a81:c305:0:b0:559:f181:1a7d with SMTP id r5-20020a81c305000000b00559f1811a7dmr1189558ywk.27.1685086639846;
        Fri, 26 May 2023 00:37:19 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id y123-20020a0def81000000b0055aaccfa2c7sm990143ywe.91.2023.05.26.00.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 00:37:19 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-563b1e5f701so4992097b3.3;
        Fri, 26 May 2023 00:37:18 -0700 (PDT)
X-Received: by 2002:a0d:cb83:0:b0:561:d21d:8ce4 with SMTP id
 n125-20020a0dcb83000000b00561d21d8ce4mr1107854ywd.19.1685086638668; Fri, 26
 May 2023 00:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com> <20230522101849.297499-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230522101849.297499-10-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 May 2023 09:37:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgbMYPRXcH=SESmuHntF_HPKi9rSnsXza7BP5ZvDZDsQ@mail.gmail.com>
Message-ID: <CAMuHMdVgbMYPRXcH=SESmuHntF_HPKi9rSnsXza7BP5ZvDZDsQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>
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

On Mon, May 22, 2023 at 12:19 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document Renesas RAA215300 PMIC bindings.
>
> The RAA215300 is a high Performance 9-Channel PMIC supporting DDR
> Memory, with Built-In Charger and RTC.
>
> It supports DDR3, DDR3L, DDR4, and LPDDR4 memory power requirements.
> The internally compensated regulators, built-in Real-Time Clock (RTC),
> 32kHz crystal oscillator, and coin cell battery charger provide a
> highly integrated, small footprint power solution ideal for
> System-On-Module (SOM) applications. A spread spectrum feature
> provides an ease-of-use solution for noise-sensitive audio or RF
> applications.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v4->v5:
>  * Added description for clocks.
>  * Replaced Oneof->enum in clock-names as it is simpler.
>  * Added Rb tag from Conor.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
