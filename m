Return-Path: <linux-renesas-soc+bounces-24783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E6AC6E2DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 12:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 34813366F3F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 11:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF857336EC1;
	Wed, 19 Nov 2025 11:06:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1907217F31
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550418; cv=none; b=aJTxIFfNTlfggooU2xKMGAhd6oYtABoCW1X0fDK8N0+dv/k/pKh5inAKIJPdzU3jpkT8Xq2HmuCfYx2GzRBY3Zve43pxwKnixZjKIVTugJjPnKQq4c9gb+b2t8L7EXmMRZgwCgG2e4Sk3Fnx+nsS6KPkXC+DjmqGE3rOnhrH/6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550418; c=relaxed/simple;
	bh=suLMms/cC5PWL/dT/dDRBxYiO9gO4357/Gv7VoKpjN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLV/vbcQR/jiviAzD2ZG9Ar9cllsAAEXklgcqZtZU0oi+90jxale1hqbi6mk07SRvWE5uTRWcVscMNqjQNJAoeR+Z2UCzFNhCJpsgyTPO90OMjCfvOSXkN2tlda1UaPnwwlhwfvMeISOPNDIBmxHEBv5cq44o5aq/pS5bLd2SgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-657534478a0so1421871eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 03:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550415; x=1764155215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01vJ+iTaEhlqFfqqNaTQ+Xj9o5ybGoOTheiB42bAFn0=;
        b=nXcq5BiBmDVglpLKY90/VZSjswDm8sHAcAy6dBbchuSGaDzMLEuXzKNAARlph6Xt6i
         /XkgYVQK9ntMpwQI0znmseH3er8o6rEmoGeJJ07jkSoAdw7jjJm4X1xvqGAJit2Dugqd
         2hoL2fCa1QCTPwaHI2keAEGfqocDzIvcNDGrxjO8TU58mp5Kd2PWIXT76AxmbuD21s2v
         9QiaFxOAgPWE8y1RuYKQjODYMKjqgh5VWIK9ei7QsOJFjH6MPMuwsSsRAqO2HX7cKScO
         G4LnI+dvMrDsGu13aI0Om/iWuYHvE8j+20O6ysf1nUOskD5ONmLhe0TSwPuXjlB3+XZ1
         vuAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7d9bKzO7G2EpPp7uE4cwcM5FSwjOkEstiSrQEoVyULMgHswbGL6FvWMImDyTKTY+/qliTIsnRm0W/jX5YaFd6gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynoS5vL0LRSgQ0vSkndT6sLnRNL6538CZ3HmQR9ceWGwOCj7vb
	3yaSQePk1xKMCuFREHDK7Rl67ZCqXBDFhuZcJiwVLQw1G6Z/e/QGtWxlUNV0UVb3
X-Gm-Gg: ASbGncv60+Io3tTpMtrWZ5u/pzYSc695n8jKwbIemcbZaihy2opM4CNcCpjBn4wYPB6
	3xZ/n2P2sMHPaI5jCv1svXMwMXBa5ElhpYWkLYJUckwYz6rXd7U5sgMywvPHV7bcfLBi8FOZFfS
	ynwCcqaWiFEd2UifZAUtaHwbt4RrLDbgv95W3vwf9RXlTE4LgbEEM0qxyvCWoIhg42WaIUQukBY
	MooHQj0B+EU/slM7AwcsH/PSvK0T3Ptu7q/n5M1YCQIhdAh9h9jnVXo8hsPqGh1vaiFz30QPwJo
	h94MKX0/4NUKYQg1CXoHSTFF1DZyh/++ftIG8lCHhiXQufV+Etat6iTvqLsTqQsbiM8IeOaE8z8
	0F61lctOaQQrOgugbc16WIV4eUccKkNSTq2t7d1p7a7y/11joF3VauwL3dM/pq9KAAgND47uLkQ
	8EBNzhA3G1mesxa2EHWu318RgOwjkZ1T/lsRQX+eM3IewdDQx6nw+r
X-Google-Smtp-Source: AGHT+IFlbsYJASGxruJtbVFN8IyQ2FWlUiVmn6K/c7ueiJZ0/LLKgq12n8mZXnZz2bLIe/yiXpsK1w==
X-Received: by 2002:a05:6808:1a25:b0:450:ccc6:4113 with SMTP id 5614622812f47-450ccc6539cmr4063903b6e.52.1763550415509;
        Wed, 19 Nov 2025 03:06:55 -0800 (PST)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4508a555d86sm5913305b6e.9.2025.11.19.03.06.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 03:06:55 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7c6da5e3353so5322291a34.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 03:06:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDTb4+fmfVP5CJ0zjKotYLyQ0JFZy2CYKi/WoCoyZBVTbdmFRhAOC4rq6XoYloQMI80xGFiTJOtlSL3Rc6Ey0Y4Q==@vger.kernel.org
