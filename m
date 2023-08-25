Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3DF77880E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 09:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241111AbjHYHdV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 03:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243206AbjHYHdR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 03:33:17 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5771BFA;
        Fri, 25 Aug 2023 00:33:14 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59205f26e47so7606207b3.2;
        Fri, 25 Aug 2023 00:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692948794; x=1693553594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKuW5+5MU8txrrl5oeN20Yf2CPD2m4lft+DUXDGYBVQ=;
        b=cwobJ/54gD+x6NU8zP89oIU/efVpcgt3xayzXh/Ud30UdqIgSBuC1jMbnfe3f+rKjf
         IGvDMaOL8gUyIu4ehYEBopQgOJxrwblGvQyMPsn65qFzEoz7gtHiF8ov6id7tFFAt0Ff
         nVtNaSfWLNMhaoivAau7IqY9WciZ1JeQN8M9N/LpV238T6MrDrnk2lWCsoP8Y1S9Dy3E
         /AJi2ujewTbUF4tW3796RH3MWaqS2DTdqIQcXVVxqojpSx+sn30i2+7pGZlvJu0zc38F
         SsF2V46x/e/LXH8ASEpJyl/VFZSK5Ja7qlYxDmEv6DcMus8oHegHHKSGok/PgVZvIZlY
         tbuA==
X-Gm-Message-State: AOJu0Yy6/LdBFzepHYHjp5AKh1KYY7ABth6AfFTUKbAgeDvfnL84k+c7
        lAneV88ZW3hWrv7W3k3p+PAm2G0tLfIacA==
X-Google-Smtp-Source: AGHT+IH441azWgsXXgOM/9TFsj9Zdsbn2nW7E9ipMRSAxCsFpxSQguwi5CLJR98ugjNbtUIcKJeliA==
X-Received: by 2002:a81:8483:0:b0:577:24d9:4001 with SMTP id u125-20020a818483000000b0057724d94001mr17013130ywf.13.1692948793750;
        Fri, 25 Aug 2023 00:33:13 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id c62-20020a0dc141000000b0055a07e36659sm363439ywd.145.2023.08.25.00.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:33:13 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d78374140adso303849276.3;
        Fri, 25 Aug 2023 00:33:13 -0700 (PDT)
X-Received: by 2002:a25:3491:0:b0:d73:ea25:f17b with SMTP id
 b139-20020a253491000000b00d73ea25f17bmr17028078yba.1.1692948793032; Fri, 25
 Aug 2023 00:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230824161344.382188-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824161344.382188-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Aug 2023 09:33:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_dW8j1+5VJ84+YkTRZQ3oZ=U19yNfaOEn6-X_fAbLBw@mail.gmail.com>
Message-ID: <CAMuHMdV_dW8j1+5VJ84+YkTRZQ3oZ=U19yNfaOEn6-X_fAbLBw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rz-smarc-common: Use versa3 clk
 for audio mclk
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Aug 24, 2023 at 6:13 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Currently audio mclk uses a fixed clk of 11.2896MHz (multiple of 44.1kHz).
> Replace this fixed clk with the programmable versa3 clk that can provide
> the clocking to support both 44.1kHz (with a clock of 11.2896MHz) and
> 48kHz (with a clock of 12.2880MHz), based on audio sampling rate for
> playback and record.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Made Versa3 clock mapping as per HW manual and updated clocks
>    property in codec_dai.
>  * Replaced the node xtal->x1-clock and label x1_x2->x1 as x2 is a
>    different crystal.
>  * Updated clock-frequency = <400000> for i2c0 node in RZ/G2UL SMARC EVK.

Thanks for the update!

I'm a bit confused by the version and the changelog.
This is the second v2, and apparently there were also two v1s...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
