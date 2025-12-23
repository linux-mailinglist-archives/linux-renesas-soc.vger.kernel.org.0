Return-Path: <linux-renesas-soc+bounces-26054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DECD9021
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 12:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18D843010CE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4AB27453;
	Tue, 23 Dec 2025 11:03:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562842D3237
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766487818; cv=none; b=BC01kWyVSOApsWisafBVQ3XsTVcYKLBRSmv/+ioJfHGxAq3y752KpkS5Gjva5DPn5xotQMDyxitg4EjaWIj1iaSdSgrF+dJrtkGZ0uZQERGS1bCFXKcQRnONCzT2flVILCrXqARm5LIj0/iMLeuafP9s0H/Mfrh3VVfSiF7GYRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766487818; c=relaxed/simple;
	bh=tIZuw1gY/W77btQZa4Wk+We03x9NJwU3zntqFoV3wzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcATxWAwcB+VUiaCb4DpZ6F7ECGcaWKD6XVnX7FHjuNJ/0D5Vp2ByaN9v64VdN/4t5sMSkt7v5zzVq+xdZKDPwMAkW5eWsH0d9IuGAUNNJrLQe/K2e/zfVAhjORTLwKWysYWKXsl8zzgvWfE/aBSosPDMznphpN/a1TdYMqAC0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56021f809acso991148e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 03:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766487816; x=1767092616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXZ2Zg3YfTNGq+sIyLahvqDAY7cXkQWZOnb97jtXur8=;
        b=uTQiT/d1vVCSUHPVgFhZCj7Wc2Hh5BaaQwvtmD2YwUC5SBbiO5zBjC8770rJdn6QWg
         p7B5wkkr4Rmi+5vM8IKw0YEFIYxWkQu9NesPTRLfQGiFQdvR2RP+6kP/ZsnRzsMzbNRO
         ewsRCE8QbdhTB/8Ez3nCtiwSPWdCDnBqNm99UzkjXiq9wJJEaFc3ot2S+XaY8EiMW9iY
         vPxpT6ZU9gX5XR9oNLugoYoZlTlu6/4jo2Rg/zUmn61/3uivswlhPUli4ZL4Ir1f/Dqm
         yN+dS79qK4JEocfEFGju29X/r7aZYTna6ifIIm+oaatTq4/pw5fwJ34I35AkCX9Rw7Uy
         Zhpg==
X-Gm-Message-State: AOJu0YzQ3ExvWs36IMei8Nq7JId6AoyTAdijSeF6JPRME2OOlnlH6KPd
	MLIFbZQDepC9/KJV8rvg/4aZFAjR1BGNGB3/b3FS6wNn75Dok14/CqMLHITvDWEv
X-Gm-Gg: AY/fxX5RVKmnJxGn3jGvaINmhNjfa4W6NIK6D17ioL60cO0EkUDdicdMi+ZuVlEm6/5
	MWCVsJFo0QHPXHCZTK8YFQw+cQ6JO3/jihaMkCe8Ng6qfJzBbc6QEMekYLfEkShJ1bedABTjI9J
	4ZGg5C6ScUTexheNDtFEGnXgIGWd6ATPWTOBX91Vio7aVLKDDShpVJ1Oy0jzO9SexZ0qHBfVbx1
	CdfnHlXoFVGQRT3kVbIC2aQgwgNe77GP8mQcqLYg0DRW+LUuvB9Hs6ZnXTJMUP7ujAsDtaotWLf
	iPDcwKNX6tEq16e0cpL6XxL379zEOh6yFc6raPFHLZYRp44K6PNxb/FZOR0vt9du6fb8Py5wQfv
	y9DX73fko/fzqfJeGPh9RRaC+7RIWY/fDJDM5qLy2NUehnmGCwowLZ1er4+EZ/pemhJec0wSpvS
	QsD4eNLyd4JjHftsxIkr5T0ClZwBHY3yUXvOLU2DduGOwegSXO
X-Google-Smtp-Source: AGHT+IEwUOJXqdQZaBudx/3qtB2ql/IP9HEQkDOFR59TEp4/EM4xaYIoMpPy9Zq2mti/l7HFekLrKQ==
X-Received: by 2002:a05:6122:c9d:b0:55b:305b:4e36 with SMTP id 71dfb90a1353d-5615bebce42mr3770490e0c.17.1766487816327;
        Tue, 23 Dec 2025 03:03:36 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d1329ffsm4266523e0c.13.2025.12.23.03.03.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 03:03:35 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dfc6be7df3so1766846137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 03:03:35 -0800 (PST)
X-Received: by 2002:a05:6102:dcd:b0:5dd:b69a:cdce with SMTP id
 ada2fe7eead31-5eb1a616b3bmr3879484137.1.1766487815293; Tue, 23 Dec 2025
 03:03:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215031318.2219-4-wsa+renesas@sang-engineering.com> <20251215031318.2219-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251215031318.2219-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 12:03:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqUG8tdJP1yN=viOaMPFcqRkCsRn7DQMZdGLLGUDMOFg@mail.gmail.com>
X-Gm-Features: AQt7F2re8SdYxHuvZGogmJ1IOAzTIRxebtW5GiwoC-A4eVX7e3ZGckeyRh481xQ
Message-ID: <CAMuHMdVqUG8tdJP1yN=viOaMPFcqRkCsRn7DQMZdGLLGUDMOFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add SWDT node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 at 04:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

