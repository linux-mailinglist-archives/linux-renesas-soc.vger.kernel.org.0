Return-Path: <linux-renesas-soc+bounces-15741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CC9A84145
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 12:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20870460680
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 10:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F347B28135B;
	Thu, 10 Apr 2025 10:57:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A156D280CCA;
	Thu, 10 Apr 2025 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282620; cv=none; b=PFlT526Gk1U9BqfQNfRwJJvuj9vXudOHQqUsXdZ+I2BFw8smjBHxTEum2dgZ3juaI1dX6nW87f7K74o4yVaCtoUK5lQHqrzV/r6Pk98YaGkXG8lK6IrsqwTHZ+JTe4NcSuB9+Z74J5db4A0kM2/SEw6B/BP3IJ499V9tKe4EM0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282620; c=relaxed/simple;
	bh=y73/9EY7J8uH4knyVIURzgZVZuHvWKrWEFtthD2vs1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bn78Lw+Sn++XIdn0iTP+lOf34Ug/m6GseKBOXibQQbW2Pnp8wk/feVpK2owt8OlCd+OEhdcUHBRZ5RJNRZrXIl53feHASl1TBWWWyPXT+1TzZ+msh9nabD5Px4WTOsxTxVQCnPDIJSCdT8yqYQm3TI9wAA3rUbRRwqqdTLFHhOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52446b21cfdso331927e0c.1;
        Thu, 10 Apr 2025 03:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282616; x=1744887416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8421YPC0JergF9EsgZGIo7DTUUsJsdTDpHzoZ6p+ATM=;
        b=adsSeeBrIfRj0o0dl81Tt0+ebLB0cTqFeld2zW29czP+mD7SmRf/0JTliq7eLGgFSI
         twRBSGovgiNrbTWXmai0aXylGliOeZ14iI3Z3E0+DLuMy/sQVTWzgFXOnMfYmc4N7hdW
         DIxpLEQplS8rXlQg4d94V67spwvRwbzHF/oumz2W/zyfnCtp5YsOAIajEGnJ1r62D+32
         TZr0QgtlpIJML1sorHxLoEYTRsysKxCTyoUzQwt18Tqsz92t9HuiWnZZLwsOcfho+mIx
         H4H/l2ySMKImb7dREUMmDoKD2y4hK9/0cTnbUgP10jPU3xjuWRcAm6PqTQogFKDI//hT
         +Msg==
X-Forwarded-Encrypted: i=1; AJvYcCVuMQ0tiTK1z8cT3CcCimKlUaGufv4+qwiZBzjTm3u3szBl4m/iI2H+wEWRWzbUrHJog0xVYNWAbKbDxMfI366XtV0=@vger.kernel.org, AJvYcCVzNsVlV0/cpgMbMme+KbpX7g1GcnqBOtQ145GyroefdDmwD1mJtUMNdAOAkKnVZkTLErrJGttwzRWo@vger.kernel.org, AJvYcCXTo+maF761eVhIcS9TAGTVyspOLJ+IBIjJSYMTe5VuyMfNY/CLXuph4hZxSmC2j8P11xFix3HgHotLrZV7@vger.kernel.org
X-Gm-Message-State: AOJu0YwwQnmFI6vlwuqPGdb+7MIO2dgf2vACjtwBjYkelJjjJB7me2hy
	KXxzRJRG6GVr+4kWfTOHi+JVRGPuqLiOndYdGEtSo0qImMf6vRKMfPXQMCSEgAA=
X-Gm-Gg: ASbGncsl2QfhvU3PSkbyEWRrH92Y9ZTVXLumNF2XUqOs38ftVO+PDBzUh967UitJSNK
	fQ5B7zq/j5GXl2lflcvcCkxVMOXWRRhOsIpGp5qa4/aSRx+NP0LNlAk//4q8xPimS3mlQORn5l+
	gJ9A1jqGQB8rQU9z3lE0OUFhIxbm4d5AC97klG35JYULXV5+5U9U0K0pH4NHjoBW6JYEc6JxVe8
	4wUrz3huhIyh46EuXcoaLcu2tbG7pXbSgpQQziQmKelu3EIT4Ca+q1uUd5TqncIlLZIMSGm+wDR
	9caAfsSefd8kkCsb+3AOZo//C9x8NqQd5fkF20vBKLQjBX57O3GMspuxHn16OWQOtj/9WQAmL/z
	/Nwk=
