Return-Path: <linux-renesas-soc+bounces-14374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA62CA61225
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 14:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13044881379
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 13:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD471FF1CA;
	Fri, 14 Mar 2025 13:11:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564A72B9A6;
	Fri, 14 Mar 2025 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741957911; cv=none; b=LTnsOxaquzFaJqz/Fht2qlL2azLYAJJQj7zl1kn+fO9Ac2WPhEiyR6n6vnx1i7hvjkUOSTTFrQH2C6iPuTTtCZVHi167SFmaW7fl7Kzgx7gNXA/n4ItSptukL8NVzriXT1ak4E/ZD0lQDlIY7VxIbYPTmWy9hoj4KTufkUTkZOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741957911; c=relaxed/simple;
	bh=jlB3awKoBtFB8i0dVKg6cQ2zi6jFJqZhRoBiXu0ubLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uxc+oB+0g2Zjy7sKBFEfKIMin84F23s8/5FW/jO6O4h/dxju1x9el0zYfDwHEJraQ9jrW7HdtLl+ob4ShhvqrA4GG0ekKB4lIdamQJJTceIqlw005vb6D53tY2VG4WilPFtZw1xkJj5OSipaYtZShvVgHkOAkMFsphPX9MIT8Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c54b651310so274713385a.0;
        Fri, 14 Mar 2025 06:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741957907; x=1742562707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fww0vPXlCmXcp9Sw0N33PH3ZtqipXPpykvgqAr2AHE=;
        b=NTARUF320rbHH0sn0ztlriFcV8ikefcEplm36G4yoA6g8M9PcFeSSjwvSYVxeBduRC
         axicCXVsBtj+QoyOy6+V9Qv/LZNkOVRVVClvPp0ll0e3agwTSR8EVmbNlNE2UTX5I/au
         1ghQY5EepIQ8hufOIV55rHn2ijdc/kkpLgOUSumxNDnjBxuemVIpjFjsEOcmWZGmAALd
         RWgkJyNBGD8qzzK/Y8CWpj8c5vT4S8mRekAtGAfBXeMhSaj5DGFi6odu8amv7NItFYk+
         4PsfOS6CYq5yGntmC0l8XpS7vLy4se/poVtWY49hF5/YkVd2nHvAzcq+tsqz8GH+lTDb
         wsLg==
X-Forwarded-Encrypted: i=1; AJvYcCU5FUDCPgymuRtUyuEDmxiYXR0xMv1O2JdbnbHPf/ko7RLRJNZj6o5K9XbuqV/ncRo2Rr79iHA/L0tEwnZhmBuac1Q=@vger.kernel.org, AJvYcCVKxMOw2YW7WgeO9yU4lMfSihBbj2Q9yf4krKATYY3i0aGj+Hgn0S8Vr5Izg+PAYZl1KPa6Yy/cL+0=@vger.kernel.org, AJvYcCXHC0m/8b/3c92XFM0d/8p5byeU+8ACZ+K++Iss/ed61cxz948/vChbyMVdLvbICG3yMvgecQSwAI5KfPwb@vger.kernel.org
X-Gm-Message-State: AOJu0YzcOXJxv/d5jDRb7TZmah7rz0iKtLGln0xMdsw/D8zLAZu5x8rv
	yL688lpDgnUtuvA5aHWUKQ32HXX27ic3KBrDVD+G4fkGh6wRwM9bcVwwXhtheK0=
X-Gm-Gg: ASbGncvSm1j3i/MJqSGpfDK18YebFw7Sd7LaIPME05mO/sZcyt3saNhnaJMFf0Eoiye
	tvax4fwPa7iLwGEtzNKiQMkK5lGZPoTDyhavODRgaB3rjZIsNldofPpEsr4YK5t1WhULUZFiNi2
	oPhBuOY5sQgktdqjgzL/YKUxPTE+l6Y1F5xenfl1NmwJjK+8Y/cqYr/CnIvhsz/JpKSGLCde6aZ
	av2EfPya8wH/BoYIWl1cOkLpgqIn5IR1vcicAhWnRiO3ssoTxNfnNxmbavk+sDh9mxWj7rsBJOt
	vjx3qccaTas/ZoAS35y6CRlapimxpRFpJHJ/FzFAo48cKyPOreGelEBdQpyNT9AayvyDsu8/ubD
	OXvt2kAE=
X-Google-Smtp-Source: AGHT+IFpULjmL7Wf0aVBK1xq5vOPvaeWovaDSDY8HxGnV25xfUniFkmljxQpinyzsa/YZDgtHqo48Q==
X-Received: by 2002:a05:620a:8003:b0:7c5:497f:100a with SMTP id af79cd13be357-7c57c8f8f75mr338977785a.35.1741957907294;
        Fri, 14 Mar 2025 06:11:47 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c7842fsm249338885a.42.2025.03.14.06.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 06:11:46 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso30892206d6.0;
        Fri, 14 Mar 2025 06:11:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxSefWElqXkXZEZ/QssgiNAh55n2dMX5UTYKKevMvCgh7myaznacdqFerDtmK6yibmMKfDXm8O0bje2wBz@vger.kernel.org, AJvYcCVBuIswwDbKSvDEhCA51xiA1qJwUDJSvt99C8wCAp5Via+4l7Zw/0kqYYgdnxPOBnKWGtK5tSDC0g0=@vger.kernel.org, AJvYcCWE4UYjVWEn5eSHgPQ+N8dkNLUIBAVovuoAmVhR8jy178WCOCBDDG32fucl3NELVXQ6vgGzI42VX03UV0AGmfHrfjE=@vger.kernel.org
X-Received: by 2002:a05:6214:230e:b0:6d8:9be9:7d57 with SMTP id
 6a1803df08f44-6eaeaaf7c69mr33575096d6.37.1741957906380; Fri, 14 Mar 2025
 06:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250309211402.80886-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250309211402.80886-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 14:11:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-52oUZiUbQsHW8qyiWXKHpk4QaKREm=GanCseDnDL8A@mail.gmail.com>
X-Gm-Features: AQ5f1Jq4oEjCB_wwjo-GyQaHWJhVIdp1_YQhDCzUuEqSPkuSsoN7UB7uDpvY86c
Message-ID: <CAMuHMdW-52oUZiUbQsHW8qyiWXKHpk4QaKREm=GanCseDnDL8A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: renesas: r9a09g057: Add clock and reset
 entries for GE3D
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Mar 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add PLLGPU along with the necessary clock and reset entries for GE3D.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Dropped reviewed tag from Geert as PLLGPU macro was added

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

