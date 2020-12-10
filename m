Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5512D5AA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 13:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgLJMgk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 07:36:40 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38891 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgLJMgc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 07:36:32 -0500
Received: by mail-ot1-f66.google.com with SMTP id j20so203208otq.5;
        Thu, 10 Dec 2020 04:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SbywUHfxiOfCKevo8kgPT+2gmwbtXlw9HIdds9wF3Wg=;
        b=dsHjSais8143LLZNY/ibLw87m0x2wi0GJYfaphdM7iHRz5CSP42VtjyoRlG3TQ4yos
         dDGjT3I9eVBsK2xDZJDu8pj2ZmXFKA1VlbDnY7DnfM63qq/NYmtWhChAAThGg0iYWDvJ
         CtB1PnxvfHgeNhgApfvBwWS8mhagzmxpMgS1j8DAFz9WnSqH8kPQDDLbhF6cg4O0JNC/
         Bm8Tx+b1el51q/Td0d0/mv4ND5iVaDU//MKCd02LBj5kxXOtAWIQGIRGvDnB3XrGNp1r
         fnySp63Gu8c9ocDvdat69elfHlShSvcLVJ6s0oWkcRVJnKOPt0kFNMioeMWfxI8j8bVo
         XWPg==
X-Gm-Message-State: AOAM530XFf8I+aYgsqPOTugMZ2/PWRPI9M1a9g5RfavedspMMCL3pKXN
        X6lRre/oa2p4xMynJbwMo4NVvP31hEuqS+Dq4NlObcN4++c=
X-Google-Smtp-Source: ABdhPJxlve+3esP6xVlAXlMohU2fZdITHJsKExxiSclE09Oxa/rS5zVcXYgainTa8FzhHGHAT9T8FpJ7O7D4I87G/PA=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr5613985ota.107.1607603751413;
 Thu, 10 Dec 2020 04:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20201209195343.803120-1-niklas.soderlund+renesas@ragnatech.se> <20201209195343.803120-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201209195343.803120-4-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 13:35:40 +0100
Message-ID: <CAMuHMdWBK=wP=kVfvMJq7khQq_1-u=J4cdi2A9__Ts8P5z0BUw@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: renesas: r8a77965: Add TMU clocks
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 9, 2020 at 8:54 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This patch adds TMU{0,1,2,3,4} clocks.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
