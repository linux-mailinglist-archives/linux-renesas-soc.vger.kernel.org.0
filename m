Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A9DF454
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 12:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfD3Kix (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 06:38:53 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:35112 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfD3Kiw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 06:38:52 -0400
Received: by mail-ua1-f68.google.com with SMTP id g16so1896164uad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Apr 2019 03:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nCx52QKrbVQNwgUV7bTEUgjCTO2c0c40UMimOMZnieU=;
        b=r/j4qX4oY7YxiqSmVoSnqtH7wnh/JSY5Gsav8TJycdcVaP16NbCa2asm+u+XpyBURJ
         e9u4fqttc3hfndPhVvPK6MYe3pxFLDL7hYe/SAS31Wj2NhakvLTn3jQ7GCgzlmeLaFdb
         6l8nvJJZLkSSA2TZvfqc2i+K0wJIkhKuWBxoLpLQlZMoa0DBSB64Ezrsi9+436BsKNrE
         UazpkUsEiPpeT6CFqFB6WXruGJ5Jl/Ss1pzns55bry6nAvpBLFRW3Bx5IHMLFZvcYUK5
         S4ariDWQkguAbR0psVKs7WpiO1lc5T6zlqwJKr3NVaRzOhTSt97xkcY8Rcjx8Gb7EzFS
         h0OA==
X-Gm-Message-State: APjAAAXO989FeRrLEqy7pVW+T+gR2GA3dtQVGWzkVNuonU3F11beId45
        luXellvrMoV+DzF9Y4gEUQDu585R9v/KeLoquM/KKg==
X-Google-Smtp-Source: APXvYqyZUkzToAWPlNt8vZKDyenrnSY5ZhKZN5OlOws5UdPDEEFKeiId5jwsOqt7nRvKcQ4YnY+CnY8nbFS/4KfXDU0=
X-Received: by 2002:ab0:7797:: with SMTP id x23mr3252477uar.28.1556620731777;
 Tue, 30 Apr 2019 03:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <4714815.IyZ5WZzCdP@avalon>
In-Reply-To: <4714815.IyZ5WZzCdP@avalon>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 12:38:40 +0200
Message-ID: <CAMuHMdUiGNbTpQ-kSYFyu5c=ktFSO+FO-K5C9UPDGOgzBfSbZA@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] DU -next branch
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sun, Dec 16, 2018 at 6:11 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The following changes since commit 272c1a9b493986a95219dce674c49877d98cf90f:
>
>   Merge tag 'exynos-drm-next-for-v4.21-v2' of git://git.kernel.org/pub/scm/
> linux/kernel/git/daeinki/drm-exynos into drm-next (2018-12-14 11:27:24 +0100)
>
> are available in the Git repository at:
>
>   git://linuxtv.org/pinchartl/media.git drm/du/next

Please rebase your branch. It conflicts due to newer versions of some commits
having been accepted in an upstream integration tree.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
