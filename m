Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8746E4A2DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729050AbfFRNym (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:54:42 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43406 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfFRNym (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:54:42 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so13206027ljv.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 06:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l5S8zrYOqFMC/VE7BnyvX0SgYmokPnsTfDy4bcLulbA=;
        b=UGML8NcjZChmU/iZyej0rH6zNPEt23dgeR2KL4MsXEPiD42OOFbgqZFOdJySSO0vI6
         lkuyhomkKhZ+dvQ9fZpCgAJEO9fzaKxm8JeTddNMXmFRFHdFl7viXu+FlbmD7huRqEBB
         AvpWqfKoqwJjzuSzfPJ8hOeKzDSGUpxn/q0kKQH6V6475R/9tF5oBwxiacQCg3LgiLR9
         L537PSt0/evMlhtPEKHggWi5TuIjeSGz99PA61YK+6Eyiur83/r9KG5WLDlM2XofwNXH
         uJsiEgwgZXwQVYmnTE7gSQeZQZ4/BMiU+LFhvFa72pHCh5v+JrJFyeiuz57kWbIhL5ns
         2YAw==
X-Gm-Message-State: APjAAAWEXMM6KyEGH1EZ2wMySa4PBfyxZerwl+ghb/Qzi9ggOodcy5Wf
        +xX9YU9D0hIVkiC79C1dksPSG/f/EH5TGr67ta3RZntc
X-Google-Smtp-Source: APXvYqy6cpY1EYJM0GYFh5ClFRB7Mob/znyWlwcHTjgFiqR6CurxNaaTT8lK1i2O2zVxSJjzVk9wWW5bVV7ovh3Q64g=
X-Received: by 2002:a2e:b0f0:: with SMTP id h16mr39409782ljl.21.1560866081312;
 Tue, 18 Jun 2019 06:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <156076300266.5827.16345352064689583105.sendpatchset@octo> <156076302818.5827.976723043537886578.sendpatchset@octo>
In-Reply-To: <156076302818.5827.976723043537886578.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 15:54:29 +0200
Message-ID: <CAMuHMdU_BfLBPvohz752j16FLoDb0X2tCR=UTFcuLo_Y45AKPw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add CMT0 and CMT1 to r8a7792
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 11:17 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add CMT0 and CMT1 to the R-Car Gen2 V2H (r8a7792) SoC.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
