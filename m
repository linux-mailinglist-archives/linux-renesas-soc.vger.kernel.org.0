Return-Path: <linux-renesas-soc+bounces-26180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29989CE96C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C5913021755
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 10:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5871C2E8DE6;
	Tue, 30 Dec 2025 10:34:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A452224C06A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767090857; cv=none; b=jgdVFlDB5OwBpa0flFfADzzb/1P8SjOztKbtYMCg1aif9KOawq6spgyk8uchzED9/QI+fb2zLQ2dw1ce5GeI0omSOs38MYKAsDZuLHdIojLtNrAXORsd3z0EEeZ5kzIPJLlAQMs+NzEWSknQ2k1brMrAyOmlsfVn8T2sUEWGAQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767090857; c=relaxed/simple;
	bh=yN0KVfudTqjbDfHr9i4tNLq6M1rrpK08gDbM8j9k3PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2ASmGRy5pxC1cM1SIc5mJs+7D3K5FJJ/uocJK7nMl3RRiJcT3QvLn65eikIZFp/k+0VWGnc+Rvh0KForxGVV41jo5mdgAxL4LJqBvMm/9T2IWJgkSg8Nq3FRxWLUvQ62B7LQ2AKbi9+AuF6O3RYL1KP2y1WJqVCphRzt09oBNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-55b155c9ab2so2188685e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 02:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767090853; x=1767695653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiqG0RuHQZMk6KJKRxI6Xkue4A0zmVgJcCqyVxR0fvw=;
        b=uvrtVzKvNww20UTNFVhDu8qXK3cTQeB+/WMO/x9Gdsz1EN04Zcr5TVpwM+I8T9sQJ9
         JBhkMB0zWTF9WdKCJn3J/JXkjRJEZ6VgWpzAUuvE6oF0J56tJUjdBWnqsZXlRM95/7of
         CWAYlGIK7NUw/ynhCOgtjETmbYUhrGFq9ul6+rG2QPfvNH7/pMfIpHNBDUsgvWwi7OKX
         IOsBY9JZXYcRrKVpT1U/LYic/Row7PpeREebIReTHBTwslPOEQ6ji249CJQF/o7atHzv
         Ql25VFr09HrQunHcy3yE367mQTnWYU+w20if0C/LFq0Mart/Ev7u4NuVDTlprFmaqaDg
         pj0w==
X-Forwarded-Encrypted: i=1; AJvYcCVsZponqrIKaNTNkfA9nolUNocDf2cAEYe/smlLGI3rIqUEZi4uvbHf7o3zquyghqeX7tDBWedPywukMriys1TQMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRAKdi0F6Bp4V2Qrr67GNeA0NACXVTbLkKOD+BErU0a7xCC9Rq
	RlBr6RMECpS1ym17eoJlz2g+06qL1YlzBvqQm/Q9K9L+uuTtY6HJHJvvwFmBEo0A
X-Gm-Gg: AY/fxX4rIDKWM074I2H7Wf2fcOB2c/ihanusVoKf+W9Pue/9s3nvGxzQ1zprqGaUb2E
	OOf7BvwK4evrHiHi9t/g4XdJIwMXDlA8+k0MFNLDv9LEEn3UKYWePm4fs8nH0tSgzjdy4oojUi8
	nQklZX5gHVuPIYdjOyztPDVROoVzG4LGwypQNx+og2C30pUnpysdxAJ4AjjBc/1HHxOIFV/N4x2
	D7k6YKbez/HQKI541XcxWARgF+PjfQcJzmEc4afkuV+oVgJZo9SNUWBknefXkm39EqUKEuae+3/
	oC1kcrCdc4Ca0HlWEEp8TBKnDzNjGTh8y1y0ayxLKOgpnHdzYou72qpOntinnv0Q0MJQcpUhfS9
	9RlXL8fZSWNMFtCY/A31KmS8GqKVUCe7P2QYSDc5sS8ermTL7/sgMar4HYdFpBzFWJNl0BU2sxM
	wvFs7e+y2g1N1KYNaQv3SFfP9egECoxP3rSRRb5W0z+yiEQ1KbkK1K2610GjZuwVI=
