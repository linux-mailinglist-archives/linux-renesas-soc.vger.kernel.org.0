Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D053E8D5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 11:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236632AbhHKJiu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 05:38:50 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:42713 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236605AbhHKJiu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 05:38:50 -0400
Received: by mail-vs1-f43.google.com with SMTP id k24so1072738vsg.9;
        Wed, 11 Aug 2021 02:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jFrsES6PK29W3F7zHpy8Q/7CDx1PGMKHOeHn4kSSpjk=;
        b=MFY0fWRVEBnfjSQsEplj4oYUIzWDR/ah1kJcHSGcMcO99u/xkEpcbuRbAY0pfr03dM
         ulaG7U7DC6fhna/TtHX+6uyWHmzgO0MI2OZQc+GTTsi0T8KvDpfVcBZ2EKVQ8t40vNg7
         p9m5nndiTd8iN2N4AtgVP8Bc/YrpcVSSW+yAgRk40tMnRxzeBAUSeSV1ywuDPTcGolFX
         JE5tBH+Ur/ooAqOivvxr/vnFRU9Ou36pOMpKzwwioC2yuZ88f9+D2AUd/YdHeLJFxGLJ
         x10UNTMupJaEXHjWGWOqE/dkpJGwfRNdg+iq+XEakYp57cBtyuB7jLTrE587r0zQemLR
         3HRQ==
X-Gm-Message-State: AOAM530oPGY3WU1UGgZNCrkwaT0IdW47pbsYBbzXNnSDi0Fiy1nf9TI7
        wQdcZPElyIPonekqVkMBhX+II/obVXOukTVxCFk=
X-Google-Smtp-Source: ABdhPJwaw19/a3af/wq9KAfUTaIhn/b/oWusE9PSK1kD5S7XVBrLMX/us0cmhGf351HBIl3Htr8XHfPPG6n8KuahPiE=
X-Received: by 2002:a05:6102:d9:: with SMTP id u25mr15945790vsp.42.1628674706266;
 Wed, 11 Aug 2021 02:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210808125012.4715-1-len.baker@gmx.com> <20210808125012.4715-3-len.baker@gmx.com>
In-Reply-To: <20210808125012.4715-3-len.baker@gmx.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Aug 2021 11:38:14 +0200
Message-ID: <CAMuHMdV7ZM9oZG-KU4Ap+H4YehnyGoZn+jsdiJ20GwMFNh+6uQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drivers/soc/renesas: Prefer memcpy over strcpy
To:     Len Baker <len.baker@gmx.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        David Laight <David.Laight@aculab.com>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-hardening@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 8, 2021 at 4:50 PM Len Baker <len.baker@gmx.com> wrote:
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. So, use memcpy() as a safe replacement.
>
> This is a previous step in the path to remove the strcpy() function
> entirely from the kernel.
>
> Signed-off-by: Len Baker <len.baker@gmx.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
