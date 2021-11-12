Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3EF444E749
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbhKLNaF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:30:05 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:47057 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLNaF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:30:05 -0500
Received: by mail-ua1-f50.google.com with SMTP id az37so18714569uab.13;
        Fri, 12 Nov 2021 05:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9iJ184pTnCaa6ehbVjWTeQI8DGobiB3mmOI1dCbKMU=;
        b=ozU7khvKB6o0MUi1UDVWQFR0CAoqR3UYEViDrK2SwnxZtYK5LgmU+p4w6eR7wiZSyX
         qnI+zZtIrRSYOGbjqJf6YPUCvdiO7sko0FEwgq0JcsDJ0/83/n24iSyVQWhLFZkcE+JR
         AaTmKBj9jkYn0jggAZa9DEE8W0Hh9oEQL+/VOn72m4F1hfJ/Pa+FF2qAvKB2Mjmyif+e
         8gZaODyRqftlunH+Y8LOISvmr+TRYx4nBy9Gt0T0SnXNzgH+nUshwUJuOUi3TGINaaAU
         CYQKT7y0lAUHf2EzsryHhmFc5FG1RMCcmKTGb3xZxgbvOYu1Mb9eB4mAwHSHwQSOUSBJ
         BsxQ==
X-Gm-Message-State: AOAM530MwMqStmShExaaQ/kpL1N/l4WCx2XwWeAbJ706flyOnJd/wFVU
        7VUtJsx0510yuPnzR4mOxKfcfa0QXiwIvw==
X-Google-Smtp-Source: ABdhPJwbzuT11yIlKdXUaG4f/Ugbe/Hc2MqwQgm4ZVreV5yAJZx3rJUqaBzNiXWNVLyyEiCIdnqFfg==
X-Received: by 2002:a67:d31c:: with SMTP id a28mr10177273vsj.20.1636723634012;
        Fri, 12 Nov 2021 05:27:14 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id b129sm4282952vsc.5.2021.11.12.05.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:27:13 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id l24so14494578uak.2;
        Fri, 12 Nov 2021 05:27:13 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr10123213vsl.35.1636723633313;
 Fri, 12 Nov 2021 05:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-10-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:27:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW8_Z0qGq3CLyAT19Ju596_v4si0CCSBmf9YMYZJ1yKEg@mail.gmail.com>
Message-ID: <CAMuHMdW8_Z0qGq3CLyAT19Ju596_v4si0CCSBmf9YMYZJ1yKEg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/21] arm64: dts: reneas: r8a774b1: add SDnH clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
