Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2636429C9D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Oct 2020 21:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1830962AbgJ0UM1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Oct 2020 16:12:27 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37759 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1830961AbgJ0UM1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 16:12:27 -0400
Received: by mail-pg1-f193.google.com with SMTP id h6so1432003pgk.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2020 13:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WQGaMfOKa51GcrilLPDkwx8CUgU5xVnHdlwKgF5WGgo=;
        b=ttcVPykR26yUFCeKEMcnbNX0SQhp+mh0vtMiVYoCCEhJ3xkz+PgXQkuniqTrATFYBv
         7vxxxnL11JMRDc1Be7Plm0e6nfv4s5ApOQqrcCMGpgcrvDJ14BOOnZlmTAHSIr9gtKjs
         zg2+pIqI4/cEYEgHgvH24QvPhKHHNRc6pSyEZ5ip0+8MOKm/MT5+/NYzUcufOaBoS/V4
         N3VyuXleV/2lr+4MwakYmOZ3IjYIGG0AKgNsKXXBEq9JgAr+O78PgxcRa2XikSCZ/IxQ
         XtFXco33DH+wnXtpfgyFMb7w9PmGgPWL49+AiVm32PiggIMzOG6BQTcsP88jPiiMPLlb
         zpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WQGaMfOKa51GcrilLPDkwx8CUgU5xVnHdlwKgF5WGgo=;
        b=QVwglj/7TXGeN4RG/3rvnGBDbEqCeYLKbs5GEcQiuFlJYv7Npv8ePqQ8mzitJOHzDv
         oK8DgEDSNrFr/a0PE5bg66NFf74gh2Q/YoLNew372tzOZlmQ2tF+fT6nePFg4YRDXldQ
         g+a5V6nKLHNVR8xeuXyMWysuN9MAgG12nMPLTrlBaE0xvW9IsN53Xj9Or6pY+fp+YT+S
         j1iwMhGI65mJeuaKlAWwbl7yf9it+8YNzZS4pgZa91Sx9doLo7L1UEeR+Ys929Ylg7Qt
         E5juwf7DDW2iOqDHiYyNlwiJ0qufJzaa4CghGdtGWNDZWe9MvfZNi+7l1wFKphm7AlN2
         aJ1g==
X-Gm-Message-State: AOAM5337XqQ/UDuOccSRt22dpvpzXJlnrbGW3jzckhR/WK4gekLHM6Ys
        eOLs08fFlxbxcn8y6f5l5elypGsMJDqN46BRxdbjbg==
X-Google-Smtp-Source: ABdhPJwPqDQ/tmlAPegC727D8iMnDQfRVD28GyCfZv/XFpusr7xZJY54NBnztofKjPI9X9mssJshQXsjgznzIsmYWFU=
X-Received: by 2002:a63:5152:: with SMTP id r18mr3175051pgl.381.1603829546039;
 Tue, 27 Oct 2020 13:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200821194310.3089815-1-keescook@chromium.org>
 <20200821194310.3089815-14-keescook@chromium.org> <CAMuHMdUg0WJHEcq6to0-eODpXPOywLot6UD2=GFHpzoj_hCoBQ@mail.gmail.com>
 <CAMuHMdUw9KwC=EVB60yjg7mA7Fg-efOiKE7577p+uEdGJVS2OQ@mail.gmail.com>
 <CAMuHMdUJFEt3LxWHk73AsLDGhjzBvJGAML76UAxeGzb4zOf96w@mail.gmail.com>
 <CAMj1kXHXk3BX6mz6X_03sj_pSLj9Ck-=1S57tV3__N9JQOcDEw@mail.gmail.com>
 <CAMuHMdV4jKccjKkoj38EFC-5yN99pBvthFyrX81EG4GpassZwA@mail.gmail.com>
 <CAKwvOdkq3ZwW+FEui1Wtj_dWBevi0Mrt4fHa4oiMZTUZKOMi3g@mail.gmail.com> <CAMuHMdUDOzJbzf=0jom9dnSzkC+dkMdkyY_BOBMAivbJfF+Gmg@mail.gmail.com>
In-Reply-To: <CAMuHMdUDOzJbzf=0jom9dnSzkC+dkMdkyY_BOBMAivbJfF+Gmg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 27 Oct 2020 13:12:14 -0700
Message-ID: <CAKwvOdkE=ViGOhvoBRcV=9anjowC_vb4Vtefp9010+sC4c_+Sw@mail.gmail.com>
Subject: Re: [PATCH v6 13/29] arm64/build: Assert for unwanted sections
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Ingo Molnar <mingo@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Collingbourne <pcc@google.com>,
        James Morse <james.morse@arm.com>,
        Borislav Petkov <bp@suse.de>, Ingo Molnar <mingo@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        kernel-toolchains@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 27, 2020 at 12:25 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Nick,
>
> CC Josh
>
> On Mon, Oct 26, 2020 at 6:49 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > On Mon, Oct 26, 2020 at 10:44 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Mon, Oct 26, 2020 at 6:39 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > On Mon, 26 Oct 2020 at 17:01, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Mon, Oct 26, 2020 at 2:29 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > On Mon, Oct 26, 2020 at 1:29 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > I.e. including the ".eh_frame" warning. I have tried bisecting that
> > > > > > > warning (i.e. with be2881824ae9eb92 reverted), but that leads me to
> > > > > > > commit b3e5d80d0c48c0cc ("arm64/build: Warn on orphan section
> > > > > > > placement"), which is another red herring.
> > > > > >
> > > > > > kernel/bpf/core.o is the only file containing an eh_frame section,
> > > > > > causing the warning.
> >
> > When I see .eh_frame, I think -fno-asynchronous-unwind-tables is
> > missing from someone's KBUILD_CFLAGS.
> > But I don't see anything curious in kernel/bpf/Makefile, unless
> > cc-disable-warning is somehow broken.
>
> I tracked it down to kernel/bpf/core.c:___bpf_prog_run() being tagged
> with __no_fgcse aka __attribute__((optimize("-fno-gcse"))).
>
> Even if the function is trivially empty ("return 0;"), a ".eh_frame" section
> is generated.  Removing the __no_fgcse tag fixes that.

That's weird.  I feel pretty strongly that unless we're working around
a well understood compiler bug with a comment that links to a
submitted bug report, turning off rando compiler optimizations is a
terrible hack for which one must proceed straight to jail; do not pass
go; do not collect $200.  But maybe I'd feel differently for this case
given the context of the change that added it.  (Ard mentions
retpolines+orc+objtool; can someone share the relevant SHA if you have
it handy so I don't have to go digging?)  (I feel the same about there
being an empty asm(); statement in the definition of asm_volatile_goto
for compiler-gcc.h).  Might be time to "fix the compiler."

(It sounds like Arvind is both in agreement with my sentiment, and has
the root cause).

--
Thanks,
~Nick Desaulniers
