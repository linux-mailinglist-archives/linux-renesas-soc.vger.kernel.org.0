Return-Path: <linux-renesas-soc+bounces-23351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3034FBF5019
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 09:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03AFC188C6B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 07:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5A827FD4A;
	Tue, 21 Oct 2025 07:41:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE428000F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032507; cv=none; b=Ff5H/BOQBRMFUJaCrAZJXc39LxMj+tLpRWYbM2xSdrCPaZ4+K2znQW1lcC/3NwPzr/horKPBVvlX0W3RBMNGYg4eDiei8EyKxXbsbdC4p3JOmf8bR0DqZ5WVLZyw8N3uyR/tszPcVHiDm1Ea5FYidTtuFbvkm5VQsp3ps0yvqPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032507; c=relaxed/simple;
	bh=otiHuP8MqcFl29NGiXitYRoawdX0AzQvSYjXcRF3MuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBO4fn/VygteE6buCQmwoctAjTaWhPoIMqK4vGpVL1IChDQ060OOWKZyYyWaW1QDw3B4NYo/miIsLrZq6f6woj4GYZcKKVc8aL5L5HjYhRtUhuqQks9NGLnPcHx64iDI/fyT4qt28QXNAdZgcJLS+JoDrGqjBa+l86zuyKk2MLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54bc6356624so5343647e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032503; x=1761637303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHtLwELKBpjOgubljJO79MPJCLiaPMgxYrlfZQau14o=;
        b=UI/fr7Ju2Qh2kj6+PseOIWbvkIbH9ubRnBbldZLGawUd/CkSZajFGPFlFSOUmMBDTn
         pq7QA4A+a1odAiy03RK2E6EmNM8eEqjf+XT2qHEgxw3FXncjQVGZGyj+LoybhgjVownP
         6yb7mD55kjDHcItZ+YbdHscF0v+nRkC4NEIclHvf0eQwGhm4cuF5CzJgC30ps7CKRDn+
         GOu2QDQ5c8CaF2NS/cn8kLEGszIb/aFyvYZ++9h2AxZ1v7dT/1mzw3bWb562HlD8kfBc
         /ZGqiiy+Zp+Q5Yqz9EF3guUS9+bQFEpMwzGMat13cIkzZk4b4QAMTxbjf7OgIgORKn4r
         J6rg==
X-Gm-Message-State: AOJu0YxQIt6Ys5+OM9zsVmWQms/tzIYxiL2hC63tYDOK6ChcnorPhV6E
	oWGtSWYsz65DA+r4V7IPY2d94C35/8XThMV/W2wAHKziQYoCV3v0hX/blAfAbhMv
X-Gm-Gg: ASbGncu5Qnn2PgfQy+RkHBTXTrW3bdiIKhJeCekBK0asnGvxp1XgvGfWxXOgbWJwmnj
	DVTSoxwon09UgmUvsshScBUwYxMCC0wiTUdJ5I9CZID65m2OgaOLQ2+MnBPupjFG0PIOx/rQA9V
	IjTrt1FmUCVY7tHOQ1gpo4A/Dax2UJge1QcSqYb6oPOVVnNsz3tXT7Bfrmbh5SY/s2a+Qwz4HE9
	smF1CzyjuYD6K8iopcigJU6FvxaHFKUY4IVt6wvHEWsHgsay+KLCBzu5A895Xtnaqf7KA8FcFn7
	XqdTxdOGNdyfbiM2TwQXrcbksk5Num9NtfwPw7gyuLjBrCVK6btdH8l9hlX8nvfNpEqak4kvf9q
	WUEJ211aAuG0FUuZPe2xpoLYOStDxKkskHuvZG2aE2r70gYmg+vs2cD+jpS5GNSQrWHxF69KYIr
	pUKzWNe5sYrseaRH8Dv91dpHUZSmtmQ5WzSAikmA==
X-Google-Smtp-Source: AGHT+IE5eTK3vwXq2u57V5t1c8TZPTiAcJE0vvBEAEx8Vx1By+oRmWQe8rfc523w+6tCLjHUGI+yQA==
X-Received: by 2002:a05:6122:2194:b0:556:40b4:b65d with SMTP id 71dfb90a1353d-5564eeffa6dmr4945848e0c.8.1761032503331;
        Tue, 21 Oct 2025 00:41:43 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55661f99893sm3088610e0c.6.2025.10.21.00.41.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:41:42 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-932e88546a8so472034241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:41:42 -0700 (PDT)
X-Received: by 2002:a05:6102:c02:b0:5a5:57f0:f426 with SMTP id
 ada2fe7eead31-5d7ce418dcamr6320226137.5.1761032502495; Tue, 21 Oct 2025
 00:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017114234.2968-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUFFprx2HPT9oyF_Yer_zG3yoajzFUcTyDephCOA2yz_g@mail.gmail.com> <aPaRjKJVx6jvWP58@shikoro>
In-Reply-To: <aPaRjKJVx6jvWP58@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 09:41:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXExfhBMtO7cf5Otcge6CD7QzypPCQ1NH9Pd4AoOZxmSg@mail.gmail.com>
X-Gm-Features: AS18NWBmiYB5p2haag9w7bjC-WdQ8ezCB0bEPtScPtUlZdyG1SgUatrNDYHLwgA
Message-ID: <CAMuHMdXExfhBMtO7cf5Otcge6CD7QzypPCQ1NH9Pd4AoOZxmSg@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-rst: keep RESBAR2S in default state
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 20 Oct 2025 at 21:46, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > BTW, did you experience any ill effects from accidentally clearing
> > this bit? IIRC Falcon (and Spider) still rebooted fine before.
> > Perhaps you need it to make subsequent reboots work?
>
> I didn't experience problems, found it in the datasheets while working
> with S4 and watchdogs. I'd think a likely issue is that
> MD-switch-changes might not be detected after a soft reboot?

Thanks, I also see no ill effects on the remote Gray Hawk Single
that has old firmware and thus relies on commit accde57f464304cf
("[TEST] soc: renesas: rcar-rst: Enable WDT reset on early R-Car V4M")
in renesas-drivers.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

