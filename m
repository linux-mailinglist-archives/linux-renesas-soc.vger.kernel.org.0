Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11ABB7D7F78
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Oct 2023 11:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjJZJW0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Oct 2023 05:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjJZJWZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Oct 2023 05:22:25 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00066184
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Oct 2023 02:22:23 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a7afd45199so5193617b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Oct 2023 02:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698312143; x=1698916943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WYXhrqPv+yxcJyje5S7Nyo29EB+cd9y/YPgOVg+ufg=;
        b=Lnp9jGoNoLeX/9oE4sD4W8yhcQWz8bNPNIIVAR0CiQHs12v7PHItELeoii81xYT2mm
         tMN0rRf3jY++ChGy5oNmSGozvnd/a2P6+pSt3asasoDsTB9zOor0uEm6EB4E6b8/jn+i
         KO4zhcX5fwtv4GEkMRpORWPmSZJ4n9nWn9IN/eLNCYWTzhCbBq/DjpwUrQIeimRFykHW
         H5tgJ53YJkv2tpHxPo4nUhs1bzp9vA0Mu5N+TbL7QczpXfDqwLoYgRvBURpz8gZ3e5od
         NoD43HP1AxRLxVAU2Y99SFpto1DulhVVHTioQwoUuU9h0rmvLal/KZyqX/qLgZbIwWWv
         6CjA==
X-Gm-Message-State: AOJu0Yw/mRAdI4dkwhD81ji3/leKalXrOnVpJZkqpMpEHuXDlg0egnri
        UvrZSnM+loQu2y0xk3mf3cFKdVp8uStB/Q==
X-Google-Smtp-Source: AGHT+IGoTiJ90EZTL8HEnTnSd8RXVf4vz+Ss7IKsilDQdvOTUiClj0cXJ/Fn+wAfQtWDP2l1Rub5UA==
X-Received: by 2002:a81:6d92:0:b0:5a7:a874:d83e with SMTP id i140-20020a816d92000000b005a7a874d83emr19524767ywc.42.1698312142908;
        Thu, 26 Oct 2023 02:22:22 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id s124-20020a817782000000b00565271801b6sm5831137ywc.59.2023.10.26.02.22.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 02:22:22 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a7be88e9ccso5013117b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Oct 2023 02:22:22 -0700 (PDT)
X-Received: by 2002:a81:a090:0:b0:5a7:baac:7b34 with SMTP id
 x138-20020a81a090000000b005a7baac7b34mr18072832ywg.28.1698312142181; Thu, 26
 Oct 2023 02:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231018052654.50074-1-hch@lst.de>
In-Reply-To: <20231018052654.50074-1-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Oct 2023 11:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHc_t2B48QwiJFwKRqhyWS1GRbZgu6yuxer4E=UKQ6zg@mail.gmail.com>
Message-ID: <CAMuHMdXHc_t2B48QwiJFwKRqhyWS1GRbZgu6yuxer4E=UKQ6zg@mail.gmail.com>
Subject: Re: fix a few RISC-V / renesas Kconfig dependencies v2
To:     Christoph Hellwig <hch@lst.de>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Samuel Holland <samuel.holland@sifive.com>, soc@kernel.org
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

Hi Christoph,

On Wed, Oct 18, 2023 at 7:27 AM Christoph Hellwig <hch@lst.de> wrote:
> this small series sorts out a few Kconfig dependency issue for the
> rich set of RISC-V non-coherent DMA support.

Thanks for your series!

> Geert suggested for it to go into the soc tree, which is fine with me
> if I get a stable branch for it as it is required for further dma-mapping
> work.

As Arnd asked me to send a PR to him, I'm queuing these in
renesas-fixes, and will send a PR momentarily.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
