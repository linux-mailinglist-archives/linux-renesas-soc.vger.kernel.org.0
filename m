Return-Path: <linux-renesas-soc+bounces-14453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EEEA64775
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 10:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEDD91887EE0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 09:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C431991BB;
	Mon, 17 Mar 2025 09:30:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2544418C03D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203845; cv=none; b=kK3BKJUOTQS1oy/JDFHBJ/pQAPyTuqO+qY+bdSA+RYcmSW7Hbxql/SqqoC1zzjBWUFXEHokZ7KQV8UEKwXZ9WiZyJlhFJRlqbxEICpFkU526EY++IY2GPdsOeRx2mEBXDOY55Nhws/co+SDaLZovFVXUNKvk+coXUaHDwCag4uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203845; c=relaxed/simple;
	bh=Ro72JhJyxE3G0ygDnIHoEzG59ugbOervSgAFRmW9T7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6yELb17QjL4FtMTZCrDJ54cMrEHFkdXJcEZ04QiPwcXqMwTIS9CmMngV9GI4eSjtiyBBFQhmwbCUN7yTteFgwtZzTD+o+Ue3dvHY2erAxVXlxaKiD9uT+IQIDo4xN4fHV1ODk7AUB7mrOYYlxWFtZ9UMtIjgViL0nvx65iZSZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523dc190f95so1962493e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 02:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203841; x=1742808641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO+8ygNTKCIQIyKWLVf7vwwm+ioBOh0zCOnmpBG5osY=;
        b=vjXCMcdcZ34SwLCpHWorqVWUU9L+lgThKSULR4tQvWRX1+3toK+nkcYKwSneVdhtKF
         kbCUmRsdUDcW5zrjp2BXE3p1n1TCliyOZCPLDwOaE8+PjBCO4xWi3byOfaTEWw8qV7Bv
         bkjpdKGxiGnM/yWRWYSVzNPumHQyaAYIH+yU10zqTaN4a4+3kBh0VxABJm3OQjy9wisw
         36kSe8HP2BqrUal6abO5g1P5e3g46jbHtlxthIjbZIjmCWEi9KlPEQGiiwI9XyUxV0I0
         rQmC9xnjIqxgZDVPDR81OnIlRvOLUOdiRnu5y9iFBto6Am8JmWYXih6ePAKScNQqAyY2
         p4LA==
X-Forwarded-Encrypted: i=1; AJvYcCXym61UquSSeM7OCGmRCnh15SwHMC+WRjWrrmypOXq6QFcHbRMBKkH1qFQuXh0vreUcwOW45rJZCV8+29NdV6tKMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJs7cj6MmvxVDw9zxYUBQiLG0k9SjkP7tihmOAD5zMvz0J22VW
	Uwrl8AzgQSI5X4vp9pOKwf/HS5lgDBiuaTaOTt6MJl6cvDltjAz1e+uXBVlL
X-Gm-Gg: ASbGncu2957qCrYdS9io9vl606gc6jCBq3TbtXcEVQrvIpE/+1nMu8/6R2vE8QHZARN
	n7LLpeJDYPu2tzYhW6IxJDfec4Jkr6H3T/w4BumpgNP7o7agnCnkoG/0SM0x6KzMRpahzGt4Dai
	OwGq7QxY3v3rZ7NwJ2k+Ha1LTnsCRL1foIDbresOrxvthaORZfOtsVGl5f6ilaZDqh0yhywAj81
	7s+qTL7+2h5A8iE1VZwsCkJlpuJAFs3fiRDtdcE12ZsfQuFUYKuoEv0R2XEHbNgrfMkmHMSdSUs
	3B9BUiIeWVDVOly05DOL/fCDrIdQGtyYKZZHALAs0wkfPxvKcHkuafMR53TA9j3DKHb/SqxJA9F
	b+YpkIoKTVmE=
X-Google-Smtp-Source: AGHT+IG05KKNqcyoyefoPxd0j2sfBA7foEKUEWKuWqOlvPvubmZB+cAlM+2cDuTXoUgKyc24SrozAA==
X-Received: by 2002:a05:6102:3c96:b0:4bb:e2a1:183e with SMTP id ada2fe7eead31-4c3831f637bmr7581368137.18.1742203841433;
        Mon, 17 Mar 2025 02:30:41 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90e8c339sm1603174241.31.2025.03.17.02.30.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 02:30:41 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523b7013dc8so1722345e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 02:30:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpy7PcD0jrV5PgnD6YcxQaPA39kh2ZZ3UVXulhTTgDclRERudL0+ECCtrqI573vUIx0xXBNYzOIV56BazKg60uDA==@vger.kernel.org
X-Received: by 2002:a05:6102:3054:b0:4c1:a395:c57b with SMTP id
 ada2fe7eead31-4c38322a2b6mr7410200137.24.1742203840941; Mon, 17 Mar 2025
 02:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be>
In-Reply-To: <3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 10:30:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVPcDZsMsjc8WdVC7vnt_BPVNwiXyB+AEzO04f2eq5cmg@mail.gmail.com>
X-Gm-Features: AQ5f1JrYGHnVLahgA4qk6HO6NQ4eGzBN5PdOXMYhEYNuD-wyDKiqL3N1q7ViLb0
Message-ID: <CAMuHMdVPcDZsMsjc8WdVC7vnt_BPVNwiXyB+AEzO04f2eq5cmg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f4: Add UFS tuning parameters
 in E-FUSE
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 14:35, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Describe the location in the E-FUSE block of the PLL and AFE tuning
> parameters for the Universal Flash Storage controller.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

