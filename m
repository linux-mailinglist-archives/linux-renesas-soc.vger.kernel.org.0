Return-Path: <linux-renesas-soc+bounces-27092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3D2D3C341
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 10:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 50974500DD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 09:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E993C3BF2FD;
	Tue, 20 Jan 2026 09:13:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87C3BF2F0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900387; cv=none; b=LuclZb8adr+AJjfqVeBoPN2NehIYaZNMdXCrtlfYrJufjehWu1n55craO63T1nzMdHS1IwTXimD3/V3T4U1kghwTdRi1UjhLoMPci2iUz/LQBwLFKYL+fC/T5JTdeRbRkhymBKZw5OiRuydhsmo3eNebxGVTBAOEtkujrwqVVZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900387; c=relaxed/simple;
	bh=JCo/vy6Mwha6m9EVmscxyQkIBKW1GkAN6H9safd5cfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLZ6B51FXYAB/6PDNK1+b2AUBmAeYucwHBPp6/06KKFilRGkVI+ywSasE4vHE+izpi/uB7YiJHau6ratZz/HhJhPI6zgD/KSe2k3PzrV33DQdTlCXSP5lurnvzVm8e1Dx92S0zweuVY5KzuBlPYsBgLMrQlHPjpR8INRUZL12DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-560227999d2so1582228e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 01:13:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768900385; x=1769505185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wC+91lBXGmHL8JSojiXe3IoVS0gwXwfT6Yt1dj4exs=;
        b=tTnT09HqjRiaWX4H0U5B1ofZpuzZP6vpWukJWs9QQsASkjhtscOqI+ZyOGb0g6lc4x
         +JZuzqzQXXViBloDcVRc+c8XGtwStjyr2nVaH2l+sbBbRegpe4GfGDz7fIVnhE4uLSJ3
         Iusr+RaBYf4m3dIVj9auQhBuL3Ymv5a72czyVS5sfU7Lym4YKi5bXF3CUgjZKEVvfajd
         FR2QhUFkd/2XcI4VcLJaGDesqAROywaZM91UXNP5u07MdLO2lTIw1oBi8azKxZD45+cd
         Hc0Wz8dHcid+h6Ux2lhA8gJdy7eAiXclFJr2RlQozmkBEFIO7pj30ZxNnBZbUF0aV5SZ
         PrxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFAqOAG4ZChfxE4umUxUFjWeEACCM2n84PDVZMwVaWlMFLK9EDW6G5u2uUJmz/9RMbfhyMNMLPvX3Ic1hQudrPjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4N/f07gyCKh8MMSqj7WAccbnecWJY/GH2enHQojOPT9BZPAsG
	KeLmiTmmnQwAhcRwjQIQnG/xNvQPrzeQXY0w9MTHkmm4E2dS3SPO24XvUaO4CgAF
X-Gm-Gg: AZuq6aLBiEmh0zdaePg6WIgOGVqAywiSlN3KJUTqw13GwUvR3+Ah7CfCbNQ9u8BNMHy
	gfBWDEH3bSC2Cr61pH2IF6coH8CWJdk9sNVU6L3JwFetuEfumUl0LyV/iaMSUGLdObxwEjYqniR
	9btsoQKsILGdZaCcskBoCE5zUMCREh4VbYRRRupRuN4AysQebRQUnizjkWA8rXlAO1TNPda5o9C
	zigw2DEfMD4M2ORLOfihma6xdvJs+fYNF/4aAvcNPAWuRLJE6Z4p92RCaBaaOR0jw7A1XqBzTpG
	LLnOlX4e/gpIIA8VUNoyYGeKuYt7SUxQDD6mYohnoqUOZ3CRRCo/U1j5rZwJqSymziCa1CQUDIX
	u4er0vosBLIrhS5VdT5u0kRhzeJ0WhbK9J486Kn55j31FP13xWoN9lavVs+V9rBRvKQx9xs/OJS
	eaPhvniyRMlBmZJuCWLDjDYxGNeB/dQM7AKEx1gmPzbgH/ZJqW
X-Received: by 2002:a05:6122:3d48:b0:55b:74ac:72cf with SMTP id 71dfb90a1353d-563b738c487mr3406076e0c.17.1768900384872;
        Tue, 20 Jan 2026 01:13:04 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b7123621sm3403544e0c.22.2026.01.20.01.13.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:13:04 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-947fea7590cso249987241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 01:13:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlVAPiMBPvl4fYTvg36StMllmwf/CQi/LFCwLcziZfNPFEDZagg5LG9t2t7t/qdqkTOnELkjmu64UIYbdu+TmMXA==@vger.kernel.org
X-Received: by 2002:a05:6102:134f:b0:5ec:c528:4df0 with SMTP id
 ada2fe7eead31-5f1a71a7154mr3003863137.34.1768900384198; Tue, 20 Jan 2026
 01:13:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be>
 <d921ff48-caa3-4d79-80e8-35c4848258da@mailbox.org>
In-Reply-To: <d921ff48-caa3-4d79-80e8-35c4848258da@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:12:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfEHcNwPCVPXeAO3Sk8U=p0nMVUksiwmMnnkf0LYmnjg@mail.gmail.com>
X-Gm-Features: AZwV_Qj9V8xzMgGDE9Ei_APB41OLIDWWyCZ0s_oMJRaqKrdIGg3tj-xH88Zkkk0
Message-ID: <CAMuHMdWfEHcNwPCVPXeAO3Sk8U=p0nMVUksiwmMnnkf0LYmnjg@mail.gmail.com>
Subject: Re: [PATCH] clk: rs9: Convert to clk_hw_onecell_data and of_clk_hw_onecell_get()
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 19 Jan 2026 at 20:36, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/19/26 4:23 PM, Geert Uytterhoeven wrote:
> > rs9_of_clk_get() does not validate the clock index in the passed
> > DT clock specifier.  If DT specifies an incorrect and out-of-range
> > index, this may access memory beyond the end of the fixed-size clk_dif[]
> > array.
> >
> > Instead of fixing this by adding a range check to rs9_of_clk_get(),
> > convert the driver to use the of_clk_hw_onecell_get() helper, which
> > already contains such a check.  Embedding a clk_hw_onecell_data
> > structure in the rs9_driver_data structure has the added benefit that
> > the clock array always has the correct size, and thus can no longer
> > become out of sync when adding support for new rs9 variants.
> >
> > Fixes: 892e0ddea1aa6f70 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > While this patch applies on top of "[PATCH v2] clk: rs9: Reserve 8
> > struct clk_hw slots for for 9FGV0841", it can be applied or backported
> > without, by ignoring the change from "clk_dif[4]" to "clk_dif[8]".
>
> Since the 9FGV0841 is the biggest part in the 9FGV series, the one-liner
> fix I posted is better suited as a stable backport. This rework
> shouldn't have the Fixes tag, since it is only that, a rework.

This is not just a rework, as it also fixes a second issue.
But since you prefer simpler fixes, I have submitted a v2 that just
adds the missing range check[2].  We can revisit the conversion to
of_clk_hw_onecell_get() later, after all fixes have landed.

> With that fixed:
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks!

[2] "[PATCH] clk: rs9: Add clock index range check to rs9_of_clk_get()"
    https://lore.kernel.org/all/4cb63bd8b1e49407831431fbc88b218f720a74fd.1768899891.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

