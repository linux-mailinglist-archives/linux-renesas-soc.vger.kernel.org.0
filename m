Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9CD6CFF74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 11:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjC3JLC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 05:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjC3JLB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 05:11:01 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7908265AE;
        Thu, 30 Mar 2023 02:11:00 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-54606036bb3so177243077b3.6;
        Thu, 30 Mar 2023 02:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680167459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUgrEGy06mRYTJ6+Fnkwy6fQKmYtb0zxLo/KimwlYl0=;
        b=iZb1y/kp18OjM0Kq3gSwosjzwiQ9X25s+BOpOi1G/jGCKCCtfieH3mJ3ns+MciqOkK
         JohsGn8iMGKJavLCzfJ7NBDghXFtutdV+JnK79nmq5v5FU9QQ90t0tYQjEFoECDY1K+N
         RTOnzGcvrztKbzsnJFg9EpeloCXm/0Z3wUQzGhg1wppesBorRwQtZHeMkdiNfr8SRark
         eiYWIDWOMpOvOBPnrKUntZ5fx8xFM5quzedrdqVuJ+it9KJIlMQVOxM8CGlJPwlXpDgy
         8Zx6+sQXfgIDJaLIMgPYx++9J4rHZiY0CkSPKpP3jXvnzlPWDvlu0B/H/ou0aG/+l9cU
         TU4g==
X-Gm-Message-State: AAQBX9etyWjgfJWSaZl9mwpjLBpn9Lld7SlBK9Cb6wTzJjn4+lT5Tu92
        uoXdTc7LIqNHHROewggMidwaIGl5iiaUzw==
X-Google-Smtp-Source: AKy350b5CJ9d9AI1pw43jDXZmGHIedCiprBYmGLf9hjRmLoZbz/xm5ECtEb56I9dsaun9EO4NPVkPA==
X-Received: by 2002:a0d:d94a:0:b0:544:b871:bcb0 with SMTP id b71-20020a0dd94a000000b00544b871bcb0mr21717391ywe.12.1680167459516;
        Thu, 30 Mar 2023 02:10:59 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 130-20020a811788000000b00545a0818489sm3430081ywx.25.2023.03.30.02.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 02:10:56 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id f188so4173136ybb.3;
        Thu, 30 Mar 2023 02:10:55 -0700 (PDT)
X-Received: by 2002:a25:1185:0:b0:a27:3ecc:ffe7 with SMTP id
 127-20020a251185000000b00a273eccffe7mr2807435ybr.3.1680167455140; Thu, 30 Mar
 2023 02:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230315064726.22739-1-biju.das.jz@bp.renesas.com> <20230315064726.22739-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230315064726.22739-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Mar 2023 11:10:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVi9y4-0ydwzbQUvK1azkMLcUwXyae=3wGuOt=bT-Urw@mail.gmail.com>
Message-ID: <CAMuHMdWVi9y4-0ydwzbQUvK1azkMLcUwXyae=3wGuOt=bT-Urw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Add clock-names and reset-names
 to DMAC node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 15, 2023 at 7:47 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add clock-names and reset-names to RZ/G2{L,LC,UL}, RZ/V2L and
> RZ/Five DMAC nodes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
