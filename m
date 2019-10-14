Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDB60D5CC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2019 09:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbfJNHy0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Oct 2019 03:54:26 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:34620 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728854AbfJNHyZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Oct 2019 03:54:25 -0400
Received: by mail-oi1-f173.google.com with SMTP id 83so13007076oii.1;
        Mon, 14 Oct 2019 00:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TuyHnDK7WVcocxDHYrAOA7DNjofgmAZgImBsdQATSMU=;
        b=YKi3VFNavAbk32IcnSeOmT52wpHEKAKgpUVQvj5uor8HtjGnYVwZ/ji9VPt7HF63KS
         kMGGHi3dtAJwb9zZzxgZczXc4oiVTpnZAKBLFioLWE+OAC1n+W9fwkTh7KLA1KaSl7A9
         S0PKZokxJzp1ku0YmVZTCl5ff643WvizzOaqyN4L/QcHpNjeQuS62a6N94gR22bs13Jh
         w+rhddWKxmfWaXim1Yo9p9S2GakBVDdwNMxdry7HosBoCUGi55XelrSKtP+T5PHZs/Wx
         0tlkYWprPvYT9eWQw/jjm4/Gd2NMPUPA3qGVhx+8MlRVBzYUdajcA5L8Z/iUsvbKl+qq
         v0HQ==
X-Gm-Message-State: APjAAAVkRWpKjHgz0+S3iJaiDEZArjEmRovgWaqt/lVdQJknEUMChQOq
        NSwhVEXGP1nmPBdz9tfpot4FfCtg5BvQcSl18WU=
X-Google-Smtp-Source: APXvYqzyQdDPl1fsl7L721HZ+95792dbxpYken+YhWtFa4aS/VF1qH0wVuh/IRJbt/itAk4TKVrcPMKqgOTIGHSz344=
X-Received: by 2002:aca:4bd2:: with SMTP id y201mr24053769oia.102.1571039659665;
 Mon, 14 Oct 2019 00:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <OSBPR01MB21035AD5CA51E3CCFE6F61C6B8890@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <OSBPR01MB2103F7095937F52BD9D2FFDEB8900@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103F7095937F52BD9D2FFDEB8900@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Oct 2019 09:54:08 +0200
Message-ID: <CAMuHMdUUYFLtVXNY2p_OcbYAifxsk7+xJRzQgOh0WZVdaf2hQA@mail.gmail.com>
Subject: Re: Regarding CPU frequency reported by Salvator-X board
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Dien Pham <dien.pham.ry@rvc.renesas.com>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

CC clk

On Mon, Oct 14, 2019 at 9:46 AM Biju Das <biju.das@bp.renesas.com> wrote:
> I have further investigated this issue, please find my findings below
>
> The  "cpg_z_clk_round_rate" function is called 2 times from "dev_pm_opp_set_rate" (1 is direct call and other through "clk_set_rate") function.
>
> For 500000000 frequency, after doing math operation(mult = div_u64(rate * 32ULL, prate);), it gets a factor  10--> 10.66 truncated to 10 and the frequency returned by the system is  468748125
>
> On the second " cpg_z_clk_round_rate ", the below function make the value to worse, it gets a value of 9.9999, since it is integer division it is truncated to 9.
> mult = div_u64(rate * 32ULL, prate);
>
> Now the frequency 468748125, after doing math operation becomes 421874 KHz. This is the problem.
>
> So I think the div_64 is wrong here, Instead we could go with DIV64_U64_ROUND_CLOSEST.
>
> With "DIV64_U64_ROUND_CLOSEST" the factor is 10.66 which is rounded to 11.
>
> So for 500000, after math operation, it becomes 515624
>
> Please share your opinion this issue.

I don't know what's the best way to solve this.

Rounding instead of truncating may lead to programming a too high clock
frequency, which might damage the hardware.

Please note that the current code no longer uses div_u64(), but div64_ul()
instead, which should have no impact on your findings.

