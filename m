Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19FB02B971B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Nov 2020 17:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbgKSPyV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Nov 2020 10:54:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:44362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728968AbgKSPyU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 10:54:20 -0500
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BEC622248
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2020 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605801259;
        bh=YgkNg+z1JE6nlRXgCoLdLXu3nDfsP6AEFIvihbBNFyI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wA+fABuwb4NeDqxjgsrJeJDXJZAYyUCXo8XshiYR1YliHrNIhz/7+qFXqbOgSBaRB
         Iu9UGlX1KPQCwP1laDV6wSJc8QBTX3VXDecHEgQ4zb/9GDVHoyBuys+8mv6dYOYRtY
         ZKq1dcr9DPR030HiKO/LBPf6SeT+t3hheh5QPbAw=
Received: by mail-oi1-f177.google.com with SMTP id m13so6794399oih.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2020 07:54:19 -0800 (PST)
X-Gm-Message-State: AOAM531d+tGWyCQ5sw7Iub+YQBP28LRMTjv5BXcCQYNHx0iS3uYX66Vm
        3pdlYyyYsFegFRNatAAnuSoHSYbXLFnhofOn8Tg=
X-Google-Smtp-Source: ABdhPJxIjEaON8Ls1CLtuq2iV2e/QQeUBeT3oybYW5Kw1rjKdDdNieLwlJMOW2r4i3LLfp8PTJmwoIFbSaPhS8voEp8=
X-Received: by 2002:aca:180a:: with SMTP id h10mr3147154oih.4.1605801258329;
 Thu, 19 Nov 2020 07:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20201119125318.4066097-1-geert+renesas@glider.be>
In-Reply-To: <20201119125318.4066097-1-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 19 Nov 2020 16:54:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com>
Message-ID: <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsi: Stop using __raw_*() I/O accessors
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 19, 2020 at 1:53 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> There is no reason to keep on using the __raw_{read,write}l() I/O
> accessors in Renesas ARM or SuperH driver code.  Switch to using the
> plain {read,write}l() I/O accessors, to have a chance that this works on
> big-endian.
>
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I don't think this one is correct, as based on

static void fsi_pio_push16(struct fsi_priv *fsi, u8 *_buf, int samples)
{
        int i;

        if (fsi_is_enable_stream(fsi)) {
                /*
                 * stream mode
                 * see
                 *      fsi_pio_push_init()
                 */
                u32 *buf = (u32 *)_buf;

                for (i = 0; i < samples / 2; i++)
                        fsi_reg_write(fsi, DODT, buf[i]);
        } else {
                /* normal mode */
                u16 *buf = (u16 *)_buf;

                for (i = 0; i < samples; i++)
                        fsi_reg_write(fsi, DODT, ((u32)*(buf + i) << 8));
        }
}

the same helper is used for both accessing endianness-sensitive
register values (which need the converrsion in writel()) and
possibly in-memory byte streams that need the __raw_writel()
behavior of copying the input bytes in sequence rather than sets of
native-endian 16-bit or 32-bit samples.

> ---
> Assembler output difference on SuperH checked.

I'm also not sure whether changing this breaks big-endian SuperH,
which defines the accessors differently from Arm and most other
architectures.

Maybe better just mark the driver as 'depends on SH || !CPU_BIG_ENDIAN'
as it is clearly broken on big-endian Arm.

     Arnd
