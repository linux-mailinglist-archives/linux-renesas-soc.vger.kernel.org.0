Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEBB315DAB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2020 16:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387451AbgBNPWw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Feb 2020 10:22:52 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37215 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729258AbgBNPWv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Feb 2020 10:22:51 -0500
Received: by mail-oi1-f195.google.com with SMTP id q84so9735742oic.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Feb 2020 07:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yIggBj4G9kgv1X4mJi9/dFCdqr/FCrkCCyEABk4uhMw=;
        b=S0WYevH1UzvZNQXkB+reGWTkj0ZDE5K7XjxJhu0l1ejIZDeV7zcyGKhX8jEzAqBPCO
         M1ojXoKt2k17dH3vuk32ghaxbvSc6sJlhZpUB5p+60/KUJZmOy+u1S0atS/RLhi7HrzC
         CZLqebZKsnwjuRazCMsZFDqCHGqnCho0rhvKe+PfBmgutytPLhcVZDi5n6NUdWLIZmCP
         Vb8kOEHWSLJNYdTBe3cOZ1J0XHDtG8EmzO0NahWnHIy3/zd0Kv8z6zpsvt9qpKuS7J9H
         XQZywOA85iHbpGQflRGnBs4m7JjsyIl7tFroU/1VjQNGezB1OR3Ic3J7EjtJJtsqKwh5
         Xw+g==
X-Gm-Message-State: APjAAAUA1IejxeIa9vOjTZ/WpBVbnvhIj94BwGXcj41rC1RvjgZ72tUz
        2+hbWCFqPdllkJ+04yKtao0oaY3VB/PxOx2BPkIYQg==
X-Google-Smtp-Source: APXvYqye4I6Qrx3Pp5fei43PSiub4c+FpCAtTwSW/vHY8MqpLJ05TZs3rXp9SEyb+DZnXGrlnhfoEC5LbeUiXL8q5FI=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr2123459oia.148.1581693771302;
 Fri, 14 Feb 2020 07:22:51 -0800 (PST)
MIME-Version: 1.0
References: <20200214145853.24762-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200214145853.24762-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 14 Feb 2020 16:22:30 +0100
Message-ID: <CAMuHMdWwXOb5vkexeop7zaqm7aUYcfMojVj+VrjuTUXJ+kaamA@mail.gmail.com>
Subject: Re: [PATCH] i3c: master: no need to iterate master device twice
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i3c@lists.infradead.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 14, 2020 at 3:59 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We already have the master device in a variable, reuse it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
