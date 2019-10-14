Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D393D5F53
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2019 11:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730677AbfJNJum (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Oct 2019 05:50:42 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35567 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfJNJum (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Oct 2019 05:50:42 -0400
Received: by mail-ot1-f67.google.com with SMTP id z6so13280516otb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Oct 2019 02:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aMTFgXV+94TB6eDFcoNjCRUwv09PwLf1Mc0g3dSknUQ=;
        b=aWh0edojWJsWyn2YUnEGS1YNIWXNyEDu1W8VOOo1Q1tgvZvhI4pqnSF3SqmXzeh5Wl
         aaCXZI0/bNnK4N1SdKUt8cpJc1xZBOSTaYvhwSB4qV3TULmWszP8zp4a7o3mo9AWcFjr
         VN5Hr7pfFarES/KIBjHEkYMYzIVDMHMMKMmqnK7giK0InzIv0MxzC3GLsr4uWeZBezu3
         LEdhZKsAa+DZPzTaCc0vsUNJIDhW1yUqk9FeDJnmLzcbmA/azGM2OJePFmt/2ZF6m5p+
         sG14m8Y0zOSGFDHOVBtTg40SOb/h6dvXBh1zueDAZ4c6yP86KmS5d6HUCM+DKS8jj8B/
         l7bg==
X-Gm-Message-State: APjAAAVEPCGEGm+WpH+w1j0spB9A6gaKGKnDHbR2jPWWedk+TZrlOZAY
        nqRD14C450gIdIm8cvBWb+XlcN3mhvGq2DmrSiM=
X-Google-Smtp-Source: APXvYqwT0Kbt/7HAIXP6EmzQMyTCKOx8N1xqlLIUAPbbRfgNmtd5CZsE2KKU4Z8XhSffaFZ2QkM2Bf2TbbGwhs6aMDU=
X-Received: by 2002:a05:6830:1544:: with SMTP id l4mr9264706otp.297.1571046640222;
 Mon, 14 Oct 2019 02:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191008060112.29819-1-nobuta.keiya@fujitsu.com>
In-Reply-To: <20191008060112.29819-1-nobuta.keiya@fujitsu.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Oct 2019 11:50:29 +0200
Message-ID: <CAMuHMdViaYdAvS09PNgNkk-jNQe=sBsfJduRoRZLCi_ydo6HpA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Fix PINMUX_IPSR_PHYS() to set to GPSR
To:     Keiya Nobuta <nobuta.keiya@fujitsu.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 8, 2019 at 8:02 AM Keiya Nobuta <nobuta.keiya@fujitsu.com> wrote:
> This patch allows PINMUX_IPSR_PHYS() to set bits to GPSR.
> When assigning function to pin, GPSR should be set peripheral function.
> For example in using SCL3, GPSR2 bit7 (PWM1_A pin) should be set to
> peripheral function.
>
> Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>

Fixes: 50d1ba1764b3e00a ("pinctrl: sh-pfc: Add physical pin
multiplexing helper macros")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
