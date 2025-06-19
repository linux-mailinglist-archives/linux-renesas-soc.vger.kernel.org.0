Return-Path: <linux-renesas-soc+bounces-18547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D6EAE09C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 17:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4324C7AFCD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E8C21CA0C;
	Thu, 19 Jun 2025 15:07:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50E1FE44D;
	Thu, 19 Jun 2025 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345675; cv=none; b=eyuglXv8yj8WaMf4PVNuEU3q6FeE+b7+kPE/AmgijgOvOD6k0HcWRwWrXY86bkHLiZVe57hW3cxbFBPgcwj6JvYLFh7WWCB8cR8I2YwHWHWrOTJ9VwKFzeyBQ1BJ970YkrI9iQzIHLTEqgjOnfmJtvo4khcGwF5kBpo9AcNSfPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345675; c=relaxed/simple;
	bh=EgW9uuCj1TkY834i13v0eLe0br95u+N1morseH8cszs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OP5l77G86j2RN5tiYDB6fkxj3L0I/ZY6KsCKPr+7X4SYZ19eNHTxL/MA7hxgyWyqw/Zimga1ohcQ57qKbC5BxegQBkP/cy3aI91n9WvUMnbKB1sonT2PV/UkrLHWgJd11ya7N9wAb9Iwea89FiE9zpYMKdN+EaHI14gjMA61C0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a442a3a2bfso13203461cf.1;
        Thu, 19 Jun 2025 08:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345671; x=1750950471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXr4DkxQyQe6cO2hVmMV/1vKr4WFSQJXwlWoVF3SQUw=;
        b=M7QhSWaa7CVaQ0l0o2AfYiX8nbD2NfzQIxMifXExZfxL4P8PSQiETvtcEmuF28FtYq
         SJqb0Bi6xvyWEFb5GuIfWy089/4Dc96vhF5yxZ7FS1mv5PmSwmNbOWTqxIKrLayyau/R
         Az9FHXtDMMs/sCItLmVRTk1sRMqR98W8xQwDOPdB5SWiScPKzcdB2BTGsF8UCFNyzk23
         MlMktSeT3dvxIoRHFG0x3sVgy2JEOjYonAhXxtEjLErEIMZFrCuKFn7KFrjDd2tyOzT9
         r2cDUD56Pih2VCclnGo1E9AYMRJ7b2bRPRvQBnEPaizAxwee8vtePA/D+61LATua3ykB
         r7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxqaDZL5YjenojoXD4z5OFtxJWEPloIbdyQPLnGtqF0Una+NwegrFUAO3jlDXUDDXY5I+/wq6/fcajg88=@vger.kernel.org, AJvYcCVmps3S5QRe8Bt2DP3aPBw11xCncWNINUZx3G6ycf8CsdA2Nr2+WHMx/mc5vt1XyzE7rDnP9dMVSWjsYPA=@vger.kernel.org, AJvYcCXLGK+NbTbiZ/NtMWDIRGtw7N3qHnyubQSXQ21PdTFfY/p4GWhcaadwybUwjkjPNk3y038V6amAqCyvohAfK7rK0qI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz51RL/A5tRSFn8szPcyS7nh6p0smgljB6Mc8hq4rkOA3i2315f
	ycMNnzMj5ZHiEqIoXCou43b+aReDaBgVJGzFenASf03+74AHAf6zddnRb+nppF0N
X-Gm-Gg: ASbGnctO7LcHaB/03pU0802Kerq8HaacUBCT/5VT1KlneB3uoRQANS+gPaP01l4g93M
	bfK18iq5FROS/5lvPGwdpHlMCui6ABITKiUEfWC0CV4u5ZmBKDkOuBmE/o4PrEXuMtzc4vF2Pe2
	PSK9fiTbnDADk8X0KrD200wCgsfOpGNpKxN9nP8kSJtoBO2c6l+eC3L9mRFFSHcJUt8piuwp9L+
	/tq9ANuwUqzRPuo85iJJBRTvG9eVnYXi1BXyBiZ41FBuIGZ2XxXCR+afxflkgIBaeslHnTD9Xu5
	RnXEDwQu2PVXHILs9nti3+phCd7l1uq5d7V6TsEtppale12cwhJYYG0SYou0q/FK2mXp39BszRw
	XP3yH4oZ13Il5hju3Nu2oKi56n7PY
