Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02232459E8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 09:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbhKWIyq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 03:54:46 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:45986 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhKWIyq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 03:54:46 -0500
Received: by mail-ua1-f50.google.com with SMTP id ay21so42172159uab.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Nov 2021 00:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IqL0NjuO3FYhY8cvw0WnVN+tuYYY0eWLSckj+X2x2so=;
        b=xVp3lNtozKQ3+0cYNbbNiJum8fODeE0TEqs9yauOe2rxG/0ik40rJci112UlxXCmkn
         fkpGBBQ+V357vUXRSSXI7vJrNFFm89vw4icLzRgms90HGqQWV6cmHSc4hWlXH8l86vSe
         kmpcsuCMjmE0Y2vrdixax6u1bBl47SCguHYgEYeu8zR1nJDnfq/J/QldR+YN4cc9h5ey
         tSd40WWNQKO78/2qujPgvqfXvdSikrDmSw3ZxBIyeSbf0drhiWwpvg8gEmreJnd2r2y4
         EZBohViIB2eUJ9hIBFvSgCx5KjNABVfJnQRzGx97U/GbftWnkpC/By3mJsNTBGIg+qiL
         LpXw==
X-Gm-Message-State: AOAM533i00KR5LTpFSlIBHCvt149OLJ2OAiW/GLmICxxuI6aU0xAbjmA
        SC7Iw/KM9V1lB4AG7QmcnBsNrG7z2hMDiQ==
X-Google-Smtp-Source: ABdhPJx4wDBXrGfxs7Wwve9qc+6ACNhpAHLS8IhqQ75Xptea16HP+RIQslCi8AUVdnLTW4TWvAOuAQ==
X-Received: by 2002:a05:6102:a46:: with SMTP id i6mr6576751vss.19.1637657497800;
        Tue, 23 Nov 2021 00:51:37 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id f26sm5679991vkl.51.2021.11.23.00.51.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 00:51:37 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 188so8980748vku.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Nov 2021 00:51:37 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr7166868vko.7.1637657497234;
 Tue, 23 Nov 2021 00:51:37 -0800 (PST)
MIME-Version: 1.0
References: <163742290656.715.15960553560678858057.sendpatchset@octo> <163758390064.2984710.8277487311059323967@Monstersaurus>
In-Reply-To: <163758390064.2984710.8277487311059323967@Monstersaurus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 09:51:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZQfJ8Je-BLRGuFqdFE7j_4RkmMAJiDspVmAK93wdUPQ@mail.gmail.com>
Message-ID: <CAMuHMdWZQfJ8Je-BLRGuFqdFE7j_4RkmMAJiDspVmAK93wdUPQ@mail.gmail.com>
Subject: Re: [PATCH] r8a77995 Draak SCIF0 LED and KEY Serdev prototype
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Magnus Damm <damm@opensource.se>,
        linux-renesas-soc@vger.kernel.org, robh@kernel.org,
        johan@kernel.org, geert+renesas@glider.be
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Mon, Nov 22, 2021 at 1:25 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> What's the maximum speed of the SCIF? I could see this being further
> used to provide a software defined controller for RGB LEDs [0], which
> have often previously used SPI in a similar fashion to your proposal [1].

The problem with using a SCIF variant to drive WS2812B RGB LEDs won't
be maximum speed, but speed accuracy and precise control of bits.
I think you'd be better off trying this with MSIOF instead.

> https://github.com/msperl/rgbled-fb/blob/master/ws2812b-spi-fb.c
> https://www.arrow.com/en/research-and-events/articles/protocol-for-the-ws2812b-programmable-led

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
