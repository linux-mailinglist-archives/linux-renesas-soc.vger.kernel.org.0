Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2F382324F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 13:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731669AbfETL1J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 07:27:09 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:37549 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730727AbfETL1J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 07:27:09 -0400
Received: by mail-vk1-f196.google.com with SMTP id j124so265416vkb.4;
        Mon, 20 May 2019 04:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JVn4f0QCPxxczdD4sYl+3GS6XZA54vG4TuK18txcbfw=;
        b=AOJ5xs1k5ehUwUzO/35xbAQtR7M35QEJWlfvj1iYNwglB7kyvtI42Gw/rFjl49L0l7
         es/SC8wduoxkIuJArNb90Ry8EWOKADukwjKstrlSUidfhEMMeQMkkAlzjZm0yHn/ne8j
         V9ZjAIWte3CcvQtuMqaamSubXbUEhNNhl7wRsKvt7EqbkXg9XRUs7RfiCKW18uHnfNqV
         K7jXxVJCEgNR+gpM64oIaLBln6LurH8gl1YCbTRuHtNVB0SbqFhw1RqRuUDcsHy/OaaB
         W1+07a4SFkRvV6lRTGSVFY5v5g3nZp2Vr8tUzy1J+sNNJT06e8ol6TduStflRNkuJhhd
         xiVg==
X-Gm-Message-State: APjAAAV1zzvSjJ4TBtQ16rMxVpBav6AgTyK5EPzQ4XyE7gzxfxFKvxvY
        0wTResYyumovpDk013yyR26aH6CBONGIK+KO8kA=
X-Google-Smtp-Source: APXvYqwaApm9b1VrKDSgVewLUKxJ8c2EuhZdOLeZqAKZjmD1Bq5Nav2CMje3OBpVPTrW2u0KAp/tU72M1XsuZ5N2K5w=
X-Received: by 2002:a1f:2fd2:: with SMTP id v201mr6271659vkv.83.1558351628028;
 Mon, 20 May 2019 04:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190520093446.30895-1-wsa+renesas@sang-engineering.com> <20190520093446.30895-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190520093446.30895-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 May 2019 13:26:56 +0200
Message-ID: <CAMuHMdVh4Vry1OMYhBc-oGSHEwyeLtydoJEc8VPThXiMsp9rWw@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/3] regulator: da9063: remove platform_data support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 20, 2019 at 12:47 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> There are no in-kernel users anymore, so remove this outdated interface.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
> Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
