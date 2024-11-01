Return-Path: <linux-renesas-soc+bounces-10258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97359B9146
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2024 13:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32DFDB226D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2024 12:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A27420B22;
	Fri,  1 Nov 2024 12:45:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F9FF9D9;
	Fri,  1 Nov 2024 12:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730465143; cv=none; b=KlQ1UPVMc3t9knyfCKgR68dUNucQD3+ewEWBVBf5//fUWWQlWgjwSFPXYVnrglLXvwhP/NZoAd+uwYqwqv02U9C1tVtBXDr2kHFytPzNNH/JPncnW6VslvlxxDejc0RiZUzXGwGZUxc4y2ktZtU8y3710FZYXb+WrbNibfx0H8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730465143; c=relaxed/simple;
	bh=kEjIhb3tbqRNoW6L6UTNS9w3FYCS3aVB2MN6ZaCBnMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRrlvn1xjtsd4JDRDslaot2V1+CB5WtYYT8lTvHOl83+qzQQGvwfsURBiyuTU1eRGR190+XFqJ4Jl0stbXLeMGxA7n85//JhsyIyN1UGy7D3p4tDFgovkDu1Hw96UhhJZ2IUuI8lGYwMcDSdRvZG3FiBbOTIWtwAhYa3+AMsPfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e3c3da5bcdso17934997b3.2;
        Fri, 01 Nov 2024 05:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730465135; x=1731069935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQQlY8mlkuydo2nMoxWgxP1dDvcaUCqu6xgh/ET5fr8=;
        b=wD6HIvKnviD1kjQ1YgM07NU95Oqnp/m1Xe9kBFlFRhOy4PQnfW1lAkITG2Gb1IUe2f
         uvJeyImW/9GVJyhYfOIAiXlEUd0EX4xdPmTu7SBwEA4NWbG8RRMzAGFD1wM2eN23bDLp
         3fCaEwCkkvkjz/KG2u1lytXbTYRjt9mEO+qYeHlHKzoW0qBMFDuSYQi1cRprN+7FhzT8
         /EJjHrifmW/REwbHDYZ0LLhCC0IoQmALZfa8KejlvkfEaatTPAWxb4IPTw/olqH1iu0R
         RRcbeIijYJtx5WELJw5ILHTVeCu5DVTSL1ArBmsBfvrkaQO8x3CfSa9C0lAEvq7H44AM
         X9dg==
X-Forwarded-Encrypted: i=1; AJvYcCVNiiHV19ejD2x+dQj/2CQnkHtYOOp2FsYA/GyNdEwAxbBjJAhNcUSpQDl9t3hTgwXWzG6EdPET/Fr2+NVw@vger.kernel.org, AJvYcCVxn0Qf2+Fcvr07nNYLh318Rf4HwPylN5TnBfgWzqi1y9e4wVI4oE8A7EAZU9LCyMWMlPu3TajSTZUv@vger.kernel.org, AJvYcCXGzposJCtUcM/gb3oR/WaszJvLR/yGnflm4cNntZKl9IaihhHvue2CuLpaMcBlHieERKYAPX24N+6LsSg0fTXhHjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3W+wMc+mGrsaVlV3n+0VR56XMncum8q+V9zxe0GdyUGFJOpso
	G3IeCW3xvPOoRtoCFTgpWqhXwp1eCRNTBwOiZHBv1xkYaYmVO3ViUaOSBsu2
