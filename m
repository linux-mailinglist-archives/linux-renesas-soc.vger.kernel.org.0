Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 532FCF972
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 15:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfD3NCY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 09:02:24 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37550 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfD3NCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 09:02:23 -0400
Received: by mail-vs1-f68.google.com with SMTP id w13so7923957vsc.4;
        Tue, 30 Apr 2019 06:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ZgXWjGA2+oynirdc+UKqVVThOlZkZc8Fr5YvnjsD+I=;
        b=CFyCa6tQtQzrXUe+tq+mXI7ownngI3HvrO+amw1kgcI7l2KM4yFHabdodFPEchh3i9
         BLVj/sPaGY7iRX7285CmA60P+9B/Tt6thN931VMzdL5x2ISommaUt6lRcJC6jj9E63/I
         sbJ4JesoG9Nf8kdix054rptsB1QwS5qGQa+IA2WmtnW1iUDVtJK2D1jSZ1bWeLGK4v+N
         KfvdtQosm9wKQd0uWILWLvmyF8Z4DrLDQYJmAcFXYdWhfMFSgzyS6xJYG+eUxoxZ+Ts5
         3m1VfV4K9sZt/43C8FCMt7up9u4aByOfJQiWAWZpZcYEt4VXG+pLrna30m8CJ48yXeDc
         WIFw==
X-Gm-Message-State: APjAAAV883K63HtPn9Bqbom6ZgAx3nswPiELHnCdHUG3QD8HoqhAEpgL
        mrnFZ88yne5wF/rfAGgQpAtsYoM7nPIUAAFRGSk=
X-Google-Smtp-Source: APXvYqzV0GL7wdo+ItscXD9ijDcO5VLiQotfwdYJMoIYhsdfGnMlZHPnUQM1YRafUrjCFM/cBN6Ka9heOEEmpmRN+cU=
X-Received: by 2002:a67:83cf:: with SMTP id f198mr6738776vsd.63.1556629342711;
 Tue, 30 Apr 2019 06:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp> <1554799912-24764-6-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554799912-24764-6-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 15:02:10 +0200
Message-ID: <CAMuHMdUe-dbwyvF3B4NrvCwsaZgOYqwzpvVphPVjyk4Ubr7Ljg@mail.gmail.com>
Subject: Re: [PATCH 05/11] ARM: dts: r8a77470: Add VIN support
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 9, 2019 at 10:52 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> Add vin{0|1} nodes to dtsi for VIN support on the RZ/G1C (r8a77470) SoC.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
