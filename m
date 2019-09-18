Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA7A2B5D09
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2019 08:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbfIRGbX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Sep 2019 02:31:23 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:46753 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729614AbfIRGX2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 02:23:28 -0400
Received: by mail-ot1-f45.google.com with SMTP id f21so2166753otl.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Sep 2019 23:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S0DZWHl97/mCOE/IVBeiZred0V0R4dGyLfjfyKK+LM8=;
        b=gOdwD53DtE3WGa35fbcQzcbmQynIMNLZLUZswD4innPWrZWBSNzwnYJZJQZzz4rGXE
         EHCx2fZjmKMdM6WHzmV8GXRbMiz3G8ZKTsgsbsgHx7+azRNaCWCaH3C7x7AARRn6QKut
         OVtufEFxZOFPExIwM/j9TQppxA9JUYw7xI2n2A9Iq+loLSF1po+nbt66Kj6gI7ULvv2f
         Y0tCpueZRBhCO61HqRBQfCKfLzpISQggynoYzOeSIqDzzG3vEacCGOWdBqnTrvcsCp67
         p6Ur2+o+pwxJaUnWOmsi8HF2KOH7HyHMJvUJH8J/ovjSHiBO/LSi0A96Obh3HF15Kgfk
         dmHg==
X-Gm-Message-State: APjAAAWtIilpUZ9PBu8W+Dj3yJEwI6PMrk7+9qnkRYLs7Zlnz+H0cP/a
        NRlIqDAFUemWzyDprT88Gi4nzeQePgjUkyMQ+uo=
X-Google-Smtp-Source: APXvYqzRo0z2h146LTsMNQq3+lvSZTIYmYS5KLMItBmaIGg5PKOmK5Ph+EcKGWAZYSLF8HSzk8fO6EQasD65zQMgS1I=
X-Received: by 2002:a9d:4d0d:: with SMTP id n13mr1824031otf.297.1568787807858;
 Tue, 17 Sep 2019 23:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <156877169225.29395.9771334507494949542.sendpatchset@octo>
In-Reply-To: <156877169225.29395.9771334507494949542.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 18 Sep 2019 08:23:16 +0200
Message-ID: <CAMuHMdV3biX58avpZtekEYOu4wjmPODGUjSTXqoZnRoWYxf5ug@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: emev2: Add whitespace for GPIO nodes
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 3:53 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> It turns out that the GPIO nodes for EMEV2 are missing whitespace,
> so focus on what is important in life and adjust the coding style
> to match the rest of the code base.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
