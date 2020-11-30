Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA062C85AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 14:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgK3Nhy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 08:37:54 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45325 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727153AbgK3Nhx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 08:37:53 -0500
Received: by mail-oi1-f195.google.com with SMTP id l206so14105711oif.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 05:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fJO9/X/x8MEED7Y7uIhR0cNTPpx0+0A+Zx44SVJdno=;
        b=sltynKQLsq36nr7Sdv+9Nrr6J251Bf4KohsTlqL0o2VOtu/6hFkDoSLY+80oP2cN2H
         Eu52B2MylDBwZvLb79Pm3LbGVeIB9Pmi7lrFtUC47o8HHrbbzsZU7f4kQqX3lRHSUc+F
         xdHW5eGrjSQ4/44JIVXZiCs9tWLv6BOSIoRGHmY19CF/nat+J9LyMD9lzGwmugOkx1qh
         sg7B18vuwOqVRL/FA0Z1H8DofL9FpUJpXs8H2PQgkD02T0hMr0xKGKnSwuciXbSXtqrb
         ekLD2a8hnTl2Ghp8WrJCSGUDMIgGxAAJynRLagg3ZBScp8huelR25RwqgOFmNpBRWql5
         9Low==
X-Gm-Message-State: AOAM5325SjW63jtZICX61mEjp4vjqfE37ZcX0zvkX178Qq9bDAtIKaHb
        3rPyKRs9zkTOG5iJiLroiKwCk/TbvRds+12TDTk=
X-Google-Smtp-Source: ABdhPJw1j9KxnxwoLAvrf30H5WlZf0K6g3alQLTv9weY0fKyymVMxgCsJjmOSek+yG3iuyQaKLwtFz+mStWDn0b+k7s=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr14442707oia.153.1606743432991;
 Mon, 30 Nov 2020 05:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <20201126172154.25625-7-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-7-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 14:37:02 +0100
Message-ID: <CAMuHMdWgKk9=iUoVVRLCmvCCoA5GMhu+AMd39kqaxgn1q93yoA@mail.gmail.com>
Subject: Re: [PATCH 06/11] pinctrl: renesas: r8a779a0: Add MMC pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds MMC pins, groups and functions to R8A779A0 (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
