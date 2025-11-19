Return-Path: <linux-renesas-soc+bounces-24769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F008C6D8B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 10:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 3945528B50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 08:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557738F5B;
	Wed, 19 Nov 2025 08:59:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC42322FDEA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542757; cv=none; b=VvfW/26nigauGWRvkVAsNEGnWPmRSPG5IqSxR7r41h7q8077oTcch4fiJomnO5CFbXpRG3iU7cCFmp19uYRml2qt3tjV+2F1XsNP8uM5EE2ElDVZKAE7xGHkaC1Ny7Gg6sN6hbRBfYKcmbPCor88UywvMWozB58w4+zoQJ8MxFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542757; c=relaxed/simple;
	bh=x1ETO9gQBzCG9IxfyuhO9nUfEDSqlzn/l2nzh3hu+os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSZCO5TbiRIUseU2hc6RRdX3DsvBsIIbmQmOjMbapbrl5s9xwQoqGek+36CuKdofItFcKp4CifeWYoltMMYGyTP0AYpJRKEdczM7XRUgQrBwC18FIyiezjiCjbsQelaO+680r4AG8YU0GaEifTRKOijaadolmpwvZ4JS6cJVyXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so5016381b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 00:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763542755; x=1764147555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LS0PIRW3Q0/zfkvWSrpPbMhxA5dRo1SmIMgccBT+00o=;
        b=c76AYHzBosCne4biSsEV9cPOwkKrsyuiwQLhFe8VKt4azTC1oqqpdjD2HD98lXho6W
         w6erhJoM+meSaJ0GfcT0v482dGgI9jTsBqYlfi14V2fWd51nT8OEY5ofoF047Dg19KAF
         Z4VwzLR+xaQ4gGV2/HM0/y4PqI/ar+SJQEI7fxGOz2r0qMNRuyMfTg0akSujG+ANvrvY
         pyaU3yzEW/Nh692uSS9vV6ZkDoFBsB4USBzZPa91w9nY2MatIUW6GSnwomJT0NrI7mrI
         joqIXyzh4TcojlyHLqFzmFk8ycG82F1odQP3Klv+NxZMFAwtX0eQTzLHLncN772uFMay
         rqpA==
X-Forwarded-Encrypted: i=1; AJvYcCXpkJLSuC2nn6JbAu8MckJBPu7nULaUa6D2jJ08Z2W+wUfLWve6XSqgMTjGZtTODpadv3ukFMhFAFvh0v5uEBniQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb8/BPzxWseXgozsilCkniZILlwLCLUFxuJ8a7BIhQx+sOzI0h
	cuvsbtguKWZZ0KvgJfwQ6dny2TNzNYK4kh94UArRYxEZ2bn+4rQH93QJuNG72rkt
X-Gm-Gg: ASbGncunUai6Cy4OhXldmwF7YW1ZOlak3X6iL8+PrOhutSR2Yy4Lz9ccC35PYw8l4YU
	/8Xw7KDzUaP9Ye/4IgMQXx0CZ4rE3bGx6XJpeyulcV8fL2a7/WMPU6x5DmzsQMcCfsZzkhix8n1
	mbepK55WbFIWP7iCZHLoifz4eLoL2iy40TAtoeFzLtu4WMbcSEm04hKI37SmfvQa+SeXlgkcseP
	H5Iy1IuF1tmLxmbsTUgXBXHV1x19Nt9PrtiRH6XvDLzfKBreR1T43BQPIGvdclHfl7s5AivhLiH
	mozOOELkswMcZZ9Xz+MCNPt+BJh3Zz8/6IgxG7xY18ZmSPzAfenOrDBg3iK6+qzSzaViUVf19fs
	ZVB6YGwHd5acddXM62bE+GYrAoQJC0Wbdp/8p/2lS5ZOrll+JWKyjaf1fSFhixS1zxSuqQKitGJ
	fSqhfDWzHd4QDyiiHF5IVmYeb1SUQwlJgjqtWctM4F2eo6skK4BIHqt2ZYMd9v1aY=
X-Google-Smtp-Source: AGHT+IE2iVugs/bNfWxWOHt20zBNRcCMXEc9kTRqtk1tepMASm9LTAmCe+vbjcaGyBD96ddidocPsw==
X-Received: by 2002:aa7:88c9:0:b0:7b8:d12f:90ae with SMTP id d2e1a72fcca58-7c29de3b6f2mr2534094b3a.21.1763542754713;
        Wed, 19 Nov 2025 00:59:14 -0800 (PST)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92772e7f2sm18795521b3a.57.2025.11.19.00.59.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:59:14 -0800 (PST)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so7305998b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 00:59:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWx/zYGFyNl6Nbo8YdWKQViPyUwyQQKg/bXBWBNSPwD5LwmBBFPpoGTkttvluyuP91q6TRhB4buXZ2fcrsYCzm5Bg==@vger.kernel.org
X-Received: by 2002:a05:6102:41ab:b0:5df:b4a8:fbaf with SMTP id
 ada2fe7eead31-5e1a6dfeb50mr481222137.31.1763542404865; Wed, 19 Nov 2025
 00:53:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk> <1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
In-Reply-To: <1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Nov 2025 09:53:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>
X-Gm-Features: AWmQ_bmK2x20bqzBbl34KnFcBc219BFFPGMTWyPQr3AqlLeaP7gK9n05hJwL6mw
Message-ID: <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 20:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 18/11/2025 20:34, Mark Brown wrote:
> > On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> >> The Devicetree Specification states:
> >>
> >>     The root of the interrupt tree is determined when traversal of the
> >>     interrupt tree reaches an interrupt controller node without an
> >>     interrupts property and thus no explicit interrupt parent.
> >>
> >> However, of_irq_init() gratuitously assumes that a node without
> >> interrupts has an actual interrupt parent if it finds an
> >> interrupt-parent property higher up in the device tree.  Hence when such
> >> a property is present (e.g. in the root node), the root interrupt
> >> controller may not be detected as such, causing a panic:
> >
> > I'm seeing a boot regression on the TI x15 platform in -next which
> > bisects to this patch in -next, unfortunately even with earlycon (though
> > just earlycon, I don't know the platform specific runes) the board just
> > dies with no output:
> >
> >   https://validation.linaro.org/scheduler/job/4252918#L409
> >
> > It does seem like a plausible patch for this sort of issue though, and
> > the bisect converges smoothly:
>
> All Samsung platforms fail as well. I was waiting with bisection but
> Marek was as usually very fast:
>
> https://lore.kernel.org/all/20251118115037.1866871-1-m.szyprowski@samsung.com/

Yeah, the various ti,omap[45]-wugen-mpu nodes have interrupt-parent
properties, but no interrupts{-extended} properties.

Does the following (whitespace-damaged) patch, to restore finding an
explicit interrupt-parent, fix the issue?

--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
                desc->interrupt_parent = of_parse_phandle(np,
"interrupts-extended", 0);
                if (!desc->interrupt_parent && of_property_present(np,
"interrupts"))
                        desc->interrupt_parent = of_irq_find_parent(np);
+               if (!desc->interrupt_parent)
+                       desc->interrupt_parent = of_parse_phandle(np,
"interrupt-parent", 0);
                if (desc->interrupt_parent == np) {
                        of_node_put(desc->interrupt_parent);
                        desc->interrupt_parent = NULL;

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

