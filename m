Return-Path: <linux-renesas-soc+bounces-22128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC82B8FBCA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 11:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EB05164AA4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 09:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43220281530;
	Mon, 22 Sep 2025 09:22:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15F8188734
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 09:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758532945; cv=none; b=I2ODFzgshGp1IbU9XLSav1t0hJ80ZBOOtqOMKSesqFh21IQQiZBnX4VXa7dGnqzvLJ9iGmPCAYqkwC7Li5DUfKyrbHGdDVzgEvHlqgfcS8Bmwm2AlD7RIeVzhy0YAm1hRepFh6StZtN0ypzAlCuvtcYy5MbpUVBlqHVF8DV5C9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758532945; c=relaxed/simple;
	bh=6KHJcEnIVlCxmXhX0OhfMBaFaMVz1ecRFiMG3CflXoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvdYlvwKIewJBtwdWkOBJ6K4t+B8u/ibJFxtQM/kgSRxVY8vMJQPY7t3jwpC9KtRCxEvt1uHyG7+IH+EBT/2HTjTzjazGEG0UnGLe40H1nkWFgXsynnxCp+Bpd7cZI5Vv5pQFYi23KCCLBWbXlRMWLAZILW4FzlyOQVuyjBWC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89018ec3597so2664055241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 02:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758532942; x=1759137742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLwAIW/7uzQCGM18tYiubcKSm7XfD2QdDVkO6Wb+rco=;
        b=kITGvrdQUn/QvkEVuVAL7WhfpbVbSlNTagnJ0bMsvzNQ41JgN28o3k5IDSeEPDbzg8
         dfcoB/pAqiAOpHLEfeS0TfgW82QO7MutFM2GMD5ymuBAhhjxOjB9C6m3Ykimp3pefW/m
         EpOZ8mZFYn2vUYF0Dco7Cg4iPNvlFmh8BxMehH1ZQyu6nZQQv7uqozZQtRERGwkGugaZ
         oMv0QavLZRuXeik9AozXQ9i1O5QDl5lErllVQnsnLXV+Qnom46wamVBO4KVJIqfqVAOS
         QEbH8MUMeBFzVnbZPUr78pEk9cUoDFvF6fnKeqPPoFDPDZtSz9/yDJ/z5+0+vCTGpKL1
         UKag==
X-Forwarded-Encrypted: i=1; AJvYcCWhUkJBOdCWkcKSMHPkCGMrHxToBFnkPnpLOQscyM+fd1ieWMlOx51Rj78RZfbaPjdg+gdPVY/UFNmXgGkVHdeelw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv/tyhyj+Mn1x4gn+wKV6Ih69zsjuF+GlBJyRMobr/KUFzf9d+
	tjDt4fyMwf+1RFSGLQ0z4+L/A9LSKd7gZMPJTl2Acb4mJXv5z3XwEgh6GaP10St2
X-Gm-Gg: ASbGncsuVNORHIAsdjeAz3ut3mdJWUILK9F7JYeZ1ZozCekVb+h795wPf4rXZ+Ld+6o
	mptqDW9A8aaGsLk79Sgp0Z5+J5yNh9gwr5gXHyFA0vp+9kq6tHoQHGY56Ufx7YS/XGuBNIbjIYR
	QnBRG0BXWnaL83LqCk1TSOi3bf6MNAcLSQN2srAE6K/gVZ2PcFNMr/cLR+J24DFY6RYw4A3t+0J
	9mTWxvsgPdB/Mi42SxlSEVsBhVHfXy8bM87g4QBFH9Eay4ePbUba0K23XELdwCt5YxjWMYL3rS8
	wpu4xgrDdRbBJqZR9A/eeHkygi3P6qm4saqvuCvV1MCve3P2Qve3/C9quCLn+f9y2dbqe1yY1Tm
	PfHVBRLVGYpc1urqT3aMjsBSb1BK29wdl51sN8556txoFpA8coVc/fgHzLNq5iaM9uJbXIXc=
