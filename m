Return-Path: <linux-renesas-soc+bounces-14747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31772A6D7F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 11:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 578793A3FED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 10:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF915136988;
	Mon, 24 Mar 2025 10:02:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB0D802;
	Mon, 24 Mar 2025 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742810548; cv=none; b=kVMjgTk42PRp0bGgz5V3mlKIagv0Jik3htCM6jvijDaxY0SvjZyLMIFAkslHCXZlDS4HCkBKnxbmJfRPitT97FX/AsSUtytVNxoQ3JN/AfsPqf8e5kqMc87T0MvhR61j1ureYbj/XZdo3g43LWSn8h/To+zOfmuxFs1jqEy/p2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742810548; c=relaxed/simple;
	bh=d1P4SLwhm7rRZwEO/QkLAZ5XUSci2bFpIlPV4dqHZ8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snLgJYnTnhsCpKgPC7HcxuUiQQ9H/9KnQ+pcAzD1xNi/CoXnY+Cy6OB1iW8u+C39G+qt0Y1lUbKdHMRaSKk/4EPQKss3YedXX6fHNjOiCZY6qgMCq2D/dNK/RNw78XtXiwzF2m6qS1PbZE0gQdMQXXw9QzXe5w80O/oC3Z2iYHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5259331b31eso1915609e0c.0;
        Mon, 24 Mar 2025 03:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810545; x=1743415345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjkldBobLlJzdi7GZoyKSocAvNLs1WqgQ5YPK5Fy6kQ=;
        b=fzaWS2NUoJGYLwFQdX2U7AKFKOKhWai6hVfI20XfW7DK/PhxIF6gNESzLmZSDB/ynZ
         vcIdNXy6pbeCKZ9FWCCTCd6QnzYU4i7HsImdFtbr9M4vFvSnn3EbGhObzHKtyYNnTo4j
         NdwN84kT3zbI8irawpVaGLrDw/WvZQcfkcufvFh6sZYqbE54vl38jcNIJ2Pdug9xU/ky
         H1Ytw1A8Jvn+gdq94psH+mj+7XWC3mczLK2Lkkp27gCuoQQWc0E8lMz2g9d1Lz66YIZW
         VUVz80Wx5W9kGh69tljtop5d3hPjG70vlP9V52NsMbs39VxTOuFKvJEv9ck1BynTA0gd
         5QsA==
X-Forwarded-Encrypted: i=1; AJvYcCUwBaqspgoYTIZQ2DFmWDZzmbPfqXdAdOYazf5EXb0GvR3yP3ol/McBB9BjUC+78JfTzSQ8v2O880FagDTywW/4Wrs=@vger.kernel.org, AJvYcCVk77baUu27voCMimhagB7fz6rLrR5ZWPTPedVnYJNkQPizZdBwWKeiaWHaB0ubf8yKDF9UA5vTgktLgn5w@vger.kernel.org, AJvYcCX4Jb5fYI3CnyUuI4QCcvHD/g14KbvjZeqeIDK4F/lF9c9wCHVlApuy6c2IuRfgzfr6hSBhi7AcliUFG8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5WZSBRN0Z80O5xhMhJF2bk8fRAE2MoRsFFVcOaGP+xuI4S2Ys
	KiesTsIG39hR0icDvSKZlQxeNr+UIK1lKxV4X2fJOQ9yOPpjT+kcOoN/pixf
X-Gm-Gg: ASbGnctzPeAclA1XZmIFfMEXM79Qy26qle1aKnXcTJrA9FQ8pUJ8t0e0fxZcrGD6tGh
	bw0dSHd8udUaUNBdYqoGOebDH649SfnxHLi2sOHAIa/f6LRYrxKkI8up9eB9u4qq3zSlg79Hzg0
	Q839PQGMjCAt0SXFt6jIwoU4+Y9cELXttZgOUdfVExzdRxIUWyiS4+M1Oi4wqzNvugPibSSrxYf
	P+VsF22hyel16UWS6NkfgoSQ7AhOx4mHfkJ1SlX8XUOiWd03VFkw83E40F1vcjB0iV+NPlj/r2B
	vV06vE4DWpM0RgUp6lE3WI6mHSvhsaRsykguT4hHtnR78LToj+ihjU2chPtBAqjzNbVHWIDYIMv
	0lbpmqlzAZLjGfpi6qrWu6A==
X-Google-Smtp-Source: AGHT+IEwGAnj5QbTTGQlWhK0jUyMdSPOi92dPp54xzBkgPIHeSShqWNbSFKHzPn3y/CMHm2cssOXVw==
X-Received: by 2002:a05:6122:3212:b0:523:9ee7:7f8e with SMTP id 71dfb90a1353d-525a8342034mr9241113e0c.4.1742810545067;
        Mon, 24 Mar 2025 03:02:25 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a735bfaasm1323702e0c.2.2025.03.24.03.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 03:02:24 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-523f19d39d3so1953669e0c.2;
        Mon, 24 Mar 2025 03:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXL9u7Vjc5Il9HYGgXWQ6NTfxxYqqObWkr9tVRjAYaBAxyJPHq7ItMbp1CTNH+uyFQf1FBFkT+zZC5EQK0=@vger.kernel.org, AJvYcCXTS4D1l6Mq47TvV+Er94S8cmxdWkBMWeKnl4AqjWYOYn3LdLHIpsbwuMMsZ+EFSJzFvDHNmpfeTTihp+vkQmzk354=@vger.kernel.org, AJvYcCXci6N1sTqCSPUSyzyZEdkgQvkxT+X63AneCM5jMAhjCvttHhuL7Xrr7lUXWC5jCz2YzqNsMz4gC74fBanA@vger.kernel.org
