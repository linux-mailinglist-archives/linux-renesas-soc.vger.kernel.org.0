Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6676708B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 15:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfGLNwO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 09:52:14 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44660 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726724AbfGLNwO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 09:52:14 -0400
Received: by mail-ot1-f65.google.com with SMTP id b7so9482297otl.11;
        Fri, 12 Jul 2019 06:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R03bOtqoUshQ08nX5C2sOXkzgsHYaiM/EFVtcO6in6g=;
        b=XSPfYq5VnKb2/Goyg0gPw6UoUqGZenIppkyxz0Qv9yqsDGunbYX6KkLHXlR176Ajd8
         Mazl6MmBqxibFdZ+aPUIelc/FylSl4+0N476cUoINcRPO5pudv7ZwgR5xg31TZKcHa+E
         hBME5qp64oVa6wfQiDxHYYNCTbIw5pww4F89XA1qUzPckeEtukrZi9HwZMXdj12UlhLK
         M+Z7fKlSNXXGEaBCS0QyfK+yRVgYmLhXmZSQrPqctnpGDCCDTUPqAzz5Rwk/zLVRI0Ja
         LM5R8OW4lFp+zffKaC+xf9I7An5yBsdMxgiheEyFziFDMaQGqaayauPk7mkt09ADkQS/
         sRtw==
X-Gm-Message-State: APjAAAU4VYNSYy+bxME9T5u2Z7GFEasLu4xcUs54bl7Q66Y9ejc5Ogjy
        LBvlxeWtaBMzDFKfPwz798r10qhfmhfYWAj0LX0=
X-Google-Smtp-Source: APXvYqyuf9+BjKBU4+NpBNNjvbdRkm/GQyi6GZu1A9h5K40VnhrKip97g+tQb+GBa1N/XTV9iDU1LyQJl4kPjmJOzXo=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr8143096otk.107.1562939533297;
 Fri, 12 Jul 2019 06:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Jul 2019 15:52:02 +0200
Message-ID: <CAMuHMdXyVRiw62t4hN2iUeu-216KvReXavhNvmD52K-WuX7-cg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add WLAN/BT support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Jul 5, 2019 at 12:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This series adds WLAN/BT support for the HiHope RZ/G2M platform.
>
> This patchset is based on renesas devel branch.
>
> Biju Das (3):
>   arm64: dts: renesas: hihope-common: Add PCA9654 I/O expander
>   arm64: dts: renesas: hihope-common: Add BT support
>   arm64: dts: renesas: hihope-common: Add WLAN support

Thanks, applied and queued for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