X-Google-Smtp-Source: AGHT+IH2VQoxeZ4MlsXLGXW1iYTwh8bc5zogZbpBSrotexv/yblbvyqLA2vsGoKnzGPmRJFSZUE2+w==
X-Received: by 2002:a05:622a:1887:b0:4a7:22fe:8ec5 with SMTP id d75a77b69052e-4a76d467930mr62973931cf.1.1750345671232;
        Thu, 19 Jun 2025 08:07:51 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7785a9e82sm264491cf.44.2025.06.19.08.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:07:50 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d3dd14a7edso151552285a.2;
        Thu, 19 Jun 2025 08:07:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWT5pyUW8IKs97rkdkC1Ruj8dTEElneV1Lo0NXWG8xUsW2pF3NlaH/3XOZG4ReBQ3xx/5JVY1vT3FEcLJg=@vger.kernel.org, AJvYcCWVv9DlYfI5T/3+cSlROf9zO0A4FGbQg2Qy5OBE+aonFn4aNj68mRI6HEb8btxqgne7ijh0W3kBSw9F5lJWSIaX3uY=@vger.kernel.org, AJvYcCWeqWld8whZXkwfOCpZs8hJkf0wfEVlo/CaxdvL47I+L+Bcp+/HxPy8KyVm4GjKUTFSttqy652Q4/4p3QM=@vger.kernel.org
X-Received: by 2002:a05:620a:319b:b0:7d3:8566:e9ad with SMTP id
 af79cd13be357-7d3c6cda22amr2925901685a.34.1750345669885; Thu, 19 Jun 2025
 08:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
 <bdd989b4-a572-44c2-ae7b-2c445c09fd7a@linaro.org> <d05f2c03-fa86-4fc6-9b81-1a7b5592c2e8@nvidia.com>
 <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com> <kjotbgwqlvl4uv4bcynqsiynf4dsoplw3szaqlcfd7rm7k633p@64c552v3llz2>
In-Reply-To: <kjotbgwqlvl4uv4bcynqsiynf4dsoplw3szaqlcfd7rm7k633p@64c552v3llz2>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 17:07:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXt0AoHnCitc6GNUuT_THRvy17c5uq5geD0ubQ12FONZw@mail.gmail.com>
X-Gm-Features: Ac12FXyqjFu03K5SyvIX5tcmxTFfiSwi7mDocCZBFa2GT0By0yuMp0VwoZlcHKg
Message-ID: <CAMuHMdXt0AoHnCitc6GNUuT_THRvy17c5uq5geD0ubQ12FONZw@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 16:30, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, Jun 12, 2025 at 02:34:32PM +0200, Geert Uytterhoeven wrote:
> > On Thu, 12 Jun 2025 at 14:20, Jon Hunter <jonathanh@nvidia.com> wrote:
> > > On 23/05/2025 12:54, Krzysztof Kozlowski wrote:
> > > > On 23/05/2025 13:39, Geert Uytterhoeven wrote:
> > > >> On Tue, 6 May 2025 at 12:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >>>
> > > >>> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
> > > >>> ensure the Ethernet driver is available early in the boot process. This
> > > >>> is necessary for platforms mounting the root filesystem via NFS, as the
> > > >>> driver must be available before the root filesystem is accessed.
> > > >>>
> > > >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >>> ---
> > > >>> With this change, the Renesas RZ/V2H EVK board can boot from NFS
> > > >>> which has the DWMAC IP.
> > > >>
> > > >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >> i.e. will queue in renesas-devel for v6.17.
> > > >
> > > > With my Nacked, please.
> > >
> > > I was surprised to see this change in -next. We also use NFS for testing
> > > and we use the dwmac drivers. To date we are explictly building these
> > > drivers into the initramfs but I noticed that that is now failing
> > > because this driver is no longer a module by default. This is easy for
> >
> > Oops, sorry for that...
> >
> > > us to fix.
> >
> > Good ;-)
> >
> > > I do agree that if we start to build every networking driver into the
> > > kernel it is going to bloat. Yes I do see the kernel image growing
> > > regardless of this, but nonetheless it seems better to just build as a
> > > module IMO.
> >
> > Not _every_ networking driver, of course.  AFAIK, making network
> > drivers built-in for systems where development is done using nfsroot
> > has always been acceptable for the arm64 defconfig before.  For things
> > not critical for booting, modular is indeed the preferred way.
>
> Last time I tried to merge something like this I was told that we
> shouldn't bloat the kernel for everyone just for our own convenience. I
> tend to agree with this now. It's trivial to make local adjustments for
> things like this. In fact, that's what I do all the time. I will use
> defconfig as a base line and if I want the convenience of having network
> drivers included because I don't want to update the initramfs every time
> I update the kernel, I'll just change the driver to built-in in my local
> .config.
>
> I think of the defconfig as more of a reference for what a typical
> development system would need. So it gives you reasonable build coverage
> and such for a wide variety of boards.
>
> If we start building too many things into the kernel, then at some point
> it's going to become uselessly large for everyone. That's essentially
> trading everyone's convenience for your own.

As discussed with Arnd on #armlinux, I will drop this patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

