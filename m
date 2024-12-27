Return-Path: <linux-renesas-soc+bounces-11716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F249FD523
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 15:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F032162D4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 14:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B7D14C59B;
	Fri, 27 Dec 2024 14:10:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A621E86E;
	Fri, 27 Dec 2024 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735308654; cv=none; b=nXNCgCerFZl9H60BL4GUSJzsPbb7MnriYvU+ZT9p3+m5uyIAaB+cIrqhkSau0TpTnzttuuyYmpybVJIhWw2kdmlEWXn2iCJsTDug8Ke+UyQ5PTsh0ocVQyG2vjLEP0JF1X1hG7SiTpepo908GElSoM7bGfJIAQXmfNOPd3uOlvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735308654; c=relaxed/simple;
	bh=FZRFCIfaxM2dcqmZPaglpGmKV+t4dNGKhicW5B4eAqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJ/wGzetGoBl2/aChr+sRN2dYIg2/urIFKhlpTNIJVr67A8yViK3S/M6pTBF2tRBozzt84a57H+pwqmSjFWYxO9NZd9klXICAN4KgoUiZUSu6602Fe4Ghm0/odjv8+BTWwz0yelXUMgq6qpISt0h4MTN7tGhAum8tlPAQFsLqbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4affab62589so1784608137.1;
        Fri, 27 Dec 2024 06:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735308651; x=1735913451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=je/kOxeprii2UdN9bRVE7Bz3EF995thBqj5lJEijKmU=;
        b=ODtiHEOUF+v73++Xp/LwPpGplELj92f1wyQxXhbnU8kH/Y2wuBmBlAOU51PT6/kN+Z
         ntK0aMnwvneukhH5E5XF3LmRbvhHoykn08n2s444Hj6SU8WuTq3trM9E+OB8tX6omzbR
         WI9cjOGGPNpN4ok0HIfb2u7W/+5CNnI/SaenT1GcXK6wwVCD3NJgepV3bDac9RQHlLxC
         JuG35shEZSlw2K1dWEu0p6/4nUVauAdkjTasqSEyjcX6e7wbxF1PzScnZKeqRGoEJIXX
         NL3bApm1biMFM6n+Lt7B133R8FQAHaY2IsgBmmZYztFXsgW5FTBOR84AhkeLedh/WeNJ
         Vjtg==
X-Forwarded-Encrypted: i=1; AJvYcCUQM9aIuh/GOAw159o4mzyntQGimOGkpFm+fhCzpfSptH7we4H+c/slxzplZzyB8J5bVM2wugHg83V/L5BI@vger.kernel.org, AJvYcCVC1+1B1GQ1x5Q7hblSaUoxwjI5oDuH8KSxhkrep3oa2EONX7MOMTRntGp1p5TPPR7cvWgGuztB6JrVwpy0pTBadRk=@vger.kernel.org, AJvYcCWhG2pt94dZ8UPbQjRYT101grqybdZYVYn278egxHnqWIzRGM0kS8NKkvxxHesDazrlvAJagmLufRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU8U3prOsujC+XiTCPUG2uCbuDGCOWnBjzJU88l4Dewk6oP2jo
	Kqd+N1NR5UhxtQ0T3PZp9FDUjZO2oQL5rc7lbfVzAcd2GofABGw7cx1ttdvJ
X-Gm-Gg: ASbGncvWbAhLQvUHyHBSzzWjImhrLN4OTLwqXqOOTNmo0HKaJjDc8Xcz9vn1qY8Yl4I
	0Q9ZHaQFR2l+fbf/Z/IKtIRIXTVgq3mIuHY3+cU3bw8gaAAitLO6fUvcCvSG1Nfo64EEusJnxZX
	5RWBMxWTy6T38+jXPzryf5wJMS5syik5JVQneTgaMFPh72kKNSPajNqPDyDmib3hjUDMEQy96TR
	CKelvycC0LJFTXB8IyVD6aw+GJJJy+3TxiG/2CVJL10TV1rHIMpQnMLcytEFivjvqohSYOrWFAo
	Lx5SQnpbZgc8a5dsQwo=
X-Google-Smtp-Source: AGHT+IGxyyoKTOewoizwtg5HqrWk+oVN9+H85rMn4L9BRqOFVwHqjczsNmymXs4xGdnJLhN/MJytpw==
X-Received: by 2002:a05:6102:3751:b0:4af:c519:4e7f with SMTP id ada2fe7eead31-4b2cc4622acmr22024855137.18.1735308651006;
        Fri, 27 Dec 2024 06:10:51 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf9d9b5bsm2864853137.18.2024.12.27.06.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 06:10:50 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso2131653137.2;
        Fri, 27 Dec 2024 06:10:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKWaeJK5m+steIzfSApwzZaOWBZxSuSdXj/MqYjBOt2GTWeKxE4sHj+Ate11zC6FfuEFDWaeXHZOA=@vger.kernel.org, AJvYcCUT0jpzu3fKsugGIPUC5748gwhKmCIYJVRvkS0E6dnXRHU+5b0EUROmuQiEHzAlUePo1yCLRRRVeC+9CHH5@vger.kernel.org, AJvYcCUpWE1oCIU/Nt0NmJmbtwdfgiVumRF4A9l1AB1JkNiXAGH20hhoswvX6ZiRRdPESekUYH8ETSlUdEzeIs7LJNJwNVM=@vger.kernel.org
X-Received: by 2002:a05:6102:3e83:b0:4b2:af6e:5fef with SMTP id
 ada2fe7eead31-4b2cc35c2d5mr21811945137.9.1735308650567; Fri, 27 Dec 2024
 06:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241223173708.384108-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241223173708.384108-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Dec 2024 15:10:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXtCy1Rmrc-nNq-N7y2NKStsAMcA7xx6Z2quN5tULMeA@mail.gmail.com>
Message-ID: <CAMuHMdWXtCy1Rmrc-nNq-N7y2NKStsAMcA7xx6Z2quN5tULMeA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] clk: renesas: r9a09g057: Add reset entry for SYS
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 6:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the missing reset entry for the `SYS` module in the clock driver. The
> corresponding core clock entry for `SYS` is already present.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.14.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

