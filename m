Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B23726544C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 23:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbgIJVmt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 17:42:49 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45268 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730680AbgIJM4n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 08:56:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id g96so5210557otb.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2020 05:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=btETPjdOdP0VzFcqrLBzUykLPUNEpuLAEA2xfMk2SeM=;
        b=YiuC3iDPO6k0iym9gCnXaIkoqgOouqJaH8r1BcrwP1Y7yi5iAmbO1Kvor+qJjUobZN
         Ip3RlZ0lymzlR07Zvp87qHy2Q8M9lVHVDI7WvzZlva8YR4acEpzs/g+u7qiK0KuF/61y
         66WI+JNQeB4aRK9bZ1/31H//JKxa+RaHI1QLqP1bPGb6/xsJuGNN/CBrGCJTHmwMuwV8
         U/fT1QPQttZxqGFJ3ywBVaw5TTA5//dcrBK0gTuoi7mJ24b/WXo1EPuX0BKGTIv0t3Q/
         G/Xbx+5+03NXfTB/cIddF7mOssHuZ1ADXGIziezNXJTum4jstehOOyGd6HrT5H03U6ji
         tq1Q==
X-Gm-Message-State: AOAM530Jbo24VTdJQOdF7AJpHCfzGYCVFseJqvhaEvSimkhtTfChvXmO
        Wkw95eYm6YhGTBl4nljJEdaVBcmGOI0kT37HcQk=
X-Google-Smtp-Source: ABdhPJy6LbIOst0S+aSeApAn5m6RkzND0aMUN5wEvMZ8ZhsHoz18crEDHhWsfkBWkR0Z2gkhWLta5u0h7ltcVc4BVmw=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr3889043otb.250.1599742602539;
 Thu, 10 Sep 2020 05:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599657211-17504-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599657211-17504-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 14:56:31 +0200
Message-ID: <CAMuHMdXYXrLGNjJqDdD8qsWbVhKRb4x3=yhVjdsL_Hjv0BeNkg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add r8a779a0 CPG Core Clock Definitions
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Sep 9, 2020 at 3:13 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add all Clock Pulse Generator Core Clock Outputs for the Renesas R-Car
> V3U (R8A779A0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
