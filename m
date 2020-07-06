Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFF7215AF2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 17:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729248AbgGFPlE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 11:41:04 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:39009 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729286AbgGFPlD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 11:41:03 -0400
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MFKCV-1k7ejf0KOP-00FiDF for <linux-renesas-soc@vger.kernel.org>; Mon, 06
 Jul 2020 17:41:02 +0200
Received: by mail-qk1-f173.google.com with SMTP id r22so35146625qke.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2020 08:41:01 -0700 (PDT)
X-Gm-Message-State: AOAM532leOzh9ydyZogPKTfM0ff4VacFBKKCzJ6uEf9TN2FFpGacjJST
        LMeN5gRP7yh79nBpO5rigeO9sx1e5uAFkdh8pf8=
X-Google-Smtp-Source: ABdhPJxCsXl873kkVsQETS51vJWxRf6lFC6mnbFed7P2nWaeykESYMNjwWXcb3xtGkaa0sfJbJP9Udl7HdDWbDkERBo=
X-Received: by 2002:a37:a496:: with SMTP id n144mr47439469qke.286.1594050060959;
 Mon, 06 Jul 2020 08:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200703120642.5128-1-geert+renesas@glider.be>
 <20200703120642.5128-2-geert+renesas@glider.be> <CAK8P3a0GTf-NBAixvgefyvx_nRpLgYZ6gZdp_VAUNTOV2=+t0g@mail.gmail.com>
 <CAMuHMdVHXztUyvEbj6ozp-zHf5Afg_hLmf4OU8v50sF2vBmPxg@mail.gmail.com>
In-Reply-To: <CAMuHMdVHXztUyvEbj6ozp-zHf5Afg_hLmf4OU8v50sF2vBmPxg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 6 Jul 2020 17:40:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3HSRjcnmpicvAKOxnrcuZe+OVrdsiqj=eVbPKbjEcYmg@mail.gmail.com>
Message-ID: <CAK8P3a3HSRjcnmpicvAKOxnrcuZe+OVrdsiqj=eVbPKbjEcYmg@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Renesas ARM defconfig updates for v5.9
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xcqi8mxKCXEFDtT9b4g1K+4efOkaIM2jTMsza4ufkevOBitQ6Dw
 LFAMfy7AUtoGiTiPH3ApQ0oZwvW9t2G0VdVg4LSZfquUhHXqNsb7HYu2uiLaVomq0OxPns9
 XlVNrjT8o9mK/SUt6S8kU+7DajuHrJzA5IrbP2NyZC7XT5ZdwyhWZB8gTv0Gddsv4gId2bK
 yxb6/IV3wrYhPma+OT0ZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ap70CYss7ds=:nFetZi0SS/l5HnD3GRaAOg
 V2jnrRqOing+CknCbPfV85rBH8NlSXQ5/KUhBe9ZWORn/wlfTmWC/bQpw0RWIT3s5YY3n2LOL
 KaWc/5msnD8hUXdySg3K81B99WuvDIF5xLZT8SQog4nOoD3bgBMb4NzZSQL/zJdPbqMWb9asl
 cVSv8nRoymbO4OVAZUmVCfKgCJYM7oKHuCdCwV1j6ZE5RgKjuaaoQNCBvjkNbEV9j6G1VV/J2
 XK19qT+NCCWezAb0C5wPlibi2yO6AlRorqurCNnYbx7cySIpE7CShe4RrLCTga7VpQ9+IhlOX
 PpETAjzuPH0nlXAjufiFI8mtnPCWDIPoIdFF3fVRcv8OsO+CV0UcGrxBMp4rLazX/mdVasaLG
 ibQ4BlHDpuPRghfO7+w1275bmJQ8K8DWCaL6INk8zbgGv74uE/jd7JeLpc6mgBDJVnr6HAu8f
 CdeXaSdMVLpujnQCN1kKb1DDXn04euhXTCp8d7QYT6oZPFlO22Y05+k1OfXveS9i8o/UMUGDe
 cxF6nrkA1B1BbJtDAmKTFrHWXAjmJucNSCCT1ZOBXePgRwlgLFzosLlejjJoqumMLbIjMo/oh
 X5SGSZoVDxQqEkB0JcpnM5ZnMbVJyo/fVmLbJ17SQ1PVvORbEi27NtwIYrXW8801SzOB6uwuV
 lV4GL83doeg7stSPeWgMnjHil8Jpphve93ed+JjnwyWq7mDVsz3+QVjhbyASGK9cLhCasGaOQ
 ev1Kp5wuJ8D96yw+qlc35ywKojRmt4CtQ43T3SImobkW0RsDhl/1Knhmk14oHLpo7VUcwbiF7
 h6uxiyPFSS03OTr1NyGtOy0hHDmnEdAd+EGemhUmX7l4pSZNXuB+h1Ny/YnFKG1y9caTpRCb3
 OoH3THUFbycElRKgr+mOK66y4rjsTxTDLwoleHbNblNOc7Uvw+5WPzvQaWrTYQF3GNx5hYF0m
 NAOWIuvaztaNNWcBKK3tlI0GDah8dUhBFOlzudj/yDFMzFI/jjGLy
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 6, 2020 at 4:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Jul 6, 2020 at 4:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Fri, Jul 3, 2020 at 2:07 PM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > ----------------------------------------------------------------
> > > Renesas ARM defconfig updates for v5.9
> > >
> > >   - Refresh shmobile_defconfig for v5.8-rc1
> > >   - Enable additional support for Renesas platforms to
> > >     shmobile_defconfig, multi_v7_defconfig, and the arm64 defconfig.
> >
> > As you write on one of the commits
> >
> >    "All of the above are modular, except for Ethernet support (HDMI Audio
> >     support is an optional feature of the modular ADV7511 driver)."
> >
> > I'm starting to see some demand for making more drivers loadable modules
> > that are traditionally built-in. Can you give a more specific reason why
> > this one (and I guess CONFIG_RAVB next to it) should not a loadable module?
>
> We tend to make Ethernet built-in, to ease testing using nfsroot.
> If that is no longer desirable, I guess we'll have to improve our initramfs
> skills ;-)

I'm not sure either. My feeling is that we should probably make all network
support loadable modules eventually, it seems wrong to single out yours
if your current workflow depends on the built-in driver today.

I'm pulling your branch for now, but I'll keep asking around what others
think, and we might change all drivers that can to be loadable
modules later on.

In particular, a number of chips that primarily run Android are now
changed so they can have even more fundamental drivers (pinctrl,
clk, ...) as loadable modules, and it seems like a good idea to
also support that in the defconfig.

       Arnd