X-Google-Smtp-Source: AGHT+IEdgD6wLaqnpERXCmHmLcJNdMxdx2wduOWYhHjbIkWgVHp17J5enj4V2jE5Oa6waRFzGIOaKA==
X-Received: by 2002:a05:690c:62c6:b0:6e5:9bc2:53a0 with SMTP id 00721157ae682-6ea3b9831c7mr126795867b3.41.1730465135179;
        Fri, 01 Nov 2024 05:45:35 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55acbecfsm6687067b3.1.2024.11.01.05.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 05:45:34 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e3c3da5bcdso17934247b3.2;
        Fri, 01 Nov 2024 05:45:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3OluLii4bp6kcdCX0EKlJpoOxZBJBUz7CVI5MAyTWUP7IW0KQeEbt37rbRi/amuyxdQtyiigcGu3q/8cf5CW5TV8=@vger.kernel.org, AJvYcCVmSITtrWsRbbY8xhnLo2ooJm1dvZ6pRag2/eFhCXkAYafeYNNbL/uVI+sZbOI1DN04vmwAuI51vN121FCl@vger.kernel.org, AJvYcCVsCY8S+1mYL/VkJDph+B+KLwRytgOxPERgfj3unBVZ+0EZIRmMEfj7onyGGzM8k70F0Lkks9YV5qVb@vger.kernel.org
X-Received: by 2002:a05:690c:d8e:b0:6e3:6467:f46c with SMTP id
 00721157ae682-6ea3b895ec3mr120309497b3.14.1730465133456; Fri, 01 Nov 2024
 05:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008220624.551309-1-quic_obabatun@quicinc.com>
 <20241008220624.551309-2-quic_obabatun@quicinc.com> <CAMuHMdUXj4QiSKdhf61xdDeu94=Hv0BXuCxykDpQwdY81_h2vw@mail.gmail.com>
 <8c987a26-d499-4ceb-905e-750bb24fcb08@quicinc.com>
In-Reply-To: <8c987a26-d499-4ceb-905e-750bb24fcb08@quicinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Nov 2024 13:45:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW050DuwkLuosiiz2Yt7d0Lq+C8jFO0+O0qbwsjmyf3hA@mail.gmail.com>
Message-ID: <CAMuHMdW050DuwkLuosiiz2Yt7d0Lq+C8jFO0+O0qbwsjmyf3hA@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] of: reserved_mem: Restruture how the reserved
 memory regions are processed
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Cc: robh@kernel.org, aisheng.dong@nxp.com, andy@black.fi.intel.com, 
	catalin.marinas@arm.com, devicetree@vger.kernel.org, hch@lst.de, 
	iommu@lists.linux.dev, kernel@quicinc.com, klarasmodin@gmail.com, 
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, 
	quic_ninanaik@quicinc.com, robin.murphy@arm.com, saravanak@google.com, 
	will@kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oreoluwa,

On Thu, Oct 31, 2024 at 10:06=E2=80=AFPM Oreoluwa Babatunde
<quic_obabatun@quicinc.com> wrote:
> On 10/29/2024 5:41 AM, Geert Uytterhoeven wrote:
> > On Wed, Oct 9, 2024 at 12:08=E2=80=AFAM Oreoluwa Babatunde
> > <quic_obabatun@quicinc.com> wrote:
> >> Reserved memory regions defined in the devicetree can be broken up int=
o
> >> two groups:
> >> i) Statically-placed reserved memory regions
> >> i.e. regions defined with a static start address and size using the
> >>      "reg" property.
> >> ii) Dynamically-placed reserved memory regions.
> >> i.e. regions defined by specifying an address range where they can be
> >>      placed in memory using the "alloc_ranges" and "size" properties.
> >>
> >> These regions are processed and set aside at boot time.
> >> This is done in two stages as seen below:
> >>
> >> Stage 1:
> >> At this stage, fdt_scan_reserved_mem() scans through the child nodes o=
f
> >> the reserved_memory node using the flattened devicetree and does the
> >> following:
> >>
> >> 1) If the node represents a statically-placed reserved memory region,
> >>    i.e. if it is defined using the "reg" property:
> >>    - Call memblock_reserve() or memblock_mark_nomap() as needed.
> >>    - Add the information for that region into the reserved_mem array
> >>      using fdt_reserved_mem_save_node().
> >>      i.e. fdt_reserved_mem_save_node(node, name, base, size).
> >>
> >> 2) If the node represents a dynamically-placed reserved memory region,
> >>    i.e. if it is defined using "alloc-ranges" and "size" properties:
> >>    - Add the information for that region to the reserved_mem array wit=
h
> >>      the starting address and size set to 0.
> >>      i.e. fdt_reserved_mem_save_node(node, name, 0, 0).
> >>    Note: This region is saved to the array with a starting address of =
0
> >>    because a starting address is not yet allocated for it.
> >>
> >> Stage 2:
> >> After iterating through all the reserved memory nodes and storing thei=
r
> >> relevant information in the reserved_mem array,fdt_init_reserved_mem()=
 is
