Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B740A6A7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 15:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbfICNyF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 09:54:05 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37856 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbfICNyF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 09:54:05 -0400
Received: by mail-qk1-f196.google.com with SMTP id s14so16022528qkm.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2019 06:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/r+3S5C8hYD7S9YEDCgQruxzRt39Gb4thhb4WG02I5A=;
        b=fft3Zh/buBh9P3yBbIrWj/c4hQALoJ+GMwjZvn2FbxSZGL76z8EeEqQ/NUhKY8jB2z
         Ua0a/qjimnHY7ridZTQDez6td1cFSkYEkar1EI+CgfK/hr+9/aSnrQVGdw2eX8VcZhcY
         c/C+Jce2anbLxmz+PSIj/gXKkjVjRM8m/JI4gPXuRF/qL8SPOk5GuHpiBsB0GOiVtnvA
         07THSPk6t5WKiYP4IYyR8dnzNonq+T8YYADECjrK6eP3wOTgR6UGVZk6nBF3hGxqwbwM
         oun5IgJqluEeyLcRNhfcU7L1MgEVjMdKhwRuftfjyiRojGBzas5Kxiytrs8Hm1AD4oCE
         Tgow==
X-Gm-Message-State: APjAAAVrNH9gI4KsvyrWFnfCPLHWCVV3JCDRlINcSy8G87Ens/nowVBo
        W1bVyQxhdFCF2P4xWPkzWK2tr37oNMVMffpn/qs=
X-Google-Smtp-Source: APXvYqxGzpSdBJ4axcS6trQA9QY/4BMrVYul7MoCdHAcALPJmwx/FamJG9Y7ywnl9aamIZWZVTOqFdoJ+8wO6JWyS3s=
X-Received: by 2002:a37:89c4:: with SMTP id l187mr6560886qkd.286.1567518844519;
 Tue, 03 Sep 2019 06:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190823123643.18799-1-geert+renesas@glider.be> <20190823123643.18799-4-geert+renesas@glider.be>
In-Reply-To: <20190823123643.18799-4-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 3 Sep 2019 15:53:47 +0200
Message-ID: <CAK8P3a3uETiLPw74yzUYDTTv0rzedXdhHz8xf4AvSHe59oYrRA@mail.gmail.com>
Subject: Re: [PULL 3/5] Renesas ARM64 DT updates for v5.4 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 23, 2019 at 2:36 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The following changes since commit 0a05b3d7fee511de8a1c9dffc3d86f1df55e1737:
>
>   arm64: dts: renesas: ulcb: Sort nodes (2019-07-30 11:25:35 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-dt-for-v5.4-tag2
>
> for you to fetch changes up to 38290431d56d7d3928ac89e9f8d3d6b3c8df4c6e:
>
>   arm64: dts: renesas: Update 'vsps' properties for readability (2019-08-21 14:18:56 +0200)
>
> ----------------------------------------------------------------
> Renesas ARM64 DT updates for v5.4 (take two)
>
>   - Sort nodes in various SoC and board DTSes,
>   - HDMI sound for HiHope RZ/G2M and R-Car M3-N Salvator-X(S) boards,
>   - Limit EtherAVB to 100Mbps on the Ebisu and Draak boards,
>   - Small fixes and improvements.
>


Pulled into arm/dt, thanks!

     Arnd
