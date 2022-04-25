Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5A150E10A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 15:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237873AbiDYNGt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 09:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241205AbiDYNGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 09:06:47 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E492E0B1;
        Mon, 25 Apr 2022 06:03:39 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id k12so3797375qvc.4;
        Mon, 25 Apr 2022 06:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V42KY/X6UtUq3VKEQTjRcqbsGKczMX2aAqWtF3TJ0g4=;
        b=gYbg80ztJ5OaDIzaTGS96j8F1/s18GDPV+Z9vr7O5ZDzIblaUrJIeppiNcpu8s3Nnw
         Zqo39M2XML2Q03kb4nRaH9P/hwrsZjm7yRsP/quVjNJrf2Wv2pv1dFxCcWoEVHWJY622
         ufbIT/44Uv5bYWYI/jMwiHBjm2+dHzZ5MjkwRxiY9bJs3R9LgqRe+b2Qo4A3JKfdOUPZ
         hzmqBOA9vAmRXGr2YGH3oUGMIVzqhOSDNCJnRnf99mF1oUUSrrOcUGkrccKFHR3sq4XF
         BKpIKubrvjWXCtzuVMq0R9qz6tJ3VIyPa2vsto1SeaC96qmmNXtVnBFr5j1w74XsA17t
         N5gQ==
X-Gm-Message-State: AOAM531nB/yohI/A6rfRTQMHT4XxXxGd90hlsyJA0sLy5Ln9tnw4Bgug
        I5r456tsvqHwaGlJMJHhwD4WO7Sn3atlrQ==
X-Google-Smtp-Source: ABdhPJwrdTks4qTnPNxAFUQ9iXuk3on9/c8fLIU1JAP2caz059eXkakM6AltvbFnY33mX/kzh3pfdQ==
X-Received: by 2002:a05:6214:e45:b0:444:3f6b:6c2b with SMTP id o5-20020a0562140e4500b004443f6b6c2bmr12295645qvc.124.1650891818151;
        Mon, 25 Apr 2022 06:03:38 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id c3-20020ac85a83000000b002f36b61b0d3sm1267240qtc.47.2022.04.25.06.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 06:03:37 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2ebf4b91212so147190557b3.8;
        Mon, 25 Apr 2022 06:03:37 -0700 (PDT)
X-Received: by 2002:a81:1cd5:0:b0:2f4:c3fc:2174 with SMTP id
 c204-20020a811cd5000000b002f4c3fc2174mr16929039ywc.512.1650891816817; Mon, 25
 Apr 2022 06:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 15:03:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2_2z=z=y-NGsYCQr4CsJB3z=GbBw4OL8=v8pqe1m+CA@mail.gmail.com>
Message-ID: <CAMuHMdW2_2z=z=y-NGsYCQr4CsJB3z=GbBw4OL8=v8pqe1m+CA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Apr 23, 2022 at 3:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document RZ/G2U2L SSI bindings. RZ/G2UL SSI is identical to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rz-ssi" will be used as a fallback.
>
> While at it add a '.' at the end of dmas description for the first cell.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
