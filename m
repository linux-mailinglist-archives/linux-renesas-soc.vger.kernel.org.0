Return-Path: <linux-renesas-soc+bounces-8485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B04B49641DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 12:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D162B23FCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 10:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEF918E03E;
	Thu, 29 Aug 2024 10:23:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260DB139D04;
	Thu, 29 Aug 2024 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724927016; cv=none; b=QcwrfIN0nBSMyO4SP8BwNdqQi5vsVtfRZaTACNrvBIeQE5McdtUrTzuvSLTD5/6Q+PZ2xQXtuNIyx/VzuFREkjTSmAZQhZZfwWPyz0My5fkm49rwxWUQNQYNVwrI5dSJT5zetbkVgooEQetdQn34F0/3t7yvDIlavHh6H/YceFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724927016; c=relaxed/simple;
	bh=+qDbg+b+y5JPeSs8m4Me+sOY+xkF+2YmvqCcX1UxhzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obnHj8eWOP6Xjggl80n1S6FBnSaXnKnmTNUBTes1yNZMZu5G2GpDgmD7mqkQUqahqO4ITRMcp/b71apMP0IXe9oc2O6heRVf6MHztAmBZGyPYGX4YUETVzZ4EqiYITAWmmU8I71qi/s9ERlhIZIx0a6rLOyP1KpQYE0VJpsuEdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6c130ffa0adso5132367b3.3;
        Thu, 29 Aug 2024 03:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724927013; x=1725531813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4Ftb0GocyJ/C8uBCYxnTAY1Zw5Um4gDWJu7PBY5uXk=;
        b=t+D955Rp9SJDfdKbJR3OHOcNs1E6bqT/NsefW+8FjRQjkljW/xYeyXC0soiC6tR/3f
         QJH86JfmN2TZtymGbDENbUytyIyRUarS3v/5PU45kz9XP3lJC77tJDU3POWS75MXojVG
         +QLyM45/TNlZl1zfBHF+hGLAULJYoNmQqOWK74Zv9uHBE25XRx2Ayl2Gl/bW7dDf8U8i
         ky67BA5YQ7hJ2mEG6Mwqxr9ylxpt17s7q518Ae2RrdVOT/tj8UMEW95/sHLCXpwvAl5J
         B1Kc9FTR0b4G50oh+LDAyd+KAwxz8tsdWGFXoE0ANo/9PxCsDG+GlV+534PHlLLkKR07
         aecQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGIBYFdH7GMk94uSUmaZkVbRqqoNtDyM5Pr43J94lggWUQ46xKWBHHEOh39MdPyFGQCpTO46jgJg5bw58k@vger.kernel.org, AJvYcCW0b4MWUqRrID2jzB+JzB3M+l+Y+ALpdR2g4GBJICxMrfgBGNJV7ha9g9JAC/U47+Z1g9uHHDvce7GN@vger.kernel.org, AJvYcCX6+1FLqlPGViyWF6vRik/+qyKhv9fJOwbRjMLIuqWk3YZHFzsmTk6flOsY++WW7UknoWOMxG6JC2HntF6nZwI3gUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy6X3MmVpd+B+ajXFeUCJ0VlI7YXTo7IZKQt6ImTAVWJeo691D
	qF41ko5ipOeK44N2jOu+pTlTWvTB0s3Dg4/0qSIaQyUaFtANY7prF552dqgq
X-Google-Smtp-Source: AGHT+IGyighw6No7L96K8frTmLaNWWTGSBdL6kHmKHLPilAjCIR10vBLGUnUuLxcVde7xiqCqPSHAw==
X-Received: by 2002:a05:690c:3582:b0:632:77ca:dafd with SMTP id 00721157ae682-6d276404ademr24911117b3.10.1724927013403;
        Thu, 29 Aug 2024 03:23:33 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d5ea6909sm1807707b3.131.2024.08.29.03.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:23:33 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ca1d6f549eso5915257b3.0;
        Thu, 29 Aug 2024 03:23:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3rDKJdOiHuU7Xjg4l96MuAnlsmPQhRpQVRVbikWNN35b+pZWS3x5Wk0/HRLzvr1r3piMVkFjCOYF6@vger.kernel.org, AJvYcCWQdK6UQIhCAQWSDE1vg7myyX5XLDf0QF9ReHGeh9LHWKq3OcFJiCRwGdkhO3ZJQCx1guvU5RLtsYXm069s@vger.kernel.org, AJvYcCWas0owmq0iyxTBnUNt3lNnOr3AvJPN1e1TwpQXh4kh20R7/Xo4fA3AOcL6CB7fhtMSM0VJqkjYJmg3rsCOkjKgog0=@vger.kernel.org
X-Received: by 2002:a05:690c:fd6:b0:64b:52e8:4ae3 with SMTP id
 00721157ae682-6d275e337f4mr26567347b3.3.1724927012999; Thu, 29 Aug 2024
 03:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240828124134.188864-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828124134.188864-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 12:23:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUP69GUWqs93Nbh7CyEgub3G8EXXX9EnHwwSi=i19kJnw@mail.gmail.com>
Message-ID: <CAMuHMdUP69GUWqs93Nbh7CyEgub3G8EXXX9EnHwwSi=i19kJnw@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] arm64: dts: renesas: r9a09g057: Add OSTM0-OSTM7 nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add OSTM0-OSTM7 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - Used hexadecimal values for clocks and resets
> - Sorted nodes based on nodes index

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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