X-Received: by 2002:a05:6122:3d44:b0:520:61ee:c814 with SMTP id
 71dfb90a1353d-525a82f6fa5mr7693745e0c.1.1742810544546; Mon, 24 Mar 2025
 03:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-9-thierry.bultel.yh@bp.renesas.com> <Z-ElHPod77Py1DPH@shikoro>
In-Reply-To: <Z-ElHPod77Py1DPH@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 11:02:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgumyO_ibzTxzBqXzSyfixDVz-xLnQsTUr1kutk8vq=g@mail.gmail.com>
X-Gm-Features: AQ5f1JqXVa8TgiB8RvZEysO-CT-OzoLoSNS1yvlhvJ61S6rYl6aF1M3zBRkgOxc
Message-ID: <CAMuHMdXgumyO_ibzTxzBqXzSyfixDVz-xLnQsTUr1kutk8vq=g@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] serial: sh-sci: Introduced function pointers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Mar 2025 at 10:25, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Thu, Mar 06, 2025 at 04:24:42PM +0100, Thierry Bultel wrote:
> > The aim here is to prepare support for new sci controllers like
> > the T2H/RSCI whose registers are too much different for being
> > handled in common code.
> >
> > This named serial controller also has 32 bits register,
> > so some return types had to be changed.
> >
> > The needed generic functions are no longer static, with prototypes
> > defined in sh-sci-common.h so that they can be used from specific
> > implementation in a separate file, to keep this driver as little
> > changed as possible.
> >
> > For doing so, a set of 'ops' is added to struct sci_port.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Okay, the discussion about the general approach convinced me that we can
> go this road. I will not do a line-by-line review of these patches, but
> just check that it looks good to me in general. This patch here merely
> shuffles code around and adds some inderection. If it works, it seems
> good enough for me and we can improve on it incrementally:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> That means, though, that testing this series on a variety of SoCs is
> especially important and I'd like to get confirmed that you did these
> tests on SCI variations which are available on RZ hardware. According to
> my research it would be those:
>
>         [SCIx_SCI_REGTYPE]
>                 /* RZ/Five, RZ/G2UL, RZ/V2L */
>                 .compatible = "renesas,sci",

Tested as console on RZ/Five...

>         [SCIx_RZ_SCIFA_REGTYPE]
>                  /* The "SCIFA" that is in RZ/A2, RZ/G2L and RZ/T1 */
>                 .compatible = "renesas,scif-r7s9210",
>                 .compatible = "renesas,scif-r9a07g044",

...RZA2MEVB...

>         [SCIx_SH4_SCIF_BRG_REGTYPE]
>                 /* a lot of RZ, too */
>                 .compatible = "renesas,rcar-gen1-scif",
>                 .compatible = "renesas,rcar-gen2-scif",
>                 .compatible = "renesas,rcar-gen3-scif",
>                 .compatible = "renesas,rcar-gen4-scif",

...R-Car Gen1/2/3...

>
>         [SCIx_HSCIF_REGTYPE]
>                 /* R-Car Gen2-5 */

... R-Car Gen3/4.

>                 /* a lot of RZ */
>                 .compatible = "renesas,hscif",
>
> Please double check that I did not make a mistake. I'd think Geert tests
> these on in his board farm anyway:
>
>         [SCIx_SH4_SCIF_REGTYPE]
>                 /* landisk */
>                 .compatible = "renesas,scif",

Tested as console on Landisk and QEMU RTS7751R2D (both without DT,
though)...

>
>         [SCIx_SCIFA_REGTYPE]
>                 /* R-Car Gen2 */
>                 .compatible = "renesas,scifa",

... SH/R-Mobile...

>         [SCIx_SCIFB_REGTYPE]
>                 /* R-Car Gen2 */
>                 .compatible = "renesas,scifb",

Not tested. SCIFB is very similar to SCIFA, so I am confident it is OK
(all tests for PORT_SCIFA and PORT_SCIFB come in pairs).

>         [SCIx_SH2_SCIF_FIFODATA_REGTYPE]
>                 /* RZ/A1 */
>                 .compatible = "renesas,scif-r7s72100",

Tested as console on RSK+RZA1.

> We maybe can get hold of the next board. I will figure this out
> internally (not super important for this series, but nice to have):
>
>         [SCIx_SH4_SCIF_NO_SCSPTR_REGTYPE]
>         /* SH Ecovec */
>         arch/sh/kernel/cpu/sh4a/setup-sh7723.c: .regtype        = SCIx_SH4_SCIF_NO_SCSPTR_REGTYPE,
>
> That leaves some older SH boards out of the loop, but I think this is
> OK. A quick research didn't let me obtain boards for these anymore.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

