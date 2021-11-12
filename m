Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB02444E75A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhKLNeF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:34:05 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:38869 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLNeF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:34:05 -0500
Received: by mail-ua1-f53.google.com with SMTP id o26so18847917uab.5;
        Fri, 12 Nov 2021 05:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9iJ184pTnCaa6ehbVjWTeQI8DGobiB3mmOI1dCbKMU=;
        b=VJ6CS5UA74fEQpmHDfhdIHCtkGpBXZH+PjFC2I/cjqrlcr3xx3f2AkMDN3ie2Jcd1Y
         vtoqe/trJBumiswXwyoTim+CgFEzMNG8GMsnhcdb85rN+jeWAOt3HpX10DhgnYcdYjbf
         sZ+o/D2C2bJbBTL7NqV5abvQgd6sHS4bXUF+Uyqxe4NbWSS7unO3CZAt4SFzwF1naoqn
         95EZRoGSNnmttBE3+tKtWq3pWAsu9l1eeYjry2XepBFZqJaOQFWdQGdsOa3/NEdsMlRa
         RUwH4m3VHhqMrtAB42/QfNKrFQ+iVE5BbYp2l238Ur6UxCRfXaxo8Lf5lLQiLhBuR9Wx
         Z+sw==
X-Gm-Message-State: AOAM5318rzrEHnE/HFdYzuYUHn0AF+hhy/4n56DwxmtH4TosSa/D+YKQ
        MHGt7iOFDMnwxG1NecnKIB+dTWRUeXaaZQ==
X-Google-Smtp-Source: ABdhPJzFcpSPEHLqKaLGePKaAaVYLn5rzJkdQcgHv0tjZUXesCl0zVhrdVI/QtZj71Ge/UD1312UvA==
X-Received: by 2002:a67:b643:: with SMTP id e3mr10127101vsm.33.1636723874231;
        Fri, 12 Nov 2021 05:31:14 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id p3sm4109926vsr.3.2021.11.12.05.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:31:14 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id o26so18847855uab.5;
        Fri, 12 Nov 2021 05:31:13 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr10319248vsb.9.1636723873635;
 Fri, 12 Nov 2021 05:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-17-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-17-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:31:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUt7EsqiAj1XH+ziTxMiEMiAe2GkjBS0SF00Ltb7NHftg@mail.gmail.com>
Message-ID: <CAMuHMdUt7EsqiAj1XH+ziTxMiEMiAe2GkjBS0SF00Ltb7NHftg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 16/21] arm64: dts: reneas: r8a77980: add SDnH clocks
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
