Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A92A2D5AAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 13:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgLJMhc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 07:37:32 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37680 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgLJMhc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 07:37:32 -0500
Received: by mail-oi1-f193.google.com with SMTP id l207so5553699oib.4;
        Thu, 10 Dec 2020 04:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SbywUHfxiOfCKevo8kgPT+2gmwbtXlw9HIdds9wF3Wg=;
        b=WF/BeGmTEIC1x+oq3TZ+p8NNpAxWYU42EGBI8pGrSyxiTeYlj6GnA+ZJCQPAHMMDnx
         MLf2uZO3EdyRMTK8sOSaB1Q1qsuWYnbqnZJT8snkvmK7pmzgSpk6HO9Puh5RxHi65Yiz
         c/b9Gxo+GfD5tlyYUeU7JvAgvI/FSZxSWBnZ3cOqfHvVDgJqFyaxkKYSB2DoagONQe7M
         N6toojKKb5Zf6Vkz9hd2GLZOoAMqKZFD86lEkzIjKa85FKU6/odKp+fPBdk/Lvrl5nSg
         8s3YVFFlHHhOi3OcqSxuEFEu230fMZ305VW9OPn/1H/IvM4j9zTMVLaaS9lJmyYmUvMH
         49Ng==
X-Gm-Message-State: AOAM530gK6xQYq4SOpfbQ5W2/l5Dm2l9zhyLNRTFu+Q4Ct92nbg7AbBY
        GjHZpZrACsGGTrZ7Hpsf4uRCX8h7CNNW+dF00jA=
X-Google-Smtp-Source: ABdhPJyiPIQlISWbFIcvpjridFGEOBg6xNqCsEbMYjYhQg9aXB0626+J1kOaB7mvQTEHIFHi/Vynr3OuNn3FKR0UNKQ=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr5168882oih.153.1607603811667;
 Thu, 10 Dec 2020 04:36:51 -0800 (PST)
MIME-Version: 1.0
References: <20201209195343.803120-1-niklas.soderlund+renesas@ragnatech.se> <20201209195343.803120-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201209195343.803120-5-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 13:36:40 +0100
Message-ID: <CAMuHMdWoG+EJYmc6ZBTcTL4XEkr8vHoT5sv_FSuyFyau4WUBkg@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: renesas: r8a77990: Add TMU clocks
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 9, 2020 at 8:54 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This patch adds TMU{0,1,2,3,4} clocks.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
