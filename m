Return-Path: <linux-renesas-soc+bounces-22132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE701B9047A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 12:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79C173AD308
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 10:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06402FDC25;
	Mon, 22 Sep 2025 10:53:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24422264B2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758538429; cv=none; b=NjyCDUQ6MdPINAi1y4KyZaXpZzM0u7sVOzFptBl7SaX7OOU8JkQim/g1N1hV7HvhHdRfuRsTuGYPFmYtwh1cyzRkpoiu6nj7wAX/lIFMyXAJftAmP/SVouOCHzsvsTuCCVF4kOcHh9srwETyAPCi7iDKFiLWaR2QIK7kZKj2UEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758538429; c=relaxed/simple;
	bh=eXihiG3aeC1WzVlWcj5zb88cbq/pGoIu+NxK5VsZC/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2No+qSUv8UVVrw2jMunbImSpLYRFAXmIHU8Sp6wqqUZQGoh+UZnChUCX52oBFD+6HKjH7R//zL7bNYlG9qc3iZMrtu/OtUyk7BXAMV7oSX5PhnWiPF6BtFch751PMqVvwhYf/c9LrBsPi1jC2hfOWF8mYKAeLawtp4QPR2Z2UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-54bc6356624so8006e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 03:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758538426; x=1759143226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeoWW6dZueQwB1hSDpJoXh/pdOSTxwozBB0k98T2GFM=;
        b=ULty+0K7tVnDvbtGxWi++471OoZh93hAPsoeQRtdjmeiqEybFMevZj0mCVYzL5kKIm
         VahMPtkDnwPXXJixfIDIO9nlp45kXvk9Y4sPPjWUaZO/1538tUfw09ylvfxBfxeMK8+2
         PUsLu6/2tojCgRGIovvwWN96HYe8SND2fFCdUG3XFeNdK7glNSGin2HJJmbVYc3JC2Ok
         Rujlbhk5PsRYQf1KNQ7R5Ykl3DXl2uHsszO6qPwGlFKjL7Rs+eDtfGoVoPStRhd2nD0Y
         VRPjHeqe+uzeKbdV0p0dHMLvBFeItH/tPXh1WSpIaTVRqyQnrFEwCLVLYmzsVJ+gFH8X
         bMmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKw9b37unMy1mfj57cr0H8A1uzNPWPLEruop2d2guwBj3N7jlhSHVwxG/9G5aH8JTEBlcJFuHfZar/m52ztDhBFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywM3lcN2Ec6M9EqxwWXn0qzidepf/D0ZaoJMmzbqFQ8nqG7xcz
	zTlrAtIN4ms+Y/MCC5Pe2xVDelRJSCVu4cFfPdKiWkjcXI5Vgi9p/dsm7jtKQV5K
X-Gm-Gg: ASbGncswsIZKNQzrPqCDeJgu6wm2996lxMsrBRexa3V0WHsRmqUS0juGBO9QiFczIMo
	HxFCCPvEdeBfG4UAND/Gkv2t1QMT4ukRwfIearNtlzDGG0s+0Cm+hm/Pm88C5DDq7oyhJuAXPt+
	DmKjRH2jnqjvRVI5cn9L6f84DHZ7tQAsaZzRgLxxbM3Mb7mse3Tl1ut2G9Aaan46WW2RHNDZyAq
	5F4mjAWI+kVUl8GbfW72uIVVTGwS2sWzx851eq4MFK9AEuLDlCpscUGchRhp0z/LWkTY2XeZjXa
	mNvNiueIEP/JkFazYgn8aGlC4bb6vkZikPWJg3lqz2BGBEKo/jkqXaqYA4q4Hap8g2AQvw7UG7h
	LAymvms5RUgBx3Iwd/6M7sIwK3ADeIa4s5Yz1XfYZ8kQYenDEOGLgNrukmBN5
X-Google-Smtp-Source: AGHT+IH9JkwxJh0sMHoBk0N3TbLAaKOpjQ9ByCF1JK7i4e8HEn3DNxRyMhDljP9ANTvfYMmEyhDjkg==
X-Received: by 2002:a05:6122:3116:b0:54a:a3b1:db63 with SMTP id 71dfb90a1353d-54aa3b1dec8mr1504670e0c.6.1758538426594;
        Mon, 22 Sep 2025 03:53:46 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a72974f24sm2563172e0c.19.2025.09.22.03.53.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 03:53:45 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-528a601a3cbso2756179137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 03:53:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfnhUWsDd72Sh2TEKcPpsMHe+exN5e/2Mrvw99QWZO5QeDr1pX1hkVV/GVKcd1A6mrq9ftrp7ACnvLc4Z6SypKKA==@vger.kernel.org
