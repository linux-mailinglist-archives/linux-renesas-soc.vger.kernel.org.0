Return-Path: <linux-renesas-soc+bounces-11161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321ED9EB4D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19D8A167C4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605281B422E;
	Tue, 10 Dec 2024 15:26:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5321A0BD1;
	Tue, 10 Dec 2024 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844409; cv=none; b=alMJUhoT3ik3nF1fcPhvwajpZ1VWisZfZ5ZnqyAwv+ohsdsxkBNVWTztcGpcJyJguhKUddGtV1Rp58qXPQfIRyNa/tfTIzF0DNDeEvoBhdDY/vQzXLu406MNScNedkung0w7P4sQC14ZKxGdOnnCIC3cJtqJwqqrf+y1Yt0W+e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844409; c=relaxed/simple;
	bh=3ZqMjL+6Tdn1tdvFNPTABTl20a7+fJjJaNn7mX7Rk0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfHyAYMS8k6JADGcm0qXAfhIv2c88GPshGEBG32sqQJ2Iv9t9b7sF8R3fAlcSnXK+pAni3rX1hKL6cmJyrbVQvaHbmLIvy1gP+RpXbfLqCIYCIgi4a7w2tK9iP3PC/YskJt/kP9XsHhdjdfX7M3x1xV7JNd/8HI6fU7PKcrTVr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d8e773ad77so31352406d6.2;
        Tue, 10 Dec 2024 07:26:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844404; x=1734449204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/51Xpip0bvwhxe0bHtn5CyXkx64XHH0EaeR3ajv+NY8=;
        b=Ig35jpV/vZnCjgeR9qLibnLgp3C3mzIeL3xMdiQUJc2iJG7v70EZNoB0AK43zZSf/B
         G8tXLN6HomCEca+Z83kJglBWSz1tIXOoYMXAFuzGLcGjOGmZO5AkIHxbt4mDwBpwL1sj
         qg+EdZHCr6XWQTGeNe97FdHRnJbJGbWqa8fsqnQ3Md4ctoCIuz0d2OaQ1V5k9TL7fIQf
         Jx5pcr7Nra+LH4Yr6bD/gbeB+OqZus0heiPmiUHpPW4Gw2xUhfAQM58ReBSRH8goZwlG
         V91YuO7PI/w1vAUA2JPAkXFsLmcgcPsu7nDYZJGxTKgNOLzKGBzVlgpPb2J/SGwNcye7
         m+ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUCcFnEI3+uQVGSCiWrf6hUl5YiKiGnqpPbn6E8giPF/WxUIrwVIQ8Tiq6+CluKHi0USe930Ys8ul9t@vger.kernel.org, AJvYcCWSAQXn6Fp4OKzpkE3UpLrKnnUjhO3oYejsd6i3tlF0EugV1VFatfDHJkiVknwUprZYVx8XUMYTRXTlJWqh@vger.kernel.org, AJvYcCWd9SFQZRaDhgxnRG9pIApCBYT9Hdow6Jmtm6+LSKD/rF7jmcVS+tfsMQJCYJ7qq7oWdWGK2ihXw0F4nG4AX7wZc88=@vger.kernel.org, AJvYcCWe/t8qzaYM/dv+HVOMD4dDiB1sDz7lPmjUXupfHOzfQo3QxUGMlKCjwhj8JHW1TnILfULNCF0QzYH6@vger.kernel.org
X-Gm-Message-State: AOJu0YwCEtMz7LzWVBRUGN5ZcOomAuokSZ6wfbn+4mSZ7cRnZQYAPiqE
	Q6AA0GgjRHc5Oba2We7ekPPFmj/qISkSqJwAwl7IdI9WcDlUI0nh4cEPZ9nx
X-Gm-Gg: ASbGncu7LOAptxtWEc5dCLImQtHnZpk5TqQVIo1sars2+Ix7PDxPz0S+M2NCOsuwmaS
	jsj+zZeniM3OfZNk5pU2mveSxbfIkFEQd6c7F6JDNgLIjopQWGQfFbrGPFGFQqShAGOivNCGvWz
	iyEhUQarFByqYkb/qOloueNFVX6O8rp19ICFcUJCxmo1C/YMdKoadZGXHvdy814fen9dL8Kn7m/
	oIXdeDugV6W9hJuGoVStJ8FzJpGH2r4dKTlsbnFN0x1Kk2BOxXyaspFluYPT2b1dZnMEzRO3FkS
	vEp7tbxNoaADmoF9Dey4
X-Google-Smtp-Source: AGHT+IHUemPng5WsXdABma2h8fuSlxKVcdQbIMryAdp9GTVXAY9YjvuddB280zKTzM7/UA3qRezcAg==
X-Received: by 2002:ad4:5e86:0:b0:6d8:9f61:de8c with SMTP id 6a1803df08f44-6d91e37dac1mr68042896d6.27.1733844404256;
        Tue, 10 Dec 2024 07:26:44 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d91e1080bbsm13155246d6.55.2024.12.10.07.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:26:43 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6d6fe8b16so182181685a.1;
        Tue, 10 Dec 2024 07:26:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1MEt0Gs7y0419e/hVAEw4CkLxK3DVQMCrMCavuXeU51NPc71NVQIA5fqll0mphifHxUNuPJ7JnzDd@vger.kernel.org, AJvYcCWnQzL7mXj8Df4mbOALuEGGHGMdfJBAtzsmmU2tArjz+goTsV4ts4D87df3vSsaFz05cSiH46uPoPV8d/j6@vger.kernel.org, AJvYcCXo5L894ymrm3cuPXTFjzhPjC+eIiq4wiZHks/QmLwZoDhnC0saIlrwvpWG2Nwdrv5mcll7Xt7C2yG9ftg7AKvoxeA=@vger.kernel.org, AJvYcCXogQZxDHM0Pe09IBj83830SBWYssLecPa6sWlPqhrbb/erjQFzXOuPyVvGMx7xSSmlG7ly2AQWp0Y3@vger.kernel.org
X-Received: by 2002:a05:620a:1aa4:b0:7b1:4f5c:6e86 with SMTP id
 af79cd13be357-7b6dce08f67mr713469785a.17.1733844403272; Tue, 10 Dec 2024
 07:26:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-12-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-12-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:26:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqBEL-12CVakOYqEgwBMeoe=dTy=2=z3WbQGpTWriMQQ@mail.gmail.com>
Message-ID: <CAMuHMdWqBEL-12CVakOYqEgwBMeoe=dTy=2=z3WbQGpTWriMQQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3S support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com, 
	christophe.jaillet@wanadoo.fr, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S USB PHY control block is similar with the one found on
> the Renesas RZ/G2L. Add documentation for it.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

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