X-Google-Smtp-Source: AGHT+IFRAhbGFYZDaxHtwp0RmiXZyVDYLF7e2Zv7t3/SzK1f31riXKbTUEUKNAQXuRLNazLOwamUQw==
X-Received: by 2002:a05:6102:3053:b0:5a4:420c:6f94 with SMTP id ada2fe7eead31-5a4420c955emr93266137.4.1758532942470;
        Mon, 22 Sep 2025 02:22:22 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8fba10c5a57sm621313241.0.2025.09.22.02.22.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 02:22:22 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-890190d9f89so1981694241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 02:22:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrM5VIuQUaM4UfhEFL72qlN7+rWPIRHWq4MgRcSJWhxlmLqgzMcezJSNIp7QwuvQzLBcQcHyWRK6lltrz+00e/DQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:5a4:420c:6f94 with SMTP id
 ada2fe7eead31-5a4420c955emr87759137.4.1758532486911; Mon, 22 Sep 2025
 02:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909162707.13927-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250909162707.13927-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 11:14:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWWLGHJwxz6yYjhS2oQdmMO+Zfi4b3N3uTPN-NOeEpkA@mail.gmail.com>
X-Gm-Features: AS18NWCy28oVP6aNkng2frgdJoNjIFwDpm5d2hI--F1SYyy5KYW3QCIN2mFvGL4
Message-ID: <CAMuHMdXWWLGHJwxz6yYjhS2oQdmMO+Zfi4b3N3uTPN-NOeEpkA@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: rcar-host: Drop PMSR spinlock
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Duy Nguyen <duy.nguyen.rh@renesas.com>, 
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, stable@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	linux-renesas-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

CC tglx

On Tue, 9 Sept 2025 at 18:27, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The pmsr_lock spinlock used to be necessary to synchronize access to the
> PMSR register, because that access could have been triggered from either
> config space access in rcar_pcie_config_access() or an exception handler
> rcar_pcie_aarch32_abort_handler().
>
> The rcar_pcie_aarch32_abort_handler() case is no longer applicable since
> commit 6e36203bc14c ("PCI: rcar: Use PCI_SET_ERROR_RESPONSE after read
> which triggered an exception"), which performs more accurate, controlled
> invocation of the exception, and a fixup.
>
> This leaves rcar_pcie_config_access() as the only call site from which
> rcar_pcie_wakeup() is called. The rcar_pcie_config_access() can only be
> called from the controller struct pci_ops .read and .write callbacks,
> and those are serialized in drivers/pci/access.c using raw spinlock
> 'pci_lock' . CONFIG_PCI_LOCKLESS_CONFIG is never set on this platform.
>
> Since the 'pci_lock' is a raw spinlock , and the 'pmsr_lock' is not a
> raw spinlock, this constellation triggers 'BUG: Invalid wait context'
> with CONFIG_PROVE_RAW_LOCK_NESTING=y .
>
> Remove the pmsr_lock to fix the locking.
>
> Fixes: a115b1bd3af0 ("PCI: rcar: Add L1 link state fix into data abort hook")
> Reported-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> Reported-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

Your reasoning above LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

My only worry is that PCI_LOCKLESS_CONFIG may be selected on non-x86
one day, breaking your assumptions.  IMHO, the mechanism behind this
config option, introduced in commit 714fe383d6c9bd95 ("PCI: Provide
Kconfig option for lockless config space accessors") looks very fragile
to me: it is intended to be selected by an architecture, if "all" low
level PCI configuration space accessors use their own serialization or
can operate completely lockless.  Usually we use the safer, inverted
approach (PCI_NOLOCKLESS_CONFIG), to be selected by all drivers that
do not adhere to the assumption.
But perhaps I am missing something, and this does not depend on
individual PCIe host drivers?

Regardless, improving that is clearly out-of-scope for this patch...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

