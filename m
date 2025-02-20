Return-Path: <linux-renesas-soc+bounces-13436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD58A3E0F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 17:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EF411893558
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 16:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2F120DD43;
	Thu, 20 Feb 2025 16:37:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B2A20C028;
	Thu, 20 Feb 2025 16:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740069476; cv=none; b=UYoT2FxZbAzWS7f5KDhPLkIJqYkh31yGcgBzHe7YKfyLoWUwyH+wI/qCIPACKjD/K3+0eTQLaLofG3xkEMziw7d2+N8JioWhrge70ZdfXPv68bA2Dk0Kj7De8WE4wTX5IRqIVxH9C/neUGY/61bsW2YzufnzwZ+vmAbiW6liQqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740069476; c=relaxed/simple;
	bh=yUP6Ml0SkjJrNYT4euZBFTfnQ7/I1EV76KsG8ZvtDe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ajn6EFQRbwuF0aOU68ZaQU8wbA9BRglGjh08x7bwk5Nm/nY1Jqx/+0hBicH7dDiq+9zEyQN8VREvzGPCg3RMkWptVIOyrX6cVRQn+2V1gt4SY0a/pgfnwVto2NAnqFkZVHSUC4HOKWewxYCrLkVNv3MW8c3w4bgkV2YElUpAlV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4bdb423b971so359648137.2;
        Thu, 20 Feb 2025 08:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740069473; x=1740674273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mOC/Hou2LDsCci1LmZJN3OUWf7BOW8gSXzAXvMn/8s=;
        b=WrlsZ/NjHZTnC3+SqRuRIx1oMpevepW6pqPy+vXPvV6vT7LGb8Fs+dZYFfZUQPhamD
         u/b+t+FOMDdU+/KE4SwzcA3Tu+oSTLiIHG7F15IYR987FMiWaNDMCzT73ZGTr8PF9rHR
         +neA2ItMBqxkTf1HODmAvpgY+342dpBKi0gIOUdi18EmCoIEqMM8C/+bJjEi0R6O6pDK
         7gzAgyaTFILw8Xn6wYHY1fTIJ4N45cgIdCrJUm/L6m0Gu1CPC8cKG+rbHd63aQsoaPzh
         MZpEv7+KR4BQDWIKWJ4KEndHJYDyqJz+6v+Q9Gvm9oegwASeBeZSi3GLMNLWfkyTCRKf
         ybRg==
X-Forwarded-Encrypted: i=1; AJvYcCV97ld0E48wapH2HqckPVo6E2EOgOgqXRsrzBMNTf/wb9sA81MdvWYZWhWuVIs8qFzvWiV0NAcMfjLUWmo=@vger.kernel.org, AJvYcCWhMTkaVAaqs8+V+pd7+Im8q5lM39foF8/N1T7wrMtoxuuS6jGazuvRzYUA2gwwUTk8jEu9sH0IVGtnhlH8KUFJBks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/LIyDzJveEy4sbb5I6NXRSHaCZkqRKKrV5xNQnK4/5//7U5p
	6yrI2GSTRRGYzW9zxW06E+610TEa8ZsTJfDMyh4JLg/y7yo8nU2v3KL4vxEY
X-Gm-Gg: ASbGncsLXXU5LimQHuEavZJZYD6v+E+HvVRxmmFtqrTbC7qQP2YrtperFrf+Xg+TSfm
	q1zhaO1josEGH0jRxE2UYF7jSqbyzJUrKRILsUtVA7eTDm90Bc73wMT7S5QO1XxuY3DmqOfe1+h
	lCW20Gr9DY+taR6qVXO+2ephspwXna99QMn95kLEytXA09A/hkeRCIqKH3Ws3er3ZcoQCv5AAwf
	nuo80s18jeZjqeScrz4hlUKunBzJNyFJaI/rsabFBK/0oTBW3MdbaZPk4c7X/lptI50wAwWLDdp
	QCU53YnDbQMoiRwWqfk7Q476Pa++8rk0vQ6CnUUre6mYhLCdyr+jrA==
X-Google-Smtp-Source: AGHT+IG8jH4ddJzR3W010WfLj1VCNIJx3UkxqFKizPF8mVb7TxNrQYN39/aSKowkIpWZnFrcvj/pGw==
X-Received: by 2002:a05:6102:419e:b0:4b2:cc94:1881 with SMTP id ada2fe7eead31-4bf44a9cd4cmr1911121137.21.1740069472654;
        Thu, 20 Feb 2025 08:37:52 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e86cae00sm3370622241.28.2025.02.20.08.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:37:52 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86949b5b5b1so299203241.3;
        Thu, 20 Feb 2025 08:37:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5WO5t+399pWpqRrzxtqDIWrn8qssLAa5VBsVCiCbC01gEknfXjvHAc8vvOCdY8P2lzTEuENLexmbGm6NVZAiXf6U=@vger.kernel.org, AJvYcCWLq9mEFTdcigpZajQRXeUaryLG8/88rIWy0yZH8ekiyOhRrT0fZ2IwJWJYr6KIn9ZB3Bk9n2+3acl/So4=@vger.kernel.org
X-Received: by 2002:a05:6122:2015:b0:518:965c:34a with SMTP id
 71dfb90a1353d-521df759896mr1850276e0c.2.1740069472225; Thu, 20 Feb 2025
 08:37:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250215131843.228905-1-claudiu.beznea.uj@bp.renesas.com> <CAMuHMdW4sN6x5C7iQgiZD=Vmzg=BA1v+WjS7aapXmuM2_y8JvQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW4sN6x5C7iQgiZD=Vmzg=BA1v+WjS7aapXmuM2_y8JvQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 17:37:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwzwHnZazp79q0R7n7MjKDQXRH_RqRSmNd1vdN_9JTqA@mail.gmail.com>
X-Gm-Features: AWEUYZkRDEETuHmgJt02lKTac-M6ROhdNpTutS5TtHgJrMgv_Gp5nV7DfCBOBdw
Message-ID: <CAMuHMdWwzwHnZazp79q0R7n7MjKDQXRH_RqRSmNd1vdN_9JTqA@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rz-sysc: Suppress binding attributes
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 20 Feb 2025 at 17:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, 15 Feb 2025 at 14:18, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The matching data for the rz-sysc driver is marked with __initconst, which
> > means it is discarded after initialization. Because of this, attempting to
> > unbind/bind the driver through sysfs after system boot can lead to "Unable
> > to handle kernel paging request at virtual address" errors due to accessing
> > freed memory.
> >
> > Since the System Controller (SYSC) is an essential block for Renesas SoCs,
> > suppress binding attributes to prevent them being exposed in sysfs,
> > avoiding potential issues.
> >
> > Fixes: 1660e5ea6a3e ("soc: renesas: Add SYSC driver for Renesas RZ family")
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.15.

As the offending commit is only in renesas-devel, I'll fold the fix into
the original commit.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

