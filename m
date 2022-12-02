Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF609640260
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 09:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbiLBIkH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 03:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232738AbiLBIjt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 03:39:49 -0500
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A823560B6B;
        Fri,  2 Dec 2022 00:39:40 -0800 (PST)
Received: by mail-qv1-f53.google.com with SMTP id p12so3002811qvu.5;
        Fri, 02 Dec 2022 00:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+ybitkAzR+mwi0gwsHAicn9H8aEtbfq/pscdBUHtbY=;
        b=LFF68dalV9aYpwIncwhHFvkzLiraZ7VCPakeXEuKC5QMSUY7JUSLUUxlobDlVkAyHj
         so4hWvyGMS3z3pb47XkYCDcogTVIYgFqOcu6Hpvi804JCefL755HD/twgixLuT/Yqu31
         UQzvjqlvwRWvCSWuuebv56TKHJ7j+cHdlTAzIQ4HX/lP1WmJjdqPU3D9Xn8eD5IBiCv5
         hAKMqjrezRyb8vwXBROi7SBz8FjziWvTFa4JnvhHlOi87jlDxlTR6NJvXehrigOwmat7
         wUZn/PgxX/Dcb1v24/fE0j+pc+SKvqS/ZMG4et5UB9r8vM1EVDMSFr9NvrAbuzyXyZZm
         y/ZA==
X-Gm-Message-State: ANoB5pn48iqDA9fw7jE0I2nt3ZeEBt0Tt6Gsi4yWU/QI/hjiQ65gYOQP
        naeYQV/mcH3XzWfGnF+TfiiLqykqaweKyA==
X-Google-Smtp-Source: AA0mqf5Qeuq9Pn9zPn5kYcOdZ7jgL39JaeXmi0l1S0jg5RmDIlQu2z4JYJQq2jU0w+fMHu1cAUYBCA==
X-Received: by 2002:ad4:50ac:0:b0:4bb:ce03:5714 with SMTP id d12-20020ad450ac000000b004bbce035714mr53541756qvq.30.1669970379545;
        Fri, 02 Dec 2022 00:39:39 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id i21-20020a05620a405500b006f8665f483fsm5279489qko.85.2022.12.02.00.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 00:39:39 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id n184so4998122yba.6;
        Fri, 02 Dec 2022 00:39:39 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr49633558ybq.89.1669970378836; Fri, 02
 Dec 2022 00:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com> <20221122213529.2103849-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122213529.2103849-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Dec 2022 09:39:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeAc-WENgk=0CfDBKe45SgV+2-2VYoXVjSBBKFmMYc8A@mail.gmail.com>
Message-ID: <CAMuHMdUeAc-WENgk=0CfDBKe45SgV+2-2VYoXVjSBBKFmMYc8A@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: renesas: r9a07g044: Add fcpvd node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 22, 2022 at 10:35 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add fcpvd node to RZ/G2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Note:
>  This patch depen upon binding patch [1]
>  [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221122193415.1873179-2-biju.das.jz@bp.renesas.com/

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
