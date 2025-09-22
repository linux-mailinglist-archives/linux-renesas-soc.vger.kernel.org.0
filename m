Return-Path: <linux-renesas-soc+bounces-22134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7868B904E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 13:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5365189869B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 11:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF5C28850E;
	Mon, 22 Sep 2025 11:10:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D5A2AEE4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758539449; cv=none; b=sMB/WW5vkEvmTKyv1z36gwYmG//ZEsqe87a+E9NhpF9Gmejiq73cHc8z0tGU1BgFIJK7Fc4U/irmTFz1AjztGBcCcNC0+c/k2zikSNMzq5xatUdoQmmY0IXKXaZ85HxCkLquSbYgMKaiBef8YSeGEgp9lpivnqI8TD6FkFPTGcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758539449; c=relaxed/simple;
	bh=cTOWHSZz0CbR5QVq9JJxTyPwu6atT+ebquYnqCSMr7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZXPZBCMEqIOJppH9lzdGVrkdQuDZPRThv7TcL1NEgpHBi1K2piWzaW3AeSv9s1ATWMD+Gjzr3EcEtoLI0NAomVPfvcS+0f03S8d4ovP+LQQjvlR3+F/1bEaQ8Ry09Z6MsD0cMYt24hNmdFV0Tt2ZrPqAGrbt+MVKlsn6iYk97Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5a218470faaso484574137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 04:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758539447; x=1759144247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IV/+B9dZihk2EaYjeu+uEgh+MclsoCpinoB+GYo0npw=;
        b=pHxUzqOYso6gZLFf1f+99HHg4OsiEq3ji2rvbDNiPMrYrOJf2Lm7JNiVBKg66xvXlX
         uMWN7MWkb3qxWnEz9IMeSEed+zXOBLSCN+YwaJpRX4t80WOMiQB+npIMnTUSIPKRgGil
         8d7Eu5O2FQZlmGApqGpwLZMVsBczAIVnGCsfWe4nYC9VOW0OD1jOIpB8VIT/QUPQBd1v
         j0bhneuTSkQEFKA0qbTNDPdxqxGm+DfC8znkIxcsbRA7b7/u95mndtqfmqhW9xMt77rL
         fbFXG/lDV5h/VjYr4DWvhFwHOXojWTckp6Jyn/iEYkREPT05LRLVKEIV2jszfn6KrQMi
         CzfA==
X-Forwarded-Encrypted: i=1; AJvYcCXwfxHThwqXGUTITF9ggctyeUGQGr+KSNM/1AiC442xsflYY0kZVxSkaPN3cOiq/7XIoCqU5WVnFBm8XZgIhKEKog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm/loAATu+RYpURsfMXKW6yLSt70sd+6LZI9vXUlGlWCHfZ0yh
	ZboH93Dvn7xTFxi4IL5DLal+FVLxDQQnWkxmz3EklDn+cLpVL2BQRxsh7D8D06i6
X-Gm-Gg: ASbGncvqGP6HzkFH7cjxszUDYua+zgmcCmr54YkVYZSKs2Jg50sYdxIGF6210qNeY0w
	LQDX552Ic0LkQ37IMwUyNAYlMy4nnEafFXH/1m8Ibi8grUR+4FyHGOYlWeUW64koAzzkQNAFTZw
	G7NFvS7MqeYoDKZ3M0q4TNvDB/ah694VJqgFWzMDa+02CNRd6eQJ7Kk2obWy5bwVKFt2m0exPVc
	EFhIVIQRvNRX29TPjM6U4cthkb1DGSRvivtMbFd+t3gYxJHckuDIO6eilkeexeoKaw7GeMyKihp
	mJDsyuz3rix5DBG3BIGbNtXfwA9bwDhwX3EOqofPseHX3ffifk8nMyiNrlq6Gz6Dw2ygFSa6g2D
	kCXf6dxTXQOokNR2ubvQkU1+rcv+hE2MOAGXJ71Tj1RKeFULwIv6VvtQgqS+H
X-Google-Smtp-Source: AGHT+IHAjgGnUT9uDxTfJKm7m+vVBp57EP2a8lgge8oOgG6XH4JSrITCGmW8x8yXTqdogFxojfj8sQ==
X-Received: by 2002:a05:6102:3a07:b0:521:356e:2883 with SMTP id ada2fe7eead31-588d9c53e74mr3796296137.7.1758539446888;
        Mon, 22 Sep 2025 04:10:46 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-57a0267661fsm3269329137.12.2025.09.22.04.10.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:10:46 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89018ec3597so2712117241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 04:10:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7d1dGGQPuFNEu+Hh/4zTiViOvEPpGvve5m5umwQHHQAUffZFsLWC02DQJ1Jlc3ybQvaiA78rKnqLC3DUEkn3BaQ==@vger.kernel.org
X-Received: by 2002:a05:6102:6499:10b0:59e:37f3:688e with SMTP id
 ada2fe7eead31-59e37f39589mr1254098137.26.1758539446124; Mon, 22 Sep 2025
 04:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919134644.208098-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250919134644.208098-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 13:10:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU1z3ePD+1cyghfu0WbnP1X1_k4Jviv04hSxWtn=tt-xg@mail.gmail.com>
X-Gm-Features: AS18NWB5GAhd387xFzdau5HTt1U0YcFo9PHbJ6-t9ZIWuzYYbXO-r5xYHoFbkes
Message-ID: <CAMuHMdU1z3ePD+1cyghfu0WbnP1X1_k4Jviv04hSxWtn=tt-xg@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: rcar-gen4: Add missing 1ms delay after PWR reset assertion
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Sept 2025 at 15:47, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 585
> Figure 9.3.2 Software Reset flow (B) indicates that for peripherals in HSC
> domain, after reset has been asserted by writing a matching reset bit into
> register SRCR, it is mandatory to wait 1ms.
>
> Because it is the controller driver which can determine whether or not the
> controller is in HSC domain based on its compatible string, add the missing
> delay into the controller driver.
>
> This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
> whether S4 is affected as well. This patch does apply the extra delay on
> R-Car S4 as well.
>
> Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

