Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19E74112738
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 10:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfLDJ0h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 04:26:37 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46382 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfLDJ0h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 04:26:37 -0500
Received: by mail-oi1-f193.google.com with SMTP id a124so6179895oii.13;
        Wed, 04 Dec 2019 01:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DHLuaA520iu3kg//SF8/Nfe9aqFyhED0HApj25RzCKQ=;
        b=d8xmkB1wSl8x27AdRLyQF7nlCtR8focDG2L2cP4qHAltxICTCEh6Nuz3TTSsGA8r56
         cnHddUnEehGwg3HpzXthX3A0QAkwd2sv9HCotIkThvUt/um6GVnPMp7FDY0DthPU3Tfr
         b5jLXAVvdrbSENoHPXxNKkbi9XkHg1xMlWMGk22Pix+HuwudFCTd8lbEhHAuWsa7eyZ7
         GNAjNOIz/ImshkjtkJBVvyRY8npHBAH3r0FEXNt5R6LDLKbsq3S8ZVF5TxU9SW0y1cVZ
         DifBTurPAthlm2GccXA+Z3X/+suDLfAIaTyzUvxBGq0/S+2v6WKjfyAdwIoXjkofNjp7
         PuWQ==
X-Gm-Message-State: APjAAAXJnSfZY/ARYHqEV9m9+j6X2QaMHHVErnmajLKNbBUQArGtSlQ4
        Mv1+FbuKK9kmfSp4Q7nHHwV7zwoMEBY3zlmxbsI=
X-Google-Smtp-Source: APXvYqwKwE20mXijV5ok5apPjOtaqqnDMtr2JrG/TNR/BGusVy+8PCITkmkXnDsrFAzC/Bdf5jcfXKjfMIQKrlw1tCo=
X-Received: by 2002:a05:6808:8ec:: with SMTP id d12mr68798oic.131.1575451596797;
 Wed, 04 Dec 2019 01:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com> <20191203200513.1758-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203200513.1758-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Dec 2019 10:26:25 +0100
Message-ID: <CAMuHMdXQ63v2+GoUpUfejYZi_xCqr0b9Tr9xS_dnL72_USF5Dw@mail.gmail.com>
Subject: Re: [PATCH 1/5] mmc: renesas_sdhi: keep sorting for quirk entries
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 3, 2019 at 9:05 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The two devices next to each other are super similar, but still, let's
> keep the alphanumeric sorting for easier additions later.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
