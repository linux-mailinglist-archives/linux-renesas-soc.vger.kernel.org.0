Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2E74DDA4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236577AbiCRNPp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236578AbiCRNPo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:15:44 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B516D227C5C;
        Fri, 18 Mar 2022 06:14:24 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id 10so6757693qtz.11;
        Fri, 18 Mar 2022 06:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zs260K4GrCrRuhcXIHGZ7usnqW+V0O8tAJ6MPCvPKBI=;
        b=tCkHM/PgzqkHlMAa+bztFlSNatetCRlo8Nt7cSv03aTVHOAOUYLYhHShdinZX5gLBX
         KhkaPqY5X369VguHxQONjKGYzNXLSqwhjbxP7ScuqzRJYLnm1v27MX1KhyvtAQdu/JB5
         NwQjlwlcM3NKqWwlJTr4ZtUhriyyj+43UxqlhP9qAAIGLu4W6CSwMPqtoGuS4u9vCXVY
         3pNRjk+/pls6zX6JZAwcvt7L0OWfwrNJiP0Z1dhVaoRIs+hSH2R0ESDtZDL5w0LJS/lN
         7SF7YXlKTeDQEkX6kI/FggOzZnm9k8ZsdQbZoX3ClPwFNOfSeZwZp+sKZdsAAp61sXHA
         q4zA==
X-Gm-Message-State: AOAM530VG0vrVz3TY98Sj0Z0J2Ix8oMqXHooSlQSol9ZAc3NdE5bg89Q
        Lm3dQEjzz3uoawSXtgVJuwzdQ8NxPm5z+qIt
X-Google-Smtp-Source: ABdhPJyjVWp+BgJ8FwfDDEeBhg8r52f3loyPbAsXyA83ByyjxVuJhHSD7Sk0p6xL37lHTZ1JFObekg==
X-Received: by 2002:a05:622a:1013:b0:2e1:c9c0:9831 with SMTP id d19-20020a05622a101300b002e1c9c09831mr7179381qte.245.1647609263466;
        Fri, 18 Mar 2022 06:14:23 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id s16-20020ac85cd0000000b002e1ed82f1e5sm4589084qta.75.2022.03.18.06.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 06:14:23 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2d07ae0b1c4so90143547b3.11;
        Fri, 18 Mar 2022 06:14:23 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr11404241ywb.132.1647609262822; Fri, 18
 Mar 2022 06:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220307192436.13237-1-biju.das.jz@bp.renesas.com> <20220307192436.13237-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220307192436.13237-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 14:14:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHiaA=eF51Hi-suQ1nxjA6BrU9bBwAV7iqZeHEptjDvQ@mail.gmail.com>
Message-ID: <CAMuHMdWHiaA=eF51Hi-suQ1nxjA6BrU9bBwAV7iqZeHEptjDvQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: rzg2lc-smarc-som: Add vdd core regulator
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 7, 2022 at 8:24 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add vdd core regulator (1.1 V) for GPU.
>
> This patch add regulator support for GPU.
>
> The H/W manual mentions nothing about a GPU regulator. So using vdd
> core regulator for GPU.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
