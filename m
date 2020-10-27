Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F5729CA25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Oct 2020 21:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409133AbgJ0U2Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Oct 2020 16:28:16 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:51462 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S372839AbgJ0U2Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 16:28:16 -0400
Received: by mail-pj1-f66.google.com with SMTP id a17so1388012pju.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Oct 2020 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3vH0jRuNNXMpR78OFAIDC7FB9qzF1hw7amK8Jt/4qu8=;
        b=VXmwLNHkl1EQMa3ojhAOzOZ1iCXl1R0QLtIn5hFJWYUl1BY1w1EjDDacbbwVF2fbFV
         1jtKFk1JIx4U0zv05G+t6hzW/0UvF/d3Fu7tBVQud1Qm1aR2LBe0UMmY3v4DsSo6prOY
         p1GjHdRLZJZ/wZtM5IF/CC2SQmPpHuDgoqQG2+AtYQ2RFFokVeKDbV8YPskCuRfqdD2z
         5oKrHpJLmiK9jcEH24Fqe64u3TgRdHyqXvPx7KH/LmTce8SPunhfV/rw7HsCHjFilGHK
         fuKigJutJyb3OE5ZFmUIUMVigMq0aNYvfWQb9YeQnriQbq1oen9xjESap/Q6vNOH1ryI
         vg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3vH0jRuNNXMpR78OFAIDC7FB9qzF1hw7amK8Jt/4qu8=;
        b=kwA2i+VaC25gRT4t/BXwCtVIng+Nvej29WICt4c4LR+XamsyS+dzLHPhfsC9/0uo3v
         2Hdr2HCmTsN8+9b2WOOtah0JwVp1rxZ/nbhROG8l5OllyBmMfGnUpOGdRXuJNU/P5FzR
         4XilKSUouA6yBu/YdOA+fy25g3Y3liZ+wwQGBHWE1wURw2cmaX2uVG9NWskgWlnVFinM
         7NLrORTL36C02CFi/gIay2V6BRgLWvavZijZfnO9qDkVUc56P4E10ZhedJJJhDVS4mQS
         hMx+jnut9SAvMJbseiBbGqSfuF00Tp382RtazXNFsH4y9GYI+f7FaRoRK1sFrRmErnaA
         HBHQ==
X-Gm-Message-State: AOAM533fOhN+bLmJ7Otaf75FXDxSK28X3UDpVs4kusuf96UY9O2VRldc
        fAcGzJEasj1y6lMTt9a2gZYhiWTkSwwVK8Xs8OEAAg==
X-Google-Smtp-Source: ABdhPJwtWq+fPDoXFMIEUSHj2IQQyPW/GQMita0JdCsSRf1LUuJr91DBxmx+m/1QfLVp6NmiRz0L4v6uJ7TN9TYFE78=
X-Received: by 2002:a17:902:db82:b029:d6:3fe4:9825 with SMTP id
 m2-20020a170902db82b02900d63fe49825mr3848830pld.29.1603830494061; Tue, 27 Oct
 2020 13:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200821194310.3089815-1-keescook@chromium.org>
 <20200821194310.3089815-14-keescook@chromium.org> <CAMuHMdUg0WJHEcq6to0-eODpXPOywLot6UD2=GFHpzoj_hCoBQ@mail.gmail.com>
 <CAMuHMdUw9KwC=EVB60yjg7mA7Fg-efOiKE7577p+uEdGJVS2OQ@mail.gmail.com>
 <CAMuHMdUJFEt3LxWHk73AsLDGhjzBvJGAML76UAxeGzb4zOf96w@mail.gmail.com>
 <CAMj1kXHXk3BX6mz6X_03sj_pSLj9Ck-=1S57tV3__N9JQOcDEw@mail.gmail.com>
 <CAMuHMdV4jKccjKkoj38EFC-5yN99pBvthFyrX81EG4GpassZwA@mail.gmail.com>
 <CAKwvOdkq3ZwW+FEui1Wtj_dWBevi0Mrt4fHa4oiMZTUZKOMi3g@mail.gmail.com>
 <CAMuHMdUDOzJbzf=0jom9dnSzkC+dkMdkyY_BOBMAivbJfF+Gmg@mail.gmail.com>
 <CAKwvOdkE=ViGOhvoBRcV=9anjowC_vb4Vtefp9010+sC4c_+Sw@mail.gmail.com> <CAMj1kXEhcQ_ngNVWddV76NqEz6d0tDhfStYGd5diydefzVLvdQ@mail.gmail.com>
