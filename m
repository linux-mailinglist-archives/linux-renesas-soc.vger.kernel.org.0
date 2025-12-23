Return-Path: <linux-renesas-soc+bounces-26051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AC2CD8EB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 515EA3011A58
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A70132AAA5;
	Tue, 23 Dec 2025 10:41:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36353446BE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486493; cv=none; b=owi7NrZiOY5JFzJXW0K53Ih82F85OBgvmokP41hJ24SLAOF022//GvdIXS0I7mpvzkZ8S1W2U9mQpE5Jzm9vceLqeEpnkjA7+Wq7BwDD7qgHCbeSzTp8NtCi99Q8kZhStrMzBSjS75k75WTLvY1LE8Di21ddkL3xqj3Yn2bFCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486493; c=relaxed/simple;
	bh=xl1vXOaleR0j5ZD3l3FjtDUkU+B3UA3o3alRtYcoeVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSd9iLmpIlDMVvHsIZlIpZ3eK7eCIO8gtGARNckJwSYoqLIgWoerNdQSrhZIHD8Tr0BIA+6rlQRAlGP2KP2vTpU4Nkx6g3TBv+BnYdohhcy9nOJggWzulv6xGeFeA2A4HyuwobwMqOaTvve5GUWb3eG7yPtUa4uPaFqAKxMMfSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-55b1dde0961so3545816e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486490; x=1767091290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xq7HSic6ryPtqfCpQmmpcvZwrfLwAAt26kNsndZzLGc=;
        b=iQ3zrX/4kJkcj8imyrQWUdIrwNWvypEORin/BMFnYYCnYU/eA7Jpv7A1yA6IFbsHgn
         OTUTlKKbKApx7pv62X7rZu6Wz/d0XoquD5m2EZvv3r47zvACSG1JtQdDQEC+zCiTmRtr
         fODIOYduH5nEoHVif+OTGAnD2Doo25EPn7a+suHqXgSv9IB7TucaT5olzNKGU1d5fmAI
         IuoAE1GEayErvu/sojkqF1lk0p9gpZ3ur+5kXSNaQgkit2ECTJ/5D9R4JB9qMxnYWDU3
         ZAiJ93dzOcbCg/dA9TymFsf59go4XcnhMZKPLHZLu/sBO4KQsbaMVVNOO1UI8DRw4N3t
         K4qA==
X-Forwarded-Encrypted: i=1; AJvYcCX4o2kaiUUw7gfZgSqPN3hkmIMMM5HUg4TgyYgb3EWqemC/PLVhatyo89T8w9FWcteeIdjd4msS5M1bYHP1i6/IDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww0oRbSpC+lNaF2Sp0zAKYmlCEbPa4heLPNnwFcCt5iT9DqAyt
	xNdCPT8YmCwpQVlUkMR/QQLJ/8gEtTQpZgAaQVzvThXhHwiYXXawF5W7j0VfC/jG
X-Gm-Gg: AY/fxX6Dqr0AAolRJ7Ym0N03qoHLWaSy5ZDdKtQxSfyheic0Xg9lgGChvMq8Bzkkhja
	Z2iFv45zGlNpM6QqUYB6+oe3SN1BqFAtOjFGHSj01o5bpDLa2rhbrtDyn6lZQCLCwt96q2tcU3Q
	igGfXprsZqSmuk1910OSuxnid5chkiCFDl9sYy3f2yH+LEzgw0AomlXtikkt4UIXC8amLHKKdq2
	t2dnOntBDcKsSKIVhY94yHvNnu50GiijmnCfgV2bWYsAxPcoBkqzvzGss7TOvy+sC2JLB9gFyPQ
	1l+MhDEiS/NG4rKaanydLddaKLj0Q70hOrjEfsL+6/HrWmXDdN0uc69awJ1BOObTTej0b2B6SHp
	ntwwX4Il7ztl3w2zvC0J/KSRn8mMsZSvK3guf1e+G29rVaWwx7TG1IGsf2TVfRAylWUUx4kv/oZ
	3NA/tN22ZMOomBBuiwua7K90LIcxkkP1XCYAERkzI2UBtSzpuKYVAz
X-Google-Smtp-Source: AGHT+IF+Ra8bupVCp+X1vLeAnvf0FZlbGEoADyWTRZZeTuJghOLJo793Dqx3Bc9jssHEqqK12mQ/MQ==
X-Received: by 2002:a05:6122:7c6:b0:559:6e78:a44c with SMTP id 71dfb90a1353d-5615bcc1462mr4882642e0c.1.1766486490449;
        Tue, 23 Dec 2025 02:41:30 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d165f2csm4267044e0c.20.2025.12.23.02.41.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:41:29 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55b1dde0961so3545805e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:41:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOPnUv4PZUFbhuQemB7A1UbYlx2k/EQyPRqd1yJpIlkFJlpmdwFLFi2MCeGeKtJ3Socv4KSH2C9xAGPSKNVoAkiA==@vger.kernel.org
X-Received: by 2002:a05:6122:3c84:b0:54a:992c:815e with SMTP id
 71dfb90a1353d-5615bd1b39cmr4360914e0c.8.1766486488573; Tue, 23 Dec 2025
 02:41:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209091115.8541-1-ovidiu.panait.rb@renesas.com> <20251209091115.8541-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251209091115.8541-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 11:41:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXLkOnxSNBoAJ_Q7hQj=Eb1u3x-Wo1JiHU8uz_tCJcy5g@mail.gmail.com>
X-Gm-Features: AQt7F2orNy1GBmSkRttc0kHF_Evq8f58iyWH7SaoZ_piWZcfCDJUCF-OXqEH57Q
Message-ID: <CAMuHMdXLkOnxSNBoAJ_Q7hQj=Eb1u3x-Wo1JiHU8uz_tCJcy5g@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g056: Add TSU nodes
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: john.madieu.xa@bp.renesas.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Dec 2025 at 10:11, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> The Renesas RZ/V2N SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time
> temperature measurements for thermal management, utilizing two dedicated
> channels for temperature sensing:
> - TSU0, which is located near the DRP-AI block
> - TSU1, which is located near the CPU and DRP-AI block
>
> Since TSU1 is physically closer the CPU and the highest temperature
> spot, it is used for CPU throttling through a passive trip and cooling
> map. TSU0 is configured only with a critical trip.
>
> Add TSU nodes along with thermal zones and keep them enabled in the SoC
> DTSI.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

