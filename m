Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76C06799E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2019 22:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfG2UYw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jul 2019 16:24:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53630 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfG2UYw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jul 2019 16:24:52 -0400
Received: by mail-wm1-f65.google.com with SMTP id x15so55027872wmj.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2019 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=R+VD6VEIEi7tCL1bsoquMaD4L7zvvZdE5nzH5R64hEs=;
        b=Iuz7L/Nf3iOvfqbCl+c2oWCdUS/FXB4wo6Se1dKpxlhSUn3HO8Z6BpAjjnTlzWGLzJ
         VcFyPubpOxZpKyjkcepvhW1uaE4/fnGKBlCVk+x4USItIR69Ez/sRuUooFg5Jy4Fh6Qw
         ZdQ1qzp4bscWz2L2Va5stXbn8uAXnjyWieJNcX4OkqF8OZ0hiAbwIN+rfw075ARBNrKs
         V01TOeSfcYvX1iDUU2ksq0WNm7PZcGw+Pf0Ap6JKQgbe5Sj8N/ueLzluUfCbagrVAG1U
         oLqavkWz2R3V4xaYUos4SrTYg6RwfVQUaSaBXc284GnVh5WYRIvtN26xxH35+vlP80nX
         eQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=R+VD6VEIEi7tCL1bsoquMaD4L7zvvZdE5nzH5R64hEs=;
        b=ddfzTE/QiNucRjf5oWtboiYZsx0MFNLUzAJh81syvqwXlehjqp+iafsVMoalr8Dm3E
         EIpT9qjhHKzILpiOsHPeGR9betu1X2CABxUSXuNhP/FjPlFLnneUFMF7y8Ve982D9hyF
         QtPf4/7j9d3lggtRBVaE7FTmpgYjF3DLrzp11OpluIsCzzJBOmVsAGkyKQ+B9e0tGbNe
         5j7czBDjZzx2VzJmnpX/lW+o45gIda2YW/ZNWpR58NQxLT3GQixNLHBC8iN3R5NJhWPr
         bn2/zguDnrieL+eXRyEsP+1frqLc4C3CT4CPW1BAfT5uFPJWy30/OvFAP9BjeAt8mJ8T
         bArA==
X-Gm-Message-State: APjAAAVKKgZhzx1aVIYsujjgRQNNBJxH3x1o90AN0sh6+VIGgqlGDUuX
        F/hOsGR70Lthk+PuoMoT/+HaearFzt45zRt+YLIB/g==
X-Google-Smtp-Source: APXvYqzsoo/xomC5blIQjit1D0jWR0YQJc+ZJ/W7NKYP+WeUbpHEOSLNiYlXzMwYoL0Isaq56IiAFEWdUn1HvQ+Xcpc=
X-Received: by 2002:a05:600c:20ca:: with SMTP id y10mr68237058wmm.72.1564431890417;
 Mon, 29 Jul 2019 13:24:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:528f:0:0:0:0:0 with HTTP; Mon, 29 Jul 2019 13:24:49
 -0700 (PDT)
In-Reply-To: <20190626135422.eebzw2nosygkzhy3@verge.net.au>
References: <20190626135422.eebzw2nosygkzhy3@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jul 2019 22:24:49 +0200
X-Google-Sender-Auth: EklHGoQCjm5Qgr8rms6d0WGaz6U
Message-ID: <CAMuHMdXk8Toz7QhzJ_KJ3Ybu2Gt5NnYXmpNVEc3V_ADY+c_fKg@mail.gmail.com>
Subject: Re: [Announce] Renesas SoC Co-Maintainer
To:     Simon Horman <horms@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        arm-soc <arm@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Wed, Jun 26, 2019 at 3:54 PM Simon Horman <horms@verge.net.au> wrote:
> at the end of the v5.3 upstream kernel development cycle I will be stepping
> down from my role as Renesas SoC maintainer. And starting with the v5.4
> development cycle Geert Uytterhoeven will be taking over this role.
>
> I'd like to take a moment to thank everyone for the support that they have
> shown to me over the years. And for the contributions of many to allow
> the upstream kernel to support a wide range of features on a wide range
> of 32 and 64bit ARM based Renesas SoCs out of the box.
>
> Lastly, I'd like to wish Geert all the best in his new role.

Thank you very much for your hard work and dedication!
I'll do my very best to keep continuing your good work!

I've just sent a patch to update MAINTAINERS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
