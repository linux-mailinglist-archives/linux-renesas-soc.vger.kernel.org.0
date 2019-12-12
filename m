Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF8B11CAF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2019 11:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbfLLKe2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Dec 2019 05:34:28 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36340 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728695AbfLLKe0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 05:34:26 -0500
Received: by mail-lf1-f65.google.com with SMTP id n12so1308209lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2019 02:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ExYrHwIdHCQw2WEYskGLMt3e4iRrFiC/gjDbaG279k=;
        b=v3r+vw4bQ6LcEOVMLroVVNcC+2Y/AzPkE2LJq2f1Lot631cAshif/11f31CHbINpBZ
         fmYSCuW3Mz1prOo0bUtBy4htaY7FdZw8KE8xeeA/HrFGWHPc78FthcjLfD0qk2Qs/CS7
         xkIn9QGDritjyD0ervG/Um3166uG0YKmRkjZ20pdgisOimHnx48OYbokM/CRMnZpn/7M
         /0Xe+CxEXmAKAEIuiWVi+nam8Xc2D9V60tSyQ+M0GWZqTunhuvoWa7UY+C17G+jarcXv
         Pi8/R8LvY9oJTetJPpFtkaAbWYxz+0lGaUdC68k3ZvRfCDiDhZ9gyadW0bJucGfP95tS
         q0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ExYrHwIdHCQw2WEYskGLMt3e4iRrFiC/gjDbaG279k=;
        b=ROrp5WsmLO5Hxsu7SNwU8jhUJIE+yqp39f+HX0CVSF4J8MNGXOd3No1wxO37/+hbI1
         9HItkM1onP3CbZijCjHIZisJpvddZYF+nJMotRsU7J7hT3tDOcg8yDo4o0z4olAutk2X
         5EH+Lvj7D8ucfFZUCIe742WQVYl4NjeK8vdr9tKlQHmhd6e3go1xw8rpmKwLBl75U/MZ
         Vh89dy+GG/k1UZbT1lBZAap4aIhQfVn8Qf8VGXTAc6Gff6kV/xdtnkLkJwrX1EjMPjLD
         gFSin3Z1EqOvKTPItDQDNt7lQe2bkxvEUiTN8JoNnRNGF2XYZVV6Jc7qmPDTfck5BsXe
         BhqQ==
X-Gm-Message-State: APjAAAXliOdfUkfDJ2jcKQlyhDMlezidQ9doOkZGnrM+i/Rc5VYxA7Ey
        28InEeztsGmkXZ2PxjbXitzfkkaHi1gxl1aQ2ZWh3w==
X-Google-Smtp-Source: APXvYqwFQ1SvwLMAfhJKA9VEc7eUCJlGz9Lb+HFPgfR4cI1vkIqNPg8K3VY8f6gAcFuMk4OpAzItb0UELxQqJmkPvio=
X-Received: by 2002:a19:c0b:: with SMTP id 11mr5273188lfm.135.1576146863970;
 Thu, 12 Dec 2019 02:34:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574871463.git.nishadkamdar@gmail.com> <14bb695da50f7af8499e7dfc32c2ab753d92a3e9.1574871463.git.nishadkamdar@gmail.com>
In-Reply-To: <14bb695da50f7af8499e7dfc32c2ab753d92a3e9.1574871463.git.nishadkamdar@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 11:34:12 +0100
Message-ID: <CACRpkdZFH-5RuQ1yGape4j6ukVEY7u2s_TywLUNXnwx9jgHNwQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: stm32: Use the correct style for SPDX
 License Identifier
To:     Nishad Kamdar <nishadkamdar@gmail.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 27, 2019 at 5:47 PM Nishad Kamdar <nishadkamdar@gmail.com> wrote:

> This patch corrects the SPDX License Identifier style in
> header file related to STMicroelectronics pinctrl driver.
> For C header files Documentation/process/license-rules.rst
> mandates C-like comments (opposed to C source files where
> C++ style should be used).
>
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>

Patch applied.

Yours,
Linus Walleij
