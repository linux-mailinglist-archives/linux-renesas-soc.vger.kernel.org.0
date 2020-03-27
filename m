Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D58521956FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2020 13:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgC0MR7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Mar 2020 08:17:59 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37195 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgC0MR7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:17:59 -0400
Received: by mail-ot1-f68.google.com with SMTP id g23so9475003otq.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2020 05:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EWvI4tz3AJx8np0CJi7dNjuI8kQ/8DWTPnpX2JkCgYQ=;
        b=qavroKtwpgnsqJv/9ZqA1m8SSWkBwfhbTl7cxhhpnCyp7BT8ZC+kqxNjVouuXDVsHZ
         PkSM7/WYAeSC8h8LPNybMOd6Cx6aNUnioSTdbZMn0GoO3VcsgUSBp9J7ooCnIgr74Qwh
         AyezkNbBZJsPjIdoyfbCp+0D1RNaGJraMmjZuRGyAFwUEGyvC/7LlwlEIehYfI3BTntB
         t7xtm+RsW+qthuVDPqk3GhTMfK7jTXvbYUVOOcnQ6yYMqSviVZD6IuDf0GMuzEjji2I4
         QoCMOvoNrbsSzEO+20SSASqxa1AdTDS5L1cukQ9ODvaftpZkR39mCTam1Yct1Lw4yPC9
         4fBw==
X-Gm-Message-State: ANhLgQ26GiHhCE0uViVUlFECAM1tzyZ+MgbK5XsTpIoIgx3+SAqBr7bz
        ZVc314ckpqJxV4vkZKm70od7RN9F8euyG+v2sI4=
X-Google-Smtp-Source: ADFU+vueJ2/s5qEIr6tqTF++QsZqVIxW4t+fjHxCYnxgUIWzGb1Bhq8jvVrxznPZC3uI/FoV3ZeoYY8bWuHQff4UQHI=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr10019425otk.145.1585311478296;
 Fri, 27 Mar 2020 05:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <1585117470-8625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585117470-8625-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585117470-8625-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Mar 2020 13:17:47 +0100
Message-ID: <CAMuHMdVMYWpmgc0E6fLrAR7hU4UCiVCQnz=WdgE2jd27NYgeSA@mail.gmail.com>
Subject: Re: [PATCH/RFC 1/2] arm64: dts: renesas: add USB2.0 device nodes for r8a77961
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 25, 2020 at 7:24 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds USB2.0 related device nodes for r8a77961 (R-Car M3-W+).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Tested with CP2102 USB-UART bridge
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
