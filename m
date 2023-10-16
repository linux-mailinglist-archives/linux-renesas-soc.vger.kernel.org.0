Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74AB77CA06D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 09:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbjJPHXk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 03:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjJPHXk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 03:23:40 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74664AD;
        Mon, 16 Oct 2023 00:23:37 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59b5484fbe6so51835457b3.1;
        Mon, 16 Oct 2023 00:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441016; x=1698045816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxKu2BfOe9aY6IVd/hySwpz3FIXqdj+qJLdSdMka9oc=;
        b=fGPUdPsT5XlTOiU4DqfSoDI5TzRSaG3g2N/Pp7JGaYD1qCoJyZLxPM4CFaDxyvmayk
         YVY5XXRjfAdlm8ZoM7PjITcD0+QXuZEvUH72ZgEc9qF+IpMRhnUYPNHXtqrukiJZVlQ9
         ifQM5uVea1QtnVHovuDXQ6b3ka2zxQXS0HM8nBlf7CdC2mEabg2vZZSIFL3ihLPmqfFB
         frf7fQuRe5IDsXASzy0OMMJPVgOumIuYxD7kSMYClbZ463mHXz/KbXYzNKPGjNf90geL
         XUxEypFRuHJec7y5uo9Zy09Kh8G2RdpWTrmIZZLzrmdFKIsxvMhgcqdkxUgdnYX0AZcm
         b33g==
X-Gm-Message-State: AOJu0YxG31DbEVPAUZY8m7EzRgG8fYHpyssuwswsz1rAPFFvnBNhYtJs
        jXOAHv6j78Q06brLPbbyqx+ex9fUFX1Bpg==
X-Google-Smtp-Source: AGHT+IHIgCsAuluPOGNLPhayt0PkDD6Q+/x764DsTl83Pzkc3sWG0kDukyIRWA6mUoNDqDii5/YsUg==
X-Received: by 2002:a81:4e4a:0:b0:5a7:ca59:82b9 with SMTP id c71-20020a814e4a000000b005a7ca5982b9mr17799482ywb.16.1697441016462;
        Mon, 16 Oct 2023 00:23:36 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id j190-20020a0df9c7000000b0057736c436f1sm1970714ywf.141.2023.10.16.00.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 00:23:36 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d9a4c0d89f7so4853285276.1;
        Mon, 16 Oct 2023 00:23:35 -0700 (PDT)
X-Received: by 2002:a25:d0d6:0:b0:d9a:54d2:3af3 with SMTP id
 h205-20020a25d0d6000000b00d9a54d23af3mr18123368ybg.51.1697441015007; Mon, 16
 Oct 2023 00:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231009-approve-verbalize-ce9324858e76@wendy> <20231015-qualifier-campus-97bf09059d51@spud>
In-Reply-To: <20231015-qualifier-campus-97bf09059d51@spud>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Oct 2023 09:23:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>
Message-ID: <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 0/6] riscv,isa-extensions additions
To:     Conor Dooley <conor@kernel.org>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
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

Hi Conor,

On Sun, Oct 15, 2023 at 2:22 PM Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On Mon, 09 Oct 2023 10:37:44 +0100, Conor Dooley wrote:
> > Now with the RFC tag dropped. There are no changes here from "RFC v2",
> > other than the addition of tags that were provided along the way. I have
> > not added "Zfh" to the T-Head based stuff, as I can't actually read the
> > documentation that would show that they're encoding-for-encoding
> > compatible with the standard extension, since it is apparently only in
> > Chinese.
> >
> > [...]
>
> The first 3 applied to riscv-dt-for-next, I expect the rest to go via
> their respective platform maintainers.

I sent my last soc PR for v6.7 last Friday, as per the soc deadline.
Feel free to take "[PATCH v3 4/6] riscv: dts: renesas: convert isa
detection to new properties" into your tree for v6, if that is still
possible (I have just provided my Acked-by). Otherwise, I can queue
it in renesas-devel for v6.8.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