In-Reply-To: <CAMj1kXEhcQ_ngNVWddV76NqEz6d0tDhfStYGd5diydefzVLvdQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 27 Oct 2020 13:28:02 -0700
Message-ID: <CAKwvOdm9kuKoVnQoVo7T91gRb9QiCTp2G_PnwbdPM=o710Lx5A@mail.gmail.com>
Subject: Re: [PATCH v6 13/29] arm64/build: Assert for unwanted sections
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

(+ right linux-toolchains mailing list, apologies for adding the wrong
one, I'm forever doomed to have gmail autocomplete to the wrong one
now that I've sent to it before)

On Tue, Oct 27, 2020 at 1:15 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Tue, 27 Oct 2020 at 21:12, Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Tue, Oct 27, 2020 at 12:25 PM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > >
> > > Hi Nick,
> > >
> > > CC Josh
> > >
> > > On Mon, Oct 26, 2020 at 6:49 PM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > > On Mon, Oct 26, 2020 at 10:44 AM Geert Uytterhoeven
> > > > <geert@linux-m68k.org> wrote:
> > > > > On Mon, Oct 26, 2020 at 6:39 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > > On Mon, 26 Oct 2020 at 17:01, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > On Mon, Oct 26, 2020 at 2:29 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > > On Mon, Oct 26, 2020 at 1:29 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > > > I.e. including the ".eh_frame" warning. I have tried bisecting that
> > > > > > > > > warning (i.e. with be2881824ae9eb92 reverted), but that leads me to
> > > > > > > > > commit b3e5d80d0c48c0cc ("arm64/build: Warn on orphan section
> > > > > > > > > placement"), which is another red herring.
> > > > > > > >
> > > > > > > > kernel/bpf/core.o is the only file containing an eh_frame section,
> > > > > > > > causing the warning.
> > > >
> > > > When I see .eh_frame, I think -fno-asynchronous-unwind-tables is
> > > > missing from someone's KBUILD_CFLAGS.
> > > > But I don't see anything curious in kernel/bpf/Makefile, unless
> > > > cc-disable-warning is somehow broken.
> > >
> > > I tracked it down to kernel/bpf/core.c:___bpf_prog_run() being tagged
> > > with __no_fgcse aka __attribute__((optimize("-fno-gcse"))).
> > >
> > > Even if the function is trivially empty ("return 0;"), a ".eh_frame" section
> > > is generated.  Removing the __no_fgcse tag fixes that.
> >
> > That's weird.  I feel pretty strongly that unless we're working around
> > a well understood compiler bug with a comment that links to a
> > submitted bug report, turning off rando compiler optimizations is a
> > terrible hack for which one must proceed straight to jail; do not pass
> > go; do not collect $200.  But maybe I'd feel differently for this case
> > given the context of the change that added it.  (Ard mentions
> > retpolines+orc+objtool; can someone share the relevant SHA if you have
> > it handy so I don't have to go digging?)
>
> commit 3193c0836f203a91bef96d88c64cccf0be090d9c
> Author: Josh Poimboeuf <jpoimboe@redhat.com>
> Date:   Wed Jul 17 20:36:45 2019 -0500
>
>     bpf: Disable GCC -fgcse optimization for ___bpf_prog_run()
>
> has
>
> Fixes: e55a73251da3 ("bpf: Fix ORC unwinding in non-JIT BPF code")
>
> and mentions objtool and CONFIG_RETPOLINE.

Thanks for the context.  It might be time to revisit the above commit.
If I revert it (small conflict that's easy to fixup),
kernel/bpf/core.o builds cleanly with defconfig+GCC-9.3, so maybe
obtool did get smart enough to handle that case?  Probably regresses
the performance of that main dispatch loop for BPF, but not sure what
folks are expecting when retpolines are enabled.
-- 
Thanks,
~Nick Desaulniers
