Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 863A64562C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 19:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbhKRSrC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 13:47:02 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:44599 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233889AbhKRSrC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 13:47:02 -0500
Received: by mail-ua1-f47.google.com with SMTP id p2so15780057uad.11;
        Thu, 18 Nov 2021 10:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/igAPULmTfgLhL5fHiLq/DTc4xiwavj/zLxqcwtodaM=;
        b=yR1JjVHmdiAVWFoMCqKIvu97TMD0ztj3ZEK/DTN9uXOog0cAF0XsVc880w7axWiTXn
         IMe6u/T0feHdf8AGC1/cEP7MHYkxEGjE6M4V4xt2LQ//Dc27YYqzJlvmj2wXs8MnlW2O
         /Da5YZv3NhUITecuNxDiLMq59HXxLexUybtTxxSFW/TDqV5vQv/aqRqwxz/oYAD1yXGV
         9LOYSf9tBO41ukZifwXGmB8HCganPHBvA8bYdOmhQ3lQu/AQRqE/gg3kaK5wsSxgEye8
         McQFj6xsw6+BCtiXY/fUIx/6EsC/lSEEGIy6j0gm8WO59My3YWacf7dQE2TQjapu7hML
         U95g==
X-Gm-Message-State: AOAM532i+fyCbOwrOQ+4r0zRhNZPV/t0X2UnJeCowPGHyUWUSPH9JMzn
        xcK3wu7EXYyIbil+q9RDsXQbZmzoflAA8Q==
X-Google-Smtp-Source: ABdhPJwjZFp3W5qQgmjGHl8xrMiGI082VeXF+TwEpKKjHnZbTJcxaTnuzuxJlOA1Xl5SkcLBn7/1sg==
X-Received: by 2002:ab0:22c6:: with SMTP id z6mr40037757uam.80.1637261041230;
        Thu, 18 Nov 2021 10:44:01 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id c2sm346058uab.11.2021.11.18.10.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 10:44:01 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id ay21so15785232uab.12;
        Thu, 18 Nov 2021 10:44:00 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr84419879vsj.50.1637261040791;
 Thu, 18 Nov 2021 10:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-7-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-7-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 19:43:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOacey-KtGWLHiTiWGKVcCnRpVhg=+sTMW0P_CfvHO6w@mail.gmail.com>
Message-ID: <CAMuHMdVOacey-KtGWLHiTiWGKVcCnRpVhg=+sTMW0P_CfvHO6w@mail.gmail.com>
Subject: Re: [PATCH 06/16] dt-bindings: clock: renesas,cpg-mssr: Document r8a779f0
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add binding documentation for the R-Car S4-8 (R8A779F0) Clock Pulse
> Generator.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