X-Google-Smtp-Source: AGHT+IHpAxxQ3b06EHECTYctkFwjYxuROa95pJh+ttLx9Y2rJd3C7G/wFEeKUdQfnnJdvB7ZXuqFGg==
X-Received: by 2002:a05:6102:5247:b0:4c4:fd0e:dde with SMTP id ada2fe7eead31-4c9d626142bmr615375137.8.1744282616428;
        Thu, 10 Apr 2025 03:56:56 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c97a304esm540760137.17.2025.04.10.03.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:56:56 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d6ac4d5a9so273554241.1;
        Thu, 10 Apr 2025 03:56:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXjeoK5eDqfY/Hh0Q3pYKB9NsJk2p5b/YeOQH6Q49afoP5ERsXFdnctLZIZMoQdCCw40411YjeeYne@vger.kernel.org, AJvYcCWEQaY2MiEjkOAtsWxj5JaZ9TbMJr9cvsymisBfuYkqFiqhEJ6XTNgaoZPXX385lzw3NB881MzYN3PaISAA@vger.kernel.org, AJvYcCX7+DC973LRpqpPz6RpZTE80TaqVso6Iw8NNjJu8A1V6tCUqy9h+udOdXcLlSI1RrbQDCRGsuiQIOPLjgCE8CaourM=@vger.kernel.org
X-Received: by 2002:a05:6102:504d:b0:4c3:6979:2ec with SMTP id
 ada2fe7eead31-4c9d6292f43mr570214137.11.1744282615969; Thu, 10 Apr 2025
 03:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <90c7aa143beb6a28255b24e8ef8c96180d869cbb.1744271974.git.geert+renesas@glider.be>
 <Z_eCV8aTmr4t1_xZ@shikoro> <CAMuHMdV5w_9VpVrJPHy_EtmXoWV9fdBBO_YwhPt2TcX_D4TUxg@mail.gmail.com>
 <Z_eRTafA9mjDC175@shikoro>
In-Reply-To: <Z_eRTafA9mjDC175@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 12:56:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqrJzzEfD0SePdTGDPyW0x5venEvq-aXw5R=+G2kzvJw@mail.gmail.com>
X-Gm-Features: ATxdqUEawm8Yo2uH8bWNMCFNoCNbvk6endAuDpyrRexu1OrX0s8ia0ZmDLmhtTc
Message-ID: <CAMuHMdWqrJzzEfD0SePdTGDPyW0x5venEvq-aXw5R=+G2kzvJw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: Simplify DMA-less
 RZ/N1 rule
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 10 Apr 2025 at 11:37, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > We don't allow "everything". Valid compatible values are checked by
> > the normal rules below.
>
> Why don't we use '{}' with all the bindings then? Would simplify so
> much. From the watchdog driver:
>
>
>       - items:
>           - enum:
>               - renesas,r8a7742-wdt      # RZ/G1H
>               - renesas,r8a7743-wdt      # RZ/G1M
>               - renesas,r8a7744-wdt      # RZ/G1N
>               - renesas,r8a7745-wdt      # RZ/G1E
>               - renesas,r8a77470-wdt     # RZ/G1C
>               - renesas,r8a7790-wdt      # R-Car H2
>               - renesas,r8a7791-wdt      # R-Car M2-W
>               - renesas,r8a7792-wdt      # R-Car V2H
>               - renesas,r8a7793-wdt      # R-Car M2-N
>               - renesas,r8a7794-wdt      # R-Car E2
>           - const: renesas,rcar-gen2-wdt # R-Car Gen2 and RZ/G1

[...]

The watchdog bindings do not have an extra rule that lists all
compatible values a second time.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

