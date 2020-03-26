Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF776193AC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 09:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbgCZI02 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 04:26:28 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41713 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727611AbgCZI02 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 04:26:28 -0400
Received: by mail-ot1-f68.google.com with SMTP id f52so4944680otf.8;
        Thu, 26 Mar 2020 01:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=osutZtQfmkoMd5HWFtAhQGhwew2bnQtv9ZFwUibnqd4=;
        b=N6F6/AQITXFd2Xj/jQKtIafOCYwDas2uY11YXaHoTooDC+yn6ORuzSN9qQa0rR/Spe
         tC+gRVORP4OJO12uvSAnqZ25U1r/sdDQBXjZIMSuFukZHYPfxN5wFiFKnV00ZmeXR2Qz
         XY57fkud4oZ8GyC2qv+iVOjbG1+uerqdQ3b52fqDbAfJSoFogwVhvYgP2FFJ+btt2V5v
         cfOMv/nNzrtEC7+6ASSx+MK6aIvLwL9oOZQsZiXy3vjEt2DyWX9JLcy0bgY4/vOksEDQ
         ZIx0I3MI9eDlKx/VmGWtN3vfep0ANTvVre9Ck2+EwnhwyEcG33WD7TQKfCa4cQzWCblc
         KNyQ==
X-Gm-Message-State: ANhLgQ21ITkjWJrZ4ZXwEjLe/xUPTvP05rGNSqShuSbWkO1RxW6iHyOE
        KeRQHCFJ3LADoL79oOHXmX2gYUDepYF3B2rP9xM=
X-Google-Smtp-Source: ADFU+vvVCUIr0w2DcIAQGME8zhwaTi9rVFKYS1NWtRKkqP3JP+1WstkOo8rfIHfl8dLQfUHujLppoQMiNK9gMaxZbMQ=
X-Received: by 2002:a05:6830:15c2:: with SMTP id j2mr5147028otr.107.1585211187149;
 Thu, 26 Mar 2020 01:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <1585200608-30103-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585200608-30103-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Mar 2020 09:26:16 +0100
Message-ID: <CAMuHMdWDBN3GHvJWp3FkoiWxJMNLi=LZAiUhmvBZtKGC0_jxOg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clock: renesas,rcar-usb2-clock-sel: add
 r8a77961 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Mar 26, 2020 at 6:30 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds support for r8a77961 (R-Car M3-W+).
>
> To avoid confusion between R-Car M3-W (R8A77960) and R-Car M3-W+
> (R8A77961), this patch also updates the comment of
> "renesas,r8a7796-rcar-usb2-clock-sel".
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Changes from v1:
>  - Update the comment of "renesas,r8a7796-rcar-usb2-clock-sel" for r8a77960.
>  - Add Reviewed-by.
>  https://patchwork.kernel.org/patch/11457021/

Thanks for the update!

Will queue in clk-renesas-for-v5.8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