X-Received: by 2002:a05:6102:3245:20b0:59e:73d5:8b57 with SMTP id
 ada2fe7eead31-59e73d624c1mr1043255137.16.1758538424823; Mon, 22 Sep 2025
 03:53:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909162707.13927-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXWWLGHJwxz6yYjhS2oQdmMO+Zfi4b3N3uTPN-NOeEpkA@mail.gmail.com> <575ae1bc-0478-4f69-9002-4a48742e04e8@mailbox.org>
In-Reply-To: <575ae1bc-0478-4f69-9002-4a48742e04e8@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 12:53:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUP26CELeqro3sdgHT9DK7keWhcUqnkG2eXH2zBP8RqzA@mail.gmail.com>
X-Gm-Features: AS18NWBwpjLmLylzl6CTlZVUem_pLbg-o8tzohuXff76IDjxQJjQ9EiGk1YUs34
Message-ID: <CAMuHMdUP26CELeqro3sdgHT9DK7keWhcUqnkG2eXH2zBP8RqzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: rcar-host: Drop PMSR spinlock
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pci@vger.kernel.org, Duy Nguyen <duy.nguyen.rh@renesas.com>, 
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, stable@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	linux-renesas-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 22 Sept 2025 at 12:44, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/22/25 11:14 AM, Geert Uytterhoeven wrote:
> > On Tue, 9 Sept 2025 at 18:27, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> The pmsr_lock spinlock used to be necessary to synchronize access to the
> >> PMSR register, because that access could have been triggered from either
> >> config space access in rcar_pcie_config_access() or an exception handler
> >> rcar_pcie_aarch32_abort_handler().
> >>
> >> The rcar_pcie_aarch32_abort_handler() case is no longer applicable since
> >> commit 6e36203bc14c ("PCI: rcar: Use PCI_SET_ERROR_RESPONSE after read
> >> which triggered an exception"), which performs more accurate, controlled
> >> invocation of the exception, and a fixup.
> >>
> >> This leaves rcar_pcie_config_access() as the only call site from which
> >> rcar_pcie_wakeup() is called. The rcar_pcie_config_access() can only be
> >> called from the controller struct pci_ops .read and .write callbacks,
> >> and those are serialized in drivers/pci/access.c using raw spinlock
> >> 'pci_lock' . CONFIG_PCI_LOCKLESS_CONFIG is never set on this platform.
> >>
> >> Since the 'pci_lock' is a raw spinlock , and the 'pmsr_lock' is not a
> >> raw spinlock, this constellation triggers 'BUG: Invalid wait context'
> >> with CONFIG_PROVE_RAW_LOCK_NESTING=y .
> >>
> >> Remove the pmsr_lock to fix the locking.
> >>
> >> Fixes: a115b1bd3af0 ("PCI: rcar: Add L1 link state fix into data abort hook")
> >> Reported-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> >> Reported-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Thanks for your patch!
> >
> > Your reasoning above LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > My only worry is that PCI_LOCKLESS_CONFIG may be selected on non-x86
> > one day, breaking your assumptions.  IMHO, the mechanism behind this
> > config option, introduced in commit 714fe383d6c9bd95 ("PCI: Provide
> > Kconfig option for lockless config space accessors") looks very fragile
> > to me: it is intended to be selected by an architecture, if "all" low
> > level PCI configuration space accessors use their own serialization or
> > can operate completely lockless.  Usually we use the safer, inverted
> > approach (PCI_NOLOCKLESS_CONFIG), to be selected by all drivers that
> > do not adhere to the assumption.
> > But perhaps I am missing something, and this does not depend on
> > individual PCIe host drivers?
> >
> > Regardless, improving that is clearly out-of-scope for this patch...
>
> I could send a follow up patch which would add build-time assertion that
> PCI_LOCKLESS_CONFIG must not be selected for this driver to work. Would
> that be an option ?

Or simply just "depends on !CONFIG_PCI_LOCKLESS_CONFIG"?
What do the PCIe maintainers think?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

