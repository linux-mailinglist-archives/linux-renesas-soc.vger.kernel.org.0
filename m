Return-Path: <linux-renesas-soc+bounces-11720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2D19FD534
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 15:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36C0F7A10FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Dec 2024 14:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DD31F1309;
	Fri, 27 Dec 2024 14:33:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820CE320B;
	Fri, 27 Dec 2024 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735310017; cv=none; b=fpOJbuoPGpdNs1UWtG/cn7KhD1k8c+Gq7f4o/Abuy+RSOTDXVQdvKbODZ6zQO6iysML5H9HPKTGtqZrVbL48OmYBcqbiMgm7oCifD9KSqrWdj96xDhXI3l8LN5dReXypfzlzowKLopGmCtnB2qvPQqKtDzniaI7FqzApwnbzDds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735310017; c=relaxed/simple;
	bh=2KCgWDs+lh2toHZyOBYzBQFvJoQWFXH0um2X4ax9m/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvd9eThIQOEhq7trG0x65s/4cwzbjiGhAQQQeD47MKdm1NiL09SIYbtz4QA2z/vjTqhM0olYZ+10n8KwoZhlZAaOg/zFg/92rnV+MCkrFh+6rCPZKM2mRdSZb4QB/nB3AYKIjJio/vkcVGzh4QD3YAo7IGz4VbtA5mhK0rfGCAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d8f916b40bso99031586d6.3;
        Fri, 27 Dec 2024 06:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735310014; x=1735914814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pV+ixgcLTpXwx8I8b4yJ+1KuFH/7+8KtkK1o0490Dc4=;
        b=C+2FiG2PNQUxkgkjzdXgz+fi0FdYd4ezyKmaU4/szBoBoPDJm1G8PTCJHGL934ptXq
         3LxISjiz4D9sW6yXZ/E5Gc3txGie55b5DFdhqG6c0MNgWF1DkfuwesyrUxGWImnDJ9O/
         4Ohe8kCw2oZr7Ewfu76DEFxHs8uTtZepo7/19BRnqkNluIcPKNQNlb4QrRN0AC3KJoTf
         pYmzTwTirEh+sf9hI3a2R1tpstmjK14k4sH7o8XEvsJCt6k1JtUIscRyxE3v0LD9TjqC
         vUdeiKKRI25xL527WsHD1tBau0d6HosGEjJLsNdpbxBxX/dMhV0RunBfO8KWwNMK5CcC
         2jhg==
X-Forwarded-Encrypted: i=1; AJvYcCXEo7rW8MZAXzKdhm9bSqYXMQF2j5RqWHKPWktDmGYTtcusgIE0u0wOkGohhG2JhTbOqOZfHDrdLJQ=@vger.kernel.org, AJvYcCXHI4cD+PoGlLhfsbYqNdAGN8xW6dsa4oIIJ74yD0QlTtOCmy0XeLdHdGJjimnUItLA+WrxtLIGObG1CoNfKRtksQM=@vger.kernel.org, AJvYcCXQJXY9Hl3ZpX0VqdU6srbTeC/HoVcRP3iNoDxM51sw264S3wSs4AkEm4IYatkd6olrMCm+tOdEXwv1nQAs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4YrcQuCmOxBeV5Ir6uys8bhfF5qlD+tqNXex7i5BUkx0S6nfx
	Hc+DnjcZqq1wUFAoLGwC6Ys7Cz9zRMQxN7UrZTMhbIcsTOmFfUK0p3E+R0MD
X-Gm-Gg: ASbGnctW+KI7sgkaNlI3V7AZbxD2irxEV1RlCXd0Uf/tiTPSUs8IFDo84HWo3vHGLSE
	pJR9WbOYeoIO+7lZByXFQ4FV0YQClYc336psN1sn9Q74T5rBYKXu6FbHf7iOmd2I9hlOhLpMK7s
	6ZzLoaEQyBCBPC1W0Y+p4q+Y3GI3CVYKvUH+w9t7eLwW3+upueim5LbeV1pJ2wGcln0r2d3vNeX
	QESNd4VTi69RYIv5dSgDA5t9THQcV6EJGV1/xnt1xVwOpZDyborml2ShcNHqNTgCynMkxRztxtQ
	sO7fOfel2CB0N5X7bgc=
X-Google-Smtp-Source: AGHT+IH780I//K5GyrRuvPEre3LLeoA/+R9x46eV4jyYUrHNj7E4S722c1O7+EjWTLEOYZcMrhiEvg==
X-Received: by 2002:a05:6214:1c43:b0:6d8:8d16:7cf3 with SMTP id 6a1803df08f44-6dd233a10f5mr454668106d6.40.1735310014203;
        Fri, 27 Dec 2024 06:33:34 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd180eaaa8sm78486686d6.1.2024.12.27.06.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 06:33:33 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d8f916b40bso99031486d6.3;
        Fri, 27 Dec 2024 06:33:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNHcZSHPpE3D6QeJmgFS53eZqJzB/lRIpvbgrRN1jwnjo+Wh23XMZYZf3GjvQimioY04KcYyTcCRU=@vger.kernel.org, AJvYcCVfYeb7FCEx7loGV52YGhTyY6pnU1iB3PuU8FQ+Zw9pWPDdxnVxycpbvPjzZVHYW0TzgWFlTA6c6za6Yb/P@vger.kernel.org, AJvYcCW6Uye8V0yk+JMc+dGhjxO/SU9F5Z13BBgTMQu+8wSrSs7yqzyQVgmAwSLHYiBhoeBEFfofYqVYVT3b16evMAQWTMs=@vger.kernel.org
X-Received: by 2002:ad4:5cca:0:b0:6d3:b636:eccc with SMTP id
 6a1803df08f44-6dd233545a7mr392501196d6.21.1735310013650; Fri, 27 Dec 2024
 06:33:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241223173708.384108-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241223173708.384108-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Dec 2024 15:33:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfcqHVkJ3ea=uN7zGAw=ho=gLGVJjFFB_O82C-RTU11Q@mail.gmail.com>
Message-ID: <CAMuHMdVfcqHVkJ3ea=uN7zGAw=ho=gLGVJjFFB_O82C-RTU11Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP macros and
 field extraction
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Dec 23, 2024 at 6:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Replace manual bit manipulation in `BUS_MSTOP` with `FIELD_PREP_CONST` an=
d
> `FIELD_GET` macros for better clarity and maintainability. Introduce
> explicit masks (`BUS_MSTOP_IDX_MASK`, `BUS_MSTOP_BITS_MASK`) to improve
> readability.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -582,8 +582,8 @@ static struct rzv2h_mstop
>         if (!mstop)
>                 return NULL;
>
> -       mstop->idx =3D (mstop_data >> 16) & 0xffff;
> -       mstop->mask =3D mstop_data & 0xffff;
> +       mstop->idx =3D FIELD_GET(BUS_MSTOP_IDX_MASK, (mstop_data));
> +       mstop->mask =3D FIELD_GET(BUS_MSTOP_BITS_MASK, (mstop_data));

Nit: no need for the parentheses around mstop_data.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

