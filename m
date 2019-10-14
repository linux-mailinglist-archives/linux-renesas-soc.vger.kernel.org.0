Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1930D5F4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2019 11:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730942AbfJNJt6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Oct 2019 05:49:58 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37957 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730677AbfJNJt6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Oct 2019 05:49:58 -0400
Received: by mail-ot1-f65.google.com with SMTP id e11so13260820otl.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Oct 2019 02:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nf+fM/3PuyBlhAi8/6Sa2Tnn3eMSHcjqaBNGv0oGHEI=;
        b=uVGuLtRl1Cqn6QgQ1Ovj9+bbK4LLZYo8CmE2ApIyB2HM9truFPdSZSr/ZTtTucnK1g
         vjZDeN281SqyVEeGRR3CHN/seZZiojjOWQuiYQ/QEqRnHBC6HzaQjyEtx3Chpycq2I1d
         3Ap4nDWbBglXh0vxUKi0sW3ktLNtdCooMpPn1FbGH9TscgG9DgaUSrWmDzSFnb0oYZYe
         v+1b4p8vwqQYSZ4u84AZNsfefFhh4uvAiFyXiQY5S0fT4f6Xej8qYzkMg2IUUtuInrXe
         NJEu6YuoNWgDMZDBAzowpZm+7F9eFJWxoTbCOIhrmaUU2b/Ey19uvJB7GCrJVsDPxLtj
         VjVw==
X-Gm-Message-State: APjAAAU7pmH+ND7oN1OAgP6wwO3s6A9F14aFL8hjGDqKB/ClHbsaEmJ6
        A6cGbiqTo/YpLpYdXWlZB+oQx8rYNsuIOB9PDCEiBuzf
X-Google-Smtp-Source: APXvYqxqdVthY4lHlI0mfmTJR9lGcdeNSdsTk1PQz3Im02cfxj4QQE+Uq6xheLSn2iUrvQpEZWQP34gt8eW10EDw/Ds=
X-Received: by 2002:a9d:7345:: with SMTP id l5mr14333732otk.39.1571046597579;
 Mon, 14 Oct 2019 02:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191008060619.30237-1-nobuta.keiya@fujitsu.com> <20191008060619.30237-4-nobuta.keiya@fujitsu.com>
In-Reply-To: <20191008060619.30237-4-nobuta.keiya@fujitsu.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Oct 2019 11:49:46 +0200
Message-ID: <CAMuHMdW4AAPfrqy3Y2qJFEgeD7=cCaydLh3=UOWZD65rXM6rJQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: sh-pfc: pfc-r8a77965: Fix typo in pinmux
 macro for SCL3
To:     Keiya Nobuta <nobuta.keiya@fujitsu.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 8, 2019 at 8:06 AM Keiya Nobuta <nobuta.keiya@fujitsu.com> wrote:
> SCL3 is assigned to GPSR2 bit7 referred by IP1_23_20 macro.
>
> Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
