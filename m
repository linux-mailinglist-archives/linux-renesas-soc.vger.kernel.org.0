Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 492806CB0B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 23:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbjC0V34 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 17:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbjC0V34 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 17:29:56 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC5D19AF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 14:29:54 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id y5so12580981ybu.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 14:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679952594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eokYh2mwVh/DTudd2slWImFM/8e0vGGOwJl1TyEBiI=;
        b=s+fdhFj7nY8IJZfGqI5yPc0aTlu42TpK0Tkfvv9Nxq2chjKmUi40y/NaJcZPOlDwI1
         MIvIp3i5sx/iKHu2/tTMGo15hbq6FFuvkoRMFU+pqIT9cRnuBj6RKKLoL8HFZYJaHqOw
         oBUZBHHqByBZEkiCm7zGY0WlhQ1DcuOn8oh7HEniue1TTc2c0N4gsHnJn+d3TkW/pGme
         auwzjg5qtGj2P5KaXoVRSCruxs6pXRL7Bak4P5XZawS6evZmWZ1h2XhZaqM/t7FJV0kr
         EhdpRvgN8eCpc2gVYQa2OHHeqTwrb38BYE1E9HtjwZVDtPVw8at4CYDSsOtRW4L1zY4V
         G1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679952594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eokYh2mwVh/DTudd2slWImFM/8e0vGGOwJl1TyEBiI=;
        b=3lVwmDqXfT097DsBqrfIrAPe6kAyePqxpxaxNkt5uFqZwmvTW8ZZ/sbZZmL2cwFYo3
         /K3/RvGJlhVxDDqlDVbe3i1OPxxY5DSldQ46jQHqnTWp1BHpPx9A7rSbA0iCJC2s85T5
         Ueb1/hcbq6eGE68ocspw2wzvkgc55IsYLIeIQYNddQVkD9pO4ytd9gwErqi6XhTubDZV
         QZW43Nixs26ijR9TOP4dtbgIc3bRrMHAvIbdzcPI/iP2HnVsHNptJObngRSDEjyhyzYj
         sfXW7ZQkpviFOn+p1RFY+OGbRmySSEzaXs4FQfxZ78gHOGyxxhPg2Gnr8AUp3tO3+bJv
         tfgw==
X-Gm-Message-State: AAQBX9fJqVJq3o4w6jpBKZgbW5PaHEXP6vBcvpedlMGY1su72TO1xoy0
        vbk5kHU1Gf8Nlqc8W/4LGjopL0yIrD2rScGSOAMxvOqe9BnaxLL2
X-Google-Smtp-Source: AKy350ZAKVAse0mC10rU5n8wZJQnHt3lpd51pDvlIGvq9OSoCcQ3+AoSryc4gyyFW9osAo5AJdwLqNfhU2xJTPyvKhs=
X-Received: by 2002:a25:8712:0:b0:b74:3236:2fac with SMTP id
 a18-20020a258712000000b00b7432362facmr8032860ybl.4.1679952593878; Mon, 27 Mar
 2023 14:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679907618.git.geert+renesas@glider.be>
In-Reply-To: <cover.1679907618.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Mar 2023 23:29:42 +0200
Message-ID: <CACRpkdbrQYd_hJ3CaQEBpuD0GwfR2eqQFQ2ZFLkLKREP3GFQ+w@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.4
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 27, 2023 at 11:03=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4c=
c6:
>
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.4-tag1
>
> for you to fetch changes up to 9d7558ed8372c51cbed011cb1dc3eb1beee212cf:
>
>   pinctrl: renesas: Drop support for Renesas-specific properties (2023-03=
-16 16:55:27 +0100)

Pulled into my devel branch!

Thanks Geert!

Yours,
Linus Walleij
