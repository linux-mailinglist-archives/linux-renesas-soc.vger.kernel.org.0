Return-Path: <linux-renesas-soc+bounces-14081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DECA54D3D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 245AB1889DE4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FC71547D8;
	Thu,  6 Mar 2025 14:14:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1843A154439;
	Thu,  6 Mar 2025 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741270447; cv=none; b=oKb/S6FBCBgg/3EJnKtS3OnXkBm8wSf2WPNxfH1Gz1ZVFVAp8aGnOsYnHd3RoaxEcZs8GKE+07ZEbNmS74QMhvjR04hhEGQgR2yNltHCUWOTjag5EsYXUaUqbX+Rezqy7AgiiVflDF096xaMlKfTuWkFf95LcxCg1wXUAUQtOsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741270447; c=relaxed/simple;
	bh=xlHSbET5JIFbNtf5aEAfaeaNCq4nZQQrgey03LXpfCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u70yDaGwwfs3lOoepfKB2zJM+W3Sf0jd7VWJHOwei+Yp9787CmT/NgivqMZuyzN4Y56RHefjC+zMG9ZCiU+p6Jk79W3tL/J2kwajlaWc/z5aY5JKkhJjYUAkXxsPhdJCZiFBPQZ12+Usiw5rGbfvbEuTUmWrEfT/8dbE7ZP2+EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abf4cebb04dso139699866b.0;
        Thu, 06 Mar 2025 06:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741270444; x=1741875244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2HQMqsTe4gAOQfaOTg7mW+7A8GGPnGFKWqrAjG3VAc=;
        b=YJbGNywW5o5XVzjGFPEIGp6yud8dc8YePRuSh+ZvmR9gOELSv23CBH/1ekLyuaRx5p
         Vpif2JkeTIN26/Is1tzgxN3s9rp1goRF1UEp7wfXtZX00dmvVnLCjGJN87cWF2CYb3lL
         5kzH89y9Kof+WesGHchbq/uYv7v8/Kzm1p+gwgPRRBIiapUWV7TWP7pCUTNfsbcWp3vE
         EMu0jGUDk4lL+DrRd831LVXEAMCY8PQcLu/rcKpSrpyIIGxWinU3AWIdDfi6BVKKfJ0/
         R0+Gms/fRSslgeFYrgsvrzo1FMkiDqpR/Dd1NgkDu1H1cR24ZpwKV2AEkb+nOaB/ACvV
         xjmA==
X-Forwarded-Encrypted: i=1; AJvYcCVbM062zR2h06MpRxgi8ZZz9j52057Od73XJ2eI7u2FXueuLWubs5hDQizxVaYkHERVqmcf3s6pyrcuokkFS7YVxZw=@vger.kernel.org, AJvYcCWwUkKMbLXn4ZkiuTAS51AlBdhq26D/ifngSmUHXKVqw+zpAB/tBdWNI+PFwBWeYteSfuzdxoAh3w9BJ8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBwqXFVyn3PQmLn6r+p9cCCxeiTVrrxMzHo4ebfX9uOZ/BQM+i
	h9pNQ/3bgGpYyQAvFR/xOVlZH06dxz0iypKvJ2Dj2l7hGPWEkDXFL2IHUJ82aZ8=
X-Gm-Gg: ASbGncsQPbLCB/kd/MI8GML3XrczY1pUrh1U6nzCycG5EMgzJUCXyjcDJ7PG5etzmRn
	0YJiJZ2MyfghdSFcItj+kLee2qu3Ruf8NxGgXlmyflvWfKwDUisWr8x96AZJQBjTYyXVo4FQ8O2
	aFntc6B9AihhSq8rDsB66yLWHNqAoh8AuRbv2Ltd1YjfW/XsaeKu6/hwv4RmnD0BnAb8qkNNMvX
	Oe2f4nCG1yaphi9t1W6GAhsN8RUrC6o05OINbIw5hpEZ8w9NeSlbu1fw9F/tuY0sFDZCocvmVFs
	+yVuX4usuGAdJM4fSecfUNCwLMFic+M8i9Hr0PcY5/PJ5nxtYXHbTF7+V5nXAC3vamCp2VEj17x
	JiygXxxo=
X-Google-Smtp-Source: AGHT+IG6kx8p/G994g6sRNB+avHr7qeEj0OdKtDRja6XwDNSr3k91joaIWT4cu8+Nx8edzFTGUHxOg==
X-Received: by 2002:a17:907:d86:b0:abf:23a7:fc6 with SMTP id a640c23a62f3a-ac22cba0d3cmr383934666b.16.1741270443256;
        Thu, 06 Mar 2025 06:14:03 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d79f4sm102591166b.176.2025.03.06.06.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:14:02 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abf4cebb04dso139692266b.0;
        Thu, 06 Mar 2025 06:14:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3Qv+s8FOttMF5mnsRjeY5QUBeG7judcVXhVNuRFSuo3duYmmIHrzOAlcceX0k8HJJugj4k57NRFOkpIfJ27ZuTgg=@vger.kernel.org, AJvYcCXHZ8Q1j6rUn0dRUGtaUMLWfuf+j/qPDjr5igt+2M+itZoKRESf71H6KpYw5entStLXC82K6IIST1yHhP8=@vger.kernel.org
X-Received: by 2002:a17:907:720e:b0:abf:5db4:9e6b with SMTP id
 a640c23a62f3a-ac22cb02a65mr434559266b.10.1741270441887; Thu, 06 Mar 2025
 06:14:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com> <20250226130935.3029927-5-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250226130935.3029927-5-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:13:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXBqzzgv6Kbo8QXp4bktZpeF-108mp3F278GMuNc41VA@mail.gmail.com>
X-Gm-Features: AQ5f1Jr3oPac8-GyECWK3I5c-gMYruPsEcmZvgBtUkn89zt8hmJo0JiKJ2_2fw8
Message-ID: <CAMuHMdXXBqzzgv6Kbo8QXp4bktZpeF-108mp3F278GMuNc41VA@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] soc: renesas: Add RZ/T2H (R9A09G077) config option
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 14:10, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add a configuration option for the RZ/T2H SoC.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
is still valid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

