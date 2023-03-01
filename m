Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3DF26A7424
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Mar 2023 20:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjCATTo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Mar 2023 14:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjCATTn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Mar 2023 14:19:43 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD442310A
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Mar 2023 11:19:42 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id v101so1429809ybi.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Mar 2023 11:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677698381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIVo0hDObYKHS2lBiY6rq4gYddvjZSEuHQth4mrGMJs=;
        b=ff99HF//1TLhMk2DSZVOJGZ/4i+X3V04Q7GbNaptF7odxp5W3FWVQxIUMwDeVqkxCw
         X6V/G8BL0SAy6k+nCunKp1nREOG4LuwmAWs+Kwd7EufojR7IfCAwQ8o61TG84Roo5S/C
         OVhXn7DbGazFSHdVjTqRprzwMouYBvJWoX/YEOsR9Ld6UXnZ5zMQzlgEdEIxZLnBwL4/
         MSb0Zt09t8LHNn26B9nC9j2TubBD+2SQn0V9l4fVsUZGTryMva7FCM3JjkbdY+Zdg2ws
         jfvsG7TuYvXX2rPQ7kglZsLdZpJm/Zj44eHD3iUdcHNralP0/ly9b+f/BEwc/qWG/+sf
         tF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677698381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIVo0hDObYKHS2lBiY6rq4gYddvjZSEuHQth4mrGMJs=;
        b=eUAEbaWRcV5DdPpmg/Wt7ilPEdqLT1C0ddNseGYcTETm9MTPAz4PF0eDCQ+JZXsZfj
         VN+e1VNJY7/BhqYM3hySxCFhMSNBlvfeEqiqviXIK/UxXZfSfGQsl4AMRnOz7croOMIn
         TDoo5Z14+f/V6yVMCqBMOCX/IpRyucK83MzJOufcZcPzD64syZe+HaaVWzR99tpiHhPw
         uXnwNBYTlnpVhyzJJB8saf5OagmafSA+YeUNJsNkDP99ZofreOm6CaGFHlQYAO39HRgA
         0sw4PRyxhIwvfRxUe2Fs7hFVk/2jD7L+8jVayWr2DlNZxSu5x+5yzJy0vlnR8zZ3QoQm
         9CdQ==
X-Gm-Message-State: AO0yUKXyeq4kLA4xwH8UYAV8MfJEgR/dFL7B/mGrUGdCaRpqNqifcglb
        OkjFNRf0+5afBjPmbKEfozvguhYtc6CMcV/2OXorqQ==
X-Google-Smtp-Source: AK7set/c+ED7Rsy5i4DQbDf3QRd4aGdnQ+nVsaNwMkWfz2fGDb5HnbL7NuBE4npCeLRgH7zPhsk+AbiDzK188yMp6lI=
X-Received: by 2002:a05:6902:343:b0:aa9:bd2e:3744 with SMTP id
 e3-20020a056902034300b00aa9bd2e3744mr3304488ybs.9.1677698381619; Wed, 01 Mar
 2023 11:19:41 -0800 (PST)
MIME-Version: 1.0
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
 <20230227183937.377612-5-ralph.siemsen@linaro.org> <20230301135808.6fefe5b9@xps-13>
In-Reply-To: <20230301135808.6fefe5b9@xps-13>
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
Date:   Wed, 1 Mar 2023 14:19:31 -0500
Message-ID: <CANp-EDb3XPEHya8igTh9fnyQW9yUs2MM6tCD9Pa3DCSwNZGvVg@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a06g032: improve clock tables
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miqu=C3=A8l,

On Wed, Mar 1, 2023 at 7:58=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> > Introduce a "struct regbit" which still occupies only 16 bits, but
> > allows the register and bit values to be specified explicitly. Convert
> > all previous uses of u16 for reg/bit into "struct regbit".
>
> I was sure the structure would be bigger than 2B but yeah, gcc seems to
> keep it small. However if at some point we add another member, we
> might consider packing it.

If we should need to expand this, eg. to handle something more
complicated than a single-bit control, then I would probably want to
rename the structure as well.

> > The bulk of this patch converts the clock table to use struct regbit,
> > making use of the RB() helper macro. The conversion was automated by
> > script, and as a further verification, the compiled binary of the table
> > was compared before/after the change (with objdump -D).
>
> I will trust your tool on the conversion.

I'm going to check again using objdump, just to make sure nothing slips thr=
ough.

> > +#define RB(_reg, _bit) ((struct regbit) { \
> > +     .reg =3D (_reg) >> 2, \
>
> Here and below, I would really prefer a "* 4" and a "/ 4". IMHO
> shifts should stay reserved to bit operations. Here, what we want
> is to convert a 1-byte offset into a 4-byte offset, thus the operation
> is a multiplication.

Reasonable, I'll make the change.

> > +     u32 bit =3D rb.bit;
> > +     u32 __iomem *reg;
> > +     u32 val;
> >
> > -     val =3D (val & ~(1U << (one & 0x1f))) | ((!!on) << (one & 0x1f));
> > +     if (!offset && !bit)
>
> 'bit' being an offset, is it correct to refuse writing BIT(0) ?

This replaces the check that callers previously did on the combined u16 val=
ue:

        if (g->reset)
                 clk_rdesc_set(clocks, g->reset, 1);

As you can see, it used zero as a special value to indicate "no reset
bit". I just kept the same approach, but moved the test inside the
function, to streamline the callers.

Of course, this means we cannot control a BIT(0) at register offset=3D0.
This is okay on RZ/N1 since offset=3D0 is an unrelated USB mode
configuration register.

> > +     reg =3D clocks->reg + offset;
> > +     val =3D readl(reg);
>
> Could you unify the how reg is accessed here and below? I think I have
> a slight preference for:
>
> u32 __iomem *reg =3D clocks->reg + (rb.reg * 4);

Yes, I will unify both.

Ralph
