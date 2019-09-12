Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEADB0E84
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 14:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731486AbfILMFF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 08:05:05 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45619 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731490AbfILMFF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 08:05:05 -0400
Received: by mail-ot1-f65.google.com with SMTP id 41so22003146oti.12;
        Thu, 12 Sep 2019 05:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hN1AvbGPXaWbn8gk23eshDsOWcHJnwOgLbpQ5ihMGXs=;
        b=gWj9E+Lf4C2ZHQ7ks1N491l5s9V3cZtFmpKgNDB7QMX5DJ7xA/sFdu04DIywdTx3bA
         1rJT5U76r8e0tcKA46WJZUqrya5lY2cdZK6ZfPK8ybj7OMUR+9S/QFUKDe6EHHBheN05
         2WfgLtwfjcDAvJ+MhpTWrGwF4rvwbjyPLcbREu95RaKTHAyYExPSMILImKlH+K5dx7JF
         Dl+VGuf1ZlD8cDkPKKvbXpYT/D9CV7PbTzCYf6h5OYh4m60yLKvJ6syf3dKGrXvmQoGH
         DTRBWt9FzIV97TtmASzXAYJVN7+FXkZOeWI0oS2iYnuYFZVzdnrfUa+7o57MmMwQR1vl
         czVg==
X-Gm-Message-State: APjAAAUYiIMZUh7VoGKJQ8K8FaVrsxTHXnegschyCtKHZHCyDYWCTqZF
        O1DLpyrUDZ6QxhdyXjRG+4dtbpHFOK0+Sup52xg=
X-Google-Smtp-Source: APXvYqzub8+qs+xgzCbQJpYWFnKI2oSAA0kckOHsYIO6Erlwm5BT8b7v37rtZmItWvQxpcnjguhILA4+/s8K0/A5o6Y=
X-Received: by 2002:a9d:6c12:: with SMTP id f18mr12361otq.297.1568289904224;
 Thu, 12 Sep 2019 05:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190912103734.1879-1-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdWb9qBDZqOs072u_pCRTaGGArAdUBLWbA5kGoU=KM4Y3A@mail.gmail.com> <4ecb7e77-45e7-cf91-c8e3-0670d7ae25a7@ideasonboard.com>
In-Reply-To: <4ecb7e77-45e7-cf91-c8e3-0670d7ae25a7@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Sep 2019 14:04:53 +0200
Message-ID: <CAMuHMdVqyEHuYKPXb2S5KRp+qHQP-qb+QKDZj_PdnC6__FDJ_Q@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: renesas: r8a77980: Remove r8a77970 DU compatible
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Sep 12, 2019 at 2:03 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 12/09/2019 12:56, Geert Uytterhoeven wrote:
> > On Thu, Sep 12, 2019 at 12:38 PM Kieran Bingham
> > <kieran.bingham+renesas@ideasonboard.com> wrote:
> >> The r8a77970 was added with an compatible string for a differnet device
> >
> > different
>
> Also s/an/a/ ... Perhaps I should just step away from the keyboard
> today, I can't seem to type ! hehe

Doh, finding a first typo increased my adrenaline level, masking the ability
to see a second ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
