Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E135AF457
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 12:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfD3Kjx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 06:39:53 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:40482 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfD3Kjx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 06:39:53 -0400
Received: by mail-vk1-f196.google.com with SMTP id l17so2980362vke.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Apr 2019 03:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mR/0Mb/Fl5mcPDAiOBxP6dZhPg+wmfrKW8KS3zZERkE=;
        b=q8OuNU2e4SgNN+zhcvqAwZc5mbVp1XLfod3++403AtIF/z0EhMigPnJidqGpXbF1ob
         sdCpu0GJMvFhjGUYfcKnCvgmPn/LhZz2MFCNI7aoFpG6n1+zRAsLhI5vTdtD2DRPTWsT
         0L0ReMrPERH28pbY2RaNj76MDM06WpWVvcF041ab5RaJOLXtYRJt1I35yPFR1Cf9lg3s
         BxujR0hIiSZZrclfNtPsPBmHMrkgwNIXTPgyrxLlCShw+E+gDR2K8Jnu7Ck/qk1rSAnx
         gePyCFN70TZMSEAR3RD4AGGdbK/dYn1ms/WFhuzEUJUKD9jLZkliBrNXlt2ydBJlkqcm
         S0iA==
X-Gm-Message-State: APjAAAWhbIUHddwFkPiszX6PvDug4uSEgfMUQLzUuzilOo4PmH1N+7GK
        vbYMc3m+fw8C0iEFpm1l7aSJczRPYUNqGujL/htqsOoB
X-Google-Smtp-Source: APXvYqw4m7dmYnq6inQkI3pgwDlYlx2JLxadQdLG8Lo1zidMECsHB1GwO5CwlyTNkuLsdX58H12HYjaxT4c2G2fwAhs=
X-Received: by 2002:a1f:1284:: with SMTP id 126mr35051277vks.72.1556620792028;
 Tue, 30 Apr 2019 03:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190317021954.GA4912@pendragon.ideasonboard.com>
In-Reply-To: <20190317021954.GA4912@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 12:39:40 +0200
Message-ID: <CAMuHMdULgs_s4Ba+hqBwZfqMJQfQt9muepiJON1U+V0ka7XG=A@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] DU LVDS dual-link mode support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sun, Mar 17, 2019 at 3:20 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The following changes since commit 3a7d2f4f4427f4b241f8240e370099e2ec1fd307:
>
>   Merge branch 'etnaviv/next' of https://git.pengutronix.de/git/lst/linux into drm-next (2019-03-12 15:20:57 +1000)
>
> are available in the Git repository at:
>
>   git://linuxtv.org/pinchartl/media.git b3ddd36a2b05
>
> for you to fetch changes up to b3ddd36a2b05074db0810a0f6508562f80045323:
>
>   arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its companion LVDS1 (2019-03-13 03:42:41 +0200)
>
> The above commit is part of a branch name drm/du/lvds/dual-link in the
> same tree. The two top-most commits of the branch are hacks meant for
> testing only, so I didn't want to include them in this pull request.

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
