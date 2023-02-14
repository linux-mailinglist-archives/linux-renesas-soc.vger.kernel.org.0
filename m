Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C83876967D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 16:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233312AbjBNPS2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 10:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233297AbjBNPS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 10:18:27 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C39279B7;
        Tue, 14 Feb 2023 07:18:26 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id ch10so16657728qtb.11;
        Tue, 14 Feb 2023 07:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfDVTcyBQAtArhGZs1TBGdjWVfQCwYQxG1kCtIwFZEk=;
        b=h1Viq1VXzgzvTJVl8JqV5mxqvhvYRwbQ6ltaad3Q2gM0bvP7FM8QQS0NM/twPITP34
         YyBTQRH8ElYJlUii8yZyTAYKhi6pxn4H8t68fNXmnjP7LJpjeEj57uwebHdjWfIbYcdQ
         zLUg+qN577tTeB/23zMxnWhoX+XMnqqwsS6Lz9dniBPHITIUtJgv1Ys9hDN8nHNV5zd+
         twz90TKEMguQDgvxeJzdl/ceccaJEDqB+UuO5fiXMlq1zAfAhfvEY3YtGDkCTs1s8ZRH
         G+SNlCFO069hdo2khfnoWtnxdKsvUcK6othp/9sV16IyIhtxz1ep6/lRNwTIdtZMguT5
         HR8Q==
X-Gm-Message-State: AO0yUKUJWsfbnf0FLlpJeChwk0SBsOKhOpz4zmMGsoKBpOoTkS/SKLIX
        qLNlWxjDnlfZuaMBt1ME18yMdB8JKfPHHaIW
X-Google-Smtp-Source: AK7set9gOzlggguaRLbGci74rPvDPueJ7gFgjjGfXer7Lrk3rvOE0BUEYq0ew8BiyDRPRDA5brXzBA==
X-Received: by 2002:a05:622a:13ce:b0:3ba:266f:103b with SMTP id p14-20020a05622a13ce00b003ba266f103bmr4390440qtk.47.1676387904588;
        Tue, 14 Feb 2023 07:18:24 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 192-20020a3707c9000000b007090f7a4f2asm5456708qkh.82.2023.02.14.07.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 07:18:24 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-52bfa3dfd95so210800837b3.9;
        Tue, 14 Feb 2023 07:18:24 -0800 (PST)
X-Received: by 2002:a0d:fec4:0:b0:52a:7505:84bc with SMTP id
 o187-20020a0dfec4000000b0052a750584bcmr217129ywf.383.1676387904002; Tue, 14
 Feb 2023 07:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20230121145853.4792-1-biju.das.jz@bp.renesas.com> <20230121145853.4792-13-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230121145853.4792-13-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 16:18:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtXdtDrFEA_=rLs7YezmFejLzUv66pNvpxCWn7=apd3w@mail.gmail.com>
Message-ID: <CAMuHMdXtXdtDrFEA_=rLs7YezmFejLzUv66pNvpxCWn7=apd3w@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] arm64: dts: renesas: rzv2mevk2: Enable USB3 role switch
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jan 21, 2023 at 3:59 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable USB3 role switch on RZ/V2M EVK by linking USB3 peri node
> with hd3ss3220 controller node.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change

LGTM (with my limited USB knowledge), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
