Return-Path: <linux-renesas-soc+bounces-25285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 845D6C8F491
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E2D683474FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 15:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0C03375DC;
	Thu, 27 Nov 2025 15:31:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6BC335BB2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 15:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764257484; cv=none; b=EmwaaQQnf2GvsX8ElF0HSxOY48/yXIOoo3mF29XrLKda9qQy5lBDRy4yYirfnCpiPp7fDgwl4dJE+FTMYvKc0XtbnhbtaIHMtC7oFPihRlmI6FFEmp+ejZCDpDqNN88CeypnBMQVSfrTy11XZXy1iPWnmPu4pc/y08vT/kvPE10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764257484; c=relaxed/simple;
	bh=0Ms3nh6UST62nZ5f2gQbl1TP9z1Cw0CPLTAwI1ISOn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVZ5pH+jrroGh/AUHdEnBJY6Sxb/G6Iri1rM46UeFWlIWC6jUzFtMUNpumd4OApZoxfS/1IVC9Y6jc24H0y+KNcaF8boeXxsLAz/GWzAayGPg0ettvdw15mHrUvnMVlqby+PPt9lyS4p6uAZ2Of7mFhP5BlgGk7io++5AFYIU98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-55ad466ad1eso299450e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 07:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764257482; x=1764862282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMGm1buzaIw6yaiLwd7+ag/+onuunyVRgfQz7fJY0H8=;
        b=Ll9/ysDlIftkyEy4m7jpC+YwqGlEoV6aAmnQ3FsedLi2fy1FeivA3v7ql+LJsfxEOo
         CWyHWc6CDWhOfovsZfW+uz1GubsQsJgKjy/wEeTicYu/Cyd/VQS7TXekUtg65mV6EA6p
         TgD5NiEY7Ky7j4yDNa2QrAQziD1R17YlGSgZ25dGcFHZYC9JUCSTZk0XudAnt+zgESVE
         3KEi+loXr7yTH5pi5BwbSMp6ZLxX98rsIabMRV4Xfm7xCHgTQloxDa2meO9jTG8CgZhf
         P1HmaEDU0e8TMTzQkpYoivteF8uf0eDJQO1URXHK6tQ42kqSQxKhEwbzEZRn/1brp2oj
         EiYg==
X-Forwarded-Encrypted: i=1; AJvYcCXJZPYIecrl1gjtzkpLOylxWGaaFdu2K3DwCGDngHe0quhpgOWfgcjjp2fYOxntF8ymyXwNmwH4niseD1gAaLvcVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOXTepdl14yxJDw0AQXltW/+wwDbai93JASyXLbskz3nLa2k7d
	Y6GCHOLbeCOdsu6jb+V4Pli/xRyiUDHVIqZnFUC/XtgYP8BeYnJDywAg2FYEDqYb
X-Gm-Gg: ASbGncvbovMnaR5b9Ntce0RkqgdPiyUfqNuB2vX+er3IzzTsm1NBfH90kRY1kUAjqXN
	qetmDXWTrOxLQ6iAhqpXmq1lJSTiMf+W2YlirwI53vi6W7tNLbi86fCX4EM+sGvHAFUz4/aC4m8
	BwhIHSFFzs6g8nB0IJenPHrCmZYYQD87UjfmlpoCFYkwOsYtPJkdihJWwKEVLNJhBIjY56KTkAV
	hZWS3oRahByJpJtsylpdSDdPEnIXnWwQUt374i147pbfhdPauNdhCHmWIKDVZ/TZ81tGkxpMvr0
	3rnZRijhgkxjMQX9MN5T91+EudaTlngUkaXDMCL2OVQS46GTcoQIPh41AMTHbPi0wB7FU4xZanG
	j5fDX58G0X1uNX+hSWjCMm6wkPDp3xqr3zLivFtDzw815rPSzIJLHqJL28y91VAIHOu3mfEJIeV
	nHf/OCyxvDdrTidSx+iprZy4HpIayPU4O3JkaoAJVI9RzcIj0B2teWOZ4HGXRzXCY=
X-Google-Smtp-Source: AGHT+IF9Affq3A3hyKvfMmk2vDaSA7A0i8sHgMPBcKCBdIWE4seMyKUkXHAoaK8Cv11HkjPDjJI7/w==
X-Received: by 2002:a05:6122:2086:b0:54b:d7b6:2eee with SMTP id 71dfb90a1353d-55cd77683afmr3567866e0c.11.1764257481648;
        Thu, 27 Nov 2025 07:31:21 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf4e44a4esm703076e0c.6.2025.11.27.07.31.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 07:31:20 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-559934e34bcso284633e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 07:31:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWb7zI9s5YkMpcSWCBXQK9YOwCDSlRGkbfHrHdAO+0jwJSanrHGwjJs/UlsLP72/DE7L55QgIsMn/m7Nj/o0GXAEQ==@vger.kernel.org
X-Received: by 2002:a05:6102:943:b0:5e1:ef48:271f with SMTP id
 ada2fe7eead31-5e2243b0ae6mr3428187137.24.1764257479536; Thu, 27 Nov 2025
 07:31:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119143523.977085-1-claudiu.beznea.uj@bp.renesas.com>
 <20251119143523.977085-5-claudiu.beznea.uj@bp.renesas.com> <6hvsrtdxpm2ywwk7whaala3ynfdy4lo76epigxvn345ymormqf@bp3au24dwwud>
In-Reply-To: <6hvsrtdxpm2ywwk7whaala3ynfdy4lo76epigxvn345ymormqf@bp3au24dwwud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 16:31:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgWcEFa+=XEQRTM4ZiJCBJnv6f8FD6CyKuO7cnB2QQcw@mail.gmail.com>
X-Gm-Features: AWmQ_bmuHs8omtOnus2gS0alfoG90XbZ5XLzzwu1zc-9nISSqEQTG2vuN7RDHuI
Message-ID: <CAMuHMdVgWcEFa+=XEQRTM4ZiJCBJnv6f8FD6CyKuO7cnB2QQcw@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] arm64: dts: renesas: rzg3s-smarc-som: Add PCIe
 reference clock
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 06:54, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Wed, Nov 19, 2025 at 04:35:21PM +0200, Claudiu wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Versa3 clock generator available on RZ/G3S SMARC Module provides the
> > reference clock for SoC PCIe interface. Update the device tree to reflect
> > this connection.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>

Thx, will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

