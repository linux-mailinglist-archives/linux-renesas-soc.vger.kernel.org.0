Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE8512A65
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 11:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbfECJZe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 05:25:34 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:43390 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727248AbfECJZe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 05:25:34 -0400
Received: by mail-ua1-f67.google.com with SMTP id 90so1758997uav.10;
        Fri, 03 May 2019 02:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0L8W103NwwG4CIO+5UmjMmjTe3Uin3n4nnbApJPbqlw=;
        b=GXsLa/QzvBT64At59wb9GNjZVVjJc3Z2VFDlvNKK9BYzfyn7ZCYhg8yALSb++rxExM
         OJUcWDigaadnXFdQjovL1O0RK+kOqQBFMeLC2pbZHkz3E1k8DamGEJIChxGgZuju5bbH
         5hLTC7aJ1FJHO5bn3TnNHqySFg7X/ZPeqcadtnk42ttPNjzcc2R6ZUcwVLLJlnnBqnjS
         AugEkMBYx3+cqpIaP7kNCLiiEnlshlx6DJISnBi0H/1x8BKkWsEbOXVw42dIh9bTMySW
         y+2Qgh789pXzvvCVE1ptNPqKXKhVTnSKvyJoEsdoTNm/C8Mi5ukjg/vKLZMbetVJ68Fv
         TZSA==
X-Gm-Message-State: APjAAAXriMp2HBI2xp7esImLvYaYMhqI6fv3JipGA6UdCPhSa65jusTf
        vmyoGc/LzBo43cbKEYxmsMIUf3RBn5GAG8R96o8=
X-Google-Smtp-Source: APXvYqyI85n//U7x0IonDIZbtw+oHfeRGG7bHTfzVRJ16qmdoTXawybACtKzhKAscIWH7+TBeFyDQbDuRFapq0rfKtc=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr4675861uao.86.1556875532918;
 Fri, 03 May 2019 02:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp> <1556155517-5054-3-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1556155517-5054-3-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 May 2019 11:25:21 +0200
Message-ID: <CAMuHMdVd-bceP6cG3nnH_Maz-pkW0+LJkYki6B+6Qob1dAxvRA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: r8a7795: Add TPU support
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 3:25 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> Add tpu device node to dtsi for TPU support on r8a7795 SoC.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
