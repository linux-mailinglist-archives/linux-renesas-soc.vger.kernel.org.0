Return-Path: <linux-renesas-soc+bounces-17460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD2DAC266A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 17:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF244189BE66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 15:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C769D2206B1;
	Fri, 23 May 2025 15:27:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358B1207DFD;
	Fri, 23 May 2025 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748014022; cv=none; b=JdoFSKVej8ch7qfzPl4Wg1pQqDw3zgQKfGTnh6qlVU5roU+No1fiPHioNqNdPN1Mv/j3Co4fLaY+YkAwehBtVEO9x0uatlDrU7Ui3SW2I8triIwF2ILVT9w0If+wQA6cDFfpSE7ZBm+lu1IEuWJyNaMUwfa2RySwitXEFDz18+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748014022; c=relaxed/simple;
	bh=PYunuzs3oJy/N2+82erHr2vRNwackk1nSZPaDtV12Y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zr/b7/VIwKe9SwGr7qRCNvR4Z8RvzWBFg4h39vnAb2rKC/JxgckFf4Ma7FqN3xfbLCzdtQ+0XHeVVmekxIjaBO/2udtHxbY3hKNURk/ghDiUbVdA/bur1c2WrfzlpsciQRHJfTgeaQjODHr4B0VTmEZfl/HZoyJ0bhhMQ5W/dd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c54f67db99so108817585a.1;
        Fri, 23 May 2025 08:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748014019; x=1748618819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/mFreN/N8gKGzXkzRAExzIbBGUdEjq8ge84vdymmY8=;
        b=hqFX9/67YgcgABY0+4pxbplXeDfh8YdEhwl9iO4GjafAhcxnwx/rSNN6/nfAlEP4sE
         5fvRgtqVuy+GlY/ch1SC2XgTRNjtu+/4szstaGiHk7VuW92Cyitr2iAqU8oplU6dzPdQ
         ak40CwxnP73N7KHjcSJTNTmqCl56mFGf3nGU/CiTwcA1qoqfEpfjn3xvEv5RI9bWadaA
         quYlpLLRnfuhBJhSh2hONW3XvnldYKHDyrD956eVACdkEEHbxnD8CUN/kNNeDH1HH95i
         WOagyNrXnRnrqGlDykp9cUq7H2sVDmiCY9X1ubW4gZNBiBZu3nbnobs9wjDfjHzXPm8L
         uHFw==
X-Forwarded-Encrypted: i=1; AJvYcCUbcjyCFh6K76Hvn7LS5B+oay57W//vOC6rh9e81SmhMp7UeMhKbOPa+TprKWegE9bKYfD5Xzja0yK9@vger.kernel.org, AJvYcCW7xgnig3OZ4x9Vi3CyI0TKYBa/xYOCMRW7LhXHkffphO8w5pVIljwFXlFVQjGH9AlFMEppeVSfkl2S0VUh@vger.kernel.org, AJvYcCWXlEj8CKJI+brwWtTqOhmCvyeNOiqnCk0218/UqIatdVvpYk1Bo4KAynBRrmSJ9UlVncvKXKbJjYHfbzo+@vger.kernel.org, AJvYcCWaK6uLOfaN5eawoXrGHzkjGEiiJ9d+yJ5yBPNLDg9e0aOx6xRA/1VwIjKsc36/emzv/6ihYSiUzysjik+p3R4s7NE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMdj1mgxqYFZ0KQhPbo2gQ+U29w0PBpnJh0cAIWeMt4pLGrNt
	J6tXvTTdaYCwQfX9AlE2R+M2cyC/VYj9XHv/BZY0XO8IwNAe6ZUyaE7Ftda13aYxgx4=
X-Gm-Gg: ASbGnctTOnhA40j+rjV2uKC72zuM8iEH/g2ovV0qnYNCSdGjoYXvrWN7xgn8IEKOixq
	FqXWBzZH8EGOeqRlPjpCSAkW/H15C+w4he4HWkleJIDvWYhglgy7sfywoYVWW3uvMmXyEXkjQt/
	mjo4MdAU/mgBi00rK7oW+mloouv6+P8bhtrGMK584wFO3QxhjbiwgfHQE67Dnyqv1XeMWBoTUDa
	/NMnrUVifoVZrQwKoklDEX9eoZ/xxalaR3bBpJoCh35cZsXWu+t7kgg5wUgrmg8I/h/M2GRDe0f
	fbIhqc30RZhOgghudcvq8fX1dlL4Kp3ST7yxXg8xvm0oatTyoaZaN1B0crgODVi5+/aKegiyKyl
	5JhnqUhZQ2+g1TA==
X-Google-Smtp-Source: AGHT+IFlfGZ3CuMnppifHGnoF8jwnh1TLtoICgDNGuigyodwUehM//Y3Ye4uYztryrokWHqgbW+Osw==
X-Received: by 2002:a05:620a:44d2:b0:7ca:ef8d:d358 with SMTP id af79cd13be357-7cee228bcb8mr519891985a.18.1748014019106;
        Fri, 23 May 2025 08:26:59 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467edc16sm1190690885a.50.2025.05.23.08.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 08:26:58 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so848526d6.1;
        Fri, 23 May 2025 08:26:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVI74ZE0+DG/CaH48fFsAPqS2zczW7VRI2+mEPoiKG17AZiOYdSiA3+Dhm5Difsfazwo2Zn0LXxOi48@vger.kernel.org, AJvYcCVg+nZuHfmCyEOE1lqGSEVWOhQJgekaeHTY1VL4EjUqCR00gIyv6wjCUDo40opo34B/6rH4sonAYxg1qQGp@vger.kernel.org, AJvYcCXEPvVh+iY49n4D67w7WO8sixE7EATGYAwfbvmgk/UajlrKiQMC4CRI+uGG1IXc6LWFrAKKx/nu5Pn5s1N6SyaqDug=@vger.kernel.org, AJvYcCXLAq9IuJdTRTg/IkqKMM3h9gjGwOLmgSS3NkEQxjfVvkl6IclJiUi7F2qidyJQLySZfgJFJUB7XUG3BzTW@vger.kernel.org
X-Received: by 2002:a05:6214:194f:b0:6f8:c773:26e with SMTP id
 6a1803df08f44-6fa935de959mr56751126d6.18.1748014018481; Fri, 23 May 2025
 08:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com> <20250523142417.2840797-2-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250523142417.2840797-2-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 17:26:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUwqYK6V1+F+aMJCnMLh0Y6SRVAW8cNVoMDxLsAOXKyw@mail.gmail.com>
X-Gm-Features: AX0GCFu62-GdW3-iaPeMH_SSfSV5cKa0GeyZsatptNE6HFBLm2EpBfJshpDfulA
Message-ID: <CAMuHMdVUwqYK6V1+F+aMJCnMLh0Y6SRVAW8cNVoMDxLsAOXKyw@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 May 2025 at 16:24, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> At boot, the default clock is the PCLKM core clock (synchronous
> clock, which is enabled by the bootloader).
> For different baudrates, the asynchronous clock input must be used.
> Clock selection is made by an internal register of RCSI.
>
> Add the optional "sck", external clock input.
>
> Also remove the unneeded serial0 alias from the dts example.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v9->v10:
>  - mention sck in description
>  - no maxItems on clock-names
>  - fixed the #include dependency in dts example

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