> > -----Original Message-----
> > From: Biju Das
> > Sent: Thursday, September 19, 2019 11:49 AM
> > To: Geert Uytterhoeven <geert+renesas@glider.be>; Simon Horman
> > <horms@verge.net.au>; linux-renesas-soc@vger.kernel.org; Dien Pham
> > <dien.pham.ry@rvc.renesas.com>; TAKESHI KIHARA
> > <takeshi.kihara.df@renesas.com>; Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se>
> > Subject: Regarding CPU frequency reported by Salvator-X board
> >
> > Hi All,
> >
> > I started testing  frequency mentioned in OPP table  with M3-W1.1 Salvator-X
> > board (NOT salvator-XS) using user space governor
> >
> > The actual frequency reported for 0.5GHz(500000 KHz) is too much deviated
> > from the target  frequency [INFO] Target frequency: 500000 KHz [INFO]
> > Actual frequency: 421874 KHz
> >
> > But if I change the extal value, as per the board schematic (16.6666MHz), the
> > value is some what closer to target frequency.
> >   &extal_clk {
> > -       clock-frequency = <16666666>;
> > +       clock-frequency = <16666600>;
> >  };
> > [INFO] Target frequency: 500000 KHz
> > [INFO] Actual frequency: 468748 KHz
> >
> > Q1) Have any one  seen this issue? Please share your thoughts on this issue.
> >
> > Note:-
> > I am not seeing this issue on Salvator-XS board, where the extal_clk value=
> > 16640000(16.64MHz).
> >
> > Please see the logs
> > with clock-frequency = <16666666>;
> > -----------------------------------------------
> > root@salvator-x:/cip-test-scripts# ./opp_t_001.sh  [INFO] Testing cpufreq for
> > policy:
> >  [INFO] /sys/devices/system/cpu/cpufreq/policy0
> >  [INFO]
> >  [INFO] CPUs affected:
> >  [INFO] 0 1
> >  [INFO]
> >  [INFO] Available frequencies:
> >  [INFO] 500000 1000000 1500000
> >  [INFO]
> >  [INFO] Target frequency: 500000 KHz
> >  [INFO] Actual frequency: 421874 KHz
> >  [INFO]
> >  [INFO] Target frequency: 1000000 KHz
> >  [INFO] Actual frequency: 937499 KHz
> >  [INFO]
> >  [INFO] Target frequency: 1500000 KHz
> >  [INFO] Actual frequency: 1499999 KHz
> >  [INFO]
> >  [INFO] Testing cpufreq for policy:
> >  [INFO] /sys/devices/system/cpu/cpufreq/policy2
> >  [INFO]
> >  [INFO] CPUs affected:
> >  [INFO] 2 3 4 5
> >  [INFO]
> >  [INFO] Available frequencies:
> >  [INFO] 800000 1000000 1200000
> >  [INFO]
> >  [INFO] Target frequency: 800000 KHz
> >  [INFO] Actual frequency: 749999 KHz
> >  [INFO]
> >  [INFO] Target frequency: 1000000 KHz
> >  [INFO] Actual frequency: 974999 KHz
> >  [INFO]
> >  [INFO] Target frequency: 1200000 KHz
> >  [INFO] Actual frequency: 1199999 KHz
> >
> > With clock-frequency = <16666600>
> > ----------------------------------------------
> > root@salvator-x:/cip-test-scripts# ./opp_t_001.sh  [INFO] Testing cpufreq for
> > policy:
> >  [INFO] /sys/devices/system/cpu/cpufreq/policy0
> >  [INFO]
> >  [INFO] CPUs affected:
> >  [INFO] 0 1
> >  [INFO]
> >  [INFO] Available frequencies:
> >  [INFO] 500000 1000000 1500000
> >  [INFO]
> >  [INFO] Target frequency: 500000 KHz
> >  [INFO] Actual frequency: 468748 KHz
> >  [INFO]
> >  [INFO] Target frequency: 1000000 KHz
> >  [INFO] Actual frequency: 937496 KHz
> >  [INFO]
> >  [INFO] Target frequency: 1500000 KHz
> >  [INFO] Actual frequency: 1499994 KHz
> >  [INFO]
> >  [INFO] Testing cpufreq for policy:
> >  [INFO] /sys/devices/system/cpu/cpufreq/policy2
> >  [INFO]
> >  [INFO] CPUs affected:
> >  [INFO] 2 3 4 5
> >  [INFO]
> >  [INFO] Available frequencies:
> >  [INFO] 800000 1000000 1200000
> >  [INFO]
> >  [INFO] Target frequency: 800000 KHz
> >  [INFO] Actual frequency: 787496 KHz
> >  [INFO]
> >  [INFO] Target frequency: 1000000 KHz
> >  [INFO] Actual frequency: 974996 KHz
> >  [INFO]
> >  [INFO] Target frequency: 1200000 KHz
> >  [INFO] Actual frequency: 1199995 KHz
> >
> > Regards,
> > Biju
> >
>


-- 
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
