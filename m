Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22D63280C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 15:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236312AbhCAO16 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 09:27:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:55142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233276AbhCAO1m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 09:27:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD82F64DBA;
        Mon,  1 Mar 2021 14:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614608822;
        bh=8M4FaCN0qvAB4yk+5Lncsw5Suh6P5W99oBKoBpg0eiE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EGZU7Ot88fhWPYwkkLhdHKdPvKcuYOoXJeH1PWnQtDop55xLQgN3iIYxGu2KpOR6W
         WywGvbNaXYMDGYUpmw3kjN5x9wVGMF51+cmdqMfyL0dn1GD2U9CwXfUb7T1Jcx7QAQ
         XiBV6Mc6P5dTEykE/UO4MGFqGINXDTVO8gY47C7nuBs5T3RtA+BvgunUfoh2emWEcz
         Pu8iIRoI3zut5vpLOS5JIaHDUkd7OJ74CXWwklcYjRRTI1bOyPiL2HCmNax1MSwqwi
         JPeyHyxRQolOgV9PxyuZYl0+euBeiUZgDWgX+ZGNCwPasSNgIVI3jglUZ137e7Wbbg
         fQ0J83mMuZY2Q==
Received: by mail-ej1-f44.google.com with SMTP id gt32so16996974ejc.6;
        Mon, 01 Mar 2021 06:27:01 -0800 (PST)
X-Gm-Message-State: AOAM5307qs3KvDprNqq7HeDkyEIP6xxFx+yfaquiNR9wHo+WNkL0cB/j
        K+Ch0ZYScyRGPRUh+RzlKZO9Msx3hoewhJj+XQ==
X-Google-Smtp-Source: ABdhPJzu7QL+eOUGB5L2CKvRu7NwYHNZej8b8+Ll+kUuhPh2uaPcMEK8SUVQEdQnDc6DW8LAH8qSU3dBRZncdvcga8s=
X-Received: by 2002:a17:906:7f84:: with SMTP id f4mr1273068ejr.525.1614608820366;
 Mon, 01 Mar 2021 06:27:00 -0800 (PST)
MIME-Version: 1.0
References: <20210301113920.3042-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210301113920.3042-1-wsa+renesas@sang-engineering.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 1 Mar 2021 08:26:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJSFpJjnYPGATk1R3GBU33_b40iL8Tiwwwtt974ObteEQ@mail.gmail.com>
Message-ID: <CAL_JsqJSFpJjnYPGATk1R3GBU33_b40iL8Tiwwwtt974ObteEQ@mail.gmail.com>
Subject: Re: [PATCH v2] dts: remove c6x dts link
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 1, 2021 at 5:41 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The architecture has gone and indexing software like 'mkid' complains
> about the broken link.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Arnd, will you pick it up?

Already have the same patch in my tree.

Rob
