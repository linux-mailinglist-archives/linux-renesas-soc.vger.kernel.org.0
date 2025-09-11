Return-Path: <linux-renesas-soc+bounces-21757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCFFB52B15
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 10:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33E07160D7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 08:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97E52D29D0;
	Thu, 11 Sep 2025 08:02:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FD32D23B5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577724; cv=none; b=EWrYb5dvExgNgMa5MWHre1iFcGKR9I1u/o64WjDXAAlZrj3ZNhW3W1f3lw+EVUfcF1ge7gAC/rOhbL8j+ytYc1rlR1B28OjfyC/GIz5AZ7WQMgdpyE1bdDnPo+OKVGUzxNEPw4qvU00PLUGSEAojKnyb4Zo5JwzzHZA85YsZZMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577724; c=relaxed/simple;
	bh=kBy/AvedJIkQJvHWwCiRjKInRbQkdpYRIGxLrxF5G2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktEpMp01lbsgaDc74u1e4mFx7txXle0eSeZMDmK4VlDskDAzLCcledDq0t/dADzIXibIhOm4ztNaX2HyFcKhL4U/5IrNQ1SXREqiPy61WLMd889U5S+BXXSLr7j3wRzm2ESsZiHhYWIqv8j0aMobALXU6nFssJwfRT1+q2iasyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-544acb1f41dso143647e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 01:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577722; x=1758182522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KANTy1QlCUJPXGuCgOYVp+dSgXgnl1vGnGT6cRevzw=;
        b=dUd8i5r3LAznCHPKtXxTwZiMIeDF1NROwTRZfmXS9nNnpHZrkv6NhvZ1Qs36slJavH
         q4hrnv5u+w3RqGZBVQEDnLv/8FXQulEuFtDINWxPJ5eVeGsAo7Z46SxPLNJy9tIrbAca
         57SNsX1NLid1g4nM69r/xnMh9+UeQ1o547kEhkMrSNzqcVykgR7yhNG68MqjfGiDTlHz
         y/z3U6El6iUC6duP/Dz0lYri4f8O5sxuN4EyIUt7srCRPYE5l7krl01V4hvK1Ej4vNgj
         uA8GgoMcmNtbZbBc5UmygtZWOs405WTtiJUv9d4hwQhHTg1vUXaECcdo66piBsR6VlwN
         lWNg==
X-Forwarded-Encrypted: i=1; AJvYcCWtr97fE8npl/SOLLUI1+YpMnIhIO/1Cv9oxjoLrbnVz7fUF5owHEQ+Moj209Crtd1cHcxCXZz1KUeggUxOwAS6Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhikjIbxs7lxuO+Q+RTbCUWah5HCdzvLdGx0xfFcyB4kqb8YD2
	Rrvm/hc2VOEH0W7R5zv1O7eleZvVwLyLX/FhXaPaSHsvYDb/+MgyqsMOqW8h6qMH
X-Gm-Gg: ASbGncuQk3pJFv8taKPnyHtj0P/AywXozfn6zYm4xQd6Qx/Fy7iTutkqkqQE770IWUe
	+3EYZaomaSCG2cbN18+aVKfOn1BUMHvH7feJSAw4PsQM0PB2adPUrlE3CSVPuRuJvOGgJjbv9gK
	cTZZjwvGYmSUIhoihtPjOibnFPyx6Vc41qfTzC/aTcKfh+lXi+5WMVPDIW+dOm/QOIekmv5c6r1
	KZNriGCsHb0HVDmTMn+mRn9oejFOK+8qOKJs7+pIk9i+5Sz6VWGKlTnUObCaiF+wWTteQaXmYrB
	krVNPItRBee56OTratTxdrpVTmOWEG/7VYheU1EQoTYVFA9VSuzUyuUvHWRPzldOXxxwlaskBpO
	PSvPcCkauNDZCR4+yFSKZiYQmavMCaUzJSIfDI4zNYuVgtVn5s9vVjIRWEDNu
X-Google-Smtp-Source: AGHT+IFY4VPoVqp00ilhHvLk9erXBiwtU6lFbOCOMKs3LkxFTnAKajpa/3isaf5z9IZnxgYVS9hXAA==
X-Received: by 2002:a05:6102:54a9:b0:521:760c:7aa8 with SMTP id ada2fe7eead31-53d14d8c892mr5774267137.27.1757577721879;
        Thu, 11 Sep 2025 01:02:01 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-55375d5b89esm197764137.13.2025.09.11.01.02.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:02:00 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-52a80b778e7so166691137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 01:02:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1Byd1dPHohSAtJSUZ9uBffg5DdivA+V5CvbjCfYP4bFNPyjP29TPLQws/b8x8Jcv6JYeBBNNBOiP1elfnfL2xiQ==@vger.kernel.org
X-Received: by 2002:a05:6102:441f:b0:4fc:817:dca8 with SMTP id
 ada2fe7eead31-53d1376b72amr5773636137.16.1757577720535; Thu, 11 Sep 2025
 01:02:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910175415.8698-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20250910175415.8698-1-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 10:01:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6NiCfL80onTxm=6jX7mntouJr6UbcjsW1fsVxNVGJPg@mail.gmail.com>
X-Gm-Features: AS18NWAxsOtpNgwtCNv-gmTlbVlF3VKPt5-yYPVxyi6HT2e8ZKzjCX6D1hFl-2A
Message-ID: <CAMuHMdW6NiCfL80onTxm=6jX7mntouJr6UbcjsW1fsVxNVGJPg@mail.gmail.com>
Subject: Re: [PATCH] nvmem: rcar-efuse: add missing MODULE_DEVICE_TABLE
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Sept 2025 at 19:55, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The nvmem-rcar-efuse driver can be compiled as a module. Add missing
> MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
> loaded by udev.
>
> Fixes: 1530b923a514 ("nvmem: Add R-Car E-FUSE driver")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

