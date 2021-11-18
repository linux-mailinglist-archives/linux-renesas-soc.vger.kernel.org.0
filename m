Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E190B45633B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 20:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbhKRTPB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 14:15:01 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:42739 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhKRTPB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 14:15:01 -0500
Received: by mail-ua1-f43.google.com with SMTP id t13so15984354uad.9;
        Thu, 18 Nov 2021 11:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HdkMDs29UO263SyrrbBt9hoby4m3OB0fcbhQBysL57k=;
        b=cWeYxFHN2EA8Ma3WQzBJ89jWym5P2tffpbxqYIubIxUHNZQUsm69QWZL4BZHQy/4O1
         /7hHt4l8zS9z8YdbTsaNoaOUNs2CENr+65vzV6f0WMjamWm2a3qROfkqSoC9FJr5wMVv
         0F1QKv2YI/rFupPe8aVpiPevt2MDI/VNYt7rGaLH1/finVJ/C42gulVcrgZ+TdwFOBjr
         JQRuIwkBfVPHfC1IPaLvVnFeRZ8KwWg3AKEFWhBRVhtRlG5NLRVbycF5ysUz6hpVk6dv
         r5o82tEUQTbkx6MELQnAEBdyaNwgZz3iBjb5khGmjBf7tkWbcttgWA/rWio8oqIXPqw6
         ACqA==
X-Gm-Message-State: AOAM5302uEFKHgZdPE+q7AAbtGPiWlx5OzvYz0bUmjEAEiaBpwliViQS
        xznySt9nlMnCEB0/HcATvqn7owJsmZpNrg==
X-Google-Smtp-Source: ABdhPJwXiaat/w1rIMAx32H2HEhGOMuz6GBWT5jC73WkaEFxTiceWFuR1K1yBK5aJaRDmUbakGZjNA==
X-Received: by 2002:a67:ec10:: with SMTP id d16mr84227818vso.58.1637262719872;
        Thu, 18 Nov 2021 11:11:59 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 66sm452586uao.0.2021.11.18.11.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 11:11:59 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id b17so16134392uas.0;
        Thu, 18 Nov 2021 11:11:59 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr84874173vsl.35.1637262719162;
 Thu, 18 Nov 2021 11:11:59 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-14-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-14-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 20:11:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqVTH=mAwK-z1sJq7HE2jS1vRySvZpZ57WpN1h18isBQ@mail.gmail.com>
Message-ID: <CAMuHMdXqVTH=mAwK-z1sJq7HE2jS1vRySvZpZ57WpN1h18isBQ@mail.gmail.com>
Subject: Re: [PATCH 13/16] tty: serial: sh-sci: Add support for R-Car Gen4
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
> Add serial support for R-Car Gen4 SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
