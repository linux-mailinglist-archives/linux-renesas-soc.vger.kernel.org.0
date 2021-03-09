Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398EF33257D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 13:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhCIM3f convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 07:29:35 -0500
Received: from mail-vk1-f180.google.com ([209.85.221.180]:38794 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbhCIM31 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 07:29:27 -0500
Received: by mail-vk1-f180.google.com with SMTP id 7so2939175vke.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Mar 2021 04:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fC6Nw7HkfUsq382k++ZE9cBcOkJTGIz9ICdM08jhnWU=;
        b=dLUouRbObl0xNuOUlvLeiw6bYUba1WWqPJ+7slp+hUw0DaklPeiSybM+/KoWOUsBQK
         8yIJrosUioJSoJPQt/w5Ffm9JNJw1SEK6pUh+Tpb/4FBCRjJaBz/N5+UfHxtZ+sDr3qT
         I4ay2RCygiJ3gjbePBL3TH+Lrd8/XkFN10vbsZZp3Ip12JdAsJfPOtKz5IQKTUel4175
         OIK5UnTHf5dbaHjvux3X7Q1+oWsX/UXBlkTEW+l+Khj0bguPjYla/vTcnn17YD8TNNy2
         9n9osN1k1FTbEKJADxswXhF2TOqeGqN9XyaQ8kns1HzumYPK+CVFZFMciNkcq9qMqFVe
         SUoQ==
X-Gm-Message-State: AOAM533+eyAfiWcK8seaNNRC3Xi6Gep48P5XT5GWgEuqut90nX9Sv8Kd
        oSsBxulsZfYjRRth2bpj0yLdjpJq2YQ5Kt9NeoY=
X-Google-Smtp-Source: ABdhPJwQ5RHxxp6HNUaarUEuDDBGkTXvOvRk3ZzPAEopYG+M+PXkCMyEE4Emh3OB9i53Yenpq3QTi7X2RKbZ6nS3I5M=
X-Received: by 2002:a1f:1a51:: with SMTP id a78mr15950448vka.2.1615292966218;
 Tue, 09 Mar 2021 04:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20210309114930.2433711-1-niklas.soderlund+renesas@ragnatech.se> <20210309114930.2433711-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210309114930.2433711-4-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Mar 2021 13:29:15 +0100
Message-ID: <CAMuHMdXfjQs5qW=ywZnDpMMd7btEztMpAhV0d3pJkpH1Y4EOfg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] pinctrl: renesas: r8a77990: Add vin4_g8 and
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
> This patch adds vin4_g8 and vin5_high8 support to the R8A77990 SoC.
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
