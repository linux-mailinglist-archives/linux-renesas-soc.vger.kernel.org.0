Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCA9EA00F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 13:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfH1LtJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 07:49:09 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33470 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfH1LtJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 07:49:09 -0400
Received: by mail-ot1-f67.google.com with SMTP id p23so2464460oto.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2019 04:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=honJjW+tWgqdO8DlhYbT7l7jDj9GBhb78AZaCA3PnkQ=;
        b=aWYE4/Fl3V7WoTaPWzsIxxhsG1IlIfP6CDNka6VKSPXFTS6Ux3actvp0J2ARlspHSk
         p5znegBLDxdFOc7I/99jVKID3fUUtu3IRvU7iIDk1aoZg5XOryVanxBtQoglPSg1Lf1s
         1E68pIoXzAYKmIFmU2LyqU4Alr5CRnSgYwE1UJeONNomilgLAAr+tHNz+WGzaDzFfYRE
         BTpy3w4iv6OyEA/s5Qfm4IWQfWasI9eyXq9eTRkKUKHrFLqw1AUQWP6Yde9626FvJk+2
         GGBFD300taXINV3fDTnRfT+X1KmauKdpf8EcE8vqegI9f60y//cuuccvb6KCcf3ew8CN
         1NAg==
X-Gm-Message-State: APjAAAW4ESqcR8wIJf/1I6oHFJrvJJKrMmi/NEvzSo6EM/rc72Xeslxa
        c3/s1TeN1MG4xyShDEiaSEBNopTMAHXYcyu7O3j45RNC
X-Google-Smtp-Source: APXvYqw+gsxxJMsa9J9vT1RgqQwi1QxidAyEkYBxmXL0ew66r8mjoCiRuje+LQ+olsfgqipkmeD1TyMKqGjDLqKLzzk=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr2829202oto.250.1566992948432;
 Wed, 28 Aug 2019 04:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu> <1547808474-19427-5-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1547808474-19427-5-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Aug 2019 13:48:57 +0200
Message-ID: <CAMuHMdV2emDv7Bei3TAGXrWzwJROVLA1u3Ni4VqmpYc2U1ev0A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: r8a7796: Add cpuidle support for CA53 cores
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        dien.pham.ry@renesas.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 18, 2019 at 11:48 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> From: Dien Pham <dien.pham.ry@renesas.com>
>
> Enable cpuidle (core shutdown) support for R-Car M3-W CA53 cores.
>
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
