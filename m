Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A7731B73E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Feb 2021 11:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhBOKfz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Feb 2021 05:35:55 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:45518 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbhBOKfx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Feb 2021 05:35:53 -0500
Received: by mail-oi1-f171.google.com with SMTP id q186so3306191oig.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Feb 2021 02:35:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=03mSG2LVlbbnb/po0hv4C/2F6SY3bS1HRxTCI+4zYIk=;
        b=pYcXsfbBp+zgrL+4c1za+LTsdCOnUR/VdumoD/GNZKF/XEWBAJv4rms0IgU/DP5GS5
         amAYjckdf2gv47zbrmqxPDiGYT8CTG64mUh2qTO0YKbqOWVHVDPY5MOLkoaZ00XDqETL
         pOyabMarvs3AwTLTQV6U7GaCCOYNGG/PFh+43ad0Jb0ePZWsosJoPy8GsNPQWVLa3nRH
         IYdH49Nd9awt9kZC1V9PbIKYb59E0L+a8RAFFr8ycaIORPK3jcWLcrNJLoybd4Qg765P
         irJ1FrrXGGL9ja7k/KNTlOCb4TTemOfTTW0O+QAEzOcSal+uTexsO+lAndwqNYJyu3zj
         Eghg==
X-Gm-Message-State: AOAM533DPyHPlzaC2zNTOHg6V4NkBCfz+/nMyKJytpwr+tCwRTHgEaru
        a2LhRlQisOCyNcTRMEuYh2R3yDj9S3Lunpxhd0felc7R
X-Google-Smtp-Source: ABdhPJw2729vD+WqmMi8A1ejnlrOyAvAh/GFnbCzN5F/lCcUl1DSMkPpLBNCPX6TwvsQ7CasMgW3cndNUZyHazMyWLw=
X-Received: by 2002:aca:d8c6:: with SMTP id p189mr8054586oig.54.1613385312217;
 Mon, 15 Feb 2021 02:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20210215101754.6725-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210215101754.6725-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Feb 2021 11:35:01 +0100
Message-ID: <CAMuHMdWL7adaod2=F1wNBNnxx1FnUj=DQ2-pLO3Cq=JTB_DS0g@mail.gmail.com>
Subject: Re: [PATCH RFT only] mmc: tmio: remove workaround for NON_REMOVABLE
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Feb 15, 2021 at 11:18 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> RPM handling has been improved twice since this comment, and also SCC
> handling has been improved a lot. Time to test if we the workaround can
> be removed!
>
> Not-yet-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> I'd be very grateful if you guys could have this patch boot-tested with
> your boardfarms. If the failure is still there, then it used to hang
> when detecting the eMMC. Maybe these days eMMC will just not show up.
> But hopefully all is well now. This always was difficult to trigger, so
> a wide test coverage would be highly appreciated. It works for me(tm),
> but that is not enough here.

Thank you, I'll give it a try on tomorrow's renesas-drivers release.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
