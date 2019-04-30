Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4985DF465
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 12:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfD3Knp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 06:43:45 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33798 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbfD3Knp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 06:43:45 -0400
Received: by mail-vs1-f67.google.com with SMTP id b23so45633vso.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Apr 2019 03:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U9/sGkrZikh2vap29yZ+1oQ0nficCe+bKD0aIyQ/tw0=;
        b=pkBIvgCubDZFXsAElljRowHob9k4YnJyz20x6txtiw27dZX5x9NeKxCE+cdNnMZFar
         g0QF3A2SSFtvBYgwDSdI6csGqmhQqOKYo3ZM6vhgvu6k60juoUB1ChO15caofg3QmtKY
         aRmNPde/Vl+tL9E+h4oUFeyELh+cXtc87//5nePaW7C80Qi+IL3YkuomJt0qHHekzZfK
         LziyoGLXlVo0nRUGNU0IG1XAmprYXcCMHWs0c6/GWDTt7I+bw9yPKAhSqjAxzHryQqN3
         3BebUjnGLSJyT2PztJ07agGk7RsnjR5qWTK9UIyOYwdQvyMt9ph+hAfhXbuFNCQPYDuc
         3oXw==
X-Gm-Message-State: APjAAAUmrkzaO0NcJnO8EMTifxVbPXRAp3WUO4H8huRP/bQtqkqLYBCL
        7OSaGKZDwN+LqEq6os25hN6Edt6FoT/vS9j2zOw=
X-Google-Smtp-Source: APXvYqzbY88dgUgROLLwXHN1i+1g1VqVZopRKmWCJXJerEoVahE8WsKAmtlAFqqBMbrtTJGSD/8FkBm9wTFQdSgLeSw=
X-Received: by 2002:a67:8e03:: with SMTP id q3mr24752557vsd.152.1556621023832;
 Tue, 30 Apr 2019 03:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190317200953.16323-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20190317200953.16323-1-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 12:43:32 +0200
Message-ID: <CAMuHMdXvy_Vo33XYy=bmGE6wVzpsW5FK3n5Du9YiF66mVksMAQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] du/for-renesas-drivers
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Sun, Mar 17, 2019 at 9:09 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:

> Please consider including this release in renesas-drivers.
>
> The following changes since commit 0f1d37e65a59e9db33ab85f6e2c9784768ef80f4:
>
>   Merge branch 'drm-next-5.1' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-03-14 12:15:02 +1000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git du/for-renesas-drivers

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
