Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F08EA1B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2019 17:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfJ3Q1B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Oct 2019 12:27:01 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46057 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfJ3Q1A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Oct 2019 12:27:00 -0400
Received: by mail-io1-f67.google.com with SMTP id s17so3195610iol.12;
        Wed, 30 Oct 2019 09:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+uwntaunJvEfF6N2JBmOpTRxiy4nvBNTDpuqDzHj3b0=;
        b=jb8vok3svlRvK8XDUQ92351D1Ta07Su1zLqkfJQKRnlsMXqPFxg8GRu9c0GaiP+aZd
         O00jWQA1J4GoLIDboqupHxa6yXVKqnk+pq4vlQ+q00f5W5IrhfkxFHZX8N/ntFo4q1JS
         qwyTWdpovHYWbX3hcKDq/8CoqxMV3ZhOzTJjOhYU6yVFa5lEZH1YVGHg/0J2LbBOgnag
         jD8y4fZZKQtSQY9VMrx4L9WfzDGZVPQrSZKmj5fR/2QXBusoZIq2tZtkihkcQn2DU/Il
         JmM3egjeyeOhbOmhOj+Pj0pYidsadh79q38qZPLtbO3E3Wpxg2C0iQkMDlx9hSLVo5kG
         FMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+uwntaunJvEfF6N2JBmOpTRxiy4nvBNTDpuqDzHj3b0=;
        b=coc7DRcLoZ2sSVcFErCfdNDvkeomvMLb13mfLZGHU4zoRDfJsLU+0l42flfmaKS4vZ
         ICmcFk/FqFi5n4BSo8f/ZKT4kANdhuAeNkhCllctxlPabQ0ALKBbfoZYSMzL/Wz1bR+9
         P0ShtrF6CJULlhlXsf6NH1Ag+sor0u1QWN0f9NVyq9pebRTytyF3bTiUpTRaURmzPMiN
         UV/eyWmH2Gk+FnBx51Btd01MFsBQUxFvZ0qsxPVdPrC1oD9qUcPLKniPAmNBwBjvqIC5
         y9IjkfP3tiF8azumYWJvfdVOZ+tgTt+AtKx7M02ohPuNqMedBkRkZw1n9oqwoUdytzRX
         XZcA==
X-Gm-Message-State: APjAAAVmz9Q2NCP5RVuV8BVODqEkR6ay34ubV571bs+4ghOfz0YtzN+a
        HVONRuuP/X+8mATNAlCUq9zgRgngN3JKZPXU8y0=
X-Google-Smtp-Source: APXvYqyPBo5dvv8N1t+4tf6EegSpdd/Xproa15/OHfqG5GhOiT7Zv35Tr0Z+Y2zW0/n/0KMEaLZR6AhbyAug2k0gyFc=
X-Received: by 2002:a6b:7006:: with SMTP id l6mr648689ioc.298.1572452819891;
 Wed, 30 Oct 2019 09:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190620062246.2665-1-e5ten.arch@gmail.com> <20191029210250.17007-1-e5ten.arch@gmail.com>
 <aaec7b5b-3a58-f36e-74e6-5be0a6185c5b@ideasonboard.com>
In-Reply-To: <aaec7b5b-3a58-f36e-74e6-5be0a6185c5b@ideasonboard.com>
From:   Ethan Sommer <e5ten.arch@gmail.com>
Date:   Wed, 30 Oct 2019 12:26:49 -0400
Message-ID: <CAMEGPiq66grdRyioma7pdftFAFD7BmK0w788nBXhx1XHxopj=Q@mail.gmail.com>
Subject: Re: [PATCH v3] replace timeconst bc script with an sh script
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@suse.de>,
        Mark Rutland <mark.rutland@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Corey Minyard <cminyard@mvista.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> Running shellcheck on kernel/time/timeconst.sh produces the following
> warnings:
>
> shellcheck kernel/time/timeconst.sh
>
> In kernel/time/timeconst.sh line 11:
>         local i=1 j=0
>         ^-- SC2039: In POSIX sh, 'local' is undefined.
>
>
> In kernel/time/timeconst.sh line 20:
>         local i="$1" j="$2" k
>         ^-- SC2039: In POSIX sh, 'local' is undefined.
>
>
> In kernel/time/timeconst.sh line 34:
>         local i
>         ^-- SC2039: In POSIX sh, 'local' is undefined.
>
>
> In kernel/time/timeconst.sh line 44:
>         local i=0 j
>         ^-- SC2039: In POSIX sh, 'local' is undefined.
>
>
>
> Will this cause an issue for people running posix shells?
> Which shells have you tested your script on ?
While local is not part of POSIX, it is widely supported, including by
dash, and is used by many shell scripts in the kernel's build including
link-vmlinux.sh, however I can easily make the script work without local
by using unique variable names in each function and resetting all of
them at the beginning of the functions if that is desired instead of
local.
>
> Furthermore, I fear this conversion may not be suitable at present, as
> it produces potentially different results for CONFIG_HZ < 100
>
> (There may be more diffs, but I haven't yet compared a larger search space)
>
> using a quick script I put together to compare the output of
> timeconst.sh and timeconst.bc for a given CONFIG_HZ:
>
>
>  https://gist.github.com/kbingham/76e8718df7b7dc97361405cc1801a160
>
>
> $ for i in `seq 0 300`; do ./check-timeconst.sh $i; done
>
> produces a diff on almost every value 2 - 243
>
>    http://paste.ubuntu.com/p/wNggrfFZXB/
>
> Or rather 137 faults to be exact:
>
>  for i in `seq 0 250`; \
>         do ./check-timeconst.sh $i; \
>  done | grep -- "--- BC" | wc -l
>
>
> I think that might be considered a blocker to this implementation, or
> those values and the impact should certainly be investigated thoroughly.
>
> I haven't looked into detail into the change of any of those values, so
> I can not ascertain which one is more correct (though I suspect it's
> likely to be bc that will have the 'more correct' value)
>
> I would fear doing this in shell just isn't going to maintain the
> correct precision, which is likely a strong reason why bc was selected
> in the first place.
>
>
> If you can find the issue that causes this diff in your shell
> processing, and clarify or fix it - then it might be possible to gain
> some backing to the implementation, but even then it might become a
> shell specific precision issue ...
That definitely is a blocker, I will attempt to make this implementation
match the bc script for those values.