X-Google-Smtp-Source: AGHT+IGV4FQucy3+1tEUJesUsU7JCBWNZXc4aQTyZmjaO8HwXp2SujLao9ALljC6B4tJQC/j9uqukw==
X-Received: by 2002:a05:6122:794:b0:544:93b6:a096 with SMTP id 71dfb90a1353d-5615bd54285mr8087596e0c.8.1767090853516;
        Tue, 30 Dec 2025 02:34:13 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d1329ffsm10115567e0c.13.2025.12.30.02.34.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 02:34:12 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55b22d3b39fso1898075e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 02:34:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPtsKlfQ1jpZt3vQsE2L46xxiIMObuulnmfIWKPG9mBO8FC2bVp6rS1RMnHd1cJBXrPJy+juw7up9puUYBGjH/rA==@vger.kernel.org
X-Received: by 2002:a05:6122:1b8e:b0:55b:305b:4e37 with SMTP id
 71dfb90a1353d-5615bec271amr7076419e0c.18.1767090852559; Tue, 30 Dec 2025
 02:34:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki> <2556645.jE0xQCEvom@rafael.j.wysocki>
In-Reply-To: <2556645.jE0xQCEvom@rafael.j.wysocki>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Dec 2025 11:34:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVMFQebA43FJ53PBnd67C8fxWAC21cr4jWTGDwg-HV53w@mail.gmail.com>
X-Gm-Features: AQt7F2oNmmGurpUUAM5WEOMSDRy-1YxYjMjXZjhhxF2SDHcSD9gt9FTqJxI49VQ
Message-ID: <CAMuHMdVMFQebA43FJ53PBnd67C8fxWAC21cr4jWTGDwg-HV53w@mail.gmail.com>
Subject: Re: [PATCH v1 15/23] phy: core: Discard pm_runtime_put() return values
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Brian Norris <briannorris@chromium.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-phy@lists.infradead.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Rafael,

On Mon, 22 Dec 2025 at 21:40, Rafael J. Wysocki <rafael@kernel.org> wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> The PHY core defines phy_pm_runtime_put() to return an int, but that
> return value is never used.  It also passes the return value of
> pm_runtime_put() to the caller which is not very useful.
>
> Returning an error code from pm_runtime_put() merely means that it has
> not queued up a work item to check whether or not the device can be
> suspended and there are many perfectly valid situations in which that
> can happen, like after writing "on" to the devices' runtime PM "control"
> attribute in sysfs for one example.
>
> Modify phy_pm_runtime_put() to discard the pm_runtime_put() return
> value and change its return type to void.  Also drop the redundant
> pm_runtime_enabled() call from there.
>
> No intentional functional impact.
>
> This will facilitate a planned change of the pm_runtime_put() return
> type to void in the future.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Thanks for your patch, which is now commit caad07ae07e3fb17 ("phy:
core: Discard pm_runtime_put() return values") in phy/next.

This is causing several messages like

    phy phy-e6590100.usb-phy-controller.2: Runtime PM usage count underflow!

during boot, and s2ram on Koelsch (R-Car M2-W).

Reverting this commit fixes the issue.

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -190,15 +190,12 @@ int phy_pm_runtime_get_sync(struct phy *
>  }
>  EXPORT_SYMBOL_GPL(phy_pm_runtime_get_sync);
>
> -int phy_pm_runtime_put(struct phy *phy)
> +void phy_pm_runtime_put(struct phy *phy)
>  {
>         if (!phy)
> -               return 0;
> +               return;
>
> -       if (!pm_runtime_enabled(&phy->dev))
> -               return -ENOTSUPP;

Adding some instrumentation shows that this branch was taken before,
thus skipping the call to pm_runtime_put().

Can I just put the check back, or is there an underlying problem that
should be fixed instead?
Thanks!

> -
> -       return pm_runtime_put(&phy->dev);
> +       pm_runtime_put(&phy->dev);
>  }
>  EXPORT_SYMBOL_GPL(phy_pm_runtime_put);
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