> >> called and does the following:
> >>
> >> 1) For statically-placed reserved memory regions:
> >>    - Call the region specific init function using
> >>      __reserved_mem_init_node().
> >> 2) For dynamically-placed reserved memory regions:
> >>    - Call __reserved_mem_alloc_size() which is used to allocate memory
> >>      for each of these regions, and mark them as nomap if they have th=
e
> >>      nomap property specified in the DT.
> >>    - Call the region specific init function.
> >>
> >> The current size of the resvered_mem array is 64 as is defined by
> >> MAX_RESERVED_REGIONS. This means that there is a limitation of 64 for
> >> how many reserved memory regions can be specified on a system.
> >> As systems continue to grow more and more complex, the number of
> >> reserved memory regions needed are also growing and are starting to hi=
t
> >> this 64 count limit, hence the need to make the reserved_mem array
> >> dynamically sized (i.e. dynamically allocating memory for the
> >> reserved_mem array using membock_alloc_*).
> >>
> >> On architectures such as arm64, memory allocated using memblock is
> >> writable only after the page tables have been setup. This means that i=
f
> >> the reserved_mem array is going to be dynamically allocated, it needs =
to
> >> happen after the page tables have been setup, not before.
> >>
> >> Since the reserved memory regions are currently being processed and
> >> added to the array before the page tables are setup, there is a need t=
o
> >> change the order in which some of the processing is done to allow for
> >> the reserved_mem array to be dynamically sized.
> >>
> >> It is possible to process the statically-placed reserved memory region=
s
> >> without needing to store them in the reserved_mem array until after th=
e
> >> page tables have been setup because all the information stored in the
> >> array is readily available in the devicetree and can be referenced at
> >> any time.
> >> Dynamically-placed reserved memory regions on the other hand get
> >> assigned a start address only at runtime, and hence need a place to be
> >> stored once they are allocated since there is no other referrence to t=
he
> >> start address for these regions.
> >>
> >> Hence this patch changes the processing order of the reserved memory
> >> regions in the following ways:
> >>
> >> Step 1:
> >> fdt_scan_reserved_mem() scans through the child nodes of
> >> the reserved_memory node using the flattened devicetree and does the
> >> following:
> >>
> >> 1) If the node represents a statically-placed reserved memory region,
> >>    i.e. if it is defined using the "reg" property:
> >>    - Call memblock_reserve() or memblock_mark_nomap() as needed.
> >>
> >> 2) If the node represents a dynamically-placed reserved memory region,
> >>    i.e. if it is defined using "alloc-ranges" and "size" properties:
> >>    - Call __reserved_mem_alloc_size() which will:
> >>      i) Allocate memory for the reserved region and call
> >>      memblock_mark_nomap() as needed.
> >>      ii) Call the region specific initialization function using
> >>      fdt_init_reserved_mem_node().
> >>      iii) Save the region information in the reserved_mem array using
> >>      fdt_reserved_mem_save_node().
> >>
> >> Step 2:
> >> 1) This stage of the reserved memory processing is now only used to ad=
d
> >>    the statically-placed reserved memory regions into the reserved_mem
> >>    array using fdt_scan_reserved_mem_reg_nodes(), as well as call thei=
r
> >>    region specific initialization functions.
> >>
> >> 2) This step has also been moved to be after the page tables are
> >>    setup. Moving this will allow us to replace the reserved_mem
> >>    array with a dynamically sized array before storing the rest of
> >>    these regions.
> >>
> >> Signed-off-by: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
> > Thanks for your patch, which is now commit 8a6e02d0c00e7b62
> > ("of: reserved_mem: Restructure how the reserved memory regions
> > are processed") in dt-rh/for-next.
> >
> > I have bisected a boot issue on RZ/Five to this commit.
> > With "earlycon keep_bootcon" (else there is no output):
> >
> >     Oops - store (or AMO) access fault [#1]
> >     CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted
> > 6.12.0-rc1-00015-g8a6e02d0c00e #201
> >     Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> >     epc : __memset+0x60/0x100
> >      ra : __dma_alloc_from_coherent+0x150/0x17a
> >     epc : ffffffff8062d2bc ra : ffffffff80053a94 sp : ffffffc60000ba20
> >      gp : ffffffff812e9938 tp : ffffffd601920000 t0 : ffffffc6000d0000
> >      t1 : 0000000000000000 t2 : ffffffffe9600000 s0 : ffffffc60000baa0
> >      s1 : ffffffc6000d0000 a0 : ffffffc6000d0000 a1 : 0000000000000000
> >      a2 : 0000000000001000 a3 : ffffffc6000d1000 a4 : 0000000000000000
> >      a5 : 0000000000000000 a6 : ffffffd601adacc0 a7 : ffffffd601a841a8
> >      s2 : ffffffd6018573c0 s3 : 0000000000001000 s4 : ffffffd6019541e0
> >      s5 : 0000000200000022 s6 : ffffffd6018f8410 s7 : ffffffd6018573e8
> >      s8 : 0000000000000001 s9 : 0000000000000001 s10: 0000000000000010
> >      s11: 0000000000000000 t3 : 0000000000000000 t4 : ffffffffdefe62d1
> >      t5 : 000000001cd6a3a9 t6 : ffffffd601b2aad6
> >     status: 0000000200000120 badaddr: ffffffc6000d0000 cause: 000000000=
0000007
> >     [<ffffffff8062d2bc>] __memset+0x60/0x100
> >     [<ffffffff80053e1a>] dma_alloc_from_global_coherent+0x1c/0x28
> >     [<ffffffff80053056>] dma_direct_alloc+0x98/0x112
> >     [<ffffffff8005238c>] dma_alloc_attrs+0x78/0x86
> >     [<ffffffff8035fdb4>] rz_dmac_probe+0x3f6/0x50a
> >     [<ffffffff803a0694>] platform_probe+0x4c/0x8a
> >     [<ffffffff8039ea16>] really_probe+0xe4/0x1c8
> >     [<ffffffff8039ebc4>] __driver_probe_device+0xca/0xce
> >     [<ffffffff8039ec48>] driver_probe_device+0x34/0x92
> >     [<ffffffff8039ede8>] __driver_attach+0xb4/0xbe
> >     [<ffffffff8039ce58>] bus_for_each_dev+0x60/0xa0
> >     [<ffffffff8039e26a>] driver_attach+0x1a/0x22
> >     [<ffffffff8039dc20>] bus_add_driver+0xa4/0x184
> >     [<ffffffff8039f65c>] driver_register+0x8a/0xb4
> >     [<ffffffff803a051c>] __platform_driver_register+0x1c/0x24
> >     [<ffffffff808202f6>] rz_dmac_driver_init+0x1a/0x22
> >     [<ffffffff80800ef6>] do_one_initcall+0x64/0x134
> >     [<ffffffff8080122e>] kernel_init_freeable+0x200/0x202
> >     [<ffffffff80638126>] kernel_init+0x1e/0x10a
> >     [<ffffffff8063d58e>] ret_from_fork+0xe/0x18
> >     Code: 1007 82b3 40e2 0797 0000 8793 00e7 8305 97ba 8782 (b023) 00b2
> >     ---[ end trace 0000000000000000 ]---
> >     Kernel panic - not syncing: Fatal exception in interrupt
> >     ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]=
---
> >
> > Nothing really stands out in the kernel log, except for a delayed
> > initialization of the reserved mem nodes (they are the same
> > before/after):
> >
> >  printk: debug: ignoring loglevel setting.
> > -OF: reserved mem: 0x0000000000030000..0x000000000003ffff (64 KiB)
> > nomap non-reusable mmode_resv0@30000
> > -OF: reserved mem: 0x0000000000040000..0x000000000004ffff (64 KiB)
> > nomap non-reusable mmode_resv1@40000
> > -OF: reserved mem: 0x0000000044000000..0x000000004403ffff (256 KiB)
> > nomap non-reusable mmode_resv3@44000000
> > -OF: reserved mem: 0x0000000044040000..0x000000004405ffff (128 KiB)
> > nomap non-reusable mmode_resv2@44040000
> > +earlycon: scif0 at MMIO 0x000000001004b800 (options '115200n8')
> > +printk: legacy bootconsole [scif0] enabled
> > +printk: debug: skip boot console de-registration.
> >  Reserved memory: created DMA memory pool at 0x0000000058000000, size 1=
28 MiB
> >  OF: reserved mem: initialized node pma_resv0@58000000, compatible id
> > shared-dma-pool
> >  OF: reserved mem: 0x0000000058000000..0x000000005fffffff (131072 KiB)
> > nomap non-reusable pma_resv0@58000000
> > +OF: reserved mem: 0x0000000000030000..0x000000000003ffff (64 KiB)
> > nomap non-reusable mmode_resv0@30000
> > +OF: reserved mem: 0x0000000000040000..0x000000000004ffff (64 KiB)
> > nomap non-reusable mmode_resv1@40000
> > +OF: reserved mem: 0x0000000044040000..0x000000004405ffff (128 KiB)
> > nomap non-reusable mmode_resv2@44040000
> > +OF: reserved mem: 0x0000000044000000..0x000000004403ffff (256 KiB)
> > nomap non-reusable mmode_resv3@44000000
> >  Zone ranges:
> >    DMA32    [mem 0x0000000048000000-0x000000007fffffff]
> >    Normal   empty
> >
> > Reverting commits 00c9a452a235c61f ("of: reserved_mem: Add code to
> > dynamically allocate reserved_mem array") and 8a6e02d0c00e7b62 fixes
> > the issue.
> >
> > root@smarc-rzfive:/sys/firmware/devicetree/base/reserved-memory# ls -l
> > total 0
> > -r--r--r-- 1 root root  4 Oct 29 12:37 #address-cells
> > -r--r--r-- 1 root root  4 Oct 29 12:37 #size-cells
> > drwxr-xr-x 2 root root  0 Oct 29 12:37 mmode_resv0@30000
> > drwxr-xr-x 2 root root  0 Oct 29 12:37 mmode_resv1@40000
> > drwxr-xr-x 2 root root  0 Oct 29 12:37 mmode_resv2@44040000
> > drwxr-xr-x 2 root root  0 Oct 29 12:37 mmode_resv3@44000000
> > -r--r--r-- 1 root root 16 Oct 29 12:37 name
> > drwxr-xr-x 2 root root  0 Oct 29 12:37 pma_resv0@58000000
> > -r--r--r-- 1 root root  0 Oct 29 12:37 ranges

> Thanks for reaching out and sorry you're seeing this issue.
>
> Please can you provide reproduction steps? I tried booting up
> risc-v arch with qemu but did not run into the issue you are
> seeing.

It indeed doesn't happen on other RISC-V platforms (tried MPFS/Icicle).
RZ/Five is special in that it is DMA non-coherent, and the crash
happens in dma_alloc_from_global_coherent().
According to the logs, the DMA pool at 0x58000000 is still being created.
I'll try to debug this further next week...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

