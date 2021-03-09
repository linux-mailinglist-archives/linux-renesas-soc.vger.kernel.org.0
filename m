Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F2333257E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 13:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhCIM3e convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 07:29:34 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:44352 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbhCIM3H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 07:29:07 -0500
Received: by mail-vk1-f170.google.com with SMTP id k1so2929063vkb.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Mar 2021 04:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PRbv7/CdV798AFxDqr8fpQD6ZHrmxYT5FgPz23cYeqo=;
        b=L4Fay303UvWH5V8nN+TzbcpR5VN3L8ItONPctpqRtLgi9Xy1UI1c28FCnCVG2MXhna
         yh7T1mOarYiAXyPWVtUQUoANKnYsYRXTZFQSKnnQDaR3QJhCF4iZUQXhetUqccYoWjP0
         HAiSb2Z2qFaTMggu8srgwzJVoHjh9P+1VTPUjCOtKo1PX62IF6I0dzdf13BtmUHGbVLN
         ix7cq8JkjWck4tbSBtL78anPjXi5hTjKdOLfF0H63JkVoplOukYGEEAlNYs+BwQmGiB3
         mw0Q/QGDggzKbGXkl+muG62jfr0/QTUnEJp3JsaxnrQTKEXwGjBgu+QCaerqSiar3N0k
         7psg==
X-Gm-Message-State: AOAM532YAbx8SOkN7dUVBBTDbBshbdxd1ZJb7E2N2oPtjdZLadv9Al6d
        4x2E/vVvfGF8KtP2u0wuqt7ty+DGGpWKiboQ/Dk=
X-Google-Smtp-Source: ABdhPJwfzkCZ5hbRBprCujfsAYmnr739EvWjvLXQIiLE7gpgXGw7CluORWogNUJk4NetPhYJcfuzizXEV7xfULIKkSw=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr16083272vkl.5.1615292946751;
 Tue, 09 Mar 2021 04:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20210309114930.2433711-1-niklas.soderlund+renesas@ragnatech.se> <20210309114930.2433711-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210309114930.2433711-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Mar 2021 13:28:55 +0100
Message-ID: <CAMuHMdX8=bx_eM+5M7=1NiBaDjQROG7tBovdPR7SPpyryVdjvQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] pinctrl: renesas: r8a7796: Add vin4_g8 and
 vin5_high8 pins
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 9, 2021 at 12:49 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This patch adds vin4_g8 and vin5_high8 support to the R8A7796 SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