X-Received: by 2002:a05:6122:4582:b0:549:f04a:6eb3 with SMTP id
 71dfb90a1353d-55b1be64f5amr6929551e0c.9.1763549959520; Wed, 19 Nov 2025
 02:59:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk> <1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
 <CGME20251119085902eucas1p223cb580bdd4cef2698382835c77210e8@eucas1p2.samsung.com>
 <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com> <765d114d-6a03-4535-a644-5e7581dfbccc@samsung.com>
In-Reply-To: <765d114d-6a03-4535-a644-5e7581dfbccc@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Nov 2025 11:59:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5ixRpE+yPbggBG91+516YD+ARkaCLN-gM8bQLvtqrYg@mail.gmail.com>
X-Gm-Features: AWmQ_bmyj7uEfaaHTRs_Dlhmh8ug_B799_bBc6DeLqXxY0jfIRw0Qy-WNEKxB9g
Message-ID: <CAMuHMdU5ixRpE+yPbggBG91+516YD+ARkaCLN-gM8bQLvtqrYg@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 19 Nov 2025 at 10:55, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> On 19.11.2025 09:53, Geert Uytterhoeven wrote:
> > On Tue, 18 Nov 2025 at 20:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 18/11/2025 20:34, Mark Brown wrote:
> >>> On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> >>>> The Devicetree Specification states:
> >>>>
> >>>>      The root of the interrupt tree is determined when traversal of the
> >>>>      interrupt tree reaches an interrupt controller node without an
> >>>>      interrupts property and thus no explicit interrupt parent.
> >>>>
> >>>> However, of_irq_init() gratuitously assumes that a node without
> >>>> interrupts has an actual interrupt parent if it finds an
> >>>> interrupt-parent property higher up in the device tree.  Hence when such
> >>>> a property is present (e.g. in the root node), the root interrupt
> >>>> controller may not be detected as such, causing a panic:
> >>> I'm seeing a boot regression on the TI x15 platform in -next which
> >>> bisects to this patch in -next, unfortunately even with earlycon (though
> >>> just earlycon, I don't know the platform specific runes) the board just
> >>> dies with no output:
> >>>
> >>>    https://protect2.fireeye.com/v1/url?k=7efe2b91-216202bb-7effa0de-000babe598f7-79b85fd5422be185&q=1&e=a2b4aea0-c947-472b-ae80-9160750f84a2&u=https%3A%2F%2Fvalidation.linaro.org%2Fscheduler%2Fjob%2F4252918%23L409
> >>>
> >>> It does seem like a plausible patch for this sort of issue though, and
> >>> the bisect converges smoothly:
> >> All Samsung platforms fail as well. I was waiting with bisection but
> >> Marek was as usually very fast:
> >>
> >> https://lore.kernel.org/all/20251118115037.1866871-1-m.szyprowski@samsung.com/
> > Yeah, the various ti,omap[45]-wugen-mpu nodes have interrupt-parent
> > properties, but no interrupts{-extended} properties.
> >
> > Does the following (whitespace-damaged) patch, to restore finding an
> > explicit interrupt-parent, fix the issue?
>
> This also fixes Exynos case without any need for the changes in

Thanks for testing!

> arch/arm/mach-exynos/suspend.c. The question is which approach is preferred?

It looks like several other drivers are affected.  So I think it
makes sense to handle the presence of an explicit "interrupt-parent"
in an interrupt-less interrupt controller node in the core, instead
of in each affected driver.

> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
> >                  desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
> >                  if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
> >                          desc->interrupt_parent = of_irq_find_parent(np);
> > +               if (!desc->interrupt_parent)

Or "else if (!desc->interrupt_parent)", to avoid repeating part of
of_irq_find_parent() when an "interrupts" property is present?

> > +                       desc->interrupt_parent = of_parse_phandle(np, "interrupt-parent", 0);
> >                  if (desc->interrupt_parent == np) {
> >                          of_node_put(desc->interrupt_parent);
> >                          desc->interrupt_parent = NULL;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

