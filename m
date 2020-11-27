Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B192C6816
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 15:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730948AbgK0Oof (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 09:44:35 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46745 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730944AbgK0Oof (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 09:44:35 -0500
Received: by mail-oi1-f194.google.com with SMTP id w15so6051442oie.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2020 06:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kKhJ2qGDTu4VllnNZIMpoK6o5n1cvGiQevHYw27b0EE=;
        b=V6PWyv3ENZXaZ4pbE80r2zVKcy1vWKa+GCnP+AFY3DfDZj+bTyqp4YivfEItzkHbi4
         OQbAP2I9fDo60LYN7g2k7kdwGJZdrODifvB3//A05UKFix06dIulvgAmAO6TfF2HUPiq
         +pjbhSpeMFST6xwunNf34OvmxjQ9rLl4rqLWbrgUIwzPaGRDJQIXKohMxxUTawxKsy2F
         hCqFGpFBhvsPKm2orpSZg8AZWuLTKX3cRu1+X0lvELpJs31Tb7nBSVmaaEj4QxJ1vl0O
         EU6oP3+vSrCWFcDnQCutDUiO9zkEjjCamyTR5FsIIM/YxliGE04u5gDZxKQuqAMcCC0h
         NPbA==
X-Gm-Message-State: AOAM532zgqLuiq/4/OYDiJzuaoTd2/BsqbfHxyEj9eRqRpcu2uhV2sSj
        NpqyAtZ8XtVRmkpWV1jpAnVaoLyzdBJu9fBXdSBwgOH1lLlZ+Q==
X-Google-Smtp-Source: ABdhPJx2AzCXnbsiH8LEl7TwHpVfUshc8pnOFMF+IrYPb6RuWW62Rgd9Cc7pl1HgvLP3ZSDcAaeFqbO2lWxzmQNaZ0A=
X-Received: by 2002:aca:c3c4:: with SMTP id t187mr5486854oif.148.1606488274645;
 Fri, 27 Nov 2020 06:44:34 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <20201126172154.25625-2-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-2-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Nov 2020 15:44:23 +0100
Message-ID: <CAMuHMdVOPo=e4U+XPwnGAOYeCMmx5VkhDfThRv6L=iSMzG-FfA@mail.gmail.com>
Subject: Re: [PATCH 01/11] pinctrl: renesas: r8a779a0: Add EtherAVB pins,
 groups and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds groups and function for AVB PHY, LINK, MAGIC, MII and
> PTP pins for the R8A779A0 (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, AVB0 and AVB1 also support MII, so I think you should add
separate pin groups to support that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
