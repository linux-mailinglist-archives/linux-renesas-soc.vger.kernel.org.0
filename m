Return-Path: <linux-renesas-soc+bounces-23461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4575BFFBD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 09:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A663A9162
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 07:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51482E1EF8;
	Thu, 23 Oct 2025 07:55:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085582E0411
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206139; cv=none; b=jbj5ILk+VyLjSFcisQpFEHsgnLJrjphXL+CqIaQp0XZABP29t13/fIB2GPe5PW4WeN4JG77wi4RnWK0S1GyKf1hZSbAEgRGOGNDwJKQyWD102mJHqbCcAFxyR8oOr0lcIg/9kxPXxaLDhkSTkEAi35XfDoJIJuRcADRZAORq0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206139; c=relaxed/simple;
	bh=+fB56hRZm4s/9A94T+9AsJSw3DZkXg6RPZ3NqE6zskM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AU/uOiWrLaLr0D9iFBzaDAhiXie68WIHqtpr2yEiaW06quQ39jEfJB1R3YMM8CC9h3mtO4vW9nSNn9Jk7BaCxBXEmJUDctDqqDw4ote8VL+yfPXSRLAxgSgpUnNYRX4ZirAsZPCAa4PWeWiHyDy8sWI3ZM5f4cwaNEIKq2BpUkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-932e885467cso411091241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 00:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206137; x=1761810937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1VWeQnGLaqOMfwGg5f7EVJzLAyxDuT3Je9LnDxvdps=;
        b=cqWgeplmu+bqWEGaYDWxz9BjsKS9M7ZRqYjZFJC0Ndg1FOCVU2K+JVShCcxER+JmPj
         Ui0HdyJyVf8N2f3vfOqeXvTip5qGwYkhppmqb2zkvZAbmPcEOZtz62lTR6JFhS+H1BYd
         msivt8MG6Ddqhew/Ih3dgAQMMdJjLKJIUe/fz9SFtAYZDSP5I4HpUtmn5ILYbG89/yd3
         amQAaphlRucBbZ/RGCSSoI9SCh9fKvFwS0HxfuCzATJfxXFLD0l27T74zPbWK9YXL/sL
         aJmiNRQZttK+UuU48EHu5bpP3Rs9S8xpvzo3dnH3cL6w6yXYQpdFFZEyarFY5XG7pj4m
         BzxA==
X-Forwarded-Encrypted: i=1; AJvYcCW1gUdv8CVyp1OhNt/eg/Jls1+2mB0AdsCROtsaw5n8eILvBXDNe7qygCNEd1FR3ZP3DymMqAl+HZDfB4VV1cDS2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLUz7Kirl6diHtoLI9A3TrXDINjV9erZ9oa9Jb2RLAWfKpqZ1z
	iniyedj2bg9YEwtojog6p2+0VL5MeIXqFIwhgOfirQ8z2eyUXHWYveeOC6lTfuM9
X-Gm-Gg: ASbGncujjLtSpQjM7mjE7f+XTq50CTYtRPc1C13wcCzRvQ4XsA2bh7yNZIsjsifGi7h
	QsSkkuOBg5Za6cWf2KEhX9dv+4eRRQJbaxv9Yi51wwodsDV/61zSYTttiZSjmiAXFehZOIwp1qm
	ylhbUNKbxRYabkhsPl3PLtfHp/0/U4KGY0fp5uLX7N+gBL5XxwxrXqagxY0uTJi/PCp+ejOvtuO
	1eyGDvFVMPDo1drTKHuFXVOVyeGgk2SMHwamMkx5BS54ZChfmHUbo+SCmP93dxwufnUHb/k8SKU
	RQNzEBl1JBn5AR99cLbgl83nuoCANbAGVyzP+/ndXVC1PDuOxfrBOHMbZlzbkgo/1hy26hfPFtE
	3xb5PyWaHD7G/U3TQAujbHRRRjLH273mpcguXA6301WWqskWw3NAYHBe4LldD0kcawcNFKdT67v
	vwyudW6HTjDtXRRUl2ldDjLZ/bjLTc/nICoN/Z5A==
X-Google-Smtp-Source: AGHT+IFwJ7Lz3ny27DqJg9GHYfXZvkIeXPaI2IMFVuS+IGcERe8B+f0gPtSiekNH4JV+pL4N5TdNhg==
X-Received: by 2002:a05:6102:c08:b0:5db:2917:3652 with SMTP id ada2fe7eead31-5db29173f2emr1194175137.35.1761206136669;
        Thu, 23 Oct 2025 00:55:36 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2c7c995asm631451137.5.2025.10.23.00.55.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 00:55:36 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso545102137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 00:55:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrgGkm1YHtDQj62i3e41IWOpp+QV2gvQ49SE+I5xOE83c1+xamThukJPAgheDcwf9QvdY9j+DfXXVLvAWu8Lm0iw==@vger.kernel.org
X-Received: by 2002:a05:6102:38cb:b0:5db:337d:65c6 with SMTP id
 ada2fe7eead31-5db337d6988mr173700137.23.1761206136224; Thu, 23 Oct 2025
 00:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007133657.390523-3-claudiu.beznea.uj@bp.renesas.com> <20251022194939.GA1223383@bhelgaas>
In-Reply-To: <20251022194939.GA1223383@bhelgaas>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 09:55:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLXd-eVX0UBPYtrzVPbA6VkdD1rHBAWMKgrYKE+Aa2bw@mail.gmail.com>
X-Gm-Features: AS18NWCwdsxUw7zogPqVrxEDzYqaWGHMFOcHzYZ5pvVfO4qa6VaOrBUa-VfGcUI
Message-ID: <CAMuHMdVLXd-eVX0UBPYtrzVPbA6VkdD1rHBAWMKgrYKE+Aa2bw@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn,

On Wed, 22 Oct 2025 at 21:49, Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Tue, Oct 07, 2025 at 04:36:53PM +0300, Claudiu wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> > Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> > only as a root complex, with a single-lane (x1) configuration. The
> > controller includes Type 1 configuration registers, as well as IP
> > specific registers (called AXI registers) required for various adjustments.

> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
>
> > +#define RZG3S_PCI_MSIRCVWMSKL                        0x108
> > +#define RZG3S_PCI_MSIRCVWMSKL_MASK           GENMASK(31, 2)
>
> Unfortunate to have to add _MASK here when none of the other GENMASKs

Actually the unused RZG3S_PCI_MSIRCVWMSKU below would
need one, too:

    #define RZG3S_PCI_MSIRCVWMSKU_MASK   GENMASK(30, 0)

> need it.  Can't think of a better name though.

MASK is a good name, as the register bits actually specify (part of) the
window mask.

>
> > +#define RZG3S_PCI_MSIRCVWMSKU                        0x10c
>
> Unused.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

