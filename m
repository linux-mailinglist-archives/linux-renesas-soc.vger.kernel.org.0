Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2363C786A30
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 10:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234947AbjHXIe6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 04:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240514AbjHXIe2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 04:34:28 -0400
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E331732;
        Thu, 24 Aug 2023 01:34:26 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d77ad095f13so1840914276.2;
        Thu, 24 Aug 2023 01:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866065; x=1693470865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYnynKyrhE/rRprqRZ/h0obec/IVzA+OrOo6bXPmb9c=;
        b=DS0Y8oYwHZCXsU8E+86JwNNYvV/6Up7hn0Lb8Dnic8eQ7FOH51aJcqCuppXvmPZk52
         2xXaRkEqZrZ4UqiZTp+cEzJJHf7LJmJ7o2SsrVg6ACJtq3k6JZVVbxh27XbYWa3nctwF
         3ipiqsdBpbwft0E2AiSONzT9zeSCblLY2tQjasK4h3ivJYEukyEc6Cwhk1iAdAgUNPPN
         Cf844bruxw2Kme/8x44CTJ7xuxk4cebJpnmDiIGZtTDvnrP/mjO23MIhZqezkruEvCrK
         OymttRSHxoADiOyVegk9ZFF1Y5DjZvtrbGVC/bRAc/+kCNcTJL5F4nxyO/eGwOOqrza/
         5ODA==
X-Gm-Message-State: AOJu0YwTRGxA10L97PDCOU3HUIKKMfg4nm3ebiNC2jQvLWairLslNcwf
        RKnmb73Jomqt3FPiIAcDg4bFQhCoZzP5RA==
X-Google-Smtp-Source: AGHT+IEl5i9ITIFtEnO22ZoJQLY50Y+Z/nSkUXkBnFh/ApsbpbvnHfVzNQCw373k1iZ2jqlKqjMofA==
X-Received: by 2002:a25:d286:0:b0:d68:8a7f:127f with SMTP id j128-20020a25d286000000b00d688a7f127fmr15265254ybg.52.1692866065241;
        Thu, 24 Aug 2023 01:34:25 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id h186-20020a2521c3000000b00d1d0841d911sm3215406ybh.17.2023.08.24.01.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:34:24 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d77ad095f13so1840895276.2;
        Thu, 24 Aug 2023 01:34:24 -0700 (PDT)
X-Received: by 2002:a25:2495:0:b0:d67:5d71:d818 with SMTP id
 k143-20020a252495000000b00d675d71d818mr14376931ybk.1.1692866064059; Thu, 24
 Aug 2023 01:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230824082501.87429-1-biju.das.jz@bp.renesas.com> <20230824082501.87429-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824082501.87429-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Aug 2023 10:34:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSoR_4vH=_6Jf15oPATpy3WuxKAHStn8bH2QCYt5FGHg@mail.gmail.com>
Message-ID: <CAMuHMdVSoR_4vH=_6Jf15oPATpy3WuxKAHStn8bH2QCYt5FGHg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: versaclock3: Fix the assigned-clock-rates
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Thu, Aug 24, 2023 at 10:25 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix the "assigned-clock-rates" for each clock output in the
> example based on Table 3. ("Output Source") in the 5P35023
> datasheet(ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}).
>
> While at it, replace clocks phandle in the example from x1_x2->x1 as
> X2 is a different 32768 kHz crystal.

Thanks for your patch!

> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>

This is not what I suggested.
The bindings should document the meaning of the clock indices.

> Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock generator bindings")

This patch is not a critical fix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
