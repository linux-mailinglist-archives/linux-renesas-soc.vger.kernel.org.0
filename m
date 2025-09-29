Return-Path: <linux-renesas-soc+bounces-22459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBABA9536
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF96E189C9E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1942571C2;
	Mon, 29 Sep 2025 13:25:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029412FBDEC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759152328; cv=none; b=JbJQRxQs31NgZssJ9yNp0xOQbjbchN0GyO/zu8VJUg9oLVYBOtDCWPY8Rzp8Yy0lyrT2YLjrSToWMqbRW88Di2+nvkG5m+/hpiKpNjjeDPhb630jVIBHMqM84RNAsMsjk0CaeAnC4gKDejXXOVhC9BZcVsCy+/c+xMi+22Mi0UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759152328; c=relaxed/simple;
	bh=jvqvQ28/bBt/CRgYdapMYwDQEHIvN/TQdu1Bo9UbjjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUa7iX9zHfpd7nFP2lF5rDjZZ8YdgdzIG1tN6XOmNGIA/pQcvJEJbB/FFoxgavWAlOTNNpUxcPyXRvADVKh84BB+M5ytV9b85YL+pzXf8DXzK/GFmj5o5vLcZ4NoqsCnV/kgQO2FCKWKWcemuyMyTen/miTZVMQ4q+iuyZAsJto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-90f5eb2feb8so1173347241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759152326; x=1759757126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5f6AsTuwHrjYGiOLotcME/8AIl9AIuAc9c9mKImQ60=;
        b=ViwR+w9RuiwaPILRcDnPlRvQZ7o4SyZo2ZU9qnra88wGp7W4qGtzyFrqf3PmXT6C8d
         FUxeO32Uue3JR+YIrtMNTHMMdCikc/EcQ61JrTRDZO8zcgUrJBC8x98B2dyvvk/Bui9k
         qeIgV3i17ZWBT+F4TUWQLHQle5DwzJSKUQOinmvxOMA7A6tO0g+Q9FaxQRgEjayIzRpF
         EiKEk5jVWk/rC6bfv4JW0Ox6D+pahWdmEZPtN4LzWIhp+FbdsMdLUHymv5QGNTYWU9hH
         2GHBS1lbDPphc7SABTAdswCU/O1St7AlNHNaXwNRzKJ0ocj/3n6AlYn8As0UvZl68dRO
         TYjg==
X-Gm-Message-State: AOJu0Yw7UbS9Uh08LJzK79T5JJy2cLdYeaje7EL3dSbaixEOeyDhrw4c
	x2Xm7yvd2k/B33omvxH7Hn1tF/wRXeRq4bjVQhHppydhPvMYGTgCYxGFVt4nWLXJ
X-Gm-Gg: ASbGncsaOItBKAxwSg6GsTYZ0IvH4UcN/m4yzoTl8+yvAbT6FOdWNS62HQKA2i3tiR/
	z9c8EftdfM/5ZjZfhFUWYRLoSS0n3QdFNzIVpZxGP1VJhHCTbWFjCmZmauwOAgkAsaTirMmtkK2
	pMgOKdcFxxQJaCxcdiK/zIka4dIjqpXsS0O9qA4P1bDQaAxchJu908WhduYXzIGBfttg3RJ8h3+
	qX9dBWe1IpehqplOlw8pLurw6tOZcTCJBeYYo1gEG/HbdUmT0YCS2aDcTS4fHWmLrmXqM8H7GIv
	HrarcHG2gUpjIioC1Wxe37mSEoBFdy+hMT8r/vS1Tgdizt8hTDb9/0XemvXxHPeFG0A3b/9xgkC
	ns24lRYFkBx6dx1yrA4quIayel/V36Z3uH+0SBYY0zyiGGZcQh7akoTiyxSGP4UeM
X-Google-Smtp-Source: AGHT+IEBuxqYvKMLhGyyeqjwO+yrNZQ1jyBB7h2dDPrTegiAbYfBqbh4389OGbXsJF0dATIYxczB+w==
X-Received: by 2002:a05:6102:5488:b0:534:24ad:358a with SMTP id ada2fe7eead31-5acc33debcdmr5259116137.6.1759152325559;
        Mon, 29 Sep 2025 06:25:25 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae39effc0csm3341616137.14.2025.09.29.06.25.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:25:25 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54bc2d1feb2so1305501e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:25:25 -0700 (PDT)
X-Received: by 2002:a05:6122:d06:b0:530:7bd4:1761 with SMTP id
 71dfb90a1353d-54bea300da3mr6486981e0c.11.1759152324842; Mon, 29 Sep 2025
 06:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929093616.17679-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250929093616.17679-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:25:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjxcgcX2g=P7WyJfQOapMkf0skbUeJu-Yt-j9PKqO8AA@mail.gmail.com>
X-Gm-Features: AS18NWA0fhVhDiPz-K0-dlqh_DdyYiUcadKalyQD8_iM3WvS-rElJzR0A6iWLRU
Message-ID: <CAMuHMdUjxcgcX2g=P7WyJfQOapMkf0skbUeJu-Yt-j9PKqO8AA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: gose: remove superfluous port property
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Sept 2025 at 11:36, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> 'bus-width' is defined for the corresponding vin input port already. No
> need to declare it in the output port again. Fixes:
>
> arch/arm/boot/dts/renesas/r8a7793-gose.dtb: composite-in@20 (adi,adv7180cp): ports:port@3:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

