Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F06564D952
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Dec 2022 11:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiLOKOF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Dec 2022 05:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbiLOKNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 05:13:52 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F4A28702;
        Thu, 15 Dec 2022 02:13:47 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id h16so4763943qtu.2;
        Thu, 15 Dec 2022 02:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9AqiR8edFa8T7niqfPNmuzITEM9yfkplGTgNEUhld0=;
        b=EGPSSuveaJte7LoM581ax9HCrm749CMICCLB1FSdpbYvRgQR5G8XAHYqzA3CuwNvOM
         W5qhcw6ga1uv7lJNgxzR40cKqaJOCSq+FHj+zTfp2b+hpLHZqBd/O93IDoPjlRHThM7l
         cfw+NJbCKEhks8rWJIzuI1OYX+iAiK1Cn3TWyUeQa2Tb1Q1OuxySBJLc6tdKNy5FkRpj
         9aGPk9gSIrxe5Xx2CQ8VG0kZ1GCizJ3ldbwm9O35KGH24QQDCxdbTlYJB4lmI8fFUCAo
         uYHQXDQv73LFkxYQGE5upiwDEIWGe2yvFaxUOPLMBo3hLaGkyIv7QpzS5phjsFz+2krb
         y8aQ==
X-Gm-Message-State: ANoB5pl8QhrlX95BL2OE5wYk0fyJv2jA3Lj+7Px1Voe2zw6QbWEkP23m
        3TtM0Nd3sWCVqvq+7txiXd5U0enqyvR/SQ==
X-Google-Smtp-Source: AA0mqf6Px3luSPEQ1OwI6zEshyd5VzanpUvenCQlfLM02Ik55vcMp7tP9vQm4cQJZHtnOntNnhdoyg==
X-Received: by 2002:ac8:41cd:0:b0:3a5:1ea1:bae2 with SMTP id o13-20020ac841cd000000b003a51ea1bae2mr15860131qtm.34.1671099225841;
        Thu, 15 Dec 2022 02:13:45 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id t30-20020a37ea1e000000b006eef13ef4c8sm11791231qkj.94.2022.12.15.02.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 02:13:45 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id o127so2916757yba.5;
        Thu, 15 Dec 2022 02:13:45 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr66069667ybc.543.1671099224951; Thu, 15
 Dec 2022 02:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com> <20221212172804.1277751-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221212172804.1277751-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Dec 2022 11:13:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXu7oNxHKz+aGRxaYvXVYYHtTt2zWiBJjzAyxeGP=0HaA@mail.gmail.com>
Message-ID: <CAMuHMdXu7oNxHKz+aGRxaYvXVYYHtTt2zWiBJjzAyxeGP=0HaA@mail.gmail.com>
Subject: Re: [PATCH 05/16] usb: host: xhci-plat: Improve clock handling in probe()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
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

On Mon, Dec 12, 2022 at 6:28 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> It is always better to acquire all the clock resources first and
> then do the clock operations.
>
> This patch acquires all the optional clocks first and then calls
> corresponding prepare_enable().
>
> There is no functional change.
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
