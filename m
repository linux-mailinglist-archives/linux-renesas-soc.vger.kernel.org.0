Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B7F303444
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 06:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbhAZFV2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 00:21:28 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:34842 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbhAYJVd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 04:21:33 -0500
Received: by mail-ot1-f50.google.com with SMTP id 36so12124037otp.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 01:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z/zVU8ZRwK6/lZlGa/mIy+9eF7pUrclLsfGQYb9ghiE=;
        b=Tn86rGcwiAbg8WbVCtj48CEYf5GPep27VVviPi4phYAHRAhIgQorNkDGbB8JwTcGtv
         5EqdWc26PZLl+10JjyhsxdpN7B7hzj+zt0Zqs2kbq803eAIsiI4EbLr3s+S6WDlrepEg
         tH4rtlMstQuKMCU8wkmEZ7cX1wBLp5/1cKhvQtehV9hE36YrWlfdyzUsKEcIdpmLV0xJ
         hC6jU7flblvJV0LhVqMdXUDChOGc+NzHU9hTU7ELPiF6brLWrvolrHXS/fsW1Ep09Nyk
         0pojN54ypeoOM3OYXOk7RLJleV++qaBVmsteayTbyy3JLCCaKrzlQNmEUvzEQc3pYTrR
         h9tA==
X-Gm-Message-State: AOAM532A/jDeAUbwq4U5dGkVt+y7efokGso6QnONMzieaFTE/IF4cpCw
        ylIhg4qTFpEiytXo1p3nRJUU/RAUMhgjZczIs1I=
X-Google-Smtp-Source: ABdhPJzInPoZLGialwfvJbF1Wu3oDmaO+aafYB69mKLq0VS8mkWf/4y/eBU5k0fmekhGJq52ejfJD1PKnRDjZa/Po08=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr699080oth.250.1611566403583;
 Mon, 25 Jan 2021 01:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20210121110008.15894-1-wsa+renesas@sang-engineering.com>
 <20210121110008.15894-4-wsa+renesas@sang-engineering.com> <CAMuHMdVuPh_t36n33pM_1re9W4VzU8b971AOG8wemQewJtUSjg@mail.gmail.com>
In-Reply-To: <CAMuHMdVuPh_t36n33pM_1re9W4VzU8b971AOG8wemQewJtUSjg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Jan 2021 10:19:51 +0100
Message-ID: <CAMuHMdVsyezm8oFRoJnOg1zuc=MFxuGi+zU6d+WzsH_G=NmYXQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r8a779a0: Add HSCIF support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linh Phung <linh.phung.jy@renesas.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 22, 2021 at 11:43 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Jan 21, 2021 at 12:00 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > From: Linh Phung <linh.phung.jy@renesas.com>
> >
> > Define the generic parts of the HSCIF[0-3] device nodes.
> >
> > Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Wolfram Sang <wsa@kernel.org>
> > ---
> > Changes since v1: none
>
> Thx, will queue in renesas-devel for v5.12.

... after moving all HSCIF nodes after all I2C nodes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
