Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC124AD3A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 09:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347664AbiBHIj4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 03:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350480AbiBHIjz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 03:39:55 -0500
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE08EC03FEC5;
        Tue,  8 Feb 2022 00:39:54 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id t184so2556384vst.13;
        Tue, 08 Feb 2022 00:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fpa19FtuwnVf1SWr864SURHuQnplJ9T8Hzs+HMq2I9o=;
        b=iKXwp+B97cHBTs9DKGS3m/HJswR2nxkUOZgnJ6FGekSym0pVSAIwAoSjP2PlAmGytY
         cOZdoahX7SkvtE4ns9Hf16f81g8Rpu6/sNHAjLe/szTp9kz1F2NiwETa+WNUJVgVhMWT
         d0D9OQz3WCTYvUBekwjTYWrAPoOjybhF9rX2ux3ZC0bE1GLY3P8XU0M9T6y9KhDNx3NU
         pm1BkuV+qo/W3Jf3vlWub7A0QHjA8oThBmAo07AhpwP6CGxzeyMjaMV17MCcr3xktj7T
         iAjS/or27t/v/MfDMZRzH6t90GvNLuWfhgTG1CT/qzJfJSvBYXd3iAqdKTSncSKBVxWN
         xYkQ==
X-Gm-Message-State: AOAM531RpuL9rXCp8Tx8KI3BAUo0r14jzqHKEzmW5qj75l0D+BacyWx7
        umhXRAeG4cG77L5ATQ57ul3j/ygHHOb7QQ==
X-Google-Smtp-Source: ABdhPJxBn9sKN9FFxJUgrHtDmpFFmtIL4gfyPF+SJUQpCZtk5y6FgtkV9ghYJUxEvtLN7jPSXtN90A==
X-Received: by 2002:a05:6102:d86:: with SMTP id d6mr360860vst.81.1644309593474;
        Tue, 08 Feb 2022 00:39:53 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id d202sm2726777vkd.38.2022.02.08.00.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 00:39:53 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id x13so2562100vsl.10;
        Tue, 08 Feb 2022 00:39:53 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr1036622vse.38.1644309592863;
 Tue, 08 Feb 2022 00:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20220204143132.3608-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220204143132.3608-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Feb 2022 09:39:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsZKbYGrESDE4F-LYGeNmseSBjKhNdKZdQCu0n8oZJxQ@mail.gmail.com>
Message-ID: <CAMuHMdUsZKbYGrESDE4F-LYGeNmseSBjKhNdKZdQCu0n8oZJxQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Use SW_SD0_DEV_SEL
 macro for eMMC/SDHI device selection
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 4, 2022 at 3:31 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch replaces EMMC/SDHI macros with SW_SD0_DEV_SEL DIP-Switch
> macro for eMMC/SDHI device selection.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
