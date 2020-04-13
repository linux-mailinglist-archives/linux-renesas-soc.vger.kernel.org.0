Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 901DA1A6454
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2020 10:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgDMIs1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Apr 2020 04:48:27 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43054 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727770AbgDMIs0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Apr 2020 04:48:26 -0400
Received: by mail-oi1-f196.google.com with SMTP id j16so6868906oih.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2020 01:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=exm2r0UUT0P4p7Hs40+lu42doACHVd43vyKlgemSD5I=;
        b=eawJXLM9M7YjfPD6aOk53qQpCccxI1jnXCOGEDGds7cXh/W/N5x3brOeAEHa4DKryh
         2FVuTm50RmnTIg2D05WJ8YaQSl6TZx1RVamVmuFhJOxOx01HYovikgsxbJ69lLNPbsQo
         VYp3CXiNhCIL0Qp8yhC+Uj8LiI6hStWmprk8e6iF1236eNZ5809FphzCT0K0C+l1PVdz
         N38mTK3pXIdd/DskuSfS2gIAvFTd9BwEEpeDrfHx5RBmv6LzowtVNXH+EUbsKtQ57ZHY
         pi2myMnWPfNfXbbCZTvW72hVzhYuBzxgkZePvh+ppheax8/qLGf5nPcKjbYVmVlt6txI
         gszQ==
X-Gm-Message-State: AGi0PuaXjomk1rOPzrI1/9XsRcuLJKXvHGZmsH4mLIbAo069ukZ+8s1P
        zDzBq2/r/V1vys84QD7NYORrYl+2VKpMoqI7ZY8=
X-Google-Smtp-Source: APiQypIRw4E298ZIkxj3HfqzTNZ7uRZ6MHAIkxHqy3E/mOLEqwnKLKNB44LcXVLlkLXoMX4b8+MDS26C3jHnbFXYqhE=
X-Received: by 2002:aca:ac09:: with SMTP id v9mr10579999oie.148.1586767705653;
 Mon, 13 Apr 2020 01:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <1586515634-28095-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1586515634-28095-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1586515634-28095-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Apr 2020 10:48:14 +0200
Message-ID: <CAMuHMdU=87ekK0gbOLxF1447J-t3L2pKiyy14EHxFrV1U2fiVw@mail.gmail.com>
Subject: Re: [PATCH/RFC 1/2] arm64: dts: renesas: add PWM device nodes for r8a77961
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 10, 2020 at 12:47 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add PWM device nodes for r8a77961 (R-Car M3-W+).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
