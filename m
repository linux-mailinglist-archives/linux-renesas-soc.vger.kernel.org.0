Return-Path: <linux-renesas-soc+bounces-15135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB94A7642E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 750D43AA189
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD0C1953A1;
	Mon, 31 Mar 2025 10:28:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7274027726;
	Mon, 31 Mar 2025 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743416893; cv=none; b=K5k/nvAdwu4E+2Iqd9JcvEuVBr5hunqGnow8fX8ym6tQKZcBqO4SbdeCIzsZIk/gKsoAvs9yFG94sd0c+wNBR2pw4yKgyuHPv35Y336F6wktacy7bYIBwOlPx37hcgsU82XHt1S+hbzLglvP8C2OS2vljIyRG0AbNxHrqsiCAsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743416893; c=relaxed/simple;
	bh=mViXgd/VHtu0YiOx93owoulIL9nYxO8korIE4GXZ0wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TG7Ikk6CmE22Z+6NkZujZ1GGI6qq5cI0EzbxWKKolIfYtsjRJiepgBLyuzA9kuCmD0k+SAXVvRXyrRx3zsl6C6zF32PvjZDRB9pjd4v5XG3KXlrM5AHBVaKaAlNmWR/SxOOAn6/iImd6JE/rJGp+11KNfU+lZybpeDv7XSsxbq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523edc385caso1816517e0c.3;
        Mon, 31 Mar 2025 03:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743416890; x=1744021690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYquAzzFTNa4kboVbZDvrsL3+oLUsxybwUe/lX4xQqI=;
        b=AwwUjoWb+pUwngV4F985UUEH8M+1fmLj/kiXPRl0P723Awz42YL9Yp75iILE75pYx3
         MuVveag5+Qp1ORmFCHl2OIT9RAfO81vsbod8eDGkTE6h+JqvZ2s4HXDbNHHCAPNORtPs
         w3YSNyFR+OOkTojR1nDXiTV0S3cLwzxMFfr7z+MkzyyP1ymDbltyZOQWMpPbNs0PhE+t
         wjzLnlKa6djfHQzUvf7vusqXmXIiwY7lz/RmGRhSRojrzmrR0wsTF3vqUUn1aZcOlOGK
         G5fLDAUMs4ZIhOG8kdTxjMxvikqloJ/FqiEaeMhJ5A2nORpACvxlMDaGScz1KTEeOlJM
         f8eA==
X-Forwarded-Encrypted: i=1; AJvYcCU4wF7WGxXIWQt35Zad6qjyyY20HfT37R35uSqgnpVaozNiHPSGpB5yhMWPkj/0vwJWhvCiSHPTIeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpaTjKDc4nWqMVi5ITCH+5V6KF1x9Vy1cGqqMSPjCX06vK3lc4
	H8csInyj2R6L7dmW1sXqjC8eLhu/ghSo5tExLIddeVRCGLX8NgrpDacjCSfz
X-Gm-Gg: ASbGncup4nrxhsrKKRA6hvyzUDagZcJZBB9wROxiunl2KeFBVHweiiqhG65VEEe6cgb
	VIEAOb824F/XKikre+yDuEljgpMzTTGbyxidT7pcy6QJQr8C/Z9XFZDNtR8X7IDUIhQr0Rq8swF
	/Hc6xix+mGGLocXEy+Y+P//jqdo8SgeM6nlmCH8YIJ6tL1P3NQgdh1AGl66OobVMmDOAbOj+/5j
	rqY81pI2eJxdnCQjAxZ5YyZQBYsXx/pENKpXzWSIT3pdFDZ0QYadYhJBwKOXFiuX0rPxtZdEnoF
	/80QasEpGzrns+NQb11nv3X0FlS8USUQqfjHbQ55vSDRCivESZNk0g6CbCm2RI5kbbMcYmjfyLl
	MxqgRIpE=
X-Google-Smtp-Source: AGHT+IHhimeRAMVAGOHto9YzYrZb+9UDaNTg6dD1uuoA/+HFJOlxqJy/HAPpfiv9GY7d8+M/13cT1w==
X-Received: by 2002:a05:6122:130a:b0:526:483:95fd with SMTP id 71dfb90a1353d-5261d4ce0d1mr3614882e0c.10.1743416889785;
        Mon, 31 Mar 2025 03:28:09 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260e6a0d03sm1479518e0c.5.2025.03.31.03.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 03:28:09 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso1914019241.2;
        Mon, 31 Mar 2025 03:28:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJbKkxcLf4z6GFkzmPMXVTIyOs16bRI94HrRZU8ze1siMDwShM1f1V2rmR7UwWotnAyOfG9XBkrG0=@vger.kernel.org
X-Received: by 2002:a05:6102:2c02:b0:4c3:b0:46fd with SMTP id
 ada2fe7eead31-4c6d3985afemr4715582137.24.1743416889220; Mon, 31 Mar 2025
 03:28:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331064400.16677-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250331064400.16677-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 12:27:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoCMPAX5yKMRae_SNgh8fMMnQBZF6UOT_xLGb08ZJ9dQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoFJ7O8s-un9WRJ1Fxtbw0X4dB-8uH6Ub-2zYj1ljsCVI9lFVzzVfDqcNQ
Message-ID: <CAMuHMdUoCMPAX5yKMRae_SNgh8fMMnQBZF6UOT_xLGb08ZJ9dQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: improve registering irqs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 08:44, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The probe() function is convoluted enough, so merge sanity checks for
> number of irqs into one place. Also, change the error code for 'no irq'
> because ENXIO will not print a warning from the driver core.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

